# Starting from ContentView

## Before Class

In this lesson, we will start with the `ContentView.swift` file and systematically get to know the basic structure of SwiftUI, including:

- Comments
- The `View` structure
- `VStack` / `HStack` / `ZStack` layouts
- SF Symbols icons
- View modifiers
- The preview code `#Preview`

First, find the Xcode project you created earlier and double-click the `.xcodeproj` file.

In the Navigator area on the left, select the `ContentView.swift` file.

Note: each time you open the project, the Canvas may show `Preview paused`. You can click the refresh button to resume the preview.

![Swift](../../RESOURCE/002_view7.png)

## Getting to Know ContentView

The `ContentView` code:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Although there is not much code here, it already contains the core structure of SwiftUI.

### 1. Comments

At the top of the file:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//
```

These are file comments used to record file information, including the file name, project name, creator, and creation date.

In Swift, `//` is used for single-line comments:

```swift
// This is a comment
```

Comments improve code readability and help developers understand the code logic.

In real development, code can become hard to understand. If you do not write comments, you may easily end up in a situation where you cannot understand your own code three days later.

Because of that, adding comments proactively while writing code is a good habit. You can use comments to record code logic and make later maintenance easier.

**Temporarily disabling code**

Comments can also be used to temporarily disable code so that we can troubleshoot problems.

For example:

```text
A
B
C
```

`A`, `B`, and `C` are three blocks of code, and one of them contains an error. We can temporarily comment out code to investigate.

First, add a comment to `A`:

```text
// A
B
C
```

If the code works normally after commenting out `A`, then the problem is probably in `A`.

If the problem still exists after commenting out `A`, then we can comment out `B`, and so on, until we find the problematic code.

During development, we run into many issues, and commenting out code is one of the most common ways to locate the cause. It helps us identify the problematic code and find bugs.

In Xcode, you can use the shortcut:

```text
Command ⌘ + /
```

to quickly add or remove comments.

### 2. Importing the SwiftUI Framework

```swift
import SwiftUI
```

This line means importing the SwiftUI framework.

Types such as `View`, `Text`, `Image`, and `VStack` all come from this framework.

If you do not import SwiftUI, Xcode will report an error:

```text
Cannot find type 'View' in scope
```

That means the compiler cannot recognize the `View` type.

### 3. The View Structure

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

The first time you see this `View` structure, it may feel unfamiliar because it contains keywords such as `struct`, `View`, `var`, `body`, and `some`.

We have not learned those keywords yet. For now, you only need to know that this code creates a `View` called `ContentView`.

You can think of a `View` as a canvas that we can draw on, and SwiftUI is the set of drawing tools.

For example:

![Swift](../../RESOURCE/002_view.png)

The image above shows three pages, and each page is essentially a `View`.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

When we build an app with SwiftUI, each page is a `View`.

### 4. SwiftUI Code

Inside the `View`, we see SwiftUI code like this:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

This SwiftUI code means: use a vertical layout and display an icon and a piece of text.

![Swift](../../RESOURCE/002_view1.png)

#### `VStack`

```swift
VStack { }  // Vertical layout
```

`VStack` represents a vertical layout container. The views inside it are arranged from top to bottom.

![Swift](../../RESOURCE/002_view8.png)

There are three common layouts in SwiftUI:

- `VStack` — vertical arrangement
- `HStack` — horizontal arrangement
- `ZStack` — overlapping arrangement on the Z-axis

```swift
HStack { }  // Horizontal layout
ZStack { }  // Overlapping layout
```

Illustration of the layout directions:

![Swift](../../RESOURCE/002_view2.png)

For example, use `HStack` for a horizontal arrangement:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

You can see that the globe icon and the text are displayed side by side.

![Swift](../../RESOURCE/002_view3.png)

When we want a horizontal arrangement, we use `HStack`. When we need overlapping layout, we use `ZStack`.

#### `Image` and SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

This code displays a globe icon. The icon comes from Apple's SF Symbols icon system.

![Swift](../../RESOURCE/002_view9.png)

The meaning of this code is: show a globe icon, make it large, and use the accent color.

Besides the globe, we can also display other icons.

For example, to display a backpack:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**How do we display other icons?**

We need to use Apple's official system icon library, SF Symbols.

Open Apple's developer website and download [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Open the SF Symbols app.

![Swift](../../RESOURCE/002_sf1.png)

The left side shows symbol categories, and the right side shows the corresponding icons.

Right-click an icon and choose to copy its name. The name is the string used in code.

For example:

```text
"globe"
"backpack"
"heart"
```

Put the copied icon name into `Image(systemName:)`, and you can display a different symbol.

Note: every SF Symbols icon has a minimum supported system version. If the system version is too low, the icon may not be displayed. You can check its compatibility information in the SF Symbols app.

#### Modifiers

In SwiftUI, a modifier is a method used to change the appearance or behavior of a view.

You can think of modifiers like clothing. With different clothes, the same view can present a different look.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` and `foregroundStyle` are modifiers applied to `Image`. They modify the appearance of the image without changing the image content itself.

**1. `imageScale`**

```swift
.imageScale(.large)
```

This controls the size of SF Symbols icons:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

We can try different options and make the SF Symbols icon display at different sizes.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` controls the foreground color.

`.tint` means the accent color of the current environment. By default, on iOS, this is blue.

If we want to change the foreground color to red:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### `Text`

`Text` is a text view used to display strings.

```swift
Text("Hello, world!")
```

For example, display my name:

```swift
Text("FangJunyu")
```

Note: strings must be wrapped in double quotes `""`.

You can try displaying your own name, phone number, or other text.

#### `padding`

In SwiftUI, `padding` is used to add empty space between the content of a view and its boundary. It belongs to the concept of inner spacing.

```swift
HStack {
    ...
}
.padding()
```

This code means adding the system's default padding around the `HStack` view.

**What is `padding`?**

`padding` means the empty space between the content of a view and its boundary.

In the image below, after adding `padding` to the blue `HStack`, the blue content area appears to shrink inward.

![Swift](../../RESOURCE/002_view6.png)

**Default padding**

The `padding()` modifier uses the standard spacing recommended by the system.

```swift
.padding()
```

This value differs depending on platform and context. For example:

- On iOS, it is usually around `16 pt`
- On macOS or watchOS, the standard spacing may be different according to the design guidelines of each platform

**Custom padding**

You can also set padding for specific directions.

1. Set a single direction

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Direction notes:

- `.top`: top padding
- `.bottom`: bottom padding
- `.leading`: leading-side padding
- `.trailing`: trailing-side padding

![Swift](../../RESOURCE/002_view12.png)

Note: `leading` and `trailing` automatically adapt to language direction. For example, in Arabic RTL environments, they will automatically flip.

2. Set multiple directions

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

You can use an array to specify multiple directions at the same time. We will explain arrays in more detail later. For now, you only need to recognize this syntax.

3. Set horizontal or vertical padding

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Equivalent to:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Remove padding**

If you do not want any padding, you can remove it with `.padding(0)`:

```swift
.padding(0)
```

Or simply delete the `padding` modifier:

```swift
// .padding()
```

### 6. Preview Code

```swift
#Preview {
    ContentView()
}
```

This code means generating a preview of `ContentView` in the Canvas.

Note: `#Preview` is new syntax introduced in Swift 5.9 / Xcode 15. Before that, SwiftUI used a `PreviewProvider` structure.

**What happens if we comment out `#Preview`?**

If we comment out the preview:

```swift
// #Preview {
//    ContentView()
// }
```

Then the Canvas will no longer display renderable content.

![Swift](../../RESOURCE/002_xcode.png)

That is because `#Preview` controls what preview view the Canvas should display.

When we need to preview a SwiftUI view in Xcode, we add the `#Preview` block. If we do not need the preview, we can comment it out or delete it.

## Summary

Although the `ContentView.swift` file does not contain much code, it actually covers multiple core SwiftUI concepts. For beginners, this code may feel unfamiliar, but by breaking it down piece by piece, we can build an initial understanding of SwiftUI.

Looking back at this lesson, we first learned about comments `//`, which can be used to explain code logic or temporarily disable code.

Next, we learned that a SwiftUI file must import the SwiftUI framework:

```swift
import SwiftUI
```

Without importing the framework, the compiler cannot recognize types such as `View`.

Then we got familiar with the basic structure of a SwiftUI view:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Here, `ContentView` is the name of the view.

We also learned the three common layout containers: `VStack` for vertical layout, `HStack` for horizontal layout, and `ZStack` for overlapping layout.

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

In this code, a vertically arranged container displays one icon and one piece of text.

`Image` can display SF Symbols icons, and its size and color can be controlled through modifiers.

The `Text` view displays text content.

`padding` adds transparent space around the view.

Finally, `#Preview` is used to show the preview in the Canvas.

### Practice After Class

For beginners, the content in this lesson may feel a bit complicated. We can deepen our understanding through further practice:

- Change the SF Symbols icon name
- Change the icon foreground color to black
- Change `VStack` to `HStack`
- Comment out `Image` or `Text` and observe how the preview changes

### Bonus: Code Completion

When entering code, you may already have noticed that Xcode automatically shows a list of available options.

For example, when modifying the `imageScale` modifier:

```swift
.imageScale(.)
```

Xcode displays the available choices:

![Swift](../../RESOURCE/002_view10.png)

This is called Code Completion. It is based on type inference and enum member suggestions, and it can improve typing efficiency while reducing mistakes.

We will officially introduce enums in a later lesson. For now, just keep this as a simple first impression.
