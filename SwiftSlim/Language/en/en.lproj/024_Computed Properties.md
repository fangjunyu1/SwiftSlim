# Computed Properties

In this lesson, we mainly learn computed properties.

Computed properties are used to calculate a new result from existing data. They can calculate numeric values, and they can also calculate content that needs to be displayed in SwiftUI views.

For example:

```swift
let a = 10
let b = 20
let c = a + b
```

Here, `c` represents the result after adding `a` and `b`.

In ordinary code, this style is very common.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tip: ordinary Swift code can run inside the tap event of a `Button`.

However, if we write similar code directly in the properties of a SwiftUI view, we will run into a problem.

For example:

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

This code will produce an error.

It looks like `a` and `b` are already written before `c`, so it seems that the value of `c` could be calculated.

But in a structure's property declarations, this style cannot be used directly.

## Why c cannot directly calculate a + b

Because `a`, `b`, and `c` are not temporary constants inside a button tap event. They are properties inside the `ContentView` view.

Inside a button tap event, this code can run normally:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Because after the button is tapped, the code runs in order. It creates `a` first, then creates `b`, and finally calculates `c` with `a + b`.

But when declaring properties inside a view, the situation is different:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Here, `a`, `b`, and `c` are all properties inside the `ContentView` view.

When creating the `ContentView` view, Swift needs to prepare these properties first. To keep the creation process safe, Swift does not allow the default value of one stored instance property to directly read other instance properties from the same instance.

So this line will produce an error:

```swift
let c = a + b
```

We can understand it simply as: **when declaring properties inside a view, we cannot directly use one ordinary property to calculate another ordinary property.**

A property that directly stores a value is called a "stored property." To make it easier to understand, we can temporarily think of it as an ordinary property.

For example:

```swift
let a = 10
```

`a` stores `10`.

```swift
let b = 20
```

`b` stores `20`.

But:

```swift
let c = a + b
```

Here, `c` is not a value written directly. Instead, we want it to be calculated through `a + b`.

For this kind of situation, where we "get a result from existing data," a computed property is more suitable.

We can change it to:

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

Here, `c` is a computed property.

```swift
var c: Int {
    return a + b
}
```

It means: **when `c` needs to be used, read `a` and `b` at that time, then return the result of `a + b`.**

For example:

```swift
Text("c: \(c)")
```

When `Text` displays `c`, the calculation of `c` is triggered at that moment.

## What is a computed property?

A computed property looks like a variable, but it does not store data itself.

For example:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Here, `c` is a computed property.

It does not store a fixed value like an ordinary property. Instead, every time `c` is read, it runs the code inside `{}` again and returns the calculation result.

We can understand it as:

```swift
var c: Int {
    return a + b
}
```

When we need to use `c`, we calculate `a + b`.

So a computed property is suitable for this situation: **a result does not need to be stored separately, because it can be calculated from existing data.**

## Basic syntax

A computed property usually contains three parts:

```swift
var c: Int {
    return a + b
}
```

### 1. Declare it with `var`

```swift
var c
```

A computed property must be declared with `var`; it cannot use `let`.

Because a computed property is not a fixed stored value, but a result that is dynamically calculated every time it is read.

### 2. Mark the return type

```swift
var c: Int
```

A computed property needs to mark its return type.

Here, `c` will eventually return an integer, so the type is `Int`.

### 3. Use {} to write the calculation logic

```swift
{
    return a + b
}
```

The content inside `{}` is the calculation logic. Here, it returns `a + b`.

## The return keyword

A computed property needs to return a result.

For example:

```swift
var c: Int {
    return a + b
}
```

Here, `return` means: return the result of the `a + b` calculation.

If the computed property contains only one expression that directly produces a result, `return` can be omitted:

```swift
var c: Int {
    a + b
}
```

However, if the computed property contains multiple lines of code, we need to use `return` to clearly return the result.

For example:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Here, the calculation process is divided into two steps.

Step one, calculate the total price first:

```swift
let total = count * price
```

Step two, combine the total price into text and return it:

```swift
return "Total: \(total) $"
```

If we remove `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total: \(total) $"
}
```

This code will produce an error.

The reason is: **this computed property already contains multiple lines of code, and Swift can no longer automatically determine which line is the final result to return.**

So when a computed property has only one result line, `return` can be omitted.

```swift
var c: Int {
    a + b
}
```

When a computed property contains multiple lines of code, it is recommended to write `return` clearly.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

## The difference between computed properties and ordinary properties

Ordinary properties store data.

```swift
var c = 30
```

Here, `c` stores a concrete value: `30`.

Computed properties do not store data.

```swift
var c: Int {
    a + b
}
```

Here, `c` does not store `30`. It only provides a way to calculate.

When `c` is read, Swift executes:

```swift
a + b
```

Then it returns the calculation result.

So computed properties are suitable for situations where a result is calculated from other data.

## body is also a computed property

After learning computed properties, we can understand one of the most common pieces of code in SwiftUI again:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Here, `body` is also a computed property.

It is declared with `var`:

```swift
var body
```

It has a return type:

```swift
some View
```

The content inside its `{}` returns SwiftUI view content:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

So `body` can be understood like this: when SwiftUI needs to display this view, it reads `body` and generates the interface according to the content returned by `body`.

If we write `return`, we can understand it like this:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

However, in SwiftUI, we usually omit `return` and write it directly:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

When `@State` data changes, SwiftUI reads `body` again and updates the interface according to the new data.

For example:

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

After tapping the button, `count` changes.

```swift
count += 1
```

After `count` changes, SwiftUI recalculates `body`, so the text in the interface also updates.

```swift
Text("count: \(count)")
```

This is also why, after data changes in SwiftUI, the interface can refresh automatically.

### It is not recommended to write complex calculations in body

Since `body` is a computed property, it may be read and recalculated many times.

For example:

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

When `name` changes, SwiftUI recalculates `body`.

At that time, the code inside `body` will also run again, and `num` will also be created again.

```swift
let num = 10
```

The `num` in this example is very simple, so the impact is not large.

However, if complex calculations are performed in `body`, such as filtering large amounts of data, sorting, image processing, and so on, it may affect the smoothness of the interface.

So in SwiftUI, `body` should mainly be responsible for describing the interface structure.

Simple temporary data can be written inside `body`.

Complex calculations can be placed in computed properties outside `body`, in methods, or in separate data processing.

## Example: quantity and total price

Next, we will understand computed properties through a simple example.

Suppose the unit price of one carrot is 2 $, the user can tap buttons to change the purchase quantity, and the interface needs to display the total price.

The total price calculation is:

```
quantity * unit price
```

If we use an ordinary variable to store the total price, it becomes somewhat troublesome.

Because every time the quantity changes, we need to manually update the total price.

A better way is to use a computed property:

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

Display result:

![view](../../Resource/024_view.png)

In this example:

```swift
@State private var count = 1
```

`count` represents the quantity of carrots. When the button is tapped, `count` changes.

```swift
private let price = 2
```

`price` represents the unit price of a carrot. Here it is a fixed value, so `let` is used.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` represents the total price.

It does not need to be stored separately, because the total price can always be calculated with `count * price`.

When `count` is `1`:

```swift
totalPrice = 1 * 2
```

The displayed result is:

```swift
totalPrice: 2 $
```

After tapping the `+` button, `count` becomes `2`.

At this time, when `totalPrice` is read again, it will be recalculated:

```swift
totalPrice = 2 * 2
```

The displayed result is:

```swift
totalPrice: 4 $
```

This is the role of a computed property: dynamically calculating a new result from existing data.

## Computed properties can be used for checks

Computed properties can not only calculate numeric values, but also return check results.

For example, when we want the minimum quantity to be 1.

When the quantity is already 1, the `-` button should not continue to decrease it.

We can add a computed property:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Complete code:

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

Display result:

![view](../../Resource/024_view1.png)

Here:

```swift
private var canDecrease: Bool {
    count > 1
}
```

This code means whether it is currently possible to decrease.

When `count` is greater than `1`:

```swift
canDecrease == true
```

It means decreasing is possible.

When `count` is equal to `1`:

```swift
canDecrease == false
```

It means decreasing cannot continue.

### Conditional check inside the button

The button uses:

```swift
if canDecrease {
    count -= 1
}
```

Only when `canDecrease` evaluates to `true` can `count` be decreased.

### Controlling the foreground color of a view

We can also use `canDecrease` to control the foreground color of the button:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Here, the ternary operator is used:

```swift
canDecrease ? Color.primary : Color.gray
```

This code means: if `canDecrease` is `true`, use `Color.primary` as the foreground color; if `canDecrease` is `false`, use `Color.gray` as the foreground color.

`Color.primary` is a system semantic color provided by SwiftUI. It represents the main text color in the current interface.

In light mode, `Color.primary` is usually close to black; in dark mode, `Color.primary` is usually close to white.

So the benefit of using `Color.primary` is that it automatically adapts to light mode and dark mode.

### Controlling the disabled state of a view

`disabled` is used to control whether a view is in a disabled state:

```swift
.disabled(!canDecrease)
```

When `disabled` is `false`, the view can be tapped.

When `disabled` is `true`, the view is disabled and cannot be tapped.

Using `canDecrease` as the condition here makes the code easier to understand.

When we see `canDecrease`, we know it means "whether it can continue to decrease right now."

### Additional note: why are there two checks?

Inside the `-` button:

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

Here, `.disabled(!canDecrease)` is used, and `if canDecrease` is also used inside the button.

`.disabled(!canDecrease)` is responsible for disabling the button in the interface so that the user cannot tap it.

`if canDecrease` is responsible for checking again before the code runs. It only runs `count -= 1` when decreasing is allowed.

This is double protection. In real development, if the button is already disabled, the internal check can be omitted. But in a teaching example, keeping it makes the role of `canDecrease` clearer.

## Summary

In this lesson, we mainly learned computed properties.

A computed property does not store a value directly. Instead, when it is read, it calculates a result from existing data.

For example:

```swift
var c: Int {
    a + b
}
```

Here, `c` does not need to be stored separately, because it can be calculated through `a + b`.

A computed property must be declared with `var`, and it needs to mark a return type.

```swift
var canDecrease: Bool {
    count > 1
}
```

Computed properties can return not only numeric values, but also check results, text content, and even SwiftUI view content.

In this lesson, we also learned `return`.

`return` means returning a result:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

If a computed property contains only one expression that directly produces a result, `return` can be omitted.

```swift
var totalPrice: Int {
    count * price
}
```

In addition, we also learned about `Color.primary` and `disabled`.

`Color.primary` is a SwiftUI system semantic color. It automatically adjusts its display according to light mode and dark mode.

```swift
.foregroundStyle(Color.primary)
```

`disabled` is used to control whether a view is disabled.

```swift
.disabled(true)
```

This means disabled, and it cannot be tapped.

```swift
.disabled(false)
```

This means available, and it can be tapped.

So computed properties are very common in SwiftUI. They can help us organize calculation results, check conditions, and displayed content more clearly.
