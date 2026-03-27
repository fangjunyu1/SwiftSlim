# ٹائپ سسٹم

پچھلے اسباق میں ہم variables سیکھ چکے ہیں، اور یہ بھی جانتے ہیں کہ variables مختلف قسم کا data محفوظ کر سکتے ہیں۔

مثلاً:

```swift
var hello = "Hello, World"
```

یہاں `hello` ایک متن محفوظ کر رہا ہے، اس لیے اس کی type `String` ہے۔

اب ہم منظم انداز میں type (Type) کے تصور کو سیکھیں گے، اور ساتھ ہی explicit type declaration اور type inference بھی سمجھیں گے، تاکہ variable کی اصل nature کو زیادہ گہرائی سے سمجھ سکیں۔

## Type کیا ہے

Swift میں ہر value کی ایک واضح type ہوتی ہے۔ Type یہ طے کرتی ہے کہ یہ value کیا ہے، اور اس کے ساتھ کیا کیا جا سکتا ہے۔

مثلاً:

* `42` ایک `Int` ہے (صحیح عدد)
* `"Hello"` ایک `String` ہے (string)
* `true` ایک `Bool` ہے (boolean)

یہ سب مختلف types ہیں، اور ان کے استعمال بھی مختلف ہوتے ہیں۔

## Swift کی عام بنیادی types

ابتدائی مرحلے میں سب سے عام types یہ ہیں:

* `String`：string (متن)
* `Int`：صحیح عدد
* `Double`：floating-point number (اعشاریہ والا عدد، نسبتاً زیادہ precision کے ساتھ)
* `Bool`：boolean value (`true/false`)

اس کے علاوہ `Float` بھی ہے (floating-point number)، لیکن اس کی precision `Double` سے کم ہوتی ہے، اس لیے یہ نسبتاً کم استعمال ہوتی ہے؛ `Character` بھی ہے، جو ایک single character کو ظاہر کرتی ہے، جیسے `"A"`، `"!"` وغیرہ۔

### Type declaration (explicit type)

Swift میں variable declare کرتے وقت type کو manually بھی لکھا جا سکتا ہے:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Variable کے نام کے بعد `: Type` لکھ کر اس کی type declare کی جاتی ہے۔

Array کی type کا syntax `: [Type]` ہوتا ہے:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

اس code میں `scores` array صرف `Int` type کے elements محفوظ کر سکتی ہے، جبکہ `tags` صرف `String` elements محفوظ کر سکتی ہے۔

Explicit type declaration سے code کی نیت زیادہ واضح ہو جاتی ہے، اور بعض صورتوں میں type inference کی غلطیوں سے بچا جا سکتا ہے۔

## Type inference

کئی صورتوں میں type کو explicitly لکھنے کی ضرورت نہیں ہوتی:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"     // String
var isLogin = false  // Bool
var scores = [90, 85, 78]   // [Int]
var tags = ["Swift", "iOS"] // [String]
```

ایسا اس لیے ممکن ہے کیونکہ Swift compiler "initial value" کو دیکھ کر type خود بخود infer کر لیتا ہے۔

## Explicit declaration اور type inference

پچھلے اسباق میں ہم نے explicit declaration متعارف نہیں کرائی تھی، مثلاً:

```swift
var age: Int = 18
```

بلکہ ہم نے پہلے type inference استعمال کی:

```swift
var age = 18
```

اس مثال میں یہ دونوں لکھنے کے طریقے ایک ہی معنی رکھتے ہیں، اور `age` دونوں صورتوں میں `Int` ہی ہوگی۔ فرق صرف یہ ہے کہ type inference زیادہ مختصر ہے۔

ابتدائی مرحلے میں explicit declaration پر زور نہ دینے کی وجہ یہ ہے کہ type inference code میں اضافی معلومات کم کر دیتی ہے، اور اس سے beginner کے لیے سمجھنے کی لاگت کم ہو جاتی ہے۔

## Type کی ضرورت کیوں ہے

Swift ایک strongly typed language ہے۔

اس کا مطلب یہ ہے: ایک بار variable کی type طے ہو جائے، تو اسے من مانے طریقے سے تبدیل نہیں کیا جا سکتا۔

مثلاً:

```swift
var age: Int = 18

age = 20    // Success
age = "20"  // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

پہلا `20` ایک `Int` ہے، اس لیے اسے `age` کو assign کیا جا سکتا ہے؛ دوسرا `"20"` ایک `String` ہے، اور چونکہ یہ `Int` نہیں ہے اس لیے error آئے گی۔

`nums` ایک `[Int]` array ہے، اس لیے اس میں صرف integers آ سکتے ہیں، strings نہیں۔

Type data کے استعمال پر پابندی لگاتی ہے، اور compile stage پر ہی type mismatch والی problems کو پکڑ لیتی ہے۔ اس سے type confusion سے پیدا ہونے والے bugs کم ہوتے ہیں، اور code کی stability اور maintainability بہتر ہوتی ہے۔

## کب explicit type declaration ضروری ہوتی ہے

اگرچہ Swift زیادہ تر صورتوں میں type خود infer کر لیتی ہے، لیکن کچھ حالات ایسے ہوتے ہیں جہاں compiler type infer نہیں کر پاتا، یا غلط infer کرتا ہے۔ ایسے وقت explicit declaration ضروری ہو جاتی ہے۔

**1. Empty array**

جب ایک خالی array بنائی جائے، تو type کو explicitly declare کرنا ضروری ہے:

```swift
var nums: [Int] = []
```

اگر type نہ لکھی جائے:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compiler خالی array کو دیکھ کر یہ نہیں جان سکتا کہ اس میں کس type کے elements آئیں گے، اس لیے compile error آتی ہے۔

**2. Inference کی غلطی سے بچنا**

```swift
var value = 10   // Int
```

اس مثال میں اگرچہ `10` کو floating-point number (`Double`) بھی سمجھا جا سکتا ہے، لیکن چونکہ اس میں decimal point نہیں ہے، compiler اسے default طور پر `Int` سمجھے گا۔

اگر آپ چاہتے ہیں کہ `value` ایک `Double` ہو، تو type کو explicitly لکھنا ہوگا:

```swift
var value: Double = 10   // Double
```

جب type inference کا نتیجہ توقع کے مطابق نہ ہو، تو explicit declaration یا literal کی شکل بدل کر type کو درست کرنا چاہیے۔

**3. Custom types**

آگے چل کر ہم custom types بھی سیکھیں گے۔ Custom types استعمال کرتے وقت بھی اکثر explicit declaration کی ضرورت پڑتی ہے:

```swift
var info: GameInfo
var users: [User] = []
```

یہی وجہ ہے جو empty array والی مثال میں تھی: compiler خالی value سے type خود infer نہیں کر سکتا۔

## Type conversion

Swift میں مختلف types کے درمیان خودکار conversion نہیں ہوتی، اسے manually کرنا پڑتا ہے۔

مثلاً، دو مختلف types کے numbers کو جمع کرنا:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b   // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

اس code میں `a` ایک `Int` ہے، جبکہ `b` ایک `Double` ہے۔ دونوں کی types مختلف ہیں، اس لیے براہِ راست جمع نہیں ہو سکتے۔

Calculation سے پہلے ایک value کو دوسری کے مطابق convert کرنا پڑے گا:

```swift
var result = Double(a) + b
```

اس کا مطلب ہے کہ `a` کو `Int` سے `Double` میں convert کیا گیا، اور پھر `b` کے ساتھ جمع کیا گیا، اور نتیجہ `result` میں محفوظ ہوا۔

یہ بات اہم ہے کہ type conversion اصل variable کی type نہیں بدلتی۔ مثال کے طور پر `Double(a)`، `a` کو مستقل طور پر `Double` نہیں بناتا، بلکہ صرف calculation کے لیے ایک نئی `Double` value بناتا ہے۔

دوسری types کے لیے بھی اسی طرح conversion کی جا سکتی ہے، یعنی target type + `()` کی شکل میں value کو پاس کیا جاتا ہے۔

مثلاً:

```swift
Int()、Double()、String()
```

مثال:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

یہ بھی یاد رکھنا چاہیے کہ ہر conversion مکمل معنی میں کامیاب نہیں ہوتی۔ مثلاً `Double → Int` میں decimal part سیدھا truncate ہو جاتا ہے، rounding نہیں ہوتی۔

## Type alias

Swift میں موجودہ type کے لیے ایک alias بھی رکھا جا سکتا ہے، تاکہ code کی semantics زیادہ واضح ہو جائیں:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

یہاں `UserID` بنیادی طور پر اب بھی `Int` ہی ہے، یعنی type حقیقت میں تبدیل نہیں ہوئی، صرف نام زیادہ معنی خیز ہو گیا ہے۔

بڑی codebase اور پیچیدہ types والے projects میں type alias code کو زیادہ readable بناتی ہے۔

## Type کی مثال

اب ایک سادہ example کے ذریعے دیکھتے ہیں کہ practical development میں type کیا کردار ادا کرتی ہے۔

### Variable بنانا

سب سے پہلے ایک `age` variable بناتے ہیں:

```swift
var age = 20
```

چونکہ ہمیں اس variable کو SwiftUI میں دکھانا اور تبدیل کرنا ہے، اس لیے اسے `@State` کے ساتھ declare کرنا ہوگا:

```swift
@State private var age = 20
```

`private` کا ذکر ہم پہلے بھی کر چکے ہیں، اس کا مطلب ہے کہ یہ variable صرف موجودہ view کے اندر استعمال ہوگی۔ آگے اس پر مزید تفصیل آئے گی۔

### SwiftUI میں data دکھانا

SwiftUI میں `age` variable کو دکھانا:

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

اب view میں یہ دکھائی دے گا:

```swift
age: 20
```

### Data کو بدلنا

اب ہم `age` کو بدلنے کے لیے دو buttons شامل کرتے ہیں:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Run ہونے کا نتیجہ

جب `changeAge1` پر click کیا جائے گا، تو `age` کو `18` assign ہو جائے گا:

```swift
age = 18
```

چونکہ `18` ایک `Int` ہے، اور `age` بھی `Int` ہے، اس لیے assignment کامیاب ہوگی۔

لیکن `changeAge2` error دے گا:

```swift
age = "18"
```

Error message:

```swift
Cannot assign value of type 'String' to type 'Int'
```

اس کی وجہ یہ ہے کہ `"18"` ایک `String` ہے (کیونکہ string کو `""` میں لکھا جاتا ہے)، جبکہ `age` ایک `Int` ہے۔ Type مختلف ہے، اس لیے assign نہیں ہو سکتی۔

### Error کیوں آتی ہے؟

اصل نکتہ اس line میں ہے:

```swift
@State private var age = 20   // Int
```

اگرچہ یہاں type explicitly نہیں لکھی گئی، لیکن چونکہ initial value `20` ایک `Int` ہے، اس لیے compiler `age` کو خود بخود `Int` infer کر لیتا ہے۔

ایک بار type طے ہو جائے، تو پھر دوسری type کی value assign نہیں کی جا سکتی۔

اور یہ بھی اہم ہے کہ `changeAge2` والی error runtime پر نہیں، بلکہ compile stage پر ہی آتی ہے، یعنی code compile ہی نہیں ہوگا۔

یہ Swift کی strong typing کا ایک بڑا فائدہ ہے: type کی problems code لکھتے وقت ہی سامنے آ جاتی ہیں۔

### درست لکھنے کا طریقہ

غلط code ہٹانے کے بعد:

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

`changeAge1` button پر click کرنے کے بعد، view یوں update ہوگی:

```swift
age: 18
```

### Explicit type declaration (اختیاری)

آپ define کرتے وقت type کو واضح طور پر بھی لکھ سکتے ہیں:

```swift
@State private var age: Int = 20
```

اس سے type زیادہ صاف نظر آتی ہے، لیکن سادہ scenarios میں یہ ضروری نہیں ہوتی۔

## خلاصہ

اس سبق میں ہم نے Swift کے type system اور practical development میں اس کے کردار کو سمجھا۔

Swift میں ہر value کی ایک واضح type ہوتی ہے، اور type یہ طے کرتی ہے کہ data کیا معنی رکھتی ہے، اور اس پر کون سے operations کیے جا سکتے ہیں۔

Swift strongly typed ہے، اس لیے ایک بار variable کی type طے ہو جائے، تو اسے دوسری type کی value assign نہیں کی جا سکتی۔ یہ پابندی compile stage پر errors پکڑ لیتی ہے، جس سے runtime problems کم ہوتی ہیں اور code زیادہ محفوظ رہتی ہے۔

Variable کی type initial value کی بنیاد پر خود infer ہو سکتی ہے، یا اسے explicitly declare کیا جا سکتا ہے۔ کچھ حالات میں، جیسے empty array، incorrect inference، یا custom types، compiler درست type infer نہیں کر سکتا، اس لیے explicit declaration ضروری ہوتی ہے۔

مختلف types کے درمیان خودکار conversion نہیں ہوتی، بلکہ `Int()`، `Double()`، `String()` وغیرہ کے ذریعے explicit conversion کرنی پڑتی ہے۔

Types کے aliases بھی بنائے جا سکتے ہیں، اور پیچیدہ projects میں یہ readability بہتر کرتے ہیں۔

Type صرف data پر label نہیں لگاتی، بلکہ ایک پابندی کا نظام بھی فراہم کرتی ہے، جو data کے استعمال کو محفوظ، واضح، اور قابلِ کنٹرول بناتا ہے۔

## اضافی علم - Optional types

Type conversion کے دوران بعض operations ناکام بھی ہو سکتی ہیں۔

مثلاً، `String` کو `Double` میں convert کرنا:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

یہاں `Double(input)` ایک `Double` واپس نہیں کرتا، بلکہ:

```swift
Double?
```

یہی optional type ہے۔

### Optional type کیوں واپس آتی ہے؟

کیونکہ string کے اندر موجود content یقینی نہیں ہوتی۔ `"3.14"` کو `Double` میں convert کیا جا سکتا ہے، لیکن `"Hello"` کو نہیں۔

یعنی یہ operation کامیاب بھی ہو سکتی ہے، اور ناکام بھی۔

اسی غیر یقینی کیفیت کو ظاہر کرنے کے لیے Swift optional type استعمال کرتی ہے۔

### Optional type کیا ہے؟

Optional type کا مطلب ہے: ایک value موجود بھی ہو سکتی ہے، اور موجود نہ بھی ہو۔

مثلاً:

```swift
Double?
```

اس type کا مطلب یہ ہے کہ اگر value موجود ہوئی، تو print کرتے وقت `Optional(...)` کی شکل میں نظر آئے گی؛ اور اگر value موجود نہ ہوئی، تو `nil` واپس آئے گا۔

یہ بات اہم ہے کہ `nil` کا مطلب "کوئی value نہیں" ہے، نہ کہ `0` یا empty string۔

### مثال

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```swift
pi:Optional(3.14)
```

اس کا مطلب ہے کہ string کامیابی سے `Double` میں convert ہو گئی، اور `3.14` حاصل ہوا، لیکن چونکہ type `Double?` ہے، اس لیے یہ `Optional` کے اندر لپٹی ہوئی دکھ رہی ہے۔

اگر conversion ناکام ہو:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```swift
pi: nil
```

کیونکہ `"Hello"` کو `Double` میں convert نہیں کیا جا سکتا، اس لیے conversion ناکام ہوئی اور `nil` واپس آیا۔

### `Optional(...)` کیا ہے؟

جب ہم optional type کو براہِ راست print کرتے ہیں:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

تو Swift اس کی "debug description" دکھاتا ہے:

```swift
Optional(3.14)
```

یہ اصل data کا حصہ نہیں ہے، بلکہ یہ صرف یہ بتاتا ہے کہ موجودہ value ایک optional type ہے، اور اس کے اندر ایک حقیقی value موجود ہے۔

### Optional کو unwrap کرنا

Practical development میں ہم اکثر optional کے اندر موجود اصل value نکالنا چاہتے ہیں۔ اس عمل کو unwrapping کہتے ہیں۔

ایک عام طریقہ `??` کے ذریعے default value دینا ہے:

```swift
??
```

اسے nil-coalescing operator کہا جاتا ہے۔

مثلاً:

```swift
name ?? "FangJunyu"
```

اس code کا مطلب ہے: اگر `name` کے اندر value موجود ہو تو وہی واپس دو؛ اگر `nil` ہو تو default value `"FangJunyu"` استعمال کرو۔

یہ بات ضروری ہے کہ default value کی type optional type کے مطابق ہی ہو۔

### `??` کے ذریعے default value دینا

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")   // 30
```

Output:

```swift
pi: 30
```

یہاں `input` کو `Double` میں convert کیا گیا، conversion کامیاب ہوئی، اس لیے اصل value output ہوئی۔ اگر conversion ناکام ہوتی، تو `??` کے بعد والی default value استعمال ہو جاتی۔

اگر conversion ناکام ہو:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```swift
pi: 10
```

یہاں `input` کو `Double` میں convert کرنا ناکام ہوا، اس لیے `nil` واپس آیا، اور `??` نے `nil` کی جگہ default value دے دی۔

Optional type اس حالت کو ظاہر کرنے کے لیے استعمال ہوتی ہے جہاں "value ہو بھی سکتی ہے، اور نہ بھی ہو"۔

Type conversion جیسے ایسے operations میں جو ناکام ہو سکتے ہیں، Swift optional type واپس کرتی ہے تاکہ program زیادہ محفوظ رہے۔

جب ہمیں اس کے اندر کی value استعمال کرنی ہو، تو `??` کے ذریعے default value دے کر `nil` کی صورت میں بھی ایک معقول نتیجہ حاصل کیا جا سکتا ہے۔
