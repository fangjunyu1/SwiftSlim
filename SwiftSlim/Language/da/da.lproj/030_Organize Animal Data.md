# Organisering af dyredata

I den forrige lektion færdiggjorde vi et enkelt eksempel på et dyreleksikon.

![view](../../../Resource/029_view.png)

Når brugeren trykker på et bestemt dyr, viser siden dyrets detaljer via et `Sheet`.

Men der er et problem i koden fra den forrige lektion: dyredataene er skrevet direkte inde i `ContentView`.

For eksempel:

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
            // Vis dyrelisten
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Denne kode kan køre normalt, men når der kommer flere og flere dyredata, bliver `ContentView` meget lang.

`ContentView` burde egentlig primært være ansvarlig for at vise brugergrænsefladen, men nu gemmer den også en stor mængde dyredata. Det gør koden sværere at læse og gør senere vedligeholdelse mindre praktisk.

Derfor skal vi i denne lektion gøre én ting:

Flytte dyredataene ud af `ContentView`.

## Hvorfor adskille data?

I SwiftUI er visningskode normalt ansvarlig for at vise brugergrænsefladen.

For eksempel:

```swift
Text("Dolphin")
Image("dolphin")
```

Disse koder er alle relateret til visning af brugergrænsefladen.

Men dyredataene selv, for eksempel dyrets navn, billednavn, udbredelsesområde, levested og beskrivende tekst, er ikke en del af grænsefladens struktur.

De ligner mere en gruppe faste oplysninger:

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

Hvis vi skriver al grænsefladekode og datakode sammen, bliver koden mere og mere rodet.

Derfor kan vi lægge dyredataene ind i typen `Animal`.

## Brug static til at gemme faste data

Lad os først se på den organiserede skrivemåde:

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

Her er der tilføjet én ny kodelinje:

```swift
static let animals: [Animal] = [
    
]
```

`static` betyder en statisk egenskab.

En statisk egenskab tilhører selve typen og ikke en bestemt konkret instans.

Denne sætning er lidt abstrakt, så vi kan forstå den gennem et enkelt eksempel.

## Almindelige egenskaber og statiske egenskaber

For eksempel definerer vi en `Student`:

```swift
struct Student {
    let name: String
}
```

Her er `name` en almindelig egenskab, og en almindelig egenskab tilhører en bestemt konkret instans.

Hvis vi vil tilgå `name`, skal vi først oprette en konkret studerende:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Her er `student` en instans. Du kan foreløbigt forstå den som ét konkret sæt elevdata.

Fordi hver elevs navn kan være forskelligt, skal `name` ligge på den konkrete elev.

Men nogle data tilhører ikke én bestemt konkret instans.

For eksempel vil vi forberede en gruppe eksempeldata, der kan bruges til forhåndsvisning:

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

Her har `previewStudents` `static` foran sig, så det er en statisk egenskab.

En statisk egenskab tilhører ikke en bestemt elev, men selve typen `Student`.

Derfor behøver vi ikke først at oprette en bestemt elev. Vi kan tilgå den direkte via typenavnet:

```swift
print(Student.previewStudents.count)    // 3
```

Tilgangsmåden her er:

```swift
Typenavn.statiskEgenskabsnavn
```

Altså:

```swift
Student.previewStudents
```

På samme måde kan vi i dyreleksikonet tilgå dyredataene sådan:

```swift
Animal.animals
```

## Tilbage til ContentView

Nu er dyredataene allerede gemt i typen `Animal`.

Derfor behøver vi ikke længere skrive et langt dyrearray inde i `ContentView`.

Vi kan ændre det til:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Vis dyrelisten
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Denne kodelinje betyder:

```swift
let animals = Animal.animals
```

Hent gruppen af dyredata `animals` fra typen `Animal`, og gem den derefter i konstanten `animals` i den aktuelle visning.

Efter denne ændring bliver `ContentView` mere enkel.

`ContentView` er ansvarlig for at vise brugergrænsefladen, og `Animal.animals` er ansvarlig for at levere dyredataene.

## Flyt Animal til en separat fil

I den forrige lektion skrev vi `Animal` og `ContentView` i den samme fil for at gøre eksemplet lettere at forstå.

Fordi der ikke var særlig meget kode på det tidspunkt, var det ikke et problem.

Men nu bliver der flere og flere dyredata. Hvis vi fortsat skriver al kode i `ContentView.swift`, bliver filen meget lang og sværere at læse.

Derfor kan vi lægge `Animal` i en ny separat Swift-fil.

I Xcode kan du oprette en ny Swift-fil, for eksempel:

```swift
Animal.swift
```

Flyt derefter `Animal`-strukturen til denne fil:

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

Efter denne organisering:

`ContentView.swift` er ansvarlig for at vise brugergrænsefladen.

`Animal.swift` er ansvarlig for at beskrive strukturen af dyredataene.

Selvom de ligger i forskellige filer, kan `ContentView` stadig bruge `Animal` direkte, så længe de begge er i det samme projekt.

For eksempel:

```swift
let animals = Animal.animals
```

Her behøver du ikke importere `Animal.swift` ekstra i `ContentView.swift`.

Swift identificerer automatisk Swift-filer i det samme projekt.

## Brug extension til at organisere koden yderligere

Nu har vi allerede flyttet dyredataene fra `ContentView` ind i `Animal`.

Men `Animal`-strukturen indeholder stadig to typer kode på samme tid:

Den første type er egenskaberne for selve dyremodellen:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Den anden type er de faste dyredata:

```swift
static let animals: [Animal] = [
    // ...
]
```

For at gøre kodestrukturen mere tydelig kan vi bruge `extension` til at adskille disse to dele.

`extension` betyder udvidelse.

Det kan bruges til at fortsætte med at tilføje ny kode oven på en eksisterende type.

For eksempel:

```swift
extension Animal {
    
}
```

Dette betyder, at vi udvider typen `Animal`.

## Læg dyredataene i extension

Vi kan ændre `Animal` til dette:

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

Efter denne organisering bliver kodestrukturen mere tydelig.

`struct Animal` er ansvarlig for at beskrive, hvilke egenskaber et dyr skal have.

`extension Animal` er ansvarlig for at gemme en gruppe faste dyredata.

Bemærk, at selvom `animals` er flyttet ind i `extension Animal`, ændrer brugsmåden sig ikke.

Vi kan stadig bruge det sådan:

```swift
let animals = Animal.animals
```

Det er også et kendetegn ved `extension`: det hjælper kun med at organisere koden og ændrer ikke den eksterne måde at kalde den på.

## Når der er mange data, kan du oprette en ny AnimalData-fil

Nu har vi allerede lagt `Animal` i den separate fil `Animal.swift`.

Hvis der ikke er så mange dyredata, kan `extension Animal` også skrives direkte i `Animal.swift`.

Men hvis der kommer flere og flere dyredata, kan du også oprette en ny fil, for eksempel:

```swift
AnimalData.swift
```

Læg derefter de faste dyredata ind i den:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dyredata
    ]
}
```

Efter dette bliver kodefordelingen mere tydelig:

`Animal.swift` er kun ansvarlig for at definere dyremodellen.

`AnimalData.swift` er kun ansvarlig for at gemme dyredataene.

`ContentView.swift` er kun ansvarlig for at vise brugergrænsefladen.

Hver fils ansvar bliver tydeligere.

Bemærk, at `AnimalData.swift` kun er et filnavn, ikke en ny Swift-type. I denne fil tilføjer vi stadig faste data til `Animal` gennem `extension Animal`.

## Komplet kode

Nedenfor er den organiserede kode for `Animal.swift`:

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

Den organiserede kode for `AnimalData.swift`:

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

I `ContentView.swift` kan du bruge det sådan:

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

Tip: I filerne `Animal.swift` og `AnimalData.swift` står der på første linje:

```swift
import Foundation
```

Tidligere brugte vi ofte dette, når vi skrev SwiftUI-brugergrænseflader:

```swift
import SwiftUI
```

Det skyldes, at `ContentView`, `Text`, `Button` og `Color` alle er relateret til brugergrænsefladen, så når vi skriver grænsefladefiler, skal vi normalt importere SwiftUI.

Men `Animal.swift` og `AnimalData.swift` her er ikke grænsefladefiler. De bruges primært til at definere dyremodellen og gemme dyredata.

I denne kode kræver `UUID()` brug af `Foundation`, så det er nok at importere `Foundation`.

## Opsummering

I denne lektion gjorde vi primært én ting: Vi flyttede dyredataene ud af `ContentView`.

Den oprindelige skrivemåde var at skrive dyredataene direkte i `ContentView`. Den kode kan køre, men når der kommer flere data, bliver visningsfilen længere og længere.

Efter organiseringen er `ContentView` kun ansvarlig for at vise brugergrænsefladen, og `Animal.animals` er ansvarlig for at levere dyredataene.

I denne lektion lærte vi også to nye begreber.

Det første er `static`.

`static` betyder statisk egenskab. En statisk egenskab tilhører selve typen og kan tilgås direkte med formen “typenavn.egenskabsnavn”.

For eksempel:

```swift
Animal.animals
```

Det andet er `extension`.

`extension` betyder udvidelse. Det kan dele koden for den samme type op, så kodestrukturen bliver mere tydelig.

I dette eksempel bruger vi `extension Animal` til at gemme dyredataene, så selve `Animal`-strukturen bliver mere enkel.

Derudover gemmer `Animal` primært en datamodel og indeholder ikke direkte SwiftUI-grænsefladekode, så vi bruger `import Foundation` her.

Fokus i denne lektion er ikke at gøre koden mere kompleks, men at gøre koden lettere at læse og vedligeholde.
