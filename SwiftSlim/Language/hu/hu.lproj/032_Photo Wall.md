# Fotógaléria

Ebben a leckében egy fotógaléria oldalt fogunk készíteni.

![view](../../../Resource/032_view13.png)

Ebben a példában átismételjük az `extension`, a `self` és a példányok ismeretét, és megismerkedünk a SwiftUI-ban gyakran használt `Shape` alakzatokkal.

Ezekkel az ismeretekkel a hagyományos képeket különböző stílusokra vághatjuk, például körre, lekerekített téglalapra, kapszulaformára vagy ellipszisre, és kereteffektust is adhatunk a fotókhoz.

Ebben a leckében több új fogalmat fogunk használni: `Shape`, `clipShape`, `strokeBorder` és `overlay`.

Ezek közül a `clipShape` a nézet alakjának kivágására szolgál, a `strokeBorder` alakzatkeret rajzolására használható, az `overlay` pedig egy új nézetet rétegez az aktuális nézet fölé.

## Képanyagok

Mielőtt elkezdjük, elő kell készítenünk néhány képet.

Használhatod a saját fotóidat, vagy használhatod az ebben a leckében megadott mintaképeket is.

A lecke példafotói a [Pixabay](https://pixabay.com/) webhelyről származnak:

[Tájkép](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Róka](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Épület](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Virág](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Hattyú](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

A képek letöltése után add hozzá őket az `Assets` erőforrásmappához, majd sorban nevezd el őket `1`, `2`, `3`, `4` és `5` néven.

![assets](../../../Resource/032_view17.png)

Így SwiftUI-ban az `Image("1")`, `Image("2")` és hasonló formában tudjuk megjeleníteni a képeket.

## Fotók megjelenítése

Először jelenítsünk meg 5 fotót a `ContentView` nézetben:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Megjelenítési eredmény:

![view](../../../Resource/032_view.png)

Ebben a kódban a `ScrollView` segítségével görgethető fotólistát készítünk, a `VStack` pedig több képet rendez egymás alá.

Minden kép a `.resizable()`, `.scaledToFit()` és `.frame(width: 300)` módosítókkal kapja meg a megjelenési beállításait, így a kép méretezhető, arányosan teljes egészében látható marad, és a szélessége korlátozott lesz.

A `VStack` nézeten lévő `.padding(.vertical, 100)` a felső és alsó térközt növeli, hogy az első és az utolsó fotó ne legyen túl közel a képernyő széléhez.

A végén lévő `.ignoresSafeArea()` azt jelenti, hogy a görgetőnézet figyelmen kívül hagyja a biztonságos területet, így görgetéskor a fotók kiterjedhetnek a képernyő tetejéig és aljáig, és az oldal megjelenése teljesebb lesz.

Jelenleg azonban mind az 5 kép ugyanazokat a módosítókat használja:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Amikor ismétlődő kódot látunk, érdemes megfontolni az `extension` használatát a rendezéshez.

## Képstílusok rendezése extension segítségével

Az `Image` típushoz hozzáadhatunk egy kifejezetten fotógalériához való metódust:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Itt az `Image` típushoz hozzáadtunk egy `photoGalleryStyle` nevű metódust.

Ez a metódus tartalmazza a korábban ismételten használt `.resizable()`, `.scaledToFit()` és `.frame(width: 300)` kódot. Más szóval egy helyre rendezi a képméretezés, az arányos megjelenítés és a szélességbeállítás kódját.

Az extension használata után az eredeti képkód:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

így egyszerűsíthető:

```swift
Image("1")
    .photoGalleryStyle()
```

Így minden képnek csak meg kell hívnia a `.photoGalleryStyle()` metódust, és ugyanazt a fotógaléria-stílust kapja. A kód tisztább lesz, és később az egységes módosítás is egyszerűbbé válik.

## A self megértése

Az extension metódusban ezt írtuk: `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Itt a `self` azt az aktuális képpéldányt jelenti, amely meghívja ezt a metódust.

Például:

```swift
Image("1")
    .photoGalleryStyle()
```

Ebben a kódban a `photoGalleryStyle()` metódust az `Image("1")` hívja meg, ezért a metóduson belüli `self` ezt az `Image("1")` képet jelenti.

Egyszerűen úgy érthető: aki meghívja ezt a metódust, azt jelenti a `self`.

Fontos megjegyezni, hogy a SwiftUI módosítói folyamatosan új nézeteredményt adnak vissza. Ezért a `photoGalleryStyle()` egy módosított nézetet ad vissza, nem pedig egyszerűen az eredeti `Image` példányt.

## Fotóalakzatok

Most már a fotók normálisan megjelennek. Alapértelmezés szerint azonban ezek a fotók téglalap alakúak, ami viszonylag hétköznapi megjelenés.

Ha csak lekerekített sarkokat szeretnénk adni a fotónak, közvetlenül használhatjuk a `.cornerRadius()` módosítót:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Megjelenítési eredmény:

![color](../../../Resource/032_view1.png)

A `.cornerRadius(20)` azt jelenti, hogy a kép `20 pt` méretű saroklekerekítést kap. Egy átlagos lekerekített sarkú képhez ez a szintaxis már elegendő.

A `.cornerRadius()` azonban csak saroklekerekítési effektust tud kezelni, ezért hagyományos lekerekített képekhez alkalmas. Ha a fotókat többféle különböző alakzattá szeretnénk alakítani, ez a módosító önmagában nem elég.

Ekkor a SwiftUI `Shape` típusát kell használnunk. A `Shape` különböző alakzatokat tud kifejezni, és a `clipShape` segítségével a képet a megfelelő alakzatra vághatjuk.

## A Shape megismerése

SwiftUI-ban a `Shape` alakzatot jelent. A `View` típushoz hasonlóan ez is nagyon gyakran használt típus a SwiftUI-ban.

A gyakori `Shape` típusok közé tartozik a kör, a téglalap, a lekerekített téglalap, a kapszulaforma és az ellipszis. Hogy a különböző alakzatok megjelenését szemléletesebben lássuk, az alábbi példák mindegyik alakzatnak eltérő színt és méretet adnak.

Ezekben a példákban a `.fill()` az alakzat színnel való kitöltésére szolgál, a `.frame()` pedig az alakzat megjelenési méretét állítja be. A színek csak a különböző alakzatok megkülönböztetésére szolgálnak, nem maguknak az alakzatoknak a rögzített színei.

### Circle kör

A `Circle` kört jelent. Gyakran használják avatarokhoz, kör alakú gombokhoz, kör alakú képekhez és más felületi hatásokhoz.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle téglalap

A `Rectangle` téglalapot jelent. Ez az egyik legalapvetőbb alakzat, és használható háttér, elválasztott terület vagy hagyományos keret készítésére is.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle lekerekített téglalap

A `RoundedRectangle` lekerekített téglalapot jelent. A `cornerRadius` a saroklekerekítés méretének beállítására szolgál.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapszulaforma

A `Capsule` kapszulaformát jelent. A két vége íves, és gyakran használják kapszulagombokhoz, címkehátterekhez és más felületi hatásokhoz.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ellipszis

Az `Ellipse` ellipszist jelent. Hasonló a `Circle` típushoz, de ha a szélesség és a magasság eltérő, ellipszisként jelenik meg.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Ezekből a példákból látható, hogy a `Shape` önmagában is közvetlenül megjeleníthető alakzatként. Ezután ezeket a `Shape` típusokat a `clipShape` módosítóval együtt használjuk majd a fotók kivágására, hogy a fotók különböző alakzatokban jelenjenek meg.

## Fotók kivágása clipShape segítségével

Most már használhatjuk a `clipShape` módosítót arra, hogy a fotókat különböző alakzatokra vágjuk.

Például az első fotó kör alakúra vágása:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Ez a kód azt jelenti: először megjelenítünk egy képet, majd a `Circle()` segítségével kör alakúra vágjuk.

![view](../../../Resource/032_view2.png)

A `clipShape` alapvető írásmódja:

```swift
.clipShape(alakzat)
```

A nézet után hozzáadjuk a `.clipShape(...)` módosítót, és a zárójelbe írjuk azt az alakzatot, amelyre vágni szeretnénk.

Például:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Most az 5 fotót különböző alakzatokra vágjuk:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Megjelenítési eredmény:

![view](../../../Resource/032_view8.png)

Ezek közül a `Rectangle()` használatával végzett kivágás eredménye közel áll egy hagyományos téglalap alakú fotóhoz, ezért a vizuális változás nem feltűnő; főként a többi alakzattal való összehasonlításra szolgál.

Most a fotók már nem csupán hagyományos téglalapok, hanem különböző alakzatokat kaptak.

## Fotókeret hozzáadása

Ha kör alakú fotóhoz szeretnénk keretet adni, először eszünkbe juthat a `border` használata:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Ez azonban általában nem kör alakú keretet eredményez, hanem egy téglalap alakú keretet.

![view](../../../Resource/032_view9.png)

Ennek oka, hogy a `border` a nézet téglalap alakú területe alapján ad hozzá keretet, nem pedig a `clipShape` kivágás utáni alakja alapján.

Ezért ha kör alakú keretet szeretnénk, nem használhatjuk közvetlenül a `border` módosítót.

## Alakzatkeret rajzolása strokeBorder segítségével

SwiftUI-ban a `strokeBorder` belső keretet tud rajzolni ezekhez a gyakori `Shape` típusokhoz.

Például kör alakú keret rajzolása:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Ez a kód azt jelenti: a `Circle` számára barna keretet rajzolunk, a keret szélessége `10 pt`.

![view](../../../Resource/032_view12.png)

Itt fontos megjegyezni, hogy a `strokeBorder` nem közvetlenül a fotóhoz ad keretet, hanem a `Circle()` alakzathoz rajzol keretet.

Más szóval ez a kód csak egy önálló kör alakú keretet hoz létre, amelynek még nincs kapcsolata a fotóval.

Ha azt szeretnénk, hogy ez a kör alakú keret a fotó fölött jelenjen meg, tovább kell használnunk az `overlay` módosítót, és a keretet a fotó fölé kell rétegeznünk.

## Keret rétegezése overlay segítségével

Az `overlay` egy nézetmódosító, amellyel új nézetet lehet az aktuális nézet fölé rétegezni.

Az alapvető szerkezete így érthető meg:

```swift
Aktuális nézet
    .overlay {
        Ráhelyezett nézet
    }
```

Ebben a példában az aktuális nézet az a fotó, amelyet már kör alakúra vágtunk:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Az új nézet, amelyet rá szeretnénk helyezni, egy kör alakú keret:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Ezért a fotót és a keretet így kombinálhatjuk:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Itt az `overlay` azt jelenti, hogy egy új nézetet rétegezünk az aktuális nézet fölé.

Az `overlay` belsejében a keret az aktuális fotó megjelenítési területét követve kerül rá, ezért nem kell külön `frame` beállítást megadni. Amíg a keret alakzata megegyezik a kivágási alakzattal, a keret illeszkedni fog a fotóhoz.

![view](../../../Resource/032_view10.png)

A végső hatás az, hogy a kör alakú fotó fölé egy kör alakú keret kerül.

A `ZStack`-kel összehasonlítva az `overlay` alkalmasabb az ilyen „díszítés hozzáadása az aktuális nézethez” típusú helyzetekhez. A fotó a fő elem, a keret csak kiegészítő hatás, ezért az `overlay` használata egyértelműbb.

## A fotógaléria befejezése

Most minden fotóhoz hozzáadjuk a megfelelő alakzatot és keretet:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Megjelenítési eredmény:

![view](../../../Resource/032_view13.png)

Így egy alapvető fotógaléria oldal elkészült.

Ezen az oldalon a `ScrollView` segítségével görgethető megjelenítést valósítunk meg, az `Image` segítségével fotókat jelenítünk meg, a `clipShape` segítségével kivágjuk a fotók alakját, az `overlay` és a `strokeBorder` segítségével pedig kereteket adunk hozzá.

## Teljes kód

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Összegzés

Ebben a leckében elkészítettünk egy fotógaléria oldalt.

![view](../../../Resource/032_view13.png)

Ebben a példában először az `Image` segítségével jelenítettünk meg fotókat, majd az `extension` segítségével az `Image` típushoz hozzáadtunk egy `photoGalleryStyle` metódust, hogy rendezzük az ismétlődő képstíluskódot.

Ezután megismertük a SwiftUI gyakori `Shape` típusait, például a `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` és `Ellipse` típusokat. Ezek az alakzatok nemcsak közvetlenül megjeleníthetők, hanem a `clipShape` módosítóval együtt nézetek kivágására is használhatók.

Például:

```swift
.clipShape(Circle())
```

azt jelenti, hogy a nézetet kör alakúra vágjuk.

Végül az `overlay` és a `strokeBorder` segítségével megfelelő alakú kereteket adtunk a fotókhoz. Fontos megjegyezni, hogy a `border` általában a nézet téglalap alakú területe alapján rajzol keretet. Ha azt szeretnénk, hogy a keret kövesse a kör, kapszulaforma vagy ellipszis alakját, megfelelőbb ugyanazt a `Shape` alakzatot ráhelyezni.

Ezzel a leckével nemcsak a fotógaléria hatást készítettük el, hanem megértettük a `Shape`, `clipShape`, `strokeBorder` és `overlay` gyakori kombinációját is a felületekben.

## Óra utáni gyakorlatok

### 1. Fotógaléria-háttér hozzáadása

Adj egy teljes képernyős háttérképet a fotógaléria oldalhoz.

Követelmény: a háttérkép töltse ki az egész képernyőt, és hagyja figyelmen kívül a biztonságos területet.

### 2. Színátmenetes keret

Módosítsd a meglévő egyszínű kereteket lineáris színátmenetes keretekre.

Megpróbálhatod a `LinearGradient` használatát gazdagabb kerethatások létrehozásához.

### 3. Valósághű fotókeret

Keress az interneten néhány valódi fotókeretstílust, és próbáld meg az `overlay` segítségével képes kereteket ráhelyezni, hogy a fotók jobban hasonlítsanak valódi képkeretekre.

Gyakorlat megjelenítési eredménye:

![button](../../../Resource/032_view15.jpeg)

### 4. Lekerekített gombkeret megvalósítása

A valós fejlesztésben a gombok gyakran lekerekített téglalap alakú keretet használnak.

Próbálj meg készíteni egy lekerekített gombot, majd a `RoundedRectangle` és a `strokeBorder` segítségével adj hozzá lekerekített keretet.

Gyakorlat megjelenítési eredménye:

![button](../../../Resource/032_view14.png)

### Gondolkodtató kérdés

Ha nem egyszínű keretet és nem is színátmenetes keretet szeretnénk használni, hanem azt szeretnénk, hogy a keret valamilyen mintázatot jelenítsen meg, hogyan lehetne ezt megvalósítani?

Megpróbálhatsz anyagokat keresni, és megismerheted az `overlay`, `mask` vagy `ImagePaint` kapcsolódó használatait.

Gyakorlat megjelenítési eredménye:

![button](../../../Resource/032_view16.png)
