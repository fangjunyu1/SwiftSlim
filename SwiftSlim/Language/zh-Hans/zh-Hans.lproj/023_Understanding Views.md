# 理解视图

这一节课，我们重新回到最开始的 `ContentView`。

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

我们第一次接触 SwiftUI 时，`ContentView` 中有很多我们不理解的关键词。

比如 `struct`、`View`、`var`、`body`、`some View` 等等关键词。

当时我们可能只知道：**把代码写到 `body` 里面，界面上就会显示内容。**

现在，我们已经学习过 `struct`、变量、方法和协议，我们可以重新理解这段代码，帮助我们理解 SwiftUI 视图之间的关系。

## 重温 ContentView

创建 SwiftUI 项目后，Xcode 默认会生成一个 `ContentView` 文件。

示例代码如下：

```swift
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
```

这段代码可以拆成几个部分理解。

首先是：

```swift
import SwiftUI
```

这行代码表示导入 SwiftUI 框架。

导入 SwiftUI 后，我们才能使用 `View`、`Text`、`Image`、`VStack`、`Button` 等 SwiftUI 视图。

## ContentView 结构体

这一行代码表示创建一个结构体：

```swift
struct ContentView: View
```

其中：

```swift
struct ContentView
```

表示 `ContentView` 是一个结构体。

我们在上一节课了解过 `struct` 结构，它可以将不同的字段结构组合在一起，它可以包含属性、方法。

例如：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

在这个示例中，`ContentView` 里面包含了三个内容：`name`、`printName` 和 `body`。

也就是说，`struct` 可以把相关的属性、方法和视图内容组合在一起。

![contentView](../../Resource/023_contentVIew.png)

## View 是一个协议

继续看这一行代码：

```swift
struct ContentView: View 
```

冒号后面的 `View` 表示：`ContentView` 遵循 `View` 协议。

可以理解为，`ContentView` 如果想要成为一个 SwiftUI 视图，就必须满足 `View` 协议的要求。

### Identifiable 协议

前面学习电影清单时，我们接触过 `Identifiable` 协议。

当时，我们需要在 `ForEach` 中遍历 `Movie` 数组，但是 `Movie` 结构没有唯一标识，因此不支持 `ForEach` 遍历。

这时，我们需要让 `Movie` 结构遵循 `Identifiable` 协议，从而符合 `ForEach` 对唯一标识的要求。

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` 协议要求：**这个类型有一个标识自己的 `id` 字段。**

当 `Movie` 提供一个 `id` 字段后，它就可以满足 `Identifiable` 的要求。

这样我们在 `ForEach` 中使用它时，SwiftUI 就能识别每一条数据。

```swift
ForEach(lists) { movie in
    // ...
}
```

### View 协议

`View` 协议也是如此。

如果一个类型想要成为 SwiftUI 视图，就需要遵循 `View` 协议。

而 `View` 协议最重要的要求，就是提供一个 `body`。

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

可以理解为，`View` 协议要求：**只接受 `body` 返回的 SwiftUI 视图，`ContentView` 则通过 `body` 显示 SwiftUI 视图。**

### 如果不遵循 View 会怎么样？

如果我们这样写：

```swift
struct ContentView {
}
```

这只是一个普通结构体，不是 SwiftUI 视图。

它不会直接报错，因为普通结构体本身就是合法的 Swift 代码。

但是，如果我们把它放到预览里：

```swift
#Preview {
    ContentView()
}
```

这时就会报错。

原因是：**预览需要显示一个 SwiftUI 视图，而这个 `ContentView` 没有遵循 `View` 协议。**

因此，如果我们希望 `ContentView` 能显示在界面上，就需要让它遵循 `View` 协议：

```swift
struct ContentView: View {
}
```

同时，按照 `View` 协议要求提供 `body`，如果没有 `body`，编译器仍然会报错。

正确写法：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

这时，`ContentView` 才是一个真正可以显示的 SwiftUI 视图。

## body 是视图显示的入口

在 SwiftUI 中，`body` 是视图内容的入口。

```swift
var body: some View {
    Text("Hello, world!")
}
```

这里可以拆成三部分：

**1、var body**

```swift
var body
```

表示定义了一个名为 `body` 的变量。

**2、some View**

```swift
: some View
```

表示这个 `body` 会返回一个视图。

**3、{ ... }**

```swift
{
    Text("Hello, world!")
}
```

表示显示的视图内容，这段代码中显示的是一个 `Text` 视图。

也就是说，`body` 里面写什么，界面上就显示什么。

例如：

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

这段代码表示：**界面上显示一个垂直排列的内容，里面有两个文本。**

### body 命名不能随意修改

需要注意的是，`body` 这个名字不能随便修改。

如果写成：

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

这个 `content` 虽然也是一个视图属性，但它不能替代 `body`。

因为 `View` 协议要求的名称就是 `body`。

## some View 是什么？

在 SwiftUI 中，`some View` 表示返回一个具体的视图，只是不需要把这个视图的完整类型写出来。

```swift
var body: some View
```

也就是说，`some View` 并不是没有类型，而是真实类型仍然存在，编译器知道这个类型，但是这个类型可能很复杂，所以 Swift 允许我们使用 `some View` 把它隐藏起来。

### 什么是 some？

在 Swift 中，`some` 是用于声明不透明类型（opaque type）的关键字。

不透明类型的意思是：**返回值有一个具体类型，编译器知道这个具体类型是什么，但我们不把这个具体类型直接写出来。**

例如：

```swift
func makeView() -> some View {
    Text("Hello")
}
```

这表示，`makeView` 会返回一个遵循 `View` 协议的具体类型。

### 为什么需要 some？

在学习变量时，我们了解过：**Swift 中的值需要显式标注类型，或者由编译器自动推断出类型。**

例如：

```swift
let a: Int = 10
```

这里的常量 `a` 是 `Int` 类型。

SwiftUI 视图也不例外，当我们使用 `body` 显示 SwiftUI 视图时，需要让 `body` 返回对应的 SwiftUI 类型。

例如，我们使用 `body` 显示一个 `Text` 文本视图，我们就需要让 `body` 返回对应的 `Text` 类型。

```swift
var body: Text {
    Text("Fang Junyu")
}
```

在这个示例中，`body` 内部显示的是一个 `Text` 视图，返回的类型也是 `Text`。

只有内部的类型和声明的类型一致时，才符合编译器对类型一致的要求。

**类型不一致问题**

如果，我们将 `body` 的类型设置为 `Color`，但是显示的是 `Text`：

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` 的类型和内部的代码类型不一致，就会触发类型不一致报错。

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

这时，就需要我们手动修改 `body` 的返回类型。

**复杂的视图类型**

在实际开发中，界面通常不会只有一个 `Text`。

如果需要显示更复杂的 `VStack`，我们需要手动标注复杂的返回类型。

例如：

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

这段代码表示返回一个 `VStack`，`VStack` 内部是 `Image` 和 `Text` 类型的视图。

`body` 的返回类型是：

```swift
VStack<TupleView<(Image,Text)>>
```

可以看到，这个返回类型非常复杂，还新增了一个我们之前没有见过的 `TupleView`。

`TupleView` 在这里可以理解为：**表示封装多个子视图为一个视图。**

**更复杂的视图类型**

如果，我们给视图添加修饰符：

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

那么，这个视图的返回类型变得非常复杂，无法在这里进行具体的描述。

现有的返回类型 `VStack<TupleView<(Image,Text)>>` 就会因为无法描述修饰符，从而发生报错。

**some View 简化返回类型**

对于这种情况，SwiftUI 提供了一种简洁的解决方案，那就是 `some View` 来简化写法。

当我们将 `body` 改为 `some View` 类型时：

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

我们每次修改视图代码，都不需要再写出完整的返回类型。

这是因为，`some View` 表示返回一个遵循 `View` 协议的具体视图。

换句话说，`VStack`、`Image` 等等 SwiftUI 视图，都是遵循 `View` 协议的视图。添加修饰符后返回的视图类型，仍然遵循 `View` 协议。

所以它们都可以作为 `some View` 返回。

### some View 不能随便返回任何视图

`some View` 虽然可以隐藏复杂类型，但它并不是“没有类型”。

它的核心规则是：**编译器必须能确定一个具体的返回类型**。

例如：

```swift
var title: some View {
    Text("Hello")
}
```

这里返回的是 `Text` 视图。

但是，如果尝试返回两个视图，就会发生报错：

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

因为 `some View` 最终需要返回一个视图结构，而这里尝试返回两个独立的视图。

### 解决方案

解决方案通常有两种：容器和 `@ViewBuilder`。

**1、使用容器包起来**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

在这段代码中，`title` 返回的是一个 `VStack`，而 `Text` 和 `Image` 是 `VStack` 里面的子视图。

`some View` 接收的视图结构是一个 `VStack<...>`，从而符合 `some View` 对于返回一个视图结构的要求。 

这也就是为什么，我们从一开始学习 SwiftUI，就建议在最外层使用 `VStack` 容器包裹视图代码。

**2、使用 @ViewBuilder**

我们也可以在 `some View` 前面添加 `@ViewBuilder` 修饰符：

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` 可以把多个视图组合成一个返回结果。

其本质还是将多个视图合并为一个视图，来满足 `some View` 对于返回一个视图结构的要求。

### 为什么 body 可以直接写多个视图？

如果我们在 `var body` 中编写多个视图，例如：

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

在一些情况下，这样的 `body` 不会报错。

原因在于，`View` 协议中的 `body` 默认支持 `@ViewBuilder`：

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

在 `View` 协议的源代码中，我们可以看到 `@ViewBuilder` 已经修饰了 `body` 变量。

因此，`body` 比普通的 `some View`，多了一层特殊处理，从而 SwiftUI 会自动帮我们把多个视图组合成一个视图。

**推荐使用容器**

为了让初学者更容易理解，建议优先使用 `VStack`、`HStack`、`ZStack`、`Group` 等容器来组织多个视图。

例如：

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

这样代码更直观：**外层是一个 `VStack`，里面放了两个子视图。**

## 拆分视图

如果界面比较简单，我们可以把所有代码都写在 `body` 中。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Welcome to Qinote")
                Text("Good morning")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("click me") {
                print("click me ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

这个视图的显示样式：

![view](../../Resource/023_view1.png)

这段代码可以正常运行，但是如果视图代码非常复杂，`body` 中的代码就会越来越长，阅读和修改的难度就会不断增加。

这时，我们可以把不同区域拆分为独立的视图属性。

### 拆分顶部视图

例如，把顶部区域拆分出来：

```swift
var topHome: some View {
    HStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

这里的 `topHome` 是一个变量，它返回一个视图。

因为返回的是视图，所以类型可以写为：

```swift
some View
```

这里实际上和 `body` 是一个用法：

```swift
var topHome: some View { }
var body: some View { }
```

都是使用变量显示视图，返回类型为 `some View`。

### 拆分其他视图

然后，继续拆分其他部分：

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Welcome to Qinote")
        Text("Good morning")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Click me") {
        print("click me")
    }
    .buttonStyle(.borderedProminent)
}
```

拆分之后，可以将视图变量放到 `body` 中：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Home")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Welcome to Qinote")
            Text("Good morning")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Click me") {
            print("click me")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

现在 `body` 只负责描述页面结构：

```swift
topBar
welcomeText
colorList
clickButton
```

每一部分的具体实现，都放到了下面对应的属性中。

这种拆分视图的方式，可以让页面结构更清晰，每个视图区域都有自己的名字，阅读更直观。

当修改某一部分的代码时，可以直接找到对应的视图区域，而不是在一堆复杂的代码中找寻代码。

### some View 返回单个视图

在这个拆分视图中，如果我们尝试返回多个视图：

```swift
var topBar: some View {
    Text("Home")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` 因为只能返回一个视图结构，从而发生报错。

和 `body` 不同的是，普通的计算属性默认没有 `@ViewBuilder`。

因此，如果我们需要返回多个视图，可以使用 `VStack`、`HStack` 或者 `Group` 容器将多个视图组合成一个。

```swift
var topBar: some View {
    VStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

或者添加 `@ViewBuilder` 组合视图：

```swift
@ViewBuilder
var topBar: some View {
    Text("Home")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

这样，我们就可以实现多个视图的返回。

### if 返回多个视图

例如：

```swift
var topHome: some View {
    if step == "Home" {
        HStack {
            Text("Home")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Nil")
    }
}
```

在这个代码中，`topHome` 会根据 `step` 的内容，返回 `HStack` 或者 `Text` 两种不同类型的视图。

由于 `some View` 需要一个确定的具体返回类型，普通计算属性中 `if` 的两个分支不能直接返回不同类型的视图，从而发生报错。

**解决方案仍然是使用容器包裹，或者使用 `@ViewBuilder` 修饰。**

### 拆分视图为什么不用括号

在 `body` 中使用拆分出来的视图属性时，我们直接写：

```swift
topBar
welcomeText
colorList
clickButton
```

而不是写成：

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

这是因为 `topBar`、`welcomeText`、`colorList`、`clickButton` 是一个变量，这个变量实际上是计算属性，不是方法。

**属性不需要使用括号。**

如果我们写成方法，也可以实现类似效果：

```swift
func topBar() -> some View {
    HStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

这段代码也可以实现类似效果，调用这个方法会返回一个视图。

使用时需要写为：

```swift
topBar()
```

在 SwiftUI 中，如果只是拆分一个不需要传入参数的视图，使用计算属性的方式更常见。

```swift
var topBar: some View { ... }
```

## 嵌套视图

除了把代码拆成属性，我们还可以创建新的视图结构体。

例如：

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

这个 `PinkColorView` 和 `ContentView` 一样，都是一个独立的 SwiftUI 视图。

如果需要在 `ContentView` 中显示它，可以在视图名称后面添加 `()`。

例如：

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

这里的：

```swift
PinkColorView()
```

表示创建一个 `PinkColorView` 实例。

因为 `PinkColorView` 遵循了 `View` 协议，所以它可以和 `Text`、`Image`、`Button` 一样放到其他视图中显示。

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

这就是视图嵌套，一个视图可以显示在另一个视图当中。

## 视图属性还是创建新视图？

视图代码比较简单时，通常不需要拆分代码，只有代码比较复杂时，才建议拆分视图。

### 使用视图属性的场景

如果只是当前视图中的一小块内容，可以使用视图属性。

例如：

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

这些内容通常只在当前视图中使用。

### 创建新视图的场景

如果这些内容比较独立，或者以后可能在多个页面中复用，就更适合创建新的视图。

例如：

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

这是一个标题视图，如果我们想要把这个视图作为通用组件，在其他视图中复用。

我们可以创建一个新的视图：

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

然后，在其他地方使用：

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

这时，这个视图就是一个可复用的独立组件。

可以简单地归结为：

- 当前视图的内容区域，可以使用 `var xxx: some View`
- 可以复用的独立组件：可以创建新的 `struct XxxView: View`
- 需要传入数据的组件：通常更适合创建新的视图。

## 总结

这一节课，我们重新理解了 SwiftUI 中最基础、但也最重要的视图结构。

`ContentView` 是一个结构体，它使用 `struct` 定义，用来组织页面相关的代码。

`View` 是一个协议，一个结构体如果想要成为 SwiftUI 视图，就需要遵循 `View` 协议。

`body` 是 `View` 协议要求我们提供的内容，它决定这个视图显示什么内容。

`some View` 表示返回某一种具体的视图，我们不需要写出它复杂的完整类型。

当视图代码变长时，我们可以使用 `var xxx: some View` 把视图代码拆分成多个小区域。

当某一块内容比较独立，或者需要复用时，我们可以创建新的视图结构体，并在其他视图中通过 `XxxView()` 显示它。

简单来说，SwiftUI 的界面就是由一个个视图组合起来的，一个页面可以包含多个小视图，一个小视图也可以继续包含其他视图。
