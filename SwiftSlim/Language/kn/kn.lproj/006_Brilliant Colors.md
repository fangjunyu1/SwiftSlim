# ಮನೋಹರ ಬಣ್ಣಗಳು

ಈ ಪಾಠದಲ್ಲಿ ನಾವು SwiftUI ಯಲ್ಲಿನ ಸಾಮಾನ್ಯ visual modifiers ಗಳನ್ನು ಕಲಿಯುತ್ತೇವೆ. ಇದರಲ್ಲಿ ಇವು ಸೇರಿವೆ:

- ಬಣ್ಣ
- foreground color
- background color
- offset
- transparency
- blur

ಇದರ ಜೊತೆಗೆ Safe Area (ಭದ್ರ ಪ್ರದೇಶ) ಯನ್ನೂ ಕಲಿಯುತ್ತೇವೆ.

ಈ modifiers view ಯ ಹೊರಾಂಗಣವನ್ನು ನಿಯಂತ್ರಿಸಲು ಬಳಸಲ್ಪಡುತ್ತವೆ, ಇದರಿಂದ ಇಂಟರ್ಫೇಸ್ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗಿಯೂ ಪದರೀಕೃತವಾಗಿಯೂ ಕಾಣುತ್ತದೆ.

## ಬಣ್ಣ

SwiftUI ಯಲ್ಲಿ ಪಠ್ಯದ ಬಣ್ಣವನ್ನು ಹೊಂದಿಸಬಹುದು.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` ಅಂದರೆ ನೀಲಿ ಬಣ್ಣ. ವಾಸ್ತವವಾಗಿ ಇದು `Color.blue` ನ ಸಂಕ್ಷಿಪ್ತ ಬರಹ (type inference).

ಸಾಮಾನ್ಯ ಬಣ್ಣಗಳು:

```
.black
.green
.yellow
.pink
.gray
...
```

ಇವೆಲ್ಲವೂ `Color` ನ static properties.

![Color](../../RESOURCE/006_color.png)

`Color` ಅನ್ನು ಒಂದು color type ಎಂದುಕೊಳ್ಳಬಹುದು, ಮತ್ತು `.blue`, `.red` ಅದರ ನಿಜವಾದ ಬಣ್ಣ ಮೌಲ್ಯಗಳು.

### Color view

SwiftUI ಯಲ್ಲಿ `Color` ನ್ನೇ view ಆಗಿಯೂ ತೋರಿಸಬಹುದು.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

ಈ ಕೋಡ್ 100×100 ಗಾತ್ರದ ಕೆಂಪು ಚೌಕವನ್ನು ನಿರ್ಮಿಸುತ್ತದೆ.

ಪೂರ್ತಿ ಇಂಟರ್ಫೇಸ್ ಒಂದೇ ಬಣ್ಣವಾಗಿ ತೋರಿಸಲು ಸಹ ಬಳಸಬಹುದು:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

ಇದನ್ನು ಚಾಲನೆ ಮಾಡಿದ ನಂತರ, ಕೆಂಪು ಬಣ್ಣ ಸಂಪೂರ್ಣ ಪರದೆಯನ್ನು ತುಂಬಿಲ್ಲವೆಂದು ಕಾಣುತ್ತದೆ; iPhone ಮೇಲ್ಭಾಗ ಮತ್ತು ಕೆಳಭಾಗ ಇನ್ನೂ ಬಿಳಿಯಾಗಿಯೇ ಇವೆ. ಇದಕ್ಕೆ Safe Area (ಭದ್ರ ಪ್ರದೇಶ) ಸಂಬಂಧಿಸಿದೆ.

## Safe Area (ಭದ್ರ ಪ್ರದೇಶ)

Safe Area ಎನ್ನುವುದು ವಿಷಯವು ಮರೆಯಾಗದಂತೆ ಸಿಸ್ಟಮ್ ಮೀಸಲಿಡುವ ಪ್ರದೇಶವಾಗಿದೆ. ಇದರಲ್ಲಿ ಇವು ಸೇರಿವೆ:

1. ಮೇಲ್ಭಾಗದ status bar (ಸಮಯ, ಬ್ಯಾಟರಿ)

2. ಕೆಳಭಾಗದ Home indicator

3. notch ಅಥವಾ Dynamic Island ಪ್ರದೇಶ

![Color](../../RESOURCE/006_color3.png)

SwiftUI ಡೀಫಾಲ್ಟ್ ಆಗಿ ವಿಷಯವನ್ನು Safe Area ಒಳಗೆ ಮಾತ್ರ ಸೀಮಿತಗೊಳಿಸುತ್ತದೆ, ಆದ್ದರಿಂದ view ಪರದೆಯ ಅಂಚುಗಳವರೆಗೆ ವಿಸ್ತರಿಸುವುದಿಲ್ಲ.

### Safe Area ಅನ್ನು ನಿರ್ಲಕ್ಷಿಸುವುದು

ಬಣ್ಣವು ಸಂಪೂರ್ಣ ಪರದೆಯನ್ನು ಮುಚ್ಚಬೇಕೆಂದರೆ, `ignoresSafeArea` ಬಳಸಬಹುದು:

```swift
Color.red
    .ignoresSafeArea()
```

ಅಥವಾ `edgesIgnoringSafeArea` ಬಳಸಬಹುದು:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

ಇದರಿಂದ view ಸಂಪೂರ್ಣ ಪರದೆಗೇ ವಿಸ್ತರಿಸುತ್ತದೆ.

ಗಮನಿಸಬೇಕಾದದ್ದು, `edgesIgnoringSafeArea` ಹಳೆಯ ರೀತಿಯ ಬರವಣಿಗೆ. iOS 14 ಇಂದ `ignoresSafeArea` ಅನ್ನು ಬಳಸುವುದು ಶಿಫಾರಸು.

## ಮುಂಭಾಗದ ಬಣ್ಣ

### foregroundStyle modifier

ಹಿಂದಿನ ಪಾಠಗಳಲ್ಲಿ ನಾವು `foregroundStyle` ಬಳಸಿ ಬಣ್ಣವನ್ನು ಹೇಗೆ ಹೊಂದಿಸುವುದು ಎಂದು ಕಲಿತಿದ್ದೇವೆ.

ಉದಾಹರಣೆಗೆ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` ಎನ್ನುವುದು ಹೊಸ ಶೈಲಿ ವ್ಯವಸ್ಥೆಯಾಗಿದ್ದು, ಬಣ್ಣ, gradient, material ಮುಂತಾದವುಗಳಿಗೆ ಬೆಂಬಲ ನೀಡುತ್ತದೆ.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier

`foregroundColor` ಬಳಸಿಯೂ ಬಣ್ಣವನ್ನು ಹೊಂದಿಸಬಹುದು:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

ಇದರ ಬಳಕೆ `foregroundStyle` ನಂತೆಯೇ.

ಇತ್ತೀಚಿನ Xcode ಆವೃತ್ತಿಗಳಲ್ಲಿ `foregroundColor` ಭವಿಷ್ಯದ iOS ಆವೃತ್ತಿಗಳಲ್ಲಿ obsolete ಆಗಬಹುದು ಎಂದು ಸೂಚನೆ ಬರುತ್ತದೆ, ಆದ್ದರಿಂದ ಮೊದಲ ಆದ್ಯತೆಯಾಗಿ `foregroundStyle` ಬಳಸುವುದು ಉತ್ತಮ.

## ಹಿನ್ನೆಲೆ

view ಗೆ background color ಸೇರಿಸಬೇಕಾದರೆ, `background` ಅನ್ನು ಬಳಸಬಹುದು:

```swift
background(.red)
```

ಉದಾಹರಣೆಗೆ, ಪಠ್ಯಕ್ಕೆ background color ನೀಡುವುದು:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome ಮುಂತಾದ App‌ಗಳಲ್ಲಿ ಪಠ್ಯವನ್ನು ಆಯ್ಕೆ ಮಾಡಿದಾಗ ಇದೇ ತರಹದ background ಪರಿಣಾಮವನ್ನು ನೋಡಬಹುದು.

![Color](../../RESOURCE/006_color16.png)

background ಅನ್ನು ಹೆಚ್ಚಾಗಿ ಕಾಣುವಂತೆ ಮಾಡಬೇಕಾದರೆ, `padding` ಜೊತೆಗೆ ಬಳಸಬೇಕು:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

ಇಲ್ಲಿ ಒಂದು ಪ್ರಮುಖ ನಿಯಮ ಗಮನಿಸಬೇಕು:

SwiftUI modifiers ಗಳು view ಅನ್ನು ಮೇಲಿಂದ ಕೆಳಗೆ ಕ್ರಮವಾಗಿ ನಿರ್ಮಿಸುತ್ತವೆ. ನಂತರ ಬರೆದ modifier, ಮೊದಲು ನಿರ್ಮಿತವಾದ ಫಲಿತಾಂಶಕ್ಕೆ ಅನ್ವಯಿಸುತ್ತದೆ.

ಆದ್ದರಿಂದ:

```swift
.padding()
.background()
```

ಇದರಿಂದ background, padding ಸೇರಿಸಿದ ನಂತರದ view ಅನ್ನು ಸುತ್ತುವರಿಯುತ್ತದೆ.

ಕ್ರಮವನ್ನು ಬದಲಿಸಿದರೆ:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Background ವಿಸ್ತರಿಸುವುದಿಲ್ಲ, ಏಕೆಂದರೆ ಅದು ನಂತರದ `padding` ಅನ್ನು ಒಳಗೊಂಡಿಲ್ಲ.

## ಉದಾಹರಣೆ - ನಾಲ್ಕು ಮೂಲೆ ನಟ್

ಈಗ ನಾವು ಸರಳವಾದ ನಾಲ್ಕು-ಮೂಲೆ ನಟ್ ಮಾದರಿಯ view ನಿರ್ಮಿಸೋಣ.

![Color](../../RESOURCE/006_color8.png)

ಮೊದಲು 50 × 50 ಗಾತ್ರದ ಬಿಳಿ ಚೌಕವನ್ನು ನಿರ್ಮಿಸೋಣ:

```swift
Color.white
    .frame(width: 50, height: 50)
```

ಅದನ್ನು ವೃತ್ತಾಕಾರಗೊಳಿಸಬೇಕಾದರೆ `cornerRadius` ಬಳಸಬಹುದು:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Round corner radius ಅಗಲ ಮತ್ತು ಎತ್ತರದ ಅರ್ಧದಷ್ಟಿದ್ದಾಗ, ಅದು ವೃತ್ತವಾಗುತ್ತದೆ.

ಈಗ ನೀಲಿ background ಸೇರಿಸೋಣ:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

ಹೊಸ `padding` ಹೊರಗಿನ ಪ್ರದೇಶವನ್ನು ವಿಸ್ತರಿಸುತ್ತದೆ, ಮತ್ತು `background` ಆ ವಿಸ್ತರಿಸಿದ ಹೊರಭಾಗದಲ್ಲಿ ನೀಲಿ ಬಣ್ಣವನ್ನು ಚಿತ್ರಿಸುತ್ತದೆ.

ಹೀಗೆ ಒಂದು ನಾಲ್ಕು-ಮೂಲೆ ನಟ್ ರೀತಿಯ ಪರಿಣಾಮ ಸಿದ್ಧವಾಗುತ್ತದೆ.

### ಮತ್ತೊಂದು ವಿಧಾನ

Background color ಬಳಸಿ ಈ ಪರಿಣಾಮವನ್ನು ನಿರ್ಮಿಸುವುದರ ಹೊರತಾಗಿ, `ZStack` ಬಳಸಿಯೂ ಇದನ್ನು ನಿರ್ಮಿಸಬಹುದು.

ಹಿಂದೆ ನಾವು `ZStack` overlay ترتيب ಮಾಡಲು ಬಳಸಲಾಗುತ್ತದೆ ಎಂದು ಕಲಿತಿದ್ದೇವೆ. ಈ ನಾಲ್ಕು-ಮೂಲೆ ನಟ್ ಅನ್ನು ಒಂದು ವೃತ್ತ ಮತ್ತು ಒಂದು ಚೌಕ overlay ಆಗಿ ನೋಡಬಹುದು.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` view‌ಗಳನ್ನು ಕ್ರಮವಾಗಿ ಒಂದರ ಮೇಲೆ ಒಂದು overlay ಮಾಡುತ್ತದೆ; ನಂತರ ಸೇರಿಸಿದ view ಮೇಲಿನ ಪದರದಲ್ಲಿ ಕಾಣುತ್ತದೆ.

## ಉದಾಹರಣೆ - ಒಂದರ ಮೇಲೊಂದು ಇರಿಸಿದ ಎರಡು ವೃತ್ತಗಳು

ಹೆಚ್ಚಿನ ಐಕಾನ್‌ಗಳು ಸರಳ ಆಕಾರಗಳ overlay ಮೂಲಕ ನಿರ್ಮಿತವಾಗಿರುತ್ತವೆ. ಉದಾಹರಣೆಗೆ, ಒಂದರ ಮೇಲೊಂದು ಇರಿಸಿದ ಎರಡು ವೃತ್ತಗಳು.

![Color](../../RESOURCE/006_color14.png)

ಮೊದಲು ಎರಡು ವೃತ್ತಗಳನ್ನು ರಚಿಸೋಣ:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

ಈ ಎರಡು ವೃತ್ತಗಳು ಒಂದರ ಮೇಲೆ ಒಂದಾಗಿ ಕಾಣಬೇಕು, ಆದ್ದರಿಂದ `ZStack` layout ಬಳಸುತ್ತೇವೆ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

ಈಗ ಎರಡೂ ಸಮಾನ ಗಾತ್ರದ ವೃತ್ತಗಳು ಸಂಪೂರ್ಣವಾಗಿ ಒಂದರ ಮೇಲೊಂದು ಬಂದಿವೆ.

ಆದರೆ ನಾವು ಬಯಸಿರುವುದು, ಅವು ಸಂಪೂರ್ಣವಾಗಿ ಒಂದರ ಮೇಲೊಂದು ಮುಚ್ಚಿಕೊಳ್ಳದೇ, ಭಾಗಶಃ ಮಾತ್ರ overlay ಆಗಿರಬೇಕು. ಇದಕ್ಕಾಗಿ `offset` ಬಳಸಬಹುದು.

## Offset

`offset` view ಯಾವ ಜಾಗದಲ್ಲಿ ಚಿತ್ರಿತವಾಗಬೇಕು ಅನ್ನುವುದನ್ನು ಮಾತ್ರ ಬದಲಿಸುತ್ತದೆ; parent view layout ಲೆಕ್ಕಾಚಾರವನ್ನು ಇದು ಬದಲಿಸುವುದಿಲ್ಲ.

ಬಳಕೆ:

```swift
.offset(x:y:)
```

`x` ಅಡ್ಡ ದಿಕ್ಕಿನ offset, `y` ಲಂಬ ದಿಕ್ಕಿನ offset.

ಧನಾತ್ಮಕ ಮೌಲ್ಯ ಎಂದರೆ ಬಲಕ್ಕೆ/ಕೆಳಕ್ಕೆ ಸರಿಯುವುದು, ಋಣಾತ್ಮಕ ಮೌಲ್ಯ ಎಂದರೆ ಎಡಕ್ಕೆ/ಮೇಲಕ್ಕೆ ಸರಿಯುವುದು.

ಎರಡು ವೃತ್ತಗಳನ್ನು ಭಾಗಶಃ overlay ಆಗುವಂತೆ ಮಾಡಲು `offset` ಬಳಸೋಣ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

ಕೆಂಪು ವೃತ್ತದ layout ಸ್ಥಾನ ಬದಲಾಗುವುದಿಲ್ಲ, ಆದರೆ ಅದನ್ನು ಎಡಕ್ಕೆ 25 ಪಾಯಿಂಟ್ ಸರಿಸಿ ಚಿತ್ರಿಸಲಾಗುತ್ತದೆ. ಆದ್ದರಿಂದ ಎರಡು ವೃತ್ತಗಳು ಭಾಗಶಃ overlay ಆಗಿರುವ ದೃಶ್ಯ ಪರಿಣಾಮ ಸೃಷ್ಟಿಯಾಗುತ್ತದೆ.

## ಪಾರದರ್ಶಕತೆ

SwiftUI ಯಲ್ಲಿ `opacity` ಅನ್ನು view ಪಾರದರ್ಶಕತೆ ಹೊಂದಿಸಲು ಬಳಸುತ್ತಾರೆ.

ಮೂಲ ಬಳಕೆ:

```swift
.opacity(0.5)
```

`opacity` ಮೌಲ್ಯ 0.0 ರಿಂದ 1.0 ವರೆಗೆ ಇರುತ್ತದೆ, ಇಲ್ಲಿ:

- 0 ಅಂದರೆ ಸಂಪೂರ್ಣ ಪಾರದರ್ಶಕ
- 1 ಅಂದರೆ ಪಾರದರ್ಶಕತೆ ಇಲ್ಲ

ಕೆಂಪು-ಕಿತ್ತಳೆ ವೃತ್ತಗಳಲ್ಲಿ ಕಿತ್ತಳೆ ವೃತ್ತದ ಪಾರದರ್ಶಕತೆಯನ್ನು ಹೀಗೆ ಹೊಂದಿಸಬಹುದು:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

ಕಿತ್ತಳೆ ವೃತ್ತದ opacity 0.8 ಇದ್ದರೆ, ಅದರ ಅಸ್ಪಷ್ಟತೆ 80% ಆಗಿರುತ್ತದೆ. ಎರಡು ವೃತ್ತಗಳು ಒತ್ತಿಕೊಂಡಿರುವ ಭಾಗದಲ್ಲಿ ಬಣ್ಣ ಮಿಶ್ರಣದ ಪರಿಣಾಮ ಕಾಣಿಸುತ್ತದೆ.

## Blur

SwiftUI ಯಲ್ಲಿ `blur` ಬಳಸಿ ಮುಸುಕು ಪರಿಣಾಮವನ್ನು ರಚಿಸಬಹುದು:

```swift
.blur(radius:10)
```

`radius` ಮುಸುಕು ಪರಿಣಾಮದ ವ್ಯಾಪ್ತಿಯನ್ನು ನಿರ್ಧರಿಸುತ್ತದೆ; ಮೌಲ್ಯ ದೊಡ್ಡದಾದಷ್ಟು ಪರಿಣಾಮ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

ಈಗ ಎರಡು ವೃತ್ತಗಳಿಗೆ blur ಪರಿಣಾಮ ಸೇರಿಸೋಣ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

ಇದರಿಂದ ಕೊನೆಯಲ್ಲಿ ಎರಡು ತುಂಬಾ blur ಆಗಿರುವ ವೃತ್ತಗಳನ್ನು ನೋಡಬಹುದು.

## ಸಾರಾಂಶ

ಈ ಪಾಠವು SwiftUI ಯಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸುವ visual modifiers ಬಗ್ಗೆ ಕೇಂದ್ರೀಕೃತವಾಗಿತ್ತು. ನಾವು modifiers ಬಳಸಿ view ಗಳ ಬಣ್ಣ, ಸ್ಥಾನ ಹಾಗೂ ದೃಶ್ಯ ಪರಿಣಾಮಗಳನ್ನು ಹೇಗೆ ನಿಯಂತ್ರಿಸಬಹುದು ಎಂದು ಕಲಿತೇವೆ.

ನೈಜ ಉದಾಹರಣೆಗಳ ಮೂಲಕ, ವಿವಿಧ visual modifiers ಇಂಟರ್ಫೇಸ್‌ನಲ್ಲಿ ಹೇಗೆ ಕೆಲಸ ಮಾಡುತ್ತವೆ ಎಂಬುದನ್ನು ಕಂಡೆವು, ಮತ್ತು Safe Area ಕುರಿತು ಅರಿವು ಗಳಿಸಿದೆವು.

ಇವೆಲ್ಲವೂ ಅತ್ಯಂತ ಮೂಲಭೂತ modifiers ಆಗಿವೆ. ಅವನ್ನು ಹೆಚ್ಚು ಅಭ್ಯಾಸ ಮಾಡಿ, ಬಳಸಿ ನೋಡಿದರೆ ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಇಂಟರ್ಫೇಸ್ ಪರಿಣಾಮವನ್ನು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗಿ ನಿಯಂತ್ರಿಸಬಹುದು.

### ಪಾಠಾನಂತರದ ಅಭ್ಯಾಸ

- ಒಂದು ಚಿತ್ರಕ್ಕೆ transparency ಮತ್ತು blur ಪರಿಣಾಮಗಳನ್ನು ಸೇರಿಸಿ
- ವಿಭಿನ್ನ transparency ಇರುವ ಮೂರು overlay circles ರಚಿಸಿ
- ಸಂಪೂರ್ಣ ಪರದೆಯನ್ನು ತುಂಬುವ background image ರಚಿಸಿ, Safe Area ಅನ್ನು ನಿರ್ಲಕ್ಷಿಸಿ
- ಅನೇಕ view ಗಳ ಸ್ಥಾನವನ್ನು `offset` ಮೂಲಕ ಸರಿಹೊಂದಿಸಿ

ಈ ಅಭ್ಯಾಸಗಳ ಉದ್ದೇಶ API ನೆನಪಿಸಿಕೊಳ್ಳುವುದು ಅಲ್ಲ; ಬದಲಿಗೆ visual ಬದಲಾವಣೆ ಮತ್ತು layout ವರ್ತನೆ ನಡುವಿನ ಸಂಬಂಧವನ್ನು ಗಮನಿಸುವುದಾಗಿದೆ.
