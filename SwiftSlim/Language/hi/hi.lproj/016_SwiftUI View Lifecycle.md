# SwiftUI view lifecycle

पिछले पाठ में हमने जाना कि `@State` variables view lifecycle के साथ चलती हैं, और `onAppear` का basic usage भी सीखा।

इस पाठ में हम SwiftUI view lifecycle को और व्यवस्थित रूप से समझेंगे: view कैसे create और display होती है, view के भीतर variables कैसे create और recreate होते हैं, और साथ ही `onAppear`、`onDisappear` तथा `init` constructor भी सीखेंगे।

इन concepts के माध्यम से, हम SwiftUI view building process की एक समग्र समझ बनाएँगे।

## app startup order

iOS project create करते समय, Xcode default रूप से दो files बनाता है:

```
ContentView.swift
ProjectName + App.swift
```

इनमें “ProjectName + App.swift” पूरी application की entry file होती है।

उदाहरण:

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

जब हम App run करते हैं (simulator या real device में), system `@main` keyword को खोजता है:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

entry file मिलने के बाद code execution शुरू होती है।

पहले `App` struct में प्रवेश किया जाता है, `body` के भीतर का code execute होता है, फिर `WindowGroup` create होती है और उसके भीतर `ContentView` load किया जाता है।

### `WindowGroup` का काम

`WindowGroup` windows manage करने के लिए उपयोग होती है:

```swift
WindowGroup {
    ContentView()
}
```

iPad और macOS systems में multi-window support होता है, जबकि iPhone में सामान्यतः केवल एक window होती है।

इसलिए, iPhone पर `WindowGroup` मुख्य रूप से first displayed screen को manage करती है।

### view loading process

system को `ContentView` मिलने के बाद:

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

SwiftUI `body` के भीतर का code execute करती है, और returned view structure (`VStack`、`Text` आदि) के आधार पर interface build करके उसे screen पर display करती है।

इन steps के बाद, हम view में `ContentView` देख सकते हैं।

![ContentView](../../Resource/016_view1.png)

ध्यान देने योग्य बात यह है कि `body` का काम view generate करना है, view store करना नहीं।

इसका अर्थ है कि हर बार view refresh होने पर, SwiftUI `body` को फिर से calculate करेगी और एक नई view structure generate करेगी।

### preview view logic

Xcode preview (`Canvas`) और actual app run दो अलग mechanisms हैं।

उदाहरण के लिए, entry file में एक debug output जोड़ें:

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

यदि Xcode में `ContentView` preview की जाए, तो execution `@main` entry से शुरू नहीं होगी, इसलिए entry file का `onAppear` trigger नहीं होगा।

लेकिन यदि simulator या physical device पर app run की जाए, तो system `@main` से execution शुरू करेगा, पूरे flow के अनुसार app run करेगा, entry में मौजूद `onAppear` trigger होगी, और debug information output होगी।

मुख्य अंतर यह है कि Xcode preview केवल “partial rendering” है, जो current view दिखाने के लिए होती है; simulator और physical device “complete runtime environment” देती हैं, जहाँ पूरा app execute होता है।

इसलिए, app features test करते समय simulator या physical device को आधार मानना चाहिए; Xcode preview complete runtime environment नहीं देती।

## view lifecycle

वर्तमान चरण में हमारा सारा code `ContentView` में केंद्रित है। लेकिन वास्तविक apps में सामान्यतः कई views होती हैं, और वे अलग-अलग scenarios में switch होती रहती हैं।

उदाहरण के लिए, “piggy bank” app में:

![PiggyBank](../../Resource/016_view.png)

जब “Save” पर click किया जाए, तो `SaveView` दिखाई दे; saving पूरी होने या view बंद होने पर, `SaveView` हट जाए।

यही एक view का lifecycle है: view create होना, display होना, और अंत में remove हो जाना।

### app बंद करना

जब App बंद होती है, सभी views remove हो जाती हैं, और संबंधित state भी समाप्त हो जाती है।

इसलिए `ContentView` और अन्य views memory से हट जाती हैं, और पूरी App की runtime state clear हो जाती है।

## view में variables का lifecycle

SwiftUI में variables का lifecycle अक्सर view के साथ बँधा होता है।

उदाहरण:

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

`@State` से declare की गई variable view lifecycle से बँधी होती है।

```swift
@State private var name = "FangJunyu"
```

जब view create होगी, `name` भी create होगी; जब view remove होगी, `name` भी destroy हो जाएगी।

इसीलिए `UserDefaults` जैसी techniques की आवश्यकता पड़ती है ताकि data persistence की जा सके।

### `body` के अंदर की variables

`body` के भीतर define की गई variable:

```swift
var num = 10
```

उसका lifecycle `body` के execution process से बँधा होता है।

जब SwiftUI की state change होती है, उदाहरण:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

जब `name` बदलती है, `@State` data change detect करती है और SwiftUI को view को फिर से calculate करने के लिए notify करती है; तब `body` फिर से calculate होती है।

जब `body` फिर से calculate होती है, उसके भीतर का सारा code फिर से execute होता है, और `body` के भीतर की variables (`num` जैसी) फिर से create हो जाती हैं।

इसी कारण `body` के भीतर complex variables define करना recommended नहीं है।

क्योंकि हर refresh पर `body` की variables फिर से create होंगी, इससे calculation cost बढ़ेगी और performance प्रभावित होगी।

SwiftUI में, अलग-अलग data को अलग तरीके से manage करना चाहिए: जो data view lifecycle के साथ चलती हो, उसे `@State` में save किया जा सकता है; temporary calculated data को `body` में रखा जा सकता है।

## `onAppear` और `onDisappear`

पिछले पाठ में हम `onAppear` सीख चुके हैं: जब view display होती है, तो `onAppear` call होती है।

```swift
.onAppear {}
```

उदाहरण:

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

Xcode preview या actual run के दौरान, `onAppear` के भीतर का debug output देखा जा सकता है।

### `onDisappear`

`onAppear` के अनुरूप `onDisappear` होती है:

```swift
.onDisappear {}
```

जब view बंद होती है, `onDisappear` call होती है।

उदाहरण:

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

जब view remove होगी, `onDisappear` के भीतर का code call होगा।

सुझाव: वर्तमान चरण में उपयोग की जा रही `ContentView` app की root view है, इसलिए इसे सीधे बंद या remove नहीं किया जा सकता। इसलिए इस चरण में `onDisappear` का effect सीधे observe नहीं किया जा सकता।

आगे page navigation और new view opening सीखते समय, हम `onDisappear` का actual effect देख पाएँगे।

## creation और display logic

ध्यान दें कि view creation और view display दो अलग stages हैं।

जब view create होती है, तब struct का constructor call होता है:

```swift
init() {}
```

क्योंकि SwiftUI view एक `struct` होती है:

```swift
struct ContentView: View { ... }
```

इसलिए जब view instance create होती है, `init` constructor execute होती है। और जब view display होती है, तब `onAppear` execute होती है।

उदाहरण:

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

जब Xcode में view preview की जाती है, debug output में यह देखा जा सकता है:

```swift
Create ContentView
Show ContentView
```

यह दर्शाता है कि पहले `init` execute होती है और view create होती है, फिर `body` का code calculate होता है, और अंत में view display होकर `onAppear` execute होती है।

इसलिए यह समझना ज़रूरी है कि view creation और display phases अलग-अलग होती हैं।

### `init` constructor

`init` Swift की basic syntax है। `struct` और `class` दोनों में इसे define किया जा सकता है, और यह object initialization के लिए उपयोग होती है।

```swift
init() {}
```

SwiftUI में, जब view create होती है, system view की `init` method call करता है। इसका उपयोग parameters receive करने या initial data setup करने के लिए किया जा सकता है।

यदि manually `init` न लिखी जाए, तो Swift `struct` के लिए default constructor automatically generate कर देती है।

`ContentView` जैसी SwiftUI views के लिए: view create होने पर `init` execute होती है, और view display होने पर `onAppear` execute होती है।

इसलिए, `init` वह constructor है जो view create होने पर execute होती है; आगे parameters pass करने या data initialize करने के समय इसका उपयोग होगा।

## सारांश

इस पाठ में हमने app startup order सीखा, यानी entry file से `ContentView` file तक का execution flow।

हमने SwiftUI view lifecycle समझी: view create होने पर `init` execute होती है, screen पर display होने पर `onAppear`, और remove या close होने पर `onDisappear` execute होती है।

हमने view update mechanism भी सीखी: view state-driven होती है। जब `@State` जैसी state बदलती है, SwiftUI view refresh करती है, `body` को फिर से calculate करती है, और `body` के भीतर की variables भी फिर से create हो जाती हैं।

variables का lifecycle view lifecycle से बँध सकता है, जबकि `body` के भीतर की temporary variables हर refresh पर फिर से create होती हैं।

इन lifecycles और variable behavior को समझना code को अधिक व्यवस्थित करने और app logic को अधिक स्पष्ट बनाने में मदद करता है।
