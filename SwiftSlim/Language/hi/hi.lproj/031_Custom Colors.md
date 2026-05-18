# कस्टम रंग

इस पाठ में, हम सीखेंगे कि SwiftUI में रंगों को कस्टम कैसे किया जाता है।

पिछले पाठों में, हमने SwiftUI द्वारा दिए गए डिफ़ॉल्ट रंगों का उपयोग किया है, उदाहरण के लिए:

```swift
Color.blue
Color.red
Color.green
```

इन रंगों का उपयोग करना बहुत सुविधाजनक है, लेकिन वास्तविक App विकास में, डिफ़ॉल्ट रंग अक्सर पर्याप्त सटीक नहीं होते।

उदाहरण के लिए, डिज़ाइन ड्रॉइंग में ऐसे रंग उपयोग किए जा सकते हैं:

```text
#2c54c2
#4875ed
#213e8d
```

इस तरह के रंग को Hex रंग कहा जाता है।

इस पाठ में, हम पहले SwiftUI को Hex रंगों का समर्थन करने देंगे, फिर `static` का उपयोग करके सामान्य रंगों को व्यवस्थित करेंगे।

अंत में, हम कस्टम रंगों को पशु विश्वकोश दृश्य में लागू करेंगे, और आगे ग्रेडिएंट बैकग्राउंड का उपयोग करेंगे, ताकि बटन अधिक परतदार दिखाई दें।

## कस्टम रंगों की आवश्यकता क्यों होती है?

SwiftUI में, हम सिस्टम रंगों का सीधे उपयोग कर सकते हैं।

उदाहरण के लिए:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

यहाँ `.blue` नीले रंग को दर्शाता है। वास्तव में यह `Color.blue` का संक्षिप्त रूप है।

डिफ़ॉल्ट रंगों का लाभ यह है कि वे सरल और सुविधाजनक होते हैं, लेकिन रंगों के विकल्प अपेक्षाकृत सीमित होते हैं।

उदाहरण के लिए:

```swift
Color.blue
```

यह केवल SwiftUI द्वारा दिए गए डिफ़ॉल्ट नीले रंग को दर्शा सकता है।

![Color.blue](../../../Resource/031_color6.png)

लेकिन वास्तविक विकास में, हमें अक्सर अधिक विशिष्ट रंगों की आवश्यकता होती है।

उदाहरण के लिए, दोनों नीले रंग ही हो सकते हैं, लेकिन हल्का नीला, गहरा नीला, ग्रे-नीला और चमकीला नीला जैसे अलग-अलग प्रभाव हो सकते हैं।

![More Blue](../../../Resource/031_color5.png)

इस समय, यदि केवल `Color.blue` का उपयोग किया जाए, तो डिज़ाइन प्रभाव को ठीक से दोहराना कठिन हो जाता है।

इसलिए, हमें SwiftUI को कस्टम रंगों का समर्थन करने देना होगा।

## Hex रंग क्या है?

स्क्रीन पर रंग आमतौर पर लाल, हरे और नीले तीन चैनलों से मिलकर बनते हैं, जिन्हें RGB कहा जाता है।

RGB क्रमशः दर्शाता है:

```text
Red     // लाल रंग
Green   // हरा रंग
Blue    // नीला रंग
```

Hex रंग RGB रंगों को व्यक्त करने का एक तरीका है।

उदाहरण के लिए:

```swift
#5479FF
```

इस रंग मान को सरल रूप से तीन हिस्सों के रूप में समझा जा सकता है:

```text
54  // लाल चैनल को दर्शाता है
79  // हरे चैनल को दर्शाता है
FF  // नीले चैनल को दर्शाता है
```

इस पाठ में, हमें इन मानों की गणना करने की आवश्यकता नहीं है, और न ही सोलहाधारी नियमों को गहराई से समझने की आवश्यकता है।

अभी केवल यह जानना पर्याप्त है: `#5479FF` एक विशिष्ट रंग को दर्शाता है।

भविष्य में जब हम `#2c54c2` और `#4875ed` जैसी लिखावट देखें, तो पहले इसे एक रंग मान के रूप में समझ सकते हैं।

Sketch, Figma, Photoshop जैसे डिज़ाइन टूल्स में भी ऐसे रंग मान अक्सर देखने को मिलते हैं।

![color](../../../Resource/031_color.png)

लेकिन SwiftUI डिफ़ॉल्ट रूप से इसे सीधे इस तरह नहीं लिख सकता:

```swift
Color(hex: "#5479FF")
```

इसलिए, हमें स्वयं `Color` प्रकार को विस्तारित करना होगा, ताकि यह Hex स्ट्रिंग के माध्यम से रंग बनाने का समर्थन करे।

## Color+Hex.swift फ़ाइल बनाना

सबसे पहले, हम एक नई Swift फ़ाइल बनाते हैं।

फ़ाइल का नाम इस तरह लिखा जा सकता है:

```text
Color.swift
```

इसे अधिक स्पष्ट रूप में भी लिखा जा सकता है:

```text
Color+Hex.swift
```

यहाँ अधिक अनुशंसित नाम है:

```text
Color+Hex.swift
```

Swift प्रोजेक्ट में, `Color+Hex.swift` जैसे फ़ाइल नाम बहुत सामान्य हैं।

इसका अर्थ है कि यह फ़ाइल `Color` में Hex क्षमता जोड़ने वाली extension फ़ाइल है।

फ़ाइल नाम सीधे कोड के चलने को प्रभावित नहीं करता। यह केवल हमें फ़ाइल के उद्देश्य को अधिक आसानी से समझने में मदद करता है।

## Color(hex:) कोड जोड़ना

`Color+Hex.swift` फ़ाइल में, नीचे दिया गया कोड लिखें:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

यह कोड `extension` का उपयोग करके `Color` प्रकार को विस्तारित करता है, और `Color` में एक नया initializer जोड़ता है:

```swift
init(hex: String)
```

इस initializer के बाद, हम Hex स्ट्रिंग को `Color` में पास कर सकते हैं, जिससे एक कस्टम रंग बनाया जा सकता है:

```swift
Color(hex: "#5479FF")
```

इस extension कोड के अंदर Hex स्ट्रिंग को SwiftUI द्वारा पहचाने जा सकने वाले RGB रंग में बदला जाता है।

इस चरण में प्रत्येक पंक्ति की रूपांतरण प्रक्रिया को गहराई से समझना आवश्यक नहीं है। केवल यह जानना पर्याप्त है कि जोड़ा गया `Color(hex:)` तरीका हमें Hex रंग मान के माध्यम से कस्टम रंग बनाने देता है।

## कस्टम रंगों का उपयोग

अब, हम `ContentView` में कस्टम रंगों का परीक्षण कर सकते हैं।

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

प्रदर्शन प्रभाव:

![color](../../../Resource/031_color1.png)

इस उदाहरण में, पहली पंक्ति सिस्टम रंग का उपयोग करती है:

```swift
.foregroundStyle(Color.blue)
```

इसके बाद की तीन पंक्तियाँ कस्टम Hex रंगों का उपयोग करती हैं:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

तुलना करके देखा जा सकता है कि सिस्टम नीले रंग का केवल एक डिफ़ॉल्ट प्रभाव होता है।

लेकिन Hex रंग नीले रंग के अधिक सूक्ष्म बदलावों को व्यक्त कर सकते हैं।

यही कस्टम रंगों का महत्व है: वे इंटरफ़ेस के रंगों को वास्तविक डिज़ाइन के अधिक करीब बना सकते हैं, और हमें App की दृश्य शैली को नियंत्रित करना भी अधिक सुविधाजनक बनाते हैं।

## static से रंगों को व्यवस्थित करना

अब, हम Hex स्ट्रिंग के माध्यम से रंग बना सकते हैं:

```swift
Color(hex: "#2c54c2")
```

यह लिखावट सामान्य रूप से काम कर सकती है, लेकिन यदि वही रंग कई जगहों पर बार-बार दिखाई देता है, तो बाद में रखरखाव सुविधाजनक नहीं रहेगा।

यदि 10 जगहों पर यह रंग मान लिखा गया है, और बाद में इस नीले रंग को बदलना हो, तो हर जगह अलग-अलग संशोधन करना पड़ेगा।

इस समय, हम `static` का उपयोग करके सामान्य रंगों को एक जगह व्यवस्थित कर सकते हैं।

`Color+Hex.swift` फ़ाइल के अंत में, नीचे दिया गया कोड जारी रखें:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

यहाँ, हमने `Color` में तीन static properties जोड़ी हैं: `animalBlue`, `animalLightBlue` और `animalDarkBlue`। वे अलग-अलग गहराई वाले नीले रंगों को दर्शाती हैं।

क्योंकि ये properties `static` का उपयोग करती हैं, इसलिए वे स्वयं `Color` प्रकार से संबंधित हैं।

उपयोग करते समय, इन्हें सीधे `Color.` के माध्यम से access किया जा सकता है:

```swift
Color.animalBlue
```

यह लिखावट सीधे Hex स्ट्रिंग लिखने से अधिक स्पष्ट है।

जब हम `Color.animalBlue` देखते हैं, तो हम समझ सकते हैं कि यह पशु विश्वकोश में उपयोग किया गया नीला रंग है।

जबकि `Color(hex: "#2c54c2")` देखने पर केवल यह पता चलता है कि यह एक रंग मान है, लेकिन इसका विशिष्ट उपयोग आसानी से समझ में नहीं आता।

रंगों को एक साथ प्रबंधित करने का एक और लाभ है: बाद में संशोधन अधिक सुविधाजनक होता है।

यदि पशु विश्वकोश का मुख्य रंग समायोजित करना हो, तो केवल परिभाषा वाली जगह बदलनी होगी:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

जहाँ भी इस रंग का उपयोग हुआ है, वे सभी जगहें एक साथ अपडेट हो जाएँगी।

यही `static` से रंगों को व्यवस्थित करने का अर्थ है: रंगों के नाम अधिक स्पष्ट होते हैं, और बाद का रखरखाव भी अधिक सुविधाजनक होता है।

## पशु विश्वकोश में लागू करना

अब, हम कस्टम रंगों को पहले वाले पशु विश्वकोश दृश्य में लागू कर सकते हैं।

पहले पशु बटन का बैकग्राउंड सफेद था:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

अब, हम इसे कस्टम रंग में बदल सकते हैं:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

यहाँ `Color.animalBlue` वही static रंग है जिसे हमने अभी `Color+Hex.swift` में परिभाषित किया था।

बटन का टेक्स्ट सफेद रंग का उपयोग करता है:

```swift
.foregroundStyle(Color.white)
```

पशु emoji का बैकग्राउंड अर्ध-पारदर्शी सफेद रंग का उपयोग करता है:

```swift
.background(Color.white.opacity(0.15))
```

इस तरह बटन एक एकीकृत नीली दृश्य शैली बनाएगा।

इस चरण का मुख्य उद्देश्य जटिल कोड जोड़ना नहीं है, बल्कि पहले सीखे गए कस्टम रंगों को सचमुच इंटरफ़ेस में लागू करना है।

## ग्रेडिएंट बैकग्राउंड का उपयोग

एकल रंग का उपयोग करने के अलावा, हम कई रंगों को मिलाकर ग्रेडिएंट प्रभाव भी बना सकते हैं।

उदाहरण के लिए, हमने पहले ये रंग परिभाषित किए थे:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

इन रंगों का उपयोग न केवल अलग-अलग किया जा सकता है, बल्कि इन्हें मिलाकर ग्रेडिएंट बैकग्राउंड भी बनाया जा सकता है।

SwiftUI में, `LinearGradient` का उपयोग करके linear gradient बनाया जा सकता है।

उदाहरण के लिए:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

यह कोड बाएँ से दाएँ जाने वाला ग्रेडिएंट बैकग्राउंड बनाएगा, जिसमें रंग `Color.animalBlue` से धीरे-धीरे `Color.animalLightBlue` में बदलता है।

इनमें, `colors` ग्रेडिएंट में भाग लेने वाले रंगों को सेट करने के लिए उपयोग होता है, और `startPoint` तथा `endPoint` ग्रेडिएंट की दिशा नियंत्रित करने के लिए उपयोग होते हैं।

### ग्रेडिएंट प्रभाव का परीक्षण

हम एक सरल Text से ग्रेडिएंट बैकग्राउंड का परीक्षण कर सकते हैं।

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

प्रदर्शन प्रभाव:

![color](../../../Resource/031_color3.png)

इस उदाहरण में, `Text` का बैकग्राउंड अब एकल रंग नहीं है, बल्कि बाएँ से दाएँ धीरे-धीरे बदलने वाला ग्रेडिएंट रंग है।

सामान्य बैकग्राउंड रंग की तुलना में, ग्रेडिएंट बैकग्राउंड अधिक परतदार होता है, और इंटरफ़ेस में दृश्य केंद्र भी अधिक आसानी से बना सकता है।

## पशु विश्वकोश में ग्रेडिएंट बैकग्राउंड का उपयोग

अब, हम पशु बटन के बैकग्राउंड रंग को:

```swift
.background(Color.animalBlue)
```

ग्रेडिएंट बैकग्राउंड में बदल सकते हैं:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

पूरा कोड इस प्रकार है:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

प्रदर्शन प्रभाव:

![color](../../../Resource/031_color4.png)

अब, पशु बटन केवल एकल बैकग्राउंड रंग नहीं है, बल्कि उसमें बाएँ से दाएँ जाने वाला ग्रेडिएंट प्रभाव है।

एकल रंग वाले बैकग्राउंड की तुलना में, ग्रेडिएंट बैकग्राउंड इंटरफ़ेस को अधिक परतदार दिखा सकता है, और वास्तविक App में दिखने वाले दृश्य डिज़ाइन के अधिक करीब भी बना सकता है।

## एकल रंग बैकग्राउंड और ग्रेडिएंट बैकग्राउंड का अंतर

एकल रंग बैकग्राउंड केवल एक रंग का उपयोग करता है।

उदाहरण के लिए:

```swift
.background(Color.animalBlue)
```

यह लिखावट सरल और स्पष्ट है, और अधिकांश बुनियादी इंटरफ़ेस के लिए उपयुक्त है।

ग्रेडिएंट बैकग्राउंड कई रंगों का उपयोग करता है।

उदाहरण के लिए:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

यह लिखावट इंटरफ़ेस को अधिक परतदार बना सकती है, लेकिन दृश्य जटिलता भी अधिक आसानी से बढ़ा सकती है।

इसलिए, वास्तविक विकास में इसे इस तरह समझा जा सकता है:

एकल रंग बैकग्राउंड सामान्य टेक्स्ट, सामान्य बटन, सामान्य कार्ड और सामान्य पेज बैकग्राउंड के लिए उपयुक्त है।

ग्रेडिएंट बैकग्राउंड प्रमुख बटन, शीर्ष क्षेत्र, कवर कार्ड और फ़ंक्शन एंट्रेंस जैसे उन स्थानों के लिए उपयुक्त है जिन्हें ज़ोर देकर दिखाना होता है।

## सारांश

इस पाठ में, हमने SwiftUI में कस्टम रंगों का उपयोग करना सीखा।

सबसे पहले, हमने Hex रंगों को समझा।

उदाहरण के लिए:

```text
#2c54c2
```

यह एक विशिष्ट रंग को दर्शाता है।

फिर, हमने `extension Color` का उपयोग करके `Color` प्रकार को विस्तारित किया।

ताकि SwiftUI नीचे दिए गए तरीके से रंग बना सके:

```swift
Color(hex: "#2c54c2")
```

इसके बाद, हमने `static` का उपयोग करके सामान्य रंगों को व्यवस्थित किया:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

इस तरह, अन्य views में इसे सीधे उपयोग किया जा सकता है:

```swift
Color.animalBlue
```

हर बार Hex स्ट्रिंग लिखने की तुलना में, यह तरीका अधिक स्पष्ट है, और बाद में रंगों को एक साथ संशोधित करना भी अधिक सुविधाजनक है।

अंत में, हमने `LinearGradient` सीखा, और कस्टम रंगों को मिलाकर ग्रेडिएंट बैकग्राउंड बनाया:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

इस पाठ के माध्यम से, हमने “कस्टम रंग बनाने” से लेकर “वास्तविक इंटरफ़ेस में रंगों का उपयोग करने” तक की प्रक्रिया पूरी की।

भविष्य में, जब किसी रंग का उपयोग कई जगहों पर बार-बार करना हो, तो पहले उसे `Color` extension में व्यवस्थित करने पर विचार किया जा सकता है।

इससे कोड अधिक स्पष्ट होगा, और इंटरफ़ेस शैली को एक समान रखना भी अधिक आसान होगा।
