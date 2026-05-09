# कंप्यूटेड प्रॉपर्टीज़

इस पाठ में हम मुख्य रूप से कंप्यूटेड प्रॉपर्टीज़ सीखेंगे।

कंप्यूटेड प्रॉपर्टीज़ मौजूदा डेटा के आधार पर नया परिणाम निकालने के लिए उपयोग होती हैं। वे संख्यात्मक मान भी निकाल सकती हैं, और SwiftUI views में दिखाने वाला कंटेंट भी निकाल सकती हैं।

उदाहरण के लिए:

```swift
let a = 10
let b = 20
let c = a + b
```

यहाँ `c`, `a` और `b` को जोड़ने के बाद का परिणाम है।

सामान्य कोड में यह लिखने का तरीका बहुत आम है।

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

सुझाव: `Button` के tap event में सामान्य Swift कोड चलाया जा सकता है।

लेकिन अगर हम इसी तरह का कोड सीधे किसी SwiftUI view की properties में लिखें, तो समस्या आएगी।

उदाहरण के लिए:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

यह कोड error देगा।

ऐसा लगता है कि `a` और `b` पहले से `c` के आगे लिखे हैं, इसलिए शायद `c` का मान निकाला जा सकता है।

लेकिन structure की property declarations में यह तरीका सीधे इस्तेमाल नहीं किया जा सकता।

## c सीधे a + b क्यों नहीं निकाल सकता

क्योंकि `a`, `b`, और `c` button tap event के temporary constants नहीं हैं, बल्कि `ContentView` view की properties हैं।

button tap event में यह कोड सामान्य रूप से चल सकता है:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

क्योंकि button tap होने के बाद कोड क्रम से चलता है। पहले `a` बनता है, फिर `b` बनता है, और अंत में `a + b` से `c` निकाला जाता है।

लेकिन view के अंदर properties declare करते समय स्थिति अलग होती है:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

यहाँ `a`, `b`, और `c` सभी `ContentView` view की properties हैं।

जब `ContentView` view बनाया जाता है, Swift को पहले इन properties को तैयार करना होता है। बनाने की प्रक्रिया सुरक्षित रहे, इसलिए Swift किसी instance stored property के default value को उसी instance की दूसरी instance properties सीधे पढ़ने की अनुमति नहीं देता।

इसलिए यह line error देगी:

```swift
let c = a + b
```

सरल रूप में समझें तो: **view के अंदर properties declare करते समय, एक ordinary property से सीधे दूसरी ordinary property नहीं निकाली जा सकती।**

जो property सीधे कोई value store करती है, उसे "stored property" कहा जाता है। समझने में आसानी के लिए इसे फिलहाल ordinary property भी समझ सकते हैं।

उदाहरण के लिए:

```swift
let a = 10
```

`a` `10` store करता है।

```swift
let b = 20
```

`b` `20` store करता है।

लेकिन:

```swift
let c = a + b
```

यहाँ `c` सीधे लिखी हुई value नहीं है, बल्कि हम इसे `a + b` से निकालना चाहते हैं।

ऐसी स्थिति में, यानी "मौजूदा डेटा से परिणाम पाने" के लिए, computed property अधिक उपयुक्त होती है।

इसे ऐसे बदला जा सकता है:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

यहाँ `c` computed property है।

```swift
var c: Int {
    return a + b
}
```

इसका अर्थ है: **जब `c` का उपयोग करना हो, तब `a` और `b` पढ़ो, और `a + b` का परिणाम return करो।**

उदाहरण के लिए:

```swift
Text("c: \(c)")
```

जब `Text` `c` दिखाता है, तभी `c` की calculation शुरू होती है।

## computed property क्या है?

computed property एक variable जैसी दिखती है, लेकिन वह खुद data store नहीं करती।

उदाहरण के लिए:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

यहाँ `c` computed property है।

यह ordinary property की तरह fixed value store नहीं करती, बल्कि जब भी `c` पढ़ी जाती है, `{}` के अंदर का code फिर से चलाती है और calculation result return करती है।

इसे ऐसे समझा जा सकता है:

```swift
var c: Int {
    return a + b
}
```

जब `c` का उपयोग करना हो, तो `a + b` calculate किया जाता है।

इसलिए computed property ऐसी स्थिति के लिए उपयुक्त है: **किसी result को अलग से store करने की जरूरत नहीं है, क्योंकि उसे मौजूदा data से calculate किया जा सकता है।**

## basic syntax

computed property में आमतौर पर तीन भाग होते हैं:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` से declare करना

```swift
var c
```

computed property को `var` से declare करना जरूरी है; `let` का उपयोग नहीं किया जा सकता।

क्योंकि computed property fixed stored value नहीं है, बल्कि हर बार पढ़े जाने पर dynamically calculate होने वाला result है।

### 2. return type लिखना

```swift
var c: Int
```

computed property को अपना return type लिखना होता है।

यहाँ `c` अंत में integer return करेगा, इसलिए type `Int` है।

### 3. calculation logic लिखने के लिए {} का उपयोग करना

```swift
{
    return a + b
}
```

`{}` के अंदर calculation logic लिखी जाती है; यहाँ `a + b` return होता है।

## return keyword

computed property को result return करना होता है।

उदाहरण के लिए:

```swift
var c: Int {
    return a + b
}
```

यहाँ `return` का अर्थ है: `a + b` की calculation का result बाहर return करो।

अगर computed property में केवल एक expression हो जो सीधे result बनाता है, तो `return` छोड़ा जा सकता है:

```swift
var c: Int {
    a + b
}
```

लेकिन अगर computed property में कई lines का code हो, तो result स्पष्ट रूप से return करने के लिए `return` का उपयोग करना पड़ता है।

उदाहरण के लिए:

```swift
var totalPriceText: String {
    let total = count * price
    return "कुल: \(total) $"
}
```

यहाँ calculation process दो steps में बाँटा गया है।

पहला step, पहले total price calculate करें:

```swift
let total = count * price
```

दूसरा step, total price को text में जोड़कर return करें:

```swift
return "कुल: \(total) $"
```

अगर `return` हटाएँ:

```swift
var totalPriceText: String {
    let total = count * price
    "कुल: \(total) $"
}
```

यह code error देगा।

कारण है: **इस computed property में पहले से कई lines का code है, और Swift अब अपने-आप नहीं समझ सकता कि कौन-सी line अंतिम return result है।**

इसलिए, जब computed property में केवल एक result line हो, तो `return` छोड़ा जा सकता है।

```swift
var c: Int {
    a + b
}
```

जब computed property में कई lines का code हो, तो `return` स्पष्ट रूप से लिखना बेहतर है।

```swift
var totalPriceText: String {
    let total = count * price
    return "कुल: \(total) $"
}
```

## computed property और ordinary property का अंतर

ordinary property data store करती है।

```swift
var c = 30
```

यहाँ `c` एक concrete value store करता है: `30`।

computed property data store नहीं करती।

```swift
var c: Int {
    a + b
}
```

यहाँ `c` `30` store नहीं करता। यह केवल calculation का तरीका देता है।

जब `c` पढ़ा जाता है, Swift execute करता है:

```swift
a + b
```

फिर calculation result return करता है।

इसलिए computed properties उन स्थितियों के लिए उपयुक्त हैं जहाँ result दूसरे data से calculate होता है।

## body भी computed property है

computed properties सीखने के बाद, हम SwiftUI के सबसे common code को फिर से समझ सकते हैं:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

यहाँ `body` भी computed property है।

यह `var` से declare होता है:

```swift
var body
```

इसका return type है:

```swift
some View
```

इसके `{}` में SwiftUI view content return होता है:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

इसलिए `body` को ऐसे समझा जा सकता है: जब SwiftUI को यह view दिखाना होता है, तो वह `body` पढ़ता है और `body` द्वारा return किए गए content के अनुसार interface बनाता है।

अगर `return` लिखें, तो इसे ऐसे समझा जा सकता है:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

लेकिन SwiftUI में हम आमतौर पर `return` छोड़कर सीधे लिखते हैं:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

जब `@State` data बदलता है, SwiftUI `body` को फिर से पढ़ता है और नए data के अनुसार interface update करता है।

उदाहरण के लिए:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("गिनती: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

button tap करने के बाद `count` बदलता है।

```swift
count += 1
```

`count` बदलने के बाद SwiftUI `body` फिर से calculate करता है, इसलिए interface में text भी update हो जाता है।

```swift
Text("गिनती: \(count)")
```

यही कारण है कि SwiftUI में data बदलने के बाद interface अपने-आप refresh हो सकता है।

### body में complex calculations लिखने की सलाह नहीं दी जाती

क्योंकि `body` computed property है, इसे कई बार पढ़ा और फिर से calculate किया जा सकता है।

उदाहरण के लिए:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("संख्या: \(num)")
            Text("नाम: \(name)")
        }
    }
}
```

जब `name` बदलता है, SwiftUI `body` को फिर से calculate करता है।

इस समय `body` के अंदर का code भी फिर से चलता है, और `num` भी फिर से बनता है।

```swift
let num = 10
```

इस example में `num` बहुत simple है, इसलिए असर बड़ा नहीं है।

लेकिन अगर `body` में complex calculations चलें, जैसे बहुत सारे data को filter करना, sort करना, image processing आदि, तो interface की smoothness प्रभावित हो सकती है।

इसलिए SwiftUI में `body` का मुख्य काम interface structure describe करना होना चाहिए।

simple temporary data `body` के अंदर लिखा जा सकता है।

complex calculations को `body` के बाहर computed properties, methods, या अलग data processing में रखा जा सकता है।

## उदाहरण: quantity और total price

अब हम एक simple example से computed properties समझेंगे।

मान लें कि एक carrot की unit price 2 $ है, user buttons tap करके खरीदने की quantity बदल सकता है, और interface को total price दिखाना है।

total price calculate करने का तरीका:

```
quantity * unit price
```

अगर total price store करने के लिए ordinary variable इस्तेमाल करें, तो यह थोड़ा troublesome होगा।

क्योंकि हर बार quantity बदलने पर total price manually update करना पड़ेगा।

बेहतर तरीका computed property इस्तेमाल करना है:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("कीमत: \(price) $")
                Text("मात्रा: \(count)")
                Text("कुल कीमत: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

display result:

![view](../../Resource/024_view.png)

इस example में:

```swift
@State private var count = 1
```

`count` carrot की quantity बताता है। button tap करते समय `count` बदलता है।

```swift
private let price = 2
```

`price` carrot की unit price बताता है। यहाँ fixed value है, इसलिए `let` इस्तेमाल किया गया है।

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` total price बताता है।

इसे अलग से store करने की जरूरत नहीं है, क्योंकि total price हमेशा `count * price` से calculate किया जा सकता है।

जब `count` `1` है:

```swift
totalPrice = 1 * 2
```

display result है:

```swift
कुल कीमत: 2 $
```

`+` button tap करने के बाद `count` `2` हो जाता है।

इस समय `totalPrice` फिर पढ़ने पर यह फिर calculate होगा:

```swift
totalPrice = 2 * 2
```

display result है:

```swift
कुल कीमत: 4 $
```

यही computed property का काम है: मौजूदा data के आधार पर dynamically नया result calculate करना।

## computed properties checks के लिए इस्तेमाल हो सकती हैं

computed properties केवल numerical values ही नहीं, check results भी return कर सकती हैं।

उदाहरण के लिए, जब हम चाहते हैं कि minimum quantity 1 हो।

जब quantity पहले से 1 हो, तो `-` button को और घटाना नहीं चाहिए।

हम एक computed property जोड़ सकते हैं:

```swift
private var canDecrease: Bool {
    count > 1
}
```

पूरा code:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("कीमत: \(price) $")
                Text("मात्रा: \(count)")
                Text("कुल कीमत: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

display result:

![view](../../Resource/024_view1.png)

यहाँ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

यह code बताता है कि अभी घटाना संभव है या नहीं।

जब `count` `1` से बड़ा है:

```swift
canDecrease == true
```

इसका अर्थ है कि घटाया जा सकता है।

जब `count` `1` के बराबर है:

```swift
canDecrease == false
```

इसका अर्थ है कि आगे घटाया नहीं जा सकता।

### button में condition check

button में उपयोग होता है:

```swift
if canDecrease {
    count -= 1
}
```

केवल जब `canDecrease` `true` हो, तभी `count` घटाया जा सकता है।

### view का foreground color control करना

हम `canDecrease` से button का foreground color भी control कर सकते हैं:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

यहाँ ternary operator इस्तेमाल किया गया है:

```swift
canDecrease ? Color.primary : Color.gray
```

इस code का अर्थ है: अगर `canDecrease` `true` है, तो foreground color के लिए `Color.primary` इस्तेमाल करो; अगर `canDecrease` `false` है, तो `Color.gray` इस्तेमाल करो।

`Color.primary` SwiftUI द्वारा दिया गया system semantic color है। यह current interface में main text color को बताता है।

light mode में `Color.primary` आमतौर पर black के करीब होता है; dark mode में `Color.primary` आमतौर पर white के करीब होता है।

इसलिए `Color.primary` इस्तेमाल करने का फायदा है कि यह light mode और dark mode के अनुसार अपने-आप adapt हो जाता है।

### view की disabled state control करना

`disabled` का उपयोग यह control करने के लिए होता है कि view disabled state में है या नहीं:

```swift
.disabled(!canDecrease)
```

जब `disabled` `false` हो, view tap किया जा सकता है।

जब `disabled` `true` हो, view disabled होता है और tap नहीं किया जा सकता।

यहाँ condition के रूप में `canDecrease` इस्तेमाल करने से code समझना आसान होता है।

`canDecrease` देखकर पता चलता है कि इसका अर्थ है "अभी आगे घटाया जा सकता है या नहीं"।

### अतिरिक्त व्याख्या: दो checks क्यों हैं?

`-` button में:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

यहाँ `.disabled(!canDecrease)` भी इस्तेमाल हुआ है, और button के अंदर `if canDecrease` भी।

`.disabled(!canDecrease)` interface में button को disabled करने की जिम्मेदारी लेता है, ताकि user उसे tap न कर सके।

`if canDecrease` code चलने से पहले फिर check करने की जिम्मेदारी लेता है। यह `count -= 1` केवल तब चलाता है जब घटाना allowed हो।

यह double protection है। वास्तविक development में, अगर button पहले से disabled है, तो अंदर वाला check छोड़ा जा सकता है। लेकिन teaching example में इसे रखने से `canDecrease` की भूमिका अधिक स्पष्ट होती है।

## सारांश

इस पाठ में हमने मुख्य रूप से computed properties सीखी।

computed property सीधे value store नहीं करती। इसके बजाय, जब यह पढ़ी जाती है, तो मौजूदा data से result calculate करती है।

उदाहरण के लिए:

```swift
var c: Int {
    a + b
}
```

यहाँ `c` को अलग से store करने की जरूरत नहीं है, क्योंकि इसे `a + b` से calculate किया जा सकता है।

computed property को `var` से declare करना जरूरी है, और उसे return type लिखना होता है।

```swift
var canDecrease: Bool {
    count > 1
}
```

computed properties केवल numerical values ही नहीं, check results, text content, और SwiftUI view content भी return कर सकती हैं।

इस पाठ में हमने `return` भी सीखा।

`return` का अर्थ है result return करना:

```swift
var totalPriceText: String {
    let total = count * price
    return "कुल: \(total) $"
}
```

अगर computed property में केवल एक expression हो जो सीधे result बनाता है, तो `return` छोड़ा जा सकता है।

```swift
var totalPrice: Int {
    count * price
}
```

इसके अलावा, हमने `Color.primary` और `disabled` के बारे में भी जाना।

`Color.primary` SwiftUI का system semantic color है। यह light mode और dark mode के अनुसार display effect अपने-आप adjust करता है।

```swift
.foregroundStyle(Color.primary)
```

`disabled` का उपयोग यह control करने के लिए होता है कि view disabled है या नहीं।

```swift
.disabled(true)
```

इसका अर्थ disabled है, tap नहीं किया जा सकता।

```swift
.disabled(false)
```

इसका अर्थ available है, tap किया जा सकता है।

इसलिए computed properties SwiftUI में बहुत आम हैं। वे calculation results, check conditions, और displayed content को अधिक साफ़ तरीके से व्यवस्थित करने में मदद करती हैं।
