# Aplikácia Fill Light

V tejto lekcii vytvoríme veľmi zaujímavú aplikáciu fill light. Keď nastane noc, môžeme nechať obrazovku telefónu zobrazovať rôzne farby a používať ju ako jednoduché doplnkové svetlo.

Táto aplikácia fill light dokáže prepínať farby klepnutím na obrazovku a tiež upravovať jas pomocou posuvníka.

V tomto príklade sa naučíme používať `brightness` na úpravu jasu zobrazenia, `onTapGesture` na pridanie gesta klepnutia do zobrazenia a ovládací prvok `Slider`.

Výsledok:

![Color](../../Resource/018_color.png)

## Zobrazenie farby

Najprv nechajme zobrazenie ukázať jednu farbu.

V SwiftUI `Color` nepredstavuje len farbu, ale môže byť zobrazený aj ako view:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Tu `Color.red` predstavuje červené zobrazenie. `.ignoresSafeArea()` spôsobí, že farebné zobrazenie vyplní celú obrazovku, takže viac pripomína skutočný efekt fill light.

Výsledok:

![Color](../../Resource/018_color1.png)

### Pole farieb a index

Momentálne sa zobrazuje iba jedna farba. Fill light však zvyčajne nemá len jednu farbu. Môže zobrazovať aj modrú, žltú, fialovú, bielu a ďalšie farby.

Chceme prepínať medzi rôznymi farbami, keď sa klepne na obrazovku. Tieto farby môžeme vložiť do poľa a spravovať ich spoločne:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Pole je vhodné na ukladanie „skupiny údajov rovnakého typu“. Tu je každý prvok poľa `Color`.

Ak chceme zobraziť konkrétnu farbu, môžeme použiť index:

```swift
colors[0]
```

To znamená prečítať farbu na indexe `0` v poli, teda prvú farbu.

Teraz môžeme kód napísať takto:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Týmto spôsobom obrazovka zobrazí prvú farbu v poli, teda červenú.

### Použitie indexu na ovládanie farby

Ak potrebujeme prepínať medzi rôznymi farbami, potrebujeme premennú na správu indexu namiesto toho, aby bol index napísaný napevno.

Na deklarovanie premennej, ktorá uloží index, môžeme použiť `@State`:

```swift
@State private var index = 0
```

Tu `index` predstavuje index aktuálnej farby.

Keď sa `index` zmení, SwiftUI znovu prepočíta rozhranie a aktualizuje zobrazený obsah.

Potom zmeníme pôvodné `colors[0]` na:

```swift
colors[index]
```

Takto bude farba zobrazená vo view určená pomocou `index`.

Teraz kód vyzerá takto:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Keď sa `index` zmení, `colors[index]` zobrazí inú farbu.

Napríklad:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Je dôležité si uvedomiť, že `index` nemôže prekročiť najväčší index poľa, inak vznikne chyba indexu mimo rozsahu.

## Gesto klepnutia

Teraz môžeme zobrazovať rôzne farby podľa `index`, ale stále ich ešte nevieme meniť klepnutím.

V predchádzajúcej lekcii „Kolotoč citátov“ sme použili `Button` na ovládanie prepínania citátov.

Tentoraz však chceme „klepnúť na celú farebnú plochu“, aby sme zmenili farbu, takže `onTapGesture` je vhodnejší.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Keď klepneme na farebné zobrazenie, vykoná sa tento kód:

```swift
index += 1
```

To znamená zvýšiť `index` o `1`. Po zvýšení indexu `colors[index]` zobrazí ďalšiu farbu v poli.

### `onTapGesture`

`onTapGesture` je modifikátor gesta, ktorý pridáva akciu klepnutia do view.

Základné použitie:

```swift
.onTapGesture {
    // code
}
```

Napríklad:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Keď sa na toto červené zobrazenie klepne, vykoná sa kód vo vnútri zložených zátvoriek a v konzole sa zobrazí:

```swift
Click color
```

Pomocou `onTapGesture` môžeme určiť, čo sa má stať po klepnutí na zobrazenie.

### Rozdiel oproti `Button`

Predtým sme sa učili o view `Button`. `Button` aj `onTapGesture` dokážu spracovať klepnutia, ale ich scenáre použitia nie sú úplne rovnaké.

`onTapGesture` je vhodnejší na „pridanie funkcie klepnutia k už existujúcemu view“, napríklad `Color`, `Image`, `Text` alebo inému bežnému view.

`Button` je vhodnejší vtedy, keď chceme reprezentovať jasné tlačidlo, napríklad „Potvrdiť“, „Odoslať“ alebo „Odstrániť“.

V tejto aplikácii fill light chceme, aby prepínanie farieb bolo jednoduchšie. Klepnutie na celú farebnú plochu zmení farbu, preto je tu `onTapGesture` dobrou voľbou.

## Problém s indexom

Teraz môžeme klepnúť na obrazovku a prepínať sa medzi rôznymi farbami.

Je tu však dôležitý problém: **index môže prekročiť rozsah poľa**.

Napríklad:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Ak budeme na obrazovku klikať ďalej, `index` sa nakoniec stane `4` a vtedy sa objaví chyba „index out of range“.

Je to preto, že pole `colors` má `4` prvky, ale indexovanie sa začína od `0`, takže platný rozsah indexov je `0 - 3`, nie `4`.

Ak pristúpime k `colors[4]`, objaví sa chyba „index out of range“.

V aktuálnom kóde každé klepnutie automaticky zvýši `index` o `1`. Ak to neošetríme, nakoniec určite prekročí platný rozsah.

Preto musíme pri klepnutí na obrazovku skontrolovať index: ak je to už posledná farba, vrátime sa na prvú farbu; inak pokračujeme pridaním `1`.

Môžeme to urobiť pomocou príkazu `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

V tomto kóde `colors.count` znamená počet prvkov v poli.

V aktuálnom poli sú 4 farby, takže:

```swift
colors.count // 4
```

Ale najväčší index nie je `4`, ale `3`, pretože indexovanie sa začína od `0`.

Preto posledný index treba zapísať takto:

```swift
colors.count - 1
```

Teda:

```swift
4 - 1 = 3
```

Táto logika znamená: ak aktuálny index už zodpovedá poslednej farbe, nastav index na `0`; inak ho zvýš o `1`.

Takto sa farby môžu meniť dookola.

### Zjednodušenie logiky indexu

Ak chceme, aby bol kód kratší, môžeme použiť aj ternárny operátor:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Tento kód znamená: ak `index == colors.count - 1` platí, vráť `0`. Inak vráť `index + 1`.

Nakoniec výsledok opäť priradíme do `index`.

Teraz môžeme dosiahnuť efekt prepínania farieb.

Úplný kód:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Teraz môžeme klepať na obrazovku a prepínať medzi rôznymi farbami. Základná aplikácia fill light je hotová.

## Zobrazenie názvu farby

Môžeme pridať ešte jednu skupinu textov zodpovedajúcich farbám, takže keď sa farba zmení, na obrazovke sa zobrazí aj názov aktuálnej farby.

Napríklad:

- Červená zobrazí `Red`
- Modrá zobrazí `Blue`
- Žltá zobrazí `Yellow`
- Fialová zobrazí `Purple`

Aj tu môžeme použiť pole na uloženie názvov farieb:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Poradie textov v tomto poli musí presne zodpovedať poradiu farieb v poli farieb.

Potom môžeme použiť `Text` na zobrazenie názvu farby podľa aktuálneho indexu:

```swift
Text(colorsName[index])
```

`Text` zobrazuje aktuálny názov farby podľa `index`.

Použime modifikátory na zlepšenie vzhľadu `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Tým sa `Text` zobrazí bielou farbou, veľkosťou nadpisu a tučným písmom.

Teraz máme `Color` view na celú obrazovku. Ak chceme, aby sa `Text` zobrazoval nad `Color` view, musíme použiť rozloženie `ZStack`, aby sme ich navrstvili na seba.

```swift
ZStack {
    Color
    Text
}
```

Kód sa teda zmení na:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Takto bude na pozadí farebné zobrazenie a nad ním bude vrstva textu.

Výsledok:

![Color](../../Resource/018_color2.png)

Je dôležité si všimnúť, že v `ZStack` sa view napísané neskôr zvyčajne zobrazujú vpredu. Ak sa `Text` napíše pred `Color`, neskôr napísané `Color` view môže `Text` zakryť.

## Ovládanie jasu

Teraz môžeme meniť rôzne farby, ale fill light má ešte jednu dôležitú funkciu: **úpravu jasu**.

V SwiftUI môžeme použiť modifikátor `brightness` na úpravu jasu view.

Napríklad:

```swift
.brightness(1)
```

Môžeme napísať:

```swift
colors[index]
    .brightness(0.5)
```

Tým sa aktuálna farba zosvetlí a viac sa priblíži efektu fill light.

Rozsah jasu je `0 - 1`. `0` znamená zachovať pôvodnú farbu a čím bližšie je hodnota k `1`, tým svetlejšia farba bude. `1` znamená najjasnejší biely výsledok.

Aj keď môžeme `brightness` ovládať v kóde, používateľ si ho stále nevie priamo nastaviť sám.

Preto musíme pridať ovládací prvok, ktorý sa dá posúvať: `Slider`.

## View `Slider`

V SwiftUI je `Slider` ovládací prvok používaný na výber hodnoty v určitom rozsahu. Apple ho opisuje ako „ovládací prvok na výber hodnoty z obmedzeného lineárneho rozsahu“.

Základné použitie:

```swift
Slider(value: $value, in: 0...1)
```

Vysvetlenie parametrov:

1. `value: $value`: `Slider` musí byť naviazaný na premennú.

    Keď sa posuvník pohybuje, hodnota premennej sa mení súčasne. A naopak, ak sa zmení premenná, posuvník sa tiež aktualizuje.

    Je to veľmi podobné `TextField`, ktorý sme sa učili skôr. Oba „prepájajú ovládací prvok s premennou“.

    Naviazaná premenná potrebuje pred sebou symbol `$`, aby označovala binding.

2. `in: 0...1`: tento parameter predstavuje rozsah hodnôt posuvníka.

    Tu `0...1` znamená, že minimálna hodnota je `0` a maximálna hodnota je `1`.

    Keď sa posuvník presunie úplne doľava, naviazaná premenná bude blízko `0`; keď sa presunie úplne doprava, bude blízko `1`.

Napríklad:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` je naviazaný na premennú `value`. Keď sa posuvník pohybuje, hodnota premennej `value` sa mení súčasne.

Vzhľad:

![Slider](../../Resource/018_slider.png)

Keď sa `Slider` posunie doľava, naviazaná hodnota `value` sa zmení na `0`. Keď sa posunie doprava, zmení sa na `1`.

### Rozsah hodnôt

Rozsah hodnôt `Slider` nie je pevne daný. Dá sa napísať aj takto:

```swift
0...100
```

alebo ako iný rozsah.

Ale v tejto aplikácii fill light potrebujeme ovládať jas, takže `0...1` je najvhodnejšia voľba.

## Použitie `Slider` na ovládanie jasu

Teraz musíme prepojiť `Slider` s `brightness`.

Najprv vytvorme premennú na uloženie hodnoty jasu:

```swift
@State private var slider = 0.0
```

Tu je `0.0` hodnota typu `Double`.

Keďže `Slider` býva zvyčajne naviazaný na číselný typ a tu chceme, aby sa menil plynule, `Double` je vhodnejší. Okrem toho `brightness` môže prijať iba hodnotu typu `Double`.

Potom túto hodnotu odovzdáme do `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Keď `slider == 0`, farba zostáva vo svojom predvolenom stave. Čím bližšie je `slider` k `1`, tým jasnejšie farba vyzerá.

### Pridanie ovládacieho prvku `Slider`

Ďalej pridajme ovládací prvok `Slider`, ktorým budeme meniť túto premennú:

```swift
Slider(value: $slider, in: 0...1)
```

Keď sa posuvník zmení, zmení sa aj hodnota `slider` a `brightness(slider)` aktualizuje jas zároveň.

Toto je veľmi typický príklad toho, ako v SwiftUI „premenné riadia view“.

### Úprava vzhľadu `Slider`

Predvolene `Slider` používa dostupnú šírku.

Môžeme mu dať pevnú šírku:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Potom pridajme ešte niekoľko modifikátorov, aby bol lepšie viditeľný:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Tým dáme posuvníku biele pozadie a zaoblené rohy, takže bude na `Color` view viditeľnejší.

Nakoniec ho umiestnime do spodnej časti obrazovky.

Keďže už používame `ZStack`, môžeme doň vložiť `VStack` a pomocou `Spacer()` zatlačiť `Slider` nadol.

## Úplný kód

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Výsledok:

![Color](../../Resource/018_color.png)

## Zhrnutie

Pomocou vedomostí, ktoré sme sa naučili skôr, spolu so základnými pojmami ako farby a polia, sme vytvorili veľmi zaujímavú aplikáciu fill light.

Vďaka tejto aplikácii fill light sme sa naučili používať `brightness` na úpravu jasu, `onTapGesture` na pridávanie akcií klepnutia do view a ovládací prvok `Slider`.

Pridali sme `onTapGesture` do view `Color`, aby sme mohli meniť farby. Použili sme aj ovládací prvok `Slider` na zmenu premennej, ktorá spravuje `brightness`, čo je ďalší príklad toho, že „premenné riadia view“.

Taktiež sme si zopakovali ternárny operátor, použili sme `ZStack` na vrstvenie view a polia na správu skupiny údajov rovnakého typu. To pomáha prehĺbiť naše chápanie polí a indexov vrátane praktického problému, ako sa vyhnúť chybám indexu mimo rozsahu.

Aj keď tento príklad nie je zložitý, prepája mnoho základných myšlienok, ktoré sme sa učili predtým. Keď sú spojené v malom skutočnom projekte, je jednoduchšie pochopiť, na čo každý pojem slúži.

### Reálny scenár použitia

Predstavte si, že položíte starý iPhone na stôl a pomocou aplikácie fill light, ktorú ste si sami vytvorili, ovládate farbu svetla. To by bol veľmi dobrý zážitok.

V App Store je veľa aplikácií typu „fill light“ a ani tie nevyzerajú veľmi zložito.

![AppStore](../../Resource/018_appStore.PNG)

Môžeme začať vytvárať jednoduché aplikácie a skúsiť ich publikovať v App Store. To nielen zvyšuje náš záujem o vývoj, ale aj zaznamenáva náš rast.

### Cvičenie po lekcii

Môžete ďalej premýšľať o tom, ako túto aplikáciu fill light rozšíriť, napríklad:

- Pridajte viac farieb
- Zobrazte aktuálnu hodnotu jasu
- Zlepšite dizajn spodnej oblasti so sliderom

Keď tieto vedomosti naozaj začnete používať, zistíte, že každý pojem, ktorý sa učíme, je v skutočnosti nástroj na tvorbu aplikácií.

Čím viac nástrojov si osvojíme, tým viac funkcií dokážeme vytvoriť.
