# SwiftUI-visningens livscyklus

I den forrige lektion lærte vi, at `@State`-variabler følger visningens livscyklus, og vi lærte også den grundlæggende brug af `onAppear`.

I denne lektion vil vi forstå livscyklussen i SwiftUI-visninger endnu bedre. Vi ser på, hvordan visninger oprettes og vises, hvordan variablerne i visningen oprettes og genskabes, og vi lærer også om `onAppear`, `onDisappear` og konstruktøren `init`.

Ud fra denne viden opbygger vi en samlet forståelse af hele opbygningsprocessen for en SwiftUI-visning.

## Appens opstartssekvens

Når man opretter et iOS-projekt, genererer Xcode som standard to filer:

```
ContentView.swift
Projektnavn + App.swift
```

Blandt disse er `"Projektnavn + App".swift` hele appens indgangsfil.

For eksempel:

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
```

### Kodeudførelsesflow

Når vi kører appen i simulatoren eller på en fysisk enhed, vil systemet først lede efter nøgleordet `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Når indgangsfilen er bekræftet, begynder koden at køre.

Først går systemet ind i `App`-strukturen, udfører koden i `body`, opretter derefter `WindowGroup` og indlæser `ContentView` i den.

### WindowGroups rolle

`WindowGroup` bruges til at styre vinduer:

```swift
WindowGroup {
    ContentView()
}
```

På iPad og macOS understøttes flere vinduer, mens iPhone normalt kun har ét vindue.

Derfor styrer `WindowGroup` på iPhone hovedsageligt den første skærm, der vises.

### Visningens indlæsningsproces

Når systemet finder `ContentView`:

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

vil SwiftUI udføre koden i `body`, og derefter bygge interfacet ud fra den returnerede visningsstruktur, som for eksempel `VStack` og `Text`, og vise det på skærmen.

Når disse trin er gennemført, kan vi se `ContentView` i visningen.

![ContentView](../../Resource/016_view1.png)

Det er vigtigt at bemærke, at `body` bruges til at generere visningen og ikke til at gemme den.

Det betyder, at SwiftUI genberegner `body` og genererer en ny visningsstruktur hver gang visningen opdateres.

### Logikken i Preview-visningen

Xcodes Preview (`Canvas`) og den faktiske kørsel er to forskellige mekanismer.

For eksempel, hvis vi tilføjer et debug-output i indgangsfilen:

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

Når man forhåndsviser `ContentView` i Xcode, starter det ikke fra `@main`, og derfor udløses `onAppear` i indgangsfilen ikke.

Men hvis appen køres i simulatoren eller på en fysisk enhed, vil systemet starte ved `@main`, følge hele appens komplette køreflow og udløse `onAppear` i indgangsfilen samt vise debug-informationen.

Nøglen er, at Xcodes Preview kun er en "lokal rendering", der kun bruges til at vise den aktuelle visning, mens simulatoren og fysiske enheder giver et "komplet køremiljø", hvor hele appen udføres.

Derfor bør simulators eller fysiske enheder være standarden, når man tester appfunktioner, fordi Xcode Preview ikke giver et fuldstændigt køremiljø.

## Visningens livscyklus

På nuværende tidspunkt er al vores kode samlet i `ContentView`. Men i en rigtig app vil der normalt være flere visninger, som skiftes mellem i forskellige scenarier.

For eksempel i "sparegrisen":

![PiggyBank](../../Resource/016_view.png)

Når man klikker på "Gem penge", vises visningen `SaveView`. Når gemningen er færdig, eller visningen lukkes, fjernes `SaveView`.

Denne proces er netop en visnings livscyklus: fra at visningen oprettes, vises og til sidst fjernes.

### Luk appen

Når appen lukkes, fjernes alle visninger, og de tilhørende tilstande forsvinder også.

Derfor fjernes både `ContentView` og andre visninger fra hukommelsen, og hele appens køretilstand ryddes.

## Variablers livscyklus i en visning

I SwiftUI er variablers livscyklus normalt bundet til visningen.

For eksempel:

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

Variabler deklareret med `@State` er bundet til visningens livscyklus.

```swift
@State private var name = "FangJunyu"
```

Når visningen oprettes, oprettes `name` også. Når visningen fjernes, bliver `name` også destrueret.

Det er netop derfor, vi har brug for metoder som `UserDefaults` til persistent lagring af data.

### Variabler inde i body

Variabler defineret inde i `body`:

```swift
var num = 10
```

har en livscyklus, der er bundet til udførelsen af `body`.

Når tilstanden i SwiftUI ændrer sig, for eksempel:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Når `name` ændrer sig, registrerer `@State`, at dataene er ændret, og underretter SwiftUI om at genberegne visningen, så `body` beregnes på ny.

Når `body` genberegnes, bliver al kode inde i `body` udført igen, og variabler inde i `body`, som `num`, bliver oprettet på ny.

Det er også grunden til, at det ikke anbefales at definere komplekse variabler inde i `body`.

For hver gang visningen opdateres, bliver variablerne i `body` oprettet igen, hvilket øger beregningsomkostningen og påvirker ydeevnen.

I SwiftUI bør forskellige typer data håndteres forskelligt: data, som skal følge visningens livscyklus, kan gemmes med `@State`, mens midlertidige beregningsdata kan placeres i `body`.

## onAppear og onDisappear

I den forrige lektion lærte vi allerede `onAppear`, som kaldes, når en visning vises.

```swift
.onAppear {}
```

For eksempel:

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

I Xcode Preview eller under kørsel kan man se debug-outputtet i `onAppear`.

### onDisappear

Det, der svarer til `onAppear`, er `onDisappear`:

```swift
.onDisappear {}
```

Når visningen lukkes, kaldes `onDisappear`.

For eksempel:

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

Når visningen fjernes, udføres koden inde i `onDisappear`.

Tip: På nuværende tidspunkt er `ContentView` appens rodvisning og kan ikke lukkes eller fjernes direkte. Derfor kan vi endnu ikke observere effekten af `onDisappear` i denne fase.

Det er først senere, når vi lærer side-navigation og åbning af nye visninger, at vi kan se `onDisappear` blive kaldt.

## Logikken bag oprettelse og visning

Det er vigtigt at bemærke, at oprettelsen af en visning og visningen af den er to forskellige faser.

Når visningen oprettes, kaldes strukturens konstruktør:

```swift
init() {}
```

Fordi SwiftUI-visninger er `struct`-strukturer:

```swift
struct ContentView: View { ... }
```

Så når en instans af visningen oprettes, udføres konstruktøren `init`. Først når visningen faktisk vises, kaldes `onAppear`.

For eksempel:

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

Når man forhåndsviser visningen i Xcode, kan man se følgende debug-output:

```swift
Create ContentView
Show ContentView
```

Det viser, at `init` først udføres for at oprette visningen, derefter beregnes koden i `body`, og til sidst vises visningen, hvorefter `onAppear` udføres.

Derfor er det nødvendigt at forstå, at faserne for oprettelse og visning af en visning er adskilte.

### init-konstruktøren

`init` er grundlæggende Swift-syntaks. Både `struct` og `class` kan definere den, og den bruges til at initialisere objekter.

```swift
init() {}
```

I SwiftUI vil systemet kalde visningens `init`, når visningen oprettes, og den kan bruges til at modtage parametre eller initialisere data.

Hvis vi ikke selv skriver en `init`, vil Swift automatisk generere en standardkonstruktør for en `struct`.

For SwiftUI-visninger som `ContentView` gælder det, at `init` udføres, når visningen oprettes, og `onAppear` udføres, når visningen vises.

Derfor er `init` den konstruktør, som udføres, når visningen oprettes, og den bliver nyttig senere, når vi skal sende parametre eller initialisere data.

## Opsummering

I denne lektion lærte vi appens opstartssekvens, fra indgangsfilen til udførelsesforløbet i `ContentView`.

Vi lærte om SwiftUI-visningers livscyklus: når visningen oprettes, udføres `init`; når den vises på skærmen, udføres `onAppear`; og når den fjernes eller lukkes, udføres `onDisappear`.

Vi lærte også om visningsopdateringsmekanismen: visninger drives af tilstand. Når en tilstand som `@State` ændrer sig, opdaterer SwiftUI visningen, genberegner `body`, og variablerne i `body` oprettes igen.

Variablers livscyklus er bundet til visningens livscyklus, mens midlertidige variabler i `body` bliver oprettet igen ved hver opdatering.

Når vi forstår disse livscyklusser og variablers opførsel, bliver det lettere at organisere koden bedre og gøre appens logik mere tydelig.
