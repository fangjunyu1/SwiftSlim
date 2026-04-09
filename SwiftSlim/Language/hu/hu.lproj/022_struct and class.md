# struct és class

Az előző leckében épphogy elkezdtünk megismerkedni a `struct`-tal, definiáltunk egy struktúrát, és emellett tovább bővítettük a tudásunkat olyan témákkal, mint a protokollok, a `UUID` és más ismeretek.

Most már van egy kezdeti elképzelésünk a `struct` kulcsszóról, de még nem mondhatjuk, hogy valóban megértettük.

Ebben a leckében továbbra is a `struct` lesz a központi téma, és közben megismerkedünk a `class`-szal is. A lecke végére világosabban fogod tudni: mi az az instance, mi az a konstruktor, és miért tudjuk a `struct`-ot és a `class`-t adatok rendszerezésére használni.

## Tanulókezelő rendszer

Például most egy tanulókezelő rendszert szeretnénk fejleszteni. Minden tanulónak vannak adatai, például neve, neme, telefonszáma, életkora, lakcíme és így tovább.

Ebben a helyzetben ezeket az adatokat összefoghatjuk, és `Student` struktúraként definiálhatjuk:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Itt a `struct` segítségével definiálunk egy tanulótípust.

Ez a `Student` struktúra több tulajdonságot tartalmaz:

- `id`: a tanuló egyedi azonosítója
- `name`: a tanuló neve
- `sex`: a tanuló neme
- `phone`: a tanuló telefonszáma
- `age`: a tanuló életkora
- `address`: a lakcím

Így a korábban szétszórt több adat együtt egy teljes „tanulóvá” áll össze.

Itt a `Student` követi az `Identifiable` protokollt is, és definiál egy `id` mezőt, hogy később kényelmes legyen az adatok megjelenítése a `ForEach` ciklussal együtt.

Ezután létrehozhatunk egy tanuló instance-t:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Ez a kód azt jelenti, hogy a `Student` struktúra alapján létrehozhatunk egy konkrét tanulói adatot.

Itt a `Student` a típus, a `Student(...)` pedig egy létrehozott instance-t jelent.

SwiftUI-ban ezt az instance-t hozzárendelhetjük egy változóhoz, majd megjeleníthetjük.

Például:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Így a nézetben láthatjuk ennek a tanulónak a nevét: `Fang Junyu`.

Itt először létrehoztunk egy `Student` instance-t, aztán hozzárendeltük a `student` változóhoz, végül a `student.name` segítségével kiolvastuk a tulajdonságát.

## Mi az az instance

Amikor éppen elkezdjük tanulni a `struct`-ot, az „instance” szó elég ismeretlennek tűnhet.

De valójában már a kezdetektől instance-okat használunk, csak korábban erre nem figyeltünk különösebben.

Például:

```swift
let name = "Fang Junyu"
```

Itt a `"Fang Junyu"` egy szövegérték, és lényegében a `String` típus egy instance-a.

Írhatjuk így is:

```swift
let name = String("Fang Junyu")
```

Ez a két írásmód ugyanazt fejezi ki: létrehozni egy `String` típusú instance-t, és azt hozzárendelni a `name` változóhoz.

Ugyanez igaz az `Int`-re is:

```swift
let num = 3
```

Itt a `3` lényegében egy `Int` típusú érték, és úgy is érthető, mint egy `Int` instance.

Tehát az instance nem valamilyen különleges fogalom, amely csak a `struct`-ban jelenik meg.

Legyen szó `String`-ről, `Int`-ről, `Double`-ról, `Bool`-ról vagy az egyedi `Student`-ről, mindegyik képes instance-okat létrehozni.

Ezért amikor azt írjuk:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

akkor ez lényegében ugyanaz, mint egy `String` vagy `Int` instance létrehozása, csak a `Student` egy általunk definiált típus.

## Konstruktor

Amikor létrehozunk egy instance-t:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

akkor valójában a `Student` inicializáló metódusát hívjuk meg, vagyis az `init`-et.

A konstruktort úgy értheted meg, mint: **azt a belépési pontot, amely az instance létrehozásakor felelős azért, hogy értéket adjon a tulajdonságoknak.**

Vagyis mielőtt egy instance valóban teljesen létrejönne, általában először át kell mennie az `init`-en.

Például amikor korábban a SwiftUI nézetek életciklusát tanultuk, ilyen kódot írtunk:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Itt az `init()` akkor fut le, amikor a `ContentView` instance létrejön, míg az `onAppear` csak akkor fut le, amikor a nézet ténylegesen megjelenik a képernyőn. Vagyis a nézet létrehozása és megjelenítése nem ugyanaz a pillanat.

Hasonlóképpen, amikor létrehozzuk a `Student(...)`-ot, akkor a `Student` konstruktorát hívjuk meg.

### A rendszer által automatikusan létrehozott konstruktor

Amikor definiáltuk a `Student`-et, nem írtuk meg kézzel az `init`-et:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Ennek ellenére továbbra is közvetlenül létre tudunk hozni instance-t:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Miért lehet instance-t létrehozni konstruktor megírása nélkül?

Mert a `struct` esetében, ha nem írunk kézzel konstruktort, a rendszer általában automatikusan létrehoz nekünk egy megfelelő konstruktort.

A tanulás kezdeti szakaszában ezt egyszerűen úgy értheted: a Swift automatikusan kiegészíti helyettünk az inicializálási kódot.

Nagyjából úgy képzelhetjük el, hogy a rendszer a következő kódot egészíti ki helyettünk:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Itt egy apró részletre érdemes figyelni:

```swift
let id = UUID()
```

Az `id` már rendelkezik alapértelmezett értékkel, ezért instance létrehozásakor nem kell külön kézzel átadnunk az `id`-t.

Vagyis azokat a tulajdonságokat, amelyeknek nincs alapértelmezett értékük, általában át kell adni a konstruktorban; azok a tulajdonságok pedig, amelyeknek már van alapértelmezett értékük, általában közvetlenül használhatják ezt az eredeti alapértéket.

Ezért amikor `Student` instance-t hozunk létre, csak a `name`, `sex`, `phone`, `age` és `address` értékeket kell átadnunk.

### A fordító súgói

Ezen kívül, amikor Xcode-ban beírjuk, hogy `Student(...)`, láthatjuk a rendszer által adott paramétersúgókat is.

![student](../../Resource/022_student.png)

Ez is azt mutatja, hogy a jelenlegi típusnak valóban van egy rendszer által automatikusan létrehozott konstruktora.

### Konstruktor írása saját kezűleg

Bár a rendszer képes automatikusan konstruktort generálni, néha ez az alapértelmezett inicializálási mód nem teljesen felel meg az igényeinknek.

Például van egy `Movie` struktúránk:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

A rendszer által automatikusan létrehozott konstruktor szerint instance létrehozásakor mindhárom paramétert egyszerre kell átadnunk:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

De ha most egy csomó régi filmet szeretnénk felvinni, és csak a film nevét tudjuk, a rendezőt és az értékelést nem, az eléggé kényelmetlen lesz.

Mert ilyenkor csak így írhatjuk:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Bár ez működik, nem kényelmes minden alkalommal ismételten `--`-t írni.

Ekkor írhatunk saját konstruktort:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Így régi filmek létrehozásakor elég csak a `name`-et átadni:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Ez az egyik értelme annak, hogy saját kezűleg írunk konstruktort: **jobban a valós igényekhez igazítani az instance létrehozásának módját.**

### Egy custom konstruktor elemzése

Nézzük meg ezt az imént kézzel írt konstruktort:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Ennek a kódnak az a jelentése, hogy `Movie` instance létrehozásakor csak egy `name` paraméter megadása szükséges.

Ezután a konstruktor belsejében az átadott `name` hozzá lesz rendelve az instance saját `name` tulajdonságához, a `director` és a `rating` pedig alapértelmezett `--` értéket kap.

Itt a `self` azt jelenti: „ez a jelenlegi instance maga”.

Például:

```swift
self.name = name
```

A bal oldali `self.name` az instance tulajdonságát jelenti; a jobb oldali `name` pedig az általunk átadott paramétert.

Egyszerűen úgy érthető, hogy a kívülről kapott értéket eltároljuk az instance saját tulajdonságában.

Amikor minden tulajdonság megkapta az értékét, az instance létrehozása befejeződik.

### A konstruktor működése

Amikor kifejezetten deklarálunk egy konstruktort, egy másik változás is történik:

azt a konstruktort, amelyet eredetileg a rendszer automatikusan létrehozott, általában már nem lehet közvetlenül használni.

Például:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Most, ha ismét így írjuk:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

a fordító hibát jelez:

```swift
Extra arguments at positions #2, #3 in call
```

Ez azt jelenti: felesleges paramétereket adtál át.

Miért jelenik meg ez a hiba?

Mert a jelenlegi `Movie` struktúrában csak ez az egy konstruktor létezik, amelyet kézzel deklaráltál:

```swift
init(name: String)
```

Ez csak egyetlen paramétert, a `name`-et fogadja el, a `director`-t és a `rating`-et nem.

Vagyis amikor kézzel hozzáadod a saját konstruktorodat, az eredeti automatikusan generált inicializálási mód már nem használható közvetlenül.

Ha azt szeretnénk, hogy egyszerre támogassuk a „csak a nevet adom meg” és a „teljes adatokat adom meg” lehetőséget is, akkor nekünk magunknak kell még egy teljes konstruktort hozzáírnunk:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Így már két különböző konstruktorunk van.

Régi film létrehozásakor így írhatunk:

```swift
Movie(name: "The Night of the Hunter")
```

Teljes adatokkal rendelkező új film létrehozásakor pedig így írhatunk:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ez az írásmód azt is mutatja, hogy ugyanannak a típusnak több konstruktora is lehet, amennyiben a paramétereik formája eltér.

## Mi az overload

Itt még kiegészítjük egy szükséges ismerettel.

Épp most írtunk két `init`-et a `Movie`-hoz:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Ezt az írásmódot, vagyis „ugyanaz a függvénynév, de más paraméterek”, „overload”-nak nevezzük.

Itt mindkét függvény neve `init`, de mivel eltérő paramétereket fogadnak, a Swift meg tudja különböztetni, melyik függvényt hívod.

Például:

```swift
Movie(name: "Days of Heaven")
```

ezt fogja hívni:

```swift
init(name: String)
```

Míg:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

az inicializáló metódus másik, teljes változatát fogja hívni.

Tehát az overload szerepe az, hogy ugyanannak a típusnak különböző létrehozási módokat engedjen biztosítani különböző helyzetekhez.

## Ismerkedés a class-szal

Ezután röviden ismerkedjünk meg a `class`-szal is.

A Swiftben gyakori `struct` mellett sok programozási nyelv használ `class`-t instance-ok létrehozására, például a Java, a C#, a Kotlin és mások.

Swiftben a `class` írásmódja nagyon hasonló a `struct`-éhoz.

Például:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Látni fogod, hogy azon kívül, hogy a kulcsszó `struct`-ról `class`-ra változik, a többi rész szinte teljesen ugyanúgy néz ki.

Az instance létrehozásának módja is nagyon hasonló:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ezért szintaktikai szinten a `struct` és a `class` valóban nagyon hasonlít egymásra.

### A Struct és a Class közötti különbség

Bár a `struct` és a `class` nagyon hasonlónak tűnik, nem teljesen ugyanazok.

**1. Az inicializálás módja eltér**

A `struct` esetében, ha nem írunk kézzel konstruktort, a rendszer általában automatikusan létrehoz egy megfelelő inicializáló metódust.

De a `class` esetében, ha vannak olyan tulajdonságok, amelyeknek nincs alapértelmezett értékük, akkor általában kézzel kell megírni az `init`-et, különben hiba lesz.

Például:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ez a `class` hibát okoz, mert nincs konstruktora, így a tulajdonságai nincsenek inicializálva.

A fordító valami ilyesmit fog jelezni:

```swift
Class 'Movie' has no initializers
```

Ezért ebben a példában a `class` számára kötelező kézzel konstruktort írni.

**2. A `struct` értéktípus, a `class` referenciatípus**

A `struct` értéktípus, a `class` pedig referenciatípus.

A tanulás kezdeti szakaszában nem szükséges ezt a két fogalmat teljes mélységében elsajátítani; elég, ha van róluk egy egyszerű alapképed.

Például a `struct` inkább olyan, mint „egy új érték másolása”.

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Itt, amikor a `user1`-et a `user2`-nek adjuk, az olyan, mintha egy új adathalmazt másolnánk, ezért a `user2` módosítása nem befolyásolja a `user1`-et.

Ezzel szemben a `class` inkább olyan, mint „közösen ugyanarra az instance-ra mutatni”.

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Itt a `user1` és a `user2` ugyanarra az instance-ra mutat.

Most még nem szükséges teljesen megérteni az érték- és referenciatípusok belső működését; elég tudni, hogy a `struct` inkább önálló adatok tárolására alkalmas, a `class` pedig inkább akkor megfelelő, ha több helynek ugyanazt az instance-t kell megosztania.

## Hogyan válasszunk a kezdeti szakaszban

A jelenlegi szakaszban a szokásos adatmodellekhez először a `struct`-ra érdemes gondolni, és amikor megosztott adatokra, illetve szinkronizált módosításokra van szükség, akkor érdemes a `class`-t fontolóra venni.

Ez nem abszolút szabály, de kezdők számára elég praktikus döntési szempont.

Különösen SwiftUI-ban gyakran fogod azt tapasztalni, hogy a `struct` már a legtöbb feladatot el tudja végezni.

Ezenkívül sok programozási anyagban a `class` által létrehozott dolgot „objektumnak” is nevezik. Kezdő szinten ezt egyszerűen felfoghatod instance-ként, anélkül hogy szándékosan különbséget tennél köztük.

## Összefoglalás

Ebben a leckében mélyebben megismertük a `struct`-ot, és közben a `class`-szal is találkoztunk; mindkettő használható típusok definiálására.

A típusok képesek instance-okat létrehozni. Egy instance létrehozásakor a konstruktor, vagyis az `init` hívódik meg.

A `struct` esetében, ha nem írunk kézzel konstruktort, a rendszer általában automatikusan generál egy megfelelő konstruktort. Ha az alapértelmezett konstruktor nem felel meg az igényeknek, mi magunk is írhatunk konstruktort.

Emellett előzetes képet kaptunk a `struct` és a `class` közötti különbségről is: a `struct` értéktípus, míg a `class` referenciatípus. SwiftUI-ban a kezdeti szakaszban általában gyakrabban találkozol a `struct`-tal.

Később, amikor a nézetek közötti értékátadásról, az adatmodellekről és az állapotkezelésről tanulunk, mindez a tartalom továbbra is elő fog kerülni.
