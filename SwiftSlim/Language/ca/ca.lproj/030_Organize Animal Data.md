# Organitzar les dades dels animals

A la lliçó anterior, vam completar un exemple senzill d'enciclopèdia d'animals.

![view](../../../Resource/029_view.png)

Quan l'usuari toca un animal, la pàgina mostra els detalls de l'animal mitjançant un `Sheet`.

Tanmateix, el codi de la lliçó anterior tenia un problema: les dades dels animals estaven escrites directament dins de `ContentView`.

Per exemple:

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
            // Mostra la llista d'animals
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Aquest codi es pot executar correctament, però quan hi ha cada vegada més dades d'animals, `ContentView` es torna molt llarg.

`ContentView` hauria de ser responsable principalment de mostrar la interfície, però ara també desa una gran quantitat de dades d'animals. Això dificulta la lectura del codi i tampoc facilita el manteniment posterior.

Per això, en aquesta lliçó farem una cosa:

Treure les dades dels animals de `ContentView` i organitzar-les fora.

## Per què cal separar les dades?

En SwiftUI, el codi de vista normalment és responsable de mostrar la interfície.

Per exemple:

```swift
Text("Dolphin")
Image("dolphin")
```

Aquest codi està relacionat amb la visualització de la interfície.

Però les dades dels animals en si, com ara el nom de l'animal, el nom de la imatge, l'àrea de distribució, l'hàbitat i el text descriptiu, no formen part de l'estructura de la interfície.

S'assemblen més a un conjunt de dades fixes:

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

Si escrivim el codi de la interfície i el codi de les dades junts, el codi serà cada vegada més desordenat.

Per tant, podem posar les dades dels animals dins del tipus `Animal`.

## Utilitzar static per desar dades fixes

Primer mirem la manera d'escriure el codi després d'organitzar-lo:

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

Aquí s'ha afegit una línia de codi:

```swift
static let animals: [Animal] = [
    
]
```

`static` indica una propietat estàtica.

Una propietat estàtica pertany al tipus en si, no a una instància concreta.

Aquesta frase és una mica abstracta, però la podem entendre amb un exemple senzill.

## Propietats normals i propietats estàtiques

Per exemple, definim un `Student`:

```swift
struct Student {
    let name: String
}
```

Aquí `name` és una propietat normal, i una propietat normal pertany a una instància concreta.

Si volem accedir a `name`, primer hem de crear un estudiant concret:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Aquí `student` és una instància, i també es pot entendre provisionalment com una dada concreta d'un estudiant.

Com que el nom de cada estudiant pot ser diferent, `name` ha d'estar dins d'un estudiant concret.

Però hi ha algunes dades que no pertanyen a cap instància concreta.

Per exemple, volem preparar un conjunt de dades d'exemple per a la previsualització:

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

Aquí `previewStudents` té `static` al davant, de manera que és una propietat estàtica.

Una propietat estàtica no pertany a un estudiant concret, sinó al tipus `Student` en si.

Per tant, no cal crear primer un estudiant concret; podem accedir-hi directament mitjançant el nom del tipus:

```swift
print(Student.previewStudents.count)    // 3
```

La manera d'accedir-hi és:

```swift
NomDelTipus.nomDeLaPropietatEstàtica
```

És a dir:

```swift
Student.previewStudents
```

De la mateixa manera, a l'enciclopèdia d'animals podem accedir a les dades dels animals així:

```swift
Animal.animals
```

## Tornem a ContentView

Ara, les dades dels animals ja s'han desat dins del tipus `Animal`.

Per això, dins de `ContentView` ja no cal escriure un array d'animals molt llarg.

Ho podem canviar així:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Mostra la llista d'animals
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Aquesta línia de codi significa:

```swift
let animals = Animal.animals
```

Agafa el conjunt de dades d'animals `animals` del tipus `Animal` i el desa a la constant `animals` de la vista actual.

Després d'escriure-ho així, `ContentView` serà més net.

`ContentView` és responsable de mostrar la interfície, i `Animal.animals` és responsable de proporcionar les dades dels animals.

## Separar Animal en un fitxer independent

A la lliçó anterior, per fer que l'exemple fos més fàcil d'entendre, vam escriure `Animal` i `ContentView` al mateix fitxer.

Com que en aquell moment hi havia poc codi, escriure-ho així no era cap problema.

Però ara hi ha cada vegada més dades d'animals. Si continuem escrivint tot el codi dins de `ContentView.swift`, el fitxer es farà molt llarg i tampoc serà còmode de llegir.

Per tant, podem posar `Animal` sol dins d'un fitxer Swift nou.

A Xcode, podem crear un fitxer Swift nou, per exemple:

```swift
Animal.swift
```

Després movem l'estructura `Animal` a aquest fitxer:

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

Després d'organitzar-ho així:

`ContentView.swift` és responsable de mostrar la interfície.

`Animal.swift` és responsable de descriure l'estructura de les dades dels animals.

Tot i que estan en fitxers diferents, mentre tots dos estiguin dins del mateix projecte, `ContentView` encara pot utilitzar `Animal` directament.

Per exemple:

```swift
let animals = Animal.animals
```

Aquí no cal importar `Animal.swift` de manera addicional dins de `ContentView.swift`.

Swift reconeix automàticament els fitxers Swift del mateix projecte.

## Utilitzar extension per continuar organitzant el codi

Ara ja hem mogut les dades dels animals de `ContentView` a `Animal`.

Tanmateix, l'estructura `Animal` encara conté alhora dos tipus de codi:

El primer tipus són les propietats del model d'animal:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

El segon tipus són les dades fixes dels animals:

```swift
static let animals: [Animal] = [
    // ...
]
```

Per fer que l'estructura del codi sigui més clara, podem utilitzar `extension` per separar aquestes dues parts.

`extension` significa extensió.

Permet continuar afegint codi nou sobre la base d'un tipus existent.

Per exemple:

```swift
extension Animal {
    
}
```

Això indica que estem ampliant el tipus `Animal`.

## Posar les dades dels animals dins d'extension

Podem canviar `Animal` així:

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

Després d'organitzar-ho així, l'estructura del codi serà més clara.

`struct Animal` és responsable de descriure quines propietats ha de tenir un animal.

`extension Animal` és responsable de desar un conjunt de dades fixes d'animals.

Tingues en compte que, tot i que `animals` s'ha mogut dins de `extension Animal`, la manera d'utilitzar-lo no canvia.

Encara el podem utilitzar així:

```swift
let animals = Animal.animals
```

Aquesta també és una característica de `extension`: només ens ajuda a organitzar el codi i no canvia la manera com es crida des de fora.

## Quan hi ha moltes dades, també es pot crear un fitxer AnimalData nou

Ara ja hem posat `Animal` dins d'un fitxer `Animal.swift` independent.

Si hi ha poques dades d'animals, podem escriure directament `extension Animal` dins de `Animal.swift`.

Però si les dades dels animals continuen augmentant, també podem crear un altre fitxer, per exemple:

```swift
AnimalData.swift
```

Després hi posem les dades fixes dels animals:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dades dels animals
    ]
}
```

Després de fer-ho així, la divisió de responsabilitats del codi serà més clara:

`Animal.swift` només és responsable de definir el model d'animal.

`AnimalData.swift` només és responsable de desar les dades dels animals.

`ContentView.swift` només és responsable de mostrar la interfície.

Les responsabilitats de cada fitxer són més clares.

Tingues en compte que `AnimalData.swift` només és el nom del fitxer, no un nou tipus Swift. En aquest fitxer, encara s'està afegint dades fixes a `Animal` mitjançant `extension Animal`.

## Codi complet

A continuació hi ha el codi de `Animal.swift` després d'organitzar-lo:

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

Codi de `AnimalData.swift` després d'organitzar-lo:

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

A `ContentView.swift`, es pot utilitzar així:

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

Nota: als fitxers `Animal.swift` i `AnimalData.swift`, la primera línia és:

```swift
import Foundation
```

Abans, quan escrivíem interfícies SwiftUI, sovint utilitzàvem:

```swift
import SwiftUI
```

Això és perquè `ContentView`, `Text`, `Button` i `Color` estan relacionats amb la interfície, de manera que quan escrivim fitxers de vista normalment cal importar SwiftUI.

Però aquí `Animal.swift` i `AnimalData.swift` no són fitxers de vista. S'utilitzen principalment per definir el model d'animal i desar les dades dels animals.

En aquest fragment de codi, `UUID()` necessita utilitzar `Foundation`, així que només cal importar `Foundation`.

## Resum

En aquesta lliçó hem fet principalment una cosa: treure les dades dels animals de `ContentView` i organitzar-les fora.

La manera original d'escriure-ho era posar les dades dels animals directament dins de `ContentView`. Així el codi pot funcionar, però quan les dades augmenten, el fitxer de vista es fa cada vegada més llarg.

Després d'organitzar-ho, `ContentView` només és responsable de mostrar la interfície, i `Animal.animals` és responsable de proporcionar les dades dels animals.

En aquesta lliçó també hem après dos coneixements nous.

El primer és `static`.

`static` indica una propietat estàtica. Una propietat estàtica pertany al tipus en si i es pot accedir directament mitjançant la forma “NomDelTipus.nomDeLaPropietat”.

Per exemple:

```swift
Animal.animals
```

El segon és `extension`.

`extension` significa extensió. Pot separar el codi del mateix tipus en diferents parts, fent que l'estructura del codi sigui més clara.

En aquest exemple, utilitzem `extension Animal` per desar les dades dels animals, de manera que l'estructura `Animal` en si sigui més concisa.

A més, `Animal` desa principalment un model de dades i no escriu directament una interfície SwiftUI, així que aquí s'utilitza `import Foundation`.

El punt principal d'aquesta lliçó no és fer que el codi sigui més complicat, sinó fer-lo més fàcil de llegir i mantenir.
