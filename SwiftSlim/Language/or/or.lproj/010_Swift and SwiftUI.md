# Swift ଏବଂ SwiftUI

Apple ପ୍ଲାଟଫର୍ମ ଡିଭେଲପମେଣ୍ଟ ଶିଖୁଥିବାବେଳେ, ଅନେକ ଟ୍ୟୁଟୋରିଆଲ୍ Swift ଏବଂ SwiftUI କୁ ଅଲଗା ଅଲଗା ଭାବରେ ବ୍ୟାଖ୍ୟା କରିବାକୁ ଝୁକୁଛି। ଏହାରେ ଆରମ୍ଭିକ ଶିକ୍ଷାର୍ଥୀମାନେ ଭିତରେ ଭାଙ୍ଗା ଭାଙ୍ଗା ବୁଝାମଣା ତିଆରି ହୁଏ, ଏବଂ ସେମାନେ ଭୁଲରେ ଭାବିପାରନ୍ତି ଯେ ଏଗୁଡିକ ଦୁଇଟି ସମ୍ପୂର୍ଣ୍ଣ ସ୍ୱତନ୍ତ୍ର ପ୍ରଯୁକ୍ତି।

ବାସ୍ତବରେ, Swift ଏବଂ SwiftUI ଗଭୀର ଭାବେ ଏକତ୍ରିତ ଏକ ସମଗ୍ର ପ୍ରଣାଳୀ: Swift ହେଉଛି ପ୍ରୋଗ୍ରାମିଙ୍ଗ ଭାଷା, ଯାହା ଲଜିକ୍ ଏବଂ ଡାଟା ପ୍ରଦାନ କରେ; SwiftUI ହେଉଛି Swift ଉପରେ ନିର୍ମିତ ୟୁଜର୍ ଇଣ୍ଟରଫେସ୍ ଫ୍ରେମୱର୍କ, ଯାହା view ର render ଏବଂ interaction ପାଇଁ ଦାୟୀ।

ଏହି ପାଠ ଆପଣଙ୍କୁ ଗୋଟିଏ ସ୍ପଷ୍ଟ ବୁଝାମଣା ଫ୍ରେମୱର୍କ ତିଆରି କରିଦେବ: Swift କ’ଣ, SwiftUI କ’ଣ, ଏବଂ କୋଡ୍‌ରେ ସେମାନେ କିପରି ପରସ୍ପର ସହକାର କରନ୍ତି।

## Swift କ’ଣ?

Swift ହେଉଛି Apple ଦ୍ୱାରା ପ୍ରଚାରିତ ଗୋଟିଏ ଆଧୁନିକ ପ୍ରୋଗ୍ରାମିଙ୍ଗ ଭାଷା, ଯାହା iOS, macOS, watchOS ଏବଂ tvOS ପରି ପ୍ଲାଟଫର୍ମଗୁଡିକ ପାଇଁ ଆପ୍‌ ଡିଭେଲପ କରିବାରେ ବ୍ୟବହୃତ ହୁଏ।

![swift](../../RESOURCE/010_swift.png)

Swift ହେଉଛି ଗୋଟିଏ strong-typed, static language। ଏହାର ଡିଜାଇନ୍‌ ସୁରକ୍ଷାକୁ ଅଧିକ ଗୁରୁତ୍ୱ ଦେଇଥାଏ, ଏବଂ ଅନେକ ସାଧାରଣ ପ୍ରୋଗ୍ରାମିଙ୍ଗ ତ୍ରୁଟିକୁ କମେଇଦେଇଥାଏ (ଯଥା null pointer, out-of-bounds ଇତ୍ୟାଦି), ସହିତ C ଏବଂ Objective-C ସହ ନିର୍ବିଘ୍ନ ଭାବେ ଏକତ୍ର କାମ କରିପାରେ।

ବାସ୍ତବ ଡିଭେଲପମେଣ୍ଟରେ, Swift ଅଧିକ ଭାଗରେ ଆପ୍‌ର logic layer ପାଇଁ ଦାୟୀ ହୁଏ, ଯଥା data processing, network requests, storage operations ଇତ୍ୟାଦି।

## SwiftUI କ’ଣ?

SwiftUI ହେଉଛି Apple ଦ୍ୱାରା 2019 ରେ ପ୍ରଚାରିତ ଗୋଟିଏ ନୂତନ UI-building framework। SwiftUI declarative programming model ଗ୍ରହଣ କରେ, ଯାହା ଡିଭେଲପର୍‌ମାନଙ୍କୁ ଅଧିକ ସରଳ କୋଡ୍‌ ଦ୍ୱାରା interface structure ଏବଂ interaction behavior ବର୍ଣ୍ଣନା କରିବାକୁ ଅନୁମତି ଦେଏ।

![swiftui](../../RESOURCE/010_swiftui.png)

Declarative programming ର ଅର୍ଥ ହେଉଛି ଡିଭେଲପର୍‌କୁ କେବଳ ସିଷ୍ଟମ୍‌କୁ କହିବାକୁ ପଡେ କ’ଣ ଦେଖାଇବାକୁ ଚାହୁଁଛନ୍ତି; ଡାଟାର ପରିବର୍ତ୍ତନ ଅନୁଯାୟୀ ସିଷ୍ଟମ୍ ସ୍ୱୟଂଚାଳିତ ଭାବେ view କୁ refresh କରିଦେବ। ହାତରେ interface state update କରିବା ଆବଶ୍ୟକ ନଥାଏ, ଯାହା UI development ର complexity କୁ ବହୁ ମାତ୍ରାରେ ସରଳ କରେ।

SwiftUI ର ମୂଳ ଅଂଶ ହେଉଛି view components (ଯଥା `Text`, `Image`, `Button` ଇତ୍ୟାଦି) ଏବଂ layout containers (ଯଥା `VStack`, `HStack`, `ZStack`)। ଏହି component ମାନେ data binding ଏବଂ state management ଦ୍ୱାରା ପରସ୍ପର କାମ କରନ୍ତି, ଯାହା ଫଳରେ interface ଡାଟା ପରିବର୍ତ୍ତନକୁ ପ୍ରତିକ୍ରିୟା କରି ସ୍ୱୟଂଚାଳିତ ଭାବେ refresh ହୋଇପାରେ।

## Swift ଏବଂ SwiftUI କିପରି ସହଯୋଗ କରନ୍ତି?

Swift ଏବଂ SwiftUI ର ଦାୟିତ୍ୱଗୁଡିକୁ ନିମ୍ନପ୍ରକାର ସାରାଂଶ କରାଯାଇପାରେ:

**1. Swift: ଲଜିକ୍ ଏବଂ ଡାଟା ପ୍ରକ୍ରିୟାକରଣ**

Swift ପ୍ରାଧାନତଃ data manage କରିବା, state store କରିବା ଏବଂ logic execute କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ଏହି କୋଡ୍ ସାଧାରଣତଃ ସିଧାସଳଖ interface render କୁ ପ୍ରଭାବିତ କରେନାହିଁ; ବରଂ data ଏବଂ behavior ର ପ୍ରକ୍ରିୟାକରଣ ପାଇଁ ଦାୟୀ ରହେ।

ଉଦାହରଣ ସ୍ୱରୂପ, Swift ରେ data process କରିବା:

```swift
let markdown = try? String(contentsOf: url)
````

ଏହି କୋଡ୍‌ରେ variable declaration, constant definition, function, control flow ଇତ୍ୟାଦି ଅଛି, କିନ୍ତୁ ଏଗୁଡିକ ସିଧାସଳଖ view ପ୍ରଦର୍ଶନକୁ ପ୍ରଭାବିତ କରେନାହିଁ।

**2. SwiftUI: interface ଘୋଷଣା ଏବଂ render କରିବା**

SwiftUI ୟୁଜର୍ interface ର layout ଏବଂ content ତିଆରି କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ଏହା ପ୍ରାଧାନତଃ interface render କରିବା ଏବଂ view interaction ପାଇଁ ଦାୟୀ।

ଉଦାହରଣ ସ୍ୱରୂପ, SwiftUI ବ୍ୟବହାର କରି ଗୋଟିଏ text view ସୃଷ୍ଟି କରିବା:

```swift
Text("SwiftSlim")
```

ଏଗୁଡିକ ସବୁ interface elements ତିଆରି ଏବଂ ନିୟନ୍ତ୍ରଣ ପାଇଁ ବ୍ୟବହୃତ କୋଡ୍, ଯାହା ସିଧାସଳଖ user interface ସହ ଜଡିତ।

### ମୂଳ ଉଦାହରଣ

ନିମ୍ନରେ ଗୋଟିଏ ସରଳ SwiftUI ଉଦାହରଣ ଦିଆଯାଇଛି:

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

ଏହି ଉଦାହରଣରେ:

**SwiftUI କୋଡ୍**: `VStack`, `Image`, `Text`, `padding` ସବୁ SwiftUI ର ଅଂଶ, ଯାହା interface ପ୍ରଦର୍ଶନ ଏବଂ layout ପାଇଁ ଦାୟୀ।

**Swift କୋଡ୍**: ଫାଇଲ୍‌ର ଶୀର୍ଷରେ ଥିବା `//` comment ଏବଂ `import SwiftUI` Swift କୋଡ୍‌ର ଗଠନର ଅଂଶ; ତଳର `#Preview` ହେଉଛି Xcode preview ପାଇଁ ବ୍ୟବହୃତ macro, ଯାହା ବାସ୍ତବ interface rendering ରେ ଭାଗ ନେଉନାହିଁ।

### ଉନ୍ନତ ଉଦାହରଣ

ବାସ୍ତବ ପ୍ରକଳ୍ପରେ, Swift ଏବଂ SwiftUI ପ୍ରାୟତଃ ମିଶିତିବା ଭାବରେ ବ୍ୟବହୃତ ହୁଏ, ଯାହାରେ ପ୍ରତ୍ୟେକ ନିଜ ନିଜ ଦକ୍ଷତାର କାମ କରେ:

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

ଏହି ଉଦାହରଣରେ:

**SwiftUI କୋଡ୍**: `@State` ହେଉଛି SwiftUI ର ଏକ ବିଶେଷ property wrapper, ଯାହା view ର mutable state ଘୋଷଣା କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ; `Button` ଏବଂ `Text` ହେଉଛନ୍ତି SwiftUI view components, ଯେଉଁମାନେ interface display ଏବଂ user interaction ପାଇଁ ଦାୟୀ।

**Swift କୋଡ୍**: `private var name` ଏବଂ `func printName()` Swift କୋଡ୍‌ର ଅଂଶ, ଯାହା data store କରିବା ଏବଂ logic execute କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ, କିନ୍ତୁ ସିଧାସଳଖ view rendering କୁ ପ୍ରଭାବିତ କରେନାହିଁ।

ଯେତେବେଳେ user ବଟନ୍‌କୁ କ୍ଲିକ୍ କରେ, SwiftUI ବଟନ୍‌ର ଭିତର ଥିବା operation code କୁ trigger କରେ:

```swift
Button("Print") {
    printName()
}
```

ଏଠାରେ `Button` ହେଉଛି SwiftUI component, ଏବଂ execute ହେଉଥିବା `printName()` function ହେଉଛି Swift କୋଡ୍‌, ଯାହା ନିର୍ଦ୍ଦିଷ୍ଟ logic processing ପାଇଁ ଦାୟୀ।

ଏହି ସହଯୋଗ Swift ଏବଂ SwiftUI କୁ ନିର୍ବିଘ୍ନ ଭାବେ ଏକତ୍ର କରେ: Swift data ଏବଂ logic process କରେ, SwiftUI user interface ପ୍ରଦର୍ଶନ କରେ।

## Swift ଏବଂ SwiftUI କୋଡ୍ ସାଧାରଣତଃ କେଉଁଠି ଲେଖାଯାଏ?

SwiftUI ରେ, interface `body` property ଫେରାଇଥିବା view ଦ୍ୱାରା ତିଆରି ହୁଏ। ସେହିପାଇଁ, interface ବର୍ଣ୍ଣନା ପାଇଁ ବ୍ୟବହୃତ ସବୁ କୋଡ୍ ସାଧାରଣତଃ `body` ଭିତରେ ଲେଖାଯାଏ।

ଉଦାହରଣ:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

ଏହି ଉଦାହରଣରେ, `Text` ହେଉଛି SwiftUI view component, ତେଣୁ ଏହାକୁ ନିଶ୍ଚୟ `body` ଭିତରେ ଲେଖିବାକୁ ପଡିବ, କାରଣ SwiftUI `body` ଦ୍ୱାରା ଏହାକୁ ପଢି interface ତିଆରି କରେ।

ଯେ କୋଡ୍ interface ସହ ସମ୍ପର୍କିତ ନୁହେଁ, ଯଥା variables, functions କିମ୍ବା data-processing logic, ସେଗୁଡିକ ସାଧାରଣତଃ `body` ବାହାରେ ଲେଖାଯାଏ। ଉଦାହରଣ:

```swift
struct ContentView: View {

    // Swift：ଡାଟା କିମ୍ବା ଲଜିକ୍
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：ଇଣ୍ଟରଫେସ୍
    var body: some View {
        Text(name)
    }
}
```

ଧ୍ୟାନ ଦିଅନ୍ତୁ ଯେ, `body` ଭିତରେ ମଧ୍ୟ Swift syntax ବ୍ୟବହାର କରିହେବ, ଯଥା `if`, `for` ପରି control flow statements। କିନ୍ତୁ ସେମାନେ କେବଳ SwiftUI view ଗଠନକୁ ନିୟନ୍ତ୍ରଣ କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଅନ୍ତି:

```swift
if isLogin {
    Text("Welcome")
}
```

ସେହିପରି, SwiftUI development ରେ ସରଳ ଭାବେ ଏଭଳି ବୁଝିପାରିବେ: view କୋଡ୍ (`Text`, `Image`, `Button` ଇତ୍ୟାଦି) ସାଧାରଣତଃ `body` ଭିତରେ ଲେଖାଯାଏ; data ଏବଂ logic କୋଡ୍ (variables, functions ଇତ୍ୟାଦି) ସାଧାରଣତଃ `body` ବାହାରେ ଲେଖାଯାଏ।

## Swift ଫାଇଲ୍

ଶିକ୍ଷା ଆହୁରି ଗଭୀର ହେଲେ, ଆମେ MVVM architecture ସହ ମଧ୍ୟ ପରିଚିତ ହେବୁ। ଏଠାରେ ViewModel ଏବଂ Model layer ସାଧାରଣତଃ pure Swift କୋଡ୍‌ରେ ଗଠିତ ହୁଏ, ଏବଂ ସେମାନେ view layer (SwiftUI) ଠାରୁ ସମ୍ପୂର୍ଣ୍ଣ ଭାବେ ଅଲଗା ଥାନ୍ତି।

ଉଦାହରଣ ସ୍ୱରୂପ, app state manage କରିବା ପାଇଁ ଗୋଟିଏ class:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

କିମ୍ବା data structure ବର୍ଣ୍ଣନା ପାଇଁ ଗୋଟିଏ struct:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

ଏପରି ଫାଇଲ୍‌ଗୁଡିକର ଦାୟିତ୍ୱ ହେଉଛି data manage ଏବଂ persist କରିବା। ସେଗୁଡିକ ସିଧାସଳଖ view ରେ ଦେଖାଯାଏନି, ସେଥିପାଇଁ ସେମାନେ ସମ୍ପୂର୍ଣ୍ଣରୂପେ Swift ର ଅଂଶ।

## ଐତିହାସିକ ପୃଷ୍ଠଭୂମି

Swift ଏବଂ SwiftUI ର ସମ୍ପର୍କକୁ ବୁଝିବା ପାଇଁ, Apple development technology ର evolution କୁ ମଧ୍ୟ ବୁଝିବା ଆବଶ୍ୟକ। 2026 ପର୍ଯ୍ୟନ୍ତ, ଏହି technology stack ଅନେକ ଥର iteration ହୋଇଛି।

### Swift ର ଇତିହାସ

Swift ଆସିବା ପୂର୍ବରୁ, Objective-C ଥିଲା Apple platform ର ମୁଖ୍ୟ programming language, ଯାହା C language ସହ mixed programming କୁ support କରୁଥିଲା। ଏହାର syntax ଅନେକ ଲମ୍ବା ଏବଂ ଆରମ୍ଭିକ ଶିକ୍ଷାର୍ଥୀଙ୍କ ପାଇଁ ତୁଳନାମୂଳକ ଭାବେ କଠିନ ଥିଲା:

```objective-c
// Objective-C ର ଲେଖା
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 ରେ, Apple WWDC ରେ Swift language କୁ ପ୍ରଚାର କଲା। Swift ର syntax ଅଧିକ ଆଧୁନିକ, type safety ଅଧିକ, ଏବଂ ଏହା ଧୀରେ ଧୀରେ Objective-C କୁ ପରିବର୍ତ୍ତନ କରି ମୁଖ୍ୟ development language ହୋଇଯାଇଲା:

```swift
// Swift ର ଲେଖା
let name = "Fang"
print("Hello, \(name)")
```

କିନ୍ତୁ Objective-C ଇତିହାସରୁ ସମ୍ପୂର୍ଣ୍ଣ ଅଲୋପ ହୋଇଯାଇନାହିଁ। ଏହା ଅନେକ existing projects ଏବଂ low-level frameworks ରେ ଏବେମଧ୍ୟ ବ୍ୟାପକ ଭାବେ ବ୍ୟବହୃତ ହୁଏ। ଏହାର ମୂଳ syntax ବୁଝିବା, ପୁରୁଣା projects maintain କରିବା ଏବଂ system lower layer ବୁଝିବା ପାଇଁ ଏବେମଧ୍ୟ ଉପଯୋଗୀ।

### SwiftUI ର ଇତିହାସ

SwiftUI ଆସିବା ପୂର୍ବରୁ, iOS ରେ **UIKit** ଏବଂ macOS ରେ **AppKit** ବ୍ୟବହୃତ ହୁଏ। ଏହି ଦୁଇଟି framework "imperative" programming style ଗ୍ରହଣ କରିଥାନ୍ତି। ଡିଭେଲପର୍‌ମାନେ Storyboard ରେ control drag-and-drop କରିବାକୁ କିମ୍ବା ହାତରେ କୋଡ୍ ଲେଖି view state କୁ control କରିବାକୁ ପଡୁଥିଲା। ଏଥିରେ କୋଡ୍‌ର ପରିମାଣ ବଡ଼, maintenance cost ଅଧିକ, ବିଶେଷକରି ଯେତେବେଳେ interface logic ଜଟିଳ ହୁଏ।

![storyboard](../../RESOURCE/010_xcode.png)

2019 ରେ, Apple WWDC ରେ ଔପଚାରିକ ଭାବେ SwiftUI କୁ ପ୍ରଚାର କଲା। SwiftUI "declarative" programming paradigm କୁ ଆଣି UI development process କୁ ବହୁ ମାତ୍ରାରେ ସରଳ କରିଦେଲା।

![storyboard](../../RESOURCE/010_xcode1.png)

ଗୋଟିଏ ଦରକାରୀ କଥା ହେଉଛି, SwiftUI ସମ୍ପୂର୍ଣ୍ଣ ସ୍ୱତନ୍ତ୍ର lower-level implementation ନୁହେଁ। ପ୍ରତ୍ୟେକ ପ୍ଲାଟଫର୍ମରେ, ଏହା ମୂଳତଃ UIKit (iOS) କିମ୍ବା AppKit (macOS) ସହ bridge ଏବଂ collaboration କରେ; lower layer ରେ ଚାଲିବା ପାଇଁ ଏହା ଏହି ଦୁଇ framework ଉପରେ ନିର୍ଭର କରିଥାଏ।

### Swift ଏବଂ UIKit/AppKit ର ସମ୍ପର୍କ

ଯଦିଓ Swift ଗୋଟିଏ general-purpose programming language ଏବଂ ଏହା Apple ର ସମସ୍ତ platform ରେ ଚାଲିପାରେ, କିନ୍ତୁ ଏହା UIKit କିମ୍ବା AppKit କୁ ସମ୍ପୂର୍ଣ୍ଣ ପରିବର୍ତ୍ତନ କରିପାରେନାହିଁ। କିଛି ଜଟିଳ interface ଆବଶ୍ୟକତା ପାଇଁ, କିମ୍ବା SwiftUI ଏଯାଏଁ cover କରିନଥିବା feature points ପାଇଁ, ଆଜିମଧ୍ୟ UIKit କିମ୍ବା AppKit ର ସହାୟତା ଆବଶ୍ୟକ ହୁଏ।

ଉଦାହରଣ ସ୍ୱରୂପ, UIKit ଜଟିଳ view controller management, animation effects, gesture recognition ଇତ୍ୟାଦିକୁ ହ୍ୟାଣ୍ଡଲ୍ କରିବାରେ ବହୁତ mature, ଏବଂ ଏଥିରେ ଦୀର୍ଘ ସମୟର production practice ର ଅନୁଭବ ରହିଛି। SwiftUI ଏହି କ୍ଷେତ୍ରରେ ନିରନ୍ତର ଭାବେ ସୁଧାର ହେଉଥିଲେମଧ୍ୟ, କିଛି edge cases ରେ ଏବେମଧ୍ୟ ସୀମାବଦ୍ଧତା ରହିଛି।

ସେଥିପାଇଁ, ଅନେକ ଡିଭେଲପର୍ ପ୍ରକଳ୍ପରେ SwiftUI ଏବଂ UIKit (କିମ୍ବା AppKit) କୁ ମିଶାଇ ବ୍ୟବହାର କରନ୍ତି, ଯାହା ଫଳରେ ଦୁହିଁଟିର ନିଜସ୍ୱ ସୁବିଧାକୁ ପୂର୍ଣ୍ଣ ଭାବେ ଉପଯୋଗ କରିପାରନ୍ତି।

ଏହି ଦୃଷ୍ଟିକୋଣରୁ, SwiftUI କୁ UIKit / AppKit ର ଗୋଟିଏ ଉଚ୍ଚ-ସ୍ତରୀୟ encapsulation ଭାବରେ ବୁଝିହେବ। SwiftUI ଶିଖୁଥିବା ସମୟରେ, UIKit ଏବଂ AppKit ର ମୂଳ ଧାରଣା ବିଷୟରେ କିଛି ଜ୍ଞାନ ରଖିବା, ପୁରୁଣା projects maintain କରିବା କିମ୍ବା ଜଟିଳ features implement କରିବାବେଳେ ଅଧିକ ଯୁକ୍ତିସଙ୍ଗତ technical decisions ନେବାରେ ସାହାଯ୍ୟ କରେ।

## ସାରାଂଶ

**Swift**：ପ୍ରାଧାନତଃ logic, data processing, control flow ଇତ୍ୟାଦି ଲେଖିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ, ଯାହା view layout ସହ ସମ୍ପର୍କିତ ନୁହେଁ।

**SwiftUI**：declarative ଭାବରେ user interface ତିଆରି କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ; view content ଏବଂ layout ସମ୍ବନ୍ଧୀୟ କୋଡ୍ SwiftUI ର ଅଂଶ।

ବାସ୍ତବ development ରେ, Swift ଏବଂ SwiftUI ସାଧାରଣତଃ ଏକତ୍ର ବ୍ୟବହୃତ ହୁଏ: Swift logic କୁ ହ୍ୟାଣ୍ଡଲ୍ କରେ, SwiftUI interface କୁ ହ୍ୟାଣ୍ଡଲ୍ କରେ।

Objective-C ଏବଂ UIKit ଠାରୁ Swift ଏବଂ SwiftUI ପର୍ଯ୍ୟନ୍ତ, Apple ର development environment ଧୀରେ ଧୀରେ ଅଧିକ ଆଧୁନିକ ଏବଂ ସରଳ programming style ଦିଗକୁ ବିକଶିତ ହୋଇଛି; କିନ୍ତୁ UIKit ଏବଂ AppKit ଅନେକ ପାରମ୍ପରିକ projects ରେ ଏବେମଧ୍ୟ ଅନଦେଖା କରାଯାଇପାରେ ନାହିଁ।

Swift ଏବଂ SwiftUI ର ସମ୍ପର୍କକୁ ବୁଝିଲେ, ଆମେ iOS/macOS development କୁ ଅଧିକ କାର୍ଯ୍ୟକ୍ଷମ ଭାବେ କରିପାରିବୁ, ସହିତ ପୁରୁଣା projects maintain କରିବାବେଳେ ଅଧିକ ଯୁକ୍ତିସଙ୍ଗତ technical choices ମଧ୍ୟ କରିପାରିବୁ।
