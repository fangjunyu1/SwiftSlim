# 绚丽的颜色

本节课我们将学习 SwiftUI 中常见的视觉修饰符，包括：

- 颜色
- 前景色
- 背景色
- 偏移
- 透明度
- 模糊

还会学习 Safe Area（安全区域）。

这些修饰符用于控制视图的外观表现，使界面更加清晰、有层次。

## 颜色

在 SwiftUI 中，可以设置文字的颜色。

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue 表示蓝色，实际上是 Color.blue 的简化写法（类型推断）。

常见颜色包括：

```
.black
.green
.yellow
.pink
.gray
...
```

这些都是 Color 的静态属性。

![Color](006_color.png)

可以把 Color 理解为颜色类型，.blue、.red 都是它的具体颜色。

### Color 视图

在 SwiftUI 中，Color 也可以作为视图显示。

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](006_color5.png)

这段代码会生成一个 100×100 的红色方块。

也可以让整个界面显示为某种颜色：

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](006_color1.png)

运行后，可以看到红色并没有铺满整个屏幕，iPhone 顶部和底部仍然是白色，这里涉及 Safe Area（安全区域）的存在。

## Safe Area（安全区域）

Safe Area 是系统为避免内容被遮挡而预留的区域，包括：

1. 顶部的状态栏（时间、电量）

2. 底部的 Home 指示条

3. 刘海（notch）或灵动岛（Dynamic Island）区域

![Color](006_color3.png)

SwiftUI 默认会将内容限制在安全区域内，因此视图不会延伸到屏幕边缘。

### 忽略 Safe Area（安全区域）

如果想要颜色铺满整个屏幕，可以使用 ignoresSafeArea：

```swift
Color.red
    .ignoresSafeArea()
```

或者使用 edgesIgnoringSafeArea：

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](006_color4.png)

这样视图就会延伸到整块屏幕。

需要注意的是，edgesIgnoringSafeArea 是较早的写法，从 iOS 14 开始，推荐使用 ignoresSafeArea。

## 前景色

### foregroundStyle 修饰符

在之前的课程中，学习过 foregroundStyle 设置颜色。

例如：

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle 是新的样式系统，支持颜色、渐变、材质等。

![Color](006_color2.png)

### foregroundColor 修饰符

foregroundColor 也可以设置颜色:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

和 foregroundStyle 的使用方式一样。

在最新的 Xcode 版本中，Xcode 会提示 foregroundColor 可能会在未来的 iOS 版本中弃用，建议优先使用 foregroundStyle。

## 背景

如果想要给视图添加背景色，可以使用 background：

```swift
background(.red)
```

例如，给文字添加背景色：

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](006_color6.png)

我们在 Word、Chrome 等 App 中选择文字时，可以看到类似的背景色效果。

![Color](006_color16.png)

如果想要扩大背景，需要配合 padding：

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](006_color7.png)

这里要注意一个重要规则：

SwiftUI 修饰符是从上到下构建视图的。写在后面的修饰符，会作用在前面的结果上。

所以：

```swift
.padding()
.background()
```

这表示背景会包裹添加内边距之后的视图。

如果顺序写反：

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](006_color6.png)

背景不会扩大，因为背景没有包裹后面的 padding。

## 示例 - 四角螺母

现在，我们制作一个简单的四角螺母视图。

![Color](006_color8.png)

先制作一个 50 × 50 的白色方块：

```swift
Color.white
    .frame(width: 50, height: 50)
```

如果想要变成圆形，可以使用 cornerRadius：

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

当圆角半径等于宽高的一半时，就会变成圆形。

现在，添加一个蓝色的背景：

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](006_color8.png)

新增的 padding 会扩大外层区域，background 会在外层区域上绘制蓝色。

现在就完成了一个四角螺母的效果。

### 另一种思路

除了使用背景色完成四角螺母，也可以使用 ZStack 实现。

前面学过 ZStack 可以实现叠加排序，四角螺母也可以理解为一个圆形和一个矩形叠加显示。

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](006_color8.png)

ZStack 会将视图按顺序叠加，后添加的视图显示在上层。

## 示例 - 两个重叠的圆

很多图标都是由简单图形叠加而成，例如两个重叠的圆。

![Color](006_color14.png)

首先，创建两个圆：

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](006_color11.png)

因为需要让两个圆叠加显示，所以使用 ZStack 布局：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](006_color12.png)

此时，两个大小相等的圆完全重叠。

我们需要让两个圆部分重叠，而不是完全覆盖，可以使用 offset 制造偏移效果。

## 偏移

offset 只改变视图的绘制位置，不影响父视图的布局计算。

使用方法：

```swift
.offset(x:y:)
```

x 为水平方向的偏移量，y 为垂直方向的偏移量。

正值表示向右/向下偏移，负值表示向左/向上偏移。

使用 offset 设置两个圆部分重叠：

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](006_color13.png)

红色圆在布局中的位置没有发生变化，但其绘制位置向左移动了 25 点。因此两个圆产生了部分重叠的视觉效果。

## 透明度

在 SwiftUI 中，opacity 用于设置视图的透明度。

基本用法：

```swift
.opacity(0.5)
```

opacity 的参数范围为 0.0 到 1.0，其中：

- 0 表示完全透明
- 1 表示不透明

可以使用 opacity 设置橙色圆的透明度：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](006_color14.png)

将橙色圆的 opacity 设置为 0.8 后，其不透明度为 80%，当两个圆发生重叠时，重叠区域会产生颜色混合效果。

## 模糊

在 SwiftUI 中，可以使用 blur 设置模糊效果：

```swift
.blur(radius:10)
```

radius 定义模糊的半径，数值越大，模糊效果越明显。

我们可以给两个圆添加模糊效果：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](006_color15.png)

最终，我们可以看到两个非常模糊的圆。

## 总结

本节课围绕 SwiftUI 中常见的视觉修饰符展开，学习了如何通过修饰符控制视图的颜色、位置以及视觉效果。

通过具体示例，可以看到不同视觉修饰符在界面中的实际作用，了解了安全区域的知识。

这些都是非常基础的修饰符，我们可以多加练习和使用，有助于在实际开发中更清晰地控制界面的效果。

### 课后练习

- 给一张图片添加透明和模糊效果
- 设置三个不同透明度叠加的圆形
- 创建一个铺满屏幕的背景图片，并忽略安全区域
- 使用 offset 调整多个视图的位置

练习的目的不是记住 API，而是观察视觉变化与布局行为之间的关系。
