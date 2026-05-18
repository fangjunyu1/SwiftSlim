# ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸುವುದು

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ, ನಾವು ಸರಳವಾದ ಪ್ರಾಣಿ ವಿಶ್ವಕೋಶ ಉದಾಹರಣೆಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

![view](../../../Resource/029_view.png)

ಬಳಕೆದಾರನು ಯಾವುದಾದರೂ ಪ್ರಾಣಿಯನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿದಾಗ, ಪುಟವು `Sheet` ಮೂಲಕ ಪ್ರಾಣಿಯ ವಿವರಗಳನ್ನು ತೋರಿಸುತ್ತದೆ.

ಆದರೆ ಹಿಂದಿನ ಪಾಠದ ಕೋಡ್‌ನಲ್ಲಿ ಒಂದು ಸಮಸ್ಯೆ ಇದೆ: ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ನೇರವಾಗಿ `ContentView` ಒಳಗೆ ಬರೆಯಲಾಗಿತ್ತು.

ಉದಾಹರಣೆಗೆ:

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
            // ಪ್ರಾಣಿಗಳ ಪಟ್ಟಿಯನ್ನು ತೋರಿಸಿ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ಈ ಕೋಡ್ ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ. ಆದರೆ ಪ್ರಾಣಿ ಡೇಟಾ ಹೆಚ್ಚು ಹೆಚ್ಚು ಆಗಿದಂತೆ, `ContentView` ಬಹಳ ಉದ್ದವಾಗುತ್ತದೆ.

`ContentView` ಮೂಲತಃ ಮುಖ್ಯವಾಗಿ ಇಂಟರ್ಫೇಸ್ ತೋರಿಸುವ ಕೆಲಸವನ್ನು ಮಾಡಬೇಕು. ಆದರೆ ಈಗ ಅದು ದೊಡ್ಡ ಪ್ರಮಾಣದ ಪ್ರಾಣಿ ಡೇಟಾವನ್ನೂ ಸಂಗ್ರಹಿಸುತ್ತಿದೆ. ಇದರಿಂದ ಕೋಡ್ ಓದುವುದು ಕಷ್ಟವಾಗುತ್ತದೆ ಮತ್ತು ನಂತರದ ನಿರ್ವಹಣೆಯೂ ಅಸೌಕರ್ಯಕರವಾಗುತ್ತದೆ.

ಆದ್ದರಿಂದ, ಈ ಪಾಠದಲ್ಲಿ ನಾವು ಒಂದು ಕೆಲಸ ಮಾಡಲಿದ್ದೇವೆ:

ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು `ContentView` ನಿಂದ ಹೊರಗೆ ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸುವುದು.

## ಡೇಟಾವನ್ನು ಏಕೆ ಬೇರ್ಪಡಿಸಬೇಕು?

SwiftUI ನಲ್ಲಿ, View ಕೋಡ್ ಸಾಮಾನ್ಯವಾಗಿ ಇಂಟರ್ಫೇಸ್ ತೋರಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
Text("Dolphin")
Image("dolphin")
```

ಈ ಕೋಡ್‌ಗಳು ಎಲ್ಲವೂ ಇಂಟರ್ಫೇಸ್ ಪ್ರದರ್ಶನಕ್ಕೆ ಸಂಬಂಧಿಸಿದವು.

ಆದರೆ ಪ್ರಾಣಿ ಡೇಟಾ ಸ್ವತಃ, ಉದಾಹರಣೆಗೆ ಪ್ರಾಣಿಯ ಹೆಸರು, ಚಿತ್ರದ ಹೆಸರು, ವಿಸ್ತರಣೆ ಪ್ರದೇಶ, ವಾಸಸ್ಥಾನ, ವಿವರಣೆ ಪಠ್ಯ ಇತ್ಯಾದಿ, ಇಂಟರ್ಫೇಸ್ ರಚನೆ ಅಲ್ಲ.

ಅವು ಸ್ಥಿರ ಮಾಹಿತಿಯ ಒಂದು ಗುಂಪಿನಂತಿವೆ:

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

ಇಂಟರ್ಫೇಸ್ ಕೋಡ್ ಮತ್ತು ಡೇಟಾ ಕೋಡ್ ಅನ್ನು ಎಲ್ಲವನ್ನೂ ಒಟ್ಟಿಗೆ ಬರೆದರೆ, ಕೋಡ್ ಕ್ರಮೇಣ ಹೆಚ್ಚು ಅಸ್ತವ್ಯಸ್ತವಾಗುತ್ತದೆ.

ಆದ್ದರಿಂದ, ನಾವು ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು `Animal` ಪ್ರಕಾರದೊಳಗೆ ಇರಿಸಬಹುದು.

## ಸ್ಥಿರ ಡೇಟಾವನ್ನು ಉಳಿಸಲು static ಬಳಸುವುದು

ಮೊದಲು, ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಿದ ನಂತರದ ಬರವಣಿಗೆಯನ್ನು ನೋಡೋಣ:

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

ಇಲ್ಲಿ ಹೊಸದಾಗಿ ಒಂದು ಸಾಲಿನ ಕೋಡ್ ಸೇರಿಸಲಾಗಿದೆ:

```swift
static let animals: [Animal] = [
    
]
```

`static` ಎಂದರೆ ಸ್ಥಿರ ಗುಣ.

ಸ್ಥಿರ ಗುಣವು ಪ್ರಕಾರಕ್ಕೇ ಸೇರಿರುತ್ತದೆ; ಅದು ಯಾವುದೇ ಒಂದು ನಿರ್ದಿಷ್ಟ instance ಗೆ ಸೇರಿರುವುದಿಲ್ಲ.

ಈ ವಾಕ್ಯ ಸ್ವಲ್ಪ ಅಮೂರ್ತವಾಗಿ ಕಾಣಬಹುದು. ಅದನ್ನು ಸರಳ ಉದಾಹರಣೆಯ ಮೂಲಕ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

## ಸಾಮಾನ್ಯ ಗುಣ ಮತ್ತು ಸ್ಥಿರ ಗುಣ

ಉದಾಹರಣೆಗೆ, ನಾವು ಒಂದು `Student` ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತೇವೆ:

```swift
struct Student {
    let name: String
}
```

ಇಲ್ಲಿ `name` ಒಂದು ಸಾಮಾನ್ಯ ಗುಣ. ಸಾಮಾನ್ಯ ಗುಣವು ಒಂದು ನಿರ್ದಿಷ್ಟ instance ಗೆ ಸೇರಿರುತ್ತದೆ.

ನಾವು `name` ಅನ್ನು ಪ್ರವೇಶಿಸಲು ಬಯಸಿದರೆ, ಮೊದಲು ಒಂದು ನಿರ್ದಿಷ್ಟ ವಿದ್ಯಾರ್ಥಿಯನ್ನು ರಚಿಸಬೇಕು:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

ಇಲ್ಲಿರುವ `student` ಒಂದು instance. ಇದನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಒಂದು ನಿರ್ದಿಷ್ಟ ವಿದ್ಯಾರ್ಥಿ ಡೇಟಾ ಎಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

ಪ್ರತಿಯೊಬ್ಬ ವಿದ್ಯಾರ್ಥಿಯ ಹೆಸರೂ ಬೇರೆಬೇರೆ ಆಗಿರಬಹುದು. ಆದ್ದರಿಂದ `name` ಅನ್ನು ನಿರ್ದಿಷ್ಟ ವಿದ್ಯಾರ್ಥಿಯ ಮೇಲೆಯೇ ಇರಿಸಬೇಕು.

ಆದರೆ ಕೆಲವು ಡೇಟಾ ಯಾವುದಾದರೂ ಒಂದು ನಿರ್ದಿಷ್ಟ instance ಗೆ ಸೇರಿರುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ, ನಾವು preview ಮಾಡಲು ಬಳಸಬಹುದಾದ ಉದಾಹರಣೆ ಡೇಟಾದ ಒಂದು ಗುಂಪನ್ನು ಸಿದ್ಧಪಡಿಸಲು ಬಯಸುತ್ತೇವೆ:

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

ಇಲ್ಲಿ `previewStudents` ಮುಂದೆ `static` ಇದೆ, ಆದ್ದರಿಂದ ಅದು ಸ್ಥಿರ ಗುಣ.

ಸ್ಥಿರ ಗುಣವು ಯಾವುದಾದರೂ ಒಂದು ವಿದ್ಯಾರ್ಥಿಗೆ ಸೇರಿರುವುದಿಲ್ಲ. ಅದು `Student` ಎಂಬ ಪ್ರಕಾರಕ್ಕೇ ಸೇರಿರುತ್ತದೆ.

ಆದ್ದರಿಂದ, ಮೊದಲು ಯಾವುದಾದರೂ ಒಂದು ವಿದ್ಯಾರ್ಥಿಯನ್ನು ರಚಿಸದೆ, ನೇರವಾಗಿ ಪ್ರಕಾರದ ಹೆಸರಿನಿಂದ ಪ್ರವೇಶಿಸಬಹುದು:

```swift
print(Student.previewStudents.count)    // 3
```

ಇಲ್ಲಿನ ಪ್ರವೇಶ ವಿಧಾನ ಹೀಗಿದೆ:

```swift
ಪ್ರಕಾರದಹೆಸರು.ಸ್ಥಿರಗುಣದಹೆಸರು
```

ಅಂದರೆ:

```swift
Student.previewStudents
```

ಅದೇ ರೀತಿ, ಪ್ರಾಣಿ ವಿಶ್ವಕೋಶದಲ್ಲಿ ನಾವು ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಹೀಗೆ ಪ್ರವೇಶಿಸಬಹುದು:

```swift
Animal.animals
```

## ಮತ್ತೆ ContentView ಗೆ ಬರುವುದು

ಈಗ ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಈಗಾಗಲೇ `Animal` ಪ್ರಕಾರದಲ್ಲಿ ಉಳಿಸಲಾಗಿದೆ.

ಆದ್ದರಿಂದ `ContentView` ಒಳಗೆ ಮತ್ತೆ ಬಹಳ ಉದ್ದವಾದ ಪ್ರಾಣಿ array ಬರೆಯಬೇಕಾಗಿಲ್ಲ.

ನಾವು ಇದನ್ನು ಹೀಗೆ ಬದಲಾಯಿಸಬಹುದು:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // ಪ್ರಾಣಿಗಳ ಪಟ್ಟಿಯನ್ನು ತೋರಿಸಿ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ಈ ಸಾಲಿನ ಕೋಡ್ ಅರ್ಥ:

```swift
let animals = Animal.animals
```

`Animal` ಪ್ರಕಾರದಿಂದ `animals` ಎಂಬ ಪ್ರಾಣಿ ಡೇಟಾ ಗುಂಪನ್ನು ತೆಗೆದು, ಅದನ್ನು ಪ್ರಸ್ತುತ View ಯ `animals` constant ನಲ್ಲಿ ಉಳಿಸುವುದು.

ಹೀಗೆ ಬರೆದ ನಂತರ, `ContentView` ಹೆಚ್ಚು ಸಂಕ್ಷಿಪ್ತವಾಗುತ್ತದೆ.

`ContentView` ಇಂಟರ್ಫೇಸ್ ತೋರಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ, ಮತ್ತು `Animal.animals` ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಒದಗಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

## Animal ಅನ್ನು ಪ್ರತ್ಯೇಕ ಫೈಲ್‌ಗೆ ಬೇರ್ಪಡಿಸುವುದು

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ, ಉದಾಹರಣೆಯನ್ನು ಸುಲಭವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು, ನಾವು `Animal` ಮತ್ತು `ContentView` ಅನ್ನು ಅದೇ ಫೈಲ್‌ನಲ್ಲಿ ಬರೆದಿದ್ದೇವೆ.

ಆ ಸಮಯದಲ್ಲಿ ಕೋಡ್ ಇನ್ನೂ ಕಡಿಮೆ ಇದ್ದುದರಿಂದ, ಹೀಗೆ ಬರೆಯುವುದರಲ್ಲಿ ಸಮಸ್ಯೆ ಇರಲಿಲ್ಲ.

ಆದರೆ ಈಗ ಪ್ರಾಣಿ ಡೇಟಾ ಹೆಚ್ಚಾಗುತ್ತಿದೆ. ಎಲ್ಲಾ ಕೋಡ್ ಅನ್ನು `ContentView.swift` ಒಳಗೆ ಮುಂದುವರಿಸಿ ಬರೆದರೆ, ಫೈಲ್ ಬಹಳ ಉದ್ದವಾಗುತ್ತದೆ ಮತ್ತು ಓದುವುದಕ್ಕೂ ಅಸೌಕರ್ಯವಾಗುತ್ತದೆ.

ಆದ್ದರಿಂದ, ನಾವು `Animal` ಅನ್ನು ಪ್ರತ್ಯೇಕ ಹೊಸ Swift ಫೈಲ್‌ನಲ್ಲಿ ಇರಿಸಬಹುದು.

Xcode ನಲ್ಲಿ, ಉದಾಹರಣೆಗೆ ಒಂದು ಹೊಸ Swift ಫೈಲ್ ರಚಿಸಬಹುದು:

```swift
Animal.swift
```

ನಂತರ `Animal` struct ಅನ್ನು ಈ ಫೈಲ್‌ಗೆ ಸ್ಥಳಾಂತರಿಸಿ:

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

ಹೀಗೆ ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಿದ ನಂತರ:

`ContentView.swift` ಇಂಟರ್ಫೇಸ್ ತೋರಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

`Animal.swift` ಪ್ರಾಣಿ ಡೇಟಾದ ರಚನೆಯನ್ನು ವಿವರಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

ಅವು ಬೇರೆಬೇರೆ ಫೈಲ್‌ಗಳಲ್ಲಿ ಇದ್ದರೂ, ಅವು ಒಂದೇ project ಒಳಗೆ ಇರುವವರೆಗೆ, `ContentView` ಇನ್ನೂ ನೇರವಾಗಿ `Animal` ಅನ್ನು ಬಳಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
let animals = Animal.animals
```

ಇಲ್ಲಿ `ContentView.swift` ಒಳಗೆ ಹೆಚ್ಚುವರಿಯಾಗಿ `Animal.swift` ಅನ್ನು import ಮಾಡುವ ಅಗತ್ಯವಿಲ್ಲ.

Swift ಒಂದೇ project ಒಳಗಿನ Swift ಫೈಲ್‌ಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಗುರುತಿಸುತ್ತದೆ.

## code ಅನ್ನು ಮುಂದುವರಿಸಿ ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಲು extension ಬಳಸುವುದು

ಈಗ ನಾವು ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು `ContentView` ನಿಂದ `Animal` ಒಳಗೆ ಸ್ಥಳಾಂತರಿಸಿದ್ದೇವೆ.

ಆದರೆ `Animal` struct ಒಳಗೆ ಇನ್ನೂ ಎರಡು ವಿಧದ code ಒಂದೇ ಸಮಯದಲ್ಲಿ ಸೇರಿಕೊಂಡಿವೆ:

ಮೊದಲ ವಿಧವು ಪ್ರಾಣಿ model ಸ್ವತಃ ಹೊಂದಿರಬೇಕಾದ ಗುಣಗಳು:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

ಎರಡನೇ ವಿಧವು ಸ್ಥಿರ ಪ್ರಾಣಿ ಡೇಟಾ:

```swift
static let animals: [Animal] = [
    // ...
]
```

ಕೋಡ್ ರಚನೆ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗಲು, ಈ ಎರಡು ಭಾಗಗಳನ್ನು ಬೇರ್ಪಡಿಸಲು ನಾವು `extension` ಬಳಸಬಹುದು.

`extension` ಎಂದರೆ ವಿಸ್ತರಣೆ.

ಇದು ಈಗಿರುವ ಪ್ರಕಾರದ ಆಧಾರದ ಮೇಲೆ ಹೊಸ ಕೋಡ್ ಅನ್ನು ಮುಂದುವರಿಸಿ ಸೇರಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
extension Animal {
    
}
```

ಇದು ನಾವು `Animal` ಎಂಬ ಪ್ರಕಾರವನ್ನು ವಿಸ್ತರಿಸುತ್ತಿದ್ದೇವೆ ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

## ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು extension ಒಳಗೆ ಇಡುವುದು

ನಾವು `Animal` ಅನ್ನು ಹೀಗೆ ಬದಲಾಯಿಸಬಹುದು:

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

ಹೀಗೆ ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಿದ ನಂತರ, ಕೋಡ್ ರಚನೆ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

`struct Animal` ಒಂದು ಪ್ರಾಣಿಗೆ ಯಾವ ಗುಣಗಳು ಇರಬೇಕು ಎಂಬುದನ್ನು ವಿವರಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

`extension Animal` ಸ್ಥಿರ ಪ್ರಾಣಿ ಡೇಟಾದ ಒಂದು ಗುಂಪನ್ನು ಉಳಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

ಗಮನಿಸಿ, `animals` ಅನ್ನು `extension Animal` ಒಳಗೆ ಸ್ಥಳಾಂತರಿಸಿದರೂ, ಬಳಸುವ ವಿಧಾನ ಬದಲಾಗುವುದಿಲ್ಲ.

ನಾವು ಇನ್ನೂ ಹೀಗೆ ಬಳಸಬಹುದು:

```swift
let animals = Animal.animals
```

ಇದು `extension` ನ ಒಂದು ಲಕ್ಷಣವೂ ಹೌದು: ಅದು ಕೇವಲ code ಅನ್ನು ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ; ಹೊರಗಿನ ಕರೆ ಮಾಡುವ ವಿಧಾನವನ್ನು ಬದಲಾಯಿಸುವುದಿಲ್ಲ.

## ಡೇಟಾ ಹೆಚ್ಚು ಇದ್ದಾಗ, AnimalData ಫೈಲ್ ಅನ್ನು ಮತ್ತೆ ಹೊಸದಾಗಿ ರಚಿಸಬಹುದು

ಈಗ ನಾವು `Animal` ಅನ್ನು ಪ್ರತ್ಯೇಕ `Animal.swift` ಫೈಲ್‌ಗೆ ಇಟ್ಟಿದ್ದೇವೆ.

ಪ್ರಾಣಿ ಡೇಟಾ ಕಡಿಮೆ ಇದ್ದರೆ, `extension Animal` ಅನ್ನು ನೇರವಾಗಿ `Animal.swift` ಒಳಗೂ ಬರೆಯಬಹುದು.

ಆದರೆ ಪ್ರಾಣಿ ಡೇಟಾ ಹೆಚ್ಚು ಹೆಚ್ಚು ಆಗುತ್ತಿದ್ದರೆ, ಮತ್ತೊಂದು ಫೈಲ್ ಅನ್ನು ಹೊಸದಾಗಿ ರಚಿಸಬಹುದು. ಉದಾಹರಣೆಗೆ:

```swift
AnimalData.swift
```

ನಂತರ ಸ್ಥಿರ ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಅದರಲ್ಲಿ ಇಡಿ:

```swift
extension Animal {
    static let animals: [Animal] = [
        // ಪ್ರಾಣಿ ಡೇಟಾ
    ]
}
```

ಹೀಗೆ ಮಾಡಿದ ನಂತರ, code ನ ಕೆಲಸದ ವಿಭಾಗ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ:

`Animal.swift` ಕೇವಲ ಪ್ರಾಣಿ model ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

`AnimalData.swift` ಕೇವಲ ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಉಳಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

`ContentView.swift` ಕೇವಲ ಇಂಟರ್ಫೇಸ್ ತೋರಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

ಪ್ರತಿ ಫೈಲ್‌ನ ಹೊಣೆಗಾರಿಕೆ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

ಗಮನಿಸಿ, `AnimalData.swift` ಕೇವಲ ಫೈಲ್ ಹೆಸರು; ಅದು ಹೊಸ Swift ಪ್ರಕಾರ ಅಲ್ಲ. ಈ ಫೈಲ್‌ನಲ್ಲಿ ಇನ್ನೂ `extension Animal` ಮೂಲಕ `Animal` ಗೆ ಸ್ಥಿರ ಡೇಟಾವನ್ನು ಸೇರಿಸಲಾಗುತ್ತಿದೆ.

## ಸಂಪೂರ್ಣ ಕೋಡ್

ಕೆಳಗೆ ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಿದ ನಂತರದ `Animal.swift` ಕೋಡ್ ಇದೆ:

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

ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಿದ ನಂತರದ `AnimalData.swift` ಕೋಡ್:

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

`ContentView.swift` ನಲ್ಲಿ ಹೀಗೆ ಬಳಸಬಹುದು:

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

ಸೂಚನೆ: `Animal.swift` ಮತ್ತು `AnimalData.swift` ಫೈಲ್‌ಗಳಲ್ಲಿ ಮೊದಲ ಸಾಲಿನಲ್ಲಿ ಹೀಗೆ ಬರೆಯಲಾಗಿದೆ:

```swift
import Foundation
```

ಹಿಂದೆ ನಾವು SwiftUI ಇಂಟರ್ಫೇಸ್ ಬರೆಯುವಾಗ, ಆಗಾಗ ಹೀಗೆ ಬಳಸುತ್ತಿದ್ದೆವು:

```swift
import SwiftUI
```

ಏಕೆಂದರೆ `ContentView`, `Text`, `Button`, `Color` ಇವುಗಳೆಲ್ಲವೂ ಇಂಟರ್ಫೇಸ್‌ಗೆ ಸಂಬಂಧಿಸಿದ್ದವು. ಆದ್ದರಿಂದ ಇಂಟರ್ಫೇಸ್ ಫೈಲ್ ಬರೆಯುವಾಗ ಸಾಮಾನ್ಯವಾಗಿ SwiftUI ಅನ್ನು import ಮಾಡಬೇಕು.

ಆದರೆ ಇಲ್ಲಿ `Animal.swift` ಮತ್ತು `AnimalData.swift` ಇಂಟರ್ಫೇಸ್ ಫೈಲ್‌ಗಳು ಅಲ್ಲ. ಅವು ಮುಖ್ಯವಾಗಿ ಪ್ರಾಣಿ model ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಲು ಮತ್ತು ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಉಳಿಸಲು ಬಳಸಲಾಗುತ್ತವೆ.

ಈ ಕೋಡ್‌ನಲ್ಲಿ `UUID()` ಗೆ `Foundation` ಅಗತ್ಯವಿದೆ, ಆದ್ದರಿಂದ `Foundation` ಅನ್ನು import ಮಾಡಿದರೆ ಸಾಕು.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ ನಾವು ಮುಖ್ಯವಾಗಿ ಒಂದು ಕೆಲಸ ಮಾಡಿದ್ದೇವೆ: ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು `ContentView` ನಿಂದ ಹೊರಗೆ ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಿದ್ದೇವೆ.

ಮೂಲ ಬರವಣಿಗೆಯಲ್ಲಿ ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ನೇರವಾಗಿ `ContentView` ಒಳಗೆ ಬರೆಯಲಾಗಿತ್ತು. ಹೀಗೆ code ಕಾರ್ಯನಿರ್ವಹಿಸಬಹುದು, ಆದರೆ ಡೇಟಾ ಹೆಚ್ಚಾದಾಗ View ಫೈಲ್ ಹೆಚ್ಚು ಹೆಚ್ಚು ಉದ್ದವಾಗುತ್ತದೆ.

ಸುವ್ಯವಸ್ಥೆಗೊಳಿಸಿದ ನಂತರ, `ContentView` ಕೇವಲ ಇಂಟರ್ಫೇಸ್ ತೋರಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ, ಮತ್ತು `Animal.animals` ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಒದಗಿಸುವುದಕ್ಕೆ ಹೊಣೆಗಾರವಾಗಿರುತ್ತದೆ.

ಈ ಪಾಠದಲ್ಲಿ ಇನ್ನೂ ಎರಡು ಹೊಸ ಜ್ಞಾನಾಂಶಗಳನ್ನು ಕಲಿತಿದ್ದೇವೆ.

ಮೊದಲನೆಯದು `static`.

`static` ಎಂದರೆ ಸ್ಥಿರ ಗುಣ. ಸ್ಥಿರ ಗುಣವು ಪ್ರಕಾರಕ್ಕೇ ಸೇರಿರುತ್ತದೆ ಮತ್ತು “ಪ್ರಕಾರದಹೆಸರು.ಗುಣದಹೆಸರು” ವಿಧಾನದಿಂದ ನೇರವಾಗಿ ಪ್ರವೇಶಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Animal.animals
```

ಎರಡನೆಯದು `extension`.

`extension` ಎಂದರೆ ವಿಸ್ತರಣೆ. ಇದು ಒಂದೇ ಪ್ರಕಾರದ code ಅನ್ನು ಬೇರ್ಪಡಿಸಿ ಬರೆಯಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ, ಇದರಿಂದ code ರಚನೆ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, ನಾವು ಪ್ರಾಣಿ ಡೇಟಾವನ್ನು ಉಳಿಸಲು `extension Animal` ಬಳಸಿದ್ದೇವೆ. ಇದರಿಂದ `Animal` struct ಸ್ವತಃ ಇನ್ನಷ್ಟು ಸರಳವಾಗಿದೆ.

ಇದಲ್ಲದೆ, `Animal` ಮುಖ್ಯವಾಗಿ ಡೇಟಾ model ಅನ್ನು ಉಳಿಸುತ್ತದೆ ಮತ್ತು SwiftUI ಇಂಟರ್ಫೇಸ್ ಅನ್ನು ನೇರವಾಗಿ ಬರೆಯುವುದಿಲ್ಲ. ಆದ್ದರಿಂದ ಇಲ್ಲಿ `import Foundation` ಬಳಸಲಾಗಿದೆ.

ಈ ಪಾಠದ ಮುಖ್ಯ ಉದ್ದೇಶ code ಅನ್ನು ಹೆಚ್ಚು ಸಂಕೀರ್ಣಗೊಳಿಸುವುದು ಅಲ್ಲ; code ಅನ್ನು ಓದಲು ಮತ್ತು ನಿರ್ವಹಿಸಲು ಸುಲಭಗೊಳಿಸುವುದು.
