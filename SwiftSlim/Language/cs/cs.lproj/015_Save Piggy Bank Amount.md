# Uložení částky v pokladničce

V předchozí lekci jsme vytvořili jednoduchou „pokladničku“. V této lekci se naučíme, jak zajistit, aby se částka v „pokladničce“ ukládala trvale.

Tato lekce se zaměřuje hlavně na `UserDefaults` a property wrapper `@AppStorage`, zároveň si rozšíříme znalosti o význam `onAppear` a o použití volitelného typu (`nil`).

Je důležité si uvědomit, že tato lekce navazuje na kód „pokladničky“, který jsme vytvořili minule.

## Problém s trvalým ukládáním

Teď už je rozhraní „pokladničky“ velmi jednoduché a pohodlné na použití.

![Piggy Bank](../../Resource/014_view.png)

Existuje ale zjevný problém: pokaždé, když se view obnoví nebo aplikace zavře, celková částka v „pokladničce“ se vrátí na `0` a dříve uložené peníze se úplně ztratí.

To znamená, že data ve skutečnosti nejsou opravdu uložena. Jinými slovy, současná „pokladnička“ dokáže uchovávat jen dočasná data.

### Proč se data neukládají trvale?

Je to proto, že používáme proměnnou deklarovanou pomocí `@State`:

```swift
@State private var amount = 0
```

Životní cyklus proměnné deklarované pomocí `@State` je zcela závislý na view.

Když se view vytvoří, `amount` se inicializuje na `0`; když se view zničí, `amount` se také zruší.

Data uložená v `amount` tedy existují jen v paměti a neukládají se do zařízení.

Pokud nechceme, aby `amount` bylo svázané se životním cyklem view, musíme zavést trvalé ukládání dat. Nebo jinak řečeno: uložit data do zařízení.

### Co znamená „perzistence dat“

Perzistenci dat si můžeme představit jako uložení dat z „dočasné paměti“ do „úložiště zařízení“.

Když view zavřeme nebo ukončíme aplikaci, data se neztratí.

Ve vývoji ve Swiftu lze pro jednoduchou „perzistenci dat“ použít `UserDefaults`, zatímco složitější data vyžadují `SwiftData` nebo `CoreData`.

V této lekci se nejprve naučíme nejjednodušší variantu, tedy `UserDefaults`.

## UserDefaults

`UserDefaults` slouží k ukládání lehkých dat typu klíč-hodnota a často se používá pro `String`, `Int`, `Double`, `Bool` a další základní typy.

### Uložení dat

`UserDefaults` používá pro ukládání dat metodu `set`:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

První parametr `UserDefaults` představuje ukládaná data, zde předáváme typy jako `String` nebo `Int`.

Druhý parametr `forKey` funguje podobně jako název proměnné a používá se k identifikaci dat uložených v `UserDefaults`.

### Načtení dat

`UserDefaults` používá pro čtení odpovídající metody:

```swift
let name = UserDefaults.standard.string(forKey: "name")   // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")    // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")   // true
```

Při čtení je nutné použít metodu odpovídající danému typu, jinak se mohou objevit chyby nebo nebudou data správná.

### Na co si dát pozor u `UserDefaults`

#### 1. Vrací volitelný typ

Při čtení dat přes `UserDefaults` některé metody vracejí volitelný typ (`Optional`).

Například:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Vrácený typ `name` je:

```swift
String?
```

To znamená, že hodnota může existovat, ale také nemusí.

**Proč se vrací volitelný typ?**

Protože pro určitý klíč (`Key`) v `UserDefaults` nemusí nutně existovat odpovídající data.

Například:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Pokud klíč `"City"` nikdy předtím uložen nebyl, výsledek čtení bude:

```swift
nil
```

Je potřeba zdůraznit, že `nil` znamená, že žádná data neexistují, nikoli prázdný řetězec.

V lekci o „typovém systému“ jsme se už setkali s podobným případem, kdy převod typu může selhat a vrací se volitelný typ.

V takové situaci pak musíme použít `??` a dodat výchozí hodnotu, tedy provést rozbalení:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

Pokud `UserDefaults` data najde, použije se načtená hodnota; pokud ne (`nil`), použije se výchozí hodnota.

#### 2. Vrací nevolitelný typ

Při čtení typů `Int`, `Double` a `Bool` vrací `UserDefaults` nevolitelné typy.

Například:

```swift
let num = UserDefaults.standard.integer(forKey: "num")   // 0
let height = UserDefaults.standard.double(forKey: "height")   // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar") // false
```

I když pro tyto klíče nikdy žádná data uložena nebyla, vrácená hodnota nebude `nil`.

Místo toho se vrátí výchozí hodnota:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Omezení objemu dat

`UserDefaults` se hodí pouze pro ukládání menšího množství dat, například nastavení aplikace nebo jednoduchých stavů.

V praxi není vhodný pro ukládání velkého množství dat ani pro data, která se čtou a zapisují velmi často.

## Uložení částky „pokladničky“

Teď už můžeme pomocí `UserDefaults` zapsat logiku pro uložení celkové částky „pokladničky“.

Když uživatel klikne na tlačítko, zadaná částka se přičte k celkové částce a tato celková částka se uloží do `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")   // UserDefaults
}
.buttonStyle(.borderedProminent)
```

Teď jsme dokončili logiku pro zápis dat.

## Vysvětlení logiky perzistence dat

I když už jsme dokončili logiku pro ukládání dat, při skutečném spuštění zjistíme, že při každém obnovení view nebo znovuotevření aplikace je proměnná `amount` stále `0`.

Je to proto, že:

```swift
@State private var amount = 0
```

Ve SwiftUI se proměnná `@State` při vytvoření view znovu inicializuje.

I když je hodnota `amount` uložena v `UserDefaults`, při znovunačtení view se `amount` stále resetuje na `0`.

To ukazuje, že jsme data sice uložili do `UserDefaults`, ale ve view jsme je zatím neobnovili.

Proto musíme při načtení view ještě ručně přečíst data z `UserDefaults` a znovu je přiřadit do `amount`, aby byla logika perzistence kompletní.

### Přirovnání logiky

Tento proces si můžeme představit jako „tabuli ve třídě“:

Během vyučování učitel zapisuje obsah na tabuli a tento obsah odpovídá aktuálnímu stavu view (`@State`).

Když hodina skončí, tabule se smaže, aby byla připravena pro další výuku. To odpovídá zničení view a vymazání dat v `@State`.

Aby se výukový obsah neztratil, učitel si jej dopředu uloží do materiálů. Tyto materiály odpovídají datům uloženým v `UserDefaults`.

Když začne další hodina, tabule je na začátku prázdná (`@State` se znovu inicializuje), takže učitel musí podle materiálů znovu napsat předchozí obsah na tabuli (načíst `UserDefaults`).

Je potřeba si uvědomit, že tabule neobnoví předchozí obsah automaticky. Je nutné „přečíst materiály“ (načíst `UserDefaults`) a znovu je zapsat.

## Načtení dat pomocí `onAppear`

Když se view zobrazí, musíme ručně přečíst hodnotu z `UserDefaults` a přiřadit ji do proměnné `amount` deklarované pomocí `@State`, abychom dosáhli skutečné perzistence dat.

Ve SwiftUI lze použít `onAppear`, který se vykoná ve chvíli, kdy se view zobrazí:

```swift
.onAppear {}
```

Kód pro načtení z `UserDefaults` umístíme do `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Když se view vytvoří, `amount` se inicializuje na `0`; když se view zobrazí, spustí se `onAppear`, načte data z `UserDefaults` a přiřadí je do `amount`. Díky tomu může view zobrazit naposledy uloženou celkovou částku.

Tím je nyní celá logika perzistence dat pro „pokladničku“ hotová.

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Property wrapper `@AppStorage`

SwiftUI poskytuje property wrapper `@AppStorage`, který může logiku ukládání přes `UserDefaults` zjednodušit.

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` je obálka nad `UserDefaults` a `"amount"` odpovídá klíči (`Key`) v `UserDefaults`.

Když se view vytvoří, data se přečtou z `UserDefaults`; když se proměnná změní, automaticky se znovu zapíší do `UserDefaults`.

Podporuje i mechanismus aktualizace stavu ve SwiftUI a podobně jako `@State` při změně obnovuje SwiftUI view.

Jinými slovy, `@AppStorage` dokáže sám zajistit logiku čtení a ukládání dat. Už není potřeba ručně volat `UserDefaults` ani pomocí `onAppear` data ručně načítat.

Proto můžeme v kódu nahradit `UserDefaults` pomocí `@AppStorage`:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## Shrnutí

V této lekci jsme se zaměřili hlavně na následující body:

Nejprve jsme se naučili, že `UserDefaults` slouží k ukládání lehkých dat, a použili jsme jej k uložení celkové částky do zařízení. `UserDefaults` poskytuje metody pro čtení i zápis a při jeho použití je také potřeba řešit situace s volitelnými typy.

Dále jsme si vysvětlili, že proměnná `@State` slouží jen pro správu dočasného stavu view a její životní cyklus je shodný s životním cyklem view. Když se view vytvoří znovu, `@State` se znovu inicializuje.

Při obnovování dat z `UserDefaults` jsme se naučili používat `onAppear`, abychom při zobrazení view data načetli a obnovili.

Nakonec jsme nahradili `UserDefaults` pomocí `@AppStorage`, čímž jsme dosáhli automatického čtení dat při načtení view a automatického zápisu při změně dat, takže už není potřeba ručně volat `UserDefaults` ani `onAppear`.

Díky těmto znalostem můžeme v aplikaci vytvořit základní funkci ukládání dat, takže je lze uchovat trvale.

## Cvičení po lekci

Teď už „pokladnička“ podporuje ukládání částky, ale její funkce stále nejsou úplné.

1. Když uživatel potřebuje částku vybrat, je potřeba navrhnout odpovídající logiku výběru.
2. Když chce uživatel částku úplně vynulovat, je potřeba přidat i logiku resetu.
3. Pokud chceme pokladničce přidat jméno, bude potřeba zavést ukládání dat typu `String`.

Na tomto základě můžete tyto funkce doplnit a „pokladničku“ udělat úplnější.

## Rozšíření znalostí - problém s výchozí hodnotou ve vstupním poli

Teď můžeme ještě dál vylepšit práci se vstupním polem, aby bylo zadávání pohodlnější.

![textfield](../../Resource/015_view.png)

V aktuální implementaci má vstupní pole výchozí hodnotu `0`. Uživatel tak při každém zadání částky musí nejdřív smazat `0` a teprve potom napsat nové číslo, což není příliš pohodlné.

Měli bychom zajistit, aby bylo vstupní pole na začátku prázdné, nikoli `0`.

Je to proto, že mezi `TextField` a `number` existuje obousměrná vazba:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Když je `number` inicializováno na `0`, i vstupní pole zobrazuje `0`.

Proto potřebujeme změnit `number` na prázdnou hodnotu, tedy `nil`.

```swift
@State private var number = nil
```

V tuto chvíli se objeví chyba:

```
Generic parameter 'Value' could not be inferred
```

To je přesně situace, o které jsme mluvili v „typovém systému“: když proměnná nejde automaticky typově odvodit, je nutné její typ deklarovat explicitně.

Protože nastavujeme `number` na `nil` a `nil` samo o sobě neobsahuje žádnou typovou informaci, překladač nedokáže určit, zda je proměnná `String`, `Int` nebo něco jiného, a proto hlásí chybu.

Musíme tedy pro `number` určit typ explicitně:

```swift
@State private var number:Int? = nil
```

`Int?` zde znamená volitelný typ (`Optional`), tedy že `number` může obsahovat hodnotu `Int`, ale také `nil`.

Díky tomu bude při inicializaci na `nil` vstupní pole prázdné místo toho, aby zobrazovalo `0`.

### Rozbalení volitelného typu

Když změníme `number` na volitelný typ, původní výpočetní kód začne hlásit chybu:

```swift
amount += number
```

Hlášení:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Je to proto, že `number` teď může být `nil`. Pokud by se přímo použilo ve výpočtu, vzniklo by něco jako:

```swift
amount += nil
```

Je zřejmé, že `nil` nelze sčítat s `amount`, takže taková operace není platná.

Proto je při použití volitelného typu ve výpočtech nejprve nutné provést rozbalení.

Zde můžeme použít `??` a dodat výchozí hodnotu:

```swift
amount += number ?? 0
```

Když je `number` rovno `nil`, použije se výchozí hodnota `0`; když má `number` hodnotu, použije se skutečně zadané číslo.

Tím je zajištěna správnost výpočtu a zároveň se dosáhne toho, že je vstupní pole ve výchozím stavu prázdné, takže uživatel nemusí ručně mazat `0`.

## Rozšířený kód

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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
