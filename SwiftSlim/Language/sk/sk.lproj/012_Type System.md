# Typový systém

V predchádzajúcich lekciách sme sa už naučili pracovať s premennými a vieme, že premenné môžu uchovávať dáta rôznych typov.

Napríklad:

```swift id="8f78z3"
var hello = "Hello, World"
````

Tu `hello` uchováva text, preto je jeho typ `String`.

Ďalej sa budeme systematicky venovať pojmu typ (`Type`), explicitnej deklarácii typu a typovej inferencii, aby sme hlbšie pochopili podstatu premenných.

## Čo je typ

V jazyku Swift má každá hodnota jasne určený typ. Typ rozhoduje o tom, čo táto hodnota je a čo s ňou možno robiť.

Napríklad:

* `42` je `Int` (celé číslo)
* `"Hello"` je `String` (reťazec)
* `true` je `Bool` (logická hodnota)

Patria do rôznych typov a používajú sa na rôzne účely.

## Bežné základné typy v Swifte

V začiatočníckej fáze sa najčastejšie stretávame s týmito typmi:

* `String`: reťazec (text)
* `Int`: celé číslo
* `Double`: desatinné číslo (s vyššou presnosťou)
* `Bool`: logická hodnota (`true/false`)

Okrem toho existuje aj `Float` (desatinné číslo), ale jeho presnosť je nižšia než pri `Double`, preto sa zvyčajne používa menej. Ďalej existuje `Character` (jeden znak), napríklad `"A"`, `"!"` a podobne.

### Deklarácia typu (explicitný typ)

V jazyku Swift môžeme pri deklarácii premennej typ určiť ručne:

```swift id="17v1zv"
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Typ premennej deklarujeme tak, že za názov premennej pridáme `: Typ`.

Typ poľa sa zapisuje ako `: [Typ]`:

```swift id="9v0zoj"
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

V tomto kóde môže pole `scores` obsahovať iba prvky typu `Int` a `tags` iba prvky typu `String`.

Explicitná deklarácia typu môže urobiť zámer kódu jasnejším a v niektorých prípadoch zabrániť chybám pri typovej inferencii.

## Typová inferencia

V mnohých prípadoch nemusíme typ deklarovať explicitne:

```swift id="16r7sj"
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Je to preto, že kompilátor Swiftu dokáže podľa „počiatočnej hodnoty“ automaticky odvodiť typ.

## Explicitná deklarácia a typová inferencia

V predchádzajúcich lekciách sme explicitnú deklaráciu nepoužívali, napríklad:

```swift id="uthvx4"
var age: Int = 18
```

Namiesto toho sme uprednostňovali typovú inferenciu:

```swift id="b1nf0u"
var age = 18
```

V tomto príklade sú oba zápisy rovnocenné a `age` bude v oboch prípadoch určené ako typ `Int`. V porovnaní s tým je zápis s inferenciou stručnejší.

Dôvod, prečo sme v úvode nezdôrazňovali explicitnú deklaráciu, je ten, že typová inferencia znižuje množstvo dodatočných informácií v kóde, a tým znižuje náročnosť pochopenia pre začiatočníkov.

## Prečo potrebujeme typy

Swift je silno typovaný jazyk (`Strongly Typed Language`).

To znamená, že keď je typ premennej raz určený, nemožno ho ľubovoľne meniť.

Napríklad:

```swift id="ibn1x2"
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Prvé `20` je typu `Int`, preto ho možno priradiť do `age`. Druhé `"20"` je typu `String`, čo sa s typom `Int` nezhoduje, preto vznikne chyba.

`nums` je pole typu `[Int]`, takže môže obsahovať iba celé čísla a nemožno doň miešať reťazce.

Typy obmedzujú spôsob používania dát a už vo fáze kompilácie dokážu odhaliť problémy s nezhodou typov. Tým sa znižuje množstvo chýb spôsobených typovým chaosom a zvyšuje sa stabilita aj udržiavateľnosť kódu.

## Kedy musíme typ deklarovať explicitne

Hoci Swift dokáže typ odvodiť automaticky, existujú situácie, keď to kompilátor nedokáže, alebo by ho odvodil nesprávne. Vtedy ho musíme deklarovať ručne.

**1. Prázdne pole**

Pri vytváraní prázdneho poľa musíme typ deklarovať explicitne:

```swift id="mk6tg3"
var nums: [Int] = []
```

Ak typ neuvedieme:

```swift id="u5m5ki"
var nums = []   // Error，Empty collection literal requires an explicit type
```

Kompilátor nevie z prázdneho poľa zistiť, aký typ prvkov má obsahovať, preto vznikne chyba pri kompilácii.

**2. Zabránenie nesprávnej inferencii**

```swift id="t2h9le"
var value = 10   // Int
```

V tomto príklade síce `10` môže reprezentovať aj desatinné číslo (`Double`), ale keďže neobsahuje desatinnú bodku, kompilátor ho štandardne odvodí ako `Int`.

Ak chceme, aby `value` bolo desatinné číslo, musíme typ deklarovať explicitne:

```swift id="v3x0th"
var value: Double = 10   // Double
```

Keď výsledok typovej inferencie nezodpovedá očakávaniu, mali by sme pomocou explicitnej deklarácie typu alebo úpravou literálu zabezpečiť správny typ.

**3. Vlastné typy**

Neskôr sa budeme učiť aj vlastné typy. Pri ich používaní je tiež často potrebná explicitná deklarácia:

```swift id="l1k5uq"
var info: GameInfo
var users: [User] = []
```

Dôvod je rovnaký ako pri prázdnom poli: kompilátor nedokáže z prázdnej hodnoty automaticky odvodiť typ.

## Konverzia typov

V jazyku Swift sa rôzne typy automaticky nekonvertujú. Konverziu musíme vykonať ručne.

Napríklad sčítanie dvoch čísel rôznych typov:

```swift id="s1r6kc"
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

V tomto kóde je `a` typu `Int` a `b` typu `Double`. Keďže ide o rôzne typy, nemožno ich priamo použiť v jednom výraze.

Pred vykonaním operácie musíme jednu z hodnôt najprv previesť na rovnaký typ:

```swift id="2zx0xy"
var result = Double(a) + b
```

Tento zápis znamená, že hodnotu `a` typu `Int` prevedieme na `Double` a potom ju sčítame s `b`. Výsledok sa priradí do `result`.

Treba si uvedomiť, že konverzia typu nemení typ pôvodnej premennej. Napríklad `Double(a)` nezmení `a` na typ `Double`, ale vytvorí novú hodnotu typu `Double`, ktorá sa použije vo výpočte.

Podobným spôsobom môžeme prevádzať aj iné typy, teda vo forme `CieľovýTyp()`, do ktorej odovzdáme hodnotu na konverziu. Napríklad:

```id="wa8ieh"
Int()、Double()、String()
```

Príklad:

```swift id="tcfhgp"
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Treba si uvedomiť, že nie všetky konverzie sa správajú úplne intuitívne. Napríklad pri `Double → Int` sa desatinná časť jednoducho odreže, nezaokrúhľuje sa.

## Typové aliasy

V jazyku Swift môžeme existujúcemu typu dať aj alias, čím bude význam kódu jasnejší:

```swift id="9fjlwm"
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Tu je `UserID` vo svojej podstate stále `Int`. Typ sa nemení, iba dostáva zmysluplnejší názov.

Vo väčších projektoch s veľkým množstvom kódu a zložitejšími typmi môžu typové aliasy výrazne zlepšiť čitateľnosť.

## Príklad typov

Teraz si na jednoduchom príklade ukážeme, akú úlohu majú typy v reálnom vývoji.

### Vytvorenie premennej

Najprv vytvoríme premennú `age`:

```swift id="nr7gzi"
var age = 20
```

Keďže túto premennú potrebujeme zobrazovať a meniť v SwiftUI, musíme ju deklarovať pomocou `@State`:

```swift id="g8d8jc"
@State private var age = 20
```

`private` sme už spomínali skôr. Znamená, že premenná sa dá používať iba v aktuálnom view. Neskôr sa tomu budeme venovať podrobnejšie.

### Zobrazenie dát v SwiftUI

Zobrazenie premennej `age` v SwiftUI:

```swift id="u0jvvz"
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Teraz bude view zobrazovať:

```swift id="1e5m1z"
age: 20
```

### Zmena dát

Ďalej pridáme dve tlačidlá na zmenu `age`:

```swift id="mjlwmf"
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Výsledok spustenia

Keď klikneme na `changeAge1`, do `age` sa priradí `18`:

```swift id="0jw48i"
age = 18
```

Keďže `18` je typu `Int` a zhoduje sa s typom `age`, priradenie prebehne úspešne.

Pri `changeAge2` vznikne chyba:

```swift id="trl14a"
age = "18"
```

Chybová správa:

```id="7vjgsv"
Cannot assign value of type 'String' to type 'Int'
```

Je to preto, že `"18"` je typu `String` (reťazec musí byť uzavretý v `""`), zatiaľ čo `age` je typu `Int`. Typy sa nezhodujú, preto nie je možné hodnotu priradiť.

### Prečo vznikne chyba?

Kľúč je v tomto riadku:

```swift id="l7i4ur"
@State private var age = 20   // Int
```

Hoci sme typ neuviedli explicitne, počiatočná hodnota `20` je typu `Int`, preto kompilátor automaticky odvodí, že `age` je `Int`.

Keď je typ raz určený, nemožno do premennej priradiť hodnotu iného typu.

Navyše tlačidlo `changeAge2` nezlyhá až „za behu“, ale chyba sa objaví už vo fáze kompilácie a kód nie je možné preložiť.

To je jedna z výhod silného typovania v Swifte: problémy s typmi dokáže odhaliť už pri písaní kódu.

### Správny zápis

Po odstránení chybného kódu:

```swift id="2jib24"
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

Po kliknutí na tlačidlo `changeAge1` sa view aktualizuje na:

```id="f84vz2"
age: 18
```

### Explicitná deklarácia typu (voliteľné)

Pri definovaní môžeme typ určiť aj priamo:

```swift id="zlyi8m"
@State private var age: Int = 20
```

Tento zápis robí typ ešte zreteľnejším, ale v jednoduchých prípadoch nie je nevyhnutný.

## Zhrnutie

Táto lekcia bola venovaná typovému systému jazyka Swift a jeho úlohe v reálnom vývoji.

V Swifte má každá hodnota jednoznačný typ. Typ určuje význam dát a to, akých operácií sa môžu zúčastniť.

Swift je silno typovaný jazyk. Keď je typ premennej raz určený, nemožno do nej priradiť hodnotu iného typu. Toto obmedzenie umožňuje odhaliť chyby už pri kompilácii, a tým znižuje problémy za behu programu a zvyšuje bezpečnosť kódu.

Typ premennej možno automaticky odvodiť z počiatočnej hodnoty, alebo ho možno deklarovať explicitne. V niektorých situáciách (napríklad pri prázdnych poliach, nesprávnej inferencii typu alebo vlastných typoch) kompilátor nedokáže typ určiť správne, a vtedy je explicitná deklarácia nevyhnutná.

Medzi rôznymi typmi neprebieha automatická konverzia. Musíme ju vykonať explicitne pomocou `Int()`、`Double()`、`String()` a podobne.

Typy podporujú aj aliasy. Najmä v zložitejších projektoch môžu typové aliasy zlepšiť čitateľnosť.

Typ nie je iba označenie dát, ale aj mechanizmus obmedzenia, ktorý zabezpečuje, že práca s dátami bude bezpečná, jednoznačná a kontrolovateľná.

## Rozšírené vedomosti – voliteľný typ

Pri konverzii typov môžu niektoré operácie zlyhať.

Napríklad prevod `String` na `Double`:

```swift id="srhlyv"
let input = "3.14"
let pi = Double(input)  // Double?
```

Tu `Double(input)` nevracia `Double`, ale:

```id="hbad8g"
Double?
```

To je voliteľný typ (`Optional`).

### Prečo sa vracia voliteľný typ?

Pretože obsah reťazca je neistý. `"3.14"` sa dá previesť na `Double`, ale `"Hello"` nie.

Inými slovami, táto operácia môže uspieť, ale aj zlyhať.

Preto Swift používa voliteľný typ na vyjadrenie tejto neistoty.

### Čo je voliteľný typ?

Voliteľný typ znamená, že hodnota môže existovať, ale tiež nemusí existovať.

Napríklad:

```id="jvb90l"
Double?
```

Tento typ znamená, že ak hodnota existuje, pri výpise sa zobrazí `Optional(...)`; ak hodnota neexistuje, výsledkom bude `nil`.

Treba si uvedomiť, že `nil` znamená „žiadna hodnota“, nie `0` ani prázdny reťazec.

### Príklad

```swift id="f3g5b2"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Výstup:

```id="z83q7x"
pi:Optional(3.14)
```

To znamená, že reťazec bol úspešne prevedený na `Double` a získali sme `3.14`, no keďže typ je `Double?`, je zabalený v `Optional`.

Ak konverzia zlyhá:

```swift id="1d6jrw"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Výstup:

```id="gv0t36"
pi: nil
```

Keďže `"Hello"` nemožno previesť na typ `Double`, konverzia zlyhá a vráti `nil`.

### Čo je Optional(...)?

Keď priamo vypíšeme voliteľný typ:

```swift id="btdl84"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift zobrazí jeho „debug description“:

```id="lx4d98"
Optional(3.14)
```

To nie je súčasť skutočných dát, ale iba informácia, že aktuálna hodnota je „voliteľný typ“ a vo vnútri obsahuje hodnotu.

### Rozbalenie voliteľného typu

V reálnom vývoji obvykle potrebujeme z voliteľného typu vybrať skutočnú hodnotu. Tento proces sa nazýva rozbalenie (`Unwrapping`).

Jedným z bežných spôsobov je použitie `??`, ktorým poskytneme predvolenú hodnotu:

```id="v0lvzj"
??
```

Tomuto sa hovorí operátor zlievania s `nil` (`Nil-Coalescing Operator`).

Napríklad:

```swift id="n4gr5b"
name ?? "FangJunyu"
```

Tento zápis znamená: ak má `name` hodnotu, vráti sa táto hodnota; ak je `nil`, použije sa predvolená hodnota `"FangJunyu"`.

Treba si uvedomiť, že typ predvolenej hodnoty musí byť rovnaký ako typ hodnoty vo voliteľnom type.

### Použitie ?? na poskytnutie predvolenej hodnoty

```swift id="kp2a2m"
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Výstup:

```id="t53o4m"
pi: 30
```

Pri prevode `input` na `Double` bola konverzia úspešná, preto sa vypíše získaná hodnota. Ak by konverzia zlyhala, vypísala by sa predvolená hodnota zadaná pomocou `??`.

Ak konverzia zlyhá:

```swift id="421u3s"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Výstup:

```id="h1o8t6"
pi: 10
```

Tu sa pri prevode `input` na `Double` konverzia nepodarila a vrátila `nil`, takže `??` poskytne predvolenú hodnotu.

Voliteľný typ sa používa na vyjadrenie situácií, keď „hodnota môže existovať, ale tiež nemusí“.

Pri operáciách, ktoré môžu zlyhať, napríklad pri konverzii typov, Swift vracia voliteľný typ, aby zaistil bezpečnosť programu.

Keď potrebujeme s touto hodnotou pracovať, môžeme pomocou `??` zadať predvolenú hodnotu, aby sme aj pri výskyte `nil` stále získali rozumný výsledok.
