# Idézetkörhinta

Ebben a leckében megvalósítunk egy „idézetkörhinta” funkciót, és közben alaposabban megismerjük a Swift alapjait, például a tömböt (`Array`) és a feltételes elágazásokat (`if-else`).

Megnézzük, hogyan lehet több idézetet eltárolni, majd gombos interakcióval ciklikusan váltogatni őket.

![alt text](../../RESOURCE/011_word.png)

## Idézet megjelenítése

Először jelenítsünk meg egy idézetet SwiftUI-ban.

A legegyszerűbb megoldás a `Text` nézet használata:

```swift
Text("Slow progress is still progress.")
```

Ez a kód csak egy rögzített idézetet tud megjeleníteni.

Ha több idézetet szeretnénk mutatni és váltogatni közöttük, akkor először el kell tárolnunk őket.

Egy hagyományos karakterlánc-változó azonban csak egyetlen idézetet tud tárolni:

```swift
let sayings = "Slow progress is still progress."
```

Ha több idézetet szeretnénk menteni, minden idézethez külön változót kellene deklarálnunk:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Valódi fejlesztésnél ez nemcsak körülményes, hanem rugalmatlan is.

Mivel az egyes változók egymástól függetlenek, nehéz velük kényelmes körhintát készíteni.

Ahhoz, hogy több idézetet könnyen kezeljünk, olyan adatszerkezetre van szükségünk, amely együtt tárolja őket.

Ez a tömb (`Array`).

Tömb használatával a fenti kód így írható át:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tipp: programozási szokás szerint a több elemet tartalmazó tömbök neve gyakran többes szám, például `sayings`, hogy jobban kifejezze a gyűjtemény jellegét.**

## Tömb

Swiftben a tömb rendezett elemek gyűjteménye.

Szögletes zárójelekkel `[]` írjuk.

```swift
[]
```

A tömb több, azonos típusú elemet tartalmazhat.

Az elemeket angol vessző `,` választja el egymástól.

Például:

```swift
[101, 102, 103, 104, 105]
```

A tömböt egyszerűen elképzelheted úgy, mint egy vonat szerelvényét:

![Array](../../RESOURCE/011_array1.png)

Az egész vonat jelenti a tömböt, az egyes kocsik pedig egymás után, sorrendben helyezkednek el.

### Index és elemek elérése

Mivel a tömb rendezett, a rendszer a sorrend alapján meg tudja találni az egyes elemeket.

Ezt a helyazonosítást indexnek (`Index`) nevezzük.

Swiftben, akárcsak a legtöbb programozási nyelvben, a tömb indexelése 0-ról indul, nem 1-ről.

Ez azt jelenti, hogy az első elem indexe 0, a másodiké 1, és így tovább.

![Array](../../RESOURCE/011_array2.png)

Ha egy konkrét elemet szeretnél elérni a tömbből, csak írd a tömb neve után a szögletes zárójelet, és add meg benne a kívánt elem indexét.

Például:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Ha a tömb érvényes tartományán kívüli indexet próbálsz elérni, „index out of range” hiba történik.

Ezért tömbhasználat közben mindig figyelni kell arra, hogy az index érvényes tartományban maradjon.

**Index out of range**

Például ha egy tömbnek 5 eleme van, akkor a megengedett indexek 0 és 4 közé esnek.

Ha megpróbáljuk elérni a `sayings[5]` elemet, a program nem találja a megfelelő „kocsit”.

Ezért indexelési hibát dob, és az alkalmazás összeomolhat.

![Array](../../RESOURCE/011_array3.png)

### Tömb műveletek

A tömb nemcsak statikusan definiálható.

Támogatja az elemek hozzáadását, törlését, módosítását, valamint a hossz lekérdezését is.

Tipp: ha módosítani szeretnéd a tömböt, akkor `var`-ral kell deklarálnod, nem `let`-tel.

**1. Elem hozzáadása**

Az `append` metódussal a tömb végére adhatsz új elemet:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Elem törlése**

A `remove(at:)` metódussal törölheted a megadott helyen lévő elemet:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Elem módosítása**

Közvetlenül az index használatával módosíthatod a tömb egy elemét:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. A tömb hosszának lekérdezése**

A `count` tulajdonsággal megkaphatod a tömb elemeinek számát:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Idézet megjelenítése tömbből

Ahhoz, hogy több idézetet jelenítsünk meg, eltárolhatjuk őket egy tömbben.

Ezután index alapján kiválaszthatjuk és megjeleníthetjük a megfelelő elemet.

Először hozzunk létre a `ContentView`-ban egy `sayings` tömböt az idézetek tárolására.

Ezután a `Text` nézetben index alapján olvassuk ki és jelenítsük meg a kívánt idézetet:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Itt a `sayings[0]` a tömb első idézetét jelenti.

Ha más idézetet szeretnél megjeleníteni, elég megváltoztatni a szögletes zárójelben lévő indexet:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Az idézet indexének definiálása

Ahhoz, hogy dinamikusan válthassunk az idézetek között, nem írhatjuk „fixen” az indexet a `Text` nézetbe.

Létre kell hoznunk egy külön változót, amely az aktuálisan megjelenített indexet tárolja.

SwiftUI-ban ehhez használhatunk egy `@State` változót:

```swift
@State private var index = 0
```

A SwiftUI figyeli az `@State`-tel becsomagolt változót.

Amikor az `index` megváltozik, a SwiftUI újrarendereli a nézetet, és megjeleníti a megfelelő idézetet.

Ezután a `sayings[index]` segítségével dinamikusan kérhetjük le az idézetet a tömbből:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Amikor az `index` értéke megváltozik, a `Text` más idézetet fog megjeleníteni.

### Az index vezérlése gombbal

Az idézetek váltásához használhatunk egy `Button`-t, amely módosítja az `index` értékét.

Minden kattintáskor az `index` eggyel nő:

```swift
Button("Next") {
    index += 1
}
```

Amikor rákattintunk a gombra, az `index` 0-ról 1-re változik.

A nézet frissül, és a `Text(sayings[index])` a következő idézetet olvassa ki.

Itt azonban van egy lehetséges probléma: ha túl sokszor kattintunk, az `index` olyan értékre nőhet, amely már kívül esik a tömb tartományán.

Ez tömbindexelési hibát okoz.

Például amikor az `index` eléri az 5-öt, miközben a tömb indexei csak 0 és 4 között érvényesek, az alkalmazás összeomlik.

Annak érdekében, hogy ezt elkerüljük, feltételes vezérlésre van szükség.

Ez biztosítja, hogy az `index` ne lépje túl a tömb határait.

Ehhez használhatunk `if-else` szerkezetet, és ellenőrizhetjük, hogy az `index` kisebb-e a tömb hosszánál.

## Feltételes vezérlés: if-else

Az `if-else` a Swift egyik leggyakoribb feltételes elágazása.

Arra szolgál, hogy megvizsgáljon egy feltételt, majd annak igaz vagy hamis volta alapján más-más kódot hajtson végre.

Alapszerkezet:

```swift
if condition {
    // Az itt lévő kód fut le, ha a condition true
} else {
    // Az itt lévő kód fut le, ha a condition false
}
```

Az `if` feltétele egy logikai érték (`Bool`), vagyis `true` vagy `false`.

Ha a feltétel `true`, az `if` rész kódja fut le; ha `false`, akkor az `else` rész.

Például:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Ebben a példában az `age` értéke 25.

Ezért az `age > 18` feltétel igaz, így a program a `"Big Boy"` szöveget írja ki.

Ha nincs szükség `else` részre, el is hagyható:

```swift
if condition {
    // Az itt lévő kód fut le, ha a condition true
}
```

### Az index tartományának feltételes védelme

Annak érdekében, hogy az index ne lépje túl a tömb tartományát, használhatunk `if` feltételt:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logikai elemzés: a `sayings.count` értéke 5, mert összesen 5 idézet van.

Ezért a `sayings.count - 1` értéke 4, ami a tömb utolsó érvényes indexe.

Amíg az `index` kisebb 4-nél, biztonságosan növelhető eggyel.

Ha azonban az `index` már 4, a feltétel nem teljesül, és a gombnyomás többé nem változtatja meg az értéket.

Most a kód már képes idézetet váltani:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Ciklikus idézetek

Ha azt szeretnénk, hogy az utolsó idézet után a gomb ismét az első idézetet jelenítse meg, vagyis körkörösen működjön a váltás, akkor az `else` rész segítségével megoldhatjuk:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Amikor a gombra kattintunk, ha az `index` már a tömb utolsó elemére mutat, akkor 0-ra áll vissza.

Ezután a körforgás elölről kezdődik.

## Az idézetnézet finomítása

Most már működik az idézetkörhinta logikája.

De a felületet még tovább szépíthetjük.

Teljes kód:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Ebben a példában a `Text` nézet fehér, félig átlátszó hátteret és lekerekített sarkokat kapott.

A `Button` `.borderedProminent` stílust használ.

A `VStack` pedig háttérképet kapott.

Kiegészítő tudnivaló: amikor a `background()` módosítóval képet használsz háttérként, az alapértelmezett viselkedés az, hogy a nézet aktuális elrendezési területét igyekszik kitölteni.

Sok esetben természetesen kiterjedhet a biztonságos területre (`Safe Area`) is.

Mostanra elkészült az idézetkörhinta nézet.

![SwiftUI View](../../RESOURCE/011_word.png)

## Összegzés

Ebben a leckében megtanultuk, hogyan lehet több idézetet tömbben tárolni.

Ezután `if` és `if-else` szerkezetek segítségével körhintaszerűen váltani közöttük.

Emellett megismertük a tömbök alapműveleteit is, például az elemek hozzáadását, törlését, módosítását, valamint azt, hogyan lehet elkerülni a tömbindex túllépését.
