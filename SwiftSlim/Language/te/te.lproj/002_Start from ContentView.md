# ContentView నుంచి ప్రారంభం

## పాఠానికి ముందు సిద్ధం

ఈ పాఠంలో, మనం ContentView.swift ఫైల్ నుంచి ప్రారంభించి, SwiftUI యొక్క ప్రాథమిక నిర్మాణాన్ని వ్యవస్థబద్ధంగా తెలుసుకుంటాము. ఇందులో ఇవి ఉంటాయి:

* వ్యాఖ్యలు
* View నిర్మాణం
* VStack / HStack / ZStack లేఅవుట్లు
* SF Symbols చిహ్నాలు
* view modifiers (modifier)
* preview కోడ్ #Preview

ముందుగా, మీరు ఇంతకుముందు సృష్టించిన Xcode ప్రాజెక్ట్‌ను కనుగొని, .xcodeproj ఫైల్‌పై డబుల్-క్లిక్ చేయండి.

ఎడమవైపు ఉన్న Navigator నావిగేషన్ ప్రాంతంలో ContentView.swift ఫైల్‌ను ఎంచుకోండి.

గమనిక: ప్రతి సారి ప్రాజెక్ట్‌ను తెరిచినప్పుడు, Canvas లో "Preview paused" కనిపించవచ్చు. అప్పుడు refresh బటన్‌ను నొక్కితే preview మళ్లీ కనిపిస్తుంది.

![Swift](../../RESOURCE/002_view7.png)

## ContentView ను తెలుసుకోవడం

ContentView కోడ్:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

కోడ్ తక్కువగా కనిపించినప్పటికీ, ఇందులో SwiftUI యొక్క ముఖ్యమైన core structure ఉంటుంది.

### 1. వ్యాఖ్యలు

ఫైల్ పైభాగంలో:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

ఇది ఫైల్ వ్యాఖ్య. దీన్ని ఫైల్ సమాచారం నమోదు చేయడానికి ఉపయోగిస్తారు. ఇందులో ఫైల్ పేరు, ప్రాజెక్ట్ పేరు, సృష్టించిన వ్యక్తి, సృష్టించిన తేదీ ఉంటాయి.

Swift లో single-line comment కోసం // ఉపయోగిస్తారు:

```swift
// ఇది ఒక వ్యాఖ్య
```

వ్యాఖ్యలు కోడ్ readability ను మెరుగుపరుస్తాయి, అలాగే డెవలపర్‌కు కోడ్ లాజిక్ అర్థం చేసుకోవడంలో సహాయపడతాయి.

వాస్తవ అభివృద్ధిలో, కోడ్ కొన్నిసార్లు అర్థం చేసుకోవడానికి కష్టంగా ఉండవచ్చు. వ్యాఖ్యలు లేకపోతే, మూడు రోజుల తర్వాత మనమే రాసిన కోడ్‌ను కూడా మనమే అర్థం చేసుకోలేని పరిస్థితి రావచ్చు.

అందువల్ల, కోడ్ రాసే సమయంలో స్వయంగా వ్యాఖ్యలు జోడించడం ఒక మంచి అభివృద్ధి అలవాటు. వ్యాఖ్యల ద్వారా కోడ్ లాజిక్‌ను నమోదు చేయడం వల్ల తరువాత నిర్వహణ సులభమవుతుంది.

**తాత్కాలికంగా కోడ్‌ను నిలిపివేయడం**

వ్యాఖ్యలను తాత్కాలికంగా కోడ్‌ను నిరాక్రియ చేయడానికి కూడా ఉపయోగించవచ్చు. ఇది సమస్యలను వెతికే సమయంలో ఉపయోగపడుతుంది.

ఉదాహరణకు:

```
A
B
C
```

A, B, C మూడు కోడ్ భాగాలు అని అనుకుందాం. వీటిలో ఒకదాంట్లో లోపం ఉంది. అప్పుడు మనం comment ఉపయోగించి ఒకటి చొప్పున పరీక్షించవచ్చు.

మొదట A ను comment చేద్దాం:

```
// A
B
C
```

A ను comment చేసిన తర్వాత కోడ్ సరిగా పనిచేస్తే, సమస్య A లో ఉందని అర్థం.

A ను comment చేసిన తర్వాత కూడా సమస్య అలాగే ఉంటే, తరువాత B ను comment చేయవచ్చు. ఈ విధంగా సమస్య ఉన్న కోడ్‌ను కనుగొనేవరకు కొనసాగించవచ్చు.

అభివృద్ధి సమయంలో చాలా సమస్యలు ఎదురవుతాయి. వాటి కారణాన్ని తెలుసుకోవడానికి ఎక్కువగా కోడ్‌ను comment చేసి పరీక్షిస్తాము. ఇది సమస్య ఉన్న కోడ్‌ను గుర్తించి BUG ను కనుగొనడంలో సహాయపడుతుంది.

Xcode లో, ఈ shortcut ను ఉపయోగించవచ్చు:

```
Command ⌘ + /
```

దీనితో వేగంగా వ్యాఖ్యను జోడించవచ్చు లేదా తొలగించవచ్చు.

### 2. SwiftUI framework ను import చేయడం

```swift
import SwiftUI
```

ఈ కోడ్ SwiftUI framework ను import చేస్తున్నదని సూచిస్తుంది.

SwiftUI లోని View, Text, Image, VStack వంటి types అన్నీ ఈ framework నుంచే వస్తాయి.

SwiftUI framework ను import చేయకపోతే, Xcode లో ఈ error కనిపిస్తుంది:

```
Cannot find type 'View' in scope
```

దీనర్థం compiler కు View type గుర్తుపట్టలేకపోతుంది.

### 3. View నిర్మాణం

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

మొదటిసారి ఈ View structure ను చూసినప్పుడు ఇది కొంచెం అపరిచితంగా అనిపించవచ్చు, ఎందుకంటే ఇందులో struct, View, var, body, some వంటి keywords ఉన్నాయి.

ఇప్పుడే ఈ keywords గురించి మనం ఇంకా నేర్చుకోలేదు. కాబట్టి ఈ దశలో తెలుసుకోవాల్సింది ఒక్కటే: ఈ కోడ్ ContentView అనే పేరుతో ఒక View ను సృష్టిస్తుంది.

మీరు View ను ఒక drawing board లా ఊహించవచ్చు. దానిపై మనం చిత్రీకరిస్తాము; ఆ చిత్రీకరణకు ఉపయోగించే సాధనం SwiftUI.

ఉదాహరణకు:

![Swift](../../RESOURCE/002_view.png)

పై చిత్రంలో మూడు pages కనిపిస్తున్నాయి. వాస్తవానికి అవి మూడు వేర్వేరు Views.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

మనము SwiftUI తో App అభివృద్ధి చేసినప్పుడు, ప్రతి పేజీ ఒక View అవుతుంది.

### 4. SwiftUI కోడ్

View లోపల కనిపించే SwiftUI కోడ్:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ఈ SwiftUI కోడ్ ఒక vertical layout ను సూచిస్తుంది; అందులో ఒక icon మరియు ఒక text చూపించబడతాయి.

![Swift](../../RESOURCE/002_view1.png)

#### VStack లేఅవుట్

```swift
VStack { }  // నిలువు లేఅవుట్
```

VStack అనేది vertical layout container. దాని లోపలి views పై నుంచి కింది వరకూ అమర్చబడతాయి.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI లో సాధారణంగా కనిపించే మూడు లేఅవుట్లు:

* VStack —— నిలువు అమరిక
* HStack —— అడ్డ అమరిక
* ZStack —— ఒకదాని మీద ఒకటి అమరిక (Z-axis)

```swift
HStack { }  // అడ్డ అమరిక
ZStack { }  // ఒకదాని మీద ఒకటి అమరిక
```

ప్రతి layout అమరికను చూపించే చిత్రం:

![Swift](../../RESOURCE/002_view2.png)

ఉదాహరణకు: HStack ఉపయోగించి horizontal arrangement చేయడం.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ఇక్కడ, globe icon మరియు text అడ్డంగా చూపబడుతున్నాయి.

![Swift](../../RESOURCE/002_view3.png)

మనకు అడ్డంగా అమరిక కావాలంటే HStack ఉపయోగిస్తాము. ఒకదాని మీద ఒకటి అమర్చాలి అంటే ZStack ఉపయోగిస్తాము.

#### Image మరియు SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ఈ కోడ్ ఒక globe icon ను చూపిస్తుంది. ఈ globe icon Apple యొక్క SF Symbols icon system నుంచి వస్తుంది.

![Swift](../../RESOURCE/002_view9.png)

ఈ కోడ్ యొక్క అర్థం: ఒక globe icon ను చూపించు, పెద్ద పరిమాణంలో చూపించు, అలాగే accent color తో చూపించు.

మనము globe మాత్రమే కాదు, ఇతర icons ను కూడా చూపించవచ్చు.

ఉదాహరణకు, ఒక backpack icon చూపించడం:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**ఇతర icons ను ఎలా చూపించాలి?**

దానికి Apple అందించే అధికారిక system icon library అయిన SF Symbols ను ఉపయోగించాలి.

Apple Developer అధికారిక వెబ్‌సైట్‌ను తెరిచి, [SF Symbols](https://developer.apple.com/sf-symbols/) ను డౌన్‌లోడ్ చేయండి.

![Swift](../../RESOURCE/002_sf.png)

SF Symbols App ను తెరవండి.

![Swift](../../RESOURCE/002_sf1.png)

ఎడమవైపు symbol categories కనిపిస్తాయి; కుడివైపు వాటికి సంబంధించిన icons కనిపిస్తాయి.

ఒక icon పై right-click చేసి "拷贝1个名称" ను ఎంచుకుంటే, దానికి సంబంధించిన పేరు string రూపంలో కాపీ అవుతుంది.

ఉదాహరణకు:

```
"globe"
"backpack"
"heart"
```

కాపీ చేసిన icon name ను Image(systemName:) లో ఉంచితే, వేర్వేరు icons ను చూపించవచ్చు.

గమనిక: ప్రతి SF Symbols icon కు కనిష్టంగా అవసరమైన operating system version ఉంటుంది. system version చాలా తక్కువైతే, ఆ icon కనిపించకపోవచ్చు. కాబట్టి SF Symbols App లో compatibility సమాచారాన్ని చూడాలి.

#### Modifiers

SwiftUI లో modifier అనేది view యొక్క రూపాన్ని లేదా ప్రవర్తనను మార్చడానికి ఉపయోగించే ఒక విధానం.

modifier ను బట్టలతో పోల్చుకోవచ్చు. ఒకే వ్యక్తి వేర్వేరు బట్టలు వేసుకుంటే వేర్వేరు రూపంలో కనిపించినట్లే, ఒకే view కు వేర్వేరు modifiers ఇస్తే దాని రూపం మారుతుంది.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ఇక్కడ imageScale మరియు foregroundStyle రెండూ Image view కు చెందిన modifiers. ఇవి Image లోని అసలు కంటెంట్‌ను మార్చకుండా, దాని రూపాన్ని సవరిస్తాయి.

**1. imageScale**

```swift
.imageScale(.large)
```

ఇది SF Symbols icon యొక్క పరిమాణాన్ని నియంత్రిస్తుంది:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

వేర్వేరు options ను మార్చి చూసి, SF Symbols icon వేర్వేరు పరిమాణాల్లో ఎలా కనిపిస్తుందో చూడవచ్చు.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle అనేది foreground color ను నియంత్రిస్తుంది.

.tint అంటే ప్రస్తుత environment లో ఉన్న accent color. సాధారణంగా iOS లో ఇది default గా blue ఉంటుంది.

మనకు foreground color ను red గా మార్చాలనుకుంటే:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text view

Text అనేది text ను చూపించడానికి ఉపయోగించే view.

```swift
Text("Hello, world!")
```

ఉదాహరణకు, నా పేరు చూపించాలంటే:

```swift
Text("FangJunyu")
```

గమనిక: string ను తప్పనిసరిగా "" double quotes లో పెట్టాలి.

మీరు మీ పేరు, ఫోన్ నంబర్ వంటి విషయాలను కూడా చూపించే ప్రయత్నం చేయవచ్చు.

#### padding అంచు ఖాళీ

SwiftUI లో padding అనేది view లోని content మరియు దాని boundary మధ్య అదనపు ఖాళీని కల్పిస్తుంది. ఇది “inner spacing (padding / content inset)” కు చెందినది.

```swift
HStack {
    ...
}
.padding()
```

ఈ కోడ్ HStack view కు system default padding జోడిస్తున్నదని సూచిస్తుంది.

**padding అంటే ఏమిటి?**

padding అంటే “view లోని content మరియు దాని border మధ్య ఉండే ఖాళీ”.

కింద ఉన్న చిత్రంలో, blue రంగు HStack కు padding ఇచ్చిన తర్వాత, blue ప్రాంతం లోపలికి కుదిరినట్లుగా కనిపిస్తుంది; అందువల్ల అది కొంచెం “చిన్నదైనట్లు” అనిపిస్తుంది.

![Swift](../../RESOURCE/002_view6.png)

**default padding**

padding() modifier డిఫాల్ట్‌గా system సిఫార్సు చేసే standard spacing ను ఉపయోగిస్తుంది.

```swift
.padding()
```

ఈ విలువ platform మరియు context ప్రకారం మారవచ్చు. ఉదాహరణకు:

* iOS లో ఇది సాధారణంగా సుమారు 16 pt ఉంటుంది.
* macOS లేదా watchOS లో system standard spacing వేరుగా ఉండవచ్చు; అది ఆయా platforms యొక్క design guidelines పై ఆధారపడుతుంది.

**custom padding**

view కు ప్రత్యేక దిశలలో కూడా padding ఇవ్వవచ్చు.

1. ఒకే దిశలో padding ఇవ్వడం

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

దిశల వివరణ:

* .top: పై అంచు ఖాళీ
* .bottom: కింది అంచు ఖాళీ
* .leading: ముందుభాగ అంచు ఖాళీ
* .trailing: వెనుకభాగ అంచు ఖాళీ

![Swift](../../RESOURCE/002_view12.png)

గమనిక: leading మరియు trailing భాషా దిశను అనుసరించి స్వయంచాలకంగా మారుతాయి. ఉదాహరణకు అరబిక్ వంటి RTL భాషా వాతావరణంలో అవి ఆటోమేటిక్‌గా తిరుగుతాయి.

2. ఒకేసారి బహుళ దిశలు ఇవ్వడం

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Array ఉపయోగించి ఒకేసారి అనేక దిశలను పేర్కొనవచ్చు. Array గురించి పూర్తి వివరంగా తరువాతి పాఠాల్లో నేర్చుకుంటాము; ఇక్కడ ఈ రాయు విధానం గురించి కేవలం తెలుసుకుంటే సరిపోతుంది.

3. horizontal లేదా vertical దిశకు padding ఇవ్వడం

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

ఇవి ఈ క్రింది కోడ్‌కు సమానం:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**padding తొలగించడం**

మీకు ఎలాంటి padding అవసరం లేకపోతే, .padding(0) ఉపయోగించి తొలగించవచ్చు:

```swift
.padding(0)
```

లేదా padding modifier ను పూర్తిగా తొలగించవచ్చు:

```swift
// .padding()
```

### 6. Preview preview కోడ్

```swift
#Preview {
    ContentView()
}
```

ఈ కోడ్ Canvas లో ContentView యొక్క preview ను రూపొందిస్తుంది.

గమనిక: #Preview అనేది Swift 5.9 / Xcode 15 లో పరిచయం చేసిన కొత్త syntax. దీనికి ముందు PreviewProvider structure ను ఉపయోగించేవారు.

**Preview ను comment చేస్తే ఏమవుతుంది?**

Preview ను comment చేస్తే:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas లో ఇక render చేయగల కంటెంట్ కనిపించదు.

![Swift](../../RESOURCE/002_xcode.png)

దీనర్ధం #Preview అనేదే Canvas లో preview చూపించడాన్ని నియంత్రిస్తోంది.

మనకు Xcode లో SwiftUI view ను preview చేయాలి అనుకుంటే, #Preview కోడ్ జోడించాలి. Preview అవసరం లేకపోతే, #Preview కోడ్‌ను comment చేయవచ్చు లేదా తొలగించవచ్చు.

## సారాంశం

ContentView.swift ఫైల్‌లో కోడ్ ఎక్కువగా లేకపోయినా, వాస్తవానికి ఇది SwiftUI యొక్క అనేక ముఖ్యమైన భావనలను కలిగి ఉంది. ప్రారంభికులకు ఈ కోడ్ మొదట కొంచెం అపరిచితంగా అనిపించవచ్చు. కానీ దీన్ని భాగాలుగా విడదీసి అర్థం చేసుకుంటే, SwiftUI పై ఒక ప్రాథమిక అవగాహన ఏర్పడుతుంది.

ఈ పాఠాన్ని తిరిగి గుర్తు చేసుకుంటే, ముందుగా మనం వ్యాఖ్యలు // గురించి నేర్చుకున్నాము. వ్యాఖ్యలను కోడ్ లాజిక్‌ను వివరించడానికి లేదా తాత్కాలికంగా కోడ్‌ను నిలిపివేయడానికి ఉపయోగించవచ్చు.

తరువాత, SwiftUI ఫైల్‌లో తప్పనిసరిగా SwiftUI framework ను import చేయాలని తెలుసుకున్నాము:

```swift
import SwiftUI
```

ఈ framework ను import చేయకపోతే, compiler కు View వంటి types గుర్తుపట్టడం సాధ్యపడదు.

తర్వాత మనం SwiftUI view యొక్క ప్రాథమిక నిర్మాణాన్ని చూశాము:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ఇందులో ContentView అనేది view యొక్క పేరు.

ఇంకా, మూడు సాధారణ layout containers ను కూడా తెలుసుకున్నాము: VStack (నిలువు అమరిక), HStack (అడ్డ అమరిక), ZStack (ఒకదాని మీద ఒకటి అమరిక).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ఈ కోడ్‌లో ఒక vertical arrangement container చూపించబడుతోంది; అందులో ఒక icon మరియు ఒక text ఉన్నాయి.

Image ద్వారా SF Symbols icons ను చూపించవచ్చు; వాటి పరిమాణం, రంగు వంటి అంశాలను modifiers ద్వారా నియంత్రించవచ్చు.

Text view ద్వారా text ను చూపించవచ్చు.

padding అనేది view చుట్టూ ఒక పారదర్శక ఖాళీని జోడించే spacing.

చివరిగా, #Preview ద్వారా Canvas లో preview చూపించవచ్చని తెలుసుకున్నాము.

### పాఠం తరువాత వ్యాయామాలు

ప్రారంభికులకు ఈ పాఠంలోని విషయాలు కొంచెం క్లిష్టంగా అనిపించవచ్చు. కాబట్టి ఈ పాఠంలో నేర్చుకున్న విషయాలను మరింత బలంగా అర్థం చేసుకోవడానికి ఈ క్రింది వ్యాయామాలు చేయవచ్చు:

* SF Symbols icon name ను మార్చండి
* icon యొక్క foreground color ను black గా మార్చండి
* VStack ను HStack గా మార్చండి
* Image లేదా Text ను comment చేసి, preview లో వచ్చే మార్పును గమనించండి

### చిన్న అదనం: కోడ్ పూర్తి చేయడం (Code Completion)

కోడ్ టైప్ చేస్తున్నప్పుడు, మీరు గమనించి ఉండవచ్చు — Xcode స్వయంచాలకంగా ఉపయోగించగల ఎంపికల జాబితాను చూపిస్తుంది.

ఉదాహరణకు, imageScale modifier ను మార్చేటప్పుడు:

```swift
.imageScale(.)
```

Xcode అందుబాటులో ఉన్న options ను చూపిస్తుంది:

![Swift](../../RESOURCE/002_view10.png)

ఇది code completion mechanism కు చెందినది. ఇది type inference మరియు enum member suggestions ఆధారంగా పనిచేస్తుంది; దాంతో టైపింగ్ వేగం పెరుగుతుంది, అలాగే పొరపాట్లు తగ్గుతాయి.

తరువాతి పాఠాల్లో మనం enum గురించి అధికారికంగా నేర్చుకుంటాము. ప్రస్తుతం దీన్ని కేవలం ఒక సాధారణ పరిచయంగా మాత్రమే గుర్తుంచుకుంటే సరిపోతుంది.
