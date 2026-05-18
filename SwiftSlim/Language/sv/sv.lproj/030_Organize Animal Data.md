# Organisera djurdata

I förra lektionen slutförde vi ett enkelt exempel på ett djurlexikon.

![view](../../../Resource/029_view.png)

När användaren trycker på ett djur visar sidan djurets detaljer via en `Sheet`.

Men koden från förra lektionen har ett problem: djurdata skrivs direkt inuti `ContentView`.

Till exempel:

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
            // Visa djurlistan
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Den här koden kan köras normalt, men när mängden djurdata blir större kommer `ContentView` att bli mycket lång.

`ContentView` bör egentligen främst ansvara för att visa gränssnittet, men nu lagrar den också en stor mängd djurdata. Det påverkar kodens läsbarhet och gör senare underhåll mindre bekvämt.

Därför ska vi göra en sak i den här lektionen:

Flytta ut djurdata från `ContentView`.

## Varför separera data?

I SwiftUI ansvarar vykod vanligtvis för att visa gränssnittet.

Till exempel:

```swift
Text("Dolphin")
Image("dolphin")
```

Dessa kodrader är alla relaterade till visning av gränssnittet.

Själva djurdata, till exempel djurets namn, bildnamn, utbredningsområde, livsmiljö och beskrivningstext, är inte gränssnittets struktur.

De är mer som en uppsättning fast information:

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

Om gränssnittskod och datakod skrivs tillsammans blir koden mer och mer rörig.

Därför kan vi lägga djurdata i typen `Animal`.

## Använd static för att lagra fast data

Låt oss först titta på den organiserade skrivningen:

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

Här har en ny kodrad lagts till:

```swift
static let animals: [Animal] = [
    
]
```

`static` betyder statisk egenskap.

En statisk egenskap tillhör själva typen. Den tillhör inte en viss konkret instans.

Den här meningen är ganska abstrakt, så vi kan förstå den med ett enkelt exempel.

## Vanliga egenskaper och statiska egenskaper

Till exempel definierar vi en `Student`:

```swift
struct Student {
    let name: String
}
```

Här är `name` en vanlig egenskap. En vanlig egenskap tillhör en viss konkret instans.

Om vi vill komma åt `name` måste vi först skapa en konkret student:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Här är `student` en instans. För tillfället kan du förstå den som en konkret uppsättning studentdata.

Eftersom varje student kan ha ett annat namn måste `name` ligga på den konkreta studenten.

Men viss data tillhör inte en viss konkret instans.

Till exempel vill vi förbereda en uppsättning exempeldata för förhandsvisningar:

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

Här har `previewStudents` `static` framför sig, så den är en statisk egenskap.

En statisk egenskap tillhör inte en viss student. I stället tillhör den själva typen `Student`.

Därför behöver vi inte först skapa en student. Vi kan komma åt den direkt via typnamnet:

```swift
print(Student.previewStudents.count)    // 3
```

Åtkomstsättet här är:

```swift
Typnamn.statiskEgenskapsnamn
```

Det vill säga:

```swift
Student.previewStudents
```

På samma sätt kan vi i djurlexikonet komma åt djurdata så här:

```swift
Animal.animals
```

## Tillbaka till ContentView

Nu har djurdata sparats i typen `Animal`.

Därför behöver vi inte längre skriva en mycket lång djurarray inuti `ContentView`.

Vi kan ändra det till:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Visa djurlistan
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Den här kodraden betyder:

```swift
let animals = Animal.animals
```

Hämta gruppen med djurdata `animals` från typen `Animal` och spara den sedan i konstanten `animals` i den aktuella vyn.

När vi skriver så här blir `ContentView` mer koncis.

`ContentView` ansvarar för att visa gränssnittet, och `Animal.animals` ansvarar för att tillhandahålla djurdata.

## Flytta Animal till en separat fil

I förra lektionen skrev vi `Animal` och `ContentView` i samma fil för att göra exemplet lättare att förstå.

Eftersom koden fortfarande var relativt kort då var det inget problem.

Men nu blir mängden djurdata större och större. Om vi fortsätter att lägga all kod i `ContentView.swift` blir filen mycket lång och svårare att läsa.

Därför kan vi lägga `Animal` i en ny Swift-fil för sig.

I Xcode kan du skapa en ny Swift-fil, till exempel:

```swift
Animal.swift
```

Flytta sedan strukturen `Animal` till den här filen:

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

Efter denna organisering:

`ContentView.swift` ansvarar för att visa gränssnittet.

`Animal.swift` ansvarar för att beskriva djurdatans struktur.

Även om de ligger i olika filer kan `ContentView` fortfarande använda `Animal` direkt, så länge de finns i samma projekt.

Till exempel:

```swift
let animals = Animal.animals
```

Här behöver du inte importera `Animal.swift` extra i `ContentView.swift`.

Swift identifierar automatiskt Swift-filer i samma projekt.

## Använd extension för att fortsätta organisera koden

Nu har vi flyttat djurdata från `ContentView` till `Animal`.

Men strukturen `Animal` innehåller fortfarande två typer av kod samtidigt:

Den första typen är egenskaperna för själva djurmodellen:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Den andra typen är fast djurdata:

```swift
static let animals: [Animal] = [
    // ...
]
```

För att göra kodstrukturen tydligare kan vi använda `extension` för att separera dessa två delar.

`extension` betyder utökning.

Den kan fortsätta lägga till ny kod baserat på en befintlig typ.

Till exempel:

```swift
extension Animal {
    
}
```

Det betyder att vi utökar typen `Animal`.

## Lägg djurdata i en extension

Vi kan ändra `Animal` till detta:

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

Efter denna organisering blir kodstrukturen tydligare.

`struct Animal` ansvarar för att beskriva vilka egenskaper ett djur ska ha.

`extension Animal` ansvarar för att lagra en uppsättning fast djurdata.

Observera att även om `animals` har flyttats till `extension Animal` ändras inte sättet vi använder den på.

Vi kan fortfarande använda den så här:

```swift
let animals = Animal.animals
```

Detta är också en egenskap hos `extension`: den hjälper oss bara att organisera koden och ändrar inte den externa anropsmetoden.

## När det finns mer data kan du skapa ytterligare en AnimalData-fil

Nu har vi lagt `Animal` i en separat `Animal.swift`-fil.

Om det inte finns så mycket djurdata kan du skriva `extension Animal` direkt i `Animal.swift`.

Men om djurdata blir mer och mer omfattande kan du också skapa en annan fil, till exempel:

```swift
AnimalData.swift
```

Lägg sedan den fasta djurdata där:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Djurdata
    ]
}
```

Efter att ha gjort detta blir kodens ansvarsfördelning tydligare:

`Animal.swift` ansvarar bara för att definiera djurmodellen.

`AnimalData.swift` ansvarar bara för att lagra djurdata.

`ContentView.swift` ansvarar bara för att visa gränssnittet.

Varje fils ansvar blir tydligare.

Observera att `AnimalData.swift` bara är filnamnet, inte en ny Swift-typ. I den här filen använder vi fortfarande `extension Animal` för att lägga till fast data till `Animal`.

## Komplett kod

Nedan är den organiserade koden för `Animal.swift`:

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

Den organiserade koden för `AnimalData.swift`:

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

I `ContentView.swift` kan du använda det så här:

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

Tips: I både filen `Animal.swift` och filen `AnimalData.swift` står detta på första raden:

```swift
import Foundation
```

Tidigare, när vi skrev SwiftUI-gränssnitt, använde vi ofta:

```swift
import SwiftUI
```

Det beror på att `ContentView`, `Text`, `Button` och `Color` alla är relaterade till gränssnittet, så när vi skriver gränssnittsfiler behöver vi vanligtvis importera SwiftUI.

Men här är `Animal.swift` och `AnimalData.swift` inte gränssnittsfiler. De används främst för att definiera djurmodellen och lagra djurdata.

I den här koden behöver `UUID()` använda `Foundation`, så det räcker att importera `Foundation`.

## Sammanfattning

I den här lektionen gjorde vi främst en sak: flyttade ut djurdata från `ContentView`.

Den ursprungliga skrivningen var att skriva djurdata direkt i `ContentView`. Den koden kan köras, men när mängden data ökar blir vyfilen längre och längre.

Efter organiseringen ansvarar `ContentView` bara för att visa gränssnittet, och `Animal.animals` ansvarar för att tillhandahålla djurdata.

Den här lektionen introducerade också två nya kunskaper.

Den första är `static`.

`static` betyder statisk egenskap. En statisk egenskap tillhör själva typen och kan nås direkt via sättet ”Typnamn.egenskapsnamn”.

Till exempel:

```swift
Animal.animals
```

Den andra är `extension`.

`extension` betyder utökning. Den kan dela upp kod för samma typ i olika delar, vilket gör kodstrukturen tydligare.

I det här exemplet använder vi `extension Animal` för att lagra djurdata, vilket gör själva strukturen `Animal` mer koncis.

Dessutom lagrar `Animal` främst en datamodell och skriver inte ett SwiftUI-gränssnitt direkt, så här använder vi `import Foundation`.

Fokus i den här lektionen är inte att göra koden mer komplicerad, utan att göra koden enklare att läsa och underhålla.
