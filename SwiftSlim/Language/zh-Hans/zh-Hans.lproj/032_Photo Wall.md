# 照片墙

这节课，我们将制作一个照片墙页面。

![view](../../../Resource/032_view13.png)

在这个案例中，我们会复习 `extension`、`self` 和实例的知识，并学习 SwiftUI 中常用的 `Shape` 图形。

通过这些知识，我们可以把普通图片裁剪成圆形、圆角矩形、胶囊形、椭圆形等不同样式，并给照片添加边框效果。

本节课会用到几个新的知识点：`Shape`、`clipShape`、`strokeBorder` 和 `overlay`。

其中，`clipShape` 用来裁剪视图形状，`strokeBorder` 用来绘制形状边框，`overlay` 用来在视图上方叠加新的视图。

## 图片素材

在开始之前，我们需要准备几张图片。

你可以使用自己的照片，也可以使用本节课提供的示例图片。

本节课的照片示例来自 [Pixabay](https://pixabay.com/) 网站：

[风景](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[狐狸](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[建筑](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[花朵](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[天鹅](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

图片下载后，将它们添加到 `Assets` 资源文件夹中，并依次命名为 `1`、`2`、`3`、`4`、`5`。

![assets](../../../Resource/032_view17.png)

这样，我们就可以在 SwiftUI 中通过 `Image("1")`、`Image("2")` 的方式显示图片。

## 显示照片

首先，我们在 `ContentView` 中显示 5 张照片：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

显示效果：

![view](../../../Resource/032_view.png)

在这段代码中，我们使用 `ScrollView` 实现照片列表的滚动显示，并使用 `VStack` 让多张图片从上到下排列。

每张图片都通过 `.resizable()`、`.scaledToFit()` 和 `.frame(width: 300)` 设置图片的显示效果，让图片可以缩放、保持比例完整显示，并限制图片宽度。

`VStack` 上的 `.padding(.vertical, 100)` 用来增加上下间距，避免第一张和最后一张照片过于贴近屏幕边缘。

最后的 `.ignoresSafeArea()` 表示让滚动视图忽略安全区域，使照片滚动时可以延伸到屏幕顶部和底部，页面显示更完整。

不过，现在 5 张图片都使用了相同的修饰符：

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

当我们看到重复代码时，就可以考虑使用 `extension` 进行整理。

## 使用 extension 整理图片样式

我们可以给 `Image` 扩展一个照片墙专用方法：

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

这里，我们给 `Image` 类型扩展了一个 `photoGalleryStyle` 方法。

这个方法内部包含了前面重复使用的 `.resizable()`、`.scaledToFit()` 和 `.frame(width: 300)`。也就是说，它把图片缩放、比例显示和宽度设置这些代码整理到了一起。

使用这个扩展后，原来的图片代码：

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

就可以简化为：

```swift
Image("1")
    .photoGalleryStyle()
```

这样，每张图片只需要调用 `.photoGalleryStyle()`，就可以应用相同的照片墙样式，代码会更简洁，也更方便后续统一修改。

## 理解 self

在扩展方法中，我们写了 `self`：

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

这里的 `self`，表示调用这个方法的当前图片实例。

例如：

```swift
Image("1")
    .photoGalleryStyle()
```

这段代码中，`photoGalleryStyle()` 是由 `Image("1")` 调用的，所以方法内部的 `self` 就表示这张 `Image("1")` 图片。

可以简单理解为：谁调用这个方法，`self` 就表示谁。

需要注意的是，SwiftUI 的修饰符会不断返回新的视图结果。因此，`photoGalleryStyle()` 返回的是一个被修饰后的视图，而不是简单地返回原始的 `Image` 本身。

## 照片形状

现在，照片已经可以正常显示了。不过，这些照片默认都是矩形，看起来比较普通。

如果只是想让照片拥有圆角，可以直接使用 `.cornerRadius()`：

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

显示效果：

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` 表示给图片添加 `20 pt` 的圆角。对于普通的圆角图片来说，这种写法已经足够。

不过，`.cornerRadius()` 只能处理圆角效果，适合制作普通的圆角图片。如果我们想让照片变成更多不同的形状，仅靠这个修饰符就不够了。

这时，就需要使用 SwiftUI 中的 `Shape`。`Shape` 可以表示不同的图形，再配合 `clipShape`，就可以把图片裁剪成对应的形状。

## 认识 Shape

在 SwiftUI 中，`Shape` 表示图形。它和 `View` 一样，都是 SwiftUI 中非常常用的类型。

常见的 `Shape` 有圆形、矩形、圆角矩形、胶囊形和椭圆形。为了更直观地观察不同图形的外观，下面的示例会给每个图形设置不同的颜色和大小。

在这些示例中，`.fill()` 用来给图形填充颜色，`.frame()` 用来设置图形的显示大小。颜色只是为了区分不同图形，并不是图形本身的固定颜色。

### Circle 圆形

`Circle` 表示圆形。它常用于头像、圆形按钮、圆形图片等界面效果。

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle 矩形

`Rectangle` 表示矩形。它是最基础的图形之一，也可以用来制作背景、分割区域或普通边框。

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle 圆角矩形

`RoundedRectangle` 表示圆角矩形。`cornerRadius` 用来设置圆角大小。

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule 胶囊形

`Capsule` 表示胶囊形。它的两端是圆弧形，常用于胶囊按钮、标签背景等界面效果。

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse 椭圆形

`Ellipse` 表示椭圆形。它和 `Circle` 类似，但宽度和高度不相同时，会显示为椭圆。

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

通过这些示例可以看到，`Shape` 本身可以直接显示为图形。接下来，我们会使用这些 `Shape` 配合 `clipShape` 裁剪照片，让照片显示成不同形状。

## 使用 clipShape 裁剪照片

现在，我们可以使用 `clipShape` 把照片裁剪成不同形状。

例如，把第一张照片裁剪成圆形：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

这段代码表示：先显示一张图片，然后使用 `Circle()` 把它裁剪成圆形。

![view](../../../Resource/032_view2.png)

`clipShape` 的基本写法是：

```swift
.clipShape(形状)
```

在视图后面添加 `.clipShape(...)`，括号中填写需要裁剪成的图形。

例如：

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

现在，我们把 5 张照片分别裁剪成不同形状：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

显示效果：

![view](../../../Resource/032_view8.png)

其中，`Rectangle()` 裁剪后的效果和普通矩形照片接近，所以视觉变化不明显，主要用于和其他形状进行对比。

现在，照片不再只是普通矩形，而是拥有了不同的形状。

## 添加照片边框

如果我们想给圆形照片添加边框，可能会想到使用 `border`：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

但是，这样得到的通常不是圆形边框，而是一个矩形边框。

![view](../../../Resource/032_view9.png)

这是因为 `border` 是按照视图的矩形区域添加边框，而不是按照 `clipShape` 裁剪后的形状添加边框。

所以，如果我们想要圆形边框，就不能直接使用 `border`。

## 使用 strokeBorder 绘制形状边框

在 SwiftUI 中，`strokeBorder` 可以给这些常见的 `Shape` 绘制内部边框。

例如，绘制一个圆形边框：

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

这段代码表示：给 `Circle` 绘制一个棕色边框，边框宽度为 `10 pt`。

![view](../../../Resource/032_view12.png)

这里需要注意，`strokeBorder` 不是直接给照片添加边框，而是给 `Circle()` 这个图形绘制边框。

也就是说，这段代码得到的只是一个独立的圆形边框，它和照片还没有关系。

如果想让这个圆形边框显示在照片上方，就需要继续使用 `overlay`，把边框叠加到照片上。

## 使用 overlay 叠加边框

`overlay` 是一个视图修饰符，可以在当前视图上方叠加新的视图。

它的基本结构可以理解为：

```swift
当前视图
    .overlay {
        叠加的视图
    }
```

在这个案例中，当前视图是已经裁剪成圆形的照片：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

我们要叠加上去的新视图，是一个圆形边框：

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

所以，可以把照片和边框组合起来：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

这里的 `overlay` 表示在当前视图上方叠加一个新的视图。

在 `overlay` 中，边框会跟随当前照片的显示范围叠加，所以不需要再单独设置 `frame`。只要边框形状和裁剪形状一致，边框就能贴合照片。

![view](../../../Resource/032_view10.png)

最终的效果是，圆形照片上方覆盖了一个圆形边框。

和 `ZStack` 相比，`overlay` 更适合这种“给当前视图添加装饰”的场景。照片是主体，边框只是附加效果，因此使用 `overlay` 会更清晰。

## 完成照片墙

现在，我们给每张照片添加对应的形状和边框：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

显示效果：

![view](../../../Resource/032_view13.png)

这样，一个基础照片墙页面就完成了。

在这个页面中，我们使用 `ScrollView` 实现滚动显示，使用 `Image` 显示照片，使用 `clipShape` 裁剪照片形状，并通过 `overlay` 和 `strokeBorder` 添加边框。

## 完整代码

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## 总结

这节课，我们完成了一个照片墙页面。

![view](../../../Resource/032_view13.png)

在这个案例中，我们先使用 `Image` 显示照片，再通过 `extension` 给 `Image` 扩展了一个 `photoGalleryStyle` 方法，用来整理重复的图片样式代码。

随后，我们学习了 SwiftUI 中常见的 `Shape`，例如 `Circle`、`Rectangle`、`RoundedRectangle`、`Capsule` 和 `Ellipse`。这些图形不仅可以直接显示，也可以配合 `clipShape` 用来裁剪视图。

例如：

```swift
.clipShape(Circle())
```

表示把视图裁剪成圆形。

最后，我们使用 `overlay` 和 `strokeBorder` 给照片添加了对应形状的边框。需要注意的是，`border` 通常按照视图的矩形区域绘制边框，如果想让边框跟随圆形、胶囊形或椭圆形，就更适合使用相同的 `Shape` 进行叠加。

通过这节课，我们不仅完成了照片墙效果，也理解了 `Shape`、`clipShape`、`strokeBorder` 和 `overlay` 在界面中的常见组合方式。

## 课后练习

### 1、添加照片墙背景

给照片墙页面添加一个全屏背景图片。

要求：背景图片可以铺满整个屏幕，并忽略安全区域。

### 2、渐变边框

将现有的单色边框修改为线性渐变边框。

可以尝试使用 `LinearGradient` 实现更丰富的边框效果。

### 3、仿真照片边框

从网络上搜索一些真实照片边框样式，尝试使用 `overlay` 叠加图片边框，让照片看起来更接近真实相框效果。

练习显示效果：

![button](../../../Resource/032_view15.jpeg)

### 4、实现圆角按钮边框

在实际开发中，按钮经常会使用圆角矩形边框。

请尝试制作一个圆角按钮，并使用 `RoundedRectangle` 和 `strokeBorder` 给按钮添加圆角边框。

练习显示效果：

![button](../../../Resource/032_view14.png)

### 思考题

如果不想使用单色边框，也不想使用渐变边框，而是想让边框呈现某种花纹效果，应该如何实现？

可以尝试搜索资料，了解 `overlay`、`mask` 或 `ImagePaint` 等相关用法。

练习显示效果：

![button](../../../Resource/032_view16.png)
