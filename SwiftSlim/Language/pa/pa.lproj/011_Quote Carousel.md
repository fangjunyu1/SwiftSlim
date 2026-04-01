# ਕਹਾਵਤਾਂ ਦਾ ਰੋਟੇਸ਼ਨ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ "ਕਹਾਵਤ ਰੋਟੇਸ਼ਨ" ਫੰਕਸ਼ਨ ਬਣਾਵਾਂਗੇ ਅਤੇ Array ਅਤੇ if-else ਵਰਗੀਆਂ Swift ਦੀਆਂ ਬੁਨਿਆਦੀ ਧਾਰਣਾਵਾਂ ਨੂੰ ਡੂੰਘਾਈ ਨਾਲ ਸਿੱਖਾਂਗੇ।

ਅਸੀਂ ਵੇਖਾਂਗੇ ਕਿ ਕਈ ਕਹਾਵਤਾਂ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਿਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਬਟਨ ਇੰਟਰੈਕਸ਼ਨ ਰਾਹੀਂ ਉਨ੍ਹਾਂ ਨੂੰ ਚੱਕਰਵਾਰ ਕਿਵੇਂ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ।

![alt text](../../RESOURCE/011_word.png)

## ਕਹਾਵਤ ਦਿਖਾਉਣਾ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਸਾਨੂੰ SwiftUI ਵਿੱਚ ਇੱਕ ਕਹਾਵਤ ਦਿਖਾਉਣੀ ਹੈ।

ਸਭ ਤੋਂ ਸੌਖਾ ਤਰੀਕਾ ਹੈ Text view ਦੀ ਵਰਤੋਂ ਕਰਨਾ:

```swift
Text("Slow progress is still progress.")
```

ਇਹ ਕੋਡ ਸਿਰਫ ਇੱਕ ਫਿਕਸ ਕਹਾਵਤ ਦਿਖਾ ਸਕਦਾ ਹੈ। ਜੇ ਅਸੀਂ ਕਈ ਕਹਾਵਤਾਂ ਦਿਖਾਉਣੀਆਂ ਅਤੇ ਉਨ੍ਹਾਂ ਵਿੱਚ ਬਦਲਾਅ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਸਾਨੂੰ ਉਹਨਾਂ ਨੂੰ ਪਹਿਲਾਂ ਸੰਭਾਲਣਾ ਪਵੇਗਾ।

ਪਰ ਆਮ string variable ਸਿਰਫ ਇੱਕ ਹੀ ਕਹਾਵਤ ਸੰਭਾਲ ਸਕਦਾ ਹੈ:

```swift
let sayings = "Slow progress is still progress."
```

ਜੇ ਕਈ ਕਹਾਵਤਾਂ ਸੰਭਾਲਣੀਆਂ ਹੋਣ, ਤਾਂ ਹਰ ਕਹਾਵਤ ਲਈ ਵੱਖਰਾ variable ਬਣਾਉਣਾ ਪਵੇਗਾ:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

ਪਰ ਅਸਲ ਵਿਕਾਸ ਵਿੱਚ ਇਹ ਤਰੀਕਾ ਨਾ ਸਿਰਫ ਔਖਾ ਹੈ, ਸਗੋਂ ਹਰ variable ਦੇ ਅਲੱਗ ਹੋਣ ਕਾਰਨ ਅਸੀਂ ਲਚਕੀਲਾ ਰੋਟੇਸ਼ਨ ਵੀ ਨਹੀਂ ਕਰ ਸਕਦੇ।

ਕਈ ਕਹਾਵਤਾਂ ਨੂੰ ਸੁਵਿਧਾਜਨਕ ਢੰਗ ਨਾਲ ਸੰਭਾਲਣ ਲਈ ਸਾਨੂੰ ਇੱਕ ਐਸੀ data structure ਦੀ ਲੋੜ ਹੈ ਜੋ ਇਹਨਾਂ ਸਭ ਨੂੰ ਇਕੱਠੇ ਰੱਖੇ — ਇਸਨੂੰ Array ਕਹਿੰਦੇ ਹਨ।

Array ਦੀ ਵਰਤੋਂ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਉਪਰੋਕਤ ਕੋਡ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**ਸੰਕੇਤ: Programming ਦੀਆਂ conventions ਵਿੱਚ, ਕਈ elements ਵਾਲੇ array variable ਦਾ ਨਾਮ ਆਮ ਤੌਰ 'ਤੇ plural ਰੂਪ ਵਿੱਚ ਰੱਖਿਆ ਜਾਂਦਾ ਹੈ, ਜਿਵੇਂ sayings, ਤਾਂ ਜੋ ਇਸਦੀ collection ਵਾਲੀ ਖਾਸੀਅਤ ਦਰਸਾਈ ਜਾ ਸਕੇ।**

## ਐਰੇ

Swift ਵਿੱਚ, array ਇੱਕ ordered elements ਦੀ collection ਹੁੰਦੀ ਹੈ, ਜਿਸਨੂੰ square brackets [] ਨਾਲ ਦਰਸਾਇਆ ਜਾਂਦਾ ਹੈ।

```swift
[]
```

Array ਦੇ ਅੰਦਰ ਇੱਕੋ ਕਿਸਮ ਦੇ ਕਈ elements ਹੋ ਸਕਦੇ ਹਨ, ਅਤੇ elements ਨੂੰ ਅੰਗਰੇਜ਼ੀ comma , ਨਾਲ ਵੱਖ ਕੀਤਾ ਜਾਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
[101, 102, 103, 104, 105]
```

ਅਸੀਂ array ਨੂੰ ਸੌਖੇ ਤਰੀਕੇ ਨਾਲ ਇੱਕ ਰੇਲਗੱਡੀ ਵਾਂਗ ਸਮਝ ਸਕਦੇ ਹਾਂ:

![Array](../../RESOURCE/011_array1.png)

ਪੂਰੀ ਰੇਲਗੱਡੀ array object ਨੂੰ ਦਰਸਾਉਂਦੀ ਹੈ, ਅਤੇ ਹਰ ਡੱਬਾ ਕ੍ਰਮਵਾਰ ਲੱਗਿਆ ਹੁੰਦਾ ਹੈ।

### ਇੰਡੈਕਸ ਅਤੇ ਐਲੀਮੈਂਟ ਐਕਸੈੱਸ

ਕਿਉਂਕਿ array ordered ਹੁੰਦੀ ਹੈ, ਇਸ ਲਈ ਸਿਸਟਮ ਕ੍ਰਮ ਅਨੁਸਾਰ ਕਿਸੇ ਖਾਸ element ਦੀ ਪਛਾਣ ਕਰ ਸਕਦਾ ਹੈ। ਇਸ ਪਛਾਣ ਪ੍ਰਣਾਲੀ ਨੂੰ index ਕਿਹਾ ਜਾਂਦਾ ਹੈ।

Swift ਵਿੱਚ (ਅਤੇ ਬਹੁਤ ਸਾਰੀਆਂ programming languages ਵਿੱਚ ਵੀ), array ਦਾ index 0 ਤੋਂ ਸ਼ੁਰੂ ਹੁੰਦਾ ਹੈ, 1 ਤੋਂ ਨਹੀਂ। ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ array ਦਾ ਪਹਿਲਾ element index 0 ਤੇ ਹੁੰਦਾ ਹੈ, ਦੂਜਾ 1 ਤੇ, ਅਤੇ ਇਸੇ ਤਰ੍ਹਾਂ ਅੱਗੇ।

![Array](../../RESOURCE/011_array2.png)

ਜੇ array ਵਿੱਚੋਂ ਕੋਈ ਖਾਸ element ਲੈਣਾ ਹੋਵੇ, ਤਾਂ array ਦੇ ਨਾਮ ਦੇ ਬਾਅਦ square brackets ਲਗਾ ਕੇ ਅੰਦਰ ਉਸ element ਦਾ index ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

ਜੇ ਤੁਸੀਂ array ਦੀ valid range ਤੋਂ ਬਾਹਰ ਵਾਲੇ index ਨੂੰ access ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ, ਤਾਂ “Index Out of Range” ਦੀ ਸਮੱਸਿਆ ਆਉਂਦੀ ਹੈ। ਇਸ ਲਈ array access ਕਰਦੇ ਸਮੇਂ ਇਹ ਯਕੀਨੀ ਬਣਾਉਣਾ ਚਾਹੀਦਾ ਹੈ ਕਿ index valid range ਦੇ ਅੰਦਰ ਹੋਵੇ।

**ਇੰਡੈਕਸ ਆਉਟ ਆਫ ਰੇਂਜ**

ਉਦਾਹਰਨ ਲਈ, ਜੇ array ਵਿੱਚ 5 elements ਹਨ, ਤਾਂ valid index range 0 ਤੋਂ 4 ਹੋਵੇਗੀ। ਜੇ ਅਸੀਂ sayings[5] ਨੂੰ access ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੀਏ, ਤਾਂ program ਨੂੰ ਉਸਦੇ ਲਈ ਕੋਈ ਮਿਲਦਾ-ਜੁਲਦਾ “ਡੱਬਾ” ਨਹੀਂ ਮਿਲੇਗਾ, ਅਤੇ “Index Out of Range” error ਆਵੇਗੀ, ਜਿਸ ਕਾਰਨ app crash ਹੋ ਸਕਦੀ ਹੈ।

![Array](../../RESOURCE/011_array3.png)

### ਐਰੇ ਉੱਤੇ ਕਾਰਵਾਈ

Array ਸਿਰਫ static definition ਹੀ ਨਹੀਂ, ਸਗੋਂ ਇਸ ਵਿੱਚ element ਜੋੜੇ, ਹਟਾਏ, ਸੋਧੇ ਵੀ ਜਾ ਸਕਦੇ ਹਨ, ਅਤੇ ਇਸ ਦੀ length ਵੀ ਪ੍ਰਾਪਤ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ।

ਸੰਕੇਤ: ਜੇ array ਨੂੰ modify ਕਰਨਾ ਹੈ, ਤਾਂ ਉਸਨੂੰ let constant ਦੀ ਬਜਾਏ var ਨਾਲ declare ਕਰਨਾ ਲਾਜ਼ਮੀ ਹੈ।

**1. ਨਵਾਂ ਐਲੀਮੈਂਟ ਜੋੜਨਾ**

append method ਦੀ ਵਰਤੋਂ ਕਰਕੇ array ਦੇ ਅੰਤ ਵਿੱਚ ਨਵਾਂ element ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. ਐਲੀਮੈਂਟ ਹਟਾਉਣਾ**

remove(at:) method ਰਾਹੀਂ array ਦੇ ਕਿਸੇ ਖਾਸ element ਨੂੰ ਹਟਾਇਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. ਐਲੀਮੈਂਟ ਸੋਧਣਾ**

ਸਿੱਧੇ index ਦੀ ਵਰਤੋਂ ਕਰਕੇ array ਦੇ element ਨੂੰ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. ਐਰੇ ਦੀ ਲੰਬਾਈ ਗਿਣਨਾ**

count property ਨਾਲ array ਦੇ elements ਦੀ ਗਿਣਤੀ ਪ੍ਰਾਪਤ ਕੀਤੀ ਜਾਂਦੀ ਹੈ:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### ਐਰੇ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਹਾਵਤ ਦਿਖਾਉਣਾ

ਕਈ ਕਹਾਵਤਾਂ ਦਿਖਾਉਣ ਲਈ, ਅਸੀਂ ਉਹਨਾਂ ਨੂੰ ਇੱਕ array ਵਿੱਚ ਸੰਭਾਲ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਫਿਰ index ਦੇ ਰਾਹੀਂ ਉਨ੍ਹਾਂ ਨੂੰ ਪੜ੍ਹ ਕੇ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ContentView ਵਿੱਚ sayings array ਬਣਾਈਏ, ਅਤੇ ਫਿਰ Text view ਵਿੱਚ index ਦੇ ਰਾਹੀਂ ਉਸਦਾ ਸੰਬੰਧਿਤ element ਦਿਖਾਈਏ:

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

ਇੱਥੇ sayings[0] array ਦੀ ਪਹਿਲੀ ਕਹਾਵਤ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਜੇ ਹੋਰ ਕਹਾਵਤ ਦਿਖਾਉਣੀ ਹੋਵੇ, ਤਾਂ ਸਿਰਫ square brackets ਦੇ ਅੰਦਰ ਵਾਲਾ index ਬਦਲਣਾ ਪਵੇਗਾ:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### ਕਹਾਵਤ ਦਾ ਇੰਡੈਕਸ ਪਰਿਭਾਸ਼ਿਤ ਕਰਨਾ

ਕਹਾਵਤਾਂ ਵਿੱਚ dynamic switching ਲਿਆਉਣ ਲਈ, ਅਸੀਂ Text view ਵਿੱਚ index ਨੂੰ ਸਿੱਧਾ “hard-code” ਨਹੀਂ ਕਰ ਸਕਦੇ।

ਸਾਨੂੰ ਇੱਕ ਵੱਖਰਾ variable ਬਣਾਉਣਾ ਪਵੇਗਾ ਜੋ ਮੌਜੂਦਾ display ਹੋ ਰਿਹਾ index ਸੰਭਾਲੇ।

SwiftUI ਵਿੱਚ, ਅਸੀਂ @State ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇੱਕ mutable index declare ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
@State private var index = 0
```

SwiftUI @State ਨਾਲ wrap ਕੀਤੇ variable ਨੂੰ observe ਕਰਦੀ ਹੈ। ਜਦੋਂ index ਬਦਲਦਾ ਹੈ, SwiftUI view ਨੂੰ ਮੁੜ render ਕਰਦੀ ਹੈ ਅਤੇ ਸੰਬੰਧਿਤ ਕਹਾਵਤ ਦਿਖਾਉਂਦੀ ਹੈ।

ਫਿਰ, ਅਸੀਂ sayings[index] ਦੀ ਵਰਤੋਂ ਕਰਕੇ array ਵਿੱਚੋਂ ਮੌਜੂਦਾ ਕਹਾਵਤ dynamic ਢੰਗ ਨਾਲ ਲੈ ਸਕਦੇ ਹਾਂ:

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

ਜਦੋਂ index ਦੀ value ਬਦਲਦੀ ਹੈ, Text ਵੱਖ-ਵੱਖ ਕਹਾਵਤਾਂ ਦਿਖਾਵੇਗਾ।

### ਬਟਨ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇੰਡੈਕਸ ਕੰਟਰੋਲ ਕਰਨਾ

ਕਹਾਵਤ ਬਦਲਣ ਨੂੰ control ਕਰਨ ਲਈ, ਅਸੀਂ Button ਦੀ ਵਰਤੋਂ ਕਰਕੇ index ਦੀ value ਬਦਲ ਸਕਦੇ ਹਾਂ। ਹਰ ਵਾਰ button 'ਤੇ click ਕਰਨ 'ਤੇ index ਆਪਣੇ ਆਪ 1 ਵੱਧ ਜਾਵੇਗਾ:

```swift
Button("Next") {
    index += 1
}
```

ਜਦੋਂ ਅਸੀਂ button 'ਤੇ click ਕਰਦੇ ਹਾਂ, ਤਾਂ index 0 ਤੋਂ 1 ਹੋ ਜਾਂਦਾ ਹੈ, ਜਿਸ ਨਾਲ view refresh ਹੁੰਦੀ ਹੈ, ਅਤੇ Text(sayings[index]) ਅਗਲੀ ਕਹਾਵਤ ਪੜ੍ਹ ਕੇ ਦਿਖਾਉਂਦਾ ਹੈ।

ਪਰ ਇੱਥੇ ਇੱਕ ਸੰਭਾਵਿਤ ਸਮੱਸਿਆ ਹੈ: ਜੇ button ਲਗਾਤਾਰ ਦਬਾਇਆ ਜਾਵੇ, ਤਾਂ index array ਦੀ valid range ਤੋਂ ਬਾਹਰ ਚਲਾ ਜਾਵੇਗਾ, ਜਿਸ ਨਾਲ array index out of range error ਆਵੇਗੀ। ਉਦਾਹਰਨ ਲਈ, ਜਦੋਂ index 5 ਹੋ ਜਾਂਦਾ ਹੈ (ਜਦਕਿ valid range 0 ਤੋਂ 4 ਹੈ), ਤਾਂ program crash ਕਰੇਗਾ।

ਇਸ ਸਮੱਸਿਆ ਤੋਂ ਬਚਣ ਲਈ ਸਾਨੂੰ conditional control ਦੀ ਲੋੜ ਹੈ, ਤਾਂ ਜੋ index array ਦੀ range ਤੋਂ ਬਾਹਰ ਨਾ ਜਾਵੇ। ਇਸ ਲਈ if-else statement ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇਹ ਜਾਂਚ ਸਕਦੇ ਹਾਂ ਕਿ index array ਦੀ length ਤੋਂ ਘੱਟ ਹੈ ਜਾਂ ਨਹੀਂ।

## ਸ਼ਰਤੀ ਨਿਯੰਤਰਣ: if-else ਸਟੇਟਮੈਂਟ

if-else statement Swift ਵਿੱਚ ਸਭ ਤੋਂ ਆਮ conditional branching statement ਹੈ। ਇਹ ਜਾਂਚਦੀ ਹੈ ਕਿ condition ਸਹੀ ਹੈ ਜਾਂ ਨਹੀਂ, ਅਤੇ ਉਸਦੇ true ਜਾਂ false ਹੋਣ ਅਨੁਸਾਰ ਵੱਖ-ਵੱਖ code blocks execute ਕਰਦੀ ਹੈ।

ਮੂਲ ਢਾਂਚਾ:

```swift
if condition {
    // ਜਦੋਂ condition true ਹੋਵੇ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ
} else {
    // ਜਦੋਂ condition false ਹੋਵੇ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ
}
```

if statement ਵਿੱਚ condition ਇੱਕ Boolean value (Bool type) ਹੁੰਦੀ ਹੈ, ਜੋ true ਜਾਂ false ਹੋ ਸਕਦੀ ਹੈ। ਜੇ condition true ਹੋਵੇ, ਤਾਂ if ਵਾਲਾ code ਚੱਲਦਾ ਹੈ, ਨਹੀਂ ਤਾਂ else ਵਾਲਾ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ age ਦੀ value 25 ਹੈ। if statement age > 18 ਦੀ ਜਾਂਚ ਕਰਦੀ ਹੈ। ਕਿਉਂਕਿ condition true ਹੈ, ਇਸ ਲਈ "Big Boy" output ਹੁੰਦਾ ਹੈ।

ਜੇ else ਵਾਲੇ ਹਿੱਸੇ ਦੀ ਲੋੜ ਨਾ ਹੋਵੇ, ਤਾਂ ਇਸਨੂੰ ਛੱਡਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
if condition {
    // ਜਦੋਂ condition true ਹੋਵੇ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ
}
```

### ਇੰਡੈਕਸ ਦੀ ਰੇਂਜ ਨੂੰ condition ਨਾਲ ਕੰਟਰੋਲ ਕਰਨਾ

Index out of range ਤੋਂ ਬਚਣ ਲਈ, if statement ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇਹ ਯਕੀਨੀ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ ਕਿ index array ਦੀ valid range ਤੋਂ ਬਾਹਰ ਨਾ ਜਾਵੇ:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

ਲੌਜਿਕ ਵਿਸ਼ਲੇਸ਼ਣ: sayings.count ਦੀ value 5 ਹੈ (ਕੁੱਲ 5 ਕਹਾਵਤਾਂ ਹਨ), ਇਸ ਲਈ sayings.count - 1 ਦੀ value 4 ਹੈ, ਅਤੇ ਇਹੀ array ਦਾ ਆਖਰੀ valid index ਹੈ।

ਜਦੋਂ index 4 ਤੋਂ ਘੱਟ ਹੁੰਦਾ ਹੈ, button ਦਬਾ ਕੇ index ਵਿੱਚ 1 ਜੋੜਨਾ ਸੁਰੱਖਿਅਤ ਹੈ; ਜਦੋਂ index 4 'ਤੇ ਪਹੁੰਚ ਜਾਂਦਾ ਹੈ, condition false ਹੋ ਜਾਂਦੀ ਹੈ, ਅਤੇ button ਦਬਾਉਣ 'ਤੇ ਕੁਝ ਨਹੀਂ ਹੁੰਦਾ।

ਹੁਣ ਕੋਡ ਕਹਾਵਤ switching ਦੀ functionality ਦੇ ਸਕਦਾ ਹੈ:

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

### ਕਹਾਵਤਾਂ ਨੂੰ ਚੱਕਰਵਾਰ ਦਿਖਾਉਣਾ

ਜੇ ਅਸੀਂ ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ ਆਖਰੀ ਕਹਾਵਤ ਦਿਖਾਉਣ ਤੋਂ ਬਾਅਦ button ਦਬਾਉਣ 'ਤੇ ਮੁੜ ਪਹਿਲੀ ਕਹਾਵਤ ਦਿਖੇ, ਤਾਂ else ਹਿੱਸੇ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇਹ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

ਜਦੋਂ button click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਅਤੇ index array ਦੇ ਆਖਰੀ element 'ਤੇ ਹੁੰਦਾ ਹੈ, ਤਾਂ index ਮੁੜ 0 ਹੋ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਕਹਾਵਤਾਂ ਫਿਰ ਤੋਂ cycle ਵਿੱਚ ਚੱਲਣ ਲੱਗਦੀਆਂ ਹਨ।

## ਕਹਾਵਤ ਵਾਲੇ view ਨੂੰ ਸੁਧਾਰਨਾ

ਹੁਣ ਸਾਡੀ ਕਹਾਵਤ ਰੋਟੇਸ਼ਨ logic ਬਣ ਗਈ ਹੈ, ਪਰ ਅਸੀਂ interface ਨੂੰ ਹੋਰ ਸੁੰਦਰ ਬਣਾਉਣ ਲਈ ਇਸਨੂੰ ਅੱਗੇ optimize ਵੀ ਕਰ ਸਕਦੇ ਹਾਂ।

ਪੂਰਾ ਕੋਡ:

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

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, Text view ਨੂੰ ਇੱਕ ਸਫੈਦ ਅੱਧ-ਪਾਰਦਰਸ਼ੀ background ਅਤੇ rounded corners ਦਿੱਤੇ ਗਏ ਹਨ, Button 'ਤੇ .borderedProminent style ਲਗਾਇਆ ਗਿਆ ਹੈ, ਅਤੇ VStack ਲਈ ਇੱਕ background image ਸੈੱਟ ਕੀਤੀ ਗਈ ਹੈ।

ਵਾਧੂ ਗਿਆਨ: background() modifier ਨਾਲ image background ਲਗਾਉਣ ਵੇਲੇ, ਇਸਦਾ default behavior ਇਹ ਹੁੰਦਾ ਹੈ ਕਿ ਉਹ ਮੌਜੂਦਾ view ਦੀ layout area ਨੂੰ ਸੰਭਵ ਤੌਰ 'ਤੇ ਭਰ ਦੇਵੇ। ਕਈ ਹਾਲਤਾਂ ਵਿੱਚ, ਇਹ ਕੁਦਰਤੀ ਤੌਰ 'ਤੇ Safe Area ਤੱਕ ਵੀ ਫੈਲ ਸਕਦੀ ਹੈ।

ਹੁਣ ਅਸੀਂ ਕਹਾਵਤਾਂ ਵਾਲਾ ਰੋਟੇਸ਼ਨ view ਤਿਆਰ ਕਰ ਲਿਆ ਹੈ।

![SwiftUI View](../../RESOURCE/011_word.png)

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਰਾਹੀਂ ਅਸੀਂ ਸਿੱਖਿਆ ਕਿ ਕਈ ਕਹਾਵਤਾਂ ਨੂੰ array ਵਿੱਚ ਕਿਵੇਂ ਸੰਭਾਲਣਾ ਹੈ, ਅਤੇ if ਅਤੇ if-else statements ਦੀ ਮਦਦ ਨਾਲ ਕਹਾਵਤਾਂ ਦਾ ਰੋਟੇਸ਼ਨ ਕਿਵੇਂ ਕਰਨਾ ਹੈ।

ਅਸੀਂ ਇਹ ਵੀ ਸਮਝਿਆ ਕਿ array ਦੀਆਂ ਬੁਨਿਆਦੀ ਕਾਰਵਾਈਆਂ ਕੀ ਹਨ, ਜਿਵੇਂ element ਜੋੜਨਾ, ਹਟਾਉਣਾ, ਸੋਧਣਾ, ਅਤੇ index out of range ਤੋਂ ਕਿਵੇਂ ਬਚਣਾ ਹੈ।

ਇਹ ਪਾਠ ਸਿਰਫ ਕਹਾਵਤ ਰੋਟੇਸ਼ਨ ਦੀ functionality ਹੀ ਨਹੀਂ ਸਮਝਾਉਂਦਾ, ਸਗੋਂ arrays ਅਤੇ conditional statements ਦੀ ਬੁਨਿਆਦੀ ਵਰਤੋਂ ਨੂੰ ਵੀ ਜੋੜਦਾ ਹੈ, ਤਾਂ ਜੋ ਅਸੀਂ data ਨੂੰ ਸੰਭਾਲਣ ਅਤੇ program flow ਨੂੰ control ਕਰਨ ਦੀ ਯੋਗਤਾ ਹਾਸਲ ਕਰੀਏ।

## ਵਿਸਥਾਰਿਤ ਗਿਆਨ - ਕਈ ਸ਼ਰਤਾਂ ਦੀ ਜਾਂਚ: if-else if-else ਸਟੇਟਮੈਂਟ

ਅਸਲ ਵਿਕਾਸ ਵਿੱਚ ਅਕਸਰ ਕਈ conditions ਨੂੰ handle ਕਰਨ ਦੀ ਲੋੜ ਪੈਂਦੀ ਹੈ। ਉਦਾਹਰਨ ਲਈ, ਕਿਸੇ game ਵਿੱਚ score 1 ਹੋਣ 'ਤੇ event A ਚਾਲੂ ਹੋਵੇ, 2 ਹੋਣ 'ਤੇ event B, 3 ਹੋਣ 'ਤੇ event C, ਆਦਿ।

ਜਦੋਂ ਦੋ ਤੋਂ ਵੱਧ conditions ਹੋਣ, ਤਾਂ ਅਸੀਂ if-else if-else statement ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਾਂ।

ਮੂਲ syntax:

```swift
if conditionA {
    // ਜਦੋਂ conditionA true ਹੋਵੇ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ
} else if conditionB {
    // ਜਦੋਂ conditionB true ਹੋਵੇ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ
} else if conditionC {
    // ਜਦੋਂ conditionC true ਹੋਵੇ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ
} else {
    // ਜਦੋਂ ਕੋਈ ਵੀ condition true ਨਾ ਹੋਵੇ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ
}
```

ਇਸ ਹਾਲਤ ਵਿੱਚ program conditions ਨੂੰ ਕ੍ਰਮਵਾਰ ਜਾਂਚਦਾ ਹੈ, ਅਤੇ ਜੋ ਪਹਿਲੀ condition true ਹੁੰਦੀ ਹੈ, ਉਸਦਾ code block execute ਹੁੰਦਾ ਹੈ। ਜੇ ਕੋਈ ਵੀ condition true ਨਾ ਹੋਵੇ, ਤਾਂ else ਦੇ ਬਾਅਦ ਵਾਲਾ code ਚੱਲਦਾ ਹੈ।

ਕਹਾਵਤ ਰੋਟੇਸ਼ਨ ਵਿੱਚ ਵੀ, ਅਸੀਂ if-else if-else statement ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਬਹੁ-ਪੱਧਰੀ ਜਾਂਚ ਕਰ ਸਕਦੇ ਹਾਂ:

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

ਜਦੋਂ index 0, 1, 2, 3 ਹੁੰਦਾ ਹੈ, ਹਰ click 'ਤੇ index += 1 ਚੱਲਦਾ ਹੈ; ਅਤੇ ਜਦੋਂ index 4 (ਆਖਰੀ element) ਹੁੰਦਾ ਹੈ, ਤਾਂ index ਮੁੜ 0 ਕਰ ਦਿੱਤਾ ਜਾਂਦਾ ਹੈ, ਇਸ ਤਰ੍ਹਾਂ cycle ਬਣ ਜਾਂਦੀ ਹੈ।

else branch fallback ਵਜੋਂ ਕੰਮ ਕਰਦੀ ਹੈ, ਤਾਂ ਜੋ index ਵਿੱਚ ਕੋਈ ਗਲਤ value ਆ ਜਾਣ 'ਤੇ ਵੀ program ਸੁਰੱਖਿਅਤ ਰਹੇ।

ਧਿਆਨ ਦੇਣ ਵਾਲੀ ਗੱਲ ਇਹ ਹੈ ਕਿ ਇੱਥੇ ਵਰਤਿਆ ਗਿਆ == “ਬਰਾਬਰ ਹੈ ਜਾਂ ਨਹੀਂ” ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। ਜੇ if statement ਵਿੱਚ index ਕਿਸੇ ਨਿਰਧਾਰਤ number ਦੇ ਬਰਾਬਰ ਹੋਵੇ, ਤਾਂ condition true ਹੋਵੇਗੀ ਅਤੇ ਉਸ ਤੋਂ ਬਾਅਦ ਵਾਲਾ code block ਚੱਲੇਗਾ। ਜੇ ਬਰਾਬਰ ਨਾ ਹੋਵੇ, ਤਾਂ ਅਗਲੀ if condition ਜਾਂਚੀ ਜਾਵੇਗੀ।

ਇਸ ਤਰ੍ਹਾਂ ਦੀ multi-condition checking ਵੱਖ-ਵੱਖ condition ਵਾਲੇ ਮੌਕਿਆਂ 'ਤੇ ਵੱਖਰੇ code execute ਕਰਨ ਲਈ ਉਪਯੋਗੀ ਹੁੰਦੀ ਹੈ।
