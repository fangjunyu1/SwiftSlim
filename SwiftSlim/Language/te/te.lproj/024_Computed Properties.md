# గణించబడే ప్రాపర్టీ

ఈ పాఠంలో మనం ప్రధానంగా computed property గురించి నేర్చుకుంటాం.

Computed property అనేది ఇప్పటికే ఉన్న data ఆధారంగా కొత్త ఫలితాన్ని లెక్కించడానికి ఉపయోగిస్తారు. ఇది సంఖ్యా విలువలను లెక్కించగలదు. అలాగే SwiftUI view లో చూపించాల్సిన content ను కూడా లెక్కించగలదు.

ఉదాహరణకు:

```swift
let a = 10
let b = 20
let c = a + b
```

ఇక్కడ `c` అంటే `a` మరియు `b` కలిపిన తర్వాత వచ్చిన ఫలితం.

సాధారణ code లో ఇలాంటి రాయడం చాలా సాధారణం.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

సూచన: `Button` click event లో సాధారణ Swift code ను execute చేయవచ్చు.

కానీ ఇలాంటి code ను SwiftUI view యొక్క properties లో నేరుగా రాస్తే సమస్య వస్తుంది.

ఉదాహరణకు:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

ఈ code error చూపిస్తుంది.

చూడటానికి `a` మరియు `b` ఇప్పటికే `c` కంటే ముందు రాసినట్టుగా కనిపిస్తుంది. కాబట్టి `c` విలువను లెక్కించవచ్చు అనిపించవచ్చు.

కానీ struct లో properties declare చేసే సమయంలో, ఈ రీతిని నేరుగా ఉపయోగించలేము.

## c ను నేరుగా a + b గా ఎందుకు లెక్కించలేము?

ఎందుకంటే `a`, `b`, `c` అనేవి button click event లోని temporary constants కావు. అవి `ContentView` అనే view లోని properties.

Button click event లో ఈ code సాధారణంగా execute అవుతుంది:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

ఎందుకంటే button click చేసిన తర్వాత code క్రమంగా execute అవుతుంది. మొదట `a` సృష్టించబడుతుంది, తరువాత `b` సృష్టించబడుతుంది, చివరగా `a + b` ఉపయోగించి `c` లెక్కించబడుతుంది.

కానీ view లోపల properties declare చేసే సమయంలో పరిస్థితి వేరుగా ఉంటుంది:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

ఇక్కడ `a`, `b`, `c` అన్నీ `ContentView` view లోని properties.

`ContentView` view సృష్టించబడినప్పుడు, Swift ముందుగా ఈ properties ను సిద్ధం చేయాలి. సృష్టించే ప్రక్రియ సురక్షితంగా ఉండటానికి, Swift ఒక instance stored property యొక్క default value లో అదే instance లోని ఇతర instance properties ను నేరుగా చదవడానికి అనుమతించదు.

అందువల్ల ఈ line error చూపిస్తుంది:

```swift
let c = a + b
```

సులభంగా ఇలా అర్థం చేసుకోవచ్చు: **view లోపల properties declare చేసే సమయంలో, ఒక సాధారణ property ను ఉపయోగించి మరొక సాధారణ property ను నేరుగా లెక్కించలేము.**

ఇలా విలువను నేరుగా నిల్వ చేసే property ను “stored property” అంటారు. అర్థం చేసుకోవడానికి సులభంగా ఉండేందుకు, తాత్కాలికంగా దీనిని సాధారణ property గా భావించవచ్చు.

ఉదాహరణకు:

```swift
let a = 10
```

`a` లో `10` నిల్వ ఉంటుంది.

```swift
let b = 20
```

`b` లో `20` నిల్వ ఉంటుంది.

కానీ:

```swift
let c = a + b
```

ఇక్కడ `c` అనేది నేరుగా రాసిన fixed value కాదు. అది `a + b` ద్వారా లెక్కించబడాలని ఉద్దేశిస్తుంది.

ఇలాంటి “ఇప్పటికే ఉన్న data నుండి ఫలితాన్ని పొందే” పరిస్థితిలో computed property ఉపయోగించడం మరింత సరైనది.

దీనిని ఇలా మార్చవచ్చు:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

ఇక్కడ `c` ఒక computed property.

```swift
var c: Int {
    return a + b
}
```

దీనర్థం: **`c` ను ఉపయోగించాల్సినప్పుడు మాత్రమే `a` మరియు `b` చదవబడతాయి. తరువాత `a + b` ఫలితం return చేయబడుతుంది.**

ఉదాహరణకు:

```swift
Text("c: \(c)")
```

`Text` లో `c` చూపించబడినప్పుడు మాత్రమే `c` యొక్క లెక్కింపు జరుగుతుంది.

## Computed property అంటే ఏమిటి?

Computed property ఒక variable లా కనిపిస్తుంది, కానీ అది స్వయంగా data ను నిల్వ చేయదు.

ఉదాహరణకు:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

ఇక్కడ `c` ఒక computed property.

ఇది సాధారణ property లాగా fixed value ను నిల్వ చేయదు. ప్రతి సారి `c` చదవబడినప్పుడు, `{}` లోని code మళ్లీ execute అవుతుంది, తరువాత లెక్కించిన ఫలితం return చేయబడుతుంది.

దీనిని ఇలా అర్థం చేసుకోవచ్చు:

```swift
var c: Int {
    return a + b
}
```

`c` అవసరమైనప్పుడు `a + b` లెక్కించబడుతుంది.

కాబట్టి computed property ఈ పరిస్థితికి సరిపోతుంది: **ఒక ఫలితాన్ని ప్రత్యేకంగా నిల్వ చేయాల్సిన అవసరం లేదు, ఎందుకంటే అది ఇప్పటికే ఉన్న data నుండి లెక్కించవచ్చు.**

## ప్రాథమికంగా రాయడం

Computed property సాధారణంగా మూడు భాగాలను కలిగి ఉంటుంది:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` తో declare చేయడం

```swift
var c
```

Computed property తప్పనిసరిగా `var` తో declare చేయాలి. `let` ఉపయోగించలేము.

ఎందుకంటే computed property అనేది fixed stored value కాదు. అది ప్రతి సారి చదివినప్పుడు dynamically లెక్కించబడే ఫలితం.

### 2. Return type ను సూచించడం

```swift
var c: Int
```

Computed property return type ను సూచించాలి.

ఇక్కడ `c` చివరికి integer return చేస్తుంది, కాబట్టి type `Int`.

### 3. {} లోపల లెక్కింపు logic రాయడం

```swift
{
    return a + b
}
```

`{}` లోపల లెక్కింపు logic రాయబడుతుంది. ఇక్కడ return చేయబడే ఫలితం `a + b`.

## return keyword

Computed property ఒక ఫలితాన్ని return చేయాలి.

ఉదాహరణకు:

```swift
var c: Int {
    return a + b
}
```

ఇక్కడ `return` అంటే: `a + b` లెక్కింపు ఫలితాన్ని బయటకు return చేయడం.

Computed property లోపల నేరుగా ఫలితాన్ని ఇచ్చే ఒకే expression ఉంటే, `return` ను వదిలేయవచ్చు:

```swift
var c: Int {
    a + b
}
```

కానీ computed property లోపల అనేక lines code ఉంటే, ఫలితాన్ని స్పష్టంగా return చేయడానికి `return` ఉపయోగించాలి.

ఉదాహరణకు:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ఇక్కడ లెక్కింపు ప్రక్రియ రెండు దశలుగా విభజించబడింది.

మొదటి దశ, మొత్తం ధరను లెక్కించడం:

```swift
let total = count * price
```

రెండవ దశ, మొత్తం ధరను text గా కలిపి return చేయడం:

```swift
return "Total：\(total) $"
```

`return` ను తీసేస్తే:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

ఈ code error చూపిస్తుంది.

కారణం: **ఈ computed property లోపల ఇప్పటికే అనేక lines code ఉన్నాయి. Swift ఏ line చివరగా return చేయాల్సిన ఫలితం అనేది స్వయంగా నిర్ణయించలేకపోతుంది.**

కాబట్టి computed property లోపల ఫలితాన్ని ఇచ్చే ఒకే expression ఉంటే, `return` ను వదిలేయవచ్చు.

```swift
var c: Int {
    a + b
}
```

Computed property లోపల అనేక lines code ఉంటే, `return` ను స్పష్టంగా రాయడం మంచిది.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Computed property మరియు సాధారణ property మధ్య తేడా

సాధారణ property data ను నిల్వ చేస్తుంది.

```swift
var c = 30
```

ఇక్కడ `c` ఒక నిర్దిష్ట విలువను నిల్వ చేస్తుంది: `30`.

Computed property data ను నిల్వ చేయదు.

```swift
var c: Int {
    a + b
}
```

ఇక్కడ `c` `30` ను నిల్వ చేయదు. అది కేవలం లెక్కించే విధానాన్ని అందిస్తుంది.

`c` చదవబడినప్పుడు, Swift ఇది execute చేస్తుంది:

```swift
a + b
```

తర్వాత లెక్కించిన ఫలితాన్ని return చేస్తుంది.

కాబట్టి ఇతర data ఆధారంగా ఫలితాన్ని లెక్కించాల్సిన సందర్భాల్లో computed property సరైనది.

## body కూడా computed property

Computed property నేర్చుకున్న తర్వాత, SwiftUI లో చాలా సాధారణంగా కనిపించే ఈ code ను మళ్లీ అర్థం చేసుకోవచ్చు:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ఇక్కడ `body` కూడా ఒక computed property.

ఇది `var` తో declare చేయబడింది:

```swift
var body
```

దీనికి return type ఉంది:

```swift
some View
```

దీని `{}` లో return చేయబడేది SwiftUI view content:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

కాబట్టి `body` ను ఇలా అర్థం చేసుకోవచ్చు: SwiftUI ఈ view ను చూపించాల్సినప్పుడు, అది `body` ను చదివి, `body` return చేసిన content ఆధారంగా interface ను సృష్టిస్తుంది.

`return` రాస్తే, ఇలా అర్థం చేసుకోవచ్చు:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

కానీ SwiftUI లో సాధారణంగా మనం `return` ను వదిలేసి నేరుగా ఇలా రాస్తాం:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

`@State` data మారినప్పుడు, SwiftUI `body` ను మళ్లీ చదివి, కొత్త data ఆధారంగా interface ను update చేస్తుంది.

ఉదాహరణకు:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

button click చేసిన తర్వాత `count` మారుతుంది.

```swift
count += 1
```

`count` మారిన తర్వాత SwiftUI `body` ను మళ్లీ లెక్కిస్తుంది. అందువల్ల interface లోని text కూడా update అవుతుంది.

```swift
Text("count: \(count)")
```

SwiftUI లో data మారిన తర్వాత interface స్వయంగా refresh కావడానికి ఇదీ ఒక కారణం.

### body లో క్లిష్టమైన లెక్కింపులు రాయడం సిఫార్సు చేయబడదు

`body` computed property కాబట్టి, అది అనేకసార్లు చదవబడవచ్చు మరియు మళ్లీ లెక్కించబడవచ్చు.

ఉదాహరణకు:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

`name` మారినప్పుడు, SwiftUI `body` ను మళ్లీ లెక్కిస్తుంది.

ఆ సమయంలో `body` లోపల ఉన్న code కూడా మళ్లీ execute అవుతుంది, `num` కూడా మళ్లీ సృష్టించబడుతుంది.

```swift
let num = 10
```

ఈ ఉదాహరణలో `num` చాలా సులభమైనది, కాబట్టి ప్రభావం పెద్దది కాదు.

కానీ `body` లోపల పెద్ద మొత్తంలో data filtering, sorting, image processing వంటి క్లిష్టమైన లెక్కింపులు చేస్తే, interface smoothness పై ప్రభావం పడవచ్చు.

కాబట్టి SwiftUI లో `body` ప్రధానంగా interface structure ను వివరించే బాధ్యత మాత్రమే తీసుకోవాలి.

సులభమైన temporary data ను `body` లోపల రాయవచ్చు.

క్లిష్టమైన లెక్కింపులను `body` బయట ఉన్న computed property, method, లేదా ప్రత్యేక data processing భాగంలో ఉంచడం మంచిది.

## ఉదాహరణ: పరిమాణం మరియు మొత్తం ధర

ఇప్పుడు ఒక సులభమైన ఉదాహరణ ద్వారా computed property ను అర్థం చేసుకుందాం.

ఒక carrot ధర 2 $ అని ఊహిద్దాం. user button click చేసి కొనుగోలు పరిమాణాన్ని మార్చవచ్చు, interface లో మొత్తం ధర చూపించాలి.

మొత్తం ధర లెక్కించే విధానం:

```text
పరిమాణం * ఒక్కొక్కటి ధర
```

మొత్తం ధరను సాధారణ variable లో నిల్వ చేస్తే, అది కొంచెం ఇబ్బందికరంగా ఉంటుంది.

ఎందుకంటే ప్రతి సారి పరిమాణం మారినప్పుడు, మొత్తం ధరను చేతితో update చేయాలి.

దీనికంటే మంచి విధానం computed property ఉపయోగించడం:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

చూపించే ఫలితం:

![view](../../Resource/024_view.png)

ఈ ఉదాహరణలో:

```swift
@State private var count = 1
```

`count` carrot పరిమాణాన్ని సూచిస్తుంది. button click చేసినప్పుడు `count` మారుతుంది.

```swift
private let price = 2
```

`price` carrot యొక్క ఒక్కొక్కటి ధరను సూచిస్తుంది. ఇక్కడ ఇది fixed value, కాబట్టి `let` ఉపయోగించబడింది.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` మొత్తం ధరను సూచిస్తుంది.

దీనిని ప్రత్యేకంగా నిల్వ చేయాల్సిన అవసరం లేదు, ఎందుకంటే మొత్తం ధర ఎప్పుడూ `count * price` ద్వారా లెక్కించవచ్చు.

`count` `1` అయినప్పుడు:

```swift
totalPrice = 1 * 2
```

చూపించే ఫలితం:

```swift
totalPrice: 2 $
```

`+` button click చేసిన తర్వాత, `count` `2` అవుతుంది.

ఈ సమయంలో `totalPrice` మళ్లీ చదివితే, అది మళ్లీ లెక్కించబడుతుంది:

```swift
totalPrice = 2 * 2
```

చూపించే ఫలితం:

```swift
totalPrice: 4 $
```

ఇదే computed property పని: ఇప్పటికే ఉన్న data ఆధారంగా కొత్త ఫలితాన్ని dynamic గా లెక్కించడం.

## Computed property ను condition check కోసం కూడా ఉపయోగించవచ్చు

Computed property కేవలం సంఖ్యలను మాత్రమే లెక్కించదు, అది judgment result ను కూడా return చేయగలదు.

ఉదాహరణకు, మనం పరిమాణం కనీసం 1 గా ఉండాలని కోరుకుంటున్నాం.

పరిమాణం ఇప్పటికే 1 అయితే, `-` button మరింత తగ్గించకూడదు.

దీనికి ఒక computed property జోడించవచ్చు:

```swift
private var canDecrease: Bool {
    count > 1
}
```

పూర్తి code:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

చూపించే ఫలితం:

![view](../../Resource/024_view1.png)

ఇక్కడ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

ఈ code ప్రస్తుతం ఇంకా తగ్గించవచ్చా లేదా అనే విషయాన్ని సూచిస్తుంది.

`count` `1` కంటే ఎక్కువగా ఉన్నప్పుడు:

```swift
canDecrease == true
```

అంటే తగ్గించవచ్చు.

`count` `1` కు సమానంగా ఉన్నప్పుడు:

```swift
canDecrease == false
```

అంటే ఇక తగ్గించలేము.

### Button లో condition check

Button లో ఇది ఉపయోగించబడింది:

```swift
if canDecrease {
    count -= 1
}
```

`canDecrease` `true` అయినప్పుడు మాత్రమే `count` తగ్గుతుంది.

### View యొక్క foreground color నియంత్రించడం

`canDecrease` ఉపయోగించి button యొక్క foreground color ను కూడా నియంత్రించవచ్చు:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ఇక్కడ ternary operator ఉపయోగించబడింది:

```swift
canDecrease ? Color.primary : Color.gray
```

ఈ code అర్థం: `canDecrease` `true` అయితే foreground color `Color.primary`; `canDecrease` `false` అయితే foreground color `Color.gray`.

`Color.primary` అనేది SwiftUI అందించే system semantic color. ఇది ప్రస్తుత interface లోని main text color ను సూచిస్తుంది.

Light Mode లో `Color.primary` సాధారణంగా నలుపు రంగుకు దగ్గరగా ఉంటుంది; Dark Mode లో సాధారణంగా తెలుపు రంగుకు దగ్గరగా ఉంటుంది.

కాబట్టి `Color.primary` ఉపయోగించడంలో లాభం: ఇది Light Mode మరియు Dark Mode కు స్వయంగా సరిపోతుంది.

### View యొక్క disabled state నియంత్రించడం

`disabled` అనేది view disabled state లో ఉందా లేదా నియంత్రించడానికి ఉపయోగిస్తారు:

```swift
.disabled(!canDecrease)
```

`disabled` `false` అయితే, view click చేయవచ్చు.

`disabled` `true` అయితే, view disabled state లో ఉంటుంది మరియు click చేయలేము.

ఇక్కడ `canDecrease` ను condition గా ఉపయోగించడం వల్ల code అర్థం చేసుకోవడం సులభమవుతుంది.

`canDecrease` కనిపించినప్పుడు, అది “ప్రస్తుతం ఇంకా తగ్గించవచ్చా” అనే అర్థం ఇస్తుందని తెలుసుకోవచ్చు.

### అదనపు వివరణ: ఎందుకు రెండు సార్లు check చేస్తున్నాం?

`-` button లో:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ఇక్కడ `.disabled(!canDecrease)` కూడా ఉపయోగించబడింది, అలాగే button లోపల `if canDecrease` కూడా ఉపయోగించబడింది.

`.disabled(!canDecrease)` interface level లో button ను disabled చేస్తుంది, user దాన్ని click చేయలేని విధంగా చేస్తుంది.

`if canDecrease` code execute అవ్వడానికి ముందు మరోసారి check చేస్తుంది. తగ్గించగలిగినప్పుడు మాత్రమే `count -= 1` execute అవుతుంది.

ఇది double protection. నిజమైన development లో, button ఇప్పటికే disabled అయితే, లోపలి condition ను వదిలేయవచ్చు. కానీ teaching example లో దీనిని ఉంచితే `canDecrease` పాత్ర మరింత స్పష్టంగా కనిపిస్తుంది.

## సారాంశం

ఈ పాఠంలో మనం ప్రధానంగా computed property గురించి నేర్చుకున్నాం.

Computed property విలువను నేరుగా నిల్వ చేయదు. అది చదవబడినప్పుడు, ఇప్పటికే ఉన్న data ఆధారంగా ఫలితాన్ని లెక్కిస్తుంది.

ఉదాహరణకు:

```swift
var c: Int {
    a + b
}
```

ఇక్కడ `c` ను ప్రత్యేకంగా నిల్వ చేయాల్సిన అవసరం లేదు, ఎందుకంటే అది `a + b` ద్వారా లెక్కించవచ్చు.

Computed property తప్పనిసరిగా `var` తో declare చేయాలి, మరియు return type ను సూచించాలి.

```swift
var canDecrease: Bool {
    count > 1
}
```

Computed property కేవలం సంఖ్యా విలువలను మాత్రమే కాకుండా, judgment result, text content, అంతేకాక SwiftUI view content ను కూడా return చేయగలదు.

ఈ పాఠంలో మనం `return` కూడా నేర్చుకున్నాం.

`return` అంటే ఒక ఫలితాన్ని return చేయడం:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Computed property లోపల నేరుగా ఫలితాన్ని ఇచ్చే ఒకే expression ఉంటే, `return` ను వదిలేయవచ్చు.

```swift
var totalPrice: Int {
    count * price
}
```

అదనంగా, మనం `Color.primary` మరియు `disabled` గురించి కూడా తెలుసుకున్నాం.

`Color.primary` అనేది SwiftUI యొక్క system semantic color. ఇది Light Mode మరియు Dark Mode ప్రకారం display effect ను స్వయంగా adjust చేస్తుంది.

```swift
.foregroundStyle(Color.primary)
```

`disabled` అనేది view disabled లో ఉందా లేదా నియంత్రించడానికి ఉపయోగిస్తారు.

```swift
.disabled(true)
```

దీనర్థం disabled, click చేయలేము.

```swift
.disabled(false)
```

దీనర్థం available, click చేయవచ్చు.

కాబట్టి computed property SwiftUI లో చాలా సాధారణంగా ఉపయోగించబడుతుంది. ఇది calculation results, conditions, display content ను మరింత స్పష్టంగా organize చేయడంలో సహాయపడుతుంది.
