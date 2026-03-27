# प्रकार प्रणाली

मागील धड्यांमध्ये आपण variables शिकलो आहोत, आणि variable मध्ये वेगवेगळ्या प्रकारचा data साठवता येतो हे आपल्याला माहित आहे.

उदाहरणार्थ:

```swift
var hello = "Hello, World"
```

इथे `hello` मध्ये एक मजकूर साठवला आहे, त्यामुळे त्याचा प्रकार `String` आहे.

आता आपण प्रकार (`Type`) ही संकल्पना पद्धतशीरपणे शिकणार आहोत, तसेच explicit type declaration आणि type inference समजून घेणार आहोत, जेणेकरून variable चे खरे स्वरूप अधिक सखोलपणे समजू शकेल.

## प्रकार म्हणजे काय

Swift मध्ये प्रत्येक value ला एक स्पष्ट प्रकार असतो. प्रकार ठरवतो की हे value काय आहे आणि ते काय करू शकते.

उदाहरणार्थ:

- `42` हा `Int` (पूर्णांक) आहे
- `"Hello"` हा `String` (स्ट्रिंग) आहे
- `true` हा `Bool` (बूलियन) आहे

हे वेगवेगळ्या प्रकारांमध्ये मोडतात आणि त्यांचा उपयोगही वेगळा असतो.

## Swift मधील सामान्य मूलभूत प्रकार

नवशिक्या टप्प्यात सर्वात जास्त वापरले जाणारे प्रकार पुढीलप्रमाणे आहेत:

- `String`: स्ट्रिंग (मजकूर)
- `Int`: पूर्णांक
- `Double`: दशांश संख्या (अधिक अचूकता)
- `Bool`: बूलियन मूल्य (`true/false`)

याशिवाय `Float` (दशांश संख्या) देखील आहे, पण त्याची अचूकता `Double` पेक्षा कमी असल्यामुळे तो तुलनेने कमी वापरला जातो; `Character` (एकच अक्षर) सुद्धा आहे, जसे `"A"`, `"!"` इत्यादी.

### प्रकार घोषित करणे（explicit type）

Swift मध्ये variable declare करताना प्रकार हाताने स्पष्टपणे लिहिता येतो:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

variable च्या नावानंतर `: प्रकार` लिहून type declare केला जातो.

array चा type लिहिण्याची पद्धत `: [प्रकार]` अशी आहे:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

या कोडमध्ये `scores` array मध्ये फक्त `Int` प्रकारचे elements साठवता येतात, आणि `tags` मध्ये फक्त `String`.

explicit type declaration मुळे code चा हेतू अधिक स्पष्ट होतो, आणि काही प्रसंगी type inference मधील त्रुटी टाळता येतात.

## type inference

अनेक प्रसंगी type स्पष्टपणे declare करण्याची गरज नसते:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"     // String
var isLogin = false  // Bool
var scores = [90, 85, 78]   // [Int]
var tags = ["Swift", "iOS"] // [String]
```

कारण Swift compiler “initial value” पाहून type आपोआप infer करतो.

## explicit declaration आणि type inference

मागील धड्यांमध्ये आपण explicit declaration वापरले नव्हते. उदाहरणार्थ:

```swift
var age: Int = 18
```

त्याऐवजी आपण type inference ला प्राधान्य दिले:

```swift
var age = 18
```

या उदाहरणात, दोन्ही syntax समतुल्य आहेत, कारण `age` शेवटी `Int` प्रकारचाच ठरतो. पण type inference अधिक संक्षिप्त आहे.

सुरुवातीच्या टप्प्यावर explicit declaration वर जोर न देण्याचे कारण म्हणजे type inference मुळे code मधील अतिरिक्त माहिती कमी होते आणि नवशिक्यांसाठी समज सुलभ होते.

## type का आवश्यक आहे

Swift ही एक strongly typed language आहे.

याचा अर्थ: एकदा variable चा type निश्चित झाला, की तो मनमानीपणे बदलता येत नाही.

उदाहरणार्थ:

```swift
var age: Int = 18

age = 20        // Success
age = "20"      // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

पहिले `20` हे `Int` प्रकारचे आहे, त्यामुळे ते `age` ला assign करता येते; पण `"20"` हे `String` प्रकारचे असल्यामुळे `Int` शी जुळत नाही, त्यामुळे error येतो.

`nums` हा `[Int]` प्रकारचा array आहे, त्यामुळे त्यात फक्त पूर्णांकच साठवता येतात; string मिसळता येत नाही.

type मुळे data कसा वापरला जातो यावर मर्यादा येतात. त्यामुळे compile stage वर type mismatch शोधता येतो, आणि type confusion मुळे येणारे bugs कमी होतात. यामुळे code अधिक स्थिर आणि maintainable बनतो.

## explicit type कधी आवश्यक असतो

Swift अनेकदा type आपोआप infer करू शकतो, पण काही प्रसंगी compiler type infer करू शकत नाही किंवा चुकीचा infer करतो. तेव्हा type हाताने declare करावा लागतो.

**1. रिकामा array**

रिकामा array तयार करताना type स्पष्ट लिहावा लागतो:

```swift
var nums: [Int] = []
```

जर type लिहिला नाही:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

compiler ला रिकाम्या array वरून element type समजू शकत नाही, त्यामुळे compile error येतो.

**2. चुकीचा inference टाळणे**

```swift
var value = 10   // Int
```

या उदाहरणात `10` हे `Double` सुद्धा असू शकते, पण decimal point नसल्यामुळे compiler ते default ने `Int` समजतो.

जर `value` ला floating-point value म्हणून वापरायचे असेल, तर type स्पष्टपणे declare करावा लागतो:

```swift
var value: Double = 10   // Double
```

जेव्हा type inference अपेक्षेप्रमाणे नसतो, तेव्हा explicit declaration किंवा literal चा format बदलून योग्य type निश्चित करावा.

**3. custom types**

पुढे आपण custom types देखील शिकू. custom types वापरताना देखील type explicit declare करणे सहसा गरजेचे असते:

```swift
var info: GameInfo
var users: [User] = []
```

याचे कारणही रिकाम्या array प्रमाणेच आहे: compiler ला रिकाम्या value वरून type infer करता येत नाही.

## type conversion

Swift मध्ये वेगवेगळ्या types मध्ये automatic conversion होत नाही; conversion हाताने करावी लागते.

उदाहरणार्थ, दोन वेगवेगळ्या प्रकारच्या संख्यांची बेरीज:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b   // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

या कोडमध्ये `a` हा `Int` आहे, `b` हा `Double` आहे. types वेगळे असल्यामुळे थेट operation करता येत नाही.

म्हणून operation करण्याआधी एखादे value एकाच type मध्ये convert करावे लागते:

```swift
var result = Double(a) + b
```

या कोडचा अर्थ असा की `a` या `Int` value ला `Double` मध्ये convert करून नंतर `b` सोबत बेरीज केली जाते, आणि निकाल `result` मध्ये साठवला जातो.

लक्षात ठेवा, type conversion मुळे मूळ variable चा type बदलत नाही. उदाहरणार्थ, `Double(a)` मुळे `a` चा `Int` प्रकार बदलत नाही; ते फक्त नवीन `Double` value तयार करते जी operation मध्ये वापरली जाते.

इतर types साठीही अशीच conversion करता येते, म्हणजे target type + `()` या स्वरूपात convert करावयाचे value आत द्यायचे. उदाहरणार्थ:

```
Int()、Double()、String()
```

उदाहरण:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

लक्षात ठेवा, सर्व conversion नेहमी यशस्वी होतीलच असे नाही. उदाहरणार्थ, `Double → Int` conversion करताना decimal भाग थेट truncate होतो; rounding होत नाही.

## type alias

Swift मध्ये विद्यमान type ला एक alias देऊन code अधिक अर्थपूर्ण बनवता येतो:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

इथे `UserID` प्रत्यक्षात अजूनही `Int` आहे; type बदललेला नाही, फक्त नाव अधिक अर्थपूर्ण झाले आहे.

मोठ्या codebase किंवा गुंतागुंतीच्या type असलेल्या projects मध्ये type alias मुळे code अधिक वाचनीय होतो.

## type उदाहरण

आता आपण एक साधे उदाहरण घेऊन type प्रत्यक्ष development मध्ये कसा उपयोगी पडतो ते पाहू.

### variable तयार करणे

सर्वप्रथम, `age` नावाचा variable तयार करू:

```swift
var age = 20
```

हा variable SwiftUI मध्ये दाखवायचा आणि बदलायचा असल्यामुळे, त्याला `@State` ने declare करावे लागेल:

```swift
@State private var age = 20
```

`private` याचा उल्लेख आपण आधी केला होता; याचा अर्थ हा variable फक्त सध्याच्या view मध्ये वापरता येतो. पुढे आपण हे अधिक तपशीलात शिकू.

### SwiftUI मध्ये data दाखवणे

SwiftUI मध्ये `age` variable दाखवणे:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

आता view मध्ये हे दिसेल:

```swift
age: 20
```

### data बदलणे

पुढे, `age` बदलण्यासाठी दोन buttons जोडू:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### run परिणाम

`changeAge1` वर क्लिक केल्यावर `age` ला `18` assign होईल:

```swift
age = 18
```

कारण `18` हा `Int` प्रकार आहे आणि `age` चा प्रकारही तोच आहे, त्यामुळे assignment यशस्वी होते.

पण `changeAge2` मुळे error येईल:

```swift
age = "18"
```

error message:

```
Cannot assign value of type 'String' to type 'Int'
```

कारण `"18"` हा `String` प्रकार आहे (स्ट्रिंग `""` मध्ये लिहावी लागते), पण `age` हा `Int` आहे. types वेगळे असल्यामुळे assignment होत नाही.

### error का येतो?

मूळ कारण या ओळीत आहे:

```swift
@State private var age = 20   // Int
```

इथे explicit type declaration नाही, पण सुरुवातीचे `20` हे `Int` असल्यामुळे compiler `age` चा type आपोआप `Int` infer करतो.

एकदा type निश्चित झाला की, नंतर दुसऱ्या प्रकाराची value assign करता येत नाही.

याशिवाय, `changeAge2` बटण “run time” ला fail होत नाही; ते compile stage वरच error दाखवते, आणि code compile होत नाही.

हेच Swift च्या strong typing च्या फायद्यांपैकी एक आहे: type संबंधी समस्या code लिहितानाच आधी सापडतात.

### योग्य पद्धत

error देणारा code काढून टाकल्यावर:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

`changeAge1` बटणावर क्लिक केल्यावर view update होऊन असे दिसेल:

```
age: 18
```

### explicit type declaration（optional）

define करतानाच type स्पष्टपणे लिहू शकतो:

```swift
@State private var age: Int = 20
```

यामुळे type अधिक स्पष्ट दिसतो, पण साध्या परिस्थितीत ते नेहमीच आवश्यक नसते.

## सारांश

या धड्यात आपण Swift च्या type system बद्दल आणि त्याचा प्रत्यक्ष development मध्ये होणारा उपयोग याबद्दल शिकलो.

Swift मध्ये प्रत्येक value ला एक स्पष्ट type असतो, आणि type ठरवतो की data चा अर्थ काय आहे आणि त्यावर कोणती operations करता येतात.

Swift ही strongly typed language असल्यामुळे, variable चा type एकदा ठरला की त्याला वेगळ्या प्रकाराची value assign करता येत नाही. हा नियम compile stage वरच त्रुटी शोधतो, ज्यामुळे runtime problems कमी होतात आणि code अधिक सुरक्षित बनतो.

variable चा type initial value वरून आपोआप infer होऊ शकतो, किंवा explicit declaration ने स्पष्टही करता येतो. काही परिस्थितीत (उदा. रिकामा array, चुकीचा type inference, custom types) compiler योग्य type infer करू शकत नाही, तेव्हा explicit declaration आवश्यक असतो.

वेगवेगळ्या types मध्ये automatic conversion होत नाही; `Int()`、`Double()`、`String()` अशा methods ने conversion स्पष्टपणे करावे लागते.

type alias देखील वापरता येतात, आणि विशेषतः गुंतागुंतीच्या projects मध्ये ते readability वाढवतात.

type हा फक्त data label नसून एक constraint mechanism आहे, जो data चा वापर सुरक्षित, स्पष्ट आणि नियंत्रित ठेवतो.

## विस्तार - Optional प्रकार

type conversion करताना काही operations fail होऊ शकतात.

उदाहरणार्थ, `String` ला `Double` मध्ये convert करणे:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

इथे `Double(input)` परत करत असलेला प्रकार `Double` नसून:

```
Double?
```

यालाच Optional प्रकार म्हणतात.

### Optional प्रकार परत का येतो?

कारण string मधील content निश्चित नसते. `"3.14"` हे `Double` मध्ये convert होऊ शकते, पण `"Hello"` चे `Double` मध्ये conversion होत नाही.

म्हणजेच, ही operation कधी यशस्वी होईल तर कधी fail होईल.

म्हणून Swift Optional प्रकार वापरून ही uncertainty व्यक्त करते.

### Optional प्रकार म्हणजे काय?

Optional प्रकार म्हणजे: एखादे value असूही शकते, किंवा नसूही शकते.

उदाहरणार्थ:

```
Double?
```

या प्रकाराचा अर्थ असा: value असेल तर print करताना `Optional(...)` असे दिसेल; value नसेल तर `nil` मिळेल.

लक्षात ठेवा, `nil` म्हणजे “काहीच value नाही”, ते `0` किंवा रिकामी string नाही.

### उदाहरण

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

output:

```
pi:Optional(3.14)
```

याचा अर्थ string चे `Double` मध्ये conversion यशस्वी झाले, आणि `3.14` मिळाले; पण प्रकार `Double?` असल्यामुळे ते `Optional` मध्ये wrap झालेले दिसते.

जर conversion fail झाले:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

output:

```
pi: nil
```

कारण `"Hello"` चे `Double` मध्ये conversion होऊ शकत नाही, त्यामुळे conversion fail होऊन `nil` मिळते.

### Optional(...) म्हणजे काय?

जेव्हा आपण Optional प्रकार थेट print करतो:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift त्याचे “debug description” दाखवते:

```
Optional(3.14)
```

हे प्रत्यक्ष data चा भाग नसतो; ते फक्त सध्याचे value हे एक “Optional प्रकार” आहे आणि त्याच्या आत एक value आहे याची सूचना असते.

### Optional unwrap करणे

प्रत्यक्ष development मध्ये आपल्याला Optional मधून खरे value बाहेर काढावे लागते. या प्रक्रियेला unwrapping म्हणतात.

एक सामान्य मार्ग म्हणजे `??` वापरून default value देणे:

```
??
```

याला Nil-Coalescing Operator म्हणतात.

उदाहरणार्थ:

```swift
name ?? "FangJunyu"
```

या कोडचा अर्थ: `name` ला value असेल तर ते परत करा; `nil` असेल तर default `"FangJunyu"` वापरा.

लक्षात ठेवा, default value चा प्रकार Optional type शी जुळणारा असला पाहिजे.

### `??` वापरून default value देणे

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

output:

```
pi: 30
```

`input` चे `Double` मध्ये conversion यशस्वी झाले, त्यामुळे conversion चे value output झाले. जर conversion fail झाले, तर `??` ने दिलेले default value output होईल.

जर conversion fail झाले:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

output:

```
pi: 10
```

इथे `input` चे `Double` मध्ये conversion fail झाले, त्यामुळे `nil` परत आले; आणि `??` ने `nil` साठी default value दिले.

Optional प्रकाराचा उपयोग “value असू शकते किंवा नसूही शकते” अशी परिस्थिती दर्शवण्यासाठी होतो.

type conversion सारख्या fail होऊ शकणाऱ्या operations मध्ये Swift Optional प्रकार परत करते, जेणेकरून program सुरक्षित राहील.

जेव्हा आपल्याला त्यातील value वापरायचे असेल, तेव्हा `??` वापरून default value देऊ शकतो, ज्यामुळे `nil` आल्यावरही एक योग्य परिणाम मिळतो.
