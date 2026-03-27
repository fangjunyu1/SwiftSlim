# வகை அமைப்பு

முந்தைய பாடங்களில், நாம் variable-களை கற்றோம். மேலும், variable-கள் வெவ்வேறு வகையான data-ஐ சேமிக்க முடியும் என்பதை அறிந்தோம்.

உதாரணமாக:

```swift
var hello = "Hello, World"
```

இங்கு hello ஒரு text-ஐ சேமிக்கிறது. ஆகவே அதன் type என்பது String.

அடுத்து, type என்ற கருத்தை முறையாகக் கற்போம். அதோடு explicit type declaration மற்றும் type inference ஆகியவற்றையும் பார்க்கப் போகிறோம். இதன் மூலம் variable-ன் உண்மையான தன்மையை இன்னும் ஆழமாகப் புரிந்துகொள்ளலாம்.

## Type என்பது என்ன

Swift-இல், ஒவ்வொரு value-க்கும் ஒரு தெளிவான type இருக்கும். அந்த value என்ன, அது என்ன செய்ய முடியும் என்பதைக் type தான் தீர்மானிக்கிறது.

உதாரணமாக:

* 42 என்பது Int (முழு எண்)
* "Hello" என்பது String (சரம் / உரை)
* true என்பது Bool (boolean மதிப்பு)

இவை வெவ்வேறு type-களுக்குச் சேர்ந்தவை. அவற்றின் பயன்பாடுகளும் வேறுபடும்.

## Swift-இல் பொதுவாகப் பயன்படுத்தப்படும் அடிப்படை type-கள்

தொடக்க நிலை கற்றலில், அதிகம் சந்திக்கப்படும் type-கள் பின்வருமாறு:

* String：string (உரை)
* Int：முழு எண்
* Double：floating-point எண் (தசமத்துடன், அதிக துல்லியம்)
* Bool：boolean மதிப்பு (true/false)

இதற்கு மேலாக Float (floating-point type) உள்ளது. ஆனால் அதன் துல்லியம் Double-ஐ விடக் குறைவு; எனவே பொதுவாக குறைவாகப் பயன்படுத்தப்படுகிறது. Character (ஒற்றை எழுத்து) எனும் type-மும் உள்ளது. உதாரணமாக "A", "!" போன்றவை.

### Type declaration (explicit type)

Swift-இல், variable அறிவிக்கும் போதே அதன் type-ஐ கையால் குறிப்பிடலாம்:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Variable பெயருக்கு பிறகு ": Type" என எழுதுவதன் மூலம் அதன் type அறிவிக்கப்படுகிறது.

Array type எழுதும் முறை ": [Type]" ஆகும்:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

இந்த code-இல், scores array-ல் Int type elements மட்டுமே இருக்க முடியும். tags array-ல் String type elements மட்டுமே இருக்க முடியும்.

Explicit type declaration code-ன் நோக்கத்தை மேலும் தெளிவாக காட்டும். சில சூழல்களில் type inference தவறுகளைத் தவிர்க்கவும் இது உதவும்.

## Type inference

பல சந்தர்ப்பங்களில், type-ஐ explicit-ஆக எழுத வேண்டியதில்லை:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

ஏனெனில் Swift compiler, "initial value" அடிப்படையில் type-ஐ தானாக infer செய்யும்.

## Explicit declaration மற்றும் type inference

முந்தைய பாடங்களில், நாம் explicit declaration-ஐ கொண்டு வரவில்லை. உதாரணமாக:

```swift
var age: Int = 18
```

அதற்குப் பதிலாக, type inference-ஐ முன்னுரிமையாகப் பயன்படுத்தினோம்:

```swift
var age = 18
```

இந்த எடுத்துக்காட்டில், இந்த இரண்டு எழுதும் முறைகளும் சமமானவை. இரண்டிலும் age, Int type என தீர்மானிக்கப்படும். ஒப்பிடும்போது, type inference எழுதும் முறை சுருக்கமானது.

ஆரம்ப கட்டத்தில் explicit declaration-ஐ வலியுறுத்தாததற்குக் காரணம், type inference code-இல் உள்ள கூடுதல் தகவல்களை குறைக்கிறது. இதனால் தொடக்கநிலை கற்றலில் புரிதல் சுமை குறைகிறது.

## ஏன் type தேவை

Swift என்பது ஒரு strong type language.

இதன் பொருள்: ஒரு variable-ன் type ஒருமுறை நிர்ணயிக்கப்பட்டுவிட்டால், அதை விருப்பப்படி மாற்ற முடியாது.

உதாரணமாக:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

முதல் 20 என்பது Int type. ஆகவே age-க்கு assign செய்ய முடியும். இரண்டாவது "20" என்பது String type. அது Int type-உடன் பொருந்தாது. எனவே error வரும்.

nums என்பது [Int] type array. அதில் integer-கள் மட்டுமே சேமிக்க முடியும்; string-ஐ சேர்க்க முடியாது.

Type, data பயன்பாட்டை கட்டுப்படுத்துகிறது. Compile stage-இலேயே type mismatch பிரச்சினைகளை கண்டுபிடிக்க முடியும். இதனால் type confusion காரணமாக வரும் bug-கள் குறையும்; code-ன் stability மற்றும் maintainability உயரும்.

## எப்போது explicit type declaration அவசியம்

Swift தானாக type infer செய்ய முடிந்தாலும், சில சமயங்களில் compiler type-ஐ infer செய்ய முடியாது. அல்லது தவறாக infer செய்யலாம். அப்போது type-ஐ கையால் declare செய்ய வேண்டும்.

**1. காலியான array**

ஒரு empty array உருவாக்கும்போது, type-ஐ explicit-ஆக declare செய்ய வேண்டும்:

```swift
var nums: [Int] = []
```

Type எழுதாமல் இருந்தால்:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compiler, empty array-யில் உள்ள element type என்ன என்பதை infer செய்ய முடியாது. அதனால் compile error வரும்.

**2. தவறான inference-ஐத் தவிர்க்க**

```swift
var value = 10   // Int
```

இந்த எடுத்துக்காட்டில், 10 என்பது floating-point number (Double) ஆகவும் கொள்ளப்படலாம். ஆனால் decimal point இல்லாததால், compiler அதை default ஆக Int type என infer செய்யும்.

value ஒரு floating-point value ஆக இருக்க வேண்டும் என்றால், explicit-ஆக declare செய்ய வேண்டும்:

```swift
var value: Double = 10   // Double
```

Type inference முடிவு எதிர்பார்ப்பிற்கு ஏற்ப இல்லாதபோது, explicit type declaration அல்லது literal-ஐ மாற்றுவதன் மூலம் சரியான type-ஐ உறுதிப்படுத்த வேண்டும்.

**3. Custom type**

பிறகு நாம் custom type-களையும் கற்போம். Custom type பயன்படுத்தும்போது, பொதுவாக explicit declaration தேவைப்படும்:

```swift
var info: GameInfo
var users: [User] = []
```

இதற்கான காரணமும் empty array போலவே தான். Compiler, empty value-இல் இருந்து type-ஐ தானாக infer செய்ய முடியாது.

## Type conversion

Swift-இல், வெவ்வேறு type-களுக்கு இடையில் automatic conversion நடைபெறாது. கையால் conversion செய்ய வேண்டும்.

உதாரணமாக, இரண்டு வெவ்வேறு type கொண்ட எண்களை கூட்டுவது:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

இந்த code-இல், a என்பது Int type, b என்பது Double type. Type-கள் வேறுபடுவதால், நேரடியாக operation செய்ய முடியாது.

Operation செய்யும் முன், ஒரு value-ஐ மற்றதுடன் ஒரே type ஆக மாற்ற வேண்டும்:

```swift
var result = Double(a) + b
```

இந்த code, Int type ஆன a-ஐ Double type ஆக மாற்றி, பின்னர் b-உடன் கூட்டுகிறது. அதன் முடிவு result-க்கு assign செய்யப்படுகிறது.

கவனிக்க வேண்டியது: type conversion, original variable-ன் type-ஐ மாற்றாது. உதாரணமாக, Double(a) என்பது a-ன் Int type-ஐ மாற்றுவதில்லை; மாறாக operation-க்கு பயன்படுத்த ஒரு புதிய Double value உருவாக்குகிறது.

மற்ற type-களையும் இதேபோல் convert செய்யலாம். அதாவது target type + () என்ற வடிவில், convert செய்ய வேண்டிய value-ஐ உள்ளே கொடுக்க வேண்டும்.

```
Int()、Double()、String()
```

உதாரணம்:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

கவனிக்க வேண்டியது: எல்லா type conversion-களும் வெற்றியடையாது. உதாரணமாக Double → Int conversion-இல், decimal பகுதி நேரடியாக truncate செய்யப்படும்; அது round செய்யப்படாது.

## Type alias

Swift-இல், ஏற்கனவே இருக்கும் ஒரு type-க்கு வேறு பெயர் கொடுக்கவும் முடியும். இதை typealias என்கிறோம். இது code-ன் semantics-ஐ இன்னும் தெளிவாக்கும்:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

இங்கு UserId என்பதன் அடிப்படை தன்மை இன்னும் Int தான். Type மாற்றப்படவில்லை; அதன் பெயரே மேலும் பொருள் கொண்டதாக மாறியுள்ளது.

Code அதிகமாகவும், type-கள் சிக்கலாகவும் இருக்கும் project-களில், type alias code-ஐப் படிக்க எளிதாக்கும்.

## Type எடுத்துக்காட்டு

இப்போது ஒரு எளிய எடுத்துக்காட்டின் மூலம், நடைமுறை development-இல் type எப்படி செயல்படுகிறது என்பதைப் பார்ப்போம்.

### Variable உருவாக்குதல்

முதலில், age என்ற variable ஒன்றை உருவாக்குகிறோம்:

```swift
var age = 20
```

இந்த variable-ஐ SwiftUI-ல் காட்டியும் மாற்றியும் ஆக வேண்டும். எனவே, அதை @State மூலம் declare செய்ய வேண்டும்:

```swift
@State private var age = 20
```

private பற்றி முன்பே குறிப்பிட்டுள்ளோம். இது அந்த variable தற்போதைய view-க்குள் மட்டும் பயன்படுத்தப்பட முடியும் என்பதைக் குறிக்கிறது. இதை நாம் பின்னர் மேலும் கற்போம்.

### SwiftUI-ல் data-ஐ காட்டுதல்

SwiftUI-ல் age variable-ஐ காட்டுவது:

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

இப்போது view இதைப் காட்டும்:

```swift
age: 20
```

### Data-ஐ மாற்றுதல்

அடுத்து, age-ஐ மாற்ற இரண்டு button-களைச் சேர்க்கலாம்:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Run செய்தபோது வரும் முடிவு

changeAge1 அழுத்தப்படும்போது, age-க்கு 18 assign செய்யப்படும்:

```swift
age = 18
```

18 என்பது Int type. age-யின் type-உம் Int என்பதால் assign வெற்றியடையும்.

changeAge2 error தரும்:

```swift
age = "18"
```

Error message:

```
Cannot assign value of type 'String' to type 'Int'
```

ஏனெனில் "18" என்பது String type (string values "" மூலம் எழுதப்பட வேண்டும்), ஆனால் age என்பது Int type. Type-கள் வேறுபடுவதால் assign செய்ய முடியாது.

### ஏன் error வருகிறது?

முக்கியமான வரி இது:

```swift
@State private var age = 20   // Int
```

இங்கு explicit type declaration இல்லை. இருப்பினும் initial value 20 என்பது Int type என்பதால், compiler age-ஐ தானாக Int type என infer செய்கிறது.

ஒருமுறை type நிர்ணயிக்கப்பட்டுவிட்டால், அதற்கு வேறு type value assign செய்ய முடியாது.

மேலும், changeAge2 button “runtime”-இல் fail ஆகவில்லை; compile stage-இலேயே error வரும். Code compile ஆகாது.

இதுவே Swift strong type-ன் முக்கியமான நன்மைகளில் ஒன்று: code எழுதும் நேரத்திலேயே type பிரச்சினைகளை முன்கூட்டியே கண்டுபிடிக்க முடியும்.

### சரியான எழுதும் முறை

தவறான code-ஐ நீக்கிய பிறகு:

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

changeAge1 button அழுத்தப்படும் போது, view இவ்வாறு update ஆகும்:

```
age: 18
```

### Explicit type declaration (விருப்பமானது)

Define செய்யும் போதே type-ஐ தெளிவாகக் குறிப்பிடவும் முடியும்:

```swift
@State private var age: Int = 20
```

இந்த எழுதும் முறை type-ஐ இன்னும் தெளிவாகக் காட்டும். ஆனால் எளிய சூழல்களில் இது கட்டாயம் அல்ல.

## சுருக்கம்

இந்தப் பாடம் Swift-இன் type system மற்றும் நடைமுறை development-இல் அதன் பங்கைப் பற்றியது.

Swift-இல், ஒவ்வொரு value-க்கும் ஒரு தெளிவான type உள்ளது. அந்த type, data-வின் அர்த்தத்தையும் அது எந்த operations-இல் பங்கேற்க முடியும் என்பதையும் தீர்மானிக்கிறது.

Swift strong type language ஆகும். ஒரு variable-ன் type நிர்ணயிக்கப்பட்ட பிறகு, அதற்கு வேறு type value assign செய்ய முடியாது. இந்த கட்டுப்பாடு compile stage-இலேயே errors-ஐ கண்டுபிடிக்க உதவுகிறது. இதனால் runtime பிரச்சினைகள் குறைந்து, code safety மேம்படும்.

Variable-ன் type initial value அடிப்படையில் தானாக infer செய்யப்படலாம். அல்லது explicit-ஆக declare செய்யலாம். சில சூழல்களில் (உதா: empty array, type inference தவறு, custom type) compiler சரியான type-ஐ infer செய்ய முடியாது. அப்போது explicit declaration அவசியமாகிறது.

வெவ்வேறு type-களுக்கிடையில் automatic conversion நடக்காது. Int(), Double(), String() போன்ற வழிகளில் explicit conversion செய்ய வேண்டும்.

Type-களுக்கு alias-களும் தரலாம். குறிப்பாக சிக்கலான project-களில், type alias readability-ஐ மேம்படுத்தும்.

Type என்பது ஒரு data label மட்டும் அல்ல; அது ஒரு கட்டுப்பாட்டு அமைப்பும் ஆகும். Data பாதுகாப்பாகவும், தெளிவாகவும், கட்டுப்பாட்டுடனும் பயன்படுத்தப்படுவதை இது உறுதிப்படுத்துகிறது.

## விரிவாக்க அறிவு - Optional type

Type conversion செய்யும் போது, சில operations fail ஆகக்கூடும்.

உதாரணமாக, String-ஐ Double ஆக மாற்றுவது:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

இங்கு Double(input) திருப்பி வழங்குவது Double அல்ல; அது:

```
Double?
```

இதுவே Optional type.

### ஏன் Optional திரும்ப வருகிறது?

ஏனெனில் string content நிரந்தரமானதல்ல. "3.14" என்பதை Double ஆக மாற்ற முடியும்; ஆனால் "Hello" என்பதை Double ஆக மாற்ற முடியாது.

அதாவது, இந்த operation வெற்றியடையவும் முடியும், தோல்வியடையவும் முடியும்.

அதனால் Swift, இந்த uncertainty-ஐ காட்ட Optional type-ஐப் பயன்படுத்துகிறது.

### Optional type என்பது என்ன?

Optional type என்பதன் பொருள்: ஒரு value இருக்கலாம்; இல்லாமலும் இருக்கலாம்.

உதாரணமாக:

```
Double?
```

இந்த type-ன் பொருள், value இருந்தால் print செய்யும்போது Optional(...) எனத் தோன்றும்; value இல்லையெனில் nil திரும்பும்.

கவனிக்க வேண்டியது: nil என்பது "value இல்லை" என்பதைக் குறிக்கிறது. அது 0 அல்லது empty string அல்ல.

### எடுத்துக்காட்டு

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```
pi:Optional(3.14)
```

இதன் பொருள், string வெற்றிகரமாக Double ஆக மாற்றப்பட்டுள்ளது. 3.14 என்ற value கிடைத்துள்ளது. ஆனால் type Double? என்பதால், அது Optional-இல் wrap செய்யப்பட்டுள்ளது.

Conversion fail ஆனால்:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```
pi: nil
```

ஏனெனில் "Hello" என்பதை Double type ஆக மாற்ற முடியாது. ஆகவே conversion fail ஆகி nil திரும்புகிறது.

### Optional(...) என்பது என்ன?

Optional type-ஐ நேரடியாக print செய்தால்:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift, அதன் “debug description”-ஐக் காட்டும்:

```
Optional(3.14)
```

இது actual data-வின் ஒரு பகுதி அல்ல. மாறாக, தற்போதைய value ஒரு "optional type" என்றும் அதற்குள் ஒரு value உள்ளது என்றும் காட்டும் ஒரு குறிப்பு.

### Optional-ஐ unwrap செய்வது

நடைமுறை development-இல், optional type-இல் இருந்து உண்மையான value-ஐ எடுக்க வேண்டி வரும். இந்த செயல்முறை unwrapping எனப்படுகிறது.

ஒரு பொதுவான வழி, ?? பயன்படுத்தி default value கொடுப்பது:

```
??
```

இதன் பெயர்: Nil-Coalescing Operator.

உதாரணமாக:

```swift
name ?? "FangJunyu"
```

இந்த code-ன் பொருள், name-க்கு value இருந்தால் அதையே return செய்; அது nil என்றால் default value "FangJunyu" பயன்படுத்தப்பட வேண்டும்.

கவனிக்க வேண்டியது: default value-ன் type, optional-இன் உள்ள type-உடன் பொருந்த வேண்டும்.

### ?? பயன்படுத்தி default value கொடுத்தல்

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```
pi: 30
```

input, Double type ஆக convert செய்யும்போது conversion வெற்றியடைகிறது. அதனால் அதன் value print செய்யப்படுகிறது. Conversion fail ஆனால், ?? கொடுத்த default value பயன்படுத்தப்படும்.

Conversion fail ஆனால்:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```
pi: 10
```

இங்கு input, Double type ஆக convert செய்யும்போது தோல்வியடைந்து nil திரும்புகிறது. அப்போது ??, nil-க்கு ஒரு default value வழங்குகிறது.

Optional type என்பது “value இருக்கலாம், இல்லாமலும் இருக்கலாம்” என்ற நிலையை வெளிப்படுத்தப் பயன்படுகிறது.

Type conversion போன்ற fail ஆகக்கூடிய operations-இல், Swift program safety-ஐ உறுதிப்படுத்த Optional type-ஐ return செய்கிறது.

அதன் உள்ளே இருக்கும் value-ஐப் பயன்படுத்த வேண்டுமானால், ?? மூலம் default value வழங்கலாம். இதன் மூலம் nil வந்தாலும், நியாயமான ஒரு result கிடைக்கும்.
