# SwiftUI view ಜೀವನಚಕ್ರ

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ, `@State` variable ಗಳು view lifecycle ಜೊತೆ ಸಾಗುತ್ತವೆ ಎಂಬುದನ್ನೂ, `onAppear` ನ ಮೂಲ ಬಳಕೆಯನ್ನೂ ತಿಳಿದಿದ್ದೇವೆ.

ಈ ಪಾಠದಲ್ಲಿ, SwiftUI view lifecycle ಅನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೇವೆ: view ಹೇಗೆ ರಚಿಸಲಾಗುತ್ತದೆ ಮತ್ತು ತೋರಿಸಲಾಗುತ್ತದೆ, view ಒಳಗಿನ variables ಹೇಗೆ ರಚಿಸಲಾಗುತ್ತವೆ ಮತ್ತು ಮತ್ತೆ ಮರುರಚಿಸಲಾಗುತ್ತವೆ, ಹಾಗೆಯೇ `onAppear`, `onDisappear` ಮತ್ತು `init` constructor ಗಳನ್ನೂ ಕಲಿಯುತ್ತೇವೆ.

ಈ ಜ್ಞಾನದ ಮೂಲಕ, SwiftUI view ನಿರ್ಮಾಣ ಪ್ರಕ್ರಿಯೆಯ ಸಂಪೂರ್ಣ ಅರಿವು ರೂಪಿಸಬಹುದು.

## app ಪ್ರಾರಂಭ ಕ್ರಮ

iOS project ರಚಿಸಿದಾಗ, Xcode default ಆಗಿ ಎರಡು files ರಚಿಸುತ್ತದೆ:

```
ContentView.swift
ProjectName + App.swift
```

ಇವುಗಳಲ್ಲಿ `"ProjectName + App".swift` ಎಂದರೆ ಸಂಪೂರ್ಣ app ನ entry file.

ಉದಾಹರಣೆಗೆ:

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

### code execution flow

ನಾವು app ಅನ್ನು ರನ್ ಮಾಡಿದಾಗ (simulator ಅಥವಾ real device), system ಮೊದಲು `@main` keyword ಅನ್ನು ಹುಡುಕುತ್ತದೆ:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

entry file ದೃಢಪಟ್ಟ ನಂತರ, code execution ಪ್ರಾರಂಭವಾಗುತ್ತದೆ.

ಮೊದಲು `App` struct ಒಳಗೆ ಪ್ರವೇಶಿಸಿ, `body` ಯಲ್ಲಿನ code ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ. ನಂತರ `WindowGroup` ರಚಿಸಿ ಅದರೊಳಗೆ `ContentView` load ಮಾಡುತ್ತದೆ.

### WindowGroup ನ ಪಾತ್ರ

`WindowGroup` ಅನ್ನು window ಗಳನ್ನು ನಿರ್ವಹಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ:

```swift
WindowGroup {
    ContentView()
}
```

iPad / macOS ವ್ಯವಸ್ಥೆಗಳಲ್ಲಿ multiple windows ಬೆಂಬಲಿತವಾಗಿವೆ; iPhone ನಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಒಂದೇ window ಇರುತ್ತದೆ.

ಆದ್ದರಿಂದ iPhone ನಲ್ಲಿ `WindowGroup` ಮುಖ್ಯವಾಗಿ ಮೊದಲ screen ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ.

### view load ಪ್ರಕ್ರಿಯೆ

system `ContentView` ಅನ್ನು ಕಂಡ ನಂತರ:

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

SwiftUI `body` ಯಲ್ಲಿನ code ಅನ್ನು ನಿರ್ವಹಿಸಿ, ಅದು ಹಿಂತಿರುಗಿಸುವ view structure (`VStack`, `Text` ಮುಂತಾದವು) ಆಧರಿಸಿ interface ಅನ್ನು ನಿರ್ಮಿಸಿ, ಬಳಿಕ screen ಮೇಲೆ ತೋರಿಸುತ್ತದೆ.

ಈ ಹಂತಗಳ ನಂತರ, ನಾವು screen ನಲ್ಲಿ `ContentView` ಅನ್ನು ನೋಡಬಹುದು.

![ContentView](../../Resource/016_view1.png)

ಗಮನಿಸಬೇಕಾದದ್ದು, `body` ನ ಪಾತ್ರ view ಅನ್ನು generate ಮಾಡುವುದು; ಅದನ್ನು store ಮಾಡುವುದಲ್ಲ.

ಅಂದರೆ, ಪ್ರತಿ ಬಾರಿ view refresh ಆದಾಗ, SwiftUI `body` ಅನ್ನು ಮರು ಲೆಕ್ಕ ಹಾಕಿ, ಹೊಸ view structure ನಿರ್ಮಿಸುತ್ತದೆ.

### preview view logic

Xcode preview (Canvas) ಮತ್ತು ನೈಜ run ಎರಡು ಬೇರೆ mechanisms.

ಉದಾಹರಣೆಗೆ, entry file ನಲ್ಲಿ debug output ಸೇರಿಸೋಣ:

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

Xcode ನಲ್ಲಿ `ContentView` preview ಮಾಡಿದಾಗ, execution `@main` entry ಇಂದ ಪ್ರಾರಂಭವಾಗುವುದಿಲ್ಲ. ಆದ್ದರಿಂದ entry file ನ `onAppear` trigger ಆಗುವುದಿಲ್ಲ.

ಆದರೆ simulator ಅಥವಾ real device ನಲ್ಲಿ run ಮಾಡಿದರೆ, system `@main` ನಿಂದಲೇ execution ಪ್ರಾರಂಭಿಸಿ, app ನ ಸಂಪೂರ್ಣ flow ಅನ್ನು ನಡೆಸುತ್ತದೆ. ಆಗ entry ಯಲ್ಲಿನ `onAppear` trigger ಆಗಿ debug info output ಆಗುತ್ತದೆ.

ಮುಖ್ಯ ಅರ್ಥ ಏನೆಂದರೆ, Xcode preview ಕೇವಲ "partial rendering". ಅದು current view ತೋರಿಸಲು ಮಾತ್ರ. simulator ಮತ್ತು real device ಮಾತ್ರ "complete runtime environment" ಒದಗಿಸುತ್ತವೆ, ಅಲ್ಲಿ ಸಂಪೂರ್ಣ app execute ಆಗುತ್ತದೆ.

ಆದ್ದರಿಂದ app functionality ಪರೀಕ್ಷಿಸುವಾಗ simulator ಅಥವಾ real device ಮೇಲೆ ಅವಲಂಬಿಸಬೇಕು; Xcode preview ಸಂಪೂರ್ಣ runtime environment ನೀಡುವುದಿಲ್ಲ.

## view ನ lifecycle

ಈ ಹಂತದಲ್ಲಿ ನಮ್ಮ ಎಲ್ಲಾ code `ContentView` ಯಲ್ಲೇ ಕೇಂದ್ರೀಕೃತವಾಗಿದೆ. ಆದರೆ ನೈಜ app ಗಳಲ್ಲಿ, ಸಾಮಾನ್ಯವಾಗಿ ಅನೇಕ views ಇರುತ್ತವೆ ಮತ್ತು ಅವು ವಿಭಿನ್ನ ಸಂದರ್ಭಗಳಲ್ಲಿ ಬದಲಾಗುತ್ತವೆ.

ಉದಾಹರಣೆಗೆ, "ಹುಂಡಿ" ಯಲ್ಲಿ:

![PiggyBank](../../Resource/016_view.png)

"ಹಣ ಉಳಿಸಿ" ಒತ್ತಿದಾಗ `SaveView` ತೋರುತ್ತದೆ; ಹಣ ಉಳಿಸುವಿಕೆ ಮುಗಿದ ನಂತರ ಅಥವಾ close ಮಾಡಿದಾಗ, `SaveView` ತೆಗೆದುಹಾಕಲ್ಪಡುತ್ತದೆ.

ಈ ಸಂಪೂರ್ಣ ಪ್ರಕ್ರಿಯೆಯೇ ಒಂದು view ನ lifecycle: view ರಚನೆ, view ಪ್ರದರ್ಶನ, ಕೊನೆಗೆ view ತೆಗೆದುಹಾಕುವುದು.

### app ಮುಚ್ಚುವುದು

app ಮುಚ್ಚಿದಾಗ, ಎಲ್ಲಾ views ತೆಗೆದುಹಾಕಲ್ಪಡುತ್ತವೆ ಮತ್ತು ಸಂಬಂಧಿಸಿದ states ಕೂಡ ಅಳಿದುಹೋಗುತ್ತವೆ.

ಆದ್ದರಿಂದ `ContentView` ಹಾಗೂ ಇತರೆ views ಗಳು memory ಯಿಂದ ತೆಗೆದುಹಾಕಲ್ಪಡುತ್ತವೆ; ಸಂಪೂರ್ಣ app ನ runtime state ಶೂನ್ಯಗೊಳ್ಳುತ್ತದೆ.

## view ಒಳಗಿನ variable ಗಳ lifecycle

SwiftUI ಯಲ್ಲಿ variable ಗಳ lifecycle ಸಾಮಾನ್ಯವಾಗಿ view ಗೆ bind ಆಗಿರುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

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

### @State variable

`@State` ಮೂಲಕ ಘೋಷಿಸಿದ variable, view lifecycle ಗೆ bind ಆಗಿರುತ್ತದೆ.

```swift
@State private var name = "FangJunyu"
```

view ರಚನೆಯಾಗುವಾಗ `name` ಸಹ ರಚನೆಯಾಗುತ್ತದೆ; view ತೆಗೆದುಹಾಕಲ್ಪಟ್ಟಾಗ `name` ಕೂಡ ನಾಶವಾಗುತ್ತದೆ.

ಇದಕ್ಕೇ data persistence ಗಾಗಿ `UserDefaults` ಮುಂತಾದ ವಿಧಾನಗಳು ಅಗತ್ಯವಾಗುತ್ತವೆ.

### body ಒಳಗಿನ variable

`body` ಯೊಳಗೆ ವ್ಯಾಖ್ಯಾನಿಸಲಾದ variable:

```swift
var num = 10
```

ಇದರ lifecycle `body` execution ಪ್ರಕ್ರಿಯೆಗೆ bind ಆಗಿರುತ್ತದೆ.

SwiftUI ಯ state ಬದಲಾಗುವಾಗ, ಉದಾಹರಣೆಗೆ:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

`name` ಬದಲಾಗುತ್ತಿದ್ದಂತೆ, `@State` ಈ data change ಅನ್ನು ಗಮನಿಸಿ SwiftUI ಗೆ view ಮರು ಲೆಕ್ಕ ಹಾಕಬೇಕೆಂದು ತಿಳಿಸುತ್ತದೆ. ಆಗ `body` ಮರು ಗಣನೆಗೊಳಗಾಗುತ್ತದೆ.

`body` ಮತ್ತೆ ಲೆಕ್ಕ ಹಾಕಿದಾಗ, ಅದರೊಳಗಿನ ಎಲ್ಲಾ code ಮರು ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ; `body` ಯೊಳಗಿನ variables (`num` ಮುಂತಾದವು) ಮತ್ತೆ ಹೊಸದಾಗಿ ರಚಿಸಲ್ಪಡುತ್ತವೆ.

ಇದಕ್ಕಾಗಿಯೇ `body` ಯೊಳಗೆ ಸಂಕೀರ್ಣ variables ನಿರ್ಧರಿಸುವುದನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುವುದಿಲ್ಲ.

ಯಾಕೆಂದರೆ ಪ್ರತಿ ಬಾರಿ view refresh ಆದಾಗ, `body` ಯೊಳಗಿನ variables ಮತ್ತೆ ಮರುರಚಿಸಲ್ಪಡುತ್ತವೆ. ಇದು ಹೆಚ್ಚುವರಿ computation cost ತರುತ್ತದೆ ಮತ್ತು performance ಮೇಲೆ ಪರಿಣಾಮ ಬೀರುತ್ತದೆ.

SwiftUI ಯಲ್ಲಿ ಬೇರೆಬೇರೆ data ಗಳನ್ನು ಬೇರೆಬೇರೆ ವಿಧಾನಗಳಿಂದ ನಿರ್ವಹಿಸಬೇಕು: view lifecycle ಜೊತೆ ಸಾಗಬೇಕಾದ data ಅನ್ನು `@State` ನಲ್ಲಿ ಇಡಬಹುದು; ತಾತ್ಕಾಲಿಕ ಲೆಕ್ಕಾಚಾರದ data ಅನ್ನು `body` ಯೊಳಗೆ ಇಡಬಹುದು.

## onAppear ಮತ್ತು onDisappear

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ ನಾವು `onAppear` ಕಲಿತಿದ್ದೇವೆ. view ತೋರಿದಾಗ `onAppear` call ಆಗುತ್ತದೆ.

```swift
.onAppear {}
```

ಉದಾಹರಣೆಗೆ:

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

Xcode preview ಅಥವಾ app run ಸಮಯದಲ್ಲಿ `onAppear` ನ debug output ಅನ್ನು ನೋಡಬಹುದು.

### onDisappear

`onAppear` ಗೆ ಸಂಬಂಧಿಸಿದ ಮತ್ತೊಂದು modifier ಎಂದರೆ `onDisappear`:

```swift
.onDisappear {}
```

view ಮುಚ್ಚಿದಾಗ `onDisappear` call ಆಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

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

view ತೆಗೆದುಹಾಕಲ್ಪಟ್ಟಾಗ, `onDisappear` ಯಲ್ಲಿನ code ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ.

ಸೂಚನೆ: ಈಗಿನ ಹಂತದಲ್ಲಿ ಬಳಸುತ್ತಿರುವ `ContentView` app ನ root view ಆಗಿದೆ; ಇದನ್ನು ನೇರವಾಗಿ close ಅಥವಾ remove ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ. ಆದ್ದರಿಂದ ಈ ಹಂತದಲ್ಲಿ `onDisappear` ನ ಪರಿಣಾಮವನ್ನು ನೇರವಾಗಿ ಗಮನಿಸಲಾಗುವುದಿಲ್ಲ.

ಮುಂದೆ page navigation ಅಥವಾ ಹೊಸ view ತೆರೆದುಕೊಳ್ಳುವುದನ್ನು ಕಲಿತಾಗ ಮಾತ್ರ `onDisappear` call ಆಗುವುದನ್ನು ನೋಡಬಹುದು.

## ರಚನೆ ಮತ್ತು ಪ್ರದರ್ಶನ logic

ಗಮನಿಸಬೇಕಾದದ್ದು, view creation ಮತ್ತು view display ಎರಡು ಬೇರೆ ಹಂತಗಳು.

view ರಚನೆಯಾದಾಗ, struct ನ constructor call ಆಗುತ್ತದೆ:

```swift
init() {}
```

SwiftUI view ಒಂದು struct ಆಗಿರುವುದರಿಂದ:

```swift
struct ContentView: View { ... }
```

view instance ರಚನೆಯಾಗುವಾಗ `init` constructor ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ. view ತೋರಿದಾಗ ಮಾತ್ರ `onAppear` call ಆಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

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

Xcode ನಲ್ಲಿ view preview ಮಾಡಿದಾಗ, debug output ನಲ್ಲಿ ಹೀಗೆ ಕಾಣಬಹುದು:

```swift
Create ContentView
Show ContentView
```

ಇದು ಮೊದಲು `init` ಮೂಲಕ view ರಚನೆಯಾಗುತ್ತದೆ, ನಂತರ `body` code ಲೆಕ್ಕಿಸಲಾಗುತ್ತದೆ, ಕೊನೆಗೆ view ತೋರಿಸಿ `onAppear` call ಆಗುತ್ತದೆ ಎಂಬುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ಹೀಗಾಗಿ view ರಚನೆ ಮತ್ತು view ಪ್ರದರ್ಶನ ಎರಡು ಬೇರೆ ಹಂತಗಳು ಎಂಬುದನ್ನು ಚೆನ್ನಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಕು.

### init constructor

`init` Swift ನ ಮೂಲ syntax ಆಗಿದ್ದು, `struct` ಮತ್ತು `class` ಎರಡರಲ್ಲೂ ವ್ಯಾಖ್ಯಾನಿಸಬಹುದು. ಇದು object initialization ಗಾಗಿ ಬಳಕೆಯಾಗುತ್ತದೆ.

```swift
init() {}
```

SwiftUI ಯಲ್ಲಿ, view ರಚನೆಯಾಗುವಾಗ system view ನ `init` method ಅನ್ನು call ಮಾಡುತ್ತದೆ. ಇದನ್ನು parameters ಸ್ವೀಕರಿಸಲು ಅಥವಾ data initialize ಮಾಡಲು ಬಳಸಬಹುದು.

ನಾವು ಕೈಯಾರೆ `init` ಬರೆಯದಿದ್ದರೆ, Swift `struct` ಗೆ default constructor ಅನ್ನು ಸ್ವಯಂ ರಚಿಸುತ್ತದೆ.

`ContentView` ಮುಂತಾದ SwiftUI views ಗಳಿಗೆ, view ರಚನೆಯಾಗುವಾಗ `init` ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ; view ತೋರಿದಾಗ `onAppear` ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ.

ಆದ್ದರಿಂದ `init` ಎಂದರೆ view ರಚನೆಯಾಗುವಾಗ ನಡೆಯುವ constructor. ಮುಂದಿನ ಹಂತಗಳಲ್ಲಿ parameters pass ಮಾಡುವಾಗ ಅಥವಾ data initialize ಮಾಡುವಾಗ ಇದು ಉಪಯುಕ್ತವಾಗುತ್ತದೆ.

## ಸಂಗ್ರಹ

ಈ ಪಾಠದಲ್ಲಿ ನಾವು app startup sequence, entry file ನಿಂದ `ContentView` file ವರೆಗೆ code execution flow ಅನ್ನು ಕಲಿತಿದ್ದೇವೆ.

SwiftUI view lifecycle ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದೇವೆ: view ರಚನೆಯಾಗುವಾಗ `init`, screen ಮೇಲೆ ತೋರಿದಾಗ `onAppear`, view ತೆಗೆದುಹಾಕಿದಾಗ ಅಥವಾ ಮುಚ್ಚಿದಾಗ `onDisappear` ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ.

view update mechanism ನ್ನೂ ನೋಡಿದ್ದೇವೆ: view state-driven ಆಗಿದ್ದು, `@State` ಮುಂತಾದ state ಬದಲಾಗಿದಾಗ SwiftUI view ಅನ್ನು refresh ಮಾಡಿ `body` ಯನ್ನು ಮರು ಲೆಕ್ಕ ಹಾಕುತ್ತದೆ. ಆಗ `body` ಒಳಗಿನ variables ಕೂಡ ಮತ್ತೆ ರಚಿಸಲ್ಪಡುತ್ತವೆ.

variable ಗಳ lifecycle view lifecycle ಗೆ bind ಆಗಿರುತ್ತದೆ; `body` ಯೊಳಗಿನ temporary data ಪ್ರತೀ refresh ವೇಳೆ ಮತ್ತೆ ರಚಿಸಲ್ಪಡುತ್ತದೆ.

ಈ lifecycle ಮತ್ತು variable behavior ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದರಿಂದ, ನಾವು code ಅನ್ನು ಇನ್ನಷ್ಟು ಸರಿಯಾಗಿ ಸಂಘಟಿಸಿ, app logic ಅನ್ನು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟಗೊಳಿಸಬಹುದು.
