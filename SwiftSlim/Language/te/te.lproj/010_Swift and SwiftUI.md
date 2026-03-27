# Swift మరియు SwiftUI

Apple ప్లాట్‌ఫారమ్ అభివృద్ధిని నేర్చుకునే సమయంలో, చాలా ట్యుటోరియల్స్ Swift మరియు SwiftUI ను వేర్వేరుగా వివరించే ప్రవణత కలిగి ఉంటాయి. ఇది ప్రారంభ స్థాయి విద్యార్థుల్లో విభజితమైన భావనను కలిగించి, అవి పూర్తిగా స్వతంత్రమైన రెండు వేరు సాంకేతికతలని తప్పుగా అనిపించవచ్చు.

వాస్తవానికి, Swift మరియు SwiftUI లోతుగా కలిసిన సమగ్ర వ్యవస్థ: Swift అనేది ప్రోగ్రామింగ్ భాష, ఇది లాజిక్ మరియు డేటాను అందిస్తుంది; SwiftUI అయితే Swift పై నిర్మించబడిన యూజర్ ఇంటర్‌ఫేస్ ఫ్రేమ్‌వర్క్, ఇది views యొక్క rendering మరియు interaction ను నిర్వహిస్తుంది.

ఈ పాఠం మీకు ఒక స్పష్టమైన అవగాహన రూపకల్పనలో సహాయం చేస్తుంది: Swift అంటే ఏమిటి, SwiftUI అంటే ఏమిటి, మరియు అవి కోడ్‌లో ఎలా పరస్పరం సహకరిస్తాయి.

## Swift అంటే ఏమిటి?

Swift అనేది Apple విడుదల చేసిన ఆధునిక ప్రోగ్రామింగ్ భాష. ఇది iOS, macOS, watchOS మరియు tvOS వంటి ప్లాట్‌ఫారమ్‌లపై అప్లికేషన్లు అభివృద్ధి చేయడానికి ఉపయోగించబడుతుంది.

![swift](../../RESOURCE/010_swift.png)

Swift ఒక strong-typed, static language. దీని రూపకల్పనలో భద్రతపై ఎక్కువ దృష్టి ఉంటుంది, అందువల్ల చాలా సాధారణ ప్రోగ్రామింగ్ లోపాలు (ఉదాహరణకు null pointer, out-of-bounds వంటి సమస్యలు) తగ్గుతాయి. అదనంగా, ఇది C మరియు Objective-C తో సులభంగా కలిసి పనిచేయగలదు.

వ్యవహారిక అభివృద్ధిలో, Swift ప్రధానంగా అప్లికేషన్ యొక్క లాజిక్ భాగాన్ని నిర్వహిస్తుంది. ఉదాహరణకు data processing, network requests, storage operations వంటి పనులు.

## SwiftUI అంటే ఏమిటి？

SwiftUI అనేది Apple 2019 లో విడుదల చేసిన కొత్త interface నిర్మాణ framework. SwiftUI declarative programming విధానాన్ని ఉపయోగిస్తుంది, ఇది developers కు మరింత సరళమైన కోడ్‌తో interface నిర్మాణం మరియు interaction behavior ను వివరించడానికి అనుమతిస్తుంది.

![swiftui](../../RESOURCE/010_swiftui.png)

Declarative programming అంటే developer కేవలం ఏమి చూపించాలనుకుంటున్నాడో system కు తెలియజేస్తాడు; ఆ తర్వాత data మార్పుల ఆధారంగా system స్వయంచాలకంగా view ను refresh చేస్తుంది. ఇక interface state ను మనమే చేతితో update చేయాల్సిన అవసరం ఉండదు. దీంతో UI development యొక్క క్లిష్టత చాలా వరకు తగ్గుతుంది.

SwiftUI యొక్క core భాగాలు view components (ఉదాహరణకు Text, Image, Button మొదలైనవి) మరియు layout containers (ఉదాహరణకు VStack, HStack, ZStack). ఈ components data binding మరియు state management ద్వారా పరస్పరం పనిచేస్తాయి, అందువల్ల interface data మార్పులకు స్పందించి స్వయంగా refresh అవుతుంది.

## Swift మరియు SwiftUI ఎలా కలిసి పని చేస్తాయి?

Swift మరియు SwiftUI యొక్క బాధ్యతలను క్రింది విధంగా సంక్షిప్తంగా చెప్పవచ్చు:

**1. Swift：లాజిక్ మరియు డేటాను నిర్వహిస్తుంది**

Swift ప్రధానంగా data ను నిర్వహించడం, state ను నిల్వ చేయడం, మరియు logic ను అమలు చేయడం కోసం ఉపయోగించబడుతుంది. ఈ కోడ్ సాధారణంగా interface rendering ను నేరుగా ప్రభావితం చేయదు; బదులుగా data మరియు behavior ను నిర్వహిస్తుంది.

ఉదాహరణకు, Swift లో data ని process చేయడం:

```swift
let markdown = try? String(contentsOf: url)
```

ఈ కోడ్‌లో variable declaration, constant definition, functions, control flow వంటి అంశాలు ఉంటాయి; ఇవి నేరుగా view ప్రదర్శనను ప్రభావితం చేయవు.

**2. SwiftUI：interface ను declare చేసి render చేస్తుంది**

SwiftUI అయితే user interface యొక్క layout మరియు content ను నిర్మించడానికి ఉపయోగించబడుతుంది. ఇది ప్రధానంగా interface rendering మరియు view interaction ను నిర్వహిస్తుంది.

ఉదాహరణకు, SwiftUI ఉపయోగించి ఒక text view సృష్టించడం:

```swift
Text("SwiftSlim")
```

ఇవి అన్నీ interface elements ను నిర్మించడానికి మరియు నియంత్రించడానికి ఉపయోగించే కోడ్, మరియు నేరుగా user interface తో పని చేస్తాయి.

### ప్రాథమిక ఉదాహరణ

కింద ఒక సరళమైన SwiftUI ఉదాహరణ ఉంది:

```swift
// ContentView.swift

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

#Preview {
    ContentView()
}
```

ఈ ఉదాహరణలో:

**SwiftUI కోడ్**：VStack、Image、Text、padding ఇవన్నీ SwiftUI కు చెందినవి, ఇవి interface ప్రదర్శన మరియు layout ను నిర్వహిస్తాయి.

**Swift కోడ్**：ఫైల్ పైభాగంలో ఉన్న // comment మరియు import SwiftUI అనేవి Swift కోడ్ నిర్మాణానికి చెందినవి; కింద ఉన్న #Preview అనేది Xcode preview కోసం ఉపయోగించే macro, ఇది నిజమైన interface rendering లో పాల్గొనదు.

### మరింత ముందున్న ఉదాహరణ

వ్యవహారిక ప్రాజెక్టుల్లో, Swift మరియు SwiftUI తమ తమ బలమైన పనులను పూర్తి చేయడానికి తరచుగా కలిపి ఉపయోగించబడతాయి:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

ఈ ఉదాహరణలో:

**SwiftUI కోడ్**：@State అనేది SwiftUI కి ప్రత్యేకమైన property wrapper, ఇది view యొక్క mutable state ను ప్రకటించడానికి ఉపయోగించబడుతుంది; Button మరియు Text అనేవి SwiftUI view components, ఇవి interface display మరియు user interaction ను నిర్వహిస్తాయి.

**Swift కోడ్**：private var name మరియు func printName() అనేవి Swift కోడ్, ఇవి data నిల్వ చేయడానికి మరియు logic ను అమలు చేయడానికి ఉపయోగించబడతాయి. ఇవి నేరుగా view rendering ను ప్రభావితం చేయవు.

User బటన్‌ను నొక్కినప్పుడు, SwiftUI బటన్‌లోని ఆపరేషన్ కోడ్‌ను trigger చేస్తుంది:

```swift
Button("Print") {
    printName()
}
```

ఇందులో, Button అనేది SwiftUI component కాగా, అమలయ్యే printName() function మాత్రం Swift కోడ్, ఇది నిర్దిష్ట logic ను నిర్వహిస్తుంది.

ఈ సహకారం వల్ల Swift మరియు SwiftUI ఎటువంటి అంతరాయం లేకుండా కలిసి పని చేస్తాయి. Swift data మరియు logic ను నిర్వహిస్తే, SwiftUI user interface ప్రదర్శనను నిర్వహిస్తుంది.

## Swift మరియు SwiftUI కోడ్ సాధారణంగా ఎక్కడ వ్రాయబడుతుంది?

SwiftUI లో, interface అనేది body property ద్వారా return అయ్యే view ఆధారంగా నిర్మించబడుతుంది. అందువల్ల, interface ను వివరించే అన్ని కోడ్‌లు సాధారణంగా body లో వ్రాయబడతాయి.

ఉదాహరణకు:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

ఈ ఉదాహరణలో, Text అనేది SwiftUI view component. కాబట్టి ఇది తప్పనిసరిగా body లో ఉండాలి, ఎందుకంటే SwiftUI body ద్వారా దానిని చదివి interface ను రూపొందిస్తుంది.

Interface కు నేరుగా సంబంధం లేని కోడ్, ఉదాహరణకు variables, functions లేదా data processing logic, సాధారణంగా body వెలుపల వ్రాయబడుతుంది. ఉదాహరణకు:

```swift
struct ContentView: View {

    // Swift：డేటా లేదా లాజిక్
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：ఇంటర్‌ఫేస్
    var body: some View {
        Text(name)
    }
}
```

గమనించాల్సిన విషయం ఏమిటంటే, body లో కూడా Swift syntax ను ఉపయోగించవచ్చు. ఉదాహరణకు if, for వంటి control flow statements. అయితే అవి కేవలం SwiftUI views రూపొందించడాన్ని నియంత్రించడానికి మాత్రమే ఉపయోగించబడతాయి:

```swift
if isLogin {
    Text("Welcome")
}
```

అందువల్ల, SwiftUI అభివృద్ధిలో దీనిని సులభంగా ఇలా అర్థం చేసుకోవచ్చు: view code (Text, Image, Button మొదలైనవి) సాధారణంగా body లో వ్రాయబడుతుంది; data మరియు logic code (variables, functions మొదలైనవి) సాధారణంగా body వెలుపల వ్రాయబడుతుంది.

## Swift ఫైళ్లు

అభ్యాసం మరింత లోతుగా వెళ్తున్న కొద్దీ, మనం MVVM architecture ను కూడా పరిచయం అవుతాము. అందులో ViewModel మరియు Model లేయర్లు సాధారణంగా pure Swift కోడ్‌తో నిర్మించబడతాయి, మరియు view layer (SwiftUI) నుండి పూర్తిగా వేరుగా ఉంటాయి.

ఉదాహరణకు, app state ను నిర్వహించడానికి ఉపయోగించే class:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

లేదా data structure ను వివరించే struct:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

ఈ రకమైన ఫైళ్ల బాధ్యత data ను నిర్వహించడం మరియు persistent గా నిల్వ చేయడం. ఇవి నేరుగా view లో చూపించబడవు, కాబట్టి ఇవి పూర్తిగా Swift కు చెందినవి.

## చారిత్రక నేపథ్యం

Swift మరియు SwiftUI మధ్య ఉన్న సంబంధాన్ని అర్థం చేసుకోవాలంటే, Apple development technology ఎలా మారుతూ వచ్చిందో కూడా తెలుసుకోవాలి. 2026 నాటికి, ఈ technology stack అనేక మార్లు పరిణామం చెందింది.

### Swift యొక్క చరిత్ర

Swift రాకముందు, Objective-C అనేది Apple ప్లాట్‌ఫారమ్‌లలో ప్రధాన programming language గా ఉండేది. ఇది C language తో కలిసి పని చేయగలదు. అయితే దీని syntax కొంత పొడవుగా ఉండేది, అందువల్ల beginners కు ఇది కొంత క్లిష్టంగా అనిపించేది:

```Obj-c
// Objective-C 的写法
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 లో, Apple WWDC లో Swift భాషను విడుదల చేసింది. Swift syntax మరింత ఆధునికంగా ఉండటం, type safety ఎక్కువగా ఉండటం వలన, ఇది క్రమంగా Objective-C ను భర్తీ చేస్తూ ప్రధాన development language గా మారింది:

```swift
// Swift 的写法
let name = "Fang"
print("Hello, \(name)")
```

అయితే, Objective-C పూర్తిగా చరిత్రలో కలిసిపోలేదు. ఇది ఇప్పటికీ అనేక legacy projects మరియు low-level frameworks లో విస్తృతంగా ఉపయోగించబడుతోంది. దాని ప్రాథమిక syntax ను తెలుసుకోవడం, పాత ప్రాజెక్టులను నిర్వహించడంలో మరియు system లోతైన స్థాయి నిర్మాణాన్ని అర్థం చేసుకోవడంలో ఉపయోగకరంగా ఉంటుంది.

### SwiftUI యొక్క చరిత్ర

SwiftUI రాకముందు, iOS లో **UIKit**, macOS లో **AppKit** ఉపయోగించబడేవి. ఈ రెండు frameworks "imperative" programming విధానాన్ని అనుసరించేవి. Developers Storyboard ద్వారా controls ను drag-and-drop చేయాలి లేదా చేతితో కోడ్ వ్రాసి view state ను నియంత్రించాలి. దీనివల్ల కోడ్ పరిమాణం పెద్దది అవుతుంది, maintenance cost కూడా పెరుగుతుంది, ముఖ్యంగా interface logic క్లిష్టంగా ఉన్నప్పుడు ఇది మరింత స్పష్టంగా కనిపిస్తుంది.

![storyboard](../../RESOURCE/010_xcode.png)

2019 లో, Apple WWDC లో SwiftUI ను అధికారికంగా విడుదల చేసింది. SwiftUI "declarative" programming paradigm ను పరిచయం చేసి, UI development ప్రక్రియను గణనీయంగా సరళీకరించింది.

![storyboard](../../RESOURCE/010_xcode1.png)

ఇక్కడ గమనించాల్సిన విషయం ఏమిటంటే, SwiftUI పూర్తిగా స్వతంత్రంగా నిర్మించబడిన low-level implementation కాదు. ప్రతి ప్లాట్‌ఫారమ్‌లో, ఇది అసలు విషయానికి వస్తే UIKit (iOS) లేదా AppKit (macOS) తో bridge అయి, వాటితో కలిసి పని చేస్తుంది. లోతైన స్థాయిలో ఇది ఇప్పటికీ ఈ రెండు frameworks పైనే ఆధారపడుతుంది.

### Swift మరియు UIKit/AppKit మధ్య సంబంధం

Swift ఒక సాధారణ programming language అయినప్పటికీ, మరియు అది Apple ప్లాట్‌ఫారమ్‌లన్నిటిలోనూ పని చేయగలిగినా, అది UIKit లేదా AppKit ను పూర్తిగా భర్తీ చేయలదు. కొన్ని క్లిష్టమైన interface అవసరాల కోసం, లేదా SwiftUI ఇంకా కవర్ చేయని ఫీచర్ల కోసం, ఇంకా UIKit లేదా AppKit సహాయం అవసరమవుతుంది.

ఉదాహరణకు, UIKit లో complex view controller management, animation effects, gesture recognition వంటి అంశాలలో చాలా పక్వత ఉంది, మరియు ఇది విస్తృతమైన production practice ద్వారా నిరూపించబడింది. SwiftUI ఈ రంగాల్లో నిరంతరం మెరుగుపడుతున్నప్పటికీ, కొన్ని edge cases లో ఇంకా పరిమితులు ఉన్నాయి.

అందువల్ల, చాలా developers తమ ప్రాజెక్టుల్లో SwiftUI మరియు UIKit (లేదా AppKit) ను కలిపి ఉపయోగిస్తారు, తద్వారా రెండింటి బలాలను పూర్తిగా వినియోగించుకోవచ్చు.

ఈ కోణంలో చూస్తే, SwiftUI ను UIKit / AppKit పై నిర్మించబడిన ఒక higher-level abstraction గా అర్థం చేసుకోవచ్చు. SwiftUI నేర్చుకునే సమయంలో, UIKit మరియు AppKit యొక్క ప్రాథమిక భావనలను కూడా కొంత అర్థం చేసుకోవడం వల్ల, పాత ప్రాజెక్టులను నిర్వహించేటప్పుడు లేదా క్లిష్టమైన ఫీచర్లను అమలు చేయేటప్పుడు మరింత సరైన technical decisions తీసుకోవచ్చు.

## సారాంశం

**Swift**：ప్రధానంగా logic, data processing, control flow వంటి వాటిని వ్రాయడానికి ఉపయోగించబడుతుంది; ఇది view layout కు నేరుగా సంబంధించినది కాదు.

**SwiftUI**：declarative విధానంలో user interface ను నిర్మించడానికి ఉపయోగించబడుతుంది; view content మరియు layout కు సంబంధించిన కోడ్ SwiftUI కు చెందుతుంది.

వ్యవహారిక అభివృద్ధిలో, Swift మరియు SwiftUI సాధారణంగా కలిపి ఉపయోగించబడతాయి. Swift logic ను నిర్వహిస్తే, SwiftUI interface ను నిర్వహిస్తుంది.

Objective-C మరియు UIKit నుండి Swift మరియు SwiftUI వరకు, Apple యొక్క development environment క్రమంగా మరింత ఆధునిక, సరళమైన programming విధానాల వైపు మారింది. అయినప్పటికీ, UIKit మరియు AppKit అనేవి అనేక సంప్రదాయ ప్రాజెక్టుల్లో ఇప్పటికీ నిర్లక్ష్యం చేయలేని భాగాలే.

Swift మరియు SwiftUI మధ్య సంబంధాన్ని అర్థం చేసుకోవడం ద్వారా, మనం iOS/macOS అభివృద్ధిని మరింత సమర్థంగా చేయగలుగుతాము. అలాగే పాత ప్రాజెక్టులను నిర్వహించే సమయంలో, మరింత సరైన technical choices తీసుకోవడం కూడా సాధ్యమవుతుంది.
