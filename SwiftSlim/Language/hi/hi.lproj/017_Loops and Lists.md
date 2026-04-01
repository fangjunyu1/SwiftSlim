# लूप और सूचियाँ

इस पाठ में, हम Swift में `for` लूप और SwiftUI में `ForEach` सीखेंगे।

ये दोनों हमें किसी array के elements को क्रम से एक-एक करके पढ़ने में मदद करते हैं। वास्तविक विकास में, हमें अक्सर किसी data group को एक-एक करके निकालकर फिर उसे process या display करना पड़ता है, और लूप इसी काम को पूरा करने का एक महत्वपूर्ण साधन है।

जब हम वेबपेज ब्राउज़ करते हैं या किसी App का उपयोग करते हैं, तो हम अक्सर बहुत सी सूचियाँ या items देखते हैं। ऐसी सामग्री सामान्यतः पहले `array` में संग्रहित की जाती है, फिर `loop` के माध्यम से एक-एक करके पढ़ी जाती है, और अंत में interface में दिखाई जाती है।

उदाहरण के लिए, Google की search result list:

![Google](../../Resource/017_google.png)

Search result list में मौजूद हर item सामान्यतः एक data item के अनुरूप होता है, और उसे loop के माध्यम से एक-एक करके दिखाया जाता है।

इसलिए, `array` और `loop` अक्सर साथ-साथ दिखाई देते हैं। `array` एक समूह के data को संग्रहित करने के लिए जिम्मेदार है, और `loop` उस data को क्रम से निकालकर उस पर एक जैसा operation करने के लिए जिम्मेदार है।

अब, हम सबसे बुनियादी `for` लूप से शुरुआत करते हैं।

## काउंटडाउन

मान लीजिए कि हमें एक countdown function को simulate करना है, और क्रम से `“5, 4, 3, 2, 1”` output करना है।

इसे लिखने का सबसे सीधा तरीका है:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

यह तरीका countdown को simulate तो कर सकता है, लेकिन यदि सामग्री अधिक हो, तो यह बहुत दोहरावपूर्ण लगेगा, और बाद में इसमें बदलाव करना भी सुविधाजनक नहीं होगा।

इस समय, हम पहले data को एक array में रख सकते हैं, और फिर `for` loop का उपयोग करके उसे एक-एक करके output कर सकते हैं:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

यह तरीका अधिक संक्षिप्त है और इसे आगे बढ़ाना भी आसान है। चाहे countdown में बहुत से numbers हों, हमें `print` को पंक्ति-दर-पंक्ति लिखने की आवश्यकता नहीं होती, हमें सिर्फ loop को array के हर element को अपने आप process करने देना होता है।

हम इस code को test करने के लिए एक button में रख सकते हैं:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

जब button पर tap किया जाता है, तो `for` loop array के क्रम में `countDown` के हर integer को एक-एक करके निकालेगा और उसे console में print करेगा।

अब, देखते हैं कि `for` loop कैसे काम करता है।

## for लूप

`for` loop का उपयोग किसी data group को क्रम से process करने के लिए किया जाता है। सबसे सामान्य objects हैं arrays और ranges।

मूल लिखने का तरीका:

```swift
for तत्व in arrayयाrange {
    चलाने_वाला_कोड
}
```

उदाहरण के लिए, अभी का countdown code:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

यहाँ `i` वर्तमान में निकाले गए element को दर्शाता है, और `in` के बाद वह data आता है जिस पर loop चलाना है, यानी `countDown` array।

इस code का अर्थ है: program `countDown` array से हर element को क्रम से निकालेगा। हर बार जब वह एक element निकालेगा, तो उसे अस्थायी रूप से `i` से दर्शाएगा, और फिर braces के अंदर का code चलाएगा।

इसकी execution process को इस तरह समझा जा सकता है:

* सबसे पहले निकाला गया element `5` है, इसलिए इस समय `i` का value `5` है
* `print(i)` चलाया जाता है और `5` output होता है
* फिर अगला element `4` निकाला जाता है
* फिर से `print(i)` चलाया जाता है और `4` output होता है

इसके बाद `3`, `2`, और `1` भी इसी तरह एक-एक करके execute होंगे।

![for](../../Resource/017_for.png)

जब array के सभी elements process हो जाते हैं, तो `for` loop अपने आप समाप्त हो जाता है।

हम `for` loop की मदद से array के हर element को प्राप्त कर सकते हैं और countdown जैसी functionality पूरी कर सकते हैं।

**सुझाव**: `i` for loop में बहुत सामान्य naming है, जिसका उपयोग वर्तमान में निकाले गए element को दर्शाने के लिए किया जाता है, लेकिन यह कोई तयशुदा लिखावट नहीं है। आप अन्य English names भी उपयोग कर सकते हैं।

उदाहरण के लिए, हर निकाले गए element को दर्शाने के लिए `num` का उपयोग करें:

```swift
for num in countDown {
    print(num)
}
```

Braces के अंदर भी वर्तमान में निकाले गए element को दर्शाने के लिए `num` का ही उपयोग करना होगा।

### range पर लूप

`for` loop सिर्फ arrays पर ही नहीं, बल्कि ranges पर भी loop कर सकता है।

उदाहरण के लिए, जब हमें `50` तक के positive integers का sum निकालना हो, तो हमें `1` से `50` के बीच के सभी integers को एक-एक करके जोड़ना होगा।

इसे लिखने का सबसे सीधा तरीका शायद यह हो सकता है:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

इस तरीके की समस्या यह है कि हमें हर number को हाथ से लिखना पड़ता है। यह झंझट भरा है, और वास्तविक development scenarios के लिए उपयुक्त नहीं है।

इस समय, हम range operator को `for` loop के साथ उपयोग करके यह काम कर सकते हैं।

पिछले “Operators” अध्याय में, हमने range operator सीखा था:

```swift
1...3   // 1, 2, 3
```

यहाँ `...` closed range को दर्शाता है, यानी इसमें starting point और ending point दोनों शामिल होते हैं।

इसलिए यहाँ, हम `1` से `50` तक की integer range पर `for` loop का उपयोग कर सकते हैं:

```swift
for i in 1...50 {
    
}
```

हमें इन integers को जोड़ना है, इसलिए total को store करने के लिए एक variable भी चाहिए:

```swift
var count = 0
```

फिर हर loop में, वर्तमान में निकाले गए number को `count` में जोड़ दें:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

इस code का अर्थ है:

* `count` वर्तमान total को store करने के लिए उपयोग होता है
* `for` loop `1` से `50` तक के integers को एक-एक करके निकालेगा
* हर बार जब एक integer निकलेगा, `count += i` एक बार execute होगा
* loop समाप्त होने के बाद, `count` में अंतिम total store होगा

इस तरह, हम `50` तक के सभी positive integers का sum प्राप्त कर सकते हैं।

इसी तरह, यदि हमें `1` से `100` तक के integers का sum निकालना हो, तो हमें सिर्फ range बदलनी होगी:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` loop सिर्फ arrays पर ही नहीं, बल्कि range पर भी loop कर सकता है। Data को क्रम से बार-बार process करने की यह क्षमता development में बहुत सामान्य है।

यह हमें बहुत से दोहराव वाले काम अपने आप संभालने में मदद कर सकता है, ताकि हमें हर number का addition या अन्य समान दोहराव वाले operations हाथ से न लिखने पड़ें।

## SwiftUI में लूप

ऊपर वाला `for` loop Swift language का हिस्सा है।

लेकिन SwiftUI में, हम view structure के अंदर सीधे `for` का उपयोग करके views generate नहीं कर सकते:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

ऐसा इसलिए है क्योंकि `VStack` के अंदर SwiftUI views होने चाहिए, जबकि सामान्य `for` loop स्वयं एक view नहीं है।

यदि हम SwiftUI में किसी array की contents के अनुसार बार-बार interface generate करना चाहते हैं, तो हमें `ForEach` का उपयोग करना होगा।

उदाहरण के लिए, यदि हमें किसी group के सभी members के names दिखाने हों, तो हम ऐसे लिख सकते हैं:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Display result:

![for1](../../Resource/017_for1.png)

फिर, हर `Text` में समान modifiers जोड़ें:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

अब हर `Text` छोटा और अधिक bold font में दिखाई देगा।

Display result:

![](../../Resource/017_for2.png)

हालाँकि modifiers interface को अधिक सुंदर बनाते हैं, लेकिन वे code को लंबा और अधिक दोहरावपूर्ण भी बना देते हैं।

यदि names लगातार बढ़ते जाएँ, या बाद में हमें font, color और अन्य styles को एक समान तरीके से बदलना हो, तो हमें बहुत सा समान code बार-बार लिखना और बदलना पड़ेगा। यह काफ़ी झंझट भरा है और maintain करने में भी सुविधाजनक नहीं है।

इस समय, हम पहले इन names को array में रख सकते हैं, और फिर SwiftUI में `ForEach` का उपयोग करके array के data के अनुसार बार-बार views generate कर सकते हैं:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

यह code अधिक संक्षिप्त है। `ForEach` array के हर element को एक-एक करके पढ़ेगा और संबंधित content को interface में display करेगा।

जब हम बाद में नए names जोड़ेंगे, तो हमें सिर्फ `names` array के names को modify करना होगा। हर बार फिर से `Text` और जटिल modifiers जोड़ने की आवश्यकता नहीं होगी।

## ForEach

`ForEach` SwiftUI में views को बार-बार generate करने के लिए उपयोग की जाने वाली structure है। आप इसे SwiftUI में `for` loop जैसी structure के रूप में समझ सकते हैं।

मूल उपयोग:

```swift
ForEach(array, id: \.self) { तत्व in
    SwiftUI कोड
}
```

उदाहरण के लिए, अभी वाले group names:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

इस code का अर्थ है:

`names` वह array है जिस पर loop चल रहा है, यानी वह data जिसे display करना है।

`id:\.self` का अर्थ है array के element को ही हर item को अलग पहचानने के लिए उपयोग करना।

वर्तमान उदाहरण में, array में strings store हैं:

```swift
["Sam", "John", "Wathon", "Bob"]
```

इसलिए SwiftUI सीधे `"Sam"`、`"John"`、`"Wathon"` और `"Bob"` जैसी strings का उपयोग अलग-अलग content को पहचानने के लिए करेगा।

शुरुआती चरण में आम `String` और `Int` जैसी simple arrays के लिए, हम सामान्यतः सीधे ऐसे लिख सकते हैं:

```swift
id: \.self
```

फिलहाल आपको सिर्फ यही एक लिखने का तरीका याद रखना है। `id` के और नियमों में गहराई से जाने की अभी आवश्यकता नहीं है।

`item in` में `item` वर्तमान में निकाले गए element को दर्शाता है।

उदाहरण के लिए, पहले loop में `item` `"Sam"` है, और दूसरे loop में `item` `"John"` है।

इसलिए:

```swift
Text(item)
```

एक-एक करके यह बन जाएगा:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

इसलिए, इस code का काम है: `names` array से हर नाम को एक-एक करके निकालना, और हर नाम के लिए एक `Text` view generate करना।

### execution process

execution process को इस तरह समझा जा सकता है:

* `ForEach` पहले `names` array का पहला element `"Sam"` पढ़ता है
* `item` अस्थायी रूप से `"Sam"` को represent करता है
* `Text(item)` `"Sam"` को display करता है
* फिर वह अगला element `"John"` पढ़ता है
* और फिर वही view code दोबारा execute करता है

अंत में, array के सभी names display हो जाएँगे।

इस तरह लिखने का फायदा यह है कि जब names बढ़ जाएँ, तो हमें बहुत सारे `Text` बार-बार लिखने की ज़रूरत नहीं होगी, सिर्फ array की contents को modify करना होगा।

### फोटो पर लूप

`ForEach` सिर्फ text ही नहीं, बल्कि images, colors, या अन्य SwiftUI views भी display कर सकता है।

उदाहरण के लिए, हम 4 images तैयार करते हैं:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

इन चार images को Xcode के Assets folder में drag करें।

![image](../../Resource/017_for3.png)

यदि हम `ForEach` का उपयोग नहीं करते, तो हमें हर image को हाथ से लिखना पड़ेगा:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Display result:

![image](../../Resource/017_for4.png)

यह तरीका functionality तो दे सकता है, लेकिन code अपेक्षाकृत लंबा हो जाएगा।

यदि images बढ़ती जाएँ, तो हमें और अधिक `Image` code बार-बार लिखना पड़ेगा।

यदि बाद में हमें image size को एक समान तरीके से बदलना हो, तो हमें एक-एक करके उन्हें बदलना पड़ेगा।

इस समय, हम image names को एक array में रख सकते हैं, और फिर `ForEach` का उपयोग करके बार-बार image views generate कर सकते हैं:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

यहाँ `images` एक string array है, और array का हर element एक image name है।

`ForEach(images, id: \.self)` का अर्थ है `images` array के हर element को एक-एक करके पढ़ना, element को ही हर item को अलग पहचानने के लिए उपयोग करना, और फिर वर्तमान element के अनुसार संबंधित view generate करना।

उदाहरण के लिए, यदि पहला पढ़ा गया element `"430F9BEF"` है, तो:

```swift
Image(item)
```

इसका अर्थ यही है:

```swift
Image("430F9BEF")
```

इसके बाद की images भी इसी तरह एक-एक करके display होंगी।

![image](../../Resource/017_for4.png)

यहाँ भी हम अब तक यह उपयोग कर रहे हैं:

```swift
id: \.self
```

कारण वही है जैसा पहले था: क्योंकि `images` array के elements भी simple string types हैं, इसलिए शुरुआती चरण में हम सीधे element को ही पहचान के रूप में उपयोग कर सकते हैं।

इसे एक सरल निश्चित सूत्र की तरह समझा जा सकता है:

**जब `ForEach` `String` या `Int` जैसी simple array पर loop करता है, तो सामान्यतः `id: \.self` लिखा जाता है।**

### नई images जोड़ना

यदि बाद में हमें नई images जोड़नी हों, तो हमें सिर्फ array की contents को modify करना होगा:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

हमें फिर से नया `Image` code बार-बार लिखने की आवश्यकता नहीं होगी।

यदि images अधिक हों, तो इसे `ScrollView` के साथ उपयोग किया जा सकता है। अन्यथा, content screen से बाहर निकल जाएगा और पूरी तरह preview नहीं किया जा सकेगा।

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### images को modify करना

जब हमें सभी images की style को एक समान तरीके से बदलना हो, तो हमें सिर्फ `ForEach` के अंदर के code को बदलना होता है।

उदाहरण के लिए, width को `80` कर दें:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

इस तरह, सभी images एक साथ बदल जाएँगी, और हमें एक-एक करके बदलाव नहीं करना पड़ेगा।

यही `ForEach` का एक महत्वपूर्ण कार्य है:

**जब कई views की structure एक जैसी हो और सिर्फ content अलग हो, तो हम view code सिर्फ एक बार लिख सकते हैं, और array का data तय करेगा कि क्या display करना है।**

## सारांश

इस पाठ में, हमने `for` loop और `ForEach` सीखा।

`for` loop का उपयोग किसी array या range के elements को क्रम से process करने के लिए किया जाता है, और यह अधिक data processing की ओर झुकता है।

`ForEach` का उपयोग SwiftUI में array की contents के आधार पर बार-बार views generate करने के लिए किया जाता है, और यह अधिक view display की ओर झुकता है।

वर्तमान शुरुआती चरण में, `ForEach` का सबसे सामान्य रूप यह है:

```swift
ForEach(array, id: \.self) { तत्व in
    SwiftUI कोड
}
```

यहाँ `id: \.self` का अर्थ है हर element को अलग पहचानने के लिए element को ही उपयोग करना।

जब array की contents `String` और `Int` जैसे simple types हों, तो हम सामान्यतः इसी एक लिखने के तरीके से शुरुआत कर सकते हैं।

आगे चलकर, जब आप किसी वेबसाइट या App में बार-बार दिखाई देने वाला text, images या अन्य list content देखें, तो आप सोच सकते हैं कि SwiftUI में ऐसी सामग्री सामान्यतः पहले array में रखी जाती है, और फिर `ForEach` के माध्यम से एक-एक करके display की जाती है।
