# Börja från ContentView

## Förberedelser före lektionen

I den här lektionen börjar vi från filen ContentView.swift och lär oss systematiskt känna SwiftUIs grundläggande struktur, inklusive:

- kommentarer
- View-struktur
- layouter med VStack / HStack / ZStack
- SF Symbols-ikoner
- vymodifierare (modifier)
- förhandsvisningskod med #Preview

Börja med att hitta Xcode-projektet du skapade tidigare och dubbelklicka på .xcodeproj-filen.

Välj sedan filen ContentView.swift i Navigator-navigeringsområdet till vänster.

Observera: varje gång du öppnar projektet kan Canvas visa "Preview paused". Klicka på uppdateringsknappen för att återställa förhandsvisningen.

![Swift](../../RESOURCE/002_view7.png)

## Lära känna ContentView

ContentView-kod:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

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

Även om koden är ganska kort innehåller den SwiftUIs kärnstruktur.

### 1. Kommentarer

Överst i filen:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Detta är en filkommentar som används för att registrera filinformation, bland annat filnamn, projektnamn, skapare och skapandetid.

I Swift används // för enradskommentarer:

```swift
// Det här är en kommentar
```

Kommentarer kan förbättra kodens läsbarhet och hjälpa utvecklare att förstå kodens logik.

I verklig utveckling kan kod ibland vara svår att förstå. Om man inte skriver kommentarer kan man hamna i situationen att man tre dagar senare inte längre förstår sin egen kod.

Därför är det en god utvecklingsvana att aktivt lägga till kommentarer när man skriver kod. Med hjälp av kommentarer kan man dokumentera kodlogik och underlätta senare underhåll.

**Tillfälligt stänga av kod**

Kommentarer kan också användas för att tillfälligt stänga av kod, så att vi lättare kan felsöka.

Till exempel:

```
A
B
C
```

A, B och C är tre kodavsnitt, och ett av dem innehåller ett fel. Då kan vi tillfälligt kommentera bort kod för att felsöka.

Kommentera först bort A:

```
// A
B
C
```

Om koden fungerar normalt efter att A har kommenterats bort betyder det att problemet finns i koden A.

Om problemet fortfarande finns kvar efter att A kommenterats bort kan vi sedan kommentera bort B, och så vidare tills vi hittar den felaktiga koden.

Under utveckling stöter man på många problem, och i de flesta fall behöver vi använda kommentarer för att felsöka orsaken. Det hjälper oss att lokalisera problemkoden och hitta buggen.

I Xcode kan du använda kortkommandot:

```
Command ⌘ + /
```

för att snabbt lägga till eller ta bort kommentarer.

### 2. Importera SwiftUI-ramverket

```swift
import SwiftUI
```

Den här raden betyder att SwiftUI-ramverket importeras.

Typer som View, Text, Image och VStack i SwiftUI kommer alla från detta ramverk.

Om SwiftUI inte importeras kommer Xcode att visa ett fel:

```
Cannot find type 'View' in scope
```

Det betyder att kompilatorn inte kan känna igen typen View.

### 3. View-struktur

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Första gången man ser denna View-struktur kan den kännas främmande, eftersom den innehåller nyckelord som struct, View, var, body och some.

Vi har ännu inte lärt oss dessa nyckelord, så just nu behöver du bara veta att denna kod betyder att en vy med namnet ContentView har skapats.

Du kan tänka på en View som en ritplatta där vi kan rita, och ritverktyget är SwiftUI.

Till exempel:

![Swift](../../RESOURCE/002_view.png)

Bilden ovan visar tre sidor, men i praktiken är de tre olika View.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

När vi utvecklar appar med SwiftUI är varje sida en View.

### 4. SwiftUI-kod

Inuti View-vyn visas SwiftUI-koden:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Denna SwiftUI-kod betyder att det är en vertikal layout som visar en ikon och en text.

![Swift](../../RESOURCE/002_view1.png)

#### VStack-layout

```swift
VStack { }  // vertikal layout
```

VStack betyder en vertikal layoutcontainer. De inre vyerna placeras uppifrån och ned.

![Swift](../../RESOURCE/002_view8.png)

Tre vanliga layouter i SwiftUI är:

* VStack —— vertikal ordning
* HStack —— horisontell ordning
* ZStack —— överlagrad ordning (Z-axeln)

```swift
HStack { }  // horisontell ordning
ZStack { }  // överlagrad ordning
```

Schematisk bild över ordningen i de olika layouterna:

![Swift](../../RESOURCE/002_view2.png)

Till exempel: använd HStack för horisontell ordning.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Då kan du se att jordglobsikonen och texten visas horisontellt.

![Swift](../../RESOURCE/002_view3.png)

När vi vill ordna innehåll horisontellt använder vi HStack. När vi behöver överlagrad ordning använder vi ZStack.

#### Image och SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Denna kod visar en jordglobsikon, och ikonen kommer från Apples SF Symbols-ikonsystem.

![Swift](../../RESOURCE/002_view9.png)

Kodens betydelse är att visa en jordglobsikon, i stor storlek, med markeringsfärg.

Vi kan inte bara visa en jordglob, utan även andra ikoner.

Till exempel, visa en ryggsäck:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Hur visar man andra ikoner?**

Vi behöver använda Apples officiella systemikonbibliotek SF Symbols.

Öppna Apples officiella utvecklarwebbplats och ladda ner [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Öppna sedan appen SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Till vänster visas symbolkategorier, och till höger motsvarande ikoner.

Högerklicka på en ikon och välj "Copy Name" för att kopiera dess namn, vilket är den motsvarande strängen.

Till exempel:

```
"globe"
"backpack"
"heart"
```

Sätt in det kopierade ikonnamnet i Image(systemName:), så kan olika ikoner visas.

Observera: varje SF Symbols-ikon har en lägsta stödd systemversion. Om systemversionen är för låg kanske ikonen inte visas. Du behöver kontrollera dess kompatibilitetsinformation i SF Symbols-appen.

#### Modifierare

I SwiftUI är en modifierare (modifier) en metod som används för att ändra en vys utseende eller beteende.

Du kan tänka på modifierare som kläder. Med olika kläder ser samma person olika ut.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale och foregroundStyle är modifierare för Image-vyn. De ändrar Image-vyn utan att ändra själva innehållet i Image.

**1. imageScale**

```swift
.imageScale(.large)
```

Den används för att styra storleken på SF Symbols-ikoner:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

Vi kan ändra olika alternativ så att SF Symbols-symbolen visas i olika storlekar.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle används för att styra förgrundsfärgen.

.tint betyder den aktuella miljöns markeringsfärg (accent color), som i iOS som standard är blå.

Om vi vill ändra förgrundsfärgen till röd:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text-vy

Text är en textvy och används för att visa strängar.

```swift
Text("Hello, world!")
```

Till exempel, visa mitt namn:

```swift
Text("FangJunyu")
```

Observera: strängar måste omges av dubbla citattecken "".

Du kan prova att visa ditt namn, telefonnummer och annat innehåll.

#### padding-marginal

I SwiftUI används padding för att lägga till tomt utrymme mellan vyinnehållet och dess gräns. Det hör till "inre marginal (padding / content inset)".

```swift
HStack {
    ...
}
.padding()
```

Koden ovan betyder att HStack-vyn får systemets standardmarginal.

**Vad är padding?**

padding betyder "det tomma området mellan vyinnehållet och dess gräns".

I bilden nedan har den blå HStack fått padding, vilket gör att det blå området dras inåt och ser ut att "bli lite mindre".

![Swift](../../RESOURCE/002_view6.png)

**Standardmarginal**

Modifieraren padding() använder som standard systemets rekommenderade standardavstånd.

```swift
.padding()
```

Detta värde kan skilja sig mellan olika plattformar och sammanhang, till exempel:

* I iOS är det vanligtvis ungefär 16 pt.
* I macOS eller watchOS kan systemets standardavstånd vara annorlunda, ofta större eller mindre, beroende på respektive plattforms designregler.

**Anpassad marginal**

Det går också att ange en separat marginal för vyn.

1. Ange en enskild riktning

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Förklaring av riktningar:

* .top: övre marginal
* .bottom: nedre marginal
* .leading: främre sidomarginal
* .trailing: bakre sidomarginal

![Swift](../../RESOURCE/002_view12.png)

Observera: leading och trailing anpassas automatiskt efter språkets riktning. I en arabisk miljö (RTL) vänds de till exempel automatiskt.

2. Ange flera riktningar

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Genom en array kan flera riktningar anges samtidigt. Den specifika användningen av arrayer kommer att förklaras mer utförligt i senare lektioner, här behöver du bara känna till denna skrivform.

3. Ange horisontell eller vertikal riktning

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Motsvarar:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Ta bort marginal**

Om du inte vill ha någon marginal alls kan du använda .padding(0) för att ta bort den:

```swift
.padding(0)
```

Eller helt enkelt ta bort padding-modifieraren direkt:

```swift
// .padding()
```

### 6. Förhandsvisningskod med Preview

```swift
#Preview {
    ContentView()
}
```

Den här koden betyder att en förhandsvisning av ContentView-vyn skapas i Canvas.

Observera: #Preview är en ny syntax som introducerades i Swift 5.9 / Xcode 15. Före detta användes strukturen PreviewProvider.

**Vad händer om Preview kommenteras bort?**

Om Preview kommenteras bort:

```swift
// #Preview {
//    ContentView()
// }
```

kommer Canvas inte längre att visa något renderbart innehåll.

![Swift](../../RESOURCE/002_xcode.png)

Det är alltså #Preview som styr att Canvas visar en förhandsvisningsvy.

När vi behöver förhandsvisa en SwiftUI-vy i Xcode lägger vi till #Preview-kod. Om förhandsvisning inte behövs kan #Preview-koden kommenteras bort eller tas bort.

## Sammanfattning

Även om filen ContentView.swift inte innehåller mycket kod täcker den i själva verket flera kärnkoncept i SwiftUI. För nybörjare kan denna kod kännas främmande, men genom att bryta ner strukturen kan man bygga upp en första förståelse för SwiftUI.

Om vi går igenom innehållet i denna lektion igen, började vi med att lära oss kommentarer //, som kan användas för att förklara kodlogik eller tillfälligt stänga av kod.

Sedan lärde vi oss att SwiftUI-filer måste importera SwiftUI-ramverket:

```swift
import SwiftUI
```

Om ramverket inte importeras kommer kompilatorn inte att kunna känna igen typer som View.

Därefter lärde vi känna grundstrukturen för en SwiftUI-vy:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Där ContentView är namnet på vyn.

Vi lärde oss också tre vanliga layoutcontainrar: VStack (vertikal ordning), HStack (horisontell ordning) och ZStack (överlagrad ordning).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Den här koden betyder att en vertikal container visas, och inuti containern visas en ikon och en text.

Image kan visa SF Symbols-ikoner, och modifierare används för att styra ikonens storlek och färg.

Text-vyn kan visa textinnehåll.

padding är en marginal som lägger till ett transparent utrymme runt vyn.

Till sist har vi #Preview-förhandsvisningen, som kan visa en förhandsvisningsvy i Canvas.

### Övningar efter lektionen

För nybörjare kan innehållet i denna lektion kännas ganska komplext. Vi kan därför fördjupa förståelsen genom ytterligare övning:

* Ändra namnet på SF Symbols-ikonen
* Ändra ikonens förgrundsfärg till svart
* Byt ut VStack mot HStack
* Kommentera bort Image eller Text och observera hur förhandsvisningen förändras

### Bonus: kodkomplettering (Code Completion)

När du skriver kod kanske du redan har lagt märke till att Xcode automatiskt visar en lista med tillgängliga alternativ.

Till exempel, när vi ändrar modifieraren imageScale:

```swift
.imageScale(.)
```

visar Xcode de tillgängliga alternativen:

![Swift](../../RESOURCE/002_view10.png)

Detta är en del av kodkompletteringsmekanismen (Code Completion), som bygger på typinferens och förslag av enum-medlemmar. Den kan förbättra inmatningseffektiviteten och minska antalet fel.

I senare lektioner kommer vi formellt att introducera uppräknade typer (enum). Just nu räcker det att ha en enkel grundläggande förståelse.
