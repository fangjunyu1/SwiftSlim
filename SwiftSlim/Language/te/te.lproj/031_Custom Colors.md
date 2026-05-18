# అనుకూల రంగులు

ఈ పాఠంలో, SwiftUI లో రంగులను ఎలా అనుకూలీకరించాలో నేర్చుకుంటాము.

ముందటి పాఠాల్లో, SwiftUI అందించే డిఫాల్ట్ రంగులను ఇప్పటికే ఉపయోగించాం. ఉదాహరణకు:

```swift
Color.blue
Color.red
Color.green
```

ఈ రంగులను ఉపయోగించడం చాలా సులభం. కానీ నిజమైన App అభివృద్ధిలో, డిఫాల్ట్ రంగులు చాలాసార్లు తగినంత ఖచ్చితంగా ఉండవు.

ఉదాహరణకు, డిజైన్ ఫైల్‌లో ఇలాంటి రంగులు ఉండవచ్చు:

```text
#2c54c2
#4875ed
#213e8d
```

ఈ రకమైన రంగును Hex రంగు అంటారు.

ఈ పాఠంలో, ముందుగా SwiftUI కు Hex రంగులను మద్దతు ఇవ్వేలా చేస్తాము. తర్వాత `static` ఉపయోగించి తరచుగా ఉపయోగించే రంగులను సక్రమంగా ఏర్పాటు చేస్తాము.

చివరగా, అనుకూల రంగులను జంతు విజ్ఞాన సర్వస్వం వీక్షణలో ఉపయోగిస్తాము. అలాగే బటన్ మరింత పొరలతో కనిపించేలా గ్రేడియెంట్ నేపథ్యాన్ని ఉపయోగిస్తాము.

## అనుకూల రంగులు ఎందుకు అవసరం?

SwiftUI లో, మనం సిస్టమ్ రంగులను నేరుగా ఉపయోగించవచ్చు.

ఉదాహరణకు:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

ఇక్కడ `.blue` నీలం రంగును సూచిస్తుంది. ఇది నిజానికి `Color.blue` యొక్క సంక్షిప్త రూపం.

డిఫాల్ట్ రంగుల ప్రయోజనం ఏమిటంటే అవి సులభంగా, సౌకర్యంగా ఉంటాయి. కానీ రంగుల ఎంపిక పరిమితంగా ఉంటుంది.

ఉదాహరణకు:

```swift
Color.blue
```

ఇది SwiftUI అందించే డిఫాల్ట్ నీలం రంగునే సూచిస్తుంది.

![Color.blue](../../../Resource/031_color6.png)

కానీ నిజమైన అభివృద్ధిలో, మనకు తరచుగా మరింత నిర్దిష్టమైన రంగులు అవసరం అవుతాయి.

ఉదాహరణకు, రెండూ నీలమే అయినప్పటికీ, లేత నీలం, ముదురు నీలం, బూడిదనీలం, ప్రకాశవంతమైన నీలం వంటి వేర్వేరు ప్రభావాలు ఉండవచ్చు.

![More Blue](../../../Resource/031_color5.png)

ఈ సమయంలో, కేవలం `Color.blue` మాత్రమే ఉపయోగిస్తే, డిజైన్ ప్రభావాన్ని తిరిగి సరిగా చూపించడం కష్టం.

అందుకే, SwiftUI అనుకూల రంగులను మద్దతు ఇవ్వేలా చేయాలి.

## Hex రంగు అంటే ఏమిటి?

స్క్రీన్‌పై కనిపించే రంగులు సాధారణంగా ఎరుపు, ఆకుపచ్చ, నీలం అనే మూడు చానళ్లతో ఏర్పడతాయి. అంటే RGB.

RGB అంటే వరుసగా:

```text
Red     // ఎరుపు
Green   // ఆకుపచ్చ
Blue    // నీలం
```

Hex రంగు అనేది RGB రంగును సూచించే ఒక విధానం.

ఉదాహరణకు:

```swift
#5479FF
```

ఈ రంగు విలువను మూడు భాగాలుగా సరళంగా అర్థం చేసుకోవచ్చు:

```text
54  // ఎరుపు చానల్‌ను సూచిస్తుంది
79  // ఆకుపచ్చ చానల్‌ను సూచిస్తుంది
FF  // నీలం చానల్‌ను సూచిస్తుంది
```

ఈ పాఠంలో, ఈ సంఖ్యలను లెక్కించాల్సిన అవసరం లేదు. అలాగే హెక్సాడెసిమల్ నియమాలను లోతుగా అర్థం చేసుకోవాల్సిన అవసరం లేదు.

ఇప్పటికైతే తెలుసుకోవాల్సింది ఒక్కటే: `#5479FF` ఒక నిర్దిష్ట రంగును సూచిస్తుంది.

తర్వాత మనం `#2c54c2`, `#4875ed` వంటి రచనలను చూసినప్పుడు, ముందుగా వాటిని ఒక రంగు విలువగా అర్థం చేసుకోవచ్చు.

Sketch, Figma, Photoshop వంటి డిజైన్ సాధనాల్లో కూడా ఇలాంటి రంగు విలువలను తరచుగా చూడవచ్చు.

![color](../../../Resource/031_color.png)

కానీ SwiftUI లో డిఫాల్ట్‌గా ఇలా నేరుగా రాయలేము:

```swift
Color(hex: "#5479FF")
```

అందుకే, Hex స్ట్రింగ్ ద్వారా రంగు సృష్టించడానికి `Color` టైప్‌ను మనమే విస్తరించాలి.

## Color+Hex.swift ఫైల్‌ను సృష్టించడం

ముందుగా, ఒక కొత్త Swift ఫైల్‌ను సృష్టిస్తాము.

ఫైల్ పేరును ఇలా పెట్టవచ్చు:

```text
Color.swift
```

లేదా మరింత స్పష్టంగా ఇలా రాయవచ్చు:

```text
Color+Hex.swift
```

ఇక్కడ మరింత సిఫార్సు చేసే పేరు:

```text
Color+Hex.swift
```

Swift ప్రాజెక్టుల్లో, `Color+Hex.swift` వంటి ఫైల్ పేర్లు చాలా సాధారణం.

ఈ ఫైల్ `Color` కు Hex సామర్థ్యాన్ని జోడించే extension ఫైల్ అని ఇది సూచిస్తుంది.

ఫైల్ పేరు కోడ్ అమలును నేరుగా ప్రభావితం చేయదు. కానీ ఈ ఫైల్ ఉపయోగం ఏమిటో సులభంగా అర్థం చేసుకోవడంలో సహాయపడుతుంది.

## Color(hex:) కోడ్‌ను జోడించడం

`Color+Hex.swift` ఫైల్‌లో, క్రింది కోడ్‌ను రాయండి:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

ఈ కోడ్ `extension` ఉపయోగించి `Color` టైప్‌ను విస్తరిస్తుంది. అలాగే `Color` కు ఒక కొత్త initializer జోడిస్తుంది:

```swift
init(hex: String)
```

ఈ initializer ఉన్న తర్వాత, మనం Hex స్ట్రింగ్‌ను `Color` కు పంపి ఒక అనుకూల రంగును సృష్టించవచ్చు:

```swift
Color(hex: "#5479FF")
```

ఈ extension కోడ్ లోపల Hex స్ట్రింగ్‌ను SwiftUI గుర్తించగల RGB రంగుగా మార్చుతుంది.

ఈ దశలో ప్రతి మార్పిడి లైన్‌ను లోతుగా అర్థం చేసుకోవాల్సిన అవసరం లేదు. జోడించిన `Color(hex:)` పద్ధతి ద్వారా Hex రంగు విలువతో అనుకూల రంగును సృష్టించవచ్చని తెలుసుకోవడం సరిపోతుంది.

## అనుకూల రంగులను ఉపయోగించడం

ఇప్పుడు, `ContentView` లో అనుకూల రంగులను పరీక్షించవచ్చు.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

ప్రదర్శన ప్రభావం:

![color](../../../Resource/031_color1.png)

ఈ ఉదాహరణలో, మొదటి పంక్తి సిస్టమ్ రంగును ఉపయోగిస్తోంది:

```swift
.foregroundStyle(Color.blue)
```

తర్వాతి మూడు పంక్తులు అనుకూల Hex రంగులను ఉపయోగిస్తున్నాయి:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

పోల్చి చూస్తే, సిస్టమ్ నీలం రంగుకు ఒకే డిఫాల్ట్ ప్రభావం మాత్రమే ఉందని తెలుసుకోవచ్చు.

కానీ Hex రంగులు నీలం రంగులోని మరింత సూక్ష్మమైన మార్పులను సూచించగలవు.

అదే అనుకూల రంగుల విలువ: అవి ఇంటర్‌ఫేస్ రంగులను నిజమైన డిజైన్‌కు దగ్గరగా ఉంచుతాయి. అలాగే App యొక్క దృశ్య శైలిని మనం మరింత సులభంగా నియంత్రించగలుగుతాము.

## static ఉపయోగించి రంగులను సక్రమంగా ఏర్పాటు చేయడం

ఇప్పుడు, Hex స్ట్రింగ్ ద్వారా రంగులను సృష్టించగలుగుతున్నాము:

```swift
Color(hex: "#2c54c2")
```

ఈ రచన సరిగ్గా పనిచేస్తుంది. కానీ ఒకే రంగు అనేక చోట్ల మళ్లీ మళ్లీ ఉపయోగించాల్సి వస్తే, తర్వాత నిర్వహించడం అంత సౌకర్యంగా ఉండదు.

ఒక రంగు విలువను 10 చోట్ల రాసి ఉంటే, భవిష్యత్తులో ఆ నీలం రంగును మార్చాలనుకుంటే ఒక్కొక్క చోట మార్చాలి.

ఈ సమయంలో, `static` ఉపయోగించి తరచుగా ఉపయోగించే రంగులను ఒకే చోట సక్రమంగా ఏర్పాటు చేయవచ్చు.

`Color+Hex.swift` ఫైల్ చివరలో, క్రింది కోడ్‌ను కొనసాగించి జోడించండి:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ఇక్కడ, మనం `Color` కు మూడు static properties జోడించాం: `animalBlue`, `animalLightBlue`, `animalDarkBlue`. ఇవి వేర్వేరు లోతులతో ఉన్న నీలం రంగులను సూచిస్తాయి.

ఈ properties `static` ఉపయోగిస్తున్నందున, అవి `Color` టైప్‌కే చెందినవి.

ఉపయోగించేటప్పుడు, `Color.` ద్వారా నేరుగా యాక్సెస్ చేయవచ్చు:

```swift
Color.animalBlue
```

ఈ రచన నేరుగా Hex స్ట్రింగ్ రాయడం కంటే మరింత స్పష్టంగా ఉంటుంది.

`Color.animalBlue` చూసినప్పుడు, ఇది జంతు విజ్ఞాన సర్వస్వంలో ఉపయోగించే నీలం రంగు అని తెలుసుకోవచ్చు.

కానీ `Color(hex: "#2c54c2")` చూస్తే, అది ఒక రంగు విలువ అని మాత్రమే తెలుసుకోవచ్చు. దాని నిర్దిష్ట ఉపయోగం ఏమిటో సులభంగా అర్థం కాకపోవచ్చు.

రంగులను ఒకే చోట నిర్వహించడం వల్ల మరో ప్రయోజనం ఉంది: తర్వాత మార్చడం మరింత సులభం.

జంతు విజ్ఞాన సర్వస్వం యొక్క ప్రధాన రంగును మార్చాలనుకుంటే, నిర్వచించిన స్థానాన్ని మాత్రమే మార్చాలి:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

ఈ రంగును ఉపయోగించే అన్ని చోట్లా కలిసి నవీకరించబడతాయి.

ఇదే `static` ఉపయోగించి రంగులను ఏర్పాటు చేసే అర్థం: రంగు పేర్లు మరింత స్పష్టంగా ఉంటాయి, అలాగే తర్వాత నిర్వహణ మరింత సులభంగా ఉంటుంది.

## జంతు విజ్ఞాన సర్వస్వంలో ఉపయోగించడం

ఇప్పుడు, అనుకూల రంగులను ముందున్న జంతు విజ్ఞాన సర్వస్వం వీక్షణలో ఉపయోగించవచ్చు.

ముందుగా జంతు బటన్ నేపథ్యం తెలుపు రంగులో ఉండేది:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

ఇప్పుడు, దాన్ని అనుకూల రంగుగా మార్చవచ్చు:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

ఇక్కడ `Color.animalBlue` అనేది మనం ఇప్పుడే `Color+Hex.swift` లో నిర్వచించిన static రంగు.

బటన్ టెక్స్ట్‌కు తెలుపు రంగును ఉపయోగించండి:

```swift
.foregroundStyle(Color.white)
```

జంతు emoji నేపథ్యానికి అర్ధపారదర్శక తెలుపు రంగును ఉపయోగించండి:

```swift
.background(Color.white.opacity(0.15))
```

ఇలా చేస్తే బటన్‌కు ఒక ఏకరీతి నీలం దృశ్య శైలి ఏర్పడుతుంది.

ఈ దశలో ముఖ్యమైనది క్లిష్టమైన కోడ్‌ను జోడించడం కాదు. ముందుగా నేర్చుకున్న అనుకూల రంగులను నిజమైన ఇంటర్‌ఫేస్‌లో ఉపయోగించడం.

## గ్రేడియెంట్ నేపథ్యాన్ని ఉపయోగించడం

ఒకే రంగును ఉపయోగించడం కాకుండా, అనేక రంగులను కలిపి గ్రేడియెంట్ ప్రభావాన్ని కూడా సృష్టించవచ్చు.

ఉదాహరణకు, ముందు మనం ఈ రంగులను నిర్వచించాం:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ఈ రంగులను విడిగా ఉపయోగించవచ్చు. అలాగే వాటిని కలిపి గ్రేడియెంట్ నేపథ్యంగా కూడా ఉపయోగించవచ్చు.

SwiftUI లో, `LinearGradient` ఉపయోగించి రేఖీయ గ్రేడియెంట్‌ను సృష్టించవచ్చు.

ఉదాహరణకు:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ఈ కోడ్ ఎడమ నుండి కుడికి వెళ్లే గ్రేడియెంట్ నేపథ్యాన్ని సృష్టిస్తుంది. రంగు `Color.animalBlue` నుండి క్రమంగా `Color.animalLightBlue` కు మారుతుంది.

ఇందులో `colors` గ్రేడియెంట్‌లో పాల్గొనే రంగులను సెట్ చేయడానికి ఉపయోగిస్తారు. `startPoint` మరియు `endPoint` గ్రేడియెంట్ దిశను నియంత్రించడానికి ఉపయోగిస్తారు.

### గ్రేడియెంట్ ప్రభావాన్ని పరీక్షించడం

సాధారణ Text తో గ్రేడియెంట్ నేపథ్యాన్ని పరీక్షించవచ్చు.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

ప్రదర్శన ప్రభావం:

![color](../../../Resource/031_color3.png)

ఈ ఉదాహరణలో, `Text` నేపథ్యం ఇక ఒకే రంగు కాదు. అది ఎడమ నుండి కుడికి క్రమంగా మారే గ్రేడియెంట్ రంగు.

సాధారణ నేపథ్య రంగుతో పోలిస్తే, గ్రేడియెంట్ నేపథ్యం మరింత పొరల భావాన్ని ఇస్తుంది. అలాగే ఇంటర్‌ఫేస్‌లో దృశ్య ప్రాధాన్యతను సులభంగా సృష్టిస్తుంది.

## జంతు విజ్ఞాన సర్వస్వంలో గ్రేడియెంట్ నేపథ్యాన్ని ఉపయోగించడం

ఇప్పుడు, జంతు బటన్ యొక్క నేపథ్య రంగును:

```swift
.background(Color.animalBlue)
```

గ్రేడియెంట్ నేపథ్యంగా మార్చవచ్చు:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

పూర్తి కోడ్ ఇలా ఉంటుంది:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ప్రదర్శన ప్రభావం:

![color](../../../Resource/031_color4.png)

ఇప్పుడు, జంతు బటన్ ఇక కేవలం ఒకే నేపథ్య రంగుతో ఉండదు. అది ఎడమ నుండి కుడికి వెళ్లే గ్రేడియెంట్ ప్రభావాన్ని కలిగి ఉంటుంది.

ఒకే రంగు నేపథ్యంతో పోలిస్తే, గ్రేడియెంట్ నేపథ్యం ఇంటర్‌ఫేస్‌ను మరింత పొరలుగా కనిపించేలా చేస్తుంది. అలాగే నిజమైన App లలోని దృశ్య రూపకల్పనకు దగ్గరగా ఉంటుంది.

## ఒకే రంగు నేపథ్యం మరియు గ్రేడియెంట్ నేపథ్యం మధ్య తేడా

ఒకే రంగు నేపథ్యం కేవలం ఒక రంగును ఉపయోగిస్తుంది.

ఉదాహరణకు:

```swift
.background(Color.animalBlue)
```

ఈ రచన సులభంగా, స్పష్టంగా ఉంటుంది. ఇది చాలా ప్రాథమిక ఇంటర్‌ఫేస్‌లకు సరిపోతుంది.

గ్రేడియెంట్ నేపథ్యం అనేక రంగులను ఉపయోగిస్తుంది.

ఉదాహరణకు:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

ఈ రచన ఇంటర్‌ఫేస్‌ను మరింత పొరలతో కనిపించేలా చేస్తుంది. కానీ దృశ్య క్లిష్టతను కూడా పెంచవచ్చు.

అందువల్ల, నిజమైన అభివృద్ధిలో దీన్ని ఇలా అర్థం చేసుకోవచ్చు:

ఒకే రంగు నేపథ్యం సాధారణ టెక్స్ట్, సాధారణ బటన్, సాధారణ కార్డ్, సాధారణ పేజీ నేపథ్యాలకు సరిపోతుంది.

గ్రేడియెంట్ నేపథ్యం ప్రధాన బటన్, పైభాగం, కవర్ కార్డ్, ఫంక్షన్ ప్రవేశం వంటి ప్రత్యేకంగా చూపాల్సిన స్థానాలకు సరిపోతుంది.

## సారాంశం

ఈ పాఠంలో, SwiftUI లో అనుకూల రంగులను ఎలా ఉపయోగించాలో నేర్చుకున్నాము.

ముందుగా, Hex రంగు గురించి తెలుసుకున్నాము.

ఉదాహరణకు:

```text
#2c54c2
```

ఇది ఒక నిర్దిష్ట రంగును సూచిస్తుంది.

తర్వాత, `extension Color` ఉపయోగించి `Color` టైప్‌ను విస్తరించాము.

SwiftUI క్రింది విధంగా రంగును సృష్టించగలిగేలా చేశాము:

```swift
Color(hex: "#2c54c2")
```

ఆ తర్వాత, `static` ఉపయోగించి తరచుగా ఉపయోగించే రంగులను ఏర్పాటు చేశాము:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

దీంతో, ఇతర views లో నేరుగా ఇలా ఉపయోగించవచ్చు:

```swift
Color.animalBlue
```

ప్రతి సారి Hex స్ట్రింగ్ రాయడం కంటే, ఈ విధానం మరింత స్పష్టంగా ఉంటుంది. అలాగే తర్వాత రంగులను ఒకే చోట సవరించడం మరింత సౌకర్యంగా ఉంటుంది.

చివరగా, `LinearGradient` నేర్చుకున్నాము. అలాగే అనుకూల రంగులను కలిపి గ్రేడియెంట్ నేపథ్యంగా ఉపయోగించాము:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ఈ పాఠం ద్వారా, “అనుకూల రంగును సృష్టించడం” నుండి “నిజమైన ఇంటర్‌ఫేస్‌లో రంగును ఉపయోగించడం” వరకు మొత్తం ప్రక్రియను పూర్తి చేశాము.

భవిష్యత్తులో, ఒక రంగు అనేక చోట్ల మళ్లీ మళ్లీ ఉపయోగించాల్సి వస్తే, దాన్ని ముందుగా `Color` extension లో ఏర్పాటు చేయడం గురించి ఆలోచించవచ్చు.

ఇలా చేస్తే కోడ్ మరింత స్పష్టంగా ఉంటుంది. అలాగే ఇంటర్‌ఫేస్ శైలిని ఏకరీతిగా ఉంచడం కూడా సులభం.
