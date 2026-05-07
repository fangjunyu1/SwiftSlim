# Views समजून घेणे

या धड्यात, आपण पुन्हा अगदी सुरुवातीच्या `ContentView` कडे परत येतो.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

आपण पहिल्यांदा SwiftUI पाहिले तेव्हा, `ContentView` मध्ये आपल्याला न समजणारे अनेक keywords होते.

उदाहरणार्थ `struct`, `View`, `var`, `body`, `some View` अशी keywords.

त्या वेळी कदाचित आपल्याला फक्त एवढेच माहीत होते: **code `body` च्या आत लिहिला की interface वर content दिसतो.**

आता आपण `struct`, variables, methods आणि protocols शिकलो आहोत, त्यामुळे हा code पुन्हा समजून घेऊन SwiftUI views मधील संबंध अधिक स्पष्ट करू शकतो.

## ContentView पुन्हा पाहणे

SwiftUI project तयार केल्यानंतर, Xcode default म्हणून एक `ContentView` file generate करते.

उदाहरण code खालीलप्रमाणे आहे:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

हा code काही भागांत विभागून समजून घेता येतो.

सर्वप्रथम:

```swift
import SwiftUI
```

ही code line SwiftUI framework import करण्याचे दर्शवते.

SwiftUI import केल्यानंतरच आपण `View`, `Text`, `Image`, `VStack`, `Button` अशा SwiftUI views वापरू शकतो.

## ContentView structure

ही code line एक structure तयार करण्याचे दर्शवते:

```swift
struct ContentView: View
```

यामध्ये:

```swift
struct ContentView
```

याचा अर्थ `ContentView` ही एक structure आहे.

मागील धड्यात आपण `struct` structure बद्दल शिकलो. ते वेगवेगळे fields एकत्र करू शकते, आणि properties, methods ठेवू शकते.

उदाहरणार्थ:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

या example मध्ये, `ContentView` मध्ये तीन गोष्टी आहेत: `name`, `printName` आणि `body`.

म्हणजे `struct` संबंधित properties, methods आणि view content एकत्र organize करू शकते.

![contentView](../../Resource/023_contentVIew.png)

## View हा protocol आहे

ही code line पुढे पाहू:

```swift
struct ContentView: View 
```

colon नंतरचा `View` सांगतो: `ContentView` `View` protocol चे पालन करतो.

हे असे समजू शकतो: `ContentView` ला SwiftUI view व्हायचे असेल, तर त्याने `View` protocol च्या requirements पूर्ण करायला हव्यात.

### Identifiable protocol

आधी movie list शिकताना, आपण `Identifiable` protocol पाहिला होता.

त्या वेळी `ForEach` मध्ये `Movie` array traverse करायचा होता, पण `Movie` structure मध्ये unique identifier नव्हता, त्यामुळे तो `ForEach` traversal support करत नव्हता.

म्हणून `Movie` structure ला `Identifiable` protocol follow करायला लावावे लागले, ज्यामुळे `ForEach` च्या unique identifier requirement ला तो जुळतो.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protocol ची requirement आहे: **या type कडे स्वतःला identify करणारा `id` field असावा.**

`Movie` एक `id` field देतो तेव्हा, तो `Identifiable` ची requirement पूर्ण करू शकतो.

म्हणून आपण तो `ForEach` मध्ये वापरल्यावर, SwiftUI प्रत्येक data item ओळखू शकतो.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protocol

`View` protocol देखील याचप्रमाणे आहे.

एखाद्या type ला SwiftUI view व्हायचे असेल, तर त्याने `View` protocol follow करायला हवा.

आणि `View` protocol ची सर्वात महत्त्वाची requirement म्हणजे एक `body` provide करणे.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

हे असे समजू शकतो: `View` protocol ची requirement आहे: **`body` return करतो तो SwiftUI viewच स्वीकारला जातो, आणि `ContentView` `body` च्या माध्यमातून SwiftUI view दाखवतो.**

### View follow न केल्यास काय होईल?

आपण असे लिहिले तर:

```swift
struct ContentView {
}
```

ही फक्त एक ordinary structure आहे, SwiftUI view नाही.

ती लगेच error देणार नाही, कारण ordinary structure स्वतः valid Swift code आहे.

पण आपण ती preview मध्ये ठेवली तर:

```swift
#Preview {
    ContentView()
}
```

तेव्हा error येईल.

कारण: **preview ला SwiftUI view display करायचा असतो, पण हा `ContentView` `View` protocol follow करत नाही.**

म्हणून `ContentView` interface वर दिसावा असे वाटत असेल, तर त्याने `View` protocol follow करायला हवा:

```swift
struct ContentView: View {
}
```

त्याच वेळी, `View` protocol requirement नुसार `body` provide करावा लागतो. `body` नसल्यास compiler तरीही error देईल.

योग्य लिहिण्याची पद्धत:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

तेव्हा `ContentView` खरोखर display करता येणारा SwiftUI view होतो.

## body हा view display चा entry point आहे

SwiftUI मध्ये, `body` हा view content चा entry point आहे.

```swift
var body: some View {
    Text("Hello, world!")
}
```

हे तीन भागांत विभागता येते:

**1. var body**

```swift
var body
```

याचा अर्थ `body` नावाचा variable define केला आहे.

**2. some View**

```swift
: some View
```

याचा अर्थ हा `body` एक view return करेल.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

हे display होणारे view content दर्शवते. या code मध्ये एक `Text` view display होतो.

म्हणजे `body` मध्ये जे लिहिले जाते, तेच interface वर दिसते.

उदाहरणार्थ:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

हा code सांगतो: **interface वर vertically arranged content दिसतो, ज्यात दोन texts आहेत.**

### body हे नाव मनाने बदलता येत नाही

लक्षात ठेवण्यासारखे म्हणजे, `body` हे नाव मनाने बदलता येत नाही.

असे लिहिले तर:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

हा `content` देखील view property आहे, पण तो `body` ची जागा घेऊ शकत नाही.

कारण `View` protocol ला अपेक्षित नाव नेमके `body` आहे.

## some View म्हणजे काय?

SwiftUI मध्ये, `some View` म्हणजे एक concrete view return करणे, फक्त त्या view चा पूर्ण type लिहिण्याची गरज नसते.

```swift
var body: some View
```

म्हणजे `some View` म्हणजे type नाही असे नाही. खरा type अजूनही असतो, compiler तो type ओळखतो, पण तो type खूप complex असू शकतो, म्हणून Swift आपल्याला `some View` वापरून तो hide करू देते.

### some म्हणजे काय?

Swift मध्ये, `some` हा opaque type declare करण्यासाठी वापरला जाणारा keyword आहे.

Opaque type म्हणजे: **return value ला एक concrete type असतो, compiler ला तो concrete type माहीत असतो, पण आपण तो concrete type थेट लिहीत नाही.**

उदाहरणार्थ:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

याचा अर्थ `makeView` `View` protocol follow करणारा concrete type return करेल.

### some ची गरज का आहे?

Variables शिकताना आपण समजलो होतो: **Swift मधील values ना explicit type annotation लागते, किंवा compiler automatic पद्धतीने type infer करतो.**

उदाहरणार्थ:

```swift
let a: Int = 10
```

येथे constant `a` चा type `Int` आहे.

SwiftUI views देखील याला अपवाद नाहीत. `body` वापरून SwiftUI view display करताना, `body` ने संबंधित SwiftUI type return करायला हवा.

उदाहरणार्थ, आपण `body` वापरून `Text` text view display करत असल्यास, `body` ने संबंधित `Text` type return करायला हवा.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

या example मध्ये, `body` च्या आत display होणारा view `Text` view आहे, आणि return type देखील `Text` आहे.

आतील type आणि declared type एकसारखे असतील तेव्हाच compiler च्या type consistency requirement ला जुळते.

**Type mismatch समस्या**

जर आपण `body` चा type `Color` ठेवला, पण display होत असेल `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` चा type आणि आतल्या code चा type जुळत नाही, त्यामुळे type mismatch error trigger होतो.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

या वेळी `body` चा return type manually बदलावा लागतो.

**Complex view types**

खऱ्या development मध्ये, interface मध्ये सहसा फक्त एक `Text` नसतो.

अधिक complex `VStack` display करायचा असल्यास, complex return type manually annotate करावा लागेल.

उदाहरणार्थ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

हा code एक `VStack` return होतो, आणि `VStack` मध्ये `Image` व `Text` type चे views आहेत असे दर्शवतो.

`body` चा return type आहे:

```swift
VStack<TupleView<(Image,Text)>>
```

दिसतेच आहे की हा return type खूप complex आहे, आणि आपण आधी न पाहिलेला `TupleView` देखील आला आहे.

येथे `TupleView` असे समजू शकतो: **अनेक child views एका view मध्ये wrap करणे.**

**आणखी complex view types**

जर आपण view ला modifiers जोडले:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

तर या view चा return type खूप complex होतो, आणि तो येथे नेमका वर्णन करणे शक्य नाही.

सध्याचा return type `VStack<TupleView<(Image,Text)>>` modifiers चे वर्णन करू शकत नाही, त्यामुळे error होतो.

**some View return type सोपा करते**

या परिस्थितीसाठी SwiftUI एक संक्षिप्त solution देते, म्हणजे `some View` वापरून लिखाण सोपे करणे.

जेव्हा आपण `body` ला `some View` type करतो:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

प्रत्येक वेळी view code बदलल्यावर, पूर्ण return type पुन्हा लिहिण्याची गरज राहत नाही.

कारण `some View` म्हणजे `View` protocol follow करणारा concrete view return करणे.

दुसऱ्या शब्दांत, `VStack`, `Image` इत्यादी SwiftUI views सर्व `View` protocol follow करतात. Modifier जोडल्यावर return होणारा view type देखील `View` protocol follow करतो.

म्हणून ते सर्व `some View` म्हणून return होऊ शकतात.

### some View कोणताही view मनाने return करू शकत नाही

`some View` complex types hide करू शकते, पण त्याचा अर्थ "type नाही" असा नाही.

त्याचा core rule आहे: **compiler ला एक concrete return type determine करता आला पाहिजे**.

उदाहरणार्थ:

```swift
var title: some View {
    Text("Hello")
}
```

येथे return होणारा view `Text` आहे.

पण दोन views return करण्याचा प्रयत्न केला तर error होतो:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

कारण `some View` ने शेवटी एक view structure return करायला हवी, पण येथे दोन independent views return करण्याचा प्रयत्न आहे.

### उपाय

उपाय सहसा दोन असतात: container आणि `@ViewBuilder`.

**1. container वापरून wrap करा**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

या code मध्ये, `title` एक `VStack` return करतो, आणि `Text`, `Image` हे `VStack` मधील child views आहेत.

`some View` स्वीकारणारे view structure एक `VStack<...>` आहे, त्यामुळे ते `some View` च्या एक view structure return करण्याच्या requirement ला जुळते. 

म्हणूनच SwiftUI शिकायला सुरुवात केल्यापासून आपण बाहेरील layer मध्ये `VStack` container वापरून view code wrap करण्याचा सल्ला देतो.

**2. @ViewBuilder वापरा**

`some View` च्या आधी `@ViewBuilder` modifier देखील जोडू शकतो:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` अनेक views एका return result मध्ये combine करू शकतो.

त्याचे essence अजूनही अनेक views एका view मध्ये merge करणे आहे, ज्यामुळे `some View` ची एक view structure return करण्याची requirement पूर्ण होते.

### body मध्ये अनेक views थेट का लिहू शकतो?

जर आपण `var body` मध्ये अनेक views लिहिले, उदाहरणार्थ:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

काही परिस्थितींमध्ये असा `body` error देत नाही.

कारण `View` protocol मधील `body` default पद्धतीने `@ViewBuilder` support करतो:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protocol च्या source code मध्ये, `@ViewBuilder` ने आधीच `body` variable modify केलेले दिसते.

म्हणून `body` कडे ordinary `some View` पेक्षा एक अतिरिक्त special handling असते, आणि SwiftUI अनेक views आपोआप एका view मध्ये combine करते.

**Container वापरण्याची शिफारस**

Beginners साठी समजायला सोपे व्हावे म्हणून, अनेक views organize करताना आधी `VStack`, `HStack`, `ZStack`, `Group` यांसारखे containers वापरण्याची शिफारस केली जाते.

उदाहरणार्थ:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

अशा प्रकारे code अधिक intuitive आहे: **बाहेरील layer एक `VStack` आहे, आणि आत दोन child views ठेवलेले आहेत.**

## Views विभाजित करणे

Interface तुलनेने simple असल्यास, सर्व code `body` मध्ये लिहू शकतो.

उदाहरणार्थ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote मध्ये आपले स्वागत आहे")
                Text("शुभ प्रभात")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("मला क्लिक करा") {
                print("मला क्लिक करा ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

या view ची display style:

![view](../../Resource/023_view1.png)

हा code सामान्यपणे run होऊ शकतो, पण view code खूप complex झाल्यास, `body` मधील code अधिकाधिक लांब होतो, आणि वाचणे व modify करणे कठीण होत जाते.

या वेळी, वेगवेगळे areas स्वतंत्र view properties मध्ये विभाजित करू शकतो.

### वरचा view विभाजित करणे

उदाहरणार्थ, वरचा area वेगळा काढू:

```swift
var topHome: some View {
    HStack {
        Text("मुख्यपृष्ठ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

येथे `topHome` हा एक variable आहे, तो एक view return करतो.

Return होणारी गोष्ट view असल्यामुळे, type असे लिहिता येते:

```swift
some View
```

हे प्रत्यक्षात `body` सारखेच usage आहे:

```swift
var topHome: some View { }
var body: some View { }
```

दोन्ही variable वापरून view display करतात, आणि return type `some View` आहे.

### इतर views विभाजित करणे

नंतर इतर भाग पुढे विभाजित करू:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote मध्ये आपले स्वागत आहे")
        Text("शुभ प्रभात")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("मला क्लिक करा") {
        print("मला क्लिक करा")
    }
    .buttonStyle(.borderedProminent)
}
```

विभाजित केल्यानंतर, view variables `body` मध्ये ठेवू शकतो:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("मुख्यपृष्ठ")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote मध्ये आपले स्वागत आहे")
            Text("शुभ प्रभात")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("मला क्लिक करा") {
            print("मला क्लिक करा")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

आता `body` फक्त page structure वर्णन करण्यासाठी responsible आहे:

```swift
topBar
welcomeText
colorList
clickButton
```

प्रत्येक भागाची concrete implementation खालील संबंधित property मध्ये ठेवली आहे.

View अशा पद्धतीने विभाजित केल्याने page structure अधिक clear होते. प्रत्येक view area ला स्वतःचे नाव असते, त्यामुळे वाचणे अधिक intuitive होते.

एखाद्या भागाचा code modify करताना, complex code च्या ढिगाऱ्यात शोधण्याऐवजी संबंधित view area थेट सापडतो.

### some View एकच view return करतो

या विभाजित view मध्ये, जर आपण अनेक views return करण्याचा प्रयत्न केला:

```swift
var topBar: some View {
    Text("मुख्यपृष्ठ")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` फक्त एक view structure return करू शकतो, त्यामुळे error येतो.

`body` पेक्षा वेगळे म्हणजे, ordinary computed property मध्ये default `@ViewBuilder` नसते.

म्हणून अनेक views return करायचे असल्यास, `VStack`, `HStack` किंवा `Group` container वापरून अनेक views एकत्र combine करू शकतो.

```swift
var topBar: some View {
    VStack {
        Text("मुख्यपृष्ठ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

किंवा views combine करण्यासाठी `@ViewBuilder` जोडू शकतो:

```swift
@ViewBuilder
var topBar: some View {
    Text("मुख्यपृष्ठ")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

अशा प्रकारे आपण अनेक views return करू शकतो.

### if अनेक views return करतो

उदाहरणार्थ:

```swift
var topHome: some View {
    if step == "मुख्यपृष्ठ" {
        HStack {
            Text("मुख्यपृष्ठ")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("काही नाही")
    }
}
```

या code मध्ये, `topHome` `step` च्या content नुसार `HStack` किंवा `Text` अशा दोन different type views return करतो.

`some View` ला एक determined concrete return type लागतो, त्यामुळे ordinary computed property मधील `if` च्या दोन branches थेट different type views return करू शकत नाहीत, म्हणून error होतो.

**Solution अजूनही container वापरून wrap करणे, किंवा `@ViewBuilder` modifier वापरणे आहे.**

### विभाजित view मध्ये parentheses का वापरत नाही

`body` मध्ये विभाजित view properties वापरताना, आपण थेट असे लिहितो:

```swift
topBar
welcomeText
colorList
clickButton
```

असे लिहीत नाही:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

कारण `topBar`, `welcomeText`, `colorList`, `clickButton` हे variables आहेत. हे variables प्रत्यक्षात computed properties आहेत, methods नाहीत.

**Properties ला parentheses लागत नाहीत.**

आपण method म्हणून लिहिले तरी, similar effect मिळवता येतो:

```swift
func topBar() -> some View {
    HStack {
        Text("मुख्यपृष्ठ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

हा code देखील similar effect मिळवू शकतो. हा method call केल्यावर एक view return होतो.

वापरताना असे लिहावे लागते:

```swift
topBar()
```

SwiftUI मध्ये, parameter pass करण्याची गरज नसलेला view फक्त विभाजित करायचा असल्यास, computed property पद्धत अधिक common आहे.

```swift
var topBar: some View { ... }
```

## Nested views

Code properties मध्ये विभाजित करण्याव्यतिरिक्त, आपण नवीन view structures देखील तयार करू शकतो.

उदाहरणार्थ:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

हा `PinkColorView`, `ContentView` सारखाच, एक independent SwiftUI view आहे.

तो `ContentView` मध्ये display करायचा असल्यास, view name नंतर `()` जोडू शकतो.

उदाहरणार्थ:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

येथे:

```swift
PinkColorView()
```

म्हणजे एक `PinkColorView` instance तयार करणे.

`PinkColorView` `View` protocol follow करत असल्यामुळे, तो `Text`, `Image`, `Button` प्रमाणे इतर views मध्ये ठेवून display करता येतो.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

हेच view nesting आहे, एक view दुसऱ्या view मध्ये display होऊ शकतो.

## View property की नवीन view तयार करणे?

View code तुलनेने simple असल्यास, सहसा code विभाजित करण्याची गरज नसते. Code complex झाल्यावरच view विभाजित करण्याची शिफारस केली जाते.

### View property वापरण्याची परिस्थिती

जर तो current view मधील एक लहान content block असेल, तर view property वापरू शकतो.

उदाहरणार्थ:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

हे contents सहसा फक्त current view मध्ये वापरले जातात.

### नवीन view तयार करण्याची परिस्थिती

हे contents तुलनेने independent असतील, किंवा पुढे अनेक pages मध्ये reuse होऊ शकतील, तर नवीन view तयार करणे अधिक suitable आहे.

उदाहरणार्थ:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

हा title view आहे. हा view common component म्हणून इतर views मध्ये reuse करायचा असल्यास.

आपण नवीन view तयार करू शकतो:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

नंतर इतर ठिकाणी वापरू शकतो:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

त्या वेळी हा view reusable independent component बनतो.

सोप्या भाषेत असे summarize करता येते:

- current view चा content area: `var xxx: some View` वापरू शकतो
- reusable independent component: नवीन `struct XxxView: View` तयार करू शकतो
- data pass करावा लागणारा component: सहसा नवीन view तयार करणे अधिक suitable असते.

## सारांश

या धड्यात, आपण SwiftUI मधील सर्वात basic पण सर्वात important view structure पुन्हा समजून घेतली.

`ContentView` ही structure आहे. ती `struct` वापरून define केली जाते, आणि page-related code organize करण्यासाठी वापरली जाते.

`View` हा protocol आहे. एखाद्या structure ला SwiftUI view व्हायचे असल्यास, तिने `View` protocol follow करायला हवा.

`body` हा `View` protocol आपल्याला provide करायला सांगणारा content आहे. हा view कोणता content display करेल हे तो ठरवतो.

`some View` म्हणजे एक concrete view return करणे, त्याचा complex full type लिहिण्याची गरज नसते.

View code लांब होत असताना, `var xxx: some View` वापरून view code अनेक small areas मध्ये विभाजित करू शकतो.

एखादा content block तुलनेने independent असेल, किंवा reuse ची गरज असेल, तर नवीन view structure तयार करून इतर views मध्ये `XxxView()` द्वारे display करू शकतो.

सोप्या शब्दांत, SwiftUI interface एकेक view combine करून तयार होतो. एका page मध्ये अनेक small views असू शकतात, आणि एक small view पुढे इतर views contain करू शकतो.
