# Livssyklusen til SwiftUI-visninger

I forrige leksjon lærte vi at `@State`-variabler følger visningens livssyklus, og vi lærte også den grunnleggende bruken av `onAppear`。

I denne leksjonen skal vi forstå livssyklusen til SwiftUI-visninger enda bedre, lære hvordan visninger opprettes og vises, hvordan variabler i visninger opprettes og bygges opp på nytt, og samtidig lære om `onAppear`、`onDisappear` og konstruktøren `init`。

Basert på denne kunnskapen skal vi bygge en helhetlig forståelse av hvordan SwiftUI-visninger blir konstruert.

## Oppstartsrekkefølgen til appen

Når et iOS-prosjekt opprettes, genererer Xcode som standard to filer:

```
ContentView.swift
ProjectName + App.swift
```

Blant disse er `"ProjectName + App".swift` inngangsfilen for hele appen.

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

### Flyten i kodeutførelsen

Når vi kjører appen（i simulator eller på fysisk enhet）, vil systemet lete etter nøkkelordet `@main`：

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Når inngangsfilen er bekreftet, begynner koden å kjøre.

Først går systemet inn i `App`-strukturen, kjører koden i `body`，oppretter deretter `WindowGroup` og laster `ContentView` inni den.

### Hva `WindowGroup` gjør

`WindowGroup` brukes til å administrere vinduer:

```swift
WindowGroup {
    ContentView()
}
```

I iPadOS / macOS støttes flere vinduer, mens iPhone vanligvis bare har ett vindu.

Derfor brukes `WindowGroup` på iPhone hovedsakelig til å administrere det første skjermbildet som vises.

### Prosessen med å laste inn visningen

Når systemet finner `ContentView`：

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

vil SwiftUI kjøre koden i `body`，og deretter bygge grensesnittet ut fra strukturen til visningene som returneres（som `VStack`、`Text` osv.）, og vise det på skjermen.

Når disse trinnene er fullført, kan vi se `ContentView` i grensesnittet.

![ContentView](../../Resource/016_view1.png)

Det er viktig å merke seg at `body` brukes til å generere visninger, ikke til å lagre dem.

Det betyr at SwiftUI beregner `body` på nytt hver gang visningen oppdateres, og genererer en ny visningsstruktur.

### Logikken for forhåndsvisningsvisningen

Forhåndsvisning i Xcode（Canvas）og faktisk kjøring er to forskjellige mekanismer.

For eksempel, legg til en feilsøkingsutskrift i inngangsfilen:

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

Når vi forhåndsviser `ContentView` i Xcode, starter ikke kjøringen fra inngangen `@main`，så `onAppear` i inngangsfilen trigges ikke.

Men hvis vi kjører appen i simulator eller på fysisk enhet, starter systemet fra `@main`，kjører hele appen etter komplett flyt, utløser `onAppear` i inngangsfilen og skriver ut feilsøkingsinformasjonen.

Poenget er at Xcode-forhåndsvisning bare er “lokal rendring” og brukes til å vise den nåværende visningen；simulator og fysisk enhet gir et “fullstendig kjøremiljø” og kjører hele appen.

Derfor bør simulator eller fysisk enhet brukes som referanse når vi tester appfunksjoner, siden Xcode-forhåndsvisning ikke kan gi et komplett kjøremiljø.

## Visningens livssyklus

På dette stadiet er all koden vår konsentrert i `ContentView`。Men i en virkelig app vil det vanligvis finnes flere visninger som byttes i ulike situasjoner.

For eksempel, i “sparegrisen”：

![PiggyBank](../../Resource/016_view.png)

Når vi klikker på “Spar”, vises `SaveView`；når sparingen er fullført eller visningen lukkes, fjernes `SaveView`。

Denne prosessen er livssyklusen til en visning: fra opprettelse, til visning, og til slutt fjerning.

### Lukke appen

Når appen lukkes, fjernes alle visninger, og tilhørende tilstander forsvinner også.

Derfor vil `ContentView` og andre visninger bli fjernet fra minnet, og hele kjøretilstanden til appen tømmes.

## Livssyklusen til variabler i visningen

I SwiftUI er livssyklusen til variabler vanligvis bundet til visningen.

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

### `@State`-variabler

Variabler deklarert med `@State` er bundet til livssyklusen til visningen.

```swift
@State private var name = "FangJunyu"
```

Når visningen opprettes, opprettes også `name`；når visningen fjernes, blir også `name` ødelagt.

Dette er grunnen til at vi trenger vedvarende datalagring med ting som `UserDefaults`。

### Variabler inne i `body`

Variabler definert inne i `body`：

```swift
var num = 10
```

Deres livssyklus er bundet til gjennomføringen av `body`。

Når tilstanden i SwiftUI endres, for eksempel:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Når `name` endres, oppdager `@State` endringen og varsler SwiftUI om at visningen må beregnes på nytt, og `body` beregnes på nytt.

Når `body` beregnes på nytt, vil all koden i `body` bli utført igjen, og variablene inni `body`（som `num`）blir opprettet på nytt.

Dette er også grunnen til at vi ikke anbefales å definere kompliserte variabler inne i `body`。

For hver gang visningen oppdateres, blir variablene i `body` laget på nytt, noe som øker beregningskostnaden og påvirker ytelsen.

I SwiftUI bør ulike typer data administreres på ulike måter. Data som må følge visningens livssyklus kan lagres med `@State`；midlertidige beregninger kan plasseres inne i `body`。

## `onAppear` og `onDisappear`

I forrige leksjon lærte vi allerede `onAppear`，som kalles når en visning vises.

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

I Xcode-forhåndsvisning eller ved kjøring kan vi se feilsøkingsutskriften fra `onAppear`。

### `onDisappear`

Motstykket til `onAppear` er `onDisappear`：

```swift
.onDisappear {}
```

Når visningen lukkes, kalles `onDisappear`。

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

Når visningen fjernes, blir koden i `onDisappear` utført.

Tips: På dette stadiet er `ContentView` rotvisningen i appen, og kan ikke lukkes eller fjernes direkte. Derfor kan vi ikke direkte observere effekten av `onDisappear` enda.

Først når vi senere lærer om sidenavigasjon og åpning av nye visninger, kan vi se `onDisappear` bli kalt.

## Logikken bak opprettelse og visning

Det er viktig å merke seg at opprettelse av en visning og visning av en visning er to forskjellige stadier.

Når en visning opprettes, kalles konstruktøren til `struct`：

```swift
init() {}
```

Dette er fordi SwiftUI-visninger er `struct`-strukturer:

```swift
struct ContentView: View { ... }
```

Derfor vil konstruktøren `init` kjøres når en instans av visningen opprettes；først når visningen faktisk vises, vil `onAppear` bli kalt.

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

Når vi forhåndsviser visningen i Xcode, kan vi se feilsøkingsutskriften:

```swift
Create ContentView
Show ContentView
```

Dette viser at `init` først kjøres for å opprette visningen, deretter beregnes koden i `body`，og til slutt vises visningen og `onAppear` kjøres.

Derfor er det viktig å forstå at opprettelsesfasen og visningsfasen til en visning er separate.

### Konstruktøren `init`

`init` er grunnleggende Swift-syntaks. Både `struct` og `class` kan definere den, og den brukes til å initialisere objekter.

```swift
init() {}
```

I SwiftUI kalles `init` når en visning opprettes. Den kan brukes til å ta imot parametere og initialisere data.

Hvis vi ikke skriver `init` selv, vil Swift automatisk lage en standardkonstruktør for `struct`。

For SwiftUI-visninger som `ContentView` gjelder det at `init` kjøres når visningen opprettes, mens `onAppear` kjøres når visningen vises.

Derfor er `init` konstruktøren som kjøres når visningen opprettes, og den blir nyttig senere når vi skal sende inn parametere eller initialisere data.

## Oppsummering

I denne leksjonen lærte vi oppstartsrekkefølgen i appen, fra inngangsfilen til kjøringen av `ContentView`。

Vi lærte om livssyklusen til SwiftUI-visninger: når en visning opprettes, kjøres `init`；når den vises på skjermen, kjøres `onAppear`；når den fjernes eller lukkes, kjøres `onDisappear`。

Vi lærte også om oppdateringsmekanismen til visninger: visningen drives av tilstand. Når tilstander som `@State` endres, oppdaterer SwiftUI visningen, beregner `body` på nytt, og variablene inne i `body` blir også opprettet på nytt.

Livssyklusen til variabler er knyttet til livssyklusen til visningen, mens midlertidige variabler inne i `body` opprettes på nytt hver gang visningen oppdateres.

Å forstå disse livssyklusene og hvordan variabler oppfører seg, vil hjelpe oss med å organisere koden bedre og gjøre appens logikk tydeligere.
