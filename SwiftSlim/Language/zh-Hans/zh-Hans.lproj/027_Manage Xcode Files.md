# 管理 Xcode 文件

这节课，我们来学习 Xcode 中常见的文件操作。

在前面的课程中，我们大部分代码都写在 `ContentView` 中。这样方便观察代码和显示效果。

例如：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

但是，在真实 App 中，通常不会把所有代码都写在一个文件里。

当页面、组件和功能越来越多时，我们需要把不同的视图拆分到不同的 SwiftUI 文件中。

例如：

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

这样可以让代码结构更清晰，也方便后续维护和修改。

## 为什么要管理文件

在 SwiftUI 中，一个页面或一个组件，通常都可以单独写成一个视图文件。

例如：

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

这里的 `CardView` 就是一个 SwiftUI 视图。

如果所有视图都写在 `ContentView` 中，代码会越来越长，也越来越难阅读。

所以，我们需要学会创建、重命名、删除文件，以及使用文件夹管理不同的代码文件。

## 创建 SwiftUI 文件

在 Xcode 中，创建 SwiftUI 文件常见有两种方式：

一种是创建空文件，然后自己写代码。

另一种是创建 SwiftUI 模板文件，由 Xcode 自动生成基础代码。

对于初学者，更推荐使用 SwiftUI 模板文件，因为它会自动生成基本结构。

### 创建空文件

在 Xcode 左侧的 Navigator 区域，右击空白位置或文件夹，选择 `New Empty File`。

操作位置如下：

![xcode](../../../Resource/027_view1.png)

创建空文件后，Xcode 通常会生成一个未命名的 Swift 文件，例如 `Untitled.swift`。

我们可以把它重命名为 `TestView.swift`。

在 SwiftUI 项目中，如果这个文件用来显示一个视图，通常建议在名称后面添加 `View`。

例如：

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

这不是强制规则，但可以让我们一眼看出这是一个视图文件。

创建空文件后，文件中可能只有默认注释，也可能是空白内容，具体取决于 Xcode 版本和创建方式。

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

这时，我们需要手动写入 SwiftUI 代码：

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

这样，一个简单的 SwiftUI 视图文件就创建完成了。

### 重命名文件

如果创建文件后，想要修改文件名，可以在 Xcode 左侧 Navigator 区域选择文件，然后按回车键 `⏎`。

![xcode](../../../Resource/027_view2.png)

这样就可以修改文件名。

需要注意的是，修改文件名不会自动修改代码中的视图名称。

例如，文件名改成 `ProfileView.swift` 后，代码中可能仍然是 `struct TestView: View`。

虽然这样不一定会导致报错，但容易让人混淆。

所以，建议让文件名和视图名称保持一致，例如文件名是 `ProfileView.swift`，视图名称也使用 `ProfileView`。

## 创建 SwiftUI 模板文件

除了创建空文件，我们也可以直接创建 SwiftUI 模板文件。

在 Xcode 左侧 Navigator 区域，右击空白位置或文件夹，选择 `New File from Template...`。

操作位置如下：

![xcode](../../../Resource/027_view3.png)

在弹出的窗口中，顶部可以选择不同平台，例如 `iOS`、`macOS` 等。

这里保持选择当前项目对应的平台即可。例如，我们正在创建 iOS App，就选择 `iOS`。

![xcode](../../../Resource/027_view4.png)

然后在下方选择 `SwiftUI View`。

![xcode](../../../Resource/027_view12.png)

然后点击 `Next`，输入文件名并保存。

例如，我们创建一个 `Test2View.swift`。

Xcode 会自动生成类似下面的代码：

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

和空文件相比，模板文件会自动包含 `import SwiftUI`、`struct`、`body` 和 `#Preview`。

所以对于初学者来说，使用 SwiftUI 模板文件更简单，也更不容易漏写代码。

**提示**：除了右击创建文件，也可以点击 Xcode 左侧 Navigator 底部的加号按钮，创建文件或文件夹。

![xcode](../../../Resource/027_view5.png)

## 创建文件夹

当文件越来越多时，我们可以使用文件夹进行管理。

在 Xcode 左侧 Navigator 区域，右击空白位置或文件夹，选择 `New Folder`。

创建文件夹后，可以把相关文件拖入文件夹中。

![xcode](../../../Resource/027_view7.png)

文件夹主要用于整理项目结构，不会改变视图本身的使用方式。

只要视图名称正确，在其他文件中仍然可以通过 `TestView()`、`Test2View()` 这样的方式使用。

## 删除文件或文件夹

如果想删除文件或文件夹，可以在 Xcode 左侧 Navigator 区域选择对应文件，然后右击选择 `Delete`。

也可以选择文件后，按删除键 `⌫`。

Xcode 会弹出删除确认窗口。

![xcode](../../../Resource/027_view10.png)

选择 `Move to Trash`，表示把文件移动到废纸篓中。

如果看到 `Remove Reference`，表示只从 Xcode 项目中移除引用，但不会删除磁盘上的原文件。

对于初学者，如果只是删除自己刚创建的普通文件，通常选择 `Move to Trash` 就可以。

## 显示多个 SwiftUI 视图

学会创建文件后，我们就可以把不同视图拆分到不同文件中。

例如，我们创建两个 SwiftUI 文件：

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` 用来显示作者名称：

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` 用来显示卡片背景：

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

然后，我们可以在 `ContentView` 中使用这两个视图：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

运行后，可以看到 `CardView` 和 `AuthorView` 被组合显示在一起：

![xcode](../../../Resource/027_view11.png)

在这个效果中，`CardView` 作为背景，`AuthorView` 显示在上方，这是因为它们被放在了 `ZStack` 中。

在 `ContentView` 中，我们通过 `CardView()` 和 `AuthorView()` 使用这两个视图，名称后面的 `()` 表示创建并使用这个视图。

这就是 SwiftUI 中常见的视图嵌套：一个视图中，可以继续使用其他视图。

## 入口文件

最后，我们再回顾一下 App 是从哪里开始显示界面的。

在 SwiftUI 项目中，通常会有一个入口文件：

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

这里的 `@main` 表示这是 App 的入口位置。

在 `WindowGroup` 中，我们看到：

```swift
ContentView()
```

这表示 App 启动后，首先显示 `ContentView`。

然后 `ContentView` 中又显示了：

```swift
ZStack {
    CardView()
    AuthorView()
}
```

所以视图层级可以理解为：

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

如果我们把入口文件中显示的视图改成 `CardView`：

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

那么 App 启动后，就只会显示 `CardView`。

也就是说，入口代码中的 `WindowGroup` 决定 App 启动后首先显示哪个视图。

而这个视图内部，又可以继续显示其他视图。

## 总结

这节课，我们学习了 Xcode 中常见的文件管理操作。

我们了解了如何创建 SwiftUI 文件、如何重命名文件、如何创建文件夹，以及如何删除文件。

同时，我们也学习了一个重要概念：SwiftUI 视图可以拆分到不同文件中，然后在其他视图中使用。

例如：

```swift
ZStack {
    CardView()
    AuthorView()
}
```

这里的 `CardView()` 和 `AuthorView()`，就是在 `ContentView` 中使用其他视图。

最后，我们还回顾了入口文件的显示逻辑。

App 启动时，会先进入带有 `@main` 标记的入口代码，然后显示 `WindowGroup` 中的视图。

这会帮助我们理解：不同 SwiftUI 文件并不是孤立的，它们可以互相组合，最终形成完整的 App 界面。
