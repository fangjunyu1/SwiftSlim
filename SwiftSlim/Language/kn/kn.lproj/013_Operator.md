# ಆಪರೇಟರ್

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು Swift ಆಪರೇಟರ್‌ಗಳನ್ನು (Operators) ಕಲಿಯುತ್ತೇವೆ.

ನಾವು ಲೆಕ್ಕಾಚಾರ ಮಾಡಬೇಕಾದಾಗ, ಹೋಲಿಕೆ ಮಾಡಬೇಕಾದಾಗ ಅಥವಾ ತಾರ್ಕಿಕ ನಿರ್ಣಯ ಕೈಗೊಳ್ಳಬೇಕಾದಾಗ, ಆಪರೇಟರ್‌ಗಳನ್ನು ಬಳಸಬೇಕು. ಇಂತಹ ಕಾರ್ಯಗಳು ಪ್ರೋಗ್ರಾಂ ಕಾರ್ಯಗತಗೊಳ್ಳುವ ಪ್ರತಿಯೊಂದು ಹಂತದಲ್ಲೂ ಕಾಣಿಸಿಕೊಳ್ಳುತ್ತವೆ ಮತ್ತು programming ನ ಅತ್ಯಂತ ಮೂಲಭೂತ ಸಾಮರ್ಥ್ಯಗಳಲ್ಲಿ ಒಂದಾಗಿವೆ.

```swift
let a = 100 * 8
```

Programming ಕಲಿಕೆಯ ಸಮಯದಲ್ಲಿ ಅನೇಕರು ಗಮನಿಸುವ ಸಂಗತಿಯೇನಂದರೆ: ಒಂದು ಮಟ್ಟದ ಗಣಿತ ಚಿಂತನೆ ಹೊಂದಿರುವವರು program logic ಅನ್ನು ಹೆಚ್ಚಿನ ಸುಲಭತೆಯಿಂದ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತಾರೆ. ಇದಕ್ಕೆ ಕಾರಣ programming ನ ಮೂಲಭೂತ ಸ್ವಭಾವದಲ್ಲೇ "ಲೆಕ್ಕಾಚಾರ" ಮತ್ತು "ನಿಯಮ ಆಧಾರಿತ ನಿರ್ಧಾರ" ಸೇರಿರುವುದು. ಆಪರೇಟರ್‌ಗಳೇ ಈ ಎರಡರ ಕೇಂದ್ರ ಸಾಧನಗಳು.

ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ಆಪರೇಟರ್‌ಗಳನ್ನು ಕೇವಲ ಸರಳ ಸಂಖ್ಯೆ ಲೆಕ್ಕಾಚಾರಕ್ಕಷ್ಟೇ ಅಲ್ಲ, ಅನೇಕ ನೈಜ ಸಂದರ್ಭಗಳಲ್ಲಿ ವ್ಯಾಪಕವಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, block game ನಲ್ಲಿ ಬಳಕೆದಾರನು ಒಂದು block ಅನ್ನು ನಿಗದಿತ ಸ್ಥಾನಕ್ಕೆ ಎಳೆದಾಗ, ನಾವು ಹೀಗೆ ಲೆಕ್ಕಿಸಬೇಕು:

- block ನ ಸಂಯೋಜಕ ಸ್ಥಾನ
- block ತುಂಬಬಹುದಾದ ಸ್ಥಳ
- ಗುರಿ ಸ್ಥಾನ ಲಭ್ಯವಿದೆಯೇ ಎಂಬ ನಿರ್ಣಯ

ಈ "ಲೆಕ್ಕ + ನಿರ್ಧಾರ" ಪ್ರಕ್ರಿಯೆಗಳ ಮೂಲದಲ್ಲೆಲ್ಲಾ ಆಪರೇಟರ್‌ಗಳೇ ಇರುತ್ತವೆ.

![Block](../../Resource/013_block.png)

ಆಪರೇಟರ್‌ಗಳನ್ನು ಕಲಿಯುವುದು ಎಂದರೆ ಕೇವಲ ಸಂಖ್ಯಾ ಲೆಕ್ಕಾಚಾರ ಕಲಿಯುವುದಲ್ಲ; ಮುಂದಿನ interface layout, data processing ಮತ್ತು interaction logic ಗಳಿಗೆ ಬಲವಾದ ನೆಲೆಯನ್ನು ಹಾಕುವುದಾಗಿದೆ.

## SwiftUI ಯಲ್ಲಿ ಲೆಕ್ಕಾಚಾರವನ್ನು ಕಾರ್ಯಗತಗೊಳಿಸುವ ವಿಧಾನ

SwiftUI ಯಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ `Button` ಮೂಲಕ function ಅನ್ನು trigger ಮಾಡುತ್ತೇವೆ, ನಂತರ ಆ function ಒಳಗೆ operation logic ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತೇವೆ.

ಉದಾಹರಣೆಗೆ:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ, Console ನಲ್ಲಿ ಹೀಗಾಗಿ output ಕಾಣುತ್ತದೆ:

```
c: 20
```

ಈ ಪಾಠದಲ್ಲಿ operation logic ಅನ್ನು function ಒಳಗೆ ಬರೆಯುತ್ತೇವೆ, button ಮೂಲಕ ಅದನ್ನು trigger ಮಾಡುತ್ತೇವೆ ಮತ್ತು `print` ಮೂಲಕ ಫಲಿತಾಂಶ ತೋರಿಸುತ್ತೇವೆ.

ಮುಂದಿನ ಉದಾಹರಣೆಗಳಲ್ಲಿ, ಕೋಡ್ ಸರಳವಾಗಿರಲೆಂದು ನಾವು ಲೆಕ್ಕಾಚಾರದ ಫಲಿತಾಂಶವನ್ನು ನೇರವಾಗಿ code comments ನಲ್ಲಿ ಸೂಚಿಸುತ್ತೇವೆ; `print` ಅನ್ನು ಪ್ರತಿ ಬಾರಿ ಮರುಬಳಸುವುದಿಲ್ಲ.

## Console output ನಿರ್ವಹಣೆ

ಪ್ರತಿ ಬಾರಿ click ಮಾಡಿದಾಗ output ಉಂಟಾಗುವುದರಿಂದ, Console ಪ್ರದೇಶದ ಕೆಳ ಬಲಭಾಗದಲ್ಲಿರುವ clear button ಒತ್ತಿ ಹಿಂದಿನ logs ಅನ್ನು ತೊಳೆದುಹಾಕಬಹುದು. ಇದರಿಂದ current result ನೋಡಲು ಸುಲಭವಾಗುತ್ತದೆ.

![Console](../../Resource/013_console.png)

## Button ಬರೆಯುವ ಮತ್ತೊಂದು ವಿಧಾನ

button ಕೇವಲ ಒಂದು function ಅನ್ನು ಮಾತ್ರ ಚಾಲನೆಗೊಳಿಸುತ್ತಿದ್ದರೆ, ಇನ್ನಷ್ಟು ಸಂಕ್ಷಿಪ್ತವಾದ ಬರಹವನ್ನು ಬಳಸಬಹುದು:

```swift
Button(action: ) {
    // View
}
```

ಈ ಬರಹದಲ್ಲಿ `action` ಎಂದರೆ button click ಆದಾಗ ಕಾರ್ಯಗತವಾಗುವ function (ಪ್ಯಾರಾಮೀಟರ್ ಇಲ್ಲದ function), ಮತ್ತು `{}` ಒಳಗೆ button view ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಲಾಗುತ್ತದೆ.

ಹಿಂದಿನ `calculate` function ಜೊತೆ ಸೇರಿಸಿ ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
Button(action: calculate) {
    Text("Button")
}
```

button click ಆದಾಗ, `calculate` function ನೇರವಾಗಿ ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ.

ಹೀಗಾಗಿ button logic ಸರಳವಾಗಿದ್ದು, ಒಂದೇ function ಅನ್ನು call ಮಾಡುವ ಸಂದರ್ಭಗಳಲ್ಲಿ `action` ಬರಹ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗಿರುತ್ತದೆ ಮತ್ತು code convention ಗೆ ಇನ್ನಷ್ಟು ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ.

## ಅಂಕಗಣಿತ ಆಪರೇಟರ್‌ಗಳು

Arithmetic Operators ಅನ್ನು ಸಂಖ್ಯಾ ಲೆಕ್ಕಾಚಾರಕ್ಕಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ:

- `+` ಸೇರ್ಪಡೆ
- `-` ವ್ಯತ್ಯಾಸ
- `*` ಗುಣಾಕಾರ
- `/` ಭಾಗಾಕಾರ
- `%` ಶೇಷ (remainder)

ಉದಾಹರಣೆ:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

ಗಮನಿಸಬೇಕಾದದ್ದು: Swift ಒಂದು strongly typed language. ಇದು ವಿಭಿನ್ನ data types ಗಳನ್ನು ಸ್ವಯಂ ಮಿಶ್ರಣ ಮಾಡುವುದಿಲ್ಲ:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

ಎರಡು values ಗಳ type ಬೇರೆಬೇರೆ ಇದ್ದರೆ, ಮೊದಲು ಕೈಯಾರೆ type conversion ಮಾಡಬೇಕು.

## ಹೋಲಿಕೆ ಆಪರೇಟರ್‌ಗಳು

Comparison Operators ಅನ್ನು ಎರಡು values ಗಳ ನಡುವಿನ ಸಂಬಂಧವನ್ನು ಪರಿಶೀಲಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಫಲಿತಾಂಶ `Bool` ಆಗಿರುತ್ತದೆ:

- `==` ಸಮಾನ
- `!=` ಸಮಾನವಲ್ಲ
- `>` ದೊಡ್ಡದು
- `<` ಚಿಕ್ಕದು
- `>=` ದೊಡ್ಡದು ಅಥವಾ ಸಮಾನ
- `<=` ಚಿಕ್ಕದು ಅಥವಾ ಸಮಾನ

ಉದಾಹರಣೆ:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Comparison operators ಬಹುಮಟ್ಟಿಗೆ conditional statements ಗಳಲ್ಲಿ ಬಳಸಲಾಗುತ್ತವೆ. ಉದಾಹರಣೆಗೆ, "ಉಲ್ಲೇಖ ಕ್ಯಾರಸೆಲ್" ನಲ್ಲಿ index array ವ್ಯಾಪ್ತಿಯನ್ನು ಮೀರದಂತೆ ನಿಯಂತ್ರಿಸಲು:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

`index` `sayings.count - 1` ಕ್ಕಿಂತ ಚಿಕ್ಕದಿದ್ದರೆ, comparison ಫಲಿತಾಂಶ true ಆಗಿ `if` statement ಒಳಗಿನ code ನಡೆಯುತ್ತದೆ; false ಆಗಿದ್ದರೆ ನಂತರದ code ನಡೆಯುವುದಿಲ್ಲ.

## ತಾರ್ಕಿಕ ಆಪರೇಟರ್‌ಗಳು

Logical Operators ಅನ್ನು ಅನೇಕ conditions ಗಳನ್ನು ಸಂಯೋಜಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ:

- `&&` ಮತ್ತು (AND)
- `||` ಅಥವಾ (OR)
- `!` ಅಲ್ಲ (NOT)

### && ಮತ್ತು

ಹಲವಾರು conditions ಗಳು ಒಂದೇ ಸಮಯದಲ್ಲಿ ಸತ್ಯವಾಗಿರಬೇಕು ಎಂದರೆ `&&` ಬಳಸಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

ಈ ಕೋಡ್‌ನಲ್ಲಿ ಎರಡು conditions ಇವೆ: `age >= 18` ಮತ್ತು `age <= 100`.

ಈ ಎರಡೂ true ಆಗಿದ್ದಾಗ ಮಾತ್ರ `legalAge` true ಆಗುತ್ತದೆ; ಒಂದಾದರೂ false ಆಗಿದ್ದರೆ ಫಲಿತಾಂಶ false.

### || ಅಥವಾ

ಹಲವಾರು conditions ಗಳಲ್ಲಿ ಒಂದೇ ಒಂದು ಸತ್ಯವಾಗಿದ್ದರೆ ಸಾಕಾದರೆ `||` ಬಳಸಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

ಈ ಕೋಡ್ ಅರ್ಥ: `money >= 50` ಅಥವಾ `creditCard >= 50` इनमें ಯಾವುದಾದರೂ ಒಂದು ಸತ್ಯವಾಗಿದ್ದರೆ `payAllowed` true ಆಗುತ್ತದೆ.

ಎರಡೂ conditions false ಆಗಿದ್ದಾಗ ಮಾತ್ರ ಫಲಿತಾಂಶ false.

ಉದಾಹರಣೆಗೆ, payment ಸಂದರ್ಭದಲ್ಲಿ ನಗದು ಅಥವಾ credit card ಎರಡರಲ್ಲಿ ಯಾವುದನ್ನಾದರೂ ಬಳಸಬಹುದು. ಎರಡೂ ಸಾಧ್ಯವಾಗದಿದ್ದರೆ payment ವಿಫಲ.

### ! ಅಲ್ಲ

`!` ಎಂದರೆ logical NOT operator. ಇದು `Bool` value ಅನ್ನು ತಿರುಗಿಸುತ್ತದೆ.

ಸರಳವಾಗಿ ಹೇಳುವುದಾದರೆ, `!` true ಅನ್ನು false ಆಗಿ, false ಅನ್ನು true ಆಗಿ ಮಾಡುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
let allowed = true
let result = !allowed   // false
```

ಇಲ್ಲಿ `!allowed` ಎಂದರೆ `allowed` ಮೌಲ್ಯವನ್ನು ತಿರುಗಿಸುವುದು.

ಗಮನಿಸಿ, `!` ಮತ್ತು `!=` ಎರಡು ಬೇರೆಬೇರೆ ಆಪರೇಟರ್‌ಗಳು. `!` ಒಂದು `Bool` ಮೌಲ್ಯವನ್ನು negate ಮಾಡುತ್ತದೆ; `!=` ಒಂದು comparison operator ಆಗಿದ್ದು `Bool` ಹಿಂತಿರುಗಿಸುತ್ತದೆ.

## ಅಸೈನ್‌ಮೆಂಟ್ ಆಪರೇಟರ್‌ಗಳು

Assignment Operators ಅನ್ನು value assign ಮಾಡಲು ಅಥವಾ variable update ಮಾಡಲು ಬಳಸಲಾಗುತ್ತದೆ:

- `=` ಅಸೈನ್ ಮಾಡುವುದು

variable declaration ಅಥವಾ ಲೆಕ್ಕಾಚಾರ ಪ್ರಕ್ರಿಯೆಯಲ್ಲಿ assignment ಸಾಮಾನ್ಯವಾಗಿದೆ:

```swift
let a = 5
```

ಈ ಕೋಡ್ ಅರ್ಥ: value `5` ಅನ್ನು variable `a` ಗೆ assign ಮಾಡಲಾಗಿದೆ.

### ಸಂಯುಕ್ತ assignment ಆಪರೇಟರ್‌ಗಳು

ನೈಜ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಮೂಲ assignment operator ಹೊರತಾಗಿಯೂ "compound assignment operators" ಅನ್ನು ತುಂಬಾ ಬಳಸಲಾಗುತ್ತದೆ. ಇವು ಮೂಲ ಮೌಲ್ಯವನ್ನು ಆಧರಿಸಿ ನೇರವಾಗಿ ಲೆಕ್ಕಾಚಾರ ಮಾಡಿ update ಮಾಡುತ್ತವೆ:

- `+=`
- `-=`
- `*=`
- `/=`

ಹಿಂದಿನ "counter" ಪಾಠದಲ್ಲಿ ನಾವು compound assignment operators ಬಗ್ಗೆ ಚುಕ್ಕಾಣಿ ಮಟ್ಟದಲ್ಲಿ ನೋಡಿದ್ದೇವೆ.

ಉದಾಹರಣೆಗೆ, button ಒತ್ತಿದಾಗ variable ಸ್ವಯಂ ಹೆಚ್ಚಾಗುವಂತೆ:

```swift
var num = 10
num += 5   // num = 15
```

ಈ ಕೋಡ್ ಅರ್ಥ: `num` ಮತ್ತು `5` ಗಳನ್ನು ಸೇರಿಸಿ, ಫಲಿತಾಂಶವನ್ನು ಮತ್ತೆ `num` ಗೆ assign ಮಾಡುವುದು.

ಆದ್ದರಿಂದ ಇದು ಕೆಳಗಿನ ಬರಹಕ್ಕೆ ಸಮಾನ:

```swift
var num = 10
num = num + 5   // num = 15
```

## ತ್ರಿಕ ಆಪರೇಟರ್

Swift ನ ternary operator ಒಂದು condition ಆಧರಿಸಿ ಎರಡು ಫಲಿತಾಂಶಗಳಲ್ಲಿ ಒಂದನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ:

```swift
condition ? value1 : value2
```

ಇದರ ಕಾರ್ಯವಿಧಾನ: condition true ಆಗಿದ್ದರೆ "value1" ಹಿಂತಿರುಗುತ್ತದೆ; false ಆಗಿದ್ದರೆ "value2" ಹಿಂತಿರುಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

ಈ ಕೋಡ್ `showColor` ಮೌಲ್ಯವನ್ನು ಪರೀಕ್ಷಿಸುತ್ತದೆ. true ಆಗಿದ್ದರೆ `Color.blue` ಹಿಂತಿರುಗುತ್ತದೆ ಮತ್ತು ಹಿನ್ನೆಲೆ ನೀಲಿಯಾಗುತ್ತದೆ; false ಆಗಿದ್ದರೆ `Color.clear` ಹಿಂತಿರುಗುತ್ತದೆ ಮತ್ತು ಹಿನ್ನೆಲೆ ಬಣ್ಣ ತೋರಿಸುವುದಿಲ್ಲ.

ಸೂಚನೆ: `Color.clear` ಎಂದರೆ ಪಾರದರ್ಶಕ ಬಣ್ಣ (ಯಾವುದೂ ಕಾಣಿಸದು).

### if-else ಜೊತೆಗೆ ಇರುವ ವ್ಯತ್ಯಾಸ

ತಾರ್ಕಿಕವಾಗಿ ternary operator, `if-else` statement ಗೆ ಸಮಾನ.

ಉದಾಹರಣೆಗೆ, ಮೇಲಿನ ಕೋಡ್ ಅನ್ನು ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

ಈ ಎರಡರ ಕಾರ್ಯತತ್ವ ಒಂದೇ: condition true ಆಗಿದ್ದರೆ ಮೊದಲ ಫಲಿತಾಂಶ, false ಆಗಿದ್ದರೆ ಎರಡನೇ ಫಲಿತಾಂಶ.

ನೈಜ ಬಳಕೆಯಲ್ಲಿ ternary operator ಬರಹ ಹೆಚ್ಚು ಚುಟುಕಾಗಿರುತ್ತದೆ. "ಎರಡರಲ್ಲಿ ಒಂದು" ಎಂಬ ಸರಳ ನಿರ್ಧಾರವನ್ನು ವ್ಯಕ್ತಪಡಿಸಲು ಇದು ಸೂಕ್ತ, ವಿಶೇಷವಾಗಿ ಒಂದು value ಅನ್ನು ನೇರವಾಗಿ ಹಿಂತಿರುಗಿಸಬೇಕಾದಾಗ.

SwiftUI ಯ View ನಿರ್ಮಾಣದಲ್ಲಿ ternary operator ತುಂಬಾ ಸಾಮಾನ್ಯ. ಉದಾಹರಣೆಗೆ:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

ಈ ಬರಹದಲ್ಲಿ condition ಆಧರಿಸಿ view effect ಅನ್ನು ಒಂದೇ ಸಾಲಿನಲ್ಲಿ ಡೈನಾಮಿಕ್ ಆಗಿ ಬದಲಾಯಿಸಬಹುದು.

## ವ್ಯಾಪ್ತಿ ಆಪರೇಟರ್‌ಗಳು

Range Operators ಅನ್ನು ಒಂದು ಅಂತರವನ್ನು ಸೂಚಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ:

- `...` ಮುಚ್ಚಿದ ವ್ಯಾಪ್ತಿ (ಎರಡೂ ತುದಿಗಳೂ ಒಳಗೊಂಡಿವೆ)
- `..<` ಅರ್ಧ ತೆರೆದ ವ್ಯಾಪ್ತಿ (ಬಲ ತುದಿ ಒಳಗೊಂಡಿಲ್ಲ)

ಉದಾಹರಣೆಗೆ:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು, `1...3` ಅಂದರೆ 1 ರಿಂದ 3 ರವರೆಗೆ, 3 ಸಹ ಒಳಗೊಂಡಿದೆ. `5..<8` ಅಂದರೆ 5 ರಿಂದ 8 ರವರೆಗೆ, ಆದರೆ 8 ಒಳಗೊಂಡಿಲ್ಲ.

ವಿಸ್ತೃತ ರೂಪಗಳು (ತಿಳಿದುಕೊಳ್ಳಲು ಮಾತ್ರ):

```
5...    // >= 5
...5    // <= 5
```

ಈ ಬರಹ "one-sided range" ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ. ಇದು ಶರತ್ತು ನಿರ್ಧಾರ ಅಥವಾ pattern matching ನಲ್ಲಿ ಹೆಚ್ಚಾಗಿ ಕಾಣುತ್ತದೆ.

ಮುಂದೆ `for` loop ಕಲಿಯುವಾಗ range operators ಹೆಚ್ಚು ಬಳಕೆಯಾಗುತ್ತವೆ. ಈಗಕ್ಕೆ ಇದನ್ನು ನಿರಂತರ ಸಂಖ್ಯಾ ವ್ಯಾಪ್ತಿಯ ಸೂಚನೆ ಎಂದು ಅರ್ಥಮಾಡಿಕೊಂಡರೆ ಸಾಕು.

## ಆಪರೇಟರ್ ಅಭ್ಯಾಸ

ಈಗ ಕೆಲವು ಸರಳ ಉದಾಹರಣೆಗಳ ಮೂಲಕ view ಒಳಗೆ operators ನ ಪಾತ್ರವನ್ನು ಅಭ್ಯಾಸ ಮಾಡೋಣ.

### 1. ವಾಹನಗಳ ಒಟ್ಟು ಸಂಖ್ಯೆಯನ್ನು ಲೆಕ್ಕಿಸುವುದು

ಉದಾಹರಣೆಗೆ, ಒಂದು ಸಂಧಿಯಲ್ಲಿ ದಿನಕ್ಕೆ 500 ವಾಹನಗಳು ಸಾಗುತ್ತವೆ ಎಂದುಕೊಳ್ಳಿ. 30 ದಿನಗಳಲ್ಲಿ ಎಷ್ಟು ವಾಹನಗಳು ಸಾಗಿವೆ ಎಂದು ಲೆಕ್ಕಿಸೋಣ.

ಇದಕ್ಕಾಗಿ arithmetic operator ಬಳಸಬಹುದು:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

ಇಲ್ಲಿ ಲೆಕ್ಕಾಚಾರ ಸರಳ: ದಿನಕ್ಕೆ 500 ವಾಹನಗಳು, 30 ದಿನಗಳಿಗೆ 500 × 30, ಅಂತಿಮವಾಗಿ 15000 ವಾಹನಗಳು.

### 2. in-app purchase ಸದಸ್ಯತ್ವ ನಿರ್ಧಾರ

ಯಾರಾದರೂ permanent membership ಅಥವಾ subscription membership ಯಾವುದಾದರೂ ಒಂದನ್ನು ಹೊಂದಿದ್ದರೆ, ಅವನು/ಅವಳು member ಎಂದು ಪರಿಗಣಿಸಬಹುದು.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

ಈ ಕೋಡ್‌ನಲ್ಲಿ `||` (OR) operator ಬಳಸಲಾಗಿದೆ: `lifeTime = false` ಅಂದರೆ lifetime membership ಇಲ್ಲ; `subscription = true` ಅಂದರೆ subscription ಇದೆ.

ಒಂದು condition ಸಾಕಾಗುವುದರಿಂದ `isMember` true ಆಗುತ್ತದೆ. ಹೀಗಾಗಿ ಆ ವ್ಯಕ್ತಿ member.

## ಸಂಗ್ರಹ

Swift ನಲ್ಲಿ operators ಡೇಟಾ ಲೆಕ್ಕಾಚಾರ ಮತ್ತು ತಾರ್ಕಿಕ ನಿರ್ಧಾರಗಳ ಮೂಲ. `Text` content ತೋರಿಸುವಂತೆಯೇ, operators data ಯನ್ನೇ ಸಂಸ್ಕರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

ಸರಳ ಸಂಖ್ಯಾ ಲೆಕ್ಕಾಚಾರದಿಂದ ಹಿಡಿದು ಸಂಕೀರ್ಣ ತಾರ್ಕಿಕ ನಿರ್ಧಾರ, view state ನಿಯಂತ್ರಣ ಮತ್ತು layout ಲೆಕ್ಕಾಚಾರಗಳವರೆಗೆ operators ಅವಿಭಾಜ್ಯ ಭಾಗವಾಗಿವೆ.

ಬೇರೆಬೇರೆ ಸಂದರ್ಭಗಳ ಅಭ್ಯಾಸದ ಮೂಲಕ ಈ ಪಾಠದಲ್ಲಿ ಪರಿಚಯಿಸಿದ operators ಗಳಿಗೆ ನಿಧಾನವಾಗಿ ಪರಿಚಿತರಾಗಿ, ಅವನ್ನು ಚೆನ್ನಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು. ಇದು ಮುಂದಿನ ಅಧ್ಯಯನಕ್ಕೆ ಬಹಳ ಮುಖ್ಯವಾದ ನೆಲೆ.

### ವಿಸ್ತೃತ ಜ್ಞಾನ - ಬಿಟ್‌ವೈಸ್ ಆಪರೇಟರ್‌ಗಳು

ಇದರ ಜೊತೆಗೆ, Swift ಇನ್ನೂ ತಳಮಟ್ಟದ operators ಗಳೊಂದಿಗಿನ ಒಂದು ವರ್ಗವನ್ನೂ ಒದಗಿಸುತ್ತದೆ — Bitwise Operators:

- `&` (bitwise AND)
- `|` (bitwise OR)
- `^` (bitwise XOR)
- `~` (bitwise NOT)
- `>>` (right shift)
- `<<` (left shift)

ಉದಾಹರಣೆಗೆ:

```swift
let a = 6  // ದ್ವಿಮಾನ 110
let b = 3  // ದ್ವಿಮಾನ 011

print(a & b) // 2 (ದ್ವಿಮಾನ 010)
print(a | b) // 7 (ದ್ವಿಮಾನ 111)
print(a ^ b) // 5 (ದ್ವಿಮಾನ 101)
print(~a)    // -7 (bitwise NOT)
```

Swift ನಲ್ಲಿ integers ಗಳನ್ನು ಎರಡು ಪೂರಕದ (two's complement) binary ರೂಪದಲ್ಲಿ ಪ್ರತಿನಿಧಿಸಲಾಗುತ್ತದೆ. ಆದ್ದರಿಂದ bitwise NOT ಮಾಡಿದ ನಂತರ ಸಂಬಂಧಿತ negative result ಸಿಗುತ್ತದೆ.

Bitwise operators ನೇರವಾಗಿ binary ಮೇಲೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತವೆ. ಸಾಮಾನ್ಯವಾಗಿ ಇವು low-level data processing ಅಥವಾ performance optimization ಸಂದರ್ಭಗಳಲ್ಲಿ ಬಳಸಲಾಗುತ್ತವೆ.

ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ, ಈ ತರಹದ operators ಗಳ ಬಳಕೆ ಸಂದರ್ಭಗಳು ಕಡಿಮೆ. ಸಾಮಾನ್ಯ iOS ಅಥವಾ SwiftUI ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಇವು ಬಹಳ ಸಾಮಾನ್ಯವಲ್ಲ; ಆದ್ದರಿಂದ ಇಲ್ಲಿ ಆಳವಾದ ವಿವರಣೆ ನೀಡಲಾಗುವುದಿಲ್ಲ.

ಮುಂದೆ ಯಾವಾಗಲಾದರೂ low-level logic ಅಥವಾ performance optimization ವಿಚಾರಗಳಿಗೆ ಬರುವಾಗ, ಅವನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ಕಲಿಯಬಹುದು.
