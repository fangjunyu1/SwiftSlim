# అనుకూల View

ఈ పాఠంలో, మనం చాలా ముఖ్యమైన SwiftUI రచనా విధానాన్ని నేర్చుకుంటాం: **అనుకూల View**.

అనుకూల View ఒక పునరావృతమయ్యే View కోడ్ భాగాన్ని కప్పి ఉంచి, దాన్ని మళ్లీ మళ్లీ ఉపయోగించగల View గా మార్చగలదు.

నిజమైన App అభివృద్ధిలో, మనం తరచుగా ఇలాంటి పరిస్థితిని ఎదుర్కొంటాం: అనేక ఇంటర్‌ఫేసుల నిర్మాణం ఒకేలా ఉంటుంది, కానీ చూపించే కంటెంట్ మాత్రమే వేరు.

ఉదాహరణకు, ఫోరమ్ వెబ్‌సైట్‌లోని పోస్ట్‌ల జాబితాలో, ప్రతి పోస్ట్‌కు శీర్షిక, చిత్రం, లైక్‌ల సంఖ్య వంటి సమాచారం ఉండవచ్చు.

![Reddit](../../../Resource/028_view1.png)

షాపింగ్ వెబ్‌సైట్‌లోని ఉత్పత్తుల జాబితాలో, ప్రతి ఉత్పత్తికి చిత్రం, పేరు, ధర వంటి సమాచారం ఉండవచ్చు.

![Amazon](../../../Resource/028_view2.png)

ఈ కంటెంట్‌ల నిర్మాణం దాదాపు ఒకేలా ఉంటుంది; తేడా చూపించే డేటాలో మాత్రమే ఉంటుంది.

ప్రతి అంశానికి చేతితో కోడ్ రాస్తే, కోడ్ చాలా పొడవుగా మారుతుంది, అలాగే తర్వాత సవరించడానికీ అనుకూలంగా ఉండదు.

అందువల్ల, మనం ఒకేలా ఉన్న నిర్మాణాన్ని అనుకూల View గా కప్పి ఉంచి, వేర్వేరు కంటెంట్‌ను పరామితులుగా అందులోకి పంపవచ్చు.

అలా చేస్తే, ఒకే View వేర్వేరు కంటెంట్‌ను చూపగలదు.

## అవసర దృశ్యం

ఉదాహరణకు, ఇప్పుడు మనం ఒక సెట్టింగ్‌ల జాబితాను తయారు చేయాలి.

చూపించే ఫలితం:

![view](../../../Resource/028_view.png)

ఈ సెట్టింగ్‌ల జాబితాలో మూడు వేర్వేరు సెట్టింగ్ అంశాలు ఉన్నాయి, అవి `సెట్టింగ్‌లు`, `ఫోల్డర్`, `సంగీతం`.

వాటి ఐకాన్‌లు, రంగులు, శీర్షికలు వేర్వేరు అయినప్పటికీ, మొత్తం నిర్మాణం ఒకేలా ఉంటుంది:

- ఎడమ వైపు ఐకాన్
- ఐకాన్ నేపథ్య రంగు
- మధ్యలో శీర్షిక
- కుడి వైపు బాణం

అనుకూల View ఉపయోగించకపోతే, మనం ఇలా రాయవచ్చు:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("సెట్టింగ్‌లు")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("ఫోల్డర్")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("సంగీతం")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

ఈ కోడ్ సాధారణంగా చూపించగలదు, కానీ సమస్య కూడా చాలా స్పష్టంగా ఉంటుంది: మూడు సెట్టింగ్ అంశాల కోడ్ దాదాపు పూర్తిగా ఒకేలా ఉంది.

వేరుగా ఉన్నవి ఐకాన్, రంగు, శీర్షిక మాత్రమే:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("సెట్టింగ్‌లు")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("ఫోల్డర్")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("సంగీతం")
```

అంటే, ప్రతి సెట్టింగ్ అంశం నిర్మాణం స్థిరంగా ఉంటుంది; వేరుగా ఉండేవి ఐకాన్, రంగు, శీర్షిక మాత్రమే.

ఈ పరిస్థితి అనుకూల View ఉపయోగించడానికి చాలా సరిపోతుంది.

### నీడ shadow

ఇక్కడ ఒక కొత్త modifier `.shadow(radius:)` ఉపయోగించాం:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View కు నీడను జోడించగలదు.

`radius` అనేది నీడ యొక్క blur వ్యాసార్థాన్ని సూచిస్తుంది. విలువ ఎక్కువైతే, సాధారణంగా నీడ వ్యాప్తి పరిధి పెరుగుతుంది, అలాగే అది మరింత మృదువుగా కనిపిస్తుంది.

ఇక్కడ `1` గా సెట్ చేశాం, అంటే చాలా స్వల్పమైన నీడ ప్రభావాన్ని మాత్రమే జోడించడం.

## సెట్టింగ్ అంశం View ను కప్పి ఉంచడం

తర్వాత, ప్రతి సెట్టింగ్ అంశాన్ని ఒక కొత్త View గా కప్పి ఉంచుతాం.

`SettingItemView` ను సృష్టించవచ్చు:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ఈ View లో, మనం మూడు లక్షణాలను నిర్వచించాం:

```swift
let icon: String
let color: Color
let title: String
```

వాటిలో:

- `icon` ఐకాన్ పేరును సూచిస్తుంది
- `color` ఐకాన్ నేపథ్య రంగును సూచిస్తుంది
- `title` సెట్టింగ్ అంశం శీర్షికను సూచిస్తుంది

ఈ మూడు విషయాలు వేర్వేరు సెట్టింగ్ అంశాల్లో వేర్వేరుగా ఉంటాయి కాబట్టి, వాటిని బయట నుంచి అందించగల పరామితులుగా చేస్తాం.

## అనుకూల View ను ఉపయోగించడం

`SettingItemView` ఉన్న తర్వాత, మనం ఇకపుడు పెద్ద `HStack` కోడ్ భాగాన్ని మళ్లీ మళ్లీ రాయాల్సిన అవసరం లేదు.

ఇప్పుడు ఇలా ఉపయోగించవచ్చు:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "సెట్టింగ్‌లు")
```

ఈ కోడ్ పంక్తి ఒక సెట్టింగ్ అంశం View ను సృష్టించి, మూడు పరామితులను పంపుతుందని అర్థం:

```swift
icon: "gear"
color: Color.blue
title: "సెట్టింగ్‌లు"
```

పంపిన తర్వాత, `SettingItemView` లోపలి లక్షణాలు వాటికి సరిపడే విలువలను పొందుతాయి:

- `icon` విలువ `gear`
- `color` విలువ `Color.blue`
- `title` విలువ `"సెట్టింగ్‌లు"`

అందువల్ల, View లోపలి `Image(systemName: icon)` గేర్ ఐకాన్‌ను చూపుతుంది, `.background(color)` నీలం నేపథ్యాన్ని ఉపయోగిస్తుంది, `Text(title)` `సెట్టింగ్‌లు` ను చూపుతుంది.

పూర్తి కోడ్:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "సెట్టింగ్‌లు")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "ఫోల్డర్")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "సంగీతం")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

చూపించే ఫలితం:

![view](../../../Resource/028_view.png)

చూడగలిగినట్లు, కప్పి ఉంచిన తర్వాత చూపించే ఫలితం ముందునిలాగే ఉంటుంది, కానీ కోడ్ మరింత స్పష్టంగా మారింది.

ముందు ప్రతి సెట్టింగ్ అంశానికి పూర్తి `HStack` భాగం రాయాల్సి వచ్చేది; ఇప్పుడు ఒక్క కోడ్ పంక్తి చాలు:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "సెట్టింగ్‌లు")
```

ఇదే అనుకూల View యొక్క పాత్ర: **పునరావృతమయ్యే View నిర్మాణాన్ని కప్పి ఉంచి, వేర్వేరు కంటెంట్‌ను మాత్రమే పరామితులుగా పంపడం.**

## పరామితులను ఎందుకు పంపగలం

తర్వాత, అనుకూల View పరామితులను ఎందుకు స్వీకరించగలదో సులభంగా అర్థం చేసుకుందాం.

SwiftUI లో, View అసలు ఒక structure.

ఉదాహరణకు:

```swift
struct ContentView: View {
    var body: some View {
        Text("హలో, ప్రపంచం!")
    }
}
```

ఇక్కడ `ContentView` ఒక structure.

మనము ఇలా రాస్తే:

```swift
ContentView()
```

అసలు మనం ఒక `ContentView` View ను సృష్టిస్తున్నాం.

వెనుక ఉన్న `()` దాని initialization method ను పిలుస్తున్నట్లు సూచిస్తుంది; దీనిని ఈ View ను సృష్టించడం అని కూడా అర్థం చేసుకోవచ్చు.

ఈ `ContentView` లో బయట నుంచి పంపాల్సిన లక్షణాలు లేవు కాబట్టి, నేరుగా ఇలా రాయవచ్చు:

```swift
ContentView()
```

కానీ View లో విలువ ఇవ్వని లక్షణం ఉంటే, View సృష్టించే సమయంలో దానికి సరిపడే విలువను పంపాలి.

ఉదాహరణకు:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("పేరు: \(name)")
    }
}
```

ఇక్కడ `name` ఒక లక్షణం, దానికి default value లేదు.

కాబట్టి `ContentView` సృష్టించే సమయంలో, `name` కు ఒక నిర్దిష్టమైన విలువ తప్పనిసరిగా ఇవ్వాలి:

```swift
ContentView(name: "Fang Junyu")
```

అలా చేస్తే, View లోపల ఈ విలువను ఉపయోగించగలదు:

```swift
Text("పేరు: \(name)")
```

ఇదే మనం `SettingItemView` సృష్టించేటప్పుడు పరామితులు పంపాల్సిన కారణం:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "సెట్టింగ్‌లు")
```

ఎందుకంటే `SettingItemView` లో default value లేని మూడు లక్షణాలు ఉన్నాయి:

```swift
let icon: String
let color: Color
let title: String
```

అందువల్ల, ఈ View ను సృష్టించే సమయంలో వాటిని లోపలికి పంపాలి. పంపిన పరామితులను Swift View లోపలి లక్షణాలకు విలువలు ఇవ్వడానికి ఉపయోగిస్తుంది.

## Initialization method

తర్వాత, initialization method ను ఇంకాస్త లోతుగా అర్థం చేసుకుందాం.

### Default initialization method

మనము ఒక సాధారణ View ను నిర్వచించినప్పుడు:

```swift
struct ContentView: View {
    var body: some View {
        Text("హలో, ప్రపంచం!")
    }
}
```

ఈ కోడ్‌లో, మనం చేతితో initialization method రాయలేదు.

కానీ ఈ View ను ఉపయోగించినప్పుడు, ఇలా రాయవచ్చు:

```swift
ContentView()
```

ఇక్కడ `()` అసలు `ContentView` ను సృష్టించడాన్ని సూచిస్తుంది; దీనిని దాని initialization method ను పిలవడం అని కూడా అర్థం చేసుకోవచ్చు.

### Initialization method కనిపించకపోయినా ఎందుకు పిలవగలం?

ఎందుకంటే Swift compiler మన కోసం స్వయంచాలకంగా ఒక initialization method ను సృష్టిస్తుంది.

గమనించాల్సిన విషయం: **ఈ initialization method స్వయంచాలకంగా సృష్టించబడుతుంది; సాధారణంగా మనం కోడ్‌లో దాన్ని నేరుగా చూడము.**

అంటే, మనం `struct` లో చేతితో ఇలా రాయకపోయినా:

```swift
init() {

}
```

Swift compiler వెనుక నుంచి మన కోసం ఇలాంటి initialization method ను సృష్టిస్తుంది:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("హలో, ప్రపంచం!")
    }
}
```

అందుకే మనం నేరుగా ఇలా రాయగలం:

```swift
ContentView()
```

కాబట్టి, నిజమైన కోడ్‌లో మనం సాధారణంగా initialization method ను చేతితో రాయాల్సిన అవసరం లేదు.

ఒక విషయం మాత్రమే అర్థం చేసుకుంటే సరిపోతుంది: **SwiftUI View ను సృష్టించే సమయంలో, ఆ View యొక్క initialization method పిలవబడుతుంది. మనం చేతితో initialization method రాయకపోయినా, Swift దాన్ని స్వయంచాలకంగా సృష్టించవచ్చు.**

### పరామితులతో initialization method

View లో default value లేని ఒక లక్షణం ఉంటే, ఉదాహరణకు:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("పేరు: \(name)")
    }
}
```

Swift compiler లక్షణం ఆధారంగా పరామితి కలిగిన initialization method ను స్వయంచాలకంగా సృష్టిస్తుంది.

దీనిని సులభంగా ఇలా అర్థం చేసుకోవచ్చు:

```swift
init(name: String) {
    self.name = name
}
```

ఇక్కడ:

```swift
init(name: String)
```

అంటే `ContentView` సృష్టించే సమయంలో `String` రకం `name` పరామితిని పంపాలి.

మనము ఇలా రాస్తే:

```swift
ContentView(name: "Fang Junyu")
```

అర్థం: `"Fang Junyu"` ను initialization method కు పరామితిగా పంపడం.

తర్వాత initialization method లోపల ఇది అమలు అవుతుంది:

```swift
self.name = name
```

ఈ కోడ్ పంక్తి అర్థం: బయట నుంచి పంపిన `name` ను ప్రస్తుత View యొక్క స్వంత `name` లక్షణానికి కేటాయించడం.

దీనిని సులభంగా ఇలా అర్థం చేసుకోవచ్చు:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("పేరు: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

ఇలా చేస్తే, View లోపల పంపిన విలువను ఉపయోగించగలదు.

ఇదే పరామితులు ఉన్న View యొక్క initialization ప్రక్రియ: **View లోని లక్షణానికి default value లేకపోతే, View సృష్టించే సమయంలో సరిపడే పరామితిని పంపాలి, అప్పుడు initialization method లక్షణానికి విలువ కేటాయిస్తుంది.**

## లక్షణానికి default value ఉన్న సందర్భం

లక్షణానికి ఇప్పటికే default value ఉంటే, View సృష్టించే సమయంలో పరామితి పంపకపోవచ్చు.

ఉదాహరణకు:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("పేరు: \(name)")
    }
}
```

ఇక్కడ `name` కు ఇప్పటికే ఒక default value ఉంది:

```swift
"Fang Junyu"
```

కాబట్టి `ContentView` సృష్టించే సమయంలో నేరుగా ఇలా రాయవచ్చు:

```swift
ContentView()
```

ఈ సమయంలో, `name` default value ను ఉపయోగిస్తుంది, ఇంటర్‌ఫేస్ ఇలా చూపిస్తుంది:

```swift
పేరు: Fang Junyu
```

నిజమే, View సృష్టించే సమయంలో కొత్త విలువను కూడా పంపవచ్చు:

```swift
ContentView(name: "Sam")
```

ఈ సమయంలో, View default value ను కాకుండా బయట నుంచి పంపిన `"Sam"` ను ఉపయోగిస్తుంది, ఇంటర్‌ఫేస్ ఇలా చూపిస్తుంది:

```swift
పేరు: Sam
```

అర్థం చేసుకోవడానికి సులభంగా, Swift compiler స్వయంచాలకంగా సృష్టించే initialization method ను ఇలా ఊహించవచ్చు:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

ఇక్కడ `name: String = "Fang Junyu"` అంటే: View సృష్టించే సమయంలో `name` పంపకపోతే, default value `"Fang Junyu"` ను ఉపయోగించాలి; View సృష్టించే సమయంలో కొత్త `name` పంపితే, పంపిన విలువను ఉపయోగించాలి.

అంటే: **బయట నుంచి పరామితి పంపకపోతే, లక్షణం యొక్క default value ఉపయోగించబడుతుంది; బయట నుంచి పరామితి పంపితే, పంపిన విలువ ఉపయోగించబడుతుంది.**

## తిరిగి SettingItemView కు

ఇప్పుడు మనం తిరిగి SettingItemView ను చూద్దాం:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ఈ View నిర్మాణం స్థిరంగా ఉంటుంది.

స్థిరమైన భాగాలు ఇవి:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

వేర్వేరు భాగాలు ఇవి:

```swift
icon
color
title
```

కాబట్టి, మనం వేర్వేరు కంటెంట్‌ను లక్షణాలుగా చేసి, View సృష్టించే సమయంలో పరామితులుగా పంపుతాం.

వేర్వేరు సెట్టింగ్ అంశాలను సృష్టించినప్పుడు, వేర్వేరు పరామితులను మాత్రమే పంపాలి:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "సెట్టింగ్‌లు")
SettingItemView(icon: "folder", color: Color.brown, title: "ఫోల్డర్")
SettingItemView(icon: "music.note", color: Color.purple, title: "సంగీతం")
```

ఇలా చేస్తే, ఒకే `SettingItemView` మూడు వేర్వేరు సెట్టింగ్ అంశాలను చూపగలదు.

ఇదే అనుకూల View యొక్క అత్యంత సాధారణ వినియోగ విధానం.

## సారాంశం

ఈ పాఠంలో, మనం అనుకూల View గురించి నేర్చుకున్నాం.

అనుకూల View యొక్క ముఖ్యమైన పాత్ర: **పునరావృతమయ్యే View కోడ్‌ను కప్పి ఉంచి, దాన్ని మళ్లీ ఉపయోగించగలిగేలా చేయడం.**

ఈ ఉదాహరణలో, మూడు సెట్టింగ్ అంశాల నిర్మాణం ఒకేలా ఉంది; వేర్వేరు ఉన్నవి ఐకాన్, రంగు, శీర్షిక మాత్రమే.

కాబట్టి మనం ఒక `SettingItemView` సృష్టించాం:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

తర్వాత, ఈ View ను ఉపయోగించే సమయంలో వేర్వేరు పరామితులను పంపుతాం:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "సెట్టింగ్‌లు")
```

ఇక్కడి పరామితులు `SettingItemView` లోపలికి వెళ్తాయి.

ఈ విధంగా, మనం తక్కువ కోడ్‌తో, నిర్మాణం ఒకేలా కానీ కంటెంట్ వేర్వేరు ఉన్న View లను సృష్టించగలం.

ఇది SwiftUI అభివృద్ధిలో చాలా సాధారణంగా ఉపయోగించే రచనా విధానం కూడా.
