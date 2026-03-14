# 让按钮开始工作

本节课主要学习 Button 按钮、print 输出调试信息，以及 Swift 方法（函数）。

这些内容是 SwiftUI 交互编程的基础。

## 按钮

按钮是我们最常见的 UI 控件，当我们需要下载、打开或者退出等操作时，通常都会点击按钮。

例如在 App Store 中，点击获取按钮下载 App。

![](008_button.png)

在 SwiftUI 中，按钮使用 Button 表示。

基本用法：

```swift
Button("") { }
```

结构可以分为两个部分：

```swift
Button("按钮文字") {
    点击按钮后执行的代码
}
```

例如：

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

运行后会显示一个 Start 按钮。

![](008_button1.png)

当用户点击按钮时，{} 内的代码就会执行。

需要注意的是：Button 属于 SwiftUI 的界面控件（View），因此必须写在 body 中。

### buttonStyle 修饰符

在 SwiftUI 中，Button 提供了系统内置的按钮样式，可以通过 buttonStyle 修饰符使用。

例如：

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle 会使用系统提供的按钮样式。

常见的选项包括：

- .automatic
- .plain
- .bordered
- .borderedProminent
- .borderless

![](008_button7.png)

不同样式的区别主要体现在，按钮是否有边框、背景和视觉强调程度。

## print 输出

在编程中，经常需要查看程序是否运行到某一段代码。

Swift 提供了 print 函数用于输出调试信息。

基本写法：

```swift
print("Hello")
```

这行代码会把文本输出到 Console（控制台）。

### 测试按钮可用性

我们可以把 print 写在按钮中，用来测试按钮是否被点击。

```swift
Button("Start") {
    print("Test 123")
}
```

当点击按钮时，Console 会输出：

```
Test 123
```

这说明按钮已经成功触发。

![](008_button3.png)

注意：print 是 Swift 代码，不是界面控件。它不能直接放在 body 中，否则会报错。例如下面这样写就是错误的：

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // 错误：body 只能包含 View
    }
}
```

在 SwiftUI 中，body 用来描述界面结构，只能放界面控件（View），例如 Text、Button、Image 等。

普通代码（计算逻辑、print 等）必须放在按钮、方法或其他事件处理器中。

### Console 控制台

print 输出的内容会显示在 Xcode 的 Console（控制台）中。

如果没有看到 Console，可以点击右下角的 Show the Debug Area 按钮打开调试区域，再点击 Show the Console 按钮显示控制台。

![](008_button4.png)

在 Console 左下角有两个标签：Executable 和 Previews。

![](008_button5.png)

这两个标签对应不同的运行环境：当在 Canvas 预览视图时，print 的输出会显示在 Previews 标签下；如果在模拟器或真机运行应用，则输出会显示在 Executable 标签下。

因此，当你发现 print 没有输出时，可以先确认自己选择了正确的标签。

## 案例 - ASCII 字符画

在一些代码项目中，经常会看到 ASCII 字符画。

字符画是用普通字符拼成的图案，例如：

![ASCII](008_ascii.png)

我们可以使用按钮 + print 输出一个 ASCII 字符画。

示例代码：

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

当点击按钮时，Console 会输出：

```
 /\_/\
( o.o )
 > ^ <
```

注意：字符串中的 \ 需要写成 \\\，因为反斜杠在字符串中是转义字符。

## 方法（函数）

在按钮中，我们可以直接编写代码。

例如：

```swift
Button("Start") {
    print("Hello")
}
```

如果代码比较少，这样写没有问题。但是在实际开发中，一个按钮触发的逻辑可能很多。

例如：

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // 可能还有很多代码
}
```

如果代码越来越多，直接写在按钮内部会让界面代码变得很乱，也不方便阅读和维护。

因此，我们通常会把这些代码整理到一个方法（函数）中，然后在按钮中调用这个方法。

### 什么是方法

方法（函数）就是一段可以重复使用的代码。

当某些代码需要被执行时，我们只需要调用这个方法，就可以运行方法内部的代码。

这样可以让代码结构更加清晰，也方便重复使用。

### 基本写法

在 Swift 中，方法使用 **func** 关键字定义：

```swift
func randomInt() {
    // code
}
```

这段代码定义了一个方法。

randomInt 是方法名称，用来标识这段代码。

() 表示参数位置，可以在这里接收外部传入的数据。如果不需要数据，可以保持为空。

{} 内部就是方法的代码区域，所有需要执行的代码都写在这里。

例如：

```swift
func getName() {
    print("FangJunyu")
}
```

这个方法的作用是输出一段文本。

### 调用方法

定义方法只是创建了这段代码，如果想要执行它，还需要调用方法。

调用方式是在方法名称后面加上 ()：

```swift
getName()
```

当程序运行到这行代码时，就会执行 getName 方法中的代码。

完整示例：

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

运行后，Console 会输出：

```
FangJunyu
```

### 在 SwiftUI 中使用方法

在 SwiftUI 视图中，方法通常写在 body 外部。

例如：

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

当点击按钮时，就会调用 getName() 方法。

这样可以让界面代码保持简洁，而具体逻辑放在方法中处理。

### 方法参数

有时候，一个方法需要根据不同的数据执行不同的操作。

例如，我们希望方法可以输出不同的名字，而不是只输出固定的"FangJunyu"。

这时就可以使用参数，参数可以理解为：调用方法时传入的数据。

例如：

```swift
func getName(name: String) {
    print(name)
}
```

这个方法新增了一个参数，name 是参数名称，String 时参数类型。 

这表示方法需要接收一个 String 类型的数据。

因为方法现在需要数据，所以在调用时必须提供这个数据。

```swift
getName(name: "Sam")
```

当调用时传入 "Sam"，方法内部就会使用这个值进行输出。

运行结果：

```
Sam
```

## 案例 - 使用方法输出 ASCII 字符画

在前面的示例中，我们把 print 直接写在按钮内部。

但如果字符画比较复杂，代码会变得很长。这时就可以把逻辑放到方法中，让界面代码更加清晰。

示例代码：

```
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

运行后点击按钮，Console 会输出：

```
 /\_/\
( o.o )
 > ^ <
```

这里发生了两件事情，当用户点击按钮后：

1. 按钮调用 printCat() 方法
2. 方法中的 print 代码被执行

这样可以让界面代码只负责触发事件，而具体逻辑放在方法中处理。

在实际开发中，大部分按钮的操作都会通过方法来实现。

## 总结

本节课学习了三个重要内容：

**1. Button 按钮**

Button 是 SwiftUI 中用于触发操作的控件。

```swift
Button("Start") {

}
```

当用户点击按钮时，花括号中的代码会执行。

**2.print 输出**

print 用于向 Console 输出调试信息。

```swift
print("Hello")
```

开发者可以通过 Console 查看程序运行状态。

**3.方法（函数）**

方法是一段可以重复使用的代码。

```swift
func sayHello() {
    print("Hello")
}
```

调用方法：

```swift
sayHello()
```

如果方法需要数据，可以使用 参数：

```swift
func sayHello(name: String) {
    print(name)
}
```

在后面的课程中，我们会继续学习更多 SwiftUI 控件以及数据如何与界面交互。

## 练习

尝试完成下面的练习：

1. 创建一个按钮，按钮文字为 "Hello"
2. 点击按钮时，在 Console 输出 Hello Swift
3. 把输出代码写到一个方法中，然后在按钮中调用这个方法