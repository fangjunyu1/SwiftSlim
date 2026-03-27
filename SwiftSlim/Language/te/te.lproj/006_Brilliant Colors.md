# ఆకర్షణీయమైన రంగులు

ఈ పాఠంలో మనం SwiftUI లో సాధారణంగా ఉపయోగించే visual modifiers ను నేర్చుకుంటాము. వాటిలో ఇవి ఉంటాయి:

* రంగులు
* foreground color
* background color
* offset
* transparency
* blur

అలాగే Safe Area (సురక్షిత ప్రాంతం) గురించিও నేర్చుకుంటాము.

ఈ modifiers view యొక్క బయట కనిపించే రూపాన్ని నియంత్రించడానికి ఉపయోగించబడతాయి, తద్వారా interface మరింత స్పష్టంగా, స్థరాలతో కనిపిస్తుంది.

## రంగులు

SwiftUI లో text యొక్క రంగును సెట్ చేయవచ్చు.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue అంటే నీలం రంగు. ఇది వాస్తవానికి Color.blue యొక్క సరళ రూపం. ఇది type inference వల్ల సాధ్యమవుతుంది.

సాధారణ రంగులు:

```swift
.black
.green
.yellow
.pink
.gray
...
```

ఇవి అన్నీ Color యొక్క static properties.

![Color](../../RESOURCE/006_color.png)

Color ను ఒక రంగు type గా భావించవచ్చు. .blue, .red వంటి వాటి ప్రతి ఒక్కటి దానికి చెందిన నిర్దిష్ట రంగులు.

### Color view

SwiftUI లో Color ను ఒక view గానూ నేరుగా చూపించవచ్చు.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

ఈ కోడ్ 100×100 పరిమాణం గల ఒక ఎరుపు చతురస్రాన్ని సృష్టిస్తుంది.

మొత్తం interface ను కూడా ఒక రంగుతో చూపించవచ్చు:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Run చేసిన తర్వాత, ఎరుపు రంగు మొత్తం screen నింపలేదని గమనించవచ్చు. iPhone పైభాగం మరియు కింది భాగం ఇంకా తెలుపుగా ఉంటాయి. ఇక్కడ Safe Area (సురక్షిత ప్రాంతం) అనే భావన ఉంది.

## Safe Area（సురక్షిత ప్రాంతం）

Safe Area అనేది content ను system elements దాచిపెట్టకుండా ఉంచడానికి system ముందుగా ఖాళీగా ఉంచే ప్రాంతం. దీనిలో ఇవి ఉంటాయి:

1. పైభాగంలోని status bar (సమయం, బ్యాటరీ)

2. కింది భాగంలోని Home indicator

3. notch లేదా Dynamic Island ప్రాంతం

![Color](../../RESOURCE/006_color3.png)

SwiftUI డిఫాల్ట్‌గా content ను safe area లోపల మాత్రమే పరిమితం చేస్తుంది. అందువల్ల view screen అంచుల దాకా విస్తరించదు.

### Safe Area ను పట్టించుకోకపోవడం

ఒకవేళ రంగు మొత్తం screen నింపాలి అనుకుంటే, ignoresSafeArea ను ఉపయోగించవచ్చు:

```swift
Color.red
    .ignoresSafeArea()
```

లేదా edgesIgnoringSafeArea ను ఉపయోగించవచ్చు:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

ఇలా చేస్తే view మొత్తం screen మీద విస్తరిస్తుంది.

గమనించాల్సిన విషయం ఏమిటంటే, edgesIgnoringSafeArea అనేది పాత విధానం. iOS 14 నుంచి ignoresSafeArea ను ఉపయోగించడం సిఫార్సు చేయబడింది.

## ముందుభాగపు రంగు

### foregroundStyle modifier

ముందటి పాఠాల్లో foregroundStyle ద్వారా రంగు సెట్ చేయడం నేర్చుకున్నాము.

ఉదాహరణకు:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle అనేది కొత్త style system. ఇది రంగులు, gradients, materials వంటి వాటిని support చేస్తుంది.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier

foregroundColor ద్వారానూ రంగు సెట్ చేయవచ్చు:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

దీనిని ఉపయోగించే విధానం foregroundStyle లాగే ఉంటుంది.

కొత్త Xcode వెర్షన్‌లలో, foregroundColor భవిష్యత్తు iOS వెర్షన్‌లలో deprecated కావచ్చని Xcode సూచిస్తుంది. అందువల్ల foregroundStyle ను ముందుగా ఉపయోగించడం మంచిది.

## నేపథ్యం

ఒకవేళ view కు background color ఇవ్వాలనుకుంటే, background ఉపయోగించవచ్చు:

```swift
background(.red)
```

ఉదాహరణకు, text కు background color జోడించడం:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome వంటి apps లో text ను select చేసినప్పుడు కనిపించే effect కు ఇది దగ్గరగా ఉంటుంది.

![Color](../../RESOURCE/006_color16.png)

ఒకవేళ background ను పెద్దగా చేయాలనుకుంటే, padding తో కలిపి ఉపయోగించాలి:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

ఇక్కడ ఒక ముఖ్యమైన నియమం ఉంది:

SwiftUI modifiers పై నుంచి కిందకు వరుసగా view ను నిర్మిస్తాయి. తరువాత రాసిన modifier, ముందు వచ్చిన ఫలితంపై పనిచేస్తుంది.

అందువల్ల:

```swift
.padding()
.background()
```

దీనర్థం background అనేది padding జోడించిన తరువాత వచ్చిన మొత్తం view ను చుట్టుకుంటుంది.

కానీ ఒకవేళ క్రమాన్ని మార్చితే:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

అప్పుడు background పెద్దది కాదు, ఎందుకంటే అది తరువాత వచ్చే padding ను చుట్టుకోదు.

## ఉదాహరణ - నాలుగు మూలల గల బోల్ట్ ఆకారం

ఇప్పుడు, మనం ఒక సులభమైన నాలుగు మూలల గల బోల్ట్ తరహా view ను తయారు చేద్దాం.

![Color](../../RESOURCE/006_color8.png)

మొదటగా, 50 × 50 పరిమాణం గల ఒక తెలుపు చతురస్రాన్ని తయారు చేద్దాం:

```swift
Color.white
    .frame(width: 50, height: 50)
```

దాన్ని వృత్తంలా మార్చాలనుకుంటే, cornerRadius ఉపయోగించవచ్చు:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

round corner radius, వెడల్పు మరియు ఎత్తు రెండింటి సగానికి సమానంగా ఉన్నప్పుడు, అది వృత్తంలా కనిపిస్తుంది.

ఇప్పుడు, ఒక నీలి background జోడిద్దాం:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

కొత్తగా జోడించిన padding బయటి ప్రాంతాన్ని పెద్దది చేస్తుంది. background ఆ బయట ప్రాంతంపై నీలం రంగును గీస్తుంది.

ఇలా ఒక నాలుగు మూలల బోల్ట్ లాంటి effect సిద్ధమవుతుంది.

### ఇంకో విధానం

Background color తో ఈ effect చేయడమే కాకుండా, ZStack తో కూడా ఈ నాలుగు మూలల బోల్ట్ effect ను తయారు చేయవచ్చు.

ముందే మనం ZStack అనేది overlapping arrangement కోసం ఉపయోగిస్తారని నేర్చుకున్నాము. ఈ ఆకారాన్ని కూడా ఒక circle మరియు ఒక rectangle overlap అయినట్లుగా భావించవచ్చు.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack views ను వరుసగా ఒకదానిపై ఒకటి ఉంచుతుంది. తరువాత జోడించిన view పై పొరలో కనిపిస్తుంది.

## ఉదాహరణ - ఒకదానిపై ఒకటి పడిన రెండు వృత్తాలు

చాలా icons సాధారణ ఆకారాల overlap ద్వారా రూపొందుతాయి. ఉదాహరణకు రెండు overlap అయిన circles.

![Color](../../RESOURCE/006_color14.png)

మొదట, రెండు circles ను సృష్టిద్దాం:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

ఈ రెండు circles ఒకదానిపై ఒకటి పడేలా చూపించాలి కాబట్టి, ZStack layout ను ఉపయోగిస్తాము:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

ఇప్పుడు రెండూ సమాన పరిమాణంలో ఉండటం వల్ల పూర్తిగా ఒకదానిపై ఒకటి కప్పుకుంటాయి.

మనకు పూర్తిగా కప్పేయడం కాదు, కొంత భాగం మాత్రమే overlap కావాలి. అందుకోసం offset ఉపయోగించి position shift effect తీసుకురావచ్చు.

## Offset

offset view యొక్క drawing position ను మాత్రమే మార్చుతుంది. ఇది parent view యొక్క layout calculation ను ప్రభావితం చేయదు.

వాడే విధానం:

```swift
.offset(x:y:)
```

x అనేది horizontal shift, y అనేది vertical shift.

Positive value అంటే కుడి / కిందకు shift అవుతుంది. Negative value అంటే ఎడమ / పైకి shift అవుతుంది.

రెండు circles కొంత overlap కావడానికి offset ఉపయోగించడం:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

ఎరుపు వృత్తం layout లో తన అసలు స్థానాన్ని మార్చదు, కానీ దాని drawing position ఎడమవైపు 25 points కదులుతుంది. అందువల్ల రెండు circles కొంత overlap అయినట్లుగా కనిపిస్తాయి.

## పారదర్శకత

SwiftUI లో opacity view యొక్క transparency ను సెట్ చేయడానికి ఉపయోగిస్తారు.

ప్రాథమిక వాడుక:

```swift
.opacity(0.5)
```

opacity యొక్క పరిమితి 0.0 నుంచి 1.0 వరకు ఉంటుంది. అందులో:

* 0 అంటే పూర్తిగా పారదర్శకం
* 1 అంటే పూర్తిగా అపారదర్శకం

ఆరెంజ్ రంగు వృత్తానికి transparency ఇవ్వడానికి opacity ను ఉపయోగించవచ్చు:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

ఆరెంజ్ రంగు వృత్తానికి opacity 0.8 ఇచ్చినప్పుడు, దాని అపారదర్శకత 80% అవుతుంది. రెండు వృత్తాలు overlap అయినప్పుడు, overlap ప్రాంతంలో రంగుల కలయిక కనిపిస్తుంది.

## Blur

SwiftUI లో blur ద్వారా మసక ప్రభావం ఇవ్వవచ్చు:

```swift
.blur(radius:10)
```

radius అనేది blur యొక్క వ్యాసార్థాన్ని నిర్వచిస్తుంది. సంఖ్య ఎక్కువైతే blur మరింత స్పష్టంగా కనిపిస్తుంది.

ఇప్పుడు మనం ఈ రెండు circles కు blur effect జోడిద్దాం:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

చివరగా, మనం రెండు చాలా blurred circles ను చూడవచ్చు.

## సారాంశం

ఈ పాఠం SwiftUI లోని సాధారణ visual modifiers చుట్టూ సాగింది. వీటి ద్వారా view యొక్క రంగు, స్థానం మరియు visual effect ను ఎలా నియంత్రించాలో నేర్చుకున్నాము.

స్పష్టమైన ఉదాహరణల ద్వారా, వేర్వేరు visual modifiers interface లో ఎలా పనిచేస్తాయో చూడగలిగాము. అలాగే safe area గురించి కూడా అవగాహన పొందాము.

ఇవి అన్నీ చాలా ప్రాథమిక modifiers. వీటిని ఎక్కువగా అభ్యసించి ఉపయోగించడం ద్వారా, వాస్తవ అభివృద్ధిలో interface effect ను మరింత స్పష్టంగా నియంత్రించగలుగుతాము.

### పాఠం తరువాత అభ్యాసాలు

* ఒక చిత్రానికి transparency మరియు blur effect జోడించండి
* వేర్వేరు transparency గల మూడు overlap అయిన circles ను సెట్ చేయండి
* మొత్తం screen నిండే background image తయారు చేసి, safe area ను పట్టించుకోకుండా చూపించండి
* అనేక views యొక్క స్థానాన్ని offset తో మార్చండి

ఈ అభ్యాసాల లక్ష్యం APIలను కంఠస్థం చేయడం కాదు, visual మార్పులు మరియు layout ప్రవర్తన మధ్య ఉన్న సంబంధాన్ని గమనించడం.
