# 外观适配

这一节课，我们学习浅色模式和深色模式的外观适配。

在 iPhone、iPad 和 Mac 上，用户可以选择浅色模式，也可以选择深色模式。

当系统切换为深色模式时，很多 App 的背景、文字和图标颜色也会跟着变化。

例如，白天界面可能是浅色背景，夜晚界面可能变成深色背景。

![view](../../../Resource/025_view9.png)

这种根据系统外观自动调整界面显示的能力，就叫做外观适配。

## Xcode 预览外观适配

在学习外观适配之前，我们先了解如何在 Xcode 中预览浅色模式和深色模式。

在 `Canvas` 区域底部，点击 `Device Settings` 按钮，可以打开 `Canvas Device Settings` 弹窗。

![canvas](../../../Resource/025_view.png)

在弹窗中可以看到 `Color Scheme` 设置。

![canvas1](../../../Resource/025_view1.png)

其中：

- `Light Appearance` 表示浅色模式。
- `Dark Appearance` 表示深色模式。

我们可以通过这里切换预览外观，查看当前界面在浅色模式和深色模式下的显示效果。

## 并列显示两种外观

如果想要同时查看浅色模式和深色模式，可以使用 `Variants` 功能。

在 `Canvas` 区域底部，点击 `Variants` 按钮，选择 `Color Scheme Variants`。

![canvas2](../../../Resource/025_view2.png)

选择后，`Canvas` 会同时显示浅色模式和深色模式的预览效果。

![canvas3](../../../Resource/025_view3.png)

这样可以更方便地对比两种外观下的界面差异。

简单来说：

如果只想临时切换浅色/深色模式，可以使用 `Canvas Device Settings`。

如果想同时查看两种外观，可以使用 `Color Scheme Variants`。

## 视图默认会适配外观

在 SwiftUI 中，很多系统视图默认会自动适配浅色模式和深色模式。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Light")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

显示效果：

![canvas](../../../Resource/025_view4.png)

可以看到，在浅色模式中，图标和标题通常显示为深色。

在深色模式中，图标和标题会自动变成浅色。

这是因为 `Text`、`Image` 等 SwiftUI 视图默认会根据系统外观调整颜色。

也就是说，如果我们不手动指定固定颜色，SwiftUI 会帮我们处理一部分外观适配。

## 固定颜色不会自动互换

需要注意的是，如果我们手动指定了固定颜色，它就不会根据浅色/深色模式自动互换。

例如：

```swift
Text("some some some")
	.foregroundStyle(Color.gray)
```

这里的文字被指定为 `Color.gray`，所以它会一直显示为灰色。

再比如：

```swift
Text("Title")
    .foregroundStyle(Color.white)
```

这段代码无论在浅色模式还是深色模式中，都会显示白色文字。

如果背景也是浅色，白色文字就可能看不清楚。

所以在做外观适配时，要尽量避免随意写死 `Color.white`、`Color.black` 这类固定颜色。

在很多情况下，可以优先使用系统语义样式，例如：

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

其中：

- `.primary` 通常用于主要内容。
- `.secondary` 通常用于次要内容。

它们会根据浅色/深色模式自动调整显示效果。

## 根据外观显示不同内容

有时，我们不仅希望颜色发生变化，还希望不同外观下显示不同的内容。

例如：

- 浅色模式中显示普通灯泡图标。
- 深色模式中显示发亮的灯泡图标。
- 浅色模式中标题显示 `Light`。
- 深色模式中标题显示 `Dark`。

这时，就需要判断当前系统处于浅色模式还是深色模式。

在 SwiftUI 中，可以通过 `colorScheme` 环境值获取当前外观模式：

```swift
@Environment(\.colorScheme) private var colorScheme
```

完整代码：

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Light" : "Dark"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

显示效果：

![view](../../../Resource/025_view5.png)

从预览效果可以看到，同一个视图在不同外观模式下，显示的内容并不完全一样。

在浅色模式中，`Image` 显示的是普通灯泡图标，标题显示为 `Light`。

在深色模式中，`Image` 显示的是发亮的灯泡图标，标题显示为 `Dark`。

也就是说，这里的变化不只是颜色发生了变化，而是图标名称和标题文字本身也发生了变化。

这是因为我们没有把图标和标题直接写死在 `body` 中，而是根据 `colorScheme` 计算出不同的内容。

在这段代码中，我们使用了两个计算属性：

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

当 `colorScheme` 是 `.light` 时，说明当前是浅色模式。

当 `colorScheme` 是 `.dark` 时，说明当前是深色模式。

所以我们可以根据不同的外观模式，返回不同的图标名称和标题文字。

这也是计算属性的一个常见用途：根据当前状态，计算出视图需要显示的内容。

## 理解 @Environment

这是我们第一次接触 `@Environment`。

`@Environment` 可以理解为：从 SwiftUI 的环境中读取一个值。

App 运行时，系统会提供很多环境信息，例如：

- 当前语言
- 当前外观模式
- 当前布局方向
- 当前字体大小设置

当我们需要获取当前外观模式时，就可以读取 `colorScheme`：

```swift
@Environment(\.colorScheme) private var colorScheme
```

其中

```swift
\.colorScheme
```

表示从环境中读取 `colorScheme` 这个值。

```swift
private var colorScheme
```

表示把读取到的值保存到 `colorScheme` 这个变量中。

变量名称可以自己决定，例如也可以写成：

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

只要前面的 `\.colorScheme` 不变，就表示读取的是当前外观模式。

## colorScheme 的两个常见值

`colorScheme` 常见有两个值：

```swift
.light
.dark
```

它们表示：

- `.light`：浅色模式
- `.dark`：深色模式

例如：

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

这段代码的意思是：

如果当前是浅色模式，`colorScheme == .light` 成立，就返回 `"Light"`。

否则，就返回 `"Dark"`。

所以，在浅色模式中：

```swift
Text(titleName)
```

显示的是：

```swift
Light
```

在深色模式中，显示的是：

```swift
Dark
```

通过这种方式，我们就可以根据不同外观显示不同的内容。

## 颜色适配示例

除了文字和图标，有时候我们还需要自己处理颜色适配。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

显示效果：

![view](../../../Resource/025_view6.png)

这段代码中，文字是白色，背景是黑色。

在浅色模式中，黑色背景比较明显。

但是在深色模式中，如果整个界面背景也是黑色，这个黑色背景就会融入到系统背景里，看起来不够清楚。

这时，我们可以根据外观模式切换文字颜色和背景颜色：

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

显示效果：

![view](../../../Resource/025_view7.png)

现在，浅色模式中是黑色背景、白色文字。

深色模式中是白色背景、黑色文字。

这样无论在哪种外观下，文字和背景都有明显对比，用户都可以清楚地看到内容。

## 使用 Assets 适配颜色

除了使用 `colorScheme` 手动判断，我们还可以使用 `Assets` 资源颜色来适配浅色/深色模式。

这种方式更适合管理 App 中通用的颜色。

在 Xcode 项目中，找到 `Assets` 资源文件夹。

![assets](../../../Resource/025_color.png)

打开 `Assets` 文件夹，右击空白区域，选择 `New Color Set`，创建一个新的颜色资源。

![assets](../../../Resource/025_color1.png)

这里我们创建一个颜色，并命名为 `redText`。

![assets](../../../Resource/025_color2.png)

颜色资源可以分别设置浅色模式和深色模式下的颜色。

![assets](../../../Resource/025_color3.png)

选择对应的颜色区域后，可以在右侧属性检查器中修改颜色。

点击右上角的 `Hide or show the Inspectors` 按钮，打开检查器区域。

然后选择 `Show the Attributes inspector`，在底部找到 `Show Color Panel`，打开颜色面板。

![assets](../../../Resource/025_color4.png)

点击颜色面板中的颜色，`redText` 对应的颜色区域同步发生变化。

这里我们将 `redText` 设置为：

- 浅色模式显示红色
- 深色模式显示绿色

![assets](../../../Resource/025_color5.png)

回到 SwiftUI 代码中，可以这样使用这个颜色：

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

其中：

```swift
Color("redText")
```

表示从 `Assets` 中读取名为 `redText` 的颜色资源。

显示效果：

![assets](../../../Resource/025_view8.png)

可以看到，同一个 `Color("redText")`，在浅色模式和深色模式中会显示不同的颜色。

这说明 `Assets` 颜色本身也支持外观适配。

## colorScheme 和 Assets 的区别

`colorScheme` 和 `Assets` 都可以实现外观适配，但它们适合的场景不同。

如果只是根据浅色/深色模式切换文字内容、图片名称或 `SF Symbols` 名称，可以使用 `colorScheme`。

例如：

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

如果是 App 中经常使用的颜色，例如主题色、卡片背景色、文字颜色，更推荐使用 `Assets` 颜色。

因为 `Assets` 颜色可以在多个视图中复用，后期修改也更方便。

例如：

```swift
Color("redText")
```

这样只需要在 `Assets` 中修改颜色，使用这个颜色的地方都会一起变化。

## 总结

这一节课，我们学习了浅色模式和深色模式的外观适配。

首先，我们学习了如何在 Xcode 的 `Canvas` 中预览不同外观，也学习了如何使用 `Color Scheme Variants` 同时查看浅色模式和深色模式。

然后，我们了解了 SwiftUI 中的 `Text`、`Image` 等视图默认会根据系统外观自动适配颜色。

但是，如果手动指定了固定颜色，例如 `Color.white` 或 `Color.black`，这些颜色就不会自动互换。

接着，我们学习了 `@Environment` 和 `colorScheme`：

```swift
@Environment(\.colorScheme) private var colorScheme
```

通过 `colorScheme`，我们可以判断当前是浅色模式还是深色模式，并根据不同外观显示不同的图标、文字或颜色。

最后，我们学习了 `Assets` 颜色。

`Assets` 颜色可以分别设置浅色模式和深色模式下的颜色，适合管理 App 中通用的颜色资源。

外观适配可以让 App 在白天和夜晚都有更好的显示效果，也可以避免文字看不清、背景不明显等问题。

在实际开发中，建议优先使用 SwiftUI 默认的适配能力和 `Assets` 颜色。

当不同外观下需要切换文字、图标、图片，或者处理少量特殊显示效果时，再使用 `colorScheme` 进行判断。

## 扩展知识：指定字体大小

之前学习 `font` 时，我们使用过一些系统字体样式：

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

除了使用 `.largeTitle`、`.callout` 这类系统字体样式，也可以手动指定字体大小。

例如：

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

这里的：

```swift
.font(.system(size: 100))
```

表示将字体大小设置为 `100 pt`。

对于 `SF Symbols` 图标来说，`font` 也会影响图标大小。

所以，如果想让图标显示得更大，可以通过 `.font(.system(size:))` 指定大小。

例如：

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

需要注意的是，手动指定字体大小虽然更灵活，但普通文字不建议大量使用固定字号。

普通文字优先使用 `.title`、`.headline`、`.body`、`.caption` 等系统字体样式。

这样可以更好地适配不同设备和用户的字体设置。
