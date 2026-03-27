# Swift és SwiftUI

Amikor valaki Apple platformokra fejlesztést tanul, sok oktatóanyag hajlamos külön tárgyalni a Swiftet és a SwiftUI-t. Ez könnyen széttagolt benyomást kelthet a kezdőkben, mintha ezek két teljesen különálló technológiák lennének.

Valójában a Swift és a SwiftUI szorosan összefonódik: a Swift a programozási nyelv, amely a logikát és az adatokat biztosítja; a SwiftUI pedig a Swiftre épülő felhasználói felület keretrendszere, amely a nézetek kirajzolásáért és az interakcióért felel.

Ez a lecke abban segít, hogy világos fogalmi keretet alakíts ki: mi a Swift, mi a SwiftUI, és hogyan működnek együtt a kódban.

## Mi az a Swift?

A Swift az Apple által létrehozott modern programozási nyelv, amelyet iOS, macOS, watchOS és tvOS platformokon futó alkalmazások fejlesztésére használnak.

![swift](../../RESOURCE/010_swift.png)

A Swift erősen típusos, statikus nyelv, amelyet a biztonságra terveztek, és sok gyakori programozási hibát csökkent, például a nullmutatóval vagy a túlindexeléssel kapcsolatos gondokat. Emellett zökkenőmentesen együtt tud működni a C és az Objective-C nyelvvel.

A valódi fejlesztésben a Swift többnyire az alkalmazás logikai részét kezeli, például az adatfeldolgozást, a hálózati kéréseket vagy a tárolási műveleteket.

## Mi az a SwiftUI?

A SwiftUI az Apple által 2019-ben bemutatott új felületépítő keretrendszer. A SwiftUI deklaratív programozási modellt használ, így a fejlesztők tömörebb kóddal írhatják le a felület szerkezetét és viselkedését.

![swiftui](../../RESOURCE/010_swiftui.png)

A deklaratív programozás azt jelenti, hogy a fejlesztőnek csak azt kell megadnia, mit szeretne megjeleníteni, a rendszer pedig az adatok változása alapján automatikusan frissíti a nézetet. Így nincs szükség a felületi állapot manuális frissítésére, ami jelentősen leegyszerűsíti az UI-fejlesztést.

A SwiftUI magját a nézetkomponensek, például a `Text`, `Image`, `Button` és más elemek, valamint az elrendező konténerek, például a `VStack`, `HStack`, `ZStack` alkotják. Ezek adatkapcsolattal és állapotkezeléssel működnek együtt, így a felület képes reagálni az adatok változására és automatikusan frissülni.

## Hogyan működik együtt a Swift és a SwiftUI?

A Swift és a SwiftUI feladatait a következőképpen foglalhatjuk össze:

**1. Swift: a logika és az adatok kezelése**

A Swift főként az adatok kezelésére, az állapot tárolására és a logika végrehajtására szolgál. Ezek a kódrészek általában nem hatnak közvetlenül a felület kirajzolására, hanem az adatok és a viselkedés kezeléséért felelnek.

Például Swiftben adatot így dolgozhatunk fel:

```swift
let markdown = try? String(contentsOf: url)
```

Az ilyen kódok változódeklarációkat, konstansokat, függvényeket, vezérlési folyamatokat és más elemeket tartalmaznak, de nem közvetlenül a felület megjelenítését irányítják.

**2. SwiftUI: a felület deklarálása és kirajzolása**

A SwiftUI-t a felhasználói felület elrendezésének és tartalmának felépítésére használjuk. Elsősorban a felület kirajzolásáért és a nézetek interakciójáért felel.

Például SwiftUI-ban így hozhatunk létre egy szövegnézetet:

```swift
Text("SwiftSlim")
```

Ezek a kódrészek a felületi elemek felépítésére és vezérlésére szolgálnak, tehát közvetlenül a felhasználói felülettel kapcsolatosak.

### Alap példa

Íme egy egyszerű SwiftUI példa:

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

Ebben a példában:

**SwiftUI kód**: a `VStack`, `Image`, `Text`, `padding` mind SwiftUI-elemek, és a felület megjelenítéséért, elrendezéséért felelnek.

**Swift kód**: a fájl tetején lévő `//` megjegyzés és az `import SwiftUI` a Swift kódszerkezet részei; alul a `#Preview` egy Xcode előnézeti makró, amely nem vesz részt a tényleges felület kirajzolásában.

### Haladóbb példa

Valódi projektekben a Swift és a SwiftUI gyakran keverve jelenik meg, hogy mindkettő a saját erősségeit végezhesse:

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

Ebben a példában:

**SwiftUI kód**: az `@State` a SwiftUI saját property wrapperje, amely a nézet módosítható állapotának deklarálására szolgál; a `Button` és a `Text` SwiftUI nézetkomponensek, amelyek a felület megjelenítését és az interakciót biztosítják.

**Swift kód**: a `private var name` és a `func printName()` Swift-kód, amely adatot tárol és logikát hajt végre, de nem közvetlenül rajzolja ki a nézetet.

Amikor a felhasználó megnyomja a gombot, a SwiftUI kiváltja a gombban lévő műveletkódot:

```swift
Button("Print") {
    printName()
}
```

Itt a `Button` SwiftUI komponens, a meghívott `printName()` függvény viszont Swift-kód, amely a konkrét logika végrehajtásáért felel.

Ez az együttműködés teszi lehetővé, hogy a Swift és a SwiftUI zökkenőmentesen kapcsolódjon egymáshoz: a Swift az adatot és a logikát kezeli, a SwiftUI pedig a felhasználói felületet jeleníti meg.

## A Swift és a SwiftUI kódot általában hova írjuk?

SwiftUI-ban a felületet a `body` tulajdonság által visszaadott nézet építi fel. Ezért minden olyan kód, amely a felület leírására szolgál, általában a `body`-ban kap helyet.

Például:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Ebben a példában a `Text` egy SwiftUI nézetkomponens, ezért a `body`-ban kell lennie, mert a SwiftUI a `body` alapján olvassa ki és építi fel a felületet.

A felülettel közvetlenül nem kapcsolatos kódot, például változókat, függvényeket vagy adatfeldolgozó logikát, általában a `body`-n kívül írjuk. Például:

```swift
struct ContentView: View {

    // Swift: adat vagy logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: felület
    var body: some View {
        Text(name)
    }
}
```

Fontos, hogy a `body`-ban továbbra is használhatunk Swift-szintaxist, például `if`, `for` és más vezérlési szerkezeteket, csak ezek ilyenkor a SwiftUI nézetek létrehozását szabályozzák:

```
if isLogin {
    Text("Welcome")
}
```

Ezért SwiftUI fejlesztésben egyszerűen úgy is felfoghatod: a nézetkód, például `Text`, `Image`, `Button`, rendszerint a `body`-ban van; az adat- és logikai kód, például változók és függvények, többnyire a `body`-n kívül található.

## Swift fájlok

Ahogy mélyebbre haladunk a tanulásban, később megismerkedünk az MVVM architektúrával is, ahol a `ViewModel` és a `Model` réteg többnyire tiszta Swift-kódból áll, teljesen elkülönülve a nézetrétegtől, vagyis a SwiftUI-tól.

Például egy osztály, amely az alkalmazás állapotát kezeli:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Vagy egy struktúra, amely adatszerkezetet ír le:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Az ilyen fájlok feladata az adatok kezelése és tartósítása, nem pedig közvetlen megjelenítés a nézetben, ezért teljes mértékben Swifthez tartoznak.

## Történeti háttér

A Swift és a SwiftUI kapcsolatának megértéséhez érdemes röviden áttekinteni az Apple fejlesztési technológiáinak fejlődését is. 2026-ig ez a technológiai készlet több jelentős iteráción ment keresztül.

### A Swift története

A Swift megjelenése előtt az Apple platformok fő programozási nyelve az Objective-C volt, amely támogatta a C nyelvvel való vegyes használatot. A szintaxisa viszonylag bőbeszédű, és kezdők számára magasabb belépési küszöböt jelentett:

```Obj-c
// Objective-C írásmód
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014-ben az Apple a WWDC-n bemutatta a Swift nyelvet. A Swift szintaxisa modernebb, típusbiztonsága nagyobb, és fokozatosan leváltotta az Objective-C-t mint elsődleges fejlesztői nyelvet:

```swift
// Swift írásmód
let name = "Fang"
print("Hello, \(name)")
```

Ez azonban nem jelenti azt, hogy az Objective-C eltűnt volna: sok meglévő projektben és alacsony szintű keretrendszerben ma is széles körben használják. Az alapszintű szintaxis ismerete továbbra is hasznos régi projektek karbantartásához és a rendszer mélyebb megértéséhez.

### A SwiftUI története

A SwiftUI megjelenése előtt iOS-en a **UIKit**, macOS-en pedig az **AppKit** volt használatban. Ezek a keretrendszerek imperatív programozási modellt követtek. A fejlesztőknek Storyboard segítségével kellett vezérlőket húzniuk a felületre, vagy kézzel írniuk a kódot a nézetek állapotának szabályozásához. Ez sok kódot és magas karbantartási költséget eredményezett, különösen bonyolult felületi logikánál.

![storyboard](../../RESOURCE/010_xcode.png)

2019-ben az Apple a WWDC-n hivatalosan is bemutatta a SwiftUI-t. A SwiftUI a deklaratív programozási paradigmát hozta be, ami jelentősen leegyszerűsítette az UI-fejlesztés folyamatát.

![storyboard](../../RESOURCE/010_xcode1.png)

Fontos megjegyezni, hogy a SwiftUI nem teljesen önálló alsó rétegű megvalósítás. A különböző platformokon valójában a UIKittel (iOS) vagy az AppKittel (macOS) működik együtt és hidalja át azokat, tehát az alapréteg továbbra is ezekre a keretrendszerekre támaszkodik.

### A Swift és a UIKit/AppKit kapcsolata

Bár a Swift egy általános célú programozási nyelv, amely az Apple különböző platformjain fut, nem helyettesíti teljesen a UIKitet vagy az AppKitet. Egyes összetett felületi igényekhez, illetve olyan funkciókhoz, amelyeket a SwiftUI még nem fed le teljesen, továbbra is szükség lehet a UIKit vagy AppKit használatára.

Például a UIKit régóta kiforrott olyan területeken, mint az összetett view controller kezelés, az animációk vagy a gesztusfelismerés, és mindezt rengeteg valós projekt igazolta. Bár a SwiftUI képességei folyamatosan fejlődnek, bizonyos szélső helyzetekben továbbra is vannak korlátai.

Ezért sok fejlesztő vegyesen használja a SwiftUI-t és a UIKitet vagy AppKitet, hogy mindkettő előnyeit kihasználja.

Ebből a nézőpontból a SwiftUI tekinthető a UIKit / AppKit egy magasabb szintű burkának. Ha SwiftUI-t tanulsz, közben érdemes alapszinten a UIKit és az AppKit fogalmait is megérteni, mert ez segít jobb technikai döntéseket hozni régi projektek karbantartásakor vagy összetettebb funkciók megvalósításakor.

## Összegzés

**Swift**: elsősorban logika, adatfeldolgozás és vezérlési folyamatok írására való, nem közvetlenül a nézetelrendezéshez kapcsolódik.

**SwiftUI**: deklaratív módon építi fel a felhasználói felületet, a nézettartalomhoz és elrendezéshez kapcsolódó kódok SwiftUI-hoz tartoznak.

A valódi fejlesztésben a Swift és a SwiftUI rendszerint együtt jelenik meg: a Swift kezeli a logikát, a SwiftUI a felületet.

Az Objective-C és a UIKit korszakától a Swift és SwiftUI világáig az Apple fejlesztői környezete fokozatosan modernebbé és letisztultabbá vált, de a UIKit és AppKit számos hagyományos projektben továbbra is fontos szerepet játszik.

A Swift és a SwiftUI kapcsolatának megértésével hatékonyabban fejleszthetünk iOS- és macOS-alkalmazásokat, és a régi projektek karbantartásakor is megalapozottabb technikai döntéseket hozhatunk.
