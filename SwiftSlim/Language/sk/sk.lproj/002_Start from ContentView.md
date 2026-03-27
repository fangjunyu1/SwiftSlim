# Začíname od ContentView

## Príprava pred lekciou

V tejto lekcii začneme so súborom ContentView.swift a systematicky si predstavíme základnú štruktúru SwiftUI vrátane:

- komentárov
- štruktúry View
- rozložení VStack / HStack / ZStack
- ikon SF Symbols
- modifikátorov zobrazenia (modifier)
- náhľadového kódu #Preview

Najprv nájdite projekt Xcode, ktorý ste vytvorili predtým, a dvojklikom otvorte súbor .xcodeproj.

V ľavej navigačnej oblasti Navigator vyberte súbor ContentView.swift.

Poznámka: Pri každom otvorení projektu môže Canvas zobrazovať „Preview paused“. Kliknutím na tlačidlo obnovenia sa náhľad opäť aktivuje.

![Swift](../../RESOURCE/002_view7.png)

## Zoznámme sa s ContentView

Kód ContentView:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
````

Aj keď je kódu pomerne málo, obsahuje základnú štruktúru SwiftUI.

### 1. Komentáre

Na vrchu súboru:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Toto je komentár súboru, ktorý slúži na zaznamenanie informácií o súbore, vrátane názvu súboru, názvu projektu, autora a času vytvorenia.

V Swifte sa na jednoriadkový komentár používa //:

```swift
// Toto je komentár
```

Komentáre môžu zlepšiť čitateľnosť kódu a pomôcť vývojárom pochopiť jeho logiku.

V skutočnom vývoji môže byť kód niekedy ťažko zrozumiteľný. Ak nepíšete komentáre, môže sa ľahko stať, že o tri dni nebudete rozumieť ani vlastnému kódu.

Preto je dobrým vývojovým návykom priebežne dopĺňať komentáre počas písania kódu. Pomáhajú zaznamenať logiku kódu a uľahčujú jeho neskoršiu údržbu.

**Dočasné vypnutie kódu**

Komentáre sa dajú použiť aj na dočasné vypnutie časti kódu, čo pomáha pri hľadaní problémov.

Napríklad:

```
A
B
C
```

A, B a C sú tri časti kódu a jedna z nich obsahuje chybu. Na diagnostiku môžeme niektoré riadky dočasne zakomentovať.

Najprv pridáme komentár k A:

```
// A
B
C
```

Ak po zakomentovaní A kód začne fungovať správne, znamená to, že problém je v časti A.

Ak problém pretrváva aj po zakomentovaní A, môžeme následne zakomentovať B a tak ďalej, až kým nenájdeme chybný kód.

Počas vývoja narazíme na veľa problémov a veľmi často ich riešime práve takýmto spôsobom — dočasným zakomentovaním kódu. Pomáha nám to lokalizovať problémové miesto a nájsť BUG.

V Xcode môžete použiť klávesovú skratku:

```
Command ⌘ + /
```

na rýchle pridanie alebo odstránenie komentára.

### 2. Import frameworku SwiftUI

```swift
import SwiftUI
```

Tento kód znamená, že importujeme framework SwiftUI.

Typy ako View, Text, Image alebo VStack v SwiftUI pochádzajú práve z tohto frameworku.

Ak framework SwiftUI neimportujete, Xcode vypíše chybu:

```
Cannot find type 'View' in scope
```

To znamená, že kompilátor nevie rozpoznať typ View.

### 3. Štruktúra View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Keď túto štruktúru View vidíte prvýkrát, môže pôsobiť nezvyčajne, pretože obsahuje kľúčové slová struct, View, var, body a some.

Tieto kľúčové slová sme sa zatiaľ neučili. Zatiaľ stačí vedieť, že tento kód vytvára zobrazenie View s názvom ContentView.

View si môžete predstaviť ako plátno, na ktoré môžeme kresliť, a nástrojom na toto kreslenie je SwiftUI.

Napríklad:

![Swift](../../RESOURCE/002_view.png)

Na obrázku vyššie sú zobrazené tri obrazovky, ktoré sú v skutočnosti tri rôzne View.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Keď vyvíjame aplikáciu pomocou SwiftUI, každá obrazovka je jedno View.

### 4. SwiftUI kód

Vo vnútri zobrazenia View sa nachádza SwiftUI kód:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Tento SwiftUI kód znamená, že ide o vertikálne rozloženie, v ktorom sa zobrazuje ikona a text.

![Swift](../../RESOURCE/002_view1.png)

#### Rozloženie VStack

```swift
VStack { }  // vertikálne rozloženie
```

VStack predstavuje kontajner pre vertikálne rozloženie. Vnútorné zobrazenia sa usporiadajú zhora nadol.

![Swift](../../RESOURCE/002_view8.png)

V SwiftUI existujú tri bežné typy rozloženia:

* VStack —— vertikálne usporiadanie
* HStack —— horizontálne usporiadanie
* ZStack —— vrstvené usporiadanie (os Z)

```swift
HStack { }  // horizontálne usporiadanie
ZStack { }  // vrstvené usporiadanie
```

Schéma usporiadania jednotlivých layoutov:

![Swift](../../RESOURCE/002_view2.png)

Napríklad pri použití HStack na horizontálne usporiadanie:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Môžete vidieť, že ikona zemegule a text sú zobrazené vedľa seba vodorovne.

![Swift](../../RESOURCE/002_view3.png)

Ak chceme vodorovné usporiadanie, použijeme HStack. Ak chceme vrstvené usporiadanie, použijeme ZStack.

#### Image a SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Tento kód zobrazí ikonu zemegule. Táto ikona pochádza zo systému ikon SF Symbols od Apple.

![Swift](../../RESOURCE/002_view9.png)

Význam kódu je taký, že sa zobrazí ikona zemegule vo väčšej veľkosti a s farbou zvýraznenia.

Okrem ikony zemegule môžeme zobraziť aj iné ikony.

Napríklad zobrazenie batohu:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Ako zobraziť iné ikony?**

Musíme použiť oficiálnu systémovú knižnicu ikon SF Symbols od Apple.

Na oficiálnej stránke Apple Developer si stiahnite [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Otvorte aplikáciu SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Naľavo sa nachádzajú kategórie symbolov a napravo príslušné ikony.

Kliknite pravým tlačidlom myši na ikonu a vyberte „Copy Name“, čím skopírujete názov symbolu ako reťazec.

Napríklad:

```
"globe"
"backpack"
"heart"
```

Keď vložíte skopírovaný názov ikony do Image(systemName:), môžete zobraziť inú ikonu.

Poznámka: Každá ikona SF Symbols má minimálnu podporovanú verziu systému. Ak je verzia systému príliš nízka, ikona sa nemusí zobraziť. Informácie o kompatibilite nájdete v aplikácii SF Symbols.

#### Modifikátory

V SwiftUI je modifikátor (modifier) metóda, ktorá sa používa na zmenu vzhľadu alebo správania zobrazenia.

Modifikátory si môžete predstaviť ako oblečenie — keď si oblečiete niečo iné, váš vzhľad sa zmení.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale a foregroundStyle sú modifikátory zobrazenia Image. Bez zmeny samotného obsahu Image upravujú jeho vzhľad.

**1. imageScale**

```swift
.imageScale(.large)
```

Tento modifikátor riadi veľkosť ikon SF Symbols:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

Môžeme meniť jednotlivé možnosti a sledovať, ako sa mení veľkosť symbolu SF Symbols.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle riadi farbu popredia.

.tint predstavuje farbu zvýraznenia aktuálneho prostredia (accent color), ktorá je v iOS predvolene modrá.

Ak chceme zmeniť farbu popredia na červenú:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Zobrazenie Text

Text je textové zobrazenie, ktoré sa používa na zobrazenie reťazca.

```swift
Text("Hello, world!")
```

Napríklad na zobrazenie môjho mena:

```swift
Text("FangJunyu")
```

Poznámka: Reťazec musí byť uzavretý v dvojitých úvodzovkách "".

Môžete skúsiť zobraziť svoje meno, telefónne číslo alebo iný text.

#### padding — vnútorný okraj

V SwiftUI sa padding používa na pridanie prázdneho priestoru medzi obsah zobrazenia a jeho hranice. Patrí medzi „vnútorné okraje (padding / content inset)“.

```swift
HStack {
    ...
}
.padding()
```

Vyššie uvedený kód znamená, že zobrazeniu HStack pridáme predvolený systémový vnútorný okraj.

**Čo je padding?**

padding označuje „voľný priestor medzi obsahom zobrazenia a jeho hranicou“.

Na obrázku nižšie má modrý HStack nastavený padding, takže modrá oblasť sa smerom dovnútra opticky zmenší, akoby bola „o niečo menšia“.

![Swift](../../RESOURCE/002_view6.png)

**Predvolený okraj**

Modifikátor padding() predvolene používa štandardné rozostupy odporúčané systémom.

```swift
.padding()
```

Na rôznych platformách a v rôznych kontextoch sa táto hodnota môže líšiť, napríklad:

* v iOS je to zvyčajne približne 16 pt,
* v macOS alebo watchOS môže byť štandardný rozostup odlišný, väčší alebo menší, podľa návrhových pravidiel danej platformy.

**Vlastný okraj**

Môžeme nastaviť aj padding pre konkrétne smery.

1. Nastavenie jedného smeru

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Vysvetlenie smerov:

* .top: horný okraj
* .bottom: dolný okraj
* .leading: predný okraj
* .trailing: zadný okraj

![Swift](../../RESOURCE/002_view12.png)

Poznámka: leading a trailing sa automaticky prispôsobujú smeru jazyka. Napríklad v arabskom prostredí (RTL) sa automaticky prevrátia.

2. Nastavenie viacerých smerov

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Pomocou poľa môžeme naraz určiť viacero smerov. Podrobné použitie poľa si vysvetlíme v ďalších lekciách, tu zatiaľ stačí vedieť, že takýto zápis existuje.

3. Nastavenie horizontálneho alebo vertikálneho smeru

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

To je ekvivalentné k:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Odstránenie paddingu**

Ak nechceme žiadny vnútorný okraj, môžeme použiť .padding(0):

```swift
.padding(0)
```

alebo modifikátor padding jednoducho odstrániť:

```swift
// .padding()
```

### 6. Náhľadový kód Preview

```swift
#Preview {
    ContentView()
}
```

Tento kód znamená, že sa v Canvas vytvorí náhľad zobrazenia ContentView.

Poznámka: #Preview je nová syntax zavedená v Swift 5.9 / Xcode 15. Predtým sa používala štruktúra PreviewProvider.

**Čo sa stane, ak Preview zakomentujeme?**

Ak Preview zakomentujeme:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas už nebude zobrazovať vykresliteľný obsah.

![Swift](../../RESOURCE/002_xcode.png)

Práve #Preview riadi zobrazenie náhľadu v Canvas.

Keď potrebujeme v Xcode zobraziť náhľad SwiftUI zobrazenia, pridáme kód #Preview. Ak náhľad nepotrebujeme, môžeme kód #Preview zakomentovať alebo odstrániť.

## Zhrnutie

Aj keď súbor ContentView.swift neobsahuje veľa kódu, v skutočnosti zahŕňa viacero základných pojmov SwiftUI. Pre začiatočníka môže táto ukážka pôsobiť neznámo, ale rozdelením kódu na menšie časti si možno vytvoriť počiatočné porozumenie SwiftUI.

Najprv sme sa naučili komentáre //, ktoré možno používať na vysvetlenie logiky kódu alebo na dočasné vypnutie niektorej časti kódu.

Potom sme si ukázali, že súbor SwiftUI musí importovať framework SwiftUI:

```swift
import SwiftUI
```

Ak framework neimportujeme, kompilátor nebude vedieť rozpoznať typy ako View.

Následne sme si predstavili základnú štruktúru SwiftUI zobrazenia:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Kde ContentView je názov zobrazenia.

Naučili sme sa aj tri bežné layout kontajnery: VStack (vertikálne usporiadanie), HStack (horizontálne usporiadanie) a ZStack (vrstvené usporiadanie).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Tento kód znamená, že sa zobrazí kontajner s vertikálnym usporiadaním a vo vnútri sa zobrazí ikona a text.

Image môže zobrazovať ikony SF Symbols a pomocou modifikátorov možno riadiť veľkosť aj farbu ikony.

Zobrazenie Text môže zobrazovať textový obsah.

padding predstavuje okraj, ktorý pridáva okolo zobrazenia priehľadný priestor.

Na záver sme si vysvetlili #Preview, ktoré umožňuje zobraziť náhľad zobrazenia v Canvas.

### Cvičenie po lekcii

Pre začiatočníkov môže byť obsah tejto lekcie trochu náročný. Lepšie porozumenie si môžete upevniť ďalším precvičovaním:

* zmeniť názov ikony SF Symbols
* zmeniť farbu popredia ikony na čiernu
* zmeniť VStack na HStack
* zakomentovať Image alebo Text a sledovať zmenu náhľadu

### Bonus: dopĺňanie kódu (Code Completion)

Pri písaní kódu ste si možno všimli, že Xcode automaticky zobrazuje zoznam dostupných možností.

Napríklad pri úprave modifikátora imageScale:

```swift
.imageScale(.)
```

Xcode zobrazí dostupné možnosti:

![Swift](../../RESOURCE/002_view10.png)

Ide o mechanizmus dopĺňania kódu (Code Completion). Je založený na odvodzovaní typov a ponuke členov enumerácií, čím zvyšuje efektivitu písania a znižuje počet chýb.

V ďalších lekciách si oficiálne predstavíme enumerácie (enum), teraz zatiaľ stačí len základné oboznámenie.
