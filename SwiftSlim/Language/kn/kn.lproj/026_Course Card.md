# ಕೋರ್ಸ್ ಕಾರ್ಡ್

ಈ ಪಾಠವು ಒಂದು ಹಂತದ ಮರುಪರಿಶೀಲನಾ ಪಾಠವಾಗಿದೆ. ನಾವು ಒಂದು “ಕೋರ್ಸ್ ಕಾರ್ಡ್” ಪೂರ್ಣಗೊಳಿಸುತ್ತೇವೆ.

ಈ ಅಭ್ಯಾಸದ ಮೂಲಕ, ಹಿಂದೆ ಕಲಿತ `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` ಮುಂತಾದ ವಿಷಯಗಳನ್ನು ಮರುಪರಿಶೀಲಿಸಬಹುದು, ಮತ್ತು ಹಲವಾರು ಸಣ್ಣ ವೀಕ್ಷಣೆಗಳನ್ನು ಒಂದು ಪೂರ್ಣ ವೀಕ್ಷಣಾ ಘಟಕವಾಗಿ ಹೇಗೆ ಸಂಯೋಜಿಸಬೇಕು ಎಂಬುದನ್ನು ಕಲಿಯಬಹುದು.

ಕೋರ್ಸ್ ಕಾರ್ಡ್ ಪರಿಣಾಮ:

![view](../../../Resource/026_view.png)

ಈ ಕೋರ್ಸ್ ಕಾರ್ಡ್ ಮುಖ್ಯವಾಗಿ ಕೆಲವು ಭಾಗಗಳನ್ನು ಒಳಗೊಂಡಿದೆ:

- ಕೋರ್ಸ್ ಮಟ್ಟ: `ಪ್ರಾರಂಭಿಕ`
- ಕೋರ್ಸ್ ವಿಷಯ: `20+ ಪಾಠಗಳು`
- ಕೋರ್ಸ್ ಶೀರ್ಷಿಕೆ: `SwiftUI ಪ್ರಾರಂಭಿಕ ಟ್ಯುಟೋರಿಯಲ್`
- ಕೋರ್ಸ್ ವಿವರಣೆ
- ಬಟನ್: `ಕಲಿಯಲು ಪ್ರಾರಂಭಿಸಿ`
- ಕೋರ್ಸ್ ಹಿನ್ನೆಲೆ: Swift ಐಕಾನ್ ಮತ್ತು ಇಂಡಿಗೋ ಬಣ್ಣದ ಹಿನ್ನೆಲೆ

ನಾವು ಈ ವೀಕ್ಷಣೆಯನ್ನು `ContentView` ನಲ್ಲಿ ಪೂರ್ಣಗೊಳಿಸಬಹುದು.

## ಮೇಲಿನ ಪ್ರದೇಶ

ಮೊದಲು, ಕೋರ್ಸ್ ಕಾರ್ಡ್‌ನ ಮೇಲಿನ ಪ್ರದೇಶವನ್ನು ನಿರ್ಮಿಸೋಣ.

![view](../../../Resource/026_view1.png)

ಮೇಲಿನ ಪ್ರದೇಶದ ಎಡಭಾಗದಲ್ಲಿ ಕೋರ್ಸ್ ಮಟ್ಟವನ್ನು ತೋರಿಸಲಾಗುತ್ತದೆ, ಬಲಭಾಗದಲ್ಲಿ ಕೋರ್ಸ್ ವಿಷಯವನ್ನು ತೋರಿಸಲಾಗುತ್ತದೆ.

ಈ ಎರಡು ವಿಷಯಗಳು ಅಡ್ಡವಾಗಿ ಜೋಡಿಸಲ್ಪಟ್ಟಿರುವುದರಿಂದ, `HStack` ಬಳಸಬಹುದು.

```swift
var topView: some View {
    HStack {
        Text("ಪ್ರಾರಂಭಿಕ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ ಪಾಠಗಳು")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

ಇಲ್ಲಿ, ನಾವು ಮೇಲಿನ ಪ್ರದೇಶವನ್ನು ಒಂದು computed property ಆಗಿ ಬೇರ್ಪಡಿಸಿದ್ದೇವೆ:

```swift
var topView: some View
```

ಹೀಗೆ ಮಾಡುವ ಪ್ರಯೋಜನವೆಂದರೆ `body` ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗಿರುತ್ತದೆ.

ಮೇಲಿನ ಪ್ರದೇಶದಲ್ಲಿ ಮುಖ್ಯವಾಗಿ ಇವುಗಳನ್ನು ಬಳಸಲಾಗಿದೆ:

- `HStack`: ಎರಡು ಪಠ್ಯ ವೀಕ್ಷಣೆಗಳನ್ನು ಅಡ್ಡವಾಗಿ ಜೋಡಿಸುತ್ತದೆ.
- `Text`: ಪಠ್ಯ ವಿಷಯವನ್ನು ತೋರಿಸುತ್ತದೆ.
- `Spacer()`: ಎಡಭಾಗದ ಪಠ್ಯವನ್ನು ಎಡಕ್ಕೆ, ಬಲಭಾಗದ ಪಠ್ಯವನ್ನು ಬಲಕ್ಕೆ ತಳ್ಳುತ್ತದೆ.
- `.font(.footnote)`: ಚಿಕ್ಕ ಪಠ್ಯ ಶೈಲಿಯನ್ನು ಹೊಂದಿಸುತ್ತದೆ.
- `.fontWeight(.bold)`: ಪಠ್ಯವನ್ನು ದಪ್ಪವಾಗಿಸುತ್ತದೆ.
- `.foregroundStyle(Color.white)`: ಮುಂಭಾಗದ ಬಣ್ಣವನ್ನು ಬಿಳಿಯಾಗಿ ಹೊಂದಿಸುತ್ತದೆ.
- `.padding(.vertical, 10)`: ಮೇಲಿನ ಮತ್ತು ಕೆಳಗಿನ ಒಳ ಅಂತರವನ್ನು ಹೊಂದಿಸುತ್ತದೆ.
- `.padding(.horizontal, 16)`: ಎಡ ಮತ್ತು ಬಲ ಒಳ ಅಂತರವನ್ನು ಹೊಂದಿಸುತ್ತದೆ.
- `.background(Color.white.opacity(0.15))`: ಅರ್ಧಪಾರದರ್ಶಕ ಬಿಳಿ ಹಿನ್ನೆಲೆಯನ್ನು ಹೊಂದಿಸುತ್ತದೆ.
- `.cornerRadius(20)`: ಮೂಲೆಗಳ ವಕ್ರತೆಯನ್ನು ಹೊಂದಿಸುತ್ತದೆ.

ಇಲ್ಲಿ, `ಪ್ರಾರಂಭಿಕ` ಎರಡು ದಿಕ್ಕುಗಳಲ್ಲಿ `.padding()` ಬಳಸುತ್ತದೆ:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

ಇದರಿಂದ ಪಠ್ಯಕ್ಕೆ ಮೇಲ್ಕீழು ಹಾಗೂ ಎಡಬಲ ಎರಡೂ ಕಡೆ ಜಾಗ ಸಿಗುತ್ತದೆ, ಮತ್ತು ಅದು ಒಂದು ಟ್ಯಾಗ್‌ನಂತೆ ಕಾಣುತ್ತದೆ.

`Color.white.opacity(0.15)` ಎಂದರೆ `15%` ಅಪಾರದರ್ಶಕತೆಯ ಬಿಳಿ ಬಣ್ಣ, ಅಂದರೆ ತುಂಬಾ ಮೃದುವಾದ ಬಿಳಿ.

### ಕಾರ್ಡ್ ಹಿನ್ನೆಲೆ ಸೇರಿಸುವುದು

ಹಿಂದೆ ನಾವು `topView` ರಚಿಸಿದ್ದೇವೆ, ಆದರೆ ಕೇವಲ ವೀಕ್ಷಣೆ ರಚಿಸಿದರೆ ಅದು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತೋರಿಸುವುದಿಲ್ಲ.

SwiftUI ನಲ್ಲಿ, ಪರದೆಯ ಮೇಲೆ ನಿಜವಾಗಿ ತೋರಿಸಬೇಕಾದ ವಿಷಯವನ್ನು `body` ಒಳಗೆ ಬರೆಯಬೇಕು.

ಆದ್ದರಿಂದ, ಮೊದಲು `topView` ಅನ್ನು `body` ಒಳಗೆ ಇರಿಸಿ ತೋರಿಸಬಹುದು:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

ಈ ಸಮಯದಲ್ಲಿ, ಮೇಲಿನ ಪ್ರದೇಶ ಈಗಾಗಲೇ ತೋರಿದುದನ್ನು ಕಾಣಬಹುದು:

![view](../../../Resource/026_view2.png)

ಆದರೆ, `topView` ಒಳಗಿನ ಪಠ್ಯ ಬಿಳಿಯಾಗಿದ್ದು, ಡೀಫಾಲ್ಟ್ ಹಿನ್ನೆಲೆಯೂ ತಿಳಿ ಬಣ್ಣದಲ್ಲಿರುವುದರಿಂದ, light mode ನಲ್ಲಿ ಅದು ಸ್ಪಷ್ಟವಾಗಿ ಕಾಣದಿರಬಹುದು.

ಆದ್ದರಿಂದ, ಹೊರಭಾಗದಲ್ಲಿ ಒಂದು `VStack` ಸೇರಿಸಿ, ನಂತರ ಸಂಪೂರ್ಣ ಪ್ರದೇಶಕ್ಕೆ ಒಳ ಅಂತರ, ಹಿನ್ನೆಲೆ ಬಣ್ಣ ಮತ್ತು ಮೂಲೆಗಳ ವಕ್ರತೆಯನ್ನು ಹೊಂದಿಸಬಹುದು:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view3.png)

ಇಲ್ಲಿನ `VStack` ಪ್ರಸ್ತುತ ಕೇವಲ ಒಂದು `topView` ಅನ್ನು ಮಾತ್ರ ಹೊಂದಿದೆ, ಆದ್ದರಿಂದ ಅದು ಅವಶ್ಯಕವಲ್ಲದಂತೆ ಕಾಣಬಹುದು.

ಆದರೆ ನಂತರ ನಾವು ಕೋರ್ಸ್ ಶೀರ್ಷಿಕೆ, ಕೋರ್ಸ್ ವಿವರಣೆ ಮತ್ತು ಬಟನ್ ಪ್ರದೇಶವನ್ನು ಮುಂದುವರಿಸಿ ಸೇರಿಸುತ್ತೇವೆ. ಇವುಗಳೆಲ್ಲವೂ ಲಂಬವಾಗಿ ಜೋಡಿಸಲ್ಪಡುವ ವಿಷಯಗಳಾಗಿರುವುದರಿಂದ, ಇಲ್ಲಿ ಮುಂಚಿತವಾಗಿ `VStack` ಬಳಸುವುದರಿಂದ ನಂತರ ವೀಕ್ಷಣೆಗಳನ್ನು ಸಂಯೋಜಿಸುವುದು ಸುಲಭವಾಗುತ್ತದೆ.

ಇಲ್ಲಿ ಎರಡು `.padding()` modifier ಗಳಿವೆ, ಅವುಗಳ ಕಾರ್ಯ ಬೇರೆ ಬೇರೆ.

ಮೊದಲ `.padding(20)` ಅನ್ನು `.background()` ಮೊದಲು ಬರೆಯಲಾಗಿದೆ:

```swift
.padding(20)
.background(Color.indigo)
```

ಇದು ಕಾರ್ಡ್‌ನ ಒಳ ಅಂತರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ, ಅಂದರೆ ವಿಷಯ ಮತ್ತು ಹಿನ್ನೆಲೆಯ ಅಂಚಿನ ನಡುವಿನ ದೂರವನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ಎರಡನೇ `.padding(30)` ಅನ್ನು `.background()` ನಂತರ ಬರೆಯಲಾಗಿದೆ:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

ಇದು ಕಾರ್ಡ್‌ನ ಹೊರ ಅಂತರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ, ಅಂದರೆ ಸಂಪೂರ್ಣ ಕಾರ್ಡ್ ಮತ್ತು ಪರದೆಯ ಅಂಚಿನ ನಡುವಿನ ದೂರವನ್ನು ಸೂಚಿಸುತ್ತದೆ.

![view](../../../Resource/026_view4.png)

ಆದ್ದರಿಂದ, ಎರಡೂ `.padding()` ಆಗಿದ್ದರೂ, ಬೇರೆ ಬೇರೆ ಸ್ಥಾನಗಳಲ್ಲಿ ಬರೆಯುವುದರಿಂದ ಪರಿಣಾಮವೂ ಬೇರೆ ಆಗುತ್ತದೆ.

## ವಿಷಯ ಪ್ರದೇಶ

ಮುಂದೆ, ಕೋರ್ಸ್ ಕಾರ್ಡ್‌ನ ವಿಷಯ ಪ್ರದೇಶವನ್ನು ನಿರ್ಮಿಸೋಣ.

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view5.png)

ವಿಷಯ ಪ್ರದೇಶದಲ್ಲಿ ಕೋರ್ಸ್ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಕೋರ್ಸ್ ವಿವರಣೆ ಇರುತ್ತವೆ. ಅವು ಲಂಬವಾಗಿ ಜೋಡಿಸಲ್ಪಟ್ಟಿರುವುದರಿಂದ `VStack` ಬಳಸಲಾಗುತ್ತದೆ.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI ಪ್ರಾರಂಭಿಕ ಟ್ಯುಟೋರಿಯಲ್")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("ಶೂನ್ಯದಿಂದ SwiftUI ಕಲಿಯಲು ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು Apple ನ ಘೋಷಣಾತ್ಮಕ UI ಅಭಿವೃದ್ಧಿಯನ್ನು ಕ್ರಮಬದ್ಧವಾಗಿ ಕಲಿಯಿರಿ. ಸ್ಪಷ್ಟ ವಿವರಣೆಗಳು ಮತ್ತು ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳ ಮೂಲಕ, ನೀವು layout, interaction, ಮತ್ತು state management ಅನ್ನು ಹಂತ ಹಂತವಾಗಿ ಹಿಡಿದುಕೊಂಡು, ಸುಂದರ ಮತ್ತು ಉಪಯುಕ್ತ app interfaces ನಿರ್ಮಿಸಲು ಕಲಿಯುತ್ತೀರಿ.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view6.png)

ಈ `VStack` ನಲ್ಲಿ ಎರಡು parameters ಬಳಸಲಾಗಿದೆ:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` ಎಂದರೆ `VStack` ಒಳಗಿನ ವೀಕ್ಷಣೆಗಳನ್ನು leading ಅಂಚಿಗೆ ಹೊಂದಿಸುವುದು.

`spacing: 10` ಎಂದರೆ `VStack` ಒಳಗಿನ ವೀಕ್ಷಣೆಗಳ ನಡುವೆ `10 pt` ಅಂತರವನ್ನು ಇಡುವುದು.

ಹೀಗಾಗಿ, ಕೋರ್ಸ್ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಕೋರ್ಸ್ ವಿವರಣೆ ಎಡಭಾಗದಿಂದ ಜೋಡಿಸಲ್ಪಡುತ್ತವೆ, ಮತ್ತು ಅವುಗಳ ನಡುವೆ ಒಂದು ನಿರ್ದಿಷ್ಟ ಅಂತರ ಇರುತ್ತದೆ.

ಕೋರ್ಸ್ ವಿವರಣೆ ಸ್ವಲ್ಪ ಉದ್ದವಾಗಿದೆ. ಅದನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ತೋರಿಸಿದರೆ, ಕಾರ್ಡ್ ತುಂಬಾ ಎತ್ತರವಾಗುತ್ತದೆ. ಆದ್ದರಿಂದ ಇಲ್ಲಿ `.lineLimit()` ಬಳಸಿ ತೋರಿಸುವ ಸಾಲುಗಳ ಸಂಖ್ಯೆಯನ್ನು ಮಿತಿಗೊಳಿಸಲಾಗಿದೆ:

```swift
.lineLimit(3)
```

ಇದು ಗರಿಷ್ಠ `3` ಸಾಲುಗಳನ್ನು ತೋರಿಸುತ್ತದೆ. ವಿಷಯವು ಈ ಸಾಲು ಮಿತಿಯನ್ನು ಮೀರಿದಾಗ, ಹೆಚ್ಚುವರಿ ಭಾಗವನ್ನು ಬಿಡಲಾಗುತ್ತದೆ.

### ವೀಕ್ಷಣೆಯನ್ನು ಎಡಕ್ಕೆ ಹೊಂದಿಸುವುದು

ಇಲ್ಲಿ ಮತ್ತೊಂದು ವಿಷಯ ಗಮನಿಸಬೇಕು.

`VStack(alignment: .leading)` ಕೇವಲ `VStack` ಒಳಗಿನ ವೀಕ್ಷಣೆಗಳ ಹೊಂದಾಣಿಕೆಯನ್ನು ಮಾತ್ರ ನಿಯಂತ್ರಿಸುತ್ತದೆ. ಅದು ಹೊರಗಿನ container ಒಳಗೆ `VStack` ಸ್ವತಃ ಇರುವ ಸ್ಥಾನವನ್ನು ನೇರವಾಗಿ ನಿಯಂತ್ರಿಸುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ, ಕೋರ್ಸ್ ವಿವರಣೆ ಸ್ವಲ್ಪ ಚಿಕ್ಕದಿದ್ದರೆ:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI ಪ್ರಾರಂಭಿಕ ಟ್ಯುಟೋರಿಯಲ್")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("ಸ್ವಲ್ಪ ವಿಷಯ ಮಾತ್ರ.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view7.png)

ನೀವು ನೋಡಬಹುದು, ಕೋರ್ಸ್ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಕೋರ್ಸ್ ವಿವರಣೆ `VStack` ಒಳಗೆ ಎಡಕ್ಕೆ ಹೊಂದಿದ್ದರೂ, ಸಂಪೂರ್ಣ `VStack` ಕಾರ್ಡ್‌ನ ಅತಿ ಎಡ ಅಂಚಿಗೆ ಹೊಂದಿಲ್ಲ.

ಇದರ ಕಾರಣ, ವಿಷಯ ಚಿಕ್ಕದಾಗಿರುವಾಗ `VStack` ನ ಅಗಲವೂ ಚಿಕ್ಕದಾಗುತ್ತದೆ. ಹೊರಗಿನ container layout ಮಾಡುವಾಗ, ಈ ಕಿರಿದಾದ `VStack` ಅನ್ನು ಮಧ್ಯದಲ್ಲಿ ಇರಿಸಬಹುದು.

ಇದನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: `VStack(alignment: .leading)` ಒಳಗಿನ ಎಡ ಹೊಂದಾಣಿಕೆಗೆ ಜವಾಬ್ದಾರಿಯಾಗಿದೆ.
ಆದರೆ ಸಂಪೂರ್ಣ ವಿಷಯ ಪ್ರದೇಶವನ್ನು ಅತಿ ಎಡಕ್ಕೆ ತಳ್ಳುವ ಜವಾಬ್ದಾರಿ ಅದಕ್ಕಿಲ್ಲ.

ಸಂಪೂರ್ಣ ವಿಷಯ ಪ್ರದೇಶ ನಿಜವಾಗಿಯೂ ಎಡಕ್ಕೆ ಹೊಂದಬೇಕೆಂದರೆ, ಹೊರಗೆ ಮತ್ತೊಂದು `HStack` ಹಾಕಿ `Spacer()` ಸೇರಿಸಬಹುದು:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI ಪ್ರಾರಂಭಿಕ ಟ್ಯುಟೋರಿಯಲ್")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("ಸ್ವಲ್ಪ ವಿಷಯ ಮಾತ್ರ.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view8.png)

ಇಲ್ಲಿನ `HStack` ಒಂದು ಅಡ್ಡ layout ಆಗಿದೆ.

`Spacer()` ಬಲಭಾಗದ ಉಳಿದ ಜಾಗವನ್ನು ಹಿಡಿದುಕೊಳ್ಳುತ್ತದೆ, ಇದರಿಂದ ಎಡಭಾಗದ `VStack` ಅತಿ ಎಡಕ್ಕೆ ತಳ್ಳಲ್ಪಡುತ್ತದೆ.

ಆದ್ದರಿಂದ, `HStack + Spacer()` ಅನ್ನು ಸಂಪೂರ್ಣ ವಿಷಯ ಪ್ರದೇಶದ ಸ್ಥಾನವನ್ನು ನಿಯಂತ್ರಿಸಲು ಬಳಸಬಹುದು.

ವಾಸ್ತವ ಕೋರ್ಸ್ ಕಾರ್ಡ್‌ನಲ್ಲಿ, ಕೋರ್ಸ್ ವಿವರಣೆ ಸ್ವಲ್ಪ ಉದ್ದವಾಗಿದ್ದು ಸಾಮಾನ್ಯವಾಗಿ ಹೆಚ್ಚು ಅಗಲವನ್ನು ಹಿಡಿಯುತ್ತದೆ, ಆದ್ದರಿಂದ ಈ ಸಮಸ್ಯೆ ಸ್ಪಷ್ಟವಾಗದೇ ಇರಬಹುದು. ಆದರೆ ಈ ವ್ಯತ್ಯಾಸವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು ಮುಖ್ಯ, ಏಕೆಂದರೆ ನಂತರ ಚಿಕ್ಕ ಪಠ್ಯ layout ಮಾಡುವಾಗ ಇಂತಹ ಪರಿಸ್ಥಿತಿಗಳು ಆಗಾಗ ಬರುತ್ತವೆ.

### ಒಳಗಿನ ವೀಕ್ಷಣೆಗಳ ನಡುವಿನ ಅಂತರ ನಿಯಂತ್ರಿಸುವುದು

ಹಿಂದೆ ನಾವು `VStack` ನಲ್ಲಿ `spacing: 10` ಬರೆದಿದ್ದೇವೆ:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` ಅನ್ನು ಒಳಗಿನ ವೀಕ್ಷಣೆಗಳ ನಡುವಿನ ಅಂತರವನ್ನು ನಿಯಂತ್ರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

`spacing` ಹೊಂದಿಸದಿದ್ದರೂ, `VStack` ಗೆ default spacing ಇರುತ್ತದೆ, ಆದರೆ ಆ default spacing ನಮಗೆ ಬೇಕಾದ ಪರಿಣಾಮಕ್ಕೆ ತಕ್ಕಂತೆ ಇರಬೇಕೆಂಬುದಿಲ್ಲ.

ಇಲ್ಲಿ, ಕೋರ್ಸ್ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಕೋರ್ಸ್ ವಿವರಣೆ ತುಂಬಾ ಹತ್ತಿರ ಇದ್ದರೆ layout ಕಿಕ್ಕಿರಿದಂತೆ ಕಾಣುತ್ತದೆ, ಆದ್ದರಿಂದ ನಾವು ಬಳಸುವುದು:

```swift
spacing: 10
```

ಇದರಿಂದ ಅವುಗಳ ನಡುವೆ ಸ್ವಲ್ಪ ಜಾಗ ಉಳಿಯುತ್ತದೆ.

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view9.png)

ಅದೇ ರೀತಿ, ಮೇಲಿನ ಪ್ರದೇಶ ಮತ್ತು ವಿಷಯ ಪ್ರದೇಶವೂ ಲಂಬವಾಗಿ ಜೋಡಿಸಲ್ಪಟ್ಟಿರುವುದರಿಂದ, ಅವುಗಳ ನಡುವಿನ ಅಂತರವನ್ನು ನಿಯಂತ್ರಿಸಲು `spacing` ಬಳಸಬಹುದು.

ಈಗ, `topView` ಮತ್ತು `contentView` ಅನ್ನು `body` ಒಳಗೆ ಇರಿಸಿ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view10.png)

ಇಲ್ಲಿ, `VStack(spacing: 20)` `topView` ಮತ್ತು `contentView` ನಡುವಿನ ಅಂತರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.

ಬೇರೆ ರೀತಿಯಲ್ಲಿ ಹೇಳುವುದಾದರೆ:

```swift
VStack(alignment: .leading, spacing: 10)
```

ಕೋರ್ಸ್ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಕೋರ್ಸ್ ವಿವರಣೆ ನಡುವಿನ ಅಂತರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.

```swift
VStack(spacing: 20)
```

ಮೇಲಿನ ಪ್ರದೇಶ ಮತ್ತು ವಿಷಯ ಪ್ರದೇಶ ನಡುವಿನ ಅಂತರವನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.

ಇವು ಎರಡೂ `spacing` ಆಗಿದ್ದರೂ, ಬೇರೆ ಬೇರೆ `VStack` containers ಮೇಲೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತವೆ, ಆದ್ದರಿಂದ ಪರಿಣಾಮ ಬೀರುವ ವ್ಯಾಪ್ತಿಯೂ ಬೇರೆ.

ಈ ಮೂಲಕ, ವಿಷಯ ಪ್ರದೇಶದ ವೀಕ್ಷಣೆ ಪೂರ್ಣಗೊಂಡಿದೆ.

## ಬಟನ್ ಪ್ರದೇಶ

ಮುಂದೆ, ಕೆಳಗಿನ ಬಟನ್ ಪ್ರದೇಶವನ್ನು ನಿರ್ಮಿಸೋಣ.

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view11.png)

ಬಟನ್ ಪ್ರದೇಶ ಮುಖ್ಯವಾಗಿ ಒಂದು play ಐಕಾನ್ ಮತ್ತು ಒಂದು ಪಠ್ಯದಿಂದ ಕೂಡಿದೆ.

ನಾವು `Image` ಬಳಸಿ play ಐಕಾನ್ ತೋರಿಸಬಹುದು, `Text` ಬಳಸಿ ಬಟನ್ ಪಠ್ಯ ತೋರಿಸಬಹುದು.

ಇಲ್ಲಿ ಮೊದಲು ಒಂದು ಬಟನ್ ರೂಪವನ್ನು ನಿರ್ಮಿಸೋಣ:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("ಬಟನ್ ಕ್ಲಿಕ್")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("ಕಲಿಯಲು ಪ್ರಾರಂಭಿಸಿ")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view12.png)

ಇಲ್ಲಿ ಎರಡು `HStack` containers ಬಳಸಲಾಗಿದೆ:

ಒಳಗಿನ `HStack` ಐಕಾನ್ ಮತ್ತು ಪಠ್ಯವನ್ನು ಅಡ್ಡವಾಗಿ ಜೋಡಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("ಕಲಿಯಲು ಪ್ರಾರಂಭಿಸಿ")
}
```

ಹೊರಗಿನ `HStack`, `Spacer()` ಜೊತೆಗೆ, ಬಟನ್ ರೂಪವನ್ನು ಎಡಕ್ಕೆ ಹೊಂದಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ:

```swift
HStack {
    ...
    Spacer()
}
```

ಬಟನ್ ಒತ್ತಿದಾಗ, console ನಲ್ಲಿ `ಬಟನ್ ಕ್ಲಿಕ್` output ಆಗುತ್ತದೆ.

## ಮೂಲ ಕಾರ್ಡ್ ಪೂರ್ಣಗೊಂಡಿದೆ

ಈಗ, ಮೇಲಿನ ಪ್ರದೇಶ, ವಿಷಯ ಪ್ರದೇಶ ಮತ್ತು ಬಟನ್ ಪ್ರದೇಶವನ್ನು ಸಂಯೋಜಿಸಿ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ತೋರಿಸುವ ಪರಿಣಾಮ:

![view](../../../Resource/026_view13.png)

ಇಲ್ಲಿಗೆ, ಒಂದು ಮೂಲ ಕೋರ್ಸ್ ಕಾರ್ಡ್ ಪೂರ್ಣಗೊಂಡಿದೆ.

## Swift ಐಕಾನ್ ಹಿನ್ನೆಲೆ

ಕೊನೆಯಾಗಿ, ಕಾರ್ಡ್‌ಗೆ ಅರ್ಧಪಾರದರ್ಶಕ Swift ಐಕಾನ್ ಹಿನ್ನೆಲೆಯನ್ನು ಸೇರಿಸೋಣ.

![view](../../../Resource/026_view.png)

ಹಿಂದೆ ನಾವು `Color.indigo` ಅನ್ನು ಹಿನ್ನೆಲೆ ಬಣ್ಣವಾಗಿ ಬಳಸಿದ್ದೇವೆ. ವಾಸ್ತವವಾಗಿ, `.background()` ಬಣ್ಣವನ್ನು ಸೇರಿಸುವುದರ ಜೊತೆಗೆ ಒಂದು ಪೂರ್ಣ ವೀಕ್ಷಣೆಯನ್ನೂ ಸೇರಿಸಬಹುದು.

ಆದ್ದರಿಂದ, ಮೊದಲು ಒಂದು ವಿಶೇಷ ಹಿನ್ನೆಲೆ ವೀಕ್ಷಣೆಯನ್ನು ರಚಿಸಬಹುದು:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

ಈ ಹಿನ್ನೆಲೆ ವೀಕ್ಷಣದಲ್ಲಿ, ನಾವು `VStack`, `HStack` ಮತ್ತು `Spacer()` ಬಳಸಿ Swift ಐಕಾನ್ ಅನ್ನು ಕೆಳಬಲ ಮೂಲೆಗೆ ತಳ್ಳುತ್ತೇವೆ.

Swift ಐಕಾನ್ ಕೇವಲ ಅಲಂಕಾರಿಕ ಹಿನ್ನೆಲೆಯಾಗಿ ಬಳಸಲಾಗುವುದರಿಂದ, ಇಲ್ಲಿ ಅರ್ಧಪಾರದರ್ಶಕ ಬಿಳಿಯನ್ನು ಬಳಸಲಾಗಿದೆ:

```swift
Color.white.opacity(0.15)
```

ಇದರಿಂದ ಐಕಾನ್ ಹೆಚ್ಚು ಗಮನ ಸೆಳೆಯುವುದಿಲ್ಲ, ಮತ್ತು ಮುಂದೆ ಇರುವ ಪಠ್ಯ ವಿಷಯಕ್ಕೆ ಅಡ್ಡಿಯಾಗುವುದಿಲ್ಲ.

ಮುಂದೆ, `backgroundView` ಅನ್ನು ಕಾರ್ಡ್‌ಗೆ ಸೇರಿಸಿ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ಅಂತಿಮ ಪರಿಣಾಮ:

![view](../../../Resource/026_view14.png)

ಇಲ್ಲಿ ಎರಡು `.background()` modifiers ಅನ್ನು ಕ್ರಮವಾಗಿ ಬಳಸಲಾಗಿದೆ:

```swift
.background(backgroundView)
.background(Color.indigo)
```

ಮೊದಲ `.background()` Swift ಐಕಾನ್ ಹಿನ್ನೆಲೆಯನ್ನು ಸೇರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.
ಎರಡನೇ `.background()` ಇಂಡಿಗೋ ಹಿನ್ನೆಲೆಯನ್ನು ಸೇರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

ಹೀಗಾಗಿ, Swift ಐಕಾನ್ ಇಂಡಿಗೋ ಹಿನ್ನೆಲೆಯ ಮೇಲ್ಭಾಗದಲ್ಲಿ ಕಾಣುತ್ತದೆ, ಮತ್ತು ಕಾರ್ಡ್ ಹಿನ್ನೆಲೆಯ ಒಂದು ಭಾಗವಾಗಿ ತೋರಿಸುತ್ತದೆ.

ಇದರಿಂದ `.background()` ಬಣ್ಣಗಳನ್ನು ಮಾತ್ರವಲ್ಲ, custom views ಗಳನ್ನೂ ಸೇರಿಸಬಹುದು ಎಂಬುದು ಕಾಣುತ್ತದೆ. ಹಲವಾರು `.background()` modifiers ಅನ್ನು ಸೇರಿಸಿ ಬಳಸುವುದರಿಂದ ಇನ್ನಷ್ಟು ಸಮೃದ್ಧ ಹಿನ್ನೆಲೆ ಪರಿಣಾಮಗಳನ್ನು ಪಡೆಯಬಹುದು.

ಇಲ್ಲಿಗೆ, ಒಂದು ಸಂಪೂರ್ಣ ಕೋರ್ಸ್ ಕಾರ್ಡ್ ಪೂರ್ಣಗೊಂಡಿದೆ.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, ಒಂದು ಕೋರ್ಸ್ ಕಾರ್ಡ್ ಮೂಲಕ SwiftUI ಯ ಸಾಮಾನ್ಯ ಮೂಲ layout ವಿಧಾನಗಳನ್ನು ಮರುಪರಿಶೀಲಿಸಿದ್ದೇವೆ.

ನಾವು `Text` ಬಳಸಿ ಪಠ್ಯ ತೋರಿಸಿದ್ದೇವೆ, `Image` ಬಳಸಿ system icon ತೋರಿಸಿದ್ದೇವೆ, ಮತ್ತು `VStack`, `HStack`, `Spacer()` ಬಳಸಿ ವೀಕ್ಷಣೆಗಳ ಜೋಡಣೆಯನ್ನು ನಿಯಂತ್ರಿಸಿದ್ದೇವೆ.

ನಾವು `.lineLimit()` ಕಲಿತಿದ್ದೇವೆ. ಇದು ಪಠ್ಯವು ತೋರಿಸಬಹುದಾದ ಗರಿಷ್ಠ ಸಾಲುಗಳ ಸಂಖ್ಯೆಯನ್ನು ಮಿತಿಗೊಳಿಸುತ್ತದೆ. ವಿಷಯ ಮಿತಿಯನ್ನು ಮೀರಿದಾಗ, ಹೆಚ್ಚುವರಿ ಭಾಗವನ್ನು ಬಿಡಲಾಗುತ್ತದೆ.

ಅದೇ ಸಮಯದಲ್ಲಿ, `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` ಮುಂತಾದ ಸಾಮಾನ್ಯ modifiers ಗಳನ್ನೂ ಮರುಪರಿಶೀಲಿಸಿದ್ದೇವೆ.

ಈ ಪಾಠ ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನಾವು ಈಗಾಗಲೇ ಹಲವಾರು ಸಣ್ಣ ವೀಕ್ಷಣೆಗಳನ್ನು ಒಂದು ಸಂಪೂರ್ಣ ಕಾರ್ಡ್ module ಆಗಿ ಸಂಯೋಜಿಸಬಹುದು.

ಇದು SwiftUI ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಬಹಳ ಸಾಮಾನ್ಯವಾದ ಆಲೋಚನೆಯೂ ಆಗಿದೆ: ಮೊದಲು ವೀಕ್ಷಣೆಗಳನ್ನು ಸಣ್ಣ ಭಾಗಗಳಾಗಿ ಬೇರ್ಪಡಿಸಿ, ನಂತರ ಅವುಗಳನ್ನು ಸಂಪೂರ್ಣ interface ಆಗಿ ಸಂಯೋಜಿಸುವುದು.

## ಸಂಪೂರ್ಣ ಕೋಡ್

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("ಪ್ರಾರಂಭಿಕ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ ಪಾಠಗಳು")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI ಪ್ರಾರಂಭಿಕ ಟ್ಯುಟೋರಿಯಲ್")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("ಶೂನ್ಯದಿಂದ SwiftUI ಕಲಿಯಲು ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು Apple ನ ಘೋಷಣಾತ್ಮಕ UI ಅಭಿವೃದ್ಧಿಯನ್ನು ಕ್ರಮಬದ್ಧವಾಗಿ ಕಲಿಯಿರಿ. ಸ್ಪಷ್ಟ ವಿವರಣೆಗಳು ಮತ್ತು ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳ ಮೂಲಕ, ನೀವು layout, interaction, ಮತ್ತು state management ಅನ್ನು ಹಂತ ಹಂತವಾಗಿ ಹಿಡಿದುಕೊಂಡು, ಸುಂದರ ಮತ್ತು ಉಪಯುಕ್ತ app interfaces ನಿರ್ಮಿಸಲು ಕಲಿಯುತ್ತೀರಿ.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("ಬಟನ್ ಕ್ಲಿಕ್")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("ಕಲಿಯಲು ಪ್ರಾರಂಭಿಸಿ")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
