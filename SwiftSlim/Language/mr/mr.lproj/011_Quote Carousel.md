# सुविचार कॅरुसेल

या धड्यात आपण "सुविचार कॅरुसेल" हे feature तयार करू, आणि arrays (`Array`) व conditional statements (`if-else`) यांसारखे Swift चे मूलभूत ज्ञान अधिक सखोलपणे शिकू.

आपण अनेक सुविचार कसे साठवायचे, आणि बटणांच्या interaction च्या मदतीने त्यांना loop मध्ये कसे दाखवायचे हे पाहू.

![alt text](../../RESOURCE/011_word.png)

## सुविचार दाखवणे

सर्वप्रथम, SwiftUI मध्ये एक सुविचार दाखवणे आवश्यक आहे.

यासाठी सर्वात सोपा मार्ग म्हणजे `Text` view वापरणे:

```swift
Text("Slow progress is still progress.")
```

हा कोड फक्त एक स्थिर सुविचार दाखवू शकतो. जर अनेक सुविचार दाखवायचे आणि त्यांच्यात switch करायचे असेल, तर आपल्याला ते साठवावे लागतील.

पण सामान्य string variable फक्त एकच सुविचार साठवू शकतो:

```swift
let sayings = "Slow progress is still progress."
```

जर अनेक सुविचार साठवायचे असतील, तर प्रत्येकासाठी स्वतंत्र variable declare करावा लागेल:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

पण प्रत्यक्ष development मध्ये ही पद्धत केवळ किचकटच नसते, तर प्रत्येक variable स्वतंत्र असल्यामुळे flexible carousel switching देखील शक्य होत नाही.

अनेक सुविचार सोप्या पद्धतीने manage करण्यासाठी, आपल्याला एक data structure वापरावे लागेल जे त्यांना एकत्र साठवेल. ते म्हणजे array (`Array`).

array वापरल्यावर वरील कोड असे लिहू शकतो:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**सूचना: programming conventions मध्ये अनेक elements साठवणाऱ्या array variable चे नाव साधारणपणे plural form मध्ये ठेवले जाते, जसे `sayings`, जेणेकरून तो collection आहे हे स्पष्ट होते.**

## arrays

Swift मध्ये array म्हणजे ordered elements चा collection, ज्यासाठी square brackets `[]` वापरतात.

```swift
[]
```

array मध्ये एकाच प्रकारचे अनेक elements असू शकतात, आणि elements एकमेकांपासून comma `,` ने वेगळे केले जातात.

उदाहरणार्थ:

```swift
[101, 102, 103, 104, 105]
```

array ला साधेपणाने रेल्वेच्या डब्यांच्या रांगेप्रमाणे समजू शकतो:

![Array](../../RESOURCE/011_array1.png)

संपूर्ण रेल्वे ही array object आहे, आणि प्रत्येक डबा ठराविक क्रमाने लावलेला आहे.

### index आणि element access

array ordered असल्यामुळे, system त्या क्रमाच्या आधारे specific element शोधू शकते. या शोधण्याच्या पद्धतीला index म्हणतात.

Swift मध्ये (आणि बहुतेक programming languages मध्ये) array चा index 0 पासून सुरू होतो, 1 पासून नाही. म्हणजे array मधील पहिल्या element चा index 0, दुसऱ्याचा 1, आणि पुढे तसेच.

![Array](../../RESOURCE/011_array2.png)

array मधील ठराविक element access करायचा असल्यास, array च्या नावानंतर square brackets लावून त्यात target element चा index लिहायचा असतो.

उदाहरणार्थ:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

जर array च्या वैध मर्यादेबाहेरील index access करण्याचा प्रयत्न केला, तर “Index Out of Range” error येतो. त्यामुळे array access करताना index वैध मर्यादेत आहे याची काळजी घ्यावी.

**index out of range**

उदाहरणार्थ, array मध्ये फक्त 5 elements असतील, तर वैध index range 0 ते 4 अशी असेल. जर आपण `sayings[5]` access केला, तर program ला तसा “डबा” सापडत नाही आणि “index out of range” error येतो, ज्यामुळे app crash होऊ शकतो.

![Array](../../RESOURCE/011_array3.png)

### array वर क्रिया

array फक्त static define करण्यापुरते मर्यादित नाही; त्यावर elements add, remove, modify करणे, आणि array ची length मिळवणेही शक्य आहे.

सूचना: array modify करायचा असल्यास, `let` constant ऐवजी `var` variable वापरावा लागतो.

**1. element जोडणे**

array च्या शेवटी element जोडण्यासाठी `append` method वापरता येते:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. element काढणे**

`remove(at:)` method वापरून array मधील specific element delete करता येतो:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. element बदलणे**

index वापरून array element थेट बदलता येतो:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. array length मोजणे**

`count` property वापरून array मधील elements ची संख्या मिळते:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### array वापरून सुविचार दाखवणे

अनेक सुविचार दाखवण्यासाठी, आपण ते array मध्ये साठवू शकतो, आणि नंतर index द्वारे access करून दाखवू शकतो.

सर्वप्रथम, `ContentView` मध्ये `sayings` array तयार करू आणि त्यात सुविचार साठवू; नंतर `Text` view मध्ये index च्या मदतीने योग्य सुविचार वाचून दाखवू:

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

इथे `sayings[0]` म्हणजे array मधील पहिला सुविचार.

जर वेगळा सुविचार दाखवायचा असेल, तर square brackets मधील index बदला:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### सुविचाराचा index define करणे

सुविचार dynamic पद्धतीने switch होण्यासाठी, `Text` मध्ये index “hard-code” करून चालणार नाही.

आपल्याला सध्या दाखवला जाणारा index वेगळ्या variable मध्ये साठवावा लागेल.

SwiftUI मध्ये आपण mutable index declare करण्यासाठी `@State` वापरू शकतो:

```swift
@State private var index = 0
```

SwiftUI `@State` ने wrap केलेल्या variable वर लक्ष ठेवते. `index` बदलल्यावर SwiftUI view पुन्हा render करते आणि संबंधित सुविचार दाखवते.

यानंतर आपण `sayings[index]` वापरून array मधील सुविचार dynamically मिळवू:

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

`index` बदलला की `Text` मध्ये वेगळा सुविचार दिसतो.

### बटण वापरून index नियंत्रित करणे

सुविचार switch करण्यासाठी आपण `Button` वापरून `index` ची value बदलू शकतो. प्रत्येक click वेळी `index` आपोआप 1 ने वाढेल:

```swift
Button("Next") {
    index += 1
}
```

बटणावर क्लिक केल्यावर `index` ची value 0 वरून 1 होते, view refresh होते, आणि `Text(sayings[index])` पुढचा सुविचार वाचते.

पण इथे एक संभाव्य समस्या आहे: जर बटण सतत क्लिक केले, तर `index` array च्या range च्या बाहेर जाईल, ज्यामुळे array index out of range error येईल. उदाहरणार्थ, `index` 5 झाला (जेव्हा array index range 0 ते 4 आहे), तेव्हा program crash होईल.

हा error टाळण्यासाठी, `index` array च्या range च्या बाहेर जाणार नाही याची खात्री करण्यासाठी conditional control वापरावे लागेल. यासाठी `if-else` statement वापरून `index` array length पेक्षा लहान आहे का ते तपासू शकतो.

## conditional control: if-else statements

`if-else` statement हे Swift मधील सर्वाधिक वापरले जाणारे conditional branching statement आहे. त्याचा वापर condition खरी आहे का नाही हे तपासण्यासाठी आणि त्यानुसार वेगवेगळे code blocks execute करण्यासाठी होतो.

मूलभूत रचना:

```swift
if condition {
    // 当 condition 为 true 时执行的代码
} else {
    // 当 condition 为 false 时执行的代码
}
```

`if` statement मध्ये `condition` ही Boolean value (`Bool` type) असते, म्हणजे ती `true` किंवा `false` असू शकते. condition `true` असल्यास `if` मधील code execute होतो, अन्यथा `else` मधील.

उदाहरणार्थ:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

या उदाहरणात `age` ची value 25 आहे. `if` statement `age > 18` खरी आहे का हे तपासते; condition खरी असल्याने `"Big Boy"` output होते.

जर `else` भागाची गरज नसेल, तर तो वगळता येतो:

```swift
if condition {
    // 当 condition 为 true 时执行的代码
}
```

### condition वापरून index range नियंत्रित करणे

array index out of range टाळण्यासाठी, `if` statement वापरून `index` array च्या range च्या बाहेर जाऊ नये याची खात्री करू शकतो:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

logic विश्लेषण: `sayings.count` ची value 5 आहे (एकूण 5 सुविचार), त्यामुळे `sayings.count - 1` ची value 4 आहे, जी array चा शेवटचा वैध index आहे.

`index` हा 4 पेक्षा लहान असताना, बटणावर क्लिक करून `+1` करणे सुरक्षित आहे; एकदा `index` 4 झाला की condition पूर्ण होत नाही, आणि बटणावर क्लिक केले तरी काहीच होत नाही.

आता कोडने सुविचार switch करण्याचे कार्य साध्य केले आहे:

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

### looping सुविचार

जर शेवटचा सुविचार दाखवल्यानंतर पुन्हा पहिला सुविचार दाखवायचा असेल, म्हणजे carousel loop मध्ये चालवायचा असेल, तर `else` भाग वापरून ते साधता येते:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

बटणावर क्लिक केल्यावर, जर `index` array च्या शेवटच्या element वर असेल, तर `index` पुन्हा 0 वर reset होतो, आणि सुविचार loop मध्ये दिसू लागतात.

## सुविचार view सुधारणा

आता आपल्या सुविचार carousel ची logic तयार झाली आहे, पण interface अजून अधिक सुंदर करता येईल.

पूर्ण कोड:

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

या उदाहरणात, `Text` view ला पांढरी अर्धपारदर्शक background आणि rounded corners दिले आहेत, `Button` वर `.borderedProminent` style वापरली आहे, आणि `VStack` ला background image दिली आहे.

ज्ञानविस्तार: `background()` modifier वापरून image background हाताळताना, त्याचे default behavior म्हणजे सध्याच्या view च्या layout क्षेत्राला शक्य तितके भरून काढणे. अनेक वेळा ते सहजपणे safe area पर्यंतही विस्तारते.

आता आपण सुविचार carousel चे view तयार केले आहे.

![SwiftUI View](../../RESOURCE/011_word.png)

## सारांश

या धड्यात आपण arrays वापरून अनेक सुविचार कसे साठवायचे, आणि `if` व `if-else` statements वापरून सुविचारांचा carousel कसा तयार करायचा हे शिकलो.

आपण array वरील मूलभूत operations देखील समजून घेतल्या, जसे elements add, remove, modify करणे, आणि array index out of range टाळणे.

हा धडा फक्त सुविचार carousel ची functionality समजावून देत नाही, तर arrays आणि conditional statements चा मूलभूत वापर एकत्र करून data हाताळणे आणि program flow नियंत्रित करणे याची क्षमता देखील विकसित करतो.

## विस्तार - multiple condition judgement: if-else if-else statements

प्रत्यक्ष development मध्ये अनेक conditions हाताळाव्या लागतात. उदाहरणार्थ, एखाद्या game मध्ये score 1 असेल तर event A, 2 असेल तर event B, 3 असेल तर event C... अशा प्रकारची अनेक branches असू शकतात.

दोनपेक्षा जास्त conditional branches असतील, तर `if-else if-else` statement वापरून multiple judgement करावी लागते.

मूलभूत syntax:

```swift
if conditionA {
    // 当 conditionA 为 true 时执行的代码
} else if conditionB {
    // 当 conditionB 为 true 时执行的代码
} else if conditionC {
    // 当 conditionC 为 true 时执行的代码
} else {
    // 所有条件均不满足时执行的代码
}
```

या परिस्थितीत program conditions क्रमाने तपासतो आणि पहिली खरी ठरणारी condition execute करतो. जर कोणतीही condition खरी ठरली नाही, तर `else` नंतरचा code execute होतो.

सुविचार carousel मध्येही `if-else if-else` वापरून multiple judgement करू शकतो:

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

जेव्हा `index` 0, 1, 2, 3 असतो, तेव्हा प्रत्येक click वर `index += 1` execute होते; आणि `index` 4 (शेवटचा element) असेल, तर `index` 0 वर reset होतो, म्हणजे loop पूर्ण होते.

`else` branch हा fallback म्हणून वापरला आहे, जेणेकरून illegal value (उदा. `index` चुकीने बदलला गेला) आली तरी सुरक्षितपणे हाताळता येईल.

लक्षात घ्या की येथे वापरलेला `==` हा "समान आहे का?" हे तपासण्यासाठी वापरला जातो. जर `if` statement मध्ये `index` एखाद्या संख्येसमोर समान आढळला, तर result `true` येते आणि त्यानंतरचा code block execute होतो. समान नसल्यास पुढील `if` condition तपासली जाते.

अशा multiple judgement मुळे वेगवेगळ्या condition scenarios मध्ये वेगवेगळा code execute करणे सोपे होते.
