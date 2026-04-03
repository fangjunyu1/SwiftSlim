# 补光灯

这节课，我们将制作一个非常有趣的补光灯 App。当夜晚来临时，我们可以让手机屏幕显示不同的颜色，并把它当作一个简单的补光灯使用。

这个补光灯 App 可以实现点击屏幕切换颜色，以及使用滑块调节亮度。

在这个例子中，我们将学习 `brightness` 调整视图亮度、`onTapGesture` 给视图添加点击手势以及 `Slider` 视图控件等知识点。

实现效果：

![Color](../../Resource/018_color.png)

## 显示颜色

首先，我们先让视图显示一种颜色。

在 SwiftUI 中，`Color` 不仅表示颜色，还可以作为一个视图显示：

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

这里的 `Color.red` 表示一个红色视图，`.ignoresSafeArea` 作用是将颜色视图铺满整个屏幕，这样看起来更像一个真正的补光灯效果。

实现效果：

![Color](../../Resource/018_color1.png)

### 颜色数组和索引

现在只显示一种颜色，但补光灯通常不止一种颜色。还可能显示蓝色、黄色、紫色、白色等颜色。

我们希望点击屏幕时，可以切换不同的颜色。可以把这些颜色放进数组中统一管理：

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

数组适合保存“一组同类型的数据”。这里数组中的每一个元素，都是一个 `Color`。

如果我们想显示某一个颜色，就可以使用索引：

```swift
colors[0]
```

这表示读取数组中索引为 `0` 的颜色，也就是第一个颜色。

现在代码可以写成：

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

这样屏幕上就会显示数组中的第一个颜色，也就是红色。

### 索引控制颜色

如果我们需要切换不同的颜色，就需要使用一个变量来管理索引，而不是把索引写死。

可以使用 `@State` 声明一个变量来保存索引：

```swift
@State private var index = 0
```

这里的 `index` 表示当前颜色的索引。

当 `index` 发生变化时，SwiftUI 会重新计算界面，并更新显示内容。

然后把原来的 `colors[0]` 改为：

```swift
colors[index]
```

这样，视图中显示的颜色就由 `index` 决定。

现在的代码变成：

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

当 `index` 改变时，`colors[index]` 也会跟着显示不同的颜色。

例如：

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

需要注意的是，`index` 不能超过数组的最大索引，否则会发生索引越界错误。

## 点击手势

现在我们可以根据 `index` 显示不同的颜色，但还不能点击切换。

在之前的“名言轮播”中，我们使用 `Button` 控制名言的切换。

而这一次，我们希望“点击整块颜色区域”来切换颜色，所以更适合使用 `onTapGesture`。

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

当我们点击颜色视图时，就会执行：

```swift
index += 1
```

这表示让 `index` 增加 `1`，索引增加后，`colors[index]` 就会显示数组中的下一个颜色。

### onTapGesture

`onTapGesture` 是一个手势修饰符，可以给视图添加点击操作。

基本用法：

```swift
.onTapGesture {
    // code
}
```

例如：

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

当点击这个红色视图时，就会执行花括号中的代码，并在控制台输出：

```swift
Click color
```

通过 `onTapGesture`，我们可以为一个视图设置点击后的行为。

### 和 `Button` 的区别

在前面我们学习过 `Button` 视图，`Button` 和 `onTapGesture` 都可以处理点击操作，但它们的使用场景并不完全一样。

`onTapGesture` 更适合“给已有视图添加点击功能”，例如 `Color`、`Image`、`Text` 或其他普通视图。

而 `Button` 更适合表示一个明确的按钮，例如"确认"、“提交”或者“删除”等按钮。

在这个补光灯 App 中，我们希望切换颜色功能更简单，点击整块颜色区域实现颜色的切换，就可以使用 `onTapGesture`。

## 索引问题

现在，我们可以点击屏幕切换不同的颜色。

但是这里存在一个重要的问题：**索引可能会超出数组范围**。

例如：

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

当不断点击屏幕时，`index` 最终会变成 `4`，这时就会引发“索引越界”的报错。

这是因为 `colors` 数组中有 `4` 个元素，但索引是从 `0` 开始计算的，所以合法索引范围是 `0 - 3`，没有 `4`。

如果访问 `colors[4]`，就会发生“索引越界”。

在当前代码中，每次点击屏幕，`index` 都会自动加 `1`，如果我们不做处理，最后就一定会超出范围。

所以，我们需要在点击屏幕时，对索引进行判断：如果是最后一个颜色，则回到第一个颜色，否则继续加 `1`。

可以使用 `if` 语句实现：

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

这段代码中，`colors.count` 表示数组元素的个数。

当前数组中有 4 个颜色，所以：

```swift
colors.count // 4
```

但最大索引不是 `4`，而是 `3`，因为索引从 `0` 开始。

所以最后一个索引要写成：

```swift
colors.count - 1
```

也就是：

```swift
4 - 1 = 3
```

这段逻辑表示，如果当前已经是最后一个颜色对应的索引，就把索引重置为 `0`，否则就让索引加 `1`。

这样，颜色就可以循环切换了。

### 优化索引

如果想要代码更简洁，还可以使用三元运算符：

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

这段代码表示，如果 `index == colors.count - 1` 成立，返回 `0`。如果不成立，返回 `index + 1`。

最后，再把这个结果赋值给 `index`。

现在，我们可以实现切换颜色的效果。

完整代码：

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

现在，我们可以点击屏幕并切换不同的颜色，一个基础的补光灯 App 就完成了。

## 显示颜色名称

我们可以再加一组与颜色对应的文字，这样在切换颜色时，屏幕上也会同步显示当前颜色的名称。

例如：

- 红色时显示 `Red`
- 蓝色时显示 `Blue`
- 黄色时显示 `Yellow`
- 紫色时显示 `Purple`

这里同样可以使用数组来保存颜色名称：

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

这个数组中的文字顺序，要和颜色数组的顺序一一对应。

然后我们就可以使用 `Text` 显示当前索引对应的颜色名称：

```swift
Text(colorsName[index])
```

`Text` 会根据 `index` 显示当前颜色名称。

使用修饰符优化 `Text` 的显示样式：

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

这样可以让 `Text` 以白色、大标题、字体加粗的形式显示。

现在，我们有一个全屏的 `Color` 视图，如果我们想要 `Text` 显示在 `Color` 视图上面，就需要使用 `ZStack` 布局容器叠加显示。

```swift
ZStack {
    Color
    Text
}
```

于是代码改成：

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

这样，背景是颜色视图，前面叠加显示一个文字视图。

实现效果：

![Color](../../Resource/018_color2.png)

需要注意的是，因为 `ZStack` 中，后写的视图通常会显示在前面。如果把 `Text` 写在 `Color` 前面，后面的 `Color` 视图就可能把 `Text` 覆盖掉。

## 控制亮度

现在我们可以切换不同的颜色，但补光灯还有一个重要的功能：**调整亮度**。

在 SwiftUI 中，可以使用 `brightness` 修饰符调整视图亮度。

例如：

```swift
.brightness(1)
```

我们可以这样写：

```swift
colors[index]
    .brightness(0.5)
```

这样当前颜色会变亮，看起来更接近补光灯的效果。

`brightness` 亮度范围为 `0 - 1`，`0` 表示保持原本颜色，越接近 `1` 颜色越亮，`1` 表示亮度最大的白色。

虽然，我们可以在代码中控制 `brightness` 的亮度，但是用户不能自己调节。

我们需要加入一个可以拖动的控件： `Slider`。

## 滑块视图 Slider

在 SwiftUI 中，`Slider` 是一个滑块控件，用来在一个范围内选择数值。Apple 文档将它描述为一个“在有界线性范围中选择值的控件”。

基本用法：

```swift
Slider(value: $value, in: 0...1)
```

参数解析：

1. `value: $value`：`Slider` 需要绑定一个变量。

    当滑块拖动时，变量值会同步修改。反过来，如果变量发生修改，滑块也会同步修改。

    和之前学过的 `TextField` 很像，都是“把控件和变量绑定起来”。
    
    绑定的变量前面需要添加 `$` 符号，以表示绑定。

2. `in: 0...1`：这个参数表示滑块的取值范围。

    这里的 `0...1` 表示：最小值是 `0`，最大值是 `1`。

    当滑块拖到最左边时，绑定变量接近 `0`；拖到最右边时，绑定变量接近 `1`。

例如：

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` 绑定 `value` 变量，当拖动滑块时，`value` 变量会同步修改。

显示样式：

![Slider](../../Resource/018_slider.png)

当 `Slider` 滑到左侧时，绑定的 `value` 值就会变为 `0`，滑到右侧则变成 `1`。

### 取值范围

`Slider` 的取值范围并不是固定的，也可以写成：

```swift
0...100
```

或者其他范围。

但在这个补光灯中，我们需要控制亮度，所以使用 `0...1` 最合适。

## 使用 Slider 控制亮度

现在，我们要把 `Slider` 和 `brightness` 连接起来。

首先，创建一个变量来保存亮度值：

```swift
@State private var slider = 0.0
```

这里的 `0.0` 是一个 `Double` 类型的值。

因为 `Slider` 绑定的通常是数值类型，而这里我们希望它能连续变化，所以使用 `Double` 更合适，此外 `brightness` 也只能接受 `Double` 类型的值。

然后把这个值传给 `brightness`：

```swift
colors[index]
    .brightness(slider)
```

当 `slider == 0` 时，颜色保持默认状态；当 `slider` 越接近 `1` 时，颜色看起来越亮。

### 添加 Slider 控件

接下来，添加一个 `Slider` 控件来修改这个变量：

```swift
Slider(value: $slider, in: 0...1)
```

当滑块发生变化时，`slider` 值也会发生变化，`brightness(slider)` 也会同步调整亮度。

这就是 SwiftUI 中非常典型的“变量驱动视图”。

### 调整 Slider 外观

默认情况下，`Slider` 会按可用空间显示宽度。

我们可以给它设置一个固定宽度：

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

接着再加上一些修饰，让它更容易看清：

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

这样滑块外面就有白色背景和圆角，可以在 `Color` 视图中看上去更明显。

最后，我们再把它放到屏幕底部。

因为前面已经使用了 `ZStack`，所以可以在其中再放一个 `VStack`，并通过 `Spacer()` 把 `Slider` 推到底部。

## 完整代码

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

实现效果：

![Color](../../Resource/018_color.png)

## 总结

我们运用之前学习的知识，以及颜色、数组等基础知识，制作了一个非常有趣的补光灯 App。

通过这个补光灯 App，我们学习了 `brightness` 调整亮度、`onTapGesure` 为视图添加点击操作，以及 `Slider` 视图控件。

我们为 `Color` 视图添加 `onTapGesure` 点击手势，并实现切换颜色的功能。通过 `Slider` 控件控制变量来管理 `brightness`，实现调整颜色亮度的功能，这也是“变量驱动视图”。

我们重温“三元运算符”、使用 `ZStack` 叠加显示视图，以及使用数组管理一组同类型数据的用法，加深对数组和索引的理解，在实际应用中考虑到索引越界的问题。

这个例子虽然不复杂， 但是把我们前面掌握的很多基础知识串联起来，实现一个真实的小项目，就会更容易理解它们各自的作用。

### 真实使用场景

试想一下，拿一个旧的 iPhone 放在桌前，使用自己开发的补光灯 App 控制补光灯的颜色，这是非常好的使用体验。

在 AppStore 中看到很多“补光灯”的 App，它们看上去也并不复杂。

![AppStore](../../Resource/018_appStore.PNG)

我们可以从简单的应用开始开发，并尝试上架到 AppStore，这不仅增加我们对开发的兴趣，也会记录我们的成长历程。

### 课后练习

你可以继续思考这个补光灯 App 的扩展方向，比如：

- 增加更多颜色
- 显示当前亮度数值
- 美化底部滑块区域

当你把这些基础知识真正用起来时，就会发现：我们学的每一个知识点，其实都是开发 App 的工具。

掌握的工具越多，能实现的功能也就越多。