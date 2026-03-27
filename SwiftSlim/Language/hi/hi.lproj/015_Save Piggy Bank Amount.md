# गुल्लक की amount save करना

पिछले पाठ में हमने एक सरल “piggy bank” बनाया था। इस पाठ में हम सीखेंगे कि “piggy bank” की amount को persistent तरीके से कैसे save किया जाए।

इस पाठ में मुख्य रूप से `UserDefaults` और `@AppStorage` property wrapper सीखी जाएगी। साथ ही `onAppear` के उपयोग और optional type (`nil`) के इस्तेमाल को भी आगे समझाया जाएगा।

ध्यान दें कि इस पाठ के लिए पिछली कक्षा में बनाया गया “piggy bank” code जारी रखना होगा।

## data persistence की समस्या

अब “piggy bank” का interface बहुत सरल और उपयोग में आसान है।

![Piggy Bank](../../Resource/014_view.png)

लेकिन एक स्पष्ट समस्या है: हर बार view refresh होने पर या app बंद होने पर, “piggy bank” की total amount फिर `0` बन जाती है, और पहले की सारी total amount खो जाती है।

इसका अर्थ है कि data वास्तव में save नहीं हो रही। दूसरे शब्दों में, वर्तमान “piggy bank” केवल temporary data save कर सकती है।

### persistent save क्यों नहीं हो रही?

ऐसा इसलिए है क्योंकि हम `@State` से declare की गई variable का उपयोग कर रहे हैं:

```swift
@State private var amount = 0
```

`@State` से declare की गई variable का lifecycle पूरी तरह view पर निर्भर करता है।

जब view create होती है, `amount` को `0` से initialize किया जाता है; जब view destroy होती है, `amount` भी destroy हो जाती है।

यहाँ `amount` की data केवल memory में मौजूद है, device पर save नहीं होती।

यदि हम नहीं चाहते कि `amount` view lifecycle के साथ बँधी रहे, तो हमें data persistence लागू करनी होगी। यानी data को device पर save करना होगा।

### “data persistence” क्या है

data persistence को ऐसे समझें: data को “temporary memory” से “device storage” में save करना।

इस तरह, view या app बंद होने पर भी data खोती नहीं है।

Swift development में, simple “data persistence” के लिए `UserDefaults` का उपयोग किया जा सकता है; अधिक complex data के लिए `SwiftData` या `CoreData` उपयोग होते हैं।

इस पाठ में, पहले हम सबसे सरल `UserDefaults` सीखेंगे।

## `UserDefaults`

`UserDefaults` lightweight key-value pair data save करने के लिए उपयोग होता है, और सामान्यतः `String`、`Int`、`Double`、`Bool` जैसी basic types store करने के लिए इस्तेमाल होता है।

### data save करना

`UserDefaults` `set` method से data save करता है:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

`UserDefaults` का पहला parameter save की जाने वाली data है, यहाँ `String`、`Int` आदि पास किए गए हैं।

दूसरा parameter `forKey` किसी variable name जैसा होता है, जो `UserDefaults` में save की गई data की पहचान करता है।

### data पढ़ना

`UserDefaults` corresponding methods से data पढ़ता है:

```swift
let name = UserDefaults.standard.string(forKey: "name")   // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")    // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember") // true
```

read करते समय corresponding type method ही उपयोग करनी चाहिए, नहीं तो error आ सकती है या data incorrect मिल सकती है।

### `UserDefaults` की सावधानियाँ

#### 1. optional type return होना

`UserDefaults` से data पढ़ते समय, कुछ methods optional type (`Optional`) return करती हैं।

उदाहरण:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

यहाँ `name` का type होगा:

```swift
String?
```

इसका अर्थ है कि value हो भी सकती है, और नहीं भी।

**optional type क्यों return होती है?**

क्योंकि `UserDefaults` में किसी key के लिए data मौजूद हो, यह निश्चित नहीं है।

उदाहरण:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

यदि पहले कभी `"City"` key save ही न की गई हो, तो read result होगा:

```swift
nil
```

ध्यान दें कि `nil` का अर्थ है data नहीं है; यह empty string नहीं है।

“type system” वाले पाठ में हमने ऐसा ही मामला देखा था, जहाँ type conversion fail होने पर optional type return होती थी।

इस स्थिति में हमें `??` का उपयोग करके default value देनी होती है:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

यदि `UserDefaults` data पढ़ पाए, तो वही value उपयोग होगी; यदि read न हो (`nil` हो), तो default value उपयोग होगी।

#### 2. non-optional type return होना

`UserDefaults` जब `Int`、`Double`、`Bool` type read करता है, तो वह non-optional type return करता है।

उदाहरण:

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")   // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar") // false
```

भले ही इन keys के लिए कभी कोई data save न की गई हो, return value `nil` नहीं होगी।

इसके बजाय default value मिलेगी:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. data amount limitation

`UserDefaults` केवल कम मात्रा की data save करने के लिए उपयुक्त है, जैसे app settings, simple state आदि।

वास्तविक उपयोग में यह large amount data या frequently read/write होने वाली data के लिए उपयुक्त नहीं है।

## “piggy bank” amount save करना

अब हम `UserDefaults` का उपयोग करके “piggy bank” की total amount save कर सकते हैं।

जब user button click करे, input amount total amount में जुड़ जाए, और total amount को `UserDefaults` में save कर दिया जाए।

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")   // UserDefaults
}
.buttonStyle(.borderedProminent)
```

अब हमने data write करने की logic लागू कर दी है।

## data persistence logic की व्याख्या

हालाँकि हमने persistence write logic पूरी कर ली है, लेकिन actual run करने पर आप देखेंगे: हर बार view refresh होने पर या app फिर से खोलने पर, `amount` variable फिर भी `0` ही रहती है।

ऐसा इसलिए है:

```swift
@State private var amount = 0
```

SwiftUI में, `@State` variable view create होने पर फिर से initialize होती है।

हालाँकि `UserDefaults` में `amount` की value save हो गई है, लेकिन view reload होने पर `amount` फिर भी `0` से reset हो जाती है।

इसका अर्थ है कि अभी हमने केवल data को `UserDefaults` में save किया है, लेकिन view में data को restore नहीं किया।

इसलिए, जब view load हो, तब `UserDefaults` से data manually read करके उसे फिर `amount` को assign करना होगा; तभी पूरा persistence logic पूरा होगा।

### logic का उदाहरण

इस process को “classroom blackboard” की तरह समझा जा सकता है:

कक्षा के दौरान, शिक्षक blackboard पर content लिखता है। यह content current view state (`@State`) की तरह है।

जब class समाप्त होती है, blackboard साफ़ कर दी जाती है, ताकि अगली class के लिए तैयार हो सके। यह वैसा ही है जैसे view destroy हो जाए और `@State` की data clear हो जाए।

ताकि lesson content खो न जाए, शिक्षक पहले से content को courseware में save कर देता है। यह courseware `UserDefaults` में save data के समान है।

जब अगली बार class शुरू होती है, blackboard शुरू में खाली होती है (`@State` initialize होती है), और शिक्षक courseware के आधार पर पुरानी content फिर blackboard पर लिखता है (`UserDefaults` read करना)।

समझने वाली मुख्य बात यह है कि blackboard अपने आप पुरानी content restore नहीं करेगी; “courseware पढ़कर” (`UserDefaults` read करके) उसे फिर से लिखना ही होगा।

## `onAppear` से data read करना

जब view दिखाई दे, तब `UserDefaults` की value manually read करके `@State` की `amount` variable को assign करना होगा, ताकि persistence वास्तव में पूरी हो सके।

SwiftUI में, `onAppear` का उपयोग view display होने पर initialization logic execute करने के लिए किया जा सकता है:

```swift
.onAppear {}
```

`UserDefaults` read code को `onAppear` में रखें:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

जब view create होगी, `amount` पहले `0` से initialize होगी; फिर view display होते समय `onAppear` trigger होगा, और `UserDefaults` से data read करके `amount` को assign करेगा। इस तरह view पिछली save की हुई total amount दिखा पाएगी।

अब “piggy bank” की पूरी data persistence logic पूरी हो जाती है।

## पूर्ण code

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

## `@AppStorage` property wrapper

SwiftUI एक `@AppStorage` property wrapper प्रदान करती है, जो `UserDefaults` save logic को सरल बना देती है।

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` `UserDefaults` की एक wrapper है, और `"amount"` `UserDefaults` की key है।

जब view create होती है, यह `UserDefaults` से data read करती है; और जब variable बदलती है, यह automatically data को `UserDefaults` में write कर देती है।

यह SwiftUI के state update mechanism को support करती है। `@State` की तरह, value बदलने पर SwiftUI view refresh होती है।

यानी `@AppStorage` data read और save दोनों की logic संभाल सकती है; अब `UserDefaults` manually call करने या `onAppear` से data read करने की ज़रूरत नहीं रहती।

इसलिए, हम code में `UserDefaults` को `@AppStorage` से replace कर सकते हैं:

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

## सारांश

इस पाठ में हमने मुख्य रूप से ये बातें सीखी:

सबसे पहले, `UserDefaults` lightweight data save करने के लिए उपयोग होता है। हमने `UserDefaults` का उपयोग करके total amount को device पर save किया। `UserDefaults` data read और write methods देती है, और साथ ही optional types जैसी स्थितियों को भी handle करना पड़ता है।

दूसरे, `@State` variable केवल view के temporary state को manage करती है, और उसका lifecycle view के साथ ही जुड़ा होता है। view दोबारा create होने पर `@State` फिर से initialize हो जाती है।

`UserDefaults` की data restore करते समय, हमने `onAppear` का उपयोग सीखा, जिससे view display होने पर `UserDefaults` read की जा सके और data restore हो सके।

अंत में, `@AppStorage` से `UserDefaults` को replace करके, view load होने पर automatic data read और data change होने पर automatic write को implement किया गया, जिससे manual `UserDefaults` और `onAppear` logic की ज़रूरत नहीं रहती।

इन ज्ञान बिंदुओं के माध्यम से, हम एक basic app data storage feature लागू कर सकते हैं, जिससे data persistent रूप से save हो सके।

## अभ्यास

अब “piggy bank” amount save कर सकती है, लेकिन feature अभी भी पूरी नहीं है।

1. यदि user amount निकालना चाहे, तो withdrawal logic design करनी होगी।
2. यदि user amount clear करना चाहे, तो reset logic भी implement करनी होगी।
3. यदि piggy bank को एक नाम देना हो, तो `String` type data save करनी होगी।

इन features को current base पर पूरा करके “piggy bank” को और complete बनाया जा सकता है।

## अतिरिक्त ज्ञान - input field default value की समस्या

अब हम input field interaction को और बेहतर बना सकते हैं, ताकि input experience अधिक convenient हो।

![textfield](../../Resource/015_view.png)

वर्तमान implementation में, input field की default value `0` है। हर बार amount input करते समय user को पहले `0` delete करना पड़ता है, और फिर नया number लिखना पड़ता है। यह interaction experience उचित नहीं है।

हमें input field की initial value खाली रखनी चाहिए, `0` नहीं।

ऐसा इसलिए है क्योंकि `TextField` और `number` two-way binding में हैं:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

जब `number` को `0` से initialize किया जाता है, तो input field भी `0` दिखाएगी।

इसलिए, हमें `number` को empty value यानी `nil` में बदलना होगा।

```swift
@State private var number = nil
```

अब error आएगी:

```
Generic parameter 'Value' could not be inferred
```

यही वह स्थिति है जो हमने “type system” में देखी थी: जब compiler variable type automatically infer नहीं कर पाता, तब type explicitly declare करनी पड़ती है।

क्योंकि हमने `number` को `nil` set किया है, और `nil` अपने आप में कोई type information नहीं रखता, इसलिए compiler तय नहीं कर पाता कि यह variable `String` है, `Int` है, या कोई और type। इसलिए error आती है।

इसलिए, हमें `number` की type explicitly declare करनी होगी:

```swift
@State private var number:Int? = nil
```

यहाँ `Int?` optional type (`Optional`) है, जिसका अर्थ है कि `number` की value `Int` भी हो सकती है, और `nil` भी।

इस तरह initialization के समय इसे `nil` set करने पर input field खाली दिखाई देगी, `0` नहीं।

### optional को unwrap करना

जब हम `number` को optional type में बदलते हैं, तो पुराना calculation code error देने लगेगा:

```swift
amount += number
```

error message:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

ऐसा इसलिए है क्योंकि `number` अब `nil` भी हो सकती है। यदि इसे सीधे calculation में use करें, तो बात ऐसी होगी:

```swift
amount += nil
```

स्पष्ट है कि `nil` और `amount` को जोड़ा नहीं जा सकता; यह invalid operation है।

इसलिए, optional type को calculation में उपयोग करने से पहले unwrap करना पड़ता है।

यहाँ `??` का उपयोग करके default value दी जा सकती है:

```swift
amount += number ?? 0
```

जब `number` `nil` हो, तब default value `0` उपयोग होगी; और जब `number` में value हो, तब actual input data उपयोग होगी।

इस प्रकार calculation भी सही रहेगी, और input field default रूप से खाली भी रहेगी। user को input field से `0` manually delete नहीं करनी पड़ेगी।

## expanded code

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
