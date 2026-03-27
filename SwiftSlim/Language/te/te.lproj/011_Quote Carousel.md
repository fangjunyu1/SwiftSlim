# సూక్తుల రోటేషన్

ఈ పాఠంలో, మనం ఒక "సూక్తుల రోటేషన్" ఫీచర్‌ను అమలు చేస్తాము, అలాగే Array మరియు if-else వంటి Swift యొక్క ప్రాథమిక జ్ఞానాన్ని లోతుగా అధ్యయనం చేస్తాము.

మనము అనేక సూక్తులను ఎలా నిల్వ చేయాలో, అలాగే button interaction ద్వారా సూక్తులను ఎలా చక్రంలా మారుస్తూ చూపించాలో నేర్చుకుంటాము.

![alt text](../../RESOURCE/011_word.png)

## సూక్తిని చూపించడం

మొదట, మనం SwiftUI లో ఒక సూక్తిని చూపించాలి.

అత్యంత సరళమైన మార్గం Text view ను ఉపయోగించడం:

```swift
Text("Slow progress is still progress.")
```

ఈ కోడ్ ఒక స్థిరమైన సూక్తిని మాత్రమే చూపగలదు. ఒకటికంటే ఎక్కువ సూక్తులను చూపించి, వాటిని మార్చే ఫీచర్ కావాలంటే, మనం ఆ సూక్తులను నిల్వ చేయాలి.

అయితే, సాధారణ string variable ఒకే ఒక్క సూక్తిని మాత్రమే నిల్వ చేయగలదు:

```swift
let sayings = "Slow progress is still progress."
```

ఒకাধিক సూక్తులను నిల్వ చేయాలంటే, ప్రతి సూక్తికి విడిగా ఒక variable ను ప్రకటించాలి:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

కానీ వాస్తవ అభివృద్ధిలో, ఈ విధానం కష్టమైనదే కాకుండా, ప్రతి variable స్వతంత్రంగా ఉండటం వల్ల, మనం సులభంగా rotation effect ను అమలు చేయలేము.

అనేక సూక్తులను సౌకర్యంగా నిర్వహించడానికి, వాటిని ఒకే data structure లో కలిపి నిల్వ చేయాలి. అదే Array.

Array ను ఉపయోగించిన తర్వాత, పై కోడ్‌ను ఇలా నిల్వ చేయవచ్చు:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**సూచన: ప్రోగ్రామింగ్ నియమాలలో, అనేక elements ను నిల్వ చేసే array variable పేర్లు సాధారణంగా plural రూపంలో ఉంటాయి, ఉదాహరణకు sayings. ఇది అది ఒక సమూహం అని చూపిస్తుంది.**

## Array

Swift లో, Array అనేది క్రమపద్ధతిలో ఉన్న elements ను నిల్వ చేసే collection. దీనిని square brackets [] తో సూచిస్తారు.

```swift
[]
```

Array లో ఒకే type కు చెందిన అనేక elements ఉండవచ్చు. ప్రతి element ను comma , తో వేరు చేస్తారు.

ఉదాహరణకు:

```swift
[101, 102, 103, 104, 105]
```

Array ను సులభంగా ఒక రైలు వరుసలా ఊహించవచ్చు:

![Array](../../RESOURCE/011_array1.png)

మొత్తం రైలు ఈ array object ను సూచిస్తుంది. ప్రతి బోగీ ఒక క్రమంలో ఉంటుంది.

### Index మరియు element access

Array క్రమపద్ధతిలో ఉంటుందికాబట్టి, system దాని క్రమాన్ని ఆధారంగా తీసుకుని నిర్దిష్ట element ను కనుగొనగలదు. ఈ స్థాన నిర్ధారణ విధానాన్ని index అంటారు.

Swift లో (మరియు ఎక్కువశాతం programming languages లో), array index 1 నుండి కాదు, 0 నుండి ప్రారంభమవుతుంది. అంటే array లోని మొదటి element index 0, రెండోది 1, ఆ తరువాత అలాగే కొనసాగుతుంది.

![Array](../../RESOURCE/011_array2.png)

Array లోని ఒక నిర్దిష్ట element ను access చేయాలంటే, array పేరుకు తర్వాత square brackets వ్రాసి, వాటి లోపల ఆ element యొక్క index ను ఇవ్వాలి.

ఉదాహరణకు:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Array యొక్క సరైన పరిధి దాటి ఉన్న index ను access చేయడానికి ప్రయత్నిస్తే, “Index Out of Range” అనే సమస్య వస్తుంది. కాబట్టి array ను access చేసే సమయంలో, index చెల్లుబాటు అయ్యే పరిధిలో ఉందో లేదో జాగ్రత్తగా చూసుకోవాలి.

**Index Out of Range**

ఉదాహరణకు, array లో 5 elements మాత్రమే ఉంటే, చెల్లుబాటు అయ్యే index పరిధి 0 నుండి 4 వరకు మాత్రమే. మనం sayings[5] ను access చేయడానికి ప్రయత్నిస్తే, program కి దానికి సరిపడే “బోగీ” కనిపించదు. అప్పుడు “Index Out of Range” error వస్తుంది, దాంతో app crash అవుతుంది.

![Array](../../RESOURCE/011_array3.png)

### Array పై ఆపరేషన్లు

Array కేవలం స్థిరంగా నిర్వచించడానికే కాదు, అందులో elements ను add చేయడం, delete చేయడం, modify చేయడం, అలాగే దాని length తెలుసుకోవడం కూడా చేయవచ్చు.

సూచన: array ను మార్చాలి అనుకుంటే, తప్పనిసరిగా let కాకుండా var తో ప్రకటించాలి.

**1. కొత్త element జోడించడం**

append method ను ఉపయోగించి array చివరలో కొత్త element ను జోడించవచ్చు:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. element ను తొలగించడం**

remove(at:) method ద్వారా, array లోని ఒక నిర్దిష్ట element ను తొలగించవచ్చు:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. element ను మార్చడం**

Index ను ఉపయోగించి array element ను నేరుగా మార్చవచ్చు:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Array length తెలుసుకోవడం**

count property ను ఉపయోగించి array లోని elements సంఖ్యను తెలుసుకోవచ్చు:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Array ఉపయోగించి సూక్తులను చూపించడం

అనేక సూక్తులను చూపించడానికి, వాటిని ఒక array లో నిల్వ చేసి, తర్వాత index ద్వారా వాటిని access చేసి చూపించవచ్చు.

మొదట, ContentView లో ఒక sayings array ను సృష్టించి సూక్తులను నిల్వ చేద్దాం. తరువాత Text view లో index ద్వారా సరైన సూక్తిని చదివి చూపుదాం:

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

ఇక్కడ, sayings[0] అంటే array లోని మొదటి సూక్తి.

వేరే సూక్తిని చూపించాలంటే, square brackets లోని index value ను మార్చడం చాలు:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### సూక్తి index ను నిర్వచించడం

సూక్తులు dynamic గా మారుతూ కనిపించాలంటే, Text view లో index ను “స్థిరంగా” వ్రాయకూడదు.

ప్రస్తుతం చూపించబడుతున్న index value ను ప్రత్యేకంగా నిల్వ చేయడానికి ఒక variable అవసరం.

SwiftUI లో, మనం @State ద్వారా ఒక mutable index ను ప్రకటించవచ్చు:

```swift
@State private var index = 0
```

SwiftUI, @State తో wrap చేసిన variable ను గమనిస్తుంది. index మారినప్పుడు, SwiftUI మళ్లీ view ను render చేసి, దానికి అనుగుణమైన సూక్తిని చూపిస్తుంది.

తర్వాత, sayings[index] ద్వారా array లోని సూక్తిని dynamic గా పొందవచ్చు:

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

index value మారినప్పుడు, Text వేరే సూక్తిని చూపిస్తుంది.

### Button ఉపయోగించి index ను నియంత్రించడం

సూక్తి మార్పును నియంత్రించడానికి, మనం Button ద్వారా index value ను మార్చవచ్చు. ప్రతి సారి button ను నొక్కినప్పుడు, index ఆటోమేటిక్‌గా 1 పెరుగుతుంది:

```swift
Button("Next") {
    index += 1
}
```

Button ను నొక్కినప్పుడు, index value 0 నుంచి 1 గా మారుతుంది. దీతో view refresh అవుతుంది, మరియు Text(sayings[index]) తదుపరి సూక్తిని చదివి చూపిస్తుంది.

కానీ ఇక్కడ ఒక సమస్య ఉంది: button ను వరుసగా నొక్కుతూ పోతే, index array పరిధి దాటి పెరిగిపోతుంది. అప్పుడు array index out of range error వస్తుంది. ఉదాహరణకు, index 5 కి చేరుకుంటే (array index range 0 నుండి 4 వరకు మాత్రమే), program crash అవుతుంది.

ఈ array index out of range సమస్యను నివారించడానికి, condition control అవసరం. index array పరిధిని దాటకుండా ఉండేలా చూడాలి. దీనికి if-else statement ఉపయోగించవచ్చు.

## షరతు నియంత్రణ: if-else statement

if-else statement అనేది Swift లో అత్యంత సాధారణమైన conditional branching statement. ఇది ఒక షరతు నిజమా కాదా అనేది పరిశీలించి, దాని ఆధారంగా వేర్వేరు కోడ్ బ్లాక్‌లను అమలు చేస్తుంది.

ప్రాథమిక నిర్మాణం:

```swift
if condition {
    // condition true అయితే అమలయ్యే కోడ్
} else {
    // condition false అయితే అమలయ్యే కోడ్
}
```

if statement లో, condition ఒక Boolean value (Bool type), అంటే true లేదా false మాత్రమే. condition true అయితే if భాగంలోని కోడ్ అమలవుతుంది; లేకపోతే else భాగంలోని కోడ్ అమలవుతుంది.

ఉదాహరణకు:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

ఈ ఉదాహరణలో, age value 25. if statement age > 18 నిజమా కాదా అని పరీక్షిస్తుంది. నిజమైతే "Big Boy" ను output చేస్తుంది.

else భాగం అవసరం లేకపోతే, దాన్ని వదిలేయవచ్చు:

```swift
if condition {
    // condition true అయితే అమలయ్యే కోడ్
}
```

### Condition ఉపయోగించి index పరిధిని నియంత్రించడం

Array index out of range ను నివారించడానికి, if statement తో index array పరిధిని దాటకుండా నిర్ధారించవచ్చు:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

లాజిక్ విశ్లేషణ: sayings.count విలువ 5, ఎందుకంటే మొత్తం 5 సూక్తులు ఉన్నాయి. కాబట్టి sayings.count - 1 విలువ 4. ఇదే array యొక్క చివరి చెల్లుబాటు అయ్యే index.

index 4 కంటే చిన్నదైతే, button నొక్కినప్పుడు 1 పెరగడం సురక్షితం. index 4 కి చేరుకున్న తర్వాత, షరతు నిజం కాదు, కాబట్టి button నొక్కినా ఎలాంటి స్పందన ఉండదు.

ఇప్పుడు, కోడ్ సూక్తులను మార్చే ఫీచర్‌ను ఇప్పటికే అమలు చేసింది:

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

### సూక్తుల చక్రం

చివరి సూక్తి కనిపించిన తర్వాత కూడా button నొక్కితే మళ్లీ మొదటి సూక్తి చూపించాలని అనుకుంటే, అంటే సూక్తులు చక్రంలా తిరగాలని అనుకుంటే, else భాగాన్ని ఉపయోగించవచ్చు:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Button ను నొక్కినప్పుడు, index array చివరి element వద్దకు చేరితే, index మళ్లీ 0 అవుతుంది. దీంతో సూక్తులు చక్రంలా తిరుగుతాయి.

## సూక్తుల view ను మెరుగుపరచడం

ఇప్పుడు, మన సూక్తుల రోటేషన్ లాజిక్ పూర్తయ్యింది. కానీ interface ను ఇంకా అందంగా మార్చవచ్చు.

పూర్తి కోడ్:

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

ఈ ఉదాహరణలో, Text view కు ఒక తెల్లని అర్ధపారదర్శక నేపథ్యం మరియు rounded corners జోడించబడ్డాయి. Button కు .borderedProminent style ఉపయోగించబడింది. VStack కు ఒక background image అమర్చబడింది.

అదనపు జ్ఞాన బిందువు: image background ను handle చేయడానికి background() modifier ఉపయోగించినప్పుడు, దాని default behavior ప్రస్తుతం ఉన్న view layout ప్రాంతాన్ని సాధ్యమైనంతవరకు నింపడం. చాలా సందర్భాల్లో, అది సహజంగానే safe area వరకు విస్తరించవచ్చు.

ఇప్పుడు, మనం సూక్తుల రోటేషన్ view ను అమలు చేశాము.

![SwiftUI View](../../RESOURCE/011_word.png)

## సారాంశం

ఈ పాఠం ద్వారా, అనేక సూక్తులను array లో ఎలా నిల్వ చేయాలో, అలాగే if మరియు if-else statements ఉపయోగించి సూక్తుల rotation ను ఎలా అమలు చేయాలో నేర్చుకున్నాము.

అలాగే, array యొక్క ప్రాథమిక ఆపరేషన్లు — elements ను add చేయడం, delete చేయడం, modify చేయడం — అలాగే array index out of range సమస్యను ఎలా నివారించాలో కూడా అర్థం చేసుకున్నాము.

ఈ పాఠం కేవలం సూక్తుల రోటేషన్ ఫీచర్ అమలును మాత్రమే వివరించలేదు; array మరియు conditional statements యొక్క ప్రాథమిక వినియోగాన్ని కూడా కలిపి వివరించింది. దీని ద్వారా data ను handle చేయడం మరియు program flow ను నియంత్రించడం వంటి సామర్థ్యాలను మనం అభ్యసించాము.

## విస్తరణ జ్ఞానం - బహుళ షరతుల నిర్ణయం: if-else if-else statement

వాస్తవ అభివృద్ధిలో, తరచుగా అనేక షరతులను నిర్వహించాల్సి వస్తుంది. ఉదాహరణకు, ఒక గేమ్‌లో score 1 అయితే event A trigger కావాలి, 2 అయితే event B, 3 అయితే event C — ఇలా కొనసాగుతుంది.

రెండు కంటే ఎక్కువ condition branches ఉన్న సందర్భాల్లో, మనం if-else if-else statement ను ఉపయోగించాలి.

ప్రాథమిక syntax:

```swift
if conditionA {
    // conditionA true అయితే అమలయ్యే కోడ్
} else if conditionB {
    // conditionB true అయితే అమలయ్యే కోడ్
} else if conditionC {
    // conditionC true అయితే అమలయ్యే కోడ్
} else {
    // ఏ షరతూ సరిపోకపోతే అమలయ్యే కోడ్
}
```

ఈ సందర్భంలో, program వరుసగా ప్రతి condition ను పరీక్షిస్తుంది, మరియు మొదట true అయిన condition కు సంబంధించిన కోడ్‌ను అమలు చేస్తుంది. ఏ condition కూడా true కాకపోతే, else తర్వాత ఉన్న కోడ్ అమలవుతుంది.

సూక్తుల రోటేషన్‌లో కూడా మనం if-else if-else statement ను ఉపయోగించి బహుళ నిర్ణయం తీసుకోవచ్చు:

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

index విలువ 0, 1, 2, 3 లో ఏదైనా అయితే, ప్రతి సారి button నొక్కినప్పుడు index += 1 అమలవుతుంది. index 4 అయినప్పుడు (చివరి element), index ను 0 గా reset చేస్తుంది. దీంతో చక్రంలా తిరిగే effect వస్తుంది.

else branch అనేది safeguard గా పనిచేస్తుంది, index తప్పుగా మారినప్పుడు వంటి illegal values వచ్చినా program సురక్షితంగా ఉండేలా చేస్తుంది.

గమనించాలి: ఇక్కడ ఉపయోగించిన == అనేది "సమానమా?" అనే అర్థం. if statement లో index ఒక నిర్దిష్ట సంఖ్యకు సమానమైతే true వస్తుంది, అప్పుడు తర్వాతి కోడ్ బ్లాక్ అమలవుతుంది. సమానం కాకపోతే, program తరువాతి if condition ను పరీక్షిస్తుంది.

ఈ విధమైన బహుళ నిర్ణయం, వేర్వేరు పరిస్థితుల్లో వేర్వేరు కోడ్ అమలు చేయడానికి ఉపయోగకరంగా ఉంటుంది.
