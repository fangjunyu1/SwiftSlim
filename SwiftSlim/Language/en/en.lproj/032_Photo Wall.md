# Photo Gallery

In this lesson, we will build a photo gallery page.

![view](../../../Resource/032_view13.png)

In this case, we will review `extension`, `self`, and instances, and learn about the commonly used `Shape` graphics in SwiftUI.

With this knowledge, we can crop ordinary images into different styles, such as circles, rounded rectangles, capsules, and ellipses, and add border effects to photos.

This lesson will use several new concepts: `Shape`, `clipShape`, `strokeBorder`, and `overlay`.

Among them, `clipShape` is used to crop the shape of a view, `strokeBorder` is used to draw a shape border, and `overlay` is used to overlay a new view above the current view.

## Image Assets

Before we start, we need to prepare several images.

You can use your own photos, or you can use the sample images provided in this lesson.

The sample photos in this lesson come from the [Pixabay](https://pixabay.com/) website:

[Landscape](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Fox](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Building](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Flower](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Swan](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

After downloading the images, add them to the `Assets` resource folder and name them `1`, `2`, `3`, `4`, and `5` in order.

![assets](../../../Resource/032_view17.png)

In this way, we can display the images in SwiftUI using `Image("1")`, `Image("2")`, and so on.

## Displaying Photos

First, we display 5 photos in `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Display result:

![view](../../../Resource/032_view.png)

In this code, we use `ScrollView` to make the photo list scrollable, and use `VStack` to arrange multiple images from top to bottom.

Each image uses `.resizable()`, `.scaledToFit()`, and `.frame(width: 300)` to set its display effect, so the image can scale, keep its aspect ratio, and have a limited width.

The `.padding(.vertical, 100)` on `VStack` is used to increase the top and bottom spacing, preventing the first and last photos from being too close to the screen edges.

The final `.ignoresSafeArea()` means that the scroll view ignores the safe area, allowing the photos to extend to the top and bottom of the screen while scrolling, making the page display more complete.

However, the 5 images currently all use the same modifiers:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

When we see repeated code, we can consider using an `extension` to organize it.

## Using extension to Organize Image Styles

We can extend `Image` with a photo-gallery-specific method:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Here, we extend the `Image` type with a `photoGalleryStyle` method.

This method contains the previously repeated `.resizable()`, `.scaledToFit()`, and `.frame(width: 300)`. In other words, it organizes the image scaling, proportional display, and width setting code together.

After using this extension, the original image code:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

can be simplified to:

```swift
Image("1")
    .photoGalleryStyle()
```

In this way, each image only needs to call `.photoGalleryStyle()` to apply the same photo gallery style. The code becomes cleaner and is also easier to modify uniformly later.

## Understanding self

In the extension method, we wrote `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Here, `self` represents the current image instance that calls this method.

For example:

```swift
Image("1")
    .photoGalleryStyle()
```

In this code, `photoGalleryStyle()` is called by `Image("1")`, so the `self` inside the method represents this `Image("1")` image.

You can understand it simply as: whoever calls this method is what `self` represents.

It is important to note that SwiftUI modifiers continuously return new view results. Therefore, `photoGalleryStyle()` returns a modified view, rather than simply returning the original `Image` itself.

## Photo Shapes

Now, the photos can already be displayed normally. However, these photos are rectangular by default, which looks rather ordinary.

If you only want the photos to have rounded corners, you can directly use `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Display result:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` means adding a `20 pt` corner radius to the image. For ordinary rounded-corner images, this syntax is already enough.

However, `.cornerRadius()` can only handle rounded-corner effects and is suitable for making ordinary rounded-corner images. If we want photos to become more different shapes, this modifier alone is not enough.

At this point, we need to use `Shape` in SwiftUI. `Shape` can represent different graphics, and with `clipShape`, it can crop an image into the corresponding shape.

## Understanding Shape

In SwiftUI, `Shape` represents a graphic. Like `View`, it is a very commonly used type in SwiftUI.

Common `Shape` types include circles, rectangles, rounded rectangles, capsules, and ellipses. To observe the appearance of different graphics more intuitively, the following examples set different colors and sizes for each graphic.

In these examples, `.fill()` is used to fill the graphic with color, and `.frame()` is used to set the display size of the graphic. The colors are only used to distinguish different graphics and are not fixed colors of the graphics themselves.

### Circle

`Circle` represents a circle. It is often used for avatars, circular buttons, circular images, and other interface effects.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle

`Rectangle` represents a rectangle. It is one of the most basic graphics and can also be used to create backgrounds, divided areas, or ordinary borders.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle

`RoundedRectangle` represents a rounded rectangle. `cornerRadius` is used to set the corner radius.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule

`Capsule` represents a capsule shape. Its two ends are arcs, and it is often used for capsule buttons, tag backgrounds, and other interface effects.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse

`Ellipse` represents an ellipse. It is similar to `Circle`, but when the width and height are different, it displays as an ellipse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Through these examples, we can see that `Shape` itself can be displayed directly as a graphic. Next, we will use these `Shape` types together with `clipShape` to crop photos so that they appear in different shapes.

## Using clipShape to Crop Photos

Now, we can use `clipShape` to crop photos into different shapes.

For example, crop the first photo into a circle:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

This code means: first display an image, then use `Circle()` to crop it into a circle.

![view](../../../Resource/032_view2.png)

The basic syntax of `clipShape` is:

```swift
.clipShape(shape)
```

Add `.clipShape(...)` after the view, and fill in the graphic you want to crop it into inside the parentheses.

For example:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Now, we crop the 5 photos into different shapes:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Display result:

![view](../../../Resource/032_view8.png)

Among them, the result after cropping with `Rectangle()` is close to an ordinary rectangular photo, so the visual change is not obvious. It is mainly used for comparison with other shapes.

Now, the photos are no longer just ordinary rectangles; they have different shapes.

## Adding Photo Borders

If we want to add a border to a circular photo, we might think of using `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

However, this usually gives us not a circular border, but a rectangular border.

![view](../../../Resource/032_view9.png)

This is because `border` adds a border according to the rectangular area of the view, rather than according to the shape after `clipShape` cropping.

Therefore, if we want a circular border, we cannot directly use `border`.

## Using strokeBorder to Draw Shape Borders

In SwiftUI, `strokeBorder` can draw inner borders for these common `Shape` types.

For example, draw a circular border:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

This code means: draw a brown border for `Circle`, with a border width of `10 pt`.

![view](../../../Resource/032_view12.png)

It is important to note here that `strokeBorder` does not directly add a border to the photo. Instead, it draws a border for the `Circle()` graphic.

In other words, this code only creates an independent circular border, and it is not related to the photo yet.

If we want this circular border to appear above the photo, we need to continue using `overlay` to overlay the border on top of the photo.

## Using overlay to Overlay Borders

`overlay` is a view modifier that can overlay a new view above the current view.

Its basic structure can be understood as:

```swift
Current view
    .overlay {
        Overlay view
    }
```

In this case, the current view is the photo that has already been cropped into a circle:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

The new view we want to overlay is a circular border:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

So, we can combine the photo and the border:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Here, `overlay` means overlaying a new view above the current view.

In `overlay`, the border is overlaid following the display area of the current photo, so there is no need to set a separate `frame`. As long as the border shape matches the clipping shape, the border can fit the photo.

![view](../../../Resource/032_view10.png)

The final effect is that a circular border is placed above the circular photo.

Compared with `ZStack`, `overlay` is more suitable for this kind of "adding decoration to the current view" scenario. The photo is the main subject, and the border is only an additional effect, so using `overlay` is clearer.

## Completing the Photo Gallery

Now, we add the corresponding shape and border to each photo:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Display result:

![view](../../../Resource/032_view13.png)

In this way, a basic photo gallery page is complete.

On this page, we use `ScrollView` to implement scrollable display, use `Image` to display photos, use `clipShape` to crop photo shapes, and use `overlay` and `strokeBorder` to add borders.

## Complete Code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Summary

In this lesson, we completed a photo gallery page.

![view](../../../Resource/032_view13.png)

In this case, we first used `Image` to display photos, and then extended `Image` with a `photoGalleryStyle` method through `extension` to organize repeated image style code.

Next, we learned about common `Shape` types in SwiftUI, such as `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule`, and `Ellipse`. These graphics can not only be displayed directly, but can also be used together with `clipShape` to crop views.

For example:

```swift
.clipShape(Circle())
```

means cropping the view into a circle.

Finally, we used `overlay` and `strokeBorder` to add corresponding shape borders to photos. It is important to note that `border` usually draws a border according to the rectangular area of the view. If you want the border to follow a circle, capsule, or ellipse, it is more suitable to overlay the same `Shape`.

Through this lesson, we not only completed the photo gallery effect, but also understood the common combination of `Shape`, `clipShape`, `strokeBorder`, and `overlay` in interfaces.

## After-Class Exercises

### 1. Add a Photo Gallery Background

Add a full-screen background image to the photo gallery page.

Requirement: The background image should fill the entire screen and ignore the safe area.

### 2. Gradient Border

Change the existing single-color borders into linear gradient borders.

You can try using `LinearGradient` to create richer border effects.

### 3. Simulated Photo Frame

Search online for some real photo frame styles, and try using `overlay` to overlay image frames so that the photos look closer to real picture frames.

Exercise display result:

![button](../../../Resource/032_view15.jpeg)

### 4. Implement a Rounded Button Border

In actual development, buttons often use rounded rectangle borders.

Try creating a rounded button, and use `RoundedRectangle` and `strokeBorder` to add a rounded border to the button.

Exercise display result:

![button](../../../Resource/032_view14.png)

### Thinking Question

If you do not want to use a single-color border or a gradient border, but want the border to show a certain pattern effect, how should you implement it?

You can try searching for information to learn about related usages such as `overlay`, `mask`, or `ImagePaint`.

Exercise display result:

![button](../../../Resource/032_view16.png)
