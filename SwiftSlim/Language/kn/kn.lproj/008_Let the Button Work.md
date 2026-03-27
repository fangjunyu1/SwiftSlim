# Button ಅನ್ನು ಕೆಲಸ ಮಾಡಿಸೋಣ

ಈ ಪಾಠದಲ್ಲಿ ನಾವು ಮುಖ್ಯವಾಗಿ `Button`, `print` ಮೂಲಕ debug ಮಾಹಿತಿ output ಮಾಡುವುದು, ಮತ್ತು Swift functions ಅನ್ನು ಕಲಿಯುತ್ತೇವೆ.

ಈ ವಿಷಯಗಳು SwiftUI interaction programming ಗೆ ಮೂಲಭೂತವಾಗಿವೆ.

## Button

Button ಎಂದರೆ ನಮಗೆ ಅತ್ಯಂತ ಸಾಮಾನ್ಯವಾದ UI control. Download ಮಾಡುವುದು, open ಮಾಡುವುದು, exit ಮಾಡುವುದು ಮುಂತಾದ ಕಾರ್ಯಗಳಿಗೆ ನಾವು ಸಾಮಾನ್ಯವಾಗಿ button ಕ್ಲಿಕ್ ಮಾಡುತ್ತೇವೆ.

ಉದಾಹರಣೆಗೆ, App Store ನಲ್ಲಿ “Get” button ಒತ್ತಿ App download ಮಾಡುತ್ತೇವೆ.

![Button](../../RESOURCE/008_button.png)

SwiftUI ಯಲ್ಲಿ button ಅನ್ನು `Button` ಮೂಲಕ ಸೂಚಿಸಲಾಗುತ್ತದೆ.

ಮೂಲ ಬಳಕೆ:

```swift
Button("") {
    
}
```

ಇದರ ರಚನೆಯನ್ನು ಎರಡು ಭಾಗಗಳಾಗಿ ನೋಡಬಹುದು:

```swift
Button("ಬಟನ್ ಪಠ್ಯ") {
    ಬಟನ್ ಒತ್ತಿದಾಗ ನಡೆಯುವ ಕೋಡ್
}
```

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

ಇದನ್ನು ರನ್ ಮಾಡಿದರೆ `Start` button ಕಾಣಿಸುತ್ತದೆ.

![Button](../../RESOURCE/008_button1.png)

ಬಳಕೆದಾರನು button ಒತ್ತಿದಾಗ, `{}` ಒಳಗಿನ ಕೋಡ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ.

ಗಮನಿಸಬೇಕಾದುದು: `Button` ಎನ್ನುವುದು SwiftUI ಯ interface control (`View`) ಆಗಿರುವುದರಿಂದ, ಅದನ್ನು ತಪ್ಪದೇ `body` ಒಳಗೆ ಬರೆಯಬೇಕು.

### buttonStyle modifier

SwiftUI ಯಲ್ಲಿ `Button` ಗೆ system-built-in button styles ಇವೆ; ಅವನ್ನು `buttonStyle` modifier ಮೂಲಕ ಬಳಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` system ನೀಡುವ button style ಅನ್ನು ಅನ್ವಯಿಸುತ್ತದೆ.

ಸಾಮಾನ್ಯ ಆಯ್ಕೆಗಳು:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

ಪ್ರತ್ಯೇಕ styles ನಡುವಿನ ವ್ಯತ್ಯಾಸ ಮುಖ್ಯವಾಗಿ border ಇದೆಯೇ ಇಲ್ಲವೇ, background ಇದೆಯೇ ಇಲ್ಲವೇ, ಮತ್ತು visual emphasis ಎಷ್ಟು ಎಂಬುದರಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ.

## print output

Programming ನಲ್ಲಿ, program ನಿರ್ದಿಷ್ಟ ಕೋಡ್ ಭಾಗವನ್ನು ತಲುಪಿದೆಯೇ ಇಲ್ಲವೇ ಎಂದು ಪರಿಶೀಲಿಸುವ ಅಗತ್ಯ ಹೆಚ್ಚಾಗಿ ಬರುತ್ತದೆ.

Swift ಇದಕ್ಕಾಗಿ `print` function ಅನ್ನು ಒದಗಿಸುತ್ತದೆ.

ಮೂಲ ಬರವಣಿಗೆ:

```swift
print("Hello")
```

ಈ ಕೋಡ್ Console ಗೆ ಪಠ್ಯವನ್ನು output ಮಾಡುತ್ತದೆ.

### Button ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೇ ಪರೀಕ್ಷಿಸುವುದು

Button ಕ್ಲಿಕ್ ಆಗಿದೆಯೇ ಇಲ್ಲವೇ ಪರೀಕ್ಷಿಸಲು, button ಒಳಗೆ `print` ಬರೆಯಬಹುದು.

```swift
Button("Start") {
    print("Test 123")
}
```

Button ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ Console ನಲ್ಲಿ ಈ output ಬರುತ್ತದೆ:

```
Test 123
```

ಇದರಿಂದ button ಯಶಸ್ವಿಯಾಗಿ trigger ಆಗಿದೆ ಎಂಬುದು ಸ್ಪಷ್ಟ.

![Button](../../RESOURCE/008_button3.png)

ಗಮನಿಸಿ: `print` ಎಂದರೆ Swift code, ಇದು interface control ಅಲ್ಲ. ಆದ್ದರಿಂದ ಇದನ್ನು `body` ಒಳಗೆ ನೇರವಾಗಿ ಬರೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ, ಇಲ್ಲವಾದರೆ error ಬರುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, ಈ ರೀತಿ ಬರೆಯುವುದು ತಪ್ಪಾಗಿದೆ:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // ತಪ್ಪು: body ಒಂದೇ View ಅನ್ನು ಹಿಂತಿರುಗಿಸಬೇಕು
    }
}
```

SwiftUI ಯಲ್ಲಿ `body` ಇಂಟರ್ಫೇಸ್ ರಚನೆಯನ್ನು ವಿವರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ; ಅದರಲ್ಲಿ ಕೇವಲ UI controls (`View`) — ಉದಾ. `Text`, `Button`, `Image` ಇತ್ಯಾದಿ ಇರಬೇಕು.

ಸಾಮಾನ್ಯ ಕೋಡ್ (ಲೆಕ್ಕಾಚಾರ ಲಾಜಿಕ್, `print`, ಇತ್ಯಾದಿ) button, function ಅಥವಾ ಇತರ event handler ಗಳೊಳಗೆ ಇರಬೇಕು.

### Console

`print` output ಆಗುವ ವಿಷಯವು Xcode ನ Console ನಲ್ಲಿ ಕಾಣುತ್ತದೆ.

ನೀವು Console ನೋಡದಿದ್ದರೆ, ಕೆಳಗಿನ ಬಲಭಾಗದ `Show the Debug Area` button ಒತ್ತಿ debug ಪ್ರದೇಶ ತೆರೆಯಿರಿ, ನಂತರ `Show the Console` button ಒತ್ತಿ console ತೋರಿಸಿ.

![](../../RESOURCE/008_button4.png)

Console ನ ಕೆಳಗಿನ ಎಡಭಾಗದಲ್ಲಿ ಎರಡು ಟ್ಯಾಗ್‌ಗಳು ಇರುತ್ತವೆ: `Executable` ಮತ್ತು `Previews`.

![](../../RESOURCE/008_button5.png)

ಈ ಟ್ಯಾಗ್‌ಗಳು ವಿಭಿನ್ನ ಚಾಲನಾ ಪರಿಸರಗಳನ್ನು ಸೂಚಿಸುತ್ತವೆ: Canvas preview ವೇಳೆ `print` output `Previews` ನಲ್ಲಿ ಕಾಣುತ್ತದೆ; simulator ಅಥವಾ physical device ನಲ್ಲಿ App ರನ್ ಮಾಡಿದರೆ, output `Executable` ನಲ್ಲಿ ಕಾಣುತ್ತದೆ.

ಹೀಗಾಗಿ `print` output ಕಾಣುತ್ತಿಲ್ಲವೆಂದರೆ, ಮೊದಲು ನೀವು ಸರಿಯಾದ ಟ್ಯಾಗ್ ಆಯ್ಕೆಮಾಡಿದ್ದೀರೇ ಎಂದು ಪರಿಶೀಲಿಸಿ.

## ಉದಾಹರಣೆ - ASCII character art

ಕೆಲವು code projects ಗಳಲ್ಲಿ ASCII character art ಕಾಣುತ್ತದೆ.

Character art ಅಂದರೆ ಸಾಮಾನ್ಯ characters ಬಳಸಿ ರೂಪಿಸಿದ ಚಿತ್ರ. ಉದಾಹರಣೆಗೆ:

![ASCII](../../RESOURCE/008_ascii.png)

ನಾವು button + `print` ಬಳಸಿ ಒಂದು ASCII character art output ಮಾಡಬಹುದು.

ಉದಾಹರಣೆಯ ಕೋಡ್:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Button ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ Console ನಲ್ಲಿ ಈ output ಬರುತ್ತದೆ:

```
 /\_/\
( o.o )
 > ^ <
```

ಗಮನಿಸಿ: string ಒಳಗಿನ `\` ಅನ್ನು `\\` ಎಂದು ಬರೆಯಬೇಕು, ಏಕೆಂದರೆ backslash string ನಲ್ಲಿ escape character ಆಗಿರುತ್ತದೆ.

## Function

Button ಒಳಗೆ ನಾವು ನೇರವಾಗಿ ಕೋಡ್ ಬರೆಯಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Button("Start") {
    print("Hello")
}
```

ಕೋಡ್ ಕಡಿಮೆ ಇದ್ದರೆ, ಈ ರೀತಿಯ ಬರವಣಿಗೆ ಸಮಸ್ಯೆಯಿಲ್ಲ. ಆದರೆ ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ಒಂದು button ಒತ್ತಿದಾಗ ನಡೆಯುವ ಲಾಜಿಕ್ ಬಹಳ ಉದ್ದವಾಗಿರಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // ಇನ್ನೂ ಬಹಳ ಕೋಡ್ ಇರಬಹುದು
}
```

ಕೋಡ್ ಹೆಚ್ಚಾಗುತ್ತಾ ಹೋದಂತೆ, button ಒಳಗೆ ನೇರವಾಗಿ ಬರೆಯುವುದು interface code ಅನ್ನು ಅಸ್ತವ್ಯಸ್ತಗೊಳಿಸುತ್ತದೆ ಮತ್ತು ಓದಲು, ನಿರ್ವಹಿಸಲು ಕಷ್ಟವಾಗುತ್ತದೆ.

ಆದ್ದರಿಂದ ಸಾಮಾನ್ಯವಾಗಿ ನಾವು ಈ ಕೋಡ್ ಅನ್ನು ಒಂದು function ಒಳಗೆ ಹಾಕಿ, ನಂತರ button ಒಳಗೆ ಆ function ಅನ್ನು ಕರೆಯುತ್ತೇವೆ.

### Function ಎಂದರೆ ಏನು

Function ಎಂದರೆ ಮರುಬಳಕೆ ಮಾಡಬಹುದಾದ ಒಂದು code block.

ನಿರ್ದಿಷ್ಟ ಕೋಡ್ ಅನ್ನು ಕಾರ್ಯಗತಗೊಳಿಸಬೇಕಾದಾಗ, ನಾವು ಆ function ಅನ್ನು ಕರೆ ಮಾಡಿದರೆ ಸಾಕು; ಆಗ ಅದರ ಒಳಗಿನ ಕೋಡ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ.

ಇದರಿಂದ ಕೋಡ್ ರಚನೆ ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ, ಮತ್ತು ಮರುಬಳಕೆ ಸುಲಭವಾಗುತ್ತದೆ.

### ಮೂಲ ಬರವಣಿಗೆ

Swift ನಲ್ಲಿ function ಅನ್ನು **func** ಕೀವರ್ಡ್ ಮೂಲಕ ವ್ಯಾಖ್ಯಾನಿಸುತ್ತಾರೆ:

```swift
func randomInt() {
    // code
}
```

ಈ ಕೋಡ್ ಒಂದು function ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ.

`randomInt` function ಹೆಸರು; ಇದು ಈ code block ಅನ್ನು ಗುರುತಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

`() ` ಅಂದರೆ parameter ಸ್ಥಾನ; ಇಲ್ಲಿ ಹೊರಗಿನಿಂದ data ಸ್ವೀಕರಿಸಬಹುದು. ಅಗತ್ಯವಿಲ್ಲದಿದ್ದರೆ ಖಾಲಿ ಬಿಡಬಹುದು.

`{}` ಒಳಗೆ function ನ ಕೋಡ್ ಭಾಗ ಇರುತ್ತದೆ, ಕಾರ್ಯಗತಗೊಳ್ಳಬೇಕಾದ ಎಲ್ಲಾ ಕೋಡ್ ಇಲ್ಲಿ ಬರೆಯಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
func getName() {
    print("FangJunyu")
}
```

ಈ function ನ ಕೆಲಸ ಒಂದು ಪಠ್ಯವನ್ನು output ಮಾಡುವುದು.

### Function ಅನ್ನು ಕರೆಮಾಡುವುದು

Function ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುವುದರಿಂದ ಅದು ಸೃಷ್ಟಿಯಾಗುತ್ತದೆ ಮಾತ್ರ; ಅದನ್ನು ಕಾರ್ಯಗತಗೊಳಿಸಲು function ಅನ್ನು ಕರೆಮಾಡಬೇಕು.

ಕರೆಮಾಡುವ ವಿಧಾನವೆಂದರೆ function ಹೆಸರಿನ ನಂತರ `()` ಸೇರಿಸುವುದು:

```swift
getName()
```

ಪ್ರೋಗ್ರಾಂ ಈ ಸಾಲಿಗೆ ಬಂದಾಗ `getName` function ಒಳಗಿನ ಕೋಡ್ ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ.

ಪೂರ್ಣ ಉದಾಹರಣೆ:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

ಇದನ್ನು ರನ್ ಮಾಡಿದರೆ, Console ನಲ್ಲಿ ಈ output ಬರುತ್ತದೆ:

```
FangJunyu
```

### SwiftUI ಯಲ್ಲಿ function ಬಳಸುವುದು

SwiftUI view ಯಲ್ಲಿ function ಗಳನ್ನು ಸಾಮಾನ್ಯವಾಗಿ `body` ಹೊರಗೆ ಬರೆಯುತ್ತಾರೆ.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Button ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ, `getName()` function ಕರೆಗೊಳ್ಳುತ್ತದೆ.

ಇದರಿಂದ ಇಂಟರ್ಫೇಸ್ ಕೋಡ್ ಸರಳವಾಗಿರುತ್ತದೆ, ಮತ್ತು ವಿವರವಾದ ಲಾಜಿಕ್ function ಒಳಗೆ ಇರುತ್ತದೆ.

### Function parameters

ಕೆಲವೊಮ್ಮೆ, ಒಂದು function ಬೇರೆ ಬೇರೆ data ಆಧರಿಸಿ ಬೇರೆ ರೀತಿಯ ಕಾರ್ಯಗಳನ್ನು ಮಾಡಬೇಕಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, function ಕೇವಲ `"FangJunyu"` ಅನ್ನು output ಮಾಡದೆ, ಬೇರೆ ಹೆಸರುಗಳನ್ನೂ output ಮಾಡಲಿ ಎಂದು ಬಯಸಬಹುದು.

ಇಂತಹ ಸಂದರ್ಭಗಳಲ್ಲಿ parameters ಬಳಸಿ. Parameter ಅಂದರೆ: function ಕರೆ ಮಾಡುವಾಗ ಒಳಗೆ ನೀಡಲಾಗುವ data.

ಉದಾಹರಣೆಗೆ:

```swift
func getName(name: String) {
    print(name)
}
```

ಈ function ಗೆ ಹೊಸ parameter ಸೇರಿಸಲಾಗಿದೆ. ಇಲ್ಲಿ `name` parameter ಹೆಸರು, `String` ಅದರ type.

ಅಂದರೆ function ಗೆ ಒಂದು `String` type data ಬೇಕು.

ಇದೀಗ function ಗೆ data ಅಗತ್ಯವಿರುವುದರಿಂದ, ಕರೆ ಮಾಡುವಾಗ ಆ data ನೀಡಲೇಬೇಕು.

```swift
getName(name: "Sam")
```

Function ಅನ್ನು `"Sam"` ಜೊತೆಗೆ ಕರೆ ಮಾಡಿದರೆ, ಅದು ಆ ಮೌಲ್ಯವನ್ನು output ಮಾಡುತ್ತದೆ.

ಫಲಿತಾಂಶ:

```
Sam
```

## ಉದಾಹರಣೆ - Function ಬಳಸಿ ASCII character art output ಮಾಡುವುದು

ಹಿಂದಿನ ಉದಾಹರಣೆಯಲ್ಲಿ ನಾವು `print` ಅನ್ನು button ಒಳಗೆ ನೇರವಾಗಿ ಬರೆದಿದ್ದೇವೆ.

ಆದರೆ character art ಹೆಚ್ಚು ಜಟಿಲವಾಗಿದ್ದರೆ, ಕೋಡ್ ಬಹಳ ಉದ್ದವಾಗುತ್ತದೆ. ಆಗ ಲಾಜಿಕ್ ಅನ್ನು function ಗೆ ಹಾಕಿದರೆ, interface code ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಯ ಕೋಡ್:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

ಇದನ್ನು ರನ್ ಮಾಡಿ button ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ Console ನಲ್ಲಿ ಈ output ಕಾಣುತ್ತದೆ:

```
 /\_/\
( o.o )
 > ^ <
```

ಇಲ್ಲಿ ಬಳಕೆದಾರ button ಒತ್ತಿದ ನಂತರ ಎರಡು ಸಂಗತಿಗಳು ನಡೆಯುತ್ತವೆ:

1. Button `printCat()` function ಅನ್ನು ಕರೆಯುತ್ತದೆ
2. Function ಒಳಗಿನ `print` ಕೋಡ್ ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ

ಈ ರೀತಿಯಾಗಿ interface code ಕೇವಲ event trigger ಮಾಡಲು ಮಾತ್ರ ಕೆಲಸ ಮಾಡುತ್ತದೆ, ಮತ್ತು ನಿಜವಾದ ಲಾಜಿಕ್ function ಒಳಗೆ ನಿರ್ವಹಿಸಲಾಗುತ್ತದೆ.

ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ button ನ ಹೆಚ್ಚಿನ ಕಾರ್ಯಾಚರಣೆಗಳು function ಗಳ ಮೂಲಕವೇ ಅನುಷ್ಠಾನಗೊಳ್ಳುತ್ತವೆ.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ ನಾವು ಮೂರು ಪ್ರಮುಖ ವಿಷಯಗಳನ್ನು ಕಲಿತೇವೆ:

**1. Button**

`Button` ಎನ್ನುವುದು SwiftUI ಯಲ್ಲಿ ಕಾರ್ಯವನ್ನು trigger ಮಾಡುವ control.

```swift
Button("Start") {

}
```

ಬಳಕೆದಾರ button ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ, braces ಒಳಗಿನ ಕೋಡ್ ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ.

**2. print output**

`print` ಅನ್ನು Console ಗೆ debug ಮಾಹಿತಿ output ಮಾಡಲು ಬಳಸುತ್ತಾರೆ.

```swift
print("Hello")
```

Developer ಗಳು Console ಮೂಲಕ program ನ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಬಹುದು.

**3. Function**

Function ಎನ್ನುವುದು ಮರುಬಳಕೆ ಮಾಡಬಹುದಾದ code block.

```swift
func sayHello() {
    print("Hello")
}
```

Function ಅನ್ನು ಕರೆಯುವುದು:

```swift
sayHello()
```

Function ಗೆ data ಬೇಕಾದರೆ, parameter ಬಳಸಬಹುದು:

```swift
func sayHello(name: String) {
    print(name)
}
```

ಮುಂದಿನ ಪಾಠಗಳಲ್ಲಿ ನಾವು ಇನ್ನಷ್ಟು SwiftUI controls ಮತ್ತು data view ಜೊತೆ ಹೇಗೆ ಸಂವಹನ ಮಾಡುತ್ತದೆ ಎಂಬುದನ್ನು ಕಲಿಯುತ್ತೇವೆ.

## ಅಭ್ಯಾಸ

ಕೆಳಗಿನ ಅಭ್ಯಾಸಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ ನೋಡಿ:

1. `"Hello"` ಎಂಬ ಪಠ್ಯವಿರುವ button ರಚಿಸಿ
2. Button ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ Console ನಲ್ಲಿ `Hello Swift` output ಮಾಡಿ
3. Output ಕೋಡ್ ಅನ್ನು ಒಂದು function ಒಳಗೆ ಬರೆಯಿರಿ, ನಂತರ button ಒಳಗೆ ಆ function ಅನ್ನು ಕರೆಮಾಡಿ
