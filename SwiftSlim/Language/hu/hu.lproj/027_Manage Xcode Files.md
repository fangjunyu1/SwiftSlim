# Xcode-fájlok kezelése

Ebben a leckében az Xcode gyakori fájlműveleteit tanuljuk meg.

Az előző leckékben a kód nagy részét a `ContentView` fájlba írtuk. Így könnyebb megfigyelni a kódot és a megjelenési eredményt.

Például:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Egy valódi App esetében azonban általában nem írunk minden kódot egyetlen fájlba.

Amikor egyre több oldal, komponens és funkció jelenik meg, a különböző nézeteket külön SwiftUI-fájlokba kell szétválasztanunk.

Például:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Így a kód szerkezete áttekinthetőbb lesz, és a későbbi karbantartás és módosítás is könnyebb.

## Miért kell fájlokat kezelni?

SwiftUI-ban egy oldal vagy komponens általában külön nézetfájlként is megírható.

Például:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Itt a `CardView` egy SwiftUI-nézet.

Ha minden nézetet a `ContentView` fájlba írunk, a kód egyre hosszabb és egyre nehezebben olvasható lesz.

Ezért meg kell tanulnunk fájlokat létrehozni, átnevezni és törölni, valamint mappákkal kezelni a különböző kódfájlokat.

## SwiftUI-fájl létrehozása

Xcode-ban általában két gyakori módja van SwiftUI-fájl létrehozásának:

Az egyik az, hogy létrehozunk egy üres fájlt, majd magunk írjuk meg a kódot.

A másik az, hogy SwiftUI-sablonfájlt hozunk létre, és az Xcode automatikusan létrehozza az alapvető kódot.

Kezdőknek inkább a SwiftUI-sablonfájl használata ajánlott, mert automatikusan létrehozza az alapstruktúrát.

### Üres fájl létrehozása

Az Xcode bal oldali Navigator területén kattints jobb gombbal egy üres helyre vagy egy mappára, majd válaszd a `New Empty File` lehetőséget.

A művelet helye a következő:

![xcode](../../../Resource/027_view1.png)

Üres fájl létrehozása után az Xcode általában egy névtelen Swift-fájlt hoz létre, például `Untitled.swift`.

Ezt átnevezhetjük `TestView.swift` névre.

SwiftUI-projektben, ha ez a fájl egy nézet megjelenítésére szolgál, általában ajánlott a név végére hozzáadni a `View` szót.

Például:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Ez nem kötelező szabály, de így első pillantásra látható, hogy ez egy nézetfájl.

Üres fájl létrehozása után a fájlban lehet, hogy csak alapértelmezett megjegyzések vannak, de az is lehet, hogy teljesen üres. Ez az Xcode verziójától és a létrehozási módtól függ.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Ekkor kézzel kell beírnunk a SwiftUI-kódot:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Így egy egyszerű SwiftUI-nézetfájl létre is jött.

### Fájl átnevezése

Ha a fájl létrehozása után módosítani szeretnéd a fájl nevét, válaszd ki a fájlt az Xcode bal oldali Navigator területén, majd nyomd meg az Enter billentyűt `⏎`.

![xcode](../../../Resource/027_view2.png)

Így módosítható a fájlnév.

Fontos megjegyezni, hogy a fájlnév módosítása nem módosítja automatikusan a kódban lévő nézet nevét.

Például, miután a fájlnév `ProfileView.swift` lett, a kódban továbbra is szerepelhet `struct TestView: View`.

Ez nem feltétlenül okoz hibát, de könnyen zavart okozhat.

Ezért ajánlott a fájlnév és a nézetnév egységességének megtartása. Például ha a fájl neve `ProfileView.swift`, akkor a nézet neve is legyen `ProfileView`.

## SwiftUI-sablonfájl létrehozása

Üres fájl létrehozása mellett közvetlenül SwiftUI-sablonfájlt is létrehozhatunk.

Az Xcode bal oldali Navigator területén kattints jobb gombbal egy üres helyre vagy egy mappára, majd válaszd a `New File from Template...` lehetőséget.

A művelet helye a következő:

![xcode](../../../Resource/027_view3.png)

A felugró ablak tetején különböző platformokat választhatsz, például `iOS`, `macOS` és más platformokat.

Itt elég a jelenlegi projektnek megfelelő platformot választani. Például ha iOS Appot készítünk, válasszuk az `iOS` lehetőséget.

![xcode](../../../Resource/027_view4.png)

Ezután alul válaszd a `SwiftUI View` lehetőséget.

![xcode](../../../Resource/027_view12.png)

Ezután kattints a `Next` gombra, add meg a fájlnevet, majd mentsd el.

Például létrehozunk egy `Test2View.swift` fájlt.

Az Xcode automatikusan az alábbihoz hasonló kódot hoz létre:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Az üres fájlhoz képest a sablonfájl automatikusan tartalmazza az `import SwiftUI`, `struct`, `body` és `#Preview` részeket.

Ezért kezdőknek a SwiftUI-sablonfájl használata egyszerűbb, és kevésbé könnyű kihagyni fontos kódot.

**Tipp**: A jobb gombbal történő fájllétrehozás mellett az Xcode bal oldali Navigator alsó részén lévő plusz gombra is kattinthatsz fájl vagy mappa létrehozásához.

![xcode](../../../Resource/027_view5.png)

## Mappa létrehozása

Amikor egyre több fájl van, mappákkal kezelhetjük őket.

Az Xcode bal oldali Navigator területén kattints jobb gombbal egy üres helyre vagy egy mappára, majd válaszd a `New Folder` lehetőséget.

A mappa létrehozása után a kapcsolódó fájlokat behúzhatod a mappába.

![xcode](../../../Resource/027_view7.png)

A mappák főként a projektstruktúra rendszerezésére szolgálnak, és nem változtatják meg magának a nézetnek a használati módját.

Amíg a nézet neve helyes, más fájlokban továbbra is használható például `TestView()` vagy `Test2View()` formában.

## Fájl vagy mappa törlése

Ha fájlt vagy mappát szeretnél törölni, válaszd ki a megfelelő fájlt az Xcode bal oldali Navigator területén, majd kattints jobb gombbal, és válaszd a `Delete` lehetőséget.

A fájl kiválasztása után a törlés billentyűt `⌫` is megnyomhatod.

Az Xcode megjelenít egy törlést megerősítő ablakot.

![xcode](../../../Resource/027_view10.png)

A `Move to Trash` kiválasztása azt jelenti, hogy a fájl a Kukába kerül.

Ha a `Remove Reference` lehetőséget látod, az azt jelenti, hogy csak az Xcode-projektből távolítja el a hivatkozást, de nem törli az eredeti fájlt a lemezről.

Kezdőknek, ha csak egy frissen létrehozott egyszerű fájlt törölnél, általában elég a `Move to Trash` lehetőséget választani.

## Több SwiftUI-nézet megjelenítése

Miután megtanultunk fájlokat létrehozni, a különböző nézeteket külön fájlokba választhatjuk szét.

Például létrehozunk két SwiftUI-fájlt:

```swift
AuthorView.swift
CardView.swift
```

Az `AuthorView` a szerző nevét jeleníti meg:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

A `CardView` a kártya hátterét jeleníti meg:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Ezután a `ContentView` fájlban használhatjuk ezt a két nézetet:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Futtatás után láthatjuk, hogy a `CardView` és az `AuthorView` együtt, egymással kombinálva jelenik meg:

![xcode](../../../Resource/027_view11.png)

Ebben az eredményben a `CardView` háttérként működik, az `AuthorView` pedig fölötte jelenik meg, mert mindkettő a `ZStack` belsejébe került.

A `ContentView` fájlban a két nézetet a `CardView()` és `AuthorView()` formával használjuk. A név utáni `()` azt jelenti, hogy létrehozzuk és használjuk ezt a nézetet.

Ez a SwiftUI-ban gyakori nézetbeágyazás: egy nézeten belül tovább használhatunk más nézeteket.

## Belépési fájl

Végül tekintsük át, honnan kezdi az App a felület megjelenítését.

SwiftUI-projektben általában van egy belépési fájl:

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

Itt az `@main` azt jelenti, hogy ez az App belépési pontja.

A `WindowGroup` belsejében ezt látjuk:

```swift
ContentView()
```

Ez azt jelenti, hogy az App indítás után először a `ContentView` nézetet jeleníti meg.

Ezután a `ContentView` belsejében megjelenik:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Ezért a nézetek hierarchiája így érthető:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Ha a belépési fájlban megjelenített nézetet `CardView` nézetre módosítjuk:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Akkor az App indítás után csak a `CardView` nézetet fogja megjeleníteni.

Más szóval, a belépési kódban lévő `WindowGroup` határozza meg, melyik nézet jelenik meg először az App indítása után.

Ezen a nézeten belül pedig továbbra is megjeleníthetők más nézetek.

## Összegzés

Ebben a leckében megtanultuk az Xcode gyakori fájlkezelési műveleteit.

Megismertük, hogyan lehet SwiftUI-fájlt létrehozni, fájlt átnevezni, mappát létrehozni és fájlt törölni.

Ezzel együtt megtanultunk egy fontos fogalmat is: a SwiftUI-nézetek különböző fájlokba választhatók szét, majd más nézetekben használhatók.

Például:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Itt a `CardView()` és az `AuthorView()` azt jelenti, hogy más nézeteket használunk a `ContentView` belsejében.

Végül áttekintettük a belépési fájl megjelenítési logikáját is.

Az App indításakor először az `@main` jelöléssel ellátott belépési kódba lép, majd megjeleníti a `WindowGroup` belsejében lévő nézetet.

Ez segít megérteni, hogy a különböző SwiftUI-fájlok nem elszigeteltek: egymással kombinálhatók, és végül együtt alkotják a teljes App-felületet.
