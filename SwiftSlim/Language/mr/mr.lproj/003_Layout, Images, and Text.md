# मांडणी, चित्रे आणि मजकूर

मागील पाठात आपण `ContentView` code शिकले:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

या पाठीत आपण SwiftUI ची default layout mechanism आणि images व text कसे वापरायचे हे शिकू. मागील पाठीच्या आधारावर, आपण views ची रचना आणि display पद्धत आणखी चांगली समजून घेऊ. हे ज्ञान basic interface layouts तयार करण्यासाठी उपयुक्त ठरेल.

## SwiftUI ची default layout mechanism

जेव्हा आपण `ContentView` preview करतो, तेव्हा icon आणि text मध्यभागी दिसतात; ते top पासून सुरू होत नाहीत.

![Swift](../../RESOURCE/003_view.png)

Default ने `Stack` container चे alignment `.center` असते, त्यामुळे child views सहसा center aligned दिसतात.

### Alignment

Center alignment हा alignment चाच एक प्रकार आहे. जर आपल्याला left alignment किंवा right alignment हवे असेल, तर `alignment` वापरून view चे alignment नियंत्रित करावे लागते.

```swift
alignment
```

SwiftUI मध्ये alignment सहसा दोन परिस्थितींमध्ये दिसते:

**1. Stack container चे alignment parameter**

उदाहरणार्थ, `ContentView` मधील icon आणि text left aligned दाखवण्यासाठी:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack` मधील `alignment` horizontal direction मधील alignment नियंत्रित करते.

Alignment चे पर्याय:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` horizontal arrangement असते; त्यातील `alignment` vertical direction मधील alignment नियंत्रित करते:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` overlay arrangement असते; त्यात `alignment` horizontal किंवा vertical direction नियंत्रित करू शकते:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

जर `alignment` स्पष्टपणे specify केले नाही, तर `VStack`, `HStack`, `ZStack` या सर्वांची default value `.center` असते.

**2. `frame` च्या आतला alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

जेव्हा `frame` दिलेली size view च्या स्वतःच्या size पेक्षा मोठी असते, तेव्हा `alignment` ठरवते की त्या `frame` च्या आत view कुठे दिसेल. `frame` चा तपशील पुढे शिकू; सध्या फक्त ही कल्पना समजून घ्या.

### Spacer आणि space allocation mechanism

`alignment` वापरून views horizontal किंवा vertical दिशेने arrange करता येतात. पण जेव्हा आपल्याला text आणि image दोन्ही विरुद्ध टोकांना दाखवायचे असते, तेव्हा फक्त alignment पुरेसे नसते.

उदाहरणार्थ, जर आपण [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) वेबसाइटच्या top view सारखे काही तयार करायचे ठरवले, ज्यात डाव्या बाजूला NHK website icon आणि उजव्या बाजूला menu icon असेल.

![Swift](../../RESOURCE/003_alignment3.png)

जर आपण फक्त alignment वापरले, तर NHK website icon आणि menu icon दोन्ही एकाच बाजूला दिसतील. त्यांना left आणि right बाजूंवर distribute करता येणार नाही. म्हणून उरलेली जागा भरून काढण्यासाठी `Spacer` वापरावा लागतो.

`Spacer` हा layout साठी वापरला जाणारा एक flexible view आहे, जो उरलेली space आपोआप भरतो.

उपयोग:

```swift
Spacer()
```

उदाहरणार्थ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

जेव्हा आपण `Image` आणि `Text` यांच्या मध्ये `Spacer` add करतो, तेव्हा `Spacer` उरलेली जागा भरतो आणि `Image` व `Text` यांना वरच्या आणि खालच्या टोकांकडे ढकलतो.

![Swift](../../RESOURCE/003_view1.png)

जर अनेक `Spacer` असतील:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

उरलेली जागा `Spacer` मध्ये समान प्रमाणात वाटली जाईल.

![Swift](../../RESOURCE/003_spacer.png)

## Image चे display आणि size control

`Image` view मुख्यतः चित्रे दाखवण्यासाठी वापरली जाते. मागील पाठीतील SF Symbols icons हे `Image` च्या वापरांपैकी फक्त एक होते.

उपयोग:

```swift
Image("imageName")
```

`Image` मधील quotes च्या आत image चे नाव लिहायचे असते; extension लिहिण्याची गरज नसते.

### चित्र दाखवणे

सुरुवातीला एक image तयार करूया.

![Swift](../../RESOURCE/003_img.jpg)

Xcode मध्ये `Assets` resources folder निवडा आणि image drag करून त्यात टाका.

![Swift](../../RESOURCE/003_img1.png)

`ContentView` मध्ये `Image` वापरून image दाखवा:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

टीप: SwiftUI मधील `Image` GIF animation play करू शकत नाही; ती फक्त static frame दाखवते.

### Image चे size नियंत्रित करणे

SwiftUI मध्ये `Image` default ने तिच्या original size मध्ये दिसते. जर image चा display size बदलायचा असेल, तर आधी `resizable` वापरून image scalable करावी लागते, आणि नंतर `frame` वापरून layout size द्यावी लागते.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### `resizable` modifier

`resizable` modifier image ला layout मध्ये scale होण्यास परवानगी देते, म्हणजे ती original size ला fixed राहत नाही.

```swift
.resizable()
```

`resizable()` add केल्याशिवाय `frame` image चा display size प्रत्यक्षात बदलत नाही.

जर `resizable` omitted केले:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` फक्त image साठी layout space देईल; image चा actual size बदलणार नाही.

### `frame` modifier

`frame(width:height)` view ची width आणि height specify करण्यासाठी वापरली जाते.

अत्यंत basic उपयोग:

```swift
.frame(width: 10,height: 10)
```

उदाहरणार्थ, image ची width `300` आणि height `100` असलेली rectangle तयार करणे.


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Width किंवा height वेगवेगळेही set करता येतात:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` हे combination वापरून interface मधील image चा display size लवचिकपणे नियंत्रित करता येतो, आणि scale करण्याची क्षमता टिकून राहते.

### Scale ratio: `scaledToFit` आणि `scaledToFill`

जेव्हा आपण `frame` ची width आणि height ratio image च्या original ratio पेक्षा वेगळी ठेवतो, तेव्हा image stretch होऊन distort होऊ शकते.

जर आपण image ची proportion कायम ठेवत उपलब्ध layout space मध्ये ती fit व्हावी असे इच्छित असू, तर `scaledToFit` किंवा `scaledToFill` वापरता येते.

**scaledToFit**

`scaledToFit` image ची original aspect ratio कायम ठेवते आणि image ला उपलब्ध space मध्ये पूर्णपणे बसवते; image crop होत नाही:

```swift
.scaledToFit()
```

किंवा

```swift
.aspectRatio(contentMode: .fit)
```

ही पद्धत संपूर्ण image distort न होता दिसावी अशा situations साठी योग्य असते.

जर प्रत्येक image ला सारखीच width आणि height दिली, तर image stretch होण्याची शक्यता असते.

उदाहरणार्थ:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Scale ratio सेट केले नसल्यास image original proportion मध्ये दिसू शकत नाही.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` वापरल्यास image तिचे original ratio कायम ठेवते.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` सुद्धा image ची ratio कायम ठेवते, पण ती उपलब्ध space पूर्ण भरते; ratio जुळत नसेल तर extra भाग crop होतो:

```swift
.scaledToFill()
```

किंवा

```swift
.aspectRatio(contentMode: .fill)
```

ही पद्धत image ने पूर्ण area cover करावा अशा situations साठी उपयुक्त आहे, जसे background image किंवा banner.

**दोघांतील फरक**

![Swift](../../RESOURCE/003_img6.png)

## मजकूर

SwiftUI मध्ये `Text` मजकूर दाखवण्यासाठी वापरले जाते.

Basic उपयोग:

```swift
Text("FangJunyu")
```

मागील पाठीत आपण `Text` शिकलो होतो. या पाठीत आपण font size आणि font weight कसे नियंत्रित करायचे हे पुढे शिकणार आहोत, ज्यामुळे text view मध्ये अधिक expressive दिसेल.

### Font size

`font` modifier वापरून text size नियंत्रित करता येतो:

```swift
.font(.title)
```

उदाहरणार्थ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

सामान्य font sizes (मोठ्यापासून लहानाकडे):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Font weight

जर text bold करायचा असेल, तर `fontWeight` modifier वापरू शकता:

```swift
.fontWeight(.bold)
```

उदाहरणार्थ:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

सामान्य font weights (पातळ पासून जाडाकडे):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` font size नियंत्रित करते, तर `fontWeight` font ची जाडी नियंत्रित करते. दोन्ही एकत्र वापरल्यास text चे presentation अधिक समृद्ध होते.

## सारांश आणि सराव

आतापर्यंत आपण SwiftUI चा default layout, `Spacer`, `Image`, `Text` यांसारखे मूलभूत concepts शिकलो आहोत. ही content काही साधे views तयार करण्यासाठी पुरेशी आहे.

उदाहरणार्थ: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google चे interface अतिशय स्वच्छ आहे. त्यात images आणि मजकूर आहे. आपण SwiftUI च्या दृष्टीने Google च्या interface ची structure विश्लेषित करून पाहू शकतो:

1. संपूर्ण interface तीन भागांत विभागता येतो: Google icon, search box, आणि hint text. हे `VStack` वापरून vertical पद्धतीने arrange करता येते.
2. Google icon हे एक image आहे; ते `Image` वापरून दाखवता येते.
3. Search box मध्ये input field आणि icon असते. Input field भाग सध्या दुर्लक्षित केल्यास, search icon `Image` ने दाखवता येतो.
4. Hint text `Text` वापरून दाखवता येतो. Text ची horizontal arrangement `HStack` ने करता येते; text color `foregroundStyle` ने नियंत्रित करता येतो.

या concepts वर सराव करून आपण काही सोपे views तयार करू शकतो. त्यामुळे `Image` आणि `Text` views तसेच त्यांच्या modifiers ची समज आणि वापर आणखी स्पष्ट होईल.
