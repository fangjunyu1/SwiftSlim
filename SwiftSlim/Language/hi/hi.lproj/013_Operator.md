# ऑपरेटर

इस पाठ में हम Swift operators (`Operators`) सीखेंगे।

जब हम calculation, comparison या logical judgment करते हैं, तब operators की आवश्यकता होती है। ये operations program execution के लगभग हर हिस्से में मौजूद होती हैं, और programming की सबसे बुनियादी क्षमताओं में से एक हैं।

```swift
let a = 100 * 8
```

programming सीखते समय, कई लोग पाते हैं कि जिनकी math thinking बेहतर होती है, वे program logic को भी अपेक्षाकृत जल्दी समझ लेते हैं। ऐसा इसलिए है क्योंकि programming मूल रूप से “calculation” और “rule judgment” से अलग नहीं है, और operators यही मूल भूमिका निभाते हैं।

वास्तविक development में, operators केवल simple numeric calculations के लिए ही नहीं, बल्कि कई specific scenarios में व्यापक रूप से उपयोग होते हैं।

उदाहरण के लिए, block game में जब user किसी block को एक specific position पर drag करता है, तब calculate करना पड़ता है:

- block की coordinate position
- block किन positions को fill कर सकता है
- target position available है या नहीं

ये “calculation + judgment” processes मूल रूप से operators पर ही निर्भर करते हैं।

![Block](../../Resource/013_block.png)

operators सीखना केवल numbers calculate करना नहीं है; यह आगे आने वाले interface layout, data processing और interaction logic की foundation भी है।

## SwiftUI में calculation execute करने का तरीका

SwiftUI में सामान्यतः `Button` से एक function trigger की जाती है, और function के भीतर calculation logic execute होती है।

उदाहरण:

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

जब button click होगा, `Console` output करेगा:

```
c: 20
```

इस पाठ में हम calculation logic को एक समान रूप से `func` में लिखेंगे, और button से उसे trigger करेंगे, फिर `print` से result output करेंगे।

आगे के examples में, code presentation को सरल रखने के लिए, हम calculation results को सीधे code comment में annotate करेंगे, और बार-बार `print` का उपयोग नहीं करेंगे।

## `Console` output management

क्योंकि हर click पर output information generate होती है, आप `Console` area के नीचे दाईं ओर के clear button से पुराना log साफ़ कर सकते हैं, ताकि current result देखना आसान हो।

![Console](../../Resource/013_console.png)

## `Button` लिखने का दूसरा तरीका

जब button केवल एक function execute करता है, तो अधिक concise syntax इस्तेमाल की जा सकती है:

```swift
Button(action: ) {
    // View
}
```

इस syntax में `action` उस function को specify करता है जो button click होने पर execute होगी (parameterless function), और curly braces `{}` button के view को define करती हैं।

ऊपर के `calculate` function के साथ इसे ऐसे लिखा जा सकता है:

```swift
Button(action: calculate) {
    Text("Button")
}
```

जब button click होगा, तो `calculate` function सीधे execute होगी।

इसलिए, जब button logic simple हो और केवल एक function call करनी हो, तब `action` syntax अधिक स्पष्ट और code conventions के अनुरूप होती है।

## arithmetic operators

arithmetic operators (`Arithmetic Operators`) numeric calculations के लिए उपयोग होते हैं:

- `+` addition
- `-` subtraction
- `*` multiplication
- `/` division
- `%` remainder (modulo)

उदाहरण:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

ध्यान देने योग्य बात यह है कि Swift strongly typed language है, इसलिए यह अलग-अलग data types को automatically mix नहीं करती:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

जब दो types अलग हों, तो type manually convert करनी होती है।

## comparison operators

comparison operators (`Comparison Operators`) दो values के बीच संबंध की जाँच करती हैं, और result `Bool` होता है:

- `==` equal to
- `!=` not equal to
- `>` greater than
- `<` less than
- `>=` greater than or equal to
- `<=` less than or equal to

उदाहरण:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

comparison operators अक्सर judgment statements में उपयोग होते हैं। उदाहरण के लिए “quote carousel” में हमें control करना होता है कि index array range से बाहर न जाए:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

यदि `index < sayings.count - 1` का result `true` है, तो `if` के भीतर का code execute होगा; यदि result `false` है, तो आगे का code execute नहीं होगा।

## logical operators

logical operators (`Logical Operators`) कई conditions को combine करने के लिए उपयोग होते हैं:

- `&&` and
- `||` or
- `!` not

### `&&` and

जब कई conditions एक साथ satisfy होनी हों, तब `&&` उपयोग किया जाता है।

उदाहरण:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

इस code में दो conditions हैं: `age >= 18` और `age <= 100`।

केवल तब जब दोनों conditions `true` होंगी, `legalAge` का result `true` होगा; यदि एक भी condition satisfy न हो, result `false` होगा।

### `||` or

जब कई conditions में से केवल एक satisfy होना पर्याप्त हो, तब `||` का उपयोग करें।

उदाहरण:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

इस code का अर्थ है कि जब तक `money >= 50` या `creditCard >= 50` में से कोई एक condition true है, `payAllowed` `true` रहेगा।

केवल तब जब दोनों conditions false हों, result false होगा।

उदाहरण के लिए, payment scenario में cash या credit card दोनों में से किसी एक से payment हो सकती है। यदि दोनों से payment नहीं हो सकती, तभी payment fail होगी।

### `!` not

`!` logical negation operator (`NOT`) है, जो `Bool` value को उलट देता है।

इसे सरल रूप में ऐसे समझें: `!` `true` को `false` बनाता है, और `false` को `true`।

उदाहरण:

```swift
let allowed = true
let result = !allowed   // false
```

यहाँ `!allowed` का अर्थ है `allowed` की value को उलटना।

ध्यान दें कि `!` और `!=` दो अलग operators हैं। `!` `Bool` value को negate करता है, जबकि `!=` comparison operator है, जो `Bool` return करती है।

## assignment operators

assignment operators (`Assignment Operators`) values assign करने या variables update करने के लिए उपयोग होती हैं:

- `=` assignment

variable declaration हो या calculation process, assignment operation लगभग हर जगह शामिल होती है:

```swift
let a = 5
```

यह code दर्शाता है कि value `5` variable `a` को assign की गई है।

### compound assignment operators

वास्तविक development में, base assignment operators के अलावा “compound assignment operators” भी बहुत सामान्य हैं। ये original value पर सीधे calculation करके फिर update कर देती हैं:

- `+=`
- `-=`
- `*=`
- `/=`

पहले “counter” पाठ में हम compound assignment operators को संक्षेप में देख चुके हैं।

उदाहरण, जब button click हो, तो variable अपने आप बढ़े:

```swift
var num = 10
num += 5   // num = 15
```

यह code दर्शाता है कि `num` और `5` का addition किया गया, और result फिर से `num` को assign हुआ।

अर्थात, यह इसके बराबर है:

```swift
var num = 10
num = num + 5   // num = 15
```

## ternary operator

Swift में ternary operator (`Ternary Operator`) condition के आधार पर दो results में से एक return करता है:

```swift
condition ? value1 : value2
```

इसका logic यह है: यदि condition `true` है, तो `value1` return होगा; यदि condition `false` है, तो `value2` return होगा।

उदाहरण:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

यह code `showColor` की value check करती है: यदि `true` है, तो `Color.blue` return होगा और background नीली होगी; यदि `false` है, तो `Color.clear` return होगा और background नहीं दिखेगी।

सुझाव: `Color.clear` का अर्थ transparent color है (कोई visible content नहीं)।

### `if-else` से अंतर

ternary operator logic में `if-else` के बराबर है।

उदाहरण, ऊपर का code इस तरह भी लिखा जा सकता है:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

दोनों की execution logic पूरी तरह समान है: condition true होने पर पहला result, false होने पर दूसरा result।

व्यवहारिक उपयोग में, ternary operator syntax अधिक concise है, और “दो में से एक” जैसी simple judgments के लिए बेहतर है, खासकर जब सीधे एक value return करनी हो।

SwiftUI view building में ternary operator बहुत common है, उदाहरण:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

इस तरह के syntax से एक ही line में condition के आधार पर view effect बदली जा सकती है।

## range operators

range operators (`Range Operators`) interval दर्शाने के लिए उपयोग होते हैं:

- `...` closed range (दोनों सिरों सहित)
- `..<` half-open range (दाएँ endpoint को छोड़कर)

उदाहरण:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

इसे ऐसे समझें: `1...3` का अर्थ `1` से `3` तक, और `3` भी शामिल; `5..<8` का अर्थ `5` से `8` तक, लेकिन `8` शामिल नहीं।

extended forms (केवल जानकारी के लिए):

```
5...    // >= 5
...5    // <= 5
```

इस syntax का अर्थ “one-sided range” है, जो condition judgment या pattern matching में उपयोग हो सकती है।

range operators आगे `for` loop सीखते समय काम आएँगी। अभी के लिए, इन्हें consecutive number range के रूप में समझना पर्याप्त है।

## operators का अभ्यास

अब, कुछ सरल examples से view में operators की भूमिका का अभ्यास करते हैं।

### 1. वाहनों की कुल संख्या calculate करना

उदाहरण के लिए, किसी एक crossing से हर दिन `500` vehicles गुजरती हैं। `30` दिनों में कुल कितनी vehicles जाएँगी?

हम arithmetic operator का उपयोग कर सकते हैं:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

यहाँ calculation process है: हर दिन `500` vehicles, `30` दिन का total `500 × 30`, और अंतिम result `15000` vehicles।

### 2. in-app purchase member का judgment

हम यह determine कर सकते हैं कि कोई व्यक्ति in-app purchase member है या नहीं। यदि उसके पास lifetime membership या subscription membership में से कोई एक है, तो उसे member माना जाएगा।

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

इस code में `||` (`or`) operator उपयोग हुई है: `lifeTime = false` का अर्थ lifetime membership नहीं है; `subscription = true` का अर्थ subscription membership है।

क्योंकि केवल एक condition satisfy होना पर्याप्त है, इसलिए `isMember` `true` है। इसका मतलब यह व्यक्ति in-app purchase member है।

## सारांश

Swift में operators data calculation और logical judgment की foundation हैं। जैसे `Text` content दिखाने का आधार है, वैसे ही operators data को process करने का आधार हैं।

सबसे सरल numeric calculation से लेकर complex logical judgment, और view के भीतर state control तथा layout calculation तक, operators हर जगह आवश्यक हैं।

अलग-अलग scenarios के अभ्यास के माध्यम से, हम इस पाठ में बताए गए operators को धीरे-धीरे समझ और master कर सकते हैं। यह आगे की learning के लिए बहुत महत्वपूर्ण foundation है।

### अतिरिक्त ज्ञान - bitwise operators

इसके अलावा, Swift एक और अधिक low-level operator category भी प्रदान करती है — bitwise operators (`Bitwise Operators`):

- `&` (bitwise AND)
- `|` (bitwise OR)
- `^` (bitwise XOR)
- `~` (bitwise NOT)
- `>>` (right shift)
- `<<` (left shift)

उदाहरण:

```swift
let a = 6  // binary 110
let b = 3  // binary 011

print(a & b) // 2 (binary 010)
print(a | b) // 7 (binary 111)
print(a ^ b) // 5 (binary 101)
print(~a)    // -7 (bitwise NOT)
```

Swift में integers binary two's complement form में represent होते हैं, इसलिए bitwise NOT के बाद corresponding negative result मिलता है।

bitwise operators सीधे binary पर operate करती हैं, और सामान्यतः low-level data processing या performance optimization scenarios में उपयोग होती हैं।

beginners के लिए, इन operators के use cases अपेक्षाकृत कम होते हैं। सामान्य iOS या SwiftUI development में भी ये आम नहीं हैं, इसलिए यहाँ इन्हें गहराई से नहीं समझाया गया है।

यदि आगे चलकर low-level logic या performance optimization की आवश्यकता हो, तो इन्हें फिर और विस्तार से सीखा जा सकता है।
