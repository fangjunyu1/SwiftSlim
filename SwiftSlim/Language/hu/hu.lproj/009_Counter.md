# Számláló

Az előző két leckében megtanultuk a változókat, konstansokat, gombokat és metódusokat.

Ebben a leckében ezeket az ismereteket összekapcsoljuk, és elkészítünk egy egyszerű számláló alkalmazást.

Ebben a példában azt tanuljuk meg, hogyan tároljunk és változtassunk meg változókat, valamint hogyan használjuk az `@State`-et a változók kezelésére.

## Számláló megvalósítása

A számlálót általában olyan mennyiségek nyilvántartására használjuk, amelyeket folyamatosan növelni kell. Például ugrókötelezés, futókörök vagy más számlálási helyzetek esetén.

Most készítsünk egy egyszerű számlálót: jelenítsünk meg egy számot és egy gombot, amelyre kattintva a szám növekszik.

![Num](../../RESOURCE/009_num.png)

### Szám megjelenítése

Először egy `Text` segítségével jelenítsük meg a számot.

```swift
Text("0")
```

De ha a számnak változnia kell, akkor nem írhatjuk be közvetlenül a `"0"` értéket, hanem változóban kell tárolnunk.

```swift
var num = 0
```

Ezután jelenítsük meg a változót a `Text`-ben:

```swift
Text("\(num)")
```

Itt a karakterlánc-interpolációt, vagyis a `\\()` formát használjuk a szám karakterlánccá alakítására és megjelenítésére.

### A gomb növeli a számot

Ezután adjunk hozzá egy gombot.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Amikor a gombra kattintanak, azt szeretnénk, hogy a szám növekedjen.

Ezért a gombban módosíthatjuk a változót:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Ez a kód azt jelenti: amikor a gombra kattintanak, a rendszer kiszámolja a `num + 1` értéket, majd az eredményt visszaadja a `num` változónak.

### Rövidebb írásmód

A Swift kínál egy tömörebb írásmódot is:

```swift
num += 1
```

Ez egyenértékű ezzel:

```swift
num = num + 1
```

Ezt az írásmódot összetett értékadó operátornak nevezik.

A Swiftben gyakori összetett értékadó operátorok:

```
+=   összeadásos értékadás
-=   kivonásos értékadás
*=   szorzásos értékadás
/=   osztásos értékadás
%=   maradékos értékadás
```

Például:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Teljes kód

Most már megírhatunk egy egyszerű számlálót:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

De ebben a formában a kód nem fog megfelelően működni.

### Hiba jelenik meg

Az Xcode ezt fogja jelezni:

```
Cannot assign to property: 'self' is immutable
```

Ez azt jelenti, hogy a tulajdonság nem módosítható, mert a nézet megváltoztathatatlan.

Miért történik ez?

## A SwiftUI működése

SwiftUI-ban: **a felületet az adatok vezérlik**, ami azt jelenti, hogy amikor az adatok változnak, a felület automatikusan frissül.

De fontos tudni, hogy a SwiftUI csak akkor figyeli a változásokat és frissíti a nézetet, ha az állapot, például `@State` vagy `@Binding` változik.

Ha sima változót használsz, a SwiftUI csak a nézet létrehozásakor olvassa be egyszer az értékét. Utána még ha a változó meg is változik, a felület nem frissül.

Például:

```swift
var num = 0   // 0
num = 1   // 0
```

A fenti példában a `num` egy sima változó. Bár az értéke megváltozott, a SwiftUI nem frissíti a nézetet, ezért a felületen továbbra is a kezdeti `0` jelenik meg.

![Num](../../RESOURCE/009_state.png)

Ezért csak akkor figyeli automatikusan a SwiftUI a változást és frissíti a nézetet, ha az adat állapotként van megjelölve, például `@State`, `@Binding` vagy más property wrapper használatával.

## @State property wrapper

SwiftUI-ban, ha változót szeretnél módosítani és ezzel a nézetet is frissíteni akarod, akkor `@State`-et kell használni.

```swift
@State var num = 0
```

Az `@State` arra készteti a SwiftUI-t, hogy figyelje ezt a változót.

Amikor a változó értéke megváltozik, a SwiftUI újraszámolja és frissíti a nézetet.

Teljes kód:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Most, amikor a gombra kattintasz:

```swift
num += 1
```

A SwiftUI észleli, hogy a `num` megváltozott, majd automatikusan frissíti a nézetet.

![Num](../../RESOURCE/009_state1.png)

## Az @State használatának szabályai

A valódi fejlesztésben az `@State` rendszerint két szabályt követ.

### 1. Az @State általában private

Az `@State` változót általában csak az aktuális típusban, például az adott `View` struktúrában használjuk, ezért többnyire így írjuk:

```swift
@State private var num = 0
```

Így elkerülhető, hogy más nézetek közvetlenül hozzáférjenek vagy módosítsák ezt a változót.

A `private`-ot még nem tanultuk, egyelőre elég úgy érteni:

**a `private`-tal jelölt tartalom csak az aktuális nézeten belül használható, a külső nézetek nem férnek hozzá.**

### 2. Az @State csak az aktuális nézet állapotára való

Az `@State` azokhoz az adatokhoz való, amelyeket a jelenlegi `View` saját maga kezel.

Például szövegmező tartalma vagy kapcsoló állapota:

```swift
@State private var isOn = false
@State private var text = ""
```

Ha az adatot több nézet között kell megosztani, akkor más állapottípusokra lesz szükség, például `@Binding` vagy `@Observable`.

Ezekkel a későbbi leckékben fogunk megismerkedni.

### Csökkentő gomb

A számláló nemcsak növelhető, hanem csökkenthető is.

Hozzáadhatunk egy `-` gombot.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Ezután a gombokat vízszintesen rendezhetjük egy `HStack` segítségével:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Eredmény:

![Num](../../RESOURCE/009_num1.png)

Ha a `+` gombra kattintasz, a szám 1-gyel nő; ha a `-` gombra, akkor 1-gyel csökken.

### Visszaállító gomb

Egy visszaállító gombot is hozzáadhatunk, amely a számot 0-ra állítja.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Amikor a visszaállító gombra kattintasz, a `num` értéke 0 lesz.

Eredmény:

![Num](../../RESOURCE/009_num2.png)

Ha a `0` gombra kattintasz, a szám 0-ra változik.

### Egyéni gomb

Jelenleg a gombjaink csak szöveget tudnak megjeleníteni:

```swift
Button("+") {

}
```

Ez a forma csak szöveget képes mutatni, például `+` vagy `-`.

A valódi fejlesztésben gyakran gazdagabb megjelenésre van szükség, például ikonokra vagy más nézetekre.

A SwiftUI lehetővé teszi a gomb tartalmának testreszabását. Ilyenkor használható a gomb másik írásmódja:

```swift
Button(action: {

}, label: {

})
```

Ebben az írásmódban az `action` a gomb megnyomásakor végrehajtandó kódot jelenti, a `label` pedig a gombon megjelenő nézetet.

Például megjeleníthetünk egy SF Symbols ikont a gombon:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Így a gomb már nem szöveget, hanem ikont jelenít meg.

### A számláló felületének javítása

Ahhoz, hogy a számláló felülete áttekinthetőbb legyen, a szám megjelenítését is módosíthatjuk. Például nagyobb betűmérettel:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Ezután a gombok tartalmát is cseréljük ikonokra, és az ikonok méretét is kissé növeljük:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Ugyanígy a csökkentő és a visszaállító gombokat is átalakíthatjuk ikonos formára:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Most a gombok SF Symbols ikonokat jelenítenek meg, és a felület is sokkal szemléletesebb lesz.

![Num](../../RESOURCE/009_num3.png)

## Összegzés

Ebben a leckében egy egyszerű számláló megvalósításán keresztül gyakoroltuk a változók, a `Text` és a `Button` használatát. Változóban tároltuk a számot, majd gombokkal növeltük vagy csökkentettük azt, miközben megismertük az összetett értékadó operátorokat is, például a `num += 1` és `num -= 1` formákat.

A megvalósítás során azt is megértettük, hogyan működik a SwiftUI: a felületet az adatok vezérlik. Amikor az adat megváltozik, a felület is frissül. Ezért a változó állapot tárolásához `@State`-et kell használni, mert amikor az `@State`-változó módosul, a SwiftUI automatikusan frissíti a nézetet.

Végül egyszerűen finomítottuk a felületet is: módosítottuk a `Text` betűstílusát, és a `Button(action:label:)` segítségével testre szabtuk a gombok tartalmát, így a gombok ikonokat tudtak megjeleníteni, amitől a számláló felülete átláthatóbb és esztétikusabb lett.

Mostanra már találkoztunk a SwiftUI nézetek alapvető használatával. SwiftUI-ban a legtöbb felületet változók vezérlik. Amikor a változók értéke megváltozik, a SwiftUI automatikusan frissíti a nézetet. Ezért SwiftUI-alkalmazás fejlesztésekor gyakran először azt kell megterveznünk, milyen adatokat kell tárolni, majd ezekre az adatokra építjük fel a felületet és az interakciós logikát.

## Teljes kód

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
