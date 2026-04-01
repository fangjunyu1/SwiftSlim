# ଟାଇପ୍ ସିଷ୍ଟମ୍

ପୂର୍ବରୁ ଥିବା ପାଠଗୁଡିକରେ, ଆମେ ଭେରିଏବଲ୍ ବିଷୟରେ ଶିଖିଛୁ, ଏବଂ ଜାଣିଛୁ ଯେ ଭେରିଏବଲ୍ ଭିନ୍ନ ଭିନ୍ନ ପ୍ରକାରର ଡାଟା ସଞ୍ଚୟ କରିପାରେ।

ଉଦାହରଣ:

```swift
var hello = "Hello, World"
```

ଏଠାରେ `hello` ଗୋଟିଏ ଟେକ୍ସ୍ଟ ସଞ୍ଚୟ କରୁଛି, ସେହିପାଇଁ ଏହାର ଟାଇପ୍ `String`।

ପରେ, ଆମେ ବ୍ୟବସ୍ଥିତ ଭାବରେ Type ର ଧାରଣା, explicit type declaration ଏବଂ type inference ବିଷୟରେ ଶିଖିବୁ, ଯାହା ଭେରିଏବଲ୍‌ର ମୂଳ ସ୍ୱଭାବକୁ ଆଉ ଗଭୀରରେ ବୁଝିବାକୁ ସାହାଯ୍ୟ କରିବ।

## ଟାଇପ୍ କ’ଣ

Swift ରେ, ପ୍ରତ୍ୟେକ value ର ଗୋଟିଏ ସ୍ପଷ୍ଟ ଟାଇପ୍ ଥାଏ। ଟାଇପ୍ ନିର୍ଣ୍ଣୟ କରେ ସେହି value କ’ଣ ଏବଂ ସେ କ’ଣ କରିପାରିବ।

ଉଦାହରଣ:

* `42` ହେଉଛି ଗୋଟିଏ `Int` (ପୂର୍ଣ୍ଣ ସଂଖ୍ୟା)
* `"Hello"` ହେଉଛି `String` (ଷ୍ଟ୍ରିଙ୍ଗ୍)
* `true` ହେଉଛି `Bool` (ବୁଲିୟନ୍)

ସେମାନେ ଭିନ୍ନ ଭିନ୍ନ ଟାଇପ୍‌ର, ଏବଂ ସେମାନଙ୍କର ବ୍ୟବହାର ମଧ୍ୟ ଭିନ୍ନ।

## Swift ର ସାଧାରଣ ମୌଳିକ ଟାଇପ୍‌ଗୁଡିକ

ଆରମ୍ଭିକ ପର୍ଯ୍ୟାୟରେ, ସବୁଠାରୁ ସାଧାରଣ ଟାଇପ୍‌ଗୁଡିକ ହେଲେ:

* `String`：ଷ୍ଟ୍ରିଙ୍ଗ୍ (ଟେକ୍ସ୍ଟ)
* `Int`：ପୂର୍ଣ୍ଣ ସଂଖ୍ୟା
* `Double`：ଦଶମିକ ସଂଖ୍ୟା (ଦଶମିକ ସହ, ଅଧିକ ସଠିକତା)
* `Bool`：ବୁଲିୟନ୍ (`true/false`)

ଏହା ସହିତ `Float` (ଦଶମିକ ସଂଖ୍ୟା) ମଧ୍ୟ ଅଛି, କିନ୍ତୁ ଏହାର ସଠିକତା `Double` ଠାରୁ କମ୍, ସେହିପାଇଁ ସାଧାରଣତଃ କମ୍ ବ୍ୟବହାର ହୁଏ; `Character` (ଏକକ ଅକ୍ଷର) ମଧ୍ୟ ଅଛି, ଯଥା `"A"`、`"!"` ପରି ଏକକ ଚରିତ୍ର।

### ଟାଇପ୍ ଘୋଷଣା (Explicit Type)

Swift ରେ, ଭେରିଏବଲ୍ ଘୋଷଣା କରିବା ବେଳେ ହାତରେ ଟାଇପ୍ ଦିଆଯାଇପାରେ:

```swift id="s6x6qd"
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

ଭେରିଏବଲ୍‌ର ନାମ ପରେ `: ଟାଇପ୍` ଯୋଡି ଟାଇପ୍ ଘୋଷଣା କରାଯାଏ।

Array ର ଟାଇପ୍ ଲେଖା ହୁଏ `: [ଟାଇପ୍]` ଭାବେ:

```swift id="jkkur1"
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

ଏହି କୋଡ୍‌ରେ, `scores` array କେବଳ `Int` ଟାଇପ୍‌ର ଉପାଦାନ ସଞ୍ଚୟ କରିପାରିବ, ଏବଂ `tags` କେବଳ `String` ସଞ୍ଚୟ କରିପାରିବ।

Explicit type declaration କୋଡ୍‌ର ଉଦ୍ଦେଶ୍ୟକୁ ଆଉ ସ୍ପଷ୍ଟ କରେ, ଏବଂ କିଛି ପରିସ୍ଥିତିରେ type inference ର ଭୁଲକୁ ଏଡ଼ାଇପାରିବ।

## Type Inference

ଅନେକ ପରିସ୍ଥିତିରେ, explicit ଭାବେ type ଘୋଷଣା କରିବା ଦରକାର ପଡ଼େନାହିଁ:

```swift id="r3jd3f"
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

ଏହାର କାରଣ, Swift compiler “initial value” ଆଧାରରେ ଟାଇପ୍‌କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ infer କରିଦିଏ।

## Explicit Declaration ଏବଂ Type Inference

ପୂର୍ବରୁ ଥିବା ପାଠଗୁଡିକରେ, ଆମେ explicit declaration ନେଇ ଆଲୋଚନା କରିନଥିଲୁ, ଯଥା:

```swift id="s4t2wm"
var age: Int = 18
```

ତା’ ପରିବର୍ତ୍ତେ, ଆମେ ପ୍ରଥମେ type inference ବ୍ୟବହାର କରୁଥିଲୁ:

```swift id="j8ludx"
var age = 18
```

ଏହି ଉଦାହରଣରେ, ଦୁଇଟି ଲେଖା ପ୍ରକ୍ରିୟା ସମାନ; `age` ଦୁଇଥରେ ମଧ୍ୟ `Int` ଟାଇପ୍‌ରେ ନିର୍ଦ୍ଧାରିତ ହେବ। ତୁଳନାମୂଳକ ଭାବେ, type inference ର ଲେଖା ପ୍ରକ୍ରିୟା ଅଧିକ ସରଳ।

ଆରମ୍ଭିକ ଅଂଶରେ explicit declaration ଉପରେ ଜୋର ଦିଆଯାଇନଥିଲା, କାରଣ type inference କୋଡ୍‌ରେ ଥିବା ଅତିରିକ୍ତ ସୂଚନାକୁ କମେଇ ଆରମ୍ଭିକ ଶିଖଣ ଖର୍ଚ୍ଚକୁ କମ୍ କରେ।

## ଟାଇପ୍ କାହିଁକି ଦରକାର

Swift ହେଉଛି ଗୋଟିଏ Strongly Typed Language।

ଏହାର ଅର୍ଥ: ଯେତେବେଳେ ଭେରିଏବଲ୍‌ର ଟାଇପ୍ ନିର୍ଦ୍ଧାରିତ ହୋଇଯାଏ, ତା’ପରେ ସେହି ଟାଇପ୍‌କୁ ଇଚ୍ଛାମତେ ବଦଳାଯାଇପାରେ ନାହିଁ।

ଉଦାହରଣ:

```swift id="jg341n"
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

ପ୍ରଥମ `20` ହେଉଛି `Int` ଟାଇପ୍‌, ତେଣୁ ଏହାକୁ `age` କୁ assign କରାଯାଇପାରିବ; ଦ୍ୱିତୀୟ `"20"` ହେଉଛି `String` ଟାଇପ୍‌, ଯାହା `Int` ସହ ମିଳେନାହିଁ, ସେହିପାଇଁ error ହେବ।

`nums` ହେଉଛି `[Int]` ଟାଇପ୍‌ର array, ତେଣୁ ଏହା କେବଳ ପୂର୍ଣ୍ଣ ସଂଖ୍ୟା ସଞ୍ଚୟ କରିପାରିବ, ଷ୍ଟ୍ରିଙ୍ଗ୍ ମିଶାଇପାରିବ ନାହିଁ।

ଟାଇପ୍ ଡାଟା ବ୍ୟବହାର ଉପରେ ନିୟନ୍ତ୍ରଣ ରାଖିପାରେ, ଏବଂ compile stage ରେ type mismatch ସମସ୍ୟାକୁ ଧରିପାରେ, ଯାହା type confusion ରୁ ହେଉଥିବା BUG କୁ କମାଇ, କୋଡ୍‌ର stability ଏବଂ maintainability ବଢ଼ାଏ।

## କେବେ Explicit Type Declaration ଦରକାର

ଯଦିଓ Swift ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଟାଇପ୍ infer କରିପାରେ, କିଛି ପରିସ୍ଥିତିରେ compiler ଏହାକୁ infer କରିପାରେନାହିଁ, କିମ୍ବା ଭୁଲ infer କରିପାରେ। ସେଥିରେ ଆମକୁ ହାତରେ type ଘୋଷଣା କରିବାକୁ ପଡିବ।

**1. ଖାଲି Array**

ଖାଲି array ତିଆରି କରିବା ବେଳେ, explicit type declaration ଦରକାର:

```swift id="f1x5mb"
var nums: [Int] = []
```

ଯଦି type ଲେଖାଯାଇନାହିଁ:

```swift id="5wqwpz"
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compiler ଖାଲି array ଠାରୁ ତାହାର ଉପାଦାନ ଟାଇପ୍ infer କରିପାରେନାହିଁ, ସେହିପାଇଁ compile error ହେବ।

**2. Infer Error କୁ ଏଡ଼ାଇବା**

```swift id="y2mmut"
var value = 10   // Int
```

ଏହି ଉଦାହରଣରେ, ଯଦିଓ `10` ଦଶମିକ ସଂଖ୍ୟା (`Double`) କୁ ମଧ୍ୟ ପ୍ରଦର୍ଶିତ କରିପାରେ, କିନ୍ତୁ ଏଠାରେ decimal point ନଥିବାରୁ compiler default ଭାବେ ଏହାକୁ `Int` ବୋଲି infer କରିବ।

ଯଦି `value` କୁ decimal value ବୋଲି ବୁଝାଇବାକୁ ହୁଏ, ତେବେ explicit type ଦେବା ଦରକାର:

```swift id="gie3ut"
var value: Double = 10   // Double
```

ଯେତେବେଳେ type inference ର ଫଳ ଆମର ଆଶା ସହ ମେଳ ଖାଉନାହିଁ, ସେତେବେଳେ explicit declaration କିମ୍ବା literal ର ରୂପକୁ ବଦଳାଇ type କୁ ସଠିକ୍ କରିବା ଉଚିତ।

**3. Custom Type**

ପରବର୍ତ୍ତୀ ପାଠରେ ଆମେ custom type ବିଷୟରେ ମଧ୍ୟ ଶିଖିବୁ। Custom type ବ୍ୟବହାର କଲେ ସାଧାରଣତଃ explicit type ଘୋଷଣା ମଧ୍ୟ ଦରକାର ପଡ଼େ:

```swift id="a0ti75"
var info: GameInfo
var users: [User] = []
```

ଏହାର କାରଣ ଖାଲି array ସହ ସମାନ; compiler ଖାଲି value ଠାରୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ type infer କରିପାରେନାହିଁ।

## Type Conversion

Swift ରେ, ଭିନ୍ନ ଟାଇପ୍‌ମାନଙ୍କ ମଧ୍ୟରେ ସ୍ୱୟଂଚାଳିତ conversion ହୁଏନାହିଁ, ଏହାକୁ ହାତରେ କରିବାକୁ ପଡେ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଭିନ୍ନ ଟାଇପ୍‌ର ଦୁଇଟି ସଂଖ୍ୟାକୁ ଯୋଗ କରିବା:

```swift id="g1x7m9"
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

ଏହି କୋଡ୍‌ରେ, `a` ହେଉଛି `Int`, `b` ହେଉଛି `Double`। ଦୁହେଁର ଟାଇପ୍ ଭିନ୍ନ ଥିବାରୁ ସିଧାସଳଖ ଗଣନା କରିହେବ ନାହିଁ।

ଗଣନା ପୂର୍ବରୁ, ଏଥିରୁ ଗୋଟିଏକୁ ସମାନ ଟାଇପ୍‌ରେ convert କରିବାକୁ ପଡିବ:

```swift id="e8ex8w"
var result = Double(a) + b
```

ଏହି କୋଡ୍‌ର ଅର୍ଥ, `Int` ଟାଇପ୍‌ର `a` କୁ `Double` କୁ convert କରି, ପରେ `b` ସହ ଯୋଗ କରାଯାଉଛି, ଏବଂ ଫଳାଫଳକୁ `result` ରେ assign କରାଯାଉଛି।

ଧ୍ୟାନ ଦିଅନ୍ତୁ, type conversion ମୂଳ ଭେରିଏବଲ୍‌ର ଟାଇପ୍ କୁ ବଦଳାଏନାହିଁ। ଉଦାହରଣ, `Double(a)` `a` ର `Int` ଟାଇପ୍‌କୁ ବଦଳାଇଦିଏନି; ଏହା କେବଳ ଗଣନା ପାଇଁ ଏକ ନୂତନ `Double` value ତିଆରି କରେ।

ଅନ୍ୟ ଟାଇପ୍‌ଗୁଡିକୁ ମଧ୍ୟ ଏହି ପ୍ରକାରରେ convert କରାଯାଇପାରେ, ଅର୍ଥାତ୍ `TargetType + ()` ରୂପ ବ୍ୟବହାର କରି, ଯାହାକୁ convert କରିବାକୁ ହୁଏ ସେହି value କୁ ତା’ଭିତରେ ଦିଆଯାଏ। ଉଦାହରଣ:

```swift id="jlwmj1"
Int()、Double()、String()
```

ଉଦାହରଣ:

```swift id="b6o2vt"
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

ଧ୍ୟାନ ଦିଅନ୍ତୁ, ସମସ୍ତ ଟାଇପ୍ conversion ସଫଳ ହେବେନାହିଁ। ଉଦାହରଣ ସ୍ୱରୂପ, `Double → Int` କଲେ decimal ଅଂଶକୁ ସିଧାସଳଖ କାଟିଦିଆଯାଏ, rounding କରାଯାଏନାହିଁ।

## Type Alias

Swift ରେ, ଆଗରୁ ଥିବା ଟାଇପ୍‌କୁ ଏକ alias ଦିଆଯାଇପାରେ, ଯାହା କୋଡ୍‌ର ଅର୍ଥକୁ ଆଉ ସ୍ପଷ୍ଟ କରେ:

```swift id="vw0vy1"
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

ଏଠାରେ `UserID` ର ମୂଳ ସ୍ୱରୂପ ତଥାପି `Int` ହିଁ, ଟାଇପ୍ ବଦଳାଏନି, କିନ୍ତୁ ନାମ ଆଉ ଅର୍ଥପୂର୍ଣ୍ଣ ହୋଇଯାଏ।

କୋଡ୍‌ର ପରିମାଣ ବଡ଼ ଏବଂ ଟାଇପ୍ ଜଟିଳ ଥିବା ପ୍ରକଳ୍ପଗୁଡିକରେ, type alias କୋଡ୍‌କୁ ଆଉ ସହଜରେ ପଢ଼ିବାଯୋଗ୍ୟ କରେ।

## ଟାଇପ୍ ଉଦାହରଣ

ଏବେ ଏକ ସରଳ ଉଦାହରଣ ଦ୍ୱାରା ଦେଖିବା, ପ୍ରାକ୍ତିକ development ରେ type କିପରି କାମ କରେ।

### ଭେରିଏବଲ୍ ତିଆରି କରିବା

ପ୍ରଥମେ, ଆମେ ଗୋଟିଏ `age` ଭେରିଏବଲ୍ ତିଆରି କରୁ:

```swift id="ik2r3d"
var age = 20
```

SwiftUI ରେ ଏହି ଭେରିଏବଲ୍‌କୁ display ଏବଂ modify କରିବାକୁ ଥିବାରୁ, ଏହାକୁ `@State` ସହ ଘୋଷଣା କରିବାକୁ ପଡିବ:

```swift id="gkibg7"
@State private var age = 20
```

`private` ବିଷୟରେ ପୂର୍ବରୁ କଥାହୋଇଛି, ଏହାର ଅର୍ଥ ହେଉଛି ଏହି ଭେରିଏବଲ୍ କେବଳ ବର୍ତ୍ତମାନର view ଭିତରେ ବ୍ୟବହାର କରାଯାଇପାରିବ; ପରେ ଏହାକୁ ଆଉ ଗଭୀରରେ ଶିଖିବୁ।

### SwiftUI ରେ ଡାଟା ଦେଖାଇବା

SwiftUI ରେ `age` ଭେରିଏବଲ୍‌କୁ display କରିବା:

```swift id="nm6xpb"
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

ଏବେ ଭ୍ୟୁ ଏଭଳି ଦେଖାଇବ:

```swift id="go5uqz"
age: 20
```

### ଡାଟା ପରିବର୍ତ୍ତନ କରିବା

ତାପରେ, `age` କୁ ବଦଳାଇବା ପାଇଁ ଦୁଇଟି ବଟନ୍ ଯୋଡିବା:

```swift id="ivj8yb"
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### ଚାଲୁଥିବା ଫଳାଫଳ

`changeAge1` କୁ କ୍ଲିକ୍ କଲେ, `age` କୁ `18` assign ହେବ:

```swift id="x4w08i"
age = 18
```

ଯେହେତୁ `18` ହେଉଛି `Int` ଟାଇପ୍‌, ଏବଂ `age` ର ଟାଇପ୍‌ ସହ ମିଳିଯାଏ, ସେଥିପାଇଁ assignment ସଫଳ ହେବ।

`changeAge2` ରେ error ହେବ:

```swift id="le6t5u"
age = "18"
```

Error ସୂଚନା:

```swift id="fme9hm"
Cannot assign value of type 'String' to type 'Int'
```

ଏହାର କାରଣ `"18"` ହେଉଛି `String` ଟାଇପ୍ (ଷ୍ଟ୍ରିଙ୍ଗ୍‌କୁ `""` ଦ୍ୱାରା ଘେରିବାକୁ ପଡେ), କିନ୍ତୁ `age` ହେଉଛି `Int` ଟାଇପ୍‌, ତେଣୁ ଟାଇପ୍ ମିଳେନାହିଁ ଏବଂ ଏହାକୁ assign କରାଯାଇପାରେନାହିଁ।

### Error କାହିଁକି ହୁଏ?

ମୁଖ୍ୟ କାରଣ ହେଉଛି ଏହି ଲାଇନ୍:

```swift id="kj84b7"
@State private var age = 20   // Int
```

ଯଦିଓ ଏଠାରେ explicit type declaration ନାହିଁ, କିନ୍ତୁ initial value `20` ହେଉଛି `Int` ଟାଇପ୍‌, ସେହିପାଇଁ compiler `age` କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ `Int` ବୋଲି infer କରିଦିଏ।

ଏକଥର ଟାଇପ୍ ନିର୍ଦ୍ଧାରିତ ହେଲେ, ତା’ପରେ ଅନ୍ୟ ଟାଇପ୍‌ର value assign କରାଯାଇପାରେନାହିଁ।

ଏବଂ `changeAge2` ବଟନ୍ “runtime ରେ fail” କରୁନାହିଁ; ଏହା compile stage ରେ ହିଁ error ଦେଏ, ଯାହା ଫଳରେ କୋଡ୍ compile ହୋଇପାରେନାହିଁ।

ଏହା Swift strong type ର ଏକ ଲାଭ: କୋଡ୍ ଲେଖୁଥିବା ସମୟରେ ହିଁ type ସମସ୍ୟାକୁ ପୂର୍ବରୁ ଧରିପାରିବା।

### ସଠିକ୍ ଲେଖା ପ୍ରକ୍ରିୟା

ଭୁଲ କୋଡ୍‌କୁ କାଢ଼ିଦେଲେ:

```swift id="nkmj3v"
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

`changeAge1` ବଟନ୍‌କୁ କ୍ଲିକ୍ କଲେ, view ଅପଡେଟ୍ ହୋଇ ଏଭଳି ହେବ:

```swift id="alx7m4"
age: 18
```

### Explicit Type Declaration (ଇଚ୍ଛାଧୀନ)

ଘୋଷଣା ସମୟରେ explicit ଭାବେ ଟାଇପ୍ ମଧ୍ୟ ଦିଆଯାଇପାରେ:

```swift id="3g16u9"
@State private var age: Int = 20
```

ଏହି ଲେଖା ପ୍ରକ୍ରିୟା ଟାଇପ୍‌କୁ ଆଉ ସ୍ପଷ୍ଟ କରେ, କିନ୍ତୁ ସରଳ ପରିସ୍ଥିତିରେ ଏହା ଅବଶ୍ୟକ ନୁହେଁ।

## ସାରାଂଶ

ଏହି ପାଠରେ ପ୍ରାଧାନତଃ Swift ର type system ଏବଂ ପ୍ରାକ୍ତିକ development ରେ ଏହାର ଭୂମିକା ବିଷୟରେ ଆଲୋଚନା କରାଗଲା।

Swift ରେ, ପ୍ରତ୍ୟେକ value ର ଗୋଟିଏ ସ୍ପଷ୍ଟ ଟାଇପ୍ ରହେ। ଟାଇପ୍ ଡାଟାର ଅର୍ଥ ଏବଂ ସେହି ଡାଟା କୌଣସି operation ରେ ଭାଗନେଇପାରିବ କିନା ନିର୍ଦ୍ଧାରଣ କରେ।

Swift ହେଉଛି strong type language। ଏକଥର ଭେରିଏବଲ୍‌ର ଟାଇପ୍ ନିର୍ଦ୍ଧାରିତ ହେଲେ, ତା’ପରେ ଅନ୍ୟ ଟାଇପ୍‌ର value assign କରାଯାଇପାରେନାହିଁ। ଏହି ନିୟନ୍ତ୍ରଣ compile stage ରେ error କୁ ଧରି runtime ର ସମସ୍ୟାକୁ କମାଇ କୋଡ୍‌ର safety ବଢ଼ାଏ।

ଭେରିଏବଲ୍‌ର ଟାଇପ୍ initial value ଆଧାରରେ ସ୍ୱୟଂଚାଳିତ ଭାବେ infer ହୋଇପାରେ, କିମ୍ବା explicit ଭାବେ ଘୋଷଣା ମଧ୍ୟ କରାଯାଇପାରେ। କିଛି ପରିସ୍ଥିତିରେ (ଯଥା ଖାଲି array, type inference ଭୁଲ, custom type), compiler ସଠିକ୍ ଭାବେ ଟାଇପ୍ infer କରିପାରେନାହିଁ, ସେହିପାଇଁ explicit declaration ଅବଶ୍ୟକ ହୁଏ।

ଭିନ୍ନ ଟାଇପ୍‌ର ମଧ୍ୟରେ ସ୍ୱୟଂଚାଳିତ conversion ହୁଏନାହିଁ; `Int()`、`Double()`、`String()` ପରି ଉପାୟରେ explicit conversion କରିବାକୁ ପଡେ।

ଟାଇପ୍ alias କୁ ମଧ୍ୟ support କରେ, ବିଶେଷକରି ଜଟିଳ ପ୍ରକଳ୍ପରେ type alias କୋଡ୍‌ର readability କୁ ଉନ୍ନତ କରେ।

ଟାଇପ୍ କେବଳ ଡାଟାର label ନୁହେଁ, ଏହା ଗୋଟିଏ constraint mechanism ମଧ୍ୟ ଅଟେ, ଯାହା ଡାଟାର ବ୍ୟବହାରକୁ ସୁରକ୍ଷିତ, ସ୍ପଷ୍ଟ ଏବଂ ନିୟନ୍ତ୍ରିତ ରଖେ।

## ବିସ୍ତାରିତ ଜ୍ଞାନ - Optional Type

Type conversion କରିବା ବେଳେ, କିଛି operation ବିଫଳ ହୋଇପାରେ।

ଉଦାହରଣ ସ୍ୱରୂପ, `String` କୁ `Double` କୁ convert କରିବା:

```swift id="1gvp24"
let input = "3.14"
let pi = Double(input)  // Double?
```

ଏଠାରେ `Double(input)` ର return value `Double` ନୁହେଁ, ବରଂ:

```swift id="9er2k6"
Double?
```

ଏହାକୁ Optional type କୁହାଯାଏ।

### Optional କାହିଁକି return ହୁଏ?

କାରଣ string ଭିତରେ କ’ଣ ଅଛି ତାହା ନିଶ୍ଚିତ ନୁହେଁ। `"3.14"` କୁ `Double` କୁ convert କରିହେବ, କିନ୍ତୁ `"Hello"` କୁ `Double` କୁ convert କରିହେବ ନାହିଁ।

ଅର୍ଥାତ୍, ଏହି operation ସଫଳ ହେବାର ସମ୍ଭାବନା ମଧ୍ୟ ଅଛି, ବିଫଳ ହେବାର ସମ୍ଭାବନା ମଧ୍ୟ ଅଛି।

ସେହିପାଇଁ, Swift ଏହି ଅନିଶ୍ଚିତତାକୁ ପ୍ରଦର୍ଶନ କରିବା ପାଇଁ Optional type ବ୍ୟବହାର କରେ।

### Optional Type କ’ଣ?

Optional type ର ଅର୍ଥ: ଗୋଟିଏ value ଥାଇପାରେ, କିମ୍ବା ନଥାଇପାରେ।

ଉଦାହରଣ:

```swift id="pzv8bi"
Double?
```

ଏହି ଟାଇପ୍‌ର ଅର୍ଥ, value ଥାଇଲେ print କଲେ `Optional(...)` ଭାବେ ଦେଖାଯିବ, ନଥାଇଲେ `nil` return ହେବ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ, `nil` ର ଅର୍ଥ “କୌଣସି value ନାହିଁ”, 0 କିମ୍ବା ଖାଲି ଷ୍ଟ୍ରିଙ୍ଗ୍ ନୁହେଁ।

### ଉଦାହରଣ

```swift id="fkqkzj"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```swift id="sm0hso"
pi:Optional(3.14)
```

ଏହାର ଅର୍ଥ, ଷ୍ଟ୍ରିଙ୍ଗ୍‌ଟି ସଫଳ ଭାବେ `Double` କୁ convert ହୋଇ `3.14` ମିଳିଛି, କିନ୍ତୁ ଟାଇପ୍ `Double?` ଥିବାରୁ ଏହା `Optional` ଭିତରେ wrap ହୋଇଛି।

ଯଦି conversion ବିଫଳ ହୋଇଯାଏ:

```swift id="c0tenj"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```swift id="gbbt6f"
pi: nil
```

କାରଣ `"Hello"` କୁ `Double` ଟାଇପ୍‌କୁ convert କରିହେବ ନାହିଁ, ତେଣୁ conversion ବିଫଳ ହୋଇ `nil` return ହେଉଛି।

### Optional(...) କ’ଣ?

ଯେତେବେଳେ ଆମେ ସିଧାସଳଖ Optional type କୁ print କରୁ:

```swift id="v7w4pk"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift ତାହାର “debug description” ଦେଖାଏ:

```swift id="flzchi"
Optional(3.14)
```

ଏହା actual data ର ଅଂଶ ନୁହେଁ; ଏହା କେବଳ ଏହାକୁ ସୂଚାଏ ଯେ ବର୍ତ୍ତମାନ value ଗୋଟିଏ “Optional type”, ଏବଂ ତା’ଭିତରେ ଗୋଟିଏ ମୂଲ୍ୟ ଅଛି।

### Optional Type କୁ Unwrap କରିବା

ପ୍ରାକ୍ତିକ development ରେ, ଆମକୁ ସାଧାରଣତଃ Optional type ଠାରୁ ପ୍ରକୃତ value କୁ କାଢ଼ିବାକୁ ପଡେ। ଏହି ପ୍ରକ୍ରିୟାକୁ Unwrapping କୁହାଯାଏ।

ଏକ ସାଧାରଣ ଉପାୟ ହେଉଛି `??` ବ୍ୟବହାର କରି default value ଦେବା:

```swift id="r88yrd"
??
```

ଏହାକୁ Nil-Coalescing Operator କୁହାଯାଏ।

ଉଦାହରଣ:

```swift id="nlw9yz"
name ?? "FangJunyu"
```

ଏହି କୋଡ୍‌ର ଅର୍ଥ, ଯଦି `name` ର value ଅଛି, ତେବେ ସେହି value return କର; ଯଦି `nil` ଅଛି, ତେବେ default value `"FangJunyu"` ବ୍ୟବହାର କର।

ଧ୍ୟାନ ଦିଅନ୍ତୁ, default value ର ଟାଇପ୍ Optional type ସହ ସମାନ ହେବା ଦରକାର।

### `??` ବ୍ୟବହାର କରି default value ଦେବା

```swift id="b6bg6u"
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```swift id="66wm6e"
pi: 30
```

`input` କୁ `Double` କୁ convert କଲେ, conversion ସଫଳ ହୋଇ value କୁ output କରିବ। ଯଦି conversion ବିଫଳ ହୋଇଯାଏ, ତେବେ `??` ଦ୍ୱାରା ଦିଆଯାଇଥିବା default value କୁ output କରିବ।

ଯଦି conversion ବିଫଳ ହୋଇଯାଏ:

```swift id="btzcyg"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```swift id="5mlvem"
pi: 10
```

ଏଠାରେ, `input` କୁ `Double` କୁ convert କଲାବେଳେ ବିଫଳ ହୋଇ `nil` ଫେରାଇଛି, ଏବଂ `??` `nil` ପାଇଁ ଗୋଟିଏ default value ଦେଇଛି।

Optional type ବ୍ୟବହୃତ ହୁଏ “ହୋଇପାରେ value ଅଛି, ହୋଇପାରେ ନାହିଁ” ପରି ପରିସ୍ଥିତିକୁ ପ୍ରଦର୍ଶନ କରିବା ପାଇଁ।

Type conversion ପରି ବିଫଳ ହେଇପାରୁଥିବା operation ଗୁଡିକରେ, Swift ସୁରକ୍ଷା ପାଇଁ Optional type return କରେ।

ଯେତେବେଳେ ଆମକୁ ଏଥିରୁ value ବ୍ୟବହାର କରିବାକୁ ଥାଏ, ଆମେ `??` ବ୍ୟବହାର କରି default value ଦେଇପାରିବା, ଯାହା ଫଳରେ `nil` ଆସିଥିଲେ ମଧ୍ୟ ଗୋଟିଏ ଯୁକ୍ତିସଙ୍ଗତ ଫଳାଫଳ ମିଳିଯାଏ।
