# Élénk színek

Ebben a leckében a SwiftUI gyakori vizuális módosítóit tanuljuk meg, többek között:

- szín
- előtérszín
- háttérszín
- eltolás
- átlátszóság
- elmosás

Emellett a `Safe Area` biztonságos területével is foglalkozunk.

Ezek a módosítók a nézet vizuális megjelenését szabályozzák, hogy a felület tisztább és rétegzettebb legyen.

## Színek

SwiftUI-ban beállíthatjuk a szöveg színét.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

A `.blue` a kéket jelöli, valójában a `Color.blue` rövidített formája a típuskövetkeztetésnek köszönhetően.

Gyakori színek például:

```
.black
.green
.yellow
.pink
.gray
...
```

Ezek mind a `Color` statikus tulajdonságai.

![Color](../../RESOURCE/006_color.png)

A `Color` felfogható egy színtípusként, a `.blue`, `.red` és a többi pedig ennek konkrét színértékei.

### Color nézet

SwiftUI-ban a `Color` önmagában is megjeleníthető nézetként.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Ez a kód egy 100×100-as vörös négyzetet hoz létre.

Az egész felületet is kitöltheted egy adott színnel:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Futtatás után látható, hogy a piros nem tölti ki teljesen a kijelzőt: az iPhone tetején és alján továbbra is fehér sáv marad. Itt jelenik meg a `Safe Area` szerepe.

## Safe Area

A `Safe Area` a rendszer által fenntartott terület azért, hogy a tartalmat ne takarják ki, ide tartozik:

1. a felső állapotsáv, például az idő és az akkumulátor kijelzése

2. az alsó Home-jelző sáv

3. a notch vagy a `Dynamic Island` területe

![Color](../../RESOURCE/006_color3.png)

A SwiftUI alapértelmezés szerint a tartalmat a biztonságos területen belül tartja, ezért a nézet nem nyúlik ki a képernyő széleiig.

### A Safe Area figyelmen kívül hagyása

Ha azt szeretnéd, hogy a szín kitöltse az egész kijelzőt, használhatod az `ignoresSafeArea` módosítót:

```swift
Color.red
    .ignoresSafeArea()
```

Vagy az `edgesIgnoringSafeArea` módosítót:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Így a nézet az egész képernyőre kiterjed.

Fontos megjegyezni, hogy az `edgesIgnoringSafeArea` a régebbi írásmód, iOS 14 óta pedig inkább az `ignoresSafeArea` használata ajánlott.

## Előtérszín

### foregroundStyle módosító

Korábbi leckékben már megismertük a `foregroundStyle` használatát színek beállítására.

Például:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

A `foregroundStyle` az újabb stílusrendszer része, amely támogatja a színeket, átmeneteket, anyaghatásokat és más megoldásokat is.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor módosító

A `foregroundColor` szintén használható szín beállítására:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Használata nagyon hasonlít a `foregroundStyle`-hoz.

Az újabb Xcode-verziókban az Xcode figyelmeztethet arra, hogy a `foregroundColor` a jövőbeni iOS-verziókban elavulttá válhat, ezért érdemesebb a `foregroundStyle`-t előnyben részesíteni.

## Háttér

Ha egy nézethez háttérszínt szeretnél adni, használhatod a `background` módosítót:

```swift
background(.red)
```

Például adjunk háttérszínt egy szövegnek:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Amikor Wordben, Chrome-ban vagy más alkalmazásokban kijelölünk szöveget, hasonló háttérszínes hatást láthatunk.

![Color](../../RESOURCE/006_color16.png)

Ha azt szeretnéd, hogy a háttér nagyobb legyen, kombináld `padding`-gel:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Itt figyelni kell egy fontos szabályra:

A SwiftUI módosítók felülről lefelé építik fel a nézetet. A később írt módosítók az addig elkészült eredményre hatnak.

Tehát:

```swift
.padding()
.background()
```

Ez azt jelenti, hogy a háttér már a belső margóval kibővített nézetet fogja körülölelni.

Ha a sorrendet megfordítod:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

A háttér nem fog nagyobb lenni, mert a háttér még nem a későbbi `padding` eredményére kerül rá.

## Példa - négyszögletes anya

Most készítsünk egy egyszerű, négyszögletes anya-szerű nézetet.

![Color](../../RESOURCE/006_color8.png)

Először készítsünk egy 50 × 50-es fehér négyzetet:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Ha kör alakúvá szeretnéd alakítani, használhatod a `cornerRadius`-t:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Ha a sarokkerekítés sugara megegyezik a szélesség és magasság felével, a nézet kör alakú lesz.

Most adjunk hozzá egy kék hátteret:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Az új `padding` megnöveli a külső területet, a `background` pedig ezen a külső területen rajzolja meg a kék hátteret.

Így elkészült egy négyszögletes anya-szerű hatás.

### Egy másik megközelítés

A háttérszínes megoldás mellett `ZStack`-kel is elkészíthető ugyanez.

Korábban megtanultuk, hogy a `ZStack` egymásra helyezett elrendezést biztosít. A négyszögletes anya felfogható úgy is, mint egy kör és egy téglalap egymásra helyezve.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

A `ZStack` a nézeteket sorrendben egymásra helyezi, és a később hozzáadott nézet jelenik meg felül.

## Példa - két átfedő kör

Sok ikon egyszerű alakzatok egymásra helyezéséből áll, például két átfedő körből.

![Color](../../RESOURCE/006_color14.png)

Először hozzunk létre két kört:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Mivel azt szeretnénk, hogy a két kör egymásra kerüljön, `ZStack` elrendezést használunk:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Ekkor a két azonos méretű kör teljesen lefedi egymást.

Nekünk arra van szükségünk, hogy csak részben fedjék egymást, ne teljesen. Ehhez `offset` segítségével hozhatunk létre eltolást.

## Eltolás

Az `offset` csak a nézet kirajzolt pozícióját módosítja, a szülőnézet elrendezési számításait nem.

Használata:

```swift
.offset(x:y:)
```

Az `x` vízszintes, az `y` függőleges eltolást jelent.

A pozitív érték jobbra vagy lefelé, a negatív érték balra vagy felfelé mozdítja a nézetet.

Az `offset` használatával a két kört részben átfedővé tehetjük:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

A vörös kör elrendezésbeli helye nem változik meg, de a kirajzolása 25 ponttal balra kerül. Emiatt a két kör részben átfedi egymást.

## Átlátszóság

SwiftUI-ban az `opacity` a nézet átlátszóságát állítja.

Alap használat:

```swift
.opacity(0.5)
```

Az `opacity` paramétere 0.0 és 1.0 közé esik, ahol:

- 0 teljesen átlátszó
- 1 teljesen átlátszatlan

Az `opacity` segítségével beállíthatjuk a narancssárga kör átlátszóságát:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Ha a narancssárga kör `opacity` értéke 0.8, akkor 80%-os átlátszatlansággal jelenik meg, és amikor a két kör átfedi egymást, az átfedő rész színkeveredési hatást hoz létre.

## Elmosás

SwiftUI-ban a `blur` módosítóval elmosási hatást adhatunk:

```swift
.blur(radius:10)
```

A `radius` határozza meg az elmosás sugarát. Minél nagyobb ez az érték, annál erősebb lesz az elmosás.

Adjunk elmosást a két körhöz:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Végül két erősen elmosott kört fogunk látni.

## Összegzés

Ebben a leckében a SwiftUI gyakori vizuális módosítóira összpontosítottunk, és azt tanultuk meg, hogyan szabályozható a nézet színe, pozíciója és vizuális hatása különböző módosítók segítségével.

Konkrét példákon keresztül láthattuk, hogy a különböző vizuális módosítók hogyan működnek a felületen, és közben a biztonságos terület fogalmát is megértettük.

Ezek nagyon alapvető módosítók, ezért érdemes sokat gyakorolni és használni őket, mert a valódi fejlesztésben segítenek pontosabban szabályozni a felület megjelenését.

### Lecke utáni gyakorlás

- adj átlátszóságot és elmosást egy képhez
- állíts be három, különböző átlátszóságú, egymásra helyezett kört
- készíts teljes képernyőt kitöltő háttérképet, és hagyd figyelmen kívül a biztonságos területet
- több nézet pozícióját állítsd be `offset` segítségével

A gyakorlás célja nem az API-k bemagolása, hanem annak megfigyelése, hogyan kapcsolódnak össze a vizuális változások és az elrendezési viselkedés.
