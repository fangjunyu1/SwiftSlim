# Quote Carousel

In this lesson, we will build a "quote carousel" feature and take a deeper look at some core Swift concepts such as arrays (`Array`) and conditional statements (`if-else`).

We will see how to store multiple quotes and use button interaction to cycle through them.

![alt text](../../RESOURCE/011_word.png)

## Displaying a Quote

First, we need to display a quote in SwiftUI.

The simplest way is to use a `Text` view:

```swift
Text("Slow progress is still progress.")
```

This code can only display one fixed quote. If we want to show multiple quotes and switch between them, we need a way to store them.

However, a normal string variable can only store one quote:

```swift
let sayings = "Slow progress is still progress."
```

If we want to store several quotes, we would need to declare one variable for each quote:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

But in real development, this approach is not only tedious, it also makes switching difficult because each variable is independent.

To manage multiple quotes more conveniently, we need a data structure that stores them together. That is an array.

Using an array, the code above can be written as:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tip: in common programming style, array variable names that store multiple elements usually use a plural form, such as `sayings`, to reflect that they are collections.**

## Arrays

In Swift, an array is an ordered collection of elements, represented with square brackets `[]`.

```swift
[]
```

An array can contain multiple elements of the same type, separated by commas.

For example:

```swift
[101, 102, 103, 104, 105]
```

You can think of an array as a train:

![Array](../../RESOURCE/011_array1.png)

The entire train represents the array object, and each train car is arranged in order.

### Indexes and Accessing Elements

Because arrays are ordered, the system can locate specific elements according to their order. This positioning mechanism is called an index.

In Swift, as in most programming languages, array indexes start at `0`, not `1`. That means the first element has index `0`, the second has index `1`, and so on.

![Array](../../RESOURCE/011_array2.png)

If you want to access a specific element in an array, just write square brackets after the array name and put the index inside.

For example:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

If you try to access an index outside the valid range of the array, you get an "Index Out of Range" problem. So when accessing an array, be careful to make sure the index is valid.

**Index Out of Range**

For example, when an array contains 5 elements, the valid index range is `0` to `4`. If we try to access `sayings[5]`, the program cannot find the corresponding "train car," causing an index-out-of-range error and crashing the app.

![Array](../../RESOURCE/011_array3.png)

### Operating on Arrays

Arrays do not only support static definitions. They also support adding, removing, and modifying elements, and they can report their own length.

Tip: if you need to modify an array, you must declare it with `var`, not `let`.

**1. Adding an element**

You can use the `append` method to add an element to the end of an array:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Removing an element**

With the `remove(at:)` method, you can remove a specific element from an array:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modifying an element**

You can directly use the index to modify an element:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Getting the array length**

Use the `count` property to get the number of elements:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Using an Array to Display Quotes

To display multiple quotes, we can store them in an array and then access and display them by index.

First, create a `sayings` array in `ContentView` to store the quotes, then read and display the corresponding quote in `Text` by index:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Here, `sayings[0]` means the first quote in the array.

If you want to display a different quote, you only need to change the index inside the brackets:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Defining the Quote Index

To create a dynamic quote-switching effect, we cannot hard-code the index directly inside `Text`.

We need to create a variable to store the current index separately.

In SwiftUI, we can use `@State` to declare a mutable index:

```swift
@State private var index = 0
```

SwiftUI observes variables wrapped with `@State`. When `index` changes, SwiftUI re-renders the view and displays the corresponding quote.

Then we use `sayings[index]` to get the quote dynamically:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

When the value of `index` changes, `Text` displays a different quote.

### Controlling the Index with a Button

To control quote switching, we can use a `Button` to modify the value of `index`. Every time the button is tapped, `index` increases by `1`:

```swift
Button("Next") {
    index += 1
}
```

When we tap the button, the value of `index` changes from `0` to `1`, which triggers the view to refresh, and `Text(sayings[index])` reads the next quote.

However, there is a potential problem here: if we keep tapping the button, `index` will grow beyond the valid range of the array, causing an out-of-range error. For example, when `index` becomes `5`, the app crashes because the valid indexes are only `0` to `4`.

To prevent this, we need conditional control to ensure that `index` never goes beyond the array bounds. We can use an `if-else` statement to check whether `index` is still within the valid range.

## Conditional Control: `if-else`

`if-else` is one of the most common conditional branching statements in Swift. It checks whether a condition is true and then executes different code depending on whether that condition is true or false.

Basic structure:

```swift
if condition {
    // Code that runs when condition is true
} else {
    // Code that runs when condition is false
}
```

In an `if` statement, `condition` is a boolean value of type `Bool`, either `true` or `false`. If the condition is `true`, the code inside the `if` block runs. Otherwise, the code inside the `else` block runs.

For example:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

In this example, the value of `age` is `25`. The `if` statement checks whether `age > 18` is true. Since it is true, `"Big Boy"` is printed.

If you do not need an `else` block, you can leave it out:

```swift
if condition {
    // Code that runs when condition is true
}
```

### Using Conditions to Control the Index Range

To prevent the array index from going out of range, we can use an `if` statement to make sure `index` does not exceed the valid range:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logic analysis: the value of `sayings.count` is `5`, because there are 5 quotes. So `sayings.count - 1` equals `4`, which is also the last valid index of the array.

When `index` is less than `4`, tapping the button and increasing it by `1` is safe. Once `index` reaches `4`, the condition is no longer satisfied, and tapping the button will no longer do anything.

At this point, the code already implements quote switching:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Looping the Quotes

If we want the quote carousel to start again from the first quote after reaching the last one, we can implement that with the `else` part:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

When the button is tapped and `index` has reached the last element in the array, `index` is reset to `0`, starting the cycle again.

## Improving the Quote View

Now the quote carousel logic is working, but we can still improve the interface to make it look better.

Complete code:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

In this example, the `Text` view has a semi-transparent white background and rounded corners. The `Button` uses the `.borderedProminent` style, and the `VStack` has a background image.

Additional note: when using the `background()` modifier with an image background, its default behavior is to fill the layout region of the current view as much as possible. In many situations, it naturally extends to cover the Safe Area as well.

At this point, we have built the quote carousel view.

![SwiftUI View](../../RESOURCE/011_word.png)

## Summary

Through this lesson, we learned how to use an array to store multiple quotes and how to use `if` and `if-else` statements to implement quote cycling.

We also learned the basic operations of arrays, such as adding, removing, and modifying elements, as well as how to avoid index-out-of-range errors.

This lesson not only explained how to build the quote carousel, but also combined it with the basic usage of arrays and conditional statements, helping us develop the ability to handle data and control program flow.

## Extended Knowledge - Multiple Conditions: `if-else if-else`

In real development, we often need to handle multiple conditions. For example, in a game, when the score equals `1`, event `A` is triggered; when it equals `2`, event `B`; when it equals `3`, event `C`, and so on.

When a situation involves more than two branches, we can use `if-else if-else`.

Basic syntax:

```swift
if conditionA {
    // Code that runs when conditionA is true
} else if conditionB {
    // Code that runs when conditionB is true
} else if conditionC {
    // Code that runs when conditionC is true
} else {
    // Code that runs when none of the conditions are satisfied
}
```

In this kind of structure, the program checks the conditions in order and executes the first one that is satisfied. If none is satisfied, the code in `else` runs.

In the quote carousel, we can also write it with `if-else if-else`:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

When `index` is `0`, `1`, `2`, or `3`, each button tap runs `index += 1`. When `index` is `4`, which is the last element, `index` is reset to `0`, creating the loop.

The `else` branch acts as a fallback in case an invalid value appears, for example if `index` is modified incorrectly.

Note that the `==` used here means "is equal to." If an `if` statement checks whether `index` is equal to a certain number, the result is `true` if they match, and then the following code block is executed. If they do not match, the next `if` condition continues to be checked.

This kind of multi-branch logic is useful when different conditions should trigger different code.
