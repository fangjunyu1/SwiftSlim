# SwiftUI ਵਿਊ ਦਾ ਜੀਵਨ ਚੱਕਰ

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਸਮਝਿਆ ਸੀ ਕਿ @State variables ਵਿਊ ਦੇ lifecycle ਦੇ ਨਾਲ ਜੁੜੇ ਹੁੰਦੇ ਹਨ, ਅਤੇ ਅਸੀਂ onAppear ਦੀ ਬੁਨਿਆਦੀ ਵਰਤੋਂ ਵੀ ਸਿੱਖੀ ਸੀ।

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ SwiftUI ਵਿਊ ਦੇ lifecycle ਨੂੰ ਹੋਰ ਡੂੰਘਾਈ ਨਾਲ ਸਮਝਾਂਗੇ। ਅਸੀਂ ਜਾਣਾਂਗੇ ਕਿ ਵਿਊ ਕਿਵੇਂ ਬਣਦੀ ਹੈ ਅਤੇ ਕਿਵੇਂ ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਵਿਊ ਦੇ ਅੰਦਰਲੇ variables ਕਿਵੇਂ ਬਣਦੇ ਅਤੇ ਮੁੜ ਬਣਦੇ ਹਨ। ਨਾਲ ਹੀ ਅਸੀਂ onAppear, onDisappear ਅਤੇ init constructor ਵੀ ਸਿੱਖਾਂਗੇ।

ਇਹਨਾਂ ਗਿਆਨਾਂ ਦੇ ਆਧਾਰ 'ਤੇ, ਅਸੀਂ SwiftUI ਵਿਊ ਦੇ ਪੂਰੇ ਬਣਨ ਵਾਲੇ process ਬਾਰੇ ਇੱਕ ਸਮੁੱਚੀ ਸਮਝ ਤਿਆਰ ਕਰਾਂਗੇ।

## ਐਪ ਦੀ ਸ਼ੁਰੂਆਤੀ ਕ੍ਰਮਬੱਧਤਾ

ਜਦੋਂ ਇੱਕ iOS project ਬਣਾਇਆ ਜਾਂਦਾ ਹੈ, Xcode default ਤੌਰ 'ਤੇ ਦੋ files ਬਣਾਉਂਦਾ ਹੈ:

```swift
ContentView.swift
ProjectName + App.swift
````

ਇਨ੍ਹਾਂ ਵਿੱਚੋਂ, “ProjectName + App”.swift ਪੂਰੇ app ਦੀ entry file ਹੁੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift id="51pcgf"
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

### ਕੋਡ ਚਲਣ ਦਾ ਪ੍ਰਕਿਰਿਆ

ਜਦੋਂ ਅਸੀਂ App ਨੂੰ run ਕਰਦੇ ਹਾਂ (simulator ਜਾਂ real device 'ਤੇ), system ਸਭ ਤੋਂ ਪਹਿਲਾਂ @main keyword ਨੂੰ ਲੱਭਦਾ ਹੈ:

```swift id="46d5rh"
@main
struct SwiftSlimTestApp: App {...}
```

Entry file ਦੀ ਪੁਸ਼ਟੀ ਹੋਣ ਤੋਂ ਬਾਅਦ, code ਚੱਲਣਾ ਸ਼ੁਰੂ ਹੁੰਦਾ ਹੈ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ App struct ਵਿੱਚ ਦਾਖਲ ਹੁੰਦਾ ਹੈ, body ਦੇ ਅੰਦਰਲਾ code ਚਲਾਉਂਦਾ ਹੈ, ਫਿਰ WindowGroup ਬਣਾਉਂਦਾ ਹੈ ਅਤੇ ਉਸਦੇ ਅੰਦਰਲੇ ContentView ਨੂੰ load ਕਰਦਾ ਹੈ।

### WindowGroup ਦੀ ਭੂਮਿਕਾ

WindowGroup windows ਨੂੰ manage ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ:

```swift id="ivqgfo"
WindowGroup {
    ContentView()
}
```

iPad / macOS systems multi-window ਨੂੰ support ਕਰਦੇ ਹਨ, ਜਦਕਿ iPhone ਆਮ ਤੌਰ 'ਤੇ ਕੇਵਲ ਇੱਕ window ਹੀ ਰੱਖਦਾ ਹੈ।

ਇਸ ਲਈ, iPhone 'ਤੇ WindowGroup ਮੁੱਖ ਤੌਰ 'ਤੇ ਪਹਿਲੇ displayed screen ਨੂੰ manage ਕਰਦਾ ਹੈ।

### ਵਿਊ ਲੋਡ ਹੋਣ ਦੀ ਪ੍ਰਕਿਰਿਆ

ਜਦੋਂ system ContentView ਨੂੰ ਲੱਭ ਲੈਂਦਾ ਹੈ:

```swift id="prphl9"
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

SwiftUI body ਦੇ ਅੰਦਰਲਾ code ਚਲਾਉਂਦੀ ਹੈ, ਫਿਰ returned view structure (ਜਿਵੇਂ VStack, Text ਆਦਿ) ਦੇ ਆਧਾਰ 'ਤੇ interface ਬਣਾਉਂਦੀ ਹੈ, ਅਤੇ ਉਸਨੂੰ screen 'ਤੇ ਦਿਖਾਉਂਦੀ ਹੈ।

ਇਹਨਾਂ ਕਦਮਾਂ ਦੇ ਪੂਰਾ ਹੋਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ screen 'ਤੇ ContentView ਵੇਖ ਸਕਦੇ ਹਾਂ।

![ContentView](../../Resource/016_view1.png)

ਇੱਕ ਗੱਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖਣੀ ਚਾਹੀਦੀ ਹੈ ਕਿ body ਦਾ ਕੰਮ ਵਿਊ ਬਣਾਉਣਾ ਹੈ, ਵਿਊ ਨੂੰ store ਕਰਨਾ ਨਹੀਂ।

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਹਰ ਵਾਰ ਜਦੋਂ ਵਿਊ refresh ਹੁੰਦੀ ਹੈ, SwiftUI body ਨੂੰ ਮੁੜ calculate ਕਰਦੀ ਹੈ ਅਤੇ ਇੱਕ ਨਵੀਂ view structure ਤਿਆਰ ਕਰਦੀ ਹੈ।

### Preview ਵਿਊ ਦੀ logic

Xcode Preview (Canvas) ਅਤੇ actual running ਦੋ ਵੱਖਰੇ mechanisms ਹਨ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ entry file ਵਿੱਚ ਇੱਕ debug output ਜੋੜੀਏ:

```swift id="lhqz4u"
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

ਜੇ Xcode ਵਿੱਚ ContentView ਦਾ preview ਵੇਖਿਆ ਜਾਵੇ, ਤਾਂ ਇਹ @main entry ਤੋਂ ਚਲਣਾ ਸ਼ੁਰੂ ਨਹੀਂ ਕਰੇਗਾ, ਇਸ ਲਈ entry file ਵਾਲਾ onAppear trigger ਨਹੀਂ ਹੋਵੇਗਾ।

ਪਰ ਜੇ app ਨੂੰ simulator ਜਾਂ real device 'ਤੇ run ਕੀਤਾ ਜਾਵੇ, ਤਾਂ system @main ਤੋਂ execution ਸ਼ੁਰੂ ਕਰੇਗਾ, ਪੂਰੇ process ਦੇ ਅਨੁਸਾਰ ਪੂਰਾ app ਚਲਾਏਗਾ, ਅਤੇ entry ਵਿੱਚ ਦਿੱਤਾ onAppear trigger ਹੋਵੇਗਾ, ਨਾਲ ਹੀ debug output ਵੀ ਦਿਖੇਗੀ।

ਮੁੱਖ ਗੱਲ ਇਹ ਹੈ ਕਿ Xcode Preview ਸਿਰਫ “partial rendering” ਹੈ, ਜੋ ਕੇਵਲ ਮੌਜੂਦਾ view ਨੂੰ ਦਿਖਾਉਣ ਲਈ ਹੁੰਦੀ ਹੈ; ਜਦਕਿ simulator ਅਤੇ real device ਇੱਕ “complete runtime environment” ਦਿੰਦੇ ਹਨ, ਜੋ ਪੂਰੇ app ਨੂੰ execute ਕਰਦੇ ਹਨ।

ਇਸ ਲਈ, app ਦੀ functionality test ਕਰਦੇ ਸਮੇਂ simulator ਜਾਂ real device ਨੂੰ ਹੀ ਮਿਆਰ ਬਣਾਉਣਾ ਚਾਹੀਦਾ ਹੈ; Xcode Preview ਪੂਰਾ runtime environment ਨਹੀਂ ਦਿੰਦਾ।

## ਵਿਊ ਦਾ ਜੀਵਨ ਚੱਕਰ

ਮੌਜੂਦਾ ਪੜਾਅ ਵਿੱਚ, ਸਾਡਾ ਸਾਰਾ code ContentView ਵਿੱਚ ਕੇਂਦਰਿਤ ਹੈ। ਪਰ ਅਸਲ app ਵਿੱਚ, ਇੱਕ app ਆਮ ਤੌਰ 'ਤੇ ਕਈ views ਰੱਖਦੀ ਹੈ, ਅਤੇ ਵੱਖ-ਵੱਖ scenarios ਵਿੱਚ ਇਹਨਾਂ ਵਿੱਚ switching ਹੁੰਦੀ ਰਹਿੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, “ਗੁੱਲਕ” ਵਿੱਚ:

![PiggyBank](../../Resource/016_view.png)

ਜਦੋਂ “ਪੈਸੇ ਜਮ੍ਹਾ ਕਰੋ” 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ SaveView ਦਿਖਾਈ ਦਿੰਦੀ ਹੈ; ਜਦੋਂ saving ਖਤਮ ਹੁੰਦੀ ਹੈ ਜਾਂ view ਬੰਦ ਕੀਤੀ ਜਾਂਦੀ ਹੈ, ਤਾਂ SaveView ਹਟਾ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ।

ਇਹੀ ਇੱਕ ਵਿਊ ਦਾ lifecycle ਹੈ: view ਬਣਦੀ ਹੈ, ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਆਖਿਰਕਾਰ ਹਟਾ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ।

### ਐਪ ਨੂੰ ਬੰਦ ਕਰਨਾ

ਜਦੋਂ App ਬੰਦ ਕੀਤੀ ਜਾਂਦੀ ਹੈ, ਤਾਂ ਸਾਰੀਆਂ views ਹਟਾ ਦਿੱਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ, ਅਤੇ ਉਹਨਾਂ ਨਾਲ ਸੰਬੰਧਿਤ state ਵੀ ਖਤਮ ਹੋ ਜਾਂਦੀ ਹੈ।

ਇਸ ਲਈ, ContentView ਅਤੇ ਹੋਰ ਸਾਰੀਆਂ views memory ਤੋਂ ਹਟ ਜਾਂਦੀਆਂ ਹਨ, ਅਤੇ app ਦੀ ਪੂਰੀ runtime state ਵੀ ਸਾਫ ਹੋ ਜਾਂਦੀ ਹੈ।

## ਵਿਊ ਦੇ ਅੰਦਰ variables ਦਾ lifecycle

SwiftUI ਵਿੱਚ, variables ਦਾ lifecycle ਅਕਸਰ view ਨਾਲ bind ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift id="qx9u2v"
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

### @State variable

@State ਨਾਲ declare ਕੀਤਾ ਗਿਆ variable, view ਦੇ lifecycle ਨਾਲ bind ਹੁੰਦਾ ਹੈ।

```swift id="0rkh2q"
@State private var name = "FangJunyu"
```

ਜਦੋਂ view ਬਣਦੀ ਹੈ, name ਵੀ ਬਣਦਾ ਹੈ; ਜਦੋਂ view ਹਟਾਈ ਜਾਂਦੀ ਹੈ, name ਵੀ destroy ਹੋ ਜਾਂਦਾ ਹੈ।

ਇਸੇ ਕਾਰਣ ਸਾਨੂੰ UserDefaults ਵਰਗੇ ਤਰੀਕਿਆਂ ਨਾਲ data persistence ਕਰਨੀ ਪੈਂਦੀ ਹੈ।

### body ਦੇ ਅੰਦਰਲਾ variable

ਜੇ variable body ਦੇ ਅੰਦਰ define ਕੀਤਾ ਗਿਆ ਹੋਵੇ:

```swift id="ihn1dg"
var num = 10
```

ਇਸਦਾ lifecycle body ਦੇ execution process ਨਾਲ bind ਹੁੰਦਾ ਹੈ।

ਜਦੋਂ SwiftUI ਦੀ state ਵਿੱਚ ਕੋਈ ਬਦਲਾਅ ਹੁੰਦਾ ਹੈ, ਉਦਾਹਰਨ ਲਈ:

```swift id="jlwmjt"
@State private var name = "FangJunyu"
name = "Hu"
```

ਜਦੋਂ name ਬਦਲਦਾ ਹੈ, @State ਇਸ data change ਨੂੰ detect ਕਰਦਾ ਹੈ, ਅਤੇ SwiftUI ਨੂੰ view ਨੂੰ ਮੁੜ calculate ਕਰਨ ਲਈ notify ਕਰਦਾ ਹੈ, ਜਿਸ ਨਾਲ body ਮੁੜ calculate ਹੁੰਦੀ ਹੈ।

ਜਦੋਂ body ਮੁੜ calculate ਹੁੰਦੀ ਹੈ, ਤਾਂ body ਦੇ ਅੰਦਰਲਾ ਸਾਰਾ code ਮੁੜ execute ਹੁੰਦਾ ਹੈ, ਅਤੇ body ਦੇ variables (ਜਿਵੇਂ num) ਮੁੜ ਬਣਦੇ ਹਨ।

ਇਹੀ ਕਾਰਣ ਹੈ ਕਿ body ਦੇ ਅੰਦਰ complex variables define ਕਰਨ ਦੀ ਸਿਫਾਰਸ਼ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ।

ਕਿਉਂਕਿ ਹਰ ਵਾਰ view refresh ਹੋਣ 'ਤੇ body ਦੇ variables ਮੁੜ ਬਣਦੇ ਹਨ, ਜਿਸ ਨਾਲ calculation cost ਵਧਦੀ ਹੈ ਅਤੇ performance 'ਤੇ ਅਸਰ ਪੈਂਦਾ ਹੈ।

SwiftUI ਵਿੱਚ, ਵੱਖ-ਵੱਖ ਕਿਸਮ ਦੇ data ਨੂੰ ਵੱਖਰੇ ਤਰੀਕੇ ਨਾਲ manage ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜੋ data view ਦੇ lifecycle ਦੇ ਨਾਲ ਰਹਿਣੀ ਹੋਵੇ, ਉਸਨੂੰ @State ਨਾਲ save ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ; ਅਤੇ ਜੋ temporary calculated data ਹੋਵੇ, ਉਸਨੂੰ body ਵਿੱਚ ਰੱਖਿਆ ਜਾ ਸਕਦਾ ਹੈ।

## onAppear ਅਤੇ onDisappear

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ onAppear ਸਿੱਖੀ ਸੀ। ਜਦੋਂ view ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ, onAppear call ਹੁੰਦਾ ਹੈ।

```swift id="m6xlbt"
.onAppear {}
```

ਉਦਾਹਰਨ ਲਈ:

```swift id="2z44im"
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

Xcode Preview ਜਾਂ actual running ਦੌਰਾਨ, ਤੁਸੀਂ onAppear ਦੇ ਅੰਦਰਲਾ debug output ਵੇਖ ਸਕਦੇ ਹੋ।

### onDisappear

onAppear ਦੇ ਸਮਾਨ ਹੋਰ modifier ਹੈ onDisappear:

```swift id="hu75nu"
.onDisappear {}
```

ਜਦੋਂ view ਬੰਦ ਹੁੰਦੀ ਹੈ, onDisappear call ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift id="t7kmzw"
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

ਜਦੋਂ view ਹਟਾਈ ਜਾਂਦੀ ਹੈ, onDisappear ਦੇ ਅੰਦਰਲਾ code ਚੱਲਦਾ ਹੈ।

ਸੰਕੇਤ: ਮੌਜੂਦਾ ਪੜਾਅ ਵਿੱਚ ਵਰਤਿਆ ਜਾ ਰਿਹਾ ContentView app ਦਾ root view ਹੈ, ਜਿਸਨੂੰ ਸਿੱਧੇ ਤੌਰ 'ਤੇ ਬੰਦ ਜਾਂ ਹਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਦਾ। ਇਸ ਕਰਕੇ, ਇਸ ਪੜਾਅ ਵਿੱਚ onDisappear ਦਾ ਅਸਰ ਸਿੱਧਾ ਵੇਖਣਾ ਸੰਭਵ ਨਹੀਂ।

ਅਗਲੇ ਪਾਠਾਂ ਵਿੱਚ, ਜਦੋਂ ਅਸੀਂ page navigation ਜਾਂ ਨਵੀਂ view ਖੋਲ੍ਹਣੀ ਸਿੱਖਾਂਗੇ, ਤਦ onDisappear trigger ਹੁੰਦਾ ਹੋਇਆ ਵੇਖ ਸਕਾਂਗੇ।

## ਬਣਾਉਣ ਅਤੇ ਦਿਖਾਉਣ ਦੀ logic

ਇਹ ਧਿਆਨ ਵਿੱਚ ਰੱਖਣਾ ਲਾਜ਼ਮੀ ਹੈ ਕਿ view ਦੀ creation ਅਤੇ display ਦੋ ਵੱਖਰੇ ਪੜਾਅ ਹਨ।

ਜਦੋਂ view ਬਣਾਈ ਜਾਂਦੀ ਹੈ, ਤਾਂ struct ਦਾ constructor call ਹੁੰਦਾ ਹੈ:

```swift id="lo1tpk"
init() {}
```

ਕਿਉਂਕਿ SwiftUI ਦੀ view ਇੱਕ struct ਹੈ:

```swift id="7t0h7j"
struct ContentView: View { ... }
```

ਇਸ ਲਈ, ਜਦੋਂ view instance ਬਣਦਾ ਹੈ, init constructor execute ਹੁੰਦਾ ਹੈ। ਅਤੇ ਜਦੋਂ view ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ, ਤਦ onAppear call ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift id="uyw2lf"
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

Xcode ਵਿੱਚ view preview ਕਰਦੇ ਸਮੇਂ, ਤੁਸੀਂ ਇਹ debug output ਵੇਖ ਸਕਦੇ ਹੋ:

```swift id="3pkzgl"
Create ContentView
Show ContentView
```

ਇਸ ਤੋਂ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ ਪਹਿਲਾਂ init ਚੱਲਦਾ ਹੈ ਅਤੇ view ਬਣਦੀ ਹੈ, ਫਿਰ body ਦੇ ਅੰਦਰਲਾ code calculate ਹੁੰਦਾ ਹੈ, ਅਤੇ ਆਖ਼ਰ ਵਿੱਚ view ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ, ਨਾਲ ਹੀ onAppear ਵੀ execute ਹੁੰਦਾ ਹੈ।

ਇਸ ਲਈ, ਇਹ ਸਮਝਣਾ ਜ਼ਰੂਰੀ ਹੈ ਕਿ view creation ਅਤੇ view display ਦੋ ਵੱਖਰੇ stages ਹਨ।

### init constructor

init, Swift ਦੀ ਇੱਕ ਬੁਨਿਆਦੀ syntax ਹੈ। ਇਹ struct ਅਤੇ class ਦੋਵਾਂ ਵਿੱਚ define ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ, ਅਤੇ object ਨੂੰ initialize ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

```swift id="d2ewag"
init() {}
```

SwiftUI ਵਿੱਚ, ਜਦੋਂ ਕੋਈ view ਬਣਾਈ ਜਾਂਦੀ ਹੈ, system ਉਸ view ਦੀ init method call ਕਰਦਾ ਹੈ। ਇਸਦੀ ਵਰਤੋਂ parameters receive ਕਰਨ ਜਾਂ data initialize ਕਰਨ ਲਈ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ।

ਜੇ ਅਸੀਂ ਹੱਥੋਂ init ਨਾ ਲਿਖੀਏ, ਤਾਂ Swift ਆਪੇ ਹੀ struct ਲਈ ਇੱਕ default constructor generate ਕਰ ਦਿੰਦੀ ਹੈ।

ContentView ਵਰਗੀ SwiftUI views ਲਈ, view ਬਣਨ ਸਮੇਂ init ਚੱਲਦੀ ਹੈ; view ਦਿਖਾਈ ਦੇਣ ਸਮੇਂ onAppear ਚੱਲਦੀ ਹੈ।

ਇਸ ਲਈ, init ਉਹ constructor ਹੈ ਜੋ view ਬਣਦਿਆਂ execute ਹੁੰਦਾ ਹੈ, ਅਤੇ ਅੱਗੇ parameters pass ਕਰਨ ਜਾਂ data initialize ਕਰਨ ਵਿੱਚ ਵਰਤੀ ਜਾਵੇਗੀ।

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ app ਦੇ startup order ਨੂੰ ਸਿੱਖਿਆ — entry file ਤੋਂ ContentView file ਤੱਕ ਦੇ execution process ਨੂੰ ਸਮਝਿਆ।

ਅਸੀਂ SwiftUI view lifecycle ਨੂੰ ਸਮਝਿਆ: ਜਦੋਂ view ਬਣਦੀ ਹੈ, init execute ਹੁੰਦਾ ਹੈ; ਜਦੋਂ ਉਹ screen 'ਤੇ ਦਿਖਦੀ ਹੈ, onAppear execute ਹੁੰਦਾ ਹੈ; ਜਦੋਂ view ਹਟਾਈ ਜਾਂਦੀ ਹੈ ਜਾਂ ਬੰਦ ਹੁੰਦੀ ਹੈ, onDisappear execute ਹੁੰਦਾ ਹੈ।

ਅਸੀਂ view update mechanism ਵੀ ਸਿੱਖਿਆ: views state-driven ਹੁੰਦੀਆਂ ਹਨ। ਜਦੋਂ @State ਜਾਂ ਹੋਰ state ਬਦਲਦੀ ਹੈ, SwiftUI view ਨੂੰ refresh ਕਰਦੀ ਹੈ, body ਨੂੰ ਮੁੜ calculate ਕਰਦੀ ਹੈ, ਅਤੇ body ਦੇ ਅੰਦਰਲੇ variables ਵੀ ਮੁੜ ਬਣਦੇ ਹਨ।

Variables ਦਾ lifecycle view ਦੇ lifecycle ਨਾਲ bind ਹੋ ਸਕਦਾ ਹੈ, ਜਦਕਿ body ਦੇ ਅੰਦਰਲੇ temporary variables ਹਰ refresh 'ਤੇ ਮੁੜ ਬਣਦੇ ਹਨ।

ਇਹਨਾਂ lifecycle concepts ਅਤੇ variable behaviors ਨੂੰ ਸਮਝਣਾ, ਸਾਨੂੰ code ਨੂੰ ਹੋਰ ਵਧੀਆ ਢੰਗ ਨਾਲ organize ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ, ਅਤੇ app ਦੀ logic ਨੂੰ ਹੋਰ ਸਪੱਸ਼ਟ ਬਣਾਉਂਦਾ ਹੈ।
