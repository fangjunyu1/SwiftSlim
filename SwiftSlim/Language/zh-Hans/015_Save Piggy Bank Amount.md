# 保存存钱罐金额

在上一节课中，我们实现了一个简单的“存钱罐”。本节课，我们将学习如何让“存钱罐”的金额持久化保存。

本节课主要学习 UserDefaults 以及 @AppStorage 属性包装器，同时会延伸讲解 onAppear 的作用，以及可选类型（nil）的使用方式。

需要注意的是，本课需要沿用上一节课开发的“存钱罐”代码。

## 持久化保存问题

现在，“存钱罐”的界面非常简洁，使用也很方便。

![Piggy Bank](../../Resource/014_view.png)

但是，有一个明显的问题：每次刷新视图或者关闭应用时，“存钱罐”总金额总会变成 0，之前的总金额也会全部丢失。

这意味着数据并没有真正的保存，换句话说，现在的“存钱罐”，只能保存临时数据。

### 为什么不能持久化保存？

这是因为我们使用 @State 声明的变量：

```swift
@State private var amount = 0
```

@State 声明的变量，其生命周期完全依赖于视图。

当视图创建时，amount 初始化为 0，视图销毁时，amount 被销毁。

这里的 amount 保存的数据只存在于内存中，没有被保存到设备上。

我们并不希望 amount 和视图的生命周期绑定，就需要实现数据持久化保存。或者说，将数据保存到设备上。

### 什么是“数据持久化”

数据持久化可以理解为，把数据从“临时内存”保存到“设备存储”。

当关闭视图，或者关闭应用时，数据不会丢失。

在 Swift 开发中，简单的“数据持久化”可以使用 UserDefaults 保存，复杂的数据，则需要使用 SwiftData 或 CoreData 实现。

本节课，我们先学习最简单的 UserDefaults。

## UserDefaults

UserDefaults 用于保存轻量级键值对数据，常用于存储 String、Int、Double、Bool 等基础类型。

### 保存数据

UserDefaults 使用 set 方法保存数据：

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults 的第一个参数表示保存的数据，这里传入 String、Int 等类型的数据。

第二个参数 forKey 类似于变量名称，用于标识 UserDefaults 保存的数据。

### 读取数据

UserDefaults 使用对应方法读取：

```swift
let name = UserDefaults.standard.string(forKey: "name")    // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")    // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")    // true
```

读取时必须使用对应类型的方法，否则会出现错误或数据不正确。

### UserDefaults 注意事项

#### 1. 返回可选类型

在使用 UserDefaults 读取数据时，部分方法返回可选类型（Optional）。

例如：

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

返回的 name 类型为：

```swift
String?
```

这表示可能有值，也可能没有值。

**为什么返回可选类型？**

这是因为，UserDefaults 中的某个 Key，不一定存在对应的数据。

例如：

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

如果之前从未保存过 "City" 这个 Key，那么读取结果就是：

```swift
nil
```

需要强调的是，nil 表示没有数据，而不是空字符串。

在“类型系统”一节中，我们遇到过类似的问题，当数据类型转换失败时，会返回可选类型。

这时，我们就需要使用 ?? 提供默认值，进行解包：

```swift
let name = UserDefaults.standard.string(forKey: "City")    ?? "Rizhao"
```

如果 UserDefaults 读取到数据，使用读取的值；如果读取不到（nil），使用默认值。

#### 2. 返回非可选类型

UserDefaults 在读取 Int、Double、Bool 类型时，返回非可选类型。

例如：

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")    // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")    // false
```

即使这些 Key 从未被保存过数据，返回值也不会是 nil。

而是返回默认值：

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. 数据量限制

UserDefaults 只适合保存少量数据，比如应用配置、简单状态等数据。

在实际中，不适合保存大量数据或频繁读写的数据。

## 保存“存钱罐”金额

现在，我们可以使用 UserDefaults，实现保存“存钱罐”总金额的代码逻辑。

当用户点击按钮时，输入的金额叠加到总金额中，将总金额保存到 UserDefaults。

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
}
.buttonStyle(.borderedProminent)
```

现在，我们实现了数据写入的逻辑。

## 数据持久化逻辑说明

虽然，我们已经完成了数据持久化的写入逻辑，但在实际运行时会发现：每次刷新视图或者重新打开应用时，amount 变量仍然是 0。

这是因为：

```swift
@State private var amount = 0
```

在 SwiftUI 中，@State 变量在视图创建时，会被重新初始化。

虽然 UserDefaults 中保存了 amount 的值，视图重新加载时，amount 仍然会被重置为 0。

这说明，当前只是将数据保存到了 UserDefaults，并没有在视图中恢复数据。

因此，在视图加载时，还需要手动从 UserDefaults 中读取数据，并重新赋值给 amount，才能实现整个数据持久化的代码逻辑。

### 逻辑类比

可以将这个过程理解为“教室中的黑板”：

在上课时，老师会把内容写在黑板上，这些内容就像当前视图中的状态（@State）。

当课程结束后，黑板会被擦干净，为下一节课做准备。这相当于视图被销毁，@State 中的数据也会被清空。

为了避免教学内容丢失，老师会提前把内容保存到课件中。这个课件，就相当于 UserDefaults 中保存的数据。

当下一次重新上课时，黑板一开始是空的（@State 初始化），老师需要根据课件内容，把之前的知识重新写到黑板上（读取 UserDefaults）。

需要理解的是，黑板不会自动恢复之前的内容，必须通过“读取课件”（读取 UserDefaults）的方式重新写入。

## 使用 onAppear 读取数据

在视图显示时，需要手动读取 UserDefaults 中的值，并赋值给 @State 的 amount 变量，从而实现真正的数据持久化。

在 SwiftUI 中，可以使用 onAppear 在视图显示时执行初始化逻辑：

```swift
.onAppear {}
```

将读取 UserDefaults 的代码，放在 onAppear 中：

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

当视图创建时，amount 初始化为 0；当视图显示时，触发 onAppear，从 UserDefaults 中读取并赋值给 amount。这样，视图就可以显示上一次保存的总金额。

现在，整个“存钱罐”的数据持久化逻辑就完成了。

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
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage 属性包装器

SwiftUI 提供了 @AppStorage 属性包装器，可以简化 UserDefaults 的保存逻辑。

```
@AppStorage("amount") private var amount = 0
```

@AppStorage 是对 UserDefaults 的封装，"amount" 对应 UserDefaults 的 Key。

当视图创建时，会从 UserDefaults 中读取数据；当变量发生变化时，自动写入 UserDefaults 中。

支持 SwiftUI 的状态更新机制，和 @State 一样，在改变时会刷新 SwiftUI 视图。

也就是说，@AppStorage 可以实现数据的读取和保存逻辑，不再需要手动调用 UserDefaults，也不需要使用 onAppear 手动读取数据。

因此，我们可以使用 @AppStorage 替换代码中的 UserDefaults：

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## 总结

本节课主要学习了以下知识点：

首先，UserDefaults 用于保存轻量级数据，我们使用 UserDefaults 将总金额保存到设备上。UserDefaults 提供读取和写入等方法，并且还需要处理可选类型等情况。

其次，@State 变量仅用于管理视图中的临时状态，其生命周期与视图一致。视图重新创建时，@State 会重新初始化。

在恢复 UserDefaults 数据时，学习使用 onAppear 在视图显示时读取 UserDefaults，并完成数据恢复。

最后，使用 @AppStorage 对 UserDefaults 进行替换，实现视图加载时自动读取数据，在数据变化时自动写入，从而替代手动调用 UserDefaults 和 onAppear 的逻辑。

通过这些知识，我们可以实现一个基础的 App 数据存储功能，使数据能够被持久化保存。

## 课后练习

现在，“存钱罐”支持金额的保存，但是功能仍不完整。

1. 当用户需要取出金额时，需要设计对应的取出逻辑。
2. 当用户希望将金额清空时，也需要实现重置逻辑。
3. 如果希望为存钱罐添加名字，还需要引入 String 类型的数据保存。

可以在现有基础上完善这些功能，使“存钱罐”的功能更加完整。

## 扩展知识 - 输入框默认值问题

现在，我们还可以对输入框的交互进一步优化，让输入操作更便捷。

![textfield](../../Resource/015_view.png)

当前实现中，输入框默认值为 0。用户在每次输入金额时，都需要先删除 0，再输入新的数值，这种交互体验并不合理。

我们应该让输入框初始值为空，而不是 0。

这是因为，TextField 和 number 双向绑定：

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

当 number 初始化为 0 时，输入框也会显示 0。

因此，我们需要将 number 改为空值，也就是 nil。

```swift
@State private var number = nil
```

此时会出现错误：

```
Generic parameter 'Value' could not be inferred
```

这就是我们在“类型系统”中讲到的情况：当变量无法自动推测类型时，就需要显式声明变量类型。

因为我们将 number 设置为 nil，而 nil 本身不包含任何类型信息，编译器无法判断该变量是 String、Int，还是其他类型，所以会报错。

因此，我们需要为 number 显式声明类型：

```swift
@State private var number:Int? = nil
```

这里的 Int? 表示可选类型（Optional），表示 number 的值可以是 Int，也可以是 nil。

这样，在初始化时将其设为 nil，输入框就会显示为空，而不是 0。

### 解包可选类型

当我们将 number 修改为可选类型后，原有的计算代码会报错：

```swift
amount += number
```

提示：

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

这是因为，number 现在可能为 nil。如果直接参与计算，就变成：

```swift
amount += nil
```

很明显，nil 无法和 amount 相加，这是不合法的操作。

因此，在使用可选类型参与计算时，需要先进行解包。

这里可以使用 ?? 提供默认值：

```swift
amount += number ?? 0
```

当 number 为 nil 时，使用默认值 0；当 number 有值时，使用输入的实际数据。

这样既保证计算的正确性，也实现了输入框默认为空的效果，用户不需要再手动删除输入框中的 0。

## 扩展代码

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
