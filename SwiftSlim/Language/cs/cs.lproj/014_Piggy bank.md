# Pokladnička

V této lekci vytvoříme jednoduchý projekt „pokladnička“. Jeho funkce jsou jednoduché, ale obsahuje kompletní interakční logiku, takže se velmi dobře hodí pro začátečníky.

Pomocí tohoto projektu se naučíme pracovat s `TextField` (vstupní pole) a s rámečkem `border`, a zároveň pochopíme datové vazby (`$`).

Naším konečným cílem je vytvořit projekt „pokladnička“, do kterého lze zadat částku, po kliknutí na tlačítko ji uložit a zároveň přičítat k celkové sumě.

Výsledný efekt:

![Piggy Bank](../../RESOURCE/014_view.png)

## Zobrazení celkové částky

Nejprve potřebujeme ve view zobrazit celkovou částku „pokladničky“.

V `ContentView` deklarujeme proměnnou, která bude tuto celkovou částku ukládat.

```swift
@State private var amount = 0
```

Poté tuto částku zobrazíme pomocí `Text`:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Zde pomocí `.font` a `.fontWeight` nastavujeme velikost a tloušťku písma.

```swift
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

Když se `amount` změní, `Text` automaticky znovu zobrazí aktualizovanou celkovou částku.

## Zadání částky

„Pokladnička“ nemá jen zobrazovat celkovou částku, ale musí také umožnit uživateli zadat částku k uložení. K tomu potřebujeme ve SwiftUI ovládací prvek `TextField`.

### TextField

`TextField` je ve SwiftUI view určené pro zadávání obsahu, obvykle na jednom řádku.

`TextField` nabízí hlavně dva způsoby vazby:

**1. Vazba na řetězec (`String`)**

```swift
TextField("Placeholder", text: $text)
```

To se hodí pro jméno, nadpis a další textové vstupy.

**2. Vazba na číselný typ (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

To se hodí pro věk, mzdu, částku a další číselné údaje.

`format: .number` znamená, že toto pole bude vstup vyhodnocovat a zobrazovat jako číslo.

#### Zástupný text

První parametr `TextField` je zástupný text (`Placeholder`), který uživatele navádí, co má zadat:

```swift
TextField("input your name", text: $text)
```

Když je pole prázdné, zobrazí se šedý pomocný text.

![textfield](../../RESOURCE/014_textfield.png)

#### Datová vazba

`TextField` sám neuchovává zadaný obsah trvale; data je potřeba spravovat přes navázanou proměnnou.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Obsah, který uživatel zadá, se bude přímo ukládat do proměnné `text` a `TextField` se stará jen o vstupní rozhraní.

`$` označuje vazbu (`Binding`):

```swift
$text
```

Nejde o běžnou proměnnou, ale o typ `Binding`.

Jeho úkolem je propojit view s daty:

Když uživatel zadává text do `TextField`, `text` se automaticky aktualizuje; a když se změní `text`, současně se aktualizuje i `TextField`.

Například:

```swift
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

Když do `TextField` něco zadáme, horní `Text` to bude v reálném čase synchronně zobrazovat.

![textField](../../RESOURCE/014_textfield1.png)

### Vazba na číselný typ

Pokud potřebujeme zadávat čísla, musíme navázat proměnnou odpovídajícího typu:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Když uživatel zadá částku, `TextField` vstup analyzuje jako číslo a automaticky aktualizuje hodnotu `number`.

## Přidání vstupního pole

Když už rozumíme základnímu použití `TextField`, použijeme ho v projektu „pokladnička“.

„Pokladnička“ potřebuje zadávat „částku“, takže použijeme způsob „vazba na číselný typ (`Int/Double`)“ a přidáme novou proměnnou `number`, která bude uchovávat částku zadanou uživatelem:

```swift
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

Nyní `TextField` ve výchozím stavu zobrazuje hodnotu `number` (výchozí je `0`).

Když vstup smažeme, zobrazí se zástupný text `Amount`.

To znovu ukazuje, že `TextField` zobrazuje hodnotu navázané proměnné, nikoli že si obsah ukládá sám.

### Problém s velikostí vstupního pole

V aktuálním view si všimneme, že `TextField` nemá rámeček, zobrazuje jen `0` a obsah působí, jako by byl zarovnaný doleva.

Efekt vypadá takto:

![textfield](../../RESOURCE/014_textfield2.png)

Je to proto, že `TextField` standardně zabírá celou šířku rodičovského view.

To si můžeme ověřit přidáním barvy pozadí:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Efekt bude vypadat takto:

![textfield](../../RESOURCE/014_textfield3.png)

Je vidět, že `TextField` ve skutečnosti vyplní celý řádek.

### Nastavení pevné šířky

Pokud chceme, aby vstupní pole bylo kompaktnější, můžeme jeho šířku omezit pomocí `frame`:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

Efekt vypadá takto:

![textfield](../../RESOURCE/014_textfield4.png)

### Přidání rámečku a vnitřního odsazení

Protože `TextField` standardně žádný rámeček nemá, můžeme mu styl přidat ručně:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Teď toto vstupní pole vypadá více jako „standardní vstupní pole“.

![textfield](../../RESOURCE/014_textfield5.png)

## Rámeček

Ve SwiftUI se `border` používá pro přidání rámečku kolem view.

Základní použití:

```swift
border(Color.black, width: 1)
```

Zde `Color.black` určuje barvu rámečku a `width` jeho tloušťku.

V `TextField` použijeme:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

To znamená, že kolem vstupního pole přidáme černý rámeček o šířce `1 pt`.

Můžete také zkusit jiné barvy, například `Color.blue`, `Color.green`, nebo rámeček zesílit pomocí `width: 2`.

## Tlačítko pro ukládání peněz

Teď už máme proměnnou `amount` pro zobrazení celkové částky, `TextField` pro zadání částky a proměnnou `number`, která je s polem svázána.

Aktuální kód vypadá takto:

```swift
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

### Přidání tlačítka

Nyní potřebujeme přidat tlačítko, které spustí operaci „uložení peněz“.

```swift
Button("Save") {
    
}
```

### Implementace logiky ukládání

Chceme, aby uživatel zadal částku, kliknul na tlačítko a tato částka se automaticky přičetla k celkové sumě.

```swift
Button("Save") {
    amount += number
}
```

Zde používáme „složený přiřazovací operátor“, kterým přičteme uživatelem zadanou částku `number` k celkové částce `amount`.

### Reset vstupní částky

Teď se objevuje jeden problém: po kliknutí na tlačítko se hodnota ve vstupním poli nevymaže.

Když uživatel zadá `10` a klikne na uložit, ve vstupním poli zůstane stále `10`, což ovlivní další zadávání.

Je to proto, že `TextField` je navázán na `number`. Po kliknutí na tlačítko měníme jen `amount`, ale `number` se nemění, takže vstupní pole stále ukazuje starou hodnotu.

Proto potřebujeme přidat logiku pro vyčištění. Po kliknutí na tlačítko nejprve přičteme částku do pokladničky a pak zadanou hodnotu resetujeme:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

Nyní po zadání částky a kliknutí na tlačítko bude částka připočtena k celkové hodnotě a `number` se vrátí na `0`, aby uživatel mohl zadat další částku.

Tím jsme dokončili veškerou logiku „pokladničky“ pro ukládání peněz.

## Vylepšení view

Jakmile je funkce hotová, můžeme rozhraní jednoduše vylepšit přidáním obrázku na pozadí a stylu tlačítka.

Přidání stylu tlačítka:

```swift
.buttonStyle(.borderedProminent)
```

Přidání obrázku na pozadí:

```swift
.background {
    Image("1")
}
```

Tím jsme dokončili celý vývoj „pokladničky“.

## Kompletní kód

```swift
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

Teď si můžeme zkusit uložit `100` nebo i více peněz a ověřit, zda logika „pokladničky“ funguje správně.

Nebo můžeme „pokladničku“ spustit v simulátoru či na fyzickém zařízení a námi vytvořenou aplikaci si vyzkoušet.

### Ladicí výstup

Abychom si ověřili, že logika funguje správně, můžeme do tlačítka přidat i ladicí výstup a zkontrolovat, zda je zadaná částka zpracována správně:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Při každém uložení částky a kliknutí na tlačítko uvidíme odpovídající ladicí výstup, díky kterému lze zkontrolovat, zda v logice kódu není problém.

```
---Saving---
amount:11
number:0
```
