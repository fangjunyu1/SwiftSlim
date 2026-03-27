# Operátorok

Ebben a leckében a Swift operátorait (`Operators`) tanuljuk meg.

Amikor számolunk, összehasonlítunk vagy logikai döntést hozunk, mindig operátorokat használunk. Ezek a műveletek végigkísérik a program működését, ezért a programozás legalapvetőbb képességei közé tartoznak.

```swift
let a = 100 * 8
```

A programozás tanulása során sokan észreveszik, hogy akiknek van némi matematikai gondolkodásuk, gyakran könnyebben értik meg a programlogikát. Ennek oka, hogy a programozás lényege szorosan kapcsolódik a „számításhoz” és a „szabályalapú döntéshez”, ezek központi szereplői pedig az operátorok.

Valódi fejlesztésben az operátorokat nemcsak egyszerű számításokra használjuk, hanem sok konkrét helyzetben is.

Például egy blokkos játékban, amikor a felhasználó egy elemet egy meghatározott helyre húz, a rendszernek ki kell számítania:

- a blokk koordinátáit
- azokat a helyeket, ahová a blokk beilleszthető
- azt, hogy a célpozíció elérhető-e

Az ilyen „számítás + ellenőrzés” folyamatok lényegében mind operátorokra épülnek.

![Block](../../Resource/013_block.png)

Az operátorok tanulása tehát nemcsak számolást jelent, hanem alapot ad a későbbi felületelrendezéshez, adatkezeléshez és interakciós logikához is.

## A számítások végrehajtása SwiftUI-ban

SwiftUI-ban általában egy `Button` indít el egy függvényt, és a számítási logikát ebben a függvényben hajtjuk végre.

Például:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Amikor a gombra kattintunk, a `Console` ezt írja ki:

```
c: 20
```

Ebben a leckében egységesen a `func`-ban írjuk meg a számítási logikát, gombnyomással indítjuk, és `print` segítségével nézzük meg az eredményt.

A további példákban az egyszerűbb bemutatás érdekében közvetlenül a kódban fogjuk feltüntetni a számítási eredményt, és nem ismételjük újra mindenhol a `print` használatát.

## Console kimenet kezelése

Mivel minden kattintás újabb kimenetet eredményez, a `Console` terület jobb alsó sarkában lévő törlés gombbal kiürítheted az előzményeket, így könnyebb lesz az aktuális eredményt áttekinteni.

![Console](../../Resource/013_console.png)

## A Button egy másik írásmódja

Amikor a gomb csak egyetlen függvényt futtat, használhatunk rövidebb írásmódot is:

```swift
Button(action: ) {
    // View
}
```

Ebben a formában az `action` adja meg azt a függvényt, amely a gomb megnyomásakor lefut, a kapcsos zárójelek pedig a gomb nézetét írják le.

Az előző `calculate` függvénnyel együtt ez így néz ki:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Amikor megnyomod a gombot, a `calculate` függvény közvetlenül lefut.

Ezért ha a gomb logikája egyszerű, és csak egyetlen függvényt hív meg, az `action` formátum áttekinthetőbb és tisztább megoldás.

## Aritmetikai operátorok

Az aritmetikai operátorok (`Arithmetic Operators`) számértékekkel végzett műveletekre szolgálnak:

- `+` összeadás
- `-` kivonás
- `*` szorzás
- `/` osztás
- `%` maradékos osztás

Példa:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Fontos tudni, hogy a Swift erősen típusos nyelv, ezért nem kever különböző adattípusokat automatikusan:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Ha a két érték típusa eltér, akkor kézzel kell típust konvertálni.

## Összehasonlító operátorok

Az összehasonlító operátorok (`Comparison Operators`) két érték kapcsolatát vizsgálják, és `Bool` eredményt adnak vissza:

- `==` egyenlő
- `!=` nem egyenlő
- `>` nagyobb
- `<` kisebb
- `>=` nagyobb vagy egyenlő
- `<=` kisebb vagy egyenlő

Példa:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Az összehasonlító operátorokat gyakran használjuk feltételekben. Például az idézetkörhintánál ellenőriznünk kell, hogy az index ne lépje túl a tömb határait:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Ha az `index` kisebb, mint a `sayings.count - 1`, akkor az összehasonlítás eredménye `true`, ezért az `if` belsejében lévő kód lefut; ha pedig `false`, akkor nem.

## Logikai operátorok

A logikai operátorok (`Logical Operators`) több feltétel összekapcsolására szolgálnak:

- `&&` és (`AND`)
- `||` vagy (`OR`)
- `!` nem (`NOT`)

### && és

Ha több feltételnek egyszerre kell teljesülnie, `&&`-t használunk.

Például:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Ebben a kódban két feltétel van: `age >= 18` és `age <= 100`.

Csak akkor lesz a `legalAge` igaz, ha mindkét feltétel `true`; ha bármelyik hamis, az eredmény is `false`.

### || vagy

Ha több feltétel közül elég, hogy legalább az egyik teljesüljön, `||`-t használunk.

Például:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Ez azt jelenti, hogy ha a `money >= 50` vagy a `creditCard >= 50` közül bármelyik igaz, akkor a `payAllowed` értéke `true`.

Csak akkor lesz `false`, ha mindkét feltétel hamis.

Például fizetésnél lehet készpénzzel vagy hitelkártyával is fizetni. Ha egyik sem elég, akkor a fizetés sikertelen.

### ! nem

A `!` a logikai tagadás operátora (`NOT`), amely megfordít egy `Bool` értéket.

Egyszerűen úgy érthető, hogy a `true` értéket `false`-szá, a `false` értéket `true`-vá változtatja.

Például:

```swift
let allowed = true
let result = !allowed   // false
```

Itt a `!allowed` az `allowed` értékének ellentétét jelenti.

Fontos megjegyezni, hogy a `!` és a `!=` két különböző operátor: a `!` egy meglévő `Bool` értéket fordít meg, míg a `!=` összehasonlító operátor, amely `Bool` eredményt ad.

## Értékadó operátorok

Az értékadó operátorok (`Assignment Operators`) értékadáshoz vagy változófrissítéshez valók:

- `=` értékadás

Változó deklarálásakor vagy számítás közben gyakran használjuk:

```swift
let a = 5
```

Ez azt jelenti, hogy az `5` értéket az `a` változóhoz rendeljük.

### Összetett értékadó operátorok

Valódi fejlesztésben az egyszerű értékadáson kívül gyakran használjuk az úgynevezett összetett értékadó operátorokat is, amelyek a meglévő értéken számolnak, majd az eredményt visszaírják:

- `+=`
- `-=`
- `*=`
- `/=`

A „számláló” leckében már röviden találkoztunk velük.

Például amikor a gombnyomás hatására egy változót növelünk:

```swift
var num = 10
num += 5   // num = 15
```

Ez a kód azt jelenti, hogy a `num` értékéhez hozzáadunk 5-öt, majd az eredményt visszairjuk a `num` változóba.

Tehát ez egyenértékű ezzel:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternáris operátor

A Swift ternáris operátora (`Ternary Operator`) egy feltétel alapján két érték közül választ:

```swift
feltétel ? érték1 : érték2
```

A működése az, hogy ha a feltétel `true`, akkor az `érték1` lesz az eredmény; ha `false`, akkor az `érték2`.

Például:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Ez a kód megvizsgálja a `showColor` értékét: ha `true`, akkor `Color.blue` lesz az eredmény, vagyis a háttér kék lesz; ha `false`, akkor `Color.clear`, vagyis átlátszó hátteret kapunk.

Tipp: a `Color.clear` átlátszó színt jelent, vagyis semmi nem látszik.

### Mi a különbség az if-else-hez képest

A ternáris operátor logikailag egyenértékű az `if-else` szerkezettel.

Például a fenti kód így is felírható:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

A két megoldás ugyanazt a logikát valósítja meg: ha a feltétel igaz, az első eredmény kerül kiválasztásra; ha hamis, a második.

A gyakorlatban a ternáris operátor rövidebb, ezért különösen alkalmas egyszerű „kettő közül egy” helyzetekhez, amikor közvetlenül egy értéket szeretnénk visszaadni.

SwiftUI nézetépítésben is nagyon gyakori, például:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Ilyenkor egyetlen sorban, feltétel alapján változtathatjuk meg a nézet megjelenését.

## Tartományoperátorok

A tartományoperátorok (`Range Operators`) intervallumok jelölésére szolgálnak:

- `...` zárt tartomány, mindkét végpontot tartalmazza
- `..<` félig nyitott tartomány, a jobb oldali végpontot nem tartalmazza

Például:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Úgy is értelmezheted, hogy az `1...3` 1-től 3-ig tart, és 3-at is tartalmazza; a `5..<8` pedig 5-től 8-ig tart, de a 8 már nincs benne.

Kiterjesztett forma, csak ismerkedésként:

```
5...    // >= 5
...5    // <= 5
```

Ez az írásmód egyoldalú tartományt jelöl, és gyakran feltételes ellenőrzésekben vagy mintaillesztésben használják.

A tartományoperátorok később a `for` ciklusoknál is fontosak lesznek. Egyelőre elég úgy érteni őket, mint egymást követő számok egy szakaszát.

## Operátorgyakorlat

Most néhány egyszerű példán keresztül nézzük meg, hogyan használhatók az operátorok a nézetlogikában.

### 1. A járművek teljes számának kiszámítása

Például egy kereszteződésen naponta 500 autó halad át. Számoljuk ki, hogy 30 nap alatt összesen hány jármű halad át rajta.

Ehhez aritmetikai operátort használhatunk:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Itt a számítás lényege, hogy a napi 500 járművet megszorozzuk 30 nappal, így összesen 15000 járművet kapunk.

### 2. Belső vásárlásos tagság ellenőrzése

Ellenőrizhetjük, hogy egy adott felhasználó tag-e. Ha van örökös tagsága vagy előfizetése, akkor tagnak számít.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Ebben a kódban a `||` operátort használjuk: a `lifeTime = false` azt jelenti, hogy nincs örökös tagság, a `subscription = true` pedig azt, hogy van előfizetés.

Mivel elég, hogy a két feltétel közül az egyik teljesüljön, az `isMember` értéke `true` lesz. Tehát ez a felhasználó tagnak számít.

## Összegzés

Swiftben az operátorok az adatkezelés és a logikai döntések alapját jelentik, ugyanúgy, ahogy a `Text` a megjelenítés alapvető eleme.

Az egyszerű számtani műveletektől a bonyolultabb logikai döntésekig, a nézetállapotok vezérléséig és az elrendezési számításokig mindenhol operátorokkal találkozunk.

Különböző helyzetek gyakorlásával fokozatosan megszokhatod és elsajátíthatod az ebben a leckében bemutatott operátortípusokat. Ez fontos alap lesz a további tanuláshoz.

### Kiegészítő ismeret - Bitenkénti operátorok

Ezen kívül a Swift kínál egy alacsonyabb szintű operátorcsoportot is, a bitenkénti operátorokat (`Bitwise Operators`):

- `&` bitenkénti és
- `|` bitenkénti vagy
- `^` bitenkénti kizáró vagy
- `~` bitenkénti negálás
- `>>` jobbra tolás
- `<<` balra tolás

Például:

```swift
let a = 6  // bináris: 110
let b = 3  // bináris: 011

print(a & b) // 2 (bináris: 010)
print(a | b) // 7 (bináris: 111)
print(a ^ b) // 5 (bináris: 101)
print(~a)    // -7 (bitenkénti negálás)
```

Swiftben az egész számok kettes komplemens bináris formában vannak tárolva, ezért a negálás után a megfelelő negatív eredményt kapjuk.

A bitenkénti operátorok közvetlenül a bináris biteken dolgoznak, ezért többnyire alacsony szintű adatkezelésben és teljesítményoptimalizálási helyzetekben használatosak.

Kezdők számára ezek ritkábban szükségesek, és az általános iOS vagy SwiftUI fejlesztésben sem túl gyakoriak, ezért itt nem megyünk bele mélyebben.

Ha később alacsonyabb szintű logikával vagy teljesítményoptimalizálással találkozol, akkor érdemes lesz külön is utánanézni.
