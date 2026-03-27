# Kezdjük a ContentView-val

## Óra előtti előkészületek

Ebben a leckében a `ContentView.swift` fájlból indulunk ki, és rendszerszinten megismerjük a SwiftUI alapvető szerkezetét, többek között:

- kommentek
- `View` struktúra
- `VStack` / `HStack` / `ZStack` elrendezés
- `SF Symbols` ikonok
- nézetmódosítók (`modifier`)
- `#Preview` előnézeti kód

Először keresd meg a korábban létrehozott Xcode projektet, és kattints duplán a `.xcodeproj` fájlra.

A bal oldali Navigator navigációs területen válaszd ki a `ContentView.swift` fájlt.

Megjegyzés: a projekt minden megnyitásakor előfordulhat, hogy a Canvas ezt írja ki: `"Preview paused"`. Az előnézet helyreállításához kattints a frissítés gombra.

![Swift](../../RESOURCE/002_view7.png)

## A ContentView megismerése

A `ContentView` kódja:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

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

Bár a kód nem hosszú, máris tartalmazza a SwiftUI magstruktúráját.

### 1. Kommentek

A fájl tetején:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Ez egy fájlkomment, amely a fájl információit rögzíti, beleértve a fájl nevét, a projekt nevét, a létrehozó nevét és a létrehozás idejét.

A Swift a `//` használatával kezeli az egysoros kommenteket:

```swift
// Ez egy komment
```

A kommentek javítják a kód olvashatóságát, és segítenek a fejlesztőknek megérteni a kód logikáját.

A valós fejlesztés során a kód néha nehezen érthető lehet. Ha nem írunk kommenteket, könnyen előfordulhat, hogy három nappal később már a saját kódunkat sem értjük.

Ezért a kommentek aktív használata jó fejlesztési szokás. A kommentekkel feljegyezhetjük a kód logikáját, ami a későbbi karbantartást is megkönnyíti.

**Kód ideiglenes kikapcsolása**

A kommentek arra is használhatók, hogy ideiglenesen kikapcsoljunk bizonyos kódrészeket, ezzel segítve a hibakeresést.

Például:

```
A
B
C
```

Az `A`、`B` és `C` három kódrészletet jelöl, amelyek közül az egyik hibás. Ilyenkor ideiglenesen kommentálhatjuk a kódot a hiba felderítéséhez.

Először kommentáljuk ki az `A` részt:

```
// A
B
C
```

Ha az `A` kikommentálása után a kód helyreáll, akkor az `A` részben van a probléma.

Ha az `A` kikommentálása után továbbra is fennáll a hiba, kikommentálhatjuk a `B` részt, és így tovább, amíg meg nem találjuk a hibás kódrészt.

A fejlesztés során sok problémával találkozunk, és ezek okait gyakran a kód ideiglenes kikommentálásával vizsgáljuk. Ez segít megtalálni a hibás részt és rábukkanni a bugra.

Xcode-ban a következő gyorsbillentyűt használhatod:

```
Command ⌘ + /
```

így gyorsan hozzáadhatsz vagy eltávolíthatsz kommenteket.

### 2. A SwiftUI keretrendszer importálása

```swift
import SwiftUI
```

Ez a kódrészlet azt jelzi, hogy importáljuk a SwiftUI keretrendszert.

A SwiftUI-ban található `View`、`Text`、`Image`、`VStack` és más típusok mind ebből a keretrendszerből származnak.

Ha nem importáljuk a SwiftUI-t, az Xcode hibát jelez:

```
Cannot find type 'View' in scope
```

Ez azt jelenti, hogy a fordító nem ismeri fel a `View` típust.

### 3. A `View` struktúra

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Amikor először látod ezt a `View` struktúrát, idegennek tűnhet, mert olyan kulcsszavakat tartalmaz, mint a `struct`、`View`、`var`、`body` és `some`.

Ezeket a kulcsszavakat még nem tanultuk, ezért egyelőre csak annyit kell tudnod, hogy ez a kódrészlet létrehoz egy `ContentView` nevű `View` nézetet.

A `View`-t elképzelheted egy rajztáblaként, amelyre rajzolhatunk, a rajzolás eszköze pedig a SwiftUI.

Például:

![Swift](../../RESOURCE/002_view.png)

A fenti képen három oldal látható, valójában ezek három különböző `View`-t jelentenek.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Amikor SwiftUI-val fejlesztünk alkalmazást, minden oldal egy `View`.

### 4. SwiftUI kód

A `View` nézeten belül a SwiftUI kód így jelenik meg:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ez a SwiftUI kód egy függőleges elrendezést jelent, amely egy ikont és egy szöveget jelenít meg.

![Swift](../../RESOURCE/002_view1.png)

#### `VStack` elrendezés

```swift
VStack { }  // függőleges elrendezés
```

A `VStack` egy függőleges elrendezési tárolót jelent. A benne lévő nézetek fentről lefelé rendeződnek.

![Swift](../../RESOURCE/002_view8.png)

Három gyakori SwiftUI elrendezés:

- `VStack` —— függőleges rendezés
- `HStack` —— vízszintes rendezés
- `ZStack` —— egymásra helyezett rendezés (Z-tengely)

```swift
HStack { }  // vízszintes rendezés
ZStack { }  // egymásra helyezett rendezés
```

Az egyes elrendezések szemléltetése:

![Swift](../../RESOURCE/002_view2.png)

Például vízszintes rendezés `HStack` használatával:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Látható, hogy a földgömb ikon és a szöveg vízszintesen jelenik meg.

![Swift](../../RESOURCE/002_view3.png)

Ha vízszintes rendezést szeretnénk, `HStack`-et használunk. Ha egymásra helyezett rendezésre van szükség, akkor `ZStack`-et használunk.

#### `Image` és `SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Ez a kódrészlet egy földgömb ikont jelenít meg, amely az Apple `SF Symbols` ikonrendszeréből származik.

![Swift](../../RESOURCE/002_view9.png)

A kód jelentése: megjelenít egy földgömb ikont, nagy méretben, hangsúlyszínnel.

Nemcsak földgömb ikont, hanem más ikonokat is megjeleníthetünk.

Például egy hátizsákot:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Hogyan jeleníthetünk meg más ikonokat?**

Ehhez az Apple hivatalos rendszerikon-könyvtárát, az `SF Symbols`-t kell használnunk.

Nyisd meg az Apple Developer hivatalos weboldalát, és töltsd le az [SF Symbols](https://developer.apple.com/sf-symbols/) alkalmazást.

![Swift](../../RESOURCE/002_sf.png)

Nyisd meg az `SF Symbols` alkalmazást.

![Swift](../../RESOURCE/002_sf1.png)

A bal oldalon a szimbólumkategóriák, a jobb oldalon a hozzájuk tartozó ikonok láthatók.

Jobb gombbal kattintva egy ikonra válaszd az “1 név másolása” lehetőséget; a név a megfelelő sztringtartalom lesz.

Például:

```
"globe"
"backpack"
"heart"
```

A másolt ikonnevet tedd be az `Image(systemName:)` zárójelébe, és így különféle ikonokat jeleníthetsz meg.

Megjegyzés: minden `SF Symbols` ikonhoz tartozik egy minimálisan támogatott rendszerverzió. Ha a rendszerverzió túl alacsony, előfordulhat, hogy az ikon nem jelenik meg. A kompatibilitási információkat az `SF Symbols` alkalmazásban lehet megnézni.

#### Módosítók

A SwiftUI-ban a módosító (`modifier`) egy olyan eszköz, amellyel megváltoztathatjuk egy nézet megjelenését vagy viselkedését.

A módosítókat elképzelhetjük ruhaként: más ruhában másképp nézünk ki.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Az `imageScale` és a `foregroundStyle` az `Image` nézet módosítói: anélkül módosítják az `Image` nézet megjelenését, hogy magát a képtartalmat megváltoztatnák.

**1. `imageScale`**

```swift
.imageScale(.large)
```

Ez vezérli az `SF Symbols` ikonok méretét:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Különböző opciók kiválasztásával különböző méretű `SF Symbols` ikonokat jeleníthetünk meg.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

A `foregroundStyle` az előtérszínt szabályozza.

A `.tint` az aktuális környezet hangsúlyszínét jelenti (`accent color`), amely iOS-en alapértelmezés szerint kék.

Ha pirosra szeretnénk változtatni az előtérszínt:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### `Text` nézet

A `Text` egy szöveges nézet, amely karakterláncok megjelenítésére szolgál.

```swift
Text("Hello, world!")
```

Például a saját nevem megjelenítése:

```swift
Text("FangJunyu")
```

Megjegyzés: a karakterláncokat mindig `""` dupla idézőjelek közé kell tenni.

Próbáld ki, hogy megjeleníted a saját nevedet, telefonszámodat vagy más szöveges tartalmat.

#### `padding` térköz

A SwiftUI-ban a `padding` arra szolgál, hogy extra üres területet adjon a nézet tartalma és a határa közé; ez a belső margó (`padding / content inset`) fogalmához tartozik.

```swift
HStack {
    ...
}
.padding()
```

A fenti kód azt jelenti, hogy az `HStack` nézethez a rendszer alapértelmezett margót ad.

**Mi az a `padding`?**

A `padding` azt jelenti, hogy “üres hely a nézet tartalma és a határa között”.

Az alábbi ábrán a kék `HStack` nézethez `padding` került hozzáadásra, ezért a kék terület befelé húzódik, és úgy tűnik, mintha “egy karikányit kisebb” lenne.

![Swift](../../RESOURCE/002_view6.png)

**Alapértelmezett margó**

A `padding()` módosító alapértelmezés szerint a rendszer által ajánlott standard távolságot használja.

```swift
.padding()
```

Ez az érték különböző platformokon és kontextusokban eltérhet, például:

- iOS esetén általában körülbelül `16 pt`.
- macOS vagy watchOS esetén a rendszer standard távolsága eltérhet, lehet nagyobb vagy kisebb, az adott platform tervezési szabályaitól függően.

**Egyedi margó**

Egy adott irányhoz külön margót is beállíthatunk.

1. Egyetlen irány beállítása

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Az irányok jelentése:

- `.top`: felső margó
- `.bottom`: alsó margó
- `.leading`: kezdő oldali margó
- `.trailing`: záró oldali margó

![Swift](../../RESOURCE/002_view12.png)

Megjegyzés: a `leading` és `trailing` automatikusan alkalmazkodik a nyelv írásirányához. Például arab (`RTL`) környezetben automatikusan felcserélődnek.

2. Több irány beállítása

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Tömb segítségével egyszerre több irányt is megadhatunk. A tömbök konkrét használatáról egy későbbi leckében részletesebben lesz szó; itt elég csak megismerni ezt az írásmódot.

3. Vízszintes vagy függőleges irány beállítása

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Ez egyenértékű a következővel:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Margó eltávolítása**

Ha egyáltalán nem szeretnénk margót, használhatjuk a `.padding(0)` megoldást:

```swift
.padding(0)
```

Vagy egyszerűen törölhetjük a `padding` módosítót:

```swift
// .padding()
```

### 6. `#Preview` előnézeti kód

```swift
#Preview {
    ContentView()
}
```

Ez a kódrészlet azt jelenti, hogy a Canvasban létrejön a `ContentView` előnézete.

Megjegyzés: a `#Preview` egy új szintaxis, amelyet a Swift 5.9 / Xcode 15 vezetett be. Korábban a `PreviewProvider` struktúrát használták.

**Mi történik, ha kikommenteljük a `Preview` részt?**

Ha kikommenteljük a `Preview`-t:

```swift
// #Preview {
//    ContentView()
// }
```

A Canvas többé nem jelenít meg renderelhető tartalmat.

![Swift](../../RESOURCE/002_xcode.png)

Ez azt mutatja, hogy a `#Preview` vezérli a Canvasban megjelenő előnézeti nézetet.

Amikor SwiftUI nézetet szeretnénk előnézetben látni Xcode-ban, hozzáadjuk a `#Preview` kódot. Ha nincs szükség előnézetre, akkor a `#Preview` rész kikommentálható vagy törölhető.

## Összegzés

Bár a `ContentView.swift` fájlban nincs sok kód, valójában több SwiftUI-magfogalmat is lefed. Kezdők számára ez a kódrészlet idegennek tűnhet, de a struktúra részekre bontásával kialakítható egy kezdeti SwiftUI-kép.

Összefoglalva a lecke tartalmát: először megtanultuk a `//` kommenteket, amelyekkel megmagyarázhatjuk a kód logikáját vagy ideiglenesen kikapcsolhatunk kódrészeket.

Ezután megértettük, hogy egy SwiftUI fájlban kötelező importálni a SwiftUI keretrendszert:

```swift
import SwiftUI
```

Ha nem importáljuk a keretrendszert, a fordító nem fogja felismerni a `View` és más típusokat.

Ezután megismertük a SwiftUI nézetek alapvető szerkezetét:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Ebben a `ContentView` a nézet neve.

Megtanultuk a három gyakori elrendezési tárolót is: `VStack` (függőleges rendezés), `HStack` (vízszintes rendezés) és `ZStack` (egymásra helyezett rendezés).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ez a kódrészlet azt jelenti, hogy megjelenítünk egy függőleges rendezésű tárolót, amelyen belül egy ikon és egy szöveg látható.

Az `Image` megjeleníthet `SF Symbols` ikonokat, a módosítók pedig szabályozzák az ikon méretét és színét.

A `Text` nézet szöveges tartalmat jelenít meg.

A `padding` egy margó, amely átlátszó területet ad a nézet köré.

Végül a `#Preview` előnézeti nézet segítségével a Canvasban jeleníthetjük meg az előnézetet.

### Lecke utáni gyakorlat

Kezdők számára a lecke tartalma kissé összetett lehet. További gyakorlással mélyebben megérthetjük a most tanult fogalmakat:

- változtasd meg az `SF Symbols` ikon nevét
- módosítsd az ikon előtérszínét feketére
- cseréld le a `VStack`-et `HStack`-re
- kommenteld ki az `Image` vagy `Text` nézetet, és figyeld meg az előnézet változását

### Bónusz: kódkiegészítés (`Code Completion`)

Kódírás közben talán már észrevetted, hogy az Xcode automatikusan megjelenít egy listát az elérhető opciókról.

Például amikor módosítjuk az `imageScale` módosítót:

```swift
.imageScale(.)
```

Az Xcode megjeleníti az elérhető lehetőségeket:

![Swift](../../RESOURCE/002_view10.png)

Ez a kódkiegészítési mechanizmushoz (`Code Completion`) tartozik; típuskövetkeztetésre és felsorolási tagok ajánlására épül, és javítja a bevitel hatékonyságát, valamint csökkenti a hibákat.

Későbbi leckékben hivatalosan is bemutatjuk a felsorolást (`enum`), most azonban elegendő egy rövid ismerkedés.
