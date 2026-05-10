# ਦਿੱਖ ਅਨੁਕੂਲਨ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਲਈ ਦਿੱਖ ਅਨੁਕੂਲਨ ਸਿੱਖਾਂਗੇ।

iPhone, iPad ਅਤੇ Mac ਉੱਤੇ, ਵਰਤੋਂਕਾਰ ਹਲਕਾ ਮੋਡ ਵੀ ਚੁਣ ਸਕਦਾ ਹੈ ਅਤੇ ਗੂੜ੍ਹਾ ਮੋਡ ਵੀ ਚੁਣ ਸਕਦਾ ਹੈ।

ਜਦੋਂ ਸਿਸਟਮ ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ ਬਦਲਦਾ ਹੈ, ਬਹੁਤ ਸਾਰੀਆਂ App ਦੇ ਪਿਛੋਕੜ, ਲਿਖਤ ਅਤੇ ਆਇਕਨ ਦੇ ਰੰਗ ਵੀ ਨਾਲ ਬਦਲ ਜਾਂਦੇ ਹਨ।

ਉਦਾਹਰਨ ਲਈ, ਦਿਨ ਵੇਲੇ ਇੰਟਰਫੇਸ ਹਲਕੇ ਪਿਛੋਕੜ ਵਾਲਾ ਹੋ ਸਕਦਾ ਹੈ, ਅਤੇ ਰਾਤ ਵੇਲੇ ਇੰਟਰਫੇਸ ਗੂੜ੍ਹੇ ਪਿਛੋਕੜ ਵਿੱਚ ਬਦਲ ਸਕਦਾ ਹੈ।

![view](../../../Resource/025_view9.png)

ਸਿਸਟਮ ਦੀ ਦਿੱਖ ਦੇ ਅਨੁਸਾਰ ਇੰਟਰਫੇਸ ਨੂੰ ਆਪਣੇ ਆਪ ਠੀਕ ਕਰਨ ਦੀ ਇਸ ਸਮਰੱਥਾ ਨੂੰ ਦਿੱਖ ਅਨੁਕੂਲਨ ਕਿਹਾ ਜਾਂਦਾ ਹੈ।

## Xcode ਵਿੱਚ ਦਿੱਖ ਅਨੁਕੂਲਨ ਦੀ ਪੂਰਵ-ਝਲਕ

ਦਿੱਖ ਅਨੁਕੂਲਨ ਸਿੱਖਣ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ ਪਹਿਲਾਂ ਵੇਖਾਂਗੇ ਕਿ Xcode ਵਿੱਚ ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਦੀ ਪੂਰਵ-ਝਲਕ ਕਿਵੇਂ ਵੇਖੀ ਜਾਂਦੀ ਹੈ।

`Canvas` ਖੇਤਰ ਦੇ ਹੇਠਾਂ, `Device Settings` ਬਟਨ ਤੇ ਕਲਿੱਕ ਕਰੋ। ਇਸ ਨਾਲ `Canvas Device Settings` ਪੌਪ-ਅੱਪ ਖੁੱਲ੍ਹ ਸਕਦਾ ਹੈ।

![canvas](../../../Resource/025_view.png)

ਪੌਪ-ਅੱਪ ਵਿੱਚ ਤੁਸੀਂ `Color Scheme` ਸੈਟਿੰਗ ਵੇਖ ਸਕਦੇ ਹੋ।

![canvas1](../../../Resource/025_view1.png)

ਇਨ੍ਹਾਂ ਵਿੱਚ:

- `Light Appearance` ਹਲਕੇ ਮੋਡ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।
- `Dark Appearance` ਗੂੜ੍ਹੇ ਮੋਡ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਅਸੀਂ ਇੱਥੋਂ ਪੂਰਵ-ਝਲਕ ਦੀ ਦਿੱਖ ਬਦਲ ਸਕਦੇ ਹਾਂ ਅਤੇ ਵੇਖ ਸਕਦੇ ਹਾਂ ਕਿ ਮੌਜੂਦਾ ਇੰਟਰਫੇਸ ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ ਕਿਵੇਂ ਦਿਖਦਾ ਹੈ।

## ਦੋ ਦਿੱਖਾਂ ਨੂੰ ਇਕੱਠੇ ਦਿਖਾਉਣਾ

ਜੇ ਤੁਸੀਂ ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਨੂੰ ਇਕੱਠੇ ਵੇਖਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ `Variants` ਫੰਕਸ਼ਨ ਵਰਤ ਸਕਦੇ ਹੋ।

`Canvas` ਖੇਤਰ ਦੇ ਹੇਠਾਂ, `Variants` ਬਟਨ ਤੇ ਕਲਿੱਕ ਕਰੋ ਅਤੇ `Color Scheme Variants` ਚੁਣੋ।

![canvas2](../../../Resource/025_view2.png)

ਚੋਣ ਕਰਨ ਤੋਂ ਬਾਅਦ, `Canvas` ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਦੀ ਪੂਰਵ-ਝਲਕ ਇਕੱਠੇ ਦਿਖਾਏਗਾ।

![canvas3](../../../Resource/025_view3.png)

ਇਸ ਨਾਲ ਦੋ ਦਿੱਖਾਂ ਵਿੱਚ ਇੰਟਰਫੇਸ ਦੇ ਫਰਕ ਦੀ ਤੁਲਨਾ ਕਰਨਾ ਹੋਰ ਆਸਾਨ ਹੋ ਜਾਂਦਾ ਹੈ।

ਸੌਖੇ ਸ਼ਬਦਾਂ ਵਿੱਚ:

ਜੇ ਤੁਸੀਂ ਸਿਰਫ਼ ਅਸਥਾਈ ਤੌਰ ਤੇ ਹਲਕਾ/ਗੂੜ੍ਹਾ ਮੋਡ ਬਦਲਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ `Canvas Device Settings` ਵਰਤ ਸਕਦੇ ਹੋ।

ਜੇ ਤੁਸੀਂ ਦੋਵੇਂ ਦਿੱਖਾਂ ਇਕੱਠੇ ਵੇਖਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ `Color Scheme Variants` ਵਰਤ ਸਕਦੇ ਹੋ।

## ਵਿਊ ਮੂਲ ਰੂਪ ਵਿੱਚ ਦਿੱਖ ਅਨੁਕੂਲ ਕਰਦੇ ਹਨ

SwiftUI ਵਿੱਚ, ਬਹੁਤ ਸਾਰੇ ਸਿਸਟਮ ਵਿਊ ਮੂਲ ਰੂਪ ਵਿੱਚ ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਨਾਲ ਆਪਣੇ ਆਪ ਅਨੁਕੂਲ ਹੋ ਜਾਂਦੇ ਹਨ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("ਪ੍ਰਕਾਸ਼")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("ਕੁਝ ਕੁਝ ਕੁਝ")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![canvas](../../../Resource/025_view4.png)

ਤੁਸੀਂ ਵੇਖ ਸਕਦੇ ਹੋ ਕਿ ਹਲਕੇ ਮੋਡ ਵਿੱਚ, ਆਇਕਨ ਅਤੇ ਸਿਰਲੇਖ ਆਮ ਤੌਰ ਤੇ ਗੂੜ੍ਹੇ ਰੰਗ ਵਿੱਚ ਦਿਖਦੇ ਹਨ।

ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ, ਆਇਕਨ ਅਤੇ ਸਿਰਲੇਖ ਆਪਣੇ ਆਪ ਹਲਕੇ ਰੰਗ ਵਿੱਚ ਬਦਲ ਜਾਂਦੇ ਹਨ।

ਇਹ ਇਸ ਕਰਕੇ ਹੈ ਕਿ `Text`, `Image` ਵਰਗੇ SwiftUI ਵਿਊ ਮੂਲ ਰੂਪ ਵਿੱਚ ਸਿਸਟਮ ਦੀ ਦਿੱਖ ਦੇ ਅਨੁਸਾਰ ਰੰਗਾਂ ਨੂੰ ਠੀਕ ਕਰਦੇ ਹਨ।

ਅਰਥਾਤ, ਜੇ ਅਸੀਂ ਹੱਥੋਂ ਕੋਈ ਸਥਿਰ ਰੰਗ ਨਿਰਧਾਰਤ ਨਹੀਂ ਕਰਦੇ, ਤਾਂ SwiftUI ਸਾਡੇ ਲਈ ਦਿੱਖ ਅਨੁਕੂਲਨ ਦਾ ਇੱਕ ਹਿੱਸਾ ਸੰਭਾਲ ਲੈਂਦਾ ਹੈ।

## ਸਥਿਰ ਰੰਗ ਆਪਣੇ ਆਪ ਨਹੀਂ ਬਦਲਦੇ

ਧਿਆਨ ਦੇਣ ਦੀ ਲੋੜ ਹੈ ਕਿ ਜੇ ਅਸੀਂ ਹੱਥੋਂ ਕੋਈ ਸਥਿਰ ਰੰਗ ਨਿਰਧਾਰਤ ਕਰਦੇ ਹਾਂ, ਤਾਂ ਉਹ ਹਲਕੇ/ਗੂੜ੍ਹੇ ਮੋਡ ਦੇ ਅਨੁਸਾਰ ਆਪਣੇ ਆਪ ਨਹੀਂ ਬਦਲੇਗਾ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Text("ਕੁਝ ਕੁਝ ਕੁਝ")
	.foregroundStyle(Color.gray)
```

ਇੱਥੇ ਲਿਖਤ ਨੂੰ `Color.gray` ਵਜੋਂ ਨਿਰਧਾਰਤ ਕੀਤਾ ਗਿਆ ਹੈ, ਇਸ ਲਈ ਇਹ ਹਮੇਸ਼ਾ ਸਲੇਟੀ ਰੰਗ ਵਿੱਚ ਦਿਖੇਗੀ।

ਇਕ ਹੋਰ ਉਦਾਹਰਨ:

```swift
Text("ਸਿਰਲੇਖ")
    .foregroundStyle(Color.white)
```

ਇਹ ਕੋਡ ਹਲਕੇ ਮੋਡ ਜਾਂ ਗੂੜ੍ਹੇ ਮੋਡ ਦੋਵਾਂ ਵਿੱਚ ਸਫੈਦ ਲਿਖਤ ਹੀ ਦਿਖਾਏਗਾ।

ਜੇ ਪਿਛੋਕੜ ਵੀ ਹਲਕਾ ਹੈ, ਤਾਂ ਸਫੈਦ ਲਿਖਤ ਸਾਫ਼ ਨਹੀਂ ਦਿਖ ਸਕਦੀ।

ਇਸ ਲਈ ਦਿੱਖ ਅਨੁਕੂਲਨ ਕਰਦੇ ਸਮੇਂ, `Color.white`, `Color.black` ਵਰਗੇ ਸਥਿਰ ਰੰਗ ਬਿਨਾਂ ਸੋਚੇ ਲਿਖਣ ਤੋਂ ਸੰਭਵ ਹੋਵੇ ਤਾਂ ਬਚਣਾ ਚਾਹੀਦਾ ਹੈ।

ਕਈ ਹਾਲਤਾਂ ਵਿੱਚ, ਪਹਿਲਾਂ ਸਿਸਟਮ ਦੀਆਂ semantic styles ਵਰਤੀਆਂ ਜਾ ਸਕਦੀਆਂ ਹਨ, ਉਦਾਹਰਨ ਲਈ:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

ਇਨ੍ਹਾਂ ਵਿੱਚ:

- `.primary` ਆਮ ਤੌਰ ਤੇ ਮੁੱਖ ਸਮੱਗਰੀ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।
- `.secondary` ਆਮ ਤੌਰ ਤੇ ਦੂਜੀ ਪੱਧਰ ਦੀ ਸਮੱਗਰੀ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਇਹ ਹਲਕੇ/ਗੂੜ੍ਹੇ ਮੋਡ ਦੇ ਅਨੁਸਾਰ ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ ਆਪਣੇ ਆਪ ਠੀਕ ਕਰਦੇ ਹਨ।

## ਦਿੱਖ ਦੇ ਅਨੁਸਾਰ ਵੱਖਰੀ ਸਮੱਗਰੀ ਦਿਖਾਉਣਾ

ਕਈ ਵਾਰ, ਅਸੀਂ ਸਿਰਫ਼ ਰੰਗ ਬਦਲਣਾ ਨਹੀਂ ਚਾਹੁੰਦੇ, ਸਗੋਂ ਵੱਖ-ਵੱਖ ਦਿੱਖਾਂ ਵਿੱਚ ਵੱਖਰੀ ਸਮੱਗਰੀ ਵੀ ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

- ਹਲਕੇ ਮੋਡ ਵਿੱਚ ਆਮ ਬਲਬ ਆਇਕਨ ਦਿਖਾਇਆ ਜਾਵੇ।
- ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ ਚਮਕਦਾ ਬਲਬ ਆਇਕਨ ਦਿਖਾਇਆ ਜਾਵੇ।
- ਹਲਕੇ ਮੋਡ ਵਿੱਚ ਸਿਰਲੇਖ `ਪ੍ਰਕਾਸ਼` ਦਿਖਾਏ।
- ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ ਸਿਰਲੇਖ `ਹਨੇਰਾ` ਦਿਖਾਏ।

ਇਸ ਵੇਲੇ, ਸਾਨੂੰ ਇਹ ਨਿਰਧਾਰਤ ਕਰਨਾ ਪੈਂਦਾ ਹੈ ਕਿ ਮੌਜੂਦਾ ਸਿਸਟਮ ਹਲਕੇ ਮੋਡ ਵਿੱਚ ਹੈ ਜਾਂ ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ।

SwiftUI ਵਿੱਚ, ਮੌਜੂਦਾ ਦਿੱਖ ਮੋਡ `colorScheme` environment value ਰਾਹੀਂ ਮਿਲ ਸਕਦਾ ਹੈ:

```swift
@Environment(\.colorScheme) private var colorScheme
```

ਪੂਰਾ ਕੋਡ:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "ਪ੍ਰਕਾਸ਼" : "ਹਨੇਰਾ"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("ਕੁਝ ਕੁਝ ਕੁਝ")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/025_view5.png)

ਪੂਰਵ-ਝਲਕ ਦੇ ਪ੍ਰਭਾਵ ਤੋਂ ਵੇਖਿਆ ਜਾ ਸਕਦਾ ਹੈ ਕਿ ਇੱਕੋ ਵਿਊ ਵੱਖ-ਵੱਖ ਦਿੱਖ ਮੋਡਾਂ ਵਿੱਚ ਬਿਲਕੁਲ ਇੱਕੋ ਜਿਹਾ ਨਹੀਂ ਦਿਖਦਾ।

ਹਲਕੇ ਮੋਡ ਵਿੱਚ, `Image` ਆਮ ਬਲਬ ਆਇਕਨ ਦਿਖਾਉਂਦਾ ਹੈ, ਅਤੇ ਸਿਰਲੇਖ `ਪ੍ਰਕਾਸ਼` ਦਿਖਾਉਂਦਾ ਹੈ।

ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ, `Image` ਚਮਕਦਾ ਬਲਬ ਆਇਕਨ ਦਿਖਾਉਂਦਾ ਹੈ, ਅਤੇ ਸਿਰਲੇਖ `ਹਨੇਰਾ` ਦਿਖਾਉਂਦਾ ਹੈ।

ਅਰਥਾਤ, ਇੱਥੇ ਬਦਲਾਅ ਸਿਰਫ਼ ਰੰਗ ਦਾ ਨਹੀਂ ਹੈ, ਸਗੋਂ ਆਇਕਨ ਦਾ ਨਾਮ ਅਤੇ ਸਿਰਲੇਖ ਦੀ ਲਿਖਤ ਆਪਣੇ ਆਪ ਵੀ ਬਦਲ ਗਏ ਹਨ।

ਇਹ ਇਸ ਕਰਕੇ ਹੈ ਕਿ ਅਸੀਂ ਆਇਕਨ ਅਤੇ ਸਿਰਲੇਖ ਨੂੰ ਸਿੱਧਾ `body` ਵਿੱਚ ਸਥਿਰ ਨਹੀਂ ਲਿਖਿਆ, ਸਗੋਂ `colorScheme` ਦੇ ਅਨੁਸਾਰ ਵੱਖਰੀ ਸਮੱਗਰੀ ਗਿਣੀ ਹੈ।

ਇਸ ਕੋਡ ਵਿੱਚ, ਅਸੀਂ ਦੋ computed properties ਵਰਤੀਆਂ ਹਨ:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "ਪ੍ਰਕਾਸ਼" : "ਹਨੇਰਾ"
}
```

ਜਦੋਂ `colorScheme` `.light` ਹੁੰਦਾ ਹੈ, ਇਸ ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਮੌਜੂਦਾ ਮੋਡ ਹਲਕਾ ਮੋਡ ਹੈ।

ਜਦੋਂ `colorScheme` `.dark` ਹੁੰਦਾ ਹੈ, ਇਸ ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਮੌਜੂਦਾ ਮੋਡ ਗੂੜ੍ਹਾ ਮੋਡ ਹੈ।

ਇਸ ਲਈ ਅਸੀਂ ਵੱਖ-ਵੱਖ ਦਿੱਖ ਮੋਡਾਂ ਦੇ ਅਨੁਸਾਰ ਵੱਖਰੇ ਆਇਕਨ ਨਾਮ ਅਤੇ ਸਿਰਲੇਖ ਲਿਖਤ ਵਾਪਸ ਕਰ ਸਕਦੇ ਹਾਂ।

ਇਹ computed property ਦਾ ਇੱਕ ਆਮ ਇਸਤੇਮਾਲ ਵੀ ਹੈ: ਮੌਜੂਦਾ ਸਥਿਤੀ ਦੇ ਅਨੁਸਾਰ, ਵਿਊ ਨੂੰ ਦਿਖਾਉਣੀ ਸਮੱਗਰੀ ਗਿਣਣਾ।

## @Environment ਨੂੰ ਸਮਝਣਾ

ਇਹ ਪਹਿਲੀ ਵਾਰ ਹੈ ਜਦੋਂ ਅਸੀਂ `@Environment` ਨਾਲ ਜਾਣ-ਪਛਾਣ ਕਰ ਰਹੇ ਹਾਂ।

`@Environment` ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: SwiftUI ਦੇ environment ਵਿਚੋਂ ਇੱਕ value ਪੜ੍ਹਨਾ।

ਜਦੋਂ App ਚੱਲਦੀ ਹੈ, ਸਿਸਟਮ ਬਹੁਤ ਸਾਰੀ environment ਜਾਣਕਾਰੀ ਦਿੰਦਾ ਹੈ, ਉਦਾਹਰਨ ਲਈ:

- ਮੌਜੂਦਾ ਭਾਸ਼ਾ
- ਮੌਜੂਦਾ ਦਿੱਖ ਮੋਡ
- ਮੌਜੂਦਾ layout direction
- ਮੌਜੂਦਾ font size setting

ਜਦੋਂ ਸਾਨੂੰ ਮੌਜੂਦਾ ਦਿੱਖ ਮੋਡ ਲੈਣਾ ਹੋਵੇ, ਤਾਂ ਅਸੀਂ `colorScheme` ਪੜ੍ਹ ਸਕਦੇ ਹਾਂ:

```swift
@Environment(\.colorScheme) private var colorScheme
```

ਇੱਥੇ

```swift
\.colorScheme
```

environment ਵਿਚੋਂ `colorScheme` value ਪੜ੍ਹਣ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

```swift
private var colorScheme
```

ਪੜ੍ਹੀ ਗਈ value ਨੂੰ `colorScheme` variable ਵਿੱਚ ਸੰਭਾਲਣ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

variable ਦਾ ਨਾਮ ਤੁਸੀਂ ਖੁਦ ਤੈਅ ਕਰ ਸਕਦੇ ਹੋ। ਉਦਾਹਰਨ ਲਈ, ਇਹ ਵੀ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

ਜਦੋਂ ਤੱਕ ਅੱਗੇ ਵਾਲਾ `\.colorScheme` ਨਹੀਂ ਬਦਲਦਾ, ਇਸ ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਪੜ੍ਹਿਆ ਜਾ ਰਿਹਾ value ਮੌਜੂਦਾ ਦਿੱਖ ਮੋਡ ਹੈ।

## colorScheme ਦੇ ਦੋ ਆਮ value

`colorScheme` ਦੇ ਆਮ ਤੌਰ ਤੇ ਦੋ value ਹੁੰਦੇ ਹਨ:

```swift
.light
.dark
```

ਇਨ੍ਹਾਂ ਦਾ ਅਰਥ ਹੈ:

- `.light`: ਹਲਕਾ ਮੋਡ
- `.dark`: ਗੂੜ੍ਹਾ ਮੋਡ

ਉਦਾਹਰਨ ਲਈ:

```swift
private var titleName: String {
    colorScheme == .light ? "ਪ੍ਰਕਾਸ਼" : "ਹਨੇਰਾ"
}
```

ਇਸ ਕੋਡ ਦਾ ਅਰਥ ਹੈ:

ਜੇ ਮੌਜੂਦਾ ਮੋਡ ਹਲਕਾ ਮੋਡ ਹੈ, ਤਾਂ `colorScheme == .light` true ਹੋਵੇਗਾ, ਅਤੇ `"ਪ੍ਰਕਾਸ਼"` ਵਾਪਸ ਕੀਤਾ ਜਾਵੇਗਾ।

ਨਹੀਂ ਤਾਂ, `"ਹਨੇਰਾ"` ਵਾਪਸ ਕੀਤਾ ਜਾਵੇਗਾ।

ਇਸ ਲਈ, ਹਲਕੇ ਮੋਡ ਵਿੱਚ:

```swift
Text(titleName)
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲੀ ਲਿਖਤ ਹੈ:

```swift
ਪ੍ਰਕਾਸ਼
```

ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ, ਦਿਖਾਈ ਦੇਣ ਵਾਲੀ ਲਿਖਤ ਹੈ:

```swift
ਹਨੇਰਾ
```

ਇਸ ਤਰੀਕੇ ਨਾਲ, ਅਸੀਂ ਵੱਖ-ਵੱਖ ਦਿੱਖਾਂ ਦੇ ਅਨੁਸਾਰ ਵੱਖਰੀ ਸਮੱਗਰੀ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

## ਰੰਗ ਅਨੁਕੂਲਨ ਦਾ ਉਦਾਹਰਨ

ਲਿਖਤ ਅਤੇ ਆਇਕਨ ਤੋਂ ਇਲਾਵਾ, ਕਈ ਵਾਰ ਸਾਨੂੰ ਰੰਗਾਂ ਦਾ ਅਨੁਕੂਲਨ ਖੁਦ ਵੀ ਸੰਭਾਲਣਾ ਪੈਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ਲਿਖਤ")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/025_view6.png)

ਇਸ ਕੋਡ ਵਿੱਚ, ਲਿਖਤ ਸਫੈਦ ਹੈ ਅਤੇ ਪਿਛੋਕੜ ਕਾਲਾ ਹੈ।

ਹਲਕੇ ਮੋਡ ਵਿੱਚ, ਕਾਲਾ ਪਿਛੋਕੜ ਕਾਫ਼ੀ ਸਪਸ਼ਟ ਹੁੰਦਾ ਹੈ।

ਪਰ ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ, ਜੇ ਪੂਰੇ ਇੰਟਰਫੇਸ ਦਾ ਪਿਛੋਕੜ ਵੀ ਕਾਲਾ ਹੈ, ਤਾਂ ਇਹ ਕਾਲਾ ਪਿਛੋਕੜ ਸਿਸਟਮ ਪਿਛੋਕੜ ਵਿੱਚ ਮਿਲ ਜਾਂਦਾ ਹੈ ਅਤੇ ਕਾਫ਼ੀ ਸਪਸ਼ਟ ਨਹੀਂ ਲੱਗਦਾ।

ਇਸ ਵੇਲੇ, ਅਸੀਂ ਦਿੱਖ ਮੋਡ ਦੇ ਅਨੁਸਾਰ ਲਿਖਤ ਦਾ ਰੰਗ ਅਤੇ ਪਿਛੋਕੜ ਦਾ ਰੰਗ ਬਦਲ ਸਕਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("ਲਿਖਤ")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/025_view7.png)

ਹੁਣ, ਹਲਕੇ ਮੋਡ ਵਿੱਚ ਕਾਲਾ ਪਿਛੋਕੜ ਅਤੇ ਸਫੈਦ ਲਿਖਤ ਹੈ।

ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ ਸਫੈਦ ਪਿਛੋਕੜ ਅਤੇ ਕਾਲੀ ਲਿਖਤ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ, ਕਿਸੇ ਵੀ ਦਿੱਖ ਵਿੱਚ ਲਿਖਤ ਅਤੇ ਪਿਛੋਕੜ ਵਿੱਚ ਸਪਸ਼ਟ contrast ਰਹਿੰਦਾ ਹੈ, ਅਤੇ ਵਰਤੋਂਕਾਰ ਸਮੱਗਰੀ ਨੂੰ ਸਾਫ਼ ਵੇਖ ਸਕਦਾ ਹੈ।

## Assets ਨਾਲ ਰੰਗ ਅਨੁਕੂਲਨ ਕਰਨਾ

`colorScheme` ਨਾਲ ਹੱਥੋਂ ਨਿਰਧਾਰਤ ਕਰਨ ਤੋਂ ਇਲਾਵਾ, ਅਸੀਂ ਹਲਕੇ/ਗੂੜ੍ਹੇ ਮੋਡ ਲਈ `Assets` resource colors ਵੀ ਵਰਤ ਸਕਦੇ ਹਾਂ।

ਇਹ ਤਰੀਕਾ App ਵਿੱਚ ਆਮ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਰੰਗਾਂ ਦੇ ਪ੍ਰਬੰਧ ਲਈ ਹੋਰ ਵਧੀਆ ਹੈ।

Xcode project ਵਿੱਚ, `Assets` resource folder ਲੱਭੋ।

![assets](../../../Resource/025_color.png)

`Assets` folder ਖੋਲ੍ਹੋ, ਖਾਲੀ ਖੇਤਰ ਤੇ right-click ਕਰੋ, `New Color Set` ਚੁਣੋ ਅਤੇ ਇੱਕ ਨਵਾਂ color resource ਬਣਾਓ।

![assets](../../../Resource/025_color1.png)

ਇੱਥੇ ਅਸੀਂ ਇੱਕ ਰੰਗ ਬਣਾਉਂਦੇ ਹਾਂ ਅਤੇ ਇਸ ਦਾ ਨਾਮ `redText` ਰੱਖਦੇ ਹਾਂ।

![assets](../../../Resource/025_color2.png)

color resource ਵਿੱਚ ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਲਈ ਵੱਖ-ਵੱਖ ਰੰਗ ਸੈੱਟ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ।

![assets](../../../Resource/025_color3.png)

ਸੰਬੰਧਿਤ ਰੰਗ ਖੇਤਰ ਚੁਣਨ ਤੋਂ ਬਾਅਦ, ਸੱਜੇ ਪਾਸੇ attributes inspector ਵਿੱਚ ਰੰਗ ਸੋਧਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਉੱਪਰ ਸੱਜੇ ਕੋਨੇ ਦੇ `Hide or show the Inspectors` ਬਟਨ ਤੇ ਕਲਿੱਕ ਕਰੋ ਅਤੇ inspector ਖੇਤਰ ਖੋਲ੍ਹੋ।

ਫਿਰ `Show the Attributes inspector` ਚੁਣੋ, ਹੇਠਾਂ `Show Color Panel` ਲੱਭੋ ਅਤੇ color panel ਖੋਲ੍ਹੋ।

![assets](../../../Resource/025_color4.png)

color panel ਵਿੱਚ ਰੰਗ ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੋਂ ਬਾਅਦ, `redText` ਨਾਲ ਸੰਬੰਧਿਤ ਰੰਗ ਖੇਤਰ ਵੀ ਨਾਲ ਹੀ ਬਦਲ ਜਾਂਦਾ ਹੈ।

ਇੱਥੇ ਅਸੀਂ `redText` ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸੈੱਟ ਕਰਦੇ ਹਾਂ:

- ਹਲਕੇ ਮੋਡ ਵਿੱਚ ਲਾਲ ਰੰਗ ਦਿਖਾਓ
- ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ ਹਰਾ ਰੰਗ ਦਿਖਾਓ

![assets](../../../Resource/025_color5.png)

SwiftUI ਕੋਡ ਵਿੱਚ ਵਾਪਸ ਆ ਕੇ, ਇਹ ਰੰਗ ਇਸ ਤਰ੍ਹਾਂ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

ਇੱਥੇ:

```swift
Color("redText")
```

`Assets` ਵਿਚੋਂ `redText` ਨਾਮ ਵਾਲਾ color resource ਪੜ੍ਹਣ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![assets](../../../Resource/025_view8.png)

ਤੁਸੀਂ ਵੇਖ ਸਕਦੇ ਹੋ ਕਿ ਇੱਕੋ `Color("redText")` ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਵਿੱਚ ਵੱਖਰੇ ਰੰਗ ਦਿਖਾਉਂਦਾ ਹੈ।

ਇਸ ਨਾਲ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ `Assets` color ਆਪਣੇ ਆਪ ਵੀ ਦਿੱਖ ਅਨੁਕੂਲਨ ਦਾ ਸਮਰਥਨ ਕਰਦਾ ਹੈ।

## colorScheme ਅਤੇ Assets ਦਾ ਫਰਕ

`colorScheme` ਅਤੇ `Assets` ਦੋਵੇਂ ਦਿੱਖ ਅਨੁਕੂਲਨ ਕਰ ਸਕਦੇ ਹਨ, ਪਰ ਇਹ ਵੱਖ-ਵੱਖ ਹਾਲਤਾਂ ਲਈ ਢੁਕਵੇਂ ਹਨ।

ਜੇ ਸਿਰਫ਼ ਹਲਕੇ/ਗੂੜ੍ਹੇ ਮੋਡ ਦੇ ਅਨੁਸਾਰ ਲਿਖਤ ਸਮੱਗਰੀ, ਚਿੱਤਰ ਨਾਮ ਜਾਂ `SF Symbols` ਨਾਮ ਬਦਲਣਾ ਹੈ, ਤਾਂ `colorScheme` ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

ਜੇ ਇਹ App ਵਿੱਚ ਅਕਸਰ ਵਰਤਿਆ ਜਾਣ ਵਾਲਾ ਰੰਗ ਹੈ, ਜਿਵੇਂ theme color, card background color ਜਾਂ text color, ਤਾਂ `Assets` color ਵਰਤਣਾ ਹੋਰ ਸਿਫਾਰਸ਼ੀ ਹੈ।

ਕਿਉਂਕਿ `Assets` color ਨੂੰ ਕਈ ਵਿਊ ਵਿੱਚ ਮੁੜ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ, ਅਤੇ ਬਾਅਦ ਵਿੱਚ ਸੋਧਣਾ ਵੀ ਹੋਰ ਆਸਾਨ ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Color("redText")
```

ਇਸ ਤਰ੍ਹਾਂ ਸਿਰਫ਼ `Assets` ਵਿੱਚ ਰੰਗ ਸੋਧਣ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ, ਅਤੇ ਜਿੱਥੇ ਵੀ ਇਹ ਰੰਗ ਵਰਤਿਆ ਗਿਆ ਹੈ, ਉੱਥੇ ਸਭ ਕੁਝ ਇਕੱਠੇ ਬਦਲ ਜਾਵੇਗਾ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਲਈ ਦਿੱਖ ਅਨੁਕੂਲਨ ਸਿੱਖਿਆ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ ਸਿੱਖਿਆ ਕਿ Xcode ਦੇ `Canvas` ਵਿੱਚ ਵੱਖਰੀਆਂ ਦਿੱਖਾਂ ਦੀ ਪੂਰਵ-ਝਲਕ ਕਿਵੇਂ ਵੇਖਣੀ ਹੈ, ਅਤੇ `Color Scheme Variants` ਨਾਲ ਹਲਕਾ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹਾ ਮੋਡ ਇਕੱਠੇ ਕਿਵੇਂ ਵੇਖਣਾ ਹੈ।

ਫਿਰ, ਅਸੀਂ ਜਾਣਿਆ ਕਿ SwiftUI ਵਿੱਚ `Text`, `Image` ਵਰਗੇ ਵਿਊ ਮੂਲ ਰੂਪ ਵਿੱਚ ਸਿਸਟਮ ਦੀ ਦਿੱਖ ਦੇ ਅਨੁਸਾਰ ਆਪਣੇ ਆਪ ਰੰਗ ਅਨੁਕੂਲ ਕਰਦੇ ਹਨ।

ਪਰ ਜੇ ਹੱਥੋਂ ਸਥਿਰ ਰੰਗ ਨਿਰਧਾਰਤ ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਜਿਵੇਂ `Color.white` ਜਾਂ `Color.black`, ਤਾਂ ਇਹ ਰੰਗ ਆਪਣੇ ਆਪ ਨਹੀਂ ਬਦਲਦੇ।

ਇਸ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ `@Environment` ਅਤੇ `colorScheme` ਸਿੱਖੇ:

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme` ਰਾਹੀਂ, ਅਸੀਂ ਨਿਰਧਾਰਤ ਕਰ ਸਕਦੇ ਹਾਂ ਕਿ ਮੌਜੂਦਾ ਮੋਡ ਹਲਕਾ ਹੈ ਜਾਂ ਗੂੜ੍ਹਾ, ਅਤੇ ਵੱਖਰੀਆਂ ਦਿੱਖਾਂ ਦੇ ਅਨੁਸਾਰ ਵੱਖਰੇ ਆਇਕਨ, ਲਿਖਤ ਜਾਂ ਰੰਗ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

ਅੰਤ ਵਿੱਚ, ਅਸੀਂ `Assets` color ਸਿੱਖਿਆ।

`Assets` color ਹਲਕੇ ਮੋਡ ਅਤੇ ਗੂੜ੍ਹੇ ਮੋਡ ਲਈ ਵੱਖਰੇ ਰੰਗ ਸੈੱਟ ਕਰ ਸਕਦਾ ਹੈ, ਅਤੇ App ਵਿੱਚ ਆਮ ਵਰਤੇ ਜਾਣ ਵਾਲੇ color resources ਦੇ ਪ੍ਰਬੰਧ ਲਈ ਢੁਕਵਾਂ ਹੈ।

ਦਿੱਖ ਅਨੁਕੂਲਨ App ਨੂੰ ਦਿਨ ਅਤੇ ਰਾਤ ਦੋਵਾਂ ਸਮੇਂ ਹੋਰ ਵਧੀਆ ਦਿਖਾਉਂਦਾ ਹੈ, ਅਤੇ ਇਹ ਲਿਖਤ ਨਾ ਦਿਖਣ ਜਾਂ ਪਿਛੋਕੜ ਸਪਸ਼ਟ ਨਾ ਹੋਣ ਵਰਗੀਆਂ ਸਮੱਸਿਆਵਾਂ ਤੋਂ ਵੀ ਬਚਾ ਸਕਦਾ ਹੈ।

ਅਸਲ ਵਿਕਾਸ ਵਿੱਚ, SwiftUI ਦੀ ਮੂਲ ਅਨੁਕੂਲਨ ਸਮਰੱਥਾ ਅਤੇ `Assets` colors ਨੂੰ ਪਹਿਲਾਂ ਵਰਤਣ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ।

ਜਦੋਂ ਵੱਖਰੀਆਂ ਦਿੱਖਾਂ ਵਿੱਚ ਲਿਖਤ, ਆਇਕਨ, ਚਿੱਤਰ ਬਦਲਣੇ ਹੋਣ, ਜਾਂ ਕੁਝ ਖਾਸ display effects ਸੰਭਾਲਣੇ ਹੋਣ, ਤਾਂ ਫਿਰ `colorScheme` ਨਾਲ ਨਿਰਧਾਰਤ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

## ਵਾਧੂ ਗਿਆਨ: font size ਨਿਰਧਾਰਤ ਕਰਨਾ

ਪਹਿਲਾਂ `font` ਸਿੱਖਦੇ ਸਮੇਂ, ਅਸੀਂ ਕੁਝ system font styles ਵਰਤੀਆਂ ਸਨ:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

`.largeTitle`, `.callout` ਵਰਗੀਆਂ system font styles ਵਰਤਣ ਤੋਂ ਇਲਾਵਾ, font size ਹੱਥੋਂ ਵੀ ਨਿਰਧਾਰਤ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

ਇੱਥੇ:

```swift
.font(.system(size: 100))
```

font size ਨੂੰ `100 pt` ਤੇ ਸੈੱਟ ਕਰਨ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

`SF Symbols` ਆਇਕਨ ਲਈ, `font` ਵੀ ਆਇਕਨ ਦੇ ਆਕਾਰ ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਕਰਦਾ ਹੈ।

ਇਸ ਲਈ, ਜੇ ਤੁਸੀਂ ਆਇਕਨ ਨੂੰ ਵੱਡਾ ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ `.font(.system(size:))` ਰਾਹੀਂ ਆਕਾਰ ਨਿਰਧਾਰਤ ਕਰ ਸਕਦੇ ਹੋ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

ਧਿਆਨ ਦੇਣ ਦੀ ਲੋੜ ਹੈ ਕਿ ਹੱਥੋਂ font size ਨਿਰਧਾਰਤ ਕਰਨਾ ਹੋਰ ਲਚਕੀਲਾ ਹੈ, ਪਰ ਆਮ ਲਿਖਤ ਲਈ ਵੱਡੀ ਮਾਤਰਾ ਵਿੱਚ fixed font size ਵਰਤਣ ਦੀ ਸਿਫਾਰਸ਼ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ।

ਆਮ ਲਿਖਤ ਲਈ ਪਹਿਲਾਂ `.title`, `.headline`, `.body`, `.caption` ਵਰਗੀਆਂ system font styles ਵਰਤੋ।

ਇਸ ਨਾਲ ਵੱਖ-ਵੱਖ ਡਿਵਾਈਸਾਂ ਅਤੇ ਵਰਤੋਂਕਾਰ ਦੀਆਂ font settings ਨਾਲ ਹੋਰ ਵਧੀਆ ਅਨੁਕੂਲਨ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।
