# Fill Light alkalmazás

Ebben a leckében egy nagyon érdekes fill light alkalmazást fogunk készíteni. Amikor leszáll az este, a telefon képernyőjén különböző színeket jeleníthetünk meg, és egyszerű derítőfényként használhatjuk.

Ez a fill light alkalmazás a képernyő megérintésével képes színt váltani, és egy csúszkával a fényerőt is be tudja állítani.

Ebben a példában megtanuljuk, hogyan használjuk a `brightness` módosítót a nézet fényerejének állítására, az `onTapGesture` használatát koppintási gesztus hozzáadására, valamint a `Slider` vezérlőt.

Eredmény:

![Color](../../Resource/018_color.png)

## Szín megjelenítése

Először is jelenítsünk meg egy színt a nézetben.

SwiftUI-ban a `Color` nemcsak egy színt jelent, hanem nézetként is megjeleníthető:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Itt a `Color.red` egy piros nézetet jelent. Az `.ignoresSafeArea()` azt eredményezi, hogy a színnézet kitölti a teljes képernyőt, így inkább valódi fill light hatást kelt.

Eredmény:

![Color](../../Resource/018_color1.png)

### Színtömb és index

Jelenleg csak egyetlen szín látható. Egy fill light viszont általában nem csak egyféle színt használ. Megjeleníthet kéket, sárgát, lilát, fehéret és más színeket is.

Azt szeretnénk, hogy a képernyő megérintésekor különböző színek között tudjunk váltani. Ezeket a színeket egy tömbbe tehetjük az egységes kezelés érdekében:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

A tömb alkalmas "azonos típusú adatok csoportjának" tárolására. Itt a tömb minden eleme egy `Color`.

Ha egy adott színt szeretnénk megjeleníteni, használhatunk indexet:

```swift
colors[0]
```

Ez azt jelenti, hogy a tömb `0` indexű elemét olvassuk ki, vagyis az első színt.

Most a kód így írható:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Így a képernyő a tömb első színét fogja megjeleníteni, vagyis a pirosat.

### Az index használata a szín vezérlésére

Ha különböző színek között kell váltanunk, akkor egy változóra van szükségünk az index kezelésére, ahelyett hogy az indexet fixen írnánk be.

Az index tárolására használhatunk egy `@State` változót:

```swift
@State private var index = 0
```

Itt az `index` az aktuális szín indexét jelenti.

Amikor az `index` megváltozik, a SwiftUI újraszámolja a felületet, és frissíti a megjelenített tartalmat.

Ezután a korábbi `colors[0]` helyett ezt írjuk:

```swift
colors[index]
```

Így a nézetben megjelenő színt az `index` határozza meg.

Most a kód így néz ki:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Amikor az `index` változik, a `colors[index]` is más színt fog megjeleníteni.

Például:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Fontos megjegyezni, hogy az `index` nem lépheti túl a tömb legnagyobb indexét, különben határon kívüli indexelési hiba történik.

## Koppintási gesztus

Most már különböző színeket jeleníthetünk meg az `index` alapján, de még nem tudunk koppintással váltani közöttük.

A korábbi „Idézet körhinta” leckében a `Button` segítségével vezéreltük az idézetek váltását.

Most viszont azt szeretnénk, hogy „a teljes színes területre koppintva” váltsunk színt, ezért az `onTapGesture` megfelelőbb.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Amikor a színnézetre koppintunk, ez a kód fut le:

```swift
index += 1
```

Ez azt jelenti, hogy az `index` értéke `1`-gyel növekszik. Miután az index nőtt, a `colors[index]` a tömb következő színét fogja megjeleníteni.

### `onTapGesture`

Az `onTapGesture` egy gesztusmódosító, amely koppintási műveletet ad egy nézethez.

Alapvető használat:

```swift
.onTapGesture {
    // code
}
```

Például:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Amikor erre a piros nézetre koppintunk, a kapcsos zárójelek közötti kód lefut, és ez jelenik meg a konzolban:

```swift
Click color
```

Az `onTapGesture` segítségével meghatározhatjuk, mi történjen egy nézet megérintése után.

### Különbség a `Button`-hoz képest

Korábban megismertük a `Button` nézetet. A `Button` és az `onTapGesture` egyaránt kezelhet koppintási műveleteket, de a felhasználási helyzeteik nem teljesen azonosak.

Az `onTapGesture` inkább arra alkalmas, hogy „egy meglévő nézethez koppintási funkciót adjunk”, például `Color`, `Image`, `Text` vagy más általános nézet esetén.

A `Button` inkább akkor megfelelő, amikor egy egyértelmű gombot szeretnénk megjeleníteni, például „Megerősítés”, „Küldés” vagy „Törlés”.

Ebben a fill light alkalmazásban azt szeretnénk, hogy a színváltás egyszerűbb legyen. A teljes színes terület megérintése vált színt, ezért itt az `onTapGesture` jó választás.

## Az index problémája

Most már a képernyő megérintésével különböző színek között tudunk váltani.

Van azonban itt egy fontos probléma: **az index túllépheti a tömb tartományát**.

Például:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Ha továbbra is a képernyőt koppintjuk, az `index` végül `4` lesz, és ekkor „index out of range” hiba történik.

Ennek az az oka, hogy a `colors` tömbben `4` elem van, de az indexelés `0`-tól kezdődik, ezért az érvényes indextartomány `0 - 3`, nem pedig `4`.

Ha elérjük a `colors[4]` elemet, „index out of range” hiba történik.

A jelenlegi kódban minden koppintás `1`-gyel növeli az `index` értékét. Ha ezt nem kezeljük, végül biztosan túl fog menni az érvényes tartományon.

Ezért a képernyő megérintésekor ellenőriznünk kell az indexet: ha már az utolsó színnél járunk, vissza kell térni az első színhez, különben tovább növeljük `1`-gyel.

Ezt egy `if` utasítással valósíthatjuk meg:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Ebben a kódban a `colors.count` a tömb elemeinek számát jelenti.

A jelenlegi tömbben 4 szín van, tehát:

```swift
colors.count // 4
```

De a legnagyobb index nem `4`, hanem `3`, mert az indexelés `0`-tól indul.

Ezért az utolsó indexet így kell írni:

```swift
colors.count - 1
```

Vagyis:

```swift
4 - 1 = 3
```

Ez a logika azt jelenti: ha az aktuális index már az utolsó színhez tartozik, állítsd vissza az indexet `0`-ra; különben növeld `1`-gyel.

Így a színek körkörösen válthatók.

### Az indexlogika egyszerűsítése

Ha tömörebbé szeretnénk tenni a kódot, használhatjuk a ternáris operátort is:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Ez a kód azt jelenti: ha az `index == colors.count - 1` igaz, akkor `0` legyen az eredmény. Ha nem igaz, akkor `index + 1`.

Végül az eredményt visszaadjuk az `index` változónak.

Most már elérhetjük a színváltás hatását.

Teljes kód:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Most már a képernyőre koppintva különböző színek között tudunk váltani. Egy alapvető fill light alkalmazás elkészült.

## A szín nevének megjelenítése

Hozzáadhatunk még egy szövegcsoportot, amely a színeknek felel meg, így amikor a szín megváltozik, a képernyőn a szín aktuális neve is megjelenik.

Például:

- A piros `Red`-et jelenít meg
- A kék `Blue`-t jelenít meg
- A sárga `Yellow`-t jelenít meg
- A lila `Purple`-t jelenít meg

Itt is használhatunk egy tömböt a színnevek tárolására:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Ebben a tömbben a szövegek sorrendjének pontosan meg kell egyeznie a színtömb színeinek sorrendjével.

Ezután `Text` segítségével megjeleníthetjük az aktuális indexhez tartozó szín nevét:

```swift
Text(colorsName[index])
```

A `Text` az aktuális szín nevét jeleníti meg az `index` alapján.

Használjunk módosítókat a `Text` megjelenésének javítására:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Ez azt eredményezi, hogy a `Text` fehér színnel, címsormérettel és vastag betűvel jelenik meg.

Most már van egy teljes képernyős `Color` nézetünk. Ha azt szeretnénk, hogy a `Text` a `Color` nézet fölött jelenjen meg, akkor a `ZStack` elrendezési tárolót kell használnunk, hogy egymásra helyezzük őket.

```swift
ZStack {
    Color
    Text
}
```

Így a kód a következő lesz:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Így a háttér a színnézet lesz, fölé pedig egy szöveges nézet kerül.

Eredmény:

![Color](../../Resource/018_color2.png)

Fontos megjegyezni, hogy a `ZStack`-ben a később írt nézetek általában elöl jelennek meg. Ha a `Text` a `Color` előtt szerepel, a később írt `Color` nézet eltakarhatja a `Text`-et.

## A fényerő szabályozása

Most már különböző színeket tudunk váltani, de a fill lightnak van egy másik fontos funkciója is: **a fényerő beállítása**.

SwiftUI-ban a `brightness` módosítóval szabályozhatjuk egy nézet fényerejét.

Például:

```swift
.brightness(1)
```

Ezt írhatjuk:

```swift
colors[index]
    .brightness(0.5)
```

Ez az aktuális színt világosabbá teszi, és közelebb viszi a fill light hatáshoz.

A fényerő tartománya `0 - 1`. A `0` azt jelenti, hogy az eredeti színt megtartjuk, és minél közelebb van az érték az `1`-hez, annál világosabb lesz a szín. Az `1` a legvilágosabb fehér eredményt jelenti.

Bár a `brightness` értékét a kódban szabályozhatjuk, a felhasználó még mindig nem tudja közvetlenül maga állítani.

Ezért hozzá kell adnunk egy húzható vezérlőt: a `Slider`-t.

## `Slider` nézet

SwiftUI-ban a `Slider` egy vezérlő, amely egy érték kiválasztására szolgál egy tartományon belül. Az Apple úgy írja le, mint „egy vezérlő egy érték kiválasztására egy határolt lineáris tartományból”.

Alapvető használat:

```swift
Slider(value: $value, in: 0...1)
```

A paraméterek magyarázata:

1. `value: $value`: a `Slider`-t egy változóhoz kell kötni.

    Amikor a csúszkát mozgatjuk, a változó értéke is ugyanakkor változik. Fordítva, ha a változó megváltozik, a csúszka is frissül.

    Ez nagyon hasonlít a korábban tanult `TextField`-hez. Mindkettő „egy vezérlőt köt egy változóhoz”.

    A kötött változó előtt a `$` szimbólumnak kell állnia, hogy a kötést jelezze.

2. `in: 0...1`: ez a paraméter a csúszka értéktartományát jelenti.

    Itt a `0...1` azt jelenti, hogy a legkisebb érték `0`, a legnagyobb pedig `1`.

    Amikor a csúszkát teljesen balra húzzuk, a kötött változó közel lesz a `0`-hoz; amikor teljesen jobbra húzzuk, közel lesz az `1`-hez.

Például:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

A `Slider` a `value` változóhoz van kötve. Amikor a csúszkát mozgatjuk, a `value` változó értéke is ugyanakkor változik.

Megjelenés:

![Slider](../../Resource/018_slider.png)

Amikor a `Slider` balra mozdul, a kötött `value` értéke `0` lesz. Amikor jobbra mozdul, `1` lesz.

### Értéktartomány

A `Slider` értéktartománya nem rögzített. Írható így is:

```swift
0...100
```

vagy más tartományként.

Ebben a fill light alkalmazásban viszont a fényerőt kell szabályoznunk, ezért a `0...1` a legmegfelelőbb választás.

## A `Slider` használata a fényerő szabályozására

Most össze kell kapcsolnunk a `Slider`-t a `brightness`-szel.

Először hozzunk létre egy változót a fényerő értékének tárolására:

```swift
@State private var slider = 0.0
```

Itt a `0.0` egy `Double` típusú érték.

Mivel a `Slider` általában numerikus típushoz van kötve, és itt azt szeretnénk, hogy folyamatosan változzon, a `Double` alkalmasabb. Emellett a `brightness` csak `Double` típusú értéket fogad el.

Ezután adjuk át ezt az értéket a `brightness`-nek:

```swift
colors[index]
    .brightness(slider)
```

Amikor `slider == 0`, a szín az alapértelmezett állapotában marad. Minél közelebb van a `slider` az `1`-hez, annál világosabbnak látszik a szín.

### A `Slider` vezérlő hozzáadása

Ezután adjunk hozzá egy `Slider` vezérlőt a változó módosításához:

```swift
Slider(value: $slider, in: 0...1)
```

Amikor a csúszka változik, a `slider` értéke is változik, és a `brightness(slider)` ugyanakkor frissíti a fényerőt.

Ez egy nagyon tipikus példája annak, hogy SwiftUI-ban „a változók vezérlik a nézetet”.

### A `Slider` megjelenésének beállítása

Alapértelmezés szerint a `Slider` az elérhető szélességet használja.

Adhatunk neki fix szélességet:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Ezután adjunk hozzá még néhány módosítót, hogy jobban látható legyen:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Ez fehér hátteret és lekerekített sarkokat ad a csúszkának, így jobban kiemelkedik a `Color` nézeten.

Végül helyezzük a képernyő aljára.

Mivel már használjuk a `ZStack`-et, elhelyezhetünk benne egy `VStack`-et, és a `Spacer()` segítségével lenyomhatjuk a `Slider`-t az aljára.

## Teljes kód

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Eredmény:

![Color](../../Resource/018_color.png)

## Összefoglalás

Az eddig tanult ismereteket, valamint az olyan alapfogalmakat, mint a színek és a tömbök, felhasználva elkészítettünk egy nagyon érdekes fill light alkalmazást.

Ezen az alkalmazáson keresztül megtanultuk, hogyan használjuk a `brightness` módosítót a fényerő állítására, az `onTapGesture`-t a koppintási műveletek hozzáadására, valamint a `Slider` vezérlőt.

Hozzáadtuk az `onTapGesture`-t a `Color` nézethez a színek váltásához. A `Slider` vezérlőt is használtuk egy olyan változó módosítására, amely a `brightness` értékét kezeli, ami újabb példája annak, hogy „a változók vezérlik a nézetet”.

Átismételtük a ternáris operátort is, használtuk a `ZStack`-et a nézetek egymásra helyezésére, és tömböket használtunk azonos típusú adatok csoportjának kezelésére. Ez segít elmélyíteni a tömbökről és indexekről alkotott megértésünket, beleértve a határon kívüli indexhibák elkerülésének gyakorlati problémáját is.

Bár ez a példa nem bonyolult, sok olyan alapötletet kapcsol össze, amelyeket korábban tanultunk. Amikor ezek egy kis valódi projektben együtt jelennek meg, könnyebb megérteni, mire szolgál egy-egy fogalom.

### Valós használati forgatókönyv

Képzeld el, hogy egy régi iPhone-t az asztalra teszel, és a saját magad által készített fill light alkalmazással vezérled a fény színét. Ez nagyon jó élmény lenne.

Az App Store-ban sok „fill light” alkalmazás található, és ezek sem tűnnek túl bonyolultnak.

![AppStore](../../Resource/018_appStore.PNG)

Elkezdhetünk egyszerű alkalmazásokat fejleszteni, és megpróbálhatjuk őket közzétenni az App Store-ban. Ez nemcsak a fejlesztés iránti érdeklődésünket növeli, hanem a fejlődésünket is rögzíti.

### Gyakorlás az óra után

Tovább gondolkodhatsz azon, hogyan lehetne ezt a fill light alkalmazást bővíteni, például:

- Több szín hozzáadása
- Az aktuális fényerő értékének megjelenítése
- Az alsó csúszkaterület kinézetének javítása

Amikor valóban elkezded használni ezt a tudást, rá fogsz jönni, hogy minden fogalom, amit megtanulunk, valójában egy eszköz alkalmazások létrehozásához.

Minél több eszközt sajátítunk el, annál több funkciót tudunk létrehozni.
