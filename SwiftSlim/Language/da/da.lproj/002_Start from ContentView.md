# Start med ContentView

## Forberedelse før lektionen

I denne lektion starter vi med filen `ContentView.swift` og lærer systematisk SwiftUIs grundlæggende struktur at kende, herunder:

- Kommentarer
- View-struktur
- `VStack` / `HStack` / `ZStack`-layout
- `SF Symbols`-ikoner
- View-modifiers
- Forhåndsvisningskode med `#Preview`

Find først det Xcode-projekt, du oprettede tidligere, og dobbeltklik på `.xcodeproj`-filen.

Vælg derefter filen `ContentView.swift` i Navigator-området til venstre.

Bemærk: Hver gang du åbner et projekt, kan Canvas vise "Preview paused". Klik blot på opdateringsknappen for at genoptage forhåndsvisningen.

![Swift](../../RESOURCE/002_view7.png)

## Lær ContentView at kende

Koden i `ContentView`:

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

Selv om der ikke er meget kode, indeholder den SwiftUIs kerneopbygning.

### 1. Kommentarer

Øverst i filen:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Dette er filkommentarer, som bruges til at registrere oplysninger om filen, herunder filnavn, projektnavn, ophavsmand og oprettelsestidspunkt.

I Swift bruges `//` til enkeltlinjekommentarer:

```swift
// Dette er en kommentar
```

Kommentarer kan gøre koden mere læsbar og hjælpe udviklere med at forstå logikken.

I reel udvikling kan kode være svær at læse. Hvis man ikke skriver kommentarer, kan man let ende i den situation, at man tre dage senere ikke længere forstår sin egen kode.

Derfor er det en god udviklingsvane aktivt at tilføje kommentarer under skrivningen af kode. Med kommentarer kan man registrere logikken og gøre senere vedligeholdelse lettere.

**Midlertidigt deaktivere kode**

Kommentarer kan også bruges til midlertidigt at skjule kode, så vi lettere kan fejlfinde.

For eksempel:

```
A
B
C
```

`A`, `B` og `C` er tre stykker kode, hvor ét af dem indeholder en fejl. Vi kan midlertidigt kommentere dem ud for at finde problemet.

Kommentér først `A`:

```
// A
B
C
```

Hvis koden fungerer normalt efter at `A` er kommenteret ud, betyder det, at problemet ligger i `A`.

Hvis problemet stadig findes, når `A` er kommenteret ud, kan vi derefter kommentere `B` ud, og så videre, indtil vi finder den problematiske kode.

I udviklingsprocessen møder vi mange problemer, og vi må ofte bruge kommentarer til at finde årsagen. Det hjælper os med at lokalisere den fejlbehæftede kode og finde bugs.

I Xcode kan du bruge genvejstasten:

```
Command ⌘ + /
```

til hurtigt at tilføje eller fjerne kommentarer.

### 2. Import af SwiftUI-frameworket

```swift
import SwiftUI
```

Denne kode betyder, at vi importerer SwiftUI-frameworket.

Typer som `View`, `Text`, `Image` og `VStack` i SwiftUI kommer alle fra dette framework.

Hvis vi ikke importerer SwiftUI-frameworket, vil Xcode vise en fejl:

```
Cannot find type 'View' in scope
```

Det betyder, at compileren ikke kan genkende typen `View`.

### 3. View-struktur

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Første gang man ser denne `View`-struktur, kan den virke fremmed, fordi den indeholder nøgleord som `struct`, `View`, `var`, `body` og `some`.

Vi har endnu ikke lært disse nøgleord. Lige nu behøver du blot at vide, at denne kode opretter en `View` med navnet `ContentView`.

Du kan tænke på en `View` som et lærred, hvor vi kan tegne, og værktøjet til at tegne med er SwiftUI.

For eksempel:

![Swift](../../RESOURCE/002_view.png)

Billedet ovenfor viser tre sider, og i praksis er de tre forskellige `View`s.

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

Når vi udvikler en app med SwiftUI, er hver side en `View`.

### 4. SwiftUI-kode

Inde i `View`-visningen ser vi SwiftUI-koden:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Denne SwiftUI-kode betyder, at det er et lodret layout, som viser et ikon og en tekst.

![Swift](../../RESOURCE/002_view1.png)

#### VStack-layout

```swift
VStack { }  // Lodret layout
```

`VStack` betyder en lodret layoutcontainer. Visningerne indeni arrangeres fra top til bund.

![Swift](../../RESOURCE/002_view8.png)

Tre almindelige layouttyper i SwiftUI:

- `VStack` —— Lodret sortering
- `HStack` —— Vandret sortering
- `ZStack` —— Stakket sortering langs Z-aksen

```swift
HStack { }  // Vandret sortering
ZStack { }  // Overlejret sortering
```

Illustration af de forskellige layouttyper:

![Swift](../../RESOURCE/002_view2.png)

For eksempel: brug `HStack` til vandret sortering.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Her kan du se, at globusikonet og teksten vises vandret.

![Swift](../../RESOURCE/002_view3.png)

Når vi ønsker vandret sortering, bruger vi `HStack`. Når vi ønsker overlejret sortering, bruger vi `ZStack`.

#### Image og SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Denne kode viser et globusikon, og globusikonet kommer fra Apples SF Symbols-ikonsystem.

![Swift](../../RESOURCE/002_view9.png)

Koden betyder, at der vises et globusikon i stor størrelse og med fremhævelsesfarven.

Ud over globusikonet kan vi også vise andre ikoner.

For eksempel et rygsækikon:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Hvordan viser man andre ikoner?**

Vi skal bruge Apples officielle systemikonbibliotek SF Symbols.

Åbn Apple Developers officielle hjemmeside og download [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Åbn appen SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Til venstre vises kategorierne af symboler, og til højre vises de tilsvarende ikoner.

Højreklik på et ikon og vælg "Copy Name". Navnet er den tilsvarende strengværdi.

For eksempel:

```
"globe"
"backpack"
"heart"
```

Indsæt navnet på det kopierede ikon i `Image(systemName:)`, så kan du vise forskellige ikoner.

Bemærk: Hvert `SF Symbols`-ikon har en minimum understøttet systemversion. Hvis systemversionen er for lav, vises ikonet muligvis ikke. Du skal kontrollere kompatibilitetsoplysningerne i SF Symbols-appen.

#### Modifiers

I SwiftUI er en modifier en metode, der bruges til at ændre en views udseende eller opførsel.

Du kan tænke på modifiers som tøj: med forskelligt tøj ser det samme indhold forskelligt ud.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` og `foregroundStyle` er modifiers for `Image`-visningen. De ændrer `Image`-visningen uden at ændre selve indholdet.

**1. imageScale**

```swift
.imageScale(.large)
```

Den kan styre størrelsen på SF Symbols-ikoner:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Vi kan prøve forskellige muligheder, så SF Symbols vises i forskellige størrelser.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` kan styre forgrundsfarven.

`.tint` betyder den aktuelle fremhævelsesfarve (`accent color`) i miljøet, som på iOS som standard er blå.

Hvis vi vil ændre forgrundsfarven til rød:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text-visning

`Text` er en tekstvisning, som bruges til at vise strenge.

```swift
Text("Hello, world!")
```

For eksempel kan vi vise mit navn:

```swift
Text("FangJunyu")
```

Bemærk: Strenge skal være omgivet af dobbelte anførselstegn `""`.

Du kan prøve at vise dit navn, telefonnummer eller andet indhold.

#### padding

I SwiftUI bruges `padding` til at tilføje tom plads mellem visningens indhold og dens grænse. Det hører til kategorien indre afstand (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

Koden ovenfor betyder, at der tilføjes standardafstand til `HStack`-visningen.

**Hvad er padding?**

`padding` betyder det tomme område mellem visningens indhold og dens grænse.

I figuren nedenfor vil det blå område trække sig indad, når den blå `HStack` får `padding`, og det vil se ud, som om det "bliver en omgang mindre".

![Swift](../../RESOURCE/002_view6.png)

**Standardafstand**

Modifieren `padding()` bruger som standard systemets anbefalede standardafstand.

```swift
.padding()
```

Denne værdi kan være forskellig på forskellige platforme og i forskellige kontekster, for eksempel:

- På iOS er den typisk omkring `16 pt`
- På macOS eller watchOS kan systemets standardafstand være større eller mindre afhængigt af platformens designregler

**Tilpasset afstand**

Vi kan også sætte afstand for visningen mere præcist.

1. Sæt én retning

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Forklaring af retninger:

- `.top`: topafstand
- `.bottom`: bundafstand
- `.leading`: forkantsafstand
- `.trailing`: bagkantsafstand

![Swift](../../RESOURCE/002_view12.png)

Bemærk: `leading` og `trailing` tilpasses automatisk efter sprogretningsretningen. For eksempel vil de automatisk blive spejlet i et arabisk miljø med højre-til-venstre-layout (`RTL`).

2. Sæt flere retninger

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Du kan bruge et array til at angive flere retninger på samme tid. Den konkrete brug af arrays bliver forklaret mere detaljeret i senere lektioner. Her er det nok blot at kende denne skrivemåde.

3. Sæt vandret eller lodret retning

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Det svarer til:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Fjern afstand**

Hvis du slet ikke ønsker nogen afstand, kan du bruge `.padding(0)` til at fjerne den:

```swift
.padding(0)
```

Eller blot slette `padding`-modifieren direkte:

```swift
// .padding()
```

### 6. Preview-forhåndsvisningskode

```swift
#Preview {
    ContentView()
}
```

Denne kode betyder, at der genereres en forhåndsvisning af `ContentView` i Canvas.

Bemærk: `#Preview` er ny syntaks introduceret i Swift 5.9 / Xcode 15. Før det brugte man en `PreviewProvider`-struktur.

**Hvad sker der, hvis Preview kommenteres ud?**

Hvis vi kommenterer `Preview` ud:

```swift
// #Preview {
//    ContentView()
// }
```

vil Canvas ikke længere vise noget renderbart indhold.

![Swift](../../RESOURCE/002_xcode.png)

Det skyldes, at `#Preview` styrer, hvilken forhåndsvisningsvisning Canvas skal vise.

Når vi har brug for at forhåndsvise en SwiftUI-visning i Xcode, tilføjer vi `#Preview`. Hvis vi ikke har brug for forhåndsvisning, kan vi kommentere eller slette `#Preview`.

## Opsummering

Selv om filen `ContentView.swift` ikke indeholder meget kode, dækker den i virkeligheden over flere af SwiftUIs kernebegreber. For begyndere kan denne kode virke fremmed, men ved at dele strukturen op kan man danne en første forståelse af SwiftUI.

Lad os se tilbage på indholdet i denne lektion. Først lærte vi kommentarer med `//`, som kan bruges til at forklare kodelogik eller midlertidigt skjule kode.

Derefter lærte vi, at en SwiftUI-fil skal importere SwiftUI-frameworket:

```swift
import SwiftUI
```

Hvis frameworket ikke importeres, kan compileren ikke genkende typer som `View`.

Så så vi den grundlæggende struktur i en SwiftUI-visning:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Her er `ContentView` navnet på visningen.

Vi lærte også de tre almindelige layoutcontainere: `VStack` (lodret sortering), `HStack` (vandret sortering) og `ZStack` (overlejret sortering).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Denne kode betyder, at der vises en lodret sorteret container, og inde i den vises et ikon og en tekst.

`Image` kan vise SF Symbols-ikoner, og gennem modifiers kan vi styre ikonets størrelse og farve.

`Text`-visningen kan vise tekstindhold.

`padding` er afstand, som tilføjer et gennemsigtigt område omkring visningen.

Til sidst kom `#Preview`, som kan vise forhåndsvisningen i Canvas.

### Øvelser efter lektionen

For begyndere kan indholdet i denne lektion virke lidt komplekst. Vi kan bruge yderligere øvelse til at styrke forståelsen:

- Skift navnet på SF Symbols-ikonet
- Skift ikonets forgrundsfarve til sort
- Skift `VStack` til `HStack`
- Kommentér `Image` eller `Text` ud, og observer hvordan forhåndsvisningen ændrer sig

### Bonus: Code Completion

Når du skriver kode, har du måske allerede bemærket, at Xcode automatisk viser en liste med mulige valg.

For eksempel når vi ændrer `imageScale`-modifieren:

```swift
.imageScale(.)
```

viser Xcode de tilgængelige muligheder:

![Swift](../../RESOURCE/002_view10.png)

Dette er kodefuldførelse (`Code Completion`). Den bygger på typeinferens og forslag af enum-medlemmer og kan forbedre skrivehastigheden og reducere fejl.

I senere lektioner vil vi officielt introducere enum. For nu er det nok bare at kende til begrebet.
