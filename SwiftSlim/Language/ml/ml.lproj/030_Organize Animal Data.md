# മൃഗങ്ങളുടെ ഡാറ്റ ക്രമീകരിക്കുക

മുൻ പാഠത്തിൽ, നാം ഒരു ലളിതമായ മൃഗ വിജ്ഞാനകോശ കേസ് പൂർത്തിയാക്കി.

![view](../../../Resource/029_view.png)

ഉപയോക്താവ് ഒരു മൃഗത്തിൽ ടാപ്പ് ചെയ്യുമ്പോൾ, പേജ് `Sheet` വഴി മൃഗത്തിന്റെ വിശദാംശങ്ങൾ പോപ്പ് അപ്പ് ചെയ്യും.

എങ്കിലും, മുൻ പാഠത്തിലെ കോഡിൽ ഒരു പ്രശ്നമുണ്ട്: മൃഗ ഡാറ്റ നേരിട്ട് `ContentView`-ന്റെ ഉള്ളിൽ എഴുതിയിരിക്കുന്നു.

ഉദാഹരണത്തിന്:

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
            // മൃഗങ്ങളുടെ പട്ടിക കാണിക്കുക
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ഈ കോഡ് സാധാരണയായി പ്രവർത്തിക്കും, പക്ഷേ മൃഗ ഡാറ്റ കൂടിക്കൂടുമ്പോൾ, `ContentView` വളരെ നീളമുള്ളതാകും.

`ContentView` ആദ്യം പ്രധാനമായും ഇന്റർഫേസ് കാണിക്കാൻ വേണ്ടിയുള്ളതായിരിക്കണം, എന്നാൽ ഇപ്പോൾ അത് വലിയ അളവിൽ മൃഗ ഡാറ്റയും സൂക്ഷിക്കുന്നു. ഇത് കോഡ് വായനയെ ബാധിക്കും, പിന്നീട് പരിപാലിക്കാനും സൗകര്യമല്ല.

അതിനാൽ, ഈ പാഠത്തിൽ നാം ഒരു കാര്യം ചെയ്യുകയാണ്:

മൃഗ ഡാറ്റയെ `ContentView`-ൽ നിന്ന് വേർതിരിച്ച് ക്രമീകരിക്കുക.

## ഡാറ്റ വേർതിരിക്കേണ്ടത് എന്തിന്?

SwiftUI-യിൽ, view കോഡ് സാധാരണയായി ഇന്റർഫേസ് കാണിക്കുന്നതിനാണ് ഉത്തരവാദി.

ഉദാഹരണത്തിന്:

```swift
Text("Dolphin")
Image("dolphin")
```

ഈ കോഡുകൾ എല്ലാം ഇന്റർഫേസ് പ്രദർശനവുമായി ബന്ധപ്പെട്ടിരിക്കുന്നു.

പക്ഷേ മൃഗ ഡാറ്റ തന്നെ, ഉദാഹരണത്തിന് മൃഗത്തിന്റെ പേര്, ചിത്രത്തിന്റെ പേര്, വിതരണ പ്രദേശം, ആവാസവ്യവസ്ഥ, വിവരണ വാചകം എന്നിവ ഇന്റർഫേസ് ഘടനയല്ല.

അവ ഒരു കൂട്ടം സ്ഥിരമായ വിവരങ്ങളോട് കൂടുതൽ സാമ്യമുള്ളതാണ്:

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

ഇന്റർഫേസ് കോഡും ഡാറ്റ കോഡും എല്ലാം ഒന്നിച്ച് എഴുതിയാൽ, കോഡ് കൂടുതൽ കൂടുതൽ കുഴപ്പമാകും.

അതിനാൽ, നമുക്ക് മൃഗ ഡാറ്റ `Animal` ടൈപ്പിൽ വയ്ക്കാം.

## സ്ഥിര ഡാറ്റ സൂക്ഷിക്കാൻ static ഉപയോഗിക്കുക

ആദ്യം ക്രമീകരിച്ച ശേഷമുള്ള എഴുത്ത് നോക്കാം:

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

ഇവിടെ ഒരു പുതിയ കോഡ് വരി ചേർത്തിട്ടുണ്ട്:

```swift
static let animals: [Animal] = [

]
```

`static` എന്നത് static property എന്നർത്ഥമാണ്.

Static property ഒരു നിർദിഷ്ട instance-നല്ല, type-ിനുതന്നെയാണ് പെട്ടത്.

ഈ വാക്ക് അല്പം അബ്സ്ട്രാക്റ്റ് ആകാം, ഒരു ലളിതമായ ഉദാഹരണത്തിലൂടെ മനസ്സിലാക്കാം.

## സാധാരണ propertyയും static propertyയും

ഉദാഹരണത്തിന്, നാം ഒരു `Student` നിർവചിക്കുന്നു:

```swift
struct Student {
    let name: String
}
```

ഇവിടെയുള്ള `name` ഒരു സാധാരണ property ആണ്. സാധാരണ property ഒരു നിർദിഷ്ട instance-നാണ് പെട്ടത്.

നമുക്ക് `name` ആക്‌സസ് ചെയ്യണമെങ്കിൽ, ആദ്യം ഒരു നിർദിഷ്ട വിദ്യാർത്ഥിയെ സൃഷ്ടിക്കണം:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

ഇവിടെയുള്ള `student` ഒരു instance ആണ്. താൽക്കാലികമായി ഇതിനെ ഒരു നിർദിഷ്ട വിദ്യാർത്ഥി ഡാറ്റയായി മനസ്സിലാക്കാം.

ഓരോ വിദ്യാർത്ഥിയുടെയും പേര് വ്യത്യസ്തമായിരിക്കാം, അതുകൊണ്ട് `name` നിർദിഷ്ട വിദ്യാർത്ഥിയിൽ തന്നെയിരിക്കണം.

പക്ഷേ ചില ഡാറ്റ ഒരു നിർദിഷ്ട instance-നോട് പെട്ടതല്ല.

ഉദാഹരണത്തിന്, preview ചെയ്യാവുന്ന ഒരു കൂട്ടം sample data തയ്യാറാക്കണമെന്ന് കരുതുക:

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

ഇവിടെ `previewStudents`-ന്റെ മുമ്പിൽ `static` ഉണ്ട്, അതിനാൽ അത് static property ആണ്.

Static property ഒരു പ്രത്യേക വിദ്യാർത്ഥിയുടേതല്ല, `Student` എന്ന type-ിനുതന്നെയാണ് പെട്ടത്.

അതിനാൽ, ആദ്യം ഒരു വിദ്യാർത്ഥിയെ സൃഷ്ടിക്കാതെ തന്നെ type name വഴി നേരിട്ട് ആക്‌സസ് ചെയ്യാം:

```swift
print(Student.previewStudents.count)    // 3
```

ഇവിടെയുള്ള ആക്‌സസ് രീതി ഇതാണ്:

```swift
ടൈപ്പ് പേര്.static property പേര്
```

അതായത്:

```swift
Student.previewStudents
```

അതുപോലെ തന്നെ, മൃഗ വിജ്ഞാനകോശത്തിൽ നമുക്ക് മൃഗ ഡാറ്റ ഇങ്ങനെ ആക്‌സസ് ചെയ്യാം:

```swift
Animal.animals
```

## ContentView-ലേക്ക് മടങ്ങുക

ഇപ്പോൾ, മൃഗ ഡാറ്റ ഇതിനകം `Animal` type-ൽ സൂക്ഷിച്ചിരിക്കുന്നു.

അതിനാൽ `ContentView`-ന്റെ ഉള്ളിൽ വളരെ നീളമുള്ള മൃഗ array ഇനി എഴുതേണ്ടതില്ല.

നമുക്ക് ഇങ്ങനെ മാറ്റാം:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil

    let animals = Animal.animals

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // മൃഗങ്ങളുടെ പട്ടിക കാണിക്കുക
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ഈ കോഡ് വരി സൂചിപ്പിക്കുന്നത്:

```swift
let animals = Animal.animals
```

`Animal` type-ൽ നിന്ന് `animals` എന്ന മൃഗ ഡാറ്റയുടെ കൂട്ടം എടുത്ത്, അത് നിലവിലെ view-യുടെ `animals` constant-ൽ സൂക്ഷിക്കുന്നു.

ഇങ്ങനെ എഴുതിയാൽ, `ContentView` കൂടുതൽ ലളിതമാകും.

`ContentView` ഇന്റർഫേസ് കാണിക്കുന്നതിനാണ് ഉത്തരവാദി, `Animal.animals` മൃഗ ഡാറ്റ നൽകുന്നതിനാണ് ഉത്തരവാദി.

## Animal-നെ ഒരു പ്രത്യേക ഫയലിലേക്കു വേർതിരിക്കുക

മുൻ പാഠത്തിൽ, കേസ് കൂടുതൽ എളുപ്പത്തിൽ മനസ്സിലാക്കാൻ, നാം `Animal`-യും `ContentView`-യും ഒരേ ഫയലിൽ എഴുതി.

അപ്പോൾ കോഡ് കുറവായിരുന്നതിനാൽ, ഇങ്ങനെ എഴുതുന്നതിൽ പ്രശ്നമില്ലായിരുന്നു.

പക്ഷേ ഇപ്പോൾ മൃഗ ഡാറ്റ കൂടിക്കൂടുന്നു. എല്ലാ കോഡും തുടർന്നും `ContentView.swift`-ൽ എഴുതിയാൽ, ഫയൽ വളരെ നീളമുള്ളതാകും, വായിക്കാനും സൗകര്യമല്ല.

അതിനാൽ, നമുക്ക് `Animal`-നെ ഒരു പുതിയ Swift ഫയലിൽ വേർതിരിച്ച് വയ്ക്കാം.

Xcode-ൽ, ഒരു പുതിയ Swift ഫയൽ സൃഷ്ടിക്കാം, ഉദാഹരണത്തിന്:

```swift
Animal.swift
```

ശേഷം `Animal` struct ഈ ഫയലിലേക്ക് മാറ്റുക:

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

ഇങ്ങനെ ക്രമീകരിച്ച ശേഷം:

`ContentView.swift` ഇന്റർഫേസ് കാണിക്കുന്നതിനാണ് ഉത്തരവാദി.

`Animal.swift` മൃഗ ഡാറ്റയുടെ ഘടന വിവരിക്കുന്നതിനാണ് ഉത്തരവാദി.

അവ വ്യത്യസ്ത ഫയലുകളിൽ ഉള്ളതായാലും, അവ ഒരേ project-ിനുള്ളിൽ ആയാൽ, `ContentView` ഇപ്പോഴും `Animal` നേരിട്ട് ഉപയോഗിക്കാം.

ഉദാഹരണത്തിന്:

```swift
let animals = Animal.animals
```

ഇവിടെ `ContentView.swift`-ൽ അധികമായി `Animal.swift` import ചെയ്യേണ്ടതില്ല.

Swift ഒരേ project-ിലുള്ള Swift ഫയലുകൾ സ്വയം തിരിച്ചറിയും.

## കോഡ് തുടർന്നും ക്രമീകരിക്കാൻ extension ഉപയോഗിക്കുക

ഇപ്പോൾ, നാം മൃഗ ഡാറ്റയെ `ContentView`-ൽ നിന്ന് `Animal`-ന്റെ ഉള്ളിലേക്ക് മാറ്റിയിട്ടുണ്ട്.

എങ്കിലും, `Animal` struct-ൽ ഇപ്പോഴും രണ്ട് തരത്തിലുള്ള കോഡ് ഒരുമിച്ചുണ്ട്:

ഒന്നാമത്തെ വിഭാഗം മൃഗ model-ന്റെ സ്വന്തം properties ആണ്:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

രണ്ടാമത്തെ വിഭാഗം സ്ഥിരമായ മൃഗ ഡാറ്റയാണ്:

```swift
static let animals: [Animal] = [
    // ...
]
```

കോഡ് ഘടന കൂടുതൽ വ്യക്തമായിരിക്കാനായി, നമുക്ക് `extension` ഉപയോഗിച്ച് ഈ രണ്ട് ഭാഗങ്ങളും വേർതിരിക്കാം.

`extension` എന്നത് വിപുലീകരണം എന്നർത്ഥമാണ്.

ഇത് നിലവിലുള്ള type-ന്റെ അടിസ്ഥാനത്തിൽ പുതിയ കോഡ് തുടർന്നു ചേർക്കാൻ കഴിയും.

ഉദാഹരണത്തിന്:

```swift
extension Animal {

}
```

ഇത് നാം `Animal` എന്ന type വിപുലീകരിക്കുകയാണെന്ന് സൂചിപ്പിക്കുന്നു.

## മൃഗ ഡാറ്റ extension-ൽ വയ്ക്കുക

നമുക്ക് `Animal` ഇങ്ങനെ മാറ്റാം:

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

ഇങ്ങനെ ക്രമീകരിച്ചാൽ, കോഡ് ഘടന കൂടുതൽ വ്യക്തമായിരിക്കും.

`struct Animal` ഒരു മൃഗത്തിന് എന്തെല്ലാം properties വേണമെന്നത് വിവരിക്കുന്നതിനാണ് ഉത്തരവാദി.

`extension Animal` ഒരു കൂട്ടം സ്ഥിരമായ മൃഗ ഡാറ്റ സൂക്ഷിക്കുന്നതിനാണ് ഉത്തരവാദി.

ശ്രദ്ധിക്കുക, `animals` `extension Animal`-ലേക്ക് മാറ്റിയാലും ഉപയോഗിക്കുന്ന രീതി മാറുന്നില്ല.

നമുക്ക് ഇപ്പോഴും ഇങ്ങനെ ഉപയോഗിക്കാം:

```swift
let animals = Animal.animals
```

ഇതും `extension`-ന്റെ ഒരു പ്രത്യേകതയാണ്: ഇത് കോഡ് ക്രമീകരിക്കാൻ മാത്രം സഹായിക്കുന്നു, പുറത്തുനിന്നുള്ള calling രീതിയെ മാറ്റുന്നില്ല.

## ഡാറ്റ കൂടുതലായാൽ, AnimalData ഫയൽ വീണ്ടും സൃഷ്ടിക്കാം

ഇപ്പോൾ, നാം `Animal`-നെ പ്രത്യേക `Animal.swift` ഫയലിൽ വച്ചിട്ടുണ്ട്.

മൃഗ ഡാറ്റ കുറവാണെങ്കിൽ, `extension Animal` നേരിട്ട് `Animal.swift`-ലും എഴുതാം.

പക്ഷേ മൃഗ ഡാറ്റ കൂടിക്കൂടുന്നുവെങ്കിൽ, മറ്റൊരു ഫയൽ സൃഷ്ടിക്കാം, ഉദാഹരണത്തിന്:

```swift
AnimalData.swift
```

ശേഷം സ്ഥിരമായ മൃഗ ഡാറ്റ അതിൽ വയ്ക്കുക:

```swift
extension Animal {
    static let animals: [Animal] = [
        // മൃഗ ഡാറ്റ
    ]
}
```

ഇങ്ങനെ ചെയ്താൽ, കോഡ് ഉത്തരവാദിത്തങ്ങൾ കൂടുതൽ വ്യക്തമായിരിക്കും:

`Animal.swift` മൃഗ model നിർവചിക്കുന്നതിനേ ഉത്തരവാദിയാകൂ.

`AnimalData.swift` മൃഗ ഡാറ്റ സൂക്ഷിക്കുന്നതിനേ ഉത്തരവാദിയാകൂ.

`ContentView.swift` ഇന്റർഫേസ് കാണിക്കുന്നതിനേ ഉത്തരവാദിയാകൂ.

ഓരോ ഫയലിന്റെയും ഉത്തരവാദിത്തം കൂടുതൽ വ്യക്തമായിരിക്കും.

ശ്രദ്ധിക്കുക, `AnimalData.swift` ഒരു ഫയൽ പേരുമാത്രമാണ്, പുതിയ Swift type അല്ല. ഈ ഫയലിൽ ഇപ്പോഴും `extension Animal` വഴി `Animal`-ന് സ്ഥിരമായ ഡാറ്റ ചേർക്കുകയാണ്.

## പൂർണ്ണ കോഡ്

താഴെ ക്രമീകരിച്ച ശേഷമുള്ള `Animal.swift` കോഡ്:

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

ക്രമീകരിച്ച ശേഷമുള്ള `AnimalData.swift` കോഡ്:

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

`ContentView.swift`-ൽ ഇങ്ങനെ ഉപയോഗിക്കാം:

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

സൂചന: `Animal.swift`യും `AnimalData.swift`യും ഫയലുകളിൽ, ആദ്യ വരിയിൽ രണ്ടിടത്തും ഇത് എഴുതിയിട്ടുണ്ട്:

```swift
import Foundation
```

മുമ്പ് നാം SwiftUI ഇന്റർഫേസ് എഴുതുമ്പോൾ, പലപ്പോഴും ഉപയോഗിച്ചിരുന്നത്:

```swift
import SwiftUI
```

കാരണം `ContentView`, `Text`, `Button`, `Color` എന്നീ ഉള്ളടക്കങ്ങൾ എല്ലാം ഇന്റർഫേസുമായി ബന്ധപ്പെട്ടതാണ്, അതിനാൽ ഇന്റർഫേസ് ഫയൽ എഴുതുമ്പോൾ സാധാരണയായി SwiftUI import ചെയ്യേണ്ടതുണ്ട്.

പക്ഷേ ഇവിടെ `Animal.swift`യും `AnimalData.swift`യും ഇന്റർഫേസ് ഫയലുകളല്ല. അവ പ്രധാനമായും മൃഗ model നിർവചിക്കാനും മൃഗ ഡാറ്റ സൂക്ഷിക്കാനും ഉപയോഗിക്കുന്നു.

ഈ കോഡ് ഭാഗത്തിൽ, `UUID()` ഉപയോഗിക്കാൻ `Foundation` വേണം, അതിനാൽ `Foundation` import ചെയ്താൽ മതി.

## സംഗ്രഹം

ഈ പാഠത്തിൽ നാം പ്രധാനമായും ഒരു കാര്യം ചെയ്തു: മൃഗ ഡാറ്റയെ `ContentView`-ൽ നിന്ന് വേർതിരിച്ച് ക്രമീകരിച്ചു.

മുമ്പത്തെ എഴുത്ത് മൃഗ ഡാറ്റ നേരിട്ട് `ContentView`-ൽ എഴുതുന്നതായിരുന്നു. ഇങ്ങനെ കോഡ് പ്രവർത്തിക്കും, പക്ഷേ ഡാറ്റ കൂടുമ്പോൾ view file കൂടുതൽ കൂടുതൽ നീളമുള്ളതാകും.

ക്രമീകരിച്ചതിനുശേഷം, `ContentView` ഇന്റർഫേസ് കാണിക്കുന്നതിനേ ഉത്തരവാദിയാകൂ, `Animal.animals` മൃഗ ഡാറ്റ നൽകുന്നതിനാണ് ഉത്തരവാദി.

ഈ പാഠത്തിൽ ഇനിയും രണ്ട് പുതിയ അറിവുകൾ പഠിച്ചു.

ആദ്യത്തേത് `static` ആണ്.

`static` static property എന്നർത്ഥമാണ്. Static property type-ിനുതന്നെയാണ് പെട്ടത്, “type name.property name” എന്ന രീതിയിൽ നേരിട്ട് ആക്‌സസ് ചെയ്യാം.

ഉദാഹരണത്തിന്:

```swift
Animal.animals
```

രണ്ടാമത്തേത് `extension` ആണ്.

`extension` വിപുലീകരണം എന്നർത്ഥമാണ്. ഇത് ഒരേ type-ന്റെ കോഡ് വേർതിരിച്ച് എഴുതാൻ സഹായിക്കും, അതിലൂടെ കോഡ് ഘടന കൂടുതൽ വ്യക്തമായിരിക്കും.

ഈ കേസിൽ, നാം മൃഗ ഡാറ്റ സൂക്ഷിക്കാൻ `extension Animal` ഉപയോഗിച്ചു, അതുവഴി `Animal` struct തന്നെ കൂടുതൽ ലളിതമായി.

കൂടാതെ, `Animal` പ്രധാനമായും data model സൂക്ഷിക്കുന്നു, SwiftUI ഇന്റർഫേസ് നേരിട്ട് എഴുതുന്നില്ല, അതിനാൽ ഇവിടെ ഉപയോഗിക്കുന്നത് `import Foundation` ആണ്.

ഈ പാഠത്തിന്റെ പ്രധാന ഉദ്ദേശ്യം കോഡ് കൂടുതൽ സങ്കീർണ്ണമാക്കലല്ല, മറിച്ച് കോഡ് വായിക്കാനും പരിപാലിക്കാനും എളുപ്പമാക്കലാണ്.
