# Személyes önéletrajz oldal felépítése

Ebben a leckében egy egyszerű személyes önéletrajz nézetet fogunk elkészíteni, és a következő ismereteket tanuljuk meg:

- cornerRadius
- spacing
- ScrollView

Az építés során átismételjük az elrendezés, a Text és az Image használatát, valamint megvalósítjuk a térközök szabályozását és a tartalom görgetését.

## Személyes önéletrajz

Célzott eredmény:

![Swift](../../RESOURCE/004_img.png)

**Először próbáld meg önállóan elkészíteni, és csak utána olvasd tovább a magyarázatot.**

### Projekt létrehozása

Hozz létre egy új iOS projektet, vagy folytasd az előző projekt használatát.

Az alapértelmezett `ContentView` kód:

```swift
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
```

Most töröld ki a kódot, és kezdd el megírni a saját tartalmadat:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Általános szerkezet

A valódi fejlesztés során általában először a teljes szerkezetet tervezzük meg.

Az oldalunk a következőket tartalmazza:

1. címet
2. személyes adatokat
3. személyes bemutatkozást

A legkülső szintre adjunk egy `VStack`-et:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

A `VStack` biztosítja, hogy a nézetek függőlegesen legyenek rendezve, és szabályozni tudja az elrendezést és a távolságokat.

### Cím

Először hozzunk létre egy `Text` nézetet a cím megjelenítéséhez.

Itt a saját angol nevemet használom címként:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

A cím általában nagyobb és vastagabb, ehhez a `font` és a `fontWeight` módosítókat használjuk:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Tördelés

A SwiftUI alapértelmezett igazítása `center`, ezért a cím a `ContentView` közepén jelenik meg.

![Swift](../../RESOURCE/004_img3.png)

A címet a nézet tetején szeretnénk megjeleníteni, ehhez `Spacer`-t használhatunk az elrendezés módosítására:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

A `Spacer` kitölti a fennmaradó helyet, és a `Text` nézetet a tároló tetejére tolja.

![Swift](../../RESOURCE/004_img4.png)

### Üres hely

Ha úgy érzed, hogy a szöveg túl közel van a tetejéhez, használhatsz `padding`-et vagy `Spacer`-t.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Ez a `VStack` felső `padding` értékét 20-ra állítja.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Használhatunk `Spacer`-t is, és a `frame` magasságának beállításával meghatározott méretű üres helyet kaphatunk.

Megvalósított eredmény:

![Swift](../../RESOURCE/004_img5.png)

### Kép

Készítsünk elő egy saját portréfotót, és tegyük az `Assets` erőforrásmappába.

![Swift](../../RESOURCE/004_img6.png)

A `ContentView`-ban az `Image` segítségével jelenítsük meg a képet:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Mivel a kép eredeti mérete viszonylag nagy, a megjelenített méretet `frame` segítségével kell szabályoznunk.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Ekkor egy problémát fogunk észrevenni:

Ha a `frame` szélesség-magasság aránya nem egyezik a kép eredeti arányával, a kép torzulni fog.

Például:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Annak érdekében, hogy a kép ne torzuljon, `scaledToFit`-et kell használnunk:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

A `scaledToFit` szerepe:

A megadott `frame` tartományon belül az eredeti képarány megtartásával skálázza a képet, és a teljes képtartalmat megjeleníti.

Nem nyújtja szét erőszakkal a képet, hogy teljesen kitöltse a `frame`-et, hanem megtartja a szélesség-magasság arányt, és arányosan kicsinyít vagy nagyít, amíg az egyik oldal éppen hozzá nem ér a határhoz.

Ez azt jelenti, hogy:

- ha a `frame` szélessége kisebb, a kép a szélességhez igazodva méreteződik
- ha a `frame` magassága kisebb, a kép a magassághoz igazodva méreteződik
- a kép mindig megőrzi az eredeti arányait, ezért nem torzul el

Gyakran elég csak az egyik irány méretét megadni. Például:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Ilyenkor a rendszer a 140-es szélesség alapján automatikusan kiszámítja a megfelelő magasságot, miközben megtartja a kép arányait.

Ha rögzített vizuális arányra van szükség, vagy összetettebb elrendezésben el akarod kerülni az összenyomódást, a szélességet és a magasságot is egyszerre korlátozhatod.

### Lekerekített sarkok

Ha azt szeretnéd, hogy a kép lekerekített sarkokkal jelenjen meg, használhatod a `cornerRadius` módosítót:

```swift
.cornerRadius(10)
```

Például:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Az `Image` módosítói mögé írd a `cornerRadius(20)` hívást.

![Swift](../../RESOURCE/004_img9.png)

A `cornerRadius(20)` azt jelenti, hogy a nézet széleit levágjuk, és 20-as sugarú lekerekítést alkalmazunk.

A lekerekítés után a kép négy sarka íves lesz, így a látvány lágyabbá és modernebbé válik.

Ez a stílus a mai felületdizájnban nagyon gyakori, például az iOS alkalmazásikonok is lekerekített téglalap formát használnak. (Bár a rendszerikonok folyamatos görbületű szuperellipszist használnak, nem egyszerű lekerekített sarkot.)

### Személyes adatok

Most készítsük el a kép bal oldalán lévő személyes információs részt. Az elrendezésből látszik, hogy a személyes adatok és a kép vízszintesen helyezkednek el, ezért `HStack` rendezést kell használnunk.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

A személyes információk tartalma függőlegesen helyezkedik el.

![Swift](../../RESOURCE/004_img11.png)

Ezért kívül `HStack`-et, a személyes információkhoz `VStack`-et, a szöveghez pedig `Text` nézeteket használunk.

Alapszerkezet:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Mezőcímek félkövéren**

Annak érdekében, hogy a mezőnevek és a mezőértékek jobban elkülönüljenek, a mezőnevekre használhatunk `fontWeight`-et:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Szöveg balra igazítása**

A `VStack` alapértelmezésben középre igazít, ezért ha azt szeretnéd, hogy minden szöveg balra legyen rendezve, meg kell adni az igazítást:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

A `.leading` bal oldali igazítást jelent balról jobbra haladó nyelvi környezetben.

![Swift](../../RESOURCE/004_img14.png)

### Térköz

Ha azt szeretnéd, hogy a személyes információk és a kép között fix távolság legyen, korábban `Spacer`-t használtunk az üres hely létrehozására:

```swift
Spacer()
    .frame(width: 10)
```

Használhatod a `HStack` `spacing` paraméterét is:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

A `spacing: 30` azt jelenti, hogy a két gyermeknézet közötti távolság 30 pt lesz.

![Swift](../../RESOURCE/004_img15.png)

**Mi az a spacing?**

A `VStack`, `HStack` és `ZStack` esetében a `spacing` a gyermeknézetek közötti távolságot szabályozza.

Például:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

A `VStack` gyermeknézetei közötti térköz 10 pt lesz.

![Swift](../../RESOURCE/004_img16.png)

Fontos megjegyezni, hogy a `spacing` csak a közvetlen gyermeknézetekre hat, a beágyazott konténerek belső elrendezését nem befolyásolja.

**A lista belső térközének szabályozása**

Ha azt szeretnéd, hogy a mezők között nagyobb távolság legyen, a legegyszerűbb módszer a `VStack` `spacing` beállítása:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Így minden gyermeknézet közötti távolság 10 pt lesz.

De az elrendezést megfigyelve egy problémát találunk:

A mezőcsoportok között is van térköz, és a mezőnév valamint az érték között is ugyanekkora távolság jelenik meg.

Ez azért van, mert a `spacing` az aktuális konténer összes közvetlen gyermeknézetére hat.

Ebben a szerkezetben minden `Text` a külső `VStack` közvetlen gyermeke, ezért a térköz mindenhol egységes.

Ha azt szeretnéd, hogy a mezőcsoportok között legyen távolság, de a mezőnév és a mezőérték között maradjon az alapértelmezett szoros térköz, akkor a "mezőnév + mezőérték" párost kezeld egy logikai egységként, és csomagold külön `VStack`-be:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Ekkor a szerkezet olyanná válik, hogy a külső `VStack` elemei között van térköz, a belső `VStack`-ekben viszont marad az alapértelmezett szoros távolság, ezért a mezőnév és az érték között nem lesz plusz hézag.

![Swift](../../RESOURCE/004_img18.png)

### Személyes bemutatkozás

Ezután készítsük el a személyes bemutatkozás részt.

Az elrendezésből látható, hogy a bemutatkozás több sorból álló szöveget tartalmaz, és a szöveg függőlegesen rendeződik.

![Swift](../../RESOURCE/004_img19.png)

Ezért használhatunk `VStack`-et `Text` nézetekkel:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Térköz növelése**

Most a személyes információk és a bemutatkozás része túl sűrűn helyezkedik el, ezért az elrendezés nem túl esztétikus.

![Swift](../../RESOURCE/004_img20.png)

Mivel ugyanabban a külső konténerben vannak, a teljes távolságot a külső konténeren tudjuk szabályozni:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Megvalósított eredmény:

![Swift](../../RESOURCE/004_img21.png)

**Listatérköz**

Használd a `spacing`-et a személyes bemutatkozás sorai közötti távolság beállítására:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### A személyes önéletrajz elkészítése

Most a személyes önéletrajz alapvető váza elkészült.

![Swift](../../RESOURCE/004_img.png)

### Görgethető nézet

Jelenleg az oldal szerkezete `VStack`-re épül, és amíg a bemutatkozó szöveg rövid, nincs vele gond. De ha 20, 30 vagy még több sort adunk hozzá, a tartalom magassága túl fog nyúlni a képernyőn.

Például:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Ilyenkor két jelenséget fogsz látni:

- az alsó tartalom levágódik
- az oldal nem görgethető

Ez nem a `VStack` hibája, mert a `VStack` csak egy elrendező konténer, és önmagában nem biztosít görgetési lehetőséget.

**Mi az a ScrollView**

A `ScrollView` egy görgethető konténer, amely jól használható nagy mennyiségű, a képernyő méretét meghaladó tartalomhoz, például függőleges vagy vízszintes listákhoz.

Alapszerkezet:

```swift
ScrollView {
    ...
}
```

Ha görgetési hatást szeretnél elérni, az egész oldaltartalmat egy `ScrollView`-ba kell csomagolnod:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Így az egész oldal egy görgethető területté válik, és amikor a tartalom magasabb a képernyőnél, természetes módon lehet majd görgetni.

A `ScrollView` alapértelmezésben megjelenít egy görgetősáv-jelzőt. Ha ezt el szeretnéd rejteni, beállíthatod:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Teljes kód

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
