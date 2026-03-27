# ఆపరేటర్లు

ఈ పాఠంలో, మనం Swift ఆపరేటర్లను (Operators) నేర్చుకుంటాము.

మనము గణన, పోలిక లేదా తార్కిక నిర్ణయాలు చేసే సమయంలో, ఆపరేటర్లను తప్పనిసరిగా ఉపయోగించాలి. ఈ చర్యలు మొత్తం ప్రోగ్రామ్ అమలులో అంతటా ఉంటాయి, మరియు ప్రోగ్రామింగ్‌లో అత్యంత ప్రాథమిక సామర్థ్యాల్లో ఒకటి.

```swift
let a = 100 * 8
```

ప్రోగ్రామింగ్ నేర్చుకునే ప్రక్రియలో, చాలా మంది ఒక విషయం గమనిస్తారు: కొంత గణిత ఆలోచనా విధానం ఉన్నవారు, సాధారణంగా ప్రోగ్రామ్ లాజిక్‌ను మరింత సులభంగా అర్థం చేసుకుంటారు. దీనికి కారణం, ప్రోగ్రామింగ్ యొక్క మౌలిక స్వభావం “గణన” మరియు “నియమాల ఆధారిత నిర్ణయం” నుండి వేరుగా ఉండదు; ఇవే ఆపరేటర్ల ప్రధాన పాత్రలు.

అసలు అభివృద్ధిలో, ఆపరేటర్లు కేవలం సాధారణ సంఖ్యా గణనకే కాకుండా, విభిన్నమైన స్పష్టమైన సందర్భాల్లో కూడా విస్తృతంగా ఉపయోగించబడతాయి.

ఉదాహరణకు, ఒక బ్లాక్ గేమ్‌లో, వినియోగదారు ఒక బ్లాక్‌ను నిర్దిష్ట స్థానం వరకు లాగినప్పుడు, ఈ క్రింది విషయాలను గణించాలి:

* బ్లాక్ యొక్క సమన్వయ స్థానాన్ని
* బ్లాక్ నింపగల స్థానాలను
* లక్ష్య స్థానం ఉపయోగించదగినదా కాదా అన్నది

ఈ “గణన + నిర్ణయం” ప్రక్రియలు అన్నీ, అసలు విషయానికి వస్తే, ఆపరేటర్లపై ఆధారపడుతాయి.

![Block](../../Resource/013_block.png)

ఆపరేటర్లను నేర్చుకోవడం అనేది కేవలం సంఖ్యా గణన నేర్చుకోవడం మాత్రమే కాదు; భవిష్యత్తులో interface layout, data processing మరియు interaction logic కోసం ఒక బలమైన పునాది వేయడం కూడా.

## SwiftUI లో గణనలు అమలయ్యే విధానం

SwiftUI లో, సాధారణంగా Button ద్వారా ఒక function ను trigger చేసి, ఆ function లో గణన logic ను అమలు చేస్తారు.

ఉదాహరణకు:

```swift id="cl49v1"
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

Button ను నొక్కినప్పుడు, Console లో ఇలా output వస్తుంది:

```swift id="q4gnsl"
c: 20
```

ఈ పాఠంలో, మనం గణన logic ను ఒకే విధంగా func లో వ్రాస్తాము, Button ద్వారా దాన్ని trigger చేస్తాము, మరియు print ద్వారా ఫలితాన్ని output చేస్తాము.

తదుపరి ఉదాహరణల్లో, code ను సులభంగా చూపించడానికి, మనం నేరుగా code లోనే గణన ఫలితాన్ని సూచిస్తాము; ఇకపై పదే పదే print ఉపయోగించము.

## Console output నిర్వహణ

ప్రతి click తో output information ఉత్పత్తి అవుతుంది. కాబట్టి ప్రస్తుత ఫలితాన్ని సులభంగా చూడడానికి, Console ప్రాంతం కుడి దిగువ మూలలో ఉన్న clear button ను నొక్కి పాత logs ను తొలగించవచ్చు.

![Console](../../Resource/013_console.png)

## Button యొక్క మరో రాత విధానం

Button ఒకే ఒక్క function ను మాత్రమే అమలు చేస్తే, మరింత సరళమైన రాత విధానాన్ని ఉపయోగించవచ్చు:

```swift id="rjg0zy"
Button(action: ) {
    // View
}
```

ఈ రాత విధానంలో, action అనేది button click సమయంలో అమలవాల్సిన function ను (parameter లేని function) సూచిస్తుంది; curly braces {} button యొక్క view ను నిర్వచించడానికి ఉపయోగిస్తారు.

ముందు చూచిన calculate function తో కలిపి, ఇది ఇలా వ్రాయవచ్చు:

```swift id="6vg4na"
Button(action: calculate) {
    Text("Button")
}
```

Button ను నొక్కినప్పుడు, calculate function నేరుగా అమలవుతుంది.

అందువల్ల, button logic సరళంగా ఉండి, ఒకే ఒక్క function ను మాత్రమే call చేస్తే, action రాత విధానం మరింత స్పష్టంగా ఉంటుంది మరియు code style పరంగా కూడా మరింత సరైనది.

## గణిత ఆపరేటర్లు

గణిత ఆపరేటర్లు (Arithmetic Operators) సంఖ్యా గణన కోసం ఉపయోగించబడతాయి:

* `+` జోడింపు
* `-` తీసివేత
* `*` గుణకారం
* `/` భాగహారం
* `%` మిగులు (remainder)

ఉదాహరణలు:

```swift id="lri1i6"
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

గమనించాల్సిన విషయం ఏమిటంటే, Swift ఒక strongly typed language. ఇది వేర్వేరు data types ను స్వయంగా కలిపి పనిచేయదు:

```swift id="g3bmgm"
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

రెండు values వేర్వేరు types లో ఉన్నప్పుడు, ముందుగా type conversion ను చేతితో చేయాలి.

## పోలిక ఆపరేటర్లు

పోలిక ఆపరేటర్లు (Comparison Operators) రెండు values మధ్య సంబంధాన్ని నిర్ణయించడానికి ఉపయోగిస్తారు. ఫలితం Bool type లో ఉంటుంది:

* `==` సమానం
* `!=` సమానం కాదు
* `>` పెద్దది
* `<` చిన్నది
* `>=` పెద్దది లేదా సమానం
* `<=` చిన్నది లేదా సమానం

ఉదాహరణలు:

```swift id="h4dhnm"
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

పోలిక ఆపరేటర్లు సాధారణంగా conditional statements లో ఉపయోగించబడతాయి. ఉదాహరణకు, “సూక్తుల రోటేషన్” లో, array index పరిధిని మించకుండా నియంత్రించాలి:

```swift id="b9y5d1"
if index < sayings.count - 1 {
    index += 1
}
```

index, sayings.count - 1 కంటే చిన్నగా ఉంటే, పోలిక ఫలితం true అవుతుంది, మరియు if statement లోని code అమలవుతుంది; ఫలితం false అయితే, తరువాతి code అమలుకాదు.

## లాజికల్ ఆపరేటర్లు

లాజికల్ ఆపరేటర్లు (Logical Operators) అనేక conditions ను కలపడానికి ఉపయోగించబడతాయి:

* `&&` మరియు (AND)
* `||` లేదా (OR)
* `!` కాదు (NOT)

### && మరియు

అనేక conditions ఒకేసారి నిజం కావాలి అంటే, && ను ఉపయోగిస్తారు.

ఉదాహరణకు:

```swift id="i6hc0b"
let age = 16
let legalAge = age >= 18 && age <= 100
```

ఈ code లో రెండు conditions ఉన్నాయి: age >= 18 మరియు age <= 100.

ఈ రెండు conditions ఒకేసారి true అయినప్పుడే legalAge true అవుతుంది; ఒక్కటైనా సరిపోకపోతే, ఫలితం false అవుతుంది.

### || లేదా

అనేక conditions లో ఏదో ఒకటి సరిపోతే చాలు అనుకుంటే, || ను ఉపయోగిస్తారు.

ఉదాహరణకు:

```swift id="sfxglt"
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

ఈ code అర్థం ఏమిటంటే, money >= 50 లేదా creditCard >= 50 లో ఏదో ఒకటి సరిపోతే, payAllowed true అవుతుంది.

రెండు conditions కూడా సరిపోకపోతే మాత్రమే, ఫలితం false అవుతుంది.

ఉదాహరణకు, payment సందర్భంలో, నగదు లేదా credit card ద్వారా చెల్లించవచ్చు. రెండూ పనికిరాకపోతే, payment విఫలమవుతుంది.

### ! కాదు

! అనేది logical NOT operator. ఇది Bool value ను తారుమారు చేయడానికి ఉపయోగించబడుతుంది.

దీనిని సులభంగా ఇలా అర్థం చేసుకోవచ్చు: ! true ను false గా, false ను true గా మారుస్తుంది.

ఉదాహరణకు:

```swift id="tq01dx"
let allowed = true
let result = !allowed   // false
```

ఇక్కడ !allowed అంటే allowed యొక్క విలువను తిరగరాయడం.

గమనించాల్సింది ఏమిటంటే, ! మరియు != రెండు వేర్వేరు ఆపరేటర్లు. ! ఒక Bool value ను negate చేస్తుంది, కానీ != పోలిక ఆపరేటర్, మరియు ఇది Bool value ను తిరిగి ఇస్తుంది.

## కేటాయింపు ఆపరేటర్లు

కేటాయింపు ఆపరేటర్లు (Assignment Operators) విలువను assign చేయడానికి లేదా variable ను update చేయడానికి ఉపయోగించబడతాయి:

* `=` కేటాయింపు

Variable declaration లేదా గణన ప్రక్రియలో, assignment తప్పనిసరిగా ఉంటుంది:

```swift id="2ozv0q"
let a = 5
```

ఈ code అర్థం: సంఖ్య 5 ను variable a కి assign చేయడం.

### సంయుక్త కేటాయింపు ఆపరేటర్లు

అసలు అభివృద్ధిలో, సాధారణ assignment operator తో పాటు, “compound assignment operators” కూడా తరచుగా ఉపయోగించబడతాయి. ఇవి ప్రస్తుత value పైనే నేరుగా గణన చేసి మళ్లీ update చేయడానికి ఉపయోగపడతాయి:

* `+=`
* `-=`
* `*=`
* `/=`

ఇంతకుముందు “కౌంటర్” పాఠంలో, మనం compound assignment operators గురించి కొద్దిగా చూసాము.

ఉదాహరణకు, button click సమయంలో variable స్వయంగా పెరగాలంటే:

```swift id="gdezhv"
var num = 10
num += 5   // num = 15
```

ఈ code అర్థం: num ను 5 తో add చేసి, వచ్చిన ఫలితాన్ని మళ్లీ num కి assign చేయడం.

కాబట్టి, ఇది ఈ code కు సమానం:

```swift id="2hcdi6"
var num = 10
num = num + 5   // num = 15
```

## త్రిక ఆపరేటర్

Swift లో త్రిక ఆపరేటర్ (Ternary Operator) condition ఆధారంగా నిర్ణయం తీసుకుని, రెండు ఫలితాల్లో ఒకదాన్ని return చేస్తుంది:

```swift id="k31gjq"
షరతు ? విలువ 1 : విలువ 2
```

దాని అమలు లాజిక్ ఇలా ఉంటుంది: condition true అయితే “విలువ1” ను return చేస్తుంది; condition false అయితే “విలువ2” ను return చేస్తుంది.

ఉదాహరణకు:

```swift id="lq4fqo"
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

ఈ code, showColor విలువను పరీక్షిస్తుంది: ఇది true అయితే Color.blue ను return చేస్తుంది, కాబట్టి background నీలంగా కనిపిస్తుంది; ఇది false అయితే Color.clear ను return చేస్తుంది, అంటే background color కనిపించదు.

సూచన: Color.clear అంటే పారదర్శక రంగు (ఏమీ కనిపించదు).

### if-else తో తేడా

లాజిక్ పరంగా, ternary operator అనేది if-else statement కు సమానం.

ఉదాహరణకు, పై code ను ఇలా కూడా వ్రాయవచ్చు:

```swift id="gu2b36"
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

ఈ రెండింటి అమలు విధానం పూర్తిగా ఒకటే. condition true అయితే మొదటి ఫలితం, false అయితే రెండవ ఫలితం.

వ్యవహారికంగా చూసినప్పుడు, ternary operator మరింత సంక్షిప్తంగా ఉంటుంది, మరియు “రెండింటిలో ఒకటి” అనే సరళమైన నిర్ణయాన్ని చూపడానికి మరింత అనుకూలంగా ఉంటుంది. ఇది సాధారణంగా ఒక value ను నేరుగా return చేయడానికి ఉపయోగపడుతుంది.

SwiftUI లో View నిర్మాణంలో, ternary operator చాలా సాధారణంగా కనిపిస్తుంది. ఉదాహరణకు:

```swift id="24jgl7"
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

ఈ రాత విధానం ద్వారా, ఒకే line లో condition ఆధారంగా view effect ను dynamic గా మార్చవచ్చు.

## పరిధి ఆపరేటర్లు

పరిధి ఆపరేటర్లు (Range Operators) ఒక interval ను సూచించడానికి ఉపయోగించబడతాయి:

* `...` మూసివేసిన పరిధి (రెండు చివరలూ కలుపుకొని)
* `..<` అర్ధ-తెరిచిన పరిధి (కుడి చివరను కలపదు)

ఉదాహరణకు:

```swift id="f56vov"
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

దీనిని సులభంగా ఇలా అర్థం చేసుకోవచ్చు: 1...3 అంటే 1 నుండి 3 వరకు, 3 ను కూడా కలుపుకొని; 5..<8 అంటే 5 నుండి 8 వరకు, కానీ 8 ను కలపదు.

విస్తరించిన రూపాలు (తెలుసుకోవడానికి మాత్రమే):

```swift id="cwi6gm"
5...    // >= 5
...5    // <= 5
```

ఈ రాత విధానం “ఒక వైపు మాత్రమే ఉన్న పరిధి” అని సూచిస్తుంది. ఇది సాధారణంగా conditional matching లేదా pattern matching లో ఉపయోగించబడుతుంది.

Range operators ను మనం తరువాత for loop నేర్చుకునే సమయంలో ఉపయోగిస్తాము. ప్రస్తుతం, దీన్ని “ఒక నిరంతర సంఖ్యా పరిధి”గా అర్థం చేసుకుంటే సరిపోతుంది.

## ఆపరేటర్లను అభ్యాసం చేయడం

ఇప్పుడు, కొన్ని సరళమైన ఉదాహరణల ద్వారా, view లో ఆపరేటర్ల పాత్రను అభ్యాసం చేద్దాం.

### 1. వాహనాల మొత్తం సంఖ్యను గణించడం

ఉదాహరణకు, ఒక కూడలిలో ప్రతి రోజు 500 వాహనాలు వెళ్తున్నాయి అనుకుందాం. 30 రోజుల్లో మొత్తం ఎన్ని వాహనాలు వెళ్లాయో గణించాలి.

దీనికి arithmetic operator ను ఉపయోగించవచ్చు:

```swift id="aq1isk"
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

ఇక్కడ గణన ప్రక్రియ ఏమిటంటే, రోజుకు 500 వాహనాలు, 30 రోజులు అంటే 500 × 30. కాబట్టి చివరికి మొత్తం 15000 వాహనాలు వస్తాయి.

### 2. In-App Purchase సభ్యత్వాన్ని నిర్ణయించడం

ఒక వ్యక్తి In-App Purchase సభ్యుడా కాదా అని నిర్ణయించవచ్చు. అతనికి lifetime membership లేదా subscription membership లో ఏదో ఒకటి ఉంటే, అతడిని సభ్యుడిగా పరిగణించవచ్చు.

```swift id="ow5r6r"
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

ఈ code లో || (OR) operator వాడబడింది: lifeTime = false అంటే lifetime membership లేదు; subscription = true అంటే subscription membership ఉంది.

ఎందుకంటే ఈ రెండింటిలో ఏదో ఒకటి సరిపోతే చాలు, isMember true అవుతుంది. కాబట్టి, ఈ వ్యక్తి సభ్యుడు.

## సారాంశం

Swift లో, ఆపరేటర్లు అనేవి data calculation మరియు logic judgment కు పునాది. ఎలా అంటే Text content ను చూపినట్లే, ఆపరేటర్లు data నే స్వయంగా process చేస్తాయి.

సాధారణ సంఖ్యా గణనల నుంచి, క్లిష్టమైన తార్కిక నిర్ణయాల వరకు, అలాగే view state control మరియు layout calculation వరకు — అన్నింటికీ ఆపరేటర్లు అవసరం.

వివిధ సందర్భాల్లో అభ్యాసం ద్వారా, ఈ పాఠంలో పరిచయం చేసిన అన్ని రకాల ఆపరేటర్లను క్రమంగా అర్థం చేసుకొని, పట్టు సాధించవచ్చు. ఇది తరువాతి అభ్యాసానికి ఎంతో ముఖ్యమైన పునాది.

### విస్తరణ జ్ఞానం - బిట్‌వైస్ ఆపరేటర్లు

ఇవికాకుండా, Swift మరొక దిగువ స్థాయి ఆపరేటర్లను కూడా అందిస్తుంది — బిట్‌వైస్ ఆపరేటర్లు (Bitwise Operators):

* `&`（bitwise AND）
* `|`（bitwise OR）
* `^`（bitwise XOR）
* `~`（bitwise NOT）
* `>>`（right shift）
* `<<`（left shift）

ఉదాహరణకు:

```swift id="5f7ytb"
let a = 6  // బైనరీ 110
let b = 3  // బైనరీ 011

print(a & b) // 2 (బైనరీ 010)
print(a | b) // 7 (బైనరీ 111)
print(a ^ b) // 5 (బైనరీ 101)
print(~a)    // -7 (బిట్‌వైస్ నాట్)
```

Swift లో, integers ను binary two’s complement రూపంలో సూచిస్తారు. కాబట్టి bitwise NOT చేసినప్పుడు, సంబంధిత negative result వస్తుంది.

Bitwise operators నేరుగా binary పై పని చేస్తాయి. వీటి వినియోగం సాధారణంగా low-level data processing మరియు performance optimization వంటి సందర్భాల్లో ఉంటుంది.

ప్రారంభ స్థాయి విద్యార్థుల కోసం, ఈ రకమైన ఆపరేటర్ల వాడుక సందర్భాలు తక్కువ. సాధారణ iOS లేదా SwiftUI అభివృద్ధిలో కూడా ఇవి ఎక్కువగా కనిపించవు. కాబట్టి ఇక్కడ వీటిని లోతుగా వివరించడం లేదు.

తరువాత low-level logic లేదా performance optimization అవసరమైతే, వీటిని మరింతగా నేర్చుకొని అర్థం చేసుకోవచ్చు.
