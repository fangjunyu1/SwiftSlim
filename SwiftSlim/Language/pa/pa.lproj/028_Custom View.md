# ਕਸਟਮ ਦ੍ਰਿਸ਼

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ SwiftUI ਲਿਖਣ ਦਾ ਇੱਕ ਬਹੁਤ ਮਹੱਤਵਪੂਰਨ ਤਰੀਕਾ ਸਿੱਖਾਂਗੇ: **ਕਸਟਮ View**।

ਕਸਟਮ View ਦੁਹਰਾਏ ਜਾਣ ਵਾਲੇ View ਕੋਡ ਦੇ ਇੱਕ ਹਿੱਸੇ ਨੂੰ ਪੈਕ ਕਰ ਸਕਦਾ ਹੈ, ਤਾਂ ਜੋ ਇਹ ਇੱਕ ਅਜਿਹਾ View ਬਣ ਜਾਵੇ ਜਿਸਨੂੰ ਵਾਰ-ਵਾਰ ਵਰਤਿਆ ਜਾ ਸਕੇ।

ਅਸਲ App ਵਿਕਾਸ ਵਿੱਚ, ਅਸੀਂ ਅਕਸਰ ਇਹੋ ਜਿਹੀ ਸਥਿਤੀ ਦਾ ਸਾਹਮਣਾ ਕਰਦੇ ਹਾਂ: ਬਹੁਤ ਸਾਰੀਆਂ ਸਕ੍ਰੀਨਾਂ ਦੀ ਬਣਤਰ ਇੱਕੋ ਜਿਹੀ ਹੁੰਦੀ ਹੈ, ਸਿਰਫ਼ ਦਿਖਾਈ ਜਾਣ ਵਾਲੀ ਸਮੱਗਰੀ ਵੱਖਰੀ ਹੁੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਕਿਸੇ ਫੋਰਮ ਵੈੱਬਸਾਈਟ ਦੀ ਪੋਸਟ ਸੂਚੀ ਵਿੱਚ, ਹਰ ਪੋਸਟ ਵਿੱਚ ਸਿਰਲੇਖ, ਚਿੱਤਰ, ਲਾਈਕਾਂ ਦੀ ਗਿਣਤੀ ਆਦਿ ਜਾਣਕਾਰੀ ਹੋ ਸਕਦੀ ਹੈ।

![Reddit](../../../Resource/028_view1.png)

ਕਿਸੇ ਖਰੀਦਦਾਰੀ ਵੈੱਬਸਾਈਟ ਦੀ ਉਤਪਾਦ ਸੂਚੀ ਵਿੱਚ, ਹਰ ਉਤਪਾਦ ਵਿੱਚ ਚਿੱਤਰ, ਨਾਮ ਅਤੇ ਕੀਮਤ ਆਦਿ ਜਾਣਕਾਰੀ ਹੋ ਸਕਦੀ ਹੈ।

![Amazon](../../../Resource/028_view2.png)

ਇਹਨਾਂ ਸਮੱਗਰੀਆਂ ਦੀ ਬਣਤਰ ਮਿਲਦੀ-ਜੁਲਦੀ ਹੈ; ਫ਼ਰਕ ਸਿਰਫ਼ ਦਿਖਾਏ ਜਾਣ ਵਾਲੇ ਡੇਟਾ ਵਿੱਚ ਹੁੰਦਾ ਹੈ।

ਜੇ ਹਰ ਇਕ ਆਈਟਮ ਲਈ ਕੋਡ ਹੱਥੋਂ ਲਿਖਿਆ ਜਾਵੇ, ਤਾਂ ਕੋਡ ਬਹੁਤ ਲੰਮਾ ਹੋ ਜਾਵੇਗਾ, ਅਤੇ ਬਾਅਦ ਵਿੱਚ ਸੋਧ ਕਰਨਾ ਵੀ ਸੁਵਿਧਾਜਨਕ ਨਹੀਂ ਰਹੇਗਾ।

ਇਸ ਲਈ, ਅਸੀਂ ਇੱਕੋ ਜਿਹੀ ਬਣਤਰ ਨੂੰ ਕਸਟਮ View ਵਿੱਚ ਪੈਕ ਕਰ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਵੱਖਰੀ ਸਮੱਗਰੀ ਨੂੰ ਪੈਰਾਮੀਟਰਾਂ ਵਜੋਂ ਅੰਦਰ ਭੇਜ ਸਕਦੇ ਹਾਂ।

ਇਸ ਤਰ੍ਹਾਂ, ਉਹੀ View ਵੱਖਰੀ ਸਮੱਗਰੀ ਦਿਖਾ ਸਕਦਾ ਹੈ।

## ਲੋੜ ਵਾਲਾ ਦ੍ਰਿਸ਼

ਉਦਾਹਰਨ ਲਈ, ਹੁਣ ਸਾਨੂੰ ਇੱਕ ਸੈਟਿੰਗਾਂ ਦੀ ਸੂਚੀ ਬਣਾਉਣੀ ਹੈ।

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਨਤੀਜਾ:

![view](../../../Resource/028_view.png)

ਇਸ ਸੈਟਿੰਗਾਂ ਦੀ ਸੂਚੀ ਵਿੱਚ ਤਿੰਨ ਵੱਖਰੇ ਸੈਟਿੰਗ ਆਈਟਮ ਹਨ: `ਸੈਟਿੰਗਾਂ`, `ਫੋਲਡਰ`, `ਸੰਗੀਤ`।

ਭਾਵੇਂ ਉਹਨਾਂ ਦੇ ਆਈਕਨ, ਰੰਗ ਅਤੇ ਸਿਰਲੇਖ ਵੱਖਰੇ ਹਨ, ਪਰ ਕੁੱਲ ਬਣਤਰ ਇੱਕੋ ਜਿਹੀ ਹੈ:

- ਖੱਬੇ ਪਾਸੇ ਆਈਕਨ
- ਆਈਕਨ ਦਾ ਪਿਛੋਕੜ ਰੰਗ
- ਵਿਚਕਾਰ ਸਿਰਲੇਖ
- ਸੱਜੇ ਪਾਸੇ ਤੀਰ

ਜੇ ਅਸੀਂ ਕਸਟਮ View ਦੀ ਵਰਤੋਂ ਨਾ ਕਰੀਏ, ਤਾਂ ਅਸੀਂ ਸ਼ਾਇਦ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖੀਏ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("ਸੈਟਿੰਗਾਂ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("ਫੋਲਡਰ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("ਸੰਗੀਤ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

ਇਹ ਕੋਡ ਠੀਕ ਤਰ੍ਹਾਂ ਦਿਖਾਈ ਦੇ ਸਕਦਾ ਹੈ, ਪਰ ਸਮੱਸਿਆ ਵੀ ਬਹੁਤ ਸਪਸ਼ਟ ਹੈ: ਤਿੰਨ ਸੈਟਿੰਗ ਆਈਟਮਾਂ ਦਾ ਕੋਡ ਲਗਭਗ ਪੂਰੀ ਤਰ੍ਹਾਂ ਇੱਕੋ ਜਿਹਾ ਹੈ।

ਵੱਖਰਾ ਸਿਰਫ਼ ਆਈਕਨ, ਰੰਗ ਅਤੇ ਸਿਰਲੇਖ ਹੈ:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("ਸੈਟਿੰਗਾਂ")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("ਫੋਲਡਰ")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("ਸੰਗੀਤ")
```

ਅਰਥਾਤ, ਹਰ ਸੈਟਿੰਗ ਆਈਟਮ ਦੀ ਬਣਤਰ ਪੱਕੀ ਹੈ, ਵੱਖਰੇ ਸਿਰਫ਼ ਆਈਕਨ, ਰੰਗ ਅਤੇ ਸਿਰਲੇਖ ਹਨ।

ਇਹੋ ਜਿਹੀ ਸਥਿਤੀ ਕਸਟਮ View ਵਰਤਣ ਲਈ ਬਹੁਤ ਉਚਿਤ ਹੈ।

### ਛਾਂ shadow

ਇੱਥੇ ਇੱਕ ਨਵਾਂ modifier `.shadow(radius:)` ਵਰਤਿਆ ਗਿਆ ਹੈ:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View ਨੂੰ ਛਾਂ ਜੋੜ ਸਕਦਾ ਹੈ।

`radius` ਛਾਂ ਦੇ blur radius ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਮੁੱਲ ਜਿੰਨਾ ਵੱਡਾ ਹੋਵੇ, ਆਮ ਤੌਰ ਤੇ ਛਾਂ ਦਾ ਫੈਲਾਅ ਖੇਤਰ ਉਨਾ ਵੱਡਾ ਹੁੰਦਾ ਹੈ, ਅਤੇ ਇਹ ਹੋਰ ਨਰਮ ਦਿਖਦੀ ਹੈ।

ਇੱਥੇ ਇਸਨੂੰ `1` ਸੈੱਟ ਕੀਤਾ ਗਿਆ ਹੈ, ਜਿਸਦਾ ਅਰਥ ਹੈ ਕਿ ਸਿਰਫ਼ ਬਹੁਤ ਹਲਕਾ ਛਾਂ ਪ੍ਰਭਾਵ ਜੋੜਿਆ ਗਿਆ ਹੈ।

## ਸੈਟਿੰਗ ਆਈਟਮ View ਨੂੰ ਪੈਕ ਕਰਨਾ

ਅੱਗੇ, ਅਸੀਂ ਹਰ ਸੈਟਿੰਗ ਆਈਟਮ ਨੂੰ ਇੱਕ ਨਵੇਂ View ਵਜੋਂ ਪੈਕ ਕਰਦੇ ਹਾਂ।

ਅਸੀਂ `SettingItemView` ਬਣਾ ਸਕਦੇ ਹਾਂ:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ਇਸ View ਵਿੱਚ, ਅਸੀਂ ਤਿੰਨ properties ਪਰਿਭਾਸ਼ਿਤ ਕੀਤੀਆਂ ਹਨ:

```swift
let icon: String
let color: Color
let title: String
```

ਇਹਨਾਂ ਵਿੱਚ:

- `icon` ਆਈਕਨ ਦੇ ਨਾਮ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ
- `color` ਆਈਕਨ ਦੇ ਪਿਛੋਕੜ ਰੰਗ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ
- `title` ਸੈਟਿੰਗ ਆਈਟਮ ਦੇ ਸਿਰਲੇਖ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ

ਕਿਉਂਕਿ ਇਹ ਤਿੰਨ ਸਮੱਗਰੀਆਂ ਵੱਖ-ਵੱਖ ਸੈਟਿੰਗ ਆਈਟਮਾਂ ਵਿੱਚ ਵੱਖਰੀਆਂ ਹੁੰਦੀਆਂ ਹਨ, ਇਸ ਲਈ ਅਸੀਂ ਇਹਨਾਂ ਨੂੰ ਬਾਹਰੋਂ ਭੇਜੇ ਜਾ ਸਕਣ ਵਾਲੇ ਪੈਰਾਮੀਟਰ ਬਣਾਉਂਦੇ ਹਾਂ।

## ਕਸਟਮ View ਦੀ ਵਰਤੋਂ

`SettingItemView` ਹੋਣ ਤੋਂ ਬਾਅਦ, ਸਾਨੂੰ ਹੁਣ ਲੰਮਾ `HStack` ਕੋਡ ਵਾਰ-ਵਾਰ ਲਿਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ।

ਹੁਣ ਅਸੀਂ ਇਸਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ਸੈਟਿੰਗਾਂ")
```

ਇਸ ਕੋਡ ਲਾਈਨ ਦਾ ਮਤਲਬ ਹੈ ਇੱਕ ਸੈਟਿੰਗ ਆਈਟਮ View ਬਣਾਉਣਾ ਅਤੇ ਤਿੰਨ ਪੈਰਾਮੀਟਰ ਭੇਜਣਾ:

```swift
icon: "gear"
color: Color.blue
title: "ਸੈਟਿੰਗਾਂ"
```

ਭੇਜਣ ਤੋਂ ਬਾਅਦ, `SettingItemView` ਦੇ ਅੰਦਰਲੀਆਂ properties ਨੂੰ ਸੰਬੰਧਤ ਮੁੱਲ ਮਿਲ ਜਾਣਗੇ:

- `icon` ਦਾ ਮੁੱਲ `gear` ਹੈ
- `color` ਦਾ ਮੁੱਲ `Color.blue` ਹੈ
- `title` ਦਾ ਮੁੱਲ `"ਸੈਟਿੰਗਾਂ"` ਹੈ

ਇਸ ਲਈ, View ਦੇ ਅੰਦਰ `Image(systemName: icon)` ਗੀਅਰ ਆਈਕਨ ਦਿਖਾਏਗਾ, `.background(color)` ਨੀਲਾ ਪਿਛੋਕੜ ਵਰਤੇਗਾ, ਅਤੇ `Text(title)` `ਸੈਟਿੰਗਾਂ` ਦਿਖਾਏਗਾ।

ਪੂਰਾ ਕੋਡ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "ਸੈਟਿੰਗਾਂ")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "ਫੋਲਡਰ")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "ਸੰਗੀਤ")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਨਤੀਜਾ:

![view](../../../Resource/028_view.png)

ਅਸੀਂ ਵੇਖ ਸਕਦੇ ਹਾਂ ਕਿ ਪੈਕ ਕਰਨ ਤੋਂ ਬਾਅਦ ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਨਤੀਜਾ ਪਹਿਲਾਂ ਵਰਗਾ ਹੀ ਹੈ, ਪਰ ਕੋਡ ਹੋਰ ਸਪਸ਼ਟ ਹੋ ਗਿਆ ਹੈ।

ਪਹਿਲਾਂ ਹਰ ਸੈਟਿੰਗ ਆਈਟਮ ਲਈ ਪੂਰਾ `HStack` ਹਿੱਸਾ ਲਿਖਣਾ ਪੈਂਦਾ ਸੀ, ਹੁਣ ਸਿਰਫ਼ ਇੱਕ ਲਾਈਨ ਕੋਡ ਕਾਫ਼ੀ ਹੈ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ਸੈਟਿੰਗਾਂ")
```

ਇਹੀ ਕਸਟਮ View ਦੀ ਭੂਮਿਕਾ ਹੈ: **ਦੁਹਰਾਈ ਜਾਣ ਵਾਲੀ View ਬਣਤਰ ਨੂੰ ਪੈਕ ਕਰਨਾ, ਅਤੇ ਸਿਰਫ਼ ਵੱਖਰੀ ਸਮੱਗਰੀ ਨੂੰ ਪੈਰਾਮੀਟਰਾਂ ਵਜੋਂ ਭੇਜਣਾ।**

## ਪੈਰਾਮੀਟਰ ਕਿਉਂ ਭੇਜੇ ਜਾ ਸਕਦੇ ਹਨ

ਅੱਗੇ, ਅਸੀਂ ਸਧਾਰਣ ਤੌਰ ਤੇ ਸਮਝਦੇ ਹਾਂ ਕਿ ਕਸਟਮ View ਪੈਰਾਮੀਟਰ ਕਿਉਂ ਲੈ ਸਕਦਾ ਹੈ।

SwiftUI ਵਿੱਚ, View ਅਸਲ ਵਿੱਚ ਇੱਕ structure ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    var body: some View {
        Text("ਸਤ ਸ੍ਰੀ ਅਕਾਲ, ਦੁਨੀਆ!")
    }
}
```

ਇੱਥੇ `ContentView` ਇੱਕ structure ਹੈ।

ਜਦੋਂ ਅਸੀਂ ਲਿਖਦੇ ਹਾਂ:

```swift
ContentView()
```

ਅਸਲ ਵਿੱਚ ਅਸੀਂ ਇੱਕ `ContentView` View ਬਣਾ ਰਹੇ ਹੁੰਦੇ ਹਾਂ।

ਪਿੱਛੇ ਵਾਲਾ `()` ਇਸਦੀ initialization method ਨੂੰ ਕਾਲ ਕਰਨਾ ਦਰਸਾਉਂਦਾ ਹੈ; ਇਸਨੂੰ ਇਹ View ਬਣਾਉਣਾ ਵੀ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਕਿਉਂਕਿ ਇਸ `ContentView` ਵਿੱਚ ਬਾਹਰੋਂ ਭੇਜਣ ਵਾਲੀਆਂ ਕੋਈ properties ਨਹੀਂ ਹਨ, ਇਸ ਲਈ ਸਿੱਧਾ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
ContentView()
```

ਪਰ ਜੇ View ਵਿੱਚ ਕੋਈ ਐਸੀ property ਹੋਵੇ ਜਿਸਨੂੰ ਮੁੱਲ ਨਾ ਦਿੱਤਾ ਗਿਆ ਹੋਵੇ, ਤਾਂ View ਬਣਾਉਂਦੇ ਸਮੇਂ ਸੰਬੰਧਤ ਮੁੱਲ ਭੇਜਣਾ ਪੈਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ਨਾਮ: \(name)")
    }
}
```

ਇੱਥੇ `name` ਇੱਕ property ਹੈ, ਅਤੇ ਇਸਦਾ default value ਨਹੀਂ ਹੈ।

ਇਸ ਲਈ `ContentView` ਬਣਾਉਂਦੇ ਸਮੇਂ, `name` ਨੂੰ ਇੱਕ ਠੋਸ ਮੁੱਲ ਦੇਣਾ ਲਾਜ਼ਮੀ ਹੈ:

```swift
ContentView(name: "Fang Junyu")
```

ਇਸ ਤਰ੍ਹਾਂ, View ਦੇ ਅੰਦਰ ਇਹ ਮੁੱਲ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Text("ਨਾਮ: \(name)")
```

ਇਹ ਵੀ ਉਹੀ ਕਾਰਨ ਹੈ ਜਿਸ ਕਰਕੇ `SettingItemView` ਬਣਾਉਂਦੇ ਸਮੇਂ ਸਾਨੂੰ ਪੈਰਾਮੀਟਰ ਭੇਜਣੇ ਪੈਂਦੇ ਹਨ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ਸੈਟਿੰਗਾਂ")
```

ਕਿਉਂਕਿ `SettingItemView` ਵਿੱਚ default value ਤੋਂ ਬਿਨਾਂ ਤਿੰਨ properties ਹਨ:

```swift
let icon: String
let color: Color
let title: String
```

ਇਸ ਲਈ ਇਹ View ਬਣਾਉਂਦੇ ਸਮੇਂ, ਇਹਨਾਂ ਨੂੰ ਅੰਦਰ ਭੇਜਣਾ ਪੈਂਦਾ ਹੈ। ਭੇਜੇ ਗਏ ਪੈਰਾਮੀਟਰ Swift ਵੱਲੋਂ View ਦੇ ਅੰਦਰਲੀਆਂ properties ਨੂੰ ਮੁੱਲ ਦੇਣ ਲਈ ਵਰਤੇ ਜਾਣਗੇ।

## Initialization method

ਅੱਗੇ, ਅਸੀਂ initialization method ਨੂੰ ਹੋਰ ਸਮਝਦੇ ਹਾਂ।

### Default initialization method

ਜਦੋਂ ਅਸੀਂ ਇੱਕ ਆਮ View ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    var body: some View {
        Text("ਸਤ ਸ੍ਰੀ ਅਕਾਲ, ਦੁਨੀਆ!")
    }
}
```

ਇਸ ਕੋਡ ਵਿੱਚ, ਅਸੀਂ initialization method ਹੱਥੋਂ ਨਹੀਂ ਲਿਖੀ।

ਪਰ ਜਦੋਂ ਅਸੀਂ ਇਹ View ਵਰਤਦੇ ਹਾਂ, ਤਾਂ ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
ContentView()
```

ਇੱਥੇ `()` ਅਸਲ ਵਿੱਚ `ContentView` ਬਣਾਉਣ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ; ਇਸਨੂੰ ਇਸਦੀ initialization method ਨੂੰ ਕਾਲ ਕਰਨਾ ਵੀ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ।

### initialization method ਨਾ ਹੋਣ ਦੇ ਬਾਵਜੂਦ ਇਸਨੂੰ ਕਿਉਂ ਕਾਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ?

ਕਿਉਂਕਿ Swift compiler ਸਾਡੇ ਲਈ ਆਪਣੇ ਆਪ ਇੱਕ initialization method ਬਣਾਉਂਦਾ ਹੈ।

ਧਿਆਨ ਦੇਣ ਵਾਲੀ ਗੱਲ ਹੈ: **ਇਹ initialization method ਆਪਣੇ ਆਪ ਬਣਦੀ ਹੈ, ਅਤੇ ਆਮ ਤੌਰ ਤੇ ਅਸੀਂ ਇਸਨੂੰ ਕੋਡ ਵਿੱਚ ਸਿੱਧਾ ਨਹੀਂ ਵੇਖਦੇ।**

ਅਰਥਾਤ, ਭਾਵੇਂ ਅਸੀਂ `struct` ਵਿੱਚ ਹੱਥੋਂ ਇਹ ਨਹੀਂ ਲਿਖਿਆ:

```swift
init() {

}
```

ਫਿਰ ਵੀ Swift compiler ਪਿੱਛੇ ਸਾਡੇ ਲਈ ਲਗਭਗ ਇਸ ਤਰ੍ਹਾਂ ਦੀ initialization method ਬਣਾਉਂਦਾ ਹੈ:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("ਸਤ ਸ੍ਰੀ ਅਕਾਲ, ਦੁਨੀਆ!")
    }
}
```

ਇਸ ਕਰਕੇ ਅਸੀਂ ਸਿੱਧਾ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
ContentView()
```

ਇਸ ਲਈ ਅਸਲ ਕੋਡ ਵਿੱਚ, ਆਮ ਤੌਰ ਤੇ ਸਾਨੂੰ initialization method ਹੱਥੋਂ ਲਿਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਹੁੰਦੀ।

ਸਿਰਫ਼ ਇੱਕ ਗੱਲ ਸਮਝਣੀ ਲੋੜੀਂਦੀ ਹੈ: **SwiftUI View ਬਣਾਉਂਦੇ ਸਮੇਂ, ਉਸ View ਦੀ initialization method ਕਾਲ ਹੁੰਦੀ ਹੈ। ਭਾਵੇਂ ਅਸੀਂ initialization method ਹੱਥੋਂ ਨਾ ਲਿਖੀ ਹੋਵੇ, Swift ਇਸਨੂੰ ਆਪਣੇ ਆਪ ਬਣਾ ਸਕਦਾ ਹੈ।**

### ਪੈਰਾਮੀਟਰ ਵਾਲੀ initialization method

ਜੇ View ਵਿੱਚ ਕੋਈ property ਹੋਵੇ ਜਿਸਦਾ default value ਨਾ ਹੋਵੇ, ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ਨਾਮ: \(name)")
    }
}
```

Swift compiler property ਦੇ ਅਧਾਰ ਤੇ ਆਪਣੇ ਆਪ ਇੱਕ ਪੈਰਾਮੀਟਰ ਵਾਲੀ initialization method ਬਣਾਉਂਦਾ ਹੈ।

ਇਸਨੂੰ ਸਧਾਰਣ ਤੌਰ ਤੇ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
init(name: String) {
    self.name = name
}
```

ਇੱਥੇ:

```swift
init(name: String)
```

ਦਾ ਮਤਲਬ ਹੈ ਕਿ `ContentView` ਬਣਾਉਂਦੇ ਸਮੇਂ `String` ਕਿਸਮ ਦਾ `name` ਪੈਰਾਮੀਟਰ ਭੇਜਣਾ ਪਵੇਗਾ।

ਜਦੋਂ ਅਸੀਂ ਲਿਖਦੇ ਹਾਂ:

```swift
ContentView(name: "Fang Junyu")
```

ਇਸਦਾ ਮਤਲਬ ਹੈ: `"Fang Junyu"` ਨੂੰ initialization method ਵਿੱਚ ਪੈਰਾਮੀਟਰ ਵਜੋਂ ਭੇਜਣਾ।

ਫਿਰ initialization method ਦੇ ਅੰਦਰ ਇਹ ਚੱਲੇਗਾ:

```swift
self.name = name
```

ਇਸ ਕੋਡ ਲਾਈਨ ਦਾ ਮਤਲਬ ਹੈ: ਬਾਹਰੋਂ ਭੇਜੇ ਗਏ `name` ਨੂੰ ਮੌਜੂਦਾ View ਦੀ ਆਪਣੀ `name` property ਨੂੰ ਦੇਣਾ।

ਇਸਨੂੰ ਸਧਾਰਣ ਤੌਰ ਤੇ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ਨਾਮ: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

ਇਸ ਤਰ੍ਹਾਂ, View ਦੇ ਅੰਦਰ ਭੇਜਿਆ ਗਿਆ ਮੁੱਲ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਇਹੀ ਪੈਰਾਮੀਟਰ ਵਾਲੇ View ਦੀ initialization ਪ੍ਰਕਿਰਿਆ ਹੈ: **ਜਦੋਂ View ਦੇ ਅੰਦਰਲੀ property ਦਾ default value ਨਾ ਹੋਵੇ, ਤਾਂ View ਬਣਾਉਂਦੇ ਸਮੇਂ ਸੰਬੰਧਤ ਪੈਰਾਮੀਟਰ ਭੇਜਣਾ ਲਾਜ਼ਮੀ ਹੁੰਦਾ ਹੈ, ਤਾਂ ਜੋ initialization method property ਨੂੰ ਮੁੱਲ ਦੇ ਸਕੇ।**

## ਜਦੋਂ property ਦਾ default value ਹੋਵੇ

ਜੇ property ਦਾ ਪਹਿਲਾਂ ਹੀ default value ਹੋਵੇ, ਤਾਂ View ਬਣਾਉਂਦੇ ਸਮੇਂ ਪੈਰਾਮੀਟਰ ਨਾ ਵੀ ਭੇਜਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ਨਾਮ: \(name)")
    }
}
```

ਇੱਥੇ `name` ਦਾ ਪਹਿਲਾਂ ਹੀ default value ਹੈ:

```swift
"Fang Junyu"
```

ਇਸ ਲਈ `ContentView` ਬਣਾਉਂਦੇ ਸਮੇਂ, ਸਿੱਧਾ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
ContentView()
```

ਇਸ ਸਮੇਂ, `name` default value ਵਰਤੇਗਾ, ਅਤੇ ਇੰਟਰਫੇਸ ਦਿਖਾਏਗਾ:

```swift
ਨਾਮ: Fang Junyu
```

ਬੇਸ਼ੱਕ, View ਬਣਾਉਂਦੇ ਸਮੇਂ ਇੱਕ ਨਵਾਂ ਮੁੱਲ ਵੀ ਭੇਜਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
ContentView(name: "Sam")
```

ਇਸ ਸਮੇਂ, View ਬਾਹਰੋਂ ਭੇਜੇ `"Sam"` ਨੂੰ ਵਰਤੇਗਾ, default value ਨੂੰ ਨਹੀਂ, ਅਤੇ ਇੰਟਰਫੇਸ ਦਿਖਾਏਗਾ:

```swift
ਨਾਮ: Sam
```

ਸਮਝਣ ਨੂੰ ਆਸਾਨ ਬਣਾਉਣ ਲਈ, Swift compiler ਵੱਲੋਂ ਆਪਣੇ ਆਪ ਬਣਾਈ initialization method ਨੂੰ ਸਧਾਰਣ ਤੌਰ ਤੇ ਇਸ ਤਰ੍ਹਾਂ ਵੇਖ ਸਕਦੇ ਹਾਂ:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

ਇੱਥੇ `name: String = "Fang Junyu"` ਦਾ ਮਤਲਬ ਹੈ: ਜੇ View ਬਣਾਉਂਦੇ ਸਮੇਂ `name` ਨਾ ਭੇਜਿਆ ਜਾਵੇ, ਤਾਂ default value `"Fang Junyu"` ਵਰਤਿਆ ਜਾਵੇ; ਜੇ View ਬਣਾਉਂਦੇ ਸਮੇਂ ਨਵਾਂ `name` ਭੇਜਿਆ ਜਾਵੇ, ਤਾਂ ਭੇਜਿਆ ਗਿਆ ਮੁੱਲ ਵਰਤਿਆ ਜਾਵੇ।

ਅਰਥਾਤ: **ਜੇ ਬਾਹਰੋਂ ਪੈਰਾਮੀਟਰ ਨਾ ਭੇਜਿਆ ਜਾਵੇ, ਤਾਂ property ਦਾ default value ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ; ਜੇ ਬਾਹਰੋਂ ਪੈਰਾਮੀਟਰ ਭੇਜਿਆ ਜਾਵੇ, ਤਾਂ ਭੇਜਿਆ ਗਿਆ ਮੁੱਲ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।**

## ਮੁੜ SettingItemView ਵੱਲ

ਹੁਣ ਅਸੀਂ ਮੁੜ SettingItemView ਨੂੰ ਵੇਖਦੇ ਹਾਂ:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ਇਸ View ਦੀ ਬਣਤਰ ਪੱਕੀ ਹੈ।

ਪੱਕੇ ਹਿੱਸਿਆਂ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

ਵੱਖਰੇ ਹਿੱਸਿਆਂ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:

```swift
icon
color
title
```

ਇਸ ਲਈ, ਅਸੀਂ ਵੱਖਰੀ ਸਮੱਗਰੀ ਨੂੰ properties ਬਣਾਉਂਦੇ ਹਾਂ, ਅਤੇ View ਬਣਾਉਂਦੇ ਸਮੇਂ ਇਹਨਾਂ ਨੂੰ ਪੈਰਾਮੀਟਰਾਂ ਵਜੋਂ ਭੇਜਦੇ ਹਾਂ।

ਜਦੋਂ ਅਸੀਂ ਵੱਖ-ਵੱਖ ਸੈਟਿੰਗ ਆਈਟਮਾਂ ਬਣਾਉਂਦੇ ਹਾਂ, ਸਿਰਫ਼ ਵੱਖਰੇ ਪੈਰਾਮੀਟਰ ਭੇਜਣੇ ਹੁੰਦੇ ਹਨ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ਸੈਟਿੰਗਾਂ")
SettingItemView(icon: "folder", color: Color.brown, title: "ਫੋਲਡਰ")
SettingItemView(icon: "music.note", color: Color.purple, title: "ਸੰਗੀਤ")
```

ਇਸ ਤਰ੍ਹਾਂ, ਉਹੀ `SettingItemView` ਤਿੰਨ ਵੱਖਰੀਆਂ ਸੈਟਿੰਗ ਆਈਟਮਾਂ ਦਿਖਾ ਸਕਦਾ ਹੈ।

ਇਹ ਕਸਟਮ View ਦੀ ਸਭ ਤੋਂ ਆਮ ਵਰਤੋਂ ਦਾ ਤਰੀਕਾ ਹੈ।

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਕਸਟਮ View ਸਿੱਖਿਆ।

ਕਸਟਮ View ਦੀ ਮੁੱਖ ਭੂਮਿਕਾ ਹੈ: **ਦੁਹਰਾਏ ਜਾਣ ਵਾਲੇ View ਕੋਡ ਨੂੰ ਪੈਕ ਕਰਨਾ, ਤਾਂ ਜੋ ਇਹ ਮੁੜ ਵਰਤਿਆ ਜਾ ਸਕੇ।**

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, ਤਿੰਨ ਸੈਟਿੰਗ ਆਈਟਮਾਂ ਦੀ ਬਣਤਰ ਇੱਕੋ ਜਿਹੀ ਹੈ, ਸਿਰਫ਼ ਆਈਕਨ, ਰੰਗ ਅਤੇ ਸਿਰਲੇਖ ਵੱਖਰੇ ਹਨ।

ਇਸ ਲਈ ਅਸੀਂ ਇੱਕ `SettingItemView` ਬਣਾਇਆ:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ਫਿਰ, ਇਸ View ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਸਮੇਂ ਵੱਖਰੇ ਪੈਰਾਮੀਟਰ ਭੇਜੇ ਜਾਂਦੇ ਹਨ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ਸੈਟਿੰਗਾਂ")
```

ਇੱਥੇ ਦਿੱਤੇ ਪੈਰਾਮੀਟਰ `SettingItemView` ਦੇ ਅੰਦਰ ਚਲੇ ਜਾਂਦੇ ਹਨ।

ਇਸ ਤਰੀਕੇ ਨਾਲ, ਅਸੀਂ ਘੱਟ ਕੋਡ ਨਾਲ ਇੱਕੋ ਬਣਤਰ ਪਰ ਵੱਖਰੀ ਸਮੱਗਰੀ ਵਾਲੇ Views ਬਣਾ ਸਕਦੇ ਹਾਂ।

ਇਹ SwiftUI ਵਿਕਾਸ ਵਿੱਚ ਵੀ ਬਹੁਤ ਆਮ ਤਰੀਕਾ ਹੈ।
