# Premenné a konštanty

V tejto lekcii sa budeme učiť hlavne o premenných a konštantách v Swifte a zároveň sa zoznámime s niektorými bežnými dátovými typmi a základnými operátormi.

Tieto poznatky patria k úplným základom programovania a zároveň sú dôležitým základom pre neskoršie štúdium SwiftUI.

## Premenné a konštanty v bežnom živote

Premenné a konštanty si môžeme vysvetliť pomocou vecí z bežného života.

Premenné v bežnom živote:

- obsah každého programu v televízii je iný
- počasie je každý deň iné
- ručičky hodín sa menia každú sekundu

Spoločnou vlastnosťou týchto vecí je to, že sa menia.

Ak by televízor stále zobrazoval iba jeden obraz, počasie by bolo stále slnečné a ručičky hodín by sa nikdy nehýbali, potom by tieto veci boli konštanty.

Jedna vec sa môže meniť, druhá sa meniť nemôže.

## Pochopenie premenných a konštánt

Pri vývoji App je zvyčajne potrebné, aby používateľ zadal alebo uložil určité informácie.

Napríklad:

- názov účtu
- dátum narodenia
- kontaktné údaje
- adresa

Tieto informácie sa uložia a potom zobrazia.

Napríklad používateľ zadá do App meno:

``` id="t7y1na"
FangJunyu
```

Toto meno musíme uložiť, aby sa mohlo zobraziť v App.

Proces ukladania si môžeme jednoducho predstaviť tak, že niečo ukladáme do zásuvky.

Keď uložíme meno, je to, akoby sme meno vložili do jednej zásuvky.

Vecí, ktoré treba uložiť, môže byť veľa, a preto môže byť veľa aj zásuviek. Aby sme vedeli, čo je v ktorej zásuvke uložené, musíme každej zásuvke dať názov.

Napríklad:

```id="4j98wd"
name
```

V tomto príklade je name názov a FangJunyu je uložená informácia.

![Var](../../RESOURCE/007_var.png)

**V Swifte platí, že ak chceme uložiť údaje, musíme ich deklarovať pomocou premennej (var) alebo konštanty (let).**

Keďže meno sa zvyčajne môže meniť, mali by sme použiť premennú.

```swift id="qu1620"
var name = "FangJunyu"
```

Tu sme deklarovali premennú s názvom name, ktorej typ je String a hodnota je "FangJunyu".

### Rozdiel medzi premennou a konštantou

Premenná sa deklaruje pomocou var:

```swift id="0w4cq7"
var
```

Konštanta sa deklaruje pomocou let:

```swift id="r10udn"
let
```

Napríklad:

```swift id="rhb7v8"
var name = "FangJunyu"
let id = 123456
```

Ak deklarujeme hodnotu ako premennú, znamená to, že ju možno zmeniť. Ak ju deklarujeme ako konštantu, už ju zmeniť nemožno.

Hlavný rozdiel medzi premennou a konštantou teda spočíva v tom, či sa hodnota môže meniť.

### Zmena konštanty

Ak sa kód pokúsi zmeniť hodnotu konštanty:

```swift id="h7s3k9"
let name = "Sam"
name = "Bob"
```

Swift vypíše, že priradenie nemožno vykonať, pretože ide o konštantu.

```id="ph6qaq"
Cannot assign to property: 'name' is a 'let' constant
```

Tento mechanizmus pomáha vývojárom zabrániť tomu, aby sa niektoré dôležité údaje omylom zmenili.

### Zobrazenie v SwiftUI

Otvorte súbor ContentView.swift a deklarujte premennú vo vnútri View:

```swift id="cnh4kx"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Tu sme deklarovali premennú s názvom name a zobrazili ju na obrazovke pomocou Text.

Ak zmeníme obsah premennej:

```swift id="k4d1k9"
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Zmení sa aj text zobrazený cez Text.

Týmto spôsobom môžeme pomocou premennej riadiť obsah, ktorý sa zobrazuje v rozhraní, bez toho, aby sme museli zakaždým priamo upravovať text v Text.

Ak je túto informáciu potrebné získať aj inde, môžeme premennú odovzdať ďalej, čo je podobné, ako keby sme obsah „zásuvky“ poskytli na použitie inému miestu.

### Umiestnenie premenných a konštánt v SwiftUI

V SwiftUI sa premenné a konštanty zvyčajne píšu mimo body:

```swift id="8lglgy"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Samozrejme, premenné a konštanty možno písať aj vo vnútri body:

```swift id="64t9nf"
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Medzi týmito dvoma spôsobmi však existuje dôležitý rozdiel:

* ak sú premenné a konštanty napísané vo vnútri body, pri každom prepočte View sa znova vytvoria,
* ak sú napísané mimo body, existujú ako vlastnosti štruktúry View a štruktúra kódu je prehľadnejšia.

Preto sa v skutočnom vývoji premenné a konštanty zvyčajne píšu mimo body.

## Dátové typy

Premenné môžu ukladať veľa rôznych druhov údajov a tieto druhy sa nazývajú dátové typy.

Napríklad predtým sme používali Text na zobrazenie textu:

```swift id="tnz6j3"
Text("Hello, World")
```

Tu je "Hello, World" typu String, teda reťazec.

Reťazec sa používa na vyjadrenie textového obsahu a v Swifte musí byť uzavretý v dvojitých úvodzovkách "".

Napríklad:

```swift id="gm2z2e"
var hello = "Hello, World"
```

Okrem reťazcov existuje v Swifte mnoho ďalších dátových typov.

Na začiatku sú najbežnejšie štyri typy:

* String
* Int
* Double
* Bool

Tieto štyri typy postačujú na väčšinu základného spracovania údajov.

**String**

String predstavuje textový obsah, napríklad:

```swift id="9lqn3n"
var name = "FangJunyu"
var city = "Rizhao"
```

Reťazce sa zvyčajne používajú na vyjadrenie používateľského mena, nadpisu alebo textového obsahu.

**Int**

Int predstavuje celé číslo, teda číslo bez desatinnej časti.

Napríklad:

```swift id="rycu2a"
var age = 26
var count = 100
```

Celé čísla sa zvyčajne používajú na vyjadrenie veku, množstva alebo počítania.

**Double**

Double predstavuje číslo s desatinnou časťou.

Napríklad:

```swift id="a2g2ln"
var weight = 74.5
var height = 185.0
```

V Swifte sa desatinné čísla predvolene často používajú ako typ Double.

Existuje aj podobný typ Float, ale jeho rozsah hodnôt je menší, preto sa v reálnom vývoji častejšie používa Double.

**Bool**

Typ Bool sa používa na vyjadrenie dvoch stavov: true a false.

Napríklad:

```swift id="6c7u3b"
var isShowAlert = true
var isLogin = false
```

Typ Bool sa často používa pri podmienkach. Napríklad či sa má zobraziť upozornenie.

Pre situácie, kde existujú iba dva výsledky, je typ Bool veľmi vhodný.

### Zobrazenie v SwiftUI

Keď zobrazujeme typ String, môžeme ho priamo použiť v Text:

```swift id="6hfy7i"
Text(name)
```

Typy ako Int alebo Double však nie sú reťazce, a preto ich nemožno priamo použiť ako súčasť textového obsahu.

Ak chceme tieto údaje zobraziť v Text, môžeme použiť interpoláciu reťazcov (String Interpolation):

```swift id="q6j6bx"
\()
```

Interpolácia reťazcov sa musí zapisovať vo vnútri reťazca a premenná alebo konštanta sa uzavrie do \().

Napríklad:

```swift id="n20m1c"
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

V uvedenom kóde "" znamená reťazec a \() slúži na vloženie premennej alebo konštanty do reťazca.

Napríklad:

```swift id="ynf1k1"
"DoubleNum: \(num * 2)"
```

Zobrazovaný obsah bude:

```id="r9i74l"
DoubleNum: 2
```

Týmto spôsobom môžeme do reťazca vložiť premenné alebo konštanty a potom ich zobraziť v rozhraní pomocou Text.

Tip: \() možno používať iba vo vnútri reťazca "".

## Operátory

Pri deklarovaní premennej alebo konštanty môžeme vidieť tento zápis:

```swift id="jlwm9m"
var num = 1
```

Tu sa = nazýva priraďovací operátor.

Jeho úloha je priradiť hodnotu na pravej strane premennej na ľavej strane.

V tomto príklade sa hodnota 1 priradí premennej num.

Okrem priraďovacieho operátora existujú aj niektoré bežné numerické operátory:

* `+`
* `-`
* `*`
* `/`

Keď vykonávame výpočty s číslami, napríklad s typmi Int alebo Double, používame práve tieto operátory.

Napríklad:

```swift id="ujgrta"
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Po vykonaní výpočtu sa výsledok uloží do premennej.

## Zhrnutie

Premenné, konštanty a operátory patria medzi najzákladnejšie pojmy v programovaní.

Pomocou premenných a konštánt môžeme v programe ukladať rôzne údaje, pomocou dátových typov môžeme presne určiť, o aký druh údajov ide, a pomocou operátorov môžeme tieto údaje vypočítavať a spracovávať.

Tieto poznatky sú ako základné nástroje vo svete programovania. Keď ich zvládnete, vytvoríte si pevný základ pre ďalšie štúdium Swiftu a SwiftUI.
