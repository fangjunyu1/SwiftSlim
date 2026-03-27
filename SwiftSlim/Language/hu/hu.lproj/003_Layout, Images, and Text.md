# Elrendezés, képek és szöveg

Az előző leckében a `ContentView` kódját tanultuk:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ebben a leckében a SwiftUI alapértelmezett elrendezési mechanizmusát, valamint a képek és a szöveg használatát fogjuk tanulni. Az előző leckére építve tovább fogjuk mélyíteni a nézetek szerkezetének és megjelenítésének megértését; ezek az ismeretek segítenek bennünket az alapvető felhasználói felületi elrendezések felépítésében.

## A SwiftUI alapértelmezett elrendezési mechanizmusa

Amikor előnézetben megtekintjük a `ContentView`-t, észrevehetjük, hogy az ikon és a szöveg középen jelenik meg, nem pedig felülről lefelé rendezve.

![Swift](../../RESOURCE/003_view.png)

Alapértelmezés szerint a `Stack` tároló igazítása `.center`, ezért az alnézetek rendszerint középre igazítva jelennek meg.

### `Alignment` igazítás

Nyilvánvaló, hogy a középre igazítás csak egy az igazítási módok közül. Ha balra vagy jobbra igazítást szeretnénk, akkor az `alignment` segítségével kell vezérelnünk a nézet igazítását.

```swift
alignment
```

SwiftUI-ban az igazítás általában kétféle helyzetben jelenik meg:

**1. A `Stack` tároló igazítási paramétere**

Például a `ContentView`-ban az ikon és a szöveg balra igazítása:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

A `VStack` `alignment` paramétere a vízszintes irányú igazítást vezérli.

Igazítási lehetőségek:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

Az `HStack` vízszintes rendezésű, így az `alignment` a függőleges irányú igazítást vezérli:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

A `ZStack` egymásra helyezett rendezés, és az `alignment` vezérelheti a vízszintes vagy függőleges igazítást:

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

Ha nem adunk meg explicit `alignment`-et, akkor a `VStack`、`HStack` és `ZStack` alapértelmezés szerint `.center` értéket használ.

**2. `alignment` a `frame` belsejében**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Amikor a `frame` által biztosított méret nagyobb, mint maga a nézet saját mérete, az `alignment` dönti el, hogy a nézet hol helyezkedjen el a `frame`-en belül. A `frame` részletes használatát később még tárgyaljuk, itt egyelőre elegendő az alapötlet megértése.

### `Spacer` és a térelosztási mechanizmus

Az `alignment` lehetővé teszi, hogy a nézeteket vízszintes vagy függőleges irányban rendezzük. De amikor azt szeretnénk, hogy a szöveg és a kép két végén jelenjen meg, az egyszerű igazítás már nem elég.

Például ha az [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) weboldal felső részét szeretnénk megvalósítani, ahol bal oldalon az NHK ikon, jobb oldalon pedig a menüikon található.

![Swift](../../RESOURCE/003_alignment3.png)

Ha csak `alignment`-et használunk, akkor az NHK ikon és a menüikon is ugyanazon az oldalon jelenik meg. Nem tudjuk a két ikont balra és jobbra szétosztani, ezért `Spacer`-re van szükség a fennmaradó tér elosztásához.

A `Spacer` egy rugalmas elrendezési nézet, amely automatikusan kitölti a fennmaradó helyet.

Használata:

```swift
Spacer()
```

Például:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Amikor `Spacer`-t helyezünk az `Image` és a `Text` közé, a `Spacer` kitölti a fennmaradó helyet, és az `Image`-et és a `Text`-et a felső, illetve alsó vég felé tolja.

![Swift](../../RESOURCE/003_view1.png)

Ha több `Spacer` is van:

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

A fennmaradó hely egyenletesen oszlik el a `Spacer` elemek között.

![Swift](../../RESOURCE/003_spacer.png)

## Az `Image` megjelenítése és a méret szabályozása

Az `Image` nézet főként képek megjelenítésére szolgál; az előző leckében tanult `SF Symbols` ikonok csak egy felhasználási módját jelentik az `Image`-nek.

Használata:

```swift
Image("imageName")
```

Az idézőjelek között a kép neve szerepel, kiterjesztés nélkül.

### Kép megjelenítése

Először készítsünk elő egy képet.

![Swift](../../RESOURCE/003_img.jpg)

Az Xcode-ban válaszd ki az `Assets` erőforrásmappát, és húzd be a képet az `Assets` területre.

![Swift](../../RESOURCE/003_img1.png)

Ezután a `ContentView`-ban jelenítsük meg a képet az `Image` segítségével:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Megjegyzés: a SwiftUI `Image` nem támogatja a GIF animációk lejátszását (csak statikus képkockát tud megjeleníteni).

### A kép méretének szabályozása

SwiftUI-ban az `Image` alapértelmezés szerint a kép eredeti méretében jelenik meg. Ha módosítani szeretnénk a megjelenített méretét, először a `resizable` segítségével skálázhatóvá kell tenni a képtartalmat, majd `frame`-mel kell megadni az elrendezési méretet.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### `resizable` módosító

A `resizable` módosító lehetővé teszi, hogy a kép részt vegyen az elrendezésben történő méretezésben, ahelyett hogy mindig az eredeti méretét használná.

```swift
.resizable()
```

Csak akkor tudja a `frame` valóban módosítani a kép megjelenített méretét, ha hozzáadtuk a `resizable()` módosítót.

Ha a `resizable` kimarad:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

A `frame` csak elrendezési helyet foglal a kép számára, de maga a kép mérete nem változik.

### `frame` módosító

A `frame(width:height)` a nézet szélességének és magasságának meghatározására szolgál.

Alapvető használat:

```swift
.frame(width: 10,height: 10)
```

Például állítsuk a képet 300 széles és 100 magas téglalappá.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

A szélességet vagy a magasságot külön-külön is beállíthatjuk:

```swift
.frame(width: 200)
.frame(height: 100)
```

A `resizable + frame` kombináció rugalmasan szabályozza a kép megjelenített méretét a felületen, miközben megőrzi a skálázhatóságot.

### Méretezési arány: `scaledToFit` és `scaledToFill`

Amikor a `frame` által beállított szélesség és magasság aránya nem egyezik, a kép megnyúlhat és torzulhat.

Ha azt szeretnénk, hogy a kép arányait megtartva illeszkedjen a rendelkezésre álló elrendezési térhez, használhatjuk a `scaledToFit` vagy `scaledToFill` módot.

**`scaledToFit`**

A `scaledToFit` megtartja a kép eredeti szélesség-magasság arányát, és a képet úgy méretezi, hogy teljesen beférjen a rendelkezésre álló helyre, levágás nélkül:

```swift
.scaledToFit()
```

vagy

```swift
.aspectRatio(contentMode: .fit)
```

Ez a módszer akkor megfelelő, ha a teljes képet szeretnénk megjeleníteni torzítás nélkül.

Ha minden képnél ugyanazt a szélességet és magasságot állítjuk be, könnyen előfordulhat, hogy a kép megnyúlik.

Például:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Méretezési arány beállítása nélkül a kép nem az eredeti arányban jelenik meg.

![Swift](../../RESOURCE/003_img4.png)

A `scaledToFit` beállítása lehetővé teszi, hogy a kép megtartsa eredeti arányát.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

A `scaledToFill` szintén megtartja a kép arányát, de kitölti az egész rendelkezésre álló területet, így ha az arány nem egyezik, a túlnyúló részek le lesznek vágva:

```swift
.scaledToFill()
```

vagy

```swift
.aspectRatio(contentMode: .fill)
```

Ez a módszer olyan helyzetekben megfelelő, amikor a képnek a teljes területet be kell fednie, például háttérképként vagy bannerként.

**A kettő közti különbség**

![Swift](../../RESOURCE/003_img6.png)

## Szöveg

SwiftUI-ban a `Text` szöveg megjelenítésére szolgál.

Alapvető használat:

```swift
Text("FangJunyu")
```

Az előző leckében már tanultunk a `Text`-ről, most pedig tovább megyünk, és megtanuljuk, hogyan lehet szabályozni a betűméretet és a betűvastagságot, hogy a szöveg kifejezőbb legyen a nézetben.

### Betűméret

A `font` módosítóval szabályozható a szöveg mérete:

```swift
.font(.title)
```

Például:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Gyakran használt betűméretek (nagytól a kisebb felé):

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

### Betűvastagság

Ha azt szeretnénk, hogy a szöveg vastagabb legyen, használhatjuk a `fontWeight` módosítót:

```swift
.fontWeight(.bold)
```

Például:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Gyakran használt betűvastagságok (vékonytól a vastagabbig):

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

A `font` a betűméretet, a `fontWeight` a betűvastagságot szabályozza; a kettő együtt használható a szöveg kifejezőerejének növelésére.

## Összefoglalás és gyakorlat

Mostanra megtanultuk a SwiftUI alapértelmezett elrendezését, a `Spacer`、`Image` és `Text` alapvető használatát. Ez már elegendő ahhoz, hogy egyszerűbb nézeteket készítsünk.

Például: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

A Google felülete nagyon letisztult, képeket és szöveget tartalmaz. Megpróbálhatjuk SwiftUI nézőpontból elemezni a szerkezetét:

1. Az egész három részre osztható: Google ikon, keresőmező és segítő szöveg. Ehhez használhatunk `VStack` függőleges rendezést.
2. A Google ikon egy kép, ezért `Image` segítségével jeleníthető meg.
3. A keresőmező tartalmaz beviteli mezőt és ikont; ha a beviteli mezőt figyelmen kívül hagyjuk, a keresőikont `Image` segítségével jeleníthetjük meg.
4. A segítő szöveg `Text`-tel jeleníthető meg, a vízszintes szövegelrendezéshez `HStack` használható, a betűszín pedig `foregroundStyle` segítségével szabályozható.

Az ilyen ismeretek gyakorlásával egyszerűbb nézeteket készíthetünk, és elmélyíthetjük az `Image` és `Text` nézetek, valamint módosítóik megértését és alkalmazását.
