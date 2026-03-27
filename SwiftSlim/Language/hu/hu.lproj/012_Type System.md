# Típusrendszer

Az előző leckékben már tanultunk a változókról, és azt is tudjuk, hogy a változók különböző típusú adatokat tárolhatnak.

Például:

```swift
var hello = "Hello, World"
```

Itt a `hello` egy szöveget tárol, ezért a típusa `String`.

Most rendszeresen áttekintjük a típus (`Type`) fogalmát, az explicit típusmegadást és a típuskövetkeztetést, hogy mélyebben megértsük a változók természetét.

## Mi az a típus

Swiftben minden egyes értéknek egyértelmű típusa van. A típus határozza meg, hogy az adott érték micsoda, és milyen műveleteket lehet vele végezni.

Például:

- a `42` egy `Int` egész szám
- a `"Hello"` egy `String` karakterlánc
- a `true` egy `Bool` logikai érték

Ezek különböző típusok, ezért a felhasználásuk is eltérő.

## Gyakori alap típusok Swiftben

Kezdő szinten a leggyakoribb típusok a következők:

- `String`: karakterlánc, vagyis szöveg
- `Int`: egész szám
- `Double`: lebegőpontos szám, vagyis tizedes szám nagyobb pontossággal
- `Bool`: logikai érték (`true` / `false`)

Ezen kívül létezik még `Float` is, amely szintén lebegőpontos típus, de kisebb pontosságú, ezért ritkábban használjuk; valamint `Character`, amely egyetlen karaktert jelöl, például `"A"` vagy `"!"`.

### Típus deklarálása explicit módon

Swiftben a változó deklarálásakor kézzel is megadhatjuk a típust:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

A változónév után `: Típus` formában adjuk meg a típust.

A tömb típusát `: [Típus]` formában írjuk:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Ebben a kódban a `scores` tömb csak `Int` típusú elemeket tárolhat, a `tags` pedig csak `String` típusúakat.

Az explicit típusmegadás tisztábbá teszi a kód szándékát, és bizonyos esetekben segít elkerülni a hibás típuskövetkeztetést.

## Típuskövetkeztetés

Sok esetben nincs szükség az explicit típusmegadásra:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Ez azért működik, mert a Swift fordító a kezdeti értékből automatikusan kikövetkezteti a típust.

## Explicit típusmegadás és típuskövetkeztetés

Az előző leckékben még nem vezettük be az explicit típusmegadást, például ezt:

```swift
var age: Int = 18
```

Hanem inkább a típuskövetkeztetést használtuk:

```swift
var age = 18
```

Ebben a példában a két írásmód egyenértékű, az `age` mindkét esetben `Int` lesz. A típuskövetkeztetés azonban rövidebb és tömörebb.

Azért nem hangsúlyoztuk korábban az explicit típusmegadást, mert a típuskövetkeztetés csökkenti a kód többletinformációját, így a kezdők számára könnyebben érthető.

## Miért van szükség típusokra

A Swift erősen típusos nyelv (`Strongly Typed Language`).

Ez azt jelenti, hogy ha egy változó típusa egyszer meghatározásra került, azt később nem lehet tetszőlegesen megváltoztatni.

Például:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Az első `20` `Int` típusú, ezért hozzárendelhető az `age` változóhoz; a második `"20"` viszont `String`, ami nem egyezik az `Int` típussal, ezért hibát okoz.

A `nums` egy `[Int]` típusú tömb, ezért csak egész számokat tárolhat, karakterláncot nem keverhetünk bele.

A típusok korlátozzák az adatok használatát, és már fordításkor segítenek megtalálni a típusütközéseket. Ezzel csökkentik a típushibákból eredő hibákat, és javítják a kód stabilitását és karbantarthatóságát.

## Mikor kötelező az explicit típusmegadás

Bár a Swift sok esetben automatikusan ki tudja következtetni a típust, vannak helyzetek, amikor a fordító ezt nem tudja jól megtenni, vagy téves eredményre jut. Ilyenkor kézzel kell típust megadni.

**1. Üres tömb**

Üres tömb létrehozásakor kötelező az explicit típusmegadás:

```swift
var nums: [Int] = []
```

Ha nem adunk meg típust:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

A fordító nem tudja megmondani, hogy az üres tömb milyen típusú elemeket fog tartalmazni, ezért fordítási hibát jelez.

**2. Hibás típuskövetkeztetés elkerülése**

```swift
var value = 10   // Int
```

Ebben a példában a `10` ugyan lebegőpontos számként is értelmezhető lenne, de mivel nincs benne tizedespont, a fordító alapértelmezésben `Int`-ként kezeli.

Ha azt szeretnénk, hogy a `value` lebegőpontos szám legyen, explicit módon meg kell adnunk:

```swift
var value: Double = 10   // Double
```

Ha a típuskövetkeztetés eredménye nem felel meg az elvárásnak, explicit típussal vagy a literál módosításával kell biztosítanunk a helyes típust.

**3. Saját típusok**

Később saját típusokat is fogunk tanulni. Ezeknél is gyakran szükség lesz explicit típusmegadásra:

```swift
var info: GameInfo
var users: [User] = []
```

Ennek oka ugyanaz, mint az üres tömbnél: a fordító nem tud típust kikövetkeztetni „üres” értékből.

## Típuskonverzió

Swiftben a különböző típusok között nincs automatikus átalakítás, ezt kézzel kell elvégezni.

Például két különböző típusú szám összeadása:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Ebben a kódban az `a` `Int`, a `b` pedig `Double`, ezért a két érték közvetlenül nem adható össze.

Mielőtt műveletet végzünk velük, az egyik értéket azonos típusra kell alakítani:

```swift
var result = Double(a) + b
```

Ez a kód azt jelenti, hogy az `Int` típusú `a` értékét `Double`-lé alakítjuk, majd így adjuk hozzá a `b`-hez. Az eredmény a `result` változóba kerül.

Fontos, hogy a típuskonverzió nem módosítja az eredeti változó típusát. A `Double(a)` nem változtatja meg `a` típusát, hanem létrehoz egy új `Double` értéket a művelethez.

Más típusok is hasonló módon alakíthatók át, vagyis a céltípus nevéhez `()`-t írunk, és a konvertálni kívánt értéket adjuk át benne. Például:

```
Int()、Double()、String()
```

Példa:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Fontos tudni, hogy nem minden konverzió működik ugyanúgy: például `Double` → `Int` esetén a tizedes rész egyszerűen levágásra kerül, nincs kerekítés.

## Típusalias

Swiftben egy meglévő típusnak adhatunk másik nevet is, hogy a kód jelentése tisztább legyen:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Itt a `UserID` valójában továbbra is `Int`, a típus nem változott meg, csak beszédesebb nevet kapott.

Nagyobb és összetettebb projektekben a típusalias segíthet olvashatóbbá tenni a kódot.

## Típuspélda

Most nézzük meg egy egyszerű példán keresztül, hogyan jelennek meg a típusok a valódi fejlesztésben.

### Változó létrehozása

Először hozzunk létre egy `age` változót:

```swift
var age = 20
```

Mivel ezt az értéket SwiftUI-ban meg szeretnénk jeleníteni és módosítani is akarjuk, `@State`-tel kell deklarálnunk:

```swift
@State private var age = 20
```

A `private`-ról korábban már volt szó: ez azt jelenti, hogy a változó csak az aktuális nézeten belül használható. Később még részletesebben is foglalkozunk vele.

### Adat megjelenítése SwiftUI-ban

Jelenítsük meg az `age` változót SwiftUI-ban:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Most a nézet ezt fogja mutatni:

```swift
age: 20
```

### Adat módosítása

Ezután adjunk hozzá két gombot az `age` módosításához:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Futási eredmény

Ha a `changeAge1` gombra kattintunk, az `age` értéke 18 lesz:

```swift
age = 18
```

Mivel a `18` `Int` típusú, és ez megegyezik az `age` típusával, az értékadás sikeres.

A `changeAge2` viszont hibát okoz:

```swift
age = "18"
```

Hibaüzenet:

```
Cannot assign value of type 'String' to type 'Int'
```

Ennek oka, hogy a `"18"` `String` típusú, mert a karakterláncokat idézőjelek közé kell írni, miközben az `age` `Int` típusú. A két típus nem egyezik, ezért az értékadás nem engedélyezett.

### Miért történik a hiba?

A kulcs ez a sor:

```swift
@State private var age = 20   // Int
```

Bár itt nincs explicit típusmegadás, a kezdeti `20` érték `Int`, ezért a fordító automatikusan `Int` típusként következteti ki az `age` típusát.

Ha egyszer a típus meghatározásra került, már nem rendelhetünk hozzá más típusú értéket.

Ráadásul a `changeAge2` gomb nem futásidőben hibásodik meg, hanem már fordításkor hibát okoz, vagyis a kód le sem fordul.

Ez is a Swift erősen típusos rendszerének egyik előnye: a típushibák már kódírás közben kiderülhetnek.

### Helyes megoldás

Ha eltávolítjuk a hibás kódrészt:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Amikor megnyomod a `changeAge1` gombot, a nézet erre frissül:

```
age: 18
```

### Explicit típusmegadás opcionálisan

A definíciónál a típust kézzel is megadhatjuk:

```swift
@State private var age: Int = 20
```

Ez tisztábban mutatja a típust, de egyszerű helyzetekben nem feltétlenül szükséges.

## Összegzés

Ez a lecke elsősorban a Swift típusrendszeréről és annak gyakorlati szerepéről szólt.

Swiftben minden értéknek egyértelmű típusa van, és a típus határozza meg az adat jelentését, illetve azt, hogy milyen műveletek végezhetők el vele.

A Swift erősen típusos nyelv, ezért ha egy változó típusa meghatározásra került, azt később nem lehet más típusra átírni. Ez a megkötés már fordításkor képes hibát jelezni, így csökkenti a futásidejű problémák számát és növeli a kód biztonságát.

A változó típusa kikövetkeztethető a kezdeti értékből, de explicit módon is megadható. Bizonyos helyzetekben, például üres tömbnél, hibás típuskövetkeztetésnél vagy saját típusoknál, az explicit típusmegadás kötelező.

A különböző típusok nem konvertálódnak automatikusan, ezért ezt az `Int()`, `Double()`, `String()` és hasonló formákkal kézzel kell elvégezni.

A típusoknak alias is adható, ami különösen nagyobb projektekben javítja az olvashatóságot.

A típus nemcsak adatcímke, hanem korlátozó mechanizmus is, amely biztosítja, hogy az adatkezelés biztonságos, egyértelmű és ellenőrizhető maradjon.

## Kiegészítő ismeret - Optional típus

Típuskonverzió közben vannak olyan műveletek, amelyek sikertelenek is lehetnek.

Például ha egy `String` értéket `Double`-lé akarunk alakítani:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Itt a `Double(input)` visszatérési értéke nem `Double`, hanem:

```
Double?
```

Ez az optional típus (`Optional`).

### Miért optional a visszatérési érték?

Mert a karakterlánc tartalma bizonytalan: a `"3.14"` átalakítható `Double`-lé, a `"Hello"` viszont nem.

Vagyis a művelet lehet sikeres is, meg sikertelen is.

Ezért használ a Swift optional típust az ilyen bizonytalan helyzetek jelölésére.

### Mi az az optional típus?

Az optional típus azt jelenti: egy érték vagy létezik, vagy nem létezik.

Például:

```
Double?
```

Ez a típus azt jelenti, hogy ha van érték, akkor nyomtatáskor `Optional(...)` formában látható, ha pedig nincs, akkor `nil` lesz az eredmény.

Fontos, hogy a `nil` azt jelenti, „nincs érték”, és nem azt, hogy 0 vagy üres karakterlánc.

### Példa

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Kimenet:

```
pi:Optional(3.14)
```

Ez azt jelenti, hogy a karakterlánc sikeresen `Double`-lé alakult, az eredmény 3.14, de mivel a típus `Double?`, optionalba van csomagolva.

Ha a konverzió sikertelen:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Kimenet:

```
pi: nil
```

Mivel a `"Hello"` nem alakítható `Double` típussá, az átalakítás sikertelen, és `nil` tér vissza.

### Mi az az Optional(...)?

Ha közvetlenül kinyomtatunk egy optional értéket:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

A Swift ennek az úgynevezett „debug description” alakját jeleníti meg:

```
Optional(3.14)
```

Ez nem az adat része, csak azt jelzi, hogy az aktuális érték egy optional típus, és belül tényleges értéket tartalmaz.

### Optional kicsomagolása

A valódi fejlesztésben általában ki kell vennünk a tényleges értéket az optionalból. Ezt a folyamatot kicsomagolásnak (`Unwrapping`) nevezzük.

Az egyik gyakori megoldás a `??` használata alapértelmezett értékkel:

```
??
```

Ezt nil-egyesítő operátornak (`Nil-Coalescing Operator`) hívják.

Például:

```swift
name ?? "FangJunyu"
```

Ez azt jelenti, hogy ha a `name`-nek van értéke, azt adja vissza; ha pedig `nil`, akkor az alapértelmezett `"FangJunyu"` értéket használja.

Fontos, hogy az alapértelmezett érték típusa meg kell egyezzen az optional típus alapértékével.

### Alapértelmezett érték megadása a ?? segítségével

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Kimenet:

```
pi: 30
```

Amikor az `input` `Double`-lé alakítása sikeres, a tényleges érték jelenik meg. Ha a konverzió sikertelen lenne, akkor a `??` utáni alapértelmezett érték jelenne meg.

Ha a konverzió sikertelen:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Kimenet:

```
pi: 10
```

Itt az `input` `Double`-lé alakítása nem sikerül, ezért `nil` keletkezik, és a `??` operátor a megadott alapértelmezett értéket adja vissza.

Az optional típust olyan helyzetek jelölésére használjuk, amikor „lehet érték, de az is lehet, hogy nincs”.

Típuskonverzió és más, esetleg sikertelen műveletek során a Swift optional típust használ a program biztonságának megőrzésére.

Amikor pedig szükségünk van a benne lévő tényleges értékre, a `??` segítségével megadhatunk alapértelmezett értéket, így `nil` esetén is ésszerű eredményt kapunk.
