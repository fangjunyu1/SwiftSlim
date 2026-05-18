# Dierengegevens organiseren

In de vorige les hebben we een eenvoudig voorbeeld van een dierenencyclopedie voltooid.

![view](../../../Resource/029_view.png)

Wanneer de gebruiker op een dier tikt, toont de pagina via een `Sheet` de details van dat dier.

Maar in de code van de vorige les zit een probleem: de dierengegevens staan direct in `ContentView`.

Bijvoorbeeld:

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
            // Toon de dierenlijst
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Deze code kan normaal worden uitgevoerd, maar wanneer er steeds meer dierengegevens komen, wordt `ContentView` erg lang.

`ContentView` zou eigenlijk vooral verantwoordelijk moeten zijn voor het weergeven van de interface, maar nu bewaart het ook veel dierengegevens. Dit beïnvloedt de leesbaarheid van de code en maakt later onderhoud minder handig.

Daarom doen we in deze les één ding:

We halen de dierengegevens uit `ContentView`.

## Waarom gegevens scheiden?

In SwiftUI is view-code meestal verantwoordelijk voor het weergeven van de interface.

Bijvoorbeeld:

```swift
Text("Dolphin")
Image("dolphin")
```

Deze codefragmenten hebben allemaal te maken met het weergeven van de interface.

De dierengegevens zelf, zoals de naam van het dier, de afbeeldingsnaam, het verspreidingsgebied, de leefomgeving en de beschrijvingstekst, zijn geen interfacestructuur.

Ze lijken meer op een vaste set gegevens:

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

Als interfacecode en gegevenscode allemaal samen worden geschreven, wordt de code steeds rommeliger.

Daarom kunnen we de dierengegevens in het type `Animal` plaatsen.

## static gebruiken om vaste gegevens op te slaan

Laten we eerst naar de georganiseerde schrijfwijze kijken:

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

Hier is een nieuwe regel code toegevoegd:

```swift
static let animals: [Animal] = [
    
]
```

`static` betekent een statische eigenschap.

Een statische eigenschap behoort tot het type zelf. Ze behoort niet tot één specifieke instantie.

Deze zin is relatief abstract, dus we kunnen hem begrijpen met een eenvoudig voorbeeld.

## Gewone eigenschappen en statische eigenschappen

Stel dat we een `Student` definiëren:

```swift
struct Student {
    let name: String
}
```

Hier is `name` een gewone eigenschap. Een gewone eigenschap behoort tot een specifieke instantie.

Als we `name` willen openen, moeten we eerst een specifieke student maken:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Hier is `student` een instantie. Voorlopig kun je het begrijpen als één concreet stuk studentgegevens.

Omdat elke student een andere naam kan hebben, moet `name` aan een specifieke student gekoppeld zijn.

Maar sommige gegevens behoren niet tot één specifieke instantie.

Bijvoorbeeld: we willen een groep voorbeeldgegevens voorbereiden voor previews:

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

Hier staat `static` vóór `previewStudents`, dus het is een statische eigenschap.

Een statische eigenschap behoort niet tot één student, maar tot het type `Student` zelf.

Daarom hoeven we niet eerst een student te maken. We kunnen er direct via de typenaam toegang toe krijgen:

```swift
print(Student.previewStudents.count)    // 3
```

De toegangswijze is hier:

```swift
Typenaam.statischeEigenschapsnaam
```

Dat is:

```swift
Student.previewStudents
```

Op dezelfde manier kunnen we in de dierenencyclopedie zo toegang krijgen tot de dierengegevens:

```swift
Animal.animals
```

## Terug naar ContentView

Nu zijn de dierengegevens opgeslagen in het type `Animal`.

Daarom hoeven we in `ContentView` geen lange dierenarray meer te schrijven.

We kunnen het wijzigen naar:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Toon de dierenlijst
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Deze regel code betekent:

```swift
let animals = Animal.animals
```

Haal de dierengegevens `animals` op uit het type `Animal` en sla ze daarna op in de constante `animals` van de huidige view.

Na deze schrijfwijze wordt `ContentView` beknopter.

`ContentView` is verantwoordelijk voor het weergeven van de interface, en `Animal.animals` is verantwoordelijk voor het leveren van de dierengegevens.

## Animal naar een apart bestand verplaatsen

In de vorige les hebben we, om het voorbeeld makkelijker te begrijpen, `Animal` en `ContentView` in hetzelfde bestand geschreven.

Omdat de code toen nog relatief kort was, was dat geen probleem.

Maar nu zijn er steeds meer dierengegevens. Als we alle code in `ContentView.swift` blijven zetten, wordt het bestand erg lang en minder makkelijk te lezen.

Daarom kunnen we `Animal` apart in een nieuw Swift-bestand plaatsen.

In Xcode kun je een nieuw Swift-bestand maken, bijvoorbeeld:

```swift
Animal.swift
```

Verplaats daarna de struct `Animal` naar dit bestand:

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

Na deze organisatie:

`ContentView.swift` is verantwoordelijk voor het weergeven van de interface.

`Animal.swift` is verantwoordelijk voor het beschrijven van de structuur van de dierengegevens.

Hoewel ze in verschillende bestanden staan, kan `ContentView` `Animal` nog steeds direct gebruiken zolang ze in hetzelfde project staan.

Bijvoorbeeld:

```swift
let animals = Animal.animals
```

Hier hoef je in `ContentView.swift` niet extra `Animal.swift` te importeren.

Swift herkent Swift-bestanden binnen hetzelfde project automatisch.

## extension gebruiken om code verder te organiseren

Nu hebben we de dierengegevens van `ContentView` naar `Animal` verplaatst.

Maar de struct `Animal` bevat nog steeds twee soorten code tegelijk:

De eerste soort zijn de eigenschappen van het dierenmodel zelf:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

De tweede soort zijn de vaste dierengegevens:

```swift
static let animals: [Animal] = [
    // ...
]
```

Om de codestructuur duidelijker te maken, kunnen we `extension` gebruiken om deze twee delen te scheiden.

`extension` betekent uitbreiding.

Het kan nieuwe code toevoegen op basis van een bestaand type.

Bijvoorbeeld:

```swift
extension Animal {
    
}
```

Dit betekent dat we het type `Animal` uitbreiden.

## Dierengegevens in een extension plaatsen

We kunnen `Animal` als volgt wijzigen:

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

Na deze organisatie wordt de codestructuur duidelijker.

`struct Animal` is verantwoordelijk voor het beschrijven welke eigenschappen een dier moet hebben.

`extension Animal` is verantwoordelijk voor het opslaan van een set vaste dierengegevens.

Let op: hoewel `animals` naar `extension Animal` is verplaatst, verandert de manier waarop we het gebruiken niet.

We kunnen het nog steeds zo gebruiken:

```swift
let animals = Animal.animals
```

Dit is ook een kenmerk van `extension`: het helpt alleen om code te organiseren en verandert de externe aanroepwijze niet.

## Bij meer gegevens kun je nog een AnimalData-bestand maken

Nu hebben we `Animal` in een apart bestand `Animal.swift` geplaatst.

Als er niet veel dierengegevens zijn, kun je `extension Animal` direct in `Animal.swift` schrijven.

Maar als er steeds meer dierengegevens komen, kun je ook nog een bestand maken, bijvoorbeeld:

```swift
AnimalData.swift
```

Plaats daarna de vaste dierengegevens daarin:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dierengegevens
    ]
}
```

Na deze aanpak wordt de taakverdeling van de code duidelijker:

`Animal.swift` is alleen verantwoordelijk voor het definiëren van het dierenmodel.

`AnimalData.swift` is alleen verantwoordelijk voor het opslaan van de dierengegevens.

`ContentView.swift` is alleen verantwoordelijk voor het weergeven van de interface.

De verantwoordelijkheid van elk bestand wordt duidelijker.

Let op: `AnimalData.swift` is alleen de bestandsnaam. Het is geen nieuw Swift-type. In dit bestand gebruiken we nog steeds `extension Animal` om vaste gegevens aan `Animal` toe te voegen.

## Volledige code

Hieronder staat de georganiseerde code van `Animal.swift`:

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

De georganiseerde code van `AnimalData.swift`:

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

In `ContentView.swift` kun je het zo gebruiken:

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

Tip: In de bestanden `Animal.swift` en `AnimalData.swift` staat op de eerste regel allebei:

```swift
import Foundation
```

Eerder gebruikten we bij het schrijven van SwiftUI-interfaces vaak:

```swift
import SwiftUI
```

Dat komt doordat `ContentView`, `Text`, `Button` en `Color` allemaal met de interface te maken hebben. Daarom moeten we bij het schrijven van interfacebestanden meestal SwiftUI importeren.

Maar hier zijn `Animal.swift` en `AnimalData.swift` geen interfacebestanden. Ze worden vooral gebruikt om het dierenmodel te definiëren en dierengegevens op te slaan.

In deze code heeft `UUID()` `Foundation` nodig, dus het importeren van `Foundation` is voldoende.

## Samenvatting

In deze les hebben we vooral één ding gedaan: de dierengegevens uit `ContentView` halen.

De oorspronkelijke schrijfwijze was om de dierengegevens direct in `ContentView` te schrijven. Deze code kan worden uitgevoerd, maar wanneer de hoeveelheid gegevens toeneemt, wordt het view-bestand steeds langer.

Na het organiseren is `ContentView` alleen verantwoordelijk voor het weergeven van de interface, en `Animal.animals` is verantwoordelijk voor het leveren van de dierengegevens.

In deze les hebben we ook twee nieuwe kennispunten geleerd.

Het eerste is `static`.

`static` betekent een statische eigenschap. Een statische eigenschap behoort tot het type zelf en kan direct worden geopend via “Typenaam.eigenschapsnaam”.

Bijvoorbeeld:

```swift
Animal.animals
```

Het tweede is `extension`.

`extension` betekent uitbreiding. Hiermee kun je de code van hetzelfde type in verschillende delen opsplitsen, waardoor de codestructuur duidelijker wordt.

In dit voorbeeld gebruiken we `extension Animal` om dierengegevens op te slaan, waardoor de struct `Animal` zelf beknopter wordt.

Daarnaast bewaart `Animal` vooral een gegevensmodel en schrijft het niet direct een SwiftUI-interface. Daarom gebruiken we hier `import Foundation`.

De kern van deze les is niet om de code ingewikkelder te maken, maar om de code makkelijker leesbaar en onderhoudbaar te maken.
