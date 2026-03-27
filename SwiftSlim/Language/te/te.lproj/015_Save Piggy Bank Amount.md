# పిగ్గీ బ్యాంక్ మొత్తాన్ని సేవ్ చేయడం

గత పాఠంలో, మనం ఒక సరళమైన “పిగ్గీ బ్యాంక్” ను అమలు చేశాము. ఈ పాఠంలో, “పిగ్గీ బ్యాంక్” లోని మొత్తాన్ని ఎలా persistent గా సేవ్ చేయాలో నేర్చుకుంటాము.

ఈ పాఠంలో ప్రధానంగా UserDefaults మరియు @AppStorage property wrapper గురించి నేర్చుకుంటాము. అదే సమయంలో onAppear యొక్క ఉపయోగం, అలాగే optional type (nil) ను ఎలా ఉపయోగించాలో కూడా విస్తరించి వివరిస్తాము.

గమనించాల్సిన విషయం ఏమిటంటే, ఈ పాఠం గత పాఠంలో అభివృద్ధి చేసిన “పిగ్గీ బ్యాంక్” కోడ్‌ను కొనసాగిస్తూ సాగుతుంది.

## Persistent save సమస్య

ప్రస్తుతం, “పిగ్గీ బ్యాంక్” యొక్క interface చాలా సులభంగా ఉంది, ఉపయోగించడమూ సౌకర్యంగా ఉంది.

![Piggy Bank](../../Resource/014_view.png)

కానీ, ఒక స్పష్టమైన సమస్య ఉంది: ప్రతి సారి view ను refresh చేసినప్పుడు లేదా app ను మూసి మళ్లీ తెరిచినప్పుడు, “పిగ్గీ బ్యాంక్” మొత్తం మొత్తం తిరిగి 0 గా మారుతుంది. ముందు సేవ్ చేసిన మొత్తం మొత్తం కూడా పూర్తిగా కనుమరుగవుతుంది.

ఇది data నిజంగా save కాలేదని సూచిస్తుంది. మరో మాటలో చెప్పాలంటే, ప్రస్తుత “పిగ్గీ బ్యాంక్” కేవలం తాత్కాలిక data ను మాత్రమే సేవ్ చేయగలదు.

### ఎందుకు persistent గా సేవ్ చేయలేకపోతున్నాం?

దానికి కారణం, మనం ఉపయోగించిన @State variable:

```swift
@State private var amount = 0
```

@State తో ప్రకటించిన variable యొక్క lifecycle పూర్తిగా view పై ఆధారపడుతుంది.

View సృష్టించబడినప్పుడు, amount 0 గా initialize అవుతుంది; view destroy అయినప్పుడు, amount కూడా destroy అవుతుంది.

ఇక్కడ amount లో ఉన్న data కేవలం memory లో మాత్రమే ఉంటుంది, అది device పై save కాలేదు.

మనకు amount యొక్క lifecycle ను view తో కట్టిపడేయాలని లేదు. కాబట్టి data persistence ను అమలు చేయాలి. మరింత సులభంగా చెప్పాలంటే, data ను device లో సేవ్ చేయాలి.

### “Data persistence” అంటే ఏమిటి

Data persistence ను ఇలా అర్థం చేసుకోవచ్చు: data ను “తాత్కాలిక memory” నుండి “device storage” లోకి సేవ్ చేయడం.

View ను మూసినా, లేదా app ను మూసినా, data పోకుండా ఉండాలి.

Swift అభివృద్ధిలో, సరళమైన “data persistence” కోసం UserDefaults ను ఉపయోగించవచ్చు. మరింత క్లిష్టమైన data కోసం SwiftData లేదా CoreData అవసరం.

ఈ పాఠంలో, ముందుగా అత్యంత సరళమైన UserDefaults ను నేర్చుకుందాం.

## UserDefaults

UserDefaults అనేది తేలికపాటి key-value data ను సేవ్ చేయడానికి ఉపయోగించబడుతుంది. ఇది సాధారణంగా String, Int, Double, Bool వంటి basic types ను నిల్వ చేయడానికి ఉపయోగపడుతుంది.

### Data ను సేవ్ చేయడం

UserDefaults లో set method ద్వారా data ను save చేయవచ్చు:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults లో మొదటి parameter సేవ్ చేయాల్సిన data ను సూచిస్తుంది. ఇక్కడ String, Int వంటి data types ఇవ్వబడ్డాయి.

రెండవ parameter forKey అనేది variable name లాంటిదే. ఇది UserDefaults లో save చేసిన data ను గుర్తించడానికి ఉపయోగపడుతుంది.

### Data ను చదవడం

UserDefaults లో తగిన methods ద్వారా data ను చదవాలి:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

చదివేటప్పుడు తప్పనిసరిగా సరైన type method నే ఉపయోగించాలి. లేకపోతే error రావచ్చు లేదా data సరైనది కాకపోవచ్చు.

### UserDefaults గురించి గమనించాల్సిన విషయాలు

#### 1. Optional type ను return చేయడం

UserDefaults నుండి data ను చదివేటప్పుడు, కొన్ని methods optional type (Optional) ను return చేస్తాయి.

ఉదాహరణకు:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

ఇక్కడ name యొక్క type:

```swift
String?
```

అంటే value ఉండవచ్చు, లేకపోవచ్చు కూడా.

**ఎందుకు optional type ను return చేస్తుంది?**

దానికి కారణం, UserDefaults లో ఒక key కు సంబంధించిన data తప్పనిసరిగా ఉండాల్సిన అవసరం లేదు.

ఉదాహరణకు:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

ఇప్పటివరకు "City" అనే key తో ఏ data కూడా సేవ్ చేయకపోతే, read చేసిన ఫలితం ఇలా ఉంటుంది:

```swift
nil
```

ఇక్కడ ప్రత్యేకంగా గుర్తుంచుకోవాల్సింది: nil అంటే data లేదు, కానీ అది ఖాళీ string కాదు.

“Type system” పాఠంలో మనం ఇలాంటి సమస్యను చూసాము. అప్పుడూ data type conversion విఫలమైతే optional type వచ్చేది.

అప్పుడు, ?? ద్వారా default value ఇచ్చి unwrap చేయాలి:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

UserDefaults లో data ఉంటే, ఆ value వాడబడుతుంది; లేకపోతే (nil అయితే), default value వాడబడుతుంది.

#### 2. Non-optional type ను return చేయడం

UserDefaults లో Int, Double, Bool types ను చదివేటప్పుడు, non-optional types వస్తాయి.

ఉదాహరణకు:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

ఈ keys ఎప్పుడూ save కాలేదన్నా కూడా, return value nil కాదు.

దాని బదులుగా, default values వస్తాయి:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Data పరిమితి

UserDefaults అనేది కొద్దిపాటి data కు మాత్రమే సరిపోతుంది. ఉదాహరణకు app settings, simple state వంటి data కు ఇది బాగా సరిపోతుంది.

అసలు వినియోగంలో, ఇది పెద్ద మొత్తంలో data లేదా తరచుగా read/write చేయాల్సిన data కోసం అనుకూలం కాదు.

## “పిగ్గీ బ్యాంక్” మొత్తాన్ని సేవ్ చేయడం

ఇప్పుడు, UserDefaults ను ఉపయోగించి “పిగ్గీ బ్యాంక్” మొత్తం మొత్తాన్ని సేవ్ చేసే logic ను అమలు చేయవచ్చు.

వినియోగదారు button ను నొక్కినప్పుడు, input చేసిన మొత్తం మొత్తం మొత్తానికి జోడించబడుతుంది. ఆ తర్వాత కొత్త మొత్తం మొత్తాన్ని UserDefaults లో save చేస్తాము.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

ఇలా మనం data write logic ను అమలు చేశాము.

## Data persistence logic వివరణ

మనము ఇప్పటికే data persistence కోసం write logic ను పూర్తి చేశాము. కానీ app ను run చేస్తే, ఒక విషయం తెలుస్తుంది: ప్రతి సారి view ను refresh చేసినప్పుడు లేదా app ను మళ్లీ తెరిచినప్పుడు, amount variable ఇంకా 0 గానే ఉంటుంది.

దానికి కారణం:

```swift
@State private var amount = 0
```

SwiftUI లో, @State variable view సృష్టించబడినప్పుడు మళ్లీ initialize అవుతుంది.

UserDefaults లో amount సేవ్ చేసినా, view మళ్లీ load అయినప్పుడు amount తిరిగి 0 అవుతుంది.

దీనితో స్పష్టమవుతోంది: మనం ప్రస్తుతం data ను UserDefaults లో save చేశాము గానీ, view లో తిరిగి restore చేయలేదు.

అందువల్ల, view load అయ్యేటప్పుడు కూడా UserDefaults నుండి data ను manually read చేసి, మళ్లీ amount కు assign చేయాలి. అప్పుడే పూర్తి data persistence logic అమలవుతుంది.

### Logic కి ఒక పోలిక

ఈ ప్రక్రియను “క్లాస్‌రూమ్‌లోని బ్లాక్‌బోర్డ్” లా ఊహించవచ్చు:

పాఠం జరుగుతున్నప్పుడు, గురువు బ్లాక్‌బోర్డ్‌పై విషయం రాస్తాడు. అది ప్రస్తుత view లోని state (@State) లాంటిది.

పాఠం ముగిసిన తర్వాత, తదుపరి పాఠం కోసం బ్లాక్‌బోర్డ్ తుడిచేస్తారు. ఇది view destroy అవ్వడాన్ని, @State లోని data clear అవ్వడాన్ని పోలి ఉంటుంది.

పాఠంలో ఉన్న విషయం పోకుండా ఉండేందుకు, గురువు ముందుగానే దాన్ని పాఠ్యపుస్తకంలో సేవ్ చేస్తాడు. ఆ పాఠ్యపుస్తకం UserDefaults లోని సేవ్ చేసిన data లాంటిది.

తరువాతి సారి క్లాస్ ప్రారంభమైనప్పుడు, బ్లాక్‌బోర్డ్ మొదట ఖాళీగా ఉంటుంది (@State initialization). కాబట్టి గురువు పాఠ్యపుస్తకాన్ని చూసి, పాత విషయాన్ని మళ్లీ బోర్డ్‌పై రాయాలి (UserDefaults ను చదవడం).

గుర్తుంచుకోవాల్సింది ఏమిటంటే, బ్లాక్‌బోర్డ్ పాత విషయాన్ని స్వయంగా తిరిగి తెచ్చుకోదు; తప్పనిసరిగా “పాఠ్యపుస్తకాన్ని చదవడం” (UserDefaults చదవడం) ద్వారా మళ్లీ రాయాలి.

## onAppear ఉపయోగించి data ను చదవడం

View కనిపించినప్పుడు, UserDefaults లోని value ను manually చదివి, @State లోని amount variable కు assign చేయాలి. అప్పుడు మాత్రమే నిజమైన data persistence అమలవుతుంది.

SwiftUI లో, view కనిపించినప్పుడు initialization logic ను అమలు చేయడానికి onAppear ను ఉపయోగించవచ్చు:

```swift
.onAppear {}
```

UserDefaults read code ను onAppear లో ఉంచాలి:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

View సృష్టించబడినప్పుడు, amount మొదట 0 గా initialize అవుతుంది; view కనిపించినప్పుడు, onAppear trigger అవుతుంది, UserDefaults నుండి value ను చదివి amount కు assign చేస్తుంది. ఇలా view గత సారి save చేసిన మొత్తం మొత్తాన్ని చూపగలదు.

ఇప్పుడు, మొత్తం “పిగ్గీ బ్యాంక్” data persistence logic పూర్తయింది.

## పూర్తి కోడ్

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage property wrapper

SwiftUI, UserDefaults save logic ను మరింత సులభం చేయడానికి @AppStorage property wrapper ను అందిస్తుంది.

```swift
@AppStorage("amount") private var amount = 0
```

@AppStorage అనేది UserDefaults పై ఒక wrapper. ఇక్కడ "amount" అనేది UserDefaults లోని key కి సరిపోతుంది.

View సృష్టించబడినప్పుడు, ఇది UserDefaults నుండి data ను చదువుతుంది; variable మారినప్పుడు, అది స్వయంగా UserDefaults లోకి write అవుతుంది.

ఇది SwiftUI state update mechanism ను support చేస్తుంది. @State లాగే, value మారినప్పుడు SwiftUI view కూడా refresh అవుతుంది.

అంటే, @AppStorage స్వయంగా data read మరియు save logic ను నిర్వహించగలదు. కాబట్టి UserDefaults ను manually call చేయాల్సిన అవసరం ఉండదు, onAppear ద్వారా data చదవడమూ అవసరం ఉండదు.

అందువల్ల, మనం కోడ్‌లోని UserDefaults logic ను @AppStorage తో మార్చవచ్చు:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## సారాంశం

ఈ పాఠంలో ప్రధానంగా ఈ విషయాలను నేర్చుకున్నాము:

మొదట, UserDefaults అనేది తేలికపాటి data ను సేవ్ చేయడానికి ఉపయోగించబడుతుంది. మనం దీన్ని ఉపయోగించి మొత్తం మొత్తాన్ని device లో సేవ్ చేశాము. UserDefaults లో read మరియు write methods ఉంటాయి, అలాగే optional type వంటి పరిస్థితులను కూడా సరైన విధంగా handle చేయాలి.

తర్వాత, @State variable అనేది కేవలం view లోని తాత్కాలిక state ను నిర్వహించడానికి మాత్రమే ఉపయోగించబడుతుంది. దాని lifecycle view తో సమానం. View మళ్లీ సృష్టించబడితే, @State కూడా మళ్లీ initialize అవుతుంది.

UserDefaults లోని data ను restore చేయడానికి, onAppear ను ఉపయోగించి view కనిపించినప్పుడు UserDefaults ను చదివి data ను restore చేసే విధానాన్ని నేర్చుకున్నాము.

చివరగా, @AppStorage ద్వారా UserDefaults logic ను భర్తీ చేసి, view load సమయంలో data ను స్వయంగా చదవడం, data మారినప్పుడు స్వయంగా write చేయడం ఎలా జరుగుతుందో చూశాము. దీంతో manually UserDefaults మరియు onAppear ను వాడాల్సిన అవసరం తగ్గుతుంది.

ఈ జ్ఞానంతో, మనం ఒక ప్రాథమిక app data storage feature ను నిర్మించగలుగుతాము, తద్వారా data persistent గా సేవ్ అవుతుంది.

## పాఠం తరువాతి అభ్యాసం

ఇప్పుడు, “పిగ్గీ బ్యాంక్” మొత్తం మొత్తాన్ని save చేయగలదు. కానీ ఇంకా ఫీచర్ పూర్తి కాలేదు.

1. వినియోగదారు డబ్బును తీసుకోవాలనుకున్నప్పుడు, తగిన withdraw logic ను రూపొందించాలి.
2. వినియోగదారు మొత్తాన్ని పూర్తిగా clear చేయాలనుకున్నప్పుడు, reset logic ను కూడా అమలు చేయాలి.
3. “పిగ్గీ బ్యాంక్” కు ఒక పేరు ఇవ్వాలనుకుంటే, String type data save చేయడాన్ని కూడా జోడించాలి.

ప్రస్తుత ఆధారంపై ఈ features ను మరింత మెరుగుపరచి, “పిగ్గీ బ్యాంక్” ను పూర్తి ఫీచర్‌తో కూడిన project గా మార్చవచ్చు.

## విస్తరణ జ్ఞానం - Input box default value సమస్య

ఇప్పుడు, input box interaction ను ఇంకా మెరుగుపరచి, input అనుభవాన్ని మరింత సౌకర్యంగా చేయవచ్చు.

![textfield](../../Resource/015_view.png)

ప్రస్తుత అమలులో, input box యొక్క default value 0. ప్రతి సారి వినియోగదారు amount ను input చేయాలంటే, ముందు 0 ను delete చేసి, తరువాత కొత్త సంఖ్యను input చేయాలి. ఇది మంచి interaction experience కాదు.

మనకు input box మొదట ఖాళీగా కనిపించాలి, 0 గా కాదు.

దానికి కారణం, TextField మరియు number రెండు-way binding లో ఉండటం:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

number మొదట 0 గా initialize అయితే, input box లో కూడా 0 కనిపిస్తుంది.

అందువల్ల, ఇప్పుడు మనం number ను empty value గా మార్చాలి, అంటే nil గా.

```swift
@State private var number = nil
```

ఈ సమయంలో ఒక error వస్తుంది:

```swift
Generic parameter 'Value' could not be inferred
```

ఇది మనం “Type system” పాఠంలో చూసిన అదే పరిస్థితి: variable యొక్క type ను ఆటోమేటిక్‌గా infer చేయలేకపోతే, explicit type declaration అవసరం అవుతుంది.

number ను nil గా సెట్ చేసినప్పుడు, nil లో type సమాచారం ఉండదు. కాబట్టి compiler కి అది String, Int, లేదా మరేదైనా type అనేది అర్థం కాదు. అందువల్ల error వస్తుంది.

కాబట్టి, మనం number కు explicit type declare చేయాలి:

```swift
@State private var number:Int? = nil
```

ఇక్కడ Int? అనేది optional type. అంటే number కి Int value ఉండవచ్చు, లేదా nil కూడా ఉండవచ్చు.

ఇలా initialize సమయంలో nil గా ఉంచితే, input box ఖాళీగా కనిపిస్తుంది, 0 గా కాదు.

### Optional type ను unwrap చేయడం

number ను optional type గా మార్చిన తర్వాత, పాత గణన code లో error వస్తుంది:

```swift
amount += number
```

Error message:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

దానికి కారణం, number ఇప్పుడు nil కూడా కావచ్చు. నేరుగా గణనలో వాడితే, అది ఇలా మారుతుంది:

```swift
amount += nil
```

స్పష్టంగా, nil ను amount తో add చేయలేం. ఇది చెల్లని operation.

అందువల్ల, optional type ను గణనలో ఉపయోగించే ముందు, ముందుగా unwrap చేయాలి.

ఇక్కడ ?? ద్వారా default value ఇవ్వవచ్చు:

```swift
amount += number ?? 0
```

number nil అయితే, default value 0 వాడబడుతుంది; number కి value ఉంటే, వినియోగదారు input చేసిన నిజమైన విలువ వాడబడుతుంది.

ఇలా గణన సరిగ్గా జరుగుతుంది. అదే సమయంలో, input box default గా ఖాళీగా కనిపించే ఫలితమూ వస్తుంది. వినియోగదారు ఇక 0 ను manually delete చేయాల్సిన అవసరం ఉండదు.

## విస్తరించిన కోడ్

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
