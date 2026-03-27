# Swift और SwiftUI

Apple platform development सीखते समय, कई tutorials Swift और SwiftUI को अलग-अलग समझाते हैं। इससे beginners को अक्सर एक तरह का disconnect महसूस होता है, और वे समझ बैठते हैं कि ये दो पूरी तरह स्वतंत्र technologies हैं।

वास्तव में, Swift और SwiftUI गहराई से जुड़े हुए एक whole हैं: Swift programming language है, जो logic और data प्रदान करती है; जबकि SwiftUI Swift पर आधारित user interface framework है, जो views की rendering और interaction के लिए ज़िम्मेदार है।

यह पाठ आपको एक स्पष्ट understanding framework बनाने में मदद करेगा: Swift क्या है, SwiftUI क्या है, और code में ये दोनों कैसे मिलकर काम करते हैं।

## Swift क्या है?

Swift Apple द्वारा जारी की गई एक आधुनिक programming language है, जिसका उपयोग iOS, macOS, watchOS और tvOS जैसे platforms पर applications विकसित करने के लिए किया जाता है।

![swift](../../RESOURCE/010_swift.png)

Swift एक strongly typed, static language है। इसका design safety पर अधिक ध्यान देता है, जिससे बहुत सी सामान्य programming errors (जैसे null pointer, out-of-bounds आदि) कम हो जाती हैं। यह C और Objective-C के साथ seamless integration भी support करती है।

वास्तविक development में, Swift अधिकतर application के logic भाग के लिए ज़िम्मेदार होती है, जैसे data processing, network requests, storage operations आदि।

## SwiftUI क्या है?

SwiftUI Apple द्वारा 2019 में जारी किया गया एक नया interface-building framework है। SwiftUI declarative programming model अपनाता है, जिससे developers कम code में interface structure और interaction behavior को describe कर सकते हैं।

![swiftui](../../RESOURCE/010_swiftui.png)

declarative programming का अर्थ है कि developer केवल यह बताता है कि क्या दिखाना है; system data के बदलाव के अनुसार view को अपने आप refresh कर देता है। अब interface state को manually update करने की आवश्यकता नहीं होती, जिससे UI development की complexity काफी कम हो जाती है।

SwiftUI का core view components (`Text`、`Image`、`Button` आदि) और layout containers (`VStack`、`HStack`、`ZStack`) हैं। ये components data binding और state management के माध्यम से interact करते हैं, जिससे interface data changes के प्रति responsive रहती है और automatically refresh हो जाती है।

## Swift और SwiftUI कैसे सहयोग करते हैं?

Swift और SwiftUI की responsibilities को नीचे दिए गए बिंदुओं में संक्षेपित किया जा सकता है:

**1. Swift: logic और data को handle करना**

Swift मुख्य रूप से data manage करने, state store करने और logic execute करने के लिए उपयोग होती है। इस प्रकार का code सामान्यतः interface rendering को सीधे प्रभावित नहीं करता, बल्कि data और behavior को handle करता है।

उदाहरण के लिए, Swift में data process करना:

```swift
let markdown = try? String(contentsOf: url)
```

इस प्रकार के code में variable declaration, constant definition, function, control flow आदि शामिल होते हैं, और ये सीधे view display को प्रभावित नहीं करते।

**2. SwiftUI: interface को declare और render करना**

SwiftUI user interface की layout और content बनाने के लिए उपयोग होती है, और मुख्य रूप से interface rendering और view interaction की ज़िम्मेदारी लेती है।

उदाहरण के लिए, SwiftUI से एक text view बनाना:

```swift
Text("SwiftSlim")
```

ये code interface elements को बनाने और नियंत्रित करने के लिए है, और सीधे user interface के साथ interact करती है।

### basic example

नीचे एक सरल SwiftUI example है:

```swift
// ContentView.swift

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

इस example में:

**SwiftUI code**: `VStack`、`Image`、`Text`、`padding` सभी SwiftUI से संबंधित हैं, और interface display तथा layout के लिए ज़िम्मेदार हैं।

**Swift code**: file के शीर्ष पर `//` comment और `import SwiftUI` Swift code structure का हिस्सा हैं; नीचे का `#Preview` Xcode preview के लिए macro है, जो वास्तविक interface rendering में भाग नहीं लेता।

### advanced example

वास्तविक projects में, Swift और SwiftUI अक्सर साथ में उपयोग किए जाते हैं, ताकि दोनों अपनी-अपनी strengths के अनुसार काम कर सकें:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

इस example में:

**SwiftUI code**: `@State` SwiftUI का विशेष property wrapper है, जो view की mutable state declare करने के लिए उपयोग होता है; `Button` और `Text` SwiftUI view components हैं, जो interface display और user interaction के लिए ज़िम्मेदार हैं।

**Swift code**: `private var name` और `func printName()` Swift code हैं, जो data store और logic execute करते हैं, लेकिन view rendering को सीधे प्रभावित नहीं करते।

जब user बटन click करता है, तो SwiftUI बटन के अंदर के operation code को trigger करता है:

```swift
Button("Print") {
    printName()
}
```

इसमें `Button` SwiftUI component है, जबकि execute होने वाला `printName()` function Swift code है, जो specific logic को handle करता है।

इस प्रकार Swift और SwiftUI बिना किसी बाधा के साथ मिलकर काम करते हैं: Swift data और logic को handle करती है, जबकि SwiftUI user interface को प्रस्तुत करती है।

## Swift और SwiftUI code आम तौर पर कहाँ लिखे जाते हैं?

SwiftUI में, interface `body` property द्वारा लौटाई गई views से बनती है। इसलिए, interface को describe करने वाला सारा code सामान्यतः `body` के भीतर लिखा जाता है।

उदाहरण:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

इस example में `Text` SwiftUI view component है, इसलिए इसे `body` में लिखना आवश्यक है, क्योंकि SwiftUI `body` को पढ़कर interface generate करता है।

जो code interface से संबंधित नहीं है, जैसे variables, functions या data processing logic, वे सामान्यतः `body` के बाहर लिखे जाते हैं। उदाहरण:

```swift
struct ContentView: View {

    // Swift: data या logic
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interface
    var body: some View {
        Text(name)
    }
}
```

ध्यान देने योग्य बात यह है कि `body` के भीतर भी Swift syntax का उपयोग हो सकता है, जैसे `if`、`for` आदि control flow statements। वे केवल SwiftUI views की generation को नियंत्रित करने के लिए उपयोग होते हैं:

```
if isLogin {
    Text("Welcome")
}
```

इसलिए, SwiftUI development में सरल रूप से ऐसे समझ सकते हैं: view code (`Text`、`Image`、`Button` आदि) सामान्यतः `body` में लिखा जाता है; data और logic code (variables, functions आदि) सामान्यतः `body` के बाहर लिखे जाते हैं।

## Swift files

जैसे-जैसे सीखना आगे बढ़ेगा, हम MVVM architecture से भी परिचित होंगे। इसमें `ViewModel` और `Model` layers सामान्यतः pure Swift code से बनी होती हैं, और view layer (`SwiftUI`) से पूरी तरह अलग रहती हैं।

उदाहरण के लिए, app state manage करने वाली class:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

या data structure describe करने वाली struct:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

ऐसी files की ज़िम्मेदारी data को manage और persist करना है। वे सीधे view में display नहीं होतीं, इसलिए वे पूरी तरह Swift के अंतर्गत आती हैं।

## ऐतिहासिक पृष्ठभूमि

Swift और SwiftUI के संबंध को समझने के लिए Apple development technologies के evolution को समझना भी ज़रूरी है। 2026 तक इस tech stack ने कई iterations देखी हैं।

### Swift का इतिहास

Swift के आने से पहले, Objective-C Apple platform की मुख्य programming language थी, और यह C language के साथ mixed code support करती थी। इसकी syntax अपेक्षाकृत लंबी थी, और beginners के लिए इसका learning barrier ऊँचा था:

```Obj-c
// Objective-C syntax
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 में Apple ने WWDC पर Swift language जारी की। Swift की syntax अधिक modern है, type safety अधिक है, और इसने धीरे-धीरे Objective-C की जगह मुख्य development language के रूप में ले ली:

```swift
// Swift syntax
let name = "Fang"
print("Hello, \(name)")
```

लेकिन Objective-C पूरी तरह history से बाहर नहीं हुई। यह आज भी कई legacy projects और low-level frameworks में व्यापक रूप से उपयोग की जाती है। इसकी basic syntax को समझना पुराने projects को maintain करने और system internals समझने में अब भी उपयोगी है।

### SwiftUI का इतिहास

SwiftUI के आने से पहले, iOS में **UIKit** और macOS में **AppKit** उपयोग होते थे। ये दोनों frameworks "imperative" programming style अपनाते थे। developers को Storyboard के माध्यम से controls drag-and-drop करने पड़ते थे, या manually code लिखकर view state control करनी पड़ती थी। code की मात्रा अधिक होती थी, maintenance cost भी अधिक होती थी, और complex interface logic में यह समस्या और स्पष्ट हो जाती थी।

![storyboard](../../RESOURCE/010_xcode.png)

2019 में Apple ने WWDC पर SwiftUI को आधिकारिक रूप से जारी किया। SwiftUI ने "declarative" programming paradigm पेश किया, जिससे UI development process काफी सरल हो गया।

![storyboard](../../RESOURCE/010_xcode1.png)

ध्यान देने योग्य बात यह है कि SwiftUI पूरी तरह independent low-level implementation नहीं है। अलग-अलग platforms पर यह मूल रूप से UIKit (iOS) या AppKit (macOS) के साथ bridge और collaborate करती है; इसके पीछे underlying execution अब भी इन frameworks पर निर्भर करती है।

### Swift और UIKit/AppKit का संबंध

हालाँकि Swift एक general-purpose programming language है, और Apple के सभी platforms पर चल सकती है, लेकिन यह UIKit या AppKit को पूरी तरह replace नहीं कर सकती। कुछ complex interface requirements के लिए, या ऐसी functionality के लिए जिन्हें SwiftUI अभी तक cover नहीं करता, UIKit या AppKit की मदद अभी भी ज़रूरी होती है।

उदाहरण के लिए, UIKit complex view controller management, animation effects, gesture recognition आदि के मामले में पहले से बहुत mature है, और production-level practices का विशाल अनुभव संचित कर चुका है। SwiftUI की capabilities इन क्षेत्रों में लगातार बढ़ रही हैं, लेकिन कुछ edge cases में अभी भी limitations मौजूद हैं।

इसलिए, बहुत से developers project में SwiftUI और UIKit (या AppKit) दोनों का मिश्रित उपयोग करते हैं, ताकि दोनों के advantages का पूरा लाभ लिया जा सके।

इस दृष्टिकोण से, SwiftUI को UIKit / AppKit के एक higher-level abstraction के रूप में समझा जा सकता है। SwiftUI सीखते समय UIKit और AppKit के basic concepts को भी थोड़ा समझना, पुराने projects maintain करने या complex features implement करने के समय अधिक उचित technical decisions लेने में मदद करता है।

## सारांश

**Swift**: मुख्य रूप से logic, data processing, control flow आदि लिखने के लिए उपयोग होती है; इसका view layout से सीधा संबंध नहीं होता।

**SwiftUI**: declarative रूप से user interface बनाने के लिए उपयोग होती है; view content और layout का code SwiftUI के अंतर्गत आता है।

वास्तविक development में Swift और SwiftUI सामान्यतः साथ में उपयोग होते हैं: Swift logic को handle करती है, SwiftUI interface को handle करती है।

Objective-C और UIKit से लेकर Swift और SwiftUI तक, Apple का development environment धीरे-धीरे अधिक modern और concise programming style की ओर बढ़ा है, लेकिन UIKit और AppKit को अब भी कई traditional projects में नज़रअंदाज़ नहीं किया जा सकता।

Swift और SwiftUI के संबंध को समझकर, हम iOS/macOS development अधिक कुशलता से कर सकते हैं, और legacy projects maintain करते समय भी अधिक उचित technical choices कर सकते हैं।
