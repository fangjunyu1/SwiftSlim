# Counter

In the previous two lessons, we learned variables, constants, buttons, and functions.

In this lesson, we will combine that knowledge to build a simple counter app.

In this example, we will learn how to store and modify a variable, and how to manage it with `@State`.

## Building a Counter

A counter is often used to keep track of a quantity that needs to keep increasing, such as jump-rope counts or running laps.

Now let us build a simple counter: show a number and a button, and each time the button is tapped, the number increases.

![Num](../../RESOURCE/009_num.png)

### Displaying a Number

First, use `Text` to display a number.

```swift
Text("0")
```

However, if the number needs to change, then we should not hard-code `"0"`. Instead, we should store the number in a variable.

```swift
var num = 0
```

Then display the variable inside `Text`:

```swift
Text("\(num)")
```

Here we use string interpolation `\()` to convert the number into a string for display.

### Increase the Number with a Button

Next, add a button.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

When the button is tapped, we want the number to increase.

So we can modify the variable inside the button:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

This code means: when the button is tapped, calculate `num + 1`, then assign the result back to `num`.

### A Shorter Syntax

Swift provides a shorter way to write this:

```swift
num += 1
```

It is equivalent to:

```swift
num = num + 1
```

This syntax is called a compound assignment operator.

Common compound assignment operators in Swift include:

```text
+=   addition assignment
-=   subtraction assignment
*=   multiplication assignment
/=   division assignment
%=   remainder assignment
```

For example:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Complete Code

Now we can write a simple counter:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

However, this code will not run correctly.

### The Error

Xcode reports:

```text
Cannot assign to property: 'self' is immutable
```

This means the property cannot be modified because the view is immutable.

Why does this happen?

## How SwiftUI Works

In SwiftUI, **the interface is driven by data**, which means that when the data changes, the interface refreshes automatically.

But an important detail is that SwiftUI only monitors changes and refreshes the view when a piece of state changes, such as `@State` or `@Binding`.

If you use an ordinary variable, SwiftUI only reads its value once when the view is created. After that, even if the variable changes, the interface will not update.

For example:

```swift
var num = 0   // 0
num = 1   // 0
```

In the example above, `num` is an ordinary variable. Although its value changes, SwiftUI does not update the view, so the interface still shows the initial `0`.

![Num](../../RESOURCE/009_state.png)

So only when data is marked as state, such as with property wrappers like `@State` or `@Binding`, will SwiftUI automatically observe the change and update the view.

## The `@State` Property Wrapper

In SwiftUI, if you need to modify a variable and update the view, you must use `@State`.

```swift
@State var num = 0
```

`@State` tells SwiftUI to observe this variable.

When the variable changes, SwiftUI recalculates the view and updates it.

Complete code:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

Now, when the button is tapped:

```swift
num += 1
```

SwiftUI detects that `num` has changed and updates the view automatically.

![Num](../../RESOURCE/009_state1.png)

## Rules for Using `@State`

In real development, `@State` usually follows two rules.

### 1. `@State` Usually Uses `private`

`@State` variables are usually only used inside the current type, such as the current `View` struct, so they are commonly written like this:

```swift
@State private var num = 0
```

This prevents other views from directly accessing or modifying the variable.

We have not formally learned `private` yet, so for now you can simply understand it like this:

**Content marked with `private` can only be used inside the current view. Views outside cannot use it.**

### 2. `@State` Is Only for the Current View's Own State

`@State` is suitable for data managed by the current view itself.

For example, the contents of a text field or the state of a switch:

```swift
@State private var isOn = false
@State private var text = ""
```

If data needs to be shared among multiple views, then other state types such as `@Binding` or `@Observable` are needed.

We will learn those later.

### A Decrease Button

A counter does not only increase. It can also decrease.

We can add a `-` button.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Then use `HStack` to arrange the buttons horizontally:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Result:

![Num](../../RESOURCE/009_num1.png)

When the `+` button is tapped, the number increases by `1`. When the `-` button is tapped, the number decreases by `1`.

### A Reset Button

We can also add a reset button to set the number back to `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

When the reset button is tapped, `num` is assigned the value `0`.

Result:

![Num](../../RESOURCE/009_num2.png)

When the `0` button is tapped, the number becomes `0`.

### Custom Buttons

Right now, our buttons can only display text:

```swift
Button("+") {

}
```

This form of button can only show textual content, such as `+` or `-`.

In actual development, we usually want the button appearance to be richer, such as using icons or other views.

SwiftUI allows us to customize what a button displays. In that case, we can use another form of `Button`:

```swift
Button(action: {

}, label: {

})
```

In this syntax, `action` is the code executed when the button is tapped, and `label` is the view displayed by the button.

For example, we can make the button display an SF Symbols icon:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

This way, the button no longer shows text. It shows an icon instead.

### Optimizing the Counter Interface

To make the counter interface clearer, we can also adjust how the number is displayed. For example, enlarge the number:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Next, we can change the button labels to icons as well, and enlarge the icon size appropriately:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Similarly, we can also convert the decrease button and reset button into icon-based buttons:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Now the buttons display SF Symbols icons, and the interface becomes more intuitive.

![Num](../../RESOURCE/009_num3.png)

## Summary

In this lesson, by building a simple counter, we practiced variables, `Text`, and `Button` together. We used a variable to store the number and used buttons to increase or decrease it. We also learned compound assignment operators such as `num += 1` and `num -= 1`.

During the implementation, we learned how SwiftUI works: the interface is driven by data. The interface refreshes only when data changes. Because of that, we need to use `@State` to store changeable state. When an `@State` variable changes, SwiftUI automatically updates the view.

Finally, we made some simple UI improvements by adjusting the font style of `Text` and using `Button(action:label:)` to customize button content so that buttons could display icons, making the counter interface clearer and more visually appealing.

At this point, we have started to understand the basic way SwiftUI views work. In SwiftUI, most interfaces are driven by variables. When the variables change, SwiftUI updates the view automatically. So when developing SwiftUI apps, we usually need to first design the data that must be stored, and then use that data to build the interface and interaction logic.

## Complete Code

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
