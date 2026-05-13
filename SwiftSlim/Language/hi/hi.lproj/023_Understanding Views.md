# Views को समझना

इस पाठ में, हम फिर से सबसे शुरुआत वाले `ContentView` पर लौटते हैं।

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

जब हमने पहली बार SwiftUI से संपर्क किया था, तब `ContentView` में कई keywords थे जिन्हें हम समझ नहीं पाते थे।

जैसे `struct`, `View`, `var`, `body`, `some View` आदि keywords।

उस समय शायद हम केवल इतना जानते थे: **code को `body` के अंदर लिखने पर interface पर content दिखाई देगा।**

अब हम `struct`, variables, methods और protocols सीख चुके हैं, इसलिए हम इस code को फिर से समझ सकते हैं, ताकि SwiftUI views के बीच संबंध समझने में मदद मिले।

## ContentView को फिर से देखना

SwiftUI project बनाने के बाद, Xcode default रूप से एक `ContentView` file generate करता है।

Example code इस प्रकार है:

```swift
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
```

इस code को कई हिस्सों में बाँटकर समझा जा सकता है।

सबसे पहले:

```swift
import SwiftUI
```

यह line बताती है कि SwiftUI framework import किया जा रहा है।

SwiftUI import करने के बाद ही हम `View`, `Text`, `Image`, `VStack`, `Button` जैसे SwiftUI views का उपयोग कर सकते हैं।

## ContentView structure

यह line बताती है कि एक structure बनाया जा रहा है:

```swift
struct ContentView: View
```

जिसमें:

```swift
struct ContentView
```

का अर्थ है कि `ContentView` एक structure है।

पिछले पाठ में हमने `struct` structure के बारे में सीखा था। यह अलग-अलग field structures को एक साथ जोड़ सकता है, और इसमें properties और methods शामिल हो सकते हैं।

उदाहरण के लिए:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

इस example में, `ContentView` के अंदर तीन चीजें शामिल हैं: `name`, `printName` और `body`।

यानी `struct` संबंधित properties, methods और view content को एक साथ व्यवस्थित कर सकता है।

![contentView](../../Resource/023_contentVIew.png)

## View एक protocol है

इस line को आगे देखें:

```swift
struct ContentView: View 
```

colon के बाद वाला `View` बताता है: `ContentView` `View` protocol को follow करता है।

इसे ऐसे समझ सकते हैं कि अगर `ContentView` SwiftUI view बनना चाहता है, तो उसे `View` protocol की requirements पूरी करनी होंगी।

### Identifiable protocol

पहले movie list सीखते समय, हमने `Identifiable` protocol से परिचय किया था।

उस समय हमें `ForEach` में `Movie` array को traverse करना था, लेकिन `Movie` structure में unique identifier नहीं था, इसलिए वह `ForEach` traversal को support नहीं करता था।

तब हमें `Movie` structure को `Identifiable` protocol follow करवाना पड़ा, ताकि वह `ForEach` की unique identifier requirement को पूरा करे।

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protocol की requirement है: **इस type के पास खुद को identify करने वाला एक `id` field हो।**

जब `Movie` एक `id` field देता है, तो वह `Identifiable` की requirement पूरी कर सकता है।

इस तरह जब हम इसे `ForEach` में उपयोग करते हैं, SwiftUI हर data item को पहचान सकता है।

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protocol

`View` protocol भी इसी तरह है।

अगर कोई type SwiftUI view बनना चाहता है, तो उसे `View` protocol follow करना होगा।

और `View` protocol की सबसे महत्वपूर्ण requirement है कि वह एक `body` provide करे।

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

इसे ऐसे समझा जा सकता है कि `View` protocol की requirement है: **केवल `body` द्वारा लौटाए गए SwiftUI view को स्वीकार किया जाता है, और `ContentView` `body` के माध्यम से SwiftUI view दिखाता है।**

### अगर View follow न करें तो क्या होगा?

अगर हम इस तरह लिखें:

```swift
struct ContentView {
}
```

यह सिर्फ एक ordinary structure है, SwiftUI view नहीं।

यह सीधे error नहीं देगा, क्योंकि ordinary structure अपने आप में valid Swift code है।

लेकिन अगर हम इसे preview में रखें:

```swift
#Preview {
    ContentView()
}
```

तब error आएगा।

कारण है: **preview को एक SwiftUI view display करना होता है, लेकिन यह `ContentView` `View` protocol follow नहीं करता।**

इसलिए अगर हम चाहते हैं कि `ContentView` interface पर display हो, तो उसे `View` protocol follow करवाना होगा:

```swift
struct ContentView: View {
}
```

साथ ही, `View` protocol की requirement के अनुसार `body` provide करना होगा। अगर `body` नहीं है, तो compiler फिर भी error देगा।

सही लिखने का तरीका:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

इस समय `ContentView` सचमुच display होने वाला SwiftUI view बनता है।

## body view display का entry point है

SwiftUI में, `body` view content का entry point है।

```swift
var body: some View {
    Text("Hello, world!")
}
```

इसे तीन हिस्सों में बाँटा जा सकता है:

**1. var body**

```swift
var body
```

इसका अर्थ है कि `body` नाम की variable define की गई है।

**2. some View**

```swift
: some View
```

इसका अर्थ है कि यह `body` एक view return करेगा।

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

यह display होने वाला view content है। इस code में एक `Text` view display होता है।

यानी `body` के अंदर जो लिखा जाता है, interface पर वही दिखाई देता है।

उदाहरण के लिए:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

यह code बताता है: **interface पर vertically arranged content display होगा, जिसमें दो texts हैं।**

### body नाम को मनमाने ढंग से बदला नहीं जा सकता

ध्यान देने की बात है कि `body` नाम को casually बदला नहीं जा सकता।

अगर इसे इस तरह लिखें:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

यह `content` भी एक view property है, लेकिन यह `body` की जगह नहीं ले सकता।

क्योंकि `View` protocol की required name ठीक `body` ही है।

## some View क्या है?

SwiftUI में, `some View` का अर्थ है कि एक concrete view return होगा, बस हमें उस view का पूरा type लिखने की जरूरत नहीं है।

```swift
var body: some View
```

यानी `some View` का मतलब यह नहीं कि type नहीं है। असली type अब भी मौजूद है, compiler उस type को जानता है, लेकिन वह type बहुत complex हो सकता है, इसलिए Swift हमें `some View` का उपयोग करके उसे hide करने देता है।

### some क्या है?

Swift में, `some` opaque type declare करने वाला keyword है।

opaque type का अर्थ है: **return value का एक concrete type होता है, compiler जानता है कि वह concrete type क्या है, लेकिन हम उस concrete type को सीधे नहीं लिखते।**

उदाहरण के लिए:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

इसका अर्थ है कि `makeView` एक ऐसा concrete type return करेगा जो `View` protocol follow करता है।

### some की जरूरत क्यों है?

variables सीखते समय हमने जाना था: **Swift में values को या तो explicit type annotation चाहिए, या compiler automatically type infer करता है।**

उदाहरण के लिए:

```swift
let a: Int = 10
```

यहाँ constant `a` का type `Int` है।

SwiftUI views भी इससे अलग नहीं हैं। जब हम `body` से SwiftUI view display करते हैं, तो `body` को corresponding SwiftUI type return करवाना होता है।

उदाहरण के लिए, अगर हम `body` से एक `Text` text view display करते हैं, तो हमें `body` को corresponding `Text` type return करवाना होगा।

```swift
var body: Text {
    Text("Fang Junyu")
}
```

इस example में, `body` के अंदर display होने वाला view एक `Text` view है, और return type भी `Text` है।

केवल जब अंदर का type और declared type same हों, तभी compiler की type consistency requirement पूरी होती है।

**Type mismatch problem**

अगर हम `body` का type `Color` set करें, लेकिन display `Text` करें:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` का type और अंदर के code का type inconsistent होगा, इसलिए type mismatch error trigger होगा।

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

इस समय हमें manually `body` का return type बदलना होगा।

**Complex view types**

Actual development में, interface में आमतौर पर केवल एक `Text` नहीं होता।

अगर अधिक complex `VStack` display करना हो, तो हमें manually complex return type annotate करना पड़ेगा।

उदाहरण के लिए:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

यह code बताता है कि एक `VStack` return हो रहा है, जिसके अंदर `Image` और `Text` type के views हैं।

`body` का return type है:

```swift
VStack<TupleView<(Image,Text)>>
```

देख सकते हैं कि यह return type बहुत complex है, और इसमें एक नया `TupleView` भी है जिसे हमने पहले नहीं देखा था।

`TupleView` को यहाँ ऐसे समझ सकते हैं: **कई child views को एक view में wrap करना।**

**और भी complex view types**

अगर हम view में modifiers add करें:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

तो इस view का return type बहुत complex हो जाएगा, जिसे यहाँ specifically describe करना संभव नहीं।

मौजूदा return type `VStack<TupleView<(Image,Text)>>` modifiers को describe नहीं कर पाएगा, इसलिए error आएगा।

**some View return type को सरल करता है**

ऐसी स्थिति में SwiftUI एक concise solution देता है, यानी `some View` से लिखावट सरल करना।

जब हम `body` को `some View` type में बदलते हैं:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

हर बार view code बदलने पर हमें पूरा return type फिर से लिखने की जरूरत नहीं रहती।

क्योंकि `some View` का अर्थ है कि एक ऐसा concrete view return किया जा रहा है जो `View` protocol follow करता है।

दूसरे शब्दों में, `VStack`, `Image` आदि SwiftUI views सभी `View` protocol follow करते हैं। Modifier add करने के बाद return होने वाला view type भी `View` protocol follow करता है।

इसलिए ये सभी `some View` के रूप में return हो सकते हैं।

### some View कोई भी view मनमाने ढंग से return नहीं कर सकता

`some View` complex types को hide कर सकता है, लेकिन यह "type नहीं है" ऐसा नहीं है।

इसका core rule है: **compiler को एक concrete return type determine कर पाना चाहिए**।

उदाहरण के लिए:

```swift
var title: some View {
    Text("Hello")
}
```

यहाँ return होने वाला view `Text` है।

लेकिन अगर दो views return करने की कोशिश करें, तो error होगा:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

क्योंकि `some View` को अंत में एक view structure return करना होता है, जबकि यहाँ दो independent views return करने की कोशिश की जा रही है।

### Solution

आम तौर पर दो solutions होते हैं: container और `@ViewBuilder`।

**1. container से wrap करें**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

इस code में, `title` एक `VStack` return करता है, और `Text` तथा `Image` `VStack` के अंदर child views हैं।

`some View` द्वारा accepted view structure एक `VStack<...>` है, इसलिए यह `some View` की एक view structure return करने वाली requirement पूरी करता है। 

यही कारण है कि SwiftUI सीखने की शुरुआत से हम सबसे बाहरी layer में `VStack` container से view code wrap करने की सलाह देते हैं।

**2. @ViewBuilder का उपयोग करें**

हम `some View` से पहले `@ViewBuilder` modifier भी add कर सकते हैं:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` कई views को एक return result में combine कर सकता है।

इसका essence फिर भी कई views को एक view में merge करना है, ताकि `some View` की एक view structure return करने वाली requirement पूरी हो।

### body में सीधे कई views क्यों लिख सकते हैं?

अगर हम `var body` में कई views लिखें, जैसे:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

कुछ स्थितियों में ऐसा `body` error नहीं देगा।

कारण यह है कि `View` protocol में `body` default रूप से `@ViewBuilder` support करता है:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protocol के source code में हम देख सकते हैं कि `@ViewBuilder` पहले से `body` variable को modify कर चुका है।

इसलिए `body` ordinary `some View` की तुलना में एक अतिरिक्त special handling रखता है, जिससे SwiftUI automatically कई views को एक view में combine कर देता है।

**Container उपयोग करने की recommendation**

Beginners के लिए समझना आसान बनाने हेतु, कई views organize करने में पहले `VStack`, `HStack`, `ZStack`, `Group` आदि containers उपयोग करने की सलाह दी जाती है।

उदाहरण के लिए:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

इस तरह code अधिक intuitive है: **outer layer एक `VStack` है, और अंदर दो child views रखे गए हैं।**

## Views को split करना

अगर interface अपेक्षाकृत simple है, तो हम सारा code `body` में लिख सकते हैं।

उदाहरण के लिए:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote में आपका स्वागत है")
                Text("सुप्रभात")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("मुझे क्लिक करें") {
                print("मुझे क्लिक करें ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

इस view की display style:

![view](../../Resource/023_view1.png)

यह code normal रूप से run कर सकता है, लेकिन अगर view code बहुत complex हो जाए, तो `body` में code अधिक से अधिक लंबा होता जाएगा, और पढ़ने तथा modify करने की difficulty बढ़ती जाएगी।

इस समय हम अलग-अलग areas को independent view properties में split कर सकते हैं।

### Top view को split करना

उदाहरण के लिए, top area को split करें:

```swift
var topHome: some View {
    HStack {
        Text("होम")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

यहाँ `topHome` एक variable है, जो एक view return करता है।

क्योंकि return होने वाला content view है, इसलिए type इस तरह लिखा जा सकता है:

```swift
some View
```

यह वास्तव में `body` जैसा ही usage है:

```swift
var topHome: some View { }
var body: some View { }
```

दोनों variables का उपयोग view display करने के लिए करते हैं, और return type `some View` है।

### अन्य views को split करना

फिर, दूसरे parts को आगे split करें:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote में आपका स्वागत है")
        Text("सुप्रभात")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("मुझे क्लिक करें") {
        print("मुझे क्लिक करें")
    }
    .buttonStyle(.borderedProminent)
}
```

split करने के बाद, view variables को `body` में रखा जा सकता है:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("होम")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote में आपका स्वागत है")
            Text("सुप्रभात")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("मुझे क्लिक करें") {
            print("मुझे क्लिक करें")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

अब `body` केवल page structure describe करने के लिए responsible है:

```swift
topBar
welcomeText
colorList
clickButton
```

हर part की concrete implementation नीचे corresponding property में रखी गई है।

इस तरह view split करने से page structure अधिक clear हो सकता है, हर view area का अपना name होता है, और reading ज्यादा intuitive होती है।

जब किसी part का code modify करना हो, तो corresponding view area सीधे मिल जाता है, न कि complex code के ढेर में खोजनी पड़ती है।

### some View single view return करता है

इस split view में, अगर हम multiple views return करने की कोशिश करें:

```swift
var topBar: some View {
    Text("होम")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` केवल एक view structure return कर सकता है, इसलिए error होगा।

`body` से अलग, ordinary computed property में default रूप से `@ViewBuilder` नहीं होता।

इसलिए अगर हमें multiple views return करने हों, तो `VStack`, `HStack` या `Group` container का उपयोग करके multiple views को एक में combine कर सकते हैं।

```swift
var topBar: some View {
    VStack {
        Text("होम")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

या `@ViewBuilder` add करके views combine करें:

```swift
@ViewBuilder
var topBar: some View {
    Text("होम")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

इस तरह हम multiple views return कर सकते हैं।

### if multiple views return करे

उदाहरण के लिए:

```swift
var topHome: some View {
    if step == "होम" {
        HStack {
            Text("होम")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("कुछ नहीं")
    }
}
```

इस code में, `topHome` `step` के content के अनुसार `HStack` या `Text` दो अलग-अलग type के views return करेगा।

क्योंकि `some View` को एक determined concrete return type चाहिए, ordinary computed property में `if` की दो branches सीधे अलग-अलग type के views return नहीं कर सकतीं, इसलिए error होगा।

**Solution अभी भी container से wrap करना, या `@ViewBuilder` modifier का उपयोग करना है।**

### Split view में parentheses क्यों नहीं लगाते

जब `body` में split की गई view properties का उपयोग करते हैं, तो हम सीधे लिखते हैं:

```swift
topBar
welcomeText
colorList
clickButton
```

ना कि इस तरह:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

क्योंकि `topBar`, `welcomeText`, `colorList`, `clickButton` variables हैं। ये variables वास्तव में computed properties हैं, methods नहीं।

**Properties को parentheses की जरूरत नहीं होती।**

अगर हम इन्हें method के रूप में लिखें, तो भी similar effect मिल सकता है:

```swift
func topBar() -> some View {
    HStack {
        Text("होम")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

यह code भी similar effect achieve कर सकता है। इस method को call करने पर एक view return होगा।

उपयोग करते समय इसे इस तरह लिखना होगा:

```swift
topBar()
```

SwiftUI में, अगर केवल ऐसे view को split करना है जिसमें parameters pass करने की जरूरत नहीं, तो computed property वाला तरीका अधिक common है।

```swift
var topBar: some View { ... }
```

## Nested views

code को properties में split करने के अलावा, हम new view structures भी create कर सकते हैं।

उदाहरण के लिए:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

यह `PinkColorView`, `ContentView` की तरह ही एक independent SwiftUI view है।

अगर इसे `ContentView` में display करना हो, तो view name के बाद `()` add कर सकते हैं।

उदाहरण के लिए:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

यहाँ:

```swift
PinkColorView()
```

का अर्थ है कि एक `PinkColorView` instance बनाया जा रहा है।

क्योंकि `PinkColorView` ने `View` protocol follow किया है, इसलिए इसे `Text`, `Image`, `Button` की तरह दूसरे views में रखकर display किया जा सकता है।

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

यही view nesting है: एक view दूसरे view के अंदर display हो सकता है।

## View property या नया view बनाना?

जब view code relatively simple हो, तो आम तौर पर code split करने की जरूरत नहीं होती। केवल जब code complex हो जाए, तब view split करने की recommendation होती है।

### View property उपयोग करने की स्थिति

अगर यह current view के अंदर का सिर्फ एक छोटा content block है, तो view property उपयोग की जा सकती है।

उदाहरण के लिए:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

ये contents आम तौर पर केवल current view में उपयोग होते हैं।

### नया view बनाने की स्थिति

अगर ये contents relatively independent हैं, या भविष्य में कई pages में reuse हो सकते हैं, तो नया view बनाना अधिक suitable है।

उदाहरण के लिए:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

यह एक title view है। अगर हम इस view को common component के रूप में दूसरे views में reuse करना चाहते हैं।

तो हम एक नया view create कर सकते हैं:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

फिर इसे दूसरी जगह उपयोग करें:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

इस समय यह view एक reusable independent component है।

इसे सरल रूप में यूँ summarized किया जा सकता है:

- current view का content area: `var xxx: some View` उपयोग कर सकते हैं
- reusable independent component: नया `struct XxxView: View` create कर सकते हैं
- जिस component में data pass करना हो: आम तौर पर नया view create करना अधिक suitable होता है।

## Summary

इस पाठ में हमने SwiftUI के सबसे basic, लेकिन सबसे important view structure को फिर से समझा।

`ContentView` एक structure है। इसे `struct` से define किया जाता है, और इसका उपयोग page-related code organize करने के लिए होता है।

`View` एक protocol है। अगर कोई structure SwiftUI view बनना चाहता है, तो उसे `View` protocol follow करना होगा।

`body` वह content है जिसे `View` protocol हमें provide करने को कहता है। यह तय करता है कि यह view कौन सा content display करेगा।

`some View` बताता है कि किसी concrete view को return किया जा रहा है, और हमें उसका complex full type लिखने की जरूरत नहीं।

जब view code लंबा हो जाता है, तो हम `var xxx: some View` का उपयोग करके view code को कई छोटे areas में split कर सकते हैं।

जब कोई content block relatively independent हो, या reuse की जरूरत हो, तो हम नया view structure create कर सकते हैं, और उसे दूसरे views में `XxxView()` के माध्यम से display कर सकते हैं।

सरल शब्दों में, SwiftUI interface एक-एक view को combine करके बना होता है। एक page में कई small views हो सकते हैं, और एक small view भी आगे दूसरे views contain कर सकता है।
