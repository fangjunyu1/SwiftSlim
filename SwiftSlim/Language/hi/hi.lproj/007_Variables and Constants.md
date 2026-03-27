# वेरिएबल और कॉन्स्टैंट

इस पाठ में हम Swift के variables और constants सीखेंगे, और कुछ सामान्य data types तथा basic operators को भी समझेंगे।

ये बातें programming का सबसे बुनियादी ज्ञान हैं, और आगे SwiftUI सीखने के लिए भी महत्वपूर्ण आधार हैं।

## जीवन में variables और constants

हम रोजमर्रा की चीज़ों के माध्यम से variables और constants को समझ सकते हैं।

जीवन में variables:

- टीवी पर हर कार्यक्रम की content अलग होती है
- हर दिन मौसम अलग होता है
- घड़ी हर सेकंड बदलती रहती है

इन चीज़ों की समान विशेषता है: ये बदलती रहती हैं।

यदि टीवी पर हमेशा एक ही picture हो, मौसम हमेशा साफ़ रहे, और घड़ी की सुइयाँ कभी न चलें, तो ये चीज़ें constant होंगी।

एक बदल सकता है, दूसरा नहीं बदलता।

## variables और constants को समझना

App development में अक्सर user को कुछ जानकारी भरनी या सहेजनी होती है।

उदाहरण:

- account name
- जन्मदिन
- संपर्क जानकारी
- पता

यह जानकारी save की जाएगी और फिर display होगी।

उदाहरण के लिए, user App में एक नाम दर्ज करता है:

```
FangJunyu
```

हमें इस नाम को save करना होगा ताकि इसे App में दिखाया जा सके।

save करने की प्रक्रिया को सरल रूप से ऐसे समझा जा सकता है: जैसे किसी drawer में चीज़ रखना।

जब हम नाम save करते हैं, तो यह ऐसा है जैसे उस नाम को किसी drawer में रख दिया गया हो।

save की जाने वाली चीज़ें बहुत हो सकती हैं, इसलिए drawers भी कई होंगे। यह जानने के लिए कि किस drawer में क्या है, हमें drawer को एक नाम देना होगा।

उदाहरण:

```
name
```

इस उदाहरण में, `name` नाम है, और `FangJunyu` save की गई information है।

![Var](../../RESOURCE/007_var.png)

**Swift में, यदि data save करनी है, तो variable (`var`) या constant (`let`) के माध्यम से declaration करना ही होगा।**

क्योंकि नाम सामान्यतः बदला जा सकता है, इसलिए हमें variable का उपयोग करना चाहिए।

```swift
var name = "FangJunyu"
```

यहाँ `name` नाम का एक variable declare किया गया है, जिसका type `String` है, और value `"FangJunyu"` है।

### variables और constants में अंतर

variable को `var` से declare किया जाता है:

```swift
var
```

constant को `let` से declare किया जाता है:

```swift
let
```

उदाहरण:

```swift
var name = "FangJunyu"
let id = 123456
```

यदि declaration variable के रूप में है, तो value बदली जा सकती है; यदि declaration constant के रूप में है, तो उसे फिर बदला नहीं जा सकता।

इसलिए variable और constant का मुख्य अंतर यह है: क्या value को बदलने की अनुमति है या नहीं।

### constant को modify करना

यदि code constant की value बदलने की कोशिश करे:

```swift
let name = "Sam"
name = "Bob"
```

Swift यह बताएगा कि assignment नहीं की जा सकती, क्योंकि यह एक constant है।

```
Cannot assign to property: 'name' is a 'let' constant
```

यह mechanism developers को कुछ महत्वपूर्ण data को गलती से modify होने से बचाने में मदद करता है।

### SwiftUI में display

`ContentView.swift` file खोलें, और `View` के अंदर variable declare करें:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

यहाँ `name` नाम का एक variable declare किया गया है, और `Text` के माध्यम से उसे interface पर दिखाया गया है।

यदि हम variable की content बदल दें:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

`Text` में दिखाई देने वाली text content भी बदल जाएगी।

इस तरह, हम variable का उपयोग करके interface में दिखने वाली content नियंत्रित कर सकते हैं, बिना हर बार `Text` के अंदर के text को सीधे modify किए।

यदि किसी अन्य स्थान को यह जानकारी चाहिए, तो हम variable को वहाँ pass भी कर सकते हैं, मानो drawer के अंदर की चीज़ किसी और जगह उपयोग के लिए दे रहे हों।

### SwiftUI में variables और constants की position

SwiftUI में variables और constants आम तौर पर `body` के बाहर लिखे जाते हैं:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

बेशक, variables और constants को `body` के अंदर भी लिखा जा सकता है:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

लेकिन इन दोनों में एक महत्वपूर्ण अंतर है:

- यदि variable या constant `body` के अंदर लिखा जाए, तो हर बार view के दोबारा calculate होने पर यह variable फिर से बनाया जाएगा।
- यदि इसे `body` के बाहर लिखा जाए, तो variable view structure की property के रूप में रहेगा, और code structure भी अधिक स्पष्ट होगा।

इसलिए, वास्तविक development में variables और constants को सामान्यतः `body` के बाहर लिखा जाता है।

## data types

variables कई अलग-अलग प्रकार की data save कर सकते हैं। इन types को data types कहा जाता है।

उदाहरण के लिए, हमने पहले `Text` से text display किया था:

```swift
Text("Hello, World")
```

यहाँ `"Hello, World"` string (`String`) type का है।

string text content को दर्शाती है, और Swift में इसे double quotes `""` से wrap करना होता है।

उदाहरण:

```swift
var hello = "Hello, World"
```

string के अलावा, Swift में कई अन्य data types भी हैं।

शुरुआती चरण में सबसे सामान्य चार types हैं:

- String
- Int
- Double
- Bool

ये चार types अधिकांश basic data processing के लिए पर्याप्त हैं।

**String**

`String` text content को दर्शाता है, उदाहरण:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

strings सामान्यतः इन चीज़ों के लिए उपयोग होती हैं: user name, title, text content।

**Int**

`Int` integers को दर्शाता है, यानी बिना decimal वाले पूरे अंक।

उदाहरण:

```swift
var age = 26
var count = 100
```

integers सामान्यतः उम्र, संख्या, count दर्शाने के लिए उपयोग होते हैं।

**Double**

`Double` decimal numbers को दर्शाता है।

उदाहरण:

```swift
var weight = 74.5
var height = 185.0
```

Swift में decimals सामान्यतः डिफ़ॉल्ट रूप से `Double` type होते हैं।

एक समान type `Float` भी है, लेकिन उसका numeric range छोटा होता है, इसलिए वास्तविक development में `Double` अधिक सामान्य है।

**Bool**

`Bool` type दो states को दर्शाता है: `true` और `false`।

उदाहरण:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` type अक्सर conditional checks में उपयोग होता है। उदाहरण के लिए, क्या alert दिखाना है।

जहाँ केवल दो संभावित परिणाम हों, वहाँ `Bool` बहुत उपयुक्त है।

### SwiftUI में display

जब हम `String` type दिखाते हैं, तो सीधे `Text` का उपयोग कर सकते हैं:

```swift
Text(name)
```

लेकिन `Int`、`Double` आदि string नहीं हैं, इसलिए उन्हें सीधे text content के हिस्से के रूप में उपयोग नहीं किया जा सकता।

यदि इन data को `Text` में दिखाना हो, तो string interpolation का उपयोग किया जा सकता है:

```swift
\()
```

string interpolation को string content के भीतर लिखा जाता है, और variable या constant को `\()` में wrap किया जाता है।

उदाहरण:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

ऊपर के code में, `""` string को दर्शाता है, और `\()` variable या constant को string में insert करने के लिए उपयोग होता है।

उदाहरण:

```swift
"DoubleNum: \(num * 2)"
```

इसका display content होगा:

```swift
DoubleNum: 2
```

इस प्रकार, हम strings के भीतर variables या constants insert कर सकते हैं, और फिर `Text` के माध्यम से उन्हें interface पर दिखा सकते हैं।

सुझाव: `\()` केवल string `""` के अंदर ही उपयोग किया जा सकता है।

## operators

जब हम variable या constant declare करते हैं, तो अक्सर इस तरह की syntax दिखती है:

```swift
var num = 1
```

यहाँ `=` को assignment operator कहा जाता है।

इसका कार्य है: दाईं ओर की value को बाईं ओर के variable को assign करना।

इस उदाहरण में, `1` variable `num` को assign किया गया है।

assignment operator के अलावा, कुछ सामान्य numeric operators भी हैं:

- `+`
- `-`
- `*`
- `/`

जब हम numbers पर calculation करते हैं, जैसे `Int` या `Double` type data, तब इन operators का उपयोग होता है।

उदाहरण:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

calculation पूरी होने के बाद result variable में save हो जाएगा।

## सारांश

variables, constants और operators programming के सबसे बुनियादी concepts हैं।

variables और constants के माध्यम से हम program में विभिन्न data save कर सकते हैं; data types के माध्यम से data की प्रकृति स्पष्ट होती है; operators के माध्यम से data पर calculation और processing की जा सकती है।

यह ज्ञान programming world के basic tools जैसा है। इन्हें अच्छी तरह समझ लेने से आगे Swift और SwiftUI सीखने के लिए मजबूत foundation बनती है।
