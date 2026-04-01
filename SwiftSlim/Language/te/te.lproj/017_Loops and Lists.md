# లూపులు మరియు జాబితాలు

ఈ పాఠంలో, Swift లోని `for` loop ను, అలాగే SwiftUI లోని `ForEach` ను నేర్చుకుంటాం.

ఇవి రెండూ array లోని elements ను సరైన క్రమంలో చదవడానికి సహాయపడతాయి. నిజమైన development లో, ఒక data group లోని items ను ఒక్కొక్కటిగా తీసి వాటిని process చేయడం లేదా display చేయడం తరచుగా అవసరం అవుతుంది. అలాంటి పనిని పూర్తి చేయడానికి loop ఒక ముఖ్యమైన సాధనం.

మనము web ను browse చేస్తున్నప్పుడో లేదా App ను ఉపయోగిస్తున్నప్పుడో, చాలా lists లేదా items కనిపిస్తాయి. ఇలాంటి content సాధారణంగా ముందుగా `array` లో store చేయబడుతుంది, తరువాత `loop` ద్వారా ఒక్కొక్కటిగా చదవబడుతుంది, చివరికి screen పై చూపబడుతుంది.

ఉదాహరణకు, Google search results జాబితా:

![Google](../../Resource/017_google.png)

Search results జాబితాలోని ప్రతి item సాధారణంగా ఒక data item కు సరిపోతుంది, మరియు loop ద్వారా ఒక్కొక్కటిగా display చేయబడుతుంది.

అందుకే `array` మరియు `loop` చాలా సార్లు కలిసే కనిపిస్తాయి. `Array` ఒక data group ను save చేస్తుంది; `loop` ఆ data ను క్రమంగా తీసుకుని అదే operation ను అమలు చేస్తుంది.

ఇప్పుడు, అత్యంత ప్రాథమికమైన `for` loop తో ప్రారంభిద్దాం.

## కౌంట్‌డౌన్

మనకు ఒక countdown feature ను simulate చేయాలి అనుకుందాం. అది `“5, 4, 3, 2, 1”` ను వరుసగా output చేయాలి.

దాన్ని రాయడానికి అత్యంత నేరుగా ఉన్న విధానం:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

ఈ విధానం countdown ను simulate చేయగలదు. కానీ content ఎక్కువైతే, code చాలా repetitive గా మారుతుంది; తర్వాత దాన్ని modify చేయడమూ సౌకర్యంగా ఉండదు.

అప్పుడు, data ను ముందుగా array లో పెట్టి, తర్వాత `for` loop తో ఒక్కొక్కటిగా output చేయవచ్చు:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

ఈ రాయడం చిన్నదిగా ఉంటుంది, అలాగే extend చేయడమూ సులభంగా ఉంటుంది. Countdown లో numbers చాలా ఎక్కువగా ఉన్నా, `print` ను మళ్లీ మళ్లీ ప్రతి line లో రాయాల్సిన అవసరం లేదు. Array లోని ప్రతి element ను loop ఆటోమేటిక్ గా handle చేస్తే సరిపోతుంది.

ఈ code ను ఒక button లో పెట్టి test చేయవచ్చు:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Button ను click చేసినప్పుడు, `for` loop array లోని క్రమం ప్రకారం `countDown` లోని ప్రతి integer ను ఒక్కొక్కటిగా తీసి console లో print చేస్తుంది.

తర్వాత, `for` loop ఎలా పనిచేస్తుందో చూద్దాం.

## for loop

`for` loop అనేది ఒక data group ను క్రమంగా process చేయడానికి ఉపయోగించబడుతుంది. దీన్ని arrays మరియు ranges మీద ఎక్కువగా ఉపయోగిస్తారు.

ప్రాథమిక రాయడం:

```swift
for element in arrayLedaRange {
    executeCheyaliCode
}
```

ఉదాహరణకు, ఇప్పుడే చూసిన countdown code:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

ఇక్కడ `i` ప్రస్తుతం తీసుకున్న element ను సూచిస్తుంది. `in` తర్వాత వచ్చే data నే loop చేయాలి; అంటే `countDown` array.

ఈ code యొక్క అర్థం: program `countDown` array నుండి ప్రతి element ను వరుసగా తీసుకుంటుంది. ఒక element తీసుకున్నప్పుడు, దాన్ని తాత్కాలికంగా `i` అని సూచిస్తుంది, ఆ తర్వాత curly braces లోని code ను execute చేస్తుంది.

Execution process ను ఇలా అర్థం చేసుకోవచ్చు:

- మొదట `5` తీసుకుంటుంది; కాబట్టి ఆ సమయంలో `i` value `5`
- `print(i)` execute అవుతుంది; `5` output అవుతుంది
- తరువాతి element `4` తీసుకుంటుంది
- `print(i)` మళ్లీ execute అవుతుంది; `4` output అవుతుంది

తర్వాత వచ్చే `3`, `2`, `1` కూడా ఇదే విధంగా వరుసగా execute అవుతాయి.

![for](../../Resource/017_for.png)

Array లోని అన్ని elements process అయిన తర్వాత, `for` loop ఆటోమేటిక్ గా ముగుస్తుంది.

`for` loop తో array లోని ప్రతి element ను పొందవచ్చు; countdown లాంటి features ను పూర్తి చేయవచ్చు.

**గమనిక**: `i` అనేది for loop లో ప్రస్తుతం తీసుకున్న element ను సూచించడానికి విరివిగా ఉపయోగించే పేరు. కానీ ఇది తప్పనిసరి కాదు; మీరు ఇతర English పేర్లనూ వాడవచ్చు.

ఉదాహరణకు, ప్రతి element ను సూచించడానికి `num` ను వాడవచ్చు:

```swift
for num in countDown {
    print(num)
}
```

Curly braces లోని code లో కూడా ప్రస్తుతం తీసుకున్న element ను సూచించడానికి `num` నే వాడాలి.

### range ను loop చేయడం

`for` loop అనేది arrays మాత్రమే కాదు, ranges ను కూడా loop చేయగలదు.

ఉదాహరణకు, `50` లోపు ఉన్న positive integers యొక్క total ను లెక్కించాలంటే, `1` నుండి `50` వరకు ఉన్న అన్ని integers ను ఒక్కొక్కటిగా కలపాలి.

అత్యంత నేరుగా రాయాలంటే ఇది ఇలా ఉండవచ్చు:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

ఈ రాయడంలో ఉన్న సమస్య ఏమిటంటే, ప్రతి సంఖ్యను చేతితో రాయాలి. అది ఇబ్బందికరమైనదే కాక, నిజమైన development scenarios కు కూడా సరిపోదు.

ఇప్పుడు range operator ను `for` loop తో కలిపి దీనిని చేయవచ్చు.

ముందు “operators” chapter లో range operator ను మనం ఇప్పటికే నేర్చుకున్నాం:

```swift
1...3   // 1, 2, 3
```

ఇక్కడ `...` అనేది closed range ను సూచిస్తుంది; అంటే start point మరియు end point రెండూ అందులో ఉంటాయి.

కాబట్టి ఇక్కడ `1` నుండి `50` వరకు ఉన్న integer range ను `for` loop తో ఉపయోగించవచ్చు:

```swift
for i in 1...50 {
    
}
```

ఈ integers ను కలపాలి కాబట్టి, total ను store చేయడానికి ఒక variable కూడా అవసరం:

```swift
var count = 0
```

తర్వాత ప్రతి loop iteration లో ప్రస్తుతం తీసుకున్న number ను `count` కు జత చేయాలి:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

ఈ code యొక్క అర్థం:

- `count` ప్రస్తుత total ను save చేస్తుంది
- `for` loop `1` నుండి `50` వరకు ఉన్న integers ను క్రమంగా తీసుకుంటుంది
- ప్రతి integer తీసుకున్నప్పుడు `count += i` execute అవుతుంది
- loop పూర్తైన తర్వాత `count` లో final total ఉంటుంది.

ఈ విధంగా `50` లోపు ఉన్న అన్ని positive integers యొక్క total ను పొందవచ్చు.

అదేవిధంగా, `1` నుండి `100` వరకు integers యొక్క total ను లెక్కించాలంటే, range ను మాత్రమే మార్చితే సరిపోతుంది:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` loop arrays మాత్రమే కాదు, ఒక range ను కూడా loop చేయగలదు. Data ను క్రమంగా మళ్లీ మళ్లీ process చేయగల ఈ సామర్థ్యం development లో చాలా సాధారణం.

ఇది, ప్రతి సంఖ్యకు addition process ను చేతితో రాయకుండా, ఇలాంటి repetitive పనులను ఆటోమేటిక్ గా పూర్తి చేయడంలో సహాయపడుతుంది.

## SwiftUI లో loop

పై భాగంలో చూసిన `for` loop అనేది Swift language లో భాగం.

కానీ SwiftUI లో, view structure లోపల `for` ను నేరుగా ఉపయోగించి views ను create చేయలేం:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

దానికి కారణం `VStack` లో SwiftUI views ఉండాలి; సాధారణ `for` loop స్వతహాగా view కాదు.

SwiftUI లో array content ఆధారంగా interface ను మళ్లీ మళ్లీ create చేయాలంటే, `ForEach` ను ఉపయోగించాలి.

ఉదాహరణకు, ఒక group లోని అన్ని members పేర్లను చూపించాలని అనుకుంటే, ఇలా రాయవచ్చు:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

చూపబడే ఫలితం:

![for1](../../Resource/017_for1.png)

తర్వాత, ప్రతి `Text` కు ఒకే modifiers ను జోడిద్దాం:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

ఇప్పుడు ప్రతి `Text` చిన్నదిగా, మరింత bold font తో చూపబడుతుంది.

చూపబడే ఫలితం:

![](../../Resource/017_for2.png)

Modifiers interface ను అందంగా మార్చినప్పటికీ, code ను పొడవుగా మరియు repetitive గా కూడా మారుస్తాయి.

Names మరింత పెరిగినా, లేదా తర్వాత font, color వంటి styles ను ఒకే విధంగా మార్చాల్సి వచ్చినా, అదే code ను మళ్లీ మళ్లీ రాయాలి మరియు మార్చాలి. ఇది అసౌకర్యంగా ఉండటమే కాక maintain చేయడానికీ కష్టంగా ఉంటుంది.

అప్పుడు, ఈ names ను ముందుగా array లో పెట్టి, SwiftUI లోని `ForEach` ను ఉపయోగించి array data ఆధారంగా views ను మళ్లీ మళ్లీ create చేయవచ్చు:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

ఈ code group మరింత సంక్షిప్తంగా ఉంటుంది. `ForEach` array లోని ప్రతి element ను క్రమంగా చదివి, దానికి సంబంధించిన content ను screen పై చూపిస్తుంది.

తర్వాత కొత్త names ను జోడించాలి అనుకుంటే, `names` array లోని content ను మాత్రమే మార్చితే సరిపోతుంది. ప్రతి సారి `Text` మరియు క్లిష్టమైన modifiers ను మళ్లీ జోడించాల్సిన అవసరం లేదు.

## ForEach

`ForEach` అనేది SwiftUI లో views ను మళ్లీ మళ్లీ create చేయడానికి ఉపయోగించే structure. దీన్ని SwiftUI లోని `for` loop లాంటి structure గా అర్థం చేసుకోవచ్చు.

ప్రాథమిక ఉపయోగం:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

ఉదాహరణకు, ఇంతకుముందు చూసిన group names:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

ఈ code యొక్క అర్థం:

`names` అనేది loop చేయబడే array; అంటే display చేయాల్సిన data.

`id:\.self` అంటే array లోని element నే ప్రతి item ను distinguish చేయడానికి ఉపయోగించడం.

ఈ example లో array string values ను store చేస్తుంది:

```swift
["Sam", "John", "Wathon", "Bob"]
```

అందువల్ల SwiftUI, "Sam", "John", "Wathon", "Bob" అనే string values నే వేర్వేరు content ను గుర్తించడానికి నేరుగా ఉపయోగిస్తుంది.

Beginner stage లో సాధారణంగా కనిపించే String, Int వంటి simple arrays కోసం, మనం మొదట ఇలా రాయవచ్చు:

```swift
id: \.self
```

ప్రస్తుతం ఈ ఒక్క రాయడం మాత్రమే గుర్తుంచుకుంటే సరిపోతుంది. id గురించిన మరిన్ని నియమాలను లోతుగా అర్థం చేసుకోవాల్సిన అవసరం లేదు.

`item in` లోని `item` ప్రస్తుతం తీసుకున్న element ను సూచిస్తుంది.

ఉదాహరణకు, మొదటి loop లో `item` `"Sam"` ఉంటుంది; రెండవ loop లో అది `"John"` అవుతుంది.

అందువల్ల:

```swift
Text(item)
```

ఇది వరుసగా ఇలా మారుతుంది:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

అంటే, ఈ code చేసే పని ఏమిటంటే `names` array లోని ప్రతి name ను వరుసగా తీసుకుని, ప్రతి name కు ఒక `Text` view ను create చేయడం.

### అమలయ్యే విధానం

Execution process ను ఇలా అర్థం చేసుకోవచ్చు:

- `ForEach` ముందుగా `names` array లోని మొదటి element `"Sam"` ను చదవుతుంది
- `item` తాత్కాలికంగా `"Sam"` ను సూచిస్తుంది
- `Text(item)` `"Sam"` ను display చేస్తుంది
- ఆ తర్వాత తరువాతి element `"John"` ను చదవుతుంది
- అదే view code మళ్లీ execute అవుతుంది

చివరికి array లోని అన్ని names కూడా display అవుతాయి.

ఈ రాయడం యొక్క ప్రయోజనం ఏమిటంటే, names ఎక్కువైనా మనం చాలా `Text` ను మళ్లీ మళ్లీ రాయాల్సిన అవసరం లేదు; array content ను మాత్రమే మార్చితే సరిపోతుంది.

### ఫోటోలు పై loop

`ForEach` text మాత్రమే కాదు, images, colors లేదా ఇతర SwiftUI views ను కూడా display చేయగలదు.

ఉదాహరణకు, 4 చిత్రాలను సిద్ధం చేద్దాం:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

ఈ నాలుగు చిత్రాలను Xcode లోని Assets folder లోకి drag చేయండి.

![image](../../Resource/017_for3.png)

`ForEach` ను ఉపయోగించకపోతే, ప్రతి image ను మనం చేతితో వ్రాయాలి:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

చూపబడే ఫలితం:

![image](../../Resource/017_for4.png)

ఈ విధానం పని చేస్తుంది, కానీ code చాల పొడవుగా ఉంటుంది.

Images ఎక్కువ అవుతున్న కొద్దీ, మరింత ఎక్కువ `Image` code ను మళ్లీ రాయాల్సి ఉంటుంది.

తర్వాత image size ను ఒకే విధంగా మార్చాలి అనుకుంటే, వాటిని ఒక్కొక్కటిగా మార్చాలి.

అప్పుడు image names ను array లో పెట్టి, `ForEach` ద్వారా image views ను మళ్లీ మళ్లీ create చేయవచ్చు:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

ఇక్కడ `images` అనేది string array; array లోని ప్రతి element ఒక image name.

`ForEach(images, id: \.self)` అంటే `images` array లోని ప్రతి element ను క్రమంగా చదివి, item ను distinguish చేయడానికి అదే element ను ఉపయోగించి, ప్రస్తుత element ఆధారంగా దానికి సరిపోయే view ను create చేస్తుంది.

ఉదాహరణకు, మొదట `"430F9BEF"` చదివితే:

```swift
Image(item)
```

అది దీన్నే సూచిస్తుంది:

```swift
Image("430F9BEF")
```

తర్వాతి images కూడా ఇదే విధంగా వరుసగా display అవుతాయి.

![image](../../Resource/017_for4.png)

ఇక్కడ కూడా మనం ఉపయోగించేది:

```swift
id: \.self
```

దానికి కారణం ముందునాటిదే. `images` array లోని elements కూడా simple string types కావడంతో, beginner stage లో element నే distinguishing value గా ఉపయోగిస్తే సరిపోతుంది.

దీన్ని ఒక స్థిరమైన formula లాగా గుర్తుంచుకోవచ్చు:

**`ForEach` అనేది `String` లేదా `Int` వంటి simple array ను loop చేసినప్పుడు, సాధారణంగా `id: \.self` అని రాస్తాము.**

### చిత్రాలను జోడించడం

తర్వాత కొత్త images జోడించాలి అనుకుంటే, array content ను మాత్రమే మార్చితే సరిపోతుంది:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

కొత్త `Image` code ను మళ్లీ మళ్లీ రాయాల్సిన అవసరం లేదు.

Images ఎక్కువగా ఉంటే, దీన్ని `ScrollView` తో కలిపి ఉపయోగించవచ్చు; లేకపోతే content screen ను దాటిన తర్వాత పూర్తిగా preview చేయడం సాధ్యం కాదు.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### చిత్రాలను మార్చడం

Images style ను ఒకే విధంగా మార్చాలంటే, `ForEach` లోని code ను మాత్రమే మార్చాలి.

ఉదాహరణకు, width ను `80` గా మార్చుదాం:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

ఇలా అన్ని images ఒకేసారి update అవుతాయి; వాటిని ఒక్కొక్కటిగా మార్చాల్సిన అవసరం ఉండదు.

ఇదే `ForEach` యొక్క ఒక ముఖ్యమైన ఉపయోగం:

**అనేక views కు ఒకే structure ఉండి, content మాత్రమే వేరుగా ఉన్నప్పుడు, view code ను ఒక్కసారి మాత్రమే రాసి, ఏమి display కావాలో array data నిర్ణయించేలా చేయవచ్చు.**

## సారాంశం

ఈ పాఠంలో, `for` loop మరియు `ForEach` గురించి నేర్చుకున్నాం.

`for` loop అనేది array లేదా range లోని elements ను క్రమంగా process చేయడానికి ఉపయోగించబడుతుంది; ఇది data handling వైపు ఎక్కువగా మొగ్గుచూపుతుంది.

`ForEach` అనేది SwiftUI లో array content ఆధారంగా views ను మళ్లీ మళ్లీ create చేయడానికి ఉపయోగించబడుతుంది; ఇది UI display వైపు ఎక్కువగా మొగ్గుచూపుతుంది.

ప్రస్తుత beginner stage లో, `ForEach` యొక్క సాధారణ రాయడం:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

ఇక్కడ `id: \.self` అంటే ప్రతి element ను distinguish చేయడానికి అదే element ను ఉపయోగించడం.

Array లోని content `String`, `Int` వంటి simple types గా ఉన్నప్పుడు, సాధారణంగా ఈ రాయడం నే మొదట ఉపయోగించవచ్చు.

తర్వాత web ను browse చేస్తున్నప్పుడో లేదా App ను ఉపయోగిస్తున్నప్పుడో, repeated text, images లేదా list content కనిపిస్తే, SwiftUI లో అవి సాధారణంగా ముందుగా array లో పెట్టి, తర్వాత `ForEach` ద్వారా ఒక్కొక్కటిగా display చేస్తారని గుర్తు పెట్టుకోవచ్చు.
