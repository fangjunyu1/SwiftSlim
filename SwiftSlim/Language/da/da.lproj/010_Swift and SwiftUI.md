# Swift og SwiftUI

Når man lærer udvikling til Apple-platforme, adskiller mange vejledninger Swift og SwiftUI i hver sin forklaring. Det kan let give begyndere en oplevelse af, at de er to helt separate teknologier.

I virkeligheden er Swift og SwiftUI tæt integreret: Swift er programmeringssproget, som leverer logik og data, mens SwiftUI er et brugerfladeframework bygget oven på Swift og ansvarligt for rendering af views og interaktion.

Denne lektion hjælper dig med at opbygge en klar forståelsesramme: hvad Swift er, hvad SwiftUI er, og hvordan de samarbejder i kode.

## Hvad er Swift?

Swift er et moderne programmeringssprog lanceret af Apple, og det bruges til at udvikle apps til platforme som iOS, macOS, watchOS og tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift er et stærkt typet og statisk sprog, som lægger vægt på sikkerhed i designet og reducerer mange almindelige programmeringsfejl, som for eksempel nulpointere og indeksfejl. Det understøtter også problemfri integration med C og Objective-C.

I reel udvikling er Swift fortrinsvis ansvarligt for appens logik, som for eksempel databehandling, netværksforespørgsler og lagringsoperationer.

## Hvad er SwiftUI?

SwiftUI er et nyt framework til opbygning af brugerflader, som Apple lancerede i 2019. SwiftUI bruger en deklarativ programmeringsmodel og gør det muligt for udviklere at beskrive interface-struktur og interaktioner med mere enkel kode.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklarativ programmering betyder, at udvikleren kun behøver fortælle systemet, hvad der skal vises, og systemet vil automatisk opdatere visningen ud fra ændringer i data. Man behøver ikke længere manuelt at opdatere brugerfladens tilstand, og det forenkler UI-udvikling markant.

Kernen i SwiftUI er view-komponenter som `Text`, `Image` og `Button` samt layoutcontainere som `VStack`, `HStack` og `ZStack`. Disse komponenter interagerer gennem databinding og state management, så interfacet kan reagere på dataændringer og automatisk blive opdateret.

## Hvordan samarbejder Swift og SwiftUI?

Ansvarsfordelingen mellem Swift og SwiftUI kan opsummeres således:

**1. Swift: håndterer logik og data**

Swift bruges primært til at styre data, gemme tilstand og udføre logik. Denne kode påvirker normalt ikke direkte renderingen af brugerfladen, men er ansvarlig for behandling af data og adfærd.

For eksempel databehandling i Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Denne type kode omfatter variabeldeklarationer, konstantdefinitioner, funktioner og kontrolflow og påvirker ikke direkte, hvordan visningen bliver vist.

**2. SwiftUI: deklarerer og renderer brugerfladen**

SwiftUI bruges derimod til at bygge brugerfladens layout og indhold og er hovedsageligt ansvarligt for rendering og interaktion.

For eksempel kan vi bruge SwiftUI til at oprette en tekstvisning:

```swift
Text("SwiftSlim")
```

Denne slags kode bruges til at opbygge og styre interfaceelementer og interagerer direkte med brugerfladen.

### Grundlæggende eksempel

Nedenfor er et enkelt SwiftUI-eksempel:

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

I dette eksempel:

**SwiftUI-kode**: `VStack`, `Image`, `Text` og `padding` hører alle til SwiftUI og er ansvarlige for visning og layout af brugerfladen.

**Swift-kode**: Kommentarerne `//` øverst i filen og `import SwiftUI` tilhører Swift-kodestrukturen. Nederst er `#Preview` en makro, der bruges til Xcode-forhåndsvisning og ikke deltager i den egentlige rendering af interfacet.

### Mere avanceret eksempel

I virkelige projekter bruges Swift og SwiftUI ofte sammen for at udføre de opgaver, de hver især er bedst til:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

I dette eksempel:

**SwiftUI-kode**: `@State` er en SwiftUI-specifik property wrapper, der bruges til at erklære en visnings foranderlige tilstand. `Button` og `Text` er SwiftUI-viewkomponenter og står for visning og interaktion i interfacet.

**Swift-kode**: `private var name` og `func printName()` er Swift-kode, der bruges til at gemme data og udføre logik og ikke direkte til at rendere visningen.

Når brugeren trykker på knappen, udløser SwiftUI handlingskoden i knappen:

```swift
Button("Print") {
    printName()
}
```

Her er `Button` en SwiftUI-komponent, mens funktionen `printName()` er Swift-kode og ansvarlig for den konkrete logik.

Dette samarbejde gør, at Swift og SwiftUI kan fungere problemfrit sammen: Swift tager sig af data og logik, og SwiftUI tager sig af visning af brugerfladen.

## Hvor skrives Swift- og SwiftUI-kode normalt?

I SwiftUI bygges brugerfladen gennem de views, som returneres af egenskaben `body`. Derfor skrives al kode, der beskriver brugerfladen, normalt i `body`.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

I dette eksempel er `Text` en SwiftUI-viewkomponent, og derfor skal den stå i `body`, fordi SwiftUI læser `body` og derfra genererer interfacet.

Kode, der ikke er direkte relateret til brugerfladen, som for eksempel variabler, funktioner eller databehandlingslogik, skrives normalt uden for `body`. For eksempel:

```swift
struct ContentView: View {

    // Swift: data eller logik
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: brugerflade
    var body: some View {
        Text(name)
    }
}
```

Det er vigtigt at bemærke, at man stadig kan bruge Swift-syntaks i `body`, for eksempel `if`, `for` og andre kontrolstrukturer. De bruges blot til at styre genereringen af SwiftUI-visninger:

```
if isLogin {
    Text("Welcome")
}
```

Derfor kan man i SwiftUI-udvikling groft sagt forstå det sådan: view-kode som `Text`, `Image` og `Button` skrives normalt i `body`, mens data- og logikkode som variabler og funktioner normalt skrives uden for `body`.

## Swift-filer

Efterhånden som vi lærer mere, vil vi også møde MVVM-arkitekturen, hvor `ViewModel`- og `Model`-lagene normalt består af ren Swift-kode og er helt adskilt fra visningslaget (`SwiftUI`).

For eksempel en klasse til håndtering af apptilstand:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Eller en struktur, der beskriver en datastruktur:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Denne type filer har som opgave at styre og vedligeholde data og vises ikke direkte i interfacet, så de hører fuldt ud til Swift.

## Historisk baggrund

Hvis man vil forstå forholdet mellem Swift og SwiftUI, er det også nødvendigt at kende udviklingen i Apples udviklingsteknologier. Frem til 2026 har denne teknologistak gennemgået flere iterationer.

### Swifts historie

Før Swift dukkede op, var Objective-C det primære programmeringssprog på Apple-platforme, og det understøttede blandet programmering med C. Dets syntaks er ret lang og har en høj tærskel for begyndere:

```Obj-c
// Objective-C-skrivemåde
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

I 2014 lancerede Apple Swift på WWDC. Swift havde en mere moderne syntaks, højere typesikkerhed og overtog gradvist rollen som det dominerende udviklingssprog:

```swift
// Swift-skrivemåde
let name = "Fang"
print("Hello, \(name)")
```

Men Objective-C er ikke helt forsvundet. Det bruges stadig bredt i mange eksisterende projekter og i underliggende frameworks. At kende den grundlæggende syntaks er derfor stadig værdifuldt, både når man vedligeholder ældre projekter og forsøger at forstå systemets indre lag.

### SwiftUI's historie

Før SwiftUI blev lanceret, brugte iOS **UIKit**, og macOS brugte **AppKit**. Disse frameworks brugte en imperativ programmeringsstil. Udvikleren måtte enten trække kontroller ind med Storyboard eller manuelt skrive kode til at styre visningernes tilstand. Det gav stor kodemængde og høj vedligeholdelsesomkostning, især når interface-logikken blev kompleks.

![storyboard](../../RESOURCE/010_xcode.png)

I 2019 lancerede Apple officielt SwiftUI på WWDC. SwiftUI introducerede den deklarative programmeringsmodel og forenklede UI-udviklingsprocessen markant.

![storyboard](../../RESOURCE/010_xcode1.png)

Det er vigtigt at bemærke, at SwiftUI ikke er en helt selvstændig lavniveauimplementering. På de forskellige platforme fungerer det i praksis som et lag, der bygger bro til UIKit på iOS eller AppKit på macOS, og det er stadig disse frameworks, der kører under overfladen.

### Forholdet mellem Swift og UIKit/AppKit

Selvom Swift er et generelt programmeringssprog, der kan køre på Apples platforme, kan det ikke fuldstændigt erstatte UIKit eller AppKit. Ved nogle mere komplekse interfacebehov, eller i funktioner som SwiftUI endnu ikke dækker fuldt ud, er det stadig nødvendigt at bruge UIKit eller AppKit.

For eksempel er UIKit allerede meget modent til kompleks håndtering af view controllers, animationer og gesture recognition og bygger på lang produktionspraksis. SwiftUI bliver hele tiden stærkere på disse områder, men har stadig begrænsninger i nogle ydertilfælde.

Derfor vælger mange udviklere at kombinere SwiftUI og UIKit eller AppKit i samme projekt for at udnytte styrkerne i begge.

Set fra denne vinkel kan man forstå SwiftUI som en mere avanceret indpakning oven på UIKit eller AppKit. Når man lærer SwiftUI, er det også nyttigt at kende de grundlæggende begreber i UIKit og AppKit, så man lettere kan træffe rimelige tekniske valg, når man vedligeholder gamle projekter eller implementerer mere komplekse funktioner.

## Opsummering

**Swift**: bruges hovedsageligt til at skrive logik, databehandling og kontrolflow og er ikke direkte relateret til view-layout.

**SwiftUI**: bruges til deklarativt at bygge brugerflader, og kode for view-indhold og layout hører til SwiftUI.

I reel udvikling bruges Swift og SwiftUI normalt sammen, hvor Swift håndterer logikken, og SwiftUI håndterer brugerfladen.

Fra Objective-C og UIKit til Swift og SwiftUI har Apples udviklingsmiljø gradvist bevæget sig mod en mere moderne og enkel programmeringsstil, men UIKit og AppKit kan stadig ikke ignoreres i mange traditionelle projekter.

Ved at forstå forholdet mellem Swift og SwiftUI kan vi udvikle iOS- og macOS-apps mere effektivt og også træffe mere rimelige tekniske valg, når vi vedligeholder ældre projekter.
