# 存钱罐

本节课，我们将开发一个简单的“存钱罐”项目，功能简单，包含完整的交互逻辑，非常适合初学者入门。

通过这个项目，我们将学习 TextField（输入框）和 border 边框，并了解数据绑定（$）。

最终目标是实现一个可以输入金额，点击按钮保存并累计总金额的“存钱罐”项目。

实现效果：

![Piggy Bank](014_view.png)

## 显示总金额

首先，我们需要在视图中显示“存钱罐”的总金额。

在 ContentView 中，声明一个变量来保存“存钱罐”的总金额。

```swift
@State private var amount = 0
```

接着，使用 Text 显示这个金额：

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

这里，使用 .font 和 .fontWeight 设置字体的大小和粗细。

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
            .font(.largeTitle)
            .fontWeight(.bold)
        }
    }
}
```

当 amount 改变时，Text 显示的总金额也会自动刷新。

## 输入金额

“存钱罐”除了显示总金额，还需要让用户可以“输入”存取的金额，这就需要使用 SwiftUI 的视图控件 TextField。

### TextField

TextField 是 SwiftUI 中用于输入内容的视图控件，通常用于单行输入。

TextField 主要提供了两种绑定格式：

**1. 绑定字符串类型（String）**

```swift
TextField("Placeholder", text: $text)
```

适合名字、标题等文本输入内容。

**2. 绑定数值类型（Int/Double）**

```swift
TextField("Amount", value: $number, format: .number)
```

适合年龄、薪资、金额等数字输入内容。

format: .number 表示这个输入框会按照“数字格式”进行解析和显示。

#### 文本占位符

TextField 的第一个参数是占位符（Placeholder），用于提示用户输入内容：

```swift
TextField("input your name", text: $text)
```

当输入框为空时，会显示一段灰色的提示文字。

![textfield](014_textfield.png)

#### 数据绑定

TextField 不负责持久化保存输入内容，需要通过绑定变量来管理数据。

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

用户输入的内容会直接保存到 text 变量中，TextField 只负责输入界面。

$ 表示绑定（Binding）：

```swift
$text
```

这不是普通变量，而是一个 Binding 类型。

它的作用是建立视图和数据之间的连接：

当用户在 TextField 中输入内容时，text 会自动更新；当 text 发生变化时，TextField 也会同步更新。

例如：

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("text:\(text)")
            TextField("input your name", text: $text)
                .frame(width: 150)
        }
    }
}
```

在 TextField 中输入内容，上方的 Text 会实时同步显示。

![textField](014_textfield1.png)

### 绑定数字类型

当需要输入数字时，需要绑定对应类型的变量：

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

当用户输入金额时，TextField 会将输入内容解析输入内容，并自动更新 number 的值。

## 添加输入框

在了解 TextField 的基本用法后，我们将它应用到“存钱罐”项目中。

“存钱罐”需要输入“金额”，所以我们使用“绑定数值类型（Int/Double）”的方式，并新增一个 number 变量来保存用户输入的金额：

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
        }
    }
}
```

现在，TextField 默认显示 number 的值（默认是 0）。

当清空输入内容时，会显示占位符“Amount”。

这也再次说明，TextField 显示的是绑定变量的值，而不是自己保存内容。

### 输入框尺寸问题

在当前视图中，我们会发现 TextField 没有边框，只显示一个 0，内容看上去是左对齐的。

效果如下：

![textfield](014_textfield2.png)

这是因为，TextField 默认会占据父视图的全部宽度。

我们可以通过添加背景色来验证这一点：

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

效果如下：

![textfield](014_textfield3.png)

可以看到 TextField 实际上填充了整行宽度。

### 设置固定宽度

如果我们希望输入框更紧凑，可以使用 frame 限制其宽度：

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

效果如下：

![textfield](014_textfield4.png)

### 添加边框和内边距

由于 TextField 默认没有边框，我们可以手动添加样式：

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

现在，这个输入框看上去更像一个“标准输入框”。

![textfield](014_textfield5.png)

## 边框

在 SwiftUI 中，border 用于为视图添加边框。

基本用法：

```swift
border(Color.black, width: 1)
```

其中，Color.black 表示边框的颜色，width 表示边框的粗细。

在 TextField 中，我们使用：

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

这表示为输入框添加一个黑色，宽度为 1 pt 的边框。

也可以尝试更换其他颜色，比如 Color.blue、Color.green，或者加粗边框 width:2。

## 存钱按钮

现在，我们有一个用于显示总金额的 amount 变量，一个用于输入金额的 TextField，以及与输入框绑定的 number 变量。

当前代码如下：

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
        }
    }
}
```

### 添加按钮

下面，我们需要添加一个按钮，来触发存钱操作。

```swift
Button("Save") {
    
}
```

### 实现存钱逻辑

我们想要实现用户输入金额，点击存钱按钮，金额会自动累计到总金额。


```swift
Button("Save") {
    amount += number
}
```

这里使用“复合赋值运算符”，将用户输入的金额 number 叠加到 amount 总金额中。

### 重置输入金额

现在有一个问题，每次点击按钮，输入框中的金额不会清空。

当用户输入 10，点击保存，输入框中仍然保存 10，会影响到下次输入的存钱金额。

这是因为 TextField 绑定的是 number，我们点击按钮时，只修改了 amount，number 没有发生改变，所以输入框仍然显示旧值。

我们需要添加一个清除逻辑，当点击存钱按钮后，先叠加存钱金额，再重置输入的金额：

```swift
Button("Save") {
    amount += number
    number = 0
}
```

现在，用户输入金额并点击按钮时，输入金额累加到总金额。number 重置为 0，以便用户的下一次输入。

我们就实现了“存钱罐”的所有存钱逻辑。

## 优化视图

在功能完成之后，我们可以对界面进行简单优化，添加背景图片和按钮样式。

添加按钮样式：

```swift
.buttonStyle(.borderedProminent)
```

添加背景图片：

```swift
.background {
    Image("1")
}
```

现在，我们完成了整个“存钱罐”的开发工作。

## 完整代码

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                print("---Saving---")
                amount += number
                number = 0
                print("amount:\(amount)")
                print("number:\(number)")
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

实现效果：

![Piggy Bank](014_view.png)

现在，我们可以尝试存入 100 或者更多的钱，来检测“存钱罐”逻辑是否存在问题。

或者把“存钱罐”运行在模拟器或实体设备中，来体验我们开发的“存钱罐”应用。

### 调试输出

为了验证逻辑是否正确，我们还可以在按钮中加入调试逻辑，以验证输入的金额是否正确：

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

每次存钱并点击按钮时，我们可以看到对应的调试输出，以检查代码逻辑是否存在问题。

```
---Saving---
amount:11
number:0
```
