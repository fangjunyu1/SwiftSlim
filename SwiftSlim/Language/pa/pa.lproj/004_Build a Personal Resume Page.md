# ਨਿੱਜੀ ਰਿਜ਼ਿਊਮੇ ਪੇਜ ਬਣਾਉਣਾ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਨਿੱਜੀ ਰਿਜ਼ਿਊਮੇ view ਤਿਆਰ ਕਰਾਂਗੇ, ਅਤੇ ਹੇਠਾਂ ਦਿੱਤਾ ਗਿਆ ਗਿਆਨ ਸਿੱਖਾਂਗੇ：

- cornerRadius
- spacing
- ScrollView

ਬਣਾਉਣ ਦੀ ਪ੍ਰਕਿਰਿਆ ਵਿੱਚ, ਅਸੀਂ layout, Text ਅਤੇ Image ਵਰਗੇ ਗਿਆਨ ਦੀ ਦੁਹਰਾਈ ਕਰਾਂਗੇ, ਅਤੇ spacing control ਅਤੇ content scrolling ਦਾ ਪ੍ਰਭਾਵ ਲਾਗੂ ਕਰਾਂਗੇ।

## ਨਿੱਜੀ ਰਿਜ਼ਿਊਮੇ

ਟਾਰਗੇਟ ਪ੍ਰਭਾਵ：

![Swift](../../RESOURCE/004_img.png)

**ਕਿਰਪਾ ਕਰਕੇ ਪਹਿਲਾਂ ਇਸਨੂੰ ਆਪਣੇ ਆਪ ਪੂਰਾ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ, ਫਿਰ ਹੇਠਾਂ ਦਿੱਤੀ ਵਿਆਖਿਆ ਪੜ੍ਹੋ।**

### ਪ੍ਰੋਜੈਕਟ ਬਣਾਉਣਾ

ਨਵਾਂ iOS project ਬਣਾਓ, ਜਾਂ ਪਹਿਲਾਂ ਵਾਲੇ project ਨੂੰ ਹੀ ਜਾਰੀ ਰੱਖੋ।

ਡਿਫ਼ਾਲਟ ContentView ਕੋਡ：

```swift
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
```

ਹੁਣ ਇਹ ਕੋਡ ਸਾਫ਼ ਕਰੋ, ਅਤੇ ਆਪਣੀ ਸਮੱਗਰੀ ਲਿਖਣੀ ਸ਼ੁਰੂ ਕਰੋ：

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### ਸਮੁੱਚੀ ਬਣਤਰ

ਅਸਲ development ਵਿੱਚ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ ਪਹਿਲਾਂ overall structure ਡਿਜ਼ਾਇਨ ਕਰਦੇ ਹਾਂ।

ਸਾਡੇ page ਵਿੱਚ ਇਹ ਹਿੱਸੇ ਸ਼ਾਮਲ ਹਨ：

1. ਸਿਰਲੇਖ
2. ਨਿੱਜੀ ਜਾਣਕਾਰੀ
3. ਨਿੱਜੀ ਜਾਣ-ਪਛਾਣ

ਅਸੀਂ ਸਭ ਤੋਂ ਬਾਹਰ ਇੱਕ VStack ਸ਼ਾਮਲ ਕਰਦੇ ਹਾਂ：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack ਇਹ ਯਕੀਨੀ ਬਣਾਉਂਦਾ ਹੈ ਕਿ views vertical ਕ੍ਰਮ ਵਿੱਚ ਸੱਜਣ, ਅਤੇ ਇਹ views ਦੀ arrangement ਅਤੇ spacing ਨੂੰ ਕੰਟਰੋਲ ਕਰ ਸਕਦਾ ਹੈ।

### ਸਿਰਲੇਖ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ ਸਿਰਲੇਖ ਦਿਖਾਉਣ ਲਈ ਇੱਕ Text ਬਣਾਉਂਦੇ ਹਾਂ।

ਇੱਥੇ, ਮੈਂ ਸਿਰਲੇਖ ਵਜੋਂ ਆਪਣਾ ਅੰਗਰੇਜ਼ੀ ਨਾਮ ਵਰਤ ਰਿਹਾ ਹਾਂ：

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

ਸਿਰਲੇਖ ਆਮ ਤੌਰ 'ਤੇ ਵੱਡਾ ਅਤੇ bold ਹੁੰਦਾ ਹੈ, ਇਸ ਲਈ ਇੱਥੇ font ਅਤੇ fontWeight modifiers ਵਰਤੇ ਜਾਂਦੇ ਹਨ：

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### ਟਾਈਪੋਗ੍ਰਾਫੀ / ਲੇਆਉਟ

SwiftUI ਦੀ ਡਿਫ਼ਾਲਟ alignment center ਹੁੰਦੀ ਹੈ, ਇਸ ਲਈ ਹੁਣ ਸਿਰਲੇਖ ContentView ਦੇ ਵਿਚਕਾਰ ਦਿਖ ਰਿਹਾ ਹੈ।

![Swift](../../RESOURCE/004_img3.png)

ਸਾਨੂੰ ਸਿਰਲੇਖ ਨੂੰ view ਦੇ ਉੱਪਰਲੇ ਹਿੱਸੇ ਵਿੱਚ ਦਿਖਾਉਣਾ ਹੈ, ਇਸ ਲਈ ਅਸੀਂ layout ਨੂੰ ਠੀਕ ਕਰਨ ਲਈ Spacer ਵਰਤ ਸਕਦੇ ਹਾਂ：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer ਬਚੀ ਹੋਈ space ਨੂੰ ਘੇਰ ਲੈਂਦਾ ਹੈ, ਅਤੇ Text ਨੂੰ container ਦੇ ਉੱਪਰ ਧੱਕ ਦਿੰਦਾ ਹੈ।

![Swift](../../RESOURCE/004_img4.png)

### ਖਾਲੀ ਜਗ੍ਹਾ / ਸਫ਼ੈਦ ਥਾਂ

ਜੇ ਤੁਹਾਨੂੰ ਲੱਗੇ ਕਿ text ਉੱਪਰਲੇ ਕਿਨਾਰੇ ਦੇ ਬਹੁਤ ਨੇੜੇ ਹੈ, ਤਾਂ padding ਜਾਂ Spacer ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ।

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

ਇਹ VStack ਲਈ top padding ਨੂੰ 20 ਤੇ ਸੈੱਟ ਕਰਦਾ ਹੈ।

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

ਅਸੀਂ Spacer ਵੀ ਵਰਤ ਸਕਦੇ ਹਾਂ, ਅਤੇ frame ਦੀ height ਸੈੱਟ ਕਰਕੇ ਇੱਕ ਨਿਰਧਾਰਤ ਉਚਾਈ ਵਾਲੀ ਖਾਲੀ ਜਗ੍ਹਾ ਲੈ ਸਕਦੇ ਹਾਂ।

ਲਾਗੂ ਹੋਣ ਤੋਂ ਬਾਅਦ ਪ੍ਰਭਾਵ：

![Swift](../../RESOURCE/004_img5.png)

### ਤਸਵੀਰ

ਅਸੀਂ ਆਪਣੀ ਇੱਕ profile photo ਤਿਆਰ ਕਰਦੇ ਹਾਂ ਅਤੇ ਇਸਨੂੰ Assets resource folder ਵਿੱਚ ਰੱਖਦੇ ਹਾਂ।

![Swift](../../RESOURCE/004_img6.png)

ContentView ਵਿੱਚ Image ਨਾਲ ਤਸਵੀਰ ਦਿਖਾਓ：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

ਕਿਉਂਕਿ ਤਸਵੀਰ ਦਾ ਅਸਲੀ size ਵੱਡਾ ਹੈ, ਇਸ ਲਈ ਸਾਨੂੰ display size ਕੰਟਰੋਲ ਕਰਨ ਲਈ frame ਵਰਤਣਾ ਪਵੇਗਾ।

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

ਹੁਣ ਸਾਨੂੰ ਇੱਕ ਸਮੱਸਿਆ ਨਜ਼ਰ ਆਉਂਦੀ ਹੈ：

ਜੇ frame ਦੀ width ਅਤੇ height ਦਾ ਅਨੁਪਾਤ ਤਸਵੀਰ ਦੇ ਅਸਲੀ ਅਨੁਪਾਤ ਨਾਲ ਮੇਲ ਨਾ ਖਾਏ, ਤਾਂ ਤਸਵੀਰ ਵਿਗੜ ਜਾਵੇਗੀ।

ਉਦਾਹਰਨ ਲਈ：

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

ਤਸਵੀਰ ਨੂੰ ਵਿਗੜਣ ਤੋਂ ਬਚਾਉਣ ਲਈ, ਸਾਨੂੰ scaledToFit ਵਰਤਣਾ ਪਵੇਗਾ：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

scaledToFit ਦਾ ਅਰਥ ਹੈ：

ਦਿੱਤੇ ਹੋਏ frame ਦੀ ਹੱਦ ਦੇ ਅੰਦਰ, ਤਸਵੀਰ ਨੂੰ ਉਸਦੇ ਅਸਲੀ ਅਨੁਪਾਤ ਅਨੁਸਾਰ scale ਕੀਤਾ ਜਾਵੇ, ਅਤੇ ਪੂਰੀ ਤਸਵੀਰ ਦਿਖਾਈ ਜਾਵੇ।

ਇਹ ਤਸਵੀਰ ਨੂੰ ਜ਼ਬਰਦਸਤੀ ਪੂਰੇ frame ਵਿੱਚ ਖਿੱਚ ਕੇ ਨਹੀਂ ਭਰਦਾ, ਸਗੋਂ width-height proportion ਨੂੰ ਜਿਉਂ ਦਾ ਤਿਉਂ ਰੱਖਦਾ ਹੈ, ਅਤੇ proportional scaling ਕਰਦਾ ਹੈ, ਜਦ ਤੱਕ ਕਿਸੇ ਇੱਕ ਪਾਸੇ ਦੀ boundary ਨਾਲ ਤਸਵੀਰ ਠੀਕ-ਠੀਕ ਨਾ ਲੱਗ ਜਾਵੇ।

ਇਸਦਾ ਮਤਲਬ ਹੈ：

* ਜੇ frame ਦੀ width ਛੋਟੀ ਹੈ, ਤਾਂ ਤਸਵੀਰ width ਨੂੰ ਧਿਆਨ ਵਿੱਚ ਰੱਖ ਕੇ scale ਹੋਵੇਗੀ।
* ਜੇ frame ਦੀ height ਛੋਟੀ ਹੈ, ਤਾਂ ਤਸਵੀਰ height ਨੂੰ ਧਿਆਨ ਵਿੱਚ ਰੱਖ ਕੇ scale ਹੋਵੇਗੀ।
* ਤਸਵੀਰ ਹਮੇਸ਼ਾਂ ਆਪਣਾ ਅਸਲੀ ਅਨੁਪਾਤ ਰੱਖੇਗੀ, ਵਿਗੜੇਗੀ ਨਹੀਂ।

ਆਮ ਤੌਰ 'ਤੇ, ਇੱਕ ਹੀ direction ਦਾ size ਸੈੱਟ ਕਰਨਾ ਕਾਫ਼ੀ ਹੁੰਦਾ ਹੈ। ਉਦਾਹਰਨ ਲਈ：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

ਇਸ ਤਰ੍ਹਾਂ system width 140 ਦੇ ਅਧਾਰ 'ਤੇ ਆਪਣੇ ਆਪ ਢੁੱਕਵੀਂ height ਗਣਨਾ ਕਰੇਗਾ, ਅਤੇ ਤਸਵੀਰ ਦਾ proportion ਕਾਇਮ ਰੱਖੇਗਾ।

ਜੇ ਤੁਹਾਨੂੰ fixed visual ratio ਚਾਹੀਦੀ ਹੋਵੇ, ਜਾਂ ਤੁਸੀਂ ਜਟਿਲ layout ਵਿੱਚ ਤਸਵੀਰ ਦੇ compressed ਹੋਣ ਤੋਂ ਬਚਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ width ਅਤੇ height ਦੋਵੇਂ ਨੂੰ ਇਕੱਠਿਆਂ constrain ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

### ਗੋਲ ਕਿਨਾਰੇ

ਜੇ ਤੁਸੀਂ ਤਸਵੀਰ ਨੂੰ rounded corners ਨਾਲ ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ cornerRadius modifier ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ：

```swift
.cornerRadius(10)
```

ਉਦਾਹਰਨ ਲਈ：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image ਦੇ modifiers ਤੋਂ ਬਾਅਦ cornerRadius(20) ਸ਼ਾਮਲ ਕਰੋ।

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) ਦਾ ਅਰਥ ਹੈ ਕਿ view ਦੀ boundary ਨੂੰ crop ਕਰਕੇ 20 radius ਵਾਲੇ rounded corners ਲਗਾਏ ਜਾਣ।

Rounded corners ਸ਼ਾਮਲ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤਸਵੀਰ ਦੇ ਚਾਰੇ ਕੋਨੇ curved ਹੋ ਜਾਂਦੇ ਹਨ, ਜਿਸ ਨਾਲ visual effect ਹੋਰ ਨਰਮ ਅਤੇ ਆਧੁਨਿਕ ਦਿਖਦਾ ਹੈ।

ਇਹ design style ਆਜਕੱਲ ਦੀ interface design ਵਿੱਚ ਬਹੁਤ ਆਮ ਹੈ। ਉਦਾਹਰਨ ਲਈ, iOS ਦੇ app icons rounded rectangle style ਵਰਤਦੇ ਹਨ (ਹਾਲਾਂਕਿ system icons simple rounded corners ਦੀ ਬਜਾਏ continuous curvature ਵਾਲੇ superellipse shape ਵਰਤਦੇ ਹਨ)।

### ਨਿੱਜੀ ਜਾਣਕਾਰੀ

ਹੁਣ ਤਸਵੀਰ ਦੇ ਖੱਬੇ ਪਾਸੇ ਵਾਲਾ ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਖੇਤਰ ਬਣਾਉਣਾ ਸ਼ੁਰੂ ਕਰਦੇ ਹਾਂ। Interface structure ਤੋਂ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ personal information ਅਤੇ image horizontal arrangement ਵਿੱਚ ਹਨ, ਇਸ ਲਈ HStack ਵਰਤਣਾ ਪਵੇਗਾ।

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਦੀ ਸਮੱਗਰੀ vertical arrangement ਵਿੱਚ ਹੈ।

![Swift](../../RESOURCE/004_img11.png)

ਇਸ ਲਈ, outer layer ਵਿੱਚ HStack, ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਲਈ VStack, ਅਤੇ text content ਲਈ Text ਵਰਤੀ ਜਾਵੇਗੀ।

ਮੁੱਢਲੀ ਬਣਤਰ：

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**ਫ਼ੀਲਡ ਸਿਰਲੇਖਾਂ ਨੂੰ bold ਕਰਨਾ**

Field name ਅਤੇ field value ਵਿਚ ਫ਼ਰਕ ਸਪਸ਼ਟ ਕਰਨ ਲਈ, field name ਉੱਤੇ fontWeight ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ：

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Text ਨੂੰ ਖੱਬੇ ਪਾਸੇ align ਕਰਨਾ**

VStack ਦੀ ਡਿਫ਼ਾਲਟ alignment center ਹੁੰਦੀ ਹੈ। ਜੇ ਤੁਸੀਂ ਸਾਰਾ text left align ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ alignment ਸੈੱਟ ਕਰਨੀ ਪਵੇਗੀ：

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading ਦਾ ਅਰਥ ਹੈ ਖੱਬੇ ਪਾਸੇ alignment (left-to-right language environment ਵਿੱਚ)।

![Swift](../../RESOURCE/004_img14.png)

### ਫ਼ਾਸਲਾ / spacing

ਜੇ ਤੁਸੀਂ personal information ਅਤੇ image ਦੇ ਵਿਚਕਾਰ ਇੱਕ fixed gap ਰੱਖਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ ਪਹਿਲਾਂ ਅਸੀਂ Spacer ਨਾਲ ਖਾਲੀ ਜਗ੍ਹਾ ਬਣਾਉਣ ਦਾ ਤਰੀਕਾ ਸਿੱਖਿਆ ਸੀ：

```swift
Spacer()
    .frame(width: 10)
```

ਇਸ ਤੋਂ ਇਲਾਵਾ, HStack ਦਾ spacing parameter ਵੀ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ：

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 ਦਾ ਅਰਥ ਹੈ ਕਿ ਦੋ child views ਦੇ ਵਿਚਕਾਰ 30 pt ਦਾ gap ਹੋਵੇਗਾ।

![Swift](../../RESOURCE/004_img15.png)

**spacing ਕੀ ਹੈ?**

VStack, HStack ਅਤੇ ZStack ਵਿੱਚ, spacing child views ਦੇ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ ਕੰਟਰੋਲ ਕਰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ：

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

VStack ਦੇ child views ਦੀ spacing 10pt ਹੋ ਜਾਵੇਗੀ।

![Swift](../../RESOURCE/004_img16.png)

ਧਿਆਨ ਦਿਓ ਕਿ spacing ਸਿਰਫ਼ "direct child views" ਉੱਤੇ ਹੀ ਲਾਗੂ ਹੁੰਦੀ ਹੈ; ਇਹ nested containers ਦੇ ਅੰਦਰਲੇ layout ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦੀ।

**ਲਿਸਟ ਦੇ ਅੰਦਰ spacing ਕੰਟਰੋਲ ਕਰਨਾ**

ਜੇ ਤੁਸੀਂ fields ਦੇ ਵਿਚਕਾਰ gap ਵਧਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ ਸਭ ਤੋਂ ਸਿੱਧਾ ਤਰੀਕਾ ਹੈ VStack ਦੀ spacing ਸੈੱਟ ਕਰਨਾ：

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

ਇਸ ਤਰ੍ਹਾਂ ਸਾਰੇ child views ਦੇ ਵਿਚਕਾਰ ਦਾ gap 10 pt ਹੋ ਜਾਵੇਗਾ।

ਪਰ interface ਨੂੰ ਦੇਖਣ ਨਾਲ ਇੱਕ ਸਮੱਸਿਆ ਸਾਹਮਣੇ ਆਉਂਦੀ ਹੈ：

Field groups ਦੇ ਵਿਚਕਾਰ ਵੀ gap ਹੈ, ਅਤੇ field name ਅਤੇ field value ਦੇ ਵਿਚਕਾਰ ਵੀ ਉਹੀ gap ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ。

ਇਸਦਾ ਕਾਰਨ ਇਹ ਹੈ ਕਿ spacing ਮੌਜੂਦਾ container ਦੇ ਸਾਰੇ direct child views ਉੱਤੇ ਲਾਗੂ ਹੁੰਦੀ ਹੈ।

ਇਸ structure ਵਿੱਚ, ਹਰ Text outer VStack ਦਾ direct child view ਹੈ, ਇਸ ਲਈ spacing ਇੱਕੋ ਜਿਹੀ ਹੈ।

ਜੇ ਤੁਸੀਂ ਚਾਹੁੰਦੇ ਹੋ ਕਿ field groups ਦੇ ਵਿਚਕਾਰ gap ਹੋਵੇ, ਪਰ field name ਅਤੇ field value ਦੇ ਵਿਚਕਾਰ default compact spacing ਰਹੇ, ਤਾਂ "field name + field value" ਨੂੰ ਇੱਕ logical unit ਵਜੋਂ ਦੇਖ ਕੇ, ਬਾਹਰ ਇੱਕ VStack ਨਾਲ wrap ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ：

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

ਹੁਣ structure ਇਹ ਬਣ ਜਾਂਦੀ ਹੈ ਕਿ outer VStack ਦੇ groups ਦੇ ਵਿਚਕਾਰ spacing ਹੈ, ਅਤੇ inner VStack ਦੇ ਅੰਦਰ default compact spacing ਹੈ, ਇਸ ਲਈ field name ਅਤੇ field value ਦੇ ਵਿਚਕਾਰ ਵਾਧੂ gap ਨਹੀਂ ਆਉਂਦੀ।

![Swift](../../RESOURCE/004_img18.png)

### ਨਿੱਜੀ ਜਾਣ-ਪਛਾਣ

ਹੁਣ personal introduction ਖੇਤਰ ਬਣਾਉਂਦੇ ਹਾਂ।

Interface structure ਤੋਂ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ introduction content ਕਈ lines ਦੇ text ਨਾਲ ਬਣੀ ਹੈ, ਅਤੇ text vertically arranged ਹੈ।

![Swift](../../RESOURCE/004_img19.png)

ਇਸ ਲਈ, VStack ਨੂੰ Text ਨਾਲ ਮਿਲਾਕੇ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ：

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**spacing ਵਧਾਉਣਾ**

ਹੁਣ personal information ਅਤੇ personal introduction ਵਾਲੇ ਹਿੱਸੇ ਕੁਝ ਜ਼ਿਆਦਾ compact ਲੱਗਦੇ ਹਨ, ਇਸ ਲਈ style ਵਧੀਆ ਨਹੀਂ ਦਿਖਦੀ।

![Swift](../../RESOURCE/004_img20.png)

ਕਿਉਂਕਿ ਦੋਵੇਂ ਇੱਕੋ outer container ਵਿੱਚ ਹਨ, ਇਸ ਲਈ outer container 'ਤੇ overall spacing ਕੰਟਰੋਲ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ：

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

ਲਾਗੂ ਹੋਣ ਤੋਂ ਬਾਅਦ ਪ੍ਰਭਾਵ：

![Swift](../../RESOURCE/004_img21.png)

**ਲਿਸਟ spacing**

ਨਿੱਜੀ ਜਾਣ-ਪਛਾਣ ਵਾਲੇ texts ਦੇ ਵਿਚਕਾਰ spacing ਸੈੱਟ ਕਰਨ ਲਈ spacing ਵਰਤੋ：

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### ਨਿੱਜੀ ਰਿਜ਼ਿਊਮੇ ਪੂਰਾ ਕਰਨਾ

ਹੁਣ ਸਾਡੇ ਨਿੱਜੀ ਰਿਜ਼ਿਊਮੇ ਦਾ ਮੁੱਢਲਾ ਢਾਂਚਾ ਪੂਰਾ ਹੋ ਗਿਆ ਹੈ।

![Swift](../../RESOURCE/004_img.png)

### ScrollView

ਇਸ ਵੇਲੇ page structure VStack ਵਰਤ ਰਹੀ ਹੈ। ਜਦੋਂ introduction text ਘੱਟ ਹੋਵੇ, ਤਾਂ ਕੋਈ ਸਮੱਸਿਆ ਨਹੀਂ ਹੁੰਦੀ, ਪਰ ਜੇ ਇਸਨੂੰ 20, 30 ਜਾਂ ਇਸ ਤੋਂ ਵੀ ਵੱਧ lines ਤੱਕ ਵਧਾ ਦਿੱਤਾ ਜਾਵੇ, ਤਾਂ content ਦੀ height screen ਤੋਂ ਬਾਹਰ ਨਿਕਲ ਜਾਵੇਗੀ।

ਉਦਾਹਰਨ ਲਈ：

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

ਇਸ ਵੇਲੇ ਦੋ ਚੀਜ਼ਾਂ ਹੋਣਗੀਆਂ：

* ਹੇਠਾਂ ਵਾਲਾ content ਕੱਟਿਆ ਜਾਵੇਗਾ
* page scroll ਨਹੀਂ ਕਰੇਗਾ

ਇਹ VStack ਦੀ ਸਮੱਸਿਆ ਨਹੀਂ ਹੈ। VStack ਸਿਰਫ਼ ਇੱਕ layout container ਹੈ; ਇਹ ਆਪਣੇ ਆਪ scrolling capability ਨਹੀਂ ਦਿੰਦਾ।

**ScrollView ਕੀ ਹੈ**

ScrollView ਇੱਕ scroll ਹੋਣ ਵਾਲਾ container ਹੈ, ਜੋ screen size ਤੋਂ ਵੱਧ ਸਮੱਗਰੀ ਲਈ ਢੁੱਕਵਾਂ ਹੈ। ਉਦਾਹਰਨ ਲਈ vertical ਜਾਂ horizontal lists।

ਮੁੱਢਲੀ ਬਣਤਰ：

```swift
ScrollView {
    ...
}
```

ਜੇ scrolling effect ਲਾਗੂ ਕਰਨਾ ਹੋਵੇ, ਤਾਂ ਪੂਰੇ page content ਨੂੰ ScrollView ਨਾਲ wrap ਕਰਨਾ ਪਵੇਗਾ：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

ਇਸ ਤਰ੍ਹਾਂ ਪੂਰਾ page ਇੱਕ scrollable area ਬਣ ਜਾਂਦਾ ਹੈ। ਜਦੋਂ content screen height ਤੋਂ ਵੱਧ ਹੋ ਜਾਵੇ, ਤਾਂ ਇਹ ਕੁਦਰਤੀ ਤੌਰ 'ਤੇ scroll ਕਰ ਸਕਦਾ ਹੈ।

ScrollView ਡਿਫ਼ਾਲਟ ਤੌਰ 'ਤੇ scrollbar indicator ਦਿਖਾਉਂਦਾ ਹੈ। ਜੇ ਤੁਸੀਂ scrollbar ਲੁਕਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ ਇਹ ਸੈੱਟ ਕਰੋ：

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## ਪੂਰਾ ਕੋਡ

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
