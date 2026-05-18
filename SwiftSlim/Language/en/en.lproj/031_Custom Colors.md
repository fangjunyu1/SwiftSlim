# Custom Colors

In this lesson, we will learn how to customize colors in SwiftUI.

In previous lessons, we have already used the default colors provided by SwiftUI, for example:

```swift
Color.blue
Color.red
Color.green
```

These colors are convenient to use, but in real App development, default colors are often not precise enough.

For example, a design may use colors like these:

```text
#2c54c2
#4875ed
#213e8d
```

This kind of color is called a Hex color.

In this lesson, we will first make SwiftUI support Hex colors, then use `static` to organize commonly used colors.

Finally, we will apply custom colors to the animal encyclopedia view and further use a gradient background to make the buttons look more layered.

## Why Do We Need Custom Colors?

In SwiftUI, we can use system colors directly.

For example:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Here, `.blue` means blue. It is actually a shorthand form of `Color.blue`.

The advantage of default colors is that they are simple and convenient, but the available choices are limited.

For example:

```swift
Color.blue
```

This can only represent the default blue provided by SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

However, in actual development, we often need more specific colors.

For example, even if they are all blue, there may be different effects such as light blue, dark blue, gray blue, and bright blue.

![More Blue](../../../Resource/031_color5.png)

At this point, if we only use `Color.blue`, it will be difficult to reproduce the design effect.

So, we need to make SwiftUI support custom colors.

## What Is a Hex Color?

Colors on a screen are usually made up of three channels: red, green, and blue. This is RGB.

RGB stands for:

```text
Red     // Red
Green   // Green
Blue    // Blue
```

A Hex color is one way to represent an RGB color.

For example:

```swift
#5479FF
```

This color value can be simply understood as three parts:

```text
54  // Represents the red channel
79  // Represents the green channel
FF  // Represents the blue channel
```

In this lesson, we do not need to calculate these values or deeply understand hexadecimal rules.

For now, we only need to know that `#5479FF` represents a specific color.

Later, when we see formats like `#2c54c2` and `#4875ed`, we can first understand them as color values.

In design tools such as Sketch, Figma, and Photoshop, we can also often see similar color values.

![color](../../../Resource/031_color.png)

However, SwiftUI does not support writing this directly by default:

```swift
Color(hex: "#5479FF")
```

So, we need to extend the `Color` type ourselves so that it supports creating colors from Hex strings.

## Create the Color+Hex.swift File

First, create a new Swift file.

The file name can be:

```text
Color.swift
```

It can also be written more clearly as:

```text
Color+Hex.swift
```

Here, it is more recommended to use:

```text
Color+Hex.swift
```

In Swift projects, file names like `Color+Hex.swift` are very common.

It means this file is an extension file that adds Hex capability to `Color`.

The file name does not directly affect code execution. It is only used to help us understand the purpose of the file more easily.

## Add the Color(hex:) Code

In the `Color+Hex.swift` file, write the following code:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

This code uses `extension` to extend the `Color` type and adds a new initializer to `Color`:

```swift
init(hex: String)
```

After we have this initializer, we can pass a Hex string to `Color` to create a custom color:

```swift
Color(hex: "#5479FF")
```

Inside this extension code, the Hex string is converted into an RGB color that SwiftUI can recognize.

At this stage, you do not need to deeply understand the conversion logic of every line. You only need to know that the added `Color(hex:)` method lets us create custom colors from Hex color values.

## Use Custom Colors

Now, we can test custom colors in `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Display effect:

![color](../../../Resource/031_color1.png)

In this example, the first line uses a system color:

```swift
.foregroundStyle(Color.blue)
```

The following three lines use custom Hex colors:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

By comparison, we can see that the system blue only has one default effect.

Hex colors, however, can represent more detailed variations of blue.

This is the value of custom colors: they can make interface colors closer to the real design and make it easier for us to control the visual style of an App.

## Use static to Organize Colors

Now, we can already create colors from Hex strings:

```swift
Color(hex: "#2c54c2")
```

This writing style works normally, but if the same color appears repeatedly in multiple places, later maintenance will be inconvenient.

If this color value is written in 10 different places, then when we want to change this blue later, we need to modify it one by one.

At this point, we can use `static` to organize commonly used colors in one place.

At the bottom of the `Color+Hex.swift` file, continue adding the following code:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Here, we have added three static properties to `Color`: `animalBlue`, `animalLightBlue`, and `animalDarkBlue`. They represent different shades of blue.

Because these properties use `static`, they belong to the `Color` type itself.

When using them, we can access them directly through `Color.`:

```swift
Color.animalBlue
```

This writing style is clearer than directly writing a Hex string.

When we see `Color.animalBlue`, we can know that it represents the blue used in the animal encyclopedia.

But when we see `Color(hex: "#2c54c2")`, we can only know that it is a color value, and it is not easy to tell its specific purpose.

Managing colors in one place has another benefit: later changes are easier.

If we want to adjust the main color of the animal encyclopedia, we only need to modify the definition location:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

All places that use this color will be updated together.

This is the meaning of using `static` to organize colors: it makes color names clearer and later maintenance more convenient.

## Apply It to the Animal Encyclopedia

Now, we can apply custom colors to the previous animal encyclopedia view.

Previously, the background of the animal button was white:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Now, we can change it to a custom color:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Here, `Color.animalBlue` is the static color we just defined in `Color+Hex.swift`.

The button text uses white:

```swift
.foregroundStyle(Color.white)
```

The background of the animal emoji uses translucent white:

```swift
.background(Color.white.opacity(0.15))
```

This gives the button a unified blue visual style.

The focus of this step is not to add complex code, but to truly apply the custom colors learned earlier to the interface.

## Use a Gradient Background

Besides using a single color, we can also combine multiple colors into a gradient effect.

For example, we defined these colors earlier:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

These colors can be used not only individually, but also combined into a gradient background.

In SwiftUI, we can use `LinearGradient` to create a linear gradient.

For example:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

This code creates a left-to-right gradient background, with the color gradually transitioning from `Color.animalBlue` to `Color.animalLightBlue`.

Here, `colors` is used to set the colors participating in the gradient, while `startPoint` and `endPoint` are used to control the gradient direction.

### Test the Gradient Effect

We can use a simple Text to test the gradient background.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Display effect:

![color](../../../Resource/031_color3.png)

In this example, the background of `Text` is no longer a single color. Instead, it is a gradient color that changes gradually from left to right.

Compared with a normal background color, a gradient background has more layering and can more easily create a visual focus in the interface.

## Use a Gradient Background in the Animal Encyclopedia

Now, we can change the background color of the animal button:

```swift
.background(Color.animalBlue)
```

To a gradient background:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

The complete code is as follows:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Display effect:

![color](../../../Resource/031_color4.png)

Now, the animal button is no longer only a single background color. Instead, it has a left-to-right gradient effect.

Compared with a single-color background, a gradient background can make the interface look more layered and closer to the visual design of a real App.

## Difference Between Single-Color Backgrounds and Gradient Backgrounds

A single-color background uses only one color.

For example:

```swift
.background(Color.animalBlue)
```

This writing style is simple and clear, and it is suitable for most basic interfaces.

A gradient background uses multiple colors.

For example:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

This writing style can make the interface more layered, but it can also more easily increase visual complexity.

So, in actual development, we can understand it this way:

Single-color backgrounds are suitable for normal text, normal buttons, normal cards, and normal page backgrounds.

Gradient backgrounds are suitable for key buttons, top areas, cover cards, feature entrances, and other positions that need emphasis.

## Summary

In this lesson, we learned how to use custom colors in SwiftUI.

First, we learned about Hex colors.

For example:

```text
#2c54c2
```

It represents a specific color.

Then, we used `extension Color` to extend the `Color` type.

This allows SwiftUI to create colors in the following way:

```swift
Color(hex: "#2c54c2")
```

Next, we used `static` to organize commonly used colors:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

This way, we can use it directly in other views:

```swift
Color.animalBlue
```

Compared with writing Hex strings every time, this approach is clearer and makes it more convenient to modify colors uniformly later.

Finally, we learned `LinearGradient` and combined custom colors into a gradient background:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Through this lesson, we completed the process from "creating custom colors" to "using colors in a real interface".

Later, when a color needs to be used repeatedly in multiple places, we can first consider organizing it in a `Color` extension.

This will make the code clearer and the interface style easier to unify.
