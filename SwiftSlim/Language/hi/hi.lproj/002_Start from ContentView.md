# ContentView से शुरुआत

## पाठ से पहले की तैयारी

इस पाठ में हम `ContentView.swift` file से शुरुआत करेंगे और SwiftUI की बुनियादी संरचना को व्यवस्थित रूप से समझेंगे, जिसमें शामिल हैं:

- comments
- View structure
- `VStack` / `HStack` / `ZStack` layout
- `SF Symbols` icons
- view modifiers
- preview code `#Preview`

सबसे पहले, पहले बनाया गया Xcode project खोजें और `.xcodeproj` file पर double-click करें।

बाईं ओर `Navigator` क्षेत्र में `ContentView.swift` file चुनें।

ध्यान दें: हर बार project खोलने पर `Canvas` में `"Preview paused"` दिखाई दे सकता है। refresh button दबाने पर preview फिर से सक्रिय हो जाएगा।

![Swift](../../RESOURCE/002_view7.png)

## ContentView को समझना

`ContentView` का code:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

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

#Preview {
    ContentView()
}
```

हालाँकि code कम है, लेकिन इसमें SwiftUI की core structure शामिल है।

### 1. टिप्पणियाँ

file के शीर्ष पर:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

यह file comment है, जिसका उपयोग file information दर्ज करने के लिए किया जाता है। इसमें file name, project name, creator और creation time शामिल होते हैं।

Swift में single-line comment लिखने के लिए `//` का उपयोग किया जाता है:

```swift
// यह एक comment है
```

comments code readability बढ़ाते हैं और developers को code logic समझने में मदद करते हैं。

वास्तविक development में code कभी-कभी काफ़ी जटिल और अस्पष्ट हो सकता है। यदि comments न लिखे जाएँ, तो तीन दिन बाद खुद का code भी समझ में न आए, ऐसा होना बहुत सामान्य है।

इसलिए code लिखते समय सक्रिय रूप से comments जोड़ना एक अच्छा development habit है। comments का उपयोग करके logic दर्ज किया जा सकता है, जिससे बाद में maintenance आसान हो जाता है।

**अस्थायी रूप से code बंद करना**

comments का उपयोग code को अस्थायी रूप से disable करने के लिए भी किया जा सकता है, ताकि problem tracing की जा सके।

उदाहरण:

```
A
B
C
```

मान लें `A`、`B`、`C` तीन code sections हैं, और इनमें से एक में error है। हम अस्थायी रूप से comment लगाकर जाँच सकते हैं।

पहले `A` को comment करें:

```
// A
B
C
```

यदि `A` को comment करने के बाद code normal हो जाता है, तो इसका मतलब `A` में समस्या है।

यदि `A` को comment करने के बाद भी समस्या बनी रहती है, तो हम `B` को comment कर सकते हैं, और इसी तरह problem section का पता लगा सकते हैं।

development के दौरान बहुत सारी समस्याएँ आती हैं, और उनमें से कई बार हमें comment करके error का कारण ढूँढना पड़ता है। इससे problem वाले code को locate करना और BUG ढूँढना आसान होता है।

Xcode में shortcut key:

```
Command ⌘ + /
```

का उपयोग करके comment जल्दी add या remove किया जा सकता है।

### 2. SwiftUI framework import करना

```swift
import SwiftUI
```

इस line का अर्थ है `SwiftUI` framework को import करना।

SwiftUI के अंदर `View`、`Text`、`Image`、`VStack` जैसी types इसी framework से आती हैं।

यदि SwiftUI framework import नहीं किया जाए, तो Xcode error दिखाएगा:

```
Cannot find type 'View' in scope
```

अर्थात compiler `View` type को पहचान नहीं पा रहा।

### 3. View structure

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

पहली बार इस View structure को देखकर अजनबी लग सकता है, क्योंकि इसमें `struct`、`View`、`var`、`body`、`some` जैसे keywords हैं।

हमने अभी तक इन keywords को विस्तार से नहीं सीखा है। अभी इतना जानना काफ़ी है कि यह code `ContentView` नाम का एक `View` बना रहा है।

आप `View` को एक drawing board की तरह समझ सकते हैं, जिस पर हम drawing कर सकते हैं, और drawing का tool है SwiftUI।

उदाहरण:

![Swift](../../RESOURCE/002_view.png)

ऊपर की image में तीन pages दिख रहे हैं, और वास्तव में ये तीन अलग-अलग `View` हैं।

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

जब हम SwiftUI से app बनाते हैं, तो हर page एक `View` होता है।

### 4. SwiftUI code

`View` के भीतर SwiftUI code इस प्रकार होता है:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

इस SwiftUI code का अर्थ है: यह एक vertical layout है, जिसमें एक icon और एक text दिखाया गया है।

![Swift](../../RESOURCE/002_view1.png)

#### `VStack` layout

```swift
VStack { }  // vertical layout
```

`VStack` एक vertical layout container है। इसके अंदर की views ऊपर से नीचे क्रम में रखी जाती हैं।

![Swift](../../RESOURCE/002_view8.png)

SwiftUI में तीन सामान्य layouts हैं:

- `VStack` —— vertical arrangement
- `HStack` —— horizontal arrangement
- `ZStack` —— overlay arrangement (Z-axis)

```swift
HStack { }  // horizontal arrangement
ZStack { }  // overlay arrangement
```

इन layouts की व्यवस्था इस प्रकार समझी जा सकती है:

![Swift](../../RESOURCE/002_view2.png)

उदाहरण के लिए, यदि `HStack` का उपयोग करें:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

तो globe icon और text अब horizontal रूप में दिखेंगे।

![Swift](../../RESOURCE/002_view3.png)

जब हमें horizontal arrangement चाहिए, तब `HStack` उपयोग करते हैं। जब overlay arrangement चाहिए, तब `ZStack` उपयोग करते हैं।

#### `Image` और `SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

यह code एक globe icon दिखाता है, और यह icon Apple के `SF Symbols` icon system से आता है।

![Swift](../../RESOURCE/002_view9.png)

इस code का अर्थ है: एक globe icon दिखाना, बड़े आकार में, और accent color के साथ।

हम केवल globe icon ही नहीं, बल्कि अन्य icons भी दिखा सकते हैं।

उदाहरण के लिए, backpack icon:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**दूसरे icons कैसे दिखाएँ?**

इसके लिए Apple द्वारा प्रदान की गई system icon library `SF Symbols` का उपयोग करना होगा।

Apple Developer की आधिकारिक वेबसाइट खोलें और [SF Symbols](https://developer.apple.com/sf-symbols/) डाउनलोड करें।

![Swift](../../RESOURCE/002_sf.png)

`SF Symbols` app खोलें।

![Swift](../../RESOURCE/002_sf1.png)

बाईं ओर symbol categories, और दाईं ओर संबंधित icons दिखाई देंगे।

icon पर right-click करके `"Copy Name"` चुनें, और उसका string name कॉपी करें।

उदाहरण:

```
"globe"
"backpack"
"heart"
```

कॉपी किए गए icon name को `Image(systemName:)` में रखने पर अलग icon दिखाया जा सकता है।

ध्यान दें: हर `SF Symbols` icon का minimum supported system version होता है। यदि system version बहुत कम हो, तो icon दिखाई नहीं दे सकता। इसकी compatibility जानकारी `SF Symbols` app में देखी जा सकती है।

#### Modifiers

SwiftUI में modifier एक ऐसा method है, जिसका उपयोग view के appearance या behavior को बदलने के लिए किया जाता है।

modifier को कपड़ों की तरह समझा जा सकता है — एक ही view अलग “कपड़े” पहनकर अलग दिखेगा।

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` और `foregroundStyle`, `Image` view के modifiers हैं। ये `Image` की content बदले बिना उसकी appearance को modify करते हैं।

**1. `imageScale`**

```swift
.imageScale(.large)
```

यह `SF Symbols` icons के size को नियंत्रित करता है:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

आप अलग-अलग values बदलकर icon size में बदलाव देख सकते हैं।

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` foreground color को नियंत्रित करता है।

`.tint` वर्तमान environment का accent color दर्शाता है, जो iOS में डिफ़ॉल्ट रूप से नीला होता है।

यदि foreground color को लाल करना हो:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### `Text` view

`Text` एक text view है, जिसका उपयोग strings दिखाने के लिए किया जाता है।

```swift
Text("Hello, world!")
```

उदाहरण के लिए, मेरा नाम दिखाना:

```swift
Text("FangJunyu")
```

ध्यान दें: strings को हमेशा double quotes `""` में लिखा जाना चाहिए।

आप अपना नाम, फ़ोन नंबर आदि भी दिखाने की कोशिश कर सकते हैं।

#### `padding` margins

SwiftUI में `padding` का उपयोग view content और उसके boundary के बीच खाली जगह जोड़ने के लिए किया जाता है। यह “inner margin (padding / content inset)” कहलाता है।

```swift
HStack {
    ...
}
.padding()
```

ऊपर का code बताता है कि `HStack` view में system default padding जोड़ी गई है।

**`padding` क्या है?**

`padding` का अर्थ है “view content और उसकी boundary के बीच की खाली जगह”।

नीचे की image में, जब नीले `HStack` पर padding सेट किया जाता है, तो नीला क्षेत्र अंदर की ओर सिकुड़ जाता है, और देखने में थोड़ा छोटा लगता है।

![Swift](../../RESOURCE/002_view6.png)

**डिफ़ॉल्ट padding**

`padding()` modifier system-recommended standard spacing का उपयोग करता है।

```swift
.padding()
```

विभिन्न platforms और contexts में इसका value अलग हो सकता है। उदाहरण:

- iOS में सामान्यतः लगभग `16 pt`
- macOS या watchOS में system spacing अलग हो सकती है, और यह platform design guideline पर निर्भर करती है

**Custom padding**

किसी specific दिशा के लिए अलग padding भी सेट की जा सकती है।

1. एक दिशा सेट करना

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

दिशाओं का अर्थ:

- `.top`: ऊपर की margin
- `.bottom`: नीचे की margin
- `.leading`: आगे की margin
- `.trailing`: पीछे की margin

![Swift](../../RESOURCE/002_view12.png)

ध्यान दें: `leading` और `trailing` language direction के अनुसार अपने-आप adapt होते हैं। उदाहरण के लिए Arabic (`RTL`) environment में ये अपने-आप उलट जाते हैं।

2. कई दिशाएँ एक साथ सेट करना

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

array के माध्यम से कई दिशाओं को एक साथ specify किया जा सकता है। array का विस्तृत उपयोग आगे के ट्यूटोरियल में आएगा; यहाँ केवल इस syntax को पहचानना पर्याप्त है।

3. horizontal या vertical दिशाओं के लिए सेट करना

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

यह इनके बराबर है:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**padding हटाना**

यदि कोई padding नहीं चाहिए, तो `.padding(0)` का उपयोग किया जा सकता है:

```swift
.padding(0)
```

या padding modifier को सीधे हटा भी सकते हैं:

```swift
// .padding()
```

### 6. Preview code

```swift
#Preview {
    ContentView()
}
```

यह code Canvas में `ContentView` का preview बनाता है।

ध्यान दें: `#Preview` Swift 5.9 / Xcode 15 में introduced नई syntax है। इससे पहले `PreviewProvider` structure का उपयोग होता था।

**यदि Preview को comment कर दें तो क्या होगा?**

यदि Preview को comment कर दिया जाए:

```swift
// #Preview {
//    ContentView()
// }
```

तो Canvas renderable content नहीं दिखाएगा।

![Swift](../../RESOURCE/002_xcode.png)

यानी Canvas में preview दिखाने को `#Preview` नियंत्रित करता है।

जब हमें Xcode में SwiftUI view preview करना हो, तो `#Preview` code जोड़ना चाहिए। यदि preview की ज़रूरत नहीं हो, तो इसे comment या delete किया जा सकता है।

## सारांश

हालाँकि `ContentView.swift` file का code बहुत अधिक नहीं है, लेकिन इसमें SwiftUI के कई core concepts शामिल हैं। शुरुआती लोगों के लिए यह अपरिचित लग सकता है, लेकिन code structure को तोड़कर देखने से SwiftUI की प्रारंभिक समझ बनती है।

इस पाठ की पुनरावृत्ति करें तो सबसे पहले हमने comments `//` सीखे, जिनका उपयोग code logic समझाने या code को अस्थायी रूप से disable करने के लिए किया जा सकता है।

फिर हमने जाना कि SwiftUI file में `SwiftUI` framework import करना ज़रूरी है:

```swift
import SwiftUI
```

यदि framework import नहीं किया जाता, तो compiler `View` जैसी types को नहीं पहचान पाएगा।

इसके बाद हमने SwiftUI view की basic structure को समझा:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

यहाँ `ContentView` view का नाम है।

हमने तीन सामान्य layout containers भी सीखे: `VStack` (vertical arrangement), `HStack` (horizontal arrangement), और `ZStack` (overlay arrangement)।

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

इस code का अर्थ है: एक vertical container दिखाना, जिसके अंदर एक icon और एक text हो।

`Image` `SF Symbols` icons दिखा सकता है, और modifiers के माध्यम से icon का size और color नियंत्रित किया जा सकता है।

`Text` view text content दिखा सकता है।

`padding` view के चारों ओर एक transparent spacing जोड़ता है।

अंत में `#Preview` preview view है, जो Canvas में preview दिखा सकता है।

### पाठ के बाद अभ्यास

शुरुआती लोगों के लिए इस पाठ की सामग्री थोड़ा जटिल लग सकती है। आगे के अभ्यास से इसे बेहतर समझा जा सकता है:

- `SF Symbols` icon का नाम बदलें
- icon के foreground color को काला करें
- `VStack` को `HStack` में बदलें
- `Image` या `Text` को comment करके preview में बदलाव देखें

### बोनस: Code Completion

code लिखते समय आपने शायद ध्यान दिया होगा कि Xcode उपलब्ध विकल्पों की सूची अपने-आप दिखाता है।

उदाहरण के लिए, जब हम `imageScale` modifier बदलते हैं:

```swift
.imageScale(.)
```

तो Xcode available options दिखाएगा:

![Swift](../../RESOURCE/002_view10.png)

इसे `Code Completion` mechanism कहा जाता है। यह type inference और enum member suggestions पर आधारित होता है, और typing efficiency बढ़ाने तथा errors कम करने में मदद करता है।

आगे के पाठों में हम आधिकारिक रूप से `enum` का परिचय देंगे; अभी के लिए केवल इसका प्रारंभिक परिचय पर्याप्त है।
