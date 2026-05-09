# Számított tulajdonságok

Ebben a leckében főként a számított tulajdonságokat tanuljuk meg.

A számított tulajdonságok meglévő adatok alapján számítanak ki egy új eredményt. Számértékeket is kiszámíthatnak, és olyan tartalmat is, amelyet SwiftUI nézetekben kell megjeleníteni.

Például:

```swift
let a = 10
let b = 20
let c = a + b
```

Itt a `c` az `a` és a `b` összeadásának eredményét jelenti.

Hétköznapi kódban ez az írásmód nagyon gyakori.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tipp: a `Button` koppintási eseményében normál Swift-kód futtatható.

Ha azonban hasonló kódot közvetlenül egy SwiftUI nézet tulajdonságai közé írunk, problémába ütközünk.

Például:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Ez a kód hibát fog adni.

Úgy tűnik, hogy az `a` és a `b` már a `c` előtt szerepel, ezért mintha ki lehetne számítani a `c` értékét.

Egy struktúra tulajdonságdeklarációiban azonban ez az írásmód közvetlenül nem használható.

## Miért nem tudja c közvetlenül kiszámítani az a + b értékét?

Mert az `a`, `b` és `c` nem egy gomb koppintási eseményében lévő ideiglenes konstansok, hanem a `ContentView` nézet tulajdonságai.

Egy gomb koppintási eseményében ez a kód normálisan fut:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Mert a gomb megérintése után a kód sorban fut. Először létrejön az `a`, aztán a `b`, végül pedig az `a + b` segítségével kiszámolódik a `c`.

De amikor egy nézeten belül deklarálunk tulajdonságokat, a helyzet más:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Itt az `a`, `b` és `c` mind a `ContentView` nézet tulajdonságai.

Amikor a `ContentView` nézet létrejön, a Swiftnek először elő kell készítenie ezeket a tulajdonságokat. A létrehozási folyamat biztonsága érdekében a Swift nem engedi, hogy egy példány tárolt tulajdonságának alapértelmezett értéke közvetlenül olvassa ugyanannak a példánynak más példánytulajdonságait.

Ezért ez a sor hibát ad:

```swift
let c = a + b
```

Egyszerűen így érthetjük meg: **amikor egy nézeten belül deklarálunk tulajdonságokat, egy szokásos tulajdonsággal nem számíthatunk ki közvetlenül egy másik szokásos tulajdonságot.**

Az olyan tulajdonságot, amely közvetlenül tárol egy értéket, "tárolt tulajdonságnak" nevezzük. A könnyebb megértéshez ideiglenesen szokásos tulajdonságként is gondolhatunk rá.

Például:

```swift
let a = 10
```

Az `a` a `10` értéket tárolja.

```swift
let b = 20
```

A `b` a `20` értéket tárolja.

De:

```swift
let c = a + b
```

Itt a `c` nem közvetlenül beírt érték, hanem az `a + b` alapján szeretnénk kiszámítani.

Ilyen helyzetben, amikor "meglévő adatokból kapunk eredményt", a számított tulajdonság megfelelőbb.

Így módosítható:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Itt a `c` számított tulajdonság.

```swift
var c: Int {
    return a + b
}
```

Ez azt jelenti: **amikor használni kell a `c` értékét, akkor olvassa be az `a` és `b` értékét, majd adja vissza az `a + b` eredményét.**

Például:

```swift
Text("c: \(c)")
```

Amikor a `Text` megjeleníti a `c` értékét, akkor indul el a `c` kiszámítása.

## Mi az a számított tulajdonság?

A számított tulajdonság változónak tűnik, de önmagában nem tárol adatot.

Például:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Itt a `c` számított tulajdonság.

Nem tárol rögzített értéket, mint egy szokásos tulajdonság, hanem minden alkalommal, amikor a `c` olvasásra kerül, újra lefuttatja a `{}` belsejében lévő kódot, és visszaadja a számítás eredményét.

Így érthető:

```swift
var c: Int {
    return a + b
}
```

Amikor használni kell a `c` értékét, kiszámoljuk az `a + b` eredményét.

Ezért a számított tulajdonság ilyen helyzetre alkalmas: **egy eredményt nem kell külön tárolni, mert meglévő adatokból kiszámítható.**

## Alapvető írásmód

A számított tulajdonság általában három részből áll:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklarálás `var` használatával

```swift
var c
```

A számított tulajdonságot `var` segítségével kell deklarálni; `let` nem használható.

Mert a számított tulajdonság nem rögzített tárolt érték, hanem minden olvasáskor dinamikusan kiszámított eredmény.

### 2. A visszatérési típus megadása

```swift
var c: Int
```

A számított tulajdonságnak meg kell adnia a visszatérési típusát.

Itt a `c` végül egész számot ad vissza, ezért a típusa `Int`.

### 3. A számítási logika megírása {} segítségével

```swift
{
    return a + b
}
```

A `{}` belsejében a számítási logika van; itt az `a + b` kerül visszaadásra.

## A return kulcsszó

A számított tulajdonságnak vissza kell adnia egy eredményt.

Például:

```swift
var c: Int {
    return a + b
}
```

Itt a `return` jelentése: add vissza az `a + b` számítás eredményét.

Ha a számított tulajdonság csak egy olyan kifejezést tartalmaz, amely közvetlenül eredményt ad, a `return` elhagyható:

```swift
var c: Int {
    a + b
}
```

Ha azonban a számított tulajdonság több kódsort tartalmaz, a `return` használatával kell egyértelműen visszaadni az eredményt.

Például:

```swift
var totalPriceText: String {
    let total = count * price
    return "Összesen: \(total) $"
}
```

Itt a számítási folyamat két lépésre oszlik.

Első lépésként kiszámítjuk a teljes árat:

```swift
let total = count * price
```

Második lépésként a teljes árat szöveggé fűzzük, majd visszaadjuk:

```swift
return "Összesen: \(total) $"
```

Ha eltávolítjuk a `return` szót:

```swift
var totalPriceText: String {
    let total = count * price
    "Összesen: \(total) $"
}
```

Ez a kód hibát fog adni.

Az ok: **ez a számított tulajdonság már több kódsort tartalmaz, és a Swift már nem tudja automatikusan eldönteni, melyik sor a végső visszatérési eredmény.**

Ezért ha a számított tulajdonság csak egy eredménysort tartalmaz, a `return` elhagyható.

```swift
var c: Int {
    a + b
}
```

Ha a számított tulajdonság több kódsort tartalmaz, ajánlott egyértelműen kiírni a `return` szót.

```swift
var totalPriceText: String {
    let total = count * price
    return "Összesen: \(total) $"
}
```

## A számított és szokásos tulajdonság különbsége

A szokásos tulajdonság adatot tárol.

```swift
var c = 30
```

Itt a `c` egy konkrét értéket tárol: `30`.

A számított tulajdonság nem tárol adatot.

```swift
var c: Int {
    a + b
}
```

Itt a `c` nem tárolja a `30` értéket. Csak egy számítási módot biztosít.

Amikor a `c` olvasásra kerül, a Swift ezt futtatja:

```swift
a + b
```

Majd visszaadja a számítás eredményét.

Ezért a számított tulajdonságok olyan helyzetekre alkalmasak, amikor az eredmény más adatokból számolódik.

## A body is számított tulajdonság

A számított tulajdonságok megtanulása után újra megérthetjük a SwiftUI egyik leggyakoribb kódrészletét:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Itt a `body` is számított tulajdonság.

`var` segítségével van deklarálva:

```swift
var body
```

Van visszatérési típusa:

```swift
some View
```

A `{}` belsejében SwiftUI nézettartalmat ad vissza:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Ezért a `body` így érthető: amikor a SwiftUI-nak meg kell jelenítenie ezt a nézetet, beolvassa a `body` értékét, és a `body` által visszaadott tartalom alapján létrehozza a felületet.

Ha kiírjuk a `return` szót, így érthetjük:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

SwiftUI-ban azonban általában elhagyjuk a `return` szót, és közvetlenül írjuk:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Amikor a `@State` adatok megváltoznak, a SwiftUI újra beolvassa a `body` értékét, és az új adatok alapján frissíti a felületet.

Például:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("szám: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

A gomb megérintése után a `count` megváltozik.

```swift
count += 1
```

Miután a `count` megváltozik, a SwiftUI újraszámítja a `body` értékét, ezért a felületen lévő szöveg is frissül.

```swift
Text("szám: \(count)")
```

Ez az oka annak is, hogy SwiftUI-ban az adatok változása után a felület automatikusan frissülhet.

### Nem ajánlott összetett számításokat írni a body-ba

Mivel a `body` számított tulajdonság, sokszor beolvasható és újraszámítható.

Például:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("szám: \(num)")
            Text("név: \(name)")
        }
    }
}
```

Amikor a `name` megváltozik, a SwiftUI újraszámítja a `body` értékét.

Ekkor a `body` belsejében lévő kód is újra lefut, és a `num` is újra létrejön.

```swift
let num = 10
```

Ebben a példában a `num` nagyon egyszerű, ezért a hatása nem nagy.

Ha azonban a `body` összetett számításokat végez, például sok adat szűrését, rendezését, képfeldolgozást stb., az befolyásolhatja a felület gördülékenységét.

Ezért SwiftUI-ban a `body` fő feladata a felület szerkezetének leírása legyen.

Egyszerű ideiglenes adatok írhatók a `body` belsejébe.

Az összetett számításokat érdemes a `body`-n kívüli számított tulajdonságokba, metódusokba vagy külön adatfeldolgozásba helyezni.

## Példa: mennyiség és teljes ár

Most egy egyszerű példán keresztül értjük meg a számított tulajdonságokat.

Tegyük fel, hogy egy répa egységára 2 $, a felhasználó gombokkal módosíthatja a vásárolt mennyiséget, és a felületnek meg kell jelenítenie a teljes árat.

A teljes ár számítása:

```
mennyiség * egységár
```

Ha a teljes árat szokásos változóban tároljuk, az kissé körülményes lesz.

Mert minden alkalommal, amikor a mennyiség változik, kézzel kell frissíteni a teljes árat.

Jobb megoldás számított tulajdonságot használni:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("ár: \(price) $")
                Text("mennyiség: \(count)")
                Text("teljes ár: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Megjelenítési eredmény:

![view](../../Resource/024_view.png)

Ebben a példában:

```swift
@State private var count = 1
```

A `count` a répák mennyiségét jelenti. Amikor a gombot megérintjük, a `count` megváltozik.

```swift
private let price = 2
```

A `price` a répa egységárát jelenti. Itt ez rögzített érték, ezért `let` van használva.

```swift
private var totalPrice: Int {
    count * price
}
```

A `totalPrice` a teljes árat jelenti.

Nem kell külön tárolni, mert a teljes ár mindig kiszámítható a `count * price` alapján.

Amikor a `count` értéke `1`:

```swift
totalPrice = 1 * 2
```

A megjelenített eredmény:

```swift
teljes ár: 2 $
```

A `+` gomb megérintése után a `count` értéke `2` lesz.

Ekkor, amikor a `totalPrice` újra olvasásra kerül, újraszámolódik:

```swift
totalPrice = 2 * 2
```

A megjelenített eredmény:

```swift
teljes ár: 4 $
```

Ez a számított tulajdonság szerepe: meglévő adatok alapján dinamikusan új eredményt számít ki.

## A számított tulajdonságok ellenőrzésre is használhatók

A számított tulajdonságok nemcsak számértékeket tudnak kiszámítani, hanem ellenőrzési eredményeket is visszaadhatnak.

Például amikor azt szeretnénk, hogy a mennyiség minimuma 1 legyen.

Amikor a mennyiség már 1, a `-` gombnak nem szabad tovább csökkentenie.

Hozzáadhatunk egy számított tulajdonságot:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Teljes kód:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("ár: \(price) $")
                Text("mennyiség: \(count)")
                Text("teljes ár: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Megjelenítési eredmény:

![view](../../Resource/024_view1.png)

Itt:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Ez a kód azt jelzi, hogy jelenleg lehet-e tovább csökkenteni.

Amikor a `count` nagyobb, mint `1`:

```swift
canDecrease == true
```

ez azt jelenti, hogy lehet csökkenteni.

Amikor a `count` egyenlő `1`-gyel:

```swift
canDecrease == false
```

ez azt jelenti, hogy nem lehet tovább csökkenteni.

### Feltételes ellenőrzés a gombban

A gombban ezt használjuk:

```swift
if canDecrease {
    count -= 1
}
```

Csak akkor csökkenthető a `count`, ha a `canDecrease` értéke `true`.

### A nézet előtérszínének vezérlése

A `canDecrease` segítségével a gomb előtérszíne is vezérelhető:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Itt a ternáris operátor használatos:

```swift
canDecrease ? Color.primary : Color.gray
```

Ennek a kódnak a jelentése: ha a `canDecrease` `true`, az előtérszín `Color.primary`; ha a `canDecrease` `false`, az előtérszín `Color.gray`.

A `Color.primary` a SwiftUI által biztosított rendszerszintű szemantikus szín. Az aktuális felület fő szövegszínét jelenti.

Világos módban a `Color.primary` általában közel fekete; sötét módban általában közel fehér.

Ezért a `Color.primary` előnye, hogy automatikusan alkalmazkodik a világos és sötét módhoz.

### A nézet letiltott állapotának vezérlése

A `disabled` azt vezérli, hogy egy nézet le van-e tiltva:

```swift
.disabled(!canDecrease)
```

Amikor a `disabled` értéke `false`, a nézet megérinthető.

Amikor a `disabled` értéke `true`, a nézet le van tiltva, és nem érinthető meg.

Itt a `canDecrease` feltételként való használata könnyebben érthetővé teszi a kódot.

Amikor látjuk a `canDecrease` nevet, tudjuk, hogy azt jelenti: "lehet-e most tovább csökkenteni".

### Kiegészítő magyarázat: miért van két ellenőrzés?

A `-` gombban:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Itt a `.disabled(!canDecrease)` is használva van, és a gombon belül az `if canDecrease` is.

A `.disabled(!canDecrease)` feladata, hogy a felületen letiltsa a gombot, így a felhasználó nem tudja megérinteni.

Az `if canDecrease` feladata, hogy a kód futása előtt újra ellenőrizzen. A `count -= 1` csak akkor fut le, ha a csökkentés megengedett.

Ez kettős védelem. Valódi fejlesztésben, ha a gomb már le van tiltva, a belső ellenőrzés elhagyható. Oktatási példában viszont meghagyjuk, hogy a `canDecrease` szerepe világosabb legyen.

## Összefoglalás

Ebben a leckében főként a számított tulajdonságokat tanultuk meg.

A számított tulajdonság nem tárolja közvetlenül az értéket. Ehelyett olvasáskor meglévő adatokból számít ki eredményt.

Például:

```swift
var c: Int {
    a + b
}
```

Itt a `c` értékét nem kell külön tárolni, mert az `a + b` alapján kiszámítható.

A számított tulajdonságot `var` segítségével kell deklarálni, és meg kell adni a visszatérési típust.

```swift
var canDecrease: Bool {
    count > 1
}
```

A számított tulajdonságok nemcsak számértékeket, hanem ellenőrzési eredményeket, szöveges tartalmat, sőt SwiftUI nézettartalmat is visszaadhatnak.

Ebben a leckében a `return` kulcsszót is megtanultuk.

A `return` azt jelenti, hogy visszaadunk egy eredményt:

```swift
var totalPriceText: String {
    let total = count * price
    return "Összesen: \(total) $"
}
```

Ha egy számított tulajdonság csak egy olyan kifejezést tartalmaz, amely közvetlenül eredményt ad, a `return` elhagyható.

```swift
var totalPrice: Int {
    count * price
}
```

Ezenkívül megismertük a `Color.primary` és a `disabled` használatát is.

A `Color.primary` a SwiftUI rendszerszintű szemantikus színe. Automatikusan igazítja a megjelenést a világos és sötét módhoz.

```swift
.foregroundStyle(Color.primary)
```

A `disabled` azt vezérli, hogy egy nézet le van-e tiltva.

```swift
.disabled(true)
```

Ez azt jelenti, hogy le van tiltva, nem érinthető meg.

```swift
.disabled(false)
```

Ez azt jelenti, hogy elérhető, megérinthető.

Ezért a számított tulajdonságok nagyon gyakoriak a SwiftUI-ban. Segítenek tisztábban rendezni a számítási eredményeket, ellenőrzési feltételeket és megjelenített tartalmat.
