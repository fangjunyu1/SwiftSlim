# struct ଏବଂ class

ପୂର୍ବ ପାଠରେ, ଆମେ ନୂଆକରି `struct` ସହିତ ପରିଚିତ ହେବା ଆରମ୍ଭ କରିଥିଲୁ, ଗୋଟିଏ structure କୁ ପରିଭାଷା କରିଥିଲୁ, ଏବଂ ସେଥି ସହିତ protocol, `UUID` ଇତ୍ୟାଦି ବିଷୟ ମଧ୍ୟ ଅଧିକ ଶିଖିଥିଲୁ।

ଏବେ `struct` keyword ବିଷୟରେ ଆମର ଏକ ପ୍ରାରମ୍ଭିକ ବୁଝାମଣା ହୋଇଛି, କିନ୍ତୁ ଏହାକୁ ସତରେ ପୂରା ବୁଝିଗଲୁ ବୋଲି ଆଉ କୁହିହେବ ନାହିଁ।

ଏହି ପାଠରେ, ଆମେ `struct` କୁ ମୁଖ୍ୟ ବିଷୟ ଭାବେ ଆଗକୁ ନେବୁ, ଏବଂ ସହିତ `class` ବିଷୟରେ ମଧ୍ୟ ଜାଣିବୁ। ଏହି ପାଠ ମାଧ୍ୟମରେ, instance କ’ଣ, constructor କ’ଣ, ଏବଂ ଆମେ `struct` ଓ `class` ବ୍ୟବହାର କରି data କାହିଁକି ଗଠନ କରିପାରୁଥାଉ ସେଥିରେ ଅଧିକ ସ୍ପଷ୍ଟତା ମିଳିବ।

## ଛାତ୍ର ପରିଚାଳନା ପ୍ରଣାଳୀ

ଉଦାହରଣ ସ୍ୱରୂପ, ଏବେ ଆମେ ଗୋଟିଏ ଛାତ୍ର ପରିଚାଳନା ପ୍ରଣାଳୀ ତିଆରି କରିବାକୁ ଚାହୁଁଛୁ। ପ୍ରତ୍ୟେକ ଛାତ୍ରଙ୍କର ନାମ, ଲିଙ୍ଗ, ଫୋନ, ବୟସ, ଘର ଠିକଣା ଇତ୍ୟାଦି ସୂଚନା ରହେ।

ଏହି ସମୟରେ, ଆମେ ଏହି ସମସ୍ତ ସୂଚନାକୁ ଏକଠା କରି `Student` structure ଭାବେ ପରିଭାଷା କରିପାରୁ:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

ଏଠାରେ ଆମେ `struct` ବ୍ୟବହାର କରି ଗୋଟିଏ ଛାତ୍ର type ପରିଭାଷା କରୁଛୁ।

ଏହି `Student` structure ଭିତରେ ଅନେକ property ରହିଛି:

- `id`: ଛାତ୍ରଙ୍କର ଏକମାତ୍ର ପରିଚୟ
- `name`: ଛାତ୍ରଙ୍କର ନାମ
- `sex`: ଛାତ୍ରଙ୍କର ଲିଙ୍ଗ
- `phone`: ଛାତ୍ରଙ୍କର ଫୋନ
- `age`: ଛାତ୍ରଙ୍କର ବୟସ
- `address`: ଘର ଠିକଣା

ଏଭଳି, ପୂର୍ବରୁ ଛିଟିଏ ଛାଟିଏ ଥିବା ଅନେକ data ମିଶି ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ "ଛାତ୍ର" ହୋଇଯାଏ।

ଏଠାରେ `Student` `Identifiable` protocol କୁ ମଧ୍ୟ ଅନୁସରଣ କରେ, ଏବଂ `id` field କୁ ପରିଭାଷା କରେ, ଯାହା ଫଳରେ ପରେ `ForEach` loop ସହ data ଦେଖାଇବା ସୁବିଧାଜନକ ହୁଏ।

ତାପରେ, ଆମେ ଗୋଟିଏ ଛାତ୍ରର instance ତିଆରି କରିପାରୁ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ଏହି code ର ଅର୍ଥ ହେଉଛି, `Student` ଏହି ଗଠନ ଅନୁଯାୟୀ ଆମେ ଗୋଟିଏ ନିର୍ଦ୍ଦିଷ୍ଟ ଛାତ୍ର data ସୃଷ୍ଟି କରିପାରୁ।

ଏଠାରେ `Student` ହେଉଛି type, ଏବଂ `Student(...)` ହେଉଛି ତିଆରି ହୋଇଥିବା ଗୋଟିଏ instance।

SwiftUI ଭିତରେ, ଆମେ ଏହି instance କୁ ଗୋଟିଏ variable କୁ assign କରି ପରେ ଦେଖାଇପାରୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

ଏପରି ଭାବରେ, ଆମେ view ଭିତରେ ଏହି ଛାତ୍ରଙ୍କର ନାମ `Fang Junyu` ଦେଖିପାରୁ।

ଏଠାରେ, ପ୍ରଥମେ ଆମେ `Student` ର ଗୋଟିଏ instance ତିଆରି କଲୁ, ପରେ ଏହାକୁ `student` variable କୁ assign କଲୁ, ଶେଷରେ `student.name` ଦ୍ୱାରା ତାହାର property ପଢିଲୁ।

## instance କ’ଣ

ଯେତେବେଳେ ଆମେ ପ୍ରଥମେ `struct` ଶିଖୁଥାଉ, "instance" ବୋଲି ଶବ୍ଦଟି ଅତ୍ୟନ୍ତ ଅପରିଚିତ ଲାଗିପାରେ।

କିନ୍ତୁ ପ୍ରକୃତରେ, ଆମେ ଆରମ୍ଭରୁ ହିଁ instances ବ୍ୟବହାର କରୁଛୁ, କେବଳ ପୂର୍ବରୁ ଏହାକୁ ଭଲଭାବରେ ଧ୍ୟାନ ଦେଇନଥିଲୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
let name = "Fang Junyu"
```

ଏଠାରେ `"Fang Junyu"` ହେଉଛି ଗୋଟିଏ string value, ଏବଂ ମୂଳତଃ ଏହା `String` type ର ଗୋଟିଏ instance।

ଆମେ ଏହାକୁ ଏଭଳି ମଧ୍ୟ ଲେଖିପାରୁ:

```swift
let name = String("Fang Junyu")
```

ଏହି ଦୁଇଟି ଲେଖନ ଶୈଳୀ ଏକେ ଅର୍ଥକୁ ବ୍ୟକ୍ତ କରେ: `String` type ର ଗୋଟିଏ instance ତିଆରି କରି ଏହାକୁ `name` variable କୁ assign କରିବା।

ସେହିପରି, `Int` ପାଇଁ ମଧ୍ୟ ଏହା ସତ୍ୟ:

```swift
let num = 3
```

ଏଠାରେ `3` ମୂଳତଃ `Int` type ର ଗୋଟିଏ value, ଏବଂ ଏହାକୁ `Int` ର ଗୋଟିଏ instance ଭାବରେ ମଧ୍ୟ ବୁଝାଯାଇପାରେ।

ସେହିପରି, instance କେବଳ `struct` ମଧ୍ୟରେ ଦେଖାଯାଉଥିବା କୌଣସି ବିଶେଷ ଧାରଣା ନୁହେଁ।

`String`, `Int`, `Double`, `Bool`, କିମ୍ବା ଆମେ ସ୍ୱୟଂ ତିଆରି କରିଥିବା `Student` — ସମସ୍ତେ instance ସୃଷ୍ଟି କରିପାରନ୍ତି।

ସେହିପାଇଁ, ଯେତେବେଳେ ଆମେ ଏହିପରି ଲେଖୁ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ତାହା ମୂଳତଃ `String` କିମ୍ବା `Int` ର instance ସୃଷ୍ଟି କରିବା ସହିତ ସମାନ; ତଫାତ ମାତ୍ର ଏତିକି ଯେ `Student` ହେଉଛି ଆମେ ନିଜେ ପରିଭାଷା କରିଥିବା ଗୋଟିଏ type।

## constructor

ଆମେ ଯେତେବେଳେ ଗୋଟିଏ instance ତିଆରି କରୁ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ସେତେବେଳେ ବାସ୍ତବରେ ଆମେ `Student`-ର initialization method, ଅର୍ଥାତ `init`, କୁ call କରୁଛୁ।

constructor କୁ ଏଭଳି ବୁଝିପାରିବା: **instance ସୃଷ୍ଟି ସମୟରେ properties କୁ values ଦେବା ପାଇଁ ଏହା ହେଉଛି ପ୍ରବେଶଦ୍ୱାର।**

ଅର୍ଥାତ, ଗୋଟିଏ instance ସତରେ ପୂର୍ଣ୍ଣ ଭାବେ ତିଆରି ହେବା ପୂର୍ବରୁ ସାଧାରଣତଃ ପ୍ରଥମେ `init` ମାଧ୍ୟମରେ ଯିବାକୁ ପଡେ।

ଉଦାହରଣ ସ୍ୱରୂପ, ପୂର୍ବରୁ SwiftUI view lifecycle ଶିଖିବା ବେଳେ, ଆମେ ଏପରି code ଲେଖିଥିଲୁ:

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
    }
}
```

ଏଠାରେ `init()` `ContentView` instance ସୃଷ୍ଟି ହେବାବେଳେ ଚାଲେ, କିନ୍ତୁ `onAppear` କେବଳ view ପ୍ରକୃତରେ screen ଉପରେ ଦେଖାଯାଇଥିବାବେଳେ ଚାଲେ। ଅର୍ଥାତ, view ସୃଷ୍ଟି ଏବଂ view ପ୍ରଦର୍ଶନ ଏକେ ସମୟରେ ହୁଏନାହିଁ।

ସେହିପରି, ଯେତେବେଳେ ଆମେ `Student(...)` ସୃଷ୍ଟି କରୁଛୁ, ଆମେ `Student`-ର constructor କୁ ମଧ୍ୟ call କରୁଛୁ।

### ସିଷ୍ଟମ ଦ୍ୱାରା ସ୍ୱୟଂଚାଳିତ ଭାବେ ସୃଷ୍ଟିତ constructor

ଆମେ ଯେତେବେଳେ `Student` କୁ ପରିଭାଷା କରିଥିଲୁ, `init` କୁ ହାତରେ ଲେଖିନଥିଲୁ:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

ତଥାପି, ଆମେ ସିଧାସଳଖ instance ତିଆରି କରିପାରୁ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor ଲେଖିନଥିଲେ ମଧ୍ୟ instance କିପରି ସୃଷ୍ଟି ହୁଏ?

କାରଣ `struct` ପାଇଁ, ଯଦି ଆମେ constructor କୁ ହାତରେ ଲେଖିନାହୁଁ, ସିଷ୍ଟମ ସାଧାରଣତଃ ଆମ ପାଇଁ ଉପଯୁକ୍ତ constructor କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ତିଆରି କରେ।

ଶିଖିବାର ଆରମ୍ଭିକ ପର୍ଯ୍ୟାୟରେ, ଏହାକୁ ସରଳ ଭାବରେ ଏଭଳି ବୁଝିହେବ: Swift ଆମ ପାଇଁ initialization code କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ପୂରଣ କରେ।

ମୋଟାମୋଟି ଭାବରେ ଏହାକୁ ଏଭଳି ବୁଝିହେବ ଯେ, ସିଷ୍ଟମ ଆମ ପାଇଁ ନିମ୍ନଲିଖିତ code କୁ ପୂରଣ କରେ:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

ଏଠାରେ ଗୋଟିଏ ଛୋଟ ବିଷୟ ଉପରେ ଧ୍ୟାନ ଦେବା ଆବଶ୍ୟକ:

```swift
let id = UUID()
```

`id` ପୂର୍ବରୁ default value ରଖିଛି, ସେହିପରି instance ତିଆରି କରିବା ବେଳେ ଆମକୁ `id` ପୁଣିଥରେ ହାତରେ pass କରିବାର ଆବଶ୍ୟକତା ନାହିଁ।

ଅର୍ଥାତ, ଯେ properties ପାଖରେ default value ନଥାଏ, ସେଗୁଡ଼ିକୁ ସାଧାରଣତଃ constructor ଭିତରେ pass କରିବାକୁ ପଡେ; ଏବଂ ଯେ properties ପାଖରେ ପୂର୍ବରୁ default value ଅଛି, ସେଗୁଡ଼ିକ ସେହି ମୂଳ default value କୁ ସିଧାସଳଖ ବ୍ୟବହାର କରିପାରିବ।

ସେହିପାଇଁ, `Student` instance ସୃଷ୍ଟି କରିବାବେଳେ ଆମକୁ କେବଳ `name`, `sex`, `phone`, `age`, ଏବଂ `address` pass କରିବାକୁ ପଡେ।

### compiler ସୂଚନା

ଏହାସହିତ, ଯେତେବେଳେ ଆମେ Xcode ରେ `Student(...)` ଟାଇପ କରୁଛୁ, ସିଷ୍ଟମ ଦେଇଥିବା parameter hints ମଧ୍ୟ ଦେଖିପାରୁ।

![student](../../Resource/022_student.png)

ଏହା ମଧ୍ୟ ବାସ୍ତବରେ ଦେଖାଏ ଯେ ବର୍ତ୍ତମାନର ଏହି type ପାଇଁ ସିଷ୍ଟମ ସ୍ୱୟଂଚାଳିତ ଭାବେ ତିଆରି କରିଥିବା constructor ସତରେ ଅଛି।

### ନିଜେ constructor ଲେଖିବା

ସିଷ୍ଟମ constructor କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ତିଆରି କରିପାରୁଥିଲେ ମଧ୍ୟ, କେତେକ ସମୟରେ ଏହି default initialization ପ୍ରକ୍ରିୟା ଆମର ଆବଶ୍ୟକତା ସହ ପୂର୍ଣ୍ଣରୂପେ ମେଳ ଖାଏନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଆମ ପାଖରେ ଏକ `Movie` structure ଅଛି:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ସିଷ୍ଟମ ସ୍ୱୟଂଚାଳିତ ଭାବେ ତିଆରି କରିଥିବା constructor ଅନୁଯାୟୀ, instance ସୃଷ୍ଟି କରିବା ବେଳେ ଆମକୁ ଏହି ତିନୋଟି parameter ଏକାସାଥିରେ ଦେବାକୁ ପଡେ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

କିନ୍ତୁ ଯଦି ଏବେ ଆମେ ପୁରୁଣା ଚଳଚ୍ଚିତ୍ରମାନଙ୍କର data ଭରିବାକୁ ଚାହୁଁଛୁ, ଏବଂ କେବଳ ନାମ ଜାଣୁଛୁ, କିନ୍ତୁ director ଓ rating ଜାଣୁନାହୁଁ, ତେବେ ଏହା କିଛି ଅସୁବିଧାଜନକ ହୁଏ।

କାରଣ ତେବେ ଆମେ ଏହାକୁ କେବଳ ଏଭଳି ଲେଖିପାରୁ:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

ଏହା କାମ କରୁଥିଲେ ମଧ୍ୟ, ପ୍ରତିଥର `--` ଲେଖିବା ସୁବିଧାଜନକ ନୁହେଁ।

ଏହି ସମୟରେ, ଆମେ ଗୋଟିଏ constructor ଲେଖିପାରୁ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

ଏହିପରି, ପୁରୁଣା ଚଳଚ୍ଚିତ୍ର ସୃଷ୍ଟି କରିବା ବେଳେ ଆମକୁ କେବଳ `name` ଦେଲେ ହେବ:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

ଏହା ହେଉଛି ନିଜେ constructor ଲେଖିବାର ଏକ ଅର୍ଥ: **instance ସୃଷ୍ଟି ପ୍ରକ୍ରିୟାକୁ ବାସ୍ତବ ଆବଶ୍ୟକତା ସହ ଅଧିକ ମେଳ ଖାଇବାଯୋଗ୍ୟ କରିବା।**

### custom constructor ବିଶ୍ଳେଷଣ

ଆସ, ଆମେ ଏମାତ୍ର ହାତରେ ଲେଖିଥିବା ଏହି constructor କୁ ଦେଖିବା:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

ଏହି code ର ଅର୍ଥ ହେଉଛି, `Movie` instance ସୃଷ୍ଟି କରିବା ବେଳେ `name` ବୋଲି ଗୋଟିଏ parameter ଦେଲେ ହେବ।

ତାପରେ constructor ଭିତରେ, ଦିଆଯାଇଥିବା `name` କୁ instance ର ନିଜ `name` କୁ assign କରାଯିବ, ଏବଂ `director` ଓ `rating` କୁ default value `--` ଦିଆଯିବ।

ଏଠାରେ `self` ର ଅର୍ଥ "ଏହି ବର୍ତ୍ତମାନର instance ନିଜେ"।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
self.name = name
```

ବାମପଟର `self.name` instance ଭିତରର property କୁ ଦର୍ଶାଏ; ଡାହାଣପଟର `name` ଆମେ ଦେଇଥିବା parameter କୁ ଦର୍ଶାଏ।

ଏହାକୁ ସରଳ ଭାବରେ ବୁଝିଲେ, ବାହାରରୁ ଆସିଥିବା value କୁ instance ର ନିଜ property ଭିତରେ ସଂରକ୍ଷଣ କରାଯାଉଛି।

ଯେତେବେଳେ ସମସ୍ତ properties କୁ values ମିଳିଯାଏ, ଏହି instance ର ସୃଷ୍ଟି ପ୍ରକ୍ରିୟା ପୂର୍ଣ୍ଣ ହୁଏ।

### constructor ର କାର୍ଯ୍ୟପ୍ରଣାଳୀ

ଯେତେବେଳେ ଆମେ ସ୍ପଷ୍ଟ ଭାବରେ constructor declare କରୁଛୁ, ତେବେ ଆଉ ଗୋଟିଏ ପରିବର୍ତ୍ତନ ହୁଏ:

ସିଷ୍ଟମ ପୂର୍ବରୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ସୃଷ୍ଟି କରିଥିବା constructor ସାଧାରଣତଃ ଆଉ ସିଧାସଳଖ ବ୍ୟବହାର କରାଯାଇପାରେନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

ଏବେ ଯଦି ଆମେ ପୁଣି ଏଭଳି ଲେଖୁ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ତେବେ compiler error ଦେଖାଇବ:

```swift
Extra arguments at positions #2, #3 in call
```

ଏହାର ଅର୍ଥ: ତୁମେ ଅତିରିକ୍ତ parameters ଦେଇଛ।

ଏହି error କାହିଁକି ଆସେ?

କାରଣ ବର୍ତ୍ତମାନର `Movie` structure ଭିତରେ ତୁମେ ହାତରେ declare କରିଥିବା ଏହି ଗୋଟିଏ constructor ମାତ୍ର ଅଛି:

```swift
init(name: String)
```

ଏହା କେବଳ `name` ବୋଲି ଗୋଟିଏ parameter ଗ୍ରହଣ କରେ; `director` ଓ `rating` କୁ ଗ୍ରହଣ କରେନାହିଁ।

ଅର୍ଥାତ, ତୁମେ ନିଜେ constructor ହାତରେ ଯୋଗ କରିଦେଲେ, ସିଷ୍ଟମ ପୂର୍ବରୁ ତିଆରି କରିଥିବା initialization style କୁ ସିଧାସଳଖ ବ୍ୟବହାର କରିହେବ ନାହିଁ।

ଯଦି ଆମେ "କେବଳ ନାମ ଦେବା" ଓ "ପୂର୍ଣ୍ଣ ସୂଚନା ଦେବା" — ଏହି ଦୁଇଟିକୁ support କରିବାକୁ ଚାହୁଁଛୁ, ତେବେ ଆଉ ଗୋଟିଏ ପୂର୍ଣ୍ଣ constructor ଆମକୁ ନିଜେ ଯୋଡିବାକୁ ପଡେ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

ଏହିପରି, ଆମ ପାଖରେ ଦୁଇଟି ଭିନ୍ନ constructors ଥିବ।

ପୁରୁଣା ସିନେମା ସୃଷ୍ଟି କରିବା ବେଳେ ଆମେ ଏଭଳି ଲେଖିପାରୁ:

```swift
Movie(name: "The Night of the Hunter")
```

ପୂର୍ଣ୍ଣ ସୂଚନା ସହ ନୂଆ ସିନେମା ସୃଷ୍ଟି କରିବା ବେଳେ ଆମେ ଏଭଳି ଲେଖିପାରୁ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ଏହି ଲେଖନ ଶୈଳୀ ଏହାକୁ ମଧ୍ୟ ଦେଖାଏ ଯେ ଏକେ type ର ଅନେକ constructor ଥାଇପାରେ, ଯେପର୍ଯ୍ୟନ୍ତ ସେମାନଙ୍କର parameter ରୂପ ଭିନ୍ନ ଥାଏ।

## overload କ’ଣ

ଏଠାରେ ଆମେ ଆଉ ଗୋଟିଏ ଆବଶ୍ୟକ ଜ୍ଞାନବିନ୍ଦୁ ଯୋଡୁଛୁ।

ଏମାତ୍ର ଆମେ `Movie` ପାଇଁ ଦୁଇଟି `init` ଲେଖିଥିଲୁ:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

ଏଭଳି ଲେଖନ, ଅର୍ଥାତ "ଏକେ function name, କିନ୍ତୁ ଭିନ୍ନ parameters", କୁ "overload" କୁହାଯାଏ।

ଏଠାରେ ଦୁଇଟି function ର ନାମ `init` ହେଲେ ମଧ୍ୟ, ସେମାନେ ଭିନ୍ନ parameters ଗ୍ରହଣ କରୁଥିବାରୁ Swift ବୁଝିପାରେ ଯେ ତୁମେ କେଉଁ function କୁ call କରୁଛ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Movie(name: "Days of Heaven")
```

ଏହା call କରିବ:

```swift
init(name: String)
```

ଏବଂ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ଏହା initialization method ର ଅନ୍ୟ ଗୋଟିଏ ପୂର୍ଣ୍ଣ version କୁ call କରିବ।

ସେହିପରି overload ର ଭୂମିକା ହେଉଛି, ଏକେ type କୁ ଭିନ୍ନ ପରିସ୍ଥିତି ପାଇଁ ଭିନ୍ନ ସୃଷ୍ଟି ପ୍ରକ୍ରିୟା ଦେବା।

## class ପରିଚୟ

ପରେ, ଆସ, ସଂକ୍ଷିପ୍ତ ଭାବରେ `class` ବିଷୟରେ ମଧ୍ୟ ଜାଣିବା।

Swift ଭିତରେ ସାଧାରଣ `struct` ଛଡ଼ା, Java, C#, Kotlin ଇତ୍ୟାଦି ଅନେକ programming languages instances ସୃଷ୍ଟି କରିବା ପାଇଁ `class` ବ୍ୟବହାର କରନ୍ତି।

Swift ଭିତରେ `class` ଲେଖିବାର ଶୈଳୀ `struct` ସହ ଖୁବ ମିଳିଥାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

ତୁମେ ଦେଖିବା, `struct` keyword ର ବଦଳରେ `class` ଆସିଥିବା ବାଦ ଦେଲେ, ଅନ୍ୟ ସବୁ ଭାଗ ପ୍ରାୟ ଏକେ ପରି ଲାଗେ।

instance ସୃଷ୍ଟି କରିବାର ପ୍ରକ୍ରିୟା ମଧ୍ୟ ଖୁବ ସମାନ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ସେହିପରି, syntax ମାନରେ `struct` ଏବଂ `class` ବାସ୍ତବରେ ଖୁବ ସମାନ।

### Struct ଏବଂ Class ମଧ୍ୟରେ ତଫାତ

`struct` ଏବଂ `class` ଦେଖିବାକୁ ବହୁତ ସମାନ ଲାଗିଥିଲେ ମଧ୍ୟ, ସେମାନେ ପୂର୍ଣ୍ଣରୂପେ ଏକ ନୁହେଁ।

**1. initialization ର ପ୍ରକ୍ରିୟା ଭିନ୍ନ**

`struct` ପାଇଁ, ଯଦି ଆମେ constructor କୁ ହାତରେ ଲେଖିନାହୁଁ, ସିଷ୍ଟମ ସାଧାରଣତଃ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଉପଯୁକ୍ତ initialization method ତିଆରି କରେ।

କିନ୍ତୁ `class` ପାଇଁ, ଯଦି default value ନଥିବା properties ଅଛି, ତେବେ ସାଧାରଣତଃ `init` କୁ ହାତରେ ଲେଖିବାକୁ ପଡେ; ନଚେତ error ଆସିବ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

ଏହି `class` ରେ constructor ନଥିବାରୁ properties initialize ହେଉନାହିଁ, ତେଣୁ error ଆସିବ।

compiler ସାଧାରଣତଃ ଏଭଳି ଏକ ସୂଚନା ଦେଖାଇବ:

```swift
Class 'Movie' has no initializers
```

ସେହିପାଇଁ, ଏହି ଉଦାହରଣରେ `class` ପାଇଁ constructor କୁ ହାତରେ ଲେଖିବା ଆବଶ୍ୟକ।

**2. `struct` ହେଉଛି value type, `class` ହେଉଛି reference type**

`struct` ହେଉଛି value type, ଏବଂ `class` ହେଉଛି reference type।

ଶିଖିବାର ଆରମ୍ଭିକ ପର୍ଯ୍ୟାୟରେ ଏହି ଦୁଇଟି ଧାରଣାକୁ ପୂର୍ଣ୍ଣରୂପେ ବୁଝିବା ଆବଶ୍ୟକ ନୁହେଁ; ମାତ୍ର ସରଳ ପ୍ରାରମ୍ଭିକ ଧାରଣା ଥିଲେ ଚାଲିବ।

ଉଦାହରଣ ସ୍ୱରୂପ, `struct` "ନୂତନ value ର copy" ଧାରଣା ସହ ଅଧିକ ସମାନ।

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

ଏଠାରେ `user1` କୁ `user2` କୁ assign କଲେ, ମୂଳତଃ ନୂତନ data copy ସୃଷ୍ଟି ହୁଏ; ସେହିପରି `user2` କୁ ବଦଳାଇଲେ `user1` ପ୍ରଭାବିତ ହୁଏନାହିଁ।

ଅନ୍ୟପଟେ, `class` "ଏକେ instance କୁ ଏକାସାଥିରେ ସୂଚନ" ଧାରଣା ସହ ଅଧିକ ସମାନ।

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

ଏଠାରେ `user1` ଏବଂ `user2` ଏକେ instance କୁ ସୂଚନ କରୁଛନ୍ତି।

ଏବେ value type ଏବଂ reference type ର ଭିତରକାରୀ କାର୍ଯ୍ୟପ୍ରଣାଳୀକୁ ପୂର୍ଣ୍ଣରୂପେ ବୁଝିବା ଆବଶ୍ୟକ ନାହିଁ; `struct` ସ୍ୱତନ୍ତ୍ର data ସଂରକ୍ଷଣ ପାଇଁ ଅଧିକ ଉପଯୁକ୍ତ, ଏବଂ `class` ଅନେକ ସ୍ଥାନରେ ଏକେ instance share କରିବାକୁ ହେଲେ ଅଧିକ ଉପଯୁକ୍ତ — ଏତିକି ଜାଣିଲେ ଯଥେଷ୍ଟ।

## ଆରମ୍ଭିକ ପର୍ଯ୍ୟାୟରେ କିପରି ଚୟନ କରିବେ

ବର୍ତ୍ତମାନ ପର୍ଯ୍ୟାୟରେ, ସାଧାରଣ data models ପାଇଁ ପ୍ରଥମେ `struct` ବିଚାର କର; shared data ଏବଂ synchronized ପରିବର୍ତ୍ତନ ଆବଶ୍ୟକ ହେଲେ `class` ବିଚାର କର।

ଏହା କୌଣସି ସଂପୂର୍ଣ୍ଣ ନିୟମ ନୁହେଁ, କିନ୍ତୁ ନବଶିକ୍ଷୁମାନଙ୍କ ପାଇଁ ଏହା ପର୍ଯ୍ୟାପ୍ତ ଭାବରେ ବ୍ୟବହାରିକ ନିଷ୍ପତ୍ତି ପ୍ରଣାଳୀ।

ବିଶେଷକରି SwiftUI ଭିତରେ, ବହୁ ସମୟରେ `struct` ଏକାକୀ ଅଧିକାଂଶ କାମ କରିପାରେ ବୋଲି ତୁମେ ଦେଖିବ।

ଏଥିସହିତ, ଅନେକ programming materials ଭିତରେ `class` ଦ୍ୱାରା ସୃଷ୍ଟିତ ଜିନିଷକୁ "object" ମଧ୍ୟ କୁହାଯାଏ। ଆରମ୍ଭିକ ପର୍ଯ୍ୟାୟରେ, ଏହାକୁ ସରଳଭାବରେ instance ଭାବରେ ବୁଝିଲେ ହେବ; ଅଲଗା ଭାବେ ପାର୍ଥକ୍ୟ କରିବା ଆବଶ୍ୟକ ନାହିଁ।

## ସାରାଂଶ

ଏହି ପାଠରେ, ଆମେ `struct` କୁ ଅଧିକ ଗଭୀରତରେ ଶିଖିଲୁ, ଏବଂ ସହିତ `class` ବିଷୟରେ ମଧ୍ୟ ଜାଣିଲୁ; ଏହି ଦୁହେଁକୁ types ପରିଭାଷା କରିବା ପାଇଁ ବ୍ୟବହାର କରିହେବ।

Types instances ସୃଷ୍ଟି କରିପାରନ୍ତି। Instance ସୃଷ୍ଟି କରିବାବେଳେ constructor, ଅର୍ଥାତ `init`, call ହୁଏ।

`struct` ପାଇଁ, ଯଦି constructor କୁ ହାତରେ ଲେଖାଯାଇନଥାଏ, ସିଷ୍ଟମ ସାଧାରଣତଃ ଉପଯୁକ୍ତ constructor କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ସୃଷ୍ଟି କରେ। ଯଦି default constructor ଆବଶ୍ୟକତା ପୂରଣ କରୁନାହିଁ, ତେବେ ଆମେ constructor କୁ ସ୍ୱୟଂ ମଧ୍ୟ ଲେଖିପାରୁ।

ଏହା ସହିତ, `struct` ଏବଂ `class` ମଧ୍ୟରେ ଥିବା ପାର୍ଥକ୍ୟ ବିଷୟରେ ମଧ୍ୟ ଆମର ପ୍ରାରମ୍ଭିକ ଧାରଣା ହେଲା: `struct` ହେଉଛି value type, ଯେତେବେଳେ `class` ହେଉଛି reference type। SwiftUI ଭିତରେ ଆରମ୍ଭିକ ପର୍ଯ୍ୟାୟରେ ସାଧାରଣତଃ ଅଧିକ ଦେଖାଯାଉଥିବା ହେଉଛି `struct`।

ପରେ views ମଧ୍ୟରେ value pass କରିବା, data models, ଏବଂ state management ଶିଖିବାବେଳେ, ଏହି ସମସ୍ତ ବିଷୟ ଆଗକୁ ମଧ୍ୟ ବ୍ୟବହୃତ ହେବ।
