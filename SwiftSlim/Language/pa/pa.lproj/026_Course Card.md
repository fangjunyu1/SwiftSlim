# ਕੋਰਸ ਕਾਰਡ

ਇਹ ਪਾਠ ਇੱਕ ਪੜਾਅਵਾਰ ਦੁਹਰਾਈ ਪਾਠ ਹੈ। ਅਸੀਂ ਇੱਕ “ਕੋਰਸ ਕਾਰਡ” ਪੂਰਾ ਕਰਾਂਗੇ।

ਇਸ ਅਭਿਆਸ ਰਾਹੀਂ, ਅਸੀਂ ਪਹਿਲਾਂ ਸਿੱਖੇ `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` ਆਦਿ ਸਮੱਗਰੀ ਨੂੰ ਦੁਹਰਾ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਇਹ ਵੀ ਸਿੱਖ ਸਕਦੇ ਹਾਂ ਕਿ ਕਈ ਛੋਟੇ ਵਿਊਜ਼ ਨੂੰ ਜੋੜ ਕੇ ਇੱਕ ਪੂਰਾ ਵਿਊ ਮੋਡੀਊਲ ਕਿਵੇਂ ਬਣਾਇਆ ਜਾਂਦਾ ਹੈ।

ਕੋਰਸ ਕਾਰਡ ਦਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view.png)

ਇਸ ਕੋਰਸ ਕਾਰਡ ਵਿੱਚ ਮੁੱਖ ਤੌਰ 'ਤੇ ਕਈ ਹਿੱਸੇ ਹਨ:

- ਕੋਰਸ ਪੱਧਰ: `ਸ਼ੁਰੂਆਤੀ`
- ਕੋਰਸ ਸਮੱਗਰੀ: `20+ ਪਾਠ`
- ਕੋਰਸ ਸਿਰਲੇਖ: `SwiftUI ਸ਼ੁਰੂਆਤੀ ਟਿਊਟੋਰਿਅਲ`
- ਕੋਰਸ ਵੇਰਵਾ
- ਬਟਨ: `ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰੋ`
- ਕੋਰਸ ਪਿਛੋਕੜ: Swift ਆਈਕਨ ਅਤੇ ਇੰਡਿਗੋ ਰੰਗ ਦਾ ਪਿਛੋਕੜ

ਅਸੀਂ ਇਹ ਵਿਊ `ContentView` ਵਿੱਚ ਪੂਰਾ ਕਰ ਸਕਦੇ ਹਾਂ।

## ਉੱਪਰੀ ਖੇਤਰ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਕੋਰਸ ਕਾਰਡ ਦਾ ਉੱਪਰੀ ਖੇਤਰ ਬਣਾਓ।

![view](../../../Resource/026_view1.png)

ਉੱਪਰੀ ਖੇਤਰ ਦੇ ਖੱਬੇ ਪਾਸੇ ਕੋਰਸ ਪੱਧਰ ਅਤੇ ਸੱਜੇ ਪਾਸੇ ਕੋਰਸ ਸਮੱਗਰੀ ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ।

ਕਿਉਂਕਿ ਇਹ ਦੋਵੇਂ ਸਮੱਗਰੀਆਂ ਹੋਰਿਜ਼ਾਂਟਲ ਤੌਰ 'ਤੇ ਲਗੀਆਂ ਹਨ, ਇਸ ਲਈ `HStack` ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

```swift
var topView: some View {
    HStack {
        Text("ਸ਼ੁਰੂਆਤੀ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ ਪਾਠ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

ਇੱਥੇ ਅਸੀਂ ਉੱਪਰੀ ਖੇਤਰ ਨੂੰ ਇੱਕ computed property ਵਜੋਂ ਵੱਖ ਕੀਤਾ ਹੈ:

```swift
var topView: some View
```

ਇਸ ਤਰ੍ਹਾਂ ਕਰਨ ਦਾ ਫਾਇਦਾ ਇਹ ਹੈ ਕਿ `body` ਹੋਰ ਸਾਫ਼ ਹੋ ਜਾਂਦਾ ਹੈ।

ਉੱਪਰੀ ਖੇਤਰ ਵਿੱਚ ਮੁੱਖ ਤੌਰ 'ਤੇ ਇਹ ਸਮੱਗਰੀ ਵਰਤੀ ਗਈ ਹੈ:

- `HStack`: ਦੋ ਟੈਕਸਟਾਂ ਨੂੰ ਹੋਰਿਜ਼ਾਂਟਲ ਤੌਰ 'ਤੇ ਲਗਾਉਂਦਾ ਹੈ।
- `Text`: ਲਿਖਤੀ ਸਮੱਗਰੀ ਦਿਖਾਉਂਦਾ ਹੈ।
- `Spacer()`: ਖੱਬੇ ਟੈਕਸਟ ਨੂੰ ਖੱਬੇ ਪਾਸੇ ਅਤੇ ਸੱਜੇ ਟੈਕਸਟ ਨੂੰ ਸੱਜੇ ਪਾਸੇ ਧੱਕਦਾ ਹੈ।
- `.font(.footnote)`: ਛੋਟੀ ਟੈਕਸਟ ਸ਼ੈਲੀ ਸੈੱਟ ਕਰਦਾ ਹੈ।
- `.fontWeight(.bold)`: ਟੈਕਸਟ ਨੂੰ ਬੋਲਡ ਕਰਦਾ ਹੈ।
- `.foregroundStyle(Color.white)`: foreground ਰੰਗ ਸਫੈਦ ਸੈੱਟ ਕਰਦਾ ਹੈ।
- `.padding(.vertical, 10)`: ਉੱਪਰ-ਹੇਠਾਂ ਅੰਦਰੂਨੀ ਖਾਲੀ ਥਾਂ ਸੈੱਟ ਕਰਦਾ ਹੈ।
- `.padding(.horizontal, 16)`: ਖੱਬੇ-ਸੱਜੇ ਅੰਦਰੂਨੀ ਖਾਲੀ ਥਾਂ ਸੈੱਟ ਕਰਦਾ ਹੈ।
- `.background(Color.white.opacity(0.15))`: ਅਰਧ-ਪਾਰਦਰਸ਼ੀ ਸਫੈਦ ਪਿਛੋਕੜ ਸੈੱਟ ਕਰਦਾ ਹੈ।
- `.cornerRadius(20)`: ਗੋਲ ਕੋਨੇ ਸੈੱਟ ਕਰਦਾ ਹੈ।

ਇੱਥੇ `ਸ਼ੁਰੂਆਤੀ` ਨੇ ਦੋ ਦਿਸ਼ਾਵਾਂ ਵਾਲੇ `.padding()` ਵਰਤੇ ਹਨ:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

ਇਸ ਨਾਲ ਟੈਕਸਟ ਦੇ ਉੱਪਰ-ਹੇਠਾਂ ਅਤੇ ਖੱਬੇ-ਸੱਜੇ ਦੋਵੇਂ ਪਾਸੇ ਜਗ੍ਹਾ ਬਣਦੀ ਹੈ, ਅਤੇ ਇਹ ਇੱਕ ਲੇਬਲ ਵਰਗਾ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।

`Color.white.opacity(0.15)` ਦਾ ਮਤਲਬ ਹੈ `15%` ਅਪਾਰਦਰਸ਼ਤਾ ਵਾਲਾ ਸਫੈਦ ਰੰਗ, ਯਾਨੀ ਬਹੁਤ ਹਲਕਾ ਸਫੈਦ।

### ਕਾਰਡ ਪਿਛੋਕੜ ਜੋੜਨਾ

ਪਹਿਲਾਂ ਅਸੀਂ `topView` ਬਣਾਇਆ ਸੀ, ਪਰ ਸਿਰਫ਼ ਵਿਊ ਬਣਾਉਣ ਨਾਲ ਇਹ ਆਪਣੇ ਆਪ ਨਹੀਂ ਦਿਖਾਈ ਦੇਵੇਗਾ।

SwiftUI ਵਿੱਚ, ਜੋ ਸਮੱਗਰੀ ਅਸਲ ਵਿੱਚ ਇੰਟਰਫੇਸ 'ਤੇ ਦਿਖਾਈ ਦੇਣੀ ਹੈ, ਉਹ `body` ਵਿੱਚ ਲਿਖਣੀ ਪੈਂਦੀ ਹੈ।

ਇਸ ਲਈ, ਪਹਿਲਾਂ `topView` ਨੂੰ `body` ਵਿੱਚ ਰੱਖ ਕੇ ਦਿਖਾ ਸਕਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

ਹੁਣ ਤੁਸੀਂ ਵੇਖੋਗੇ ਕਿ ਉੱਪਰੀ ਖੇਤਰ ਪਹਿਲਾਂ ਹੀ ਦਿਖਾਈ ਦੇ ਰਿਹਾ ਹੈ:

![view](../../../Resource/026_view2.png)

ਪਰ ਕਿਉਂਕਿ `topView` ਵਿੱਚ ਟੈਕਸਟ ਸਫੈਦ ਹੈ ਅਤੇ ਡਿਫਾਲਟ ਪਿਛੋਕੜ ਵੀ ਹਲਕਾ ਹੁੰਦਾ ਹੈ, ਲਾਈਟ ਮੋਡ ਵਿੱਚ ਇਹ ਸਪਸ਼ਟ ਨਾ ਦਿਖੇ।

ਇਸ ਲਈ, ਅਸੀਂ ਬਾਹਰੀ ਪਰਤ ਵਿੱਚ ਇੱਕ `VStack` ਜੋੜ ਸਕਦੇ ਹਾਂ, ਫਿਰ ਪੂਰੇ ਖੇਤਰ ਲਈ ਅੰਦਰੂਨੀ ਖਾਲੀ ਥਾਂ, ਪਿਛੋਕੜ ਰੰਗ ਅਤੇ ਗੋਲ ਕੋਨੇ ਸੈੱਟ ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view3.png)

ਇੱਥੇ `VStack` ਵਿੱਚ ਇਸ ਵੇਲੇ ਸਿਰਫ਼ ਇੱਕ `topView` ਰੱਖਿਆ ਗਿਆ ਹੈ, ਇਸ ਲਈ ਇਹ ਲਾਜ਼ਮੀ ਨਹੀਂ ਲੱਗਦਾ।

ਪਰ ਬਾਅਦ ਵਿੱਚ ਅਸੀਂ ਕੋਰਸ ਸਿਰਲੇਖ, ਕੋਰਸ ਵੇਰਵਾ ਅਤੇ ਬਟਨ ਖੇਤਰ ਜੋੜਦੇ ਰਹਾਂਗੇ। ਇਹ ਸਾਰੇ ਉੱਪਰ-ਹੇਠਾਂ ਲੱਗਣ ਵਾਲੀ ਸਮੱਗਰੀ ਹਨ, ਇਸ ਲਈ ਇੱਥੇ ਪਹਿਲਾਂ ਹੀ `VStack` ਵਰਤਣਾ ਬਾਅਦ ਵਿੱਚ ਵਿਊਜ਼ ਜੋੜਨ ਲਈ ਸੁਵਿਧਾਜਨਕ ਹੈ।

ਇੱਥੇ ਦੋ `.padding()` ਹਨ, ਅਤੇ ਉਨ੍ਹਾਂ ਦੀ ਭੂਮਿਕਾ ਵੱਖਰੀ ਹੈ।

ਪਹਿਲਾ `.padding(20)` `.background()` ਤੋਂ ਪਹਿਲਾਂ ਲਿਖਿਆ ਗਿਆ ਹੈ:

```swift
.padding(20)
.background(Color.indigo)
```

ਇਹ ਕਾਰਡ ਦੇ ਅੰਦਰਲੀ ਖਾਲੀ ਥਾਂ ਨੂੰ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ, ਯਾਨੀ ਸਮੱਗਰੀ ਅਤੇ ਪਿਛੋਕੜ ਦੇ ਕਿਨਾਰੇ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ।

ਦੂਜਾ `.padding(30)` `.background()` ਤੋਂ ਬਾਅਦ ਲਿਖਿਆ ਗਿਆ ਹੈ:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

ਇਹ ਕਾਰਡ ਦੇ ਬਾਹਰੀ ਫਾਸਲੇ ਨੂੰ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ, ਯਾਨੀ ਪੂਰੇ ਕਾਰਡ ਅਤੇ ਸਕਰੀਨ ਦੇ ਕਿਨਾਰੇ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ।

![view](../../../Resource/026_view4.png)

ਇਸ ਲਈ, ਦੋਵੇਂ `.padding()` ਹਨ, ਪਰ ਵੱਖ-ਵੱਖ ਥਾਂ ਲਿਖਣ ਨਾਲ ਪ੍ਰਭਾਵ ਵੀ ਵੱਖਰਾ ਹੁੰਦਾ ਹੈ।

## ਸਮੱਗਰੀ ਖੇਤਰ

ਹੁਣ ਕੋਰਸ ਕਾਰਡ ਦਾ ਸਮੱਗਰੀ ਖੇਤਰ ਬਣਾਉਂਦੇ ਹਾਂ।

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view5.png)

ਸਮੱਗਰੀ ਖੇਤਰ ਵਿੱਚ ਕੋਰਸ ਸਿਰਲੇਖ ਅਤੇ ਕੋਰਸ ਵੇਰਵਾ ਸ਼ਾਮਲ ਹਨ। ਇਹ ਉੱਪਰ-ਹੇਠਾਂ ਲੱਗਦੇ ਹਨ, ਇਸ ਲਈ `VStack` ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI ਸ਼ੁਰੂਆਤੀ ਟਿਊਟੋਰਿਅਲ")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("ਜ਼ੀਰੋ ਤੋਂ SwiftUI ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ Apple ਦੇ declarative UI development ਨੂੰ ਪ੍ਰਣਾਲੀਬੱਧ ਢੰਗ ਨਾਲ ਸਿੱਖੋ। ਸਪਸ਼ਟ ਵਿਆਖਿਆਵਾਂ ਅਤੇ ਅਮਲੀ ਉਦਾਹਰਣਾਂ ਰਾਹੀਂ, ਤੁਸੀਂ ਹੌਲੀ-ਹੌਲੀ layout, interaction ਅਤੇ state management ਵਿੱਚ ਦੱਖਲ ਹਾਸਲ ਕਰੋਗੇ, ਤਾਂ ਜੋ ਸੁੰਦਰ ਅਤੇ ਲਾਭਦਾਇਕ app interfaces ਬਣਾਏ ਜਾ ਸਕਣ।")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view6.png)

ਇੱਥੇ `VStack` ਵਿੱਚ ਦੋ ਪੈਰਾਮੀਟਰ ਵਰਤੇ ਗਏ ਹਨ:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` ਦਾ ਮਤਲਬ ਹੈ ਕਿ `VStack` ਦੇ ਅੰਦਰਲੇ ਵਿਊਜ਼ ਖੱਬੇ ਪਾਸੇ aligned ਹੋਣ।

`spacing: 10` ਦਾ ਮਤਲਬ ਹੈ ਕਿ `VStack` ਦੇ ਅੰਦਰਲੇ ਵਿਊਜ਼ ਵਿਚਕਾਰ `10 pt` ਦੀ ਦੂਰੀ ਰੱਖੀ ਜਾਵੇ।

ਇਸ ਲਈ, ਕੋਰਸ ਸਿਰਲੇਖ ਅਤੇ ਕੋਰਸ ਵੇਰਵਾ ਖੱਬੇ ਪਾਸੇ ਤੋਂ ਲੱਗਣਗੇ, ਅਤੇ ਉਨ੍ਹਾਂ ਵਿਚਕਾਰ ਕੁਝ ਦੂਰੀ ਰਹੇਗੀ।

ਕੋਰਸ ਵੇਰਵਾ ਕਾਫ਼ੀ ਲੰਮਾ ਹੈ। ਜੇ ਸਾਰਾ ਦਿਖਾਇਆ ਜਾਵੇ, ਤਾਂ ਕਾਰਡ ਬਹੁਤ ਉੱਚਾ ਹੋ ਜਾਵੇਗਾ। ਇਸ ਲਈ ਇੱਥੇ `.lineLimit()` ਨਾਲ ਦਿਖਾਈ ਜਾਣ ਵਾਲੀਆਂ ਲਾਈਨਾਂ ਦੀ ਗਿਣਤੀ ਸੀਮਿਤ ਕੀਤੀ ਗਈ ਹੈ:

```swift
.lineLimit(3)
```

ਇਸ ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਵੱਧ ਤੋਂ ਵੱਧ `3` ਲਾਈਨਾਂ ਦਿਖਾਈਆਂ ਜਾਣਗੀਆਂ। ਜਦੋਂ ਸਮੱਗਰੀ ਇਸ ਸੀਮਾ ਤੋਂ ਵੱਧ ਹੋਵੇਗੀ, ਵਾਧੂ ਹਿੱਸਾ ਸੰਖੇਪ ਕਰ ਦਿੱਤਾ ਜਾਵੇਗਾ।

### ਵਿਊ ਨੂੰ ਖੱਬੇ ਪਾਸੇ aligned ਕਰਨਾ

ਇੱਥੇ ਇੱਕ ਹੋਰ ਗੱਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖਣੀ ਚਾਹੀਦੀ ਹੈ।

`VStack(alignment: .leading)` ਸਿਰਫ਼ `VStack` ਦੇ ਅੰਦਰਲੇ ਵਿਊਜ਼ ਦੀ alignment ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ। ਇਹ `VStack` ਆਪਣੇ ਆਪ ਨੂੰ ਬਾਹਰੀ container ਵਿੱਚ ਕਿੱਥੇ ਰੱਖਣਾ ਹੈ, ਇਹ ਸਿੱਧਾ ਕੰਟਰੋਲ ਨਹੀਂ ਕਰਦਾ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ ਕੋਰਸ ਵੇਰਵਾ ਛੋਟਾ ਹੋਵੇ:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI ਸ਼ੁਰੂਆਤੀ ਟਿਊਟੋਰਿਅਲ")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("ਸਿਰਫ਼ ਕੁਝ ਸਮੱਗਰੀ।")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view7.png)

ਤੁਸੀਂ ਵੇਖ ਸਕਦੇ ਹੋ ਕਿ ਕੋਰਸ ਸਿਰਲੇਖ ਅਤੇ ਕੋਰਸ ਵੇਰਵਾ ਭਾਵੇਂ `VStack` ਦੇ ਅੰਦਰ ਖੱਬੇ aligned ਹਨ, ਪਰ ਪੂਰਾ `VStack` ਕਾਰਡ ਦੇ ਸਭ ਤੋਂ ਖੱਬੇ ਪਾਸੇ ਨਹੀਂ ਲੱਗਿਆ।

ਇਸ ਦਾ ਕਾਰਨ ਇਹ ਹੈ ਕਿ ਜਦੋਂ ਸਮੱਗਰੀ ਛੋਟੀ ਹੁੰਦੀ ਹੈ, `VStack` ਦੀ ਚੌੜਾਈ ਵੀ ਕਾਫ਼ੀ ਘੱਟ ਹੁੰਦੀ ਹੈ। ਬਾਹਰੀ container layout ਕਰਦੇ ਸਮੇਂ ਇਸ ਤੰਗ `VStack` ਨੂੰ ਵਿਚਕਾਰ ਰੱਖ ਸਕਦਾ ਹੈ।

ਇਸ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹੋ: `VStack(alignment: .leading)` ਅੰਦਰਲੀ ਖੱਬੀ alignment ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।
ਪਰ ਇਹ ਪੂਰੇ ਸਮੱਗਰੀ ਖੇਤਰ ਨੂੰ ਸਭ ਤੋਂ ਖੱਬੇ ਪਾਸੇ ਧੱਕਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ।

ਜੇ ਤੁਸੀਂ ਚਾਹੁੰਦੇ ਹੋ ਕਿ ਪੂਰਾ ਸਮੱਗਰੀ ਖੇਤਰ ਸੱਚਮੁੱਚ ਖੱਬੇ ਪਾਸੇ ਲੱਗੇ, ਤਾਂ ਇਸ ਦੇ ਬਾਹਰ ਇੱਕ ਹੋਰ `HStack` ਲਪੇਟ ਸਕਦੇ ਹੋ ਅਤੇ `Spacer()` ਜੋੜ ਸਕਦੇ ਹੋ:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI ਸ਼ੁਰੂਆਤੀ ਟਿਊਟੋਰਿਅਲ")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("ਸਿਰਫ਼ ਕੁਝ ਸਮੱਗਰੀ।")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view8.png)

ਇੱਥੇ `HStack` ਇੱਕ horizontal layout ਹੈ।

`Spacer()` ਸੱਜੇ ਪਾਸੇ ਬਚੀ ਹੋਈ ਜਗ੍ਹਾ ਲੈ ਲਵੇਗਾ, ਅਤੇ ਇਸ ਤਰ੍ਹਾਂ ਖੱਬੇ ਪਾਸੇ ਵਾਲੇ `VStack` ਨੂੰ ਸਭ ਤੋਂ ਖੱਬੇ ਵੱਲ ਧੱਕੇਗਾ।

ਇਸ ਲਈ, `HStack + Spacer()` ਪੂਰੇ ਸਮੱਗਰੀ ਖੇਤਰ ਦੀ ਸਥਿਤੀ ਨੂੰ ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਅਸਲ ਕੋਰਸ ਕਾਰਡ ਵਿੱਚ, ਕੋਰਸ ਵੇਰਵਾ ਕਾਫ਼ੀ ਲੰਮਾ ਹੈ ਅਤੇ ਆਮ ਤੌਰ 'ਤੇ ਵਧੇਰੇ ਚੌੜਾਈ ਘੇਰਦਾ ਹੈ, ਇਸ ਲਈ ਇਹ ਸਮੱਸਿਆ ਲਾਜ਼ਮੀ ਤੌਰ 'ਤੇ ਸਪਸ਼ਟ ਨਹੀਂ ਹੋਵੇਗੀ। ਪਰ ਇਸ ਫਰਕ ਨੂੰ ਸਮਝਣਾ ਮਹੱਤਵਪੂਰਨ ਹੈ, ਕਿਉਂਕਿ ਬਾਅਦ ਵਿੱਚ ਛੋਟੇ ਟੈਕਸਟ layout ਬਣਾਉਂਦੇ ਸਮੇਂ ਅਕਸਰ ਇਸੇ ਤਰ੍ਹਾਂ ਦੀ ਸਥਿਤੀ ਆਉਂਦੀ ਹੈ।

### ਅੰਦਰਲੇ ਵਿਊਜ਼ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ ਕੰਟਰੋਲ ਕਰਨਾ

ਪਹਿਲਾਂ ਅਸੀਂ `VStack` ਵਿੱਚ `spacing: 10` ਲਿਖਿਆ ਸੀ:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` ਅੰਦਰਲੇ ਵਿਊਜ਼ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਜੇ `spacing` ਸੈੱਟ ਨਾ ਕੀਤਾ ਜਾਵੇ, ਤਾਂ `VStack` ਵਿੱਚ ਡਿਫਾਲਟ ਦੂਰੀ ਵੀ ਹੋਵੇਗੀ, ਪਰ ਉਹ ਡਿਫਾਲਟ ਦੂਰੀ ਲਾਜ਼ਮੀ ਤੌਰ 'ਤੇ ਸਾਡੇ ਚਾਹੇ ਪ੍ਰਭਾਵ ਵਰਗੀ ਨਹੀਂ ਹੁੰਦੀ।

ਇੱਥੇ, ਜੇ ਕੋਰਸ ਸਿਰਲੇਖ ਅਤੇ ਕੋਰਸ ਵੇਰਵਾ ਬਹੁਤ ਨੇੜੇ ਹੋਣ, ਤਾਂ ਭੀੜਭਾੜ ਵਾਲਾ ਮਹਿਸੂਸ ਹੋਵੇਗਾ। ਇਸ ਲਈ ਇਹ ਵਰਤਿਆ ਗਿਆ ਹੈ:

```swift
spacing: 10
```

ਇਸ ਨਾਲ ਉਨ੍ਹਾਂ ਵਿਚਕਾਰ ਥੋੜ੍ਹੀ ਜਗ੍ਹਾ ਰਹਿੰਦੀ ਹੈ।

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view9.png)

ਇਸੇ ਤਰ੍ਹਾਂ, ਉੱਪਰੀ ਖੇਤਰ ਅਤੇ ਸਮੱਗਰੀ ਖੇਤਰ ਵੀ ਉੱਪਰ-ਹੇਠਾਂ ਲੱਗਦੇ ਹਨ, ਇਸ ਲਈ ਉਨ੍ਹਾਂ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਵੀ `spacing` ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਹੁਣ `topView` ਅਤੇ `contentView` ਨੂੰ `body` ਵਿੱਚ ਰੱਖਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view10.png)

ਇੱਥੇ `VStack(spacing: 20)` `topView` ਅਤੇ `contentView` ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ।

ਅਰਥਾਤ:

```swift
VStack(alignment: .leading, spacing: 10)
```

ਕੋਰਸ ਸਿਰਲੇਖ ਅਤੇ ਕੋਰਸ ਵੇਰਵਾ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ।

```swift
VStack(spacing: 20)
```

ਉੱਪਰੀ ਖੇਤਰ ਅਤੇ ਸਮੱਗਰੀ ਖੇਤਰ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ।

ਦੋਵੇਂ `spacing` ਹਨ, ਪਰ ਇਹ ਵੱਖਰੇ `VStack` 'ਤੇ ਲਾਗੂ ਹੁੰਦੇ ਹਨ, ਇਸ ਲਈ ਪ੍ਰਭਾਵ ਦਾ ਦਾਇਰਾ ਵੀ ਵੱਖਰਾ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ, ਸਮੱਗਰੀ ਖੇਤਰ ਦਾ ਵਿਊ ਪੂਰਾ ਹੋ ਗਿਆ।

## ਬਟਨ ਖੇਤਰ

ਹੁਣ ਹੇਠਲਾ ਬਟਨ ਖੇਤਰ ਬਣਾਉਂਦੇ ਹਾਂ।

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view11.png)

ਬਟਨ ਖੇਤਰ ਮੁੱਖ ਤੌਰ 'ਤੇ ਇੱਕ play ਆਈਕਨ ਅਤੇ ਇੱਕ ਟੈਕਸਟ ਤੋਂ ਬਣਿਆ ਹੈ।

ਅਸੀਂ `Image` ਨਾਲ play ਆਈਕਨ ਦਿਖਾ ਸਕਦੇ ਹਾਂ, ਅਤੇ `Text` ਨਾਲ ਬਟਨ ਟੈਕਸਟ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

ਇੱਥੇ ਪਹਿਲਾਂ ਇੱਕ ਬਟਨ ਦਿੱਖ ਬਣਾਉਂਦੇ ਹਾਂ:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("ਬਟਨ ਕਲਿੱਕ ਹੋਇਆ")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰੋ")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view12.png)

ਇੱਥੇ ਦੋ `HStack` ਵਰਤੇ ਗਏ ਹਨ:

ਅੰਦਰਲਾ `HStack` ਆਈਕਨ ਅਤੇ ਟੈਕਸਟ ਨੂੰ ਹੋਰਿਜ਼ਾਂਟਲ ਤੌਰ 'ਤੇ ਲਗਾਉਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰੋ")
}
```

ਬਾਹਰਲਾ `HStack` `Spacer()` ਨਾਲ ਮਿਲ ਕੇ ਇਸ ਬਟਨ ਦੀ ਦਿੱਖ ਨੂੰ ਖੱਬੇ ਪਾਸੇ ਦਿਖਾਉਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ:

```swift
HStack {
    ...
    Spacer()
}
```

ਜਦੋਂ ਬਟਨ 'ਤੇ ਟੈਪ ਕੀਤਾ ਜਾਂਦਾ ਹੈ, console ਵਿੱਚ `ਬਟਨ ਕਲਿੱਕ ਹੋਇਆ` output ਹੋਵੇਗਾ।

## ਬੁਨਿਆਦੀ ਕਾਰਡ ਪੂਰਾ ਹੋਇਆ

ਹੁਣ ਉੱਪਰੀ ਖੇਤਰ, ਸਮੱਗਰੀ ਖੇਤਰ ਅਤੇ ਬਟਨ ਖੇਤਰ ਨੂੰ ਇਕੱਠੇ ਜੋੜਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view13.png)

ਇੱਥੇ ਤੱਕ, ਇੱਕ ਬੁਨਿਆਦੀ ਕੋਰਸ ਕਾਰਡ ਪੂਰਾ ਹੋ ਗਿਆ ਹੈ।

## Swift ਆਈਕਨ ਪਿਛੋਕੜ

ਅੰਤ ਵਿੱਚ, ਅਸੀਂ ਕਾਰਡ ਵਿੱਚ ਇੱਕ ਅਰਧ-ਪਾਰਦਰਸ਼ੀ Swift ਆਈਕਨ ਪਿਛੋਕੜ ਜੋੜਦੇ ਹਾਂ।

![view](../../../Resource/026_view.png)

ਪਹਿਲਾਂ ਅਸੀਂ `Color.indigo` ਨੂੰ ਪਿਛੋਕੜ ਰੰਗ ਵਜੋਂ ਵਰਤਿਆ ਸੀ। ਦਰਅਸਲ, `.background()` ਸਿਰਫ਼ ਰੰਗ ਹੀ ਨਹੀਂ, ਇੱਕ ਪੂਰਾ ਵਿਊ ਵੀ ਜੋੜ ਸਕਦਾ ਹੈ।

ਇਸ ਲਈ, ਅਸੀਂ ਪਹਿਲਾਂ ਇੱਕ ਖਾਸ ਪਿਛੋਕੜ ਵਿਊ ਬਣਾ ਸਕਦੇ ਹਾਂ:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

ਇਸ ਪਿਛੋਕੜ ਵਿਊ ਵਿੱਚ, ਅਸੀਂ `VStack`, `HStack` ਅਤੇ `Spacer()` ਵਰਤ ਕੇ Swift ਆਈਕਨ ਨੂੰ ਸੱਜੇ ਹੇਠਲੇ ਕੋਨੇ ਵੱਲ ਧੱਕਿਆ ਹੈ।

ਕਿਉਂਕਿ Swift ਆਈਕਨ ਸਿਰਫ਼ ਸਜਾਵਟੀ ਪਿਛੋਕੜ ਵਜੋਂ ਹੈ, ਇਸ ਲਈ ਇੱਥੇ ਅਰਧ-ਪਾਰਦਰਸ਼ੀ ਸਫੈਦ ਵਰਤਿਆ ਗਿਆ ਹੈ:

```swift
Color.white.opacity(0.15)
```

ਇਸ ਨਾਲ ਆਈਕਨ ਬਹੁਤ ਜ਼ਿਆਦਾ ਉਭਰ ਕੇ ਨਹੀਂ ਆਉਂਦਾ ਅਤੇ ਸਾਹਮਣੇ ਵਾਲੇ ਟੈਕਸਟ ਨੂੰ ਵੀ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦਾ।

ਫਿਰ `backgroundView` ਨੂੰ ਕਾਰਡ ਵਿੱਚ ਜੋੜੋ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ਲਾਗੂ ਹੋਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![view](../../../Resource/026_view14.png)

ਇੱਥੇ ਲਗਾਤਾਰ ਦੋ `.background()` ਵਰਤੇ ਗਏ ਹਨ:

```swift
.background(backgroundView)
.background(Color.indigo)
```

ਪਹਿਲਾ `.background()` Swift ਆਈਕਨ ਪਿਛੋਕੜ ਜੋੜਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।
ਦੂਜਾ `.background()` ਇੰਡਿਗੋ ਰੰਗ ਦਾ ਪਿਛੋਕੜ ਜੋੜਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ, Swift ਆਈਕਨ ਇੰਡਿਗੋ ਪਿਛੋਕੜ ਦੇ ਉੱਪਰ ਦਿਖਾਈ ਦੇਵੇਗਾ ਅਤੇ ਕਾਰਡ ਪਿਛੋਕੜ ਦੇ ਇੱਕ ਹਿੱਸੇ ਵਜੋਂ ਦਿਖੇਗਾ।

ਇਥੋਂ ਵੇਖਿਆ ਜਾ ਸਕਦਾ ਹੈ ਕਿ `.background()` ਸਿਰਫ਼ ਰੰਗ ਨਹੀਂ ਜੋੜ ਸਕਦਾ, ਸਗੋਂ custom ਵਿਊ ਵੀ ਜੋੜ ਸਕਦਾ ਹੈ। ਕਈ `.background()` ਇਕੱਠੇ ਵਰਤ ਕੇ ਹੋਰ ਵਧੀਆ ਪਿਛੋਕੜ ਪ੍ਰਭਾਵ ਬਣਾਏ ਜਾ ਸਕਦੇ ਹਨ।

ਇੱਥੇ ਤੱਕ, ਇੱਕ ਪੂਰਾ ਕੋਰਸ ਕਾਰਡ ਤਿਆਰ ਹੋ ਗਿਆ ਹੈ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ, ਇੱਕ ਕੋਰਸ ਕਾਰਡ ਰਾਹੀਂ SwiftUI ਦੀਆਂ ਆਮ ਬੁਨਿਆਦੀ layout ਵਿਧੀਆਂ ਦੀ ਦੁਹਰਾਈ ਕੀਤੀ ਗਈ।

ਅਸੀਂ `Text` ਨਾਲ ਟੈਕਸਟ ਦਿਖਾਇਆ, `Image` ਨਾਲ system icon ਦਿਖਾਇਆ, ਅਤੇ `VStack`, `HStack` ਅਤੇ `Spacer()` ਨਾਲ ਵਿਊਜ਼ ਦੀ ਲਗਾਵਟ ਕੰਟਰੋਲ ਕੀਤੀ।

ਅਸੀਂ `.lineLimit()` ਸਿੱਖਿਆ। ਇਹ ਟੈਕਸਟ ਦੀ ਵੱਧ ਤੋਂ ਵੱਧ ਦਿਖਾਈ ਜਾਣ ਵਾਲੀ ਲਾਈਨਾਂ ਦੀ ਗਿਣਤੀ ਸੀਮਿਤ ਕਰ ਸਕਦਾ ਹੈ। ਜਦੋਂ ਸਮੱਗਰੀ ਸੀਮਾ ਤੋਂ ਵੱਧ ਹੋਵੇ, ਤਾਂ ਵਾਧੂ ਹਿੱਸਾ ਸੰਖੇਪ ਕਰ ਦਿੱਤਾ ਜਾਂਦਾ ਹੈ।

ਇਸ ਦੇ ਨਾਲ, ਅਸੀਂ `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` ਆਦਿ ਆਮ modifiers ਵੀ ਦੁਹਰਾਏ।

ਇਹ ਪਾਠ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ ਕਈ ਛੋਟੇ ਵਿਊਜ਼ ਨੂੰ ਜੋੜ ਕੇ ਇੱਕ ਪੂਰਾ ਕਾਰਡ ਮੋਡੀਊਲ ਬਣਾਉਣ ਦੇ ਯੋਗ ਹੋ ਗਏ ਹਾਂ।

ਇਹ SwiftUI ਵਿਕਾਸ ਵਿੱਚ ਬਹੁਤ ਆਮ ਸੋਚ ਹੈ: ਪਹਿਲਾਂ ਛੋਟੇ ਵਿਊਜ਼ ਵੱਖ ਕਰੋ, ਫਿਰ ਉਨ੍ਹਾਂ ਨੂੰ ਜੋੜ ਕੇ ਪੂਰਾ ਇੰਟਰਫੇਸ ਬਣਾਓ।

## ਪੂਰਾ ਕੋਡ

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("ਸ਼ੁਰੂਆਤੀ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ ਪਾਠ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI ਸ਼ੁਰੂਆਤੀ ਟਿਊਟੋਰਿਅਲ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("ਜ਼ੀਰੋ ਤੋਂ SwiftUI ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ Apple ਦੇ declarative UI development ਨੂੰ ਪ੍ਰਣਾਲੀਬੱਧ ਢੰਗ ਨਾਲ ਸਿੱਖੋ। ਸਪਸ਼ਟ ਵਿਆਖਿਆਵਾਂ ਅਤੇ ਅਮਲੀ ਉਦਾਹਰਣਾਂ ਰਾਹੀਂ, ਤੁਸੀਂ ਹੌਲੀ-ਹੌਲੀ layout, interaction ਅਤੇ state management ਵਿੱਚ ਦੱਖਲ ਹਾਸਲ ਕਰੋਗੇ, ਤਾਂ ਜੋ ਸੁੰਦਰ ਅਤੇ ਲਾਭਦਾਇਕ app interfaces ਬਣਾਏ ਜਾ ਸਕਣ।")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("ਬਟਨ ਕਲਿੱਕ ਹੋਇਆ")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰੋ")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
