# Swift a SwiftUI

Pri učení vývoja pre platformy Apple majú mnohé návody tendenciu vysvetľovať Swift a SwiftUI oddelene, čo môže u začiatočníkov vytvoriť pocit rozdelenia a viesť k mylnej predstave, že ide o dve úplne nezávislé technológie.

V skutočnosti Swift a SwiftUI tvoria hlboko prepojený celok: Swift je programovací jazyk, ktorý zabezpečuje logiku a dáta; SwiftUI je používateľský framework postavený na Swifte, ktorý je zodpovedný za vykresľovanie a interakciu zobrazení.

Táto lekcia vám pomôže vytvoriť si jasný mentálny model: čo je Swift, čo je SwiftUI a ako spolu v kóde spolupracujú.

## Čo je Swift?

Swift je moderný programovací jazyk vytvorený spoločnosťou Apple a používa sa na vývoj aplikácií pre platformy iOS, macOS, watchOS a tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift je silno typovaný statický jazyk. Pri návrhu sa viac zameriava na bezpečnosť, znižuje množstvo bežných programátorských chýb (napríklad nulové ukazovatele, prekročenie rozsahu a podobne) a podporuje bezproblémovú integráciu s jazykom C a Objective-C.

V reálnom vývoji Swift väčšinou zodpovedá za logickú časť aplikácie, napríklad za spracovanie dát, sieťové požiadavky, operácie ukladania a podobne.

## Čo je SwiftUI?

SwiftUI je nový framework na tvorbu používateľského rozhrania, ktorý Apple predstavil v roku 2019. SwiftUI používa deklaratívny štýl programovania a umožňuje vývojárom jednoduchším kódom opisovať štruktúru rozhrania aj interakčné správanie.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklaratívne programovanie znamená, že vývojár iba povie systému, čo sa má zobraziť, a systém podľa zmien dát automaticky obnoví view. Už nie je potrebné ručne aktualizovať stav rozhrania, čo výrazne zjednodušuje zložitosť vývoja UI.

Jadrom SwiftUI sú komponenty zobrazenia (napríklad `Text`, `Image`, `Button` a podobne) a layout kontajnery (napríklad `VStack`, `HStack`, `ZStack`). Tieto komponenty spolupracujú cez dátové prepojenie a správu stavu, takže rozhranie dokáže reagovať na zmeny dát a automaticky sa obnovovať.

## Ako Swift a SwiftUI spolupracujú?

Úlohy Swiftu a SwiftUI sa dajú zhrnúť do nasledujúcich bodov:

**1. Swift: spracovanie logiky a dát**

Swift sa používa hlavne na správu dát, uchovávanie stavu a vykonávanie logiky. Takýto kód zvyčajne priamo neovplyvňuje vykreslenie rozhrania, ale stará sa o spracovanie dát a správania aplikácie.

Napríklad spracovanie dát v Swifte:

```swift id="c0ix2n"
let markdown = try? String(contentsOf: url)
```

Tento kód zahŕňa deklaráciu premenných, definíciu konštánt, funkcie, riadiaci tok a podobne, ale priamo neovplyvňuje zobrazenie view.

**2. SwiftUI: deklarovanie a vykresľovanie rozhrania**

SwiftUI sa používa na vytváranie rozloženia a obsahu používateľského rozhrania a je zodpovedné najmä za vykresľovanie rozhrania a interakciu s view.

Napríklad vytvorenie textového view pomocou SwiftUI:

```swift id="13j1mk"
Text("SwiftSlim")
```

Takýto kód slúži na vytváranie a ovládanie prvkov rozhrania a priamo súvisí s používateľským rozhraním.

### Základný príklad

Nižšie je jednoduchý príklad SwiftUI:

```swift id="jlwmid"
// ContentView.swift

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
```

V tomto príklade:

**SwiftUI kód**: `VStack`, `Image`, `Text`, `padding` patria do SwiftUI a zodpovedajú za zobrazenie a rozloženie rozhrania.

**Swift kód**: komentár `//` na začiatku súboru a `import SwiftUI` patria do štruktúry Swift kódu; `#Preview` na konci je makro pre náhľad v Xcode a nezúčastňuje sa na skutočnom vykresľovaní rozhrania.

### Pokročilejší príklad

V reálnych projektoch sa Swift a SwiftUI často používajú spoločne, aby každý plnil úlohy, v ktorých je najsilnejší:

```swift id="dl11we"
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

V tomto príklade:

**SwiftUI kód**: `@State` je vlastnostný wrapper špecifický pre SwiftUI a používa sa na deklarovanie meniteľného stavu view; `Button` a `Text` sú komponenty SwiftUI zobrazenia, ktoré zabezpečujú zobrazenie rozhrania a interakciu s používateľom.

**Swift kód**: `private var name` a `func printName()` sú Swift kód, ktorý slúži na ukladanie dát a vykonávanie logiky, ale priamo nezodpovedá za vykresľovanie view.

Keď používateľ klikne na tlačidlo, SwiftUI spustí kód definovaný v tlačidle:

```swift id="4tutkn"
Button("Print") {
    printName()
}
```

Tu je `Button` komponent SwiftUI, zatiaľ čo vykonaná funkcia `printName()` je Swift kód zodpovedný za konkrétne spracovanie logiky.

Táto spolupráca umožňuje Swiftu a SwiftUI plynule sa prepájať: Swift sa stará o dáta a logiku, SwiftUI o zobrazenie používateľského rozhrania.

## Kde sa zvyčajne píše Swift kód a SwiftUI kód?

V SwiftUI sa rozhranie vytvára pomocou view vracaného vlastnosťou `body`. Preto sa všetok kód, ktorý opisuje rozhranie, zvyčajne píše do `body`.

Napríklad:

```swift id="flawnr"
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

V tomto príklade je `Text` komponent SwiftUI, preto musí byť zapísaný v `body`, pretože SwiftUI cez `body` číta a generuje rozhranie.

Kód, ktorý nesúvisí priamo s rozhraním, napríklad premenné, funkcie alebo logika spracovania dát, sa zvyčajne píše mimo `body`. Napríklad:

```swift id="j7crd5"
struct ContentView: View {

    // Swift: dáta alebo logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: rozhranie
    var body: some View {
        Text(name)
    }
}
```

Treba si uvedomiť, že aj v `body` sa stále môže používať syntax Swiftu, napríklad `if`, `for` a ďalšie riadiace štruktúry. Tie však slúžia iba na riadenie generovania SwiftUI view:

```id="ku2hju"
if isLogin {
    Text("Welcome")
}
```

Preto sa dá pri vývoji v SwiftUI jednoducho chápať toto pravidlo: kód view (`Text`, `Image`, `Button` a podobne) sa zvyčajne píše do `body`; dátový a logický kód (premenné, funkcie a podobne) sa zvyčajne píše mimo `body`.

## Swift súbory

Ako bude štúdium pokračovať, stretneme sa aj s architektúrou MVVM, kde vrstvy ViewModel a Model zvyčajne pozostávajú z čistého Swift kódu a sú úplne oddelené od vrstvy view (SwiftUI).

Napríklad trieda na správu stavu aplikácie:

```swift id="a4bm3k"
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Alebo štruktúra opisujúca dátový model:

```id="ajbqq9"
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Úlohou takýchto súborov je správa a perzistencia dát. Nezobrazujú sa priamo vo view, preto úplne patria do Swiftu.

## Historické pozadie

Ak chceme pochopiť vzťah medzi Swiftom a SwiftUI, je užitočné poznať aj vývoj technológií Apple. K roku 2026 tento technologický stack prešiel viacerými iteráciami.

### História Swiftu

Pred príchodom Swiftu bol hlavný programovací jazyk pre platformy Apple Objective-C, ktorý podporoval kombinovanie s jazykom C. Jeho syntax bola pomerne zdĺhavá a pre začiatočníkov mala vyššiu vstupnú náročnosť:

```Obj-c id="9hhvdd"
// Zápis v Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

V roku 2014 Apple predstavil jazyk Swift na WWDC. Swift má modernejšiu syntax, vyššiu typovú bezpečnosť a postupne nahradil Objective-C ako hlavný jazyk vývoja:

```swift id="g9eh4x"
// Zápis v Swifte
let name = "Fang"
print("Hello, \(name)")
```

Objective-C však úplne nezmizol z histórie. Stále sa široko používa v mnohých existujúcich projektoch a v niektorých nižších systémových frameworkoch. Znalosť jeho základnej syntaxe má preto stále hodnotu pri údržbe starších projektov aj pri pochopení systémového základu.

### História SwiftUI

Pred príchodom SwiftUI používal iOS **UIKit** a macOS **AppKit**. Tieto dva frameworky používali „imperatívny“ spôsob programovania. Vývojár musel cez Storyboard presúvať komponenty alebo ručne písať kód na ovládanie stavu view. To znamenalo veľké množstvo kódu a vyššie náklady na údržbu, najmä pri zložitejšej logike rozhrania.

![storyboard](../../RESOURCE/010_xcode.png)

V roku 2019 Apple oficiálne predstavil SwiftUI na WWDC. SwiftUI zaviedol „deklaratívnu“ programovaciu paradigmu a výrazne zjednodušil proces vývoja používateľského rozhrania.

![storyboard](../../RESOURCE/010_xcode1.png)

Treba si všimnúť, že SwiftUI nie je úplne nezávislá nízkoúrovňová implementácia. Na jednotlivých platformách v podstate spolupracuje a prepája sa s UIKitom (iOS) alebo AppKitom (macOS), pričom na nižšej úrovni sa stále opiera o tieto frameworky.

### Vzťah Swiftu a UIKit/AppKit

Hoci je Swift univerzálny programovací jazyk a môže fungovať na rôznych platformách Apple, nedokáže úplne nahradiť UIKit alebo AppKit. Pri niektorých zložitejších požiadavkách na rozhranie alebo pri funkciách, ktoré SwiftUI ešte nepokrýva, je stále potrebné siahnuť po UIKit alebo AppKit.

Napríklad UIKit je už veľmi vyspelý pri správe zložitých view controllerov, animáciách, rozpoznávaní gest a podobných oblastiach a za sebou má rozsiahle overenie v produkčnej praxi. SwiftUI v týchto oblastiach síce neustále napreduje, no v niektorých okrajových scenároch stále naráža na limity.

Preto mnoho vývojárov v projektoch kombinuje SwiftUI s UIKitom (alebo AppKitom), aby čo najlepšie využili silné stránky oboch strán.

Z tohto pohľadu možno SwiftUI chápať ako vyššiu úroveň abstrakcie nad UIKit / AppKit. Pri učení SwiftUI je preto užitočné primerane poznať aj základné pojmy UIKitu a AppKitu, aby ste vedeli robiť rozumnejšie technické rozhodnutia pri údržbe starších projektov alebo implementácii zložitejších funkcií.

## Zhrnutie

**Swift**: používa sa hlavne na písanie logiky, spracovanie dát, riadiaci tok a podobne, teda na časti, ktoré nesúvisia s rozložením view.

**SwiftUI**: používa sa na deklaratívne vytváranie používateľského rozhrania; kód opisujúci obsah view a jeho rozloženie patrí do SwiftUI.

V reálnom vývoji sa Swift a SwiftUI zvyčajne používajú spolu: Swift rieši logiku, SwiftUI rieši rozhranie.

Od Objective-C a UIKitu po Swift a SwiftUI sa vývojové prostredie Apple postupne posúvalo smerom k modernejšiemu a jednoduchšiemu spôsobu programovania, no UIKit a AppKit stále nemožno v mnohých tradičných projektoch ignorovať.

Keď pochopíme vzťah medzi Swiftom a SwiftUI, dokážeme efektívnejšie vyvíjať aplikácie pre iOS a macOS a zároveň robiť rozumnejšie technické rozhodnutia pri údržbe starších projektov.
