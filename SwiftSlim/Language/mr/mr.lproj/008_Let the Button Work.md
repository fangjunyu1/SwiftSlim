# बटण कार्यरत करूया

या धड्यात आपण मुख्यतः `Button` बटण, `print` आउटपुट debug माहिती, आणि Swift functions शिकणार आहोत.


ही सामग्री SwiftUI मधील interactive programming ची पायाभूत गोष्ट आहे.

## बटण

बटण हे आपल्याला सर्वात जास्त दिसणारे UI control आहे. जेव्हा आपल्याला download, open किंवा exit यांसारख्या क्रिया करायच्या असतात, तेव्हा आपण सहसा बटणावर क्लिक करतो.


उदाहरणार्थ, App Store मध्ये App download करण्यासाठी “获取” बटणावर क्लिक केले जाते.

![Button](../../RESOURCE/008_button.png)

SwiftUI मध्ये बटण `Button` ने दर्शवले जाते.


मूलभूत वापर:

```swift
Button("") {
    
}
```

याची रचना दोन भागांत विभागता येते:


```swift
Button("बटणावरील मजकूर") {
    बटणावर क्लिक केल्यावर चालणारा कोड
}
```

उदाहरणार्थ:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

run केल्यानंतर एक `Start` बटण दिसेल.


![Button](../../RESOURCE/008_button1.png)

जेव्हा वापरकर्ता बटणावर क्लिक करतो, तेव्हा `{}` मधील कोड execute होतो.


लक्षात घ्या: `Button` हा SwiftUI चा interface control (`View`) आहे, म्हणून तो `body` मध्येच लिहावा लागतो.

### buttonStyle modifier

SwiftUI मध्ये `Button` साठी system मधील built-in button styles उपलब्ध आहेत, आणि त्या `buttonStyle` modifier ने वापरता येतात.


उदाहरणार्थ:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` system ने दिलेली button style वापरतो.


सामान्य पर्याय:

- .automatic
- .plain
- .bordered
- .borderedProminent
- .borderless

![Button](../../RESOURCE/008_button7.png)

वेगवेगळ्या styles मधील फरक मुख्यतः बटणाला border, background आणि visual emphasis आहे का नाही यावर असतो.


## print आउटपुट

प्रोग्रामिंगमध्ये अनेकदा program विशिष्ट code block पर्यंत पोहोचला आहे का हे पाहण्याची गरज असते.


Swift मध्ये debug माहिती output करण्यासाठी `print` function दिलेले आहे.

मूलभूत syntax:

```swift
print("Hello")
```

ही ओळ मजकूर `Console` मध्ये output करेल.


### बटण कार्यरत आहे का ते तपासणे

बटण क्लिक झाले आहे का हे तपासण्यासाठी आपण `print` बटणाच्या action मध्ये लिहू शकतो.


```swift
Button("Start") {
    print("Test 123")
}
```

बटणावर क्लिक केल्यावर `Console` मध्ये हे दिसेल:

```
Test 123
```

याचा अर्थ बटण यशस्वीपणे trigger झाले आहे.


![Button](../../RESOURCE/008_button3.png)

लक्षात ठेवा: `print` हा Swift कोड आहे, interface control नाही. तो थेट `body` मध्ये ठेवता येत नाही, अन्यथा error येईल.

उदाहरणार्थ, असे लिहिणे चुकीचे आहे:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // चूक: body ने एक View परत करणे आवश्यक आहे
    }
}
```

SwiftUI मध्ये `body` हा interface structure वर्णन करण्यासाठी वापरला जातो, म्हणून त्यात फक्त interface controls (`View`) ठेवता येतात, जसे `Text`, `Button`, `Image` इत्यादी.


सामान्य code (calculation logic, `print` इ.) हा button, function किंवा इतर event handler मध्ये ठेवला पाहिजे.

### Console नियंत्रण क्षेत्र

`print` चे output Xcode मधील `Console` (कन्सोल) मध्ये दिसते.


जर `Console` दिसत नसेल, तर उजव्या खालच्या कोपऱ्यातील `Show the Debug Area` बटणावर क्लिक करून debug क्षेत्र उघडा, आणि मग `Show the Console` बटणावर क्लिक करून कन्सोल दाखवा.

![](../../RESOURCE/008_button4.png)

`Console` च्या डाव्या खालच्या भागात दोन tabs असतात: `Executable` आणि `Previews`.


![](../../RESOURCE/008_button5.png)

हे tabs वेगवेगळ्या runtime environments शी संबंधित असतात: Canvas preview view मध्ये असताना `print` चे output `Previews` tab खाली दिसते; आणि सिम्युलेटर किंवा प्रत्यक्ष डिव्हाइसवर app चालू असताना output `Executable` tab मध्ये दिसते.

म्हणून, जर `print` चे output दिसत नसेल, तर आधी योग्य tab निवडले आहे का ते तपासा.


## उदाहरण - ASCII अक्षरचित्र

काही code projects मध्ये आपण अनेकदा ASCII अक्षरचित्र पाहतो.


अक्षरचित्र म्हणजे साध्या characters वापरून तयार केलेली आकृती. उदाहरणार्थ:

![ASCII](../../RESOURCE/008_ascii.png)

आपण बटण + `print` वापरून एक ASCII अक्षरचित्र output करू शकतो.


उदाहरण कोड:

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

बटणावर क्लिक केल्यावर `Console` मध्ये हे output होईल:

```
 /\_/\
( o.o )
 > ^ <
```

लक्षात ठेवा: string मधील `\` हे `\\` असे लिहावे लागते, कारण backslash हा string मध्ये escape character असतो.


## functions

बटणाच्या आत आपण थेट code लिहू शकतो.


उदाहरणार्थ:

```swift
Button("Start") {
    print("Hello")
}
```

जर code कमी असेल, तर अशी पद्धत ठीक आहे. पण प्रत्यक्ष development मध्ये एका बटणाने trigger होणारी logic बरीच मोठी असू शकते.


उदाहरणार्थ:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // कदाचित अजून खूप कोड असेल
}
```

जर code वाढत गेला, तर तो थेट बटणाच्या आत लिहिल्याने interface code गोंधळलेला वाटतो, आणि वाचणे व maintain करणे कठीण होते.


म्हणून, आपण सहसा हा code एका function मध्ये मांडतो आणि बटणात तो function call करतो.

### function म्हणजे काय

function म्हणजे पुन्हा पुन्हा वापरता येणारा code block.


जेव्हा आपल्याला काही code execute करायचा असतो, तेव्हा फक्त तो function call केला की function मधील code चालतो.

यामुळे code structure अधिक स्पष्ट होते आणि reuse करणेही सोपे होते.


### मूलभूत syntax

Swift मध्ये function `func` keyword वापरून define करतात:

```swift
func randomInt() {
    // code
}
```

हा code एक function define करतो.


`randomInt` हे function चे नाव आहे, ज्याने हा code block ओळखला जातो.

`()` हे parameters चे स्थान आहे. येथे बाहेरून आलेला data स्वीकारता येतो. data नको असल्यास ते रिकामे ठेवू शकतो.


`{}` च्या आत function चा code area असतो, आणि execute करायचा सर्व code इथे लिहिला जातो.

उदाहरणार्थ:

```swift
func getName() {
    print("FangJunyu")
}
```

या function चे काम म्हणजे एक मजकूर output करणे.


### function call करणे

function define केल्याने फक्त code block तयार होतो; तो execute करायचा असेल, तर function call करावा लागतो.


call करण्याची पद्धत म्हणजे function च्या नावानंतर `()` लावणे:

```swift
getName()
```

प्रोग्राम या ओळीपर्यंत पोहोचला की `getName` function मधील code execute होतो.


पूर्ण उदाहरण:

```swift
struct ContentView: View {
    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("Start") {
            getName()
        }
    }
}
```

या उदाहरणात, बटणावर क्लिक केल्यावर `getName()` call होतो आणि `Console` मध्ये `FangJunyu` output होते.

run केल्यानंतर `Console` मध्ये हे output होईल:


```
FangJunyu
```

### SwiftUI मध्ये functions वापरणे

SwiftUI views मध्ये, functions सहसा `body` च्या बाहेर लिहिले जातात.


उदाहरणार्थ:

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

बटणावर क्लिक केल्यावर `getName()` function call होतो.


यामुळे interface code अधिक स्वच्छ राहतो, आणि विशिष्ट logic function मध्ये handle करता येतो.

### function parameters

काही वेळा एखाद्या function ला वेगवेगळ्या data नुसार वेगवेगळे काम करावे लागते.


उदाहरणार्थ, function ने फक्त ठरलेले `"FangJunyu"` output करण्याऐवजी वेगवेगळी नावे output करावीत असे आपल्याला वाटू शकते.

अशावेळी parameters वापरता येतात. parameters म्हणजे function call करताना आत पाठवलेला data असे समजू शकतो.


उदाहरणार्थ:

```swift
func getName(name: String) {
    print(name)
}
```

या function मध्ये एक नवीन parameter जोडला आहे. `name` हे parameter चे नाव आहे आणि `String` हा parameter चा प्रकार आहे.

याचा अर्थ function ला `String` प्रकारचा data घ्यावा लागेल.


कारण function ला आता data लागतो, म्हणून call करताना तो data देणे आवश्यक आहे.

```swift
getName(name: "Sam")
```

call करताना `"Sam"` दिल्यास, function तोच value वापरून output करतो.


run परिणाम:

```
Sam
```

## उदाहरण - function वापरून ASCII अक्षरचित्र output करणे

मागील उदाहरणात आपण `print` थेट बटणाच्या आत लिहिले होते.


पण जर अक्षरचित्र जास्त गुंतागुंतीचे असेल, तर कोड खूप मोठा होतो. अशावेळी logic function मध्ये ठेवता येते, ज्यामुळे interface code अधिक स्पष्ट राहतो.

उदाहरण कोड:

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

run केल्यानंतर बटणावर क्लिक केल्यास `Console` मध्ये हे output होते:


```
 /\_/\
( o.o )
 > ^ <
```

इथे दोन गोष्टी घडतात, जेव्हा वापरकर्ता बटणावर क्लिक करतो:


1. बटण `printCat()` function call करते
2. function मधील `print` कोड execute होतो

यामुळे interface code ची जबाबदारी फक्त event trigger करण्यापुरती राहते, आणि विशिष्ट logic function मध्ये ठेवता येते.


प्रत्यक्ष development मध्ये, बहुतेक बटणांच्या actions functions च्या माध्यमातूनच अंमलात आणल्या जातात.

## सारांश

या धड्यात आपण `Button` चा मूलभूत वापर, `print` वापरून debug माहिती output करणे, आणि functions वापरून code organize करणे शिकलो.

`Button` हा SwiftUI मधील interface control आहे, त्यामुळे तो `body` मध्ये लिहावा लागतो; तर `print` आणि functions हे Swift logic code असून ते event handler किंवा function मध्ये ठेवले जातात.


या ज्ञानाच्या मदतीने आपण आता साध्या UI interaction हाताळू शकतो, आणि पुढे अधिक जटिल interactive features तयार करण्यासाठी पायाभूत तयारी झाली आहे.

## सराव

खालील सराव पूर्ण करण्याचा प्रयत्न करा:


1. "Hello" असा मजकूर असलेले एक बटण तयार करा
2. बटणावर क्लिक केल्यावर `Console` मध्ये `Hello Swift` output करा
3. output करणारा कोड एका function मध्ये लिहा, आणि नंतर बटणातून तो function call करा
