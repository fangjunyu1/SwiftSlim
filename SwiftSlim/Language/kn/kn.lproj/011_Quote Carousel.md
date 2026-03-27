# ಉಲ್ಲೇಖ ಕ್ಯಾರಸೆಲ್

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು "ಉಲ್ಲೇಖ ಕ್ಯಾರಸೆಲ್" ಎಂಬ ವೈಶಿಷ್ಟ್ಯವನ್ನು ನಿರ್ಮಿಸುತ್ತೇವೆ ಮತ್ತು Swift ನ ಮೂಲಭೂತ ಜ್ಞಾನಗಳಾದ ಅರೆ (Array) ಹಾಗೂ ಶರತ್ತು ನಿರ್ಧಾರ ವಾಕ್ಯಗಳು (if-else) ಬಗ್ಗೆ ಆಳವಾಗಿ ಕಲಿಯುತ್ತೇವೆ.

ನಾವು ಹಲವು ಉಲ್ಲೇಖಗಳನ್ನು ಹೇಗೆ ಉಳಿಸಬಹುದು ಹಾಗೂ ಬಟನ್ ಸಂವಹನದ ಮೂಲಕ ಅವನ್ನು ವಲಯವಾಗಿ ಹೇಗೆ ಪ್ರದರ್ಶಿಸಬಹುದು ಎಂಬುದನ್ನು ನೋಡುತ್ತೇವೆ.

![alt text](../../RESOURCE/011_word.png)

## ಉಲ್ಲೇಖವನ್ನು ಪ್ರದರ್ಶಿಸುವುದು

ಮೊದಲು, SwiftUI ನಲ್ಲಿ ಒಂದು ಉಲ್ಲೇಖವನ್ನು ಪ್ರದರ್ಶಿಸಬೇಕು.

ಅತ್ಯಂತ ಸರಳವಾದ ವಿಧಾನವೆಂದರೆ Text view ಬಳಸುವುದು:

```swift
Text("Slow progress is still progress.")
```

ಈ ಕೋಡ್ ಒಂದು ನಿಶ್ಚಿತ ಉಲ್ಲೇಖವನ್ನು ಮಾತ್ರ ತೋರಿಸುತ್ತದೆ. ಅನೇಕ ಉಲ್ಲೇಖಗಳನ್ನು ತೋರಿಸಿ ಅವುಗಳ ನಡುವೆ ಬದಲಾವಣೆ ಮಾಡಲು, ಮೊದಲು ಅವನ್ನು ಸಂಗ್ರಹಿಸಬೇಕು.

ಆದರೆ ಸಾಮಾನ್ಯ string variable ಒಂದೇ ಒಂದು ಉಲ್ಲೇಖವನ್ನು ಮಾತ್ರ ಸಂಗ್ರಹಿಸಬಹುದು:

```swift
let sayings = "Slow progress is still progress."
```

ಹಲವಾರು ಉಲ್ಲೇಖಗಳನ್ನು ಉಳಿಸಬೇಕಾದರೆ, ಪ್ರತಿಯೊಂದಕ್ಕೂ ಪ್ರತ್ಯೇಕ variable ಘೋಷಿಸಬೇಕಾಗುತ್ತದೆ:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

ಆದರೆ ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಈ ವಿಧಾನ ಕಿರಿಕಿರಿಯಾದುದಷ್ಟೇ ಅಲ್ಲ, ಪ್ರತಿಯೊಂದು variable ಸ್ವತಂತ್ರವಾಗಿರುವುದರಿಂದ ಲವಚಿಕವಾಗಿ ಕ್ಯಾರಸೆಲ್ ಬದಲಾವಣೆ ಮಾಡಲಾಗುವುದಿಲ್ಲ.

ಹಲವಾರು ಉಲ್ಲೇಖಗಳನ್ನು ಸುಲಭವಾಗಿ ನಿರ್ವಹಿಸಲು, ಅವನ್ನು ಒಂದೇ data structure ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಬೇಕು. ಅದೇ ಅರೆ (Array).

ಅರೆಯನ್ನು ಬಳಸಿದ ನಂತರ, ಮೇಲಿನ ಕೋಡ್ ಅನ್ನು ಹೀಗೆ ಸಂಗ್ರಹಿಸಬಹುದು:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**ಸೂಚನೆ: ಪ್ರೋಗ್ರಾಮಿಂಗ್ ರೂಢಿಯಲ್ಲಿ, ಅನೇಕ ಅಂಶಗಳನ್ನು ಸಂಗ್ರಹಿಸುವ array variable ಗಳು ಸಾಮಾನ್ಯವಾಗಿ plural ರೂಪದ ಹೆಸರನ್ನು ಬಳಸುತ್ತವೆ, ಉದಾಹರಣೆಗೆ sayings. ಇದರಿಂದ ಅದು ಒಂದು ಸಂಕಲನ ಎಂದು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.**

## ಅರೆ

Swift ನಲ್ಲಿ array ಎನ್ನುವುದು ಕ್ರಮಬದ್ಧ ಅಂಶಗಳನ್ನು ಸಂಗ್ರಹಿಸುವ collection ಆಗಿದ್ದು, ಅದನ್ನು square brackets `[]` ಮೂಲಕ ಸೂಚಿಸಲಾಗುತ್ತದೆ.

```swift
[]
```

ಅರೆಯ ಒಳಗೆ ಒಂದೇ ರೀತಿಯ ಹಲವಾರು ಅಂಶಗಳು ಇರಬಹುದು ಮತ್ತು ಅವುಗಳನ್ನು ಇಂಗ್ಲಿಷ್ comma `,` ಮೂಲಕ ಬೇರ್ಪಡಿಸಲಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
[101, 102, 103, 104, 105]
```

ಅರೆಯನ್ನು ಸರಳವಾಗಿ ರೈಲು ಬೋಗಿಗಳ ಸರಿಯಂತೆ ಕಲ್ಪಿಸಬಹುದು:

![Array](../../RESOURCE/011_array1.png)

ಪೂರಾ ರೈಲು ಆ array object ಅನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ, ಮತ್ತು ಪ್ರತಿಯೊಂದು ಬೋಗಿಯೂ ಕ್ರಮವಾಗಿ ಜೋಡಿಸಲಾಗಿರುತ್ತದೆ.

### ಸೂಚ್ಯಂಕ ಮತ್ತು ಅಂಶ ಪ್ರವೇಶ

array ಕ್ರಮಬದ್ಧವಾಗಿರುವುದರಿಂದ, ವ್ಯವಸ್ಥೆ ಕ್ರಮಾನುಸಾರ ನಿರ್ದಿಷ್ಟ ಅಂಶವನ್ನು ಪತ್ತೆಹಚ್ಚಬಹುದು. ಈ ವ್ಯವಸ್ಥೆಯನ್ನು index ಎಂದು ಕರೆಯುತ್ತಾರೆ.

Swift ನಲ್ಲಿ (ಮತ್ತು ಹೆಚ್ಚಿನ programming languages ಗಳಲ್ಲಿಯೂ), array index 1 ರಿಂದ ಅಲ್ಲ, 0 ರಿಂದ ಆರಂಭವಾಗುತ್ತದೆ. ಅಂದರೆ array ನ ಮೊದಲ ಅಂಶದ index 0, ಎರಡನೆಯದದ್ದು 1, ಹೀಗೆ ಮುಂದುವರೆಯುತ್ತದೆ.

![Array](../../RESOURCE/011_array2.png)

array ಯಲ್ಲಿನ ನಿರ್ದಿಷ್ಟ ಅಂಶವನ್ನು ಪ್ರವೇಶಿಸಲು, array ಹೆಸರಿನ ನಂತರ square brackets ಹಾಕಿ, ಅದರೊಳಗೆ ಬೇಕಾದ index value ಅನ್ನು ಬರೆಯಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

ಮಾನ್ಯ ವ್ಯಾಪ್ತಿಯನ್ನು ಮೀರಿದ index ಅನ್ನು ಪ್ರವೇಶಿಸಲು ಪ್ರಯತ್ನಿಸಿದರೆ, "Index Out of Range" ಸಮಸ್ಯೆ ಉಂಟಾಗುತ್ತದೆ. ಆದ್ದರಿಂದ array ಪ್ರವೇಶಿಸುವಾಗ index ಮಾನ್ಯ ವ್ಯಾಪ್ತಿಯಲ್ಲಿದೆಯೇ ಎಂಬುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಬೇಕು.

**ಸೂಚ್ಯಂಕ ಮೀರಿಕೆ**

ಉದಾಹರಣೆಗೆ, array ನಲ್ಲಿ 5 ಅಂಶಗಳಿದ್ದರೆ, ಮಾನ್ಯ index ವ್ಯಾಪ್ತಿ 0 ರಿಂದ 4 ರವರೆಗೆ. sayings[5] ಅನ್ನು ಪ್ರವೇಶಿಸಲು ಪ್ರಯತ್ನಿಸಿದರೆ, ಪ್ರೋಗ್ರಾಂಗೆ ಸಂಬಂಧಿಸಿದ "ಬೋಗಿ" ಸಿಗುವುದಿಲ್ಲ; ಇದರಿಂದ "index out of range" ದೋಷ ಉಂಟಾಗಿ app crash ಆಗಬಹುದು.

![Array](../../RESOURCE/011_array3.png)

### ಅರೆಯ ಮೇಲೆ ಕಾರ್ಯಾಚರಣೆ

ಅರೆಗಳು ಕೇವಲ ಸ್ಥಿರ ವ್ಯಾಖ್ಯಾನಕ್ಕೆ ಮಾತ್ರ ಸೀಮಿತವಲ್ಲ; ಅವುಗಳಲ್ಲಿ ಅಂಶಗಳನ್ನು ಸೇರಿಸುವುದು, ಅಳಿಸುವುದು, ಬದಲಿಸುವುದು ಮತ್ತು ಉದ್ದವನ್ನು ಪಡೆಯುವುದೂ ಸಾಧ್ಯ.

ಸೂಚನೆ: array ಅನ್ನು ಬದಲಾಯಿಸಬೇಕಾದರೆ `let` constant ಬದಲು `var` variable ಅನ್ನು ಬಳಸಬೇಕು.

**1. ಹೊಸ ಅಂಶ ಸೇರಿಸುವುದು**

array ಯ ಕೊನೆಯಲ್ಲಿ ಅಂಶ ಸೇರಿಸಲು `append` method ಬಳಸಬಹುದು:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. ಅಂಶ ಅಳಿಸುವುದು**

`remove(at:)` method ಮೂಲಕ ನಿರ್ದಿಷ್ಟ ಅಂಶವನ್ನು ಅಳಿಸಬಹುದು:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. ಅಂಶ ಬದಲಾಯಿಸುವುದು**

index ಬಳಸಿ array ಯ ಅಂಶವನ್ನು ನೇರವಾಗಿ ಬದಲಾಯಿಸಬಹುದು:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. ಅರೆಯ ಉದ್ದ ಎಣಿಸುವುದು**

`count` property ಬಳಸಿ array ಯ ಅಂಶಗಳ ಸಂಖ್ಯೆಯನ್ನು ಪಡೆಯಬಹುದು:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### ಅರೆಯನ್ನು ಬಳಸಿಕೊಂಡು ಉಲ್ಲೇಖ ಪ್ರದರ್ಶಿಸುವುದು

ಅನೇಕ ಉಲ್ಲೇಖಗಳನ್ನು ತೋರಿಸಲು, ಮೊದಲು ಅವನ್ನು array ಯಲ್ಲಿ ಸಂಗ್ರಹಿಸಿ, ನಂತರ index ಮೂಲಕ ಪ್ರವೇಶಿಸಿ ತೋರಿಸಬಹುದು.

ಮೊದಲು, `ContentView` ನಲ್ಲಿ sayings ಎಂಬ array ರಚಿಸಿ ಉಲ್ಲೇಖಗಳನ್ನು ಸಂಗ್ರಹಿಸೋಣ. ನಂತರ `Text` view ನಲ್ಲಿ index ಮೂಲಕ ಸಂಬಂಧಿಸಿದ ಉಲ್ಲೇಖವನ್ನು ಓದಿ ತೋರಿಸೋಣ:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

ಇಲ್ಲಿ `sayings[0]` ಎಂದರೆ array ಯಲ್ಲಿನ ಮೊದಲ ಉಲ್ಲೇಖ.

ಬೇರೆ ಉಲ್ಲೇಖವನ್ನು ತೋರಿಸಲು, square brackets ಒಳಗಿನ index value ಯನ್ನು ಬದಲಾಯಿಸಿದರೆ ಸಾಕು:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### ಉಲ್ಲೇಖದ ಸೂಚ್ಯಂಕವನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುವುದು

ಉಲ್ಲೇಖವನ್ನು ಡೈನಾಮಿಕ್ ಆಗಿ ಬದಲಾಯಿಸಲು, `Text` view ಒಳಗೆ index ಅನ್ನು "hardcode" ಮಾಡಬಾರದು.

ಪ್ರಸ್ತುತ ತೋರಿಸುತ್ತಿರುವ index value ಯನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಉಳಿಸುವ variable ಬೇಕು.

SwiftUI ನಲ್ಲಿ, ಬದಲಾಯಿಸಬಹುದಾದ index ಘೋಷಿಸಲು `@State` ಬಳಸಬಹುದು:

```swift
@State private var index = 0
```

`@State` ಮೂಲಕ ಹೊದಿಸಿದ variable ಅನ್ನು SwiftUI ಗಮನಿಸುತ್ತದೆ. `index` ಬದಲಾಗುತ್ತಿದ್ದಂತೆಯೇ SwiftUI view ಅನ್ನು ಮರು-render ಮಾಡಿ, ಸಂಬಂಧಿಸಿದ ಉಲ್ಲೇಖವನ್ನು ತೋರಿಸುತ್ತದೆ.

ಮುಂದೆ, array ಯಲ್ಲಿನ ಉಲ್ಲೇಖವನ್ನು ಡೈನಾಮಿಕ್ ಆಗಿ ಪಡೆಯಲು `sayings[index]` ಬಳಸುತ್ತೇವೆ:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

`index` value ಬದಲಾಗುವಾಗಲೆಲ್ಲ, `Text` ಬೇರೆ ಉಲ್ಲೇಖವನ್ನು ತೋರಿಸುತ್ತದೆ.

### ಬಟನ್ ಬಳಸಿ ಸೂಚ್ಯಂಕ ನಿಯಂತ್ರಿಸುವುದು

ಉಲ್ಲೇಖ ಬದಲಾವಣೆಯನ್ನು ನಿಯಂತ್ರಿಸಲು, `Button` ಬಳಸಿ `index` value ಯನ್ನು ಬದಲಾಯಿಸಬಹುದು. ಪ್ರತಿ ಬಾರಿ ಬಟನ್ ಒತ್ತಿದಾಗ `index` 1 ರಿಂದ ಹೆಚ್ಚಾಗುತ್ತದೆ:

```swift
Button("Next") {
    index += 1
}
```

ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ `index` 0ರಿಂದ 1 ಆಗುತ್ತದೆ, ಇದರಿಂದ view refresh ಆಗಿ `Text(sayings[index])` ಮುಂದಿನ ಉಲ್ಲೇಖವನ್ನು ಓದುತ್ತದೆ.

ಆದರೆ ಇಲ್ಲಿ ಒಂದು ಅಡಗಿರುವ ಸಮಸ್ಯೆ ಇದೆ: ಬಟನ್ ಅನ್ನು ಮರುಮರು ಒತ್ತಿದರೆ `index` array ವ್ಯಾಪ್ತಿಯನ್ನು ಮೀರಬಹುದು. ಇದು array index out-of-range ದೋಷಕ್ಕೆ ಕಾರಣವಾಗುತ್ತದೆ. ಉದಾಹರಣೆಗೆ, `index` 5 ತಲುಪಿದರೆ (array index range 0 ರಿಂದ 4), ಪ್ರೋಗ್ರಾಂ crash ಆಗುತ್ತದೆ.

array index ಮೀರದಂತೆ ತಡೆಯಲು, `index` array ವ್ಯಾಪ್ತಿಯೊಳಗೇ ಉಳಿಯುವಂತೆ ಶರತ್ತು ನಿಯಂತ್ರಣ ಸೇರಿಸಬೇಕು. ಇದಕ್ಕಾಗಿ `if-else` ವಾಕ್ಯವನ್ನು ಬಳಸಬಹುದು.

## ಶರತ್ತು ನಿಯಂತ್ರಣ: if-else ವಾಕ್ಯ

`if-else` ವಾಕ್ಯವು Swift ನಲ್ಲಿ ಅತ್ಯಂತ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸುವ conditional branching statement ಆಗಿದೆ. ಇದು condition ಸತ್ಯವೇ ಅಥವಾ ಸುಳ್ಳೇ ಎಂದು ಪರಿಶೀಲಿಸಿ, ಅದರ ಪ್ರಕಾರ ಬೇರೆಬೇರೆ code blocks ಗಳನ್ನು ಕಾರ್ಯಗತಗೊಳಿಸುತ್ತದೆ.

ಮೂಲ ರಚನೆ:

```swift
if condition {
    // condition true ಆಗಿದ್ದರೆ ನಡೆಯುವ ಕೋಡ್
} else {
    // condition false ಆಗಿದ್ದರೆ ನಡೆಯುವ ಕೋಡ್
}
```

`if` statement ನಲ್ಲಿ `condition` ಒಂದು Bool value ಆಗಿದ್ದು, ಅದು true ಅಥವಾ false ಆಗಿರುತ್ತದೆ. condition true ಆಗಿದ್ದರೆ `if` ಭಾಗದ ಕೋಡ್ ನಡೆಯುತ್ತದೆ; ಇಲ್ಲದಿದ್ದರೆ `else` ಭಾಗದ ಕೋಡ್ ನಡೆಯುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ `age` value 25. `if` statement `age > 18` ಸತ್ಯವೇ ಎಂದು ಪರೀಕ್ಷಿಸುತ್ತದೆ. condition ಸತ್ಯವಾಗಿರುವುದರಿಂದ `"Big Boy"` ಅನ್ನು ಮುದ್ರಿಸುತ್ತದೆ.

`else` ಭಾಗದ ಕೋಡ್ ಅಗತ್ಯವಿಲ್ಲದಿದ್ದರೆ ಅದನ್ನು ಬಿಟ್ಟುಬಿಡಬಹುದು:

```swift
if condition {
    // condition true ಆಗಿದ್ದರೆ ನಡೆಯುವ ಕೋಡ್
}
```

### ಶರತ್ತು ಬಳಸಿ ಸೂಚ್ಯಂಕ ವ್ಯಾಪ್ತಿ ನಿಯಂತ್ರಿಸುವುದು

array index ಮೀರದಂತೆ ತಡೆಯಲು, `if` statement ಬಳಸಿ `index` array ವ್ಯಾಪ್ತಿಯನ್ನು ಮೀರದಂತೆ ಮಾಡಬಹುದು:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

ತರ್ಕ ವಿಶ್ಲೇಷಣೆ: `sayings.count` ಮೌಲ್ಯ 5 (ಒಟ್ಟು 5 ಉಲ್ಲೇಖಗಳು), ಆದ್ದರಿಂದ `sayings.count - 1` ಮೌಲ್ಯ 4. ಇದೇ array ಯ ಕೊನೆಯ ಮಾನ್ಯ index.

`index` 4 ಕ್ಕಿಂತ ಚಿಕ್ಕದಿರುವವರೆಗೆ, ಬಟನ್ ಒತ್ತಿದಾಗ 1 ಹೆಚ್ಚಿಸುವುದು ಸುರಕ್ಷಿತ. `index` 4 ತಲುಪಿದ ಮೇಲೆ condition ಸತ್ಯವಾಗುವುದಿಲ್ಲ, ಹಾಗಾಗಿ ಬಟನ್ ಒತ್ತಿದರೂ ಏನೂ ಆಗುವುದಿಲ್ಲ.

ಈಗ ಕೋಡ್ ಉಲ್ಲೇಖ ಬದಲಾವಣೆಯ ವೈಶಿಷ್ಟ್ಯವನ್ನು ಈಗಾಗಲೇ ಸಾಧಿಸಿದೆ:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### ಉಲ್ಲೇಖಗಳನ್ನು ವಲಯವಾಗಿ ತೋರಿಸುವುದು

ಕೊನೆಯ ಉಲ್ಲೇಖ ತೋರಿಸಿದ ನಂತರ ಮತ್ತೆ ಬಟನ್ ಒತ್ತಿದಾಗ ಮೊದಲ ಉಲ್ಲೇಖವೇ ತೋರಿಸಬೇಕು ಎಂದರೆ, `else` ಭಾಗದ ಸಹಾಯದಿಂದ ವಲಯ ತೋರಿಕೆಯನ್ನು ಸಾಧಿಸಬಹುದು:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

ಇಲ್ಲಿ `index` array ಯ ಕೊನೆಯ ಅಂಶವನ್ನು ತಲುಪಿದಾಗ, `index` ಮತ್ತೆ 0 ಆಗಿ ಮರುಹೊಂದಿಸಲಾಗುತ್ತದೆ. ಹೀಗಾಗಿ ಉಲ್ಲೇಖಗಳು ಪುನರಾವರ್ತಿತವಾಗಿ ತೋರಿಸುತ್ತವೆ.

## ಉಲ್ಲೇಖ view ಅನ್ನು ಉತ್ತಮಗೊಳಿಸುವುದು

ಈಗ ಉಲ್ಲೇಖ ಕ್ಯಾರಸೆಲ್‌ನ ಲಾಜಿಕ್ ಪೂರ್ಣಗೊಂಡಿದೆ. ಆದರೆ interface ಇನ್ನಷ್ಟು ಸುಂದರವಾಗುವಂತೆ ಅದನ್ನು ಮತ್ತಷ್ಟು optimize ಮಾಡಬಹುದು.

ಪೂರ್ಣ ಕೋಡ್:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ `Text` view ಗೆ ಬಿಳಿ ಅರ್ಧಪಾರದರ್ಶಕ ಹಿನ್ನೆಲೆ ಮತ್ತು rounded corners ಸೇರಿಸಲಾಗಿದೆ. `Button` ಗೆ `.borderedProminent` style ಬಳಸಲಾಗಿದೆ. `VStack` ಗೆ background image ಕೂಡ ಇದೆ.

ಹೆಚ್ಚುವರಿ ಜ್ಞಾನ: `background()` modifier ಬಳಸಿ ಚಿತ್ರ ಹಿನ್ನೆಲೆಯನ್ನು ಸಂಭಾಳಿಸುವಾಗ, ಅದರ default ವರ್ತನೆ ಪ್ರಸ್ತುತ view ಇರುವ layout ಪ್ರದೇಶವನ್ನು ಸಾಧ್ಯವಾದಷ್ಟು ತುಂಬುವುದಾಗಿದೆ. ಅನೇಕ ಸಂದರ್ಭಗಳಲ್ಲಿ ಅದು ಸಹಜವಾಗಿಯೇ Safe Area ವರೆಗೆ ವಿಸ್ತರಿಸಬಹುದು.

ಈಗ ನಾವು ಉಲ್ಲೇಖ ಕ್ಯಾರಸೆಲ್ view ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ನಿರ್ಮಿಸಿದ್ದೇವೆ.

![SwiftUI View](../../RESOURCE/011_word.png)

## ಸಂಗ್ರಹ

ಈ ಪಾಠದ ಮೂಲಕ, ಅನೇಕ ಉಲ್ಲೇಖಗಳನ್ನು array ನಲ್ಲಿ ಹೇಗೆ ಸಂಗ್ರಹಿಸಬೇಕು ಹಾಗೂ `if` ಮತ್ತು `if-else` statements ಗಳ ಮೂಲಕ ಅವನ್ನು ವಲಯವಾಗಿ ಹೇಗೆ ತೋರಿಸಬೇಕು ಎಂಬುದನ್ನು ಕಲಿತಿದ್ದೇವೆ.

ಹಾಗೇ array ಯ ಮೂಲಭೂತ ಕಾರ್ಯಾಚರಣೆಗಳಾದ ಅಂಶ ಸೇರಿಸುವುದು, ಅಳಿಸುವುದು, ಬದಲಿಸುವುದು ಮತ್ತು index out-of-range ಅನ್ನು ತಡೆಯುವುದು ಎಂಬುದನ್ನೂ ತಿಳಿದುಕೊಂಡಿದ್ದೇವೆ.

ಈ ಪಾಠವು ಕೇವಲ ಉಲ್ಲೇಖ ಕ್ಯಾರಸೆಲ್‌ನ ಕಾರ್ಯಗತಗೊಳಿಸುವಿಕೆಯನ್ನು ವಿವರಿಸಿಲ್ಲ; array ಮತ್ತು conditional statements ಗಳ ಮೂಲ ಬಳಕೆಯನ್ನು ಸಹ ಒಳಗೊಂಡಿದೆ. ಇದರಿಂದ ಡೇಟಾ ನಿರ್ವಹಣೆ ಮತ್ತು program flow ನಿಯಂತ್ರಣದ ಸಾಮರ್ಥ್ಯವನ್ನು ರೂಪಿಸಬಹುದು.

## ವಿಸ್ತೃತ ಜ್ಞಾನ - ಬಹು ಶರತ್ತು ತೀರ್ಮಾನ: if-else if-else ವಾಕ್ಯ

ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಒಂದಕ್ಕಿಂತ ಹೆಚ್ಚು conditions ಗಳನ್ನು ನಿರ್ವಹಿಸಬೇಕಾಗುವುದು ಸಾಮಾನ್ಯ. ಉದಾಹರಣೆಗೆ, ಯಾವದಾದರೂ ಆಟದಲ್ಲಿ score 1 ಆಗಿದ್ದರೆ event A, 2 ಆಗಿದ್ದರೆ event B, 3 ಆಗಿದ್ದರೆ event C trigger ಆಗಲಿ ಎಂದುಕೊಳ್ಳಿ.

ಎರಡಕ್ಕಿಂತ ಹೆಚ್ಚು ಶರತ್ತು ಶಾಖೆಗಳಿದ್ದಾಗ, `if-else if-else` statement ಬಳಸಬೇಕು.

ಮೂಲ syntax:

```swift
if conditionA {
    // conditionA true ಆಗಿದ್ದರೆ ನಡೆಯುವ ಕೋಡ್
} else if conditionB {
    // conditionB true ಆಗಿದ್ದರೆ ನಡೆಯುವ ಕೋಡ್
} else if conditionC {
    // conditionC true ಆಗಿದ್ದರೆ ನಡೆಯುವ ಕೋಡ್
} else {
    // ಮೇಲಿನ ಯಾವುದೂ ಸತ್ಯವಾಗದಿದ್ದರೆ ನಡೆಯುವ ಕೋಡ್
}
```

ಈ ಪರಿಸ್ಥಿತಿಯಲ್ಲಿ, ಪ್ರೋಗ್ರಾಂ ಕ್ರಮವಾಗಿ conditions ಪರಿಶೀಲಿಸಿ, ಮೊದಲಿಗೆ ಸತ್ಯವಾಗುವ condition ಗೆ ಸೇರಿದ code ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ. ಯಾವುದೂ ಸತ್ಯವಾಗದಿದ್ದರೆ `else` ಭಾಗವನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ.

ಉಲ್ಲೇಖ ಕ್ಯಾರಸೆಲ್‌ನಲ್ಲಿಯೂ ನಾವು `if-else if-else` statement ಬಳಸಿ ಬಹು ಶರತ್ತು ನಿರ್ಧಾರ ಮಾಡಬಹುದು:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

`index` 0, 1, 2, 3 ಆಗಿರುವಾಗ ಪ್ರತಿ ಬಾರಿ ಬಟನ್ ಒತ್ತಿದರೆ `index += 1` ನಡೆಯುತ್ತದೆ. `index` 4 ಆಗಿರುವಾಗ (ಕೊನೆಯ ಅಂಶ), `index` ಅನ್ನು 0 ಗೆ ಮರುಹೊಂದಿಸಿ ವಲಯ ಸಾಧಿಸಲಾಗುತ್ತದೆ.

`else` branch ಒಂದು fallback ಆಗಿ ಕೆಲಸಮಾಡುತ್ತದೆ. ಉದಾಹರಣೆಗೆ `index` ತಪ್ಪಾಗಿ ಬೇರೆ ಮೌಲ್ಯಕ್ಕೆ ಬದಲಾಗಿದ್ದರೂ ಅದು program ಅನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಉಳಿಸುತ್ತದೆ.

ಗಮನಿಸಿ, ಇಲ್ಲಿ ಬಳಸಿ ಇರುವ `==` ಎಂಬುದು "ಸಮಾನವೇ?" ಎಂಬ ಹೋಲಿಕೆ. `if` statement ನಲ್ಲಿ `index` ಒಂದು ಸಂಖ್ಯೆಗೆ ಸಮನಾದರೆ ಅದು true ಹಿಂತಿರುಗಿಸಿ ನಂತರದ code block ಅನ್ನು ನಡೆಸುತ್ತದೆ. ಸಮನಾಗದಿದ್ದರೆ ಮುಂದಿನ `if` ಗೆ ಹೋಗುತ್ತದೆ.

ಈ ರೀತಿಯ ಬಹು ಶರತ್ತು ನಿರ್ಧಾರಗಳು ಬೇರೆಬೇರೆ ಪರಿಸ್ಥಿತಿಗಳಲ್ಲಿ ಬೇರೆ code ಅನ್ನು ನಡೆಸಲು ಬಹಳ ಉಪಯುಕ್ತ.
