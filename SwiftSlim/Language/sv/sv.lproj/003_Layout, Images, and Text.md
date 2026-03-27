# Layout, bilder och text

I förra lektionen studerade vi ContentView-koden:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
````

I den här lektionen ska vi lära oss SwiftUIs standardmekanism för layout, samt hur bilder och text används. Med utgångspunkt i den förra lektionen ska vi vidare förstå vyernas struktur och visningssätt. Denna kunskap kan hjälpa oss att bygga grundläggande gränssnittslayouter.

## SwiftUIs standardmekanism för layout

När vi förhandsgranskar ContentView ser vi att ikonen och texten visas centrerade i stället för att börja från toppen.

![Swift](../../RESOURCE/003_view.png)

Som standard är Stack-containerns justering .center, därför visas dess undervyer normalt centrerade.

### Alignment justering

Det är tydligt att centrerad justering bara är ett av flera justeringssätt. Om vi vill vänsterjustera eller högerjustera behöver vi använda alignment för att styra hur vyer justeras.

```swift
alignment
```

I SwiftUI förekommer justering vanligtvis i två scenarier:

**1. Justeringsparameter i Stack-container**

Till exempel, vänsterjustera ikonen och texten i ContentView:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

alignment i VStack styr justeringen i horisontell riktning.

Justeringssätt:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack är en horisontell ordning, och alignment styr justeringen i vertikal riktning:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack är en överlagrad ordning, och alignment kan styra justering i både horisontell och vertikal riktning:

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

Om alignment inte anges uttryckligen är standardvärdet för VStack, HStack och ZStack .center.

**2. alignment inuti frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

När storleken som frame ger är större än vyens egen storlek bestämmer alignment var vyn placeras inuti frame. Den konkreta användningen av frame kommer att förklaras senare, här räcker det att få en första förståelse.

### Spacer och mekanismen för utrymmesfördelning

alignment kan låta vyer ordnas och visas horisontellt eller vertikalt. Men när vi vill att text och bild ska visas i varsin ände räcker inte en enda justering.

Till exempel, om vi vill skapa en toppvy som på [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), med NHK:s ikon till vänster och en katalogikon till höger.

![Swift](../../RESOURCE/003_alignment3.png)

Om vi bara använder alignment kommer NHK-ikonen och katalogikonen båda att hamna på samma sida. De kan alltså inte fördelas till vänster och höger, därför behöver vi Spacer för att fördela det återstående utrymmet.

Spacer är en elastisk vy för layout som automatiskt fyller återstående utrymme.

Användning:

```swift
Spacer()
```

Till exempel:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

När vi lägger till Spacer mellan Image och Text fyller Spacer det återstående utrymmet och skjuter Image och Text mot varsin ände uppåt och nedåt.

![Swift](../../RESOURCE/003_view1.png)

Om det finns flera Spacer:

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

kommer det återstående utrymmet att fördelas jämnt mellan Spacer.

![Swift](../../RESOURCE/003_spacer.png)

## Visning och storlekskontroll av Image

Image-vyn används huvudsakligen för att visa bilder. SF Symbols-ikonerna som vi lärde oss i förra lektionen är bara ett av sätten att använda Image.

Användning:

```swift
Image("imageName")
```

Texten i dubbla citationstecken är bildens namn, och filändelsen behöver inte anges.

### Visa bild

Först förbereder vi en bild.

![Swift](../../RESOURCE/003_img.jpg)

Välj resursmappen Assets i Xcode och dra bilden dit.

![Swift](../../RESOURCE/003_img1.png)

I ContentView använder vi Image för att visa bilden:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Observera: Image i SwiftUI stöder inte uppspelning av GIF-animationer, utan kan bara visa en statisk bildruta.

### Styra bildens storlek

I SwiftUI visas Image som standard i bildens ursprungliga storlek. Om vi vill ändra den visade storleken måste vi först använda resizable för att göra bilden skalbar och sedan använda frame för att ange layoutstorleken.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modifieraren resizable

Modifieraren resizable gör att bilden kan skalas i layouten i stället för att alltid använda originalstorleken.

```swift
.resizable()
```

Först efter att resizable() har lagts till kan frame verkligen ändra bildens visade storlek.

Om resizable utelämnas:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

kommer frame bara att ge bilden ett layoututrymme, medan själva bildens storlek inte förändras.

### Modifieraren frame

frame(width:height) används för att ange en vys bredd och höjd.

Grundläggande användning:

```swift
.frame(width: 10,height: 10)
```

Till exempel, ställ in bilden till en rektangel med width 300 och height 100.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Det går också att ange endast bredd eller endast höjd:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinationen resizable + frame kan flexibelt styra bildens storlek i gränssnittet och samtidigt behålla möjligheten att skala den.

### Skalningsförhållande: scaledToFit och scaledToFill

När vi använder frame med en bredd och höjd som inte har samma proportioner kan bilden bli utdragen och förvrängd.

Om vi vill att bilden ska anpassas till det tillgängliga layoututrymmet samtidigt som dess proportioner bevaras kan vi använda scaledToFit eller scaledToFill.

**scaledToFit**

scaledToFit bevarar bildens ursprungliga proportioner och skalar bilden så att den helt får plats i det tillgängliga utrymmet utan att beskäras:

```swift
.scaledToFit()
```

eller

```swift
.aspectRatio(contentMode: .fit)
```

Detta passar i situationer där hela bilden behöver visas och man inte vill att den ska förvrängas.

Om varje bild sätts till samma bredd och höjd uppstår lätt utdragna bilder.

Till exempel:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Utan att ange skalningsförhållande kan bilden inte visas med sina ursprungliga proportioner.

![Swift](../../RESOURCE/003_img4.png)

Att ange scaledToFit gör att bilden behåller sina ursprungliga proportioner.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill bevarar också bildens proportioner, men fyller hela det tillgängliga utrymmet. Om proportionerna inte stämmer överens beskärs de delar som sticker ut:

```swift
.scaledToFill()
```

eller

```swift
.aspectRatio(contentMode: .fill)
```

Detta passar i situationer där bilden ska täcka hela området, till exempel som bakgrundsbild eller banner. Det är särskilt lämpligt när bilden används som bakgrund.

**Skillnaden mellan de två**

![Swift](../../RESOURCE/003_img6.png)

## Text

I SwiftUI används Text för att visa text.

Grundläggande användning:

```swift
Text("FangJunyu")
```

Vi lärde oss Text i förra lektionen. I den här lektionen ska vi gå vidare och lära oss hur man styr teckenstorlek och tjocklek, så att texten blir mer uttrycksfull i en vy.

### Teckenstorlek

Med modifieraren font kan vi styra textens storlek:

```swift
.font(.title)
```

Till exempel:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Vanliga teckenstorlekar (från störst till minst):

```swift
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

### Teckentjocklek

Om vi vill göra texten fetare kan vi använda modifieraren fontWeight:

```swift
.fontWeight(.bold)
```

Till exempel:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Vanliga teckentjocklekar (från tunn till tjock):

```swift
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

font styr teckenstorleken och fontWeight styr teckentjockleken. De kan användas tillsammans för att göra textens uttryck rikare.

## Sammanfattning och praktik

Hittills har vi lärt oss SwiftUIs standardlayout, Spacer, Image och Text samt annan grundläggande kunskap. Detta räcker redan för att utveckla några enkla vyer.

Till exempel: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Googles gränssnitt är mycket rent. Det innehåller bilder och text, och vi kan försöka analysera dess struktur ur ett SwiftUI-perspektiv:

1. Helheten kan delas in i tre delar: Google-logotypen, sökrutan och hjälptexten. Dessa kan ordnas vertikalt med VStack.
2. Google-logotypen är en bild och kan visas med Image.
3. Sökrutan innehåller ett inmatningsfält och en ikon. Om vi tillfälligt bortser från inmatningsfältet kan sökikonen visas med Image.
4. Hjälptexten visas med Text. Den horisontella ordningen av texten kan göras med HStack, och textfärgen kan styras med foregroundStyle.

Genom att öva på denna kunskap kan vi skapa några enkla vyer och fördjupa vår förståelse för Image- och Text-vyer samt deras modifierare.
