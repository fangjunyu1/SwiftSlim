# Pokladnička

V tejto lekcii vytvoríme jednoduchý projekt „pokladnička“. Funkčne je veľmi jednoduchý, ale obsahuje kompletnú interakčnú logiku, takže je veľmi vhodný pre začiatočníkov.

Pomocou tohto projektu sa naučíme `TextField` (vstupné pole), `border` (okraj) a pochopíme dátové prepojenie (`$`).

Naším konečným cieľom je vytvoriť projekt „pokladnička“, do ktorého možno zadať sumu, kliknúť na tlačidlo uloženia a priebežne sčítavať celkovú sumu.

Výsledný efekt:

![Piggy Bank](../../RESOURCE/014_view.png)

## Zobrazenie celkovej sumy

Najprv potrebujeme vo view zobraziť celkovú sumu v „pokladničke“.

V `ContentView` deklarujeme premennú na uloženie celkovej sumy v „pokladničke“.

```swift id="suv4nx"
@State private var amount = 0
```

Potom použijeme `Text` na zobrazenie tejto sumy:

```swift id="r8ljc9"
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Tu používame `.font` a `.fontWeight` na nastavenie veľkosti a hrúbky písma.

```swift id="djlwm9"
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Keď sa `amount` zmení, `Text` automaticky obnoví aj zobrazenú celkovú sumu.

## Zadanie sumy

„Pokladnička“ nemá iba zobrazovať celkovú sumu, ale musí používateľovi umožniť aj „zadať“ ukladanú sumu. Na to potrebujeme použiť `TextField`, vstupný prvok SwiftUI.

### TextField

`TextField` je v SwiftUI vstupný prvok určený na zadávanie obsahu, spravidla pre jednoradový vstup.

`TextField` ponúka najmä dva typy väzby:

**1. Väzba na reťazec (`String`)**

```swift id="lklsfi"
TextField("Placeholder", text: $text)
```

Hodí sa na vstup textu, napríklad mena alebo titulku.

**2. Väzba na číselný typ (`Int/Double`)**

```swift id="2nbrhc"
TextField("Amount", value: $number, format: .number)
```

Hodí sa na vek, mzdu, sumu a ďalšie číselné vstupy.

`format: .number` znamená, že toto vstupné pole bude obsah analyzovať a zobrazovať vo „formáte čísla“.

#### Zástupný text

Prvý parameter `TextField` je zástupný text (`Placeholder`), ktorý používateľa upozorňuje, čo má zadať:

```swift id="w3om8u"
TextField("input your name", text: $text)
```

Keď je vstupné pole prázdne, zobrazí sa sivý pomocný text.

![textfield](../../RESOURCE/014_textfield.png)

#### Dátová väzba

`TextField` sám o sebe vstupný obsah natrvalo neukladá, preto musíme dáta spravovať cez prepojenú premennú.

```swift id="hr1a2h"
@State private var text = ""
TextField("Placeholder", text: $text)
```

Obsah zadaný používateľom sa priamo uloží do premennej `text`, zatiaľ čo `TextField` sa stará iba o samotné vstupné rozhranie.

`$` znamená väzbu (`Binding`):

```swift id="v95b9v"
$text
```

Nie je to obyčajná premenná, ale typ `Binding`.

Jeho úlohou je vytvoriť spojenie medzi view a dátami:

Keď používateľ zadáva obsah do `TextField`, `text` sa automaticky aktualizuje; keď sa zmení `text`, `TextField` sa tiež synchronizovane aktualizuje.

Napríklad:

```swift id="nsly6o"
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Keď do `TextField` zadáte obsah, horný `Text` ho bude v reálnom čase synchronizovane zobrazovať.

![textField](../../RESOURCE/014_textfield1.png)

### Väzba na číselný typ

Ak potrebujeme zadávať číslo, musíme prepojiť premennú príslušného typu:

```swift id="r4l13c"
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Keď používateľ zadá sumu, `TextField` zadaný obsah spracuje a automaticky aktualizuje hodnotu `number`.

## Pridanie vstupného poľa

Keď už poznáme základné použitie `TextField`, môžeme ho použiť v projekte „pokladnička“.

„Pokladnička“ potrebuje zadávať „sumu“, preto použijeme spôsob „väzby na číselný typ (`Int/Double`)“ a pridáme novú premennú `number` na uloženie sumy zadanej používateľom:

```swift id="bh54dh"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Teraz `TextField` štandardne zobrazuje hodnotu `number` (predvolená hodnota je `0`).

Keď obsah vstupu vymažeme, zobrazí sa zástupný text „Amount“.

To zároveň znovu ukazuje, že `TextField` zobrazuje hodnotu prepojenej premennej, a nie že by si obsah ukladal sám.

### Problém s veľkosťou vstupného poľa

V aktuálnom view si všimneme, že `TextField` nemá okraj, zobrazuje iba `0` a obsah pôsobí ako zarovnaný doľava.

Efekt vyzerá takto:

![textfield](../../RESOURCE/014_textfield2.png)

Je to preto, že `TextField` štandardne zaberá celú šírku svojho rodičovského view.

Môžeme si to overiť pridaním farby pozadia:

```swift id="xk092d"
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Efekt vyzerá takto:

![textfield](../../RESOURCE/014_textfield3.png)

Vidíme, že `TextField` v skutočnosti vypĺňa celý riadok na šírku.

### Nastavenie pevnej šírky

Ak chceme, aby bolo vstupné pole kompaktnejšie, môžeme použiť `frame` na obmedzenie jeho šírky:

```swift id="wqtj05"
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Efekt vyzerá takto:

![textfield](../../RESOURCE/014_textfield4.png)

### Pridanie okraja a vnútorného odsadenia

Keďže `TextField` štandardne nemá okraj, môžeme mu štýl pridať ručne:

```swift id="1g9kr7"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Teraz toto vstupné pole vyzerá viac ako „štandardné vstupné pole“.

![textfield](../../RESOURCE/014_textfield5.png)

## Okraj

V SwiftUI sa `border` používa na pridanie okraja k view.

Základné použitie:

```swift id="8l7c3t"
border(Color.black, width: 1)
```

Tu `Color.black` označuje farbu okraja a `width` hrúbku okraja.

V `TextField` používame:

```swift id="x3rgg3"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

To znamená, že vstupnému poľu pridávame čierny okraj s hrúbkou `1 pt`.

Môžete skúsiť aj iné farby, napríklad `Color.blue`, `Color.green`, alebo hrubší okraj `width: 2`.

## Tlačidlo uloženia

Teraz už máme premennú `amount` na zobrazenie celkovej sumy, `TextField` na zadanie sumy a premennú `number`, ktorá je s poľom prepojená.

Aktuálny kód vyzerá takto:

```swift id="2q9o6n"
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
		}
    }
}
```

### Pridanie tlačidla

Teraz potrebujeme pridať tlačidlo, ktoré spustí operáciu uloženia peňazí.

```swift id="mgdqlk"
Button("Save") {
    
}
```

### Implementácia logiky ukladania peňazí

Chceme dosiahnuť to, že používateľ zadá sumu, klikne na tlačidlo a suma sa automaticky pripočíta k celkovej sume.

```swift id="wqq1f1"
Button("Save") {
    amount += number
}
```

Tu používame „zložený operátor priradenia“, ktorým pripočítame používateľom zadanú sumu `number` ku celkovej sume `amount`.

### Resetovanie zadanej sumy

Teraz vzniká jeden problém: po každom kliknutí na tlačidlo sa suma vo vstupnom poli nevymaže.

Keď používateľ zadá `10`, klikne na uloženie a vo vstupnom poli stále zostane `10`, čo ovplyvní ďalšie zadanie sumy.

Je to preto, že `TextField` je naviazaný na `number`. Po kliknutí na tlačidlo sa zmení iba `amount`, ale `number` sa nezmení, takže vstupné pole stále zobrazuje starú hodnotu.

Preto musíme pridať logiku vymazania: po kliknutí na tlačidlo sa najprv suma pripočíta a potom sa zadaná hodnota resetuje:

```swift id="qmva5q"
Button("Save") {
    amount += number
	number = 0
}
```

Teraz, keď používateľ zadá sumu a klikne na tlačidlo, suma sa pripočíta k celkovej sume. `number` sa resetuje na `0`, aby používateľ mohol zadať ďalšiu sumu.

Tým sme dokončili celú logiku ukladania peňazí pre „pokladničku“.

## Vylepšenie view

Po dokončení funkcionality môžeme rozhranie ešte mierne vylepšiť pridaním obrázka na pozadí a štýlu tlačidla.

Pridanie štýlu tlačidla:

```swift id="72t3y6"
.buttonStyle(.borderedProminent)
```

Pridanie obrázka na pozadie:

```swift id="xa18oq"
.background {
    Image("1")
}
```

Teraz sme dokončili celý vývoj „pokladničky“.

## Kompletný kód

```swift id="nykxia"
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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Výsledný efekt:

![Piggy Bank](../../RESOURCE/014_view.png)

Teraz si môžeme skúsiť vložiť `100` alebo ešte viac peňazí, aby sme overili, či v logike „pokladničky“ nie je chyba.

Alebo môžeme „pokladničku“ spustiť v simulátore alebo na reálnom zariadení a vyskúšať si aplikáciu, ktorú sme vytvorili.

### Ladicí výstup

Aby sme overili správnosť logiky, môžeme do tlačidla pridať aj ladiaci výstup a skontrolovať, či je zadaná suma správna:

```swift id="o6csd8"
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Pri každom uložení peňazí a kliknutí na tlačidlo môžeme v konzole vidieť príslušný ladiaci výstup a overiť, či je logika kódu správna.

```id="v7l4h8"
---Saving---
amount:11
number:0
```
