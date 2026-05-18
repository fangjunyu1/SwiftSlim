# Egyéni színek

Ebben a leckében megtanuljuk, hogyan használhatunk egyéni színeket SwiftUI-ban.

Az előző leckékben már használtuk a SwiftUI által biztosított alapértelmezett színeket, például:

```swift
Color.blue
Color.red
Color.green
```

Ezeket a színeket kényelmes használni, de valódi App-fejlesztésben az alapértelmezett színek gyakran nem elég pontosak.

Például egy tervben ilyen színek szerepelhetnek:

```text
#2c54c2
#4875ed
#213e8d
```

Az ilyen színt Hex színnek nevezzük.

Ebben a leckében először elérjük, hogy a SwiftUI támogassa a Hex színeket, majd a gyakran használt színeket `static` segítségével rendezzük.

Végül az egyéni színeket alkalmazzuk az állatenciklopédia nézetben, és tovább használunk gradiens hátteret, hogy a gombok rétegzettebbnek tűnjenek.

## Miért van szükség egyéni színekre?

SwiftUI-ban közvetlenül használhatjuk a rendszerszíneket.

Például:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Itt a `.blue` kéket jelent. Ez valójában a `Color.blue` rövidített írásmódja.

Az alapértelmezett színek előnye, hogy egyszerűek és kényelmesek, de a választható színek száma korlátozott.

Például:

```swift
Color.blue
```

Ez csak a SwiftUI által biztosított alapértelmezett kéket tudja jelölni.

![Color.blue](../../../Resource/031_color6.png)

A tényleges fejlesztésben azonban gyakran konkrétabb színekre van szükségünk.

Például még a kék színen belül is lehet világoskék, sötétkék, szürkéskék, élénk kék és más hatás.

![More Blue](../../../Resource/031_color5.png)

Ilyenkor, ha csak a `Color.blue` értéket használjuk, nehéz lesz visszaadni a tervezett hatást.

Ezért el kell érnünk, hogy a SwiftUI támogassa az egyéni színeket.

## Mi az a Hex szín?

A képernyőn megjelenő színek általában három csatornából állnak: pirosból, zöldből és kékből. Ez az RGB.

Az RGB jelentése:

```text
Red     // Piros
Green   // Zöld
Blue    // Kék
```

A Hex szín az RGB színek egyik jelölési módja.

Például:

```swift
#5479FF
```

Ezt a színértéket egyszerűen három részre bonthatjuk:

```text
54  // A piros csatornát jelöli
79  // A zöld csatornát jelöli
FF  // A kék csatornát jelöli
```

Ebben a leckében nem kell kiszámolnunk ezeket az értékeket, és nem kell mélyen megértenünk a tizenhatos számrendszer szabályait sem.

Most csak azt kell tudnunk, hogy a `#5479FF` egy konkrét színt jelöl.

Később, amikor a `#2c54c2` vagy a `#4875ed` formához hasonló írásmódot látunk, először színértékként értelmezhetjük.

A Sketch, Figma, Photoshop és más tervezőeszközökben is gyakran találkozhatunk hasonló színértékekkel.

![color](../../../Resource/031_color.png)

A SwiftUI azonban alapértelmezetten nem támogatja, hogy ezt közvetlenül így írjuk:

```swift
Color(hex: "#5479FF")
```

Ezért nekünk kell kibővítenünk a `Color` típust, hogy támogassa színek létrehozását Hex karakterláncból.

## A Color+Hex.swift fájl létrehozása

Először hozzunk létre egy új Swift fájlt.

A fájl neve lehet:

```text
Color.swift
```

Írhatjuk egyértelműbben így is:

```text
Color+Hex.swift
```

Itt inkább ezt javasolt használni:

```text
Color+Hex.swift
```

Swift projektekben nagyon gyakoriak az olyan fájlnevek, mint a `Color+Hex.swift`.

Ez azt jelzi, hogy ez a fájl egy olyan kiterjesztésfájl, amely Hex képességet ad a `Color` típushoz.

A fájlnév nem befolyásolja közvetlenül a kód futását. Csak abban segít, hogy könnyebben megértsük a fájl célját.

## A Color(hex:) kód hozzáadása

A `Color+Hex.swift` fájlba írjuk be az alábbi kódot:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Ez a kód az `extension` segítségével kibővíti a `Color` típust, és egy új inicializálót ad a `Color` típushoz:

```swift
init(hex: String)
```

Miután rendelkezünk ezzel az inicializálóval, átadhatunk egy Hex karakterláncot a `Color` számára, és így egyéni színt hozhatunk létre:

```swift
Color(hex: "#5479FF")
```

A kiterjesztés kódján belül a Hex karakterlánc olyan RGB színné alakul, amelyet a SwiftUI felismer.

Ebben a szakaszban nem kell mélyen megértened minden sor átalakítási logikáját. Elég tudnod, hogy a hozzáadott `Color(hex:)` metódus lehetővé teszi egyéni színek létrehozását Hex színértékekből.

## Egyéni színek használata

Most tesztelhetjük az egyéni színeket a `ContentView` nézetben.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Megjelenési eredmény:

![color](../../../Resource/031_color1.png)

Ebben a példában az első sor rendszerszínt használ:

```swift
.foregroundStyle(Color.blue)
```

A következő három sor egyéni Hex színeket használ:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Az összehasonlításból láthatjuk, hogy a rendszerszintű kéknek csak egy alapértelmezett hatása van.

A Hex színek viszont a kék részletesebb árnyalatváltozatait is ki tudják fejezni.

Ez az egyéni színek értéke: közelebb vihetik a felület színeit a valódi tervhez, és könnyebbé teszik az App vizuális stílusának irányítását.

## Színek rendezése static segítségével

Most már létre tudunk hozni színeket Hex karakterláncokból:

```swift
Color(hex: "#2c54c2")
```

Ez az írásmód megfelelően működik, de ha ugyanaz a szín több helyen ismétlődik, a későbbi karbantartás kényelmetlenné válik.

Ha ezt a színértéket 10 különböző helyre írjuk be, később, amikor módosítani szeretnénk ezt a kéket, egyenként kell átírnunk.

Ilyenkor a `static` segítségével egy helyre rendezhetjük a gyakran használt színeket.

A `Color+Hex.swift` fájl alján folytassuk az alábbi kód hozzáadásával:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Itt három statikus tulajdonságot adtunk a `Color` típushoz: `animalBlue`, `animalLightBlue` és `animalDarkBlue`. Ezek különböző mélységű kék árnyalatokat jelölnek.

Mivel ezek a tulajdonságok `static` használatával készültek, magához a `Color` típushoz tartoznak.

Használatkor közvetlenül a `Color.` előtagon keresztül érhetjük el őket:

```swift
Color.animalBlue
```

Ez az írásmód egyértelműbb, mint közvetlenül Hex karakterláncot írni.

Amikor a `Color.animalBlue` kódot látjuk, tudhatjuk, hogy az állatenciklopédiában használt kéket jelöli.

Amikor viszont a `Color(hex: "#2c54c2")` kódot látjuk, csak azt tudjuk, hogy ez egy színérték, de nem könnyű megmondani a konkrét felhasználási célját.

A színek egységes kezelése még egy előnnyel jár: később könnyebb módosítani őket.

Ha módosítani szeretnénk az állatenciklopédia fő színét, csak a definíció helyét kell átírnunk:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Minden hely, ahol ezt a színt használjuk, együtt frissül.

Ez a `static` használatának értelme a színek rendezésében: egyértelműbbé teszi a színneveket, és kényelmesebbé teszi a későbbi karbantartást.

## Alkalmazás az állatenciklopédiában

Most alkalmazhatjuk az egyéni színeket a korábbi állatenciklopédia nézetben.

Korábban az állatgomb háttere fehér volt:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Most átállíthatjuk egyéni színre:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Itt a `Color.animalBlue` az a statikus szín, amelyet az imént a `Color+Hex.swift` fájlban definiáltunk.

A gomb szövege fehér színt használ:

```swift
.foregroundStyle(Color.white)
```

Az állat emoji háttere áttetsző fehéret használ:

```swift
.background(Color.white.opacity(0.15))
```

Így a gomb egységes kék vizuális stílust kap.

Ennek a lépésnek nem az a lényege, hogy bonyolult kódot adjunk hozzá, hanem hogy a korábban megtanult egyéni színeket valóban alkalmazzuk a felületen.

## Gradiens háttér használata

Egyetlen szín használata mellett több színt is kombinálhatunk gradiens hatássá.

Például korábban ezeket a színeket definiáltuk:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Ezek a színek nemcsak külön-külön használhatók, hanem gradiens háttérré is kombinálhatók.

SwiftUI-ban a `LinearGradient` segítségével hozhatunk létre lineáris gradienst.

Például:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Ez a kód balról jobbra haladó gradiens hátteret hoz létre, ahol a szín fokozatosan a `Color.animalBlue` értékről a `Color.animalLightBlue` értékre vált.

Itt a `colors` állítja be a gradiensben részt vevő színeket, a `startPoint` és az `endPoint` pedig a gradiens irányát szabályozza.

### A gradiens hatás tesztelése

Egy egyszerű Text segítségével tesztelhetjük a gradiens hátteret.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Megjelenési eredmény:

![color](../../../Resource/031_color3.png)

Ebben a példában a `Text` háttere már nem egyetlen szín. Ehelyett balról jobbra fokozatosan változó gradiens szín.

Egy normál háttérszínhez képest a gradiens háttér rétegzettebb hatást ad, és könnyebben hoz létre vizuális fókuszt a felületen.

## Gradiens háttér használata az állatenciklopédiában

Most módosíthatjuk az állatgomb háttérszínét:

```swift
.background(Color.animalBlue)
```

Gradiens háttérre:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

A teljes kód a következő:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Megjelenési eredmény:

![color](../../../Resource/031_color4.png)

Most az állatgomb már nem csak egyetlen háttérszínt használ. Ehelyett balról jobbra haladó gradiens hatása van.

Az egyszínű háttérhez képest a gradiens háttér rétegzettebbé teheti a felületet, és közelebb viheti egy valódi App vizuális tervéhez.

## Az egyszínű háttér és a gradiens háttér különbsége

Az egyszínű háttér csak egyetlen színt használ.

Például:

```swift
.background(Color.animalBlue)
```

Ez az írásmód egyszerű és világos, és a legtöbb alapfelülethez megfelelő.

A gradiens háttér több színt használ.

Például:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Ez az írásmód rétegzettebbé teheti a felületet, de könnyebben növelheti a vizuális összetettséget is.

Ezért a tényleges fejlesztésben így érdemes érteni:

Az egyszínű háttér normál szövegekhez, normál gombokhoz, normál kártyákhoz és normál oldalhátterekhez alkalmas.

A gradiens háttér kiemelt gombokhoz, felső területekhez, borítókártyákhoz, funkcióbelépőkhöz és más olyan helyekhez alkalmas, amelyeket hangsúlyozni kell.

## Összegzés

Ebben a leckében megtanultuk, hogyan használhatunk egyéni színeket SwiftUI-ban.

Először megismertük a Hex színeket.

Például:

```text
#2c54c2
```

Ez egy konkrét színt jelöl.

Ezután az `extension Color` segítségével kibővítettük a `Color` típust.

Ez lehetővé teszi, hogy a SwiftUI a következő módon hozzon létre színeket:

```swift
Color(hex: "#2c54c2")
```

Ezután a `static` segítségével rendeztük a gyakran használt színeket:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Így más nézetekben közvetlenül használhatjuk:

```swift
Color.animalBlue
```

Ahhoz képest, hogy minden alkalommal Hex karakterláncot írnánk, ez a megközelítés egyértelműbb, és kényelmesebbé teszi a színek későbbi egységes módosítását.

Végül megismertük a `LinearGradient` használatát, és az egyéni színeket gradiens háttérré kombináltuk:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Ezzel a leckével végigmentünk azon a folyamaton, amely az „egyéni színek létrehozásától” a „színek valódi felületen történő használatáig” vezet.

Később, amikor egy színt több helyen ismételten kell használni, először érdemes megfontolni, hogy a `Color` kiterjesztésében rendezzük el.

Így a kód világosabb lesz, és a felület stílusa is könnyebben egységesíthető.
