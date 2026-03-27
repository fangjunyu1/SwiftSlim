# ContentView ಇಂದ ಪ್ರಾರಂಭಿಸೋಣ

## ಪಾಠಕ್ಕೂ ಮುನ್ನದ ಸಿದ್ಧತೆ

ಈ ಪಾಠದಲ್ಲಿ ನಾವು `ContentView.swift` ಫೈಲ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ SwiftUI ಯ ಮೂಲಭೂತ ರಚನೆಯನ್ನು ವ್ಯವಸ್ಥಿತವಾಗಿ ತಿಳಿದುಕೊಳ್ಳುತ್ತೇವೆ. ಇದರಲ್ಲಿ ಇವು ಸೇರಿವೆ:

- ಕಾಮೆಂಟ್‌ಗಳು
- View ರಚನೆ
- VStack / HStack / ZStack layout
- SF Symbols ಐಕಾನ್‌ಗಳು
- view modifiers
- `#Preview` ಪೂರ್ವವೀಕ್ಷಣಾ ಕೋಡ್

ಮೊದಲು, ನೀವು ಹಿಂದೆ ರಚಿಸಿದ Xcode ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಹುಡುಕಿ, `.xcodeproj` ಫೈಲ್ ಅನ್ನು ಡಬಲ್ ಕ್ಲಿಕ್ ಮಾಡಿ.

ನಂತರ ಎಡಭಾಗದ Navigator ಪ್ರದೇಶದಲ್ಲಿ `ContentView.swift` ಫೈಲ್ ಆಯ್ಕೆ ಮಾಡಿ.

ಗಮನಿಸಿ: ಪ್ರತಿ ಸಲ ಪ್ರಾಜೆಕ್ಟ್ ತೆರೆಯುವಾಗ Canvas ನಲ್ಲಿ `"Preview paused"` ಕಾಣಿಸಬಹುದು. Refresh ಬಟನ್ ಒತ್ತಿದರೆ preview ಮರುಸ್ಥಾಪನೆ ಆಗುತ್ತದೆ.

![Swift](../../RESOURCE/002_view7.png)

## ContentView ಪರಿಚಯ

ContentView ಕೋಡ್:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

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

ಕೋಡ್ ಹೆಚ್ಚು ಇಲ್ಲದಿದ್ದರೂ, ಇದರಲ್ಲಿ SwiftUI ಯ ಮುಖ್ಯ ರಚನೆಗಳು ಒಳಗೊಂಡಿವೆ.

### 1. ಕಾಮೆಂಟ್‌ಗಳು

ಫೈಲ್‌ನ ಮೇಲ್ಭಾಗ:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

ಇವು ಫೈಲ್ ಕಾಮೆಂಟ್‌ಗಳು. ಫೈಲ್ ಹೆಸರು, ಪ್ರಾಜೆಕ್ಟ್ ಹೆಸರು, ರಚಿಸಿದ ವ್ಯಕ್ತಿ ಮತ್ತು ರಚಿಸಿದ ಸಮಯ ಇತ್ಯಾದಿ ಮಾಹಿತಿಯನ್ನು ದಾಖಲಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

Swift ನಲ್ಲಿ ಒಂದೇ ಸಾಲಿನ ಕಾಮೆಂಟ್ ಬರೆಯಲು `//` ಬಳಸಲಾಗುತ್ತದೆ:

```swift
// ಇದು ಒಂದು ಕಾಮೆಂಟ್
```

ಕಾಮೆಂಟ್‌ಗಳು ಕೋಡ್ ಓದಿಕೊಳ್ಳಲು ಸುಲಭವಾಗುವಂತೆ ಮಾಡುತ್ತವೆ ಮತ್ತು ಡೆವಲಪರ್‌ಗೆ ಕೋಡ್‌ನ ಲಾಜಿಕ್ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸಹಾಯ ಮಾಡುತ್ತವೆ.

ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಕೋಡ್ ಕೆಲವೊಮ್ಮೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಕಷ್ಟವಾಗಬಹುದು. ಕಾಮೆಂಟ್‌ಗಳನ್ನು ಬರೆಯದಿದ್ದರೆ, ಮೂರು ದಿನಗಳ ಬಳಿಕ ನಿಮ್ಮದೇ ಕೋಡ್ ನಿಮಗೆ ಅರ್ಥವಾಗದ ಸ್ಥಿತಿ ಬರಬಹುದು.

ಆದ್ದರಿಂದ, ಕೋಡ್ ಬರೆಯುವಾಗ ಸಕ್ರಿಯವಾಗಿ ಕಾಮೆಂಟ್ ಸೇರಿಸುವುದು ಒಳ್ಳೆಯ ಅಭ್ಯಾಸ. ಕಾಮೆಂಟ್‌ಗಳ ಮೂಲಕ ಲಾಜಿಕ್ ದಾಖಲಿಸಿದರೆ, ನಂತರ maintenance ಮಾಡಲು ಸುಲಭವಾಗುತ್ತದೆ.

**ಕೋಡ್ ಅನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುವುದು**

ಕಾಮೆಂಟ್‌ಗಳ ಇನ್ನೊಂದು ಬಳಕೆ ಎಂದರೆ, ಸಮಸ್ಯೆ ಹುಡುಕಲು ಕೋಡ್ ಅನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುವುದು.

ಉದಾಹರಣೆಗೆ:

```
A
B
C
```

A, B, C ಮೂರು ಭಾಗಗಳ ಕೋಡ್. ಅವುಗಳಲ್ಲಿ ಒಂದು ಭಾಗದಲ್ಲಿ ದೋಷ ಇದೆ ಎಂದು ಕಲ್ಪಿಸೋಣ. ಅದನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಕಾಮೆಂಟ್ ಮಾಡಿ ಪರೀಕ್ಷಿಸಬಹುದು.

ಮೊದಲು A ಗೆ ಕಾಮೆಂಟ್ ಹಾಕಿ:

```
// A
B
C
```

A ಕಾಮೆಂಟ್ ಮಾಡಿದ ನಂತರ ಕೋಡ್ ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡಿದರೆ, ಸಮಸ್ಯೆ A ಯಲ್ಲಿದೆ ಎಂದು ಅರ್ಥ.

A ಕಾಮೆಂಟ್ ಮಾಡಿದರೂ ಸಮಸ್ಯೆ ಮುಂದುವರಿದರೆ, ನಂತರ B ಯನ್ನು ಕಾಮೆಂಟ್ ಮಾಡಿ ಪರೀಕ್ಷಿಸಬಹುದು. ಹೀಗೆ ಕ್ರಮವಾಗಿ ಮುಂದುವರಿಸಿದರೆ ಸಮಸ್ಯೆಯ ಕೋಡ್ ಪತ್ತೆಯಾಗುತ್ತದೆ.

ಅಭಿವೃದ್ಧಿಯ ಸಮಯದಲ್ಲಿ ಹಲವು ಸಮಸ್ಯೆಗಳು ಬರುತ್ತವೆ. ಅವುಗಳ ಕಾರಣ ಹುಡುಕಲು ನಾವು ಹೆಚ್ಚುಕಡಿಮೆ ಕಾಮೆಂಟ್‌ಗಳನ್ನೇ ಬಳಸುತ್ತೇವೆ. ಇದು ಸಮಸ್ಯೆಯಿರುವ ಕೋಡ್ ಅನ್ನು ಕಂಡುಹಿಡಿದು BUG ಪತ್ತೆಹಚ್ಚಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.

Xcode ನಲ್ಲಿ ನೀವು ಈ shortcut ಬಳಸಿ:

```
Command ⌘ + /
```

ಕಾಮೆಂಟ್ ಅನ್ನು ವೇಗವಾಗಿ ಸೇರಿಸಬಹುದು ಅಥವಾ ತೆಗೆದುಹಾಕಬಹುದು.

### 2. SwiftUI framework import ಮಾಡುವುದು

```swift
import SwiftUI
```

ಈ ಕೋಡ್ SwiftUI framework ಅನ್ನು import ಮಾಡುತ್ತಿರುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.

SwiftUI ಯಲ್ಲಿರುವ `View`, `Text`, `Image`, `VStack` ಮುಂತಾದ type‌ಗಳು ಎಲ್ಲವೂ ಇದೇ framework‌ನಿಂದ ಬರುತ್ತವೆ.

SwiftUI framework import ಮಾಡದಿದ್ದರೆ, Xcode ಈ ದೋಷವನ್ನು ತೋರಿಸುತ್ತದೆ:

```
Cannot find type 'View' in scope
```

ಇದರಿಂದ compiler ಗೆ `View` type ಗುರುತಿಸಲು ಆಗುತ್ತಿಲ್ಲ ಎಂಬುದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

### 3. View ರಚನೆ

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ಮೊದಲ ಬಾರಿಗೆ ಈ View ರಚನೆ ನೋಡಿದಾಗ ಸ್ವಲ್ಪ ಅಪರಿಚಿತವಾಗಿ ಅನಿಸಬಹುದು, ಏಕೆಂದರೆ ಇದರಲ್ಲಿ `struct`, `View`, `var`, `body`, `some` ಮುಂತಾದ ಕೀವರ್ಡ್‌ಗಳು ಇವೆ.

ನಾವು ಇವನ್ನು ಇನ್ನೂ ವಿವರವಾಗಿ ಕಲಿತಿಲ್ಲ. ಈಗ ತಿಳಿದುಕೊಳ್ಳಬೇಕಾದ ಅರ್ಥವೆಂದರೆ: ಈ ಕೋಡ್ `ContentView` ಎಂಬ ಹೆಸರಿನ ಒಂದು View ಅನ್ನು ರಚಿಸಿದೆ.

ನೀವು View ಅನ್ನು ಒಂದು drawing board ಎಂದುಕೊಳ್ಳಬಹುದು, ಮತ್ತು ಅದರ ಮೇಲೆ ಚಿತ್ರ ಬಿಡಿಸುವ ಸಾಧನವೇ SwiftUI.

ಉದಾಹರಣೆಗೆ:

![Swift](../../RESOURCE/002_view.png)

ಮೇಲಿನ ಚಿತ್ರದಲ್ಲಿ ಮೂರು ಪುಟಗಳು ಕಾಣಿಸುತ್ತವೆ, ವಾಸ್ತವವಾಗಿ ಅವು ಮೂರು ಬೇರೆ ಬೇರೆ View‌ಗಳು.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

ನಾವು SwiftUI ಬಳಸಿ App ಅಭಿವೃದ್ಧಿಪಡಿಸಿದಾಗ, ಪ್ರತಿಯೊಂದು ಪುಟವೂ ಒಂದು View ಆಗಿರುತ್ತದೆ.

### 4. SwiftUI ಕೋಡ್

View ಒಳಗೆ ಕಾಣಿಸುವ SwiftUI ಕೋಡ್:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ಈ SwiftUI ಕೋಡ್ ಎಂದರೆ: ಇದು ಒಂದು vertical layout ಆಗಿದ್ದು, ಒಂದು ಐಕಾನ್ ಮತ್ತು ಒಂದು ಪಠ್ಯವನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ.

![Swift](../../RESOURCE/002_view1.png)

#### VStack layout

```swift
VStack { }  // vertical layout
```

`VStack` ಒಂದು vertical layout container. ಇದರೊಳಗಿನ view‌ಗಳು ಮೇಲಿಂದ ಕೆಳಗೆ ಕ್ರಮವಾಗಿ ವ್ಯವಸ್ಥೆಯಾಗುತ್ತವೆ.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI ಯಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಕಾಣುವ ಮೂರು layout‌ಗಳು:

- `VStack` —— vertical ترتيب
- `HStack` —— horizontal ترتيب
- `ZStack` —— overlay ترتيب (Z-axis)

```swift
HStack { }  // horizontal ترتيب
ZStack { }  // overlay ترتيب
```

ಈ layout‌ಗಳ ಕ್ರಮದ ಚಿತ್ರ:

![Swift](../../RESOURCE/002_view2.png)

ಉದಾಹರಣೆಗೆ `HStack` ಬಳಸಿ horizontal ترتيب ಮಾಡುವುದು:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ಇದರಿಂದ ಭೂಗೋಳ ಐಕಾನ್ ಮತ್ತು ಪಠ್ಯವು ಅಡ್ಡವಾಗಿ ಕಾಣುತ್ತವೆ.

![Swift](../../RESOURCE/002_view3.png)

ನಮಗೆ horizontal ترتیب ಬೇಕಾದಾಗ `HStack` ಬಳಸಬಹುದು. Overlay ರೀತಿಯ ترتیب ಬೇಕಾದಾಗ `ZStack` ಬಳಸಿ.

#### Image ಮತ್ತು SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ಈ ಕೋಡ್ ಒಂದು ಭೂಗೋಳ ಐಕಾನ್ ಅನ್ನು ತೋರಿಸುತ್ತದೆ. ಈ ಐಕಾನ್ Apple ನ SF Symbols icon system ನಿಂದ ಬರುತ್ತದೆ.

![Swift](../../RESOURCE/002_view9.png)

ಈ ಕೋಡ್‌ನ ಅರ್ಥ: ಒಂದು ದೊಡ್ಡ ಗಾತ್ರದ ಭೂಗೋಳ ಐಕಾನ್ ಅನ್ನು accent color ನಲ್ಲಿ ತೋರಿಸುವುದು.

ನಾವು ಭೂಗೋಳ ಐಕಾನ್ ಮಾತ್ರವಲ್ಲ, ಬೇರೆ ಐಕಾನ್‌ಗಳನ್ನೂ ತೋರಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ, ಒಂದು backpack ತೋರಿಸಲು:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**ಇನ್ನಷ್ಟು ಐಕಾನ್‌ಗಳನ್ನು ಹೇಗೆ ತೋರಿಸಬೇಕು?**

ಅದಕ್ಕಾಗಿ Apple ಅಧಿಕೃತವಾಗಿ ಒದಗಿಸುವ system icon library ಆದ SF Symbols ಬಳಸಬೇಕು.

Apple Developer ಅಧಿಕೃತ ವೆಬ್‌ಸೈಟ್ ತೆರೆಯಿರಿ ಮತ್ತು [SF Symbols](https://developer.apple.com/sf-symbols/) ಅನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ.

![Swift](../../RESOURCE/002_sf.png)

ನಂತರ SF Symbols App ತೆರೆಯಿರಿ.

![Swift](../../RESOURCE/002_sf1.png)

ಎಡಭಾಗದಲ್ಲಿ symbol categories ಮತ್ತು ಬಲಭಾಗದಲ್ಲಿ ಸಂಬಂಧಿತ ಐಕಾನ್‌ಗಳು ಕಾಣುತ್ತವೆ.

ಐಕಾನ್ ಮೇಲೆ right-click ಮಾಡಿ `"Copy 1 Name"` ಆಯ್ಕೆಮಾಡಿ; ಅಂದಾಗ ಅದರ ಹೆಸರು string ರೂಪದಲ್ಲಿ ಕಾಪಿ ಆಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```
"globe"
"backpack"
"heart"
```

ಕಾಪಿ ಮಾಡಿದ ಐಕಾನ್ ಹೆಸರನ್ನು `Image(systemName:)` ಒಳಗೆ ಹಾಕಿದರೆ, ವಿಭಿನ್ನ ಐಕಾನ್‌ಗಳನ್ನು ತೋರಿಸಬಹುದು.

ಗಮನಿಸಿ: ಪ್ರತಿಯೊಂದು SF Symbols ಐಕಾನ್‌ಗೂ ಕನಿಷ್ಠ ಬೆಂಬಲಿತ ಸಿಸ್ಟಮ್ ಆವೃತ್ತಿ ಇರುತ್ತದೆ. ಸಿಸ್ಟಮ್ ಆವೃತ್ತಿ ತುಂಬಾ ಹಳೆಯದಾದರೆ, ಐಕಾನ್ ತೋರಿಸದಿರಬಹುದು. ಅದರ compatibility ಮಾಹಿತಿಯನ್ನು SF Symbols App ನಲ್ಲಿ ನೋಡಬಹುದು.

#### Modifiers

SwiftUI ಯಲ್ಲಿ modifier ಎನ್ನುವುದು view‌ನ ರೂಪ ಅಥವಾ ವರ್ತನೆಯನ್ನು ಬದಲಾಯಿಸಲು ಬಳಸುವ ವಿಧಾನ.

Modifier ಅನ್ನು ಬಟ್ಟೆಯಂತೆ ಊಹಿಸಬಹುದು: ಬೇರೆ ಬೇರೆ ಬಟ್ಟೆ ತೊಟ್ಟಂತೆ ರೂಪವೂ ಬದಲಾಗುತ್ತದೆ.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ಇಲ್ಲಿ `imageScale` ಮತ್ತು `foregroundStyle` ಅನ್ನುವವು `Image` view ಗೆ ಸೇರಿದ modifiers. ಇವು `Image` ನ ಒಳಗಿನ ವಿಷಯವನ್ನು ಬದಲಿಸದೆ, ಅದರ ಹೊರಗಿನ ರೂಪವನ್ನು ಬದಲಿಸುತ್ತವೆ.

**1. imageScale**

```swift
.imageScale(.large)
```

ಇದು SF Symbols ಐಕಾನ್‌ನ ಗಾತ್ರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

ವಿವಿಧ ಆಯ್ಕೆಗಳನ್ನು ಬಳಸಿಕೊಂಡು SF Symbols ಐಕಾನ್ ಗಾತ್ರ ಹೇಗೆ ಬದಲಾಗುತ್ತದೆ ಎಂಬುದನ್ನು ನೋಡಬಹುದು.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` ಮುಂಭಾಗದ ಬಣ್ಣವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.

`.tint` ಅಂದರೆ ಪ್ರಸ್ತುತ ಪರಿಸರದ accent color. ಡೀಫಾಲ್ಟ್ ಆಗಿ iOS ನಲ್ಲಿ ಅದು ನೀಲಿ ಬಣ್ಣವಾಗಿರುತ್ತದೆ.

ನಾವು ಮುಂಭಾಗದ ಬಣ್ಣವನ್ನು ಕೆಂಪಾಗಿಸಬೇಕೆಂದರೆ:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text view

`Text` ಎನ್ನುವುದು ಪಠ್ಯ view ಆಗಿದ್ದು, string ಅನ್ನು ತೋರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

```swift
Text("Hello, world!")
```

ಉದಾಹರಣೆಗೆ, ನನ್ನ ಹೆಸರನ್ನು ತೋರಿಸಲು:

```swift
Text("FangJunyu")
```

ಗಮನಿಸಿ: string ಅನ್ನು ತಪ್ಪದೇ `""` ಡಬಲ್ ಕ್ವೋಟ್ ಒಳಗೆ ಬರೆಯಬೇಕು.

ನೀವು ನಿಮ್ಮ ಹೆಸರು, ಫೋನ್ ಸಂಖ್ಯೆ ಅಥವಾ ಇತರ ಪಠ್ಯವನ್ನು ತೋರಿಸಿ ನೋಡಬಹುದು.

#### padding ಅಂತರ

SwiftUI ಯಲ್ಲಿ `padding` view ಯ ಒಳಗಿನ ವಿಷಯ ಮತ್ತು ಅದರ ಗಡಿಯ ನಡುವೆ ಖಾಲಿ ಜಾಗವನ್ನು ಸೇರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಇದನ್ನು “inner spacing (padding / content inset)” ಎಂದು ಪರಿಗಣಿಸಬಹುದು.

```swift
HStack {
    ...
}
.padding()
```

ಈ ಕೋಡ್ `HStack` view ಗೆ ಸಿಸ್ಟಮ್ ಡೀಫಾಲ್ಟ್ padding ಸೇರಿಸುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.

**padding ಎಂದರೆ ಏನು?**

`padding` ಅಂದರೆ “view ಒಳಗಿನ ವಿಷಯ ಮತ್ತು ಅದರ ಗಡಿ ನಡುವಿನ ಖಾಲಿ ಜಾಗ”.

ಕೆಳಗಿನ ಚಿತ್ರದಲ್ಲಿ ನೀಲಿ ಬಣ್ಣದ `HStack` ಗೆ padding ನೀಡಿದ ನಂತರ, ನೀಲಿ ಪ್ರದೇಶ ಸ್ವಲ್ಪ ಒಳಕ್ಕೆ ಸರಿದಂತೆ, “ಒಂದು ವಲಯದಷ್ಟು ಸಣ್ಣದಾದಂತೆ” ಕಾಣುತ್ತದೆ.

![Swift](../../RESOURCE/002_view6.png)

**ಡೀಫಾಲ್ಟ್ ಅಂತರ**

`padding()` modifier ಡೀಫಾಲ್ಟ್ ಆಗಿ ಸಿಸ್ಟಮ್ ಶಿಫಾರಸು ಮಾಡಿದ ಸ್ಟಾಂಡರ್ಡ್ spacing ಬಳಸುತ್ತದೆ.

```swift
.padding()
```

ಈ ಮೌಲ್ಯ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಹಾಗೂ ಸಂಧರ್ಭಕ್ಕೆ ಅನುಗುಣವಾಗಿ ಬದಲಾಗಬಹುದು. ಉದಾಹರಣೆಗೆ:

- iOS ನಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಸುಮಾರು 16 pt ಇರುತ್ತದೆ
- macOS ಅಥವಾ watchOS ನಲ್ಲಿ ಸಿಸ್ಟಮ್ ಸ್ಟಾಂಡರ್ಡ್ spacing ಭಿನ್ನವಾಗಿರಬಹುದು; ಅದು ಆ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನ ವಿನ್ಯಾಸ ನಿಯಮಗಳಿಗೆ ಅವಲಂಬಿತವಾಗಿರುತ್ತದೆ

**ಕಸ್ಟಮ್ ಅಂತರ**

view ಗೆ ಪ್ರತ್ಯೇಕ ದಿಕ್ಕಿನ padding ಕೂಡ ನೀಡಬಹುದು.

1. ಒಂದೇ ದಿಕ್ಕಿಗೆ ಹೊಂದಿಸುವುದು

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

ದಿಕ್ಕಿನ ಅರ್ಥ:

- `.top`: ಮೇಲಿನ ಅಂತರ
- `.bottom`: ಕೆಳಗಿನ ಅಂತರ
- `.leading`: ಮುಂಭಾಗದ ಅಂತರ
- `.trailing`: ಹಿಂಭಾಗದ ಅಂತರ

![Swift](../../RESOURCE/002_view12.png)

ಗಮನಿಸಿ: `leading` ಮತ್ತು `trailing` ಭಾಷೆಯ ದಿಕ್ಕಿನ ಪ್ರಕಾರ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಹೊಂದಿಕೊಳ್ಳುತ್ತವೆ. ಉದಾಹರಣೆಗೆ Arabic (RTL) ಪರಿಸರದಲ್ಲಿ ಅವು ತಿರುಗುತ್ತವೆ.

2. ಹಲವು ದಿಕ್ಕುಗಳಿಗೆ ಒಟ್ಟಿಗೆ ಹೊಂದಿಸುವುದು

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

ಒಂದು array ಮೂಲಕ ಹಲವಾರು ದಿಕ್ಕುಗಳನ್ನು ಒಂದೇ ಸಲ ಸೂಚಿಸಬಹುದು. Array ಯ ಸಂಪೂರ್ಣ ಬಳಕೆಯನ್ನು ನಂತರದ ಪಾಠಗಳಲ್ಲಿ ವಿವರಿಸುತ್ತೇವೆ; ಈಗ ಈ ಬರವಣಿಗೆಯ ವಿಧಾನವನ್ನು ತಿಳಿದುಕೊಳ್ಳುವುದೇ ಸಾಕು.

3. ಅಡ್ಡ ಅಥವಾ ನಿಲ್ಲುವ ದಿಕ್ಕಿಗೆ ಹೊಂದಿಸುವುದು

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

ಇದು ಕೆಳಗಿನದಕ್ಕೆ ಸಮಾನ:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**ಅಂತರ ತೆಗೆದುಹಾಕುವುದು**

ಯಾವುದೇ padding ಬೇಡವೆಂದರೆ `.padding(0)` ಬಳಸಿ ತೆಗೆದುಹಾಕಬಹುದು:

```swift
.padding(0)
```

ಅಥವಾ `padding` modifier ಅನ್ನು ನೇರವಾಗಿ ಅಳಿಸಬಹುದು:

```swift
// .padding()
```

### 6. Preview ಪೂರ್ವವೀಕ್ಷಣಾ ಕೋಡ್

```swift
#Preview {
    ContentView()
}
```

ಈ ಕೋಡ್ Canvas ಒಳಗೆ `ContentView` view ಪ್ರಿವ್ಯೂ ರಚಿಸುತ್ತದೆ.

ಗಮನಿಸಿ: `#Preview` ಎನ್ನುವುದು Swift 5.9 / Xcode 15 ನಲ್ಲಿ ಬಂದ ಹೊಸ syntax. ಅದಕ್ಕಿಂತ ಮೊದಲು `PreviewProvider` ರಚನೆಯನ್ನು ಬಳಸಲಾಗುತ್ತಿತ್ತು.

**Preview ಗೆ ಕಾಮೆಂಟ್ ಹಾಕಿದರೆ ಏನಾಗುತ್ತದೆ?**

`Preview` ಅನ್ನು ಕಾಮೆಂಟ್ ಮಾಡಿದರೆ:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas ಇನ್ನು render ಮಾಡಬಹುದಾದ ವಿಷಯವನ್ನು ತೋರಿಸದು.

![Swift](../../RESOURCE/002_xcode.png)

ಇದು `#Preview` Canvas ನಲ್ಲಿ ಯಾವ ಪ್ರಿವ್ಯೂ ತೋರಿಸಬೇಕು ಎಂಬುದನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ ಎಂಬುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.

Xcode ನಲ್ಲಿ SwiftUI view ಅನ್ನು ಪ್ರಿವ್ಯೂ ಮಾಡಲು `#Preview` ಕೋಡ್ ಸೇರಿಸಬಹುದು. preview ಅಗತ್ಯವಿಲ್ಲದಿದ್ದರೆ, `#Preview` ಕೋಡ್ ಗೆ ಕಾಮೆಂಟ್ ಹಾಕಬಹುದು ಅಥವಾ ಅಳಿಸಬಹುದು.

## ಸಾರಾಂಶ

`ContentView.swift` ಫೈಲ್‌ನ ಕೋಡ್ ಹೆಚ್ಚು ಇಲ್ಲದಿದ್ದರೂ, ವಾಸ್ತವವಾಗಿ ಅದು SwiftUI ಯ ಹಲವು ಮೂಲಭೂತ ಸಂಧಾನಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ಪ್ರಾರಂಭಿಕರಿಗೆ ಇದು ಮೊದಲಿಗೆ ಅಪರಿಚಿತವಾಗಿ ಕಾಣಬಹುದು, ಆದರೆ ಕೋಡ್ ಅನ್ನು ಭಾಗಗಳಾಗಿ ಬಿಡಿಸಿ ನೋಡಿದರೆ SwiftUI ಯ ಮೂಲಭೂತ ಅರಿವು ನಿರ್ಮಾಣವಾಗುತ್ತದೆ.

ಈ ಪಾಠದಲ್ಲಿ ನಾವು ಮೊದಲು `//` ಕಾಮೆಂಟ್ ಅನ್ನು ಕಲಿತೇವೆ. ಇದನ್ನು ಕೋಡ್ ಲಾಜಿಕ್ ವಿವರಿಸಲು ಅಥವಾ ಕೋಡ್ ಅನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು ಬಳಸಬಹುದು.

ನಂತರ SwiftUI ಫೈಲ್ ತಪ್ಪದೇ SwiftUI framework import ಮಾಡಬೇಕು ಎಂಬುದನ್ನು ತಿಳಿದುಕೊಂಡೆವು:

```swift
import SwiftUI
```

Framework import ಮಾಡದಿದ್ದರೆ compiler ಗೆ `View` ಮುಂತಾದ type‌ಗಳನ್ನು ಗುರುತಿಸಲು ಆಗುವುದಿಲ್ಲ.

ನಂತರ SwiftUI view ಯ ಮೂಲಭೂತ ರಚನೆಯನ್ನು ಕಂಡೆವು:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ಇಲ್ಲಿ `ContentView` ಎನ್ನುವುದು view ಯ ಹೆಸರು.

ನಾವು ಮೂರು ಸಾಮಾನ್ಯ layout container ಗಳನ್ನೂ ಕಲಿತೆವು: `VStack` (vertical ترتيب), `HStack` (horizontal ترتيب), ಮತ್ತು `ZStack` (overlay ترتيب).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ಈ ಕೋಡ್ ಒಂದು vertical container ಅನ್ನು ತೋರಿಸುತ್ತದೆ, ಮತ್ತು ಅದರೊಳಗೆ ಒಂದು ಐಕಾನ್ ಹಾಗೂ ಒಂದು ಪಠ್ಯವನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ.

`Image` SF Symbols ಐಕಾನ್‌ಗಳನ್ನು ತೋರಿಸಲು ಬಳಸಬಹುದು, ಮತ್ತು modifiers ಮೂಲಕ ಅದರ ಗಾತ್ರ ಹಾಗೂ ಬಣ್ಣವನ್ನು ಬದಲಿಸಬಹುದು.

`Text` view ಪಠ್ಯವನ್ನು ತೋರಿಸುತ್ತದೆ.

`padding` ಎಂದರೆ view ಸುತ್ತಲೂ ಒಂದು ಪಾರದರ್ಶಕ ಖಾಲಿ ಜಾಗ ಸೇರಿಸುವುದು.

ಕೊನೆಯಲ್ಲಿ `#Preview` preview view ಮೂಲಕ Canvas ನಲ್ಲಿ ಪೂರ್ವವೀಕ್ಷಣೆಯನ್ನು ತೋರಿಸಬಹುದು.

### ಪಾಠಾನಂತರದ ಅಭ್ಯಾಸ

ಪ್ರಾರಂಭಿಕರಿಗೆ ಈ ಪಾಠದ ವಿಷಯ ಸ್ವಲ್ಪ ಜಟಿಲವಾಗಿ ಕಾಣಬಹುದು. ಇನ್ನೂ ಚೆನ್ನಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಕೆಳಗಿನ ಅಭ್ಯಾಸ ಮಾಡಿ:

- SF Symbols ಐಕಾನ್ ಹೆಸರನ್ನು ಬದಲಿಸಿ
- ಐಕಾನ್‌ನ ಮುಂಭಾಗದ ಬಣ್ಣವನ್ನು ಕಪ್ಪಾಗಿಸಿ
- `VStack` ಅನ್ನು `HStack` ಆಗಿ ಬದಲಿಸಿ
- `Image` ಅಥವಾ `Text` ಗೆ ಕಾಮೆಂಟ್ ಹಾಕಿ preview ಹೇಗೆ ಬದಲಾಗುತ್ತದೆ ನೋಡಿ

### ಹೆಚ್ಚುವರಿ: ಕೋಡ್ ಸಂಪೂರ್ಣಗೊಳಿಕೆ (Code Completion)

ಕೋಡ್ ಟೈಪ್ ಮಾಡುವಾಗ, Xcode ಲಭ್ಯ ಆಯ್ಕೆಗಳ ಪಟ್ಟಿಯನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತೋರಿಸುತ್ತಿರುವುದನ್ನು ನೀವು ಗಮನಿಸಿದ್ದಿರಬಹುದು.

ಉದಾಹರಣೆಗೆ `imageScale` modifier ಅನ್ನು ಬದಲಿಸುವಾಗ:

```swift
.imageScale(.)
```

Xcode ಲಭ್ಯ ಆಯ್ಕೆಗಳನ್ನು ತೋರಿಸುತ್ತದೆ:

![Swift](../../RESOURCE/002_view10.png)

ಇದು code completion ವ್ಯವಸ್ಥೆ. ಇದು type inference ಮತ್ತು enum ಸದಸ್ಯರ ಸೂಚನೆಗಳನ್ನು ಆಧರಿಸಿ ಕೆಲಸ ಮಾಡುತ್ತದೆ, ಆದ್ದರಿಂದ ಟೈಪಿಂಗ್ ವೇಗ ಹೆಚ್ಚುತ್ತದೆ ಮತ್ತು ದೋಷಗಳು ಕಡಿಮೆಯಾಗುತ್ತವೆ.

ಮುಂದಿನ ಪಾಠಗಳಲ್ಲಿ ನಾವು `enum` ಅನ್ನು ಅಧಿಕೃತವಾಗಿ ಕಲಿಯುತ್ತೇವೆ; ಈಗಾಗಲೇ ಇದನ್ನು ಒಂದು ಸರಳ ಪರಿಚಯವಾಗಿ ತಿಳಿದುಕೊಳ್ಳಬಹುದು.
