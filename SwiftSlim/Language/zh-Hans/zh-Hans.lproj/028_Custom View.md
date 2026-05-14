# 自定义视图

这节课，我们学习一个非常重要的 SwiftUI 写法：**自定义视图**。

自定义视图可以把一段重复的视图代码封装起来，让它变成一个可以反复使用的视图。

在实际开发 App 时，我们经常会遇到这种情况：很多界面的结构是一样的，只是显示的内容不同。

比如论坛网站的帖子列表，每一条帖子可能都有标题、图片、点赞数量等信息。

![Reddit](../../../Resource/028_view1.png)

购物网站的商品列表，每一个商品可能都有图片、名称和价格等信息。

![Amazon](../../../Resource/028_view2.png)

这些内容的结构是类似的，区别只是显示的数据不同。

如果每一项都手动写一遍代码，代码会变得很长，也不方便后续修改。

所以，我们可以把相同的结构封装成一个自定义视图，然后把不同的内容作为参数传进去。

这样，同一个视图就可以显示不同的内容。

## 需求场景

例如，我们现在要制作一个设置列表。

显示效果：

![view](../../../Resource/028_view.png)

这个设置列表中，有三个不同的设置项，分别是 `Settings`、`Folder`、`Music`。

虽然它们的图标、颜色和标题不同，但是整体结构是一样的：

- 左侧图标
- 图标背景颜色
- 中间标题
- 右侧箭头

如果不用自定义视图，我们可能会这样写：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Settings")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Folder")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Music")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

这段代码可以正常显示，但是问题也很明显：三个设置项的代码几乎完全一样。

不同的地方只有图标、颜色和标题：

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Settings")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Music")
```

也就是说，每个设置项的结构是固定的，只有图标、颜色和标题不同。

这种情况就非常适合使用自定义视图。

### 阴影 shadow

这里使用了一个新的修饰符 `.shadow(radius:)`：

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` 可以给视图添加阴影。

`radius` 表示阴影的模糊半径，数值越大，阴影扩散范围通常越大，看起来也会更柔和。

在这里设置为 `1`，表示只添加一个很轻微的阴影效果。

## 封装设置项视图

接下来，我们把每一个设置项封装成一个新的视图。

可以创建一个 `SettingItemView`：

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

在这个视图中，我们定义了三个属性：

```swift
let icon: String
let color: Color
let title: String
```

其中：

- `icon` 表示图标名称
- `color` 表示图标背景颜色
- `title` 表示设置项标题

因为这三个内容在不同设置项中是不一样的，所以我们把它们做成可以从外部传入的参数。

## 使用自定义视图

有了 `SettingItemView` 之后，我们就不需要重复写一大段 `HStack` 代码了。

现在可以这样使用：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

这行代码表示创建一个设置项视图，并传入三个参数：

```swift
icon: "gear"
color: Color.blue
title: "Settings"
```

传入后，`SettingItemView` 内部的属性会得到对应的值：

- `icon` 的值是 `gear`
- `color` 的值是 `Color.blue`
- `title` 的值是 `"Settings"`

因此，视图内部的 `Image(systemName: icon)` 会显示齿轮图标，`.background(color)` 会使用蓝色背景，`Text(title)` 会显示 `Settings`。

完整代码：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Settings")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

显示效果：

![view](../../../Resource/028_view.png)

可以看到，封装之后的显示效果和之前一样，但是代码变得更清晰了。

原来每个设置项都要写一整段 `HStack`，现在只需要一行代码：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

这就是自定义视图的作用：**把重复的视图结构封装起来，只把不同的内容作为参数传入。**

## 为什么可以传递参数

接下来，我们简单理解一下，为什么自定义视图可以传递参数。

在 SwiftUI 中，视图本质上是一个结构体。

例如：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

这里的 `ContentView` 是一个结构体。

当我们写：

```swift
ContentView()
```

其实就是在创建一个 `ContentView` 视图。

后面的 `()` 表示调用它的初始化方法，也可以理解为创建这个视图。

因为这个 `ContentView` 没有需要从外部传入的属性，所以可以直接写：

```swift
ContentView()
```

但是，如果视图中有未赋值的属性，就需要在创建视图时传入对应的值。

例如：

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

这里的 `name` 是一个属性，并且没有默认值。

所以创建 `ContentView` 时，必须给 `name` 一个具体的值：

```swift
ContentView(name: "Fang Junyu")
```

这样，视图内部才能使用这个值：

```swift
Text("name: \(name)")
```

这也是我们创建 `SettingItemView` 时需要传入参数的原因：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

因为 `SettingItemView` 中有三个没有默认值的属性：

```swift
let icon: String
let color: Color
let title: String
```

所以创建这个视图时，就需要把它们传进去。传进去的参数，会被 Swift 用来给视图内部的属性赋值。

## 初始化方法

接下来，我们再进一步理解初始化方法。

### 默认初始化方法

当我们定义一个普通视图时：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

在这段代码中，我们没有手动写初始化方法。

但是，当我们使用这个视图时，可以这样写：

```swift
ContentView()
```

这里的 `()` 其实就表示在创建 `ContentView`，也可以理解为调用它的初始化方法。

### 为什么没有初始化方法，仍然可以调用？

因为 Swift 编译器会自动帮我们生成一个初始化方法。

需要注意的是，**这个初始化方法是自动生成的，我们通常不会在代码中直接看到它。**

也就是说，虽然我们没有在 `struct` 中手动写：

```swift
init() {

}
```

但是 Swift 编译器会在背后帮我们生成一个类似这样的初始化方法：

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hello, World!")
    }
}
```

这就是为什么我们可以直接写：

```swift
ContentView()
```

因此，在实际代码中，我们通常不需要手动把初始化方法写出来。

只需要理解一点：**创建 SwiftUI 视图时，会调用视图的初始化方法。即使我们没有手动写初始化方法，Swift 也可能会自动帮我们生成。**

### 带参数的初始化方法

如果视图中有一个没有默认值的属性，例如：

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

Swift 编译器会根据属性，自动生成一个带参数的初始化方法。

可以简单理解为：

```swift
init(name: String) {
    self.name = name
}
```

这里的：

```swift
init(name: String)
```

表示创建 `ContentView` 时，需要传入一个 `String` 类型的 `name` 参数。

当我们写：

```swift
ContentView(name: "Fang Junyu")
```

意思是：把 `"Fang Junyu"` 作为参数传给初始化方法。

然后初始化方法内部会执行：

```swift
self.name = name
```

这行代码的意思是：把外面传进来的 `name`，赋值给当前视图自己的 `name` 属性。

可以简单理解为：

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("name: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

这样，视图内部就可以使用传进来的值了。

这就是带参数视图的初始化流程：**当视图内的属性没有默认值时，创建视图时就需要传入对应参数，让初始化方法完成属性赋值。**

## 属性有默认值的情况

如果属性已经有默认值，那么创建视图时可以不传参数。

例如：

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("name: \(name)")
    }
}
```

这里的 `name` 已经有一个默认值：

```swift
"Fang Junyu"
```

所以创建 `ContentView` 时，可以直接写：

```swift
ContentView()
```

这时，`name` 会使用默认值，界面显示：

```swift
name: Fang Junyu
```

当然，也可以在创建视图时传入一个新的值：

```swift
ContentView(name: "Sam")
```

这时，视图会使用外部传入的 `"Sam"`，而不是使用默认值，界面显示：

```swift
name: Sam
```

为了方便理解，可以把 Swift 编译器自动生成的初始化方法简单看成这样：

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

这里的 `name: String = "Fang Junyu"` 表示：如果创建视图时没有传入 `name`，就使用默认值 `"Fang Junyu"`；如果创建视图时传入了新的 `name`，就使用传入的值。

也就是说：**如果外部没有传入参数，就使用属性的默认值；如果外部传入了参数，就使用传入的值。**

## 回到 SettingItemView

现在我们再回来看 SettingItemView：

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

这个视图的结构是固定的。

固定的部分包括：

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

不同的部分包括：

```swift
icon
color
title
```

所以，我们把不同的内容做成属性，并在创建视图时通过参数传入。

当我们创建不同的设置项时，只需要传入不同的参数：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
```

这样，同一个 `SettingItemView` 就可以显示三个不同的设置项。

这就是自定义视图最常见的使用方式。

## 总结

这节课，我们学习了自定义视图。

自定义视图的核心作用是：**把重复的视图代码封装起来，让它可以复用。**

在这个案例中，三个设置项的结构是相同的，只有图标、颜色和标题不同。

所以我们创建了一个 `SettingItemView`：

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

然后，在使用这个视图时传入不同的参数：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

这里的参数会进入 `SettingItemView` 内部。

通过这种方式，我们就可以用更少的代码，创建结构相同但内容不同的视图。

这也是 SwiftUI 开发中非常常见的一种写法。
