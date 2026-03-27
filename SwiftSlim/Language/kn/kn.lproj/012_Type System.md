# ಪ್ರಕಾರ ವ್ಯವಸ್ಥೆ

ಹಿಂದಿನ ಪಾಠಗಳಲ್ಲಿ ನಾವು variables ಬಗ್ಗೆ ಕಲಿತಿದ್ದೇವೆ, ಮತ್ತು variables ವಿಭಿನ್ನ ಪ್ರಕಾರದ data ಅನ್ನು ಸಂಗ್ರಹಿಸಬಹುದು ಎಂಬುದನ್ನು ತಿಳಿದಿದ್ದೇವೆ.

ಉದಾಹರಣೆಗೆ:

```swift
var hello = "Hello, World"
```

ಇಲ್ಲಿ `hello` ಒಂದು ಪಠ್ಯ ಮೌಲ್ಯವನ್ನು ಹೊಂದಿದೆ, ಆದ್ದರಿಂದ ಅದರ type `String`.

ಈಗ ಮುಂದೆ ನಾವು type (ಪ್ರಕಾರ) ಎಂಬ ಪರಿಕಲ್ಪನೆಯನ್ನು, explicit type declaration ಹಾಗೂ type inference ಅನ್ನು ವ್ಯವಸ್ಥಿತವಾಗಿ ಕಲಿಯುತ್ತೇವೆ, ಇದರಿಂದ variable ಗಳ ಸ್ವಭಾವವನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

## ಪ್ರಕಾರ ಎಂದರೆ ಏನು

Swift ನಲ್ಲಿ ಪ್ರತಿಯೊಂದು value ಕ್ಕೆ ಸ್ಪಷ್ಟವಾದ type ಇರುತ್ತದೆ. ಆ type ಆ value ಏನು ಮತ್ತು ಅದು ಏನು ಮಾಡಬಹುದು ಎಂಬುದನ್ನು ನಿರ್ಧರಿಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

- `42` ಒಂದು `Int` (ಪೂರ್ಣಾಂಕ)
- `"Hello"` ಒಂದು `String` (ಸ್ಟ್ರಿಂಗ್)
- `true` ಒಂದು `Bool` (ಬೂಲಿಯನ್ ಮೌಲ್ಯ)

ಇವು ವಿಭಿನ್ನ type ಗಳು ಹಾಗೂ ಅವುಗಳ ಬಳಕೆಗಳೂ ವಿಭಿನ್ನ.

## Swift ನಲ್ಲಿ ಸಾಮಾನ್ಯ ಮೂಲ ಪ್ರಕಾರಗಳು

ಆರಂಭಿಕ ಹಂತದಲ್ಲಿ ಹೆಚ್ಚು ಬಳಸುವ type ಗಳು ಇವು:

- `String`: ಸ್ಟ್ರಿಂಗ್ (ಪಠ್ಯ)
- `Int`: ಪೂರ್ಣಾಂಕ
- `Double`: ದಶಮಾಂಶ ಸಂಖ್ಯೆ (ಹೆಚ್ಚು ನಿಖರತೆ)
- `Bool`: ಬೂಲಿಯನ್ ಮೌಲ್ಯ (`true/false`)

ಇವುಗಳ ಹೊರತಾಗಿ `Float` (ದಶಮಾಂಶ ಸಂಖ್ಯೆ, ಆದರೆ `Double` ಕ್ಕಿಂತ ಕಡಿಮೆ ನಿಖರತೆ) ಮತ್ತು `Character` (ಒಂದು ಅಕ್ಷರ), ಉದಾಹರಣೆಗೆ `"A"`, `"!"`, ಇತ್ಯಾದಿ ಸಹ ಇವೆ.

### ಪ್ರಕಾರ ಘೋಷಣೆ (Explicit Type)

Swift ನಲ್ಲಿ variable ಘೋಷಿಸುವಾಗ type ಅನ್ನು ಕೈಯಾರೆ ನಿರ್ದಿಷ್ಟಪಡಿಸಬಹುದು:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

variable ಹೆಸರಿನ ನಂತರ `: Type` ಸೇರಿಸಿ variable type ಘೋಷಿಸಲಾಗುತ್ತದೆ.

array type ಅನ್ನು `: [Type]` ರೂಪದಲ್ಲಿ ಬರೆಯಲಾಗುತ್ತದೆ:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

ಈ ಕೋಡ್‌ನಲ್ಲಿ `scores` array ಯಲ್ಲಿ `Int` type ಅಂಶಗಳಷ್ಟೇ ಇರಬಹುದು; `tags` ನಲ್ಲಿ `String` ಅಂಶಗಳಷ್ಟೇ ಇರಬಹುದು.

Explicit type declaration ಕೋಡ್ ಉದ್ದೇಶವನ್ನು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟಗೊಳಿಸುತ್ತದೆ ಮತ್ತು ಕೆಲವು ಸಂದರ್ಭಗಳಲ್ಲಿ type inference ದೋಷಗಳನ್ನು ತಪ್ಪಿಸುತ್ತದೆ.

## ಪ್ರಕಾರ ನಿರ್ಗಮನ

ಅನೇಕ ಸಂದರ್ಭಗಳಲ್ಲಿ type ಅನ್ನು explicit ಆಗಿ ಬರೆಯದೇ ಇರಬಹುದು:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

ಇದಕ್ಕೆ ಕಾರಣ, Swift compiler "initial value" ಆಧರಿಸಿ type ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ infer ಮಾಡುತ್ತದೆ.

## Explicit declaration ಮತ್ತು type inference

ಹಿಂದಿನ ಪಾಠಗಳಲ್ಲಿ ನಾವು explicit declaration ಅನ್ನು ಪರಿಚಯಿಸಲಿಲ್ಲ, ಉದಾಹರಣೆಗೆ:

```swift
var age: Int = 18
```

ಅದರ ಬದಲು ಮೊದಲು type inference ವಿಧಾನವನ್ನು ಬಳಸಿದ್ದೇವೆ:

```swift
var age = 18
```

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ ಎರಡೂ ಬರಹಗಳು ಸಮಾನ. ಎರಡರಲ್ಲಿಯೂ `age` ಅನ್ನು `Int` ಎಂದು ನಿರ್ಧರಿಸಲಾಗುತ್ತದೆ. ಹೋಲಿಸಿದರೆ type inference ಇನ್ನಷ್ಟು ಸರಳ ಮತ್ತು ಚುಟುಕಾಗಿದೆ.

ಆರಂಭದಲ್ಲೇ explicit declaration ಗೆ ಒತ್ತು ಕೊಡದಿರುವುದಕ್ಕೆ ಕಾರಣ, type inference ಕೋಡ್‌ನಲ್ಲಿರುವ ಹೆಚ್ಚುವರಿ ಮಾಹಿತಿಯನ್ನು ಕಡಿಮೆ ಮಾಡುತ್ತದೆ. ಇದರಿಂದ ಪ್ರಾರಂಭಿಕರ ಅಧ್ಯಯನ ವೆಚ್ಚವೂ ಕಡಿಮೆಯಾಗುತ್ತದೆ.

## ಪ್ರಕಾರಗಳು ಯಾಕೆ ಬೇಕು

Swift ಒಂದು strongly typed language.

ಅಂದರೆ: ಒಂದು ಬಾರಿ variable type ನಿರ್ಧಾರವಾದ ಮೇಲೆ, ಅದನ್ನು ಮನಬಂದಂತೆ ಬದಲಾಯಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

ಮೊದಲ `20` ಒಂದು `Int`, ಆದ್ದರಿಂದ ಅದನ್ನು `age` ಗೆ assign ಮಾಡಬಹುದು. ಎರಡನೆಯ `"20"` ಒಂದು `String`, ಅದು `Int` ಗೆ ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ; ಆದ್ದರಿಂದ error ಬರುತ್ತದೆ.

`nums` ಒಂದು `[Int]` type array ಆಗಿರುವುದರಿಂದ, ಅದರಲ್ಲಿ integers ಮಾತ್ರ ಇರಬೇಕು. string ಸೇರಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.

type ಗಳು data ಬಳಕೆಗೆ ನಿಯಂತ್ರಣ ಹೇರಿಕೆ ಮಾಡುತ್ತವೆ. compile ಹಂತದಲ್ಲೇ type mismatch ಗಳನ್ನು ಪತ್ತೆಹಚ್ಚಿ, type ಗೊಂದಲದಿಂದ ಉಂಟಾಗುವ BUG ಗಳನ್ನು ಕಡಿಮೆ ಮಾಡುತ್ತವೆ ಮತ್ತು ಕೋಡ್‌ನ ಸ್ಥಿರತೆ ಹಾಗೂ maintainability ಯನ್ನು ಹೆಚ್ಚಿಸುತ್ತವೆ.

## ಯಾವಾಗ explicit type declaration ಅನಿವಾರ್ಯ

Swift ಅನೇಕ ಸಂದರ್ಭಗಳಲ್ಲಿ type ಅನ್ನು ಸ್ವಯಂ infer ಮಾಡಬಲ್ಲದು. ಆದರೆ compiler infer ಮಾಡಲಾರದೇ ಇರುವ ಅಥವಾ ತಪ್ಪಾಗಿ infer ಮಾಡುವ ಕೆಲವು ಸಂದರ್ಭಗಳಲ್ಲಿ type ಅನ್ನು ಕೈಯಾರೆ ಘೋಷಿಸಬೇಕು.

**1. ಖಾಲಿ ಅರೆ**

empty array ರಚಿಸುವಾಗ type ಅನ್ನು explicit ಆಗಿ ಘೋಷಿಸಲೇಬೇಕು:

```swift
var nums: [Int] = []
```

type ಬರೆಯದೇ ಇದ್ದರೆ:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

compiler ಗೆ ಖಾಲಿ array ಯಲ್ಲಿನ ಅಂಶಗಳ type ಅನ್ನು ಊಹಿಸಲಾಗುವುದಿಲ್ಲ; ಆದ್ದರಿಂದ compile error ಬರುತ್ತದೆ.

**2. ತಪ್ಪಾದ inference ಅನ್ನು ತಪ್ಪಿಸುವುದು**

```swift
var value = 10   // Int
```

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ `10` ಅನ್ನು `Double` ಆಗಿಯೂ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು, ಆದರೆ decimal point ಇಲ್ಲದಿರುವುದರಿಂದ compiler ಅದನ್ನು default ಆಗಿ `Int` ಎಂದು infer ಮಾಡುತ್ತದೆ.

`value` ಒಂದು floating-point number ಆಗಿರಬೇಕು ಎಂದರೆ, type ಅನ್ನು explicit ಆಗಿ ಘೋಷಿಸಬೇಕು:

```swift
var value: Double = 10   // Double
```

type inference ಫಲಿತಾಂಶ ನಿರೀಕ್ಷಿತವಾಗಿರದಿದ್ದರೆ, explicit declaration ಅಥವಾ literal ರೂಪವನ್ನು ಬದಲಾಯಿಸುವ ಮೂಲಕ ಸರಿಯಾದ type ಅನ್ನು ಖಚಿತಪಡಿಸಬೇಕು.

**3. ಕಸ್ಟಮ್ ಪ್ರಕಾರಗಳು**

ಮುಂದೆ ನಾವು custom types ಗಳನ್ನೂ ಕಲಿಯುತ್ತೇವೆ. custom type ಗಳನ್ನು ಬಳಸುವಾಗ ಸಹ ಸಾಮಾನ್ಯವಾಗಿ explicit declaration ಅಗತ್ಯವಿರುತ್ತದೆ:

```swift
var info: GameInfo
var users: [User] = []
```

ಇದರ ಕಾರಣವೂ ಖಾಲಿ array ಯಂತೆಯೇ: compiler ಗೆ ಖಾಲಿ value ನಿಂದ type infer ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.

## ಪ್ರಕಾರ ಪರಿವರ್ತನೆ

Swift ನಲ್ಲಿ ವಿಭಿನ್ನ type ಗಳ ನಡುವೆ ಸ್ವಯಂ ಪರಿವರ್ತನೆ ಆಗುವುದಿಲ್ಲ; ಕೈಯಾರೆ convert ಮಾಡಬೇಕು.

ಉದಾಹರಣೆಗೆ, ಎರಡು ವಿಭಿನ್ನ type ಗಳ ಸಂಖ್ಯೆಗಳ ಸೇರ್ಪಡೆ:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

ಇಲ್ಲಿ `a` ಒಂದು `Int`, `b` ಒಂದು `Double`. type ಗಳು ಬೇರೆಬೇರೆ ಆದ್ದರಿಂದ ನೇರವಾಗಿ ಗಣನೆ ಮಾಡಲಾಗುವುದಿಲ್ಲ.

ಗಣನೆ ಮಾಡುವ ಮೊದಲು, ಒಂದು value ಯನ್ನು ಇನ್ನೊಂದರ type ಗೆ ಪರಿವರ್ತಿಸಬೇಕು:

```swift
var result = Double(a) + b
```

ಈ ಕೋಡ್ `a` ಎಂಬ `Int` ಅನ್ನು `Double` ಗೆ ಪರಿವರ್ತಿಸಿ, ನಂತರ `b` ಜೊತೆ ಸೇರಿಸಿ `result` ಗೆ assign ಮಾಡುತ್ತದೆ.

ಗಮನಿಸಿ, type conversion ಮೂಲ variable type ಅನ್ನು ಬದಲಾಯಿಸುವುದಿಲ್ಲ. ಉದಾಹರಣೆಗೆ `Double(a)` ಎಂದರೆ `a` ಯ `Int` type ಬದಲಾಗುವುದಿಲ್ಲ; ಬದಲಿಗೆ ಗಣನೆಗೆ ಬಳಸಲು ಹೊಸ `Double` value ಸೃಷ್ಟಿಯಾಗುತ್ತದೆ.

ಇತರೆ type ಗಳನ್ನೂ ಇದೇ ರೀತಿಯಲ್ಲಿ convert ಮಾಡಬಹುದು: target type + `()` ರೂಪದಲ್ಲಿ value ಅನ್ನು ಒಳಗೆ ಪಾಸು ಮಾಡಬೇಕು.

```
Int()、Double()、String()
```

ಉದಾಹರಣೆ:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

ಗಮನಿಸಬೇಕಾದದ್ದು: ಎಲ್ಲಾ type conversion ಗಳು ಯಶಸ್ವಿಯಾಗುವುದಿಲ್ಲ. ಉದಾಹರಣೆಗೆ `Double → Int` ಆಗುವಾಗ ದಶಮಾಂಶ ಭಾಗವನ್ನು ನೇರವಾಗಿ truncate ಮಾಡುತ್ತದೆ; round ಮಾಡುವುದಿಲ್ಲ.

## ಪ್ರಕಾರ ಬದಲಿ ಹೆಸರು

Swift ನಲ್ಲಿ ಇರುವ type ಗೆ alias ಕೊಟ್ಟು, ಕೋಡ್‌ನ ಅರ್ಥವನ್ನು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟಗೊಳಿಸಬಹುದು:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

ಇಲ್ಲಿ `UserID` ಮೂಲತಃ ಇನ್ನೂ `Int` ಆಗಿಯೇ ಉಳಿಯುತ್ತದೆ; ಬದಲಾಗುವುದು ಹೆಸರಷ್ಟೇ. ಆದರೆ ಅದರಿಂದ ಅರ್ಥ ಮತ್ತಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

ದೊಡ್ಡ ಕೋಡ್‌ಬೇಸ್ ಅಥವಾ ಸಂಕೀರ್ಣ type ಗಳಿರುವ project ಗಳಲ್ಲಿ type alias ಕೋಡ್ ಅನ್ನು ಹೆಚ್ಚು ಓದಿಸಬಲ್ಲದಾಗಿಸುತ್ತದೆ.

## ಪ್ರಕಾರ ಉದಾಹರಣೆ

ಈಗ ಒಂದು ಸರಳ ಉದಾಹರಣೆಯ ಮೂಲಕ type ನ ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿನ ಪಾತ್ರವನ್ನು ನೋಡೋಣ.

### variable ರಚಿಸುವುದು

ಮೊದಲು, `age` ಎಂಬ variable ರಚಿಸೋಣ:

```swift
var age = 20
```

ಈ variable ಅನ್ನು SwiftUI ನಲ್ಲಿ ತೋರಿಸಬೇಕಾಗಿಯೂ ಬದಲಾಯಿಸಬೇಕಾಗಿಯೂ ಇರುವುದರಿಂದ, ಇದನ್ನು `@State` ಮೂಲಕ ಘೋಷಿಸಬೇಕು:

```swift
@State private var age = 20
```

`private` ಅನ್ನು ಹಿಂದೆಯೇ ಉಲ್ಲೇಖಿಸಿದ್ದೇವೆ. ಇದು ಈ variable ಅನ್ನು current view ಒಳಗೆ ಮಾತ್ರ ಬಳಸಬಹುದು ಎಂಬುದನ್ನು ಸೂಚಿಸುತ್ತದೆ. ಮುಂದಕ್ಕೆ ಇದನ್ನು ಮತ್ತಷ್ಟು ಕಲಿಯುತ್ತೇವೆ.

### SwiftUI ನಲ್ಲಿ data ಪ್ರದರ್ಶಿಸುವುದು

SwiftUI ಯಲ್ಲಿ `age` variable ಅನ್ನು ಹೀಗೆ ತೋರಿಸಬಹುದು:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

ಈಗ view ಹೀಗಾಗಿ ತೋರುತ್ತದೆ:

```swift
age: 20
```

### data ಬದಲಾಯಿಸುವುದು

ಮುಂದೆ, `age` ಅನ್ನು ಬದಲಾಯಿಸಲು ಎರಡು buttons ಸೇರಿಸೋಣ:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### ರನ್ ಫಲಿತಾಂಶ

`changeAge1` ಒತ್ತಿದಾಗ, `age` ಗೆ 18 assign ಆಗುತ್ತದೆ:

```swift
age = 18
```

`18` ಒಂದು `Int` type ಆಗಿದ್ದು, `age` type ಜೊತೆಗೆ ಹೊಂದುವುದರಿಂದ assignment ಯಶಸ್ವಿಯಾಗುತ್ತದೆ.

`changeAge2` error ಕೊಡುತ್ತದೆ:

```swift
age = "18"
```

error ಮಾಹಿತಿ:

```
Cannot assign value of type 'String' to type 'Int'
```

ಇದಕ್ಕೆ ಕಾರಣ `"18"` ಒಂದು `String` type (string ಗಳನ್ನು `""` ಒಳಗೆ ಬರೆಯಬೇಕು), ಆದರೆ `age` ಒಂದು `Int`. ಎರಡರ type ಬೇರೆ ಆದ್ದರಿಂದ assign ಮಾಡಲಾಗುವುದಿಲ್ಲ.

### ಯಾಕೆ error ಬರುತ್ತದೆ?

ಮುಖ್ಯ ಕಾರಣ ಈ ಸಾಲು:

```swift
@State private var age = 20   // Int
```

ಇಲ್ಲಿ explicit type declaration ಇಲ್ಲದಿದ್ದರೂ, initial value `20` ಒಂದು `Int` ಆಗಿರುವುದರಿಂದ compiler `age` ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ `Int` ಎಂದು infer ಮಾಡುತ್ತದೆ.

ಒಮ್ಮೆ type ನಿರ್ಧಾರವಾದ ಮೇಲೆ, ಅದಕ್ಕೆ ಬೇರೆ type value assign ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.

ಇನ್ನೂ ಒಂದು ಮುಖ್ಯ ವಿಷಯ: `changeAge2` button ನಲ್ಲಿ ತೋರಿದ ಸಮಸ್ಯೆ "runtime" ನಲ್ಲಿ ಅಲ್ಲ, compile ಹಂತದಲ್ಲಿಯೇ error ಆಗುತ್ತದೆ. ಆದ್ದರಿಂದ ಕೋಡ್ compile ಆಗುವುದೇ ಇಲ್ಲ.

ಇದೇ Swift ನ strong typing ನ ಮಹತ್ವಗಳಲ್ಲಿ ಒಂದು: ಕೋಡ್ ಬರೆಯುವಾಗಲೇ type ಸಮಸ್ಯೆಗಳನ್ನು ಮುಂಚಿತವಾಗಿ ಹಿಡಿಯುತ್ತದೆ.

### ಸರಿಯಾದ ಬರಹ

ತಪ್ಪಾದ code ಅನ್ನು ತೆಗೆದ ನಂತರ:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

`changeAge1` button ಒತ್ತಿದ ನಂತರ, view ಹೀಗಾಗಿ update ಆಗುತ್ತದೆ:

```
age: 18
```

### Explicit type declaration (ಐಚ್ಛಿಕ)

ವ್ಯಾಖ್ಯಾನ ಮಾಡುವಾಗ type ಅನ್ನು ಸ್ಪಷ್ಟವಾಗಿ ಹೀಗೂ ಬರೆಯಬಹುದು:

```swift
@State private var age: Int = 20
```

ಈ ರೀತಿಯ ಬರಹ type ಅನ್ನು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟಗೊಳಿಸುತ್ತದೆ, ಆದರೆ ಸರಳ ಸಂದರ್ಭಗಳಲ್ಲಿ ಅದು ಕಡ್ಡಾಯವಲ್ಲ.

## ಸಂಗ್ರಹ

ಈ ಪಾಠದಲ್ಲಿ ಮುಖ್ಯವಾಗಿ Swift ನ type system ಮತ್ತು ಅದು ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಮಾಡುವ ಪಾತ್ರದ ಬಗ್ಗೆ ತಿಳಿಯಿತು.

Swift ನಲ್ಲಿ ಪ್ರತಿಯೊಂದು value ಗೆ ಸ್ಪಷ್ಟವಾದ type ಇರುತ್ತದೆ. data ಯ ಅರ್ಥ ಹಾಗೂ ಅದರಲ್ಲಿ ಯಾವ operations ಮಾಡಬಹುದು ಎಂಬುದನ್ನು type ನಿರ್ಧರಿಸುತ್ತದೆ.

Swift ಒಂದು strong type language. variable type ನಿಗದಿಯಾದ ನಂತರ ಅದಕ್ಕೆ ಬೇರೆ type value assign ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ. ಈ ನಿಯಂತ್ರಣ compile ಹಂತದಲ್ಲಿಯೇ errors ಹಿಡಿದು, runtime ಸಮಸ್ಯೆಗಳನ್ನು ಕಡಿಮೆ ಮಾಡಿ, ಕೋಡ್ ಸುರಕ್ಷತೆಯನ್ನು ಹೆಚ್ಚಿಸುತ್ತದೆ.

variable type ಅನ್ನು initial value ಆಧರಿಸಿ ಸ್ವಯಂ infer ಮಾಡಬಹುದು; ಅಥವಾ explicit ಆಗಿ ಘೋಷಿಸಬಹುದು. ಕೆಲವು ಸಂದರ್ಭಗಳಲ್ಲಿ (ಉದಾ. empty array, ತಪ್ಪಾದ type inference, custom types) compiler ಸರಿಯಾಗಿ infer ಮಾಡಲಾರದು. ಆಗ explicit declaration ಕಡ್ಡಾಯ.

ವಿಭಿನ್ನ type ಗಳ ನಡುವೆ automatic conversion ಇರುವುದಿಲ್ಲ. `Int()`, `Double()`, `String()` ಇತ್ಯಾದಿಗಳ ಮೂಲಕ explicit conversion ಮಾಡಬೇಕು.

type ಗಳಿಗೆ aliases ಕೂಡ ಕೊಡಬಹುದು. ವಿಶೇಷವಾಗಿ ದೊಡ್ಡ project ಗಳಲ್ಲಿ type alias ಓದುಗತೆಗೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ.

type ಎನ್ನುವುದು ಕೇವಲ data label ಅಲ್ಲ; ಅದು ಒಂದು ನಿಯಂತ್ರಣ ವ್ಯವಸ್ಥೆಯೂ ಹೌದು. ಇದರಿಂದ data ಬಳಕೆ ಸುರಕ್ಷಿತ, ಸ್ಪಷ್ಟ ಮತ್ತು ನಿಯಂತ್ರಿತವಾಗಿರುತ್ತದೆ.

## ವಿಸ್ತೃತ ಜ್ಞಾನ - ಐಚ್ಛಿಕ ಪ್ರಕಾರ

type conversion ಮಾಡುವಾಗ ಕೆಲವು operations ವಿಫಲವಾಗಬಹುದು.

ಉದಾಹರಣೆಗೆ, `String` ಅನ್ನು `Double` ಆಗಿ ಪರಿವರ್ತಿಸುವುದು:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

ಇಲ್ಲಿ `Double(input)` ಹಿಂತಿರುಗಿಸುವುದು `Double` ಅಲ್ಲ, ಬದಲಿಗೆ:

```
Double?
```

ಇದೇ Optional type.

### ಯಾಕೆ Optional type ಹಿಂತಿರುಗುತ್ತದೆ?

ಏಕೆಂದರೆ string ಒಳಗಿನ ವಿಷಯ ನಿಶ್ಚಿತವಾಗಿರುವುದಿಲ್ಲ. `"3.14"` ಅನ್ನು `Double` ಆಗಿ ಪರಿವರ್ತಿಸಬಹುದು; `"Hello"` ಅನ್ನು ಸಾಧ್ಯವಿಲ್ಲ.

ಅಂದರೆ, ಈ operation ಯಶಸ್ವಿಯಾಗಬಹುದು ಅಥವಾ ವಿಫಲವಾಗಬಹುದು.

ಹೀಗಾಗಿ ಈ ಅನಿಶ್ಚಿತತೆಯನ್ನು ಸೂಚಿಸಲು Swift Optional type ಬಳಸುತ್ತದೆ.

### Optional type ಎಂದರೆ ಏನು?

Optional type ಅಂದರೆ: ಒಂದು value ಇರಬಹುದು, ಇಲ್ಲದೇ ಇರಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```
Double?
```

ಈ type ಗೆ value ಇದ್ದರೆ ಮುದ್ರಿಸಿದಾಗ `Optional(...)` ಎಂದು ತೋರಿಸುತ್ತದೆ; value ಇಲ್ಲದಿದ್ದರೆ `nil` ಬರುತ್ತದೆ.

ಗಮನಿಸಿ, `nil` ಎಂದರೆ "ಯಾವುದೇ ಮೌಲ್ಯವಿಲ್ಲ" ಎಂಬರ್ಥ. ಅದು 0 ಅಥವಾ ಖಾಲಿ string ಅಲ್ಲ.

### ಉದಾಹರಣೆ

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

ಔಟ್ಪುಟ್:

```
pi:Optional(3.14)
```

ಅಂದರೆ string ಯಶಸ್ವಿಯಾಗಿ `Double` ಗೆ ಪರಿವರ್ತಿತವಾಗಿದೆ ಮತ್ತು 3.14 ದೊರೆತಿದೆ. ಆದರೆ type `Double?` ಆಗಿರುವುದರಿಂದ ಅದು Optional ಒಳಗೆ ಹೊದಿಸಲಾಗಿದೆ.

ಪರಿವರ್ತನೆ ವಿಫಲವಾದರೆ:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

ಔಟ್ಪುಟ್:

```
pi: nil
```

ಏಕೆಂದರೆ `"Hello"` ಅನ್ನು `Double` ಆಗಿ ಪರಿವರ್ತಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ. ಆದ್ದರಿಂದ conversion ವಿಫಲವಾಗಿ `nil` ಹಿಂತಿರುಗಿಸುತ್ತದೆ.

### Optional(...) ಎಂದರೆ ಏನು?

Optional type ಅನ್ನು ನೇರವಾಗಿ print ಮಾಡಿದಾಗ:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift ಅದರ "debug description" ಅನ್ನು ತೋರಿಸುತ್ತದೆ:

```
Optional(3.14)
```

ಇದು actual data ಯ ಭಾಗವಲ್ಲ; ಈ value ಒಂದು "optional type" ಆಗಿದ್ದು, ಅದರೊಳಗೆ ಒಂದು value ಇದೆ ಎಂಬ ಸೂಚನೆ ಮಾತ್ರ.

### Optional ಅನ್ನು unwrap ಮಾಡುವುದು

ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ Optional ನ ಒಳಗಿನ ನಿಜವಾದ value ಅನ್ನು ತೆಗೆದುಕೊಳ್ಳಬೇಕಾಗುತ್ತದೆ. ಈ ಪ್ರಕ್ರಿಯೆಯನ್ನು unwrapping ಎಂದು ಕರೆಯುತ್ತಾರೆ.

ಸಾಮಾನ್ಯ ವಿಧಾನಗಳಲ್ಲಿ ಒಂದು `??` ಬಳಸಿ default value ಒದಗಿಸುವುದು:

```
??
```

ಇದನ್ನು Nil-Coalescing Operator ಎಂದು ಕರೆಯುತ್ತಾರೆ.

ಉದಾಹರಣೆಗೆ:

```swift
name ?? "FangJunyu"
```

ಈ ಕೋಡ್ ಅರ್ಥ: `name` ಗೆ value ಇದ್ದರೆ ಅದನ್ನೇ ಹಿಂತಿರುಗಿಸು; ಅದು `nil` ಆಗಿದ್ದರೆ default value `"FangJunyu"` ಬಳಸು.

ಗಮನಿಸಿ, default value ಯ type Optional ನ ಒಳಗಿನ type ಗೆ ಹೊಂದಬೇಕು.

### ?? ಬಳಸಿ default value ನೀಡುವುದು

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

ಔಟ್ಪುಟ್:

```
pi: 30
```

`input` `Double` ಗೆ ಪರಿವರ್ತಿತವಾಗುವಾಗ conversion ಯಶಸ್ವಿಯಾದ್ದರಿಂದ value ಯನ್ನೇ output ಮಾಡುತ್ತದೆ. conversion ವಿಫಲವಾದರೆ `??` ಒದಗಿಸಿದ default value output ಆಗುತ್ತದೆ.

conversion ವಿಫಲವಾದರೆ:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

ಔಟ್ಪುಟ್:

```
pi: 10
```

ಇಲ್ಲಿ `input` ಅನ್ನು `Double` ಗೆ ಪರಿವರ್ತಿಸುವಾಗ conversion ವಿಫಲವಾಗಿ `nil` ಹಿಂತಿರುಗುತ್ತದೆ. ಆಗ `??` `nil` ಗೆ default value ಒದಗಿಸುತ್ತದೆ.

Optional type ಅನ್ನು "ಮೌಲ್ಯ ಇರಬಹುದು, ಇಲ್ಲದಿರಬಹುದು" ಎನ್ನುವ ಪರಿಸ್ಥಿತಿಯನ್ನು ಸೂಚಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

type conversion ಮುಂತಾದ ವಿಫಲವಾಗಬಹುದಾದ operations ಗಳಲ್ಲಿ Swift ಸುರಕ್ಷತೆಗೆ Optional type ಹಿಂತಿರುಗಿಸುತ್ತದೆ.

ಅದರೊಳಗಿನ ಮೌಲ್ಯವನ್ನು ಬಳಸಬೇಕಾದಾಗ, `??` ಮೂಲಕ default value ಒದಗಿಸಿ, `nil` ಬಂದರೂ ಸಮಂಜಸವಾದ ಫಲಿತಾಂಶ ಪಡೆಯಬಹುದು.
