# SwiftUI-vyers livscykel

I föregående lektion lärde vi oss att `@State`-variabler följer vyns livscykel, och vi lärde oss också den grundläggande användningen av `onAppear`.

I den här lektionen ska vi fördjupa vår förståelse av SwiftUI-vyers livscykel, förstå hur vyer skapas och visas, hur variabler i vyer skapas och återskapas, och även lära oss `onAppear`, `onDisappear` samt konstruktorn `init`.

Med denna kunskap kommer vi att bygga upp en helhetsförståelse för hela processen där SwiftUI-vyer konstrueras.

## Appens startordning

När man skapar ett iOS-projekt genererar Xcode som standard två filer:

```

ContentView.swift
ProjectName + App.swift

````

Bland dessa är `"ProjectName + App".swift` hela appens startfil.

Till exempel:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
````

### Kodens körflöde

När vi kör appen (i simulator eller på fysisk enhet) letar systemet efter nyckelordet `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Efter att startfilen har bekräftats börjar koden köras.

Först går körningen in i app-strukturen och kör koden i `body`, därefter skapas `WindowGroup` och `ContentView` laddas inuti den.

### Vad WindowGroup gör

`WindowGroup` används för att hantera fönster:

```swift
WindowGroup {
    ContentView()
}
```

På iPad och macOS stöds flera fönster, medan iPhone vanligtvis bara har ett enda fönster.

Därför används `WindowGroup` på iPhone främst för att hantera den första vyn som visas.

### Processen när en vy laddas

När systemet har hittat `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

kommer SwiftUI att köra koden i `body`, och sedan bygga gränssnittet utifrån den vystruktur som returneras (som `VStack`, `Text` och så vidare), och visa det på skärmen.

När dessa steg är klara kan vi se `ContentView` i vyn.

![ContentView](../../Resource/016_view1.png)

Det är viktigt att notera att `body` används för att generera vyer, inte för att lagra vyer.

Det betyder att varje gång vyn uppdateras kommer SwiftUI att beräkna `body` på nytt och generera en ny vystruktur.

### Förhandsgranskningslogik för vyer

Xcodes förhandsvisning (`Canvas`) och verklig körning är två olika mekanismer.

Till exempel kan vi lägga till en felsökningsutskrift i startfilen:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Om vi förhandsgranskar `ContentView` i Xcode börjar körningen inte från `@main`, därför utlöses inte `onAppear` i startfilen.

Men om vi kör i simulatorn eller på en fysisk enhet börjar systemet köra från `@main`, följer hela appens kompletta flöde, utlöser `onAppear` i startfilen och skriver ut felsökningsinformationen.

Det centrala är att Xcodes förhandsvisning bara är en “lokal rendering” som endast används för att visa den aktuella vyn, medan simulator och fysisk enhet erbjuder en “fullständig körmiljö” där hela appen körs.

Därför bör simulator eller fysisk enhet vara utgångspunkt när man testar appfunktioner; Xcodes förhandsvisning kan inte ge en fullständig körmiljö.

## Vyns livscykel

I det här skedet ligger all vår kod i `ContentView`. Men i verkliga appar innehåller en app vanligtvis flera vyer som växlas mellan i olika situationer.

Till exempel i “spargrisen”:

![PiggyBank](../../Resource/016_view.png)

När man trycker på “Spara pengar” visas `SaveView`; när sparandet är klart eller vyn stängs tas `SaveView` bort.

Denna process är just en vys livscykel: från att vyn skapas, visas, och till sist tas bort.

### Stänga appen

När appen stängs tas alla vyer bort, och relaterade tillstånd försvinner också.

Därför tas `ContentView` och andra vyer bort från minnet, och hela appens körstatus rensas.

## Livscykeln för variabler i en vy

I SwiftUI är en variabels livscykel vanligtvis bunden till vyn.

Till exempel:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State-variabler

Variabler som deklareras med `@State` är bundna till vyns livscykel.

```swift
@State private var name = "FangJunyu"
```

När vyn skapas skapas även `name`; när vyn tas bort förstörs också `name`.

Detta är anledningen till att vi behöver använda metoder som `UserDefaults` för datapersistens.

### Variabler inne i body

Variabler som definieras i `body`:

```swift
var num = 10
```

har en livscykel som är bunden till själva körningen av `body`.

När SwiftUI:s tillstånd förändras, till exempel:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

När `name` ändras upptäcker `@State` att datan har förändrats och meddelar SwiftUI att vyn ska beräknas på nytt, så att `body` beräknas igen.

När `body` beräknas på nytt körs all kod i `body` om, och variabler i `body` (som `num`) skapas på nytt.

Det är också därför man inte rekommenderar att definiera komplexa variabler i `body`.

Varje gång vyn uppdateras skapas nämligen variablerna i `body` på nytt, vilket ökar beräkningskostnaden och påverkar prestandan.

I SwiftUI bör olika typer av data hanteras på olika sätt: data som behöver följa vyns livscykel kan sparas med `@State`, medan tillfälligt beräknad data kan ligga i `body`.

## onAppear och onDisappear

I föregående lektion lärde vi oss redan `onAppear`, som anropas när en vy visas.

```swift
.onAppear {}
```

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

I Xcodes förhandsvisning eller vid körning kan vi se felsökningsutskriften i `onAppear`.

### onDisappear

Motsvarigheten till `onAppear` är `onDisappear`:

```swift
.onDisappear {}
```

När en vy stängs anropas `onDisappear`.

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

När vyn tas bort körs koden i `onDisappear`.

Tips: `ContentView` som vi använder i detta skede är appens rotvy och kan inte stängas eller tas bort direkt. Därför går det i detta skede inte att observera effekten av `onDisappear`.

Först senare, när vi lär oss sidnavigering och att öppna nya vyer, kan vi se att `onDisappear` anropas.

## Logiken för skapande och visning

Det är viktigt att notera att skapandet av en vy och visningen av den är två olika steg.

När en vy skapas anropas strukturens konstruktor:

```swift
init() {}
```

Eftersom SwiftUI-vyer är `struct`-strukturer:

```swift
struct ContentView: View { ... }
```

kommer `init`-konstruktorn att köras när vyinstansen skapas. Först när vyn visas anropas `onAppear`.

Till exempel:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

När vi förhandsgranskar vyn i Xcode kan vi se följande felsökningsutskrift:

```swift
Create ContentView
Show ContentView
```

Det visar att `init` först körs för att skapa vyn, därefter beräknas koden i `body`, och till sist visas vyn och `onAppear` körs.

Därför måste man förstå att skapandet och visningen av en vy är separata steg.

### init-konstruktorn

`init` är grundläggande Swift-syntax. Både `struct` och `class` kan definiera den, och den används för att initiera objekt.

```swift
init() {}
```

I SwiftUI anropar systemet vyns `init`-metod när vyn skapas, och den kan användas för att ta emot parametrar och initiera data.

Om man inte själv skriver en `init` kommer Swift automatiskt att generera en standardkonstruktor för `struct`.

För SwiftUI-vyer som `ContentView` gäller alltså: när vyn skapas körs `init`, och när vyn visas körs `onAppear`.

Därför är `init` den konstruktor som körs när vyn skapas, och den kommer att användas senare när vi skickar parametrar eller initierar data.

## Sammanfattning

I den här lektionen lärde vi oss appens startordning, från startfilen till exekveringsflödet i `ContentView`.

Vi förstod SwiftUI-vyers livscykel: när en vy skapas körs `init`, när den visas på skärmen körs `onAppear`, och när vyn tas bort eller stängs körs `onDisappear`.

Vi lärde oss också om vyns uppdateringsmekanism: vyn drivs av tillstånd, och när tillstånd som `@State` förändras uppdaterar SwiftUI vyn, beräknar `body` på nytt, och variablerna i `body` skapas också på nytt.

Variablernas livscykel är bunden till vyns livscykel, medan tillfälliga variabler i `body` skapas på nytt vid varje uppdatering.

Att förstå dessa livscykler och hur variabler beter sig hjälper oss att organisera koden bättre och göra appens logik tydligare.