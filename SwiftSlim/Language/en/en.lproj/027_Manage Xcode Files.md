# Managing Xcode Files

In this lesson, we will learn common file operations in Xcode.

In previous lessons, we wrote most of our code inside `ContentView`. This makes it easier to observe the code and the display result.

For example:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

However, in a real app, we usually do not put all code in one file.

When there are more and more pages, components, and features, we need to split different views into different SwiftUI files.

For example:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

This makes the code structure clearer and also makes later maintenance and modification easier.

## Why Manage Files

In SwiftUI, a page or a component can usually be written as a separate view file.

For example:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Here, `CardView` is a SwiftUI view.

If all views are written inside `ContentView`, the code will become longer and harder to read.

Therefore, we need to learn how to create, rename, and delete files, and how to use folders to manage different code files.

## Creating a SwiftUI File

In Xcode, there are two common ways to create a SwiftUI file:

One way is to create an empty file and then write the code ourselves.

The other way is to create a SwiftUI template file, letting Xcode automatically generate the basic code.

For beginners, using a SwiftUI template file is more recommended, because it automatically generates the basic structure.

### Creating an Empty File

In the Navigator area on the left side of Xcode, right-click a blank area or a folder, then choose `New Empty File`.

The operation location is shown below:

![xcode](../../../Resource/027_view1.png)

After creating an empty file, Xcode usually generates an unnamed Swift file, such as `Untitled.swift`.

We can rename it to `TestView.swift`.

In a SwiftUI project, if this file is used to display a view, it is usually recommended to add `View` at the end of the name.

For example:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

This is not a mandatory rule, but it helps us recognize at a glance that this is a view file.

After creating an empty file, the file may contain only default comments, or it may be blank. This depends on the Xcode version and the creation method.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

At this point, we need to manually write the SwiftUI code:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

This creates a simple SwiftUI view file.

### Renaming a File

If you want to change the file name after creating a file, you can select the file in the Navigator area on the left side of Xcode, then press the Return key `⏎`.

![xcode](../../../Resource/027_view2.png)

Then you can modify the file name.

It is important to note that changing the file name does not automatically change the view name in the code.

For example, after the file name is changed to `ProfileView.swift`, the code may still contain `struct TestView: View`.

Although this does not necessarily cause an error, it can easily cause confusion.

Therefore, it is recommended to keep the file name and the view name consistent. For example, if the file name is `ProfileView.swift`, the view name should also use `ProfileView`.

## Creating a SwiftUI Template File

Besides creating an empty file, we can also directly create a SwiftUI template file.

In the Navigator area on the left side of Xcode, right-click a blank area or a folder, then choose `New File from Template...`.

The operation location is shown below:

![xcode](../../../Resource/027_view3.png)

In the pop-up window, you can choose different platforms at the top, such as `iOS`, `macOS`, and so on.

Here, keep the platform that matches the current project. For example, if we are creating an iOS App, choose `iOS`.

![xcode](../../../Resource/027_view4.png)

Then choose `SwiftUI View` below.

![xcode](../../../Resource/027_view12.png)

Then click `Next`, enter the file name, and save it.

For example, we create a `Test2View.swift` file.

Xcode will automatically generate code similar to the following:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Compared with an empty file, a template file automatically includes `import SwiftUI`, `struct`, `body`, and `#Preview`.

So for beginners, using a SwiftUI template file is simpler and makes it less likely to miss required code.

**Tip**: Besides right-clicking to create a file, you can also click the plus button at the bottom of the Navigator area on the left side of Xcode to create a file or folder.

![xcode](../../../Resource/027_view5.png)

## Creating a Folder

When there are more and more files, we can use folders to manage them.

In the Navigator area on the left side of Xcode, right-click a blank area or a folder, then choose `New Folder`.

After creating a folder, you can drag related files into the folder.

![xcode](../../../Resource/027_view7.png)

Folders are mainly used to organize the project structure. They do not change how the view itself is used.

As long as the view name is correct, it can still be used in other files with forms such as `TestView()` and `Test2View()`.

## Deleting a File or Folder

If you want to delete a file or folder, you can select the corresponding file in the Navigator area on the left side of Xcode, then right-click and choose `Delete`.

You can also select the file and press the Delete key `⌫`.

Xcode will show a delete confirmation window.

![xcode](../../../Resource/027_view10.png)

Choose `Move to Trash` to move the file to the Trash.

If you see `Remove Reference`, it means only the reference is removed from the Xcode project, while the original file on disk is not deleted.

For beginners, if you are only deleting an ordinary file you just created, choosing `Move to Trash` is usually enough.

## Displaying Multiple SwiftUI Views

After learning how to create files, we can split different views into different files.

For example, we create two SwiftUI files:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` is used to display the author name:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` is used to display the card background:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Then we can use these two views inside `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

After running, you can see that `CardView` and `AuthorView` are combined and displayed together:

![xcode](../../../Resource/027_view11.png)

In this result, `CardView` acts as the background, and `AuthorView` is displayed above it. This is because they are placed inside a `ZStack`.

In `ContentView`, we use these two views through `CardView()` and `AuthorView()`. The `()` after the name means creating and using this view.

This is common view nesting in SwiftUI: inside one view, you can continue using other views.

## Entry File

Finally, let’s review where the app starts displaying its interface.

In a SwiftUI project, there is usually an entry file:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Here, `@main` means this is the entry point of the app.

Inside `WindowGroup`, we see:

```swift
ContentView()
```

This means that after the app starts, it first displays `ContentView`.

Then inside `ContentView`, it also displays:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

So the view hierarchy can be understood as:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

If we change the view displayed in the entry file to `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Then after the app starts, it will only display `CardView`.

In other words, the `WindowGroup` in the entry code decides which view is displayed first after the app starts.

Inside that view, it can continue displaying other views.

## Summary

In this lesson, we learned common file management operations in Xcode.

We learned how to create SwiftUI files, how to rename files, how to create folders, and how to delete files.

At the same time, we also learned an important concept: SwiftUI views can be split into different files and then used inside other views.

For example:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Here, `CardView()` and `AuthorView()` are other views used inside `ContentView`.

Finally, we also reviewed the display logic of the entry file.

When the app starts, it first enters the entry code marked with `@main`, and then displays the view inside `WindowGroup`.

This helps us understand that different SwiftUI files are not isolated from each other. They can be combined with one another and eventually form a complete app interface.
