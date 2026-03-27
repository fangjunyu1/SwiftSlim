# Kennismaken met Xcode

## Wat is Xcode

Xcode is de officiële geïntegreerde ontwikkelomgeving van Apple（IDE, Integrated Development Environment）en wordt gebruikt voor het ontwikkelen van apps voor Apple-platformen zoals iOS, macOS, watchOS en tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Tijdens het hele leerproces zullen we Xcode gebruiken om code te schrijven en programma's uit te voeren.

In deze les leren we hoe je Xcode downloadt, je eerste iOS-app maakt en de basisstructuur van de Xcode-interface leert kennen.

## Xcode downloaden

Op dit moment zijn er twee manieren om Xcode te installeren:

1. Downloaden via de [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Downloaden via de [officiële Apple Developer-website](https://developer.apple.com/xcode/)

Beide manieren kunnen worden gebruikt om Xcode te downloaden. Het verschil is dat de Apple Developer-website naast de stabiele versie ook [Beta](https://developer.apple.com/download/all/?q=Xcode)-versies en historische versies aanbiedt.

Als je alleen leert ontwikkelen, is het aan te raden de stabiele versie te gebruiken. Beta-versies zijn vooral bedoeld om nieuwe functies te testen en kunnen instabiel zijn.

## Je eerste project maken

Wanneer je Xcode opent, zie je het startscherm.

![Swift](../../RESOURCE/001_xcode1.png)

Links staan drie veelgebruikte opties:

- Create New Project —— nieuw project maken
- Clone Git Repository —— Git-repository klonen
- Open Existing Project —— bestaand project openen

Rechts worden recent geopende Xcode-projecten weergegeven.

Wij kiezen de optie "Create New Project".

### Een projectsjabloon kiezen

![Swift](../../RESOURCE/001_xcode2.png)

Je komt nu in het scherm voor het kiezen van een projectsjabloon. Hier worden meerdere platformen（iOS、macOS enzovoort）en verschillende soorten projectsjablonen weergegeven.

Veelvoorkomende sjablonen:
- App —— het meest basale applicatietype（aanbevolen）
- Document App —— een app gebaseerd op documentmodus
- Game —— voor gameontwikkeling
- Framework —— herbruikbare module

In de beginfase kiezen we alleen de sjabloon "iOS" - "App", omdat dit een interface-applicatietype is.

Klik op "Next".

### Projectinformatie invullen

Je komt nu in het scherm waar projectinformatie moet worden ingevuld, en we moeten elk veld invullen volgens het type.

![Swift](../../RESOURCE/001_xcode3.png)

Betekenis van de velden:

- Product Name —— projectnaam, bijvoorbeeld: SwiftSlimTest
- Team —— ontwikkelteam. Als je geen betaald Apple Developer-account hebt, kun je dit leeg laten
- Organization Identifier —— organisatie-identificatie, meestal in omgekeerd domeinnaamformaat, bijvoorbeeld:
  - com.yourname
  - com.yourcompany
  - als je geen domeinnaam hebt, kun je je eigen Engelse naam als identificatie gebruiken
- Bundle Identifier —— de unieke identificatie van de app. Deze wordt automatisch gegenereerd op basis van Organization Identifier en Product Name
- Interface —— interfacetechnologie, kies SwiftUI
- Language —— programmeertaal, kies Swift
- Testing System —— maakt standaard testdoelen（Unit Tests）aan, in de beginfase negeren
- Storage —— framework voor lokale persistente opslag, kan automatisch SwiftData of Core Data integreren, in de beginfase negeren

Klik na het invullen op "Next".

### Project opslaan

![Swift](../../RESOURCE/001_xcode4.png)

Kies een geschikte map om het project op te slaan.

Klik op de knop "Create", en Xcode genereert automatisch de projectstructuur.

## Xcode-projectstructuur

Nadat het Xcode-project is opgeslagen, kun je in Finder de gegenereerde projectmap zien.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— map voor afbeeldingen, appiconen en andere bronnen

- ContentView.swift —— het standaard gegenereerde SwiftUI-weergavebestand. Hier zullen we later interfacecode schrijven.

- SwiftSlimTestApp.swift —— het toegangspunt van de app（App Entry Point）, verantwoordelijk voor het starten van de app. Dat hoeven we voorlopig nog niet te begrijpen.

- SwiftSlimTest.xcodeproj —— het Xcode-projectbestand. Dubbelklik op dit bestand om het project te openen.

## Kennismaken met de Xcode-interface

Dubbelklik op het `.xcodeproj`-bestand om het project te openen, en selecteer vervolgens `ContentView.swift` in het Navigator-gebied aan de linkerkant.

De Xcode-interface bestaat hoofdzakelijk uit vijf gebieden:

- Navigator —— navigatiegebied, voor bestandsstructuur en zoeken
- Editor —— bewerkingsgebied, voor het schrijven van Swift- of SwiftUI-code
- Canvas —— canvasgebied, voor SwiftUI-voorvertoning
- Inspector —— eigenschappeninspectiegebied, om bestandseigenschappen te bekijken en te wijzigen
- Debug Area —— debuggebied, voor loguitvoer

![Swift](../../RESOURCE/001_xcode6.png)

Opmerking: Canvas wordt vooral gebruikt voor het voorvertonen van SwiftUI-weergaven. In de officiële architectuur van Xcode is het een ondersteunend voorvertoningspaneel（Preview Pane）van de Editor. Alleen wanneer een SwiftUI-weergavebestand is geopend, kan Canvas worden ingeschakeld. Bij andere bestandstypen wordt geen voorvertoning getoond.

In de volgende lessen zullen we vooral Swift- en SwiftUI-code schrijven in het Editor-gebied.

De eerste keer dat je een Xcode-project opent, kunnen Inspector en Debug Area standaard verborgen zijn. Je kunt op de knoppen rechtsboven en rechtsonder klikken om ze te tonen.

![Swift](../../RESOURCE/001_xcode7.png)

Tip: Het Inspector-gebied wordt vooral gebruikt om bestandseigenschappen te bekijken en te wijzigen. In echte ontwikkeling wordt dit gebied vaak verborgen om meer bewerkingsruimte te krijgen.

## Samenvatting

In deze les hebben we geleerd hoe je Xcode downloadt, je eerste Xcode-project maakt en de basisindeling van de Xcode-interface begrijpt.

Hier is wat vrije oefentijd:
- Je kunt proberen bestanden te maken en te verwijderen in het Navigator-gebied.
- Bekijk de code in het Editor-gebied en observeer de structuur.
- Bekijk de knoppen in het Canvas-gebied en probeer in en uit te zoomen op de voorvertoning.

In de volgende les beginnen we met het schrijven van eenvoudige code en helpen we onszelf om Xcode nog beter te begrijpen.
