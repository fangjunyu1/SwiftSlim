# Build a Personal Resume Page

In this lesson, we will build a simple personal resume view and learn the following:

- `cornerRadius`
- `spacing`
- `ScrollView`

During the process, we will also review layouts, `Text`, and `Image`, while implementing spacing control and scrollable content.

## Personal Resume

Target result:

![Swift](../../RESOURCE/004_img.png)

**Please try to complete it on your own first, then continue reading the explanation below.**

### Create a Project

Create a new iOS project, or continue using the one you created earlier.

The default `ContentView` code looks like this:

```swift
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
```

Now clear the code and start writing your own content:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Overall Structure

In real development, we usually design the overall structure first.

Our page contains:

1. A title
2. Personal information
3. A personal introduction

Add a `VStack` as the outermost container:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` ensures the views are arranged vertically and also lets us control their order and spacing.

### Title

First, create a `Text` view to display the title.

Here, I use my English name as the title:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Titles are usually larger and bolder, so here we use the `font` and `fontWeight` modifiers:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Layout

SwiftUI uses `center` alignment by default, so the title is currently shown in the middle of `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

We want the title to appear near the top of the view. We can use `Spacer` to adjust the layout:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` takes up the remaining space and pushes the `Text` toward the top of the container.

![Swift](../../RESOURCE/004_img4.png)

### Whitespace

If you feel that the text is too close to the top, you can use either `padding` or `Spacer`.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

This sets the top padding of the `VStack` to `20`.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

You can also use `Spacer` and assign a height with `frame` to create whitespace with a specific size.

Result:

![Swift](../../RESOURCE/004_img5.png)

### Image

Prepare a profile photo and place it in the `Assets` resource folder.

![Swift](../../RESOURCE/004_img6.png)

Then use `Image` in `ContentView` to display it:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Because the original image is relatively large, we need to use `frame` to control the display size.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

At this point, we will notice a problem:

If the width-to-height ratio of the `frame` does not match the original aspect ratio of the image, the image will become distorted.

For example:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

To avoid distortion, we need to use `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

What `scaledToFit` does is:

It scales the image to fit within the given `frame` while preserving the image's original aspect ratio and displaying the full image.

It does not forcibly stretch the image to fill the whole `frame`. Instead, it keeps the width and height ratio unchanged and scales the image proportionally until one side just touches the boundary.

That means:

- If the `frame` width is smaller, the image scales based on the width.
- If the `frame` height is smaller, the image scales based on the height.
- The image always keeps its original aspect ratio and will not be distorted.

Usually, you only need to set one dimension. For example:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

In this case, the system automatically calculates a suitable height based on the width `140` while preserving the image ratio.

If you need to maintain a fixed visual proportion or avoid compression in a more complex layout, you can constrain both width and height at the same time.

### Rounded Corners

If you want the image to appear with rounded corners, you can use the `cornerRadius` modifier:

```swift
.cornerRadius(10)
```

For example:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Add `cornerRadius(20)` after the image modifiers.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` means clipping the boundary of the view and applying a corner radius of `20`.

After adding rounded corners, the four corners of the image become curved, making the visual effect softer and more modern.

This design style is very common in current interface design. For example, iOS app icons use a rounded rectangle shape as well, although system icons use a continuous superellipse curve rather than a simple corner radius.

### Personal Information

Now let's build the personal information area on the left side of the image. Based on the screen structure, the personal information and the image are arranged horizontally, so we need to use `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

The personal information itself is arranged vertically.

![Swift](../../RESOURCE/004_img11.png)

Therefore, we use `HStack` on the outside, `VStack` for the information, and `Text` for the content.

Basic structure:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Bold field labels**

To distinguish field names from field values, you can apply `fontWeight` to the field names:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Left-align the text**

`VStack` uses center alignment by default. If you want all text to be left-aligned, set the alignment explicitly:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` means aligning to the left side in a left-to-right language environment.

![Swift](../../RESOURCE/004_img14.png)

### Spacing

If you want to keep a fixed distance between the personal information and the image, one method we learned earlier is to use `Spacer`:

```swift
Spacer()
    .frame(width: 10)
```

You can also use the `spacing` parameter of `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` means the distance between the two child views is `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**What is `spacing`?**

In `VStack`, `HStack`, and `ZStack`, `spacing` controls the distance between child views.

For example:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

The spacing between the child views inside the outer `VStack` becomes `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

One thing to note is that `spacing` only affects the direct child views of the current container. It does not affect the internal layout of nested containers.

**Controlling spacing inside the information list**

If you want to increase the spacing between fields, the most direct way is to set `spacing` on the `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

This changes the spacing between all child views to `10 pt`.

However, when you look at the result, you will notice a problem:

There is spacing between each field group, but the same spacing also appears between the field name and its value.

This happens because `spacing` affects all direct child views in the current container.

In this structure, every `Text` is a direct child of the outer `VStack`, so the spacing is applied uniformly.

If you want spacing between groups while keeping the field label and field value close together, you can treat each "label + value" pair as one logical group and wrap it in its own `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Now the structure becomes: spacing exists between the outer `VStack` groups, while the inner `VStack` keeps the default compact spacing. As a result, no extra gap appears between the field name and field value.

![Swift](../../RESOURCE/004_img18.png)

### Personal Introduction

Next, implement the personal introduction area.

From the screen structure, the introduction consists of multiple lines of text arranged vertically.

![Swift](../../RESOURCE/004_img19.png)

Therefore, you can use `VStack` together with `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Increase spacing**

Right now, the personal information and personal introduction sections are too close together, so the layout does not look very attractive.

![Swift](../../RESOURCE/004_img20.png)

Because they are both inside the same outer container, we can control the overall spacing on that container:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Result:

![Swift](../../RESOURCE/004_img21.png)

**Spacing inside the list**

Use `spacing` to control the distance between introduction lines:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Completing the Personal Resume

At this point, the basic structure of our personal resume is complete.

![Swift](../../RESOURCE/004_img.png)

### Scroll View

Right now, the page uses `VStack`. This is fine when there are only a few lines in the introduction, but if the text grows to 20, 30, or even more lines, the content height will exceed the screen.

For example:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

At that point, two things happen:

- The content at the bottom gets clipped
- The page cannot scroll

This is not a problem with `VStack`. `VStack` is only a layout container and does not automatically provide scrolling behavior.

**What is `ScrollView`?**

`ScrollView` is a scrollable container that is suitable for content that exceeds the screen size, such as long vertical or horizontal lists.

Basic structure:

```swift
ScrollView {
    ...
}
```

If you want the page to scroll, wrap the entire page content inside `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Now the whole page becomes a scrollable area. When the content exceeds the screen height, you can scroll naturally.

By default, `ScrollView` shows a scrollbar indicator. If you want to hide it, you can set:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Complete Code

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
