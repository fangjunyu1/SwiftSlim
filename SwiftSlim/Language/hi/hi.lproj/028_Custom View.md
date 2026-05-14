# कस्टम View

इस पाठ में, हम SwiftUI की एक बहुत महत्वपूर्ण लिखने की शैली सीखेंगे: **कस्टम View**।

कस्टम View दोहराए जाने वाले View कोड के एक हिस्से को पैक कर सकता है और उसे ऐसे View में बदल सकता है जिसे बार-बार उपयोग किया जा सके।

वास्तविक App विकास में, हम अक्सर ऐसी स्थिति देखते हैं: कई इंटरफ़ेस की संरचना समान होती है, लेकिन दिखाया जाने वाला कंटेंट अलग होता है।

उदाहरण के लिए, किसी फ़ोरम वेबसाइट की पोस्ट सूची में, हर पोस्ट में शीर्षक, चित्र, लाइक की संख्या आदि जानकारी हो सकती है।

![Reddit](../../../Resource/028_view1.png)

किसी शॉपिंग वेबसाइट की उत्पाद सूची में, हर उत्पाद में चित्र, नाम और कीमत आदि जानकारी हो सकती है।

![Amazon](../../../Resource/028_view2.png)

इन कंटेंट की संरचना समान होती है; अंतर केवल दिखाए जाने वाले डेटा में होता है।

यदि हम हर आइटम का कोड हाथ से लिखें, तो कोड बहुत लंबा हो जाएगा, और बाद में संशोधन करना भी सुविधाजनक नहीं होगा।

इसलिए, हम समान संरचना को एक कस्टम View में पैक कर सकते हैं, और अलग-अलग कंटेंट को पैरामीटर के रूप में अंदर भेज सकते हैं।

इस तरह, वही View अलग-अलग कंटेंट दिखा सकता है।

## आवश्यकता का दृश्य

उदाहरण के लिए, अब हमें एक सेटिंग्स सूची बनानी है।

दिखाया गया परिणाम:

![view](../../../Resource/028_view.png)

इस सेटिंग्स सूची में तीन अलग-अलग सेटिंग आइटम हैं: `सेटिंग्स`, `फ़ोल्डर`, `संगीत`।

हालाँकि इनके आइकन, रंग और शीर्षक अलग हैं, लेकिन समग्र संरचना समान है:

- बाईं ओर आइकन
- आइकन का बैकग्राउंड रंग
- बीच में शीर्षक
- दाईं ओर तीर

यदि कस्टम View का उपयोग न करें, तो हम शायद इस तरह लिखेंगे:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("सेटिंग्स")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("फ़ोल्डर")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("संगीत")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

यह कोड सामान्य रूप से दिख सकता है, लेकिन समस्या भी बहुत स्पष्ट है: तीनों सेटिंग आइटम का कोड लगभग पूरी तरह समान है।

अलग केवल आइकन, रंग और शीर्षक हैं:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("सेटिंग्स")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("फ़ोल्डर")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("संगीत")
```

अर्थात, प्रत्येक सेटिंग आइटम की संरचना स्थिर है, केवल आइकन, रंग और शीर्षक अलग हैं।

ऐसी स्थिति कस्टम View का उपयोग करने के लिए बहुत उपयुक्त है।

### छाया shadow

यहाँ एक नया modifier `.shadow(radius:)` उपयोग किया गया है:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View में छाया जोड़ सकता है।

`radius` छाया के blur radius को दर्शाता है। मान जितना बड़ा होगा, आम तौर पर छाया का फैलाव क्षेत्र उतना बड़ा होगा, और वह अधिक मुलायम दिखाई देगी।

यहाँ इसे `1` पर सेट किया गया है, जिसका अर्थ है केवल बहुत हल्का छाया प्रभाव जोड़ना।

## सेटिंग आइटम View को पैक करना

आगे, हम प्रत्येक सेटिंग आइटम को एक नए View में पैक करेंगे।

हम `SettingItemView` बना सकते हैं:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

इस View में, हमने तीन properties परिभाषित की हैं:

```swift
let icon: String
let color: Color
let title: String
```

इनमें:

- `icon` आइकन के नाम को दर्शाता है
- `color` आइकन के बैकग्राउंड रंग को दर्शाता है
- `title` सेटिंग आइटम के शीर्षक को दर्शाता है

क्योंकि ये तीनों कंटेंट अलग-अलग सेटिंग आइटम में अलग होते हैं, इसलिए हम इन्हें बाहर से भेजे जा सकने वाले पैरामीटर बनाते हैं।

## कस्टम View का उपयोग करना

`SettingItemView` होने के बाद, हमें लंबे `HStack` कोड को बार-बार लिखने की आवश्यकता नहीं रहती।

अब इसे इस तरह उपयोग किया जा सकता है:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्स")
```

इस कोड लाइन का अर्थ है एक सेटिंग आइटम View बनाना और तीन पैरामीटर भेजना:

```swift
icon: "gear"
color: Color.blue
title: "सेटिंग्स"
```

भेजने के बाद, `SettingItemView` के अंदर की properties संबंधित मान प्राप्त करेंगी:

- `icon` का मान `gear` है
- `color` का मान `Color.blue` है
- `title` का मान `"सेटिंग्स"` है

इसलिए, View के अंदर `Image(systemName: icon)` गियर आइकन दिखाएगा, `.background(color)` नीला बैकग्राउंड उपयोग करेगा, और `Text(title)` `सेटिंग्स` दिखाएगा।

पूरा कोड:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्स")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "फ़ोल्डर")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "संगीत")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

दिखाया गया परिणाम:

![view](../../../Resource/028_view.png)

देखा जा सकता है कि पैक करने के बाद दिखने वाला परिणाम पहले जैसा ही है, लेकिन कोड अधिक स्पष्ट हो गया है।

पहले प्रत्येक सेटिंग आइटम के लिए पूरा `HStack` भाग लिखना पड़ता था, अब केवल एक कोड लाइन पर्याप्त है:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्स")
```

यही कस्टम View की भूमिका है: **दोहराई जाने वाली View संरचना को पैक करना, और केवल अलग कंटेंट को पैरामीटर के रूप में भेजना।**

## पैरामीटर क्यों भेजे जा सकते हैं

आगे, हम सरल रूप से समझते हैं कि कस्टम View पैरामीटर क्यों प्राप्त कर सकता है।

SwiftUI में, View मूल रूप से एक structure होता है।

उदाहरण के लिए:

```swift
struct ContentView: View {
    var body: some View {
        Text("नमस्ते, दुनिया!")
    }
}
```

यहाँ `ContentView` एक structure है।

जब हम लिखते हैं:

```swift
ContentView()
```

वास्तव में हम एक `ContentView` View बना रहे होते हैं।

पीछे का `()` उसके initialization method को call करने को दर्शाता है; इसे इस View को बनाना भी समझा जा सकता है।

क्योंकि इस `ContentView` में बाहर से भेजने वाली कोई property नहीं है, इसलिए सीधे इस तरह लिखा जा सकता है:

```swift
ContentView()
```

लेकिन यदि View के अंदर कोई ऐसी property है जिसे मान नहीं दिया गया है, तो View बनाते समय संबंधित मान भेजना होगा।

उदाहरण के लिए:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("नाम: \(name)")
    }
}
```

यहाँ `name` एक property है, और इसका default value नहीं है।

इसलिए `ContentView` बनाते समय, `name` के लिए एक निश्चित मान देना आवश्यक है:

```swift
ContentView(name: "Fang Junyu")
```

इस तरह, View के अंदर यह मान उपयोग किया जा सकता है:

```swift
Text("नाम: \(name)")
```

यही कारण है कि `SettingItemView` बनाते समय हमें पैरामीटर भेजने होते हैं:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्स")
```

क्योंकि `SettingItemView` में default value के बिना तीन properties हैं:

```swift
let icon: String
let color: Color
let title: String
```

इसलिए इस View को बनाते समय, इन्हें अंदर भेजना पड़ता है। भेजे गए पैरामीटर Swift द्वारा View के अंदर की properties को मान देने के लिए उपयोग किए जाते हैं।

## Initialization method

आगे, हम initialization method को थोड़ा और गहराई से समझते हैं।

### Default initialization method

जब हम एक सामान्य View परिभाषित करते हैं:

```swift
struct ContentView: View {
    var body: some View {
        Text("नमस्ते, दुनिया!")
    }
}
```

इस कोड में, हमने initialization method हाथ से नहीं लिखा है।

लेकिन जब हम इस View का उपयोग करते हैं, तो इस तरह लिख सकते हैं:

```swift
ContentView()
```

यहाँ `()` वास्तव में `ContentView` बनाने को दर्शाता है; इसे उसके initialization method को call करना भी समझा जा सकता है।

### initialization method दिखाई न देने पर भी इसे call क्यों किया जा सकता है?

क्योंकि Swift compiler हमारे लिए अपने आप एक initialization method बनाता है।

ध्यान देने योग्य बात है: **यह initialization method अपने आप बनता है, और आम तौर पर हम इसे कोड में सीधे नहीं देखते।**

अर्थात, भले ही हमने `struct` में हाथ से यह नहीं लिखा:

```swift
init() {

}
```

Swift compiler पीछे हमारे लिए लगभग ऐसा initialization method बनाएगा:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("नमस्ते, दुनिया!")
    }
}
```

इसीलिए हम सीधे इस तरह लिख सकते हैं:

```swift
ContentView()
```

इसलिए वास्तविक कोड में, आम तौर पर हमें initialization method को हाथ से लिखने की आवश्यकता नहीं होती।

केवल एक बात समझना पर्याप्त है: **SwiftUI View बनाते समय, उस View का initialization method call होता है। भले ही हमने initialization method हाथ से न लिखा हो, Swift उसे अपने आप बना सकता है।**

### पैरामीटर वाला initialization method

यदि View में default value के बिना कोई property है, उदाहरण के लिए:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("नाम: \(name)")
    }
}
```

Swift compiler property के आधार पर अपने आप पैरामीटर वाला initialization method बनाएगा।

इसे सरल रूप से इस तरह समझा जा सकता है:

```swift
init(name: String) {
    self.name = name
}
```

यहाँ:

```swift
init(name: String)
```

का अर्थ है कि `ContentView` बनाते समय `String` प्रकार का `name` पैरामीटर भेजना होगा।

जब हम लिखते हैं:

```swift
ContentView(name: "Fang Junyu")
```

इसका अर्थ है: `"Fang Junyu"` को initialization method में पैरामीटर के रूप में भेजना।

फिर initialization method के अंदर यह चलेगा:

```swift
self.name = name
```

इस कोड लाइन का अर्थ है: बाहर से भेजे गए `name` को वर्तमान View की अपनी `name` property को देना।

इसे सरल रूप से इस तरह समझा जा सकता है:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("नाम: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

इस तरह, View के अंदर भेजा गया मान उपयोग किया जा सकता है।

यही पैरामीटर वाले View की initialization प्रक्रिया है: **जब View के अंदर की property का default value नहीं होता, तो View बनाते समय संबंधित पैरामीटर भेजना आवश्यक होता है, ताकि initialization method property को मान देने का काम पूरा कर सके।**

## जब property का default value हो

यदि property का पहले से default value है, तो View बनाते समय पैरामीटर न भी भेजा जाए तो चल सकता है।

उदाहरण के लिए:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("नाम: \(name)")
    }
}
```

यहाँ `name` का पहले से default value है:

```swift
"Fang Junyu"
```

इसलिए `ContentView` बनाते समय सीधे इस तरह लिखा जा सकता है:

```swift
ContentView()
```

इस समय, `name` default value का उपयोग करेगा, और इंटरफ़ेस दिखाएगा:

```swift
नाम: Fang Junyu
```

बेशक, View बनाते समय नया मान भी भेजा जा सकता है:

```swift
ContentView(name: "Sam")
```

इस समय, View बाहर से भेजे गए `"Sam"` का उपयोग करेगा, default value का नहीं, और इंटरफ़ेस दिखाएगा:

```swift
नाम: Sam
```

समझने में आसानी के लिए, Swift compiler द्वारा अपने आप बनाए जाने वाले initialization method को सरल रूप से इस तरह देखा जा सकता है:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

यहाँ `name: String = "Fang Junyu"` का अर्थ है: यदि View बनाते समय `name` नहीं भेजा गया, तो default value `"Fang Junyu"` उपयोग करो; यदि View बनाते समय नया `name` भेजा गया, तो भेजे गए मान का उपयोग करो।

अर्थात: **यदि बाहर से पैरामीटर नहीं भेजा गया, तो property का default value उपयोग होता है; यदि बाहर से पैरामीटर भेजा गया, तो भेजा गया मान उपयोग होता है।**

## वापस SettingItemView पर

अब हम वापस SettingItemView को देखते हैं:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

इस View की संरचना स्थिर है।

स्थिर भागों में शामिल हैं:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

अलग भागों में शामिल हैं:

```swift
icon
color
title
```

इसलिए, हम अलग कंटेंट को properties बनाते हैं, और View बनाते समय उन्हें पैरामीटर के रूप में भेजते हैं।

जब हम अलग-अलग सेटिंग आइटम बनाते हैं, तो केवल अलग-अलग पैरामीटर भेजने होते हैं:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्स")
SettingItemView(icon: "folder", color: Color.brown, title: "फ़ोल्डर")
SettingItemView(icon: "music.note", color: Color.purple, title: "संगीत")
```

इस तरह, वही `SettingItemView` तीन अलग-अलग सेटिंग आइटम दिखा सकता है।

यह कस्टम View का सबसे सामान्य उपयोग तरीका है।

## सारांश

इस पाठ में, हमने कस्टम View सीखा।

कस्टम View की मुख्य भूमिका है: **दोहराए जाने वाले View कोड को पैक करना, ताकि उसे फिर से उपयोग किया जा सके।**

इस उदाहरण में, तीनों सेटिंग आइटम की संरचना समान है, केवल आइकन, रंग और शीर्षक अलग हैं।

इसलिए हमने `SettingItemView` बनाया:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

फिर, इस View का उपयोग करते समय अलग-अलग पैरामीटर भेजते हैं:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्स")
```

यहाँ के पैरामीटर `SettingItemView` के अंदर जाते हैं।

इस तरीके से, हम कम कोड का उपयोग करके समान संरचना लेकिन अलग कंटेंट वाले Views बना सकते हैं।

यह SwiftUI विकास में भी बहुत सामान्य लिखने का तरीका है।
