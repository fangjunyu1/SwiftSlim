# Životný cyklus view v SwiftUI

V predchádzajúcej lekcii sme sa dozvedeli, že premenné `@State` sledujú životný cyklus view, a naučili sme sa aj základné použitie `onAppear`.

V tejto lekcii budeme ďalej rozumieť životnému cyklu view v SwiftUI. Pozrieme sa na to, ako sa view vytvára a zobrazuje, ako sa vytvárajú a znovu vytvárajú premenné vo view, a naučíme sa aj `onAppear`, `onDisappear` a konštruktor `init`.

Na základe týchto poznatkov si vytvoríme celkové pochopenie procesu vytvárania view v SwiftUI.

## Poradie spustenia aplikácie

Pri vytvorení iOS projektu Xcode predvolene vygeneruje dva súbory:

``` id="h2m8qa"
ContentView.swift
ProjectName + App.swift
```

Z nich je `"ProjectName + App".swift` vstupný súbor celej aplikácie.

Napríklad:

```swift id="u1z7kc"
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Priebeh vykonávania kódu

Keď spustíme aplikáciu (v simulátore alebo na reálnom zariadení), systém vyhľadá kľúčové slovo `@main`:

```swift id="z4f1ly"
@main
struct SwiftSlimTestApp: App {...}
```

Po potvrdení vstupného súboru začne vykonávať kód.

Najprv vstúpi do štruktúry `App`, vykoná kód vo vnútri `body`, potom vytvorí `WindowGroup` a načíta doň `ContentView`.

### Úloha WindowGroup

`WindowGroup` sa používa na správu okien:

```swift id="r8y5vm"
WindowGroup {
    ContentView()
}
```

Systémy iPad a macOS podporujú viacero okien, zatiaľ čo iPhone má zvyčajne iba jedno okno.

Preto `WindowGroup` na iPhone spravuje najmä prvé zobrazené rozhranie.

### Proces načítania view

Keď systém nájde `ContentView`:

```swift id="g5n2dr"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI vykoná kód v `body`, potom podľa vrátenej štruktúry view (napríklad `VStack`, `Text` a podobne) vytvorí rozhranie a zobrazí ho na obrazovke.

Po dokončení týchto krokov môžeme vo view vidieť `ContentView`.

![ContentView](../../Resource/016_view1.png)

Treba si uvedomiť, že úlohou `body` je generovať view, nie view ukladať.

To znamená, že pri každom obnovení view SwiftUI znovu vypočíta `body` a vytvorí novú štruktúru view.

### Logika preview view

Preview v Xcode (`Canvas`) a skutočné spustenie sú dva odlišné mechanizmy.

Napríklad ak do vstupného súboru pridáme ladiaci výstup:

```swift id="e4v3sb"
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Keď v Xcode zobrazíme náhľad `ContentView`, nespúšťa sa od vstupu `@main`, preto sa `onAppear` vo vstupnom súbore nespustí.

Ak však aplikáciu spustíme v simulátore alebo na reálnom zariadení, systém začne vykonávanie od `@main`, spustí celý App podľa kompletného toku a vyvolá `onAppear` vo vstupe, čím vytlačí ladiacu informáciu.

Podstatné je, že preview v Xcode je iba „lokálne vykreslenie“, ktoré slúži len na zobrazenie aktuálneho view. Simulátor a reálne zariadenie poskytujú „úplné prostredie na spustenie“, takže vykonajú celú aplikáciu.

Preto by sa pri testovaní funkcií App malo vychádzať zo simulátora alebo reálneho zariadenia. Xcode preview neposkytuje kompletné bežiace prostredie.

## Životný cyklus view

V tejto fáze je všetok náš kód sústredený v `ContentView`. V skutočnej aplikácii však App zvyčajne obsahuje viacero view, medzi ktorými sa v rôznych situáciách prepína.

Napríklad v „pokladničke“:

![PiggyBank](../../Resource/016_view.png)

Keď klikneme na „uložiť peniaze“, zobrazí sa view `SaveView`; keď sa ukladanie dokončí alebo sa zavrie, `SaveView` sa odstráni.

Tento proces je práve životný cyklus view: od vytvorenia view, cez jeho zobrazenie až po jeho odstránenie.

### Zatvorenie aplikácie

Keď sa App zatvorí, všetky view sa odstránia a súvisiaci stav zmizne.

Preto sa `ContentView` aj ostatné view odstránia z pamäte a celý bežiaci stav App sa vymaže.

## Životný cyklus premenných vo view

V SwiftUI je životný cyklus premenných zvyčajne naviazaný na view.

Napríklad:

```swift id="j7u9nx"
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Premenná @State

Premenná deklarovaná pomocou `@State` je viazaná na životný cyklus view.

```swift id="x6d2bo"
@State private var name = "FangJunyu"
```

Keď sa view vytvorí, vytvorí sa aj `name`; keď sa view odstráni, zanikne aj `name`.

Práve preto musíme používať napríklad `UserDefaults` na perzistentné ukladanie dát.

### Premenné vo vnútri body

Premenná definovaná vo vnútri `body`:

```swift id="b1q4km"
var num = 10
```

Jej životný cyklus je naviazaný na vykonanie `body`.

Keď sa stav v SwiftUI zmení, napríklad:

```swift id="w9k3yr"
@State private var name = "FangJunyu"
name = "Hu"
```

Keď sa `name` zmení, `@State` zaznamená zmenu dát a oznámi SwiftUI, aby view znovu vypočítalo, takže `body` sa znovu prepočíta.

Pri opätovnom prepočítaní `body` sa znovu vykoná všetok kód v `body`, takže premenné vo vnútri `body` (napríklad `num`) sa vytvoria znova.

Aj preto sa neodporúča definovať vo vnútri `body` zložité premenné.

Pretože pri každom obnovení view sa premenné v `body` vytvoria znova, čo zvyšuje výpočtové náklady a môže ovplyvniť výkon.

V SwiftUI by sa rôzne typy dát mali spravovať rôznymi spôsobmi. Dáta, ktoré majú sledovať životný cyklus view, môžeme ukladať cez `@State`; dočasné výpočtové dáta môžeme umiestniť do `body`.

## onAppear a onDisappear

V predchádzajúcej lekcii sme sa už naučili `onAppear`, ktoré sa zavolá pri zobrazení view.

```swift id="i0k8wp"
.onAppear {}
```

Napríklad:

```swift id="y2m6vd"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

V preview Xcode alebo pri spustení môžeme vidieť ladiaci výstup z `onAppear`.

### onDisappear

K `onAppear` patrí aj zodpovedajúce `onDisappear`:

```swift id="k5z1ot"
.onDisappear {}
```

Keď sa view zavrie, zavolá sa `onDisappear`.

Napríklad:

```swift id="m3r7le"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Keď sa view odstráni, vykoná sa kód v `onDisappear`.

Tip: `ContentView`, ktorý v tejto fáze používame, je koreňové view aplikácie a nemožno ho priamo zavrieť ani odstrániť. Preto v tejto etape zatiaľ nevieme pozorovať efekt vykonania `onDisappear`.

Až pri neskoršom štúdiu prechodov medzi stránkami a otvárania nových view uvidíme, kedy sa `onDisappear` volá.

## Logika vytvorenia a zobrazenia

Treba si uvedomiť, že vytvorenie view a jeho zobrazenie sú dve odlišné fázy.

Keď sa view vytvorí, zavolá sa konštruktor štruktúry:

```swift id="r3m9hs"
init() {}
```

Keďže SwiftUI view je štruktúra typu `struct`:

```swift id="v4c7on"
struct ContentView: View { ... }
```

Takže keď sa vytvorí inštancia view, vykoná sa konštruktor `init`. Až keď sa view zobrazí, zavolá sa metóda `onAppear`.

Napríklad:

```swift id="u5w2ef"
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Keď si v Xcode zobrazíme preview view, môžeme vidieť ladiaci výstup:

```swift id="a8n1qy"
Create ContentView
Show ContentView
```

To ukazuje, že sa najprv vykoná `init` na vytvorenie view, potom sa vypočíta kód v `body` a nakoniec sa view zobrazí a vykoná sa `onAppear`.

Preto je dôležité chápať, že fáza vytvorenia view a fáza jeho zobrazenia sú oddelené.

### Konštruktor init

`init` je základná syntax Swiftu. Môže byť definovaný v `struct` aj `class` a používa sa na inicializáciu objektu.

```swift id="p6x4lj"
init() {}
```

V SwiftUI sa pri vytvorení view zavolá jeho metóda `init`, ktorú možno použiť na prijatie parametrov alebo inicializáciu dát.

Ak `init` nenapíšeme ručne, Swift pre `struct` automaticky vygeneruje predvolený konštruktor.

Pri SwiftUI view, ako je `ContentView`, sa teda pri vytvorení view vykoná `init` a pri zobrazení view sa vykoná `onAppear`.

Preto je `init` konštruktor, ktorý sa vykonáva pri vytvorení view, a neskôr sa bude používať pri odovzdávaní parametrov alebo inicializácii dát.

## Zhrnutie

V tejto lekcii sme sa naučili poradie spustenia aplikácie, teda tok vykonávania od vstupného súboru až po súbor `ContentView`.

Pochopili sme životný cyklus view v SwiftUI: pri vytvorení view sa vykoná `init`, pri zobrazení na obrazovke sa vykoná `onAppear` a pri odstránení alebo zatvorení view sa vykoná `onDisappear`.

Naučili sme sa aj mechanizmus aktualizácie view: view je riadené stavom. Keď sa zmení stav, napríklad `@State`, SwiftUI obnoví view, znovu vypočíta `body` a premenné vo vnútri `body` sa znovu vytvoria.

Životný cyklus premenných je naviazaný na životný cyklus view a dočasné premenné vo vnútri `body` sa pri každom obnovení vytvárajú znova.

Pochopenie týchto životných cyklov a správania premenných nám pomáha lepšie organizovať kód a udržiavať logiku aplikácie prehľadnejšiu.
