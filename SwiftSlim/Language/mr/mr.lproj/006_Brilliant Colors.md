# आकर्षक रंग

या धड्यात आपण SwiftUI मधील सामान्य visual modifiers शिकणार आहोत, ज्यात पुढील गोष्टींचा समावेश आहे:

- रंग
- foreground color
- background color
- offset
- opacity
- blur

यासोबतच आपण Safe Area (सुरक्षित क्षेत्र) देखील शिकू.

हे modifiers views चे बाह्यरूप नियंत्रित करण्यासाठी वापरले जातात, ज्यामुळे interface अधिक स्पष्ट आणि स्तरित दिसतो.

## रंग

SwiftUI मध्ये आपण मजकूराचा रंग सेट करू शकतो.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` म्हणजे निळा रंग, आणि प्रत्यक्षात तो `Color.blue` चा संक्षिप्त प्रकार आहे (type inference मुळे).

सामान्य रंगांमध्ये हे समाविष्ट आहेत:

```
.black
.green
.yellow
.pink
.gray
...
```

हे सर्व `Color` चे static properties आहेत.

![Color](../../RESOURCE/006_color.png)

`Color` ला तुम्ही रंगाचा type समजू शकता, आणि `.blue`, `.red` हे त्याचे ठराविक रंग आहेत.

### Color view

SwiftUI मध्ये `Color` स्वतः एक view म्हणूनही दाखवता येतो.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

हा कोड 100×100 आकाराचा लाल चौकोन तयार करतो.

संपूर्ण interface एखाद्या ठराविक रंगात दाखवायचा असेल, तरीही तसे करता येते:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

run केल्यावर दिसते की लाल रंग पूर्ण स्क्रीन व्यापत नाही; iPhone च्या वरचा आणि खालचा भाग अजूनही पांढराच आहे. इथे Safe Area (सुरक्षित क्षेत्र) ही संकल्पना येते.

## Safe Area（सुरक्षित क्षेत्र）

Safe Area म्हणजे system कडून सामग्री झाकली जाणार नाही यासाठी राखून ठेवलेले क्षेत्र, ज्यात पुढील गोष्टी येतात:

1. वरचा status bar भाग (वेळ, बॅटरी)

2. खालचा Home indicator bar

3. notch किंवा Dynamic Island क्षेत्र

![Color](../../RESOURCE/006_color3.png)

SwiftUI डीफॉल्टने सामग्रीला safe area च्या आत मर्यादित ठेवते, त्यामुळे views स्क्रीनच्या अगदी काठापर्यंत वाढत नाहीत.

### Safe Area दुर्लक्षित करणे

जर रंग पूर्ण स्क्रीनभर पसरवायचा असेल, तर `ignoresSafeArea` वापरू शकतो:

```swift
Color.red
    .ignoresSafeArea()
```

किंवा `edgesIgnoringSafeArea` वापरू शकतो:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

यामुळे view पूर्ण स्क्रीनवर पसरतो.

लक्षात ठेवा, `edgesIgnoringSafeArea` ही जुनी शैली आहे. iOS 14 पासून `ignoresSafeArea` वापरण्याची शिफारस केली जाते.

## foreground color

### foregroundStyle modifier

मागील धड्यांमध्ये आपण `foregroundStyle` वापरून रंग सेट करणे शिकलो.

उदाहरणार्थ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` ही नवीन style system आहे, जी रंग, gradient, material इत्यादींना support करते.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier

`foregroundColor` देखील रंग सेट करण्यासाठी वापरू शकतो:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

याचा वापर `foregroundStyle` प्रमाणेच असतो.

नवीन Xcode versions मध्ये, Xcode सूचित करते की `foregroundColor` भविष्यातील iOS versions मध्ये deprecated होऊ शकतो, म्हणून `foregroundStyle` ला प्राधान्य द्यावे.

## पार्श्वभूमी

जर view ला background color द्यायचा असेल, तर `background` वापरता येतो:

```swift
background(.red)
```

उदाहरणार्थ, मजकुराला background color जोडण्यासाठी:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome यांसारख्या apps मध्ये मजकूर निवडल्यावर दिसणाऱ्या background color च्या परिणामासारखेच हे आहे.

![Color](../../RESOURCE/006_color16.png)

जर background मोठा करायचा असेल, तर `padding` सोबत वापरावे:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

येथे एक महत्त्वाचा नियम लक्षात घ्या:

SwiftUI modifiers वरून खाली अशा क्रमाने view तयार करतात. नंतर लिहिलेले modifier, आधीच्या परिणामावर लागू होते.

म्हणून:

```swift
.padding()
.background()
```

याचा अर्थ background हा padding जोडल्यानंतरच्या view ला wrap करतो.

जर क्रम उलटा लिहिला:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

तर background मोठा होत नाही, कारण background ने नंतरच्या padding ला wrap केलेले नसते.

## उदाहरण - चौकोनी नट

आता आपण एक साधे चौकोनी नटसारखे view तयार करू.

![Color](../../RESOURCE/006_color8.png)

सुरुवातीला 50 × 50 आकाराचा पांढरा चौकोन तयार करू:

```swift
Color.white
    .frame(width: 50, height: 50)
```

तो गोल करायचा असल्यास `cornerRadius` वापरू शकतो:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

जेव्हा corner radius ही रुंदी-उंचीच्या निम्मी असते, तेव्हा तो आकार वर्तुळ बनतो.

आता त्याला निळी background जोडा:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

नवीन `padding` बाहेरील क्षेत्र वाढवतो, आणि `background` त्या बाह्य क्षेत्रावर निळा रंग काढतो.

आता आपल्याला चौकोनी नटसारखा परिणाम मिळतो.

### दुसरी पद्धत

background color वापरून चौकोनी नट तयार करण्याबरोबरच, `ZStack` वापरूनही तो तयार करता येतो.

आपण आधी शिकलो की `ZStack` द्वारे stacked layout करता येतो. चौकोनी नट हा एक वर्तुळ आणि एक चौकोन एकावर एक ठेवलेले दृश्य समजू शकतो.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` views ला क्रमाने stack करतो आणि नंतर जोडलेला view वरच्या थरात दिसतो.

## उदाहरण - एकमेकांवर आच्छादित दोन वर्तुळे

अनेक icons हे साध्या आकारांच्या आच्छादनातून तयार होतात, उदाहरणार्थ दोन overlapping circles.

![Color](../../RESOURCE/006_color14.png)

सर्वप्रथम, दोन वर्तुळे तयार करू:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

दोन्ही वर्तुळे overlapping दाखवायची असल्याने `ZStack` layout वापरू:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

यावेळी समान आकाराची दोन वर्तुळे पूर्णपणे एकमेकांवर overlap होतात.

आपल्याला ती आंशिकपणे overlap व्हावीत, पूर्णपणे झाकली जाऊ नयेत, म्हणून `offset` वापरून shift effect देऊ शकतो.

## offset

`offset` फक्त view ची drawing position बदलतो; तो parent view च्या layout calculation वर परिणाम करत नाही.

वापरण्याची पद्धत:

```swift
.offset(x:y:)
```

`x` म्हणजे horizontal offset, `y` म्हणजे vertical offset.

positive value म्हणजे उजवीकडे/खाली offset, आणि negative value म्हणजे डावीकडे/वर offset.

`offset` वापरून दोन वर्तुळे अंशतः overlap होण्यासाठी:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

लाल वर्तुळाची layout मधील जागा बदलत नाही, पण त्याची drawing position 25 points डावीकडे जाते. त्यामुळे दोन वर्तुळांमध्ये अंशतः overlap झाल्यासारखा visual effect मिळतो.

## पारदर्शकता

SwiftUI मध्ये `opacity` हा view ची पारदर्शकता सेट करण्यासाठी वापरला जातो.

मूलभूत वापर:

```swift
.opacity(0.5)
```

`opacity` चा parameter 0.0 ते 1.0 दरम्यान असतो, ज्यात:

- 0 म्हणजे पूर्णपणे पारदर्शक
- 1 म्हणजे अपारदर्शक

ऑरेंज वर्तुळाची पारदर्शकता सेट करण्यासाठी `opacity` वापरू शकतो:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

ऑरेंज वर्तुळाची `opacity` 0.8 केल्यावर त्याची अपारदर्शकता 80% राहते. दोन वर्तुळे overlap झाल्यावर overlap भागात रंग मिसळल्यासारखा परिणाम दिसतो.

## blur

SwiftUI मध्ये `blur` वापरून blur effect देता येतो:

```swift
.blur(radius:10)
```

`radius` blur चा radius ठरवतो. संख्या जितकी मोठी, तितका blur अधिक स्पष्ट.

दोन्ही वर्तुळांना blur effect देऊ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

शेवटी, आपल्याला दोन खूप blur असलेली वर्तुळे दिसतात.

## सारांश

या धड्यात आपण SwiftUI मधील सामान्य visual modifiers भोवती अभ्यास केला आणि modifiers वापरून views चा रंग, स्थिती आणि visual effect कसे नियंत्रित करायचे हे शिकलो.

ठोस उदाहरणांद्वारे, interface मध्ये वेगवेगळे visual modifiers प्रत्यक्षात कसे काम करतात हे पाहिले, आणि safe area विषयीचे ज्ञानही समजले.

हे सगळे अतिशय मूलभूत modifiers आहेत. त्यांचा अधिक सराव आणि वापर केल्यास, प्रत्यक्ष विकासात interface effect अधिक स्पष्टपणे नियंत्रित करता येतील.

### धड्यानंतरचा सराव

- एका प्रतिमेला transparency आणि blur effect जोडा
- वेगवेगळ्या transparency असलेली तीन overlapping circles तयार करा
- पूर्ण स्क्रीन व्यापणारी background image तयार करा आणि safe area दुर्लक्षित करा
- अनेक views ची जागा बदलण्यासाठी `offset` वापरा

या सरावांचा उद्देश API पाठ करणे नाही, तर visual बदल आणि layout behavior यांच्यातील संबंध निरीक्षण करणे हा आहे.
