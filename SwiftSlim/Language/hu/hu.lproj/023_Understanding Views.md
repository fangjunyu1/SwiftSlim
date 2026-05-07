# Viewok megértése

Ebben a leckében visszatérünk a legelső `ContentView`-hoz.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Amikor először találkoztunk a SwiftUI-jal, a `ContentView`-ban sok olyan kulcsszó volt, amelyet még nem értettünk.

Például a `struct`, `View`, `var`, `body`, `some View` és más kulcsszavak.

Akkor talán csak annyit tudtunk: **ha a kódot a `body` belsejébe írjuk, a felületen megjelenik a tartalom.**

Most már tanultunk a `struct`-ról, változókról, metódusokról és protokollokról, ezért újra megérthetjük ezt a kódot, és ez segít megérteni a SwiftUI viewok közötti kapcsolatot.

## ContentView újraáttekintése

SwiftUI projekt létrehozása után az Xcode alapértelmezetten létrehoz egy `ContentView` fájlt.

A példakód a következő:

```swift
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
```

Ezt a kódot több részre bontva érthetjük meg.

Először:

```swift
import SwiftUI
```

Ez a sor azt jelenti, hogy importáljuk a SwiftUI keretrendszert.

A SwiftUI importálása után tudjuk használni a SwiftUI viewokat, például a `View`, `Text`, `Image`, `VStack`, `Button` és más elemeket.

## ContentView struktúra

Ez a kódsor egy struktúra létrehozását jelenti:

```swift
struct ContentView: View
```

Ebben:

```swift
struct ContentView
```

azt jelenti, hogy a `ContentView` egy struktúra.

Az előző leckében megismertük a `struct` szerkezetet. Különböző mezőket képes összefogni, és tartalmazhat tulajdonságokat, metódusokat.

Például:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

Ebben a példában a `ContentView` három dolgot tartalmaz: `name`, `printName` és `body`.

Vagyis a `struct` össze tudja szervezni az egymáshoz kapcsolódó tulajdonságokat, metódusokat és view tartalmat.

![contentView](../../Resource/023_contentVIew.png)

## A View egy protokoll

Nézzük tovább ezt a kódsort:

```swift
struct ContentView: View 
```

A kettőspont utáni `View` azt jelenti: a `ContentView` követi a `View` protokollt.

Úgy érthetjük, hogy ha a `ContentView` SwiftUI view szeretne lenni, akkor teljesítenie kell a `View` protokoll követelményeit.

### Identifiable protokoll

Korábban, amikor a filmlistát tanultuk, találkoztunk az `Identifiable` protokollal.

Akkor a `ForEach` segítségével kellett bejárnunk a `Movie` tömböt, de a `Movie` struktúrának nem volt egyedi azonosítója, ezért nem támogatta a `ForEach` bejárást.

Ekkor a `Movie` struktúrát rá kellett vennünk arra, hogy kövesse az `Identifiable` protokollt, így megfelelt a `ForEach` egyedi azonosítóra vonatkozó követelményének.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Az `Identifiable` protokoll követelménye: **ennek a típusnak legyen egy `id` mezője, amely azonosítja önmagát.**

Miután a `Movie` biztosít egy `id` mezőt, teljesíteni tudja az `Identifiable` követelményét.

Így amikor a `ForEach`-ben használjuk, a SwiftUI felismeri az egyes adatelemeket.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protokoll

A `View` protokoll is ilyen.

Ha egy típus SwiftUI view szeretne lenni, követnie kell a `View` protokollt.

A `View` protokoll legfontosabb követelménye pedig az, hogy biztosítson egy `body`-t.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Úgy érthetjük, hogy a `View` protokoll követelménye: **csak a `body` által visszaadott SwiftUI viewot fogadja el, a `ContentView` pedig a `body` segítségével jeleníti meg a SwiftUI viewot.**

### Mi történik, ha nem követjük a View-t?

Ha így írjuk:

```swift
struct ContentView {
}
```

Ez csak egy közönséges struktúra, nem SwiftUI view.

Nem fog közvetlenül hibát jelezni, mert egy közönséges struktúra önmagában érvényes Swift kód.

De ha betesszük a preview-ba:

```swift
#Preview {
    ContentView()
}
```

Ekkor hiba jelenik meg.

Az ok: **a preview-nak egy SwiftUI viewot kell megjelenítenie, ez a `ContentView` viszont nem követi a `View` protokollt.**

Ezért ha azt szeretnénk, hogy a `ContentView` megjelenjen a felületen, követnie kell a `View` protokollt:

```swift
struct ContentView: View {
}
```

Ugyanakkor a `View` protokoll követelménye szerint biztosítanunk kell a `body`-t. Ha nincs `body`, a compiler továbbra is hibát jelez.

Helyes írásmód:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Ekkor a `ContentView` már valóban megjeleníthető SwiftUI view.

## A body a view megjelenítésének belépési pontja

SwiftUI-ban a `body` a view tartalmának belépési pontja.

```swift
var body: some View {
    Text("Hello, world!")
}
```

Ezt három részre bonthatjuk:

**1. var body**

```swift
var body
```

Ez azt jelenti, hogy definiálunk egy `body` nevű változót.

**2. some View**

```swift
: some View
```

Ez azt jelenti, hogy ez a `body` egy viewot fog visszaadni.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

Ez a megjelenítendő view tartalmat jelenti. Ebben a kódban egy `Text` view jelenik meg.

Vagyis ami a `body` belsejébe kerül, az jelenik meg a felületen.

Például:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Ez a kód azt jelenti: **a felületen egy függőlegesen elrendezett tartalom jelenik meg, benne két szöveggel.**

### A body neve nem módosítható tetszőlegesen

Fontos megjegyezni, hogy a `body` nevet nem lehet csak úgy megváltoztatni.

Ha így írjuk:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

Ez a `content` ugyan szintén egy view tulajdonság, de nem helyettesítheti a `body`-t.

Mert a `View` protokoll által megkövetelt név pontosan a `body`.

## Mi az a some View?

SwiftUI-ban a `some View` azt jelenti, hogy egy konkrét viewot adunk vissza, csak nem kell kiírnunk ennek a viewnak a teljes típusát.

```swift
var body: some View
```

Vagyis a `some View` nem azt jelenti, hogy nincs típusa. A valódi típus továbbra is létezik, a compiler ismeri ezt a típust, de ez a típus nagyon összetett lehet, ezért a Swift megengedi, hogy a `some View` segítségével elrejtsük.

### Mi az a some?

Swiftben a `some` az átlátszatlan típus, vagyis opaque type deklarálására szolgáló kulcsszó.

Az átlátszatlan típus jelentése: **a visszatérési értéknek van egy konkrét típusa, a compiler tudja, mi ez a konkrét típus, de mi nem írjuk ki közvetlenül.**

Például:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

Ez azt jelenti, hogy a `makeView` egy olyan konkrét típust ad vissza, amely követi a `View` protokollt.

### Miért van szükség a some-ra?

A változók tanulásakor megtudtuk: **Swiftben az értékekhez vagy explicit típusjelölés kell, vagy a compiler automatikusan kikövetkezteti a típust.**

Például:

```swift
let a: Int = 10
```

Itt az `a` konstans típusa `Int`.

A SwiftUI viewok sem kivételek. Amikor a `body` segítségével SwiftUI viewot jelenítünk meg, a `body`-nak a megfelelő SwiftUI típust kell visszaadnia.

Például ha a `body` segítségével egy `Text` szöveges viewot jelenítünk meg, akkor a `body`-nak a megfelelő `Text` típust kell visszaadnia.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Ebben a példában a `body` belsejében megjelenő view egy `Text` view, és a visszatérési típus is `Text`.

Csak akkor felel meg a compiler típusazonossági követelményének, ha a belső típus és a deklarált típus megegyezik.

**Típuseltérési probléma**

Ha a `body` típusát `Color`-ra állítjuk, de `Text`-et jelenítünk meg:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

A `body` típusa és a belső kód típusa nem egyezik, ezért típuseltérési hiba keletkezik.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Ekkor kézzel kell módosítanunk a `body` visszatérési típusát.

**Összetett view típusok**

Valódi fejlesztés során a felületen általában nem csak egyetlen `Text` van.

Ha összetettebb `VStack`-et szeretnénk megjeleníteni, kézzel kellene megadnunk a bonyolult visszatérési típust.

Például:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

Ez a kód azt jelenti, hogy egy `VStack` tér vissza, amelynek belsejében `Image` és `Text` típusú viewok vannak.

A `body` visszatérési típusa:

```swift
VStack<TupleView<(Image,Text)>>
```

Látható, hogy ez a visszatérési típus nagyon összetett, és megjelent benne egy korábban nem látott `TupleView` is.

A `TupleView` itt így érthető: **több child view becsomagolása egyetlen viewba.**

**Még összetettebb view típusok**

Ha módosítókat adunk a viewhoz:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Akkor ennek a viewnak a visszatérési típusa nagyon összetetté válik, és itt nem lehet konkrétan leírni.

A meglévő `VStack<TupleView<(Image,Text)>>` visszatérési típus nem tudja leírni a módosítókat, ezért hiba keletkezik.

**A some View egyszerűsíti a visszatérési típust**

Erre a helyzetre a SwiftUI egy egyszerű megoldást ad: a `some View` használatával egyszerűsíthetjük az írásmódot.

Amikor a `body` típusát `some View`-ra változtatjuk:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Minden alkalommal, amikor módosítjuk a view kódját, nem kell újra kiírnunk a teljes visszatérési típust.

Ez azért van, mert a `some View` azt jelenti, hogy egy olyan konkrét view tér vissza, amely követi a `View` protokollt.

Más szóval a `VStack`, `Image` és más SwiftUI viewok mind követik a `View` protokollt. A módosítók hozzáadása után visszatérő view típusa továbbra is követi a `View` protokollt.

Ezért mind visszatérhetnek `some View`-ként.

### A some View nem térhet vissza tetszőleges viewval

A `some View` ugyan el tudja rejteni az összetett típusokat, de nem azt jelenti, hogy „nincs típusa”.

Alapszabálya: **a compilernek meg kell tudnia határozni egy konkrét visszatérési típust**.

Például:

```swift
var title: some View {
    Text("Hello")
}
```

Itt a visszatérő view `Text`.

De ha két viewot próbálunk visszaadni, hiba történik:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Mert a `some View` végül egy view struktúrát kell hogy visszaadjon, itt viszont két önálló view visszaadásával próbálkozunk.

### Megoldás

A megoldás általában kétféle: konténer és `@ViewBuilder`.

**1. Csomagoljuk be konténerrel**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Ebben a kódban a `title` egy `VStack`-et ad vissza, a `Text` és az `Image` pedig a `VStack` belsejében lévő child viewok.

A `some View` által elfogadott view struktúra egy `VStack<...>`, így megfelel annak a követelménynek, hogy a `some View` egyetlen view struktúrát adjon vissza. 

Ezért javasoljuk már a SwiftUI tanulásának kezdetétől, hogy a legkülső rétegen `VStack` konténerbe csomagoljuk a view kódot.

**2. Használjuk az @ViewBuilder-t**

A `some View` elé hozzáadhatjuk az `@ViewBuilder` módosítót is:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Az `@ViewBuilder` több viewot képes egy visszatérési eredménnyé összeállítani.

Lényege továbbra is az, hogy több viewot egyetlen viewvá egyesít, így teljesíti a `some View` egyetlen view struktúrára vonatkozó követelményét.

### Miért írhatunk közvetlenül több viewot a body-ba?

Ha a `var body`-ban több viewot írunk, például:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

Bizonyos esetekben az ilyen `body` nem jelez hibát.

Az ok az, hogy a `View` protokollban a `body` alapértelmezetten támogatja az `@ViewBuilder`-t:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

A `View` protokoll forráskódjában láthatjuk, hogy az `@ViewBuilder` már módosította a `body` változót.

Ezért a `body` a közönséges `some View`-hoz képest egy extra speciális kezelést kap, így a SwiftUI automatikusan egyetlen viewvá kombinálja nekünk a több viewot.

**Konténer használata ajánlott**

Hogy a kezdők könnyebben megértsék, több view szervezésére először a `VStack`, `HStack`, `ZStack`, `Group` és hasonló konténerek használata ajánlott.

Például:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Így a kód szemléletesebb: **a külső réteg egy `VStack`, benne két child viewval.**

## Viewok felbontása

Ha a felület viszonylag egyszerű, minden kódot írhatunk a `body`-ba.

Például:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Üdv a Qinote-ban")
                Text("Jó reggelt")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("kattints rám") {
                print("kattints rám ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Ennek a viewnak a megjelenési stílusa:

![view](../../Resource/023_view1.png)

Ez a kód rendben fut, de ha a view kódja nagyon összetetté válik, a `body`-ban lévő kód egyre hosszabb lesz, az olvasás és módosítás nehézsége pedig folyamatosan nő.

Ekkor a különböző területeket önálló view tulajdonságokra bonthatjuk.

### A felső view felbontása

Például bontsuk ki a felső területet:

```swift
var topHome: some View {
    HStack {
        Text("Kezdőlap")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Itt a `topHome` egy változó, amely egy viewot ad vissza.

Mivel a visszatérési érték view, a típus így írható:

```swift
some View
```

Ez valójában ugyanaz a használat, mint a `body` esetében:

```swift
var topHome: some View { }
var body: some View { }
```

Mindkettő változóval jelenít meg viewot, a visszatérési típus pedig `some View`.

### Más viewok felbontása

Ezután folytathatjuk más részek felbontását:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Üdv a Qinote-ban")
        Text("Jó reggelt")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Kattints rám") {
        print("kattints rám")
    }
    .buttonStyle(.borderedProminent)
}
```

A felbontás után a view változókat betehetjük a `body`-ba:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Kezdőlap")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Üdv a Qinote-ban")
            Text("Jó reggelt")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Kattints rám") {
            print("kattints rám")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Most a `body` csak az oldal struktúrájának leírásáért felel:

```swift
topBar
welcomeText
colorList
clickButton
```

Minden rész konkrét megvalósítása az alatta lévő megfelelő tulajdonságba kerül.

Ez a view felbontási mód áttekinthetőbbé teszi az oldal struktúráját. Minden view területnek saját neve van, így az olvasás szemléletesebb.

Amikor egy bizonyos rész kódját módosítjuk, közvetlenül megtalálhatjuk a megfelelő view területet, nem kell egy halom összetett kódban keresgélni.

### A some View egyetlen viewot ad vissza

Ebben a felbontott viewban, ha több view visszaadásával próbálkozunk:

```swift
var topBar: some View {
    Text("Kezdőlap")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

A `some View` csak egyetlen view struktúrát tud visszaadni, ezért hiba történik.

A `body`-tól eltérően egy közönséges számított tulajdonság alapértelmezetten nem rendelkezik `@ViewBuilder`-rel.

Ezért ha több viewot kell visszaadnunk, használhatunk `VStack`, `HStack` vagy `Group` konténert, hogy több viewot egyetlen viewvá kombináljunk.

```swift
var topBar: some View {
    VStack {
        Text("Kezdőlap")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Vagy hozzáadhatjuk az `@ViewBuilder`-t a viewok összeállításához:

```swift
@ViewBuilder
var topBar: some View {
    Text("Kezdőlap")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Így megvalósíthatjuk több view visszaadását.

### if több viewot ad vissza

Például:

```swift
var topHome: some View {
    if step == "Kezdőlap" {
        HStack {
            Text("Kezdőlap")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Nincs")
    }
}
```

Ebben a kódban a `topHome` a `step` tartalma alapján `HStack` vagy `Text` típusú, két különböző viewot ad vissza.

Mivel a `some View`-nak egy meghatározott konkrét visszatérési típusra van szüksége, egy közönséges számított tulajdonságban az `if` két ága nem adhat vissza közvetlenül eltérő típusú viewokat, ezért hiba történik.

**A megoldás továbbra is konténerrel becsomagolni, vagy az `@ViewBuilder` módosítót használni.**

### Miért nem használunk zárójeleket a felbontott viewoknál?

Amikor a `body`-ban használjuk a felbontott view tulajdonságokat, közvetlenül ezt írjuk:

```swift
topBar
welcomeText
colorList
clickButton
```

Nem pedig ezt:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Azért, mert a `topBar`, `welcomeText`, `colorList`, `clickButton` változók. Ezek a változók valójában számított tulajdonságok, nem metódusok.

**A tulajdonságokhoz nem kell zárójel.**

Ha metódusként írjuk meg, hasonló hatást is elérhetünk:

```swift
func topBar() -> some View {
    HStack {
        Text("Kezdőlap")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ez a kód is hasonló hatást tud elérni. A metódus meghívása egy viewot ad vissza.

Használatkor így kell írni:

```swift
topBar()
```

SwiftUI-ban, ha csak egy paramétert nem igénylő viewot bontunk ki, a számított tulajdonság használata gyakoribb.

```swift
var topBar: some View { ... }
```

## Beágyazott viewok

Amellett, hogy a kódot tulajdonságokra bontjuk, új view struktúrákat is létrehozhatunk.

Például:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Ez a `PinkColorView` a `ContentView`-hoz hasonlóan egy önálló SwiftUI view.

Ha a `ContentView`-ban kell megjeleníteni, a view neve után hozzáadhatjuk a `()` jelet.

Például:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Itt ez:

```swift
PinkColorView()
```

azt jelenti, hogy létrehozunk egy `PinkColorView` instance-t.

Mivel a `PinkColorView` követi a `View` protokollt, ugyanúgy elhelyezhető és megjeleníthető más viewokban, mint a `Text`, `Image`, `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Ez a view beágyazás: egy view megjelenhet egy másik viewon belül.

## View tulajdonság vagy új view létrehozása?

Ha a view kódja viszonylag egyszerű, általában nincs szükség a kód felbontására. Csak akkor ajánlott viewot bontani, ha a kód összetettebb.

### View tulajdonság használatának helyzete

Ha csak az aktuális view egy kis tartalomrészéről van szó, használhatunk view tulajdonságot.

Például:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Ezek a tartalmak általában csak az aktuális viewban használatosak.

### Új view létrehozásának helyzete

Ha ezek a tartalmak viszonylag önállóak, vagy később több oldalon is újrahasználhatók lehetnek, alkalmasabb új viewot létrehozni.

Például:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Ez egy cím view. Ha ezt a viewot általános komponensként szeretnénk más viewokban újrahasználni.

Létrehozhatunk egy új viewot:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Ezután máshol használhatjuk:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Ekkor ez a view egy újrahasználható, önálló komponens.

Egyszerűen így foglalhatjuk össze:

- az aktuális view tartalomterülete: használható a `var xxx: some View`
- újrahasználható önálló komponens: létrehozható új `struct XxxView: View`
- olyan komponens, amelynek adatot kell átadni: általában alkalmasabb új viewot létrehozni.

## Összefoglalás

Ebben a leckében újra megértettük a SwiftUI legalapvetőbb, de egyben legfontosabb view struktúráját.

A `ContentView` egy struktúra, amelyet `struct`-tal definiálunk, és az oldalhoz kapcsolódó kód szervezésére használunk.

A `View` egy protokoll. Ha egy struktúra SwiftUI view szeretne lenni, követnie kell a `View` protokollt.

A `body` az a tartalom, amelynek biztosítását a `View` protokoll megköveteli tőlünk. Ez határozza meg, milyen tartalmat jelenít meg ez a view.

A `some View` azt jelenti, hogy valamilyen konkrét viewot adunk vissza, és nem kell kiírnunk annak összetett teljes típusát.

Amikor a view kódja hosszabbá válik, a `var xxx: some View` segítségével több kisebb területre bonthatjuk a view kódot.

Amikor egy tartalomrész viszonylag önálló, vagy újrahasználásra van szükség, létrehozhatunk új view struktúrát, és más viewokban az `XxxView()` segítségével jeleníthetjük meg.

Egyszerűen fogalmazva, a SwiftUI felület egyes viewok összeállításából épül fel. Egy oldal több kis viewot tartalmazhat, és egy kis view további viewokat is tartalmazhat.
