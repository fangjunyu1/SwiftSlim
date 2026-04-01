# Kolotoč citátov

V tejto lekcii vytvoríme funkciu „kolotoča citátov“ a podrobnejšie sa naučíme základy Swiftu, ako sú pole (`Array`) a podmienené príkazy (`if-else`).

Ukážeme si, ako uložiť viacero citátov a pomocou interakcie s tlačidlom dosiahnuť ich cyklické prepínanie.

![alt text](../../RESOURCE/011_word.png)

## Zobrazenie citátu

Najprv potrebujeme v SwiftUI zobraziť jeden citát.

Najjednoduchší spôsob je použiť view `Text`:

```swift id="l4rn0m"
Text("Slow progress is still progress.")
```

Tento kód dokáže zobraziť iba jeden pevne daný citát. Ak chceme zobraziť viacero citátov a umožniť ich prepínanie, musíme si ich najprv uložiť.

Bežná reťazcová premenná však dokáže uložiť iba jeden citát:

```swift id="pzgi1v"
let sayings = "Slow progress is still progress."
```

Ak potrebujeme uložiť viacero citátov, museli by sme pre každý citát deklarovať samostatnú premennú:

```swift id="68xygb"
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

V skutočnom vývoji je však takýto spôsob nielen zdĺhavý, ale keďže každá premenná je nezávislá, nedokážeme takto flexibilne realizovať kolotočové prepínanie.

Aby sme mohli pohodlne spravovať viacero citátov, potrebujeme dátovú štruktúru, ktorá ich uloží spolu. Tou štruktúrou je pole (`Array`).

Po použití poľa môžeme vyššie uvedený kód zapísať takto:

```swift id="vamcv9"
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tip: Podľa programátorských konvencií sa názvy premenných polí, ktoré ukladajú viacero prvkov, zvyčajne píšu v množnom čísle, napríklad `sayings`, aby bolo zrejmé, že ide o kolekciu.**

## Pole

V jazyku Swift je pole usporiadaná kolekcia prvkov a zapisuje sa pomocou hranatých zátvoriek `[]`.

```swift id="2jfq0a"
[]
```

Vo vnútri poľa môže byť viacero prvkov rovnakého typu a jednotlivé prvky sa oddeľujú anglickou čiarkou `,`.

Napríklad:

```swift id="oiip6h"
[101, 102, 103, 104, 105]
```

Pole si môžeme jednoducho predstaviť ako vlak:

![Array](../../RESOURCE/011_array1.png)

Celý vlak predstavuje objekt poľa a každý vagón je usporiadaný podľa poradia.

### Index a prístup k prvkom

Keďže pole je usporiadané, systém dokáže podľa poradia určiť konkrétny prvok v poli. Tento mechanizmus sa nazýva index (`Index`).

V Swifte (a vo väčšine programovacích jazykov) sa index poľa začína od `0`, nie od `1`. To znamená, že prvý prvok poľa má index `0`, druhý prvok index `1` a tak ďalej.

![Array](../../RESOURCE/011_array2.png)

Ak chceme pristúpiť ku konkrétnemu prvku v poli, stačí za názov poľa pridať hranaté zátvorky a do nich zapísať index požadovaného prvku.

Napríklad:

```swift id="re6v7u"
sayings[0]   // 101
sayings[1]   // 102
```

Ak sa pokúsime pristúpiť k indexu, ktorý je mimo platného rozsahu poľa, dôjde k problému „prekročenie rozsahu indexu“ (`Index Out of Range`). Preto si pri práci s poľom treba dávať pozor, aby bol index vždy v platnom rozsahu.

**Prekročenie rozsahu indexu**

Napríklad ak má pole iba 5 prvkov, platný rozsah indexov je od `0` do `4`. Ak sa pokúsime pristúpiť k `sayings[5]`, program nebude vedieť nájsť zodpovedajúci „vagón“, čo spôsobí chybu „prekročenie rozsahu indexu“ a aplikácia spadne.

![Array](../../RESOURCE/011_array3.png)

### Operácie s poľom

Pole nepodporuje iba statickú definíciu, ale aj pridávanie, odstraňovanie, úpravu prvkov a získanie jeho dĺžky.

Tip: Ak potrebujeme pole upravovať, musíme ho deklarovať pomocou `var`, nie `let`.

**1. Pridanie prvku**

Na pridanie prvku na koniec poľa môžeme použiť metódu `append`:

```swift id="8vgg14"
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Odstránenie prvku**

Pomocou metódy `remove(at:)` môžeme odstrániť konkrétny prvok poľa:

```swift id="ua5y9g"
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Úprava prvku**

Prvok poľa môžeme priamo upraviť pomocou indexu:

```swift id="8dc7fw"
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Zistenie dĺžky poľa**

Pomocou vlastnosti `count` získame počet prvkov v poli:

```swift id="x3anzz"
var num = [0, 1, 2]
num.count   // 3
```

### Zobrazenie citátov pomocou poľa

Aby sme mohli zobraziť viacero citátov, môžeme ich uložiť do poľa a potom ich pomocou indexu čítať a zobrazovať.

Najprv v `ContentView` vytvoríme pole `sayings` na uloženie citátov a potom v `Text` view cez index načítame a zobrazíme zodpovedajúci citát:

```swift id="lf1tqy"
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Tu `sayings[0]` znamená prvý citát v poli.

Ak chceme zobraziť iný citát, stačí zmeniť hodnotu indexu v hranatých zátvorkách:

```swift id="4h2sg4"
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definovanie indexu citátu

Aby sme dosiahli dynamické prepínanie citátov, nemôžeme mať index „natvrdo“ zapísaný priamo v `Text` view.

Potrebujeme vytvoriť premennú, ktorá bude samostatne uchovávať index aktuálne zobrazeného citátu.

V SwiftUI na to môžeme použiť `@State` a deklarovať meniteľný index:

```swift id="6u69yn"
@State private var index = 0
```

SwiftUI bude sledovať premennú zabalenú v `@State`. Keď sa hodnota `index` zmení, SwiftUI znovu vykreslí view a zobrazí príslušný citát.

Potom použijeme `sayings[index]` na dynamické získanie citátu z poľa:

```swift id="po2o4j"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Keď sa hodnota `index` zmení, `Text` zobrazí iný citát.

### Použitie tlačidla na ovládanie indexu

Na prepínanie citátov môžeme použiť `Button`, ktorý bude meniť hodnotu `index`. Pri každom kliknutí sa `index` automaticky zvýši o `1`:

```swift id="yuoh2i"
Button("Next") {
    index += 1
}
```

Keď klikneme na tlačidlo, hodnota `index` sa zmení z `0` na `1`, čo spustí obnovenie view, a `Text(sayings[index])` načíta ďalší citát.

Tu však vzniká potenciálny problém: ak budeme na tlačidlo klikať opakovane, `index` sa môže zvýšiť na hodnotu mimo rozsahu poľa, čo spôsobí chybu prekročenia rozsahu indexu. Napríklad keď `index` dosiahne `5` (pričom platný rozsah indexov poľa je `0` až `4`), program spadne.

Aby sme zabránili prekročeniu rozsahu indexu, musíme zaviesť podmienku, ktorá zabezpečí, že `index` neprekročí hranice poľa. Môžeme to spraviť pomocou príkazu `if-else`, ktorý skontroluje, či je `index` menší než dĺžka poľa.

## Podmienky: príkaz if-else

Príkaz `if-else` je v jazyku Swift jedným z najbežnejších vetviacich príkazov. Používa sa na overenie, či je podmienka splnená, a podľa výsledku vykoná iný blok kódu.

Základná štruktúra:

```swift id="3xc9q6"
if condition {
    // kód, ktorý sa vykoná, keď je condition true
} else {
    // kód, ktorý sa vykoná, keď je condition false
}
```

V príkaze `if` je podmienka `condition` booleovská hodnota (`Bool`) a môže byť `true` alebo `false`. Ak je podmienka `true`, vykoná sa kód v časti `if`, inak sa vykoná kód v časti `else`.

Napríklad:

```swift id="t7snof"
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

V tomto príklade má `age` hodnotu `25` a príkaz `if` overuje, či `age > 18` platí. Keďže podmienka platí, vypíše sa `"Big Boy"`.

Ak časť `else` nepotrebujeme, môžeme ju vynechať:

```swift id="f4nkmu"
if condition {
    // kód, ktorý sa vykoná, keď je condition true
}
```

### Použitie podmienky na kontrolu rozsahu indexu

Aby sme zabránili prekročeniu rozsahu indexu poľa, môžeme použiť `if`, ktorý zabezpečí, že `index` neprekročí hranice poľa:

```swift id="5bn03m"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analýza logiky: hodnota `sayings.count` je `5` (spolu je 5 citátov), takže `sayings.count - 1` je `4`, čo je zároveň posledný platný index poľa.

Keď je `index` menší než `4`, kliknutie na tlačidlo a vykonanie `+1` je bezpečné. Keď `index` dosiahne `4`, podmienka už neplatí a kliknutie na tlačidlo neurobí nič.

Teraz už kód dokáže prepínať citáty:

```swift id="xh94go"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Cyklické citáty

Ak chceme, aby sa po zobrazení posledného citátu po ďalšom kliknutí opäť zobrazil prvý citát, a tým vzniklo cyklické prehrávanie, môžeme to spraviť cez časť `else`:

```swift id="4m6eb0"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Keď pri kliknutí tlačidla `index` dosiahne posledný prvok poľa, nastaví sa späť na `0` a citáty sa začnú zobrazovať od začiatku.

## Vylepšenie view s citátmi

Teraz už logika kolotoča citátov funguje, ale rozhranie môžeme ešte ďalej vylepšiť, aby vyzeralo krajšie.

Kompletný kód:

```swift id="w15nbx"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

V tomto príklade má `Text` view biele polopriehľadné pozadie a zaoblené rohy, tlačidlo `Button` používa štýl `.borderedProminent` a `VStack` má nastavený obrázok na pozadí.

Doplnenie vedomostí: pri použití modifikátora `background()` na spracovanie obrázkového pozadia sa jeho predvolené správanie snaží čo najviac vyplniť layout oblasť aktuálneho view. V mnohých situáciách sa preto prirodzene rozšíri až do bezpečnej oblasti (`Safe Area`).

Teraz sme teda úspešne vytvorili view s kolotočom citátov.

![SwiftUI View](../../RESOURCE/011_word.png)

## Zhrnutie

V tejto lekcii sme sa naučili, ako použiť pole na uloženie viacerých citátov a ako pomocou príkazov `if` a `if-else` vytvoriť kolotoč citátov.

Zároveň sme spoznali základné operácie s poľom, ako je pridávanie, odstraňovanie, úprava prvkov a tiež spôsob, ako zabrániť prekročeniu rozsahu indexu poľa.

Táto lekcia nevysvetľovala iba samotnú implementáciu kolotoča citátov, ale zároveň spojila praktické použitie poľa a podmienok, čím nám pomohla osvojiť si schopnosť pracovať s dátami a riadiť tok programu.

## Rozšírené vedomosti – viacnásobné podmienky: príkaz if-else if-else

V reálnom vývoji často potrebujeme spracovať viacero podmienok. Napríklad v nejakej hre sa pri skóre `1` spustí udalosť A, pri skóre `2` udalosť B, pri skóre `3` udalosť C a tak ďalej.

V situáciách, kde máme viac než dve vetvy podmienok, potrebujeme použiť príkaz `if-else if-else` na viacnásobné rozhodovanie.

Základná syntax:

```swift id="y5gf9j"
if conditionA {
    // kód, ktorý sa vykoná, keď je conditionA true
} else if conditionB {
    // kód, ktorý sa vykoná, keď je conditionB true
} else if conditionC {
    // kód, ktorý sa vykoná, keď je conditionC true
} else {
    // kód, ktorý sa vykoná, keď nie je splnená žiadna podmienka
}
```

V takomto prípade program postupne kontroluje jednotlivé podmienky a vykoná prvú, ktorá je splnená. Ak nie je splnená žiadna podmienka, vykoná sa kód za `else`.

Aj v kolotoči citátov môžeme použiť `if-else if-else` na viacnásobné rozhodovanie:

```swift id="h68icu"
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Keď je `index` rovný `0`, `1`, `2` alebo `3`, každé kliknutie na tlačidlo vykoná `index += 1`. Keď je `index` rovný `4` (posledný prvok), nastaví sa `index` späť na `0`, čím sa vytvorí cyklus.

Vetva `else` slúži ako poistka pre prípad neplatnej hodnoty (napríklad ak by bol `index` omylom zmenený na nesprávnu hodnotu).

Treba si všimnúť, že použitý operátor `==` znamená kontrolu „či sa rovná“. Ak teda príkaz `if` porovnáva `index` s nejakým číslom a výsledok je rovnosť, vráti `true` a vykoná príslušný blok kódu. Ak sa hodnoty nerovnajú, pokračuje sa na ďalšiu podmienku `if`.

Takéto viacnásobné rozhodovanie je užitočné v rôznych situáciách, keď potrebujeme pri rôznych podmienkach vykonávať odlišný kód.
