# ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ

ಈ ಪಾಠದಲ್ಲಿ ಮುಖ್ಯವಾಗಿ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಕಲಿಯುತ್ತೇವೆ.

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಈಗಿರುವ ಡೇಟಾದ ಆಧಾರದ ಮೇಲೆ ಹೊಸ ಫಲಿತಾಂಶವನ್ನು ಲೆಕ್ಕಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಇದು ಸಂಖ್ಯಾತ್ಮಕ ಮೌಲ್ಯಗಳನ್ನು ಲೆಕ್ಕಿಸಬಹುದು, ಹಾಗೆಯೇ SwiftUI ವ್ಯೂನಲ್ಲಿ ತೋರಿಸಬೇಕಾದ ವಿಷಯವನ್ನೂ ಲೆಕ್ಕಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
let a = 10
let b = 20
let c = a + b
```

ಇಲ್ಲಿ `c` ಎಂದರೆ `a` ಮತ್ತು `b` ಸೇರಿಸಿದ ನಂತರದ ಫಲಿತಾಂಶ.

ಸಾಮಾನ್ಯ ಕೋಡ್‌ನಲ್ಲಿ ಈ ರೀತಿಯ ಬರವಣಿಗೆ ಬಹಳ ಸಾಮಾನ್ಯ.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

ಸೂಚನೆ: `Button` ಕ್ಲಿಕ್ ಘಟನೆ ಒಳಗೆ ಸಾಮಾನ್ಯ Swift ಕೋಡ್ ಅನ್ನು ನಿರ್ವಹಿಸಬಹುದು.

ಆದರೆ ಇದೇ ರೀತಿಯ ಕೋಡ್ ಅನ್ನು SwiftUI ವ್ಯೂನ ಪ್ರಾಪರ್ಟಿಗಳಲ್ಲಿ ನೇರವಾಗಿ ಬರೆದರೆ, ಸಮಸ್ಯೆ ಎದುರಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

ಈ ಕೋಡ್ ದೋಷವನ್ನು ತೋರಿಸುತ್ತದೆ.

ನೋಡಲು `a` ಮತ್ತು `b` ಈಗಾಗಲೇ `c` ಗಿಂತ ಮೊದಲು ಬರೆಯಲ್ಪಟ್ಟಿವೆ, ಆದ್ದರಿಂದ `c` ಮೌಲ್ಯವನ್ನು ಲೆಕ್ಕಿಸಬಹುದು ಎಂದು ತೋರುತ್ತದೆ.

ಆದರೆ struct ಒಳಗೆ ಪ್ರಾಪರ್ಟಿಗಳನ್ನು ಘೋಷಿಸುವಾಗ, ಈ ಬರವಣಿಗೆಯನ್ನು ನೇರವಾಗಿ ಬಳಸಲಾಗುವುದಿಲ್ಲ.

## ಏಕೆ c ಅನ್ನು ನೇರವಾಗಿ a + b ಎಂದು ಲೆಕ್ಕಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ?

ಏಕೆಂದರೆ `a`, `b`, `c` ಬಟನ್ ಕ್ಲಿಕ್ ಘಟನೆಯಲ್ಲಿರುವ ತಾತ್ಕಾಲಿಕ constants ಅಲ್ಲ. ಅವು `ContentView` ವ್ಯೂನ ಪ್ರಾಪರ್ಟಿಗಳು.

ಬಟನ್ ಕ್ಲಿಕ್ ಘಟನೆಯಲ್ಲಿ ಈ ಕೋಡ್ ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

ಏಕೆಂದರೆ ಬಟನ್ ಕ್ಲಿಕ್ ಆದ ನಂತರ, ಕೋಡ್ ಕ್ರಮವಾಗಿ ನಡೆಯುತ್ತದೆ. ಮೊದಲು `a` ರಚಿಸಲಾಗುತ್ತದೆ, ನಂತರ `b` ರಚಿಸಲಾಗುತ್ತದೆ, ಕೊನೆಯಲ್ಲಿ `a + b` ಬಳಸಿ `c` ಲೆಕ್ಕಿಸಲಾಗುತ್ತದೆ.

ಆದರೆ ವ್ಯೂ ಒಳಗೆ ಪ್ರಾಪರ್ಟಿಗಳನ್ನು ಘೋಷಿಸುವಾಗ ಪರಿಸ್ಥಿತಿ ಬೇರೆ:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

ಇಲ್ಲಿನ `a`, `b`, `c` ಎಲ್ಲವೂ `ContentView` ವ್ಯೂನ ಪ್ರಾಪರ್ಟಿಗಳು.

`ContentView` ವ್ಯೂ ರಚನೆಯಾಗುವಾಗ, Swift ಮೊದಲು ಈ ಪ್ರಾಪರ್ಟಿಗಳನ್ನು ಸಿದ್ಧಪಡಿಸಬೇಕು. ರಚನೆಯ ಪ್ರಕ್ರಿಯೆ ಸುರಕ್ಷಿತವಾಗಿರಲು, Swift ಒಂದು instance stored property ಯ default value ನಲ್ಲಿ ಅದೇ instance ಒಳಗಿನ ಇತರ instance properties ಅನ್ನು ನೇರವಾಗಿ ಓದಲು ಅನುಮತಿಸುವುದಿಲ್ಲ.

ಆದ್ದರಿಂದ ಈ ಸಾಲು ದೋಷವನ್ನು ತೋರಿಸುತ್ತದೆ:

```swift
let c = a + b
```

ಸರಳವಾಗಿ ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: **ವ್ಯೂ ಒಳಗೆ ಪ್ರಾಪರ್ಟಿಗಳನ್ನು ಘೋಷಿಸುವಾಗ, ಒಂದು ಸಾಮಾನ್ಯ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಬಳಸಿ ಮತ್ತೊಂದು ಸಾಮಾನ್ಯ ಪ್ರಾಪರ್ಟಿಯನ್ನು ನೇರವಾಗಿ ಲೆಕ್ಕಿಸಲಾಗುವುದಿಲ್ಲ.**

ಈ ರೀತಿಯಾಗಿ ಮೌಲ್ಯವನ್ನು ನೇರವಾಗಿ ಸಂಗ್ರಹಿಸುವ ಪ್ರಾಪರ್ಟಿಯನ್ನು “stored property” ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ. ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸುಲಭವಾಗಲು, ಇದನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಸಾಮಾನ್ಯ ಪ್ರಾಪರ್ಟಿ ಎಂದುಕೊಳ್ಳಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
let a = 10
```

`a` ಒಳಗೆ `10` ಸಂಗ್ರಹಿಸಲಾಗಿದೆ.

```swift
let b = 20
```

`b` ಒಳಗೆ `20` ಸಂಗ್ರಹಿಸಲಾಗಿದೆ.

ಆದರೆ:

```swift
let c = a + b
```

ಇಲ್ಲಿ `c` ನೇರವಾಗಿ ಬರೆಯಲ್ಪಟ್ಟ ಸ್ಥಿರ ಮೌಲ್ಯವಲ್ಲ. ಅದು `a + b` ಮೂಲಕ ಲೆಕ್ಕಿಸಬೇಕೆಂದು ನಿರೀಕ್ಷಿಸುತ್ತದೆ.

ಈ ರೀತಿಯ “ಈಗಿರುವ ಡೇಟಾದಿಂದ ಫಲಿತಾಂಶ ಪಡೆಯುವ” ಪರಿಸ್ಥಿತಿಗೆ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಹೆಚ್ಚು ಸೂಕ್ತ.

ಇದನ್ನು ಹೀಗೆ ಬದಲಾಯಿಸಬಹುದು:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

ಇಲ್ಲಿನ `c` ಒಂದು ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ.

```swift
var c: Int {
    return a + b
}
```

ಇದರ ಅರ್ಥ: **`c` ಬಳಸಬೇಕಾದಾಗ ಮಾತ್ರ `a` ಮತ್ತು `b` ಓದಿ, `a + b` ಫಲಿತಾಂಶವನ್ನು return ಮಾಡುತ್ತದೆ.**

ಉದಾಹರಣೆಗೆ:

```swift
Text("c: \(c)")
```

`Text` ನಲ್ಲಿ `c` ತೋರಿಸುವಾಗ ಮಾತ್ರ `c` ಲೆಕ್ಕಿಸಲಾಗುತ್ತದೆ.

## ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಎಂದರೇನು?

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಂದು variable ಹಾಗೆ ಕಾಣುತ್ತದೆ, ಆದರೆ ಅದು ಸ್ವತಃ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

ಇಲ್ಲಿನ `c` ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ.

ಇದು ಸಾಮಾನ್ಯ ಪ್ರಾಪರ್ಟಿಯಂತೆ ಒಂದು ನಿಶ್ಚಿತ ಮೌಲ್ಯವನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ. ಪ್ರತಿ ಬಾರಿ `c` ಓದಿದಾಗ, `{}` ಒಳಗಿನ ಕೋಡ್ ಮರುಚಾಲನೆಯಾಗಿ ಲೆಕ್ಕಿಸಲಾದ ಫಲಿತಾಂಶವನ್ನು return ಮಾಡುತ್ತದೆ.

ಇದನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

```swift
var c: Int {
    return a + b
}
```

`c` ಬೇಕಾದಾಗ, `a + b` ಅನ್ನು ಲೆಕ್ಕಿಸಲಾಗುತ್ತದೆ.

ಆದ್ದರಿಂದ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಈ ಪರಿಸ್ಥಿತಿಗೆ ಸೂಕ್ತ: **ಒಂದು ಫಲಿತಾಂಶವನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಸಂಗ್ರಹಿಸುವ ಅಗತ್ಯವಿಲ್ಲ, ಅದು ಈಗಿರುವ ಡೇಟಾದಿಂದ ಲೆಕ್ಕಿಸಬಹುದು.**

## ಮೂಲ ಬರವಣಿಗೆ

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಮೂರು ಭಾಗಗಳಿರುತ್ತವೆ:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` ಬಳಸಿ ಘೋಷಿಸುವುದು

```swift
var c
```

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಕಡ್ಡಾಯವಾಗಿ `var` ಬಳಸಿ ಘೋಷಿಸಬೇಕು, `let` ಬಳಸಲಾಗುವುದಿಲ್ಲ.

ಏಕೆಂದರೆ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಂದು ಸ್ಥಿರವಾಗಿ ಸಂಗ್ರಹಿಸಲಾದ ಮೌಲ್ಯವಲ್ಲ. ಅದು ಪ್ರತಿ ಬಾರಿ ಓದಿದಾಗ dynamic ಆಗಿ ಲೆಕ್ಕಿಸಲ್ಪಡುವ ಫಲಿತಾಂಶ.

### 2. Return type ಸೂಚಿಸುವುದು

```swift
var c: Int
```

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಗೆ return type ಸೂಚಿಸಬೇಕು.

ಇಲ್ಲಿ `c` ಕೊನೆಯಲ್ಲಿ ಒಂದು integer ಅನ್ನು return ಮಾಡುತ್ತದೆ, ಆದ್ದರಿಂದ type `Int`.

### 3. {} ಒಳಗೆ ಲೆಕ್ಕಿಸುವ logic ಬರೆಯುವುದು

```swift
{
    return a + b
}
```

`{}` ಒಳಗೆ ಲೆಕ್ಕಿಸುವ logic ಬರೆಯಲಾಗುತ್ತದೆ. ಇಲ್ಲಿ return ಆಗುವ ಫಲಿತಾಂಶ `a + b`.

## return ಕೀವರ್ಡ್

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಂದು ಫಲಿತಾಂಶವನ್ನು return ಮಾಡಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
var c: Int {
    return a + b
}
```

ಇಲ್ಲಿನ `return` ಎಂದರೆ: `a + b` ಲೆಕ್ಕಿಸಿದ ಫಲಿತಾಂಶವನ್ನು ಹೊರಗೆ return ಮಾಡುವುದು.

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಳಗೆ ಫಲಿತಾಂಶವನ್ನು ನೇರವಾಗಿ ನೀಡುವ ಒಂದೇ expression ಇದ್ದರೆ, `return` ಅನ್ನು ಬಿಡಬಹುದು:

```swift
var c: Int {
    a + b
}
```

ಆದರೆ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಳಗೆ ಹಲವು ಸಾಲುಗಳ ಕೋಡ್ ಇದ್ದರೆ, ಫಲಿತಾಂಶವನ್ನು ಸ್ಪಷ್ಟವಾಗಿ return ಮಾಡಲು `return` ಬಳಸಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ಇಲ್ಲಿ ಲೆಕ್ಕಿಸುವ ಪ್ರಕ್ರಿಯೆ ಎರಡು ಹಂತಗಳಾಗಿ ವಿಭಜಿಸಲಾಗಿದೆ.

ಮೊದಲ ಹಂತದಲ್ಲಿ ಒಟ್ಟು ಬೆಲೆ ಲೆಕ್ಕಿಸಲಾಗುತ್ತದೆ:

```swift
let total = count * price
```

ಎರಡನೇ ಹಂತದಲ್ಲಿ ಒಟ್ಟು ಬೆಲೆಯನ್ನು text ಆಗಿ ಸೇರಿಸಿ return ಮಾಡಲಾಗುತ್ತದೆ:

```swift
return "Total：\(total) $"
```

`return` ತೆಗೆದುಹಾಕಿದರೆ:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

ಈ ಕೋಡ್ ದೋಷವನ್ನು ತೋರಿಸುತ್ತದೆ.

ಕಾರಣ: **ಈ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಳಗೆ ಈಗಾಗಲೇ ಹಲವು ಸಾಲುಗಳ ಕೋಡ್ ಇದೆ. Swift ಯಾವ ಸಾಲು ಅಂತಿಮವಾಗಿ return ಆಗಬೇಕಾದ ಫಲಿತಾಂಶ ಎಂದು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ನಿರ್ಧರಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.**

ಆದ್ದರಿಂದ, ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಳಗೆ ಒಂದೇ ಫಲಿತಾಂಶ expression ಇದ್ದರೆ `return` ಅನ್ನು ಬಿಡಬಹುದು.

```swift
var c: Int {
    a + b
}
```

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಳಗೆ ಹಲವು ಸಾಲುಗಳ ಕೋಡ್ ಇದ್ದರೆ, `return` ಅನ್ನು ಸ್ಪಷ್ಟವಾಗಿ ಬರೆಯುವುದು ಉತ್ತಮ.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಮತ್ತು ಸಾಮಾನ್ಯ ಪ್ರಾಪರ್ಟಿಯ ವ್ಯತ್ಯಾಸ

ಸಾಮಾನ್ಯ ಪ್ರಾಪರ್ಟಿ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸುತ್ತದೆ.

```swift
var c = 30
```

ಇಲ್ಲಿ `c` ಒಂದು ನಿರ್ದಿಷ್ಟ ಮೌಲ್ಯವನ್ನು ಸಂಗ್ರಹಿಸಿದೆ: `30`.

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ.

```swift
var c: Int {
    a + b
}
```

ಇಲ್ಲಿ `c` `30` ಅನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ. ಅದು ಕೇವಲ ಲೆಕ್ಕಿಸುವ ವಿಧಾನವನ್ನು ಒದಗಿಸುತ್ತದೆ.

`c` ಓದಿದಾಗ, Swift ಇದನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ:

```swift
a + b
```

ನಂತರ ಲೆಕ್ಕಿಸಲಾದ ಫಲಿತಾಂಶವನ್ನು return ಮಾಡುತ್ತದೆ.

ಆದ್ದರಿಂದ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಇತರ ಡೇಟಾದಿಂದ ಫಲಿತಾಂಶವನ್ನು ಲೆಕ್ಕಿಸುವ ಸಂದರ್ಭಗಳಿಗೆ ಸೂಕ್ತ.

## body ಕೂಡ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಕಲಿತ ನಂತರ, SwiftUI ನಲ್ಲಿ ಅತ್ಯಂತ ಸಾಮಾನ್ಯವಾಗಿ ಕಾಣುವ ಈ ಕೋಡ್ ಅನ್ನು ಮತ್ತೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ಇಲ್ಲಿನ `body` ಕೂಡ ಒಂದು ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ.

ಇದು `var` ಬಳಸಿ ಘೋಷಿಸಲಾಗಿದೆ:

```swift
var body
```

ಇದಕ್ಕೆ return type ಇದೆ:

```swift
some View
```

ಇದರ `{}` ಒಳಗೆ return ಆಗುವುದು SwiftUI ವ್ಯೂ ವಿಷಯ:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

ಆದ್ದರಿಂದ `body` ಅನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: SwiftUI ಈ ವ್ಯೂ ತೋರಿಸಬೇಕಾದಾಗ `body` ಅನ್ನು ಓದುತ್ತದೆ, ಮತ್ತು `body` return ಮಾಡುವ ವಿಷಯದ ಆಧಾರದ ಮೇಲೆ interface ಅನ್ನು ರಚಿಸುತ್ತದೆ.

`return` ಬರೆದರೆ, ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ಆದರೆ SwiftUI ನಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ `return` ಅನ್ನು ಬಿಡುತ್ತೇವೆ, ನೇರವಾಗಿ ಹೀಗೆ ಬರೆಯುತ್ತೇವೆ:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

`@State` ಡೇಟಾ ಬದಲಾಗಿದಾಗ, SwiftUI `body` ಅನ್ನು ಮತ್ತೆ ಓದುತ್ತದೆ ಮತ್ತು ಹೊಸ ಡೇಟಾದ ಆಧಾರದ ಮೇಲೆ interface ಅನ್ನು ನವೀಕರಿಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದ ನಂತರ `count` ಬದಲಾಗುತ್ತದೆ.

```swift
count += 1
```

`count` ಬದಲಾದ ನಂತರ, SwiftUI `body` ಅನ್ನು ಮರುಲೆಕ್ಕಿಸುತ್ತದೆ. ಆದ್ದರಿಂದ interface ಒಳಗಿನ text ಕೂಡ ನವೀಕರಿಸುತ್ತದೆ.

```swift
Text("count: \(count)")
```

SwiftUI ನಲ್ಲಿ ಡೇಟಾ ಬದಲಾಗಿದ ನಂತರ interface ಸ್ವಯಂಚಾಲಿತವಾಗಿ refresh ಆಗುವುದಕ್ಕೂ ಇದೇ ಕಾರಣ.

### body ಒಳಗೆ ಸಂಕೀರ್ಣ ಲೆಕ್ಕಾಚಾರ ಬರೆಯುವುದು ಶಿಫಾರಸು ಮಾಡಲಾಗುವುದಿಲ್ಲ

`body` ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯಾಗಿರುವುದರಿಂದ, ಅದು ಅನೇಕ ಬಾರಿ ಓದಲಾಗಬಹುದು ಮತ್ತು ಮರುಲೆಕ್ಕಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

`name` ಬದಲಾಗಿದಾಗ, SwiftUI `body` ಅನ್ನು ಮರುಲೆಕ್ಕಿಸುತ್ತದೆ.

ಈ ಸಂದರ್ಭದಲ್ಲಿ `body` ಒಳಗಿನ ಕೋಡ್ ಕೂಡ ಮತ್ತೆ ನಡೆಯುತ್ತದೆ, `num` ಕೂಡ ಮತ್ತೆ ರಚಿಸಲಾಗುತ್ತದೆ.

```swift
let num = 10
```

ಈ ಉದಾಹರಣೆಯಲ್ಲಿನ `num` ತುಂಬಾ ಸರಳ, ಆದ್ದರಿಂದ ಅದರ ಪರಿಣಾಮ ಹೆಚ್ಚು ಇರುವುದಿಲ್ಲ.

ಆದರೆ `body` ಒಳಗೆ ಸಂಕೀರ್ಣ ಲೆಕ್ಕಾಚಾರಗಳನ್ನು ಮಾಡಿದರೆ, ಉದಾಹರಣೆಗೆ ದೊಡ್ಡ ಪ್ರಮಾಣದ ಡೇಟಾ filtering, sorting, image processing ಮುಂತಾದವು, interface ಸರಾಗವಾಗಿ ಕೆಲಸ ಮಾಡುವುದಕ್ಕೆ ಪರಿಣಾಮ ಬೀರಬಹುದು.

ಆದ್ದರಿಂದ SwiftUI ನಲ್ಲಿ `body` ಮುಖ್ಯವಾಗಿ interface ರಚನೆಯನ್ನು ವಿವರಿಸುವ ಜವಾಬ್ದಾರಿ ಹೊಂದಿರಬೇಕು.

ಸರಳ ತಾತ್ಕಾಲಿಕ ಡೇಟಾವನ್ನು `body` ಒಳಗೆ ಬರೆಯಬಹುದು.

ಸಂಕೀರ್ಣ ಲೆಕ್ಕಾಚಾರಗಳನ್ನು `body` ಹೊರಗಿನ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ, method, ಅಥವಾ ಪ್ರತ್ಯೇಕ data processing ಭಾಗಕ್ಕೆ ಹಾಕುವುದು ಉತ್ತಮ.

## ಉದಾಹರಣೆ: ಪ್ರಮಾಣ ಮತ್ತು ಒಟ್ಟು ಬೆಲೆ

ಈಗ ಒಂದು ಸರಳ ಉದಾಹರಣೆಯ ಮೂಲಕ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳೋಣ.

ಒಂದು carrot ಬೆಲೆ 2 $ ಎಂದು ಊಹಿಸೋಣ. ಬಳಕೆದಾರರು ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ ಖರೀದಿ ಪ್ರಮಾಣವನ್ನು ಬದಲಾಯಿಸಬಹುದು, ಮತ್ತು interface ನಲ್ಲಿ ಒಟ್ಟು ಬೆಲೆ ತೋರಿಸಬೇಕು.

ಒಟ್ಟು ಬೆಲೆಯ ಲೆಕ್ಕಿಸುವ ವಿಧಾನ:

```text
ಪ್ರಮಾಣ * ಏಕಕ ಬೆಲೆ
```

ಒಟ್ಟು ಬೆಲೆಯನ್ನು ಸಾಮಾನ್ಯ variable ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಿದರೆ, ಅದು ಸ್ವಲ್ಪ ಕಷ್ಟಕರವಾಗುತ್ತದೆ.

ಏಕೆಂದರೆ ಪ್ರಮಾಣ ಬದಲಾಗುವ ಪ್ರತಿ ಬಾರಿ ಒಟ್ಟು ಬೆಲೆಯನ್ನು ಕೈಯಿಂದಲೇ update ಮಾಡಬೇಕು.

ಇದಕ್ಕಿಂತ ಉತ್ತಮ ವಿಧಾನವೆಂದರೆ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಬಳಸುವುದು:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../Resource/024_view.png)

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ:

```swift
@State private var count = 1
```

`count` carrot ಪ್ರಮಾಣವನ್ನು ಸೂಚಿಸುತ್ತದೆ. ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ `count` ಬದಲಾಗುತ್ತದೆ.

```swift
private let price = 2
```

`price` carrot ನ ಏಕಕ ಬೆಲೆಯನ್ನು ಸೂಚಿಸುತ್ತದೆ. ಇಲ್ಲಿ ಅದು ಸ್ಥಿರ ಮೌಲ್ಯ, ಆದ್ದರಿಂದ `let` ಬಳಸಲಾಗಿದೆ.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` ಒಟ್ಟು ಬೆಲೆಯನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ಅದನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಸಂಗ್ರಹಿಸುವ ಅಗತ್ಯವಿಲ್ಲ, ಏಕೆಂದರೆ ಒಟ್ಟು ಬೆಲೆ ಯಾವಾಗಲೂ `count * price` ಮೂಲಕ ಲೆಕ್ಕಿಸಬಹುದು.

`count` `1` ಆಗಿರುವಾಗ:

```swift
totalPrice = 1 * 2
```

ತೋರಿಸುವ ಫಲಿತಾಂಶ:

```swift
totalPrice: 2 $
```

`+` ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದ ನಂತರ, `count` `2` ಆಗುತ್ತದೆ.

ಈ ಸಂದರ್ಭದಲ್ಲಿ `totalPrice` ಮತ್ತೆ ಓದಿದಾಗ, ಅದು ಮರುಲೆಕ್ಕಿಸಲಾಗುತ್ತದೆ:

```swift
totalPrice = 2 * 2
```

ತೋರಿಸುವ ಫಲಿತಾಂಶ:

```swift
totalPrice: 4 $
```

ಇದೆ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯ ಕೆಲಸ: ಈಗಿರುವ ಡೇಟಾದ ಆಧಾರದ ಮೇಲೆ ಹೊಸ ಫಲಿತಾಂಶವನ್ನು dynamic ಆಗಿ ಲೆಕ್ಕಿಸುವುದು.

## ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ನಿರ್ಧಾರಕ್ಕೆ ಬಳಸಬಹುದು

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಸಂಖ್ಯೆಯನ್ನು ಮಾತ್ರ ಲೆಕ್ಕಿಸುವುದಿಲ್ಲ, ಅದು judgment result ಕೂಡ return ಮಾಡಬಹುದು.

ಉದಾಹರಣೆಗೆ, ಪ್ರಮಾಣದ ಕನಿಷ್ಠ ಮೌಲ್ಯ 1 ಆಗಿರಬೇಕು ಎಂದು ಬಯಸಿದರೆ.

ಪ್ರಮಾಣ ಈಗಾಗಲೇ 1 ಆಗಿದ್ದಾಗ, `-` ಬಟನ್ ಮತ್ತೆ ಕಡಿಮೆ ಮಾಡಬಾರದು.

ಅದಕ್ಕಾಗಿ ಒಂದು ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಸೇರಿಸಬಹುದು:

```swift
private var canDecrease: Bool {
    count > 1
}
```

ಸಂಪೂರ್ಣ ಕೋಡ್:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../Resource/024_view1.png)

ಇಲ್ಲಿನ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

ಈ ಕೋಡ್ ಪ್ರಸ್ತುತ ಇನ್ನೂ ಕಡಿಮೆ ಮಾಡಬಹುದೇ ಎಂಬುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.

`count` `1` ಕ್ಕಿಂತ ದೊಡ್ಡದಾದಾಗ:

```swift
canDecrease == true
```

ಅಂದರೆ ಕಡಿಮೆ ಮಾಡಬಹುದು.

`count` `1` ಗೆ ಸಮಾನವಾಗಿದ್ದಾಗ:

```swift
canDecrease == false
```

ಅಂದರೆ ಇನ್ನೂ ಕಡಿಮೆ ಮಾಡಲಾಗುವುದಿಲ್ಲ.

### ಬಟನ್ ಒಳಗಿನ condition check

ಬಟನ್ ಒಳಗೆ ಬಳಸಲಾಗಿದೆ:

```swift
if canDecrease {
    count -= 1
}
```

`canDecrease` `true` ಆಗಿದ್ದಾಗ ಮಾತ್ರ `count` ಕಡಿಮೆಯಾಗುತ್ತದೆ.

### ವ್ಯೂನ foreground color ನಿಯಂತ್ರಿಸುವುದು

`canDecrease` ಬಳಸಿ ಬಟನ್ foreground color ಅನ್ನು ನಿಯಂತ್ರಿಸಬಹುದು:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ಇಲ್ಲಿ ternary operator ಬಳಸಲಾಗಿದೆ:

```swift
canDecrease ? Color.primary : Color.gray
```

ಈ ಕೋಡ್‌ನ ಅರ್ಥ: `canDecrease` `true` ಆಗಿದ್ದರೆ foreground color `Color.primary`; `canDecrease` `false` ಆಗಿದ್ದರೆ foreground color `Color.gray`.

`Color.primary` SwiftUI ಒದಗಿಸುವ system semantic color. ಇದು ಪ್ರಸ್ತುತ interface ನ ಮುಖ್ಯ text color ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ.

Light Mode ನಲ್ಲಿ `Color.primary` ಸಾಮಾನ್ಯವಾಗಿ ಕಪ್ಪು ಬಣ್ಣಕ್ಕೆ ಹತ್ತಿರವಾಗಿರುತ್ತದೆ; Dark Mode ನಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಬಿಳಿ ಬಣ್ಣಕ್ಕೆ ಹತ್ತಿರವಾಗಿರುತ್ತದೆ.

ಆದ್ದರಿಂದ `Color.primary` ಬಳಸುವ ಲಾಭ: ಇದು Light Mode ಮತ್ತು Dark Mode ಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ.

### ವ್ಯೂನ disabled ಸ್ಥಿತಿ ನಿಯಂತ್ರಿಸುವುದು

`disabled` ವ್ಯೂ disabled ಆಗಿದೆಯೇ ಇಲ್ಲವೇ ಎಂಬುದನ್ನು ನಿಯಂತ್ರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ:

```swift
.disabled(!canDecrease)
```

`disabled` `false` ಆಗಿದ್ದರೆ, ವ್ಯೂ ಕ್ಲಿಕ್ ಮಾಡಬಹುದು.

`disabled` `true` ಆಗಿದ್ದರೆ, ವ್ಯೂ disabled ಸ್ಥಿತಿಯಲ್ಲಿರುತ್ತದೆ ಮತ್ತು ಕ್ಲಿಕ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ.

ಇಲ್ಲಿ `canDecrease` ಅನ್ನು condition ಆಗಿ ಬಳಸಿರುವುದರಿಂದ, ಕೋಡ್ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸುಲಭವಾಗುತ್ತದೆ.

`canDecrease` ನೋಡಿದಾಗ, ಅದು “ಪ್ರಸ್ತುತ ಇನ್ನೂ ಕಡಿಮೆ ಮಾಡಬಹುದೇ” ಎಂಬುದನ್ನು ಸೂಚಿಸುತ್ತದೆ ಎಂದು ತಿಳಿಯಬಹುದು.

### ಹೆಚ್ಚುವರಿ ವಿವರಣೆ: ಏಕೆ ಎರಡು ಬಾರಿ ಪರಿಶೀಲನೆ?

`-` ಬಟನ್‌ನಲ್ಲಿ:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ಇಲ್ಲಿ `.disabled(!canDecrease)` ಕೂಡ ಬಳಸಲಾಗಿದೆ, ಮತ್ತು ಬಟನ್ ಒಳಗೆ `if canDecrease` ಕೂಡ ಬಳಸಲಾಗಿದೆ.

`.disabled(!canDecrease)` interface ಮಟ್ಟದಲ್ಲಿ ಬಟನ್ ಅನ್ನು disabled ಮಾಡುತ್ತದೆ, ಬಳಕೆದಾರರು ಅದನ್ನು ಕ್ಲಿಕ್ ಮಾಡಲಾಗದಂತೆ ಮಾಡುತ್ತದೆ.

`if canDecrease` ಕೋಡ್ ನಡೆಯುವ ಮೊದಲು ಮತ್ತೊಮ್ಮೆ ಪರಿಶೀಲಿಸುತ್ತದೆ. ಕಡಿಮೆ ಮಾಡಬಹುದಾದಾಗ ಮಾತ್ರ `count -= 1` execute ಆಗುತ್ತದೆ.

ಇದು double protection. ನೈಜ development ನಲ್ಲಿ, ಬಟನ್ ಈಗಾಗಲೇ disabled ಆಗಿದ್ದರೆ, ಒಳಗಿನ condition ಅನ್ನು ತೆಗೆದುಹಾಕಬಹುದು. ಆದರೆ teaching example ನಲ್ಲಿ ಇದನ್ನು ಉಳಿಸುವುದರಿಂದ `canDecrease` ನ ಪಾತ್ರ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ ಮುಖ್ಯವಾಗಿ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಕಲಿತೇವೆ.

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಮೌಲ್ಯವನ್ನು ನೇರವಾಗಿ ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ. ಅದು ಓದಿದಾಗ, ಈಗಿರುವ ಡೇಟಾದ ಆಧಾರದ ಮೇಲೆ ಫಲಿತಾಂಶವನ್ನು ಲೆಕ್ಕಿಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
var c: Int {
    a + b
}
```

ಇಲ್ಲಿನ `c` ಪ್ರತ್ಯೇಕವಾಗಿ ಸಂಗ್ರಹಿಸಬೇಕಾಗಿಲ್ಲ, ಏಕೆಂದರೆ ಅದನ್ನು `a + b` ಮೂಲಕ ಲೆಕ್ಕಿಸಬಹುದು.

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿಯನ್ನು ಕಡ್ಡಾಯವಾಗಿ `var` ಬಳಸಿ ಘೋಷಿಸಬೇಕು, ಮತ್ತು return type ಸೂಚಿಸಬೇಕು.

```swift
var canDecrease: Bool {
    count > 1
}
```

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಸಂಖ್ಯಾತ್ಮಕ ಮೌಲ್ಯವನ್ನು ಮಾತ್ರವಲ್ಲ, judgment result, text content, ಅಷ್ಟೇ ಅಲ್ಲ SwiftUI ವ್ಯೂ content ಅನ್ನು ಕೂಡ return ಮಾಡಬಹುದು.

ಈ ಪಾಠದಲ್ಲಿ ನಾವು `return` ಕೂಡ ಕಲಿತೇವೆ.

`return` ಎಂದರೆ ಫಲಿತಾಂಶವನ್ನು return ಮಾಡುವುದು:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ ಒಳಗೆ ಫಲಿತಾಂಶ ನೀಡುವ ಒಂದೇ expression ಇದ್ದರೆ, `return` ಅನ್ನು ಬಿಡಬಹುದು.

```swift
var totalPrice: Int {
    count * price
}
```

ಇನ್ನೂ ನಾವು `Color.primary` ಮತ್ತು `disabled` ಬಗ್ಗೆ ತಿಳಿದುಕೊಂಡೇವೆ.

`Color.primary` SwiftUI ಯ system semantic color. ಇದು Light Mode ಮತ್ತು Dark Mode ಪ್ರಕಾರ ಸ್ವಯಂಚಾಲಿತವಾಗಿ display effect ಅನ್ನು ಹೊಂದಿಸುತ್ತದೆ.

```swift
.foregroundStyle(Color.primary)
```

`disabled` ವ್ಯೂ disabled ಆಗಿದೆಯೇ ಇಲ್ಲವೇ ಎಂಬುದನ್ನು ನಿಯಂತ್ರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

```swift
.disabled(true)
```

ಇದು disabled, ಕ್ಲಿಕ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

```swift
.disabled(false)
```

ಇದು available, ಕ್ಲಿಕ್ ಮಾಡಬಹುದು ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

ಆದ್ದರಿಂದ ಕಂಪ್ಯೂಟೆಡ್ ಪ್ರಾಪರ್ಟಿ SwiftUI ನಲ್ಲಿ ಬಹಳ ಸಾಮಾನ್ಯ. ಇದು ಲೆಕ್ಕಿಸಿದ ಫಲಿತಾಂಶಗಳು, condition ಗಳು ಮತ್ತು display content ಅನ್ನು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗಿ ಸಂಘಟಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.
