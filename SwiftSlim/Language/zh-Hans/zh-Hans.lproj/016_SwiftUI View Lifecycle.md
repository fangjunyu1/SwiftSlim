# SwiftUI 视图生命周期

在上一节中，我们了解到 @State 变量会跟随视图的生命周期，我们还学习了 onAppear 的基本用法。

本节课，我们将进一步理解 SwiftUI 视图的生命周期，了解视图如何被创建和显示、以及视图中的变量如何被创建和重建，还将学习 onAppear、onDisappear 以及 init 构造函数。

根据这些知识，我们将建立对 SwiftUI 视图整个构建过程的整体认知。

## 应用启动顺序

创建 iOS 项目时，Xcode 会默认生成两个文件：

```
ContentView.swift
项目名 + App.swift
```

其中，“项目名 + App”.swift 是整个应用的入口文件。

例如：

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 代码执行流程

当我们运行 App（模拟器或真机）时，系统会查找 @main 关键字：

```swift
@main
struct SwiftSlimTestApp: App {...}
```

确认入口文件后，开始执行代码。

首先进入 App 结构体，执行 body 内的代码，然后创建 WindowGroup 并加载其中的 ContentView。

### WindowGroup 的作用

WindowGroup 用于管理窗口：

```swift
WindowGroup {
    ContentView()
}
```

在 iPad / macOS 系统支持多窗口，iPhone 通常只有一个窗口。

所以，WindowGroup 在 iPhone 上主要管理显示的第一个界面。

### 视图加载过程

系统查找 ContentView 后：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI 会执行 body 中的代码，然后根据返回的视图结构（如 VStack、Text 等）构建界面，并显示在屏幕上。

这些步骤完成后，我们就可以在视图中看到 ContentView。

![ContentView](../../Resource/016_view1.png)

需要注意的是，body 的作用是生成视图，而不是存储视图。

这意味着，每次刷新视图时，SwiftUI 都会重新计算 body，并生成新的视图结构。

### 预览视图逻辑

Xcode 预览（Canvas）和真实运行是两种不同的机制。

例如，在入口文件中添加一个调试输出：

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

在 Xcode 中预览 ContentView 视图，不会从 @main 入口开始执行，因此不会触发入口文件中的 onAppear。

但是，如果在模拟器或实体设备上运行，系统会从 @main 开始执行，按照完整流程运行整个 App，会触发入口中的 onAppear，并输出调试信息。

关键在于，Xcode 预览只是“局部渲染”，只用于显示当前视图；模拟器和实体设备提供“完整运行环境”，会执行整个 App。

因此，在测试 App 功能时，应以模拟器或实体设备为准，Xcode 预览无法提供完整的运行环境。

## 视图的生命周期

在当前阶段，我们的所有代码都集中在 ContentView 中。但在实际应用中，一个 App 通常会包含多个视图，并在不同场景中进行切换。

例如，在“存钱罐”中：

![PiggyBank](../../Resource/016_view.png)

当点击“存钱”时，显示 SaveView 视图；当存钱结束或关闭时，移除 SaveView 视图。

这个过程就是一个视图的生命周期，从创建视图，显示视图，最后移除视图。

### 关闭应用

当 App 被关闭时，所有视图都会被移除，相关状态也会消失。

因此，ContentView 及其他视图都会从内存中移除，整个 App 的运行状态也会被清空。

## 视图中变量的生命周期

在 SwiftUI 中，变量的生命周期通常和视图绑定。

例如：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State 变量

@State 声明的变量，绑定视图的生命周期。

```swift
@State private var name = "FangJunyu"
```

当创建视图时，name 也会被创建；当视图移除时，name 也会被销毁。 

这就是为什么需要使用 UserDefaults 等方式做数据持久化。

### body 内变量

在 body 中定义的变量：

```swift
var num = 10
```

它的生命周期与 body 的执行过程绑定。

当 SwiftUI 的状态发生变化时，例如：

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

当 name 发生改变时，@State 监测到数据发生变化，会通知 SwiftUI 重新计算视图，body 被重新计算。

body 重新计算时，body 内的所有代码都会重新执行，body 内的变量（如 num）会被重新创建。

这也是，为什么不推荐在 body 中定义复杂变量。

因为，每次刷新视图，body 内的变量都会被重新创建，这会增加计算成本，并影响性能。

在 SwiftUI 中，不同类型的数据应该使用不同的方式管理，需要跟随视图生命周期的数据，可以使用 @State 保存；临时计算的数据，可以放在 body 中。

## onAppear 和 onDisappear

在上一节课，我们已经学习了 onAppear，当视图显示时会调用 onAppear。

```swift
.onAppear {}
```

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

在 Xcode 预览或运行时，可以看到 onAppear 中的输出调试。

### onDisappear

与 onAppear 对应的是 onDisappear：

```swift
.onDisappear {}
```

当视图被关闭时，会调用 onDisappear。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

当视图被移除时，会调用 onDisapper 中的代码。

提示：当前阶段使用的 ContentView 是应用的根视图，无法直接关闭或移除。因此，在这一阶段无法观察到 onDisappear 的执行效果。

在后续学习页面跳转、打开新视图时，才能看到 onDisappear 被调用。

## 创建和显示逻辑

需要注意的是，视图的创建和显示是两个不同的阶段。

当视图创建时，会调用 struct 的构造方法：

```swift
init() {}
```

因为 SwiftUI 视图是 struct 结构：

```swift
struct ContentView: View { ... }
```

所以，当视图实例被创建时，会执行 init 构造方法。当视图显示时，才会调用 onAppear 方法。

例如：

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

在 Xcode 中预览视图时，可以看到调试输出：

```swift
Create ContentView
Show ContentView
```

说明，先执行 init 创建视图，再计算 body 中的代码，最后显示视图并执行 onAppear 方法。

因此，需要理解视图的创建和显示阶段是分开的。

### init 构造方法

init 是 Swift 的基础语法，struct 和 class 都可以定义，用于初始化对象。

```swift
init() {}
```

在 SwiftUI 中，当视图被创建时，系统会调用视图的 init 方法，可以用于接收参数、初始化数据。

如果没有手动编写 init，Swift 会为 struct 自动生成一个默认构造方法。

对于 ContentView 等 SwiftUI 视图来说，创建视图时，执行 init，显示视图时，执行 onAppear。

因此，init 是视图被创建时执行的构造方法，在后续传递参数或初始化数据时会用到。

## 总结

本节课我们学习了应用启动顺序，从入口文件到 ContentView 文件的执行流程。

我们了解了 SwiftUI 视图生命周期：视图创建时会执行 init，显示在屏幕上时会执行 onAppear，移除或关闭视图时会执行 onDisappear。

学习了视图更新机制：视图由状态驱动，当 @State 等状态发生变化时，SwiftUI 会刷新视图，重新计算 body，body 内的变量也会被重新创建。

变量的生命周期会绑定视图的生命周期，而 body 内的临时在每次刷新时，都会重新创建。

理解这些生命周期和变量的行为，有助于我们更好地组织代码，让应用逻辑更清晰。
