# 从 ContentView 开始

## 课前准备

本节课，我们将从 ContentView.swift 文件开始，系统性的认识 SwiftUI 基本结构，包括：

- 注释
- View 结构
- VStack / HStack / ZStack 布局
- SF Symbols 图标
- 视图修饰符（modifier）
- 预览代码 #Preview

首先，找到之前创建的 Xcode 项目，双击 .xcodeproj 文件。

在左侧 Navigator 导航区域选择 ContentView.swift 文件。

注意：每次打开项目时，Canvas 可能显示 "Preview paused"。点击刷新按钮即可恢复预览。

![Swift](002_view7.png)

## 认识 ContentView

ContentView 代码：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

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

虽然代码比较少，但是包含了 SwiftUI 的核心结构。

### 1. 注释

文件顶部：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

这是文件注释，用于记录文件信息，其中包含文件名称、项目名称、创建人和创建时间。

Swift 中使用 // 进行单行注释：

```swift
// 这是注释
```

注释可以提高代码可读性，帮助开发者理解代码逻辑。

在实际开发中，代码可能晦涩难懂。如果不写注释，就会遇到三天后，看不懂自己代码的情况。

因此，在编写代码的过程中主动添加注释，是一个良好的开发习惯。利用注释记录代码逻辑，方便后续的代码维护。

**临时屏蔽代码**

注释还可以临时屏蔽代码，帮助我们排查问题。

例如：

```
A
B
C
```

A、B、C 是三段代码，其中有一段代码出错了，我们可以临时注释代码进行排查。

先给 A 添加注释：

```
// A
B
C
```

如果注释掉 A 后，代码恢复正常，说明 A 代码存在问题。

如果 A 注释掉后，仍然存在问题，我们可以再把 B 注释掉，以此类推，直到找出问题代码。

在开发过程中会遇到很多问题，我们大多需要通过注释代码排查问题原因，这可以帮助我们定位问题代码，找到 BUG。

在 Xcode 中，可以使用快捷键：

```
Command ⌘ + /
```

快速添加或者删除注释。

### 2. 导入 SwiftUI 框架

```swift
import SwiftUI
```

这段代码表示导入 SwiftUI 框架。

SwiftUI 中的 View、 Text、 Image、 VStack 等类型，都来自该框架。

如果不导入 SwiftUI 框架，Xcode 就会报错：

```
Cannot find type 'View' in scope
```

说明编译器无法识别 View 类型。

### 3. View 结构

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

第一次见到这个 View 结构，可能会感到陌生，因为它包含了 struct、View、var、body、some 等关键字。

我们现在还没有学习这些关键字，只需要知道这段代码的含义是，创建了一个名为 ContentView 的 View 视图。

你可以把 View 理解为一个画板，我们可以在上面进行绘画，绘画的工具就是 SwiftUI。

例如：

![Swift](002_view.png)

上图显示的是三个页面，实际上就是三个 View。

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

当我们使用 SwiftUI 开发的 App 时，每个页面都是一个 View。

### 4. SwiftUI 代码

在 View 视图内，显示 SwiftUI 代码：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

这段 SwiftUI 代码表示，这是一个垂直布局，显示一个图标和一个文本。

![Swift](002_view1.png)

#### VStack 布局

```swift
VStack { }  // 垂直布局
```

VStack 表示垂直布局容器。内部视图从上到下排列。

![Swift](002_view8.png)

SwiftUI 常见三种布局：

- VStack —— 垂直排序
- HStack —— 水平排序
- ZStack —— 叠加排序（Z轴）

```swift
HStack { }  // 水平排序
ZStack { }  // 叠加排序
```

各布局的排序示意图：

![Swift](002_view2.png)

例如：使用 HStack 进行水平排序。

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

可以看到，地球图标和文字被横向展示。

![Swift](002_view3.png)

当我们想要横向排序时，使用 HStack。当需要叠加排序时，使用 ZStack。

#### Image 与 SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

这段代码显示一个地球图标，地球图标来自 Apple 的 SF Symbols 图标系统。

![Swift](002_view9.png)

代码的含义为显示一个地球图标，大尺寸，颜色为强调色。

我们除了可以显示地球图标，还可以显示其他图标。

例如，显示一个背包：

```swift
Image(systemName: "backpack")
```

![Swift](002_view4.png)

**如何显示其他图标呢？**

我们需要使用 Apple 官方提供的系统图标库 SF Symbols。

打开 Apple Developer 官方网站，下载 [SF Symbols](https://developer.apple.com/sf-symbols/)。

![Swift](002_sf.png)

打开 SF Symbols App。

![Swift](002_sf1.png)

左侧为符号分类，右侧为对应的图标。

右击图标选择"拷贝1个名称"，名称为对应的字符串内容。

例如：

```
"globe"
"backpack"
"heart"
```

将拷贝的图标名称，放入 Image(systemName:) 中，就可以显示不同的图标。

注意：每个 SF Symbols 图标都有最低支持系统版本。如果系统版本过低，图标可能无法显示。需在 SF Symbols App 中查看其兼容性信息。

#### 修饰符

在 SwiftUI 中，修饰符（modifier）是一种用于改变视图外观或行为的方法。

可以将修饰符理解为衣服，穿着不同的衣服，展示的样貌也就不同。

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale 和 foregroundStyle 就是 Image 视图的修饰符，在不改变 Image 内容的情况下，修饰 Image 视图。

**1. imageScale**

```swift
.imageScale(.large)
```

它可以控制 SF Symbols 图标大小：

- .small
- .medium
- .large

![Swift](002_view11.png)

我们可以修改不同的选项，让 SF Symbols 符号显示不同的大小。

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle 可以控制前景色。

.tint 表示当前环境的强调色（accent color），默认情况下 iOS 为蓝色。

如果我们想要修改前景色为红色：

```swift
.foregroundStyle(.red)
```

![Swift](002_view5.png)

#### Text 视图

Text 是文本视图，用于显示字符串。

```swift
Text("Hello, world!")
```

例如，显示我的名字：

```swift
Text("FangJunyu")
```

注意：字符串必须使用 "" 双引号包裹。

你可以尝试显示你的名字、电话号码等内容。

#### padding 边距

在 SwiftUI 中，padding 用于在视图内容与边界之间增加空白区域，它属于“内边距（padding / content inset）”。

```swift
HStack {
    ...
}
.padding()
```

上述代码表示为 HStack 视图添加系统默认边距。

**什么是 padding？**

padding 表示"视图内容与其边界之间的留白区域"。

在下图中，蓝色的 HStack 设置 padding 后，蓝色区域会向内收缩，看上去会"变小一圈"。

![Swift](002_view6.png)

**默认边距**

padding() 修饰符默认使用系统推荐的标准间距。

```swift
.padding()
```

在不同的平台和上下文中，这个值会有所不同，例如：

- iOS 通常约为 16 pt。

- 在 macOS 或 watchOS 上，系统的标准间距可能会不同，通常会更大或更小，具体取决于各平台的设计规范。

**自定义边距**

还可以为视图设置单独的边距。

1. 设置单个方向

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

方向说明：

- .top:上边距
- .bottom:下边距
- .leading: 前侧边距
- .trailing: 后侧边距

![Swift](002_view12.png)

注意：leading 和 trailing 会根据语言方向自动适配。例如在阿拉伯语（RTL）环境中会自动翻转。

2. 设置多个方向

```swift
.padding([.top, .leading], 20)
```

![Swift](002_view13.png)

可以通过数组同时指定多个方向。数组的具体用法会在后续教程中详细讲解，这里只需了解这种写法即可。

3. 设置水平方向或垂直方向

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

等价于：

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](002_view14.png)

**移除边距**

如果不想要任何边距，可以使用 .padding(0) 来移除：

```swift
.padding(0)
```

或者直接删除 padding 修饰符：

```swift
// .padding()
```

### 6. Preview 预览代码

```swift
#Preview {
    ContentView()
}
```

这段代码表示在 Canvas 中生成 ContentView 视图预览。

注意：#Preview 是 Swift 5.9 / Xcode 15 引入的新语法，在此之前，使用的是 PreviewProvider 结构。

**注释掉 Preview 会发生什么？**

如果注释掉 Preview：

```swift
// #Preview {
//    ContentView()
// }
```

Canvas 将不再显示可渲染内容。

![Swift](002_xcode.png)

这是 #Preview 控制 Canvas 显示预览视图。

当我们需要在 Xcode 中预览 SwiftUI 视图时，添加 #Preview 预览代码。如果不需要预览视图，可以将 #Preview 预览代码注释或删除掉。

## 总结

虽然 ContentView.swift 文件代码不多，但实际上涵盖了 SwiftUI 的多个核心概念。对于初学者来讲，这段代码可能显得陌生，但通过拆解代码结构，可以建立起 SwiftUI 的初步认识。

回顾本节课的内容，我们首先学习了注释 //，可以使用注释说明代码逻辑或者临时屏蔽代码。

接着，我们了解到 SwiftUI 文件必须导入 SwiftUI 框架：

```swift
import SwiftUI
```

如果不导入框架，编译器将无法识别 View 等类型。

然后，我们认识了 SwiftUI 视图的基本结构：

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

其中 ContentView 是视图名称。

我们还学习了三种常见布局容器：VStack（垂直排序）、HStack（水平排序） 和 ZStack（叠加排序）。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

在这段代码中表示，显示一个垂直排序容器，容器内部显示一个图标和一个文本。

Image 可以显示 SF Symbols 图标，通过修饰符控制图标的大小和颜色。

Text 视图可以显示文本内容。

padding 是边距，在视图的周围增加一个透明空间。

最后是 #Preview 预览视图，可以在 Canvas 中显示预览视图。

### 课后练习

对于初学者来讲，本节课的内容可能比较复杂。我们可以通过进一步的练习，加深本节课学习知识的理解：

- 修改 SF Symbols 图标名称
- 修改图标的前景色为黑色
- 将 VStack 改为 HStack
- 注释 Image 或 Text，观察预览视图变化

### 彩蛋：代码补全（Code Completion）

在输入代码时，细心的你可能已经注意到，Xcode 会自动显示可用选项列表。

例如，当我们修改 imageScale 修饰符时：

```swift
.imageScale(.)
```

Xcode 就会显示可用的选项：

![Swift](002_view10.png)

这属于代码补全机制（Code Completion），它是基于类型推断和枚举成员提示，可以提高输入效率并减少错误。

在后续课程中，我们会正式介绍枚举（enum），现在仅作一个简单的了解。
