# ਲੇਆਉਟ, ਤਸਵੀਰਾਂ ਅਤੇ ਲਿਖਤ

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ContentView ਦਾ ਇਹ ਕੋਡ ਸਿੱਖਿਆ ਸੀ：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ SwiftUI ਦੇ ਡਿਫ਼ਾਲਟ layout mechanism ਅਤੇ images ਅਤੇ text ਦੀ ਵਰਤੋਂ ਸਿੱਖਾਂਗੇ। ਪਿਛਲੇ ਪਾਠ ਦੇ ਆਧਾਰ 'ਤੇ, ਅਸੀਂ view ਦੀ ਬਣਤਰ ਅਤੇ display ਦੇ ਢੰਗ ਨੂੰ ਹੋਰ ਡੂੰਘਾਈ ਨਾਲ ਸਮਝਾਂਗੇ। ਇਹ ਗਿਆਨ ਬੁਨਿਆਦੀ interface layouts ਬਣਾਉਣ ਲਈ ਮਦਦਗਾਰ ਹੋਵੇਗਾ।

## SwiftUI ਦਾ ਡਿਫ਼ਾਲਟ layout mechanism

ਜਦੋਂ ਅਸੀਂ ContentView ਦੀ preview ਵੇਖਦੇ ਹਾਂ, ਤਾਂ ਸਾਨੂੰ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ icon ਅਤੇ text ਵਿਚਕਾਰ ਵਿੱਚ ਦਿਖਦੇ ਹਨ, ਉੱਪਰ ਤੋਂ ਨਹੀਂ ਸ਼ੁਰੂ ਹੁੰਦੇ।

![Swift](../../RESOURCE/003_view.png)

ਡਿਫ਼ਾਲਟ ਤੌਰ 'ਤੇ, Stack container ਦੀ alignment .center ਹੁੰਦੀ ਹੈ, ਇਸ ਲਈ child views ਆਮ ਤੌਰ 'ਤੇ centered ਦਿਖਾਈ ਦਿੰਦੇ ਹਨ।

### Alignment ਅਲਾਈਨਮੈਂਟ ਤਰੀਕਾ

ਸਪਸ਼ਟ ਹੈ ਕਿ center alignment ਸਿਰਫ਼ alignment ਦਾ ਇੱਕ ਹੀ ਰੂਪ ਹੈ। ਜੇ ਅਸੀਂ left alignment ਜਾਂ right alignment ਚਾਹੀਦੀ ਹੋਵੇ, ਤਾਂ ਸਾਨੂੰ alignment ਨਾਲ view ਦੀ alignment ਕੰਟਰੋਲ ਕਰਨੀ ਪਵੇਗੀ।

```swift
alignment
```

SwiftUI ਵਿੱਚ, alignment ਆਮ ਤੌਰ 'ਤੇ ਦੋ ਸਥਿਤੀਆਂ ਵਿੱਚ ਵਰਤੀ ਜਾਂਦੀ ਹੈ：

**1. Stack container ਦਾ alignment parameter**

ਉਦਾਹਰਨ ਲਈ, ContentView ਵਿੱਚ icon ਅਤੇ text ਨੂੰ left align ਕਰਨਾ：

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

VStack ਦਾ alignment, horizontal direction ਦੀ alignment ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ।

Alignment ਤਰੀਕੇ：

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack horizontal ਕ੍ਰਮ ਵਿੱਚ ਹੁੰਦਾ ਹੈ, ਇਸ ਲਈ ਇਸਦਾ alignment vertical direction ਨੂੰ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ：

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack overlay ਕ੍ਰਮ ਹੈ, ਅਤੇ ਇਸਦਾ alignment horizontal ਜਾਂ vertical ਦੋਵੇਂ directions ਨੂੰ ਕੰਟਰੋਲ ਕਰ ਸਕਦਾ ਹੈ：

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

ਜੇ alignment ਸਪਸ਼ਟ ਤੌਰ 'ਤੇ ਨਾ ਦਿੱਤੀ ਜਾਵੇ, ਤਾਂ VStack, HStack ਅਤੇ ZStack ਦੀ default alignment .center ਹੁੰਦੀ ਹੈ।

**2. frame ਦੇ ਅੰਦਰ alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

ਜਦੋਂ frame ਵੱਲੋਂ ਦਿੱਤਾ ਗਿਆ size, view ਦੇ ਆਪਣੇ size ਨਾਲੋਂ ਵੱਡਾ ਹੁੰਦਾ ਹੈ, ਤਾਂ alignment ਇਹ ਨਿਰਧਾਰਤ ਕਰਦਾ ਹੈ ਕਿ view frame ਦੇ ਅੰਦਰ ਕਿੱਥੇ ਰੱਖਿਆ ਜਾਵੇ। frame ਦੀ ਹੋਰ ਵਿਸਥਾਰ ਵਾਲੀ ਵਰਤੋਂ ਅਸੀਂ ਅੱਗੇ ਸਿੱਖਾਂਗੇ; ਇੱਥੇ ਇਸਨੂੰ ਸਿਰਫ਼ ਥੋੜ੍ਹਾ ਸਮਝੋ।

### Spacer ਅਤੇ space distribution mechanism

alignment ਨਾਲ views ਨੂੰ horizontal ਜਾਂ vertical ਦਿਸ਼ਾ ਵਿੱਚ ਕ੍ਰਮਬੱਧ ਤਰੀਕੇ ਨਾਲ ਦਿਖਾਇਆ ਜਾ ਸਕਦਾ ਹੈ। ਪਰ ਜੇ ਅਸੀਂ ਚਾਹੀਏ ਕਿ text ਅਤੇ image ਦੋਨੋਂ ਦੋ ਸਿਰਿਆਂ 'ਤੇ ਦਿਖਣ, ਤਾਂ ਸਿਰਫ਼ alignment ਕਾਫ਼ੀ ਨਹੀਂ ਹੁੰਦੀ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ ਅਸੀਂ [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) ਵੈਬਸਾਈਟ ਦੇ top view ਵਰਗਾ layout ਬਣਾਉਣਾ ਚਾਹੀਏ, ਜਿਸਦੇ ਖੱਬੇ ਪਾਸੇ NHK website icon ਹੋਵੇ ਅਤੇ ਸੱਜੇ ਪਾਸੇ menu icon ਹੋਵੇ।

![Swift](../../RESOURCE/003_alignment3.png)

ਜੇ ਅਸੀਂ ਸਿਰਫ਼ alignment ਵਰਤਾਂਗੇ, ਤਾਂ NHK icon ਅਤੇ menu icon ਇੱਕੋ ਪਾਸੇ ਦਿਖਣਗੇ। ਦੋਨੋਂ icons ਨੂੰ ਖੱਬੇ ਅਤੇ ਸੱਜੇ ਸਿਰਿਆਂ 'ਤੇ ਨਹੀਂ ਵੰਡਿਆ ਜਾ ਸਕੇਗਾ, ਇਸ ਲਈ ਬਚੀ ਹੋਈ ਜਗ੍ਹਾ ਵੰਡਣ ਲਈ Spacer ਦੀ ਲੋੜ ਪੈਂਦੀ ਹੈ।

Spacer ਇੱਕ elastic layout view ਹੈ, ਜੋ ਆਪਣੇ ਆਪ ਬਚੀ ਹੋਈ ਜਗ੍ਹਾ ਭਰ ਲੈਂਦਾ ਹੈ।

ਵਰਤੋਂ ਦਾ ਤਰੀਕਾ：

```swift
Spacer()
```

ਉਦਾਹਰਨ ਲਈ：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

ਜਦੋਂ ਅਸੀਂ Image ਅਤੇ Text ਦੇ ਵਿਚਕਾਰ Spacer ਸ਼ਾਮਲ ਕਰਦੇ ਹਾਂ, ਤਾਂ Spacer ਬਚੀ ਹੋਈ ਜਗ੍ਹਾ ਭਰ ਕੇ Image ਅਤੇ Text ਨੂੰ ਉੱਪਰ ਅਤੇ ਹੇਠਾਂ ਵੱਲ ਧੱਕ ਦਿੰਦਾ ਹੈ।

![Swift](../../RESOURCE/003_view1.png)

ਜੇ ਕਈ Spacer ਹੋਣ：

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

ਤਾਂ ਬਚੀ ਹੋਈ ਜਗ੍ਹਾ Spacers ਵਿੱਚ ਸਮਾਨ ਤਰੀਕੇ ਨਾਲ ਵੰਡ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ।

![Swift](../../RESOURCE/003_spacer.png)

## Image ਦਾ ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ size control

Image view ਮੁੱਖ ਤੌਰ 'ਤੇ ਤਸਵੀਰ ਦਿਖਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ ਸਿੱਖਿਆ SF Symbols icon, ਅਸਲ ਵਿੱਚ Image ਦੀ ਇੱਕ ਵਰਤੋਂ ਹੀ ਸੀ।

ਵਰਤੋਂ ਦਾ ਤਰੀਕਾ：

```swift
Image("imageName")
```

Image ਦੇ double quotes ਦੇ ਅੰਦਰ ਤਸਵੀਰ ਦਾ ਨਾਮ ਹੁੰਦਾ ਹੈ, suffix ਲਿਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਹੁੰਦੀ।

### ਤਸਵੀਰ ਦਿਖਾਉਣਾ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ ਇੱਕ ਤਸਵੀਰ ਤਿਆਰ ਕਰਦੇ ਹਾਂ।

![Swift](../../RESOURCE/003_img.jpg)

Xcode ਵਿੱਚ Assets resource folder ਚੁਣੋ ਅਤੇ ਤਸਵੀਰ ਨੂੰ Assets ਵਿੱਚ drag ਕਰੋ।

![Swift](../../RESOURCE/003_img1.png)

ContentView ਵਿੱਚ Image ਨਾਲ ਤਸਵੀਰ ਦਿਖਾਓ：

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

ਧਿਆਨ ਦਿਓ：SwiftUI ਦੀ Image, GIF animation ਨਹੀਂ ਚਲਾ ਸਕਦੀ; ਇਹ ਸਿਰਫ਼ static frame ਦਿਖਾਉਂਦੀ ਹੈ।

### ਤਸਵੀਰ ਦਾ size ਕੰਟਰੋਲ ਕਰਨਾ

SwiftUI ਵਿੱਚ, Image ਡਿਫ਼ਾਲਟ ਤੌਰ 'ਤੇ ਤਸਵੀਰ ਦੇ ਅਸਲੀ size ਨਾਲ ਦਿਖਦੀ ਹੈ। ਜੇ ਅਸੀਂ display size ਬਦਲਣਾ ਚਾਹੀਏ, ਤਾਂ ਪਹਿਲਾਂ resizable ਨਾਲ ਤਸਵੀਰ ਨੂੰ scalable ਬਣਾਉਣਾ ਪੈਂਦਾ ਹੈ, ਫਿਰ frame ਨਾਲ layout size ਨਿਰਧਾਰਤ ਕਰਨਾ ਪੈਂਦਾ ਹੈ।

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier

resizable modifier ਤਸਵੀਰ ਨੂੰ layout ਵਿੱਚ scale ਹੋਣ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ, ਤਾਂ ਜੋ ਇਹ fixed original size ਦੀ ਬਜਾਏ ਬਦਲੇ ਹੋਏ size ਵਿੱਚ ਦਿਖ ਸਕੇ।

```swift
.resizable()
```

ਸਿਰਫ਼ resizable() ਜੋੜਣ ਤੋਂ ਬਾਅਦ ਹੀ frame ਤਸਵੀਰ ਦੇ actual display size ਨੂੰ ਬਦਲ ਸਕਦਾ ਹੈ।

ਜੇ resizable ਨਾ ਲਾਇਆ ਜਾਵੇ：

```swift
Image("image")
    .frame(width: 50, height: 50)
```

ਤਾਂ frame ਸਿਰਫ਼ ਤਸਵੀਰ ਲਈ layout space ਦੇਵੇਗਾ, ਪਰ ਤਸਵੀਰ ਦਾ ਆਪਣੇ ਆਪ size ਨਹੀਂ ਬਦਲੇਗਾ।

### frame modifier

frame(width:height) view ਦੀ width ਅਤੇ height ਨਿਰਧਾਰਤ ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਮੁੱਢਲਾ syntax：

```swift
.frame(width: 10,height: 10)
```

ਉਦਾਹਰਨ ਲਈ, ਤਸਵੀਰ ਨੂੰ width 300 ਅਤੇ height 100 ਵਾਲੇ rectangle ਵਾਂਗ ਸੈੱਟ ਕਰਨਾ।

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Width ਜਾਂ height ਨੂੰ ਵੱਖ-ਵੱਖ ਵੀ ਸੈੱਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ：

```swift
.frame(width: 200)
.frame(height: 100)
```

resizable + frame ਦਾ ਸੰਯੋਗ ਤਸਵੀਰ ਦੇ display size ਨੂੰ ਬਹੁਤ ਲਚਕੀਲੇ ਢੰਗ ਨਾਲ ਕੰਟਰੋਲ ਕਰ ਸਕਦਾ ਹੈ, ਅਤੇ ਇਸਦੀ scalable nature ਵੀ ਕਾਇਮ ਰੱਖਦਾ ਹੈ।

### Scale ratio: scaledToFit ਅਤੇ scaledToFill

ਜਦੋਂ ਅਸੀਂ frame ਨਾਲ width ਅਤੇ height ਦਾ ratio ਅਸਲੀ ਤਸਵੀਰ ਨਾਲ ਨਹੀਂ ਮਿਲਦਾ, ਤਾਂ ਤਸਵੀਰ ਖਿੱਚੀ ਹੋਈ ਅਤੇ ਵਿਗੜੀ ਹੋਈ ਦਿਖ ਸਕਦੀ ਹੈ।

ਜੇ ਅਸੀਂ ਤਸਵੀਰ ਦਾ ratio ਕਾਇਮ ਰੱਖਦੇ ਹੋਏ ਇਸਨੂੰ ਉਪਲਬਧ layout space ਵਿੱਚ ਫਿੱਟ ਕਰਨਾ ਚਾਹੀਏ, ਤਾਂ ਅਸੀਂ scaledToFit ਜਾਂ scaledToFill ਵਰਤ ਸਕਦੇ ਹਾਂ।

**scaledToFit**

scaledToFit ਤਸਵੀਰ ਦਾ ਅਸਲੀ width-height ratio ਕਾਇਮ ਰੱਖਦਾ ਹੈ ਅਤੇ ਤਸਵੀਰ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ scale ਕਰਦਾ ਹੈ ਕਿ ਉਹ ਪੂਰੀ ਤਰ੍ਹਾਂ ਉਪਲਬਧ space ਵਿੱਚ ਆ ਜਾਵੇ, ਬਿਨਾਂ crop ਹੋਏ：

```swift
.scaledToFit()
```

ਜਾਂ

```swift
.aspectRatio(contentMode: .fit)
```

ਇਹ ਤਰੀਕਾ ਉਹਨਾਂ ਮੌਕਿਆਂ ਲਈ ਢੁੱਕਵਾਂ ਹੈ ਜਿੱਥੇ ਪੂਰੀ ਤਸਵੀਰ ਦਿਖਾਉਣੀ ਹੋਵੇ ਅਤੇ distortion ਨਾ ਆਵੇ।

ਜੇ ਹਰ ਤਸਵੀਰ ਨੂੰ ਇੱਕੋ width ਅਤੇ height ਦਿੱਤੀ ਜਾਵੇ, ਤਾਂ stretching ਹੋਣ ਦੀ ਸੰਭਾਵਨਾ ਰਹਿੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ：

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

ਜਦੋਂ scaling mode ਸੈੱਟ ਨਹੀਂ ਕੀਤਾ ਹੁੰਦਾ, ਤਸਵੀਰ ਆਪਣੀ ਅਸਲੀ proportion ਵਿੱਚ ਨਹੀਂ ਦਿਖਦੀ।

![Swift](../../RESOURCE/003_img4.png)

scaledToFit ਸੈੱਟ ਕਰਨ ਨਾਲ ਤਸਵੀਰ ਆਪਣੀ ਅਸਲੀ proportion ਕਾਇਮ ਰੱਖਦੀ ਹੈ।

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill ਵੀ ਤਸਵੀਰ ਦੀ proportion ਕਾਇਮ ਰੱਖਦਾ ਹੈ, ਪਰ ਇਹ ਪੂਰੀ ਉਪਲਬਧ space ਨੂੰ ਭਰ ਦਿੰਦਾ ਹੈ। ਜੇ ratio ਵੱਖਰਾ ਹੋਵੇ, ਤਾਂ ਵਾਧੂ ਹਿੱਸਾ crop ਹੋ ਜਾਂਦਾ ਹੈ：

```swift
.scaledToFill()
```

ਜਾਂ

```swift
.aspectRatio(contentMode: .fill)
```

ਇਹ ਤਰੀਕਾ ਉਹਨਾਂ ਮੌਕਿਆਂ ਲਈ ਢੁੱਕਵਾਂ ਹੈ ਜਿੱਥੇ ਤਸਵੀਰ ਨੂੰ ਪੂਰੇ ਖੇਤਰ ਨੂੰ cover ਕਰਨਾ ਹੋਵੇ, ਜਿਵੇਂ background image ਜਾਂ banner। ਖਾਸ ਕਰਕੇ background ਵਜੋਂ ਵਰਤੋਂ ਲਈ ਇਹ ਉਪਯੋਗੀ ਹੈ।

**ਦੋਵਾਂ ਵਿੱਚ ਫ਼ਰਕ**

![Swift](../../RESOURCE/003_img6.png)

## ਲਿਖਤ

SwiftUI ਵਿੱਚ, Text ਲਿਖਤ ਦਿਖਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਮੁੱਢਲਾ syntax：

```swift
Text("FangJunyu")
```

ਅਸੀਂ ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ Text ਸਿੱਖੀ ਸੀ। ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਹੋਰ ਅੱਗੇ ਵਧਕੇ ਇਹ ਸਿੱਖਾਂਗੇ ਕਿ font size ਅਤੇ thickness ਕਿਵੇਂ ਕੰਟਰੋਲ ਕੀਤੀ ਜਾਵੇ, ਤਾਂ ਜੋ text view ਵਿੱਚ ਹੋਰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਲੱਗੇ।

### ਫੌਂਟ ਦਾ size

font modifier ਨਾਲ text ਦਾ size ਕੰਟਰੋਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ：

```swift
.font(.title)
```

ਉਦਾਹਰਨ ਲਈ：

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

ਆਮ font sizes (ਵੱਡੇ ਤੋਂ ਛੋਟੇ ਤੱਕ)：

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### ਫੌਂਟ ਦੀ ਮੋਟਾਈ

ਜੇ ਅਸੀਂ text ਨੂੰ bold ਕਰਨਾ ਚਾਹੀਏ, ਤਾਂ fontWeight modifier ਵਰਤ ਸਕਦੇ ਹਾਂ：

```swift
.fontWeight(.bold)
```

ਉਦਾਹਰਨ ਲਈ：

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

ਆਮ font weights (ਪਤਲੇ ਤੋਂ ਮੋਟੇ ਤੱਕ)：

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font, size ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ ਅਤੇ fontWeight, thickness ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ। ਦੋਨੋਂ ਨੂੰ ਮਿਲਾਕੇ ਵਰਤਣ ਨਾਲ text ਦੀ presentation ਹੋਰ ਸਮਰੱਥ ਬਣਾਈ ਜਾ ਸਕਦੀ ਹੈ।

## ਸਾਰ ਅਤੇ ਅਭਿਆਸ

ਹੁਣ ਤੱਕ ਅਸੀਂ SwiftUI ਦੇ default layout, Spacer, Image ਅਤੇ Text ਵਰਗੇ ਬੁਨਿਆਦੀ ਗਿਆਨ ਸਿੱਖ ਲਏ ਹਨ। ਇਹ ਸਮੱਗਰੀ ਕੁਝ ਸਧਾਰਣ views ਬਣਾਉਣ ਲਈ ਕਾਫ਼ੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ：[Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google ਦਾ interface ਬਹੁਤ ਸਾਫ਼ ਅਤੇ ਸਧਾਰਣ ਹੈ। ਇਸ ਵਿੱਚ images ਅਤੇ text ਹਨ। ਅਸੀਂ SwiftUI ਦੇ ਨਜ਼ਰੀਏ ਨਾਲ Google ਦੇ interface structure ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰ ਸਕਦੇ ਹਾਂ：

1. ਪੂਰੇ layout ਨੂੰ ਤਿੰਨ ਹਿੱਸਿਆਂ ਵਿੱਚ ਵੰਡਿਆ ਜਾ ਸਕਦਾ ਹੈ：Google logo, search box ਅਤੇ prompt text। ਇਸ ਲਈ VStack ਨਾਲ vertical ਕ੍ਰਮ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।
2. Google logo ਇੱਕ image ਹੈ, ਜਿਸਨੂੰ Image ਨਾਲ ਦਿਖਾਇਆ ਜਾ ਸਕਦਾ ਹੈ।
3. Search box ਵਿੱਚ input field ਅਤੇ icon ਹੁੰਦੇ ਹਨ। ਜੇ input field ਨੂੰ ਅਸਥਾਈ ਤੌਰ 'ਤੇ ਨਜ਼ਰਅੰਦਾਜ਼ ਕੀਤਾ ਜਾਵੇ, ਤਾਂ search icon ਨੂੰ Image ਨਾਲ ਦਿਖਾਇਆ ਜਾ ਸਕਦਾ ਹੈ।
4. Prompt text ਨੂੰ Text ਨਾਲ ਦਿਖਾਇਆ ਜਾ ਸਕਦਾ ਹੈ। Text ਦੀ horizontal arrangement ਲਈ HStack ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ, ਅਤੇ text color ਨੂੰ foregroundStyle ਨਾਲ ਕੰਟਰੋਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਇਹਨਾਂ concepts ਦਾ ਅਭਿਆਸ ਕਰਕੇ, ਅਸੀਂ ਕੁਝ ਸਧਾਰਣ views ਤਿਆਰ ਕਰ ਸਕਦੇ ਹਾਂ ਅਤੇ Image, Text ਅਤੇ ਉਹਨਾਂ ਦੇ modifiers ਦੀ ਸਮਝ ਅਤੇ ਵਰਤੋਂ ਨੂੰ ਹੋਰ ਮਜ਼ਬੂਤ ਕਰ ਸਕਦੇ ਹਾਂ।
