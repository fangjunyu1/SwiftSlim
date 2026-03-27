# उद्धरण कैरोसेल

इस पाठ में हम एक "quote carousel" feature बनाएँगे, और Swift की बुनियादी अवधारणाएँ जैसे array (`Array`) और conditional statements (`if-else`) को गहराई से सीखेंगे।

हम यह दिखाएँगे कि कई quotes को कैसे save किया जाए, और button interaction के माध्यम से quotes को loop में कैसे display किया जाए।

![alt text](../../RESOURCE/011_word.png)

## quote दिखाना

सबसे पहले, हमें SwiftUI में एक quote दिखानी है।

सबसे सरल तरीका है `Text` view का उपयोग करना:

```swift
Text("Slow progress is still progress.")
```

यह code केवल एक fixed quote दिखा सकता है। यदि हमें कई quotes दिखानी हैं और उनके बीच switch करना है, तो हमें इन quotes को save करना होगा।

लेकिन एक सामान्य string variable केवल एक quote save कर सकता है:

```swift
let sayings = "Slow progress is still progress."
```

यदि कई quotes save करनी हों, तो हमें हर quote के लिए एक variable declare करना होगा:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

लेकिन वास्तविक development में यह तरीका न केवल cumbersome है, बल्कि क्योंकि हर variable स्वतंत्र है, हम लचीले तरीके से carousel switching लागू नहीं कर सकते।

कई quotes को आसानी से manage करने के लिए हमें एक data structure चाहिए जो उन्हें एक साथ store करे, और वही है array (`Array`)।

array उपयोग करने के बाद, ऊपर का code इस तरह लिखा जा सकता है:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**सुझाव: programming conventions में, कई elements को store करने वाले array variable names सामान्यतः plural form में लिखे जाते हैं, जैसे `sayings`, ताकि उसके collection nature को दिखाया जा सके।**

## array

Swift में, array ordered elements का collection है, जिसे square brackets `[]` से दर्शाया जाता है।

```swift
[]
```

array के भीतर एक ही type के कई elements हो सकते हैं, और elements को अंग्रेज़ी comma `,` से अलग किया जाता है।

उदाहरण:

```swift
[101, 102, 103, 104, 105]
```

आप array को एक ट्रेन की पंक्ति की तरह सरल रूप में समझ सकते हैं:

![Array](../../RESOURCE/011_array1.png)

पूरी ट्रेन इस array object का प्रतिनिधित्व करती है, और हर डिब्बा क्रम से arranged होता है।

### index और element access

क्योंकि array ordered है, system उसके क्रम के आधार पर किसी specific element को locate कर सकता है। इस positioning mechanism को index कहा जाता है।

Swift (और अधिकांश programming languages) में array index `0` से शुरू होती है, `1` से नहीं। इसका मतलब है कि array का पहला element index `0` पर, दूसरा `1` पर, और इसी तरह आगे होता है।

![Array](../../RESOURCE/011_array2.png)

यदि array में किसी specific element को access करना हो, तो array name के बाद square brackets लगाएँ और उसमें target element का index लिखें।

उदाहरण:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

यदि valid range से बाहर का index access करने की कोशिश की जाए, तो “Index Out of Range” समस्या होगी। इसलिए array access करते समय सावधान रहें और सुनिश्चित करें कि index valid range में हो।

**index out of range**

उदाहरण के लिए, जब array में केवल 5 elements हों, तो valid index range `0` से `4` तक होगी। यदि हम `sayings[5]` access करें, तो program उस corresponding “coach” को नहीं ढूँढ पाएगा, जिससे “index out of range” error होगी और app crash हो जाएगी।

![Array](../../RESOURCE/011_array3.png)

### array पर operations

array केवल static definition तक सीमित नहीं है। इसमें elements जोड़ना, हटाना, modify करना, और array length प्राप्त करना भी संभव है।

सुझाव: यदि array modify करनी हो, तो `let` constant की जगह `var` variable का उपयोग करना होगा।

**1. नया element जोड़ना**

`append` method से array के अंत में element जोड़ा जा सकता है:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. element हटाना**

`remove(at:)` method से array में specific element हटाया जा सकता है:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. element modify करना**

index का उपयोग करके array element को सीधे modify किया जा सकता है:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. array length गिनना**

`count` property से array में elements की संख्या प्राप्त होती है:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### array से quote दिखाना

कई quotes दिखाने के लिए, हम quotes को array में save कर सकते हैं, और फिर index द्वारा उन्हें read और display कर सकते हैं।

सबसे पहले, `ContentView` में एक `sayings` array बनाएँ जो quotes store करे, फिर `Text` view में index से corresponding quote पढ़कर दिखाएँ:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

यहाँ, `sayings[0]` array की पहली quote को दर्शाता है।

यदि अलग quote दिखानी हो, तो square brackets के अंदर index बदलना पर्याप्त है:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### quote index define करना

यदि quote switching को dynamic बनाना है, तो index को `Text` view के भीतर hardcode नहीं कर सकते।

हमें एक variable चाहिए, जो current displayed index को अलग से save करे।

SwiftUI में, हम `@State` का उपयोग करके एक mutable index declare कर सकते हैं:

```swift
@State private var index = 0
```

SwiftUI `@State` wrapped variable को observe करेगा। जब `index` बदलेगा, SwiftUI view को फिर से render करेगा और corresponding quote दिखाएगा।

फिर, हम `sayings[index]` के द्वारा array में quote dynamically प्राप्त करेंगे:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

जब `index` बदलता है, `Text` अलग-अलग quotes दिखाएगा।

### button से index control करना

quote switching control करने के लिए, हम `Button` का उपयोग करके `index` modify कर सकते हैं। हर बार button click होने पर `index` अपने आप `1` बढ़े:

```swift
Button("Next") {
    index += 1
}
```

जब हम बटन click करेंगे, `index` का value `0` से `1` हो जाएगा, जिससे view refresh होगी, और `Text(sayings[index])` अगली quote पढ़ेगा।

लेकिन यहाँ एक संभावित समस्या है: यदि button को लगातार click किया जाए, तो `index` array range से बाहर चला जाएगा, जिससे array index out-of-range error होगी। उदाहरण के लिए, जब `index` `5` हो जाए (जबकि array index range `0` से `4` है), तब program crash हो जाएगा।

array index out of range से बचने के लिए, हमें condition control जोड़ना होगा, ताकि `index` array range से बाहर न जाए। इसके लिए `if-else` statement का उपयोग कर सकते हैं और check कर सकते हैं कि `index` array length से छोटा है या नहीं।

## condition control: `if-else` statement

`if-else` Swift की सबसे commonly used conditional branching statements में से एक है। इसका उपयोग condition true है या false, यह जाँचने और उसी के आधार पर अलग code blocks execute करने के लिए होता है।

मूल structure:

```swift
if condition {
    // condition true होने पर execute होने वाला code
} else {
    // condition false होने पर execute होने वाला code
}
```

`if` statement में `condition` एक Boolean value (`Bool`) होती है, जो `true` या `false` हो सकती है। जब condition `true` हो, तो `if` भाग का code execute होगा; अन्यथा `else` भाग का code execute होगा।

उदाहरण:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

इस उदाहरण में, `age` का value `25` है। `if` statement check करती है कि `age > 18` true है या नहीं। condition true होने पर `"Big Boy"` output होगा।

यदि `else` भाग की आवश्यकता न हो, तो उसे छोड़ा जा सकता है:

```swift
if condition {
    // condition true होने पर execute होने वाला code
}
```

### condition से index range control करना

array index out of range से बचने के लिए, हम `if` statement का उपयोग करके सुनिश्चित कर सकते हैं कि `index` array range से बाहर न जाए:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

logic analysis: `sayings.count` का value `5` है (कुल 5 quotes), इसलिए `sayings.count - 1` का value `4` है, जो array का अंतिम valid index भी है।

जब `index`, `4` से छोटा है, तब button click करके `1` बढ़ाना सुरक्षित है; जैसे ही `index` `4` हो जाता है, condition satisfy नहीं होगी, और button click करने पर कुछ नहीं होगा।

अब, code quote switching feature लागू कर चुका है:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### loop quote

यदि हम चाहते हैं कि अंतिम quote दिखने के बाद button click करने पर फिर पहली quote दिखे, यानी quotes loop में चलें, तो `else` भाग का उपयोग कर सकते हैं:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

जब button click होता है, और यदि `index` array के अंतिम element तक पहुँच गया हो, तो `index` को `0` पर reset कर दिया जाएगा, और quote display फिर से शुरू हो जाएगी।

## quote view को बेहतर बनाना

अब हमारा quote carousel logic बन चुका है, लेकिन हम interface को और सुंदर बना सकते हैं।

पूर्ण code:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

इस उदाहरण में, `Text` view में सफेद semi-transparent background और rounded corners जोड़े गए हैं, `Button` ने `.borderedProminent` style उपयोग की है, और `VStack` में background image set की गई है।

अतिरिक्त ज्ञान: जब `background()` modifier का उपयोग image background handle करने में किया जाता है, तो उसका default behavior यह होता है कि वह current view के layout area को जहाँ तक संभव हो भरने की कोशिश करता है। कई स्थितियों में यह स्वाभाविक रूप से safe area तक भी फैल सकता है।

अब हमने quote carousel view लागू कर ली है।

![SwiftUI View](../../RESOURCE/011_word.png)

## सारांश

इस पाठ के माध्यम से हमने सीखा कि कई quotes store करने के लिए array का उपयोग कैसे किया जाए, और `if` तथा `if-else` statements के माध्यम से quote carousel कैसे लागू की जाए।

हमने array की बुनियादी operations भी समझीं, जैसे element जोड़ना, हटाना, modify करना, और array index out of range से बचना।

यह पाठ केवल quote carousel feature implementation तक सीमित नहीं था; इसने array और conditional statements के बुनियादी उपयोग को जोड़कर हमें data handle करने और program flow control करने की क्षमता भी दी।

## अतिरिक्त ज्ञान - multiple condition judgment: `if-else if-else`

वास्तविक development में, अक्सर कई conditions handle करनी पड़ती हैं। उदाहरण के लिए, किसी game में score `1` होने पर event A trigger हो, `2` होने पर event B, `3` होने पर event C, आदि।

जब दो से अधिक condition branches हों, तो `if-else if-else` statement का उपयोग करना पड़ता है।

मूल syntax:

```swift
if conditionA {
    // conditionA true होने पर execute होने वाला code
} else if conditionB {
    // conditionB true होने पर execute होने वाला code
} else if conditionC {
    // conditionC true होने पर execute होने वाला code
} else {
    // जब कोई भी condition पूरी न हो
}
```

इस स्थिति में program क्रम से conditions check करता है, और जो पहली condition satisfy होती है, उसी का code execute करता है। यदि कोई भी condition satisfy न हो, तो `else` के बाद का code execute होता है।

quote carousel में भी हम `if-else if-else` से multiple conditions लिख सकते हैं:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

जब `index` `0`、`1`、`2`、`3` हो, तो हर बार button click पर `index += 1` execute होगा; जब `index` `4` (अंतिम element) हो, तब `index` को `0` पर reset किया जाएगा, जिससे loop effect बनेगा।

`else` branch यहाँ fallback के रूप में है, ताकि illegal value (जैसे `index` को गलती से बदल दिया गया हो) की स्थिति में भी code सुरक्षित रहे।

ध्यान दें कि यहाँ `==` का अर्थ है “बराबर है या नहीं” की जाँच। यदि `if` statement में `index` और किसी number का comparison true लौटाता है, तो उसके बाद का code block execute होगा; यदि equal न हो, तो अगली `if` condition check होगी।

यह multiple condition judgment अलग-अलग scenarios में अलग code execute करने के लिए उपयोगी होती है।
