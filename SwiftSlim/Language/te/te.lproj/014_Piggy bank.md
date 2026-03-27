# పిగ్గీ బ్యాంక్

ఈ పాఠంలో, మనం ఒక సరళమైన “పిగ్గీ బ్యాంక్” ప్రాజెక్ట్‌ను అభివృద్ధి చేస్తాము. దీని ఫీచర్‌లు సులభంగా ఉంటాయి, కానీ ఇందులో పూర్తి interaction logic ఉంటుంది. కాబట్టి ఇది ప్రారంభ స్థాయి విద్యార్థులకు చాలా అనుకూలంగా ఉంటుంది.

ఈ ప్రాజెక్ట్ ద్వారా, మనం TextField (input box) మరియు border గురించి నేర్చుకుంటాము. అలాగే data binding ($) గురించి కూడా అర్థం చేసుకుంటాము.

చివరి లక్ష్యం ఏమిటంటే, మొత్తం మొత్తాన్ని చూపించే, మొత్తం డబ్బును input చేయగలిగే, button ను నొక్కినప్పుడు డబ్బును save చేసి మొత్తం మొత్తానికి జోడించే “పిగ్గీ బ్యాంక్” ప్రాజెక్ట్‌ను రూపొందించడం.

అమలు ఫలితం:

![Piggy Bank](../../RESOURCE/014_view.png)

## మొత్తం మొత్తాన్ని చూపించడం

మొదట, “పిగ్గీ బ్యాంక్” యొక్క మొత్తం మొత్తాన్ని view లో చూపించాలి.

ContentView లో, “పిగ్గీ బ్యాంక్” యొక్క మొత్తం మొత్తాన్ని నిల్వ చేయడానికి ఒక variable ను declare చేయాలి.

```swift id="x40v8a"
@State private var amount = 0
```

తర్వాత, ఈ మొత్తాన్ని Text ఉపయోగించి చూపించాలి:

```swift id="1pjjlu"
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

ఇక్కడ, .font మరియు .fontWeight ను font size మరియు font weight సెట్ చేయడానికి ఉపయోగిస్తున్నాం.

```swift id="c3twec"
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

amount మారినప్పుడు, Text లో కనిపించే మొత్తం కూడా స్వయంగా refresh అవుతుంది.

## మొత్తం డబ్బును input చేయడం

“పిగ్గీ బ్యాంక్” కేవలం మొత్తం మొత్తాన్ని చూపించడమే కాదు, వినియోగదారు డబ్బును “input” చేయగలగాలి కూడా. దీని కోసం SwiftUI లోని TextField view control ను ఉపయోగించాలి.

### TextField

TextField అనేది SwiftUI లో content ను input చేయడానికి ఉపయోగించే view control. ఇది సాధారణంగా single-line input కోసం ఉపయోగించబడుతుంది.

TextField ప్రధానంగా రెండు binding formats ను అందిస్తుంది:

**1. String type ను bind చేయడం**

```swift id="p4s15o"
TextField("Placeholder", text: $text)
```

ఇది పేరు, శీర్షిక వంటి text input content కు అనుకూలంగా ఉంటుంది.

**2. Numeric type (Int/Double) ను bind చేయడం**

```swift id="7qvzw0"
TextField("Amount", value: $number, format: .number)
```

ఇది వయస్సు, జీతం, మొత్తం డబ్బు వంటి numeric input content కు అనుకూలంగా ఉంటుంది.

format: .number అంటే, ఈ input box content ను “number format” ప్రకారం parse చేసి చూపిస్తుంది.

#### Placeholder text

TextField యొక్క మొదటి parameter అనేది placeholder. ఇది వినియోగదారునికి input చేయాల్సిన content గురించి సూచన ఇస్తుంది:

```swift id="jlwm8s"
TextField("input your name", text: $text)
```

Input box ఖాళీగా ఉన్నప్పుడు, ఇది ఒక బూడిదరంగు సూచన text ను చూపిస్తుంది.

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

TextField input content ను persistent గా save చేయదు. Data ను నిర్వహించడానికి, అది ఒక bound variable పై ఆధారపడాలి.

```swift id="6rqqfr"
@State private var text = ""
TextField("Placeholder", text: $text)
```

వినియోగదారు input చేసిన content నేరుగా text variable లో save అవుతుంది. TextField మాత్రం input interface ను మాత్రమే నిర్వహిస్తుంది.

$ అంటే binding:

```swift id="co9hki"
$text
```

ఇది సాధారణ variable కాదు; ఇది ఒక Binding type.

దాని పని ఏమిటంటే, view మరియు data మధ్య ఒక connection ను ఏర్పరచడం:

వినియోగదారు TextField లో content ను input చేసినప్పుడు, text స్వయంగా update అవుతుంది; అలాగే text మారినప్పుడు, TextField కూడా synchronously update అవుతుంది.

ఉదాహరణకు:

```swift id="6hurkt"
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

TextField లో content ను input చేస్తే, పైభాగంలోని Text అదే సమయంలో synchronously చూపిస్తుంది.

![textField](../../RESOURCE/014_textfield1.png)

### Number type ను bind చేయడం

Number ను input చేయాల్సినప్పుడు, దానికి సరిపడే type variable ను bind చేయాలి:

```swift id="arjvca"
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

వినియోగదారు amount ను input చేసినప్పుడు, TextField ఆ input content ను parse చేసి, number విలువను స్వయంగా update చేస్తుంది.

## Input box ను జోడించడం

TextField యొక్క ప్రాథమిక ఉపయోగాన్ని అర్థం చేసుకున్న తర్వాత, ఇప్పుడు దీన్ని “పిగ్గీ బ్యాంక్” ప్రాజెక్ట్‌లో ఉపయోగిద్దాం.

“పిగ్గీ బ్యాంక్” లో “amount” ను input చేయాలి. కాబట్టి మనం “numeric type binding (Int/Double)” విధానాన్ని ఉపయోగిస్తాము. అలాగే, వినియోగదారు input చేసిన మొత్తాన్ని save చేయడానికి number అనే కొత్త variable ను జోడిస్తాము:

```swift id="1s7t2u"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

ఇప్పుడు, TextField default గా number యొక్క విలువను చూపిస్తుంది (default value 0).

Input content ను పూర్తిగా delete చేసినప్పుడు, అది “Amount” అనే placeholder ను చూపిస్తుంది.

ఇది మళ్లీ ఒక విషయం స్పష్టంగా చూపిస్తుంది: TextField చూపించేది bound variable యొక్క విలువ; అది content ను తానే save చేయదు.

### Input box size సమస్య

ప్రస్తుత view లో, TextField కి border లేకుండా, ఒక 0 మాత్రమే కనిపిస్తుంది. Content కూడా left aligned గా ఉన్నట్లు అనిపిస్తుంది.

ఫలితం ఇలా ఉంటుంది:

![textfield](../../RESOURCE/014_textfield2.png)

దానికి కారణం, TextField default గా parent view యొక్క మొత్తం width ను occupy చేయడం.

దీన్ని verify చేయడానికి, మనం ఒక background color జోడించవచ్చు:

```swift id="rihso4"
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

ఫలితం ఇలా ఉంటుంది:

![textfield](../../RESOURCE/014_textfield3.png)

ఇక్కడ మనం చూడగలం, TextField వాస్తవానికి మొత్తం row width ను fill చేస్తోంది.

### Fixed width ను సెట్ చేయడం

Input box ను మరింత compact గా చేయాలని అనుకుంటే, frame ద్వారా దాని width ను limit చేయవచ్చు:

```swift id="0g6i8o"
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

ఫలితం ఇలా ఉంటుంది:

![textfield](../../RESOURCE/014_textfield4.png)

### Border మరియు padding ను జోడించడం

TextField కి default గా border ఉండదు. కాబట్టి మనం style ను manually జోడించవచ్చు:

```swift id="y4zrr3"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ఇప్పుడు, ఈ input box మరింత “standard input box” లా కనిపిస్తుంది.

![textfield](../../RESOURCE/014_textfield5.png)

## Border

SwiftUI లో, border ను view కు సరిహద్దు గీతను జోడించడానికి ఉపయోగిస్తారు.

ప్రాథమిక usage:

```swift id="1dtkd9"
border(Color.black, width: 1)
```

ఇక్కడ, Color.black అనేది border యొక్క రంగు, width అనేది border యొక్క మందం.

TextField లో, మనం ఇలా ఉపయోగిస్తున్నాం:

```swift id="qdc9v5"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

దీని అర్థం, input box కు నలుపు రంగులో, 1 pt width ఉన్న ఒక border ను జోడించడం.

ఇతర రంగులను కూడా ప్రయత్నించవచ్చు. ఉదాహరణకు Color.blue, Color.green, లేదా border ను width: 2 తో మందంగా చేయవచ్చు.

## Save button

ఇప్పుడు, మన దగ్గర మొత్తం మొత్తాన్ని చూపించే amount variable ఉంది, వినియోగదారు input కోసం TextField ఉంది, అలాగే input box కు bound అయిన number variable ఉంది.

ప్రస్తుత code ఇలా ఉంది:

```swift id="2qni2n"
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
		}
    }
}
```

### Button ను జోడించడం

ఇప్పుడు, save operation ను trigger చేయడానికి ఒక button ను జోడించాలి.

```swift id="bclm7t"
Button("Save") {
    
}
```

### Save logic ను అమలు చేయడం

వినియోగదారు amount ను input చేసి, button ను నొక్కినప్పుడు, ఆ amount మొత్తం మొత్తానికి జోడించబడాలి అని మనం కోరుకుంటున్నాం.

```swift id="swsj75"
Button("Save") {
    amount += number
}
```

ఇక్కడ, “compound assignment operator” ను ఉపయోగించి, వినియోగదారు input చేసిన amount number ను మొత్తం amount లో జోడిస్తున్నాం.

### Input amount ను reset చేయడం

ఇప్పుడు ఒక సమస్య ఉంది: ప్రతి సారి button ను నొక్కిన తర్వాత, input box లోని amount clear కావడం లేదు.

వినియోగదారు 10 ను input చేసి save నొక్కినప్పుడు, input box లో ఇంకా 10 అలాగే ఉంటుంది. ఇది తరువాతి input పై ప్రభావం చూపిస్తుంది.

దానికి కారణం, TextField number కు bind అయి ఉండటం. Button ను నొక్కినప్పుడు, మనం amount ను మాత్రమే మార్చుతున్నాం; number మార్చడం లేదు. కాబట్టి input box పాత value నే చూపిస్తుంది.

కాబట్టి ఒక clear logic ను జోడించాలి. Button ను నొక్కిన తర్వాత, ముందుగా amount ను జోడించి, తర్వాత input amount ను reset చేయాలి:

```swift id="hk1m61"
Button("Save") {
    amount += number
	number = 0
}
```

ఇప్పుడు, వినియోగదారు amount ను input చేసి button ను నొక్కినప్పుడు, ఆ amount మొత్తం మొత్తానికి జోడించబడుతుంది. number 0 గా reset అవుతుంది, తద్వారా వినియోగదారు తదుపరి input ను సులభంగా చేయగలడు.

ఇలా మనం “పిగ్గీ బ్యాంక్” యొక్క మొత్తం save logic ను అమలు చేశాం.

## View ను మెరుగుపరచడం

Function పూర్తి అయిన తర్వాత, interface ను కొంత మెరుగుపరచవచ్చు. ఉదాహరణకు, background image మరియు button style ను జోడించవచ్చు.

Button style ను జోడించడం:

```swift id="mu9nsf"
.buttonStyle(.borderedProminent)
```

Background image ను జోడించడం:

```swift id="r24lrn"
.background {
    Image("1")
}
```

ఇప్పుడు, మనం మొత్తం “పిగ్గీ బ్యాంక్” అభివృద్ధి పనిని పూర్తి చేశాం.

## పూర్తి కోడ్

```swift id="s7oejt"
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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

అమలు ఫలితం:

![Piggy Bank](../../RESOURCE/014_view.png)

ఇప్పుడు, “పిగ్గీ బ్యాంక్” logic లో ఏమైనా సమస్య ఉందో లేదో పరీక్షించడానికి, మనం 100 లేదా అంతకంటే ఎక్కువ డబ్బును save చేసి చూడవచ్చు.

లేదా, “పిగ్గీ బ్యాంక్” ను simulator లేదా physical device లో నడిపి, మనం అభివృద్ధి చేసిన ఈ app ను అనుభవించవచ్చు.

### Debug output

Logic సరిగ్గా పని చేస్తుందో లేదో verify చేయడానికి, button లో debug logic ను కూడా జోడించవచ్చు. దీని ద్వారా input చేసిన amount సరిగ్గా ఉందో చూడవచ్చు:

```swift id="c4n4ee"
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ప్రతి సారి డబ్బు save చేసి button ను నొక్కినప్పుడు, మనం సంబంధిత debug output ను చూడగలం. దీని ద్వారా code logic లో సమస్య ఉందో లేదో పరిశీలించవచ్చు.

```swift id="mkyhgv"
---Saving---
amount:11
number:0
```
