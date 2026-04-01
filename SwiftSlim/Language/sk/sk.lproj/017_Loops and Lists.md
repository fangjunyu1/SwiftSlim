# Cykly a zoznamy

V tejto lekcii sa budeme učiť cyklus `for` v jazyku Swift a `ForEach` v SwiftUI.

Oba nám pomáhajú čítať prvky poľa v správnom poradí. Pri skutočnom vývoji často potrebujeme vyberať údaje zo skupiny jeden po druhom a potom ich spracovať alebo zobraziť. Práve cyklus je dôležitý nástroj, ktorý nám túto prácu uľahčuje.

Keď prehliadame web alebo používame App, často vidíme veľa zoznamov alebo položiek. Takýto obsah sa zvyčajne najprv uloží do `poľa`, potom sa cez `cyklus` postupne načíta a nakoniec sa zobrazí na obrazovke.

Napríklad zoznam výsledkov vyhľadávania v Google:

![Google](../../Resource/017_google.png)

Každá položka v zozname výsledkov vyhľadávania zvyčajne zodpovedá jednej dátovej položke a cez cyklus sa zobrazuje postupne.

Preto sa `pole` a `cyklus` veľmi často objavujú spolu. `Pole` slúži na uloženie skupiny údajov a `cyklus` ich postupne vyberá a vykonáva nad nimi rovnakú operáciu.

Nižšie začneme od najzákladnejšieho cyklu `for`.

## Odpočítavanie

Predstavme si, že chceme nasimulovať funkciu odpočítavania a postupne vypísať `„5, 4, 3, 2, 1“`.

Najpriamejší zápis je:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Takýto spôsob síce funguje, ale ak je obsahu veľa, kód bude veľmi opakujúci sa a neskôr sa bude aj nepohodlne upravovať.

V tejto chvíli môžeme údaje najprv vložiť do poľa a potom ich postupne vypísať pomocou cyklu `for`:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Takýto zápis je stručnejší a ľahšie sa rozširuje. Aj keby bolo v odpočítavaní veľa čísel, nemusíme písať `print` opakovane na každý riadok. Stačí nechať cyklus, aby automaticky spracoval každý prvok poľa.

Tento kód môžeme vložiť do tlačidla a vyskúšať:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Po kliknutí na tlačidlo bude cyklus `for` podľa poradia v poli postupne vyberať každé celé číslo z `countDown` a vypisovať ho do konzoly.

Teraz sa pozrime, ako cyklus `for` vlastne funguje.

## Cyklus for

Cyklus `for` sa používa na spracovanie skupiny údajov v poradí. Najčastejšie sa používa s poľami a rozsahmi.

Základný zápis:

```swift
for prvok in poleAleboRozsah {
    kodKtorySaMaVykonat
}
```

Napríklad kód odpočítavania z predchádzajúcej časti:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Tu `i` predstavuje aktuálne vybraný prvok a za `in` nasledujú údaje, cez ktoré sa má iterovať, teda pole `countDown`.

Význam tohto kódu je takýto: program bude z poľa `countDown` postupne vyberať každý prvok. Keď vyberie jeden prvok, dočasne ho označí ako `i` a potom vykoná kód v zložených zátvorkách.

Priebeh vykonávania si môžeme predstaviť takto:

- Najprv sa vyberie `5`, takže v tom momente má `i` hodnotu `5`
- Vykoná sa `print(i)` a vypíše sa `5`
- Potom sa vyberie ďalší prvok `4`
- Znovu sa vykoná `print(i)` a vypíše sa `4`

Rovnakým spôsobom sa potom postupne spracujú aj `3`, `2` a `1`.

![for](../../Resource/017_for.png)

Keď sa spracujú všetky prvky v poli, cyklus `for` sa automaticky ukončí.

Pomocou cyklu `for` môžeme získať každý prvok poľa a vytvoriť funkcie, ako je napríklad odpočítavanie.

**Tip**: `i` je veľmi bežný názov používaný vo for cykloch na označenie aktuálneho prvku, ale nie je to pevne dané pravidlo. Môžete použiť aj iné anglické názvy.

Napríklad môžeme použiť `num` na označenie každého vybraného prvku:

```swift
for num in countDown {
    print(num)
}
```

Aj v zložených zátvorkách potom treba používať `num` na označenie aktuálneho prvku.

### Iterovanie cez rozsah

Cyklus `for` sa nedá použiť len na pole, ale aj na rozsah.

Napríklad keď chceme vypočítať súčet kladných celých čísel do `50`, musíme postupne sčítať všetky celé čísla od `1` do `50`.

Najpriamejší zápis by mohol vyzerať takto:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problém tohto zápisu je v tom, že každé číslo musíme vypísať ručne. Je to nepraktické a nehodí sa to do skutočného vývoja.

V tejto chvíli môžeme použiť operátor rozsahu spolu s cyklom `for`.

V predchádzajúcej kapitole o „operátoroch“ sme sa už s operátorom rozsahu stretli:

```swift
1...3   // 1, 2, 3
```

Tu `...` označuje uzavretý rozsah, teda zahŕňa začiatočný aj koncový bod.

Preto tu môžeme použiť cyklus `for` pre rozsah celých čísel od `1` do `50`:

```swift
for i in 1...50 {
    
}
```

Keďže chceme tieto čísla sčítať, potrebujeme ešte premennú na uloženie výsledného súčtu:

```swift
var count = 0
```

Potom pri každom priechode cyklu pripočítame aktuálne číslo k `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Tento kód znamená:

- `count` ukladá aktuálny súčet
- Cyklus `for` bude postupne vyberať celé čísla od `1` do `50`
- Pri každom vybraní jedného čísla sa vykoná `count += i`
- Po skončení cyklu bude v `count` uložený konečný súčet.

Takto získame súčet všetkých kladných celých čísel do `50`.

Rovnako, ak chceme vypočítať súčet celých čísel od `1` do `100`, stačí upraviť rozsah:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Cyklus `for` môže iterovať nielen cez pole, ale aj cez rozsah. Táto schopnosť opakovane spracúvať údaje v správnom poradí je vo vývoji veľmi bežná.

Pomáha nám automaticky spracovať veľa opakujúcich sa úloh bez toho, aby sme museli ručne písať sčítanie každého čísla alebo iné podobné opakované operácie.

## Cykly v SwiftUI

Predchádzajúci cyklus `for` patrí do jazyka Swift.

V SwiftUI však nemôžeme priamo použiť `for` vo vnútri štruktúry view na vytváranie view:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Je to preto, že vo vnútri `VStack` musia byť SwiftUI view, zatiaľ čo obyčajný cyklus `for` sám o sebe view nie je.

Ak chceme v SwiftUI opakovane vytvárať rozhranie podľa obsahu poľa, musíme použiť `ForEach`.

Napríklad ak chceme zobraziť mená všetkých členov skupiny, môžeme napísať:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Výsledok zobrazenia:

![for1](../../Resource/017_for1.png)

Potom pridáme ku každému `Text` rovnaké modifikátory:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Teraz sa každý `Text` zobrazuje menším a hrubším písmom.

Výsledok zobrazenia:

![](../../Resource/017_for2.png)

Hoci modifikátory robia rozhranie krajším, zároveň robia kód dlhším a viac opakujúcim sa.

Ak bude mien viac alebo budeme neskôr chcieť jednotne upraviť písmo, farbu a ďalšie štýly, budeme musieť opakovane písať a meniť veľa rovnakého kódu. To je nepraktické a zle sa to udržiava.

Vtedy môžeme tieto mená najprv vložiť do poľa a potom pomocou `ForEach` v SwiftUI opakovane vytvárať view podľa údajov v poli:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Táto skupina kódu je stručnejšia. `ForEach` bude postupne čítať každý prvok v poli a zobrazí zodpovedajúci obsah na obrazovke.

Keď budeme neskôr pridávať nové mená, stačí upraviť obsah poľa `names`. Nebude potrebné zakaždým opakovane pridávať `Text` a zložité modifikátory.

## ForEach

`ForEach` je štruktúra v SwiftUI, ktorá sa používa na opakované vytváranie view. Môžeme ju chápať ako niečo podobné cyklu `for`, ale v prostredí SwiftUI.

Základné použitie:

```swift
ForEach(pole, id: \.self) { prvok in
    SwiftUI kod
}
```

Napríklad mená skupiny z predchádzajúcej ukážky:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Tento kód znamená:

`names` je pole, cez ktoré iterujeme, teda údaje, ktoré chceme zobraziť.

`id:\.self` znamená, že na rozlíšenie každého prvku sa používa samotný prvok poľa.

V tomto príklade sú v poli uložené reťazce:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Preto SwiftUI priamo použije samotné reťazce "Sam", "John", "Wathon", "Bob" na rozlíšenie jednotlivých položiek.

Pri jednoduchých poliach typu String alebo Int, s ktorými sa na začiatku učíme najčastejšie, môžeme zvyčajne najprv písať:

```swift
id: \.self
```

Zatiaľ si stačí zapamätať práve tento zápis. Nie je potrebné hneď do hĺbky rozumieť ďalším pravidlám pre id.

`item in` znamená, že `item` predstavuje práve vybraný prvok.

Napríklad pri prvom priechode má `item` hodnotu `"Sam"` a pri druhom priechode `"John"`.

Preto:

```swift
Text(item)
```

Sa bude postupne meniť na:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Úlohou tohto kódu teda je: postupne vybrať každé meno z poľa `names` a pre každé meno vytvoriť jedno view `Text`.

### Priebeh vykonávania

Priebeh vykonávania si môžeme predstaviť takto:

- `ForEach` najprv prečíta prvý prvok `"Sam"` z poľa `names`
- `item` dočasne predstavuje `"Sam"`
- `Text(item)` zobrazí `"Sam"`
- Potom pokračuje čítaním ďalšieho prvku `"John"`
- A znovu vykoná rovnaký kód view

Nakoniec sa zobrazia všetky mená v poli.

Výhodou takéhoto zápisu je, že keď mien pribúda, nemusíme opakovane písať veľa `Text`. Stačí upraviť obsah poľa.

### Iterovanie cez fotografie

`ForEach` nemusí zobrazovať len text. Môže zobrazovať aj obrázky, farby alebo iné SwiftUI view.

Napríklad si pripravme 4 obrázky:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Pretiahnite tieto štyri obrázky do priečinka Assets v Xcode.

![image](../../Resource/017_for3.png)

Ak nepoužijeme `ForEach`, musíme každý obrázok vypísať ručne:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Výsledok zobrazenia:

![image](../../Resource/017_for4.png)

Takýto zápis síce funguje, ale kód bude pomerne dlhý.

Ak bude obrázkov viac a viac, budeme musieť opakovane písať čoraz viac kódu `Image`.

Ak budeme neskôr chcieť jednotne zmeniť veľkosť obrázkov, budeme ich musieť meniť jeden po druhom.

Vtedy môžeme názvy obrázkov uložiť do poľa a potom použiť `ForEach` na opakované vytváranie view obrázkov:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

`images` je tu pole reťazcov a každý prvok poľa je názov obrázka.

`ForEach(images, id: \.self)` znamená, že sa postupne číta každý prvok poľa `images`, samotný prvok sa používa na odlíšenie každej položky a podľa aktuálneho prvku sa vytvára zodpovedajúce view.

Napríklad ak sa ako prvé načíta `"430F9BEF"`, potom:

```swift
Image(item)
```

Je to to isté ako:

```swift
Image("430F9BEF")
```

Aj ďalšie obrázky sa budú rovnakým spôsobom postupne zobrazovať.

![image](../../Resource/017_for4.png)

Aj tu stále používame:

```swift
id: \.self
```

Dôvod je rovnaký ako predtým. Prvky v poli `images` sú tiež jednoduché reťazce, takže na začiatku učenia stačí použiť samotný prvok ako spôsob rozlíšenia.

Môžeme si to jednoducho zapamätať ako pevné pravidlo:

**Keď `ForEach` iteruje cez jednoduché pole typu `String` alebo `Int`, zvyčajne sa píše `id: \.self`.**

### Pridanie obrázkov

Ak budeme neskôr potrebovať pridať ďalšie obrázky, stačí upraviť obsah poľa:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Nie je potrebné znovu opakovane písať nový kód `Image`.

Ak je obrázkov veľa, môžeme to kombinovať so `ScrollView`. Inak po prekročení obrazovky nebude možné obsah celý prezrieť.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Úprava obrázkov

Keď potrebujeme jednotne upraviť štýl obrázkov, stačí zmeniť kód vo vnútri `ForEach`.

Napríklad zmeníme šírku na `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Takto sa upravia všetky obrázky naraz a nemusíme ich meniť po jednom.

To je jedna z dôležitých úloh `ForEach`:

**Keď má viacero view rovnakú štruktúru a odlišuje sa iba obsah, stačí napísať kód view len raz a údaje v poli rozhodnú o tom, čo sa zobrazí.**

## Zhrnutie

V tejto lekcii sme sa naučili cyklus `for` a `ForEach`.

Cyklus `for` sa používa na postupné spracovanie prvkov v poli alebo rozsahu a viac sa prikláňa k práci s údajmi.

`ForEach` sa v SwiftUI používa na opakované vytváranie view podľa obsahu poľa a viac sa prikláňa k zobrazovaniu rozhrania.

Pre aktuálnu začiatočnícku úroveň je najbežnejší zápis `ForEach` tento:

```swift
ForEach(pole, id: \.self) { prvok in
    SwiftUI kod
}
```

Tu `id: \.self` znamená, že na odlíšenie každého prvku používame samotný prvok.

Keď obsah poľa tvorí jednoduchý typ ako `String` alebo `Int`, zvyčajne môžeme najprv používať práve tento zápis.

Keď budete neskôr pri prehliadaní webu alebo používaní App vidieť skupiny opakujúceho sa textu, obrázkov alebo iného zoznamového obsahu, môžete si predstaviť, že v SwiftUI sa takýto obsah zvyčajne najprv vloží do poľa a potom sa cez `ForEach` postupne zobrazí.
