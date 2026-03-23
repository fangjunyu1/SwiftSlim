# Brilliant Colors

In this lesson, we will learn some common visual modifiers in SwiftUI, including:

- Colors
- Foreground color
- Background color
- Offset
- Opacity
- Blur

We will also learn about the Safe Area.

These modifiers are used to control the visual appearance of views, making interfaces clearer and more layered.

## Colors

In SwiftUI, you can set the color of text.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` means blue. In fact, it is a shortened form of `Color.blue`, made possible by type inference.

Common colors include:

```text
.black
.green
.yellow
.pink
.gray
...
```

These are all static properties of `Color`.

![Color](../../RESOURCE/006_color.png)

You can think of `Color` as a color type, while `.blue` and `.red` are specific values of that type.

### The `Color` View

In SwiftUI, `Color` can also be displayed as a view by itself.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

This code creates a red square that is `100 × 100`.

You can also make the whole interface show a certain color:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

After running it, you will notice that the red color does not fill the entire screen. The top and bottom of the iPhone remain white. This involves the concept of the Safe Area.

## Safe Area

The Safe Area is the region reserved by the system to prevent content from being covered. It includes:

1. The status bar area at the top, such as time and battery
2. The Home indicator area at the bottom
3. The notch or Dynamic Island area

![Color](../../RESOURCE/006_color3.png)

By default, SwiftUI restricts content to the Safe Area, so the view does not extend all the way to the screen edges.

### Ignoring the Safe Area

If you want a color to fill the entire screen, you can use `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Or use the older syntax:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

This makes the view extend across the whole screen.

It is worth noting that `edgesIgnoringSafeArea` is an older form. Starting from iOS 14, `ignoresSafeArea` is the recommended approach.

## Foreground Color

### The `foregroundStyle` Modifier

In earlier lessons, we already used `foregroundStyle` to set colors.

For example:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` is part of the newer styling system and supports colors, gradients, materials, and more.

![Color](../../RESOURCE/006_color2.png)

### The `foregroundColor` Modifier

`foregroundColor` can also be used to set a color:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Its usage is very similar to `foregroundStyle`.

In recent versions of Xcode, Xcode warns that `foregroundColor` may be deprecated in future iOS versions, so it is recommended to prefer `foregroundStyle`.

## Background

If you want to add a background color to a view, you can use `background`:

```swift
background(.red)
```

For example, add a background color to text:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

We can see similar background effects when selecting text in apps such as Word or Chrome.

![Color](../../RESOURCE/006_color16.png)

If you want the background area to be larger, you need to combine it with `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

There is an important rule here:

SwiftUI modifiers build the view from top to bottom. A modifier written later acts on the result produced by the earlier modifiers.

So:

```swift
.padding()
.background()
```

This means the background wraps the view after padding has been added.

If the order is reversed:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Then the background will not expand, because the background does not wrap the later padding.

## Example - A Four-Corner Nut

Now let us create a simple four-corner nut-like view.

![Color](../../RESOURCE/006_color8.png)

First, create a white square of `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

If you want to turn it into a circle, you can use `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

When the corner radius is equal to half of the width and height, the shape becomes a circle.

Now add a blue background:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

The added padding enlarges the outer area, and `background` draws the blue color on that outer area.

Now we have created a four-corner nut effect.

### Another Way of Thinking

Besides using a background color to build this shape, we can also use `ZStack`.

Earlier, we learned that `ZStack` can overlay views. The four-corner nut can also be understood as a circle and a rectangle displayed on top of each other.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` overlays views in order, and the later-added view appears on the top layer.

## Example - Two Overlapping Circles

Many icons are made by overlapping simple shapes, such as two overlapping circles.

![Color](../../RESOURCE/006_color14.png)

First, create two circles:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Because we need the two circles to overlap, we use a `ZStack` layout:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

At this point, the two circles are exactly the same size, so they overlap completely.

What we want is partial overlap, not full coverage, so we can use `offset` to create a shifted effect.

## Offset

`offset` only changes the drawing position of a view. It does not affect the layout calculation of the parent view.

Usage:

```swift
.offset(x:y:)
```

`x` is the horizontal offset, and `y` is the vertical offset.

Positive values move the view right or down. Negative values move it left or up.

Use `offset` to make the two circles partially overlap:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

The position of the red circle in the layout has not changed, but its drawing position moves 25 points to the left. As a result, the two circles visually overlap only partially.

## Opacity

In SwiftUI, `opacity` is used to set the transparency of a view.

Basic usage:

```swift
.opacity(0.5)
```

The parameter range of `opacity` is from `0.0` to `1.0`, where:

- `0` means fully transparent
- `1` means fully opaque

We can use `opacity` to change the transparency of the orange circle:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

After setting the opacity of the orange circle to `0.8`, its opacity becomes 80%. When the two circles overlap, the overlapping area produces a blended color effect.

## Blur

In SwiftUI, you can use `blur` to create a blur effect:

```swift
.blur(radius:10)
```

`radius` defines the blur radius. The larger the value, the stronger the blur effect.

We can add a blur effect to the two circles:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

In the end, we can see two very blurry circles.

## Summary

This lesson focused on common visual modifiers in SwiftUI and showed how to control the color, position, and visual effect of views through modifiers.

Through specific examples, we could see the practical effect of different visual modifiers in the interface, and we also learned about the Safe Area.

These are all very basic modifiers. The more we practice and use them, the more clearly we will be able to control interface effects in real development.

### Practice After Class

- Add opacity and blur to an image
- Create three circles with different opacity values and make them overlap
- Create a background image that fills the whole screen and ignores the Safe Area
- Use `offset` to adjust the position of multiple views

The purpose of these exercises is not to memorize APIs, but to observe the relationship between visual change and layout behavior.
