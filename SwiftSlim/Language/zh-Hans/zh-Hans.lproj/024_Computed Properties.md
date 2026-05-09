# 计算属性

这节课主要学习计算属性。

计算属性用于根据已有数据计算出一个新的结果。它可以计算数值，也可以计算 SwiftUI 视图中需要显示的内容。

例如：

```swift
let a = 10
let b = 20
let c = a + b
```

这里的 `c` 表示 `a` 和 `b` 相加后的结果。

在普通代码中，这种写法很常见。

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

提示：`Button` 的点击事件中可以执行普通 Swift 代码。

但是，如果把类似代码直接写在 SwiftUI 视图的属性中，就会遇到问题。

例如：

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

这段代码会报错。

看起来 `a` 和 `b` 已经写在 `c` 前面，似乎可以计算出 `c` 的值。

但在结构体的属性声明中，这个写法不能直接使用。

## 为什么 c 不能直接计算 a + b

因为 `a`、`b`、`c` 不是按钮点击事件中的临时常量，而是 `ContentView` 这个视图中的属性。

在按钮点击事件中，这个代码可以正常执行：

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

因为按钮点击后，代码会按照顺序执行。先创建 `a`，再创建 `b`，最后用 `a + b` 计算出 `c`。

但是在视图内部声明属性时，情况不同：

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

这里的 `a`、`b`、`c` 都是 `ContentView` 这个视图里的属性。

创建 `ContentView` 这个视图时，Swift 需要先准备这些属性。为了保证创建过程安全，Swift 不允许一个实例存储属性的默认值，直接读取同一个实例中的其他实例属性。

所以这行代码会报错：

```swift
let c = a + b
```

可以简单理解为：**在视图内部声明属性时，不能直接用一个普通属性去计算另一个普通属性。**

这种会直接保存值的属性，叫做“存储属性”。为了方便理解，也可以暂时把它理解成普通属性。

例如：

```swift
let a = 10
```

`a` 保存了 `10`。

```swift
let b = 20
```

`b` 保存了 `20`。

但是：

```swift
let c = a + b
```

这里的 `c` 不是直接写死的值，而是希望通过 `a + b` 计算出来。

像这种“根据已有数据得到结果”的情况，更适合使用计算属性。

可以修改为：

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

这里的 `c` 就是计算属性。

```swift
var c: Int {
    return a + b
}
```

它的意思是：**当需要使用 `c` 时，再读取 `a` 和 `b`，并返回 `a + b` 的结果。**

例如：

```swift
Text("c: \(c)")
```

当 `Text` 显示 `c` 时，才会触发 `c` 的计算。

## 什么是计算属性？

计算属性看起来像一个变量，但它本身不存储数据。

例如：

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

这里的 `c` 就是计算属性。

它不会像普通属性一样保存一个固定的值，而是在每次读取 `c` 时，重新执行 `{}` 中的代码，并返回计算结果。

可以理解为：

```swift
var c: Int {
    return a + b
}
```

当需要使用 `c` 的时候，就去计算 `a + b`。

所以，计算属性适合这种情况：**一个结果不需要单独保存，而是可以根据已有数据计算出来。**

## 基本写法

计算属性通常包含三个部分：

```swift
var c: Int {
    return a + b
}
```

### 1、使用 `var` 声明

```swift
var c
```

计算属性必须使用 `var` 声明，不能使用 `let`。

因为计算属性不是一个固定存储的值，而是每次读取时动态计算出来的结果。

### 2、标注返回类型

```swift
var c: Int
```

计算属性需要标注返回类型。

这里的 `c` 最终会返回一个整数，所以类型是 `Int`。

### 3、使用 {} 编写计算逻辑

```swift
{
    return a + b
}
```

`{}` 中写的是计算逻辑，这里返回的是 `a + b`。

## return 关键词

计算属性需要返回一个结果。

例如：

```swift
var c: Int {
    return a + b
}
```

这里的 `return` 表示：把 `a + b` 的计算结果返回出去。

如果计算属性中只有一个直接产生结果的表达式，可以省略 `return`：

```swift
var c: Int {
    a + b
}
```

但是，如果计算属性中有多行代码，就需要使用 `return` 明确返回结果。

例如：

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

这里的计算过程分成两步。

第一步，先计算总价：

```swift
let total = count * price
```

第二步，把总价拼接成文字，并返回：

```swift
return "Total：\(total) $"
```

如果去掉 `return`：

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

这段代码会报错。

原因是：**这个计算属性中已经有多行代码，Swift 不能再自动判断哪一行是最终要返回的结果。**

所以，当计算属性中只有一行结果时，可以省略 `return`。

```swift
var c: Int {
    a + b
}
```

当计算属性中有多行代码时，建议明确写出 `return`。

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## 计算属性和普通属性的区别

普通属性会存储数据。

```swift
var c = 30
```

这里的 `c` 保存了一个具体的值：`30`。

计算属性不存储数据。

```swift
var c: Int {
    a + b
}
```

这里的 `c` 不保存 `30`。它只是提供了一个计算方式。

当读取 `c` 时，Swift 会执行：

```swift
a + b
```

然后把计算结果返回。

所以，计算属性适合通过其他数据计算得出结果的场景。

## body 也是计算属性

学习计算属性后，我们可以重新理解 SwiftUI 中最常见的一段代码：

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

这里的 `body` 也是一个计算属性。

它使用 `var` 声明：

```swift
var body
```

它有返回类型：

```swift
some View
```

它的 `{}` 中返回的是 SwiftUI 视图内容：

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

所以，`body` 可以理解为：当 SwiftUI 需要显示这个视图时，就读取 `body`，并根据 `body` 返回的内容生成界面。

如果写出 `return`，可以这样理解：

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

不过在 SwiftUI 中，我们通常会省略 `return`，直接写成：

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

当 `@State` 数据发生变化时，SwiftUI 会重新读取 `body`，根据新的数据更新界面。

例如：

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

当点击按钮后，`count` 会发生变化。

```swift
count += 1
```

`count` 改变后，SwiftUI 会重新计算 `body`，所以界面中的文字也会更新。

```swift
Text("count: \(count)")
```

这也是为什么 SwiftUI 中的数据变化后，界面可以自动刷新。

### 不建议在 body 中写复杂计算

既然 `body` 是计算属性，那么它就可能被多次读取和重新计算。

例如：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

当 `name` 发生变化时，SwiftUI 会重新计算 `body`。

这时，`body` 内部的代码也会重新执行，`num` 也会被重新创建。

```swift
let num = 10
```

这个示例中的 `num` 很简单，所以影响不大。

但是，如果在 `body` 中执行复杂计算，例如大量数据筛选、排序、图片处理等，就可能影响界面流畅度。

所以，在 SwiftUI 中，`body` 应该主要负责描述界面结构。

简单的临时数据可以写在 `body` 中。

复杂计算可以考虑放到 `body` 外面的计算属性、方法，或者单独的数据处理中。

## 案例：数量和总价

下面，我们通过一个简单案例理解计算属性。

假设一个萝卜的单价是 2 $，用户可以点击按钮修改购买数量，界面中需要显示总价。

总价的计算方式：

```
数量 * 单价
```

如果使用普通变量保存总价，就会比较麻烦。

因为每次数量变化时，都需要手动更新总价。

更好的方式是使用计算属性：

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

显示效果：

![view](../../Resource/024_view.png)

在这个示例中：

```swift
@State private var count = 1
```

`count` 表示萝卜的数量。点击按钮时，`count` 会发生变化。

```swift
private let price = 2
```

`price` 表示萝卜单价。这里是固定值，所以使用 `let`。

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` 表示总价。

它不需要单独保存，因为总价永远可以通过 `count * price` 计算出来。

当 `count` 是 `1` 时：

```swift
totalPrice = 1 * 2
```

显示结果是：

```swift
totalPrice: 2 $
```

当点击 `+` 按钮后，`count` 变成 `2`。

这时再次读取 `totalPrice`，就会重新计算：

```swift
totalPrice = 2 * 2
```

显示结果是：

```swift
totalPrice: 4 $
```

这就是计算属性的作用：根据已有数据，动态计算新的结果。

## 计算属性可以用于判断

计算属性不仅可以计算数值，也可以返回判断结果。

例如，当我们希望数量最低是 1。

当数量已经是 1 时，`-` 按钮不应该继续减少。

可以添加一个计算属性：

```swift
private var canDecrease: Bool {
    count > 1
}
```

完整代码：

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

显示效果：

![view](../../Resource/024_view1.png)

这里的：

```swift
private var canDecrease: Bool {
    count > 1
}
```

这段代码表示，当前是否可以继续减少。

当 `count` 大于 `1` 时：

```swift
canDecrease == true
```

表示可以减少。

当 `count` 等于 `1` 时：

```swift
canDecrease == false
```

表示不能继续减少。

### 按钮中的条件判断

按钮中使用：

```swift
if canDecrease {
    count -= 1
}
```

只有 `canDecrease` 判断为 `true` 时，才可以减少 `count`。

### 控制视图前景色

也可以使用 `canDecrease` 控制按钮的前景色：

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

这里使用了三元运算符：

```swift
canDecrease ? Color.primary : Color.gray
```

这段代码的意思是，如果 `canDecrease` 为 `true`，前景色使用 `Color.primary`；如果 `canDecrease` 为 `false`，前景色使用 `Color.gray`。

`Color.primary` 是 SwiftUI 提供的系统语义颜色，表示当前界面中的主要文字颜色。

在浅色模式中，`Color.primary` 通常接近黑色；在深色模式中，`Color.primary` 通常接近白色。

所以，使用 `Color.primary` 的好处是：它会自动适配浅色模式和深色模式。

### 控制视图禁用状态

`disabled` 用于控制视图是否处于禁用状态：

```swift
.disabled(!canDecrease)
```

当 `disabled` 为 `false` 时，视图可以点击。

当 `disabled` 为 `true` 时，视图处于禁用状态，不可以点击。

这里使用 `canDecrease` 作为判断条件，可以让代码更容易理解。

看到 `canDecrease` 时，就能知道它表示“当前是否可以继续减少”。

### 补充说明：为什么有两次判断？

在 `-` 按钮中：

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

这里既使用了 `.disabled(!canDecrease)`，也在按钮内部使用了 `if canDecrease`。

`.disabled(!canDecrease)` 负责从界面上禁用按钮，让用户不能点击。

`if canDecrease` 负责在代码执行前再次判断，只有可以减少时，才执行 `count -= 1`。

这属于双重保护。实际开发中，如果按钮已经被禁用，内部判断可以省略；但在教学示例中保留下来，可以让 `canDecrease` 的作用更清楚。

## 总结

这节课主要学习了计算属性。

计算属性不会直接保存值，而是在被读取时，根据已有数据计算出一个结果。

例如：

```swift
var c: Int {
    a + b
}
```

这里的 `c` 不需要单独保存，因为它可以通过 `a + b` 计算出来。

计算属性必须使用 `var` 声明，并且需要标注返回类型。

```swift
var canDecrease: Bool {
    count > 1
}
```

计算属性不仅可以返回数值，也可以返回判断结果、文字内容，甚至返回 SwiftUI 视图内容。

在本节中，我们还学习了 `return`。

`return` 表示返回一个结果：

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

如果计算属性中只有一个直接产生结果的表达式，可以省略 `return`。

```swift
var totalPrice: Int {
    count * price
}
```

另外，我们还了解了 `Color.primary` 和 `disabled`。

`Color.primary` 是 SwiftUI 的系统语义颜色，会根据浅色模式和深色模式自动调整显示效果。

```swift
.foregroundStyle(Color.primary)
```

`disabled` 用于控制视图是否禁用。

```swift
.disabled(true)
```

表示禁用，不能点击。

```swift
.disabled(false)
```

表示可用，可以点击。

所以，计算属性在 SwiftUI 中非常常见。它可以帮助我们把计算结果、判断条件和显示内容整理得更清楚。
