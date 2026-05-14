# ಕಸ್ಟಮ್ View

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು SwiftUI ಯ ಅತ್ಯಂತ ಪ್ರಮುಖ ಬರವಣಿಗೆ ವಿಧಾನವನ್ನು ಕಲಿಯುತ್ತೇವೆ: **ಕಸ್ಟಮ್ View**.

ಕಸ್ಟಮ್ View ಮರುಮರು ಬರುವ View ಕೋಡ್‌ನ ಒಂದು ಭಾಗವನ್ನು ಮುಚ್ಚಿ, ಅದನ್ನು ಮತ್ತೆ ಮತ್ತೆ ಬಳಸಬಹುದಾದ View ಆಗಿ ಮಾಡಬಹುದು.

ನಿಜವಾದ App ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ನಾವು ಹಲವಾರು ಬಾರಿ ಇಂತಹ ಪರಿಸ್ಥಿತಿಯನ್ನು ಎದುರಿಸುತ್ತೇವೆ: ಅನೇಕ ಇಂಟರ್‌ಫೇಸ್‌ಗಳ ರಚನೆ ಒಂದೇ ಆಗಿರುತ್ತದೆ, ಆದರೆ ತೋರಿಸುವ ವಿಷಯ ಮಾತ್ರ ಬೇರೆ ಆಗಿರುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, ಫೋರಂ ವೆಬ್‌ಸೈಟ್‌ನ ಪೋಸ್ಟ್ ಪಟ್ಟಿಯಲ್ಲಿ, ಪ್ರತಿಯೊಂದು ಪೋಸ್ಟ್‌ಗೆ ಶೀರ್ಷಿಕೆ, ಚಿತ್ರ, ಲೈಕ್‌ಗಳ ಸಂಖ್ಯೆ ಇತ್ಯಾದಿ ಮಾಹಿತಿ ಇರಬಹುದು.

![Reddit](../../../Resource/028_view1.png)

ಶಾಪಿಂಗ್ ವೆಬ್‌ಸೈಟ್‌ನ ಉತ್ಪನ್ನ ಪಟ್ಟಿಯಲ್ಲಿ, ಪ್ರತಿಯೊಂದು ಉತ್ಪನ್ನಕ್ಕೆ ಚಿತ್ರ, ಹೆಸರು ಮತ್ತು ಬೆಲೆ ಇತ್ಯಾದಿ ಮಾಹಿತಿ ಇರಬಹುದು.

![Amazon](../../../Resource/028_view2.png)

ಈ ವಿಷಯಗಳ ರಚನೆ ಸಮಾನವಾಗಿದೆ; ವ್ಯತ್ಯಾಸವು ತೋರಿಸಲಾಗುವ ಡೇಟಾದಲ್ಲಷ್ಟೇ ಇರುತ್ತದೆ.

ಪ್ರತಿಯೊಂದು ಐಟಂಗೆ ಕೈಯಾರೆ ಕೋಡ್ ಬರೆದರೆ, ಕೋಡ್ ತುಂಬಾ ದೀರ್ಘವಾಗುತ್ತದೆ, ಮತ್ತು ನಂತರ ಬದಲಾವಣೆ ಮಾಡಲು ಸಹ ಅನುಕೂಲಕರವಾಗಿರುವುದಿಲ್ಲ.

ಆದ್ದರಿಂದ, ನಾವು ಒಂದೇ ರೀತಿಯ ರಚನೆಯನ್ನು ಕಸ್ಟಮ್ View ಆಗಿ ಮುಚ್ಚಬಹುದು, ಮತ್ತು ಬೇರೆ ಬೇರೆ ವಿಷಯವನ್ನು ಪ್ಯಾರಾಮೀಟರ್‌ಗಳಾಗಿ ಒಳಗೆ ಕಳುಹಿಸಬಹುದು.

ಈ ರೀತಿಯಲ್ಲಿ, ಅದೇ View ಬೇರೆ ಬೇರೆ ವಿಷಯವನ್ನು ತೋರಿಸಬಹುದು.

## ಅಗತ್ಯದ ಸಂದರ್ಭ

ಉದಾಹರಣೆಗೆ, ಈಗ ನಾವು ಒಂದು ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪಟ್ಟಿಯನ್ನು ನಿರ್ಮಿಸಬೇಕು.

ತೋರಿಸುವ ಫಲಿತಾಂಶ:

![view](../../../Resource/028_view.png)

ಈ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪಟ್ಟಿಯಲ್ಲಿ ಮೂರು ವಿಭಿನ್ನ ಸೆಟ್ಟಿಂಗ್ ಐಟಂಗಳು ಇವೆ: `ಸೆಟ್ಟಿಂಗ್‌ಗಳು`, `ಫೋಲ್ಡರ್`, `ಸಂಗೀತ`.

ಅವುಗಳ ಐಕಾನ್‌ಗಳು, ಬಣ್ಣಗಳು ಮತ್ತು ಶೀರ್ಷಿಕೆಗಳು ಬೇರೆ ಆದರೂ, ಒಟ್ಟು ರಚನೆ ಒಂದೇ ಆಗಿದೆ:

- ಎಡಭಾಗದ ಐಕಾನ್
- ಐಕಾನ್ ಹಿನ್ನೆಲೆ ಬಣ್ಣ
- ಮಧ್ಯದ ಶೀರ್ಷಿಕೆ
- ಬಲಭಾಗದ ಬಾಣ

ಕಸ್ಟಮ್ View ಬಳಸದೆ ಇದ್ದರೆ, ನಾವು ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("ಸೆಟ್ಟಿಂಗ್‌ಗಳು")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("ಫೋಲ್ಡರ್")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("ಸಂಗೀತ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

ಈ ಕೋಡ್ ಸಾಮಾನ್ಯವಾಗಿ ತೋರಿಸಬಹುದು, ಆದರೆ ಸಮಸ್ಯೆಯೂ ತುಂಬಾ ಸ್ಪಷ್ಟವಾಗಿದೆ: ಮೂರು ಸೆಟ್ಟಿಂಗ್ ಐಟಂಗಳ ಕೋಡ್ ಬಹುತೇಕ ಸಂಪೂರ್ಣವಾಗಿ ಒಂದೇ ಆಗಿದೆ.

ಬೇರೆ ಇರುವುದೆಂದರೆ ಐಕಾನ್, ಬಣ್ಣ ಮತ್ತು ಶೀರ್ಷಿಕೆ ಮಾತ್ರ:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("ಸೆಟ್ಟಿಂಗ್‌ಗಳು")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("ಫೋಲ್ಡರ್")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("ಸಂಗೀತ")
```

ಅಂದರೆ, ಪ್ರತಿಯೊಂದು ಸೆಟ್ಟಿಂಗ್ ಐಟಂನ ರಚನೆ ಸ್ಥಿರವಾಗಿದೆ; ಬೇರೆ ಇರುವುದೆಂದರೆ ಐಕಾನ್, ಬಣ್ಣ ಮತ್ತು ಶೀರ್ಷಿಕೆ ಮಾತ್ರ.

ಈ ಪರಿಸ್ಥಿತಿ ಕಸ್ಟಮ್ View ಬಳಸಲು ತುಂಬಾ ಸೂಕ್ತವಾಗಿದೆ.

### ನೆರಳು shadow

ಇಲ್ಲಿ ನಾವು ಹೊಸ modifier `.shadow(radius:)` ಅನ್ನು ಬಳಸಿದ್ದೇವೆ:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View ಗೆ ನೆರಳನ್ನು ಸೇರಿಸಬಹುದು.

`radius` ನೆರಳಿನ blur radius ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ. ಮೌಲ್ಯ ಹೆಚ್ಚಾದಂತೆ, ಸಾಮಾನ್ಯವಾಗಿ ನೆರಳಿನ ಹರಡುವ ವ್ಯಾಪ್ತಿ ಹೆಚ್ಚಾಗುತ್ತದೆ, ಮತ್ತು ಅದು ಇನ್ನಷ್ಟು ಮೃದುವಾಗಿ ಕಾಣುತ್ತದೆ.

ಇಲ್ಲಿ ಅದನ್ನು `1` ಎಂದು ಹೊಂದಿಸಲಾಗಿದೆ, ಅಂದರೆ ತುಂಬಾ ಸೌಮ್ಯವಾದ ನೆರಳು ಪರಿಣಾಮವನ್ನು ಮಾತ್ರ ಸೇರಿಸಲಾಗಿದೆ.

## ಸೆಟ್ಟಿಂಗ್ ಐಟಂ View ಅನ್ನು ಮುಚ್ಚುವುದು

ಮುಂದೆ, ನಾವು ಪ್ರತಿಯೊಂದು ಸೆಟ್ಟಿಂಗ್ ಐಟಂ ಅನ್ನು ಹೊಸ View ಆಗಿ ಮುಚ್ಚುತ್ತೇವೆ.

`SettingItemView` ಅನ್ನು ರಚಿಸಬಹುದು:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ಈ View ನಲ್ಲಿ, ನಾವು ಮೂರು properties ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿದ್ದೇವೆ:

```swift
let icon: String
let color: Color
let title: String
```

ಇವುಗಳಲ್ಲಿ:

- `icon` ಐಕಾನ್ ಹೆಸರನ್ನು ಸೂಚಿಸುತ್ತದೆ
- `color` ಐಕಾನ್ ಹಿನ್ನೆಲೆ ಬಣ್ಣವನ್ನು ಸೂಚಿಸುತ್ತದೆ
- `title` ಸೆಟ್ಟಿಂಗ್ ಐಟಂ ಶೀರ್ಷಿಕೆಯನ್ನು ಸೂಚಿಸುತ್ತದೆ

ಈ ಮೂರು ವಿಷಯಗಳು ಬೇರೆ ಬೇರೆ ಸೆಟ್ಟಿಂಗ್ ಐಟಂಗಳಲ್ಲಿ ಬೇರೆ ಆಗಿರುವುದರಿಂದ, ನಾವು ಅವನ್ನು ಹೊರಗಿನಿಂದ ಕಳುಹಿಸಬಹುದಾದ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳಾಗಿ ಮಾಡುತ್ತೇವೆ.

## ಕಸ್ಟಮ್ View ಬಳಸುವುದು

`SettingItemView` ಇದ್ದ ನಂತರ, ನಮಗೆ ಇನ್ನೂ ದೊಡ್ಡ `HStack` ಕೋಡ್ ಅನ್ನು ಮರುಮರು ಬರೆಯಬೇಕಾಗುವುದಿಲ್ಲ.

ಈಗ ಹೀಗೆ ಬಳಸಬಹುದು:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ಸೆಟ್ಟಿಂಗ್‌ಗಳು")
```

ಈ ಕೋಡ್ ಸಾಲು ಒಂದು ಸೆಟ್ಟಿಂಗ್ ಐಟಂ View ಅನ್ನು ರಚಿಸಿ, ಮೂರು ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಕಳುಹಿಸುತ್ತದೆ:

```swift
icon: "gear"
color: Color.blue
title: "ಸೆಟ್ಟಿಂಗ್‌ಗಳು"
```

ಕಳುಹಿಸಿದ ನಂತರ, `SettingItemView` ಒಳಗಿನ properties ಸಂಬಂಧಿತ ಮೌಲ್ಯಗಳನ್ನು ಪಡೆಯುತ್ತವೆ:

- `icon` ನ ಮೌಲ್ಯ `gear`
- `color` ನ ಮೌಲ್ಯ `Color.blue`
- `title` ನ ಮೌಲ್ಯ `"ಸೆಟ್ಟಿಂಗ್‌ಗಳು"`

ಆದ್ದರಿಂದ, View ಒಳಗಿನ `Image(systemName: icon)` ಗಿಯರ್ ಐಕಾನ್ ಅನ್ನು ತೋರಿಸುತ್ತದೆ, `.background(color)` ನೀಲಿ ಹಿನ್ನೆಲೆಯನ್ನು ಬಳಸುತ್ತದೆ, ಮತ್ತು `Text(title)` `ಸೆಟ್ಟಿಂಗ್‌ಗಳು` ಅನ್ನು ತೋರಿಸುತ್ತದೆ.

ಸಂಪೂರ್ಣ ಕೋಡ್:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "ಸೆಟ್ಟಿಂಗ್‌ಗಳು")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "ಫೋಲ್ಡರ್")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "ಸಂಗೀತ")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ತೋರಿಸುವ ಫಲಿತಾಂಶ:

![view](../../../Resource/028_view.png)

ಮುಚ್ಚಿದ ನಂತರ ತೋರಿಸುವ ಫಲಿತಾಂಶ ಹಿಂದಿನಂತೆಯೇ ಇದೆ, ಆದರೆ ಕೋಡ್ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗಿದೆ ಎಂದು ನೋಡಬಹುದು.

ಹಿಂದೆ ಪ್ರತಿಯೊಂದು ಸೆಟ್ಟಿಂಗ್ ಐಟಂಗೆ ಸಂಪೂರ್ಣ `HStack` ಭಾಗವನ್ನು ಬರೆಯಬೇಕಾಗುತ್ತಿತ್ತು, ಈಗ ಒಂದು ಕೋಡ್ ಸಾಲು ಮಾತ್ರ ಸಾಕು:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ಸೆಟ್ಟಿಂಗ್‌ಗಳು")
```

ಇದೇ ಕಸ್ಟಮ್ View ನ ಪಾತ್ರ: **ಮರುಮರು ಬರುವ View ರಚನೆಯನ್ನು ಮುಚ್ಚಿ, ಬೇರೆ ಇರುವ ವಿಷಯವನ್ನು ಮಾತ್ರ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳಾಗಿ ಕಳುಹಿಸುವುದು.**

## ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಏಕೆ ಕಳುಹಿಸಬಹುದು

ಮುಂದೆ, ಕಸ್ಟಮ್ View ಏಕೆ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಸ್ವೀಕರಿಸಬಲ್ಲದು ಎಂಬುದನ್ನು ಸರಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳೋಣ.

SwiftUI ನಲ್ಲಿ, View ಮೂಲತಃ ಒಂದು structure ಆಗಿದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    var body: some View {
        Text("ನಮಸ್ಕಾರ, ಲೋಕವೇ!")
    }
}
```

ಇಲ್ಲಿ `ContentView` ಒಂದು structure ಆಗಿದೆ.

ನಾವು ಹೀಗೆ ಬರೆಯುವಾಗ:

```swift
ContentView()
```

ವಾಸ್ತವವಾಗಿ ನಾವು ಒಂದು `ContentView` View ಅನ್ನು ರಚಿಸುತ್ತಿದ್ದೇವೆ.

ಹಿಂದಿನ `()` ಅದರ initialization method ಅನ್ನು ಕರೆಮಾಡುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ; ಇದನ್ನು ಈ View ಅನ್ನು ರಚಿಸುವುದು ಎಂದೂ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

ಈ `ContentView` ನಲ್ಲಿ ಹೊರಗಿನಿಂದ ಕಳುಹಿಸಬೇಕಾದ properties ಇಲ್ಲದ ಕಾರಣ, ನೇರವಾಗಿ ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
ContentView()
```

ಆದರೆ View ಒಳಗೆ ಮೌಲ್ಯ ನೀಡದ property ಇದ್ದರೆ, View ರಚಿಸುವಾಗ ಸಂಬಂಧಿತ ಮೌಲ್ಯವನ್ನು ಕಳುಹಿಸಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ಹೆಸರು: \(name)")
    }
}
```

ಇಲ್ಲಿ `name` ಒಂದು property ಆಗಿದೆ, ಮತ್ತು ಇದಕ್ಕೆ default value ಇಲ್ಲ.

ಆದ್ದರಿಂದ `ContentView` ಅನ್ನು ರಚಿಸುವಾಗ, `name` ಗೆ ನಿರ್ದಿಷ್ಟ ಮೌಲ್ಯವನ್ನು ನೀಡಲೇಬೇಕು:

```swift
ContentView(name: "Fang Junyu")
```

ಹೀಗೆ ಮಾಡಿದರೆ, View ಒಳಗೆ ಈ ಮೌಲ್ಯವನ್ನು ಬಳಸಬಹುದು:

```swift
Text("ಹೆಸರು: \(name)")
```

ಇದೇ `SettingItemView` ಅನ್ನು ರಚಿಸುವಾಗ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಕಳುಹಿಸಬೇಕಾದ ಕಾರಣವೂ ಆಗಿದೆ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ಸೆಟ್ಟಿಂಗ್‌ಗಳು")
```

ಏಕೆಂದರೆ `SettingItemView` ನಲ್ಲಿ default value ಇಲ್ಲದ ಮೂರು properties ಇವೆ:

```swift
let icon: String
let color: Color
let title: String
```

ಆದ್ದರಿಂದ ಈ View ಅನ್ನು ರಚಿಸುವಾಗ ಅವನ್ನು ಒಳಗೆ ಕಳುಹಿಸಬೇಕು. ಕಳುಹಿಸಿದ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು Swift View ಒಳಗಿನ properties ಗೆ ಮೌಲ್ಯ ನೀಡಲು ಬಳಸುತ್ತದೆ.

## Initialization method

ಮುಂದೆ, initialization method ಅನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳೋಣ.

### Default initialization method

ನಾವು ಸಾಮಾನ್ಯ View ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿದಾಗ:

```swift
struct ContentView: View {
    var body: some View {
        Text("ನಮಸ್ಕಾರ, ಲೋಕವೇ!")
    }
}
```

ಈ ಕೋಡ್‌ನಲ್ಲಿ, ನಾವು initialization method ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯಲಿಲ್ಲ.

ಆದರೆ ಈ View ಅನ್ನು ಬಳಸುವಾಗ, ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
ContentView()
```

ಇಲ್ಲಿ `()` ವಾಸ್ತವವಾಗಿ `ContentView` ಅನ್ನು ರಚಿಸುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ; ಇದನ್ನು ಅದರ initialization method ಅನ್ನು ಕರೆಮಾಡುವುದು ಎಂದೂ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

### initialization method ಕಾಣಿಸದಿದ್ದರೂ ಅದನ್ನು ಏಕೆ ಕರೆಮಾಡಬಹುದು?

ಏಕೆಂದರೆ Swift compiler ನಮ್ಮಿಗಾಗಿ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಒಂದು initialization method ಅನ್ನು ರಚಿಸುತ್ತದೆ.

ಗಮನಿಸಬೇಕಾದುದು: **ಈ initialization method ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಲಾಗುತ್ತದೆ, ಮತ್ತು ಸಾಮಾನ್ಯವಾಗಿ ನಾವು ಅದನ್ನು ಕೋಡ್‌ನಲ್ಲಿ ನೇರವಾಗಿ ನೋಡುವುದಿಲ್ಲ.**

ಅಂದರೆ, ನಾವು `struct` ಒಳಗೆ ಕೈಯಾರೆ ಹೀಗೆ ಬರೆಯದಿದ್ದರೂ:

```swift
init() {

}
```

Swift compiler ಹಿಂದೆ ನಮ್ಮಿಗಾಗಿ ಇಂತಹ initialization method ಅನ್ನು ರಚಿಸುತ್ತದೆ:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("ನಮಸ್ಕಾರ, ಲೋಕವೇ!")
    }
}
```

ಅದಕ್ಕಾಗಿ ನಾವು ನೇರವಾಗಿ ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
ContentView()
```

ಆದ್ದರಿಂದ, ನಿಜವಾದ ಕೋಡ್‌ನಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ initialization method ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯಬೇಕಾಗುವುದಿಲ್ಲ.

ಒಂದು ವಿಷಯ ಮಾತ್ರ ಅರ್ಥಮಾಡಿಕೊಂಡರೆ ಸಾಕು: **SwiftUI View ಅನ್ನು ರಚಿಸುವಾಗ, ಆ View ನ initialization method ಅನ್ನು ಕರೆಮಾಡಲಾಗುತ್ತದೆ. ನಾವು initialization method ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯದಿದ್ದರೂ, Swift ಅದನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಬಹುದು.**

### ಪ್ಯಾರಾಮೀಟರ್‌ಗಳಿರುವ initialization method

View ಒಳಗೆ default value ಇಲ್ಲದ property ಇದ್ದರೆ, ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ಹೆಸರು: \(name)")
    }
}
```

Swift compiler property ಆಧರಿಸಿ ಪ್ಯಾರಾಮೀಟರ್ ಇರುವ initialization method ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸುತ್ತದೆ.

ಇದನ್ನು ಸರಳವಾಗಿ ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

```swift
init(name: String) {
    self.name = name
}
```

ಇಲ್ಲಿ:

```swift
init(name: String)
```

ಅರ್ಥವೆಂದರೆ `ContentView` ಅನ್ನು ರಚಿಸುವಾಗ `String` ಪ್ರಕಾರದ `name` ಪ್ಯಾರಾಮೀಟರ್ ಅನ್ನು ಕಳುಹಿಸಬೇಕು.

ನಾವು ಹೀಗೆ ಬರೆಯುವಾಗ:

```swift
ContentView(name: "Fang Junyu")
```

ಅರ್ಥವೆಂದರೆ: `"Fang Junyu"` ಅನ್ನು initialization method ಗೆ ಪ್ಯಾರಾಮೀಟರ್ ಆಗಿ ಕಳುಹಿಸುವುದು.

ನಂತರ initialization method ಒಳಗೆ ಇದು ಕಾರ್ಯಗತವಾಗುತ್ತದೆ:

```swift
self.name = name
```

ಈ ಕೋಡ್ ಸಾಲಿನ ಅರ್ಥ: ಹೊರಗಿನಿಂದ ಕಳುಹಿಸಿದ `name` ಅನ್ನು ಪ್ರಸ್ತುತ View ನ ಸ್ವಂತ `name` property ಗೆ ನೀಡುವುದು.

ಸರಳವಾಗಿ ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ಹೆಸರು: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

ಹೀಗೆ View ಒಳಗೆ ಕಳುಹಿಸಿದ ಮೌಲ್ಯವನ್ನು ಬಳಸಬಹುದು.

ಇದೇ ಪ್ಯಾರಾಮೀಟರ್ ಇರುವ View ನ initialization ಪ್ರಕ್ರಿಯೆ: **View ಒಳಗಿನ property ಗೆ default value ಇಲ್ಲದಿದ್ದರೆ, View ರಚಿಸುವಾಗ ಸಂಬಂಧಿತ ಪ್ಯಾರಾಮೀಟರ್ ಅನ್ನು ಕಳುಹಿಸಬೇಕು, ಹಾಗಾಗಿ initialization method property ಗೆ ಮೌಲ್ಯ ನೀಡುವುದನ್ನು ಪೂರ್ಣಗೊಳಿಸುತ್ತದೆ.**

## property ಗೆ default value ಇರುವ ಸಂದರ್ಭ

property ಗೆ ಈಗಾಗಲೇ default value ಇದ್ದರೆ, View ರಚಿಸುವಾಗ ಪ್ಯಾರಾಮೀಟರ್ ಕಳುಹಿಸದೆ ಇರಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ಹೆಸರು: \(name)")
    }
}
```

ಇಲ್ಲಿ `name` ಗೆ ಈಗಾಗಲೇ default value ಇದೆ:

```swift
"Fang Junyu"
```

ಆದ್ದರಿಂದ `ContentView` ಅನ್ನು ರಚಿಸುವಾಗ, ನೇರವಾಗಿ ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
ContentView()
```

ಈ ಸಮಯದಲ್ಲಿ `name` default value ಅನ್ನು ಬಳಸುತ್ತದೆ, ಮತ್ತು ಇಂಟರ್‌ಫೇಸ್ ತೋರಿಸುತ್ತದೆ:

```swift
ಹೆಸರು: Fang Junyu
```

ಖಂಡಿತವಾಗಿ, View ರಚಿಸುವಾಗ ಹೊಸ ಮೌಲ್ಯವನ್ನೂ ಕಳುಹಿಸಬಹುದು:

```swift
ContentView(name: "Sam")
```

ಈ ಸಮಯದಲ್ಲಿ, View default value ಬದಲಿಗೆ ಹೊರಗಿನಿಂದ ಕಳುಹಿಸಿದ `"Sam"` ಅನ್ನು ಬಳಸುತ್ತದೆ, ಮತ್ತು ಇಂಟರ್‌ಫೇಸ್ ತೋರಿಸುತ್ತದೆ:

```swift
ಹೆಸರು: Sam
```

ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸುಲಭವಾಗಲು, Swift compiler ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸುವ initialization method ಅನ್ನು ಸರಳವಾಗಿ ಹೀಗೆ ನೋಡಬಹುದು:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

ಇಲ್ಲಿ `name: String = "Fang Junyu"` ಎಂದರೆ: View ರಚಿಸುವಾಗ `name` ಕಳುಹಿಸದಿದ್ದರೆ default value `"Fang Junyu"` ಬಳಸಲಾಗುತ್ತದೆ; View ರಚಿಸುವಾಗ ಹೊಸ `name` ಕಳುಹಿಸಿದರೆ, ಕಳುಹಿಸಿದ ಮೌಲ್ಯವನ್ನು ಬಳಸಲಾಗುತ್ತದೆ.

ಅಂದರೆ: **ಹೊರಗಿನಿಂದ ಪ್ಯಾರಾಮೀಟರ್ ಕಳುಹಿಸದಿದ್ದರೆ property ಯ default value ಬಳಸಲಾಗುತ್ತದೆ; ಹೊರಗಿನಿಂದ ಪ್ಯಾರಾಮೀಟರ್ ಕಳುಹಿಸಿದರೆ ಕಳುಹಿಸಿದ ಮೌಲ್ಯ ಬಳಸಲಾಗುತ್ತದೆ.**

## ಮತ್ತೆ SettingItemView ಗೆ

ಈಗ ನಾವು ಮತ್ತೆ SettingItemView ಅನ್ನು ನೋಡೋಣ:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ಈ View ನ ರಚನೆ ಸ್ಥಿರವಾಗಿದೆ.

ಸ್ಥಿರ ಭಾಗಗಳಲ್ಲಿ ಸೇರಿರುವವು:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

ವಿಭಿನ್ನ ಭಾಗಗಳಲ್ಲಿ ಸೇರಿರುವವು:

```swift
icon
color
title
```

ಆದ್ದರಿಂದ, ನಾವು ವಿಭಿನ್ನ ವಿಷಯವನ್ನು properties ಆಗಿ ಮಾಡಿ, View ರಚಿಸುವಾಗ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳಾಗಿ ಕಳುಹಿಸುತ್ತೇವೆ.

ವಿವಿಧ ಸೆಟ್ಟಿಂಗ್ ಐಟಂಗಳನ್ನು ರಚಿಸುವಾಗ, ಬೇರೆ ಬೇರೆ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಮಾತ್ರ ಕಳುಹಿಸಬೇಕು:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ಸೆಟ್ಟಿಂಗ್‌ಗಳು")
SettingItemView(icon: "folder", color: Color.brown, title: "ಫೋಲ್ಡರ್")
SettingItemView(icon: "music.note", color: Color.purple, title: "ಸಂಗೀತ")
```

ಹೀಗೆ, ಅದೇ `SettingItemView` ಮೂರು ವಿಭಿನ್ನ ಸೆಟ್ಟಿಂಗ್ ಐಟಂಗಳನ್ನು ತೋರಿಸಬಹುದು.

ಇದು ಕಸ್ಟಮ್ View ಬಳಸುವ ಅತ್ಯಂತ ಸಾಮಾನ್ಯ ವಿಧಾನ.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಕಸ್ಟಮ್ View ಅನ್ನು ಕಲಿತೇವೆ.

ಕಸ್ಟಮ್ View ನ ಮುಖ್ಯ ಪಾತ್ರ: **ಮರುಮರು ಬರುವ View ಕೋಡ್ ಅನ್ನು ಮುಚ್ಚಿ, ಅದನ್ನು ಮರುಬಳಕೆ ಮಾಡಬಹುದಾಗಿಸುವುದು.**

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, ಮೂರು ಸೆಟ್ಟಿಂಗ್ ಐಟಂಗಳ ರಚನೆ ಒಂದೇ ಆಗಿದೆ, ಐಕಾನ್, ಬಣ್ಣ ಮತ್ತು ಶೀರ್ಷಿಕೆ ಮಾತ್ರ ಬೇರೆ.

ಆದ್ದರಿಂದ ನಾವು `SettingItemView` ಅನ್ನು ರಚಿಸಿದ್ದೇವೆ:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ನಂತರ, ಈ View ಅನ್ನು ಬಳಸುವಾಗ ವಿಭಿನ್ನ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಕಳುಹಿಸುತ್ತೇವೆ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ಸೆಟ್ಟಿಂಗ್‌ಗಳು")
```

ಇಲ್ಲಿನ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು `SettingItemView` ಒಳಗೆ ಹೋಗುತ್ತವೆ.

ಈ ರೀತಿಯಲ್ಲಿ, ಕಡಿಮೆ ಕೋಡ್ ಬಳಸಿ, ರಚನೆ ಒಂದೇ ಆದರೆ ವಿಷಯ ಬೇರೆ ಇರುವ Views ಅನ್ನು ರಚಿಸಬಹುದು.

ಇದು SwiftUI ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಬಹಳ ಸಾಮಾನ್ಯವಾದ ಬರವಣಿಗೆ ವಿಧಾನವೂ ಆಗಿದೆ.
