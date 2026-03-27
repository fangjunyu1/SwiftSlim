# Tegyük működőképessé a gombot

Ebben a leckében elsősorban a `Button` gombot, a `print` kimenetet hibakeresési információkhoz, valamint a Swift függvényeket tanuljuk meg.

Ezek a SwiftUI interaktív programozásának alapjai.

## Gomb

A gomb az egyik leggyakoribb UI-vezérlőelem. Ha le kell töltenünk valamit, meg kell nyitnunk vagy ki kell lépnünk, általában egy gombra kattintunk.

Például az App Store-ban a „Get” gombra kattintva tölthetünk le alkalmazást.

![Button](../../RESOURCE/008_button.png)

SwiftUI-ban a gombot a `Button` jelöli.

Alap használat:

```swift
Button("") {
    
}
```

A szerkezet két részre bontható:

```swift
Button("Gomb szövege") {
    A gomb megnyomásakor végrehajtandó kód
}
```

Például:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Futtatás után megjelenik egy `Start` gomb.

![Button](../../RESOURCE/008_button1.png)

Amikor a felhasználó megnyomja a gombot, a `{}` közötti kód végrehajtódik.

Fontos megjegyezni: a `Button` a SwiftUI felületi vezérlőelemeihez (`View`) tartozik, ezért a `body`-ban kell szerepelnie.

### buttonStyle módosító

SwiftUI-ban a `Button` rendszer által biztosított gombstílusokat kínál, amelyek a `buttonStyle` módosítóval használhatók.

Például:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

A `buttonStyle` a rendszer által biztosított gombmegjelenést alkalmazza.

Gyakori lehetőségek:

- .automatic
- .plain
- .bordered
- .borderedProminent
- .borderless

![Button](../../RESOURCE/008_button7.png)

A különböző stílusok főként abban térnek el, hogy van-e keret, háttér, és mennyire hangsúlyos a vizuális megjelenésük.

## print kimenet

Programozás közben gyakran szükség van arra, hogy ellenőrizzük, eljut-e a program egy adott kódrészhez.

A Swift a `print` függvényt biztosítja hibakeresési információk kiírására.

Alapírásmód:

```swift
print("Hello")
```

Ez a sor kiírja a szöveget a `Console`-ba.

### A gomb működésének tesztelése

A `print`-et a gombba is beleírhatjuk, hogy ellenőrizzük, valóban megnyomták-e a gombot.

```swift
Button("Start") {
    print("Test 123")
}
```

Amikor a gombra kattintasz, a `Console` ezt fogja megjeleníteni:

```
Test 123
```

Ez azt jelenti, hogy a gomb sikeresen aktiválódott.

![Button](../../RESOURCE/008_button3.png)

Fontos: a `print` Swift-kód, nem felületi vezérlőelem. Nem lehet közvetlenül a `body`-ba írni, különben hiba lesz.

Például ez hibás:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Hiba: a body-nak egy View-t kell visszaadnia
    }
}
```

SwiftUI-ban a `body` a felület szerkezetét írja le, ezért csak felületi elemek (`View`) lehetnek benne, például `Text`, `Button`, `Image` és hasonlók.

A sima kódot, például a számítási logikát vagy a `print` hívást, gombokba, függvényekbe vagy más eseménykezelőkbe kell tenni.

### Console

A `print` által kiírt tartalom az Xcode `Console`-jában jelenik meg.

Ha nem látod a `Console`-t, kattints a jobb alsó sarokban a `Show the Debug Area` gombra a hibakeresési terület megnyitásához, majd a `Show the Console` gombra a konzol megjelenítéséhez.

![](../../RESOURCE/008_button4.png)

A `Console` bal alsó részén két fül látható: `Executable` és `Previews`.

![](../../RESOURCE/008_button5.png)

Ez a két fül különböző futási környezeteket jelent: ha a `Canvas` előnézetben futtatod a nézetet, a `print` kimenet a `Previews` fül alatt jelenik meg; ha viszont a szimulátoron vagy valódi készüléken fut az alkalmazás, akkor az `Executable` fül alatt jelenik meg.

Ezért ha azt látod, hogy a `print` nem ad kimenetet, először ellenőrizd, hogy a megfelelő fület választottad-e ki.

## Példa - ASCII karakterrajz

Egyes kódprojektekben gyakran találkozhatunk ASCII karakterrajzokkal.

A karakterrajz olyan ábra, amelyet hétköznapi karakterekből raknak össze, például:

![ASCII](../../RESOURCE/008_ascii.png)

Gomb + `print` segítségével mi is kiírhatunk egy ASCII karakterrajzot.

Példakód:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Amikor a gombra kattintasz, a `Console` ezt fogja kiírni:

```
 /\_/\
( o.o )
 > ^ <
```

Megjegyzés: a karakterláncban a `\` jelet `\\` alakban kell írni, mert a fordított perjel szökéskarakter a karakterláncban.

## Függvények

A gombban közvetlenül is írhatunk kódot.

Például:

```swift
Button("Start") {
    print("Hello")
}
```

Ha kevés a kód, ezzel nincs probléma. A valódi fejlesztésben azonban egy gomb által kiváltott logika sokkal hosszabb is lehet.

Például:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Lehet, hogy még sok más kód is van itt
}
```

Ha egyre több lesz a kód, a gomb belsejébe írva a felületi kód rendezetlenné válik, és nehezebb lesz olvasni vagy karbantartani.

Ezért ezeket a kódrészeket általában függvénybe szervezzük, és a gombból azt a függvényt hívjuk meg.

### Mi az a függvény

A függvény újrahasználható kódrészlet.

Ha bizonyos kódot végre kell hajtani, elég meghívnunk a függvényt, és az lefuttatja a benne lévő utasításokat.

Így a kód szerkezete áttekinthetőbb lesz, és könnyebb újra felhasználni.

### Alapírásmód

Swiftben a függvényeket a **func** kulcsszóval definiáljuk:

```swift
func randomInt() {
    // code
}
```

Ez a kód definiál egy függvényt.

A `randomInt` a függvény neve, ez azonosítja ezt a kódrészt.

Az `()` a paraméterek helye, ide külső adatokat lehet átadni. Ha nincs szükség adatra, üres maradhat.

A `{}` közötti rész a függvény kódterülete, minden végrehajtandó utasítást ide kell írni.

Például:

```swift
func getName() {
    print("FangJunyu")
}
```

Ennek a függvénynek a feladata, hogy kiírjon egy szöveget.

### Függvény meghívása

A függvény definiálása csak létrehozza ezt a kódrészt. Ha végre is akarjuk hajtani, meg kell hívni.

A meghívás módja az, hogy a függvénynév után `()` kerül:

```swift
getName()
```

Amikor a program ehhez a sorhoz ér, végrehajtja a `getName` függvény kódját.

Teljes példa:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Futtatás után a `Console` ezt fogja megjeleníteni:

```
FangJunyu
```

### Függvény használata SwiftUI-ban

SwiftUI nézetben a függvényeket általában a `body`-n kívül írjuk.

Például:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Amikor megnyomod a gombot, a `getName()` függvény meghívódik.

Ez segít abban, hogy a felületi kód tiszta maradjon, miközben a konkrét logikát a függvény kezeli.

### Függvényparaméterek

Néha egy függvénynek különböző adatok alapján kell más-más műveletet végeznie.

Például szeretnénk, hogy a függvény különböző neveket írjon ki, ne csak a rögzített `"FangJunyu"` szöveget.

Ilyenkor használhatunk paramétereket. A paraméter úgy is felfogható, mint a függvényhíváskor átadott adat.

Például:

```swift
func getName(name: String) {
    print(name)
}
```

Ez a függvény kapott egy új paramétert. A `name` a paraméter neve, a `String` pedig a típusa.

Ez azt jelenti, hogy a függvénynek egy `String` típusú adatot kell kapnia.

Mivel a függvénynek most már adatra van szüksége, híváskor ezt az adatot meg kell adnunk.

```swift
getName(name: "Sam")
```

Amikor `"Sam"` értékkel hívjuk meg, a függvény belül ezt az értéket fogja kiírni.

Futtatási eredmény:

```
Sam
```

## Példa - ASCII karakterrajz kiírása függvénnyel

Az előző példában a `print` hívásokat közvetlenül a gombon belül írtuk meg.

De ha a karakterrajz bonyolultabb, a kód hosszú lesz. Ilyenkor a logikát függvénybe tehetjük, így a felületi kód tisztább marad.

Példakód:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Futtatás után, amikor megnyomod a gombot, a `Console` ezt fogja kiírni:

```
 /\_/\
( o.o )
 > ^ <
```

Itt két dolog történik, miután a felhasználó rákattint a gombra:

1. a gomb meghívja a `printCat()` függvényt
2. a függvényben lévő `print` kód végrehajtódik

Így a felületi kódnak csak az esemény kiváltásával kell foglalkoznia, a konkrét logika pedig a függvényben marad.

A valódi fejlesztésben a legtöbb gomb műveletét valamilyen függvénnyel szoktuk megvalósítani.

## Összegzés

Ebben a leckében három fontos dolgot tanultunk:

**1. Button gomb**

A `Button` a SwiftUI vezérlőeleme, amely művelet kiváltására szolgál.

```swift
Button("Start") {

}
```

Amikor a felhasználó megnyomja a gombot, a kapcsos zárójelek közötti kód végrehajtódik.

**2. print kimenet**

A `print` hibakeresési információkat ír ki a `Console`-ba.

```swift
print("Hello")
```

A fejlesztő a `Console` segítségével ellenőrizheti a program futási állapotát.

**3. Függvények**

A függvény egy újrahasználható kódrészlet.

```swift
func sayHello() {
    print("Hello")
}
```

Függvényhívás:

```swift
sayHello()
```

Ha a függvénynek adatra van szüksége, paramétereket is használhat:

```swift
func sayHello(name: String) {
    print(name)
}
```

A következő leckékben további SwiftUI vezérlőelemeket és azt is megtanuljuk, hogyan kapcsolódnak az adatok a felülethez.

## Gyakorlat

Próbáld meg elvégezni a következő feladatokat:

1. Hozz létre egy gombot, amelynek a felirata `"Hello"`
2. A gomb megnyomásakor írasd ki a `Console`-ba: `Hello Swift`
3. Tedd a kiíró kódot egy függvénybe, majd a gombból hívd meg ezt a függvényt
