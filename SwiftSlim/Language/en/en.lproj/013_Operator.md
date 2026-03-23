# Operators

In this lesson, we will learn Swift operators.

Whenever we calculate, compare, or perform logical judgments, we need operators. These operations run through every stage of program execution and are one of the most fundamental abilities in programming.

```swift
let a = 100 * 8
```

While learning programming, many people discover that those with some mathematical thinking often understand program logic more easily. That is because programming, at its core, relies heavily on calculation and rule-based judgment, and operators are the core tools used to do that.

In actual development, operators are not only used for simple arithmetic, but also in many concrete scenarios.

For example, in a block game, when a user drags a block to a target location, we may need to calculate:

- The block's coordinate position
- The place where the block can be filled
- Whether the target position is valid

These processes of "calculation + judgment" fundamentally depend on operators.

![Block](../../Resource/013_block.png)

Learning operators is not only about learning arithmetic. It also lays the foundation for later interface layout, data processing, and interaction logic.

## How Calculations Are Executed in SwiftUI

In SwiftUI, calculations are usually triggered by a `Button`, while the actual calculation logic is written inside a function.

For example:

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

When the button is tapped, the Console outputs:

```text
c: 20
```

In this lesson, we will consistently place the calculation logic inside a `func`, trigger it with a button, and use `print` to display the result.

In the later examples, to simplify the presentation of the code, we will directly write the results in comments instead of repeatedly using `print`.

## Managing Console Output

Because each tap produces output information, you can click the clear button in the lower-right corner of the Console to clear the history logs and make the current result easier to inspect.

![Console](../../Resource/013_console.png)

## Another Button Syntax

When a button only needs to execute one function, a more concise form can be used:

```swift
Button(action: ) {
    // View
}
```

In this syntax, `action` specifies the function executed when the button is tapped, and the braces `{}` define the button's view.

Combined with the `calculate` function above, it can be written as:

```swift
Button(action: calculate) {
    Text("Button")
}
```

When the button is tapped, the `calculate` function is called directly.

So when the button logic is simple and only calls one function, using the `action` form is clearer and more in line with common style.

## Arithmetic Operators

Arithmetic operators are used for numerical calculations:

- `+` addition
- `-` subtraction
- `*` multiplication
- `/` division
- `%` remainder

Examples:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

One thing to note is that Swift is a strongly typed language, so it does not automatically mix different numeric types:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

When the two values have different types, you need to convert them manually first.

## Comparison Operators

Comparison operators are used to compare two values, and their result is a `Bool`:

- `==` equal to
- `!=` not equal to
- `>` greater than
- `<` less than
- `>=` greater than or equal to
- `<=` less than or equal to

Examples:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Comparison operators are often used in conditional statements. For example, in the quote carousel, we need to make sure the index does not exceed the array range:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

If `index` is less than `sayings.count - 1`, the comparison result is `true`, and the code inside `if` will execute. If the result is `false`, the following code will not run.

## Logical Operators

Logical operators are used to combine multiple conditions:

- `&&` AND
- `||` OR
- `!` NOT

### `&&` AND

When multiple conditions must all be satisfied, use `&&`.

For example:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

This code contains two conditions: `age >= 18` and `age <= 100`.

Only when both conditions are `true` will `legalAge` be `true`. If either one is false, the result is `false`.

### `||` OR

When only one condition out of several needs to be true, use `||`.

For example:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

This means that as long as either `money >= 50` or `creditCard >= 50` is true, `payAllowed` is `true`.

Only when both are false will the result be `false`.

For example, in a payment scenario, either cash or a credit card can be used. If neither works, then payment fails.

### `!` NOT

`!` is the logical NOT operator, used to invert a `Bool` value.

You can think of it like this: `!` turns `true` into `false`, and `false` into `true`.

For example:

```swift
let allowed = true
let result = !allowed   // false
```

Here, `!allowed` means taking the opposite of the value of `allowed`.

It is important to note that `!` and `!=` are different operators. `!` negates a `Bool`, while `!=` is a comparison operator that returns a `Bool`.

## Assignment Operators

Assignment operators are used to assign or update a variable:

- `=` assignment

Whenever we declare variables or perform calculations, assignment is involved:

```swift
let a = 5
```

This code means assigning the value `5` to the variable `a`.

### Compound Assignment Operators

In actual development, besides the basic assignment operator, we often use compound assignment operators to calculate based on the current value and update it directly:

- `+=`
- `-=`
- `*=`
- `/=`

We already briefly encountered compound assignment operators in the Counter lesson.

For example, when a button is tapped, we may want a variable to increase automatically:

```swift
var num = 10
num += 5   // num = 15
```

This means adding `5` to `num`, then assigning the result back to `num`.

So it is equivalent to:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternary Operator

Swift's ternary operator performs a check based on a condition and returns one of two results:

```swift
condition ? value1 : value2
```

Its logic is: if the condition is `true`, return `value1`; if the condition is `false`, return `value2`.

For example:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

This code checks the value of `showColor`: if it is `true`, return `Color.blue`, so the background is blue; if it is `false`, return `Color.clear`, so no background color is shown.

Tip: `Color.clear` means a transparent color.

### Difference from `if-else`

Logically, the ternary operator is equivalent to an `if-else` statement.

For example, the code above can also be written as:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

The execution logic is exactly the same: when the condition is `true`, use the first result; when it is `false`, use the second result.

In actual usage, the ternary operator is more concise and better suited for simple either-or decisions, especially when directly returning a value.

It is very common when building SwiftUI views, for example:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

This allows the appearance of a view to change dynamically according to a condition, all in one line.

## Range Operators

Range operators are used to represent intervals:

- `...` closed range, including both ends
- `..<` half-open range, excluding the right side

For example:

```text
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

You can think of `1...3` as "from 1 to 3, including 3," while `5..<8` means "from 5 to 8, but not including 8."

Extended forms, just for awareness:

```text
5...    // >= 5
...5    // <= 5
```

This syntax represents a one-sided range and is often used in conditional checks or pattern matching.

Range operators are often used later when learning `for` loops. For now, it is enough to understand them as a continuous range of numbers.

## Practicing Operators

Next, let us use a few simple examples to practice how operators work.

### 1. Calculating the Total Number of Vehicles

For example, suppose 500 cars pass through an intersection every day. We want to calculate the total number of vehicles over 30 days.

We can use arithmetic operators:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

The logic here is: 500 vehicles per day, multiplied by 30 days, giving a total of 15,000 vehicles.

### 2. Determining In-App Membership

We can check whether a person is an in-app member. As long as they have either a lifetime membership or a subscription membership, they count as a member.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

This code uses the `||` operator. `lifeTime = false` means there is no lifetime membership, while `subscription = true` means there is an active subscription.

Since only one of the two conditions needs to be satisfied, `isMember` becomes `true`. Therefore, this person is considered a member.

## Summary

In Swift, operators are the foundation of data calculation and logical judgment. Just as `Text` is used to display content, operators are used to process the data itself.

From the simplest arithmetic to complex logical checks, to state control and layout calculations in views, operators are everywhere.

By practicing with different scenarios, we can gradually become familiar with and master the operators introduced in this lesson. They are an important foundation for later learning.

### Extended Knowledge - Bitwise Operators

In addition, Swift also provides a lower-level group of operators: bitwise operators.

- `&` bitwise AND
- `|` bitwise OR
- `^` bitwise XOR
- `~` bitwise NOT
- `>>` right shift
- `<<` left shift

For example:

```swift
let a = 6  // binary 110
let b = 3  // binary 011

print(a & b) // 2 (binary 010)
print(a | b) // 7 (binary 111)
print(a ^ b) // 5 (binary 101)
print(~a)    // -7 (bitwise NOT)
```

In Swift, integers use two's complement binary representation, so after inversion you get a corresponding negative result.

Bitwise operators work directly on binary values and are usually used for lower-level data processing or performance-related scenarios.

For beginners, these operators have fewer common use cases, and they are not often needed in normal iOS or SwiftUI development, so we will not go into them in detail here.

If we later encounter lower-level logic or performance optimization, we can study them further then.
