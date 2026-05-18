# Организиране на данните за животните

В предишния урок завършихме прост пример за енциклопедия на животни.

![view](../../../Resource/029_view.png)

Когато потребителят докосне дадено животно, страницата ще покаже подробностите за животното чрез `Sheet`.

Но в кода от предишния урок има един проблем: данните за животните са написани директно в `ContentView`.

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
            // Показване на списъка с животни
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Този код може да работи нормално, но когато данните за животните стават все повече, `ContentView` ще стане много дълъг.

`ContentView` по принцип трябва основно да отговаря за показването на интерфейса, но сега той съхранява и много данни за животни. Това влияе на четимостта на кода и не е удобно за последваща поддръжка.

Затова в този урок ще направим едно нещо:

ще изнесем данните за животните от `ContentView`.

## Защо трябва да разделяме данните?

В SwiftUI кодът на изгледа обикновено отговаря за показването на интерфейса.

Например:

```swift
Text("Dolphin")
Image("dolphin")
```

Този код е свързан с показването на интерфейса.

А самите данни за животните, например име на животното, име на изображението, област на разпространение, местообитание и описание, не са структура на интерфейса.

Те приличат повече на група фиксирана информация:

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

Ако напишем целия код за интерфейса и целия код за данните заедно, кодът ще става все по-хаотичен.

Затова можем да поставим данните за животните в типа `Animal`.

## Използване на static за съхраняване на фиксирани данни

Нека първо видим организирания начин на писане:

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

Тук е добавен един нов ред код:

```swift
static let animals: [Animal] = [
    
]
```

`static` означава статично свойство.

Статичното свойство принадлежи на самия тип, а не на някой конкретен екземпляр.

Това изречение е сравнително абстрактно. Можем да го разберем чрез прост пример.

## Обикновени свойства и статични свойства

Например, дефинираме `Student`:

```swift
struct Student {
    let name: String
}
```

Тук `name` е обикновено свойство. Обикновеното свойство принадлежи на конкретен екземпляр.

Ако искаме да достъпим `name`, първо трябва да създадем конкретен студент:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Тук `student` е екземпляр. Можем временно да го разбираме като една конкретна част от данни за студент.

Понеже името на всеки студент може да е различно, `name` трябва да бъде поставено върху конкретния студент.

Но има данни, които не принадлежат на някой конкретен екземпляр.

Например, искаме да подготвим група примерни данни за предварителен преглед:

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

Тук пред `previewStudents` има `static`, затова то е статично свойство.

Статичното свойство не принадлежи на някой конкретен студент, а принадлежи на самия тип `Student`.

Затова не е нужно първо да създаваме някой студент. Можем директно да достъпим свойството чрез името на типа:

```swift
print(Student.previewStudents.count)    // 3
```

Начинът на достъп тук е:

```swift
ИмеНаТип.имеНаСтатичноСвойство
```

тоест:

```swift
Student.previewStudents
```

По същия начин, в енциклопедията на животни можем да достъпим данните за животните така:

```swift
Animal.animals
```

## Връщане към ContentView

Сега данните за животните вече са запазени в типа `Animal`.

Затова вече не е необходимо да пишем дълъг масив с животни в `ContentView`.

Можем да го променим така:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Показване на списъка с животни
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Този ред код означава:

```swift
let animals = Animal.animals
```

Вземаме групата данни `animals` от типа `Animal`, след което я запазваме в константата `animals` на текущия изглед.

След като пишем така, `ContentView` ще стане по-изчистен.

`ContentView` отговаря за показването на интерфейса, а `Animal.animals` отговаря за предоставянето на данните за животните.

## Преместване на Animal в отделен файл

В предишния урок, за да направим примера по-лесен за разбиране, написахме `Animal` и `ContentView` в един и същ файл.

Понеже тогава кодът все още беше сравнително малко, този начин на писане нямаше проблем.

Но сега данните за животните стават все повече. Ако продължим да пишем целия код в `ContentView.swift`, файлът ще стане много дълъг и няма да е удобен за четене.

Затова можем да поставим `Animal` отделно в нов Swift файл.

В Xcode можем да създадем нов Swift файл, например:

```swift
Animal.swift
```

След това преместваме структурата `Animal` в този файл:

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

След такава организация:

`ContentView.swift` отговаря за показването на интерфейса.

`Animal.swift` отговаря за описването на структурата на данните за животните.

Въпреки че са поставени в различни файлове, стига да са в един и същ проект, `ContentView` все още може директно да използва `Animal`.

Например:

```swift
let animals = Animal.animals
```

Тук не е нужно допълнително да импортираме `Animal.swift` в `ContentView.swift`.

Swift автоматично ще разпознае Swift файловете в един и същ проект.

## Използване на extension за допълнително организиране на кода

Сега вече преместихме данните за животните от `ContentView` в `Animal`.

Но структурата `Animal` все още съдържа едновременно два вида код:

Първият вид са самите свойства на модела на животно:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Вторият вид са фиксираните данни за животни:

```swift
static let animals: [Animal] = [
    // ...
]
```

За да направим структурата на кода по-ясна, можем да използваме `extension`, за да разделим тези две части.

`extension` означава разширение.

То може да добавя нов код върху основата на съществуващ тип.

Например:

```swift
extension Animal {
    
}
```

Това означава, че разширяваме типа `Animal`.

## Поставяне на данните за животните в extension

Можем да променим `Animal` така:

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

След такава организация структурата на кода ще бъде по-ясна.

`struct Animal` отговаря за описването на това какви свойства трябва да има едно животно.

`extension Animal` отговаря за съхраняването на група фиксирани данни за животни.

Обърнете внимание: въпреки че `animals` е преместено в `extension Animal`, начинът на използване не се променя.

Все още можем да го използваме така:

```swift
let animals = Animal.animals
```

Това също е една от особеностите на `extension`: то само ни помага да организираме кода и не променя външния начин на извикване.

## Когато данните са повече, може да се създаде отделен файл AnimalData

Сега вече поставихме `Animal` в отделния файл `Animal.swift`.

Ако данните за животните са малко, можем директно да напишем `extension Animal` в `Animal.swift`.

Но ако данните за животните стават все повече, можем също да създадем още един файл, например:

```swift
AnimalData.swift
```

След това поставяме фиксираните данни за животните в него:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Данни за животните
    ]
}
```

След това разпределението на отговорностите в кода ще бъде по-ясно:

`Animal.swift` отговаря само за дефинирането на модела на животното.

`AnimalData.swift` отговаря само за съхраняването на данните за животните.

`ContentView.swift` отговаря само за показването на интерфейса.

Отговорностите на всеки файл са по-ясни.

Обърнете внимание: `AnimalData.swift` е само име на файл, а не нов Swift тип. В този файл все още използваме `extension Animal`, за да добавим фиксирани данни към `Animal`.

## Пълен код

По-долу е организираният код на `Animal.swift`:

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

Организираният код на `AnimalData.swift`:

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

В `ContentView.swift` можем да използваме така:

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

Подсказка: в първия ред на файловете `Animal.swift` и `AnimalData.swift` пишем:

```swift
import Foundation
```

Преди, когато пишехме SwiftUI интерфейси, често използвахме:

```swift
import SwiftUI
```

Това е така, защото `ContentView`, `Text`, `Button`, `Color` и тези елементи са свързани с интерфейса, затова когато пишем файлове за интерфейс, обикновено трябва да импортираме SwiftUI.

Но `Animal.swift` и `AnimalData.swift` тук не са файлове за интерфейс. Те основно се използват за дефиниране на модела на животното и за съхраняване на данни за животните.

В този код `UUID()` изисква използването на `Foundation`, затова е достатъчно да импортираме `Foundation`.

## Обобщение

В този урок основно направихме едно нещо: изнесохме данните за животните от `ContentView`.

Първоначалният начин на писане беше да напишем данните за животните директно в `ContentView`. Така кодът може да работи, но когато данните се увеличат, файлът на изгледа ще става все по-дълъг.

След организацията `ContentView` отговаря само за показването на интерфейса, а `Animal.animals` отговаря за предоставянето на данните за животните.

В този урок научихме и две нови неща.

Първото е `static`.

`static` означава статично свойство. Статичното свойство принадлежи на самия тип и може да бъде достъпено директно чрез начина „име на тип.име на свойство“.

Например:

```swift
Animal.animals
```

Второто е `extension`.

`extension` означава разширение. То може да раздели кода на един и същ тип на отделни части, за да направи структурата на кода по-ясна.

В този пример използвахме `extension Animal`, за да съхраняваме данните за животните, което прави самата структура `Animal` по-изчистена.

Освен това `Animal` основно съхранява модел на данни и не пише директно SwiftUI интерфейс, затова тук използваме `import Foundation`.

Фокусът на този урок не е да направим кода по-сложен, а да направим кода по-лесен за четене и поддръжка.
