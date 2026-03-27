# లేఅవుట్, చిత్రాలు మరియు పాఠ్యం

గత పాఠంలో, మనం ContentView కోడ్‌ను నేర్చుకున్నాము:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ఈ పాఠంలో, మనం SwiftUI యొక్క డిఫాల్ట్ లేఅవుట్ విధానం, అలాగే చిత్రాలు మరియు పాఠ్యాన్ని ఎలా ఉపయోగించాలో నేర్చుకుంటాము. గత పాఠం ఆధారంగా, view నిర్మాణం మరియు display విధానాన్ని మరింత లోతుగా అర్థం చేసుకుంటాము. ఈ జ్ఞానం ప్రాథమిక interface layouts నిర్మించడానికి ఉపయోగపడుతుంది.

## SwiftUI యొక్క డిఫాల్ట్ లేఅవుట్ విధానం

ContentView ను preview చేసినప్పుడు, icon మరియు text పై భాగం నుంచి కాకుండా మధ్యలో కనిపిస్తున్నాయని మనం గమనిస్తాము.

![Swift](../../RESOURCE/003_view.png)

డిఫాల్ట్‌గా, Stack container యొక్క alignment .center గా ఉంటుంది. అందువల్ల child views సాధారణంగా మధ్యలో అమర్చబడినట్లుగా కనిపిస్తాయి.

### Alignment అమరిక విధానం

స్పష్టంగా, center alignment అనేది alignment రకాలలో ఒక్కటే. మనకు left alignment లేదా right alignment కావాలంటే, alignment ద్వారా view అమరికను నియంత్రించాలి.

```swift
alignment
```

SwiftUI లో alignment సాధారణంగా రెండు సందర్భాల్లో కనిపిస్తుంది:

**1. Stack container యొక్క alignment parameter**

ఉదాహరణకు, ContentView లోని icon మరియు text ను ఎడమవైపు align చేయడం:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

VStack లో alignment అనేది horizontal direction లో అమరికను నియంత్రిస్తుంది.

alignment విధానాలు:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack అనేది horizontal arrangement. అందులో alignment అనేది vertical direction లో అమరికను నియంత్రిస్తుంది:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack అనేది overlap arrangement. ఇందులో alignment ద్వారా horizontal లేదా vertical direction అమరికను నియంత్రించవచ్చు:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

alignment ను స్పష్టంగా ఇవ్వకపోతే, VStack, HStack మరియు ZStack మూడింటి డిఫాల్ట్ విలువు .center అవుతుంది.

**2. frame లోపలి alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

frame ఇచ్చే పరిమాణం view యొక్క అసలు పరిమాణం కంటే పెద్దదిగా ఉన్నప్పుడు, ఆ frame లోపల view ఎక్కడ ఉంచబడాలో alignment నిర్ణయిస్తుంది. frame యొక్క పూర్తి ఉపయోగాన్ని తరువాతి పాఠాల్లో మరింత వివరంగా చూస్తాము. ఇక్కడ ఇది కేవలం ఒక ప్రారంభ అవగాహన మాత్రమే.

### Spacer మరియు space distribution విధానం

alignment ద్వారా views ను horizontal లేదా vertical దిశలో అమర్చవచ్చు. కానీ, మనం text మరియు image ను రెండు చివరల్లో చూపించాలనుకుంటే, ఒక్క alignment మాత్రమే సరిపోదు.

ఉదాహరణకు, [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) వెబ్‌సైట్ యొక్క top view ను నిర్మించాలనుకుందాం. ఎడమవైపు NHK website icon, కుడివైపు menu icon ఉండాలి.

![Swift](../../RESOURCE/003_alignment3.png)

మనము alignment మాత్రమే ఉపయోగిస్తే, NHK website icon మరియు menu icon రెండూ ఒకే వైపున కనిపిస్తాయి. అవి ఎడమ, కుడి వైపులా విడిగా పంపిణీ కావు. అందువల్ల మిగిలిన స్థలాన్ని పంచడానికి Spacer అవసరం.

Spacer అనేది layout కోసం ఉపయోగించే ఒక flexible view. ఇది మిగిలిన ఖాళీని స్వయంచాలకంగా నింపుతుంది.

వాడే విధానం:

```swift
Spacer()
```

ఉదాహరణకు:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Image మరియు Text మధ్య Spacer చేర్చినప్పుడు, Spacer మిగిలిన స్థలాన్ని నింపుతుంది. దాంతో Image మరియు Text వరుసగా పై, కింది చివరలకు నెట్టబడతాయి.

![Swift](../../RESOURCE/003_view1.png)

ఒకవేళ అనేక Spacer లు ఉంటే:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

మిగిలిన ఖాళీ స్థలం అన్ని Spacer ల మధ్య సమంగా పంచబడుతుంది.

![Swift](../../RESOURCE/003_spacer.png)

## Image యొక్క ప్రదర్శన మరియు పరిమాణ నియంత్రణ

Image view ప్రధానంగా చిత్రాలను చూపించడానికి ఉపయోగించబడుతుంది. గత పాఠంలో నేర్చుకున్న SF Symbols icon కూడా Image యొక్క ఒక వాడుక మాత్రమే.

వాడే విధానం:

```swift
Image("imageName")
```

Image లోని double quotes లో చిత్రం పేరు వ్రాయాలి. ఫైల్ extension వ్రాయాల్సిన అవసరం లేదు.

### చిత్రాన్ని చూపించడం

మొదట, మనం ఒక చిత్రాన్ని సిద్ధం చేద్దాం.

![Swift](../../RESOURCE/003_img.jpg)

Xcode లో Assets resource folder ను ఎంచుకుని, ఆ చిత్రాన్ని Assets లోకి drag చేయండి.

![Swift](../../RESOURCE/003_img1.png)

తర్వాత ContentView లో, Image ఉపయోగించి చిత్రాన్ని చూపించండి:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

గమనిక: SwiftUI లోని Image GIF animation ను ప్లే చేయదు. అది కేవలం static frame ను మాత్రమే చూపిస్తుంది.

### చిత్రం పరిమాణాన్ని నియంత్రించడం

SwiftUI లో, Image డిఫాల్ట్‌గా అసలు చిత్రం పరిమాణంలోనే కనిపిస్తుంది. చిత్రం పరిమాణాన్ని మార్చాలంటే, ముందుగా resizable ద్వారా చిత్రం scale అవడానికి అనుమతించాలి. తరువాత frame ఉపయోగించి layout size ను నిర్దేశించాలి.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier

resizable modifier చిత్రం layout లో scale కావడానికి అనుమతిస్తుంది. లేకపోతే అది అసలు పరిమాణంలోనే స్థిరంగా ఉంటుంది.

```swift
.resizable()
```

resizable() చేర్చినప్పుడే frame చిత్రం కనిపించే పరిమాణాన్ని నిజంగా మార్చగలదు.

resizable ను వదిలేస్తే:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

అప్పుడు frame కేవలం layout space ను మాత్రమే ఇస్తుంది. కానీ చిత్రం పరిమాణం తానే మారదు.

### frame modifier

frame(width:height) అనేది view యొక్క వెడల్పు మరియు ఎత్తును నిర్దేశించడానికి ఉపయోగిస్తారు.

ప్రాథమిక వాడుక:

```swift
.frame(width: 10,height: 10)
```

ఉదాహరణకు, ఒక చిత్రాన్ని width 300, height 100 గల rectangle గా మార్చడం:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

వెడల్పు లేదా ఎత్తును విడిగా కూడా సెట్ చేయవచ్చు:

```swift
.frame(width: 200)
.frame(height: 100)
```

resizable + frame కలయిక ద్వారా, interface లో చిత్రం ఎలా కనిపించాలో చాలా సౌకర్యంగా నియంత్రించవచ్చు, అలాగే అది scale అయ్యే సామర్థ్యాన్ని కూడా ఉంచుతుంది.

### scale ratio: scaledToFit మరియు scaledToFill

frame ద్వారా ఇచ్చే width, height నిష్పత్తి చిత్రం అసలు ratio కు సరిపోకపోతే, చిత్రం stretch అయి వక్రీకరించబడవచ్చు.

చిత్రం ratio అలాగే ఉంచి, అందుబాటులో ఉన్న layout space లో సరిపోయేలా చేయాలనుకుంటే, scaledToFit లేదా scaledToFill ను ఉపయోగించవచ్చు.

**scaledToFit**

scaledToFit చిత్రం యొక్క అసలు width-height ratio ను అలాగే ఉంచుతుంది. అది అందుబాటులో ఉన్న స్థలానికి పూర్తిగా సరిపోయేలా scale అవుతుంది, కానీ చిత్రం crop కాదు:

```swift
.scaledToFit()
```

లేదా

```swift
.aspectRatio(contentMode: .fit)
```

చిత్రం పూర్తిగా కనిపించాలి, వక్రీకరణ రాకూడదు అనుకునే సందర్భాలకు ఇది అనుకూలంగా ఉంటుంది.

అన్ని చిత్రాలకు ఒకే width, height ఇస్తే, stretch అయ్యే సమస్యలు రావడం సహజం.

ఉదాహరణకు:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

scale ratio సెట్ చేయకపోతే, చిత్రం తన అసలు ratio లో కనిపించదు.

![Swift](../../RESOURCE/003_img4.png)

scaledToFit సెట్ చేస్తే, చిత్రం అసలు ratio ను అలాగే ఉంచుతుంది.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill కూడా చిత్రం ratio ను అలాగే ఉంచుతుంది. కానీ అది అందుబాటులో ఉన్న మొత్తం స్థలాన్ని నింపుతుంది. ratio సరిపోకపోతే, ఎక్కువైన భాగం crop అవుతుంది:

```swift
.scaledToFill()
```

లేదా

```swift
.aspectRatio(contentMode: .fill)
```

ఈ విధానం చిత్రం మొత్తం ప్రాంతాన్ని cover చేయాల్సిన సందర్భాలకు సరిపోతుంది. ఉదాహరణకు background image లేదా banner చిత్రం. ముఖ్యంగా background గా ఉపయోగించే సందర్భాల్లో ఇది అనుకూలం.

**ఇవి రెండింటి మధ్య తేడా**

![Swift](../../RESOURCE/003_img6.png)

## పాఠ్యం

SwiftUI లో, Text అనేది పాఠ్యాన్ని చూపించడానికి ఉపయోగిస్తారు.

ప్రాథమిక వాడుక:

```swift
Text("FangJunyu")
```

గత పాఠంలో మనం Text ను నేర్చుకున్నాము. ఈ పాఠంలో, ఫాంట్ పరిమాణం మరియు దాని మందాన్ని ఎలా నియంత్రించాలో తెలుసుకుంటాము. దాంతో పాఠ్యం view లో మరింత స్పష్టంగా మరియు ఆకర్షణీయంగా కనిపిస్తుంది.

### ఫాంట్ పరిమాణం

font modifier ద్వారా పాఠ్య పరిమాణాన్ని నియంత్రించవచ్చు:

```swift
.font(.title)
```

ఉదాహరణకు:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

సాధారణంగా ఉపయోగించే font sizes (పెద్దది నుంచి చిన్నదికి):

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### ఫాంట్ మందం

పాఠ్యాన్ని bold చేయాలనుకుంటే, fontWeight modifier ఉపయోగించవచ్చు:

```swift
.fontWeight(.bold)
```

ఉదాహరణకు:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

సాధారణంగా ఉపయోగించే font weights (సన్నగా ఉన్నది నుంచి మందంగా ఉన్నదికి):

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font అనేది ఫాంట్ పరిమాణాన్ని నియంత్రిస్తుంది. fontWeight అనేది దాని మందాన్ని నియంత్రిస్తుంది. ఈ రెండింటిని కలిపి ఉపయోగిస్తే, పాఠ్య ప్రదర్శన మరింత బలంగా ఉంటుంది.

## సారాంశం మరియు అభ్యాసం

ఇప్పటివరకు మనం SwiftUI యొక్క డిఫాల్ట్ లేఅవుట్, Spacer, Image మరియు Text వంటి ప్రాథమిక విషయాలను నేర్చుకున్నాము. ఈ జ్ఞానం ఇప్పుడు కొన్ని సరళమైన views తయారు చేయడానికి సరిపోతుంది.

ఉదాహరణకు: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google interface చాలా శుభ్రంగా ఉంటుంది. ఇందులో చిత్రం మరియు పాఠ్యం రెండూ ఉంటాయి. SwiftUI దృష్టిలో Google interface నిర్మాణాన్ని ఇలా విశ్లేషించవచ్చు:

1. మొత్తం layout మూడు భాగాలుగా ఉంటుంది: Google logo, search box, prompt text. ఇవి VStack ద్వారా vertically అమర్చవచ్చు.
2. Google logo ఒక చిత్రం. దాన్ని Image ద్వారా చూపించవచ్చు.
3. Search box లో input field మరియు icon ఉంటాయి. ఇక్కడ input field ను పక్కన పెట్టి ఆలోచిస్తే, search icon ను Image ద్వారా చూపించవచ్చు.
4. Prompt text ను Text ద్వారా చూపించవచ్చు. text యొక్క horizontal arrangement ను HStack తో చేయవచ్చు. font color ను foregroundStyle ద్వారా నియంత్రించవచ్చు.

ఈ జ్ఞానాన్ని అభ్యాసం చేస్తూ, మనం కొన్ని సరళమైన views తయారు చేయవచ్చు. దాంతో Image మరియు Text views, అలాగే వాటి modifiers పై అవగాహన మరియు వాడుక రెండూ మరింత బలపడతాయి.
