# Organizing Animal Data

In the previous lesson, we completed a simple animal encyclopedia example.

![view](../../../Resource/029_view.png)

When the user taps an animal, the page presents the animal details through a `Sheet`.

However, there is a problem in the code from the previous lesson: the animal data is written directly inside `ContentView`.

For example:

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
            // Display the animal list
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

This code can run normally, but when the amount of animal data increases, `ContentView` will become very long.

`ContentView` should mainly be responsible for displaying the interface, but now it also stores a large amount of animal data. This affects code readability and makes later maintenance less convenient.

Therefore, in this lesson, we will do one thing:

Move the animal data out of `ContentView`.

## Why separate the data?

In SwiftUI, view code is usually responsible for displaying the interface.

For example:

```swift
Text("Dolphin")
Image("dolphin")
```

These pieces of code are all related to interface display.

The animal data itself, such as the animal name, image name, distribution area, habitat, and description text, is not the interface structure.

It is more like a set of fixed information:

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

If interface code and data code are all written together, the code will become more and more messy.

So, we can put the animal data into the `Animal` type.

## Use static to store fixed data

First, let's look at the organized version:

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

A new line of code is added here:

```swift
static let animals: [Animal] = [
    
]
```

`static` means a static property.

A static property belongs to the type itself. It does not belong to a specific instance.

This sentence is relatively abstract, so we can understand it through a simple example.

## Regular properties and static properties

For example, we define a `Student`:

```swift
struct Student {
    let name: String
}
```

Here, `name` is a regular property. A regular property belongs to a specific instance.

If we want to access `name`, we must first create a specific student:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Here, `student` is an instance. For now, you can understand it as one specific piece of student data.

Because each student may have a different name, `name` must be placed on a specific student.

However, some data does not belong to a specific instance.

For example, we want to prepare a group of sample data for previews:

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

Here, `previewStudents` has `static` in front of it, so it is a static property.

A static property does not belong to one student. Instead, it belongs to the `Student` type itself.

Therefore, we do not need to create a student first. We can access it directly through the type name:

```swift
print(Student.previewStudents.count)    // 3
```

The access pattern here is:

```swift
TypeName.staticPropertyName
```

That is:

```swift
Student.previewStudents
```

Similarly, in the animal encyclopedia, we can access the animal data like this:

```swift
Animal.animals
```

## Back to ContentView

Now, the animal data has been saved in the `Animal` type.

So we no longer need to write a very long animal array inside `ContentView`.

We can change it to:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Display the animal list
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

This line of code means:

```swift
let animals = Animal.animals
```

Take the `animals` animal data from the `Animal` type, and then save it into the `animals` constant of the current view.

After writing it this way, `ContentView` becomes more concise.

`ContentView` is responsible for displaying the interface, and `Animal.animals` is responsible for providing the animal data.

## Move Animal into a separate file

In the previous lesson, to make the example easier to understand, we wrote `Animal` and `ContentView` in the same file.

Because the code was still relatively short at that time, this was fine.

But now there is more and more animal data. If we continue putting all the code inside `ContentView.swift`, the file will become very long and harder to read.

So, we can put `Animal` in a new Swift file by itself.

In Xcode, you can create a new Swift file, for example:

```swift
Animal.swift
```

Then move the `Animal` struct into this file:

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

After organizing it this way:

`ContentView.swift` is responsible for displaying the interface.

`Animal.swift` is responsible for describing the structure of the animal data.

Although they are placed in different files, as long as they are in the same project, `ContentView` can still use `Animal` directly.

For example:

```swift
let animals = Animal.animals
```

Here, you do not need to import `Animal.swift` additionally in `ContentView.swift`.

Swift automatically recognizes Swift files in the same project.

## Use extension to continue organizing code

Now, we have moved the animal data from `ContentView` into `Animal`.

However, the `Animal` struct still contains two kinds of code at the same time:

The first kind is the properties of the animal model itself:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

The second kind is the fixed animal data:

```swift
static let animals: [Animal] = [
    // ...
]
```

To make the code structure clearer, we can use `extension` to separate these two parts.

`extension` means extension.

It can continue adding new code based on an existing type.

For example:

```swift
extension Animal {
    
}
```

This means we are extending the `Animal` type.

## Put animal data into an extension

We can change `Animal` to this:

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

After organizing it this way, the code structure becomes clearer.

`struct Animal` is responsible for describing what properties an animal should have.

`extension Animal` is responsible for storing a set of fixed animal data.

Note that although `animals` has been moved into `extension Animal`, the way we use it does not change.

We can still use it like this:

```swift
let animals = Animal.animals
```

This is also one feature of `extension`: it only helps us organize code and does not change the external calling method.

## When there is more data, you can create another AnimalData file

Now, we have put `Animal` into a separate `Animal.swift` file.

If there is not much animal data, you can write `extension Animal` directly in `Animal.swift`.

But if there is more and more animal data, you can also create another file, for example:

```swift
AnimalData.swift
```

Then put the fixed animal data into it:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Animal data
    ]
}
```

After doing this, the code responsibilities become clearer:

`Animal.swift` is only responsible for defining the animal model.

`AnimalData.swift` is only responsible for storing the animal data.

`ContentView.swift` is only responsible for displaying the interface.

The responsibility of each file is clearer.

Note that `AnimalData.swift` is only the file name. It is not a new Swift type. Inside this file, we are still using `extension Animal` to add fixed data to `Animal`.

## Complete code

Below is the organized `Animal.swift` code:

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

The organized `AnimalData.swift` code:

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

In `ContentView.swift`, you can use it like this:

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

Tip: In both the `Animal.swift` and `AnimalData.swift` files, the first line is:

```swift
import Foundation
```

Previously, when writing SwiftUI interfaces, we often used:

```swift
import SwiftUI
```

This is because `ContentView`, `Text`, `Button`, and `Color` are all related to the interface, so when writing interface files, we usually need to import SwiftUI.

But here, `Animal.swift` and `AnimalData.swift` are not interface files. They are mainly used to define the animal model and store animal data.

In this code, `UUID()` needs `Foundation`, so importing `Foundation` is enough.

## Summary

In this lesson, we mainly did one thing: move the animal data out of `ContentView`.

The original approach was to write the animal data directly inside `ContentView`. This code can run, but when the amount of data increases, the view file will become longer and longer.

After organizing it, `ContentView` is only responsible for displaying the interface, and `Animal.animals` is responsible for providing the animal data.

This lesson also introduced two new pieces of knowledge.

The first is `static`.

`static` means a static property. A static property belongs to the type itself and can be accessed directly through “TypeName.propertyName”.

For example:

```swift
Animal.animals
```

The second is `extension`.

`extension` means extension. It can split the code of the same type into different parts, making the code structure clearer.

In this example, we use `extension Animal` to store the animal data, which makes the `Animal` struct itself more concise.

In addition, `Animal` mainly stores a data model and does not directly write a SwiftUI interface, so here we use `import Foundation`.

The focus of this lesson is not to make the code more complicated, but to make the code easier to read and maintain.
