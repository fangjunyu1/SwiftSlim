# Упорядочение данных о животных

В предыдущем уроке мы завершили простой пример энциклопедии животных.

![view](../../../Resource/029_view.png)

Когда пользователь нажимает на определённое животное, страница показывает сведения о нём через `Sheet`.

Однако в коде предыдущего урока есть одна проблема: данные о животных были напрямую записаны внутри `ContentView`.

Например:

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
            // Показать список животных
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Этот код может нормально работать, но когда данных о животных становится всё больше, `ContentView` становится очень длинным.

`ContentView` изначально должен в основном отвечать за отображение интерфейса, но теперь он также хранит большое количество данных о животных. Это ухудшает читаемость кода и затрудняет дальнейшую поддержку.

Поэтому в этом уроке мы сделаем одну вещь:

вынесем данные о животных из `ContentView`.

## Зачем отделять данные?

В SwiftUI код представления обычно отвечает за отображение интерфейса.

Например:

```swift
Text("Dolphin")
Image("dolphin")
```

Этот код связан с отображением интерфейса.

А сами данные о животных, например название животного, имя изображения, область распространения, среда обитания и описание, не являются структурой интерфейса.

Они больше похожи на набор фиксированной информации:

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

Если написать код интерфейса и код данных вместе, код будет становиться всё более запутанным.

Поэтому мы можем поместить данные о животных в тип `Animal`.

## Использование static для хранения фиксированных данных

Сначала посмотрим на вариант после упорядочения:

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

Здесь добавлена одна строка кода:

```swift
static let animals: [Animal] = [
    
]
```

`static` означает статическое свойство.

Статическое свойство принадлежит самому типу, а не какому-либо конкретному экземпляру.

Эта фраза звучит довольно абстрактно, поэтому разберём её на простом примере.

## Обычные свойства и статические свойства

Например, мы определяем `Student`:

```swift
struct Student {
    let name: String
}
```

Здесь `name` — обычное свойство, а обычное свойство принадлежит конкретному экземпляру.

Если мы хотим обратиться к `name`, сначала нужно создать конкретного студента:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Здесь `student` — это экземпляр. На первых порах его также можно понимать как конкретный набор данных о студенте.

Поскольку имя каждого студента может быть разным, `name` должно находиться у конкретного студента.

Однако некоторые данные не принадлежат какому-либо конкретному экземпляру.

Например, мы хотим подготовить набор демонстрационных данных для предпросмотра:

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

Перед `previewStudents` стоит `static`, поэтому это статическое свойство.

Статическое свойство не принадлежит одному конкретному студенту, а принадлежит самому типу `Student`.

Поэтому нам не нужно сначала создавать какого-либо студента. Мы можем напрямую обратиться к нему через имя типа:

```swift
print(Student.previewStudents.count)    // 3
```

Форма обращения здесь такая:

```swift
ИмяТипа.ИмяСтатическогоСвойства
```

То есть:

```swift
Student.previewStudents
```

Аналогично в энциклопедии животных мы можем обращаться к данным о животных так:

```swift
Animal.animals
```

## Возвращаемся к ContentView

Теперь данные о животных уже сохранены в типе `Animal`.

Поэтому внутри `ContentView` больше не нужно писать длинный массив животных.

Мы можем изменить код так:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Показать список животных
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Эта строка кода означает:

```swift
let animals = Animal.animals
```

Получить из типа `Animal` набор данных `animals`, а затем сохранить его в константу `animals` текущего представления.

После такой записи `ContentView` становится более кратким.

`ContentView` отвечает за отображение интерфейса, а `Animal.animals` отвечает за предоставление данных о животных.

## Выносим Animal в отдельный файл

В предыдущем уроке, чтобы пример было проще понять, мы написали `Animal` и `ContentView` в одном файле.

Поскольку тогда кода было немного, такой подход не создавал проблем.

Но теперь данных о животных становится всё больше. Если продолжать писать весь код в `ContentView.swift`, файл станет очень длинным, и читать его будет неудобно.

Поэтому мы можем поместить `Animal` в отдельный новый Swift-файл.

В Xcode можно создать новый Swift-файл, например:

```swift
Animal.swift
```

Затем переместить структуру `Animal` в этот файл:

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

После такого упорядочения:

`ContentView.swift` отвечает за отображение интерфейса.

`Animal.swift` отвечает за описание структуры данных животного.

Хотя они находятся в разных файлах, если оба файла находятся в одном проекте, `ContentView` всё равно может напрямую использовать `Animal`.

Например:

```swift
let animals = Animal.animals
```

Здесь не нужно дополнительно импортировать `Animal.swift` в `ContentView.swift`.

Swift автоматически распознаёт Swift-файлы в одном проекте.

## Использование extension для дальнейшего упорядочения кода

Теперь мы уже переместили данные о животных из `ContentView` внутрь `Animal`.

Однако в структуре `Animal` всё ещё одновременно содержатся два типа кода:

Первый тип — это свойства самой модели животного:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Второй тип — это фиксированные данные о животных:

```swift
static let animals: [Animal] = [
    // ...
]
```

Чтобы структура кода была понятнее, мы можем использовать `extension`, чтобы разделить эти две части.

`extension` означает расширение.

Оно позволяет продолжать добавлять новый код на основе существующего типа.

Например:

```swift
extension Animal {
    
}
```

Это означает, что мы расширяем тип `Animal`.

## Помещаем данные о животных в extension

Мы можем изменить `Animal` так:

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

После такого упорядочения структура кода становится понятнее.

`struct Animal` отвечает за описание того, какие свойства должны быть у животного.

`extension Animal` отвечает за хранение набора фиксированных данных о животных.

Обратите внимание: хотя `animals` было перемещено в `extension Animal`, способ использования не изменился.

Мы по-прежнему можем использовать его так:

```swift
let animals = Animal.animals
```

Это также одна из особенностей `extension`: оно только помогает упорядочить код и не меняет внешний способ вызова.

## Когда данных много, можно дополнительно создать файл AnimalData

Теперь мы уже поместили `Animal` в отдельный файл `Animal.swift`.

Если данных о животных немного, можно напрямую написать `extension Animal` в `Animal.swift`.

Но если данных о животных становится всё больше, можно также создать ещё один файл, например:

```swift
AnimalData.swift
```

Затем поместить туда фиксированные данные о животных:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Данные о животных
    ]
}
```

После этого разделение обязанностей в коде становится понятнее:

`Animal.swift` отвечает только за определение модели животного.

`AnimalData.swift` отвечает только за хранение данных о животных.

`ContentView.swift` отвечает только за отображение интерфейса.

У каждого файла обязанности становятся более ясными.

Обратите внимание: `AnimalData.swift` — это только имя файла, а не новый Swift-тип. В этом файле мы всё равно через `extension Animal` добавляем фиксированные данные к `Animal`.

## Полный код

Ниже показан код `Animal.swift` после упорядочения:

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

Код `AnimalData.swift` после упорядочения:

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

В `ContentView.swift` это можно использовать так:

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

Подсказка: в файлах `Animal.swift` и `AnimalData.swift` первая строка записана так:

```swift
import Foundation
```

Раньше, когда мы писали интерфейс SwiftUI, мы часто использовали:

```swift
import SwiftUI
```

Это потому, что `ContentView`, `Text`, `Button`, `Color` и похожие элементы связаны с интерфейсом, поэтому при написании файлов интерфейса обычно нужно импортировать SwiftUI.

Но здесь `Animal.swift` и `AnimalData.swift` не являются файлами интерфейса. Они в основном используются для определения модели животного и хранения данных о животных.

В этом коде `UUID()` требует использования `Foundation`, поэтому достаточно импортировать `Foundation`.

## Итоги

В этом уроке мы в основном сделали одну вещь: вынесли данные о животных из `ContentView`.

Изначально данные о животных были напрямую записаны внутри `ContentView`. Такой код может работать, но когда данных становится больше, файл представления становится всё длиннее.

После упорядочения `ContentView` отвечает только за отображение интерфейса, а `Animal.animals` отвечает за предоставление данных о животных.

В этом уроке мы также изучили два новых понятия.

Первое — `static`.

`static` означает статическое свойство. Статическое свойство принадлежит самому типу, и к нему можно обращаться напрямую в форме «имя типа.имя свойства».

Например:

```swift
Animal.animals
```

Второе — `extension`.

`extension` означает расширение. Оно позволяет писать код одного и того же типа в разных частях, делая структуру кода более понятной.

В этом примере мы используем `extension Animal` для хранения данных о животных, чтобы сама структура `Animal` была более простой.

Кроме того, `Animal` в основном хранит модель данных и не содержит напрямую SwiftUI-интерфейс, поэтому здесь используется `import Foundation`.

Главная цель этого урока — не сделать код сложнее, а сделать его более читаемым и удобным для поддержки.
