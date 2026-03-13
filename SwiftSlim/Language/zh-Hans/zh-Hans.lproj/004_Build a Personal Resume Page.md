# 构建个人简历页面

本节课我们将制作一个简单的个人简历视图，并学习以下知识：

- cornerRadius
- spacing
- ScrollView

在构建过程中，我们将复习布局、Text 和 Image 等知识，并实现间距控制以及内容滚动的效果。

## 个人简历

目标效果：

![Swift](004_img.png)

**请先尝试独立完成，再继续阅读下面的讲解。**

### 创建项目

创建新的 iOS 项目，或者继续使用之前的项目。

默认的 ContentView 代码：

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
    }
}
```

现在清空代码，开始编写自己的内容：

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### 整体结构

在实际开发中，我们通常会先设计整体结构。

我们的页面包含：

1. 标题
2. 个人信息
3. 个人介绍

我们在最外层添加一个 VStack：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack 可以确保视图垂直排序，并且可以控制视图的排列和间距。

### 标题

首先，我们创建一个 Text 显示标题。

在这里，我将标题显示为自己的英文名称：

```swift
Text("FangJunyu")
```

![Swift](004_img1.png)

标题通常加大加粗，这里使用 font 和 fontWeight 修饰符：

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](004_img2.png)

### 排版

SwiftUI 默认的对齐方式为 center，现在标题显示在 ContentView 的中间位置。

![Swift](004_img3.png)

我们需要将标题显示在视图的顶部，可以使用 Spacer 实现布局的调整：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer 会占据剩余空间，将 Text 推到容器的上方。

![Swift](004_img4.png)

### 留白

如果认为文字部分距离顶部过近，可以使用 padding 或者 Spacer。

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

设置 VStack 的 padding 顶部边距为 20。

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

也可以使用 Spacer，设置 frame 的高度，可以获得一个指定高度的留白。

实现效果：

![Swift](004_img5.png)

### 图片

我们准备一张自己的大头照，放入 Assets 资源文件夹中。

![Swift](004_img6.png)

在 ContentView 中使用 Image 显示图片：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](004_img7.png)

因为图片的原尺寸比较大，我们需要使用 frame 控制显示大小。

```swift
Image("image")
    .resizable()
    .frame(width: 160,height: 200)
```

这时我们会发现一个问题：

如果 frame 的宽高比例与图片原始比例不一致，图片就会发生变形。

例如：

```swift
Image("image")
    .resizable()
    .frame(width: 160,height: 100)
```

![Swift](004_img8.png)

为了避免图片变形，我们需要使用 scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140,height: 200)
```

scaledToFit 的作用是：

在给定的 frame 范围内，按照图片原始比例进行缩放，并完整显示图片内容。

它不会强行拉伸图片去填满整个 frame，而是保持宽高比例不变，等比例缩放，直到某一边刚好贴合边界。

这意味着：

- 如果 frame 的宽度较小，图片会以宽度为参考进行缩放。
- 如果 frame 的高度较小，图片会以高度为参考进行缩放。
- 图片始终保持原始比例，不会变形。

通常可以设置一个方向的尺寸。例如：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](004_img7.png)

这样系统会根据宽度 140 自动计算合适的高度，同时保持图片比例。

如果需要固定视觉比例或避免在复杂布局中被压缩，可以同时约束宽高。

### 圆角

如果希望图片以圆角形式显示，可以使用 cornerRadius 修饰符：

```swift
.cornerRadius(10)
```

例如：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

在 Image 的修饰符后面添加 cornerRadius(20)。

![Swift](004_img9.png)

cornerRadius(20) 表示对视图的边界进行裁切，并应用 20 的圆角半径。

添加圆角之后，图片的四个角会变为圆弧形状，使视觉效果更加柔和、现代。

这种设计风格在当前界面设计中非常常见，例如 iOS 的应用图标就采用了圆角矩形的形态（不过系统图标使用的是连续曲率的超椭圆形，而不是简单的圆角）。

### 个人信息

现在开始实现图片左侧的个人信息区域。从界面结构可以看出，个人信息与图片是横向排列，需要使用 HStack 排序。

![Swift](004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

个人信息内容是垂直排列。

![Swift](004_img11.png)

因此，外层使用 HStack，个人信息使用 VStack，文本内容使用 Text。

基本结构：

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](004_img12.png)

**加粗字段标题**

为了区分字段名与字段值，可以对字段名使用 fontWeight：

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](004_img13.png)

**文本左对齐**

VStack 默认是居中对齐，如果希望所有文本左对齐，需要设置对齐方式：

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading 表示按照左侧对齐（在从左到右语言环境下）。

![Swift](004_img14.png)

### 间距

如果希望个人信息与图片之间保留固定间距，我们前面学习的是 Spacer 设置留白：

```swift
Spacer()
    .frame(width: 10)
```

也可以使用 HStack 的 spacing 参数：

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 表示两个子视图之间的间距为 30 pt。

![Swift](004_img15.png)

**spacing 是什么？**

在 VStack、HStack、ZStack 中，spacing 可以控制子视图之间的距离。

例如：

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

VStack 中的子视图的间距会被设置为 10pt。

![Swift](004_img16.png)

需要注意的是，spacing 只作用于"直接子视图"，不会影响嵌套容器内部的布局。

**控制列表内部间距**

如果希望字段之间增加间距，最直接的方式是 VStack 设置 spacing：

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](004_img17.png)

这样所有子视图之间的间距都会变成 10 pt。

但是观察界面会发现一个问题：

字段组之间有间距，同时字段名与字段值之间也出现了相同的间距。

这是因为 spacing 作用于当前容器的所有直接子视图。

在这个结构中，每个 Text 都是外层 VStack 的直接子视图，因此间距是统一的。

如果希望字段组之间有间距，字段名与字段值之间保持默认紧凑间距，可以将"字段名 + 字段值"视为一个逻辑整体，在外面用 VStack 包裹：

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

这时结构就变成外层 VStack 之间有间距，内层 VStack 之间为默认紧凑间距，因此字段名与字段值之间不会出现额外空隙。

![Swift](004_img18.png)

### 个人介绍

接下来实现个人介绍区域。

从界面结构上看，介绍内容由多行文本组成，文本是纵向排列。

![Swift](004_img19.png)

因此，可以使用 VStack 配合 Text：

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**增加间距**

现在个人信息和个人介绍部分比较紧凑，样式并不美观。

![Swift](004_img20.png)

因为它们都位于同一个外层容器中，可以在外层容器上控制整体间距：

```swift
VStack(spacing:30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

实现效果：

![Swift](004_img21.png)

**列表间距**

使用 spacing 设置个人介绍文本之间的间距：

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](004_img22.png)

### 完成个人简历

现在，我们个人简介的基本框架已经完成。

![Swift](004_img.png)

### 滚动视图

现在页面结构使用的是 VStack，介绍文本数量较少时没有问题，但如果增加到 20 条、30 条甚至更多，内容高度就会超出屏幕。

例如：

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](004_img23.png)

这时就会出现两个现象：

- 下方内容被截断
- 页面无法滚动

这不是 VStack 的问题，VStack 只是一个布局容器，它不会自动提供滚动能力。

**什么是 ScrollView**

ScrollView 是一个可滚动容器，适合大量超出屏幕大小的内容。例如垂直或水平列表。

基本结构：

```swift
ScrollView {
    ...
}
```

如果想要实现滚动效果，就需要将整个页面内容包裹在 ScrollView 中：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing:30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](004_img24.png)

这样，页面整体成为一个可滚动区域，当内容超出屏幕高度时，可以自然滚动。

ScrollView 默认会显示滚动条指示器，如果希望隐藏滚动条，可以设置：

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## 完整代码

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing:30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140,height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
