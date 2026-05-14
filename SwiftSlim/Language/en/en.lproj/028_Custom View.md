# Custom View

In this lesson, we will learn a very important way to write SwiftUI code: **custom View**.

A custom View can wrap a repeated piece of View code and turn it into a View that can be reused again and again.

In real App development, we often encounter this situation: many interfaces have the same structure, but the content displayed is different.

For example, in the post list of a forum website, each post may have information such as a title, image, and number of likes.

![Reddit](../../../Resource/028_view1.png)

In the product list of a shopping website, each product may have information such as an image, name, and price.

![Amazon](../../../Resource/028_view2.png)

The structure of these contents is similar; the difference is only in the data being displayed.

If we manually write the code for each item, the code will become very long, and it will not be convenient to modify later.

Therefore, we can wrap the same structure into a custom View, then pass the different content into it as parameters.

In this way, the same View can display different content.

## Requirement Scenario

For example, now we want to create a settings list.

Display result:

![view](../../../Resource/028_view.png)

In this settings list, there are three different setting items: `Settings`, `Folder`, and `Music`.

Although their icons, colors, and titles are different, their overall structure is the same:

- Icon on the left
- Background color of the icon
- Title in the middle
- Arrow on the right

If we do not use a custom View, we might write it like this:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Settings")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Folder")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Music")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

This code can be displayed normally, but the problem is also very obvious: the code for the three setting items is almost completely the same.

The only differences are the icon, color, and title:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Settings")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Music")
```

In other words, the structure of each setting item is fixed, and only the icon, color, and title are different.

This situation is very suitable for using a custom View.

### Shadow shadow

Here we use a new modifier, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` can add a shadow to a View.

`radius` represents the blur radius of the shadow. The larger the value, the larger the shadow spread usually becomes, and the softer the shadow looks.

Here it is set to `1`, which means only a very light shadow effect is added.

## Wrapping the Setting Item View

Next, we wrap each setting item into a new View.

We can create `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

In this View, we define three properties:

```swift
let icon: String
let color: Color
let title: String
```

Specifically:

- `icon` represents the icon name
- `color` represents the background color of the icon
- `title` represents the title of the setting item

Because these three pieces of content are different in different setting items, we make them parameters that can be passed in from the outside.

## Using a Custom View

After we have `SettingItemView`, we no longer need to repeatedly write a large block of `HStack` code.

Now we can use it like this:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

This line of code means creating a setting item View and passing in three parameters:

```swift
icon: "gear"
color: Color.blue
title: "Settings"
```

After they are passed in, the properties inside `SettingItemView` will receive the corresponding values:

- the value of `icon` is `gear`
- the value of `color` is `Color.blue`
- the value of `title` is `"Settings"`

Therefore, inside the View, `Image(systemName: icon)` will display the gear icon, `.background(color)` will use a blue background, and `Text(title)` will display `Settings`.

Complete code:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Settings")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Display result:

![view](../../../Resource/028_view.png)

We can see that after wrapping, the display result is the same as before, but the code becomes clearer.

Previously, each setting item needed an entire `HStack` block. Now only one line of code is enough:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

This is the role of a custom View: **wrap repeated View structure and pass only the different content as parameters.**

## Why Parameters Can Be Passed

Next, let us briefly understand why a custom View can receive parameters.

In SwiftUI, a View is essentially a structure.

For example:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Here, `ContentView` is a structure.

When we write:

```swift
ContentView()
```

we are actually creating a `ContentView` View.

The trailing `()` means calling its initialization method; it can also be understood as creating this View.

Because this `ContentView` does not have any properties that need to be passed in from the outside, we can directly write:

```swift
ContentView()
```

However, if there is a property in the View that has not been given a value, we must pass in the corresponding value when creating the View.

For example:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

Here, `name` is a property, and it does not have a default value.

Therefore, when creating `ContentView`, we must give `name` a concrete value:

```swift
ContentView(name: "Fang Junyu")
```

In this way, the View can use this value internally:

```swift
Text("name: \(name)")
```

This is also the reason why we must pass parameters when creating `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Because `SettingItemView` has three properties without default values:

```swift
let icon: String
let color: Color
let title: String
```

Therefore, when creating this View, we must pass them in. The passed parameters will be used by Swift to assign values to the properties inside the View.

## Initialization Method

Next, let us understand the initialization method a little more deeply.

### Default Initialization Method

When we define a normal View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

In this code, we did not manually write an initialization method.

But when we use this View, we can write:

```swift
ContentView()
```

Here, `()` actually means creating `ContentView`; it can also be understood as calling its initialization method.

### Why can it be called even though no initialization method is visible?

Because the Swift compiler automatically generates an initialization method for us.

It is important to note: **this initialization method is generated automatically, and we usually do not see it directly in the code.**

In other words, even though we did not manually write this inside `struct`:

```swift
init() {

}
```

the Swift compiler will generate an initialization method roughly like this behind the scenes:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

That is why we can directly write:

```swift
ContentView()
```

Therefore, in real code, we usually do not need to manually write the initialization method.

We only need to understand one thing: **when creating a SwiftUI View, the initialization method of that View is called. Even if we do not manually write the initialization method, Swift can generate it automatically.**

### Initialization Method with Parameters

If a View has a property without a default value, for example:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

the Swift compiler will automatically generate an initialization method with a parameter based on the property.

We can simply understand it like this:

```swift
init(name: String) {
    self.name = name
}
```

Here:

```swift
init(name: String)
```

means that when creating `ContentView`, we must pass in a `name` parameter of type `String`.

When we write:

```swift
ContentView(name: "Fang Junyu")
```

it means: pass `"Fang Junyu"` as a parameter to the initialization method.

Then, inside the initialization method, this will be executed:

```swift
self.name = name
```

This line of code means: assign the `name` passed from the outside to the current View's own `name` property.

We can simply understand it like this:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("name: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

In this way, the View can use the passed value internally.

This is the initialization flow of a View with parameters: **when a property inside a View does not have a default value, the corresponding parameter must be passed in when creating the View, so that the initialization method can complete assigning the value to the property.**

## When a Property Has a Default Value

If a property already has a default value, then we do not have to pass a parameter when creating the View.

For example:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("name: \(name)")
    }
}
```

Here, `name` already has a default value:

```swift
"Fang Junyu"
```

Therefore, when creating `ContentView`, we can directly write:

```swift
ContentView()
```

At this time, `name` will use the default value, and the interface will display:

```swift
name: Fang Junyu
```

Of course, we can also pass in a new value when creating the View:

```swift
ContentView(name: "Sam")
```

At this time, the View will use `"Sam"` passed from the outside instead of the default value, and the interface will display:

```swift
name: Sam
```

To make it easier to understand, we can think of the initialization method automatically generated by the Swift compiler as roughly like this:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Here, `name: String = "Fang Junyu"` means: if `name` is not passed in when creating the View, use the default value `"Fang Junyu"`; if a new `name` is passed in when creating the View, use the passed value.

In other words: **if no parameter is passed from the outside, the default value of the property is used; if a parameter is passed from the outside, the passed value is used.**

## Back to SettingItemView

Now let us look at SettingItemView again:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

The structure of this View is fixed.

The fixed parts include:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

The different parts include:

```swift
icon
color
title
```

Therefore, we make the different content into properties and pass them as parameters when creating the View.

When we create different setting items, we only need to pass in different parameters:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
```

In this way, the same `SettingItemView` can display three different setting items.

This is the most common way to use a custom View.

## Summary

In this lesson, we learned about custom View.

The main role of a custom View is: **wrap repeated View code so that it can be reused.**

In this example, the structure of the three setting items is the same, and only the icon, color, and title are different.

Therefore, we created `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Then, when using this View, we pass in different parameters:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

These parameters enter `SettingItemView`.

With this approach, we can use less code to create Views with the same structure but different content.

This is also a very common way to write code in SwiftUI development.
