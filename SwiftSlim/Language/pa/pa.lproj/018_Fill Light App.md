# ਫ਼ਿਲ ਲਾਈਟ ਐਪ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ ਬਹੁਤ ਹੀ ਦਿਲਚਸਪ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਬਣਾਵਾਂਗੇ। ਜਦੋਂ ਰਾਤ ਆਉਂਦੀ ਹੈ, ਅਸੀਂ ਫੋਨ ਦੀ ਸਕ੍ਰੀਨ 'ਤੇ ਵੱਖ-ਵੱਖ ਰੰਗ ਦਿਖਾ ਸਕਦੇ ਹਾਂ ਅਤੇ ਇਸਨੂੰ ਇੱਕ ਸਧਾਰਣ ਫ਼ਿਲ ਲਾਈਟ ਵਜੋਂ ਵਰਤ ਸਕਦੇ ਹਾਂ।

ਇਹ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਸਕ੍ਰੀਨ 'ਤੇ ਟੈਪ ਕਰਕੇ ਰੰਗ ਬਦਲ ਸਕਦੀ ਹੈ, ਅਤੇ ਸਲਾਈਡਰ ਦੀ ਮਦਦ ਨਾਲ ਚਮਕ ਵੀ ਠੀਕ ਕਰ ਸਕਦੀ ਹੈ।

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, ਅਸੀਂ `brightness` ਦੀ ਮਦਦ ਨਾਲ ਵਿਊ ਦੀ ਚਮਕ ਕਿਵੇਂ ਠੀਕ ਕਰਨੀ ਹੈ, `onTapGesture` ਨਾਲ ਵਿਊ ਵਿੱਚ ਟੈਪ ਜੈਸਚਰ ਕਿਵੇਂ ਜੋੜਨਾ ਹੈ, ਅਤੇ `Slider` ਕੰਟਰੋਲ ਬਾਰੇ ਸਿੱਖਾਂਗੇ।

ਨਤੀਜਾ:

![Color](../../Resource/018_color.png)

## ਰੰਗ ਦਿਖਾਉਣਾ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਆਓ ਵਿਊ ਵਿੱਚ ਇੱਕ ਰੰਗ ਦਿਖਾਈਏ।

SwiftUI ਵਿੱਚ, `Color` ਸਿਰਫ਼ ਰੰਗ ਨੂੰ ਨਹੀਂ ਦਰਸਾਂਦਾ, ਇਸਨੂੰ ਇੱਕ ਵਿਊ ਵਜੋਂ ਵੀ ਦਿਖਾਇਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

ਇੱਥੇ `Color.red` ਇੱਕ ਲਾਲ ਵਿਊ ਨੂੰ ਦਰਸਾਂਦਾ ਹੈ। `.ignoresSafeArea()` ਰੰਗ ਵਾਲੇ ਵਿਊ ਨੂੰ ਪੂਰੀ ਸਕ੍ਰੀਨ 'ਤੇ ਫੈਲਾ ਦਿੰਦਾ ਹੈ, ਜਿਸ ਕਰਕੇ ਇਹ ਇੱਕ ਅਸਲੀ ਫ਼ਿਲ ਲਾਈਟ ਪ੍ਰਭਾਵ ਵਾਂਗ ਲੱਗਦਾ ਹੈ।

ਨਤੀਜਾ:

![Color](../../Resource/018_color1.png)

### ਰੰਗਾਂ ਦੀ array ਅਤੇ index

ਇਸ ਵੇਲੇ ਸਿਰਫ਼ ਇੱਕ ਹੀ ਰੰਗ ਦਿਖ ਰਿਹਾ ਹੈ। ਪਰ ਫ਼ਿਲ ਲਾਈਟ ਆਮ ਤੌਰ 'ਤੇ ਸਿਰਫ਼ ਇੱਕ ਰੰਗ ਦੀ ਨਹੀਂ ਹੁੰਦੀ। ਇਹ ਨੀਲਾ, ਪੀਲਾ, ਜਾਮਨੀ, ਚਿੱਟਾ ਅਤੇ ਹੋਰ ਰੰਗ ਵੀ ਦਿਖਾ ਸਕਦੀ ਹੈ।

ਅਸੀਂ ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ ਸਕ੍ਰੀਨ 'ਤੇ ਟੈਪ ਕਰਨ ਨਾਲ ਵੱਖ-ਵੱਖ ਰੰਗਾਂ ਵਿੱਚ ਬਦਲਾਅ ਹੋਵੇ। ਅਸੀਂ ਇਹ ਰੰਗ ਇੱਕ array ਵਿੱਚ ਰੱਖ ਕੇ ਇਕੱਠੇ manage ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Array “ਇੱਕੋ ਕਿਸਮ ਦੇ ਡਾਟਾ ਦੇ ਸਮੂਹ” ਨੂੰ ਸੰਭਾਲਣ ਲਈ ਢੁੱਕਵੀ ਹੁੰਦੀ ਹੈ। ਇੱਥੇ array ਦਾ ਹਰ element ਇੱਕ `Color` ਹੈ।

ਜੇ ਅਸੀਂ ਕੋਈ ਇੱਕ ਖ਼ਾਸ ਰੰਗ ਦਿਖਾਉਣਾ ਚਾਹੀਏ, ਤਾਂ ਅਸੀਂ index ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
colors[0]
```

ਇਸਦਾ ਮਤਲਬ ਹੈ array ਦੇ `0` index 'ਤੇ ਮੌਜੂਦ ਰੰਗ ਨੂੰ ਲੈਣਾ, ਯਾਨੀ ਪਹਿਲਾ ਰੰਗ।

ਹੁਣ ਕੋਡ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

ਇਸ ਤਰੀਕੇ ਨਾਲ ਸਕ੍ਰੀਨ array ਦਾ ਪਹਿਲਾ ਰੰਗ, ਯਾਨੀ ਲਾਲ, ਦਿਖਾਏਗੀ।

### index ਨਾਲ ਰੰਗ ਨੂੰ ਨਿਯੰਤਰਿਤ ਕਰਨਾ

ਜੇ ਅਸੀਂ ਵੱਖ-ਵੱਖ ਰੰਗਾਂ ਵਿੱਚ ਬਦਲਣਾ ਹੈ, ਤਾਂ index ਨੂੰ ਸਿੱਧਾ ਲਿਖਣ ਦੀ ਬਜਾਇ ਉਸਨੂੰ ਸੰਭਾਲਣ ਲਈ ਇੱਕ variable ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

ਅਸੀਂ index ਨੂੰ ਸੰਭਾਲਣ ਲਈ `@State` ਵਰਤ ਕੇ ਇੱਕ variable ਘੋਸ਼ਿਤ ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
@State private var index = 0
```

ਇੱਥੇ `index` ਮੌਜੂਦਾ ਰੰਗ ਦਾ index ਦਰਸਾਉਂਦਾ ਹੈ।

ਜਦੋਂ `index` ਬਦਲਦਾ ਹੈ, ਤਾਂ SwiftUI ਇੰਟਰਫੇਸ ਨੂੰ ਦੁਬਾਰਾ calculate ਕਰਦਾ ਹੈ ਅਤੇ ਦਿਖਾਈ ਜਾਣ ਵਾਲਾ content update ਕਰਦਾ ਹੈ।

ਫਿਰ ਪੁਰਾਣੇ `colors[0]` ਨੂੰ ਬਦਲ ਕੇ ਇਹ ਲਿਖਦੇ ਹਾਂ:

```swift
colors[index]
```

ਇਸ ਤਰ੍ਹਾਂ, ਵਿਊ ਵਿੱਚ ਦਿਖਣ ਵਾਲਾ ਰੰਗ `index` ਦੁਆਰਾ ਨਿਰਧਾਰਿਤ ਹੁੰਦਾ ਹੈ।

ਹੁਣ ਕੋਡ ਇਸ ਤਰ੍ਹਾਂ ਬਣ ਜਾਂਦਾ ਹੈ:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

ਜਦੋਂ `index` ਬਦਲੇਗਾ, `colors[index]` ਵੀ ਹੋਰ ਰੰਗ ਦਿਖਾਏਗਾ।

ਉਦਾਹਰਨ ਲਈ:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

ਇੱਕ ਗੱਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖਣ ਵਾਲੀ ਹੈ ਕਿ `index` array ਦੇ ਸਭ ਤੋਂ ਵੱਡੇ index ਤੋਂ ਅੱਗੇ ਨਹੀਂ ਜਾਣਾ ਚਾਹੀਦਾ, ਨਹੀਂ ਤਾਂ out-of-range error ਆਵੇਗੀ।

## ਟੈਪ ਜੈਸਚਰ

ਹੁਣ ਅਸੀਂ `index` ਦੇ ਅਨੁਸਾਰ ਵੱਖ-ਵੱਖ ਰੰਗ ਦਿਖਾ ਸਕਦੇ ਹਾਂ, ਪਰ ਅਜੇ ਟੈਪ ਕਰਕੇ ਰੰਗ ਨਹੀਂ ਬਦਲ ਸਕਦੇ।

ਪਿਛਲੇ “Quote Carousel” ਪਾਠ ਵਿੱਚ ਅਸੀਂ quote ਬਦਲਣ ਲਈ `Button` ਵਰਤਿਆ ਸੀ।

ਪਰ ਇਸ ਵਾਰ ਅਸੀਂ “ਪੂਰੇ ਰੰਗ ਵਾਲੇ ਖੇਤਰ 'ਤੇ ਟੈਪ” ਕਰਕੇ ਰੰਗ ਬਦਲਣਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਇਸ ਲਈ `onTapGesture` ਹੋਰ ਉਚਿਤ ਹੈ।

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

ਜਦੋਂ ਅਸੀਂ ਰੰਗ ਵਾਲੇ ਵਿਊ 'ਤੇ ਟੈਪ ਕਰਦੇ ਹਾਂ, ਤਾਂ ਇਹ ਕੋਡ ਚੱਲਦਾ ਹੈ:

```swift
index += 1
```

ਇਸਦਾ ਮਤਲਬ ਹੈ `index` ਨੂੰ `1` ਨਾਲ ਵਧਾਉਣਾ। index ਵਧਣ ਤੋਂ ਬਾਅਦ `colors[index]` array ਦਾ ਅਗਲਾ ਰੰਗ ਦਿਖਾਏਗਾ।

### `onTapGesture`

`onTapGesture` ਇੱਕ gesture modifier ਹੈ, ਜੋ ਕਿਸੇ ਵਿਊ ਵਿੱਚ ਟੈਪ action ਜੋੜਦਾ ਹੈ।

ਮੂਲ ਵਰਤੋਂ:

```swift
.onTapGesture {
    // code
}
```

ਉਦਾਹਰਨ:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

ਜਦੋਂ ਇਸ ਲਾਲ ਵਿਊ 'ਤੇ ਟੈਪ ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ braces ਦੇ ਅੰਦਰ ਵਾਲਾ ਕੋਡ ਚਲਦਾ ਹੈ ਅਤੇ console ਵਿੱਚ ਇਹ output ਮਿਲਦਾ ਹੈ:

```swift
Click color
```

`onTapGesture` ਰਾਹੀਂ, ਅਸੀਂ ਤੈਅ ਕਰ ਸਕਦੇ ਹਾਂ ਕਿ ਕਿਸੇ ਵਿਊ 'ਤੇ ਟੈਪ ਹੋਣ ਤੋਂ ਬਾਅਦ ਕੀ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।

### `Button` ਨਾਲ ਫ਼ਰਕ

ਅਸੀਂ ਪਹਿਲਾਂ `Button` ਵਿਊ ਬਾਰੇ ਸਿੱਖਿਆ ਸੀ। `Button` ਅਤੇ `onTapGesture` ਦੋਵੇਂ ਟੈਪ action ਸੰਭਾਲ ਸਕਦੇ ਹਨ, ਪਰ ਉਨ੍ਹਾਂ ਦੇ ਵਰਤੋਂ ਵਾਲੇ ਹਾਲਾਤ ਪੂਰੀ ਤਰ੍ਹਾਂ ਇੱਕੋ ਜਿਹੇ ਨਹੀਂ ਹੁੰਦੇ।

`onTapGesture` “ਪਹਿਲਾਂ ਤੋਂ ਮੌਜੂਦ ਕਿਸੇ ਵਿਊ ਵਿੱਚ ਟੈਪ ਕਰਨ ਦੀ ਸਮਰੱਥਾ ਜੋੜਣ” ਲਈ ਹੋਰ ਉਚਿਤ ਹੈ, ਜਿਵੇਂ `Color`, `Image`, `Text` ਜਾਂ ਹੋਰ ਆਮ ਵਿਊ।

ਦੂਜੇ ਪਾਸੇ, `Button` ਤਦੋਂ ਹੋਰ ਉਚਿਤ ਹੁੰਦਾ ਹੈ ਜਦੋਂ ਅਸੀਂ “Confirm”, “Submit” ਜਾਂ “Delete” ਵਰਗਾ ਕੋਈ ਸਪਸ਼ਟ ਬਟਨ ਦਰਸਾਉਣਾ ਚਾਹੁੰਦੇ ਹਾਂ।

ਇਸ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਵਿੱਚ ਅਸੀਂ ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ ਰੰਗ ਬਦਲਣ ਵਾਲਾ ਫੰਕਸ਼ਨ ਹੋਰ ਸਧਾਰਣ ਹੋਵੇ। ਪੂਰੇ ਰੰਗ ਵਾਲੇ ਖੇਤਰ 'ਤੇ ਟੈਪ ਕਰਨ ਨਾਲ ਰੰਗ ਬਦਲ ਜਾਵੇ, ਇਸ ਲਈ ਇੱਥੇ `onTapGesture` ਇੱਕ ਵਧੀਆ ਚੋਣ ਹੈ।

## index ਦੀ ਸਮੱਸਿਆ

ਹੁਣ ਅਸੀਂ ਸਕ੍ਰੀਨ 'ਤੇ ਟੈਪ ਕਰਕੇ ਵੱਖ-ਵੱਖ ਰੰਗਾਂ ਵਿਚਕਾਰ ਬਦਲਾਅ ਕਰ ਸਕਦੇ ਹਾਂ।

ਪਰ ਇੱਥੇ ਇੱਕ ਮਹੱਤਵਪੂਰਨ ਸਮੱਸਿਆ ਹੈ: **index array ਦੀ ਸੀਮਾ ਤੋਂ ਬਾਹਰ ਜਾ ਸਕਦਾ ਹੈ**।

ਉਦਾਹਰਨ:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

ਜੇ ਅਸੀਂ ਸਕ੍ਰੀਨ 'ਤੇ ਵਾਰ-ਵਾਰ ਟੈਪ ਕਰਦੇ ਰਹੀਏ, ਤਾਂ `index` ਆਖ਼ਿਰ ਵਿੱਚ `4` ਹੋ ਜਾਵੇਗਾ, ਅਤੇ ਫਿਰ “index out of range” error ਆਵੇਗੀ।

ਇਸਦਾ ਕਾਰਣ ਇਹ ਹੈ ਕਿ `colors` array ਵਿੱਚ `4` elements ਹਨ, ਪਰ indexing `0` ਤੋਂ ਸ਼ੁਰੂ ਹੁੰਦੀ ਹੈ, ਇਸ ਲਈ valid index range `0 - 3` ਹੈ, `4` ਨਹੀਂ।

ਜੇ ਅਸੀਂ `colors[4]` ਨੂੰ access ਕਰੀਏ, ਤਾਂ “index out of range” error ਆਵੇਗੀ।

ਮੌਜੂਦਾ ਕੋਡ ਵਿੱਚ, ਹਰ ਟੈਪ `index` ਨੂੰ ਆਪਣੇ ਆਪ `1` ਵਧਾ ਦਿੰਦਾ ਹੈ। ਜੇ ਅਸੀਂ ਇਸਨੂੰ handle ਨਾ ਕਰੀਏ, ਤਾਂ ਇਹ ਆਖ਼ਿਰਕਾਰ ਸੀਮਾ ਤੋਂ ਬਾਹਰ ਚਲਾ ਜਾਵੇਗਾ।

ਇਸ ਲਈ, ਸਕ੍ਰੀਨ 'ਤੇ ਟੈਪ ਕਰਦੇ ਸਮੇਂ ਸਾਨੂੰ index ਦੀ ਜਾਂਚ ਕਰਨੀ ਪਵੇਗੀ: ਜੇ ਇਹ ਆਖ਼ਰੀ ਰੰਗ ਹੈ, ਤਾਂ ਪਹਿਲੇ ਰੰਗ 'ਤੇ ਵਾਪਸ ਜਾਓ; ਨਹੀਂ ਤਾਂ `1` ਜੋੜਦੇ ਰਹੋ।

ਇਹ ਅਸੀਂ `if` statement ਨਾਲ ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

ਇਸ ਕੋਡ ਵਿੱਚ, `colors.count` ਦਾ ਮਤਲਬ array ਵਿੱਚ elements ਦੀ ਗਿਣਤੀ ਹੈ।

ਮੌਜੂਦਾ array ਵਿੱਚ 4 ਰੰਗ ਹਨ, ਇਸ ਲਈ:

```swift
colors.count // 4
```

ਪਰ ਸਭ ਤੋਂ ਵੱਡਾ index `4` ਨਹੀਂ, ਸਗੋਂ `3` ਹੈ, ਕਿਉਂਕਿ indexing `0` ਤੋਂ ਸ਼ੁਰੂ ਹੁੰਦੀ ਹੈ।

ਇਸ ਲਈ ਆਖ਼ਰੀ index ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ:

```swift
colors.count - 1
```

ਅਰਥਾਤ:

```swift
4 - 1 = 3
```

ਇਸ logic ਦਾ ਮਤਲਬ ਹੈ: ਜੇ ਮੌਜੂਦਾ index ਪਹਿਲਾਂ ਹੀ ਆਖ਼ਰੀ ਰੰਗ ਨੂੰ ਦਰਸਾ ਰਿਹਾ ਹੈ, ਤਾਂ index ਨੂੰ `0` 'ਤੇ reset ਕਰੋ; ਨਹੀਂ ਤਾਂ ਇਸ ਨੂੰ `1` ਨਾਲ ਵਧਾਓ।

ਇਸ ਤਰੀਕੇ ਨਾਲ ਰੰਗ ਚੱਕਰ ਵਾਂਗ ਬਦਲਦੇ ਰਹਿਣਗੇ।

### index logic ਨੂੰ ਹੋਰ ਸੰਖੇਪ ਬਣਾਉਣਾ

ਜੇ ਅਸੀਂ ਕੋਡ ਹੋਰ ਛੋਟਾ ਬਣਾਉਣਾ ਚਾਹੀਏ, ਤਾਂ ternary operator ਵੀ ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

ਇਸ ਕੋਡ ਦਾ ਮਤਲਬ ਹੈ: ਜੇ `index == colors.count - 1` ਸੱਚ ਹੈ, ਤਾਂ `0` ਵਾਪਸ ਦਿਓ। ਨਹੀਂ ਤਾਂ `index + 1` ਵਾਪਸ ਦਿਓ।

ਅੰਤ ਵਿੱਚ, ਇਹ result ਮੁੜ `index` ਨੂੰ assign ਕੀਤਾ ਜਾਂਦਾ ਹੈ।

ਹੁਣ ਅਸੀਂ ਰੰਗ ਬਦਲਣ ਵਾਲਾ effect ਲਾਗੂ ਕਰ ਸਕਦੇ ਹਾਂ।

ਪੂਰਾ ਕੋਡ:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

ਹੁਣ ਅਸੀਂ ਸਕ੍ਰੀਨ 'ਤੇ ਟੈਪ ਕਰਕੇ ਵੱਖ-ਵੱਖ ਰੰਗਾਂ ਵਿੱਚ ਬਦਲਾਅ ਕਰ ਸਕਦੇ ਹਾਂ। ਇੱਕ ਬੁਨਿਆਦੀ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਤਿਆਰ ਹੋ ਗਈ ਹੈ।

## ਰੰਗ ਦਾ ਨਾਮ ਦਿਖਾਉਣਾ

ਅਸੀਂ ਰੰਗਾਂ ਦੇ ਅਨੁਸਾਰ ਇੱਕ ਹੋਰ text group ਜੋੜ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ ਰੰਗ ਬਦਲਣ 'ਤੇ ਸਕ੍ਰੀਨ 'ਤੇ ਮੌਜੂਦਾ ਰੰਗ ਦਾ ਨਾਮ ਵੀ ਦਿਖੇ।

ਉਦਾਹਰਨ ਲਈ:

- ਲਾਲ ਹੋਣ 'ਤੇ `Red`
- ਨੀਲਾ ਹੋਣ 'ਤੇ `Blue`
- ਪੀਲਾ ਹੋਣ 'ਤੇ `Yellow`
- ਜਾਮਨੀ ਹੋਣ 'ਤੇ `Purple`

ਇੱਥੇ ਵੀ ਅਸੀਂ ਰੰਗਾਂ ਦੇ ਨਾਮ ਸੰਭਾਲਣ ਲਈ ਇੱਕ array ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

ਇਸ array ਵਿੱਚ text ਦਾ ਕ੍ਰਮ ਰੰਗਾਂ ਦੀ array ਦੇ ਕ੍ਰਮ ਨਾਲ ਬਿਲਕੁਲ ਮਿਲਣਾ ਚਾਹੀਦਾ ਹੈ।

ਫਿਰ ਅਸੀਂ ਮੌਜੂਦਾ index ਦੇ ਅਨੁਸਾਰ ਰੰਗ ਦਾ ਨਾਮ ਦਿਖਾਉਣ ਲਈ `Text` ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
Text(colorsName[index])
```

`Text` `index` ਦੇ ਅਨੁਸਾਰ ਮੌਜੂਦਾ ਰੰਗ ਦਾ ਨਾਮ ਦਿਖਾਉਂਦਾ ਹੈ।

`Text` ਦੀ ਦਿੱਖ ਸੁਧਾਰਣ ਲਈ modifiers ਵਰਤੋ:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

ਇਸ ਨਾਲ `Text` ਚਿੱਟੇ ਰੰਗ ਵਿੱਚ, title size ਵਿੱਚ, ਅਤੇ bold font weight ਨਾਲ ਦਿਖਾਈ ਦੇਵੇਗਾ।

ਹੁਣ ਸਾਡੇ ਕੋਲ full-screen `Color` ਵਿਊ ਹੈ। ਜੇ ਅਸੀਂ `Text` ਨੂੰ `Color` ਵਿਊ ਦੇ ਉੱਪਰ ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਦੋਹਾਂ ਨੂੰ ਇੱਕ-ਦੂਜੇ ਦੇ ਉੱਪਰ ਰੱਖਣ ਲਈ `ZStack` layout container ਵਰਤਣਾ ਪਵੇਗਾ।

```swift
ZStack {
    Color
    Text
}
```

ਇਸ ਲਈ ਕੋਡ ਇਸ ਤਰ੍ਹਾਂ ਬਣਦਾ ਹੈ:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

ਇਸ ਤਰੀਕੇ ਨਾਲ background ਵਿੱਚ ਰੰਗ ਵਾਲਾ ਵਿਊ ਹੋਵੇਗਾ, ਅਤੇ ਉਸਦੇ ਉੱਪਰ text ਵਿਊ ਦਿਖਾਈ ਦੇਵੇਗਾ।

ਨਤੀਜਾ:

![Color](../../Resource/018_color2.png)

ਇੱਕ ਗੱਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖਣ ਵਾਲੀ ਹੈ ਕਿ `ZStack` ਵਿੱਚ ਬਾਅਦ ਵਿੱਚ ਲਿਖਿਆ ਗਿਆ ਵਿਊ ਆਮ ਤੌਰ 'ਤੇ ਅੱਗੇ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ। ਜੇ `Text` ਨੂੰ `Color` ਤੋਂ ਪਹਿਲਾਂ ਲਿਖਿਆ ਜਾਵੇ, ਤਾਂ ਬਾਅਦ ਵਿੱਚ ਆਇਆ `Color` ਵਿਊ `Text` ਨੂੰ ਢੱਕ ਸਕਦਾ ਹੈ।

## ਚਮਕ ਨੂੰ ਨਿਯੰਤਰਿਤ ਕਰਨਾ

ਹੁਣ ਅਸੀਂ ਵੱਖ-ਵੱਖ ਰੰਗ ਬਦਲ ਸਕਦੇ ਹਾਂ, ਪਰ ਫ਼ਿਲ ਲਾਈਟ ਦੀ ਇੱਕ ਹੋਰ ਮਹੱਤਵਪੂਰਨ ਵਿਸ਼ੇਸ਼ਤਾ ਹੈ: **ਚਮਕ ਨੂੰ ਠੀਕ ਕਰਨਾ**।

SwiftUI ਵਿੱਚ, ਅਸੀਂ `brightness` modifier ਵਰਤ ਕੇ ਕਿਸੇ ਵਿਊ ਦੀ ਚਮਕ ਠੀਕ ਕਰ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ:

```swift
.brightness(1)
```

ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
colors[index]
    .brightness(0.5)
```

ਇਸ ਨਾਲ ਮੌਜੂਦਾ ਰੰਗ ਹੋਰ ਚਮਕਦਾਰ ਬਣ ਜਾਂਦਾ ਹੈ ਅਤੇ ਫ਼ਿਲ ਲਾਈਟ ਪ੍ਰਭਾਵ ਦੇ ਹੋਰ ਨੇੜੇ ਲੱਗਦਾ ਹੈ।

ਚਮਕ ਦੀ range `0 - 1` ਹੈ। `0` ਦਾ ਮਤਲਬ ਮੂਲ ਰੰਗ ਨੂੰ ਜਿਵੇਂ ਦਾ ਤਿਵੇਂ ਰੱਖਣਾ ਹੈ, ਅਤੇ value ਜਿੰਨੀ `1` ਦੇ ਨੇੜੇ ਹੋਵੇਗੀ, ਰੰਗ ਉਨਾ ਹੀ ਚਮਕਦਾਰ ਹੋਵੇਗਾ। `1` ਦਾ ਮਤਲਬ ਸਭ ਤੋਂ ਚਮਕਦਾਰ ਚਿੱਟਾ ਨਤੀਜਾ ਹੈ।

ਭਾਵੇਂ ਅਸੀਂ ਕੋਡ ਵਿੱਚ `brightness` ਨੂੰ ਨਿਯੰਤਰਿਤ ਕਰ ਸਕਦੇ ਹਾਂ, ਪਰ ਉਪਭੋਗਤਾ ਅਜੇ ਵੀ ਇਸਨੂੰ ਸਿੱਧੇ ਤੌਰ 'ਤੇ ਆਪ ਨਹੀਂ ਬਦਲ ਸਕਦਾ।

ਇਸ ਲਈ ਸਾਨੂੰ ਇੱਕ drag ਕੀਤਾ ਜਾ ਸਕਣ ਵਾਲਾ control ਜੋੜਨਾ ਪਵੇਗਾ: `Slider`।

## `Slider` ਵਿਊ

SwiftUI ਵਿੱਚ, `Slider` ਇੱਕ control ਹੈ ਜੋ ਕਿਸੇ ਨਿਰਧਾਰਿਤ range ਦੇ ਅੰਦਰ value ਚੁਣਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। Apple ਇਸ ਨੂੰ “bounded linear range ਵਿੱਚੋਂ ਇੱਕ value ਚੁਣਨ ਵਾਲਾ control” ਦੱਸਦਾ ਹੈ।

ਮੂਲ ਵਰਤੋਂ:

```swift
Slider(value: $value, in: 0...1)
```

Parameters ਦੀ ਵਿਆਖਿਆ:

1. `value: $value`: `Slider` ਨੂੰ ਇੱਕ variable ਨਾਲ bind ਕਰਨਾ ਪੈਂਦਾ ਹੈ।

    ਜਦੋਂ slider ਨੂੰ ਖਿਸਕਾਇਆ ਜਾਂਦਾ ਹੈ, variable ਦੀ value ਵੀ ਉਸੇ ਸਮੇਂ ਬਦਲਦੀ ਹੈ। ਅਤੇ ਜੇ variable ਬਦਲ ਜਾਏ, ਤਾਂ slider ਵੀ update ਹੋ ਜਾਂਦਾ ਹੈ।

    ਇਹ ਪਹਿਲਾਂ ਸਿੱਖੇ `TextField` ਵਰਗਾ ਹੀ ਹੈ। ਦੋਵੇਂ “control ਨੂੰ variable ਨਾਲ bind” ਕਰਦੇ ਹਨ।

    Binding ਦਰਸਾਉਣ ਲਈ bind ਕੀਤੇ variable ਦੇ ਅੱਗੇ `$` ਚਿੰਨ੍ਹ ਲਗਾਉਣਾ ਪੈਂਦਾ ਹੈ।

2. `in: 0...1`: ਇਹ parameter slider ਦੀ value range ਦਿਖਾਉਂਦਾ ਹੈ।

    ਇੱਥੇ `0...1` ਦਾ ਮਤਲਬ ਹੈ minimum value `0` ਹੈ ਅਤੇ maximum value `1` ਹੈ।

    ਜਦੋਂ slider ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਖੱਬੇ ਪਾਸੇ ਲਿਜਾਇਆ ਜਾਂਦਾ ਹੈ, ਤਾਂ bound variable `0` ਦੇ ਨੇੜੇ ਹੁੰਦਾ ਹੈ; ਜਦੋਂ ਇਸਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸੱਜੇ ਪਾਸੇ ਲਿਜਾਇਆ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਇਹ `1` ਦੇ ਨੇੜੇ ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` variable `value` ਨਾਲ bind ਹੈ। ਜਦੋਂ slider ਖਿਸਕਾਇਆ ਜਾਂਦਾ ਹੈ, `value` variable ਦੀ value ਵੀ ਉਸੇ ਸਮੇਂ ਬਦਲਦੀ ਹੈ।

ਦਿੱਖ:

![Slider](../../Resource/018_slider.png)

ਜਦੋਂ `Slider` ਨੂੰ ਖੱਬੇ ਪਾਸੇ ਲਿਜਾਇਆ ਜਾਂਦਾ ਹੈ, ਤਾਂ bound `value` `0` ਬਣ ਜਾਂਦਾ ਹੈ। ਜਦੋਂ ਸੱਜੇ ਪਾਸੇ ਲਿਜਾਇਆ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਇਹ `1` ਬਣ ਜਾਂਦਾ ਹੈ।

### value range

`Slider` ਦੀ value range ਸਥਿਰ ਨਹੀਂ ਹੁੰਦੀ। ਇਸਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਵੀ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
0...100
```

ਜਾਂ ਕਿਸੇ ਹੋਰ range ਵਿੱਚ।

ਪਰ ਇਸ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਵਿੱਚ, ਸਾਨੂੰ ਚਮਕ ਨਿਯੰਤਰਿਤ ਕਰਨੀ ਹੈ, ਇਸ ਲਈ `0...1` ਸਭ ਤੋਂ ਢੁੱਕਵੀ ਚੋਣ ਹੈ।

## `Slider` ਨਾਲ ਚਮਕ ਨਿਯੰਤਰਿਤ ਕਰਨਾ

ਹੁਣ ਸਾਨੂੰ `Slider` ਨੂੰ `brightness` ਨਾਲ ਜੋੜਨਾ ਹੈ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਚਮਕ ਦੀ value ਸੰਭਾਲਣ ਲਈ ਇੱਕ variable ਬਣਾਓ:

```swift
@State private var slider = 0.0
```

ਇੱਥੇ `0.0` ਇੱਕ `Double` ਕਿਸਮ ਦੀ value ਹੈ।

ਕਿਉਂਕਿ `Slider` ਆਮ ਤੌਰ 'ਤੇ numeric type ਨਾਲ bind ਹੁੰਦਾ ਹੈ, ਅਤੇ ਇੱਥੇ ਅਸੀਂ ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ ਇਹ ਲਗਾਤਾਰ ਬਦਲੇ, ਇਸ ਲਈ `Double` ਹੋਰ ਢੁੱਕਵਾਂ ਹੈ। ਇਸ ਤੋਂ ਇਲਾਵਾ `brightness` ਸਿਰਫ਼ `Double` value ਹੀ ਸਵੀਕਾਰ ਕਰਦਾ ਹੈ।

ਫਿਰ ਇਸ value ਨੂੰ `brightness` ਵਿੱਚ ਦਿਓ:

```swift
colors[index]
    .brightness(slider)
```

ਜਦੋਂ `slider == 0` ਹੁੰਦਾ ਹੈ, ਰੰਗ ਆਪਣੀ default ਹਾਲਤ ਵਿੱਚ ਰਹਿੰਦਾ ਹੈ। `slider` ਜਿੰਨਾ `1` ਦੇ ਨੇੜੇ ਹੋਵੇਗਾ, ਰੰਗ ਉਨਾ ਹੀ ਚਮਕਦਾਰ ਲੱਗੇਗਾ।

### `Slider` control ਜੋੜਣਾ

ਫਿਰ, ਇਸ variable ਨੂੰ ਬਦਲਣ ਲਈ ਇੱਕ `Slider` control ਜੋੜੋ:

```swift
Slider(value: $slider, in: 0...1)
```

ਜਦੋਂ slider ਬਦਲਦਾ ਹੈ, `slider` ਦੀ value ਵੀ ਬਦਲਦੀ ਹੈ, ਅਤੇ `brightness(slider)` ਉਸੇ ਸਮੇਂ ਚਮਕ update ਕਰਦਾ ਹੈ।

ਇਹ SwiftUI ਵਿੱਚ “variable ਵਿਊ ਨੂੰ ਚਲਾਉਂਦਾ ਹੈ” ਦਾ ਇੱਕ ਬਹੁਤ ਹੀ ਆਮ ਉਦਾਹਰਨ ਹੈ।

### `Slider` ਦੀ ਦਿੱਖ ਠੀਕ ਕਰਨਾ

ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ, `Slider` ਉਪਲਬਧ ਚੌੜਾਈ ਵਰਤਦਾ ਹੈ।

ਅਸੀਂ ਇਸਨੂੰ ਇੱਕ ਨਿਰਧਾਰਿਤ ਚੌੜਾਈ ਦੇ ਸਕਦੇ ਹਾਂ:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

ਫਿਰ ਇਸਨੂੰ ਹੋਰ ਸਪਸ਼ਟ ਬਣਾਉਣ ਲਈ ਕੁਝ ਹੋਰ modifiers ਜੋੜੀਏ:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

ਇਸ ਨਾਲ slider ਨੂੰ ਚਿੱਟਾ background ਅਤੇ ਗੋਲ ਕੋਨੇ ਮਿਲਦੇ ਹਨ, ਜਿਸ ਨਾਲ ਇਹ `Color` ਵਿਊ ਉੱਤੇ ਹੋਰ ਸਪਸ਼ਟ ਦਿਖਦਾ ਹੈ।

ਅਖੀਰ ਵਿੱਚ, ਇਸਨੂੰ ਸਕ੍ਰੀਨ ਦੇ ਹੇਠਲੇ ਹਿੱਸੇ ਵਿੱਚ ਰੱਖੋ।

ਕਿਉਂਕਿ ਅਸੀਂ ਪਹਿਲਾਂ ਹੀ `ZStack` ਵਰਤ ਰਹੇ ਹਾਂ, ਇਸ ਦੇ ਅੰਦਰ `VStack` ਰੱਖ ਕੇ `Spacer()` ਦੀ ਮਦਦ ਨਾਲ `Slider` ਨੂੰ ਹੇਠਾਂ ਧੱਕ ਸਕਦੇ ਹਾਂ।

## ਪੂਰਾ ਕੋਡ

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

ਨਤੀਜਾ:

![Color](../../Resource/018_color.png)

## ਸਾਰ

ਪਹਿਲਾਂ ਸਿੱਖੀ ਹੋਈ ਜਾਣਕਾਰੀ ਅਤੇ ਰੰਗਾਂ, array ਵਰਗੀਆਂ ਮੂਲ ਧਾਰਣਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਅਸੀਂ ਇੱਕ ਬਹੁਤ ਹੀ ਦਿਲਚਸਪ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਬਣਾਈ ਹੈ।

ਇਸ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਰਾਹੀਂ, ਅਸੀਂ `brightness` ਨਾਲ ਚਮਕ ਠੀਕ ਕਰਨੀ, `onTapGesture` ਨਾਲ ਵਿਊਜ਼ ਵਿੱਚ ਟੈਪ actions ਜੋੜਣੀਆਂ, ਅਤੇ `Slider` control ਦੀ ਵਰਤੋਂ ਕਰਨੀ ਸਿੱਖੀ ਹੈ।

ਅਸੀਂ ਰੰਗ ਬਦਲਣ ਲਈ `Color` ਵਿਊ ਵਿੱਚ `onTapGesture` ਜੋੜਿਆ। ਅਸੀਂ `brightness` ਨੂੰ manage ਕਰਨ ਵਾਲੇ variable ਨੂੰ ਬਦਲਣ ਲਈ `Slider` control ਵੀ ਵਰਤਿਆ, ਜੋ “variable ਵਿਊ ਨੂੰ ਚਲਾਉਂਦਾ ਹੈ” ਦਾ ਇੱਕ ਹੋਰ ਉਦਾਹਰਨ ਹੈ।

ਅਸੀਂ ternary operator ਨੂੰ ਵੀ ਦੁਹਰਾਇਆ, ਵਿਊਜ਼ ਨੂੰ ਇੱਕ-ਦੂਜੇ ਉੱਤੇ ਰੱਖਣ ਲਈ `ZStack` ਵਰਤਿਆ, ਅਤੇ ਇੱਕੋ ਕਿਸਮ ਦੇ ਡਾਟਾ ਸਮੂਹ ਨੂੰ manage ਕਰਨ ਲਈ arrays ਵਰਤੀਆਂ। ਇਸ ਨਾਲ arrays ਅਤੇ index ਬਾਰੇ ਸਾਡੀ ਸਮਝ ਹੋਰ ਡੂੰਘੀ ਹੁੰਦੀ ਹੈ, ਖ਼ਾਸ ਕਰਕੇ out-of-range errors ਤੋਂ ਬਚਣ ਵਾਲੇ ਵਿਹਾਰਕ ਪੱਖ ਵਿੱਚ।

ਹਾਲਾਂਕਿ ਇਹ ਉਦਾਹਰਨ ਜਟਿਲ ਨਹੀਂ ਹੈ, ਪਰ ਇਹ ਉਹਨਾਂ ਕਈ ਮੂਲ ਧਾਰਣਾਂ ਨੂੰ ਜੋੜਦੀ ਹੈ ਜੋ ਅਸੀਂ ਪਹਿਲਾਂ ਸਿੱਖੀਆਂ ਹਨ। ਜਦੋਂ ਇਹ ਸਾਰੀਆਂ ਚੀਜ਼ਾਂ ਇੱਕ ਛੋਟੇ ਅਸਲੀ project ਵਿੱਚ ਵਰਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ, ਤਾਂ ਹਰ concept ਦਾ ਕੰਮ ਸਮਝਣਾ ਹੋਰ ਆਸਾਨ ਹੋ ਜਾਂਦਾ ਹੈ।

### ਅਸਲੀ ਵਰਤੋਂ ਵਾਲਾ ਦ੍ਰਿਸ਼

ਕਲਪਨਾ ਕਰੋ, ਤੁਸੀਂ ਇੱਕ ਪੁਰਾਣਾ iPhone ਮੇਜ਼ 'ਤੇ ਰੱਖੋ ਅਤੇ ਆਪਣੇ ਬਣਾਏ ਹੋਏ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਨਾਲ ਰੌਸ਼ਨੀ ਦਾ ਰੰਗ ਨਿਯੰਤਰਿਤ ਕਰੋ। ਇਹ ਇੱਕ ਬਹੁਤ ਵਧੀਆ ਅਨੁਭਵ ਹੋਵੇਗਾ।

App Store ਵਿੱਚ ਬਹੁਤ ਸਾਰੀਆਂ “ਫ਼ਿਲ ਲਾਈਟ” ਐਪਸ ਹਨ, ਅਤੇ ਉਹ ਵੀ ਬਹੁਤ ਜਟਿਲ ਨਹੀਂ ਲੱਗਦੀਆਂ।

![AppStore](../../Resource/018_appStore.PNG)

ਅਸੀਂ ਸਧਾਰਣ ਐਪਸ ਨਾਲ ਸ਼ੁਰੂ ਕਰ ਸਕਦੇ ਹਾਂ ਅਤੇ ਉਹਨਾਂ ਨੂੰ App Store 'ਤੇ publish ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰ ਸਕਦੇ ਹਾਂ। ਇਸ ਨਾਲ ਨਾ ਸਿਰਫ਼ development ਵਿੱਚ ਸਾਡੀ ਦਿਲਚਸਪੀ ਵੱਧਦੀ ਹੈ, ਸਗੋਂ ਸਾਡੀ ਤਰੱਕੀ ਦਾ ਵੀ ਰਿਕਾਰਡ ਬਣਦਾ ਹੈ।

### ਪਾਠ ਤੋਂ ਬਾਅਦ ਅਭਿਆਸ

ਤੁਸੀਂ ਇਸ ਫ਼ਿਲ ਲਾਈਟ ਐਪ ਨੂੰ ਹੋਰ ਕਿਵੇਂ ਵਧਾਇਆ ਜਾ ਸਕਦਾ ਹੈ, ਇਸ ਬਾਰੇ ਸੋਚਣਾ ਜਾਰੀ ਰੱਖ ਸਕਦੇ ਹੋ, ਜਿਵੇਂ:

- ਹੋਰ ਰੰਗ ਜੋੜੋ
- ਮੌਜੂਦਾ ਚਮਕ ਦੀ value ਦਿਖਾਓ
- ਹੇਠਾਂ ਵਾਲੇ slider ਖੇਤਰ ਦੀ ਡਿਜ਼ਾਇਨ ਹੋਰ ਸੁੰਦਰ ਬਣਾਓ

ਜਦੋਂ ਤੁਸੀਂ ਇਸ ਗਿਆਨ ਨੂੰ ਅਸਲ ਵਿੱਚ ਵਰਤਣਾ ਸ਼ੁਰੂ ਕਰੋਗੇ, ਤਾਂ ਤੁਹਾਨੂੰ ਪਤਾ ਲੱਗੇਗਾ ਕਿ ਅਸੀਂ ਜੋ ਵੀ concept ਸਿੱਖਦੇ ਹਾਂ, ਉਹ ਅਸਲ ਵਿੱਚ ਐਪ ਬਣਾਉਣ ਦਾ ਇੱਕ tool ਹੁੰਦਾ ਹੈ।

ਅਸੀਂ ਜਿੰਨੇ ਵੱਧ tools 'ਤੇ ਪੱਕੇ ਹੋਵਾਂਗੇ, ਉਤਨੀਆਂ ਹੀ ਵੱਧ ਖੂਬੀਆਂ ਤਿਆਰ ਕਰ ਸਕਾਂਗੇ।
