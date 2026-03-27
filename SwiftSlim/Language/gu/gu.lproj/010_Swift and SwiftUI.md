# Swift અને SwiftUI

Apple platforms માટે development શીખતી વખતે ઘણા tutorials Swift અને SwiftUI ને અલગ અલગ સમજાવે છે. આથી શરૂઆત કરનારને એવું લાગી શકે કે આ બે સંપૂર્ણપણે અલગ technologies છે.

હકીકતમાં Swift અને SwiftUI ખૂબ નજીકથી જોડાયેલા છે: Swift એ programming language છે, જે logic અને data માટે જવાબદાર છે; જ્યારે SwiftUI એ Swift પર આધારિત user interface framework છે, જે views ને render કરે છે અને interactions હેન્ડલ કરે છે.

આ પાઠ તમને એક સ્પષ્ટ સમજ આપશે: Swift શું છે, SwiftUI શું છે, અને code માં બંને કેવી રીતે સાથે કામ કરે છે.

## Swift શું છે?

Swift એ Apple દ્વારા રજૂ કરાયેલ આધુનિક programming language છે, જે iOS, macOS, watchOS અને tvOS જેવી platforms માટે applications બનાવવામાં વપરાય છે.

![swift](../../RESOURCE/010_swift.png)

Swift એ strongly typed, static language છે. તેનું ડિઝાઇન safety પર ધ્યાન આપે છે, જેથી ઘણા સામાન્ય programming errors (જેમ કે null pointer, out-of-bounds access વગેરે) ઓછા થાય. તે C અને Objective-C સાથે પણ સારી રીતે integrate થઈ શકે છે.

વાસ્તવિક development માં Swift સામાન્ય રીતે App ની logic layer માટે જવાબદાર હોય છે, જેમ કે data processing, network requests, storage operations વગેરે.

## SwiftUI શું છે?

SwiftUI એ Apple દ્વારા 2019 માં રજૂ કરાયેલ નવું interface-building framework છે. SwiftUI declarative programming model અપનાવે છે, જેથી developer ઓછા code વડે interface structure અને interaction વર્ણવી શકે.

![swiftui](../../RESOURCE/010_swiftui.png)

Declarative programming નો અર્થ એ છે કે developer ફક્ત system ને કહે છે કે શું બતાવવું છે; data બદલાય ત્યારે system પોતે view refresh કરે છે. interface state ને manually update કરવાની જરૂર ઓછી થાય છે, અને UI development સરળ બને છે.

SwiftUI ના core માં view components (`Text`, `Image`, `Button` વગેરે) અને layout containers (`VStack`, `HStack`, `ZStack` વગેરે) છે. આ components data binding અને state management દ્વારા પરસ્પર interact કરે છે, જેથી data બદલાય ત્યારે interface આપમેળે update થાય.

## Swift અને SwiftUI સાથે કેવી રીતે કામ કરે?

Swift અને SwiftUI ની જવાબદારીઓને આ રીતે સમજાવી શકાય:

**1. Swift: logic અને data હેન્ડલ કરે છે**

Swift નો મુખ્ય ઉપયોગ data manage કરવા, state store કરવા અને logic execute કરવા માટે થાય છે. આ code સામાન્ય રીતે view rendering ને સીધો અસર કરતો નથી, પણ data અને behavior માટે જવાબદાર રહે છે.

ઉદાહરણ તરીકે, Swift માં data process કરવું:

```swift
let markdown = try? String(contentsOf: url)
```

આ code માં variable declaration, constant definition, functions, control flow જેવી બાબતો આવે છે, અને તે સીધું interface બતાવતું નથી.

**2. SwiftUI: interface જાહેર કરે છે અને render કરે છે**

SwiftUI user interface નું layout અને content બનાવે છે. તેનો મુખ્ય ભાગ rendering અને view interaction છે.

ઉદાહરણ તરીકે, SwiftUI વડે text view બનાવવું:

```swift
Text("SwiftSlim")
```

આ બધા code elements interface બનાવે છે અને user interface સાથે સીધો સંબંધ ધરાવે છે.

### મૂળભૂત ઉદાહરણ

હવે એક સરળ SwiftUI ઉદાહરણ જોઈએ:

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

આ ઉદાહરણમાં:

**SwiftUI code**: `VStack`, `Image`, `Text`, `padding` બધું SwiftUI નું છે, જે interface બતાવવું અને layout ગોઠવવું સંભાળે છે.

**Swift code**: file ના ઉપરનું `//` comment અને `import SwiftUI` Swift code structure નો ભાગ છે; નીચેનું `#Preview` Xcode preview માટેનું macro છે, જે actual interface rendering માં ભાગ લેતું નથી.

### થોડું વધુ આગળનું ઉદાહરણ

વાસ્તવિક projects માં Swift અને SwiftUI ઘણી વાર એક સાથે વપરાય છે, જેથી બંને પોતાની મજબૂત બાબતો સંભાળી શકે:

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

આ ઉદાહરણમાં:

**SwiftUI code**: `@State` SwiftUI નું property wrapper છે, જે view ની mutable state જાહેર કરવા માટે વપરાય છે; `Button` અને `Text` SwiftUI view components છે, જે interface display અને user interaction માટે છે.

**Swift code**: `private var name` અને `func printName()` Swift code છે, જે data save કરે છે અને logic ચલાવે છે; તે સીધું view render કરતા નથી.

જ્યારે user button પર click કરે છે, ત્યારે SwiftUI button ની અંદરનું action ચલાવે છે:

```swift
Button("Print") {
    printName()
}
```

અહીં `Button` SwiftUI component છે, જ્યારે `printName()` actual logic હેન્ડલ કરતું Swift code છે.

આ સહકારને કારણે Swift અને SwiftUI ખૂબ સરળતાથી સાથે કામ કરે છે: Swift data અને logic સંભાળે છે, SwiftUI interface બતાવે છે.

## Swift અને SwiftUI code સામાન્ય રીતે ક્યાં લખાય?

SwiftUI માં interface `body` property દ્વારા return થતો view બનાવીને તૈયાર થાય છે. તેથી interface વર્ણવતો code સામાન્ય રીતે `body` ની અંદર લખાય છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

અહીં `Text` SwiftUI view component છે, તેથી તે `body` ની અંદર લખવું પડે છે. SwiftUI `body` વાંચીને interface બનાવે છે.

જ્યારે interface સાથે સીધો સંબંધ ન હોય એવો code, જેમ કે variables, functions અથવા data processing logic, સામાન્ય રીતે `body` ની બહાર લખાય છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {

    // Swift: data અથવા logic
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interface
    var body: some View {
        Text(name)
    }
}
```

ધ્યાન રાખો કે `body` ની અંદર પણ Swift syntax વાપરી શકાય છે, જેમ કે `if`, `for` વગેરે. પણ તે SwiftUI views કેવી રીતે generate કરવાના છે તે નિયંત્રિત કરવા માટે વપરાય છે:

```
if isLogin {
    Text("Welcome")
}
```

એટલે SwiftUI development ને સરળ રીતે આમ સમજાય: view code (`Text`, `Image`, `Button` વગેરે) સામાન્ય રીતે `body` ની અંદર લખાય છે; data અને logic code (variables, functions વગેરે) સામાન્ય રીતે `body` ની બહાર લખાય છે.

## Swift files

જેમ જેમ અભ્યાસ આગળ વધે છે, તેમ આપણે MVVM architecture પણ શીખીશું. તેમાં `ViewModel` અને `Model` layers ઘણી વાર શુદ્ધ Swift code થી બનેલી હોય છે, અને view layer (`SwiftUI`) થી સંપૂર્ણપણે અલગ હોય છે.

ઉદાહરણ તરીકે, application state manage કરતો class:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

અથવા data structure વર્ણવતું struct:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

આ પ્રકારના files data ને manage અને persist કરવા માટે છે, અને તેઓ સીધા view પર દેખાતા નથી, એટલે તેઓ સંપૂર્ણપણે Swift નો ભાગ છે.

## ઐતિહાસિક પૃષ્ઠભૂમિ

Swift અને SwiftUI વચ્ચેનો સંબંધ સમજવા માટે Apple development technology ના evolution ને પણ સમજવું જરૂરી છે. 2026 સુધી આ stack ઘણી વાર બદલાઈ અને આગળ વધ્યો છે.

### Swift નો ઇતિહાસ

Swift આવતાં પહેલાં Objective-C Apple platforms માટે મુખ્ય programming language હતી. તે C સાથે mixed programming ને support કરતી હતી. તેની syntax વધુ લાંબી હતી, અને શરૂઆત કરનાર માટે થોડી કઠિન પણ:

```Obj-c
// Objective-C નું syntax
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 માં Apple એ WWDC પર Swift language જાહેર કરી. Swift વધુ આધુનિક syntax ધરાવે છે, type safety વધુ સારી છે, અને ધીમે ધીમે Objective-C ને પાછળ મૂકી મુખ્ય development language બની ગઈ:

```swift
// Swift નું syntax
let name = "Fang"
print("Hello, \(name)")
```

પરંતુ Objective-C સંપૂર્ણપણે ગાયબ થયું નથી. ઘણા legacy projects અને system ના નીચલા સ્તરના frameworks માં તેનો હજી પણ વ્યાપક ઉપયોગ થાય છે. તેની મૂળભૂત syntax જાણી લેવી, જૂના projects maintain કરવા અને system internals સમજવા માટે ઉપયોગી છે.

### SwiftUI નો ઇતિહાસ

SwiftUI પહેલાં iOS પર **UIKit** અને macOS પર **AppKit** વપરાતાં હતા. આ frameworks "imperative" programming style અપનાવતા હતા. developer ને Storyboard માં controls drag-and-drop કરવા પડતા અથવા view state manually નિયંત્રિત કરતો code લખવો પડતો. code વધારે થતો અને maintenance cost પણ ઊંચી રહેતી, ખાસ કરીને interface logic વધુ જટિલ હોય ત્યારે.

![storyboard](../../RESOURCE/010_xcode.png)

2019 માં Apple એ WWDC પર SwiftUI સત્તાવાર રીતે રજૂ કર્યું. SwiftUI એ "declarative" programming paradigm લાવ્યું, જેણે UI development પ્રક્રિયાને ઘણી સરળ બનાવી.

![storyboard](../../RESOURCE/010_xcode1.png)

ધ્યાનમાં રાખવા જેવી વાત એ છે કે SwiftUI સંપૂર્ણપણે સ્વતંત્ર underlying implementation નથી. જુદી જુદી platforms પર તે મૂળભૂત રીતે UIKit (iOS) અથવા AppKit (macOS) સાથે bridge અને collaborate કરે છે; નીચલા સ્તરે તે હજી પણ આ frameworks પર આધારિત છે.

### Swift અને UIKit/AppKit નો સંબંધ

જોકે Swift એક general-purpose programming language છે અને Apple ની વિવિધ platforms પર ચાલી શકે છે, તે UIKit અથવા AppKit ને સંપૂર્ણપણે replace નથી કરતી. કેટલીક જટિલ interface જરૂરિયાતો માટે, અથવા SwiftUI હજી support ન કરતી capabilities માટે, UIKit અથવા AppKit હજી પણ જરૂરી બને છે.

ઉદાહરણ તરીકે, UIKit view controller management, animation effects, gesture recognition જેવી બાબતોમાં ખૂબ પરિપક્વ છે અને તેમાં ઘણું production અનુભવ સંગ્રહિત છે. SwiftUI સતત મજબૂત बनी રહી છે, પણ અમુક edge cases માં હજી મર્યાદાઓ હોઈ શકે છે.

એટલે ઘણાં developers project માં SwiftUI ને UIKit (અથવા AppKit) સાથે mixed રીતે વાપરે છે, જેથી બંનેના ફાયદા મેળવી શકાય.

આ દૃષ્ટિએ જોઈએ તો SwiftUI ને UIKit / AppKit પરનું higher-level abstraction તરીકે સમજાવી શકાય. SwiftUI શીખતાં શીખતાં UIKit અને AppKit ના મૂળભૂત concepts પણ થોડાં જાણી લેવાં ઉપયોગી છે, ખાસ કરીને legacy projects maintain કરતી વખતે અથવા વધુ જટિલ features implement કરતી વખતે.

## સારાંશ

**Swift**: મુખ્યત્વે logic, data processing, control flow વગેરે માટે છે, અને view layout થી અલગ છે.

**SwiftUI**: declarative રીતે user interface બનાવવાનું framework છે; view content અને layout નો code SwiftUI નો ભાગ છે.

વાસ્તવિક development માં Swift અને SwiftUI સામાન્ય રીતે સાથે વપરાય છે: Swift logic હેન્ડલ કરે છે, SwiftUI interface.

Objective-C અને UIKit થી Swift અને SwiftUI સુધી Apple નું development environment ધીમે ધીમે વધુ આધુનિક અને સરળ બન્યું છે, પણ UIKit અને AppKit હજી પણ ઘણા પરંપરાગત projects માં મહત્વ ધરાવે છે.

Swift અને SwiftUI વચ્ચેનો સંબંધ સમજીને આપણે iOS/macOS development વધુ અસરકારક રીતે કરી શકીએ છીએ, અને legacy projects maintain કરતી વખતે પણ વધુ યોગ્ય technical decisions લઈ શકીએ છીએ.
