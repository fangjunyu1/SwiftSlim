# Filmek listája

Ebben a leckében egy filmlistát fogunk készíteni.

![movie](../../Resource/021_movie.png)

A listában minden film posztere, neve, rendezője és értékelése fog megjelenni.

Ebben a példában egy nagyon fontos tudáspontot fogunk megtanulni: a `struct` struktúrát. Ez segíthet abban, hogy egy film több információját egyetlen egésszé kapcsoljuk össze. Ezen kívül megismerkedünk a `UUID()`, `ForEach`, `Divider` elválasztóvonal használatával, valamint azzal is, hogyan kezelhetünk adatokat egyéni objektumokkal.

Ezek az ismeretek nagyon gyakoriak a későbbi SwiftUI-fejlesztésben. A lecke befejezése után nemcsak egy filmlistát tudsz majd elkészíteni, hanem azt is elkezded megérteni, „hogyan lehet egy adathalmazt felületté alakítani”.

## Egyetlen film

Először elkezdhetjük egyetlen film felületének elkészítésével.

![movie](../../Resource/021_movie1.png)

Ennek a felületnek az elrendezése főként két részből áll: bal oldalon a film posztere, jobb oldalon pedig a film bemutatása található.

### Filmposzter

Bal oldalon a film posztere látható, és a kép megjelenítésére használhatjuk az `Image`-et.

Például:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Ez a kód azt jelenti, hogy a `"The Shawshank Redemption"` nevű kép jelenik meg.

Itt fontos megjegyezni, hogy a kép nevének valóban léteznie kell az `Assets` erőforrásmappában, különben a felület nem tudja helyesen megjeleníteni ezt a képet.

![movie](../../Resource/021_movie2.png)

Ezeknek a módosítóknak a szerepe a következő:

- A `resizable()` azt jelenti, hogy a kép mérete módosítható.
- A `scaledToFit()` azt jelenti, hogy méretezés közben megmarad az eredeti arány, így a kép nem nyúlik meg és nem torzul.
- A `frame(height: 180)` azt jelenti, hogy a kép magassága 180 lesz.
- A `cornerRadius(10)` azt jelenti, hogy a kép sarkai 10-es sugarú lekerekítést kapnak.

Így egy megfelelő méretű, lekerekített sarkú filmposzterképet kapunk.

![movie](../../Resource/021_movie3.png)

### Film bemutatása

Jobb oldalon a film bemutatása látható, beleértve a film nevét, a rendezőt és az értékelést.

![movie](../../Resource/021_movie4.png)

Ehhez a részhez használhatjuk a `Text`-et:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Ebben a kódban a `.font` a betűméretet, a `.fontWeight` pedig a betűvastagságot jelenti.

Annak érdekében, hogy a „film neve”, a „rendező adatai” és az „értékelési információk” között tisztább legyen a térköz, itt a legkülső szinten `VStack`-et használunk, és beállítjuk:

```swift
spacing: 10
```

Ez azt jelenti, hogy ezen a `VStack`-en belül minden tartalomcsoport között 10 a távolság.

Azért használ külön `VStack`-et a rendező és az értékelés, mert mindkettő „cím + tartalom” szerkezethez tartozik. Így a felület rétegei átláthatóbbak lesznek, és később a stílus további finomhangolása is könnyebb lesz.

Emellett a `VStack` alapértelmezetten középre igazít. Ahhoz, hogy az összes szöveg balra legyen igazítva, beállítjuk:

```swift
alignment: .leading
```

Így a film bemutatásának része rendezettebbnek tűnik.

### Elválasztóvonal

Most, bár a film bemutatásában a tartalom `spacing` segítségével már eltávolodott egymástól, a különböző tartalmak közötti határ még mindig nem elég egyértelmű.

Ekkor hozzáadhatunk egy elválasztóvonalat:

```swift
Divider()
```

Például:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Így a film bemutatásának része jól láthatóbb elválasztó hatást kap.

![movie](../../Resource/021_movie4.png)

A `Divider` egy nagyon egyszerű, de nagyon gyakran használt view, amelynek feladata a különböző tartalmak elválasztása.

`VStack`-ben a `Divider()` vízszintes vonalként jelenik meg.

`HStack`-ben a `Divider()` függőleges vonalként jelenik meg.

Emellett a `Divider` stílusát `.frame`, `.background`, `.padding` és más módszerekkel is módosíthatjuk.

Például:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Ez egy kék színű, 2 vastagságú, kétoldali vízszintes belső margóval rendelkező elválasztóvonalat hoz létre.

![divider](../../Resource/021_divider.png)

### Teljes felület

Végül `HStack` segítségével egymás mellé rendezhetjük a film poszterét és a film bemutatását.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Itt a `HStack(spacing: 20)` azt jelenti, hogy a bal és a jobb oldal között 20-as távolság marad.

Fontos megjegyezni, hogy a `Divider()`, akárcsak a korábban említett `TextField` és `Slider`, alapértelmezetten igyekszik minél több rendelkezésre álló helyet elfoglalni.

Ezért a jobb oldali bemutató rész külső `VStack`-jének fix szélességet adunk:

```swift
.frame(width: 200)
```

Így az elválasztóvonal és a szövegterület szélessége megegyezhet, és az összkép rendezettebb lesz.

Ezzel elkészült az „egyetlen film” megjelenítő felülete.

![movie](../../Resource/021_movie1.png)

## Filmek tárolása tömbben

Ha több filmet szeretnénk egymás után, ugyanolyan stílusban megjeleníteni, az azt jelenti, hogy minden filmhez hasonló kódot kell írni.

Például:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Bár az így írt kód elérheti a kívánt hatást, a kód egyre több lesz, és a karbantartása nagyon körülményes lesz.

Például, ha az összes film közötti távolságot `20`-ról `15`-re kell módosítani, vagy a jobb oldali szélességet `200`-ról
`220`-ra kell változtatni, akkor minden ismétlődő kódrészletet kézzel kell módosítani.

Ez nyilvánvalóan nem hatékony módszer.

Korábban már tanultunk a tömbökről, és azt is megtanultuk, hogyan használhatjuk a `ForEach`-t view-k ismételt megjelenítésére egy tömb alapján.

Például:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Ez a módszer nagyon alkalmas olyan esetek kezelésére, amikor „csak egyetlen adat” van, például képek neveinek csoportjára.

De egy film nem csak egyetlen értéket tartalmaz. Legalább a következőket foglalja magában:

1. a film poszterét
2. a film nevét
3. a rendezőt
4. az értékelést

Vagyis egy film valójában összetartozó adatok halmaza, nem pedig egyetlen string.

Ha csak tömböket használunk, akkor ezeket az információkat csak külön-külön tudjuk tárolni:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Megjelenítéskor ugyanarra az indexre kell támaszkodnunk, hogy egyesével megfeleltessük őket:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Ennek az írásmódnak az a problémája, hogy nagyon magas a karbantartási költsége.

Mivel egy film adatai több tömbben szétszóródnak, elég, ha valamelyik tömbben eggyel több, eggyel kevesebb elem van, vagy más a sorrend, és a megjelenítés eredménye hibás lesz.

Különösen filmek hozzáadásakor vagy törlésekor egyszerre több tömböt kell módosítanod, és nagyon könnyű valamit elfelejteni.

Hogyan tudjuk tehát az olyan információkat, mint a „film neve, rendezője és értékelése” egyetlen egésszé összekapcsolni?

Ehhez `struct`-ot kell használnunk.

## A struct struktúra meghatározása

Swiftben a `struct` jelentése „struktúra”.

Úgy is felfoghatod, mint egy „egyéni adattípust”, amely több kapcsolódó mezőt össze tud vonni egyetlen egésszé.

Alapvető használat:

```swift
struct StructName {
	let name: String
}
```

Ebben a kódban a `struct` az a kulcsszó, amely azt jelzi, hogy egy struktúrát definiálunk. A `StructName` a struktúra neve.

A kapcsos zárójelek közötti tartalom a struktúra mezőit jelenti, és minden mezőnél világosan meg kell adni a nevet és a típust.

Általában a `struct` neve nagybetűvel kezdődik, például `Movie`, `Student` vagy `UserInfo`. Ez egy gyakori elnevezési szokás Swiftben.

A `struct`-ot egyszerűen elképzelheted úgy, mint egy üres dobozt, ahol minden mező egy előre fenntartott üres hely a dobozban.

Amíg ezek a helyek nincsenek kitöltve, addig ez csak egy üres doboz. Csak akkor válik teljes ajándékdobozzá, amikor minden mező megfelelő értékkel fel van töltve.

### struct példány

Korábban csak magát a struktúrát definiáltuk, ami olyan, mintha előkészítenénk egy doboz formáját.

Még bele kell töltenünk a konkrét tartalmat ahhoz, hogy valódi, használható „példányt” kapjunk.

Példány létrehozásakor általában a struktúra neve után `()` kerül:

```swift
StructName(...)
```

A zárójelek közé azt írjuk, ami ennek a struktúrának a mezőtartalma.

Például:

```swift
StructName(name: "Fang Junyu")
```

Ez a kód azt jelenti: a `StructName` struktúra formája szerint létrehozunk egy új példányt, és a `name` mezőnek a `"Fang Junyu"` értéket adjuk.

Amikor minden szükséges mezőtartalmat kitöltünk, az olyan, mintha teljesen megtöltenénk ezt a dobozt.

Ekkor kapunk egy teljes struktúrapéldányt.

### struct tulajdonságok elérése

Miután létrehoztunk egy példányt, „pontszintaxissal” érhetjük el a benne lévő tulajdonságokat.

Alapvető írásmód:

```swift
példány.tulajdonságNeve
```

Például:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Itt az `st` egy struktúrapéldány, az `st.name` pedig azt jelenti, hogy kiolvassuk ebből a példányból a `name` értékét.

Úgy is felfoghatod ezt az olvasási módot, hogy amikor azt írjuk `st.name`, az olyan, mintha a doboz egy adott helyén tárolt tartalmat olvasnánk ki.

Ez a fajta írásmód nagyon gyakori lesz a későbbi SwiftUI felületekben.

Például, ha van egy tanulóstruktúránk, amely tartalmazza a nevet, életkort és osztályt, akkor a felületen való megjelenítéskor külön-külön kiolvashatjuk:

```swift
student.name
student.age
student.className
```

Ennek az az előnye, hogy az adatok áttekinthetőbbé és könnyebben kezelhetővé válnak.

### A struct helye

Kezdők számára a struktúrát általában a `ContentView`-n kívül lehet írni.

Például:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Így a szerkezet átláthatóbb lesz, és könnyebb lesz olvasni is.

Észre fogod venni, hogy maga a `ContentView` is valójában egy `struct`.

### A Movie struktúra

Az előző alapokra építve most már meghatározhatunk egy filmstruktúrát:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ez egy `Movie` nevű struktúra, amely három mezőből áll: `name`, `director` és `rating`, ezek rendre a film nevét, rendezőjét és értékelését jelentik.

Így az egy filmhez tartozó információkat már nem kell több tömbbe szétszedve tárolnunk, hanem közvetlenül egyetlen egésszé kapcsolhatjuk őket.

Például létrehozhatunk egy ilyen filmpéldányt:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Ez a példány „egy teljes filmadatot” képvisel.

### Struktúrák tárolása tömbben

Korábban azt mondtuk, hogy a tömb csak azonos típusú elemeket tud tárolni.

Most már van `Movie` struktúránk, így a tömb több `Movie` elemet is tud tárolni.

```swift
let lists: [Movie] = []
```

Például:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Ebben a `lists` tömbben nem stringek, hanem több `Movie` példány tárolódik.

Vagyis a tömb minden eleme egy teljes film.

Így amikor a filmlistát kell megjelenítenünk, `ForEach` segítségével egyenként kiolvashatjuk az egyes filmeket.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Itt a `movie in` azt jelenti, hogy minden ciklusnál egy filmet veszünk ki a tömbből, és ideiglenesen `movie` néven hivatkozunk rá.

Ezután használhatjuk:

```swift
movie.name
movie.director
movie.rating
```

annak a filmnek a nevének, rendezőjének és értékelésének kiolvasására és megjelenítésére a felületen.

## ForEach hiba

Eddigre már elkészültünk a filmtömb és a `ForEach` alapvető írásmódjával.

Ha azonban közvetlenül futtatod a következő kódot:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

hibát fog jelezni:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Ennek a hibának a jelentése az, hogy amikor azt írod `id: \.self`, a SwiftUI-nak a tömb minden elemét önmagában „egyedi azonosítóként” kell használnia ahhoz, hogy különbséget tudjon tenni köztük.

Ez a fajta írásmód alkalmas egyszerű típusokra, például `String` és `Int`, mert ezek önmagukban könnyebben megkülönböztethetők.

A `Movie` viszont egy általunk definiált egyéni struktúra, és a `ForEach` nem tudja, hogyan használja magát a struktúrát egyedi azonosítóként, ezért keletkezik a hiba.

A probléma leggyakoribb megoldása az, hogy a `Movie`-t megfeleltetjük az `Identifiable` protokollnak.

## Protokoll

Swiftben a protokollt úgy lehet felfogni, mint valamilyen „szabályt” vagy „követelményt”.

Úgy is elképzelheted, mint egy nemzetközi szervezet megállapodását: ha egy ország csatlakozni akar egy bizonyos nemzetközi szervezethez, akkor általában először teljesítenie kell az adott szervezet által előírt szabályokat, nyilvánosságra kell hoznia bizonyos adatokat, és be kell tartania bizonyos közös szabályokat. Csak ezek teljesítése után csatlakozhat vagy vehet részt bizonyos ügyekben.

A protokollok hasonló elven működnek.

Amikor egy típus meg akar felelni egy adott protokollnak, teljesítenie kell a protokoll által előírt tartalmat. Csak ezeknek a követelményeknek a teljesülése után használhatja az adott típus a hozzá tartozó funkciókat.

Alapvető írásmód:

```swift
struct Movie: Identifiable {
    // ...
}
```

Itt a `: Identifiable` azt jelenti, hogy a `Movie` megfelel az `Identifiable` protokollnak.

Ha egy típus több protokollnak is megfelel, vesszővel lehet elválasztani őket:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Az `Identifiable` esetében a legfontosabb követelmény az, hogy a típusnak rendelkeznie kell egy `id`-vel, amely azonosítani tudja önmagát.

Például:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Itt az `id` olyan, mint egy személyi azonosító szám, és minden film megkülönböztetésére szolgál.

Amíg minden film `id`-je különböző, a SwiftUI helyesen meg tudja különböztetni a tömb minden elemét.

Például:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Ezután a `ForEach`-ben ezt használjuk:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Így már nem lesz hiba.

Mivel a `Movie` már megfelel az `Identifiable`-nek, még gyakoribb írásmód az, hogy egyszerűen elhagyjuk az `id:` részt:

```swift
ForEach(lists) { movie in
    // ...
}
```

Mert a SwiftUI már tudja, hogy az egyes elemek megkülönböztetéséhez a `movie.id`-t kell használnia.

## A ForEach megkülönböztető azonosítója

Most mélyebben megértjük az `id` szerepét a `ForEach`-ben.

Például:

```swift
ForEach(lists, id: \.self)
```

Ez azt jelenti: magát az elemet használd megkülönböztető azonosítóként.

És:

```swift
ForEach(lists, id: \.id)
```

azt jelenti: az elem `id` mezőjét használd megkülönböztető azonosítóként.

Ha egy bizonyos mező önmagában képes garantálni az egyediséget, átmenetileg azt is használhatjuk.

Például, ha minden film neve különböző, akkor a következő írásmód a jelenlegi adatok mellett szintén működhet helyesen:

```swift
ForEach(lists, id: \.name)
```

Itt azonban van egy rejtett probléma: a `name` nem feltétlenül marad mindig egyedi.

Tegyük fel, hogy később hozzáadsz még egy ugyanolyan nevű filmet, akkor a `name` már nem tudja pontosan megkülönböztetni az egyes elemeket.

Ilyenkor, bár a kód továbbra is lefordulhat, a SwiftUI a view frissítése, frissítés, beszúrás vagy törlés során hibásan ismerheti fel az elemeket, ami megjelenítési rendellenességhez vezethet.

Ezért amikor stabil megkülönböztetésre van szükség, mégis a valóban egyedi mezőt, vagyis az `id`-t érdemes használni.

## UUID

Bár az olyan kézi írás, mint `id: 1`, `id: 2`, megoldhatja a problémát, még mindig van egy kockázat: véletlenül ugyanazt az `id`-t írhatod be, és akkor az egyedi azonosító érvényét veszti.

Például:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Így két azonos `id` jön létre, és az egyedi azonosító érvényét veszti.

Az ilyen kézi hibák elkerülésére általában `UUID()`-t használunk.

Swiftben a `UUID()` véletlenszerűen generál egy 128 bites azonosítót. Ez általában betűk és számok hosszú sorozataként jelenik meg.

Például:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Itt a `UUID()` valójában egy `UUID` típusú példányt hoz létre; ezt úgy is felfoghatod, mint egy automatikusan generált „egyedi számot”.

Ezért az egyes alkalommal létrejövő értékek szinte soha nem ismétlődnek, így nagyon alkalmasak `id`-ként való használatra.

Módosíthatjuk a `Movie`-t így:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Ez a kód azt jelenti, hogy a `Movie` struktúra `id` mezője alapértelmezés szerint egy új `UUID` példányt kap.

Vagyis minden alkalommal, amikor új `Movie`-t hozunk létre, a rendszer automatikusan először egy egyedi `id`-t generál.

Mivel az `id`-nek már van alapértelmezett értéke, később a `Movie` példányok létrehozásakor már nem kell kézzel megadnunk az `id`-t.

Például:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Bár itt nem írjuk ki az `id`-t, valójában ennek a filmpéldánynak továbbra is megvan a saját `id`-je; csak ezt az értéket már automatikusan a `UUID()` hozta létre.

Miután ezt a módszert használjuk, többé nem kell minden filmhez kézzel kitölteni az `id`-t, ami nemcsak a kód mennyiségét csökkenti, hanem az ismétlődő id-értékekből eredő hibákat is elkerüli.

Végül már csak annyit kell tennünk, hogy legfelül hozzáadunk egy `Banner` képet, és `ScrollView`-t használunk, hogy a tartalom görgethető legyen, és ezzel elkészül a teljes filmlista nézet.

## Összefoglalás

Ebben a leckében egy nagyon fontos tudáspontot tanultunk meg: `struct`.

A `struct` segítségével egy film több kapcsolódó mezőjét egyetlen egésszé tudjuk összevonni, ahelyett hogy a nevet, a rendezőt és az értékelést több tömbben külön tárolnánk.

Miután az adatokat összekapcsoltuk, a `ForEach` használatával a tömb minden filmjét egyesével megjeleníthetjük a view-ban.

Ezzel együtt azt is megértettük, milyen szerepe van a „megkülönböztető azonosítónak” a `ForEach`-ben: a SwiftUI-nak tudnia kell, hogyan különítse el a tömb egyes elemeit ahhoz, hogy helyesen jelenítse meg és frissítse a view-t.

Ezért a `Movie`-t megfeleltettük az `Identifiable` protokollnak, és adtunk neki egy egyedi `id`-t.

Annak érdekében, hogy elkerüljük az `id` kézi kitöltéséből fakadó hibákat, továbbá megtanultuk a `UUID()` használatát is, hogy a rendszer automatikusan generálja az egyedi azonosítót.

A lecke befejezése után nemcsak a filmlistát fogod elkészíteni, hanem egy fontos SwiftUI-s gondolatmóddal is elkezdesz megismerkedni: **először rendezd az adatokat, aztán ezek alapján hozd létre a view-t.**

## Teljes kód

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
