# Usporiadanie údajov o zvieratách

V predchádzajúcej lekcii sme dokončili jednoduchý príklad zvieracej encyklopédie.

![view](../../../Resource/029_view.png)

Keď používateľ klikne na určité zviera, stránka zobrazí detail zvieraťa prostredníctvom `Sheet`.

V kóde z predchádzajúcej lekcie však existuje jeden problém: údaje o zvieratách boli zapísané priamo v `ContentView`.

Napríklad:

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
            // Zobraziť zoznam zvierat
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Tento kód funguje správne, ale keď bude údajov o zvieratách čoraz viac, `ContentView` sa stane veľmi dlhým.

`ContentView` by mal pôvodne zodpovedať hlavne za zobrazovanie rozhrania, ale teraz zároveň uchováva veľké množstvo údajov o zvieratách. To ovplyvní čitateľnosť kódu a nebude to pohodlné pri neskoršej údržbe.

Preto v tejto lekcii urobíme jednu vec:

Presunieme údaje o zvieratách mimo `ContentView`.

## Prečo oddeľovať údaje?

V SwiftUI je kód zobrazenia zvyčajne zodpovedný za zobrazovanie rozhrania.

Napríklad:

```swift
Text("Dolphin")
Image("dolphin")
```

Tieto kódy súvisia so zobrazovaním rozhrania.

Samotné údaje o zvieratách, napríklad názov zvieraťa, názov obrázka, oblasť výskytu, biotop a opisný text, však nie sú štruktúrou rozhrania.

Sú skôr ako skupina pevných informácií:

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

Ak sa kód rozhrania a kód údajov zapíšu spolu, kód bude čoraz neprehľadnejší.

Preto môžeme údaje o zvieratách vložiť do typu `Animal`.

## Použitie static na uloženie pevných údajov

Najprv sa pozrime na upravený zápis:

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

Tu pribudol jeden riadok kódu:

```swift
static let animals: [Animal] = [
    
]
```

`static` označuje statickú vlastnosť.

Statická vlastnosť patrí samotnému typu, nie nejakej konkrétnej inštancii.

Táto veta je trochu abstraktná, môžeme si ju vysvetliť na jednoduchom príklade.

## Bežné vlastnosti a statické vlastnosti

Napríklad definujeme `Student`:

```swift
struct Student {
    let name: String
}
```

Tu je `name` bežná vlastnosť. Bežná vlastnosť patrí určitej konkrétnej inštancii.

Ak chceme pristúpiť k `name`, musíme najprv vytvoriť konkrétneho študenta:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Tu je `student` jedna inštancia. Dočasne ju môžeme chápať aj ako jednu konkrétnu sadu údajov o študentovi.

Pretože meno každého študenta môže byť iné, `name` musí byť uložené na konkrétnom študentovi.

Niektoré údaje však nepatria jednej konkrétnej inštancii.

Napríklad chceme pripraviť skupinu ukážkových údajov na náhľad:

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

Pred `previewStudents` je tu `static`, takže ide o statickú vlastnosť.

Statická vlastnosť nepatrí jednému študentovi, ale samotnému typu `Student`.

Preto nemusíme najprv vytvoriť určitého študenta a môžeme k nej pristúpiť priamo cez názov typu:

```swift
print(Student.previewStudents.count)    // 3
```

Tento spôsob prístupu je:

```swift
NázovTypu.názovStatickejVlastnosti
```

Teda:

```swift
Student.previewStudents
```

Podobne môžeme v zvieracej encyklopédii pristúpiť k údajom o zvieratách takto:

```swift
Animal.animals
```

## Späť k ContentView

Teraz sú údaje o zvieratách uložené v type `Animal`.

Preto už v `ContentView` nemusíme písať dlhé pole zvierat.

Môžeme ho zmeniť takto:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Zobraziť zoznam zvierat
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Tento riadok kódu znamená:

```swift
let animals = Animal.animals
```

Z typu `Animal` sa vyberie táto skupina údajov `animals` a uloží sa do konštanty `animals` v aktuálnom zobrazení.

Po takomto zápise bude `ContentView` stručnejší.

`ContentView` zodpovedá za zobrazovanie rozhrania a `Animal.animals` zodpovedá za poskytovanie údajov o zvieratách.

## Presunutie Animal do samostatného súboru

V predchádzajúcej lekcii sme kvôli jednoduchšiemu pochopeniu príkladu zapísali `Animal` a `ContentView` do toho istého súboru.

Keďže vtedy bolo kódu ešte málo, takýto zápis bol v poriadku.

Teraz je však údajov o zvieratách čoraz viac. Ak budeme naďalej písať všetok kód do `ContentView.swift`, súbor sa stane veľmi dlhým a nebude pohodlný na čítanie.

Preto môžeme `Animal` samostatne vložiť do nového súboru Swift.

V Xcode môžeme vytvoriť nový súbor Swift, napríklad:

```swift
Animal.swift
```

Potom presunieme štruktúru `Animal` do tohto súboru:

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

Po takomto usporiadaní:

`ContentView.swift` zodpovedá za zobrazovanie rozhrania.

`Animal.swift` zodpovedá za opis štruktúry údajov o zvieratách.

Hoci sú umiestnené v rôznych súboroch, ak sú všetky v tom istom projekte, `ContentView` môže naďalej priamo používať `Animal`.

Napríklad:

```swift
let animals = Animal.animals
```

Tu nie je potrebné v `ContentView.swift` dodatočne importovať `Animal.swift`.

Swift automaticky rozpozná súbory Swift v tom istom projekte.

## Použitie extension na ďalšie usporiadanie kódu

Teraz sme už presunuli údaje o zvieratách z `ContentView` do `Animal`.

V štruktúre `Animal` však stále zároveň existujú dva druhy kódu:

Prvým druhom sú vlastnosti samotného modelu zvieraťa:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Druhým druhom sú pevné údaje o zvieratách:

```swift
static let animals: [Animal] = [
    // ...
]
```

Aby bola štruktúra kódu jasnejšia, môžeme použiť `extension` a tieto dve časti oddeliť.

`extension` znamená rozšírenie.

Umožňuje na základe existujúceho typu ďalej pridávať nový kód.

Napríklad:

```swift
extension Animal {
    
}
```

To znamená, že rozširujeme typ `Animal`.

## Vloženie údajov o zvieratách do extension

`Animal` môžeme zmeniť takto:

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

Po takomto usporiadaní bude štruktúra kódu jasnejšia.

`struct Animal` zodpovedá za opis toho, aké vlastnosti by malo mať jedno zviera.

`extension Animal` zodpovedá za uloženie skupiny pevných údajov o zvieratách.

Všimnite si, že hoci bolo `animals` presunuté do `extension Animal`, spôsob použitia sa nemení.

Stále ho môžeme používať takto:

```swift
let animals = Animal.animals
```

Aj to je jedna vlastnosť `extension`: iba nám pomáha usporiadať kód a nemení spôsob volania zvonka.

## Keď je údajov veľa, môžeme znova vytvoriť súbor AnimalData

Teraz sme už vložili `Animal` do samostatného súboru `Animal.swift`.

Ak je údajov o zvieratách málo, môžeme `extension Animal` priamo zapísať aj do `Animal.swift`.

Ak však bude údajov o zvieratách čoraz viac, môžeme znova vytvoriť súbor, napríklad:

```swift
AnimalData.swift
```

Potom doň vložíme pevné údaje o zvieratách:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Údaje o zvieratách
    ]
}
```

Po takomto postupe bude rozdelenie zodpovedností v kóde jasnejšie:

`Animal.swift` zodpovedá iba za definovanie modelu zvieraťa.

`AnimalData.swift` zodpovedá iba za uloženie údajov o zvieratách.

`ContentView.swift` zodpovedá iba za zobrazovanie rozhrania.

Zodpovednosť každého súboru bude jasnejšia.

Všimnite si, že `AnimalData.swift` je iba názov súboru, nie nový typ Swift. V tomto súbore stále používame `extension Animal` na pridanie pevných údajov do `Animal`.

## Úplný kód

Nižšie je usporiadaný kód súboru `Animal.swift`:

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

Usporiadaný kód súboru `AnimalData.swift`:

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

V súbore `ContentView.swift` ho môžeme použiť takto:

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
                            .clipShape(Circle())
                        
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

Tip: V súboroch `Animal.swift` a `AnimalData.swift` je na prvom riadku napísané:

```swift
import Foundation
```

Keď sme predtým písali rozhranie SwiftUI, často sme používali:

```swift
import SwiftUI
```

Je to preto, že `ContentView`, `Text`, `Button`, `Color` a tieto prvky súvisia s rozhraním, takže pri písaní súborov rozhrania je zvyčajne potrebné importovať SwiftUI.

Tu však `Animal.swift` a `AnimalData.swift` nie sú súbory rozhrania. Používajú sa hlavne na definovanie modelu zvieraťa a uloženie údajov o zvieratách.

V tomto kóde `UUID()` potrebuje použiť `Foundation`, takže stačí importovať `Foundation`.

## Zhrnutie

V tejto lekcii sme urobili hlavne jednu vec: presunuli sme údaje o zvieratách mimo `ContentView`.

Pôvodný zápis ukladal údaje o zvieratách priamo do `ContentView`. Takýto kód môže fungovať, ale keď pribudne viac údajov, súbor zobrazenia bude čoraz dlhší.

Po usporiadaní `ContentView` zodpovedá iba za zobrazovanie rozhrania a `Animal.animals` zodpovedá za poskytovanie údajov o zvieratách.

V tejto lekcii sme sa naučili aj dve nové veci.

Prvou je `static`.

`static` označuje statickú vlastnosť. Statická vlastnosť patrí samotnému typu a dá sa k nej pristúpiť priamo spôsobom „názov typu.názov vlastnosti“.

Napríklad:

```swift
Animal.animals
```

Druhou je `extension`.

`extension` znamená rozšírenie. Umožňuje rozdeliť kód toho istého typu na viac častí, aby bola štruktúra kódu jasnejšia.

V tomto príklade používame `extension Animal` na uloženie údajov o zvieratách, aby samotná štruktúra `Animal` zostala stručnejšia.

Okrem toho `Animal` hlavne ukladá dátový model a priamo nepíše rozhranie SwiftUI, preto sa tu používa `import Foundation`.

Ťažiskom tejto lekcie nie je robiť kód zložitejším, ale urobiť ho čitateľnejším a ľahšie udržiavateľným.
