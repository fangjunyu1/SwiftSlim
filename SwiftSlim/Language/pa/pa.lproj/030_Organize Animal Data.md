# ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਨੂੰ ਸੰਗਠਿਤ ਕਰਨਾ

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਉਦਾਹਰਨ ਪੂਰੀ ਕੀਤੀ ਸੀ।

![view](../../../Resource/029_view.png)

ਜਦੋਂ ਉਪਭੋਗਤਾ ਕਿਸੇ ਜਾਨਵਰ 'ਤੇ ਟੈਪ ਕਰਦਾ ਹੈ, ਪੰਨਾ `Sheet` ਰਾਹੀਂ ਜਾਨਵਰ ਦੀ ਵਿਸਥਾਰ ਜਾਣਕਾਰੀ ਦਿਖਾਏਗਾ।

ਪਰ, ਪਿਛਲੇ ਪਾਠ ਦੇ ਕੋਡ ਵਿੱਚ ਇੱਕ ਸਮੱਸਿਆ ਸੀ: ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਸਿੱਧਾ `ContentView` ਦੇ ਅੰਦਰ ਲਿਖਿਆ ਗਿਆ ਸੀ।

ਉਦਾਹਰਨ ਲਈ:

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
            // ਜਾਨਵਰਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ਇਹ ਕੋਡ ਠੀਕ ਤਰ੍ਹਾਂ ਚੱਲ ਸਕਦਾ ਹੈ, ਪਰ ਜਦੋਂ ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਵੱਧਦਾ ਜਾਂਦਾ ਹੈ, `ContentView` ਬਹੁਤ ਲੰਮਾ ਹੋ ਜਾਵੇਗਾ।

`ContentView` ਮੁੱਖ ਤੌਰ 'ਤੇ ਇੰਟਰਫੇਸ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ, ਪਰ ਹੁਣ ਇਹ ਬਹੁਤ ਸਾਰਾ ਜਾਨਵਰ ਡਾਟਾ ਵੀ ਸੰਭਾਲ ਰਿਹਾ ਹੈ। ਇਸ ਨਾਲ ਕੋਡ ਪੜ੍ਹਨ ਵਿੱਚ ਅਸਰ ਪੈਂਦਾ ਹੈ ਅਤੇ ਬਾਅਦ ਦੀ ਸੰਭਾਲ ਵੀ ਅਸੁਵਿਧਾਜਨਕ ਹੋ ਜਾਂਦੀ ਹੈ।

ਇਸ ਲਈ, ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਕੰਮ ਕਰਾਂਗੇ:

ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਨੂੰ `ContentView` ਤੋਂ ਬਾਹਰ ਸੰਗਠਿਤ ਕਰਾਂਗੇ।

## ਡਾਟਾ ਨੂੰ ਵੱਖ ਕਿਉਂ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ?

SwiftUI ਵਿੱਚ, ਵਿਊ ਕੋਡ ਆਮ ਤੌਰ 'ਤੇ ਇੰਟਰਫੇਸ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Text("Dolphin")
Image("dolphin")
```

ਇਹ ਕੋਡ ਇੰਟਰਫੇਸ ਦਿਖਾਉਣ ਨਾਲ ਸੰਬੰਧਿਤ ਹਨ।

ਪਰ ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਆਪਣੇ ਆਪ ਵਿੱਚ, ਜਿਵੇਂ ਜਾਨਵਰ ਦਾ ਨਾਮ, ਤਸਵੀਰ ਦਾ ਨਾਮ, ਵੰਡ ਖੇਤਰ, ਆਵਾਸ ਅਤੇ ਵੇਰਵਾ ਲਿਖਤ, ਇੰਟਰਫੇਸ ਦੀ ਬਣਤਰ ਨਹੀਂ ਹੈ।

ਉਹ ਹੋਰ ਵੱਧ ਇੱਕ ਸਥਿਰ ਜਾਣਕਾਰੀ ਦੇ ਸਮੂਹ ਵਰਗੇ ਹਨ:

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

ਜੇ ਇੰਟਰਫੇਸ ਕੋਡ ਅਤੇ ਡਾਟਾ ਕੋਡ ਸਭ ਕੁਝ ਇਕੱਠੇ ਲਿਖਿਆ ਜਾਵੇ, ਤਾਂ ਕੋਡ ਹੌਲੀ-ਹੌਲੀ ਹੋਰ ਗੁੰਝਲਦਾਰ ਹੋ ਜਾਵੇਗਾ।

ਇਸ ਲਈ, ਅਸੀਂ ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਨੂੰ `Animal` ਟਾਈਪ ਵਿੱਚ ਰੱਖ ਸਕਦੇ ਹਾਂ।

## static ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਸਥਿਰ ਡਾਟਾ ਸੰਭਾਲਣਾ

ਪਹਿਲਾਂ ਸੰਗਠਿਤ ਕੀਤੀ ਹੋਈ ਲਿਖਤ ਵੇਖਦੇ ਹਾਂ:

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

ਇੱਥੇ ਇੱਕ ਨਵੀਂ ਕੋਡ ਲਾਈਨ ਜੋੜੀ ਗਈ ਹੈ:

```swift
static let animals: [Animal] = [
    
]
```

`static` ਦਾ ਅਰਥ ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ ਹੈ।

ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ ਟਾਈਪ ਨਾਲ ਸੰਬੰਧਿਤ ਹੁੰਦੀ ਹੈ, ਕਿਸੇ ਇੱਕ ਖਾਸ ਇੰਸਟੈਂਸ ਨਾਲ ਨਹੀਂ।

ਇਹ ਵਾਕ ਕੁਝ ਅਬਸਟਰੈਕਟ ਲੱਗ ਸਕਦਾ ਹੈ। ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਉਦਾਹਰਨ ਰਾਹੀਂ ਸਮਝ ਸਕਦੇ ਹਾਂ।

## ਆਮ ਪ੍ਰਾਪਰਟੀ ਅਤੇ ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ

ਉਦਾਹਰਨ ਲਈ, ਅਸੀਂ ਇੱਕ `Student` ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੇ ਹਾਂ:

```swift
struct Student {
    let name: String
}
```

ਇੱਥੇ `name` ਇੱਕ ਆਮ ਪ੍ਰਾਪਰਟੀ ਹੈ। ਆਮ ਪ੍ਰਾਪਰਟੀ ਕਿਸੇ ਇੱਕ ਖਾਸ ਇੰਸਟੈਂਸ ਨਾਲ ਸੰਬੰਧਿਤ ਹੁੰਦੀ ਹੈ।

ਜੇ ਅਸੀਂ `name` ਤੱਕ ਪਹੁੰਚਣਾ ਚਾਹੀਏ, ਤਾਂ ਪਹਿਲਾਂ ਇੱਕ ਖਾਸ ਵਿਦਿਆਰਥੀ ਬਣਾਉਣਾ ਪਵੇਗਾ:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

ਇੱਥੇ `student` ਇੱਕ ਇੰਸਟੈਂਸ ਹੈ। ਇਸਨੂੰ ਪਹਿਲਾਂ ਇੱਕ ਖਾਸ ਵਿਦਿਆਰਥੀ ਡਾਟਾ ਵਜੋਂ ਵੀ ਸਮਝ ਸਕਦੇ ਹਾਂ।

ਕਿਉਂਕਿ ਹਰ ਵਿਦਿਆਰਥੀ ਦਾ ਨਾਮ ਵੱਖ ਹੋ ਸਕਦਾ ਹੈ, ਇਸ ਲਈ `name` ਨੂੰ ਖਾਸ ਵਿਦਿਆਰਥੀ ਦੇ ਅੰਦਰ ਰੱਖਣਾ ਲਾਜ਼ਮੀ ਹੈ।

ਪਰ, ਕੁਝ ਡਾਟਾ ਕਿਸੇ ਇੱਕ ਖਾਸ ਇੰਸਟੈਂਸ ਨਾਲ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੁੰਦਾ।

ਉਦਾਹਰਨ ਲਈ, ਅਸੀਂ ਪ੍ਰੀਵਿਊ ਲਈ ਉਦਾਹਰਨ ਡਾਟਾ ਦਾ ਇੱਕ ਸਮੂਹ ਤਿਆਰ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹਾਂ:

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

ਇੱਥੇ `previewStudents` ਤੋਂ ਪਹਿਲਾਂ `static` ਹੈ, ਇਸ ਲਈ ਇਹ ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ ਹੈ।

ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ ਕਿਸੇ ਇੱਕ ਵਿਦਿਆਰਥੀ ਨਾਲ ਸੰਬੰਧਿਤ ਨਹੀਂ, ਸਗੋਂ `Student` ਟਾਈਪ ਨਾਲ ਹੀ ਸੰਬੰਧਿਤ ਹੈ।

ਇਸ ਲਈ, ਸਾਨੂੰ ਪਹਿਲਾਂ ਕੋਈ ਵਿਦਿਆਰਥੀ ਬਣਾਉਣ ਦੀ ਲੋੜ ਨਹੀਂ। ਅਸੀਂ ਸਿੱਧਾ ਟਾਈਪ ਦੇ ਨਾਮ ਰਾਹੀਂ ਇਸ ਤੱਕ ਪਹੁੰਚ ਸਕਦੇ ਹਾਂ:

```swift
print(Student.previewStudents.count)    // 3
```

ਇੱਥੇ ਪਹੁੰਚਣ ਦਾ ਢੰਗ ਹੈ:

```swift
ਟਾਈਪ ਨਾਮ.ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ ਨਾਮ
```

ਅਰਥਾਤ:

```swift
Student.previewStudents
```

ਇਸੇ ਤਰ੍ਹਾਂ, ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਵਿੱਚ, ਅਸੀਂ ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਤੱਕ ਇਸ ਤਰ੍ਹਾਂ ਪਹੁੰਚ ਸਕਦੇ ਹਾਂ:

```swift
Animal.animals
```

## ContentView ਵੱਲ ਵਾਪਸ ਆਉਣਾ

ਹੁਣ, ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਪਹਿਲਾਂ ਹੀ `Animal` ਟਾਈਪ ਵਿੱਚ ਸੰਭਾਲਿਆ ਗਿਆ ਹੈ।

ਇਸ ਲਈ `ContentView` ਦੇ ਅੰਦਰ ਹੁਣ ਲੰਮਾ ਜਾਨਵਰ ਐਰੇ ਲਿਖਣ ਦੀ ਲੋੜ ਨਹੀਂ।

ਅਸੀਂ ਇਸਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਬਦਲ ਸਕਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // ਜਾਨਵਰਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ਇਹ ਕੋਡ ਲਾਈਨ ਦਰਸਾਉਂਦੀ ਹੈ:

```swift
let animals = Animal.animals
```

`Animal` ਟਾਈਪ ਤੋਂ `animals` ਜਾਨਵਰ ਡਾਟਾ ਦਾ ਇਹ ਸਮੂਹ ਕੱਢੋ, ਫਿਰ ਇਸਨੂੰ ਮੌਜੂਦਾ ਵਿਊ ਦੇ `animals` ਕਾਂਸਟੈਂਟ ਵਿੱਚ ਸੰਭਾਲੋ।

ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਣ ਤੋਂ ਬਾਅਦ, `ContentView` ਹੋਰ ਸੰਖੇਪ ਹੋ ਜਾਵੇਗਾ।

`ContentView` ਇੰਟਰਫੇਸ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ, ਅਤੇ `Animal.animals` ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

## Animal ਨੂੰ ਵੱਖਰੀ ਫਾਇਲ ਵਿੱਚ ਰੱਖਣਾ

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ, ਉਦਾਹਰਨ ਨੂੰ ਸਮਝਣਾ ਆਸਾਨ ਬਣਾਉਣ ਲਈ, ਅਸੀਂ `Animal` ਅਤੇ `ContentView` ਨੂੰ ਇੱਕੋ ਫਾਇਲ ਵਿੱਚ ਲਿਖਿਆ ਸੀ।

ਕਿਉਂਕਿ ਉਸ ਵੇਲੇ ਕੋਡ ਘੱਟ ਸੀ, ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਣ ਵਿੱਚ ਕੋਈ ਸਮੱਸਿਆ ਨਹੀਂ ਸੀ।

ਪਰ ਹੁਣ ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਵੱਧਦਾ ਜਾ ਰਿਹਾ ਹੈ। ਜੇ ਸਾਰੇ ਕੋਡ ਨੂੰ ਅਜੇ ਵੀ `ContentView.swift` ਦੇ ਅੰਦਰ ਲਿਖਿਆ ਜਾਵੇ, ਤਾਂ ਫਾਇਲ ਬਹੁਤ ਲੰਬੀ ਹੋ ਜਾਵੇਗੀ ਅਤੇ ਪੜ੍ਹਨ ਵਿੱਚ ਵੀ ਅਸੁਵਿਧਾਜਨਕ ਹੋਵੇਗੀ।

ਇਸ ਲਈ, ਅਸੀਂ `Animal` ਨੂੰ ਵੱਖਰੇ ਨਵੇਂ Swift ਫਾਇਲ ਵਿੱਚ ਰੱਖ ਸਕਦੇ ਹਾਂ।

Xcode ਵਿੱਚ, ਇੱਕ ਨਵੀਂ Swift ਫਾਇਲ ਬਣਾਈ ਜਾ ਸਕਦੀ ਹੈ, ਉਦਾਹਰਨ ਲਈ:

```swift
Animal.swift
```

ਫਿਰ `Animal` ਸਟਰਕਟ ਨੂੰ ਇਸ ਫਾਇਲ ਵਿੱਚ ਮੂਵ ਕਰੋ:

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

ਇਸ ਤਰ੍ਹਾਂ ਸੰਗਠਿਤ ਕਰਨ ਤੋਂ ਬਾਅਦ:

`ContentView.swift` ਇੰਟਰਫੇਸ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

`Animal.swift` ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਦੀ ਬਣਤਰ ਦਾ ਵੇਰਵਾ ਦੇਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

ਭਾਵੇਂ ਇਹ ਵੱਖ-ਵੱਖ ਫਾਇਲਾਂ ਵਿੱਚ ਰੱਖੇ ਗਏ ਹਨ, ਪਰ ਜੇ ਉਹ ਇੱਕੋ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਹਨ, ਤਾਂ `ContentView` ਅਜੇ ਵੀ ਸਿੱਧਾ `Animal` ਦੀ ਵਰਤੋਂ ਕਰ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let animals = Animal.animals
```

ਇੱਥੇ `ContentView.swift` ਵਿੱਚ ਵੱਖਰੇ ਤੌਰ 'ਤੇ `Animal.swift` ਨੂੰ ਇੰਪੋਰਟ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ।

Swift ਇੱਕੋ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਮੌਜੂਦ Swift ਫਾਇਲਾਂ ਨੂੰ ਆਪਣੇ ਆਪ ਪਛਾਣ ਲੈਂਦਾ ਹੈ।

## extension ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੋਡ ਨੂੰ ਹੋਰ ਸੰਗਠਿਤ ਕਰਨਾ

ਹੁਣ, ਅਸੀਂ ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਨੂੰ `ContentView` ਤੋਂ ਮੂਵ ਕਰਕੇ `Animal` ਦੇ ਅੰਦਰ ਰੱਖ ਦਿੱਤਾ ਹੈ।

ਪਰ, `Animal` ਸਟਰਕਟ ਵਿੱਚ ਅਜੇ ਵੀ ਦੋ ਕਿਸਮਾਂ ਦਾ ਕੋਡ ਇਕੱਠੇ ਸ਼ਾਮਲ ਹੈ:

ਪਹਿਲੀ ਕਿਸਮ ਜਾਨਵਰ ਮਾਡਲ ਦੀਆਂ ਆਪਣੀਆਂ ਪ੍ਰਾਪਰਟੀਆਂ ਹਨ:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

ਦੂਜੀ ਕਿਸਮ ਸਥਿਰ ਜਾਨਵਰ ਡਾਟਾ ਹੈ:

```swift
static let animals: [Animal] = [
    // ...
]
```

ਕੋਡ ਦੀ ਬਣਤਰ ਨੂੰ ਹੋਰ ਸਪਸ਼ਟ ਬਣਾਉਣ ਲਈ, ਅਸੀਂ `extension` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇਨ੍ਹਾਂ ਦੋ ਭਾਗਾਂ ਨੂੰ ਵੱਖ ਕਰ ਸਕਦੇ ਹਾਂ।

`extension` ਦਾ ਅਰਥ ਵਿਸਥਾਰ ਹੈ।

ਇਹ ਮੌਜੂਦਾ ਟਾਈਪ ਦੇ ਆਧਾਰ 'ਤੇ ਨਵਾਂ ਕੋਡ ਜੋੜ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
extension Animal {
    
}
```

ਇਹ ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ ਅਸੀਂ `Animal` ਟਾਈਪ ਦਾ ਵਿਸਥਾਰ ਕਰ ਰਹੇ ਹਾਂ।

## ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਨੂੰ extension ਵਿੱਚ ਰੱਖਣਾ

ਅਸੀਂ `Animal` ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਬਦਲ ਸਕਦੇ ਹਾਂ:

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

ਇਸ ਤਰ੍ਹਾਂ ਸੰਗਠਿਤ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਕੋਡ ਦੀ ਬਣਤਰ ਹੋਰ ਸਪਸ਼ਟ ਹੋ ਜਾਵੇਗੀ।

`struct Animal` ਇਹ ਵੇਰਵਾ ਦੇਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ ਕਿ ਇੱਕ ਜਾਨਵਰ ਵਿੱਚ ਕਿਹੜੀਆਂ ਪ੍ਰਾਪਰਟੀਆਂ ਹੋਣੀਆਂ ਚਾਹੀਦੀਆਂ ਹਨ।

`extension Animal` ਸਥਿਰ ਜਾਨਵਰ ਡਾਟਾ ਦਾ ਇੱਕ ਸਮੂਹ ਸੰਭਾਲਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

ਧਿਆਨ ਦਿਓ, ਭਾਵੇਂ `animals` ਨੂੰ `extension Animal` ਵਿੱਚ ਮੂਵ ਕਰ ਦਿੱਤਾ ਗਿਆ ਹੈ, ਇਸਦੀ ਵਰਤੋਂ ਦਾ ਢੰਗ ਨਹੀਂ ਬਦਲਦਾ।

ਅਸੀਂ ਅਜੇ ਵੀ ਇਸ ਤਰ੍ਹਾਂ ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
let animals = Animal.animals
```

ਇਹ `extension` ਦੀ ਇੱਕ ਵਿਸ਼ੇਸ਼ਤਾ ਵੀ ਹੈ: ਇਹ ਸਿਰਫ਼ ਕੋਡ ਨੂੰ ਸੰਗਠਿਤ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ, ਬਾਹਰੀ ਕਾਲ ਕਰਨ ਦਾ ਢੰਗ ਨਹੀਂ ਬਦਲਦਾ।

## ਜਦੋਂ ਡਾਟਾ ਵੱਧ ਹੋਵੇ, ਤਾਂ ਨਵੀਂ AnimalData ਫਾਇਲ ਵੀ ਬਣਾਈ ਜਾ ਸਕਦੀ ਹੈ

ਹੁਣ, ਅਸੀਂ `Animal` ਨੂੰ ਵੱਖਰੀ `Animal.swift` ਫਾਇਲ ਵਿੱਚ ਰੱਖ ਦਿੱਤਾ ਹੈ।

ਜੇ ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਘੱਟ ਹੈ, ਤਾਂ `extension Animal` ਨੂੰ ਸਿੱਧਾ `Animal.swift` ਵਿੱਚ ਵੀ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਪਰ, ਜੇ ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਹੋਰ ਵੱਧਦਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਇੱਕ ਹੋਰ ਨਵੀਂ ਫਾਇਲ ਵੀ ਬਣਾਈ ਜਾ ਸਕਦੀ ਹੈ, ਉਦਾਹਰਨ ਲਈ:

```swift
AnimalData.swift
```

ਫਿਰ ਸਥਿਰ ਜਾਨਵਰ ਡਾਟਾ ਇਸ ਵਿੱਚ ਰੱਖੋ:

```swift
extension Animal {
    static let animals: [Animal] = [
        // ਜਾਨਵਰ ਡਾਟਾ
    ]
}
```

ਇਸ ਤਰ੍ਹਾਂ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਕੋਡ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਵੰਡ ਹੋਰ ਸਪਸ਼ਟ ਹੋ ਜਾਵੇਗੀ:

`Animal.swift` ਸਿਰਫ਼ ਜਾਨਵਰ ਮਾਡਲ ਪਰਿਭਾਸ਼ਿਤ ਕਰਨ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

`AnimalData.swift` ਸਿਰਫ਼ ਜਾਨਵਰ ਡਾਟਾ ਸੰਭਾਲਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

`ContentView.swift` ਸਿਰਫ਼ ਇੰਟਰਫੇਸ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

ਹਰ ਫਾਇਲ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਹੋਰ ਸਪਸ਼ਟ ਹੋ ਜਾਂਦੀ ਹੈ।

ਧਿਆਨ ਦਿਓ, `AnimalData.swift` ਸਿਰਫ਼ ਫਾਇਲ ਦਾ ਨਾਮ ਹੈ, ਕੋਈ ਨਵਾਂ Swift ਟਾਈਪ ਨਹੀਂ। ਇਸ ਫਾਇਲ ਵਿੱਚ ਅਜੇ ਵੀ `extension Animal` ਰਾਹੀਂ `Animal` ਵਿੱਚ ਸਥਿਰ ਡਾਟਾ ਜੋੜਿਆ ਜਾ ਰਿਹਾ ਹੈ।

## ਪੂਰਾ ਕੋਡ

ਹੇਠਾਂ ਸੰਗਠਿਤ ਕੀਤੇ `Animal.swift` ਦਾ ਕੋਡ ਹੈ:

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

ਸੰਗਠਿਤ ਕੀਤੇ `AnimalData.swift` ਦਾ ਕੋਡ:

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

`ContentView.swift` ਵਿੱਚ, ਇਸ ਤਰ੍ਹਾਂ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ:

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

ਸੁਝਾਅ: `Animal.swift` ਅਤੇ `AnimalData.swift` ਫਾਇਲਾਂ ਵਿੱਚ, ਪਹਿਲੀ ਲਾਈਨ ਇਹ ਲਿਖੀ ਗਈ ਹੈ:

```swift
import Foundation
```

ਪਹਿਲਾਂ ਜਦੋਂ ਅਸੀਂ SwiftUI ਇੰਟਰਫੇਸ ਲਿਖਦੇ ਸੀ, ਅਕਸਰ ਇਹ ਵਰਤਦੇ ਸੀ:

```swift
import SwiftUI
```

ਇਹ ਇਸ ਲਈ ਹੈ ਕਿਉਂਕਿ `ContentView`, `Text`, `Button`, `Color` ਆਦਿ ਸਮੱਗਰੀ ਇੰਟਰਫੇਸ ਨਾਲ ਸੰਬੰਧਿਤ ਹੈ, ਇਸ ਲਈ ਇੰਟਰਫੇਸ ਫਾਇਲ ਲਿਖਣ ਸਮੇਂ ਆਮ ਤੌਰ 'ਤੇ SwiftUI ਇੰਪੋਰਟ ਕਰਨ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

ਪਰ ਇੱਥੇ `Animal.swift` ਅਤੇ `AnimalData.swift` ਦੋਵੇਂ ਇੰਟਰਫੇਸ ਫਾਇਲਾਂ ਨਹੀਂ ਹਨ। ਉਹ ਮੁੱਖ ਤੌਰ 'ਤੇ ਜਾਨਵਰ ਮਾਡਲ ਪਰਿਭਾਸ਼ਿਤ ਕਰਨ ਅਤੇ ਜਾਨਵਰ ਡਾਟਾ ਸੰਭਾਲਣ ਲਈ ਵਰਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।

ਇਸ ਕੋਡ ਵਿੱਚ, `UUID()` ਨੂੰ `Foundation` ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ, ਇਸ ਲਈ `Foundation` ਇੰਪੋਰਟ ਕਰਨਾ ਕਾਫ਼ੀ ਹੈ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਮੁੱਖ ਤੌਰ 'ਤੇ ਇੱਕ ਕੰਮ ਕੀਤਾ: ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਨੂੰ `ContentView` ਤੋਂ ਬਾਹਰ ਸੰਗਠਿਤ ਕੀਤਾ।

ਪੁਰਾਣੇ ਲਿਖਣ ਦੇ ਢੰਗ ਵਿੱਚ ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਸਿੱਧਾ `ContentView` ਵਿੱਚ ਲਿਖਿਆ ਗਿਆ ਸੀ। ਇਸ ਤਰ੍ਹਾਂ ਕੋਡ ਚੱਲ ਸਕਦਾ ਹੈ, ਪਰ ਜਦੋਂ ਡਾਟਾ ਵੱਧਦਾ ਹੈ, ਵਿਊ ਫਾਇਲ ਹੋਰ ਲੰਬੀ ਹੁੰਦੀ ਜਾਂਦੀ ਹੈ।

ਸੰਗਠਿਤ ਕਰਨ ਤੋਂ ਬਾਅਦ, `ContentView` ਸਿਰਫ਼ ਇੰਟਰਫੇਸ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ, ਅਤੇ `Animal.animals` ਜਾਨਵਰਾਂ ਦਾ ਡਾਟਾ ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

ਇਸ ਪਾਠ ਵਿੱਚ ਦੋ ਨਵੇਂ ਗਿਆਨ ਬਿੰਦੂ ਵੀ ਸਿੱਖੇ।

ਪਹਿਲਾ `static` ਹੈ।

`static` ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ ਦਰਸਾਉਂਦਾ ਹੈ। ਸਥਿਰ ਪ੍ਰਾਪਰਟੀ ਟਾਈਪ ਨਾਲ ਹੀ ਸੰਬੰਧਿਤ ਹੁੰਦੀ ਹੈ ਅਤੇ “ਟਾਈਪ ਨਾਮ.ਪ੍ਰਾਪਰਟੀ ਨਾਮ” ਦੇ ਢੰਗ ਨਾਲ ਸਿੱਧੀ ਪਹੁੰਚੀ ਜਾ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Animal.animals
```

ਦੂਜਾ `extension` ਹੈ।

`extension` ਵਿਸਥਾਰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ ਇੱਕੋ ਟਾਈਪ ਦੇ ਕੋਡ ਨੂੰ ਵੱਖ-ਵੱਖ ਥਾਵਾਂ 'ਤੇ ਲਿਖਣ ਦੀ ਇਜਾਜ਼ਤ ਦਿੰਦਾ ਹੈ, ਤਾਂ ਜੋ ਕੋਡ ਦੀ ਬਣਤਰ ਹੋਰ ਸਪਸ਼ਟ ਹੋਵੇ।

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, ਅਸੀਂ ਜਾਨਵਰਾਂ ਦੇ ਡਾਟਾ ਨੂੰ ਸੰਭਾਲਣ ਲਈ `extension Animal` ਦੀ ਵਰਤੋਂ ਕੀਤੀ, ਜਿਸ ਨਾਲ `Animal` ਸਟਰਕਟ ਆਪਣੇ ਆਪ ਵਿੱਚ ਹੋਰ ਸੰਖੇਪ ਬਣ ਗਿਆ।

ਇਸ ਤੋਂ ਇਲਾਵਾ, `Animal` ਮੁੱਖ ਤੌਰ 'ਤੇ ਡਾਟਾ ਮਾਡਲ ਸੰਭਾਲਦਾ ਹੈ ਅਤੇ ਸਿੱਧਾ SwiftUI ਇੰਟਰਫੇਸ ਨਹੀਂ ਲਿਖਦਾ, ਇਸ ਲਈ ਇੱਥੇ `import Foundation` ਵਰਤਿਆ ਗਿਆ ਹੈ।

ਇਸ ਪਾਠ ਦਾ ਮੁੱਖ ਬਿੰਦੂ ਕੋਡ ਨੂੰ ਹੋਰ ਜਟਿਲ ਬਣਾਉਣਾ ਨਹੀਂ, ਸਗੋਂ ਕੋਡ ਨੂੰ ਹੋਰ ਪੜ੍ਹਨਯੋਗ ਅਤੇ ਸੰਭਾਲਣਯੋਗ ਬਣਾਉਣਾ ਹੈ।
