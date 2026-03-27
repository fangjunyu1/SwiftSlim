# Životní cyklus view ve SwiftUI

V předchozí lekci jsme se dozvěděli, že proměnné `@State` se řídí životním cyklem view, a také jsme se naučili základní použití `onAppear`.

V této lekci si ještě lépe vysvětlíme životní cyklus SwiftUI view, pochopíme, jak se view vytváří a zobrazuje, jak se vytvářejí a znovu vytvářejí proměnné uvnitř view, a také se naučíme `onAppear`, `onDisappear` a konstruktor `init`.

Na základě těchto znalostí si vytvoříme celkovou představu o tom, jak celý proces vytváření SwiftUI view funguje.

## Pořadí spuštění aplikace

Když vytvoříme iOS projekt, Xcode standardně vygeneruje dva soubory:

```
ContentView.swift
název projektu + App.swift
```

Z nich je soubor „název projektu + App.swift“ vstupním souborem celé aplikace.

Například:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Tok vykonávání kódu

Když spustíme App (v simulátoru nebo na skutečném zařízení), systém vyhledá klíčové slovo `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Po potvrzení vstupního souboru se začne vykonávat kód.

Nejprve se vstoupí do struktury `App`, vykoná se kód uvnitř `body`, potom se vytvoří `WindowGroup` a načte se `ContentView`, které obsahuje.

### Úloha `WindowGroup`

`WindowGroup` slouží ke správě oken:

```swift
WindowGroup {
    ContentView()
}
```

Na systémech iPad a macOS jsou podporována více oken, zatímco iPhone má obvykle jen jedno okno.

Proto `WindowGroup` na iPhonu především spravuje první zobrazenou obrazovku.

### Proces načítání view

Když systém najde `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI vykoná kód v `body`, a potom podle vrácené struktury view (například `VStack`, `Text` a podobně) sestaví rozhraní a zobrazí ho na obrazovce.

Po dokončení těchto kroků už můžeme ve view vidět `ContentView`.

![ContentView](../../Resource/016_view1.png)

Je potřeba si uvědomit, že úkolem `body` je view vytvářet, nikoli je ukládat.

To znamená, že při každém obnovení view SwiftUI znovu vypočítá `body` a vytvoří novou strukturu view.

### Logika preview view

Preview v Xcode (Canvas) a skutečné spuštění aplikace jsou dva odlišné mechanismy.

Například pokud do vstupního souboru přidáme ladicí výstup:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Když v Xcode zobrazíme náhled `ContentView`, nezačne se vykonávat od vstupu `@main`, takže `onAppear` ve vstupním souboru se nespustí.

Pokud ale aplikaci spustíme v simulátoru nebo na fyzickém zařízení, systém začne vykonávání od `@main`, projde kompletním tokem celé aplikace, spustí `onAppear` ve vstupu a vypíše ladicí informaci.

Klíč je v tom, že Xcode Preview je jen „lokální vykreslení“ určené ke zobrazení aktuálního view; simulátor a fyzické zařízení poskytují „kompletní běhové prostředí“, které provede celou aplikaci.

Proto bychom při testování funkcí aplikace měli vycházet ze simulátoru nebo fyzického zařízení. Xcode Preview neumí poskytnout plnohodnotné běhové prostředí.

## Životní cyklus view

V současné fázi je všechen náš kód soustředěn do `ContentView`. Ve skutečných aplikacích ale aplikace obvykle obsahuje více view a mezi nimi se v různých situacích přepíná.

Například v „pokladničce“:

![PiggyBank](../../Resource/016_view.png)

Když klikneme na „Save money“, zobrazí se `SaveView`; když ukládání skončí nebo se view zavře, `SaveView` se odstraní.

Tento proces je právě životní cyklus view: vytvoření view, jeho zobrazení a nakonec jeho odstranění.

### Zavření aplikace

Když se App ukončí, všechna view se odstraní a související stav zmizí.

Proto se `ContentView` i ostatní view odstraní z paměti a celý běhový stav aplikace se vyčistí.

## Životní cyklus proměnných uvnitř view

Ve SwiftUI je životní cyklus proměnných obvykle svázán se životním cyklem view.

Například:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Proměnná `@State`

Proměnná deklarovaná pomocí `@State` je navázána na životní cyklus view.

```swift
@State private var name = "FangJunyu"
```

Když se view vytvoří, vytvoří se i `name`; když se view odstraní, `name` se také zničí.

Proto je potřeba používat `UserDefaults` a podobné mechanismy pro trvalé ukládání dat.

### Proměnné uvnitř `body`

Proměnná definovaná uvnitř `body`:

```swift
var num = 10
```

Má životní cyklus navázaný na průběh vykonání `body`.

Když se ve SwiftUI změní stav, například:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Jakmile se `name` změní, `@State` zaznamená změnu dat a upozorní SwiftUI, aby view znovu přepočítal; `body` se tedy vypočítá znovu.

Při novém výpočtu `body` se znovu vykoná veškerý kód uvnitř `body` a znovu se vytvoří i všechny proměnné uvnitř `body` (například `num`).

To je také důvod, proč se nedoporučuje definovat uvnitř `body` složité proměnné.

Při každém obnovení view by se totiž proměnné uvnitř `body` znovu vytvářely, což zvyšuje výpočetní náklady a zhoršuje výkon.

Ve SwiftUI by se různé typy dat měly spravovat různými způsoby: data, která mají sledovat životní cyklus view, lze ukládat pomocí `@State`; dočasně počítaná data lze nechat uvnitř `body`.

## `onAppear` a `onDisappear`

V minulé lekci jsme se už naučili `onAppear`; `onAppear` se volá ve chvíli, kdy se view zobrazí.

```swift
.onAppear {}
```

Například:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

V Xcode Preview i při spuštění můžeme vidět ladicí výstup z `onAppear`.

### `onDisappear`

Protějškem `onAppear` je `onDisappear`:

```swift
.onDisappear {}
```

Když se view zavře, zavolá se `onDisappear`.

Například:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Když se view odstraní, spustí se kód uvnitř `onDisappear`.

Tip: `ContentView`, které v této fázi používáme, je kořenové view aplikace a nelze jej přímo zavřít nebo odstranit. V této fázi proto nemůžeme účinek `onDisappear` přímo pozorovat.

Až se později budeme učit přechody mezi stránkami nebo otevírání nových view, uvidíme, kdy se `onDisappear` skutečně volá.

## Logika vytvoření a zobrazení

Je důležité si uvědomit, že vytvoření view a jeho zobrazení jsou dvě různé fáze.

Když se view vytvoří, zavolá se konstruktor struktury:

```swift
init() {}
```

Protože SwiftUI view je struktura `struct`:

```swift
struct ContentView: View { ... }
```

Když se vytvoří instance view, vykoná se konstruktor `init`. Teprve když se view zobrazí, zavolá se metoda `onAppear`.

Například:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Při náhledu view v Xcode můžeme vidět ladicí výstup:

```swift
Create ContentView
Show ContentView
```

To ukazuje, že se nejprve spustí `init`, tím se vytvoří view, potom se vypočítá kód v `body` a nakonec se view zobrazí a vykoná se `onAppear`.

Je tedy potřeba chápat, že fáze vytvoření a zobrazení view jsou oddělené.

### Konstruktor `init`

`init` je základní syntaxe Swiftu. Lze ji definovat u `struct` i `class` a používá se pro inicializaci objektů.

```swift
init() {}
```

Ve SwiftUI se při vytvoření view volá metoda `init`, kterou lze použít pro příjem parametrů nebo inicializaci dat.

Pokud si `init` nenapíšeme ručně, Swift pro `struct` automaticky vygeneruje výchozí konstruktor.

U SwiftUI view, jako je `ContentView`, se při vytvoření view vykoná `init`, a při zobrazení view se vykoná `onAppear`.

Proto je `init` konstruktor, který se vykonává při vytvoření view a bude se nám později hodit při předávání parametrů nebo inicializaci dat.

## Shrnutí

V této lekci jsme se naučili pořadí spouštění aplikace, tedy tok vykonávání od vstupního souboru až po soubor `ContentView`.

Pochopili jsme životní cyklus SwiftUI view: při vytvoření view se vykoná `init`, při zobrazení na obrazovce se vykoná `onAppear` a při odstranění nebo zavření view se vykoná `onDisappear`.

Také jsme se seznámili s mechanismem aktualizace view: view je řízeno stavem, a když se změní `@State` nebo jiný stav, SwiftUI view obnoví, znovu vypočítá `body` a proměnné uvnitř `body` se znovu vytvoří.

Životní cyklus proměnných je navázán na životní cyklus view, zatímco dočasné proměnné uvnitř `body` se při každém obnovení vytvářejí znovu.

Pochopení těchto životních cyklů a chování proměnných nám pomáhá lépe organizovat kód a dělat logiku aplikace přehlednější.
