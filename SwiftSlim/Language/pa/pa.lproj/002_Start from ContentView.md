# ContentView ਤੋਂ ਸ਼ੁਰੂਆਤ

## ਪਾਠ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਤਿਆਰੀ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ContentView.swift ਫ਼ਾਈਲ ਤੋਂ ਸ਼ੁਰੂ ਕਰਕੇ SwiftUI ਦੀ ਬੁਨਿਆਦੀ ਬਣਤਰ ਨੂੰ ਵਿਵਸਥਿਤ ਢੰਗ ਨਾਲ ਸਮਝਾਂਗੇ, ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ：

- ਟਿੱਪਣੀਆਂ (comments)
- View ਬਣਤਰ
- VStack / HStack / ZStack layout
- SF Symbols icons
- view modifiers
- preview code #Preview

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਪਹਿਲਾਂ ਬਣਾਇਆ ਹੋਇਆ Xcode project ਲੱਭੋ ਅਤੇ .xcodeproj ਫ਼ਾਈਲ 'ਤੇ double-click ਕਰੋ।

ਖੱਬੇ ਪਾਸੇ Navigator navigation ਖੇਤਰ ਵਿੱਚ ContentView.swift ਫ਼ਾਈਲ ਚੁਣੋ।

ਧਿਆਨ ਦਿਓ：ਹਰ ਵਾਰੀ project ਖੋਲ੍ਹਣ 'ਤੇ Canvas ਵਿੱਚ "Preview paused" ਦਿਖ ਸਕਦਾ ਹੈ। Preview ਮੁੜ ਚਾਲੂ ਕਰਨ ਲਈ refresh button 'ਤੇ ਕਲਿੱਕ ਕਰੋ।

![Swift](../../RESOURCE/002_view7.png)

## ContentView ਨਾਲ ਜਾਣ-ਪਛਾਣ

ContentView ਕੋਡ：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

ਭਾਵੇਂ ਕੋਡ ਘੱਟ ਹੈ, ਪਰ ਇਸ ਵਿੱਚ SwiftUI ਦੀ core structure ਸ਼ਾਮਲ ਹੈ।

### 1. ਟਿੱਪਣੀਆਂ

ਫ਼ਾਈਲ ਦੇ ਉੱਪਰਲੇ ਹਿੱਸੇ ਵਿੱਚ：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

ਇਹ file comment ਹੈ, ਜੋ ਫ਼ਾਈਲ ਦੀ ਜਾਣਕਾਰੀ ਦਰਜ ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਵਿੱਚ file name, project name, creator ਅਤੇ creation time ਸ਼ਾਮਲ ਹੁੰਦੇ ਹਨ।

Swift ਵਿੱਚ single-line comment ਲਈ // ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ：

```swift
// ਇਹ ਇੱਕ comment ਹੈ
```

Comments ਕੋਡ ਦੀ readability ਵਧਾਉਂਦੀਆਂ ਹਨ ਅਤੇ developers ਨੂੰ code logic ਸਮਝਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀਆਂ ਹਨ।

ਅਸਲੀ development ਵਿੱਚ, code ਕਈ ਵਾਰ ਸਮਝਣ ਵਿੱਚ ਔਖਾ ਹੋ ਸਕਦਾ ਹੈ। ਜੇ comments ਨਾ ਲਿਖੀਆਂ ਜਾਣ, ਤਾਂ ਤਿੰਨ ਦਿਨ ਬਾਅਦ ਆਪਣਾ ਹੀ code ਨਾ ਸਮਝ ਆਉਣ ਵਾਲੀ ਸਥਿਤੀ ਪੈਦਾ ਹੋ ਸਕਦੀ ਹੈ।

ਇਸ ਲਈ, code ਲਿਖਣ ਦੇ ਦੌਰਾਨ actively comments ਸ਼ਾਮਲ ਕਰਨਾ ਇੱਕ ਚੰਗੀ development habit ਹੈ। Comments ਦੀ ਮਦਦ ਨਾਲ code logic ਦਰਜ ਕਰਨਾ ਬਾਅਦ ਦੀ code maintenance ਲਈ ਸੁਵਿਧਾਜਨਕ ਹੁੰਦਾ ਹੈ।

**ਅਸਥਾਈ ਤੌਰ 'ਤੇ ਕੋਡ ਨੂੰ ਰੋਕਣਾ**

Comments ਦੀ ਵਰਤੋਂ code ਨੂੰ ਅਸਥਾਈ ਤੌਰ 'ਤੇ disable ਕਰਨ ਲਈ ਵੀ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ, ਤਾਂ ਜੋ ਅਸੀਂ ਸਮੱਸਿਆ ਦੀ ਜਾਂਚ ਕਰ ਸਕੀਏ।

ਉਦਾਹਰਨ ਵਜੋਂ：

```
A
B
C
```

A, B, C ਤਿੰਨ code blocks ਹਨ। ਜੇ ਇਨ੍ਹਾਂ ਵਿੱਚੋਂ ਕਿਸੇ ਇੱਕ ਵਿੱਚ ਗਲਤੀ ਹੈ, ਤਾਂ ਅਸੀਂ ਉਸਦੀ ਜਾਂਚ ਲਈ code ਨੂੰ ਅਸਥਾਈ ਤੌਰ 'ਤੇ comment ਕਰ ਸਕਦੇ ਹਾਂ।

ਸਭ ਤੋਂ ਪਹਿਲਾਂ A ਨੂੰ comment ਕਰੋ：

```
// A
B
C
```

ਜੇ A ਨੂੰ comment ਕਰਨ ਤੋਂ ਬਾਅਦ code ਮੁੜ ਠੀਕ ਚੱਲ ਪਏ, ਤਾਂ ਇਸਦਾ ਮਤਲਬ A ਵਿੱਚ ਸਮੱਸਿਆ ਹੈ।

ਜੇ A ਨੂੰ comment ਕਰਨ ਤੋਂ ਬਾਅਦ ਵੀ ਸਮੱਸਿਆ ਰਹਿੰਦੀ ਹੈ, ਤਾਂ ਅਸੀਂ B ਨੂੰ ਵੀ comment ਕਰ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਇਸੇ ਤਰ੍ਹਾਂ ਅੱਗੇ ਵਧਦੇ ਹੋਏ ਗਲਤੀ ਵਾਲੇ code ਨੂੰ ਲੱਭ ਸਕਦੇ ਹਾਂ।

Development ਦੌਰਾਨ ਕਈ ਸਮੱਸਿਆਵਾਂ ਆਉਂਦੀਆਂ ਹਨ। ਅਕਸਰ ਅਸੀਂ comment ਕਰਕੇ ਸਮੱਸਿਆ ਦੇ ਕਾਰਣ ਦੀ ਜਾਂਚ ਕਰਦੇ ਹਾਂ। ਇਹ ਸਾਨੂੰ ਗਲਤੀ ਵਾਲੇ code ਨੂੰ locate ਕਰਨ ਅਤੇ BUG ਲੱਭਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।

Xcode ਵਿੱਚ, ਤੁਸੀਂ ਹੇਠਾਂ ਦਿੱਤਾ shortcut ਵਰਤ ਸਕਦੇ ਹੋ：

```
Command ⌘ + /
```

ਇਸ ਨਾਲ comments ਤੁਰੰਤ add ਜਾਂ remove ਕੀਤੀਆਂ ਜਾ ਸਕਦੀਆਂ ਹਨ।

### 2. SwiftUI framework import ਕਰਨਾ

```swift
import SwiftUI
```

ਇਹ code SwiftUI framework ਨੂੰ import ਕਰਨ ਦਾ ਸੰਕੇਤ ਦਿੰਦਾ ਹੈ।

SwiftUI ਵਿੱਚ View, Text, Image, VStack ਵਰਗੇ types ਇਸੇ framework ਤੋਂ ਆਉਂਦੇ ਹਨ।

ਜੇ SwiftUI framework import ਨਾ ਕੀਤਾ ਜਾਵੇ, ਤਾਂ Xcode ਇਹ error ਦਿਖਾਏਗਾ：

```
Cannot find type 'View' in scope
```

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ compiler, View type ਨੂੰ ਪਛਾਣ ਨਹੀਂ ਸਕਦਾ।

### 3. View ਬਣਤਰ

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ਜਦੋਂ ਤੁਸੀਂ ਪਹਿਲੀ ਵਾਰ ਇਹ View structure ਵੇਖਦੇ ਹੋ, ਤਾਂ ਇਹ ਅਜਾਣਾ ਲੱਗ ਸਕਦਾ ਹੈ, ਕਿਉਂਕਿ ਇਸ ਵਿੱਚ struct, View, var, body, some ਵਰਗੇ keywords ਸ਼ਾਮਲ ਹਨ।

ਅਸੀਂ ਅਜੇ ਇਹ keywords ਨਹੀਂ ਸਿੱਖੇ। ਇਸ ਵੇਲੇ ਸਿਰਫ਼ ਇਹ ਜਾਣਨਾ ਕਾਫ਼ੀ ਹੈ ਕਿ ਇਹ code ContentView ਨਾਮ ਦਾ ਇੱਕ View ਤਿਆਰ ਕਰਦਾ ਹੈ।

ਤੁਸੀਂ View ਨੂੰ ਇੱਕ canvas ਜਾਂ drawing board ਵਾਂਗ ਸਮਝ ਸਕਦੇ ਹੋ, ਜਿਸ 'ਤੇ ਅਸੀਂ drawing ਕਰਦੇ ਹਾਂ, ਅਤੇ drawing ਕਰਨ ਦਾ tool SwiftUI ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ：

![Swift](../../RESOURCE/002_view.png)

ਉੱਪਰਲੀ ਤਸਵੀਰ ਵਿੱਚ ਤਿੰਨ pages ਦਿਖ ਰਹੇ ਹਨ, ਅਤੇ ਅਸਲ ਵਿੱਚ ਇਹ ਤਿੰਨ ਵੱਖ-ਵੱਖ Views ਹਨ।

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

ਜਦੋਂ ਅਸੀਂ SwiftUI ਨਾਲ App ਬਣਾਉਂਦੇ ਹਾਂ, ਤਾਂ ਹਰ page ਇੱਕ View ਹੁੰਦਾ ਹੈ।

### 4. SwiftUI ਕੋਡ

View ਦੇ ਅੰਦਰ SwiftUI code ਇਸ ਤਰ੍ਹਾਂ ਹੈ：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ਇਸ SwiftUI code ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਇਹ ਇੱਕ vertical layout ਹੈ, ਜਿਸ ਵਿੱਚ ਇੱਕ icon ਅਤੇ ਇੱਕ text ਦਿਖਾਇਆ ਗਿਆ ਹੈ।

![Swift](../../RESOURCE/002_view1.png)

#### VStack layout

```swift
VStack { }  // vertical layout
```

VStack ਇੱਕ vertical layout container ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਸਦੇ ਅੰਦਰਲੇ views ਉੱਪਰ ਤੋਂ ਹੇਠਾਂ ਕ੍ਰਮ ਵਿੱਚ ਸੱਜੇ ਜਾਂਦੇ ਹਨ।

![Swift](../../RESOURCE/002_view8.png)

SwiftUI ਵਿੱਚ ਤਿੰਨ ਆਮ layouts ਹਨ：

* VStack —— vertical ਕ੍ਰਮ
* HStack —— horizontal ਕ੍ਰਮ
* ZStack —— overlay / stacked ਕ੍ਰਮ (Z-axis)

```swift
HStack { }  // horizontal ਕ੍ਰਮ
ZStack { }  // overlay ਕ੍ਰਮ
```

ਹਰ layout ਦੀ visual ترتيب：

![Swift](../../RESOURCE/002_view2.png)

ਉਦਾਹਰਨ ਲਈ：HStack ਵਰਤ ਕੇ horizontal ਕ੍ਰਮ ਬਣਾਉਣਾ।

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ਤੁਸੀਂ ਦੇਖ ਸਕਦੇ ਹੋ ਕਿ globe icon ਅਤੇ text ਹੁਣ horizontal ਰੂਪ ਵਿੱਚ ਦਿਖ ਰਹੇ ਹਨ।

![Swift](../../RESOURCE/002_view3.png)

ਜਦੋਂ ਸਾਨੂੰ horizontal ਕ੍ਰਮ ਚਾਹੀਦਾ ਹੈ, ਤਾਂ HStack ਵਰਤਦੇ ਹਾਂ। ਜਦੋਂ overlay effect ਚਾਹੀਦਾ ਹੋਵੇ, ਤਾਂ ZStack ਵਰਤਦੇ ਹਾਂ।

#### Image ਅਤੇ SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ਇਹ code ਇੱਕ globe icon ਦਿਖਾਉਂਦਾ ਹੈ। ਇਹ globe icon, Apple ਦੇ SF Symbols icon system ਤੋਂ ਆਉਂਦਾ ਹੈ।

![Swift](../../RESOURCE/002_view9.png)

ਇਸ code ਦਾ ਅਰਥ ਹੈ ਇੱਕ globe icon ਦਿਖਾਉਣਾ, ਵੱਡੇ size ਵਿੱਚ, ਅਤੇ tint color ਨਾਲ।

ਅਸੀਂ ਸਿਰਫ਼ globe icon ਹੀ ਨਹੀਂ, ਹੋਰ icons ਵੀ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ, ਇੱਕ backpack ਦਿਖਾਉਣਾ：

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**ਹੋਰ icons ਕਿਵੇਂ ਦਿਖਾਏ ਜਾਣ?**

ਇਸ ਲਈ ਸਾਨੂੰ Apple ਦਾ ਅਧਿਕਾਰਿਕ system icon library, SF Symbols ਵਰਤਣਾ ਪਵੇਗਾ।

Apple Developer ਅਧਿਕਾਰਿਕ ਵੈਬਸਾਈਟ ਖੋਲ੍ਹੋ ਅਤੇ [SF Symbols](https://developer.apple.com/sf-symbols/) ਡਾਊਨਲੋਡ ਕਰੋ।

![Swift](../../RESOURCE/002_sf.png)

ਫਿਰ SF Symbols App ਖੋਲ੍ਹੋ।

![Swift](../../RESOURCE/002_sf1.png)

ਖੱਬੇ ਪਾਸੇ symbols ਦੀਆਂ categories ਹੁੰਦੀਆਂ ਹਨ ਅਤੇ ਸੱਜੇ ਪਾਸੇ ਸੰਬੰਧਿਤ icons ਦਿਖਦੇ ਹਨ।

ਕਿਸੇ icon 'ਤੇ right-click ਕਰਕੇ "1 ਨਾਮ ਕਾਪੀ ਕਰੋ" ਚੁਣੋ, ਜਿਸ ਨਾਲ ਉਸਦਾ ਨਾਮ copy ਹੋ ਜਾਵੇਗਾ।

ਉਦਾਹਰਨ ਵਜੋਂ：

```
"globe"
"backpack"
"heart"
```

copy ਕੀਤਾ ਹੋਇਆ icon name, Image(systemName:) ਦੇ ਅੰਦਰ ਰੱਖਣ ਨਾਲ ਵੱਖ-ਵੱਖ icons ਦਿਖਾਏ ਜਾ ਸਕਦੇ ਹਨ।

ਧਿਆਨ ਦਿਓ：ਹਰ SF Symbols icon ਦੀ ਇੱਕ minimum supported system version ਹੁੰਦੀ ਹੈ। ਜੇ system version ਬਹੁਤ ਪੁਰਾਣੀ ਹੋਵੇ, ਤਾਂ icon ਦਿਖਾਈ ਨਾ ਵੀ ਦੇ ਸਕੇ। Compatibility ਜਾਣਕਾਰੀ SF Symbols App ਵਿੱਚ ਵੇਖੀ ਜਾ ਸਕਦੀ ਹੈ।

#### Modifiers

SwiftUI ਵਿੱਚ, modifier ਇੱਕ ਐਸੀ method ਹੈ ਜੋ view ਦੀ appearance ਜਾਂ behavior ਨੂੰ ਬਦਲਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਤੁਸੀਂ modifier ਨੂੰ ਕੱਪੜਿਆਂ ਵਾਂਗ ਸਮਝ ਸਕਦੇ ਹੋ। ਵੱਖ-ਵੱਖ ਕੱਪੜੇ ਪਹਿਨਣ ਨਾਲ ਇੱਕੋ ਵਿਅਕਤੀ ਦੀ ਦਿੱਖ ਵੱਖਰੀ ਲੱਗਦੀ ਹੈ।

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ਇੱਥੇ imageScale ਅਤੇ foregroundStyle, Image view ਦੇ modifiers ਹਨ। ਇਹ Image ਦੇ content ਨੂੰ ਬਦਲੇ ਬਿਨਾਂ, ਉਸਦੀ appearance ਨੂੰ modify ਕਰਦੇ ਹਨ।

**1. imageScale**

```swift
.imageScale(.large)
```

ਇਹ SF Symbols icon ਦਾ size ਕੰਟਰੋਲ ਕਰ ਸਕਦਾ ਹੈ：

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

ਅਸੀਂ ਵੱਖ-ਵੱਖ options ਚੁਣ ਕੇ SF Symbols ਨੂੰ ਵੱਖ-ਵੱਖ sizes ਵਿੱਚ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle foreground color ਕੰਟਰੋਲ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

.tint ਮੌਜੂਦਾ environment ਦੀ accent color ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਡਿਫ਼ਾਲਟ ਤੌਰ 'ਤੇ iOS ਵਿੱਚ ਇਹ ਨੀਲਾ ਹੁੰਦਾ ਹੈ।

ਜੇ ਅਸੀਂ foreground color ਨੂੰ ਲਾਲ ਕਰਨਾ ਚਾਹੀਏ：

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text view

Text ਇੱਕ text view ਹੈ, ਜੋ string ਦਿਖਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

```swift
Text("Hello, world!")
```

ਉਦਾਹਰਨ ਲਈ, ਮੇਰਾ ਨਾਮ ਦਿਖਾਉਣਾ：

```swift
Text("FangJunyu")
```

ਧਿਆਨ ਦਿਓ：String ਨੂੰ ਹਮੇਸ਼ਾਂ "" double quotes ਵਿੱਚ ਲਿਖਣਾ ਲਾਜ਼ਮੀ ਹੈ।

ਤੁਸੀਂ ਆਪਣਾ ਨਾਮ, phone number ਜਾਂ ਹੋਰ ਕੋਈ ਵੀ text ਦਿਖਾਉਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰ ਸਕਦੇ ਹੋ।

#### padding ਮਾਰਜਿਨ

SwiftUI ਵਿੱਚ, padding view content ਅਤੇ boundary ਦੇ ਵਿਚਕਾਰ ਖਾਲੀ ਥਾਂ ਵਧਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਇਹ “inner spacing (padding / content inset)” ਨਾਲ ਸੰਬੰਧਿਤ ਹੈ।

```swift
HStack {
    ...
}
.padding()
```

ਉੱਪਰਲਾ code ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ HStack view ਨੂੰ system default padding ਦਿੱਤੀ ਗਈ ਹੈ।

**padding ਕੀ ਹੈ?**

padding ਦਾ ਅਰਥ ਹੈ "view content ਅਤੇ ਉਸਦੀ boundary ਦੇ ਵਿਚਕਾਰ ਖਾਲੀ ਛੱਡਿਆ ਗਿਆ ਇਲਾਕਾ"।

ਹੇਠਾਂ ਦਿੱਤੀ ਤਸਵੀਰ ਵਿੱਚ, ਜਦੋਂ ਨੀਲੇ HStack 'ਤੇ padding ਲਗਾਈ ਜਾਂਦੀ ਹੈ, ਤਾਂ ਨੀਲਾ ਖੇਤਰ ਅੰਦਰ ਵੱਲ ਸਿਮਟਦਾ ਹੈ, ਅਤੇ ਉਹ ਦੇਖਣ ਵਿੱਚ "ਇੱਕ ਛੋਟਾ ਘੇਰਾ" ਜਿਹਾ ਲੱਗਦਾ ਹੈ।

![Swift](../../RESOURCE/002_view6.png)

**ਡਿਫ਼ਾਲਟ padding**

padding() modifier ਡਿਫ਼ਾਲਟ ਤੌਰ 'ਤੇ system ਦੁਆਰਾ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ standard spacing ਵਰਤਦਾ ਹੈ।

```swift
.padding()
```

ਵੱਖ-ਵੱਖ platforms ਅਤੇ contexts ਵਿੱਚ ਇਹ value ਵੱਖਰੀ ਹੋ ਸਕਦੀ ਹੈ। ਉਦਾਹਰਨ ਲਈ：

* iOS ਵਿੱਚ ਇਹ ਆਮ ਤੌਰ 'ਤੇ ਲਗਭਗ 16 pt ਹੁੰਦੀ ਹੈ।
* macOS ਜਾਂ watchOS ਵਿੱਚ ਇਹ spacing ਵੱਖਰੀ ਹੋ ਸਕਦੀ ਹੈ, ਜੋ platform ਦੇ design guidelines 'ਤੇ ਨਿਰਭਰ ਕਰਦੀ ਹੈ।

**Custom padding**

ਅਸੀਂ view ਲਈ ਵੱਖ-ਵੱਖ directions ਵਿੱਚ ਵੱਖਰੀ padding ਵੀ ਦੇ ਸਕਦੇ ਹਾਂ।

1. ਇੱਕ single direction ਸੈੱਟ ਕਰਨਾ

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Direction ਦੀ ਵਿਆਖਿਆ：

* .top: ਉੱਪਰੀ ਮਾਰਜਿਨ
* .bottom: ਹੇਠਲਾ ਮਾਰਜਿਨ
* .leading: ਅੱਗੇ ਵਾਲਾ ਮਾਰਜਿਨ
* .trailing: ਪਿੱਛੇ ਵਾਲਾ ਮਾਰਜਿਨ

![Swift](../../RESOURCE/002_view12.png)

ਧਿਆਨ ਦਿਓ：leading ਅਤੇ trailing, language direction ਦੇ ਅਨੁਸਾਰ ਆਪਣੇ ਆਪ adapt ਕਰਦੇ ਹਨ। ਉਦਾਹਰਨ ਲਈ Arabic (RTL) environment ਵਿੱਚ ਇਹ ਆਪਣੇ ਆਪ ਉਲਟ ਜਾਂਦੇ ਹਨ।

2. ਕਈ directions ਇਕੱਠਿਆਂ ਸੈੱਟ ਕਰਨਾ

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Array ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇੱਕੋ ਵਾਰ ਕਈ directions ਨਿਰਧਾਰਤ ਕੀਤੀਆਂ ਜਾ ਸਕਦੀਆਂ ਹਨ। Array ਦੀ ਵਿਸਥਾਰ ਨਾਲ ਵਰਤੋਂ ਅਸੀਂ ਬਾਅਦ ਦੇ ਪਾਠਾਂ ਵਿੱਚ ਸਿੱਖਾਂਗੇ। ਇੱਥੇ ਸਿਰਫ਼ ਇਹ syntax ਜਾਣਨਾ ਕਾਫ਼ੀ ਹੈ।

3. horizontal ਜਾਂ vertical direction ਸੈੱਟ ਕਰਨਾ

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

ਇਹ ਹੇਠਾਂ ਦਿੱਤੇ code ਦੇ ਬਰਾਬਰ ਹੈ：

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Padding ਹਟਾਉਣਾ**

ਜੇ ਤੁਸੀਂ ਕੋਈ padding ਨਹੀਂ ਚਾਹੁੰਦੇ, ਤਾਂ .padding(0) ਵਰਤ ਸਕਦੇ ਹੋ：

```swift
.padding(0)
```

ਜਾਂ padding modifier ਨੂੰ ਸਿੱਧਾ ਹਟਾ ਸਕਦੇ ਹੋ：

```swift
// .padding()
```

### 6. Preview preview code

```swift
#Preview {
    ContentView()
}
```

ਇਹ code ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ Canvas ਵਿੱਚ ContentView ਦੀ preview ਤਿਆਰ ਕੀਤੀ ਜਾਵੇ।

ਧਿਆਨ ਦਿਓ：#Preview, Swift 5.9 / Xcode 15 ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤੀ ਗਈ ਨਵੀਂ syntax ਹੈ। ਇਸ ਤੋਂ ਪਹਿਲਾਂ PreviewProvider structure ਵਰਤੀ ਜਾਂਦੀ ਸੀ।

**ਜੇ Preview ਨੂੰ comment ਕਰ ਦਿੱਤਾ ਜਾਵੇ ਤਾਂ ਕੀ ਹੋਵੇਗਾ?**

ਜੇ Preview ਨੂੰ comment ਕਰ ਦਿੱਤਾ ਜਾਵੇ：

```swift
// #Preview {
//    ContentView()
// }
```

ਤਾਂ Canvas ਵਿੱਚ ਕੋਈ render ਹੋਣ ਵਾਲੀ preview ਨਹੀਂ ਦਿਖੇਗੀ।

![Swift](../../RESOURCE/002_xcode.png)

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ #Preview, Canvas ਵਿੱਚ preview view ਦਿਖਾਉਣ ਨੂੰ control ਕਰਦਾ ਹੈ।

ਜਦੋਂ ਅਸੀਂ Xcode ਵਿੱਚ SwiftUI view ਦੀ preview ਦੇਖਣੀ ਹੋਵੇ, ਤਾਂ #Preview preview code ਜੋੜਦੇ ਹਾਂ। ਜੇ preview ਦੀ ਲੋੜ ਨਾ ਹੋਵੇ, ਤਾਂ #Preview ਨੂੰ comment ਜਾਂ delete ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

## ਸਾਰ

ਭਾਵੇਂ ContentView.swift ਫ਼ਾਈਲ ਵਿੱਚ ਕੋਡ ਜ਼ਿਆਦਾ ਨਹੀਂ ਹੈ, ਪਰ ਅਸਲ ਵਿੱਚ ਇਹ SwiftUI ਦੇ ਕਈ ਮੁੱਖ concepts ਨੂੰ ਸਮੇਟਦੀ ਹੈ। ਸ਼ੁਰੂਆਤੀ ਸਿਖਿਆਰਥੀਆਂ ਲਈ ਇਹ code ਅਜਾਣਾ ਲੱਗ ਸਕਦਾ ਹੈ, ਪਰ ਇਸਨੂੰ ਹਿੱਸਿਆਂ ਵਿੱਚ ਵੰਡ ਕੇ ਸਮਝਣ ਨਾਲ SwiftUI ਬਾਰੇ ਇੱਕ ਮੁੱਢਲੀ ਸਮਝ ਬਣ ਸਕਦੀ ਹੈ।

ਇਸ ਪਾਠ ਦੀ ਸਮੱਗਰੀ ਨੂੰ ਮੁੜ ਵੇਖੀਏ ਤਾਂ ਸਭ ਤੋਂ ਪਹਿਲਾਂ ਅਸੀਂ comments // ਸਿੱਖੀਆਂ, ਜਿਨ੍ਹਾਂ ਦੀ ਮਦਦ ਨਾਲ code logic ਸਮਝਾਈ ਜਾ ਸਕਦੀ ਹੈ ਜਾਂ code ਨੂੰ ਅਸਥਾਈ ਤੌਰ 'ਤੇ disable ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਫਿਰ ਅਸੀਂ ਇਹ ਜਾਣਿਆ ਕਿ SwiftUI ਫ਼ਾਈਲ ਵਿੱਚ SwiftUI framework import ਕਰਨਾ ਲਾਜ਼ਮੀ ਹੈ：

```swift
import SwiftUI
```

ਜੇ framework import ਨਾ ਕੀਤਾ ਜਾਵੇ, ਤਾਂ compiler, View ਵਰਗੇ types ਨੂੰ ਪਛਾਣ ਨਹੀਂ ਸਕੇਗਾ।

ਫਿਰ ਅਸੀਂ SwiftUI view ਦੀ ਬੁਨਿਆਦੀ ਬਣਤਰ ਨੂੰ ਸਮਝਿਆ：

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ਇੱਥੇ ContentView, view ਦਾ ਨਾਮ ਹੈ।

ਅਸੀਂ ਤਿੰਨ ਆਮ layout containers ਵੀ ਸਿੱਖੇ：VStack (vertical ਕ੍ਰਮ), HStack (horizontal ਕ੍ਰਮ), ਅਤੇ ZStack (overlay ਕ੍ਰਮ)。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ਇਸ code ਵਿੱਚ ਇੱਕ vertical layout container ਦਿਖਾਇਆ ਗਿਆ ਹੈ, ਜਿਸ ਦੇ ਅੰਦਰ ਇੱਕ icon ਅਤੇ ਇੱਕ text ਹਨ।

Image, SF Symbols icons ਦਿਖਾ ਸਕਦੀ ਹੈ, ਅਤੇ modifiers ਦੀ ਮਦਦ ਨਾਲ icon ਦਾ size ਅਤੇ color ਕੰਟਰੋਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

Text view text content ਦਿਖਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

padding, view ਦੇ ਆਲੇ-ਦੁਆਲੇ ਇੱਕ transparent space ਜੋੜਦੀ ਹੈ।

ਅੰਤ ਵਿੱਚ, #Preview preview view ਹੈ, ਜੋ Canvas ਵਿੱਚ preview ਦਿਖਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

### ਪਾਠ ਤੋਂ ਬਾਅਦ ਅਭਿਆਸ

ਸ਼ੁਰੂਆਤੀ ਸਿਖਿਆਰਥੀਆਂ ਲਈ, ਇਸ ਪਾਠ ਦੀ ਸਮੱਗਰੀ ਕੁਝ ਜਟਿਲ ਲੱਗ ਸਕਦੀ ਹੈ। ਅਸੀਂ ਹੋਰ ਅਭਿਆਸ ਰਾਹੀਂ ਅੱਜ ਦੇ concepts ਨੂੰ ਹੋਰ ਡੂੰਘਾਈ ਨਾਲ ਸਮਝ ਸਕਦੇ ਹਾਂ：

* SF Symbols icon ਦਾ ਨਾਮ ਬਦਲੋ
* icon ਦਾ foreground color ਕਾਲਾ ਕਰੋ
* VStack ਨੂੰ HStack ਨਾਲ ਬਦਲੋ
* Image ਜਾਂ Text ਨੂੰ comment ਕਰਕੇ preview ਵਿੱਚ ਆਉਣ ਵਾਲਾ ਬਦਲਾਅ ਦੇਖੋ

### ਛੋਟਾ ਵਿਸ਼ੇਸ਼ ਭਾਗ：Code Completion

ਜਦੋਂ ਤੁਸੀਂ code ਟਾਈਪ ਕਰਦੇ ਹੋ, ਤਾਂ ਤੁਸੀਂ ਸ਼ਾਇਦ ਧਿਆਨ ਕੀਤਾ ਹੋਵੇ ਕਿ Xcode ਆਪਣੇ ਆਪ ਉਪਲਬਧ options ਦੀ ਇੱਕ list ਦਿਖਾਉਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਜਦੋਂ ਅਸੀਂ imageScale modifier ਨੂੰ ਬਦਲਦੇ ਹਾਂ：

```swift
.imageScale(.)
```

ਤਾਂ Xcode ਉਪਲਬਧ options ਦਿਖਾਉਂਦਾ ਹੈ：

![Swift](../../RESOURCE/002_view10.png)

ਇਹ code completion mechanism ਹੈ। ਇਹ type inference ਅਤੇ enum member suggestions ਦੇ ਆਧਾਰ 'ਤੇ ਕੰਮ ਕਰਦੀ ਹੈ, ਅਤੇ typing efficiency ਵਧਾਉਂਦੀ ਹੈ ਅਤੇ errors ਘਟਾਉਂਦੀ ਹੈ।

ਅਗਲੇ ਪਾਠਾਂ ਵਿੱਚ, ਅਸੀਂ enum ਨੂੰ ਵਿਸਥਾਰ ਨਾਲ ਸਿੱਖਾਂਗੇ। ਇਸ ਵੇਲੇ ਲਈ ਇਸਦਾ ਸਿਰਫ਼ ਇੱਕ ਸਧਾਰਣ ਪਰਿਚਯ ਹੀ ਕਾਫ਼ੀ ਹੈ।
