# साइन-इन व्यू

इस पाठ में, हम एक बहुत ही उपयोगी दृश्य सीखेंगे, यानी साइन-इन व्यू।

चाहे वेबसाइट हो या ऐप, उपयोग के दौरान कई बार उपयोगकर्ता को अपने अकाउंट में साइन इन करना और पासवर्ड दर्ज करना आवश्यक होता है।

उदाहरण के लिए, GitHub का साइन-इन पेज:

![WordPress](../../Resource/019_github.png)

इस पाठ में, हम ऐसा ही एक साइन-इन व्यू बनाएंगे, ताकि उपयोगकर्ता हाथ से अकाउंट और पासवर्ड दर्ज कर सके, और हम यह जाँच सकें कि दर्ज किए गए कंटेंट में कोई समस्या है या नहीं।

## ऊपर का लेआउट

हम `ContentView` फ़ाइल में साइन-इन व्यू का कोड लिखेंगे।

सबसे पहले, आइए साइन-इन व्यू के ऊपरी हिस्से में पहचान वाला भाग लिखते हैं। आप पहले एक उपयुक्त आइकन इमेज तैयार करके उसे `Assets` फ़ोल्डर में रख सकते हैं।

![icon](../../Resource/019_icon1.png)

इसके बाद, `Image` और modifiers का उपयोग करके इमेज दिखाइए:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

यहाँ इन modifiers का मतलब है:

- `resizable()`: इमेज का आकार बदला जा सकता है।
- `scaledToFit()`: इमेज को उसके मूल अनुपात को बनाए रखते हुए स्केल करता है।
- `frame(width: 100)`: इमेज की प्रदर्शित चौड़ाई `100` सेट करता है।

इसके बाद, `Text` और modifiers का उपयोग करके साइन-इन शीर्षक दिखाइए:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

फिर, `VStack` का उपयोग करके इमेज और टेक्स्ट को ऊपर-नीचे व्यवस्थित कीजिए:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

परिणाम:

![view](../../Resource/019_view.png)

यहाँ तक, हमने साइन-इन व्यू के ऊपर वाले शीर्षक भाग को पूरा कर लिया है।

### लेआउट को ऑप्टिमाइज़ करना

अभी, इमेज और शीर्षक डिफ़ॉल्ट रूप से पूरे लेआउट के मध्य क्षेत्र में हैं।

अगर हम चाहते हैं कि वे अधिक "पेज के ऊपर वाले साइन-इन चिन्ह" की तरह दिखें, तो हम `Spacer()` का उपयोग करके बचे हुए स्थान को फैलाकर कंटेंट को ऊपर की ओर दिखा सकते हैं।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

परिणाम:

![view](../../Resource/019_view1.png)

लेकिन अब `Image` और `Text` स्क्रीन के ऊपर वाले हिस्से के बहुत करीब आ गए हैं, इसलिए यह थोड़ा भरा-भरा लगता है।

इस समय, हम पूरे `VStack` को ऊपर से कुछ दूरी देने के लिए `padding` का उपयोग कर सकते हैं।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

परिणाम:

![view](../../Resource/019_view2.png)

इस तरह, पेज के ऊपर वाला शीर्षक भाग अधिक उपयुक्त दिखता है।

## यूज़रनेम और पासवर्ड

साइन-इन पेज पर सामान्यतः उपयोगकर्ता को यूज़रनेम और पासवर्ड दर्ज करना होता है।

SwiftUI में, हम उपयोगकर्ता द्वारा दर्ज किया गया कंटेंट प्राप्त करने के लिए `TextField` का उपयोग कर सकते हैं।

लेकिन एक बात ध्यान देने योग्य है: `TextField` खुद लंबे समय तक इनपुट डेटा को संग्रहीत नहीं करता, यह सिर्फ एक इनपुट कंट्रोल है। वास्तव में इस इनपुट कंटेंट को वे variables सहेजते हैं, जिन्हें हम इससे bind करते हैं।

इसलिए, सबसे पहले हमें दो `@State` variables बनाने होंगे, जो यूज़रनेम और पासवर्ड को सहेजें:

```swift
@State private var user = ""
@State private var password = ""
```

जब `@State` variable का value बदलता है, तो SwiftUI संबंधित views को अपने-आप refresh करता है।

इसके बाद, इन दोनों variables को bind करने के लिए `TextField` का उपयोग कीजिए:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

यहाँ `$user` और `$password` का मतलब "binding" है।

यानी, जब उपयोगकर्ता इनपुट बॉक्स में टेक्स्ट टाइप करता है, तो variable का value भी उसी समय बदलता है; और जब variable बदलता है, तो इनपुट बॉक्स में दिखने वाला कंटेंट भी उसी समय बदलता है।

व्यू और डेटा के "एक-दूसरे के साथ सिंक में रहने" के इस संबंध को binding कहा जाता है।

ध्यान दीजिए कि यहाँ `$` के साथ यह लिखावट इस्तेमाल करनी होगी:

```swift
$user
```

क्योंकि `TextField` को सामान्य string नहीं, बल्कि एक ऐसी binding value चाहिए, जो "दोनों दिशाओं में डेटा बदल सके"।

### इनपुट बॉक्स दिखाना

आइए इन्हें `ContentView` में रखते हैं:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

दिखाने का परिणाम:

![view](../../Resource/019_view3.png)

क्योंकि अभी `user` और `password` दोनों डिफ़ॉल्ट रूप से खाली strings हैं:

```swift
""
```

इसलिए इनपुट बॉक्स में पहले placeholder टेक्स्ट दिखाई देगा, उदाहरण के लिए:

```swift
input user
```

यह टेक्स्ट सिर्फ उपयोगकर्ता को "यहाँ क्या दर्ज करना चाहिए" यह बताता है, और यह वास्तविक इनपुट कंटेंट नहीं है।

### इनपुट बॉक्स को ऑप्टिमाइज़ करना

अब इनपुट बॉक्स उपयोग के लिए तैयार हैं, लेकिन डिफ़ॉल्ट शैली अपेक्षाकृत सरल है।

इंटरफ़ेस को अधिक स्पष्ट बनाने के लिए, हम इनपुट बॉक्स के आगे एक शीर्षक जोड़ सकते हैं, और इनपुट बॉक्स पर थोड़ी सरल स्टाइल ऑप्टिमाइज़ेशन कर सकते हैं।

उदाहरण के लिए, पहले एक शीर्षक जोड़िए:

```swift
Text("Username")
    .fontWeight(.bold)
```

इसके बाद, `HStack` का उपयोग करके शीर्षक और इनपुट बॉक्स को एक ही पंक्ति में रखिए:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

यहाँ हम `HStack` का उपयोग करते हैं क्योंकि हम "बाईं ओर शीर्षक और दाईं ओर इनपुट बॉक्स" दिखाना चाहते हैं।

एक बात ध्यान में रखने योग्य है कि `TextField` डिफ़ॉल्ट रूप से बची हुई उपलब्ध जगह घेर लेता है।

![color](../../Resource/019_view6.png)

दोनों इनपुट बॉक्स का आकार अधिक एकसमान दिखाने के लिए, हम `frame(width:)` का उपयोग करके इसकी चौड़ाई निर्धारित कर सकते हैं, ताकि इनपुट बॉक्स अधिक व्यवस्थित दिखें।

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

इसके बाद, इनपुट बॉक्स को अधिक स्पष्ट दिखाने के लिए एक border भी जोड़िए:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

अब, आइए यूज़रनेम और पासवर्ड दोनों को `ContentView` व्यू में जोड़ते हैं:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

दिखाने का परिणाम:

![view](../../Resource/019_view4.png)

यहाँ तक, उपयोगकर्ता अब यूज़रनेम और पासवर्ड दर्ज कर सकता है।

## साइन-इन बटन

अब, हम इनपुट बॉक्स के नीचे एक साइन-इन बटन जोड़ेंगे।

```swift
Button("Sign in") {

}
```

इसके बाद, `buttonStyle` का उपयोग करके बटन को अधिक स्पष्ट system style दीजिए:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

दिखाने का परिणाम:

![view](../../Resource/019_view5.png)

यह सुनिश्चित करने के लिए कि बटन वास्तव में टैप का जवाब देता है, हम पहले बटन के भीतर एक `print` लिखकर जाँच सकते हैं:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

जब बटन पर टैप किया जाएगा, तो console में यह output होगा:

```swift
click Sign in
```

यह दिखाता है कि बटन ने सफलतापूर्वक टैप action का जवाब दिया है।

## साइन-इन लॉजिक

अब, हम साइन-इन बटन में सबसे बुनियादी validation logic जोड़ेंगे: **यह जाँचना कि उपयोगकर्ता ने यूज़रनेम और पासवर्ड दर्ज किया है या नहीं**।

हम निम्नलिखित स्थितियाँ प्राप्त करना चाहते हैं:

- अगर उपयोगकर्ता ने कुछ भी दर्ज नहीं किया है, तो `Empty` output करें
- अगर उपयोगकर्ता ने दोनों में से केवल एक ही दर्ज किया है, तो बताइए कि कौन-सी चीज़ missing है
- अगर यूज़रनेम और पासवर्ड दोनों दर्ज किए गए हैं, तो `Success` output करें

### कोई जानकारी दर्ज नहीं की गई

क्योंकि `user` और `password` दोनों डिफ़ॉल्ट रूप से खाली strings हैं:

```swift
@State private var user = ""
@State private var password = ""
```

इसलिए जब उपयोगकर्ता कुछ भी दर्ज नहीं करेगा, तब भी वे खाली रहेंगे।

Swift में, `String` जैसे types `isEmpty` का उपयोग करके यह तय कर सकते हैं कि content खाली है या नहीं।

### isEmpty property

`isEmpty` का उपयोग सामान्यतः strings, arrays और दूसरे content के खाली होने की जाँच करने के लिए किया जाता है।

उदाहरण के लिए:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

अगर content खाली है, तो `isEmpty` `true` return करता है; अगर content खाली नहीं है, तो यह `false` return करता है।

इसलिए, हम इसका उपयोग यह निर्धारित करने के लिए कर सकते हैं कि यूज़रनेम और पासवर्ड में इनपुट content है या नहीं।

### isEmpty से variables जाँचना

अगर उपयोगकर्ता ने कोई जानकारी दर्ज नहीं की है, तो:

```swift
user.isEmpty // true
password.isEmpty    // true
```

इस समय, हम शर्त इस तरह लिख सकते हैं:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

इस कोड का मतलब है: अगर `user` खाली है, और `password` भी खाली है, तो यह output करें:

```swift
Empty
```

यहाँ `&&` एक logical operator है और इसका मतलब "और" होता है।

यानी, पूरी शर्त तभी true होगी जब बाईं तरफ की शर्त true हो और दाईं तरफ की शर्त भी true हो।

इसलिए, यह कोड तभी चलेगा जब यूज़रनेम और पासवर्ड दोनों खाली होंगे।

## उपयोगकर्ता ने सिर्फ एक भाग भरा

इसके बाद, आइए एक दूसरी स्थिति पर विचार करें: उपयोगकर्ता ने केवल यूज़रनेम भरा है, या केवल पासवर्ड भरा है।

उदाहरण के लिए:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

इस समय, यूज़रनेम खाली नहीं है, लेकिन पासवर्ड खाली है।

हम `isEmpty` का उपयोग करके आगे भी जाँच कर सकते हैं:

### वह स्थिति जहाँ उपयोगकर्ता ने अकाउंट या पासवर्ड भरा है

अगर उपयोगकर्ता ने केवल यूज़रनेम या केवल पासवर्ड भरा है, तो हमें उसी के अनुसार बताना होगा कि क्या missing है।

उदाहरण के लिए, अगर उपयोगकर्ता ने केवल यूज़रनेम भरा है:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

इस कोड की logic यह है: अगर यूज़रनेम खाली है, तो यूज़रनेम दर्ज करने के लिए कहिए। नहीं तो, जाँचिए कि पासवर्ड खाली है या नहीं, और अगर खाली है, तो पासवर्ड दर्ज करने के लिए कहिए।

### उपयोगकर्ता ने सारी जानकारी भर दी

अगर यूज़रनेम और पासवर्ड दोनों पहले से दर्ज किए जा चुके हैं, तो `isEmpty` दोनों के लिए `false` return करेगा।

इस समय, हम इसे इस तरह लिख सकते हैं:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

यहाँ `!` का मतलब "negation" होता है।

उदाहरण के लिए:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

यानी, `user.isEmpty` का उपयोग "क्या यूज़रनेम खाली है" यह तय करने के लिए किया जाता है, जबकि `!user.isEmpty` का उपयोग "क्या यूज़रनेम खाली नहीं है" यह तय करने के लिए किया जाता है।

पासवर्ड के लिए भी यही logic लागू होती है।

इसलिए, इस कोड का मतलब है: यूज़रनेम खाली नहीं है, और पासवर्ड भी खाली नहीं है।

जब ये दोनों शर्तें true हों, तो output होगा:

```swift
Success
```

## पूरी validation logic

अब, आइए इन तीनों स्थितियों को मिलाकर `Button` में लिखते हैं:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

इस कोड का execution order इस तरह समझा जा सकता है:

पहले चरण में, हम पहले यह जाँचते हैं:

```swift
if user.isEmpty && password.isEmpty
```

अगर यूज़रनेम और पासवर्ड दोनों खाली हैं, तो सीधे `Empty` output होगा।

अगर दोनों खाली नहीं हैं, तो हम इस लाइन की जाँच जारी रखते हैं:

```swift
else if user.isEmpty || password.isEmpty
```

यहाँ `||` का अर्थ "या" है।

यानी, जब तक एक शर्त true है, तब तक पूरी शर्त true रहेगी।

इसलिए, जब तक यूज़रनेम खाली है, या पासवर्ड खाली है, तब तक `else if` का code block चलेगा।

कोड ब्लॉक में जाने के बाद, हम और स्पष्ट रूप से जाँचते हैं कि कौन-सा इनपुट बॉक्स भरा नहीं गया:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

अगर ऊपर की दोनों शर्तों में से कोई भी true नहीं है, तो इसका मतलब है कि यूज़रनेम खाली नहीं है, और पासवर्ड भी खाली नहीं है।

तब प्रोग्राम अंतिम `else` में जाएगा:

```swift
print("Success")
```

इस तरह, हमने साइन-इन इनपुट की सबसे बुनियादी validation logic पूरी कर ली।

## यूज़रनेम और पासवर्ड validation

ऊपर की logic सिर्फ यह जाँचती है कि "कुछ content दर्ज किया गया है या नहीं"।

लेकिन वास्तविक ऐप में सिर्फ content दर्ज कर देना पर्याप्त नहीं है। सामान्यतः, हमें यूज़रनेम और पासवर्ड को सर्वर पर भेजकर verify भी करना होता है।

अगर सर्वर यह पुष्टि करता है कि यूज़रनेम मौजूद है और पासवर्ड सही है, तो वह साइन-इन की अनुमति देगा; नहीं तो, वह बताएगा कि साइन-इन असफल रहा।

इस प्रक्रिया का अभ्यास करने के लिए, हम पहले कोड में एक अस्थायी अकाउंट और पासवर्ड सेट कर सकते हैं, ताकि "सही साइन-इन जानकारी" का अनुकरण किया जा सके:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

जब यूज़रनेम और पासवर्ड दोनों खाली न हों, तब हम आगे यह तुलना करते हैं कि वे सही हैं या नहीं:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

यहाँ `==` का मतलब "बराबर है या नहीं" होता है।

उदाहरण के लिए:

```swift
user == userID
```

इसका मतलब है, उपयोगकर्ता द्वारा दर्ज किया गया यूज़रनेम क्या हमारे द्वारा सेट किए गए सही यूज़रनेम के बिल्कुल बराबर है? पासवर्ड की जाँच भी इसी logic का पालन करती है।

इसलिए, जब दर्ज किया गया यूज़रनेम और पासवर्ड सेट किए गए values के बराबर होंगे, तब `Success` output होगा; और जब इनमें से कोई एक भी बराबर नहीं होगा, तब `Input error` output होगा।

इस तरह, हमने एक सरल "mock sign-in verification" पूरा कर लिया।

हालाँकि यह अभी भी सर्वर से जुड़ा हुआ वास्तविक साइन-इन feature नहीं है, फिर भी यह हमें यह समझने के लिए पर्याप्त है: **बटन पर टैप करने के बाद, अलग-अलग शर्तों के अनुसार अलग-अलग कोड चल सकते हैं**।

## सारांश

इस पाठ में, हमने एक बुनियादी साइन-इन व्यू पूरा किया, और विशेष रूप से "शर्तों के आधार पर इनपुट कंटेंट को जज करने की logic" सीखी।

इस पाठ का मुख्य कंटेंट है: string खाली है या नहीं यह तय करने के लिए `isEmpty` का उपयोग करना, और अलग-अलग स्थितियों को संभालने के लिए logical operators के साथ `if` statements का उपयोग करना।

इनमें दो बहुत महत्वपूर्ण logical operators हैं:

- `&&`: अर्थ "और", दोनों शर्तें पूरी होनी चाहिए
- `||`: अर्थ "या", सिर्फ एक शर्त पूरी होना भी पर्याप्त है

जब ये शर्तें अंततः `true` या `false` देती हैं, तब `if` statement परिणाम के आधार पर अलग कोड चलाती है।

इस साइन-इन व्यू के माध्यम से, हम पहले ही "इंटरफ़ेस + डेटा + logical judgment" को मिलाने वाली development पद्धति के संपर्क में आना शुरू कर चुके हैं।

## पूरा कोड

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
