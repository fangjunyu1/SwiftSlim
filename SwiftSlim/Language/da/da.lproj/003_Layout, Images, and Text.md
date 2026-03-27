# Layout, billeder og tekst

I sidste lektion lærte vi koden i `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

I denne lektion lærer vi SwiftUIs standardlayoutmekanisme samt hvordan man bruger billeder og tekst. På grundlag af sidste lektion vil vi få en dybere forståelse af views' struktur og visningsmåde, og denne viden kan hjælpe os med at bygge grundlæggende interface-layouts.

## SwiftUIs standardlayoutmekanisme

Når vi forhåndsviser `ContentView`, kan vi se, at ikonet og teksten vises centreret i stedet for at starte fra toppen.

![Swift](../../RESOURCE/003_view.png)

Som standard er justeringen i en `Stack`-container `.center`, så underliggende visninger vil normalt fremstå centrerede.

### Alignment

Det er tydeligt, at centreret justering kun er én slags justering. Hvis vi vil venstre- eller højrejustere, skal vi bruge `alignment` til at styre justeringen af visningen.

```swift
alignment
```

I SwiftUI optræder justering typisk i to situationer:

**1. Justeringsparameter i Stack-containere**

For eksempel kan ikonet og teksten i `ContentView` venstrejusteres:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

I `VStack` styrer `alignment` den vandrette justering.

Justeringsmåder:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` er en vandret sortering, så `alignment` styrer den lodrette justering:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` er overlejret sortering, og `alignment` kan styre både vandret og lodret justering:

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

Hvis `alignment` ikke angives eksplicit, bruger `VStack`, `HStack` og `ZStack` som standard `.center`.

**2. alignment inde i frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Når størrelsen, som `frame` giver, er større end viewets egen størrelse, afgør `alignment`, hvor viewet placeres inde i denne `frame`. Den konkrete brug af `frame` forklares mere senere; her er det nok blot at kende den overordnet.

### Spacer og mekanismen for pladsfordeling

`alignment` kan få visninger til at blive vist sorteret vandret eller lodret. Men hvis vi ønsker, at tekst og billeder skal vises i hver sin ende, er en enkelt justering ikke nok.

For eksempel hvis vi vil lave topområdet på [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/)-webstedet, hvor NHK-logoet er til venstre, og menuikonet er til højre.

![Swift](../../RESOURCE/003_alignment3.png)

Hvis vi kun bruger `alignment`, vil begge ikoner kun vises på samme side. Vi kan ikke fordele dem til venstre og højre side hver for sig. Derfor har vi brug for `Spacer` til at fordele den resterende plads.

`Spacer` er et fleksibelt layout-view, som automatisk fylder den resterende plads ud.

Brug:

```swift
Spacer()
```

For eksempel:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Når vi indsætter `Spacer` mellem `Image` og `Text`, fylder `Spacer` den resterende plads og skubber `Image` og `Text` op og ned mod hver sin ende.

![Swift](../../RESOURCE/003_view1.png)

Hvis der findes flere `Spacer`s:

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

vil den resterende plads blive fordelt ligeligt mellem dem.

![Swift](../../RESOURCE/003_spacer.png)

## Visning af billeder og styring af størrelse

`Image`-visningen bruges primært til at vise billeder. De SF Symbols-ikoner, vi lærte i sidste lektion, er blot én måde at bruge `Image` på.

Brug:

```swift
Image("imageName")
```

Teksten i anførselstegn er navnet på billedet, og filendelsen skal ikke skrives.

### Vis billede

Først forbereder vi et billede.

![Swift](../../RESOURCE/003_img.jpg)

Vælg ressourcemappen `Assets` i Xcode og træk billedet ind i `Assets`.

![Swift](../../RESOURCE/003_img1.png)

Brug derefter `Image` i `ContentView` til at vise billedet:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Bemærk: SwiftUIs `Image` understøtter ikke afspilning af GIF-animationer. Den kan kun vise en statisk frame.

### Kontroller billedstørrelse

I SwiftUI vises `Image` som standard i billedets oprindelige størrelse. Hvis vi vil ændre størrelsen på det viste billede, skal vi først bruge `resizable`, så billedet kan skaleres, og derefter bruge `frame` til at angive layoutstørrelsen.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable-modifier

Modifieren `resizable` gør det muligt for billedet at blive skaleret i layoutet i stedet for at bruge sin oprindelige størrelse.

```swift
.resizable()
```

Kun når vi har tilføjet `resizable()`, kan `frame` faktisk ændre billedets synlige størrelse.

Hvis vi udelader `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

vil `frame` kun give billedet en layoutplads, men selve billedets størrelse vil ikke ændre sig.

### frame-modifier

`frame(width:height:)` bruges til at angive en visnings bredde og højde.

Grundlæggende brug:

```swift
.frame(width: 10,height: 10)
```

For eksempel kan vi sætte billedet til en rektangelform med en bredde på `300` og en højde på `100`.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Vi kan også sætte bredde eller højde separat:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinationen `resizable + frame` gør det muligt fleksibelt at styre billedets størrelse i interfacet, samtidig med at billedet stadig kan skaleres.

### Skaleringsforhold: scaledToFit og scaledToFill

Når den bredde og højde, vi sætter med `frame`, ikke har samme proportioner som billedet, kan billedet blive strukket og se forvrænget ud.

Hvis vi vil bevare billedets proportioner og samtidig få det til at passe ind i den tilgængelige layoutplads, kan vi bruge `scaledToFit` eller `scaledToFill`.

**scaledToFit**

`scaledToFit` bevarer billedets oprindelige proportioner og skalerer billedet, så det helt passer inden for den tilgængelige plads, uden at billedet bliver beskåret:

```swift
.scaledToFit()
```

eller

```swift
.aspectRatio(contentMode: .fit)
```

Denne metode er velegnet, når vi ønsker at vise hele billedet uden forvrængning.

Hvis alle billeder får den samme bredde og højde, vil nogle af dem uundgåeligt blive strukket.

For eksempel:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Når der ikke er sat et skaleringsforhold, kan billedet ikke længere vises i sine oprindelige proportioner.

![Swift](../../RESOURCE/003_img4.png)

Når vi sætter `scaledToFit`, kan billedet bevare sine oprindelige proportioner.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` kan også bevare billedets proportioner, men det vil fylde hele den tilgængelige plads. Hvis proportionerne ikke passer, vil de overskydende dele blive beskåret:

```swift
.scaledToFill()
```

eller

```swift
.aspectRatio(contentMode: .fill)
```

Denne metode passer godt, når man ønsker, at billedet skal dække hele området, for eksempel som baggrundsbillede eller banner.

**Forskellen mellem de to**

![Swift](../../RESOURCE/003_img6.png)

## Tekst

I SwiftUI bruges `Text` til at vise tekst.

Grundlæggende brug:

```swift
Text("FangJunyu")
```

Vi lærte allerede `Text` i sidste lektion. I denne lektion går vi videre og lærer, hvordan man styrer skriftstørrelse og tykkelse, så teksten bliver mere udtryksfuld i visningen.

### Skriftstørrelse

Vi kan bruge modifieren `font` til at styre tekstens størrelse:

```swift
.font(.title)
```

For eksempel:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Almindelige skriftstørrelser fra stor til lille:

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

### Skriftvægt

Hvis vi vil gøre teksten fed, kan vi bruge modifieren `fontWeight`:

```swift
.fontWeight(.bold)
```

For eksempel:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Almindelige skriftvægte fra tynd til tung:

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

`font` styrer skriftstørrelsen, og `fontWeight` styrer tykkelsen. De to kan bruges sammen for at gøre tekstens udtryk rigere.

## Opsummering og praksis

Indtil nu har vi lært om SwiftUIs standardlayout, `Spacer`, `Image` og `Text` samt anden grundlæggende viden. Det er allerede nok til at udvikle nogle enkle visninger.

For eksempel: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Googles interface er meget rent. Det indeholder billeder og tekst, og vi kan prøve at analysere dets struktur ud fra et SwiftUI-perspektiv:

1. Helheden kan opdeles i tre dele: Google-logo, søgefelt og hjælpetekst. Det kan arrangeres lodret med `VStack`.
2. Google-logoet er et billede og kan vises med `Image`.
3. Søgefeltet indeholder et inputfelt og et ikon. Hvis vi ser bort fra selve inputfeltet, kan søgeikonet vises med `Image`.
4. Hjælpeteksten vises med `Text`, og den vandrette rækkefølge af tekst kan laves med `HStack`. Tekstfarven kan styres med `foregroundStyle`.

Ved at øve disse begreber kan vi bygge nogle enkle visninger og styrke vores forståelse af `Image`, `Text` og deres modifiers.
