# Swift og SwiftUI

Når man lærer Apple-plattformutvikling, har mange veiledninger en tendens til å forklare Swift og SwiftUI separat. Dette gjør det lett for nybegynnere å få en oppsplittet forståelse og tro at de er to helt uavhengige teknologier.

I virkeligheten er Swift og SwiftUI tett integrert som en helhet: Swift er programmeringsspråket og står for logikk og data；SwiftUI er et brukergrensesnittrammeverk bygd på Swift og står for rendring og interaksjon i visninger.

Denne leksjonen skal hjelpe deg med å bygge et klart mentalt rammeverk: hva Swift er, hva SwiftUI er, og hvordan de samarbeider i kode.

## Hva er Swift?

Swift er et moderne programmeringsspråk lansert av Apple, og brukes til å utvikle apper for plattformer som iOS, macOS, watchOS og tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift er et sterkt typet, statisk språk. Det er designet med større fokus på sikkerhet og reduserer mange vanlige programmeringsfeil（som nullpekere og grenser som overskrides）, samtidig som det støtter sømløs integrasjon med C og Objective-C.

I faktisk utvikling brukes Swift i større grad til logikken i appen, for eksempel databehandling, nettverksforespørsler og lagringsoperasjoner.

## Hva er SwiftUI?

SwiftUI er et nytt rammeverk for bygging av brukergrensesnitt som Apple lanserte i 2019. SwiftUI bruker en deklarativ programmeringsmodell, som lar utviklere beskrive grensesnittstruktur og interaksjon med enklere kode.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklarativ programmering betyr at utvikleren bare trenger å fortelle systemet hva som skal vises, og systemet vil automatisk oppdatere visningen når dataene endres. Vi trenger altså ikke lenger å oppdatere grensesnittet manuelt, noe som i stor grad forenkler kompleksiteten i UI-utvikling.

Kjernen i SwiftUI er visningskomponenter（som `Text`、`Image`、`Button` osv.）og layoutbeholdere（som `VStack`、`HStack`、`ZStack`）。Disse komponentene samhandler gjennom databinding og tilstandshåndtering, slik at grensesnittet kan reagere på dataendringer og oppdatere seg automatisk.

## Hvordan samarbeider Swift og SwiftUI?

Ansvarsfordelingen mellom Swift og SwiftUI kan oppsummeres slik:

**1. Swift: håndterer logikk og data**

Swift brukes hovedsakelig til å administrere data, lagre tilstand og utføre logikk. Denne typen kode påvirker vanligvis ikke direkte rendringen av grensesnittet, men står i stedet for håndtering av data og atferd.

For eksempel databehandling i Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Denne typen kode omfatter variabeldeklarasjoner, konstantdefinisjoner, funksjoner, kontrollflyt og lignende, og påvirker ikke direkte hvordan visningen ser ut.

**2. SwiftUI: deklarerer og rendrer grensesnittet**

SwiftUI brukes derimot til å bygge oppsett og innhold i brukergrensesnittet, og er hovedsakelig ansvarlig for rendring og interaksjon.

For eksempel, opprett en tekstvisning med SwiftUI:

```swift
Text("SwiftSlim")
```

Dette er kode som brukes til å bygge og styre grensesnittelementer, og som samhandler direkte med brukergrensesnittet.

### Grunnleggende eksempel

Her er et enkelt SwiftUI-eksempel:

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

I dette eksemplet:

**SwiftUI-kode**：`VStack`、`Image`、`Text` og `padding` tilhører SwiftUI og står for visning og layout av grensesnittet.

**Swift-kode**：`//`-kommentarene øverst i filen og `import SwiftUI` tilhører Swift-kodestrukturen；`#Preview` nederst er en makro for forhåndsvisning i Xcode og deltar ikke i selve rendringen av grensesnittet.

### Videregående eksempel

I faktiske prosjekter brukes Swift og SwiftUI ofte sammen for å gjøre det de er best på:

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

I dette eksemplet:

**SwiftUI-kode**：`@State` er en egenskapsinnpakning som er spesifikk for SwiftUI og brukes til å deklarere en foranderlig tilstand i visningen；`Button` og `Text` er SwiftUI-komponenter som står for grensesnitt og brukerinteraksjon.

**Swift-kode**：`private var name` og `func printName()` er Swift-kode som brukes til å lagre data og utføre logikk, og påvirker ikke direkte rendringen av visningen.

Når brukeren klikker på knappen, vil SwiftUI utløse operasjonskoden i knappen:

```swift
Button("Print") {
    printName()
}
```

Her er `Button` en SwiftUI-komponent, mens funksjonen `printName()` som kjøres, er Swift-kode og håndterer den konkrete logikken.

Dette samarbeidet gjør at Swift og SwiftUI kan integreres sømløst: Swift håndterer data og logikk, mens SwiftUI håndterer visningen av brukergrensesnittet.

## Hvor skriver man vanligvis Swift- og SwiftUI-kode?

I SwiftUI bygges grensesnittet gjennom visningen som returneres av egenskapen `body`。Derfor skrives all kode som beskriver grensesnittet vanligvis i `body`。

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

I dette eksemplet er `Text` en SwiftUI-visningskomponent, og må derfor skrives i `body`，fordi SwiftUI leser `body` for å generere grensesnittet.

Kode som ikke er direkte knyttet til grensesnittet, som variabler, funksjoner eller databehandlingslogikk, skrives vanligvis utenfor `body`。For eksempel:

```swift
struct ContentView: View {

    // Swift: data eller logikk
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: grensesnitt
    var body: some View {
        Text(name)
    }
}
```

Det er viktig å merke seg at vi fortsatt kan bruke Swift-syntaks i `body`，som `if` og `for`。De brukes bare til å styre genereringen av SwiftUI-visninger:

```
if isLogin {
    Text("Welcome")
}
```

Derfor kan vi i SwiftUI-utvikling enkelt forstå det slik: visningskode（`Text`、`Image`、`Button` osv.）skrives vanligvis i `body`；data- og logikkode（variabler, funksjoner osv.）skrives vanligvis utenfor `body`。

## Swift-filer

Etter hvert som vi lærer mer, vil vi også møte MVVM-arkitekturen, der ViewModel- og Model-lagene vanligvis består av ren Swift-kode og er helt skilt fra visningslaget（SwiftUI）。

For eksempel en klasse som administrerer appens tilstand:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Eller en struktur som beskriver en datastruktur:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Denne typen filer har som ansvar å administrere og lagre data, og vises ikke direkte i grensesnittet. Derfor hører de helt og holdent til Swift.

## Historisk bakgrunn

For å forstå forholdet mellom Swift og SwiftUI trenger vi også å kjenne til utviklingshistorien til Apples teknologier. Fram til 2026 har denne teknologistakken gått gjennom flere iterasjoner.

### Historien til Swift

Før Swift dukket opp, var Objective-C det viktigste programmeringsspråket på Apple-plattformer, og det støttet blanding med C. Syntaksen var ganske lang og terskelen høyere for nybegynnere:

```Obj-c
// Slik ser Objective-C ut
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

I 2014 lanserte Apple Swift på WWDC. Swift har en mer moderne syntaks og høyere typesikkerhet, og erstattet gradvis Objective-C som hovedspråket i utvikling:

```swift
// Slik ser Swift ut
let name = "Fang"
print("Hello, \(name)")
```

Objective-C forsvant likevel ikke fra historien. Det brukes fortsatt mye i mange eksisterende prosjekter og underliggende rammeverk. Å forstå dets grunnleggende syntaks har derfor fortsatt verdi når man vedlikeholder eldre prosjekter og vil forstå systemets underlag.

### Historien til SwiftUI

Før SwiftUI brukte iOS **UIKit**，og macOS brukte **AppKit**。Disse to rammeverkene brukte en “imperativ” programmeringsstil. Utviklere måtte enten dra og slippe kontroller i Storyboard eller skrive kode manuelt for å kontrollere visningstilstand. Dette førte til mye kode og høye vedlikeholdskostnader, spesielt når grensesnittlogikken ble kompleks.

![storyboard](../../RESOURCE/010_xcode.png)

I 2019 lanserte Apple SwiftUI offisielt på WWDC. SwiftUI introduserte et “deklarativt” programmeringsparadigme, som i stor grad forenklet UI-utviklingsprosessen.

![storyboard](../../RESOURCE/010_xcode1.png)

Det er verdt å merke seg at SwiftUI ikke er en helt uavhengig implementasjon på lavt nivå. På hver plattform er det i praksis et lag som bygger bro til og samarbeider med UIKit（iOS）eller AppKit（macOS）, og er fortsatt avhengig av disse rammeverkene i bunnen.

### Forholdet mellom Swift og UIKit / AppKit

Selv om Swift er et generelt programmeringsspråk som kan kjøre på Apples plattformer, kan det ikke helt erstatte UIKit eller AppKit. For enkelte komplekse behov i grensesnittet, eller funksjoner som SwiftUI ennå ikke dekker, må vi fortsatt bruke UIKit eller AppKit.

For eksempel er UIKit svært modent når det gjelder håndtering av komplekse view controller-strukturer, animasjoner og gjenkjenning av bevegelser, og har blitt verifisert gjennom mye produksjonspraksis. SwiftUI blir stadig sterkere på disse områdene, men har fortsatt begrensninger i enkelte kanttilfeller.

Derfor bruker mange utviklere SwiftUI og UIKit（eller AppKit）sammen i prosjekter, slik at de kan dra nytte av styrkene til begge.

Sett fra dette perspektivet kan vi forstå SwiftUI som en mer avansert innpakning av UIKit / AppKit. Når vi lærer SwiftUI, vil det derfor også være nyttig å kjenne de grunnleggende begrepene i UIKit og AppKit, slik at vi kan ta bedre tekniske valg når vi vedlikeholder eldre prosjekter eller lager mer komplekse funksjoner.

## Oppsummering

**Swift**：brukes hovedsakelig til å skrive logikk, databehandling, kontrollflyt og lignende, og er ikke direkte knyttet til visningslayout.

**SwiftUI**：brukes til å bygge brukergrensesnitt deklarativt. Kode for visningsinnhold og layout tilhører SwiftUI.

I faktisk utvikling brukes Swift og SwiftUI vanligvis sammen: Swift håndterer logikk, og SwiftUI håndterer grensesnittet.

Fra Objective-C og UIKit til Swift og SwiftUI har Apples utviklingsmiljø gradvis gått i retning av mer moderne og enklere programmeringsmåter, men UIKit og AppKit kan fortsatt ikke overses i mange tradisjonelle prosjekter.

Ved å forstå forholdet mellom Swift og SwiftUI kan vi utvikle iOS/macOS mer effektivt, og også gjøre mer fornuftige tekniske valg når vi vedlikeholder eldre prosjekter.
