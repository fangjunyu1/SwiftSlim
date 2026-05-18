# Organiziranje podataka o životinjama

U prethodnoj lekciji dovršili smo jednostavan primjer enciklopedije životinja.

![view](../../../Resource/029_view.png)

Kada korisnik dodirne neku životinju, stranica će kroz `Sheet` prikazati detalje o životinji.

Međutim, u kodu iz prethodne lekcije postoji jedan problem: podaci o životinjama napisani su izravno unutar `ContentView`.

Na primjer:

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
            // Prikaži popis životinja
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ovaj kod može normalno raditi, ali kada količina podataka o životinjama postane veća, `ContentView` će postati vrlo dug.

`ContentView` bi uglavnom trebao biti odgovoran za prikaz sučelja, ali sada ujedno pohranjuje i veliku količinu podataka o životinjama. To utječe na čitljivost koda i otežava kasnije održavanje.

Zato ćemo u ovoj lekciji napraviti jednu stvar:

Premjestiti podatke o životinjama izvan `ContentView`.

## Zašto odvojiti podatke?

U SwiftUI-ju kod prikaza obično je odgovoran za prikaz sučelja.

Na primjer:

```swift
Text("Dolphin")
Image("dolphin")
```

Ovi dijelovi koda povezani su s prikazom sučelja.

Sami podaci o životinjama, kao što su naziv životinje, naziv slike, područje rasprostranjenosti, stanište i opisni tekst, nisu struktura sučelja.

Oni su više kao skup fiksnih podataka:

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

Ako se kod sučelja i kod podataka napišu zajedno, kod će postajati sve neuredniji.

Zato podatke o životinjama možemo staviti u tip `Animal`.

## Korištenje static za spremanje fiksnih podataka

Najprije pogledajmo organizirani način pisanja:

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

Ovdje je dodan novi redak koda:

```swift
static let animals: [Animal] = [
    
]
```

`static` označava statičko svojstvo.

Statičko svojstvo pripada samom tipu, a ne nekoj konkretnoj instanci.

Ova je rečenica prilično apstraktna, pa je možemo razumjeti kroz jednostavan primjer.

## Obična svojstva i statička svojstva

Na primjer, definiramo `Student`:

```swift
struct Student {
    let name: String
}
```

Ovdje je `name` obično svojstvo. Obično svojstvo pripada nekoj konkretnoj instanci.

Ako želimo pristupiti svojstvu `name`, najprije moramo stvoriti konkretnog učenika:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Ovdje je `student` jedna instanca. Za početak ga možete razumjeti kao jedan konkretan zapis podataka o učeniku.

Budući da svaki učenik može imati različito ime, `name` mora biti smješten na konkretnom učeniku.

Međutim, neki podaci ne pripadaju nekoj konkretnoj instanci.

Na primjer, želimo pripremiti skup oglednih podataka za pretpreglede:

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

Ovdje `previewStudents` ispred sebe ima `static`, pa je to statičko svojstvo.

Statičko svojstvo ne pripada jednom učeniku, nego pripada samom tipu `Student`.

Zato ne moramo najprije stvoriti nekog učenika, nego mu možemo pristupiti izravno preko naziva tipa:

```swift
print(Student.previewStudents.count)    // 3
```

Način pristupa ovdje je:

```swift
NazivTipa.nazivStatičkogSvojstva
```

Odnosno:

```swift
Student.previewStudents
```

Na isti način, u enciklopediji životinja podacima o životinjama možemo pristupiti ovako:

```swift
Animal.animals
```

## Povratak na ContentView

Sada su podaci o životinjama spremljeni u tipu `Animal`.

Zato u `ContentView` više ne moramo pisati vrlo dug niz životinja.

Možemo ga promijeniti u:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Prikaži popis životinja
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ovaj redak koda znači:

```swift
let animals = Animal.animals
```

Uzmi skup podataka o životinjama `animals` iz tipa `Animal`, a zatim ga spremi u konstantu `animals` trenutačnog prikaza.

Nakon ovakvog pisanja, `ContentView` postaje sažetiji.

`ContentView` je odgovoran za prikaz sučelja, a `Animal.animals` je odgovoran za pružanje podataka o životinjama.

## Premještanje Animal u zasebnu datoteku

U prethodnoj lekciji, kako bi primjer bio lakši za razumijevanje, napisali smo `Animal` i `ContentView` u istoj datoteci.

Budući da je tada koda još bilo relativno malo, takav način pisanja nije bio problem.

Ali sada podataka o životinjama ima sve više. Ako nastavimo stavljati sav kod u `ContentView.swift`, datoteka će postati vrlo duga i manje prikladna za čitanje.

Zato `Animal` možemo zasebno staviti u novu Swift datoteku.

U Xcodeu možete stvoriti novu Swift datoteku, na primjer:

```swift
Animal.swift
```

Zatim premjestite strukturu `Animal` u ovu datoteku:

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

Nakon ovakvog organiziranja:

`ContentView.swift` je odgovoran za prikaz sučelja.

`Animal.swift` je odgovoran za opis strukture podataka o životinji.

Iako su smješteni u različite datoteke, sve dok su u istom projektu, `ContentView` i dalje može izravno koristiti `Animal`.

Na primjer:

```swift
let animals = Animal.animals
```

Ovdje u `ContentView.swift` nije potrebno dodatno uvoziti `Animal.swift`.

Swift će automatski prepoznati Swift datoteke u istom projektu.

## Korištenje extension za daljnje organiziranje koda

Sada smo podatke o životinjama premjestili iz `ContentView` u `Animal`.

Međutim, struktura `Animal` i dalje istodobno sadrži dvije vrste koda:

Prva vrsta su svojstva samog modela životinje:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Druga vrsta su fiksni podaci o životinjama:

```swift
static let animals: [Animal] = [
    // ...
]
```

Da bi struktura koda bila jasnija, možemo upotrijebiti `extension` za razdvajanje ova dva dijela.

`extension` znači proširenje.

Ono može dodavati novi kod na temelju postojećeg tipa.

Na primjer:

```swift
extension Animal {
    
}
```

To znači da proširujemo tip `Animal`.

## Stavljanje podataka o životinjama u extension

`Animal` možemo promijeniti ovako:

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

Nakon ovakvog organiziranja, struktura koda postaje jasnija.

`struct Animal` je odgovoran za opisivanje svojstava koja jedna životinja treba imati.

`extension Animal` je odgovoran za spremanje skupa fiksnih podataka o životinjama.

Napomena: iako je `animals` premješten u `extension Animal`, način korištenja se ne mijenja.

I dalje ga možemo koristiti ovako:

```swift
let animals = Animal.animals
```

To je također jedna značajka `extension`: samo nam pomaže organizirati kod i ne mijenja vanjski način pozivanja.

## Kada ima više podataka, možete stvoriti dodatnu datoteku AnimalData

Sada smo `Animal` stavili u zasebnu datoteku `Animal.swift`.

Ako podataka o životinjama nema mnogo, možete napisati `extension Animal` izravno u `Animal.swift`.

Ali ako podataka o životinjama postaje sve više, možete stvoriti još jednu datoteku, na primjer:

```swift
AnimalData.swift
```

Zatim u nju stavite fiksne podatke o životinjama:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Podaci o životinjama
    ]
}
```

Nakon toga podjela odgovornosti u kodu postaje jasnija:

`Animal.swift` je odgovoran samo za definiranje modela životinje.

`AnimalData.swift` je odgovoran samo za spremanje podataka o životinjama.

`ContentView.swift` je odgovoran samo za prikaz sučelja.

Odgovornost svake datoteke postaje jasnija.

Napomena: `AnimalData.swift` samo je naziv datoteke, a ne novi Swift tip. U toj datoteci i dalje se koristi `extension Animal` kako bi se tipu `Animal` dodali fiksni podaci.

## Cjelovit kod

U nastavku je organizirani kod za `Animal.swift`:

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

Organizirani kod za `AnimalData.swift`:

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

U `ContentView.swift` možete ga koristiti ovako:

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

Napomena: u datotekama `Animal.swift` i `AnimalData.swift` prvi redak je:

```swift
import Foundation
```

Ranije smo, kada smo pisali SwiftUI sučelja, često koristili:

```swift
import SwiftUI
```

To je zato što su `ContentView`, `Text`, `Button` i `Color` povezani sa sučeljem, pa je pri pisanju datoteka sučelja obično potrebno uvesti SwiftUI.

Ali ovdje `Animal.swift` i `AnimalData.swift` nisu datoteke sučelja. One se uglavnom koriste za definiranje modela životinje i spremanje podataka o životinjama.

U ovom kodu `UUID()` treba `Foundation`, pa je dovoljno uvesti `Foundation`.

## Sažetak

U ovoj lekciji uglavnom smo napravili jednu stvar: premjestili smo podatke o životinjama izvan `ContentView`.

Izvorni način bio je pisanje podataka o životinjama izravno u `ContentView`. Takav kod može raditi, ali kada količina podataka poraste, datoteka prikaza postajat će sve duža.

Nakon organiziranja, `ContentView` je odgovoran samo za prikaz sučelja, a `Animal.animals` je odgovoran za pružanje podataka o životinjama.

U ovoj lekciji naučili smo i dva nova znanja.

Prvo je `static`.

`static` označava statičko svojstvo. Statičko svojstvo pripada samom tipu i može mu se pristupiti izravno pomoću načina “NazivTipa.nazivSvojstva”.

Na primjer:

```swift
Animal.animals
```

Drugo je `extension`.

`extension` označava proširenje. Ono može kod istog tipa razdvojiti u različite dijelove, čime struktura koda postaje jasnija.

U ovom primjeru koristimo `extension Animal` za spremanje podataka o životinjama, čime sama struktura `Animal` postaje sažetija.

Osim toga, `Animal` uglavnom sprema model podataka i ne piše izravno SwiftUI sučelje, pa ovdje koristimo `import Foundation`.

Naglasak ove lekcije nije na tome da kod postane složeniji, nego da kod bude lakši za čitanje i održavanje.
