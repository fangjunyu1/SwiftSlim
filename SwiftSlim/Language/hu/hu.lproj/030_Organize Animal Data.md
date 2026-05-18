# Állatadatok rendszerezése

Az előző leckében elkészítettünk egy egyszerű állatenciklopédia-példát.

![view](../../../Resource/029_view.png)

Amikor a felhasználó rákoppint egy állatra, az oldal egy `Sheet` segítségével jeleníti meg az állat részleteit.

Az előző lecke kódjában azonban van egy probléma: az állatadatok közvetlenül a `ContentView` belsejében vannak megírva.

Például:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Az állatlista megjelenítése
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ez a kód normálisan fut, de amikor az állatadatok mennyisége egyre nagyobb lesz, a `ContentView` nagyon hosszúvá válik.

A `ContentView`-nek alapvetően főleg a felület megjelenítéséért kellene felelnie, most azonban nagy mennyiségű állatadatot is tárol. Ez rontja a kód olvashatóságát, és a későbbi karbantartást is kényelmetlenebbé teszi.

Ezért ebben a leckében egy dolgot fogunk megtenni:

Kiszervezzük az állatadatokat a `ContentView`-ból.

## Miért kell szétválasztani az adatokat?

SwiftUI-ban a nézetkód általában a felület megjelenítéséért felel.

Például:

```swift
Text("Dolphin")
Image("dolphin")
```

Ezek a kódrészletek mind a felület megjelenítéséhez kapcsolódnak.

Maguk az állatadatok, például az állat neve, a kép neve, az elterjedési terület, az élőhely és a leíró szöveg, nem a felület szerkezetét jelentik.

Inkább egy rögzített adatkészlethez hasonlítanak:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

Ha a felületkódot és az adatkódot mind együtt írjuk meg, a kód egyre rendezetlenebbé válik.

Ezért az állatadatokat elhelyezhetjük az `Animal` típusban.

## Rögzített adatok tárolása static használatával

Először nézzük meg a rendszerezett írásmódot:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Itt hozzáadtunk egy új kódsort:

```swift
static let animals: [Animal] = [
    
]
```

A `static` statikus tulajdonságot jelent.

A statikus tulajdonság magához a típushoz tartozik, nem egy konkrét példányhoz.

Ez a mondat kissé elvont, ezért egy egyszerű példán keresztül érthetjük meg.

## Normál tulajdonságok és statikus tulajdonságok

Például definiálunk egy `Student` típust:

```swift
struct Student {
    let name: String
}
```

Itt a `name` egy normál tulajdonság. A normál tulajdonság egy konkrét példányhoz tartozik.

Ha el szeretnénk érni a `name` értékét, először létre kell hoznunk egy konkrét diákot:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Itt a `student` egy példány. Egyelőre úgy is érthetjük, mint egy konkrét diákkal kapcsolatos adatot.

Mivel minden diáknak más lehet a neve, a `name` értékének egy konkrét diákhoz kell tartoznia.

Vannak azonban olyan adatok, amelyek nem egy konkrét példányhoz tartoznak.

Például szeretnénk előkészíteni egy csoport mintaadatot az előnézetekhez:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

Itt a `previewStudents` előtt szerepel a `static`, ezért ez egy statikus tulajdonság.

A statikus tulajdonság nem egy bizonyos diákhoz tartozik, hanem magához a `Student` típushoz.

Ezért nem kell először létrehoznunk egy diákot, hanem közvetlenül a típusnéven keresztül érhetjük el:

```swift
print(Student.previewStudents.count)    // 3
```

Az elérési forma itt ez:

```swift
Tipusnev.statikusTulajdonsagNev
```

Vagyis:

```swift
Student.previewStudents
```

Ugyanígy az állatenciklopédiában így érhetjük el az állatadatokat:

```swift
Animal.animals
```

## Vissza a ContentView-hoz

Most az állatadatok már az `Animal` típusban vannak elmentve.

Ezért a `ContentView` belsejében már nem kell nagyon hosszú állattömböt írnunk.

Átírhatjuk így:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Az állatlista megjelenítése
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ez a kódsor azt jelenti:

```swift
let animals = Animal.animals
```

Kivesszük az `animals` állatadatokat az `Animal` típusból, majd elmentjük az aktuális nézet `animals` konstansába.

Így írva a `ContentView` egyszerűbb lesz.

A `ContentView` a felület megjelenítéséért felel, az `Animal.animals` pedig az állatadatok biztosításáért.

## Az Animal áthelyezése külön fájlba

Az előző leckében, hogy a példa könnyebben érthető legyen, az `Animal` és a `ContentView` ugyanabba a fájlba került.

Mivel akkor a kód még viszonylag rövid volt, ez nem jelentett problémát.

Most azonban egyre több az állatadat. Ha továbbra is az összes kódot a `ContentView.swift` fájlba tesszük, a fájl nagyon hosszúvá és nehezebben olvashatóvá válik.

Ezért az `Animal` típust külön új Swift-fájlba helyezhetjük.

Xcode-ban létrehozhatsz egy új Swift-fájlt, például:

```swift
Animal.swift
```

Ezután helyezd át az `Animal` struktúrát ebbe a fájlba:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Az ilyen rendszerezés után:

A `ContentView.swift` a felület megjelenítéséért felel.

Az `Animal.swift` az állatadatok szerkezetének leírásáért felel.

Bár különböző fájlokban vannak, amíg ugyanabban a projektben találhatók, a `ContentView` továbbra is közvetlenül használhatja az `Animal` típust.

Például:

```swift
let animals = Animal.animals
```

Itt nincs szükség arra, hogy a `ContentView.swift` fájlban külön importáld az `Animal.swift` fájlt.

A Swift automatikusan felismeri az ugyanabban a projektben lévő Swift-fájlokat.

## Kód további rendszerezése extension használatával

Most az állatadatokat már áthelyeztük a `ContentView`-ból az `Animal` típusba.

Az `Animal` struktúra azonban még mindig egyszerre kétféle kódot tartalmaz:

Az első típus maga az állatmodell tulajdonságai:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

A második típus a rögzített állatadatok:

```swift
static let animals: [Animal] = [
    // ...
]
```

Ahhoz, hogy a kód szerkezete világosabb legyen, használhatjuk az `extension` lehetőséget a két rész szétválasztására.

Az `extension` jelentése: kiterjesztés.

Egy meglévő típus alapján további új kódot adhat hozzá.

Például:

```swift
extension Animal {
    
}
```

Ez azt jelenti, hogy az `Animal` típust bővítjük.

## Állatadatok elhelyezése extensionben

Az `Animal` típust átírhatjuk így:

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Az ilyen rendszerezés után a kód szerkezete világosabb lesz.

A `struct Animal` azért felel, hogy leírja, milyen tulajdonságokkal kell rendelkeznie egy állatnak.

Az `extension Animal` egy rögzített állatadat-készlet tárolásáért felel.

Fontos, hogy bár az `animals` átkerült az `extension Animal` részbe, a használati módja nem változik.

Továbbra is így használhatjuk:

```swift
let animals = Animal.animals
```

Ez az `extension` egyik jellemzője is: csak a kód rendszerezésében segít, és nem változtatja meg a külső hívási módot.

## Ha sok az adat, külön AnimalData fájl is létrehozható

Most az `Animal` típust már külön `Animal.swift` fájlba helyeztük.

Ha nincs sok állatadat, az `extension Animal` közvetlenül az `Animal.swift` fájlba is írható.

De ha az állatadatok egyre nagyobb mennyiségűek, létrehozhatsz még egy fájlt is, például:

```swift
AnimalData.swift
```

Ezután helyezd bele a rögzített állatadatokat:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Állatadatok
    ]
}
```

Így a kód felelősségi körei világosabbak lesznek:

Az `Animal.swift` csak az állatmodell definiálásáért felel.

Az `AnimalData.swift` csak az állatadatok tárolásáért felel.

A `ContentView.swift` csak a felület megjelenítéséért felel.

Minden fájl felelőssége világosabb lesz.

Fontos, hogy az `AnimalData.swift` csak egy fájlnév, nem új Swift-típus. Ebben a fájlban továbbra is az `extension Animal` segítségével adunk rögzített adatokat az `Animal` típushoz.

## Teljes kód

Az alábbi a rendszerezett `Animal.swift` kód:

```swift
import Foundation

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

A rendszerezett `AnimalData.swift` kód:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

A `ContentView.swift` fájlban így használhatod:

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
```

Tipp: Az `Animal.swift` és az `AnimalData.swift` fájlban az első sor ez:

```swift
import Foundation
```

Korábban, amikor SwiftUI-felületet írtunk, gyakran ezt használtuk:

```swift
import SwiftUI
```

Ennek oka, hogy a `ContentView`, a `Text`, a `Button` és a `Color` mind a felülethez kapcsolódnak, ezért felületfájl írásakor általában importálnunk kell a SwiftUI-t.

Itt azonban az `Animal.swift` és az `AnimalData.swift` nem felületfájlok. Főként az állatmodell definiálására és az állatadatok tárolására szolgálnak.

Ebben a kódban a `UUID()` használatához a `Foundation` szükséges, ezért elég a `Foundation` importálása.

## Összegzés

Ebben a leckében főleg egy dolgot tettünk: kiszerveztük az állatadatokat a `ContentView`-ból.

Az eredeti megoldásban az állatadatokat közvetlenül a `ContentView` belsejébe írtuk. Ez a kód futtatható, de amikor az adatok mennyisége megnő, a nézetfájl egyre hosszabb lesz.

A rendszerezés után a `ContentView` csak a felület megjelenítéséért felel, az `Animal.animals` pedig az állatadatok biztosításáért.

Ebben a leckében két új ismeretet is tanultunk.

Az első a `static`.

A `static` statikus tulajdonságot jelent. A statikus tulajdonság magához a típushoz tartozik, és közvetlenül elérhető a „Típusnév.tulajdonságnév” formában.

Például:

```swift
Animal.animals
```

A második az `extension`.

Az `extension` kiterjesztést jelent. Lehetővé teszi, hogy ugyanannak a típusnak a kódját több részre bontva írjuk meg, így a kód szerkezete világosabb lesz.

Ebben a példában az `extension Animal` segítségével tároljuk az állatadatokat, így maga az `Animal` struktúra egyszerűbb marad.

Emellett az `Animal` főként adatmodellt tárol, és nem ír közvetlenül SwiftUI-felületet, ezért itt az `import Foundation` használatos.

Ennek a leckének nem az a célja, hogy a kód bonyolultabb legyen, hanem az, hogy könnyebben olvasható és karbantartható legyen.
