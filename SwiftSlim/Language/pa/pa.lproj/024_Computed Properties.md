# ਕੰਪਿਊਟਡ ਪ੍ਰਾਪਰਟੀਜ਼

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਮੁੱਖ ਤੌਰ ਤੇ computed property ਬਾਰੇ ਸਿੱਖਾਂਗੇ।

Computed property ਮੌਜੂਦਾ ਡਾਟਾ ਦੇ ਆਧਾਰ ਤੇ ਨਵਾਂ ਨਤੀਜਾ ਗਿਣਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਇਹ ਸੰਖਿਆਵਾਂ ਦੀ ਗਿਣਤੀ ਕਰ ਸਕਦੀ ਹੈ, ਅਤੇ SwiftUI view ਵਿੱਚ ਦਿਖਾਏ ਜਾਣ ਵਾਲੇ content ਨੂੰ ਵੀ ਤਿਆਰ ਕਰ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let a = 10
let b = 20
let c = a + b
```

ਇੱਥੇ `c` ਦਾ ਅਰਥ ਹੈ `a` ਅਤੇ `b` ਨੂੰ ਜੋੜਣ ਤੋਂ ਬਾਅਦ ਮਿਲਣ ਵਾਲਾ ਨਤੀਜਾ।

ਆਮ code ਵਿੱਚ ਇਹ ਲਿਖਣ ਦਾ ਢੰਗ ਬਹੁਤ ਆਮ ਹੈ।

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

ਸੁਝਾਅ: `Button` ਦੇ click event ਵਿੱਚ ਆਮ Swift code ਚਲਾਇਆ ਜਾ ਸਕਦਾ ਹੈ।

ਪਰ ਜੇ ਇਸੇ ਤਰ੍ਹਾਂ ਦਾ code ਸਿੱਧਾ SwiftUI view ਦੀਆਂ properties ਵਿੱਚ ਲਿਖਿਆ ਜਾਵੇ, ਤਾਂ ਸਮੱਸਿਆ ਆ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

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

ਇਹ code error ਦਿਖਾਏਗਾ।

ਦੇਖਣ ਵਿੱਚ ਲੱਗਦਾ ਹੈ ਕਿ `a` ਅਤੇ `b` ਪਹਿਲਾਂ ਹੀ `c` ਤੋਂ ਉੱਪਰ ਲਿਖੇ ਗਏ ਹਨ, ਇਸ ਲਈ `c` ਦੀ value ਗਿਣੀ ਜਾ ਸਕਦੀ ਹੈ।

ਪਰ struct ਦੀਆਂ properties declare ਕਰਦੇ ਸਮੇਂ ਇਹ ਲਿਖਣ ਦਾ ਢੰਗ ਸਿੱਧਾ ਵਰਤਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ।

## c ਨੂੰ ਸਿੱਧਾ a + b ਵਜੋਂ ਕਿਉਂ ਨਹੀਂ ਗਿਣ ਸਕਦੇ?

ਕਿਉਂਕਿ `a`, `b`, `c` button click event ਵਿੱਚ ਬਣੇ temporary constants ਨਹੀਂ ਹਨ। ਇਹ `ContentView` view ਦੀਆਂ properties ਹਨ।

Button click event ਵਿੱਚ ਇਹ code ਆਮ ਤੌਰ ਤੇ ਚੱਲ ਸਕਦਾ ਹੈ:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

ਕਿਉਂਕਿ button click ਹੋਣ ਤੋਂ ਬਾਅਦ code ਕ੍ਰਮਵਾਰ ਚੱਲਦਾ ਹੈ। ਪਹਿਲਾਂ `a` ਬਣਦਾ ਹੈ, ਫਿਰ `b` ਬਣਦਾ ਹੈ, ਅਤੇ ਆਖ਼ਰ ਵਿੱਚ `a + b` ਨਾਲ `c` ਗਿਣਿਆ ਜਾਂਦਾ ਹੈ।

ਪਰ view ਦੇ ਅੰਦਰ properties declare ਕਰਦੇ ਸਮੇਂ ਸਥਿਤੀ ਵੱਖਰੀ ਹੁੰਦੀ ਹੈ:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

ਇੱਥੇ `a`, `b`, `c` ਸਭ `ContentView` view ਦੀਆਂ properties ਹਨ।

ਜਦੋਂ `ContentView` view ਬਣਦਾ ਹੈ, Swift ਨੂੰ ਪਹਿਲਾਂ ਇਹ properties ਤਿਆਰ ਕਰਣੀਆਂ ਪੈਂਦੀਆਂ ਹਨ। ਬਣਾਉਣ ਦੀ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸੁਰੱਖਿਅਤ ਰੱਖਣ ਲਈ Swift ਇੱਕ instance stored property ਦੀ default value ਵਿੱਚ ਉਸੇ instance ਦੀਆਂ ਹੋਰ instance properties ਨੂੰ ਸਿੱਧਾ ਪੜ੍ਹਣ ਦੀ ਇਜਾਜ਼ਤ ਨਹੀਂ ਦਿੰਦਾ।

ਇਸ ਲਈ ਇਹ line error ਦਿਖਾਏਗੀ:

```swift
let c = a + b
```

ਸਧਾਰਨ ਤੌਰ ਤੇ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: **view ਦੇ ਅੰਦਰ properties declare ਕਰਦੇ ਸਮੇਂ, ਇੱਕ ਆਮ property ਨਾਲ ਦੂਜੀ ਆਮ property ਨੂੰ ਸਿੱਧਾ ਗਿਣਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ।**

ਇਸ ਤਰ੍ਹਾਂ ਦੀ property, ਜੋ value ਨੂੰ ਸਿੱਧਾ store ਕਰਦੀ ਹੈ, “stored property” ਕਹਿੰਦੀ ਹੈ। ਸਮਝਣ ਲਈ ਅਸੀਂ ਇਸਨੂੰ ਅਸਥਾਈ ਤੌਰ ਤੇ ਆਮ property ਮੰਨ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let a = 10
```

`a` ਵਿੱਚ `10` store ਹੈ।

```swift
let b = 20
```

`b` ਵਿੱਚ `20` store ਹੈ।

ਪਰ:

```swift
let c = a + b
```

ਇੱਥੇ `c` ਕੋਈ ਸਿੱਧੀ ਲਿਖੀ ਹੋਈ fixed value ਨਹੀਂ ਹੈ। ਇਹ `a + b` ਰਾਹੀਂ ਗਿਣੀ ਜਾਣੀ ਚਾਹੁੰਦੀ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ ਦੇ “ਮੌਜੂਦਾ ਡਾਟਾ ਤੋਂ ਨਤੀਜਾ ਲੈਣ” ਵਾਲੇ ਹਾਲਾਤ ਵਿੱਚ computed property ਜ਼ਿਆਦਾ ਢੁਕਵੀਂ ਹੁੰਦੀ ਹੈ।

ਇਸਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਬਦਲ ਸਕਦੇ ਹਾਂ:

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

ਇੱਥੇ `c` ਹੀ computed property ਹੈ।

```swift
var c: Int {
    return a + b
}
```

ਇਸਦਾ ਅਰਥ ਹੈ: **ਜਦੋਂ `c` ਵਰਤਣ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ, ਤਦੋਂ `a` ਅਤੇ `b` ਪੜ੍ਹੇ ਜਾਂਦੇ ਹਨ, ਅਤੇ `a + b` ਦਾ ਨਤੀਜਾ return ਕੀਤਾ ਜਾਂਦਾ ਹੈ।**

ਉਦਾਹਰਨ ਲਈ:

```swift
Text("c: \(c)")
```

ਜਦੋਂ `Text` ਵਿੱਚ `c` ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ, ਤਦੋਂ ਹੀ `c` ਦੀ ਗਿਣਤੀ ਚੱਲਦੀ ਹੈ।

## Computed property ਕੀ ਹੈ?

Computed property ਇੱਕ variable ਵਰਗੀ ਦਿਖਦੀ ਹੈ, ਪਰ ਇਹ ਆਪਣੇ ਆਪ data store ਨਹੀਂ ਕਰਦੀ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

ਇੱਥੇ `c` computed property ਹੈ।

ਇਹ ਆਮ property ਵਾਂਗ ਇੱਕ fixed value store ਨਹੀਂ ਕਰਦੀ। ਹਰ ਵਾਰ ਜਦੋਂ `c` ਪੜ੍ਹੀ ਜਾਂਦੀ ਹੈ, `{}` ਦੇ ਅੰਦਰਲਾ code ਮੁੜ ਚੱਲਦਾ ਹੈ ਅਤੇ ਗਿਣਿਆ ਹੋਇਆ ਨਤੀਜਾ return ਕਰਦਾ ਹੈ।

ਇਸਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹਾਂ:

```swift
var c: Int {
    return a + b
}
```

ਜਦੋਂ `c` ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ, `a + b` ਗਿਣਿਆ ਜਾਂਦਾ ਹੈ।

ਇਸ ਲਈ computed property ਇਸ ਹਾਲਾਤ ਲਈ ਢੁਕਵੀਂ ਹੈ: **ਕਿਸੇ ਨਤੀਜੇ ਨੂੰ ਵੱਖਰੇ ਤੌਰ ਤੇ store ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ, ਕਿਉਂਕਿ ਉਹ ਮੌਜੂਦਾ data ਤੋਂ ਗਿਣਿਆ ਜਾ ਸਕਦਾ ਹੈ।**

## ਬੁਨਿਆਦੀ ਲਿਖਣ ਦਾ ਢੰਗ

Computed property ਆਮ ਤੌਰ ਤੇ ਤਿੰਨ ਹਿੱਸਿਆਂ ਤੋਂ ਬਣਦੀ ਹੈ:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` ਨਾਲ declare ਕਰਨਾ

```swift
var c
```

Computed property ਨੂੰ ਲਾਜ਼ਮੀ ਤੌਰ ਤੇ `var` ਨਾਲ declare ਕਰਨਾ ਪੈਂਦਾ ਹੈ, `let` ਨਹੀਂ ਵਰਤਿਆ ਜਾ ਸਕਦਾ।

ਕਿਉਂਕਿ computed property ਕੋਈ fixed stored value ਨਹੀਂ ਹੁੰਦੀ, ਸਗੋਂ ਹਰ ਵਾਰ ਪੜ੍ਹਨ ਤੇ dynamically ਗਿਣਿਆ ਜਾਣ ਵਾਲਾ ਨਤੀਜਾ ਹੁੰਦੀ ਹੈ।

### 2. Return type ਲਿਖਣਾ

```swift
var c: Int
```

Computed property ਵਿੱਚ return type ਲਿਖਣਾ ਲਾਜ਼ਮੀ ਹੈ।

ਇੱਥੇ `c` ਅੰਤ ਵਿੱਚ ਇੱਕ integer return ਕਰਦਾ ਹੈ, ਇਸ ਲਈ type `Int` ਹੈ।

### 3. {} ਵਿੱਚ ਗਿਣਤੀ ਦੀ logic ਲਿਖਣਾ

```swift
{
    return a + b
}
```

`{}` ਵਿੱਚ ਗਿਣਤੀ ਦੀ logic ਲਿਖੀ ਜਾਂਦੀ ਹੈ। ਇੱਥੇ return ਹੋਣ ਵਾਲਾ ਨਤੀਜਾ `a + b` ਹੈ।

## return keyword

Computed property ਨੂੰ ਇੱਕ ਨਤੀਜਾ return ਕਰਨਾ ਪੈਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
var c: Int {
    return a + b
}
```

ਇੱਥੇ `return` ਦਾ ਅਰਥ ਹੈ: `a + b` ਦੀ ਗਿਣਤੀ ਦਾ ਨਤੀਜਾ ਬਾਹਰ return ਕਰਨਾ।

ਜੇ computed property ਦੇ ਅੰਦਰ ਸਿੱਧਾ ਨਤੀਜਾ ਬਣਾਉਣ ਵਾਲੀ ਸਿਰਫ਼ ਇੱਕ expression ਹੋਵੇ, ਤਾਂ `return` ਛੱਡਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
var c: Int {
    a + b
}
```

ਪਰ ਜੇ computed property ਦੇ ਅੰਦਰ ਕਈ lines ਦਾ code ਹੋਵੇ, ਤਾਂ ਨਤੀਜਾ ਸਪਸ਼ਟ ਤੌਰ ਤੇ return ਕਰਨ ਲਈ `return` ਵਰਤਣਾ ਪੈਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ਇੱਥੇ ਗਿਣਤੀ ਦੋ ਕਦਮਾਂ ਵਿੱਚ ਵੰਡੀ ਗਈ ਹੈ।

ਪਹਿਲਾ ਕਦਮ, ਕੁੱਲ ਕੀਮਤ ਗਿਣਣਾ:

```swift
let total = count * price
```

ਦੂਜਾ ਕਦਮ, ਕੁੱਲ ਕੀਮਤ ਨੂੰ text ਵਿੱਚ ਜੋੜ ਕੇ return ਕਰਨਾ:

```swift
return "Total：\(total) $"
```

ਜੇ `return` ਹਟਾ ਦਿੱਤਾ ਜਾਵੇ:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

ਇਹ code error ਦਿਖਾਏਗਾ।

ਕਾਰਣ: **ਇਸ computed property ਵਿੱਚ ਪਹਿਲਾਂ ਹੀ ਕਈ lines ਦਾ code ਹੈ, Swift ਆਪਣੇ ਆਪ ਇਹ ਫੈਸਲਾ ਨਹੀਂ ਕਰ ਸਕਦਾ ਕਿ ਆਖ਼ਰੀ return ਹੋਣ ਵਾਲਾ ਨਤੀਜਾ ਕਿਹੜੀ line ਹੈ।**

ਇਸ ਲਈ, ਜੇ computed property ਵਿੱਚ ਸਿਰਫ਼ ਇੱਕ expression ਹੋਵੇ ਜੋ ਨਤੀਜਾ ਬਣਾਉਂਦੀ ਹੈ, ਤਾਂ `return` ਛੱਡਿਆ ਜਾ ਸਕਦਾ ਹੈ।

```swift
var c: Int {
    a + b
}
```

ਜੇ computed property ਵਿੱਚ ਕਈ lines ਦਾ code ਹੋਵੇ, ਤਾਂ `return` ਸਪਸ਼ਟ ਤੌਰ ਤੇ ਲਿਖਣਾ ਚੰਗਾ ਹੈ।

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Computed property ਅਤੇ ਆਮ property ਦਾ ਫਰਕ

ਆਮ property data store ਕਰਦੀ ਹੈ।

```swift
var c = 30
```

ਇੱਥੇ `c` ਇੱਕ ਨਿਰਧਾਰਿਤ value store ਕਰਦੀ ਹੈ: `30`।

Computed property data store ਨਹੀਂ ਕਰਦੀ।

```swift
var c: Int {
    a + b
}
```

ਇੱਥੇ `c` `30` store ਨਹੀਂ ਕਰਦੀ। ਇਹ ਸਿਰਫ਼ ਗਿਣਣ ਦਾ ਤਰੀਕਾ ਦਿੰਦੀ ਹੈ।

ਜਦੋਂ `c` ਪੜ੍ਹੀ ਜਾਂਦੀ ਹੈ, Swift ਇਹ ਚਲਾਉਂਦਾ ਹੈ:

```swift
a + b
```

ਫਿਰ ਗਿਣਿਆ ਹੋਇਆ ਨਤੀਜਾ return ਕਰਦਾ ਹੈ।

ਇਸ ਲਈ computed property ਉਹਨਾਂ ਹਾਲਾਤਾਂ ਲਈ ਢੁਕਵੀਂ ਹੈ ਜਿੱਥੇ ਨਤੀਜਾ ਹੋਰ data ਦੇ ਆਧਾਰ ਤੇ ਗਿਣਣਾ ਹੁੰਦਾ ਹੈ।

## body ਵੀ computed property ਹੈ

Computed property ਸਿੱਖਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ SwiftUI ਵਿੱਚ ਸਭ ਤੋਂ ਆਮ ਵੇਖੇ ਜਾਣ ਵਾਲੇ ਇਸ code ਨੂੰ ਨਵੀਂ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹਾਂ:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ਇੱਥੇ `body` ਵੀ computed property ਹੈ।

ਇਹ `var` ਨਾਲ declare ਹੁੰਦੀ ਹੈ:

```swift
var body
```

ਇਸਦਾ return type ਹੈ:

```swift
some View
```

ਇਸਦੇ `{}` ਵਿੱਚ return ਹੋਣ ਵਾਲੀ ਚੀਜ਼ SwiftUI view content ਹੈ:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

ਇਸ ਲਈ `body` ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹਾਂ: ਜਦੋਂ SwiftUI ਨੂੰ ਇਹ view ਦਿਖਾਉਣਾ ਹੁੰਦਾ ਹੈ, SwiftUI `body` ਪੜ੍ਹਦਾ ਹੈ ਅਤੇ `body` ਵੱਲੋਂ return ਕੀਤੇ content ਦੇ ਆਧਾਰ ਤੇ interface ਬਣਾਉਂਦਾ ਹੈ।

ਜੇ `return` ਲਿਖਿਆ ਜਾਵੇ, ਤਾਂ ਇਹ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ਪਰ SwiftUI ਵਿੱਚ ਅਸੀਂ ਆਮ ਤੌਰ ਤੇ `return` ਛੱਡ ਦਿੰਦੇ ਹਾਂ ਅਤੇ ਸਿੱਧਾ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਦੇ ਹਾਂ:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ਜਦੋਂ `@State` data ਬਦਲਦਾ ਹੈ, SwiftUI `body` ਨੂੰ ਮੁੜ ਪੜ੍ਹਦਾ ਹੈ ਅਤੇ ਨਵੇਂ data ਦੇ ਆਧਾਰ ਤੇ interface update ਕਰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

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

button click ਕਰਨ ਤੋਂ ਬਾਅਦ `count` ਬਦਲਦਾ ਹੈ।

```swift
count += 1
```

`count` ਬਦਲਣ ਤੋਂ ਬਾਅਦ SwiftUI `body` ਨੂੰ ਮੁੜ ਗਿਣਦਾ ਹੈ, ਇਸ ਲਈ interface ਵਿੱਚ text ਵੀ update ਹੋ ਜਾਂਦਾ ਹੈ।

```swift
Text("count: \(count)")
```

ਇਹ ਵੀ SwiftUI ਵਿੱਚ data ਬਦਲਣ ਤੋਂ ਬਾਅਦ interface ਦੇ ਆਪੇ refresh ਹੋਣ ਦਾ ਕਾਰਣ ਹੈ।

### body ਵਿੱਚ complex calculation ਲਿਖਣ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ

ਕਿਉਂਕਿ `body` computed property ਹੈ, ਇਹ ਕਈ ਵਾਰ ਪੜ੍ਹੀ ਅਤੇ ਮੁੜ ਗਿਣੀ ਜਾ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

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

ਜਦੋਂ `name` ਬਦਲਦਾ ਹੈ, SwiftUI `body` ਨੂੰ ਮੁੜ ਗਿਣਦਾ ਹੈ।

ਉਸ ਸਮੇਂ `body` ਦੇ ਅੰਦਰਲਾ code ਵੀ ਮੁੜ ਚੱਲਦਾ ਹੈ, ਅਤੇ `num` ਵੀ ਮੁੜ ਬਣਦਾ ਹੈ।

```swift
let num = 10
```

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ `num` ਬਹੁਤ simple ਹੈ, ਇਸ ਲਈ ਇਸਦਾ ਅਸਰ ਵੱਡਾ ਨਹੀਂ।

ਪਰ ਜੇ `body` ਵਿੱਚ complex calculations ਕੀਤੀਆਂ ਜਾਣ, ਜਿਵੇਂ ਵੱਡੇ data ਦੀ filtering, sorting, image processing ਆਦਿ, ਤਾਂ ਇਹ interface ਦੀ smoothness ਤੇ ਅਸਰ ਪਾ ਸਕਦਾ ਹੈ।

ਇਸ ਲਈ SwiftUI ਵਿੱਚ `body` ਨੂੰ ਮੁੱਖ ਤੌਰ ਤੇ interface structure ਬਿਆਨ ਕਰਨ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।

ਸਧਾਰਨ temporary data `body` ਵਿੱਚ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ।

Complex calculations ਨੂੰ `body` ਤੋਂ ਬਾਹਰ computed property, method, ਜਾਂ ਵੱਖਰੇ data processing ਹਿੱਸੇ ਵਿੱਚ ਰੱਖਣਾ ਚੰਗਾ ਹੈ।

## ਉਦਾਹਰਨ: ਗਿਣਤੀ ਅਤੇ ਕੁੱਲ ਕੀਮਤ

ਹੁਣ ਅਸੀਂ ਇੱਕ simple example ਰਾਹੀਂ computed property ਨੂੰ ਸਮਝਾਂਗੇ।

ਮੰਨ ਲਓ ਇੱਕ carrot ਦੀ ਕੀਮਤ 2 $ ਹੈ। user button click ਕਰਕੇ ਖਰੀਦਣ ਦੀ ਗਿਣਤੀ ਬਦਲ ਸਕਦਾ ਹੈ, ਅਤੇ interface ਵਿੱਚ ਕੁੱਲ ਕੀਮਤ ਦਿਖਾਉਣੀ ਹੈ।

ਕੁੱਲ ਕੀਮਤ ਦੀ ਗਿਣਤੀ:

```text
ਗਿਣਤੀ * ਇਕਾਈ ਕੀਮਤ
```

ਜੇ ਕੁੱਲ ਕੀਮਤ ਨੂੰ ਆਮ variable ਵਿੱਚ store ਕੀਤਾ ਜਾਵੇ, ਤਾਂ ਇਹ ਕੁਝ ਔਖਾ ਹੋਵੇਗਾ।

ਕਿਉਂਕਿ ਹਰ ਵਾਰ ਗਿਣਤੀ ਬਦਲਣ ਤੇ ਕੁੱਲ ਕੀਮਤ ਨੂੰ ਹੱਥੋਂ update ਕਰਨਾ ਪਵੇਗਾ।

ਇਸ ਤੋਂ ਵਧੀਆ ਤਰੀਕਾ computed property ਵਰਤਣਾ ਹੈ:

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

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਨਤੀਜਾ:

![view](../../Resource/024_view.png)

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ:

```swift
@State private var count = 1
```

`count` carrot ਦੀ ਗਿਣਤੀ ਦਿਖਾਉਂਦਾ ਹੈ। button click ਕਰਨ ਤੇ `count` ਬਦਲਦਾ ਹੈ।

```swift
private let price = 2
```

`price` carrot ਦੀ ਇਕਾਈ ਕੀਮਤ ਦਿਖਾਉਂਦਾ ਹੈ। ਇੱਥੇ ਇਹ fixed value ਹੈ, ਇਸ ਲਈ `let` ਵਰਤਿਆ ਗਿਆ ਹੈ।

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` ਕੁੱਲ ਕੀਮਤ ਦਿਖਾਉਂਦਾ ਹੈ।

ਇਸਨੂੰ ਵੱਖਰੇ ਤੌਰ ਤੇ store ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ, ਕਿਉਂਕਿ ਕੁੱਲ ਕੀਮਤ ਹਮੇਸ਼ਾ `count * price` ਰਾਹੀਂ ਗਿਣੀ ਜਾ ਸਕਦੀ ਹੈ।

ਜਦੋਂ `count` `1` ਹੁੰਦਾ ਹੈ:

```swift
totalPrice = 1 * 2
```

ਦਿਖਾਇਆ ਜਾਣ ਵਾਲਾ ਨਤੀਜਾ:

```swift
totalPrice: 2 $
```

`+` button click ਕਰਨ ਤੋਂ ਬਾਅਦ `count` `2` ਬਣ ਜਾਂਦਾ ਹੈ।

ਇਸ ਵੇਲੇ `totalPrice` ਮੁੜ ਪੜ੍ਹਿਆ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਇਹ ਮੁੜ ਗਿਣਿਆ ਜਾਂਦਾ ਹੈ:

```swift
totalPrice = 2 * 2
```

ਦਿਖਾਇਆ ਜਾਣ ਵਾਲਾ ਨਤੀਜਾ:

```swift
totalPrice: 4 $
```

ਇਹੀ computed property ਦਾ ਕੰਮ ਹੈ: ਮੌਜੂਦਾ data ਦੇ ਆਧਾਰ ਤੇ ਨਵਾਂ ਨਤੀਜਾ dynamically ਗਿਣਣਾ।

## Computed property ਨੂੰ condition check ਲਈ ਵੀ ਵਰਤ ਸਕਦੇ ਹਾਂ

Computed property ਸਿਰਫ਼ numbers ਹੀ ਨਹੀਂ ਗਿਣਦੀ, ਇਹ judgment result ਵੀ return ਕਰ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ ਅਸੀਂ ਗਿਣਤੀ ਦੀ ਘੱਟੋ-ਘੱਟ value 1 ਰੱਖਣੀ ਚਾਹੀਏ।

ਜਦੋਂ ਗਿਣਤੀ ਪਹਿਲਾਂ ਹੀ 1 ਹੈ, ਤਾਂ `-` button ਨੂੰ ਹੋਰ ਘਟਾਉਣਾ ਨਹੀਂ ਚਾਹੀਦਾ।

ਇਸ ਲਈ ਇੱਕ computed property ਜੋੜ ਸਕਦੇ ਹਾਂ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

ਪੂਰਾ code:

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

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਨਤੀਜਾ:

![view](../../Resource/024_view1.png)

ਇੱਥੇ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

ਇਹ code ਦੱਸਦਾ ਹੈ ਕਿ ਮੌਜੂਦਾ ਗਿਣਤੀ ਨੂੰ ਹੋਰ ਘਟਾਇਆ ਜਾ ਸਕਦਾ ਹੈ ਜਾਂ ਨਹੀਂ।

ਜਦੋਂ `count` `1` ਤੋਂ ਵੱਡਾ ਹੁੰਦਾ ਹੈ:

```swift
canDecrease == true
```

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਘਟਾਇਆ ਜਾ ਸਕਦਾ ਹੈ।

ਜਦੋਂ `count` `1` ਦੇ ਬਰਾਬਰ ਹੁੰਦਾ ਹੈ:

```swift
canDecrease == false
```

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਹੁਣ ਹੋਰ ਘਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਦਾ।

### Button ਦੇ ਅੰਦਰ condition check

Button ਵਿੱਚ ਇਹ code ਵਰਤਿਆ ਗਿਆ ਹੈ:

```swift
if canDecrease {
    count -= 1
}
```

ਸਿਰਫ਼ ਜਦੋਂ `canDecrease` `true` ਹੁੰਦਾ ਹੈ, ਤਦੋਂ ਹੀ `count` ਘਟਾਇਆ ਜਾਂਦਾ ਹੈ।

### View ਦਾ foreground color control ਕਰਨਾ

`canDecrease` ਨਾਲ button ਦਾ foreground color ਵੀ control ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ਇੱਥੇ ternary operator ਵਰਤਿਆ ਗਿਆ ਹੈ:

```swift
canDecrease ? Color.primary : Color.gray
```

ਇਸ code ਦਾ ਅਰਥ ਹੈ: ਜੇ `canDecrease` `true` ਹੈ, ਤਾਂ foreground color `Color.primary` ਵਰਤਿਆ ਜਾਵੇਗਾ; ਜੇ `canDecrease` `false` ਹੈ, ਤਾਂ foreground color `Color.gray` ਵਰਤਿਆ ਜਾਵੇਗਾ।

`Color.primary` SwiftUI ਵੱਲੋਂ ਦਿੱਤਾ ਗਿਆ system semantic color ਹੈ। ਇਹ ਮੌਜੂਦਾ interface ਦੇ main text color ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

Light Mode ਵਿੱਚ `Color.primary` ਆਮ ਤੌਰ ਤੇ ਕਾਲੇ ਰੰਗ ਦੇ ਨੇੜੇ ਹੁੰਦਾ ਹੈ; Dark Mode ਵਿੱਚ ਆਮ ਤੌਰ ਤੇ ਚਿੱਟੇ ਰੰਗ ਦੇ ਨੇੜੇ ਹੁੰਦਾ ਹੈ।

ਇਸ ਲਈ `Color.primary` ਵਰਤਣ ਦਾ ਫਾਇਦਾ ਹੈ: ਇਹ Light Mode ਅਤੇ Dark Mode ਦੇ ਅਨੁਸਾਰ ਆਪਣੇ ਆਪ adjust ਹੋ ਜਾਂਦਾ ਹੈ।

### View ਦੀ disabled state control ਕਰਨਾ

`disabled` view disabled state ਵਿੱਚ ਹੈ ਜਾਂ ਨਹੀਂ, ਇਸਨੂੰ control ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ:

```swift
.disabled(!canDecrease)
```

ਜਦੋਂ `disabled` `false` ਹੁੰਦਾ ਹੈ, view click ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਜਦੋਂ `disabled` `true` ਹੁੰਦਾ ਹੈ, view disabled state ਵਿੱਚ ਹੁੰਦਾ ਹੈ ਅਤੇ click ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।

ਇੱਥੇ `canDecrease` ਨੂੰ condition ਵਜੋਂ ਵਰਤਣ ਨਾਲ code ਸਮਝਣਾ ਆਸਾਨ ਹੁੰਦਾ ਹੈ।

`canDecrease` ਵੇਖਦੇ ਹੀ ਪਤਾ ਲੱਗ ਜਾਂਦਾ ਹੈ ਕਿ ਇਸਦਾ ਅਰਥ ਹੈ “ਮੌਜੂਦਾ ਹਾਲਾਤ ਵਿੱਚ ਹੋਰ ਘਟਾਇਆ ਜਾ ਸਕਦਾ ਹੈ ਜਾਂ ਨਹੀਂ”।

### ਵਾਧੂ ਵਿਆਖਿਆ: ਦੋ ਵਾਰ check ਕਿਉਂ?

`-` button ਵਿੱਚ:

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

ਇੱਥੇ `.disabled(!canDecrease)` ਵੀ ਵਰਤਿਆ ਗਿਆ ਹੈ, ਅਤੇ button ਦੇ ਅੰਦਰ `if canDecrease` ਵੀ ਵਰਤਿਆ ਗਿਆ ਹੈ।

`.disabled(!canDecrease)` interface level ਤੇ button ਨੂੰ disabled ਕਰਦਾ ਹੈ, ਤਾਂ ਜੋ user ਇਸਨੂੰ click ਨਾ ਕਰ ਸਕੇ।

`if canDecrease` code ਚੱਲਣ ਤੋਂ ਪਹਿਲਾਂ ਇੱਕ ਵਾਰ ਹੋਰ check ਕਰਦਾ ਹੈ। ਸਿਰਫ਼ ਜਦੋਂ ਘਟਾਇਆ ਜਾ ਸਕਦਾ ਹੈ, ਤਦੋਂ ਹੀ `count -= 1` ਚੱਲਦਾ ਹੈ।

ਇਹ double protection ਹੈ। ਅਸਲ development ਵਿੱਚ, ਜੇ button ਪਹਿਲਾਂ ਹੀ disabled ਹੈ, ਤਾਂ ਅੰਦਰਲਾ condition ਛੱਡਿਆ ਜਾ ਸਕਦਾ ਹੈ। ਪਰ teaching example ਵਿੱਚ ਇਸਨੂੰ ਰੱਖਣ ਨਾਲ `canDecrease` ਦੀ ਭੂਮਿਕਾ ਹੋਰ ਸਪਸ਼ਟ ਹੁੰਦੀ ਹੈ।

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਮੁੱਖ ਤੌਰ ਤੇ computed property ਸਿੱਖੀ।

Computed property value ਨੂੰ ਸਿੱਧਾ store ਨਹੀਂ ਕਰਦੀ। ਜਦੋਂ ਇਹ ਪੜ੍ਹੀ ਜਾਂਦੀ ਹੈ, ਤਾਂ ਮੌਜੂਦਾ data ਦੇ ਆਧਾਰ ਤੇ ਨਤੀਜਾ ਗਿਣਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
var c: Int {
    a + b
}
```

ਇੱਥੇ `c` ਨੂੰ ਵੱਖਰੇ ਤੌਰ ਤੇ store ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ, ਕਿਉਂਕਿ ਇਹ `a + b` ਰਾਹੀਂ ਗਿਣੀ ਜਾ ਸਕਦੀ ਹੈ।

Computed property ਨੂੰ ਲਾਜ਼ਮੀ ਤੌਰ ਤੇ `var` ਨਾਲ declare ਕਰਨਾ ਪੈਂਦਾ ਹੈ, ਅਤੇ return type ਵੀ ਲਿਖਣਾ ਪੈਂਦਾ ਹੈ।

```swift
var canDecrease: Bool {
    count > 1
}
```

Computed property ਸਿਰਫ਼ numerical value ਹੀ ਨਹੀਂ, judgment result, text content, ਇੱਥੋਂ ਤੱਕ ਕਿ SwiftUI view content ਵੀ return ਕਰ ਸਕਦੀ ਹੈ।

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ `return` ਵੀ ਸਿੱਖਿਆ।

`return` ਦਾ ਅਰਥ ਹੈ ਇੱਕ ਨਤੀਜਾ return ਕਰਨਾ:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ਜੇ computed property ਦੇ ਅੰਦਰ ਸਿਰਫ਼ ਇੱਕ expression ਹੋਵੇ ਜੋ ਸਿੱਧਾ ਨਤੀਜਾ ਦਿੰਦੀ ਹੈ, ਤਾਂ `return` ਛੱਡਿਆ ਜਾ ਸਕਦਾ ਹੈ।

```swift
var totalPrice: Int {
    count * price
}
```

ਇਸ ਤੋਂ ਇਲਾਵਾ, ਅਸੀਂ `Color.primary` ਅਤੇ `disabled` ਬਾਰੇ ਵੀ ਜਾਣਿਆ।

`Color.primary` SwiftUI ਦਾ system semantic color ਹੈ। ਇਹ Light Mode ਅਤੇ Dark Mode ਦੇ ਅਨੁਸਾਰ display effect ਆਪਣੇ ਆਪ adjust ਕਰਦਾ ਹੈ।

```swift
.foregroundStyle(Color.primary)
```

`disabled` view disabled ਹੈ ਜਾਂ ਨਹੀਂ, ਇਸਨੂੰ control ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

```swift
.disabled(true)
```

ਇਸਦਾ ਅਰਥ ਹੈ disabled, click ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।

```swift
.disabled(false)
```

ਇਸਦਾ ਅਰਥ ਹੈ available, click ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਇਸ ਲਈ computed property SwiftUI ਵਿੱਚ ਬਹੁਤ ਆਮ ਹੈ। ਇਹ calculation results, conditions ਅਤੇ display content ਨੂੰ ਹੋਰ ਸਪਸ਼ਟ ਢੰਗ ਨਾਲ organize ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ।
