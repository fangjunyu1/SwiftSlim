# ಫೋಟೋ ಗ್ಯಾಲರಿ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಒಂದು ಫೋಟೋ ಗ್ಯಾಲರಿ ಪುಟವನ್ನು ನಿರ್ಮಿಸುತ್ತೇವೆ.

![view](../../../Resource/032_view13.png)

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, ನಾವು `extension`, `self` ಮತ್ತು ಇನ್‌ಸ್ಟಾನ್ಸ್‌ಗಳ ಜ್ಞಾನವನ್ನು ಮರುಪರಿಶೀಲಿಸಿ, SwiftUI ನಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸುವ `Shape` ಆಕಾರಗಳನ್ನು ಕಲಿಯುತ್ತೇವೆ.

ಈ ಜ್ಞಾನದಿಂದ, ಸಾಮಾನ್ಯ ಚಿತ್ರಗಳನ್ನು ವೃತ್ತ, ಗೋಳಾಕಾರದ ಮೂಲೆಗಳಿರುವ ಆಯತ, ಕ್ಯಾಪ್ಸೂಲ್, ಅಂಡಾಕಾರ ಇತ್ಯಾದಿ ವಿಭಿನ್ನ ಶೈಲಿಗಳಾಗಿ ಕತ್ತರಿಸಿ, ಫೋಟೋಗಳಿಗೆ ಅಂಚಿನ ಪರಿಣಾಮಗಳನ್ನು ಸೇರಿಸಬಹುದು.

ಈ ಪಾಠದಲ್ಲಿ ಕೆಲವು ಹೊಸ ಕಲ್ಪನೆಗಳನ್ನು ಬಳಸುತ್ತೇವೆ: `Shape`, `clipShape`, `strokeBorder` ಮತ್ತು `overlay`.

ಇವುಗಳಲ್ಲಿ `clipShape` ಅನ್ನು ವೀಕ್ಷಣೆಯ ಆಕಾರವನ್ನು ಕತ್ತರಿಸಲು, `strokeBorder` ಅನ್ನು ಆಕಾರದ ಅಂಚನ್ನು ರಚಿಸಲು, ಮತ್ತು `overlay` ಅನ್ನು ಪ್ರಸ್ತುತ ವೀಕ್ಷಣೆಯ ಮೇಲ್ಭಾಗದಲ್ಲಿ ಹೊಸ ವೀಕ್ಷಣೆಯನ್ನು ಮೇಲಿಡಲು ಬಳಸಲಾಗುತ್ತದೆ.

## ಚಿತ್ರ ಸಂಪನ್ಮೂಲಗಳು

ಪ್ರಾರಂಭಿಸುವ ಮೊದಲು, ನಾವು ಕೆಲವು ಚಿತ್ರಗಳನ್ನು ಸಿದ್ಧಪಡಿಸಬೇಕು.

ನೀವು ನಿಮ್ಮದೇ ಫೋಟೋಗಳನ್ನು ಬಳಸಬಹುದು, ಅಥವಾ ಈ ಪಾಠದಲ್ಲಿ ನೀಡಿರುವ ಮಾದರಿ ಚಿತ್ರಗಳನ್ನು ಬಳಸಬಹುದು.

ಈ ಪಾಠದಲ್ಲಿನ ಮಾದರಿ ಫೋಟೋಗಳು [Pixabay](https://pixabay.com/) ವೆಬ್‌ಸೈಟ್‌ನಿಂದ ಬಂದಿವೆ:

[ದೃಶ್ಯ](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [ನರಿ](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [ಕಟ್ಟಡ](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [ಹೂವು](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [ಹಂಸ](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

ಚಿತ್ರಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ನಂತರ, ಅವನ್ನು `Assets` ಸಂಪನ್ಮೂಲ ಫೋಲ್ಡರ್‌ಗೆ ಸೇರಿಸಿ, ಕ್ರಮವಾಗಿ `1`, `2`, `3`, `4` ಮತ್ತು `5` ಎಂದು ಹೆಸರಿಸಿ.

![assets](../../../Resource/032_view17.png)

ಈ ರೀತಿಯಾಗಿ, SwiftUI ನಲ್ಲಿ `Image("1")`, `Image("2")` ಮುಂತಾದ ವಿಧಾನಗಳಿಂದ ಚಿತ್ರಗಳನ್ನು ಪ್ರದರ್ಶಿಸಬಹುದು.

## ಫೋಟೋಗಳನ್ನು ಪ್ರದರ್ಶಿಸುವುದು

ಮೊದಲು, `ContentView` ನಲ್ಲಿ 5 ಫೋಟೋಗಳನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತೇವೆ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![view](../../../Resource/032_view.png)

ಈ ಕೋಡ್‌ನಲ್ಲಿ, ಫೋಟೋ ಪಟ್ಟಿಯನ್ನು ಸ್ಕ್ರೋಲ್ ಆಗುವಂತೆ ಮಾಡಲು `ScrollView` ಅನ್ನು ಬಳಸುತ್ತೇವೆ, ಮತ್ತು ಅನೇಕ ಚಿತ್ರಗಳನ್ನು ಮೇಲಿನಿಂದ ಕೆಳಗೆ ಜೋಡಿಸಲು `VStack` ಅನ್ನು ಬಳಸುತ್ತೇವೆ.

ಪ್ರತಿ ಚಿತ್ರವೂ ತನ್ನ ಪ್ರದರ್ಶನ ಪರಿಣಾಮವನ್ನು ಹೊಂದಿಸಲು `.resizable()`, `.scaledToFit()` ಮತ್ತು `.frame(width: 300)` ಅನ್ನು ಬಳಸುತ್ತದೆ. ಇದರಿಂದ ಚಿತ್ರವನ್ನು ವಿಸ್ತರಿಸಬಹುದು, ಅದರ ಅನುಪಾತವನ್ನು ಉಳಿಸಬಹುದು ಮತ್ತು ಅಗಲವನ್ನು ಮಿತಿಗೊಳಿಸಬಹುದು.

`VStack` ಮೇಲಿನ `.padding(.vertical, 100)` ಅನ್ನು ಮೇಲಿನ ಮತ್ತು ಕೆಳಗಿನ ಅಂತರವನ್ನು ಹೆಚ್ಚಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಇದರಿಂದ ಮೊದಲ ಮತ್ತು ಕೊನೆಯ ಫೋಟೋಗಳು ಪರದೆಯ ಅಂಚಿಗೆ ತುಂಬಾ ಹತ್ತಿರವಾಗುವುದನ್ನು ತಪ್ಪಿಸಬಹುದು.

ಕೊನೆಯ `.ignoresSafeArea()` ಎಂದರೆ ಸ್ಕ್ರೋಲ್ ವೀಕ್ಷಣೆ ಸುರಕ್ಷಿತ ಪ್ರದೇಶವನ್ನು ನಿರ್ಲಕ್ಷಿಸುತ್ತದೆ. ಇದರಿಂದ ಸ್ಕ್ರೋಲ್ ಮಾಡುವಾಗ ಫೋಟೋಗಳು ಪರದೆಯ ಮೇಲ್ಭಾಗ ಮತ್ತು ಕೆಳಭಾಗದವರೆಗೆ ವಿಸ್ತರಿಸಿ, ಪುಟದ ಪ್ರದರ್ಶನ ಇನ್ನಷ್ಟು ಪೂರ್ಣವಾಗಿ ಕಾಣುತ್ತದೆ.

ಆದರೆ, ಈಗ 5 ಚಿತ್ರಗಳೂ ಒಂದೇ ರೀತಿಯ modifier ಗಳನ್ನು ಬಳಸುತ್ತಿವೆ:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

ಪುನರಾವರ್ತಿತ ಕೋಡ್ ಕಾಣಿಸಿದಾಗ, ಅದನ್ನು ಸುವ್ಯವಸ್ಥಿತಗೊಳಿಸಲು `extension` ಬಳಸುವುದನ್ನು ಪರಿಗಣಿಸಬಹುದು.

## ಚಿತ್ರ ಶೈಲಿಗಳನ್ನು ಸುವ್ಯವಸ್ಥಿತಗೊಳಿಸಲು extension ಬಳಸುವುದು

ನಾವು `Image` ಗೆ ಫೋಟೋ ಗ್ಯಾಲರಿಗಾಗಿ ವಿಶೇಷವಾದ ಒಂದು ವಿಧಾನವನ್ನು ವಿಸ್ತರಿಸಬಹುದು:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ಇಲ್ಲಿ, ನಾವು `Image` ಪ್ರಕಾರಕ್ಕೆ `photoGalleryStyle` ವಿಧಾನವನ್ನು ವಿಸ್ತರಿಸಿದ್ದೇವೆ.

ಈ ವಿಧಾನದಲ್ಲಿ ಹಿಂದಿನಂತೆ ಮರುಮರು ಬಳಸಿದ `.resizable()`, `.scaledToFit()` ಮತ್ತು `.frame(width: 300)` ಸೇರಿವೆ. ಅಂದರೆ, ಚಿತ್ರ ವಿಸ್ತರಣೆ, ಅನುಪಾತದ ಪ್ರದರ್ಶನ ಮತ್ತು ಅಗಲದ ಸೆಟ್ಟಿಂಗ್ ಕೋಡ್ ಅನ್ನು ಒಂದೇ ಕಡೆ ಸುವ್ಯವಸ್ಥಿತಗೊಳಿಸುತ್ತದೆ.

ಈ extension ಬಳಸಿದ ನಂತರ, ಮೂಲ ಚಿತ್ರದ ಕೋಡ್:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

ಹೀಗೆ ಸರಳಗೊಳಿಸಬಹುದು:

```swift
Image("1")
    .photoGalleryStyle()
```

ಈ ರೀತಿಯಾಗಿ, ಪ್ರತಿ ಚಿತ್ರವೂ ಒಂದೇ ಫೋಟೋ ಗ್ಯಾಲರಿ ಶೈಲಿಯನ್ನು ಅನ್ವಯಿಸಲು `.photoGalleryStyle()` ಅನ್ನು ಮಾತ್ರ ಕರೆಯಬೇಕು. ಕೋಡ್ ಹೆಚ್ಚು ಸ್ವಚ್ಛವಾಗುತ್ತದೆ, ಮತ್ತು ನಂತರ ಒಂದೇ ರೀತಿಯಾಗಿ ತಿದ್ದುಪಡಿ ಮಾಡುವುದು ಸುಲಭವಾಗುತ್ತದೆ.

## self ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

extension ವಿಧಾನದಲ್ಲಿ, ನಾವು `self` ಅನ್ನು ಬರೆದಿದ್ದೇವೆ:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ಇಲ್ಲಿ, `self` ಎಂದರೆ ಈ ವಿಧಾನವನ್ನು ಕರೆಯುತ್ತಿರುವ ಪ್ರಸ್ತುತ ಚಿತ್ರ ಇನ್‌ಸ್ಟಾನ್ಸ್.

ಉದಾಹರಣೆಗೆ:

```swift
Image("1")
    .photoGalleryStyle()
```

ಈ ಕೋಡ್‌ನಲ್ಲಿ, `photoGalleryStyle()` ಅನ್ನು `Image("1")` ಕರೆಯುತ್ತದೆ. ಆದ್ದರಿಂದ ವಿಧಾನದಲ್ಲಿನ `self` ಈ `Image("1")` ಚಿತ್ರವನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ಸರಳವಾಗಿ ಹೇಳುವುದಾದರೆ: ಈ ವಿಧಾನವನ್ನು ಯಾರು ಕರೆಯುತ್ತಾರೋ, `self` ಅದನ್ನೇ ಸೂಚಿಸುತ್ತದೆ.

ಗಮನಿಸಬೇಕಾದದ್ದು ಏನೆಂದರೆ, SwiftUI modifier ಗಳು ನಿರಂತರವಾಗಿ ಹೊಸ ವೀಕ್ಷಣೆ ಫಲಿತಾಂಶಗಳನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತವೆ. ಆದ್ದರಿಂದ `photoGalleryStyle()` ಮೂಲ `Image` ಅನ್ನು ಸರಳವಾಗಿ ಹಿಂತಿರುಗಿಸುವುದಲ್ಲ, ಬದಲಾಗಿ modifier ಅನ್ವಯಿಸಿದ ವೀಕ್ಷಣೆಯನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ.

## ಫೋಟೋ ಆಕಾರಗಳು

ಈಗ, ಫೋಟೋಗಳನ್ನು ಸಾಮಾನ್ಯವಾಗಿ ಪ್ರದರ್ಶಿಸಬಹುದು. ಆದರೆ, ಅವು ಡೀಫಾಲ್ಟ್ ಆಗಿ ಆಯತಾಕಾರದಾಗಿರುತ್ತವೆ, ಆದ್ದರಿಂದ ಸ್ವಲ್ಪ ಸಾಮಾನ್ಯವಾಗಿ ಕಾಣುತ್ತವೆ.

ಫೋಟೋಗಳಿಗೆ ಕೇವಲ ಗೋಳಾಕಾರದ ಮೂಲೆಗಳನ್ನು ನೀಡಲು ಬಯಸಿದರೆ, `.cornerRadius()` ಅನ್ನು ನೇರವಾಗಿ ಬಳಸಬಹುದು:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` ಎಂದರೆ ಚಿತ್ರಕ್ಕೆ `20 pt` ಗೋಳಾಕಾರದ ಮೂಲೆಗಳನ್ನು ಸೇರಿಸುವುದು. ಸಾಮಾನ್ಯ rounded-corner ಚಿತ್ರಗಳಿಗೆ ಈ ಬರವಣಿಗೆ ಸಾಕಾಗುತ್ತದೆ.

ಆದರೆ, `.cornerRadius()` ಗೋಳಾಕಾರದ ಮೂಲೆಗಳ ಪರಿಣಾಮವನ್ನು ಮಾತ್ರ ನಿರ್ವಹಿಸಬಹುದು, ಮತ್ತು ಸಾಮಾನ್ಯ rounded-corner ಚಿತ್ರಗಳನ್ನು ಮಾಡಲು ಸೂಕ್ತವಾಗಿದೆ. ಫೋಟೋಗಳನ್ನು ಇನ್ನಷ್ಟು ವಿಭಿನ್ನ ಆಕಾರಗಳಾಗಿ ರೂಪಿಸಲು ಬಯಸಿದರೆ, ಈ modifier ಮಾತ್ರ ಸಾಕಾಗುವುದಿಲ್ಲ.

ಈ ಸಂದರ್ಭದಲ್ಲಿ, SwiftUI ನ `Shape` ಅನ್ನು ಬಳಸಬೇಕು. `Shape` ವಿಭಿನ್ನ ಆಕಾರಗಳನ್ನು ಪ್ರತಿನಿಧಿಸಬಹುದು, ಮತ್ತು `clipShape` ಜೊತೆಗೆ ಬಳಸಿದರೆ, ಚಿತ್ರವನ್ನು ತಕ್ಕ ಆಕಾರಕ್ಕೆ ಕತ್ತರಿಸಬಹುದು.

## Shape ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

SwiftUI ನಲ್ಲಿ, `Shape` ಒಂದು ಆಕಾರವನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ. `View` ಹಾಗೆಯೇ, ಇದು SwiftUI ನಲ್ಲಿ ಬಹಳ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸುವ ಪ್ರಕಾರವಾಗಿದೆ.

ಸಾಮಾನ್ಯ `Shape` ಪ್ರಕಾರಗಳಲ್ಲಿ ವೃತ್ತ, ಆಯತ, ಗೋಳಾಕಾರದ ಮೂಲೆಗಳಿರುವ ಆಯತ, ಕ್ಯಾಪ್ಸೂಲ್ ಮತ್ತು ಅಂಡಾಕಾರ ಸೇರಿವೆ. ವಿಭಿನ್ನ ಆಕಾರಗಳ ರೂಪವನ್ನು ಹೆಚ್ಚು ನೇರವಾಗಿ ಗಮನಿಸಲು, ಕೆಳಗಿನ ಉದಾಹರಣೆಗಳಲ್ಲಿ ಪ್ರತಿ ಆಕಾರಕ್ಕೂ ವಿಭಿನ್ನ ಬಣ್ಣ ಮತ್ತು ಗಾತ್ರವನ್ನು ನೀಡಲಾಗಿದೆ.

ಈ ಉದಾಹರಣೆಗಳಲ್ಲಿ, `.fill()` ಅನ್ನು ಆಕಾರಕ್ಕೆ ಬಣ್ಣ ತುಂಬಲು ಬಳಸಲಾಗುತ್ತದೆ, ಮತ್ತು `.frame()` ಅನ್ನು ಆಕಾರದ ಪ್ರದರ್ಶನ ಗಾತ್ರವನ್ನು ಹೊಂದಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಬಣ್ಣಗಳು ವಿಭಿನ್ನ ಆಕಾರಗಳನ್ನು ಬೇರ್ಪಡಿಸಲು ಮಾತ್ರ; ಅವು ಆ ಆಕಾರಗಳ ಸ್ಥಿರ ಬಣ್ಣಗಳಲ್ಲ.

### Circle ವೃತ್ತ

`Circle` ವೃತ್ತವನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ. ಇದನ್ನು ಅವತಾರ್, ವೃತ್ತಾಕಾರದ ಬಟನ್, ವೃತ್ತಾಕಾರದ ಚಿತ್ರ ಮತ್ತು ಇತರ ಇಂಟರ್ಫೇಸ್ ಪರಿಣಾಮಗಳಿಗೆ ಹೆಚ್ಚಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle ಆಯತ

`Rectangle` ಆಯತವನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ. ಇದು ಅತ್ಯಂತ ಮೂಲಭೂತ ಆಕಾರಗಳಲ್ಲಿ ಒಂದಾಗಿದೆ, ಮತ್ತು ಹಿನ್ನಲೆ, ವಿಭಜಿತ ಪ್ರದೇಶ ಅಥವಾ ಸಾಮಾನ್ಯ ಅಂಚುಗಳನ್ನು ನಿರ್ಮಿಸಲು ಕೂಡ ಬಳಸಬಹುದು.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle ಗೋಳಾಕಾರದ ಮೂಲೆಗಳಿರುವ ಆಯತ

`RoundedRectangle` ಗೋಳಾಕಾರದ ಮೂಲೆಗಳಿರುವ ಆಯತವನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ. `cornerRadius` ಅನ್ನು ಮೂಲೆಗಳ ವಕ್ರತೆಯನ್ನು ಹೊಂದಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule ಕ್ಯಾಪ್ಸೂಲ್ ಆಕಾರ

`Capsule` ಕ್ಯಾಪ್ಸೂಲ್ ಆಕಾರವನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ. ಇದರ ಎರಡೂ ತುದಿಗಳು ವಕ್ರವಾಗಿರುತ್ತವೆ, ಮತ್ತು ಇದನ್ನು ಕ್ಯಾಪ್ಸೂಲ್ ಬಟನ್‌ಗಳು, ಟ್ಯಾಗ್ ಹಿನ್ನಲೆಗಳು ಹಾಗೂ ಇತರ ಇಂಟರ್ಫೇಸ್ ಪರಿಣಾಮಗಳಿಗೆ ಹೆಚ್ಚಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ಅಂಡಾಕಾರ

`Ellipse` ಅಂಡಾಕಾರವನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ. ಇದು `Circle` ಗೆ ಹೋಲುತ್ತದೆ, ಆದರೆ ಅಗಲ ಮತ್ತು ಎತ್ತರ ಭಿನ್ನವಾಗಿದ್ದರೆ, ಅಂಡಾಕಾರವಾಗಿ ಪ್ರದರ್ಶಿಸುತ್ತದೆ.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

ಈ ಉದಾಹರಣೆಗಳ ಮೂಲಕ, `Shape` ಸ್ವತಃ ನೇರವಾಗಿ ಆಕಾರವಾಗಿ ಪ್ರದರ್ಶಿಸಬಹುದು ಎಂಬುದನ್ನು ನೋಡಬಹುದು. ಮುಂದೆ, ಈ `Shape` ಪ್ರಕಾರಗಳನ್ನು `clipShape` ಜೊತೆಗೆ ಬಳಸಿಕೊಂಡು ಫೋಟೋಗಳನ್ನು ಕತ್ತರಿಸಿ, ಅವು ವಿಭಿನ್ನ ಆಕಾರಗಳಲ್ಲಿ ಕಾಣುವಂತೆ ಮಾಡುತ್ತೇವೆ.

## clipShape ಬಳಸಿ ಫೋಟೋಗಳನ್ನು ಕತ್ತರಿಸುವುದು

ಈಗ, ಫೋಟೋಗಳನ್ನು ವಿಭಿನ್ನ ಆಕಾರಗಳಿಗೆ ಕತ್ತರಿಸಲು `clipShape` ಅನ್ನು ಬಳಸಬಹುದು.

ಉದಾಹರಣೆಗೆ, ಮೊದಲ ಫೋಟೋವನ್ನು ವೃತ್ತವಾಗಿ ಕತ್ತರಿಸೋಣ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

ಈ ಕೋಡ್‌ನ ಅರ್ಥ: ಮೊದಲು ಒಂದು ಚಿತ್ರವನ್ನು ಪ್ರದರ್ಶಿಸಿ, ನಂತರ `Circle()` ಬಳಸಿ ಅದನ್ನು ವೃತ್ತವಾಗಿ ಕತ್ತರಿಸುವುದು.

![view](../../../Resource/032_view2.png)

`clipShape` ನ ಮೂಲ ಬರವಣಿಗೆ ಹೀಗಿದೆ:

```swift
.clipShape(shape)
```

ವೀಕ್ಷಣೆಯ ನಂತರ `.clipShape(...)` ಸೇರಿಸಿ, ಮತ್ತು ಬ್ರಾಕೆಟ್‌ಗಳೊಳಗೆ ಕತ್ತರಿಸಬೇಕಾದ ಆಕಾರವನ್ನು ಬರೆಯಿರಿ.

ಉದಾಹರಣೆಗೆ:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

ಈಗ, 5 ಫೋಟೋಗಳನ್ನು ವಿಭಿನ್ನ ಆಕಾರಗಳಿಗೆ ಕತ್ತರಿಸೋಣ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![view](../../../Resource/032_view8.png)

ಇವುಗಳಲ್ಲಿ, `Rectangle()` ಬಳಸಿ ಕತ್ತರಿಸಿದ ನಂತರದ ಪರಿಣಾಮ ಸಾಮಾನ್ಯ ಆಯತಾಕಾರದ ಫೋಟೋಗೆ ಹತ್ತಿರವಾಗಿರುತ್ತದೆ. ಆದ್ದರಿಂದ ದೃಶ್ಯ ಬದಲಾವಣೆ ಸ್ಪಷ್ಟವಾಗುವುದಿಲ್ಲ. ಇದನ್ನು ಮುಖ್ಯವಾಗಿ ಇತರ ಆಕಾರಗಳೊಂದಿಗೆ ಹೋಲಿಕೆ ಮಾಡಲು ಬಳಸಲಾಗಿದೆ.

ಈಗ, ಫೋಟೋಗಳು ಕೇವಲ ಸಾಮಾನ್ಯ ಆಯತಗಳಾಗಿಲ್ಲ; ಅವು ವಿಭಿನ್ನ ಆಕಾರಗಳನ್ನು ಹೊಂದಿವೆ.

## ಫೋಟೋಗಳಿಗೆ ಅಂಚು ಸೇರಿಸುವುದು

ವೃತ್ತಾಕಾರದ ಫೋಟೋಗೆ ಅಂಚು ಸೇರಿಸಲು ಬಯಸಿದರೆ, ನಾವು `border` ಬಳಸಬಹುದು ಎಂದು ಯೋಚಿಸಬಹುದು:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

ಆದರೆ, ಸಾಮಾನ್ಯವಾಗಿ ಇದರಿಂದ ವೃತ್ತಾಕಾರದ ಅಂಚು ಸಿಗುವುದಿಲ್ಲ; ಬದಲಿಗೆ ಆಯತಾಕಾರದ ಅಂಚು ಸಿಗುತ್ತದೆ.

![view](../../../Resource/032_view9.png)

ಏಕೆಂದರೆ `border` ವೀಕ್ಷಣೆಯ ಆಯತಾಕಾರದ ಪ್ರದೇಶದ ಆಧಾರದ ಮೇಲೆ ಅಂಚು ಸೇರಿಸುತ್ತದೆ; `clipShape` ಮೂಲಕ ಕತ್ತರಿಸಿದ ನಂತರದ ಆಕಾರದ ಆಧಾರದ ಮೇಲೆ ಅಲ್ಲ.

ಆದ್ದರಿಂದ, ವೃತ್ತಾಕಾರದ ಅಂಚು ಬೇಕಾದರೆ, `border` ಅನ್ನು ನೇರವಾಗಿ ಬಳಸಲು ಸಾಧ್ಯವಿಲ್ಲ.

## strokeBorder ಬಳಸಿ ಆಕಾರದ ಅಂಚುಗಳನ್ನು ರಚಿಸುವುದು

SwiftUI ನಲ್ಲಿ, `strokeBorder` ಈ ಸಾಮಾನ್ಯ `Shape` ಪ್ರಕಾರಗಳಿಗೆ ಒಳಭಾಗದ ಅಂಚುಗಳನ್ನು ರಚಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ, ವೃತ್ತಾಕಾರದ ಅಂಚನ್ನು ರಚಿಸೋಣ:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

ಈ ಕೋಡ್‌ನ ಅರ್ಥ: `Circle` ಗೆ ಕಂದು ಬಣ್ಣದ ಅಂಚು ರಚಿಸುವುದು, ಅಂಚಿನ ಅಗಲ `10 pt`.

![view](../../../Resource/032_view12.png)

ಇಲ್ಲಿ ಗಮನಿಸಬೇಕಾದದ್ದು: `strokeBorder` ಫೋಟೋಗೆ ನೇರವಾಗಿ ಅಂಚು ಸೇರಿಸುವುದಿಲ್ಲ. ಬದಲಿಗೆ, ಅದು `Circle()` ಆಕಾರಕ್ಕೆ ಅಂಚು ರಚಿಸುತ್ತದೆ.

ಅಂದರೆ, ಈ ಕೋಡ್ ಕೇವಲ ಸ್ವತಂತ್ರ ವೃತ್ತಾಕಾರದ ಅಂಚನ್ನು ಮಾತ್ರ ಸೃಷ್ಟಿಸುತ್ತದೆ; ಇದಕ್ಕೆ ಇನ್ನೂ ಫೋಟೋದೊಂದಿಗೆ ಸಂಬಂಧವಿಲ್ಲ.

ಈ ವೃತ್ತಾಕಾರದ ಅಂಚು ಫೋಟೋದ ಮೇಲ್ಭಾಗದಲ್ಲಿ ಕಾಣಬೇಕಾದರೆ, ಅಂಚನ್ನು ಫೋಟೋದ ಮೇಲೆ ಮೇಲಿಡಲು `overlay` ಅನ್ನು ಮುಂದುವರಿಸಿ ಬಳಸಬೇಕು.

## overlay ಬಳಸಿ ಅಂಚುಗಳನ್ನು ಮೇಲಿಡುವುದು

`overlay` ಪ್ರಸ್ತುತ ವೀಕ್ಷಣೆಯ ಮೇಲ್ಭಾಗದಲ್ಲಿ ಹೊಸ ವೀಕ್ಷಣೆಯನ್ನು ಮೇಲಿಡಬಹುದಾದ view modifier ಆಗಿದೆ.

ಇದರ ಮೂಲ ರಚನೆಯನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

```swift
ಪ್ರಸ್ತುತ ವೀಕ್ಷಣೆ
    .overlay {
        ಮೇಲಿಡುವ ವೀಕ್ಷಣೆ
    }
```

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, ಪ್ರಸ್ತುತ ವೀಕ್ಷಣೆ ಈಗಾಗಲೇ ವೃತ್ತವಾಗಿ ಕತ್ತರಿಸಲಾದ ಫೋಟೋ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

ಮೇಲಿಡಲು ಬಯಸುವ ಹೊಸ ವೀಕ್ಷಣೆ ಒಂದು ವೃತ್ತಾಕಾರದ ಅಂಚು:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

ಹೀಗಾಗಿ, ಫೋಟೋ ಮತ್ತು ಅಂಚನ್ನು ಒಂದಾಗಿ ಸಂಯೋಜಿಸಬಹುದು:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

ಇಲ್ಲಿ, `overlay` ಎಂದರೆ ಪ್ರಸ್ತುತ ವೀಕ್ಷಣೆಯ ಮೇಲ್ಭಾಗದಲ್ಲಿ ಹೊಸ ವೀಕ್ಷಣೆಯನ್ನು ಮೇಲಿಡುವುದು.

`overlay` ನಲ್ಲಿ, ಅಂಚು ಪ್ರಸ್ತುತ ಫೋಟೋದ ಪ್ರದರ್ಶನ ಪ್ರದೇಶವನ್ನು ಅನುಸರಿಸಿ ಮೇಲಿಡಲಾಗುತ್ತದೆ. ಆದ್ದರಿಂದ ಬೇರೆ `frame` ಹೊಂದಿಸುವ ಅಗತ್ಯವಿಲ್ಲ. ಅಂಚಿನ ಆಕಾರ ಮತ್ತು ಕತ್ತರಿಸುವ ಆಕಾರ ಒಂದೇ ಆಗಿದ್ದರೆ, ಅಂಚು ಫೋಟೋಗೆ ಸರಿಯಾಗಿ ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ.

![view](../../../Resource/032_view10.png)

ಅಂತಿಮ ಪರಿಣಾಮವೆಂದರೆ, ವೃತ್ತಾಕಾರದ ಫೋಟೋದ ಮೇಲ್ಭಾಗದಲ್ಲಿ ವೃತ್ತಾಕಾರದ ಅಂಚು ಇರಿಸಲಾಗುತ್ತದೆ.

`ZStack` ಜೊತೆ ಹೋಲಿಸಿದರೆ, “ಪ್ರಸ್ತುತ ವೀಕ್ಷಣೆಗೆ ಅಲಂಕಾರ ಸೇರಿಸುವ” ಇಂತಹ ಪರಿಸ್ಥಿತಿಗೆ `overlay` ಹೆಚ್ಚು ಸೂಕ್ತವಾಗಿದೆ. ಫೋಟೋ ಮುಖ್ಯ ಭಾಗ, ಅಂಚು ಕೇವಲ ಹೆಚ್ಚುವರಿ ಪರಿಣಾಮ. ಆದ್ದರಿಂದ `overlay` ಬಳಸುವುದು ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗಿದೆ.

## ಫೋಟೋ ಗ್ಯಾಲರಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವುದು

ಈಗ, ಪ್ರತಿ ಫೋಟೋಗೆ ತಕ್ಕ ಆಕಾರ ಮತ್ತು ಅಂಚನ್ನು ಸೇರಿಸುತ್ತೇವೆ:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![view](../../../Resource/032_view13.png)

ಈ ರೀತಿಯಾಗಿ, ಒಂದು ಮೂಲಭೂತ ಫೋಟೋ ಗ್ಯಾಲರಿ ಪುಟ ಪೂರ್ಣಗೊಳ್ಳುತ್ತದೆ.

ಈ ಪುಟದಲ್ಲಿ, ಸ್ಕ್ರೋಲ್ ಪ್ರದರ್ಶನಕ್ಕೆ `ScrollView` ಬಳಸುತ್ತೇವೆ, ಫೋಟೋಗಳನ್ನು ಪ್ರದರ್ಶಿಸಲು `Image` ಬಳಸುತ್ತೇವೆ, ಫೋಟೋ ಆಕಾರಗಳನ್ನು ಕತ್ತರಿಸಲು `clipShape` ಬಳಸುತ್ತೇವೆ, ಮತ್ತು ಅಂಚುಗಳನ್ನು ಸೇರಿಸಲು `overlay` ಹಾಗೂ `strokeBorder` ಬಳಸುತ್ತೇವೆ.

## ಸಂಪೂರ್ಣ ಕೋಡ್

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಒಂದು ಫೋಟೋ ಗ್ಯಾಲರಿ ಪುಟವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

![view](../../../Resource/032_view13.png)

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, ಮೊದಲು `Image` ಬಳಸಿ ಫೋಟೋಗಳನ್ನು ಪ್ರದರ್ಶಿಸಿದ್ದೇವೆ. ನಂತರ `extension` ಮೂಲಕ `Image` ಗೆ `photoGalleryStyle` ವಿಧಾನವನ್ನು ವಿಸ್ತರಿಸಿ, ಮರುಮರು ಬಳಕೆಯಾದ ಚಿತ್ರ ಶೈಲಿ ಕೋಡ್ ಅನ್ನು ಸುವ್ಯವಸ್ಥಿತಗೊಳಿಸಿದ್ದೇವೆ.

ಮುಂದೆ, SwiftUI ನ ಸಾಮಾನ್ಯ `Shape` ಪ್ರಕಾರಗಳನ್ನು ಕಲಿತೇವೆ, ಉದಾಹರಣೆಗೆ `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` ಮತ್ತು `Ellipse`. ಈ ಆಕಾರಗಳನ್ನು ನೇರವಾಗಿ ಪ್ರದರ್ಶಿಸುವುದಷ್ಟೇ ಅಲ್ಲ, `clipShape` ಜೊತೆಗೆ ಬಳಸಿ ವೀಕ್ಷಣೆಗಳನ್ನು ಕತ್ತರಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
.clipShape(Circle())
```

ಅಂದರೆ ವೀಕ್ಷಣೆಯನ್ನು ವೃತ್ತವಾಗಿ ಕತ್ತರಿಸುವುದು.

ಕೊನೆಗೆ, ಫೋಟೋಗಳಿಗೆ ತಕ್ಕ ಆಕಾರದ ಅಂಚುಗಳನ್ನು ಸೇರಿಸಲು `overlay` ಮತ್ತು `strokeBorder` ಬಳಸಿದ್ದೇವೆ. ಗಮನಿಸಬೇಕಾದದ್ದು: `border` ಸಾಮಾನ್ಯವಾಗಿ ವೀಕ್ಷಣೆಯ ಆಯತಾಕಾರದ ಪ್ರದೇಶದ ಆಧಾರದ ಮೇಲೆ ಅಂಚು ರಚಿಸುತ್ತದೆ. ಅಂಚು ವೃತ್ತ, ಕ್ಯಾಪ್ಸೂಲ್ ಅಥವಾ ಅಂಡಾಕಾರವನ್ನು ಅನುಸರಿಸಬೇಕೆಂದರೆ, ಅದೇ `Shape` ಅನ್ನು ಮೇಲಿಡುವುದು ಹೆಚ್ಚು ಸೂಕ್ತ.

ಈ ಪಾಠದ ಮೂಲಕ, ನಾವು ಫೋಟೋ ಗ್ಯಾಲರಿ ಪರಿಣಾಮವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದಷ್ಟೇ ಅಲ್ಲ, ಇಂಟರ್ಫೇಸ್‌ಗಳಲ್ಲಿ `Shape`, `clipShape`, `strokeBorder` ಮತ್ತು `overlay` ಗಳ ಸಾಮಾನ್ಯ ಸಂಯೋಜನೆಯನ್ನು ಸಹ ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದೇವೆ.

## ಪಾಠದ ನಂತರದ ಅಭ್ಯಾಸಗಳು

### 1. ಫೋಟೋ ಗ್ಯಾಲರಿ ಹಿನ್ನಲೆ ಸೇರಿಸಿ

ಫೋಟೋ ಗ್ಯಾಲರಿ ಪುಟಕ್ಕೆ ಸಂಪೂರ್ಣ ಪರದೆಯ ಹಿನ್ನಲೆ ಚಿತ್ರವನ್ನು ಸೇರಿಸಿ.

ಅವಶ್ಯಕತೆ: ಹಿನ್ನಲೆ ಚಿತ್ರವು ಸಂಪೂರ್ಣ ಪರದೆಯನ್ನು ತುಂಬಬೇಕು ಮತ್ತು ಸುರಕ್ಷಿತ ಪ್ರದೇಶವನ್ನು ನಿರ್ಲಕ್ಷಿಸಬೇಕು.

### 2. ಗ್ರೇಡಿಯಂಟ್ ಅಂಚು

ಪ್ರಸ್ತುತ ಇರುವ ಏಕಬಣ್ಣದ ಅಂಚುಗಳನ್ನು ರೇಖೀಯ ಗ್ರೇಡಿಯಂಟ್ ಅಂಚುಗಳಾಗಿ ಬದಲಿಸಿ.

ಇನ್ನಷ್ಟು ಸಮೃದ್ಧವಾದ ಅಂಚಿನ ಪರಿಣಾಮಗಳನ್ನು ರಚಿಸಲು `LinearGradient` ಬಳಸಿ ಪ್ರಯತ್ನಿಸಬಹುದು.

### 3. ನಕಲಿ ಫೋಟೋ ಫ್ರೇಮ್

ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಕೆಲವು ನಿಜವಾದ ಫೋಟೋ ಫ್ರೇಮ್ ಶೈಲಿಗಳನ್ನು ಹುಡುಕಿ, ನಂತರ `overlay` ಬಳಸಿ ಚಿತ್ರ ಫ್ರೇಮ್‌ಗಳನ್ನು ಮೇಲಿಟ್ಟು, ಫೋಟೋಗಳು ನಿಜವಾದ ಫ್ರೇಮ್‌ಗಳಿಗೆ ಹೆಚ್ಚು ಹತ್ತಿರವಾಗಿ ಕಾಣುವಂತೆ ಪ್ರಯತ್ನಿಸಿ.

ಅಭ್ಯಾಸದ ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![button](../../../Resource/032_view15.jpeg)

### 4. ಗೋಳಾಕಾರದ ಮೂಲೆಗಳಿರುವ ಬಟನ್ ಅಂಚನ್ನು ನಿರ್ಮಿಸಿ

ವಾಸ್ತವಿಕ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ಬಟನ್‌ಗಳು ಹೆಚ್ಚಾಗಿ ಗೋಳಾಕಾರದ ಮೂಲೆಗಳಿರುವ ಆಯತಾಕಾರದ ಅಂಚುಗಳನ್ನು ಬಳಸುತ್ತವೆ.

ಒಂದು rounded button ರಚಿಸಲು ಪ್ರಯತ್ನಿಸಿ, ಮತ್ತು `RoundedRectangle` ಹಾಗೂ `strokeBorder` ಬಳಸಿ ಬಟನ್‌ಗೆ ಗೋಳಾಕಾರದ ಅಂಚು ಸೇರಿಸಿ.

ಅಭ್ಯಾಸದ ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![button](../../../Resource/032_view14.png)

### ಚಿಂತನೆ ಪ್ರಶ್ನೆ

ಏಕಬಣ್ಣದ ಅಂಚನ್ನೂ ಬಳಸದಿರಲು, ಗ್ರೇಡಿಯಂಟ್ ಅಂಚನ್ನೂ ಬಳಸದಿರಲು, ಆದರೆ ಅಂಚಿನಲ್ಲಿ ಯಾವುದೋ ಪ್ಯಾಟರ್ನ್ ಪರಿಣಾಮ ತೋರಿಸಲು ಬಯಸಿದರೆ, ಅದನ್ನು ಹೇಗೆ ನಿರ್ಮಿಸಬೇಕು?

`overlay`, `mask` ಅಥವಾ `ImagePaint` ಮುಂತಾದ ಸಂಬಂಧಿತ ಬಳಕೆಗಳ ಬಗ್ಗೆ ತಿಳಿಯಲು ಮಾಹಿತಿ ಹುಡುಕಲು ಪ್ರಯತ್ನಿಸಬಹುದು.

ಅಭ್ಯಾಸದ ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![button](../../../Resource/032_view16.png)
