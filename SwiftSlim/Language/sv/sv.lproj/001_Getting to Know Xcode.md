# Lära känna Xcode

## Vad är Xcode

Xcode är Apples officiella integrerade utvecklingsmiljö (IDE, Integrated Development Environment) och används för att utveckla appar för Apples plattformar, såsom iOS, macOS, watchOS och tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Under hela kursen kommer vi att använda Xcode för att skriva kod och köra program.

I den här lektionen ska vi lära oss hur man laddar ner Xcode, skapar sin första iOS-app och får en första förståelse för Xcodes gränssnittsstruktur.

## Ladda ner Xcode

Xcode kan för närvarande installeras på två sätt:

1、Ladda ner via [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Ladda ner via [Apple Developers officiella webbplats](https://developer.apple.com/xcode/)

Båda sätten kan användas för att ladda ner Xcode. Skillnaden är att Apples utvecklarwebbplats, utöver den officiella versionen, även erbjuder [Beta](https://developer.apple.com/download/all/?q=Xcode)-versioner och äldre versioner.

Om du bara ska lära dig utveckling rekommenderas den officiella versionen. Beta-versioner används främst för att testa nya funktioner och kan vara instabila.

## Skapa ditt första projekt

När du öppnar Xcode ser du startskärmen.

![Swift](../../RESOURCE/001_xcode1.png)

Till vänster finns tre vanliga alternativ:

- Create New Project —— skapa ett nytt projekt  
- Clone Git Repository —— klona ett Git-arkiv  
- Open Existing Project —— öppna ett befintligt projekt

Till höger visas Xcode-projekt som nyligen har öppnats.

Vi väljer alternativet "Create New Project".

### Välj projektmall

![Swift](../../RESOURCE/001_xcode2.png)

Då kommer du till sidan för val av projektmall. Här visas flera plattformar (iOS, macOS med flera) samt olika typer av projektmallar.

Förklaring av vanliga mallar:
- App —— den mest grundläggande apptypen (rekommenderas)
- Document App —— en app baserad på dokumentmodell
- Game —— för spelutveckling
- Framework —— en återanvändbar modul

I nybörjarfasen väljer vi bara mallen "iOS" - "App", eftersom detta är typen för vanliga gränssnittsapplikationer.

Klicka på "Next".

### Fyll i projektinformation

Nu kommer du till sidan där projektinformationen fylls i. Här behöver vi ange värden enligt respektive fält.

![Swift](../../RESOURCE/001_xcode3.png)

Betydelsen av varje fält:

- Product Name —— projektnamn, till exempel: SwiftSlimTest
- Team —— utvecklarteam. Om du inte har ett betalt Apple Developer-konto kan detta lämnas tomt
- Organization Identifier —— organisationsidentifierare, vanligtvis i omvänd domänform, till exempel:
  - com.yourname
  - com.yourcompany
  - om du inte har ett domännamn kan du använda ditt engelska namn som identifierare
- Bundle Identifier —— appens unika identifierare, som genereras automatiskt utifrån Organization Identifier och Product Name
- Interface —— gränssnittsteknik, välj SwiftUI
- Language —— utvecklingsspråk, välj Swift
- Testing System —— skapar som standard ett testmål (Unit Tests), kan ignoreras i början
- Storage —— ramverk för lokal datalagring, kan automatiskt integrera SwiftData eller Core Data, kan ignoreras i början

När allt är ifyllt klickar du på "Next".

### Spara projektet

![Swift](../../RESOURCE/001_xcode4.png)

Välj en lämplig mapp att spara projektet i.

Klicka på knappen "Create", så genererar Xcode automatiskt projektstrukturen.

## Xcodes projektstruktur

När Xcode-projektet har sparats kan du i Finder se den genererade projektmappen.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— mapp för bilder, appikoner och andra resurser

- ContentView.swift —— den SwiftUI-vyfil som skapas som standard, där vi senare kommer att skriva gränssnittskod

- SwiftSlimTestApp.swift —— appens startfil (App Entry Point), som ansvarar för att starta appen. Vi behöver inte förstå den ännu

- SwiftSlimTest.xcodeproj —— Xcodes projektfil. Dubbelklicka på denna fil för att öppna projektet

## Lära känna Xcodes gränssnitt

Dubbelklicka på .xcodeproj-filen för att öppna projektet och välj sedan filen ContentView.swift i Navigator-området till vänster.

Xcodes gränssnitt består huvudsakligen av fem områden:

- Navigator —— navigeringsområde för att visa filstruktur och söka
- Editor —— redigeringsområde för att skriva Swift- eller SwiftUI-kod
- Canvas —— arbetsyta för SwiftUI-förhandsvisning
- Inspector —— egenskapsinspektör för att visa och ändra filegenskaper
- Debug Area —— felsökningsområde för att visa loggutskrifter

![Swift](../../RESOURCE/001_xcode6.png)

Observera: Canvas används främst för förhandsvisning av SwiftUI-vyer. Enligt Xcodes officiella arkitektur är det en hjälpförhandsvisningspanel (Preview Pane) till Editor. Canvas kan bara aktiveras när en SwiftUI-vyfil är öppen. Andra filtyper visar inte denna förhandsvisningsfunktion.

I de kommande lektionerna kommer vi främst att skriva Swift- och SwiftUI-kod i Editor-området.

När du öppnar ett Xcode-projekt för första gången kan Inspector och Debug Area vara dolda som standard. Du kan klicka på knapparna uppe till höger och nere till höger för att visa dem.

![Swift](../../RESOURCE/001_xcode7.png)

Tips: Inspector-området används främst för att visa och ändra filegenskaper. I faktisk utveckling brukar detta område ofta döljas för att ge mer redigeringsutrymme.

## Sammanfattning

I den här lektionen lärde vi oss hur man laddar ner Xcode, skapar sitt första Xcode-projekt och förstår den grundläggande layouten i Xcodes gränssnitt.

Här kommer lite fri övningstid:
- Du kan prova att skapa och ta bort filer i Navigator-området.  
- Titta på koden i Editor-området och observera kodstrukturen.
- Titta på knapparna i Canvas-området och prova att förstora och förminska förhandsvisningen.

I nästa lektion börjar vi skriva lite enkel kod, vilket också hjälper oss att förstå Xcode ännu bättre.  