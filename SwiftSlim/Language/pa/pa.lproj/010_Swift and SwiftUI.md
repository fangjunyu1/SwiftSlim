# Swift ਅਤੇ SwiftUI

Apple ਪਲੇਟਫਾਰਮ development ਸਿੱਖਣ ਵੇਲੇ, ਕਈ tutorials Swift ਅਤੇ SwiftUI ਨੂੰ ਵੱਖ-ਵੱਖ ਸਮਝਾਉਂਦੀਆਂ ਹਨ। ਇਸ ਨਾਲ ਸ਼ੁਰੂਆਤੀ ਵਿਦਿਆਰਥੀਆਂ ਨੂੰ ਟੁੱਟਿਆ ਹੋਇਆ ਅਹਿਸਾਸ ਹੋ ਸਕਦਾ ਹੈ, ਅਤੇ ਉਹ ਗਲਤੀ ਨਾਲ ਸਮਝ ਸਕਦੇ ਹਨ ਕਿ ਇਹ ਦੋ ਪੂਰੀ ਤਰ੍ਹਾਂ ਵੱਖਰੀਆਂ technologies ਹਨ।

ਅਸਲ ਵਿੱਚ, Swift ਅਤੇ SwiftUI ਇੱਕ ਦੂਜੇ ਨਾਲ ਡੂੰਘੇ ਤੌਰ 'ਤੇ ਜੁੜੇ ਹੋਏ ਹਨ: Swift ਇੱਕ programming language ਹੈ, ਜੋ logic ਅਤੇ data ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ; ਜਦਕਿ SwiftUI, Swift 'ਤੇ ਬਣਿਆ ਇੱਕ user interface framework ਹੈ, ਜੋ views ਦੀ rendering ਅਤੇ interaction ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

ਇਹ ਪਾਠ ਤੁਹਾਨੂੰ ਇੱਕ ਸਪੱਸ਼ਟ ਸਮਝ ਦਾ ਢਾਂਚਾ ਦੇਵੇਗਾ: Swift ਕੀ ਹੈ, SwiftUI ਕੀ ਹੈ, ਅਤੇ ਇਹ ਦੋਵੇਂ code ਵਿੱਚ ਇਕੱਠੇ ਕਿਵੇਂ ਕੰਮ ਕਰਦੇ ਹਨ।

## Swift ਕੀ ਹੈ?

Swift, Apple ਵੱਲੋਂ ਬਣਾਈ ਗਈ ਇੱਕ ਆਧੁਨਿਕ programming language ਹੈ, ਜੋ iOS, macOS, watchOS ਅਤੇ tvOS ਵਰਗੇ platforms ਉੱਤੇ applications ਬਣਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

![swift](../../RESOURCE/010_swift.png)

Swift ਇੱਕ strong typed, static language ਹੈ। ਇਸਦੀ ਡਿਜ਼ਾਈਨ ਵਿੱਚ safety ਨੂੰ ਵੱਧ ਮਹੱਤਵ ਦਿੱਤਾ ਗਿਆ ਹੈ, ਜਿਸ ਨਾਲ ਕਈ ਆਮ programming ਗਲਤੀਆਂ (ਜਿਵੇਂ null pointer, out-of-bounds ਆਦਿ) ਘੱਟ ਹੁੰਦੀਆਂ ਹਨ। ਇਹ C ਅਤੇ Objective-C ਨਾਲ ਬਿਨਾ ਰੁਕਾਵਟ integration ਨੂੰ ਵੀ support ਕਰਦੀ ਹੈ।

ਅਸਲ development ਵਿੱਚ, Swift ਜ਼ਿਆਦਾਤਰ application ਦੀ logic ਵਾਲੀ ਭਾਗ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ, ਜਿਵੇਂ data processing, network requests, storage operations ਆਦਿ।

## SwiftUI ਕੀ ਹੈ？

SwiftUI, Apple ਵੱਲੋਂ 2019 ਵਿੱਚ ਲਿਆਂਦਾ ਗਿਆ ਇੱਕ ਨਵਾਂ interface-building framework ਹੈ। SwiftUI declarative programming model ਵਰਤਦਾ ਹੈ, ਜੋ developers ਨੂੰ ਹੋਰ ਸੰਖੇਪ code ਨਾਲ interface structure ਅਤੇ interaction behavior ਦਰਸਾਉਣ ਦੀ ਸਹੂਲਤ ਦਿੰਦਾ ਹੈ।

![swiftui](../../RESOURCE/010_swiftui.png)

Declarative programming ਦਾ ਮਤਲਬ ਹੈ ਕਿ developer ਨੂੰ ਸਿਰਫ਼ ਇਹ ਦੱਸਣਾ ਹੁੰਦਾ ਹੈ ਕਿ ਕੀ ਦਿਖਾਉਣਾ ਹੈ; ਫਿਰ system data ਦੇ ਬਦਲਾਅ ਦੇ ਆਧਾਰ 'ਤੇ ਆਪਣੇ ਆਪ view ਨੂੰ refresh ਕਰਦਾ ਹੈ। ਇਸ ਨਾਲ interface state ਨੂੰ ਹੱਥੋਂ update ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ, ਅਤੇ UI development ਦੀ complexity ਕਾਫ਼ੀ ਘੱਟ ਹੋ ਜਾਂਦੀ ਹੈ।

SwiftUI ਦਾ ਕੇਂਦਰ view components (ਜਿਵੇਂ `Text`, `Image`, `Button` ਆਦਿ) ਅਤੇ layout containers (ਜਿਵੇਂ `VStack`, `HStack`, `ZStack`) ਹਨ। ਇਹ components data binding ਅਤੇ state management ਰਾਹੀਂ ਇਕ ਦੂਜੇ ਨਾਲ interact ਕਰਦੇ ਹਨ, ਜਿਸ ਨਾਲ interface data ਦੇ ਬਦਲਾਅ 'ਤੇ ਪ੍ਰਤੀਕਿਰਿਆ ਕਰ ਸਕਦਾ ਹੈ ਅਤੇ ਆਪਣੇ ਆਪ refresh ਹੁੰਦਾ ਹੈ।

## Swift ਅਤੇ SwiftUI ਕਿਵੇਂ ਮਿਲ ਕੇ ਕੰਮ ਕਰਦੇ ਹਨ？

Swift ਅਤੇ SwiftUI ਦੀਆਂ ਜ਼ਿੰਮੇਵਾਰੀਆਂ ਨੂੰ ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਸੰਖੇਪ ਕਰ ਸਕਦੇ ਹਾਂ:

**1. Swift: logic ਅਤੇ data ਸੰਭਾਲਣਾ**

Swift ਮੁੱਖ ਤੌਰ 'ਤੇ data manage ਕਰਨ, state store ਕਰਨ ਅਤੇ logic ਚਲਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਇਹ code ਆਮ ਤੌਰ 'ਤੇ interface rendering ਨੂੰ ਸਿੱਧੇ ਤੌਰ 'ਤੇ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦਾ, ਸਗੋਂ data ਅਤੇ behavior ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, Swift ਵਿੱਚ data process ਕਰਨਾ:

```swift
let markdown = try? String(contentsOf: url)
````

ਇਹ code variable declaration, constant definition, functions, control flow ਆਦਿ ਨਾਲ ਸੰਬੰਧਿਤ ਹੈ, ਅਤੇ ਸਿੱਧਾ view ਦੇ ਦਿਖਾਵੇ ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦਾ।

**2. SwiftUI: interface ਨੂੰ declare ਅਤੇ render ਕਰਨਾ**

SwiftUI user interface ਦੀ layout ਅਤੇ content ਬਣਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਮੁੱਖ ਤੌਰ 'ਤੇ interface rendering ਅਤੇ view interaction ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, SwiftUI ਨਾਲ ਇੱਕ text view ਬਣਾਉਣਾ:

```swift
Text("SwiftSlim")
```

ਇਹ ਸਭ code interface elements ਬਣਾਉਣ ਅਤੇ ਸੰਭਾਲਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਸਿੱਧੇ user interface ਨਾਲ ਸੰਬੰਧਿਤ ਹੁੰਦੀ ਹੈ।

### ਬੁਨਿਆਦੀ ਉਦਾਹਰਨ

ਹੇਠਾਂ ਇੱਕ ਸਧਾਰਣ SwiftUI ਉਦਾਹਰਨ ਹੈ:

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

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ:

**SwiftUI code**：`VStack`、`Image`、`Text`、`padding` ਸਭ SwiftUI ਨਾਲ ਸੰਬੰਧਿਤ ਹਨ, ਅਤੇ interface ਦੇ layout ਅਤੇ display ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹਨ।

**Swift code**：ਫਾਈਲ ਦੇ ਉੱਪਰ ਵਾਲੀ `//` comment ਅਤੇ `import SwiftUI` Swift code ਦੀ ਬਣਤਰ ਦਾ ਹਿੱਸਾ ਹਨ; ਹੇਠਾਂ ਵਾਲਾ `#Preview` Xcode preview ਲਈ ਵਰਤਿਆ ਜਾਣ ਵਾਲਾ macro ਹੈ, ਜੋ ਅਸਲ interface rendering ਵਿੱਚ ਹਿੱਸਾ ਨਹੀਂ ਲੈਂਦਾ।

### ਅਗਾਂਹਲੀ ਉਦਾਹਰਨ

ਅਸਲ projects ਵਿੱਚ, Swift ਅਤੇ SwiftUI ਆਮ ਤੌਰ 'ਤੇ ਮਿਲੀ-ਜੁਲੀ ਵਰਤੋਂ ਵਿੱਚ ਹੁੰਦੇ ਹਨ, ਤਾਂ ਜੋ ਹਰ ਇੱਕ ਆਪਣੀ ਤਾਕਤ ਵਾਲੇ ਕੰਮ ਕਰ ਸਕੇ:

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

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ:

**SwiftUI code**：`@State` SwiftUI ਦਾ ਖ਼ਾਸ property wrapper ਹੈ, ਜੋ view ਦੀ mutable state ਨੂੰ declare ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ; `Button` ਅਤੇ `Text` SwiftUI ਦੇ view components ਹਨ, ਜੋ interface display ਅਤੇ user interaction ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹਨ।

**Swift code**：`private var name` ਅਤੇ `func printName()` Swift code ਹਨ, ਜੋ data store ਕਰਨ ਅਤੇ logic ਚਲਾਉਣ ਲਈ ਵਰਤੇ ਜਾਂਦੇ ਹਨ, ਅਤੇ ਸਿੱਧੇ view rendering ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦੇ।

ਜਦੋਂ ਯੂਜ਼ਰ ਬਟਨ 'ਤੇ click ਕਰਦਾ ਹੈ, SwiftUI ਬਟਨ ਦੇ ਅੰਦਰ ਵਾਲਾ action trigger ਕਰਦਾ ਹੈ:

```swift
Button("Print") {
    printName()
}
```

ਇੱਥੇ `Button` SwiftUI component ਹੈ, ਜਦਕਿ ਚੱਲਣ ਵਾਲਾ `printName()` function Swift code ਹੈ, ਜੋ ਵਿਸਥਾਰ ਨਾਲ logic ਸੰਭਾਲਦਾ ਹੈ।

ਇਹ ਸਹਿਯੋਗ Swift ਅਤੇ SwiftUI ਨੂੰ ਬਿਨਾ ਕਿਸੇ ਰੁਕਾਵਟ ਦੇ ਇਕੱਠੇ ਕੰਮ ਕਰਨ ਯੋਗ ਬਣਾਉਂਦਾ ਹੈ: Swift data ਅਤੇ logic ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ, ਅਤੇ SwiftUI user interface ਦੇ display ਲਈ।

## Swift ਅਤੇ SwiftUI ਦਾ code ਆਮ ਤੌਰ 'ਤੇ ਕਿੱਥੇ ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ？

SwiftUI ਵਿੱਚ, interface `body` property ਦੁਆਰਾ ਵਾਪਸ ਕੀਤੇ ਗਏ views ਰਾਹੀਂ ਬਣਾਈ ਜਾਂਦੀ ਹੈ। ਇਸ ਲਈ, ਜੋ ਵੀ code interface ਦਾ ਵੇਰਵਾ ਦਿੰਦੀ ਹੈ, ਉਹ ਆਮ ਤੌਰ 'ਤੇ `body` ਦੇ ਅੰਦਰ ਲਿਖੀ ਜਾਂਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, `Text` SwiftUI ਦਾ view component ਹੈ, ਇਸ ਲਈ ਇਹ `body` ਦੇ ਅੰਦਰ ਹੀ ਲਿਖਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ, ਕਿਉਂਕਿ SwiftUI `body` ਨੂੰ ਪੜ੍ਹ ਕੇ interface ਬਣਾਉਂਦਾ ਹੈ।

ਜੋ code interface ਨਾਲ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੈ, ਜਿਵੇਂ variables, functions ਜਾਂ data processing logic, ਉਹ ਆਮ ਤੌਰ 'ਤੇ `body` ਦੇ ਬਾਹਰ ਲਿਖੀ ਜਾਂਦੀ ਹੈ। ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {

    // Swift：data ਜਾਂ logic
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：interface
    var body: some View {
        Text(name)
    }
}
```

ਧਿਆਨ ਦੇਣ ਵਾਲੀ ਗੱਲ ਇਹ ਹੈ ਕਿ `body` ਦੇ ਅੰਦਰ ਵੀ Swift syntax ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ, ਜਿਵੇਂ `if`、`for` ਵਰਗੇ control flow statements। ਇਹ ਸਿਰਫ਼ SwiftUI views ਦੇ ਬਣਨ ਨੂੰ control ਕਰਨ ਲਈ ਹੁੰਦੇ ਹਨ:

```swift
if isLogin {
    Text("Welcome")
}
```

ਇਸ ਲਈ, SwiftUI development ਵਿੱਚ ਤੁਸੀਂ ਸਧਾਰਣ ਤਰੀਕੇ ਨਾਲ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹੋ: view code (`Text`、`Image`、`Button` ਆਦਿ) ਆਮ ਤੌਰ 'ਤੇ `body` ਦੇ ਅੰਦਰ ਲਿਖੀ ਜਾਂਦੀ ਹੈ; data ਅਤੇ logic ਵਾਲਾ code (variables, functions ਆਦਿ) ਆਮ ਤੌਰ 'ਤੇ `body` ਦੇ ਬਾਹਰ ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ।

## Swift ਫਾਈਲਾਂ

ਜਿਵੇਂ ਜਿਵੇਂ ਸਿੱਖਿਆ ਅੱਗੇ ਵਧਦੀ ਹੈ, ਅਸੀਂ MVVM architecture ਨਾਲ ਵੀ ਜਾਣੂ ਹੋਵਾਂਗੇ, ਜਿਸ ਵਿੱਚ `ViewModel` ਅਤੇ `Model` layer ਆਮ ਤੌਰ 'ਤੇ pure Swift code ਤੋਂ ਬਣੇ ਹੁੰਦੇ ਹਨ, ਅਤੇ view layer (SwiftUI) ਤੋਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਵੱਖਰੇ ਹੁੰਦੇ ਹਨ।

ਉਦਾਹਰਨ ਲਈ, application state manage ਕਰਨ ਲਈ class:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

ਜਾਂ data structure ਨੂੰ ਦਰਸਾਉਣ ਵਾਲਾ struct:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

ਇਨ੍ਹਾਂ ਫਾਈਲਾਂ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ data ਨੂੰ manage ਅਤੇ persist ਕਰਨਾ ਹੈ, ਅਤੇ ਇਹ ਸਿੱਧੇ views ਵਿੱਚ ਨਹੀਂ ਦਿਖਦੀਆਂ, ਇਸ ਲਈ ਇਹ ਪੂਰੀ ਤਰ੍ਹਾਂ Swift ਨਾਲ ਸੰਬੰਧਿਤ ਹਨ।

## ਇਤਿਹਾਸਕ ਪਿਛੋਕੜ

Swift ਅਤੇ SwiftUI ਦੇ ਸੰਬੰਧ ਨੂੰ ਸਮਝਣ ਲਈ Apple development technologies ਦੇ ਵਿਕਾਸਕ੍ਰਮ ਨੂੰ ਜਾਣਨਾ ਵੀ ਲਾਜ਼ਮੀ ਹੈ। 2026 ਤੱਕ, ਇਹ technology stack ਕਈ ਵਾਰ iterate ਹੋ ਚੁੱਕੀ ਹੈ।

### Swift ਦਾ ਇਤਿਹਾਸ

Swift ਦੇ ਆਉਣ ਤੋਂ ਪਹਿਲਾਂ, Objective-C Apple platforms ਲਈ ਮੁੱਖ programming language ਸੀ, ਅਤੇ ਇਹ C language ਨਾਲ mixed programming ਨੂੰ support ਕਰਦੀ ਸੀ। ਇਸ ਦੀ syntax ਕਾਫ਼ੀ ਲੰਬੀ ਸੀ, ਜਿਸ ਕਾਰਨ ਸ਼ੁਰੂਆਤੀ ਲੋਕਾਂ ਲਈ ਇਸਨੂੰ ਸਿੱਖਣਾ ਕੁਝ ਔਖਾ ਹੁੰਦਾ ਸੀ:

```Obj-c
// Objective-C ਵਿੱਚ ਲਿਖਣ ਦਾ ਤਰੀਕਾ
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 ਵਿੱਚ, Apple ਨੇ WWDC 'ਤੇ Swift language ਜਾਰੀ ਕੀਤੀ। Swift ਦੀ syntax ਹੋਰ ਆਧੁਨਿਕ ਹੈ, type safety ਵੀ ਵੱਧ ਹੈ, ਅਤੇ ਇਹ ਹੌਲੀ-ਹੌਲੀ Objective-C ਦੀ ਥਾਂ ਮੁੱਖ development language ਬਣ ਗਈ:

```swift
// Swift ਵਿੱਚ ਲਿਖਣ ਦਾ ਤਰੀਕਾ
let name = "Fang"
print("Hello, \(name)")
```

ਪਰ Objective-C ਇਤਿਹਾਸ ਤੋਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਗਾਇਬ ਨਹੀਂ ਹੋਈ। ਇਹ ਅਜੇ ਵੀ ਕਈ ਪੁਰਾਣੇ projects ਅਤੇ low-level frameworks ਵਿੱਚ ਵਿਸ਼ਾਲ ਤੌਰ 'ਤੇ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਇਸਦੀ ਬੁਨਿਆਦੀ syntax ਨੂੰ ਜਾਣਨਾ ਪੁਰਾਣੇ projects ਨੂੰ maintain ਕਰਨ ਅਤੇ system ਦੇ low-level ਹਿੱਸਿਆਂ ਨੂੰ ਸਮਝਣ ਲਈ ਅਜੇ ਵੀ ਲਾਭਕਾਰੀ ਹੈ।

### SwiftUI ਦਾ ਇਤਿਹਾਸ

SwiftUI ਦੇ ਆਉਣ ਤੋਂ ਪਹਿਲਾਂ, iOS ਵਿੱਚ **UIKit** ਅਤੇ macOS ਵਿੱਚ **AppKit** ਵਰਤੇ ਜਾਂਦੇ ਸਨ। ਇਹ ਦੋਵੇਂ frameworks “imperative” programming style 'ਤੇ ਆਧਾਰਿਤ ਸਨ। Developers ਨੂੰ Storyboard ਰਾਹੀਂ controls drag ਕਰਕੇ ਜਾਂ ਹੱਥੋਂ code ਲਿਖ ਕੇ view state ਨੂੰ control ਕਰਨਾ ਪੈਂਦਾ ਸੀ। ਇਸ ਨਾਲ code ਵੱਧ ਹੋ ਜਾਂਦਾ ਸੀ, maintenance cost ਵਧ ਜਾਂਦੀ ਸੀ, ਖ਼ਾਸ ਕਰਕੇ ਜਦੋਂ interface logic ਜਟਿਲ ਹੁੰਦੀ ਸੀ।

![storyboard](../../RESOURCE/010_xcode.png)

2019 ਵਿੱਚ, Apple ਨੇ WWDC 'ਤੇ SwiftUI ਨੂੰ ਅਧਿਕਾਰਿਕ ਤੌਰ 'ਤੇ ਜਾਰੀ ਕੀਤਾ। SwiftUI ਨੇ “declarative” programming paradigm ਲਿਆਂਦੀ, ਜਿਸ ਨਾਲ UI development process ਕਾਫ਼ੀ ਸੌਖੀ ਹੋ ਗਈ।

![storyboard](../../RESOURCE/010_xcode1.png)

ਇਹ ਗੱਲ ਧਿਆਨਯੋਗ ਹੈ ਕਿ SwiftUI ਪੂਰੀ ਤਰ੍ਹਾਂ ਇੱਕ ਅਲੱਗ low-level implementation ਨਹੀਂ ਹੈ। ਵੱਖ-ਵੱਖ platforms 'ਤੇ, ਇਹ ਅਸਲ ਵਿੱਚ UIKit (iOS) ਜਾਂ AppKit (macOS) ਨਾਲ bridge ਕਰਦਾ ਹੈ ਅਤੇ ਉਨ੍ਹਾਂ ਨਾਲ ਮਿਲ ਕੇ ਕੰਮ ਕਰਦਾ ਹੈ। ਇਸਦਾ low-level runtime ਅਜੇ ਵੀ ਇਹਨਾਂ ਦੋ frameworks 'ਤੇ ਨਿਰਭਰ ਹੈ।

### Swift ਅਤੇ UIKit/AppKit ਦਾ ਸੰਬੰਧ

ਭਾਵੇਂ Swift ਇੱਕ general-purpose programming language ਹੈ ਅਤੇ Apple ਦੇ ਵੱਖ-ਵੱਖ platforms 'ਤੇ ਚੱਲ ਸਕਦੀ ਹੈ, ਪਰ ਇਹ UIKit ਜਾਂ AppKit ਦੀ ਪੂਰੀ ਤਰ੍ਹਾਂ ਥਾਂ ਨਹੀਂ ਲੈ ਸਕਦੀ। ਕੁਝ ਜਟਿਲ interface requirements ਲਈ, ਜਾਂ ਉਹਨਾਂ features ਲਈ ਜਿਨ੍ਹਾਂ ਨੂੰ SwiftUI ਹਾਲੇ cover ਨਹੀਂ ਕਰਦਾ, UIKit ਜਾਂ AppKit ਦੀ ਮਦਦ ਲੈਣੀ ਪੈਂਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, UIKit ਜਟਿਲ view controller management, animations, gesture recognition ਆਦਿ ਵਿੱਚ ਕਾਫ਼ੀ ਪੱਕਾ ਹੈ, ਅਤੇ ਇਸਦੀ production ਵਿੱਚ ਬਹੁਤ ਵੱਡੀ ਵਰਤੋਂ ਹੋ ਚੁੱਕੀ ਹੈ। SwiftUI ਦੀ ਸਮਰੱਥਾ ਵੀ ਲਗਾਤਾਰ ਵਧ ਰਹੀ ਹੈ, ਪਰ ਕੁਝ edge cases ਵਿੱਚ ਅਜੇ ਵੀ ਇਸ ਦੀਆਂ ਹੱਦਾਂ ਹਨ।

ਇਸ ਲਈ, ਕਈ developers ਆਪਣੇ projects ਵਿੱਚ SwiftUI ਅਤੇ UIKit (ਜਾਂ AppKit) ਨੂੰ ਮਿਲਾ ਕੇ ਵਰਤਦੇ ਹਨ, ਤਾਂ ਜੋ ਦੋਵਾਂ ਦੇ ਵੱਖ-ਵੱਖ ਫਾਇਦੇ ਲਏ ਜਾ ਸਕਣ।

ਇਸ ਨਜ਼ਰੀਏ ਨਾਲ ਦੇਖਿਆ ਜਾਵੇ, ਤਾਂ SwiftUI ਨੂੰ UIKit / AppKit ਉੱਤੇ ਇੱਕ higher-level abstraction ਵਜੋਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ। SwiftUI ਸਿੱਖਦੇ ਸਮੇਂ, UIKit ਅਤੇ AppKit ਦੇ ਬੁਨਿਆਦੀ concepts ਨੂੰ ਵੀ ਕੁਝ ਹੱਦ ਤੱਕ ਸਮਝਣਾ, ਪੁਰਾਣੇ projects ਨੂੰ maintain ਕਰਨ ਜਾਂ ਜਟਿਲ features ਬਣਾਉਣ ਵੇਲੇ ਹੋਰ ਉਚਿਤ technical decisions ਲੈਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।

## ਸਾਰ

**Swift**：ਮੁੱਖ ਤੌਰ 'ਤੇ logic, data processing, control flow ਆਦਿ ਲਿਖਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ, ਅਤੇ view layout ਨਾਲ ਸਿੱਧਾ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੁੰਦੀ।

**SwiftUI**：declarative ਤਰੀਕੇ ਨਾਲ user interface ਬਣਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ; view content ਅਤੇ layout ਨਾਲ ਸੰਬੰਧਿਤ code SwiftUI ਦਾ ਹਿੱਸਾ ਹੈ।

ਅਸਲ development ਵਿੱਚ, Swift ਅਤੇ SwiftUI ਆਮ ਤੌਰ 'ਤੇ ਇਕੱਠੇ ਵਰਤੇ ਜਾਂਦੇ ਹਨ: Swift logic ਸੰਭਾਲਦਾ ਹੈ, SwiftUI interface ਸੰਭਾਲਦਾ ਹੈ।

Objective-C ਅਤੇ UIKit ਤੋਂ Swift ਅਤੇ SwiftUI ਤੱਕ, Apple ਦਾ development environment ਹੌਲੀ-ਹੌਲੀ ਹੋਰ ਆਧੁਨਿਕ ਅਤੇ ਸੰਖੇਪ programming style ਵੱਲ ਵਧਿਆ ਹੈ, ਪਰ UIKit ਅਤੇ AppKit ਨੂੰ ਕਈ ਰਵਾਇਤੀ projects ਵਿੱਚ ਅਜੇ ਵੀ ਨਜ਼ਰਅੰਦਾਜ਼ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।

Swift ਅਤੇ SwiftUI ਦੇ ਸੰਬੰਧ ਨੂੰ ਸਮਝ ਕੇ, ਅਸੀਂ iOS/macOS development ਹੋਰ ਕੁਸ਼ਲਤਾਪੂਰਵਕ ਕਰ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਪੁਰਾਣੇ projects ਨੂੰ maintain ਕਰਦੇ ਸਮੇਂ ਹੋਰ ਉਚਿਤ technical ਚੋਣਾਂ ਕਰ ਸਕਦੇ ਹਾਂ।
