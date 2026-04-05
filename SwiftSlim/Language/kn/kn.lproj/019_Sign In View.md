# ಸೈನ್ ಇನ್ ವ್ಯೂ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ತುಂಬಾ ಉಪಯುಕ್ತವಾದ ಒಂದು ದೃಶ್ಯವನ್ನು ಕಲಿಯುತ್ತೇವೆ, ಅಂದರೆ ಸೈನ್ ಇನ್ ವ್ಯೂ.

ವೆಬ್‌ಸೈಟ್ ಆಗಿರಲಿ ಅಥವಾ ಆಪ್ ಆಗಿರಲಿ, ಬಳಸುವ ವೇಳೆ ಅನೇಕ ಸಂದರ್ಭಗಳಲ್ಲಿ ಬಳಕೆದಾರರು ತಮ್ಮ ಖಾತೆಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, GitHub ನ ಸೈನ್ ಇನ್ ಪುಟ:

![WordPress](../../Resource/019_github.png)

ಈ ಪಾಠದಲ್ಲಿ, ಬಳಕೆದಾರರು ಖಾತೆ ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಕೈಯಾರೆ ನಮೂದಿಸಬಹುದಾದ, ಮತ್ತು ನಮೂದಿಸಿದ ವಿಷಯದಲ್ಲಿ ಏನಾದರೂ ಸಮಸ್ಯೆಯಿದೆಯೇ ಎಂದು ನಾವು ಪರಿಶೀಲಿಸಬಹುದಾದ ಹೋಲಿಕೆಯ ಸೈನ್ ಇನ್ ವ್ಯೂವನ್ನು ಮಾಡುತ್ತೇವೆ.

## ಮೇಲಿನ ಲೇಔಟ್

ನಾವು `ContentView` ಫೈಲ್‌ನಲ್ಲಿ ಸೈನ್ ಇನ್ ವ್ಯೂಗಾಗಿ ಕೋಡ್ ಬರೆಯುತ್ತೇವೆ.

ಮೊದಲು, ಸೈನ್ ಇನ್ ವ್ಯೂನ ಮೇಲ್ಭಾಗದ ಗುರುತು ಪ್ರದೇಶವನ್ನು ಬರೆಯೋಣ. ನೀವು ಮೊದಲು ಸೂಕ್ತವಾದ ಐಕಾನ್ ಚಿತ್ರವನ್ನು ಸಿದ್ಧಪಡಿಸಿ, ಅದನ್ನು `Assets` ಫೋಲ್ಡರ್‌ನಲ್ಲಿ ಇಡಬಹುದು.

![icon](../../Resource/019_icon1.png)

ನಂತರ, `Image` ಮತ್ತು modifiers ಬಳಸಿ ಚಿತ್ರವನ್ನು ತೋರಿಸಿ:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

ಈ modifiers‌ಗಳ ಅರ್ಥ ಹೀಗಿದೆ:

- `resizable()`: ಚಿತ್ರದ ಗಾತ್ರವನ್ನು ಬದಲಾಯಿಸಲು ಅನುಮತಿಸುತ್ತದೆ.
- `scaledToFit()`: ಚಿತ್ರದ ಮೂಲ ಅನುಪಾತವನ್ನು ಉಳಿಸಿಕೊಂಡೇ ಅದನ್ನು ಸ್ಕೇಲ್ ಮಾಡುತ್ತದೆ.
- `frame(width: 100)`: ಚಿತ್ರದ ಪ್ರದರ್ಶನ ಅಗಲವನ್ನು `100` ಎಂದು ಹೊಂದಿಸುತ್ತದೆ.

ಮುಂದೆ, `Text` ಮತ್ತು modifiers ಬಳಸಿ ಸೈನ್ ಇನ್ ಶೀರ್ಷಿಕೆಯನ್ನು ತೋರಿಸಿ:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

ಆಮೇಲೆ, `VStack` ಬಳಸಿ ಚಿತ್ರ ಮತ್ತು ಪಠ್ಯವನ್ನು ಲಂಬವಾಗಿ ಜೋಡಿಸಿ:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

ಫಲಿತಾಂಶ:

![view](../../Resource/019_view.png)

ಇಲ್ಲಿವರೆಗೆ, ನಾವು ಸೈನ್ ಇನ್ ವ್ಯೂನ ಮೇಲ್ಭಾಗದ ಶೀರ್ಷಿಕೆ ಪ್ರದೇಶವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

### ಲೇಔಟ್ ಅನ್ನು ಉತ್ತಮಗೊಳಿಸುವುದು

ಈಗ, ಚಿತ್ರ ಮತ್ತು ಶೀರ್ಷಿಕೆ ಡೀಫಾಲ್ಟ್ ಆಗಿ ಒಟ್ಟು ಲೇಔಟ್‌ನ ಮಧ್ಯ ಭಾಗದಲ್ಲಿ ಇವೆ.

ಅವು ಹೆಚ್ಚು “ಪುಟದ ಮೇಲ್ಭಾಗದ ಸೈನ್ ಇನ್ ಗುರುತು” ಹೋಲಿಕೆಯಾಗಿರಬೇಕು ಎಂದು ನಾವು ಬಯಸಿದರೆ, `Spacer()` ಬಳಸಿ ಉಳಿದ ಸ್ಥಳವನ್ನು ವಿಸ್ತರಿಸಿ ವಿಷಯವನ್ನು ಮೇಲ್ಭಾಗದ ಹತ್ತಿರ ತೋರಿಸಬಹುದು.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

ಫಲಿತಾಂಶ:

![view](../../Resource/019_view1.png)

ಆದರೆ ಈಗ `Image` ಮತ್ತು `Text` ಪರದೆಯ ಮೇಲ್ಭಾಗಕ್ಕೆ ತುಂಬ ಹತ್ತಿರವಾಗಿವೆ, ಆದ್ದರಿಂದ ಸ್ವಲ್ಪ ಗಿಡುಗಿಡುವಂತೆ ಕಾಣುತ್ತದೆ.

ಈ ಸಂದರ್ಭದಲ್ಲಿ, ಸಂಪೂರ್ಣ `VStack` ಗೆ ಮೇಲಿನ ಅಂತರವನ್ನು ಸೇರಿಸಲು `padding` ಬಳಸಬಹುದು.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

ಫಲಿತಾಂಶ:

![view](../../Resource/019_view2.png)

ಈ ರೀತಿಯಾಗಿ, ಪುಟದ ಮೇಲ್ಭಾಗದ ಶೀರ್ಷಿಕೆ ಪ್ರದೇಶವು ಇನ್ನಷ್ಟು ಸೂಕ್ತವಾಗಿ ಕಾಣುತ್ತದೆ.

## ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್

ಸೈನ್ ಇನ್ ಪುಟದಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಕೆದಾರರು ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ.

SwiftUI ನಲ್ಲಿ, ಬಳಕೆದಾರರು ನಮೂದಿಸುವ ವಿಷಯವನ್ನು ಸ್ವೀಕರಿಸಲು ನಾವು `TextField` ಬಳಸಬಹುದು.

ಆದರೆ ಗಮನಿಸಬೇಕಾದದ್ದು ಏನೆಂದರೆ: `TextField` ಸ್ವತಃ ಇನ್‌ಪುಟ್ ಡೇಟಾವನ್ನು ದೀರ್ಘಾವಧಿಗೆ ಉಳಿಸುವುದಿಲ್ಲ, ಅದು ಕೇವಲ ಒಂದು ಇನ್‌ಪುಟ್ ಕಂಟ್ರೋಲ್ ಮಾತ್ರ. ಆ ಇನ್‌ಪುಟ್ ವಿಷಯವನ್ನು ನಿಜವಾಗಿ ಉಳಿಸುವುದು ನಾವು ಅದಕ್ಕೆ bind ಮಾಡುವ variables.

ಆದ್ದರಿಂದ, ಮೊದಲು ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಉಳಿಸಲು ಎರಡು `@State` variables ಸೃಷ್ಟಿಸಬೇಕು:

```swift
@State private var user = ""
@State private var password = ""
```

`@State` variable ನ value ಬದಲಾದಾಗ, SwiftUI ಸಂಬಂಧಿತ views ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ refresh ಮಾಡುತ್ತದೆ.

ಮುಂದೆ, ಈ ಎರಡು variables ಅನ್ನು bind ಮಾಡಲು `TextField` ಬಳಸಿ:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

ಇಲ್ಲಿ `$user` ಮತ್ತು `$password` ಎಂದರೆ “binding”.

ಅಂದರೆ, ಬಳಕೆದಾರರು ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ನಲ್ಲಿ ಪಠ್ಯವನ್ನು ಟೈಪ್ ಮಾಡಿದಾಗ variable ನ value ಅದೇ ಸಮಯದಲ್ಲಿ ಬದಲಾಗುತ್ತದೆ; ಹಾಗೆಯೇ variable ಬದಲಾಗುವಾಗ, ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ನಲ್ಲಿ ಕಾಣುವ ವಿಷಯವೂ ಅದೇ ಸಮಯದಲ್ಲಿ ಬದಲಾಗುತ್ತದೆ.

ವ್ಯೂ ಮತ್ತು ಡೇಟಾ “ಒಂದಕ್ಕೊಂದು ಸಿಂಕ್ ಆಗಿ ಇರುವುದು” ಎಂಬ ಈ ಸಂಬಂಧವನ್ನು binding ಎನ್ನುತ್ತಾರೆ.

ಇಲ್ಲಿ `$` ಜೊತೆಯಾದ ಈ ಬರವಣಿಗೆಯನ್ನೇ ಬಳಸಬೇಕೆಂದು ಗಮನಿಸಿ:

```swift
$user
```

ಏಕೆಂದರೆ `TextField` ಗೆ ಸಾಮಾನ್ಯ string ಬೇಡ, ಬದಲಾಗಿ “ಎರಡೂ ದಿಕ್ಕುಗಳಲ್ಲಿ ಡೇಟಾವನ್ನು ಬದಲಾಯಿಸಬಲ್ಲ” ಒಂದು binding value ಬೇಕು.

### ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ಗಳನ್ನು ತೋರಿಸುವುದು

ಅವುಗಳನ್ನು `ContentView` ಒಳಗೆ ಇಡೋಣ:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

ತೋರಿಸುವ ಫಲಿತಾಂಶ:

![view](../../Resource/019_view3.png)

ಏಕೆಂದರೆ ಈಗ `user` ಮತ್ತು `password` ಎರಡೂ ಡೀಫಾಲ್ಟ್ ಆಗಿ ಖಾಲಿ strings ಆಗಿವೆ:

```swift
""
```

ಆದ್ದರಿಂದ ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ನಲ್ಲಿ ಮೊದಲು placeholder ಪಠ್ಯ ಕಾಣುತ್ತದೆ, ಉದಾಹರಣೆಗೆ:

```swift
input user
```

ಈ ಪಠ್ಯವು ಬಳಕೆದಾರರಿಗೆ “ಇಲ್ಲಿ ಏನು ನಮೂದಿಸಬೇಕು” ಎಂಬುದನ್ನು ಮಾತ್ರ ಹೇಳುತ್ತದೆ; ಇದು ನಿಜವಾದ ಇನ್‌ಪುಟ್ ವಿಷಯವಲ್ಲ.

### ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ಗಳನ್ನು ಉತ್ತಮಗೊಳಿಸುವುದು

ಈಗ ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ಗಳನ್ನು ಬಳಸಬಹುದು, ಆದರೆ ಡೀಫಾಲ್ಟ್ ಶೈಲಿ ಹೋಲಿಸಿದರೆ ಸರಳವಾಗಿದೆ.

ಇಂಟರ್ಫೇಸ್ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗಲು, ನಾವು ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್ ಮುಂದೆ ಒಂದು ಶೀರ್ಷಿಕೆಯನ್ನು ಸೇರಿಸಿ, ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ನ ಮೇಲೆಯೇ ಸ್ವಲ್ಪ ಸರಳ ಶೈಲಿ ಸುಧಾರಣೆ ಮಾಡಬಹುದು.

ಉದಾಹರಣೆಗೆ, ಮೊದಲು ಶೀರ್ಷಿಕೆಯನ್ನು ಸೇರಿಸಿ:

```swift
Text("Username")
    .fontWeight(.bold)
```

ಆಮೇಲೆ, `HStack` ಬಳಸಿ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್ ಅನ್ನು ಒಂದೇ ಸಾಲಿನಲ್ಲಿ ಇಡಿ:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

ಇಲ್ಲಿ ನಾವು `HStack` ಬಳಸುವುದಕ್ಕೆ ಕಾರಣ, “ಎಡಭಾಗದಲ್ಲಿ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಬಲಭಾಗದಲ್ಲಿ ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್” ತೋರಬೇಕೆಂದು ಬಯಸುವುದಾಗಿದೆ.

ಗಮನಿಸಬೇಕಾದ ಮತ್ತೊಂದು ವಿಷಯವೆಂದರೆ, `TextField` ಡೀಫಾಲ್ಟ್ ಆಗಿ ಉಳಿದಿರುವ ಖಾಲಿ ಜಾಗವನ್ನು ಹಿಡಿದುಕೊಳ್ಳುತ್ತದೆ.

![color](../../Resource/019_view6.png)

ಎರಡು ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ಗಳ ಗಾತ್ರ ಇನ್ನಷ್ಟು ಸಮವಾಗಿ ಕಾಣಲು, ನಾವು `frame(width:)` ಬಳಸಿ ಅಗಲವನ್ನು ಹೊಂದಿಸಬಹುದು, ಇದರಿಂದ ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ಗಳು ಹೆಚ್ಚು ಸರಿಯಾಗಿ ಕಾಣುತ್ತವೆ.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

ನಂತರ, ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗಿ ಕಾಣಲು border ಕೂಡ ಸೇರಿಸಿ:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ಈಗ, ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಎರಡನ್ನೂ `ContentView` ವ್ಯೂಗೆ ಸೇರಿಸೋಣ:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

ತೋರಿಸುವ ಫಲಿತಾಂಶ:

![view](../../Resource/019_view4.png)

ಇಲ್ಲಿವರೆಗೆ, ಬಳಕೆದಾರರು ಈಗ ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಬಹುದು.

## ಸೈನ್ ಇನ್ ಬಟನ್

ಮುಂದೆ, ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್‌ಗಳ ಕೆಳಗೆ ಒಂದು ಸೈನ್ ಇನ್ ಬಟನ್ ಸೇರಿಸುತ್ತೇವೆ.

```swift
Button("Sign in") {

}
```

ನಂತರ, `buttonStyle` ಬಳಸಿ ಬಟನ್‌ಗೆ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾದ system style ನೀಡಿ:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

ತೋರಿಸುವ ಫಲಿತಾಂಶ:

![view](../../Resource/019_view5.png)

ಬಟನ್ ನಿಜವಾಗಿಯೂ ಟ್ಯಾಪ್‌ಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತದೆಯೇ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಲು, ಮೊದಲು ಪರೀಕ್ಷೆಗಾಗಿ ಬಟನ್ ಒಳಗೆ `print` ಬರೆಯಬಹುದು:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

ಬಟನ್ ಮೇಲೆ ಟ್ಯಾಪ್ ಮಾಡಿದಾಗ, console ನಲ್ಲಿ ಇದು output ಆಗುತ್ತದೆ:

```swift
click Sign in
```

ಇದು ಬಟನ್ ಯಶಸ್ವಿಯಾಗಿ ಟ್ಯಾಪ್ ಕ್ರಿಯೆಗೆ ಪ್ರತಿಕ್ರಿಯಿಸಿದೆ ಎಂಬುದನ್ನು ತೋರಿಸುತ್ತದೆ.

## ಸೈನ್ ಇನ್ ಲಾಜಿಕ್

ಈಗ, ಸೈನ್ ಇನ್ ಬಟನ್‌ಗೆ ಅತ್ಯಂತ ಮೂಲಭೂತ validation logic ಅನ್ನು ಸೇರಿಸುತ್ತೇವೆ: **ಬಳಕೆದಾರರು ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿದ್ದಾರೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸುವುದು**.

ನಾವು ಕೆಳಗಿನ ಪರಿಸ್ಥಿತಿಗಳನ್ನು ಸಾಧಿಸಲು ಬಯಸುತ್ತೇವೆ:

- ಬಳಕೆದಾರರು ಏನನ್ನೂ ನಮೂದಿಸದಿದ್ದರೆ, `Empty` ಅನ್ನು output ಮಾಡಿ
- ಬಳಕೆದಾರರು ಎರಡರಲ್ಲಿ ಒಂದನ್ನು ಮಾತ್ರ ನಮೂದಿಸಿದ್ದರೆ, ಯಾವುದು ಇಲ್ಲ ಎಂದು ತಿಳಿಸಿ
- ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಎರಡೂ ನಮೂದಿಸಿದ್ದರೆ, `Success` ಅನ್ನು output ಮಾಡಿ

### ಯಾವುದೇ ಮಾಹಿತಿ ನಮೂದಿಸಲಿಲ್ಲ

`user` ಮತ್ತು `password` ಎರಡೂ ಡೀಫಾಲ್ಟ್ ಆಗಿ ಖಾಲಿ strings ಆಗಿರುವುದರಿಂದ:

```swift
@State private var user = ""
@State private var password = ""
```

ಬಳಕೆದಾರರು ಏನನ್ನೂ ನಮೂದಿಸದಿದ್ದಾಗ ಅವು ಹಾಗೆಯೇ ಖಾಲಿಯಾಗಿರುತ್ತವೆ.

Swift ನಲ್ಲಿ, `String` ನಂತಹ types ಗಳು `isEmpty` ಬಳಸಿಕೊಂಡು ವಿಷಯ ಖಾಲಿಯೇ ಎಂದು ನಿರ್ಧರಿಸಬಹುದು.

### isEmpty property

`isEmpty` ಸಾಮಾನ್ಯವಾಗಿ strings, arrays ಮತ್ತು ಇತರ ವಿಷಯಗಳು ಖಾಲಿಯೇ ಎಂದು ಪರಿಶೀಲಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

ವಿಷಯ ಖಾಲಿಯಾಗಿದ್ದರೆ, `isEmpty` `true` ಅನ್ನು return ಮಾಡುತ್ತದೆ; ವಿಷಯ ಖಾಲಿಯಿಲ್ಲದಿದ್ದರೆ, ಅದು `false` ಅನ್ನು return ಮಾಡುತ್ತದೆ.

ಆದ್ದರಿಂದ, ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್‌ನಲ್ಲಿ ಇನ್‌ಪುಟ್ ವಿಷಯ ಇದೆಯೇ ಇಲ್ಲವೇ ಎಂಬುದನ್ನು ತಿಳಿಯಲು ನಾವು ಇದನ್ನು ಬಳಸಬಹುದು.

### isEmpty ಬಳಸಿ variables ಪರಿಶೀಲಿಸುವುದು

ಬಳಕೆದಾರರು ಯಾವುದೇ ಮಾಹಿತಿಯನ್ನು ನಮೂದಿಸದಿದ್ದರೆ, ಆಗ:

```swift
user.isEmpty // true
password.isEmpty    // true
```

ಈ ವೇಳೆ, ನಾವು ಶರತ್ತನ್ನು ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

ಈ ಕೋಡ್‌ನ ಅರ್ಥ: `user` ಖಾಲಿಯಾಗಿದ್ದರೆ, ಮತ್ತು `password` ಕೂಡ ಖಾಲಿಯಾಗಿದ್ದರೆ, ಇದು output ಆಗಬೇಕು:

```swift
Empty
```

ಇಲ್ಲಿ `&&` ಒಂದು logical operator ಆಗಿದ್ದು, ಅದರ ಅರ್ಥ “ಮತ್ತು”.

ಅಂದರೆ, ಎಡಭಾಗದ ಶರತ್ತು true ಆಗಿ, ಬಲಭಾಗದ ಶರತ್ತೂ true ಆಗಿರುವಾಗ ಮಾತ್ರ ಸಂಪೂರ್ಣ ಶರತ್ತು true ಆಗುತ್ತದೆ.

ಆದ್ದರಿಂದ, ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಎರಡೂ ಖಾಲಿಯಾಗಿದ್ದಾಗ ಮಾತ್ರ ಈ ಕೋಡ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ.

## ಬಳಕೆದಾರರು ಒಂದು ಭಾಗವನ್ನು ಮಾತ್ರ ತುಂಬಿದ್ದಾರೆ

ಮುಂದೆ, ಮತ್ತೊಂದು ಪರಿಸ್ಥಿತಿಯನ್ನು ಪರಿಗಣಿಸೋಣ: ಬಳಕೆದಾರರು ಬಳಕೆದಾರ ಹೆಸರನ್ನು ಮಾತ್ರ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಮಾತ್ರ ನಮೂದಿಸಿದ್ದಾರೆ.

ಉದಾಹರಣೆಗೆ:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

ಈ ಸಂದರ್ಭದಲ್ಲಿ, ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿಯಿಲ್ಲ, ಆದರೆ ಪಾಸ್‌ವರ್ಡ್ ಖಾಲಿಯಾಗಿದೆ.

ಇದನ್ನು ಪರಿಶೀಲಿಸಲು ನಾವು `isEmpty` ಬಳಸುವುದನ್ನು ಮುಂದುವರಿಸಬಹುದು:

### ಬಳಕೆದಾರರು ಖಾತೆ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ತುಂಬಿದ ಪರಿಸ್ಥಿತಿ

ಬಳಕೆದಾರರು ಬಳಕೆದಾರ ಹೆಸರನ್ನು ಮಾತ್ರ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಮಾತ್ರ ನಮೂದಿಸಿದರೆ, ಯಾವುದು ಇಲ್ಲ ಎಂಬುದನ್ನು ಸೂಚಿಸುವ ಸಂಬಂಧಿತ ಸೂಚನೆ ನೀಡಬೇಕು.

ಉದಾಹರಣೆಗೆ, ಬಳಕೆದಾರರು ಬಳಕೆದಾರ ಹೆಸರನ್ನು ಮಾತ್ರ ನಮೂದಿಸಿದರೆ:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ಈ ಕೋಡ್‌ನ ಲಾಜಿಕ್ ಹೀಗಿದೆ: ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿಯಾಗಿದ್ದರೆ, ಬಳಕೆದಾರ ಹೆಸರನ್ನು ನಮೂದಿಸಲು ಹೇಳಿ. ಇಲ್ಲವಾದರೆ, ಪಾಸ್‌ವರ್ಡ್ ಖಾಲಿಯಾಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ, ಖಾಲಿಯಾಗಿದ್ದರೆ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಲು ಹೇಳಿ.

### ಬಳಕೆದಾರರು ಎಲ್ಲಾ ಮಾಹಿತಿಯನ್ನು ತುಂಬಿದ್ದಾರೆ

ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಎರಡನ್ನೂ ಈಗಾಗಲೇ ನಮೂದಿಸಿದ್ದರೆ, `isEmpty` ಎರಡಕ್ಕೂ `false` ಅನ್ನು return ಮಾಡುತ್ತದೆ.

ಈ ಸಂದರ್ಭದಲ್ಲಿ, ಅದನ್ನು ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

ಇಲ್ಲಿ `!` ಎಂದರೆ “negation”.

ಉದಾಹರಣೆಗೆ:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

ಅಂದರೆ, `user.isEmpty` “ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿಯೇ” ಎಂಬುದನ್ನು ತೀರ್ಮಾನಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ, ಆದರೆ `!user.isEmpty` “ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿಯಿಲ್ಲವೇ” ಎಂಬುದನ್ನು ತೀರ್ಮಾನಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

ಪಾಸ್‌ವರ್ಡ್‌ಗೆ ಕೂಡ ಇದೇ ಲಾಜಿಕ್ ಅನ್ವಯಿಸುತ್ತದೆ.

ಹೀಗಾಗಿ, ಈ ಕೋಡ್‌ನ ಅರ್ಥ: ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿಯಿಲ್ಲ, ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಕೂಡ ಖಾಲಿಯಿಲ್ಲ.

ಈ ಎರಡೂ ಶರತ್ತುಗಳು true ಆಗಿರುವಾಗ, output ಹೀಗಿರುತ್ತದೆ:

```swift
Success
```

## ಸಂಪೂರ್ಣ validation logic

ಈಗ, ಈ ಮೂರು ಪರಿಸ್ಥಿತಿಗಳನ್ನು ಸೇರಿಸಿ `Button` ಒಳಗೆ ಬರೆಯೋಣ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

ಈ ಕೋಡ್‌ನ execution order ಅನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

ಮೊದಲ ಹಂತದಲ್ಲಿ, ಮೊದಲು ಇದನ್ನು ಪರಿಶೀಲಿಸುತ್ತೇವೆ:

```swift
if user.isEmpty && password.isEmpty
```

ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಎರಡೂ ಖಾಲಿಯಾಗಿದ್ದರೆ, ನೇರವಾಗಿ `Empty` output ಆಗುತ್ತದೆ.

ಅವು ಎರಡೂ ಖಾಲಿಯಾಗಿಲ್ಲದಿದ್ದರೆ, ನಾವು ಈ ಸಾಲನ್ನು ಮುಂದುವರಿಸಿ ಪರಿಶೀಲಿಸುತ್ತೇವೆ:

```swift
else if user.isEmpty || password.isEmpty
```

ಇಲ್ಲಿ `||` ಎಂದರೆ “ಅಥವಾ”.

ಅಂದರೆ, ಒಂದು ಶರತ್ತು true ಆಗಿದ್ದರೆ, ಸಂಪೂರ್ಣ ಶರತ್ತು true ಆಗುತ್ತದೆ.

ಆದ್ದರಿಂದ, ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿಯಾಗಿದ್ದರೆ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್ ಖಾಲಿಯಾಗಿದ್ದರೆ, `else if` ಕೋಡ್ ಬ್ಲಾಕ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ.

ಕೋಡ್ ಬ್ಲಾಕ್‌ಗೆ ಒಳಗೆ ಹೋದ ನಂತರ, ಯಾವ ಇನ್‌ಪುಟ್ ಬಾಕ್ಸ್ ತುಂಬಲಾಗಿಲ್ಲ ಎಂಬುದನ್ನು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗಿ ಪರಿಶೀಲಿಸುತ್ತೇವೆ:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ಮೇಲಿನ ಎರಡು ಶರತ್ತುಗಳಲ್ಲಿ ಒಂದೂ true ಆಗದಿದ್ದರೆ, ಅದರ ಅರ್ಥ ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿಯಿಲ್ಲ ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಕೂಡ ಖಾಲಿಯಿಲ್ಲ.

ಆಮೇಲೆ ಪ್ರೋಗ್ರಾಂ ಕೊನೆಯ `else` ಗೆ ಹೋಗುತ್ತದೆ:

```swift
print("Success")
```

ಈ ರೀತಿಯಲ್ಲಿ, ನಾವು ಸೈನ್ ಇನ್ ಇನ್‌ಪುಟ್‌ನ ಅತ್ಯಂತ ಮೂಲಭೂತ validation logic ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸುತ್ತೇವೆ.

## ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ validation

ಮೇಲಿನ logic ಕೇವಲ “ಏನಾದರೂ ವಿಷಯವನ್ನು ನಮೂದಿಸಲಾಗಿದೆ ಅಥವಾ ಇಲ್ಲ” ಎನ್ನುವುದನ್ನು ಮಾತ್ರ ಪರಿಶೀಲಿಸುತ್ತದೆ.

ಆದರೆ ನಿಜವಾದ ಆಪ್‌ನಲ್ಲಿ, ಕೇವಲ ವಿಷಯವನ್ನು ನಮೂದಿಸುವುದರಿಂದ ಸಾಕಾಗುವುದಿಲ್ಲ. ಸಾಮಾನ್ಯವಾಗಿ, ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು verify ಮಾಡಲು ಸರ್ವರ್‌ಗೆ ಕಳುಹಿಸಬೇಕಾಗುತ್ತದೆ.

ಸರ್ವರ್ ಬಳಕೆದಾರ ಹೆಸರು ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಸರಿಯಾಗಿದೆ ಎಂದು ದೃಢಪಡಿಸಿದರೆ, ಅದು ಸೈನ್ ಇನ್ ಮಾಡಲು ಅನುಮತಿಸುತ್ತದೆ; ಇಲ್ಲದಿದ್ದರೆ, ಸೈನ್ ಇನ್ ವಿಫಲವಾಗಿದೆ ಎಂದು ತಿಳಿಸುತ್ತದೆ.

ಈ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಅಭ್ಯಾಸ ಮಾಡಲು, ಮೊದಲು ಕೋಡ್‌ನಲ್ಲಿ ಒಂದು ತಾತ್ಕಾಲಿಕ ಖಾತೆ ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಹೊಂದಿಸಿ, “ಸರಿಯಾದ ಸೈನ್ ಇನ್ ಮಾಹಿತಿ”ಯನ್ನು ಅನುಕರಿಸಬಹುದು:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಎರಡೂ ಖಾಲಿಯಾಗಿಲ್ಲದಾಗ, ಅವು ಸರಿಯಾದವೆಯೇ ಎಂದು ಮುಂದಾಗಿ ಹೋಲಿಸುತ್ತೇವೆ:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

ಇಲ್ಲಿ `==` ಎಂದರೆ “ಸಮಾನವೇ ಇಲ್ಲವೇ”.

ಉದಾಹರಣೆಗೆ:

```swift
user == userID
```

ಅದರ ಅರ್ಥ, ಬಳಕೆದಾರರು ನಮೂದಿಸಿದ ಬಳಕೆದಾರ ಹೆಸರು ನಾವು ಹೊಂದಿಸಿದ ಸರಿಯಾದ ಬಳಕೆದಾರ ಹೆಸರಿನೊಂದಿಗೆ ಸಂಪೂರ್ಣವಾಗಿ ಹೊಂದಿಕೆಯಾಗುತ್ತದೆಯೇ? ಪಾಸ್‌ವರ್ಡ್ ಪರಿಶೀಲನೆಯೂ ಇದೇ ಲಾಜಿಕ್ ಅನ್ನು ಅನುಸರಿಸುತ್ತದೆ.

ಆದ್ದರಿಂದ, ನಮೂದಿಸಿದ ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ಹೊಂದಿಸಿದ values‌ಗಳಿಗೆ ಸಮನಾಗಿದ್ದರೆ `Success` output ಆಗುತ್ತದೆ; ಅವುಗಳಲ್ಲಿ ಒಂದಾದರೂ ಸಮನಾಗಿರದಿದ್ದರೆ `Input error` output ಆಗುತ್ತದೆ.

ಈ ರೀತಿಯಾಗಿ, ನಾವು ಸರಳವಾದ “mock sign in verification” ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

ಇದು ಇನ್ನೂ ಸರ್ವರ್‌ಗೆ ಸಂಪರ್ಕ ಹೊಂದಿದ ನಿಜವಾದ sign in feature ಆಗಿಲ್ಲದಿದ್ದರೂ, ಇದು ನಮಗೆ ಒಂದು ವಿಷಯವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸಾಕಾಗಿದೆ: **ಬಟನ್‌ನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿದ ನಂತರ, ಬೇರೆ ಬೇರೆ ಶರತ್ತುಗಳ ಪ್ರಕಾರ ಬೇರೆ ಬೇರೆ ಕೋಡ್ ಕಾರ್ಯಗತಗೊಳ್ಳಬಹುದು**.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಒಂದು ಮೂಲಭೂತ ಸೈನ್ ಇನ್ ವ್ಯೂವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ, ಮತ್ತು ವಿಶೇಷವಾಗಿ “ಶರತ್ತುಗಳ ಆಧಾರದ ಮೇಲೆ ಇನ್‌ಪುಟ್ ವಿಷಯವನ್ನು ಹೇಗೆ ನಿರ್ಧರಿಸುವುದು” ಎಂಬ ಲಾಜಿಕ್ ಕಲಿತಿದ್ದೇವೆ.

ಈ ಪಾಠದ ಮುಖ್ಯ ವಿಷಯವೆಂದರೆ: string ಖಾಲಿಯೇ ಇಲ್ಲವೇ ಎಂದು ತಿಳಿಯಲು `isEmpty` ಬಳಸುವುದು, ಮತ್ತು ಬೇರೆ ಬೇರೆ ಪರಿಸ್ಥಿತಿಗಳನ್ನು ನಿಭಾಯಿಸಲು logical operators ಜೊತೆ `if` statements ಬಳಸುವುದು.

ಇವುಗಳಲ್ಲಿ ಎರಡು ಬಹಳ ಮುಖ್ಯವಾದ logical operators ಇವೆ:

- `&&`: ಇದರ ಅರ್ಥ “ಮತ್ತು”, ಎರಡೂ ಶರತ್ತುಗಳು ಪೂರ್ತಿಯಾಗಬೇಕು
- `||`: ಇದರ ಅರ್ಥ “ಅಥವಾ”, ಒಂದು ಶರತ್ತು ಪೂರ್ತಿಯಾದರೂ ಸಾಕು

ಈ ಶರತ್ತುಗಳು ಕೊನೆಯಲ್ಲಿ `true` ಅಥವಾ `false` ನೀಡಿದಾಗ, `if` statement ಫಲಿತಾಂಶದ ಆಧಾರದ ಮೇಲೆ ಬೇರೆ ಕೋಡ್ ಅನ್ನು ಕಾರ್ಯಗತಗೊಳಿಸುತ್ತದೆ.

ಈ ಸೈನ್ ಇನ್ ವ್ಯೂ ಮೂಲಕ, ನಾವು ಈಗಾಗಲೇ “ಇಂಟರ್ಫೇಸ್ + ಡೇಟಾ + logical judgment” ಅನ್ನು ಒಟ್ಟುಗೂಡಿಸುವ development ವಿಧಾನವನ್ನು ತಿಳಿದುಕೊಳ್ಳಲು ಆರಂಭಿಸಿದ್ದೇವೆ.

## ಸಂಪೂರ್ಣ ಕೋಡ್

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
