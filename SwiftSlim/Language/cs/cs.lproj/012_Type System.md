# Typový systém

V předchozích lekcích jsme se už naučili pracovat s proměnnými a víme, že proměnné mohou ukládat data různých typů.

Například:

```swift
var hello = "Hello, World"
```

Proměnná `hello` zde ukládá text, takže její typ je `String`.

Dále se systematicky naučíme pojem typ (`Type`), stejně jako explicitní deklaraci typu a odvozování typu, abychom lépe pochopili podstatu proměnných.

## Co je typ

Ve Swiftu má každá hodnota jednoznačný typ. Typ určuje, co tato hodnota je a co s ní lze dělat.

Například:

- `42` je `Int` (celé číslo)
- `"Hello"` je `String` (řetězec)
- `true` je `Bool` (booleovská hodnota)

Patří do různých typů a mají také odlišné použití.

## Běžné základní typy ve Swiftu

Na začátku se nejčastěji setkáme s těmito typy:

- `String`: řetězec (text)
- `Int`: celé číslo
- `Double`: číslo s desetinnou čárkou (vyšší přesnost)
- `Bool`: booleovská hodnota (`true`/`false`)

Kromě toho existuje také `Float` (desetinné číslo), ale ten má nižší přesnost než `Double`, proto se používá méně často; a `Character` (jeden znak), například `"A"`, `"!"` a podobně.

### Deklarace typu (explicitní typ)

Ve Swiftu lze při deklaraci proměnné ručně určit její typ:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Za název proměnné přidáme `: Typ`, čímž deklarujeme její typ.

Typ pole se zapisuje jako `: [Typ]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

V tomto úseku kódu může pole `scores` ukládat jen prvky typu `Int` a `tags` jen prvky typu `String`.

Explicitní deklarace typu činí záměr kódu jasnějším a v některých případech pomáhá předejít chybám při odvozování typu.

## Odvozování typu

V mnoha případech není potřeba typ explicitně deklarovat:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"     // String
var isLogin = false  // Bool
var scores = [90, 85, 78]    // [Int]
var tags = ["Swift", "iOS"]  // [String]
```

Je to proto, že překladač Swiftu dokáže automaticky odvodit typ podle „počáteční hodnoty“.

## Explicitní deklarace a odvozování typu

V předchozích lekcích jsme nezaváděli explicitní deklaraci, například:

```swift
var age: Int = 18
```

Místo toho jsme dávali přednost odvozování typu:

```swift
var age = 18
```

V tomto příkladu jsou oba zápisy rovnocenné a `age` bude v obou případech určeno jako typ `Int`. Ve srovnání s tím je odvozování typu stručnější.

Důvod, proč jsme na začátku explicitní deklaraci nezdůrazňovali, je ten, že odvozování typu snižuje množství dodatečných informací v kódu a tím i náročnost pochopení pro začátečníky.

## Proč jsou typy potřeba

Swift je silně typovaný jazyk (`Strongly Typed Language`).

To znamená: jakmile je typ proměnné určen, nelze jej libovolně měnit.

Například:

```swift
var age: Int = 18

age = 20      // Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

První `20` je typu `Int`, takže ji lze přiřadit do `age`; druhé `"20"` je `String`, a protože se neshoduje s typem `Int`, dojde k chybě.

`nums` je pole typu `[Int]`, takže může ukládat jen celá čísla a nelze do něj přimíchat řetězec.

Typy omezují způsob použití dat a umožňují odhalit neodpovídající typy už při překladu, čímž snižují množství chyb způsobených typovým chaosem a zvyšují stabilitu i udržovatelnost kódu.

## Kdy je nutné explicitně deklarovat typ

Přestože Swift umí typ odvodit automaticky, v některých situacích to překladač nedokáže nebo by jej odvodil chybně. V takových případech je potřeba typ deklarovat ručně.

**1. Prázdné pole**

Při vytváření prázdného pole je nutné typ deklarovat explicitně:

```swift
var nums: [Int] = []
```

Pokud typ neuvedeme:

```swift
var nums = []   // Error, Empty collection literal requires an explicit type
```

Překladač z prázdného pole nedokáže poznat, jaký typ prvků má pole obsahovat, a proto vznikne chyba překladu.

**2. Zabránění chybnému odvození**

```swift
var value = 10   // Int
```

V tomto příkladu může `10` sice také představovat desetinné číslo (`Double`), ale protože neobsahuje desetinnou část, překladač ji standardně odvodí jako `Int`.

Pokud chceme, aby `value` bylo desetinné číslo, musíme typ uvést explicitně:

```swift
var value: Double = 10   // Double
```

Když výsledek odvozování typu neodpovídá našemu očekávání, měli bychom pomocí explicitní deklarace typu nebo úpravou literálu zajistit správný typ.

**3. Vlastní typy**

Později se budeme učit i vlastní typy a při jejich použití je často také nutné typ deklarovat explicitně:

```swift
var info: GameInfo
var users: [User] = []
```

Důvod je stejný jako u prázdného pole: překladač nedokáže z prázdné hodnoty typ automaticky odvodit.

## Převod typů

Ve Swiftu nedochází mezi různými typy k automatickému převodu; převod musíme provést ručně.

Například při sčítání dvou čísel různých typů:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b   // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

V tomto úseku kódu je `a` typu `Int` a `b` typu `Double`. Protože jde o různé typy, nelze s nimi přímo počítat.

Před výpočtem je potřeba nejprve převést jednu z hodnot na stejný typ:

```swift
var result = Double(a) + b
```

Tento kód znamená, že proměnná `a` typu `Int` bude převedena na `Double`, teprve potom bude sečtena s `b` a výsledek se uloží do `result`.

Je důležité si uvědomit, že převod typu nezmění typ původní proměnné. Například `Double(a)` nezmění `a` z `Int` na `Double`, ale vytvoří novou hodnotu typu `Double`, která se použije ve výpočtu.

I jiné typy lze převádět podobným způsobem, tedy pomocí zápisu `CílovýTyp()`, do kterého předáme hodnotu, kterou chceme převést. Například:

```
Int()、Double()、String()
```

Příklad:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Je potřeba si uvědomit, že ne všechny převody jsou bezezbytku přesné. Například při převodu `Double → Int` se desetinná část jednoduše odřízne, bez zaokrouhlení.

## Typové aliasy

Ve Swiftu lze existujícímu typu přiřadit také alias, díky kterému bude význam kódu jasnější:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

`UserID` je zde ve své podstatě stále `Int`; typ se nemění, jen získává smysluplnější název.

V projektech s větším množstvím kódu a složitějšími typy mohou typové aliasy výrazně zlepšit čitelnost.

## Příklad práce s typy

Níže si na jednoduchém příkladu ukážeme, jak typy fungují v praxi.

### Vytvoření proměnné

Nejprve vytvoříme proměnnou `age`:

```swift
var age = 20
```

Protože tuto proměnnou potřebujeme ve SwiftUI zobrazit a měnit, použijeme pro její deklaraci `@State`:

```swift
@State private var age = 20
```

`private` jsme už zmínili dříve; znamená to, že tuto proměnnou lze používat jen v aktuálním view. Později se tomu budeme věnovat podrobněji.

### Zobrazení dat ve SwiftUI

Zobrazení proměnné `age` ve SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

View nyní zobrazí:

```swift
age: 20
```

### Úprava dat

Dále přidáme dvě tlačítka pro změnu hodnoty `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Výsledek spuštění

Když klikneme na `changeAge1`, proměnné `age` se přiřadí hodnota `18`:

```swift
age = 18
```

Protože `18` je typ `Int` a odpovídá typu `age`, přiřazení proběhne úspěšně.

U `changeAge2` se objeví chyba:

```swift
age = "18"
```

Chybová zpráva:

```
Cannot assign value of type 'String' to type 'Int'
```

Je to proto, že `"18"` je typ `String` (řetězec je potřeba uzavřít do `""`), zatímco `age` je `Int`, takže typy se neshodují a přiřazení není možné.

### Proč dojde k chybě?

Klíčový je tento řádek:

```swift
@State private var age = 20   // Int
```

I když zde typ není deklarován explicitně, protože počáteční hodnota `20` je typu `Int`, překladač automaticky odvodí, že `age` je `Int`.

Jakmile je typ určen, nelze proměnné přiřadit hodnotu jiného typu.

Navíc tlačítko `changeAge2` neselže až „za běhu“, ale už ve fázi překladu a kód vůbec nepůjde zkompilovat.

To je jedna z výhod silného typování ve Swiftu: problémy s typy je možné odhalit už při psaní kódu.

### Správný zápis

Po odstranění chybného kódu:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Po kliknutí na tlačítko `changeAge1` se view aktualizuje na:

```
age: 18
```

### Explicitní deklarace typu (volitelné)

Při definici lze typ uvést i přímo:

```swift
@State private var age: Int = 20
```

Takový zápis dělá typ ještě čitelnějším, ale v jednoduchých situacích není nezbytný.

## Shrnutí

Tato lekce se věnovala hlavně typovému systému Swiftu a jeho roli v reálném vývoji.

Ve Swiftu má každá hodnota jasně daný typ. Typ určuje význam dat i operace, kterých se mohou účastnit.

Swift je silně typovaný jazyk, takže jakmile je typ proměnné určen, nelze jí už přiřadit hodnotu jiného typu. Toto omezení pomáhá odhalovat chyby už při překladu, čímž se snižuje počet problémů za běhu a zvyšuje bezpečnost kódu.

Typ proměnné lze odvodit z počáteční hodnoty nebo deklarovat explicitně. V některých situacích, například u prázdných polí, při chybném odvození typu nebo u vlastních typů, překladač typ správně určit nedokáže a explicitní deklarace je nutná.

Mezi různými typy nedochází k automatickému převodu, proto musíme používat explicitní převod přes `Int()`、`Double()`、`String()` a podobně.

Typy také podporují aliasy. Zejména v komplexnějších projektech mohou typové aliasy zlepšit čitelnost kódu.

Typ není jen značka dat, ale i forma omezení, která zajišťuje, že práce s daty bude bezpečná, jednoznačná a pod kontrolou.

## Rozšíření znalostí - Optional

Při převodu typů mohou některé operace selhat.

Například převod `String` na `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Zde `Double(input)` nevrací `Double`, ale:

```
Double?
```

To je volitelný typ (`Optional`).

### Proč se vrací volitelný typ?

Protože obsah řetězce není jistý: `"3.14"` lze převést na `Double`, ale `"Hello"` převést na `Double` nelze.

Jinými slovy, tato operace může uspět, ale také nemusí.

Proto Swift používá volitelný typ k vyjádření této nejistoty.

### Co je volitelný typ?

Volitelný typ znamená: hodnota může existovat, ale také nemusí.

Například:

```
Double?
```

Tento typ znamená, že pokud hodnota existuje, při výpisu se zobrazí `Optional(...)`; pokud neexistuje, vrátí se `nil`.

Je důležité si uvědomit, že `nil` znamená „žádná hodnota“, nikoli `0` nebo prázdný řetězec.

### Příklad

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Výstup:

```
pi:Optional(3.14)
```

To znamená, že řetězec byl úspěšně převeden na `Double` a výsledkem je `3.14`, ale protože je typ `Double?`, je zabalen uvnitř `Optional`.

Pokud převod selže:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Výstup:

```
pi: nil
```

Protože `"Hello"` nelze převést na `Double`, převod selže a vrátí `nil`.

### Co je `Optional(...)`?

Když přímo vypíšeme volitelný typ:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift zobrazí jeho „ladicí popis“:

```
Optional(3.14)
```

To není součást skutečných dat, ale upozornění, že aktuální hodnota je „volitelný typ“ a uvnitř obsahuje konkrétní hodnotu.

### Rozbalení volitelného typu

V reálném vývoji obvykle potřebujeme z volitelného typu získat skutečnou hodnotu. Tento proces se nazývá rozbalení (`Unwrapping`).

Jedním z běžných způsobů je použít `??` a poskytnout výchozí hodnotu:

```
??
```

Tomu se říká operátor slučování s `nil` (`Nil-Coalescing Operator`).

Například:

```swift
name ?? "FangJunyu"
```

Tento zápis znamená: pokud má `name` hodnotu, vrať ji; pokud je `nil`, použij výchozí hodnotu `"FangJunyu"`.

Je třeba si dát pozor, že výchozí hodnota musí mít stejný typ jako volitelný typ.

### Použití `??` pro výchozí hodnotu

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")   // 30
```

Výstup:

```
pi: 30
```

Když se `input` převede na `Double` úspěšně, vypíše se získaná hodnota. Pokud převod selže, vypíše se výchozí hodnota dodaná přes `??`.

Pokud převod selže:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Výstup:

```
pi: 10
```

V tomto případě převod `input` na `Double` selže a vrátí `nil`, takže `??` poskytne výchozí hodnotu.

Volitelný typ se používá k vyjádření situace, kdy „hodnota může existovat, ale nemusí“.

Ve Swiftu vracejí operace, které mohou selhat, například převody typů, volitelný typ proto, aby byl program bezpečnější.

Když pak potřebujeme s touto hodnotou pracovat, můžeme přes `??` dodat výchozí hodnotu a získat tak smysluplný výsledek i v případě, že se objeví `nil`.
