# 整理动物数据

在上一节课中，我们完成了一个简单的动物百科案例。

![view](../../../Resource/029_view.png)

当用户点击某个动物时，页面会通过 `Sheet` 弹出动物详情。

不过，上一节课的代码中存在一个问题：动物数据直接写在了 `ContentView` 里面。

例如：

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
            // 显示动物列表
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

这段代码可以正常运行，但是当动物数据越来越多时，`ContentView` 会变得很长。

`ContentView` 本来应该主要负责显示界面，但是现在它还保存了大量动物数据。这样会影响代码阅读，也不方便后续维护。

因此，这节课我们要做一件事：

把动物数据从 `ContentView` 中整理出去。

## 为什么要分离数据？

在 SwiftUI 中，视图代码通常负责显示界面。

例如：

```swift
Text("Dolphin")
Image("dolphin")
```

这些代码都和界面显示有关。

而动物数据本身，例如动物名称、图片名称、分布区域、栖息地、描述文字，并不是界面结构。

它们更像是一组固定资料：

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

如果把界面代码和数据代码全部写在一起，代码会越来越乱。

所以，我们可以把动物数据放到 `Animal` 类型中。

## 使用 static 保存固定数据

我们先来看整理后的写法：

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

这里新增了一行代码：

```swift
static let animals: [Animal] = [
    
]
```

`static` 表示静态属性。

静态属性属于类型本身，不属于某一个具体实例。

这句话比较抽象，我们可以通过一个简单例子理解。

## 普通属性和静态属性

例如，我们定义一个 `Student`：

```swift
struct Student {
    let name: String
}
```

这里的 `name` 是普通属性，普通属性属于某一个具体实例。

如果我们想访问 `name`，必须先创建一个具体的学生：

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

这里的 `student` 是一个实例，也可以先理解为一份具体的学生数据。

因为每个学生的名字都可能不同，所以 `name` 必须放在具体的学生身上。

但是，有些数据并不属于某一个具体实例。

例如，我们想要准备一组可以预览的示例数据：

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

这里的 `previewStudents` 前面有 `static`，所以它是静态属性。

静态属性不属于某一个学生，而是属于 `Student` 这个类型本身。

因此，我们不需要先创建某一个学生，就可以直接通过类型名访问：

```swift
print(Student.previewStudents.count)    // 3
```

这里的访问方式是：

```swift
类型名.静态属性名
```

也就是：

```swift
Student.previewStudents
```

同理，在动物百科中，我们可以这样访问动物数据：

```swift
Animal.animals
```

## 回到 ContentView

现在，动物数据已经保存到了 `Animal` 类型中。

所以 `ContentView` 里面不需要再写很长的动物数组。

我们可以改成：

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 显示动物列表
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

这行代码表示：

```swift
let animals = Animal.animals
```

从 `Animal` 类型中取出 `animals` 这组动物数据，然后保存到当前视图的 `animals` 常量中。

这样写以后，`ContentView` 会更简洁。

`ContentView` 负责显示界面，`Animal.animals` 负责提供动物数据。

## 把 Animal 拆到单独文件中

在上一节课中，为了让案例更容易理解，我们把 `Animal` 和 `ContentView` 写在了同一个文件中。

因为当时代码还比较少，这样写没有问题。

但是现在动物数据越来越多，如果继续把所有代码都写在 `ContentView.swift` 里面，文件会变得很长，也不方便阅读。

所以，我们可以把 `Animal` 单独放到一个新的 Swift 文件中。

在 Xcode 中，可以新建一个 Swift 文件，例如：

```swift
Animal.swift
```

然后把 `Animal` 结构体移动到这个文件中：

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

这样整理以后：

`ContentView.swift` 负责显示界面。

`Animal.swift` 负责描述动物数据的结构。

虽然它们放在了不同文件中，但是只要它们都在同一个项目里，`ContentView` 仍然可以直接使用 `Animal`。

例如：

```swift
let animals = Animal.animals
```

这里不需要在 `ContentView.swift` 里额外导入 `Animal.swift`。

Swift 会自动识别同一个项目中的 Swift 文件。

## 使用 extension 继续整理代码

现在，我们已经把动物数据从 `ContentView` 中移动到了 `Animal` 里面。

不过，`Animal` 结构体里仍然同时包含两类代码：

第一类是动物模型本身的属性：

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

第二类是固定的动物数据：

```swift
static let animals: [Animal] = [
    // ...
]
```

为了让代码结构更清楚，我们可以使用 `extension` 把这两部分分开。

`extension` 的意思是扩展。

它可以在原有类型的基础上，继续添加新的代码。

例如：

```swift
extension Animal {
    
}
```

这表示我们正在扩展 `Animal` 这个类型。

## 把动物数据放到 extension 中

我们可以把 `Animal` 改成这样：

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

这样整理以后，代码结构会更清楚。

`struct Animal` 负责描述一个动物应该有哪些属性。

`extension Animal` 负责保存一组固定的动物数据。

注意，虽然 `animals` 被移动到了 `extension Animal` 中，但使用方式没有变化。

我们仍然可以这样使用：

```swift
let animals = Animal.animals
```

这也是 `extension` 的一个特点：它只是帮助我们整理代码，不会改变外部的调用方式。

## 数据较多时，可以再新建 AnimalData 文件

现在，我们已经把 `Animal` 放到了单独的 `Animal.swift` 文件中。

如果动物数据比较少，可以直接把 `extension Animal` 也写在 `Animal.swift` 里。

但是，如果动物数据越来越多，也可以再新建一个文件，例如：

```swift
AnimalData.swift
```

然后把固定动物数据放进去：

```swift
extension Animal {
    static let animals: [Animal] = [
        // 动物数据
    ]
}
```

这样做以后，代码分工会更清楚：

`Animal.swift` 只负责定义动物模型。

`AnimalData.swift` 只负责保存动物数据。

`ContentView.swift` 只负责显示界面。

每个文件的职责都更清楚。

注意，`AnimalData.swift` 只是文件名，不是新的 Swift 类型。这个文件里仍然是在通过 `extension Animal` 给 `Animal` 添加固定数据。

## 完整代码

下面是整理后的 `Animal.swift` 代码：

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

整理后的 `AnimalData.swift` 代码：

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

在 `ContentView.swift` 中，可以这样使用：

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

提示：`Animal.swift` 和 `AnimalData.swift` 文件中，第一行都写了：

```swift
import Foundation
```

之前我们写 SwiftUI 界面时，经常使用：

```swift
import SwiftUI
```

这是因为 `ContentView`、`Text`、`Button`、`Color` 这些内容都和界面有关，所以写界面文件时通常需要导入 SwiftUI。

但是这里的 `Animal.swift` 和 `AnimalData.swift` 都不是界面文件，它们主要用来定义动物模型和保存动物数据。

在这段代码中，`UUID()` 需要使用 `Foundation`，所以导入 `Foundation` 就可以了。

## 总结

这节课我们主要做了一件事：把动物数据从 `ContentView` 中整理出去。

原来的写法是把动物数据直接写在 `ContentView` 里。这样代码可以运行，但是当数据变多时，视图文件会越来越长。

整理之后，`ContentView` 只负责显示界面，`Animal.animals` 负责提供动物数据。

这节课还学习了两个新知识。

第一个是 `static`。

`static` 表示静态属性。静态属性属于类型本身，可以通过“类型名.属性名”的方式直接访问。

例如：

```swift
Animal.animals
```

第二个是 `extension`。

`extension` 表示扩展。它可以把同一个类型的代码拆开写，让代码结构更清楚。

在这个案例中，我们使用 `extension Animal` 保存动物数据，让 `Animal` 结构体本身更加简洁。

另外，`Animal` 主要保存数据模型，没有直接编写 SwiftUI 界面，所以这里使用的是 `import Foundation`。

这一节课的重点不是让代码变得更复杂，而是让代码更容易阅读和维护。
