# 计数器

在前两节课中，我们学习了变量、常量、按钮和方法。

这一节课，我们将把这些知识结合起来，制作一个简单的计数器应用。

在这个例子中，我们将学习如何保存和改变变量，以及使用 @State 管理变量。

## 实现计数器

计数器通常用于记录需要不断累加的数量。例如，跳绳次数、跑步圈数等计数场景。

下面我们来实现一个简单的计数器：显示一个数字和按钮，点击按钮让数字增加。

![Num](009_num.png)

### 显示数字

首先，我们使用 Text 显示数字。

```swift
Text("0")
```

但是，如果数字需要变化，就不能直接写死"0"，而应该使用变量保存数字。

```swift
var num = 0
```

然后在 Text 中显示变量：

```swift
Text("\(num)")
```

这里使用了字符串插值 \\()，将数字转换成字符串进行显示。

### 按钮增加数字

接下来，我们添加一个按钮。

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

按钮被点击时，我们希望数字增加。

因此可以在按钮中修改变量：

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

这段代码表示：当点击按钮时，会计算 num + 1，并将结果赋值给 num。

### 更简洁的写法

Swift 提供了一种更简洁的写法：

```swift
num += 1
```

它等价于:

```swift
num = num + 1
```

这种写法叫做复合赋值运算符。

Swift 中常见的复合赋值运算符有：

```
+=   加法赋值
-=   减法赋值
*=   乘法赋值
/=   除法赋值
%=   取余赋值
```

例如：

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### 完整代码

现在，我们可以写出一个简单的计数器：

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

但是，此时代码无法正常运行。

### 出现错误

Xcode 会提示：

```
Cannot assign to property: 'self' is immutable
```

表示无法修改属性，因为视图是不可修改的。

为什么会这样？

## SwiftUI 的工作原理

在 SwiftUI 中：**界面是由数据驱动的**，这意味着当数据变化时，界面会自动刷新。

但需要注意的是，只有在状态（如 @State、 @Binding）发生变化时，SwiftUI 才会监控变化并刷新视图。

如果使用普通变量，SwiftUI 只会在视图创建时读取一次变量的值，之后即使变量发生改变，界面也不会更新。

例如：

```swift
var num = 0   → Text 显示 0
num = 1   → Text 显示 0
```

在上面的例子中，num 是普通变量，虽然它的值发生了变化，但 SwiftUI 不会更新视图，界面依然会显示初始的 0。

![Num](009_state.png)

因此，只有当数据被标记为状态（如使用 @State、@Binding 等属性包装器）时，SwiftUI 才会自动监控它的变化并刷新界面。

## @State 属性包装器

在 SwiftUI 中，如果需要修改变量并刷新界面，就必须使用 @State。

```swift
@State var num = 0
```

@State 会让 SwiftUI 监听这个变量。

当变量发生变化时，SwiftUI 会重新计算视图，并更新界面。

完整代码：

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

现在，当点击按钮时：

```swift
num += 1
```

SwiftUI 会检测到 num 发生变化，然后自动刷新界面。

![Num](009_state1.png)

## @State 的使用规则

在实际开发中，@State 通常遵循两个规则。

### 1. @State 通常使用 private

@State 变量通常只在当前视图内部使用，因此一般会写成：

```swift
@State private var num = 0
```

这样可以避免其他视图直接访问或修改这个变量。

现在还没有学习 private，可以简单的理解为：

**private 修饰的内容只能在当前视图中使用，外面的视图无法使用。**

### 2. @State 只用于当前视图的状态

@State 适用于当前 View 自己管理的数据。

例如，输入框内容、开关状态。

```swift
@State private var isOn = false
@State private var text = ""
```

如果数据需要在多个视图之间共享，就需要使用其他状态类型，例如 @Binding 或 @Observable。

这些内容会在后面的课程中学习。

### 减少按钮

计数器除了增加，还可以减少。

我们可以添加一个 - 按钮。

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

然后使用 HStack 水平排列按钮：

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

效果：

![Num](009_num1.png)

点击 + 按钮时，数字会加 1；点击 - 按钮时，数字会减 1。

### 重置按钮

我们还可以添加一个重置按钮，将数字变为 0。

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

当点击重置按钮时，num 被赋值为 0。

效果：

![Num](009_num2.png)

点击 0 按钮时，数字变为 0。

### 自定义按钮

目前我们的按钮还只能显示文本：

```swift
Button("+") {

}
```

这种写法的按钮只能显示文本内容，例如 + 或 -。

在实际开发中，我们通常希望按钮的外观更加丰富，例如使用图标或其他视图。

SwiftUI 允许我们自定义按钮的显示内容，这时可以使用按钮的另一种写法：

```swift
Button(action: {

}, label: {

})
```

在这个写法中，action 表示按钮点击执行的代码，label 显示按钮的视图。

例如，我们可以让按钮显示一个 SF Symbols 图标：

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

这样按钮显示的就不再是文本，而是一个图标。

### 优化计数器界面

为了让计数器的界面更清晰，我们还可以调整数字的显示样式。例如放大数字：

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

接下来，我们把按钮的显示内容也改为图标，并适当放大图标尺寸：

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

同样地，我们也可以把减少按钮和重置按钮改为图标形式：

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

现在按钮显示的是 SF Symbols 图标，界面也会更加直观。

![Num](009_num3.png)

## 总结

本节课通过实现一个简单的计数器，综合练习了变量、Text 和 Button 的使用。我们使用变量保存数字，并通过按钮控制数字增加或减少，同时学习了复合赋值运算符，例如 num += 1 和 num -= 1。

在实现过程中，我们了解了 SwiftUI 的工作方式：界面由数据驱动。当数据发生变化时，界面才会刷新。因此需要使用 @State 保存可变化的状态，当 @State 变量改变时，SwiftUI 会自动更新界面。

最后，我们对界面进行了简单优化，调整了 Text 的字体样式，并使用 Button(action:label:) 自定义按钮内容，使按钮可以显示图标，从而让计数器界面更加清晰和美观。

现在，我们已经接触到了 SwiftUI 视图的基本使用方式。在 SwiftUI 中，大部分界面都是通过变量驱动的。当变量发生变化时，SwiftUI 会自动刷新界面。因此，在开发 SwiftUI 应用时，我们通常需要先设计好需要保存的数据，再通过这些数据来构建界面和交互逻辑。

## 完整代码

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
