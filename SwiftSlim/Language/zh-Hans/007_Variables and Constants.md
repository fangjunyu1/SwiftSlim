# 变量和常量

本节课主要学习 Swift 中的变量和常量，并认识一些常用的数据类型以及基础运算符。

这些内容是编程中最基础的知识，也是后续学习 SwiftUI 的重要基础。

## 生活中的变量和常量

我们可以通过生活中的事物来理解变量和常量。

生活中的变量：

- 电视中每个节目播放的内容不同
- 每天的天气都不一样
- 时钟每一秒都会变化

这些事物的共同特点是：它们会发生改变。

如果电视永远只有一个画面，天气永远是晴朗的，时钟的指针永远不动，那么这些事物就是常量。

一个可能会发生变化，另一个不会发生变化。

## 理解变量和常量

在 App 开发中，通常需要用户填写或保存一些信息。

例如：

- 账号名称
- 生日
- 联系方式
- 住址

这些信息会被保存并显示出来。

例如，用户在 App 中输入一个名称：

```
FangJunyu
```

我们需要把这个名称保存起来，以便在 App 中显示。

可以把保存过程简单的理解为：在一个抽屉中存放东西。

当我们保存名称时，就像把名称放进一个抽屉里。

需要保存的东西可能有很多，抽屉也会有很多。为了知道每个抽屉里装的是什么，我们需要给抽屉起一个名字。

例如：

```
name
```

在这个例子中，name 是名称，FangJunyu 是保存的信息。

![Var](007_var.png)

**在 Swift 中，如果需要保存数据，就必须使用变量（var）或常量（let）进行声明。**

由于名称通常是可以修改的，因此我们应该使用变量。

```swift
var name = "FangJunyu"
```

这里声明了一个名为 name 的变量，它的值是 "FangJunyu"。

### 变量和常量的区别

变量使用 var 声明：

```swift
var
```

常量使用 let 声明：

```swift
let
```

例如：

```swift
var name = "FangJunyu"
let id = 123456
```

如果声明为变量，表示这个值可以被修改；如果声明为常量，则无法再修改。

因此，变量和常量的主要区别在于：值是否允许改变。

### 修改常量

如果代码尝试修改常量的值：

```swift
let name = "Sam"
name = "Bob"
```

Swift 会提示无法完成赋值，因为它是一个常量。

```
Cannot assign to property: 'name' is a 'let' constant
```

这种机制可以帮助开发者避免某些重要数据被意外修改。

### 在 SwiftUI 中显示

打开 ContentView.swift 文件，在 View 内部声明变量：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

在这里声明了一个名为 name 的变量，并通过 Text 将它显示在界面上。

如果我们修改变量的内容：

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Text 显示的文本内容也会发生改变。

通过这种方式，我们可以使用变量来控制界面显示的内容，而不需要每次直接修改 Text 中的文本。

如果其他地方需要获取这个信息，我们也可以把变量传递过去，相当于把“抽屉”里的内容交给其他地方使用。

### SwiftUI 中变量和常量的位置

在 SwiftUI 中，变量和常量通常写在 body 外部：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

当然，也可以把变量和常量写在 body 内部：

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

不过两者存在一个重要区别：

- 如果变量和常量写在 body 内部，每次视图刷新时都会重新创建这个变量。
- 如果写在 body 外部，变量会作为视图的属性存在，代码结构更清晰。

因此，在实际开发中，通常会把变量和常量写在 body 外部。

## 数据类型

变量可以保存很多不同类型的数据，这些类型被称为数据类型。

例如，我们之前使用 Text 显示文本：

```swift
Text("Hello, World")
```

这里的 "Hello, World" 属于字符串（String）类型。

字符串用于表示文本内容，在 Swift 中需要使用双引号 "" 包裹。

例如：

```swift
var hello = "Hello, World"
```

除了字符串以外，Swift 中还有许多数据类型。

初学阶段最常见的四种类型是：

- String
- Int
- Double
- Bool

这四种类型可以完成大部分基础的数据处理。

**String**

String 表示文本内容，例如：

var name = "FangJunyu"
var city = "Rizhao"

字符串通常用于表示：用户名、标题、文字内容。

**Int**

Int 表示整数，也就是没有小数的整数。

例如：

```swift
var age = 26
var count = 100
```

整数通常用于表示：年龄、数量、计数。

**Double**

Double 表示带有小数的数字。

例如：

```swift
var weight = 74.5
var height = 185.0
```

在 Swift 中，小数通常默认使用 Double 类型。

还有一个类似的类型叫 Float，但它能表示的数值范围更小，因此在实际开发中 Double 更常用。

**Bool**

Bool 类型用于表示两种状态：true 和 false。

例如：

```swift
var isShowAlert = true
var isLogin = false
```

Bool 类型常用于在条件判断。例如，是否显示提示框。

对于只有两种结果的情况，非常适合使用 Bool 类型表示。

### SwiftUI 中显示

当我们显示 String 类型时，可以直接使用 Text：

```swift
Text(name)
```

但是 Int、Double 等类型不是字符串，因此不能直接作为文本内容的一部分。

如果需要在 Text 中显示这些数据，可以使用字符串插值（String Interpolation）：

```swift
\()
```

字符串插值需要写在字符串内容，并使用 \\() 包裹变量或常量。

例如：

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

在上面的代码中，"" 表示字符串，\\() 用于把变量或常量插入到字符串中。

例如：

```swift
"DoubleNum: \(num * 2)"
```

显示的内容为：

```swift
DoubleNum: 2
```

通过这种方式，我们可以在字符串中插入变量或常量，然后使用 Text 将它们显示在界面上。

提示：\\() 只能在字符串 "" 内部使用。

## 运算符

在声明变量或者常量的时候，我们可以看到下面的写法：

```swift
var num = 1
```

这里的 = 叫做赋值运算符。

它的作用是：把右侧的值赋给左侧的变量。

在这个例子中，1 被赋值给变量 num。

除了赋值运算符以外，还有一些常见的数字运算符：

- \+
- \-
- \*
- \/

当我们对数字进行计算时，例如 Int 或 Double 类型的数据，就会用到这些运算符。

例如：

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3    // 3
var weight = 88.5 / 2    // 44.25
```

运算完成后，结果会被保存到变量中。

## 总结

变量、常量以及运算符是编程中最基础的概念。

通过变量和常量，我们可以在程序中保存各种数据；通过数据类型，可以明确数据的种类；通过运算符，可以对数据进行计算和处理。

这些知识就像是编程世界的基础工具。掌握这些内容，可以为后续学习 Swift 和 SwiftUI 打下坚实的基础。
