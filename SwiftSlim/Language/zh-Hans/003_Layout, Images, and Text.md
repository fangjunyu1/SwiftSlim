# 布局、图片和文字

上一节课，我们学习了 ContentView 代码：

```
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

我们这节课，我们将学习 SwiftUI 的默认布局机制，以及图片和文字的使用方法。在上一节课的基础上，我们将进一步理解视图的结构和显示方式，这些知识可以支持我们构建基本的界面布局。

## SwiftUI 的默认布局机制

预览 ContentView 视图时，我们会发现图标和文字居中显示，而不是从顶部开始排列。

![Swift](003_view.png)

SwiftUI 在默认布局规则下居中显示，对齐方式是 center。

### Alignment 对齐方式

很明显居中对齐只是对齐方式的一种，如果我们想要左对齐或者右对齐，就需要使用 alignment 控制视图的对齐方式。

```
alignment
```

在 SwiftUI 中，对齐通常出现在两种场景中：

**1. Stack 容器的对齐参数**

例如，ContentView 中的图标和文字左对齐：

```
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](003_alignment.png)

VStack 的 alignment 控制水平方向的对齐方式。

对齐方式：

```
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](003_alignment1.png)

HStack 是水平排序，alignment 控制垂直方向的对齐方式：

```
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](003_alignment2.png)

ZStack 是叠加排序，alignment 可以控制水平或垂直方向的对齐方式：

```
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

如果不显式指定 alignment，VStack、HStack 和 ZStack 默认为 .center。

**2. frame 内部的 alignment**

```
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

当 frame 提供的尺寸大于视图的自身尺寸时，alignment 决定视图在 frame 内部的定位。frame 的具体用法将在后面继续讲解，这里先简单了解一下。

### Spacer 与空间分配机制

alignment 可以让视图按照水平或垂直方向排序显示。但是，当我们想要文字和图片显示在两端，单一的对齐方式则不能满足我们的需求。

例如，当我们想要实现一个 [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) 网站的顶部视图，左侧为 NHK 网站图标，右侧为站内目录图标。

![Swift](003_alignment3.png)

如果我们只使用 alignment，NHK 网站图标和站内目录图标都只会显示在一侧。无法将两个图标分布在左右两侧，因此需要 Spacer 分配剩余空间。

Spacer 是一个用于布局的弹性视图，可以自动填充剩余空间。

使用方法：

```
Spacer()
```

例如：

```
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

当我们在 Image 和 Text 之间添加 Spacer 后，Spacer 就会自动填充剩余空间，将 Image 和 Text 推到两侧。

![Swift](003_view1.png)

如果存在多个 Spacer：

```
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

剩余空间会被 Spacer 平均分配。

![Swift](003_spacer.png)

## Imgae 的显示和尺寸控制

Image 视图主要用于显示图片，上节课学习的 SF Symbols 图标只是 Image 的一个用法。

使用方法：

```
Image("imageName")
```

Image 双引号内是图片名称，不需要写后缀。

### 显示图片

首先，我们准备一张图片。

![Swift](003_img.jpg)

Xcode 选择 Assets 资源文件夹，将图片拖入到 Assets 中。

![Swift](003_img1.png)

在 ContentView 中，使用 Image 显示图片：

```
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](003_img2.png)

注意：SwiftUI 的 Image 不支持播放 GIF 动画（只能显示静态帧）。

### 控制图片尺寸

在 SwiftUI 中，Image 默认以图片的原始尺寸显示，如果想要调整图片的显示大小，需要先使用 resizable 使图片内容可缩放，再使用 frame 指定布局尺寸。

```
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable 修饰符

resizable 修饰符允许图片内容根据布局空间缩放。

```
.resizable()
```

只有添加 resizable()，frame 才能真正改变图片显示尺寸。

如果省略 resizable：

```
Image("image")
    .frame(width: 50, height: 50)
```

frame 仅会为图片提供布局空间，但图片本身大小不会变化。

### frame 修饰符

frame(width:height) 用于指定视图的宽度和高度。

基本用法：

```
.frame(width: 10,height: 10)
```

例如，将图片设置为 width 为 300，height 为 100 的长方形。


```
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](003_img3.png)

也可以单独设置宽度或高度：

```
.frame(width: 200)
.frame(height: 100)
```

resizable + frame 的组合可以灵活控制图片在界面中的显示尺寸，同时保持可缩放能力。

### 缩放比例: scaledToFit 和 scaledToFill

当我们使用 frame 设置的宽高比例不一致时，图片可能会被拉伸变形。

如果我们希望在保持图片比例的情况下，使图片适用可用布局空间，可以使用 scaledToFit 或 scaledToFill。

**scaledToFit**

scaledToFit 会保持图片的原始宽高比例，将图片缩放以完全适应可用空间，不会裁剪图片：

```
.scaledToFit()
```

或者

```
.aspectRatio(contentMode: .fit)
```

这种方式适合需要完整显示图片且不希望变形的场景，例如展示产品图片或图标：

```
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

因为每张图片的宽高并不相同，如果每张图片都设置相同的宽高，难免出现图片拉伸的情况。

![Swift](003_img4.png)

设置 scaledToFit 可以让图片保持原始比例。

```
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](003_img5.png)

**scaledToFill**

scaledToFill 也可以保持图片比例，但是会填充整个可用空间，如果比例不一致，超出部分会被裁剪：

```
.scaledToFill()
```

或者

```
.aspectRatio(contentMode: .fill)
```

这种方式适合需要图片覆盖整个区域的场景，例如作为背景图或 banner。适用于图片作为背景的场景。

**两者的区别**

![Swift](003_img6.png)

## 文字

在 SwiftUI 中，Text 用于显示文字。

基本用法：

```
Text("FangJunyu")
```

我们在上一节课中学习了 Text，这节课我们将进一步学习如何控制字体大小和粗细，让文字在视图中更有表现力。

### 字体大小

使用 font 修饰符可以控制文字大小：

```
.font(.title)
```

例如：

```
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](003_txt.png)

常用字体大小（从大到小）：

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### 字体粗细

如果想要让文字加醋，可以使用 fontWeight 修饰符：

```
.fontWeight(.bold)
```

例如：

```
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](003_txt1.png)

常用字体粗细（从细到粗）：

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font 控制字体大小，fontWeight 控制字体粗细，两者可以组合使用，丰富文字的表现力。

## 总结与实践

到目前为止，我们学习了 SwiftUI 的默认布局、Spacer、Image 和 Text 等基础知识，这些内容已经足够用来开发一些简单的视图。

例如：[Google](https://www.google.com/)

![Swift](003_google.png)

Google 界面非常干净，它包含了图片和文字，我们可以尝试从 SwiftUI 的角度分析 Google 的界面结构：

1. 整体分为三个部分：Google 图标、搜索框和提示文字。可以使用 VStack 垂直排序。
2. Google 图标是一张图片，可以使用 Image 显示。
3. 搜索框包含输入框和图标，在忽略输入框的情况下，可以使用 Image 显示搜索图标。
4. 提示文本使用 Text 显示，文字的水平排序可以使用 HStack，字体颜色可用 foregroundStyle 控制。

通过练习这些知识，我们可以制作一些简单的视图，加深对 Image 和 Text 视图及其修饰符的理解和运用。
