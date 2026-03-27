# Bli kjent med Xcode

## Hva er Xcode

Xcode er Apples offisielle integrerte utviklingsmiljø（IDE, Integrated Development Environment）, og brukes til å utvikle apper for Apple-plattformer som iOS, macOS, watchOS og tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Gjennom hele opplæringen kommer vi til å bruke Xcode til å skrive kode og kjøre programmer.

I denne leksjonen skal vi lære hvordan man laster ned Xcode, oppretter sin første iOS-app, og får en første forståelse av grensesnittstrukturen i Xcode.

## Last ned Xcode

Xcode kan for øyeblikket installeres på to måter:

1. Last ned via [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Last ned via [Apple Developer-nettstedet](https://developer.apple.com/xcode/)

Begge måtene kan brukes til å laste ned Xcode. Forskjellen er at Apple Developer-nettstedet, i tillegg til den offisielle stabile versjonen, også tilbyr [Beta](https://developer.apple.com/download/all/?q=Xcode)-versjoner og eldre versjoner.

Hvis du bare skal lære utvikling, anbefales det å bruke den stabile versjonen. Beta-versjoner brukes hovedsakelig til å teste nye funksjoner og kan være ustabile.

## Opprett ditt første prosjekt

Når du åpner Xcode, vil du se startsiden.

![Swift](../../RESOURCE/001_xcode1.png)

Til venstre finnes tre vanlige alternativer:

- Create New Project —— opprett nytt prosjekt
- Clone Git Repository —— klon et Git-arkiv
- Open Existing Project —— åpne et eksisterende prosjekt

Til høyre vises Xcode-prosjektene som nylig har vært åpnet.

Vi velger alternativet "Create New Project".

### Velg prosjektmal

![Swift](../../RESOURCE/001_xcode2.png)

Du kommer da til siden for valg av prosjektmal. Her vises flere plattformer（iOS, macOS osv.）samt ulike typer prosjektmaler.

Vanlige maler:
- App —— den mest grunnleggende app-typen（anbefalt）
- Document App —— en app basert på dokumentmodus
- Game —— for spillutvikling
- Framework —— gjenbrukbar modul

I startfasen velger vi bare malen "iOS" - "App", fordi dette er typen grensesnittapp.

Klikk på "Next".

### Fyll inn prosjektinformasjon

Du kommer nå til siden der prosjektinformasjon skal fylles ut, og vi må fylle inn feltene etter type.

![Swift](../../RESOURCE/001_xcode3.png)

Betydningen av hvert felt:

- Product Name —— prosjektnavn, for eksempel: SwiftSlimTest
- Team —— utviklerteam. Hvis du ikke har en betalt Apple Developer-konto, kan du la dette stå tomt
- Organization Identifier —— organisasjonsidentifikator, vanligvis i omvendt domenenavnformat, for eksempel:
  - com.yourname
  - com.yourcompany
  - hvis du ikke har et domene, kan du bruke ditt engelske navn som identifikator
- Bundle Identifier —— appens unike identifikator. Den genereres automatisk ut fra Organization Identifier og Product Name
- Interface —— grensesnittteknologi, velg SwiftUI
- Language —— utviklingsspråk, velg Swift
- Testing System —— oppretter standard testmål（Unit Tests）, kan ignoreres i startfasen
- Storage —— rammeverk for lokal datalagring, kan automatisk integrere SwiftData eller Core Data, kan ignoreres i startfasen

Når alt er fylt ut, klikker du på "Next".

### Lagre prosjektet

![Swift](../../RESOURCE/001_xcode4.png)

Velg en passende mappe å lagre det i.

Klikk på "Create"-knappen, så vil Xcode automatisk opprette prosjektstrukturen.

## Xcodes prosjektstruktur

Etter at Xcode-prosjektet er lagret, kan du se den opprettede prosjektmappen i Finder.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— mappen for å lagre bilder, appikoner og andre ressurser

- ContentView.swift —— SwiftUI-visningsfilen som opprettes som standard. Det er her vi senere skal skrive grensesnittkode.

- SwiftSlimTestApp.swift —— appens inngangsfil（App Entry Point）, som er ansvarlig for å starte appen. Denne trenger vi foreløpig ikke å forstå.

- SwiftSlimTest.xcodeproj —— Xcode-prosjektfilen. Dobbeltklikk på denne filen for å åpne prosjektet.

## Bli kjent med Xcode-grensesnittet

Dobbeltklikk på `.xcodeproj`-filen for å åpne prosjektet, og velg deretter `ContentView.swift` i Navigator-området til venstre.

Xcode-grensesnittet består hovedsakelig av fem områder:

- Navigator —— navigasjonsområde, for å se filstruktur og søke
- Editor —— redigeringsområde, for å skrive Swift- eller SwiftUI-kode
- Canvas —— lerretsområde, for SwiftUI-forhåndsvisning
- Inspector —— egenskapsinspektør, for å vise og endre filegenskaper
- Debug Area —— feilsøkingsområde, for å vise loggutdata

![Swift](../../RESOURCE/001_xcode6.png)

Merk: Canvas brukes hovedsakelig til forhåndsvisning av SwiftUI-visninger. Fra Xcodes offisielle arkitektur er det en hjelpebasert forhåndsvisningspanel（Preview Pane）til Editor. Canvas kan bare aktiveres når en SwiftUI-visningsfil er åpen. Andre filtyper viser ikke forhåndsvisning.

I de kommende leksjonene kommer vi hovedsakelig til å skrive Swift- og SwiftUI-kode i Editor-området.

Første gang du åpner et Xcode-prosjekt, kan Inspector og Debug Area være skjult som standard. Du kan klikke på knappene øverst til høyre og nederst til høyre for å vise dem.

![Swift](../../RESOURCE/001_xcode7.png)

Tips: Inspector-området brukes hovedsakelig til å se og endre filegenskaper. I faktisk utvikling skjules dette området ofte for å få mer redigeringsplass.

## Oppsummering

I denne leksjonen lærte vi hvordan man laster ned Xcode, oppretter sitt første Xcode-prosjekt, og den grunnleggende oppbygningen av Xcode-grensesnittet.

Her er litt fri utforskingstid:
- Du kan prøve å opprette og slette filer i Navigator-området.
- Se på koden i Editor-området og observer strukturen.
- Se på knappene i Canvas-området og prøv å zoome inn og ut i forhåndsvisningen.

I neste leksjon skal vi begynne å skrive litt enkel kode, og dette vil hjelpe oss med å forstå Xcode enda bedre.
