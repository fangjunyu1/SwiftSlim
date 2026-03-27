# చరాలు మరియు స్థిరాలు

ఈ పాఠంలో ప్రధానంగా Swift లోని చరాలు (variables) మరియు స్థిరాలు (constants) ను నేర్చుకుంటాము. అలాగే కొన్ని సాధారణ data types మరియు ప్రాథమిక operators ను కూడా తెలుసుకుంటాము.

ఇవి programming లో అత్యంత ప్రాథమిక జ్ఞానం. అలాగే తరువాత SwiftUI నేర్చుకోవడానికి కూడా ఇవి చాలా ముఖ్యమైన పునాది.

## రోజువారీ జీవితంలో చరాలు మరియు స్థిరాలు

మనము చరాలు మరియు స్థిరాలను రోజువారీ జీవితంలోని విషయాల ద్వారా అర్థం చేసుకోవచ్చు.

జీవితంలోని చరాల ఉదాహరణలు:

* టెలివిజన్‌లో ప్రతి కార్యక్రమం వేర్వేరు కంటెంట్‌ను ప్రదర్శిస్తుంది
* ప్రతి రోజు వాతావరణం ఒకేలా ఉండదు
* గడియారం ప్రతి సెకనుకూ మారుతుంది

ఈ విషయాలన్నింటికీ ఒకే లక్షణం ఉంది: అవి మారుతాయి.

ఒకవేళ టెలివిజన్ ఎప్పుడూ ఒకే చిత్రం చూపిస్తే, వాతావరణం ఎల్లప్పుడూ ఎండగానే ఉంటే, గడియారం సూదులు ఎప్పుడూ కదలకపోతే, అవి స్థిరాలు అవుతాయి.

ఒకటి మారే అవకాశం ఉన్నది, మరొకటి మారని విషయం.

## చరాలు మరియు స్థిరాలను అర్థం చేసుకోవడం

App development లో సాధారణంగా వినియోగదారుడు కొన్ని సమాచారాన్ని నింపాలి లేదా save చేయాలి.

ఉదాహరణకు:

* account name
* పుట్టిన రోజు
* సంప్రదింపు వివరాలు
* చిరునామా

ఈ సమాచారం save చేయబడుతుంది, తరువాత చూపించబడుతుంది.

ఉదాహరణకు, వినియోగదారుడు App లో ఒక పేరును నమోదు చేశాడని అనుకుందాం:

```text
FangJunyu
```

ఆ పేరును App లో చూపించడానికి మనం దాన్ని save చేయాలి.

ఈ save ప్రక్రియను సులభంగా ఇలా అర్థం చేసుకోవచ్చు: ఒక drawer లో వస్తువులను పెట్టడం.

మనము ఒక పేరును save చేసినప్పుడు, అది ఆ పేరును ఒక drawer లో పెట్టినట్లే.

Save చేయాల్సిన విషయాలు చాలానే ఉండవచ్చు, కాబట్టి drawers కూడా చాలా ఉండవచ్చు. ప్రతి drawer లో ఏముంది అనేది తెలుసుకోవడానికి, ప్రతి drawer కు ఒక పేరు అవసరం.

ఉదాహరణకు:

```text
name
```

ఈ ఉదాహరణలో, name అనేది drawer యొక్క పేరు, FangJunyu అనేది save చేసిన సమాచారం.

![Var](../../RESOURCE/007_var.png)

**Swift లో, data ను save చేయాలంటే తప్పనిసరిగా variable (var) లేదా constant (let) ను declare చేయాలి.**

పేరు సాధారణంగా మారవచ్చు కాబట్టి, ఇక్కడ మనం variable ఉపయోగించాలి.

```swift
var name = "FangJunyu"
```

ఇక్కడ name అనే ఒక variable ను declare చేశాము. దీని type String, value మాత్రం `"FangJunyu"`.

### చరాలు మరియు స్థిరాల మధ్య తేడా

Variable ను var తో declare చేస్తారు:

```swift
var
```

Constant ను let తో declare చేస్తారు:

```swift
let
```

ఉదాహరణకు:

```swift
var name = "FangJunyu"
let id = 123456
```

ఒకవేళ variable గా declare చేస్తే, ఆ value తరువాత మార్చవచ్చు. కానీ constant గా declare చేస్తే, దాన్ని తిరిగి మార్చలేము.

అందువల్ల, variable మరియు constant మధ్య ప్రధాన తేడా: value మార్చడానికి అనుమతి ఉందా లేదా అన్నది.

### Constant ను మార్చడం

ఒకవేళ code constant యొక్క value ను మార్చడానికి ప్రయత్నిస్తే:

```swift
let name = "Sam"
name = "Bob"
```

Swift, ఇది constant కాబట్టి assignment చేయలేమని చూపిస్తుంది.

```text
Cannot assign to property: 'name' is a 'let' constant
```

ఈ విధానం వల్ల కొన్ని ముఖ్యమైన data అనుకోకుండా మార్చబడకుండా developers ను రక్షిస్తుంది.

### SwiftUI లో చూపించడం

ContentView.swift ఫైల్‌ను తెరిచి, View లోపల ఒక variable declare చేయండి:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

ఇక్కడ name అనే variable declare చేయబడింది, మరియు Text ద్వారా అది interface లో చూపించబడుతోంది.

మనము variable యొక్క value మార్చితే:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Text చూపించే కంటెంట్ కూడా మారుతుంది.

ఈ విధంగా, మనం variable ద్వారా interface లో చూపించే కంటెంట్‌ను నియంత్రించవచ్చు. దాంతో ప్రతీసారి Text లోని literal text ను నేరుగా మార్చాల్సిన అవసరం ఉండదు.

ఇంకా, ఈ సమాచారాన్ని ఇతర చోట్ల ఉపయోగించాలి అనుకుంటే, ఈ variable ను అక్కడికి పంపవచ్చు. ఇది drawer లోని వస్తువును ఇంకో చోట వినియోగించడానికి ఇచ్చినట్టే.

### SwiftUI లో చరాలు మరియు స్థిరాల స్థానము

SwiftUI లో, variables మరియు constants సాధారణంగా body బయట రాయబడతాయి:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

ఖచ్చితంగా, variables మరియు constants ను body లోపల కూడా రాయవచ్చు:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

కానీ వీటిద్దరి మధ్య ఒక ముఖ్యమైన తేడా ఉంది:

* ఒకవేళ variable లేదా constant ను body లోపల రాస్తే, ప్రతి సారి view మళ్లీ లెక్కించబడినప్పుడు అది మళ్లీ సృష్టించబడుతుంది.
* body బయట రాస్తే, అది view struct యొక్క property గా ఉంటుంది, కాబట్టి code నిర్మాణం మరింత స్పష్టంగా ఉంటుంది.

అందువల్ల, వాస్తవ development లో సాధారణంగా variables మరియు constants ను body బయట రాస్తారు.

## Data types

Variables అనేక రకాల data ను save చేయగలవు. ఈ రకాలను data types అంటారు.

ఉదాహరణకు, మనం ముందుగా Text ద్వారా text ను చూపించాము:

```swift
Text("Hello, World")
```

ఇక్కడ `"Hello, World"` అనేది string (String) type కు చెందినది.

String అనేది text ను సూచిస్తుంది. Swift లో దీనిని తప్పనిసరిగా double quotes `""` లో రాయాలి.

ఉదాహరణకు:

```swift
var hello = "Hello, World"
```

String మాత్రమే కాకుండా, Swift లో ఇంకా అనేక data types ఉన్నాయి.

ప్రారంభ దశలో ఎక్కువగా ఉపయోగించే నాలుగు types ఇవి:

* String
* Int
* Double
* Bool

ఈ నాలుగు types తో చాలా ప్రాథమిక data processing చేయవచ్చు.

**String**

String అనేది text ను సూచిస్తుంది. ఉదాహరణకు:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

String సాధారణంగా ఈ విషయాలకు ఉపయోగిస్తారు: user name, title, text content.

**Int**

Int అనేది integer, అంటే decimal లేకుండా ఉండే పూర్ణ సంఖ్య.

ఉదాహరణకు:

```swift
var age = 26
var count = 100
```

Integer సాధారణంగా ఈ విషయాలకు ఉపయోగిస్తారు: వయస్సు, పరిమాణం, counting.

**Double**

Double అనేది decimal ఉన్న సంఖ్యను సూచిస్తుంది.

ఉదాహరణకు:

```swift
var weight = 74.5
var height = 185.0
```

Swift లో decimal numbers సాధారణంగా డిఫాల్ట్‌గా Double type గా తీసుకోబడతాయి.

ఇంకా Float అనే దగ్గరలోని ఒక type ఉంది. కానీ అది చూపగల సంఖ్యల పరిధి చిన్నది. అందువల్ల actual development లో Double ఎక్కువగా ఉపయోగిస్తారు.

**Bool**

Bool type రెండు స్థితులను సూచించడానికి ఉపయోగిస్తారు: true మరియు false.

ఉదాహరణకు:

```swift
var isShowAlert = true
var isLogin = false
```

Bool type సాధారణంగా condition checking లో ఉపయోగిస్తారు. ఉదాహరణకు, alert చూపించాలా లేదా అన్నది.

కేవలం రెండు ఫలితాలు మాత్రమే ఉండే పరిస్థితులలో Bool చాలా సరైన type.

### SwiftUI లో చూపించడం

String type ను చూపించాల్సి వస్తే, నేరుగా Text ఉపయోగించవచ్చు:

```swift
Text(name)
```

కానీ Int, Double వంటి types strings కావు. కాబట్టి వాటిని నేరుగా text లో భాగంగా ఉపయోగించలేము.

ఈ data ను Text లో చూపించాలి అనుకుంటే, string interpolation ఉపయోగించాలి:

```swift
\()
```

String interpolation ను string లోపల రాయాలి, మరియు variable లేదా constant ను `\()` లో చుట్టాలి.

ఉదాహరణకు:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

పై code లో, `""` అనేది string ను సూచిస్తుంది. `\()` అనేది variable లేదా constant ను string లో చేర్చడానికి ఉపయోగిస్తారు.

ఉదాహరణకు:

```swift
"DoubleNum: \(num * 2)"
```

దీని display ఫలితం:

```text
DoubleNum: 2
```

ఈ విధంగా, మనం string లో variables లేదా constants ను చేర్చి, తరువాత వాటిని Text ద్వారా interface లో చూపించవచ్చు.

గమనిక: `\()` ను కేవలం string `""` లోపల మాత్రమే ఉపయోగించవచ్చు.

## Operators

Variable లేదా constant ను declare చేసినప్పుడు, మనం ఈ విధమైన రాతను చూస్తాము:

```swift
var num = 1
```

ఇక్కడ `=` ను assignment operator అంటారు.

దాని పని ఏమిటంటే: కుడివైపు ఉన్న value ను ఎడమవైపు ఉన్న variable కు assign చేయడం.

ఈ ఉదాహరణలో, `1` అనే value variable `num` కు assign చేయబడింది.

Assignment operator మాత్రమే కాకుండా, కొన్ని సాధారణ గణిత operators కూడా ఉన్నాయి:

* `+`
* `-`
* `*`
* `/`

మనము సంఖ్యలపై calculation చేయాల్సి వచ్చినప్పుడు, ఉదాహరణకు Int లేదా Double type data పై, ఈ operators ఉపయోగిస్తాము.

ఉదాహరణకు:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Calculation పూర్తయిన తర్వాత, దాని ఫలితం variable లో save అవుతుంది.

## సారాంశం

Variables, constants మరియు operators programming లో అత్యంత ప్రాథమిక concepts.

Variables మరియు constants ద్వారా మనం program లో వివిధ రకాల data ను save చేయవచ్చు; data types ద్వారా ఆ data ఏ రకానికి చెందినదో స్పష్టమవుతుంది; operators ద్వారా ఆ data పై calculation మరియు processing చేయవచ్చు.

ఈ జ్ఞానం programming ప్రపంచంలో ప్రాథమిక tools లాంటివి. ఈ విషయాలను బాగా అర్థం చేసుకుంటే, తరువాత Swift మరియు SwiftUI నేర్చుకోవడానికి ఒక బలమైన పునాది ఏర్పడుతుంది.
