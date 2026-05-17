# Упорядкування даних про тварин

У попередньому уроці ми завершили простий приклад енциклопедії тварин.

![view](../../../Resource/029_view.png)

Коли користувач натискає певну тварину, сторінка відкриває подробиці про тварину через `Sheet`.

Однак у коді попереднього уроку була одна проблема: дані про тварин були записані безпосередньо всередині `ContentView`.

Наприклад:

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
            // Показати список тварин
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Цей код може працювати нормально, але коли даних про тварин ставатиме дедалі більше, `ContentView` стане дуже довгим.

`ContentView` спочатку мав би переважно відповідати за відображення інтерфейсу, але тепер він також зберігає велику кількість даних про тварин. Це ускладнює читання коду й робить подальшу підтримку менш зручною.

Тому в цьому уроці ми зробимо одну річ:

винесемо дані про тварин із `ContentView`.

## Навіщо відокремлювати дані?

У SwiftUI код представлення зазвичай відповідає за відображення інтерфейсу.

Наприклад:

```swift
Text("Dolphin")
Image("dolphin")
```

Увесь цей код пов'язаний з відображенням інтерфейсу.

А самі дані про тварин, наприклад назва тварини, назва зображення, регіон поширення, середовище існування та описовий текст, не є структурою інтерфейсу.

Вони більше схожі на набір фіксованих матеріалів:

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

Якщо записати код інтерфейсу й код даних разом, код ставатиме дедалі хаотичнішим.

Тому ми можемо помістити дані про тварин у тип `Animal`.

## Використання static для збереження фіксованих даних

Спочатку подивімося на впорядкований варіант написання:

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

Тут додано один рядок коду:

```swift
static let animals: [Animal] = [
    
]
```

`static` означає статичну властивість.

Статична властивість належить самому типу, а не певному конкретному екземпляру.

Це речення досить абстрактне, тому ми можемо зрозуміти його через простий приклад.

## Звичайні властивості та статичні властивості

Наприклад, ми визначаємо `Student`:

```swift
struct Student {
    let name: String
}
```

Тут `name` є звичайною властивістю, а звичайна властивість належить певному конкретному екземпляру.

Якщо ми хочемо отримати доступ до `name`, спочатку потрібно створити конкретного студента:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Тут `student` є екземпляром. Спочатку його також можна розуміти як конкретний набір даних про студента.

Оскільки ім'я кожного студента може бути різним, `name` має бути розміщене в конкретного студента.

Але деякі дані не належать певному конкретному екземпляру.

Наприклад, ми хочемо підготувати набір прикладних даних для попереднього перегляду:

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

Перед `previewStudents` стоїть `static`, тому це статична властивість.

Статична властивість не належить певному студентові, а належить самому типу `Student`.

Тому нам не потрібно спочатку створювати певного студента; ми можемо напряму отримати доступ через назву типу:

```swift
print(Student.previewStudents.count)    // 3
```

Спосіб доступу тут такий:

```swift
НазваТипу.назваСтатичноїВластивості
```

Тобто:

```swift
Student.previewStudents
```

Так само в енциклопедії тварин ми можемо так отримати доступ до даних про тварин:

```swift
Animal.animals
```

## Повертаємося до ContentView

Тепер дані про тварин уже збережені в типі `Animal`.

Тому всередині `ContentView` більше не потрібно писати довгий масив тварин.

Ми можемо змінити це так:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Показати список тварин
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Цей рядок коду означає:

```swift
let animals = Animal.animals
```

Взяти з типу `Animal` набір даних про тварин `animals`, а потім зберегти його в константі `animals` поточного представлення.

Після такого написання `ContentView` стане простішим.

`ContentView` відповідає за відображення інтерфейсу, а `Animal.animals` відповідає за надання даних про тварин.

## Винесення Animal в окремий файл

У попередньому уроці, щоб приклад було легше зрозуміти, ми записали `Animal` і `ContentView` в одному файлі.

Оскільки тоді коду було ще небагато, такий підхід не мав проблем.

Але тепер даних про тварин стає дедалі більше. Якщо й далі записувати весь код у `ContentView.swift`, файл стане дуже довгим і його буде незручно читати.

Тому ми можемо окремо помістити `Animal` у новий Swift-файл.

У Xcode можна створити новий Swift-файл, наприклад:

```swift
Animal.swift
```

Потім перемістити структуру `Animal` у цей файл:

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

Після такого впорядкування:

`ContentView.swift` відповідає за відображення інтерфейсу.

`Animal.swift` відповідає за опис структури даних про тварину.

Хоча вони розміщені в різних файлах, якщо вони належать до одного проєкту, `ContentView` усе одно може напряму використовувати `Animal`.

Наприклад:

```swift
let animals = Animal.animals
```

Тут не потрібно додатково імпортувати `Animal.swift` у `ContentView.swift`.

Swift автоматично розпізнає Swift-файли в одному проєкті.

## Використання extension для подальшого впорядкування коду

Тепер ми вже перемістили дані про тварин із `ContentView` у `Animal`.

Однак структура `Animal` усе ще одночасно містить два типи коду:

Перший тип — це властивості самої моделі тварини:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Другий тип — це фіксовані дані про тварин:

```swift
static let animals: [Animal] = [
    // ...
]
```

Щоб структура коду була зрозумілішою, ми можемо використати `extension`, щоб розділити ці дві частини.

`extension` означає розширення.

Воно може додавати новий код на основі вже наявного типу.

Наприклад:

```swift
extension Animal {
    
}
```

Це означає, що ми розширюємо тип `Animal`.

## Розміщення даних про тварин в extension

Ми можемо змінити `Animal` так:

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

Після такого впорядкування структура коду стане зрозумілішою.

`struct Animal` відповідає за опис того, які властивості має мати одна тварина.

`extension Animal` відповідає за збереження набору фіксованих даних про тварин.

Зверніть увагу: хоча `animals` переміщено в `extension Animal`, спосіб використання не змінюється.

Ми все ще можемо використовувати це так:

```swift
let animals = Animal.animals
```

Це також одна з особливостей `extension`: воно лише допомагає впорядкувати код і не змінює зовнішній спосіб виклику.

## Коли даних багато, можна ще створити файл AnimalData

Тепер ми вже помістили `Animal` в окремий файл `Animal.swift`.

Якщо даних про тварин небагато, можна прямо записати `extension Animal` також у `Animal.swift`.

Але якщо даних про тварин стає дедалі більше, можна ще створити новий файл, наприклад:

```swift
AnimalData.swift
```

Потім помістити туди фіксовані дані про тварин:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Дані про тварин
    ]
}
```

Після цього розподіл відповідальності в коді стане зрозумілішим:

`Animal.swift` відповідає лише за визначення моделі тварини.

`AnimalData.swift` відповідає лише за збереження даних про тварин.

`ContentView.swift` відповідає лише за відображення інтерфейсу.

Відповідальність кожного файлу стає зрозумілішою.

Зверніть увагу: `AnimalData.swift` — це лише назва файлу, а не новий Swift-тип. У цьому файлі ми все ще додаємо фіксовані дані до `Animal` через `extension Animal`.

## Повний код

Нижче наведено впорядкований код `Animal.swift`:

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

Впорядкований код `AnimalData.swift`:

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

У `ContentView.swift` це можна використовувати так:

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

Підказка: у файлах `Animal.swift` і `AnimalData.swift` перший рядок має такий вигляд:

```swift
import Foundation
```

Раніше, коли ми писали інтерфейс SwiftUI, ми часто використовували:

```swift
import SwiftUI
```

Це тому, що `ContentView`, `Text`, `Button`, `Color` та інші подібні елементи пов'язані з інтерфейсом, тому під час написання файлів інтерфейсу зазвичай потрібно імпортувати SwiftUI.

Але тут `Animal.swift` і `AnimalData.swift` не є файлами інтерфейсу. Вони переважно використовуються для визначення моделі тварини та збереження даних про тварин.

У цьому коді `UUID()` потребує використання `Foundation`, тому достатньо імпортувати `Foundation`.

## Підсумок

У цьому уроці ми переважно зробили одну річ: винесли дані про тварин із `ContentView`.

Початковий спосіб полягав у тому, що дані про тварин записувалися безпосередньо в `ContentView`. Такий код може працювати, але коли даних стає більше, файл представлення стає дедалі довшим.

Після впорядкування `ContentView` відповідає лише за відображення інтерфейсу, а `Animal.animals` відповідає за надання даних про тварин.

У цьому уроці ми також вивчили два нові поняття.

Перше — це `static`.

`static` означає статичну властивість. Статична властивість належить самому типу, і до неї можна напряму звертатися у форматі «назва типу.назва властивості».

Наприклад:

```swift
Animal.animals
```

Друге — це `extension`.

`extension` означає розширення. Воно може розділити код одного й того самого типу на кілька частин, щоб структура коду була зрозумілішою.

У цьому прикладі ми використовуємо `extension Animal` для збереження даних про тварин, щоб сама структура `Animal` була простішою.

Крім того, `Animal` переважно зберігає модель даних і не описує безпосередньо інтерфейс SwiftUI, тому тут використовується `import Foundation`.

Головна мета цього уроку не в тому, щоб зробити код складнішим, а в тому, щоб зробити його легшим для читання та підтримки.
