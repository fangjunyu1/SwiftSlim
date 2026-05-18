# Tierdaten organisieren

In der vorherigen Lektion haben wir ein einfaches Beispiel für eine Tier-Enzyklopädie fertiggestellt.

![view](../../../Resource/029_view.png)

Wenn der Benutzer auf ein Tier tippt, zeigt die Seite die Tierdetails über ein `Sheet` an.

Im Code der vorherigen Lektion gibt es jedoch ein Problem: Die Tierdaten wurden direkt in `ContentView` geschrieben.

Zum Beispiel:

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
            // Tierliste anzeigen
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Dieser Code kann normal ausgeführt werden. Wenn jedoch immer mehr Tierdaten hinzukommen, wird `ContentView` sehr lang.

`ContentView` sollte eigentlich hauptsächlich für die Anzeige der Benutzeroberfläche verantwortlich sein. Jetzt speichert es aber auch viele Tierdaten. Das erschwert das Lesen des Codes und die spätere Wartung.

Deshalb wollen wir in dieser Lektion eine Sache tun:

Die Tierdaten aus `ContentView` auslagern.

## Warum sollten Daten getrennt werden?

In SwiftUI ist View-Code normalerweise für die Anzeige der Benutzeroberfläche verantwortlich.

Zum Beispiel:

```swift
Text("Dolphin")
Image("dolphin")
```

Diese Codes hängen alle mit der Anzeige der Benutzeroberfläche zusammen.

Die Tierdaten selbst, zum Beispiel Tiername, Bildname, Verbreitungsgebiet, Lebensraum und Beschreibungstext, sind jedoch keine Struktur der Benutzeroberfläche.

Sie ähneln eher einer Gruppe fester Informationen:

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

Wenn UI-Code und Daten-Code komplett zusammen geschrieben werden, wird der Code immer unübersichtlicher.

Deshalb können wir die Tierdaten in den Typ `Animal` legen.

## Feste Daten mit static speichern

Schauen wir uns zuerst die organisierte Schreibweise an:

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

Hier wurde eine neue Codezeile hinzugefügt:

```swift
static let animals: [Animal] = [
    
]
```

`static` bedeutet statische Eigenschaft.

Eine statische Eigenschaft gehört zum Typ selbst, nicht zu einer bestimmten Instanz.

Dieser Satz ist etwas abstrakt. Wir können ihn mit einem einfachen Beispiel verstehen.

## Normale Eigenschaften und statische Eigenschaften

Zum Beispiel definieren wir einen `Student`:

```swift
struct Student {
    let name: String
}
```

Hier ist `name` eine normale Eigenschaft. Eine normale Eigenschaft gehört zu einer bestimmten Instanz.

Wenn wir auf `name` zugreifen möchten, müssen wir zuerst einen konkreten Studenten erstellen:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Hier ist `student` eine Instanz. Man kann es zunächst auch als einen konkreten Satz von Studentendaten verstehen.

Da jeder Student einen anderen Namen haben kann, muss `name` zu einem konkreten Studenten gehören.

Manche Daten gehören jedoch nicht zu einer bestimmten Instanz.

Zum Beispiel möchten wir eine Gruppe von Beispieldaten für die Vorschau vorbereiten:

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

Vor `previewStudents` steht hier `static`, daher ist es eine statische Eigenschaft.

Eine statische Eigenschaft gehört nicht zu einem bestimmten Studenten, sondern zum Typ `Student` selbst.

Deshalb müssen wir nicht zuerst einen bestimmten Studenten erstellen. Wir können direkt über den Typnamen darauf zugreifen:

```swift
print(Student.previewStudents.count)    // 3
```

Die Zugriffsweise lautet hier:

```swift
Typname.statischerEigenschaftsname
```

Also:

```swift
Student.previewStudents
```

Genauso können wir in der Tier-Enzyklopädie so auf die Tierdaten zugreifen:

```swift
Animal.animals
```

## Zurück zu ContentView

Jetzt wurden die Tierdaten bereits im Typ `Animal` gespeichert.

Deshalb müssen wir in `ContentView` kein langes Tier-Array mehr schreiben.

Wir können es so ändern:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Tierliste anzeigen
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Diese Codezeile bedeutet:

```swift
let animals = Animal.animals
```

Aus dem Typ `Animal` wird diese Gruppe von Tierdaten `animals` abgerufen und anschließend in der Konstante `animals` der aktuellen View gespeichert.

Nach dieser Änderung wird `ContentView` übersichtlicher.

`ContentView` ist für die Anzeige der Benutzeroberfläche verantwortlich, und `Animal.animals` stellt die Tierdaten bereit.

## Animal in eine eigene Datei auslagern

In der vorherigen Lektion haben wir `Animal` und `ContentView` in dieselbe Datei geschrieben, damit das Beispiel leichter zu verstehen ist.

Da der Code damals noch relativ kurz war, war diese Schreibweise kein Problem.

Jetzt werden die Tierdaten jedoch immer mehr. Wenn wir weiterhin den gesamten Code in `ContentView.swift` schreiben, wird die Datei sehr lang und schwer lesbar.

Deshalb können wir `Animal` einzeln in eine neue Swift-Datei legen.

In Xcode können wir zum Beispiel eine neue Swift-Datei erstellen:

```swift
Animal.swift
```

Dann verschieben wir die Struktur `Animal` in diese Datei:

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

Nach dieser Organisation gilt:

`ContentView.swift` ist für die Anzeige der Benutzeroberfläche verantwortlich.

`Animal.swift` ist dafür verantwortlich, die Struktur der Tierdaten zu beschreiben.

Auch wenn sie in unterschiedlichen Dateien liegen, kann `ContentView` weiterhin direkt `Animal` verwenden, solange beide Dateien im selben Projekt liegen.

Zum Beispiel:

```swift
let animals = Animal.animals
```

Hier müssen wir in `ContentView.swift` nicht zusätzlich `Animal.swift` importieren.

Swift erkennt Swift-Dateien im selben Projekt automatisch.

## Code mit extension weiter organisieren

Jetzt haben wir die Tierdaten bereits aus `ContentView` nach `Animal` verschoben.

Allerdings enthält die Struktur `Animal` weiterhin gleichzeitig zwei Arten von Code:

Die erste Art sind die Eigenschaften des Tiermodells selbst:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Die zweite Art sind die festen Tierdaten:

```swift
static let animals: [Animal] = [
    // ...
]
```

Um die Codestruktur klarer zu machen, können wir `extension` verwenden, um diese beiden Teile zu trennen.

`extension` bedeutet Erweiterung.

Damit kann man auf Grundlage eines bestehenden Typs weiteren Code hinzufügen.

Zum Beispiel:

```swift
extension Animal {
    
}
```

Das bedeutet, dass wir den Typ `Animal` erweitern.

## Tierdaten in extension ablegen

Wir können `Animal` so ändern:

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

Nach dieser Organisation ist die Codestruktur klarer.

`struct Animal` beschreibt, welche Eigenschaften ein Tier haben sollte.

`extension Animal` ist für das Speichern einer Gruppe fester Tierdaten verantwortlich.

Beachte: Obwohl `animals` in `extension Animal` verschoben wurde, ändert sich die Verwendung nicht.

Wir können es weiterhin so verwenden:

```swift
let animals = Animal.animals
```

Das ist ebenfalls eine Eigenschaft von `extension`: Es hilft uns nur, Code zu organisieren, ändert aber nicht die externe Aufrufweise.

## Bei vielen Daten kann man zusätzlich eine AnimalData-Datei erstellen

Jetzt haben wir `Animal` bereits in die eigene Datei `Animal.swift` gelegt.

Wenn es nur wenige Tierdaten gibt, kann `extension Animal` direkt in `Animal.swift` geschrieben werden.

Wenn jedoch immer mehr Tierdaten hinzukommen, können wir auch eine weitere Datei erstellen, zum Beispiel:

```swift
AnimalData.swift
```

Dann legen wir die festen Tierdaten dort ab:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Tierdaten
    ]
}
```

Danach wird die Aufgabenverteilung im Code klarer:

`Animal.swift` ist nur für die Definition des Tiermodells verantwortlich.

`AnimalData.swift` ist nur für das Speichern der Tierdaten verantwortlich.

`ContentView.swift` ist nur für die Anzeige der Benutzeroberfläche verantwortlich.

Die Verantwortung jeder Datei ist dadurch klarer.

Beachte: `AnimalData.swift` ist nur ein Dateiname, kein neuer Swift-Typ. In dieser Datei wird weiterhin über `extension Animal` fester Code zu `Animal` hinzugefügt.

## Vollständiger Code

Hier ist der organisierte Code von `Animal.swift`:

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

Der organisierte Code von `AnimalData.swift`:

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

In `ContentView.swift` kann es so verwendet werden:

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

Hinweis: In den Dateien `Animal.swift` und `AnimalData.swift` steht in der ersten Zeile jeweils:

```swift
import Foundation
```

Früher haben wir beim Schreiben von SwiftUI-Benutzeroberflächen oft Folgendes verwendet:

```swift
import SwiftUI
```

Das liegt daran, dass `ContentView`, `Text`, `Button`, `Color` und diese Inhalte alle mit der Benutzeroberfläche zusammenhängen. Daher muss beim Schreiben von UI-Dateien normalerweise SwiftUI importiert werden.

Aber `Animal.swift` und `AnimalData.swift` sind hier keine UI-Dateien. Sie werden hauptsächlich verwendet, um das Tiermodell zu definieren und Tierdaten zu speichern.

In diesem Code benötigt `UUID()` `Foundation`, daher reicht es aus, `Foundation` zu importieren.

## Zusammenfassung

In dieser Lektion haben wir hauptsächlich eine Sache getan: Wir haben die Tierdaten aus `ContentView` ausgelagert.

In der ursprünglichen Schreibweise wurden die Tierdaten direkt in `ContentView` geschrieben. Der Code kann so ausgeführt werden, aber wenn die Datenmenge wächst, wird die View-Datei immer länger.

Nach der Organisation ist `ContentView` nur für die Anzeige der Benutzeroberfläche verantwortlich, und `Animal.animals` stellt die Tierdaten bereit.

In dieser Lektion haben wir außerdem zwei neue Kenntnisse gelernt.

Das erste ist `static`.

`static` bedeutet statische Eigenschaft. Eine statische Eigenschaft gehört zum Typ selbst und kann direkt über „Typname.Eigenschaftsname“ aufgerufen werden.

Zum Beispiel:

```swift
Animal.animals
```

Das zweite ist `extension`.

`extension` bedeutet Erweiterung. Damit kann Code desselben Typs getrennt geschrieben werden, wodurch die Codestruktur klarer wird.

In diesem Beispiel verwenden wir `extension Animal`, um Tierdaten zu speichern, sodass die Struktur `Animal` selbst übersichtlicher wird.

Außerdem speichert `Animal` hauptsächlich ein Datenmodell und schreibt keine SwiftUI-Benutzeroberfläche direkt. Deshalb wird hier `import Foundation` verwendet.

Der Schwerpunkt dieser Lektion besteht nicht darin, den Code komplexer zu machen, sondern ihn leichter lesbar und wartbar zu machen.
