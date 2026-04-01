# ਓਪਰੇਟਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ Swift ਦੇ operators ਸਿੱਖਾਂਗੇ।

ਜਦੋਂ ਅਸੀਂ ਗਿਣਤੀ ਕਰਦੇ ਹਾਂ, ਤੁਲਨਾ ਕਰਦੇ ਹਾਂ ਜਾਂ logic ਨਾਲ ਫੈਸਲਾ ਕਰਦੇ ਹਾਂ, ਤਾਂ ਸਾਨੂੰ operators ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ। ਇਹ ਕਾਰਵਾਈਆਂ program ਦੇ ਚੱਲਣ ਦੇ ਹਰ ਹਿੱਸੇ ਵਿੱਚ ਵਰਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ, ਅਤੇ programming ਦੀ ਸਭ ਤੋਂ ਬੁਨਿਆਦੀ ਸਮਰੱਥਾਵਾਂ ਵਿੱਚੋਂ ਇੱਕ ਹਨ।

```swift
let a = 100 * 8
```

Programming ਸਿੱਖਦੇ ਸਮੇਂ ਕਈ ਲੋਕ ਇਹ ਗੱਲ ਮਹਿਸੂਸ ਕਰਦੇ ਹਨ ਕਿ ਜਿਨ੍ਹਾਂ ਕੋਲ ਕੁਝ ਗਣਿਤਕ ਸੋਚ ਹੁੰਦੀ ਹੈ, ਉਹਨਾਂ ਲਈ program logic ਨੂੰ ਸਮਝਣਾ ਅਕਸਰ ਆਸਾਨ ਹੁੰਦਾ ਹੈ। ਇਸਦਾ ਕਾਰਣ ਇਹ ਹੈ ਕਿ programming ਦੀ ਮੂਲ ਪ੍ਰਕਿਰਿਆ “ਗਿਣਤੀ” ਅਤੇ “ਨਿਯਮਾਂ ਅਨੁਸਾਰ ਫੈਸਲਾ” ਤੋਂ ਅਲੱਗ ਨਹੀਂ ਹੈ, ਅਤੇ ਇਹੀ operators ਦੀ ਮੁੱਖ ਭੂਮਿਕਾ ਹੈ।

ਅਸਲ development ਵਿੱਚ, operators ਸਿਰਫ ਸਧਾਰਣ number calculation ਲਈ ਹੀ ਨਹੀਂ, ਸਗੋਂ ਕਈ ਖਾਸ scenarios ਵਿੱਚ ਵੀ ਵਿਆਪਕ ਤੌਰ 'ਤੇ ਵਰਤੇ ਜਾਂਦੇ ਹਨ।

ਉਦਾਹਰਨ ਵਜੋਂ, block game ਵਿੱਚ ਜਦੋਂ user ਇੱਕ block ਨੂੰ drag ਕਰਕੇ ਕਿਸੇ target position 'ਤੇ ਰੱਖਦਾ ਹੈ, ਤਾਂ ਸਾਨੂੰ ਇਹ ਗਿਣਣਾ ਪੈਂਦਾ ਹੈ:

* block ਦੀ coordinate position
* block ਕਿਹੜੀ ਜਗ੍ਹਾ fill ਕਰ ਸਕਦਾ ਹੈ
* target position ਵਰਤਣਯੋਗ ਹੈ ਜਾਂ ਨਹੀਂ

ਇਹ ਸਾਰੇ “ਗਿਣਤੀ + ਫੈਸਲਾ” ਵਾਲੇ processes ਅਸਲ ਵਿੱਚ operators 'ਤੇ ਹੀ ਆਧਾਰਿਤ ਹੁੰਦੇ ਹਨ।

![Block](../../Resource/013_block.png)

Operators ਨੂੰ ਸਿੱਖਣਾ ਸਿਰਫ number calculation ਸਿੱਖਣਾ ਨਹੀਂ ਹੈ, ਸਗੋਂ ਅੱਗੇ UI layout, data processing ਅਤੇ interaction logic ਲਈ ਇੱਕ ਮਜ਼ਬੂਤ ਬੁਨਿਆਦ ਤਿਆਰ ਕਰਨਾ ਵੀ ਹੈ।

## SwiftUI ਵਿੱਚ ਗਿਣਤੀ ਚਲਾਉਣ ਦਾ ਤਰੀਕਾ

SwiftUI ਵਿੱਚ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ Button ਰਾਹੀਂ ਇੱਕ function trigger ਕਰਦੇ ਹਾਂ, ਅਤੇ ਫਿਰ ਉਸ function ਵਿੱਚ calculation logic ਲਿਖਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

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

ਜਦੋਂ button 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ Console ਵਿੱਚ ਇਹ output ਆਉਂਦੀ ਹੈ:

```id="07xgmu"
c: 20
```

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਗਿਣਤੀ ਵਾਲੀ logic ਨੂੰ ਇਕਸਾਰ ਤੌਰ 'ਤੇ func ਵਿੱਚ ਲਿਖਾਂਗੇ, button ਰਾਹੀਂ ਉਸਨੂੰ trigger ਕਰਾਂਗੇ, ਅਤੇ print ਨਾਲ ਨਤੀਜੇ ਦਿਖਾਂਗੇ।

ਅਗਲੇ examples ਵਿੱਚ code ਨੂੰ ਹੋਰ ਸਧਾਰਣ ਰੱਖਣ ਲਈ, ਅਸੀਂ calculation ਦੇ results ਨੂੰ ਸਿੱਧੇ code ਵਿੱਚ ਹੀ comment ਰੂਪ ਵਿੱਚ ਦਰਸਾਵਾਂਗੇ, ਅਤੇ ਵਾਰ-ਵਾਰ print ਨਹੀਂ ਵਰਤਾਂਗੇ।

## Console output ਦਾ ਪ੍ਰਬੰਧਨ

ਕਿਉਂਕਿ ਹਰ click ਨਾਲ Console ਵਿੱਚ ਨਵਾਂ output ਆਉਂਦਾ ਹੈ, ਤੁਸੀਂ Console ਖੇਤਰ ਦੇ ਹੇਠਾਂ ਸੱਜੇ ਪਾਸੇ ਵਾਲੇ clear button 'ਤੇ click ਕਰਕੇ ਪੁਰਾਣੇ logs ਸਾਫ ਕਰ ਸਕਦੇ ਹੋ, ਤਾਂ ਜੋ ਮੌਜੂਦਾ result ਨੂੰ ਆਸਾਨੀ ਨਾਲ ਵੇਖਿਆ ਜਾ ਸਕੇ।

![Console](../../Resource/013_console.png)

## Button ਦੀ ਇੱਕ ਹੋਰ ਲਿਖਤ

ਜਦੋਂ Button ਸਿਰਫ ਇੱਕ ਹੀ function ਨੂੰ call ਕਰਦਾ ਹੋਵੇ, ਤਾਂ ਇੱਕ ਹੋਰ ਸੰਖੇਪ ਲਿਖਤ ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ:

```swift
Button(action: ) {
    // View
}
```

ਇਸ ਲਿਖਤ ਵਿੱਚ, action button click ਹੋਣ 'ਤੇ ਚੱਲਣ ਵਾਲੇ function ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ (ਬਿਨਾ parameter ਵਾਲਾ function), ਅਤੇ curly braces {} button ਦੇ view ਨੂੰ define ਕਰਦੀਆਂ ਹਨ।

ਉਪਰਲੇ calculate function ਨਾਲ ਜੋੜਕੇ, ਇਹ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Button(action: calculate) {
    Text("Button")
}
```

ਜਦੋਂ button 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ calculate function ਸਿੱਧਾ execute ਹੋ ਜਾਂਦਾ ਹੈ।

ਇਸ ਲਈ, ਜਦੋਂ button ਦੀ logic ਸਧਾਰਣ ਹੋਵੇ ਅਤੇ ਸਿਰਫ ਇੱਕ function ਨੂੰ call ਕਰਦੀ ਹੋਵੇ, ਤਾਂ action ਵਾਲੀ ਲਿਖਤ ਹੋਰ ਸਪੱਸ਼ਟ ਅਤੇ code convention ਦੇ ਹਿਸਾਬ ਨਾਲ ਹੋਰ ਵਧੀਆ ਹੁੰਦੀ ਹੈ।

## ਗਣਿਤਕ ਓਪਰੇਟਰ

Arithmetic operators ਦਾ ਵਰਤੋਂ number calculation ਲਈ ਹੁੰਦਾ ਹੈ:

* `+` ਜੋੜ
* `-` ਘਟਾਓ
* `*` ਗੁਣਾ
* `/` ਭਾਗ
* `%` ਬਾਕੀ (remainder)

ਉਦਾਹਰਨ:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

ਇੱਕ ਗੱਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ Swift ਇੱਕ strongly typed language ਹੈ, ਅਤੇ ਇਹ ਵੱਖ-ਵੱਖ data types ਨੂੰ ਆਪਣੇ ਆਪ mix ਨਹੀਂ ਕਰਦੀ:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

ਜਦੋਂ ਦੋ values ਦੀ type ਵੱਖਰੀ ਹੋਵੇ, ਤਾਂ ਸਾਨੂੰ ਹੱਥੋਂ type conversion ਕਰਨੀ ਪੈਂਦੀ ਹੈ।

## ਤੁਲਨਾਤਮਕ ਓਪਰੇਟਰ

Comparison operators ਦੋ values ਦੇ ਰਿਸ਼ਤੇ ਦੀ ਜਾਂਚ ਲਈ ਵਰਤੇ ਜਾਂਦੇ ਹਨ, ਅਤੇ ਉਹਨਾਂ ਦਾ result Bool ਹੁੰਦਾ ਹੈ:

* `==` ਬਰਾਬਰ
* `!=` ਬਰਾਬਰ ਨਹੀਂ
* `>` ਵੱਡਾ ਹੈ
* `<` ਛੋਟਾ ਹੈ
* `>=` ਵੱਡਾ ਜਾਂ ਬਰਾਬਰ
* `<=` ਛੋਟਾ ਜਾਂ ਬਰਾਬਰ

ਉਦਾਹਰਨ:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Comparison operators ਅਕਸਰ condition statements ਵਿੱਚ ਵਰਤੇ ਜਾਂਦੇ ਹਨ। ਉਦਾਹਰਨ ਵਜੋਂ, “ਕਹਾਵਤ ਰੋਟੇਸ਼ਨ” ਵਿੱਚ ਸਾਨੂੰ ਇਹ ਯਕੀਨੀ ਬਣਾਉਣਾ ਹੁੰਦਾ ਹੈ ਕਿ index array ਦੀ ਸੀਮਾ ਤੋਂ ਵੱਧ ਨਾ ਹੋਵੇ:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

ਜੇ index, sayings.count - 1 ਨਾਲੋਂ ਛੋਟਾ ਹੈ, ਤਾਂ comparison ਦਾ result true ਹੋਵੇਗਾ, ਅਤੇ if statement ਦੇ ਅੰਦਰ ਵਾਲਾ code ਚੱਲੇਗਾ; ਜੇ result false ਹੋਵੇ, ਤਾਂ ਅੱਗੇ ਵਾਲਾ code ਨਹੀਂ ਚੱਲੇਗਾ।

## ਲਾਜ਼ਿਕਲ ਓਪਰੇਟਰ

Logical operators ਕਈ conditions ਨੂੰ ਜੋੜਨ ਲਈ ਵਰਤੇ ਜਾਂਦੇ ਹਨ:

* `&&` ਅਤੇ (AND)
* `||` ਜਾਂ (OR)
* `!` ਨਹੀਂ (NOT)

### && ਅਤੇ

ਜਦੋਂ ਕਈ conditions ਨੂੰ ਇੱਕੋ ਵੇਲੇ true ਹੋਣਾ ਲਾਜ਼ਮੀ ਹੋਵੇ, ਤਾਂ && ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

ਇਸ code ਵਿੱਚ ਦੋ conditions ਹਨ: age >= 18 ਅਤੇ age <= 100।

ਕੇਵਲ ਜਦੋਂ ਇਹ ਦੋਵੇਂ conditions true ਹੋਣਗੀਆਂ, legalAge true ਹੋਵੇਗਾ; ਜੇ ਇੱਕ ਵੀ condition false ਹੋਵੇ, ਤਾਂ result false ਹੋ ਜਾਵੇਗਾ।

### || ਜਾਂ

ਜਦੋਂ ਕਈ conditions ਵਿੱਚੋਂ ਸਿਰਫ ਇੱਕ ਦਾ true ਹੋਣਾ ਕਾਫੀ ਹੋਵੇ, ਤਾਂ || ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

ਇਸ code ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਜੇ money >= 50 ਜਾਂ creditCard >= 50 ਵਿੱਚੋਂ ਕੋਈ ਵੀ ਇੱਕ condition true ਹੋਵੇ, ਤਾਂ payAllowed true ਹੋਵੇਗਾ।

ਕੇਵਲ ਜਦੋਂ ਦੋਵੇਂ conditions false ਹੋਣ, ਤਾਂ ਹੀ result false ਹੋਵੇਗਾ।

ਉਦਾਹਰਨ ਲਈ, payment ਦੇ scenario ਵਿੱਚ, cash ਜਾਂ credit card ਵਿੱਚੋਂ ਕਿਸੇ ਇੱਕ ਨਾਲ ਭੁਗਤਾਨ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ। ਜੇ ਦੋਵੇਂ ਨਾਲ ਭੁਗਤਾਨ ਨਾ ਹੋ ਸਕੇ, ਤਾਂ payment ਅਸਫਲ ਰਹੇਗੀ।

### ! ਨਹੀਂ

! ਇੱਕ logical NOT operator ਹੈ, ਜੋ Bool value ਨੂੰ ਉਲਟ ਦਿੰਦਾ ਹੈ।

ਇਸਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: ! true ਨੂੰ false ਬਣਾਉਂਦਾ ਹੈ, ਅਤੇ false ਨੂੰ true ਬਣਾਉਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let allowed = true
let result = !allowed   // false
```

ਇੱਥੇ !allowed ਦਾ ਮਤਲਬ ਹੈ allowed ਦੀ value ਨੂੰ ਉਲਟਣਾ।

ਇੱਕ ਗੱਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ ! ਅਤੇ != ਦੋ ਵੱਖਰੇ operators ਹਨ। ! Bool value ਨੂੰ ਉਲਟਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ, ਜਦਕਿ != ਇੱਕ comparison operator ਹੈ, ਜੋ Bool result ਵਾਪਸ ਕਰਦਾ ਹੈ।

## ਅਸਾਈਨਮੈਂਟ ਓਪਰੇਟਰ

Assignment operators ਦਾ ਵਰਤੋਂ value assign ਕਰਨ ਜਾਂ variable update ਕਰਨ ਲਈ ਹੁੰਦਾ ਹੈ:

* `=` assign ਕਰਨਾ

Variable declaration ਹੋਵੇ ਜਾਂ calculation process, assignment operation ਅਕਸਰ ਵਰਤੀ ਜਾਂਦੀ ਹੈ:

```swift
let a = 5
```

ਇਸ code ਦਾ ਅਰਥ ਹੈ ਕਿ numeric value 5, variable a ਨੂੰ ਦਿੱਤੀ ਗਈ ਹੈ।

### ਸੰਯੁਕਤ ਅਸਾਈਨਮੈਂਟ ਓਪਰੇਟਰ

ਅਸਲ development ਵਿੱਚ, ਸਧਾਰਣ assignment operator ਤੋਂ ਇਲਾਵਾ, “compound assignment operators” ਵੀ ਬਹੁਤ ਵਰਤੇ ਜਾਂਦੇ ਹਨ। ਇਹ original value ਦੇ ਆਧਾਰ 'ਤੇ ਸਿੱਧੀ calculation ਕਰਕੇ variable ਨੂੰ update ਕਰਦੇ ਹਨ:

* `+=`
* `-=`
* `*=`
* `/=`

ਪਿਛਲੇ “counter” ਪਾਠ ਵਿੱਚ ਅਸੀਂ compound assignment operators ਬਾਰੇ ਥੋੜ੍ਹੀ ਜਾਣਕਾਰੀ ਲੈ ਚੁੱਕੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ, ਜਦੋਂ button 'ਤੇ click ਕੀਤਾ ਜਾਵੇ, ਤਾਂ variable ਆਪਣੇ ਆਪ ਵੱਧ ਜਾਵੇ:

```swift
var num = 10
num += 5   // num = 15
```

ਇਸ code ਦਾ ਮਤਲਬ ਹੈ ਕਿ num ਨੂੰ 5 ਨਾਲ ਜੋੜਿਆ ਗਿਆ ਅਤੇ ਫਿਰ result ਮੁੜ num ਨੂੰ assign ਕੀਤਾ ਗਿਆ।

ਇਸ ਲਈ, ਇਹ ਇਸਦੇ ਬਰਾਬਰ ਹੈ:

```swift
var num = 10
num = num + 5   // num = 15
```

## ਤ੍ਰਿਯਕ ਓਪਰੇਟਰ

Swift ਵਿੱਚ ternary operator ਇੱਕ condition ਦੀ ਜਾਂਚ ਕਰਦਾ ਹੈ, ਅਤੇ ਦੋ results ਵਿੱਚੋਂ ਇੱਕ ਵਾਪਸ ਕਰਦਾ ਹੈ:

```swift
ਸ਼ਰਤ ? ਮੁੱਲ1 : ਮੁੱਲ2
```

ਇਸਦੀ logic ਇਹ ਹੈ ਕਿ ਜੇ condition true ਹੋਵੇ, ਤਾਂ “值1” ਵਾਪਸ ਆਵੇਗਾ; ਜੇ condition false ਹੋਵੇ, ਤਾਂ “值2” ਵਾਪਸ ਆਵੇਗਾ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

ਇਹ code showColor ਦੀ value ਦੀ ਜਾਂਚ ਕਰੇਗਾ: ਜੇ ਇਹ true ਹੋਵੇ, ਤਾਂ Color.blue ਵਾਪਸ ਆਵੇਗਾ, ਅਤੇ background ਨੀਲਾ ਦਿਖੇਗਾ; ਜੇ false ਹੋਵੇ, ਤਾਂ Color.clear ਵਾਪਸ ਆਵੇਗਾ, ਅਤੇ background color ਨਹੀਂ ਦਿਖੇਗਾ।

ਸੰਕੇਤ: Color.clear ਦਾ ਮਤਲਬ ਹੈ transparent color (ਕੋਈ ਰੰਗ ਨਹੀਂ ਦਿਖੇਗਾ)।

### if-else ਨਾਲ ਅੰਤਰ

Ternary operator logic ਦੇ ਪੱਖੋਂ if-else statement ਦੇ ਬਰਾਬਰ ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਉਪਰਲੇ code ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਵੀ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

ਦੋਵਾਂ ਦੀ execution logic ਪੂਰੀ ਤਰ੍ਹਾਂ ਇੱਕੋ ਜਿਹੀ ਹੈ: condition true ਹੋਣ 'ਤੇ ਪਹਿਲਾ result, ਅਤੇ false ਹੋਣ 'ਤੇ ਦੂਜਾ result।

ਅਸਲ ਵਰਤੋਂ ਵਿੱਚ, ternary operator ਦੀ ਲਿਖਤ ਹੋਰ ਸੰਖੇਪ ਹੁੰਦੀ ਹੈ, ਅਤੇ “ਦੋ ਵਿੱਚੋਂ ਇੱਕ” ਵਾਲੇ simple decision ਲਈ ਹੋਰ ਉਚਿਤ ਹੁੰਦੀ ਹੈ। ਇਹ ਅਕਸਰ ਸਿੱਧਾ value return ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

SwiftUI ਦੇ View construction ਵਿੱਚ ternary operator ਬਹੁਤ ਆਮ ਹੈ, ਉਦਾਹਰਨ ਲਈ:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

ਇਸ ਤਰ੍ਹਾਂ ਦੀ ਲਿਖਤ ਨਾਲ ਇੱਕ ਹੀ line ਵਿੱਚ condition ਦੇ ਅਨੁਸਾਰ view ਦਾ effect dynamic ਤਰੀਕੇ ਨਾਲ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ।

## ਰੇਂਜ ਓਪਰੇਟਰ

Range operators interval ਦਰਸਾਉਣ ਲਈ ਵਰਤੇ ਜਾਂਦੇ ਹਨ:

* `...` closed range (ਦੋਵੇਂ ends ਸ਼ਾਮਲ)
* `..<` half-open range (ਸੱਜਾ end ਸ਼ਾਮਲ ਨਹੀਂ)

ਉਦਾਹਰਨ ਲਈ:

```id="mjlwm5"
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

ਇਸਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: 1...3 ਦਾ ਮਤਲਬ 1 ਤੋਂ 3 ਤੱਕ ਹੈ, ਅਤੇ 3 ਵੀ ਸ਼ਾਮਲ ਹੈ; 5..<8 ਦਾ ਮਤਲਬ 5 ਤੋਂ 8 ਤੱਕ ਹੈ, ਪਰ 8 ਸ਼ਾਮਲ ਨਹੀਂ ਹੈ।

ਵਿਸਥਾਰਿਤ ਰੂਪ (ਕੇਵਲ ਜਾਣਕਾਰੀ ਲਈ):

```id="matuxn"
5...    // >= 5
...5    // <= 5
```

ਇਸ ਲਿਖਤ ਦਾ ਮਤਲਬ “ਇੱਕ ਪਾਸੇ ਵਾਲੀ range” ਹੈ, ਜੋ ਅਕਸਰ condition checking ਜਾਂ pattern matching ਵਿੱਚ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

Range operators ਅੱਗੇ for loop ਸਿੱਖਣ ਸਮੇਂ ਵਰਤੇ ਜਾਣਗੇ; ਇਸ ਵੇਲੇ ਲਈ, ਇਨ੍ਹਾਂ ਨੂੰ ਇੱਕ ਲਗਾਤਾਰ number range ਵਜੋਂ ਸਮਝਣਾ ਕਾਫੀ ਹੈ।

## Operators ਦੀ ਅਭਿਆਸ

ਹੁਣ ਅਸੀਂ ਕੁਝ ਸਧਾਰਣ examples ਰਾਹੀਂ view ਵਿੱਚ operators ਦੀ ਭੂਮਿਕਾ ਦੀ practice ਕਰਦੇ ਹਾਂ।

### 1. ਵਾਹਨਾਂ ਦੀ ਕੁੱਲ ਗਿਣਤੀ

ਉਦਾਹਰਨ ਲਈ, ਕਿਸੇ ਇੱਕ ਚੌਰਾਹੇ ਤੋਂ ਹਰ ਰੋਜ਼ 500 ਵਾਹਨ ਲੰਘਦੇ ਹਨ। 30 ਦਿਨਾਂ ਵਿੱਚ ਲੰਘੇ ਕੁੱਲ ਵਾਹਨਾਂ ਦੀ ਗਿਣਤੀ ਕਰੋ।

ਅਸੀਂ arithmetic operator ਦੀ ਵਰਤੋਂ ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

ਇੱਥੇ calculation ਦਾ process ਇਹ ਹੈ: ਹਰ ਰੋਜ਼ 500 ਵਾਹਨ, 30 ਦਿਨਾਂ ਵਿੱਚ ਕੁੱਲ 500 × 30, ਅਤੇ ਆਖ਼ਿਰਕਾਰ 15000 ਵਾਹਨ ਮਿਲਦੇ ਹਨ।

### 2. In-App Purchase membership ਦੀ ਜਾਂਚ

ਅਸੀਂ ਜਾਂਚ ਸਕਦੇ ਹਾਂ ਕਿ ਕੋਈ ਵਿਅਕਤੀ in-app purchase member ਹੈ ਜਾਂ ਨਹੀਂ। ਜੇ ਉਸਨੇ lifetime membership ਜਾਂ subscription membership ਵਿੱਚੋਂ ਕੋਈ ਇੱਕ ਲਈ ਹੋਵੇ, ਤਾਂ ਉਸਨੂੰ member ਮੰਨਿਆ ਜਾਵੇਗਾ।

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

ਇਸ code ਵਿੱਚ || (OR) operator ਵਰਤਿਆ ਗਿਆ ਹੈ: lifeTime = false ਦਾ ਮਤਲਬ ਹੈ lifetime membership ਨਹੀਂ ਹੈ; subscription = true ਦਾ ਮਤਲਬ ਹੈ subscription membership ਹੈ।

ਕਿਉਂਕਿ ਕੇਵਲ ਇੱਕ condition ਦਾ true ਹੋਣਾ ਕਾਫੀ ਹੈ, ਇਸ ਲਈ isMember true ਹੋਵੇਗਾ। ਇਸ ਲਈ, ਇਹ ਵਿਅਕਤੀ member ਹੈ।

## ਸੰਖੇਪ

Swift ਵਿੱਚ, operators data calculation ਅਤੇ logical decision ਦੀ ਬੁਨਿਆਦ ਹਨ। ਜਿਵੇਂ Text content ਦਿਖਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ, ਉਸੇ ਤਰ੍ਹਾਂ operators data ਨੂੰ process ਕਰਨ ਲਈ ਵਰਤੇ ਜਾਂਦੇ ਹਨ।

ਸਭ ਤੋਂ ਸਧਾਰਣ number calculations ਤੋਂ ਲੈ ਕੇ complex logic checks, view state control, ਅਤੇ layout calculations ਤੱਕ — ਹਰ ਜਗ੍ਹਾ operators ਦੀ ਭੂਮਿਕਾ ਹੁੰਦੀ ਹੈ।

ਵੱਖ-ਵੱਖ scenarios ਵਿੱਚ practice ਕਰਕੇ, ਅਸੀਂ ਇਸ ਪਾਠ ਵਿੱਚ ਦਿੱਤੇ ਗਏ ਹਰ ਕਿਸਮ ਦੇ operators ਨੂੰ ਹੌਲੀ-ਹੌਲੀ ਸਮਝ ਅਤੇ ਮਾਹਿਰਤਾ ਨਾਲ ਵਰਤਣਾ ਸਿੱਖ ਸਕਦੇ ਹਾਂ। ਇਹ ਅੱਗੇ ਦੀ learning ਲਈ ਬਹੁਤ ਮਹੱਤਵਪੂਰਨ ਬੁਨਿਆਦ ਹੈ।

### ਵਾਧੂ ਗਿਆਨ - Bitwise Operators

ਇਸ ਤੋਂ ਇਲਾਵਾ, Swift ਇੱਕ ਹੋਰ ਨੀਵੇਂ ਪੱਧਰ ਵਾਲੇ operators ਦਾ ਸਮੂਹ ਵੀ ਦਿੰਦੀ ਹੈ — bitwise operators:

* `&`（bitwise AND）
* `|`（bitwise OR）
* `^`（bitwise XOR）
* `~`（bitwise NOT）
* `>>`（right shift）
* `<<`（left shift）

ਉਦਾਹਰਨ ਲਈ:

```swift
let a = 6  // ਬਾਈਨਰੀ 110
let b = 3  // ਬਾਈਨਰੀ 011

print(a & b) // 2 (ਬਾਈਨਰੀ 010)
print(a | b) // 7 (ਬਾਈਨਰੀ 111)
print(a ^ b) // 5 (ਬਾਈਨਰੀ 101)
print(~a)    // -7 (ਉਲਟ)
```

Swift ਵਿੱਚ integers ਨੂੰ binary two’s complement ਰੂਪ ਵਿੱਚ ਦਰਸਾਇਆ ਜਾਂਦਾ ਹੈ, ਇਸ ਲਈ NOT ਕਰਨ ਤੋਂ ਬਾਅਦ ਉਸਦੇ ਅਨੁਸਾਰ negative number ਮਿਲਦਾ ਹੈ।

Bitwise operators ਸਿੱਧੇ binary 'ਤੇ ਕੰਮ ਕਰਦੇ ਹਨ, ਅਤੇ ਆਮ ਤੌਰ 'ਤੇ low-level data processing ਜਾਂ performance optimization ਵਾਲੇ scenarios ਵਿੱਚ ਵਰਤੇ ਜਾਂਦੇ ਹਨ।

Beginners ਲਈ, ਇਸ ਕਿਸਮ ਦੇ operators ਦੇ ਵਰਤੋਂ ਵਾਲੇ scenarios ਘੱਟ ਹੁੰਦੇ ਹਨ, ਅਤੇ ਆਮ iOS ਜਾਂ SwiftUI development ਵਿੱਚ ਵੀ ਇਹ ਜ਼ਿਆਦਾ ਆਮ ਨਹੀਂ ਹਨ, ਇਸ ਲਈ ਇੱਥੇ ਅਸੀਂ ਇਹਨਾਂ ਦੀ ਡੂੰਘੀ ਚਰਚਾ ਨਹੀਂ ਕਰਦੇ।

ਜੇ ਅੱਗੇ ਜਾ ਕੇ low-level logic ਜਾਂ performance optimization ਦੀ ਲੋੜ ਪਵੇ, ਤਾਂ ਇਹਨਾਂ ਨੂੰ ਹੋਰ ਵਿਸਥਾਰ ਨਾਲ ਸਿੱਖਿਆ ਅਤੇ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ।
