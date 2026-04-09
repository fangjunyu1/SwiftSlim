# 循环和列表

这节课，我们将学习 Swift 中的 `for` 循环，以及 SwiftUI 中的 `ForEach`。

它们都可以帮助我们按顺序读取数组中的元素。在实际开发中，我们经常需要把一组数据一个个取出来，再进行处理或显示，而循环正是完成这件工作的重要工具。

当我们浏览网页或使用 App 时，经常会看到很多列表或条目。这样的内容通常会先存储在`数组`中，然后再通过`循环`依次读取出来，最后显示在界面上。

例如，Google 的搜索结果列表：

![Google](../../Resource/017_google.png)

搜索结果列表中的每一个条目，通常都对应一项数据，通过循环依次显示出来。

因此，`数组`和`循环`经常会一起出现。`数组`负责保存一组数据，`循环`负责把这些数据按顺序取出来，并执行相同的操作。

下面，我们先从最基础的 `for` 循环开始。

## 倒计时

假设我们要模拟一个倒计时功能，依次输出 `“5、4、3、2、1”`。

最直接的写法是：

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

这种方式虽然可以模拟倒计时功能，但如果内容很多，就会显得非常重复，而且后续也不方便修改。

这时，我们可以先把数据放进数组，再使用 `for` 循环依次输出：

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

这种写法更简洁，也更容易扩展。即使倒计时中的数字有很多，我们也不需要一行一行重复写 `print`，只需要让循环自动处理数组中的每一个元素即可。

我们可以把这段代码放到按钮中测试：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

当点击按钮时，`for` 循环会按照数组中的顺序，依次取出 `countDown` 里的每一个整数，并将它们打印到控制台。

接下来，我们看一下 `for` 循环是如何工作的。

## for 循环

`for` 循环用于按顺序处理一组数据，最常见的对象是数组和范围。

基本写法：

```swift
for 元素 in 数组或范围 {
    执行的代码
}
```

例如，刚才的倒计时代码：

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

这里的 `i` 表示当前取出的元素，`in` 后面跟的是要循环的数据，也就是 `countDown` 数组。

这段代码的含义是：程序会从 `countDown` 数组中按顺序取出每一个元素。每取出一个元素，就暂时用 `i` 来表示，然后执行大括号中的代码。

执行过程可以理解为：

- 第一次取出的是 `5`，所以这时 `i` 的值是 `5`
- 执行 `print(i)`，输出 `5`
- 然后继续取出下一个元素 `4`
- 再执行一次 `print(i)`，输出 `4`

后面的 `3`、`2`、`1` 也会按照同样的方式依次执行。

![for](../../Resource/017_for.png)

当数组中的所有元素都处理完成后，`for` 循环就会自动结束。

我们可以借助 `for` 循环获取数组中的每一个元素，并完成像倒计时这样的功能。

**提示**：`i` 是 for 循环中很常见的命名方式，用来表示当前取出的元素，但它不是固定写法，也可以使用其他英文名称。

例如，使用 `num` 表示每一个取出的元素：

```swift
for num in countDown {
    print(num)
}
```

在大括号内，也需要使用 `num` 来表示当前取出的元素。

### 循环范围

`for` 循环不仅可以循环数组，还可以循环范围。

例如，当我们需要计算 `50` 以内正整数的总和时，就需要把 `1` 到 `50` 之间的所有整数依次相加。

最直接的写法可能是：

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

这个写法的问题在于，我们需要把每一个数字都手动写出来，既麻烦，也不适合真正的开发场景。

这时，就可以使用范围运算符配合 `for` 循环来完成。

在前面的“运算符”章节中，我们已经学习过范围运算符：

```swift
1...3   // 1, 2, 3
```

其中，`...` 表示闭区间，也就是包含起点和终点。

因此，这里可以使用 `for` 循环 `1` 到 `50` 的整数范围：

```swift
for i in 1...50 {
    
}
```

我们需要把这些整数相加，所以还需要一个变量来保存总和：

```swift
var count = 0
```

然后在每次循环时，把当前取出的数字加到 `count` 上：

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

这段代码表示：

- `count` 用来保存当前的总和
- `for` 循环会从 `1` 到 `50` 依次取出整数
- 每次取出一个整数，就执行一次 `count += i`
- 循环结束后，`count` 中保存的就是最终总和。

这样，我们就可以得到 `50` 以内所有正整数总和。

同理，如果我们需要计算 `1` 到 `100` 的整数总和，只需要修改范围即可：

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` 循环不仅可以循环数组，还可以循环一个范围。这种按顺序重复处理数据的能力，在开发中非常常见。

它可以帮助我们自动处理很多重复性的工作，而不需要手动编写每一个数字的相加过程，或者其他类似的重复操作。

## SwiftUI 中的循环

前面的 `for` 循环属于 Swift 语言。

但是在 SwiftUI 中，我们不能直接在视图结构里使用 `for` 来生成视图：

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

这是因为 `VStack` 里面需要的是 SwiftUI 视图，而普通的 `for` 循环本身并不是一个视图。

如果我们想在 SwiftUI 中根据数组的内容重复生成界面，就需要使用 `ForEach`。

例如，我们要显示一个小组内所有成员的名字，可以写为：

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

显示效果：

![for1](../../Resource/017_for1.png)

然后，我们为每一个 `Text` 添加相同的修饰符：

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

现在，每一个 `Text` 都显示为更小、更粗的字体。

显示效果：

![](../../Resource/017_for2.png)

虽然修饰符让界面更美观，但也让代码变得更长、更重复。

如果名字继续增加，或者后续还要统一修改字体、颜色等样式，就需要重复编写和修改很多相同的代码，这样会比较麻烦，也不方便维护。

这时，我们就可以把这些名字先放进数组，再使用 SwiftUI 中的 `ForEach`，根据数组中的数据重复生成视图：

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

这组代码更简洁，`ForEach` 会依次读取数组中的每一个元素，并把对应内容显示到界面上。

当我们后续新增名称时，只需要修改 `names` 数组中的名称，不需要每次都重复添加 `Text` 和复杂的修饰符。

## ForEach

`ForEach` 是 SwiftUI 中用来重复生成视图的结构。可以把它理解为 SwiftUI 中一种类似 `for` 循环的结构。

基本用法：

```swift
ForEach(数组, id: \.self) { 元素 in
    SwiftUI 代码
}
```

例如，刚才的小组名称：

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

这段代码表示：

`names` 是循环的数组，也就是要显示的数据。

`id:\.self` 表示使用数组中的元素本身，来区分每一个元素。

在当前示例中，数组里保存的是字符串：

```swift
["Sam", "John", "Wathon", "Bob"]
```

所以 SwiftUI 会直接使用 "Sam"、"John"、"Wathon"、"Bob" 这些字符串本身，来区分不同的内容。

对于初学阶段常见的 String、Int 这类简单数组，我们通常都可以先写成：

```swift
id: \.self
```

现在只需要先记住这一种写法即可，不需要深入了解更多 id 的规则。

`item in` 中的 `item` 表示当前取出的元素。

例如，第一次循环时，`item` 是 `"Sam"`，第二次循环时，`item` 是 `"John"`。

因此：

```swift
Text(item)
```

就会依次变成：

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

所以，这段代码的作用就是：从 `names` 数组中依次取出每一个名字，并为每一个名字生成一个 `Text` 视图。

### 执行过程

执行过程可以理解为：

- `ForEach` 先读取 `names` 数组中的第一个元素 `"Sam"`
- `item` 临时表示 `"Sam"`
- `Text(item)` 显示 `"Sam"`
- 然后继续读取下一个元素 `"John"`
- 再重复执行同样的视图代码

最后，数组中的所有名字都会显示出来。

这样写的好处是：当名称变多时，我们不需要重复写很多个 `Text`，只需要修改数组内容即可。

### 循环照片

`ForEach` 不仅可以显示文字，也可以显示图片、颜色，或者其他 SwiftUI 视图。

例如，我们准备 4 张图片：

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

把这四张图片拖入 Xcode 的 Assets 文件夹中。

![image](../../Resource/017_for3.png)

如果不使用 `ForEach`，我们需要把每一张图片都手动写出来：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

显示效果：

![image](../../Resource/017_for4.png)

这种写法虽然可以实现功能，但代码会比较长。

如果图片越来越多，就要重复写越来越多的 `Image` 代码。

后续如果想要统一修改图片大小，也需要一张一张去修改。

这时，就可以把图片名称放进数组，再使用 `ForEach` 来重复生成图片视图：

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

这里的 `images` 是一个字符串数组，数组中的每一个元素都是图片名称。

`ForEach(images, id: \.self)` 表示，依次读取 `images` 数组中的每一个元素，使用元素本身来区分每一项，再根据当前元素生成对应的视图。

例如，第一次读取到的是 `"430F9BEF"`，那么：

```swift
Image(item)
```

就相当于：

```swift
Image("430F9BEF")
```

后面的图片也会按照同样的方式依次显示出来。

![image](../../Resource/017_for4.png)

这里仍然使用：

```swift
id: \.self
```

原因和前面一样，因为 `images` 数组中的元素也是简单的字符串类型，所以初学阶段直接使用元素自身作为区分方式即可。

可以简单的理解为一句固定公式：

**当 `ForEach` 循环的是 `String` 或 `Int` 这类简单数组时，通常写 `id: \.self`。**

### 新增图片

如果后续需要新增图片，只需要修改数组内容即可：

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

不需要再重复编写新的 `Image` 代码。

如果图片比较多，可以配合 `ScrollView` 一起使用，否则内容超出屏幕后，就无法完整预览。

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### 修改图片

当我们需要统一修改图片样式时，只需要修改 `ForEach` 内部的代码即可。

例如，把宽度改成 `80`：

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

这样，所有图片都会一起修改，不需要一张一张去改。

这就是 `ForEach` 的一个重要作用：

**当多个视图结构相同、只有内容不同时，可以只写一份视图代码，再让数组中的数据决定显示内容。**

## 总结

本节课，我们学习了 `for` 循环和 `ForEach`。

`for` 循环用于按顺序处理数组或范围中的元素，更倾向于处理数据。

`ForEach` 用于在 SwiftUI 中根据数组内容重复生成视图，更偏向视图显示。

对于当前初学阶段，`ForEach` 最常见的写法就是：

```swift
ForEach(数组, id: \.self) { 元素 in
    SwiftUI 代码
}
```

其中，`id: \.self` 表示使用元素本身来区分每一个元素。

当数组中的内容是 `String`、`Int` 这类简单类型时，我们通常都可以先使用这一个写法。

以后，在浏览网页或 App 时，如果看到一组重复的文字、图片或者其他列表内容时，可以想到这些内容在 SwiftUI 中，通常是先放进数组里，再通过 `ForEach` 依次显示出来。
