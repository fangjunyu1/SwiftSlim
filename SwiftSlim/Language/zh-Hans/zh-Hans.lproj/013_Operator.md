# 运算符

这节课，我们将学习 Swift 运算符（Operators）。

当我们进行计算、比较或逻辑判断时，都需要使用运算符。这些操作贯穿程序执行的各个环节，是编程中最基础的能力之一。

```swift
let a = 100 * 8
```

在学习编程的过程中，很多人会发现：具备一定数学思维的人，往往更容易理解程序逻辑。这是因为编程本质上离不开“计算”和“规则判断”，而这些正是运算符所承担的核心作用。

在实际开发中，运算符不仅用于简单的数字计算，还广泛应用于各种具体场景。

例如，在方块游戏中，用户拖到一个方块到指定位置时，需要计算：

- 方块的坐标位置
- 方块可以填充的位置
- 判断目标位置是否可用

这些“计算 + 判断”的过程，本质上都依赖运算符来完成。

![Block](../../Resource/013_block.png)

学习运算符，不只是学习数字计算，更是为后续的界面布局、数据处理和交互逻辑打下基础。

## SwiftUI 中的计算执行方式

在 SwiftUI 中，通常通过 Button 触发函数，再在函数中执行运算逻辑。

例如：

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

当点击按钮时，Console 输出：

```
c: 20
```

在本节课中，我们统一将运算逻辑写在 func 中，通过按钮触发执行，并使用 print 输出结果。

在后续的示例中，为了简化代码展示，我们将直接在代码中标注计算结果，而不再重复使用 print 输出。

## Console 输出管理

由于每次点击都会产生输出信息，可以点击 Console 区域右下角的清理按钮，清理历史日志，方便查看当前结果。

![Console](../../Resource/013_console.png)

## Button 的另一种写法

当按钮只执行一个函数时，可以使用更简洁的写法：

```swift
Button(action: ) {
    // View
}
```

这个写法中，action 指定按钮点击时需要执行的函数（无参数函数），花括号 {} 用于定义按钮的视图。

结合前面的 calculate 函数，可以写为：

```swift
Button(action: calculate) {
    Text("Button")
}
```

当点击按钮时，会直接执行 calculate 函数。

因此，当按钮逻辑简单，且只调用一个函数时，使用 action 的写法更清晰，也更符合代码规范。

## 算术运算符

算术运算符（Arithmetic Operators）用于数值计算：

- \+ 加法
- \- 减法
- \* 乘法
- / 除法
- % 取余（余数）

示例：

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

需要注意的是，Swift 是强类型语言，不会自动混合不同数据类型：

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

当两个类型不同时，需要手动转换类型。

## 比较运算符

比较运算符（Comparison Operators）用于判断两个值的关系，结果是 Bool：

- == 等于
- != 不等于
- \> 大于
- < 小于
- \>= 大于等于
- <= 小于等于

示例：

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

比较运算符常用于判断语句。例如在“名言轮播”中，我们需要控制索引不超过数组范围：

```swift
if index < sayings.count - 1 {
    index += 1
}
```

如果 index 小于 sayings.count - 1，比较结果为 true，if 语句中的代码会被执行；如果比较结果为 false，则不会执行后面的代码。

## 逻辑运算符

逻辑运算符（Logical Operators）用于组合多个条件：

- && 与（AND）
- || 或（OR）
- ! 非（NOT）

### && 与

当多个条件必须同时满足时，使用 &&。

例如：

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

在这个代码中，包含两个条件：age >= 18 和 age <= 100。

只有当这两个条件同时为 true 时，legalAge 才为 true；只要有一个条件不成立，结果就是 false。

### || 或

当多个条件中只需要满足一个时，使用 ||。

例如：

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

这段代码表示，只要 money >= 50 或者 creditCard >= 50 中任意一个成立，payAllowed 就为 true。

只有当两个条件都不成立时，结果才为 false。

例如，在支付场景中，可以使用现金或者信用卡进行支付。如果两者都不能支付，则支付失败。

### ! 非

! 是逻辑非运算符（NOT），用于对 Bool 值取反。

可以理解为，! 把 true 变成 false，把 false 变成 true。

例如：

```swift
let allowed = true
let result = !allowed   // false
```

这里的 !allowed 表示对 allowed 的值进行取反。

需要注意的是，! 和 != 是两种不同的运算符，! 对 Bool 值取反，!= 是比较运算符，返回 Bool 值。

## 赋值运算符

赋值运算符（Assignment Operators）用于赋值或更新变量：

- = 赋值

在变量声明或计算过程中，都会涉及赋值操作：

```swift
let a = 5
```

这段代码表示，将数值 5 赋值给变量 a。

### 复合赋值运算符

在实际开发中，除了基础的赋值运算符，还经常使用“复合赋值运算符”，用于在原有值的基础上直接进行计算并更新：

- +=
- -=
- *=
- /=

在前面“计数器”一节课中，我们已经简单了解过复合赋值运算符。

例如，当点击按钮时，让变量自动增加：

```swift
var num = 10
num += 5   // num = 15
```

这段代码表示，num 与 5 进行加法运算，再将结果重新赋值给 num。

因此，它等价于：

```swift
var num = 10
num = num + 5   // num = 15
```

## 三元运算符

Swift 中的三元运算符（Ternary Operator）会根据条件进行判断，并返回两个结果中的一个：

```swift
条件 ? 值1 : 值2
```

其执行逻辑为，如果条件为 true，返回“值1”；如果条件为 false，返回“值2”。

例如：

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

这段代码会判断 showColor 的值：如果为 true，返回 Color.blue，背景显示为蓝色；如果为 false，返回 Color.clear，不显示背景色。

提示：Color.clear 表示透明颜色（不显示内容）。

### 和 if-else 的区别

三元运算符在逻辑上等价于 if-else 语句。

例如，上面的代码可以写成：

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

两者的执行逻辑完全一致，条件为 true 时，执行第一种结果；条件为 false，执行第二种结果。

在实际使用上，三元运算符的写法更简洁，更适合表达“二选一”的简单判断，常用于直接返回一个值。

在 SwiftUI 的 View 构建中，三元运算符非常常见，例如：

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

这种写法可以在一行代码中，根据条件动态改变视图效果。

## 范围运算符

范围运算符（Range Operators）用于表示区间：

- ... 闭区间（包含两端）
- ..< 半开区间（不包含右边）

例如：

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

可以理解为，1...3 表示从 1 到 3，包含 3；5..<8 表示从 5 到 8，但不包含 8。

扩展形式（仅了解）：

```
5...    // >= 5
...5    // <= 5
```

这个写法表示“单侧范围”，常用于条件判断或模式匹配中。

范围运算符在后续学习 for 循环时使用，目前可以先理解为，一段连续的数值范围。

## 练习运算符

下面，我们通过几个简单的示例，在视图中练习运算符的作用。

### 1. 计算车辆总数

例如，某一个路口每天行驶 500 辆车，计算 30 天内行驶的车辆总数。

我们可以使用计算运算符：

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

这里的计算过程是，每天 500 辆车，30 天总量为 500 × 30，最终得到 15000 辆车的总数。

### 2. 判断内购会员

我们可以判断某个人是否为内购会员，只要它开通了永久会员或订阅会员中的任意一种，就视为会员。

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

这段代码中使用了 ||（或）运算符：lifeTime = false，表示没有永久会员；subscription = true，表示有订阅会员。

因为只需要满足其中一个条件，isMember 就为 true。因此，这个人是内购会员。

## 总结

在 Swift 中，运算符是数据计算与逻辑判断的基础，就像 Text 显示内容一样，运算符用于处理数据本身。

从最简单的数值计算，到复杂的逻辑判断，再到视图中的状态控制和布局计算，都离不开运算符的参与。

通过不同场景的练习，可以逐步熟悉并掌握本节课中介绍的各类运算符，这时后续学习的重要基础。

### 扩展知识 - 位运算符

此外，Swift 还提供了一类更底层的运算符 —— 位运算符（Bitwise Operators）：

- &（按位与）
- |（按位或）
- ^（按位异或）
- ~（按位取反）
- \>>（右移）
- <<（左移）

例如：

```swift
let a = 6  // 二进制 110
let b = 3  // 二进制 011

print(a & b) // 2 (二进制 010)
print(a | b) // 7 (二进制 111)
print(a ^ b) // 5 (二进制 101)
print(~a)    // -7 (取反)
```

在 Swift 中，整数采用二进制补码表示，取反后会得到对应的负数结果。

位运算符直接对二进制进行操作，通常用于底层数据处理、性能优化场景。

对于初学者来说，这类运算符的使用场景较少，在一般的 iOS 或 SwiftUI 开发中也不常见，因此这里不做深入讲解。

如果后续涉及到底层逻辑或性能优化，可以再进一步学习和理解。
