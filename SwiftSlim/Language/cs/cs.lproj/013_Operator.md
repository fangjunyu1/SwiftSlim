# Operátory

V této lekci se budeme učit Swift operátory (`Operators`).

Když provádíme výpočty, porovnání nebo logické vyhodnocení, potřebujeme používat operátory. Tyto operace prostupují všemi částmi běhu programu a patří k nejzákladnějším schopnostem v programování.

```swift
let a = 100 * 8
```

Během studia programování si mnoho lidí všimne, že lidé s určitou matematickou intuicí často snáze chápou logiku programů. Je to proto, že programování je ve své podstatě neoddělitelné od „výpočtů“ a „vyhodnocování pravidel“ a právě to je hlavní úloha operátorů.

V reálném vývoji se operátory nepoužívají jen pro jednoduché numerické výpočty, ale ve velké míře i v různých konkrétních scénářích.

Například v blokové hře, když uživatel přetáhne blok na určitou pozici, je potřeba vypočítat:

- souřadnice bloku
- místo, kam lze blok umístit
- zda je cílová pozice dostupná

Tyto procesy „výpočet + vyhodnocení“ jsou ve své podstatě založeny právě na operátorech.

![Block](../../Resource/013_block.png)

Učit se operátory neznamená jen učit se počítat s čísly, ale také si vytvářet základ pro pozdější práci s rozvržením rozhraní, zpracováním dat a interakční logikou.

## Jak ve SwiftUI probíhá vykonání výpočtu

Ve SwiftUI se obvykle výpočetní logika spouští přes `Button`, který zavolá funkci, a ta teprve provede potřebné operace.

Například:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Po kliknutí na tlačítko se v Console zobrazí:

```
c: 20
```

V této lekci budeme výpočetní logiku jednotně zapisovat do `func`, spouštět ji tlačítkem a výsledek vypisovat pomocí `print`.

V dalších příkladech, aby byl kód přehlednější, budeme výsledky výpočtů zapisovat přímo do ukázek a nebudeme už opakovaně používat `print`.

## Správa výstupu v Console

Protože každé kliknutí vytvoří nový výstup, můžete kliknout na tlačítko pro vyčištění v pravém dolním rohu oblasti Console a smazat historii logů, aby se dal aktuální výsledek lépe sledovat.

![Console](../../Resource/013_console.png)

## Jiný zápis `Button`

Když tlačítko provádí jen jednu funkci, lze použít stručnější zápis:

```swift
Button(action: ) {
    // View
}
```

V tomto zápisu `action` určuje funkci, která se má spustit po stisknutí tlačítka (funkce bez parametrů), a složené závorky `{}` definují vzhled tlačítka.

V kombinaci s dřívější funkcí `calculate` to lze napsat takto:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Po kliknutí na tlačítko se přímo vykoná funkce `calculate`.

Proto když je logika tlačítka jednoduchá a pouze volá jednu funkci, je zápis přes `action` přehlednější a lépe odpovídá běžným zvyklostem.

## Aritmetické operátory

Aritmetické operátory (`Arithmetic Operators`) se používají pro číselné výpočty:

- `+` sčítání
- `-` odčítání
- `*` násobení
- `/` dělení
- `%` modulo (zbytek po dělení)

Příklad:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Je důležité si uvědomit, že Swift je silně typovaný jazyk a automaticky nemíchá různé datové typy:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Když se dva typy liší, musíme typ převést ručně.

## Porovnávací operátory

Porovnávací operátory (`Comparison Operators`) slouží k určení vztahu mezi dvěma hodnotami a jejich výsledkem je `Bool`:

- `==` rovná se
- `!=` nerovná se
- `>` větší než
- `<` menší než
- `>=` větší nebo rovno
- `<=` menší nebo rovno

Příklad:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Porovnávací operátory se často používají v podmínkách. Například v „kolotoči citátů“ potřebujeme zajistit, aby index nepřekročil rozsah pole:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Jestliže je `index` menší než `sayings.count - 1`, výsledek porovnání je `true` a kód uvnitř `if` se vykoná; pokud je výsledek `false`, následující kód se nespustí.

## Logické operátory

Logické operátory (`Logical Operators`) slouží ke skládání více podmínek:

- `&&` a (`AND`)
- `||` nebo (`OR`)
- `!` negace (`NOT`)

### `&&` a

Když musí být splněno více podmínek současně, použijeme `&&`.

Například:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

V tomto kódu jsou dvě podmínky: `age >= 18` a `age <= 100`.

Jen pokud jsou obě podmínky současně `true`, bude `legalAge` také `true`; jakmile jedna z nich neplatí, výsledek je `false`.

### `||` nebo

Když stačí splnit jednu z více podmínek, použijeme `||`.

Například:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Tento kód znamená, že pokud platí alespoň jedna z podmínek `money >= 50` nebo `creditCard >= 50`, bude `payAllowed` rovno `true`.

Pouze tehdy, když neplatí obě podmínky, bude výsledek `false`.

Například při placení lze použít hotovost nebo kreditní kartu. Když nefunguje ani jedna možnost, platba selže.

### `!` negace

`!` je logický operátor negace (`NOT`) a používá se k obrácení hodnoty typu `Bool`.

Jednoduše řečeno, `!` změní `true` na `false` a `false` na `true`.

Například:

```swift
let allowed = true
let result = !allowed   // false
```

Zde `!allowed` znamená, že se hodnota `allowed` obrátí.

Je potřeba si uvědomit, že `!` a `!=` jsou dva různé operátory. `!` neguje hodnotu typu `Bool`, zatímco `!=` je porovnávací operátor, jehož výsledkem je `Bool`.

## Operátor přiřazení

Operátory přiřazení (`Assignment Operators`) slouží k přiřazení nebo aktualizaci proměnných:

- `=` přiřazení

Při deklaraci proměnné i během výpočtů se vždy nějaká forma přiřazení používá:

```swift
let a = 5
```

Tento kód znamená, že číselná hodnota `5` je přiřazena proměnné `a`.

### Složené přiřazovací operátory

V reálném vývoji se kromě základního operátoru přiřazení často používají i „složené přiřazovací operátory“, které přímo počítají s původní hodnotou a zároveň ji aktualizují:

- `+=`
- `-=`
- `*=`
- `/=`

V předchozí lekci o „čítači“ jsme se se složenými přiřazovacími operátory už stručně setkali.

Například když má proměnná po kliknutí na tlačítko automaticky růst:

```swift
var num = 10
num += 5   // num = 15
```

Tento kód znamená, že se k `num` přičte `5` a výsledek se znovu uloží do `num`.

Proto je rovnocenný tomuto zápisu:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternární operátor

Ternární operátor (`Ternary Operator`) ve Swiftu vyhodnotí podmínku a vrátí jednu ze dvou hodnot:

```swift
podmínka ? hodnota1 : hodnota2
```

Logika je taková, že pokud je podmínka `true`, vrátí se „hodnota1“; pokud je `false`, vrátí se „hodnota2“.

Například:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Tento kód vyhodnotí hodnotu `showColor`: pokud je `true`, vrátí `Color.blue` a pozadí bude modré; pokud je `false`, vrátí `Color.clear` a pozadí se nezobrazí.

Tip: `Color.clear` znamená průhlednou barvu (nic se nezobrazí).

### Rozdíl oproti `if-else`

Ternární operátor je z hlediska logiky ekvivalentní příkazu `if-else`.

Například předchozí kód lze zapsat i takto:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logika obou zápisů je úplně stejná: pokud je podmínka `true`, použije se první výsledek; pokud je `false`, druhý.

V praxi je ternární operátor stručnější a hodí se hlavně pro jednoduché rozhodování „jedna ze dvou možností“, často když chceme rovnou vrátit určitou hodnotu.

Při stavbě SwiftUI `View` je ternární operátor velmi běžný, například:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Tento zápis dovoluje v jediném řádku podle podmínky dynamicky měnit vzhled view.

## Operátory rozsahu

Operátory rozsahu (`Range Operators`) slouží k vyjádření intervalu:

- `...` uzavřený rozsah (včetně obou krajů)
- `..<` polouzavřený rozsah (bez pravé hranice)

Například:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Lze si to představit tak, že `1...3` znamená od `1` do `3` včetně `3`; zatímco `5..<8` znamená od `5` do `8`, ale bez `8`.

Rozšířené tvary (jen pro orientaci):

```
5...    // >= 5
...5    // <= 5
```

Tento zápis představuje „jednostranný rozsah“ a často se používá v podmínkách nebo při porovnávání vzorů.

Operátory rozsahu budeme později používat ve `for` cyklech. Prozatím si stačí zapamatovat, že označují souvislý číselný interval.

## Procvičení operátorů

Níže si na několika jednoduchých příkladech procvičíme použití operátorů přímo ve view.

### 1. Výpočet celkového počtu vozidel

Například určitým křižovatkou projede denně 500 aut. Spočítejme, kolik aut tudy projede za 30 dní.

Můžeme použít výpočetní operátor:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Postup je zde jednoduchý: každý den 500 aut, za 30 dní tedy `500 × 30`, což dává celkem `15000` vozidel.

### 2. Zjištění členského nákupu v aplikaci

Můžeme určit, zda je někdo členem v rámci nákupu v aplikaci. Stačí, aby měl buď doživotní členství, nebo předplatné, a budeme ho považovat za člena.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

V tomto kódu je použit operátor `||` (nebo): `lifeTime = false` znamená, že uživatel nemá doživotní členství; `subscription = true` znamená, že má předplatné.

Protože stačí splnit jednu z podmínek, `isMember` je `true`. Tato osoba je tedy členem.

## Shrnutí

Ve Swiftu jsou operátory základem pro práci s daty a logickým vyhodnocováním, podobně jako `Text` slouží k zobrazování obsahu a operátory slouží ke zpracování dat samotných.

Od nejjednodušších číselných výpočtů přes složitější logické podmínky až po řízení stavu view a výpočty rozvržení, všude jsou operátory nepostradatelné.

Postupným procvičováním v různých scénářích si lze jednotlivé druhy operátorů představené v této lekci dobře osvojit, a to je důležitý základ pro další studium.

### Rozšíření znalostí - Bitové operátory

Swift navíc nabízí i nižší úroveň operátorů, tedy bitové operátory (`Bitwise Operators`):

- `&` (bitové AND)
- `|` (bitové OR)
- `^` (bitové XOR)
- `~` (bitová negace)
- `>>` (posun doprava)
- `<<` (posun doleva)

Například:

```swift
let a = 6  // binárně 110
let b = 3  // binárně 011

print(a & b) // 2 (binárně 010)
print(a | b) // 7 (binárně 111)
print(a ^ b) // 5 (binárně 101)
print(~a)    // -7 (negace)
```

Ve Swiftu se celá čísla zapisují v binárním doplňkovém kódu, takže po negaci vyjde odpovídající záporná hodnota.

Bitové operátory pracují přímo s binární reprezentací a používají se hlavně při nízkoúrovňovém zpracování dat nebo v situacích zaměřených na výkon.

Pro začátečníky nejsou tyto operátory příliš časté a v běžném vývoji pro iOS nebo SwiftUI se také objevují méně, proto se jim zde nebudeme věnovat do hloubky.

Pokud se později dostaneme k nízkoúrovňové logice nebo optimalizaci výkonu, můžeme se k nim vrátit a probrat je podrobněji.
