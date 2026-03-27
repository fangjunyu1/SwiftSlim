# Változók és konstansok

Ebben a leckében elsősorban a Swift változóit és konstansait tanuljuk meg, valamint megismerkedünk néhány gyakori adattípussal és alapvető operátorral.

Ezek a programozás legalapvetőbb ismeretei, és a SwiftUI további tanulásának is fontos alapját jelentik.

## Változók és konstansok a mindennapi életben

A változókat és konstansokat a hétköznapi dolgokon keresztül is megérthetjük.

Változók a mindennapi életben:

- a televízióban minden műsor más tartalmat játszik le
- minden nap más az időjárás
- az óra minden másodpercben változik

Ezeknek a dolgoknak a közös jellemzője, hogy megváltoznak.

Ha a televízió mindig ugyanazt a képet mutatná, az időjárás mindig napos lenne, és az óra mutatói soha nem mozdulnának, akkor ezek konstansok lennének.

Az egyik esetben valami megváltozhat, a másikban nem.

## A változók és konstansok megértése

App-fejlesztésben gyakran szükség van arra, hogy a felhasználó kitöltsön vagy elmentsen bizonyos adatokat.

Például:

- fióknév
- születésnap
- elérhetőség
- lakcím

Ezeket az adatokat elmentjük és megjelenítjük.

Például a felhasználó beír egy nevet az appba:

```
FangJunyu
```

Ezt a nevet el kell mentenünk, hogy később megjeleníthessük az alkalmazásban.

Az elmentés folyamatát egyszerűen úgy képzelhetjük el, mintha valamit egy fiókba tennénk.

Amikor elmentünk egy nevet, az olyan, mintha a nevet egy fiókba raknánk.

Sokféle dolgot kellhet tárolni, ezért sok fiók is lesz. Ahhoz, hogy tudjuk, melyik fiókban mi van, nevet kell adnunk a fiókoknak.

Például:

```
name
```

Ebben a példában a `name` a név, a `FangJunyu` pedig az elmentett információ.

![Var](../../RESOURCE/007_var.png)

**Swiftben, ha adatot szeretnél tárolni, azt változóval (`var`) vagy konstanssal (`let`) kell deklarálnod.**

Mivel a név általában módosítható, itt változót kell használnunk.

```swift
var name = "FangJunyu"
```

Itt deklaráltunk egy `name` nevű változót. A típusa `String`, az értéke pedig `"FangJunyu"`.

### Mi a különbség a változó és a konstans között

A változót `var` kulcsszóval deklaráljuk:

```swift
var
```

A konstanst `let` kulcsszóval deklaráljuk:

```swift
let
```

Például:

```swift
var name = "FangJunyu"
let id = 123456
```

Ha valamit változóként deklarálsz, az értéke később módosítható; ha konstansként, akkor többé nem változtatható meg.

Ezért a változók és konstansok közötti fő különbség az, hogy az értékük megváltozhat-e.

### Konstans módosítása

Ha a kód megpróbálja módosítani egy konstans értékét:

```swift
let name = "Sam"
name = "Bob"
```

A Swift azt fogja jelezni, hogy az értékadás nem hajtható végre, mert ez egy konstans.

```
Cannot assign to property: 'name' is a 'let' constant
```

Ez a mechanizmus segít a fejlesztőknek abban, hogy bizonyos fontos adatok ne módosuljanak véletlenül.

### Megjelenítés SwiftUI-ban

Nyisd meg a `ContentView.swift` fájlt, és deklarálj benne egy változót a nézeten belül:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Itt deklaráltunk egy `name` nevű változót, majd a `Text` segítségével megjelenítettük a felületen.

Ha módosítjuk a változó tartalmát:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

A `Text` által megjelenített tartalom is megváltozik.

Így a változót használhatjuk a felületen látható tartalom vezérlésére anélkül, hogy minden alkalommal közvetlenül a `Text` szövegét módosítanánk.

Ha az információra máshol is szükség van, a változót tovább is adhatjuk, ami olyan, mintha a „fiókban” tárolt tartalmat más helyen is felhasználnánk.

### A változók és konstansok helye SwiftUI-ban

SwiftUI-ban a változókat és konstansokat általában a `body`-n kívül szoktuk írni:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Természetesen beírhatjuk őket a `body` belsejébe is:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

De van egy fontos különbség:

- ha a változó vagy konstans a `body` belsejében van, a nézet minden újraszámításakor újra létrejön
- ha a `body`-n kívül van, akkor a nézetstruktúra tulajdonságaként létezik, és a kód szerkezete is tisztább lesz

Ezért a valódi fejlesztésben általában a `body`-n kívül írjuk a változókat és konstansokat.

## Adattípusok

A változók sokféle típusú adatot tárolhatnak, ezeket adattípusoknak nevezzük.

Például korábban `Text` segítségével jelenítettünk meg szöveget:

```swift
Text("Hello, World")
```

Itt a `"Hello, World"` egy karakterlánc, vagyis `String` típus.

A karakterlánc szöveges tartalom megjelenítésére szolgál, és Swiftben dupla idézőjelek közé kell írni.

Például:

```swift
var hello = "Hello, World"
```

A karakterláncon kívül a Swiftben sok más adattípus is létezik.

Kezdő szinten a négy leggyakoribb típus:

- String
- Int
- Double
- Bool

Ez a négy típus a legtöbb alapvető adatkezelést lefedi.

**String**

A `String` szöveges tartalmat jelent, például:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

A karakterláncot általában felhasználónév, cím vagy szöveges tartalom megjelenítésére használjuk.

**Int**

Az `Int` egész számot jelent, vagyis tizedesrész nélküli számot.

Például:

```swift
var age = 26
var count = 100
```

Az egész számokat gyakran életkor, darabszám vagy számlálás tárolására használjuk.

**Double**

A `Double` tizedesjegyeket tartalmazó számokat jelöl.

Például:

```swift
var weight = 74.5
var height = 185.0
```

Swiftben a tizedes számok alapértelmezés szerint többnyire `Double` típusúak.

Van egy hasonló típus, a `Float`, de annak kisebb az értéktartománya, ezért a valódi fejlesztésben a `Double` gyakoribb.

**Bool**

A `Bool` típus két állapotot jelöl: `true` és `false`.

Például:

```swift
var isShowAlert = true
var isLogin = false
```

A `Bool` gyakran használatos feltételek vizsgálatára, például arra, hogy meg kell-e jeleníteni egy figyelmeztetést.

Ha egy helyzetnek csak két lehetséges kimenetele van, akkor nagyon jól használható a `Bool` típus.

### Megjelenítés SwiftUI-ban

Ha `String` típust jelenítünk meg, közvetlenül használhatjuk a `Text`-et:

```swift
Text(name)
```

Az `Int`, `Double` és más típusok viszont nem karakterláncok, ezért nem tehetők közvetlenül szövegként a `Text`-be.

Ha ezeket a `Text`-ben szeretnéd megjeleníteni, használhatsz karakterlánc-interpolációt (`String Interpolation`):

```swift
\()
```

A karakterlánc-interpolációt szövegen belül kell használni, és a változót vagy konstanst `\\()` közé kell írni.

Például:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

A fenti kódban a `""` jelöl egy karakterláncot, a `\\()` pedig arra szolgál, hogy egy változót vagy konstanst beillesszünk a karakterláncba.

Például:

```swift
"DoubleNum: \(num * 2)"
```

A megjelenített tartalom:

```swift
DoubleNum: 2
```

Így változókat vagy konstansokat szúrhatunk be a karakterláncba, majd a `Text` segítségével megjeleníthetjük őket a felületen.

Tipp: a `\\()` csak a `""` belsejében használható.

## Operátorok

Amikor változót vagy konstanst deklarálunk, láthatunk ilyen írást:

```swift
var num = 1
```

Itt az `=` az értékadó operátor.

Feladata az, hogy a jobb oldali értéket a bal oldali változóhoz rendelje.

Ebben a példában az `1` értéket rendeljük a `num` változóhoz.

Az értékadó operátoron kívül létezik néhány gyakori numerikus operátor is:

- \+
- \-
- \*
- \/

Amikor számokkal végzünk műveleteket, például `Int` vagy `Double` típusú adatokkal, ezeket az operátorokat használjuk.

Például:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

A művelet végrehajtása után az eredmény a változóba kerül.

## Összegzés

A változók, a konstansok és az operátorok a programozás legalapvetőbb fogalmai.

A változók és konstansok segítségével különféle adatokat tudunk tárolni a programban; az adattípusokkal egyértelművé tehetjük, hogy milyen jellegű adatot kezelünk; az operátorokkal pedig számításokat és adatfeldolgozást végezhetünk.

Ezek az ismeretek olyanok, mint a programozás világának alapvető eszközei. Ha ezeket jól elsajátítod, szilárd alapot kapsz a Swift és a SwiftUI további tanulásához.
