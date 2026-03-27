# गुलकातील रक्कम जतन करणे

मागील धड्यात आपण एक साधे “गुलक” तयार केले. या धड्यात आपण “गुलक” मधील रक्कम persistent पद्धतीने कशी save करायची ते शिकणार आहोत.

या धड्यात मुख्यतः `UserDefaults` आणि `@AppStorage` property wrapper शिकणार आहोत. यासोबत `onAppear` ची भूमिका आणि Optional type (`nil`) चा वापरही विस्ताराने समजून घेऊ.

लक्षात ठेवा, या धड्यासाठी मागील धड्यात तयार केलेला “गुलक” code पुढेच वापरावा लागेल.

## persistent save ची समस्या

सध्या “गुलक” चे interface खूप साधे आहे आणि वापरण्यासही सोपे आहे.

![Piggy Bank](../../Resource/014_view.png)

पण एक स्पष्ट समस्या आहे: view refresh झाले किंवा app बंद झाले, की “गुलक” ची एकूण रक्कम पुन्हा `0` होते, आणि आधीची सगळी रक्कम हरवते.

याचा अर्थ data खरोखर save होत नाही. दुसऱ्या शब्दांत, सध्याचे “गुलक” फक्त temporary data साठवते.

### persistent save का होत नाही?

कारण आपण `@State` वापरून variable declare केले आहे:

```swift
@State private var amount = 0
```

`@State` ने declare केलेल्या variable चा lifecycle पूर्णपणे view वर अवलंबून असतो.

view तयार झाले की `amount` initialize होते; view destroy झाले की `amount` सुद्धा destroy होते.

याचा अर्थ `amount` मधील data फक्त memory मध्ये असतो, device वर save केलेला नसतो.

आपल्याला `amount` हा view च्या lifecycle शी बांधलेला नको असेल, तर data persistent पद्धतीने save करावा लागेल. म्हणजेच तो device storage वर जतन करावा लागेल.

### “data persistence” म्हणजे काय

data persistence म्हणजे data “temporary memory” मधून “device storage” मध्ये save करणे असे समजू शकतो.

म्हणून view बंद झाले किंवा app बंद झाले तरी data हरवत नाही.

Swift development मध्ये साधे persistent data `UserDefaults` मध्ये save करता येते; आणि अधिक गुंतागुंतीच्या data साठी `SwiftData` किंवा `CoreData` वापरावे लागते.

या धड्यात आपण सर्वात सोपे `UserDefaults` आधी शिकू.

## UserDefaults

`UserDefaults` हे हलक्या प्रकारच्या key-value data साठवण्यासाठी वापरले जाते. सामान्यतः `String`、`Int`、`Double`、`Bool` यांसारख्या basic types साठवण्यासाठी ते उपयुक्त आहे.

### data save करणे

`UserDefaults` मध्ये data save करण्यासाठी `set` method वापरली जाते:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

`UserDefaults` चा पहिला parameter म्हणजे save करायचा data. इथे `String`, `Int` अशा types दिल्या आहेत.

दुसरा parameter `forKey` हा variable name सारखा असतो, ज्याने `UserDefaults` मध्ये save केलेला data ओळखता येतो.

### data वाचणे

`UserDefaults` मधून वाचण्यासाठी संबंधित method वापरली जाते:

```swift
let name = UserDefaults.standard.string(forKey: "name")    // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")    // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")    // true
```

वाचताना योग्य type ची method वापरली पाहिजे; अन्यथा error किंवा चुकीचा data मिळू शकतो.

### UserDefaults वापरताना लक्षात ठेवण्यासारख्या गोष्टी

#### 1. Optional type परत येणे

`UserDefaults` मधून data वाचताना काही methods Optional type परत करतात.

उदाहरणार्थ:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

यात `name` चा प्रकार असा असतो:

```swift
String?
```

याचा अर्थ value असूही शकते आणि नसूही शकते.

**Optional type का परत येतो?**

कारण `UserDefaults` मधील एखाद्या `Key` साठी data अस्तित्वात असेलच असे नाही.

उदाहरणार्थ:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

जर `"City"` या Key साठी आधी कधीही data save केलेले नसेल, तर result असा येईल:

```swift
nil
```

इथे `nil` म्हणजे data नाही, रिकामी string नाही.

“type system” धड्यात आपण अशीच परिस्थिती पाहिली होती, जिथे data conversion fail झाल्यावर Optional type परत येत होता.

अशा वेळी `??` वापरून default value देऊन unwrap करावे लागते:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

जर `UserDefaults` मधून data मिळाला, तर तो वापरला जाईल; न मिळाल्यास (`nil`) default value वापरली जाईल.

#### 2. Non-optional type परत येणे

`UserDefaults` मध्ये `Int`、`Double`、`Bool` वाचताना non-optional type परत येतात.

उदाहरणार्थ:

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")    // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")    // false
```

हे Keys कधीच save केले गेले नसले तरी result `nil` येत नाही.

त्याऐवजी default values परत येतात:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. data मर्यादा

`UserDefaults` हे फक्त कमी प्रमाणात data save करण्यासाठी योग्य आहे, जसे app settings, simple states इत्यादी.

प्रत्यक्षात मोठ्या प्रमाणातील data किंवा खूप वारंवार read/write कराव्या लागणाऱ्या data साठी ते योग्य नाही.

## “गुलक” ची रक्कम save करणे

आता आपण `UserDefaults` वापरून “गुलक” ची एकूण रक्कम save करण्याची logic लिहू शकतो.

वापरकर्ता बटणावर क्लिक केल्यावर, input केलेली रक्कम एकूण रक्कमेत जमा करून ती `UserDefaults` मध्ये save करू.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

आता आपण data write करण्याची logic पूर्ण केली आहे.

## data persistence logic चे स्पष्टीकरण

जरी आपण data save करण्याची logic पूर्ण केली असली, तरी प्रत्यक्ष चालवताना दिसते की view refresh झाले किंवा app पुन्हा उघडले की `amount` पुन्हा `0` असतो.

कारण:

```swift
@State private var amount = 0
```

SwiftUI मध्ये `@State` variable view तयार होताना पुन्हा initialize होतो.

`UserDefaults` मध्ये `amount` save झाला असला, तरी view पुन्हा load झाल्यावर `amount` पुन्हा `0` वर reset होतो.

याचा अर्थ, सध्या data फक्त `UserDefaults` मध्ये save केला आहे; view मध्ये तो restore केलेला नाही.

म्हणून view load होताना `UserDefaults` मधून data परत वाचून `amount` ला assign करणे आवश्यक आहे. तेव्हाच पूर्ण persistence logic तयार होते.

### logic ची तुलना

ही प्रक्रिया “वर्गातील फळा” यासारखी समजू शकतो:

वर्ग चालू असताना शिक्षक फळ्यावर मजकूर लिहितात. हा मजकूर म्हणजे सध्याच्या view मधील state (`@State`).

वर्ग संपल्यावर फळा पुसला जातो. हे view destroy होण्यासारखेच आहे, आणि `@State` मधील data देखील साफ होतो.

शिक्षणातील मजकूर हरवू नये म्हणून शिक्षक आधीच तो notes मध्ये save करतात. हे notes म्हणजेच `UserDefaults` मधील saved data.

पुढच्या वेळी वर्ग पुन्हा सुरू झाला, की फळा सुरुवातीला रिकामाच असतो (`@State` initialize होतो), आणि शिक्षक notes मधील मजकूर परत फळ्यावर लिहितात (`UserDefaults` मधून वाचतात).

महत्त्वाची गोष्ट म्हणजे, फळा आपोआप जुना मजकूर परत आणत नाही; “notes वाचून” (`UserDefaults` वाचून) तो परत लिहावा लागतो.

## `onAppear` वापरून data वाचणे

view दिसताना `UserDefaults` मधील value हाताने वाचून `@State` च्या `amount` variable ला assign करावी लागते, तेव्हाच खऱ्या अर्थाने data persistence साध्य होते.

SwiftUI मध्ये view दिसताना initialization logic चालवण्यासाठी `onAppear` वापरता येते:

```swift
.onAppear {}
```

`UserDefaults` मधून वाचण्याचा code `onAppear` मध्ये ठेवू:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

view तयार होताना `amount` सुरुवातीला `0` असतो; view दिसल्यावर `onAppear` trigger होते, आणि `UserDefaults` मधील value वाचून `amount` ला assign केली जाते. अशा प्रकारे view मध्ये शेवटची saved एकूण रक्कम दिसते.

आता संपूर्ण “गुलक” data persistence logic पूर्ण होते.

## पूर्ण कोड

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

## `@AppStorage` property wrapper

SwiftUI मध्ये `@AppStorage` property wrapper दिलेला आहे, जो `UserDefaults` save logic अधिक सोपी करतो.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` हे `UserDefaults` वर आधारित एक wrapper आहे, आणि `"amount"` हे `UserDefaults` मधील Key आहे.

view तयार होताना तो `UserDefaults` मधून data वाचतो; आणि variable बदलल्यावर तो आपोआप `UserDefaults` मध्ये write करतो.

हा SwiftUI च्या state update mechanism ला support करतो, आणि `@State` प्रमाणेच बदल झाल्यावर view refresh करतो.

म्हणजेच `@AppStorage` मुळे data read/save logic आपोआप हाताळली जाते; `UserDefaults` हाताने call करण्याची गरज राहत नाही, तसेच `onAppear` वापरून data read करण्याचीही गरज उरत नाही.

म्हणून आपण code मधील `UserDefaults` ची logic `@AppStorage` ने बदलू शकतो:

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

## सारांश

या धड्यात आपण पुढील गोष्टी शिकलो:

सर्वप्रथम, `UserDefaults` हलका data save करण्यासाठी वापरला जातो. आपण `UserDefaults` वापरून एकूण रक्कम device वर save केली. `UserDefaults` मध्ये read आणि write methods असतात, आणि काही प्रसंगी Optional types handle करावे लागतात.

यानंतर, `@State` variables फक्त view मधील temporary state साठी असतात, आणि त्यांचा lifecycle view शी जोडलेला असतो. view पुन्हा तयार झाला की `@State` सुद्धा पुन्हा initialize होतो.

`UserDefaults` मधील data restore करण्यासाठी आपण `onAppear` वापरून view दिसताना `UserDefaults` मधून data वाचणे शिकलो, आणि त्यामुळे data restoration पूर्ण केली.

शेवटी, `@AppStorage` वापरून `UserDefaults` ची जागा घेतली, ज्यामुळे view load होताना data आपोआप वाचला जातो, आणि data बदलल्यावर तो आपोआप write होतो. त्यामुळे `UserDefaults` आणि `onAppear` ची logic हाताने लिहिण्याची गरज उरत नाही.

या ज्ञानाच्या मदतीने आपण app मध्ये मूलभूत data persistence functionality तयार करू शकतो, ज्यामुळे data कायमस्वरूपी save राहतो.

## धड्यानंतरचा सराव

आता “गुलक” मध्ये रक्कम save होते, पण functionality अजून पूर्ण नाही.

1. वापरकर्त्याला रक्कम काढायची असल्यास त्यासाठी withdraw logic डिझाइन करणे आवश्यक आहे.
2. वापरकर्त्याला संपूर्ण रक्कम clear करायची असल्यास reset logic देखील implement करावी लागेल.
3. जर “गुलक” ला एक नाव द्यायचे असेल, तर `String` प्रकारचा data save करण्याची logicही जोडावी लागेल.

या विद्यमान आधारावर ही features वाढवून “गुलक” अधिक पूर्ण करू शकता.

## विस्तार - input field च्या default value ची समस्या

आता आपण input field चा interaction आणखी सुधारू शकतो, ज्यामुळे input अधिक सोपे होईल.

![textfield](../../Resource/015_view.png)

सध्याच्या implementation मध्ये input field ची default value `0` आहे. त्यामुळे वापरकर्त्याला प्रत्येकवेळी रक्कम टाइप करण्यापूर्वी आधी `0` delete करावे लागते, आणि हा interaction अनुभव चांगला नाही.

input field ची सुरुवातीची value रिकामी असावी, `0` नाही.

कारण `TextField` आणि `number` यांच्यात two-way binding आहे:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

`number` ची initial value `0` असल्यामुळे input field मध्येही `0` दिसतो.

म्हणून आपल्याला `number` रिकामा value म्हणजे `nil` करावा लागेल.

```swift
@State private var number = nil
```

आता error दिसेल:

```
Generic parameter 'Value' could not be inferred
```

हीच ती परिस्थिती आहे जी आपण “type system” मध्ये शिकलो होतो: जेव्हा compiler एखाद्या variable चा type आपोआप infer करू शकत नाही, तेव्हा type explicit declare करावा लागतो.

कारण आपण `number` ला `nil` केले आहे, आणि `nil` मध्ये स्वतःहून कोणतीही type माहिती नसते. त्यामुळे compiler ला हा variable `String` आहे, `Int` आहे की काही दुसरे हे समजत नाही, म्हणून error येतो.

म्हणून `number` साठी explicit type declaration लिहावी लागते:

```swift
@State private var number:Int? = nil
```

इथले `Int?` म्हणजे Optional प्रकार, म्हणजे `number` चे value `Int` असू शकते किंवा `nil` असू शकते.

अशा प्रकारे initial value `nil` केल्यास input field रिकामा दिसेल, `0` नाही.

### Optional unwrap करणे

एकदा `number` Optional type झाला, की जुनी calculation logic error देईल:

```swift
amount += number
```

सूचना:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

कारण `number` आता `nil` असू शकतो. जर त्याला थेट calculation मध्ये वापरले, तर ते प्रत्यक्षात असे होईल:

```swift
amount += nil
```

हे स्पष्टपणे अवैध आहे, कारण `nil` ची `amount` सोबत बेरीज करता येत नाही.

म्हणून Optional type calculation मध्ये वापरण्यापूर्वी unwrap करावा लागतो.

इथे `??` वापरून default value देता येते:

```swift
amount += number ?? 0
```

`number` हे `nil` असेल, तर default value `0` वापरला जाईल; `number` ला value असेल, तर input केलेला खरा data वापरला जाईल.

यामुळे calculation योग्य राहते, आणि input field default ने रिकामा राहतो. वापरकर्त्याला input करण्याआधी `0` delete करण्याची गरज राहत नाही.

## विस्तारलेला कोड

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
