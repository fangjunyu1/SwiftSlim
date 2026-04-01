# Uloženie sumy v pokladničke

V predchádzajúcej lekcii sme vytvorili jednoduchú „pokladničku“. V tejto lekcii sa naučíme, ako zabezpečiť trvalé uloženie sumy v „pokladničke“.

V tejto lekcii sa budeme venovať hlavne `UserDefaults` a vlastnostnému wrapperu `@AppStorage`, zároveň si rozšírime vysvetlenie `onAppear` a používania voliteľného typu (`nil`).

Treba si uvedomiť, že v tejto lekcii budeme pokračovať s kódom „pokladničky“ z predchádzajúcej lekcie.

## Problém s trvalým uložením

Teraz je rozhranie „pokladničky“ veľmi jednoduché a používa sa pohodlne.

![Piggy Bank](../../Resource/014_view.png)

Je tu však zjavný problém: pri každom obnovení view alebo zatvorení aplikácie sa celková suma v „pokladničke“ vždy zmení späť na `0` a predchádzajúca celková suma sa úplne stratí.

To znamená, že dáta v skutočnosti nie sú uložené. Inými slovami, súčasná „pokladnička“ vie uchovávať iba dočasné dáta.

### Prečo sa nedá ukladať trvalo?

Je to preto, že používame premennú deklarovanú pomocou `@State`:

```swift id="tyx2u4"
@State private var amount = 0
```

Životný cyklus premennej deklarovanej pomocou `@State` úplne závisí od view.

Keď sa view vytvorí, `amount` sa inicializuje na `0`; keď sa view zničí, `amount` sa tiež zničí.

Dáta uložené v `amount` teda existujú iba v pamäti a neukladajú sa do zariadenia.

Ak nechceme, aby bol `amount` viazaný na životný cyklus view, musíme implementovať trvalé ukladanie dát. Inými slovami, musíme dáta uložiť do zariadenia.

### Čo je „perzistencia dát“

Perzistenciu dát si môžeme jednoducho predstaviť ako presun dát z „dočasnej pamäte“ do „úložiska zariadenia“.

Keď zavrieme view alebo aplikáciu, dáta sa nestratia.

Pri vývoji v Swifte môžeme na jednoduchú „perzistenciu dát“ použiť `UserDefaults`, zatiaľ čo zložitejšie dáta sa zvyčajne ukladajú pomocou `SwiftData` alebo `CoreData`.

V tejto lekcii sa najprv naučíme najjednoduchší spôsob, teda `UserDefaults`.

## UserDefaults

`UserDefaults` sa používa na ukladanie ľahkých dát vo forme kľúč-hodnota a často sa používa na ukladanie základných typov ako `String`, `Int`, `Double`, `Bool` a podobne.

### Ukladanie dát

`UserDefaults` používa na uloženie dát metódu `set`:

```swift id="curilc"
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Prvý parameter `UserDefaults` predstavuje ukladané dáta. Tu odovzdávame hodnoty typu `String`, `Int` a podobne.

Druhý parameter `forKey` funguje podobne ako názov premennej a používa sa na označenie uložených dát v `UserDefaults`.

### Čítanie dát

`UserDefaults` používa na čítanie príslušné metódy:

```swift id="8ecvzy"
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Pri čítaní musíme použiť metódu zodpovedajúcu správnemu typu, inak môže vzniknúť chyba alebo sa načítajú nesprávne dáta.

### Dôležité poznámky k UserDefaults

#### 1. Návrat voliteľného typu

Pri čítaní dát z `UserDefaults` niektoré metódy vracajú voliteľný typ (`Optional`).

Napríklad:

```swift id="x7p55q"
let name = UserDefaults.standard.string(forKey: "name")
```

Typ `name` bude:

```swift id="zzzyq7"
String?
```

To znamená, že hodnota môže existovať, ale nemusí.

**Prečo sa vracia voliteľný typ?**

Pretože k určitému `Key` v `UserDefaults` nemusí byť uložená žiadna hodnota.

Napríklad:

```swift id="jhg1qp"
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Ak sme nikdy predtým neuložili dáta pod kľúčom `"City"`, výsledok čítania bude:

```swift id="2jwrpj"
nil
```

Treba zdôrazniť, že `nil` znamená, že neexistujú žiadne dáta, a nie prázdny reťazec.

V lekcii o „typovom systéme“ sme sa stretli s podobnou situáciou: keď zlyhá konverzia typu, vráti sa voliteľný typ.

Vtedy musíme použiť `??` na poskytnutie predvolenej hodnoty a rozbalenie:

```swift id="x0fpmw"
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Ak `UserDefaults` načíta hodnotu, použije sa táto načítaná hodnota; ak ju nenačíta (`nil`), použije sa predvolená hodnota.

#### 2. Návrat nevoliteľného typu

Pri čítaní typov `Int`, `Double` a `Bool` vracia `UserDefaults` nevoliteľné typy.

Napríklad:

```swift id="i3lfj2"
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Aj keď pod týmito `Key` nikdy nebola uložená žiadna hodnota, výsledok nebude `nil`.

Namiesto toho sa vrátia predvolené hodnoty:

```swift id="af1m9x"
Int → 0
Double → 0.0
Bool → false
```

#### 3. Obmedzenie objemu dát

`UserDefaults` je vhodný iba na ukladanie malého množstva dát, napríklad nastavení aplikácie alebo jednoduchých stavových údajov.

V praxi sa nehodí na ukladanie veľkého množstva dát ani na dáta, ktoré sa veľmi často zapisujú a čítajú.

## Uloženie sumy v „pokladničke“

Teraz môžeme pomocou `UserDefaults` implementovať logiku ukladania celkovej sumy v „pokladničke“.

Keď používateľ klikne na tlačidlo, zadaná suma sa pripočíta k celkovej sume a celková suma sa uloží do `UserDefaults`.

```swift id="uocmax"
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Týmto sme dokončili logiku zápisu dát.

## Vysvetlenie logiky perzistencie dát

Aj keď sme už dokončili logiku zápisu perzistentných dát, pri skutočnom spustení zistíme, že pri každom obnovení view alebo opätovnom otvorení aplikácie je premenná `amount` stále `0`.

Je to preto, že:

```swift id="puqs5j"
@State private var amount = 0
```

V SwiftUI sa premenná `@State` pri vytvorení view znovu inicializuje.

Hoci je hodnota `amount` uložená v `UserDefaults`, pri opätovnom načítaní view sa `amount` stále vráti na `0`.

To ukazuje, že momentálne sme dáta iba zapísali do `UserDefaults`, ale neobnovili sme ich späť do view.

Preto pri načítaní view musíme ešte ručne prečítať dáta z `UserDefaults` a znovu ich priradiť do `amount`. Až potom bude logika perzistencie kompletná.

### Analógia logiky

Tento proces si môžeme predstaviť ako „tabuľu v triede“:

Počas vyučovania učiteľ píše obsah na tabuľu. Tento obsah je podobný aktuálnemu stavu view (`@State`).

Keď hodina skončí, tabuľa sa zotrie, aby bola pripravená na ďalšiu hodinu. To zodpovedá zničeniu view, pri ktorom sa vymažú aj dáta v `@State`.

Aby sa učebný obsah nestratil, učiteľ si ho vopred uloží do prezentácie. Táto prezentácia je podobná dátam uloženým v `UserDefaults`.

Keď začne ďalšia hodina, tabuľa je opäť prázdna (`@State` sa inicializuje), takže učiteľ musí podľa prezentácie znovu prepísať obsah na tabuľu (načítať `UserDefaults`).

Treba pochopiť, že tabuľa si predchádzajúci obsah neobnoví automaticky. Musíme ho znovu zapísať cez „načítanie prezentácie“ (načítanie `UserDefaults`).

## Načítanie dát pomocou onAppear

Keď sa view zobrazí, musíme ručne načítať hodnotu z `UserDefaults` a priradiť ju do premennej `amount` označenej `@State`, aby sme skutočne dosiahli perzistenciu dát.

V SwiftUI môžeme použiť `onAppear` na vykonanie inicializačnej logiky pri zobrazení view:

```swift id="5sqnn4"
.onAppear {}
```

Kód na načítanie z `UserDefaults` vložíme do `onAppear`:

```swift id="yw8h8w"
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Keď sa view vytvorí, `amount` sa inicializuje na `0`; keď sa view zobrazí, spustí sa `onAppear`, načíta hodnotu z `UserDefaults` a priradí ju do `amount`. Takto môže view zobraziť naposledy uloženú celkovú sumu.

Teraz je logika perzistencie dát pre celú „pokladničku“ dokončená.

## Kompletný kód

```swift id="m71vm8"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Vlastnostný wrapper @AppStorage

SwiftUI poskytuje vlastnostný wrapper `@AppStorage`, ktorý dokáže logiku ukladania cez `UserDefaults` zjednodušiť.

```swift id="wpqg7m"
@AppStorage("amount") private var amount = 0
```

`@AppStorage` je obal nad `UserDefaults` a `"amount"` zodpovedá `Key` v `UserDefaults`.

Keď sa view vytvorí, načíta sa hodnota z `UserDefaults`; keď sa premenná zmení, automaticky sa zapíše späť do `UserDefaults`.

Podporuje mechanizmus aktualizácie stavu v SwiftUI a podobne ako `@State` pri zmene automaticky obnovuje SwiftUI view.

Inými slovami, `@AppStorage` dokáže zabezpečiť logiku čítania aj zápisu dát, takže už nemusíme ručne volať `UserDefaults` ani používať `onAppear` na načítanie dát.

Preto môžeme v kóde nahradiť `UserDefaults` pomocou `@AppStorage`:

```swift id="1i0j9g"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Zhrnutie

V tejto lekcii sme sa naučili najmä tieto veci:

Najprv sme si vysvetlili, že `UserDefaults` sa používa na ukladanie ľahkých dát, a použili sme ho na uloženie celkovej sumy do zariadenia. `UserDefaults` poskytuje metódy na čítanie a zapisovanie a zároveň si vyžaduje správne spracovanie voliteľných typov.

Ďalej sme si vysvetlili, že premenná `@State` slúži iba na správu dočasného stavu vo view a jej životný cyklus je rovnaký ako životný cyklus view. Keď sa view znovu vytvorí, `@State` sa znovu inicializuje.

Pri obnovovaní dát z `UserDefaults` sme sa naučili používať `onAppear` na načítanie dát pri zobrazení view a dokončenie obnovy dát.

Nakoniec sme použili `@AppStorage` ako náhradu za `UserDefaults`, aby sa pri načítaní view dáta čítali automaticky a pri zmene sa automaticky zapisovali, čím sa nahradila logika ručného volania `UserDefaults` a `onAppear`.

Pomocou týchto poznatkov už dokážeme vytvoriť základnú funkciu ukladania dát v aplikácii, aby sa dáta uchovávali trvalo.

## Cvičenie po lekcii

Teraz už „pokladnička“ podporuje ukladanie sumy, ale jej funkcie ešte nie sú úplné.

1. Ak chce používateľ vyberať peniaze, treba navrhnúť príslušnú logiku výberu.
2. Ak chce používateľ vymazať celú sumu, treba implementovať aj logiku resetovania.
3. Ak chceme „pokladničke“ pridať názov, musíme zaviesť aj ukladanie dát typu `String`.

Tieto funkcie môžete doplniť na existujúcom základe, aby bola „pokladnička“ kompletniejšia.

## Rozšírené vedomosti - problém s predvolenou hodnotou vstupného poľa

Teraz môžeme ďalej optimalizovať interakciu vstupného poľa, aby bolo zadávanie pohodlnejšie.

![textfield](../../Resource/015_view.png)

V aktuálnej implementácii je predvolená hodnota vstupného poľa `0`. Používateľ musí pri každom zadávaní sumy najprv vymazať `0` a až potom zadať nové číslo, čo nie je veľmi pohodlné.

Vstupné pole by malo byť na začiatku prázdne, nie `0`.

Je to preto, že `TextField` a `number` sú viazané obojsmerne:

```swift id="1ynxpv"
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Keď sa `number` inicializuje na `0`, vstupné pole zobrazuje tiež `0`.

Preto musíme `number` zmeniť na prázdnu hodnotu, teda `nil`.

```swift id="tzsa6g"
@State private var number = nil
```

V tomto momente vznikne chyba:

```id="52p9u6"
Generic parameter 'Value' could not be inferred
```

To je práve situácia, o ktorej sme hovorili v „typovom systéme“: keď kompilátor nedokáže automaticky odhadnúť typ premennej, musíme typ deklarovať explicitne.

Keďže nastavujeme `number` na `nil` a `nil` samo osebe neobsahuje žiadnu informáciu o type, kompilátor nedokáže určiť, či má ísť o `String`, `Int` alebo iný typ, preto vznikne chyba.

Preto musíme pre `number` explicitne deklarovať typ:

```swift id="hholc8"
@State private var number:Int? = nil
```

Tu `Int?` znamená voliteľný typ (`Optional`), teda že hodnota `number` môže byť `Int`, ale aj `nil`.

Takto bude po inicializácii hodnota `nil` a vstupné pole sa zobrazí prázdne namiesto `0`.

### Rozbalenie voliteľného typu

Keď zmeníme `number` na voliteľný typ, pôvodný výpočtový kód začne hlásiť chybu:

```swift id="yaftth"
amount += number
```

Zobrazené upozornenie:

```id="0qfwuj"
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Je to preto, že `number` môže byť teraz `nil`. Ak by sa priamo použilo vo výpočte, situácia by vyzerala takto:

```swift id="ga5igo"
amount += nil
```

Je zrejmé, že `nil` sa nedá sčítať s `amount`, takže ide o neplatnú operáciu.

Preto pri použití voliteľného typu vo výpočtoch musíme najprv vykonať rozbalenie.

Tu môžeme použiť `??` na dodanie predvolenej hodnoty:

```swift id="4hwjxt"
amount += number ?? 0
```

Keď je `number` `nil`, použije sa predvolená hodnota `0`; keď má `number` hodnotu, použijú sa skutočne zadané dáta.

Týmto zabezpečíme správnosť výpočtu a zároveň dosiahneme efekt prázdneho vstupného poľa pri štarte, takže používateľ už nemusí ručne mazať `0`.

## Rozšírený kód

```swift id="0gk6pa"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
