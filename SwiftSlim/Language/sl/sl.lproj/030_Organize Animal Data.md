# Urejanje podatkov o živalih

V prejšnji lekciji smo dokončali preprost primer živalske enciklopedije.

![view](../../../Resource/029_view.png)

Ko uporabnik klikne določeno žival, stran prek `Sheet` prikaže podrobnosti o živali.

Vendar ima koda iz prejšnje lekcije eno težavo: podatki o živalih so zapisani neposredno v `ContentView`.

Na primer:

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
            // Prikaži seznam živali
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ta koda se lahko normalno izvaja, vendar bo `ContentView`, ko bo podatkov o živalih vedno več, postal zelo dolg.

`ContentView` bi moral biti v osnovi odgovoren predvsem za prikaz vmesnika, zdaj pa hrani tudi veliko podatkov o živalih. To vpliva na berljivost kode in ni priročno za poznejše vzdrževanje.

Zato bomo v tej lekciji naredili eno stvar:

Podatke o živalih bomo uredili izven `ContentView`.

## Zakaj ločiti podatke?

V SwiftUI je koda pogleda običajno odgovorna za prikaz vmesnika.

Na primer:

```swift
Text("Dolphin")
Image("dolphin")
```

Ta koda je povezana s prikazom vmesnika.

Sami podatki o živalih, na primer ime živali, ime slike, območje razširjenosti, življenjski prostor in opisno besedilo, pa niso struktura vmesnika.

Bolj so podobni skupini stalnih podatkov:

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

Če kodo vmesnika in kodo podatkov zapišemo skupaj, bo koda postajala vedno bolj nepregledna.

Zato lahko podatke o živalih postavimo v tip `Animal`.

## Uporaba static za shranjevanje stalnih podatkov

Najprej si oglejmo urejen zapis:

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

Tukaj je dodana nova vrstica kode:

```swift
static let animals: [Animal] = [
    
]
```

`static` pomeni statična lastnost.

Statična lastnost pripada samemu tipu in ne določenemu konkretnemu primerku.

Ta stavek je precej abstrakten, zato ga lahko razumemo s preprostim primerom.

## Navadne lastnosti in statične lastnosti

Na primer, definiramo `Student`:

```swift
struct Student {
    let name: String
}
```

Tukaj je `name` navadna lastnost, navadna lastnost pa pripada določenemu konkretnemu primerku.

Če želimo dostopati do `name`, moramo najprej ustvariti konkretnega študenta:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Tukaj je `student` primerek, ki ga lahko za začetek razumemo tudi kot konkreten podatek o študentu.

Ker ima lahko vsak študent drugačno ime, mora biti `name` shranjen na konkretnem študentu.

Vendar nekateri podatki ne pripadajo določenemu konkretnemu primerku.

Na primer, želimo pripraviti skupino vzorčnih podatkov za predogled:

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

Tukaj ima `previewStudents` pred seboj `static`, zato je statična lastnost.

Statična lastnost ne pripada določenemu študentu, ampak pripada samemu tipu `Student`.

Zato nam ni treba najprej ustvariti nekega študenta; do nje lahko dostopamo neposredno prek imena tipa:

```swift
print(Student.previewStudents.count)    // 3
```

Način dostopa je tukaj:

```swift
ImeTipa.imeStatičneLastnosti
```

Torej:

```swift
Student.previewStudents
```

Podobno lahko v živalski enciklopediji do podatkov o živalih dostopamo tako:

```swift
Animal.animals
```

## Vrnitev k ContentView

Zdaj so podatki o živalih že shranjeni v tipu `Animal`.

Zato v `ContentView` ni več treba pisati zelo dolgega polja živali.

Lahko ga spremenimo v:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Prikaži seznam živali
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ta vrstica kode pomeni:

```swift
let animals = Animal.animals
```

Iz tipa `Animal` vzamemo skupino podatkov o živalih `animals` in jo nato shranimo v konstanto `animals` trenutnega pogleda.

Po takem zapisu je `ContentView` bolj jedrnat.

`ContentView` je odgovoren za prikaz vmesnika, `Animal.animals` pa za zagotavljanje podatkov o živalih.

## Premik Animal v ločeno datoteko

V prejšnji lekciji smo zaradi lažjega razumevanja primera zapisali `Animal` in `ContentView` v isto datoteko.

Ker takrat kode ni bilo veliko, s takim zapisom ni bilo težav.

Toda zdaj je podatkov o živalih vedno več. Če še naprej pišemo vso kodo v `ContentView.swift`, bo datoteka postala zelo dolga in jo bo težje brati.

Zato lahko `Animal` ločeno postavimo v novo datoteko Swift.

V Xcode lahko ustvarimo novo datoteko Swift, na primer:

```swift
Animal.swift
```

Nato strukturo `Animal` premaknemo v to datoteko:

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

Po takem urejanju:

`ContentView.swift` je odgovoren za prikaz vmesnika.

`Animal.swift` je odgovoren za opis strukture podatkov o živalih.

Čeprav sta v različnih datotekah, lahko `ContentView`, dokler sta obe v istem projektu, še vedno neposredno uporablja `Animal`.

Na primer:

```swift
let animals = Animal.animals
```

Tukaj v `ContentView.swift` ni treba dodatno uvoziti `Animal.swift`.

Swift bo samodejno prepoznal datoteke Swift v istem projektu.

## Uporaba extension za nadaljnje urejanje kode

Zdaj smo podatke o živalih že premaknili iz `ContentView` v `Animal`.

Vendar struktura `Animal` še vedno hkrati vsebuje dve vrsti kode:

Prva vrsta so lastnosti samega živalskega modela:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Druga vrsta so stalni podatki o živalih:

```swift
static let animals: [Animal] = [
    // ...
]
```

Da bo struktura kode jasnejša, lahko uporabimo `extension` in ti dve deli ločimo.

`extension` pomeni razširitev.

Omogoča, da na podlagi obstoječega tipa nadaljujemo z dodajanjem nove kode.

Na primer:

```swift
extension Animal {
    
}
```

To pomeni, da razširjamo tip `Animal`.

## Postavitev podatkov o živalih v extension

`Animal` lahko spremenimo tako:

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

Po takem urejanju je struktura kode jasnejša.

`struct Animal` je odgovoren za opis, katere lastnosti naj ima ena žival.

`extension Animal` je odgovoren za shranjevanje skupine stalnih podatkov o živalih.

Upoštevajte: čeprav smo `animals` premaknili v `extension Animal`, se način uporabe ne spremeni.

Še vedno ga lahko uporabljamo tako:

```swift
let animals = Animal.animals
```

To je tudi ena od značilnosti `extension`: pomaga nam samo urejati kodo in ne spremeni zunanjega načina klica.

## Ko je podatkov več, lahko ustvarimo še datoteko AnimalData

Zdaj smo `Animal` že postavili v ločeno datoteko `Animal.swift`.

Če je podatkov o živalih malo, lahko `extension Animal` neposredno zapišemo tudi v `Animal.swift`.

Če pa je podatkov o živalih vedno več, lahko ustvarimo še eno datoteko, na primer:

```swift
AnimalData.swift
```

Nato vanjo postavimo stalne podatke o živalih:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Podatki o živalih
    ]
}
```

Po takem postopku bo delitev nalog v kodi jasnejša:

`Animal.swift` je odgovoren samo za definicijo živalskega modela.

`AnimalData.swift` je odgovoren samo za shranjevanje podatkov o živalih.

`ContentView.swift` je odgovoren samo za prikaz vmesnika.

Odgovornost vsake datoteke je jasnejša.

Upoštevajte: `AnimalData.swift` je samo ime datoteke, ni nov tip Swift. V tej datoteki še vedno prek `extension Animal` dodajamo stalne podatke tipu `Animal`.

## Celotna koda

Spodaj je urejena koda `Animal.swift`:

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

Urejena koda `AnimalData.swift`:

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

V `ContentView.swift` ga lahko uporabimo tako:

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

Namig: V datotekah `Animal.swift` in `AnimalData.swift` je v prvi vrstici zapisano:

```swift
import Foundation
```

Ko smo prej pisali vmesnik SwiftUI, smo pogosto uporabljali:

```swift
import SwiftUI
```

To je zato, ker so `ContentView`, `Text`, `Button`, `Color` in ti elementi povezani z vmesnikom, zato je pri pisanju datotek vmesnika običajno treba uvoziti SwiftUI.

Vendar tukaj `Animal.swift` in `AnimalData.swift` nista datoteki vmesnika. Uporabljata se predvsem za definiranje živalskega modela in shranjevanje podatkov o živalih.

V tem delu kode mora `UUID()` uporabiti `Foundation`, zato je dovolj, da uvozimo `Foundation`.

## Povzetek

V tej lekciji smo predvsem naredili eno stvar: podatke o živalih smo uredili izven `ContentView`.

Prvotni zapis je podatke o živalih pisal neposredno v `ContentView`. Taka koda se lahko izvaja, vendar bo datoteka pogleda, ko bo podatkov več, postajala vedno daljša.

Po urejanju je `ContentView` odgovoren samo za prikaz vmesnika, `Animal.animals` pa za zagotavljanje podatkov o živalih.

V tej lekciji smo se naučili tudi dveh novih stvari.

Prva je `static`.

`static` pomeni statična lastnost. Statična lastnost pripada samemu tipu in do nje lahko dostopamo neposredno z načinom »ime tipa.ime lastnosti«.

Na primer:

```swift
Animal.animals
```

Druga je `extension`.

`extension` pomeni razširitev. Omogoča, da kodo istega tipa razdelimo in jo zapišemo na več mestih, zato je struktura kode jasnejša.

V tem primeru uporabljamo `extension Animal` za shranjevanje podatkov o živalih, zato je sama struktura `Animal` bolj jedrnata.

Poleg tega `Animal` predvsem shranjuje podatkovni model in neposredno ne piše vmesnika SwiftUI, zato tukaj uporabljamo `import Foundation`.

Poudarek te lekcije ni v tem, da koda postane bolj zapletena, temveč v tem, da postane lažja za branje in vzdrževanje.
