# Fill Light App

In this lesson, we will build a very fun fill light app. When night comes, we can let the phone screen display different colors and use it as a simple fill light.

This fill light app can switch colors by tapping the screen, and it can also adjust brightness with a slider.

In this example, we will learn how to use `brightness` to adjust view brightness, `onTapGesture` to add a tap gesture to a view, and the `Slider` control.

Result:

![Color](../../Resource/018_color.png)

## Displaying a Color

First, let us make the view display a color.

In SwiftUI, `Color` not only represents a color, but can also be displayed as a view:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Here, `Color.red` represents a red view. `.ignoresSafeArea()` makes the color view fill the entire screen, so it looks more like a real fill light effect.

Result:

![Color](../../Resource/018_color1.png)

### Color Array and Index

Right now, only one color is shown. But a fill light usually has more than one color. It may also display blue, yellow, purple, white, and more.

We want to switch between different colors when the screen is tapped. We can put these colors into an array for unified management:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

An array is suitable for storing "a group of data of the same type." Here, every element in the array is a `Color`.

If we want to display one specific color, we can use an index:

```swift
colors[0]
```

This means reading the color at index `0` in the array, which is the first color.

Now the code can be written like this:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

This way, the screen displays the first color in the array, which is red.

### Using the Index to Control the Color

If we need to switch between different colors, we need a variable to manage the index instead of hard-coding the index.

We can use `@State` to declare a variable that stores the index:

```swift
@State private var index = 0
```

Here, `index` represents the index of the current color.

When `index` changes, SwiftUI recalculates the interface and updates what is displayed.

Then change the original `colors[0]` to:

```swift
colors[index]
```

This way, the color displayed by the view is determined by `index`.

Now the code becomes:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

When `index` changes, `colors[index]` also displays a different color.

For example:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

One thing to note is that `index` cannot exceed the maximum index of the array, or an out-of-range index error will occur.

## Tap Gesture

Now we can display different colors based on `index`, but we still cannot tap to switch colors.

In the previous "Quote Carousel" lesson, we used `Button` to control quote switching.

This time, however, we want to "tap the entire color area" to switch colors, so `onTapGesture` is a better fit.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

When we tap the color view, this code runs:

```swift
index += 1
```

This means increasing `index` by `1`. After the index increases, `colors[index]` will display the next color in the array.

### `onTapGesture`

`onTapGesture` is a gesture modifier that adds a tap action to a view.

Basic usage:

```swift
.onTapGesture {
    // code
}
```

For example:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

When this red view is tapped, the code inside the braces runs and outputs this in the console:

```swift
Click color
```

Through `onTapGesture`, we can define what happens after a view is tapped.

### Difference from `Button`

Earlier, we learned the `Button` view. Both `Button` and `onTapGesture` can handle tap actions, but their usage scenarios are not exactly the same.

`onTapGesture` is more suitable for "adding tap functionality to an existing view," such as `Color`, `Image`, `Text`, or another ordinary view.

`Button` is more suitable when representing a clear button such as "Confirm," "Submit," or "Delete."

In this fill light app, we want the color-switching behavior to be simpler. Tapping the entire color area switches the color, so `onTapGesture` is a good choice here.

## The Index Problem

Now we can tap the screen to switch different colors.

But there is an important problem here: **the index may go beyond the array range**.

For example:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

If we keep tapping the screen, `index` will eventually become `4`, and then an "index out of range" error will occur.

This is because the `colors` array has `4` elements, but indexing starts from `0`, so the valid index range is `0 - 3`, not `4`.

If we access `colors[4]`, an "index out of range" error occurs.

In the current code, every tap increases `index` by `1`. If we do not handle it, it will eventually exceed the valid range.

So we need to check the index when the screen is tapped: if it is already the last color, go back to the first color; otherwise, continue adding `1`.

We can do this with an `if` statement:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

In this code, `colors.count` means the number of elements in the array.

There are 4 colors in the current array, so:

```swift
colors.count // 4
```

But the maximum index is not `4`, it is `3`, because indexing starts from `0`.

So the last index should be written as:

```swift
colors.count - 1
```

That is:

```swift
4 - 1 = 3
```

This logic means: if the current index already corresponds to the last color, reset the index to `0`; otherwise, increase it by `1`.

This way, the colors can switch in a loop.

### Optimizing the Index Logic

If we want the code to be more concise, we can also use the ternary operator:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

This code means: if `index == colors.count - 1` is true, return `0`. Otherwise, return `index + 1`.

Finally, assign the result back to `index`.

Now we can achieve the color-switching effect.

Complete code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Now we can tap the screen and switch between different colors. A basic fill light app is complete.

## Displaying the Color Name

We can add another group of text corresponding to the colors, so when the color changes, the current color name is also displayed on the screen.

For example:

- Red shows `Red`
- Blue shows `Blue`
- Yellow shows `Yellow`
- Purple shows `Purple`

We can also use an array here to store the color names:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

The order of the text in this array should correspond exactly to the order of the colors in the color array.

Then we can use `Text` to display the color name for the current index:

```swift
Text(colorsName[index])
```

`Text` displays the current color name according to `index`.

Use modifiers to improve the appearance of `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

This lets the `Text` appear in white, with a title-sized font and bold weight.

Now we have a full-screen `Color` view. If we want the `Text` to appear on top of the `Color` view, we need to use the `ZStack` layout container to layer them together.

```swift
ZStack {
    Color
    Text
}
```

So the code becomes:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

This way, the background is the color view, and a text view is layered on top.

Result:

![Color](../../Resource/018_color2.png)

One thing to note is that in a `ZStack`, views written later usually appear in front. If `Text` is written before `Color`, the later `Color` view may cover the `Text`.

## Controlling Brightness

Now we can switch between different colors, but a fill light has another important feature: **adjusting brightness**.

In SwiftUI, we can use the `brightness` modifier to adjust the brightness of a view.

For example:

```swift
.brightness(1)
```

We can write:

```swift
colors[index]
    .brightness(0.5)
```

This makes the current color brighter and closer to the effect of a fill light.

The brightness range is `0 - 1`. `0` means keeping the original color, and the closer the value is to `1`, the brighter the color becomes. `1` means the brightest white result.

Although we can control `brightness` in code, the user still cannot adjust it directly.

So we need to add a draggable control: `Slider`.

## Slider View

In SwiftUI, `Slider` is a control used to select a value within a range. Apple describes it as "a control for selecting a value from a bounded linear range."

Basic usage:

```swift
Slider(value: $value, in: 0...1)
```

Parameter explanation:

1. `value: $value`: `Slider` needs to be bound to a variable.

    When the slider is dragged, the variable changes at the same time. In turn, if the variable changes, the slider also updates.

    This is very similar to the `TextField` we learned earlier. Both of them "bind a control to a variable."

    A bound variable needs the `$` symbol in front of it to represent a binding.

2. `in: 0...1`: This parameter represents the value range of the slider.

    Here, `0...1` means the minimum value is `0` and the maximum value is `1`.

    When the slider is dragged to the far left, the bound variable is close to `0`; when dragged to the far right, it is close to `1`.

For example:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` is bound to the `value` variable. When the slider is dragged, the `value` variable changes at the same time.

Appearance:

![Slider](../../Resource/018_slider.png)

When the `Slider` is moved to the left side, the bound `value` becomes `0`. When moved to the right side, it becomes `1`.

### Value Range

The value range of `Slider` is not fixed. It can also be written as:

```swift
0...100
```

or another range.

But in this fill light app, we need to control brightness, so `0...1` is the most suitable choice.

## Using `Slider` to Control Brightness

Now we need to connect `Slider` with `brightness`.

First, create a variable to store the brightness value:

```swift
@State private var slider = 0.0
```

Here, `0.0` is a `Double` value.

Because `Slider` is usually bound to a numeric type, and here we want it to change continuously, `Double` is more suitable. Also, `brightness` can only take a `Double` value.

Then pass this value into `brightness`:

```swift
colors[index]
    .brightness(slider)
```

When `slider == 0`, the color stays in its default state. The closer `slider` is to `1`, the brighter the color looks.

### Adding the `Slider` Control

Next, add a `Slider` control to modify this variable:

```swift
Slider(value: $slider, in: 0...1)
```

When the slider changes, the value of `slider` also changes, and `brightness(slider)` updates the brightness at the same time.

This is a very typical example of "variables driving the view" in SwiftUI.

### Adjusting the Appearance of `Slider`

By default, `Slider` uses the available width.

We can give it a fixed width:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Then add some more modifiers to make it easier to see:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

This gives the slider a white background and rounded corners, making it stand out more clearly on the `Color` view.

Finally, place it at the bottom of the screen.

Since we already used `ZStack`, we can place a `VStack` inside it and use `Spacer()` to push the `Slider` to the bottom.

## Complete Code

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Result:

![Color](../../Resource/018_color.png)

## Summary

Using the knowledge we learned earlier together with basic concepts like colors and arrays, we built a very interesting fill light app.

Through this fill light app, we learned how to use `brightness` to adjust brightness, `onTapGesture` to add tap actions to views, and the `Slider` control.

We added `onTapGesture` to the `Color` view to switch colors. We also used the `Slider` control to change a variable that manages `brightness`, which is another example of "variables driving the view."

We also reviewed the ternary operator, used `ZStack` to layer views, and used arrays to manage a group of data of the same type. This helps deepen our understanding of arrays and indexes, including the practical issue of avoiding index out-of-range errors.

Although this example is not complicated, it connects many of the basic ideas we have learned before. When they are combined into a small real project, it becomes easier to understand what each concept is used for.

### Real-World Usage Scenario

Imagine placing an old iPhone on the desk and using the fill light app you developed yourself to control the light color. That would be a very nice experience.

There are many "fill light" apps on the App Store, and they do not look very complicated either.

![AppStore](../../Resource/018_appStore.PNG)

We can start developing from simple apps and try publishing them to the App Store. This not only increases our interest in development, but also records our growth.

### After-Class Practice

You can continue thinking about ways to expand this fill light app, such as:

- Add more colors
- Show the current brightness value
- Improve the design of the bottom slider area

When you really put this knowledge into use, you will discover that every concept we learn is actually a tool for building apps.

The more tools we master, the more features we can create.
