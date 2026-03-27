# ವೈಯಕ್ತಿಕ ರೆಸ್ಯೂಮ್ ಪುಟ ನಿರ್ಮಾಣ

ಈ ಪಾಠದಲ್ಲಿ ನಾವು ಸರಳವಾದ ಒಂದು ವೈಯಕ್ತಿಕ ರೆಸ್ಯೂಮ್ view ನಿರ್ಮಿಸುತ್ತೇವೆ, ಮತ್ತು ಈ ಕೆಳಗಿನ ವಿಷಯಗಳನ್ನು ಕಲಿಯುತ್ತೇವೆ:

- cornerRadius
- spacing
- ScrollView

ನಿರ್ಮಾಣ ಪ್ರಕ್ರಿಯೆಯಲ್ಲಿ ನಾವು layout, Text ಮತ್ತು Image ಮುಂತಾದ ಜ್ಞಾನವನ್ನು ಮರುಪರಿಶೀಲಿಸುತ್ತೇವೆ, ಜೊತೆಗೆ spacing ನಿಯಂತ್ರಣ ಮತ್ತು scroll ಪರಿಣಾಮವನ್ನು ಕೂಡ ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೇವೆ.

## ವೈಯಕ್ತಿಕ ರೆಸ್ಯೂಮ್

ಗುರಿ ಪರಿಣಾಮ:

![Swift](../../RESOURCE/004_img.png)

**ಮೊದಲು ಸ್ವತಂತ್ರವಾಗಿ ಪೂರ್ಣಗೊಳಿಸಲು ಪ್ರಯತ್ನಿಸಿ, ನಂತರ ಕೆಳಗಿನ ವಿವರಣೆಯನ್ನು ಓದಿರಿ.**

### ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ

ಹೊಸ iOS ಪ್ರಾಜೆಕ್ಟ್ ರಚಿಸಬಹುದು ಅಥವಾ ಹಿಂದಿನ ಪ್ರಾಜೆಕ್ಟ್‌ನನ್ನೇ ಮುಂದುವರಿಸಬಹುದು.

ಡೀಫಾಲ್ಟ್ ContentView ಕೋಡ್:

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

ಈಗ ಕೋಡ್ ಅನ್ನು ಖಾಲಿ ಮಾಡಿ, ನಿಮ್ಮದೇ ವಿಷಯವನ್ನು ಬರೆಯಲು ಆರಂಭಿಸಿರಿ:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### ಒಟ್ಟಾರೆ ರಚನೆ

ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ನಾವು ಸಾಮಾನ್ಯವಾಗಿ ಮೊದಲು ಒಟ್ಟಾರೆ ರಚನೆಯನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸುತ್ತೇವೆ.

ನಮ್ಮ ಪುಟದಲ್ಲಿ ಇವು ಸೇರಿವೆ:

1. ಶೀರ್ಷಿಕೆ
2. ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ
3. ವೈಯಕ್ತಿಕ ಪರಿಚಯ

ಹೊರಭಾಗದಲ್ಲಿ ಒಂದು `VStack` ಸೇರಿಸುತ್ತೇವೆ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` view ಗಳನ್ನು ಲಂಬವಾಗಿ ಕ್ರಮಬದ್ಧವಾಗಿ ಇರಿಸುತ್ತದೆ, ಜೊತೆಗೆ ಅವುಗಳ alignment ಮತ್ತು spacing ಅನ್ನು ನಿಯಂತ್ರಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.

### ಶೀರ್ಷಿಕೆ

ಮೊದಲು ಶೀರ್ಷಿಕೆಯನ್ನು ತೋರಿಸಲು ಒಂದು `Text` ರಚಿಸೋಣ.

ಇಲ್ಲಿ ನಾನು ನನ್ನ ಇಂಗ್ಲಿಷ್ ಹೆಸರನ್ನು ಶೀರ್ಷಿಕೆಯಾಗಿಡುತ್ತೇನೆ:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

ಶೀರ್ಷಿಕೆ ಸಾಮಾನ್ಯವಾಗಿ ದೊಡ್ಡದಾಗಿಯೂ bold ಆಗಿಯೂ ಇರುತ್ತದೆ, ಅದಕ್ಕಾಗಿ ಇಲ್ಲಿ `font` ಮತ್ತು `fontWeight` modifiers ಬಳಸುತ್ತೇವೆ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### ವಿನ್ಯಾಸ

SwiftUI ಯ ಡೀಫಾಲ್ಟ್ alignment `center`, ಆದ್ದರಿಂದ ಈಗ ಶೀರ್ಷಿಕೆ ContentView ನ ಮಧ್ಯಭಾಗದಲ್ಲಿ ತೋರುತ್ತಿದೆ.

![Swift](../../RESOURCE/004_img3.png)

ನಾವು ಶೀರ್ಷಿಕೆಯನ್ನು view ಯ ಮೇಲ್ಭಾಗದಲ್ಲಿ ತೋರಿಸಬೇಕು, ಇದಕ್ಕಾಗಿ layout ಅನ್ನು ಸರಿಪಡಿಸಲು `Spacer` ಬಳಸಬಹುದು:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` ಉಳಿದ ಖಾಲಿ ಜಾಗವನ್ನು ಪಡೆದು, `Text` ಅನ್ನು container ನ ಮೇಲ್ಭಾಗಕ್ಕೆ ತಳ್ಳುತ್ತದೆ.

![Swift](../../RESOURCE/004_img4.png)

### ಖಾಲಿ ಜಾಗ

ಪಠ್ಯ ಮೇಲ್ಭಾಗಕ್ಕೆ ತುಂಬಾ ಹತ್ತಿರವಾಗಿದೆ ಎಂದು ಅನ್ನಿಸಿದರೆ, `padding` ಅಥವಾ `Spacer` ಬಳಸಬಹುದು.

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

ಇದರಿಂದ `VStack` ಗೆ ಮೇಲ್ಭಾಗದ padding 20 ಆಗುತ್ತದೆ.

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

ಅಥವಾ `Spacer` ಬಳಸಿ ಅದರ `frame` ಎತ್ತರವನ್ನು ನಿಗದಿಪಡಿಸಿ, ನಿರ್ದಿಷ್ಟ ಎತ್ತರದ ಖಾಲಿ ಜಾಗವನ್ನು ಪಡೆಯಬಹುದು.

ಪರಿಣಾಮ:

![Swift](../../RESOURCE/004_img5.png)

### ಚಿತ್ರ

ನಮ್ಮದೇ ಒಂದು portrait ಫೋಟೋ ತಯಾರಿಸಿ Assets resource folder ಗೆ ಸೇರಿಸೋಣ.

![Swift](../../RESOURCE/004_img6.png)

ContentView ನಲ್ಲಿ `Image` ಬಳಸಿ ಚಿತ್ರ ತೋರಿಸುವುದು:

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

ಚಿತ್ರದ ಮೂಲ ಗಾತ್ರ ತುಂಬಾ ದೊಡ್ಡದಿರುವುದರಿಂದ, ಅದರ ಪ್ರದರ್ಶನ ಗಾತ್ರವನ್ನು `frame` ಮೂಲಕ ನಿಯಂತ್ರಿಸಬೇಕು.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

ಈ ಹಂತದಲ್ಲಿ ನಾವು ಒಂದು ಸಮಸ್ಯೆಯನ್ನು ಗಮನಿಸುತ್ತೇವೆ:

`frame` ನ ಅಗಲ-ಎತ್ತರ ಅನುಪಾತ ಚಿತ್ರದ ಮೂಲ ಅನುಪಾತಕ್ಕೆ ಸರಿಹೊಂದದಿದ್ದರೆ, ಚಿತ್ರ ವಿಕೃತಗೊಳ್ಳುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

ಚಿತ್ರ ವಿಕೃತವಾಗದಂತೆ ಇರಿಸಲು `scaledToFit` ಬಳಸಬೇಕು:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` ನ ಕೆಲಸ:

ಕೊಟ್ಟಿರುವ `frame` ಮಿತಿಯೊಳಗೆ, ಚಿತ್ರದ ಮೂಲ ಅನುಪಾತವನ್ನು ಉಳಿಸಿಕೊಂಡು scale ಮಾಡಿ, ಸಂಪೂರ್ಣ ಚಿತ್ರ ವಿಷಯವನ್ನು ತೋರಿಸುವುದು.

ಇದು ಚಿತ್ರವನ್ನು `frame` ಅನ್ನು ಸಂಪೂರ್ಣ ತುಂಬಿಸುವಂತೆ ಬಲವಂತವಾಗಿ ಎಳೆಯುವುದಿಲ್ಲ; ಬದಲಿಗೆ ಅಗಲ-ಎತ್ತರ ಅನುಪಾತವನ್ನು ಉಳಿಸಿಕೊಂಡು ಸಮಾನುಪಾತವಾಗಿ scale ಆಗುತ್ತದೆ, ಒಂದು ಬದಿ ಗಡಿಯವರೆಗೆ ಸರಿಹೊಂದುತ್ತದೆ.

ಅಂದರೆ:

- `frame` ಅಗಲ ಕಡಿಮೆ ಇದ್ದರೆ, ಚಿತ್ರ ಅಗಲವನ್ನು ಆಧರಿಸಿ scale ಆಗುತ್ತದೆ
- `frame` ಎತ್ತರ ಕಡಿಮೆ ಇದ್ದರೆ, ಚಿತ್ರ ಎತ್ತರವನ್ನು ಆಧರಿಸಿ scale ಆಗುತ್ತದೆ
- ಚಿತ್ರ ಯಾವಾಗಲೂ ಮೂಲ ಅನುಪಾತವನ್ನು ಉಳಿಸುತ್ತದೆ, ವಿಕೃತವಾಗುವುದಿಲ್ಲ

ಸಾಮಾನ್ಯವಾಗಿ ಒಂದು ದಿಕ್ಕಿನ ಗಾತ್ರವನ್ನೇ ನೀಡಬಹುದು. ಉದಾಹರಣೆಗೆ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

ಇದರಿಂದ ವ್ಯವಸ್ಥೆ ಅಗಲ 140 ಆಧರಿಸಿ ಸೂಕ್ತ ಎತ್ತರವನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಲೆಕ್ಕ ಹಾಕುತ್ತದೆ, ಜೊತೆಗೆ ಚಿತ್ರದ ಅನುಪಾತವನ್ನು ಉಳಿಸುತ್ತದೆ.

ನಿರ್ದಿಷ್ಟ ದೃಶ್ಯಾನುಪಾತವನ್ನು ಕಾಪಾಡಬೇಕು ಅಥವಾ ಜಟಿಲ layout ನಲ್ಲಿ ಚಿತ್ರ ಒತ್ತಡಕ್ಕೆ ಒಳಗಾಗಬಾರದೆಂದರೆ, ಅಗಲ ಮತ್ತು ಎತ್ತರ ಎರಡನ್ನೂ ಒಟ್ಟಿಗೆ ನಿರ್ಬಂಧಿಸಬಹುದು.

### ಸುತ್ತುಕೋಣೆ

ಚಿತ್ರವನ್ನು round corner ರೂಪದಲ್ಲಿ ತೋರಿಸಬೇಕೆಂದರೆ `cornerRadius` modifier ಬಳಸಬಹುದು:

```swift
.cornerRadius(10)
```

ಉದಾಹರಣೆಗೆ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image ಗೆ modifiers ನಂತರ `cornerRadius(20)` ಸೇರಿಸಿ.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` ಅಂದರೆ view ಗಡಿಯನ್ನು clip ಮಾಡಿ, 20 ರೌಂಡ್ ಕೋಣೆ ಅಳತೆಯನ್ನು ಅನ್ವಯಿಸುವುದು.

Round corner ಸೇರಿಸಿದ ನಂತರ, ಚಿತ್ರದ ನಾಲ್ಕು ಮೂಲೆಗಳೂ ವೃತ್ತಾಕಾರದಂತೆ ಕಾಣುತ್ತವೆ, ಇದರಿಂದ ದೃಶ್ಯ ಪರಿಣಾಮ ಇನ್ನಷ್ಟು ಮೃದುವಾಗಿಯೂ, ಆಧುನಿಕವಾಗಿಯೂ ಕಾಣುತ್ತದೆ.

ಈ ರೀತಿಯ ವಿನ್ಯಾಸ ಈಗಿನ ಇಂಟರ್ಫೇಸ್ ವಿನ್ಯಾಸಗಳಲ್ಲಿ ತುಂಬಾ ಸಾಮಾನ್ಯ. ಉದಾಹರಣೆಗೆ iOS App ಐಕಾನ್‌ಗಳು ಕೂಡ round rectangle ರೂಪ ಬಳಸುತ್ತವೆ (ಆದರೆ ಸಿಸ್ಟಮ್ ಐಕಾನ್‌ಗಳು ಸರಳ round corner ಅಲ್ಲ, ನಿರಂತರ curve ಇರುವ superellipse ಬಳಸುತ್ತವೆ).

### ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ

ಈಗ ಚಿತ್ರದ ಎಡಭಾಗದಲ್ಲಿರುವ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ ವಿಭಾಗವನ್ನು ನಿರ್ಮಿಸುತ್ತೇವೆ. ಇಂಟರ್ಫೇಸ್ ರಚನೆಯಿಂದ ನೋಡಿದರೆ, ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ ಮತ್ತು ಚಿತ್ರ ಅಡ್ಡವಾಗಿ ಇವೆ, ಆದ್ದರಿಂದ `HStack` ಬಳಸಬೇಕು.

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

ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ ವಿಷಯವು ಲಂಬವಾಗಿ ಜೋಡಿಸಲಾಗಿದೆ.

![Swift](../../RESOURCE/004_img11.png)

ಆದ್ದರಿಂದ ಹೊರಭಾಗದಲ್ಲಿ `HStack`, ವೈಯಕ್ತಿಕ ಮಾಹಿತಿಗೆ `VStack`, ಮತ್ತು ಪಠ್ಯಕ್ಕಾಗಿ `Text` ಬಳಸುತ್ತೇವೆ.

ಮೂಲ ರಚನೆ:

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

**ಫೀಲ್ಡ್ ಶೀರ್ಷಿಕೆಯನ್ನು bold ಮಾಡುವುದು**

Field name ಮತ್ತು field value ನಡುವಿನ ವ್ಯತ್ಯಾಸ ಸ್ಪಷ್ಟವಾಗಲು, field title ಗೆ `fontWeight` ಬಳಸಬಹುದು:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**ಪಠ್ಯವನ್ನು ಎಡಕ್ಕೆ alignment ಮಾಡುವುದು**

`VStack` ಡೀಫಾಲ್ಟ್ ಆಗಿ center alignment ನಲ್ಲಿರುತ್ತದೆ. ಎಲ್ಲಾ ಪಠ್ಯವೂ ಎಡಕ್ಕೆ ಸರಿಹೊಂದಬೇಕು ಎಂದರೆ alignment ನೀಡಬೇಕು:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` ಎಂದರೆ ಎಡಬದಿಗೆ alignment (left-to-right ಭಾಷಾ ಪರಿಸರದಲ್ಲಿ).

![Swift](../../RESOURCE/004_img14.png)

### ಅಂತರ

ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ ಮತ್ತು ಚಿತ್ರದ ನಡುವೆ ನಿಗದಿತ ಅಂತರ ಇರಬೇಕೆಂದರೆ, ನಾವು ಮೊದಲು `Spacer` ಮೂಲಕ ಖಾಲಿ ಜಾಗ ರಚಿಸುವುದನ್ನು ಕಲಿತಿದ್ದೇವೆ:

```swift
Spacer()
    .frame(width: 10)
```

ಆದರೆ `HStack` ನ `spacing` parameter ನ್ನೂ ಬಳಸಬಹುದು:

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

`spacing: 30` ಅಂದರೆ ಎರಡು child view ಗಳ ನಡುವಿನ ಅಂತರ 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**spacing ಎಂದರೆ ಏನು?**

`VStack`, `HStack`, `ZStack` ಒಳಗೆ `spacing` child view ಗಳ ನಡುವಿನ ದೂರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

ಈ `VStack` ಒಳಗಿನ child view ಗಳ ನಡುವಿನ ಅಂತರ 10pt ಆಗಿರುತ್ತದೆ.

![Swift](../../RESOURCE/004_img16.png)

ಗಮನಿಸಬೇಕಾದದ್ದು: `spacing` ಕೇವಲ “ನೆರೆಯ child view” ಗಳಿಗೆ ಮಾತ್ರ ಅನ್ವಯಿಸುತ್ತದೆ; nested container ಒಳಗಿನ layout ಗೆ ಇದು ಪ್ರಭಾವ ಬೀರುವುದಿಲ್ಲ.

**ಪಟ್ಟಿಯ ಒಳಗಿನ ಅಂತರ ನಿಯಂತ್ರಣ**

Fields ಗಳ ನಡುವಿನ ಅಂತರ ಹೆಚ್ಚಿಸಬೇಕೆಂದರೆ, ಸರಳವಾದ ವಿಧಾನವೆಂದರೆ `VStack` ಗೆ `spacing` ನೀಡುವುದು:

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

ಇದರಿಂದ ಎಲ್ಲಾ child view ಗಳ ನಡುವಿನ ಅಂತರ 10 pt ಆಗುತ್ತದೆ.

ಆದರೆ ಇಂಟರ್ಫೇಸ್ ಗಮನಿಸಿದರೆ, ಒಂದು ಸಮಸ್ಯೆ ಕಂಡುಬರುತ್ತದೆ:

Field group ಗಳ ಮಧ್ಯೆಯೂ ಅಂತರ ಬರುತ್ತದೆ, ಜೊತೆಗೆ field name ಮತ್ತು value ನಡುವೆಯೂ ಅದೇ ಪ್ರಮಾಣದ ಅಂತರ ಬರುತ್ತದೆ.

ಏಕೆಂದರೆ `spacing` ಪ್ರಸ್ತುತ container ನ ಎಲ್ಲಾ ನೇರ child view ಗಳಿಗೂ ಒಂದೇ ರೀತಿಯಲ್ಲಿ ಅನ್ವಯಿಸುತ್ತದೆ.

ಈ ರಚನೆಯಲ್ಲಿ ಪ್ರತಿಯೊಂದು `Text` ಹೊರಗಿನ `VStack` ನ ನೇರ child ಆಗಿದೆ, ಆದ್ದರಿಂದ ಎಲ್ಲ ಅಂತರವೂ ಒಂದೇ ಆಗುತ್ತದೆ.

Field group ಗಳ ನಡುವೆ ಅಂತರ ಇರಲಿ, ಆದರೆ field name ಮತ್ತು value ನಡುವೆ ಡೀಫಾಲ್ಟ್ compact ಅಂತರ ಇರಲಿ ಎಂದರೆ, “field name + field value” ಅನ್ನು ಒಂದು logical block ಎಂದು ನೋಡಬೇಕು, ಮತ್ತು ಅದನ್ನು ಹೊರಗೆ ಒಂದು `VStack` ನಿಂದ ಹೊದಿಸಬೇಕು:

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

ಈಗ ರಚನೆ ಹೀಗಾಗುತ್ತದೆ: ಹೊರಗಿನ `VStack` ಗಳ ಮಧ್ಯೆ ಅಂತರ ಇರುತ್ತದೆ, ಆದರೆ ಒಳಗಿನ `VStack` ಗಳಲ್ಲಿ ಡೀಫಾಲ್ಟ್ compact spacing ಇರುತ್ತದೆ. ಆದ್ದರಿಂದ field name ಮತ್ತು field value ನಡುವೆ ಹೆಚ್ಚುವರಿ ಖಾಲಿ ಜಾಗ ಕಾಣಿಸುವುದಿಲ್ಲ.

![Swift](../../RESOURCE/004_img18.png)

### ವೈಯಕ್ತಿಕ ಪರಿಚಯ

ಮುಂದೆ ವೈಯಕ್ತಿಕ ಪರಿಚಯ ಭಾಗವನ್ನು ನಿರ್ಮಿಸೋಣ.

ಇಂಟರ್ಫೇಸ್ ರಚನೆಯ ಪ್ರಕಾರ, ಪರಿಚಯದ ವಿಷಯವು ಹಲವಾರು ಸಾಲುಗಳ ಪಠ್ಯದಿಂದ ಕೂಡಿದೆ, ಮತ್ತು ಅದು ಲಂಬವಾಗಿ ಜೋಡಿಸಲಾಗಿದೆ.

![Swift](../../RESOURCE/004_img19.png)

ಆದ್ದರಿಂದ `VStack` ಜೊತೆ `Text` ಬಳಸಬಹುದು:

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

**ಅಂತರ ಹೆಚ್ಚಿಸುವುದು**

ಈಗ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ ಮತ್ತು ಪರಿಚಯ ಭಾಗಗಳು ತುಂಬಾ ಹತ್ತಿರವಾಗಿವೆ, ಆದ್ದರಿಂದ ದೃಶ್ಯಶೈಲಿ ಅಷ್ಟು ಸುಂದರವಾಗಿಲ್ಲ.

![Swift](../../RESOURCE/004_img20.png)

ಇವು ಎರಡೂ ಒಂದೇ ಹೊರಗಿನ container ಒಳಗೆ ಇರುವುದರಿಂದ, ಒಟ್ಟು spacing ಅನ್ನು ಹೊರಗಿನ container ನಲ್ಲೇ ನಿಯಂತ್ರಿಸಬಹುದು:

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

ಪರಿಣಾಮ:

![Swift](../../RESOURCE/004_img21.png)

**ಪಟ್ಟಿ spacing**

ವೈಯಕ್ತಿಕ ಪರಿಚಯದ ಪಠ್ಯ ಸಾಲುಗಳ ನಡುವಿನ ಅಂತರವನ್ನು `spacing` ಮೂಲಕ ಹೊಂದಿಸಬಹುದು:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### ವೈಯಕ್ತಿಕ ರೆಸ್ಯೂಮ್ ಪೂರ್ಣಗೊಳಿಸುವುದು

ಈಗ ನಮ್ಮ ವೈಯಕ್ತಿಕ ರೆಸ್ಯೂಮ್‌ನ ಮೂಲ ಚೌಕಟ್ಟು ಪೂರ್ಣಗೊಂಡಿದೆ.

![Swift](../../RESOURCE/004_img.png)

### Scroll view

ಈಗ ಪುಟದ ರಚನೆ `VStack` ಆಧಾರಿತವಾಗಿದೆ. ಪರಿಚಯದ ಪಠ್ಯ ಸಾಲುಗಳು ಕಡಿಮೆ ಇದ್ದರೆ ಸಮಸ್ಯೆಯಿಲ್ಲ, ಆದರೆ ಅದನ್ನು 20, 30 ಅಥವಾ ಇನ್ನಷ್ಟು ಸಾಲುಗಳಿಗೆ ಹೆಚ್ಚಿಸಿದರೆ, ಅದರ ಎತ್ತರ ಪರದೆಯನ್ನು ಮೀರಬಹುದು.

ಉದಾಹರಣೆಗೆ:

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

ಅಂತಹಾಗೆ ಎರಡು ಸಂಗತಿಗಳು ಕಾಣಿಸುತ್ತವೆ:

- ಕೆಳಗಿನ ವಿಷಯ ಕತ್ತರಿಸಲ್ಪಡುತ್ತದೆ
- ಪುಟವನ್ನು scroll ಮಾಡಲಾಗುವುದಿಲ್ಲ

ಇದು `VStack` ಸಮಸ್ಯೆಯಲ್ಲ. `VStack` ಕೇವಲ ಒಂದು layout container ಮಾತ್ರ; ಅದು ಸ್ವಯಂಚಾಲಿತವಾಗಿ scrolling ಸಾಮರ್ಥ್ಯ ಕೊಡುವುದಿಲ್ಲ.

**ScrollView ಎಂದರೆ ಏನು**

`ScrollView` ಒಂದು scroll ಮಾಡಬಹುದಾದ container ಆಗಿದ್ದು, ಪರದೆ ಗಾತ್ರ ಮೀರುವ ಹೆಚ್ಚಿನ ವಿಷಯಗಳಿಗೆ ಇದು ಸೂಕ್ತ. ಉದಾಹರಣೆಗೆ vertical ಅಥವಾ horizontal ಪಟ್ಟಿಗಳು.

ಮೂಲ ರಚನೆ:

```swift
ScrollView {
    ...
}
```

Scroll ಪರಿಣಾಮ ಬೇಕಾದರೆ, ಸಂಪೂರ್ಣ ಪುಟದ ವಿಷಯವನ್ನು `ScrollView` ಒಳಗೆ ಹೊದಿಸಬೇಕು:

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

ಈ ರೀತಿಯಾಗಿ, ಸಂಪೂರ್ಣ ಪುಟವೇ scroll ಮಾಡಬಹುದಾದ ಪ್ರದೇಶವಾಗುತ್ತದೆ. ವಿಷಯವು ಪರದೆ ಎತ್ತರ ಮೀರಿದಾಗ, ಸ್ವಾಭಾವಿಕವಾಗಿ scroll ಮಾಡಬಹುದು.

`ScrollView` ಡೀಫಾಲ್ಟ್ ಆಗಿ scroll indicator ತೋರಿಸುತ್ತದೆ; ಅದನ್ನು ಮರೆಮಾಡಬೇಕೆಂದರೆ:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## ಸಂಪೂರ್ಣ ಕೋಡ್

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
