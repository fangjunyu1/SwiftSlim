# Porządkowanie danych zwierząt

W poprzedniej lekcji ukończyliśmy prosty przykład encyklopedii zwierząt.

![view](../../../Resource/029_view.png)

Gdy użytkownik stuknie dane zwierzę, strona wyświetli szczegóły zwierzęcia za pomocą `Sheet`.

Jednak w kodzie z poprzedniej lekcji istnieje pewien problem: dane zwierząt zostały zapisane bezpośrednio w `ContentView`.

Na przykład:

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
            // Wyświetl listę zwierząt
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ten kod działa poprawnie, ale gdy danych zwierząt będzie coraz więcej, `ContentView` stanie się bardzo długi.

`ContentView` powinien zasadniczo odpowiadać za wyświetlanie interfejsu, ale teraz przechowuje też dużą ilość danych zwierząt. Wpływa to na czytelność kodu i utrudnia późniejszą konserwację.

Dlatego w tej lekcji zrobimy jedną rzecz:

Przeniesiemy dane zwierząt poza `ContentView`.

## Dlaczego warto oddzielić dane?

W SwiftUI kod widoku zwykle odpowiada za wyświetlanie interfejsu.

Na przykład:

```swift
Text("Dolphin")
Image("dolphin")
```

Te fragmenty kodu są związane z wyświetlaniem interfejsu.

Same dane zwierząt, takie jak nazwa zwierzęcia, nazwa obrazu, obszar występowania, siedlisko i tekst opisu, nie są strukturą interfejsu.

Bardziej przypominają zestaw stałych informacji:

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

Jeśli kod interfejsu i kod danych zostaną zapisane razem, kod będzie stawał się coraz bardziej chaotyczny.

Dlatego możemy umieścić dane zwierząt w typie `Animal`.

## Używanie static do przechowywania stałych danych

Najpierw spójrzmy na uporządkowaną wersję:

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

Tutaj dodano nową linię kodu:

```swift
static let animals: [Animal] = [
    
]
```

`static` oznacza właściwość statyczną.

Właściwość statyczna należy do samego typu. Nie należy do konkretnej instancji.

To zdanie jest dość abstrakcyjne, więc możemy zrozumieć je przez prosty przykład.

## Zwykłe właściwości i właściwości statyczne

Na przykład definiujemy `Student`:

```swift
struct Student {
    let name: String
}
```

Tutaj `name` jest zwykłą właściwością. Zwykła właściwość należy do konkretnej instancji.

Jeśli chcemy uzyskać dostęp do `name`, musimy najpierw utworzyć konkretnego ucznia:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Tutaj `student` jest instancją. Na razie możesz rozumieć ją jako konkretny zestaw danych ucznia.

Ponieważ każdy uczeń może mieć inne imię, `name` musi znajdować się przy konkretnym uczniu.

Jednak niektóre dane nie należą do konkretnej instancji.

Na przykład chcemy przygotować grupę przykładowych danych do podglądów:

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

Tutaj przed `previewStudents` znajduje się `static`, więc jest to właściwość statyczna.

Właściwość statyczna nie należy do jednego ucznia. Należy do samego typu `Student`.

Dlatego nie musimy najpierw tworzyć ucznia. Możemy uzyskać do niej dostęp bezpośrednio przez nazwę typu:

```swift
print(Student.previewStudents.count)    // 3
```

Sposób dostępu wygląda tutaj tak:

```swift
NazwaTypu.nazwaWłaściwościStatycznej
```

Czyli:

```swift
Student.previewStudents
```

Podobnie w encyklopedii zwierząt możemy uzyskać dostęp do danych zwierząt tak:

```swift
Animal.animals
```

## Wracamy do ContentView

Teraz dane zwierząt zostały zapisane w typie `Animal`.

Dlatego nie musimy już pisać bardzo długiej tablicy zwierząt wewnątrz `ContentView`.

Możemy zmienić kod na:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Wyświetl listę zwierząt
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ta linia kodu oznacza:

```swift
let animals = Animal.animals
```

Pobierz dane zwierząt `animals` z typu `Animal`, a następnie zapisz je w stałej `animals` bieżącego widoku.

Po takim zapisie `ContentView` staje się bardziej zwięzły.

`ContentView` odpowiada za wyświetlanie interfejsu, a `Animal.animals` odpowiada za dostarczanie danych zwierząt.

## Przeniesienie Animal do osobnego pliku

W poprzedniej lekcji, aby przykład był łatwiejszy do zrozumienia, zapisaliśmy `Animal` i `ContentView` w tym samym pliku.

Ponieważ kod był wtedy jeszcze stosunkowo krótki, nie stanowiło to problemu.

Teraz jednak danych zwierząt jest coraz więcej. Jeśli nadal będziemy umieszczać cały kod w `ContentView.swift`, plik stanie się bardzo długi i trudniejszy do czytania.

Dlatego możemy umieścić `Animal` samodzielnie w nowym pliku Swift.

W Xcode możesz utworzyć nowy plik Swift, na przykład:

```swift
Animal.swift
```

Następnie przenieś strukturę `Animal` do tego pliku:

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

Po takim uporządkowaniu:

`ContentView.swift` odpowiada za wyświetlanie interfejsu.

`Animal.swift` odpowiada za opis struktury danych zwierzęcia.

Chociaż znajdują się w różnych plikach, jeśli są w tym samym projekcie, `ContentView` nadal może bezpośrednio używać `Animal`.

Na przykład:

```swift
let animals = Animal.animals
```

Tutaj nie musisz dodatkowo importować `Animal.swift` w `ContentView.swift`.

Swift automatycznie rozpoznaje pliki Swift znajdujące się w tym samym projekcie.

## Używanie extension do dalszego porządkowania kodu

Teraz przenieśliśmy dane zwierząt z `ContentView` do `Animal`.

Jednak struktura `Animal` nadal zawiera jednocześnie dwa rodzaje kodu:

Pierwszy rodzaj to właściwości samego modelu zwierzęcia:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Drugi rodzaj to stałe dane zwierząt:

```swift
static let animals: [Animal] = [
    // ...
]
```

Aby struktura kodu była bardziej przejrzysta, możemy użyć `extension`, aby rozdzielić te dwie części.

`extension` oznacza rozszerzenie.

Pozwala dalej dodawać nowy kod na podstawie istniejącego typu.

Na przykład:

```swift
extension Animal {
    
}
```

Oznacza to, że rozszerzamy typ `Animal`.

## Umieszczenie danych zwierząt w extension

Możemy zmienić `Animal` w ten sposób:

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

Po takim uporządkowaniu struktura kodu staje się bardziej przejrzysta.

`struct Animal` odpowiada za opis tego, jakie właściwości powinno mieć zwierzę.

`extension Animal` odpowiada za przechowywanie zestawu stałych danych zwierząt.

Zwróć uwagę, że chociaż `animals` zostało przeniesione do `extension Animal`, sposób użycia się nie zmienia.

Nadal możemy używać go tak:

```swift
let animals = Animal.animals
```

To także jedna z cech `extension`: pomaga jedynie uporządkować kod i nie zmienia zewnętrznego sposobu wywołania.

## Gdy danych jest więcej, możesz utworzyć kolejny plik AnimalData

Teraz umieściliśmy `Animal` w osobnym pliku `Animal.swift`.

Jeśli danych zwierząt nie jest dużo, możesz zapisać `extension Animal` bezpośrednio w `Animal.swift`.

Jeśli jednak danych zwierząt będzie coraz więcej, możesz także utworzyć kolejny plik, na przykład:

```swift
AnimalData.swift
```

Następnie umieść w nim stałe dane zwierząt:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dane zwierząt
    ]
}
```

Po takim zabiegu odpowiedzialności kodu stają się bardziej przejrzyste:

`Animal.swift` odpowiada tylko za definiowanie modelu zwierzęcia.

`AnimalData.swift` odpowiada tylko za przechowywanie danych zwierząt.

`ContentView.swift` odpowiada tylko za wyświetlanie interfejsu.

Odpowiedzialność każdego pliku jest bardziej przejrzysta.

Zwróć uwagę, że `AnimalData.swift` to tylko nazwa pliku. Nie jest to nowy typ Swift. W tym pliku nadal używamy `extension Animal`, aby dodać stałe dane do `Animal`.

## Kompletny kod

Poniżej znajduje się uporządkowany kod `Animal.swift`:

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

Uporządkowany kod `AnimalData.swift`:

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

W `ContentView.swift` możesz używać tego tak:

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

Wskazówka: w plikach `Animal.swift` i `AnimalData.swift` pierwsza linia to:

```swift
import Foundation
```

Wcześniej, gdy pisaliśmy interfejsy SwiftUI, często używaliśmy:

```swift
import SwiftUI
```

Dzieje się tak, ponieważ `ContentView`, `Text`, `Button` i `Color` są związane z interfejsem, więc podczas pisania plików interfejsu zwykle musimy importować SwiftUI.

Jednak tutaj `Animal.swift` i `AnimalData.swift` nie są plikami interfejsu. Służą głównie do definiowania modelu zwierzęcia i przechowywania danych zwierząt.

W tym kodzie `UUID()` wymaga `Foundation`, więc wystarczy zaimportować `Foundation`.

## Podsumowanie

W tej lekcji zrobiliśmy głównie jedną rzecz: przenieśliśmy dane zwierząt poza `ContentView`.

Pierwotny sposób polegał na zapisaniu danych zwierząt bezpośrednio w `ContentView`. Taki kod działa, ale gdy ilość danych rośnie, plik widoku będzie stawał się coraz dłuższy.

Po uporządkowaniu `ContentView` odpowiada tylko za wyświetlanie interfejsu, a `Animal.animals` odpowiada za dostarczanie danych zwierząt.

W tej lekcji poznaliśmy także dwie nowe informacje.

Pierwsza to `static`.

`static` oznacza właściwość statyczną. Właściwość statyczna należy do samego typu i można uzyskać do niej dostęp bezpośrednio przez „NazwaTypu.nazwaWłaściwości”.

Na przykład:

```swift
Animal.animals
```

Druga to `extension`.

`extension` oznacza rozszerzenie. Pozwala podzielić kod tego samego typu na różne części, dzięki czemu struktura kodu jest bardziej przejrzysta.

W tym przykładzie używamy `extension Animal` do przechowywania danych zwierząt, dzięki czemu sama struktura `Animal` jest bardziej zwięzła.

Ponadto `Animal` głównie przechowuje model danych i nie pisze bezpośrednio interfejsu SwiftUI, dlatego tutaj używamy `import Foundation`.

Najważniejszym celem tej lekcji nie jest skomplikowanie kodu, ale sprawienie, aby kod był łatwiejszy do czytania i utrzymania.
