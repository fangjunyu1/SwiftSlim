# Type System

In previous lessons, we learned about variables and already know that variables can store different kinds of data.

For example:

```swift
var hello = "Hello, World"
```

Here, `hello` stores a piece of text, so its type is `String`.

Next, we will systematically learn the concept of types, as well as explicit type declarations and type inference, so that we can understand the nature of variables more deeply.

## What Is a Type?

In Swift, every value has a clear type. A type determines what that value is and what it can do.

For example:

- `42` is an `Int` (an integer)
- `"Hello"` is a `String`
- `true` is a `Bool`

They belong to different types and are used for different purposes.

## Common Basic Types in Swift

At the beginner stage, the most common types are:

- `String`: text
- `Int`: integers
- `Double`: floating-point numbers with decimals and higher precision
- `Bool`: boolean values (`true` / `false`)

In addition, there is `Float`, which is also a floating-point type, but its precision is lower than `Double`, so it is used less often. There is also `Character`, which represents a single character such as `"A"` or `"!"`.

### Type Declaration (Explicit Type)

In Swift, you can manually specify a type when declaring a variable:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

You declare a type by adding `: Type` after the variable name.

For arrays, the type is written as `: [Type]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

In this code, the `scores` array can only store elements of type `Int`, and `tags` can only store elements of type `String`.

Explicitly declaring a type can make the intention of the code clearer and can also help avoid type inference mistakes in some cases.

## Type Inference

In many situations, you do not need to declare the type explicitly:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"     // String
var isLogin = false  // Bool
var scores = [90, 85, 78]   // [Int]
var tags = ["Swift", "iOS"] // [String]
```

This works because the Swift compiler automatically infers the type based on the initial value.

## Explicit Declaration and Type Inference

In earlier lessons, we did not introduce explicit declarations like this:

```swift
var age: Int = 18
```

Instead, we preferred type inference:

```swift
var age = 18
```

In this example, the two forms are equivalent. In both cases, `age` is determined to be of type `Int`. Compared with explicit declaration, type inference is more concise.

The reason we did not emphasize explicit types at the beginning is that type inference reduces extra information in code, which lowers the cognitive cost for beginners.

## Why Do We Need Types?

Swift is a strongly typed language.

That means that once a variable's type is determined, it cannot be changed arbitrarily.

For example:

```swift
var age: Int = 18

age = 20       // Success
age = "20"     // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

The first `20` is of type `Int`, so it can be assigned to `age`. The second `"20"` is a `String`, which does not match `Int`, so Swift reports an error.

`nums` is an array of type `[Int]`, so it can only store integers and cannot mix in strings.

Types restrict how data can be used. They allow type mismatch problems to be found at compile time, reducing bugs caused by type confusion and improving code stability and maintainability.

## When Must You Explicitly Declare a Type?

Although Swift can infer types automatically, there are cases where the compiler cannot infer the type, or may infer it incorrectly. In those cases, you need to declare the type manually.

**1. Empty arrays**

When creating an empty array, you must explicitly declare its type:

```swift
var nums: [Int] = []
```

If you do not write the type:

```swift
var nums = []   // Error, Empty collection literal requires an explicit type
```

The compiler cannot determine what kind of elements the empty array is supposed to contain, so it reports a compile-time error.

**2. Avoiding incorrect inference**

```swift
var value = 10   // Int
```

In this example, although `10` could also represent a floating-point value, because there is no decimal point, the compiler infers it as `Int`.

If you want `value` to be a floating-point number, then you need to explicitly declare the type:

```swift
var value: Double = 10   // Double
```

When the result of type inference does not match what you want, you should use explicit type declaration or adjust the literal form to make sure the type is correct.

**3. Custom types**

Later we will also learn custom types. When using custom types, explicit declaration is often needed:

```swift
var info: GameInfo
var users: [User] = []
```

The reason is similar to the empty-array case: the compiler cannot infer the type automatically from an empty value.

## Type Conversion

In Swift, different types do not automatically convert to each other. You must convert them manually.

For example, adding two numbers of different types:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b   // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

In this code, `a` is `Int` and `b` is `Double`. Since the types are different, they cannot be used directly in the same operation.

Before calculating, you need to convert one of them to the same type:

```swift
var result = Double(a) + b
```

This means converting `a`, which is an `Int`, into `Double`, then adding it to `b`, and storing the result in `result`.

It is important to note that type conversion does not change the type of the original variable. For example, `Double(a)` does not change the fact that `a` is an `Int`. It only creates a new `Double` value for the calculation.

Other types can be converted in a similar way by writing the target type followed by `()`, then passing in the value you want to convert:

```text
Int()、Double()、String()
```

Examples:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int -> String

let price: Double = 9.9
let intPrice = Int(price)  // Double -> Int, 9
```

It is important to note that not every conversion preserves the value completely. For example, when converting `Double` to `Int`, the decimal part is truncated directly rather than rounded.

## Type Aliases

In Swift, you can also give an existing type another name to make code more expressive:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Here, `UserID` is still essentially `Int`. The actual type has not changed. The name simply becomes more meaningful.

In large or complex projects, type aliases can improve readability.

## A Type Example

Next, let us use a simple example to show how types work in actual development.

### Creating a Variable

First, create an `age` variable:

```swift
var age = 20
```

Because we need to display and modify this value in SwiftUI, we should declare it with `@State`:

```swift
@State private var age = 20
```

We mentioned `private` before. It means this variable can only be used in the current view. We will learn it more formally later.

### Displaying Data in SwiftUI

Display the `age` variable in SwiftUI:

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

Now the view displays:

```text
age: 20
```

### Modifying Data

Next, add two buttons to modify `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Running Result

When `changeAge1` is tapped, `age` is assigned the value `18`:

```swift
age = 18
```

Because `18` is of type `Int`, which matches the type of `age`, the assignment succeeds.

But `changeAge2` causes an error:

```swift
age = "18"
```

Error message:

```text
Cannot assign value of type 'String' to type 'Int'
```

This is because `"18"` is of type `String`, since strings must be wrapped in double quotes, while `age` is an `Int`. The types do not match, so the assignment is not allowed.

### Why Does This Error Happen?

The key is this line:

```swift
@State private var age = 20   // Int
```

Although the type is not explicitly declared, because the initial value `20` is an `Int`, the compiler automatically infers that `age` is of type `Int`.

Once the type is determined, it cannot later be assigned a value of another type.

Also, the `changeAge2` button does not fail at runtime. The error appears at compile time, and the code cannot even be compiled.

This is one of the strengths of Swift's type system: it can discover type problems while you are writing code.

### The Correct Version

After removing the incorrect code:

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

When the `changeAge1` button is tapped, the view updates to:

```text
age: 18
```

### Explicitly Declaring the Type (Optional)

You can also explicitly specify the type when defining the variable:

```swift
@State private var age: Int = 20
```

This makes the type clearer, but in simple cases it is not required.

## Summary

This lesson mainly explained Swift's type system and its role in real development.

In Swift, every value has a clear type. The type determines what the data means and what operations it can take part in.

Swift is strongly typed. Once a variable's type is determined, it cannot later be assigned a value of another type. This constraint catches errors at compile time, reducing runtime problems and improving code safety.

A variable's type can be inferred automatically from its initial value, or it can be declared explicitly. In some situations, such as empty arrays, incorrect type inference, or custom types, the compiler cannot infer the correct type. In those cases, explicit type declaration is required.

Different types do not convert automatically. You must explicitly convert them using forms like `Int()`, `Double()`, and `String()`.

Types also support aliases, which can improve readability especially in larger projects.

A type is not only a label for data. It is also a constraint mechanism that ensures data is used in a safe, clear, and controlled way.

## Extended Knowledge - Optional Types

In type conversion, some operations can fail.

For example, converting a `String` to a `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Here, `Double(input)` does not return `Double`, but:

```text
Double?
```

That is an optional type.

### Why Does It Return an Optional?

Because the content of the string is uncertain. `"3.14"` can be converted to `Double`, but `"Hello"` cannot.

That means the operation might succeed, or it might fail.

So Swift uses an optional type to represent this uncertainty.

### What Is an Optional Type?

An optional type means that a value may exist, or may not exist.

For example:

```text
Double?
```

This type means that if there is a value, printing it will show `Optional(...)`; if there is no value, it returns `nil`.

It is important to note that `nil` means "no value," not `0` and not an empty string.

### Example

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```text
pi:Optional(3.14)
```

This means the string was successfully converted to `Double`, producing `3.14`, but because the type is `Double?`, it is wrapped inside `Optional`.

If the conversion fails:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```text
pi: nil
```

Because `"Hello"` cannot be converted to `Double`, the conversion fails and returns `nil`.

### What Is `Optional(...)`?

When we directly print an optional value:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift displays its debugging description:

```text
Optional(3.14)
```

This is not part of the actual data. It is just Swift's way of telling us that the current value is an optional type that contains a real value inside.

### Unwrapping an Optional

In actual development, we often need to extract the real value from an optional. This process is called unwrapping.

One common way is to use `??` to provide a default value:

```text
??
```

This is called the nil-coalescing operator.

For example:

```swift
name ?? "FangJunyu"
```

This means: if `name` has a value, return that value; if it is `nil`, use the default value `"FangJunyu"`.

It is important to note that the default value must be of the same type as the optional.

### Using `??` to Provide a Default Value

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")   // 30
```

Output:

```text
pi: 30
```

When `input` is converted to `Double`, the conversion succeeds and the real value is used. If the conversion failed, the default value after `??` would be used.

If the conversion fails:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```text
pi: 10
```

Here, converting `input` to `Double` fails and returns `nil`, so `??` provides the default value.

Optional types are used to represent situations where a value may exist or may not exist.

In potentially failing operations such as type conversion, Swift returns an optional type to keep programs safe.

When we need to use the value inside, we can use `??` to provide a default value so that even if `nil` appears, we can still get a reasonable result.
