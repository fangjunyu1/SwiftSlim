# सानुकूल View

या धड्यात, आपण SwiftUI लिहिण्याची एक अतिशय महत्त्वाची पद्धत शिकणार आहोत: **सानुकूल View**.

सानुकूल View पुनरावृत्ती होणाऱ्या View कोडचा एक भाग आवरून ठेवू शकतो आणि त्याला वारंवार वापरता येणाऱ्या View मध्ये बदलू शकतो.

प्रत्यक्ष App विकासात, आपण अनेकदा अशी परिस्थिती पाहतो: अनेक इंटरफेसची रचना सारखी असते, फक्त दाखवली जाणारी सामग्री वेगळी असते.

उदाहरणार्थ, फोरम वेबसाइटवरील पोस्ट यादीत, प्रत्येक पोस्टमध्ये शीर्षक, प्रतिमा, लाईकची संख्या इत्यादी माहिती असू शकते.

![Reddit](../../../Resource/028_view1.png)

शॉपिंग वेबसाइटवरील उत्पादन यादीत, प्रत्येक उत्पादनामध्ये प्रतिमा, नाव आणि किंमत इत्यादी माहिती असू शकते.

![Amazon](../../../Resource/028_view2.png)

या सामग्रीची रचना साधारण सारखी असते; फरक फक्त दाखवल्या जाणाऱ्या डेटामध्ये असतो.

जर प्रत्येक आयटमसाठी कोड हाताने लिहिला, तर कोड खूप लांब होईल आणि पुढे बदल करणेही सोयीचे राहणार नाही.

म्हणून, आपण समान रचना एका सानुकूल View मध्ये आवरून ठेवू शकतो आणि वेगवेगळी सामग्री parameter म्हणून आत पाठवू शकतो.

अशा प्रकारे, तोच View वेगवेगळी सामग्री दाखवू शकतो.

## आवश्यकता परिदृश्य

उदाहरणार्थ, आता आपल्याला एक सेटिंग्ज यादी तयार करायची आहे.

दिसणारा परिणाम:

![view](../../../Resource/028_view.png)

या सेटिंग्ज यादीत तीन वेगवेगळे सेटिंग्ज आयटम आहेत: `सेटिंग्ज`, `फोल्डर`, `संगीत`.

त्यांचे आयकन, रंग आणि शीर्षके वेगवेगळी असली तरी एकूण रचना सारखी आहे:

- डावीकडील आयकन
- आयकनचा पार्श्वभूमी रंग
- मधले शीर्षक
- उजवीकडील बाण

जर सानुकूल View वापरला नाही, तर आपण कदाचित असे लिहू:

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

                Text("सेटिंग्ज")
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

                Text("फोल्डर")
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

हा कोड सामान्यपणे दिसू शकतो, पण समस्या देखील स्पष्ट आहे: तीन सेटिंग्ज आयटमचा कोड जवळजवळ पूर्णपणे सारखा आहे.

वेगळे असलेले भाग फक्त आयकन, रंग आणि शीर्षक आहेत:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("सेटिंग्ज")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("फोल्डर")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("संगीत")
```

म्हणजेच, प्रत्येक सेटिंग्ज आयटमची रचना निश्चित आहे, फक्त आयकन, रंग आणि शीर्षक वेगळे आहेत.

अशी परिस्थिती सानुकूल View वापरण्यासाठी अतिशय योग्य आहे.

### सावली shadow

येथे आपण नवीन modifier `.shadow(radius:)` वापरतो:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View ला सावली जोडू शकतो.

`radius` सावलीचा blur radius दर्शवतो. मूल्य जितके मोठे असेल, सावलीचा पसरणारा भाग सामान्यतः तितका मोठा होतो आणि ती अधिक मऊ दिसते.

येथे तो `1` ठेवला आहे, म्हणजे फक्त अतिशय हलका सावली प्रभाव जोडला आहे.

## सेटिंग्ज आयटम View आवरणे

पुढे, आपण प्रत्येक सेटिंग्ज आयटमला नवीन View मध्ये आवरू.

आपण `SettingItemView` तयार करू शकतो:

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

या View मध्ये, आपण तीन properties परिभाषित केल्या आहेत:

```swift
let icon: String
let color: Color
let title: String
```

त्यापैकी:

- `icon` आयकनचे नाव दर्शवतो
- `color` आयकनचा पार्श्वभूमी रंग दर्शवतो
- `title` सेटिंग्ज आयटमचे शीर्षक दर्शवतो

कारण ही तीन माहिती वेगवेगळ्या सेटिंग्ज आयटममध्ये वेगळी असते, म्हणून आपण ती बाहेरून पाठवता येणारी parameters बनवतो.

## सानुकूल View वापरणे

`SettingItemView` तयार झाल्यावर, आपल्याला मोठा `HStack` कोड पुन्हा पुन्हा लिहिण्याची गरज राहत नाही.

आता आपण असे वापरू शकतो:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्ज")
```

ही कोड ओळ एक सेटिंग्ज आयटम View तयार करते आणि तीन parameters पाठवते:

```swift
icon: "gear"
color: Color.blue
title: "सेटिंग्ज"
```

पाठवल्यानंतर, `SettingItemView` मधील properties संबंधित मूल्ये प्राप्त करतील:

- `icon` चे मूल्य `gear` आहे
- `color` चे मूल्य `Color.blue` आहे
- `title` चे मूल्य `"सेटिंग्ज"` आहे

म्हणून, View मधील `Image(systemName: icon)` गिअर आयकन दाखवेल, `.background(color)` निळी पार्श्वभूमी वापरेल, आणि `Text(title)` `सेटिंग्ज` दाखवेल.

पूर्ण कोड:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्ज")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "फोल्डर")

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

दिसणारा परिणाम:

![view](../../../Resource/028_view.png)

आपण पाहू शकतो की आवरल्यावर दिसणारा परिणाम पूर्वीसारखाच आहे, पण कोड अधिक स्पष्ट झाला आहे.

पूर्वी प्रत्येक सेटिंग्ज आयटमसाठी संपूर्ण `HStack` भाग लिहावा लागत होता, आता फक्त एक ओळ कोड पुरेशी आहे:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्ज")
```

हेच सानुकूल View चे काम आहे: **पुनरावृत्ती होणारी View रचना आवरून ठेवणे आणि फक्त वेगळी सामग्री parameters म्हणून पाठवणे.**

## parameters का पाठवता येतात

पुढे, सानुकूल View parameters का घेऊ शकतो हे आपण सोप्या पद्धतीने समजून घेऊ.

SwiftUI मध्ये, View मुळात एक structure असतो.

उदाहरणार्थ:

```swift
struct ContentView: View {
    var body: some View {
        Text("नमस्कार, जग!")
    }
}
```

येथे `ContentView` एक structure आहे.

जेव्हा आपण लिहितो:

```swift
ContentView()
```

तेव्हा प्रत्यक्षात आपण एक `ContentView` View तयार करत असतो.

शेवटचे `()` त्याची initialization method call केली जात आहे हे दर्शवते; हे हा View तयार करणे असेही समजू शकतो.

कारण या `ContentView` मध्ये बाहेरून पाठवायच्या properties नाहीत, म्हणून थेट असे लिहू शकतो:

```swift
ContentView()
```

पण जर View मध्ये मूल्य न दिलेली property असेल, तर View तयार करताना संबंधित मूल्य पाठवावे लागते.

उदाहरणार्थ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("नाव: \(name)")
    }
}
```

येथे `name` एक property आहे आणि त्याचे default value नाही.

म्हणून `ContentView` तयार करताना, `name` ला ठोस मूल्य देणे आवश्यक आहे:

```swift
ContentView(name: "Fang Junyu")
```

असे केल्यावर, View आत हे मूल्य वापरू शकतो:

```swift
Text("नाव: \(name)")
```

हेच `SettingItemView` तयार करताना parameters पाठवण्याचे कारण आहे:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्ज")
```

कारण `SettingItemView` मध्ये default value नसलेल्या तीन properties आहेत:

```swift
let icon: String
let color: Color
let title: String
```

म्हणून हा View तयार करताना त्या आत पाठवाव्या लागतात. पाठवलेले parameters Swift कडून View मधील properties ला मूल्य देण्यासाठी वापरले जातात.

## Initialization method

पुढे, आपण initialization method अधिक खोलात समजून घेऊ.

### Default initialization method

जेव्हा आपण एक सामान्य View परिभाषित करतो:

```swift
struct ContentView: View {
    var body: some View {
        Text("नमस्कार, जग!")
    }
}
```

या कोडमध्ये, आपण initialization method हाताने लिहिलेली नाही.

पण जेव्हा आपण हा View वापरतो, तेव्हा असे लिहू शकतो:

```swift
ContentView()
```

येथे `()` प्रत्यक्षात `ContentView` तयार करणे दर्शवते; हे त्याची initialization method call करणे असेही समजू शकतो.

### initialization method दिसत नसतानाही ती का call करता येते?

कारण Swift compiler आपल्यासाठी आपोआप एक initialization method तयार करतो.

हे लक्षात ठेवावे: **ही initialization method आपोआप तयार होते, आणि आपण ती सहसा कोडमध्ये थेट पाहत नाही.**

म्हणजेच, आपण `struct` मध्ये हाताने असे लिहिले नसले तरी:

```swift
init() {

}
```

Swift compiler मागे आपल्यासाठी साधारण अशी initialization method तयार करतो:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("नमस्कार, जग!")
    }
}
```

म्हणूनच आपण थेट असे लिहू शकतो:

```swift
ContentView()
```

म्हणून प्रत्यक्ष कोडमध्ये, आपण सहसा initialization method हाताने लिहिण्याची गरज नसते.

फक्त एक गोष्ट समजून घेणे आवश्यक आहे: **SwiftUI View तयार करताना, त्या View ची initialization method call होते. आपण initialization method हाताने लिहिली नसली तरी Swift ती आपोआप तयार करू शकतो.**

### parameters असलेली initialization method

जर View मध्ये default value नसलेली property असेल, उदाहरणार्थ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("नाव: \(name)")
    }
}
```

Swift compiler property नुसार आपोआप parameter असलेली initialization method तयार करतो.

सोप्या पद्धतीने हे असे समजू शकतो:

```swift
init(name: String) {
    self.name = name
}
```

येथे:

```swift
init(name: String)
```

याचा अर्थ `ContentView` तयार करताना `String` प्रकारचा `name` parameter पाठवावा लागतो.

जेव्हा आपण लिहितो:

```swift
ContentView(name: "Fang Junyu")
```

त्याचा अर्थ: `"Fang Junyu"` हे initialization method ला parameter म्हणून पाठवणे.

नंतर initialization method आत हे चालते:

```swift
self.name = name
```

या कोड ओळीचा अर्थ: बाहेरून आलेले `name` सध्याच्या View च्या स्वतःच्या `name` property ला देणे.

सोप्या पद्धतीने हे असे समजू शकतो:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("नाव: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

अशा प्रकारे, View आत पाठवलेले मूल्य वापरू शकतो.

हेच parameters असलेल्या View चे initialization flow आहे: **View मधील property ला default value नसल्यास, View तयार करताना संबंधित parameter पाठवावा लागतो, ज्यामुळे initialization method property ला मूल्य देण्याचे काम पूर्ण करते.**

## property ला default value असल्याची परिस्थिती

जर property ला आधीच default value असेल, तर View तयार करताना parameter न पाठवले तरी चालते.

उदाहरणार्थ:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("नाव: \(name)")
    }
}
```

येथे `name` ला आधीच default value आहे:

```swift
"Fang Junyu"
```

म्हणून `ContentView` तयार करताना थेट असे लिहू शकतो:

```swift
ContentView()
```

या वेळी, `name` default value वापरेल, आणि इंटरफेस दाखवेल:

```swift
नाव: Fang Junyu
```

अर्थात, View तयार करताना नवीन मूल्यही पाठवू शकतो:

```swift
ContentView(name: "Sam")
```

या वेळी, View बाहेरून पाठवलेले `"Sam"` वापरेल, default value नाही, आणि इंटरफेस दाखवेल:

```swift
नाव: Sam
```

समजण्यासाठी सोपे व्हावे म्हणून, Swift compiler आपोआप तयार करत असलेली initialization method साधारण अशी आहे असे मानू शकतो:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

येथे `name: String = "Fang Junyu"` याचा अर्थ: View तयार करताना `name` पाठवले नाही तर default value `"Fang Junyu"` वापरा; View तयार करताना नवीन `name` पाठवले तर पाठवलेले मूल्य वापरा.

म्हणजेच: **बाहेरून parameter न पाठवल्यास property चे default value वापरले जाते; बाहेरून parameter पाठवल्यास पाठवलेले मूल्य वापरले जाते.**

## पुन्हा SettingItemView कडे

आता आपण पुन्हा SettingItemView पाहू:

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

या View ची रचना निश्चित आहे.

निश्चित भागांमध्ये हे समाविष्ट आहे:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

वेगळ्या भागांमध्ये हे समाविष्ट आहे:

```swift
icon
color
title
```

म्हणून, आपण वेगळी सामग्री properties बनवतो आणि View तयार करताना parameters म्हणून पाठवतो.

जेव्हा आपण वेगवेगळे सेटिंग्ज आयटम तयार करतो, तेव्हा फक्त वेगवेगळे parameters पाठवावे लागतात:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्ज")
SettingItemView(icon: "folder", color: Color.brown, title: "फोल्डर")
SettingItemView(icon: "music.note", color: Color.purple, title: "संगीत")
```

अशा प्रकारे, तोच `SettingItemView` तीन वेगवेगळे सेटिंग्ज आयटम दाखवू शकतो.

ही सानुकूल View वापरण्याची सर्वात सामान्य पद्धत आहे.

## सारांश

या धड्यात, आपण सानुकूल View शिकला.

सानुकूल View चे मुख्य काम आहे: **पुनरावृत्ती होणारा View कोड आवरून ठेवणे, जेणेकरून तो पुन्हा वापरता येईल.**

या उदाहरणात, तीन सेटिंग्ज आयटमची रचना सारखी आहे, फक्त आयकन, रंग आणि शीर्षक वेगळे आहेत.

म्हणून आपण `SettingItemView` तयार केला:

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

नंतर, हा View वापरताना वेगवेगळे parameters पाठवतो:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "सेटिंग्ज")
```

येथील parameters `SettingItemView` च्या आत जातात.

या पद्धतीने, आपण कमी कोड वापरून सारखी रचना पण वेगळी सामग्री असलेले Views तयार करू शकतो.

ही SwiftUI विकासात अतिशय सामान्य लेखन पद्धत आहे.
