# 类型系统

在前面的课程中，我们已经学习了变量，并知道变量可以保存不同类型的数据。

例如：

```swift
var hello = "Hello, World"
```

这里的 hello 保存的是一段文本，因此它的类型是 String。

接下来，我们将系统学习类型（Type）的概念，以及显式声明类型和类型推断，以便更深入的理解变量的本质。

## 什么是类型

在 Swift 中，每一个值都有一个明确的类型。类型决定这个值是什么、能做什么。

例如：

- 42 是一个 Int（整数）
- "Hello" 是 String（字符串）
- true 是 Bool（布尔值）

它们属于不同的类型，用途也不同。

## Swift 常见基础类型

在初学阶段，最常见的类型如下：

- String：字符串（文本）
- Int：整数
- Double：浮点数（带小数，精度较高）
- Bool：布尔值（true/false）

此外，还有 Float（浮点数），但精度低于 Double，一般较少使用；Character（单个字符），例如 "A"、"!" 等单字符。

### 类型声明（显式类型）

在 Swift 中，可以在变量声明时，手动指定类型：

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

在变量名后加 ": 类型" 来声明变量的类型。

数组的类型写法是 ": [类型]"：

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

在这段代码中，scores 数组只能保存 Int 类型的元素，tags 只能保存 String 类型的元素。

显式声明类型可以让代码的意图更加清晰，并在某些情况下避免类型推断错误。

## 类型推断

在很多情况下，可以不去显式声明类型：

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]    // [Int]
var tags = ["Swift", "iOS"]    // [String]
```

这是因为，Swift 编译器会根据"初始值"自动推断类型。

## 显式声明和类型推断

在前面的课程中，我们没有引入显式声明，例如：

```swift
var age: Int = 18
```

而是优先使用类型推断：

```swift
var age = 18
```

在这个例子中，这两种写法是等价的，age 都会被确定为 Int 类型。相比之下，类型推断的写法更加简洁。

之所以在前期不强调显式声明，是因为类型推断可以减少代码中的额外信息，从而降低初学阶段的理解成本。

## 为什么需要类型

Swift 是一门强类型语言（Strongly Typed Language）。

这意味着：一旦变量的类型确定，就不能随意改变。

例如：

```swift
var age: Int = 18

age = 20    // Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

第一个 20 是 Int 类型，可以赋值给 age；第二个 "20" 是 String 类型，与 Int 类型不一致，因此会报错。

nums 是 [Int] 类型数组，只能存储整数，不能混入字符串。

类型可以约束数据的使用，在编译阶段发现类型不匹配的问题，从而减少类型混乱带来的 BUG，提高代码的稳定性和可维护性。

## 什么时候必须显式声明类型

虽然 Swift 可以自动推断类型，但有些情况编译器推断不出来，或者会推断错，这时就需要手动声明。

**1. 空数组**

在创建空数组时，必须显式声明类型：

```swift
var nums: [Int] = []
```

如果不写类型：

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

编译器无法根据空数组推断出数组的元素类型，因此会产生编译错误。

**2. 避免推断错误**

```swift
var value = 10   // Int
```

在这个例子中，虽然 10 也可以表示浮点数（Double），但由于没有小数点，编译器会将其默认推断为 Int 类型。

如果希望 value 表示浮点数，则需要显式声明类型：

```swift
var value: Double = 10   // Double
```

当类型推断结果不符合预期时，应通过显式声明类型或调整字面量形式来确保类型正确。

**3. 自定义类型**

我们后面还会学习自定义类型，使用自定义类型时，通常也需要显式声明：

```swift
var info: GameInfo
var users: [User] = []
```

这和空数组的原因相同，编译器无法从空值中自动推断类型。

## 类型转换

在 Swift 中，不同类型之间不能自动转换，必须手动转换。

例如，两个不同类型的数字相加：

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b    // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

在这段代码中，a 是 Int 类型，b 是 Double 类型，类型不同，无法直接进行运算。

在进行运算之前，需要先将其中一个值转换为相同类型：

```swift
var result = Double(a) + b
```

这段代码表示将 Int 类型的 a 转换为 Double 类型，再和 b 相加运算，计算结果赋值给 result。

需要注意的是，类型转换不会修改原变量类型。例如，Double(a) 不会改变 a 的 Int 类型，而是创建了一个新的 Double 值用于参与运算。

其他类型也可以使用类似的方式进行转换，即使用目标类型 + () 的形式，将需要转换的值传入。例如：

```
Int()、Double()、String()
```

示例：

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

需要注意的是，不是所有类型都可以转换成功，比如 Double → Int 时，会直接截断小数部分，不会四舍五入。

## 类型别名

在 Swift 中，也可以给已有类型起一个别名，让代码语义更清晰：

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

这里的 UserId 本质上还是 Int，类型没有改变，只是名字更有意义。

在代码量大、类型复杂的项目中，类型别名能让代码更易读。

## 类型示例

下面通过一个简单示例，演示类型在实际开发中的作用。

### 创建变量

首先，我们创建一个 age 变量：

```swift
var age = 20
```

因为需要在 SwiftUI 中显示和修改这个变量，因此需要使用 @State 进行声明：

```swift
@State private var age = 20
```

private 在之前提到过，表示这个变量只能在当前视图中使用，以后会进一步学习。

### 在 SwiftUI 中显示数据

在 SwiftUI 中显示 age 变量：

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

现在视图会显示：

```swift
age: 20
```

### 修改数据

接下来，我们添加两个按钮来修改 age：

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### 运行结果

当点击 changeAge1 时，age 会被赋值为 18：

```swift
age = 18
```

因为 18 是 Int 类型，与 age 类型一致，因此赋值成功。

changeAge2 会出现错误：

```swift
age = "18"
```

错误信息：

```
Cannot assign value of type 'String' to type 'Int'
```

这是因为 "18" 是 String 类型（字符串需要使用 "" 包裹），而 age 是 Int 类型，类型不一致，无法赋值。

### 为什么会报错？

关键在于这行代码：

```swift
@State private var age = 20   // Int
```

虽然没有显式声明类型，但由于初始值 20 是 Int 类型，所以编译器会将 age 自动推断为 Int 类型。

一旦类型确定，就不能再赋值为其他类型。

而且，changeAge2 按钮并不是在“运行时失败”，而是在编译阶段就会报错，代码无法通过编译。

这也是 Swift 强类型的优势之一：可以在编写代码时，提前发现类型问题。

### 正确写法

删除错误代码后：

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

点击 changeAge1 按钮，视图会更新为：

```
age: 18
```

### 显式声明类型（可选）

也可以在定义时，明确指定类型：

```swift
@State private var age: Int = 20
```

这种写法可以让类型更加清晰，但在简单场景下并不是必须的。

## 总结

这节课主要讲了 Swift 的类型系统及其在实际开发中的作用。

在 Swift 中，每个值都有明确的类型，类型决定数据的含义，以及它可以参与的操作。

Swift 是强类型，变量一旦确定类型，就不能再赋值为其他类型。这个约束可以在编译阶段发现错误，从而减少运行时问题，提高代码安全性。

变量的类型可以根据初始值自动推断，也可以显式声明。在某些情况下（如空数组、类型判断错误、自定义类型），编译器无法正确推断类型，这时必须显式声明。

不同类型之间不能自动转换，必须通过 Int()、Double()、String() 等方式显式转换。

类型也支持别名，特别是在复杂的项目中，类型别名可以提高可阅读性。

类型不仅是数据标记，还是一种约束机制，可以确保数据的使用是安全、明确且可控的。

## 扩展知识 - 可选类型

在进行类型转换时，有些操作可能会失败。

例如，将 String 转换为 Double：

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

这里的 Double(input) 返回的不是 Double，而是：

```
Double?
```

这就是可选类型（Optional）。

### 为什么会返回可选类型？

因为字符串的内容是不确定的，"3.14" 可以转换为 Double，"Hello" 无法转换为 Double。

也就是说，这个操作可能成功，也可能失败。

因此，Swift 使用可选类型来表示这种不确定性。

### 什么是可选类型？

可选类型表示：一个值可能存在，也可能不存在。

例如：

```
Double?
```

这个类型表示，如果有值，打印时会显示 Optional(...)，如果没有值，则返回 nil。

需要注意的是，nil 表示 "没有值"，而不是 0 或空字符串。

### 示例

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

输出：

```
pi:Optional(3.14)
```

这表示，字符串成功转换为 Double，得到 3.14，但由于类型是 Double?，所以被包裹在 Optional 中。

如果转换失败：

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

输出：

```
pi: nil
```

因为 "Hello" 无法转换为 Double 类型，所以转换失败，并返回 nil。

### Optional(...)是什么？

当我们直接打印可选类型时：

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift 会显示其“调试描述”：

```
Optional(3.14)
```

这并不是实际数据的一部分，而是提示当前值是一个"可选类型"，并且内部包含一个值。

### 解包可选类型

在实际开发中，我们通常需要从可选类型中取出真实的值，这个过程称为解包（Unwrapping）。

一种常见方式是使用 ?? 提供默认值：

```
??
```

这叫做：空合并运算符（Nil-Coalescing Operator）。

例如：

```swift
name ?? "FangJunyu"
```

这段代码表示，如果 name 有值，返回对应的值；如果是 nil，就使用默认值 "FangJunyu"。

需要注意的是，默认值的类型必须与可选类型一致。

### 使用 ?? 提供默认值

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")    // 30
```

输出：

```
pi: 30
```

input 被转换为 Double 类型时，转换成功并输出值。如果转换失败，就会输出 ?? 提供的默认值。

如果转换失败：

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

输出：

```
pi: 10
```

在这里，input 被转换为 Double 类型时，转换失败并返回 nil，?? 会为 nil 提供一个默认值。

可选类型用于表示“可能有值，也可能没有值”的情况。

在类型转换等可能失败的操作中，Swift 会返回可选类型，以保证程序的安全性。

当我们需要使用其中的值时，可以通过 ?? 提供默认值，从而在 nil 出现时依然能够得到一个合理的结果。
