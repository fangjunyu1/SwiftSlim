# वैयक्तिक रेझ्युमे पृष्ठ तयार करणे

या धड्यात आपण एक साधे वैयक्तिक रेझ्युमे दृश्य तयार करू आणि पुढील गोष्टी शिकू:

- cornerRadius
- spacing
- ScrollView

तयारीच्या प्रक्रियेत आपण layout, Text आणि Image यांसारख्या ज्ञानाचा पुनराभ्यास करू, तसेच spacing नियंत्रण आणि सामग्री scroll करण्याचा परिणाम साध्य करू.

## वैयक्तिक रेझ्युमे

लक्ष्य परिणाम:

![Swift](../../RESOURCE/004_img.png)

**कृपया आधी स्वतः प्रयत्न करून पूर्ण करा, त्यानंतर खालील स्पष्टीकरण वाचा.**

### प्रकल्प तयार करणे

नवीन iOS प्रकल्प तयार करा किंवा मागील प्रकल्पच वापरणे सुरू ठेवा.

डीफॉल्ट `ContentView` कोड:

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

आता कोड रिकामा करा आणि स्वतःची सामग्री लिहायला सुरुवात करा:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### एकूण रचना

प्रत्यक्ष विकासात आपण सहसा आधी संपूर्ण रचना डिझाइन करतो.

आपल्या पृष्ठामध्ये पुढील भाग असतील:

1. शीर्षक
2. वैयक्तिक माहिती
3. वैयक्तिक परिचय

सर्वात बाहेर आपण एक `VStack` जोडू:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` मुळे दृश्ये उभी रचली जातात आणि त्यांची मांडणी व अंतर नियंत्रित करता येते.

### शीर्षक

सर्वप्रथम, शीर्षक दाखवण्यासाठी आपण एक `Text` तयार करू.

येथे मी शीर्षक म्हणून माझे इंग्रजी नाव दाखवतो:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

शीर्षक सामान्यतः मोठे आणि जाड अक्षरात असते, म्हणून येथे `font` आणि `fontWeight` modifiers वापरू:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### मांडणी

SwiftUI मधील डीफॉल्ट alignment `center` असतो, त्यामुळे सध्या शीर्षक `ContentView` च्या मध्यभागी दिसते.

![Swift](../../RESOURCE/004_img3.png)

आपल्याला शीर्षक दृश्याच्या वरच्या भागात दाखवायचे असल्यास, layout समायोजित करण्यासाठी `Spacer` वापरू शकतो:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` उरलेली जागा व्यापतो आणि `Text` ला container च्या वर ढकलतो.

![Swift](../../RESOURCE/004_img4.png)

### मोकळी जागा

जर मजकूर वरच्या भागाच्या खूप जवळ वाटत असेल, तर `padding` किंवा `Spacer` वापरू शकतो.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

हे `VStack` च्या वरच्या बाजूचा `padding` 20 वर सेट करते.

**2. Spacer**

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

तुम्ही `Spacer` वापरून `frame` ची उंची सेट केली, तर ठराविक उंचीची मोकळी जागा मिळते.

अंतिम परिणाम:

![Swift](../../RESOURCE/004_img5.png)

### प्रतिमा

आपण आपला एक फोटो तयार करून `Assets` resource फोल्डरमध्ये ठेवतो.

![Swift](../../RESOURCE/004_img6.png)

`ContentView` मध्ये प्रतिमा दाखवण्यासाठी `Image` वापरू:

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

प्रतिमेचा मूळ आकार मोठा असल्यामुळे, दाखवण्याचा आकार नियंत्रित करण्यासाठी `frame` वापरावा लागेल.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

आता आपल्याला एक समस्या दिसेल:

जर `frame` ची रुंदी-उंची गुणोत्तर प्रतिमेच्या मूळ गुणोत्तराशी जुळत नसेल, तर प्रतिमा विकृत होईल.

उदाहरणार्थ:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

प्रतिमा विकृत होऊ नये म्हणून, `scaledToFit` वापरणे आवश्यक आहे:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` चे काम असे आहे:

दिलेल्या `frame` च्या मर्यादेत, प्रतिमेचे मूळ गुणोत्तर राखून तिला resize करणे आणि पूर्ण प्रतिमा दाखवणे.

ते पूर्ण `frame` भरून काढण्यासाठी प्रतिमेला जबरदस्तीने stretch करत नाही, तर रुंदी-उंची गुणोत्तर कायम ठेवून proportional scaling करते, जोपर्यंत एखादी बाजू सीमेला जुळत नाही.

याचा अर्थ:

- जर `frame` ची रुंदी कमी असेल, तर प्रतिमा रुंदीच्या आधारे scale होईल.
- जर `frame` ची उंची कमी असेल, तर प्रतिमा उंचीच्या आधारे scale होईल.
- प्रतिमा नेहमी मूळ गुणोत्तर राखते आणि विकृत होत नाही.

साधारणपणे तुम्ही एका दिशेचा आकार सेट केला तरी पुरेसे असते. उदाहरणार्थ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

अशावेळी system रुंदी 140 नुसार योग्य उंची आपोआप मोजतो आणि प्रतिमेचे गुणोत्तर कायम ठेवतो.

जर निश्चित visual ratio हवा असेल किंवा गुंतागुंतीच्या layout मध्ये प्रतिमा compress होऊ नये असे वाटत असेल, तर रुंदी आणि उंची दोन्ही constrain करू शकता.

### गोल कोपरे

जर प्रतिमा rounded corners सह दाखवायची असेल, तर `cornerRadius` modifier वापरू शकतो:

```swift
.cornerRadius(10)
```

उदाहरणार्थ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

`Image` च्या modifiers नंतर `cornerRadius(20)` जोडा.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` म्हणजे दृश्याच्या कडा clip करून 20 radius चे rounded corners लागू करणे.

गोल कोपरे जोडल्यावर प्रतिमेचे चारही कोपरे arc सारखे दिसतात, त्यामुळे visual effect अधिक मऊ आणि आधुनिक वाटतो.

अशा प्रकारची design शैली आजच्या UI design मध्ये खूप सामान्य आहे. उदाहरणार्थ, iOS च्या app icons मध्ये rounded rectangle चा आकार वापरला जातो (तरी system icons मध्ये साध्या rounded corners ऐवजी continuous curvature असलेला superellipse वापरला जातो).

### वैयक्तिक माहिती

आता प्रतिमेच्या डाव्या बाजूची वैयक्तिक माहितीची जागा तयार करूया. इंटरफेसच्या रचनेतून दिसते की वैयक्तिक माहिती आणि प्रतिमा आडव्या रचनेत आहेत, त्यामुळे `HStack` वापरून क्रम लावावा लागेल.

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

वैयक्तिक माहितीतील सामग्री उभी रचलेली आहे.

![Swift](../../RESOURCE/004_img11.png)

म्हणून बाहेर `HStack`, वैयक्तिक माहितीकरिता `VStack`, आणि मजकुरासाठी `Text` वापरू.

मूलभूत रचना:

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

**फील्ड शीर्षक जाड करणे**

field name आणि field value वेगळे दिसावेत म्हणून, field name वर `fontWeight` वापरू शकतो:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**मजकूर डावीकडे align करणे**

`VStack` डीफॉल्टने center aligned असतो. सर्व मजकूर डावीकडे align करायचा असल्यास, alignment सेट करावा लागतो:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` म्हणजे डावीकडील alignment (left-to-right language environment मध्ये).

![Swift](../../RESOURCE/004_img14.png)

### अंतर

जर वैयक्तिक माहिती आणि प्रतिमा यांच्यात निश्चित अंतर ठेवायचे असेल, तर आपण आधी `Spacer` वापरून मोकळी जागा ठेवणे शिकलो होतो:

```swift
Spacer()
    .frame(width: 10)
```

तसेच `HStack` चा `spacing` parameter देखील वापरू शकतो:

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

`spacing: 30` म्हणजे दोन child views मधील अंतर 30 pt आहे.

![Swift](../../RESOURCE/004_img15.png)

**spacing म्हणजे काय?**

`VStack`, `HStack`, `ZStack` मध्ये `spacing` child views मधील अंतर नियंत्रित करते.

उदाहरणार्थ:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

`VStack` मधील child views मधील अंतर 10pt वर सेट होईल.

![Swift](../../RESOURCE/004_img16.png)

लक्षात ठेवा, `spacing` फक्त "थेट child views" वर लागू होते; nested container च्या आतल्या layout वर त्याचा परिणाम होत नाही.

**यादीच्या आतले अंतर नियंत्रित करणे**

जर field groups मधील अंतर वाढवायचे असेल, तर सर्वात सोपा मार्ग म्हणजे `VStack` वर `spacing` सेट करणे:

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

यामुळे सर्व child views मधील अंतर 10 pt होईल.

पण interface पाहिल्यावर एक समस्या दिसते:

field groups मध्ये अंतर आहे, पण field name आणि field value यांच्यामध्येही तेच अंतर निर्माण झाले आहे.

कारण `spacing` हा सध्याच्या container मधील सर्व direct child views वर लागू होतो.

या रचनेत प्रत्येक `Text` हा बाहेरील `VStack` चा direct child view आहे, त्यामुळे अंतर समान ठेवले जाते.

जर field groups मध्ये अंतर हवे, पण field name आणि field value यांच्यात डीफॉल्ट compact spacing ठेवायचे असेल, तर "field name + field value" हा एक logical group मानून त्याभोवती `VStack` wrap करू शकतो:

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

आता रचना अशी होते की बाहेरील `VStack` groups मधील अंतर नियंत्रित करतो, तर आतील `VStack` मध्ये डीफॉल्ट compact spacing राहते. त्यामुळे field name आणि field value यांच्यात अतिरिक्त मोकळी जागा दिसत नाही.

![Swift](../../RESOURCE/004_img18.png)

### वैयक्तिक परिचय

आता वैयक्तिक परिचयाचा विभाग तयार करूया.

इंटरफेसच्या रचनेवरून दिसते की परिचयाची सामग्री अनेक ओळींच्या मजकुराची आहे आणि तो मजकूर उभा मांडलेला आहे.

![Swift](../../RESOURCE/004_img19.png)

म्हणून `VStack` आणि `Text` वापरू शकतो:

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

**अंतर वाढवणे**

आता वैयक्तिक माहिती आणि वैयक्तिक परिचय हे भाग खूपच जवळजवळ दिसतात, त्यामुळे शैली फार सुंदर वाटत नाही.

![Swift](../../RESOURCE/004_img20.png)

कारण हे दोन्ही भाग एकाच बाह्य container मध्ये आहेत, म्हणून बाह्य container वर संपूर्ण spacing नियंत्रित करू शकतो:

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

**यादीतील अंतर**

वैयक्तिक परिचयातील मजकूर ओळींमधील अंतर सेट करण्यासाठी `spacing` वापरा:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### वैयक्तिक रेझ्युमे पूर्ण करणे

आता आपल्या वैयक्तिक रेझ्युमेची मूलभूत चौकट पूर्ण झाली आहे.

![Swift](../../RESOURCE/004_img.png)

### Scroll view

आता पृष्ठाची रचना `VStack` वापरून केली आहे. परिचयातील मजकूर कमी असेल, तर काही समस्या नाही; पण तो 20, 30 किंवा त्याहून अधिक ओळींमध्ये वाढल्यास सामग्रीची उंची स्क्रीनच्या बाहेर जाईल.

उदाहरणार्थ:

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

यावेळी दोन गोष्टी दिसून येतात:

- खालची सामग्री कापली जाते
- पृष्ठ scroll होत नाही

ही `VStack` ची समस्या नाही. `VStack` फक्त एक layout container आहे; ते आपोआप scroll करण्याची क्षमता देत नाही.

**ScrollView म्हणजे काय**

`ScrollView` हा scroll होणारा container आहे, आणि स्क्रीनच्या आकारापेक्षा जास्त असलेल्या मोठ्या सामग्रीसाठी तो योग्य असतो. उदाहरणार्थ, उभ्या किंवा आडव्या यादींसाठी.

मूलभूत रचना:

```swift
ScrollView {
    ...
}
```

जर scroll effect हवा असेल, तर संपूर्ण पृष्ठाची सामग्री `ScrollView` मध्ये wrap करावी लागेल:

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

अशा प्रकारे पूर्ण पृष्ठ एक scroll होणारे क्षेत्र बनते. सामग्री स्क्रीनच्या उंचीपेक्षा जास्त झाली की ती सहज scroll करता येते.

`ScrollView` डीफॉल्टने scrollbar indicator दाखवतो. तो लपवायचा असल्यास:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## पूर्ण कोड

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
