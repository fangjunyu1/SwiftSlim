# टाइप सिस्टम

पिछले पाठों में हमने variables सीखे, और यह भी जाना कि variables अलग-अलग types की data save कर सकते हैं।

उदाहरण:

```swift
var hello = "Hello, World"
```

यहाँ `hello` एक text save कर रहा है, इसलिए इसका type `String` है।

अब हम type (`Type`) की अवधारणा, explicit type declaration, और type inference को व्यवस्थित रूप से सीखेंगे, ताकि variable की प्रकृति को और गहराई से समझ सकें।

## type क्या है

Swift में, हर value का एक स्पष्ट type होता है। type यह तय करता है कि वह value क्या है, और वह क्या कर सकती है।

उदाहरण:

- `42` एक `Int` (integer) है
- `"Hello"` एक `String` है
- `true` एक `Bool` है

ये अलग-अलग types से संबंधित हैं, और इनके उपयोग भी अलग हैं।

## Swift के सामान्य basic types

शुरुआती चरण में सबसे अधिक उपयोग होने वाले types निम्न हैं:

- `String`: string (text)
- `Int`: integer
- `Double`: floating-point number (decimal, higher precision)
- `Bool`: Boolean value (`true/false`)

इसके अलावा `Float` भी है (floating-point number), लेकिन इसकी precision `Double` से कम होती है, इसलिए सामान्यतः कम उपयोग होता है; `Character` (single character) भी होता है, जैसे `"A"`、`"!"` आदि।

### type declaration (explicit type)

Swift में, variable declare करते समय type को manually specify किया जा सकता है:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

variable name के बाद `: type` लिखकर variable का type declare किया जाता है।

array का type syntax `: [type]` होता है:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

इस code में `scores` array केवल `Int` type elements store कर सकती है, और `tags` केवल `String` type।

explicit type declaration code intention को अधिक स्पष्ट बनाती है, और कुछ स्थितियों में type inference errors से भी बचाती है।

## type inference

कई स्थितियों में type को explicitly declare करने की आवश्यकता नहीं होती:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]    // [Int]
var tags = ["Swift", "iOS"] // [String]
```

ऐसा इसलिए है क्योंकि Swift compiler "initial value" के आधार पर type automatically infer कर लेता है।

## explicit declaration और type inference

पिछले पाठों में हमने explicit declaration नहीं जोड़ी, जैसे:

```swift
var age: Int = 18
```

बल्कि पहले type inference को प्राथमिकता दी:

```swift
var age = 18
```

इस उदाहरण में, दोनों syntaxes equivalent हैं; `age` दोनों में `Int` type ही होगा। तुलना करें तो type inference वाला syntax अधिक concise है।

प्रारंभिक चरण में explicit declaration पर ज़ोर न देने का कारण यह है कि type inference code में अतिरिक्त information कम कर देता है, जिससे beginners के लिए समझना आसान होता है।

## type की ज़रूरत क्यों है

Swift एक strongly typed language है।

इसका अर्थ है: एक बार variable का type तय हो जाए, तो उसे मनमाने ढंग से बदला नहीं जा सकता।

उदाहरण:

```swift
var age: Int = 18

age = 20    // Success
age = "20"  // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

पहला `20` एक `Int` है, इसलिए `age` को assign किया जा सकता है; दूसरा `"20"` `String` है, जो `Int` type से मेल नहीं खाता, इसलिए error होगी।

`nums` एक `[Int]` type array है, इसलिए इसमें केवल integers रखे जा सकते हैं, strings नहीं।

type data usage को constrain करती है, और compile stage में type mismatch problems पकड़ सकती है। इससे type confusion से आने वाले bugs कम होते हैं और code की stability तथा maintainability बेहतर होती है।

## कब explicit type declaration ज़रूरी है

हालाँकि Swift types automatically infer कर सकता है, कुछ स्थितियों में compiler type infer नहीं कर पाता, या गलत infer कर सकता है। तब type manually declare करनी पड़ती है।

**1. empty array**

empty array बनाते समय type explicitly declare करनी ही होगी:

```swift
var nums: [Int] = []
```

यदि type न लिखें:

```swift
var nums = []   // Error, Empty collection literal requires an explicit type
```

compiler empty array के आधार पर element type infer नहीं कर सकता, इसलिए compile error होती है।

**2. inference errors से बचना**

```swift
var value = 10   // Int
```

इस उदाहरण में, यद्यपि `10` एक floating-point number (`Double`) भी हो सकता है, लेकिन क्योंकि decimal point नहीं है, compiler इसे default रूप से `Int` infer करेगा।

यदि हम चाहते हैं कि `value` floating-point number हो, तो explicit declaration करनी होगी:

```swift
var value: Double = 10   // Double
```

जब type inference का result अपेक्षित न हो, तब explicit declaration या literal form adjust करके type को सही सुनिश्चित करना चाहिए।

**3. custom types**

आगे हम custom types भी सीखेंगे। custom types का उपयोग करते समय भी सामान्यतः explicit declaration करनी होती है:

```swift
var info: GameInfo
var users: [User] = []
```

कारण वही है जो empty array में होता है: compiler empty value से type automatically infer नहीं कर सकता।

## type conversion

Swift में अलग-अलग types के बीच automatic conversion नहीं होती; conversion manually करनी होती है।

उदाहरण, दो अलग-अलग types के numbers को जोड़ना:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b    // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

इस code में `a` का type `Int` है, `b` का type `Double` है। types अलग होने के कारण सीधे operation संभव नहीं है।

operation से पहले, इनमें से किसी एक value को समान type में convert करना होगा:

```swift
var result = Double(a) + b
```

यह code दर्शाता है कि `Int` type `a` को `Double` में convert करके, फिर `b` के साथ जोड़ा गया, और result `result` को assign हुआ।

ध्यान दें कि type conversion original variable type को modify नहीं करती। उदाहरण के लिए, `Double(a)` `a` के `Int` type को नहीं बदलता; यह केवल एक नया `Double` value बनाता है जो operation में उपयोग होता है।

अन्य types भी समान तरीके से convert किए जा सकते हैं, यानी target type + `()` syntax का उपयोग करके value pass की जाती है। उदाहरण:

```
Int()、Double()、String()
```

उदाहरण:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

ध्यान दें कि सभी conversions हमेशा perfect नहीं होतीं। उदाहरण के लिए, `Double → Int` conversion decimal part को सीधे truncate कर देती है, round नहीं करती।

## type alias

Swift में, मौजूदा type को एक alias भी दिया जा सकता है, ताकि code semantics अधिक स्पष्ट हो:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

यहाँ `UserID` मूल रूप से अभी भी `Int` ही है। type नहीं बदली, केवल नाम अधिक meaningful हो गया।

जब project बड़ा हो और types अधिक complex हों, तब type alias code readability बढ़ा सकती है।

## type example

अब एक सरल example से देखते हैं कि actual development में type कैसे काम करती है।

### variable बनाना

सबसे पहले, हम एक `age` variable बनाएँ:

```swift
var age = 20
```

क्योंकि इस variable को SwiftUI में display और modify करना है, इसलिए इसे `@State` से declare करना होगा:

```swift
@State private var age = 20
```

`private` का उल्लेख पहले किया जा चुका है। इसका अर्थ है कि यह variable केवल current view के भीतर उपयोग की जा सकती है। आगे इसे और विस्तार से सीखेंगे।

### SwiftUI में data दिखाना

SwiftUI में `age` variable display करें:

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

अब view यह दिखाएगी:

```swift
age: 20
```

### data modify करना

अब, `age` modify करने के लिए दो buttons जोड़ते हैं:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### run result

जब `changeAge1` क्लिक होगा, `age` को `18` assign होगा:

```swift
age = 18
```

क्योंकि `18` एक `Int` type है, और `age` का type भी वही है, इसलिए assignment सफल होगी।

`changeAge2` error देगा:

```swift
age = "18"
```

error message:

```
Cannot assign value of type 'String' to type 'Int'
```

क्योंकि `"18"` एक `String` है (strings को `""` में wrap किया जाता है), जबकि `age` एक `Int` है। types एक समान न होने के कारण assignment संभव नहीं है।

### error क्यों होती है?

मुख्य कारण यह line है:

```swift
@State private var age = 20   // Int
```

हालाँकि type explicitly declare नहीं की गई, लेकिन initial value `20` एक `Int` है, इसलिए compiler `age` को automatically `Int` infer करेगा।

एक बार type तय हो जाने के बाद, उसमें दूसरी type assign नहीं की जा सकती।

और `changeAge2` button “runtime failure” नहीं है; यह compile stage पर ही error देगा, इसलिए code compile नहीं होगा।

यही Swift strong typing का एक बड़ा लाभ है: code लिखते समय ही type problems को पहले पकड़ लिया जाता है।

### सही syntax

गलत code हटाने के बाद:

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

`changeAge1` button क्लिक करने पर, view update होकर यह दिखाएगी:

```
age: 18
```

### explicit type declaration (optional)

define करते समय type को स्पष्ट रूप से भी लिखा जा सकता है:

```swift
@State private var age: Int = 20
```

यह syntax type को और स्पष्ट बनाती है, लेकिन simple scenarios में यह अनिवार्य नहीं है।

## सारांश

इस पाठ में हमने Swift के type system और actual development में उसके उपयोग को समझा।

Swift में हर value का एक स्पष्ट type होता है। type यह तय करती है कि data का अर्थ क्या है, और वह किन operations में भाग ले सकती है।

Swift strongly typed है। एक बार variable का type तय हो जाए, तो उसे दूसरी type assign नहीं की जा सकती। यह constraint compile stage में errors पकड़ सकता है, जिससे runtime problems कम होती हैं और code safety बढ़ती है।

variable type को initial value के आधार पर automatically infer किया जा सकता है, या explicit declaration से लिखा जा सकता है। कुछ स्थितियों में (जैसे empty array, type inference error, custom type), compiler सही type infer नहीं कर पाता, तब explicit declaration आवश्यक होती है।

अलग-अलग types के बीच automatic conversion नहीं होती; `Int()`、`Double()`、`String()` आदि के माध्यम से explicit conversion करनी होती है।

types aliases भी support करती हैं। विशेष रूप से complex projects में, type aliases readability बढ़ा सकती हैं।

type केवल data marking नहीं है, बल्कि एक constraint mechanism भी है, जो data usage को safe, स्पष्ट और controllable बनाए रखता है।

## अतिरिक्त ज्ञान - optional type

type conversion करते समय, कुछ operations fail भी हो सकती हैं।

उदाहरण के लिए, `String` को `Double` में convert करना:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

यहाँ `Double(input)` का return type `Double` नहीं है, बल्कि:

```
Double?
```

इसे optional type (`Optional`) कहते हैं।

### optional type क्यों return होती है?

क्योंकि string content निश्चित नहीं होती। `"3.14"` को `Double` में convert किया जा सकता है, लेकिन `"Hello"` को `Double` में convert नहीं किया जा सकता।

अर्थात, यह operation सफल भी हो सकती है और fail भी।

इसीलिए, Swift इस uncertainty को दर्शाने के लिए optional type का उपयोग करती है।

### optional type क्या है?

optional type का अर्थ है: कोई value मौजूद भी हो सकती है, या मौजूद न भी हो।

उदाहरण:

```
Double?
```

इस type का अर्थ है कि यदि value है, तो print करते समय `Optional(...)` दिखाई देगा; यदि value नहीं है, तो `nil` मिलेगा।

ध्यान दें कि `nil` का अर्थ है "कोई value नहीं", यह `0` या empty string नहीं है।

### उदाहरण

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

output:

```
pi:Optional(3.14)
```

यह दिखाता है कि string सफलतापूर्वक `Double` में convert हुई, और value `3.14` मिली, लेकिन क्योंकि type `Double?` है, इसलिए वह `Optional` में wrap है।

यदि conversion fail हो:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

output:

```
pi: nil
```

क्योंकि `"Hello"` को `Double` type में convert नहीं किया जा सकता, conversion fail होती है और `nil` return होता है।

### `Optional(...)` क्या है?

जब हम optional type को सीधे print करते हैं:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift उसका “debug description” दिखाता है:

```
Optional(3.14)
```

यह actual data का हिस्सा नहीं है, बल्कि यह संकेत है कि current value एक optional type है, और उसके भीतर एक value मौजूद है।

### optional को unwrap करना

वास्तविक development में, हमें सामान्यतः optional type से वास्तविक value निकालनी होती है। इस process को unwrapping कहा जाता है।

एक common तरीका है `??` के द्वारा default value देना:

```
??
```

इसे nil-coalescing operator कहते हैं।

उदाहरण:

```swift
name ?? "FangJunyu"
```

इस code का अर्थ है: यदि `name` की value है, तो वही return करो; यदि `nil` है, तो default value `"FangJunyu"` उपयोग करो।

ध्यान दें कि default value का type optional type के wrapped type से मेल खाना चाहिए।

### `??` से default value देना

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")    // 30
```

output:

```
pi: 30
```

जब `input` को `Double` में convert किया गया, conversion सफल हुई और वही value output हुई। यदि conversion fail होती, तो `??` द्वारा दिया गया default value output होता।

यदि conversion fail हो:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

output:

```
pi: 10
```

यहाँ `input` को `Double` में convert करते समय conversion fail हुई और `nil` return हुआ, इसलिए `??` ने `nil` के लिए default value दे दी।

optional type उन स्थितियों को दर्शाने के लिए उपयोग होती है जहाँ “value हो भी सकती है, और नहीं भी”।

type conversion जैसी fail हो सकने वाली operations में, Swift program safety बनाए रखने के लिए optional type return करती है।

जब हमें उसके भीतर की value उपयोग करनी हो, तो `??` द्वारा default value देकर `nil` की स्थिति में भी एक reasonable result पाया जा सकता है।
