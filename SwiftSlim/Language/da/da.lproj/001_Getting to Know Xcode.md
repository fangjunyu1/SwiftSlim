# Lær Xcode at kende

## Hvad er Xcode

Xcode er det integrerede udviklingsmiljø (IDE, Integrated Development Environment), som Apple officielt stiller til rådighed, og det bruges til at udvikle apps til Apple-platforme som iOS, macOS, watchOS og tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Gennem hele undervisningsforløbet kommer vi til at bruge Xcode til at skrive kode og køre programmer.

I denne lektion lærer vi, hvordan man downloader Xcode, opretter sin første iOS-app og får et første overblik over Xcodes brugerflade.

## Download Xcode

Der er i øjeblikket to måder at installere Xcode på:

1. Download via [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Download via [Apple Developers officielle hjemmeside](https://developer.apple.com/xcode/)

Begge metoder kan bruges til at hente Xcode. Forskellen er, at Apple Developers hjemmeside ud over den officielle version også tilbyder [Beta](https://developer.apple.com/download/all/?q=Xcode)-versioner og ældre versioner.

Hvis du blot skal lære udvikling, anbefales det at bruge den officielle stabile version. Beta-versioner bruges primært til at teste nye funktioner og kan være ustabile.

## Opret dit første projekt

Når du åbner Xcode, ser du startsiden.

![Swift](../../RESOURCE/001_xcode1.png)

Til venstre er der tre almindelige valg:

- Create New Project —— Opret et nyt projekt
- Clone Git Repository —— Klon et Git-repositorium
- Open Existing Project —— Åbn et eksisterende projekt

Til højre vises de Xcode-projekter, du senest har haft åbne.

Vi vælger punktet "Create New Project".

### Vælg projektskabelon

![Swift](../../RESOURCE/001_xcode2.png)

Her kommer du ind på siden til valg af projektskabelon, hvor du kan se flere platforme som iOS og macOS samt forskellige typer projektskabeloner.

Forklaring på de mest almindelige skabeloner:

- App —— Den mest grundlæggende apptype (anbefales)
- Document App —— En app baseret på dokumentstruktur
- Game —— Bruges til spiludvikling
- Framework —— Genanvendeligt modul

På begynderniveau vælger vi kun skabelonen "iOS" - "App", fordi det er typen til brugerfladebaserede apps.

Klik på "Next".

### Udfyld projektoplysninger

Du kommer nu til siden, hvor projektoplysninger skal udfyldes. Her skal vi udfylde felterne ud fra deres type og betydning.

![Swift](../../RESOURCE/001_xcode3.png)

Betydningen af felterne:

- Product Name —— Projektnavn, for eksempel: `SwiftSlimTest`
- Team —— Udviklerteam. Hvis du ikke har en betalt Apple Developer-konto, kan du lade det stå tomt
- Organization Identifier —— Organisations-id, normalt i omvendt domæneformat, for eksempel:
  - `com.yourname`
  - `com.yourcompany`
  - Hvis du ikke har et domæne, kan du bruge dit engelske navn som identifikator
- Bundle Identifier —— Appens unikke identifikator. Den genereres automatisk ud fra `Organization Identifier` og `Product Name`
- Interface —— Brugerfladeteknologi. Vælg `SwiftUI`
- Language —— Udviklingssprog. Vælg `Swift`
- Testing System —— Der oprettes som standard et testtarget (`Unit Tests`), som vi ignorerer på begynderniveau
- Storage —— Rammeværk til lokal datalagring. Kan automatisk integrere `SwiftData` eller `Core Data`, men ignoreres på begynderniveau

Når du er færdig, klikker du på "Next".

### Gem projektet

![Swift](../../RESOURCE/001_xcode4.png)

Vælg en passende mappe til at gemme projektet i.

Klik på "Create", så genererer Xcode automatisk projektstrukturen.

## Xcodes projektstruktur

Når Xcode-projektet er gemt, kan du i Finder se den oprettede projektmappe.

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` —— Mappe til billeder, appikoner og andre ressourcer

- `ContentView.swift` —— Den standardgenererede SwiftUI-visningsfil, hvor vi senere skal skrive vores UI-kode

- `SwiftSlimTestApp.swift` —— Appens indgangsfil (`App Entry Point`), som står for at starte appen. Den behøver vi foreløbig ikke forstå i detaljer

- `SwiftSlimTest.xcodeproj` —— Xcodes projektfil. Dobbeltklik på denne fil for at åbne projektet

## Lær Xcodes brugerflade at kende

Dobbeltklik på `.xcodeproj`-filen for at åbne projektet, og vælg derefter `ContentView.swift` i Navigator-området til venstre.

Xcodes brugerflade består hovedsageligt af fem områder:

- Navigator —— Navigationsområdet, bruges til at se filstruktur og søge
- Editor —— Redigeringsområdet, bruges til at skrive Swift- eller SwiftUI-kode
- Canvas —— Lærredsområdet, bruges til SwiftUI-forhåndsvisning
- Inspector —— Egenskabsinspektør, bruges til at se og ændre filegenskaber
- Debug Area —— Fejlfindingsområdet, hvor logoutput vises

![Swift](../../RESOURCE/001_xcode6.png)

Bemærk: `Canvas` bruges hovedsageligt til forhåndsvisning af SwiftUI-visninger. Set ud fra Xcodes officielle arkitektur er det et hjælpepanel til forhåndsvisning i `Editor` (`Preview Pane`). Kun når du åbner en SwiftUI-visningsfil, kan `Canvas` aktiveres. Andre filtyper viser ikke denne forhåndsvisningsfunktion.

I de følgende lektioner kommer vi hovedsageligt til at skrive Swift- og SwiftUI-kode i `Editor`-området.

Første gang du åbner et Xcode-projekt, kan `Inspector` og `Debug Area` være skjult som standard. Du kan klikke på knapperne øverst til højre og nederst til højre for at vise dem.

![Swift](../../RESOURCE/001_xcode7.png)

Tip: `Inspector`-området bruges primært til at se og redigere filegenskaber. I reel udvikling bliver dette område ofte skjult for at få mere plads til redigering.

## Opsummering

I denne lektion lærte vi, hvordan man downloader Xcode, opretter sit første Xcode-projekt og forstår den grundlæggende opbygning af Xcodes brugerflade.

Nu er det tid til at eksperimentere frit:

- Du kan prøve at oprette og slette filer i Navigator-området.
- Se på koden i Editor-området og observer kodeopbygningen.
- Se på knapperne i Canvas-området og prøv at zoome ind og ud på forhåndsvisningen.

I næste lektion begynder vi at skrive noget enkel kode og bruger det til at lære Xcode endnu bedre at kende.
