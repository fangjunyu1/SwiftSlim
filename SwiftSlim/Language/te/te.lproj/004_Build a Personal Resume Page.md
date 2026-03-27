# వ్యక్తిగత రిజ్యూమే పేజీ నిర్మించడం

ఈ పాఠంలో మనం ఒక సరళమైన వ్యక్తిగత రిజ్యూమే view ను తయారు చేస్తాము. అలాగే ఈ కింది జ్ఞాన బిందువులను నేర్చుకుంటాము:

* cornerRadius
* spacing
* ScrollView

నిర్మాణ ప్రక్రియలో, layout, Text, Image వంటి ముందుగా నేర్చుకున్న విషయాలను మళ్లీ అభ్యసిస్తాము. అలాగే spacing నియంత్రణ మరియు content scrolling ప్రభావాన్ని అమలు చేస్తాము.

## వ్యక్తిగత రిజ్యూమే

లక్ష్య ఫలితం:

![Swift](../../RESOURCE/004_img.png)

**దయచేసి ముందుగా స్వయంగా పూర్తి చేయడానికి ప్రయత్నించండి. తరువాత మాత్రమే కింది వివరణను చదవండి.**

### ప్రాజెక్ట్ సృష్టించడం

కొత్త iOS ప్రాజెక్ట్ సృష్టించండి, లేదా ముందు సృష్టించిన ప్రాజెక్ట్‌ను కొనసాగించండి.

డిఫాల్ట్ ContentView కోడ్:

```swift
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
```

ఇప్పుడు ఈ కోడ్‌ను తొలగించి, మన సొంత కంటెంట్‌ను రాయడం ప్రారంభిద్దాం:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### మొత్తం నిర్మాణం

వాస్తవ అభివృద్ధిలో, మనం సాధారణంగా ముందుగా మొత్తం నిర్మాణాన్ని ఆలోచిస్తాము.

మన పేజీలో ఇవి ఉంటాయి:

1. శీర్షిక
2. వ్యక్తిగత సమాచారం
3. వ్యక్తిగత పరిచయం

మనం బయట భాగంలో ఒక VStack జోడిస్తాము:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack వల్ల views నిలువు దిశలో అమర్చబడతాయి. అలాగే view ల అమరిక మరియు వాటి మధ్య దూరాన్ని నియంత్రించవచ్చు.

### శీర్షిక

మొదటగా, శీర్షికను చూపించడానికి ఒక Text సృష్టిద్దాం.

ఇక్కడ, నేను శీర్షికగా నా ఇంగ్లీష్ పేరును చూపిస్తున్నాను:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

శీర్షికను సాధారణంగా పెద్దగా, bold గా చూపిస్తారు. అందుకే ఇక్కడ font మరియు fontWeight modifiers ఉపయోగిస్తాము:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### అమరిక

SwiftUI లో డిఫాల్ట్ alignment center అవుతుంది. కాబట్టి ఇప్పుడు శీర్షిక ContentView మధ్యలో కనిపిస్తోంది.

![Swift](../../RESOURCE/004_img3.png)

మనకు శీర్షికను view పైభాగంలో చూపించాలి. దీని కోసం Spacer ఉపయోగించి layout ను మార్చవచ్చు:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer మిగిలిన ఖాళీని ఆక్రమిస్తుంది. దాంతో Text container పైభాగానికి నెట్టబడుతుంది.

![Swift](../../RESOURCE/004_img4.png)

### ఖాళీ స్థలం

Text view పైభాగానికి చాలా దగ్గరగా ఉందని అనిపిస్తే, padding లేదా Spacer ఉపయోగించవచ్చు.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

ఇది VStack కు పైభాగంలో 20 padding ఇస్తుంది.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer ను కూడా ఉపయోగించవచ్చు. దానికి frame height ఇవ్వడం ద్వారా నిర్దిష్ట ఎత్తులో ఖాళీని పొందవచ్చు.

ఫలితం:

![Swift](../../RESOURCE/004_img5.png)

### చిత్రం

ఇప్పుడు మనం ఒక portrait photo సిద్ధం చేసి, దాన్ని Assets resource folder లో ఉంచుతాము.

![Swift](../../RESOURCE/004_img6.png)

తర్వాత ContentView లో Image ద్వారా ఆ చిత్రాన్ని చూపిస్తాము:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

చిత్రం అసలు పరిమాణం పెద్దగా ఉన్నందున, దాని కనిపించే పరిమాణాన్ని frame తో నియంత్రించాలి.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

ఈ సమయంలో మనం ఒక సమస్యను గమనిస్తాము:

frame యొక్క width-height ratio, చిత్రం అసలు ratio తో సరిపోకపోతే, చిత్రం వక్రీకృతమవుతుంది.

ఉదాహరణకు:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

చిత్రం వక్రీకరణ రాకుండా ఉండడానికి, మనం scaledToFit ఉపయోగించాలి:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

scaledToFit యొక్క పని:

ఇచ్చిన frame పరిధిలో, చిత్రం అసలు ratio ను అలాగే ఉంచి scale చేయడం, అలాగే పూర్తి చిత్రాన్ని చూపించడం.

ఇది బలవంతంగా frame మొత్తాన్ని నింపడానికి చిత్రాన్ని లాగదు. బదులుగా, width మరియు height ratio అలాగే ఉంచి, ఏదో ఒక వైపు boundary కు సరిపడే వరకు proportional గా scale చేస్తుంది.

దీని అర్థం:

* frame width చిన్నగా ఉంటే, చిత్రం width ను ఆధారంగా చేసుకుని scale అవుతుంది.
* frame height చిన్నగా ఉంటే, చిత్రం height ను ఆధారంగా చేసుకుని scale అవుతుంది.
* చిత్రం ఎల్లప్పుడూ అసలు ratio ను అలాగే ఉంచుతుంది, వక్రీకరణ రాదు.

సాధారణంగా, ఒకే దిశలో పరిమాణాన్ని సెట్ చేస్తే సరిపోతుంది. ఉదాహరణకు:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

ఇలా చేస్తే, system width 140 ఆధారంగా సరైన height ను ఆటోమేటిక్‌గా లెక్కిస్తుంది, అలాగే చిత్రం ratio ను అలాగే ఉంచుతుంది.

ఒకవేళ మనకు నిర్దిష్ట visual ratio కావాలి లేదా క్లిష్టమైన layout లో చిత్రం squeeze కాకూడదనుకుంటే, width మరియు height రెండింటినీ పరిమితం చేయవచ్చు.

### గుండ్రని మూలలు

చిత్రాన్ని rounded corners తో చూపించాలనుకుంటే, cornerRadius modifier ఉపయోగించవచ్చు:

```swift
.cornerRadius(10)
```

ఉదాహరణకు:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image modifiers తర్వాత cornerRadius(20) ను జోడించండి.

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) అంటే, view boundary ను clip చేసి, 20 radius గల rounded corners ను అమలు చేయడం.

Rounded corners జోడించిన తర్వాత, చిత్రంలోని నాలుగు మూలలు గుండ్రంగా మారుతాయి. దాంతో visual effect మరింత మృదువుగా, ఆధునికంగా కనిపిస్తుంది.

ప్రస్తుత interface design లో ఈ శైలి చాలా సాధారణంగా కనిపిస్తుంది. ఉదాహరణకు iOS app icons rounded rectangle ఆకారాన్ని ఉపయోగిస్తాయి. అయితే system icons లో simple corner radius కాకుండా continuous curvature గల superellipse రూపం ఉంటుంది.

### వ్యక్తిగత సమాచారం

ఇప్పుడు చిత్రం ఎడమవైపు వ్యక్తిగత సమాచారం ప్రాంతాన్ని రూపొందిద్దాం. Interface నిర్మాణాన్ని గమనిస్తే, వ్యక్తిగత సమాచారం మరియు చిత్రం అడ్డంగా అమర్చబడ్డాయి. కాబట్టి HStack ఉపయోగించాలి.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

వ్యక్తిగత సమాచారం లోపలి కంటెంట్ మాత్రం నిలువు దిశలో అమర్చబడింది.

![Swift](../../RESOURCE/004_img11.png)

అందువల్ల, బయట HStack ఉపయోగిస్తాము, వ్యక్తిగత సమాచారం కోసం VStack ఉపయోగిస్తాము, మరియు text కోసం Text ఉపయోగిస్తాము.

ప్రాథమిక నిర్మాణం:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Field titles ను bold చేయడం**

Field name మరియు field value మధ్య తేడా కనిపించడానికి, field name కు fontWeight ఉపయోగించవచ్చు:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Text ను ఎడమవైపు align చేయడం**

VStack డిఫాల్ట్‌గా center alignment తో ఉంటుంది. అన్ని text లను ఎడమవైపు align చేయాలనుకుంటే, alignment ను సెట్ చేయాలి:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading అంటే ఎడమవైపు alignment అని అర్థం. ఇది left-to-right భాషా వాతావరణంలో వర్తిస్తుంది.

![Swift](../../RESOURCE/004_img14.png)

### దూరం

వ్యక్తిగత సమాచారం మరియు చిత్రం మధ్య ఒక స్థిర దూరం ఉంచాలనుకుంటే, ముందు నేర్చుకున్న విధంగా Spacer ఉపయోగించవచ్చు:

```swift
Spacer()
    .frame(width: 10)
```

లేదా HStack యొక్క spacing parameter ను ఉపయోగించవచ్చు:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 అంటే, రెండు child views మధ్య దూరం 30 pt అని అర్థం.

![Swift](../../RESOURCE/004_img15.png)

**spacing అంటే ఏమిటి?**

VStack, HStack, ZStack లో spacing అనేది child views మధ్య దూరాన్ని నియంత్రిస్తుంది.

ఉదాహరణకు:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

ఈ VStack లోని child views మధ్య దూరం 10pt గా ఉంటుంది.

![Swift](../../RESOURCE/004_img16.png)

గమనించాల్సిన విషయం ఏమిటంటే, spacing కేవలం “direct child views” పైనే పనిచేస్తుంది. Nested container లోపలి layout పై ఇది ప్రభావం చూపదు.

**జాబితా లోపలి spacing ను నియంత్రించడం**

Field ల మధ్య దూరం పెంచాలనుకుంటే, సులభమైన మార్గం VStack కు spacing ఇవ్వడం:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

ఇలా చేస్తే, అన్ని child views మధ్య దూరం 10 pt అవుతుంది.

కానీ interface ను గమనిస్తే ఒక సమస్య కనిపిస్తుంది:

Field groups మధ్య spacing ఉంటుంది. అదే సమయంలో field name మరియు field value మధ్య కూడా అదే spacing కనిపిస్తుంది.

ఇది spacing ప్రస్తుత container లోని అన్ని direct child views పైన పనిచేయడం వల్ల జరుగుతుంది.

ఈ నిర్మాణంలో, ప్రతి Text కూడా outer VStack యొక్క direct child view. అందుకే spacing ఒకేలా ఉంటుంది.

ఒకవేళ field groups మధ్య spacing ఉండాలి కానీ field name మరియు value మధ్య డిఫాల్ట్ compact spacing ఉండాలి అనుకుంటే, “field name + field value” ను ఒక logical unit గా తీసుకుని, వాటిని బయట నుంచి మరో VStack లో చుట్టాలి:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

ఇప్పుడు నిర్మాణం ఇలా మారుతుంది: outer VStack ల మధ్య spacing ఉంటుంది, inner VStack లలో డిఫాల్ట్ compact spacing ఉంటుంది. అందువల్ల field name మరియు value మధ్య అదనపు ఖాళీ కనిపించదు.

![Swift](../../RESOURCE/004_img18.png)

### వ్యక్తిగత పరిచయం

ఇప్పుడు వ్యక్తిగత పరిచయం భాగాన్ని తయారు చేద్దాం.

Interface నిర్మాణాన్ని చూస్తే, ఈ పరిచయం భాగం అనేక lines గల text తో ఉంటుంది. ఆ text నిలువు దిశలో అమర్చబడి ఉంటుంది.

![Swift](../../RESOURCE/004_img19.png)

అందువల్ల, VStack మరియు Text ను కలిపి ఉపయోగించవచ్చు:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**దూరాన్ని పెంచడం**

ఇప్పుడున్న వ్యక్తిగత సమాచారం మరియు పరిచయం భాగాలు చాలా దగ్గరగా కనిపిస్తున్నాయి. అందువల్ల visual style అంత అందంగా లేదు.

![Swift](../../RESOURCE/004_img20.png)

అవి రెండూ ఒకే outer container లో ఉన్నందున, మొత్తం spacing ను outer container పైనే నియంత్రించవచ్చు:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

ఫలితం:

![Swift](../../RESOURCE/004_img21.png)

**జాబితా spacing**

వ్యక్తిగత పరిచయం text ల మధ్య spacing ఇవ్వడానికి:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### వ్యక్తిగత రిజ్యూమే పూర్తి చేయడం

ఇప్పుడు, మన వ్యక్తిగత రిజ్యూమే యొక్క ప్రాథమిక నిర్మాణం పూర్తయింది.

![Swift](../../RESOURCE/004_img.png)

### ScrollView

ఇప్పుడున్న పేజీ నిర్మాణం VStack ను ఉపయోగిస్తోంది. పరిచయ text తక్కువగా ఉన్నప్పుడు ఇది బాగానే పనిచేస్తుంది. కానీ text లను 20, 30 లేదా అంతకంటే ఎక్కువ చేస్తే, content height screen ను దాటి బయటకు వెళ్తుంది.

ఉదాహరణకు:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

ఈ సమయంలో రెండు విషయాలు కనిపిస్తాయి:

* కింది content కత్తిరించబడుతుంది
* పేజీ scroll కాదు

ఇది VStack లోపం కాదు. VStack కేవలం ఒక layout container మాత్రమే. ఇది స్వయంచాలకంగా scrolling సామర్థ్యం ఇవ్వదు.

**ScrollView అంటే ఏమిటి**

ScrollView అనేది scroll చేయగల container. ఇది screen పరిమాణాన్ని మించే పెద్ద content కు సరిపోతుంది. ఉదాహరణకు vertical లేదా horizontal lists.

ప్రాథమిక నిర్మాణం:

```swift
ScrollView {
    ...
}
```

Scroll effect కావాలంటే, మొత్తం page content ను ScrollView లో చుట్టాలి:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

ఇలా చేస్తే, మొత్తం పేజీ ఒక scrollable area అవుతుంది. Content screen height ను మించి ఉన్నప్పుడు, సహజంగా scroll చేయవచ్చు.

ScrollView డిఫాల్ట్‌గా scroll indicator ను చూపిస్తుంది. ఒకవేళ scroll bar ను దాచాలనుకుంటే, ఇలా సెట్ చేయవచ్చు:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## పూర్తి కోడ్

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
