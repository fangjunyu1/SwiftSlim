# Let the Button Start Working

This lesson mainly covers SwiftUI `Button`, `print` for debugging output, and Swift functions.

These topics are the foundation of interactive programming in SwiftUI.

## Button

Buttons are one of the most common UI controls. When we need to download, open, quit, or perform other actions, we usually tap a button.

For example, in the App Store, we tap the `Get` button to download an app.

![Button](../../RESOURCE/008_button.png)

In SwiftUI, buttons are represented by `Button`.

Basic usage:

```swift
Button("") {
    
}
```

Its structure can be divided into two parts:

```swift
Button("Button Text") {
    Code to run when the button is tapped
}
```

For example:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

After running it, a `Start` button will appear.

![Button](../../RESOURCE/008_button1.png)

When the user taps the button, the code inside `{}` will execute.

One important thing to note is that `Button` is a SwiftUI interface control, which means it is a `View`, so it must be written inside `body`.

### The `buttonStyle` Modifier

In SwiftUI, `Button` provides built-in system styles, and you can use them through the `buttonStyle` modifier.

For example:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` applies a button style provided by the system.

Common options include:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

The differences between styles are mainly whether the button has a border, background, and how visually emphasized it is.

## `print` Output

In programming, we often need to check whether the program has reached a certain section of code.

Swift provides the `print` function to output debugging information.

Basic syntax:

```swift
print("Hello")
```

This line outputs the text to the Console.

### Testing Whether a Button Works

We can place `print` inside a button to test whether the button is being tapped.

```swift
Button("Start") {
    print("Test 123")
}
```

When the button is tapped, the Console outputs:

```text
Test 123
```

This means the button has been triggered successfully.

![Button](../../RESOURCE/008_button3.png)

Note: `print` is Swift code, not a UI control. It cannot be placed directly in `body`, otherwise it will cause an error.

For example, the following is incorrect:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Error: body must return a View
    }
}
```

In SwiftUI, `body` is used to describe the interface structure, so it can only contain `View` elements such as `Text`, `Button`, and `Image`.

Regular code such as calculations or `print` statements must be placed inside buttons, functions, or other event handlers.

### The Console

The content printed by `print` appears in Xcode's Console.

If you cannot see the Console, you can click the `Show the Debug Area` button in the lower-right corner to open the debug area, and then click `Show the Console` to display the Console.

![](../../RESOURCE/008_button4.png)

In the lower-left corner of the Console, there are two tabs: `Executable` and `Previews`.

![](../../RESOURCE/008_button5.png)

These two tabs correspond to different running environments. When previewing in the Canvas, `print` output appears under the `Previews` tab. If the app is running in the simulator or on a real device, the output appears under the `Executable` tab.

So if you find that `print` is not showing anything, first make sure you are looking at the correct tab.

## Example - ASCII Art

In some code projects, we often see ASCII art.

ASCII art is a picture made using ordinary characters, for example:

![ASCII](../../RESOURCE/008_ascii.png)

We can use a button plus `print` to output an ASCII drawing.

Example code:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

When the button is tapped, the Console outputs:

```text
 /\_/\
( o.o )
 > ^ <
```

Note: in a string, `\` needs to be escaped, because backslash is an escape character in strings.

## Functions

Inside a button, we can write code directly.

For example:

```swift
Button("Start") {
    print("Hello")
}
```

If there is only a little code, this is fine. But in real development, the logic triggered by a button can become much longer.

For example:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // There may be much more code
}
```

If the code keeps growing, writing everything directly inside the button will make the interface code messy and hard to read or maintain.

So we usually organize that logic into a function, then call the function from inside the button.

### What Is a Function?

A function is a block of code that can be reused.

When certain code needs to run, we only need to call the function, and the code inside it will execute.

This makes the code structure clearer and easier to reuse.

### Basic Syntax

In Swift, functions are defined using the `func` keyword:

```swift
func randomInt() {
    // code
}
```

This code defines a function.

`randomInt` is the function name used to identify this block of code.

`()` is the place for parameters, where the function can receive data passed in from outside. If no data is needed, it can stay empty.

Inside `{}` is the function body, and all code that needs to run is written there.

For example:

```swift
func getName() {
    print("FangJunyu")
}
```

The purpose of this function is to print a piece of text.

### Calling a Function

Defining a function only creates it. If you want to execute it, you still need to call it.

The way to call a function is to add `()` after the function name:

```swift
getName()
```

When the program reaches this line, it runs the code inside `getName`.

Complete example:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

After running it, the Console outputs:

```text
FangJunyu
```

### Using Functions in SwiftUI

In a SwiftUI view, functions are usually written outside `body`.

For example:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

When the button is tapped, it calls the `getName()` function.

This keeps the interface code simple while the actual logic is handled inside the function.

### Function Parameters

Sometimes, a function needs to perform different actions based on different data.

For example, we may want a function to output different names instead of always outputting the fixed string `"FangJunyu"`.

In that case, we can use parameters. A parameter can be understood as data passed in when the function is called.

For example:

```swift
func getName(name: String) {
    print(name)
}
```

This function adds one parameter. `name` is the parameter name, and `String` is the parameter type.

This means the function needs to receive a piece of data of type `String`.

Because the function now needs data, you must provide that data when calling it.

```swift
getName(name: "Sam")
```

When `"Sam"` is passed in, the function uses that value and prints it.

Result:

```text
Sam
```

## Example - Output ASCII Art Using a Function

In the previous example, we wrote `print` directly inside the button.

But if the ASCII art becomes more complicated, the code will become long. At that point, we can move the logic into a function so that the interface code stays cleaner.

Example code:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

After running it and tapping the button, the Console outputs:

```text
 /\_/\
( o.o )
 > ^ <
```

Two things happen here when the user taps the button:

1. The button calls the `printCat()` function
2. The `print` statements inside the function are executed

This allows the interface code to focus only on triggering the action, while the actual logic is handled inside the function.

In real development, most button actions are implemented through functions.

## Summary

In this lesson, we learned three important things:

**1. Button**

`Button` is the SwiftUI control used to trigger actions.

```swift
Button("Start") {

}
```

When the user taps the button, the code inside the braces runs.

**2. `print` output**

`print` is used to send debugging information to the Console.

```swift
print("Hello")
```

Developers can use the Console to observe whether the program is running as expected.

**3. Functions**

A function is a block of reusable code.

```swift
func sayHello() {
    print("Hello")
}
```

Calling a function:

```swift
sayHello()
```

If the function needs data, you can use parameters:

```swift
func sayHello(name: String) {
    print(name)
}
```

In later lessons, we will continue learning more SwiftUI controls and how data interacts with the interface.

## Practice

Try completing the following exercises:

1. Create a button with the text `Hello`
2. When the button is tapped, output `Hello Swift` in the Console
3. Move the output code into a function, and then call that function from the button
