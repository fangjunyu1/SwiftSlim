# काउंटर

पिछले दो पाठों में हमने variables, constants, buttons और methods सीखे।

इस पाठ में हम इन सब ज्ञान को एक साथ जोड़कर एक सरल counter app बनाएँगे।

इस उदाहरण में हम सीखेंगे कि variable को कैसे save और change किया जाता है, और `@State` से variable को कैसे manage किया जाता है।

## काउंटर बनाना

counter आम तौर पर ऐसे numbers record करने के लिए उपयोग होता है जिन्हें लगातार accumulate करना हो। जैसे रस्सी कूद की गिनती, दौड़ के चक्कर आदि।

अब हम एक सरल counter बनाएँगे: एक number और बटन दिखेगा, और बटन click करने पर number बढ़ेगा।

![Num](../../RESOURCE/009_num.png)

### number दिखाना

सबसे पहले, हम `Text` से number दिखाएँगे।

```swift
Text("0")
```

लेकिन यदि number को बदलना है, तो `"0"` को सीधे hardcode नहीं करना चाहिए, बल्कि number को variable में save करना चाहिए।

```swift
var num = 0
```

फिर `Text` में variable दिखाएँ:

```swift
Text("\(num)")
```

यहाँ string interpolation `\()` का उपयोग करके number को string में बदलकर दिखाया गया है।

### बटन से number बढ़ाना

अब, हम एक बटन जोड़ते हैं।

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

जब बटन click हो, तो हम चाहते हैं कि number बढ़ जाए।

इसलिए हम बटन के भीतर variable modify कर सकते हैं:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

इस code का अर्थ है: जब बटन click होगा, तब `num + 1` calculate होगा और result फिर `num` को assign होगा।

### अधिक concise syntax

Swift एक और concise syntax प्रदान करता है:

```swift
num += 1
```

यह इसके बराबर है:

```swift
num = num + 1
```

इस syntax को compound assignment operator कहा जाता है।

Swift में सामान्य compound assignment operators हैं:

```
+=   addition assignment
-=   subtraction assignment
*=   multiplication assignment
/=   division assignment
%=   remainder assignment
```

उदाहरण:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### पूर्ण code

अब, हम एक सरल counter लिख सकते हैं:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

लेकिन इस समय code सही तरह run नहीं करेगा।

### error क्यों आती है

Xcode यह prompt देगा:

```
Cannot assign to property: 'self' is immutable
```

इसका अर्थ है कि property modify नहीं की जा सकती, क्योंकि view immutable है।

ऐसा क्यों?

## SwiftUI कैसे काम करता है

SwiftUI में: **interface data-driven होती है**, यानी जब data बदलती है, तब interface अपने आप refresh होती है।

लेकिन ध्यान दें: केवल तब, जब state (जैसे `@State`、`@Binding`) बदलती है, SwiftUI उस change को monitor करता है और view refresh करता है।

यदि सामान्य variable का उपयोग किया जाए, तो SwiftUI केवल view create होने के समय एक बार उसका value पढ़ता है। बाद में variable बदलने पर भी interface update नहीं होता।

उदाहरण:

```swift
var num = 0   // 0
num = 1   // 0
```

ऊपर के उदाहरण में `num` एक सामान्य variable है। यद्यपि उसकी value बदल गई, SwiftUI view update नहीं करेगा, और interface अभी भी initial `0` ही दिखाएगा।

![Num](../../RESOURCE/009_state.png)

इसलिए, केवल जब data को state के रूप में mark किया जाता है (जैसे `@State`、`@Binding` आदि property wrappers का उपयोग करके), तभी SwiftUI उसके बदलाव को automatically monitor करता है और view update करता है।

## `@State` property wrapper

SwiftUI में, यदि variable को modify करना है और view भी update करनी है, तो `@State` का उपयोग करना होगा।

```swift
@State var num = 0
```

`@State` SwiftUI को इस variable को observe करने देता है।

जब variable बदलता है, SwiftUI view को फिर से calculate करता है, और view update करता है।

पूर्ण code:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

अब, जब बटन click होगा:

```swift
num += 1
```

SwiftUI detect करेगा कि `num` बदल गया है, और फिर view को automatically update करेगा।

![Num](../../RESOURCE/009_state1.png)

## `@State` के usage rules

वास्तविक development में, `@State` आम तौर पर दो rules follow करता है।

### 1. `@State` आम तौर पर `private` के साथ उपयोग होता है

`@State` variable सामान्यतः केवल current type (जैसे current `View` struct) के भीतर उपयोग होती है, इसलिए इसे आम तौर पर ऐसे लिखा जाता है:

```swift
@State private var num = 0
```

इससे अन्य views इस variable को सीधे access या modify नहीं कर पाते।

अभी `private` नहीं सीखा है, इसलिए इसे सरल रूप में ऐसे समझ सकते हैं:

**`private` से modified content केवल current view में ही उपयोग हो सकती है; बाहर की view उसे उपयोग नहीं कर सकती।**

### 2. `@State` केवल current view की state के लिए उपयोग होता है

`@State` current `View` द्वारा स्वयं manage की जाने वाली data के लिए उपयुक्त है।

उदाहरण, text field की content, switch की state।

```swift
@State private var isOn = false
@State private var text = ""
```

यदि data को कई views के बीच share करना हो, तो अन्य state types की आवश्यकता होगी, जैसे `@Binding` या `@Observable`।

ये बातें हम आगे के पाठों में सीखेंगे।

### घटाने वाला बटन

counter केवल बढ़ता ही नहीं, घट भी सकता है।

हम एक `-` बटन जोड़ सकते हैं।

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

फिर `HStack` से buttons को horizontal रूप से arrange करें:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

परिणाम:

![Num](../../RESOURCE/009_num1.png)

`+` बटन क्लिक करने पर number `1` से बढ़ेगा; `-` बटन क्लिक करने पर number `1` से घटेगा।

### reset बटन

हम एक reset button भी जोड़ सकते हैं, जो number को `0` कर दे।

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

जब reset button click होगा, तब `num` को `0` assign किया जाएगा।

परिणाम:

![Num](../../RESOURCE/009_num2.png)

`0` बटन क्लिक करने पर number `0` बन जाता है।

### custom button

अभी हमारे buttons केवल text ही दिखा सकते हैं:

```swift
Button("+") {

}
```

इस syntax वाला बटन केवल text content दिखा सकता है, जैसे `+` या `-`।

वास्तविक development में हम अक्सर चाहते हैं कि button की appearance अधिक rich हो, जैसे icons या अन्य views का उपयोग।

SwiftUI हमें button की display content customize करने देता है। तब button का दूसरा syntax उपयोग किया जा सकता है:

```swift
Button(action: {

}, label: {

})
```

इस syntax में, `action` वह code है जो button click होने पर execute होगा, और `label` button का view content है।

उदाहरण के लिए, हम button में एक SF Symbols icon दिखा सकते हैं:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

इस प्रकार button अब text नहीं, बल्कि एक icon दिखाएगा।

### counter interface को बेहतर बनाना

counter interface को अधिक स्पष्ट बनाने के लिए, हम number के display style को भी adjust कर सकते हैं। उदाहरण के लिए, number को बड़ा करना:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

अब हम buttons की display content को भी icons में बदलेंगे, और icon size को थोड़ा बड़ा करेंगे:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

इसी प्रकार, हम decrease button और reset button को भी icon form में बदल सकते हैं:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

अब button SF Symbols icons दिखाएँगे, और interface अधिक intuitive लगेगी।

![Num](../../RESOURCE/009_num3.png)

## सारांश

इस पाठ में हमने एक सरल counter बनाकर variable, `Text` और `Button` के उपयोग का एक संयुक्त अभ्यास किया। हमने number को save करने के लिए variable का उपयोग किया, और buttons के माध्यम से number को बढ़ाना या घटाना नियंत्रित किया। साथ ही compound assignment operators भी सीखे, जैसे `num += 1` और `num -= 1`।

implementation के दौरान हमने SwiftUI के काम करने का तरीका समझा: interface data-driven होती है। जब data बदलती है, तभी interface refresh होती है। इसलिए बदलने वाली state को save करने के लिए `@State` का उपयोग करना आवश्यक है। जब `@State` variable बदलती है, तो SwiftUI view को automatically update करता है।

अंत में, हमने interface का simple optimization किया, `Text` की font style adjust की, और `Button(action:label:)` का उपयोग करके button content customize की, ताकि buttons icons दिखा सकें और counter interface अधिक स्पष्ट और सुंदर बने।

अब हम SwiftUI views के basic usage से परिचित हो चुके हैं। SwiftUI में अधिकांश interface variables द्वारा driven होती है। जब variables बदलती हैं, SwiftUI अपने आप view update करता है। इसलिए SwiftUI app development में, हमें अक्सर पहले यह design करना होता है कि कौन सी data save करनी है, और फिर उन्हीं data के आधार पर interface और interaction logic बनानी होती है।

## पूर्ण code

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
