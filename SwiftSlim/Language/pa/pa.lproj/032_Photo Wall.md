# ਫੋਟੋ ਗੈਲਰੀ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ ਫੋਟੋ ਗੈਲਰੀ ਪੇਜ ਬਣਾਵਾਂਗੇ।

![view](../../../Resource/032_view13.png)

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, ਅਸੀਂ `extension`, `self` ਅਤੇ instance ਨਾਲ ਸੰਬੰਧਿਤ ਗਿਆਨ ਦੀ ਦੁਹਰਾਈ ਕਰਾਂਗੇ, ਅਤੇ SwiftUI ਵਿੱਚ ਆਮ ਤੌਰ ਤੇ ਵਰਤੇ ਜਾਣ ਵਾਲੇ `Shape` ਗ੍ਰਾਫਿਕਸ ਬਾਰੇ ਸਿੱਖਾਂਗੇ।

ਇਨ੍ਹਾਂ ਗਿਆਨਾਂ ਰਾਹੀਂ, ਅਸੀਂ ਆਮ ਤਸਵੀਰਾਂ ਨੂੰ ਗੋਲ, ਗੋਲ ਕੋਨੇ ਵਾਲੇ ਆਇਤ, ਕੈਪਸੂਲ ਅਤੇ ਅੰਡਾਕਾਰ ਵਰਗੀਆਂ ਵੱਖ-ਵੱਖ ਸ਼ੈਲੀਆਂ ਵਿੱਚ ਕੱਟ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਫੋਟੋਆਂ ਵਿੱਚ ਬਾਰਡਰ ਪ੍ਰਭਾਵ ਜੋੜ ਸਕਦੇ ਹਾਂ।

ਇਸ ਪਾਠ ਵਿੱਚ ਕੁਝ ਨਵੇਂ ਗਿਆਨ ਬਿੰਦੂ ਵਰਤੇ ਜਾਣਗੇ: `Shape`, `clipShape`, `strokeBorder` ਅਤੇ `overlay`।

ਇਨ੍ਹਾਂ ਵਿੱਚੋਂ, `clipShape` view ਦੀ ਸ਼ਕਲ ਕੱਟਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ, `strokeBorder` shape ਦਾ border ਬਣਾਉਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ `overlay` ਮੌਜੂਦਾ view ਦੇ ਉੱਪਰ ਨਵਾਂ view ਚੜ੍ਹਾਉਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

## ਚਿੱਤਰ ਸਮੱਗਰੀ

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਸਾਨੂੰ ਕੁਝ ਤਸਵੀਰਾਂ ਤਿਆਰ ਕਰਨੀ ਪੈਣਗੀਆਂ।

ਤੁਸੀਂ ਆਪਣੀਆਂ ਫੋਟੋਆਂ ਵਰਤ ਸਕਦੇ ਹੋ, ਜਾਂ ਇਸ ਪਾਠ ਵਿੱਚ ਦਿੱਤੀਆਂ ਉਦਾਹਰਨ ਤਸਵੀਰਾਂ ਵਰਤ ਸਕਦੇ ਹੋ।

ਇਸ ਪਾਠ ਦੀਆਂ ਉਦਾਹਰਨ ਫੋਟੋਆਂ [Pixabay](https://pixabay.com/) ਵੈੱਬਸਾਈਟ ਤੋਂ ਆਈਆਂ ਹਨ:

[ਦ੍ਰਿਸ਼](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [ਲੋਮੜੀ](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [ਇਮਾਰਤ](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [ਫੁੱਲ](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [ਹੰਸ](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

ਤਸਵੀਰਾਂ ਡਾਊਨਲੋਡ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਉਨ੍ਹਾਂ ਨੂੰ `Assets` resource folder ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ, ਅਤੇ ਕ੍ਰਮਵਾਰ `1`, `2`, `3`, `4`, `5` ਨਾਮ ਦਿਓ।

![assets](../../../Resource/032_view17.png)

ਇਸ ਤਰ੍ਹਾਂ, ਅਸੀਂ SwiftUI ਵਿੱਚ `Image("1")`, `Image("2")` ਵਰਗੇ ਤਰੀਕੇ ਨਾਲ ਤਸਵੀਰਾਂ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

## ਫੋਟੋਆਂ ਦਿਖਾਉਣਾ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ `ContentView` ਵਿੱਚ 5 ਫੋਟੋਆਂ ਦਿਖਾਉਂਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ਦਿਖਾਵੇ ਦਾ ਨਤੀਜਾ:

![view](../../../Resource/032_view.png)

ਇਸ ਕੋਡ ਵਿੱਚ, ਅਸੀਂ `ScrollView` ਵਰਤ ਕੇ ਫੋਟੋ ਲਿਸਟ ਨੂੰ ਸਕ੍ਰੋਲ ਕਰਨ ਯੋਗ ਬਣਾਉਂਦੇ ਹਾਂ, ਅਤੇ `VStack` ਵਰਤ ਕੇ ਕਈ ਤਸਵੀਰਾਂ ਨੂੰ ਉੱਪਰ ਤੋਂ ਹੇਠਾਂ ਲਗਾਉਂਦੇ ਹਾਂ।

ਹਰ ਤਸਵੀਰ `.resizable()`, `.scaledToFit()` ਅਤੇ `.frame(width: 300)` ਰਾਹੀਂ ਆਪਣਾ display effect ਸੈੱਟ ਕਰਦੀ ਹੈ, ਤਾਂ ਜੋ ਤਸਵੀਰ scale ਹੋ ਸਕੇ, ਆਪਣਾ ਅਨੁਪਾਤ ਪੂਰਾ ਰੱਖ ਸਕੇ, ਅਤੇ ਉਸ ਦੀ ਚੌੜਾਈ ਸੀਮਿਤ ਰਹੇ।

`VStack` ਉੱਤੇ `.padding(.vertical, 100)` ਉੱਪਰ ਅਤੇ ਹੇਠਾਂ ਦੀ ਖਾਲੀ ਜਗ੍ਹਾ ਵਧਾਉਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਜੋ ਪਹਿਲੀ ਅਤੇ ਆਖਰੀ ਫੋਟੋ ਸਕ੍ਰੀਨ ਦੇ ਕਿਨਾਰਿਆਂ ਨਾਲ ਬਹੁਤ ਜ਼ਿਆਦਾ ਨਾ ਲੱਗੇ।

ਅੰਤ ਵਾਲਾ `.ignoresSafeArea()` ਇਸ ਗੱਲ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ scroll view safe area ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਕਰੇ, ਤਾਂ ਜੋ ਫੋਟੋਆਂ ਸਕ੍ਰੋਲ ਕਰਦੇ ਸਮੇਂ ਸਕ੍ਰੀਨ ਦੇ ਉੱਪਰਲੇ ਅਤੇ ਹੇਠਲੇ ਹਿੱਸੇ ਤੱਕ ਫੈਲ ਸਕਣ, ਅਤੇ ਪੇਜ ਹੋਰ ਪੂਰਾ ਦਿਖੇ।

ਪਰ ਹੁਣ 5 ਤਸਵੀਰਾਂ ਇੱਕੋ ਜਿਹੇ modifiers ਵਰਤ ਰਹੀਆਂ ਹਨ:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

ਜਦੋਂ ਅਸੀਂ ਦੁਹਰਾਇਆ ਹੋਇਆ ਕੋਡ ਵੇਖਦੇ ਹਾਂ, ਤਾਂ ਅਸੀਂ ਇਸਨੂੰ ਵਿਉਂਤਬੱਧ ਕਰਨ ਲਈ `extension` ਵਰਤਣ ਬਾਰੇ ਸੋਚ ਸਕਦੇ ਹਾਂ।

## extension ਵਰਤ ਕੇ ਤਸਵੀਰ ਸ਼ੈਲੀ ਵਿਉਂਤਬੱਧ ਕਰਨਾ

ਅਸੀਂ `Image` ਲਈ ਇੱਕ photo gallery ਲਈ ਖਾਸ method extend ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ਇੱਥੇ, ਅਸੀਂ `Image` type ਲਈ ਇੱਕ `photoGalleryStyle` method ਵਧਾਇਆ ਹੈ।

ਇਸ method ਦੇ ਅੰਦਰ ਪਹਿਲਾਂ ਦੁਹਰਾਏ ਗਏ `.resizable()`, `.scaledToFit()` ਅਤੇ `.frame(width: 300)` ਸ਼ਾਮਲ ਹਨ। ਅਰਥਾਤ, ਇਹ ਤਸਵੀਰ scale ਕਰਨ, proportion ਨਾਲ ਦਿਖਾਉਣ ਅਤੇ width ਸੈੱਟ ਕਰਨ ਵਾਲੇ ਕੋਡ ਨੂੰ ਇਕੱਠਾ ਵਿਉਂਤਬੱਧ ਕਰਦਾ ਹੈ।

ਇਸ extension ਵਰਤਣ ਤੋਂ ਬਾਅਦ, ਮੂਲ ਤਸਵੀਰ ਕੋਡ:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

ਇਸ ਤਰ੍ਹਾਂ ਸਰਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Image("1")
    .photoGalleryStyle()
```

ਇਸ ਤਰ੍ਹਾਂ, ਹਰ ਤਸਵੀਰ ਨੂੰ ਸਿਰਫ਼ `.photoGalleryStyle()` call ਕਰਨਾ ਪਵੇਗਾ, ਅਤੇ ਉਹੋ ਜਿਹੀ photo gallery style ਲਾਗੂ ਹੋ ਜਾਵੇਗੀ। ਕੋਡ ਹੋਰ ਸਾਫ਼ ਹੋਵੇਗਾ, ਅਤੇ ਬਾਅਦ ਵਿੱਚ ਇਕੱਠੇ ਤਰੀਕੇ ਨਾਲ ਸੋਧਣਾ ਵੀ ਆਸਾਨ ਹੋਵੇਗਾ।

## self ਨੂੰ ਸਮਝਣਾ

extension method ਵਿੱਚ, ਅਸੀਂ `self` ਲਿਖਿਆ ਹੈ:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ਇੱਥੇ `self` ਉਸ ਮੌਜੂਦਾ image instance ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ ਜੋ ਇਹ method call ਕਰ ਰਿਹਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Image("1")
    .photoGalleryStyle()
```

ਇਸ ਕੋਡ ਵਿੱਚ, `photoGalleryStyle()` ਨੂੰ `Image("1")` ਨੇ call ਕੀਤਾ ਹੈ, ਇਸ ਲਈ method ਦੇ ਅੰਦਰ `self` ਇਸ `Image("1")` ਤਸਵੀਰ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਸਰਲ ਤੌਰ ਤੇ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: ਜੋ ਵੀ ਇਹ method call ਕਰਦਾ ਹੈ, `self` ਉਸੇ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਧਿਆਨ ਦੇਣ ਦੀ ਲੋੜ ਹੈ ਕਿ SwiftUI ਦੇ modifiers ਲਗਾਤਾਰ ਨਵੇਂ view results ਵਾਪਸ ਕਰਦੇ ਹਨ। ਇਸ ਲਈ, `photoGalleryStyle()` ਇੱਕ modified view ਵਾਪਸ ਕਰਦਾ ਹੈ, ਨਾ ਕਿ ਸਿਰਫ਼ ਮੂਲ `Image` ਨੂੰ ਹੀ ਵਾਪਸ ਕਰਦਾ ਹੈ।

## ਫੋਟੋ ਸ਼ਕਲਾਂ

ਹੁਣ, ਫੋਟੋਆਂ ਆਮ ਤੌਰ ਤੇ ਦਿਖ ਸਕਦੀਆਂ ਹਨ। ਪਰ ਇਹ ਫੋਟੋਆਂ default ਰੂਪ ਵਿੱਚ ਆਇਤਾਕਾਰ ਹੁੰਦੀਆਂ ਹਨ, ਇਸ ਲਈ ਇਹ ਕੁਝ ਆਮ ਜਿਹੀਆਂ ਲੱਗਦੀਆਂ ਹਨ।

ਜੇ ਤੁਸੀਂ ਸਿਰਫ਼ ਫੋਟੋਆਂ ਨੂੰ ਗੋਲ ਕੋਨੇ ਦੇਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ ਸਿੱਧਾ `.cornerRadius()` ਵਰਤ ਸਕਦੇ ਹੋ:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

ਦਿਖਾਵੇ ਦਾ ਨਤੀਜਾ:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਤਸਵੀਰ ਨੂੰ `20 pt` ਦਾ corner radius ਦਿੱਤਾ ਗਿਆ ਹੈ। ਆਮ rounded-corner ਤਸਵੀਰਾਂ ਲਈ, ਇਹ ਲਿਖਤ ਪਹਿਲਾਂ ਹੀ ਕਾਫ਼ੀ ਹੈ।

ਪਰ `.cornerRadius()` ਸਿਰਫ਼ rounded-corner effect ਸੰਭਾਲ ਸਕਦਾ ਹੈ, ਅਤੇ ਆਮ ਗੋਲ ਕੋਨਿਆਂ ਵਾਲੀਆਂ ਤਸਵੀਰਾਂ ਬਣਾਉਣ ਲਈ ਠੀਕ ਹੈ। ਜੇ ਅਸੀਂ ਫੋਟੋਆਂ ਨੂੰ ਹੋਰ ਵੱਖ-ਵੱਖ ਸ਼ਕਲਾਂ ਵਿੱਚ ਬਦਲਣਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਸਿਰਫ਼ ਇਹ modifier ਕਾਫ਼ੀ ਨਹੀਂ।

ਇਸ ਵੇਲੇ, SwiftUI ਵਿੱਚ `Shape` ਵਰਤਣ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ। `Shape` ਵੱਖ-ਵੱਖ graphics ਦਰਸਾ ਸਕਦਾ ਹੈ, ਅਤੇ `clipShape` ਨਾਲ ਮਿਲ ਕੇ ਤਸਵੀਰ ਨੂੰ ਉਸਦੇ ਅਨੁਕੂਲ shape ਵਿੱਚ ਕੱਟ ਸਕਦਾ ਹੈ।

## Shape ਨੂੰ ਜਾਣਨਾ

SwiftUI ਵਿੱਚ, `Shape` graphic ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ `View` ਵਾਂਗ ਹੀ SwiftUI ਵਿੱਚ ਬਹੁਤ ਆਮ ਤੌਰ ਤੇ ਵਰਤਿਆ ਜਾਣ ਵਾਲਾ type ਹੈ।

ਆਮ `Shape` ਵਿੱਚ circle, rectangle, rounded rectangle, capsule ਅਤੇ ellipse ਸ਼ਾਮਲ ਹਨ। ਵੱਖ-ਵੱਖ graphics ਦੀ ਦਿੱਖ ਹੋਰ ਸਿੱਧੇ ਤੌਰ ਤੇ ਵੇਖਣ ਲਈ, ਹੇਠਾਂ ਦੀਆਂ ਉਦਾਹਰਨਾਂ ਹਰ graphic ਲਈ ਵੱਖਰੇ ਰੰਗ ਅਤੇ ਆਕਾਰ ਸੈੱਟ ਕਰਦੀਆਂ ਹਨ।

ਇਨ੍ਹਾਂ ਉਦਾਹਰਨਾਂ ਵਿੱਚ, `.fill()` graphic ਵਿੱਚ ਰੰਗ ਭਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ `.frame()` graphic ਦਾ display size ਸੈੱਟ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। ਰੰਗ ਸਿਰਫ਼ ਵੱਖ-ਵੱਖ graphics ਨੂੰ ਅਲੱਗ ਦਿਖਾਉਣ ਲਈ ਹਨ, ਇਹ graphic ਦੇ ਆਪਣੇ fixed colors ਨਹੀਂ ਹਨ।

### Circle ਗੋਲ

`Circle` ਗੋਲ shape ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ ਅਕਸਰ avatar, circular button, circular image ਆਦਿ interface effects ਵਿੱਚ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle ਆਇਤ

`Rectangle` ਆਇਤ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ ਸਭ ਤੋਂ ਬੁਨਿਆਦੀ graphics ਵਿੱਚੋਂ ਇੱਕ ਹੈ, ਅਤੇ background, divided area ਜਾਂ ਆਮ border ਬਣਾਉਣ ਲਈ ਵੀ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle ਗੋਲ ਕੋਨੇ ਵਾਲਾ ਆਇਤ

`RoundedRectangle` ਗੋਲ ਕੋਨਿਆਂ ਵਾਲੇ ਆਇਤ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। `cornerRadius` corner radius ਦਾ ਆਕਾਰ ਸੈੱਟ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule ਕੈਪਸੂਲ ਆਕਾਰ

`Capsule` ਕੈਪਸੂਲ shape ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਸ ਦੇ ਦੋਵੇਂ ਸਿਰੇ arcs ਹੁੰਦੇ ਹਨ, ਅਤੇ ਇਹ ਅਕਸਰ capsule buttons, tag backgrounds ਆਦਿ interface effects ਵਿੱਚ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ਅੰਡਾਕਾਰ

`Ellipse` ਅੰਡਾਕਾਰ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ `Circle` ਵਰਗਾ ਹੈ, ਪਰ ਜਦੋਂ width ਅਤੇ height ਵੱਖਰੇ ਹੁੰਦੇ ਹਨ, ਤਾਂ ਇਹ ellipse ਵਾਂਗ ਦਿਖਦਾ ਹੈ।

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

ਇਨ੍ਹਾਂ ਉਦਾਹਰਨਾਂ ਰਾਹੀਂ ਅਸੀਂ ਵੇਖ ਸਕਦੇ ਹਾਂ ਕਿ `Shape` ਆਪਣੇ ਆਪ ਸਿੱਧਾ graphic ਵਜੋਂ ਦਿਖਾਇਆ ਜਾ ਸਕਦਾ ਹੈ। ਅੱਗੇ, ਅਸੀਂ ਇਹਨਾਂ `Shape` ਨੂੰ `clipShape` ਨਾਲ ਮਿਲਾ ਕੇ ਫੋਟੋਆਂ ਕੱਟਾਂਗੇ, ਤਾਂ ਜੋ ਫੋਟੋਆਂ ਵੱਖ-ਵੱਖ ਸ਼ਕਲਾਂ ਵਿੱਚ ਦਿਖਣ।

## clipShape ਵਰਤ ਕੇ ਫੋਟੋਆਂ ਕੱਟਣਾ

ਹੁਣ, ਅਸੀਂ `clipShape` ਵਰਤ ਕੇ ਫੋਟੋਆਂ ਨੂੰ ਵੱਖ-ਵੱਖ ਸ਼ਕਲਾਂ ਵਿੱਚ ਕੱਟ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ, ਪਹਿਲੀ ਫੋਟੋ ਨੂੰ ਗੋਲ shape ਵਿੱਚ ਕੱਟਣਾ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

ਇਸ ਕੋਡ ਦਾ ਮਤਲਬ ਹੈ: ਪਹਿਲਾਂ ਇੱਕ ਤਸਵੀਰ ਦਿਖਾਉਣਾ, ਫਿਰ `Circle()` ਵਰਤ ਕੇ ਇਸਨੂੰ ਗੋਲ shape ਵਿੱਚ ਕੱਟਣਾ।

![view](../../../Resource/032_view2.png)

`clipShape` ਦੀ basic syntax ਇਹ ਹੈ:

```swift
.clipShape(shape)
```

view ਦੇ ਪਿੱਛੇ `.clipShape(...)` ਜੋੜੋ, ਅਤੇ parentheses ਵਿੱਚ ਉਹ graphic ਭਰੋ ਜਿਸ shape ਵਿੱਚ ਕੱਟਣਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

ਹੁਣ, ਅਸੀਂ 5 ਫੋਟੋਆਂ ਨੂੰ ਵੱਖ-ਵੱਖ shapes ਵਿੱਚ ਕੱਟਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ਦਿਖਾਵੇ ਦਾ ਨਤੀਜਾ:

![view](../../../Resource/032_view8.png)

ਇਨ੍ਹਾਂ ਵਿੱਚੋਂ, `Rectangle()` ਨਾਲ ਕੱਟਣ ਤੋਂ ਬਾਅਦ effect ਆਮ ਆਇਤਾਕਾਰ ਫੋਟੋ ਦੇ ਨੇੜੇ ਹੁੰਦਾ ਹੈ, ਇਸ ਲਈ visual change ਸਪਸ਼ਟ ਨਹੀਂ ਹੁੰਦਾ। ਇਹ ਮੁੱਖ ਤੌਰ ਤੇ ਹੋਰ shapes ਨਾਲ ਤੁਲਨਾ ਲਈ ਵਰਤਿਆ ਗਿਆ ਹੈ।

ਹੁਣ, ਫੋਟੋਆਂ ਸਿਰਫ਼ ਆਮ ਆਇਤਾਂ ਨਹੀਂ ਰਹੀਆਂ, ਸਗੋਂ ਉਨ੍ਹਾਂ ਕੋਲ ਵੱਖ-ਵੱਖ shapes ਹਨ।

## ਫੋਟੋ border ਜੋੜਨਾ

ਜੇ ਅਸੀਂ ਗੋਲ ਫੋਟੋ ਵਿੱਚ border ਜੋੜਣਾ ਚਾਹੀਏ, ਤਾਂ ਸ਼ਾਇਦ ਅਸੀਂ `border` ਵਰਤਣ ਬਾਰੇ ਸੋਚੀਏ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

ਪਰ ਇਸ ਤਰ੍ਹਾਂ ਆਮ ਤੌਰ ਤੇ circular border ਨਹੀਂ ਮਿਲਦਾ, ਸਗੋਂ ਇੱਕ rectangular border ਮਿਲਦਾ ਹੈ।

![view](../../../Resource/032_view9.png)

ਇਹ ਇਸ ਲਈ ਹੈ ਕਿਉਂਕਿ `border` view ਦੇ rectangular area ਦੇ ਅਧਾਰ ਤੇ border ਜੋੜਦਾ ਹੈ, ਨਾ ਕਿ `clipShape` ਨਾਲ ਕੱਟੀ ਹੋਈ shape ਦੇ ਅਧਾਰ ਤੇ।

ਇਸ ਲਈ, ਜੇ ਅਸੀਂ circular border ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਸਿੱਧਾ `border` ਨਹੀਂ ਵਰਤ ਸਕਦੇ।

## strokeBorder ਵਰਤ ਕੇ shape border ਬਣਾਉਣਾ

SwiftUI ਵਿੱਚ, `strokeBorder` ਇਹਨਾਂ ਆਮ `Shape` ਲਈ inner border ਬਣਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਇੱਕ circular border ਬਣਾਉਣਾ:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

ਇਸ ਕੋਡ ਦਾ ਮਤਲਬ ਹੈ: `Circle` ਲਈ brown border ਬਣਾਉਣਾ, ਅਤੇ border width `10 pt` ਹੈ।

![view](../../../Resource/032_view12.png)

ਇੱਥੇ ਧਿਆਨ ਦੇਣ ਦੀ ਲੋੜ ਹੈ ਕਿ `strokeBorder` ਸਿੱਧਾ ਫੋਟੋ ਨੂੰ border ਨਹੀਂ ਜੋੜਦਾ, ਸਗੋਂ `Circle()` ਇਸ graphic ਲਈ border ਬਣਾਉਂਦਾ ਹੈ।

ਅਰਥਾਤ, ਇਸ ਕੋਡ ਨਾਲ ਸਿਰਫ਼ ਇੱਕ independent circular border ਮਿਲਦਾ ਹੈ, ਇਸਦਾ ਫੋਟੋ ਨਾਲ ਹਾਲੇ ਕੋਈ ਸੰਬੰਧ ਨਹੀਂ।

ਜੇ ਅਸੀਂ ਇਸ circular border ਨੂੰ ਫੋਟੋ ਦੇ ਉੱਪਰ ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ `overlay` ਵਰਤਣਾ ਜਾਰੀ ਰੱਖਣਾ ਪਵੇਗਾ, ਅਤੇ border ਨੂੰ ਫੋਟੋ ਦੇ ਉੱਪਰ overlay ਕਰਨਾ ਪਵੇਗਾ।

## overlay ਵਰਤ ਕੇ border ਚੜ੍ਹਾਉਣਾ

`overlay` ਇੱਕ view modifier ਹੈ, ਜੋ ਮੌਜੂਦਾ view ਦੇ ਉੱਪਰ ਨਵਾਂ view ਚੜ੍ਹਾ ਸਕਦਾ ਹੈ।

ਇਸ ਦੀ basic structure ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Current view
    .overlay {
        Overlay view
    }
```

ਇਸ case ਵਿੱਚ, current view ਉਹ ਫੋਟੋ ਹੈ ਜੋ ਪਹਿਲਾਂ ਹੀ ਗੋਲ shape ਵਿੱਚ ਕੱਟੀ ਗਈ ਹੈ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

ਅਸੀਂ ਜਿਸ ਨਵੇਂ view ਨੂੰ overlay ਕਰਨਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਉਹ ਇੱਕ circular border ਹੈ:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

ਇਸ ਲਈ, ਫੋਟੋ ਅਤੇ border ਨੂੰ ਇਕੱਠੇ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

ਇੱਥੇ `overlay` ਦਾ ਮਤਲਬ ਹੈ current view ਦੇ ਉੱਪਰ ਇੱਕ ਨਵਾਂ view ਚੜ੍ਹਾਉਣਾ।

`overlay` ਵਿੱਚ, border ਮੌਜੂਦਾ ਫੋਟੋ ਦੇ display area ਨੂੰ follow ਕਰਦਿਆਂ overlay ਹੁੰਦਾ ਹੈ, ਇਸ ਲਈ ਵੱਖਰੇ ਤੌਰ ਤੇ `frame` ਸੈੱਟ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ। ਜਦੋਂ ਤੱਕ border shape ਅਤੇ clipping shape ਇੱਕੋ ਜਿਹੇ ਹਨ, border ਫੋਟੋ ਨਾਲ ਠੀਕ ਫਿੱਟ ਹੋ ਸਕਦਾ ਹੈ।

![view](../../../Resource/032_view10.png)

ਅੰਤਿਮ effect ਇਹ ਹੈ ਕਿ circular photo ਦੇ ਉੱਪਰ ਇੱਕ circular border ਢੱਕਿਆ ਗਿਆ ਹੈ।

`ZStack` ਨਾਲ ਤੁਲਨਾ ਕਰਨ ਤੇ, `overlay` ਇਸ ਤਰ੍ਹਾਂ ਦੇ “current view ਵਿੱਚ decoration ਜੋੜਣ” ਵਾਲੇ scenario ਲਈ ਹੋਰ ਉਚਿਤ ਹੈ। ਫੋਟੋ main subject ਹੈ, border ਸਿਰਫ਼ additional effect ਹੈ, ਇਸ ਲਈ `overlay` ਵਰਤਣਾ ਹੋਰ ਸਪਸ਼ਟ ਹੈ।

## ਫੋਟੋ ਗੈਲਰੀ ਪੂਰੀ ਕਰਨਾ

ਹੁਣ, ਅਸੀਂ ਹਰ ਫੋਟੋ ਵਿੱਚ ਉਸਦੇ ਅਨੁਕੂਲ shape ਅਤੇ border ਜੋੜਦੇ ਹਾਂ:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ਦਿਖਾਵੇ ਦਾ ਨਤੀਜਾ:

![view](../../../Resource/032_view13.png)

ਇਸ ਤਰ੍ਹਾਂ, ਇੱਕ basic photo gallery page ਪੂਰਾ ਹੋ ਗਿਆ ਹੈ।

ਇਸ ਪੇਜ ਵਿੱਚ, ਅਸੀਂ `ScrollView` ਰਾਹੀਂ scrollable display ਬਣਾਇਆ, `Image` ਰਾਹੀਂ ਫੋਟੋਆਂ ਦਿਖਾਈਆਂ, `clipShape` ਰਾਹੀਂ ਫੋਟੋ shapes ਕੱਟੀਆਂ, ਅਤੇ `overlay` ਤੇ `strokeBorder` ਰਾਹੀਂ borders ਜੋੜੇ।

## ਪੂਰਾ ਕੋਡ

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ photo gallery page ਪੂਰਾ ਕੀਤਾ।

![view](../../../Resource/032_view13.png)

ਇਸ example ਵਿੱਚ, ਅਸੀਂ ਪਹਿਲਾਂ `Image` ਵਰਤ ਕੇ ਫੋਟੋਆਂ ਦਿਖਾਈਆਂ, ਫਿਰ `extension` ਰਾਹੀਂ `Image` ਲਈ ਇੱਕ `photoGalleryStyle` method ਵਧਾਇਆ, ਤਾਂ ਜੋ ਦੁਹਰਾਏ ਹੋਏ image style code ਨੂੰ ਵਿਉਂਤਬੱਧ ਕੀਤਾ ਜਾ ਸਕੇ।

ਇਸ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ SwiftUI ਵਿੱਚ ਆਮ `Shape` ਸਿੱਖੇ, ਜਿਵੇਂ `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` ਅਤੇ `Ellipse`। ਇਹ graphics ਨਾ ਸਿਰਫ਼ ਸਿੱਧੇ ਦਿਖਾਏ ਜਾ ਸਕਦੇ ਹਨ, ਸਗੋਂ `clipShape` ਨਾਲ ਮਿਲ ਕੇ view ਕੱਟਣ ਲਈ ਵੀ ਵਰਤੇ ਜਾ ਸਕਦੇ ਹਨ।

ਉਦਾਹਰਨ ਲਈ:

```swift
.clipShape(Circle())
```

ਇਸਦਾ ਮਤਲਬ ਹੈ view ਨੂੰ ਗੋਲ shape ਵਿੱਚ ਕੱਟਣਾ।

ਅੰਤ ਵਿੱਚ, ਅਸੀਂ `overlay` ਅਤੇ `strokeBorder` ਵਰਤ ਕੇ ਫੋਟੋਆਂ ਲਈ ਉਨ੍ਹਾਂ ਦੇ ਅਨੁਕੂਲ shape borders ਜੋੜੇ। ਧਿਆਨ ਦੇਣ ਦੀ ਲੋੜ ਹੈ ਕਿ `border` ਆਮ ਤੌਰ ਤੇ view ਦੇ rectangular area ਦੇ ਅਨੁਸਾਰ border ਬਣਾਉਂਦਾ ਹੈ। ਜੇ ਤੁਸੀਂ ਚਾਹੁੰਦੇ ਹੋ ਕਿ border circle, capsule ਜਾਂ ellipse ਦੇ ਨਾਲ follow ਕਰੇ, ਤਾਂ ਉਸੇ `Shape` ਨੂੰ overlay ਕਰਨਾ ਹੋਰ ਉਚਿਤ ਹੈ।

ਇਸ ਪਾਠ ਰਾਹੀਂ, ਅਸੀਂ ਸਿਰਫ਼ photo gallery effect ਹੀ ਪੂਰਾ ਨਹੀਂ ਕੀਤਾ, ਸਗੋਂ interface ਵਿੱਚ `Shape`, `clipShape`, `strokeBorder` ਅਤੇ `overlay` ਦੀ ਆਮ combination method ਵੀ ਸਮਝੀ।

## ਕਲਾਸ ਤੋਂ ਬਾਅਦ ਦੀ ਕਸਰਤ

### 1、ਫੋਟੋ ਗੈਲਰੀ background ਜੋੜੋ

photo gallery page ਵਿੱਚ ਇੱਕ full-screen background image ਜੋੜੋ।

ਲੋੜ: background image ਪੂਰੀ screen ਨੂੰ cover ਕਰੇ ਅਤੇ safe area ਨੂੰ ignore ਕਰੇ।

### 2、gradient border

ਮੌਜੂਦਾ single-color borders ਨੂੰ linear gradient borders ਵਿੱਚ ਬਦਲੋ।

ਤੁਸੀਂ `LinearGradient` ਵਰਤ ਕੇ ਹੋਰ rich border effects ਬਣਾਉਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰ ਸਕਦੇ ਹੋ।

### 3、ਨਕਲੀ photo frame

ਇੰਟਰਨੈੱਟ ਉੱਤੇ ਕੁਝ real photo frame styles ਖੋਜੋ, ਅਤੇ `overlay` ਵਰਤ ਕੇ image frame overlay ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ, ਤਾਂ ਜੋ ਫੋਟੋਆਂ real picture frames ਦੇ ਹੋਰ ਨੇੜੇ ਲੱਗਣ।

ਕਸਰਤ ਦਾ display result:

![button](../../../Resource/032_view15.jpeg)

### 4、rounded button border ਬਣਾਉਣਾ

ਅਸਲ development ਵਿੱਚ, buttons ਅਕਸਰ rounded rectangle borders ਵਰਤਦੇ ਹਨ।

ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ rounded button ਬਣਾਉਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ, ਅਤੇ `RoundedRectangle` ਤੇ `strokeBorder` ਵਰਤ ਕੇ button ਵਿੱਚ rounded border ਜੋੜੋ।

ਕਸਰਤ ਦਾ display result:

![button](../../../Resource/032_view14.png)

### ਸੋਚਣ ਵਾਲਾ ਪ੍ਰਸ਼ਨ

ਜੇ ਤੁਸੀਂ single-color border ਨਹੀਂ ਵਰਤਣਾ ਚਾਹੁੰਦੇ, ਅਤੇ gradient border ਵੀ ਨਹੀਂ ਵਰਤਣਾ ਚਾਹੁੰਦੇ, ਸਗੋਂ border ਵਿੱਚ ਕਿਸੇ pattern effect ਨੂੰ ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ ਇਸਨੂੰ ਕਿਵੇਂ ਬਣਾਇਆ ਜਾ ਸਕਦਾ ਹੈ?

ਤੁਸੀਂ ਜਾਣਕਾਰੀ ਖੋਜ ਕੇ `overlay`, `mask` ਜਾਂ `ImagePaint` ਵਰਗੇ related usages ਬਾਰੇ ਸਮਝਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰ ਸਕਦੇ ਹੋ।

ਕਸਰਤ ਦਾ display result:

![button](../../../Resource/032_view16.png)
