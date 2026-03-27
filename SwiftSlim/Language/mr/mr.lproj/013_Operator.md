# ऑपरेटर्स

या धड्यात आपण Swift मधील operators शिकणार आहोत.

जेव्हा आपण calculation, comparison किंवा logic judgement करतो, तेव्हा operators आवश्यक असतात. या क्रिया program execution च्या सर्व स्तरांत वापरल्या जातात आणि त्या programming मधील सर्वात मूलभूत कौशल्यांपैकी एक आहेत.

```swift
let a = 100 * 8
```

programming शिकताना अनेकांना असे जाणवते की गणिती विचारसरणी असलेल्या लोकांना program logic समजणे तुलनेने सोपे जाते. कारण programming चा मूळ गाभाच “calculation” आणि “rule-based judgement” यावर आधारित आहे, आणि याच मुख्य भूमिका operators बजावतात.

प्रत्यक्ष development मध्ये operators फक्त साध्या संख्यात्मक calculation साठी वापरले जात नाहीत, तर ते अनेक ठोस परिस्थितींमध्ये मोठ्या प्रमाणात वापरले जातात.

उदाहरणार्थ, block game मध्ये वापरकर्ता एखादा block दिलेल्या जागी drag करताना पुढील calculation करावी लागते:

- block ची coordinate position
- block भरू शकणाऱ्या जागा
- target position उपलब्ध आहे का हे तपासणे

या सर्व “calculation + judgement” प्रक्रियेचा पाया operators वरच असतो.

![Block](../../Resource/013_block.png)

operators शिकणे म्हणजे फक्त अंकगणित शिकणे नाही, तर पुढील interface layout, data processing आणि interaction logic साठी पाया मजबूत करणे आहे.

## SwiftUI मध्ये calculation execute करण्याची पद्धत

SwiftUI मध्ये सहसा `Button` वापरून function trigger केले जाते, आणि नंतर त्या function मध्ये calculation logic execute केली जाते.

उदाहरणार्थ:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

बटणावर क्लिक केल्यावर `Console` मध्ये हे output दिसेल:

```
c: 20
```

या धड्यात आपण calculation logic एकसमानपणे `func` मध्ये लिहू, ते बटणाद्वारे trigger करू, आणि परिणाम `print` ने output करू.

पुढील उदाहरणांमध्ये code दाखवणे सोपे व्हावे म्हणून, आपण थेट code मध्येच calculation result नोंदवू; प्रत्येकवेळी `print` वापरून output दाखवणार नाही.

## Console output व्यवस्थापन

प्रत्येक click वेळी output तयार होत असल्यामुळे, `Console` क्षेत्राच्या खालच्या उजव्या भागातील clean button वर क्लिक करून जुने logs साफ करू शकता, ज्यामुळे current result पाहणे सोपे होते.

![Console](../../Resource/013_console.png)

## Button ची दुसरी syntax

जर बटण फक्त एकच function execute करत असेल, तर अधिक concise syntax वापरता येते:

```swift
Button(action: ) {
    // View
}
```

या syntax मध्ये `action` हे बटणावर क्लिक झाल्यावर execute होणारे function (parameter नसलेले function) दर्शवते, आणि `{}` मधे बटणाचे view define केले जाते.

वरच्या `calculate` function सोबत ते असे लिहू शकतो:

```swift
Button(action: calculate) {
    Text("Button")
}
```

बटणावर क्लिक केल्यावर `calculate` function थेट execute होतो.

म्हणून, जेव्हा बटणाची logic साधी असते आणि फक्त एकच function call करायचा असतो, तेव्हा `action` syntax अधिक स्पष्ट आणि code-style च्या दृष्टीने योग्य ठरते.

## arithmetic operators

arithmetic operators संख्यात्मक calculation साठी वापरले जातात:

- `+` बेरीज
- `-` वजाबाकी
- `*` गुणाकार
- `/` भागाकार
- `%` शेष (remainder)

उदाहरण:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

लक्षात ठेवण्यासारखी गोष्ट म्हणजे Swift ही strongly typed language आहे, त्यामुळे वेगवेगळ्या data types एकत्र आपोआप mix होत नाहीत:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

दोन्ही types वेगळे असतील तर operation आधी type conversion करावी लागते.

## comparison operators

comparison operators दोन values मधील नाते तपासतात, आणि result `Bool` मध्ये देतात:

- `==` बरोबर
- `!=` बरोबर नाही
- `>` मोठे
- `<` लहान
- `>=` मोठे किंवा बरोबर
- `<=` लहान किंवा बरोबर

उदाहरण:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

comparison operators सहसा judgement statements मध्ये वापरले जातात. उदाहरणार्थ “सुविचार कॅरुसेल” मध्ये, index array range पेक्षा जास्त जाऊ नये म्हणून:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

जर `index` हा `sayings.count - 1` पेक्षा लहान असेल, तर comparison result `true` येईल आणि `if` मधील code execute होईल; `false` असल्यास पुढील code चालणार नाही.

## logical operators

logical operators अनेक conditions एकत्र जोडण्यासाठी वापरले जातात:

- `&&` आणि（AND）
- `||` किंवा（OR）
- `!` नाही（NOT）

### `&&` आणि

जेव्हा अनेक conditions एकाच वेळी पूर्ण होणे आवश्यक असते, तेव्हा `&&` वापरतात.

उदाहरणार्थ:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

या कोडमध्ये दोन conditions आहेत: `age >= 18` आणि `age <= 100`。

या दोन्ही conditions `true` असतील तरच `legalAge` चे result `true` येईल; एक जरी अयशस्वी झाली तरी `false` येईल.

### `||` किंवा

अनेक conditions पैकी किमान एक पूर्ण झाली तरी पुरेसे असेल, तर `||` वापरतात.

उदाहरणार्थ:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

या कोडचा अर्थ असा: `money >= 50` किंवा `creditCard >= 50` यापैकी एक तरी condition खरी असेल, तर `payAllowed` हे `true` असेल.

दोन्ही conditions खोट्या असतील तेव्हाच `false` result मिळेल.

उदाहरणार्थ, payment scenario मध्ये cash किंवा credit card वापरता येतात. दोन्हीपैकी एकही उपलब्ध नसेल, तर payment fail होते.

### `!` नाही

`!` हा logical NOT operator आहे, जो `Bool` value उलटवतो.

सोप्या भाषेत, `!` मुळे `true` चे `false` होते, आणि `false` चे `true`.

उदाहरणार्थ:

```swift
let allowed = true
let result = !allowed   // false
```

इथे `!allowed` म्हणजे `allowed` चे उलट value.

लक्षात ठेवा, `!` आणि `!=` हे दोन वेगवेगळे operators आहेत. `!` हा `Bool` value negate करतो, तर `!=` हा comparison operator आहे आणि `Bool` result परत करतो.

## assignment operators

assignment operators variable ला value देण्यासाठी किंवा त्याचे update करण्यासाठी वापरले जातात:

- `=` assignment

variable declaration किंवा calculation दोन्ही ठिकाणी assignment operation वापरले जाते:

```swift
let a = 5
```

या ओळीचा अर्थ असा की, `5` ही value `a` ला assign केली आहे.

### compound assignment operators

प्रत्यक्ष development मध्ये, base assignment operator व्यतिरिक्त, “compound assignment operators” देखील खूप वापरले जातात. यांचा उपयोग म्हणजे विद्यमान value वर थेट calculation करून update करणे:

- `+=`
- `-=`
- `*=`
- `/=`

मागील “counter” धड्यात आपण compound assignment operator बद्दल थोडेसे शिकलो आहोत.

उदाहरणार्थ, बटणावर क्लिक केल्यावर variable वाढवायचा असेल:

```swift
var num = 10
num += 5   // num = 15
```

या कोडचा अर्थ, `num` आणि `5` यांची बेरीज करून तो result पुन्हा `num` मध्ये साठवणे.

म्हणजेच, तो पुढील syntax बरोबरच आहे:

```swift
var num = 10
num = num + 5   // num = 15
```

## ternary operator

Swift मधील ternary operator condition तपासतो आणि दोन values पैकी एक परत करतो:

```swift
अट ? मूल्य1 : मूल्य2
```

याची logic अशी आहे: condition `true` असल्यास “值1” परत येते; `false` असल्यास “值2” परत येते.

उदाहरणार्थ:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

हा कोड `showColor` चे value तपासतो: `true` असल्यास `Color.blue` मिळेल आणि background निळे होईल; `false` असल्यास `Color.clear` येईल आणि कोणताही background रंग दिसणार नाही.

सूचना: `Color.clear` म्हणजे पारदर्शक रंग (काहीही दिसत नाही).

### `if-else` सोबत फरक

ternary operator logic च्या दृष्टीने `if-else` statement सारखाच असतो.

उदाहरणार्थ, वरचा code असा लिहिता येतो:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

दोन्हींची execute होण्याची logic सारखीच आहे: condition `true` असल्यास पहिला result, अन्यथा दुसरा.

प्रत्यक्ष वापरात, ternary operator अधिक संक्षिप्त असतो, आणि “दोन पर्यायांमधील एक” अशी साधी logic व्यक्त करण्यासाठी तो योग्य ठरतो. एखादे value थेट return करायचे असेल, तेव्हा तो खूप उपयोगी असतो.

SwiftUI च्या view building मध्ये ternary operator खूप सामान्य आहे. उदाहरणार्थ:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

या syntax मुळे एका ओळीत condition नुसार view effect dynamically बदलता येतो.

## range operators

range operators एखादा interval दर्शवण्यासाठी वापरले जातात:

- `...` closed range（दोन्ही टोकांसह）
- `..<` half-open range（उजवे टोक वगळून）

उदाहरणार्थ:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

सोप्या भाषेत, `1...3` म्हणजे 1 पासून 3 पर्यंत आणि 3 सुद्धा समाविष्ट; `5..<8` म्हणजे 5 पासून 8 पर्यंत, पण 8 समाविष्ट नाही.

विस्तारित syntax（फक्त ओळख म्हणून）:

```
5...    // >= 5
...5    // <= 5
```

हे “one-sided range” दर्शवते, जे conditions किंवा pattern matching मध्ये वापरले जाऊ शकते.

range operators पुढे `for` loop शिकताना अधिक वापरले जातील; सध्या त्यांना सलग संख्यांची एक range असे समजणे पुरेसे आहे.

## operators सराव

आता काही सोप्या उदाहरणांमधून views मध्ये operators चा उपयोग पाहू.

### 1. वाहनांची एकूण संख्या मोजणे

उदाहरणार्थ, एखाद्या चौकातून दररोज 500 वाहने जात असतील, तर 30 दिवसांत एकूण किती वाहने गेली हे मोजूया.

यासाठी arithmetic operator वापरू शकतो:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

इथली calculation अशी आहे: दररोज 500 वाहने, 30 दिवसांसाठी एकूण 500 × 30, म्हणजे अंतिम result 15000 वाहने.

### 2. in-app purchase सदस्य तपासणे

एखादी व्यक्ती in-app purchase member आहे का हे आपण तपासू शकतो. जर त्याच्याकडे lifetime membership किंवा subscription membership पैकी कोणतेही एक असेल, तर तो member समजला जाईल.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

या कोडमध्ये `||` (OR) operator वापरला आहे: `lifeTime = false` म्हणजे lifetime member नाही; `subscription = true` म्हणजे subscription member आहे.

कारण एक condition पूर्ण झाली तरी पुरेसे आहे, त्यामुळे `isMember` चे result `true` आहे. म्हणजे ही व्यक्ती in-app purchase member आहे.

## सारांश

Swift मध्ये operators हे data calculation आणि logic judgement यांचे मूलभूत साधन आहेत. जसे `Text` content दाखवते, तसे operators data स्वतः हाताळतात.

साध्या संख्यात्मक calculation पासून गुंतागुंतीच्या logic judgement पर्यंत, तसेच view state control आणि layout calculation पर्यंत सर्वत्र operators ची गरज असते.

वेगवेगळ्या scenarios च्या सरावातून या धड्यातील operators हळूहळू ओळखीचे होतात आणि चांगल्या प्रकारे समजतात; आणि हे पुढील शिक्षणासाठी अत्यंत महत्त्वाचे पायाभूत ज्ञान आहे.

### विस्तार - bitwise operators

याशिवाय, Swift काही अधिक low-level operators देखील देते — bitwise operators:

- `&`（bitwise AND）
- `|`（bitwise OR）
- `^`（bitwise XOR）
- `~`（bitwise NOT）
- `>>`（right shift）
- `<<`（left shift）

उदाहरणार्थ:

```swift
let a = 6  // binary 110
let b = 3  // binary 011

print(a & b) // 2 (binary 010)
print(a | b) // 7 (binary 111)
print(a ^ b) // 5 (binary 101)
print(~a)    // -7 (bitwise NOT)
```

Swift मध्ये integers हे binary two's complement representation वापरून साठवले जातात, त्यामुळे bitwise NOT केल्यावर संबंधित negative result मिळतो.

bitwise operators थेट binary level वर काम करतात, आणि ते सहसा low-level data processing किंवा performance optimization च्या scenarios मध्ये वापरले जातात.

नवशिक्यांसाठी या प्रकारचे operators तुलनेने कमी वापराचे असतात, आणि सामान्य iOS किंवा SwiftUI development मध्येही फारसे दिसत नाहीत. त्यामुळे येथे त्यात अधिक खोलात जात नाही.

पुढे जर low-level logic किंवा performance optimization संबंधित परिस्थिती आली, तर त्यांचा अधिक अभ्यास करता येईल.
