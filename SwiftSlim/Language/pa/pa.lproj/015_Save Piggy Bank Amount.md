# ਗੁੱਲਕ ਦੀ ਰਕਮ ਸੰਭਾਲਣਾ

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ “ਗੁੱਲਕ” ਬਣਾਈ ਸੀ। ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਸਿੱਖਾਂਗੇ ਕਿ “ਗੁੱਲਕ” ਦੀ ਰਕਮ ਨੂੰ ਸਥਾਈ ਤੌਰ 'ਤੇ ਕਿਵੇਂ ਸੰਭਾਲਿਆ ਜਾਵੇ।

ਇਸ ਪਾਠ ਵਿੱਚ ਮੁੱਖ ਤੌਰ 'ਤੇ UserDefaults ਅਤੇ @AppStorage property wrapper ਸਿੱਖੀ ਜਾਵੇਗੀ। ਨਾਲ ਹੀ onAppear ਦੀ ਭੂਮਿਕਾ ਅਤੇ optional type (nil) ਦੀ ਵਰਤੋਂ ਵੀ ਵਧੇਰੇ ਰੂਪ ਵਿੱਚ ਸਮਝਾਈ ਜਾਵੇਗੀ।

ਇੱਕ ਗੱਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ: ਇਸ ਪਾਠ ਲਈ ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ ਬਣਾਈ ਗਈ “ਗੁੱਲਕ” ਵਾਲੀ code ਨੂੰ ਹੀ ਜਾਰੀ ਰੱਖਣਾ ਹੈ।

## Data persistence ਦੀ ਸਮੱਸਿਆ

ਹੁਣ, “ਗੁੱਲਕ” ਦਾ interface ਕਾਫੀ ਸਧਾਰਣ ਹੈ ਅਤੇ ਇਸਦੀ ਵਰਤੋਂ ਵੀ ਆਸਾਨ ਹੈ।

![Piggy Bank](../../Resource/014_view.png)

ਪਰ ਇੱਕ ਸਪੱਸ਼ਟ ਸਮੱਸਿਆ ਹੈ: ਹਰ ਵਾਰ view ਨੂੰ refresh ਕਰਨ ਜਾਂ app ਨੂੰ ਬੰਦ ਕਰਨ 'ਤੇ, “ਗੁੱਲਕ” ਦੀ ਕੁੱਲ ਰਕਮ ਮੁੜ 0 ਹੋ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਪਹਿਲਾਂ ਸੰਭਾਲੀ ਹੋਈ ਸਾਰੀ ਰਕਮ ਗੁੰਮ ਹੋ ਜਾਂਦੀ ਹੈ।

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ data ਅਸਲ ਵਿੱਚ save ਨਹੀਂ ਹੋ ਰਿਹਾ। ਦੂਜੇ ਸ਼ਬਦਾਂ ਵਿੱਚ, ਮੌਜੂਦਾ “ਗੁੱਲਕ” ਸਿਰਫ temporary data ਸੰਭਾਲ ਸਕਦੀ ਹੈ।

### ਸਥਾਈ ਸੰਭਾਲ ਕਿਉਂ ਨਹੀਂ ਹੋ ਰਹੀ?

ਇਹ ਇਸ ਲਈ ਹੈ ਕਿਉਂਕਿ ਅਸੀਂ @State ਨਾਲ ਇਹ variable declare ਕੀਤਾ ਹੈ:

```swift
@State private var amount = 0
```

@State ਨਾਲ declare ਕੀਤਾ ਗਿਆ variable ਪੂਰੀ ਤਰ੍ਹਾਂ view ਦੇ lifecycle 'ਤੇ ਨਿਰਭਰ ਕਰਦਾ ਹੈ।

ਜਦੋਂ view ਬਣਦੀ ਹੈ, amount ਨੂੰ 0 ਨਾਲ initialize ਕੀਤਾ ਜਾਂਦਾ ਹੈ; ਜਦੋਂ view ਨਸ਼ਟ ਹੁੰਦੀ ਹੈ, amount ਵੀ ਨਸ਼ਟ ਹੋ ਜਾਂਦਾ ਹੈ।

ਇੱਥੇ amount ਵਿੱਚ ਸੰਭਾਲਿਆ ਹੋਇਆ data ਸਿਰਫ memory ਵਿੱਚ ਮੌਜੂਦ ਹੈ, ਇਹ device 'ਤੇ save ਨਹੀਂ ਕੀਤਾ ਗਿਆ।

ਜੇ ਅਸੀਂ ਨਹੀਂ ਚਾਹੁੰਦੇ ਕਿ amount, view ਦੇ lifecycle ਨਾਲ bind ਰਹੇ, ਤਾਂ ਸਾਨੂੰ data persistence ਲਾਗੂ ਕਰਨੀ ਪਵੇਗੀ। ਅਰਥਾਤ, data ਨੂੰ device 'ਤੇ save ਕਰਨਾ ਪਵੇਗਾ।

### “Data persistence” ਕੀ ਹੁੰਦੀ ਹੈ

Data persistence ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: data ਨੂੰ “temporary memory” ਤੋਂ “device storage” ਵਿੱਚ save ਕਰਨਾ।

ਇਸ ਤਰ੍ਹਾਂ, view ਬੰਦ ਹੋਣ ਜਾਂ app ਬੰਦ ਹੋਣ 'ਤੇ data ਗੁੰਮ ਨਹੀਂ ਹੁੰਦਾ।

Swift development ਵਿੱਚ, ਸਧਾਰਣ “data persistence” ਲਈ UserDefaults ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ, ਜਦਕਿ ਹੋਰ ਜਟਿਲ data ਲਈ SwiftData ਜਾਂ CoreData ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਪਹਿਲਾਂ ਸਭ ਤੋਂ ਸਧਾਰਣ UserDefaults ਸਿੱਖਾਂਗੇ।

## UserDefaults

UserDefaults ਹਲਕੇ-ਫੁਲਕੇ key-value pair data ਨੂੰ save ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਇਹ ਆਮ ਤੌਰ 'ਤੇ String, Int, Double, Bool ਵਰਗੀਆਂ ਬੁਨਿਆਦੀ ਕਿਸਮਾਂ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

### Data save ਕਰਨਾ

UserDefaults ਵਿੱਚ data save ਕਰਨ ਲਈ set method ਵਰਤੀ ਜਾਂਦੀ ਹੈ:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults ਦਾ ਪਹਿਲਾ parameter save ਕੀਤਾ ਜਾਣ ਵਾਲਾ data ਹੁੰਦਾ ਹੈ। ਇੱਥੇ String, Int ਆਦਿ ਕਿਸਮਾਂ ਦਾ data ਦਿੱਤਾ ਗਿਆ ਹੈ।

ਦੂਜਾ parameter forKey, variable name ਵਾਂਗ ਕੰਮ ਕਰਦਾ ਹੈ, ਜੋ UserDefaults ਵਿੱਚ save ਕੀਤੇ data ਦੀ ਪਛਾਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

### Data ਪੜ੍ਹਨਾ

UserDefaults ਵਿੱਚ data ਪੜ੍ਹਣ ਲਈ ਇਸਦੇ ਸੰਬੰਧਿਤ methods ਵਰਤੇ ਜਾਂਦੇ ਹਨ:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Data ਪੜ੍ਹਦਿਆਂ ਸੰਬੰਧਿਤ type ਵਾਲੀ method ਹੀ ਵਰਤਣੀ ਪੈਂਦੀ ਹੈ, ਨਹੀਂ ਤਾਂ error ਆ ਸਕਦੀ ਹੈ ਜਾਂ data ਗਲਤ ਮਿਲ ਸਕਦਾ ਹੈ।

### UserDefaults ਬਾਰੇ ਧਿਆਨਯੋਗ ਗੱਲਾਂ

#### 1. Optional type ਵਾਪਸ ਕਰਨਾ

UserDefaults ਨਾਲ data ਪੜ੍ਹਦਿਆਂ, ਕੁਝ methods optional type ਵਾਪਸ ਕਰਦੀਆਂ ਹਨ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

ਇੱਥੇ name ਦੀ type ਹੈ:

```swift
String?
```

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ value ਹੋ ਸਕਦੀ ਹੈ, ਜਾਂ ਨਹੀਂ ਵੀ ਹੋ ਸਕਦੀ।

**Optional type ਕਿਉਂ ਵਾਪਸ ਆਉਂਦੀ ਹੈ?**

ਕਿਉਂਕਿ UserDefaults ਵਿੱਚ ਦਿੱਤੇ ਗਏ ਕਿਸੇ key ਲਈ data ਹੋਣਾ ਲਾਜ਼ਮੀ ਨਹੀਂ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

ਜੇ “City” key ਪਹਿਲਾਂ ਕਦੇ save ਹੀ ਨਹੀਂ ਕੀਤੀ ਗਈ, ਤਾਂ result ਇਹ ਹੋਵੇਗਾ:

```swift
nil
```

ਇੱਥੇ ਜ਼ੋਰ ਨਾਲ ਸਮਝਣ ਵਾਲੀ ਗੱਲ ਹੈ ਕਿ nil ਦਾ ਮਤਲਬ “ਕੋਈ data ਨਹੀਂ” ਹੈ, ਨਾ ਕਿ ਖਾਲੀ string।

“ਟਾਈਪ ਸਿਸਟਮ” ਵਾਲੇ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇਸੇ ਤਰ੍ਹਾਂ ਦੀ ਸਮੱਸਿਆ ਦੇਖੀ ਸੀ — ਜਦੋਂ type conversion ਅਸਫਲ ਹੁੰਦੀ ਹੈ, ਤਾਂ optional type ਵਾਪਸ ਆਉਂਦੀ ਹੈ।

ਐਸੇ ਵੇਲੇ, ਸਾਨੂੰ ?? ਦੀ ਵਰਤੋਂ ਕਰਕੇ default value ਦੇਣੀ ਪੈਂਦੀ ਹੈ, ਅਤੇ optional ਨੂੰ unwrap ਕਰਨਾ ਪੈਂਦਾ ਹੈ:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

ਜੇ UserDefaults ਵਿੱਚੋਂ data ਮਿਲ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਉਹੀ value ਵਰਤੀ ਜਾਵੇਗੀ; ਜੇ data ਨਾ ਮਿਲੇ (nil), ਤਾਂ default value ਵਰਤੀ ਜਾਵੇਗੀ।

#### 2. Non-optional type ਵਾਪਸ ਕਰਨਾ

UserDefaults ਜਦੋਂ Int, Double, Bool type ਪੜ੍ਹਦੀ ਹੈ, ਤਾਂ non-optional type ਵਾਪਸ ਕਰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

ਜੇ ਇਹ keys ਪਹਿਲਾਂ ਕਦੇ save ਨਾ ਵੀ ਕੀਤੀਆਂ ਗਈਆਂ ਹੋਣ, ਤਾਂ ਵੀ result nil ਨਹੀਂ ਹੋਵੇਗਾ।

ਇਸਦੀ ਬਜਾਏ ਇਹ default values ਵਾਪਸ ਕਰੇਗੀ:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Data size ਦੀ ਸੀਮਾ

UserDefaults ਸਿਰਫ ਘੱਟ ਮਾਤਰਾ ਵਾਲੇ data ਲਈ ਉਚਿਤ ਹੈ, ਜਿਵੇਂ app settings, ਸਧਾਰਣ state ਆਦਿ।

ਅਸਲ development ਵਿੱਚ, ਇਹ ਵੱਡੀ ਮਾਤਰਾ ਵਾਲੇ data ਜਾਂ ਬਾਰ-ਬਾਰ read/write ਹੋਣ ਵਾਲੇ data ਲਈ ਉਚਿਤ ਨਹੀਂ ਹੈ।

## “ਗੁੱਲਕ” ਦੀ ਰਕਮ save ਕਰਨਾ

ਹੁਣ, ਅਸੀਂ UserDefaults ਦੀ ਵਰਤੋਂ ਕਰਕੇ “ਗੁੱਲਕ” ਦੀ ਕੁੱਲ ਰਕਮ save ਕਰਨ ਵਾਲੀ code logic ਲਾਗੂ ਕਰ ਸਕਦੇ ਹਾਂ।

ਜਦੋਂ user button 'ਤੇ click ਕਰੇ, ਤਾਂ input ਕੀਤੀ ਰਕਮ total amount ਵਿੱਚ ਜੋੜੀ ਜਾਵੇ, ਅਤੇ ਫਿਰ total amount ਨੂੰ UserDefaults ਵਿੱਚ save ਕਰ ਦਿੱਤਾ ਜਾਵੇ।

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

ਹੁਣ ਅਸੀਂ data write ਕਰਨ ਦੀ logic ਲਾਗੂ ਕਰ ਲਈ ਹੈ।

## Data persistence logic ਦੀ ਵਿਆਖਿਆ

ਭਾਵੇਂ ਅਸੀਂ data persistence ਦੀ write logic ਲਾਗੂ ਕਰ ਲਈ ਹੈ, ਪਰ ਅਸਲ ਵਿੱਚ app ਚਲਾਉਣ 'ਤੇ ਤੁਸੀਂ ਵੇਖੋਗੇ ਕਿ ਹਰ ਵਾਰ view refresh ਹੋਣ ਜਾਂ app ਮੁੜ ਖੁਲ੍ਹਣ 'ਤੇ amount ਫਿਰ ਵੀ 0 ਰਹਿੰਦਾ ਹੈ।

ਇਸਦਾ ਕਾਰਣ ਹੈ:

```swift
@State private var amount = 0
```

SwiftUI ਵਿੱਚ, @State variable view ਬਣਦਿਆਂ ਹਰ ਵਾਰ ਮੁੜ initialize ਹੁੰਦਾ ਹੈ।

ਭਾਵੇਂ UserDefaults ਵਿੱਚ amount ਦੀ value save ਹੋ ਚੁੱਕੀ ਹੈ, ਪਰ ਜਦੋਂ view ਮੁੜ load ਹੁੰਦੀ ਹੈ, ਤਾਂ amount ਫਿਰ 0 ਹੋ ਜਾਂਦਾ ਹੈ।

ਇਸ ਤੋਂ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ ਇਸ ਵੇਲੇ ਅਸੀਂ ਸਿਰਫ data ਨੂੰ UserDefaults ਵਿੱਚ save ਕੀਤਾ ਹੈ, ਪਰ view ਵਿੱਚ data ਮੁੜ restore ਨਹੀਂ ਕੀਤਾ।

ਇਸ ਲਈ, view load ਹੋਣ ਸਮੇਂ ਸਾਨੂੰ UserDefaults ਵਿੱਚੋਂ data ਹੱਥੋਂ ਪੜ੍ਹ ਕੇ amount ਨੂੰ ਮੁੜ assign ਕਰਨਾ ਪਵੇਗਾ, ਤਾਂ ਹੀ ਪੂਰੀ data persistence logic ਪੂਰੀ ਹੋਵੇਗੀ।

### Logic ਦਾ ਉਦਾਹਰਨ

ਇਸ ਪ੍ਰਕਿਰਿਆ ਨੂੰ “classroom blackboard” ਨਾਲ ਤੁਲਨਾ ਕਰਕੇ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ:

ਜਦੋਂ ਕਲਾਸ ਚੱਲਦੀ ਹੈ, ਅਧਿਆਪਕ blackboard 'ਤੇ ਸਮੱਗਰੀ ਲਿਖਦਾ ਹੈ। ਇਹ ਮੌਜੂਦਾ view ਦੀ state (@State) ਵਾਂਗ ਹੈ।

ਜਦੋਂ ਕਲਾਸ ਖਤਮ ਹੁੰਦੀ ਹੈ, blackboard ਮਿਟਾ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ, ਤਾਂ ਜੋ ਅਗਲੀ ਕਲਾਸ ਲਈ ਤਿਆਰ ਹੋ ਸਕੇ। ਇਹ ਉਸੇ ਵਾਂਗ ਹੈ ਜਿਵੇਂ view ਨਸ਼ਟ ਹੋ ਜਾਂਦੀ ਹੈ, ਅਤੇ @State ਦਾ data ਵੀ ਖਤਮ ਹੋ ਜਾਂਦਾ ਹੈ।

ਤਾਂ ਜੋ ਪੜ੍ਹਾਇਆ ਹੋਇਆ content ਗੁੰਮ ਨਾ ਹੋਵੇ, ਅਧਿਆਪਕ ਪਹਿਲਾਂ ਹੀ ਉਸਨੂੰ courseware ਵਿੱਚ save ਕਰ ਲੈਂਦਾ ਹੈ। ਇਹ courseware, UserDefaults ਵਿੱਚ save ਕੀਤੇ data ਵਾਂਗ ਹੈ।

ਜਦੋਂ ਅਗਲੀ ਵਾਰ ਕਲਾਸ ਸ਼ੁਰੂ ਹੁੰਦੀ ਹੈ, blackboard ਸ਼ੁਰੂ ਵਿੱਚ ਖਾਲੀ ਹੁੰਦੀ ਹੈ (@State initialize ਹੁੰਦੀ ਹੈ), ਅਤੇ ਅਧਿਆਪਕ courseware ਦੇ ਆਧਾਰ 'ਤੇ ਪਹਿਲਾਂ ਵਾਲਾ content blackboard 'ਤੇ ਮੁੜ ਲਿਖਦਾ ਹੈ (UserDefaults ਪੜ੍ਹਦਾ ਹੈ)।

ਇੱਕ ਮਹੱਤਵਪੂਰਨ ਗੱਲ ਇਹ ਹੈ ਕਿ blackboard ਆਪੇ ਪਹਿਲਾਂ ਵਾਲਾ content restore ਨਹੀਂ ਕਰਦੀ; “courseware ਪੜ੍ਹ ਕੇ” (UserDefaults ਤੋਂ data ਪੜ੍ਹ ਕੇ) ਹੀ ਉਸਨੂੰ ਮੁੜ ਲਿਖਣਾ ਪੈਂਦਾ ਹੈ।

## onAppear ਨਾਲ data ਪੜ੍ਹਨਾ

ਜਦੋਂ view ਦਿਖਾਈ ਦੇਵੇ, ਤਦ UserDefaults ਵਿੱਚੋਂ value ਹੱਥੋਂ ਪੜ੍ਹ ਕੇ ਉਸਨੂੰ @State ਵਾਲੇ amount variable ਵਿੱਚ assign ਕਰਨਾ ਪੈਂਦਾ ਹੈ, ਤਾਂ ਜੋ ਅਸਲ data persistence ਲਾਗੂ ਹੋ ਸਕੇ।

SwiftUI ਵਿੱਚ, onAppear ਦੀ ਵਰਤੋਂ view ਦਿਖਾਈ ਦੇਣ ਸਮੇਂ initialization logic ਚਲਾਉਣ ਲਈ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ:

```swift
.onAppear {}
```

UserDefaults ਪੜ੍ਹਨ ਵਾਲੀ code ਨੂੰ onAppear ਵਿੱਚ ਲਿਖੋ:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

ਜਦੋਂ view ਬਣਦੀ ਹੈ, amount ਪਹਿਲਾਂ 0 ਨਾਲ initialize ਹੁੰਦਾ ਹੈ; ਫਿਰ ਜਦੋਂ view ਦਿਖਾਈ ਦਿੰਦੀ ਹੈ, onAppear trigger ਹੁੰਦਾ ਹੈ, ਅਤੇ UserDefaults ਵਿੱਚੋਂ value ਪੜ੍ਹ ਕੇ amount ਵਿੱਚ assign ਕਰ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਤਰ੍ਹਾਂ view ਪਿਛਲੀ ਵਾਰ save ਕੀਤੀ ਗਈ total amount ਦਿਖਾ ਸਕਦੀ ਹੈ।

ਹੁਣ, “ਗੁੱਲਕ” ਲਈ ਪੂਰੀ data persistence logic ਤਿਆਰ ਹੋ ਗਈ ਹੈ।

## ਪੂਰੀ code

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

SwiftUI, @AppStorage property wrapper ਮੁਹੱਈਆ ਕਰਦੀ ਹੈ, ਜੋ UserDefaults ਦੀ saving logic ਨੂੰ ਹੋਰ ਸਧਾਰਣ ਬਣਾ ਦਿੰਦੀ ਹੈ।

```swift
@AppStorage("amount") private var amount = 0
```

@AppStorage, UserDefaults ਦਾ ਇੱਕ wrapper ਹੈ, ਅਤੇ "amount" UserDefaults ਦੇ key ਨਾਲ ਸੰਬੰਧਤ ਹੈ।

ਜਦੋਂ view ਬਣਦੀ ਹੈ, ਇਹ UserDefaults ਵਿੱਚੋਂ data ਪੜ੍ਹਦੀ ਹੈ; ਅਤੇ ਜਦੋਂ variable ਦੀ value ਬਦਲਦੀ ਹੈ, ਤਾਂ ਇਹ ਆਪਣੇ ਆਪ UserDefaults ਵਿੱਚ write ਕਰ ਦਿੰਦੀ ਹੈ。

ਇਹ SwiftUI ਦੀ state update mechanism ਨੂੰ support ਕਰਦੀ ਹੈ, ਅਤੇ @State ਵਾਂਗ ਹੀ variable ਦੀ value ਬਦਲਣ 'ਤੇ SwiftUI view ਨੂੰ refresh ਕਰਦੀ ਹੈ।

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ @AppStorage data ਪੜ੍ਹਨ ਅਤੇ save ਕਰਨ ਦੋਵੇਂ ਕੰਮ ਕਰ ਸਕਦੀ ਹੈ; ਹੁਣ ਹੱਥੋਂ UserDefaults call ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ, ਅਤੇ onAppear ਨਾਲ data manually read ਕਰਨ ਦੀ ਵੀ ਲੋੜ ਨਹੀਂ ਹੁੰਦੀ।

ਇਸ ਲਈ, ਅਸੀਂ code ਵਿੱਚ UserDefaults ਦੀ ਥਾਂ @AppStorage ਵਰਤ ਸਕਦੇ ਹਾਂ:

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

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ ਮੁੱਖ ਤੌਰ 'ਤੇ ਹੇਠਾਂ ਦਿੱਤੇ ਗਏ ਗਿਆਨ-ਬਿੰਦੂ ਸਿੱਖੇ ਗਏ:

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, UserDefaults ਹਲਕੇ-ਫੁਲਕੇ data ਨੂੰ save ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ UserDefaults ਦੀ ਵਰਤੋਂ ਕਰਕੇ total amount ਨੂੰ device 'ਤੇ save ਕੀਤਾ। UserDefaults read ਅਤੇ write methods ਦਿੰਦੀ ਹੈ, ਅਤੇ optional types ਵਰਗੀਆਂ ਸਥਿਤੀਆਂ ਨੂੰ ਵੀ ਧਿਆਨ ਨਾਲ ਸੰਭਾਲਣਾ ਪੈਂਦਾ ਹੈ।

ਦੂਜੇ, @State variable ਸਿਰਫ view ਅੰਦਰ temporary state manage ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ, ਅਤੇ ਇਸਦਾ lifecycle view ਨਾਲ ਹੀ ਜੁੜਿਆ ਹੁੰਦਾ ਹੈ। ਜਦੋਂ view ਮੁੜ ਬਣਦੀ ਹੈ, @State ਵੀ ਮੁੜ initialize ਹੋ ਜਾਂਦੀ ਹੈ।

UserDefaults ਵਿੱਚੋਂ data restore ਕਰਨ ਸਮੇਂ, ਅਸੀਂ onAppear ਦੀ ਵਰਤੋਂ ਕਰਕੇ view ਦੇ ਦਿਖਣ ਸਮੇਂ UserDefaults ਨੂੰ read ਕਰਨਾ ਅਤੇ data restore ਕਰਨਾ ਸਿੱਖਿਆ।

ਅਖੀਰ ਵਿੱਚ, ਅਸੀਂ @AppStorage ਨਾਲ UserDefaults ਨੂੰ replace ਕਰਨਾ ਸਿੱਖਿਆ, ਤਾਂ ਜੋ view load ਹੋਣ ਸਮੇਂ data ਆਪਣੇ ਆਪ ਪੜ੍ਹਿਆ ਜਾਵੇ, ਅਤੇ data ਵਿੱਚ ਬਦਲਾਅ ਆਉਣ 'ਤੇ ਆਪਣੇ ਆਪ write ਵੀ ਹੋ ਜਾਵੇ। ਇਸ ਤਰ੍ਹਾਂ ਹੱਥੋਂ UserDefaults ਅਤੇ onAppear ਵਰਤਣ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ।

ਇਹਨਾਂ ਗਿਆਨ-ਬਿੰਦੂਆਂ ਦੇ ਆਧਾਰ 'ਤੇ, ਅਸੀਂ ਇੱਕ ਬੁਨਿਆਦੀ app data storage feature ਲਾਗੂ ਕਰ ਸਕਦੇ ਹਾਂ, ਜਿਸ ਨਾਲ data ਨੂੰ ਸਥਾਈ ਤੌਰ 'ਤੇ save ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

## ਪਾਠ ਤੋਂ ਬਾਅਦ ਦੀ ਅਭਿਆਸ

ਹੁਣ, “ਗੁੱਲਕ” ਰਕਮ save ਕਰਨ ਦੀ ਸਮਰੱਥਾ ਰੱਖਦੀ ਹੈ, ਪਰ ਇਸਦੀ functionality ਅਜੇ ਵੀ ਅਧੂਰੀ ਹੈ।

1. ਜੇ user ਰਕਮ ਕੱਢਣਾ ਚਾਹੇ, ਤਾਂ ਉਸ ਲਈ ਸੰਬੰਧਿਤ withdrawal logic ਡਿਜ਼ਾਈਨ ਕਰਨੀ ਪਵੇਗੀ।
2. ਜੇ user ਸਾਰੀ ਰਕਮ clear ਕਰਨਾ ਚਾਹੇ, ਤਾਂ reset logic ਵੀ ਲਾਗੂ ਕਰਨੀ ਪਵੇਗੀ।
3. ਜੇ ਤੁਸੀਂ ਗੁੱਲਕ ਨੂੰ ਇੱਕ ਨਾਮ ਦੇਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ String type ਵਾਲੇ data ਨੂੰ ਵੀ save ਕਰਨਾ ਪਵੇਗਾ।

ਤੁਸੀਂ ਮੌਜੂਦਾ ਆਧਾਰ 'ਤੇ ਇਹ features ਹੋਰ ਵਧਾ ਸਕਦੇ ਹੋ, ਤਾਂ ਜੋ “ਗੁੱਲਕ” ਹੋਰ ਪੂਰੀ functionality ਵਾਲੀ ਬਣ ਸਕੇ।

## ਵਾਧੂ ਗਿਆਨ - Input box ਦੀ default value ਦੀ ਸਮੱਸਿਆ

ਹੁਣ ਅਸੀਂ input box ਦੇ interaction ਨੂੰ ਹੋਰ ਵੀ optimize ਕਰ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ input ਕਰਨਾ ਹੋਰ ਸੁਵਿਧਾਜਨਕ ਬਣੇ।

![textfield](../../Resource/015_view.png)

ਮੌਜੂਦਾ implementation ਵਿੱਚ, input box ਦੀ default value 0 ਹੈ। User ਨੂੰ ਹਰ ਵਾਰ amount input ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ 0 ਮਿਟਾਉਣਾ ਪੈਂਦਾ ਹੈ, ਅਤੇ ਫਿਰ ਨਵਾਂ number ਲਿਖਣਾ ਪੈਂਦਾ ਹੈ। ਇਹ interaction experience ਉਚਿਤ ਨਹੀਂ ਹੈ।

ਸਾਡਾ ਲੱਖ ਇਹ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ ਕਿ input box ਦੀ ਸ਼ੁਰੂਆਤੀ value ਖਾਲੀ ਹੋਵੇ, ਨਾ ਕਿ 0।

ਇਹ ਇਸ ਲਈ ਹੈ ਕਿਉਂਕਿ TextField ਅਤੇ number ਦੋ-ਤਰਫ਼ਾ binding ਵਿੱਚ ਹਨ:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

ਜਦੋਂ number ਨੂੰ 0 ਨਾਲ initialize ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ input box ਵੀ 0 ਹੀ ਦਿਖਾਉਂਦਾ ਹੈ।

ਇਸ ਲਈ, ਸਾਨੂੰ number ਨੂੰ empty value, ਅਰਥਾਤ nil ਬਣਾਉਣਾ ਪਵੇਗਾ।

```swift
@State private var number = nil
```

ਇਸ ਵੇਲੇ error ਆਵੇਗੀ:

```swift
Generic parameter 'Value' could not be inferred
```

ਇਹ ਉਹੀ ਸਥਿਤੀ ਹੈ ਜੋ ਅਸੀਂ “ਟਾਈਪ ਸਿਸਟਮ” ਵਿੱਚ ਵੇਖੀ ਸੀ: ਜਦੋਂ variable ਦੀ type ਆਪਣੇ ਆਪ infer ਨਹੀਂ ਹੋ ਸਕਦੀ, ਤਾਂ ਸਾਨੂੰ ਉਸਦੀ type explicitly declare ਕਰਨੀ ਪੈਂਦੀ ਹੈ।

ਕਿਉਂਕਿ ਅਸੀਂ number ਨੂੰ nil ਕੀਤਾ ਹੈ, ਅਤੇ nil ਆਪਣੇ ਆਪ ਵਿੱਚ ਕਿਸੇ ਵੀ type ਦੀ ਜਾਣਕਾਰੀ ਨਹੀਂ ਰੱਖਦਾ, ਇਸ ਲਈ compiler ਇਹ ਨਹੀਂ ਜਾਣ ਸਕਦਾ ਕਿ variable String ਹੈ, Int ਹੈ ਜਾਂ ਕੋਈ ਹੋਰ type, ਇਸ ਕਰਕੇ error ਆਉਂਦੀ ਹੈ।

ਇਸ ਲਈ, ਸਾਨੂੰ number ਦੀ type explicitly declare ਕਰਨੀ ਪਵੇਗੀ:

```swift
@State private var number:Int? = nil
```

ਇੱਥੇ Int? ਦਾ ਮਤਲਬ optional type ਹੈ, ਅਰਥਾਤ number ਦੀ value Int ਵੀ ਹੋ ਸਕਦੀ ਹੈ ਅਤੇ nil ਵੀ।

ਇਸ ਤਰ੍ਹਾਂ, initialization ਵੇਲੇ ਇਸਨੂੰ nil ਰੱਖਣ ਨਾਲ input box ਖਾਲੀ ਦਿਖੇਗਾ, ਨਾ ਕਿ 0।

### Optional type ਨੂੰ unwrap ਕਰਨਾ

ਜਦੋਂ ਅਸੀਂ number ਨੂੰ optional type ਬਣਾਉਂਦੇ ਹਾਂ, ਤਾਂ ਪੁਰਾਣੀ calculation code error ਦੇਵੇਗੀ:

```swift
amount += number
```

ਇਸਦਾ ਸੰਕੇਤ:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

ਇਸਦਾ ਕਾਰਣ ਇਹ ਹੈ ਕਿ ਹੁਣ number ਦੀ value nil ਵੀ ਹੋ ਸਕਦੀ ਹੈ। ਜੇ ਇਹ ਸਿੱਧੀ calculation ਵਿੱਚ ਹਿੱਸਾ ਲਵੇ, ਤਾਂ ਗੱਲ ਇਸ ਤਰ੍ਹਾਂ ਬਣ ਜਾਂਦੀ ਹੈ:

```swift
amount += nil
```

ਸਪੱਸ਼ਟ ਤੌਰ 'ਤੇ, nil ਨੂੰ amount ਨਾਲ ਜੋੜਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ। ਇਹ ਇੱਕ ਅਵੈਧ operation ਹੈ।

ਇਸ ਲਈ, optional type ਨੂੰ calculation ਵਿੱਚ ਵਰਤਣ ਤੋਂ ਪਹਿਲਾਂ, ਇਸਨੂੰ unwrap ਕਰਨਾ ਜ਼ਰੂਰੀ ਹੁੰਦਾ ਹੈ।

ਇੱਥੇ ਅਸੀਂ ?? ਦੀ ਵਰਤੋਂ ਕਰਕੇ default value ਦੇ ਸਕਦੇ ਹਾਂ:

```swift
amount += number ?? 0
```

ਜਦੋਂ number nil ਹੋਵੇ, ਤਾਂ default value 0 ਵਰਤੀ ਜਾਵੇਗੀ; ਜਦੋਂ number ਦੀ value ਮੌਜੂਦ ਹੋਵੇ, ਤਾਂ actual input value ਵਰਤੀ ਜਾਵੇਗੀ।

ਇਸ ਤਰ੍ਹਾਂ, calculation ਵੀ ਸਹੀ ਰਹਿੰਦੀ ਹੈ, ਅਤੇ input box ਦੀ default ਖਾਲੀ appearance ਵੀ ਹਾਸਲ ਹੋ ਜਾਂਦੀ ਹੈ। User ਨੂੰ input box ਵਿੱਚੋਂ 0 ਹੱਥੋਂ ਮਿਟਾਉਣ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ।

## ਵਾਧੂ code

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
