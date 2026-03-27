# A SwiftUI nézet életciklusa

Az előző leckében láttuk, hogy az `@State` változók együtt élnek a nézettel, és az `onAppear` alapvető használatát is megtanultuk.

Ebben a részben tovább mélyítjük a SwiftUI nézetek életciklusának megértését: megnézzük, hogyan jön létre és hogyan jelenik meg egy nézet, hogyan jönnek létre és épülnek újra a benne lévő változók, valamint megismerkedünk az `onAppear`, `onDisappear` és az `init` konstruktor szerepével.

Ezek alapján kialakítunk egy átfogó képet a SwiftUI nézet teljes felépülési folyamatáról.

## Az alkalmazás indulási sorrendje

Amikor új iOS projektet hozunk létre, az Xcode alapértelmezés szerint két fájlt generál:

```
ContentView.swift
<ProjectName>App.swift
```

Ezek közül a `<ProjectName>App.swift` az egész alkalmazás belépési pontja.

Például:

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

### A kód futásának folyamata

Amikor elindítjuk az alkalmazást, akár szimulátoron, akár valódi eszközön, a rendszer először az `@main` kulcsszót keresi:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Miután azonosította a belépési pontot, elkezdi végrehajtani a kódot.

Először belép az `App` struktúrába, lefuttatja a `body`-ban található kódot, majd létrehozza a `WindowGroup`-ot, és betölti benne a `ContentView`-t.

### A WindowGroup szerepe

A `WindowGroup` az ablakok kezelésére szolgál:

```swift
WindowGroup {
    ContentView()
}
```

Az iPad és a macOS támogatja a többablakos működést, az iPhone viszont általában csak egyetlen ablakot használ.

Ezért iPhone-on a `WindowGroup` leginkább az elsőként megjelenő képernyőt kezeli.

### A nézet betöltésének folyamata

Miután a rendszer megtalálta a `ContentView`-t:

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

A SwiftUI végrehajtja a `body`-ban lévő kódot, majd a visszaadott nézetszerkezet, például `VStack`, `Text` és más elemek alapján felépíti a felületet, és megjeleníti a képernyőn.

Miután ezek a lépések befejeződnek, a `ContentView` már látható lesz a nézetben.

![ContentView](../../Resource/016_view1.png)

Fontos tudni, hogy a `body` feladata a nézet generálása, nem pedig a nézet tárolása.

Ez azt jelenti, hogy minden alkalommal, amikor a nézet frissül, a SwiftUI újraszámolja a `body`-t, és új nézetszerkezetet állít elő.

### Az előnézeti nézet működési logikája

Az Xcode előnézete (`Canvas`) és az alkalmazás valódi futása két eltérő mechanizmus.

Például ha a belépési fájlba teszünk egy hibakeresési kiírást:

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

Ha az Xcode-ban csak a `ContentView` előnézetét nézzük, a rendszer nem az `@main` belépési ponttól indul, ezért a belépési fájl `onAppear` része nem fut le.

Ha viszont az appot szimulátoron vagy valódi készüléken futtatjuk, a rendszer az `@main`-től indul, végigmegy a teljes alkalmazásfolyamaton, így a belépési pont `onAppear` blokkja is lefut, és a hibakeresési üzenet megjelenik.

A lényeg az, hogy az Xcode előnézet csak „részleges renderelést” végez, kizárólag az aktuális nézet kirajzolására szolgál; a szimulátor és a valódi eszköz viszont teljes futtatási környezetet biztosítanak, és az egész appot végrehajtják.

Ezért amikor alkalmazásfunkciót tesztelünk, a szimulátor vagy a valódi készülék az irányadó, az Xcode előnézet önmagában nem helyettesíti a teljes futási környezetet.

## A nézet életciklusa

A jelenlegi szinten a legtöbb kódunk még a `ContentView`-ban van. Egy valódi alkalmazásban azonban általában több nézet szerepel, amelyek különböző helyzetekben jelennek meg és tűnnek el.

Például a „persely” alkalmazásnál:

![PiggyBank](../../Resource/016_view.png)

Amikor a felhasználó a „mentés” műveletre kattint, megjelenik egy `SaveView`; amikor a mentés befejeződik vagy a nézet bezárul, a `SaveView` eltűnik.

Ez egy nézet teljes életciklusa: a nézet létrejön, megjelenik, végül eltávolításra kerül.

### Az alkalmazás bezárása

Amikor az alkalmazás bezárul, minden nézet eltűnik, és a hozzájuk tartozó állapotok is megszűnnek.

Ezért a `ContentView` és az összes többi nézet is kikerül a memóriából, az alkalmazás teljes futási állapota pedig törlődik.

## A nézeten belüli változók életciklusa

SwiftUI-ban a változók életciklusa rendszerint a nézet életciklusához kötődik.

Például:

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

### @State változó

Az `@State`-tel deklarált változó a nézet életciklusához kötődik.

```swift
@State private var name = "FangJunyu"
```

Amikor a nézet létrejön, a `name` is létrejön; amikor a nézet megszűnik, a `name` is megsemmisül.

Ezért van szükség például `UserDefaults`-hoz hasonló megoldásra, ha az adatot tartósan meg szeretnénk őrizni.

### A body-ban lévő változó

A `body` belsejében definiált változó:

```swift
var num = 10
```

Ennek az életciklusa a `body` végrehajtásához kötődik.

Amikor a SwiftUI állapota megváltozik, például:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Ha a `name` megváltozik, az `@State` érzékeli az adatváltozást, értesíti a SwiftUI-t, és a nézet újraszámolódik, vagyis a `body` újra lefut.

Amikor a `body` újraszámolódik, a `body`-ban lévő összes kód ismét végrehajtódik, és a `body`-ban deklarált változók, például a `num`, újra létrejönnek.

Ez az oka annak is, hogy nem ajánlott bonyolult változókat közvetlenül a `body`-ban definiálni.

Minden nézetfrissítéskor a `body`-n belüli változók újra létrejönnek, ami növeli a számítási költséget és ronthatja a teljesítményt.

SwiftUI-ban a különböző típusú adatokat eltérő módon kell kezelni: a nézet életciklusával együtt élő adatokhoz használhatunk `@State`-et, az ideiglenes számítási adatokat pedig a `body`-ban helyezhetjük el.

## onAppear és onDisappear

Az előző leckében már találkoztunk az `onAppear`-rel. Ez akkor fut le, amikor a nézet megjelenik.

```swift
.onAppear {}
```

Például:

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

Akár Xcode előnézetben, akár futtatás közben figyelheted az `onAppear` hibakeresési kimenetét.

### onDisappear

Az `onAppear` párja az `onDisappear`:

```swift
.onDisappear {}
```

Ez akkor fut le, amikor a nézet bezárul vagy eltűnik.

Például:

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

Amikor a nézet eltávolításra kerül, az `onDisappear` kódja is lefut.

Tipp: a jelenlegi szinten használt `ContentView` az alkalmazás gyökérnézete, ezért közvetlenül nem zárható be és nem távolítható el. Emiatt ebben a fázisban az `onDisappear` hatása nem figyelhető meg közvetlenül.

Később, amikor oldalak közötti navigációt és új nézetek megnyitását tanuljuk, az `onDisappear` működése is jól láthatóvá válik.

## A létrehozás és a megjelenítés logikája

Fontos megérteni, hogy a nézet létrehozása és a nézet megjelenítése két külön szakasz.

Amikor a nézet létrejön, a struktúra konstruktorát hívjuk meg:

```swift
init() {}
```

Mivel a SwiftUI nézet `struct`:

```swift
struct ContentView: View { ... }
```

ezért amikor a nézet példánya létrejön, az `init` fut le. Csak akkor hívódik meg az `onAppear`, amikor a nézet ténylegesen megjelenik.

Például:

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

Ha ezt az Xcode-ban előnézetként futtatjuk, a hibakeresési kimenetben ezt láthatjuk:

```swift
Create ContentView
Show ContentView
```

Ez azt mutatja, hogy először az `init` fut le és létrehozza a nézetet, utána a `body` kiszámolódik, végül a nézet megjelenik, és lefut az `onAppear`.

Ezért fontos tisztán látni, hogy a nézet létrehozása és a nézet megjelenése különálló lépések.

### Az init konstruktor

Az `init` a Swift alapvető szintaxisa. Mind a `struct`, mind a `class` definiálhatja, és objektumok inicializálására szolgál.

```swift
init() {}
```

SwiftUI-ban, amikor egy nézet létrejön, a rendszer meghívja annak `init` metódusát. Ezt használhatjuk paraméterek fogadására és kezdeti adatok előkészítésére.

Ha nem írunk saját `init`-et, a Swift automatikusan létrehoz egy alapértelmezett konstruktort a `struct` számára.

Az olyan SwiftUI nézetek esetében, mint a `ContentView`, a nézet létrehozásakor az `init` fut le, megjelenéskor pedig az `onAppear`.

Ezért az `init` a nézet létrehozásakor hívódó konstruktor, amelyre később paraméterátadásnál és adat-előkészítésnél még sokszor szükség lesz.

## Összegzés

Ebben a leckében megtanultuk az alkalmazás indítási sorrendjét, a belépési fájltól a `ContentView` végrehajtásáig.

Megismertük a SwiftUI nézet életciklusát: a nézet létrehozásakor az `init` fut le, a képernyőn való megjelenéskor az `onAppear`, eltűnéskor vagy bezáráskor pedig az `onDisappear`.

Megtanultuk a nézetfrissítés mechanizmusát is: a SwiftUI-t állapot vezérli, és amikor az `@State` vagy más állapot megváltozik, a SwiftUI újraszámolja a nézetet, újra lefuttatja a `body`-t, és a `body`-ban lévő változók is újra létrejönnek.

A változók életciklusa a nézet életciklusához kötődhet, míg a `body`-n belüli ideiglenes adatok minden frissítéskor újra létrejönnek.

Ha ezeket az életciklusokat és változóviselkedéseket megértjük, sokkal tisztábban tudjuk megszervezni a kódot és az alkalmazás logikáját.
