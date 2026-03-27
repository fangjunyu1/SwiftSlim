# Rozpohybujme tlačítko

Tato lekce se zaměřuje především na tlačítko `Button`, debugovací výstup pomocí `print` a na funkce ve Swiftu.

Tento obsah tvoří základ interaktivního programování ve SwiftUI.

## Tlačítko

Tlačítko je jedním z nejběžnějších UI prvků. Když potřebujeme něco stáhnout, otevřít nebo ukončit, obvykle klikáme právě na tlačítko.

Například v App Store klepnutím na tlačítko „Získat“ stáhneme aplikaci.

![Button](../../RESOURCE/008_button.png)

Ve SwiftUI se tlačítko zapisuje jako `Button`.

Základní použití:

```swift
Button("") {
    
}
```

Strukturu lze rozdělit na dvě části:

```swift
Button("Text tlačítka") {
    Kód, který se vykoná po kliknutí na tlačítko
}
```

Například:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Po spuštění se zobrazí tlačítko `Start`.

![Button](../../RESOURCE/008_button1.png)

Když uživatel klikne na tlačítko, vykoná se kód uvnitř `{}`.

Je důležité si uvědomit, že `Button` patří mezi prvky uživatelského rozhraní SwiftUI (`View`), a proto musí být napsán uvnitř `body`.

### Modifikátor buttonStyle

Ve SwiftUI poskytuje `Button` vestavěné systémové styly tlačítek, které lze použít pomocí modifikátoru `buttonStyle`.

Například:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` použije styl tlačítka poskytovaný systémem.

Mezi běžné možnosti patří:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Rozdíly mezi těmito styly se projevují hlavně v tom, zda má tlačítko rámeček, pozadí a jak silné je jeho vizuální zvýraznění.

## Výstup pomocí print

V programování často potřebujeme ověřit, zda program skutečně doběhl do určité části kódu.

Swift poskytuje funkci `print`, která slouží k výpisu debugovacích informací.

Základní zápis:

```swift
print("Hello")
```

Tento řádek vypíše text do `Console` (konzole).

### Otestování funkčnosti tlačítka

`print` můžeme zapsat do tlačítka a otestovat tak, zda bylo tlačítko opravdu stisknuto.

```swift
Button("Start") {
    print("Test 123")
}
```

Po kliknutí na tlačítko se v `Console` vypíše:

```
Test 123
```

To znamená, že spuštění tlačítka proběhlo úspěšně.

![Button](../../RESOURCE/008_button3.png)

Poznámka: `print` je Swift kód, nikoli prvek rozhraní. Nelze jej přímo vložit do `body`, jinak dojde k chybě.

Například tento zápis je chybný:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Chyba: body musí vracet View
    }
}
```

Ve SwiftUI `body` slouží k popisu struktury rozhraní a mohou v něm být jen prvky rozhraní (`View`), jako `Text`, `Button`, `Image` a podobně.

Běžný kód, jako výpočty nebo `print`, musí být umístěn do tlačítka, funkce nebo jiného obslužného bloku událostí.

### Konzole Console

Obsah vypsaný pomocí `print` se zobrazí v konzoli `Console` v Xcode.

Pokud konzoli nevidíte, můžete kliknout na tlačítko `Show the Debug Area` vpravo dole a otevřít oblast ladění, a pak kliknout na `Show the Console`, aby se konzole zobrazila.

![](../../RESOURCE/008_button4.png)

V levém dolním rohu `Console` jsou dvě záložky: `Executable` a `Previews`.

![](../../RESOURCE/008_button5.png)

Tyto dvě záložky odpovídají různým běhovým prostředím: když používáte náhled v Canvas, výstup z `print` se zobrazí pod záložkou `Previews`; pokud aplikace běží v simulátoru nebo na fyzickém zařízení, zobrazí se pod záložkou `Executable`.

Proto pokud nevidíte žádný výstup z `print`, nejprve zkontrolujte, zda máte vybranou správnou záložku.

## Příklad - ASCII obrázek

V některých programátorských projektech často narazíte na ASCII obrázky.

ASCII obrázek je obrazec složený z běžných znaků, například:

![ASCII](../../RESOURCE/008_ascii.png)

Můžeme použít kombinaci tlačítka a `print` a vypsat ASCII obrázek.

Ukázkový kód:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Po kliknutí na tlačítko se v `Console` vypíše:

```
 /\_/\
( o.o )
 > ^ <
```

Poznámka: znak `\` se v řetězci musí psát jako `\\`, protože zpětné lomítko je v řetězcích escape znak.

## Funkce

Uvnitř tlačítka můžeme psát kód přímo.

Například:

```swift
Button("Start") {
    print("Hello")
}
```

Pokud je kódu jen málo, je to v pořádku. V reálném vývoji ale může logika vyvolaná jedním tlačítkem obsahovat hodně kroků.

Například:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Může zde být ještě hodně dalšího kódu
}
```

Pokud je kódu stále více, přímý zápis do tlačítka způsobí, že bude kód rozhraní nepřehledný a hůře čitelný i udržovatelný.

Proto takový kód obvykle přesuneme do funkce a v tlačítku pak jen tuto funkci zavoláme.

### Co je funkce

Funkce je kus kódu, který lze opakovaně používat.

Když potřebujeme určitý kód vykonat, stačí zavolat příslušnou funkci a spustí se kód uvnitř ní.

To pomáhá udržet kód přehlednější a zároveň umožňuje jeho opakované použití.

### Základní zápis

Ve Swiftu se funkce definují pomocí klíčového slova `func`:

```swift
func randomInt() {
    // code
}
```

Tento kód definuje funkci.

`randomInt` je název funkce a slouží k označení tohoto kusu kódu.

`()` označují místo pro parametry, kam lze přijímat data zvenčí. Pokud žádná data nepotřebujeme, mohou zůstat prázdné.

Uvnitř `{}` je oblast kódu funkce a vše, co se má vykonat, se zapisuje právě sem.

Například:

```swift
func getName() {
    print("FangJunyu")
}
```

Úkolem této funkce je vypsat text.

### Volání funkce

Definice funkce jen vytvoří příslušný kus kódu. Pokud ji ale chceme skutečně spustit, musíme ji zavolat.

Zavolání se provede přidáním `()` za název funkce:

```swift
getName()
```

Když program dojde na tento řádek, vykoná se kód uvnitř funkce `getName`.

Kompletní příklad:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Po spuštění se v `Console` vypíše:

```
FangJunyu
```

### Použití funkcí ve SwiftUI

Ve SwiftUI se funkce obvykle zapisují mimo `body`.

Například:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Po kliknutí na tlačítko se zavolá funkce `getName()`.

Díky tomu zůstane kód rozhraní stručný a konkrétní logika se řeší uvnitř funkce.

### Parametry funkcí

Někdy funkce potřebuje podle různých dat provádět různé operace.

Například chceme, aby funkce uměla vypsat různá jména, ne jen pevně zadané `"FangJunyu"`.

V takové situaci lze použít parametry, které si můžeme představit jako data předaná při volání funkce.

Například:

```swift
func getName(name: String) {
    print(name)
}
```

Tato funkce má nový parametr, kde `name` je název parametru a `String` je jeho typ.

To znamená, že funkce potřebuje přijmout data typu `String`.

Protože funkce teď data potřebuje, musíme je při volání dodat.

```swift
getName(name: "Sam")
```

Když při volání předáme `"Sam"`, funkce tuto hodnotu použije pro výstup.

Výsledek běhu:

```
Sam
```

## Příklad - použití funkce pro výpis ASCII obrázku

V předchozím příkladu jsme `print` psali přímo do tlačítka.

Pokud je ale znakový obrázek složitější, kód se rychle prodlužuje. V takové chvíli lze logiku přesunout do funkce a kód rozhraní bude přehlednější.

Ukázkový kód:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Po spuštění a kliknutí na tlačítko se v `Console` vypíše:

```
 /\_/\
( o.o )
 > ^ <
```

Tady se po kliknutí uživatele na tlačítko stanou dvě věci:

1. tlačítko zavolá funkci `printCat()`
2. vykoná se kód `print` uvnitř funkce

Takto může kód rozhraní zůstat zodpovědný jen za spuštění události, zatímco konkrétní logika je řešena uvnitř funkce.

V reálném vývoji je většina operací tlačítek implementována právě prostřednictvím funkcí.

## Shrnutí

V této lekci jsme se naučili tři důležité věci:

**1. Tlačítko Button**

`Button` je ve SwiftUI ovládací prvek určený ke spouštění akcí.

```swift
Button("Start") {

}
```

Když uživatel klikne na tlačítko, vykoná se kód uvnitř složených závorek.

**2. Výstup pomocí print**

`print` slouží k výpisu ladicích informací do `Console`.

```swift
print("Hello")
```

Vývojář může prostřednictvím `Console` sledovat stav běhu programu.

**3. Funkce**

Funkce je kus kódu, který lze opakovaně používat.

```swift
func sayHello() {
    print("Hello")
}
```

Volání funkce:

```swift
sayHello()
```

Pokud funkce potřebuje data, může používat parametry:

```swift
func sayHello(name: String) {
    print(name)
}
```

V dalších lekcích se budeme učit další ovládací prvky SwiftUI a také to, jak data komunikují s rozhraním.

## Cvičení

Zkuste splnit následující cvičení:

1. Vytvořte tlačítko s textem `"Hello"`
2. Po kliknutí na tlačítko vypište do `Console` text `Hello Swift`
3. Přesuňte výpis do funkce a poté tuto funkci zavolejte v tlačítku
