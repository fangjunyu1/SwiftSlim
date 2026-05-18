# 自定义颜色

这节课，我们将学习如何在 SwiftUI 中自定义颜色。

在前面的课程中，我们已经使用过 SwiftUI 提供的默认颜色，例如：

```swift
Color.blue
Color.red
Color.green
```

这些颜色使用起来很方便，但在真实 App 开发中，默认颜色通常不够精确。

例如，设计图中可能会使用这样的颜色：

```text
#2c54c2
#4875ed
#213e8d
```

这种颜色叫做 Hex 颜色。

这节课，我们会先让 SwiftUI 支持 Hex 颜色，然后使用 `static` 把常用颜色整理起来。

最后，我们会把自定义颜色应用到动物百科视图中，并进一步使用渐变背景，让按钮看起来更有层次。

## 为什么需要自定义颜色？

在 SwiftUI 中，我们可以直接使用系统颜色。

例如：

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

这里的 `.blue` 表示蓝色，它其实是 `Color.blue` 的简化写法。

默认颜色的优点是简单、方便，但是颜色选择比较有限。

例如：

```swift
Color.blue
```

只能表示 SwiftUI 提供的默认蓝色。

![Color.blue](../../../Resource/031_color6.png)

但是在实际开发中，我们经常需要更具体的颜色。

例如，同样都是蓝色，也可能有浅蓝、深蓝、灰蓝、亮蓝等不同效果。

![More Blue](../../../Resource/031_color5.png)

这时，如果只使用 `Color.blue`，就很难还原设计效果。

所以，我们需要让 SwiftUI 支持自定义颜色。

## 什么是 Hex 颜色？

屏幕上的颜色通常由红、绿、蓝三个通道组成，也就是 RGB。

RGB 分别表示：

```text
Red     // 红色
Green   // 绿色
Blue    // 蓝色
```

Hex 颜色是 RGB 颜色的一种表示方式。

例如：

```swift
#5479FF
```

这个颜色值可以简单理解为三部分：

```text
54  // 表示红色通道
79  // 表示绿色通道
FF  // 表示蓝色通道
```

在这节课中，我们不需要计算这些数值，也不需要深入理解十六进制规则。

现在只需要知道：`#5479FF` 表示一个具体颜色。

以后当我们看到类似 `#2c54c2`、`#4875ed` 这样的写法时，就可以先把它理解为一种颜色值。

在 Sketch、Figma、Photoshop 等设计工具中，也经常能看到类似的颜色值。

![color](../../../Resource/031_color.png)

但是，SwiftUI 默认不能直接这样写：

```swift
Color(hex: "#5479FF")
```

所以，我们需要自己扩展 `Color` 类型，让它支持通过 Hex 字符串创建颜色。

## 创建 Color+Hex.swift 文件

首先，我们创建一个新的 Swift 文件。

文件名可以写成：

```text
Color.swift
```

也可以写成更清楚的：

```text
Color+Hex.swift
```

这里更推荐使用：

```text
Color+Hex.swift
```

在 Swift 项目中，类似 `Color+Hex.swift` 这样的文件名很常见。

它表示这个文件是给 `Color` 添加 Hex 能力的扩展文件。

文件名不会直接影响代码运行，只是为了让我们更容易理解这个文件的用途。

## 添加 Color(hex:) 代码

在 `Color+Hex.swift` 文件中，写入下面代码：

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

这段代码使用 `extension` 扩展了 `Color` 类型，并给 `Color` 添加了一个新的初始化方法：

```swift
init(hex: String)
```

有了这个初始化方法之后，我们就可以把 Hex 字符串传给 `Color`，从而创建一个自定义颜色：

```swift
Color(hex: "#5479FF")
```

这段扩展代码内部会把 Hex 字符串转换成 SwiftUI 可以识别的 RGB 颜色。

现阶段不需要深入理解每一行转换逻辑，只需要了解添加的 `Color(hex:)` 方法，可以让我们通过 Hex 颜色值创建自定义颜色。

## 使用自定义颜色

现在，我们可以在 `ContentView` 中测试自定义颜色。

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

显示效果：

![color](../../../Resource/031_color1.png)

在这个例子中，第一行使用的是系统颜色：

```swift
.foregroundStyle(Color.blue)
```

后面三行使用的是自定义 Hex 颜色：

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

通过对比可以发现，系统蓝色只有一种默认效果。

而 Hex 颜色可以表示更细致的蓝色变化。

这就是自定义颜色的价值：它可以让界面的颜色更接近真实设计，也更方便我们控制 App 的视觉风格。

## 使用 static 整理颜色

现在，我们已经可以通过 Hex 字符串创建颜色：

```swift
Color(hex: "#2c54c2")
```

这种写法可以正常使用，但如果同一个颜色会在多个地方重复出现，后期维护就不太方便。

如果在 10 个地方都写了这个颜色值，以后想修改这个蓝色，就需要逐个修改。

这时，我们可以使用 `static` 把常用颜色统一整理起来。

在 `Color+Hex.swift` 文件底部，继续添加下面代码：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

这里，我们给 `Color` 添加了三个静态属性：`animalBlue`、`animalLightBlue` 和 `animalDarkBlue`，它们分别表示不同深浅的蓝色。

因为这些属性使用了 `static`，所以它们属于 `Color` 类型本身。

使用时，可以直接通过 `Color.` 访问：

```swift
Color.animalBlue
```

这种写法比直接写 Hex 字符串更清楚。

当我们看到 `Color.animalBlue` 时，我们可以知道它表示动物百科中使用的蓝色。

而看到 `Color(hex: "#2c54c2")` 时，只能知道它是一个颜色值，但不容易看出它的具体用途。

统一管理颜色还有一个好处：后期修改更方便。

如果想调整动物百科的主色，只需要修改定义位置：

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

所有使用这个颜色的地方都会一起更新。

这就是使用 `static` 整理颜色的意义：让颜色名称更清楚，也让后期维护更方便。

## 应用到动物百科

现在，我们可以把自定义颜色应用到前面的动物百科视图中。

之前动物按钮背景为白色：

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

现在，我们可以改成自定义颜色：

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

这里的 `Color.animalBlue` 就是我们刚才在 `Color+Hex.swift` 中定义的静态颜色。

按钮文字使用白色：

```swift
.foregroundStyle(Color.white)
```

动物 emoji 的背景使用半透明白色：

```swift
.background(Color.white.opacity(0.15))
```

这样按钮会形成一个统一的蓝色视觉风格。

这一步的重点不是增加复杂代码，而是把前面学到的自定义颜色真正应用到界面中。

## 使用渐变背景

除了使用单一颜色，我们还可以把多个颜色组合成渐变效果。

例如，我们前面定义了这些颜色：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

这些颜色不仅可以单独使用，也可以组合成渐变背景。

在 SwiftUI 中，可以使用 `LinearGradient` 创建线性渐变。

例如：

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

这段代码会创建一个从左到右的渐变背景，颜色从 `Color.animalBlue` 逐渐过渡到 `Color.animalLightBlue`。

其中，`colors` 用来设置参与渐变的颜色，`startPoint` 和 `endPoint` 用来控制渐变方向。

### 测试渐变效果

我们可以用一个简单的 Text 测试渐变背景。

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

显示效果：

![color](../../../Resource/031_color3.png)

在这个例子中，`Text` 的背景不再是单一颜色，而是从左到右逐渐变化的渐变色。

相比普通背景色，渐变背景会更有层次，也更容易让界面产生视觉重点。

## 在动物百科中使用渐变背景

现在，我们可以把动物按钮的背景颜色：

```swift
.background(Color.animalBlue)
```

修改为渐变背景：

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

完整代码如下：

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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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

显示效果：

![color](../../../Resource/031_color4.png)

现在，动物按钮不再只是单一背景色，而是拥有了从左到右的渐变效果。

相比单色背景，渐变背景可以让界面看起来更有层次，也更接近真实 App 中的视觉设计。

## 单色背景和渐变背景的区别

单色背景只使用一个颜色。

例如：

```swift
.background(Color.animalBlue)
```

这种写法简单、清楚，适合大部分基础界面。

渐变背景会使用多个颜色。

例如：

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

这种写法可以让界面更有层次，但也更容易增加视觉复杂度。

所以，在实际开发中，可以这样理解：

单色背景适合普通文字、普通按钮、普通卡片、普通页面背景。

渐变背景适合重点按钮、顶部区域、封面卡片、功能入口等需要强调的位置。

## 总结

这节课，我们学习了如何在 SwiftUI 中使用自定义颜色。

首先，我们了解了 Hex 颜色。

例如：

```text
#2c54c2
```

它表示一个具体颜色。

然后，我们使用 `extension Color` 扩展了 `Color` 类型。

让 SwiftUI 可以通过下面的方式创建颜色：

```swift
Color(hex: "#2c54c2")
```

接着，我们使用 `static` 整理常用颜色：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

这样，在其他视图中就可以直接使用：

```swift
Color.animalBlue
```

相比每次都写 Hex 字符串，这种方式更清楚，也更方便后期统一修改颜色。

最后，我们学习了 `LinearGradient`，并把自定义颜色组合成渐变背景：

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

通过这节课，我们完成了从“创建自定义颜色”到“在真实界面中使用颜色”的过程。

以后，当一个颜色需要在多个地方重复使用时，可以优先考虑把它整理到 `Color` 扩展中。

这样代码会更清楚，界面风格也更容易统一。