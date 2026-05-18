# ಕಸ್ಟಮ್ ಬಣ್ಣ

ಈ ಪಾಠದಲ್ಲಿ, SwiftUI ನಲ್ಲಿ ಬಣ್ಣಗಳನ್ನು ಕಸ್ಟಮ್ ಮಾಡುವುದು ಹೇಗೆ ಎಂಬುದನ್ನು ಕಲಿಯುತ್ತೇವೆ.

ಹಿಂದಿನ ಪಾಠಗಳಲ್ಲಿ, SwiftUI ಒದಗಿಸುವ ಡೀಫಾಲ್ಟ್ ಬಣ್ಣಗಳನ್ನು ನಾವು ಈಗಾಗಲೇ ಬಳಸಿದ್ದೇವೆ. ಉದಾಹರಣೆಗೆ:

```swift
Color.blue
Color.red
Color.green
```

ಈ ಬಣ್ಣಗಳನ್ನು ಬಳಸುವುದು ತುಂಬಾ ಸುಲಭ. ಆದರೆ ನಿಜವಾದ App ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ಡೀಫಾಲ್ಟ್ ಬಣ್ಣಗಳು ಸಾಮಾನ್ಯವಾಗಿ ಸಾಕಷ್ಟು ನಿಖರವಾಗಿರುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ, ವಿನ್ಯಾಸ ಚಿತ್ರದಲ್ಲಿ ಇಂತಹ ಬಣ್ಣಗಳನ್ನು ಬಳಸಿರಬಹುದು:

```text
#2c54c2
#4875ed
#213e8d
```

ಈ ರೀತಿಯ ಬಣ್ಣವನ್ನು Hex ಬಣ್ಣ ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ.

ಈ ಪಾಠದಲ್ಲಿ, ಮೊದಲು SwiftUI ಗೆ Hex ಬಣ್ಣಗಳನ್ನು ಬೆಂಬಲಿಸುವ ಸಾಮರ್ಥ್ಯ ನೀಡುತ್ತೇವೆ. ನಂತರ `static` ಬಳಸಿ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸುವ ಬಣ್ಣಗಳನ್ನು ಸರಿಯಾಗಿ ವ್ಯವಸ್ಥೆ ಮಾಡುತ್ತೇವೆ.

ಕೊನೆಯಲ್ಲಿ, ಕಸ್ಟಮ್ ಬಣ್ಣಗಳನ್ನು Animal Encyclopedia view ಗೆ ಅನ್ವಯಿಸಿ, gradient background ಅನ್ನು ಮತ್ತಷ್ಟು ಬಳಸುತ್ತೇವೆ. ಇದರಿಂದ ಬಟನ್‌ಗಳು ಹೆಚ್ಚು ಪದರ ಹೊಂದಿದಂತೆ ಕಾಣುತ್ತವೆ.

## ಕಸ್ಟಮ್ ಬಣ್ಣಗಳು ಏಕೆ ಬೇಕು?

SwiftUI ನಲ್ಲಿ, ನಾವು system colors ಅನ್ನು ನೇರವಾಗಿ ಬಳಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

ಇಲ್ಲಿನ `.blue` ನೀಲಿ ಬಣ್ಣವನ್ನು ಸೂಚಿಸುತ್ತದೆ. ಇದು ವಾಸ್ತವವಾಗಿ `Color.blue` ಯ ಸಂಕ್ಷಿಪ್ತ ರೂಪವಾಗಿದೆ.

ಡೀಫಾಲ್ಟ್ ಬಣ್ಣಗಳ ಪ್ರಯೋಜನವೆಂದರೆ ಅವು ಸರಳ ಮತ್ತು ಬಳಸಲು ಅನುಕೂಲಕರ. ಆದರೆ ಬಣ್ಣಗಳ ಆಯ್ಕೆ ಸೀಮಿತವಾಗಿರುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
Color.blue
```

ಇದು SwiftUI ಒದಗಿಸುವ ಡೀಫಾಲ್ಟ್ ನೀಲಿ ಬಣ್ಣವನ್ನಷ್ಟೇ ಸೂಚಿಸಬಹುದು.

![Color.blue](../../../Resource/031_color6.png)

ಆದರೆ ನಿಜವಾದ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ನಮಗೆ ಇನ್ನಷ್ಟು ನಿರ್ದಿಷ್ಟವಾದ ಬಣ್ಣಗಳು ಬೇಕಾಗುತ್ತವೆ.

ಉದಾಹರಣೆಗೆ, ಒಂದೇ ನೀಲಿ ಬಣ್ಣದಲ್ಲಿಯೂ ಲೈಟ್ ಬ್ಲೂ, ಡಾರ್ಕ್ ಬ್ಲೂ, ಗ್ರೇ-ಬ್ಲೂ, ಬ್ರೈಟ್ ಬ್ಲೂ ಮುಂತಾದ ವಿಭಿನ್ನ ಪರಿಣಾಮಗಳು ಇರಬಹುದು.

![More Blue](../../../Resource/031_color5.png)

ಈ ಸಂದರ್ಭದಲ್ಲಿ ಕೇವಲ `Color.blue` ಬಳಸಿದರೆ, ವಿನ್ಯಾಸದ ಪರಿಣಾಮವನ್ನು ಮರುಸೃಷ್ಟಿಸುವುದು ಕಷ್ಟ.

ಆದ್ದರಿಂದ, SwiftUI ಗೆ ಕಸ್ಟಮ್ ಬಣ್ಣಗಳನ್ನು ಬೆಂಬಲಿಸುವಂತೆ ಮಾಡಬೇಕು.

## Hex ಬಣ್ಣ ಎಂದರೇನು?

ಸ್ಕ್ರೀನ್‌ನಲ್ಲಿನ ಬಣ್ಣಗಳು ಸಾಮಾನ್ಯವಾಗಿ ಕೆಂಪು, ಹಸಿರು ಮತ್ತು ನೀಲಿ ಎಂಬ ಮೂರು channel ಗಳಿಂದ ರಚಿತವಾಗಿರುತ್ತವೆ. ಇದನ್ನೇ RGB ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ.

RGB ಕ್ರಮವಾಗಿ ಸೂಚಿಸುವುದು:

```text
Red     // ಕೆಂಪು
Green   // ಹಸಿರು
Blue    // ನೀಲಿ
```

Hex ಬಣ್ಣವು RGB ಬಣ್ಣವನ್ನು ವ್ಯಕ್ತಪಡಿಸುವ ಒಂದು ವಿಧಾನವಾಗಿದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
#5479FF
```

ಈ ಬಣ್ಣದ ಮೌಲ್ಯವನ್ನು ಸರಳವಾಗಿ ಮೂರು ಭಾಗಗಳಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

```text
54  // ಕೆಂಪು channel ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ
79  // ಹಸಿರು channel ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ
FF  // ನೀಲಿ channel ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ
```

ಈ ಪಾಠದಲ್ಲಿ, ಈ ಮೌಲ್ಯಗಳನ್ನು ನಾವು ಲೆಕ್ಕ ಹಾಕಬೇಕಾಗಿಲ್ಲ. hexadecimal ನಿಯಮಗಳನ್ನು ಆಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಕಾಗಿಯೂ ಇಲ್ಲ.

ಈಗ ತಿಳಿದುಕೊಳ್ಳಬೇಕಾದದ್ದು ಒಂದೇ: `#5479FF` ಒಂದು ನಿರ್ದಿಷ್ಟ ಬಣ್ಣವನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ಮುಂದೆ ನಾವು `#2c54c2`, `#4875ed` ಮುಂತಾದ ಬರವಣಿಗೆಯನ್ನು ನೋಡಿದಾಗ, ಮೊದಲು ಅದನ್ನು ಒಂದು color value ಎಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

Sketch, Figma, Photoshop ಮುಂತಾದ design tools ಗಳಲ್ಲಿಯೂ ಇಂತಹ ಬಣ್ಣದ ಮೌಲ್ಯಗಳನ್ನು ಆಗಾಗ ನೋಡಬಹುದು.

![color](../../../Resource/031_color.png)

ಆದರೆ, SwiftUI ಡೀಫಾಲ್ಟ್ ಆಗಿ ಇದನ್ನು ನೇರವಾಗಿ ಹೀಗೆ ಬರೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ:

```swift
Color(hex: "#5479FF")
```

ಆದ್ದರಿಂದ, ನಾವು ಸ್ವತಃ `Color` type ಅನ್ನು extend ಮಾಡಬೇಕು. ಇದರಿಂದ Hex string ಮೂಲಕ ಬಣ್ಣವನ್ನು ರಚಿಸಲು ಅದು ಬೆಂಬಲಿಸುತ್ತದೆ.

## Color+Hex.swift ಫೈಲ್ ರಚಿಸುವುದು

ಮೊದಲು, ನಾವು ಹೊಸ Swift file ಒಂದನ್ನು ರಚಿಸುತ್ತೇವೆ.

ಫೈಲ್ ಹೆಸರನ್ನು ಹೀಗೆ ಬರೆಯಬಹುದು:

```text
Color.swift
```

ಅಥವಾ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗಿ ಹೀಗೆ ಬರೆಯಬಹುದು:

```text
Color+Hex.swift
```

ಇಲ್ಲಿ ಹೆಚ್ಚು ಶಿಫಾರಸು ಮಾಡುವುದು:

```text
Color+Hex.swift
```

Swift project ನಲ್ಲಿ `Color+Hex.swift` ತರಹದ file name ಗಳು ಬಹಳ ಸಾಮಾನ್ಯ.

ಇದು ಈ file `Color` ಗೆ Hex ಸಾಮರ್ಥ್ಯವನ್ನು ಸೇರಿಸುವ extension file ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

ಫೈಲ್ ಹೆಸರು code running ಮೇಲೆ ನೇರವಾಗಿ ಪರಿಣಾಮ ಬೀರುವುದಿಲ್ಲ. ಆದರೆ ಈ file ಯ ಉದ್ದೇಶವನ್ನು ಸುಲಭವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಇದು ಸಹಾಯ ಮಾಡುತ್ತದೆ.

## Color(hex:) code ಸೇರಿಸುವುದು

`Color+Hex.swift` file ನಲ್ಲಿ ಕೆಳಗಿನ code ಅನ್ನು ಬರೆಯಿರಿ:

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

ಈ code `extension` ಬಳಸಿ `Color` type ಅನ್ನು extend ಮಾಡುತ್ತದೆ ಮತ್ತು `Color` ಗೆ ಹೊಸ initializer ಒಂದನ್ನು ಸೇರಿಸುತ್ತದೆ:

```swift
init(hex: String)
```

ಈ initializer ಇದ್ದ ನಂತರ, ನಾವು Hex string ಅನ್ನು `Color` ಗೆ ನೀಡಬಹುದು. ಹೀಗಾಗಿ ಕಸ್ಟಮ್ ಬಣ್ಣವನ್ನು ರಚಿಸಬಹುದು:

```swift
Color(hex: "#5479FF")
```

ಈ extension code ಒಳಗೆ Hex string ಅನ್ನು SwiftUI ಗುರುತಿಸಬಹುದಾದ RGB color ಆಗಿ ಪರಿವರ್ತಿಸುತ್ತದೆ.

ಈ ಹಂತದಲ್ಲಿ ಪ್ರತಿ ಸಾಲಿನ conversion logic ಅನ್ನು ಆಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಕಾಗಿಲ್ಲ. ಸೇರಿಸಿದ `Color(hex:)` method Hex color value ಮೂಲಕ ಕಸ್ಟಮ್ ಬಣ್ಣಗಳನ್ನು ರಚಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ ಎಂಬುದನ್ನು ತಿಳಿದರೆ ಸಾಕು.

## ಕಸ್ಟಮ್ ಬಣ್ಣ ಬಳಸುವುದು

ಈಗ, ನಾವು `ContentView` ನಲ್ಲಿ ಕಸ್ಟಮ್ ಬಣ್ಣವನ್ನು ಪರೀಕ್ಷಿಸಬಹುದು.

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

ಪ್ರದರ್ಶನ ಪರಿಣಾಮ:

![color](../../../Resource/031_color1.png)

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, ಮೊದಲ ಸಾಲು system color ಅನ್ನು ಬಳಸುತ್ತದೆ:

```swift
.foregroundStyle(Color.blue)
```

ನಂತರದ ಮೂರು ಸಾಲುಗಳು ಕಸ್ಟಮ್ Hex colors ಅನ್ನು ಬಳಸುತ್ತವೆ:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

ಹೋಲಿಸಿದಾಗ, system blue ಒಂದೇ default effect ಹೊಂದಿದೆ ಎಂಬುದನ್ನು ಕಾಣಬಹುದು.

ಆದರೆ Hex color ಇನ್ನಷ್ಟು ಸೂಕ್ಷ್ಮವಾದ ನೀಲಿ ಬಣ್ಣದ ವ್ಯತ್ಯಾಸಗಳನ್ನು ವ್ಯಕ್ತಪಡಿಸಬಹುದು.

ಇದೇ ಕಸ್ಟಮ್ ಬಣ್ಣದ ಮೌಲ್ಯ: ಇದು interface ನ ಬಣ್ಣಗಳನ್ನು ನಿಜವಾದ design ಗೆ ಹೆಚ್ಚು ಸಮೀಪವಾಗಿಸಬಹುದು ಮತ್ತು App ನ visual style ಅನ್ನು ನಿಯಂತ್ರಿಸಲು ನಮಗೆ ಹೆಚ್ಚು ಅನುಕೂಲ ನೀಡುತ್ತದೆ.

## static ಬಳಸಿ ಬಣ್ಣಗಳನ್ನು ವ್ಯವಸ್ಥೆ ಮಾಡುವುದು

ಈಗ, ನಾವು Hex string ಮೂಲಕ ಬಣ್ಣವನ್ನು ರಚಿಸಬಹುದು:

```swift
Color(hex: "#2c54c2")
```

ಈ ಬರವಣಿಗೆ ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡುತ್ತದೆ. ಆದರೆ ಅದೇ ಬಣ್ಣವು ಹಲವು ಕಡೆ ಮರುಮರು ಕಾಣಿಸಿಕೊಂಡರೆ, ನಂತರದ maintenance ಅಷ್ಟು ಸುಲಭವಾಗುವುದಿಲ್ಲ.

ಈ ಬಣ್ಣದ ಮೌಲ್ಯವನ್ನು 10 ಕಡೆಗಳಲ್ಲಿ ಬರೆದಿದ್ದರೆ, ಮುಂದೆ ಈ ನೀಲಿ ಬಣ್ಣವನ್ನು ಬದಲಾಯಿಸಲು ಪ್ರತಿ ಸ್ಥಳದಲ್ಲೂ ಪ್ರತ್ಯೇಕವಾಗಿ ಬದಲಾಯಿಸಬೇಕಾಗುತ್ತದೆ.

ಈ ಸಂದರ್ಭದಲ್ಲಿ, ನಾವು `static` ಬಳಸಿ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸುವ ಬಣ್ಣಗಳನ್ನು ಒಂದೇ ಸ್ಥಳದಲ್ಲಿ ವ್ಯವಸ್ಥೆ ಮಾಡಬಹುದು.

`Color+Hex.swift` file ನ ಕೆಳಭಾಗದಲ್ಲಿ, ಕೆಳಗಿನ code ಅನ್ನು ಮುಂದುವರಿಸಿ ಸೇರಿಸಿ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ಇಲ್ಲಿ, ನಾವು `Color` ಗೆ ಮೂರು static properties ಸೇರಿಸಿದ್ದೇವೆ: `animalBlue`, `animalLightBlue` ಮತ್ತು `animalDarkBlue`. ಅವು ಕ್ರಮವಾಗಿ ವಿವಿಧ ಗಾಢತೆಗಳ ನೀಲಿ ಬಣ್ಣಗಳನ್ನು ಸೂಚಿಸುತ್ತವೆ.

ಈ properties `static` ಬಳಸಿರುವುದರಿಂದ, ಅವು `Color` type ಸ್ವತಃ ಸೇರಿವೆ.

ಬಳಸುವಾಗ, `Color.` ಮೂಲಕ ನೇರವಾಗಿ access ಮಾಡಬಹುದು:

```swift
Color.animalBlue
```

ಈ ಬರವಣಿಗೆ ನೇರವಾಗಿ Hex string ಬರೆಯುವುದಕ್ಕಿಂತ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗಿದೆ.

ನಾವು `Color.animalBlue` ನೋಡಿದಾಗ, ಅದು Animal Encyclopedia ನಲ್ಲಿ ಬಳಸುವ ನೀಲಿ ಬಣ್ಣವನ್ನು ಸೂಚಿಸುತ್ತದೆ ಎಂದು ತಿಳಿಯಬಹುದು.

ಆದರೆ `Color(hex: "#2c54c2")` ನೋಡಿದಾಗ, ಅದು ಒಂದು color value ಎಂದು ಮಾತ್ರ ತಿಳಿಯಬಹುದು. ಅದರ ನಿರ್ದಿಷ್ಟ ಬಳಕೆಯನ್ನು ಸುಲಭವಾಗಿ ಕಾಣಲು ಸಾಧ್ಯವಿಲ್ಲ.

ಬಣ್ಣಗಳನ್ನು unified ಆಗಿ manage ಮಾಡುವುದಕ್ಕೆ ಇನ್ನೊಂದು ಪ್ರಯೋಜನವಿದೆ: ನಂತರ ಬದಲಾವಣೆ ಮಾಡಲು ಸುಲಭ.

Animal Encyclopedia ಯ main color ಅನ್ನು ಬದಲಾಯಿಸಬೇಕೆಂದರೆ, definition ಇರುವ ಸ್ಥಳವನ್ನು ಮಾತ್ರ ಬದಲಾಯಿಸಬೇಕು:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

ಈ ಬಣ್ಣವನ್ನು ಬಳಸುವ ಎಲ್ಲಾ ಸ್ಥಳಗಳು ಜೊತೆಯಾಗಿ update ಆಗುತ್ತವೆ.

ಇದೇ `static` ಬಳಸಿ ಬಣ್ಣಗಳನ್ನು ವ್ಯವಸ್ಥೆ ಮಾಡುವ ಅರ್ಥ: ಬಣ್ಣದ ಹೆಸರುಗಳನ್ನು ಹೆಚ್ಚು ಸ್ಪಷ್ಟಗೊಳಿಸುವುದು ಮತ್ತು ನಂತರದ maintenance ಅನ್ನು ಸುಲಭಗೊಳಿಸುವುದು.

## Animal Encyclopedia ಗೆ ಅನ್ವಯಿಸುವುದು

ಈಗ, ನಾವು ಕಸ್ಟಮ್ ಬಣ್ಣಗಳನ್ನು ಹಿಂದಿನ Animal Encyclopedia view ಗೆ ಅನ್ವಯಿಸಬಹುದು.

ಹಿಂದೆ animal button background ಬಿಳಿಯಾಗಿತ್ತು:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

ಈಗ, ಅದನ್ನು ಕಸ್ಟಮ್ ಬಣ್ಣವಾಗಿ ಬದಲಾಯಿಸಬಹುದು:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

ಇಲ್ಲಿನ `Color.animalBlue` ನಾವು ಇತ್ತೀಚೆಗೆ `Color+Hex.swift` ನಲ್ಲಿ defined ಮಾಡಿದ static color ಆಗಿದೆ.

Button text ಬಿಳಿ ಬಣ್ಣವನ್ನು ಬಳಸುತ್ತದೆ:

```swift
.foregroundStyle(Color.white)
```

Animal emoji ಯ background ಅರ್ಧ ಪಾರದರ್ಶಕ ಬಿಳಿ ಬಣ್ಣವನ್ನು ಬಳಸುತ್ತದೆ:

```swift
.background(Color.white.opacity(0.15))
```

ಈ ರೀತಿ button ಒಂದು ಏಕೀಕೃತ ನೀಲಿ visual style ಅನ್ನು ರೂಪಿಸುತ್ತದೆ.

ಈ ಹಂತದ ಮುಖ್ಯ ವಿಷಯ complex code ಸೇರಿಸುವುದಲ್ಲ. ಬದಲಿಗೆ, ಮೊದಲು ಕಲಿತ ಕಸ್ಟಮ್ ಬಣ್ಣಗಳನ್ನು ನಿಜವಾದ interface ಗೆ ಅನ್ವಯಿಸುವುದು.

## Gradient background ಬಳಸುವುದು

ಒಂದು ಬಣ್ಣವನ್ನು ಮಾತ್ರ ಬಳಸುವುದರ ಹೊರತಾಗಿ, ಹಲವು ಬಣ್ಣಗಳನ್ನು gradient effect ಆಗಿ ಸೇರಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ, ನಾವು ಹಿಂದೆ ಈ ಬಣ್ಣಗಳನ್ನು defined ಮಾಡಿದ್ದೇವೆ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ಈ ಬಣ್ಣಗಳನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಮಾತ್ರವಲ್ಲ, gradient background ಆಗಿಯೂ ಸೇರಿಸಿ ಬಳಸಬಹುದು.

SwiftUI ನಲ್ಲಿ, `LinearGradient` ಬಳಸಿ linear gradient ರಚಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ಈ code ಎಡದಿಂದ ಬಲಕ್ಕೆ ಹೋಗುವ gradient background ಅನ್ನು ರಚಿಸುತ್ತದೆ. ಬಣ್ಣವು `Color.animalBlue` ನಿಂದ ನಿಧಾನವಾಗಿ `Color.animalLightBlue` ಗೆ ಬದಲಾಗುತ್ತದೆ.

ಇಲ್ಲಿ, `colors` gradient ನಲ್ಲಿ ಭಾಗವಹಿಸುವ ಬಣ್ಣಗಳನ್ನು set ಮಾಡಲು ಬಳಸಲಾಗುತ್ತದೆ. `startPoint` ಮತ್ತು `endPoint` gradient direction ಅನ್ನು control ಮಾಡಲು ಬಳಸಲಾಗುತ್ತದೆ.

### Gradient effect ಪರೀಕ್ಷಿಸುವುದು

ನಾವು ಸರಳವಾದ Text ಬಳಸಿ gradient background ಅನ್ನು ಪರೀಕ್ಷಿಸಬಹುದು.

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

ಪ್ರದರ್ಶನ ಪರಿಣಾಮ:

![color](../../../Resource/031_color3.png)

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, `Text` ನ background ಇನ್ನು ಒಂದೇ ಬಣ್ಣವಲ್ಲ. ಅದು ಎಡದಿಂದ ಬಲಕ್ಕೆ ನಿಧಾನವಾಗಿ ಬದಲಾಗುವ gradient color ಆಗಿದೆ.

ಸಾಮಾನ್ಯ background color ಗೆ ಹೋಲಿಸಿದರೆ, gradient background ಹೆಚ್ಚು ಪದರ ಹೊಂದಿರುತ್ತದೆ ಮತ್ತು interface ನಲ್ಲಿ visual focus ರಚಿಸಲು ಇನ್ನಷ್ಟು ಸುಲಭವಾಗುತ್ತದೆ.

## Animal Encyclopedia ನಲ್ಲಿ gradient background ಬಳಸುವುದು

ಈಗ, animal button ನ background color ಅನ್ನು:

```swift
.background(Color.animalBlue)
```

gradient background ಆಗಿ ಬದಲಾಯಿಸಬಹುದು:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

ಪೂರ್ಣ code ಹೀಗಿದೆ:

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

ಪ್ರದರ್ಶನ ಪರಿಣಾಮ:

![color](../../../Resource/031_color4.png)

ಈಗ, animal button ಕೇವಲ single background color ಹೊಂದಿಲ್ಲ. ಅದು ಎಡದಿಂದ ಬಲಕ್ಕೆ ಹೋಗುವ gradient effect ಹೊಂದಿದೆ.

single-color background ಗೆ ಹೋಲಿಸಿದರೆ, gradient background interface ಅನ್ನು ಹೆಚ್ಚು ಪದರ ಹೊಂದಿದಂತೆ ಕಾಣಿಸುತ್ತದೆ ಮತ್ತು ನಿಜವಾದ App ಗಳ visual design ಗೆ ಇನ್ನಷ್ಟು ಸಮೀಪವಾಗಿರುತ್ತದೆ.

## Single-color background ಮತ್ತು gradient background ನಡುವಿನ ವ್ಯತ್ಯಾಸ

Single-color background ಒಂದೇ ಬಣ್ಣವನ್ನು ಬಳಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
.background(Color.animalBlue)
```

ಈ ಬರವಣಿಗೆ ಸರಳ ಮತ್ತು ಸ್ಪಷ್ಟ. ಬಹುತೇಕ basic interfaces ಗೆ ಇದು ಸೂಕ್ತ.

Gradient background ಹಲವು ಬಣ್ಣಗಳನ್ನು ಬಳಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

ಈ ಬರವಣಿಗೆ interface ಗೆ ಹೆಚ್ಚು ಪದರ ನೀಡಬಹುದು. ಆದರೆ visual complexity ಕೂಡ ಹೆಚ್ಚಾಗಲು ಸಾಧ್ಯ.

ಆದ್ದರಿಂದ, ನಿಜವಾದ development ನಲ್ಲಿ ಇದನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

Single-color background ಸಾಮಾನ್ಯ text, ಸಾಮಾನ್ಯ button, ಸಾಮಾನ್ಯ card ಮತ್ತು ಸಾಮಾನ್ಯ page background ಗೆ ಸೂಕ್ತ.

Gradient background key buttons, top areas, cover cards, feature entrances ಮುಂತಾದ emphasize ಮಾಡಬೇಕಾದ ಸ್ಥಳಗಳಿಗೆ ಸೂಕ್ತ.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, SwiftUI ನಲ್ಲಿ ಕಸ್ಟಮ್ ಬಣ್ಣಗಳನ್ನು ಹೇಗೆ ಬಳಸಬೇಕು ಎಂಬುದನ್ನು ಕಲಿತೆವು.

ಮೊದಲು, ನಾವು Hex ಬಣ್ಣವನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡೆವು.

ಉದಾಹರಣೆಗೆ:

```text
#2c54c2
```

ಇದು ಒಂದು ನಿರ್ದಿಷ್ಟ ಬಣ್ಣವನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ನಂತರ, ನಾವು `extension Color` ಬಳಸಿ `Color` type ಅನ್ನು extend ಮಾಡಿದೆವು.

ಇದರಿಂದ SwiftUI ಕೆಳಗಿನ ರೀತಿಯಲ್ಲಿ ಬಣ್ಣವನ್ನು ರಚಿಸಬಹುದು:

```swift
Color(hex: "#2c54c2")
```

ಮುಂದೆ, ನಾವು `static` ಬಳಸಿ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸುವ ಬಣ್ಣಗಳನ್ನು ವ್ಯವಸ್ಥೆ ಮಾಡಿದೆವು:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

ಹೀಗಾಗಿ, ಇತರ views ನಲ್ಲಿ ನೇರವಾಗಿ ಹೀಗೆ ಬಳಸಬಹುದು:

```swift
Color.animalBlue
```

ಪ್ರತಿ ಬಾರಿ Hex string ಬರೆಯುವುದಕ್ಕೆ ಹೋಲಿಸಿದರೆ, ಈ ವಿಧಾನ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗಿದ್ದು, ನಂತರ ಬಣ್ಣವನ್ನು unified ಆಗಿ ಬದಲಾಯಿಸಲು ಹೆಚ್ಚು ಅನುಕೂಲಕರ.

ಕೊನೆಯಲ್ಲಿ, ನಾವು `LinearGradient` ಕಲಿತೆವು ಮತ್ತು ಕಸ್ಟಮ್ ಬಣ್ಣಗಳನ್ನು gradient background ಆಗಿ ಸೇರಿಸಿದೆವು:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ಈ ಪಾಠದ ಮೂಲಕ, “ಕಸ್ಟಮ್ ಬಣ್ಣ ರಚಿಸುವುದು” ಇಂದ “ನಿಜವಾದ interface ನಲ್ಲಿ ಬಣ್ಣ ಬಳಸುವುದು” ವರೆಗೆ ಇರುವ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

ಮುಂದೆ, ಒಂದು ಬಣ್ಣವನ್ನು ಹಲವು ಕಡೆ ಮರುಮರು ಬಳಸಬೇಕಾದರೆ, ಅದನ್ನು ಮೊದಲು `Color` extension ನಲ್ಲಿ ವ್ಯವಸ್ಥೆ ಮಾಡುವುದನ್ನು ಪರಿಗಣಿಸಬಹುದು.

ಹೀಗೆ ಮಾಡಿದರೆ code ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ ಮತ್ತು interface style ಅನ್ನು ಏಕೀಕರಿಸುವುದೂ ಸುಲಭವಾಗುತ್ತದೆ.
