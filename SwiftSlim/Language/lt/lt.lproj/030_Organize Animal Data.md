# Gyvūnų duomenų tvarkymas

Ankstesnėje pamokoje užbaigėme paprastą gyvūnų enciklopedijos pavyzdį.

![view](../../../Resource/029_view.png)

Kai naudotojas paliečia kurį nors gyvūną, puslapis per `Sheet` parodo gyvūno informaciją.

Tačiau ankstesnės pamokos kode yra viena problema: gyvūnų duomenys yra parašyti tiesiogiai `ContentView` viduje.

Pavyzdžiui:

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
            // Rodyti gyvūnų sąrašą
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Šis kodas gali veikti normaliai, bet kai gyvūnų duomenų kiekis didėja, `ContentView` taps labai ilgas.

`ContentView` iš esmės turėtų būti atsakingas už sąsajos rodymą, bet dabar jis taip pat saugo daug gyvūnų duomenų. Tai apsunkina kodo skaitymą ir vėlesnę priežiūrą.

Todėl šioje pamokoje atliksime vieną dalyką:

Iškelsime gyvūnų duomenis iš `ContentView`.

## Kodėl reikia atskirti duomenis?

SwiftUI aplinkoje rodinio kodas paprastai atsakingas už sąsajos rodymą.

Pavyzdžiui:

```swift
Text("Dolphin")
Image("dolphin")
```

Šios kodo dalys yra susijusios su sąsajos rodymu.

Patys gyvūnų duomenys, pavyzdžiui, gyvūno pavadinimas, paveikslėlio pavadinimas, paplitimo sritis, buveinė ir aprašymo tekstas, nėra sąsajos struktūra.

Jie labiau panašūs į fiksuotos informacijos rinkinį:

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

Jei sąsajos kodas ir duomenų kodas bus parašyti kartu, kodas taps vis labiau netvarkingas.

Todėl galime įdėti gyvūnų duomenis į `Animal` tipą.

## Naudokite static fiksuotiems duomenims saugoti

Pirmiausia pažiūrėkime į sutvarkytą rašymo būdą:

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

Čia pridėta nauja kodo eilutė:

```swift
static let animals: [Animal] = [
    
]
```

`static` reiškia statinę savybę.

Statinė savybė priklauso pačiam tipui. Ji nepriklauso kuriam nors konkrečiam egzemplioriui.

Šis sakinys yra gana abstraktus, todėl galime jį suprasti per paprastą pavyzdį.

## Įprastos savybės ir statinės savybės

Pavyzdžiui, apibrėžiame `Student`:

```swift
struct Student {
    let name: String
}
```

Čia `name` yra įprasta savybė. Įprasta savybė priklauso konkrečiam egzemplioriui.

Jei norime pasiekti `name`, pirmiausia turime sukurti konkretų studentą:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Čia `student` yra egzempliorius. Kol kas galite jį suprasti kaip vieną konkrečią studento duomenų dalį.

Kadangi kiekvienas studentas gali turėti skirtingą vardą, `name` turi būti konkretaus studento dalis.

Tačiau kai kurie duomenys nepriklauso konkrečiam egzemplioriui.

Pavyzdžiui, norime paruošti pavyzdinių duomenų rinkinį peržiūroms:

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

Čia prieš `previewStudents` yra `static`, todėl tai yra statinė savybė.

Statinė savybė nepriklauso vienam studentui. Ji priklauso pačiam `Student` tipui.

Todėl mums nereikia pirmiausia sukurti studento. Galime ją pasiekti tiesiogiai per tipo pavadinimą:

```swift
print(Student.previewStudents.count)    // 3
```

Čia naudojamas toks prieigos būdas:

```swift
TipoPavadinimas.statinesSavybesPavadinimas
```

Tai yra:

```swift
Student.previewStudents
```

Panašiai gyvūnų enciklopedijoje gyvūnų duomenis galime pasiekti taip:

```swift
Animal.animals
```

## Grįžkime prie ContentView

Dabar gyvūnų duomenys jau išsaugoti `Animal` tipe.

Todėl `ContentView` viduje nebereikia rašyti labai ilgo gyvūnų masyvo.

Galime pakeisti taip:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Rodyti gyvūnų sąrašą
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ši kodo eilutė reiškia:

```swift
let animals = Animal.animals
```

Iš `Animal` tipo paimami `animals` gyvūnų duomenys ir išsaugomi dabartinio rodinio `animals` konstantoje.

Taip parašius, `ContentView` tampa glaustesnis.

`ContentView` atsakingas už sąsajos rodymą, o `Animal.animals` atsakingas už gyvūnų duomenų pateikimą.

## Perkelkite Animal į atskirą failą

Ankstesnėje pamokoje, kad pavyzdį būtų lengviau suprasti, `Animal` ir `ContentView` parašėme tame pačiame faile.

Kadangi tuo metu kodo dar buvo palyginti nedaug, toks rašymo būdas buvo tinkamas.

Tačiau dabar gyvūnų duomenų vis daugėja. Jei ir toliau visą kodą dėsime į `ContentView.swift`, failas taps labai ilgas ir sunkiau skaitomas.

Todėl galime `Animal` įdėti į naują atskirą Swift failą.

Xcode galite sukurti naują Swift failą, pavyzdžiui:

```swift
Animal.swift
```

Tada perkelkite `Animal` struktūrą į šį failą:

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

Taip sutvarkius:

`ContentView.swift` atsakingas už sąsajos rodymą.

`Animal.swift` atsakingas už gyvūnų duomenų struktūros aprašymą.

Nors jie įdėti į skirtingus failus, jei jie yra tame pačiame projekte, `ContentView` vis tiek gali tiesiogiai naudoti `Animal`.

Pavyzdžiui:

```swift
let animals = Animal.animals
```

Čia nereikia papildomai importuoti `Animal.swift` į `ContentView.swift`.

Swift automatiškai atpažįsta tame pačiame projekte esančius Swift failus.

## Naudokite extension toliau tvarkyti kodą

Dabar gyvūnų duomenis jau perkėlėme iš `ContentView` į `Animal`.

Tačiau `Animal` struktūroje vis dar kartu yra dviejų rūšių kodas:

Pirmoji rūšis yra paties gyvūno modelio savybės:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Antroji rūšis yra fiksuoti gyvūnų duomenys:

```swift
static let animals: [Animal] = [
    // ...
]
```

Kad kodo struktūra būtų aiškesnė, galime naudoti `extension` ir šias dvi dalis atskirti.

`extension` reiškia išplėtimą.

Jis gali prie esamo tipo pagrindo toliau pridėti naujo kodo.

Pavyzdžiui:

```swift
extension Animal {
    
}
```

Tai reiškia, kad išplečiame `Animal` tipą.

## Įdėkite gyvūnų duomenis į extension

`Animal` galime pakeisti taip:

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

Taip sutvarkius, kodo struktūra tampa aiškesnė.

`struct Animal` atsakingas už aprašymą, kokias savybes turėtų turėti gyvūnas.

`extension Animal` atsakingas už fiksuoto gyvūnų duomenų rinkinio saugojimą.

Atkreipkite dėmesį: nors `animals` buvo perkeltas į `extension Animal`, naudojimo būdas nesikeičia.

Vis tiek galime naudoti taip:

```swift
let animals = Animal.animals
```

Tai taip pat yra viena `extension` ypatybė: jis tik padeda tvarkyti kodą ir nekeičia išorinio iškvietimo būdo.

## Kai duomenų daugiau, galite sukurti dar vieną AnimalData failą

Dabar `Animal` jau įdėjome į atskirą `Animal.swift` failą.

Jei gyvūnų duomenų nėra daug, `extension Animal` galite rašyti tiesiogiai `Animal.swift` faile.

Tačiau jei gyvūnų duomenų vis daugėja, taip pat galite sukurti dar vieną failą, pavyzdžiui:

```swift
AnimalData.swift
```

Tada į jį įdėkite fiksuotus gyvūnų duomenis:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Gyvūnų duomenys
    ]
}
```

Tai atlikus, kodo atsakomybės tampa aiškesnės:

`Animal.swift` atsakingas tik už gyvūno modelio apibrėžimą.

`AnimalData.swift` atsakingas tik už gyvūnų duomenų saugojimą.

`ContentView.swift` atsakingas tik už sąsajos rodymą.

Kiekvieno failo atsakomybė tampa aiškesnė.

Atkreipkite dėmesį, kad `AnimalData.swift` yra tik failo pavadinimas. Tai nėra naujas Swift tipas. Šiame faile vis tiek naudojame `extension Animal`, kad pridėtume fiksuotus duomenis prie `Animal`.

## Visas kodas

Žemiau pateiktas sutvarkytas `Animal.swift` kodas:

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

Sutvarkytas `AnimalData.swift` kodas:

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

`ContentView.swift` faile galite naudoti taip:

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

Patarimas: tiek `Animal.swift`, tiek `AnimalData.swift` failuose pirmoji eilutė yra:

```swift
import Foundation
```

Anksčiau, kai rašydavome SwiftUI sąsajas, dažnai naudodavome:

```swift
import SwiftUI
```

Taip yra todėl, kad `ContentView`, `Text`, `Button` ir `Color` yra susiję su sąsaja, todėl rašant sąsajos failus paprastai reikia importuoti SwiftUI.

Tačiau čia `Animal.swift` ir `AnimalData.swift` nėra sąsajos failai. Jie daugiausia naudojami gyvūno modeliui apibrėžti ir gyvūnų duomenims saugoti.

Šiame kode `UUID()` reikia `Foundation`, todėl pakanka importuoti `Foundation`.

## Santrauka

Šioje pamokoje daugiausia atlikome vieną dalyką: iškėlėme gyvūnų duomenis iš `ContentView`.

Pradinis būdas buvo rašyti gyvūnų duomenis tiesiogiai `ContentView` viduje. Šis kodas gali veikti, bet kai duomenų kiekis didėja, rodinio failas taps vis ilgesnis.

Sutvarkius, `ContentView` atsakingas tik už sąsajos rodymą, o `Animal.animals` atsakingas už gyvūnų duomenų pateikimą.

Šioje pamokoje taip pat susipažinome su dviem naujomis žiniomis.

Pirmoji yra `static`.

`static` reiškia statinę savybę. Statinė savybė priklauso pačiam tipui ir gali būti tiesiogiai pasiekiama per „TipoPavadinimas.savybesPavadinimas“.

Pavyzdžiui:

```swift
Animal.animals
```

Antroji yra `extension`.

`extension` reiškia išplėtimą. Jis gali suskaidyti to paties tipo kodą į skirtingas dalis, todėl kodo struktūra tampa aiškesnė.

Šiame pavyzdyje naudojame `extension Animal` gyvūnų duomenims saugoti, todėl pati `Animal` struktūra tampa glaustesnė.

Be to, `Animal` daugiausia saugo duomenų modelį ir tiesiogiai nerašo SwiftUI sąsajos, todėl čia naudojame `import Foundation`.

Šios pamokos esmė nėra padaryti kodą sudėtingesnį, o padaryti jį lengviau skaitomą ir prižiūrimą.
