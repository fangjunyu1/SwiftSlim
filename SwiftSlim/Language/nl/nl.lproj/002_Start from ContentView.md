# Beginnen met ContentView

## Voorbereiding

In deze les beginnen we met het bestand `ContentView.swift` en maken we systematisch kennis met de basisstructuur van SwiftUI, waaronder:

- opmerkingen
- de View-structuur
- `VStack` / `HStack` / `ZStack`-layouts
- `SF Symbols`-iconen
- view-modifiers（modifier）
- voorvertoningscode `#Preview`

Zoek eerst het Xcode-project dat je eerder hebt gemaakt en dubbelklik op het `.xcodeproj`-bestand.

Selecteer vervolgens het bestand `ContentView.swift` in het Navigator-gebied aan de linkerkant.

Let op: elke keer dat je het project opent, kan Canvas "Preview paused" tonen. Klik op de vernieuwknop om de voorvertoning te herstellen.

![Swift](../../RESOURCE/002_view7.png)

## Kennismaken met ContentView

De code van `ContentView`：

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

Hoewel er weinig code staat, bevat dit wel de kernstructuur van SwiftUI.

### 1. Opmerkingen

Bovenaan het bestand:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Dit zijn bestandsopmerkingen, die worden gebruikt om bestandsinformatie vast te leggen, waaronder de bestandsnaam, projectnaam, maker en aanmaaktijd.

In Swift gebruik je `//` voor opmerkingen op één regel:

```swift
// Dit is een opmerking
```

Opmerkingen kunnen de leesbaarheid van code verbeteren en ontwikkelaars helpen de logica te begrijpen.

In echte ontwikkeling kan code lastig te begrijpen zijn. Als je geen opmerkingen schrijft, kun je na drie dagen al je eigen code niet meer begrijpen.

Daarom is het een goede ontwikkelgewoonte om tijdens het schrijven actief opmerkingen toe te voegen. Gebruik opmerkingen om de logica van de code vast te leggen, zodat later onderhoud eenvoudiger wordt.

**Code tijdelijk uitschakelen**

Opmerkingen kunnen ook worden gebruikt om code tijdelijk uit te schakelen en zo problemen te onderzoeken.

Bijvoorbeeld:

```
A
B
C
```

`A`、`B` en `C` zijn drie codeblokken, waarvan er één een fout bevat. We kunnen tijdelijk commentaar gebruiken om ze uit te schakelen en het probleem op te sporen.

Voeg eerst een opmerking toe aan `A`：

```
// A
B
C
```

Als de code weer normaal werkt nadat `A` is uitgeschakeld, betekent dat dat het probleem in `A` zit.

Als het probleem nog steeds bestaat nadat `A` is uitgeschakeld, kunnen we `B` uitschakelen, en zo verder, totdat we de problematische code vinden.

Tijdens ontwikkeling komen we veel problemen tegen, en meestal moeten we met opmerkingen code uitschakelen om de oorzaak te achterhalen. Dat helpt ons om de foutcode te lokaliseren en de BUG te vinden.

In Xcode kun je de sneltoets gebruiken:

```
Command ⌘ + /
```

om snel opmerkingen toe te voegen of te verwijderen.

### 2. Het SwiftUI-framework importeren

```swift
import SwiftUI
```

Deze code betekent dat we het SwiftUI-framework importeren.

Typen zoals `View`、`Text`、`Image` en `VStack` in SwiftUI komen allemaal uit dit framework.

Als je het SwiftUI-framework niet importeert, zal Xcode een fout geven:

```
Cannot find type 'View' in scope
```

Dat betekent dat de compiler het type `View` niet kan herkennen.

### 3. De View-structuur

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

De eerste keer dat je deze View-structuur ziet, kan die vreemd aanvoelen, omdat hij sleutelwoorden bevat zoals `struct`、`View`、`var`、`body` en `some`。

We hebben deze sleutelwoorden nu nog niet geleerd. Voorlopig hoef je alleen te weten dat deze code betekent dat er een View met de naam `ContentView` wordt gemaakt.

Je kunt een View zien als een tekenbord waarop we kunnen tekenen, en het tekengereedschap is SwiftUI.

Bijvoorbeeld:

![Swift](../../RESOURCE/002_view.png)

De afbeelding hierboven toont drie pagina's, en in feite zijn dat drie Views.

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

Wanneer we een app ontwikkelen met SwiftUI, is elke pagina een View.

### 4. SwiftUI-code

Binnen de View wordt SwiftUI-code weergegeven:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Deze SwiftUI-code betekent dat dit een verticale layout is waarin een icoon en een tekst worden weergegeven.

![Swift](../../RESOURCE/002_view1.png)

#### `VStack`-layout

```swift
VStack { }  // verticale layout
```

`VStack` betekent een verticale layoutcontainer. De views binnenin worden van boven naar beneden gerangschikt.

![Swift](../../RESOURCE/002_view8.png)

Drie veelvoorkomende layouts in SwiftUI:

- `VStack` —— verticale rangschikking
- `HStack` —— horizontale rangschikking
- `ZStack` —— overlappende rangschikking（Z-as）

```swift
HStack { }  // horizontale rangschikking
ZStack { }  // overlappende rangschikking
```

Schematische weergave van de rangschikking:

![Swift](../../RESOURCE/002_view2.png)

Bijvoorbeeld: gebruik `HStack` voor horizontale rangschikking.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Je ziet dat het aardbolicoon en de tekst horizontaal naast elkaar worden weergegeven.

![Swift](../../RESOURCE/002_view3.png)

Als we horizontaal willen rangschikken, gebruiken we `HStack`。Als we overlappend willen rangschikken, gebruiken we `ZStack`。

#### `Image` en `SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Deze code toont een aardbolicoon. Dit icoon komt uit het iconensysteem `SF Symbols` van Apple.

![Swift](../../RESOURCE/002_view9.png)

De betekenis van de code is dat een aardbolicoon wordt weergegeven, in groot formaat en met accentkleur.

We kunnen niet alleen een aardbol tonen, maar ook andere iconen.

Bijvoorbeeld een rugzak:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Hoe toon je andere iconen?**

We moeten daarvoor de officiële systeembibliotheek met iconen van Apple gebruiken: `SF Symbols`。

Open de officiële Apple Developer-website en download [SF Symbols](https://developer.apple.com/sf-symbols/)。

![Swift](../../RESOURCE/002_sf.png)

Open de `SF Symbols`-app.

![Swift](../../RESOURCE/002_sf1.png)

Links staan de symboolcategorieën, rechts de bijbehorende iconen.

Klik met de rechtermuisknop op een icoon en kies "Copy Name". De naam is de bijbehorende tekenreeks.

Bijvoorbeeld:

```
"globe"
"backpack"
"heart"
```

Plaats de gekopieerde iconenaam in `Image(systemName:)`，en dan kun je verschillende iconen weergeven.

Let op: elk `SF Symbols`-icoon heeft een minimale ondersteunde systeemversie. Als de systeemversie te laag is, wordt het icoon mogelijk niet weergegeven. Controleer de compatibiliteitsinformatie in de `SF Symbols`-app.

#### Modifiers

In SwiftUI is een modifier（modifier）een methode die wordt gebruikt om het uiterlijk of gedrag van een view te veranderen.

Je kunt modifiers begrijpen als kleding. Met andere kleding ziet iets er ook anders uit.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` en `foregroundStyle` zijn modifiers van de `Image`-view. Zonder de inhoud van `Image` te veranderen, passen ze de view visueel aan.

**1. `imageScale`**

```swift
.imageScale(.large)
```

Hiermee kun je de grootte van `SF Symbols`-iconen regelen:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

We kunnen verschillende opties kiezen om `SF Symbols` op verschillende groottes te tonen.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` kan de voorgrondkleur regelen.

`.tint` betekent de accentkleur van de huidige omgeving, die op iOS standaard blauw is.

Als we de voorgrondkleur rood willen maken:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### `Text`-view

`Text` is een tekstview en wordt gebruikt om strings weer te geven.

```swift
Text("Hello, world!")
```

Bijvoorbeeld, mijn naam weergeven:

```swift
Text("FangJunyu")
```

Let op: strings moeten tussen dubbele aanhalingstekens `""` staan.

Je kunt proberen je eigen naam, telefoonnummer of andere inhoud weer te geven.

#### `padding`-marge

In SwiftUI wordt `padding` gebruikt om lege ruimte toe te voegen tussen de inhoud van een view en de rand ervan. Het behoort tot de “binnenmarge（padding / content inset）”。

```swift
HStack {
    ...
}
.padding()
```

De bovenstaande code betekent dat een standaard systeemmarge wordt toegevoegd aan de `HStack`-view.

**Wat is `padding`?**

`padding` betekent “de lege ruimte tussen de inhoud van een view en de rand ervan”。

In de afbeelding hieronder zal, nadat `padding` is ingesteld op de blauwe `HStack`，het blauwe gebied naar binnen krimpen, waardoor het lijkt alsof het “een maat kleiner” wordt.

![Swift](../../RESOURCE/002_view6.png)

**Standaardmarge**

De modifier `padding()` gebruikt standaard de aanbevolen standaardafstand van het systeem.

```swift
.padding()
```

Op verschillende platformen en in verschillende contexten kan deze waarde verschillen, bijvoorbeeld:

- Op iOS is dit meestal ongeveer `16 pt`。
- Op macOS of watchOS kan de standaardafstand van het systeem anders zijn, meestal groter of kleiner, afhankelijk van de ontwerprichtlijnen van het platform.

**Aangepaste marge**

Je kunt ook afzonderlijke marges instellen voor een view.

1. Eén richting instellen

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Uitleg van de richtingen:

- `.top`: bovenmarge
- `.bottom`: ondermarge
- `.leading`: voorzijde
- `.trailing`: achterzijde

![Swift](../../RESOURCE/002_view12.png)

Let op: `leading` en `trailing` passen zich automatisch aan de taalrichting aan. In bijvoorbeeld een Arabische（RTL）omgeving worden ze automatisch omgekeerd.

2. Meerdere richtingen instellen

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Je kunt een array gebruiken om meerdere richtingen tegelijk te specificeren. Het exacte gebruik van arrays wordt in latere tutorials uitgebreider uitgelegd. Hier hoef je alleen deze schrijfwijze te kennen.

3. Horizontale of verticale richting instellen

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Dit is equivalent aan:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Marge verwijderen**

Als je helemaal geen marge wilt, kun je `.padding(0)` gebruiken om deze te verwijderen:

```swift
.padding(0)
```

Of je verwijdert de `padding`-modifier gewoon direct:

```swift
// .padding()
```

### 6. `#Preview`-voorvertoningscode

```swift
#Preview {
    ContentView()
}
```

Deze code betekent dat er in Canvas een voorvertoning van `ContentView` wordt gegenereerd.

Let op: `#Preview` is nieuwe syntaxis die is geïntroduceerd in Swift 5.9 / Xcode 15. Daarvoor werd `PreviewProvider` gebruikt.

**Wat gebeurt er als `Preview` wordt uitgecommentarieerd?**

Als `Preview` wordt uitgecommentarieerd:

```swift
// #Preview {
//    ContentView()
// }
```

zal Canvas geen renderbare inhoud meer weergeven.

![Swift](../../RESOURCE/002_xcode.png)

Dit komt doordat `#Preview` bepaalt welke voorvertoningsview Canvas toont.

Wanneer we een SwiftUI-view in Xcode willen voorvertonen, voegen we `#Preview`-code toe. Als we geen voorvertoning nodig hebben, kunnen we de `#Preview`-code uitcommentariëren of verwijderen.

## Samenvatting

Hoewel het bestand `ContentView.swift` niet veel code bevat, dekt het in feite meerdere kernconcepten van SwiftUI. Voor beginners kan deze code vreemd aanvoelen, maar door de structuur op te splitsen, kun je een eerste begrip van SwiftUI opbouwen.

Kijkend naar de inhoud van deze les, leerden we eerst opmerkingen met `//`，die gebruikt kunnen worden om codelogica uit te leggen of code tijdelijk uit te schakelen.

Daarna zagen we dat SwiftUI-bestanden het SwiftUI-framework moeten importeren:

```swift
import SwiftUI
```

Als je het framework niet importeert, kan de compiler typen zoals `View` niet herkennen.

Vervolgens maakten we kennis met de basisstructuur van een SwiftUI-view:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Daarin is `ContentView` de naam van de view.

We leerden ook drie veelvoorkomende layoutcontainers: `VStack`（verticale rangschikking）, `HStack`（horizontale rangschikking）en `ZStack`（overlappende rangschikking）。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Deze code betekent dat een verticaal gerangschikte container wordt weergegeven, met daarin een icoon en een tekst.

`Image` kan `SF Symbols`-iconen tonen, en modifiers regelen de grootte en kleur van het icoon.

De `Text`-view kan tekstinhoud weergeven.

`padding` is marge en voegt een transparante ruimte rond de view toe.

Ten slotte is er de `#Preview`-voorvertoning, waarmee de voorvertoningsview in Canvas kan worden weergegeven.

### Oefening na de les

Voor beginners kan de inhoud van deze les best complex zijn. Door verder te oefenen kunnen we ons begrip van deze kennis verdiepen:

- verander de naam van een `SF Symbols`-icoon
- verander de voorgrondkleur van het icoon naar zwart
- verander `VStack` in `HStack`
- zet `Image` of `Text` in commentaar en kijk hoe de voorvertoning verandert

### Extraatje: codeaanvulling（Code Completion）

Tijdens het invoeren van code is het je misschien al opgevallen dat Xcode automatisch een lijst met beschikbare opties toont.

Bijvoorbeeld, wanneer we de `imageScale`-modifier aanpassen:

```swift
.imageScale(.)
```

zal Xcode de beschikbare opties tonen:

![Swift](../../RESOURCE/002_view10.png)

Dit behoort tot het mechanisme van codeaanvulling（Code Completion）. Het is gebaseerd op type-inferentie en suggesties voor enum-leden, en kan de invoerefficiëntie verhogen en fouten verminderen.

In latere lessen zullen we enum officieel introduceren. Voor nu is een eenvoudige kennismaking voldoende.
