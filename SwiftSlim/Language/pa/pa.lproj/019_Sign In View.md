# ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਬਹੁਤ ਹੀ ਵਰਤੋਂਯੋਗ ਸਥਿਤੀ ਸਿੱਖਾਂਗੇ, ਉਹ ਹੈ ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼।

ਭਾਵੇਂ ਇਹ ਕੋਈ ਵੈੱਬਸਾਈਟ ਹੋਵੇ ਜਾਂ App, ਵਰਤੋਂ ਦੌਰਾਨ ਬਹੁਤ ਵਾਰ ਯੂਜ਼ਰ ਨੂੰ ਖਾਤੇ ਅਤੇ ਪਾਸਵਰਡ ਨਾਲ ਲਾਗਇਨ ਕਰਨ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ, GitHub ਦਾ ਲਾਗਇਨ ਪੇਜ:

![WordPress](../../Resource/019_github.png)

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਇਸ ਵਰਗਾ ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼ ਬਣਾਵਾਂਗੇ, ਜਿਸ ਵਿੱਚ ਯੂਜ਼ਰ ਹੱਥੋਂ ਖਾਤਾ ਅਤੇ ਪਾਸਵਰਡ ਦਰਜ ਕਰੇਗਾ ਅਤੇ ਜਾਂਚੇਗਾ ਕਿ ਇਨਪੁਟ ਸਮੱਗਰੀ ਵਿੱਚ ਕੋਈ ਸਮੱਸਿਆ ਤਾਂ ਨਹੀਂ।

## ਉੱਪਰੀ ਲੇਆਉਟ

ਅਸੀਂ ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼ ਦਾ ਕੋਡ `ContentView` ਫਾਈਲ ਵਿੱਚ ਲਿਖਾਂਗੇ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਆਓ ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼ ਦੇ ਉੱਪਰਲੇ ਪਹਿਚਾਣ ਖੇਤਰ ਨੂੰ ਬਣਾਈਏ। ਤੁਸੀਂ ਪਹਿਲਾਂ ਇੱਕ ਢੰਗ ਦੀ ਆਈਕਨ ਤਸਵੀਰ ਤਿਆਰ ਕਰ ਸਕਦੇ ਹੋ ਅਤੇ ਉਸਨੂੰ `Assets` ਫੋਲਡਰ ਵਿੱਚ ਰੱਖ ਸਕਦੇ ਹੋ।

![icon](../../Resource/019_icon1.png)

ਫਿਰ, ਤਸਵੀਰ ਦਿਖਾਉਣ ਲਈ `Image` ਅਤੇ modifiers ਵਰਤੋ:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

ਇੱਥੇ ਇਹਨਾਂ modifiers ਦਾ ਅਰਥ ਹੈ:

- `resizable()`：ਤਸਵੀਰ ਦਾ ਆਕਾਰ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ।
- `scaledToFit()`：ਤਸਵੀਰ ਨੂੰ ਇਸਦੇ ਅਸਲ ਅਨੁਪਾਤ ਨੂੰ ਕਾਇਮ ਰੱਖਦਿਆਂ ਸਕੇਲ ਕਰਦਾ ਹੈ।
- `frame(width: 100)`：ਤਸਵੀਰ ਦੀ ਦਿਖਾਈ ਜਾਣ ਵਾਲੀ ਚੌੜਾਈ `100` ਸੈੱਟ ਕਰਦਾ ਹੈ।

ਅਗਲੇ ਕਦਮ ਵਿੱਚ, ਸਾਈਨ ਇਨ ਸਿਰਲੇਖ ਦਿਖਾਉਣ ਲਈ `Text` ਅਤੇ modifiers ਵਰਤੋ:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

ਫਿਰ, ਤਸਵੀਰ ਅਤੇ ਲਿਖਤ ਨੂੰ ਉੱਪਰ-ਥੱਲੇ ਲਗਾਉਣ ਲਈ `VStack` ਵਰਤੋ:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

ਨਤੀਜਾ:

![view](../../Resource/019_view.png)

ਇੱਥੇ ਤੱਕ ਅਸੀਂ ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼ ਦੇ ਉੱਪਰੀ ਸਿਰਲੇਖ ਖੇਤਰ ਨੂੰ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ।

### ਲੇਆਉਟ ਨੂੰ ਸੁਧਾਰਨਾ

ਹੁਣ ਤਸਵੀਰ ਅਤੇ ਸਿਰਲੇਖ ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਪੂਰੇ ਲੇਆਉਟ ਦੇ ਵਿਚਕਾਰਲੇ ਖੇਤਰ ਵਿੱਚ ਹਨ।

ਜੇ ਅਸੀਂ ਚਾਹੀਏ ਕਿ ਇਹ "ਪੇਜ ਦੇ ਉੱਪਰਲੇ ਲਾਗਇਨ ਚਿੰਨ੍ਹ" ਵਾਂਗ ਲੱਗਣ, ਤਾਂ ਅਸੀਂ `Spacer()` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਬਾਕੀ ਖਾਲੀ ਥਾਂ ਨੂੰ ਭਰ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ ਸਮੱਗਰੀ ਉੱਪਰਲੇ ਹਿੱਸੇ ਦੇ ਨੇੜੇ ਦਿਖੇ।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

ਨਤੀਜਾ:

![view](../../Resource/019_view1.png)

ਪਰ ਹੁਣ `Image` ਅਤੇ `Text` ਸਕ੍ਰੀਨ ਦੇ ਉੱਪਰਲੇ ਹਿੱਸੇ ਦੇ ਬਹੁਤ ਨੇੜੇ ਹਨ ਅਤੇ ਕੁਝ ਭੀੜ ਵਾਲੇ ਲੱਗਦੇ ਹਨ।

ਇਸ ਵੇਲੇ, ਅਸੀਂ ਪੂਰੇ `VStack` ਲਈ ਉੱਪਰਲੀ ਦੂਰੀ ਵਧਾਉਣ ਲਈ `padding` ਵਰਤ ਸਕਦੇ ਹਾਂ।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

ਨਤੀਜਾ:

![view](../../Resource/019_view2.png)

ਇਸ ਤਰ੍ਹਾਂ, ਪੇਜ ਦੇ ਉੱਪਰਲਾ ਸਿਰਲੇਖ ਖੇਤਰ ਹੋਰ ਉਚਿਤ ਲੱਗਦਾ ਹੈ।

## ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ

ਲਾਗਇਨ ਪੇਜ 'ਤੇ ਆਮ ਤੌਰ 'ਤੇ ਯੂਜ਼ਰ ਨੂੰ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦਰਜ ਕਰਨ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

SwiftUI ਵਿੱਚ, ਅਸੀਂ ਯੂਜ਼ਰ ਦੁਆਰਾ ਦਰਜ ਕੀਤੀ ਸਮੱਗਰੀ ਲੈਣ ਲਈ `TextField` ਵਰਤ ਸਕਦੇ ਹਾਂ।

ਪਰ ਧਿਆਨ ਦਿਓ: `TextField` ਆਪਣੇ ਆਪ ਇਨਪੁਟ ਡਾਟਾ ਨੂੰ ਲੰਬੇ ਸਮੇਂ ਲਈ ਸਟੋਰ ਨਹੀਂ ਕਰਦਾ, ਇਹ ਸਿਰਫ਼ ਇੱਕ ਇਨਪੁਟ ਕੰਟਰੋਲ ਹੈ। ਅਸਲ ਵਿੱਚ ਇਹ ਸਮੱਗਰੀ ਉਹ variables ਸਟੋਰ ਕਰਦੇ ਹਨ ਜਿਨ੍ਹਾਂ ਨਾਲ ਅਸੀਂ ਇਸਨੂੰ bind ਕਰਦੇ ਹਾਂ।

ਇਸ ਲਈ, ਸਾਨੂੰ ਪਹਿਲਾਂ ਦੋ `@State` variables ਬਣਾਉਣ ਦੀ ਲੋੜ ਹੈ, ਜੋ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਸਾਂਭਣ ਲਈ ਹਨ:

```swift
@State private var user = ""
@State private var password = ""
```

ਜਦੋਂ `@State` variable ਦੀ value ਬਦਲਦੀ ਹੈ, SwiftUI ਆਪਣੇ ਆਪ ਸੰਬੰਧਿਤ view ਨੂੰ refresh ਕਰਦਾ ਹੈ।

ਅਗਲੇ ਕਦਮ ਵਿੱਚ, ਇਹਨਾਂ ਦੋ variables ਨੂੰ bind ਕਰਨ ਲਈ `TextField` ਵਰਤੋ:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

ਇੱਥੇ `$user` ਅਤੇ `$password` ਦਾ ਮਤਲਬ "binding" ਹੈ।

ਅਰਥਾਤ, ਜਦੋਂ ਯੂਜ਼ਰ ਇਨਪੁਟ ਬਾਕਸ ਵਿੱਚ ਲਿਖਦਾ ਹੈ, variable ਵੀ ਇਕੱਠੇ ਬਦਲਦਾ ਹੈ; ਅਤੇ ਜਦੋਂ variable ਬਦਲਦਾ ਹੈ, ਇਨਪੁਟ ਬਾਕਸ ਵਿੱਚ ਦਿਖਾਈ ਜਾਣ ਵਾਲੀ ਸਮੱਗਰੀ ਵੀ ਇਕੱਠੇ ਬਦਲਦੀ ਹੈ।

ਇਹ "view ਅਤੇ data ਦੇ ਇੱਕ-ਦੂਜੇ ਨਾਲ synchronize ਹੋਣ" ਵਾਲਾ ਸੰਬੰਧ ਹੀ binding ਹੈ।

ਧਿਆਨ ਦਿਓ, ਇੱਥੇ `$` ਵਾਲੀ ਲਿਖਤ ਵਰਤਣੀ ਲਾਜ਼ਮੀ ਹੈ:

```swift
$user
```

ਕਿਉਂਕਿ `TextField` ਨੂੰ ਆਮ string ਨਹੀਂ, ਸਗੋਂ ਇੱਕ ਐਸੀ binding value ਚਾਹੀਦੀ ਹੈ ਜੋ "data ਨੂੰ ਦੋ-ਤਰਫ਼ਾ ਬਦਲ ਸਕੇ"।

### ਇਨਪੁਟ ਬਾਕਸ ਦਿਖਾਉਣਾ

ਇਹਨਾਂ ਨੂੰ `ContentView` ਵਿੱਚ ਰੱਖੋ:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

ਦਿਖਾਵਟੀ ਨਤੀਜਾ:

![view](../../Resource/019_view3.png)

ਕਿਉਂਕਿ ਹੁਣ `user` ਅਤੇ `password` ਦੋਵੇਂ ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ ਖਾਲੀ strings ਹਨ:

```swift
""
```

ਇਸ ਲਈ ਇਨਪੁਟ ਬਾਕਸ ਪਹਿਲਾਂ placeholder ਲਿਖਤ ਦਿਖਾਏਗਾ, ਜਿਵੇਂ:

```swift
input user
```

ਇਹ ਲਿਖਤ ਸਿਰਫ਼ ਯੂਜ਼ਰ ਨੂੰ ਇਹ ਸੰਕੇਤ ਦੇਣ ਲਈ ਹੈ ਕਿ "ਇੱਥੇ ਕੀ ਭਰਨਾ ਹੈ", ਇਹ ਅਸਲੀ ਇਨਪੁਟ ਸਮੱਗਰੀ ਨਹੀਂ।

### ਇਨਪੁਟ ਬਾਕਸ ਨੂੰ ਸੁਧਾਰਨਾ

ਹੁਣ ਇਨਪੁਟ ਬਾਕਸ ਵਰਤੇ ਜਾ ਸਕਦੇ ਹਨ, ਪਰ ਡਿਫਾਲਟ style ਕਾਫੀ ਸਧਾਰਣ ਹੈ।

ਇੰਟਰਫੇਸ ਨੂੰ ਹੋਰ ਸਾਫ਼ ਬਣਾਉਣ ਲਈ, ਅਸੀਂ ਇਨਪੁਟ ਬਾਕਸ ਤੋਂ ਪਹਿਲਾਂ ਸਿਰਲੇਖ ਜੋੜ ਸਕਦੇ ਹਾਂ ਅਤੇ ਇਨਪੁਟ ਬਾਕਸ 'ਤੇ ਕੁਝ ਸੌਖੀ style ਸੁਧਾਰ ਕਰ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਵਜੋਂ, ਪਹਿਲਾਂ ਇੱਕ ਸਿਰਲੇਖ ਜੋੜੋ:

```swift
Text("Username")
    .fontWeight(.bold)
```

ਫਿਰ, ਸਿਰਲੇਖ ਅਤੇ ਇਨਪੁਟ ਬਾਕਸ ਨੂੰ ਇਕੋ ਲਾਈਨ ਵਿੱਚ ਰੱਖਣ ਲਈ `HStack` ਵਰਤੋ:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

ਇੱਥੇ `HStack` ਇਸ ਲਈ ਵਰਤੀ ਗਈ ਹੈ, ਕਿਉਂਕਿ ਅਸੀਂ "ਖੱਬੇ ਪਾਸੇ ਸਿਰਲੇਖ, ਸੱਜੇ ਪਾਸੇ ਇਨਪੁਟ ਬਾਕਸ" ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹਾਂ।

ਧਿਆਨ ਦਿਓ ਕਿ `TextField` ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ ਬਚੀ ਹੋਈ ਉਪਲਬਧ ਥਾਂ ਘੇਰ ਲੈਂਦਾ ਹੈ।

![color](../../Resource/019_view6.png)

ਦੋਵੇਂ ਇਨਪੁਟ ਬਾਕਸਾਂ ਦਾ ਆਕਾਰ ਹੋਰ ਇਕਸਾਰ ਬਣਾਉਣ ਲਈ, ਅਸੀਂ `frame(width:)` ਵਰਤਕੇ ਚੌੜਾਈ ਸੈੱਟ ਕਰ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ ਇਹ ਹੋਰ ਸਾਫ਼-ਸੁਥਰੇ ਦਿਸਣ।

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

ਫਿਰ ਇੱਕ border ਜੋੜੋ, ਤਾਂ ਜੋ ਇਨਪੁਟ ਬਾਕਸ ਹੋਰ ਸਪੱਸ਼ਟ ਲੱਗੇ:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ਹੁਣ, ਅਸੀਂ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਨੂੰ `ContentView` view ਵਿੱਚ ਜੋੜਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

ਦਿਖਾਵਟੀ ਨਤੀਜਾ:

![view](../../Resource/019_view4.png)

ਇੱਥੇ ਤੱਕ ਆ ਕੇ, ਯੂਜ਼ਰ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦਰਜ ਕਰ ਸਕਦਾ ਹੈ।

## ਸਾਈਨ ਇਨ ਬਟਨ

ਅਗਲੇ ਕਦਮ ਵਿੱਚ, ਅਸੀਂ ਇਨਪੁਟ ਬਾਕਸ ਦੇ ਹੇਠਾਂ ਇੱਕ ਸਾਈਨ ਇਨ ਬਟਨ ਜੋੜਦੇ ਹਾਂ।

```swift
Button("Sign in") {

}
```

ਫਿਰ, ਬਟਨ ਨੂੰ ਹੋਰ ਸਪੱਸ਼ਟ system style ਦੇਣ ਲਈ `buttonStyle` ਵਰਤੋ:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

ਦਿਖਾਵਟੀ ਨਤੀਜਾ:

![view](../../Resource/019_view5.png)

ਇਹ ਪੱਕਾ ਕਰਨ ਲਈ ਕਿ ਬਟਨ ਵਾਸਤਵ ਵਿੱਚ click ਦਾ ਜਵਾਬ ਦੇ ਸਕਦਾ ਹੈ, ਅਸੀਂ ਪਹਿਲਾਂ ਬਟਨ ਵਿੱਚ ਇੱਕ `print` ਲਿਖ ਕੇ ਟੈਸਟ ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

ਜਦੋਂ ਬਟਨ 'ਤੇ ਕਲਿੱਕ ਕੀਤਾ ਜਾਂਦਾ ਹੈ, console ਇਹ ਆਉਟਪੁਟ ਕਰੇਗਾ:

```swift
click Sign in
```

ਇਸ ਨਾਲ ਸਾਬਤ ਹੁੰਦਾ ਹੈ ਕਿ ਬਟਨ ਸਫਲਤਾਪੂਰਵਕ click ਦਾ ਜਵਾਬ ਦੇ ਰਿਹਾ ਹੈ।

## ਸਾਈਨ ਇਨ ਲਾਜਿਕ

ਹੁਣ ਅਸੀਂ ਸਾਈਨ ਇਨ ਬਟਨ ਵਿੱਚ ਇੱਕ ਸਭ ਤੋਂ ਬੁਨਿਆਦੀ validation logic ਜੋੜਦੇ ਹਾਂ: **ਜਾਂਚਣਾ ਕਿ ਯੂਜ਼ਰ ਨੇ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਭਰਿਆ ਹੈ ਜਾਂ ਨਹੀਂ**।

ਅਸੀਂ ਹੇਠਾਂ ਦਿੱਤੀਆਂ ਸਥਿਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹਾਂ:

- ਜੇ ਯੂਜ਼ਰ ਨੇ ਕੁਝ ਵੀ ਨਾ ਭਰਿਆ ਹੋਵੇ, ਤਾਂ `Empty` ਆਉਟਪੁਟ ਕਰੋ
- ਜੇ ਯੂਜ਼ਰ ਨੇ ਸਿਰਫ਼ ਇੱਕ ਚੀਜ਼ ਭਰੀ ਹੋਵੇ, ਤਾਂ ਦੱਸੋ ਕਿ ਕਿਹੜੀ ਘੱਟ ਹੈ
- ਜੇ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਭਰੇ ਹੋਣ, ਤਾਂ `Success` ਆਉਟਪੁਟ ਕਰੋ

### ਕੋਈ ਵੀ ਜਾਣਕਾਰੀ ਨਾ ਭਰੀ ਹੋਵੇ

ਕਿਉਂਕਿ `user` ਅਤੇ `password` ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਦੋਵੇਂ ਖਾਲੀ strings ਹਨ:

```swift
@State private var user = ""
@State private var password = ""
```

ਇਸ ਲਈ ਜਦੋਂ ਯੂਜ਼ਰ ਕੁਝ ਵੀ ਨਹੀਂ ਭਰਦਾ, ਇਹ ਫਿਰ ਵੀ ਖਾਲੀ ਰਹਿੰਦੇ ਹਨ।

Swift ਵਿੱਚ, `String` ਵਰਗੇ type `isEmpty` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਜਾਂਚ ਸਕਦੇ ਹਨ ਕਿ ਸਮੱਗਰੀ ਖਾਲੀ ਹੈ ਜਾਂ ਨਹੀਂ।

### isEmpty ਗੁਣ

`isEmpty` ਅਕਸਰ strings, arrays ਆਦਿ ਦੀ ਸਮੱਗਰੀ ਖਾਲੀ ਹੈ ਜਾਂ ਨਹੀਂ ਇਹ ਜਾਂਚਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

ਜੇ ਸਮੱਗਰੀ ਖਾਲੀ ਹੋਵੇ, `isEmpty` `true` ਵਾਪਸ ਕਰਦਾ ਹੈ; ਜੇ ਸਮੱਗਰੀ ਖਾਲੀ ਨਾ ਹੋਵੇ, `isEmpty` `false` ਵਾਪਸ ਕਰਦਾ ਹੈ।

ਇਸ ਲਈ, ਅਸੀਂ ਇਸਦੀ ਵਰਤੋਂ ਕਰਕੇ ਜਾਂਚ ਸਕਦੇ ਹਾਂ ਕਿ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਵਿੱਚ ਕੋਈ ਇਨਪੁਟ ਹੈ ਜਾਂ ਨਹੀਂ।

### variables ਦੀ ਜਾਂਚ ਲਈ isEmpty ਵਰਤਣਾ

ਜੇ ਯੂਜ਼ਰ ਨੇ ਕੋਈ ਜਾਣਕਾਰੀ ਨਾ ਭਰੀ ਹੋਵੇ, ਤਾਂ:

```swift
user.isEmpty // true
password.isEmpty    // true
```

ਇਸ ਵੇਲੇ, ਅਸੀਂ ਇਹ ਸ਼ਰਤ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

ਇਸ ਕੋਡ ਦਾ ਅਰਥ ਹੈ: ਜੇ `user` ਖਾਲੀ ਹੈ, ਅਤੇ `password` ਵੀ ਖਾਲੀ ਹੈ, ਤਾਂ ਇਹ ਆਉਟਪੁਟ ਕਰੋ:

```swift
Empty
```

ਇੱਥੇ `&&` ਇੱਕ logical operator ਹੈ, ਜਿਸਦਾ ਅਰਥ "ਅਤੇ" ਹੈ।

ਅਰਥਾਤ, ਖੱਬੇ ਪਾਸੇ ਦੀ ਸ਼ਰਤ ਸਹੀ ਹੋਵੇ ਅਤੇ ਸੱਜੇ ਪਾਸੇ ਦੀ ਸ਼ਰਤ ਵੀ ਸਹੀ ਹੋਵੇ, ਤਾਂ ਹੀ ਪੂਰੀ ਸ਼ਰਤ ਸਹੀ ਹੁੰਦੀ ਹੈ।

ਇਸ ਲਈ, ਸਿਰਫ਼ ਉਸ ਵੇਲੇ ਜਦੋਂ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਖਾਲੀ ਹੋਣ, ਇਹ ਕੋਡ ਚੱਲੇਗਾ।

## ਯੂਜ਼ਰ ਨੇ ਸਿਰਫ਼ ਕੁਝ ਹਿੱਸਾ ਭਰਿਆ ਹੈ

ਅਗਲੇ ਕਦਮ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ ਹੋਰ ਸਥਿਤੀ ਵੇਖਦੇ ਹਾਂ: ਯੂਜ਼ਰ ਨੇ ਸਿਰਫ਼ ਯੂਜ਼ਰਨੇਮ ਭਰਿਆ ਹੈ, ਜਾਂ ਸਿਰਫ਼ ਪਾਸਵਰਡ ਭਰਿਆ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

ਇਸ ਵੇਲੇ, ਯੂਜ਼ਰਨੇਮ ਖਾਲੀ ਨਹੀਂ, ਪਰ ਪਾਸਵਰਡ ਖਾਲੀ ਹੈ।

ਅਸੀਂ ਇਸਨੂੰ ਜਾਂਚਣ ਲਈ `isEmpty` ਵਰਤਣਾ ਜਾਰੀ ਰੱਖ ਸਕਦੇ ਹਾਂ:

### ਯੂਜ਼ਰ ਨੇ ਖਾਤਾ ਜਾਂ ਪਾਸਵਰਡ ਭਰਿਆ ਹੋਵੇ ਉਸਦੀ ਸਥਿਤੀ

ਜੇ ਯੂਜ਼ਰ ਨੇ ਸਿਰਫ਼ ਯੂਜ਼ਰਨੇਮ ਜਾਂ ਪਾਸਵਰਡ ਭਰਿਆ ਹੋਵੇ, ਤਾਂ ਸਾਨੂੰ ਉਸਦੇ ਅਨੁਸਾਰ ਗੁੰਮ ਚੀਜ਼ ਦੀ ਸੂਚਨਾ ਦੇਣੀ ਪਵੇਗੀ।

ਉਦਾਹਰਨ ਵਜੋਂ, ਜੇ ਯੂਜ਼ਰ ਨੇ ਸਿਰਫ਼ ਯੂਜ਼ਰਨੇਮ ਭਰਿਆ ਹੋਵੇ:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ਇਸ ਕੋਡ ਦੀ logic ਇਹ ਹੈ: ਜੇ ਯੂਜ਼ਰਨੇਮ ਖਾਲੀ ਹੈ, ਤਾਂ ਯੂਜ਼ਰਨੇਮ ਭਰਨ ਲਈ ਕਹੋ। ਨਹੀਂ ਤਾਂ, ਜਾਂਚੋ ਕਿ ਪਾਸਵਰਡ ਖਾਲੀ ਹੈ ਜਾਂ ਨਹੀਂ; ਜੇ ਪਾਸਵਰਡ ਖਾਲੀ ਹੋਵੇ, ਤਾਂ ਪਾਸਵਰਡ ਭਰਨ ਲਈ ਕਹੋ।

### ਯੂਜ਼ਰ ਨੇ ਸਾਰੀ ਜਾਣਕਾਰੀ ਭਰੀ ਹੋਵੇ

ਜੇ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਭਰੇ ਹੋਏ ਹਨ, ਤਾਂ ਉਨ੍ਹਾਂ ਦਾ `isEmpty` ਦੋਵੇਂ ਲਈ `false` ਵਾਪਸ ਕਰੇਗਾ।

ਇਸ ਵੇਲੇ, ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

ਇੱਥੇ `!` ਦਾ ਮਤਲਬ "ਉਲਟ" ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

ਅਰਥਾਤ, `user.isEmpty` "ਯੂਜ਼ਰਨੇਮ ਖਾਲੀ ਹੈ ਜਾਂ ਨਹੀਂ" ਦੀ ਜਾਂਚ ਕਰਦਾ ਹੈ, ਜਦਕਿ `!user.isEmpty` "ਯੂਜ਼ਰਨੇਮ ਖਾਲੀ ਨਹੀਂ ਹੈ" ਦੀ ਜਾਂਚ ਕਰਦਾ ਹੈ।

ਪਾਸਵਰਡ ਲਈ ਵੀ ਇਹੋ ਜਿਹੀ logic ਹੈ।

ਇਸ ਲਈ, ਇਸ ਕੋਡ ਦਾ ਅਰਥ ਹੈ: ਯੂਜ਼ਰਨੇਮ ਖਾਲੀ ਨਹੀਂ ਹੈ, ਅਤੇ ਪਾਸਵਰਡ ਵੀ ਖਾਲੀ ਨਹੀਂ ਹੈ।

ਜਦੋਂ ਇਹ ਦੋਵੇਂ ਸ਼ਰਤਾਂ ਪੂਰੀਆਂ ਹੁੰਦੀਆਂ ਹਨ, ਤਾਂ ਇਹ ਆਉਟਪੁਟ ਹੁੰਦਾ ਹੈ:

```swift
Success
```

## ਪੂਰੀ validation logic

ਹੁਣ ਅਸੀਂ ਇਹ ਤਿੰਨੋਂ ਸਥਿਤੀਆਂ ਨੂੰ ਇਕੱਠਿਆਂ ਜੋੜਕੇ `Button` ਵਿੱਚ ਲਿਖਦੇ ਹਾਂ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

ਇਸ ਕੋਡ ਦੀ execution order ਨੂੰ ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹਾਂ:

ਪਹਿਲਾ ਕਦਮ, ਪਹਿਲਾਂ ਇਹ ਜਾਂਚੋ:

```swift
if user.isEmpty && password.isEmpty
```

ਜੇ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਖਾਲੀ ਹਨ, ਤਾਂ ਸਿੱਧਾ `Empty` ਆਉਟਪੁਟ ਕਰੋ।

ਜੇ ਦੋਵੇਂ ਖਾਲੀ ਨਾ ਹੋਣ, ਤਾਂ ਅਗਲੀ ਲਾਈਨ ਜਾਂਚੀ ਜਾਂਦੀ ਹੈ:

```swift
else if user.isEmpty || password.isEmpty
```

ਇੱਥੇ `||` ਦਾ ਅਰਥ "ਜਾਂ" ਹੈ।

ਅਰਥਾਤ, ਜਿਵੇਂ ਹੀ ਇੱਕ ਸ਼ਰਤ ਵੀ ਸਹੀ ਹੋਵੇ, ਪੂਰੀ ਸ਼ਰਤ ਸਹੀ ਮੰਨੀ ਜਾਂਦੀ ਹੈ।

ਇਸ ਲਈ, ਜਦ ਤੱਕ ਯੂਜ਼ਰਨੇਮ ਖਾਲੀ ਹੈ, ਜਾਂ ਪਾਸਵਰਡ ਖਾਲੀ ਹੈ, `else if` ਵਾਲਾ ਕੋਡ ਬਲਾਕ ਚੱਲੇਗਾ।

ਕੋਡ ਬਲਾਕ ਵਿੱਚ ਦਾਖਲ ਹੋਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ ਹੋਰ ਜਾਂਚਦੇ ਹਾਂ ਕਿ ਅਸਲ ਵਿੱਚ ਕਿਹੜਾ ਇਨਪੁਟ ਬਾਕਸ ਨਹੀਂ ਭਰਿਆ ਗਿਆ:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ਜੇ ਪਹਿਲੀਆਂ ਦੋ ਸ਼ਰਤਾਂ ਪੂਰੀਆਂ ਨਹੀਂ ਹੁੰਦੀਆਂ, ਤਾਂ ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਯੂਜ਼ਰਨੇਮ ਖਾਲੀ ਨਹੀਂ ਅਤੇ ਪਾਸਵਰਡ ਵੀ ਖਾਲੀ ਨਹੀਂ।

ਫਿਰ program ਆਖਰੀ `else` ਵਿੱਚ ਦਾਖਲ ਹੁੰਦਾ ਹੈ:

```swift
print("Success")
```

ਇਸ ਤਰ੍ਹਾਂ ਅਸੀਂ ਸਭ ਤੋਂ ਬੁਨਿਆਦੀ ਲਾਗਇਨ ਇਨਪੁਟ validation logic ਪੂਰੀ ਕਰ ਲੈਂਦੇ ਹਾਂ।

## ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੀ ਜਾਂਚ

ਉਪਰੋਕਤ logic ਸਿਰਫ਼ ਇਹ ਜਾਂਚਦੀ ਹੈ ਕਿ "ਕੋਈ ਸਮੱਗਰੀ ਭਰੀ ਗਈ ਹੈ ਜਾਂ ਨਹੀਂ"।

ਪਰ ਅਸਲ App ਵਿੱਚ ਸਿਰਫ਼ ਸਮੱਗਰੀ ਭਰਨਾ ਕਾਫੀ ਨਹੀਂ ਹੁੰਦਾ। ਆਮ ਤੌਰ 'ਤੇ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਸਰਵਰ ਨੂੰ ਭੇਜ ਕੇ verify ਵੀ ਕਰਨੇ ਪੈਂਦੇ ਹਨ।

ਜੇ ਸਰਵਰ ਇਹ ਪੁਸ਼ਟੀ ਕਰੇ ਕਿ ਯੂਜ਼ਰਨੇਮ ਮੌਜੂਦ ਹੈ ਅਤੇ ਪਾਸਵਰਡ ਸਹੀ ਹੈ, ਤਾਂ ਲਾਗਇਨ ਦੀ ਇਜਾਜ਼ਤ ਮਿਲੇਗੀ; ਨਹੀਂ ਤਾਂ ਲਾਗਇਨ ਫੇਲ ਹੋਣ ਦੀ ਸੂਚਨਾ ਦਿੱਤੀ ਜਾਵੇਗੀ।

ਇਸ ਪ੍ਰਕਿਰਿਆ ਦੀ ਅਭਿਆਸ ਲਈ, ਅਸੀਂ ਪਹਿਲਾਂ ਕੋਡ ਵਿੱਚ ਇੱਕ ਅਸਥਾਈ account ਅਤੇ password ਸੈੱਟ ਕਰ ਸਕਦੇ ਹਾਂ, ਜੋ "ਸਹੀ ਲਾਗਇਨ ਜਾਣਕਾਰੀ" ਦੀ ਨਕਲ ਕਰਦੇ ਹਨ:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

ਜਦੋਂ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਖਾਲੀ ਨਾ ਹੋਣ, ਤਾਂ ਅੱਗੇ ਅਸੀਂ ਇਹਨਾਂ ਦੀ ਤੁਲਨਾ ਕਰ ਸਕਦੇ ਹਾਂ ਕਿ ਇਹ ਸਹੀ ਹਨ ਜਾਂ ਨਹੀਂ:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

ਇੱਥੇ `==` ਦਾ ਅਰਥ "ਬਰਾਬਰ ਹੈ ਜਾਂ ਨਹੀਂ" ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
user == userID
```

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਯੂਜ਼ਰ ਦੁਆਰਾ ਦਰਜ ਕੀਤਾ ਯੂਜ਼ਰਨੇਮ, ਸਾਡੇ ਦੁਆਰਾ ਸੈੱਟ ਕੀਤੇ ਸਹੀ ਯੂਜ਼ਰਨੇਮ ਨਾਲ ਪੂਰੀ ਤਰ੍ਹਾਂ ਮਿਲਦਾ ਹੈ ਜਾਂ ਨਹੀਂ। ਪਾਸਵਰਡ ਲਈ ਵੀ ਇਹੋ logic ਲਾਗੂ ਹੁੰਦੀ ਹੈ।

ਇਸ ਲਈ, ਜਦੋਂ ਦਰਜ ਕੀਤਾ ਗਿਆ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਸੈੱਟ ਕੀਤੀਆਂ values ਦੇ ਬਰਾਬਰ ਹੁੰਦੇ ਹਨ, ਤਾਂ `Success` ਆਉਟਪੁਟ ਹੁੰਦਾ ਹੈ; ਜਿਵੇਂ ਹੀ ਕੋਈ ਇੱਕ value ਵੀ ਬਰਾਬਰ ਨਾ ਹੋਵੇ, `Input error` ਆਉਟਪੁਟ ਹੁੰਦਾ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ, ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ "ਨਕਲੀ ਲਾਗਇਨ verification" ਪੂਰੀ ਕਰ ਲੈਂਦੇ ਹਾਂ।

ਭਾਵੇਂ ਇਹ ਹਾਲੇ ਵੀ ਸਰਵਰ ਨਾਲ ਜੁੜਿਆ ਅਸਲੀ ਲਾਗਇਨ ਫੀਚਰ ਨਹੀਂ ਹੈ, ਪਰ ਇਹ ਸਾਨੂੰ ਸਮਝਣ ਲਈ ਕਾਫੀ ਹੈ: **ਬਟਨ click ਹੋਣ ਤੋਂ ਬਾਅਦ, ਵੱਖ-ਵੱਖ ਸ਼ਰਤਾਂ ਦੇ ਆਧਾਰ 'ਤੇ ਵੱਖਰੇ ਕੋਡ ਚਲਾਏ ਜਾ ਸਕਦੇ ਹਨ**।

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਬੁਨਿਆਦੀ ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼ ਪੂਰਾ ਕੀਤਾ ਅਤੇ ਖਾਸ ਤੌਰ 'ਤੇ "ਸ਼ਰਤਾਂ ਦੇ ਆਧਾਰ 'ਤੇ ਇਨਪੁਟ ਸਮੱਗਰੀ ਦਾ ਨਿਰਣੇ ਕਰਨ ਵਾਲੀ logic" ਸਿੱਖੀ।

ਇਸ ਪਾਠ ਦਾ ਮੁੱਖ ਸਮੱਗਰੀ ਇਹ ਹੈ: string ਖਾਲੀ ਹੈ ਜਾਂ ਨਹੀਂ ਇਹ ਜਾਂਚਣ ਲਈ `isEmpty` ਵਰਤਣਾ, ਅਤੇ ਵੱਖ-ਵੱਖ ਸਥਿਤੀਆਂ ਨੂੰ ਸੰਭਾਲਣ ਲਈ `if` statement ਨੂੰ logical operators ਨਾਲ ਮਿਲਾ ਕੇ ਵਰਤਣਾ।

ਇਨ੍ਹਾਂ ਵਿੱਚੋਂ ਦੋ ਬਹੁਤ ਮਹੱਤਵਪੂਰਨ logical operators ਇਹ ਹਨ:

- `&&`：ਇਸਦਾ ਅਰਥ "ਅਤੇ" ਹੈ, ਦੋਵੇਂ ਸ਼ਰਤਾਂ ਪੂਰੀਆਂ ਹੋਣੀਆਂ ਲਾਜ਼ਮੀ ਹਨ
- `||`：ਇਸਦਾ ਅਰਥ "ਜਾਂ" ਹੈ, ਸਿਰਫ਼ ਇੱਕ ਸ਼ਰਤ ਪੂਰੀ ਹੋਵੇ ਤਾਂ ਵੀ ਚੱਲਦਾ ਹੈ

ਜਦੋਂ ਇਹ ਸ਼ਰਤਾਂ ਆਖਿਰਕਾਰ `true` ਜਾਂ `false` ਬਣਦੀਆਂ ਹਨ, ਤਾਂ `if` statement ਨਤੀਜੇ ਦੇ ਆਧਾਰ 'ਤੇ ਵੱਖ-ਵੱਖ ਕੋਡ ਚਲਾਉਂਦੀ ਹੈ।

ਇਸ ਸਾਈਨ ਇਨ ਦ੍ਰਿਸ਼ ਰਾਹੀਂ ਅਸੀਂ ਪਹਿਲਾਂ ਹੀ "interface + data + logical judgment" ਨੂੰ ਜੋੜਨ ਵਾਲੇ development ਤਰੀਕੇ ਨਾਲ ਪਰੀਚਿਤ ਹੋਣ ਲੱਗ ਪਏ ਹਾਂ।

## ਪੂਰਾ ਕੋਡ

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
