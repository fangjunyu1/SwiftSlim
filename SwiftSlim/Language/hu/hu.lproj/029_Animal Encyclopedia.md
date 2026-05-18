# Állatenciklopédia

Ebben a leckében tovább gyakoroljuk az egyéni nézeteket és az adatátadást.

Egy egyszerű állatenciklopédia nézetet fogunk készíteni. Az oldalon öt állat jelenik meg; amikor a felhasználó rákoppint egy állatra, megjelenik egy részletező nézet, amely az adott állat képét, elterjedési területét, élőhelyét és leírását mutatja.

Megvalósított eredmény:

![view](../../../Resource/029_view.png)

Ezzel a példával gyakorolhatjuk az adatstruktúrák, a lista megjelenítése, a koppintási interakció és a Sheet felugró nézet együttműködését.

## Képek előkészítése

Először elő kell készítenünk öt állatképet:

- Delfin: `dolphin.jpg`
- Zsiráf: `giraffe.jpg`
- Oroszlán: `lion.jpg`
- Panda: `panda.jpg`
- Jegesmedve: `polarBear.jpg`

Használhatod az alábbi képeket:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Zsiráf](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Oroszlán](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Jegesmedve](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

A képek letöltése után húzd be őket az Xcode projekt `Assets` erőforrás-mappájába.

![assets](../../../Resource/029_assets.png)

Fontos megjegyezni, hogy amikor képet használunk a kódban, általában nem kell kiírni a `.jpg` kiterjesztést.

Például, ha a képerőforrás neve `dolphin`, akkor a kódban ezt írjuk:

```swift
Image("dolphin")
```

Ha a kép neve hibásan van megadva, a kép nem fog megfelelően megjelenni.

Megjegyzés: a fenti képek a Wikimedia-projektekből származnak. Használatkor ajánlott megtartani az eredeti képlinkeket és a forrásinformációkat.

## Az Animal struktúra létrehozása

Ezen az oldalon minden állat több információval rendelkezik:

- Állat neve
- Állat képe
- Állat emoji jele
- Elterjedési terület
- Élőhely
- Állat leírása

Ha ezeket az információkat sok különálló változóba szórnánk szét, a kód könnyen rendezetlenné válna. Ezért létrehozhatunk egy `Animal` struktúrát, és egy állat információit egy helyre tehetjük.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Ebben a kódban:

- `id`: az állat egyedi azonosítója.
- `name`: az állat neve.
- `imageName`: az állat képének neve.
- `avatarEmoji`: az állat emoji jele.
- `distributionArea`: elterjedési terület.
- `habitat`: élőhely.
- `animalDescription`: az állat leírása.

Ezek közül:

```swift
let id = UUID()
```

Az `id` minden egyes állat azonosítására szolgál. Később a `ForEach` segítségével fogjuk megjeleníteni az állatlistát, és a `.sheet(item:)` segítségével az aktuálisan kiválasztott állat alapján nyitunk meg egy részletező nézetet, ezért az `Animal`-nek követnie kell az `Identifiable` protokollt.

Az `Identifiable` szerepe az, hogy elmondja a SwiftUI-nak: minden állatnak van egy `id` értéke, amellyel megkülönböztethető a többitől.

## Állatadatok létrehozása

Ezután a `ContentView`-ban létrehozunk egy állattömböt.

A tömb öt `Animal` értéket tárol, és minden `Animal` egy állatot jelöl.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Meleg és mérsékelt óceánok szerte a világon.",
            habitat: "Óceánok, part menti vizek és néhány nagy folyó.",
            animalDescription: "A delfinek intelligens tengeri emlősök. Csoportokban élnek, hangokkal kommunikálnak, és játékos viselkedésükről ismertek."
        ),
        // Zsiráf
        Animal(
            name: "Zsiráf",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Szavannák és nyílt erdőségek Afrikában.",
            habitat: "Füves területek, szavannák és nyílt erdők.",
            animalDescription: "A zsiráfok a legmagasabb szárazföldi állatok. Hosszú nyakuk és hosszú lábuk van, és általában magas fák leveleivel táplálkoznak."
        ),
        // Oroszlán
        Animal(
            name: "Oroszlán",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Főként a Szaharától délre fekvő Afrikában él, kisebb populációval Nyugat-Indiában.",
            habitat: "Füves területek, szavannák és nyílt erdőségek.",
            animalDescription: "Az oroszlánok erőteljes nagymacskák. Általában falkáknak nevezett csoportokban élnek, és gyakran az állatvilág királyaiként emlegetik őket."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Hegyvidéki erdők Közép-Kínában.",
            habitat: "Bambuszerdők hűvös és nedves hegyvidéki területeken.",
            animalDescription: "A pandák fekete-fehér bundájukról ismert medvék. Főként bambuszt esznek, és a világ egyik legismertebb állatai közé tartoznak."
        ),
        // Jegesmedve
        Animal(
            name: "Jegesmedve",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Sarkvidéki területek az Északi-sark körül.",
            habitat: "Tengeri jég, part menti területek és hideg sarkvidéki környezetek.",
            animalDescription: "A jegesmedvék nagy testű medvék, amelyek a hideg környezethez alkalmazkodtak. Erős úszók, és főként a tengeri jégre támaszkodnak a fókavadászathoz."
        )
    ]

    var body: some View {
        Text("Állatenciklopédia")
    }
}
```

Itt az `animals` egy tömb:

```swift
let animals: [Animal]
```

Az `[Animal]` azt jelenti, hogy ebben a tömbben több `Animal` található.

Vagyis az `animals` nem egyetlen állat, hanem egy állatcsoport.

## Az állatlista megjelenítése

Most a `ForEach` segítségével megjeleníthetjük az állatlistát.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Megjelenített eredmény:

![view](../../../Resource/029_view1.png)

Ebben a kódban:

```swift
ForEach(animals) { animal in
    ...
}
```

Ez azt jelenti, hogy bejárjuk az `animals` tömböt.

Minden ciklusban az `animal` az éppen megjelenített aktuális állatot jelenti.

Például az első ciklusban az `animal` a delfin; a második ciklusban az `animal` a zsiráf.

Ezért az aktuális állat információit így jeleníthetjük meg:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Így az öt állat megjeleníthető az oldalon.

## Az állatlista kattinthatóvá tétele

A lista most már megjelenik, de még nem lehet rákoppintani.

Ha azt szeretnénk, hogy egy állatra koppintva megjelenjen a részletes nézet, először rögzítenünk kell az „aktuálisan kiválasztott állatot”.

Ezért a `ContentView`-hoz hozzáadunk egy állapotváltozót:

```swift
@State private var selectedAnimal: Animal? = nil
```

Itt a `selectedAnimal` egy `Animal?` opcionális érték.

Ez azt jelenti, hogy lehet benne egy állat, de az is lehet, hogy nincs benne állat.

Az alapértelmezett érték `nil`, ami azt jelenti, hogy kezdetben nincs kiválasztva egyetlen állat sem.

Ezután minden állatsort `Button`-né alakítunk:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

A lényeges kódsor ez:

```swift
selectedAnimal = animal
```

Amikor a felhasználó rákoppint egy állatra, ezt az állatot elmentjük a `selectedAnimal` változóba.

Például ha a felhasználó a delfinre koppint, a `selectedAnimal` a delfint tárolja.

Ha a felhasználó a pandára koppint, a `selectedAnimal` a pandát tárolja.

Vagyis a `selectedAnimal` annak rögzítésére szolgál, hogy a felhasználó éppen melyik állatra koppintott.

## Sheet felugró nézet

Most már gombbal rögzíteni tudjuk az „aktuálisan megkoppintott állatot”.

Ezután meg kell valósítanunk egy felugró nézetet az állatrészletek megjelenítéséhez.

![view](../../../Resource/029_view2.png)

SwiftUI-ban ezt a felugró hatást a `Sheet` segítségével valósíthatjuk meg.

A `Sheet` felfogható egy ideiglenesen megjelenő oldalként. Az aktuális oldal fölött jelenik meg, és miután a felhasználó megnézte a tartalmat, lefelé húzással bezárhatja.

## Sheet példa

Mielőtt valóban megjelenítenénk az állatrészleteket, először egy egyszerű példán keresztül értsük meg, hogyan jelenik meg a `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet megjelenítése")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet nézet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Megjelenített eredmény:

![view](../../../Resource/029_view3.png)

Ebben a kódban létrehozunk egy logikai értéket:

```swift
@State private var showSheet = false
```

A `showSheet` alapértelmezett értéke `false`, vagyis kezdetben nem jelenik meg a `Sheet`.

Amikor a gombra koppintunk:

```swift
showSheet.toggle()
```

A `toggle()` a logikai érték átkapcsolását jelenti.

Ha eredetileg `false`, a `toggle()` meghívása után `true` lesz.

Ha eredetileg `true`, a `toggle()` meghívása után `false` lesz.

Ezért a gombra koppintás után a `showSheet` `false` értékről `true` értékre vált.

Amikor a `showSheet` `true` lesz, az alábbi kód megjeleníti a `Sheet`-et:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet nézet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ez a kód azt jelenti: amikor a `showSheet` értéke `true`, jelenjen meg egy `Sheet`, és a `Sheet` tartalmában jelenjen meg a `Text("Sheet nézet")`.

Megjelenített eredmény:

![view](../../../Resource/029_view4.png)

Ez az írásmód fix tartalom megjelenítésére alkalmas.

Például gombra koppintás után megjelenhet egy beállítási oldal, magyarázó oldal, figyelmeztető oldal stb.

### A Sheet elhelyezése

Bár a `Sheet` egy felugró nézet, SwiftUI-ban nem úgy írjuk, mint egy önálló nézetet, például a `Text()` vagy az `Image()` esetében, hanem nézetmódosítóként használjuk.

Vagyis a `.sheet(...)` hasonló a `.font()`, `.padding()`, `.shadow()` módosítókhoz: valamelyik nézet mögé kell hozzáadni.

Például:

```swift
Button("Sheet megjelenítése") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet nézet")
}
```

Ebben a példában a `.sheet` a `Button` mögé került.

Amikor a `showSheet` `true` értékre vált, a SwiftUI megjeleníti a `Sheet`-et, és a kapcsos zárójelekben lévő tartalmat mutatja:

```swift
Text("Sheet nézet")
```

Valódi fejlesztés során azonban, ha egy oldalon több gomb is van, általában nem adunk minden gombhoz külön `.sheet` módosítót.

Gyakoribb megoldás, hogy a `.sheet`-et a külső nézet mögé tesszük.

Például:

```swift
VStack {
    Button("Sheet megjelenítése") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet nézet")
}
```

A gomb a `showSheet` módosításáért felel, a külső nézet pedig a `showSheet` `true` értéke alapján megjeleníti a `Sheet`-et.

## Opcionális értékhez kötött Sheet

Az előbb tanult írásmód ez volt:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet nézet")
}
```

Ez az írásmód egy fix oldal megjelenítésének és elrejtésének vezérlésére alkalmas.

Az állatenciklopédia példában azonban nemcsak azt kell tudnunk, hogy „megjelenjen-e a `Sheet`”, hanem azt is, hogy „melyik állatra koppintottunk”.

Például:

Ha a felhasználó a delfinre koppint, a `Sheet`-ben a delfin részleteinek kell megjelennie.

Ha a felhasználó a pandára koppint, a `Sheet`-ben a panda részleteinek kell megjelennie.

Ezért itt inkább a Sheet egy másik írásmódja megfelelő:

```swift
.sheet(item: $selectedAnimal) { animal in
    // A Sheetben megjelenő tartalom
}
```

Ebben a kódban a `Sheet` egy `selectedAnimal` opcionális értékhez van kötve.

Itt figyelni kell arra, hogy az `item:` után `$selectedAnimal` szerepel, nem pedig `selectedAnimal`.

Ennek oka, hogy a `Sheet` nemcsak kiolvassa a `selectedAnimal` értékét, hanem annak változása alapján dönti el, hogy meg kell-e jelennie.

Ezt a kódot így érthetjük meg:

- Amikor a `selectedAnimal` értéke `nil`, nem jelenik meg a `Sheet`.
- Amikor a `selectedAnimal` rendelkezik értékkel, megjelenik a `Sheet`.
- Amikor a `Sheet` bezárul, a SwiftUI újra `nil` értékre állítja a `selectedAnimal` változót.

A SwiftUI a `selectedAnimal`-ben tárolt állatot átadja a kapcsos zárójelben lévő `animal` paraméternek.

Vagyis a `.sheet(item:)` nemcsak a felugrást vezérli, hanem a kiválasztott adatot is átadja a `Sheet`-nek.

## Állatnév megjelenítése Sheetben

Most még ne siessünk egy bonyolult részletező nézet létrehozásával.

Annak érdekében, hogy a kód könnyebben érthető legyen, először csak az aktuális állat nevét jelenítsük meg a `Sheet`-ben.

A `VStack` mögé adjuk hozzá a `.sheet(item:)` módosítót:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Itt a legfontosabb kódrészlet ez:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Amikor a `selectedAnimal` rendelkezik értékkel, a `Sheet` megjelenik.

A kapcsos zárójelben lévő `animal` az aktuálisan kiválasztott állat.

Ezért:

```swift
Text(animal.name)
```

az aktuálisan megkoppintott állat nevét jeleníti meg.

Például ha a `Delfin` elemre koppintunk, a Sheetben `Delfin` jelenik meg.

Ha a `Panda` elemre koppintunk, a `Sheet`-ben `Panda` jelenik meg.

Így megvalósítottuk, hogy különböző állatokra koppintva különböző állatnevek jelenjenek meg.

Állatnév megjelenítése:

![view](../../../Resource/029_view5.png)

Az állatrészleteknek azonban nemcsak egy nevet kell megjeleníteniük, hanem a nevet, az elterjedési területet, az élőhelyet és a leírást is.

Ha mindezt a kódot közvetlenül a `.sheet` belsejébe írnánk, a kód nagyon hosszúvá válna, és nehezebb lenne olvasni.

Ezért a következő lépésben létrehozunk egy új egyéni nézetet, amely kifejezetten az állatrészletek megjelenítéséért felel.

## Állatrészletező nézet létrehozása

Ezután létrehozunk egy új, `AnimalDetailView` nevű egyéni nézetet.

Ez a nézet egy `Animal` értéket kap, és megjeleníti az állat részleteit.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Elterjedési terület** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Élőhely** ：\(animal.habitat)")

                    Divider()

                    Text("**Állatleírás** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Megjelenített eredmény:

![view](../../../Resource/029_view2.png)

Itt a lényeg ez:

```swift
var animal: Animal
```

Ez azt jelenti, hogy az `AnimalDetailView`-nak kívülről kell megkapnia egy állatot.

Miután megkapta az állatot, a részletező nézet használni tudja az állat különböző információit:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Vagyis az `AnimalDetailView` csak a kívülről átadott állat megjelenítéséért felel.

### Markdown félkövér szöveg

A részletező nézetben ilyen kódot írtunk:

```swift
Text("**Élőhely:** \(animal.habitat)")
```

Itt két ismeretpontról van szó.

Először: a `**Élőhely:**` `Markdown` szintaxist használ. A két csillag közé tett szöveg félkövéren jelenik meg.

Másodszor: a `\()` karakterlánc-interpoláció, amely egy változó értékét tudja megjeleníteni a szövegben.

Ez a kód először félkövéren megjeleníti az `Élőhely:` szöveget, majd megjeleníti az állat élőhelyét.

## Részletező nézet megjelenítése Sheetben

Miután létrehoztuk az `AnimalDetailView`-t, visszatérhetünk a `ContentView`-hoz, és a `Sheet`-ben lévő eredeti névnézetet lecserélhetjük a részletező nézetre.

Eredetileg ez volt:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Most erre módosítjuk:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Itt az `animal:` az `AnimalDetailView` paraméterneve.

A mögötte lévő `animal` pedig a `.sheet(item:)` által átadott aktuális állat.

Vagyis az aktuálisan megkoppintott állatot átadjuk az `AnimalDetailView`-nak megjelenítésre.

Teljes struktúra:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
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
```

Amikor a felhasználó rákoppint egy állatra:

```swift
selectedAnimal = animal
```

A `selectedAnimal` `nil` értékről konkrét állatra változik, és a `Sheet` érzékeli, hogy a `selectedAnimal` rendelkezik értékkel, ezért megjeleníti a nézetet.

A `Sheet` a `selectedAnimal`-ben lévő állatot átadja az `AnimalDetailView` nézetnek, az `AnimalDetailView` pedig megjeleníti az állat részleteit.

Így megvalósítottuk azt a funkciót, hogy az állatlistára koppintva megjelenjen a megfelelő állat részletező nézete.

## A Sheet két írásmódjának különbsége

Most már a `.sheet(item:)` segítségével elkészítettük az állatrészletező nézet megjelenítését.

Itt röviden összefoglalhatjuk a `Sheet` két gyakori írásmódját.

### Az első: logikai értékhez kötés

```swift
@State private var showSheet = false

Button("Sheet megjelenítése") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet nézet")
}
```

Ez az írásmód fix tartalom felugratására alkalmas, például beállítási oldal, magyarázó oldal, figyelmeztető oldal stb. esetén.

A `showSheet` egy logikai érték, amelynek csak két állapota van: `true` és `false`.

Amikor a `showSheet` értéke `true`, a `Sheet` megjelenik.

Amikor a `showSheet` értéke `false`, a `Sheet` nem jelenik meg.

### A második: opcionális értékhez kötés

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Ez az írásmód akkor alkalmas, amikor a kiválasztott adat alapján szeretnénk különböző tartalmat megjeleníteni.

Ebben a leckében különböző állatokra koppintunk, és különböző állatrészleteket kell megjelenítenünk, ezért a `.sheet(item:)` megfelelőbb.

## Teljes kód

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Állat neve
    let name: String
    
    // Állat képe
    let imageName: String
    
    // Állat címkéjének jele
    let avatarEmoji: String
    
    // Elterjedési terület
    let distributionArea: String
    
    // Élőhely
    let habitat: String
    
    // Állat leírása
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Meleg és mérsékelt óceánok szerte a világon.",
            habitat: "Óceánok, part menti vizek és néhány nagy folyó.",
            animalDescription: "A delfinek intelligens tengeri emlősök. Csoportokban élnek, hangokkal kommunikálnak, és játékos viselkedésükről ismertek."
        ),
        // Zsiráf
        Animal(
            name: "Zsiráf",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Szavannák és nyílt erdőségek Afrikában.",
            habitat: "Füves területek, szavannák és nyílt erdők.",
            animalDescription: "A zsiráfok a legmagasabb szárazföldi állatok. Hosszú nyakuk és hosszú lábuk van, és általában magas fák leveleivel táplálkoznak."
        ),
        // Oroszlán
        Animal(
            name: "Oroszlán",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Főként a Szaharától délre fekvő Afrikában él, kisebb populációval Nyugat-Indiában.",
            habitat: "Füves területek, szavannák és nyílt erdőségek.",
            animalDescription: "Az oroszlánok erőteljes nagymacskák. Általában falkáknak nevezett csoportokban élnek, és gyakran az állatvilág királyaiként emlegetik őket."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Hegyvidéki erdők Közép-Kínában.",
            habitat: "Bambuszerdők hűvös és nedves hegyvidéki területeken.",
            animalDescription: "A pandák fekete-fehér bundájukról ismert medvék. Főként bambuszt esznek, és a világ egyik legismertebb állatai közé tartoznak."
        ),
        // Jegesmedve
        Animal(
            name: "Jegesmedve",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Sarkvidéki területek az Északi-sark körül.",
            habitat: "Tengeri jég, part menti területek és hideg sarkvidéki környezetek.",
            animalDescription: "A jegesmedvék nagy testű medvék, amelyek a hideg környezethez alkalmazkodtak. Erős úszók, és főként a tengeri jégre támaszkodnak a fókavadászathoz."
        )
    ]
    
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
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Elterjedési terület** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Élőhely** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Állatleírás** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Összefoglalás

Ebben a leckében elkészítettünk egy egyszerű állatenciklopédia oldalt.

Először az `Animal` struktúrával tároltuk az állatinformációkat, majd egy tömbben eltároltunk öt állatot, végül a `ForEach` segítségével megjelenítettük az állatlistát.

Amikor a felhasználó rákoppint egy állatra, ezt az állatot elmentjük a `selectedAnimal` változóba:

```swift
selectedAnimal = animal
```

Amikor a `selectedAnimal` rendelkezik értékkel, a `.sheet(item:)` megjeleníti a részletező nézetet, és a kiválasztott állatot átadja az `AnimalDetailView`-nak.

Ebben a leckében nem a felület stílusa a legfontosabb, hanem ennek az adatátadási útvonalnak a megértése:

```swift
Állatra koppintás → selectedAnimal elmenti az állatot → Sheet megjelenik → AnimalDetailView megjeleníti a részleteket
```

Ha ezt az útvonalat megérted, később több hasonló funkciót is készíthetsz, például termékrészleteket, kurzusrészleteket, cikkrészleteket, névjegyrészleteket stb.
