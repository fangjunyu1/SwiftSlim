# ಲೇಔಟ್, ಚಿತ್ರಗಳು ಮತ್ತು ಪಠ್ಯ

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ ನಾವು ಈ ContentView ಕೋಡ್ ಅನ್ನು ಕಲಿತಿದ್ದೇವೆ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ಈ ಪಾಠದಲ್ಲಿ ನಾವು SwiftUI ಯ ಡೀಫಾಲ್ಟ್ layout ವಿಧಾನವನ್ನು, ಹಾಗೆಯೇ ಚಿತ್ರ ಮತ್ತು ಪಠ್ಯ ಬಳಸುವ ವಿಧಾನವನ್ನು ಕಲಿಯುತ್ತೇವೆ. ಹಿಂದಿನ ಪಾಠದ ಆಧಾರದ ಮೇಲೆ view ರಚನೆ ಮತ್ತು ಅದು ಹೇಗೆ ತೋರುತ್ತದೆ ಎಂಬುದನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೇವೆ. ಈ ಜ್ಞಾನದಿಂದ ನಾವು ಮೂಲಭೂತ ಇಂಟರ್ಫೇಸ್ layout‌ಗಳನ್ನು ನಿರ್ಮಿಸಬಹುದು.

## SwiftUI ಯ ಡೀಫಾಲ್ಟ್ layout ವ್ಯವಸ್ಥೆ

ContentView preview ನೋಡಿದಾಗ, ಐಕಾನ್ ಮತ್ತು ಪಠ್ಯ ಮೇಲ್ಭಾಗದಿಂದ ಆರಂಭಿಸದೆ ಮಧ್ಯದಲ್ಲಿ ಕೇಂದ್ರಿತವಾಗಿ ಕಾಣಿಸುತ್ತವೆ.

![Swift](../../RESOURCE/003_view.png)

ಡೀಫಾಲ್ಟ್ ಆಗಿ Stack container ನ alignment `.center` ಆಗಿರುತ್ತದೆ, ಆದ್ದರಿಂದ ಅದರೊಳಗಿನ view‌ಗಳು ಸಾಮಾನ್ಯವಾಗಿ ಮಧ್ಯದಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ.

### Alignment ಸರಿಹೊಂದಿಸುವ ವಿಧಾನ

ಕೇಂದ್ರ ಸರಿಹೊಂದಿಸುವಿಕೆ alignment ವಿಧಾನಗಳಲ್ಲಿ ಕೇವಲ ಒಂದೇ ಒಂದು. ನಮಗೆ ಎಡಬದಿಗೆ ಅಥವಾ ಬಲಬದಿಗೆ ಸರಿಹೊಂದಿಸಬೇಕಾದರೆ, `alignment` ಬಳಸಿ view alignment ಅನ್ನು ನಿಯಂತ್ರಿಸಬೇಕು.

```swift
alignment
```

SwiftUI ಯಲ್ಲಿ alignment ಸಾಮಾನ್ಯವಾಗಿ ಎರಡು ಸಂದರ್ಭಗಳಲ್ಲಿ ಬರುತ್ತದೆ:

**1. Stack container ನ alignment parameter**

ಉದಾಹರಣೆಗೆ, ContentView ನಲ್ಲಿ ಐಕಾನ್ ಮತ್ತು ಪಠ್ಯವನ್ನು ಎಡಕ್ಕೆ ಸರಿಹೊಂದಿಸಲು:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack` ನಲ್ಲಿ `alignment` ಅಡ್ಡ ದಿಕ್ಕಿನ alignment ಅನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.

Alignment ಆಯ್ಕೆಗಳು:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` ಅಡ್ಡ ترتيب ಆಗಿರುವುದರಿಂದ, ಅದರಲ್ಲಿ `alignment` ಲಂಬ ದಿಕ್ಕಿನ alignment ಅನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` overlay ترتیب ಆಗಿರುವುದರಿಂದ, `alignment` ಅಡ್ಡ ಅಥವಾ ಲಂಬ ಎರಡೂ ದಿಕ್ಕಿನ alignment ಅನ್ನು ನಿಯಂತ್ರಿಸಬಹುದು:

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

Alignment ಸ್ಪಷ್ಟವಾಗಿ ಕೊಟ್ಟಿರದಿದ್ದರೆ, `VStack`, `HStack`, `ZStack` ಎಲ್ಲವೂ ಡೀಫಾಲ್ಟ್ ಆಗಿ `.center` ಬಳಸುತ್ತವೆ.

**2. frame ಒಳಗಿನ alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

`frame` ಕೊಡುವ ಗಾತ್ರ view ಯ ಸ್ವಂತ ಗಾತ್ರಕ್ಕಿಂತ ದೊಡ್ಡದಾಗಿದ್ದರೆ, alignment ಆ view frame ಒಳಗೆ ಯಾವ ಸ್ಥಾನದಲ್ಲಿರಬೇಕು ಎಂಬುದನ್ನು ನಿರ್ಧರಿಸುತ್ತದೆ. `frame` ಬಗ್ಗೆ ಇನ್ನಷ್ಟು ಮುಂದೆ ಕಲಿಯುತ್ತೇವೆ; ಇಲ್ಲಿ ಈಗ ಸಣ್ಣ ಪರಿಚಯ ಸಾಕು.

### Spacer ಮತ್ತು ಖಾಲಿ ಜಾಗ ಹಂಚಿಕೆ ವ್ಯವಸ್ಥೆ

`alignment` ಮೂಲಕ view ಗಳನ್ನು ಅಡ್ಡ ಅಥವಾ ಲಂಬವಾಗಿ ಸರಿಹೊಂದಿಸಬಹುದು. ಆದರೆ ನಮಗೆ ಪಠ್ಯ ಮತ್ತು ಚಿತ್ರವನ್ನು ಎರಡು ತುದಿಗಳಲ್ಲಿ ತೋರಿಸಬೇಕಾದರೆ, ಒಂದು alignment ಮಾತ್ರ ಸಾಕಾಗುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ, [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) ವೆಬ್‌ಸೈಟ್ ಮೇಲ್ಭಾಗದ view ಅನ್ನು ನಿರ್ಮಿಸಬೇಕೆಂದಿದ್ದರೆ, ಎಡಬದಿಯಲ್ಲಿ NHK ಐಕಾನ್ ಮತ್ತು ಬಲಬದಿಯಲ್ಲಿ menu icon ಇರಬಹುದು.

![Swift](../../RESOURCE/003_alignment3.png)

ನಾವು ಕೇವಲ alignment ಮಾತ್ರ ಬಳಸಿದರೆ, NHK ಐಕಾನ್ ಮತ್ತು menu icon ಎರಡೂ ಒಂದೇ ಬದಿಯಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ. ಅವುಗಳನ್ನು ಎಡ-ಬಲ ಎರಡು ಕಡೆ ಹಂಚಿ ತೋರಿಸಲಾಗುವುದಿಲ್ಲ. ಆದ್ದರಿಂದ ಉಳಿದ ಖಾಲಿ ಜಾಗವನ್ನು ಹಂಚಲು `Spacer` ಬೇಕಾಗುತ್ತದೆ.

`Spacer` ಎನ್ನುವುದು layout ಗೆ ಬಳಸುವ ಒಂದು flexible view ಆಗಿದ್ದು, ಅದು ಉಳಿದ ಖಾಲಿ ಜಾಗವನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತುಂಬುತ್ತದೆ.

ಬಳಕೆ:

```swift
Spacer()
```

ಉದಾಹರಣೆಗೆ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Image ಮತ್ತು Text ನಡುವೆ `Spacer` ಸೇರಿಸಿದಾಗ, ಅದು ಉಳಿದ ಖಾಲಿ ಜಾಗವನ್ನು ತುಂಬಿ Image ಮತ್ತು Text ಅನ್ನು ಕ್ರಮವಾಗಿ ಮೇಲಿನ ಹಾಗೂ ಕೆಳಗಿನ ತುದಿಗಳತ್ತ ತಳ್ಳುತ್ತದೆ.

![Swift](../../RESOURCE/003_view1.png)

ಒಂದಕ್ಕಿಂತ ಹೆಚ್ಚು `Spacer` ಇದ್ದರೆ:

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

ಉಳಿದ ಜಾಗವನ್ನು Spacer ಗಳು ಸಮವಾಗಿ ಹಂಚಿಕೊಳ್ಳುತ್ತವೆ.

![Swift](../../RESOURCE/003_spacer.png)

## Image ತೋರಿಕೆ ಮತ್ತು ಗಾತ್ರ ನಿಯಂತ್ರಣ

`Image` view ಮುಖ್ಯವಾಗಿ ಚಿತ್ರಗಳನ್ನು ತೋರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ ಕಲಿತ SF Symbols ಐಕಾನ್‌ಗಳು `Image` ನ ಬಳಕೆಯ ಒಂದು ರೂಪ ಮಾತ್ರ.

ಬಳಕೆ:

```swift
Image("imageName")
```

ಡಬಲ್ ಕ್ವೋಟ್ ಒಳಗೆ ಚಿತ್ರದ ಹೆಸರು ಬರೆಯಬೇಕು; file extension ಬರೆಯಬೇಕಾಗಿಲ್ಲ.

### ಚಿತ್ರ ತೋರಿಸುವುದು

ಮೊದಲು ನಾವು ಒಂದು ಚಿತ್ರ ಸಿದ್ಧಪಡಿಸಬೇಕು.

![Swift](../../RESOURCE/003_img.jpg)

Xcode ನಲ್ಲಿ Assets resource folder ಆಯ್ಕೆ ಮಾಡಿ, ಆ ಚಿತ್ರವನ್ನು Assets ಗೆ drag ಮಾಡಿ.

![Swift](../../RESOURCE/003_img1.png)

ContentView ನಲ್ಲಿ `Image` ಬಳಸಿ ಚಿತ್ರ ತೋರಿಸುವುದು:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

ಗಮನಿಸಿ: SwiftUI ಯ `Image` GIF animation ಅನ್ನು ಪ್ಲೇ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ; ಅದು ಕೇವಲ static frame ಮಾತ್ರ ತೋರಿಸುತ್ತದೆ.

### ಚಿತ್ರದ ಗಾತ್ರ ನಿಯಂತ್ರಣ

SwiftUI ಯಲ್ಲಿ `Image` ಡೀಫಾಲ್ಟ್ ಆಗಿ ಮೂಲ ಚಿತ್ರದ ಗಾತ್ರದಲ್ಲೇ ತೋರುತ್ತದೆ. ಅದನ್ನು ಬದಲಿಸಲು ಮೊದಲು `resizable` ಬಳಸಿ ಚಿತ್ರವನ್ನು scale ಆಗುವಂತೆ ಮಾಡಬೇಕು, ನಂತರ `frame` ಬಳಸಿ layout ಗಾತ್ರವನ್ನು ನಿಗದಿಪಡಿಸಬೇಕು.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier

`resizable` modifier ಚಿತ್ರದ ಗಾತ್ರವನ್ನು layout ನಲ್ಲಿ scale ಆಗುವಂತೆ ಮಾಡುತ್ತದೆ; ಅಂದರೆ ಅದು ಮೂಲ ಗಾತ್ರಕ್ಕೆ ಸೀಮಿತವಾಗಿರುವುದಿಲ್ಲ.

```swift
.resizable()
```

`resizable()` ಸೇರಿಸಿದಾಗ ಮಾತ್ರ `frame` ಚಿತ್ರದ ನಿಜವಾದ ಪ್ರದರ್ಶನ ಗಾತ್ರವನ್ನು ಬದಲಾಯಿಸುತ್ತದೆ.

`resizable` ಬಿಡಿಸಿದರೆ:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

ಈ ಸಂದರ್ಭದಲ್ಲಿ `frame` ಕೇವಲ layout ಗೆ ಸ್ಥಳ ಒದಗಿಸುತ್ತದೆ; ಆದರೆ ಚಿತ್ರದ ಸ್ವಂತ ಗಾತ್ರ ಬದಲಾಗುವುದಿಲ್ಲ.

### frame modifier

`frame(width:height)` ಎನ್ನುವುದು view ಯ ಅಗಲ ಮತ್ತು ಎತ್ತರವನ್ನು ನಿಗದಿಪಡಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

ಮೂಲ ಬಳಕೆ:

```swift
.frame(width: 10,height: 10)
```

ಉದಾಹರಣೆಗೆ, ಚಿತ್ರದ ಅಗಲ 300 ಹಾಗೂ ಎತ್ತರ 100 ಆಗುವಂತೆ ಮಾಡುವುದು:


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

ಅಗಲ ಅಥವಾ ಎತ್ತರವನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿಯೂ ನೀಡಬಹುದು:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` ಸಂಯೋಜನೆ ಚಿತ್ರದ ಪ್ರದರ್ಶನ ಗಾತ್ರವನ್ನು ಇಂಟರ್ಫೇಸ್‌ನಲ್ಲಿ ಬಹಳ ಸುಗಮವಾಗಿ ನಿಯಂತ್ರಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ, ಜೊತೆಗೆ scale ಆಗುವ ಸಾಮರ್ಥ್ಯವನ್ನೂ ಉಳಿಸುತ್ತದೆ.

### ಪ್ರಮಾಣ ಸಂಬಂಧ: scaledToFit ಮತ್ತು scaledToFill

`frame` ಮೂಲಕ ನೀಡಿದ ಅಗಲ-ಎತ್ತರ ಅನುಪಾತ ಮತ್ತು ಚಿತ್ರದ ಮೂಲ ಅನುಪಾತ ಒಂದೇ ಆಗಿರದಿದ್ದರೆ, ಚಿತ್ರ ಎಳೆಯಲ್ಪಟ್ಟು ವಿಕೃತವಾಗಬಹುದು.

ಚಿತ್ರದ ಅನುಪಾತವನ್ನು ಉಳಿಸಿಕೊಂಡೇ, ಅದನ್ನು ಲಭ್ಯ layout ಜಾಗಕ್ಕೆ ಹೊಂದಿಸಲು `scaledToFit` ಅಥವಾ `scaledToFill` ಬಳಸಿ.

**scaledToFit**

`scaledToFit` ಚಿತ್ರத்தின் ಮೂಲ ಅಗಲ-ಎತ್ತರ ಅನುಪಾತವನ್ನು ಉಳಿಸಿಕೊಂಡು, ಅದು ಲಭ್ಯವಿರುವ ಜಾಗಕ್ಕೆ ಸಂಪೂರ್ಣವಾಗಿ ಸರಿಹೊಂದುವಂತೆ scale ಮಾಡುತ್ತದೆ; ಚಿತ್ರವನ್ನು crop ಮಾಡುವುದಿಲ್ಲ:

```swift
.scaledToFit()
```

ಅಥವಾ

```swift
.aspectRatio(contentMode: .fit)
```

ಈ ವಿಧಾನವು ಚಿತ್ರವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ತೋರಿಸಬೇಕಾದಾಗ ಮತ್ತು ಅದು ವಿಕೃತವಾಗಬಾರದೆಂದಾಗ ಉಪಯುಕ್ತವಾಗಿದೆ.

ಎಲ್ಲ ಚಿತ್ರಗಳಿಗೂ ಒಂದೇ ಅಗಲ-ಎತ್ತರ ನೀಡಿದರೆ, ಅವು ಎಳೆಯಲ್ಪಡುವ ಸಂಭವವಿದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Scale ಅನುಪಾತ ಕೊಡದಿದ್ದರೆ, ಚಿತ್ರವು ಮೂಲ ಅನುಪಾತದಲ್ಲಿ ಕಾಣಿಸದು.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` ಬಳಿಸಿದರೆ ಚಿತ್ರ ಮೂಲ ಅನುಪಾತವನ್ನು ಉಳಿಸುತ್ತದೆ.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` ಕೂಡ ಚಿತ್ರದ ಅನುಪಾತವನ್ನು ಉಳಿಸುತ್ತದೆ, ಆದರೆ ಅದು ಲಭ್ಯವಿರುವ ಜಾಗವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ತುಂಬುತ್ತದೆ. ಅನುಪಾತ ಬೇರೆ ಆಗಿದ್ದರೆ, ಮೀರಿದ ಭಾಗ crop ಆಗುತ್ತದೆ:

```swift
.scaledToFill()
```

ಅಥವಾ

```swift
.aspectRatio(contentMode: .fill)
```

ಈ ವಿಧಾನವು ಚಿತ್ರವು ಸಂಪೂರ್ಣ ಪ್ರದೇಶವನ್ನು ಮುಚ್ಚಬೇಕಾದ ಸಂದರ್ಭಗಳಿಗೆ ಸೂಕ್ತವಾಗಿದೆ, ಉದಾಹರಣೆಗೆ background image ಅಥವಾ banner. ಅಂದರೆ, ಚಿತ್ರವನ್ನು ಹಿನ್ನೆಲೆಯಾಗಿ ಬಳಸುವ ಸಂದರ್ಭಗಳಿಗೆ ಇದು ಹೆಚ್ಚು ಅನುಕೂಲ.

**ಈ ಎರಡರ ವ್ಯತ್ಯಾಸ**

![Swift](../../RESOURCE/003_img6.png)

## ಪಠ್ಯ

SwiftUI ಯಲ್ಲಿ `Text` ಅನ್ನು ಪಠ್ಯ ಪ್ರದರ್ಶನಕ್ಕೆ ಬಳಸುತ್ತಾರೆ.

ಮೂಲ ಬಳಕೆ:

```swift
Text("FangJunyu")
```

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ ನಾವು `Text` ಅನ್ನು ಪರಿಚಯಿಸಿಕೊಂಡಿದ್ದೇವೆ; ಈ ಪಾಠದಲ್ಲಿ ಅದರ font size ಮತ್ತು thickness ಅನ್ನು ಹೇಗೆ ನಿಯಂತ್ರಿಸುವುದು ಎಂಬುದನ್ನು ಕಲಿಯುತ್ತೇವೆ, ಇದರಿಂದ ಪಠ್ಯವು view ನಲ್ಲಿ ಹೆಚ್ಚು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಕಾಣಿಸುತ್ತದೆ.

### ಅಕ್ಷರ ಗಾತ್ರ

ಪಠ್ಯದ ಗಾತ್ರವನ್ನು `font` modifier ಮೂಲಕ ನಿಯಂತ್ರಿಸಬಹುದು:

```swift
.font(.title)
```

ಉದಾಹರಣೆಗೆ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

ಸಾಮಾನ್ಯವಾಗಿ ಬಳಕೆಯಾಗುವ font size ಗಳು (ದೊಡ್ಡದಿಂದ ಚಿಕ್ಕದಕ್ಕೆ):

```
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

### ಅಕ್ಷರದ ದಪ್ಪ

ಪಠ್ಯವನ್ನು bold ಮಾಡಬೇಕಾದರೆ `fontWeight` modifier ಬಳಸಬಹುದು:

```swift
.fontWeight(.bold)
```

ಉದಾಹರಣೆಗೆ:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

ಸಾಮಾನ್ಯವಾಗಿ ಬಳಕೆಯಾಗುವ font weight ಗಳು (ತೆಳುವಿನಿಂದ ಗಟ್ಟಿಯಾದವರೆಗೆ):

```
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

`font` ಅಕ್ಷರದ ಗಾತ್ರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ, `fontWeight` ದಪ್ಪವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ. ಇವೆರಡನ್ನೂ ಸೇರಿ ಬಳಿಸಿದರೆ ಪಠ್ಯ ಹೆಚ್ಚು ಅಭಿವ್ಯಕ್ತಿಪೂರ್ಣವಾಗುತ್ತದೆ.

## ಸಾರಾಂಶ ಮತ್ತು ಅಭ್ಯಾಸ

ಇಲ್ಲಿಯವರೆಗೆ ನಾವು SwiftUI ಯ ಡೀಫಾಲ್ಟ್ layout, `Spacer`, `Image`, ಮತ್ತು `Text` ಮೊದಲಾದ ಮೂಲಭೂತ ಜ್ಞಾನಗಳನ್ನು ಕಲಿತಿದ್ದೇವೆ. ಇವು ಸರಳ view ಗಳನ್ನು ನಿರ್ಮಿಸಲು ಸಾಕಷ್ಟು ಸಹಾಯ ಮಾಡುತ್ತವೆ.

ಉದಾಹರಣೆಗೆ: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google ಇಂಟರ್ಫೇಸ್ ಬಹಳ ಸ್ವಚ್ಛವಾಗಿದೆ, ಮತ್ತು ಅದರಲ್ಲೂ ಚಿತ್ರ ಹಾಗೂ ಪಠ್ಯ ಎರಡೂ ಇವೆ. SwiftUI ದೃಷ್ಟಿಯಿಂದ ಅದರ ರಚನೆಯನ್ನು ಹೀಗೆ ವಿಶ್ಲೇಷಿಸಬಹುದು:

1. ಒಟ್ಟಾರೆ ಇಂಟರ್ಫೇಸ್ ಮೂರು ಭಾಗಗಳಾಗಿ ಹಂಚಿದೆ: Google ಐಕಾನ್, ಹುಡುಕಾಟ ಬಾಕ್ಸ್, ಮತ್ತು ಸೂಚನಾ ಪಠ್ಯ. ಇದಕ್ಕಾಗಿ `VStack` vertical ترتيب ಬಳಸಬಹುದು.
2. Google ಐಕಾನ್ ಒಂದು ಚಿತ್ರವಾಗಿದ್ದು, ಅದನ್ನು `Image` ಮೂಲಕ ತೋರಿಸಬಹುದು.
3. ಹುಡುಕಾಟ ಬಾಕ್ಸ್‌ನಲ್ಲಿ input field ಹಾಗೂ icon ಇರುತ್ತವೆ. input field ಅನ್ನು ಕಡೆಗಣಿಸಿದರೆ, ಹುಡುಕಾಟ icon ಅನ್ನು `Image` ಮೂಲಕ ತೋರಿಸಬಹುದು.
4. ಸೂಚನಾ ಪಠ್ಯವನ್ನು `Text` ಮೂಲಕ ತೋರಿಸಬಹುದು. ಪಠ್ಯವನ್ನು horizontal ترتيب ಮಾಡಲು `HStack` ಬಳಸಿ, ಮತ್ತು font color ಗೆ `foregroundStyle` ಬಳಸಬಹುದು.

ಈ ಜ್ಞಾನಗಳನ್ನು ಅಭ್ಯಾಸ ಮಾಡುವ ಮೂಲಕ ನಾವು ಕೆಲವು ಸರಳ view‌ಗಳನ್ನು ನಿರ್ಮಿಸಬಹುದು, ಮತ್ತು `Image`, `Text` view‌ಗಳು ಹಾಗೂ ಅವುಗಳ modifier‌ಗಳ ಬಳಕೆಯನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.
