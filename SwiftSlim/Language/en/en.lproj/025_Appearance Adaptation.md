# Appearance Adaptation

In this lesson, we will learn how to adapt an interface to light mode and dark mode.

On iPhone, iPad, and Mac, users can choose light mode or dark mode.

When the system switches to dark mode, the background, text, and icon colors of many apps also change accordingly.

For example, the interface may use a light background during the day and switch to a dark background at night.

![view](../../../Resource/025_view9.png)

This ability to automatically adjust the interface display according to the system appearance is called appearance adaptation.

## Preview Appearance Adaptation in Xcode

Before learning appearance adaptation, let's first see how to preview light mode and dark mode in Xcode.

At the bottom of the `Canvas` area, click the `Device Settings` button to open the `Canvas Device Settings` pop-up.

![canvas](../../../Resource/025_view.png)

In the pop-up, you can see the `Color Scheme` setting.

![canvas1](../../../Resource/025_view1.png)

This means:

- `Light Appearance` means light mode.
- `Dark Appearance` means dark mode.

We can switch the preview appearance here and check how the current interface looks in light mode and dark mode.

## Show Two Appearances Side by Side

If you want to view light mode and dark mode at the same time, you can use the `Variants` feature.

At the bottom of the `Canvas` area, click the `Variants` button and choose `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

After selecting it, the `Canvas` will show previews for light mode and dark mode at the same time.

![canvas3](../../../Resource/025_view3.png)

This makes it easier to compare the interface differences between the two appearances.

In simple terms:

If you only want to temporarily switch between light mode and dark mode, you can use `Canvas Device Settings`.

If you want to view both appearances at the same time, you can use `Color Scheme Variants`.

## Views Adapt to Appearance by Default

In SwiftUI, many system views automatically adapt to light mode and dark mode by default.

For example:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Light")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Display result:

![canvas](../../../Resource/025_view4.png)

As you can see, in light mode, icons and titles usually appear dark.

In dark mode, icons and titles automatically become light.

This is because SwiftUI views such as `Text` and `Image` adjust their colors according to the system appearance by default.

In other words, if we do not manually specify a fixed color, SwiftUI will handle part of the appearance adaptation for us.

## Fixed Colors Do Not Automatically Switch

It is important to note that if we manually specify a fixed color, it will not automatically switch between light mode and dark mode.

For example:

```swift
Text("some some some")
	.foregroundStyle(Color.gray)
```

The text here is set to `Color.gray`, so it will always be displayed in gray.

For another example:

```swift
Text("Title")
    .foregroundStyle(Color.white)
```

This code will display white text in both light mode and dark mode.

If the background is also light, the white text may become hard to read.

So when adapting an interface to different appearances, try to avoid casually hard-coding fixed colors such as `Color.white` and `Color.black`.

In many cases, you can prefer system semantic styles, such as:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

This means:

- `.primary` is usually used for primary content.
- `.secondary` is usually used for secondary content.

They automatically adjust their display based on light mode and dark mode.

## Show Different Content Based on Appearance

Sometimes, we not only want colors to change, but also want different content to be shown under different appearances.

For example:

- Show a normal lightbulb icon in light mode.
- Show a glowing lightbulb icon in dark mode.
- Show `Light` as the title in light mode.
- Show `Dark` as the title in dark mode.

In this case, we need to determine whether the current system is in light mode or dark mode.

In SwiftUI, we can get the current appearance mode through the `colorScheme` environment value:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Complete code:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Light" : "Dark"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Display result:

![view](../../../Resource/025_view5.png)

From the preview result, you can see that the same view does not display exactly the same content under different appearance modes.

In light mode, `Image` displays the normal lightbulb icon, and the title displays `Light`.

In dark mode, `Image` displays the glowing lightbulb icon, and the title displays `Dark`.

In other words, the change here is not only a color change. The icon name and the title text themselves have also changed.

This is because we did not hard-code the icon and title directly inside `body`. Instead, we calculate different content based on `colorScheme`.

In this code, we use two computed properties:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

When `colorScheme` is `.light`, it means the current mode is light mode.

When `colorScheme` is `.dark`, it means the current mode is dark mode.

So we can return different icon names and title text according to different appearance modes.

This is also a common use of computed properties: calculating the content a view needs to display based on the current state.

## Understanding @Environment

This is our first time encountering `@Environment`.

`@Environment` can be understood as reading a value from SwiftUI's environment.

When an app runs, the system provides many kinds of environment information, such as:

- Current language
- Current appearance mode
- Current layout direction
- Current font size setting

When we need to get the current appearance mode, we can read `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Here:

```swift
\.colorScheme
```

means reading the `colorScheme` value from the environment.

```swift
private var colorScheme
```

means saving the value that was read into the `colorScheme` variable.

You can decide the variable name yourself. For example, you can also write:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

As long as the preceding `\.colorScheme` does not change, it means you are reading the current appearance mode.

## Two Common Values of colorScheme

`colorScheme` commonly has two values:

```swift
.light
.dark
```

They mean:

- `.light`: light mode
- `.dark`: dark mode

For example:

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

This code means:

If the current mode is light mode, `colorScheme == .light` is true, so it returns `"Light"`.

Otherwise, it returns `"Dark"`.

So in light mode:

```swift
Text(titleName)
```

The displayed text is:

```swift
Light
```

In dark mode, the displayed text is:

```swift
Dark
```

In this way, we can show different content based on different appearances.

## Color Adaptation Example

Besides text and icons, sometimes we also need to handle color adaptation ourselves.

For example:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Display result:

![view](../../../Resource/025_view6.png)

In this code, the text is white and the background is black.

In light mode, the black background is quite clear.

However, in dark mode, if the entire interface background is also black, this black background will blend into the system background and look less clear.

At this point, we can switch the text color and background color according to the appearance mode:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Display result:

![view](../../../Resource/025_view7.png)

Now, light mode uses a black background with white text.

Dark mode uses a white background with black text.

This way, no matter which appearance is used, the text and background have clear contrast, and users can clearly see the content.

## Use Assets to Adapt Colors

Besides manually checking with `colorScheme`, we can also use `Assets` resource colors to adapt to light mode and dark mode.

This approach is more suitable for managing common colors in an app.

In the Xcode project, find the `Assets` resource folder.

![assets](../../../Resource/025_color.png)

Open the `Assets` folder, right-click an empty area, and choose `New Color Set` to create a new color resource.

![assets](../../../Resource/025_color1.png)

Here, we create a color and name it `redText`.

![assets](../../../Resource/025_color2.png)

A color resource can separately set colors for light mode and dark mode.

![assets](../../../Resource/025_color3.png)

After selecting the corresponding color area, you can modify the color in the inspector on the right.

Click the `Hide or show the Inspectors` button in the upper-right corner to open the inspector area.

Then choose `Show the Attributes inspector`, find `Show Color Panel` at the bottom, and open the color panel.

![assets](../../../Resource/025_color4.png)

Click a color in the color panel, and the corresponding color area of `redText` will change at the same time.

Here, we set `redText` to:

- Show red in light mode
- Show green in dark mode

![assets](../../../Resource/025_color5.png)

Back in SwiftUI code, you can use this color like this:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Here:

```swift
Color("redText")
```

means reading the color resource named `redText` from `Assets`.

Display result:

![assets](../../../Resource/025_view8.png)

You can see that the same `Color("redText")` displays different colors in light mode and dark mode.

This shows that `Assets` colors themselves also support appearance adaptation.

## Difference Between colorScheme and Assets

Both `colorScheme` and `Assets` can implement appearance adaptation, but they are suitable for different scenarios.

If you only need to switch text content, image names, or `SF Symbols` names according to light mode and dark mode, you can use `colorScheme`.

For example:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

If the color is frequently used in the app, such as a theme color, card background color, or text color, it is more recommended to use `Assets` colors.

This is because `Assets` colors can be reused across multiple views and are easier to modify later.

For example:

```swift
Color("redText")
```

In this way, you only need to modify the color in `Assets`, and all places that use this color will change together.

## Summary

In this lesson, we learned appearance adaptation for light mode and dark mode.

First, we learned how to preview different appearances in Xcode's `Canvas`, and how to use `Color Scheme Variants` to view light mode and dark mode at the same time.

Then, we learned that SwiftUI views such as `Text` and `Image` automatically adapt their colors according to the system appearance by default.

However, if we manually specify fixed colors such as `Color.white` or `Color.black`, these colors will not automatically switch.

Next, we learned `@Environment` and `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Through `colorScheme`, we can determine whether the current mode is light mode or dark mode, and display different icons, text, or colors according to different appearances.

Finally, we learned about `Assets` colors.

`Assets` colors can separately set colors for light mode and dark mode, making them suitable for managing common color resources in an app.

Appearance adaptation can make an app look better during both day and night, and can also prevent problems such as unreadable text or unclear backgrounds.

In real development, it is recommended to prefer SwiftUI's default adaptation behavior and `Assets` colors.

When you need to switch text, icons, images, or handle a small number of special display effects under different appearances, then use `colorScheme` for checking.

## Extended Knowledge: Specify Font Size

When we learned `font` earlier, we used some system font styles:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Besides using system font styles such as `.largeTitle` and `.callout`, you can also manually specify the font size.

For example:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Here:

```swift
.font(.system(size: 100))
```

means setting the font size to `100 pt`.

For `SF Symbols` icons, `font` also affects the icon size.

So if you want an icon to appear larger, you can specify the size with `.font(.system(size:))`.

For example:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

It is important to note that although manually specifying font size is more flexible, it is not recommended to use fixed font sizes heavily for regular text.

For regular text, prefer system font styles such as `.title`, `.headline`, `.body`, and `.caption`.

This makes it easier to adapt to different devices and user font settings.
