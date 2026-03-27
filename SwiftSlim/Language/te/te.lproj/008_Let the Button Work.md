# బటన్‌ను పనిచేయించడం ప్రారంభిద్దాం

ఈ పాఠంలో ప్రధానంగా SwiftUI లోని Button బటన్, print ద్వారా debug సమాచారం output చేయడం, అలాగే Swift functions గురించి నేర్చుకుంటాము.

ఈ విషయాలు SwiftUI లో interactive programming కు ప్రాథమిక పునాది.

## బటన్

బటన్ అనేది మనం ఎక్కువగా ఉపయోగించే UI control. Download, open, exit వంటి చర్యలు చేయాల్సి వచ్చినప్పుడు, సాధారణంగా మనం బటన్‌ను నొక్కుతాము.

ఉదాహరణకు, App Store లో “Get” బటన్‌ను నొక్కి App ను download చేస్తారు.

![Button](../../RESOURCE/008_button.png)

SwiftUI లో, బటన్‌ను Button ద్వారా సూచిస్తారు.

ప్రాథమిక వాడుక:

```swift
Button("") {
    
}
```

దీని నిర్మాణాన్ని రెండు భాగాలుగా చూడవచ్చు:

```swift
Button("按钮文字") {
    点击按钮时执行的代码
}
```

ఉదాహరణకు:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Run చేసిన తర్వాత, ఒక Start బటన్ కనిపిస్తుంది.

![Button](../../RESOURCE/008_button1.png)

వినియోగదారుడు బటన్‌ను నొక్కినప్పుడు, `{}` లోని code అమలవుతుంది.

గమనించాల్సిన విషయం ఏమిటంటే: Button అనేది SwiftUI యొక్క interface control (View). కాబట్టి ఇది తప్పనిసరిగా body లో రాయాలి.

### buttonStyle modifier

SwiftUI లో, Button కు system అందించే built-in button styles ఉంటాయి. వాటిని buttonStyle modifier ద్వారా ఉపయోగించవచ్చు.

ఉదాహరణకు:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle ద్వారా system అందించే button style ఉపయోగించబడుతుంది.

సాధారణ ఎంపికలు ఇవి:

* .automatic
* .plain
* .bordered
* .borderedProminent
* .borderless

![Button](../../RESOURCE/008_button7.png)

వేర్వేరు styles మధ్య ప్రధాన తేడాలు ఏమిటంటే: బటన్‌కు border ఉందా, background ఉందా, visual emphasis ఎంత ఉందా అనే అంశాలు.

## print output

Programming లో, program ఒక నిర్దిష్ట code భాగం వరకూ నిజంగా run అయిందో లేదో తెలుసుకోవాల్సిన అవసరం తరచుగా వస్తుంది.

దీనికోసం Swift లో print function ఉంటుంది. ఇది debug సమాచారం output చేయడానికి ఉపయోగపడుతుంది.

ప్రాథమిక రాత:

```swift
print("Hello")
```

ఈ code, text ను Console లో output చేస్తుంది.

### బటన్ పనిచేస్తుందో లేదో పరీక్షించడం

బటన్ నిజంగా click అవుతోందా అని పరీక్షించడానికి, మనం button లో print రాయవచ్చు.

```swift
Button("Start") {
    print("Test 123")
}
```

బటన్‌ను నొక్కినప్పుడు, Console లో ఇది కనిపిస్తుంది:

```text
Test 123
```

అంటే బటన్ click event విజయవంతంగా పనిచేసిందని అర్థం.

![Button](../../RESOURCE/008_button3.png)

గమనిక: print అనేది Swift code, interface control కాదు. కాబట్టి దీన్ని నేరుగా body లో పెట్టలేము. అలా పెడితే error వస్తుంది.

ఉదాహరణకు, ఈ రాత తప్పు:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // తప్పు: body తప్పనిసరిగా ఒక View ను return చేయాలి
    }
}
```

SwiftUI లో, body అనేది interface నిర్మాణాన్ని వివరించడానికి ఉపయోగిస్తారు. అందులో కేవలం interface controls (View) మాత్రమే ఉంచాలి. ఉదాహరణకు Text, Button, Image వంటి వాటిని.

సాధారణ code అయిన calculation logic, print వంటివి button, function లేదా ఇతర event handler లో ఉండాలి.

### Console నియంత్రణ పలక

print ద్వారా output అయ్యే కంటెంట్ Xcode లోని Console లో కనిపిస్తుంది.

ఒకవేళ Console కనిపించకపోతే, కుడి దిగువ మూలలో ఉన్న Show the Debug Area బటన్‌ను నొక్కి debug area ను తెరవండి. ఆ తరువాత Show the Console బటన్‌ను నొక్కి Console ను చూపించండి.

![](../../RESOURCE/008_button4.png)

Console కింది ఎడమ మూలలో రెండు tabs ఉంటాయి: Executable మరియు Previews.

![](../../RESOURCE/008_button5.png)

ఈ రెండు tabs వేర్వేరు run environments కు సంబంధించినవి. Canvas preview లో ఉన్నప్పుడు, print output Previews tab లో కనిపిస్తుంది. Simulator లేదా నిజమైన పరికరంలో App run చేసినప్పుడు, output Executable tab లో కనిపిస్తుంది.

కాబట్టి, ఒకవేళ print output కనిపించకపోతే, ముందుగా మీరు సరైన tab ను ఎంచుకున్నారా అని చూసుకోవాలి.

## ఉదాహరణ - ASCII character art

కొన్ని code projects లో, ASCII character art ను తరచుగా చూస్తాము.

Character art అనేది సాధారణ characters తో ఒక చిత్రం తయారు చేసే విధానం. ఉదాహరణకు:

![ASCII](../../RESOURCE/008_ascii.png)

మనము button + print ఉపయోగించి ఒక ASCII character art ను output చేయవచ్చు.

ఉదాహరణ code:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

బటన్‌ను నొక్కినప్పుడు, Console లో ఇది కనిపిస్తుంది:

```text
 /\_/\
( o.o )
 > ^ <
```

గమనిక: string లోని `\` ను `\\` గా రాయాలి, ఎందుకంటే backslash అనేది string లో escape character.

## Functions

బటన్‌లో మనం నేరుగా code రాయవచ్చు.

ఉదాహరణకు:

```swift
Button("Start") {
    print("Hello")
}
```

Code తక్కువగా ఉన్నప్పుడు, ఇలా రాయడం సరిపోతుంది. కానీ వాస్తవ development లో, ఒక బటన్ click అయ్యేటప్పుడు చాలా logic run కావచ్చు.

ఉదాహరణకు:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // ఇంకా చాలా code ఉండవచ్చు
}
```

Code పెరుగుతూ పోతే, అన్నీ button లోపలే రాయడం వల్ల interface code గందరగోళంగా మారుతుంది. చదవడం, నిర్వహించడం కూడా కష్టమవుతుంది.

అందువల్ల, సాధారణంగా మనం ఈ code ను ఒక function లో ఉంచి, button లో ఆ function ను call చేస్తాము.

### Function అంటే ఏమిటి

Function అనేది మళ్లీ మళ్లీ ఉపయోగించగల ఒక code భాగం.

ఒక నిర్దిష్ట పని చేయాలి అనుకున్నప్పుడు, మనం ఆ function ను call చేస్తే చాలు. అప్పుడు function లోపలి code run అవుతుంది.

ఇలా చేస్తే code structure మరింత స్పష్టంగా ఉంటుంది. అలాగే code ను మళ్లీ ఉపయోగించడమూ సులభమవుతుంది.

### ప్రాథమిక రాత

Swift లో, function ను **func** keyword తో define చేస్తారు:

```swift
func randomInt() {
    // code
}
```

ఈ code ఒక function ను define చేస్తుంది.

randomInt అనేది function పేరు. ఇది ఆ code భాగాన్ని గుర్తించడానికి ఉపయోగించబడుతుంది.

`()` అనేది parameters కోసం ఉన్న స్థానం. అవసరమైతే ఇక్కడ బయట నుంచి data తీసుకోవచ్చు. అవసరం లేకపోతే ఖాళీగా ఉంచవచ్చు.

`{}` లో function యొక్క code area ఉంటుంది. అమలు చేయాల్సిన అన్ని code ఇక్కడే రాయాలి.

ఉదాహరణకు:

```swift
func getName() {
    print("FangJunyu")
}
```

ఈ function పని ఏమిటంటే ఒక text ను output చేయడం.

### Function ను call చేయడం

Function ను define చేయడం అంటే ఆ code భాగాన్ని తయారు చేయడం మాత్రమే. దాన్ని నిజంగా run చేయాలంటే, function ను call చేయాలి.

Call చేసే విధానం: function పేరుకు తరువాత `()` జోడించడం.

```swift
getName()
```

Program ఈ line వద్దకు వచ్చినప్పుడు, getName function లోపలి code అమలవుతుంది.

పూర్తి ఉదాహరణ:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Run చేసిన తర్వాత, Console లో ఇది కనిపిస్తుంది:

```text
FangJunyu
```

### SwiftUI లో function ను ఉపయోగించడం

SwiftUI view లో, functions సాధారణంగా body బయట రాయబడతాయి.

ఉదాహరణకు:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

బటన్‌ను నొక్కినప్పుడు, getName() function call అవుతుంది.

ఇలా చేస్తే interface code సులభంగా ఉంటుంది. అసలు logic మాత్రం function లో handle అవుతుంది.

### Function parameters

కొన్నిసార్లు, ఒక function వేర్వేరు data ఆధారంగా వేర్వేరు పనులు చేయాలి.

ఉదాహరణకు, function ఎప్పుడూ `"FangJunyu"` అనే ఒకే పేరు కాకుండా, వేర్వేరు పేర్లను output చేయాలని అనుకుందాం.

అప్పుడు parameters ఉపయోగించవచ్చు. Parameter అనేది function ను call చేసినప్పుడు అందించే data అని అర్థం చేసుకోవచ్చు.

ఉదాహరణకు:

```swift
func getName(name: String) {
    print(name)
}
```

ఈ function లో ఒక కొత్త parameter జోడించబడింది. name అనేది parameter పేరు, String అనేది parameter type.

అంటే ఈ function ఒక String type data ను తప్పనిసరిగా స్వీకరించాలి.

Function ఇప్పుడు data అవసరం పడుతుంది కాబట్టి, call చేసే సమయంలో ఆ data ఇవ్వాలి.

```swift
getName(name: "Sam")
```

ఇక్కడ `"Sam"` ను పంపితే, function లోపల అది ఉపయోగించబడుతుంది.

ఫలితం:

```text
Sam
```

## ఉదాహరణ - function ద్వారా ASCII character art ను output చేయడం

ముందటి ఉదాహరణలో, మనం print ను నేరుగా button లోపల రాశాము.

కానీ character art కాస్త క్లిష్టంగా ఉంటే, code చాలా పొడవుగా మారుతుంది. అప్పుడు ఆ logic ను function లో పెట్టడం మంచిది. దీంతో interface code మరింత స్పష్టంగా ఉంటుంది.

ఉదాహరణ code:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Run చేసిన తర్వాత బటన్‌ను నొక్కితే, Console లో ఇది కనిపిస్తుంది:

```text
 /\_/\
( o.o )
 > ^ <
```

ఇక్కడ రెండు విషయాలు జరుగుతున్నాయి. వినియోగదారుడు బటన్‌ను నొక్కిన తర్వాత:

1. Button, printCat() function ను call చేస్తుంది
2. Function లోని print code అమలవుతుంది

ఇలా చేస్తే interface code కేవలం event ను trigger చేయడమే చేస్తుంది. అసలు logic ను function handle చేస్తుంది.

వాస్తవ development లో, ఎక్కువ భాగం buttons ఇలాగే functions ద్వారా పని చేస్తాయి.

## సారాంశం

ఈ పాఠంలో మనం మూడు ముఖ్యమైన విషయాలు నేర్చుకున్నాము:

**1. Button బటన్**

Button అనేది SwiftUI లో ఒక action ను trigger చేయడానికి ఉపయోగించే control.

```swift
Button("Start") {

}
```

వినియోగదారుడు button ను నొక్కినప్పుడు, curly braces లోని code అమలవుతుంది.

**2. print output**

print అనేది debug సమాచారాన్ని Console లో output చేయడానికి ఉపయోగిస్తారు.

```swift
print("Hello")
```

ద్వారా developer program run స్థితిని Console లో చూడవచ్చు.

**3. Functions**

Function అనేది మళ్లీ ఉపయోగించగల ఒక code భాగం.

```swift
func sayHello() {
    print("Hello")
}
```

Function ను call చేయడం:

```swift
sayHello()
```

Function కు data అవసరమైతే, parameter ఉపయోగించవచ్చు:

```swift
func sayHello(name: String) {
    print(name)
}
```

తరువాతి పాఠాల్లో, మనం ఇంకా ఎక్కువ SwiftUI controls మరియు data interface తో ఎలా interact అవుతుందో నేర్చుకుంటాము.

## అభ్యాసం

క్రింది అభ్యాసాలను పూర్తి చేయడానికి ప్రయత్నించండి:

1. "Hello" అనే text ఉన్న ఒక button ను సృష్టించండి
2. బటన్‌ను నొక్కినప్పుడు, Console లో `Hello Swift` ను output చేయండి
3. ఈ output code ను ఒక function లో రాసి, button లో ఆ function ను call చేయండి
