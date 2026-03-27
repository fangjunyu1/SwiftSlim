# Start med ContentView

## Forberedelser før timen

I denne leksjonen skal vi starte med filen `ContentView.swift` og systematisk bli kjent med SwiftUIs grunnleggende struktur, inkludert:

- kommentarer
- View-struktur
- `VStack` / `HStack` / `ZStack`-layout
- `SF Symbols`-ikoner
- view-modifikatorer（modifier）
- forhåndsvisningskoden `#Preview`

Finn først Xcode-prosjektet du opprettet tidligere, og dobbeltklikk på `.xcodeproj`-filen.

Velg deretter `ContentView.swift` i Navigator-området til venstre.

Merk: Hver gang du åpner prosjektet, kan Canvas vise "Preview paused". Klikk på oppdateringsknappen for å gjenopprette forhåndsvisningen.

![Swift](../../RESOURCE/002_view7.png)

## Bli kjent med ContentView

Koden i `ContentView`：

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

Selv om det ikke er så mye kode her, inneholder den kjernestrukturen i SwiftUI.

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

Dette er filkommentarer som brukes til å registrere filinformasjon, inkludert filnavn, prosjektnavn, oppretter og opprettelsestidspunkt.

I Swift brukes `//` til kommentarer på én linje:

```swift
// Dette er en kommentar
```

Kommentarer kan gjøre koden mer lesbar og hjelpe utviklere å forstå logikken.

I faktisk utvikling kan kode være vanskelig å lese. Hvis du ikke skriver kommentarer, kan du ende opp med å ikke forstå din egen kode tre dager senere.

Derfor er det en god utviklingsvane å legge til kommentarer aktivt mens du skriver kode. Bruk kommentarer til å dokumentere kodelogikk, slik at vedlikehold i etterkant blir enklere.

**Midlertidig slå av kode**

Kommentarer kan også brukes til å slå av kode midlertidig, slik at vi kan finne feil.

For eksempel:

```
A
B
C
```

`A`、`B` og `C` er tre kodeblokker, og én av dem inneholder en feil. Vi kan kommentere dem ut midlertidig for å undersøke.

Kommenter først ut `A`：

```
// A
B
C
```

Hvis koden fungerer normalt etter at `A` er kommentert ut, betyr det at problemet ligger i `A`。

Hvis problemet fortsatt finnes etter at `A` er kommentert ut, kan vi kommentere ut `B`，og slik fortsette til vi finner problemet.

I utviklingsprosessen møter vi mange problemer, og ofte må vi bruke kommentarer til å undersøke årsaken. Det hjelper oss med å finne den problematiske koden og lokalisere BUG-en.

I Xcode kan du bruke hurtigtasten:

```
Command ⌘ + /
```

for raskt å legge til eller fjerne kommentarer.

### 2. Importer SwiftUI-rammeverket

```swift
import SwiftUI
```

Denne koden betyr at vi importerer SwiftUI-rammeverket.

Typer som `View`、`Text`、`Image` og `VStack` i SwiftUI kommer alle fra dette rammeverket.

Hvis du ikke importerer SwiftUI-rammeverket, vil Xcode gi feil:

```
Cannot find type 'View' in scope
```

Det betyr at kompilatoren ikke kan gjenkjenne typen `View`。

### 3. View-struktur

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Første gang du ser denne `View`-strukturen, kan den virke fremmed, fordi den inneholder nøkkelord som `struct`、`View`、`var`、`body` og `some`。

Vi har ikke lært disse nøkkelordene ennå. For øyeblikket trenger du bare å vite at denne koden betyr at det opprettes en View med navnet `ContentView`。

Du kan forstå en `View` som et tegnebrett som vi kan tegne på, og tegneverktøyet er SwiftUI.

For eksempel:

![Swift](../../RESOURCE/002_view.png)

Bildet over viser tre sider, som i praksis er tre forskjellige Views.

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

Når vi utvikler apper med SwiftUI, er hver side en `View`。

### 4. SwiftUI-kode

I View-en vises SwiftUI-koden:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

I denne koden betyr det at vi viser en vertikalt sortert beholder, og inne i beholderen vises et ikon og en tekst.

`Image` kan vise `SF Symbols`-ikoner, og modifikatorer kan brukes til å styre ikonets størrelse og farge.

`Text`-visningen kan vise tekstinnhold.

`padding` er marg, og legger til et gjennomsiktig område rundt visningen.

Til slutt har vi `#Preview`-forhåndsvisningen, som kan vise forhåndsvisningsvisningen i Canvas.

### Øvelse etter timen

For nybegynnere kan innholdet i denne leksjonen være ganske komplisert. Vi kan bruke videre øving for å få en dypere forståelse av kunnskapen vi har lært:

- endre navnet på `SF Symbols`-ikonet
- endre ikonets forgrunnsfarge til svart
- bytt ut `VStack` med `HStack`
- kommenter ut `Image` eller `Text`，og observer hvordan forhåndsvisningen endres

### Ekstra: kodefullføring（Code Completion）

Når du skriver kode, har du kanskje allerede lagt merke til at Xcode automatisk viser en liste med tilgjengelige alternativer.

For eksempel, når vi endrer modifikatoren `imageScale`：

```swift
.imageScale(.)
```

vil Xcode vise de tilgjengelige alternativene:

![Swift](../../RESOURCE/002_view10.png)

Dette hører til kodefullføringsmekanismen（Code Completion）. Den er basert på typeinferens og forslag til enum-medlemmer, og kan øke skrivehastigheten og redusere feil.

I senere leksjoner kommer vi til å introdusere enum offisielt. Foreløpig holder det å få en enkel forståelse av dette.

Denne SwiftUI-koden betyr at dette er en vertikal layout som viser et ikon og en tekst.

![Swift](../../RESOURCE/002_view1.png)

#### `VStack`-layout

```swift
VStack { }  // vertikal layout
```

`VStack` betyr en vertikal layoutbeholder. Visningene inni arrangeres fra topp til bunn.

![Swift](../../RESOURCE/002_view8.png)

Tre vanlige layouttyper i SwiftUI:

- `VStack` —— vertikal sortering
- `HStack` —— horisontal sortering
- `ZStack` —— overlappende sortering（Z-akse）

```swift
HStack { }  // horisontal sortering
ZStack { }  // overlappende sortering
```

Illustrasjon av sorteringen:

![Swift](../../RESOURCE/002_view2.png)

For eksempel: bruk `HStack` for horisontal sortering.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Da ser vi at jordklodeikonet og teksten vises side om side horisontalt.

![Swift](../../RESOURCE/002_view3.png)

Når vi vil ordne noe horisontalt, bruker vi `HStack`。Når vi trenger overlappende sortering, bruker vi `ZStack`。

#### `Image` og `SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Denne koden viser et jordklodeikon, og ikonet kommer fra Apples ikonsystem `SF Symbols`。

![Swift](../../RESOURCE/002_view9.png)

Betydningen av koden er at vi viser et jordklodeikon, i stor størrelse, med aksentfarge.

Vi kan ikke bare vise et jordklodeikon, men også andre ikoner.

For eksempel et ryggsekkikon:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Hvordan viser vi andre ikoner?**

Vi må bruke Apples offisielle systemikonbibliotek `SF Symbols`。

Åpne Apple Developer-nettstedet og last ned [SF Symbols](https://developer.apple.com/sf-symbols/)。

![Swift](../../RESOURCE/002_sf.png)

Åpne `SF Symbols`-appen.

![Swift](../../RESOURCE/002_sf1.png)

Til venstre ser du symbolkategorier, og til høyre de tilsvarende ikonene.

Høyreklikk på et ikon og velg "Copy Name". Navnet er den tilsvarende strengverdien.

For eksempel:

```
"globe"
"backpack"
"heart"
```

Når du setter det kopierte ikonnavnet inn i `Image(systemName:)`，kan du vise ulike ikoner.

Merk: Hvert `SF Symbols`-ikon har en minimum støttet systemversjon. Hvis systemversjonen er for lav, vises kanskje ikke ikonet. Du må se kompatibilitetsinformasjonen i `SF Symbols`-appen.

#### Modifikatorer

I SwiftUI er en modifikator（modifier）en metode som brukes til å endre utseendet eller oppførselen til en View.

Du kan forstå modifikatorer som klær. Med forskjellige klær ser ting forskjellig ut.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` og `foregroundStyle` er modifikatorer for `Image`-visningen, og de endrer `Image` uten å endre selve innholdet.

**1. `imageScale`**

```swift
.imageScale(.large)
```

Den kan kontrollere størrelsen på `SF Symbols`-ikoner:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Vi kan endre ulike alternativer for å vise `SF Symbols` i forskjellige størrelser.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` kan kontrollere forgrunnsfargen.

`.tint` betyr aksentfargen i det nåværende miljøet, som som standard er blå på iOS.

Hvis vi vil endre forgrunnsfargen til rød:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### `Text`-visning

`Text` er en tekstvisning og brukes til å vise strenger.

```swift
Text("Hello, world!")
```

For eksempel kan vi vise navnet mitt:

```swift
Text("FangJunyu")
```

Merk: Strenger må omsluttes av doble anførselstegn `""`。

Du kan prøve å vise navnet ditt, telefonnummeret ditt og annet innhold.

#### `padding`-marg

I SwiftUI brukes `padding` til å legge til tomrom mellom innholdet i en visning og grensene rundt den. Det tilhører “indre marg（padding / content inset）”。

```swift
HStack {
    ...
}
.padding()
```

Koden ovenfor betyr at standard systemmargin legges til på `HStack`-visningen.

**Hva er `padding`?**

`padding` betyr “det tomme området mellom innholdet i en visning og dens grenser”。

I figuren under vil det blå området trekke seg innover etter at `padding` er satt på den blå `HStack`-en, og det vil se ut som om den “blir litt mindre”.

![Swift](../../RESOURCE/002_view6.png)

**Standardmargin**

Modifikatoren `padding()` bruker systemets anbefalte standardavstand som standard.

```swift
.padding()
```

Denne verdien kan variere mellom ulike plattformer og kontekster, for eksempel:

- På iOS er den vanligvis rundt `16 pt`。
- På macOS eller watchOS kan systemets standardavstand være annerledes, ofte større eller mindre, avhengig av designretningslinjene for plattformen.

**Tilpasset margin**

Vi kan også sette spesifikke marginer for en visning.

1. Sett én retning

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Forklaring av retninger:

- `.top`: toppmargin
- `.bottom`: bunnmargin
- `.leading`: forkant
- `.trailing`: bakkant

![Swift](../../RESOURCE/002_view12.png)

Merk: `leading` og `trailing` tilpasses automatisk språkretningen. I for eksempel arabisk（RTL）vil de snus automatisk.

2. Sett flere retninger

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Du kan bruke en matrise til å angi flere retninger samtidig. Den konkrete bruken av matriser vil bli forklart mer detaljert senere. Her trenger du bare å kjenne til denne skrivemåten.

3. Sett horisontal eller vertikal retning

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Tilsvarer:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Fjern margin**

Hvis du ikke vil ha noen margin, kan du bruke `.padding(0)` for å fjerne den:

```swift
.padding(0)
```

Eller du kan bare slette `padding`-modifikatoren direkte:

```swift
// .padding()
```

### 6. `#Preview`-forhåndsvisningskode

```swift
#Preview {
    ContentView()
}
```

Denne koden betyr at en forhåndsvisning av `ContentView` opprettes i Canvas.

Merk: `#Preview` er en ny syntaks introdusert i Swift 5.9 / Xcode 15. Før dette brukte man en `PreviewProvider`-struktur.

**Hva skjer hvis `Preview` kommenteres ut?**

Hvis `Preview` kommenteres ut:

```swift
// #Preview {
//    ContentView()
// }
```

vil Canvas ikke lenger vise forhåndsvisbart innhold.

![Swift](../../RESOURCE/002_xcode.png)

Dette er fordi `#Preview` styrer hva Canvas skal vise som forhåndsvisning.

Når vi trenger å forhåndsvise en SwiftUI-visning i Xcode, legger vi til `#Preview`-koden. Hvis vi ikke trenger forhåndsvisning, kan vi kommentere ut eller slette `#Preview`。

## Oppsummering

Selv om `ContentView.swift` ikke inneholder mye kode, dekker den faktisk flere sentrale begreper i SwiftUI. For nybegynnere kan denne koden virke fremmed, men ved å bryte ned strukturen kan vi få en første forståelse av SwiftUI.

La oss oppsummere det vi lærte i denne leksjonen. Først lærte vi kommentarer med `//`，som kan brukes til å forklare kodelogikk eller midlertidig slå av kode.

Deretter så vi at SwiftUI-filer må importere SwiftUI-rammeverket:

```swift
import SwiftUI
```

Hvis rammeverket ikke importeres, vil kompilatoren ikke kunne gjenkjenne typer som `View`。

Så ble vi kjent med den grunnleggende strukturen til en SwiftUI-visning:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Der `ContentView` er navnet på visningen.

Vi lærte også tre vanlige layoutbeholdere: `VStack`（vertikal sortering）, `HStack`（horisontal sortering）og `ZStack`（overlappende sortering）。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```
