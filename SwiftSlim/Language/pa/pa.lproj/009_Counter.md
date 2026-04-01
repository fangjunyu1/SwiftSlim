# ਕਾਊਂਟਰ

ਪਿਛਲੇ ਦੋ ਪਾਠਾਂ ਵਿੱਚ ਅਸੀਂ ਵੇਰੀਏਬਲ, ਕਾਂਸਟੈਂਟ, ਬਟਨ ਅਤੇ ਫੰਕਸ਼ਨ ਸਿੱਖੇ ਸਨ।

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇਹਨਾਂ ਸਭ ਜਾਣਕਾਰੀਆਂ ਨੂੰ ਇਕੱਠਿਆਂ ਵਰਤ ਕੇ ਇੱਕ ਸਧਾਰਣ ਕਾਊਂਟਰ ਐਪ ਬਣਾਵਾਂਗੇ।

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ ਅਸੀਂ ਸਿੱਖਾਂਗੇ ਕਿ ਵੇਰੀਏਬਲ ਨੂੰ ਕਿਵੇਂ save ਅਤੇ ਬਦਲਿਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ `@State` ਨਾਲ ਵੇਰੀਏਬਲ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਿਆ ਜਾਂਦਾ ਹੈ।

## ਕਾਊਂਟਰ ਬਣਾਉਣਾ

ਕਾਊਂਟਰ ਆਮ ਤੌਰ 'ਤੇ ਉਹ ਗਿਣਤੀਆਂ ਦਰਜ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ ਜੋ ਲਗਾਤਾਰ ਵਧਦੀਆਂ ਰਹਿੰਦੀਆਂ ਹਨ। ਉਦਾਹਰਨ ਲਈ, ਰੱਸੀ ਕੂਦਣ ਦੀ ਗਿਣਤੀ, ਦੌੜ ਦੇ ਚੱਕਰਾਂ ਦੀ ਗਿਣਤੀ ਆਦਿ।

ਹੁਣ ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਕਾਊਂਟਰ ਬਣਾਵਾਂਗੇ: ਇੱਕ ਨੰਬਰ ਅਤੇ ਇੱਕ ਬਟਨ ਦਿਖਾਓ, ਅਤੇ ਬਟਨ 'ਤੇ click ਕਰਨ ਨਾਲ ਨੰਬਰ ਵਧੇ।

![Num](../../RESOURCE/009_num.png)

### ਨੰਬਰ ਦਿਖਾਉਣਾ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ `Text` ਨਾਲ ਨੰਬਰ ਦਿਖਾਵਾਂਗੇ।

```swift
Text("0")
```

ਪਰ ਜੇ ਨੰਬਰ ਨੂੰ ਬਦਲਣਾ ਹੋਵੇ, ਤਾਂ `"0"` ਨੂੰ ਸਿੱਧਾ ਨਹੀਂ ਲਿਖਣਾ ਚਾਹੀਦਾ। ਇਸ ਦੀ ਥਾਂ ਨੰਬਰ ਨੂੰ ਇੱਕ ਵੇਰੀਏਬਲ ਵਿੱਚ save ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ।

```swift
var num = 0
```

ਫਿਰ `Text` ਵਿੱਚ ਉਸ ਵੇਰੀਏਬਲ ਨੂੰ ਦਿਖਾਓ:

```swift
Text("\(num)")
```

ਇੱਥੇ string interpolation `\()` ਵਰਤੀ ਗਈ ਹੈ, ਜੋ ਨੰਬਰ ਨੂੰ string ਵਿੱਚ ਬਦਲ ਕੇ ਦਿਖਾਉਂਦੀ ਹੈ।

### ਬਟਨ ਨਾਲ ਨੰਬਰ ਵਧਾਉਣਾ

ਹੁਣ ਅਸੀਂ ਇੱਕ ਬਟਨ ਜੋੜਦੇ ਹਾਂ।

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

ਜਦੋਂ ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਵੇ, ਅਸੀਂ ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ ਨੰਬਰ ਵਧੇ।

ਇਸ ਲਈ ਅਸੀਂ ਬਟਨ ਦੇ ਅੰਦਰ ਵੇਰੀਏਬਲ ਨੂੰ ਬਦਲ ਸਕਦੇ ਹਾਂ:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

ਇਸ ਕੋਡ ਦਾ ਮਤਲਬ ਹੈ: ਜਦੋਂ ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ `num + 1` ਦੀ ਗਿਣਤੀ ਕੀਤੀ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਨਤੀਜਾ `num` ਨੂੰ assign ਕੀਤਾ ਜਾਂਦਾ ਹੈ।

### ਹੋਰ ਸੰਖੇਪ ਲਿਖਤ

Swift ਇੱਕ ਹੋਰ ਸੰਖੇਪ ਲਿਖਤ ਦਿੰਦਾ ਹੈ:

```swift
num += 1
```

ਇਹ ਇਸਦੇ ਬਰਾਬਰ ਹੈ:

```swift
num = num + 1
```

ਇਸ ਤਰ੍ਹਾਂ ਦੀ ਲਿਖਤ ਨੂੰ “compound assignment operator” ਕਿਹਾ ਜਾਂਦਾ ਹੈ।

Swift ਵਿੱਚ ਆਮ compound assignment operators ਇਹ ਹਨ:

```text
+=   ਜੋੜ ਕੇ assign ਕਰਨਾ
-=   ਘਟਾ ਕੇ assign ਕਰਨਾ
*=   ਗੁਣਾ ਕਰਕੇ assign ਕਰਨਾ
/=   ਭਾਗ ਕਰਕੇ assign ਕਰਨਾ
%=   remainder assign ਕਰਨਾ
```

ਉਦਾਹਰਨ ਲਈ:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### ਪੂਰਾ ਕੋਡ

ਹੁਣ ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਕਾਊਂਟਰ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

ਪਰ ਇਸ ਵੇਲੇ ਇਹ ਕੋਡ ਠੀਕ ਤਰ੍ਹਾਂ ਚੱਲੇਗਾ ਨਹੀਂ।

### ਗਲਤੀ ਆਉਂਦੀ ਹੈ

Xcode ਇਹ ਸੁਨੇਹਾ ਦਿਖਾਏਗਾ:

```text
Cannot assign to property: 'self' is immutable
```

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ property ਨੂੰ ਬਦਲਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ, ਕਿਉਂਕਿ view immutable ਹੈ।

ਇਹ ਕਿਉਂ ਹੁੰਦਾ ਹੈ?

## SwiftUI ਦਾ ਕੰਮ ਕਰਨ ਦਾ ਤਰੀਕਾ

SwiftUI ਵਿੱਚ: **interface ਡਾਟਾ ਦੁਆਰਾ ਚਲਾਇਆ ਜਾਂਦਾ ਹੈ**। ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਜਦੋਂ ਡਾਟਾ ਬਦਲਦਾ ਹੈ, ਤਾਂ interface ਆਪੇ refresh ਹੁੰਦਾ ਹੈ।

ਪਰ ਇਹ ਧਿਆਨ ਰੱਖਣਾ ਜ਼ਰੂਰੀ ਹੈ ਕਿ SwiftUI ਸਿਰਫ਼ state (`@State`, `@Binding` ਆਦਿ) ਦੇ ਬਦਲਣ 'ਤੇ ਹੀ ਬਦਲਾਅ ਨੂੰ monitor ਕਰਦਾ ਹੈ ਅਤੇ view ਨੂੰ refresh ਕਰਦਾ ਹੈ।

ਜੇ ਅਸੀਂ ਇੱਕ ਆਮ ਵੇਰੀਏਬਲ ਵਰਤਦੇ ਹਾਂ, ਤਾਂ SwiftUI view ਬਣਾਉਣ ਸਮੇਂ ਸਿਰਫ਼ ਇੱਕ ਵਾਰ ਉਸ ਦੀ value ਪੜ੍ਹਦਾ ਹੈ। ਉਸ ਤੋਂ ਬਾਅਦ ਭਾਵੇਂ ਵੇਰੀਏਬਲ ਦੀ value ਬਦਲ ਜਾਵੇ, interface update ਨਹੀਂ ਹੁੰਦਾ।

ਉਦਾਹਰਨ ਲਈ:

```swift
var num = 0   // 0
num = 1   // 0
```

ਉਪਰਲੇ ਉਦਾਹਰਨ ਵਿੱਚ `num` ਇੱਕ ਆਮ ਵੇਰੀਏਬਲ ਹੈ। ਭਾਵੇਂ ਇਸਦੀ value ਬਦਲ ਗਈ ਹੈ, ਪਰ SwiftUI view ਨੂੰ update ਨਹੀਂ ਕਰੇਗਾ, ਅਤੇ interface ਵਿੱਚ ਹਾਲੇ ਵੀ ਸ਼ੁਰੂਆਤੀ `0` ਹੀ ਦਿਖੇਗਾ।

![Num](../../RESOURCE/009_state.png)

ਇਸ ਲਈ, ਜਦੋਂ ਡਾਟਾ ਨੂੰ state ਵਜੋਂ mark ਕੀਤਾ ਜਾਂਦਾ ਹੈ (ਜਿਵੇਂ `@State`, `@Binding` ਵਰਗੇ property wrappers ਨਾਲ), ਤਦੋਂ ਹੀ SwiftUI ਉਸਦੇ ਬਦਲਾਅ ਨੂੰ ਆਪੇ monitor ਕਰਦਾ ਹੈ ਅਤੇ view update ਕਰਦਾ ਹੈ।

## `@State` property wrapper

SwiftUI ਵਿੱਚ, ਜੇ ਕਿਸੇ ਵੇਰੀਏਬਲ ਨੂੰ ਬਦਲਣਾ ਵੀ ਹੋਵੇ ਅਤੇ view ਨੂੰ update ਵੀ ਕਰਨਾ ਹੋਵੇ, ਤਾਂ `@State` ਵਰਤਣਾ ਲਾਜ਼ਮੀ ਹੈ।

```swift
@State var num = 0
```

`@State` SwiftUI ਨੂੰ ਇਸ ਵੇਰੀਏਬਲ 'ਤੇ ਨਜ਼ਰ ਰੱਖਣ ਦਿੰਦਾ ਹੈ।

ਜਦੋਂ ਇਹ ਵੇਰੀਏਬਲ ਬਦਲਦਾ ਹੈ, SwiftUI view ਨੂੰ ਮੁੜ calculate ਕਰਦਾ ਹੈ ਅਤੇ view update ਕਰਦਾ ਹੈ।

ਪੂਰਾ ਕੋਡ:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

ਹੁਣ ਜਦੋਂ ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ:

```swift
num += 1
```

SwiftUI ਨੂੰ ਪਤਾ ਲੱਗ ਜਾਂਦਾ ਹੈ ਕਿ `num` ਬਦਲਿਆ ਹੈ, ਅਤੇ ਫਿਰ ਉਹ view ਨੂੰ ਆਪੇ update ਕਰਦਾ ਹੈ।

![Num](../../RESOURCE/009_state1.png)

## `@State` ਦੀ ਵਰਤੋਂ ਦੇ ਨਿਯਮ

ਅਸਲ development ਵਿੱਚ, `@State` ਆਮ ਤੌਰ 'ਤੇ ਦੋ ਨਿਯਮ ਮੰਨਦਾ ਹੈ।

### 1. `@State` ਆਮ ਤੌਰ 'ਤੇ `private` ਨਾਲ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ

`@State` ਵੇਰੀਏਬਲ ਆਮ ਤੌਰ 'ਤੇ ਸਿਰਫ਼ ਮੌਜੂਦਾ type (ਜਿਵੇਂ ਮੌਜੂਦਾ `View` struct) ਦੇ ਅੰਦਰ ਹੀ ਵਰਤੀ ਜਾਂਦੀ ਹੈ, ਇਸ ਲਈ ਇਹ ਅਕਸਰ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖੀ ਜਾਂਦੀ ਹੈ:

```swift
@State private var num = 0
```

ਇਸ ਨਾਲ ਹੋਰ views ਇਸ ਵੇਰੀਏਬਲ ਨੂੰ ਸਿੱਧਾ access ਜਾਂ modify ਨਹੀਂ ਕਰ ਸਕਦੇ।

ਹੁਣ ਤੱਕ ਅਸੀਂ `private` ਨਹੀਂ ਸਿੱਖਿਆ, ਇਸਨੂੰ ਸਧਾਰਣ ਤਰੀਕੇ ਨਾਲ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝੋ:

**`private` ਨਾਲ ਚਿੰਨ੍ਹਿਤ ਕੀਤੀ ਚੀਜ਼ ਸਿਰਫ਼ ਮੌਜੂਦਾ view ਦੇ ਅੰਦਰ ਹੀ ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ, ਬਾਹਰਲੇ views ਇਸਨੂੰ ਵਰਤ ਨਹੀਂ ਸਕਦੇ।**

### 2. `@State` ਸਿਰਫ਼ ਮੌਜੂਦਾ view ਦੀ state ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ

`@State` ਉਸ ਡਾਟਾ ਲਈ ਠੀਕ ਹੈ ਜਿਸਨੂੰ ਮੌਜੂਦਾ `View` ਆਪ ਸੰਭਾਲਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, text field ਦੀ ਸਮੱਗਰੀ, switch ਦੀ state।

```swift
@State private var isOn = false
@State private var text = ""
```

ਜੇ ਡਾਟਾ ਕਈ views ਵਿਚਕਾਰ share ਕਰਨਾ ਹੋਵੇ, ਤਾਂ ਹੋਰ state types ਵਰਤਣੇ ਪੈਂਦੇ ਹਨ, ਜਿਵੇਂ `@Binding` ਜਾਂ `@Observable`।

ਇਹ ਸਮੱਗਰੀ ਅੱਗੇ ਦੇ ਪਾਠਾਂ ਵਿੱਚ ਸਿੱਖੀ ਜਾਵੇਗੀ।

### ਘਟਾਉਣ ਵਾਲਾ ਬਟਨ

ਕਾਊਂਟਰ ਵਿੱਚ ਸਿਰਫ਼ ਵਧਾਉਣਾ ਹੀ ਨਹੀਂ, ਘਟਾਉਣਾ ਵੀ ਹੋ ਸਕਦਾ ਹੈ।

ਅਸੀਂ ਇੱਕ `-` ਬਟਨ ਵੀ ਜੋੜ ਸਕਦੇ ਹਾਂ।

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

ਫਿਰ ਬਟਨਾਂ ਨੂੰ ਹਰੀਜ਼ਾਂਟਲ ਤਰੀਕੇ ਨਾਲ ਲਗਾਉਣ ਲਈ `HStack` ਵਰਤਦੇ ਹਾਂ:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

ਨਤੀਜਾ:

![Num](../../RESOURCE/009_num1.png)

ਜਦੋਂ `+` ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਨੰਬਰ 1 ਵਧਦਾ ਹੈ; ਜਦੋਂ `-` ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਨੰਬਰ 1 ਘਟਦਾ ਹੈ।

### ਰੀਸੈਟ ਬਟਨ

ਅਸੀਂ ਇੱਕ reset ਬਟਨ ਵੀ ਜੋੜ ਸਕਦੇ ਹਾਂ, ਜੋ ਨੰਬਰ ਨੂੰ `0` ਕਰ ਦੇਵੇ।

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

ਜਦੋਂ reset ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, `num` ਨੂੰ `0` assign ਕੀਤਾ ਜਾਂਦਾ ਹੈ।

ਨਤੀਜਾ:

![Num](../../RESOURCE/009_num2.png)

ਜਦੋਂ `0` ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਨੰਬਰ `0` ਬਣ ਜਾਂਦਾ ਹੈ।

### ਕਸਟਮ ਬਟਨ

ਇਸ ਵੇਲੇ ਸਾਡੇ ਬਟਨ ਸਿਰਫ਼ text ਹੀ ਦਿਖਾ ਸਕਦੇ ਹਨ:

```swift
Button("+") {

}
```

ਇਸ ਤਰੀਕੇ ਨਾਲ ਲਿਖਿਆ ਬਟਨ ਸਿਰਫ਼ text ਦਿਖਾ ਸਕਦਾ ਹੈ, ਜਿਵੇਂ `+` ਜਾਂ `-`।

ਅਸਲ development ਵਿੱਚ, ਅਸੀਂ ਅਕਸਰ ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ ਬਟਨ ਹੋਰ ਧਨਾਢ ਦਿੱਖ ਰੱਖੇ, ਜਿਵੇਂ icon ਜਾਂ ਹੋਰ views ਵਰਤ ਕੇ।

SwiftUI ਸਾਨੂੰ ਬਟਨ ਦੀ display content ਨੂੰ customize ਕਰਨ ਦੀ ਇਜਾਜ਼ਤ ਦਿੰਦਾ ਹੈ। ਇਸ ਵੇਲੇ ਅਸੀਂ ਬਟਨ ਦੀ ਦੂਜੀ ਲਿਖਤ ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
Button(action: {

}, label: {

})
```

ਇਸ ਲਿਖਤ ਵਿੱਚ, `action` ਉਹ ਕੋਡ ਹੈ ਜੋ ਬਟਨ 'ਤੇ click ਕਰਨ 'ਤੇ ਚੱਲਦਾ ਹੈ, ਅਤੇ `label` ਉਹ view ਹੈ ਜੋ ਬਟਨ 'ਤੇ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਅਸੀਂ ਬਟਨ ਨੂੰ ਇੱਕ SF Symbols icon ਦਿਖਾਉਣ ਲਈ ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

ਇਸ ਤਰ੍ਹਾਂ ਬਟਨ ਹੁਣ text ਨਹੀਂ, ਸਗੋਂ ਇੱਕ icon ਦਿਖਾਏਗਾ।

### ਕਾਊਂਟਰ interface ਨੂੰ ਸੁਧਾਰਨਾ

ਕਾਊਂਟਰ interface ਨੂੰ ਹੋਰ ਸਾਫ਼ ਬਣਾਉਣ ਲਈ, ਅਸੀਂ ਨੰਬਰ ਦੀ display style ਵੀ ਬਦਲ ਸਕਦੇ ਹਾਂ। ਉਦਾਹਰਨ ਲਈ, ਨੰਬਰ ਨੂੰ ਵੱਡਾ ਦਿਖਾਉਣਾ:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

ਹੁਣ ਅਸੀਂ ਬਟਨਾਂ ਦੀ display content ਨੂੰ ਵੀ icons ਵਿੱਚ ਬਦਲਦੇ ਹਾਂ, ਅਤੇ icons ਦਾ size ਵੀ ਥੋੜ੍ਹਾ ਵਧਾਉਂਦੇ ਹਾਂ:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

ਇਸੇ ਤਰ੍ਹਾਂ, ਘਟਾਉਣ ਵਾਲੇ ਬਟਨ ਅਤੇ reset ਬਟਨ ਨੂੰ ਵੀ icon ਰੂਪ ਵਿੱਚ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

ਹੁਣ ਬਟਨ SF Symbols icons ਦਿਖਾਉਣਗੇ, ਅਤੇ interface ਹੋਰ ਸਪੱਸ਼ਟ ਅਤੇ ਸੁੰਦਰ ਲੱਗੇਗਾ।

![Num](../../RESOURCE/009_num3.png)

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਕਾਊਂਟਰ ਬਣਾਕੇ ਵੇਰੀਏਬਲ, `Text` ਅਤੇ `Button` ਦੀ ਵਰਤੋਂ ਦਾ ਮਿਲਿਆ-ਜੁਲਿਆ ਅਭਿਆਸ ਕੀਤਾ। ਅਸੀਂ ਨੰਬਰ ਨੂੰ save ਕਰਨ ਲਈ ਵੇਰੀਏਬਲ ਵਰਤਿਆ, ਅਤੇ ਬਟਨਾਂ ਨਾਲ ਨੰਬਰ ਨੂੰ ਵਧਾਇਆ ਜਾਂ ਘਟਾਇਆ। ਇਸਦੇ ਨਾਲ ਅਸੀਂ compound assignment operators ਵੀ ਸਿੱਖੇ, ਜਿਵੇਂ `num += 1` ਅਤੇ `num -= 1`।

ਇਸ implementation ਦੌਰਾਨ ਅਸੀਂ SwiftUI ਦੇ ਕੰਮ ਕਰਨ ਦਾ ਤਰੀਕਾ ਵੀ ਸਮਝਿਆ: interface ਡਾਟਾ ਦੁਆਰਾ ਚਲਾਇਆ ਜਾਂਦਾ ਹੈ। ਜਦੋਂ ਡਾਟਾ ਬਦਲਦਾ ਹੈ, ਤਦੋਂ ਹੀ interface refresh ਹੁੰਦਾ ਹੈ। ਇਸ ਲਈ ਬਦਲਣਯੋਗ state ਨੂੰ save ਕਰਨ ਲਈ `@State` ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ। ਜਦੋਂ `@State` ਵੇਰੀਏਬਲ ਬਦਲਦਾ ਹੈ, SwiftUI ਆਪੇ view update ਕਰਦਾ ਹੈ।

ਅੰਤ ਵਿੱਚ, ਅਸੀਂ interface ਦਾ ਇੱਕ ਸਧਾਰਣ ਸੁਧਾਰ ਕੀਤਾ: `Text` ਦੀ font style ਬਦਲੀ, ਅਤੇ `Button(action:label:)` ਨਾਲ ਬਟਨ ਦੀ content customize ਕੀਤੀ, ਤਾਂ ਜੋ ਬਟਨ icons ਦਿਖਾ ਸਕਣ। ਇਸ ਤਰ੍ਹਾਂ ਕਾਊਂਟਰ interface ਹੋਰ ਸਪੱਸ਼ਟ ਅਤੇ ਸੁੰਦਰ ਬਣ ਗਿਆ।

ਹੁਣ ਅਸੀਂ SwiftUI views ਦੀ ਬੁਨਿਆਦੀ ਵਰਤੋਂ ਨਾਲ ਜਾਣੂ ਹੋ ਚੁੱਕੇ ਹਾਂ। SwiftUI ਵਿੱਚ, ਜ਼ਿਆਦਾਤਰ interface ਵੇਰੀਏਬਲਾਂ ਦੁਆਰਾ ਚਲਾਇਆ ਜਾਂਦਾ ਹੈ। ਜਦੋਂ ਵੇਰੀਏਬਲ ਬਦਲਦੇ ਹਨ, SwiftUI ਆਪੇ view update ਕਰਦਾ ਹੈ। ਇਸ ਲਈ, SwiftUI ਐਪ ਬਣਾਉਂਦੇ ਸਮੇਂ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ ਪਹਿਲਾਂ ਉਹ ਡਾਟਾ ਤਿਆਰ ਕਰਦੇ ਹਾਂ ਜਿਸਨੂੰ save ਕਰਨਾ ਹੈ, ਅਤੇ ਫਿਰ ਉਸੇ ਡਾਟਾ ਨਾਲ interface ਅਤੇ interaction logic ਬਣਾਉਂਦੇ ਹਾਂ।

## ਪੂਰਾ ਕੋਡ

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
