# गणना केलेली प्रॉपर्टी

या धड्यात आपण मुख्यतः गणना केलेली प्रॉपर्टी शिकणार आहोत.

गणना केलेली प्रॉपर्टी आधीपासून असलेल्या डेटावर आधारित नवीन परिणाम काढण्यासाठी वापरली जाते. ती संख्यात्मक मूल्ये मोजू शकते, तसेच SwiftUI view मध्ये दाखवायचा मजकूर किंवा सामग्री देखील तयार करू शकते.

उदाहरणार्थ:

```swift
let a = 10
let b = 20
let c = a + b
```

येथे `c` म्हणजे `a` आणि `b` यांची बेरीज केल्यानंतर मिळणारा परिणाम.

सामान्य कोडमध्ये अशा प्रकारची लिहिण्याची पद्धत खूप सामान्य आहे.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

सूचना: `Button` च्या क्लिक इव्हेंटमध्ये सामान्य Swift कोड चालवता येतो.

पण जर अशाच प्रकारचा कोड थेट SwiftUI view च्या प्रॉपर्टीमध्ये लिहिला, तर समस्या येते.

उदाहरणार्थ:

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

हा कोड त्रुटी दाखवेल.

वरून पाहताना `a` आणि `b` आधी लिहिलेले दिसतात, त्यामुळे `c` चे मूल्य काढता येईल असे वाटू शकते.

परंतु struct च्या प्रॉपर्टी घोषित करताना ही पद्धत थेट वापरता येत नाही.

## c ला थेट a + b म्हणून का मोजता येत नाही?

कारण `a`, `b`, `c` हे बटणाच्या क्लिक इव्हेंटमधील तात्पुरते constants नाहीत. ते `ContentView` या view मधील प्रॉपर्टीज आहेत.

बटणाच्या क्लिक इव्हेंटमध्ये हा कोड सामान्यपणे चालतो:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

कारण बटण क्लिक झाल्यानंतर कोड क्रमाने चालतो. आधी `a` तयार होते, मग `b` तयार होते, आणि शेवटी `a + b` वापरून `c` मोजले जाते.

पण view च्या आत प्रॉपर्टीज घोषित करताना परिस्थिती वेगळी असते:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

येथे `a`, `b`, `c` ही सर्व `ContentView` या view मधील प्रॉपर्टीज आहेत.

`ContentView` view तयार होताना Swift ला आधी या प्रॉपर्टीज तयार कराव्या लागतात. तयार करण्याची प्रक्रिया सुरक्षित राहावी म्हणून Swift एका instance stored property च्या default value मध्ये त्याच instance मधील इतर instance properties थेट वाचण्याची परवानगी देत नाही.

म्हणून ही ओळ त्रुटी दाखवते:

```swift
let c = a + b
```

सोप्या भाषेत असे समजू शकतो: **view च्या आत प्रॉपर्टीज घोषित करताना, एका सामान्य प्रॉपर्टीचा वापर करून दुसरी सामान्य प्रॉपर्टी थेट मोजता येत नाही.**

अशी प्रॉपर्टी जी मूल्य थेट साठवते, तिला “stored property” म्हणतात. समजण्यास सोपे जावे म्हणून आपण तिला तात्पुरती सामान्य प्रॉपर्टी असे समजू शकतो.

उदाहरणार्थ:

```swift
let a = 10
```

`a` मध्ये `10` साठवलेले आहे.

```swift
let b = 20
```

`b` मध्ये `20` साठवलेले आहे.

पण:

```swift
let c = a + b
```

येथे `c` हे थेट लिहिलेले निश्चित मूल्य नाही. ते `a + b` वापरून मोजले जावे अशी अपेक्षा आहे.

अशा “आधीपासून असलेल्या डेटावरून परिणाम मिळवण्याच्या” परिस्थितीत गणना केलेली प्रॉपर्टी वापरणे अधिक योग्य असते.

हे असे बदलू शकतो:

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

येथील `c` ही गणना केलेली प्रॉपर्टी आहे.

```swift
var c: Int {
    return a + b
}
```

याचा अर्थ असा: **जेव्हा `c` वापरण्याची गरज असते, तेव्हा `a` आणि `b` वाचले जातात आणि `a + b` चा परिणाम परत केला जातो.**

उदाहरणार्थ:

```swift
Text("c: \(c)")
```

`Text` मध्ये `c` दाखवताना `c` ची गणना चालू होते.

## गणना केलेली प्रॉपर्टी म्हणजे काय?

गणना केलेली प्रॉपर्टी variable सारखी दिसते, पण ती स्वतः डेटा साठवत नाही.

उदाहरणार्थ:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

येथील `c` ही गणना केलेली प्रॉपर्टी आहे.

ती सामान्य प्रॉपर्टीसारखे एक निश्चित मूल्य साठवत नाही. प्रत्येक वेळी `c` वाचल्यावर `{}` मधील कोड पुन्हा चालतो आणि मोजलेला परिणाम परत करतो.

याला असे समजू शकतो:

```swift
var c: Int {
    return a + b
}
```

जेव्हा `c` ची गरज असते, तेव्हा `a + b` मोजले जाते.

म्हणून गणना केलेली प्रॉपर्टी या परिस्थितीसाठी योग्य आहे: **एखादा परिणाम वेगळा साठवण्याची गरज नसते, कारण तो आधीपासून असलेल्या डेटावरून मोजता येतो.**

## मूलभूत लिहिण्याची पद्धत

गणना केलेल्या प्रॉपर्टीमध्ये सामान्यतः तीन भाग असतात:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` वापरून घोषित करणे

```swift
var c
```

गणना केलेली प्रॉपर्टी नेहमी `var` वापरून घोषित करावी लागते. `let` वापरता येत नाही.

कारण गणना केलेली प्रॉपर्टी हे स्थिरपणे साठवलेले मूल्य नसते. ती प्रत्येक वेळी वाचली असता dynamic पद्धतीने मोजला जाणारा परिणाम असतो.

### 2. return type लिहिणे

```swift
var c: Int
```

गणना केलेल्या प्रॉपर्टीला return type लिहावा लागतो.

येथे `c` शेवटी एक integer परत करतो, म्हणून type `Int` आहे.

### 3. {} मध्ये गणनेचे logic लिहिणे

```swift
{
    return a + b
}
```

`{}` मध्ये गणनेचे logic लिहिले जाते. येथे परत केला जाणारा परिणाम `a + b` आहे.

## return keyword

गणना केलेल्या प्रॉपर्टीने एक परिणाम परत करणे आवश्यक असते.

उदाहरणार्थ:

```swift
var c: Int {
    return a + b
}
```

येथे `return` म्हणजे `a + b` चा मोजलेला परिणाम बाहेर परत करणे.

जर गणना केलेल्या प्रॉपर्टीमध्ये थेट परिणाम देणारी फक्त एक expression असेल, तर `return` वगळता येते:

```swift
var c: Int {
    a + b
}
```

पण जर गणना केलेल्या प्रॉपर्टीमध्ये अनेक ओळींचा कोड असेल, तर परिणाम स्पष्टपणे परत करण्यासाठी `return` वापरावे लागते.

उदाहरणार्थ:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

येथे गणना दोन टप्प्यांत विभागली आहे.

पहिला टप्पा म्हणजे एकूण किंमत मोजणे:

```swift
let total = count * price
```

दुसरा टप्पा म्हणजे एकूण किंमत text मध्ये जोडून परत करणे:

```swift
return "Total：\(total) $"
```

जर `return` काढले तर:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

हा कोड त्रुटी दाखवेल.

कारण: **या गणना केलेल्या प्रॉपर्टीमध्ये आधीच अनेक ओळींचा कोड आहे. Swift ला कोणती ओळ अंतिम परत करायचा परिणाम आहे हे आपोआप ठरवता येत नाही.**

म्हणून, गणना केलेल्या प्रॉपर्टीमध्ये परिणाम देणारी एकच expression असेल, तर `return` वगळता येते.

```swift
var c: Int {
    a + b
}
```

गणना केलेल्या प्रॉपर्टीमध्ये अनेक ओळींचा कोड असेल, तर `return` स्पष्टपणे लिहिणे चांगले.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## गणना केलेली प्रॉपर्टी आणि सामान्य प्रॉपर्टी यातील फरक

सामान्य प्रॉपर्टी डेटा साठवते.

```swift
var c = 30
```

येथे `c` एक ठराविक मूल्य साठवते: `30`.

गणना केलेली प्रॉपर्टी डेटा साठवत नाही.

```swift
var c: Int {
    a + b
}
```

येथे `c` `30` साठवत नाही. ती फक्त गणना करण्याची पद्धत देते.

जेव्हा `c` वाचले जाते, तेव्हा Swift हा कोड चालवतो:

```swift
a + b
```

मग मोजलेला परिणाम परत करतो.

म्हणून इतर डेटावरून परिणाम काढायचा असेल, अशा परिस्थितीत गणना केलेली प्रॉपर्टी योग्य असते.

## body देखील गणना केलेली प्रॉपर्टी आहे

गणना केलेली प्रॉपर्टी शिकल्यानंतर, SwiftUI मध्ये सर्वात जास्त दिसणारा हा कोड आपण नव्याने समजू शकतो:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

येथील `body` देखील एक गणना केलेली प्रॉपर्टी आहे.

ती `var` वापरून घोषित केलेली आहे:

```swift
var body
```

तिचा return type आहे:

```swift
some View
```

तिच्या `{}` मध्ये परत केले जाणारे SwiftUI view content आहे:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

म्हणून `body` असे समजू शकतो: जेव्हा SwiftUI ला हा view दाखवायचा असतो, तेव्हा ते `body` वाचते आणि `body` ने परत केलेल्या content वर आधारित interface तयार करते.

जर `return` लिहिले, तर असे समजू शकतो:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

पण SwiftUI मध्ये आपण सामान्यतः `return` वगळतो आणि थेट असे लिहितो:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

जेव्हा `@State` डेटा बदलतो, तेव्हा SwiftUI `body` पुन्हा वाचते आणि नवीन डेटानुसार interface अपडेट करते.

उदाहरणार्थ:

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

बटण क्लिक केल्यानंतर `count` बदलतो.

```swift
count += 1
```

`count` बदलल्यानंतर SwiftUI `body` पुन्हा मोजते, त्यामुळे interface मधील text देखील अपडेट होते.

```swift
Text("count: \(count)")
```

SwiftUI मध्ये डेटा बदलल्यानंतर interface आपोआप refresh होण्याचे हे देखील कारण आहे.

### body मध्ये जटिल गणना लिहिणे सुचवले जात नाही

कारण `body` ही गणना केलेली प्रॉपर्टी आहे, त्यामुळे ती अनेक वेळा वाचली आणि पुन्हा मोजली जाऊ शकते.

उदाहरणार्थ:

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

जेव्हा `name` बदलतो, तेव्हा SwiftUI `body` पुन्हा मोजते.

तेव्हा `body` मधील कोडही पुन्हा चालतो, आणि `num` देखील पुन्हा तयार होतो.

```swift
let num = 10
```

या उदाहरणातील `num` खूप सोपा आहे, त्यामुळे त्याचा फारसा परिणाम होत नाही.

पण जर `body` मध्ये मोठ्या प्रमाणातील डेटा filtering, sorting, image processing यांसारख्या जटिल गणना केल्या, तर interface च्या smoothness वर परिणाम होऊ शकतो.

म्हणून SwiftUI मध्ये `body` ने मुख्यतः interface ची रचना वर्णन करावी.

सोपे तात्पुरते डेटा `body` मध्ये लिहू शकतो.

जटिल गणना `body` च्या बाहेरील गणना केलेल्या प्रॉपर्टीमध्ये, method मध्ये किंवा स्वतंत्र data processing भागात ठेवणे चांगले.

## उदाहरण: संख्या आणि एकूण किंमत

आता एका सोप्या उदाहरणातून गणना केलेली प्रॉपर्टी समजून घेऊ.

समजा एका carrot ची किंमत 2 $ आहे. वापरकर्ता बटण क्लिक करून खरेदीची संख्या बदलू शकतो, आणि interface मध्ये एकूण किंमत दाखवायची आहे.

एकूण किंमत मोजण्याची पद्धत:

```text
संख्या * प्रति वस्तू किंमत
```

जर एकूण किंमत सामान्य variable मध्ये साठवली, तर ते थोडे त्रासदायक होईल.

कारण प्रत्येक वेळी संख्या बदलल्यावर एकूण किंमत हाताने update करावी लागेल.

यापेक्षा चांगली पद्धत म्हणजे गणना केलेली प्रॉपर्टी वापरणे:

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

दिसणारा परिणाम:

![view](../../Resource/024_view.png)

या उदाहरणात:

```swift
@State private var count = 1
```

`count` carrot ची संख्या दर्शवते. बटण क्लिक केल्यावर `count` बदलतो.

```swift
private let price = 2
```

`price` carrot ची प्रति वस्तू किंमत दर्शवते. येथे ती fixed value आहे, म्हणून `let` वापरले आहे.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` एकूण किंमत दर्शवते.

ती वेगळी साठवण्याची गरज नाही, कारण एकूण किंमत नेहमी `count * price` वापरून मोजता येते.

जेव्हा `count` `1` असतो:

```swift
totalPrice = 1 * 2
```

दाखवला जाणारा परिणाम:

```swift
totalPrice: 2 $
```

`+` बटण क्लिक केल्यानंतर `count` `2` होतो.

तेव्हा `totalPrice` पुन्हा वाचल्यावर, तो पुन्हा मोजला जातो:

```swift
totalPrice = 2 * 2
```

दाखवला जाणारा परिणाम:

```swift
totalPrice: 4 $
```

हीच गणना केलेल्या प्रॉपर्टीची भूमिका आहे: आधीपासून असलेल्या डेटावर आधारित नवीन परिणाम dynamic पद्धतीने मोजणे.

## गणना केलेली प्रॉपर्टी निर्णयासाठी वापरता येते

गणना केलेली प्रॉपर्टी फक्त संख्या मोजत नाही, ती निर्णयाचा परिणामही परत करू शकते.

उदाहरणार्थ, आपल्याला संख्या किमान 1 ठेवायची आहे.

संख्या आधीच 1 असेल, तर `-` बटणाने ती आणखी कमी होऊ नये.

यासाठी एक गणना केलेली प्रॉपर्टी जोडू शकतो:

```swift
private var canDecrease: Bool {
    count > 1
}
```

पूर्ण कोड:

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

दिसणारा परिणाम:

![view](../../Resource/024_view1.png)

येथे:

```swift
private var canDecrease: Bool {
    count > 1
}
```

हा कोड सध्या संख्या आणखी कमी करता येते का हे दर्शवतो.

जेव्हा `count` `1` पेक्षा मोठा असतो:

```swift
canDecrease == true
```

याचा अर्थ कमी करता येते.

जेव्हा `count` `1` असतो:

```swift
canDecrease == false
```

याचा अर्थ आणखी कमी करता येत नाही.

### बटणातील condition check

बटणात हा कोड वापरला आहे:

```swift
if canDecrease {
    count -= 1
}
```

फक्त `canDecrease` `true` असताना `count` कमी केला जातो.

### view चा foreground color नियंत्रित करणे

`canDecrease` वापरून बटणाचा foreground color देखील नियंत्रित करता येतो:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

येथे ternary operator वापरला आहे:

```swift
canDecrease ? Color.primary : Color.gray
```

या कोडचा अर्थ: जर `canDecrease` `true` असेल, तर foreground color `Color.primary` वापरला जाईल; जर `canDecrease` `false` असेल, तर foreground color `Color.gray` वापरला जाईल.

`Color.primary` हा SwiftUI ने दिलेला system semantic color आहे. तो सध्याच्या interface मधील मुख्य text color दर्शवतो.

Light Mode मध्ये `Color.primary` साधारणपणे काळ्या रंगाच्या जवळ असतो; Dark Mode मध्ये तो साधारणपणे पांढऱ्या रंगाच्या जवळ असतो.

म्हणून `Color.primary` वापरण्याचा फायदा असा की तो Light Mode आणि Dark Mode नुसार आपोआप जुळवून घेतो.

### view चा disabled state नियंत्रित करणे

`disabled` view disabled state मध्ये आहे की नाही हे नियंत्रित करण्यासाठी वापरले जाते:

```swift
.disabled(!canDecrease)
```

जेव्हा `disabled` `false` असते, तेव्हा view क्लिक करता येते.

जेव्हा `disabled` `true` असते, तेव्हा view disabled state मध्ये असते आणि क्लिक करता येत नाही.

येथे `canDecrease` condition म्हणून वापरल्यामुळे कोड समजायला सोपा होतो.

`canDecrease` पाहिल्यावर, ते “सध्या आणखी कमी करता येते का” हे दर्शवते हे लगेच कळते.

### अतिरिक्त स्पष्टीकरण: दोन वेळा तपासणी का?

`-` बटणात:

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

येथे `.disabled(!canDecrease)` देखील वापरले आहे, आणि बटणाच्या आत `if canDecrease` देखील वापरले आहे.

`.disabled(!canDecrease)` interface स्तरावर बटण disabled करते, त्यामुळे वापरकर्ता ते क्लिक करू शकत नाही.

`if canDecrease` कोड चालण्यापूर्वी पुन्हा एकदा तपासते. फक्त कमी करता येत असल्यास `count -= 1` चालते.

हे double protection आहे. प्रत्यक्ष development मध्ये, जर बटण आधीच disabled असेल, तर आतली condition वगळता येते. पण teaching example मध्ये ती ठेवली, तर `canDecrease` ची भूमिका अधिक स्पष्ट दिसते.

## सारांश

या धड्यात आपण मुख्यतः गणना केलेली प्रॉपर्टी शिकलो.

गणना केलेली प्रॉपर्टी मूल्य थेट साठवत नाही. ती वाचली गेल्यावर आधीपासून असलेल्या डेटावर आधारित परिणाम मोजते.

उदाहरणार्थ:

```swift
var c: Int {
    a + b
}
```

येथे `c` वेगळे साठवण्याची गरज नाही, कारण ते `a + b` वापरून मोजता येते.

गणना केलेली प्रॉपर्टी नेहमी `var` वापरून घोषित करावी लागते आणि return type लिहावा लागतो.

```swift
var canDecrease: Bool {
    count > 1
}
```

गणना केलेली प्रॉपर्टी फक्त संख्यात्मक मूल्यच नाही, तर निर्णयाचा परिणाम, text content, आणि अगदी SwiftUI view content देखील परत करू शकते.

या धड्यात आपण `return` देखील शिकलो.

`return` म्हणजे परिणाम परत करणे:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

जर गणना केलेल्या प्रॉपर्टीमध्ये परिणाम देणारी फक्त एक expression असेल, तर `return` वगळता येते.

```swift
var totalPrice: Int {
    count * price
}
```

तसेच आपण `Color.primary` आणि `disabled` बद्दलही जाणून घेतले.

`Color.primary` हा SwiftUI चा system semantic color आहे. तो Light Mode आणि Dark Mode नुसार display effect आपोआप बदलतो.

```swift
.foregroundStyle(Color.primary)
```

`disabled` view disabled आहे की नाही हे नियंत्रित करण्यासाठी वापरले जाते.

```swift
.disabled(true)
```

याचा अर्थ disabled आहे, क्लिक करता येत नाही.

```swift
.disabled(false)
```

याचा अर्थ available आहे, क्लिक करता येते.

म्हणून गणना केलेली प्रॉपर्टी SwiftUI मध्ये खूप सामान्य आहे. ती calculation results, conditions आणि display content अधिक स्पष्टपणे व्यवस्थित करण्यास मदत करते.
