# Správa súborov v Xcode

V tejto lekcii sa naučíme bežné operácie so súbormi v Xcode.

V predchádzajúcich lekciách sme väčšinu kódu písali do `ContentView`. Takto sa jednoduchšie sleduje kód aj výsledok zobrazenia.

Napríklad:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

V skutočnej aplikácii však zvyčajne nedávame všetok kód do jedného súboru.

Keď pribúda stránok, komponentov a funkcií, potrebujeme rozdeliť rôzne zobrazenia do rôznych súborov SwiftUI.

Napríklad:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Vďaka tomu je štruktúra kódu prehľadnejšia a zároveň sa uľahčuje neskoršia údržba a úpravy.

## Prečo spravovať súbory

V SwiftUI možno stránku alebo komponent zvyčajne zapísať ako samostatný súbor zobrazenia.

Napríklad:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Tu je `CardView` jedno zobrazenie SwiftUI.

Ak by boli všetky zobrazenia zapísané v `ContentView`, kód by bol čoraz dlhší a čoraz ťažšie čitateľný.

Preto sa potrebujeme naučiť vytvárať, premenúvať a odstraňovať súbory a používať priečinky na správu rôznych súborov s kódom.

## Vytvorenie súboru SwiftUI

V Xcode existujú dva bežné spôsoby, ako vytvoriť súbor SwiftUI:

Jedným spôsobom je vytvoriť prázdny súbor a potom si kód napísať sami.

Druhým spôsobom je vytvoriť súbor zo šablóny SwiftUI, aby Xcode automaticky vygeneroval základný kód.

Pre začiatočníkov sa viac odporúča použiť súbor zo šablóny SwiftUI, pretože automaticky vytvorí základnú štruktúru.

### Vytvorenie prázdneho súboru

V oblasti Navigator na ľavej strane Xcode kliknite pravým tlačidlom na prázdne miesto alebo na priečinok a vyberte `New Empty File`.

Miesto operácie je zobrazené nižšie:

![xcode](../../../Resource/027_view1.png)

Po vytvorení prázdneho súboru Xcode zvyčajne vytvorí nepomenovaný súbor Swift, napríklad `Untitled.swift`.

Môžeme ho premenovať na `TestView.swift`.

V projekte SwiftUI, ak sa tento súbor používa na zobrazenie view, zvyčajne sa odporúča pridať na koniec názvu `View`.

Napríklad:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Nie je to povinné pravidlo, ale pomáha nám na prvý pohľad rozpoznať, že ide o súbor zobrazenia.

Po vytvorení prázdneho súboru môže súbor obsahovať len predvolené komentáre, alebo môže byť prázdny. Závisí to od verzie Xcode a spôsobu vytvorenia.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

V tejto chvíli musíme ručne napísať kód SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Takto je vytvorený jednoduchý súbor zobrazenia SwiftUI.

### Premenovanie súboru

Ak chcete po vytvorení súboru upraviť jeho názov, môžete súbor vybrať v oblasti Navigator na ľavej strane Xcode a potom stlačiť kláves Return `⏎`.

![xcode](../../../Resource/027_view2.png)

Takto môžete upraviť názov súboru.

Treba si uvedomiť, že zmena názvu súboru automaticky nezmení názov zobrazenia v kóde.

Napríklad po zmene názvu súboru na `ProfileView.swift` môže kód stále obsahovať `struct TestView: View`.

Nemusí to nevyhnutne spôsobiť chybu, ale ľahko to môže viesť k nejasnostiam.

Preto sa odporúča udržiavať názov súboru a názov zobrazenia konzistentné. Ak je napríklad názov súboru `ProfileView.swift`, názov zobrazenia by mal byť tiež `ProfileView`.

## Vytvorenie súboru zo šablóny SwiftUI

Okrem vytvorenia prázdneho súboru môžeme priamo vytvoriť aj súbor zo šablóny SwiftUI.

V oblasti Navigator na ľavej strane Xcode kliknite pravým tlačidlom na prázdne miesto alebo na priečinok a vyberte `New File from Template...`.

Miesto operácie je zobrazené nižšie:

![xcode](../../../Resource/027_view3.png)

Vo vyskakovacom okne môžete hore vybrať rôzne platformy, napríklad `iOS`, `macOS` a podobne.

Tu ponechajte platformu, ktorá zodpovedá aktuálnemu projektu. Ak napríklad vytvárame iOS App, vyberieme `iOS`.

![xcode](../../../Resource/027_view4.png)

Potom dole vyberte `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Potom kliknite na `Next`, zadajte názov súboru a uložte ho.

Napríklad vytvoríme súbor `Test2View.swift`.

Xcode automaticky vygeneruje kód podobný tomuto:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

V porovnaní s prázdnym súborom súbor zo šablóny automaticky obsahuje `import SwiftUI`, `struct`, `body` a `#Preview`.

Preto je pre začiatočníkov používanie súboru zo šablóny SwiftUI jednoduchšie a znižuje pravdepodobnosť, že zabudnú napísať potrebný kód.

**Tip**: Okrem vytvorenia súboru kliknutím pravým tlačidlom môžete tiež kliknúť na tlačidlo plus v spodnej časti oblasti Navigator na ľavej strane Xcode a vytvoriť súbor alebo priečinok.

![xcode](../../../Resource/027_view5.png)

## Vytvorenie priečinka

Keď je súborov čoraz viac, môžeme ich spravovať pomocou priečinkov.

V oblasti Navigator na ľavej strane Xcode kliknite pravým tlačidlom na prázdne miesto alebo na priečinok a vyberte `New Folder`.

Po vytvorení priečinka doň môžete presunúť súvisiace súbory.

![xcode](../../../Resource/027_view7.png)

Priečinky sa používajú hlavne na usporiadanie štruktúry projektu. Nemenia spôsob používania samotného zobrazenia.

Pokiaľ je názov zobrazenia správny, stále ho možno používať v iných súboroch vo forme ako `TestView()` a `Test2View()`.

## Odstránenie súboru alebo priečinka

Ak chcete odstrániť súbor alebo priečinok, môžete vybrať príslušný súbor v oblasti Navigator na ľavej strane Xcode, potom kliknúť pravým tlačidlom a vybrať `Delete`.

Môžete tiež vybrať súbor a stlačiť kláves Delete `⌫`.

Xcode zobrazí okno na potvrdenie odstránenia.

![xcode](../../../Resource/027_view10.png)

Výber `Move to Trash` znamená presunúť súbor do Koša.

Ak vidíte `Remove Reference`, znamená to, že sa z projektu Xcode odstráni iba referencia, ale pôvodný súbor na disku sa neodstráni.

Pre začiatočníkov platí, že ak odstraňujete len bežný súbor, ktorý ste práve vytvorili, zvyčajne stačí vybrať `Move to Trash`.

## Zobrazenie viacerých zobrazení SwiftUI

Keď sa naučíme vytvárať súbory, môžeme rozdeliť rôzne zobrazenia do rôznych súborov.

Napríklad vytvoríme dva súbory SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` sa používa na zobrazenie mena autora:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` sa používa na zobrazenie pozadia karty:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Potom môžeme tieto dve zobrazenia použiť v `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Po spustení vidíme, že `CardView` a `AuthorView` sú skombinované a zobrazené spolu:

![xcode](../../../Resource/027_view11.png)

V tomto výsledku slúži `CardView` ako pozadie a `AuthorView` sa zobrazuje nad ním. Je to preto, že sú vložené do `ZStack`.

V `ContentView` používame tieto dve zobrazenia cez `CardView()` a `AuthorView()`. Zátvorky `()` za názvom znamenajú vytvorenie a použitie tohto zobrazenia.

Toto je bežné vnáranie zobrazení v SwiftUI: v jednom zobrazení môžeme ďalej používať ďalšie zobrazenia.

## Vstupný súbor

Nakoniec si zopakujme, odkiaľ aplikácia začína zobrazovať rozhranie.

V projekte SwiftUI zvyčajne existuje vstupný súbor:

```swift
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

Tu `@main` znamená, že toto je vstupné miesto aplikácie.

V `WindowGroup` vidíme:

```swift
ContentView()
```

To znamená, že po spustení aplikácie sa ako prvý zobrazí `ContentView`.

Potom sa vnútri `ContentView` zobrazí aj:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Preto možno hierarchiu zobrazení chápať takto:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Ak vo vstupnom súbore zmeníme zobrazené zobrazenie na `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Potom sa po spustení aplikácie zobrazí iba `CardView`.

Inými slovami, `WindowGroup` vo vstupnom kóde rozhoduje, ktoré zobrazenie sa po spustení aplikácie zobrazí ako prvé.

A vnútri tohto zobrazenia sa môžu ďalej zobrazovať ďalšie zobrazenia.

## Zhrnutie

V tejto lekcii sme sa naučili bežné operácie správy súborov v Xcode.

Dozvedeli sme sa, ako vytvárať súbory SwiftUI, ako premenúvať súbory, ako vytvárať priečinky a ako odstraňovať súbory.

Zároveň sme sa naučili dôležitý koncept: zobrazenia SwiftUI možno rozdeliť do rôznych súborov a potom ich používať v iných zobrazeniach.

Napríklad:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Tu `CardView()` a `AuthorView()` predstavujú použitie iných zobrazení vnútri `ContentView`.

Nakoniec sme si zopakovali aj logiku zobrazenia vstupného súboru.

Keď sa aplikácia spustí, najprv vstúpi do vstupného kódu označeného `@main` a potom zobrazí zobrazenie vnútri `WindowGroup`.

To nám pomáha pochopiť, že rôzne súbory SwiftUI nie sú navzájom izolované. Môžu sa kombinovať a nakoniec vytvoriť kompletné rozhranie aplikácie.
