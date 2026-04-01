# Počítadlo

V predchádzajúcich dvoch lekciách sme sa naučili premenné, konštanty, tlačidlá a metódy.

V tejto lekcii tieto poznatky spojíme a vytvoríme jednoduchú aplikáciu počítadla.

V tomto príklade sa naučíme, ako ukladať a meniť premenné, a tiež ako používať `@State` na správu premenných.

## Vytvorenie počítadla

Počítadlo sa zvyčajne používa na zaznamenávanie množstva, ktoré sa neustále zvyšuje. Napríklad počet preskokov cez švihadlo, počet okruhov pri behu a podobné situácie.

Teraz si vytvoríme jednoduché počítadlo: zobrazíme číslo a tlačidlo, po kliknutí na tlačidlo sa číslo zvýši.

![Num](../../RESOURCE/009_num.png)

### Zobrazenie čísla

Najprv použijeme `Text` na zobrazenie čísla.

```swift
Text("0")
```

Ak sa však číslo má meniť, nemôžeme napevno zapísať `"0"`, ale mali by sme použiť premennú na uloženie čísla.

```swift
var num = 0
```

Potom zobrazíme premennú v `Text`:

```swift
Text("\(num)")
```

Tu používame interpoláciu reťazca `\\()`, aby sme číslo previedli na reťazec a zobrazili ho.

### Tlačidlo na zvýšenie čísla

Ďalej pridáme tlačidlo.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Keď sa na tlačidlo klikne, chceme, aby sa číslo zvýšilo.

Preto môžeme v tlačidle zmeniť premennú:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Tento kód znamená: keď klikneme na tlačidlo, vypočíta sa `num + 1` a výsledok sa priradí do `num`.

### Jednoduchší zápis

Swift ponúka jednoduchší zápis:

```swift
num += 1
```

Je to rovnaké ako:

```swift
num = num + 1
```

Tento zápis sa nazýva „zložený priraďovací operátor“.

Bežné zložené priraďovacie operátory v Swifte sú:

```
+=   priradenie sčítania
-=   priradenie odčítania
*=   priradenie násobenia
/=   priradenie delenia
%=   priradenie zvyšku po delení
```

Napríklad:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Kompletný kód

Teraz môžeme napísať jednoduché počítadlo:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Tento kód však zatiaľ nebude fungovať správne.

### Zobrazená chyba

Xcode zobrazí upozornenie:

```
Cannot assign to property: 'self' is immutable
```

To znamená, že vlastnosť sa nedá zmeniť, pretože view je nemenné.

Prečo sa to deje?

## Ako funguje SwiftUI

V SwiftUI platí: **rozhranie je riadené dátami**, čo znamená, že keď sa dáta zmenia, rozhranie sa automaticky obnoví.

Treba si však uvedomiť, že SwiftUI sleduje zmeny a obnovuje view iba vtedy, keď sa zmení stav (napríklad `@State`, `@Binding`).

Ak použijeme obyčajnú premennú, SwiftUI si jej hodnotu prečíta iba raz pri vytvorení view. Aj keby sa potom premenná zmenila, rozhranie sa neaktualizuje.

Napríklad:

```swift
var num = 0   // 0
num = 1   // 0
```

V uvedenom príklade je `num` obyčajná premenná. Hoci sa jej hodnota zmenila, SwiftUI neaktualizuje view a rozhranie bude stále zobrazovať pôvodnú hodnotu `0`.

![Num](../../RESOURCE/009_state.png)

Preto iba vtedy, keď sú dáta označené ako stav (napríklad pomocou `@State`, `@Binding` a podobne), SwiftUI ich bude automaticky sledovať a aktualizovať view.

## Vlastnostný wrapper @State

Ak chceme v SwiftUI meniť premennú a zároveň aktualizovať view, musíme použiť `@State`.

```swift
@State var num = 0
```

`@State` spôsobí, že SwiftUI bude túto premennú sledovať.

Keď sa hodnota premennej zmení, SwiftUI znovu vypočíta view a aktualizuje ho.

Kompletný kód:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Teraz, keď klikneme na tlačidlo:

```swift
num += 1
```

SwiftUI zistí, že sa `num` zmenilo, a potom automaticky aktualizuje view.

![Num](../../RESOURCE/009_state1.png)

## Pravidlá používania @State

V reálnom vývoji sa `@State` zvyčajne riadi dvomi pravidlami.

### 1. @State sa zvyčajne používa spolu s private

Premenná `@State` sa zvyčajne používa iba v aktuálnom type (napríklad v aktuálnej štruktúre `View`), preto sa často zapisuje takto:

```swift
@State private var num = 0
```

Tým sa zabráni tomu, aby iné view túto premennú priamo čítali alebo menili.

`private` sme sa zatiaľ neučili, takže si ho môžete jednoducho predstaviť takto:

**Obsah označený `private` sa dá používať iba v aktuálnom view, zvonka k nemu iné view nemajú prístup.**

### 2. @State je určené iba pre stav aktuálneho view

`@State` je vhodné pre dáta, ktoré spravuje samotné aktuálne `View`.

Napríklad obsah textového poľa alebo stav prepínača.

```swift
@State private var isOn = false
@State private var text = ""
```

Ak je potrebné zdieľať dáta medzi viacerými view, treba použiť iné typy stavu, napríklad `@Binding` alebo `@Observable`.

Tieto témy sa budeme učiť v ďalších lekciách.

### Tlačidlo na zníženie čísla

Počítadlo nemusí iba zvyšovať hodnotu, môže ju aj znižovať.

Môžeme pridať tlačidlo `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Potom použijeme `HStack` na vodorovné rozloženie tlačidiel:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Efekt:

![Num](../../RESOURCE/009_num1.png)

Po kliknutí na tlačidlo `+` sa číslo zvýši o 1, po kliknutí na tlačidlo `-` sa zníži o 1.

### Tlačidlo reset

Môžeme pridať aj tlačidlo reset, ktoré nastaví číslo späť na `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Keď klikneme na tlačidlo reset, do `num` sa priradí hodnota `0`.

Efekt:

![Num](../../RESOURCE/009_num2.png)

Po kliknutí na tlačidlo `0` sa číslo zmení na `0`.

### Vlastné tlačidlo

Momentálne naše tlačidlá dokážu zobrazovať iba text:

```swift
Button("+") {

}
```

Takto napísané tlačidlo vie zobrazovať iba textový obsah, napríklad `+` alebo `-`.

V skutočnom vývoji však často chceme, aby tlačidlo vyzeralo bohatšie, napríklad aby používalo ikonu alebo iné view.

SwiftUI umožňuje prispôsobiť zobrazený obsah tlačidla. V takom prípade môžeme použiť inú formu zápisu:

```swift
Button(action: {

}, label: {

})
```

V tomto zápise `action` predstavuje kód, ktorý sa vykoná po kliknutí na tlačidlo, a `label` je view, ktoré sa na tlačidle zobrazí.

Napríklad môžeme tlačidlu nastaviť ikonku zo SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Takto tlačidlo už nebude zobrazovať text, ale ikonu.

### Vylepšenie vzhľadu počítadla

Aby bolo rozhranie počítadla prehľadnejšie, môžeme upraviť štýl zobrazenia čísla. Napríklad zväčšiť písmo:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Ďalej môžeme zmeniť obsah tlačidiel na ikony a mierne zväčšiť ich veľkosť:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Rovnakým spôsobom môžeme zmeniť aj tlačidlo na zníženie a tlačidlo reset na ikonové:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Teraz budú tlačidlá zobrazovať ikony zo SF Symbols a rozhranie bude pôsobiť prehľadnejšie.

![Num](../../RESOURCE/009_num3.png)

## Zhrnutie

V tejto lekcii sme si pri vytváraní jednoduchého počítadla komplexne precvičili používanie premenných, `Text` a `Button`. Pomocou premennej sme ukladali číslo a tlačidlami sme riadili jeho zvyšovanie a znižovanie. Zároveň sme sa naučili zložené priraďovacie operátory, napríklad `num += 1` a `num -= 1`.

Počas implementácie sme pochopili, ako funguje SwiftUI: rozhranie je riadené dátami. Keď sa dáta zmenia, rozhranie sa obnoví. Preto musíme na ukladanie meniteľného stavu používať `@State`. Keď sa zmení premenná označená `@State`, SwiftUI automaticky aktualizuje view.

Nakoniec sme rozhranie mierne vylepšili, upravili sme štýl písma v `Text` a pomocou `Button(action:label:)` sme prispôsobili obsah tlačidiel, aby mohli zobrazovať ikony. Vďaka tomu je rozhranie počítadla prehľadnejšie a krajšie.

Teraz sme sa už dotkli základného spôsobu používania view v SwiftUI. Vo SwiftUI je väčšina rozhraní riadená premennými. Keď sa premenná zmení, SwiftUI automaticky aktualizuje view. Preto pri vývoji aplikácií v SwiftUI zvyčajne najprv navrhujeme dáta, ktoré je potrebné uložiť, a potom na ich základe vytvárame rozhranie a interakcie.

## Kompletný kód

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
