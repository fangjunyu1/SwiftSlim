# Layout, Images, and Text

In the previous lesson, we learned this `ContentView` code:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

In this lesson, we will learn SwiftUI's default layout behavior, along with how to use images and text. Building on the previous lesson, we will further understand the structure of views and how they are displayed. This knowledge will help us build basic interface layouts.

## SwiftUI's Default Layout Behavior

When previewing `ContentView`, we notice that the icon and text are centered instead of being arranged from the top.

![Swift](../../RESOURCE/003_view.png)

By default, the alignment of stack containers is `.center`, so child views usually appear centered.

### Alignment

Obviously, centered alignment is only one kind of alignment. If we want left alignment or right alignment, we need to use `alignment` to control how the view is aligned.

```swift
alignment
```

In SwiftUI, alignment usually appears in two scenarios:

**1. The alignment parameter of a stack container**

For example, to left-align the icon and text in `ContentView`:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

In `VStack`, `alignment` controls horizontal alignment.

Alignment options:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` arranges views horizontally, so `alignment` controls vertical alignment:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` overlays views, so `alignment` can control horizontal or vertical positioning:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

If you do not explicitly specify `alignment`, `VStack`, `HStack`, and `ZStack` all use `.center` by default.

**2. Alignment inside `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

When the size provided by `frame` is larger than the view's own size, `alignment` determines where the view is placed inside that frame. We will discuss `frame` in more detail later. For now, just get a basic idea of it.

### Spacer and the Space Distribution Mechanism

`alignment` lets views be arranged along horizontal or vertical directions. However, when we want text and images to appear at opposite ends, a single alignment setting is not enough.

For example, imagine we want to build the top area of the [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) website, with the NHK icon on the left and the site menu icon on the right.

![Swift](../../RESOURCE/003_alignment3.png)

If we only use alignment, both icons will appear on the same side. We cannot distribute them to the left and right edges, so we need `Spacer` to fill the remaining space.

`Spacer` is a flexible layout view that automatically fills the remaining available space.

Usage:

```swift
Spacer()
```

For example:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

When we add `Spacer` between `Image` and `Text`, the spacer fills the remaining space and pushes the image and text to opposite ends vertically.

![Swift](../../RESOURCE/003_view1.png)

If there are multiple spacers:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

The remaining space is distributed evenly among the spacers.

![Swift](../../RESOURCE/003_spacer.png)

## Displaying Images and Controlling Their Size

The `Image` view is mainly used to display pictures. The SF Symbols icons we used in the previous lesson are only one usage of `Image`.

Usage:

```swift
Image("imageName")
```

Inside the double quotes is the image name. You do not need to include the file extension.

### Displaying an Image

First, prepare an image.

![Swift](../../RESOURCE/003_img.jpg)

In Xcode, select the `Assets` resource folder and drag the image into it.

![Swift](../../RESOURCE/003_img1.png)

Then use `Image` in `ContentView` to display it:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Note: SwiftUI's `Image` does not support GIF animation playback. It can only display a static frame.

### Controlling Image Size

In SwiftUI, `Image` is displayed at its original size by default. If you want to adjust how large it appears on screen, you first need to use `resizable` to make the image scalable, and then use `frame` to specify the layout size.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### The `resizable` Modifier

The `resizable` modifier allows the image to participate in layout scaling instead of always staying at its original size.

```swift
.resizable()
```

Only after adding `resizable()` can `frame` truly change the displayed size of the image.

If you omit `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

Then `frame` only provides layout space, while the image itself will not change size.

### The `frame` Modifier

`frame(width:height:)` is used to specify the width and height of a view.

Basic usage:

```swift
.frame(width: 10,height: 10)
```

For example, set the image to a rectangle with width `300` and height `100`:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

You can also set only the width or only the height:

```swift
.frame(width: 200)
.frame(height: 100)
```

The combination of `resizable + frame` lets you control the displayed image size flexibly while keeping the image scalable.

### Aspect Ratio: `scaledToFit` and `scaledToFill`

When the width and height ratio you set with `frame` does not match the original aspect ratio of the image, the image may become stretched or distorted.

If we want the image to adapt to the available layout space while keeping its original aspect ratio, we can use `scaledToFit` or `scaledToFill`.

**`scaledToFit`**

`scaledToFit` keeps the image's original aspect ratio and scales it so that the full image fits inside the available space without cropping:

```swift
.scaledToFit()
```

or:

```swift
.aspectRatio(contentMode: .fit)
```

This approach is suitable when you want to display the whole image and avoid distortion.

If every image is given the same width and height, stretching is often unavoidable.

For example:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Without setting an aspect-ratio mode, the image cannot preserve its original proportions.

![Swift](../../RESOURCE/003_img4.png)

Using `scaledToFit` keeps the original aspect ratio:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` also preserves the image ratio, but it fills the entire available area. If the aspect ratios do not match, the overflowing parts will be cropped:

```swift
.scaledToFill()
```

or:

```swift
.aspectRatio(contentMode: .fill)
```

This method is suitable when you want the image to cover an entire region, such as a background image or a banner.

**The difference between the two**

![Swift](../../RESOURCE/003_img6.png)

## Text

In SwiftUI, `Text` is used to display words.

Basic usage:

```swift
Text("FangJunyu")
```

We already learned `Text` in the previous lesson. In this lesson, we will continue by learning how to control font size and weight so that text can have more visual expression in a view.

### Font Size

Use the `font` modifier to control text size:

```swift
.font(.title)
```

For example:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Common font sizes from large to small:

```text
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Font Weight

If you want to make text bold, you can use the `fontWeight` modifier:

```swift
.fontWeight(.bold)
```

For example:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Common font weights from thin to heavy:

```text
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` controls the size of the text, while `fontWeight` controls its thickness. The two can be combined to enrich the visual expression of text.

## Summary and Practice

So far, we have learned the basics of SwiftUI layout, `Spacer`, `Image`, and `Text`. These are already enough to build some simple views.

For example: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

The Google page is very clean. It contains images and text, so we can try to analyze its structure from a SwiftUI point of view:

1. The overall layout can be divided into three parts: the Google logo, the search box, and the hint text. We can use `VStack` to arrange them vertically.
2. The Google logo is an image, so we can display it with `Image`.
3. The search box contains an input field and icons. If we ignore the input behavior for now, we can use `Image` to display the search icon.
4. The hint text can be displayed with `Text`. Horizontal arrangement of the text can use `HStack`, and text color can be controlled with `foregroundStyle`.

By practicing these ideas, we can create some simple views and deepen our understanding of `Image`, `Text`, and their modifiers.
