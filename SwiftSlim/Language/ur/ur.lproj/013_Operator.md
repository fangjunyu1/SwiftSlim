# آپریٹرز

اس سبق میں ہم Swift کے آپریٹرز (Operators) سیکھیں گے۔

جب ہم calculation، comparison، یا logical judgment کرتے ہیں، تو ہمیں operators استعمال کرنے پڑتے ہیں۔ یہ اعمال program کے execution کے ہر مرحلے میں شامل ہوتے ہیں، اور programming کی سب سے بنیادی صلاحیتوں میں سے ایک ہیں۔

```swift
let a = 100 * 8
```

Programming سیکھتے وقت بہت سے لوگ یہ محسوس کرتے ہیں کہ جن لوگوں میں کچھ حد تک mathematical thinking ہوتی ہے، وہ اکثر program logic کو زیادہ آسانی سے سمجھتے ہیں۔ اس کی وجہ یہ ہے کہ programming کی بنیاد ہی “calculation” اور “rule-based judgment” پر ہے، اور یہی وہ بنیادی کام ہیں جو operators انجام دیتے ہیں۔

عملی development میں operators صرف سادہ عددی calculations کے لیے نہیں ہوتے، بلکہ مختلف مخصوص scenarios میں بھی وسیع پیمانے پر استعمال ہوتے ہیں۔

مثلاً، block game میں جب user کسی block کو drag کرکے کسی خاص جگہ رکھتا ہے، تو یہ حساب کرنا پڑتا ہے:

* block کی coordinate position
* وہ جگہیں جہاں block رکھا جا سکتا ہے
* کیا target position قابلِ استعمال ہے یا نہیں

یہ تمام “calculation + judgment” کے عمل بنیادی طور پر operators پر ہی مبنی ہوتے ہیں۔

![Block](../../Resource/013_block.png)

Operators سیکھنا صرف numbers کا حساب سیکھنا نہیں، بلکہ آگے چل کر interface layout، data processing، اور interaction logic کی بنیاد رکھنا بھی ہے۔

## SwiftUI میں calculation چلانے کا طریقہ

SwiftUI میں عموماً calculation کو Button کے ذریعے trigger کیا جاتا ہے، پھر function کے اندر calculation logic لکھی جاتی ہے۔

مثلاً:

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

جب button پر click کیا جائے گا، تو Console میں یہ output آئے گی:

```swift
c: 20
```

اس سبق میں ہم calculation logic کو یکساں طور پر `func` کے اندر لکھیں گے، اسے button سے trigger کریں گے، اور result کو `print` کے ذریعے دکھائیں گے۔

بعد کے examples میں code کو مختصر رکھنے کے لیے ہم calculation result کو براہِ راست code comments میں دکھائیں گے، اور بار بار `print` استعمال نہیں کریں گے۔

## Console output کی تنظیم

چونکہ ہر click پر نئی output پیدا ہوگی، اس لیے Console area کے نیچے دائیں طرف موجود clear button پر click کرکے پرانے logs صاف کیے جا سکتے ہیں، تاکہ موجودہ result کو آسانی سے دیکھا جا سکے۔

![Console](../../Resource/013_console.png)

## Button کی ایک اور syntax

جب button صرف ایک function execute کرتا ہو، تو ایک زیادہ مختصر syntax استعمال کی جا سکتی ہے:

```swift
Button(action: ) {
    // View
}
```

اس syntax میں `action` اس function کو ظاہر کرتا ہے جو button click ہونے پر چلنی ہے (بغیر parameters والی function)، اور curly braces `{}` کے اندر button کا view لکھا جاتا ہے۔

اوپر والی `calculate` function کے ساتھ یہ یوں لکھی جا سکتی ہے:

```swift
Button(action: calculate) {
    Text("Button")
}
```

جب button پر click ہوگا، تو `calculate` function براہِ راست execute ہوگی۔

اس لیے جب button کی logic سادہ ہو، اور صرف ایک function call کرنی ہو، تو `action` والی syntax زیادہ واضح اور بہتر coding style سمجھی جاتی ہے۔

## Arithmetic operators

Arithmetic operators عددی calculations کے لیے استعمال ہوتے ہیں:

* `+` جمع
* `-` تفریق
* `*` ضرب
* `/` تقسیم
* `%` باقی (remainder)

مثال:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

یہ بات یاد رکھنی چاہیے کہ Swift ایک strongly typed language ہے، اس لیے یہ مختلف data types کو خودکار طور پر mix نہیں کرتی:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

جب دونوں values کی types مختلف ہوں، تو type کو manually convert کرنا پڑتا ہے۔

## Comparison operators

Comparison operators دو values کے درمیان تعلق کو جانچنے کے لیے استعمال ہوتے ہیں، اور ان کا result `Bool` ہوتا ہے:

* `==` برابر
* `!=` برابر نہیں
* `>` بڑا
* `<` چھوٹا
* `>=` بڑا یا برابر
* `<=` چھوٹا یا برابر

مثال:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Comparison operators اکثر conditional statements میں استعمال ہوتے ہیں۔ مثلاً “quote carousel” میں ہمیں یہ یقینی بنانا ہوتا ہے کہ index array کی حد سے باہر نہ جائے:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

اگر `index` کی value `sayings.count - 1` سے کم ہو، تو comparison کا result `true` ہوگا، اور `if` کے اندر والی code execute ہوگی؛ اگر result `false` ہو، تو وہ code execute نہیں ہوگی۔

## Logical operators

Logical operators کئی conditions کو ملانے کے لیے استعمال ہوتے ہیں:

* `&&` اور (AND)
* `||` یا (OR)
* `!` نہیں (NOT)

### && اور

جب کئی conditions کا ایک ساتھ درست ہونا ضروری ہو، تو `&&` استعمال کیا جاتا ہے۔

مثلاً:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

اس code میں دو conditions ہیں: `age >= 18` اور `age <= 100`۔

صرف اسی صورت میں `legalAge` `true` ہوگا جب دونوں conditions ایک ساتھ `true` ہوں؛ اگر ایک بھی condition درست نہ ہو، تو نتیجہ `false` ہوگا۔

### || یا

جب کئی conditions میں سے صرف ایک کے درست ہونے کی ضرورت ہو، تو `||` استعمال کیا جاتا ہے۔

مثلاً:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

اس code کا مطلب ہے کہ اگر `money >= 50` یا `creditCard >= 50` میں سے کوئی ایک بھی condition درست ہو، تو `payAllowed` `true` ہوگا۔

صرف اس صورت میں result `false` ہوگا جب دونوں conditions غلط ہوں۔

مثلاً payment scenario میں cash یا credit card میں سے کسی ایک سے payment ہو سکتی ہے۔ اگر دونوں ناکام ہوں، تو payment بھی ناکام ہوگی۔

### ! نہیں

`!` logical NOT operator ہے، اور یہ `Bool` value کو الٹ دیتا ہے۔

سادہ طور پر، `!`، `true` کو `false` اور `false` کو `true` بنا دیتا ہے۔

مثلاً:

```swift
let allowed = true
let result = !allowed   // false
```

یہاں `!allowed` کا مطلب ہے `allowed` کی value کو الٹ دینا۔

یہ بات یاد رکھیں کہ `!` اور `!=` دو الگ operators ہیں: `!` صرف `Bool` value کو الٹتا ہے، جبکہ `!=` comparison operator ہے اور `Bool` result دیتا ہے۔

## Assignment operators

Assignment operators کسی variable کو value دینے یا update کرنے کے لیے استعمال ہوتے ہیں:

* `=` assignment

Variable declaration یا calculation کے دوران assignment استعمال ہوتی ہے:

```swift
let a = 5
```

اس code کا مطلب ہے کہ numeric value `5` کو variable `a` کے حوالے کیا گیا ہے۔

### Compound assignment operators

عملی development میں بنیادی assignment operator کے علاوہ compound assignment operators بھی بہت عام ہیں، جو کسی موجودہ value پر براہِ راست calculation کرکے اسے update کرتے ہیں:

* `+=`
* `-=`
* `*=`
* `/=`

پہلے “counter” والے سبق میں ہم compound assignment operators کو مختصراً دیکھ چکے ہیں۔

مثلاً، جب button پر click کیا جائے تو variable خود بخود بڑھ جائے:

```swift
var num = 10
num += 5   // num = 15
```

اس code کا مطلب ہے کہ `num` اور `5` کو جمع کیا جائے، پھر result کو دوبارہ `num` کو assign کر دیا جائے۔

اس لیے یہ اس کے برابر ہے:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternary operator

Swift میں ternary operator condition کی بنیاد پر دو results میں سے ایک کو return کرتا ہے:

```swift
شرط ? قدر1 : قدر2
```

اس کی logic یہ ہے: اگر condition `true` ہو تو “value1” واپس آئے گی؛ اگر condition `false` ہو تو “value2” واپس آئے گی۔

مثلاً:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

یہ code `showColor` کی value کو check کرے گا: اگر یہ `true` ہو تو `Color.blue` واپس آئے گا، اور background نیلا ہو جائے گا؛ اگر `false` ہو تو `Color.clear` واپس آئے گا، اور background color نظر نہیں آئے گا۔

نوٹ: `Color.clear` کا مطلب transparent color ہے (یعنی کچھ نظر نہیں آئے گا)۔

### if-else سے فرق

Ternary operator logic کے اعتبار سے `if-else` statement کے برابر ہے۔

مثلاً، اوپر والا code یوں بھی لکھا جا سکتا ہے:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

دونوں کی execution logic ایک جیسی ہے: اگر condition `true` ہو تو پہلا result، اگر `false` ہو تو دوسرا result۔

عملی استعمال میں ternary operator زیادہ مختصر ہوتا ہے، اس لیے “دو میں سے ایک” والے سادہ فیصلوں کے لیے یہ زیادہ موزوں ہے، خاص طور پر جب براہِ راست ایک value return کرنی ہو۔

SwiftUI کے View building میں ternary operator بہت عام ہے، مثلاً:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

اس طرح ایک ہی line میں condition کے مطابق view effect کو بدلا جا سکتا ہے۔

## Range operators

Range operators interval یا range ظاہر کرنے کے لیے استعمال ہوتے ہیں:

* `...` closed range (دونوں سروں سمیت)
* `..<` half-open range (دائیں سرے کے بغیر)

مثلاً:

```swift
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

سادہ طور پر، `1...3` کا مطلب 1 سے 3 تک ہے، اور 3 بھی شامل ہے؛ `5..<8` کا مطلب 5 سے 8 تک ہے، لیکن 8 شامل نہیں ہے۔

توسیعی شکلیں (صرف تعارفی):

```swift
5...    // >= 5
...5    // <= 5
```

اسے “one-sided range” کہا جاتا ہے، اور یہ عموماً condition checking یا pattern matching میں استعمال ہوتی ہے۔

Range operators کو ہم آگے `for` loop کے سبق میں زیادہ استعمال کریں گے۔ فی الحال انہیں ایک مسلسل عددی range کے طور پر سمجھنا کافی ہے۔

## Operators کی مشق

اب ہم چند سادہ examples کے ذریعے view میں operators کے استعمال کی مشق کرتے ہیں۔

### 1. گاڑیوں کی کل تعداد نکالنا

مثلاً، کسی چوراہے سے روزانہ 500 گاڑیاں گزرتی ہیں، تو 30 دن میں گزرنے والی کل گاڑیوں کی تعداد معلوم کریں۔

اس کے لیے arithmetic operator استعمال کر سکتے ہیں:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

یہاں calculation یہ ہے کہ روزانہ 500 گاڑیاں، اور 30 دن کا مطلب `500 × 30`، لہٰذا کل تعداد `15000` بنتی ہے۔

### 2. In-app purchase member کی جانچ

ہم یہ بھی جانچ سکتے ہیں کہ کوئی شخص in-app purchase member ہے یا نہیں۔ اگر اس کے پاس lifetime membership یا subscription membership میں سے کوئی ایک بھی ہو، تو اسے member سمجھا جائے گا۔

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

اس code میں `||` (OR) operator استعمال ہوا ہے: `lifeTime = false` یعنی اس کے پاس lifetime membership نہیں ہے؛ `subscription = true` یعنی اس کے پاس subscription membership ہے۔

چونکہ صرف ایک condition کے درست ہونے سے ہی کافی ہے، اس لیے `isMember` کی value `true` ہوگی۔ لہٰذا یہ شخص member ہے۔

## خلاصہ

Swift میں operators data calculation اور logical judgment کی بنیاد ہیں۔ جیسے `Text` content دکھانے کے لیے اہم ہے، ویسے ہی operators data کو handle کرنے کے لیے بنیادی اہمیت رکھتے ہیں۔

سادہ عددی calculations سے لے کر پیچیدہ logical judgments، اور وہاں سے view state control اور layout calculation تک، ہر جگہ operators کی شمولیت ضروری ہے۔

مختلف scenarios میں مشق کے ذریعے آپ اس سبق میں متعارف کرائے گئے مختلف operators سے آہستہ آہستہ واقف اور ماہر ہو سکتے ہیں۔ یہی آگے کی learning کی ایک اہم بنیاد ہے۔

### اضافی علم - Bitwise operators

اس کے علاوہ، Swift ایک نسبتاً نچلی سطح کے operators بھی فراہم کرتی ہے — bitwise operators:

* `&` (bitwise AND)
* `|` (bitwise OR)
* `^` (bitwise XOR)
* `~` (bitwise NOT)
* `>>` (right shift)
* `<<` (left shift)

مثلاً:

```swift
let a = 6  // بائنری 110
let b = 3  // بائنری 011

print(a & b) // 2 (بائنری 010)
print(a | b) // 7 (بائنری 111)
print(a ^ b) // 5 (بائنری 101)
print(~a)    // -7 (الٹا)
```

Swift میں integers کو binary two’s complement کی شکل میں ظاہر کیا جاتا ہے، اس لیے bitwise NOT کے بعد متعلقہ منفی عدد حاصل ہوتا ہے۔

Bitwise operators براہِ راست binary level پر کام کرتے ہیں، اور عموماً low-level data processing یا performance optimization جیسے scenarios میں استعمال ہوتے ہیں۔

Beginners کے لیے ان operators کے استعمال کے مواقع کم ہوتے ہیں، اور عام iOS یا SwiftUI development میں بھی یہ زیادہ عام نہیں ہیں، اس لیے یہاں ان کی گہرائی میں نہیں جایا جا رہا۔

اگر آگے چل کر low-level logic یا performance optimization کی ضرورت پڑے، تو انہیں مزید تفصیل سے سیکھا جا سکتا ہے۔
