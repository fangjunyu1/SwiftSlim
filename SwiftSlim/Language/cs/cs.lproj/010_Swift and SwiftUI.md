# Swift a SwiftUI

Při studiu vývoje pro platformy Apple mají mnohé tutoriály tendenci vysvětlovat Swift a SwiftUI odděleně, což u začátečníků snadno vyvolává roztříštěný dojem a pocit, že jde o dvě zcela nezávislé technologie.

Ve skutečnosti tvoří Swift a SwiftUI hluboce propojený celek: Swift je programovací jazyk, který poskytuje logiku a data, zatímco SwiftUI je uživatelské rozhraní postavené na Swiftu, odpovědné za vykreslování zobrazení a interakce.

Tato lekce vám pomůže vybudovat si jasný mentální model: co je Swift, co je SwiftUI a jak v kódu spolupracují.

## Co je Swift?

Swift je moderní programovací jazyk vydaný společností Apple a používá se pro vývoj aplikací pro platformy jako iOS, macOS, watchOS a tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift je silně typovaný, statický jazyk, jehož návrh klade větší důraz na bezpečnost a omezuje mnoho běžných programátorských chyb, jako jsou nulové ukazatele nebo přístup mimo rozsah. Zároveň podporuje bezproblémovou integraci s jazykem C a Objective-C.

V reálném vývoji se Swift více stará o logickou část aplikace, například zpracování dat, síťové požadavky nebo práci s úložištěm.

## Co je SwiftUI?

SwiftUI je nový framework pro tvorbu uživatelského rozhraní, který Apple představil v roce 2019. SwiftUI používá deklarativní styl programování a umožňuje vývojářům popsat strukturu rozhraní a interakční chování pomocí stručnějšího kódu.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklarativní programování znamená, že vývojář systému pouze sdělí, co chce zobrazit, a systém podle změn v datech automaticky obnovuje zobrazení. Není už potřeba ručně spravovat stav rozhraní, což výrazně zjednodušuje složitost vývoje UI.

Jádrem SwiftUI jsou komponenty zobrazení, jako `Text`, `Image`, `Button` a podobně, a kontejnery rozvržení jako `VStack`, `HStack` a `ZStack`. Tyto komponenty vzájemně spolupracují prostřednictvím datové vazby a správy stavu, takže rozhraní může reagovat na změny dat a automaticky se obnovovat.

## Jak Swift a SwiftUI spolupracují?

Role Swiftu a SwiftUI lze shrnout do následujících bodů:

**1. Swift: zpracování logiky a dat**

Swift se používá hlavně ke správě dat, ukládání stavu a vykonávání logiky. Tento kód obvykle přímo neovlivňuje vykreslování rozhraní, ale stará se o zpracování dat a chování.

Například zpracování dat ve Swiftu:

```swift
let markdown = try? String(contentsOf: url)
```

Tento kód zahrnuje deklarace proměnných, definice konstant, funkce a tok řízení a přímo neovlivňuje vzhled zobrazení.

**2. SwiftUI: deklarace a vykreslení rozhraní**

SwiftUI se naopak používá pro vytváření rozvržení a obsahu uživatelského rozhraní a stará se hlavně o vykreslení rozhraní a interakci s ním.

Například vytvoření textového zobrazení pomocí SwiftUI:

```swift
Text("SwiftSlim")
```

To vše je kód, který slouží k vytváření a řízení prvků rozhraní a přímo souvisí s interakcí s uživatelským rozhraním.

### Základní příklad

Níže je jednoduchý příklad SwiftUI:

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

V tomto příkladu:

**Kód SwiftUI**: `VStack`, `Image`, `Text` a `padding` patří do SwiftUI a jsou zodpovědné za zobrazení a rozvržení rozhraní.

**Kód Swiftu**: komentáře `//` v horní části souboru a `import SwiftUI` patří do struktury Swift kódu; dole je `#Preview`, což je makro pro náhled v Xcode a nepodílí se na skutečném vykreslování rozhraní.

### Pokročilejší příklad

V reálných projektech se Swift a SwiftUI často používají společně, aby každý řešil to, v čem je nejlepší:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

V tomto příkladu:

**Kód SwiftUI**: `@State` je property wrapper specifický pro SwiftUI, který se používá pro deklaraci proměnlivého stavu zobrazení; `Button` a `Text` jsou komponenty SwiftUI odpovědné za zobrazení rozhraní a uživatelskou interakci.

**Kód Swiftu**: `private var name` a `func printName()` jsou Swift kód určený pro ukládání dat a vykonávání logiky, ale přímo neovlivňují vykreslování zobrazení.

Když uživatel klikne na tlačítko, SwiftUI spustí kód uvnitř tlačítka:

```swift
Button("Print") {
    printName()
}
```

Zde je `Button` součást SwiftUI, zatímco vykonaná funkce `printName()` je Swift kód zodpovědný za konkrétní logické zpracování.

Tato spolupráce umožňuje, aby Swift a SwiftUI fungovaly bez problémů dohromady: Swift řeší data a logiku, SwiftUI řeší zobrazení rozhraní.

## Kam se obvykle píše kód Swiftu a SwiftUI?

Ve SwiftUI je rozhraní vytvářeno zobrazením, které vrací vlastnost `body`. Proto se veškerý kód, který popisuje rozhraní, obvykle zapisuje právě do `body`.

Například:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

V tomto příkladu je `Text` komponenta SwiftUI, a proto musí být uvnitř `body`, protože SwiftUI právě z `body` rozhraní čte a generuje.

Kód, který nesouvisí přímo s rozhraním, například proměnné, funkce nebo logika zpracování dat, se obvykle zapisuje mimo `body`. Například:

```swift
struct ContentView: View {

    // Swift: data nebo logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: rozhraní
    var body: some View {
        Text(name)
    }
}
```

Je důležité si uvědomit, že i uvnitř `body` lze stále používat syntaxi Swiftu, například `if`, `for` a další řídicí struktury, ale pouze pro řízení generování zobrazení SwiftUI:

```
if isLogin {
    Text("Welcome")
}
```

Proto si při vývoji ve SwiftUI můžeme zjednodušeně zapamatovat: kód zobrazení (`Text`, `Image`, `Button` atd.) se obvykle zapisuje do `body`; kód dat a logiky (proměnné, funkce apod.) se obvykle zapisuje mimo `body`.

## Swift soubory

S pokračujícím studiem se setkáme také s architekturou MVVM, kde vrstvy `ViewModel` a `Model` obvykle tvoří čistý Swift kód a jsou zcela odděleny od vrstvy zobrazení (`SwiftUI`).

Například třída pro správu stavu aplikace:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Nebo struktura popisující datovou strukturu:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Úkolem těchto souborů je spravovat a uchovávat data a přímo se nezobrazují v rozhraní, takže patří čistě do Swiftu.

## Historické pozadí

Chceme-li porozumět vztahu mezi Swiftem a SwiftUI, je potřeba znát i vývoj technologií Apple. Do roku 2026 prošel tento technologický stack několika iteracemi.

### Historie Swiftu

Před příchodem Swiftu byl hlavním programovacím jazykem na platformách Apple Objective-C, který podporoval kombinaci s jazykem C. Jeho syntaxe byla poměrně rozvláčná a pro začátečníky představovala vyšší vstupní bariéru:

```Obj-c
// Zápis v Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

V roce 2014 Apple na WWDC představil jazyk Swift. Swift měl modernější syntaxi, vyšší typovou bezpečnost a postupně se stal hlavním vývojovým jazykem místo Objective-C:

```swift
// Zápis ve Swiftu
let name = "Fang"
print("Hello, \(name)")
```

Objective-C však tímto zcela nezmizel. V mnoha starších projektech a nízkoúrovňových frameworcích je stále široce používán. Porozumění jeho základní syntaxi má proto stále hodnotu při údržbě starších projektů i při pochopení nižších vrstev systému.

### Historie SwiftUI

Před SwiftUI používal iOS **UIKit** a macOS **AppKit**. Oba tyto frameworky využívají "imperativní" styl programování. Vývojář musel pomocí Storyboardu přetahovat prvky nebo ručně psát kód pro řízení stavu zobrazení. To vedlo k velkému množství kódu a vysoké náročnosti na údržbu, zejména pokud byla logika rozhraní složitá.

![storyboard](../../RESOURCE/010_xcode.png)

V roce 2019 Apple na WWDC oficiálně představil SwiftUI. SwiftUI zavedlo deklarativní programovací paradigma a výrazně zjednodušilo proces vývoje UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Je důležité si uvědomit, že SwiftUI není zcela nezávislá nízkoúrovňová implementace. Na jednotlivých platformách je ve své podstatě mostem a obalem nad UIKitem (na iOS) nebo AppKitem (na macOS) a na těchto frameworcích stále stojí.

### Vztah mezi Swiftem a UIKit/AppKit

I když je Swift univerzální programovací jazyk, který může běžet na platformách Apple, nedokáže zcela nahradit UIKit nebo AppKit. U některých složitějších požadavků na rozhraní nebo u funkcí, které SwiftUI zatím plně nepokrývá, je stále nutné využít UIKit nebo AppKit.

Například UIKit je velmi vyspělý v oblasti složité správy view controllerů, animací a rozpoznávání gest a prošel rozsáhlým ověřením v produkční praxi. Schopnosti SwiftUI se v těchto oblastech sice stále zlepšují, ale v některých okrajových scénářích stále mají omezení.

Proto mnoho vývojářů kombinuje v projektech SwiftUI s UIKitem nebo AppKitem, aby naplno využili výhod obou přístupů.

Z tohoto pohledu lze SwiftUI chápat jako vyšší vrstvu abstrahující UIKit a AppKit. Když se učíme SwiftUI, je užitečné se zároveň alespoň základně seznámit s UIKitem a AppKitem, protože to pomáhá dělat rozumnější technologická rozhodnutí při údržbě starších projektů nebo při implementaci složitějších funkcí.

## Shrnutí

**Swift**: používá se hlavně pro psaní logiky, zpracování dat a toku řízení a přímo nesouvisí s rozvržením zobrazení.

**SwiftUI**: slouží k deklarativnímu vytváření uživatelského rozhraní; kód obsahu a rozvržení zobrazení patří do SwiftUI.

V reálném vývoji se Swift a SwiftUI obvykle používají společně: Swift řeší logiku a SwiftUI řeší rozhraní.

Od Objective-C a UIKitu až po Swift a SwiftUI se vývojové prostředí Applu postupně posouvá směrem k modernějšímu a jednoduššímu programování, ale UIKit a AppKit nelze v mnoha tradičních projektech stále přehlížet.

Když pochopíme vztah mezi Swiftem a SwiftUI, můžeme vyvíjet aplikace pro iOS a macOS efektivněji a zároveň dělat rozumnější technická rozhodnutí při údržbě starších projektů.
