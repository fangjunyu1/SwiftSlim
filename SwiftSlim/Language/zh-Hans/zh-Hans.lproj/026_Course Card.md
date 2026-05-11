# 课程卡片

这节课是一个阶段复习课，我们将完成一个“课程卡片”。

通过这个练习，我们可以复习前面学过的 `Text`、`Image`、`VStack`、`HStack`、`Spacer()`、`.padding()`、`.background()`、`.cornerRadius()` 等内容，并学习如何把多个小视图组合成一个完整的视图模块。

课程卡片效果：

![view](../../../Resource/026_view.png)

这个课程卡片主要包含几个部分：

- 课程等级：`Beginner`
- 课程内容：`20+ Lessons`
- 课程标题：`SwiftUI Beginner Tutorial`
- 课程描述
- 按钮：`Start Learning`
- 课程背景：Swift 图标和靛青色背景

我们可以在 `ContentView` 中完成这个视图。

## 顶部区域

首先，制作课程卡片的顶部区域。

![view](../../../Resource/026_view1.png)

顶部区域左侧显示课程等级，右侧显示课程内容。

因为这两个内容是横向排列，所以可以使用 `HStack`。

```swift
var topView: some View {
    HStack {
        Text("Beginner")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ Lessons")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

这里我们把顶部区域拆成了一个计算属性：

```swift
var topView: some View
```

这样做的好处是可以让 `body` 更清晰。

顶部区域主要用到了这些内容：

- `HStack`：让两个文本横向排列。
- `Text`：显示文字内容。
- `Spacer()`：把左侧文本推到左边，把右侧文本推到右边。
- `.font(.footnote)`：设置较小的文字样式。
- `.fontWeight(.bold)`：设置文字加粗。
- `.foregroundStyle(Color.white)`：设置前景色为白色。
- `.padding(.vertical, 10)`：设置上下内边距。
- `.padding(.horizontal, 16)`：设置左右内边距。
- `.background(Color.white.opacity(0.15))`：设置半透明白色背景。
- `.cornerRadius(20)`：设置圆角。

这里的 `Beginner` 使用了两个方向的 `.padding()`：

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

这样可以让文字上下和左右都有空间，看起来更像一个标签。

`Color.white.opacity(0.15)` 表示不透明度为 `15%` 的白色，也就是非常淡的白色。

### 添加卡片背景

前面我们创建了 `topView`，但只是创建视图还不会自动显示。

在 SwiftUI 中，真正显示在界面上的内容，需要写在 `body` 中。

所以，可以先把 `topView` 放到 `body` 中显示：

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

此时会看到顶部区域已经显示出来：

![view](../../../Resource/026_view2.png)

不过，因为 `topView` 中的文字是白色，而默认背景也是浅色，所以在浅色模式下可能不太容易看清。

因此，我们可以在外层添加一个 `VStack`，然后给整个区域设置内边距、背景色和圆角：

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

显示效果：

![view](../../../Resource/026_view3.png)

这里的 `VStack` 目前只放了一个 `topView`，看起来好像不是必须的。

但后面我们还会继续添加课程标题、课程描述和按钮区域。它们都是上下排列的内容，所以这里提前使用 `VStack`，可以方便后续继续组合视图。

这里有两个 `.padding()`，它们的作用不同。

第一个 `.padding(20)` 写在 `.background()` 前面：

```swift
.padding(20)
.background(Color.indigo)
```

它控制的是卡片内部的边距，也就是内容和背景边缘之间的距离。

第二个 `.padding(30)` 写在 `.background()` 后面：

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

它控制的是卡片外部的边距，也就是整个卡片和屏幕边缘之间的距离。

![view](../../../Resource/026_view4.png)

所以，同样是 `.padding()`，写在不同位置，效果也会不同。

## 内容区域

接着制作课程卡片的内容区域。

显示效果：

![view](../../../Resource/026_view5.png)

内容区包含课程标题和课程描述，它们是上下排列的，所以使用 `VStack`。

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI Beginner Tutorial")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Start from zero with SwiftUI and systematically learn Apple’s declarative UI development. Through clear explanations and practical examples, you will gradually master layout, interaction, and state management to build beautiful and useful app interfaces.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

显示效果：

![view](../../../Resource/026_view6.png)

这里的 `VStack` 中使用了两个参数：

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` 表示让 `VStack` 内部的视图左对齐。

`spacing: 10` 表示让 `VStack` 内部的视图之间保持 `10 pt` 的间距。

所以，课程标题和课程描述会从左侧开始排列，并且它们之间会保留一定距离。

课程描述比较长，如果全部显示出来，卡片会变得很高，所以这里使用 `.lineLimit()` 限制显示行数：

```swift
.lineLimit(3)
```

它表示最多显示 `3` 行，当内容超过限制行数时，超出的部分会被省略。

### 视图左对齐

这里还需要注意一点。

`VStack(alignment: .leading)` 只能控制 `VStack` 内部视图的对齐方式，它不会直接控制 `VStack` 自己在外部容器中的位置。

例如，如果课程描述比较短：

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI Beginner Tutorial")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Just some content.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

显示效果：

![view](../../../Resource/026_view7.png)

可以看到，课程标题和课程描述虽然在 `VStack` 内部是左对齐的，但整个 `VStack` 并没有靠到卡片最左侧。

这是因为，当内容比较短时，`VStack` 的宽度也会比较窄。外层容器在布局时，可能会把这个较窄的 `VStack` 放在中间。

可以理解为：`VStack(alignment: .leading)` 负责内部左对齐。
但它不负责把整个内容区域推到最左侧。

如果希望整个内容区域真正靠左，可以在外面再包一层 `HStack`，并添加 `Spacer()`：

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI Beginner Tutorial")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Just some content.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

显示效果：

![view](../../../Resource/026_view8.png)

这里的 `HStack` 是水平布局。

`Spacer()` 会占用右侧剩余空间，从而把左侧的 `VStack` 推到最左边。

因此，`HStack + Spacer()` 可以用来控制整个内容区域的位置。

在实际课程卡片中，课程描述比较长，通常会占据较多宽度，所以这个问题不一定明显。但理解这个区别很重要，因为后面制作短文本布局时，经常会遇到类似情况。

### 控制内部视图之间的距离

前面我们在 `VStack` 中写了 `spacing: 10`：

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` 用来控制内部视图之间的距离。

如果不设置 `spacing`，`VStack` 也会有默认间距，但默认间距不一定符合我们想要的效果。

在这里，课程标题和课程描述距离太近会显得拥挤，所以使用：

```swift
spacing: 10
```

让它们之间保留一点空间。

显示效果：

![view](../../../Resource/026_view9.png)

同样，顶部区域和内容区域也是上下排列的，也可以使用 `spacing` 控制它们之间的距离。

现在，把 `topView` 和 `contentView` 放到 `body` 中：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

显示效果：

![view](../../../Resource/026_view10.png)

这里的 `VStack(spacing: 20)` 控制的是 `topView` 和 `contentView` 之间的距离。

也就是说：

```swift
VStack(alignment: .leading, spacing: 10)
```

控制的是课程标题和课程描述之间的距离。

```swift
VStack(spacing: 20)
```

控制的是顶部区域和内容区域之间的距离。

它们都是 `spacing`，但作用在不同的 `VStack` 上，所以影响的范围也不同。

这样，内容区域的视图就完成了。

## 按钮区域

接着制作底部按钮区域。

显示效果：

![view](../../../Resource/026_view11.png)

按钮区域主要由一个播放图标和一段文字组成。

我们可以使用 `Image` 显示播放图标，使用 `Text` 显示按钮文字。

这里先制作一个按钮外观：

```swift
var buttonView: some View {
    HStack {
        Button {
            print("click button")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Start Learning")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

显示效果：

![view](../../../Resource/026_view12.png)

这里使用了两个 `HStack`：

里面的 `HStack` 用来横向排列图标和文字：

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Start Learning")
}
```

外面的 `HStack` 配合 `Spacer()`，用来让这个按钮外观靠左显示：

```swift
HStack {
    ...
    Spacer()
}
```

当点击按钮时，控制台会输出 `click button`。

## 基础卡片完成

现在，把顶部区域、内容区域和按钮区域组合起来：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

显示效果：

![view](../../../Resource/026_view13.png)

到这里，一个基础的课程卡片已经完成。

## Swift 图标背景

最后，我们给卡片添加一个半透明的 Swift 图标背景。

![view](../../../Resource/026_view.png)

前面我们使用过 `Color.indigo` 作为背景色。实际上，`.background()` 除了可以添加颜色，也可以添加一个完整的视图。

所以，我们可以先创建一个专门的背景视图：

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

在这个背景视图中，我们使用 `VStack`、`HStack` 和 `Spacer()`，把 Swift 图标推到右下角。

因为 Swift 图标只是作为装饰背景，所以这里使用了半透明的白色：

```swift
Color.white.opacity(0.15)
```

这样图标不会过于明显，也不会影响前面的文字内容。

接着，把 `backgroundView` 添加到卡片中：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

实现效果：

![view](../../../Resource/026_view14.png)

这里连续使用了两个 `.background()`：

```swift
.background(backgroundView)
.background(Color.indigo)
```

第一个 `.background()` 用来添加 Swift 图标背景。
第二个 `.background()` 用来添加靛青色背景。

这样，Swift 图标会显示在靛青色背景上面，并且作为卡片背景的一部分显示。

从这里可以看出，`.background()` 除了可以添加颜色，也可以添加自定义视图。多个 `.background()` 还可以组合使用，从而实现更丰富的背景效果。

到这里，一个完整的课程卡片就完成了。

## 总结

这节课通过一个课程卡片，复习了 SwiftUI 中常见的基础布局方式。

我们使用 `Text` 显示文字，使用 `Image` 显示系统图标，使用 `VStack`、`HStack` 和 `Spacer()` 控制视图排列。

学习了 `.lineLimit()`，它可以限制文本最多显示的行数。当内容超过限制时，超出的部分会被省略。

同时，我们也复习了 `.padding()`、`.background()`、`.cornerRadius()`、`.foregroundStyle()` 等常用修饰符。

完成这节课后，我们已经可以把多个小视图组合成一个完整的卡片模块。

这也是 SwiftUI 开发中非常常见的思路：先拆分小视图，再组合成完整界面。

## 完整代码

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Beginner")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ Lessons")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI Beginner Tutorial")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Start from zero with SwiftUI and systematically learn Apple’s declarative UI development. Through clear explanations and practical examples, you will gradually master layout, interaction, and state management to build beautiful and useful app interfaces.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("click button")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Start Learning")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```

