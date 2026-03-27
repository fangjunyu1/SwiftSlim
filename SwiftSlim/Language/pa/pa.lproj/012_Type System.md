# ਕਿਸਮ ਪ੍ਰਣਾਲੀ

ਪਿਛਲੀਆਂ ਕਲਾਸਾਂ ਵਿੱਚ ਅਸੀਂ variables ਬਾਰੇ ਸਿੱਖਿਆ ਸੀ, ਅਤੇ ਇਹ ਵੀ ਜਾਣ ਲਿਆ ਸੀ ਕਿ variables ਵੱਖ-ਵੱਖ ਕਿਸਮਾਂ ਦਾ data ਸੰਭਾਲ ਸਕਦੇ ਹਨ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```swift
var hello = "Hello, World"
````

ਇੱਥੇ hello ਇੱਕ ਟੈਕਸਟ ਸੰਭਾਲ ਰਿਹਾ ਹੈ, ਇਸ ਲਈ ਇਸਦੀ ਕਿਸਮ String ਹੈ।

ਅੱਗੇ ਅਸੀਂ ਕਿਸਮ (Type) ਦੇ ਸੰਕਲਪ ਨੂੰ ਵਿਵਸਥਿਤ ਢੰਗ ਨਾਲ ਸਿੱਖਾਂਗੇ, ਨਾਲ ਹੀ explicit type declaration ਅਤੇ type inference ਵੀ ਸਮਝਾਂਗੇ, ਤਾਂ ਜੋ variable ਦੀ ਅਸਲ nature ਨੂੰ ਹੋਰ ਡੂੰਘਾਈ ਨਾਲ ਸਮਝ ਸਕੀਏ।

## ਕਿਸਮ ਕੀ ਹੁੰਦੀ ਹੈ

Swift ਵਿੱਚ, ਹਰ value ਦੀ ਇੱਕ ਸਪੱਸ਼ਟ ਕਿਸਮ ਹੁੰਦੀ ਹੈ। ਕਿਸਮ ਇਹ ਨਿਰਧਾਰਤ ਕਰਦੀ ਹੈ ਕਿ ਇਹ value ਕੀ ਹੈ ਅਤੇ ਇਹ ਕੀ ਕਰ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

* 42 ਇੱਕ Int ਹੈ (ਪੂਰਨ ਅੰਕ)
* "Hello" ਇੱਕ String ਹੈ (ਸਟ੍ਰਿੰਗ)
* true ਇੱਕ Bool ਹੈ (ਬੂਲੀਅਨ ਮੁੱਲ)

ਇਹ ਵੱਖ-ਵੱਖ ਕਿਸਮਾਂ ਨਾਲ ਸੰਬੰਧਤ ਹਨ, ਅਤੇ ਉਹਨਾਂ ਦੀ ਵਰਤੋਂ ਵੀ ਵੱਖਰੀ ਹੁੰਦੀ ਹੈ।

## Swift ਦੀਆਂ ਆਮ ਬੁਨਿਆਦੀ ਕਿਸਮਾਂ

ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ, ਸਭ ਤੋਂ ਆਮ ਕਿਸਮਾਂ ਇਹ ਹਨ:

* String: ਸਟ੍ਰਿੰਗ (ਟੈਕਸਟ)
* Int: ਪੂਰਨ ਅੰਕ
* Double: ਦਸ਼ਮਲਵ ਵਾਲਾ ਅੰਕ (ਉੱਚ ਸਹੀਤਾ)
* Bool: ਬੂਲੀਅਨ ਮੁੱਲ (true/false)

ਇਸ ਤੋਂ ਇਲਾਵਾ Float ਵੀ ਹੁੰਦਾ ਹੈ (floating-point number), ਪਰ ਇਸਦੀ precision Double ਨਾਲੋਂ ਘੱਟ ਹੁੰਦੀ ਹੈ, ਇਸ ਲਈ ਆਮ ਤੌਰ 'ਤੇ ਘੱਟ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ; Character ਵੀ ਹੁੰਦਾ ਹੈ, ਜੋ ਇੱਕ ਇਕੱਲੇ ਅੱਖਰ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ, ਜਿਵੇਂ "A", "!" ਆਦਿ।

### ਕਿਸਮ ਘੋਸ਼ਣਾ (Explicit Type)

Swift ਵਿੱਚ, variable declare ਕਰਦੇ ਸਮੇਂ ਅਸੀਂ ਉਸਦੀ ਕਿਸਮ manually ਵੀ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Variable ਦੇ ਨਾਮ ਤੋਂ ਬਾਅਦ ": ਕਿਸਮ" ਲਿਖ ਕੇ ਉਸਦੀ type declare ਕੀਤੀ ਜਾਂਦੀ ਹੈ।

Array ਦੀ ਕਿਸਮ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖੀ ਜਾਂਦੀ ਹੈ: ": [ਕਿਸਮ]"

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

ਇਸ ਕੋਡ ਵਿੱਚ, scores array ਸਿਰਫ Int ਕਿਸਮ ਦੇ elements ਹੀ ਸੰਭਾਲ ਸਕਦੀ ਹੈ, ਅਤੇ tags ਸਿਰਫ String ਕਿਸਮ ਦੇ।

Explicit type declaration ਨਾਲ code ਦਾ intent ਹੋਰ ਸਪੱਸ਼ਟ ਬਣ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਕੁਝ ਹਾਲਤਾਂ ਵਿੱਚ type inference ਦੀਆਂ ਗਲਤੀਆਂ ਤੋਂ ਵੀ ਬਚਿਆ ਜਾ ਸਕਦਾ ਹੈ।

## ਕਿਸਮ ਅਨੁਮਾਨ (Type Inference)

ਕਈ ਹਾਲਤਾਂ ਵਿੱਚ, ਸਾਨੂੰ ਕਿਸਮ explicitly ਲਿਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਹੁੰਦੀ:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

ਇਹ ਇਸ ਲਈ ਹੁੰਦਾ ਹੈ ਕਿਉਂਕਿ Swift compiler "initial value" ਦੇ ਆਧਾਰ 'ਤੇ type ਆਪਣੇ ਆਪ infer ਕਰ ਲੈਂਦਾ ਹੈ।

## Explicit declaration ਅਤੇ Type Inference

ਪਿਛਲੀਆਂ ਕਲਾਸਾਂ ਵਿੱਚ ਅਸੀਂ explicit declaration introduce ਨਹੀਂ ਕੀਤਾ ਸੀ, ਜਿਵੇਂ:

```swift
var age: Int = 18
```

ਇਸ ਦੀ ਬਜਾਏ ਅਸੀਂ ਪਹਿਲਾਂ type inference ਵਰਤੀ ਸੀ:

```swift
var age = 18
```

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, ਦੋਵੇਂ ਲਿਖਤਾਂ ਇੱਕੋ ਜਿਹੀਆਂ ਹਨ, ਕਿਉਂਕਿ age ਦੋਹਾਂ ਵਿੱਚ Int type ਹੀ ਬਣੇਗੀ। ਇਸ ਦੇ ਮੁਕਾਬਲੇ, type inference ਵਾਲੀ ਲਿਖਤ ਹੋਰ ਸੰਖੇਪ ਹੁੰਦੀ ਹੈ।

ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ explicit declaration 'ਤੇ ਜ਼ੋਰ ਨਾ ਦੇਣ ਦਾ ਕਾਰਣ ਇਹ ਹੈ ਕਿ type inference code ਵਿੱਚ ਵਾਧੂ ਜਾਣਕਾਰੀ ਘਟਾ ਦਿੰਦੀ ਹੈ, ਜਿਸ ਨਾਲ beginners ਲਈ ਸਮਝਣਾ ਆਸਾਨ ਹੋ ਜਾਂਦਾ ਹੈ।

## ਕਿਸਮ ਦੀ ਲੋੜ ਕਿਉਂ ਹੈ

Swift ਇੱਕ strongly typed language ਹੈ।

ਇਸਦਾ ਮਤਲਬ ਹੈ: ਜਿਵੇਂ ਹੀ variable ਦੀ type ਤੈਅ ਹੋ ਜਾਂਦੀ ਹੈ, ਉਸਨੂੰ ਮਨਮਰਜ਼ੀ ਨਾਲ ਨਹੀਂ ਬਦਲਿਆ ਜਾ ਸਕਦਾ।

ਉਦਾਹਰਨ ਲਈ:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

ਪਹਿਲਾ 20 ਇੱਕ Int type ਹੈ, ਇਸ ਲਈ age ਨੂੰ assign ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ; ਦੂਜਾ "20" ਇੱਕ String type ਹੈ, ਜੋ Int ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦੀ, ਇਸ ਲਈ error ਆਉਂਦੀ ਹੈ।

nums ਇੱਕ [Int] type array ਹੈ, ਇਸ ਲਈ ਇਸ ਵਿੱਚ ਸਿਰਫ integers ਹੀ store ਹੋ ਸਕਦੇ ਹਨ, string mix ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ।

Type data ਦੀ ਵਰਤੋਂ ਨੂੰ ਸੀਮਿਤ ਕਰਦੀ ਹੈ, ਅਤੇ compile stage 'ਤੇ type mismatch ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ ਪਤਾ ਲਗਾ ਲੈਂਦੀ ਹੈ, ਜਿਸ ਨਾਲ type confusion ਕਾਰਨ ਆਉਣ ਵਾਲੇ bugs ਘਟਦੇ ਹਨ, ਅਤੇ code ਹੋਰ stable ਅਤੇ maintainable ਬਣਦਾ ਹੈ।

## ਕਦੋਂ explicit type declaration ਲਾਜ਼ਮੀ ਹੁੰਦੀ ਹੈ

ਹਾਲਾਂਕਿ Swift ਆਪਣੇ ਆਪ type infer ਕਰ ਸਕਦੀ ਹੈ, ਪਰ ਕੁਝ ਹਾਲਤਾਂ ਵਿੱਚ compiler type infer ਨਹੀਂ ਕਰ ਸਕਦਾ, ਜਾਂ ਗਲਤ infer ਕਰ ਸਕਦਾ ਹੈ। ਐਸੇ ਵੇਲੇ ਸਾਨੂੰ ਹੱਥੋਂ type declare ਕਰਨੀ ਪੈਂਦੀ ਹੈ।

**1. ਖਾਲੀ array**

ਜਦੋਂ ਇੱਕ empty array ਬਣਾਈ ਜਾਂਦੀ ਹੈ, ਤਾਂ type explicitly declare ਕਰਨੀ ਹੀ ਪੈਂਦੀ ਹੈ:

```swift
var nums: [Int] = []
```

ਜੇ type ਨਾ ਲਿਖੀ ਜਾਵੇ:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compiler ਖਾਲੀ array ਦੇ ਆਧਾਰ 'ਤੇ ਇਹ ਨਹੀਂ ਜਾਣ ਸਕਦਾ ਕਿ array ਦੇ elements ਦੀ type ਕੀ ਹੋਵੇਗੀ, ਇਸ ਲਈ compile error ਆਉਂਦੀ ਹੈ।

**2. ਗਲਤ inference ਤੋਂ ਬਚਣਾ**

```swift
var value = 10   // Int
```

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, ਹਾਲਾਂਕਿ 10 ਨੂੰ floating-point number (Double) ਵਜੋਂ ਵੀ ਦਰਸਾਇਆ ਜਾ ਸਕਦਾ ਹੈ, ਪਰ ਕਿਉਂਕਿ ਇਸ ਵਿੱਚ decimal point ਨਹੀਂ ਹੈ, compiler ਇਸਨੂੰ default ਰੂਪ ਵਿੱਚ Int infer ਕਰੇਗਾ।

ਜੇ ਤੁਸੀਂ ਚਾਹੁੰਦੇ ਹੋ ਕਿ value ਇੱਕ floating-point number ਹੋਵੇ, ਤਾਂ ਤੁਹਾਨੂੰ explicit type declaration ਕਰਨੀ ਪਵੇਗੀ:

```swift
var value: Double = 10   // Double
```

ਜਦੋਂ type inference ਦਾ ਨਤੀਜਾ ਉਮੀਦ ਦੇ ਅਨੁਸਾਰ ਨਾ ਹੋਵੇ, ਤਾਂ explicit declaration ਜਾਂ literal ਦੇ ਰੂਪ ਨੂੰ ਬਦਲ ਕੇ ਸਹੀ type ਨਿਰਧਾਰਤ ਕਰਨੀ ਚਾਹੀਦੀ ਹੈ।

**3. Custom types**

ਅੱਗੇ ਅਸੀਂ custom types ਵੀ ਸਿੱਖਾਂਗੇ। Custom types ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਸਮੇਂ ਵੀ ਅਕਸਰ explicit declaration ਦੀ ਲੋੜ ਪੈਂਦੀ ਹੈ:

```swift
var info: GameInfo
var users: [User] = []
```

ਇਸ ਦਾ ਕਾਰਣ ਵੀ empty array ਵਾਲੇ ਕਾਰਣ ਵਰਗਾ ਹੀ ਹੈ — compiler ਖਾਲੀ value ਦੇ ਆਧਾਰ 'ਤੇ type ਆਪਣੇ ਆਪ infer ਨਹੀਂ ਕਰ ਸਕਦਾ।

## ਕਿਸਮ ਬਦਲਾਅ (Type Conversion)

Swift ਵਿੱਚ, ਵੱਖ-ਵੱਖ ਕਿਸਮਾਂ ਦੇ ਵਿਚਕਾਰ automatic conversion ਨਹੀਂ ਹੁੰਦੀ; ਇਸਨੂੰ manually convert ਕਰਨਾ ਪੈਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਦੋ ਵੱਖ-ਵੱਖ types ਦੇ ਅੰਕ ਜੋੜਣ ਵੇਲੇ:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

ਇਸ ਕੋਡ ਵਿੱਚ, a ਇੱਕ Int ਹੈ ਅਤੇ b ਇੱਕ Double ਹੈ। ਦੋਹਾਂ ਦੀ type ਵੱਖਰੀ ਹੈ, ਇਸ ਲਈ ਇਹਨਾਂ 'ਤੇ ਸਿੱਧਾ operation ਨਹੀਂ ਹੋ ਸਕਦਾ।

Calculation ਤੋਂ ਪਹਿਲਾਂ, ਇੱਕ value ਨੂੰ ਦੂਜੀ ਵਾਲੀ same type ਵਿੱਚ convert ਕਰਨਾ ਪੈਂਦਾ ਹੈ:

```swift
var result = Double(a) + b
```

ਇਸ ਕੋਡ ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਪਹਿਲਾਂ Int type ਵਾਲੇ a ਨੂੰ Double ਵਿੱਚ convert ਕੀਤਾ ਗਿਆ, ਫਿਰ ਉਸਨੂੰ b ਨਾਲ ਜੋੜਿਆ ਗਿਆ, ਅਤੇ ਨਤੀਜਾ result ਵਿੱਚ store ਕੀਤਾ ਗਿਆ।

ਇਹ ਧਿਆਨ ਵਿੱਚ ਰੱਖਣਾ ਜ਼ਰੂਰੀ ਹੈ ਕਿ type conversion original variable ਦੀ type ਨਹੀਂ ਬਦਲਦੀ। ਉਦਾਹਰਨ ਲਈ, Double(a) a ਦੀ Int type ਨੂੰ ਨਹੀਂ ਬਦਲਦਾ; ਇਹ ਸਿਰਫ ਇੱਕ ਨਵੀਂ Double value ਬਣਾਉਂਦਾ ਹੈ ਜੋ calculation ਵਿੱਚ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਹੋਰ ਕਿਸਮਾਂ ਨੂੰ ਵੀ ਇਸੇ ਤਰ੍ਹਾਂ convert ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ, ਅਰਥਾਤ target type + () ਦੇ ਰੂਪ ਵਿੱਚ, ਅਤੇ convert ਕੀਤੀ ਜਾਣ ਵਾਲੀ value ਨੂੰ ਉਸਦੇ ਅੰਦਰ pass ਕੀਤਾ ਜਾਂਦਾ ਹੈ। ਉਦਾਹਰਨ:

```
Int()、Double()、String()
```

ਉਦਾਹਰਨ:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

ਇਹ ਵੀ ਯਾਦ ਰੱਖੋ ਕਿ ਹਰ conversion ਪੂਰੀ ਤਰ੍ਹਾਂ same ਤਰੀਕੇ ਨਾਲ ਕੰਮ ਨਹੀਂ ਕਰਦੀ। ਜਿਵੇਂ Double → Int ਵਿੱਚ decimal ਹਿੱਸਾ ਸਿੱਧਾ ਕੱਟ ਦਿੱਤਾ ਜਾਂਦਾ ਹੈ, round off ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ।

## ਕਿਸਮ ਲਈ ਉਪਨਾਮ (Type Alias)

Swift ਵਿੱਚ, ਅਸੀਂ ਮੌਜੂਦਾ type ਲਈ ਇੱਕ alias ਵੀ ਰੱਖ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ code ਦਾ ਅਰਥ ਹੋਰ ਸਪੱਸ਼ਟ ਹੋ ਜਾਵੇ:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

ਇੱਥੇ UserID ਅਸਲ ਵਿੱਚ ਫਿਰ ਵੀ Int ਹੀ ਹੈ; type ਨਹੀਂ ਬਦਲੀ, ਸਿਰਫ ਨਾਮ ਹੋਰ ਅਰਥਪੂਰਣ ਹੋ ਗਿਆ ਹੈ।

ਵੱਡੇ codebase ਅਤੇ complex types ਵਾਲੇ projects ਵਿੱਚ type alias code ਨੂੰ ਹੋਰ readable ਬਣਾਂਦਾ ਹੈ।

## ਕਿਸਮ ਦਾ ਉਦਾਹਰਨ

ਹੁਣ ਇੱਕ ਸਧਾਰਣ ਉਦਾਹਰਨ ਰਾਹੀਂ ਵੇਖੀਏ ਕਿ actual development ਵਿੱਚ type ਕੀ ਭੂਮਿਕਾ ਨਿਭਾਂਦੀ ਹੈ।

### Variable ਬਣਾਉਣਾ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ ਇੱਕ age variable ਬਣਾਉਂਦੇ ਹਾਂ:

```swift
var age = 20
```

ਕਿਉਂਕਿ SwiftUI ਵਿੱਚ ਇਸ variable ਨੂੰ display ਅਤੇ modify ਕਰਨਾ ਹੈ, ਇਸ ਲਈ ਇਸਨੂੰ @State ਨਾਲ declare ਕਰਨਾ ਪਵੇਗਾ:

```swift
@State private var age = 20
```

private ਬਾਰੇ ਪਹਿਲਾਂ ਸੰਖੇਪ ਵਿੱਚ ਦੱਸਿਆ ਗਿਆ ਸੀ — ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਇਹ variable ਸਿਰਫ ਮੌਜੂਦਾ view ਦੇ ਅੰਦਰ ਹੀ ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ। ਅੱਗੇ ਇਸਨੂੰ ਹੋਰ ਵਿਸਥਾਰ ਨਾਲ ਸਿੱਖਾਂਗੇ।

### SwiftUI ਵਿੱਚ data ਦਿਖਾਉਣਾ

SwiftUI ਵਿੱਚ age variable ਨੂੰ ਦਿਖਾਉਣ ਲਈ:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

ਹੁਣ view ਇਹ ਦਿਖਾਏਗੀ:

```swift
age: 20
```

### Data ਬਦਲਣਾ

ਅੱਗੇ, ਅਸੀਂ age ਨੂੰ ਬਦਲਣ ਲਈ ਦੋ buttons ਜੋੜਦੇ ਹਾਂ:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### ਚਲਾਉਣ ਦਾ ਨਤੀਜਾ

ਜਦੋਂ changeAge1 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, age ਨੂੰ 18 assign ਹੁੰਦਾ ਹੈ:

```swift
age = 18
```

ਕਿਉਂਕਿ 18 ਇੱਕ Int ਹੈ, ਅਤੇ age ਦੀ type ਵੀ Int ਹੈ, ਇਸ ਲਈ assignment ਸਫਲ ਹੈ।

ਪਰ changeAge2 error ਦੇਵੇਗਾ:

```swift
age = "18"
```

Error message:

```
Cannot assign value of type 'String' to type 'Int'
```

ਇਸ ਦਾ ਕਾਰਣ ਇਹ ਹੈ ਕਿ "18" ਇੱਕ String ਹੈ (ਕਿਉਂਕਿ string ਨੂੰ "" ਨਾਲ ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ), ਜਦਕਿ age ਇੱਕ Int ਹੈ। ਦੋਹਾਂ ਦੀਆਂ ਕਿਸਮਾਂ ਵੱਖਰੀਆਂ ਹਨ, ਇਸ ਲਈ assignment ਨਹੀਂ ਹੋ ਸਕਦੀ।

### Error ਕਿਉਂ ਆਉਂਦੀ ਹੈ?

ਮੁੱਖ ਕਾਰਣ ਇਹ line ਹੈ:

```swift
@State private var age = 20   // Int
```

ਭਾਵੇਂ ਇੱਥੇ type explicitly ਨਹੀਂ ਲਿਖੀ ਗਈ, ਪਰ initial value 20 ਇੱਕ Int ਹੈ, ਇਸ ਲਈ compiler age ਨੂੰ ਆਪਣੇ ਆਪ Int infer ਕਰ ਲੈਂਦਾ ਹੈ।

ਜਿਵੇਂ ਹੀ type ਤੈਅ ਹੋ ਜਾਂਦੀ ਹੈ, ਉਸ ਤੋਂ ਬਾਅਦ ਉਸ variable ਨੂੰ ਕਿਸੇ ਹੋਰ type ਦੀ value ਨਹੀਂ ਦਿੱਤੀ ਜਾ ਸਕਦੀ।

ਅਤੇ changeAge2 button “runtime 'ਤੇ fail” ਨਹੀਂ ਕਰਦਾ, ਸਗੋਂ compile stage 'ਤੇ ਹੀ error ਦੇ ਦਿੰਦਾ ਹੈ, ਅਤੇ code compile ਹੀ ਨਹੀਂ ਹੁੰਦੀ।

ਇਹ Swift ਦੀ strong typing ਦਾ ਇੱਕ ਵੱਡਾ ਫਾਇਦਾ ਹੈ: type errors coding ਦੇ ਵੇਲੇ ਹੀ ਪਤਾ ਲੱਗ ਜਾਂਦੀਆਂ ਹਨ।

### ਸਹੀ ਲਿਖਤ

Error ਵਾਲਾ code ਹਟਾਉਣ ਤੋਂ ਬਾਅਦ:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

changeAge1 button 'ਤੇ click ਕਰਨ ਤੋਂ ਬਾਅਦ, view ਇਹ ਹੋ ਜਾਵੇਗੀ:

```
age: 18
```

### Explicit type declaration (ਵਿਕਲਪਿਕ)

ਚਾਹੋ ਤਾਂ define ਕਰਦੇ ਸਮੇਂ type explicitly ਵੀ ਲਿਖ ਸਕਦੇ ਹੋ:

```swift
@State private var age: Int = 20
```

ਇਹ ਲਿਖਤ type ਨੂੰ ਹੋਰ ਸਪੱਸ਼ਟ ਕਰਦੀ ਹੈ, ਪਰ ਸਧਾਰਣ ਹਾਲਤਾਂ ਵਿੱਚ ਇਹ ਲਾਜ਼ਮੀ ਨਹੀਂ ਹੈ।

## ਸੰਖੇਪ

ਇਸ ਪਾਠ ਵਿੱਚ Swift ਦੀ type system ਅਤੇ actual development ਵਿੱਚ ਇਸਦੀ ਭੂਮਿਕਾ ਬਾਰੇ ਗੱਲ ਕੀਤੀ ਗਈ।

Swift ਵਿੱਚ ਹਰ value ਦੀ ਇੱਕ ਸਪੱਸ਼ਟ type ਹੁੰਦੀ ਹੈ। Type ਇਹ ਨਿਰਧਾਰਤ ਕਰਦੀ ਹੈ ਕਿ data ਦਾ ਅਰਥ ਕੀ ਹੈ ਅਤੇ ਉਹ ਕਿਹੜੀਆਂ operations ਵਿੱਚ ਭਾਗ ਲੈ ਸਕਦੀ ਹੈ।

Swift strongly typed ਹੈ, ਇਸ ਲਈ ਇੱਕ variable ਦੀ type ਇਕ ਵਾਰ ਤੈਅ ਹੋਣ ਤੋਂ ਬਾਅਦ ਉਸਨੂੰ ਕਿਸੇ ਹੋਰ type ਦੀ value ਨਹੀਂ ਦਿੱਤੀ ਜਾ ਸਕਦੀ। ਇਹ constraint compile stage 'ਤੇ errors ਪਤਾ ਲਗਾ ਸਕਦੀ ਹੈ, ਜਿਸ ਨਾਲ runtime ਸਮੱਸਿਆਵਾਂ ਘਟਦੀਆਂ ਹਨ ਅਤੇ code ਦੀ safety ਵਧਦੀ ਹੈ।

Variable ਦੀ type initial value ਤੋਂ ਆਪਣੇ ਆਪ infer ਹੋ ਸਕਦੀ ਹੈ, ਜਾਂ explicitly ਵੀ declare ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ। ਕੁਝ ਹਾਲਤਾਂ ਵਿੱਚ (ਜਿਵੇਂ empty array, wrong inference, custom type), compiler ਸਹੀ type infer ਨਹੀਂ ਕਰ ਸਕਦਾ, ਅਤੇ ਤਦ explicit declaration ਲਾਜ਼ਮੀ ਹੁੰਦੀ ਹੈ।

ਵੱਖ-ਵੱਖ types ਵਿਚਕਾਰ automatic conversion ਨਹੀਂ ਹੁੰਦੀ; Int()、Double()、String() ਵਰਗੇ ਤਰੀਕਿਆਂ ਨਾਲ explicit conversion ਕਰਨੀ ਪੈਂਦੀ ਹੈ।

Types ਲਈ aliases ਵੀ ਵਰਤੇ ਜਾ ਸਕਦੇ ਹਨ, ਅਤੇ ਖਾਸ ਕਰਕੇ complex projects ਵਿੱਚ type alias readability ਵਧਾਉਂਦਾ ਹੈ।

Type ਸਿਰਫ data label ਨਹੀਂ ਹੈ, ਇਹ ਇੱਕ constraint mechanism ਵੀ ਹੈ, ਜੋ ਇਹ ਯਕੀਨੀ ਬਣਾਂਦੀ ਹੈ ਕਿ data ਦੀ ਵਰਤੋਂ safe, ਸਪੱਸ਼ਟ ਅਤੇ controllable ਹੋਵੇ।

## ਵਾਧੂ ਗਿਆਨ - Optional Type

Type conversion ਕਰਦੇ ਸਮੇਂ, ਕੁਝ operations fail ਵੀ ਹੋ ਸਕਦੀਆਂ ਹਨ।

ਉਦਾਹਰਨ ਲਈ, String ਨੂੰ Double ਵਿੱਚ convert ਕਰਨਾ:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

ਇੱਥੇ Double(input) ਦਾ return type Double ਨਹੀਂ, ਸਗੋਂ ਇਹ ਹੈ:

```
Double?
```

ਇਸਨੂੰ Optional type ਕਹਿੰਦੇ ਹਨ।

### Optional type ਕਿਉਂ ਵਾਪਸ ਆਉਂਦੀ ਹੈ?

ਕਿਉਂਕਿ string ਦੀ ਅੰਦਰਲੀ value ਯਕੀਨੀ ਨਹੀਂ ਹੁੰਦੀ। "3.14" ਨੂੰ Double ਵਿੱਚ convert ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ, ਪਰ "Hello" ਨੂੰ ਨਹੀਂ।

ਅਰਥਾਤ, ਇਹ operation ਸਫਲ ਵੀ ਹੋ ਸਕਦੀ ਹੈ, ਅਤੇ ਅਸਫਲ ਵੀ।

ਇਸ ਲਈ Swift ਇਸ ਅਨਿਸ਼ਚਿਤਤਾ ਨੂੰ ਦਰਸਾਉਣ ਲਈ optional type ਵਰਤਦੀ ਹੈ।

### Optional type ਕੀ ਹੁੰਦੀ ਹੈ?

Optional type ਦਾ ਮਤਲਬ ਹੈ: ਇੱਕ value ਹੋ ਸਕਦੀ ਹੈ, ਜਾਂ ਨਹੀਂ ਵੀ ਹੋ ਸਕਦੀ।

ਉਦਾਹਰਨ ਵਜੋਂ:

```
Double?
```

ਇਸ type ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਜੇ value ਮੌਜੂਦ ਹੋਵੇ, ਤਾਂ print ਕਰਨ 'ਤੇ Optional(...) ਦੇ ਰੂਪ ਵਿੱਚ ਦਿਖੇਗੀ; ਜੇ value ਮੌਜੂਦ ਨਾ ਹੋਵੇ, ਤਾਂ nil ਵਾਪਸ ਆਏਗਾ।

ਇਹ ਧਿਆਨ ਵਿੱਚ ਰੱਖਣਾ ਜ਼ਰੂਰੀ ਹੈ ਕਿ nil ਦਾ ਮਤਲਬ "ਕੋਈ value ਨਹੀਂ" ਹੈ, ਨਾ ਕਿ 0 ਜਾਂ empty string।

### ਉਦਾਹਰਨ

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```
pi:Optional(3.14)
```

ਇਸ ਦਾ ਮਤਲਬ ਹੈ ਕਿ string ਸਫਲਤਾਪੂਰਵਕ Double ਵਿੱਚ convert ਹੋ ਗਈ, ਅਤੇ 3.14 ਮਿਲਿਆ, ਪਰ ਕਿਉਂਕਿ type Double? ਹੈ, ਇਸ ਲਈ ਇਹ Optional ਵਿੱਚ wrap ਹੋਇਆ ਹੈ।

ਜੇ conversion fail ਹੋ ਜਾਵੇ:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```
pi: nil
```

ਕਿਉਂਕਿ "Hello" ਨੂੰ Double type ਵਿੱਚ convert ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ, conversion ਅਸਫਲ ਰਹੀ ਅਤੇ nil ਮਿਲਿਆ।

### Optional(...) ਕੀ ਹੈ?

ਜਦੋਂ ਅਸੀਂ optional type ਨੂੰ ਸਿੱਧਾ print ਕਰਦੇ ਹਾਂ:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift ਇਸਦੀ “debug description” ਦਿਖਾਉਂਦੀ ਹੈ:

```
Optional(3.14)
```

ਇਹ actual data ਦਾ ਹਿੱਸਾ ਨਹੀਂ ਹੁੰਦਾ, ਸਗੋਂ ਇਹ ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ ਮੌਜੂਦਾ value ਇੱਕ optional type ਹੈ, ਅਤੇ ਇਸਦੇ ਅੰਦਰ ਇੱਕ value ਮੌਜੂਦ ਹੈ।

### Optional ਨੂੰ unwrap ਕਰਨਾ

ਅਸਲ development ਵਿੱਚ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ optional ਦੇ ਅੰਦਰਲੀ actual value ਲੈਣਾ ਚਾਹੁੰਦੇ ਹਾਂ। ਇਸ process ਨੂੰ unwrapping ਕਹਿੰਦੇ ਹਨ।

ਇੱਕ ਆਮ ਤਰੀਕਾ ਹੈ ?? ਦੀ ਵਰਤੋਂ ਕਰਕੇ default value ਦੇਣਾ:

```
??
```

ਇਸਨੂੰ Nil-Coalescing Operator ਕਹਿੰਦੇ ਹਨ।

ਉਦਾਹਰਨ ਲਈ:

```swift
name ?? "FangJunyu"
```

ਇਸ ਕੋਡ ਦਾ ਮਤਲਬ ਹੈ: ਜੇ name ਵਿੱਚ value ਹੈ, ਤਾਂ ਉਹੀ ਵਾਪਸ ਦਿਓ; ਜੇ name nil ਹੈ, ਤਾਂ default value "FangJunyu" ਵਰਤੋ।

ਇਹ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ default value ਦੀ type, optional type ਦੇ ਅੰਦਰ ਵਾਲੀ type ਨਾਲ ਮਿਲਦੀ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ।

### ?? ਨਾਲ default value ਦੇਣਾ

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```
pi: 30
```

ਜਦੋਂ input ਨੂੰ Double ਵਿੱਚ convert ਕੀਤਾ ਜਾਂਦਾ ਹੈ, conversion ਸਫਲ ਰਹਿੰਦੀ ਹੈ ਅਤੇ ਉਸਦੀ value output ਹੁੰਦੀ ਹੈ। ਜੇ conversion fail ਹੋਵੇ, ਤਾਂ ?? ਨਾਲ ਦਿੱਤੀ default value output ਹੁੰਦੀ ਹੈ।

ਜੇ conversion fail ਹੋ ਜਾਵੇ:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```
pi: 10
```

ਇੱਥੇ input ਨੂੰ Double ਵਿੱਚ convert ਕਰਦੇ ਸਮੇਂ conversion ਅਸਫਲ ਰਹੀ, ਅਤੇ nil ਮਿਲਿਆ। ਇਸ ਲਈ ?? ਨੇ nil ਦੀ ਥਾਂ default value ਦੇ ਦਿੱਤੀ।

Optional type ਇਸ ਗੱਲ ਨੂੰ ਦਰਸਾਉਣ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ ਕਿ “ਕੋਈ value ਹੋ ਵੀ ਸਕਦੀ ਹੈ, ਅਤੇ ਨਹੀਂ ਵੀ ਹੋ ਸਕਦੀ”।

Type conversion ਵਰਗੀਆਂ ਉਹ operations ਜੋ fail ਹੋ ਸਕਦੀਆਂ ਹਨ, Swift ਉਹਨਾਂ ਲਈ optional type return ਕਰਦੀ ਹੈ, ਤਾਂ ਜੋ program ਸੁਰੱਖਿਅਤ ਰਹੇ।

ਜਦੋਂ ਸਾਨੂੰ ਉਸਦੇ ਅੰਦਰਲੀ value ਵਰਤਣੀ ਹੁੰਦੀ ਹੈ, ਅਸੀਂ ?? ਦੀ ਮਦਦ ਨਾਲ ਇੱਕ default value ਦੇ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ nil ਆਉਣ 'ਤੇ ਵੀ ਇੱਕ ਉਚਿਤ ਨਤੀਜਾ ਮਿਲ ਸਕੇ।
