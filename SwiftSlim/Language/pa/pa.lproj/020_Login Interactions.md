# ਲੋਗਇਨ ਇੰਟਰੈਕਸ਼ਨ

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਲੋਗਇਨ ਵਿਊ ਬਣਾਈ ਸੀ, ਅਤੇ ਬਟਨਾਂ ਅਤੇ ਸ਼ਰਤੀ ਲਾਜਿਕ ਦੀ ਮਦਦ ਨਾਲ ਇਨਪੁੱਟ ਕੀਤੀ ਸਮੱਗਰੀ ਦੀ ਸਧਾਰਣ ਜਾਂਚ ਕੀਤੀ ਸੀ।

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਪਿਛਲੇ ਪਾਠ ਦੇ ਕੋਡ ਨੂੰ ਅੱਗੇ ਵਧਾਉਂਦੇ ਹੋਏ `SecureField` ਪਾਸਵਰਡ ਇਨਪੁੱਟ ਫੀਲਡ, `Alert` ਚੇਤਾਵਨੀ ਬਾਕਸ, ਅਤੇ ਵੈਰੀਏਬਲਾਂ ਦੇ ਆਧਾਰ 'ਤੇ ਵੱਖ-ਵੱਖ ਵਿਊਜ਼ ਕਿਵੇਂ ਦਿਖਾਉਣੀਆਂ ਹਨ, ਇਹ ਸਿੱਖਾਂਗੇ।

ਇਸ ਪਾਠ ਰਾਹੀਂ ਤੁਸੀਂ ਲੋਗਇਨ ਵਿਊ ਦੇ ਮੁੱਢਲੇ ਇੰਟਰੈਕਸ਼ਨ ਫ਼ਲੋ ਨੂੰ ਹੋਰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹੋ। ਇਹ ਕਈ ਐਪਸ ਵਿੱਚ ਆਮ ਤੌਰ 'ਤੇ ਵਰਤੀ ਜਾਣ ਵਾਲੀ ਬੁਨਿਆਦੀ ਲਾਜਿਕ ਵੀ ਹੈ।

## ਪਾਸਵਰਡ ਇਨਪੁੱਟ ਫੀਲਡ

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਪਾਸਵਰਡ ਦਰਜ ਕਰਨ ਲਈ `TextField` ਵਰਤੀ ਸੀ।

ਪਰ ਅਸਲ ਲੋਗਇਨ ਇੰਟਰਫੇਸ ਵਿੱਚ ਪਾਸਵਰਡ ਆਮ ਤੌਰ 'ਤੇ ਸਿੱਧਾ ਨਹੀਂ ਦਿਖਾਇਆ ਜਾਂਦਾ। ਇਸ ਦੀ ਬਜਾਏ ਇਹ ਡਾਟਾਂ ਜਾਂ ਕਿਸੇ ਹੋਰ ਲੁਕਵੇਂ ਅਸਰ ਵਜੋਂ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ, ਜਿਸ ਨਾਲ ਯੂਜ਼ਰ ਦੀ ਨਿੱਜਤਾ ਸੁਰੱਖਿਅਤ ਰਹਿੰਦੀ ਹੈ।

SwiftUI ਵਿੱਚ ਪਾਸਵਰਡ ਦਰਜ ਕਰਨ ਲਈ ਖਾਸ ਤੌਰ 'ਤੇ ਵਰਤਿਆ ਜਾਣ ਵਾਲਾ ਕੰਟਰੋਲ `SecureField` ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
SecureField("Password", text: $password)
```

ਇਸ ਦੀ ਲਿਖਤ `TextField` ਨਾਲ ਬਹੁਤ ਮਿਲਦੀ ਹੈ। ਇਸਨੂੰ ਵੀ ਇੱਕ ਸੰਕੇਤਕ ਟੈਕਸਟ ਅਤੇ ਇੱਕ ਬਾਊਂਡ ਵੈਰੀਏਬਲ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

ਇਸਨੂੰ ਸਧਾਰਣ ਤਰੀਕੇ ਨਾਲ ਇਉਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: `SecureField` ਵੀ ਇੱਕ ਇਨਪੁੱਟ ਫੀਲਡ ਹੀ ਹੈ, ਫ਼ਰਕ ਇਹ ਹੈ ਕਿ ਇਹ ਦਰਜ ਕੀਤੀ ਸਮੱਗਰੀ ਨੂੰ ਲੁਕਾ ਦਿੰਦੀ ਹੈ।

ਅਸੀਂ ਪਹਿਲਾਂ ਪਾਸਵਰਡ ਲਈ ਵਰਤੀ ਜਾਣ ਵਾਲੀ `TextField` ਨੂੰ ਸਿੱਧਾ `SecureField` ਨਾਲ ਬਦਲ ਸਕਦੇ ਹਾਂ:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ਜਦੋਂ ਯੂਜ਼ਰ ਪਾਸਵਰਡ ਦਰਜ ਕਰੇਗਾ, ਤਾਂ ਇੰਟਰਫੇਸ 'ਤੇ ਪਾਸਵਰਡ ਦੀ ਸਮੱਗਰੀ ਸਿੱਧੀ ਨਹੀਂ ਦਿਖੇਗੀ।

ਦਿਖਾਵੇ ਦਾ ਅਸਰ:

![password](../../Resource/020_password.png)

ਹੁਣ ਅਸੀਂ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦਰਜ ਕਰ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਫਿਰ ਬਟਨ 'ਤੇ ਕਲਿੱਕ ਕਰਕੇ ਜਾਂਚ ਸਕਦੇ ਹਾਂ ਕਿ ਇਨਪੁੱਟ ਸਹੀ ਹੈ ਜਾਂ ਨਹੀਂ।

### ਫੀਡਬੈਕ ਸੁਨੇਹੇ ਦਿਖਾਉਣਾ

ਇਸ ਤੋਂ ਪਹਿਲਾਂ ਅਸੀਂ ਨਤੀਜਿਆਂ ਨੂੰ ਦਿਖਾਉਣ ਲਈ ਲਗਾਤਾਰ `print` ਵਰਤ ਰਹੇ ਸੀ।

`print` ਦੀ ਸਮੱਗਰੀ ਸਿਰਫ਼ ਕਨਸੋਲ ਵਿੱਚ ਦਿਖਾਈ ਦਿੰਦੀ ਹੈ। ਜਦੋਂ ਡਿਵੈਲਪਰ Xcode ਵਿੱਚ ਪ੍ਰੋਗਰਾਮ ਚਲਾਉਂਦਾ ਹੈ ਤਾਂ ਉਹ ਇਸਨੂੰ ਵੇਖ ਸਕਦਾ ਹੈ, ਪਰ ਫੋਨ ਉੱਤੇ ਆਮ ਯੂਜ਼ਰ ਇਹ ਸੁਨੇਹੇ ਨਹੀਂ ਵੇਖ ਸਕਦੇ।

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਭਾਵੇਂ ਪ੍ਰੋਗਰਾਮ ਜਾਂਚ ਪੂਰੀ ਕਰ ਚੁੱਕਿਆ ਹੋਵੇ, ਯੂਜ਼ਰ ਨੂੰ ਫਿਰ ਵੀ ਨਹੀਂ ਪਤਾ ਲੱਗਦਾ ਕਿ ਉਸ ਦੀ ਇਨਪੁੱਟ ਸਹੀ ਹੈ ਜਾਂ ਨਹੀਂ।

ਇਸ ਵੇਲੇ ਸਾਨੂੰ ਇੱਕ ਐਸੀ ਵਿਧੀ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ ਜੋ ਸੁਨੇਹੇ ਸਿੱਧੇ ਇੰਟਰਫੇਸ 'ਤੇ ਦਿਖਾ ਸਕੇ।

## Alert ਚੇਤਾਵਨੀ ਬਾਕਸ

SwiftUI ਵਿੱਚ ਅਸੀਂ `Alert` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇੱਕ ਪੌਪ-ਅੱਪ ਸੁਨੇਹਾ ਬਾਕਸ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

ਮੁੱਢਲਾ ਵਰਤੋਂ ਤਰੀਕਾ:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

ਇਹ ਕੋਡ ਪਹਿਲਾਂ ਦੇ ਕੰਟਰੋਲਾਂ ਨਾਲੋਂ ਕੁਝ ਜ਼ਿਆਦਾ ਜਟਿਲ ਲੱਗਦਾ ਹੈ, ਪਰ ਅਸੀਂ ਇਸਨੂੰ ਹਿੱਸਿਆਂ ਵਿੱਚ ਵੰਡ ਕੇ ਸਮਝ ਸਕਦੇ ਹਾਂ।

`Alert` ਵਿੱਚ ਮੁੱਖ ਤੌਰ 'ਤੇ ਹੇਠਲੇ ਭਾਗ ਹੁੰਦੇ ਹਨ:

- `"Title"`: ਚੇਤਾਵਨੀ ਬਾਕਸ ਦਾ ਸਿਰਲੇਖ
- `isPresented`: ਇੱਕ ਬਾਊਂਡ ਬੂਲੀਅਨ ਮੁੱਲ, ਜੋ ਇਹ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ ਕਿ ਚੇਤਾਵਨੀ ਬਾਕਸ ਦਿਖੇ ਜਾਂ ਨਹੀਂ
- `Button(...)`: ਚੇਤਾਵਨੀ ਬਾਕਸ ਦੇ ਅੰਦਰ ਵਾਲਾ ਬਟਨ
- `message:`: ਚੇਤਾਵਨੀ ਬਾਕਸ ਵਿੱਚ ਦਿਖਾਈ ਜਾਣ ਵਾਲੀ ਸੁਨੇਹਾ ਸਮੱਗਰੀ

ਇਸਨੂੰ ਸੌਖੇ ਤਰੀਕੇ ਨਾਲ ਇਉਂ ਸਮਝੋ: ਜਦੋਂ ਬਾਊਂਡ ਵੈਰੀਏਬਲ `true` ਬਣ ਜਾਂਦੀ ਹੈ, ਸਿਸਟਮ ਇਹ ਚੇਤਾਵਨੀ ਬਾਕਸ ਦਿਖਾਉਂਦਾ ਹੈ।

ਦਿਖਾਵੇ ਦਾ ਅਸਰ:

![alert](../../Resource/020_alert3.png)

ਸੰਬੰਧਿਤ ਬਣਤਰ:

![alert](../../Resource/020_alert.png)

### Alert ਇੱਕ ਮੋਡੀਫਾਇਰ ਹੈ

ਜਿਵੇਂ ਅਸੀਂ ਪਹਿਲਾਂ ਕਈ ਹੋਰ ਮੋਡੀਫਾਇਰ ਸਿੱਖੇ ਹਨ, `Alert` ਵੀ ਕਿਸੇ ਵਿਊ ਦੇ ਪਿੱਛੇ ਜੋੜਿਆ ਜਾਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਇਹ ਬਟਨ ਦੇ ਬਾਅਦ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

ਇਹ ਬਾਹਰੀ `VStack` ਦੇ ਬਾਅਦ ਵੀ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
VStack {
    // ...
}
.alert() {...}
```

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ `Alert` ਕੋਈ ਅਲੱਗ ਖੜ੍ਹੀ ਵਿਊ ਨਹੀਂ ਹੈ ਜੋ ਇੰਟਰਫੇਸ ਵਿੱਚ ਆਪਣੇ ਆਪ ਰੱਖੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਦੀ ਬਜਾਏ, ਇਹ ਕਿਸੇ ਖਾਸ ਵਿਊ ਨਾਲ ਜੁੜਿਆ ਹੋਇਆ ਮੋਡੀਫਾਇਰ ਹੈ।

ਇਸਨੂੰ ਸਧਾਰਣ ਤਰੀਕੇ ਨਾਲ ਇਉਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: `Alert` ਆਮ ਤੌਰ 'ਤੇ ਬਟਨ ਜਾਂ ਬਾਹਰੀ ਲੇਆਉਟ ਤੋਂ ਬਾਅਦ ਲਿਖੀ ਜਾਂਦੀ ਹੈ, ਤਾਂ ਜੋ ਕਿਸੇ ਖਾਸ ਸ਼ਰਤ ਦੇ ਪੂਰਾ ਹੋਣ 'ਤੇ ਸੁਨੇਹਾ ਦਿਖਾਇਆ ਜਾ ਸਕੇ।

### Alert ਦਿਖਾਉਣਾ

ਜੇ ਅਸੀਂ `Alert` ਦਿਖਾਉਣੀ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਇਸਨੂੰ ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਇੱਕ ਵੈਰੀਏਬਲ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
@State private var showAlert = false
```

ਇਹ ਵੈਰੀਏਬਲ `Bool` ਕਿਸਮ ਦੀ ਹੈ, ਯਾਨੀ ਇਸਦੇ ਸਿਰਫ਼ ਦੋ ਮੁੱਲ ਹਨ: `true` ਜਾਂ `false`।

ਫਿਰ ਇਸਨੂੰ `Alert` ਦੀ `isPresented` ਨਾਲ ਬਾਈਂਡ ਕਰੋ:

```swift
isPresented: $showAlert
```

ਜਦੋਂ `showAlert` `false` ਹੋਵੇਗੀ, ਚੇਤਾਵਨੀ ਬਾਕਸ ਨਹੀਂ ਦਿਖੇਗਾ। ਜਦੋਂ `showAlert` `true` ਹੋਵੇਗੀ, ਚੇਤਾਵਨੀ ਬਾਕਸ ਪੌਪ-ਅੱਪ ਹੋ ਜਾਏਗਾ।

### ਬਟਨ ਰਾਹੀਂ ਚੇਤਾਵਨੀ ਬਾਕਸ ਦਿਖਾਉਣਾ

ਹੁਣ ਆਓ ਪਹਿਲਾਂ ਸਭ ਤੋਂ ਸਧਾਰਣ ਹਾਲਾਤ ਨੂੰ ਲਾਗੂ ਕਰੀਏ:

ਜਦੋਂ ਯੂਜ਼ਰ ਕੁਝ ਵੀ ਦਰਜ ਨਾ ਕਰੇ ਅਤੇ ਸਿੱਧਾ `Sign in` ਬਟਨ 'ਤੇ ਕਲਿੱਕ ਕਰੇ, ਤਾਂ ਇੱਕ ਸੁਨੇਹਾ ਬਾਕਸ ਦਿਖੇ ਜੋ ਦੱਸੇ ਕਿ ਤੁਸੀਂ ਹਾਲੇ ਕੋਈ ਵੀ ਸਮੱਗਰੀ ਦਰਜ ਨਹੀਂ ਕੀਤੀ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਇਸ ਸੁਨੇਹਾ ਬਾਕਸ ਨੂੰ ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਇੱਕ ਵੈਰੀਏਬਲ ਬਣਾਓ:

```swift
@State private var showEmpty = false
```

ਫਿਰ `Button` ਦੇ ਬਾਅਦ ਇੱਕ `Alert` ਸ਼ਾਮਲ ਕਰੋ:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

ਅਗਲਾ ਕਦਮ, ਬਟਨ ਕਲਿੱਕ ਦੇ ਕੋਡ ਵਿੱਚ ਜਾਂਚ ਕਰੋ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

ਜੇ `user` ਅਤੇ `password` ਦੋਵੇਂ ਖਾਲੀ ਹਨ, ਤਾਂ `showEmpty` ਨੂੰ `true` ਕਰ ਦਿਓ।

ਕਿਉਂਕਿ `Alert` ਇਸ ਵੈਰੀਏਬਲ ਨਾਲ ਬਾਈਂਡ ਹੈ, ਜਿਵੇਂ ਹੀ ਇਹ `true` ਬਣੇਗੀ, ਸਿਸਟਮ ਆਪਣੇ ਆਪ ਚੇਤਾਵਨੀ ਬਾਕਸ ਦਿਖਾ ਦੇਵੇਗਾ।

ਦਿਖਾਵੇ ਦਾ ਅਸਰ:

![alert](../../Resource/020_alert1.png)

ਇਸ ਤਰ੍ਹਾਂ ਯੂਜ਼ਰ ਬਟਨ 'ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੋਂ ਬਾਅਦ ਤੁਰੰਤ ਸੁਨੇਹਾ ਵੇਖ ਸਕਦਾ ਹੈ, ਅਤੇ ਡਿਵੈਲਪਰ ਨੂੰ ਕਨਸੋਲ ਵਿੱਚ `print` ਆਉਟਪੁੱਟ ਵੇਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਪੈਂਦੀ।

### ਬਟਨ ਅਤੇ ਚੇਤਾਵਨੀ ਬਾਕਸਾਂ ਨੂੰ ਹੋਰ ਸੁਧਾਰਨਾ

ਇਸ ਤੋਂ ਪਹਿਲਾਂ ਅਸੀਂ ਸਿਰਫ਼ “ਕੁਝ ਵੀ ਨਾ ਭਰਨ” ਵਾਲੇ ਹਾਲਾਤ ਨੂੰ ਹੀ ਸੰਭਾਲਿਆ ਸੀ।

ਸਾਨੂੰ ਹੇਠਲੀਆਂ ਸਥਿਤੀਆਂ ਵੀ ਸੰਭਾਲਣੀਆਂ ਹਨ:

- ਯੂਜ਼ਰਨੇਮ ਨਾ ਭਰਿਆ ਹੋਣਾ
- ਪਾਸਵਰਡ ਨਾ ਭਰਿਆ ਹੋਣਾ
- ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਭਰੇ ਹੋਣ, ਪਰ ਇਨਪੁੱਟ ਗਲਤ ਹੋਵੇ

ਇਸ ਲਈ ਸਾਨੂੰ ਇਨ੍ਹਾਂ ਹਾਲਾਤਾਂ ਲਈ ਵੱਖ-ਵੱਖ ਸੁਨੇਹੇ ਵੀ ਤਿਆਰ ਕਰਨੇ ਹਨ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਤਿੰਨ ਨਵੇਂ ਵੈਰੀਏਬਲ ਸ਼ਾਮਲ ਕਰੋ:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

ਫਿਰ ਬਟਨ ਦੇ ਬਾਅਦ ਸੰਬੰਧਿਤ `Alert` ਲਗਾਤਾਰ ਸ਼ਾਮਲ ਕਰੋ:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

ਅਗਲੇ ਪੜਾਅ ਵਿੱਚ, ਬਟਨ ਦੇ ਅੰਦਰ ਫੈਸਲਾ ਲਾਜਿਕ ਨੂੰ ਪੂਰਾ ਕਰੋ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

ਜਦੋਂ ਬਟਨ ਇਹ ਤੈਅ ਕਰਦਾ ਹੈ ਕਿ ਯੂਜ਼ਰ ਨੇ ਕੋਈ ਜਾਣਕਾਰੀ ਨਹੀਂ ਭਰੀ, ਇੱਕ ਜਾਣਕਾਰੀ ਛੱਡ ਦਿੱਤੀ, ਜਾਂ ਇਨਪੁੱਟ ਵੈਰੀਫ਼ਿਕੇਸ਼ਨ ਫੇਲ ਹੋਈ, ਤਾਂ ਸੰਬੰਧਿਤ ਬੂਲੀਅਨ ਵੈਰੀਏਬਲ `true` ਬਣ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਫਿਰ ਸੰਬੰਧਿਤ `Alert` ਦਿਖਾਈ ਦਿੰਦੀ ਹੈ।

ਇੱਥੇ ਮੈਂ ਸਿਫ਼ਾਰਸ਼ ਕਰਦਾ ਹਾਂ ਕਿ ਤੁਸੀਂ ਖੁਦ ਕੁਝ ਹਾਲਾਤ ਟੈਸਟ ਕਰੋ:

- ਕੁਝ ਵੀ ਨਾ ਭਰੋ
- ਸਿਰਫ਼ ਯੂਜ਼ਰਨੇਮ ਭਰੋ
- ਸਿਰਫ਼ ਪਾਸਵਰਡ ਭਰੋ
- ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਭਰੋ, ਪਰ ਸਮੱਗਰੀ ਗਲਤ ਹੋਵੇ
- ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਭਰੋ, ਅਤੇ ਸਮੱਗਰੀ ਸਹੀ ਹੋਵੇ

ਇਸ ਨਾਲ ਇਹ ਪਰਖਣ ਵਿੱਚ ਮਦਦ ਮਿਲਦੀ ਹੈ ਕਿ ਸਾਡੇ ਕੋਡ ਵਿੱਚ ਕੋਈ ਸਮੱਸਿਆ ਤਾਂ ਨਹੀਂ। ਇਹ ਐਪ ਡਿਵੈਲਪਮੈਂਟ ਵਿੱਚ ਇੱਕ ਬਹੁਤ ਮਹੱਤਵਪੂਰਨ “ਟੈਸਟਿੰਗ” ਕਦਮ ਵੀ ਹੈ।

ਜੇ ਕਿਸੇ ਹਾਲਾਤ ਵਿੱਚ ਪ੍ਰੋਗਰਾਮ ਗਲਤ ਵਿਹਾਰ ਕਰੇ, ਤਾਂ ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਲਾਜਿਕ ਵਿੱਚ ਕੋਈ ਸਮੱਸਿਆ ਹੋ ਸਕਦੀ ਹੈ, ਅਤੇ ਪ੍ਰੋਗਰਾਮ ਵਿੱਚ `Bug` ਆ ਗਿਆ ਹੈ।

ਡਿਵੈਲਪਮੈਂਟ ਵਿੱਚ ਆਮ ਤੌਰ 'ਤੇ `Bug` ਦਾ ਅਰਥ ਗਲਤੀ, ਖਾਮੀ ਜਾਂ ਉਮੀਦ ਦੇ ਉਲਟ ਵਿਹਾਰ ਹੁੰਦਾ ਹੈ।

## ਲੋਗਇਨ ਵਿਊ ਨੂੰ ਪੂਰਾ ਕਰਨਾ

ਜਿਨ੍ਹਾਂ `Alert` ਉਦਾਹਰਨਾਂ ਬਾਰੇ ਅਸੀਂ ਪਹਿਲਾਂ ਗੱਲ ਕੀਤੀ ਸੀ, ਉਹ ਸਾਰੀਆਂ “ਇਨਪੁੱਟ ਗਲਤ ਹੋਣ” 'ਤੇ ਯੂਜ਼ਰ ਨੂੰ ਫੀਡਬੈਕ ਦੇਣ ਨਾਲ ਸੰਬੰਧਿਤ ਸਨ।

ਜਦੋਂ ਯੂਜ਼ਰ ਸਹੀ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦਰਜ ਕਰਦਾ ਹੈ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ “ਚੇਤਾਵਨੀ ਬਾਕਸ” ਨਹੀਂ ਦਿਖਾਉਂਦੇ। ਇਸਦੀ ਬਜਾਏ ਅਸੀਂ ਸਿੱਧੇ ਲੋਗਇਨ ਤੋਂ ਬਾਅਦ ਵਾਲੇ ਇੰਟਰਫੇਸ ਵਿੱਚ ਦਾਖਲ ਹੋ ਜਾਂਦੇ ਹਾਂ।

ਇਸ ਵਿੱਚ ਇੱਕ ਬਹੁਤ ਮਹੱਤਵਪੂਰਨ ਧਾਰਨਾ ਸ਼ਾਮਲ ਹੈ: **ਵੈਰੀਏਬਲ ਦੇ ਮੁੱਲ ਦੇ ਆਧਾਰ 'ਤੇ ਵੱਖ-ਵੱਖ ਵਿਊਜ਼ ਦਿਖਾਉਣਾ।**

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

ਇੱਥੇ ਅਸੀਂ ਇਹ ਪ੍ਰਬੰਧਨ ਕਰਨ ਲਈ `Bool` ਕਿਸਮ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਾਂ ਕਿ ਕਿਹੜੀ ਵਿਊ ਦਿਖਾਈ ਜਾਵੇ:

- ਜੇ `login` `true` ਹੈ, ਤਾਂ ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਲੋਗਇਨ ਸਫਲ ਹੋ ਚੁੱਕਾ ਹੈ ਅਤੇ ਲੋਗਇਨ ਤੋਂ ਬਾਅਦ ਦੀ ਸਮੱਗਰੀ ਦਿਖਾਈ ਜਾਵੇਗੀ
- ਜੇ `login` `false` ਹੈ, ਤਾਂ ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਲੋਗਇਨ ਸਫਲ ਨਹੀਂ ਹੋਇਆ ਅਤੇ ਲੋਗਇਨ ਇੰਟਰਫੇਸ ਦਿਖਾਈ ਦਿੰਦਾ ਰਹੇਗਾ।

ਭਾਵੇਂ `if` ਸਟੇਟਮੈਂਟ Swift ਵਿੱਚ ਇੱਕ ਸ਼ਰਤੀ ਕਥਨ ਹੈ, ਪਰ SwiftUI ਦੇ `body` ਵਿੱਚ ਇਸਨੂੰ ਵਿਊਜ਼ ਦੀ ਡਿਸਪਲੇ ਲਾਜਿਕ ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ SwiftUI ਸ਼ਰਤ ਦੇ ਨਤੀਜੇ ਦੇ ਆਧਾਰ 'ਤੇ ਤੈਅ ਕਰਦਾ ਹੈ ਕਿ ਇਸ ਵੇਲੇ ਕਿਹੜੀ ਵਿਊ ਦਿਖਾਈ ਜਾਣੀ ਚਾਹੀਦੀ ਹੈ।

ਅਸੀਂ ਇਸ ਡਿਸਪਲੇ ਲਾਜਿਕ ਨੂੰ ਮੌਜੂਦਾ `ContentView` ਵਿੱਚ ਰੱਖ ਸਕਦੇ ਹਾਂ:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// ਮੂਲ ਲੋਗਇਨ ਵਿਊ ਦਾ ਕੋਡ
		}
	}
}
```

ਇੱਥੇ ਅਸੀਂ ਇੱਕ ਨਵਾਂ ਵੈਰੀਏਬਲ `login` ਸ਼ਾਮਲ ਕੀਤਾ ਹੈ, ਜੋ ਦੱਸਦਾ ਹੈ ਕਿ ਯੂਜ਼ਰ ਸਫਲਤਾਪੂਰਵਕ ਲੋਗਇਨ ਹੋਇਆ ਹੈ ਜਾਂ ਨਹੀਂ।

ਫਿਰ ਅਸੀਂ ਪਹਿਲਾਂ ਲਿਖੀ ਹੋਈ ਲੋਗਇਨ ਵਿਊ ਦਾ ਕੋਡ `else` ਦੇ ਬਾਅਦ ਰੱਖ ਦਿੱਤਾ।

ਵਿਊ ਡਿਸਪਲੇ ਲਾਜਿਕ:

- ਜਦੋਂ `login` `false` ਹੈ, ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਲੋਗਇਨ ਹਾਲੇ ਸਫਲ ਨਹੀਂ ਹੋਇਆ, ਇਸ ਲਈ ਮੂਲ ਲੋਗਇਨ ਵਿਊ ਹੀ ਦਿਖਾਈ ਜਾਂਦੀ ਰਹੇਗੀ।
- ਜਦੋਂ `login` `true` ਹੈ, ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਲੋਗਇਨ ਸਫਲ ਹੈ। ਇਸ ਵੇਲੇ ਲੋਗਇਨ ਵਿਊ ਹੁਣ ਨਹੀਂ ਦਿਖੇਗੀ, ਅਤੇ ਇਸਦੀ ਥਾਂ `Login successful` ਦਿਖਾਇਆ ਜਾਵੇਗਾ।

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ `ContentView`, `login` ਦੇ ਮੁੱਲ ਦੇ ਅਨੁਸਾਰ ਵੱਖ-ਵੱਖ ਵਿਊ ਸਮੱਗਰੀ ਦਿਖਾਏਗਾ।

ਅਗਲਾ ਕਦਮ, ਆਓ ਬਟਨ ਦੇ ਅੰਦਰ ਲੋਗਇਨ ਸਫਲਤਾ ਲਾਜਿਕ ਨੂੰ ਸੋਧੀਏ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

ਜਦੋਂ ਯੂਜ਼ਰ ਵੱਲੋਂ ਦਰਜ ਕੀਤਾ ਗਿਆ ਯੂਜ਼ਰਨੇਮ ਅਤੇ ਪਾਸਵਰਡ ਦੋਵੇਂ ਸਹੀ ਹੁੰਦੇ ਹਨ, ਅਸੀਂ `login` ਨੂੰ `true` ਕਰ ਦਿੰਦੇ ਹਾਂ।

ਜਿਵੇਂ ਹੀ `login` ਦਾ ਮੁੱਲ ਬਦਲਦਾ ਹੈ, `ContentView` ਵਿੱਚ `if` ਜਾਂਚ ਦਾ ਨਤੀਜਾ ਵੀ ਬਦਲ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਇੰਟਰਫੇਸ ਮੂਲ ਲੋਗਇਨ ਵਿਊ ਤੋਂ `Login successful` ਵਿੱਚ ਬਦਲ ਜਾਂਦਾ ਹੈ।

ਦਿਖਾਵੇ ਦਾ ਅਸਰ ਹੇਠਾਂ ਦਿੱਤਾ ਗਿਆ ਹੈ:

![view](../../Resource/020_view.png)

ਹੁਣ ਅਸੀਂ “ਸ਼ਰਤਾਂ ਦੇ ਅਨੁਸਾਰ ਵੱਖ-ਵੱਖ ਵਿਊਜ਼ ਦਿਖਾਉਣ” ਵਾਲੀ ਸੋਚ ਨੂੰ ਇਸ ਮੌਜੂਦਾ ਲੋਗਇਨ ਪੇਜ 'ਤੇ ਅਸਲ ਵਿੱਚ ਲਾਗੂ ਕਰ ਦਿੱਤਾ ਹੈ।

ਅਸਲੀ ਐਪਸ ਵਿੱਚ ਵੀ ਆਮ ਤੌਰ 'ਤੇ ਇਹੀ ਤਰੀਕਾ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ: ਕਿਸੇ ਖਾਸ ਮੁੱਲ ਦੇ ਆਧਾਰ 'ਤੇ ਵੱਖ-ਵੱਖ ਵਿਊਜ਼ ਦਿਖਾਈਆਂ ਜਾਂਦੀਆਂ ਹਨ।

ਉਦਾਹਰਨ ਲਈ, ਜਦੋਂ ਯੂਜ਼ਰ ਲੋਗਇਨ ਨਹੀਂ ਹੁੰਦਾ, ਤਾਂ ਲੋਗਇਨ ਪੇਜ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ; ਜਦੋਂ ਯੂਜ਼ਰ ਸਫਲਤਾਪੂਰਵਕ ਲੋਗਇਨ ਕਰ ਲੈਂਦਾ ਹੈ, ਤਾਂ ਇੱਕ ਹੋਰ ਇੰਟਰਫੇਸ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ।

ਮੁੱਖ ਵਿਚਾਰ ਇਹ ਹੈ: **ਵੈਰੀਏਬਲਾਂ ਦੇ ਬਦਲਾਅ ਰਾਹੀਂ ਕੰਟਰੋਲ ਕਰੋ ਕਿ ਇੰਟਰਫੇਸ ਕੀ ਸਮੱਗਰੀ ਦਿਖਾਏ।**

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਤਿੰਨ ਮਹੱਤਵਪੂਰਨ ਗੱਲਾਂ ਸਿੱਖੀਆਂ:

1. ਪਾਸਵਰਡ ਦਰਜ ਕਰਨ ਲਈ `SecureField` ਦੀ ਵਰਤੋਂ ਕਰਨਾ, ਤਾਂ ਜੋ ਪਾਸਵਰਡ ਦੀ ਸਮੱਗਰੀ ਸਿੱਧੀ ਇੰਟਰਫੇਸ 'ਤੇ ਨਾ ਦਿਖੇ।
2. ਯੂਜ਼ਰ ਨੂੰ ਸੁਨੇਹੇ ਦਿਖਾਉਣ ਲਈ `Alert` ਦੀ ਵਰਤੋਂ ਕਰਨੀ, ਸਿਰਫ਼ ਕਨਸੋਲ ਵਿੱਚ ਆਉਟਪੁੱਟ ਕਰਨ ਦੀ ਬਜਾਏ।
3. ਵੱਖ-ਵੱਖ ਵਿਊਜ਼ ਦੀ ਡਿਸਪਲੇ ਨੂੰ ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਵੈਰੀਏਬਲਾਂ ਅਤੇ `if` ਸ਼ਰਤਾਂ ਦੀ ਵਰਤੋਂ ਕਰਨੀ, ਤਾਂ ਜੋ ਲੋਗਇਨ ਤੋਂ ਪਹਿਲਾਂ ਅਤੇ ਬਾਅਦ ਦੇ ਇੰਟਰਫੇਸ ਵਿਚਾਲੇ ਸਵਿੱਚ ਕੀਤਾ ਜਾ ਸਕੇ।

ਇਨ੍ਹਾਂ ਧਾਰਨਾਵਾਂ ਨੂੰ ਸਿੱਖਣ ਤੋਂ ਬਾਅਦ ਅਸੀਂ ਹੁਣ ਇੱਕ ਮੁੱਢਲੇ ਇੰਟਰੈਕਸ਼ਨ ਵਾਲੀ ਲੋਗਇਨ ਵਿਊ ਪੂਰੀ ਕਰ ਸਕਦੇ ਹਾਂ, ਅਤੇ SwiftUI ਦੀ ਇਸ ਡਿਵੈਲਪਮੈਂਟ ਸੋਚ ਨੂੰ ਹੋਰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹਾਂ ਕਿ “ਜਦੋਂ ਸਟੇਟ ਬਦਲਦੀ ਹੈ, ਇੰਟਰਫੇਸ ਅਪਡੇਟ ਹੁੰਦਾ ਹੈ”।

## ਪੂਰਾ ਕੋਡ

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## ਵਧੀਕ ਜਾਣਕਾਰੀ - ਕਈ ਬਟਨਾਂ ਵਾਲਾ Alert

ਇਸ ਪਾਠ ਦੇ ਪਹਿਲਾਂ ਦੇ ਹਿੱਸੇ ਵਿੱਚ ਅਸੀਂ ਸਭ ਤੋਂ ਬੁਨਿਆਦੀ `Alert` ਵਰਤੀ ਸੀ, ਜਿਸ ਵਿੱਚ ਸਿਰਫ਼ ਇੱਕ ਬਟਨ ਹੁੰਦਾ ਹੈ ਅਤੇ ਜੋ ਮੁੱਖ ਤੌਰ 'ਤੇ ਯੂਜ਼ਰ ਨੂੰ ਸੁਨੇਹਾ ਦੇਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਅਸਲ ਵਿੱਚ, `Alert` ਵਿੱਚ ਕਈ ਬਟਨ ਵੀ ਹੋ ਸਕਦੇ ਹਨ, ਤਾਂ ਜੋ ਯੂਜ਼ਰ ਵੱਖ-ਵੱਖ ਚੋਣਾਂ ਕਰ ਸਕੇ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

ਬਟਨ 'ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੋਂ ਬਾਅਦ ਤਿੰਨ ਵਿਕਲਪਾਂ ਵਾਲਾ ਇੱਕ ਸੁਨੇਹਾ ਬਾਕਸ ਦਿਖਾਈ ਦੇਵੇਗਾ: `Ok`, `delete`, ਅਤੇ `cancel`।

ਦਿਖਾਵੇ ਦਾ ਅਸਰ:

![alert](../../Resource/020_alert2.png)

ਵੱਖ-ਵੱਖ ਬਟਨਾਂ 'ਤੇ ਕਲਿੱਕ ਕਰਨ ਨਾਲ ਸੰਬੰਧਿਤ ਕੋਡ ਚੱਲੇਗਾ।

### Button ਦੀ `role` ਪ੍ਰਾਪਰਟੀ

ਇੱਥੇ ਤੁਸੀਂ ਵੇਖੋਗੇ ਕਿ `Alert` ਦੇ ਅੰਦਰ ਵਾਲਾ `Button`, ਉਸ ਆਮ ਬਟਨ ਲਿਖਤ ਤੋਂ ਕੁਝ ਵੱਖਰਾ ਹੈ ਜੋ ਅਸੀਂ ਪਹਿਲਾਂ ਸਿੱਖੀ ਸੀ:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

ਇੱਥੇ ਇੱਕ ਵਾਧੂ `role` ਪੈਰਾਮੀਟਰ ਹੈ।

SwiftUI ਵਿੱਚ `role` ਸਿਸਟਮ ਨੂੰ ਦੱਸਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ ਕਿ ਇਹ ਬਟਨ ਕਿਸ ਕਿਸਮ ਦੀ ਕਾਰਵਾਈ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਕੁਝ ਆਮ ਰੋਲ ਹੇਠ ਲਿਖੇ ਹਨ:

- `.cancel`: ਰੱਦ ਕਰਨ ਵਾਲੀ ਕਾਰਵਾਈ
- `.destructive`: ਖਤਰਨਾਕ ਕਾਰਵਾਈ, ਜਿਵੇਂ ਮਿਟਾਉਣਾ
- `nil`: ਆਮ ਕਾਰਵਾਈ

ਵੱਖ-ਵੱਖ `role` ਮੁੱਲ ਆਮ ਤੌਰ 'ਤੇ ਇੰਟਰਫੇਸ ਵਿੱਚ ਵੱਖਰੇ ਦਿਖਾਵਟੀ ਅੰਦਾਜ਼ ਵੀ ਲਿਆਉਂਦੇ ਹਨ।

ਉਦਾਹਰਨ ਲਈ, ਖਤਰਨਾਕ ਕਾਰਵਾਈਆਂ ਨੂੰ ਆਮ ਤੌਰ 'ਤੇ ਹੋਰ ਵੱਧ ਧਿਆਨ ਖਿੱਚਣ ਵਾਲੇ ਅੰਦਾਜ਼ ਵਿੱਚ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਜੋ ਯੂਜ਼ਰ ਸਾਵਧਾਨ ਰਹੇ।

ਇਸ ਤੋਂ ਇਲਾਵਾ, `role` ਬਟਨ ਲਈ ਵਾਧੂ ਅਰਥਪੂਰਨ ਜਾਣਕਾਰੀ ਵੀ ਦਿੰਦੀ ਹੈ, ਜਿਸ ਨਾਲ ਸਕ੍ਰੀਨ ਰੀਡਰ, ਜਿਵੇਂ Apple ਡਿਵਾਈਸਾਂ ਉੱਤੇ VoiceOver, ਯੂਜ਼ਰ ਨੂੰ ਬਟਨ ਦਾ ਉਦੇਸ਼ ਹੋਰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਸਮਝਾ ਸਕਦੇ ਹਨ।

ਇਸ ਲਈ, ਢੁੱਕਵੇਂ ਹਾਲਾਤਾਂ ਵਿੱਚ ਬਟਨ ਨਾਲ `role` ਜੋੜਨਾ ਇੱਕ ਬਹੁਤ ਵਧੀਆ ਆਦਤ ਹੈ।
