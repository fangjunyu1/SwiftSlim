# ਕਸਟਮ ਰੰਗ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ SwiftUI ਵਿੱਚ ਰੰਗਾਂ ਨੂੰ ਕਸਟਮ ਕਰਨਾ ਸਿੱਖਾਂਗੇ।

ਪਿਛਲੇ ਪਾਠਾਂ ਵਿੱਚ, ਅਸੀਂ SwiftUI ਵੱਲੋਂ ਦਿੱਤੇ ਡਿਫਾਲਟ ਰੰਗ ਪਹਿਲਾਂ ਹੀ ਵਰਤੇ ਹਨ, ਉਦਾਹਰਨ ਲਈ:

```swift
Color.blue
Color.red
Color.green
```

ਇਹ ਰੰਗ ਵਰਤਣ ਵਿੱਚ ਬਹੁਤ ਸੁਵਿਧਾਜਨਕ ਹਨ, ਪਰ ਅਸਲ App ਵਿਕਾਸ ਵਿੱਚ, ਡਿਫਾਲਟ ਰੰਗ ਅਕਸਰ ਕਾਫ਼ੀ ਸਟੀਕ ਨਹੀਂ ਹੁੰਦੇ।

ਉਦਾਹਰਨ ਲਈ, ਡਿਜ਼ਾਈਨ ਵਿੱਚ ਇਸ ਤਰ੍ਹਾਂ ਦੇ ਰੰਗ ਵਰਤੇ ਜਾ ਸਕਦੇ ਹਨ:

```text
#2c54c2
#4875ed
#213e8d
```

ਇਸ ਕਿਸਮ ਦੇ ਰੰਗ ਨੂੰ Hex ਰੰਗ ਕਿਹਾ ਜਾਂਦਾ ਹੈ।

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਪਹਿਲਾਂ SwiftUI ਨੂੰ Hex ਰੰਗਾਂ ਦਾ ਸਮਰਥਨ ਕਰਵਾਂਗੇ, ਫਿਰ `static` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਮ ਤੌਰ ਤੇ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਰੰਗਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰਾਂਗੇ।

ਅੰਤ ਵਿੱਚ, ਅਸੀਂ ਕਸਟਮ ਰੰਗਾਂ ਨੂੰ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਵਾਲੇ view ਵਿੱਚ ਲਾਗੂ ਕਰਾਂਗੇ, ਅਤੇ ਹੋਰ ਅੱਗੇ gradient background ਦੀ ਵਰਤੋਂ ਕਰਕੇ buttons ਨੂੰ ਹੋਰ ਪਰਤਦਾਰ ਦਿੱਖ ਦੇਵਾਂਗੇ।

## ਕਸਟਮ ਰੰਗਾਂ ਦੀ ਲੋੜ ਕਿਉਂ ਹੈ?

SwiftUI ਵਿੱਚ, ਅਸੀਂ ਸਿੱਧੇ system colors ਵਰਤ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

ਇੱਥੇ `.blue` ਨੀਲਾ ਰੰਗ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ ਅਸਲ ਵਿੱਚ `Color.blue` ਦੀ ਛੋਟੀ ਲਿਖਤ ਹੈ।

ਡਿਫਾਲਟ ਰੰਗਾਂ ਦਾ ਫਾਇਦਾ ਇਹ ਹੈ ਕਿ ਇਹ ਸਧਾਰਣ ਅਤੇ ਸੁਵਿਧਾਜਨਕ ਹਨ, ਪਰ ਰੰਗਾਂ ਦੀ ਚੋਣ ਸੀਮਿਤ ਹੁੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Color.blue
```

ਇਹ ਸਿਰਫ਼ SwiftUI ਵੱਲੋਂ ਦਿੱਤੇ ਡਿਫਾਲਟ ਨੀਲੇ ਰੰਗ ਨੂੰ ਦਰਸਾ ਸਕਦਾ ਹੈ।

![Color.blue](../../../Resource/031_color6.png)

ਪਰ ਅਸਲ ਵਿਕਾਸ ਵਿੱਚ, ਸਾਨੂੰ ਅਕਸਰ ਹੋਰ ਖਾਸ ਰੰਗਾਂ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਭਾਵੇਂ ਸਾਰੇ ਨੀਲੇ ਹੀ ਹੋਣ, ਉਨ੍ਹਾਂ ਵਿੱਚ ਹਲਕਾ ਨੀਲਾ, ਗੂੜ੍ਹਾ ਨੀਲਾ, ਸਲੇਟੀ ਨੀਲਾ, ਚਮਕਦਾਰ ਨੀਲਾ ਆਦਿ ਵੱਖ-ਵੱਖ ਪ੍ਰਭਾਵ ਹੋ ਸਕਦੇ ਹਨ।

![More Blue](../../../Resource/031_color5.png)

ਇਸ ਵੇਲੇ, ਜੇ ਅਸੀਂ ਸਿਰਫ਼ `Color.blue` ਵਰਤਦੇ ਹਾਂ, ਤਾਂ ਡਿਜ਼ਾਈਨ ਪ੍ਰਭਾਵ ਨੂੰ ਮੁੜ ਬਣਾਉਣਾ ਮੁਸ਼ਕਲ ਹੋਵੇਗਾ।

ਇਸ ਲਈ, ਸਾਨੂੰ SwiftUI ਨੂੰ ਕਸਟਮ ਰੰਗਾਂ ਦਾ ਸਮਰਥਨ ਕਰਵਾਉਣ ਦੀ ਲੋੜ ਹੈ।

## Hex ਰੰਗ ਕੀ ਹੁੰਦਾ ਹੈ?

ਸਕ੍ਰੀਨ ਉੱਤੇ ਰੰਗ ਆਮ ਤੌਰ ਤੇ ਲਾਲ, ਹਰਾ ਅਤੇ ਨੀਲਾ ਤਿੰਨ channels ਨਾਲ ਬਣਦੇ ਹਨ। ਇਸਨੂੰ RGB ਕਿਹਾ ਜਾਂਦਾ ਹੈ।

RGB ਦਾ ਅਰਥ ਹੈ:

```text
Red     // ਲਾਲ
Green   // ਹਰਾ
Blue    // ਨੀਲਾ
```

Hex ਰੰਗ RGB ਰੰਗ ਨੂੰ ਦਰਸਾਉਣ ਦਾ ਇੱਕ ਤਰੀਕਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
#5479FF
```

ਇਸ ਰੰਗ ਮੁੱਲ ਨੂੰ ਸਧਾਰਣ ਤੌਰ ਤੇ ਤਿੰਨ ਭਾਗਾਂ ਵਜੋਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```text
54  // ਲਾਲ channel ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ
79  // ਹਰੇ channel ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ
FF  // ਨੀਲੇ channel ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ
```

ਇਸ ਪਾਠ ਵਿੱਚ, ਸਾਨੂੰ ਇਹ ਮੁੱਲ calculate ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ, ਅਤੇ ਨਾ ਹੀ hexadecimal ਨਿਯਮਾਂ ਨੂੰ ਡੂੰਘਾਈ ਨਾਲ ਸਮਝਣ ਦੀ ਲੋੜ ਹੈ।

ਹੁਣ ਲਈ ਸਿਰਫ਼ ਇਹ ਜਾਣਨਾ ਕਾਫ਼ੀ ਹੈ: `#5479FF` ਇੱਕ ਖਾਸ ਰੰਗ ਦਰਸਾਉਂਦਾ ਹੈ।

ਬਾਅਦ ਵਿੱਚ ਜਦੋਂ ਅਸੀਂ `#2c54c2` ਜਾਂ `#4875ed` ਵਰਗੀਆਂ ਲਿਖਤਾਂ ਵੇਖਾਂਗੇ, ਤਾਂ ਅਸੀਂ ਪਹਿਲਾਂ ਉਨ੍ਹਾਂ ਨੂੰ ਇੱਕ ਰੰਗ ਮੁੱਲ ਵਜੋਂ ਸਮਝ ਸਕਦੇ ਹਾਂ।

Sketch, Figma, Photoshop ਆਦਿ design tools ਵਿੱਚ ਵੀ ਅਕਸਰ ਇਸ ਤਰ੍ਹਾਂ ਦੇ ਰੰਗ ਮੁੱਲ ਵੇਖਣ ਨੂੰ ਮਿਲਦੇ ਹਨ।

![color](../../../Resource/031_color.png)

ਪਰ SwiftUI ਡਿਫਾਲਟ ਤੌਰ ਤੇ ਇਸ ਤਰ੍ਹਾਂ ਸਿੱਧਾ ਲਿਖਣ ਦਾ ਸਮਰਥਨ ਨਹੀਂ ਕਰਦਾ:

```swift
Color(hex: "#5479FF")
```

ਇਸ ਲਈ, ਸਾਨੂੰ ਖੁਦ `Color` type ਨੂੰ extend ਕਰਨਾ ਪਵੇਗਾ, ਤਾਂ ਜੋ ਇਹ Hex string ਰਾਹੀਂ ਰੰਗ ਬਣਾਉਣ ਦਾ ਸਮਰਥਨ ਕਰੇ।

## Color+Hex.swift ਫਾਇਲ ਬਣਾਓ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ ਇੱਕ ਨਵੀਂ Swift ਫਾਇਲ ਬਣਾਂਦੇ ਹਾਂ।

ਫਾਇਲ ਦਾ ਨਾਮ ਇਹ ਹੋ ਸਕਦਾ ਹੈ:

```text
Color.swift
```

ਇਸਨੂੰ ਹੋਰ ਸਪਸ਼ਟ ਤੌਰ ਤੇ ਇਸ ਤਰ੍ਹਾਂ ਵੀ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```text
Color+Hex.swift
```

ਇੱਥੇ ਜ਼ਿਆਦਾ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ ਕਿ ਇਹ ਵਰਤਿਆ ਜਾਵੇ:

```text
Color+Hex.swift
```

Swift projects ਵਿੱਚ `Color+Hex.swift` ਵਰਗੇ ਫਾਇਲ ਨਾਮ ਬਹੁਤ ਆਮ ਹਨ।

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਇਹ ਫਾਇਲ `Color` ਵਿੱਚ Hex ਸਮਰਥਾ ਜੋੜਨ ਵਾਲੀ extension ਫਾਇਲ ਹੈ।

ਫਾਇਲ ਦਾ ਨਾਮ code ਦੇ ਚੱਲਣ ਨੂੰ ਸਿੱਧਾ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦਾ। ਇਹ ਸਿਰਫ਼ ਸਾਨੂੰ ਇਸ ਫਾਇਲ ਦਾ ਉਦੇਸ਼ ਆਸਾਨੀ ਨਾਲ ਸਮਝਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।

## Color(hex:) code ਜੋੜੋ

`Color+Hex.swift` ਫਾਇਲ ਵਿੱਚ ਹੇਠਾਂ ਦਿੱਤਾ code ਲਿਖੋ:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

ਇਹ code `extension` ਦੀ ਵਰਤੋਂ ਕਰਕੇ `Color` type ਨੂੰ extend ਕਰਦਾ ਹੈ, ਅਤੇ `Color` ਵਿੱਚ ਇੱਕ ਨਵਾਂ initializer ਜੋੜਦਾ ਹੈ:

```swift
init(hex: String)
```

ਇਹ initializer ਮਿਲਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ Hex string ਨੂੰ `Color` ਵਿੱਚ pass ਕਰ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ ਇੱਕ custom color ਬਣਾਇਆ ਜਾ ਸਕੇ:

```swift
Color(hex: "#5479FF")
```

ਇਸ extension code ਦੇ ਅੰਦਰ, Hex string ਨੂੰ SwiftUI ਵੱਲੋਂ ਪਛਾਣੇ ਜਾ ਸਕਣ ਵਾਲੇ RGB ਰੰਗ ਵਿੱਚ ਬਦਲਿਆ ਜਾਂਦਾ ਹੈ।

ਇਸ ਪੜਾਅ ਤੇ ਹਰ line ਦੀ conversion logic ਨੂੰ ਡੂੰਘਾਈ ਨਾਲ ਸਮਝਣ ਦੀ ਲੋੜ ਨਹੀਂ। ਸਿਰਫ਼ ਇਹ ਜਾਣਨਾ ਕਾਫ਼ੀ ਹੈ ਕਿ ਜੋੜਿਆ ਗਿਆ `Color(hex:)` method ਸਾਨੂੰ Hex color value ਰਾਹੀਂ custom colors ਬਣਾਉਣ ਦੇ ਸਕਦਾ ਹੈ।

## ਕਸਟਮ ਰੰਗ ਵਰਤਣਾ

ਹੁਣ, ਅਸੀਂ `ContentView` ਵਿੱਚ custom colors ਦੀ ਜਾਂਚ ਕਰ ਸਕਦੇ ਹਾਂ।

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![color](../../../Resource/031_color1.png)

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, ਪਹਿਲੀ line system color ਵਰਤਦੀ ਹੈ:

```swift
.foregroundStyle(Color.blue)
```

ਅਗਲੀਆਂ ਤਿੰਨ lines custom Hex colors ਵਰਤਦੀਆਂ ਹਨ:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

ਤੁਲਨਾ ਕਰਕੇ ਵੇਖਿਆ ਜਾ ਸਕਦਾ ਹੈ ਕਿ system blue ਵਿੱਚ ਸਿਰਫ਼ ਇੱਕ ਡਿਫਾਲਟ ਪ੍ਰਭਾਵ ਹੁੰਦਾ ਹੈ।

ਪਰ Hex colors ਨੀਲੇ ਰੰਗ ਦੇ ਹੋਰ ਸੁਖਮ ਬਦਲਾਅ ਦਰਸਾ ਸਕਦੇ ਹਨ।

ਇਹੀ custom colors ਦੀ ਕਦਰ ਹੈ: ਇਹ interface colors ਨੂੰ ਅਸਲ design ਦੇ ਹੋਰ ਨੇੜੇ ਲਿਆ ਸਕਦੇ ਹਨ, ਅਤੇ ਸਾਨੂੰ App ਦੀ visual style ਨੂੰ control ਕਰਨਾ ਹੋਰ ਆਸਾਨ ਬਣਾਉਂਦੇ ਹਨ।

## static ਨਾਲ ਰੰਗ ਵਿਵਸਥਿਤ ਕਰਨਾ

ਹੁਣ, ਅਸੀਂ Hex string ਰਾਹੀਂ colors ਬਣਾ ਸਕਦੇ ਹਾਂ:

```swift
Color(hex: "#2c54c2")
```

ਇਹ ਲਿਖਣ ਦਾ ਤਰੀਕਾ ਠੀਕ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਦਾ ਹੈ, ਪਰ ਜੇ ਇੱਕੋ ਰੰਗ ਕਈ ਥਾਵਾਂ ਤੇ ਵਾਰ-ਵਾਰ ਵਰਤਿਆ ਜਾਵੇ, ਤਾਂ ਬਾਅਦ ਵਿੱਚ maintenance ਥੋੜ੍ਹੀ ਅਸੁਵਿਧਾਜਨਕ ਹੋਵੇਗੀ।

ਜੇ ਇਹ color value 10 ਵੱਖ-ਵੱਖ ਥਾਵਾਂ ਤੇ ਲਿਖੀ ਹੋਵੇ, ਤਾਂ ਬਾਅਦ ਵਿੱਚ ਇਹ ਨੀਲਾ ਰੰਗ ਬਦਲਣਾ ਹੋਵੇ ਤਾਂ ਹਰ ਜਗ੍ਹਾ ਵੱਖ-ਵੱਖ ਸੋਧ ਕਰਨੀ ਪਵੇਗੀ।

ਇਸ ਵੇਲੇ, ਅਸੀਂ `static` ਦੀ ਵਰਤੋਂ ਕਰਕੇ commonly used colors ਨੂੰ ਇੱਕੋ ਥਾਂ ਵਿਵਸਥਿਤ ਕਰ ਸਕਦੇ ਹਾਂ।

`Color+Hex.swift` ਫਾਇਲ ਦੇ ਹੇਠਾਂ, ਹੇਠਾਂ ਦਿੱਤਾ code ਅੱਗੇ ਜੋੜੋ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ਇੱਥੇ, ਅਸੀਂ `Color` ਵਿੱਚ ਤਿੰਨ static properties ਜੋੜੀਆਂ ਹਨ: `animalBlue`, `animalLightBlue` ਅਤੇ `animalDarkBlue`। ਇਹ ਵੱਖ-ਵੱਖ ਗੂੜ੍ਹਾਈ ਵਾਲੇ ਨੀਲੇ ਰੰਗ ਦਰਸਾਉਂਦੀਆਂ ਹਨ।

ਕਿਉਂਕਿ ਇਹ properties `static` ਵਰਤਦੀਆਂ ਹਨ, ਇਸ ਲਈ ਇਹ `Color` type ਨਾਲ ਹੀ ਸੰਬੰਧਿਤ ਹਨ।

ਵਰਤਦੇ ਸਮੇਂ, ਅਸੀਂ ਇਨ੍ਹਾਂ ਨੂੰ ਸਿੱਧਾ `Color.` ਰਾਹੀਂ access ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
Color.animalBlue
```

ਇਹ ਲਿਖਣ ਦਾ ਤਰੀਕਾ Hex string ਨੂੰ ਸਿੱਧਾ ਲਿਖਣ ਨਾਲੋਂ ਹੋਰ ਸਪਸ਼ਟ ਹੈ।

ਜਦੋਂ ਅਸੀਂ `Color.animalBlue` ਵੇਖਦੇ ਹਾਂ, ਤਾਂ ਅਸੀਂ ਜਾਣ ਸਕਦੇ ਹਾਂ ਕਿ ਇਹ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਵਿੱਚ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਨੀਲੇ ਰੰਗ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਪਰ ਜਦੋਂ ਅਸੀਂ `Color(hex: "#2c54c2")` ਵੇਖਦੇ ਹਾਂ, ਤਾਂ ਅਸੀਂ ਸਿਰਫ਼ ਇਹ ਜਾਣਦੇ ਹਾਂ ਕਿ ਇਹ ਇੱਕ color value ਹੈ, ਪਰ ਇਸਦਾ ਖਾਸ ਉਪਯੋਗ ਆਸਾਨੀ ਨਾਲ ਸਮਝ ਨਹੀਂ ਆਉਂਦਾ।

ਰੰਗਾਂ ਨੂੰ ਇੱਕੋ ਥਾਂ manage ਕਰਨ ਦਾ ਇੱਕ ਹੋਰ ਫਾਇਦਾ ਹੈ: ਬਾਅਦ ਦੀ ਸੋਧ ਹੋਰ ਆਸਾਨ ਹੁੰਦੀ ਹੈ।

ਜੇ ਅਸੀਂ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਦਾ main color adjust ਕਰਨਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਸਿਰਫ਼ definition ਵਾਲੀ ਥਾਂ ਸੋਧਣੀ ਪਵੇਗੀ:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

ਇਹ ਰੰਗ ਵਰਤਣ ਵਾਲੀਆਂ ਸਾਰੀਆਂ ਥਾਵਾਂ ਇਕੱਠੇ update ਹੋ ਜਾਣਗੀਆਂ।

ਇਹੀ `static` ਨਾਲ colors ਨੂੰ ਵਿਵਸਥਿਤ ਕਰਨ ਦਾ ਅਰਥ ਹੈ: color names ਹੋਰ ਸਪਸ਼ਟ ਹੁੰਦੇ ਹਨ, ਅਤੇ ਬਾਅਦ ਦੀ maintenance ਹੋਰ ਸੁਵਿਧਾਜਨਕ ਹੁੰਦੀ ਹੈ।

## ਇਸਨੂੰ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਵਿੱਚ ਲਾਗੂ ਕਰੋ

ਹੁਣ, ਅਸੀਂ custom colors ਨੂੰ ਪਿਛਲੇ animal encyclopedia view ਵਿੱਚ ਲਾਗੂ ਕਰ ਸਕਦੇ ਹਾਂ।

ਪਹਿਲਾਂ, animal button ਦਾ background ਸਫ਼ੈਦ ਸੀ:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

ਹੁਣ, ਅਸੀਂ ਇਸਨੂੰ custom color ਵਿੱਚ ਬਦਲ ਸਕਦੇ ਹਾਂ:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

ਇੱਥੇ `Color.animalBlue` ਉਹ static color ਹੈ ਜੋ ਅਸੀਂ ਹੁਣੇ `Color+Hex.swift` ਵਿੱਚ define ਕੀਤਾ ਹੈ।

Button text ਸਫ਼ੈਦ ਰੰਗ ਵਰਤਦਾ ਹੈ:

```swift
.foregroundStyle(Color.white)
```

ਜਾਨਵਰ emoji ਦਾ background ਅੱਧ-ਪਾਰਦਰਸ਼ੀ ਸਫ਼ੈਦ ਵਰਤਦਾ ਹੈ:

```swift
.background(Color.white.opacity(0.15))
```

ਇਸ ਤਰ੍ਹਾਂ button ਇੱਕ unified blue visual style ਬਣਾਉਂਦਾ ਹੈ।

ਇਸ ਕਦਮ ਦਾ ਕੇਂਦਰ complex code ਜੋੜਣਾ ਨਹੀਂ, ਸਗੋਂ ਪਹਿਲਾਂ ਸਿੱਖੇ custom colors ਨੂੰ ਸਚਮੁੱਚ interface ਵਿੱਚ ਲਾਗੂ ਕਰਨਾ ਹੈ।

## Gradient background ਵਰਤਣਾ

ਇੱਕੋ ਰੰਗ ਵਰਤਣ ਤੋਂ ਇਲਾਵਾ, ਅਸੀਂ ਕਈ ਰੰਗਾਂ ਨੂੰ ਜੋੜ ਕੇ gradient effect ਵੀ ਬਣਾ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ, ਅਸੀਂ ਪਹਿਲਾਂ ਇਹ colors define ਕੀਤੇ ਸਨ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ਇਹ colors ਨਾ ਸਿਰਫ਼ ਵੱਖ-ਵੱਖ ਵਰਤੇ ਜਾ ਸਕਦੇ ਹਨ, ਸਗੋਂ gradient background ਵਜੋਂ ਵੀ combine ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ।

SwiftUI ਵਿੱਚ, ਅਸੀਂ `LinearGradient` ਦੀ ਵਰਤੋਂ ਕਰਕੇ linear gradient ਬਣਾ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ਇਹ code ਖੱਬੇ ਤੋਂ ਸੱਜੇ ਵੱਲ gradient background ਬਣਾਉਂਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਰੰਗ `Color.animalBlue` ਤੋਂ ਹੌਲੀ-ਹੌਲੀ `Color.animalLightBlue` ਵਿੱਚ ਬਦਲਦਾ ਹੈ।

ਇੱਥੇ `colors` gradient ਵਿੱਚ ਸ਼ਾਮਲ ਰੰਗਾਂ ਨੂੰ set ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ `startPoint` ਤੇ `endPoint` gradient ਦੀ direction control ਕਰਨ ਲਈ ਵਰਤੇ ਜਾਂਦੇ ਹਨ।

### Gradient effect ਦੀ ਜਾਂਚ ਕਰੋ

ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ Text ਨਾਲ gradient background ਦੀ ਜਾਂਚ ਕਰ ਸਕਦੇ ਹਾਂ।

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![color](../../../Resource/031_color3.png)

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, `Text` ਦਾ background ਹੁਣ ਇੱਕੋ ਰੰਗ ਨਹੀਂ ਰਹਿੰਦਾ, ਸਗੋਂ ਖੱਬੇ ਤੋਂ ਸੱਜੇ ਵੱਲ ਹੌਲੀ-ਹੌਲੀ ਬਦਲਣ ਵਾਲਾ gradient color ਹੁੰਦਾ ਹੈ।

ਆਮ background color ਨਾਲੋਂ, gradient background ਵਿੱਚ ਹੋਰ layering ਹੁੰਦੀ ਹੈ, ਅਤੇ ਇਹ interface ਵਿੱਚ visual focus ਬਣਾਉਣਾ ਹੋਰ ਆਸਾਨ ਕਰਦਾ ਹੈ।

## ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਵਿੱਚ gradient background ਵਰਤਣਾ

ਹੁਣ, ਅਸੀਂ animal button ਦਾ background color:

```swift
.background(Color.animalBlue)
```

gradient background ਵਿੱਚ ਬਦਲ ਸਕਦੇ ਹਾਂ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

ਪੂਰਾ code ਹੇਠਾਂ ਦਿੱਤਾ ਹੈ:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਪ੍ਰਭਾਵ:

![color](../../../Resource/031_color4.png)

ਹੁਣ animal button ਸਿਰਫ਼ ਇੱਕੋ background color ਨਹੀਂ ਰਹਿੰਦਾ, ਸਗੋਂ ਇਸ ਵਿੱਚ ਖੱਬੇ ਤੋਂ ਸੱਜੇ ਵੱਲ gradient effect ਹੈ।

Single-color background ਨਾਲੋਂ, gradient background interface ਨੂੰ ਹੋਰ layered ਅਤੇ ਅਸਲ App ਦੇ visual design ਦੇ ਨੇੜੇ ਦਿਖਾ ਸਕਦਾ ਹੈ।

## Single-color background ਅਤੇ gradient background ਵਿੱਚ ਅੰਤਰ

Single-color background ਸਿਰਫ਼ ਇੱਕ ਰੰਗ ਵਰਤਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
.background(Color.animalBlue)
```

ਇਹ ਲਿਖਣ ਦਾ ਤਰੀਕਾ ਸਧਾਰਣ ਅਤੇ ਸਪਸ਼ਟ ਹੈ, ਅਤੇ ਜ਼ਿਆਦਾਤਰ basic interfaces ਲਈ ਉਚਿਤ ਹੈ।

Gradient background ਕਈ ਰੰਗ ਵਰਤਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

ਇਹ ਲਿਖਣ ਦਾ ਤਰੀਕਾ interface ਨੂੰ ਹੋਰ layered ਬਣਾ ਸਕਦਾ ਹੈ, ਪਰ ਇਹ visual complexity ਵੀ ਹੋਰ ਆਸਾਨੀ ਨਾਲ ਵਧਾ ਸਕਦਾ ਹੈ।

ਇਸ ਲਈ, ਅਸਲ development ਵਿੱਚ ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹਾਂ:

Single-color background ਆਮ text, ਆਮ buttons, ਆਮ cards ਅਤੇ ਆਮ page backgrounds ਲਈ ਉਚਿਤ ਹੁੰਦਾ ਹੈ।

Gradient background key buttons, top areas, cover cards, feature entrances ਅਤੇ ਹੋਰ ਉਹਨਾਂ positions ਲਈ ਉਚਿਤ ਹੁੰਦਾ ਹੈ ਜਿਨ੍ਹਾਂ ਨੂੰ emphasis ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ SwiftUI ਵਿੱਚ custom colors ਵਰਤਣਾ ਸਿੱਖਿਆ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ Hex colors ਬਾਰੇ ਜਾਣਿਆ।

ਉਦਾਹਰਨ ਲਈ:

```text
#2c54c2
```

ਇਹ ਇੱਕ ਖਾਸ ਰੰਗ ਦਰਸਾਉਂਦਾ ਹੈ।

ਫਿਰ, ਅਸੀਂ `extension Color` ਦੀ ਵਰਤੋਂ ਕਰਕੇ `Color` type ਨੂੰ extend ਕੀਤਾ।

ਇਸ ਨਾਲ SwiftUI ਹੇਠਾਂ ਦਿੱਤੇ ਤਰੀਕੇ ਨਾਲ colors ਬਣਾ ਸਕਦਾ ਹੈ:

```swift
Color(hex: "#2c54c2")
```

ਅਗੇ, ਅਸੀਂ `static` ਦੀ ਵਰਤੋਂ ਕਰਕੇ commonly used colors ਨੂੰ ਵਿਵਸਥਿਤ ਕੀਤਾ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

ਇਸ ਤਰ੍ਹਾਂ, ਹੋਰ views ਵਿੱਚ ਇਸਨੂੰ ਸਿੱਧਾ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Color.animalBlue
```

ਹਰ ਵਾਰ Hex string ਲਿਖਣ ਨਾਲੋਂ, ਇਹ ਤਰੀਕਾ ਹੋਰ ਸਪਸ਼ਟ ਹੈ ਅਤੇ ਬਾਅਦ ਵਿੱਚ colors ਨੂੰ ਇਕਸਾਰ ਤਰੀਕੇ ਨਾਲ modify ਕਰਨਾ ਹੋਰ ਸੁਵਿਧਾਜਨਕ ਬਣਾਉਂਦਾ ਹੈ।

ਅੰਤ ਵਿੱਚ, ਅਸੀਂ `LinearGradient` ਸਿੱਖਿਆ, ਅਤੇ custom colors ਨੂੰ ਜੋੜ ਕੇ gradient background ਬਣਾਇਆ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ਇਸ ਪਾਠ ਰਾਹੀਂ, ਅਸੀਂ “custom colors ਬਣਾਉਣ” ਤੋਂ “ਅਸਲ interface ਵਿੱਚ colors ਵਰਤਣ” ਤੱਕ ਦੀ ਪ੍ਰਕਿਰਿਆ ਪੂਰੀ ਕੀਤੀ।

ਬਾਅਦ ਵਿੱਚ, ਜਦੋਂ ਕਿਸੇ ਰੰਗ ਨੂੰ ਕਈ ਥਾਵਾਂ ਤੇ ਵਾਰ-ਵਾਰ ਵਰਤਣ ਦੀ ਲੋੜ ਹੋਵੇ, ਤਾਂ ਪਹਿਲਾਂ ਉਸਨੂੰ `Color` extension ਵਿੱਚ ਵਿਵਸਥਿਤ ਕਰਨ ਬਾਰੇ ਸੋਚਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਇਸ ਨਾਲ code ਹੋਰ ਸਪਸ਼ਟ ਹੋਵੇਗਾ, ਅਤੇ interface style ਨੂੰ unify ਕਰਨਾ ਵੀ ਹੋਰ ਆਸਾਨ ਹੋਵੇਗਾ।
