# फिल लाइट ऐप

इस पाठ में, हम एक बहुत ही रोचक फिल लाइट ऐप बनाएंगे। जब रात होती है, तो हम फोन की स्क्रीन पर अलग-अलग रंग दिखा सकते हैं और उसे एक साधारण फिल लाइट की तरह उपयोग कर सकते हैं।

यह फिल लाइट ऐप स्क्रीन पर टैप करके रंग बदल सकता है, और स्लाइडर की मदद से ब्राइटनेस भी समायोजित कर सकता है।

इस उदाहरण में, हम `brightness` से व्यू की ब्राइटनेस बदलना, `onTapGesture` से व्यू में टैप जेस्चर जोड़ना, और `Slider` कंट्रोल के बारे में सीखेंगे।

परिणाम:

![Color](../../Resource/018_color.png)

## रंग दिखाना

सबसे पहले, हम व्यू में एक रंग दिखाते हैं।

SwiftUI में, `Color` सिर्फ एक रंग को ही नहीं दर्शाता, बल्कि इसे एक व्यू के रूप में भी दिखाया जा सकता है:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

यहाँ `Color.red` एक लाल व्यू को दर्शाता है। `.ignoresSafeArea()` रंग वाले व्यू को पूरी स्क्रीन पर फैला देता है, इसलिए यह एक असली फिल लाइट इफेक्ट जैसा दिखता है।

परिणाम:

![Color](../../Resource/018_color1.png)

### रंगों की array और index

अभी सिर्फ एक ही रंग दिख रहा है। लेकिन फिल लाइट सामान्यतः सिर्फ एक ही रंग की नहीं होती। यह नीला, पीला, बैंगनी, सफेद और दूसरे रंग भी दिखा सकती है।

हम चाहते हैं कि स्क्रीन पर टैप करने पर अलग-अलग रंगों के बीच बदलाव हो। हम इन रंगों को एक array में रखकर एक साथ manage कर सकते हैं:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

एक array "एक ही प्रकार के डेटा के समूह" को संग्रहित करने के लिए उपयुक्त होती है। यहाँ array का हर element एक `Color` है।

अगर हम कोई एक निश्चित रंग दिखाना चाहते हैं, तो हम index का उपयोग कर सकते हैं:

```swift
colors[0]
```

इसका मतलब है array के `0` index पर मौजूद रंग को पढ़ना, यानी पहला रंग।

अब कोड इस तरह लिखा जा सकता है:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

इस तरह, स्क्रीन array का पहला रंग दिखाएगी, यानी लाल।

### index से रंग को नियंत्रित करना

अगर हमें अलग-अलग रंगों के बीच बदलाव करना है, तो index को सीधे लिखने के बजाय उसे manage करने के लिए एक variable चाहिए।

हम index को सहेजने के लिए `@State` का उपयोग करके एक variable घोषित कर सकते हैं:

```swift
@State private var index = 0
```

यहाँ `index` वर्तमान रंग का index दर्शाता है।

जब `index` बदलता है, तो SwiftUI इंटरफ़ेस को फिर से calculate करता है और दिखाए जा रहे content को update करता है।

फिर हम पुराने `colors[0]` को बदलकर यह लिखते हैं:

```swift
colors[index]
```

इस तरह, व्यू में दिखने वाला रंग `index` द्वारा निर्धारित होगा।

अब कोड इस तरह बन जाता है:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

जब `index` बदलेगा, तो `colors[index]` भी अलग रंग दिखाएगा।

उदाहरण के लिए:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

एक बात ध्यान रखने योग्य है कि `index` array के सबसे बड़े index से आगे नहीं जाना चाहिए, नहीं तो out-of-range error होगा।

## टैप जेस्चर

अब हम `index` के अनुसार अलग-अलग रंग दिखा सकते हैं, लेकिन अभी टैप करके रंग नहीं बदल सकते।

पिछले "Quote Carousel" पाठ में, हमने quote बदलने के लिए `Button` का उपयोग किया था।

लेकिन इस बार, हम "पूरे रंग वाले क्षेत्र पर टैप" करके रंग बदलना चाहते हैं, इसलिए `onTapGesture` अधिक उपयुक्त है।

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

जब हम रंग वाले व्यू पर टैप करते हैं, तो यह कोड चलेगा:

```swift
index += 1
```

इसका मतलब है `index` को `1` से बढ़ाना। index बढ़ने के बाद, `colors[index]` array का अगला रंग दिखाएगा।

### `onTapGesture`

`onTapGesture` एक gesture modifier है, जो किसी व्यू में टैप action जोड़ता है।

मूल उपयोग:

```swift
.onTapGesture {
    // code
}
```

उदाहरण:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

जब इस लाल व्यू पर टैप किया जाता है, तो braces के अंदर का कोड चलता है और console में यह output मिलता है:

```swift
Click color
```

`onTapGesture` के माध्यम से, हम तय कर सकते हैं कि किसी व्यू पर टैप होने के बाद क्या होना चाहिए।

### `Button` से अंतर

पहले हमने `Button` व्यू सीखा था। `Button` और `onTapGesture` दोनों ही टैप action संभाल सकते हैं, लेकिन उनके उपयोग के परिदृश्य पूरी तरह समान नहीं हैं।

`onTapGesture` "पहले से मौजूद किसी व्यू में टैप करने की क्षमता जोड़ने" के लिए अधिक उपयुक्त है, जैसे `Color`, `Image`, `Text` या कोई दूसरा सामान्य व्यू।

वहीं `Button` तब अधिक उपयुक्त है जब हम "Confirm", "Submit" या "Delete" जैसे किसी स्पष्ट बटन को व्यक्त करना चाहते हैं।

इस फिल लाइट ऐप में, हम चाहते हैं कि रंग बदलने का फ़ंक्शन अधिक सरल हो। पूरे रंग वाले क्षेत्र पर टैप करने से रंग बदल जाए, इसलिए यहाँ `onTapGesture` अच्छा विकल्प है।

## index की समस्या

अब हम स्क्रीन पर टैप करके अलग-अलग रंगों के बीच बदलाव कर सकते हैं।

लेकिन यहाँ एक महत्वपूर्ण समस्या है: **index array की सीमा से बाहर जा सकता है**।

उदाहरण:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

अगर हम स्क्रीन पर बार-बार टैप करते रहें, तो `index` अंत में `4` हो जाएगा, और तब "index out of range" error आएगा।

इसका कारण यह है कि `colors` array में `4` elements हैं, लेकिन index `0` से शुरू होता है, इसलिए मान्य index range `0 - 3` है, `4` नहीं।

अगर हम `colors[4]` को access करते हैं, तो "index out of range" error होगा।

वर्तमान कोड में, हर टैप पर `index` अपने आप `1` बढ़ जाता है। अगर हम इसे handle नहीं करेंगे, तो यह आखिर में सीमा से बाहर चला जाएगा।

इसलिए, स्क्रीन पर टैप करते समय हमें index को जाँचना होगा: अगर यह आखिरी रंग है, तो पहले रंग पर वापस जाएँ; नहीं तो `1` बढ़ाते रहें।

इसे हम `if` statement से कर सकते हैं:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

इस कोड में, `colors.count` का मतलब array में elements की संख्या है।

वर्तमान array में 4 रंग हैं, इसलिए:

```swift
colors.count // 4
```

लेकिन सबसे बड़ा index `4` नहीं, बल्कि `3` है, क्योंकि indexing `0` से शुरू होती है।

इसलिए आखिरी index इस तरह लिखा जाता है:

```swift
colors.count - 1
```

यानी:

```swift
4 - 1 = 3
```

इस logic का मतलब है: अगर वर्तमान index पहले से ही आखिरी रंग को दर्शाता है, तो index को `0` पर reset करो; नहीं तो इसे `1` से बढ़ाओ।

इस तरह, रंग चक्र में बदलते रहेंगे।

### index logic को और संक्षिप्त बनाना

अगर हम कोड को और छोटा बनाना चाहते हैं, तो ternary operator भी इस्तेमाल कर सकते हैं:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

इस कोड का मतलब है: अगर `index == colors.count - 1` सच है, तो `0` लौटाओ। नहीं तो `index + 1` लौटाओ।

अंत में, इस परिणाम को फिर से `index` को assign किया जाता है।

अब हम रंग बदलने वाला effect लागू कर सकते हैं।

पूरा कोड:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

अब हम स्क्रीन पर टैप करके अलग-अलग रंगों के बीच बदलाव कर सकते हैं। एक बुनियादी फिल लाइट ऐप तैयार हो गया है।

## रंग का नाम दिखाना

हम रंगों के अनुरूप एक और text group जोड़ सकते हैं, ताकि रंग बदलने पर स्क्रीन पर वर्तमान रंग का नाम भी दिखे।

उदाहरण के लिए:

- लाल होने पर `Red`
- नीला होने पर `Blue`
- पीला होने पर `Yellow`
- बैंगनी होने पर `Purple`

यहाँ भी हम रंगों के नाम सहेजने के लिए एक array का उपयोग कर सकते हैं:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

इस array में text का क्रम, रंगों की array के क्रम से बिल्कुल मेल खाना चाहिए।

फिर हम वर्तमान index के अनुसार रंग का नाम दिखाने के लिए `Text` का उपयोग कर सकते हैं:

```swift
Text(colorsName[index])
```

`Text` `index` के अनुसार वर्तमान रंग का नाम दिखाता है।

`Text` के रूप को बेहतर बनाने के लिए modifiers का उपयोग करें:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

इससे `Text` सफेद रंग में, बड़े शीर्षक आकार में और bold font weight के साथ दिखाई देगा।

अब हमारे पास full-screen `Color` व्यू है। अगर हम चाहते हैं कि `Text` `Color` व्यू के ऊपर दिखे, तो हमें दोनों को एक-दूसरे के ऊपर रखने के लिए `ZStack` layout container का उपयोग करना होगा।

```swift
ZStack {
    Color
    Text
}
```

इसलिए कोड इस तरह बन जाता है:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

इस तरह, पृष्ठभूमि में रंग वाला व्यू रहेगा और उसके ऊपर text व्यू superimpose होगा।

परिणाम:

![Color](../../Resource/018_color2.png)

एक बात ध्यान देने योग्य है कि `ZStack` में बाद में लिखा गया व्यू सामान्यतः सामने दिखाई देता है। अगर `Text` को `Color` से पहले लिखा जाए, तो बाद में लिखा गया `Color` व्यू `Text` को ढक सकता है।

## ब्राइटनेस नियंत्रित करना

अब हम अलग-अलग रंग बदल सकते हैं, लेकिन फिल लाइट की एक और महत्वपूर्ण विशेषता है: **ब्राइटनेस समायोजित करना**।

SwiftUI में, हम `brightness` modifier का उपयोग करके व्यू की ब्राइटनेस समायोजित कर सकते हैं।

उदाहरण:

```swift
.brightness(1)
```

हम इस तरह लिख सकते हैं:

```swift
colors[index]
    .brightness(0.5)
```

इससे वर्तमान रंग अधिक चमकीला हो जाता है और फिल लाइट के प्रभाव के अधिक करीब दिखता है।

ब्राइटनेस की range `0 - 1` है। `0` का मतलब मूल रंग को बनाए रखना है, और value जितनी `1` के करीब होगी, रंग उतना ही अधिक चमकीला होगा। `1` का मतलब सबसे चमकीला सफेद परिणाम है।

हालाँकि हम कोड में `brightness` नियंत्रित कर सकते हैं, उपयोगकर्ता अभी भी इसे सीधे खुद नियंत्रित नहीं कर सकता।

इसलिए हमें एक खींचा जा सकने वाला control जोड़ना होगा: `Slider`।

## `Slider` व्यू

SwiftUI में, `Slider` एक control है जिसका उपयोग किसी निश्चित range के भीतर value चुनने के लिए किया जाता है। Apple इसे "bounded linear range से value चुनने वाला control" बताता है।

मूल उपयोग:

```swift
Slider(value: $value, in: 0...1)
```

पैरामीटर की व्याख्या:

1. `value: $value`: `Slider` को एक variable से bind करना होता है।

    जब स्लाइडर खींचा जाता है, तो variable की value भी उसी समय बदलती है। और अगर variable बदलता है, तो slider भी update हो जाता है।

    यह पहले सीखे गए `TextField` के बहुत समान है। दोनों ही "control को variable से bind" करते हैं।

    bind किए गए variable के आगे binding दिखाने के लिए `$` चिह्न लगाना पड़ता है।

2. `in: 0...1`: यह parameter slider की value range को दर्शाता है।

    यहाँ `0...1` का मतलब है कि minimum value `0` है और maximum value `1` है।

    जब slider को पूरी तरह बाईं ओर खींचा जाता है, तो bound variable `0` के करीब होता है; जब इसे पूरी तरह दाईं ओर खींचा जाता है, तो यह `1` के करीब होता है।

उदाहरण:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` variable `value` से bind है। जब slider खींचा जाता है, तो `value` variable की value भी साथ में बदलती है।

दिखावट:

![Slider](../../Resource/018_slider.png)

जब `Slider` को बाईं ओर ले जाया जाता है, तो bound `value` `0` हो जाता है। जब इसे दाईं ओर ले जाया जाता है, तो यह `1` हो जाता है।

### value range

`Slider` की value range स्थिर नहीं होती। इसे इस तरह भी लिखा जा सकता है:

```swift
0...100
```

या किसी और range में।

लेकिन इस फिल लाइट ऐप में हमें ब्राइटनेस नियंत्रित करनी है, इसलिए `0...1` सबसे उपयुक्त है।

## `Slider` से ब्राइटनेस नियंत्रित करना

अब हमें `Slider` को `brightness` से जोड़ना है।

सबसे पहले, ब्राइटनेस की value सहेजने के लिए एक variable बनाएँ:

```swift
@State private var slider = 0.0
```

यहाँ `0.0` एक `Double` प्रकार की value है।

क्योंकि `Slider` सामान्यतः numeric type से bind होता है, और यहाँ हम चाहते हैं कि यह लगातार बदले, इसलिए `Double` अधिक उपयुक्त है। इसके अलावा `brightness` सिर्फ `Double` value ही स्वीकार करता है।

फिर इस value को `brightness` में पास करें:

```swift
colors[index]
    .brightness(slider)
```

जब `slider == 0` होता है, तो रंग अपनी default स्थिति में रहता है। `slider` जितना `1` के करीब होता है, रंग उतना अधिक चमकीला दिखता है।

### `Slider` control जोड़ना

इसके बाद, इस variable को बदलने के लिए एक `Slider` control जोड़ें:

```swift
Slider(value: $slider, in: 0...1)
```

जब slider बदलता है, तो `slider` की value भी बदलती है, और `brightness(slider)` उसी समय ब्राइटनेस update कर देता है।

यह SwiftUI में "variable व्यू को चलाता है" का एक बहुत ही सामान्य उदाहरण है।

### `Slider` की दिखावट समायोजित करना

डिफ़ॉल्ट रूप से, `Slider` उपलब्ध चौड़ाई का उपयोग करता है।

हम इसे एक निश्चित चौड़ाई दे सकते हैं:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

फिर इसे और स्पष्ट बनाने के लिए कुछ और modifiers जोड़ते हैं:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

इससे slider को सफेद background और गोल कोने मिलते हैं, जिससे यह `Color` व्यू पर अधिक स्पष्ट रूप से दिखाई देता है।

अंत में, इसे स्क्रीन के नीचे रखें।

क्योंकि हमने पहले ही `ZStack` का उपयोग किया है, इसलिए उसके भीतर `VStack` रखकर `Spacer()` से `Slider` को नीचे की ओर धकेल सकते हैं।

## पूरा कोड

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

परिणाम:

![Color](../../Resource/018_color.png)

## सारांश

पहले सीखे गए ज्ञान और रंगों तथा arrays जैसे बुनियादी concepts का उपयोग करके, हमने एक बहुत ही रोचक फिल लाइट ऐप बनाया।

इस फिल लाइट ऐप के माध्यम से, हमने `brightness` से ब्राइटनेस समायोजित करना, `onTapGesture` से व्यू में टैप actions जोड़ना, और `Slider` control का उपयोग करना सीखा।

हमने रंग बदलने के लिए `Color` व्यू में `onTapGesture` जोड़ा। हमने `brightness` को manage करने वाले variable को बदलने के लिए `Slider` control का भी उपयोग किया, जो "variable व्यू को चलाता है" का एक और उदाहरण है।

हमने ternary operator को भी दोहराया, व्यूज़ को एक-दूसरे के ऊपर रखने के लिए `ZStack` का उपयोग किया, और एक ही प्रकार के डेटा के समूह को manage करने के लिए arrays का उपयोग किया। इससे arrays और index के बारे में हमारी समझ गहरी होती है, खासकर out-of-range errors से बचने के व्यावहारिक पहलू में।

हालाँकि यह उदाहरण जटिल नहीं है, फिर भी यह उन कई बुनियादी विचारों को जोड़ता है जिन्हें हमने पहले सीखा है। जब इन्हें एक छोटे वास्तविक प्रोजेक्ट में जोड़ा जाता है, तो यह समझना आसान हो जाता है कि हर concept किस काम आता है।

### वास्तविक उपयोग का परिदृश्य

सोचिए, आप एक पुराना iPhone मेज़ पर रखें और अपने बनाए हुए फिल लाइट ऐप से रोशनी का रंग नियंत्रित करें। यह एक बहुत अच्छा अनुभव होगा।

App Store में बहुत सारे "फिल लाइट" ऐप्स हैं, और वे भी बहुत जटिल नहीं लगते।

![AppStore](../../Resource/018_appStore.PNG)

हम साधारण ऐप्स से विकास शुरू कर सकते हैं और उन्हें App Store पर प्रकाशित करने की कोशिश कर सकते हैं। इससे न केवल विकास के प्रति हमारी रुचि बढ़ती है, बल्कि यह हमारी प्रगति को भी दर्ज करता है।

### पाठ के बाद अभ्यास

आप इस फिल लाइट ऐप को और कैसे बढ़ाया जा सकता है, इस पर सोचना जारी रख सकते हैं, जैसे:

- और रंग जोड़ना
- वर्तमान ब्राइटनेस की value दिखाना
- नीचे वाले slider क्षेत्र के डिज़ाइन को बेहतर बनाना

जब आप वास्तव में इस ज्ञान का उपयोग करना शुरू करेंगे, तो आप पाएँगे कि हम जो भी concept सीखते हैं, वह वास्तव में ऐप बनाने का एक tool है।

हम जितने अधिक tools में निपुण होंगे, उतनी अधिक सुविधाएँ बना सकेंगे।
