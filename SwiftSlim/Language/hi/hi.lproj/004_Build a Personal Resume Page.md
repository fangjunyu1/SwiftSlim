# व्यक्तिगत रिज्यूमे पेज बनाना

इस पाठ में हम एक सरल व्यक्तिगत रिज्यूमे view बनाएंगे, और निम्नलिखित ज्ञान सीखेंगे:

- cornerRadius
- spacing
- ScrollView

बनाने की प्रक्रिया में हम layout, Text और Image जैसी चीजों की पुनरावृत्ति करेंगे, और spacing control तथा content scrolling का effect भी लागू करेंगे।

## व्यक्तिगत रिज्यूमे

लक्ष्य परिणाम:

![Swift](../../RESOURCE/004_img.png)

**कृपया पहले स्वयं इसे पूरा करने की कोशिश करें, फिर नीचे की व्याख्या पढ़ें।**

### प्रोजेक्ट बनाना

एक नया iOS project बनाएं, या पहले वाला project जारी रखें।

डिफ़ॉल्ट `ContentView` code:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

अब code साफ करें, और अपनी content लिखना शुरू करें:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### समग्र संरचना

वास्तविक development में, हम सामान्यतः पहले overall structure डिज़ाइन करते हैं।

हमारे पेज में शामिल हैं:

1. शीर्षक
2. व्यक्तिगत जानकारी
3. व्यक्तिगत परिचय

सबसे बाहरी स्तर पर हम एक `VStack` जोड़ते हैं:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` यह सुनिश्चित करता है कि views vertical क्रम में arranged हों, और यह views की arrangement तथा spacing को भी नियंत्रित कर सकता है।

### शीर्षक

सबसे पहले, हम शीर्षक दिखाने के लिए एक `Text` बनाते हैं।

यहाँ, मैं शीर्षक के रूप में अपना अंग्रेज़ी नाम दिखाऊँगा:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

शीर्षक आमतौर पर बड़ा और bold होता है, इसलिए यहाँ `font` और `fontWeight` modifiers का उपयोग करते हैं:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### लेआउट

SwiftUI का डिफ़ॉल्ट alignment `center` है, इसलिए अभी शीर्षक `ContentView` के बीच में दिखाई देता है।

![Swift](../../RESOURCE/004_img3.png)

हमें शीर्षक को view के ऊपर दिखाना है, इसके लिए layout adjustment करने हेतु `Spacer` का उपयोग कर सकते हैं:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` remaining space ले लेता है, और `Text` को container के ऊपर की ओर धकेल देता है।

![Swift](../../RESOURCE/004_img4.png)

### खाली जगह

यदि आपको लगता है कि text भाग ऊपर से बहुत पास है, तो `padding` या `Spacer` का उपयोग किया जा सकता है।

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

यह `VStack` के top padding को `20` पर सेट करता है।

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

आप `Spacer` का भी उपयोग कर सकते हैं, और `frame` की height सेट करके एक निश्चित ऊंचाई की खाली जगह प्राप्त कर सकते हैं।

परिणाम:

![Swift](../../RESOURCE/004_img5.png)

### चित्र

हम अपनी एक प्रोफ़ाइल फोटो तैयार करते हैं और उसे `Assets` resource folder में रखते हैं।

![Swift](../../RESOURCE/004_img6.png)

`ContentView` में `Image` का उपयोग करके चित्र दिखाएँ:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

क्योंकि image का मूल आकार बड़ा है, हमें display size को नियंत्रित करने के लिए `frame` का उपयोग करना होगा।

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

इस समय हमें एक समस्या दिखेगी:

यदि `frame` की width-height ratio image की मूल ratio से मेल नहीं खाती, तो image विकृत हो जाएगी।

उदाहरण:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

image को विकृत होने से बचाने के लिए, हमें `scaledToFit` का उपयोग करना होगा:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` का कार्य है:

दिए गए `frame` के भीतर image की मूल ratio को बनाए रखते हुए उसे scale करना, और पूरी image content को पूर्ण रूप से दिखाना।

यह image को पूरे `frame` में ज़बरदस्ती stretch नहीं करता, बल्कि width-height ratio को अपरिवर्तित रखता है, proportional scaling करता है, जब तक कि कोई एक किनारा boundary से ठीक न मिल जाए।

इसका अर्थ है:

- यदि `frame` की width छोटी है, तो image width को आधार बनाकर scale होगी।
- यदि `frame` की height छोटी है, तो image height को आधार बनाकर scale होगी।
- image हमेशा मूल ratio बनाए रखेगी, विकृत नहीं होगी।

आम तौर पर एक दिशा का आकार सेट करना पर्याप्त होता है। उदाहरण:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

इस तरह system width `140` के आधार पर उपयुक्त height स्वचालित रूप से गणना करेगा, और image ratio बनाए रखेगा।

यदि आपको visual ratio स्थिर रखना है, या complex layout में compression से बचना है, तो width और height दोनों को constrain किया जा सकता है।

### गोल कोने

यदि आप image को rounded corners के साथ दिखाना चाहते हैं, तो `cornerRadius` modifier का उपयोग करें:

```swift
.cornerRadius(10)
```

उदाहरण:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

`Image` के modifiers के बाद `cornerRadius(20)` जोड़ें।

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` का अर्थ है view की boundary को clip करना और `20` की rounded radius लागू करना।

rounded corners जोड़ने के बाद image के चारों कोने curved हो जाते हैं, जिससे visual effect अधिक नरम और आधुनिक लगता है।

यह design style आज की interface design में बहुत सामान्य है। उदाहरण के लिए, iOS app icons भी rounded rectangle shape का उपयोग करते हैं (हालाँकि system icons में simple rounded corner के बजाय continuous curvature वाला superellipse shape उपयोग होता है)।

### व्यक्तिगत जानकारी

अब image के बाईं ओर स्थित व्यक्तिगत जानकारी क्षेत्र को बनाना शुरू करते हैं। interface structure से पता चलता है कि व्यक्तिगत जानकारी और image horizontal क्रम में हैं, इसलिए `HStack` का उपयोग करना होगा।

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

व्यक्तिगत जानकारी की content vertical रूप से arranged है।

![Swift](../../RESOURCE/004_img11.png)

इसलिए, बाहरी स्तर पर `HStack`, व्यक्तिगत जानकारी के लिए `VStack`, और text content के लिए `Text` का उपयोग करेंगे।

मूल संरचना:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**फ़ील्ड शीर्षकों को bold करना**

फ़ील्ड नाम और फ़ील्ड value में अंतर दिखाने के लिए, फ़ील्ड नाम पर `fontWeight` का उपयोग कर सकते हैं:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Text को left align करना**

`VStack` डिफ़ॉल्ट रूप से centered align होता है। यदि सभी text को left align करना है, तो alignment सेट करना होगा:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` का अर्थ है left side से align करना (left-to-right language environment में)।

![Swift](../../RESOURCE/004_img14.png)

### spacing

यदि आप व्यक्तिगत जानकारी और image के बीच एक निश्चित दूरी रखना चाहते हैं, तो पहले हमने खाली जगह सेट करने के लिए `Spacer` सीखा था:

```swift
Spacer()
    .frame(width: 10)
```

आप `HStack` के `spacing` parameter का भी उपयोग कर सकते हैं:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` का अर्थ है कि दो child views के बीच की दूरी `30 pt` होगी।

![Swift](../../RESOURCE/004_img15.png)

**`spacing` क्या है?**

`VStack`、`HStack` और `ZStack` में `spacing` child views के बीच की दूरी को नियंत्रित कर सकता है।

उदाहरण:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

`VStack` के child views के बीच की दूरी `10pt` हो जाएगी।

![Swift](../../RESOURCE/004_img16.png)

ध्यान रहे कि `spacing` केवल "direct child views" पर लागू होता है, nested container के अंदर के layout पर इसका प्रभाव नहीं पड़ता।

**सूची के अंदर spacing नियंत्रित करना**

यदि आप fields के बीच spacing बढ़ाना चाहते हैं, तो सबसे सीधा तरीका है `VStack` का `spacing` सेट करना:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

इस तरह सभी child views के बीच की दूरी `10 pt` हो जाएगी।

लेकिन interface को ध्यान से देखने पर एक समस्या दिखती है:

फ़ील्ड समूहों के बीच spacing है, और फ़ील्ड नाम तथा फ़ील्ड value के बीच भी वही spacing दिखाई देती है।

ऐसा इसलिए है क्योंकि `spacing` current container के सभी direct child views पर लागू होता है।

इस संरचना में, हर `Text` बाहरी `VStack` का direct child view है, इसलिए spacing समान रूप से लागू हो रही है।

यदि आप चाहते हैं कि फ़ील्ड groups के बीच spacing हो, लेकिन फ़ील्ड नाम और value के बीच डिफ़ॉल्ट compact spacing बनी रहे, तो "फ़ील्ड नाम + फ़ील्ड value" को एक logical group मानकर बाहर से `VStack` में wrap कर सकते हैं:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

अब संरचना ऐसी हो जाती है कि outer `VStack` के बीच spacing है, जबकि inner `VStack` के भीतर डिफ़ॉल्ट compact spacing रहती है; इसलिए फ़ील्ड नाम और फ़ील्ड value के बीच अतिरिक्त gap नहीं आता।

![Swift](../../RESOURCE/004_img18.png)

### व्यक्तिगत परिचय

अब व्यक्तिगत परिचय क्षेत्र लागू करते हैं।

interface structure से देखें तो introduction content कई lines of text से बनी है, और text vertically arranged है।

![Swift](../../RESOURCE/004_img19.png)

इसलिए, `VStack` और `Text` का उपयोग किया जा सकता है:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**spacing बढ़ाना**

अब व्यक्तिगत जानकारी और व्यक्तिगत परिचय भाग थोड़े dense हैं, style अभी सुंदर नहीं दिखती।

![Swift](../../RESOURCE/004_img20.png)

क्योंकि वे दोनों एक ही outer container में हैं, हम outer container पर overall spacing नियंत्रित कर सकते हैं:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

परिणाम:

![Swift](../../RESOURCE/004_img21.png)

**सूची spacing**

व्यक्तिगत परिचय text के बीच spacing सेट करने के लिए `spacing` का उपयोग करें:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### व्यक्तिगत रिज्यूमे पूरा करना

अब हमारे व्यक्तिगत रिज्यूमे का basic framework पूरा हो गया है।

![Swift](../../RESOURCE/004_img.png)

### ScrollView

अभी पेज की संरचना `VStack` का उपयोग करती है। जब परिचय text कम हो, तब कोई समस्या नहीं होती, लेकिन यदि इसे 20, 30 या उससे अधिक items तक बढ़ा दिया जाए, तो content height screen से बाहर चली जाएगी।

उदाहरण:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

इस समय दो बातें दिखाई देंगी:

- नीचे की content कट जाएगी
- पेज scroll नहीं कर पाएगा

यह `VStack` की समस्या नहीं है। `VStack` केवल एक layout container है; यह अपने आप scrolling capability प्रदान नहीं करता।

**`ScrollView` क्या है**

`ScrollView` एक scrollable container है, जो screen size से अधिक content के लिए उपयुक्त है। जैसे vertical या horizontal lists।

मूल संरचना:

```swift
ScrollView {
    ...
}
```

यदि scrolling effect चाहिए, तो पूरे पेज content को `ScrollView` के भीतर wrap करना होगा:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

इस तरह पूरा पेज एक scrollable region बन जाता है। जब content screen height से अधिक हो, तो यह स्वाभाविक रूप से scroll कर सकेगा।

`ScrollView` डिफ़ॉल्ट रूप से scrollbar indicator दिखाता है। यदि आप scrollbar छिपाना चाहते हैं, तो सेट करें:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## पूर्ण code

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
