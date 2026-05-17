# 整理動物資料

在上一節課中，我們完成了一個簡單的動物百科案例。

![view](../../../Resource/029_view.png)

當使用者點擊某個動物時，頁面會透過 `Sheet` 彈出動物詳情。

不過，上一節課的程式碼中存在一個問題：動物資料直接寫在了 `ContentView` 裡面。

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
            // 顯示動物列表
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

這段程式碼可以正常執行，但是當動物資料越來越多時，`ContentView` 會變得很長。

`ContentView` 原本應該主要負責顯示介面，但是現在它還儲存了大量動物資料。這樣會影響程式碼閱讀，也不方便後續維護。

因此，這節課我們要做一件事：

把動物資料從 `ContentView` 中整理出去。

## 為什麼要分離資料？

在 SwiftUI 中，視圖程式碼通常負責顯示介面。

例如：

```swift
Text("Dolphin")
Image("dolphin")
```

這些程式碼都和介面顯示有關。

而動物資料本身，例如動物名稱、圖片名稱、分布區域、棲息地、描述文字，並不是介面結構。

它們更像是一組固定資料：

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

如果把介面程式碼和資料程式碼全部寫在一起，程式碼會越來越亂。

所以，我們可以把動物資料放到 `Animal` 類型中。

## 使用 static 儲存固定資料

我們先來看整理後的寫法：

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

這裡新增了一行程式碼：

```swift
static let animals: [Animal] = [
    
]
```

`static` 表示靜態屬性。

靜態屬性屬於類型本身，不屬於某一個具體實例。

這句話比較抽象，我們可以透過一個簡單例子理解。

## 一般屬性和靜態屬性

例如，我們定義一個 `Student`：

```swift
struct Student {
    let name: String
}
```

這裡的 `name` 是一般屬性，一般屬性屬於某一個具體實例。

如果我們想訪問 `name`，必須先建立一個具體的學生：

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

這裡的 `student` 是一個實例，也可以先理解為一份具體的學生資料。

因為每個學生的名字都可能不同，所以 `name` 必須放在具體的學生身上。

但是，有些資料並不屬於某一個具體實例。

例如，我們想要準備一組可以預覽的範例資料：

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

這裡的 `previewStudents` 前面有 `static`，所以它是靜態屬性。

靜態屬性不屬於某一個學生，而是屬於 `Student` 這個類型本身。

因此，我們不需要先建立某一個學生，就可以直接透過類型名訪問：

```swift
print(Student.previewStudents.count)    // 3
```

這裡的訪問方式是：

```swift
類型名.靜態屬性名
```

也就是：

```swift
Student.previewStudents
```

同理，在動物百科中，我們可以這樣訪問動物資料：

```swift
Animal.animals
```

## 回到 ContentView

現在，動物資料已經儲存到了 `Animal` 類型中。

所以 `ContentView` 裡面不需要再寫很長的動物陣列。

我們可以改成：

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 顯示動物列表
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

這行程式碼表示：

```swift
let animals = Animal.animals
```

從 `Animal` 類型中取出 `animals` 這組動物資料，然後儲存到目前視圖的 `animals` 常量中。

這樣寫以後，`ContentView` 會更簡潔。

`ContentView` 負責顯示介面，`Animal.animals` 負責提供動物資料。

## 把 Animal 拆到單獨檔案中

在上一節課中，為了讓案例更容易理解，我們把 `Animal` 和 `ContentView` 寫在了同一個檔案中。

因為當時程式碼還比較少，這樣寫沒有問題。

但是現在動物資料越來越多，如果繼續把所有程式碼都寫在 `ContentView.swift` 裡面，檔案會變得很長，也不方便閱讀。

所以，我們可以把 `Animal` 單獨放到一個新的 Swift 檔案中。

在 Xcode 中，可以新增一個 Swift 檔案，例如：

```swift
Animal.swift
```

然後把 `Animal` 結構體移動到這個檔案中：

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

這樣整理以後：

`ContentView.swift` 負責顯示介面。

`Animal.swift` 負責描述動物資料的結構。

雖然它們放在了不同檔案中，但是只要它們都在同一個專案裡，`ContentView` 仍然可以直接使用 `Animal`。

例如：

```swift
let animals = Animal.animals
```

這裡不需要在 `ContentView.swift` 裡額外匯入 `Animal.swift`。

Swift 會自動識別同一個專案中的 Swift 檔案。

## 使用 extension 繼續整理程式碼

現在，我們已經把動物資料從 `ContentView` 中移動到了 `Animal` 裡面。

不過，`Animal` 結構體裡仍然同時包含兩類程式碼：

第一類是動物模型本身的屬性：

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

第二類是固定的動物資料：

```swift
static let animals: [Animal] = [
    // ...
]
```

為了讓程式碼結構更清楚，我們可以使用 `extension` 把這兩部分分開。

`extension` 的意思是擴展。

它可以在原有類型的基礎上，繼續新增新的程式碼。

例如：

```swift
extension Animal {
    
}
```

這表示我們正在擴展 `Animal` 這個類型。

## 把動物資料放到 extension 中

我們可以把 `Animal` 改成這樣：

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

這樣整理以後，程式碼結構會更清楚。

`struct Animal` 負責描述一個動物應該有哪些屬性。

`extension Animal` 負責儲存一組固定的動物資料。

注意，雖然 `animals` 被移動到了 `extension Animal` 中，但使用方式沒有變化。

我們仍然可以這樣使用：

```swift
let animals = Animal.animals
```

這也是 `extension` 的一個特點：它只是幫助我們整理程式碼，不會改變外部的調用方式。

## 資料較多時，可以再新增 AnimalData 檔案

現在，我們已經把 `Animal` 放到了單獨的 `Animal.swift` 檔案中。

如果動物資料比較少，可以直接把 `extension Animal` 也寫在 `Animal.swift` 裡。

但是，如果動物資料越來越多，也可以再新增一個檔案，例如：

```swift
AnimalData.swift
```

然後把固定動物資料放進去：

```swift
extension Animal {
    static let animals: [Animal] = [
        // 動物資料
    ]
}
```

這樣做以後，程式碼分工會更清楚：

`Animal.swift` 只負責定義動物模型。

`AnimalData.swift` 只負責儲存動物資料。

`ContentView.swift` 只負責顯示介面。

每個檔案的職責都更清楚。

注意，`AnimalData.swift` 只是檔案名，不是新的 Swift 類型。這個檔案裡仍然是在透過 `extension Animal` 給 `Animal` 新增固定資料。

## 完整程式碼

下面是整理後的 `Animal.swift` 程式碼：

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

整理後的 `AnimalData.swift` 程式碼：

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

在 `ContentView.swift` 中，可以這樣使用：

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

提示：`Animal.swift` 和 `AnimalData.swift` 檔案中，第一行都寫了：

```swift
import Foundation
```

之前我們寫 SwiftUI 介面時，經常使用：

```swift
import SwiftUI
```

這是因為 `ContentView`、`Text`、`Button`、`Color` 這些內容都和介面有關，所以寫介面檔案時通常需要匯入 SwiftUI。

但是這裡的 `Animal.swift` 和 `AnimalData.swift` 都不是介面檔案，它們主要用來定義動物模型和儲存動物資料。

在這段程式碼中，`UUID()` 需要使用 `Foundation`，所以匯入 `Foundation` 就可以了。

## 總結

這節課我們主要做了一件事：把動物資料從 `ContentView` 中整理出去。

原來的寫法是把動物資料直接寫在 `ContentView` 裡。這樣程式碼可以執行，但是當資料變多時，視圖檔案會越來越長。

整理之後，`ContentView` 只負責顯示介面，`Animal.animals` 負責提供動物資料。

這節課還學習了兩個新知識。

第一個是 `static`。

`static` 表示靜態屬性。靜態屬性屬於類型本身，可以透過“類型名.屬性名”的方式直接訪問。

例如：

```swift
Animal.animals
```

第二個是 `extension`。

`extension` 表示擴展。它可以把同一個類型的程式碼拆開寫，讓程式碼結構更清楚。

在這個案例中，我們使用 `extension Animal` 儲存動物資料，讓 `Animal` 結構體本身更加簡潔。

另外，`Animal` 主要儲存資料模型，沒有直接編寫 SwiftUI 介面，所以這裡使用的是 `import Foundation`。

這一節課的重點不是讓程式碼變得更複雜，而是讓程式碼更容易閱讀和維護。
