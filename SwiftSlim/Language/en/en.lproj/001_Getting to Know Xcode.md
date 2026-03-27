# Getting to Know Xcode

## What Is Xcode

Xcode is Apple's official integrated development environment, or IDE, used to develop apps for Apple platforms such as iOS, macOS, watchOS, and tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Throughout this tutorial, we will use Xcode to write code and run programs.

In this lesson, we will learn how to download Xcode, create our first iOS app, and get a basic understanding of the Xcode interface.

## Downloading Xcode

There are currently two ways to install Xcode:

1. Download it from the [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Download it from the [Apple Developer website](https://developer.apple.com/xcode/)

Both methods work. The difference is that the Apple Developer website provides not only the stable release, but also [beta](https://developer.apple.com/download/all/?q=Xcode) versions and older versions.

If you are only learning development, it is recommended to use the stable version. Beta versions are mainly for testing new features and may be unstable.

## Creating Your First Project

After opening Xcode, you will see the launch screen.

![Swift](../../RESOURCE/001_xcode1.png)

On the left, there are three common options:

- `Create New Project` — create a new project
- `Clone Git Repository` — clone a Git repository
- `Open Existing Project` — open an existing project

The right side shows the Xcode projects you opened recently.

We choose the `Create New Project` option.

### Selecting a Project Template

![Swift](../../RESOURCE/001_xcode2.png)

This brings you to the project template selection screen. It shows multiple platforms, such as iOS and macOS, along with different project templates.

Common templates include:

- `App` — the most basic application type, recommended for beginners
- `Document App` — an app based on a document-style workflow
- `Game` — used for game development
- `Framework` — a reusable module

At the beginner stage, we only choose the `iOS` -> `App` template, because this is the type used for standard interface-based apps.

Click `Next`.

### Filling In Project Information

This takes us to the project information screen. We need to fill in each field according to its purpose.

![Swift](../../RESOURCE/001_xcode3.png)

Meaning of the fields:

- `Product Name` — the project name, for example `SwiftSlimTest`
- `Team` — the developer team; if you do not have a paid Apple Developer account, you can leave it unselected
- `Organization Identifier` — the organization identifier, usually written in reverse-domain format, for example:
  - `com.yourname`
  - `com.yourcompany`
  - If you do not have a domain, you can use your own English name as the identifier
- `Bundle Identifier` — the unique identifier of the app; it is generated automatically from the `Organization Identifier` and `Product Name`
- `Interface` — the UI technology; choose `SwiftUI`
- `Language` — the development language; choose `Swift`
- `Testing System` — by default, Xcode creates a testing target such as Unit Tests; beginners can ignore this for now
- `Storage` — the local persistence framework; Xcode can integrate SwiftData or Core Data automatically, but beginners can ignore this for now as well

After filling everything in, click `Next`.

### Saving the Project

![Swift](../../RESOURCE/001_xcode4.png)

Choose a suitable folder for saving the project.

Click the `Create` button, and Xcode will automatically generate the project structure.

## Xcode Project Structure

After saving the project, you can see the generated project folder in Finder.

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` — a folder used to store images, app icons, and other resources

- `ContentView.swift` — the default SwiftUI view file, where we will later write our interface code

- `SwiftSlimTestApp.swift` — the app entry file, responsible for launching the app. We do not need to understand it yet.

- `SwiftSlimTest.xcodeproj` — the Xcode project file. Double-clicking this file opens the project.

## Getting to Know the Xcode Interface

Double-click the `.xcodeproj` file to open the project, then select `ContentView.swift` in the Navigator area on the left.

The Xcode interface mainly consists of five areas:

- `Navigator` — used to browse the file structure and perform searches
- `Editor` — used to write Swift or SwiftUI code
- `Canvas` — used for SwiftUI previews
- `Inspector` — used to view and modify file properties
- `Debug Area` — used to view logs and output

![Swift](../../RESOURCE/001_xcode6.png)

Note: `Canvas` is mainly used for SwiftUI view previews. In Xcode's architecture, it is a helper preview pane attached to the `Editor`. It is only available when a SwiftUI view file is open. Other file types do not show previews there.

In the following lessons, we will mainly write Swift and SwiftUI code in the `Editor` area.

When you open an Xcode project for the first time, the `Inspector` and `Debug Area` may be hidden by default. You can use the buttons in the top-right and bottom-right corners to show them.

![Swift](../../RESOURCE/001_xcode7.png)

Tip: The `Inspector` area is mainly used to view and modify file properties. In real development, it is often hidden in order to get a larger editing space.

## Summary

In this lesson, we learned how to download Xcode, create our first Xcode project, and understand the basic layout of the Xcode interface.

Here is some free exploration time:

- Try creating or deleting files in the `Navigator` area
- Look through the code in the `Editor` area and observe the code structure
- Explore the buttons in the `Canvas` area and try zooming the preview in and out

In the next lesson, we will begin writing some simple code, which will help us understand Xcode even better.
