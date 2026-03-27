# SwiftUI ଭ୍ୟୁର ଲାଇଫସାଇକଲ୍

ପୂର୍ବବର୍ତ୍ତୀ ପାଠରେ, ଆମେ ଜାଣିଥିଲୁ ଯେ @State ଭେରିଅବଲ୍ ଭ୍ୟୁର ଲାଇଫସାଇକଲ୍ ସହିତ ଚାଲେ, ଏବଂ onAppear ର ମୌଳିକ ବ୍ୟବହାର ମଧ୍ୟ ଶିଖିଥିଲୁ।

ଏହି ପାଠରେ, ଆମେ SwiftUI ଭ୍ୟୁର ଲାଇଫସାଇକଲ୍‌କୁ ଆହୁରି ଗଭୀରରେ ବୁଝିବୁ, ଭ୍ୟୁ କିପରି ସୃଷ୍ଟି ହୁଏ ଏବଂ ଦେଖାଯାଏ, ଏବଂ ଭ୍ୟୁ ଭିତରର ଭେରିଅବଲ୍‌ଗୁଡ଼ିକ କିପରି ସୃଷ୍ଟି ଓ ପୁନଃସୃଷ୍ଟି ହୁଏ ତାହା ଜାଣିବୁ। ସେଥିସହିତ onAppear, onDisappear ଏବଂ init constructor ବିଷୟରେ ମଧ୍ୟ ଶିଖିବୁ।

ଏହି ଜ୍ଞାନମାନଙ୍କ ଆଧାରରେ, ଆମେ SwiftUI ଭ୍ୟୁର ସମଗ୍ର ଗଠନ ପ୍ରକ୍ରିୟା ବିଷୟରେ ଗୋଟିଏ ସଂପୂର୍ଣ୍ଣ ଧାରଣା ତିଆରି କରିବୁ।

## ଆପ୍ ଆରମ୍ଭ ହେବାର କ୍ରମ

iOS ପ୍ରୋଜେକ୍ଟ ସୃଷ୍ଟି କଲେ, Xcode ଡିଫଲ୍ଟ ଭାବେ ଦୁଇଟି ଫାଇଲ୍ ସୃଷ୍ଟି କରେ:

```
ContentView.swift
ProjectName + App.swift
````

ଏଥିରେ, “ProjectName + App”.swift ହେଉଛି ସମଗ୍ର ଆପ୍‌ର entry file।

ଉଦାହରଣ:

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
````

### କୋଡ୍ ଚାଲିବାର ପ୍ରକ୍ରିୟା

ଯେତେବେଳେ ଆମେ App କୁ run କରୁ (simulator କିମ୍ବା real device ରେ), system ପ୍ରଥମେ @main କୀୱାର୍ଡ ଖୋଜେ:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

entry file ନିଶ୍ଚିତ କରିବା ପରେ, କୋଡ୍ ଚାଲୁ ହେବା ଆରମ୍ଭ ହୁଏ।

ପ୍ରଥମେ App struct ମଧ୍ୟରେ ପ୍ରବେଶ କରି, body ଭିତରର କୋଡ୍ execute କରାଯାଏ, ପରେ WindowGroup ସୃଷ୍ଟି କରାଯାଏ ଏବଂ ତାହାର ଭିତରର ContentView କୁ load କରାଯାଏ।

### WindowGroup ର କାର୍ଯ୍ୟ

WindowGroup ର କାମ ହେଉଛି window ପରିଚାଳନା କରିବା:

```swift
WindowGroup {
    ContentView()
}
```

iPad / macOS ସିଷ୍ଟମ୍ multiple windows କୁ support କରେ, କିନ୍ତୁ iPhone ରେ ସାଧାରଣତଃ କେବଳ ଗୋଟିଏ window ଥାଏ।

ତେଣୁ, iPhone ରେ WindowGroup ମୁଖ୍ୟତଃ ପ୍ରଥମେ ଦେଖାଯାଉଥିବା interface କୁ manage କରେ।

### ଭ୍ୟୁ ଲୋଡ୍ ହେବାର ପ୍ରକ୍ରିୟା

system ContentView କୁ ଖୋଜି ପାଇଲାପରେ:

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

SwiftUI body ଭିତରର କୋଡ୍ execute କରେ, ତାପରେ return ହୋଇଥିବା ଭ୍ୟୁ structure (ଯେପରିକି VStack, Text ଆଦି) ଅନୁସାରେ interface ଗଠନ କରେ ଏବଂ ସ୍କ୍ରିନ୍‌ରେ ଦେଖାଏ।

ଏହି ପଦକ୍ଷେପଗୁଡ଼ିକ ସମାପ୍ତ ହେଲେ, ଆମେ ଭ୍ୟୁ ଭିତରେ ContentView କୁ ଦେଖିପାରିବୁ।

![ContentView](../../Resource/016_view1.png)

ଧ୍ୟାନ ଦେବା ଯୋଗ୍ୟ, body ର କାମ ହେଉଛି view ସୃଷ୍ଟି କରିବା, view ସଞ୍ଚୟ କରିବା ନୁହେଁ।

ଏହାର ଅର୍ଥ, ପ୍ରତ୍ୟେକଥର ଭ୍ୟୁ refresh ହେଲେ, SwiftUI body କୁ ପୁଣିଥରେ evaluate କରି ନୂଆ view structure ତିଆରି କରେ।

### ପ୍ରିଭ୍ୟୁ ଭ୍ୟୁର ଲଜିକ୍

Xcode Preview (Canvas) ଏବଂ ପ୍ରକୃତ run ଦୁଇଟି ଭିନ୍ନ mechanism।

ଉଦାହରଣ ସ୍ୱରୂପ, entry file ଭିତରେ ଗୋଟିଏ debug output ଯୋଡନ୍ତୁ:

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

Xcode ରେ ContentView କୁ preview କଲେ, ଏହା @main entry ଠାରୁ execute କରିବା ଆରମ୍ଭ କରେନାହିଁ, ସେଥିପାଇଁ entry file ଭିତରର onAppear trigger ହେବ ନାହିଁ।

କିନ୍ତୁ, ଯଦି simulator କିମ୍ବା real device ରେ run କରିବେ, system @main ଠାରୁ execute ଆରମ୍ଭ କରିବ, ସମଗ୍ର App କୁ ପୂରା flow ଅନୁଯାୟୀ ଚାଲାଇବ, entry ଭିତରର onAppear କୁ trigger କରିବ ଏବଂ debug information output କରିବ।

ମୁଖ୍ୟ କଥା ହେଉଛି, Xcode Preview କେବଳ “local rendering”, ଯାହା କେବଳ ଏବେ ଥିବା ଭ୍ୟୁକୁ ଦେଖାଇବା ପାଇଁ; simulator ଏବଂ real device ଏକ “complete runtime environment” ଦେଇଥାଏ, ଯେଉଁଠାରେ ସମଗ୍ର App execute ହୁଏ।

ସେହିପରି, App ର function ପରୀକ୍ଷା କରିବାବେଳେ simulator କିମ୍ବା real device କୁ ଆଧାର କରିବା ଉଚିତ; Xcode Preview ପୂର୍ଣ୍ଣ runtime environment ଦେଉ ନାହିଁ।

## ଭ୍ୟୁର ଲାଇଫସାଇକଲ୍

ବର୍ତ୍ତମାନ ପର୍ଯ୍ୟାୟରେ, ଆମର ସମସ୍ତ କୋଡ୍ ContentView ଭିତରେ ରହିଛି। କିନ୍ତୁ ବାସ୍ତବ App ରେ, ସାଧାରଣତଃ ଗୋଟିଏ App ମଧ୍ୟରେ ଅନେକ view ଥାଏ, ଏବଂ ସେମାନେ ଭିନ୍ନ ଭିନ୍ନ ପରିସ୍ଥିତିରେ switch ହୁଅନ୍ତି।

ଉଦାହରଣ ସ୍ୱରୂପ, “ସଞ୍ଚୟ କୁମ୍ଭ” ରେ:

![PiggyBank](../../Resource/016_view.png)

ଯେତେବେଳେ “ସଞ୍ଚୟ” ଉପରେ କ୍ଲିକ୍ କରାଯାଏ, SaveView ଦେଖାଯାଏ; ସଞ୍ଚୟ ଶେଷ ହେଲେ କିମ୍ବା ବନ୍ଦ କରାଗଲେ, SaveView କୁ ହଟାଇ ଦିଆଯାଏ।

ଏହି ପ୍ରକ୍ରିୟାଟି ହିଁ ଗୋଟିଏ view ର lifecycle — view ସୃଷ୍ଟି ହେବା, view ଦେଖାଯିବା, ଏବଂ ଶେଷରେ view ହଟାଯିବା।

### ଆପ୍ ବନ୍ଦ କରିବା

ଯେତେବେଳେ App ବନ୍ଦ କରାଯାଏ, ସମସ୍ତ view ହଟିଯାଏ, ସମ୍ବନ୍ଧିତ state ମଧ୍ୟ ଅନ୍ତର୍ଧାନ ହୋଇଯାଏ।

ସେହିପରି, ContentView ଏବଂ ଅନ୍ୟ view ଗୁଡ଼ିକ memory ଠାରୁ ହଟିଯିବ, ଏବଂ ସମଗ୍ର App ର running state ମଧ୍ୟ ସଫା ହୋଇଯିବ।

## ଭ୍ୟୁ ଭିତରର ଭେରିଅବଲ୍‌ର ଲାଇଫସାଇକଲ୍

SwiftUI ରେ, ଭେରିଅବଲ୍‌ର lifecycle ସାଧାରଣତଃ view ସହିତ ବାନ୍ଧା ରହେ।

ଉଦାହରଣ:

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

### @State ଭେରିଅବଲ୍

@State ଦ୍ୱାରା ଘୋଷିତ ଭେରିଅବଲ୍ ଭ୍ୟୁର lifecycle ସହିତ ବନ୍ଧା ଥାଏ।

```swift
@State private var name = "FangJunyu"
```

ଭ୍ୟୁ ସୃଷ୍ଟି ହେଲେ, name ମଧ୍ୟ ସୃଷ୍ଟି ହୁଏ; ଭ୍ୟୁ ହଟିଗଲେ, name ମଧ୍ୟ ନଷ୍ଟ ହୋଇଯାଏ।

ସେହି କାରଣରୁ, UserDefaults ଭଳି ଉପାୟ ଦ୍ୱାରା data persistence କରିବା ଆବଶ୍ୟକ ହୁଏ।

### body ଭିତରର ଭେରିଅବଲ୍

body ଭିତରେ ଘୋଷିତ ଭେରିଅବଲ୍:

```swift
var num = 10
```

ଏହାର lifecycle, body ର execution process ସହିତ ବନ୍ଧା ଥାଏ।

ଯେତେବେଳେ SwiftUI ର state ବଦଳେ, ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

ଯେତେବେଳେ name ବଦଳେ, @State data ବଦଳକୁ detect କରି SwiftUI କୁ ସୂଚନା ଦେଏ ଯେ ଭ୍ୟୁକୁ ପୁଣିଥରେ calculate କରିବା ଦରକାର, ଏବଂ body କୁ ପୁଣିଥରେ calculate କରାଯାଏ।

body ପୁନଃ calculate ହେଲେ, body ଭିତରର ସମସ୍ତ କୋଡ୍ ପୁଣି execute ହୁଏ, ଏବଂ body ଭିତରର ଭେରିଅବଲ୍‌ଗୁଡ଼ିକ (ଯେପରି num) ପୁଣି ସୃଷ୍ଟି ହୁଅନ୍ତି।

ସେହିପାଇଁ, body ଭିତରେ complex variable ଘୋଷଣା କରିବାକୁ ସୁପାରିଶ କରାଯାଏ ନାହିଁ।

କାରଣ, ପ୍ରତ୍ୟେକଥର view refresh ହେଲେ, body ଭିତରର ଭେରିଅବଲ୍‌ଗୁଡ଼ିକ ପୁଣି ସୃଷ୍ଟି ହେବ, ଯାହା calculation cost ବଢ଼ାଇବ ଏବଂ performance କୁ ପ୍ରଭାବିତ କରିବ।

SwiftUI ରେ, ଭିନ୍ନ ପ୍ରକାରର data କୁ ଭିନ୍ନ ଭିନ୍ନ ଉପାୟରେ ପରିଚାଳନା କରିବା ଉଚିତ। ଯେ data ଭ୍ୟୁର lifecycle ସହିତ ରହିବା ଆବଶ୍ୟକ, ସେଥିପାଇଁ @State ବ୍ୟବହାର କରନ୍ତୁ; ଅସ୍ଥାୟୀ calculation data କୁ body ଭିତରେ ରଖିପାରିବେ।

## onAppear ଏବଂ onDisappear

ପୂର୍ବବର୍ତ୍ତୀ ପାଠରେ, ଆମେ onAppear ଶିଖିଥିଲୁ। ଭ୍ୟୁ ଦେଖାଯାଇଲେ onAppear କଲ୍ ହୁଏ।

```swift
.onAppear {}
```

ଉଦାହରଣ:

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

Xcode Preview କିମ୍ବା run ସମୟରେ, onAppear ଭିତରର debug output ଦେଖିପାରିବେ।

### onDisappear

onAppear ସହିତ ସମ୍ବନ୍ଧିତ ଅନ୍ୟଟି ହେଉଛି onDisappear:

```swift
.onDisappear {}
```

ଯେତେବେଳେ view ବନ୍ଦ ହୁଏ, onDisappear କଲ୍ ହୁଏ।

ଉଦାହରଣ:

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

ଭ୍ୟୁ ହଟାଯାଇଲେ, onDisappear ଭିତରର କୋଡ୍ execute ହୁଏ।

ସୂଚନା: ବର୍ତ୍ତମାନ ପର୍ଯ୍ୟାୟରେ ବ୍ୟବହୃତ ContentView ହେଉଛି App ର root view, ଏହାକୁ ସିଧାସଳଖ ବନ୍ଦ କରିବା କିମ୍ବା ହଟାଇବା ସମ୍ଭବ ନୁହେଁ। ତେଣୁ, ଏହି ପର୍ଯ୍ୟାୟରେ onDisappear ର effect ସିଧାସଳଖ ଦେଖିବାକୁ ମିଳିବ ନାହିଁ।

ପରେ page navigation କିମ୍ବା ନୂଆ view ଖୋଲିବା ଶିଖିବାବେଳେ, onDisappear କଲ୍ ହେଉଥିବାକୁ ଦେଖିପାରିବେ।

## ସୃଷ୍ଟି ଏବଂ ଦେଖାଯିବାର ଲଜିକ୍

ଧ୍ୟାନ ଦେବା ଯୋଗ୍ୟ, view ର ସୃଷ୍ଟି ଏବଂ view ର ଦେଖାଯିବା — ଏହା ଦୁଇଟି ଭିନ୍ନ ପର୍ଯ୍ୟାୟ।

ଯେତେବେଳେ view ସୃଷ୍ଟି ହୁଏ, struct ର constructor method କଲ୍ ହୁଏ:

```swift
init() {}
```

କାରଣ SwiftUI ର view ହେଉଛି struct:

```swift
struct ContentView: View { ... }
```

ସେହିପରି, view instance ସୃଷ୍ଟି ହେଲେ init constructor execute ହୁଏ। କିନ୍ତୁ view ସ୍କ୍ରିନ୍‌ରେ ଦେଖାଯିବାବେଳେ ମାତ୍ର onAppear method କଲ୍ ହୁଏ।

ଉଦାହରଣ:

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

Xcode ରେ preview କଲେ, ଏହି debug output ଦେଖିପାରିବେ:

```swift
Create ContentView
Show ContentView
```

ଏହାର ଅର୍ଥ, ପ୍ରଥମେ init execute ହୋଇ view ସୃଷ୍ଟି ହୁଏ, ପରେ body ଭିତରର କୋଡ୍ calculate ହୁଏ, ଶେଷରେ view ଦେଖାଯାଏ ଏବଂ onAppear execute ହୁଏ।

ସେହିପରି, view ର “ସୃଷ୍ଟି” ଏବଂ “ଦେଖାଯିବା” ପର୍ଯ୍ୟାୟ ଭିନ୍ନ ବୋଲି ବୁଝିବା ଦରକାର।

### init constructor

init ହେଉଛି Swift ର ମୌଳିକ syntax, ଯାହା struct ଏବଂ class ଉଭୟରେ define କରାଯାଇପାରେ, ଏବଂ object initialize କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

```swift
init() {}
```

SwiftUI ରେ, view ସୃଷ୍ଟି ହେବାବେଳେ, system ଭ୍ୟୁର init method କୁ call କରେ। ଏହା parameter ଗ୍ରହଣ କରିବା କିମ୍ବା data initialize କରିବାରେ ବ୍ୟବହୃତ ହୋଇପାରେ।

ଯଦି ଆମେ ନିଜେ init ଲେଖୁନାହୁଁ, Swift struct ପାଇଁ ଗୋଟିଏ default constructor ସ୍ୱୟଂଚାଳିତ ଭାବେ ସୃଷ୍ଟି କରେ।

ContentView ପରି SwiftUI view ପାଇଁ, view ସୃଷ୍ଟି ସମୟରେ init execute ହୁଏ, ଏବଂ view ଦେଖାଯାଇଲେ onAppear execute ହୁଏ।

ସେହିପରି, init ହେଉଛି view ସୃଷ୍ଟି ସମୟର constructor method, ଯାହା ପରେ parameter pass କରିବା କିମ୍ବା data initialize କରିବାବେଳେ ବହୁତ ପ୍ରୟୋଜନୀୟ ହେବ।

## ସାରାଂଶ

ଏହି ପାଠରେ ଆମେ App ର startup sequence ଶିଖିଲୁ — entry file ଠାରୁ ContentView file ପର୍ଯ୍ୟନ୍ତ କୋଡ୍ execute ହେବାର flow।

ଆମେ SwiftUI ଭ୍ୟୁର lifecycle ବୁଝିଲୁ: ଭ୍ୟୁ ସୃଷ୍ଟି ହେଲେ init execute ହୁଏ, ସ୍କ୍ରିନ୍‌ରେ ଦେଖାଯାଇଲେ onAppear execute ହୁଏ, ଏବଂ ଭ୍ୟୁ ହଟାଯାଇଲେ କିମ୍ବା ବନ୍ଦ ହେଲେ onDisappear execute ହୁଏ।

ଆମେ view update mechanism ମଧ୍ୟ ଶିଖିଲୁ: ଭ୍ୟୁ state-driven। @State ପରି state ବଦଳିଲେ, SwiftUI ଭ୍ୟୁକୁ refresh କରେ, body କୁ ପୁଣିଥରେ calculate କରେ, ଏବଂ body ଭିତରର ଭେରିଅବଲ୍‌ଗୁଡ଼ିକ ମଧ୍ୟ ପୁଣି ସୃଷ୍ଟି ହୁଅନ୍ତି।

ଭେରିଅବଲ୍‌ର lifecycle ଭ୍ୟୁର lifecycle ସହିତ ବନ୍ଧା ରହେ, ଏବଂ body ଭିତରର temporary data ପ୍ରତ୍ୟେକଥର refresh ହେଲେ ପୁଣି ସୃଷ୍ଟି ହୁଏ।

ଏହି lifecycle ଏବଂ ଭେରିଅବଲ୍‌ର ବ୍ୟବହାର ବୁଝିଲେ, ଆମେ କୋଡ୍‌କୁ ଆହୁରି ଭଲଭାବରେ ସଂଗଠିତ କରିପାରିବୁ ଏବଂ App ର logic କୁ ଆହୁରି ସ୍ପଷ୍ଟ କରିପାରିବୁ।