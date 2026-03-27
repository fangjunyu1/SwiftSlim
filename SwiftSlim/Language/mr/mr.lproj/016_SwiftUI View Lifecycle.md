# SwiftUI view lifecycle

मागील धड्यात आपण `@State` variable view च्या lifecycle सोबत कसा जोडलेला असतो हे समजले, आणि `onAppear` चा मूलभूत वापरही शिकलो.

या धड्यात आपण SwiftUI view lifecycle आणखी खोलात समजून घेऊ: view कसा तयार होतो आणि स्क्रीनवर कसा दिसतो, view मधील variables कसे तयार होतात आणि पुन्हा तयार होतात, तसेच `onAppear`、`onDisappear` आणि `init` constructor यांचाही अभ्यास करू.

या ज्ञानाच्या आधारे, SwiftUI view च्या संपूर्ण बांधणी प्रक्रियेबद्दल एक एकसंध समज तयार होईल.

## app सुरू होण्याचा क्रम

iOS project तयार केल्यावर, Xcode डीफॉल्टने दोन files तयार करते:

```
ContentView.swift
ProjectName + App.swift
```

यामधील “ProjectName + App.swift” ही संपूर्ण app ची entry file असते.

उदाहरणार्थ:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### code execution flow

जेव्हा आपण app run करतो (सिम्युलेटर किंवा प्रत्यक्ष डिव्हाइसवर), तेव्हा system सर्वप्रथम `@main` keyword शोधते:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

entry file निश्चित झाल्यावर code execution सुरू होते.

सर्वप्रथम App struct मध्ये प्रवेश होतो, `body` मधील code execute होतो, आणि नंतर `WindowGroup` तयार होऊन त्यातील `ContentView` load केले जाते.

### `WindowGroup` ची भूमिका

`WindowGroup` हे windows manage करण्यासाठी वापरले जाते:

```swift
WindowGroup {
    ContentView()
}
```

iPad / macOS मध्ये multi-window support असतो, तर iPhone मध्ये सहसा फक्त एकच window असतो.

म्हणून iPhone मध्ये `WindowGroup` मुख्यतः पहिला दिसणारा screen manage करतो.

### view load होण्याची प्रक्रिया

system ला `ContentView` सापडल्यावर:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI `body` मधील code execute करते, आणि परत येणाऱ्या view structure (`VStack`、`Text` इ.) नुसार interface तयार करून स्क्रीनवर दाखवते.

ही पावले पूर्ण झाल्यावर आपण `ContentView` स्क्रीनवर पाहू शकतो.

![ContentView](../../Resource/016_view1.png)

महत्त्वाची गोष्ट म्हणजे `body` चे काम view निर्माण करणे आहे, view साठवणे नाही.

याचा अर्थ असा की प्रत्येकवेळी view refresh झाला, की SwiftUI `body` पुन्हा compute करते आणि नवीन view structure तयार करते.

### preview view logic

Xcode preview (Canvas) आणि प्रत्यक्ष run environment या दोन वेगळ्या यंत्रणा आहेत.

उदाहरणार्थ, entry file मध्ये debug output जोडू:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Xcode मध्ये `ContentView` preview केल्यावर execution `@main` entry पासून सुरू होत नाही, त्यामुळे entry file मधील `onAppear` trigger होत नाही.

पण जर सिम्युलेटर किंवा प्रत्यक्ष डिव्हाइसवर app run केले, तर system `@main` पासून execution सुरू करते, पूर्ण app flow चालवते, आणि entry मधील `onAppear` trigger करून debug output दाखवते.

यातील महत्त्वाचा फरक असा की Xcode preview हे “partial rendering” असते, जे फक्त current view दाखवण्यासाठी वापरले जाते; तर सिम्युलेटर आणि प्रत्यक्ष डिव्हाइस हे “पूर्ण runtime environment” देतात, जे संपूर्ण app execute करतात.

म्हणून app features तपासताना सिम्युलेटर किंवा प्रत्यक्ष डिव्हाइस यांनाच आधार मानला पाहिजे; Xcode preview पूर्ण runtime environment देत नाही.

## view चा lifecycle

सध्याच्या टप्प्यावर आपला सर्व code `ContentView` मध्ये केंद्रीत आहे. पण प्रत्यक्ष app मध्ये अनेक views असतात आणि वेगवेगळ्या परिस्थितीत त्यांच्यात switch केले जाते.

उदाहरणार्थ, “गुलक” मध्ये:

![PiggyBank](../../Resource/016_view.png)

जेव्हा वापरकर्ता “Save Money” वर क्लिक करतो, तेव्हा `SaveView` दिसतो; saving पूर्ण झाले किंवा तो close झाला की `SaveView` हटवला जातो.

ही पूर्ण प्रक्रिया म्हणजे एका view चा lifecycle: view तयार होतो, दाखवला जातो, आणि शेवटी हटवला जातो.

### app बंद करणे

जेव्हा app बंद होतो, तेव्हा सर्व views हटवले जातात आणि संबंधित state देखील नाहीशी होते.

म्हणून `ContentView` आणि इतर सर्व views memory मधून हटवले जातात, आणि app ची पूर्ण runtime state साफ होते.

## view मधील variables चा lifecycle

SwiftUI मध्ये variables चा lifecycle बहुधा view शी जोडलेला असतो.

उदाहरणार्थ:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State` variables

`@State` ने declare केलेले variables view lifecycle शी बांधलेले असतात.

```swift
@State private var name = "FangJunyu"
```

view तयार झाला की `name` सुद्धा तयार होतो; view हटवला की `name` देखील destroy होतो.

याच कारणामुळे `UserDefaults` सारख्या माध्यमातून data persistence करावी लागते.

### `body` मधील variables

`body` मध्ये define केलेला variable:

```swift
var num = 10
```

त्याचा lifecycle हा `body` execute होण्याच्या प्रक्रियेवर अवलंबून असतो.

जेव्हा SwiftUI च्या state मध्ये बदल होतो, उदाहरणार्थ:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

`name` बदलल्यावर `@State` त्या बदलाची नोंद घेते आणि SwiftUI ला view पुन्हा compute करण्यास सांगते, म्हणजे `body` पुन्हा compute होते.

`body` पुन्हा compute होताना, `body` मधील सगळा code पुन्हा execute होतो, आणि `body` मधील variables (`num` सारखे) पुन्हा तयार होतात.

याच कारणामुळे `body` मध्ये गुंतागुंतीचे variables define करणे शिफारसीय नाही.

कारण view refresh होताना `body` मधील variables प्रत्येकवेळी पुन्हा तयार होतात, ज्यामुळे calculation cost वाढतो आणि performance वर परिणाम होऊ शकतो.

SwiftUI मध्ये वेगवेगळ्या प्रकारच्या data साठी वेगवेगळ्या management पद्धती वापराव्या लागतात: view lifecycle सोबत राहणारा data `@State` मध्ये ठेवता येतो; आणि temporary calculation साठीचा data `body` मध्ये ठेवता येतो.

## `onAppear` आणि `onDisappear`

मागील धड्यात आपण `onAppear` शिकलो होतो. view दिसल्यावर `onAppear` call होते.

```swift
.onAppear {}
```

उदाहरणार्थ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode preview किंवा प्रत्यक्ष run मध्ये `onAppear` मधील debug output पाहता येतो.

### `onDisappear`

`onAppear` च्या जोडीला `onDisappear` असते:

```swift
.onDisappear {}
```

view बंद झाल्यावर `onDisappear` call होते.

उदाहरणार्थ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

view हटवला गेल्यावर `onDisappear` मधील code execute होतो.

सूचना: या टप्प्यावर वापरला जाणारा `ContentView` हा app चा root view आहे, त्यामुळे तो थेट close किंवा remove करता येत नाही. म्हणून सध्याच्या टप्प्यात `onDisappear` चा effect सहज पाहता येत नाही.

पुढे navigation, page switching किंवा नवीन view उघडताना `onDisappear` प्रत्यक्ष दिसेल.

## create आणि show logic

महत्त्वाची गोष्ट म्हणजे, view तयार होणे आणि view दिसणे हे दोन वेगळे टप्पे आहेत.

view तयार होताना struct चा constructor call होतो:

```swift
init() {}
```

कारण SwiftUI views हे `struct` असतात:

```swift
struct ContentView: View { ... }
```

म्हणून view instance तयार झाला की `init` constructor execute होतो. आणि view स्क्रीनवर दिसल्यावरच `onAppear` call होते.

उदाहरणार्थ:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Xcode preview मध्ये debug output असे दिसू शकते:

```swift
Create ContentView
Show ContentView
```

यावरून स्पष्ट होते की प्रथम `init` वापरून view तयार होतो, नंतर `body` मधील code compute होतो, आणि शेवटी view दिसून `onAppear` call होते.

म्हणून view चा creation phase आणि display phase वेगळे आहेत हे समजून घेणे आवश्यक आहे.

### `init` constructor

`init` हे Swift चे मूलभूत syntax आहे. `struct` आणि `class` दोन्हीमध्ये ते define करता येते, आणि object initialize करण्यासाठी वापरले जाते.

```swift
init() {}
```

SwiftUI मध्ये view तयार होताना system त्या view चा `init` method call करते. याचा उपयोग parameters स्वीकारण्यासाठी किंवा initialization data तयार करण्यासाठी करता येतो.

जर आपण `init` manually लिहिले नाही, तर Swift `struct` साठी default constructor आपोआप तयार करते.

`ContentView` सारख्या SwiftUI views साठी, view तयार होताना `init` execute होतो, आणि view दिसताना `onAppear` execute होते.

म्हणून `init` हा view तयार होताना चालणारा constructor आहे, आणि पुढे parameters pass करणे किंवा initialization data हाताळताना तो उपयोगी पडतो.

## सारांश

या धड्यात आपण app startup sequence शिकलो, म्हणजे entry file पासून `ContentView` file पर्यंत code execution कसे जाते ते समजले.

आपण SwiftUI view lifecycle समजलो: view तयार होताना `init` execute होते, स्क्रीनवर दिसताना `onAppear` execute होते, आणि view हटवला किंवा बंद झाला की `onDisappear` execute होते.

आपण view update mechanism देखील शिकलो: view हे state-driven असते. `@State` सारखी state बदलली की SwiftUI view refresh करते, `body` पुन्हा compute करते, आणि `body` मधील variablesही पुन्हा तयार होतात.

variables चा lifecycle view च्या lifecycle शी जोडलेला असतो, आणि `body` मधील temporary variables प्रत्येक refresh वेळी पुन्हा तयार होतात.

हा lifecycle आणि variables चा वर्तन पॅटर्न समजून घेतल्याने code अधिक चांगल्या प्रकारे organize करता येतो आणि app logic अधिक स्पष्ट बनतो.
