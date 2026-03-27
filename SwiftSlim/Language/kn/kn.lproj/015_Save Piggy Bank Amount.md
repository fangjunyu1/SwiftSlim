# ಹುಂಡಿಯ ಮೊತ್ತವನ್ನು ಉಳಿಸುವುದು

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ, ನಾವು ಸರಳವಾದ "ಹುಂಡಿ" ಯನ್ನು ನಿರ್ಮಿಸಿದ್ದೇವೆ. ಈ ಪಾಠದಲ್ಲಿ, "ಹುಂಡಿ" ಯಲ್ಲಿನ amount ಅನ್ನು ಶಾಶ್ವತವಾಗಿ ಹೇಗೆ ಉಳಿಸಬೇಕು ಎಂದು ಕಲಿಯುತ್ತೇವೆ.

ಈ ಪಾಠದ ಮುಖ್ಯ ವಿಷಯಗಳು `UserDefaults` ಮತ್ತು `@AppStorage` property wrapper. ಜೊತೆಗೆ `onAppear` ನ ಪಾತ್ರ ಹಾಗೂ Optional type (`nil`) ಬಳಸುವ ವಿಧಾನವನ್ನೂ ವಿಸ್ತಾರವಾಗಿ ನೋಡುತ್ತೇವೆ.

ಗಮನಿಸಿ: ಈ ಪಾಠದಲ್ಲಿ ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ ನಿರ್ಮಿಸಿದ "ಹುಂಡಿ" ಯ ಕೋಡ್ ಅನ್ನು ಮುಂದುವರೆಯಾಗಿ ಬಳಸಬೇಕು.

## ಶಾಶ್ವತ ಉಳಿವಿನ ಸಮಸ್ಯೆ

ಈಗ "ಹುಂಡಿ" ಯ interface ಬಹಳ ಸರಳವಾಗಿದ್ದು, ಬಳಸುವುದೂ ಸುಲಭ.

![Piggy Bank](../../Resource/014_view.png)

ಆದರೆ ಒಂದು ಸ್ಪಷ್ಟವಾದ ಸಮಸ್ಯೆ ಇದೆ: ಪ್ರತಿ ಬಾರಿ view refresh ಆದಾಗ ಅಥವಾ app ಮುಚ್ಚಿದಾಗ, "ಹುಂಡಿ" ಯ total amount ಮತ್ತೆ 0 ಆಗುತ್ತದೆ, ಹಾಗೆಯೇ ಹಿಂದಿನ ಮೊತ್ತ ಸಂಪೂರ್ಣ ಕಳೆದುಹೋಗುತ್ತದೆ.

ಇದರಿಂದ data ನಿಜವಾಗಿ save ಆಗಿಲ್ಲ ಎಂಬುದು ಸ್ಪಷ್ಟ. ಅಂದರೆ, ಈಗಿನ "ಹುಂಡಿ" ತಾತ್ಕಾಲಿಕ data ಅನ್ನು ಮಾತ್ರ ಉಳಿಸುತ್ತದೆ.

### ಯಾಕೆ ಶಾಶ್ವತವಾಗಿ ಉಳಿಯುವುದಿಲ್ಲ?

ಇದಕ್ಕೆ ಕಾರಣ ನಾವು `@State` ಬಳಸಿ ಘೋಷಿಸಿದ variable:

```swift
@State private var amount = 0
```

`@State` ಮೂಲಕ ಘೋಷಿಸಿದ variable ನ lifecycle ಸಂಪೂರ್ಣವಾಗಿ view ಮೇಲೆ ಅವಲಂಬಿತವಾಗಿದೆ.

view ರಚನೆಯಾದಾಗ `amount` 0 ಆಗಿ initialize ಆಗುತ್ತದೆ; view ನಾಶವಾದಾಗ `amount` ಕೂಡ ನಾಶವಾಗುತ್ತದೆ.

ಇಲ್ಲಿ `amount` ಉಳಿಸುವ data memory ಯಲ್ಲೇ ಮಾತ್ರ ಇರುತ್ತದೆ; ಅದು device ನಲ್ಲಿ save ಆಗುವುದಿಲ್ಲ.

ನಮಗೆ `amount` view lifecycle ಗೆ bind ಆಗಿರಬಾರದು. ಆದ್ದರಿಂದ data ಅನ್ನು ಶಾಶ್ವತವಾಗಿ save ಮಾಡಬೇಕು. ಮತ್ತೊಂದು ರೀತಿಯಲ್ಲಿ ಹೇಳುವುದಾದರೆ, data ಅನ್ನು device storage ಗೆ ಉಳಿಸಬೇಕು.

### "data persistence" ಎಂದರೆ ಏನು

data persistence ಅಂದರೆ, data ಅನ್ನು "ತಾತ್ಕಾಲಿಕ memory" ಯಿಂದ "device storage" ಗೆ ಉಳಿಸುವುದು.

view ಮುಚ್ಚಿದರೂ ಅಥವಾ app ಮುಚ್ಚಿದರೂ data ಕಳೆದುಹೋಗುವುದಿಲ್ಲ.

Swift ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ಸರಳವಾದ persistence ಗಾಗಿ `UserDefaults` ಬಳಸಬಹುದು. ಇನ್ನಷ್ಟು ಸಂಕೀರ್ಣ data ಗಾಗಿ `SwiftData` ಅಥವಾ `CoreData` ಬೇಕಾಗುತ್ತದೆ.

ಈ ಪಾಠದಲ್ಲಿ, ಮೊದಲು ಅತ್ಯಂತ ಸರಳವಾದ `UserDefaults` ಕಲಿಯೋಣ.

## UserDefaults

`UserDefaults` ಅನ್ನು ಹಗುರವಾದ key-value pair data ಉಳಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಸಾಮಾನ್ಯವಾಗಿ `String`, `Int`, `Double`, `Bool` ಮುಂತಾದ ಮೂಲ types ಗಳನ್ನು ಉಳಿಸಲು ಇದು ಸೂಕ್ತ.

### data ಉಳಿಸುವುದು

`UserDefaults` ನ `set` method ಮೂಲಕ data ಉಳಿಸಬಹುದು:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

`UserDefaults` ನ ಮೊದಲ parameter ಉಳಿಸಬೇಕಾದ data. ಇಲ್ಲಿ `String`, `Int` ಮುಂತಾದ types ಗಳ data ಅನ್ನು pass ಮಾಡಲಾಗಿದೆ.

ಎರಡನೇ parameter `forKey` variable name ಹಾಗೆ ಕೆಲಸಮಾಡುತ್ತದೆ; `UserDefaults` ನಲ್ಲಿ ಯಾವ data ಉಳಿಸಲಾಗಿದೆ ಎಂಬುದನ್ನು ಗುರುತಿಸಲು ಇದು ಬಳಸುತ್ತದೆ.

### data ಓದುವುದು

`UserDefaults` ಸಂಬಂಧಿಸಿದ methods ಗಳಿಂದ data ಓದುತ್ತದೆ:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

ಓದುವಾಗ ಸಂಬಂಧಿಸಿದ type method ನ್ನೇ ಬಳಸಬೇಕು; ಇಲ್ಲದಿದ್ದರೆ error ಬರಬಹುದು ಅಥವಾ ತಪ್ಪಾದ data ಸಿಗಬಹುದು.

### UserDefaults ಬಳಸುವಾಗ ಗಮನಿಸಬೇಕಾದದ್ದು

#### 1. Optional type ಹಿಂತಿರುಗಿಸುವುದು

`UserDefaults` ನಿಂದ data ಓದುವಾಗ, ಕೆಲವು methods Optional type ಹಿಂತಿರುಗಿಸುತ್ತವೆ.

ಉದಾಹರಣೆಗೆ:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

ಇಲ್ಲಿ `name` ನ type:

```swift
String?
```

ಅಂದರೆ value ಇರಬಹುದೇನೋ, ಇಲ್ಲದಿರಬಹುದೇನೋ.

**ಯಾಕೆ Optional type ಹಿಂತಿರುಗುತ್ತದೆ?**

ಏಕೆಂದರೆ `UserDefaults` ನಲ್ಲಿ ಪ್ರತಿಯೊಂದು Key ಗೆ data ಇರಲೇಬೇಕು ಎಂಬುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

ಹಿಂದೆಂದೂ `"City"` ಎಂಬ Key save ಆಗಿರದಿದ್ದರೆ, ಓದುವ ಫಲಿತಾಂಶ:

```swift
nil
```

ಗಮನಿಸಬೇಕು: `nil` ಅಂದರೆ data ಇಲ್ಲ. ಅದು ಖಾಲಿ string ಅಲ್ಲ.

"ಪ್ರಕಾರ ವ್ಯವಸ್ಥೆ" ಪಾಠದಲ್ಲಿಯೂ ಇದೇ ತರಹದ ಸ್ಥಿತಿಯನ್ನು ನೋಡಿದ್ದೇವೆ. type conversion ವಿಫಲವಾದಾಗ Optional type ಮರಳುತ್ತಿತ್ತು.

ಇದರಿಂದ, ಇಲ್ಲಿ `??` ಬಳಸಿ default value ಒದಗಿಸಿ unwrap ಮಾಡಬೇಕು:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

`UserDefaults` data ಓದಿ ಸಿಕ್ಕಿದರೆ ಅದನ್ನೇ ಬಳಸುತ್ತದೆ; ಸಿಗದಿದ್ದರೆ (`nil`) default value ಬಳಸುತ್ತದೆ.

#### 2. Optional ಅಲ್ಲದ type ಹಿಂತಿರುಗಿಸುವುದು

`UserDefaults` `Int`, `Double`, `Bool` ಓದುವಾಗ Optional ಅಲ್ಲದ values ಹಿಂತಿರುಗಿಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

ಈ Keys ಗಳಿಗೆ ಹಿಂದೆಯೇ data save ಆಗಿರದಿದ್ದರೂ, ಫಲಿತಾಂಶ `nil` ಆಗುವುದಿಲ್ಲ.

ಬದಲಿಗೆ default values ಬರುತ್ತವೆ:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. data ಪ್ರಮಾಣದ ಮಿತಿ

`UserDefaults` ಕಡಿಮೆ ಪ್ರಮಾಣದ data ಉಳಿಸಲು ಮಾತ್ರ ಸೂಕ್ತ. ಉದಾಹರಣೆಗೆ app settings, ಸರಳ state data ಮುಂತಾದವು.

ನೈಜ ಬಳಕೆಯಲ್ಲಿ, ದೊಡ್ಡ ಪ್ರಮಾಣದ data ಅಥವಾ ತುಂಬಾ frequent read/write data ಗಾಗಿ ಇದು ಸೂಕ್ತವಲ್ಲ.

## "ಹುಂಡಿ" ಯ ಮೊತ್ತವನ್ನು ಉಳಿಸುವುದು

ಈಗ `UserDefaults` ಬಳಸಿಕೊಂಡು "ಹುಂಡಿ" ಯ total amount ಅನ್ನು ಉಳಿಸುವ code logic ಅನ್ನು ನಿರ್ಮಿಸಬಹುದು.

ಬಳಕೆದಾರ button ಒತ್ತಿದಾಗ, input amount ಅನ್ನು total amount ಗೆ ಸೇರಿಸಿ, ನಂತರ total amount ಅನ್ನು `UserDefaults` ನಲ್ಲಿ save ಮಾಡಬೇಕು.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

ಇದರಿಂದ data write logic ಈಗಾಗಲೇ ಪೂರ್ಣಗೊಂಡಿದೆ.

## data persistence logic ವಿವರಣೆ

ನಾವು persistence write logic ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದರೂ, ನೈಜವಾಗಿ ರನ್ ಮಾಡಿದಾಗ ಒಂದು ಸಮಸ್ಯೆ ಕಾಣಿಸುತ್ತದೆ: view refresh ಆದಾಗ ಅಥವಾ app ಮರುತೆರೆದಾಗ `amount` ಇನ್ನೂ 0 ಆಗಿಯೇ ಇರುತ್ತದೆ.

ಇದಕ್ಕೆ ಕಾರಣ:

```swift
@State private var amount = 0
```

SwiftUI ಯಲ್ಲಿ, view ರಚನೆಯಾಗುವ ಪ್ರತಿಸಾರಿ `@State` variable ಮತ್ತೆ initialize ಆಗುತ್ತದೆ.

`UserDefaults` ನಲ್ಲಿ `amount` save ಆಗಿದ್ದರೂ, view reload ಆದಾಗ `amount` ಮತ್ತೆ 0 ಆಗುತ್ತದೆ.

ಇದರ ಅರ್ಥ ಈಗ data ಅನ್ನು `UserDefaults` ಗೆ save ಮಾಡಿದಷ್ಟೇ, view ಯಲ್ಲಿ ಅದನ್ನು restore ಮಾಡಿಲ್ಲ.

ಹೀಗಾಗಿ, view load ಆಗುವಾಗ `UserDefaults` ನಿಂದ data ಓದಿ, ಮತ್ತೆ `amount` ಗೆ assign ಮಾಡಬೇಕು. ಆಗ ಮಾತ್ರ ಪೂರ್ಣ persistence logic ಸಿದ್ಧವಾಗುತ್ತದೆ.

### ತರ್ಕಕ್ಕೆ ಹೋಲಿಕೆ

ಈ ಪ್ರಕ್ರಿಯೆಯನ್ನು "ತರಗತಿಯ blackboard" ಗೆ ಹೋಲಿಸಬಹುದು:

ಪಾಠ ನಡೆಯುವಾಗ, ಶಿಕ್ಷಕರು blackboard ಮೇಲೆ ವಿಷಯ ಬರೆಯುತ್ತಾರೆ. ಇದು current view ಯ state (`@State`) ಹಾಗೆ.

ಪಾಠ ಮುಗಿದಾಗ, ಮುಂದಿನ ತರಗತಿಗಾಗಿ blackboard ಅನ್ನು ಅಳಿಸಿಬಿಡಲಾಗುತ್ತದೆ. ಇದು view destroy ಆದಾಗ `@State` data clear ಆಗುವುದಕ್ಕೆ ಸಮಾನ.

ಪಾಠದ ವಿಷಯ ಕಳೆದುಹೋಗದಂತೆ ಶಿಕ್ಷಕರು ಮೊದಲು ಅದನ್ನು lesson notes ನಲ್ಲಿ save ಮಾಡುತ್ತಾರೆ. ಆ notes ಗಳು `UserDefaults` ಗೆ ಸಮಾನ.

ಮುಂದಿನ ಪಾಠ ಶುರುವಾಗುವಾಗ, blackboard ಪ್ರಾರಂಭದಲ್ಲಿ ಖಾಲಿಯಾಗಿರುತ್ತದೆ (`@State` initialize ಆಗಿದೆ). ಶಿಕ್ಷಕರು ಆ lesson notes ನೋಡಿ ಹಿಂದಿನ ವಿಷಯವನ್ನು ಮತ್ತೆ blackboard ಮೇಲೆ ಬರೆಯಬೇಕು (`UserDefaults` ಓದುವುದು).

ಗಮನಿಸಬೇಕಾದದ್ದು, blackboard ಹಿಂದಿನ content ಅನ್ನು ಸ್ವಯಂ restore ಮಾಡುವುದಿಲ್ಲ; "lesson notes ಓದುವುದು" (`UserDefaults` ಓದುವುದು) ಎಂಬ ಹಂತ ಅಗತ್ಯ.

## onAppear ಬಳಸಿ data ಓದುವುದು

view ತೋರಿದಾಗ, `UserDefaults` ನಿಂದ value ಅನ್ನು ಕೈಯಾರೆ ಓದಿ, ಅದನ್ನು `@State` ಯ `amount` variable ಗೆ assign ಮಾಡಬೇಕು. ಇದರಿಂದ ನಿಜವಾದ persistence ಸಾಧ್ಯವಾಗುತ್ತದೆ.

SwiftUI ಯಲ್ಲಿ, `onAppear` ಬಳಸಿ view ತೋರಿದಾಗ initialization logic ನಡೆಸಬಹುದು:

```swift
.onAppear {}
```

`UserDefaults` ಓದುವ code ಅನ್ನು `onAppear` ಒಳಗೆ ಇಡೋಣ:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

view ರಚನೆಯಾದಾಗ `amount` ಮೊದಲು 0 ಆಗಿ initialize ಆಗುತ್ತದೆ. view ತೋರಿದಾಗ `onAppear` trigger ಆಗಿ, `UserDefaults` ನಿಂದ value ಓದಿ `amount` ಗೆ assign ಮಾಡುತ್ತದೆ. ಹೀಗಾಗಿ view ಕೊನೆಯದಾಗಿ save ಮಾಡಿದ total amount ಅನ್ನು ತೋರಿಸಬಹುದು.

ಈಗ "ಹುಂಡಿ" ಯ data persistence logic ಸಂಪೂರ್ಣವಾಗುತ್ತದೆ.

## ಪೂರ್ಣ ಕೋಡ್

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage property wrapper

SwiftUI `@AppStorage` property wrapper ಅನ್ನು ಒದಗಿಸುತ್ತದೆ. ಇದು `UserDefaults` save logic ಅನ್ನು ಸರಳಗೊಳಿಸುತ್ತದೆ.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` ಎಂದರೆ `UserDefaults` ಮೇಲೆ ಮಾಡಿರುವ ಒಂದು wrapper. ಇಲ್ಲಿ `"amount"` ಎಂಬುದು `UserDefaults` ನ Key.

view ರಚನೆಯಾಗುವಾಗ, ಇದು `UserDefaults` ನಿಂದ data ಓದುತ್ತದೆ; variable ಬದಲಾಗುವಾಗ, ಅದನ್ನು ಸ್ವಯಂ `UserDefaults` ಗೆ write ಮಾಡುತ್ತದೆ.

ಇದು SwiftUI ಯ state update mechanism ನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ. `@State` ಹಾಗೆಯೇ, value ಬದಲಾಗುವಾಗ SwiftUI view refresh ಆಗುತ್ತದೆ.

ಅಂದರೆ, `@AppStorage` data read ಮತ್ತು save ಎರಡನ್ನೂ ನಿರ್ವಹಿಸುತ್ತದೆ. ಹೀಗಾಗಿ ಕೈಯಾರೆ `UserDefaults` call ಮಾಡುವ ಅಗತ್ಯವಿಲ್ಲ; `onAppear` ಬಳಸಿ data ಓದುವ ಅಗತ್ಯವೂ ಇಲ್ಲ.

ಆದ್ದರಿಂದ, ನಾವು `UserDefaults` logic ಅನ್ನು `@AppStorage` ಮೂಲಕ ಬದಲಾಯಿಸಬಹುದು:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## ಸಂಗ್ರಹ

ಈ ಪಾಠದಲ್ಲಿ ನಾವು ಮುಖ್ಯವಾಗಿ ಈ ವಿಷಯಗಳನ್ನು ಕಲಿತಿದ್ದೇವೆ:

ಮೊದಲು, `UserDefaults` ಅನ್ನು ಹಗುರವಾದ data ಉಳಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ನಾವು total amount ಅನ್ನು device ನಲ್ಲಿ ಉಳಿಸಲು `UserDefaults` ಬಳಸಿದ್ದೇವೆ. `UserDefaults` data read ಮತ್ತು write methods ಒದಗಿಸುತ್ತದೆ; ಜೊತೆಗೆ Optional types ಮುಂತಾದ ಪರಿಸ್ಥಿತಿಗಳನ್ನೂ ನಿರ್ವಹಿಸಬೇಕು.

ಮುಂದೆ, `@State` variable ಕೇವಲ view ಯ ತಾತ್ಕಾಲಿಕ state ನಿರ್ವಹಿಸಲು ಮಾತ್ರ. ಅದರ lifecycle view ಗೆ ಸಮಾನ. view ಮತ್ತೆ ರಚನೆಯಾದಾಗ `@State` ಮತ್ತೊಮ್ಮೆ initialize ಆಗುತ್ತದೆ.

`UserDefaults` ನ data restore ಮಾಡುವಾಗ, `onAppear` ಬಳಸಿ view ತೋರಿದಾಗ `UserDefaults` ಓದಿ data restore ಮಾಡುವುದನ್ನೂ ಕಲಿತಿದ್ದೇವೆ.

ಕೊನೆಗೆ, `UserDefaults` ಬದಲಿಗೆ `@AppStorage` ಬಳಸುವುದನ್ನು ನೋಡಿದೆವು. ಇದರ ಮೂಲಕ view load ಆಗುವಾಗ data ಸ್ವಯಂ ಓದಲ್ಪಡುತ್ತದೆ, value ಬದಲಾಗುವಾಗ ಸ್ವಯಂ write ಆಗುತ್ತದೆ. ಇದರಿಂದ ಕೈಯಾರೆ `UserDefaults` ಮತ್ತು `onAppear` logic ಬರೆಯುವ ಅಗತ್ಯವಿಲ್ಲ.

ಈ ಜ್ಞಾನಗಳ ಮೂಲಕ, ಮೂಲಭೂತ app data storage function ನಿರ್ಮಿಸಿ, data ಅನ್ನು ಶಾಶ್ವತವಾಗಿ ಉಳಿಸಬಹುದು.

## ಪಾಠಾನಂತರ ಅಭ್ಯಾಸ

ಈಗ, "ಹುಂಡಿ" ಗೆ amount save ಮಾಡುವ ಸಾಮರ್ಥ್ಯ ಬಂದಿದೆ, ಆದರೆ functionality ಇನ್ನೂ ಸಂಪೂರ್ಣವಾಗಿಲ್ಲ.

1. ಬಳಕೆದಾರರು ಹಣವನ್ನು ತೆಗೆದುಕೊಳ್ಳಬೇಕಾದರೆ, ಅದಕ್ಕಾಗಿ ಸಂಬಂಧಿಸಿದ withdraw logic ರೂಪಿಸಬೇಕು。
2. ಬಳಕೆದಾರರು amount clear ಮಾಡಬೇಕೆಂದಿದ್ದರೂ, reset logic ಕೂಡ ಬೇಕಾಗುತ್ತದೆ。
3. "ಹುಂಡಿ" ಗೆ ಹೆಸರನ್ನು ಕೊಡಬೇಕೆಂದರೆ, `String` type data ಉಳಿಸುವಿಕೆಯನ್ನೂ ಸೇರಿಸಬೇಕು。

ಈ feature ಗಳನ್ನು ಇರುವ code ಆಧರಿಸಿ ಪೂರಕವಾಗಿ ಸೇರಿಸಿದರೆ, "ಹುಂಡಿ" ಇನ್ನಷ್ಟು ಸಂಪೂರ್ಣವಾಗುತ್ತದೆ.

## ವಿಸ್ತೃತ ಜ್ಞಾನ - input field default value ಸಮಸ್ಯೆ

ಈಗ, input interaction ಅನ್ನು ಇನ್ನಷ್ಟು optimize ಮಾಡಬಹುದು; ಇದರಿಂದ input ಅನುಭವ ಮತ್ತಷ್ಟು ಸುಲಭವಾಗುತ್ತದೆ.

![textfield](../../Resource/015_view.png)

ಪ್ರಸ್ತುತ implementation ನಲ್ಲಿ input field ನ default value 0. ಬಳಕೆದಾರರು ಪ್ರತಿ ಬಾರಿ amount ನಮೂದಿಸುವಾಗ ಮೊದಲು 0 ಅಳಿಸಿ ನಂತರ ಹೊಸ value ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ. ಇದು ಉತ್ತಮ interaction ಅನುಭವವಲ್ಲ.

input field ನ ಆರಂಭಿಕ value ಖಾಲಿಯಾಗಿರಬೇಕು, 0 ಅಲ್ಲ.

ಇದಕ್ಕೆ ಕಾರಣ, `TextField` ಮತ್ತು `number` ಎರಡು-ದಿಕ್ಕಿನ binding ಹೊಂದಿವೆ:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

`number` 0 ಆಗಿ initialize ಆಗಿದ್ದರೆ, input field ಕೂಡ 0 ತೋರಿಸುತ್ತದೆ.

ಹೀಗಾಗಿ, `number` ಅನ್ನು ಖಾಲಿ value ಗೆ, ಅಂದರೆ `nil` ಗೆ ಬದಲಾಯಿಸಬೇಕು.

```swift
@State private var number = nil
```

ಈಗ error ಬರುತ್ತದೆ:

```
Generic parameter 'Value' could not be inferred
```

ಇದೇ ನಾವು "ಪ್ರಕಾರ ವ್ಯವಸ್ಥೆ" ಯಲ್ಲಿ ಕಂಡ ಸ್ಥಿತಿ: compiler ಗೆ variable type ಅನ್ನು ಸ್ವಯಂ inference ಮಾಡಲು ಸಾಧ್ಯವಾಗದಿದ್ದರೆ, explicit type declaration ಅಗತ್ಯವಾಗುತ್ತದೆ.

ಏಕೆಂದರೆ ನಾವು `number` ಅನ್ನು `nil` ಆಗಿ ಹೊಂದಿಸಿದ್ದೇವೆ. ಆದರೆ `nil` ತಾನೇ ಯಾವ type ಮಾಹಿತಿಯನ್ನೂ ಹೊಂದಿರುವುದಿಲ್ಲ. compiler ಗೆ ಅದು `String`, `Int`, ಅಥವಾ ಬೇರೆ ಏನಾದರೂ type ಎನ್ನುವುದನ್ನು ತಿಳಿಯಲು ಸಾಧ್ಯವಿಲ್ಲ; ಆದ್ದರಿಂದ error ಬರುತ್ತದೆ.

ಹೀಗಾಗಿ `number` ಗೆ explicit type declaration ಕೊಡುವುದು ಅನಿವಾರ್ಯ:

```swift
@State private var number:Int? = nil
```

ಇಲ್ಲಿ `Int?` ಎಂದರೆ Optional type. ಅಂದರೆ `number` value `Int` ಆಗಿರಬಹುದು ಅಥವಾ `nil` ಆಗಿರಬಹುದು.

ಇದರ ಮೂಲಕ, initialization ವೇಳೆ `nil` ಇಟ್ಟರೆ input field ಖಾಲಿಯಾಗಿ ಕಾಣುತ್ತದೆ; 0 ಕಾಣಿಸುವುದಿಲ್ಲ.

### Optional ಅನ್ನು unwrap ಮಾಡುವುದು

`number` ಅನ್ನು Optional type ಆಗಿ ಬದಲಿಸಿದ ನಂತರ, ಹಿಂದಿನ ಲೆಕ್ಕಾಚಾರ code error ಕೊಡುತ್ತದೆ:

```swift
amount += number
```

ಎಚ್ಚರಿಕೆ:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

ಇದಕ್ಕೆ ಕಾರಣ, `number` ಈಗ `nil` ಆಗಿರಬಹುದು. ಅದನ್ನು ನೇರವಾಗಿ ಲೆಕ್ಕಾಚಾರದಲ್ಲಿ ಬಳಸಿದರೆ, ಅದು:

```swift
amount += nil
```

ಎಂಬಂತಾಗುತ್ತದೆ.

ಸ್ಪಷ್ಟವಾಗಿ, `nil` ಅನ್ನು `amount` ಜೊತೆ ಸೇರಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ; ಇದು ಮಾನ್ಯ operation ಅಲ್ಲ.

ಆದ್ದರಿಂದ, Optional type ಅನ್ನು ಲೆಕ್ಕಾಚಾರದಲ್ಲಿ ಬಳಸುವುದಕ್ಕೂ ಮುನ್ನ ಅದನ್ನು unwrap ಮಾಡಬೇಕು.

ಇಲ್ಲಿ `??` ಬಳಸಿ default value ಒದಗಿಸಬಹುದು:

```swift
amount += number ?? 0
```

`number` `nil` ಆಗಿದ್ದರೆ default value 0 ಬಳಸುತ್ತದೆ; `number` ಗೆ value ಇದ್ದರೆ, ಬಳಕೆದಾರರು ನಮೂದಿಸಿದ ನಿಜವಾದ data ಬಳಸುತ್ತದೆ.

ಇದರ ಮೂಲಕ ಲೆಕ್ಕಾಚಾರ ಸರಿಯಾಗಿಯೂ ಇರುತ್ತದೆ, ಜೊತೆಗೆ input field default ಆಗಿ ಖಾಲಿಯಾಗಿರುವ ಪರಿಣಾಮವನ್ನೂ ಪಡೆಯಬಹುದು. ಹೀಗಾಗಿ ಬಳಕೆದಾರರು input field ನ 0 ಅನ್ನು ಪ್ರತಿ ಬಾರಿ ಕೈಯಾರೆ ಅಳಿಸಲು ಅಗತ್ಯವಿಲ್ಲ.

## ವಿಸ್ತೃತ ಕೋಡ್

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
