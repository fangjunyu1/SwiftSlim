# Ciklusok és listák

Ebben a leckében a Swift `for` ciklusát, valamint a SwiftUI `ForEach` szerkezetét fogjuk megtanulni.

Mindkettő segít nekünk abban, hogy egy tömb elemeit sorban, egyesével olvassuk be. A valódi fejlesztés során gyakran szükség van arra, hogy egy adathalmaz elemeit egyenként vegyük ki, majd feldolgozzuk vagy megjelenítsük őket, és a ciklusok pontosan ehhez nyújtanak fontos eszközt.

Amikor weboldalakat böngészünk vagy egy alkalmazást használunk, gyakran látunk sok listát vagy elemet. Az ilyen tartalmak általában először egy `tömbben` vannak tárolva, majd egy `ciklus` segítségével egyenként kerülnek beolvasásra, végül pedig megjelennek a felületen.

Például a Google keresési találati listája:

![Google](../../Resource/017_google.png)

A keresési találati lista minden egyes eleme általában egy adatnak felel meg, és ciklus segítségével egyenként jelenik meg.

Ezért a `tömbök` és a `ciklusok` gyakran együtt jelennek meg. A `tömb` egy adathalmaz tárolásáért felel, a `ciklus` pedig azért, hogy ezeket az adatokat sorrendben kivegye, és ugyanazt a műveletet hajtsa végre rajtuk.

Most pedig kezdjük a legalapvetőbb `for` ciklussal.

## Visszaszámlálás

Tegyük fel, hogy egy visszaszámláló funkciót szeretnénk szimulálni, és sorban kiírni a következőt: `„5, 4, 3, 2, 1”`.

A legegyszerűbb megoldás az, ha így írjuk:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Ez a módszer ugyan képes szimulálni a visszaszámlálást, de ha sok tartalom van, akkor nagyon ismétlődővé válik, és később sem kényelmes módosítani.

Ilyenkor először betehetjük az adatokat egy tömbbe, majd `for` ciklussal egyenként kiírhatjuk őket:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Ez a megoldás tömörebb, és könnyebben bővíthető is. Még ha sok szám is van a visszaszámlálásban, nem kell soronként újra és újra leírnunk a `print` utasítást, elég, ha a ciklus automatikusan kezeli a tömb minden elemét.

Ezt a kódot akár egy gombba is betehetjük teszteléshez:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Amikor a gombra koppintunk, a `for` ciklus a tömb sorrendjében egyenként kiveszi a `countDown` minden egész számát, és kiírja a konzolra.

Most nézzük meg, hogyan működik a `for` ciklus.

## for ciklus

A `for` ciklus arra szolgál, hogy egy adathalmaz elemeit sorrendben feldolgozza. A leggyakoribb esetek a tömbök és a tartományok.

Alapvető írásmód:

```swift
for elem in tömbVagyTartomány {
    végrehajtandóKód
}
```

Például az előbbi visszaszámláló kód:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Itt az `i` az éppen kivett elemet jelenti, az `in` után pedig az a bejárandó adat áll, vagyis a `countDown` tömb.

Ennek a kódnak a jelentése: a program sorban kiveszi a `countDown` tömb minden elemét. Minden alkalommal, amikor kivesz egy elemet, ideiglenesen az `i` névvel jelöli, majd végrehajtja a kapcsos zárójelek közötti kódot.

A végrehajtás folyamata így érthető meg:

* Az első kivett elem az `5`, ezért ekkor az `i` értéke `5`
* Lefut a `print(i)`, és kiíródik az `5`
* Ezután a következő elem, a `4` kerül kivételre
* Ismét lefut a `print(i)`, és kiíródik a `4`

A későbbi `3`, `2` és `1` is ugyanígy, egyenként kerül végrehajtásra.

![for](../../Resource/017_for.png)

Amikor a tömb összes elemét feldolgoztuk, a `for` ciklus automatikusan befejeződik.

A `for` ciklus segítségével a tömb minden elemét elérhetjük, és megvalósíthatunk például ilyen visszaszámláló funkciókat.

**Tipp**: az `i` nagyon gyakori elnevezés a for ciklusban, és az aktuálisan kivett elemet jelöli, de ez nem kötelező. Használhatunk más angol neveket is.

Például használhatjuk a `num` nevet minden egyes kivett elem jelölésére:

```swift
for num in countDown {
    print(num)
}
```

A kapcsos zárójeleken belül is a `num` nevet kell használni az aktuális elem jelölésére.

### Bejárás tartományon

A `for` ciklus nemcsak tömbökön, hanem tartományokon is végigmehet.

Például amikor ki szeretnénk számolni az `50`-ig terjedő pozitív egész számok összegét, akkor az `1` és `50` közötti összes egész számot egyenként össze kell adnunk.

A legegyszerűbb forma talán ez lehetne:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Ennek az a problémája, hogy minden számot kézzel kell leírnunk. Ez körülményes, és a valódi fejlesztési helyzetekben nem praktikus.

Ilyenkor használhatjuk a tartományoperátort a `for` ciklussal együtt.

Az előző, „Operátorok” című leckében már megtanultuk a tartományoperátort:

```swift
1...3   // 1, 2, 3
```

Itt a `...` zárt tartományt jelent, vagyis a kezdő- és a végpontot is tartalmazza.

Ezért itt használhatunk `for` ciklust az `1`-től `50`-ig tartó egész számtartományon:

```swift
for i in 1...50 {
    
}
```

Ezeket az egész számokat össze kell adnunk, ezért szükség van egy változóra is, amely tárolja az összeget:

```swift
var count = 0
```

Ezután minden cikluslépésben hozzáadjuk az aktuálisan kivett számot a `count` változóhoz:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Ez a kód azt jelenti:

* a `count` az aktuális összeg tárolására szolgál
* a `for` ciklus egyenként veszi ki az `1` és `50` közötti egész számokat
* minden egyes kivett számnál egyszer lefut a `count += i`
* amikor a ciklus véget ér, a `count` tartalmazza a végső összeget

Így megkaphatjuk az `50`-ig terjedő összes pozitív egész szám összegét.

Ugyanígy, ha az `1` és `100` közötti egész számok összegét szeretnénk kiszámolni, csak a tartományt kell módosítani:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

A `for` ciklus tehát nemcsak tömböket, hanem tartományokat is be tud járni. Az adatok sorrendben történő ismételt feldolgozásának ez a képessége nagyon gyakori a fejlesztésben.

Segít abban, hogy sok ismétlődő feladatot automatikusan végezzünk el, anélkül hogy kézzel kellene leírnunk minden szám összeadását vagy más hasonló ismétlődő műveletet.

## Ciklusok SwiftUI-ban

Az előző `for` ciklus a Swift nyelv része.

SwiftUI-ban azonban nem használhatjuk közvetlenül a `for`-t egy nézetstruktúrán belül nézetek létrehozására:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Ennek az az oka, hogy a `VStack` belsejében SwiftUI nézetekre van szükség, míg egy hagyományos `for` ciklus önmagában nem nézet.

Ha SwiftUI-ban egy tömb tartalma alapján ismétlődően szeretnénk felületet létrehozni, akkor `ForEach`-et kell használnunk.

Például ha egy csoport összes tagjának nevét szeretnénk megjeleníteni, írhatjuk ezt:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Megjelenési eredmény:

![for1](../../Resource/017_for1.png)

Ezután adjuk hozzá ugyanazokat a módosítókat minden `Text` nézethez:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Most minden `Text` kisebb és vastagabb betűvel jelenik meg.

Megjelenési eredmény:

![](../../Resource/017_for2.png)

Bár a módosítók szebbé teszik a felületet, a kódot hosszabbá és ismétlődőbbé is teszik.

Ha a nevek száma tovább nő, vagy később egységesen szeretnénk módosítani a betűtípust, a színt és más stílusokat, akkor sok azonos kódot kellene újra és újra leírnunk és módosítanunk. Ez fáradságos, és a karbantartást sem könnyíti meg.

Ilyenkor először betehetjük ezeket a neveket egy tömbbe, majd SwiftUI-ban a `ForEach` segítségével a tömb adatai alapján ismétlődően nézeteket hozhatunk létre:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Ez a kódrészlet tömörebb. A `ForEach` egyenként beolvassa a tömb minden elemét, és a megfelelő tartalmat jeleníti meg a felületen.

Ha később új neveket adunk hozzá, csak a `names` tömb tartalmát kell módosítani. Nem kell minden alkalommal újra hozzáadni a `Text` nézeteket és az összetettebb módosítókat.

## ForEach

A `ForEach` a SwiftUI-ban ismétlődően nézetek létrehozására szolgáló szerkezet. Úgy is felfoghatjuk, mint a SwiftUI-ban a `for` ciklushoz hasonló szerkezetet.

Alapvető használat:

```swift
ForEach(tömb, id: \.self) { elem in
    SwiftUI kód
}
```

Például az előbbi csoportnevek:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ennek a kódnak a jelentése:

A `names` az a tömb, amelyen végigmegyünk, vagyis a megjelenítendő adatok.

Az `id:\.self` azt jelenti, hogy a tömb elemét magát használjuk minden egyes elem megkülönböztetésére.

A jelenlegi példában a tömb szövegeket tárol:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Ezért a SwiftUI közvetlenül magukat a szövegeket, például a "Sam", "John", "Wathon" és "Bob" értékeket fogja használni a különböző tartalmak megkülönböztetésére.

A kezdő szinten gyakori egyszerű tömböknél, például `String` vagy `Int` esetén, általában egyszerűen így írhatjuk:

```swift
id: \.self
```

Most egyelőre elég, ha csak ezt az egy formát jegyzed meg. Az `id` további szabályaiba még nem szükséges mélyebben belemenni.

Az `item in` részben az `item` az aktuálisan kivett elemet jelenti.

Például az első ismétlésnél az `item` értéke `"Sam"`, a másodiknál pedig `"John"`.

Ezért:

```swift
Text(item)
```

egymás után ezekre fog átalakulni:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Vagyis ennek a kódnak az a feladata, hogy a `names` tömbből egyenként kivegye a neveket, és minden névhez létrehozzon egy `Text` nézetet.

### A végrehajtás folyamata

A végrehajtás folyamata így érthető meg:

* A `ForEach` először beolvassa a `names` tömb első elemét, a `"Sam"` értéket
* Az `item` ideiglenesen a `"Sam"` értéket jelöli
* A `Text(item)` megjeleníti a `"Sam"` értéket
* Ezután tovább olvassa a következő elemet, a `"John"` értéket
* Majd újra végrehajtja ugyanazt a nézetkódot

A végén a tömb összes neve megjelenik.

Ennek az írásmódnak az az előnye, hogy amikor több név van, nem kell sok `Text` nézetet újra és újra leírnunk, csak a tömb tartalmát kell módosítanunk.

### Képek bejárása

A `ForEach` nemcsak szöveget, hanem képeket, színeket vagy más SwiftUI nézeteket is megjeleníthet.

Például készítsünk elő 4 képet:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Húzd be ezt a négy képet az Xcode Assets mappájába.

![image](../../Resource/017_for3.png)

Ha nem használjuk a `ForEach`-et, akkor minden képet kézzel kell leírnunk:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Megjelenési eredmény:

![image](../../Resource/017_for4.png)

Ez a megoldás ugyan működik, de a kód viszonylag hosszú lesz.

Ha egyre több kép van, akkor egyre több `Image` kódot kell újra és újra leírnunk.

Ha később egységesen szeretnénk módosítani a képek méretét, akkor is egyenként kellene módosítanunk őket.

Ilyenkor a képek nevét betehetjük egy tömbbe, majd a `ForEach` segítségével ismétlődően képnézeteket hozhatunk létre:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Itt az `images` egy szöveges tömb, és a tömb minden eleme egy kép neve.

A `ForEach(images, id: \.self)` azt jelenti, hogy az `images` tömb minden elemét egyenként beolvassuk, magát az elemet használjuk az egyes elemek megkülönböztetésére, majd az aktuális elem alapján létrehozzuk a megfelelő nézetet.

Például ha az első beolvasott elem `"430F9BEF"`, akkor:

```swift
Image(item)
```

ez ugyanazt jelenti, mint:

```swift
Image("430F9BEF")
```

A későbbi képek is ugyanígy, egyenként fognak megjelenni.

![image](../../Resource/017_for4.png)

Itt továbbra is ezt használjuk:

```swift
id: \.self
```

Az ok ugyanaz, mint korábban: mivel az `images` tömb elemei is egyszerű szövegtípusok, kezdő szinten közvetlenül magát az elemet használhatjuk megkülönböztetésre.

Ezt egyszerűen egy rögzített szabályként is megérthetjük:

**Amikor a `ForEach` egyszerű tömbön, például `String` vagy `Int` típuson megy végig, akkor általában `id: \.self` formát írunk.**

### Képek hozzáadása

Ha később új képeket szeretnénk hozzáadni, akkor csak a tömb tartalmát kell módosítani:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Nem kell újra és újra új `Image` kódot írni.

Ha sok kép van, használhatjuk együtt a `ScrollView`-val. Ellenkező esetben, ha a tartalom túlnyúlik a képernyőn, nem lehet teljes egészében előnézetben látni.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Képek módosítása

Amikor egységesen szeretnénk módosítani a képek stílusát, akkor csak a `ForEach` belsejében lévő kódot kell megváltoztatni.

Például az szélességet állítsuk `80`-ra:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Így az összes kép egyszerre fog megváltozni, és nem kell egyenként módosítanunk őket.

Ez a `ForEach` egyik fontos szerepe:

**Amikor több nézet szerkezete azonos, és csak a tartalom különbözik, akkor elég egyszer leírni a nézetkódot, és a tömbben lévő adatok döntik el, hogy mi jelenjen meg.**

## Összegzés

Ebben a leckében a `for` ciklust és a `ForEach`-et tanultuk meg.

A `for` ciklus egy tömb vagy tartomány elemeinek sorrendben történő feldolgozására szolgál, és inkább az adatkezeléshez áll közelebb.

A `ForEach` a SwiftUI-ban arra szolgál, hogy egy tömb tartalma alapján ismétlődően nézeteket hozzon létre, és inkább a felületi megjelenítéshez kapcsolódik.

A jelenlegi kezdő szinten a `ForEach` leggyakoribb formája ez:

```swift
ForEach(tömb, id: \.self) { elem in
    SwiftUI kód
}
```

Itt az `id: \.self` azt jelenti, hogy magát az elemet használjuk minden egyes elem megkülönböztetésére.

Amikor a tömb tartalma egyszerű típus, például `String` vagy `Int`, akkor általában ezzel az egyetlen írásmóddal kezdhetünk.

Később, amikor weboldalakat vagy alkalmazásokat böngészel, és ismétlődő szövegeket, képeket vagy más listatartalmakat látsz, gondolhatsz arra, hogy SwiftUI-ban az ilyen tartalom általában először egy tömbbe kerül, majd a `ForEach` segítségével egyenként jelenik meg.
