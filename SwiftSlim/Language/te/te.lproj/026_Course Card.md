# కోర్సు కార్డ్

ఈ పాఠం ఒక దశల వారీ పునశ్చరణ పాఠం. మనం ఒక “కోర్సు కార్డ్” పూర్తి చేస్తాము.

ఈ అభ్యాసం ద్వారా, ముందు నేర్చుకున్న `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` వంటి విషయాలను పునశ్చరణ చేయవచ్చు. అలాగే అనేక చిన్న views ను కలిపి ఒక పూర్తి view module గా ఎలా తయారు చేయాలో నేర్చుకుంటాము.

కోర్సు కార్డ్ ప్రభావం:

![view](../../../Resource/026_view.png)

ఈ కోర్సు కార్డ్ ప్రధానంగా కొన్ని భాగాలను కలిగి ఉంటుంది:

- కోర్సు స్థాయి: `Beginner`
- కోర్సు కంటెంట్: `20+ Lessons`
- కోర్సు శీర్షిక: `SwiftUI Beginner Tutorial`
- కోర్సు వివరణ
- బటన్: `Start Learning`
- కోర్సు నేపథ్యం: Swift చిహ్నం మరియు ఇండిగో రంగు నేపథ్యం

ఈ view ను `ContentView` లో పూర్తి చేయవచ్చు.

## పైభాగం

మొదట, కోర్సు కార్డ్ యొక్క పైభాగాన్ని తయారు చేద్దాం.

![view](../../../Resource/026_view1.png)

పైభాగం ఎడమ వైపున కోర్సు స్థాయి కనిపిస్తుంది, కుడి వైపున కోర్సు కంటెంట్ కనిపిస్తుంది.

ఈ రెండు కంటెంట్ భాగాలు అడ్డంగా అమరినందున, `HStack` ను ఉపయోగించవచ్చు.

```swift
var topView: some View {
    HStack {
        Text("ప్రారంభ స్థాయి")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ పాఠాలు")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

ఇక్కడ, పైభాగాన్ని ఒక computed property గా విడదీశాము:

```swift
var topView: some View
```

ఇలా చేయడం వల్ల `body` మరింత స్పష్టంగా ఉంటుంది.

పైభాగంలో ప్రధానంగా ఈ కంటెంట్ ఉపయోగించబడింది:

- `HStack`: రెండు text views ను అడ్డంగా అమరుస్తుంది.
- `Text`: వచన కంటెంట్ ను చూపిస్తుంది.
- `Spacer()`: ఎడమవైపు text ను ఎడమకు, కుడివైపు text ను కుడికి నెడుతుంది.
- `.font(.footnote)`: చిన్న text style ను సెట్ చేస్తుంది.
- `.fontWeight(.bold)`: text ను bold గా చేస్తుంది.
- `.foregroundStyle(Color.white)`: foreground రంగును తెలుపుగా సెట్ చేస్తుంది.
- `.padding(.vertical, 10)`: పైకీ కిందకీ padding ను సెట్ చేస్తుంది.
- `.padding(.horizontal, 16)`: ఎడమకీ కుడికీ padding ను సెట్ చేస్తుంది.
- `.background(Color.white.opacity(0.15))`: అర్థపారదర్శక తెలుపు నేపథ్యాన్ని సెట్ చేస్తుంది.
- `.cornerRadius(20)`: corner radius ను సెట్ చేస్తుంది.

ఇక్కడ `Beginner` రెండు దిశల్లో `.padding()` ను ఉపయోగిస్తుంది:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

దీంతో text కు పైకీ కిందకీ, ఎడమకీ కుడికీ ఖాళీ వస్తుంది. అది ఒక tag లా కనిపిస్తుంది.

`Color.white.opacity(0.15)` అనేది `15%` opacity గల తెలుపును సూచిస్తుంది. అంటే చాలా పలుచని తెలుపు రంగు.

### కార్డ్ నేపథ్యాన్ని జోడించడం

ముందు మనం `topView` ను సృష్టించాము, కానీ view ను సృష్టించడం మాత్రమే దాన్ని స్వయంగా చూపించదు.

SwiftUI లో, స్క్రీన్ పై నిజంగా కనిపించాల్సిన కంటెంట్ ను `body` లో రాయాలి.

అందువల్ల, ముందు `topView` ను `body` లో ఉంచి చూపించవచ్చు:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

ఈ సమయంలో, పైభాగం ఇప్పటికే కనిపిస్తుంది:

![view](../../../Resource/026_view2.png)

కానీ `topView` లోని text తెలుపుగా ఉంటుంది, default background కూడా లేత రంగులో ఉంటుంది. కాబట్టి light mode లో అది స్పష్టంగా కనిపించకపోవచ్చు.

అందువల్ల, బయట ఒక `VStack` జోడించి, మొత్తం ప్రాంతానికి padding, background color మరియు corner radius సెట్ చేయవచ్చు:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

చూపించే ప్రభావం:

![view](../../../Resource/026_view3.png)

ఇక్కడి `VStack` లో ప్రస్తుతం ఒక `topView` మాత్రమే ఉంది. కాబట్టి అది అవసరం లేనట్టుగా అనిపించవచ్చు.

కానీ తరువాత మనం course title, course description, button area ను కొనసాగించి జోడిస్తాము. ఇవన్నీ నిలువుగా అమరే కంటెంట్. కాబట్టి ముందుగానే `VStack` ఉపయోగించడం, తరువాత views ను కొనసాగించి కలపడానికి సౌకర్యంగా ఉంటుంది.

ఇక్కడ రెండు `.padding()` modifiers ఉన్నాయి. వాటి పనులు వేర్వేరు.

మొదటి `.padding(20)` ను `.background()` ముందు రాశాము:

```swift
.padding(20)
.background(Color.indigo)
```

ఇది card యొక్క inner padding ను నియంత్రిస్తుంది. అంటే content మరియు background అంచు మధ్య దూరం.

రెండవ `.padding(30)` ను `.background()` తరువాత రాశాము:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

ఇది card యొక్క outer padding ను నియంత్రిస్తుంది. అంటే మొత్తం card మరియు screen అంచు మధ్య దూరం.

![view](../../../Resource/026_view4.png)

అందువల్ల, రెండూ `.padding()` అయినప్పటికీ, వేర్వేరు స్థానాల్లో ఉంచితే వేర్వేరు ప్రభావాలు వస్తాయి.

## కంటెంట్ ప్రాంతం

తర్వాత, కోర్సు కార్డ్ యొక్క కంటెంట్ ప్రాంతాన్ని తయారు చేద్దాం.

చూపించే ప్రభావం:

![view](../../../Resource/026_view5.png)

కంటెంట్ ప్రాంతంలో course title మరియు course description ఉంటాయి. అవి నిలువుగా అమరుతాయి, కాబట్టి `VStack` ఉపయోగిస్తాము.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI ప్రారంభికుల ట్యుటోరియల్")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("SwiftUI తో శూన్యం నుంచి ప్రారంభించి, Apple యొక్క declarative UI development ను క్రమంగా నేర్చుకోండి. స్పష్టమైన వివరణలు మరియు ప్రాక్టికల్ ఉదాహరణల ద్వారా, layout, interaction, state management ను క్రమంగా అలవాటు చేసుకుని, అందమైన మరియు ఉపయోగకరమైన app interfaces నిర్మించడం నేర్చుకుంటారు.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

చూపించే ప్రభావం:

![view](../../../Resource/026_view6.png)

ఈ `VStack` లో రెండు parameters ఉపయోగించబడ్డాయి:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` అంటే `VStack` లోని views leading edge కు align అవుతాయి.

`spacing: 10` అంటే `VStack` లోని views మధ్య `10 pt` అంతరం ఉంటుంది.

అందువల్ల, course title మరియు course description ఎడమ వైపు నుంచి ప్రారంభమై, వాటి మధ్య కొంత దూరం ఉంటుంది.

Course description కొంచెం పొడవుగా ఉంటుంది. మొత్తం చూపిస్తే card చాలా ఎత్తుగా మారుతుంది. కాబట్టి ఇక్కడ `.lineLimit()` ఉపయోగించి చూపించే lines సంఖ్యను పరిమితం చేస్తున్నాము:

```swift
.lineLimit(3)
```

దీని అర్థం గరిష్ఠంగా `3` lines మాత్రమే చూపిస్తుంది. content line limit ను మించినప్పుడు, మిగిలిన భాగం వదిలివేయబడుతుంది.

### View ను ఎడమకు align చేయడం

ఇక్కడ ఇంకా ఒక విషయం గమనించాలి.

`VStack(alignment: .leading)` అనేది `VStack` లోపలి views యొక్క alignment ను మాత్రమే నియంత్రిస్తుంది. అది external container లో `VStack` స్వంత స్థానాన్ని నేరుగా నియంత్రించదు.

ఉదాహరణకు, course description కొంచెం చిన్నగా ఉంటే:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI ప్రారంభికుల ట్యుటోరియల్")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("కొంత కంటెంట్ మాత్రమే.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

చూపించే ప్రభావం:

![view](../../../Resource/026_view7.png)

చూడగలిగినట్లుగా, course title మరియు course description `VStack` లోపల ఎడమకు align అయినప్పటికీ, మొత్తం `VStack` card యొక్క అత్యంత ఎడమ అంచుకు చేరలేదు.

దీనికి కారణం, content చిన్నగా ఉన్నప్పుడు `VStack` width కూడా తక్కువగా మారుతుంది. బయట container layout చేసినప్పుడు, ఈ narrow `VStack` ను మధ్యలో ఉంచవచ్చు.

ఇలా అర్థం చేసుకోవచ్చు: `VStack(alignment: .leading)` internal left alignment కు బాధ్యత వహిస్తుంది.
కానీ మొత్తం content area ను అత్యంత ఎడమకు నెట్టడానికి అది బాధ్యత వహించదు.

మొత్తం content area నిజంగా ఎడమకు align కావాలని అనుకుంటే, దాని బయట మరో `HStack` చుట్టి, `Spacer()` జోడించవచ్చు:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI ప్రారంభికుల ట్యుటోరియల్")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("కొంత కంటెంట్ మాత్రమే.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

చూపించే ప్రభావం:

![view](../../../Resource/026_view8.png)

ఇక్కడి `HStack` ఒక horizontal layout.

`Spacer()` కుడివైపు మిగిలిన స్థలాన్ని ఆక్రమిస్తుంది. దీని వల్ల ఎడమ వైపున ఉన్న `VStack` అత్యంత ఎడమకు నెట్టబడుతుంది.

అందువల్ల, `HStack + Spacer()` ను మొత్తం content area యొక్క స్థానాన్ని నియంత్రించడానికి ఉపయోగించవచ్చు.

నిజమైన course card లో, course description కొంచెం పొడవుగా ఉంటుంది, సాధారణంగా ఎక్కువ width ఆక్రమిస్తుంది. కాబట్టి ఈ సమస్య అంత స్పష్టంగా కనిపించకపోవచ్చు. కానీ ఈ తేడాను అర్థం చేసుకోవడం ముఖ్యం. ఎందుకంటే తరువాత short-text layouts తయారు చేసేటప్పుడు ఇలాంటి పరిస్థితులు తరచుగా ఎదురవుతాయి.

### లోపలి views మధ్య దూరాన్ని నియంత్రించడం

ముందు మనం `VStack` లో `spacing: 10` రాశాము:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` లోపలి views మధ్య దూరాన్ని నియంత్రించడానికి ఉపయోగిస్తారు.

`spacing` సెట్ చేయకపోతే, `VStack` కు default spacing ఉంటుంది. కానీ ఆ default spacing మనకు కావలసిన ప్రభావానికి సరిపోకపోవచ్చు.

ఇక్కడ course title మరియు course description చాలా దగ్గరగా ఉంటే layout ఇరుకుగా కనిపిస్తుంది. కాబట్టి మనం ఇలా ఉపయోగిస్తాము:

```swift
spacing: 10
```

దీంతో వాటి మధ్య కొంత ఖాళీ ఉంటుంది.

చూపించే ప్రభావం:

![view](../../../Resource/026_view9.png)

అలాగే, పైభాగం మరియు కంటెంట్ ప్రాంతం కూడా నిలువుగా అమరుతాయి. కాబట్టి వాటి మధ్య దూరాన్ని నియంత్రించడానికి కూడా `spacing` ఉపయోగించవచ్చు.

ఇప్పుడు `topView` మరియు `contentView` ను `body` లో ఉంచండి:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

చూపించే ప్రభావం:

![view](../../../Resource/026_view10.png)

ఇక్కడ `VStack(spacing: 20)` అనేది `topView` మరియు `contentView` మధ్య దూరాన్ని నియంత్రిస్తుంది.

అంటే:

```swift
VStack(alignment: .leading, spacing: 10)
```

course title మరియు course description మధ్య దూరాన్ని నియంత్రిస్తుంది.

```swift
VStack(spacing: 20)
```

పైభాగం మరియు కంటెంట్ ప్రాంతం మధ్య దూరాన్ని నియంత్రిస్తుంది.

ఇవి రెండూ `spacing` అయినప్పటికీ, వేర్వేరు `VStack` containers పై పనిచేస్తాయి. కాబట్టి ప్రభావిత పరిధి కూడా వేర్వేరు.

ఇలా, కంటెంట్ ప్రాంతం view పూర్తయింది.

## బటన్ ప్రాంతం

తర్వాత, దిగువ బటన్ ప్రాంతాన్ని తయారు చేద్దాం.

చూపించే ప్రభావం:

![view](../../../Resource/026_view11.png)

బటన్ ప్రాంతం ప్రధానంగా ఒక play icon మరియు ఒక text భాగంతో ఉంటుంది.

play icon ను చూపించడానికి `Image` ను, button text ను చూపించడానికి `Text` ను ఉపయోగించవచ్చు.

ఇక్కడ ముందుగా button appearance ను తయారు చేద్దాం:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("బటన్ క్లిక్ చేయబడింది")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("నేర్చుకోవడం ప్రారంభించండి")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

చూపించే ప్రభావం:

![view](../../../Resource/026_view12.png)

ఇక్కడ రెండు `HStack` containers ఉపయోగించబడ్డాయి:

లోపలి `HStack` icon మరియు text ను అడ్డంగా అమర్చడానికి ఉపయోగించబడుతుంది:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("నేర్చుకోవడం ప్రారంభించండి")
}
```

బయటి `HStack`, `Spacer()` తో కలిసి, ఈ button appearance ను ఎడమకు align చేయడానికి ఉపయోగించబడుతుంది:

```swift
HStack {
    ...
    Spacer()
}
```

button ను tap చేసినప్పుడు, console లో `బటన్ క్లిక్ చేయబడింది` output అవుతుంది.

## ప్రాథమిక కార్డ్ పూర్తయింది

ఇప్పుడు, పైభాగం, కంటెంట్ ప్రాంతం మరియు బటన్ ప్రాంతాన్ని కలపండి:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

చూపించే ప్రభావం:

![view](../../../Resource/026_view13.png)

ఇక్కడికి వచ్చేసరికి ఒక ప్రాథమిక course card పూర్తయింది.

## Swift చిహ్నం నేపథ్యం

చివరిగా, card కు ఒక అర్థపారదర్శక Swift icon background జోడిద్దాం.

![view](../../../Resource/026_view.png)

ముందు మనం `Color.indigo` ను background color గా ఉపయోగించాము. నిజానికి, `.background()` రంగును మాత్రమే కాదు, ఒక పూర్తి view ను కూడా జోడించగలదు.

కాబట్టి, ముందుగా ఒక ప్రత్యేక background view ను సృష్టించవచ్చు:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

ఈ background view లో, Swift icon ను కుడి దిగువ మూలకు నెట్టడానికి `VStack`, `HStack`, `Spacer()` ను ఉపయోగిస్తాము.

Swift icon కేవలం అలంకార background గా మాత్రమే ఉపయోగించబడుతుంది. కాబట్టి ఇక్కడ అర్థపారదర్శక తెలుపును ఉపయోగించాము:

```swift
Color.white.opacity(0.15)
```

దీంతో icon చాలా prominent గా కనిపించదు. అలాగే ముందు ఉన్న text content పై ప్రభావం చూపదు.

తర్వాత, `backgroundView` ను card కు జోడించండి:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

చివరి ప్రభావం:

![view](../../../Resource/026_view14.png)

ఇక్కడ వరుసగా రెండు `.background()` modifiers ఉపయోగించబడ్డాయి:

```swift
.background(backgroundView)
.background(Color.indigo)
```

మొదటి `.background()` Swift icon background ను జోడించడానికి ఉపయోగించబడుతుంది.
రెండవ `.background()` indigo background ను జోడించడానికి ఉపయోగించబడుతుంది.

దీంతో Swift icon indigo background పై కనిపిస్తుంది, మరియు card background లో భాగంగా ప్రదర్శించబడుతుంది.

ఇక్కడి నుంచి `.background()` రంగులను మాత్రమే కాకుండా custom views ను కూడా జోడించగలదని చూడవచ్చు. అనేక `.background()` modifiers ను కలిపి, ఇంకా సమృద్ధిగా ఉన్న background effects ను తయారు చేయవచ్చు.

ఇక్కడికి వచ్చేసరికి ఒక పూర్తి course card పూర్తయింది.

## సారాంశం

ఈ పాఠంలో, ఒక course card ద్వారా SwiftUI లో సాధారణ basic layout పద్ధతులను పునశ్చరణ చేసాము.

వచనాన్ని చూపించడానికి `Text` ను, system icon ను చూపించడానికి `Image` ను, view arrangement ను నియంత్రించడానికి `VStack`, `HStack`, `Spacer()` ను ఉపయోగించాము.

మనం `.lineLimit()` నేర్చుకున్నాము. ఇది text గరిష్ఠంగా చూపించే lines సంఖ్యను పరిమితం చేయగలదు. content పరిమితిని మించినప్పుడు, మిగిలిన భాగం వదిలివేయబడుతుంది.

అదే సమయంలో, `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` వంటి సాధారణ modifiers ను కూడా పునశ్చరణ చేసాము.

ఈ పాఠాన్ని పూర్తి చేసిన తరువాత, అనేక చిన్న views ను ఒక పూర్తి card module గా కలపగలుగుతున్నాము.

ఇది SwiftUI development లో చాలా సాధారణమైన ఆలోచన కూడా: ముందుగా views ను చిన్న భాగాలుగా విడదీసి, తరువాత వాటిని ఒక complete interface గా కలపడం.

## పూర్తి కోడ్

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("ప్రారంభ స్థాయి")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ పాఠాలు")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI ప్రారంభికుల ట్యుటోరియల్")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("SwiftUI తో శూన్యం నుంచి ప్రారంభించి, Apple యొక్క declarative UI development ను క్రమంగా నేర్చుకోండి. స్పష్టమైన వివరణలు మరియు ప్రాక్టికల్ ఉదాహరణల ద్వారా, layout, interaction, state management ను క్రమంగా అలవాటు చేసుకుని, అందమైన మరియు ఉపయోగకరమైన app interfaces నిర్మించడం నేర్చుకుంటారు.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("బటన్ క్లిక్ చేయబడింది")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("నేర్చుకోవడం ప్రారంభించండి")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
