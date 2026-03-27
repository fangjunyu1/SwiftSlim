# Proměnné a konstanty

V této lekci se budeme věnovat hlavně proměnným a konstantám ve Swiftu a seznámíme se také s běžně používanými datovými typy a základními operátory.

Tento obsah patří k naprostým základům programování a zároveň je důležitým základem pro další studium SwiftUI.

## Proměnné a konstanty v běžném životě

Proměnné a konstanty si můžeme vysvětlit pomocí věcí z každodenního života.

Proměnné v běžném životě:

- obsah každého televizního pořadu je jiný
- počasí se každý den mění
- hodiny se každou sekundu posouvají

Společným znakem těchto věcí je to, že se mění.

Kdyby televize stále zobrazovala jen jeden obraz, počasí bylo navždy slunečné a ručičky hodin se vůbec nehýbaly, pak by tyto věci byly konstanty.

Jedno se může měnit, druhé ne.

## Porozumění proměnným a konstantám

Při vývoji aplikací je často potřeba, aby uživatel vyplnil nebo uložil některé informace.

Například:

- název účtu
- datum narození
- kontaktní údaje
- adresa

Tyto informace se uloží a následně zobrazí.

Například když uživatel v aplikaci zadá jméno:

```
FangJunyu
```

musíme toto jméno uložit, aby se v aplikaci mohlo zobrazit.

Proces ukládání si můžeme jednoduše představit jako uložení věci do zásuvky.

Když uložíme jméno, je to, jako bychom ho vložili do zásuvky.

Věcí, které je třeba uložit, může být mnoho, a zásuvek může být také mnoho. Abychom věděli, co je v které zásuvce, musíme každou zásuvku pojmenovat.

Například:

```
name
```

V tomto příkladu je `name` název a `FangJunyu` uložená informace.

![Var](../../RESOURCE/007_var.png)

**Ve Swiftu, pokud chceme ukládat data, musíme je deklarovat pomocí proměnné (`var`) nebo konstanty (`let`).**

Protože jméno se obvykle může měnit, měli bychom použít proměnnou.

```swift
var name = "FangJunyu"
```

Tímto se deklaruje proměnná s názvem `name`, jejímž typem je `String` a hodnotou je `"FangJunyu"`.

### Rozdíl mezi proměnnou a konstantou

Proměnná se deklaruje pomocí `var`:

```swift
var
```

Konstanta se deklaruje pomocí `let`:

```swift
let
```

Například:

```swift
var name = "FangJunyu"
let id = 123456
```

Pokud je něco deklarováno jako proměnná, znamená to, že hodnotu lze změnit. Pokud je to deklarováno jako konstanta, hodnotu už změnit nelze.

Hlavní rozdíl mezi proměnnou a konstantou tedy spočívá v tom, zda je povoleno měnit hodnotu.

### Úprava konstanty

Pokud se kód pokusí změnit hodnotu konstanty:

```swift
let name = "Sam"
name = "Bob"
```

Swift oznámí, že přiřazení nelze dokončit, protože jde o konstantu.

```
Cannot assign to property: 'name' is a 'let' constant
```

Tento mechanismus pomáhá vývojářům zabránit tomu, aby se některá důležitá data omylem změnila.

### Zobrazení ve SwiftUI

Otevřete soubor `ContentView.swift` a deklarujte proměnnou uvnitř `View`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Zde je deklarována proměnná s názvem `name` a pomocí `Text` je zobrazena v rozhraní.

Pokud změníme obsah proměnné:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

změní se i text zobrazený v `Text`.

Tímto způsobem můžeme pomocí proměnných ovládat obsah zobrazovaný v rozhraní, aniž bychom museli pokaždé přímo upravovat text uvnitř `Text`.

Pokud je tato informace potřeba i jinde, můžeme proměnnou předat dál, což odpovídá tomu, jako bychom obsah ze "zásuvky" předali na jiné místo k použití.

### Umístění proměnných a konstant ve SwiftUI

Ve SwiftUI se proměnné a konstanty obvykle zapisují mimo `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Samozřejmě je můžeme zapsat i uvnitř `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Mezi těmito dvěma způsoby však existuje důležitý rozdíl:

- Pokud jsou proměnné a konstanty uvnitř `body`, při každém přepočtu zobrazení se vytvoří znovu
- Pokud jsou mimo `body`, existují jako vlastnosti struktury zobrazení a kód je přehlednější

Proto se v reálném vývoji proměnné a konstanty obvykle zapisují mimo `body`.

## Datové typy

Proměnné mohou ukládat mnoho různých druhů dat a těmto druhům se říká datové typy.

Například dříve jsme použili `Text` k zobrazení textu:

```swift
Text("Hello, World")
```

Zde `"Hello, World"` patří do typu řetězce (`String`).

Řetězec slouží k reprezentaci textového obsahu a ve Swiftu musí být uzavřen v dvojitých uvozovkách `""`.

Například:

```swift
var hello = "Hello, World"
```

Kromě řetězců existuje ve Swiftu mnoho dalších datových typů.

Na začátečnické úrovni jsou nejčastější tyto čtyři typy:

- `String`
- `Int`
- `Double`
- `Bool`

Tyto čtyři typy pokrývají většinu základního zpracování dat.

**String**

`String` znamená textový obsah, například:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Řetězce se obvykle používají pro uživatelská jména, titulky a textový obsah.

**Int**

`Int` znamená celé číslo, tedy číslo bez desetinné části.

Například:

```swift
var age = 26
var count = 100
```

Celá čísla se obvykle používají pro věk, množství nebo počítání.

**Double**

`Double` představuje číslo s desetinnou částí.

Například:

```swift
var weight = 74.5
var height = 185.0
```

Ve Swiftu se desetinná čísla ve výchozím nastavení obvykle používají jako typ `Double`.

Existuje také podobný typ `Float`, ale ten umí reprezentovat menší rozsah čísel, proto se v reálném vývoji častěji používá `Double`.

**Bool**

Typ `Bool` slouží k vyjádření dvou stavů: `true` a `false`.

Například:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` se často používá v podmínkách, například pro určení, zda se má zobrazit upozornění.

Pro situace, které mají jen dva možné výsledky, je `Bool` velmi vhodný.

### Zobrazení ve SwiftUI

Když zobrazujeme hodnotu typu `String`, můžeme použít `Text` přímo:

```swift
Text(name)
```

Typy jako `Int` nebo `Double` však nejsou řetězce, a proto je nelze přímo použít jako součást textového obsahu.

Pokud potřebujeme tato data zobrazit v `Text`, můžeme použít interpolaci řetězců (`String Interpolation`):

```swift
\()
```

Interpolace řetězce musí být zapsána uvnitř řetězce a proměnná nebo konstanta se vloží pomocí `\()`.

Například:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

V uvedeném kódu znamenají `""` řetězec a `\()` slouží k vložení proměnné nebo konstanty do řetězce.

Například:

```swift
"DoubleNum: \(num * 2)"
```

Zobrazovaný obsah bude:

```swift
DoubleNum: 2
```

Tímto způsobem můžeme do řetězce vložit proměnnou nebo konstantu a následně je pomocí `Text` zobrazit v rozhraní.

Tip: `\()` lze použít pouze uvnitř řetězce `""`.

## Operátory

Při deklaraci proměnné nebo konstanty často vidíme tento zápis:

```swift
var num = 1
```

Zde se `=` nazývá operátor přiřazení.

Jeho úkolem je přiřadit hodnotu z pravé strany proměnné na levé straně.

V tomto příkladu je hodnota `1` přiřazena proměnné `num`.

Kromě operátoru přiřazení existují i některé běžné číselné operátory:

- `+`
- `-`
- `*`
- `/`

Když provádíme výpočty s čísly, například s daty typu `Int` nebo `Double`, budeme tyto operátory používat.

Například:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Po dokončení výpočtu se výsledek uloží do proměnné.

## Shrnutí

Proměnné, konstanty a operátory patří mezi nejzákladnější pojmy v programování.

Pomocí proměnných a konstant můžeme v programu uchovávat různé druhy dat; pomocí datových typů můžeme jasně určit, o jaký druh dat jde; a pomocí operátorů můžeme s daty počítat a zpracovávat je.

Tyto znalosti jsou jako základní nástroje ve světě programování. Jejich zvládnutí položí pevný základ pro další studium Swiftu a SwiftUI.
