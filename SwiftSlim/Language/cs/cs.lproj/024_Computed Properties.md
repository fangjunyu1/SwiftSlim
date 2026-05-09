# Vypočítané vlastnosti

V této lekci se budeme hlavně učit vypočítané vlastnosti.

Vypočítané vlastnosti se používají k výpočtu nového výsledku na základě existujících dat. Mohou počítat číselné hodnoty a také obsah, který se má zobrazit v zobrazeních SwiftUI.

Například:

```swift
let a = 10
let b = 20
let c = a + b
```

Zde `c` představuje výsledek součtu `a` a `b`.

V běžném kódu je tento zápis velmi častý.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tip: v události klepnutí na `Button` lze spouštět běžný kód Swift.

Pokud ale podobný kód napíšeme přímo do vlastností zobrazení SwiftUI, narazíme na problém.

Například:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Tento kód vyvolá chybu.

Vypadá to, že `a` a `b` už jsou napsané před `c`, takže by se hodnota `c` zdánlivě mohla vypočítat.

V deklaraci vlastností struktury ale tento zápis nelze použít přímo.

## Proč c nemůže přímo počítat a + b

Protože `a`, `b` a `c` nejsou dočasné konstanty v události klepnutí na tlačítko, ale vlastnosti zobrazení `ContentView`.

V události klepnutí na tlačítko může tento kód běžet normálně:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Protože po klepnutí na tlačítko se kód provádí popořadě. Nejprve se vytvoří `a`, potom `b` a nakonec se pomocí `a + b` vypočítá `c`.

Při deklarování vlastností uvnitř zobrazení je ale situace jiná:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Zde jsou `a`, `b` a `c` vlastnosti zobrazení `ContentView`.

Když se vytváří zobrazení `ContentView`, Swift musí tyto vlastnosti nejprve připravit. Aby byl proces vytváření bezpečný, Swift nedovoluje, aby výchozí hodnota uložené vlastnosti instance přímo četla jiné vlastnosti téže instance.

Proto tento řádek vyvolá chybu:

```swift
let c = a + b
```

Jednoduše to můžeme chápat takto: **při deklarování vlastností uvnitř zobrazení nelze přímo použít jednu běžnou vlastnost k výpočtu jiné běžné vlastnosti.**

Vlastnost, která přímo ukládá hodnotu, se nazývá „uložená vlastnost“. Pro snazší pochopení ji teď můžeme dočasně chápat jako běžnou vlastnost.

Například:

```swift
let a = 10
```

`a` ukládá `10`.

```swift
let b = 20
```

`b` ukládá `20`.

Ale:

```swift
let c = a + b
```

Zde `c` není přímo zapsaná pevná hodnota, ale hodnota, kterou chceme vypočítat pomocí `a + b`.

Pro takovou situaci, kdy „získáváme výsledek z existujících dat“, je vhodnější použít vypočítanou vlastnost.

Můžeme to upravit takto:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Zde je `c` vypočítaná vlastnost.

```swift
var c: Int {
    return a + b
}
```

Znamená to: **když je potřeba použít `c`, teprve tehdy přečti `a` a `b` a vrať výsledek `a + b`.**

Například:

```swift
Text("c: \(c)")
```

Když `Text` zobrazuje `c`, teprve tehdy se spustí výpočet `c`.

## Co je vypočítaná vlastnost?

Vypočítaná vlastnost vypadá jako proměnná, ale sama neukládá data.

Například:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Zde je `c` vypočítaná vlastnost.

Neukládá pevnou hodnotu jako běžná vlastnost, ale pokaždé, když se `c` čte, znovu provede kód v `{}` a vrátí výsledek výpočtu.

Můžeme to chápat takto:

```swift
var c: Int {
    return a + b
}
```

Když je potřeba použít `c`, vypočítá se `a + b`.

Proto se vypočítaná vlastnost hodí pro tuto situaci: **výsledek není potřeba ukládat zvlášť, protože ho lze vypočítat z existujících dat.**

## Základní zápis

Vypočítaná vlastnost obvykle obsahuje tři části:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklarace pomocí `var`

```swift
var c
```

Vypočítaná vlastnost musí být deklarována pomocí `var`; nelze použít `let`.

Protože vypočítaná vlastnost není pevně uložená hodnota, ale výsledek, který se dynamicky počítá při každém čtení.

### 2. Označení návratového typu

```swift
var c: Int
```

Vypočítaná vlastnost musí mít uvedený návratový typ.

Zde `c` nakonec vrátí celé číslo, takže typ je `Int`.

### 3. Použití {} k napsání logiky výpočtu

```swift
{
    return a + b
}
```

V `{}` je napsaná logika výpočtu; zde se vrací `a + b`.

## Klíčové slovo return

Vypočítaná vlastnost musí vrátit výsledek.

Například:

```swift
var c: Int {
    return a + b
}
```

Zde `return` znamená: vrať ven výsledek výpočtu `a + b`.

Pokud vypočítaná vlastnost obsahuje pouze jeden výraz, který přímo vytváří výsledek, lze `return` vynechat:

```swift
var c: Int {
    a + b
}
```

Pokud ale vypočítaná vlastnost obsahuje více řádků kódu, je potřeba pomocí `return` jasně vrátit výsledek.

Například:

```swift
var totalPriceText: String {
    let total = count * price
    return "Celkem: \(total) $"
}
```

Proces výpočtu je zde rozdělen do dvou kroků.

První krok, nejprve vypočítáme celkovou cenu:

```swift
let total = count * price
```

Druhý krok, celkovou cenu spojíme do textu a vrátíme:

```swift
return "Celkem: \(total) $"
```

Pokud `return` odstraníme:

```swift
var totalPriceText: String {
    let total = count * price
    "Celkem: \(total) $"
}
```

Tento kód vyvolá chybu.

Důvod je: **tato vypočítaná vlastnost už obsahuje více řádků kódu a Swift už nedokáže automaticky určit, který řádek je konečný výsledek k vrácení.**

Proto když má vypočítaná vlastnost jen jeden řádek výsledku, lze `return` vynechat.

```swift
var c: Int {
    a + b
}
```

Když má vypočítaná vlastnost více řádků kódu, doporučuje se `return` napsat jasně.

```swift
var totalPriceText: String {
    let total = count * price
    return "Celkem: \(total) $"
}
```

## Rozdíl mezi vypočítanou a běžnou vlastností

Běžná vlastnost ukládá data.

```swift
var c = 30
```

Zde `c` ukládá konkrétní hodnotu: `30`.

Vypočítaná vlastnost data neukládá.

```swift
var c: Int {
    a + b
}
```

Zde `c` neukládá `30`. Jen poskytuje způsob výpočtu.

Když se `c` čte, Swift provede:

```swift
a + b
```

a potom vrátí výsledek výpočtu.

Proto se vypočítané vlastnosti hodí pro situace, kdy je výsledek vypočítán z jiných dat.

## body je také vypočítaná vlastnost

Po naučení vypočítaných vlastností můžeme znovu pochopit nejběžnější úryvek ve SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Zde je `body` také vypočítaná vlastnost.

Je deklarována pomocí `var`:

```swift
var body
```

Má návratový typ:

```swift
some View
```

V jejích `{}` se vrací obsah zobrazení SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Proto lze `body` chápat takto: když SwiftUI potřebuje toto zobrazení ukázat, přečte `body` a podle obsahu, který `body` vrátí, vytvoří rozhraní.

Pokud napíšeme `return`, můžeme to chápat takto:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Ve SwiftUI ale obvykle `return` vynecháváme a píšeme rovnou:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Když se změní data `@State`, SwiftUI znovu přečte `body` a podle nových dat aktualizuje rozhraní.

Například:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("počet: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Po klepnutí na tlačítko se `count` změní.

```swift
count += 1
```

Po změně `count` SwiftUI znovu vypočítá `body`, takže se aktualizuje i text v rozhraní.

```swift
Text("počet: \(count)")
```

To je také důvod, proč se ve SwiftUI může rozhraní po změně dat automaticky obnovit.

### Nedoporučuje se psát složité výpočty do body

Protože `body` je vypočítaná vlastnost, může být čtena a znovu počítána mnohokrát.

Například:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("číslo: \(num)")
            Text("jméno: \(name)")
        }
    }
}
```

Když se `name` změní, SwiftUI znovu vypočítá `body`.

V tu chvíli se znovu provede i kód uvnitř `body` a znovu se vytvoří také `num`.

```swift
let num = 10
```

`num` v tomto příkladu je velmi jednoduché, takže vliv není velký.

Pokud se ale v `body` provádí složitý výpočet, například filtrování velkého množství dat, řazení, zpracování obrázků atd., může to ovlivnit plynulost rozhraní.

Proto by ve SwiftUI mělo `body` hlavně popisovat strukturu rozhraní.

Jednoduchá dočasná data lze psát do `body`.

Složité výpočty lze zvážit přesunout do vypočítaných vlastností mimo `body`, do metod nebo do samostatného zpracování dat.

## Příklad: množství a celková cena

Níže pochopíme vypočítanou vlastnost pomocí jednoduchého příkladu.

Předpokládejme, že jednotková cena jedné mrkve je 2 $, uživatel může klepáním na tlačítka měnit nakupované množství a rozhraní musí zobrazit celkovou cenu.

Způsob výpočtu celkové ceny:

```
množství * jednotková cena
```

Pokud bychom celkovou cenu ukládali běžnou proměnnou, bylo by to trochu nepohodlné.

Protože pokaždé, když se množství změní, museli bychom celkovou cenu ručně aktualizovat.

Lepší způsob je použít vypočítanou vlastnost:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("cena: \(price) $")
                Text("množství: \(count)")
                Text("celková cena: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Výsledek zobrazení:

![view](../../Resource/024_view.png)

V tomto příkladu:

```swift
@State private var count = 1
```

`count` představuje množství mrkví. Když klepneme na tlačítko, `count` se změní.

```swift
private let price = 2
```

`price` představuje jednotkovou cenu mrkve. Zde je to pevná hodnota, proto používáme `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` představuje celkovou cenu.

Nemusí se ukládat zvlášť, protože celkovou cenu lze vždy vypočítat pomocí `count * price`.

Když je `count` `1`:

```swift
totalPrice = 1 * 2
```

Zobrazený výsledek je:

```swift
celková cena: 2 $
```

Po klepnutí na tlačítko `+` se `count` změní na `2`.

Když v tu chvíli znovu přečteme `totalPrice`, znovu se vypočítá:

```swift
totalPrice = 2 * 2
```

Zobrazený výsledek je:

```swift
celková cena: 4 $
```

To je úloha vypočítané vlastnosti: dynamicky vypočítat nový výsledek podle existujících dat.

## Vypočítané vlastnosti lze použít k rozhodování

Vypočítané vlastnosti mohou nejen počítat číselné hodnoty, ale také vracet výsledek rozhodnutí.

Například když chceme, aby nejnižší množství bylo 1.

Když je množství už 1, tlačítko `-` by nemělo dál snižovat.

Můžeme přidat vypočítanou vlastnost:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Úplný kód:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("cena: \(price) $")
                Text("množství: \(count)")
                Text("celková cena: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Výsledek zobrazení:

![view](../../Resource/024_view1.png)

Tady:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Tento kód znamená, zda je momentálně možné dál snižovat.

Když je `count` větší než `1`:

```swift
canDecrease == true
```

znamená to, že lze snižovat.

Když je `count` rovno `1`:

```swift
canDecrease == false
```

znamená to, že už nelze dál snižovat.

### Podmíněná kontrola v tlačítku

V tlačítku se používá:

```swift
if canDecrease {
    count -= 1
}
```

Pouze když je vyhodnocení `canDecrease` `true`, může se `count` snížit.

### Ovládání barvy popředí zobrazení

`canDecrease` lze také použít k ovládání barvy popředí tlačítka:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Zde se používá ternární operátor:

```swift
canDecrease ? Color.primary : Color.gray
```

Význam tohoto kódu je: pokud je `canDecrease` `true`, použij jako barvu popředí `Color.primary`; pokud je `canDecrease` `false`, použij jako barvu popředí `Color.gray`.

`Color.primary` je systémová sémantická barva poskytovaná SwiftUI a představuje hlavní barvu textu v aktuálním rozhraní.

Ve světlém režimu je `Color.primary` obvykle blízko černé; v tmavém režimu je `Color.primary` obvykle blízko bílé.

Výhodou použití `Color.primary` tedy je, že se automaticky přizpůsobí světlému i tmavému režimu.

### Ovládání zakázaného stavu zobrazení

`disabled` se používá k ovládání toho, zda je zobrazení v zakázaném stavu:

```swift
.disabled(!canDecrease)
```

Když je `disabled` `false`, na zobrazení lze klepnout.

Když je `disabled` `true`, zobrazení je zakázané a nelze na něj klepnout.

Použití `canDecrease` jako podmínky zde usnadňuje pochopení kódu.

Když vidíme `canDecrease`, víme, že znamená „zda lze momentálně dál snižovat“.

### Doplňující vysvětlení: proč jsou zde dvě kontroly?

V tlačítku `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Zde používáme `.disabled(!canDecrease)` a zároveň uvnitř tlačítka `if canDecrease`.

`.disabled(!canDecrease)` má na starosti zakázání tlačítka v rozhraní, aby na něj uživatel nemohl klepnout.

`if canDecrease` má na starosti další kontrolu před spuštěním kódu a `count -= 1` provede pouze tehdy, když lze snižovat.

To je dvojitá ochrana. Ve skutečném vývoji lze vnitřní kontrolu vynechat, pokud už je tlačítko zakázané; v učebním příkladu ji ale necháváme, aby byla role `canDecrease` jasnější.

## Shrnutí

V této lekci jsme se hlavně učili vypočítané vlastnosti.

Vypočítaná vlastnost neukládá hodnotu přímo, ale při čtení vypočítá výsledek podle existujících dat.

Například:

```swift
var c: Int {
    a + b
}
```

Zde není potřeba `c` ukládat zvlášť, protože ji lze vypočítat pomocí `a + b`.

Vypočítaná vlastnost musí být deklarována pomocí `var` a musí mít uvedený návratový typ.

```swift
var canDecrease: Bool {
    count > 1
}
```

Vypočítané vlastnosti mohou vracet nejen číselné hodnoty, ale také výsledky rozhodnutí, textový obsah a dokonce obsah zobrazení SwiftUI.

V této lekci jsme se také naučili `return`.

`return` znamená vrátit výsledek:

```swift
var totalPriceText: String {
    let total = count * price
    return "Celkem: \(total) $"
}
```

Pokud vypočítaná vlastnost obsahuje pouze jeden výraz, který přímo vytváří výsledek, lze `return` vynechat.

```swift
var totalPrice: Int {
    count * price
}
```

Kromě toho jsme se také seznámili s `Color.primary` a `disabled`.

`Color.primary` je systémová sémantická barva SwiftUI a automaticky upravuje vzhled podle světlého a tmavého režimu.

```swift
.foregroundStyle(Color.primary)
```

`disabled` se používá k ovládání toho, zda je zobrazení zakázané.

```swift
.disabled(true)
```

Znamená zakázáno, nelze klepnout.

```swift
.disabled(false)
```

Znamená dostupné, lze klepnout.

Proto jsou vypočítané vlastnosti ve SwiftUI velmi běžné. Pomáhají nám přehledněji uspořádat výsledky výpočtů, podmínky rozhodování a zobrazovaný obsah.
