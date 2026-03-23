# Variables and Constants

This lesson mainly introduces variables and constants in Swift, along with some common data types and basic operators.

These are some of the most fundamental ideas in programming, and they are also an important foundation for learning SwiftUI later.

## Variables and Constants in Daily Life

We can understand variables and constants through things we see in everyday life.

Examples of variables in daily life:

- The content of each TV program is different
- The weather changes every day
- A clock changes every second

What these things have in common is that they change.

If the TV always showed the same image, the weather was always sunny, and the hands of the clock never moved, then these things would be constants.

One may change, while the other does not.

## Understanding Variables and Constants

In app development, users often need to enter or save certain information.

For example:

- Account name
- Birthday
- Contact information
- Address

This information needs to be stored and displayed.

For example, if a user enters a name in an app:

```text
FangJunyu
```

We need to save that name so that it can be displayed in the app.

You can think of the saving process as placing something into a drawer.

When we save a name, it is like putting that name into a drawer.

There may be many things to save, which means there may be many drawers. To know what is stored in each drawer, we need to give each drawer a name.

For example:

```text
name
```

In this example, `name` is the drawer name, and `FangJunyu` is the stored information.

![Var](../../RESOURCE/007_var.png)

**In Swift, if you need to store data, you must declare it using either a variable (`var`) or a constant (`let`).**

Because a name is usually changeable, we should use a variable.

```swift
var name = "FangJunyu"
```

This declares a variable named `name`. Its type is `String`, and its value is `"FangJunyu"`.

### The Difference Between Variables and Constants

Variables are declared with `var`:

```swift
var
```

Constants are declared with `let`:

```swift
let
```

For example:

```swift
var name = "FangJunyu"
let id = 123456
```

If something is declared as a variable, its value can be changed. If it is declared as a constant, it cannot be changed afterward.

So the main difference between a variable and a constant is whether the value is allowed to change.

### Modifying a Constant

If the code tries to change the value of a constant:

```swift
let name = "Sam"
name = "Bob"
```

Swift will report that the assignment cannot be completed because it is a constant.

```text
Cannot assign to property: 'name' is a 'let' constant
```

This mechanism helps developers avoid accidentally modifying important data.

### Displaying a Variable in SwiftUI

Open `ContentView.swift` and declare a variable inside the view:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Here, a variable named `name` is declared, and its value is displayed with `Text`.

If we change the content of the variable:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Then the text displayed by `Text` changes as well.

In this way, we can use variables to control what the interface shows, instead of directly editing the text inside `Text` every time.

If some other part of the app needs this information, we can also pass the variable there, which is like taking the content out of the "drawer" and giving it to another place to use.

### Where Variables and Constants Are Written in SwiftUI

In SwiftUI, variables and constants are usually written outside `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Of course, you can also write variables and constants inside `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

However, there is an important difference between the two:

- If variables and constants are written inside `body`, they are recreated every time the view is recalculated
- If they are written outside `body`, they exist as properties of the view structure, and the code structure is clearer

Because of that, in actual development, variables and constants are usually written outside `body`.

## Data Types

Variables can store many different kinds of data, and these kinds are called data types.

For example, earlier we used `Text` to display text:

```swift
Text("Hello, World")
```

Here, `"Hello, World"` is of the `String` type.

`String` is used to represent text, and in Swift it must be wrapped in double quotes.

For example:

```swift
var hello = "Hello, World"
```

Besides strings, there are many other data types in Swift.

At the beginner level, the four most common types are:

- `String`
- `Int`
- `Double`
- `Bool`

These four types are enough to handle most basic data processing.

**String**

`String` represents textual content, for example:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Strings are commonly used for usernames, titles, and text content.

**Int**

`Int` represents integers, meaning whole numbers without decimals.

For example:

```swift
var age = 26
var count = 100
```

Integers are commonly used for age, quantity, and counting.

**Double**

`Double` represents numbers with decimal points.

For example:

```swift
var weight = 74.5
var height = 185.0
```

In Swift, decimal numbers usually default to the `Double` type.

There is another similar type called `Float`, but it can represent a smaller range of values, so in real development, `Double` is used more often.

**Bool**

The `Bool` type is used to represent two states: `true` and `false`.

For example:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` is often used in conditional logic, such as whether to show an alert.

For situations with only two possible outcomes, `Bool` is especially suitable.

### Displaying Data in SwiftUI

When displaying a `String`, we can use `Text` directly:

```swift
Text(name)
```

But types such as `Int` and `Double` are not strings, so they cannot be directly used as part of text content.

If you want to display those values inside `Text`, you can use string interpolation:

```swift
\()
```

String interpolation must be written inside a string and use `\()` to wrap the variable or constant.

For example:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

In the code above, `""` represents a string, and `\()` is used to insert variables or constants into that string.

For example:

```swift
"DoubleNum: \(num * 2)"
```

The displayed content is:

```text
DoubleNum: 2
```

In this way, we can insert variables or constants into a string and then display them with `Text`.

Tip: `\()` can only be used inside a string `""`.

## Operators

When declaring variables or constants, we often see code like this:

```swift
var num = 1
```

Here, `=` is called the assignment operator.

Its job is to assign the value on the right to the variable on the left.

In this example, `1` is assigned to the variable `num`.

Besides the assignment operator, there are several common arithmetic operators:

- `+`
- `-`
- `*`
- `/`

When we calculate with numbers such as `Int` or `Double`, these operators are used.

For example:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

After the calculation is completed, the result is stored in the variable.

## Summary

Variables, constants, and operators are some of the most basic concepts in programming.

Through variables and constants, we can store different kinds of data in a program. Through data types, we can clearly define what kind of data it is. Through operators, we can calculate and process that data.

These concepts are like the basic tools of the programming world. Once you understand them, you will have a solid foundation for learning Swift and SwiftUI later.
