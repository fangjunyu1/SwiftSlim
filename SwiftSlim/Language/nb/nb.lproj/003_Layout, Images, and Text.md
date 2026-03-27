# Layout, bilder og tekst

I forrige leksjon lærte vi koden i `ContentView`：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

I denne leksjonen skal vi lære om SwiftUIs standard layoutmekanisme, samt hvordan bilder og tekst brukes. Med utgangspunkt i forrige leksjon skal vi forstå strukturen og visningen av Views enda bedre. Denne kunnskapen støtter oss i å bygge grunnleggende grensesnittoppsett.

## SwiftUIs standard layoutmekanisme

Når vi forhåndsviser `ContentView`, vil vi oppdage at ikonet og teksten er sentrert, og ikke starter øverst.

![Swift](../../RESOURCE/003_view.png)

Som standard er justeringen i en `Stack`-beholder `.center`，så underliggende Views blir vanligvis vist sentrert.

### `Alignment`-justering

Det er tydelig at sentrering bare er én type justering. Hvis vi vil venstrejustere eller høyrejustere, må vi bruke `alignment` til å kontrollere justeringen i en View.

```swift
alignment
```

I SwiftUI dukker justering vanligvis opp i to situasjoner:

**1. Justeringsparameteren i `Stack`-beholderen**

For eksempel, hvis vi vil venstrejustere ikonet og teksten i `ContentView`：

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`alignment` i `VStack` styrer justeringen i horisontal retning.

Justeringsmåter:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` er horisontal sortering, og `alignment` styrer justeringen i vertikal retning:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` er overlappende sortering, og `alignment` kan styre justeringen både horisontalt og vertikalt:

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

Hvis `alignment` ikke angis eksplisitt, bruker `VStack`、`HStack` og `ZStack` `.center` som standard.

**2. `alignment` inne i `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Når størrelsen `frame` gir er større enn selve visningens størrelse, bestemmer `alignment` hvor visningen skal plasseres inne i `frame`。Den konkrete bruken av `frame` skal vi gå nærmere inn på senere, her trenger du bare å kjenne det litt til.

### `Spacer` og mekanismen for plassfordeling

`alignment` kan hjelpe en View å sortere innhold horisontalt eller vertikalt. Men når vi ønsker at tekst og bilder skal stå i hver sin ende, er ikke én enkel justeringsmåte nok.

For eksempel, hvis vi vil lage et toppområde som på [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/)-nettstedet, med NHK-ikonet til venstre og menyikonet til høyre.

![Swift](../../RESOURCE/003_alignment3.png)

Hvis vi bare bruker `alignment`，vil både NHK-ikonet og menyikonet havne på samme side. De kan ikke fordeles til venstre og høyre samtidig. Derfor trenger vi `Spacer` for å fordele den gjenværende plassen.

`Spacer` er en fleksibel visning for layout som automatisk fyller opp den gjenværende plassen.

Brukes slik:

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

Når vi legger til `Spacer` mellom `Image` og `Text`，vil `Spacer` fylle den gjenværende plassen og skyve `Image` og `Text` mot hver sin ende, henholdsvis opp og ned.

![Swift](../../RESOURCE/003_view1.png)

Hvis det finnes flere `Spacer`：

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

vil den gjenværende plassen fordeles jevnt mellom `Spacer`-ene.

![Swift](../../RESOURCE/003_spacer.png)

## Vise bilder og kontrollere størrelse

`Image`-visningen brukes hovedsakelig til å vise bilder. `SF Symbols`-ikonene vi lærte om i forrige leksjon er bare én måte å bruke `Image` på.

Brukes slik:

```swift
Image("imageName")
```

Det som står i anførselstegnene etter `Image` er bildets navn. Du trenger ikke skrive filendelsen.

### Vise et bilde

Først forbereder vi et bilde.

![Swift](../../RESOURCE/003_img.jpg)

Velg ressursmappen `Assets` i Xcode, og dra bildet inn i `Assets`。

![Swift](../../RESOURCE/003_img1.png)

Bruk deretter `Image` i `ContentView` for å vise bildet:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Merk: `Image` i SwiftUI støtter ikke GIF-animasjoner（den viser bare et statisk bilde）。

### Kontrollere bildestørrelse

I SwiftUI vises `Image` som standard i original størrelse. Hvis vi vil endre størrelsen på bildet, må vi først bruke `resizable` for å gjøre bildet skalerbart, og deretter bruke `frame` for å angi layoutstørrelsen.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### `resizable`-modifikatoren

Modifikatoren `resizable` gjør at bildet kan skaleres i layouten, i stedet for å alltid bruke original størrelse.

```swift
.resizable()
```

Bare når `resizable()` er lagt til, kan `frame` faktisk endre størrelsen på bildet som vises.

Hvis `resizable` utelates:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

vil `frame` bare gi bildet layoutplass, mens selve bildestørrelsen ikke endres.

### `frame`-modifikatoren

`frame(width:height)` brukes til å angi bredden og høyden til en View.

Grunnleggende bruk:

```swift
.frame(width: 10,height: 10)
```

For eksempel kan vi sette et bilde til en rektangulær form med bredde `300` og høyde `100`。

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Vi kan også angi bare bredde eller bare høyde:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinasjonen `resizable + frame` gjør det mulig å kontrollere størrelsen på et bilde fleksibelt i grensesnittet, samtidig som det forblir skalerbart.

### Skaleringsforhold: `scaledToFit` og `scaledToFill`

Når forholdet mellom bredde og høyde i `frame` ikke stemmer med bildet, kan bildet bli strukket og se deformert ut.

Hvis vi vil beholde proporsjonene til bildet samtidig som det tilpasses tilgjengelig layoutplass, kan vi bruke `scaledToFit` eller `scaledToFill`。

**`scaledToFit`**

`scaledToFit` beholder bildets opprinnelige forhold mellom bredde og høyde, og skalerer bildet slik at det passer helt inn i tilgjengelig plass, uten å beskjære bildet:

```swift
.scaledToFit()
```

eller

```swift
.aspectRatio(contentMode: .fit)
```

Denne måten passer når du vil vise hele bildet uten deformasjon.

Hvis hvert bilde får samme bredde og høyde, vil det lett oppstå strekte bilder.

For eksempel:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Uten å sette skaleringsforhold kan ikke bildet vises med originale proporsjoner.

![Swift](../../RESOURCE/003_img4.png)

Hvis vi setter `scaledToFit`，kan bildet beholde sine opprinnelige proporsjoner.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` beholder også bildets proporsjoner, men fyller hele det tilgjengelige området. Hvis proporsjonene ikke stemmer, vil den delen som går utenfor området bli beskåret:

```swift
.scaledToFill()
```

eller

```swift
.aspectRatio(contentMode: .fill)
```

Denne måten passer når bildet skal dekke hele området, for eksempel som bakgrunnsbilde eller banner. Den er spesielt egnet når et bilde brukes som bakgrunn.

**Forskjellen mellom de to**

![Swift](../../RESOURCE/003_img6.png)

## Tekst

I SwiftUI brukes `Text` til å vise tekst.

Grunnleggende bruk:

```swift
Text("FangJunyu")
```

Vi lærte om `Text` i forrige leksjon. I denne leksjonen skal vi lære videre hvordan vi kan kontrollere skriftstørrelse og tykkelse, slik at teksten blir mer uttrykksfull i visningen.

### Skriftstørrelse

Vi kan bruke modifikatoren `font` for å kontrollere størrelsen på tekst:

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

Vanlige skriftstørrelser（fra stor til liten）：

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

### Skriftvekt

Hvis vi vil gjøre teksten fetere, kan vi bruke modifikatoren `fontWeight`：

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

Vanlige skriftvekter（fra tynn til tykk）：

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

`font` styrer skriftstørrelsen, og `fontWeight` styrer tykkelsen. De to kan brukes sammen for å gjøre teksten mer uttrykksfull.

## Oppsummering og praksis

Så langt har vi lært om SwiftUIs standardlayout, `Spacer`、`Image` og `Text` og annen grunnleggende kunnskap. Dette er allerede nok til å utvikle noen enkle visninger.

For eksempel: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Googles grensesnitt er veldig rent. Det inneholder bilder og tekst, og vi kan prøve å analysere grensesnittstrukturen fra et SwiftUI-perspektiv:

1. Helheten kan deles inn i tre deler: Google-logoen, søkefeltet og hjelpeteksten. Vi kan bruke `VStack` for vertikal sortering.
2. Google-logoen er et bilde, og kan vises med `Image`。
3. Søkefeltet inneholder et tekstfelt og et ikon. Hvis vi ser bort fra selve tekstfeltet, kan vi bruke `Image` til å vise søkeikonet.
4. Hjelpeteksten kan vises med `Text`，og horisontal sortering av tekst kan gjøres med `HStack`。Tekstfargen kan styres med `foregroundStyle`。

Gjennom å øve på denne kunnskapen kan vi lage noen enkle visninger og få en dypere forståelse av `Image`、`Text` og modifikatorene deres.
