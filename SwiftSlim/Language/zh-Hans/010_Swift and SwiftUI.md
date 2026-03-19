# Swift 和 SwiftUI

在学习 Apple 平台开发时，许多教程倾向于将 Swift 和 SwiftUI 分开讲解，这容易让初学者产生割裂感，误以为它们是两门完全独立的技术。

实际上，Swift 和 SwiftUI 是深度融合的整体：Swift 是编程语言，负责提供逻辑和数据；SwiftUI 则是基于 Swift 构建的用户界面框架，负责视图的渲染和交互。

本节课将帮助你建立一个清晰的认知框架：什么是 Swift，什么是 SwiftUI，以及它们如何在代码中相互协作。

## 什么是 Swift?

Swift 是苹果公司推出的一种现代化的编程语言，它用于开发 iOS、macOS、watchOS 和 tvOS 等平台上的应用程序。

![swift](010_swift.png)

Swift 是一种强类型、静态语言，设计上更注重安全性，减少了很多常见的编程错误（比如空指针、越界等），支持与 C 和 Objective-C 进行无缝集成。

在实际开发中，Swift 更多的是负责应用的逻辑部分，比如数据处理、网络请求、存储操作等。

## 什么是 SwiftUI？

SwiftUI 是苹果公司于 2019 年推出的一种新的界面构建框架。SwiftUI 采用了声明式编程模式，允许开发者用更简洁的代码来描述界面结构和交互行为。

![swiftui](010_swiftui.png)

声明式编程意味着开发者只需告诉系统希望显示什么，系统会根据数据的变化自动刷新视图。而不再需要手动更新界面状态，这大大简化了 UI 开发的复杂性。

SwiftUI 的核心是视图组件（如 Text、Image、Button 等）和布局容器（如 VStack、HStack、ZStack）。这些组件通过数据绑定和状态管理来进行交互，使得界面能够响应数据变化并自动刷新。

## Swift 和 SwiftUI 如何协作？

Swift 和 SwiftUI 的职责可以总结为以下几点：

**1. Swift：处理逻辑和数据**

Swift 主要用于管理数据、存储状态和执行逻辑，这些代码通常不直接影响界面的渲染，而是负责数据和行为的处理。

例如，在 Swift 中处理数据：

```swift
let markdown = try? String(contentsOf: url)
```

这些代码涉及到变量声明、常量定义、函数、控制流等，不直接影响视图的展示。

**2. SwiftUI：声明和渲染界面**

SwiftUI 则用于构建用户界面的布局和内容，主要负责渲染界面和视图交互。

例如，使用 SwiftUI 创建一个文本视图：

```swift
Text("SwiftSlim")
```

这些都是用于构建和控制界面元素的代码，直接与用户界面交互。

### 基础示例

下面是一个简单的 SwiftUI 示例：

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

在这个示例中：

**SwiftUI 代码**：VStack、Image、Text、padding 都属于 SwiftUI，负责界面的展示和布局。

**Swift 代码**：文件顶部的 // 注释和 import SwiftUI 属于 Swift 代码结构；底部的 #Preview 是用于 Xcode 预览的宏，不参与实际界面渲染。

### 进阶示例

在实际项目中，Swift 和 SwiftUI 经常混合使用，以完成各自擅长的任务：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

在这个例子中：

**SwiftUI 代码**：@State 是 SwiftUI 特有的属性包装器，用于声明视图的可变状态；Button 和 Text 是 SwiftUI 视图组件，负责界面显示和用户交互。

**Swift 代码**：private var name 和 func printName() 是 Swift 代码，用于存储数据和执行逻辑，不直接影响视图渲染。

当用户点击按钮时，SwiftUI 会触发按钮中的操作代码：

```swift
Button("Print") {
    printName()
}
```

其中，Button 是 SwiftUI 组件，而执行的 printName() 函数则是 Swift 代码，负责具体的逻辑处理。

这种协作使得 Swift 和 SwiftUI 可以无缝结合，Swift 负责数据和逻辑处理，SwiftUI 负责用户界面的展示。

## Swift 和 SwiftUI 代码通常写在什么位置？

在 SwiftUI 中，界面是通过 body 属性返回的视图构建的。因此，所有用于描述界面的代码通常都写在 body 中。

例如：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

在这个例子中，Text 是 SwiftUI 视图组件，因此必须写在 body 中，因为 SwiftUI 会通过 body 读取并生成界面。

与界面无关的代码，例如变量、函数或数据处理逻辑，通常写在 body 外。例如：

```swift
struct ContentView: View {

    // Swift：数据或逻辑
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：界面
    var body: some View {
        Text(name)
    }
}
```

需要注意的是，body 中仍然可以使用 Swift 语法，例如 if、for 等控制流语句，它们只是用来控制 SwiftUI 视图的生成：

```
if isLogin {
    Text("Welcome")
}
```

因此，在 SwiftUI 开发中可以简单理解为：视图代码（Text、Image、Button 等）通常写在 body 中；数据和逻辑代码（变量、函数等）通常写在 body 外。

## Swift 文件

随着学习的深入，我们还会接触到 MVVM 架构，其中 ViewModel 和 Model 层通常由纯 Swift 代码构成，与视图层（SwiftUI）完全分离。

例如，用于管理应用状态的类：

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

或者描述数据结构的结构体：

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

这类文件的职责是管理和持久化数据，不直接显示在视图中，因此完全属于 Swift。

## 历史背景

理解 Swift 与 SwiftUI 的关系，还需要了解 Apple 开发技术的演变历程。截至 2026 年，这一技术栈经历了多次迭代。

### Swift 的历史

在 Swift 出现之前，Objective-C 是 Apple 平台的主要编程语言，支持与 C 语言混编。其语法较为冗长，对初学者而言门槛较高：

```Obj-c
// Objective-C 的写法
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 年，Apple 在 WWDC 上发布了 Swift 语言。Swift 语法更现代、类型安全性更高，并逐步取代 Objective-C 成为主流开发语言：

```swift
// Swift 的写法
let name = "Fang"
print("Hello, \(name)")
```

但是，Objective-C 并未就此退出历史舞台，它在许多存量项目和底层框架中仍然被广泛使用。了解其基本语法，对于维护老旧项目和理解系统底层仍有价值。

### SwiftUI 的历史

在 SwiftUI 出现前，iOS 使用 **UIKit**，macOS 使用 **AppKit**。这两套框架采用"命令式"编程方式。开发者需要通过 Storyboard 拖拽控件或手动编写代码来控制视图状态，代码量大、维护成本高，在界面逻辑复杂时尤为突出。

![storyboard](010_xcode.png)

2019 年，Apple 在 WWDC 上正式发布 SwiftUI。SwiftUI 引入了"声明式"编程范式，大幅简化了 UI 开发流程。

![storyboard](010_xcode1.png)

值得注意的是，SwiftUI 并非完全独立的底层实现。在各平台上，它本质上是对 UIKit（iOS）或 AppKit（macOS）进行桥接和协作，底层仍然依赖这两个框架运行。

### Swift 与 UIKit/AppKit 的关系

虽然 Swift 是一种通用编程语言，能在 Apple 各平台上运行，但它并不能完全替代 UIKit 或 AppKit。对于一些复杂的界面需求，或者 SwiftUI 尚未覆盖的功能点，仍然需要借助 UIKit 或 AppKit 来实现。

例如，UIKit 在处理复杂的视图控制器管理、动画效果、手势识别等方面已经非常成熟，积累了大量的生产实践验证。而 SwiftUI 在这些方面的能力虽然持续增强，但在某些边缘场景中仍存在局限。

因此，许多开发者会在项目中混合使用 SwiftUI 与 UIKit（或 AppKit），充分发挥两者各自的优势。

从这个角度理解，可以将 SwiftUI 视为对 UIKit / AppKit 的一种高级封装。学习 SwiftUI 的同时，适当了解 UIKit 和 AppKit 的基本概念，有助于在维护老旧项目或实现复杂功能时做出更合理的技术决策。

## 总结

**Swift**：主要用于编写逻辑、数据处理、控制流等，与视图布局无关。

**SwiftUI**：用于声明式地构建用户界面，视图内容和布局的代码属于 SwiftUI。

实际开发中，Swift 和 SwiftUI 通常是结合使用的，Swift 处理逻辑，SwiftUI 处理界面。

从 Objective-C 和 UIKit 到 Swift 和 SwiftUI，Apple 的开发环境逐渐转向更现代、简洁的编程方式，但 UIKit 和 AppKit 在许多传统项目中依然不可忽视。

通过理解 Swift 和 SwiftUI 的关系，我们可以更加高效地进行 iOS/macOS 开发，也能在维护老旧项目时，做出更加合理的技术选择。
