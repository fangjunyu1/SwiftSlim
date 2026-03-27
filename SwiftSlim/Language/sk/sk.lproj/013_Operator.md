# Operátory

V tejto lekcii sa budeme učiť operátory (`Operators`) v jazyku Swift.

Keď vykonávame výpočty, porovnania alebo logické rozhodovanie, vždy potrebujeme používať operátory. Tieto operácie sa objavujú v každej časti programu a patria medzi najzákladnejšie schopnosti v programovaní.

```swift id="mh7wql"
let a = 100 * 8
````

Počas učenia programovania si veľa ľudí všimne, že ľudia s určitým matematickým myslením často ľahšie chápu programovú logiku. Je to preto, že programovanie je vo svojej podstate neoddeliteľné od „výpočtov“ a „rozhodovania podľa pravidiel“, a práve to je hlavná úloha operátorov.

V reálnom vývoji sa operátory nepoužívajú iba na jednoduché číselné výpočty, ale aj v mnohých konkrétnych situáciách.

Napríklad v hre s blokmi, keď používateľ potiahne blok na určené miesto, treba vypočítať:

* súradnicovú polohu bloku
* miesto, ktoré môže blok vyplniť
* či je cieľová pozícia dostupná

Tieto procesy „výpočet + rozhodnutie“ sú vo svojej podstate založené práve na operátoroch.

![Block](../../Resource/013_block.png)

Učenie operátorov teda neznamená iba učenie sa počítať s číslami, ale aj budovanie základu pre neskoršie rozloženie rozhrania, spracovanie dát a logiku interakcií.

## Spôsob vykonávania výpočtov v SwiftUI

V SwiftUI sa výpočtová logika zvyčajne spúšťa cez `Button`, ktorý zavolá funkciu, a samotný výpočet sa vykoná vo funkcii.

Napríklad:

```swift id="f30kzc"
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

Po kliknutí na tlačidlo sa v `Console` zobrazí:

```id="83bo9r"
c: 20
```

V tejto lekcii budeme výpočtovú logiku jednotne zapisovať do `func`, spúšťať ju tlačidlom a výsledky zobrazovať pomocou `print`.

V ďalších príkladoch už kvôli zjednodušeniu nebudeme opakovane používať `print`, ale výsledky budeme priamo označovať v kóde.

## Správa výstupu v Console

Keďže každé kliknutie vytvorí výstup, môžete kliknúť na tlačidlo na vyčistenie v pravom dolnom rohu oblasti `Console`, aby ste vymazali históriu logov a ľahšie videli aktuálny výsledok.

![Console](../../Resource/013_console.png)

## Ďalší spôsob zápisu Button

Keď tlačidlo vykonáva iba jednu funkciu, môžeme použiť stručnejší zápis:

```swift id="hye44u"
Button(action: ) {
    // View
}
```

V tomto zápise `action` určuje funkciu, ktorá sa má vykonať po kliknutí na tlačidlo (funkcia bez parametrov), a zložené zátvorky `{}` definujú view tlačidla.

Ak to spojíme s predchádzajúcou funkciou `calculate`, môžeme to zapísať takto:

```swift id="pj4x3u"
Button(action: calculate) {
    Text("Button")
}
```

Po kliknutí na tlačidlo sa priamo vykoná funkcia `calculate`.

Preto keď je logika tlačidla jednoduchá a iba volá jednu funkciu, zápis pomocou `action` je prehľadnejší a viac zodpovedá štýlu dobrého kódu.

## Aritmetické operátory

Aritmetické operátory (`Arithmetic Operators`) sa používajú na číselné výpočty:

* `+` sčítanie
* `-` odčítanie
* `*` násobenie
* `/` delenie
* `%` zvyšok po delení

Príklady:

```swift id="v6a6sh"
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Treba si všimnúť, že Swift je silno typovaný jazyk a automaticky nemieša rôzne dátové typy:

```swift id="2vtq56"
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Keď sa dva typy nezhodujú, musíme ich previesť ručne.

## Porovnávacie operátory

Porovnávacie operátory (`Comparison Operators`) sa používajú na určenie vzťahu medzi dvoma hodnotami a výsledkom je `Bool`:

* `==` rovná sa
* `!=` nerovná sa
* `>` väčšie než
* `<` menšie než
* `>=` väčšie alebo rovné
* `<=` menšie alebo rovné

Príklady:

```swift id="h8rj3p"
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Porovnávacie operátory sa často používajú v podmienených príkazoch. Napríklad v „kolotoči citátov“ potrebujeme zabezpečiť, aby index neprekročil rozsah poľa:

```swift id="6i9e3m"
if index < sayings.count - 1 {
    index += 1
}
```

Ak je `index` menší než `sayings.count - 1`, výsledok porovnania je `true` a kód v `if` sa vykoná. Ak je výsledok `false`, nasledujúci kód sa nevykoná.

## Logické operátory

Logické operátory (`Logical Operators`) sa používajú na kombinovanie viacerých podmienok:

* `&&` a (`AND`)
* `||` alebo (`OR`)
* `!` nie (`NOT`)

### && a

Keď musia byť splnené viaceré podmienky naraz, použijeme `&&`.

Napríklad:

```swift id="a5e0qo"
let age = 16
let legalAge = age >= 18 && age <= 100
```

V tomto kóde sú dve podmienky: `age >= 18` a `age <= 100`.

Iba ak budú obe podmienky `true`, bude aj `legalAge` `true`. Stačí, aby jedna z nich neplatila, a výsledok bude `false`.

### || alebo

Keď stačí splniť iba jednu z viacerých podmienok, použijeme `||`.

Napríklad:

```swift id="p9k4bx"
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Tento kód znamená, že pokiaľ platí aspoň jedna z podmienok `money >= 50` alebo `creditCard >= 50`, potom je `payAllowed` `true`.

Iba keď neplatí ani jedna z podmienok, výsledok bude `false`.

Napríklad pri platbe možno použiť hotovosť alebo kreditnú kartu. Ak sa nedá platiť ani jedným spôsobom, platba zlyhá.

### ! nie

`!` je logický negátor (`NOT`) a používa sa na obrátenie hodnoty typu `Bool`.

Jednoducho povedané, `!` zmení `true` na `false` a `false` na `true`.

Napríklad:

```swift id="mhxr6g"
let allowed = true
let result = !allowed   // false
```

Tu `!allowed` znamená obrátenie hodnoty premennej `allowed`.

Treba si uvedomiť, že `!` a `!=` sú dva rôzne operátory. `!` obracia hodnotu typu `Bool`, zatiaľ čo `!=` je porovnávací operátor, ktorý vracia `Bool`.

## Operátory priradenia

Operátory priradenia (`Assignment Operators`) sa používajú na priradenie alebo aktualizáciu hodnoty premennej:

* `=` priradenie

Pri deklarovaní premenných aj pri výpočtoch sa bežne stretávame s priradením:

```swift id="yyl6rj"
let a = 5
```

Tento kód znamená, že číselná hodnota `5` sa priradí premennej `a`.

### Zložené operátory priradenia

V reálnom vývoji sa okrem základného operátora priradenia často používajú aj „zložené operátory priradenia“, ktoré umožňujú vykonať výpočet priamo na pôvodnej hodnote a zároveň ju aktualizovať:

* `+=`
* `-=`
* `*=`
* `/=`

V predchádzajúcej lekcii o „počítadle“ sme sa so zloženými operátormi priradenia už stručne stretli.

Napríklad keď chceme po kliknutí na tlačidlo automaticky zvýšiť hodnotu premennej:

```swift id="43qg4d"
var num = 10
num += 5   // num = 15
```

Tento kód znamená, že `num` sa sčíta s `5` a výsledok sa znovu priradí späť do `num`.

Preto je to ekvivalentné tomuto zápisu:

```swift id="izfrss"
var num = 10
num = num + 5   // num = 15
```

## Ternárny operátor

Ternárny operátor (`Ternary Operator`) v jazyku Swift vyhodnotí podmienku a vráti jednu z dvoch hodnôt:

```swift id="1ndpga"
条件 ? 值1 : 值2
```

Jeho logika je takáto: ak je podmienka `true`, vráti „hodnotu 1“; ak je podmienka `false`, vráti „hodnotu 2“.

Napríklad:

```swift id="t3i1yu"
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Tento kód vyhodnotí hodnotu `showColor`: ak je `true`, vráti `Color.blue` a pozadie bude modré; ak je `false`, vráti `Color.clear`, teda bez zobrazenia farby pozadia.

Tip: `Color.clear` znamená priehľadnú farbu (nič nezobrazuje).

### Rozdiel oproti if-else

Ternárny operátor je z pohľadu logiky ekvivalentný príkazu `if-else`.

Napríklad vyššie uvedený kód môžeme prepísať takto:

```swift id="c4tvyp"
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logika vykonania je úplne rovnaká: ak je podmienka `true`, použije sa prvý výsledok; ak je `false`, použije sa druhý výsledok.

V praxi je ternárny operátor stručnejší a hodí sa najmä na jednoduché rozhodovanie typu „jedno z dvoch“, často keď chceme priamo vrátiť hodnotu.

Pri vytváraní `View` v SwiftUI je ternárny operátor veľmi častý, napríklad:

```swift id="rqjlwm"
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Takýto zápis umožňuje v jednom riadku dynamicky meniť vzhľad view podľa podmienky.

## Operátory rozsahu

Operátory rozsahu (`Range Operators`) sa používajú na vyjadrenie intervalu:

* `...` uzavretý interval (obsahuje oba konce)
* `..<` polootvorený interval (neobsahuje pravý koniec)

Napríklad:

```id="91ie5v"
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Môžeme si to predstaviť tak, že `1...3` znamená od `1` do `3` vrátane `3`; `5..<8` znamená od `5` do `8`, ale bez `8`.

Rozšírené formy (len na oboznámenie):

```id="exn3m2"
5...    // >= 5
...5    // <= 5
```

Tento zápis predstavuje „jednostranný rozsah“ a často sa používa v podmienkach alebo pri porovnávaní vzorov.

Operátory rozsahu sa budú používať neskôr pri cykle `for`. Zatiaľ si ich môžete predstaviť jednoducho ako súvislý rozsah čísel.

## Cvičenie s operátormi

Teraz si pomocou niekoľkých jednoduchých príkladov precvičíme úlohu operátorov vo view.

### 1. Výpočet celkového počtu vozidiel

Napríklad ak cez určitú križovatku prejde denne 500 áut, chceme vypočítať celkový počet áut za 30 dní.

Môžeme použiť aritmetické operátory:

```swift id="g1111m"
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Výpočet tu funguje tak, že denne prejde 500 áut a za 30 dní je to `500 × 30`, takže konečný výsledok je 15000 áut.

### 2. Určenie členstva v nákupe v aplikácii

Môžeme určiť, či je niekto členom v rámci nákupu v aplikácii. Stačí, aby mal buď doživotné členstvo, alebo predplatné, a budeme ho považovať za člena.

```swift id="aum1kj"
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

V tomto kóde sa používa operátor `||` (`alebo`): `lifeTime = false` znamená, že používateľ nemá doživotné členstvo; `subscription = true` znamená, že má predplatné.

Keďže stačí splniť jednu z podmienok, `isMember` bude `true`. Preto je táto osoba členom.

## Zhrnutie

V jazyku Swift sú operátory základom výpočtov s dátami a logického rozhodovania. Podobne ako `Text` slúži na zobrazovanie obsahu, operátory slúžia na spracovanie samotných dát.

Od najjednoduchších číselných výpočtov, cez zložitejšie logické rozhodovanie, až po riadenie stavu view a výpočty rozloženia, všade sa bez operátorov nezaobídeme.

Postupným precvičovaním rôznych situácií si môžete postupne osvojiť a zvládnuť všetky druhy operátorov predstavené v tejto lekcii. To je dôležitý základ pre ďalšie učenie.

### Rozšírené vedomosti – bitové operátory

Okrem toho Swift poskytuje aj skupinu nižšej úrovne operátorov — bitové operátory (`Bitwise Operators`):

* `&` (bitové AND)
* `|` (bitové OR)
* `^` (bitové XOR)
* `~` (bitové NOT)
* `>>` (posun doprava)
* `<<` (posun doľava)

Napríklad:

```swift id="j8b3yc"
let a = 6  // binárne 110
let b = 3  // binárne 011

print(a & b) // 2 (binárne 010)
print(a | b) // 7 (binárne 111)
print(a ^ b) // 5 (binárne 101)
print(~a)    // -7 (negácia)
```

V jazyku Swift sú celé čísla reprezentované v dvojkovom doplnku, preto po bitovej negácii dostaneme zodpovedajúci záporný výsledok.

Bitové operátory pracujú priamo s binárnymi hodnotami a zvyčajne sa používajú pri nízkoúrovňovom spracovaní dát alebo pri optimalizácii výkonu.

Pre začiatočníkov sú scenáre použitia týchto operátorov pomerne zriedkavé a ani pri bežnom vývoji v iOS alebo SwiftUI sa s nimi nestretávame často, preto ich tu nebudeme rozoberať do hĺbky.

Ak sa neskôr dostaneme k nízkoúrovňovej logike alebo optimalizácii výkonu, môžeme sa k nim vrátiť a podrobnejšie si ich vysvetliť.