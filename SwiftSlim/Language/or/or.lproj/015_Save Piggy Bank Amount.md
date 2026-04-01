# ସଞ୍ଚୟ କୁମ୍ଭର ରାଶି ସେଭ୍ କରିବା

ପୂର୍ବବର୍ତ୍ତୀ ପାଠରେ, ଆମେ ଗୋଟିଏ ସରଳ “ସଞ୍ଚୟ କୁମ୍ଭ” ତିଆରି କରିଥିଲୁ। ଏହି ପାଠରେ, ଆମେ ଶିଖିବୁ କିପରି “ସଞ୍ଚୟ କୁମ୍ଭ” ର ରାଶିକୁ ସ୍ଥାୟୀ ଭାବରେ ସେଭ୍ କରିବାକୁ ହୁଏ।

ଏହି ପାଠରେ ମୁଖ୍ୟତଃ UserDefaults ଏବଂ @AppStorage property wrapper ବିଷୟରେ ଶିଖାଯିବ, ସହିତେ onAppear ର କାମ ଓ optional type (nil) ର ବ୍ୟବହାର ମଧ୍ୟ ଆଲୋଚନା କରାଯିବ।

ଧ୍ୟାନ ଦେବାକୁ ହେବ, ଏହି ପାଠରେ ପୂର୍ବର “ସଞ୍ଚୟ କୁମ୍ଭ” କୋଡ୍‌କୁ ଆଧାର କରି ଆଗକୁ ବଢ଼ାଯିବ।

## ସ୍ଥାୟୀ ସେଭ୍ ସମସ୍ୟା

ଏବେ, “ସଞ୍ଚୟ କୁମ୍ଭ” ର interface ବହୁତ ସରଳ ଏବଂ ବ୍ୟବହାର କରିବାକୁ ସୁବିଧାଜନକ।

![Piggy Bank](../../Resource/014_view.png)

କିନ୍ତୁ, ଗୋଟିଏ ସ୍ପଷ୍ଟ ସମସ୍ୟା ଅଛି: ପ୍ରତ୍ୟେକଥର view refresh କଲେ କିମ୍ବା app ବନ୍ଦ କଲେ, “ସଞ୍ଚୟ କୁମ୍ଭ” ର ମୋଟ ରାଶି ପୁଣି 0 ହୋଇଯାଏ, ପୂର୍ବରୁ ସଞ୍ଚୟ ହୋଇଥିବା ରାଶି ମଧ୍ୟ ସବୁ ହରାଇଯାଏ।

ଏଥିର ଅର୍ଥ ହେଉଛି data ଆସଲେ ସେଭ୍ ହୋଇନାହିଁ। ଅନ୍ୟ ଭାଷାରେ କହିଲେ, ବର୍ତ୍ତମାନର “ସଞ୍ଚୟ କୁମ୍ଭ” କେବଳ ଅସ୍ଥାୟୀ data କୁ ସଞ୍ଚୟ କରିପାରୁଛି।

### କାହିଁକି ସ୍ଥାୟୀ ସେଭ୍ ହେଉନାହିଁ?

ଏହାର କାରଣ ହେଉଛି ଆମେ @State ଦ୍ୱାରା variable ଘୋଷଣା କରିଛୁ:

```swift
@State private var amount = 0
```

@State ଦ୍ୱାରା ଘୋଷିତ variable ର lifecycle ସମ୍ପୂର୍ଣ୍ଣ ଭାବେ view ଉପରେ ନିର୍ଭର କରେ।

ଯେତେବେଳେ view ସୃଷ୍ଟି ହୁଏ, amount କୁ 0 ଭାବେ initialize କରାଯାଏ; ଯେତେବେଳେ view ନଷ୍ଟ ହୁଏ, amount ମଧ୍ୟ ନଷ୍ଟ ହୋଇଯାଏ।

ଏଠାରେ amount ର data କେବଳ memory ଭିତରେ ଅଛି, device ରେ save ହୋଇନାହିଁ।

ଯଦି ଆମେ ଚାହୁଁନାହୁଁ ଯେ amount ର lifecycle view ସହିତ ବାନ୍ଧା ରହୁ, ତେବେ data persistence କରିବାକୁ ପଡ଼ିବ। ଅର୍ଥାତ୍, data କୁ device ରେ save କରିବାକୁ ପଡ଼ିବ।

### “ଡାଟା ପର୍ସିସ୍ଟେନ୍ସ” କ’ଣ

ଡାଟା ପର୍ସିସ୍ଟେନ୍ସ କୁ ଏଭଳି ବୁଝିପାରିବା: data କୁ “ଅସ୍ଥାୟୀ memory” ଠାରୁ “device storage” କୁ save କରିବା।

ଯେତେବେଳେ view ବନ୍ଦ ହୁଏ, କିମ୍ବା app ବନ୍ଦ ହୁଏ, data ହରାଇ ଯିବ ନାହିଁ।

Swift development ରେ, ସରଳ data persistence ପାଇଁ UserDefaults ବ୍ୟବହାର କରାଯାଏ; ଅଧିକ ଜଟିଳ data ପାଇଁ SwiftData କିମ୍ବା CoreData ବ୍ୟବହାର କରିବାକୁ ପଡ଼େ।

ଏହି ପାଠରେ, ଆମେ ପ୍ରଥମେ ସବୁଠାରୁ ସରଳ UserDefaults କୁ ଶିଖିବୁ।

## UserDefaults

UserDefaults ହେଉଛି ହାଲୁକା key-value data ସେଭ୍ କରିବା ପାଇଁ ବ୍ୟବହୃତ, ଏବଂ ସାଧାରଣତଃ String, Int, Double, Bool ପରି ମୌଳିକ ପ୍ରକାରର data ସଞ୍ଚୟ ପାଇଁ ବ୍ୟବହାର କରାଯାଏ।

### ଡାଟା ସେଭ୍ କରିବା

UserDefaults set method ବ୍ୟବହାର କରି data ସେଭ୍ କରେ:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults ର ପ୍ରଥମ parameter ହେଉଛି ସେଭ୍ କରିବାକୁ ଥିବା data, ଯେଉଁଠାରେ String, Int ପରି ପ୍ରକାରର data ପ୍ରବେଶ କରାଯାଏ।

ଦ୍ୱିତୀୟ parameter forKey ଗୋଟିଏ variable ନାମ ପରି କାମ କରେ, ଯାହା UserDefaults ରେ ସେଭ୍ ହୋଇଥିବା data କୁ ଚିହ୍ନଟ କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

### ଡାଟା ପଢ଼ିବା

UserDefaults ସମ୍ପର୍କିତ method ବ୍ୟବହାର କରି data ପଢ଼େ:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

ପଢ଼ୁଥିବାବେଳେ ସଠିକ୍ ପ୍ରକାରର method ବ୍ୟବହାର କରିବା ଆବଶ୍ୟକ, ନହେଲେ error ହୋଇପାରେ କିମ୍ବା data ଭୁଲ ମିଳିପାରେ।

### UserDefaults ବ୍ୟବହାରରେ ଧ୍ୟାନ ଦେବା ଯୋଗ୍ୟ କଥା

#### 1. Optional type ଫେରାଇବା

UserDefaults ରୁ data ପଢ଼ିବାବେଳେ, କିଛି method optional type (Optional) ଫେରାଇଥାଏ।

ଉଦାହରଣ:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

ଏଠାରେ name ର ପ୍ରକାର ହେଉଛି:

```swift
String?
```

ଏହାର ଅର୍ଥ ହେଉଛି ଏଠାରେ value ଥାଇପାରେ, କିମ୍ବା ନଥାଇପାରେ।

**କାହିଁକି optional type ଫେରେ?**

କାରଣ UserDefaults ଭିତରେ ଥିବା କିଛି Key ପାଇଁ ଅବଶ୍ୟই ମେଳ ଥିବା data ଥାଇବା ନିଶ୍ଚିତ ନୁହେଁ।

ଉଦାହରଣ:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

ଯଦି ପୂର୍ବରୁ "City" ନାମର Key ପାଇଁ କେବେ data save ହୋଇନଥାଏ, ତେବେ ଫଳ ହେବ:

```swift
nil
```

ଏଠାରେ ଜୋର ଦେଇ କହିବା ଦରକାର, nil ର ଅର୍ଥ data ନଥିବା, ଖାଲି string ନୁହେଁ।

“Type System” ପାଠରେ, ଏପରି ସମସ୍ୟା ଆମେ ପୂର୍ବରୁ ଦେଖିଥିଲୁ। ଯେତେବେଳେ data type conversion ବିଫଳ ହୁଏ, ସେତେବେଳେ optional type ଫେରେ।

ଏପରି ସମୟରେ, ଆମକୁ ?? ବ୍ୟବହାର କରି default value ଦେଇ unwrapping କରିବାକୁ ପଡ଼େ:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

ଯଦି UserDefaults ରୁ data ମିଳେ, ତେବେ ସେହି value ବ୍ୟବହାର କରାଯିବ; ଯଦି data ମିଳିବ ନାହିଁ (nil), ତେବେ default value ବ୍ୟବହୃତ ହେବ।

#### 2. Non-optional type ଫେରାଇବା

UserDefaults ଯେତେବେଳେ Int, Double, Bool ପରି type ପଢ଼େ, ସେତେବେଳେ non-optional type ଫେରାଇଥାଏ।

ଉଦାହରଣ:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

ଯଦିଓ ଏହି Key ଗୁଡ଼ିକ ପାଇଁ କେବେ data save ହୋଇନଥାଏ, ତଥାପି ଫଳ nil ହେବ ନାହିଁ।

ବରଂ, ଏଗୁଡ଼ିକ default value ଫେରାଇବ:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. ଡାଟା ପରିମାଣ ସୀମା

UserDefaults କେବଳ ଅଳ୍ପ ପରିମାଣର data ସେଭ୍ କରିବାକୁ ଉପଯୁକ୍ତ, ଯେପରିକି app configuration, ସରଳ state ଇତ୍ୟାଦି।

ବାସ୍ତବ development ରେ, ବହୁତ data କିମ୍ବା ବହୁତ ଘନଘନ ଭାବେ read/write କରାଯାଉଥିବା data ସେଭ୍ ପାଇଁ ଏହା ଉପଯୁକ୍ତ ନୁହେଁ।

## “ସଞ୍ଚୟ କୁମ୍ଭ” ର ରାଶି ସେଭ୍ କରିବା

ଏବେ, ଆମେ UserDefaults ବ୍ୟବହାର କରି “ସଞ୍ଚୟ କୁମ୍ଭ” ର ମୋଟ ରାଶି ସେଭ୍ କରିବାର code logic ତିଆରି କରିପାରିବା।

ଯେତେବେଳେ user button କୁ click କରିବେ, ଇନପୁଟ୍ ରାଶି ମୋଟ ରାଶି ସହିତ ଯୋଗ ହେବ ଏବଂ ମୋଟ ରାଶି UserDefaults ରେ ସେଭ୍ ହେବ।

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

ଏବେ, ଆମେ data write କରିବାର logic ସମ୍ପୂର୍ଣ୍ଣ କରିଦେଲୁ।

## ଡାଟା ପର୍ସିସ୍ଟେନ୍ସ ଲଜିକ୍ ବ୍ୟାଖ୍ୟା

ଯଦିଓ ଆମେ data persistence ର write logic ସମାପ୍ତ କରିଛୁ, ତଥାପି ବାସ୍ତବରେ app ଚଳାଇଲେ ଦେଖିବୁ: ପ୍ରତ୍ୟେକଥର view refresh କିମ୍ବା app ପୁଣି ଖୋଲିଲେ, amount variable ପୁଣି 0 ହେଉଛି।

ଏହାର କାରଣ:

```swift
@State private var amount = 0
```

SwiftUI ରେ, @State variable view ସୃଷ୍ଟି ସମୟରେ ପୁଣିଥରେ initialize ହୋଇଯାଏ।

ଯଦିଓ UserDefaults ମଧ୍ୟରେ amount ର value ସେଭ୍ ଅଛି, କିନ୍ତୁ view ପୁଣି load ହେବାବେଳେ amount ପୁଣି 0 କୁ reset ହୋଇଯାଏ।

ଏହା ଦେଖାଏ ଯେ ବର୍ତ୍ତମାନ କେବଳ data କୁ UserDefaults ରେ save କରାଯାଉଛି, କିନ୍ତୁ view ମଧ୍ୟରେ data restore କରାଯାଉନାହିଁ।

ସେଥିପାଇଁ, view load ହେବାବେଳେ ଆମକୁ UserDefaults ଠାରୁ ହାତେ data ପଢ଼ି amount କୁ ପୁଣି assign କରିବାକୁ ପଡ଼ିବ, ତାହାହେଲେମାତ୍ର ସମ୍ପୂର୍ଣ୍ଣ data persistence logic କାମ କରିବ।

### ଲଜିକ୍ ଉପମା

ଏହି ପ୍ରକ୍ରିୟାକୁ “ଶ୍ରେଣୀକକ୍ଷର କଳାପଟ” ସହିତ ତୁଳନା କରି ବୁଝିପାରିବା:

ପାଠ ଚାଲିଥିବାବେଳେ, ଶିକ୍ଷକ କଳାପଟରେ ବିଷୟବସ୍ତୁ ଲେଖନ୍ତି। ଏହି content ବର୍ତ୍ତମାନ view ର state (@State) ପରି ଅଟେ।

ପାଠ ଶେଷ ହେଲେ, କଳାପଟ ପୋଛିଦିଆଯାଏ ଏବଂ ପରବର୍ତ୍ତୀ ପାଠ ପାଇଁ ପ୍ରସ୍ତୁତ କରାଯାଏ। ଏହା view ନଷ୍ଟ ହେବା ଓ @State ର data ସଫା ହେବା ସମାନ।

ପାଠ୍ୟବସ୍ତୁ ହରାଇଯିବାକୁ ରୋକିବା ପାଇଁ, ଶିକ୍ଷକ ପୂର୍ବରୁ content କୁ courseware ରେ save କରନ୍ତି। ସେହି courseware, UserDefaults ରେ ସେଭ୍ ହୋଇଥିବା data ସମାନ।

ପରବର୍ତ୍ତୀଥର ପାଠ ଆରମ୍ଭ ହେବାବେଳେ, କଳାପଟ ଆରମ୍ଭରେ ଖାଲି ଥାଏ (@State initialize), ଶିକ୍ଷକଙ୍କୁ courseware ର content ଅନୁସାରେ ପୁଣି ସେହି ବିଷୟବସ୍ତୁ କଳାପଟରେ ଲେଖିବାକୁ ପଡ଼େ (UserDefaults ପଢ଼ିବା)।

ବୁଝିବାକୁ ପଡ଼ିବ, କଳାପଟ ପୂର୍ବରୁ ଥିବା content କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ restore କରେ ନାହିଁ; “courseware ପଢ଼ିବା” (UserDefaults ରୁ ପଢ଼ିବା) ଦ୍ୱାରା ମାନୁଆଲ୍ ଭାବେ ପୁଣି ଲେଖିବାକୁ ପଡ଼େ।

## onAppear ବ୍ୟବହାର କରି data ପଢ଼ିବା

view ଦେଖାଯିବାବେଳେ, ଆମକୁ ହାତେ UserDefaults ର value ପଢ଼ି @State ର amount variable କୁ assign କରିବାକୁ ପଡ଼ିବ, ଯାହାଦ୍ୱାରା ପ୍ରକୃତ data persistence ସମ୍ଭବ ହେବ।

SwiftUI ରେ, view ଦେଖାଯିବାବେଳେ initialization logic ଚଲାଇବାକୁ onAppear ବ୍ୟବହାର କରାଯାଏ:

```swift
.onAppear {}
```

UserDefaults ରୁ ପଢ଼ିବା code କୁ onAppear ମଧ୍ୟରେ ରଖିବା:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

ଯେତେବେଳେ view ସୃଷ୍ଟି ହୁଏ, amount କୁ 0 ଭାବେ initialize କରାଯାଏ; ଯେତେବେଳେ view ଦେଖାଯାଏ, onAppear trigger ହୁଏ, ଏବଂ UserDefaults ରୁ data ପଢ଼ି amount କୁ assign କରାଯାଏ। ଏଭଳି ଭାବରେ, view ପୂର୍ବରୁ ସେଭ୍ ହୋଇଥିବା ମୋଟ ରାଶିକୁ ଦେଖାଇପାରେ।

ଏବେ, ସମ୍ପୂର୍ଣ୍ଣ “ସଞ୍ଚୟ କୁମ୍ଭ” ର data persistence logic ପୂରା ହେଲା।

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage ପ୍ରୋପର୍ଟି ର୍ୟାପର୍

SwiftUI ଆମକୁ @AppStorage property wrapper ଦେଇଥାଏ, ଯାହା UserDefaults ର save logic କୁ ସରଳ କରେ।

```
@AppStorage("amount") private var amount = 0
```

@AppStorage ହେଉଛି UserDefaults ର wrapper, ଏବଂ "amount" ହେଉଛି UserDefaults ର Key ସହିତ ମେଳ ଥିବା value।

ଯେତେବେଳେ view ସୃଷ୍ଟି ହୁଏ, ଏହା UserDefaults ରୁ data ପଢ଼େ; ଯେତେବେଳେ variable ର value ବଦଳେ, ସେତେବେଳେ ସ୍ୱୟଂଚାଳିତ ଭାବେ UserDefaults ରେ write ହୋଇଯାଏ।

ଏହା SwiftUI ର state update mechanism କୁ support କରେ, ଏବଂ @State ପରି value ବଦଳିଲେ SwiftUI view କୁ refresh କରେ।

ଅର୍ଥାତ୍, @AppStorage ଆପେଆପେ data read ଓ save logic କୁ ସମ୍ଭାଳିଦେଇପାରେ, ହାତେ UserDefaults call କରିବା କିମ୍ବା onAppear ଦ୍ୱାରା data ପଢ଼ିବାର ଆବଶ୍ୟକତା ରହେନାହିଁ।

ସେହିପରି, ଆମେ କୋଡ୍‌ରେ UserDefaults ବଦଳରେ @AppStorage ବ୍ୟବହାର କରିପାରିବା:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## ସାରାଂଶ

ଏହି ପାଠରେ ମୁଖ୍ୟତଃ ନିମ୍ନଲିଖିତ ଜ୍ଞାନବିନ୍ଦୁଗୁଡ଼ିକ ଶିଖାଗଲା:

ପ୍ରଥମେ, UserDefaults ହେଉଛି ହାଲୁକା data ସେଭ୍ ପାଇଁ ବ୍ୟବହୃତ, ଏବଂ ଆମେ UserDefaults ବ୍ୟବହାର କରି ମୋଟ ରାଶିକୁ device ରେ save କରିଛୁ। UserDefaults read ଓ write method ଦେଇଥାଏ, ସହିତେ optional type ପରି ସମସ୍ୟାମାନଙ୍କୁ ମଧ୍ୟ ସମ୍ଭାଳିବାକୁ ପଡ଼େ।

ଦ୍ୱିତୀୟତଃ, @State variable କେବଳ view ର temporary state ପରିଚାଳନା ପାଇଁ ଥାଏ, ଏବଂ ଏହାର lifecycle view ସହିତ ସମାନ। view ପୁଣି ସୃଷ୍ଟି ହେଲେ, @State ପୁଣି initialize ହୋଇଯାଏ।

UserDefaults ର data restore କରିବାବେଳେ, ଆମେ onAppear ବ୍ୟବହାର କରି view ଦେଖାଯିବା ସମୟରେ UserDefaults ରୁ data ପଢ଼ି data restore କରିବାକୁ ଶିଖିଲୁ।

ଶେଷରେ, @AppStorage ବ୍ୟବହାର କରି UserDefaults କୁ ପରିବର୍ତ୍ତନ କରାଗଲା, ଯାହା view load ହେବାବେଳେ data କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ପଢ଼ିନେଉଛି ଏବଂ data ବଦଳିଲେ ସ୍ୱୟଂଚାଳିତ ଭାବେ write କରୁଛି, ଏହାଦ୍ୱାରା ହାତେ UserDefaults ଏବଂ onAppear logic ଲେଖିବାର ଆବଶ୍ୟକତା ହଟିଯାଉଛି।

ଏହି ଜ୍ଞାନ ଦ୍ୱାରା, ଆମେ ଗୋଟିଏ ମୌଳିକ App data storage function ତିଆରି କରିପାରିବା, ଯାହା data କୁ ସ୍ଥାୟୀ ଭାବରେ save କରିପାରିବ।

## ପାଠଶେଷ ଅଭ୍ୟାସ

ଏବେ, “ସଞ୍ଚୟ କୁମ୍ଭ” ରେ ରାଶି save ହେଉଛି, କିନ୍ତୁ କାର୍ଯ୍ୟ ଏପର୍ଯ୍ୟନ୍ତ ପୂରା ହୋଇନାହିଁ।

1. ଯଦି user ରାଶି ବାହାର କରିବାକୁ ଚାହେଁ, ତାହା ପାଇଁ ଯୋଗ୍ୟ logic design କରିବାକୁ ପଡ଼ିବ।
2. ଯଦି user ମୋଟ ରାଶିକୁ ଖାଲି କରିବାକୁ ଚାହେଁ, reset logic ମଧ୍ୟ implement କରିବାକୁ ହେବ।
3. ଯଦି “ସଞ୍ଚୟ କୁମ୍ଭ” ପାଇଁ ଗୋଟିଏ ନାମ ଯୋଡ଼ିବାକୁ ଚାହୁଁଛୁ, ତେବେ String type data save କରିବାକୁ ମଧ୍ୟ ଆଣିବାକୁ ପଡ଼ିବ।

ବର୍ତ୍ତମାନ ଥିବା ଆଧାର ଉପରେ ଏହି ସବୁ functionality କୁ ଆହୁରି ସମ୍ପୂର୍ଣ୍ଣ କରାଯାଇପାରେ, ଯାହାରେ “ସଞ୍ଚୟ କୁମ୍ଭ” ଅଧିକ ସମ୍ପୂର୍ଣ୍ଣ ହେବ।

## ଅତିରିକ୍ତ ଜ୍ଞାନ - input box ର default value ସମସ୍ୟା

ଏବେ, ଆମେ input box ର interaction କୁ ଆହୁରି optimize କରିପାରିବା, ଯାହାରେ input ଅଧିକ ସୁବିଧାଜନକ ହେବ।

![textfield](../../Resource/015_view.png)

ବର୍ତ୍ତମାନ implementation ରେ, input box ର default value ହେଉଛି 0। User ପ୍ରତ୍ୟେକଥର ରାଶି ଇନପୁଟ୍ କରିବାବେଳେ ପ୍ରଥମେ 0 କୁ delete କରିବାକୁ ପଡ଼ୁଛି, ତା ପରେ ନୂତନ ସଂଖ୍ୟା ଲେଖିବାକୁ ହେଉଛି। ଏହି interaction experience ଯୁକ୍ତିସଂଗତ ନୁହେଁ।

ଆମେ ଚାହିଁବୁ input box ର ଆରମ୍ଭିକ ମୂଲ୍ୟ ଖାଲି ରହୁ, 0 ନୁହେଁ।

ଏହାର କାରଣ ହେଉଛି TextField ଏବଂ number ମଧ୍ୟରେ two-way binding ଅଛି:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

ଯେତେବେଳେ number କୁ 0 ଭାବେ initialize କରାଯାଏ, input box ମଧ୍ୟ 0 ଦେଖାଏ।

ସେଥିପାଇଁ, ଆମକୁ number କୁ ଖାଲି ମୂଲ୍ୟରେ ପରିବର୍ତ୍ତନ କରିବାକୁ ହେବ, ଅର୍ଥାତ୍ nil।

```swift
@State private var number = nil
```

ଏବେ error ଦେଖାଯିବ:

```
Generic parameter 'Value' could not be inferred
```

ଏହିଟା ହେଉଛି “Type System” ପାଠରେ କହିଥିବା ସେହି ପରିସ୍ଥିତି: ଯେତେବେଳେ variable ର type compiler ସ୍ୱୟଂଚାଳିତ ଭାବେ ଅନୁମାନ କରିପାରେ ନାହିଁ, ସେତେବେଳେ explicit type declaration ଦରକାର।

କାରଣ number କୁ nil କରାଯାଇଛି, ଏବଂ nil ନିଜେ କୌଣସି type ସୂଚନା ଦିଏ ନାହିଁ, compiler ବୁଝିପାରେ ନାହିଁ ଏହା String, Int କିମ୍ବା ଅନ୍ୟ type କଣ, ତେଣୁ error ହୁଏ।

ସେହିପାଇଁ, ଆମକୁ number ପାଇଁ explicit type declare କରିବାକୁ ପଡ଼ିବ:

```swift
@State private var number:Int? = nil
```

ଏଠାରେ Int? ର ଅର୍ଥ optional type (Optional), ଅର୍ଥାତ୍ number ର value Int ହୋଇପାରେ, କିମ୍ବା nil ମଧ୍ୟ ହୋଇପାରେ।

ଏଭଳି କରି, initialize ସମୟରେ ଏହାକୁ nil କରାଯାଇଲେ, input box ରେ 0 ବଦଳରେ ଖାଲି ଦେଖାଯିବ।

### Optional type କୁ unwrap କରିବା

ଯେତେବେଳେ ଆମେ number କୁ optional type କରିଦେବୁ, ପୁରୁଣା calculation code error ଦେଖାଇବ:

```swift
amount += number
```

ସୂଚନା:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

ଏହାର କାରଣ ହେଉଛି, number ଏବେ nil ହୋଇପାରେ। ଯଦି ଏହାକୁ ସିଧା calculation ରେ ବ୍ୟବହାର କରିବା, ତେବେ ଏହା ଏପରି ହୋଇଯିବ:

```swift
amount += nil
```

ସ୍ପଷ୍ଟ ଭାବରେ, nil କୁ amount ସହିତ ଯୋଡ଼ିହେବ ନାହିଁ। ଏହା ବୈଧ operation ନୁହେଁ।

ସେହିପାଇଁ, optional type କୁ calculation ରେ ନେବା ପୂର୍ବରୁ ପ୍ରଥମେ unwrap କରିବାକୁ ପଡ଼େ।

ଏଠାରେ, default value ଦେବା ପାଇଁ ?? ବ୍ୟବହାର କରିପାରିବା:

```swift
amount += number ?? 0
```

ଯେତେବେଳେ number ର value nil ହୁଏ, ସେତେବେଳେ default value 0 ବ୍ୟବହାର ହେବ; ଯେତେବେଳେ number ର value ଥାଏ, ସେତେବେଳେ user ଇନପୁଟ୍ କରିଥିବା ପ୍ରକୃତ data ବ୍ୟବହୃତ ହେବ।

ଏହିପରି ଭାବେ ଗଣନାର ସଠିକତା ରହିବ, ଏବଂ input box ର default ଖାଲି ଦେଖାଯିବାର effect ମଧ୍ୟ ମିଳିବ। ଏହାରୁ user କୁ ଆଉ 0 delete କରିବାକୁ ହେବ ନାହିଁ।

## ବିସ୍ତାରିତ କୋଡ୍

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
