# Swift and SwiftUI

When learning Apple-platform development, many tutorials tend to explain Swift and SwiftUI separately. This can easily give beginners a fragmented impression and make them think these are two completely independent technologies.

In reality, Swift and SwiftUI are deeply integrated as a whole: Swift is the programming language responsible for logic and data, while SwiftUI is the user interface framework built on top of Swift, responsible for rendering views and handling interaction.

This lesson will help you build a clear mental model: what Swift is, what SwiftUI is, and how they work together in code.

## What Is Swift?

Swift is a modern programming language introduced by Apple. It is used to develop applications for iOS, macOS, watchOS, tvOS, and other Apple platforms.

![swift](../../RESOURCE/010_swift.png)

Swift is a strongly typed, statically typed language. It is designed with a stronger emphasis on safety, reducing many common programming mistakes such as null pointer issues and out-of-range problems, while also supporting seamless integration with C and Objective-C.

In actual development, Swift is more responsible for the logic side of an app, such as data processing, network requests, and storage operations.

## What Is SwiftUI?

SwiftUI is a new interface-building framework introduced by Apple in 2019. SwiftUI uses a declarative programming model, allowing developers to describe interface structure and interaction behavior with much simpler code.

![swiftui](../../RESOURCE/010_swiftui.png)

Declarative programming means that developers only need to tell the system what should be displayed, and the system automatically refreshes the view based on data changes. There is no longer a need to manually update UI state, which greatly simplifies the complexity of UI development.

The core of SwiftUI is built around view components, such as `Text`, `Image`, and `Button`, along with layout containers such as `VStack`, `HStack`, and `ZStack`. These components interact through data binding and state management so that the interface can respond to data changes and refresh automatically.

## How Do Swift and SwiftUI Work Together?

The responsibilities of Swift and SwiftUI can be summarized as follows:

**1. Swift: handles logic and data**

Swift is mainly used to manage data, store state, and execute logic. This code usually does not directly control rendering. Instead, it is responsible for handling data and behavior.

For example, processing data in Swift:

```swift
let markdown = try? String(contentsOf: url)
```

This kind of code involves variable declarations, constant definitions, functions, and control flow. It does not directly affect how the view is displayed.

**2. SwiftUI: declares and renders the interface**

SwiftUI is used to build the layout and content of the user interface. Its main job is to render the interface and support view interaction.

For example, creating a text view in SwiftUI:

```swift
Text("SwiftSlim")
```

This kind of code is used to build and control interface elements and directly interacts with the UI.

### Basic Example

Below is a simple SwiftUI example:

```swift
// ContentView.swift

import SwiftUI

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

#Preview {
    ContentView()
}
```

In this example:

**SwiftUI code**: `VStack`, `Image`, `Text`, and `padding` all belong to SwiftUI and are responsible for the interface display and layout.

**Swift code**: the `//` comments at the top and `import SwiftUI` belong to the Swift code structure. The `#Preview` at the bottom is a macro used for Xcode previews and does not participate in the actual rendering of the interface.

### A More Advanced Example

In real projects, Swift and SwiftUI are often mixed together so that each can do what it is best at:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

In this example:

**SwiftUI code**: `@State` is a SwiftUI-specific property wrapper used to declare mutable view state. `Button` and `Text` are SwiftUI view components responsible for interface display and user interaction.

**Swift code**: `private var name` and `func printName()` are Swift code, used to store data and execute logic. They do not directly render the view.

When the user taps the button, SwiftUI triggers the action code inside the button:

```swift
Button("Print") {
    printName()
}
```

Here, `Button` is a SwiftUI component, while the executed `printName()` function is Swift code responsible for the actual logic.

This collaboration allows Swift and SwiftUI to work together seamlessly: Swift handles data and logic, and SwiftUI handles interface display.

## Where Is Swift Code Usually Written, and Where Is SwiftUI Code Usually Written?

In SwiftUI, the interface is built from the view returned by the `body` property. Therefore, all code used to describe the interface is usually written in `body`.

For example:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

In this example, `Text` is a SwiftUI view component, so it must be written inside `body`, because SwiftUI reads `body` to generate the interface.

Code unrelated to the interface, such as variables, functions, or data-processing logic, is usually written outside `body`. For example:

```swift
struct ContentView: View {

    // Swift: data or logic
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interface
    var body: some View {
        Text(name)
    }
}
```

It is important to note that `body` can still use Swift syntax, such as `if` and `for`. These are simply used to control the generation of SwiftUI views:

```swift
if isLogin {
    Text("Welcome")
}
```

So in SwiftUI development, you can roughly understand it like this: view code such as `Text`, `Image`, and `Button` is usually written in `body`, while data and logic code such as variables and functions is usually written outside `body`.

## Swift Files

As your learning goes deeper, you will also encounter the MVVM architecture, where the `ViewModel` and `Model` layers are usually made up of pure Swift code, completely separate from the view layer, which is SwiftUI.

For example, a class used to manage app state:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Or a struct used to describe a data structure:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

The job of files like these is to manage and persist data. They do not directly display anything on screen, so they belong entirely to Swift.

## Historical Background

To understand the relationship between Swift and SwiftUI, it also helps to understand how Apple development technologies evolved. As of 2026, this stack has gone through several iterations.

### The History of Swift

Before Swift appeared, Objective-C was the main programming language for Apple platforms and supported mixing with C. Its syntax was relatively verbose, and the learning barrier was higher for beginners:

```Obj-c
// Objective-C style
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

In 2014, Apple released Swift at WWDC. Swift had more modern syntax and better type safety, and gradually replaced Objective-C as the mainstream development language:

```swift
// Swift style
let name = "Fang"
print("Hello, \(name)")
```

However, Objective-C did not disappear. It is still widely used in many existing projects and lower-level frameworks. Understanding its basic syntax is still valuable when maintaining older projects and understanding the system at a lower level.

### The History of SwiftUI

Before SwiftUI, iOS used **UIKit** and macOS used **AppKit**. These two frameworks followed an imperative programming model. Developers either dragged controls in Storyboard or manually wrote code to control the state of the interface. This often led to a large amount of code and a higher maintenance cost, especially when the UI logic became complex.

![storyboard](../../RESOURCE/010_xcode.png)

In 2019, Apple officially introduced SwiftUI at WWDC. SwiftUI brought in a declarative programming model and greatly simplified the UI development process.

![storyboard](../../RESOURCE/010_xcode1.png)

It is worth noting that SwiftUI is not a completely independent low-level implementation. On each platform, it essentially works by bridging and cooperating with UIKit on iOS or AppKit on macOS. Under the hood, it still relies on those two frameworks to run.

### The Relationship Between Swift and UIKit/AppKit

Although Swift is a general-purpose programming language and can run on Apple platforms, it cannot fully replace UIKit or AppKit. For some more complex interface requirements, or for features that SwiftUI still does not cover, developers still need UIKit or AppKit.

For example, UIKit is already very mature in areas such as complex view-controller management, animations, and gesture recognition, and has been proven in large amounts of real production use. SwiftUI continues to improve in these areas, but in some edge cases it still has limitations.

Because of that, many developers mix SwiftUI with UIKit or AppKit in the same project, making full use of the strengths of each.

From this perspective, SwiftUI can be understood as a higher-level abstraction over UIKit and AppKit. While learning SwiftUI, having a basic understanding of UIKit and AppKit can help you make more reasonable technical decisions when maintaining older projects or implementing complex features.

## Summary

**Swift**: mainly used to write logic, data processing, and control flow. It is not directly concerned with view layout.

**SwiftUI**: used to declaratively build user interfaces. Code related to view content and layout belongs to SwiftUI.

In actual development, Swift and SwiftUI are usually used together. Swift handles the logic, and SwiftUI handles the interface.

From Objective-C and UIKit to Swift and SwiftUI, Apple's development environment has gradually moved toward more modern and concise programming methods. Even so, UIKit and AppKit still cannot be ignored in many traditional projects.

By understanding the relationship between Swift and SwiftUI, we can develop iOS and macOS apps more efficiently and also make better technical choices when maintaining older projects.
