# టైప్ వ్యవస్థ

ముందటి పాఠాల్లో, మనం ఇప్పటికే variables గురించి నేర్చుకున్నాం. అలాగే variables వేర్వేరు రకాల data ను నిల్వ చేయగలవని కూడా తెలుసుకున్నాం.

ఉదాహరణకు:

```swift
var hello = "Hello, World"
```

ఇక్కడ hello ఒక text ను నిల్వ చేస్తోంది, కాబట్టి దాని type అనేది String.

తర్వాత, మనం type అనే భావనను వ్యవస్థీకృతంగా నేర్చుకుంటాము. అలాగే explicit type declaration మరియు type inference ను కూడా అధ్యయనం చేస్తాము, తద్వారా variable యొక్క అసలు స్వరూపాన్ని ఇంకా లోతుగా అర్థం చేసుకోవచ్చు.

## టైప్ అంటే ఏమిటి

Swift లో, ప్రతి value కి ఒక స్పష్టమైన type ఉంటుంది. ఒక value ఏమిటి, అది ఏమి చేయగలదు అన్నది type నిర్ణయిస్తుంది.

ఉదాహరణకు:

* 42 అనేది Int (integer)
* "Hello" అనేది String (string)
* true అనేది Bool (boolean)

ఇవి వేర్వేరు types కు చెందినవి, వాటి ఉపయోగాలూ కూడా వేర్వేరు.

## Swift లో సాధారణ ప్రాథమిక types

ప్రారంభ దశలో, అత్యంత సాధారణ types ఇవి:

* String：string (text)
* Int：integer
* Double：floating-point number (decimal తో, ఎక్కువ precision)
* Bool：boolean value (true/false)

అదనంగా, Float (floating-point number) కూడా ఉంది, కానీ దాని precision Double కంటే తక్కువ, కాబట్టి సాధారణంగా తక్కువగా ఉపయోగిస్తారు; అలాగే Character (single character) కూడా ఉంది, ఉదాహరణకు "A"、"!" వంటి ఒక్క అక్షరాలు.

### Type declaration (explicit type)

Swift లో, variable declare చేసే సమయంలో type ను చేతితో కూడా specify చేయవచ్చు:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Variable పేరు తర్వాత ": Type" జోడించడం ద్వారా variable యొక్క type ను declare చేస్తారు.

Array యొక్క type రాత విధానం ": [Type]" ఇలా ఉంటుంది:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

ఈ కోడ్‌లో, scores array లో Int type elements మాత్రమే నిల్వ చేయగలదు; tags లో String type elements మాత్రమే నిల్వ చేయగలదు.

Explicit type declaration వాడటం వల్ల code యొక్క ఉద్దేశ్యం మరింత స్పష్టంగా కనిపిస్తుంది. అలాగే కొన్ని సందర్భాల్లో type inference లో వచ్చే పొరపాట్లను నివారించవచ్చు.

## Type inference

చాలా సందర్భాల్లో, type ను explicit గా declare చేయాల్సిన అవసరం ఉండదు:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

దీనికి కారణం, Swift compiler "initial value" ఆధారంగా type ను స్వయంచాలకంగా infer చేస్తుంది.

## Explicit declaration మరియు type inference

ముందటి పాఠాల్లో, మనం explicit declaration ను పరిచయం చేయలేదు. ఉదాహరణకు:

```swift
var age: Int = 18
```

దాని బదులుగా, type inference ను ప్రాధాన్యంగా ఉపయోగించాము:

```swift
var age = 18
```

ఈ ఉదాహరణలో, ఈ రెండు రీతులూ సమానమే. రెండింటిలోనూ age ను Int type గా నిర్ణయిస్తారు. పోలిస్తే, type inference రాత విధానం మరింత సులభంగా, సంక్షిప్తంగా ఉంటుంది.

మొదటి దశలో explicit declaration ను బలంగా చెప్పకపోవడానికి కారణం, type inference వాడితే code లోని అదనపు సమాచారాన్ని తగ్గించవచ్చు. దీనివల్ల beginners కి అర్థం చేసుకోవడం తేలిక అవుతుంది.

## Type ఎందుకు అవసరం

Swift అనేది ఒక strongly typed language.

అంటే: ఒకసారి variable యొక్క type నిర్ణయించబడితే, దాన్ని యాదృచ్ఛికంగా మార్చలేరు.

ఉదాహరణకు:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

మొదటి 20 అనేది Int type, కాబట్టి దాన్ని age కి assign చేయవచ్చు; రెండో "20" అనేది String type, ఇది Int type తో సరిపోలదు, కాబట్టి error వస్తుంది.

nums అనేది [Int] type array, కాబట్టి అందులో integers మాత్రమే నిల్వ చేయాలి; string ను కలపలేరు.

Type అనేది data యొక్క వినియోగాన్ని నియంత్రిస్తుంది. ఇది compile దశలోనే type mismatch సమస్యలను గుర్తిస్తుంది. దాంతో type confusion వల్ల వచ్చే BUGలు తగ్గుతాయి, code stability మరియు maintainability మెరుగవుతుంది.

## ఎప్పుడు explicit type declaration తప్పనిసరి

Swift చాలా సందర్భాల్లో type ను ఆటోమేటిక్‌గా infer చేయగలదు. కానీ కొన్ని సందర్భాల్లో compiler infer చేయలేడు, లేదా తప్పుగా infer చేస్తాడు. అప్పుడు మనం type ను చేతితో declare చేయాలి.

**1. ఖాళీ array**

Empty array సృష్టించే సమయంలో, explicit గా type ను declare చేయాలి:

```swift
var nums: [Int] = []
```

Type రాయకపోతే:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compiler ఖాళీ array నుండి element type ను infer చేయలేడు. అందువల్ల compile error వస్తుంది.

**2. తప్పు inference ను నివారించడం**

```swift
var value = 10   // Int
```

ఈ ఉదాహరణలో, 10 ను floating-point number (Double) గా కూడా చూడవచ్చు. కానీ decimal point లేకపోవడం వల్ల compiler దాన్ని default గా Int type గా infer చేస్తుంది.

value ని floating-point number గా చూపించాలని అనుకుంటే, explicit గా declare చేయాలి:

```swift
var value: Double = 10   // Double
```

Type inference ఫలితం ఆశించిన విధంగా రాకపోతే, explicit declaration లేదా literal రాత విధానాన్ని మార్చడం ద్వారా సరైన type ను నిర్ధారించాలి.

**3. Custom types**

తర్వాత మనం custom types గురించి కూడా నేర్చుకుంటాము. Custom type వాడే సమయంలో కూడా సాధారణంగా explicit declaration అవసరం అవుతుంది:

```swift
var info: GameInfo
var users: [User] = []
```

ఇది కూడా empty array సందర్భం లాంటిదే. Compiler ఖాళీ value నుంచి type ను స్వయంగా infer చేయలేడు.

## Type conversion

Swift లో, వేర్వేరు types మధ్య automatic conversion జరగదు. తప్పనిసరిగా manual conversion చేయాలి.

ఉదాహరణకు, రెండు వేర్వేరు type ల numbers ను కలపడం:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

ఈ కోడ్‌లో, a అనేది Int type, b అనేది Double type. Types వేర్వేరుగా ఉన్నందున, వాటిపై నేరుగా arithmetic operation చేయలేం.

Operation చేయడానికి ముందు, వాటిలో ఒకదాన్ని ఇంకోదానికి సరిపోయే type గా మార్చాలి:

```swift
var result = Double(a) + b
```

ఈ కోడ్‌లో, Int type అయిన a ను Double type గా మార్చి, తర్వాత b తో కలిపి result కి assign చేస్తున్నారు.

గమనించాల్సిన విషయం ఏమిటంటే, type conversion original variable యొక్క type ను మార్చదు. ఉదాహరణకు, Double(a) వాడటం వల్ల a యొక్క Int type మారదు; అది కేవలం operation కోసం కొత్త Double value ను సృష్టిస్తుంది.

ఇతర types ను కూడా ఇలాగే convert చేయవచ్చు. అంటే target type + () రూపంలో, మార్చాల్సిన value ని అందులో ఇవ్వాలి. ఉదాహరణకు:

```swift
Int()、Double()、String()
```

ఉదాహరణ:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

గమనించాలి: అన్ని type conversions విజయవంతం కావు. ఉదాహరణకు Double → Int మార్పులో decimal భాగం నేరుగా truncate అవుతుంది; round చేయబడదు.

## Type alias

Swift లో, ఇప్పటికే ఉన్న ఒక type కు మరో పేరు ఇవ్వవచ్చు. దీనివల్ల code యొక్క అర్థం మరింత స్పష్టంగా ఉంటుంది:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

ఇక్కడ UserId అసలు విషయానికి వస్తే ఇంకా Int నే. Type మారలేదు, కానీ పేరు మరింత అర్థవంతంగా మారింది.

పెద్ద codebase లలో, type alias వాడటం వల్ల code readability మెరుగవుతుంది.

## Type example

ఇప్పుడు ఒక సరళమైన ఉదాహరణ ద్వారా, actual development లో type ఎలా పని చేస్తుందో చూద్దాం.

### Variable సృష్టించడం

మొదట, ఒక age variable ను సృష్టిద్దాం:

```swift
var age = 20
```

ఈ variable ను SwiftUI లో చూపించాలి, అలాగే మార్చాలి కూడా. కాబట్టి దీనిని @State తో declare చేయాలి:

```swift
@State private var age = 20
```

private గురించి మనం ముందే కొద్దిగా చూశాం. దీని అర్థం, ఈ variable ప్రస్తుత view లో మాత్రమే ఉపయోగించబడుతుంది. దీని గురించి తరువాత మరింతగా నేర్చుకుంటాము.

### SwiftUI లో data ను చూపించడం

SwiftUI లో age variable ను ఇలా చూపించవచ్చు:

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

ఇప్పుడు view ఇలా చూపిస్తుంది:

```swift
age: 20
```

### Data ను మార్చడం

తర్వాత, age ను మార్చడానికి రెండు buttons జోడిద్దాం:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Run result

changeAge1 నొక్కినప్పుడు, age కి 18 assign అవుతుంది:

```swift
age = 18
```

ఎందుకంటే 18 అనేది Int type, ఇది age type తో సరిపోతుంది, కాబట్టి assignment విజయవంతమవుతుంది.

changeAge2 అయితే error ఇస్తుంది:

```swift
age = "18"
```

Error message:

```swift
Cannot assign value of type 'String' to type 'Int'
```

దానికి కారణం, "18" అనేది String type (" " లో ఉన్నవి string అవుతాయి), కానీ age అనేది Int type. Types వేర్వేరుగా ఉన్నందున assignment సాధ్యం కాదు.

### Error ఎందుకు వస్తోంది?

ఇక్కడ కీలకమైన code line ఇది:

```swift
@State private var age = 20   // Int
```

ఇక్కడ explicit type declaration లేదు. కానీ initial value 20 అనేది Int type కాబట్టి, compiler age ను ఆటోమేటిక్‌గా Int type గా infer చేస్తుంది.

ఒకసారి type నిర్ణయించబడితే, తర్వాత దానికి వేరే type value assign చేయలేం.

అలాగే, changeAge2 button లోని సమస్య “runtime failure” కాదు. అది compile దశలోనే error ఇస్తుంది. అంటే code compile కావడమే ఆగిపోతుంది.

ఇది Swift strongly typed language కావడం వల్ల కలిగే ముఖ్యమైన ప్రయోజనాల్లో ఒకటి: code వ్రాస్తున్నప్పుడే type సమస్యలను ముందుగానే గుర్తించవచ్చు.

### సరైన రాత విధానం

తప్పు code ను తొలగించిన తర్వాత:

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

changeAge1 button నొక్కినప్పుడు, view ఇలా update అవుతుంది:

```swift
age: 18
```

### Explicit type declaration (optional)

Define చేసే సమయంలో type ను స్పష్టంగా కూడా రాయవచ్చు:

```swift
@State private var age: Int = 20
```

ఈ రాత విధానం type ను మరింత స్పష్టంగా చూపిస్తుంది. కానీ సరళమైన సందర్భాల్లో ఇది తప్పనిసరి కాదు.

## సారాంశం

ఈ పాఠం ప్రధానంగా Swift యొక్క type system మరియు actual development లో దాని పాత్ర గురించి చెప్పింది.

Swift లో, ప్రతి value కి ఒక నిర్దిష్టమైన type ఉంటుంది. Type అనేది data యొక్క అర్థాన్ని నిర్ణయిస్తుంది, అలాగే అది ఏ operations లో పాల్గొనగలదో కూడా నిర్ణయిస్తుంది.

Swift అనేది strongly typed language. ఒకసారి variable యొక్క type నిర్ణయించబడితే, తర్వాత దానికి వేరే type assign చేయలేం. ఈ నియంత్రణ వల్ల compile దశలోనే errors గుర్తించబడతాయి. దాంతో runtime సమస్యలు తగ్గి, code safety పెరుగుతుంది.

Variable యొక్క type ను initial value ఆధారంగా ఆటోమేటిక్‌గా infer చేయవచ్చు, లేదా explicit గా declare చేయవచ్చు. కొన్ని సందర్భాల్లో (ఉదాహరణకు empty arrays, type inference mistakes, custom types), compiler సరైన type ను infer చేయలేడు. అప్పుడు explicit declaration తప్పనిసరిగా అవసరం అవుతుంది.

వేర్వేరు types మధ్య automatic conversion ఉండదు. తప్పనిసరిగా Int()、Double()、String() వంటి పద్ధతుల ద్వారా explicit conversion చేయాలి.

Type కి alias కూడా ఇవ్వవచ్చు. ముఖ్యంగా పెద్ద, క్లిష్టమైన projects లో, type alias code readability ను మెరుగుపరుస్తుంది.

Type అనేది కేవలం data కు label మాత్రమే కాదు; అది ఒక constraint mechanism కూడా. దీని వల్ల data వినియోగం సురక్షితంగా, స్పష్టంగా, నియంత్రణలో ఉండేలా చూస్తుంది.

## విస్తరణ జ్ఞానం - Optional type

Type conversion చేసే సమయంలో, కొన్ని operations విఫలమయ్యే అవకాశం ఉంటుంది.

ఉదాహరణకు, String ను Double గా మార్చడం:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

ఇక్కడ Double(input) రిటర్న్ చేసేది Double కాదు, ఇది:

```swift
Double?
```

ఇదే Optional type.

### Optional type ఎందుకు తిరిగి వస్తుంది?

ఎందుకంటే string లో ఉన్న content ఖచ్చితంగా predictable కాదు. "3.14" ను Double గా మార్చవచ్చు, కానీ "Hello" ను Double గా మార్చలేం.

అంటే, ఈ operation విజయవంతమవొచ్చు, లేక విఫలమవొచ్చు.

అందుకే Swift ఈ అనిశ్చిత పరిస్థితిని చూపించడానికి Optional type ను ఉపయోగిస్తుంది.

### Optional type అంటే ఏమిటి?

Optional type అంటే: ఒక value ఉండవచ్చు, లేకపోవచ్చు కూడా.

ఉదాహరణకు:

```swift
Double?
```

ఈ type అర్థం ఏమిటంటే, value ఉంటే print చేసినప్పుడు Optional(...) గా కనిపిస్తుంది; లేకపోతే nil వస్తుంది.

గమనించాలి: nil అంటే "విలువ లేదు" అనే అర్థం. అది 0 కాదు, ఖాళీ string కూడా కాదు.

### ఉదాహరణ

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```swift
pi:Optional(3.14)
```

దీని అర్థం, string విజయవంతంగా Double గా మార్చబడింది, మరియు 3.14 లభించింది. కానీ type అనేది Double? కావడం వల్ల అది Optional లో wrap అయి ఉంది.

Conversion విఫలమైతే:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```swift
pi: nil
```

ఎందుకంటే "Hello" ను Double type గా మార్చలేరు. కాబట్టి conversion విఫలమై nil వస్తుంది.

### Optional(...) అంటే ఏమిటి?

మనము optional type value ను నేరుగా print చేసినప్పుడు:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift దాని “debug description” ను చూపిస్తుంది:

```swift
Optional(3.14)
```

ఇది అసలు data లో భాగం కాదు. ఇది కేవలం ప్రస్తుత value ఒక "optional type" అని, దాని లోపల ఒక value ఉందని సూచించే రీతిమాత్రమే.

### Optional ను unwrapping చేయడం

వాస్తవ అభివృద్ధిలో, optional type లోని నిజమైన value ను తీసుకోవాల్సి ఉంటుంది. ఈ ప్రక్రియను unwrapping అంటారు.

అత్యంత సాధారణమైన పద్ధతుల్లో ఒకటి ?? ను ఉపయోగించి default value ఇవ్వడం:

```swift
??
```

దీనిని Nil-Coalescing Operator అంటారు.

ఉదాహరణకు:

```swift
name ?? "FangJunyu"
```

ఈ కోడ్ అర్థం: name కి value ఉంటే ఆ value ను రిటర్న్ చేయాలి; అది nil అయితే default value "FangJunyu" ను ఉపయోగించాలి.

గమనించాలి: default value యొక్క type, optional type తో సరిపోవాలి.

### ?? ఉపయోగించి default value ఇవ్వడం

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```swift
pi: 30
```

input ను Double గా మార్చినప్పుడు, conversion విజయవంతమవుతుంది కాబట్టి value output అవుతుంది. Conversion విఫలమైతే, ?? ఇచ్చిన default value output అవుతుంది.

Conversion విఫలమైతే:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```swift
pi: 10
```

ఇక్కడ, input ను Double గా మార్చే ప్రయత్నం విఫలమవుతుంది, మరియు nil వస్తుంది. అప్పుడు ?? nil కోసం ఒక default value ను అందిస్తుంది.

Optional type అనేది “విలువ ఉండవచ్చు, లేకపోవచ్చు” అనే పరిస్థితిని సూచించడానికి ఉపయోగించబడుతుంది.

Type conversion వంటి విఫలమయ్యే అవకాశం ఉన్న operations లో, Swift program safety కోసం optional type ను రిటర్న్ చేస్తుంది.

అందులోని value ను ఉపయోగించాల్సినప్పుడు, ?? ద్వారా default value ఇవ్వవచ్చు. దీంతో nil వచ్చినప్పటికీ, మనం ఇంకా ఒక సమంజసమైన ఫలితాన్ని పొందగలుగుతాము.
