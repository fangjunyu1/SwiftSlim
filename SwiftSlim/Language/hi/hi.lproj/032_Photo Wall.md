# फोटो गैलरी

इस पाठ में, हम एक फोटो गैलरी पेज बनाएंगे।

![view](../../../Resource/032_view13.png)

इस उदाहरण में, हम `extension`, `self` और instance से जुड़ा ज्ञान दोहराएँगे, और SwiftUI में सामान्य रूप से उपयोग होने वाले `Shape` ग्राफिक्स सीखेंगे।

इन ज्ञान बिंदुओं की मदद से, हम सामान्य तस्वीरों को गोल, गोल-कोने वाले आयत, कैप्सूल, अंडाकार आदि अलग-अलग शैलियों में काट सकते हैं, और फोटो में बॉर्डर प्रभाव जोड़ सकते हैं।

इस पाठ में कुछ नए ज्ञान बिंदु इस्तेमाल होंगे: `Shape`, `clipShape`, `strokeBorder` और `overlay`।

इनमें, `clipShape` का उपयोग view के आकार को काटने के लिए किया जाता है, `strokeBorder` का उपयोग shape की बॉर्डर बनाने के लिए किया जाता है, और `overlay` का उपयोग view के ऊपर नया view ओवरले करने के लिए किया जाता है।

## इमेज सामग्री

शुरू करने से पहले, हमें कुछ तस्वीरें तैयार करनी होंगी।

आप अपनी तस्वीरें इस्तेमाल कर सकते हैं, या इस पाठ में दी गई उदाहरण तस्वीरों का उपयोग कर सकते हैं।

इस पाठ की फोटो उदाहरण सामग्री [Pixabay](https://pixabay.com/) वेबसाइट से ली गई है:

[दृश्य](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[लोमड़ी](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[इमारत](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[फूल](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[हंस](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

तस्वीरें डाउनलोड करने के बाद, उन्हें `Assets` resource folder में जोड़ें, और क्रम से `1`, `2`, `3`, `4`, `5` नाम दें।

![assets](../../../Resource/032_view17.png)

इस तरह, हम SwiftUI में `Image("1")`, `Image("2")` के तरीके से तस्वीरें दिखा सकते हैं।

## फोटो दिखाना

सबसे पहले, हम `ContentView` में 5 तस्वीरें दिखाते हैं:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

दिखने वाला परिणाम:

![view](../../../Resource/032_view.png)

इस कोड में, हम `ScrollView` का उपयोग करके फोटो सूची को स्क्रॉल करके दिखाते हैं, और `VStack` का उपयोग करके कई तस्वीरों को ऊपर से नीचे व्यवस्थित करते हैं।

हर तस्वीर में `.resizable()`, `.scaledToFit()` और `.frame(width: 300)` के माध्यम से तस्वीर का display effect सेट किया गया है, ताकि तस्वीर scale हो सके, अनुपात बनाए रखते हुए पूरी दिखाई दे, और तस्वीर की चौड़ाई सीमित रहे।

`VStack` पर `.padding(.vertical, 100)` ऊपर और नीचे की spacing बढ़ाने के लिए है, ताकि पहली और अंतिम फोटो स्क्रीन के किनारे से बहुत चिपकी हुई न लगें।

अंत में `.ignoresSafeArea()` का अर्थ है कि scroll view safe area को ignore करे, ताकि फोटो scroll करते समय स्क्रीन के ऊपर और नीचे तक फैल सके, और पेज अधिक पूरा दिखाई दे।

लेकिन अभी 5 तस्वीरें समान modifiers का उपयोग कर रही हैं:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

जब हमें repeated code दिखाई दे, तो हम उसे व्यवस्थित करने के लिए `extension` का उपयोग करने पर विचार कर सकते हैं।

## extension का उपयोग करके इमेज स्टाइल व्यवस्थित करना

हम `Image` के लिए एक फोटो गैलरी-विशेष method extend कर सकते हैं:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

यहाँ, हमने `Image` type के लिए `photoGalleryStyle` method extend किया है।

इस method के अंदर पहले repeated रूप से इस्तेमाल किए गए `.resizable()`, `.scaledToFit()` और `.frame(width: 300)` शामिल हैं। यानी, यह तस्वीर को scale करने, proportion में दिखाने और width सेट करने वाले code को एक जगह व्यवस्थित कर देता है।

इस extension का उपयोग करने के बाद, मूल image code:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

सरल होकर ऐसा बन सकता है:

```swift
Image("1")
    .photoGalleryStyle()
```

इस तरह, हर तस्वीर को केवल `.photoGalleryStyle()` call करना होगा, और वही फोटो गैलरी style लागू हो जाएगी। code अधिक संक्षिप्त होगा, और बाद में एक साथ modify करना भी अधिक सुविधाजनक होगा।

## self को समझना

extension method में, हमने `self` लिखा है:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

यहाँ `self` उस current image instance को दर्शाता है जिसने इस method को call किया है।

उदाहरण के लिए:

```swift
Image("1")
    .photoGalleryStyle()
```

इस code में, `photoGalleryStyle()` को `Image("1")` ने call किया है, इसलिए method के अंदर `self` इसी `Image("1")` तस्वीर को दर्शाता है।

सरल रूप में समझें: जो इस method को call करता है, `self` उसी को दर्शाता है।

ध्यान देने की बात है कि SwiftUI के modifiers लगातार नए view results लौटाते हैं। इसलिए, `photoGalleryStyle()` एक modified view लौटाता है, न कि केवल मूल `Image` को ही वापस करता है।

## फोटो आकार

अब फोटो सामान्य रूप से दिखाई दे रही हैं। लेकिन ये तस्वीरें default रूप से rectangle होती हैं, इसलिए उनका रूप काफी साधारण लगता है।

अगर सिर्फ फोटो में rounded corners जोड़ने हैं, तो सीधे `.cornerRadius()` का उपयोग किया जा सकता है:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

दिखने वाला परिणाम:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` का अर्थ है कि तस्वीर में `20 pt` का rounded corner जोड़ा जाए। सामान्य rounded image के लिए यह लिखने का तरीका पर्याप्त है।

लेकिन `.cornerRadius()` केवल rounded corner effect संभाल सकता है, और साधारण rounded images बनाने के लिए उपयुक्त है। अगर हम तस्वीरों को और अधिक अलग-अलग shapes में बदलना चाहते हैं, तो केवल यह modifier पर्याप्त नहीं होगा।

इस स्थिति में, SwiftUI के `Shape` का उपयोग करना होगा। `Shape` अलग-अलग ग्राफिक्स को दर्शा सकता है। फिर `clipShape` के साथ मिलाकर, हम image को संबंधित shape में काट सकते हैं।

## Shape को समझना

SwiftUI में, `Shape` graph को दर्शाता है। यह `View` की तरह ही SwiftUI में बहुत सामान्य रूप से उपयोग होने वाला type है।

सामान्य `Shape` में circle, rectangle, rounded rectangle, capsule और ellipse शामिल हैं। अलग-अलग shapes की appearance को अधिक intuitively देखने के लिए, नीचे के examples में हर shape को अलग color और size दिया जाएगा।

इन examples में, `.fill()` का उपयोग shape में color भरने के लिए किया जाता है, और `.frame()` का उपयोग shape का display size सेट करने के लिए किया जाता है। color सिर्फ अलग shapes को पहचानने के लिए है, shape का fixed color नहीं है।

### Circle गोल आकार

`Circle` गोल आकार को दर्शाता है। यह अक्सर avatar, circular button, circular image आदि interface effects में उपयोग होता है।

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle आयत

`Rectangle` rectangle को दर्शाता है। यह सबसे basic shapes में से एक है, और background, section separator या साधारण border बनाने के लिए भी उपयोग किया जा सकता है।

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle गोल-कोने वाला आयत

`RoundedRectangle` rounded rectangle को दर्शाता है। `cornerRadius` का उपयोग corner radius size सेट करने के लिए किया जाता है।

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule कैप्सूल आकार

`Capsule` capsule shape को दर्शाता है। इसके दोनों सिरों पर arc shape होता है, और यह अक्सर capsule button, tag background आदि interface effects में उपयोग होता है।

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse अंडाकार

`Ellipse` ellipse को दर्शाता है। यह `Circle` जैसा है, लेकिन जब width और height समान न हों, तो यह ellipse के रूप में दिखाई देता है।

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

इन examples से देखा जा सकता है कि `Shape` स्वयं सीधे graphic के रूप में दिखाई दे सकता है। आगे, हम इन `Shape` को `clipShape` के साथ इस्तेमाल करके photos को crop करेंगे, ताकि photos अलग-अलग shapes में दिखाई दें।

## clipShape का उपयोग करके फोटो crop करना

अब, हम `clipShape` का उपयोग करके photos को अलग-अलग shapes में crop कर सकते हैं।

उदाहरण के लिए, पहली photo को circle में crop करें:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

इस code का अर्थ है: पहले एक image दिखाएँ, फिर `Circle()` का उपयोग करके उसे circle में crop करें।

![view](../../../Resource/032_view2.png)

`clipShape` की basic writing style है:

```swift
.clipShape(आकार)
```

view के बाद `.clipShape(...)` जोड़ें, और parentheses में वह graphic भरें जिसमें crop करना है।

उदाहरण के लिए:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

अब, हम 5 photos को अलग-अलग shapes में crop करते हैं:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

दिखने वाला परिणाम:

![view](../../../Resource/032_view8.png)

इनमें, `Rectangle()` से crop करने के बाद effect सामान्य rectangular photo के करीब होता है, इसलिए visual change स्पष्ट नहीं होता। यह मुख्य रूप से अन्य shapes से तुलना के लिए है।

अब, photos केवल सामान्य rectangles नहीं रहीं, बल्कि इनके पास अलग-अलग shapes हैं।

## फोटो border जोड़ना

अगर हम circular photo में border जोड़ना चाहते हैं, तो शायद `border` का उपयोग सोचेंगे:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

लेकिन इससे आम तौर पर circular border नहीं, बल्कि rectangular border मिलता है।

![view](../../../Resource/032_view9.png)

ऐसा इसलिए है क्योंकि `border` view के rectangular area के अनुसार border जोड़ता है, न कि `clipShape` से crop किए गए shape के अनुसार border जोड़ता है।

इसलिए, अगर हम circular border चाहते हैं, तो सीधे `border` का उपयोग नहीं कर सकते।

## strokeBorder का उपयोग करके shape border बनाना

SwiftUI में, `strokeBorder` इन सामान्य `Shape` के लिए inner border draw कर सकता है।

उदाहरण के लिए, एक circular border draw करें:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

इस code का अर्थ है: `Circle` के लिए brown border draw करें, और border width `10 pt` है।

![view](../../../Resource/032_view12.png)

यहाँ ध्यान देना चाहिए कि `strokeBorder` सीधे photo में border नहीं जोड़ता, बल्कि `Circle()` इस graphic के लिए border draw करता है।

यानी, इस code से केवल एक स्वतंत्र circular border मिलता है, और इसका photo से अभी कोई संबंध नहीं है।

अगर इस circular border को photo के ऊपर दिखाना है, तो आगे `overlay` का उपयोग करके border को photo पर overlay करना होगा।

## overlay का उपयोग करके border overlay करना

`overlay` एक view modifier है, जो current view के ऊपर नया view overlay कर सकता है।

इसकी basic structure को इस तरह समझ सकते हैं:

```swift
वर्तमान view
    .overlay {
        overlay किया जाने वाला view
    }
```

इस example में, current view वह photo है जिसे circle में crop किया गया है:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

जिस नए view को हम overlay करना चाहते हैं, वह एक circular border है:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

इसलिए, photo और border को इस तरह combine किया जा सकता है:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

यहाँ `overlay` का अर्थ है कि current view के ऊपर एक नया view overlay किया जाए।

`overlay` में, border current photo के display range के अनुसार overlay होगा, इसलिए अलग से `frame` सेट करने की आवश्यकता नहीं है। जब तक border shape और crop shape एक जैसे हों, border photo से fit हो जाएगा।

![view](../../../Resource/032_view10.png)

अंतिम effect यह है कि circular photo के ऊपर एक circular border cover हो गया है।

`ZStack` की तुलना में, `overlay` इस तरह के “current view में decoration जोड़ने” वाले scene के लिए अधिक उपयुक्त है। photo मुख्य body है, और border केवल additional effect है, इसलिए `overlay` का उपयोग अधिक स्पष्ट होगा।

## फोटो गैलरी पूरी करना

अब, हम हर photo में संबंधित shape और border जोड़ते हैं:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

दिखने वाला परिणाम:

![view](../../../Resource/032_view13.png)

इस तरह, एक basic photo gallery page पूरा हो गया।

इस page में, हमने scrolling display के लिए `ScrollView` का उपयोग किया, photos दिखाने के लिए `Image` का उपयोग किया, photo shapes crop करने के लिए `clipShape` का उपयोग किया, और `overlay` तथा `strokeBorder` के माध्यम से border जोड़े।

## पूरा code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## सारांश

इस पाठ में, हमने एक photo gallery page पूरा किया।

![view](../../../Resource/032_view13.png)

इस example में, हमने पहले photos दिखाने के लिए `Image` का उपयोग किया, फिर `extension` के माध्यम से `Image` के लिए `photoGalleryStyle` method extend किया, ताकि repeated image style code व्यवस्थित किया जा सके।

इसके बाद, हमने SwiftUI में सामान्य `Shape` सीखे, जैसे `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` और `Ellipse`। ये graphics न केवल सीधे दिखाई दे सकते हैं, बल्कि `clipShape` के साथ view crop करने के लिए भी इस्तेमाल हो सकते हैं।

उदाहरण के लिए:

```swift
.clipShape(Circle())
```

इसका अर्थ है view को circle में crop करना।

अंत में, हमने `overlay` और `strokeBorder` का उपयोग करके photos में संबंधित shape के border जोड़े। ध्यान देने की बात है कि `border` आम तौर पर view के rectangular area के अनुसार border draw करता है। अगर border को circle, capsule या ellipse के अनुसार follow करवाना है, तो वही `Shape` overlay करना अधिक उपयुक्त है।

इस पाठ के माध्यम से, हमने न केवल photo gallery effect पूरा किया, बल्कि interface में `Shape`, `clipShape`, `strokeBorder` और `overlay` के common combination को भी समझा।

## पाठ के बाद अभ्यास

### 1、फोटो गैलरी background जोड़ना

photo gallery page में एक full-screen background image जोड़ें।

आवश्यकता: background image पूरी screen को cover कर सके, और safe area को ignore करे।

### 2、gradient border

मौजूदा single-color border को linear gradient border में बदलें।

अधिक समृद्ध border effect बनाने के लिए `LinearGradient` का उपयोग करके देखें।

### 3、realistic photo border

Internet पर कुछ वास्तविक photo border styles खोजें, और `overlay` का उपयोग करके image border overlay करने की कोशिश करें, ताकि photo वास्तविक frame effect के अधिक करीब लगे।

अभ्यास display effect:

![button](../../../Resource/032_view15.jpeg)

### 4、rounded button border बनाना

वास्तविक development में, buttons अक्सर rounded rectangle border का उपयोग करते हैं।

कृपया एक rounded button बनाने की कोशिश करें, और `RoundedRectangle` तथा `strokeBorder` का उपयोग करके button में rounded border जोड़ें।

अभ्यास display effect:

![button](../../../Resource/032_view14.png)

### सोचने का प्रश्न

अगर single-color border भी नहीं चाहिए और gradient border भी नहीं चाहिए, बल्कि border में किसी तरह का pattern effect दिखाना है, तो इसे कैसे लागू किया जाना चाहिए?

आप material खोजकर `overlay`, `mask` या `ImagePaint` जैसी related usages समझने की कोशिश कर सकते हैं।

अभ्यास display effect:

![button](../../../Resource/032_view16.png)
