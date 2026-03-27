# Persely

Ebben a leckében egy egyszerű „persely” projektet készítünk el. A funkciója egyszerű, de a teljes interakciós logikát tartalmazza, ezért nagyon alkalmas kezdők számára.

A projekten keresztül megismerkedünk a `TextField` beviteli mezővel, a `border` szegéllyel, valamint az adatkapcsolással (`$`).

A végső cél egy olyan „persely” elkészítése, amelyben megadható egy összeg, majd gombnyomásra elmenthető és hozzáadható az összesített értékhez.

Végeredmény:

![Piggy Bank](../../RESOURCE/014_view.png)

## A teljes összeg megjelenítése

Először jelenítsük meg a „persely” teljes összegét a nézetben.

A `ContentView`-ban deklaráljunk egy változót, amely a persely teljes összegét tárolja.

```swift
@State private var amount = 0
```

Ezután jelenítsük meg ezt az összeget egy `Text` nézettel:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Itt a `.font` és a `.fontWeight` segítségével állítjuk be a betűméretet és a betűvastagságot.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Amikor az `amount` változik, a `Text` által megjelenített teljes összeg is automatikusan frissül.

## Összeg bevitele

A „perselynek” nemcsak meg kell jelenítenie a teljes összeget, hanem lehetővé kell tennie azt is, hogy a felhasználó „beírja” a menteni kívánt összeget. Ehhez a SwiftUI `TextField` vezérlőjét használjuk.

### TextField

A `TextField` a SwiftUI-ban tartalom bevitelére szolgáló nézet, amelyet többnyire egysoros adatbevitelhez használunk.

A `TextField` főként kétféle kötési formátumot biztosít:

**1. Karakterlánc típus kötése (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Ez nevekhez, címekhez és más szöveges tartalmakhoz alkalmas.

**2. Szám típus kötése (`Int` / `Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Ez életkor, fizetés, összeg és más numerikus adatok bevitelére alkalmas.

A `format: .number` azt jelenti, hogy a mező számformátumként értelmezi és jeleníti meg a beírt értéket.

#### Szöveges helyőrző

A `TextField` első paramétere a helyőrző szöveg (`Placeholder`), amely megmutatja a felhasználónak, mit kell beírnia:

```swift
TextField("input your name", text: $text)
```

Amikor a mező üres, egy szürke segítőszöveg jelenik meg benne.

![textfield](../../RESOURCE/014_textfield.png)

#### Adatkötés

A `TextField` önmagában nem tárolja tartósan a beírt tartalmat, ehhez kötött változóra van szükség.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

A felhasználó által beírt tartalom közvetlenül a `text` változóba kerül, a `TextField` csak a beviteli felületet biztosítja.

A `$` a kötést (`Binding`) jelöli:

```swift
$text
```

Ez nem egyszerű változó, hanem `Binding` típus.

Feladata, hogy kapcsolatot hozzon létre a nézet és az adat között:

amikor a felhasználó a `TextField`-be ír, a `text` automatikusan frissül; amikor a `text` értéke változik, a `TextField` is azonnal frissíti a megjelenítést.

Például:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Ha a `TextField`-be beírsz valamit, a fölötte lévő `Text` valós időben megjeleníti ugyanazt a tartalmat.

![textField](../../RESOURCE/014_textfield1.png)

### Számtípus kötése

Ha számot szeretnél bevinni, akkor a megfelelő típusú változóhoz kell kötni:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Amikor a felhasználó összeget ír be, a `TextField` a beírt tartalmat számmá alakítja, és automatikusan frissíti a `number` értékét.

## A beviteli mező hozzáadása

Miután megismertük a `TextField` alapvető használatát, alkalmazzuk a „persely” projektben.

A „perselyhez” összeget kell beírni, ezért a „szám típus kötése” formát használjuk, és létrehozunk egy új `number` változót a felhasználó által bevitt összeg tárolására:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Most a `TextField` alapértelmezésben a `number` értékét jeleníti meg, ami kezdetben 0.

Ha a mezőt kitöröljük, akkor a „Amount” helyőrző szöveg jelenik meg.

Ez ismét jól mutatja, hogy a `TextField` a kötött változó értékét jeleníti meg, nem pedig önállóan tárolja a tartalmat.

### A beviteli mező méretproblémája

A jelenlegi nézetben azt fogjuk észrevenni, hogy a `TextField`-nek nincs kerete, csak egy `0` látszik, és a tartalom balra igazítottnak tűnik.

Az eredmény így néz ki:

![textfield](../../RESOURCE/014_textfield2.png)

Ennek az az oka, hogy a `TextField` alapértelmezés szerint kitölti a szülőnézet teljes szélességét.

Ezt háttérszínnel könnyen ellenőrizhetjük:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Az eredmény:

![textfield](../../RESOURCE/014_textfield3.png)

Látható, hogy a `TextField` valójában a teljes sort kitölti.

### Fix szélesség beállítása

Ha azt szeretnénk, hogy a beviteli mező kompaktabb legyen, használhatjuk a `frame` módosítót a szélesség korlátozására:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Az eredmény:

![textfield](../../RESOURCE/014_textfield4.png)

### Szegély és belső margó hozzáadása

Mivel a `TextField` alapértelmezés szerint nem rendelkezik szegéllyel, kézzel adhatunk hozzá stílust:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Most a beviteli mező már sokkal inkább egy „szabványos” inputmezőre hasonlít.

![textfield](../../RESOURCE/014_textfield5.png)

## Szegély

SwiftUI-ban a `border` arra szolgál, hogy a nézet köré szegélyt rajzoljunk.

Alap használat:

```swift
border(Color.black, width: 1)
```

Itt a `Color.black` a szegély színét, a `width` pedig a vastagságát jelöli.

A `TextField` esetében ezt használjuk:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Ez azt jelenti, hogy a beviteli mező köré egy fekete, 1 pt vastagságú szegély kerül.

Kipróbálhatsz más színeket is, például `Color.blue`, `Color.green`, vagy vastagabb szegélyt, például `width: 2`.

## Mentés gomb

Most már van egy `amount` változónk a teljes összeg megjelenítésére, egy `TextField` a beviteli összeghez, valamint egy `number` változónk, amely a mezőhöz van kötve.

A jelenlegi kód:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Gomb hozzáadása

Most hozzá kell adnunk egy gombot, amely elindítja a mentési műveletet.

```swift
Button("Save") {
    
}
```

### A mentési logika megvalósítása

Az a célunk, hogy a felhasználó megadjon egy összeget, majd a gomb megnyomásakor az összeg hozzáadódjon a teljes összeghez.

```swift
Button("Save") {
    amount += number
}
```

Itt összetett értékadó operátort használunk: a felhasználó által beírt `number` hozzáadódik az összesített `amount` értékhez.

### A beviteli összeg visszaállítása

Most azonban van egy probléma: a gomb megnyomása után a beviteli mezőben lévő összeg nem ürül ki.

Ha a felhasználó például beír 10-et, elmenti, a mezőben továbbra is 10 marad, ami megzavarhatja a következő bevitelt.

Ennek oka, hogy a `TextField` a `number` változóhoz van kötve. A gomb megnyomásakor csak az `amount` változik, a `number` nem, ezért a mező továbbra is a régi értéket mutatja.

Ezért szükség van egy törlő logikára is: a gombnyomás után először hozzáadjuk az értéket az összeghez, majd a beviteli értéket visszaállítjuk:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Így amikor a felhasználó összeget ír be és megnyomja a gombot, az összeg hozzáadódik a teljes értékhez, a `number` pedig 0-ra áll vissza, hogy a következő beírásra készen álljon.

Ezzel elkészült a „persely” minden alapvető mentési logikája.

## A nézet finomítása

Miután a funkció elkészült, egyszerűen javíthatunk a felületen: hozzáadhatunk háttérképet és gombstílust.

Gombstílus hozzáadása:

```swift
.buttonStyle(.borderedProminent)
```

Háttérkép hozzáadása:

```swift
.background {
    Image("1")
}
```

Ezzel befejeztük az egész „persely” elkészítését.

## Teljes kód

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Megvalósított eredmény:

![Piggy Bank](../../RESOURCE/014_view.png)

Most kipróbálhatod, hogy beteszel 100-at vagy még többet, és megnézheted, van-e valamilyen hiba a „persely” logikájában.

Az alkalmazást futtathatod szimulátoron vagy valódi készüléken is, hogy kipróbáld a saját fejlesztésű „persely” appot.

### Hibakeresési kimenet

Annak ellenőrzésére, hogy a logika helyesen működik-e, a gombba hibakeresési kiírást is tehetünk:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Minden mentéskor és gombnyomáskor láthatjuk a megfelelő hibakeresési kimenetet, így ellenőrizhetjük, hogy a kódban van-e logikai hiba.

```
---Saving---
amount:11
number:0
```
