# SwiftUI View Lifecycle

In the previous lesson, we learned that `@State` variables follow the lifecycle of a view, and we also learned the basic usage of `onAppear`.

In this lesson, we will further understand the SwiftUI view lifecycle. We will see how a view is created and displayed, how variables inside a view are created and recreated, and we will also learn about `onAppear`, `onDisappear`, and the `init` initializer.

With this knowledge, we can build a more complete understanding of the whole construction process of a SwiftUI view.

## App Launch Order

When creating an iOS project, Xcode generates two files by default:

```text
ContentView.swift
ProjectName + App.swift
```

Among them, `ProjectName + App.swift` is the entry file of the whole app.

For example:

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

### Execution Flow

When we run the app in the simulator or on a physical device, the system looks for the `@main` keyword:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

After confirming the entry point, the system begins executing the code.

It first enters the `App` struct, executes the code inside `body`, then creates the `WindowGroup` and loads the `ContentView` inside it.

### The Role of `WindowGroup`

`WindowGroup` is used to manage windows:

```swift
WindowGroup {
    ContentView()
}
```

iPad and macOS support multiple windows, while iPhone usually has only one.

So on iPhone, `WindowGroup` mainly manages the first interface shown on screen.

### The View Loading Process

After the system finds `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI executes the code in `body`, then builds the interface according to the returned view structure such as `VStack` and `Text`, and displays it on the screen.

After these steps are complete, we can see `ContentView` in the view.

![ContentView](../../Resource/016_view1.png)

One thing to note is that the role of `body` is to generate a view, not store a view.

That means every time the view refreshes, SwiftUI recalculates `body` and generates a new view structure.

### Preview Logic

Xcode previews and real app execution are two different mechanisms.

For example, add a debug print in the app entry file:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

When previewing `ContentView` in Xcode, execution does not begin from `@main`, so the `onAppear` in the entry file is not triggered.

But when the app runs on the simulator or a physical device, the system starts from `@main`, runs the full app, triggers the `onAppear` in the entry, and outputs the debug information.

The key point is this: Xcode preview is only partial rendering used to display the current view, while the simulator and physical device provide a complete running environment for the whole app.

So when testing app features, the simulator or a real device should be treated as the source of truth. Xcode preview does not provide a full runtime environment.

## The Lifecycle of a View

At the current stage, all our code is still concentrated in `ContentView`. But in a real app, there are usually multiple views, and they appear and disappear in different scenarios.

For example, in the piggy bank:

![PiggyBank](../../Resource/016_view.png)

When the user taps "Save Money", a `SaveView` is shown. When saving is finished or the view is closed, `SaveView` is removed.

This process is a view lifecycle: the view is created, displayed, and finally removed.

### Closing the App

When the app is closed, all views are removed and their related state disappears.

So `ContentView` and all other views are removed from memory, and the running state of the whole app is cleared.

## The Lifecycle of Variables Inside a View

In SwiftUI, the lifetime of variables is usually tied to the view.

For example:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State` Variables

Variables declared with `@State` are tied to the lifecycle of the view.

```swift
@State private var name = "FangJunyu"
```

When the view is created, `name` is also created. When the view is removed, `name` is destroyed too.

That is why we need persistence methods such as `UserDefaults`.

### Variables Inside `body`

A variable defined inside `body`:

```swift
var num = 10
```

Its lifetime is tied to the execution of `body`.

When SwiftUI state changes, for example:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

When `name` changes, `@State` detects the change and tells SwiftUI to recalculate the view, which means `body` is recalculated.

When `body` is recalculated, all code inside `body` runs again, and variables inside `body`, such as `num`, are created again.

That is why it is not recommended to define complex variables inside `body`.

Because every time the view refreshes, those variables are recreated, which increases calculation cost and can affect performance.

In SwiftUI, different kinds of data should be managed differently. Data that should follow the lifecycle of the view can be stored with `@State`, while temporary calculation data can stay inside `body`.

## `onAppear` and `onDisappear`

In the previous lesson, we already learned `onAppear`. It runs when a view is shown:

```swift
.onAppear {}
```

For example:

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
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

In Xcode preview or when running the app, you can see the debug output from `onAppear`.

### `onDisappear`

The counterpart of `onAppear` is `onDisappear`:

```swift
.onDisappear {}
```

When a view is closed, `onDisappear` is called.

For example:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

When the view is removed, the code inside `onDisappear` is called.

Tip: at this stage, `ContentView` is still the root view of the app, so it cannot be directly closed or removed. That means at this stage we cannot easily observe the actual effect of `onDisappear`.

Only later, when we start learning navigation and presenting new views, will we be able to clearly see `onDisappear` being called.

## Creation and Display Are Different Stages

It is important to understand that creating a view and displaying a view are two different stages.

When a view is created, the struct initializer is called:

```swift
init() {}
```

Because SwiftUI views are structs:

```swift
struct ContentView: View { ... }
```

So when a view instance is created, its `init` initializer is executed. Only when the view is actually shown does `onAppear` get called.

For example:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

When previewing the view in Xcode, you can see the debug output:

```swift
Create ContentView
Show ContentView
```

This shows that `init` runs first to create the view, then the code in `body` is calculated, and finally the view is displayed and `onAppear` runs.

So it is important to understand that the creation stage and the display stage of a view are separate.

### The `init` Initializer

`init` is a fundamental Swift syntax. Both `struct` and `class` can define it. It is used to initialize an object.

```swift
init() {}
```

In SwiftUI, when a view is created, the system calls the view's `init` method. It can be used for receiving parameters and initializing data.

If you do not manually write an `init`, Swift automatically generates a default initializer for the struct.

For SwiftUI views such as `ContentView`, the idea is:

- when the view is created, `init` runs
- when the view is shown, `onAppear` runs

So `init` is the initializer that runs when the view is created, and it will become useful later when we pass parameters or initialize data.

## Summary

In this lesson, we learned the launch order of an app, from the entry file to the execution flow of `ContentView`.

We also learned the SwiftUI view lifecycle: when a view is created, `init` runs; when it appears on screen, `onAppear` runs; when it is removed or closed, `onDisappear` runs.

We learned the view update mechanism as well: views are driven by state. When state such as `@State` changes, SwiftUI refreshes the view, recalculates `body`, and recreates the variables inside `body`.

The lifecycle of variables is tied to the lifecycle of the view, while temporary variables inside `body` are recreated on each refresh.

Understanding these lifecycle rules and variable behaviors will help us organize code better and make app logic clearer.
