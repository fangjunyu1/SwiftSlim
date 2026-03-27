# लेआउट, चित्र और टेक्स्ट

पिछले पाठ में हमने `ContentView` का code सीखा था:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

इस पाठ में हम SwiftUI के डिफ़ॉल्ट layout mechanism, तथा image और text के उपयोग को सीखेंगे। पिछले पाठ के आधार पर हम आगे समझेंगे कि views की structure और display कैसे काम करती है। यह ज्ञान हमें बुनियादी interface layout बनाने में मदद करेगा।

## SwiftUI का डिफ़ॉल्ट layout mechanism

जब हम `ContentView` का preview देखते हैं, तो icon और text center में दिखाई देते हैं, न कि ऊपर से शुरू होते हुए।

![Swift](../../RESOURCE/003_view.png)

डिफ़ॉल्ट रूप से `Stack` container का alignment `.center` होता है, इसलिए child views सामान्यतः centered दिखाई देते हैं।

### `Alignment`

स्पष्ट है कि center alignment केवल alignment का एक प्रकार है। यदि हमें left alignment या right alignment चाहिए, तो `alignment` का उपयोग करके view alignment नियंत्रित करना होगा।

```swift
alignment
```

SwiftUI में alignment आम तौर पर दो परिस्थितियों में आता है:

**1. Stack container का alignment parameter**

उदाहरण के लिए, `ContentView` में icon और text को left align करना:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack` का `alignment` horizontal direction के alignment को नियंत्रित करता है।

alignment के प्रकार:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` horizontal arrangement है, इसलिए उसका `alignment` vertical direction को नियंत्रित करता है:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` overlay arrangement है, और उसका `alignment` horizontal या vertical directions को नियंत्रित कर सकता है:

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

यदि `alignment` को explicitly specify न किया जाए, तो `VStack`、`HStack` और `ZStack` का डिफ़ॉल्ट `.center` होता है।

**2. `frame` के अंदर alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

जब `frame` का size view के अपने size से बड़ा होता है, तो `alignment` यह तय करता है कि view `frame` के अंदर कहाँ positioned होगा। `frame` का विस्तृत उपयोग आगे समझाया जाएगा; यहाँ केवल प्रारंभिक समझ पर्याप्त है।

### `Spacer` और space distribution mechanism

`alignment` से views को horizontal या vertical दिशा में arrange किया जा सकता है। लेकिन जब हमें text और image को दोनों किनारों पर दिखाना हो, तब केवल alignment पर्याप्त नहीं होता।

उदाहरण के लिए, यदि हम [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) वेबसाइट का top view बनाना चाहें, जिसमें बाईं ओर NHK का icon और दाईं ओर menu icon हो।

![Swift](../../RESOURCE/003_alignment3.png)

यदि हम केवल alignment का उपयोग करें, तो दोनों icons एक ही ओर दिखाई देंगे। दोनों को अलग-अलग किनारों पर वितरित नहीं किया जा सकेगा, इसलिए बचे हुए space को बाँटने के लिए `Spacer` चाहिए।

`Spacer` एक flexible layout view है, जो remaining space को automatically भर देता है।

इसका उपयोग:

```swift
Spacer()
```

उदाहरण:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

जब `Image` और `Text` के बीच `Spacer` जोड़ा जाता है, तो `Spacer` remaining space भर देता है और `Image` व `Text` को ऊपर और नीचे की ओर धकेल देता है।

![Swift](../../RESOURCE/003_view1.png)

यदि कई `Spacer` हों:

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

तो remaining space सभी `Spacer` के बीच बराबर बाँट दिया जाएगा।

![Swift](../../RESOURCE/003_spacer.png)

## `Image` की display और size control

`Image` view मुख्य रूप से images दिखाने के लिए उपयोग होता है। पिछले पाठ में सीखा गया `SF Symbols` icon भी `Image` का ही एक उपयोग है।

उपयोग का तरीका:

```swift
Image("imageName")
```

`Image` के double quotes के अंदर image का नाम लिखा जाता है, file extension नहीं।

### image दिखाना

सबसे पहले, हम एक image तैयार करते हैं।

![Swift](../../RESOURCE/003_img.jpg)

Xcode में `Assets` resource folder चुनें, और image को drag करके `Assets` में जोड़ें।

![Swift](../../RESOURCE/003_img1.png)

`ContentView` में `Image` का उपयोग करके image दिखाएँ:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

ध्यान दें: SwiftUI का `Image` GIF animation play नहीं कर सकता (यह केवल static frame दिखाता है)।

### image size control

SwiftUI में `Image` डिफ़ॉल्ट रूप से image के original size में दिखाई देती है। यदि image का display size बदलना हो, तो पहले `resizable` का उपयोग करना पड़ता है, ताकि image content scalable हो सके, और फिर `frame` से layout size दिया जाता है।

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### `resizable` modifier

`resizable` modifier image को layout में scale होने की अनुमति देता है, बजाय इसके कि वह original size पर fixed रहे।

```swift
.resizable()
```

केवल `resizable()` जोड़ने के बाद ही `frame` वास्तव में image के display size को बदल सकता है।

यदि `resizable` न हो:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

तो `frame` केवल layout space देगा, लेकिन image का वास्तविक size नहीं बदलेगा।

### `frame` modifier

`frame(width:height:)` का उपयोग view की width और height निर्धारित करने के लिए होता है।

मूल उपयोग:

```swift
.frame(width: 10,height: 10)
```

उदाहरण के लिए, image को width `300` और height `100` वाले rectangle में सेट करना:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

अलग-अलग केवल width या केवल height भी सेट की जा सकती है:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` का संयोजन image के display size पर flexible control देता है, और साथ ही उसे scalable बनाए रखता है।

### scale ratio: `scaledToFit` और `scaledToFill`

जब हम `frame` के साथ width और height का अनुपात image के original ratio से अलग रखते हैं, तो image खिंचकर distort हो सकती है।

यदि हम image का ratio बनाए रखते हुए उसे available space में fit कराना चाहें, तो `scaledToFit` या `scaledToFill` का उपयोग कर सकते हैं।

**`scaledToFit`**

`scaledToFit` image के मूल width-height ratio को बनाए रखता है, और image को इस तरह scale करता है कि वह available space में पूरी तरह fit हो जाए, बिना crop हुए:

```swift
.scaledToFit()
```

या

```swift
.aspectRatio(contentMode: .fit)
```

यह तरीका उन परिस्थितियों के लिए उपयुक्त है जहाँ पूरी image दिखानी हो और distortion नहीं चाहिए।

यदि हर image के लिए समान width और height सेट कर दी जाए, तो कुछ images stretch हो सकती हैं।

उदाहरण:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

यदि scale ratio सेट न किया जाए, तो image अपने original ratio में नहीं दिखेगी।

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` सेट करने पर image अपना original ratio बनाए रखती है:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` भी image ratio बनाए रखता है, लेकिन पूरे available space को भर देता है। यदि ratio मेल नहीं खाता, तो extra हिस्सा crop हो जाता है:

```swift
.scaledToFill()
```

या

```swift
.aspectRatio(contentMode: .fill)
```

यह तरीका उन परिस्थितियों के लिए उपयुक्त है जहाँ image पूरे क्षेत्र को cover करे, जैसे background image या banner।

**दोनों के बीच अंतर**

![Swift](../../RESOURCE/003_img6.png)

## टेक्स्ट

SwiftUI में `Text` का उपयोग text दिखाने के लिए किया जाता है।

मूल उपयोग:

```swift
Text("FangJunyu")
```

पिछले पाठ में हमने `Text` सीखा था। इस पाठ में हम आगे सीखेंगे कि font size और font weight को कैसे नियंत्रित किया जाए, ताकि text view में अधिक expressive लगे।

### font size

`font` modifier का उपयोग करके text size नियंत्रित किया जा सकता है:

```swift
.font(.title)
```

उदाहरण:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

सामान्य font sizes (बड़े से छोटे तक):

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

### font weight

यदि text को bold करना हो, तो `fontWeight` modifier का उपयोग किया जा सकता है:

```swift
.fontWeight(.bold)
```

उदाहरण:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

सामान्य font weights (पतले से मोटे तक):

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

`font` font size को नियंत्रित करता है, और `fontWeight` font thickness को नियंत्रित करता है। दोनों को मिलाकर text expression को अधिक समृद्ध बनाया जा सकता है।

## सारांश और अभ्यास

अब तक हमने SwiftUI के डिफ़ॉल्ट layout, `Spacer`, `Image`, और `Text` जैसी बुनियादी चीज़ें सीख ली हैं। यह ज्ञान कुछ सरल views बनाने के लिए पर्याप्त है।

उदाहरण: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google का interface बहुत साफ़ है, और इसमें image और text दोनों शामिल हैं। हम SwiftUI के दृष्टिकोण से Google के interface की structure का विश्लेषण करने की कोशिश कर सकते हैं:

1. संपूर्ण layout तीन भागों में बाँटा जा सकता है: Google icon, search box, और prompt text। इसके लिए `VStack` का उपयोग करके vertical arrangement किया जा सकता है।
2. Google icon एक image है, इसलिए इसे `Image` से दिखाया जा सकता है।
3. Search box में input field और icon दोनों हैं। यदि अभी input field को ignore करें, तो search icon को `Image` से दिखाया जा सकता है।
4. Prompt text को `Text` से दिखाया जा सकता है, और text की horizontal arrangement के लिए `HStack` का उपयोग किया जा सकता है। text color को `foregroundStyle` से नियंत्रित किया जा सकता है।

इन concepts का अभ्यास करके हम कुछ सरल views बना सकते हैं, और `Image` तथा `Text` views तथा उनके modifiers की समझ को और गहरा कर सकते हैं।
