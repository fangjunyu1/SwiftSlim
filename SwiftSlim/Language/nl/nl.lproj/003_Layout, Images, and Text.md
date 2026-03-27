# Layout, afbeeldingen en tekst

In de vorige les hebben we de code van `ContentView` geleerd:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

In deze les leren we het standaard layoutmechanisme van SwiftUI en hoe afbeeldingen en tekst worden gebruikt. Op basis van de vorige les zullen we de structuur en weergave van views verder begrijpen. Deze kennis helpt ons om basislay-outs voor interfaces op te bouwen.

## Het standaard layoutmechanisme van SwiftUI

Wanneer we `ContentView` voorvertonen, zien we dat het icoon en de tekst in het midden zijn uitgelijnd, in plaats van dat ze bovenaan beginnen.

![Swift](../../RESOURCE/003_view.png)

Standaard is de uitlijning van een `Stack`-container `.center`，dus subviews worden meestal gecentreerd weergegeven.

### `Alignment`-uitlijning

Het is duidelijk dat gecentreerde uitlijning slechts één soort uitlijning is. Als we links of rechts willen uitlijnen, moeten we `alignment` gebruiken om de uitlijning van de view te regelen.

```swift
alignment
```

In SwiftUI komt uitlijning meestal voor in twee situaties:

**1. De uitlijningsparameter van een `Stack`-container**

Bijvoorbeeld, links uitgelijnde iconen en tekst in `ContentView`：

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

De `alignment` van `VStack` regelt de uitlijning in horizontale richting.

Uitlijningsopties:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` is horizontale rangschikking, en `alignment` regelt daar de uitlijning in verticale richting:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` is overlappende rangschikking, en `alignment` kan zowel de horizontale als de verticale uitlijning regelen:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Als `alignment` niet expliciet wordt opgegeven, gebruiken `VStack`、`HStack` en `ZStack` standaard `.center`。

**2. De `alignment` binnen `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Wanneer de afmeting die `frame` geeft groter is dan de eigen afmeting van de view, bepaalt `alignment` waar de view binnen het `frame` wordt geplaatst. De specifieke toepassing van `frame` komt later nog uitgebreider aan bod, hier hoef je het alleen even kort te kennen.

### `Spacer` en het mechanisme van ruimteverdeling

`alignment` kan ervoor zorgen dat views horizontaal of verticaal worden gerangschikt. Maar als we tekst en afbeeldingen aan beide uiteinden willen tonen, is één uitlijningsmethode niet voldoende.

Bijvoorbeeld, als we een bovenste view willen maken zoals op de [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/)-website, met links het NHK-logo en rechts een pictogram voor de inhoudslijst.

![Swift](../../RESOURCE/003_alignment3.png)

Als we alleen `alignment` gebruiken, zullen zowel het NHK-logo als het inhoudsicoon slechts aan één kant worden weergegeven. Het is dan niet mogelijk om twee iconen links en rechts te verdelen. Daarom hebben we `Spacer` nodig om de resterende ruimte te verdelen.

`Spacer` is een flexibele layoutview die automatisch de resterende ruimte opvult.

Gebruik:

```swift
Spacer()
```

Bijvoorbeeld:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Wanneer we `Spacer` toevoegen tussen `Image` en `Text`，zal `Spacer` de resterende ruimte vullen en `Image` en `Text` respectievelijk naar boven en beneden duwen.

![Swift](../../RESOURCE/003_view1.png)

Als er meerdere `Spacer`-views zijn:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

wordt de resterende ruimte gelijkmatig verdeeld over de `Spacer`-views.

![Swift](../../RESOURCE/003_spacer.png)

## Weergave en groottebeheer van `Image`

De `Image`-view wordt hoofdzakelijk gebruikt om afbeeldingen weer te geven. De `SF Symbols`-iconen uit de vorige les zijn slechts één toepassing van `Image`。

Gebruik:

```swift
Image("imageName")
```

De tekst tussen dubbele aanhalingstekens in `Image` is de naam van de afbeelding. Je hoeft de extensie niet te schrijven.

### Een afbeelding weergeven

Laten we eerst een afbeelding voorbereiden.

![Swift](../../RESOURCE/003_img.jpg)

Selecteer in Xcode de resource-map `Assets` en sleep de afbeelding naar `Assets`。

![Swift](../../RESOURCE/003_img1.png)

Gebruik vervolgens `Image` in `ContentView` om de afbeelding weer te geven:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Let op: `Image` in SwiftUI ondersteunt geen GIF-animaties（alleen een statisch frame wordt weergegeven）。

### De afbeeldingsgrootte regelen

In SwiftUI wordt `Image` standaard weergegeven in de originele grootte. Als we de weergegeven grootte willen aanpassen, moeten we eerst `resizable` gebruiken om de inhoud schaalbaar te maken en daarna `frame` gebruiken om de layoutgrootte te specificeren.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### De `resizable`-modifier

Met de `resizable`-modifier kan een afbeelding meeschalen in de layout, in plaats van vast te blijven op de oorspronkelijke grootte.

```swift
.resizable()
```

Alleen nadat `resizable()` is toegevoegd, kan `frame` de weergegeven grootte van de afbeelding echt veranderen.

Als `resizable` wordt weggelaten:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

zal `frame` alleen layoutruimte voor de afbeelding aanbieden, maar verandert de grootte van de afbeelding zelf niet.

### De `frame`-modifier

`frame(width:height)` wordt gebruikt om de breedte en hoogte van een view aan te geven.

Basisgebruik:

```swift
.frame(width: 10,height: 10)
```

Bijvoorbeeld, stel de afbeelding in op een rechthoek met `width` 300 en `height` 100。

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Je kunt ook alleen de breedte of alleen de hoogte instellen:

```swift
.frame(width: 200)
.frame(height: 100)
```

De combinatie `resizable + frame` maakt het mogelijk om de grootte van afbeeldingen in de interface flexibel te regelen, terwijl ze schaalbaar blijven.

### Schaalverhouding: `scaledToFit` en `scaledToFill`

Wanneer de breedte-hoogteverhouding van `frame` niet overeenkomt met die van de afbeelding, kan de afbeelding uitgerekt en vervormd worden.

Als we de verhouding van de afbeelding willen behouden en tegelijkertijd de beschikbare lay-outruimte willen benutten, kunnen we `scaledToFit` of `scaledToFill` gebruiken.

**`scaledToFit`**

`scaledToFit` behoudt de oorspronkelijke breedte-hoogteverhouding van de afbeelding en schaalt deze zodat zij volledig binnen de beschikbare ruimte past, zonder de afbeelding bij te snijden:

```swift
.scaledToFit()
```

of

```swift
.aspectRatio(contentMode: .fit)
```

Deze manier is geschikt wanneer je de hele afbeelding volledig wilt tonen zonder vervorming.

Als elke afbeelding met dezelfde breedte en hoogte wordt ingesteld, is het vrijwel onvermijdelijk dat sommige afbeeldingen uitgerekt raken.

Bijvoorbeeld:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Wanneer de schaalverhouding niet is ingesteld, kan de afbeelding niet in haar oorspronkelijke verhouding worden weergegeven.

![Swift](../../RESOURCE/003_img4.png)

Door `scaledToFit` in te stellen behoudt de afbeelding haar oorspronkelijke verhouding.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` behoudt ook de verhouding van de afbeelding, maar vult de hele beschikbare ruimte op. Als de verhoudingen niet overeenkomen, wordt het overtollige deel afgesneden:

```swift
.scaledToFill()
```

of

```swift
.aspectRatio(contentMode: .fill)
```

Deze manier is geschikt wanneer je wilt dat een afbeelding het hele gebied bedekt, bijvoorbeeld als achtergrond of banner. Het is vooral nuttig wanneer de afbeelding als achtergrond wordt gebruikt.

**Verschil tussen de twee**

![Swift](../../RESOURCE/003_img6.png)

## Tekst

In SwiftUI wordt `Text` gebruikt om tekst weer te geven.

Basisgebruik:

```swift
Text("FangJunyu")
```

We hebben `Text` al in de vorige les geleerd. In deze les gaan we verder met het regelen van lettergrootte en -dikte, zodat tekst visueel expressiever wordt in een view.

### Lettergrootte

Met de modifier `font` kun je de grootte van tekst regelen:

```swift
.font(.title)
```

Bijvoorbeeld:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Veelgebruikte lettergroottes（van groot naar klein）：

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Letterdikte

Als je tekst vetter wilt maken, kun je de modifier `fontWeight` gebruiken:

```swift
.fontWeight(.bold)
```

Bijvoorbeeld:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Veelgebruikte letterdiktes（van dun naar dik）：

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` regelt de lettergrootte en `fontWeight` regelt de letterdikte. Deze twee kunnen samen worden gebruikt om de expressiviteit van tekst te verrijken.

## Samenvatting en praktijk

Tot nu toe hebben we de standaardlayout van SwiftUI, `Spacer`、`Image` en `Text` en andere basiskennis geleerd. Deze inhoud is al voldoende om enkele eenvoudige views te ontwikkelen.

Bijvoorbeeld: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

De interface van Google is erg schoon. Het bevat afbeeldingen en tekst, en we kunnen proberen de interfacestructuur van Google vanuit het perspectief van SwiftUI te analyseren:

1. Het geheel bestaat uit drie delen: het Google-logo, het zoekvak en de hinttekst. Hiervoor kunnen we `VStack` gebruiken om verticaal te rangschikken.
2. Het Google-logo is een afbeelding en kan met `Image` worden weergegeven.
3. Het zoekvak bevat een invoerveld en een icoon. Als we het invoerveld buiten beschouwing laten, kunnen we `Image` gebruiken om het zoekicoon weer te geven.
4. De hinttekst kan met `Text` worden weergegeven, voor horizontale rangschikking van tekst kan `HStack` worden gebruikt, en de tekstkleur kan met `foregroundStyle` worden geregeld.

Door deze kennis te oefenen, kunnen we enkele eenvoudige views maken en ons begrip van `Image`、`Text` en hun modifiers verdiepen.
