# Course Card

This lesson is a stage review lesson. We will complete a “course card”.

Through this exercise, we can review the `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()`, and other content we learned earlier, and learn how to combine multiple small views into a complete view module.

Course card effect:

![view](../../../Resource/026_view.png)

This course card mainly contains several parts:

- Course level: `Beginner`
- Course content: `20+ Lessons`
- Course title: `SwiftUI Beginner Tutorial`
- Course description
- Button: `Start Learning`
- Course background: Swift icon and indigo background

We can complete this view in `ContentView`.

## Top Area

First, create the top area of the course card.

![view](../../../Resource/026_view1.png)

The left side of the top area displays the course level, and the right side displays the course content.

Because these two pieces of content are arranged horizontally, we can use `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Beginner")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ Lessons")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Here, we split the top area into a computed property:

```swift
var topView: some View
```

The benefit of doing this is that it keeps `body` clearer.

The top area mainly uses the following content:

- `HStack`: arranges two text views horizontally.
- `Text`: displays text content.
- `Spacer()`: pushes the left text to the left and the right text to the right.
- `.font(.footnote)`: sets a smaller text style.
- `.fontWeight(.bold)`: makes the text bold.
- `.foregroundStyle(Color.white)`: sets the foreground color to white.
- `.padding(.vertical, 10)`: sets the vertical padding.
- `.padding(.horizontal, 16)`: sets the horizontal padding.
- `.background(Color.white.opacity(0.15))`: sets a translucent white background.
- `.cornerRadius(20)`: sets the corner radius.

Here, `Beginner` uses `.padding()` in two directions:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

This gives the text space both vertically and horizontally, making it look more like a tag.

`Color.white.opacity(0.15)` represents white with `15%` opacity, which means a very light white.

### Add the Card Background

Earlier, we created `topView`, but simply creating a view does not display it automatically.

In SwiftUI, the content that is actually displayed on the screen needs to be written in `body`.

So, we can first place `topView` inside `body` to display it:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

At this point, you will see that the top area has been displayed:

![view](../../../Resource/026_view2.png)

However, because the text in `topView` is white and the default background is also light, it may not be easy to see clearly in light mode.

Therefore, we can add a `VStack` outside, then set padding, a background color, and a corner radius for the whole area:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Display effect:

![view](../../../Resource/026_view3.png)

The `VStack` here currently contains only one `topView`, so it may look unnecessary.

But later, we will continue adding the course title, course description, and button area. These are all vertically arranged content, so using `VStack` here in advance makes it easier to continue combining views later.

There are two `.padding()` modifiers here, and they have different purposes.

The first `.padding(20)` is written before `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

It controls the inner padding of the card, meaning the distance between the content and the edge of the background.

The second `.padding(30)` is written after `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

It controls the outer padding of the card, meaning the distance between the entire card and the edge of the screen.

![view](../../../Resource/026_view4.png)

So, even though both are `.padding()`, placing them in different positions creates different effects.

## Content Area

Next, create the content area of the course card.

Display effect:

![view](../../../Resource/026_view5.png)

The content area contains the course title and the course description. They are arranged vertically, so we use `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI Beginner Tutorial")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Start from zero with SwiftUI and systematically learn Apple’s declarative UI development. Through clear explanations and practical examples, you will gradually master layout, interaction, and state management to build beautiful and useful app interfaces.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Display effect:

![view](../../../Resource/026_view6.png)

Two parameters are used in this `VStack`:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` means the views inside the `VStack` are aligned to the leading edge.

`spacing: 10` means the views inside the `VStack` keep a spacing of `10 pt` between them.

So, the course title and course description will start from the left side and keep a certain distance between them.

The course description is relatively long. If all of it is displayed, the card will become very tall, so `.lineLimit()` is used here to limit the number of displayed lines:

```swift
.lineLimit(3)
```

It means that up to `3` lines are displayed. When the content exceeds the line limit, the extra part will be omitted.

### Align the View to the Left

There is one more point to note here.

`VStack(alignment: .leading)` can only control the alignment of the views inside the `VStack`. It does not directly control the position of the `VStack` itself inside the external container.

For example, if the course description is relatively short:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI Beginner Tutorial")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Just some content.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Display effect:

![view](../../../Resource/026_view7.png)

You can see that although the course title and course description are aligned to the left inside the `VStack`, the entire `VStack` is not aligned to the left edge of the card.

This is because when the content is short, the width of the `VStack` also becomes relatively narrow. When the outer container lays out its content, it may place this narrower `VStack` in the center.

You can understand it this way: `VStack(alignment: .leading)` is responsible for internal left alignment.
But it is not responsible for pushing the entire content area to the far left.

If we want the whole content area to truly align to the left, we can wrap it in another `HStack` and add `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI Beginner Tutorial")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Just some content.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Display effect:

![view](../../../Resource/026_view8.png)

The `HStack` here is a horizontal layout.

`Spacer()` occupies the remaining space on the right, which pushes the `VStack` on the left to the far left.

Therefore, `HStack + Spacer()` can be used to control the position of the whole content area.

In the actual course card, the course description is relatively long and usually occupies more width, so this issue may not be obvious. But it is important to understand this difference, because similar situations often appear later when making short-text layouts.

### Control the Distance Between Internal Views

Earlier, we wrote `spacing: 10` in `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` is used to control the distance between internal views.

If `spacing` is not set, `VStack` also has a default spacing, but the default spacing may not match the effect we want.

Here, if the course title and course description are too close to each other, the layout will look crowded, so we use:

```swift
spacing: 10
```

This keeps a little space between them.

Display effect:

![view](../../../Resource/026_view9.png)

Similarly, the top area and the content area are also arranged vertically, so `spacing` can also be used to control the distance between them.

Now, place `topView` and `contentView` into `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Display effect:

![view](../../../Resource/026_view10.png)

Here, `VStack(spacing: 20)` controls the distance between `topView` and `contentView`.

In other words:

```swift
VStack(alignment: .leading, spacing: 10)
```

Controls the distance between the course title and the course description.

```swift
VStack(spacing: 20)
```

Controls the distance between the top area and the content area.

They are both `spacing`, but they act on different `VStack` containers, so the affected range is also different.

With this, the content area view is complete.

## Button Area

Next, create the bottom button area.

Display effect:

![view](../../../Resource/026_view11.png)

The button area mainly consists of a play icon and a piece of text.

We can use `Image` to display the play icon and `Text` to display the button text.

Here, first create the button appearance:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("click button")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Start Learning")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Display effect:

![view](../../../Resource/026_view12.png)

Two `HStack` containers are used here:

The inner `HStack` is used to arrange the icon and text horizontally:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Start Learning")
}
```

The outer `HStack`, together with `Spacer()`, is used to make the button appearance align to the left:

```swift
HStack {
    ...
    Spacer()
}
```

When the button is tapped, the console will output `click button`.

## Basic Card Completed

Now, combine the top area, content area, and button area:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Display effect:

![view](../../../Resource/026_view13.png)

At this point, a basic course card is complete.

## Swift Icon Background

Finally, add a translucent Swift icon background to the card.

![view](../../../Resource/026_view.png)

Earlier, we used `Color.indigo` as the background color. In fact, besides adding a color, `.background()` can also add a complete view.

So, we can first create a dedicated background view:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

In this background view, we use `VStack`, `HStack`, and `Spacer()` to push the Swift icon to the bottom-right corner.

Because the Swift icon is only used as a decorative background, translucent white is used here:

```swift
Color.white.opacity(0.15)
```

This way, the icon will not be too prominent and will not affect the text content in front.

Next, add `backgroundView` to the card:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Final effect:

![view](../../../Resource/026_view14.png)

Here, two `.background()` modifiers are used consecutively:

```swift
.background(backgroundView)
.background(Color.indigo)
```

The first `.background()` is used to add the Swift icon background.
The second `.background()` is used to add the indigo background.

This makes the Swift icon appear above the indigo background and display as part of the card background.

From here, we can see that `.background()` can add not only colors, but also custom views. Multiple `.background()` modifiers can also be combined to create richer background effects.

At this point, a complete course card is finished.

## Summary

In this lesson, we reviewed common basic layout methods in SwiftUI through a course card.

We used `Text` to display text, `Image` to display a system icon, and `VStack`, `HStack`, and `Spacer()` to control view arrangement.

We learned `.lineLimit()`, which can limit the maximum number of lines a text displays. When the content exceeds the limit, the extra part is omitted.

At the same time, we also reviewed common modifiers such as `.padding()`, `.background()`, `.cornerRadius()`, and `.foregroundStyle()`.

After completing this lesson, we can already combine multiple small views into a complete card module.

This is also a very common approach in SwiftUI development: split views into small parts first, then combine them into a complete interface.

## Complete Code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Beginner")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ Lessons")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI Beginner Tutorial")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Start from zero with SwiftUI and systematically learn Apple’s declarative UI development. Through clear explanations and practical examples, you will gradually master layout, interaction, and state management to build beautiful and useful app interfaces.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("click button")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Start Learning")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
