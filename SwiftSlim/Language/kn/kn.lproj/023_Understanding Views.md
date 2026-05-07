# Views ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಮತ್ತೆ ಮೊದಲಿನ `ContentView` ಗೆ ಮರಳುತ್ತೇವೆ.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

ನಾವು ಮೊದಲ ಬಾರಿ SwiftUI ಅನ್ನು ನೋಡಿದಾಗ, `ContentView` ಒಳಗೆ ನಮಗೆ ಅರ್ಥವಾಗದ ಹಲವು keywords ಇದ್ದವು.

ಉದಾಹರಣೆಗೆ `struct`, `View`, `var`, `body`, `some View` ಮುಂತಾದ keywords.

ಆ ಸಮಯದಲ್ಲಿ ನಮಗೆ ಬಹುಶಃ ಇಷ್ಟೇ ಗೊತ್ತಿರಬಹುದು: **code ಅನ್ನು `body` ಒಳಗೆ ಬರೆದರೆ, interface ಮೇಲೆ content ಕಾಣಿಸುತ್ತದೆ.**

ಈಗ ನಾವು `struct`, variables, methods ಮತ್ತು protocols ಅನ್ನು ಕಲಿತಿದ್ದೇವೆ. ಆದ್ದರಿಂದ ಈ code ಅನ್ನು ಮತ್ತೆ ಅರ್ಥಮಾಡಿಕೊಂಡು, SwiftUI views ನಡುವಿನ ಸಂಬಂಧವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸಹಾಯ ಮಾಡಬಹುದು.

## ContentView ಅನ್ನು ಮತ್ತೆ ನೋಡುವುದು

SwiftUI project ರಚಿಸಿದ ನಂತರ, Xcode default ಆಗಿ ಒಂದು `ContentView` file ಅನ್ನು generate ಮಾಡುತ್ತದೆ.

ಉದಾಹರಣೆ code ಹೀಗಿದೆ:

```swift
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
```

ಈ code ಅನ್ನು ಕೆಲವು ಭಾಗಗಳಾಗಿ ವಿಭಜಿಸಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

ಮೊದಲು:

```swift
import SwiftUI
```

ಈ code line SwiftUI framework ಅನ್ನು import ಮಾಡುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.

SwiftUI import ಮಾಡಿದ ನಂತರ ಮಾತ್ರ ನಾವು `View`, `Text`, `Image`, `VStack`, `Button` ಮುಂತಾದ SwiftUI views ಅನ್ನು ಬಳಸಬಹುದು.

## ContentView structure

ಈ code line ಒಂದು structure ಅನ್ನು ರಚಿಸುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ:

```swift
struct ContentView: View
```

ಇದರಲ್ಲಿ:

```swift
struct ContentView
```

ಎಂದರೆ `ContentView` ಒಂದು structure ಆಗಿದೆ.

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ ನಾವು `struct` structure ಬಗ್ಗೆ ತಿಳಿದುಕೊಂಡಿದ್ದೇವೆ. ಅದು ವಿಭಿನ್ನ field structures ಅನ್ನು ಒಟ್ಟಿಗೆ ಸೇರಿಸಬಹುದು, ಮತ್ತು properties, methods ಅನ್ನು ಒಳಗೊಂಡಿರಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

ಈ example ನಲ್ಲಿ, `ContentView` ಒಳಗೆ ಮೂರು ವಿಷಯಗಳಿವೆ: `name`, `printName` ಮತ್ತು `body`.

ಅಂದರೆ, `struct` ಸಂಬಂಧಿತ properties, methods ಮತ್ತು view content ಅನ್ನು ಒಟ್ಟಿಗೆ ಸಂಘಟಿಸಬಹುದು.

![contentView](../../Resource/023_contentVIew.png)

## View ಒಂದು protocol

ಈ code line ಅನ್ನು ಮುಂದುವರಿಸಿ ನೋಡಿ:

```swift
struct ContentView: View 
```

colon ನಂತರ ಇರುವ `View` ಎಂದರೆ: `ContentView` `View` protocol ಅನ್ನು ಅನುಸರಿಸುತ್ತದೆ.

ಇದನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: `ContentView` ಒಂದು SwiftUI view ಆಗಬೇಕೆಂದರೆ, ಅದು `View` protocol ನ requirements ಅನ್ನು ಪೂರೈಸಬೇಕು.

### Identifiable protocol

ಹಿಂದೆ movie list ಕಲಿಯುವಾಗ, ನಾವು `Identifiable` protocol ಅನ್ನು ನೋಡಿದ್ದೇವೆ.

ಆ ಸಮಯದಲ್ಲಿ, `ForEach` ಒಳಗೆ `Movie` array ಅನ್ನು traverse ಮಾಡಬೇಕಾಗಿತ್ತು, ಆದರೆ `Movie` structure ಗೆ unique identifier ಇರಲಿಲ್ಲ, ಆದ್ದರಿಂದ ಅದು `ForEach` traversal ಅನ್ನು support ಮಾಡಲಿಲ್ಲ.

ಆ ಸಮಯದಲ್ಲಿ, `Movie` structure ಅನ್ನು `Identifiable` protocol ಅನುಸರಿಸುವಂತೆ ಮಾಡಬೇಕಾಯಿತು, ಇದರಿಂದ ಅದು `ForEach` ಗೆ ಬೇಕಾದ unique identifier requirement ಗೆ ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protocol ನ requirement: **ಈ type ತನ್ನನ್ನು identify ಮಾಡುವ ಒಂದು `id` field ಹೊಂದಿರಬೇಕು.**

`Movie` ಒಂದು `id` field ನೀಡಿದ ನಂತರ, ಅದು `Identifiable` requirement ಅನ್ನು ಪೂರೈಸಬಹುದು.

ಹೀಗಾಗಿ ನಾವು ಅದನ್ನು `ForEach` ನಲ್ಲಿ ಬಳಸಿದಾಗ, SwiftUI ಪ್ರತಿ data item ಅನ್ನು ಗುರುತಿಸಬಹುದು.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protocol

`View` protocol ಕೂಡ ಇದೇ ರೀತಿಯದು.

ಒಂದು type SwiftUI view ಆಗಬೇಕೆಂದರೆ, ಅದು `View` protocol ಅನ್ನು ಅನುಸರಿಸಬೇಕು.

ಮತ್ತು `View` protocol ನ ಅತ್ಯಂತ ಮುಖ್ಯ requirement ಎಂದರೆ ಒಂದು `body` provide ಮಾಡುವುದು.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

ಇದನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: `View` protocol ನ requirement: **`body` return ಮಾಡುವ SwiftUI view ಮಾತ್ರ ಸ್ವೀಕರಿಸಲಾಗುತ್ತದೆ, ಮತ್ತು `ContentView` `body` ಮೂಲಕ SwiftUI view ಅನ್ನು ತೋರಿಸುತ್ತದೆ.**

### View ಅನ್ನು ಅನುಸರಿಸದಿದ್ದರೆ ಏನಾಗುತ್ತದೆ?

ನಾವು ಹೀಗೆ ಬರೆದರೆ:

```swift
struct ContentView {
}
```

ಇದು ಕೇವಲ ordinary structure, SwiftUI view ಅಲ್ಲ.

ಇದು ನೇರವಾಗಿ error ನೀಡುವುದಿಲ್ಲ, ಏಕೆಂದರೆ ordinary structure ಸ್ವತಃ valid Swift code ಆಗಿದೆ.

ಆದರೆ ಅದನ್ನು preview ಒಳಗೆ ಇಟ್ಟರೆ:

```swift
#Preview {
    ContentView()
}
```

ಆ ಸಮಯದಲ್ಲಿ error ಬರುತ್ತದೆ.

ಕಾರಣ: **preview ಒಂದು SwiftUI view ಅನ್ನು display ಮಾಡಬೇಕು, ಆದರೆ ಈ `ContentView` `View` protocol ಅನ್ನು ಅನುಸರಿಸುತ್ತಿಲ್ಲ.**

ಆದ್ದರಿಂದ `ContentView` interface ಮೇಲೆ display ಆಗಬೇಕು ಎಂದರೆ, ಅದನ್ನು `View` protocol ಅನುಸರಿಸುವಂತೆ ಮಾಡಬೇಕು:

```swift
struct ContentView: View {
}
```

ಅದರ ಜೊತೆಗೆ, `View` protocol requirement ಪ್ರಕಾರ `body` provide ಮಾಡಬೇಕು. `body` ಇಲ್ಲದಿದ್ದರೆ compiler ಇನ್ನೂ error ನೀಡುತ್ತದೆ.

ಸರಿಯಾದ ಬರವಣಿಗೆ:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

ಈ ಸಮಯದಲ್ಲಿ, `ContentView` ನಿಜವಾಗಿ display ಮಾಡಬಹುದಾದ SwiftUI view ಆಗುತ್ತದೆ.

## body view display ನ entry point

SwiftUI ನಲ್ಲಿ, `body` view content ನ entry point ಆಗಿದೆ.

```swift
var body: some View {
    Text("Hello, world!")
}
```

ಇದನ್ನು ಮೂರು ಭಾಗಗಳಾಗಿ ವಿಭಜಿಸಬಹುದು:

**1. var body**

```swift
var body
```

ಇದು `body` ಎಂಬ variable ಅನ್ನು define ಮಾಡಲಾಗಿದೆ ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

**2. some View**

```swift
: some View
```

ಇದು ಈ `body` ಒಂದು view return ಮಾಡುತ್ತದೆ ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

ಇದು display ಆಗುವ view content. ಈ code ನಲ್ಲಿ ಒಂದು `Text` view display ಆಗುತ್ತದೆ.

ಅಂದರೆ, `body` ಒಳಗೆ ಏನು ಬರೆಯಲಾಗುತ್ತದೆ, interface ಮೇಲೆ ಅದೇ ಕಾಣಿಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

ಈ code ಹೇಳುವುದೇನಂದರೆ: **interface ಮೇಲೆ vertically arranged content display ಆಗುತ್ತದೆ, ಅದರೊಳಗೆ ಎರಡು texts ಇವೆ.**

### body ಹೆಸರನ್ನು ಮನಬಂದಂತೆ ಬದಲಾಯಿಸಲಾಗುವುದಿಲ್ಲ

ಗಮನಿಸಬೇಕಾದದ್ದು, `body` ಎಂಬ ಹೆಸರನ್ನು ಸುಲಭವಾಗಿ ಬದಲಾಯಿಸಲಾಗುವುದಿಲ್ಲ.

ಹೀಗೆ ಬರೆದರೆ:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

ಈ `content` ಕೂಡ ಒಂದು view property ಆಗಿದ್ದರೂ, ಅದು `body` ಅನ್ನು ಬದಲಾಯಿಸಲಾರದು.

ಏಕೆಂದರೆ `View` protocol ಬೇಡುವ ಹೆಸರು ನಿಖರವಾಗಿ `body` ಆಗಿದೆ.

## some View ಎಂದರೇನು?

SwiftUI ನಲ್ಲಿ, `some View` ಎಂದರೆ ಒಂದು concrete view return ಮಾಡುವುದು, ಆದರೆ ಆ view ನ ಪೂರ್ಣ type ಅನ್ನು ಬರೆಯುವ ಅಗತ್ಯವಿಲ್ಲ.

```swift
var body: some View
```

ಅಂದರೆ, `some View` ಎಂದರೆ type ಇಲ್ಲ ಎಂದಲ್ಲ. ನಿಜವಾದ type ಇನ್ನೂ ಇರುತ್ತದೆ, compiler ಆ type ಅನ್ನು ತಿಳಿದಿರುತ್ತದೆ, ಆದರೆ ಆ type ಬಹಳ complex ಆಗಿರಬಹುದು, ಆದ್ದರಿಂದ Swift `some View` ಬಳಸಿ ಅದನ್ನು hide ಮಾಡಲು ಅವಕಾಶ ಕೊಡುತ್ತದೆ.

### some ಎಂದರೇನು?

Swift ನಲ್ಲಿ, `some` opaque type declare ಮಾಡಲು ಬಳಸುವ keyword ಆಗಿದೆ.

Opaque type ಎಂದರೆ: **return value ಗೆ ಒಂದು concrete type ಇರುತ್ತದೆ, compiler ಆ concrete type ಏನು ಎಂದು ತಿಳಿದಿರುತ್ತದೆ, ಆದರೆ ನಾವು ಆ concrete type ಅನ್ನು ನೇರವಾಗಿ ಬರೆಯುವುದಿಲ್ಲ.**

ಉದಾಹರಣೆಗೆ:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

ಇದು `makeView` `View` protocol ಅನ್ನು ಅನುಸರಿಸುವ ಒಂದು concrete type return ಮಾಡುತ್ತದೆ ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

### some ಏಕೆ ಬೇಕು?

Variables ಕಲಿಯುವಾಗ, ನಾವು ತಿಳಿದುಕೊಂಡಿದ್ದೇವೆ: **Swift ನಲ್ಲಿ values ಗೆ explicit type annotation ಬೇಕಾಗಬಹುದು, ಅಥವಾ compiler ಸ್ವಯಂಚಾಲಿತವಾಗಿ type infer ಮಾಡುತ್ತದೆ.**

ಉದಾಹರಣೆಗೆ:

```swift
let a: Int = 10
```

ಇಲ್ಲಿ constant `a` ಯ type `Int`.

SwiftUI views ಕೂಡ ಇದಕ್ಕೆ ಹೊರತಾಗಿಲ್ಲ. ನಾವು `body` ಬಳಸಿ SwiftUI view display ಮಾಡುವಾಗ, `body` ಸಂಬಂಧಿತ SwiftUI type ಅನ್ನು return ಮಾಡಬೇಕು.

ಉದಾಹರಣೆಗೆ, ನಾವು `body` ಬಳಸಿ ಒಂದು `Text` text view display ಮಾಡಿದರೆ, `body` ಸಂಬಂಧಿತ `Text` type ಅನ್ನು return ಮಾಡಬೇಕು.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

ಈ example ನಲ್ಲಿ, `body` ಒಳಗೆ display ಆಗುತ್ತಿರುವುದು ಒಂದು `Text` view, ಮತ್ತು return type ಕೂಡ `Text`.

ಒಳಗಿನ type ಮತ್ತು declared type ಒಂದೇ ಆಗಿದ್ದಾಗ ಮಾತ್ರ compiler ನ type consistency requirement ಪೂರೈಸುತ್ತದೆ.

**Type mismatch ಸಮಸ್ಯೆ**

ನಾವು `body` type ಅನ್ನು `Color` ಆಗಿ set ಮಾಡಿ, ಆದರೆ display ಆಗುತ್ತಿರುವುದು `Text` ಆಗಿದ್ದರೆ:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` type ಮತ್ತು ಒಳಗಿನ code type ಒಂದಲ್ಲ, ಆದ್ದರಿಂದ type mismatch error trigger ಆಗುತ್ತದೆ.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

ಈ ಸಮಯದಲ್ಲಿ, ನಾವು `body` return type ಅನ್ನು ಕೈಯಾರೆ modify ಮಾಡಬೇಕು.

**Complex view types**

ನಿಜವಾದ development ನಲ್ಲಿ, interface ಸಾಮಾನ್ಯವಾಗಿ ಕೇವಲ ಒಂದು `Text` ಮಾತ್ರ ಹೊಂದಿರುವುದಿಲ್ಲ.

ಇನ್ನಷ್ಟು complex `VStack` display ಮಾಡಬೇಕಾದರೆ, ನಾವು complex return type ಅನ್ನು ಕೈಯಾರೆ annotate ಮಾಡಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

ಈ code ಒಂದು `VStack` return ಆಗುತ್ತದೆ, ಅದರೊಳಗೆ `Image` ಮತ್ತು `Text` type views ಇವೆ ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

`body` ನ return type:

```swift
VStack<TupleView<(Image,Text)>>
```

ನೋಡಬಹುದು, ಈ return type ಬಹಳ complex ಆಗಿದೆ, ಜೊತೆಗೆ ನಾವು ಮೊದಲು ನೋಡಿರದ `TupleView` ಕೂಡ ಬಂದಿದೆ.

ಇಲ್ಲಿ `TupleView` ಅನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: **ಹಲವು child views ಅನ್ನು ಒಂದು view ಆಗಿ wrap ಮಾಡುವುದು.**

**ಇನ್ನೂ complex view types**

ನಾವು view ಗೆ modifiers ಸೇರಿಸಿದರೆ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

ಆಗ ಈ view ನ return type ಬಹಳ complex ಆಗುತ್ತದೆ, ಅದನ್ನು ಇಲ್ಲಿ ಸ್ಪಷ್ಟವಾಗಿ ವಿವರಿಸಲಾಗುವುದಿಲ್ಲ.

ಇರುವ return type `VStack<TupleView<(Image,Text)>>` modifiers ಅನ್ನು ವಿವರಿಸಲಾರದು, ಇದರಿಂದ error ಉಂಟಾಗುತ್ತದೆ.

**some View return type ಅನ್ನು ಸರಳಗೊಳಿಸುತ್ತದೆ**

ಈ ಪರಿಸ್ಥಿತಿಗೆ SwiftUI ಒಂದು ಸರಳ solution ನೀಡುತ್ತದೆ, ಅದು `some View` ಬಳಸಿ ಬರವಣಿಗೆಯನ್ನು ಸರಳಗೊಳಿಸುವುದು.

ನಾವು `body` ಅನ್ನು `some View` type ಆಗಿ ಬದಲಿಸಿದಾಗ:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

ಪ್ರತಿ ಬಾರಿ view code ಬದಲಿಸಿದಾಗ, ಸಂಪೂರ್ಣ return type ಅನ್ನು ಮತ್ತೆ ಬರೆಯಬೇಕಾಗುವುದಿಲ್ಲ.

ಏಕೆಂದರೆ `some View` ಎಂದರೆ `View` protocol ಅನ್ನು ಅನುಸರಿಸುವ ಒಂದು concrete view return ಮಾಡುವುದು.

ಬೇರೆ ರೀತಿಯಲ್ಲಿ ಹೇಳುವುದಾದರೆ, `VStack`, `Image` ಮುಂತಾದ SwiftUI views ಎಲ್ಲವೂ `View` protocol ಅನ್ನು ಅನುಸರಿಸುತ್ತವೆ. Modifier ಸೇರಿಸಿದ ನಂತರ return ಆಗುವ view type ಕೂಡ `View` protocol ಅನ್ನು ಅನುಸರಿಸುತ್ತಲೇ ಇರುತ್ತದೆ.

ಆದ್ದರಿಂದ ಅವೆಲ್ಲವೂ `some View` ಆಗಿ return ಆಗಬಹುದು.

### some View ಯಾವುದೇ view ಅನ್ನು ಮನಬಂದಂತೆ return ಮಾಡಲಾರದು

`some View` complex types ಅನ್ನು hide ಮಾಡಬಹುದು, ಆದರೆ ಅದು "type ಇಲ್ಲ" ಎಂದಲ್ಲ.

ಅದರ core rule: **compiler ಒಂದು concrete return type ಅನ್ನು determine ಮಾಡಬಲ್ಲಿರಬೇಕು**.

ಉದಾಹರಣೆಗೆ:

```swift
var title: some View {
    Text("Hello")
}
```

ಇಲ್ಲಿ return ಆಗುತ್ತಿರುವುದು `Text` view.

ಆದರೆ ಎರಡು views return ಮಾಡಲು ಪ್ರಯತ್ನಿಸಿದರೆ, error ಆಗುತ್ತದೆ:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

ಏಕೆಂದರೆ `some View` ಕೊನೆಯಲ್ಲಿ ಒಂದು view structure return ಮಾಡಬೇಕು, ಆದರೆ ಇಲ್ಲಿ ಎರಡು independent views return ಮಾಡಲು ಪ್ರಯತ್ನಿಸಲಾಗಿದೆ.

### ಪರಿಹಾರ

ಪರಿಹಾರ ಸಾಮಾನ್ಯವಾಗಿ ಎರಡು: container ಮತ್ತು `@ViewBuilder`.

**1. container ಬಳಸಿ wrap ಮಾಡುವುದು**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

ಈ code ನಲ್ಲಿ, `title` ಒಂದು `VStack` return ಮಾಡುತ್ತದೆ, ಮತ್ತು `Text`, `Image` ಗಳು `VStack` ಒಳಗಿನ child views.

`some View` ಸ್ವೀಕರಿಸುವ view structure ಒಂದು `VStack<...>` ಆಗಿದೆ, ಹೀಗಾಗಿ ಅದು `some View` ಗೆ ಬೇಕಾದ ಒಂದು view structure return requirement ಅನ್ನು ಪೂರೈಸುತ್ತದೆ. 

ಇದಕ್ಕಾಗಿಯೇ SwiftUI ಕಲಿಯಲು ಪ್ರಾರಂಭಿಸಿದಾಗಿನಿಂದಲೇ ನಾವು ಹೊರಗಿನ layer ನಲ್ಲಿ `VStack` container ಬಳಸಿ view code wrap ಮಾಡಲು ಸಲಹೆ ನೀಡುತ್ತೇವೆ.

**2. @ViewBuilder ಬಳಸು**

ನಾವು `some View` ಮುಂದೆ `@ViewBuilder` modifier ಅನ್ನು ಕೂಡ ಸೇರಿಸಬಹುದು:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` ಹಲವು views ಅನ್ನು ಒಂದು return result ಆಗಿ combine ಮಾಡಬಹುದು.

ಅದರ ಮೂಲ ಅರ್ಥ ಇನ್ನೂ ಹಲವು views ಅನ್ನು ಒಂದು view ಆಗಿ merge ಮಾಡುವುದು, ಇದರಿಂದ `some View` ನ ಒಂದು view structure return requirement ಪೂರೈಸುತ್ತದೆ.

### body ಒಳಗೆ ಹಲವಾರು views ಅನ್ನು ನೇರವಾಗಿ ಏಕೆ ಬರೆಯಬಹುದು?

ನಾವು `var body` ಒಳಗೆ ಹಲವಾರು views ಬರೆದರೆ, ಉದಾಹರಣೆಗೆ:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

ಕೆಲವು ಸಂದರ್ಭಗಳಲ್ಲಿ, ಇಂತಹ `body` error ನೀಡುವುದಿಲ್ಲ.

ಕಾರಣವೆಂದರೆ, `View` protocol ಒಳಗಿನ `body` default ಆಗಿ `@ViewBuilder` support ಮಾಡುತ್ತದೆ:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protocol ನ source code ನಲ್ಲಿ, `@ViewBuilder` ಈಗಾಗಲೇ `body` variable ಅನ್ನು modify ಮಾಡಿರುವುದನ್ನು ನೋಡಬಹುದು.

ಆದ್ದರಿಂದ `body`, ordinary `some View` ಗಿಂತ ಒಂದು ಹೆಚ್ಚುವರಿ special handling ಹೊಂದಿದೆ, ಇದರಿಂದ SwiftUI ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಹಲವು views ಅನ್ನು ಒಂದು view ಆಗಿ combine ಮಾಡುತ್ತದೆ.

**Container ಬಳಕೆಯನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ**

Beginners ಗೆ ಸುಲಭವಾಗಿ ಅರ್ಥವಾಗಲು, ಹಲವು views ಸಂಘಟಿಸಲು ಮೊದಲು `VStack`, `HStack`, `ZStack`, `Group` ಮುಂತಾದ containers ಬಳಸಲು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

ಈ ರೀತಿ code ಇನ್ನಷ್ಟು intuitive ಆಗಿರುತ್ತದೆ: **ಹೊರಗಿನ layer ಒಂದು `VStack`, ಅದರೊಳಗೆ ಎರಡು child views ಇವೆ.**

## Views ಅನ್ನು ವಿಭಜಿಸುವುದು

Interface ಸರಳವಾಗಿದ್ದರೆ, ಎಲ್ಲ code ಅನ್ನು `body` ಒಳಗೆ ಬರೆಯಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote ಗೆ ಸ್ವಾಗತ")
                Text("ಶುಭೋದಯ")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("ನನ್ನನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ") {
                print("ನನ್ನನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

ಈ view ನ display style:

![view](../../Resource/023_view1.png)

ಈ code ಸರಿಯಾಗಿ run ಆಗಬಹುದು, ಆದರೆ view code ತುಂಬಾ complex ಆಗಿದ್ದರೆ, `body` ಒಳಗಿನ code ಹೆಚ್ಚು ಹೆಚ್ಚು ಉದ್ದವಾಗುತ್ತದೆ, ಓದಲು ಮತ್ತು modify ಮಾಡಲು ಕಷ್ಟ ಹೆಚ್ಚಾಗುತ್ತಲೇ ಹೋಗುತ್ತದೆ.

ಈ ಸಮಯದಲ್ಲಿ, ವಿವಿಧ areas ಅನ್ನು independent view properties ಆಗಿ ವಿಭಜಿಸಬಹುದು.

### ಮೇಲಿನ view ಅನ್ನು ವಿಭಜಿಸುವುದು

ಉದಾಹರಣೆಗೆ, ಮೇಲಿನ area ಅನ್ನು ಬೇರ್ಪಡಿಸಿ:

```swift
var topHome: some View {
    HStack {
        Text("ಮುಖಪುಟ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

ಇಲ್ಲಿ `topHome` ಒಂದು variable, ಅದು ಒಂದು view return ಮಾಡುತ್ತದೆ.

Return ಆಗುತ್ತಿರುವುದು view ಆದ್ದರಿಂದ, type ಅನ್ನು ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
some View
```

ಇದು ವಾಸ್ತವವಾಗಿ `body` ಯಂತೆಯೇ usage:

```swift
var topHome: some View { }
var body: some View { }
```

ಎರಡೂ variable ಬಳಸಿ view display ಮಾಡುತ್ತವೆ, return type `some View`.

### ಬೇರೆ views ಅನ್ನು ವಿಭಜಿಸುವುದು

ನಂತರ, ಬೇರೆ ಭಾಗಗಳನ್ನು ಮುಂದುವರಿಸಿ ವಿಭಜಿಸಿ:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote ಗೆ ಸ್ವಾಗತ")
        Text("ಶುಭೋದಯ")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("ನನ್ನನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ") {
        print("ನನ್ನನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ")
    }
    .buttonStyle(.borderedProminent)
}
```

ವಿಭಜಿಸಿದ ನಂತರ, view variables ಅನ್ನು `body` ಒಳಗೆ ಇಡಬಹುದು:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("ಮುಖಪುಟ")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote ಗೆ ಸ್ವಾಗತ")
            Text("ಶುಭೋದಯ")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("ನನ್ನನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ") {
            print("ನನ್ನನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

ಈಗ `body` page structure ಅನ್ನು ವಿವರಿಸುವುದಕ್ಕೆ ಮಾತ್ರ responsible:

```swift
topBar
welcomeText
colorList
clickButton
```

ಪ್ರತಿ ಭಾಗದ concrete implementation ಕೆಳಗಿನ corresponding property ಒಳಗೆ ಇಡಲಾಗಿದೆ.

ಈ ರೀತಿಯಲ್ಲಿ view ಅನ್ನು ವಿಭಜಿಸುವುದು page structure ಅನ್ನು ಇನ್ನಷ್ಟು clear ಮಾಡುತ್ತದೆ, ಪ್ರತಿ view area ಗೆ ತನ್ನದೇ ಹೆಸರು ಇರುತ್ತದೆ, ಓದಲು ಹೆಚ್ಚು intuitive ಆಗುತ್ತದೆ.

ಒಂದು ಭಾಗದ code ಅನ್ನು modify ಮಾಡುವಾಗ, complex code ಗೂಡಿನಲ್ಲಿ ಹುಡುಕುವುದಕ್ಕಿಂತ corresponding view area ಅನ್ನು ನೇರವಾಗಿ ಕಂಡುಹಿಡಿಯಬಹುದು.

### some View ಒಂದೇ view return ಮಾಡುತ್ತದೆ

ಈ ವಿಭಜಿಸಿದ view ನಲ್ಲಿ, ನಾವು ಹಲವಾರು views return ಮಾಡಲು ಪ್ರಯತ್ನಿಸಿದರೆ:

```swift
var topBar: some View {
    Text("ಮುಖಪುಟ")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` ಒಂದೇ view structure return ಮಾಡಬಲ್ಲದು, ಆದ್ದರಿಂದ error ಉಂಟಾಗುತ್ತದೆ.

`body` ಗೆ ಭಿನ್ನವಾಗಿ, ordinary computed property ಗೆ default ಆಗಿ `@ViewBuilder` ಇರುವುದಿಲ್ಲ.

ಆದ್ದರಿಂದ ಹಲವಾರು views return ಮಾಡಬೇಕಾದರೆ, `VStack`, `HStack` ಅಥವಾ `Group` container ಬಳಸಿ ಹಲವು views ಅನ್ನು ಒಂದಾಗಿ combine ಮಾಡಬಹುದು.

```swift
var topBar: some View {
    VStack {
        Text("ಮುಖಪುಟ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

ಅಥವಾ views combine ಮಾಡಲು `@ViewBuilder` ಸೇರಿಸಬಹುದು:

```swift
@ViewBuilder
var topBar: some View {
    Text("ಮುಖಪುಟ")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

ಈ ರೀತಿ, ನಾವು ಹಲವಾರು views return ಮಾಡಬಹುದು.

### if ಹಲವಾರು views return ಮಾಡುವುದು

ಉದಾಹರಣೆಗೆ:

```swift
var topHome: some View {
    if step == "ಮುಖಪುಟ" {
        HStack {
            Text("ಮುಖಪುಟ")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("ಇಲ್ಲ")
    }
}
```

ಈ code ನಲ್ಲಿ, `topHome` `step` ನ content ಆಧರಿಸಿ, `HStack` ಅಥವಾ `Text` ಎಂಬ ಎರಡು different type views return ಮಾಡುತ್ತದೆ.

`some View` ಗೆ ಒಂದು determined concrete return type ಬೇಕಾಗಿರುವುದರಿಂದ, ordinary computed property ಒಳಗಿನ `if` ನ ಎರಡು branches ನೇರವಾಗಿ different type views return ಮಾಡಲಾರವು, ಆದ್ದರಿಂದ error ಉಂಟಾಗುತ್ತದೆ.

**Solution ಇನ್ನೂ container ಬಳಸಿ wrap ಮಾಡುವುದು, ಅಥವಾ `@ViewBuilder` modifier ಬಳಸುವುದು.**

### ವಿಭಜಿಸಿದ view ಗೆ parentheses ಏಕೆ ಬಳಸುವುದಿಲ್ಲ

`body` ಒಳಗೆ ವಿಭಜಿಸಿದ view properties ಬಳಸುವಾಗ, ನಾವು ನೇರವಾಗಿ ಬರೆಯುತ್ತೇವೆ:

```swift
topBar
welcomeText
colorList
clickButton
```

ಹೀಗೆ ಬರೆಯುವುದಿಲ್ಲ:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

ಏಕೆಂದರೆ `topBar`, `welcomeText`, `colorList`, `clickButton` variables. ಈ variables ವಾಸ್ತವವಾಗಿ computed properties, methods ಅಲ್ಲ.

**Properties ಗೆ parentheses ಅಗತ್ಯವಿಲ್ಲ.**

ನಾವು method ಆಗಿ ಬರೆದರೆ, ಸಮಾನ effect ಪಡೆಯಬಹುದು:

```swift
func topBar() -> some View {
    HStack {
        Text("ಮುಖಪುಟ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

ಈ code ಕೂಡ ಸಮಾನ effect ಸಾಧಿಸಬಹುದು. ಈ method ಅನ್ನು call ಮಾಡಿದರೆ ಒಂದು view return ಆಗುತ್ತದೆ.

ಬಳಸುವಾಗ ಹೀಗೆ ಬರೆಯಬೇಕು:

```swift
topBar()
```

SwiftUI ನಲ್ಲಿ, parameter pass ಮಾಡಬೇಕಿಲ್ಲದ view ಅನ್ನು ಮಾತ್ರ ವಿಭಜಿಸುತ್ತಿದ್ದರೆ, computed property ವಿಧಾನ ಹೆಚ್ಚು common.

```swift
var topBar: some View { ... }
```

## Nested views

Code ಅನ್ನು properties ಆಗಿ ವಿಭಜಿಸುವುದರ ಜೊತೆಗೆ, ನಾವು ಹೊಸ view structures ಕೂಡ ರಚಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

ಈ `PinkColorView`, `ContentView` ತರಹ, ಒಂದು independent SwiftUI view ಆಗಿದೆ.

ಅದನ್ನು `ContentView` ಒಳಗೆ display ಮಾಡಬೇಕಾದರೆ, view name ನಂತರ `()` ಸೇರಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

ಇಲ್ಲಿನ:

```swift
PinkColorView()
```

ಎಂದರೆ ಒಂದು `PinkColorView` instance ಅನ್ನು ರಚಿಸುವುದು.

`PinkColorView` `View` protocol ಅನ್ನು ಅನುಸರಿಸಿರುವುದರಿಂದ, ಅದು `Text`, `Image`, `Button` ಹಾಗೆಯೇ ಬೇರೆ views ಒಳಗೆ ಇಟ್ಟು display ಮಾಡಬಹುದು.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

ಇದೇ view nesting: ಒಂದು view ಇನ್ನೊಂದು view ಒಳಗೆ display ಆಗಬಹುದು.

## View property ಅಥವಾ ಹೊಸ view ರಚಿಸುವುದೇ?

View code ಸರಳವಾಗಿದ್ದರೆ, ಸಾಮಾನ್ಯವಾಗಿ code ವಿಭಜಿಸುವ ಅಗತ್ಯವಿಲ್ಲ. Code complex ಆಗಿದ್ದಾಗ ಮಾತ್ರ view ವಿಭಜಿಸುವುದನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ.

### View property ಬಳಸುವ ಸಂದರ್ಭ

ಇದು current view ಒಳಗಿನ ಒಂದು ಸಣ್ಣ content block ಮಾತ್ರವಾಗಿದ್ದರೆ, view property ಬಳಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

ಈ contents ಸಾಮಾನ್ಯವಾಗಿ current view ಒಳಗೆ ಮಾತ್ರ ಬಳಸಲಾಗುತ್ತದೆ.

### ಹೊಸ view ರಚಿಸುವ ಸಂದರ್ಭ

ಈ contents ಸ್ವಲ್ಪ independent ಆಗಿದ್ದರೆ, ಅಥವಾ ಮುಂದೆ ಹಲವು pages ನಲ್ಲಿ reuse ಆಗಬಹುದು ಎಂದರೆ, ಹೊಸ view ರಚಿಸುವುದು ಹೆಚ್ಚು suitable.

ಉದಾಹರಣೆಗೆ:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

ಇದು ಒಂದು title view. ಈ view ಅನ್ನು common component ಆಗಿ ಬೇರೆ views ನಲ್ಲಿ reuse ಮಾಡಲು ಬಯಸಿದರೆ.

ನಾವು ಹೊಸ view ರಚಿಸಬಹುದು:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

ನಂತರ ಬೇರೆಡೆ ಬಳಸಿ:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

ಈ ಸಮಯದಲ್ಲಿ, ಈ view ಒಂದು reusable independent component ಆಗಿದೆ.

ಸರಳವಾಗಿ ಹೀಗೆ summary ಮಾಡಬಹುದು:

- current view ನ content area: `var xxx: some View` ಬಳಸಬಹುದು
- reusable independent component: ಹೊಸ `struct XxxView: View` ರಚಿಸಬಹುದು
- data pass ಮಾಡಬೇಕಾದ component: ಸಾಮಾನ್ಯವಾಗಿ ಹೊಸ view ರಚಿಸುವುದು ಹೆಚ್ಚು suitable.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, SwiftUI ಯಲ್ಲಿನ ಅತ್ಯಂತ basic ಆದರೆ ಅತ್ಯಂತ important view structure ಅನ್ನು ಮತ್ತೆ ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದೇವೆ.

`ContentView` ಒಂದು structure. ಅದು `struct` ಬಳಸಿ define ಮಾಡಲಾಗುತ್ತದೆ, ಮತ್ತು page-related code ಅನ್ನು organize ಮಾಡಲು ಬಳಸಲಾಗುತ್ತದೆ.

`View` ಒಂದು protocol. ಒಂದು structure SwiftUI view ಆಗಬೇಕೆಂದರೆ, ಅದು `View` protocol ಅನ್ನು ಅನುಸರಿಸಬೇಕು.

`body` ಎಂದರೆ `View` protocol ನಮಗೆ provide ಮಾಡಲು ಹೇಳುವ content. ಈ view ಯಾವ content display ಮಾಡುತ್ತದೆ ಎಂಬುದನ್ನು ಅದು ನಿರ್ಧರಿಸುತ್ತದೆ.

`some View` ಎಂದರೆ ಒಂದು concrete view return ಮಾಡುವುದು, ಅದರ complex full type ಅನ್ನು ಬರೆಯುವ ಅಗತ್ಯವಿಲ್ಲ.

View code ಉದ್ದವಾಗುವಾಗ, `var xxx: some View` ಬಳಸಿ view code ಅನ್ನು ಹಲವು small areas ಆಗಿ ವಿಭಜಿಸಬಹುದು.

ಒಂದು content block ಸ್ವಲ್ಪ independent ಆಗಿದ್ದರೆ, ಅಥವಾ reuse ಬೇಕಾದರೆ, ನಾವು ಹೊಸ view structure ರಚಿಸಿ, ಅದನ್ನು ಬೇರೆ views ನಲ್ಲಿ `XxxView()` ಮೂಲಕ display ಮಾಡಬಹುದು.

ಸರಳವಾಗಿ ಹೇಳುವುದಾದರೆ, SwiftUI interface ಒಂದೊಂದೇ view ಗಳನ್ನು combine ಮಾಡುವ ಮೂಲಕ ರೂಪುಗೊಳ್ಳುತ್ತದೆ. ಒಂದು page ಹಲವು small views ಹೊಂದಿರಬಹುದು, ಮತ್ತು ಒಂದು small view ಮತ್ತಷ್ಟು views ಅನ್ನು contain ಮಾಡಬಹುದು.
