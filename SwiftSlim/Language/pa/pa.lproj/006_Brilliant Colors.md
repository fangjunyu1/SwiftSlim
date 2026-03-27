# ਰੰਗਾਂ ਦੀ ਰੌਣਕ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ SwiftUI ਵਿੱਚ ਆਮ ਤੌਰ 'ਤੇ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਵਿਜੁਅਲ ਮੋਡੀਫਾਇਰ ਸਿੱਖਾਂਗੇ, ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:

- ਰੰਗ
- ਅੱਗਲਾ ਰੰਗ
- ਪਿਛੋਕੜ ਰੰਗ
- ਖਿਸਕਾਓ
- ਪਾਰਦਰਸ਼ਤਾ
- ਧੁੰਦਲਾਪਣ

ਇਸ ਦੇ ਨਾਲ ਅਸੀਂ Safe Area (ਸੁਰੱਖਿਅਤ ਖੇਤਰ) ਬਾਰੇ ਵੀ ਸਿੱਖਾਂਗੇ।

ਇਹ ਮੋਡੀਫਾਇਰ ਵਿਊ ਦੀ ਵਿਜੁਅਲ ਪੇਸ਼ਕਾਰੀ ਨੂੰ ਨਿਯੰਤਰਿਤ ਕਰਨ ਲਈ ਵਰਤੇ ਜਾਂਦੇ ਹਨ, ਤਾਂ ਜੋ ਇੰਟਰਫੇਸ ਹੋਰ ਸਾਫ਼ ਅਤੇ ਪਰਤਦਾਰ ਲੱਗੇ।

## ਰੰਗ

SwiftUI ਵਿੱਚ, ਤੁਸੀਂ ਲਿਖਤ ਦਾ ਰੰਗ ਸੈੱਟ ਕਰ ਸਕਦੇ ਹੋ।

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
````

`.blue` ਦਾ ਅਰਥ ਨੀਲਾ ਰੰਗ ਹੈ। ਅਸਲ ਵਿੱਚ ਇਹ `Color.blue` ਦਾ ਸਰਲ ਲਿਖਣ ਤਰੀਕਾ ਹੈ (type inference)।

ਆਮ ਰੰਗਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:

```
.black
.green
.yellow
.pink
.gray
...
```

ਇਹ ਸਾਰੇ `Color` ਦੀਆਂ static properties ਹਨ।

![Color](../../RESOURCE/006_color.png)

ਤੁਸੀਂ `Color` ਨੂੰ ਇੱਕ ਰੰਗ ਵਾਲੀ type ਵਜੋਂ ਸਮਝ ਸਕਦੇ ਹੋ, ਅਤੇ `.blue`, `.red` ਉਸ ਦੇ ਖ਼ਾਸ ਰੰਗ ਹਨ।

### Color ਵਿਊ

SwiftUI ਵਿੱਚ, `Color` ਨੂੰ ਇੱਕ ਵਿਊ ਵਜੋਂ ਵੀ ਦਿਖਾਇਆ ਜਾ ਸਕਦਾ ਹੈ।

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

ਇਹ ਕੋਡ 100×100 ਦਾ ਇੱਕ ਲਾਲ ਵਰਗ ਬਣਾਏਗਾ।

ਤੁਸੀਂ ਪੂਰੇ ਇੰਟਰਫੇਸ ਨੂੰ ਵੀ ਕਿਸੇ ਇੱਕ ਰੰਗ ਨਾਲ ਦਿਖਾ ਸਕਦੇ ਹੋ:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

ਚਲਾਉਣ ਤੋਂ ਬਾਅਦ ਤੁਸੀਂ ਵੇਖੋਗੇ ਕਿ ਲਾਲ ਰੰਗ ਨੇ ਪੂਰੀ ਸਕ੍ਰੀਨ ਨਹੀਂ ਢੱਕੀ; iPhone ਦੇ ਉੱਪਰਲੇ ਅਤੇ ਹੇਠਲੇ ਹਿੱਸੇ ਅਜੇ ਵੀ ਚਿੱਟੇ ਹਨ। ਇੱਥੇ Safe Area (ਸੁਰੱਖਿਅਤ ਖੇਤਰ) ਦੀ ਧਾਰਣਾ ਲਾਗੂ ਹੁੰਦੀ ਹੈ।

## Safe Area（ਸੁਰੱਖਿਅਤ ਖੇਤਰ）

Safe Area ਉਹ ਖੇਤਰ ਹੈ ਜੋ ਸਿਸਟਮ ਸਮੱਗਰੀ ਨੂੰ ਢੱਕੇ ਜਾਣ ਤੋਂ ਬਚਾਉਣ ਲਈ ਰੱਖਦਾ ਹੈ। ਇਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:

1. ਉੱਪਰਲਾ status bar (ਸਮਾਂ, ਬੈਟਰੀ)

2. ਹੇਠਾਂ ਵਾਲਾ Home indicator

3. notch ਜਾਂ Dynamic Island ਵਾਲਾ ਖੇਤਰ

![Color](../../RESOURCE/006_color3.png)

SwiftUI ਮੂਲ ਤੌਰ 'ਤੇ ਸਮੱਗਰੀ ਨੂੰ ਸੁਰੱਖਿਅਤ ਖੇਤਰ ਦੇ ਅੰਦਰ ਹੀ ਰੱਖਦਾ ਹੈ, ਇਸ ਲਈ ਵਿਊ ਸਕ੍ਰੀਨ ਦੇ ਕਿਨਾਰਿਆਂ ਤੱਕ ਨਹੀਂ ਫੈਲਦੀ।

### Safe Area ਨੂੰ ਅਣਡਿੱਠਾ ਕਰਨਾ

ਜੇ ਤੁਸੀਂ ਚਾਹੁੰਦੇ ਹੋ ਕਿ ਰੰਗ ਪੂਰੀ ਸਕ੍ਰੀਨ 'ਤੇ ਫੈਲ ਜਾਵੇ, ਤਾਂ `ignoresSafeArea` ਵਰਤ ਸਕਦੇ ਹੋ:

```swift
Color.red
    .ignoresSafeArea()
```

ਜਾਂ `edgesIgnoringSafeArea` ਵਰਤ ਸਕਦੇ ਹੋ:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

ਇਸ ਤਰ੍ਹਾਂ ਵਿਊ ਪੂਰੀ ਸਕ੍ਰੀਨ 'ਤੇ ਫੈਲ ਜਾਵੇਗੀ।

ਇੱਥੇ ਧਿਆਨ ਦੇਣ ਵਾਲੀ ਗੱਲ ਹੈ ਕਿ `edgesIgnoringSafeArea` ਪੁਰਾਣਾ ਤਰੀਕਾ ਹੈ। iOS 14 ਤੋਂ ਬਾਅਦ `ignoresSafeArea` ਵਰਤਣ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ।

## ਅੱਗਲਾ ਰੰਗ

### `foregroundStyle` ਮੋਡੀਫਾਇਰ

ਪਿਛਲੇ ਪਾਠਾਂ ਵਿੱਚ ਅਸੀਂ `foregroundStyle` ਨਾਲ ਰੰਗ ਸੈੱਟ ਕਰਨਾ ਸਿੱਖਿਆ ਸੀ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` ਨਵਾਂ style system ਹੈ, ਜੋ ਰੰਗ, gradient, material ਆਦਿ ਨੂੰ ਸਮਰਥਨ ਦਿੰਦਾ ਹੈ।

![Color](../../RESOURCE/006_color2.png)

### `foregroundColor` ਮੋਡੀਫਾਇਰ

`foregroundColor` ਵੀ ਰੰਗ ਸੈੱਟ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

ਇਸ ਦੀ ਵਰਤੋਂ ਵੀ `foregroundStyle` ਵਾਂਗ ਹੀ ਹੈ।

ਨਵੇਂ Xcode ਵਰਜਨਾਂ ਵਿੱਚ, Xcode ਇਹ ਸੰਕੇਤ ਦੇ ਸਕਦਾ ਹੈ ਕਿ `foregroundColor` ਭਵਿੱਖ ਦੇ iOS ਵਰਜਨਾਂ ਵਿੱਚ deprecated ਹੋ ਸਕਦਾ ਹੈ, ਇਸ ਲਈ ਪਹਿਲਾਂ `foregroundStyle` ਵਰਤਣਾ ਚੰਗਾ ਹੈ।

## ਪਿਛੋਕੜ

ਜੇ ਤੁਸੀਂ ਕਿਸੇ ਵਿਊ ਨੂੰ background color ਦੇਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ `background` ਵਰਤ ਸਕਦੇ ਹੋ:

```swift
background(.red)
```

ਉਦਾਹਰਨ ਲਈ, ਲਿਖਤ ਨੂੰ background color ਦੇਣ ਲਈ:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

ਜਦੋਂ ਅਸੀਂ Word, Chrome ਵਰਗੀਆਂ ਐਪਸ ਵਿੱਚ ਲਿਖਤ ਚੁਣਦੇ ਹਾਂ, ਤਾਂ ਅਸੀਂ ਇਸੇ ਤਰ੍ਹਾਂ ਦਾ background effect ਦੇਖ ਸਕਦੇ ਹਾਂ।

![Color](../../RESOURCE/006_color16.png)

ਜੇ ਤੁਸੀਂ background ਨੂੰ ਵੱਡਾ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ `padding` ਨਾਲ ਮਿਲਾ ਕੇ ਵਰਤੋ:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

ਇੱਥੇ ਇੱਕ ਮਹੱਤਵਪੂਰਨ ਨਿਯਮ ਹੈ:

SwiftUI ਮੋਡੀਫਾਇਰ ਉੱਪਰੋਂ ਹੇਠਾਂ ਵਿਊ ਬਣਾਉਂਦੇ ਹਨ। ਜੋ ਮੋਡੀਫਾਇਰ ਬਾਅਦ ਵਿੱਚ ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ, ਉਹ ਪਹਿਲਾਂ ਵਾਲੇ ਨਤੀਜੇ 'ਤੇ ਲਾਗੂ ਹੁੰਦਾ ਹੈ।

ਇਸ ਲਈ:

```swift
.padding()
.background()
```

ਇਸ ਦਾ ਅਰਥ ਹੈ ਕਿ background, padding ਸ਼ਾਮਲ ਹੋਣ ਤੋਂ ਬਾਅਦ ਵਾਲੇ ਵਿਊ ਨੂੰ ਢੱਕੇਗਾ।

ਜੇ ਲੜੀ ਉਲਟੀ ਲਿਖੀ ਜਾਵੇ:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

ਤਾਂ background ਵੱਡਾ ਨਹੀਂ ਹੋਵੇਗਾ, ਕਿਉਂਕਿ background ਨੇ ਬਾਅਦ ਦੇ padding ਨੂੰ ਨਹੀਂ ਢੱਕਿਆ।

## ਉਦਾਹਰਨ - ਚਾਰ ਕੋਨਿਆਂ ਵਾਲਾ ਨੱਟ

ਹੁਣ ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਚਾਰ ਕੋਨਿਆਂ ਵਾਲਾ ਨੱਟ ਵਿਊ ਬਣਾਉਂਦੇ ਹਾਂ।

![Color](../../RESOURCE/006_color8.png)

ਸਭ ਤੋਂ ਪਹਿਲਾਂ ਇੱਕ 50 × 50 ਦਾ ਚਿੱਟਾ ਵਰਗ ਬਣਾਓ:

```swift
Color.white
    .frame(width: 50, height: 50)
```

ਜੇ ਤੁਸੀਂ ਇਸਨੂੰ ਗੋਲ ਬਣਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ `cornerRadius` ਵਰਤੋ:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

ਜਦੋਂ corner radius ਚੌੜਾਈ ਅਤੇ ਉਚਾਈ ਦੇ ਅੱਧੇ ਦੇ ਬਰਾਬਰ ਹੋਵੇ, ਤਾਂ ਇਹ ਗੋਲ ਬਣ ਜਾਂਦਾ ਹੈ।

ਹੁਣ ਇੱਕ ਨੀਲਾ background ਸ਼ਾਮਲ ਕਰੋ:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

ਨਵਾਂ `padding` ਬਾਹਰੀ ਖੇਤਰ ਨੂੰ ਵੱਡਾ ਕਰਦਾ ਹੈ, ਅਤੇ `background` ਉਸ ਬਾਹਰੀ ਖੇਤਰ 'ਤੇ ਨੀਲਾ ਰੰਗ ਭਰਦਾ ਹੈ।

ਹੁਣ ਇੱਕ ਚਾਰ ਕੋਨਿਆਂ ਵਾਲਾ ਨੱਟ ਵਾਲਾ effect ਤਿਆਰ ਹੋ ਗਿਆ।

### ਇੱਕ ਹੋਰ ਤਰੀਕਾ

background color ਵਰਤ ਕੇ ਚਾਰ ਕੋਨਿਆਂ ਵਾਲਾ ਨੱਟ ਬਣਾਉਣ ਤੋਂ ਇਲਾਵਾ, ਤੁਸੀਂ `ZStack` ਨਾਲ ਵੀ ਇਹ ਪ੍ਰਭਾਵ ਹਾਸਲ ਕਰ ਸਕਦੇ ਹੋ।

ਅਸੀਂ ਪਹਿਲਾਂ ਸਿੱਖਿਆ ਸੀ ਕਿ `ZStack` ਨਾਲ ਵਿਊਜ਼ ਨੂੰ ਇੱਕ ਦੂਜੇ ਉੱਤੇ ਰੱਖਿਆ ਜਾ ਸਕਦਾ ਹੈ। ਚਾਰ ਕੋਨਿਆਂ ਵਾਲੇ ਨੱਟ ਨੂੰ ਇੱਕ ਗੋਲ shape ਅਤੇ ਇੱਕ ਆਇਤਕਾਰ shape ਦੇ overlay ਵਜੋਂ ਵੀ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ।

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` ਵਿਊਜ਼ ਨੂੰ ਕ੍ਰਮ ਅਨੁਸਾਰ ਇੱਕ ਦੂਜੇ ਉੱਤੇ ਰੱਖਦਾ ਹੈ। ਬਾਅਦ ਵਿੱਚ ਜੋੜੀ ਗਈ ਵਿਊ ਉੱਪਰ ਦਿਖਾਈ ਦਿੰਦੀ ਹੈ।

## ਉਦਾਹਰਨ - ਦੋ ਓਵਰਲੈਪ ਹੋਣ ਵਾਲੇ ਗੋਲ

ਕਈ ਆਈਕਨ ਸਧਾਰਣ shapes ਦੀ layering ਨਾਲ ਬਣੇ ਹੁੰਦੇ ਹਨ, ਜਿਵੇਂ ਦੋ ਓਵਰਲੈਪ ਹੋਣ ਵਾਲੇ ਗੋਲ।

![Color](../../RESOURCE/006_color14.png)

ਸਭ ਤੋਂ ਪਹਿਲਾਂ ਦੋ ਗੋਲ ਬਣਾਓ:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

ਕਿਉਂਕਿ ਸਾਨੂੰ ਇਹ ਦੋ ਗੋਲ ਇੱਕ ਦੂਜੇ ਉੱਤੇ ਦਿਖਾਉਣੇ ਹਨ, ਇਸ ਲਈ `ZStack` layout ਵਰਤਦੇ ਹਾਂ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

ਇਸ ਵੇਲੇ ਦੋਨਾਂ ਇੱਕੋ ਆਕਾਰ ਦੇ ਗੋਲ ਪੂਰੀ ਤਰ੍ਹਾਂ ਇੱਕ ਦੂਜੇ ਉੱਤੇ ਹਨ।

ਸਾਨੂੰ ਇਹਨਾਂ ਨੂੰ ਅੰਸ਼ਿਕ ਓਵਰਲੈਪ ਕਰਵਾਉਣਾ ਹੈ, ਪੂਰੀ ਤਰ੍ਹਾਂ ਨਹੀਂ। ਇਸ ਲਈ `offset` ਨਾਲ ਖਿਸਕਾਓ ਦਾ ਪ੍ਰਭਾਵ ਬਣਾਇਆ ਜਾ ਸਕਦਾ ਹੈ।

## ਖਿਸਕਾਓ

`offset` ਸਿਰਫ਼ ਵਿਊ ਦੀ drawing position ਨੂੰ ਬਦਲਦਾ ਹੈ, ਪਰ parent view ਦੇ layout ਹਿਸਾਬ ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦਾ।

ਇਸ ਦੀ ਵਰਤੋਂ ਇਸ ਤਰ੍ਹਾਂ ਹੁੰਦੀ ਹੈ:

```swift
.offset(x:y:)
```

`x` ਲੰਬਕਾਰੀ ਦਿਸ਼ਾ ਵਿੱਚ ਖਿਸਕਾਓ ਹੈ, ਅਤੇ `y` ਅਨੁਲੰਬ ਦਿਸ਼ਾ ਵਿੱਚ ਖਿਸਕਾਓ ਹੈ।

ਧਨਾਤਮਕ ਮੁੱਲ ਸੱਜੇ/ਹੇਠਾਂ ਵੱਲ ਖਿਸਕਾਉਂਦੇ ਹਨ, ਅਤੇ ਰਣਾਤਮਕ ਮੁੱਲ ਖੱਬੇ/ਉੱਪਰ ਵੱਲ।

ਦੋ ਗੋਲਾਂ ਨੂੰ ਅੰਸ਼ਿਕ ਓਵਰਲੈਪ ਕਰਵਾਉਣ ਲਈ `offset` ਵਰਤੋ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

ਲਾਲ ਗੋਲ ਦੀ layout position ਨਹੀਂ ਬਦਲੀ, ਪਰ ਉਸਦੀ drawing position 25 points ਖੱਬੇ ਖਿਸਕ ਗਈ। ਇਸ ਲਈ ਦੋਨਾਂ ਗੋਲਾਂ ਵਿੱਚ ਅੰਸ਼ਿਕ ਓਵਰਲੈਪ ਦਾ ਵਿਜੁਅਲ ਪ੍ਰਭਾਵ ਬਣਦਾ ਹੈ।

## ਪਾਰਦਰਸ਼ਤਾ

SwiftUI ਵਿੱਚ, `opacity` ਵਿਊ ਦੀ ਪਾਰਦਰਸ਼ਤਾ ਸੈੱਟ ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਮੂਲ ਵਰਤੋਂ:

```swift
.opacity(0.5)
```

`opacity` ਦੀ value 0.0 ਤੋਂ 1.0 ਤੱਕ ਹੁੰਦੀ ਹੈ, ਜਿਸ ਵਿੱਚ:

* 0 ਦਾ ਅਰਥ ਪੂਰੀ ਤਰ੍ਹਾਂ ਪਾਰਦਰਸ਼ੀ
* 1 ਦਾ ਅਰਥ ਪੂਰੀ ਤਰ੍ਹਾਂ ਅਪਾਰਦਰਸ਼ੀ

ਤੁਸੀਂ ਸੰਤਰੀ ਗੋਲ ਦੀ ਪਾਰਦਰਸ਼ਤਾ ਸੈੱਟ ਕਰਨ ਲਈ `opacity` ਵਰਤ ਸਕਦੇ ਹੋ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

ਜਦੋਂ ਸੰਤਰੀ ਗੋਲ ਦੀ `opacity` 0.8 ਕੀਤੀ ਜਾਂਦੀ ਹੈ, ਤਾਂ ਇਸ ਦੀ ਅਪਾਰਦਰਸ਼ਤਾ 80% ਰਹਿੰਦੀ ਹੈ। ਜਦੋਂ ਦੋ ਗੋਲ ਇੱਕ ਦੂਜੇ ਉੱਤੇ ਆਉਂਦੇ ਹਨ, ਤਾਂ ਓਵਰਲੈਪ ਵਾਲੇ ਖੇਤਰ ਵਿੱਚ ਰੰਗ ਮਿਲੇ ਹੋਏ ਦਿਖਦੇ ਹਨ।

## ਧੁੰਦਲਾਪਣ

SwiftUI ਵਿੱਚ, `blur` ਨਾਲ ਧੁੰਦਲਾਪਣ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
.blur(radius:10)
```

`radius` ਧੁੰਦਲਾਪਣ ਦੀ ਤੀਬਰਤਾ ਦੱਸਦਾ ਹੈ। ਜਿੰਨੀ ਵੱਡੀ value, ਉੱਨਾ ਵੱਧ blur effect।

ਅਸੀਂ ਦੋਨਾਂ ਗੋਲਾਂ ਨੂੰ blur effect ਦੇ ਸਕਦੇ ਹਾਂ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

ਅੰਤ ਵਿੱਚ ਅਸੀਂ ਦੋ ਬਹੁਤ ਧੁੰਦਲੇ ਗੋਲ ਦੇਖ ਸਕਦੇ ਹਾਂ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ SwiftUI ਦੇ ਆਮ ਵਿਜੁਅਲ ਮੋਡੀਫਾਇਰਾਂ 'ਤੇ ਧਿਆਨ ਦਿੱਤਾ, ਅਤੇ ਸਿੱਖਿਆ ਕਿ ਮੋਡੀਫਾਇਰਾਂ ਰਾਹੀਂ ਰੰਗ, ਸਥਿਤੀ ਅਤੇ ਵਿਜੁਅਲ ਪ੍ਰਭਾਵਾਂ ਨੂੰ ਕਿਵੇਂ ਨਿਯੰਤਰਿਤ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਖਾਸ ਉਦਾਹਰਣਾਂ ਰਾਹੀਂ ਤੁਸੀਂ ਦੇਖ ਸਕਦੇ ਹੋ ਕਿ ਵੱਖ-ਵੱਖ ਵਿਜੁਅਲ ਮੋਡੀਫਾਇਰ ਇੰਟਰਫੇਸ ਵਿੱਚ ਕਿਵੇਂ ਕੰਮ ਕਰਦੇ ਹਨ, ਅਤੇ ਸੁਰੱਖਿਅਤ ਖੇਤਰ ਬਾਰੇ ਵੀ ਸਮਝ ਮਿਲੀ।

ਇਹ ਬੁਨਿਆਦੀ ਮੋਡੀਫਾਇਰ ਹਨ। ਇਨ੍ਹਾਂ ਦੀ ਵੱਧ ਤੋਂ ਵੱਧ ਅਭਿਆਸ ਨਾਲ ਵਰਤੋਂ ਕਰਨ ਨਾਲ ਅਸਲ ਵਿਕਾਸ ਵਿੱਚ ਇੰਟਰਫੇਸ ਦੇ ਪ੍ਰਭਾਵਾਂ ਨੂੰ ਹੋਰ ਸਪੱਸ਼ਟ ਤਰੀਕੇ ਨਾਲ ਨਿਯੰਤਰਿਤ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

### ਘਰ ਦਾ ਅਭਿਆਸ

* ਕਿਸੇ ਤਸਵੀਰ 'ਤੇ transparency ਅਤੇ blur effect ਲਗਾਓ
* ਵੱਖ-ਵੱਖ transparency ਵਾਲੇ ਤਿੰਨ ਗੋਲ ਇੱਕ ਦੂਜੇ ਉੱਤੇ ਦਿਖਾਓ
* ਇੱਕ ਐਸੀ background image ਬਣਾਓ ਜੋ ਪੂਰੀ ਸਕ੍ਰੀਨ ਭਰੇ ਅਤੇ safe area ਨੂੰ ਅਣਡਿੱਠਾ ਕਰੇ
* ਕਈ ਵਿਊਜ਼ ਦੀ ਸਥਿਤੀ ਬਦਲਣ ਲਈ `offset` ਵਰਤੋ

ਅਭਿਆਸ ਦਾ ਮਕਸਦ API ਨੂੰ ਯਾਦ ਕਰਨਾ ਨਹੀਂ, ਸਗੋਂ ਵਿਜੁਅਲ ਬਦਲਾਅ ਅਤੇ layout behavior ਦੇ ਵਿਚਕਾਰ ਦੇ ਸੰਬੰਧ ਨੂੰ ਸਮਝਣਾ ਹੈ।
