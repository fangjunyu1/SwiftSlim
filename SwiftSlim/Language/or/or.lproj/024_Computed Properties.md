# କମ୍ପ୍ୟୁଟେଡ୍ ପ୍ରୋପର୍ଟି

ଏହି ପାଠରେ ଆମେ ମୁଖ୍ୟତଃ କମ୍ପ୍ୟୁଟେଡ୍ ପ୍ରୋପର୍ଟି ବିଷୟରେ ଶିଖିବା।

କମ୍ପ୍ୟୁଟେଡ୍ ପ୍ରୋପର୍ଟି ପୂର୍ବରୁ ଥିବା ଡାଟା ଆଧାରରେ ଏକ ନୂତନ ଫଳାଫଳ ଗଣନା କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ଏହା ସଂଖ୍ୟାତ୍ମକ ମୂଲ୍ୟ ଗଣନା କରିପାରେ, ଏବଂ SwiftUI view ରେ ଦେଖାଇବାକୁ ପଡ଼ୁଥିବା content ମଧ୍ୟ ଗଣନା କରିପାରେ।

ଉଦାହରଣ:

```swift
let a = 10
let b = 20
let c = a + b
```

ଏଠାରେ `c` ହେଉଛି `a` ଏବଂ `b` କୁ ଯୋଗ କରିବା ପରେ ମିଳୁଥିବା ଫଳାଫଳ।

ସାଧାରଣ code ରେ ଏହି ପ୍ରକାରର ଲେଖା ପଦ୍ଧତି ବହୁତ ସାଧାରଣ।

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

ସୂଚନା: `Button` ର click event ଭିତରେ ସାଧାରଣ Swift code ଚଳାଇପାରିବେ।

କିନ୍ତୁ, ଯଦି ଏହିପରି code କୁ ସିଧାସଳଖ SwiftUI view ର property ଭିତରେ ଲେଖାଯାଏ, ତେବେ ସମସ୍ୟା ହେବ।

ଉଦାହରଣ:

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

ଏହି code error ଦେଖାଇବ।

ଦେଖିବାକୁ `a` ଏବଂ `b` ପୂର୍ବରୁ `c` ଠାରୁ ଆଗରେ ଲେଖାଯାଇଛି, ତେଣୁ `c` ର ମୂଲ୍ୟ ଗଣନା କରିହେବ ବୋଲି ଲାଗିପାରେ।

କିନ୍ତୁ struct ର property ଘୋଷଣା କରିବା ସମୟରେ, ଏହି ଲେଖା ପଦ୍ଧତିକୁ ସିଧାସଳଖ ବ୍ୟବହାର କରିହେବ ନାହିଁ।

## କାହିଁକି c କୁ ସିଧାସଳଖ a + b ଭାବରେ ଗଣନା କରିହେବ ନାହିଁ?

କାରଣ `a`, `b`, `c` button click event ଭିତରେ ଥିବା temporary constants ନୁହେଁ। ସେଗୁଡ଼ିକ `ContentView` ଏହି view ର properties।

Button click event ଭିତରେ ଏହି code ସାଧାରଣ ଭାବରେ ଚାଲେ:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

କାରଣ button click ହେବା ପରେ code କ୍ରମକ୍ରମେ ଚାଲେ। ପ୍ରଥମେ `a` ସୃଷ୍ଟି ହୁଏ, ତାପରେ `b` ସୃଷ୍ଟି ହୁଏ, ଶେଷରେ `a + b` ବ୍ୟବହାର କରି `c` ଗଣନା ହୁଏ।

କିନ୍ତୁ view ଭିତରେ property ଘୋଷଣା କରିବାବେଳେ ପରିସ୍ଥିତି ଅଲଗା:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

ଏଠାରେ `a`, `b`, `c` ସବୁ `ContentView` view ର properties।

`ContentView` view ସୃଷ୍ଟି ହେବାବେଳେ Swift କୁ ପ୍ରଥମେ ଏହି properties ପ୍ରସ୍ତୁତ କରିବାକୁ ପଡ଼େ। ସୃଷ୍ଟି ପ୍ରକ୍ରିୟା ସୁରକ୍ଷିତ ରହିବା ପାଇଁ, Swift ଗୋଟିଏ instance stored property ର default value ଭିତରେ ସେହି ଏକେ instance ର ଅନ୍ୟ instance properties କୁ ସିଧାସଳଖ ପଢ଼ିବାକୁ ଅନୁମତି ଦେଉନାହିଁ।

ସେଥିପାଇଁ ଏହି line error ଦେଖାଇବ:

```swift
let c = a + b
```

ସରଳ ଭାବେ ବୁଝିପାରିବେ: **view ଭିତରେ properties ଘୋଷଣା କରିବାବେଳେ, ଗୋଟିଏ ସାଧାରଣ property ବ୍ୟବହାର କରି ଅନ୍ୟ ସାଧାରଣ property କୁ ସିଧାସଳଖ ଗଣନା କରିହେବ ନାହିଁ।**

ଏହି ପ୍ରକାରର property, ଯାହା ମୂଲ୍ୟକୁ ସିଧାସଳଖ ସଞ୍ଚୟ କରେ, ତାକୁ “stored property” କୁହାଯାଏ। ସହଜରେ ବୁଝିବା ପାଇଁ, ଏହାକୁ ଅସ୍ଥାୟୀ ଭାବରେ ସାଧାରଣ property ବୋଲି ଭାବିପାରିବେ।

ଉଦାହରଣ:

```swift
let a = 10
```

`a` ଭିତରେ `10` ସଞ୍ଚୟ ହୋଇଛି।

```swift
let b = 20
```

`b` ଭିତରେ `20` ସଞ୍ଚୟ ହୋଇଛି।

କିନ୍ତୁ:

```swift
let c = a + b
```

ଏଠାରେ `c` ସିଧାସଳଖ ଲେଖାଯାଇଥିବା fixed value ନୁହେଁ। ଏହା `a + b` ଦ୍ୱାରା ଗଣନା ହେବାକୁ ଆଶା କରୁଛି।

ଏହିପରି “ପୂର୍ବରୁ ଥିବା ଡାଟା ଦ୍ୱାରା ଫଳାଫଳ ପାଇବା” ପରିସ୍ଥିତି ପାଇଁ computed property ଅଧିକ ଉପଯୁକ୍ତ।

ଏହାକୁ ଏଭଳି ବଦଳାଯାଇପାରେ:

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

ଏଠାରେ `c` ହେଉଛି computed property।

```swift
var c: Int {
    return a + b
}
```

ଏହାର ଅର୍ଥ: **ଯେତେବେଳେ `c` ବ୍ୟବହାର କରିବାକୁ ପଡ଼େ, ସେତେବେଳେ `a` ଏବଂ `b` ପଢ଼ାଯାଏ, ଏବଂ `a + b` ର ଫଳାଫଳ return କରାଯାଏ।**

ଉଦାହରଣ:

```swift
Text("c: \(c)")
```

`Text` ରେ `c` ଦେଖାଯିବା ସମୟରେ ମାତ୍ର `c` ର ଗଣନା trigger ହୁଏ।

## Computed property କଣ?

Computed property ଗୋଟିଏ variable ପରି ଦେଖାଯାଏ, କିନ୍ତୁ ଏହା ନିଜେ ଡାଟା ସଞ୍ଚୟ କରେନାହିଁ।

ଉଦାହରଣ:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

ଏଠାରେ `c` ହେଉଛି computed property।

ଏହା ସାଧାରଣ property ପରି ଗୋଟିଏ fixed value ସଞ୍ଚୟ କରେନାହିଁ। ପ୍ରତିଥର `c` ପଢ଼ାଯାଇଲେ, `{}` ଭିତରେ ଥିବା code ପୁଣିଥରେ ଚାଲେ, ଏବଂ ଗଣନା ହୋଇଥିବା ଫଳାଫଳ return କରେ।

ଏଭଳି ବୁଝିପାରିବେ:

```swift
var c: Int {
    return a + b
}
```

`c` ଆବଶ୍ୟକ ହେଲେ, `a + b` ଗଣନା ହୁଏ।

ସେଥିପାଇଁ computed property ଏହି ପରିସ୍ଥିତି ପାଇଁ ଉପଯୁକ୍ତ: **ଗୋଟିଏ ଫଳାଫଳକୁ ଅଲଗା ଭାବରେ ସଞ୍ଚୟ କରିବା ଆବଶ୍ୟକ ନାହିଁ, କାରଣ ଏହା ପୂର୍ବରୁ ଥିବା ଡାଟା ଦ୍ୱାରା ଗଣନା କରିହେବ।**

## ମୂଳ ଲେଖା ପଦ୍ଧତି

Computed property ସାଧାରଣତଃ ତିନୋଟି ଅଂଶ ରହେ:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` ବ୍ୟବହାର କରି ଘୋଷଣା କରିବା

```swift
var c
```

Computed property କୁ ନିଶ୍ଚିତ ଭାବରେ `var` ବ୍ୟବହାର କରି ଘୋଷଣା କରିବାକୁ ପଡ଼େ, `let` ବ୍ୟବହାର କରିହେବ ନାହିଁ।

କାରଣ computed property ଗୋଟିଏ fixed stored value ନୁହେଁ। ଏହା ପ୍ରତିଥର ପଢ଼ାଯାଇଲେ dynamic ଭାବରେ ଗଣନା ହେଉଥିବା ଫଳାଫଳ।

### 2. Return type ଦର୍ଶାଇବା

```swift
var c: Int
```

Computed property କୁ return type ଦର୍ଶାଇବାକୁ ପଡ଼େ।

ଏଠାରେ `c` ଶେଷରେ ଗୋଟିଏ integer return କରିବ, ସେଥିପାଇଁ type `Int`।

### 3. {} ଭିତରେ ଗଣନା logic ଲେଖିବା

```swift
{
    return a + b
}
```

`{}` ଭିତରେ ଗଣନା logic ଲେଖାଯାଏ। ଏଠାରେ return ହେଉଥିବା ଫଳାଫଳ `a + b`।

## return keyword

Computed property ଗୋଟିଏ ଫଳାଫଳ return କରିବାକୁ ପଡ଼େ।

ଉଦାହରଣ:

```swift
var c: Int {
    return a + b
}
```

ଏଠାରେ `return` ର ଅର୍ଥ: `a + b` ର ଗଣନା ଫଳାଫଳକୁ ବାହାରକୁ return କରିବା।

ଯଦି computed property ଭିତରେ ଫଳାଫଳକୁ ସିଧାସଳଖ ତିଆରି କରୁଥିବା ଗୋଟିଏ expression ମାତ୍ର ଥାଏ, ତେବେ `return` କୁ ଛାଡ଼ିଦିଆଯାଇପାରେ:

```swift
var c: Int {
    a + b
}
```

କିନ୍ତୁ computed property ଭିତରେ ଅନେକ line code ଥାଏ, ତେବେ ଫଳାଫଳକୁ ସ୍ପଷ୍ଟ ଭାବରେ return କରିବା ପାଇଁ `return` ବ୍ୟବହାର କରିବାକୁ ପଡ଼େ।

ଉଦାହରଣ:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ଏଠାରେ ଗଣନା ପ୍ରକ୍ରିୟା ଦୁଇଟି ପଦକ୍ଷେପରେ ବିଭକ୍ତ।

ପ୍ରଥମ ପଦକ୍ଷେପ, ମୋଟ ଦାମ ଗଣନା କରିବା:

```swift
let total = count * price
```

ଦ୍ୱିତୀୟ ପଦକ୍ଷେପ, ମୋଟ ଦାମକୁ text ଭାବରେ ଯୋଡ଼ି return କରିବା:

```swift
return "Total：\(total) $"
```

ଯଦି `return` କୁ କାଢ଼ିଦିଆଯାଏ:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

ଏହି code error ଦେଖାଇବ।

କାରଣ: **ଏହି computed property ଭିତରେ ପୂର୍ବରୁ ଅନେକ line code ଅଛି, Swift କେଉଁ line ଶେଷରେ return କରିବାକୁ ଥିବା ଫଳାଫଳ ତାହା ସ୍ୱୟଂଚାଳିତ ଭାବରେ ନିର୍ଣ୍ଣୟ କରିପାରେନାହିଁ।**

ସେହିପାଇଁ, computed property ଭିତରେ ଯଦି ଫଳାଫଳ ଦେଉଥିବା ଗୋଟିଏ expression ମାତ୍ର ଥାଏ, `return` କୁ ଛାଡ଼ିଦିଆଯାଇପାରେ।

```swift
var c: Int {
    a + b
}
```

Computed property ଭିତରେ ଯଦି ଅନେକ line code ଥାଏ, `return` କୁ ସ୍ପଷ୍ଟ ଭାବରେ ଲେଖିବା ଭଲ।

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Computed property ଏବଂ ସାଧାରଣ property ର ତଫାତ

ସାଧାରଣ property ଡାଟା ସଞ୍ଚୟ କରେ।

```swift
var c = 30
```

ଏଠାରେ `c` ଗୋଟିଏ ନିର୍ଦ୍ଦିଷ୍ଟ ମୂଲ୍ୟ ସଞ୍ଚୟ କରେ: `30`।

Computed property ଡାଟା ସଞ୍ଚୟ କରେନାହିଁ।

```swift
var c: Int {
    a + b
}
```

ଏଠାରେ `c` `30` ସଞ୍ଚୟ କରୁନାହିଁ। ଏହା କେବଳ ଗଣନା କରିବାର ପଦ୍ଧତି ଦେଉଛି।

ଯେତେବେଳେ `c` ପଢ଼ାଯାଏ, Swift ଏହି code ଚଳାଏ:

```swift
a + b
```

ତାପରେ ଗଣନା ହୋଇଥିବା ଫଳାଫଳ return କରେ।

ସେଥିପାଇଁ computed property ଅନ୍ୟ ଡାଟା ଆଧାରରେ ଫଳାଫଳ ଗଣନା କରିବା ପରିସ୍ଥିତିରେ ଉପଯୁକ୍ତ।

## body ମଧ୍ୟ computed property

Computed property ଶିଖିବା ପରେ, SwiftUI ରେ ସବୁଠାରୁ ଅଧିକ ଦେଖାଯାଉଥିବା ଏହି code କୁ ଆମେ ପୁନର୍ବାର ବୁଝିପାରିବା:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ଏଠାରେ `body` ମଧ୍ୟ ଗୋଟିଏ computed property।

ଏହା `var` ବ୍ୟବହାର କରି ଘୋଷଣା ହୋଇଛି:

```swift
var body
```

ଏହାର return type ଅଛି:

```swift
some View
```

ଏହାର `{}` ଭିତରେ return ହେଉଥିବା content ହେଉଛି SwiftUI view content:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

ସେଥିପାଇଁ `body` କୁ ଏଭଳି ବୁଝିପାରିବେ: SwiftUI କୁ ଯେତେବେଳେ ଏହି view ଦେଖାଇବାକୁ ପଡ଼େ, ସେତେବେଳେ SwiftUI `body` କୁ ପଢ଼େ, ଏବଂ `body` return କରୁଥିବା content ଆଧାରରେ interface ତିଆରି କରେ।

ଯଦି `return` ଲେଖିବାକୁ ହୁଏ, ତେବେ ଏଭଳି ବୁଝିପାରିବେ:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

କିନ୍ତୁ SwiftUI ରେ ଆମେ ସାଧାରଣତଃ `return` କୁ ଛାଡ଼ିଦେଇ ସିଧାସଳଖ ଏଭଳି ଲେଖୁ:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ଯେତେବେଳେ `@State` data ବଦଳାଯାଏ, SwiftUI ପୁଣିଥରେ `body` କୁ ପଢ଼େ ଏବଂ ନୂତନ data ଆଧାରରେ interface update କରେ।

ଉଦାହରଣ:

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

button click କରିବା ପରେ `count` ବଦଳିଯାଏ।

```swift
count += 1
```

`count` ବଦଳିବା ପରେ SwiftUI `body` କୁ ପୁଣିଥରେ ଗଣନା କରେ, ସେଥିପାଇଁ interface ଭିତରେ ଥିବା text ମଧ୍ୟ update ହୁଏ।

```swift
Text("count: \(count)")
```

SwiftUI ରେ data ବଦଳିଲା ପରେ interface ସ୍ୱୟଂଚାଳିତ ଭାବରେ refresh ହୋଇପାରିବାର କାରଣ ମଧ୍ୟ ଏହା।

### body ଭିତରେ ଜଟିଳ ଗଣନା ଲେଖିବା ସୁପାରିଶ ହୁଏନାହିଁ

`body` computed property ହେଉଥିବାରୁ, ଏହା ଅନେକଥର ପଢ଼ାଯାଇପାରେ ଏବଂ ପୁଣିଥରେ ଗଣନା ହୋଇପାରେ।

ଉଦାହରଣ:

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

`name` ବଦଳିଲେ SwiftUI `body` କୁ ପୁଣିଥରେ ଗଣନା କରେ।

ଏହି ସମୟରେ `body` ଭିତରେ ଥିବା code ମଧ୍ୟ ପୁଣିଥରେ ଚାଲେ, `num` ମଧ୍ୟ ପୁଣିଥରେ ସୃଷ୍ଟି ହୁଏ।

```swift
let num = 10
```

ଏହି ଉଦାହରଣରେ `num` ବହୁତ ସରଳ, ସେଥିପାଇଁ ପ୍ରଭାବ ବଡ଼ ନୁହେଁ।

କିନ୍ତୁ ଯଦି `body` ଭିତରେ ଜଟିଳ ଗଣନା କରାଯାଏ, ଯେପରିକି ବହୁତ ଡାଟା filtering, sorting, image processing ଇତ୍ୟାଦି, ତେବେ interface ର smoothness ଉପରେ ପ୍ରଭାବ ପଡ଼ିପାରେ।

ସେହିପାଇଁ SwiftUI ରେ `body` ମୁଖ୍ୟତଃ interface structure ବର୍ଣ୍ଣନା କରିବା ପାଇଁ ଦାୟୀ ହେବା ଉଚିତ।

ସରଳ temporary data `body` ଭିତରେ ଲେଖାଯାଇପାରେ।

ଜଟିଳ ଗଣନାକୁ `body` ବାହାରେ ଥିବା computed property, method, କିମ୍ବା ଅଲଗା data processing ଅଂଶରେ ରଖିବାକୁ ଭାବିପାରିବେ।

## ଉଦାହରଣ: ପରିମାଣ ଏବଂ ମୋଟ ଦାମ

ଏବେ ଆମେ ଗୋଟିଏ ସରଳ ଉଦାହରଣ ଦ୍ୱାରା computed property ବୁଝିବା।

ଧରନ୍ତୁ ଗୋଟିଏ carrot ର ଦାମ 2 $। user button click କରି କିଣିବା ପରିମାଣ ବଦଳାଇପାରେ, ଏବଂ interface ରେ ମୋଟ ଦାମ ଦେଖାଇବାକୁ ପଡ଼େ।

ମୋଟ ଦାମ ଗଣନା ପଦ୍ଧତି:

```text
ପରିମାଣ * ଏକକ ଦାମ
```

ଯଦି ମୋଟ ଦାମକୁ ସାଧାରଣ variable ଭିତରେ ସଞ୍ଚୟ କରିବା, ତେବେ ଏହା କିଛି ଅସୁବିଧାଜନକ ହେବ।

କାରଣ ପ୍ରତିଥର ପରିମାଣ ବଦଳିଲେ ମୋଟ ଦାମକୁ ହାତରେ update କରିବାକୁ ପଡ଼ିବ।

ଅଧିକ ଭଲ ପଦ୍ଧତି ହେଉଛି computed property ବ୍ୟବହାର କରିବା:

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

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../Resource/024_view.png)

ଏହି ଉଦାହରଣରେ:

```swift
@State private var count = 1
```

`count` carrot ର ପରିମାଣକୁ ଦର୍ଶାଏ। button click କଲେ `count` ବଦଳିଯାଏ।

```swift
private let price = 2
```

`price` carrot ର ଏକକ ଦାମକୁ ଦର୍ଶାଏ। ଏଠାରେ ଏହା fixed value, ସେଥିପାଇଁ `let` ବ୍ୟବହାର କରାଯାଇଛି।

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` ମୋଟ ଦାମକୁ ଦର୍ଶାଏ।

ଏହାକୁ ଅଲଗା ଭାବରେ ସଞ୍ଚୟ କରିବା ଆବଶ୍ୟକ ନାହିଁ, କାରଣ ମୋଟ ଦାମ ସବୁବେଳେ `count * price` ଦ୍ୱାରା ଗଣନା କରିହେବ।

ଯେତେବେଳେ `count` `1`:

```swift
totalPrice = 1 * 2
```

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

```swift
totalPrice: 2 $
```

`+` button click କରିବା ପରେ `count` `2` ହୁଏ।

ଏହି ସମୟରେ `totalPrice` ପୁଣିଥରେ ପଢ଼ାଯାଇଲେ, ଏହା ପୁଣିଥରେ ଗଣନା ହୁଏ:

```swift
totalPrice = 2 * 2
```

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

```swift
totalPrice: 4 $
```

ଏହାହିଁ computed property ର କାମ: ପୂର୍ବରୁ ଥିବା data ଆଧାରରେ ନୂତନ ଫଳାଫଳକୁ dynamic ଭାବରେ ଗଣନା କରିବା।

## Computed property କୁ judgment ପାଇଁ ମଧ୍ୟ ବ୍ୟବହାର କରିପାରିବେ

Computed property କେବଳ ସଂଖ୍ୟା ଗଣନା କରିନଥାଏ, ଏହା judgment result ମଧ୍ୟ return କରିପାରେ।

ଉଦାହରଣ, ଯେତେବେଳେ ଆମେ ପରିମାଣର ସବୁଠାରୁ କମ୍ ମୂଲ୍ୟ 1 ରଖିବାକୁ ଚାହୁଁଛୁ।

ପରିମାଣ ପୂର୍ବରୁ 1 ଥିଲେ, `-` button ଆଉ କମାଇବା ଉଚିତ ନୁହେଁ।

ଏକ computed property ଯୋଡ଼ିପାରିବେ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

ସମ୍ପୂର୍ଣ୍ଣ code:

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

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../Resource/024_view1.png)

ଏଠାରେ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

ଏହି code ଦର୍ଶାଏ ଯେ ବର୍ତ୍ତମାନ ଆଉ କମାଇପାରିବ କି ନାହିଁ।

ଯେତେବେଳେ `count` `1` ଠାରୁ ବଡ଼:

```swift
canDecrease == true
```

ଅର୍ଥାତ କମାଇପାରିବ।

ଯେତେବେଳେ `count` `1` ସମାନ:

```swift
canDecrease == false
```

ଅର୍ଥାତ ଆଉ କମାଇପାରିବ ନାହିଁ।

### Button ଭିତରେ condition check

Button ଭିତରେ ଏହା ବ୍ୟବହାର କରାଯାଇଛି:

```swift
if canDecrease {
    count -= 1
}
```

କେବଳ `canDecrease` `true` ଥିଲେ ମାତ୍ର `count` କମାଯାଏ।

### View ର foreground color control କରିବା

`canDecrease` ବ୍ୟବହାର କରି button ର foreground color ମଧ୍ୟ control କରିପାରିବେ:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ଏଠାରେ ternary operator ବ୍ୟବହାର ହୋଇଛି:

```swift
canDecrease ? Color.primary : Color.gray
```

ଏହି code ର ଅର୍ଥ: ଯଦି `canDecrease` `true`, foreground color `Color.primary` ବ୍ୟବହାର କରିବ; ଯଦି `canDecrease` `false`, foreground color `Color.gray` ବ୍ୟବହାର କରିବ।

`Color.primary` ହେଉଛି SwiftUI ପ୍ରଦାନ କରୁଥିବା system semantic color। ଏହା ବର୍ତ୍ତମାନ interface ର main text color କୁ ଦର୍ଶାଏ।

Light Mode ରେ `Color.primary` ସାଧାରଣତଃ କଳା ରଙ୍ଗ ପାଖାପାଖି ଥାଏ; Dark Mode ରେ ସାଧାରଣତଃ ଧଳା ରଙ୍ଗ ପାଖାପାଖି ଥାଏ।

ସେଥିପାଇଁ `Color.primary` ବ୍ୟବହାର କରିବାର ଲାଭ: ଏହା Light Mode ଏବଂ Dark Mode ସହିତ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଖାପଖାଇଯାଏ।

### View ର disabled state control କରିବା

`disabled` view disabled state ରେ ଅଛି କି ନାହିଁ control କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ:

```swift
.disabled(!canDecrease)
```

ଯେତେବେଳେ `disabled` `false`, view କୁ click କରିହେବ।

ଯେତେବେଳେ `disabled` `true`, view disabled state ରେ ଥାଏ ଏବଂ click କରିହେବ ନାହିଁ।

ଏଠାରେ `canDecrease` କୁ condition ଭାବରେ ବ୍ୟବହାର କରାଯାଇଥିବାରୁ code ବୁଝିବା ସହଜ ହୁଏ।

`canDecrease` ଦେଖିଲେ, ଏହାର ଅର୍ଥ “ବର୍ତ୍ତମାନ ଆଉ କମାଇପାରିବ କି” ବୋଲି ବୁଝିହେବ।

### ଅତିରିକ୍ତ ବ୍ୟାଖ୍ୟା: କାହିଁକି ଦୁଇଥର check କରାଯାଏ?

`-` button ରେ:

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

ଏଠାରେ `.disabled(!canDecrease)` ମଧ୍ୟ ବ୍ୟବହାର ହୋଇଛି, ଏବଂ button ଭିତରେ `if canDecrease` ମଧ୍ୟ ବ୍ୟବହାର ହୋଇଛି।

`.disabled(!canDecrease)` interface level ରେ button କୁ disabled କରେ, ଯାହା ଫଳରେ user ଏହାକୁ click କରିପାରେନାହିଁ।

`if canDecrease` code ଚାଲିବା ପୂର୍ବରୁ ପୁଣିଥରେ check କରେ। କେବଳ କମାଇପାରିବା ସ୍ଥିତିରେ `count -= 1` ଚାଲେ।

ଏହା double protection। ବାସ୍ତବ development ରେ, ଯଦି button ପୂର୍ବରୁ disabled ଅଛି, ଭିତରର condition କୁ ଛାଡ଼ିଦିଆଯାଇପାରେ। କିନ୍ତୁ teaching example ରେ ଏହାକୁ ରଖିବା `canDecrease` ର ଭୂମିକାକୁ ଅଧିକ ସ୍ପଷ୍ଟ କରେ।

## ସାରାଂଶ

ଏହି ପାଠରେ ଆମେ ମୁଖ୍ୟତଃ computed property ଶିଖିଲୁ।

Computed property ମୂଲ୍ୟକୁ ସିଧାସଳଖ ସଞ୍ଚୟ କରେନାହିଁ। ଏହା ପଢ଼ାଯାଇଲେ, ପୂର୍ବରୁ ଥିବା data ଆଧାରରେ ଫଳାଫଳ ଗଣନା କରେ।

ଉଦାହରଣ:

```swift
var c: Int {
    a + b
}
```

ଏଠାରେ `c` କୁ ଅଲଗା ଭାବରେ ସଞ୍ଚୟ କରିବା ଆବଶ୍ୟକ ନାହିଁ, କାରଣ ଏହାକୁ `a + b` ଦ୍ୱାରା ଗଣନା କରିହେବ।

Computed property କୁ ନିଶ୍ଚିତ ଭାବରେ `var` ବ୍ୟବହାର କରି ଘୋଷଣା କରିବାକୁ ପଡ଼େ, ଏବଂ return type ଦର୍ଶାଇବାକୁ ପଡ଼େ।

```swift
var canDecrease: Bool {
    count > 1
}
```

Computed property କେବଳ ସଂଖ୍ୟାତ୍ମକ ମୂଲ୍ୟ ନୁହେଁ, judgment result, text content, ଏପରିକି SwiftUI view content ମଧ୍ୟ return କରିପାରେ।

ଏହି ପାଠରେ ଆମେ `return` ମଧ୍ୟ ଶିଖିଲୁ।

`return` ର ଅର୍ଥ ହେଉଛି ଗୋଟିଏ ଫଳାଫଳ return କରିବା:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ଯଦି computed property ଭିତରେ ଫଳାଫଳ ଦେଉଥିବା ଗୋଟିଏ expression ମାତ୍ର ଥାଏ, `return` କୁ ଛାଡ଼ିଦିଆଯାଇପାରେ।

```swift
var totalPrice: Int {
    count * price
}
```

ଏହା ସହିତ, ଆମେ `Color.primary` ଏବଂ `disabled` ବିଷୟରେ ମଧ୍ୟ ଜାଣିଲୁ।

`Color.primary` ହେଉଛି SwiftUI ର system semantic color। ଏହା Light Mode ଏବଂ Dark Mode ଅନୁଯାୟୀ display effect କୁ ସ୍ୱୟଂଚାଳିତ ଭାବରେ adjust କରେ।

```swift
.foregroundStyle(Color.primary)
```

`disabled` view disabled ଅଛି କି ନାହିଁ control କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

```swift
.disabled(true)
```

ଏହାର ଅର୍ଥ disabled, click କରିହେବ ନାହିଁ।

```swift
.disabled(false)
```

ଏହାର ଅର୍ଥ available, click କରିହେବ।

ସେହିପାଇଁ computed property SwiftUI ରେ ବହୁତ ସାଧାରଣ। ଏହା ଗଣନା ଫଳାଫଳ, conditions, ଏବଂ display content କୁ ଅଧିକ ସ୍ପଷ୍ଟ ଭାବରେ ସଂଗଠିତ କରିବାରେ ସାହାଯ୍ୟ କରେ।
