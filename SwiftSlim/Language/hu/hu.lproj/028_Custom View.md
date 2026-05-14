# Egyéni View

Ebben a leckében egy nagyon fontos SwiftUI-írásmódot tanulunk meg: **egyéni View**.

Az egyéni View képes egy ismétlődő View-kódrészletet becsomagolni, és olyan View-vá alakítani, amelyet újra és újra fel lehet használni.

Valódi App fejlesztése során gyakran találkozunk ilyen helyzettel: sok felület szerkezete azonos, csak a megjelenített tartalom különbözik.

Például egy fórum webhely bejegyzéslistájában minden bejegyzésnek lehet címe, képe, kedvelésszáma és más információja.

![Reddit](../../../Resource/028_view1.png)

Egy vásárlási webhely terméklistájában minden terméknek lehet képe, neve, ára és más információja.

![Amazon](../../../Resource/028_view2.png)

Ezeknek a tartalmaknak a szerkezete hasonló; a különbség csak a megjelenített adatokban van.

Ha minden elemet kézzel írnánk meg, a kód nagyon hosszúvá válna, és később sem lenne kényelmes módosítani.

Ezért a közös szerkezetet egy egyéni View-ba csomagolhatjuk, a különböző tartalmat pedig paraméterként adhatjuk át.

Így ugyanaz a View különböző tartalmakat tud megjeleníteni.

## Követelményhelyzet

Például most egy beállításlistát szeretnénk készíteni.

Megjelenítési eredmény:

![view](../../../Resource/028_view.png)

Ebben a beállításlistában három különböző beállítási elem van: `Beállítások`, `Mappa`, `Zene`.

Bár az ikonjaik, színeik és címeik különböznek, az általános szerkezetük azonos:

- Ikon bal oldalon
- Az ikon háttérszíne
- Cím középen
- Nyíl jobb oldalon

Ha nem használunk egyéni View-t, valószínűleg így írnánk meg:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Beállítások")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Mappa")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Zene")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Ez a kód normálisan megjeleníthető, de a probléma is nagyon egyértelmű: a három beállítási elem kódja szinte teljesen azonos.

Csak az ikon, a szín és a cím különbözik:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Beállítások")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Mappa")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Zene")
```

Vagyis minden beállítási elem szerkezete rögzített, csak az ikon, a szín és a cím különbözik.

Ez a helyzet nagyon alkalmas egyéni View használatára.

### Árnyék shadow

Itt egy új modifier, a `.shadow(radius:)` szerepel:

```swift
.shadow(radius: 1)
```

A `.shadow(radius:)` árnyékot adhat a View-hoz.

A `radius` az árnyék elmosási sugarát jelenti. Minél nagyobb az érték, általában annál nagyobb az árnyék terjedési területe, és annál lágyabbnak látszik.

Itt az érték `1`, ami azt jelenti, hogy csak egy nagyon enyhe árnyékhatást adunk hozzá.

## A beállítási elem View becsomagolása

Ezután minden beállítási elemet egy új View-ba csomagolunk.

Létrehozhatunk egy `SettingItemView`-t:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Ebben a View-ban három property-t definiálunk:

```swift
let icon: String
let color: Color
let title: String
```

Ezek közül:

- az `icon` az ikon nevét jelenti
- a `color` az ikon háttérszínét jelenti
- a `title` a beállítási elem címét jelenti

Mivel ez a három tartalom különböző beállítási elemekben különbözik, olyan paraméterekké tesszük őket, amelyeket kívülről lehet átadni.

## Egyéni View használata

Miután megvan a `SettingItemView`, már nem kell újra és újra hosszú `HStack`-kódrészt írnunk.

Most így használhatjuk:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Beállítások")
```

Ez a kódsor azt jelenti, hogy létrehozunk egy beállítási elem View-t, és átadunk három paramétert:

```swift
icon: "gear"
color: Color.blue
title: "Beállítások"
```

Az átadás után a `SettingItemView` belső property-jei megkapják a megfelelő értékeket:

- az `icon` értéke `gear`
- a `color` értéke `Color.blue`
- a `title` értéke `"Beállítások"`

Ezért a View belsejében az `Image(systemName: icon)` fogaskerék ikont jelenít meg, a `.background(color)` kék hátteret használ, a `Text(title)` pedig a `Beállítások` szöveget jeleníti meg.

Teljes kód:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Beállítások")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Mappa")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Zene")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Megjelenítési eredmény:

![view](../../../Resource/028_view.png)

Látható, hogy a becsomagolás után a megjelenítés ugyanaz, mint korábban, de a kód világosabb lett.

Korábban minden beállítási elemhez egy teljes `HStack` szakaszt kellett írni, most viszont elég egyetlen kódsor:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Beállítások")
```

Ez az egyéni View szerepe: **becsomagolja az ismétlődő View-szerkezetet, és csak a különböző tartalmat adja át paraméterként.**

## Miért lehet paramétereket átadni

Ezután röviden megértjük, miért tud egy egyéni View paramétereket fogadni.

SwiftUI-ban a View lényegében egy struktúra.

Például:

```swift
struct ContentView: View {
    var body: some View {
        Text("Helló, világ!")
    }
}
```

Itt a `ContentView` egy struktúra.

Amikor ezt írjuk:

```swift
ContentView()
```

valójában egy `ContentView` View-t hozunk létre.

A mögötte lévő `()` az inicializáló metódus meghívását jelenti; ezt úgy is érthetjük, hogy létrehozzuk ezt a View-t.

Mivel ennek a `ContentView`-nak nincsenek kívülről átadandó property-jei, közvetlenül írhatjuk így:

```swift
ContentView()
```

Ha azonban a View-ban van olyan property, amelynek nincs értéke, akkor a View létrehozásakor át kell adni a megfelelő értéket.

Például:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("név: \(name)")
    }
}
```

Itt a `name` egy property, és nincs alapértelmezett értéke.

Ezért a `ContentView` létrehozásakor konkrét értéket kell adnunk a `name` számára:

```swift
ContentView(name: "Fang Junyu")
```

Így a View belsejében használni tudjuk ezt az értéket:

```swift
Text("név: \(name)")
```

Ez az oka annak is, hogy a `SettingItemView` létrehozásakor paramétereket kell átadnunk:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Beállítások")
```

Mert a `SettingItemView`-ban három alapértelmezett érték nélküli property van:

```swift
let icon: String
let color: Color
let title: String
```

Ezért a View létrehozásakor be kell adnunk ezeket. Az átadott paramétereket Swift a View belső property-jeinek értékadásához használja.

## Inicializáló metódus

Ezután egy kicsit mélyebben megértjük az inicializáló metódust.

### Alapértelmezett inicializáló metódus

Amikor egy egyszerű View-t definiálunk:

```swift
struct ContentView: View {
    var body: some View {
        Text("Helló, világ!")
    }
}
```

Ebben a kódban nem írtunk kézzel inicializáló metódust.

Amikor azonban ezt a View-t használjuk, így írhatjuk:

```swift
ContentView()
```

Itt a `()` valójában a `ContentView` létrehozását jelenti; úgy is érthetjük, hogy meghívjuk az inicializáló metódusát.

### Miért hívható meg, ha nem látunk inicializáló metódust?

Azért, mert a Swift compiler automatikusan létrehoz nekünk egy inicializáló metódust.

Fontos megjegyezni: **ez az inicializáló metódus automatikusan jön létre, és általában nem látjuk közvetlenül a kódban.**

Vagyis bár a `struct`-ban nem írtuk kézzel ezt:

```swift
init() {

}
```

a Swift compiler a háttérben körülbelül ilyen inicializáló metódust hoz létre nekünk:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Helló, világ!")
    }
}
```

Ezért írhatjuk közvetlenül ezt:

```swift
ContentView()
```

Ezért a valódi kódban általában nem kell kézzel kiírnunk az inicializáló metódust.

Csak egy dolgot kell megérteni: **amikor létrehozunk egy SwiftUI View-t, meghívódik az adott View inicializáló metódusa. Még ha nem is írunk kézzel inicializáló metódust, a Swift automatikusan létrehozhatja.**

### Paraméteres inicializáló metódus

Ha egy View-ban van alapértelmezett érték nélküli property, például:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("név: \(name)")
    }
}
```

a Swift compiler a property alapján automatikusan létrehoz egy paraméteres inicializáló metódust.

Ezt egyszerűen így érthetjük:

```swift
init(name: String) {
    self.name = name
}
```

Itt:

```swift
init(name: String)
```

azt jelenti, hogy a `ContentView` létrehozásakor át kell adni egy `String` típusú `name` paramétert.

Amikor ezt írjuk:

```swift
ContentView(name: "Fang Junyu")
```

azt jelenti: a `"Fang Junyu"` értéket paraméterként átadjuk az inicializáló metódusnak.

Ezután az inicializáló metódus belsejében ez fut le:

```swift
self.name = name
```

Ez a kódsor azt jelenti: a kívülről átadott `name` értéket hozzárendeljük az aktuális View saját `name` property-jéhez.

Egyszerűen így érthető:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("név: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Így a View belsejében használhatóvá válik az átadott érték.

Ez a paraméteres View inicializálási folyamata: **ha a View-ban lévő property-nek nincs alapértelmezett értéke, a View létrehozásakor át kell adni a megfelelő paramétert, hogy az inicializáló metódus elvégezze a property értékadását.**

## Amikor egy property-nek van alapértelmezett értéke

Ha a property-nek már van alapértelmezett értéke, akkor a View létrehozásakor nem muszáj paramétert átadni.

Például:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("név: \(name)")
    }
}
```

Itt a `name` már rendelkezik alapértelmezett értékkel:

```swift
"Fang Junyu"
```

Ezért a `ContentView` létrehozásakor közvetlenül írhatjuk:

```swift
ContentView()
```

Ekkor a `name` az alapértelmezett értéket használja, és a felület ezt jeleníti meg:

```swift
név: Fang Junyu
```

Természetesen a View létrehozásakor új értéket is átadhatunk:

```swift
ContentView(name: "Sam")
```

Ekkor a View nem az alapértelmezett értéket, hanem a kívülről átadott `"Sam"` értéket használja, és a felület ezt jeleníti meg:

```swift
név: Sam
```

A könnyebb megértés érdekében a Swift compiler által automatikusan létrehozott inicializáló metódust egyszerűen így képzelhetjük el:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Itt a `name: String = "Fang Junyu"` azt jelenti: ha a View létrehozásakor nem adunk át `name` értéket, akkor az alapértelmezett `"Fang Junyu"` értéket használja; ha új `name` értéket adunk át, akkor az átadott értéket használja.

Vagyis: **ha kívülről nem adunk át paramétert, a property alapértelmezett értéke kerül használatra; ha kívülről átadunk paramétert, az átadott érték kerül használatra.**

## Vissza a SettingItemView-hoz

Most nézzük meg újra a SettingItemView-t:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Ennek a View-nak a szerkezete rögzített.

A rögzített részek közé tartozik:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

A különböző részek közé tartozik:

```swift
icon
color
title
```

Ezért a különböző tartalmat property-vé tesszük, és a View létrehozásakor paraméterként adjuk át.

Amikor különböző beállítási elemeket hozunk létre, csak különböző paramétereket kell átadnunk:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Beállítások")
SettingItemView(icon: "folder", color: Color.brown, title: "Mappa")
SettingItemView(icon: "music.note", color: Color.purple, title: "Zene")
```

Így ugyanaz a `SettingItemView` három különböző beállítási elemet tud megjeleníteni.

Ez az egyéni View leggyakoribb használati módja.

## Összefoglalás

Ebben a leckében megtanultuk az egyéni View használatát.

Az egyéni View alapvető szerepe: **az ismétlődő View-kód becsomagolása, hogy újra felhasználható legyen.**

Ebben a példában a három beállítási elem szerkezete azonos, csak az ikon, a szín és a cím különbözik.

Ezért létrehoztunk egy `SettingItemView`-t:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Ezután a View használatakor különböző paramétereket adunk át:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Beállítások")
```

Az itt lévő paraméterek bekerülnek a `SettingItemView` belsejébe.

Ezzel a módszerrel kevesebb kóddal hozhatunk létre azonos szerkezetű, de különböző tartalmú View-kat.

Ez a SwiftUI-fejlesztésben is nagyon gyakori írásmód.
