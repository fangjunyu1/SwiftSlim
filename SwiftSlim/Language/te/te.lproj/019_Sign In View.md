# సైన్ ఇన్ దృశ్యం

ఈ పాఠంలో మనం చాలా ఉపయోగకరమైన ఒక సందర్భాన్ని నేర్చుకోబోతున్నాం — అదే సైన్ ఇన్ దృశ్యం.

అది వెబ్‌సైట్ అయినా లేదా App అయినా, ఉపయోగించే సమయంలో చాలా సందర్భాల్లో వినియోగదారుడు ఖాతా మరియు పాస్‌వర్డ్‌తో లాగిన్ కావాల్సి వస్తుంది.

ఉదాహరణకు, GitHub లాగిన్ పేజీ:

![WordPress](../../Resource/019_github.png)

ఈ పాఠంలో, వినియోగదారుడు చేతితో ఖాతా మరియు పాస్‌వర్డ్‌ను నమోదు చేసి, ఇన్‌పుట్‌లో ఏదైనా సమస్య ఉందా అని తనిఖీ చేయగలిగేలా ఇలాంటి ఒక సైన్ ఇన్ దృశ్యాన్ని తయారు చేద్దాం.

## పై భాగం అమరిక

మనం `ContentView` ఫైల్లో సైన్ ఇన్ దృశ్యానికి సంబంధించిన కోడ్‌ను వ్రాస్తాం.

మొదట, సైన్ ఇన్ దృశ్యపు పైభాగంలోని గుర్తింపు ప్రాంతాన్ని రూపొందిద్దాం. ముందుగా ఒక సరైన ఐకాన్ చిత్రాన్ని సిద్ధం చేసి `Assets` ఫోల్డర్‌లో ఉంచవచ్చు.

![icon](../../Resource/019_icon1.png)

తర్వాత, చిత్రాన్ని చూపించడానికి `Image` మరియు modifiers ఉపయోగించండి:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

ఇక్కడ ఉన్న కొన్ని modifiers అర్థం:

- `resizable()`: చిత్ర పరిమాణాన్ని మార్చేలా చేస్తుంది.
- `scaledToFit()`: చిత్రపు అసలు నిష్పత్తిని ఉంచి స్కేల్ చేస్తుంది.
- `frame(width: 100)`: చిత్రం చూపించే వెడల్పును `100`గా సెట్ చేస్తుంది.

తర్వాత, సైన్ ఇన్ శీర్షికను చూపించడానికి `Text` మరియు modifiers ఉపయోగించండి:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

ఆపై, చిత్రం మరియు వచనాన్ని పై నుంచి కిందలా అమర్చడానికి `VStack` ఉపయోగించండి:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

ఫలిత ప్రభావం:

![view](../../Resource/019_view.png)

ఇక్కడివరకు మనం సైన్ ఇన్ దృశ్యపు పైభాగ శీర్షిక ప్రాంతాన్ని పూర్తి చేశాం.

### అమరికను మెరుగుపరచడం

ఇప్పుడు, చిత్రం మరియు శీర్షిక మొత్తం అమరికలో మధ్య ప్రాంతంలో డిఫాల్ట్‌గా ఉన్నాయి.

అవి “పేజీ పైభాగంలోని లాగిన్ గుర్తు”లా కనిపించాలనుకుంటే, మిగిలిన స్థలాన్ని నింపడానికి `Spacer()` ఉపయోగించి, కంటెంట్‌ను పైభాగానికి దగ్గరగా చూపించవచ్చు.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

ఫలిత ప్రభావం:

![view](../../Resource/019_view1.png)

కానీ ఇప్పుడు `Image` మరియు `Text` స్క్రీన్ పైభాగానికి చాలా దగ్గరగా ఉండి కొంచెం ఇరుకుగా కనిపిస్తున్నాయి.

ఈ సమయంలో, మొత్తం `VStack`కి పై భాగంలో ఖాళీని జోడించడానికి `padding` ఉపయోగించవచ్చు.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

ఫలిత ప్రభావం:

![view](../../Resource/019_view2.png)

ఇలా, పేజీ పైభాగంలోని శీర్షిక ప్రాంతం మరింత సరైనట్లు కనిపిస్తుంది.

## యూజర్‌నేమ్ మరియు పాస్‌వర్డ్

లాగిన్ పేజీలో సాధారణంగా వినియోగదారుడు యూజర్‌నేమ్ మరియు పాస్‌వర్డ్‌ను నమోదు చేయాలి.

SwiftUIలో, వినియోగదారుడు నమోదు చేసే విషయాన్ని స్వీకరించడానికి `TextField` ఉపయోగించవచ్చు.

కానీ గమనించాలి: `TextField` తానే దీర్ఘకాలం ఇన్‌పుట్ డేటాను నిల్వ చేయదు, అది కేవలం ఒక ఇన్‌పుట్ కంట్రోల్ మాత్రమే. నిజంగా ఆ విషయాన్ని నిల్వ చేసేది దానికి bind చేసిన variables.

అందువల్ల, ముందుగా యూజర్‌నేమ్ మరియు పాస్‌వర్డ్‌ను నిల్వ చేయడానికి రెండు `@State` variables సృష్టించాలి:

```swift
@State private var user = ""
@State private var password = ""
```

`@State` variable విలువ మారినప్పుడు, SwiftUI సంబంధిత view ను ఆటోమేటిక్‌గా refresh చేస్తుంది.

తర్వాత, ఈ రెండు variables ను bind చేయడానికి `TextField` ఉపయోగించండి:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

ఇక్కడ `$user` మరియు `$password` అంటే “binding”.

అంటే, వినియోగదారుడు ఇన్‌పుట్ బాక్స్‌లో టైప్ చేసినప్పుడు variable కూడా అదే సమయంలో మారుతుంది; variable మారినప్పుడు, బాక్స్‌లో కనిపించే విషయం కూడా అదే సమయంలో మారుతుంది.

“view మరియు data ఒకదానితో ఒకటి సమకాలీకరించడం” అనే ఈ సంబంధాన్నే binding అంటారు.

ఇక్కడ `$` ఉన్న రాతను తప్పనిసరిగా ఉపయోగించాలి:

```swift
$user
```

ఎందుకంటే `TextField`కి సాధారణ string కాదు, “రెండు దిశల్లో data ను మార్చగల” binding value అవసరం.

### ఇన్‌పుట్ బాక్స్‌లను చూపించడం

వాటిని `ContentView`లో ఉంచుదాం:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

చూపించే ఫలితం:

![view](../../Resource/019_view3.png)

ఎందుకంటే ఇప్పుడు `user` మరియు `password` డిఫాల్ట్‌గా రెండూ ఖాళీ stringలు:

```swift
""
```

కాబట్టి ఇన్‌పుట్ బాక్స్ ముందుగా placeholder వచనాన్ని చూపిస్తుంది, ఉదాహరణకు:

```swift
input user
```

ఈ వచనం వినియోగదారుడికి “ఇక్కడ ఏమి నమోదు చేయాలి” అనే సూచన మాత్రమే, ఇది నిజమైన ఇన్‌పుట్ కంటెంట్ కాదు.

### ఇన్‌పుట్ బాక్స్‌లను మెరుగుపరచడం

ఇప్పుడు ఇన్‌పుట్ బాక్స్‌లను ఉపయోగించవచ్చు, కానీ డిఫాల్ట్ style కొంచెం సాదాసీదాగా ఉంది.

ఇంటర్‌ఫేస్‌ను మరింత స్పష్టంగా చేయడానికి, ఇన్‌పుట్ బాక్స్ ముందు ఒక శీర్షికను జోడించి, బాక్స్‌కే కొద్దిగా style మెరుగుదల చేయవచ్చు.

ఉదాహరణకు, ముందుగా ఒక శీర్షికను జోడించండి:

```swift
Text("Username")
    .fontWeight(.bold)
```

తర్వాత, శీర్షిక మరియు ఇన్‌పుట్ బాక్స్‌ను ఒకే లైన్‌లో ఉంచడానికి `HStack` ఉపయోగించండి:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

ఇక్కడ `HStack` వాడటానికి కారణం, “ఎడమవైపు శీర్షిక, కుడివైపు ఇన్‌పుట్ బాక్స్”గా చూపించాలనే ఉద్దేశం.

గమనించాల్సిన విషయం ఏమిటంటే, `TextField` డిఫాల్ట్‌గా మిగిలిన అందుబాటులో ఉన్న స్థలాన్ని ఆక్రమిస్తుంది.

![color](../../Resource/019_view6.png)

రెండు ఇన్‌పుట్ బాక్స్‌ల పరిమాణం ఒకేలా కనిపించడానికి, `frame(width:)` ఉపయోగించి వాటికి ఒక వెడల్పు ఇవ్వవచ్చు, తద్వారా అవి మరింత చక్కగా కనిపిస్తాయి.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

తర్వాత, ఇన్‌పుట్ బాక్స్ మరింత స్పష్టంగా కనిపించేందుకు ఒక border జోడించండి:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ఇప్పుడు, యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ రెండింటినీ `ContentView` viewలో జోడిద్దాం:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

చూపించే ఫలితం:

![view](../../Resource/019_view4.png)

ఇక్కడికి రాగానే, వినియోగదారుడు యూజర్‌నేమ్ మరియు పాస్‌వర్డ్‌ను నమోదు చేయగలడు.

## సైన్ ఇన్ బటన్

ఇప్పుడు, ఇన్‌పుట్ బాక్స్‌ల క్రింద ఒక సైన్ ఇన్ బటన్‌ను జోడిద్దాం.

```swift
Button("Sign in") {

}
```

తర్వాత, బటన్‌కు మరింత స్పష్టమైన system style ఇవ్వడానికి `buttonStyle` ఉపయోగించండి:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

చూపించే ఫలితం:

![view](../../Resource/019_view5.png)

బటన్ నిజంగా click కి స్పందిస్తున్నదో లేదో నిర్ధారించడానికి, ముందుగా బటన్‌లో `print` రాసి పరీక్షించవచ్చు:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

బటన్‌ను నొక్కినప్పుడు, console ఇలా చూపిస్తుంది:

```swift
click Sign in
```

ఇది బటన్ click కు విజయవంతంగా స్పందిస్తున్నట్లు చూపిస్తుంది.

## సైన్ ఇన్ లాజిక్

ఇప్పుడు, సైన్ ఇన్ బటన్‌కు అత్యంత ప్రాథమికమైన validation logic ను జోడిద్దాం: **వినియోగదారుడు యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ నమోదు చేశాడా లేదో తనిఖీ చేయడం**.

మనం కింది పరిస్థితులను అమలు చేయాలని కోరుకుంటున్నాం:

- వినియోగదారుడు ఏమీ నమోదు చేయకపోతే, `Empty` చూపించాలి
- వినియోగదారుడు వాటిలో ఒక్కదాన్ని మాత్రమే నమోదు చేస్తే, ఏది లోపించిందో సూచించాలి
- యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ రెండూ నమోదు చేస్తే, `Success` చూపించాలి

### ఏ సమాచారం నమోదు కాలేదు

ఎందుకంటే `user` మరియు `password` రెండూ డిఫాల్ట్‌గా ఖాళీ stringలు:

```swift
@State private var user = ""
@State private var password = ""
```

అందువల్ల వినియోగదారుడు ఏమీ నమోదు చేయనప్పుడు, అవి ఖాళీగానే ఉంటాయి.

Swiftలో, `String` వంటి typeలు `isEmpty` ను ఉపయోగించి కంటెంట్ ఖాళీగా ఉందో లేదో తనిఖీ చేయవచ్చు.

### isEmpty లక్షణం

`isEmpty` సాధారణంగా stringలు, arrayలు మరియు ఇతర కంటెంట్ ఖాళీగా ఉందో లేదో తనిఖీ చేయడానికి ఉపయోగించబడుతుంది.

ఉదాహరణకు:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

కంటెంట్ ఖాళీగా ఉంటే `isEmpty` `true` ను ఇస్తుంది; ఖాళీగా లేకపోతే `false` ను ఇస్తుంది.

అందువల్ల, యూజర్‌నేమ్ మరియు పాస్‌వర్డ్‌లో ఏదైనా నమోదు జరిగిందా అనే విషయం తెలుసుకోవడానికి దీన్ని ఉపయోగించవచ్చు.

### variables ను తనిఖీ చేయడానికి isEmpty ఉపయోగించడం

వినియోగదారుడు ఏ సమాచారం నమోదు చేయకపోతే:

```swift
user.isEmpty // true
password.isEmpty    // true
```

అప్పుడు, షరతును ఇలా వ్రాయవచ్చు:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

ఈ కోడ్ అర్థం: `user` ఖాళీగా ఉండి, `password` కూడా ఖాళీగా ఉంటే, ఇది చూపించండి:

```swift
Empty
```

ఇక్కడ `&&` అనేది “మరియు” అనే అర్థం వచ్చే logical operator.

అంటే, ఎడమవైపు ఉన్న షరతు నిజమై, కుడివైపు ఉన్న షరతు కూడా నిజమైతేనే మొత్తం షరతు నిజమవుతుంది.

కాబట్టి, యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ రెండూ ఖాళీగా ఉన్నప్పుడు మాత్రమే ఈ కోడ్ నడుస్తుంది.

## వినియోగదారుడు ఒక భాగమే నింపాడు

ఇప్పుడు, మరో పరిస్థితిని పరిశీలిద్దాం: వినియోగదారుడు కేవలం యూజర్‌నేమ్ మాత్రమే లేదా కేవలం పాస్‌వర్డ్ మాత్రమే నమోదు చేశాడు.

ఉదాహరణకు:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

ఈ సమయంలో, యూజర్‌నేమ్ ఖాళీగా లేదు, కానీ పాస్‌వర్డ్ ఖాళీగా ఉంది.

దీన్ని తనిఖీ చేయడానికి `isEmpty` ను కొనసాగించి ఉపయోగించవచ్చు:

### వినియోగదారుడు ఖాతా లేదా పాస్‌వర్డ్ నమోదు చేసిన పరిస్థితి

వినియోగదారుడు కేవలం యూజర్‌నేమ్ లేదా పాస్‌వర్డ్ మాత్రమే నమోదు చేస్తే, ఏది లోపించిందో దానికి తగిన సూచన ఇవ్వాలి.

ఉదాహరణకు, వినియోగదారుడు కేవలం యూజర్‌నేమ్ మాత్రమే నమోదు చేసినట్లయితే:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ఈ కోడ్ యొక్క logic ఏమిటంటే: యూజర్‌నేమ్ ఖాళీగా ఉంటే, యూజర్‌నేమ్ నమోదు చేయమని చెప్పాలి. లేకపోతే, పాస్‌వర్డ్ ఖాళీగా ఉందో లేదో తనిఖీ చేయాలి; ఖాళీగా ఉంటే, పాస్‌వర్డ్ నమోదు చేయమని చెప్పాలి.

### వినియోగదారుడు మొత్తం సమాచారాన్ని నమోదు చేశాడు

యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ రెండూ నమోదు చేయబడితే, వాటి `isEmpty` రెండింటికీ `false` వస్తుంది.

అప్పుడు, దీన్ని ఇలా వ్రాయవచ్చు:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

ఇక్కడ `!` అంటే “నిరాకరణ”.

ఉదాహరణకు:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

అంటే, `user.isEmpty` అనేది “యూజర్‌నేమ్ ఖాళీగా ఉందా” అని తనిఖీ చేయడానికి ఉపయోగించబడుతుంది; `!user.isEmpty` అనేది “యూజర్‌నేమ్ ఖాళీగా లేదూ” అని తెలుసుకోవడానికి ఉపయోగించబడుతుంది.

పాస్‌వర్డ్‌కి కూడా ఇదే logic వర్తిస్తుంది.

కాబట్టి, ఈ కోడ్ అర్థం: యూజర్‌నేమ్ ఖాళీగా లేదు, మరియు పాస్‌వర్డ్ కూడా ఖాళీగా లేదు.

ఈ రెండు షరతులు నెరవేరినప్పుడు, ఇది చూపించబడుతుంది:

```swift
Success
```

## పూర్తి validation logic

ఇప్పుడు ఈ మూడు పరిస్థితులను కలిపి `Button` లో వ్రాద్దాం:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

ఈ కోడ్ యొక్క అమలు క్రమాన్ని ఇలా అర్థం చేసుకోవచ్చు:

మొదటి దశలో, ముందుగా ఇది తనిఖీ చేయబడుతుంది:

```swift
if user.isEmpty && password.isEmpty
```

యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ రెండూ ఖాళీగా ఉంటే, నేరుగా `Empty` చూపించబడుతుంది.

రెండూ ఖాళీగా లేకపోతే, ప్రోగ్రామ్ ఈ కింది లైన్‌ను తనిఖీ చేస్తుంది:

```swift
else if user.isEmpty || password.isEmpty
```

ఇక్కడ `||` అంటే “లేదా”.

అంటే, ఏ ఒక్క షరతు నిజమైనా, మొత్తం వ్యక్తీకరణ నిజమవుతుంది.

కాబట్టి, యూజర్‌నేమ్ ఖాళీగా ఉన్నా లేదా పాస్‌వర్డ్ ఖాళీగా ఉన్నా `else if` కోడ్ బ్లాక్ అమలు అవుతుంది.

ఆ కోడ్ బ్లాక్‌లోకి వెళ్లిన తర్వాత, ఏ ఇన్‌పుట్ బాక్స్ నింపబడలేదో మళ్లీ చెక్ చేస్తాం:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ముందటి రెండు షరతులు నిజం కాకపోతే, యూజర్‌నేమ్ ఖాళీగా లేదనీ, పాస్‌వర్డ్ కూడా ఖాళీగా లేదనీ అర్థం.

అప్పుడు program చివరి `else`లోకి వెళ్తుంది:

```swift
print("Success")
```

ఇలా, లాగిన్ ఇన్‌పుట్‌కు సంబంధించిన అత్యంత ప్రాథమిక validation logic ను పూర్తి చేశాం.

## యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ తనిఖీ

పై logic కేవలం “ఏదైనా నమోదు చేయబడిందా” అన్నదాన్ని మాత్రమే తనిఖీ చేస్తుంది.

కానీ నిజమైన App లో, ఏదైనా నమోదు చేయడం మాత్రమే సరిపోదు. సాధారణంగా యూజర్‌నేమ్ మరియు పాస్‌వర్డ్‌ను server కు పంపి ధృవీకరించాలి.

Server యూజర్‌నేమ్ ఉందని, పాస్‌వర్డ్ సరైందని నిర్ధారిస్తే, లాగిన్ అనుమతించబడుతుంది; లేనిపక్షంలో లాగిన్ విఫలమైందని తెలియజేస్తుంది.

ఈ ప్రక్రియను సాధన చేయడానికి, ముందుగా కోడ్‌లో ఒక తాత్కాలిక ఖాతా మరియు పాస్‌వర్డ్‌ను సెట్ చేసి, “సరైన లాగిన్ సమాచారం”ను అనుకరించవచ్చు:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ రెండూ ఖాళీగా లేకపోతే, అవి సరైనవో లేదో తర్వాత పోల్చవచ్చు:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

ఇక్కడ `==` అంటే “సమానమా” అనే అర్థం.

ఉదాహరణకు:

```swift
user == userID
```

అంటే, వినియోగదారుడు నమోదు చేసిన యూజర్‌నేమ్, మనం సెట్ చేసిన సరైన యూజర్‌నేమ్‌తో పూర్తిగా సరిపోతుందా అని అర్థం; పాస్‌వర్డ్‌కు కూడా ఇదే logic వర్తిస్తుంది.

కాబట్టి, నమోదు చేసిన యూజర్‌నేమ్ మరియు పాస్‌వర్డ్ సెట్ చేసిన విలువలతో సమానంగా ఉంటే `Success` చూపించబడుతుంది; వాటిలో ఏదైనా ఒకటి సరిపోకపోతే `Input error` చూపించబడుతుంది.

ఇలా, ఒక సులభమైన “అనుకరణ లాగిన్ ధృవీకరణ”ను పూర్తి చేశాం.

ఇది ఇంకా server కు అనుసంధానమైన నిజమైన లాగిన్ function కాకపోయినా, మనకు ఒక విషయం అర్థం చేసుకోవడానికి ఇది చాలుతుంది: **బటన్‌ను నొక్కిన తర్వాత, వేర్వేరు పరిస్థితుల ఆధారంగా వేర్వేరు కోడ్ అమలు కావచ్చు**.

## సారాంశం

ఈ పాఠంలో, మనం ఒక ప్రాథమిక సైన్ ఇన్ దృశ్యాన్ని పూర్తి చేశాం మరియు ముఖ్యంగా “షరతుల ఆధారంగా ఇన్‌పుట్ కంటెంట్‌ను నిర్ణయించే logic” ను నేర్చుకున్నాం.

ఈ పాఠం యొక్క ప్రధాన విషయం: string ఖాళీగా ఉందో లేదో తెలుసుకోవడానికి `isEmpty` ఉపయోగించడం, అలాగే వేర్వేరు పరిస్థితులను నిర్వహించడానికి `if` statements ను logical operators తో కలిపి ఉపయోగించడం.

వాటిలో రెండు చాలా ముఖ్యమైన logical operators ఇవి:

- `&&`: “మరియు” అని అర్థం, రెండు షరతులూ నెరవేరాలి
- `||`: “లేదా” అని అర్థం, ఒక షరతు నెరవేరినా సరిపోతుంది

ఈ షరతులు చివరికి `true` లేదా `false` ను ఇస్తే, `if` statement ఫలితాన్ని బట్టి వేర్వేరు కోడ్‌ను అమలు చేస్తుంది.

ఈ సైన్ ఇన్ దృశ్యం ద్వారా, “interface + data + logical judgment” కలిసిన అభివృద్ధి విధానాన్ని మనం ఇప్పటికే తెలుసుకోవడం ప్రారంభించాం.

## పూర్తి కోడ్

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
