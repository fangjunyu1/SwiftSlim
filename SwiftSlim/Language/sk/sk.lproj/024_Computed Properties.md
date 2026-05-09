# Vypočítaná vlastnosť

V tejto lekcii sa budeme učiť hlavne o vypočítaných vlastnostiach.

Vypočítaná vlastnosť sa používa na výpočet nového výsledku na základe už existujúcich údajov. Môže počítať číselné hodnoty, ale aj obsah, ktorý sa má zobraziť vo view SwiftUI.

Napríklad:

```swift
let a = 10
let b = 20
let c = a + b
```

Tu `c` predstavuje výsledok po sčítaní `a` a `b`.

V bežnom kóde je takýto spôsob zápisu veľmi častý.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tip: V udalosti kliknutia `Button` môžeme spúšťať bežný Swift kód.

Ak však podobný kód napíšeme priamo do vlastností SwiftUI view, narazíme na problém.

Napríklad:

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

Tento kód spôsobí chybu.

Na prvý pohľad sa zdá, že `a` a `b` sú už napísané pred `c`, takže by sa hodnota `c` mala dať vypočítať.

Pri deklarovaní vlastností v štruktúre však tento spôsob zápisu nemožno použiť priamo.

## Prečo nemožno c priamo vypočítať ako a + b?

Pretože `a`, `b` a `c` nie sú dočasné konštanty v udalosti kliknutia tlačidla. Sú to vlastnosti view `ContentView`.

V udalosti kliknutia tlačidla môže tento kód fungovať normálne:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Je to preto, že po kliknutí na tlačidlo sa kód vykonáva postupne. Najprv sa vytvorí `a`, potom sa vytvorí `b` a nakoniec sa pomocou `a + b` vypočíta `c`.

Pri deklarovaní vlastností vo vnútri view je však situácia iná:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Tu sú `a`, `b` a `c` všetky vlastnosti view `ContentView`.

Keď sa vytvára view `ContentView`, Swift musí najprv pripraviť tieto vlastnosti. Aby bol proces vytvorenia bezpečný, Swift neumožňuje, aby predvolená hodnota jednej uloženej inštančnej vlastnosti priamo čítala iné inštančné vlastnosti tej istej inštancie.

Preto tento riadok spôsobí chybu:

```swift
let c = a + b
```

Jednoducho to môžeme chápať takto: **pri deklarovaní vlastností vo vnútri view nemožno priamo použiť jednu bežnú vlastnosť na výpočet inej bežnej vlastnosti.**

Takáto vlastnosť, ktorá priamo ukladá hodnotu, sa nazýva „uložená vlastnosť“. Pre jednoduchšie pochopenie ju môžeme dočasne chápať ako bežnú vlastnosť.

Napríklad:

```swift
let a = 10
```

`a` ukladá `10`.

```swift
let b = 20
```

`b` ukladá `20`.

Ale:

```swift
let c = a + b
```

Tu `c` nie je priamo zapísaná pevná hodnota. Očakáva sa, že bude vypočítaná pomocou `a + b`.

V takejto situácii, keď „získavame výsledok na základe existujúcich údajov“, je vhodnejšie použiť vypočítanú vlastnosť.

Môžeme to upraviť takto:

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

Tu je `c` vypočítaná vlastnosť.

```swift
var c: Int {
    return a + b
}
```

Jej význam je: **keď je potrebné použiť `c`, vtedy sa prečítajú `a` a `b` a výsledok `a + b` sa vráti.**

Napríklad:

```swift
Text("c: \(c)")
```

Keď `Text` zobrazuje `c`, až vtedy sa spustí výpočet `c`.

## Čo je vypočítaná vlastnosť?

Vypočítaná vlastnosť vyzerá ako premenná, ale sama neukladá údaje.

Napríklad:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Tu je `c` vypočítaná vlastnosť.

Neukladá pevnú hodnotu ako bežná vlastnosť. Vždy, keď sa `c` prečíta, znova sa vykoná kód v `{}` a vráti sa vypočítaný výsledok.

Môžeme to chápať takto:

```swift
var c: Int {
    return a + b
}
```

Keď je potrebné `c`, vypočíta sa `a + b`.

Preto je vypočítaná vlastnosť vhodná pre túto situáciu: **výsledok netreba ukladať samostatne, pretože sa dá vypočítať z už existujúcich údajov.**

## Základný zápis

Vypočítaná vlastnosť zvyčajne obsahuje tri časti:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklarácia pomocou `var`

```swift
var c
```

Vypočítaná vlastnosť musí byť deklarovaná pomocou `var`; `let` nemožno použiť.

Je to preto, že vypočítaná vlastnosť nie je pevne uložená hodnota, ale výsledok, ktorý sa dynamicky počíta pri každom prečítaní.

### 2. Uvedenie návratového typu

```swift
var c: Int
```

Vypočítaná vlastnosť musí uvádzať návratový typ.

Tu `c` nakoniec vráti celé číslo, preto je typ `Int`.

### 3. Zápis výpočtovej logiky do {}

```swift
{
    return a + b
}
```

Do `{}` sa píše výpočtová logika. Tu sa vracia `a + b`.

## Kľúčové slovo return

Vypočítaná vlastnosť musí vrátiť výsledok.

Napríklad:

```swift
var c: Int {
    return a + b
}
```

Tu `return` znamená: vrátiť výsledok výpočtu `a + b`.

Ak je vo vypočítanej vlastnosti iba jeden výraz, ktorý priamo vytvára výsledok, `return` možno vynechať:

```swift
var c: Int {
    a + b
}
```

Ak však vypočítaná vlastnosť obsahuje viac riadkov kódu, treba použiť `return`, aby bol návratový výsledok jasne určený.

Napríklad:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Tu je proces výpočtu rozdelený na dva kroky.

Prvý krok: vypočítať celkovú cenu:

```swift
let total = count * price
```

Druhý krok: spojiť celkovú cenu do textu a vrátiť ju:

```swift
return "Total：\(total) $"
```

Ak odstránime `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Tento kód spôsobí chybu.

Dôvod je: **táto vypočítaná vlastnosť už obsahuje viac riadkov kódu, takže Swift nedokáže automaticky určiť, ktorý riadok je konečný výsledok, ktorý sa má vrátiť.**

Preto ak je vo vypočítanej vlastnosti iba jeden výraz, ktorý vytvára výsledok, `return` možno vynechať.

```swift
var c: Int {
    a + b
}
```

Ak vypočítaná vlastnosť obsahuje viac riadkov kódu, odporúča sa jasne napísať `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Rozdiel medzi vypočítanou vlastnosťou a bežnou vlastnosťou

Bežná vlastnosť ukladá údaje.

```swift
var c = 30
```

Tu `c` ukladá konkrétnu hodnotu: `30`.

Vypočítaná vlastnosť údaje neukladá.

```swift
var c: Int {
    a + b
}
```

Tu `c` neukladá `30`. Iba poskytuje spôsob výpočtu.

Keď sa `c` prečíta, Swift vykoná:

```swift
a + b
```

Potom vráti vypočítaný výsledok.

Preto je vypočítaná vlastnosť vhodná pre situácie, keď treba výsledok vypočítať na základe iných údajov.

## body je tiež vypočítaná vlastnosť

Po naučení vypočítaných vlastností môžeme znova pochopiť najčastejší kód v SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Tu je `body` tiež vypočítaná vlastnosť.

Je deklarovaná pomocou `var`:

```swift
var body
```

Má návratový typ:

```swift
some View
```

V jej `{}` sa vracia obsah SwiftUI view:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Preto môžeme `body` chápať takto: keď SwiftUI potrebuje zobraziť toto view, prečíta `body` a na základe obsahu vráteného z `body` vytvorí rozhranie.

Ak by sme napísali `return`, môžeme to chápať takto:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

V SwiftUI však zvyčajne `return` vynechávame a píšeme priamo:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Keď sa zmenia údaje `@State`, SwiftUI znova prečíta `body` a aktualizuje rozhranie podľa nových údajov.

Napríklad:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Po kliknutí na tlačidlo sa `count` zmení.

```swift
count += 1
```

Keď sa `count` zmení, SwiftUI znova vypočíta `body`, takže sa aktualizuje aj text v rozhraní.

```swift
Text("count: \(count)")
```

To je aj dôvod, prečo sa v SwiftUI môže rozhranie po zmene údajov automaticky obnoviť.

### Neodporúča sa písať zložité výpočty do body

Keďže `body` je vypočítaná vlastnosť, môže sa čítať a prepočítavať mnohokrát.

Napríklad:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Keď sa `name` zmení, SwiftUI znova vypočíta `body`.

Vtedy sa znova vykoná aj kód vo vnútri `body` a `num` sa tiež znova vytvorí.

```swift
let num = 10
```

V tomto príklade je `num` veľmi jednoduché, takže vplyv nie je veľký.

Ak sa však v `body` vykonávajú zložité výpočty, napríklad filtrovanie veľkého množstva údajov, triedenie, spracovanie obrázkov a podobne, môže to ovplyvniť plynulosť rozhrania.

Preto by v SwiftUI malo `body` hlavne opisovať štruktúru rozhrania.

Jednoduché dočasné údaje možno písať do `body`.

Zložité výpočty je lepšie presunúť mimo `body`, napríklad do vypočítanej vlastnosti, metódy alebo samostatnej časti na spracovanie údajov.

## Príklad: množstvo a celková cena

Teraz si vypočítanú vlastnosť vysvetlíme na jednoduchom príklade.

Predpokladajme, že jedna mrkva stojí 2 $. Používateľ môže kliknutím na tlačidlá meniť kupované množstvo a rozhranie musí zobrazovať celkovú cenu.

Spôsob výpočtu celkovej ceny:

```text
Množstvo * Jednotková cena
```

Ak by sme celkovú cenu ukladali do bežnej premennej, bolo by to trochu nepraktické.

Pretože pri každej zmene množstva by sme museli ručne aktualizovať celkovú cenu.

Lepší spôsob je použiť vypočítanú vlastnosť:

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
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Výsledok zobrazenia:

![view](../../Resource/024_view.png)

V tomto príklade:

```swift
@State private var count = 1
```

`count` predstavuje množstvo mrkiev. Keď klikneme na tlačidlo, `count` sa zmení.

```swift
private let price = 2
```

`price` predstavuje jednotkovú cenu mrkvy. Tu ide o pevnú hodnotu, preto používame `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` predstavuje celkovú cenu.

Netreba ju ukladať samostatne, pretože celkovú cenu možno vždy vypočítať pomocou `count * price`.

Keď je `count` `1`:

```swift
totalPrice = 1 * 2
```

Zobrazený výsledok je:

```swift
totalPrice: 2 $
```

Po kliknutí na tlačidlo `+` sa `count` zmení na `2`.

Keď sa vtedy znova prečíta `totalPrice`, znova sa vypočíta:

```swift
totalPrice = 2 * 2
```

Zobrazený výsledok je:

```swift
totalPrice: 4 $
```

Toto je úloha vypočítanej vlastnosti: dynamicky vypočítať nový výsledok na základe už existujúcich údajov.

## Vypočítanú vlastnosť možno použiť aj na kontrolu podmienok

Vypočítaná vlastnosť nemusí počítať iba čísla, môže vracať aj výsledok kontroly.

Napríklad, keď chceme, aby minimálne množstvo bolo 1.

Keď je množstvo už 1, tlačidlo `-` by ho nemalo ďalej znižovať.

Môžeme pridať vypočítanú vlastnosť:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Úplný kód:

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
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Výsledok zobrazenia:

![view](../../Resource/024_view1.png)

Tu:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Tento kód vyjadruje, či je aktuálne ešte možné znižovať množstvo.

Keď je `count` väčšie ako `1`:

```swift
canDecrease == true
```

znamená to, že znižovať možno.

Keď je `count` rovné `1`:

```swift
canDecrease == false
```

znamená to, že ďalej znižovať nemožno.

### Kontrola podmienky v tlačidle

V tlačidle sa používa:

```swift
if canDecrease {
    count -= 1
}
```

Iba keď je `canDecrease` `true`, môže sa `count` znížiť.

### Ovládanie farby popredia view

Pomocou `canDecrease` môžeme ovládať aj farbu popredia tlačidla:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Tu sa používa ternárny operátor:

```swift
canDecrease ? Color.primary : Color.gray
```

Význam tohto kódu je: ak je `canDecrease` `true`, farba popredia bude `Color.primary`; ak je `canDecrease` `false`, farba popredia bude `Color.gray`.

`Color.primary` je systémová sémantická farba poskytovaná SwiftUI. Predstavuje hlavnú farbu textu v aktuálnom rozhraní.

V svetlom režime je `Color.primary` zvyčajne blízka čiernej; v tmavom režime je zvyčajne blízka bielej.

Výhodou používania `Color.primary` je teda to, že sa automaticky prispôsobuje svetlému aj tmavému režimu.

### Ovládanie deaktivovaného stavu view

`disabled` sa používa na ovládanie toho, či je view v deaktivovanom stave:

```swift
.disabled(!canDecrease)
```

Keď je `disabled` `false`, na view možno kliknúť.

Keď je `disabled` `true`, view je deaktivované a nemožno naň kliknúť.

Tu je `canDecrease` použité ako podmienka, takže kód je ľahšie pochopiteľný.

Keď vidíme `canDecrease`, môžeme hneď pochopiť, že znamená „či možno aktuálne ešte znižovať“.

### Doplňujúce vysvetlenie: prečo sa kontroluje dvakrát?

V tlačidle `-`:

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

Tu sa používa `.disabled(!canDecrease)` aj `if canDecrease` vo vnútri tlačidla.

`.disabled(!canDecrease)` deaktivuje tlačidlo na úrovni rozhrania, aby naň používateľ nemohol kliknúť.

`if canDecrease` pred vykonaním kódu ešte raz skontroluje podmienku. Iba keď možno znižovať, vykoná sa `count -= 1`.

Ide o dvojitú ochranu. V reálnom vývoji možno vnútornú kontrolu vynechať, ak je tlačidlo už deaktivované. V učebnom príklade ju však môžeme ponechať, aby bola úloha `canDecrease` jasnejšia.

## Zhrnutie

V tejto lekcii sme sa učili hlavne o vypočítaných vlastnostiach.

Vypočítaná vlastnosť neukladá hodnotu priamo. Keď sa prečíta, vypočíta výsledok na základe už existujúcich údajov.

Napríklad:

```swift
var c: Int {
    a + b
}
```

Tu `c` netreba ukladať samostatne, pretože sa dá vypočítať pomocou `a + b`.

Vypočítaná vlastnosť musí byť deklarovaná pomocou `var` a musí mať uvedený návratový typ.

```swift
var canDecrease: Bool {
    count > 1
}
```

Vypočítaná vlastnosť môže vracať nielen číselné hodnoty, ale aj výsledky podmienok, textový obsah a dokonca aj obsah SwiftUI view.

V tejto lekcii sme sa naučili aj `return`.

`return` znamená vrátiť výsledok:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Ak je vo vypočítanej vlastnosti iba jeden výraz, ktorý priamo vytvára výsledok, `return` možno vynechať.

```swift
var totalPrice: Int {
    count * price
}
```

Okrem toho sme sa zoznámili aj s `Color.primary` a `disabled`.

`Color.primary` je systémová sémantická farba SwiftUI. Automaticky prispôsobuje zobrazenie podľa svetlého a tmavého režimu.

```swift
.foregroundStyle(Color.primary)
```

`disabled` sa používa na ovládanie toho, či je view deaktivované.

```swift
.disabled(true)
```

Znamená to deaktivované, nemožno kliknúť.

```swift
.disabled(false)
```

Znamená to dostupné, možno kliknúť.

Preto sú vypočítané vlastnosti v SwiftUI veľmi bežné. Pomáhajú nám jasnejšie usporiadať výsledky výpočtov, podmienky a zobrazovaný obsah.
