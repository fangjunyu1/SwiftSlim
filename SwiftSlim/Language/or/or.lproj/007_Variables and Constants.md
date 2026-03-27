# ଚଳକ ଏବଂ ଧ୍ରୁବକ

ଏହି ପାଠରେ ଆମେ ପ୍ରଧାନତଃ Swift ରେ ଥିବା ଚଳକ（variable）ଏବଂ ଧ୍ରୁବକ（constant）ଶିଖିବୁ, ସେଥିସହ ଅନେକ ସାଧାରଣ data type ଏବଂ ମୌଳିକ operator ବିଷୟରେ ମଧ୍ୟ ପରିଚିତ ହେବୁ।

ଏହି ବିଷୟଗୁଡ଼ିକ programming ର ସବୁଠାରୁ ମୌଳିକ ଜ୍ଞାନ, ଏବଂ ପରେ SwiftUI ଶିଖିବା ପାଇଁ ମଧ୍ୟ ଏଗୁଡ଼ିକ ଅତ୍ୟନ୍ତ ଦରକାରୀ ଭିତିସ୍ଥମ୍ଭ।

## ଜୀବନରେ ଚଳକ ଏବଂ ଧ୍ରୁବକ

ଆମେ ଦୈନନ୍ଦିନ ଜୀବନର କିଛି ଜିନିଷ ଦ୍ୱାରା ଚଳକ ଏବଂ ଧ୍ରୁବକକୁ ବୁଝିପାରୁ।

ଜୀବନରେ ଚଳକର ଉଦାହରଣ:

- ଟିଭିରେ ପ୍ରତ୍ୟେକ କାର୍ଯ୍ୟକ୍ରମର content ଅଲଗା ଥାଏ
- ପ୍ରତିଦିନର ଆବହାଓା ଏକରକମ ନୁହେଁ
- ଘଣ୍ଟାର କାଠି ପ୍ରତି ସେକେଣ୍ଡରେ ପରିବର୍ତ୍ତନ ହୁଏ

ଏହି ଜିନିଷଗୁଡ଼ିକର ସାଧାରଣ ବିଶେଷତା ହେଉଛି: ସେମାନେ ପରିବର୍ତ୍ତନଶୀଳ।

ଯଦି ଟିଭି ସବୁବେଳେ ଗୋଟିଏ ମାତ୍ର ଚିତ୍ର ଦେଖାଏ, ଆବହାଓା ସବୁବେଳେ ସ୍ପଷ୍ଟ ରହେ, ଘଣ୍ଟାର କାଠି କେବେ ହଳେ ନାହିଁ, ତେବେ ସେହି ଜିନିଷଗୁଡ଼ିକୁ ଧ୍ରୁବକ ବୋଲି ବୁଝାଯାଏ।

ଗୋଟିଏ ପରିବର୍ତ୍ତନ ହୋଇପାରେ, ଅନ୍ୟଟି ପରିବର୍ତ୍ତନ ହୋଇନଥାଏ।

## ଚଳକ ଏବଂ ଧ୍ରୁବକକୁ ବୁଝିବା

App development ରେ, ସାଧାରଣତଃ ଆମକୁ user ଦ୍ୱାରା ଭରାଯାଇଥିବା କିମ୍ବା save କରାଯାଇଥିବା କିଛି ସୂଚନା ରଖିବାକୁ ପଡେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

- account name
- ଜନ୍ମଦିନ
- ସଂଯୋଗ ସୂଚନା
- ଠିକଣା

ଏହି ସୂଚନାଗୁଡ଼ିକୁ save କରାଯିବ ଏବଂ ପରେ ଦେଖାଯିବ।

ଉଦାହରଣ ସ୍ୱରୂପ, user App ଭିତରେ ଗୋଟିଏ ନାମ ଭରେ:

``` id="7j650s"
FangJunyu
````

ଆମକୁ ଏହି ନାମକୁ save କରିବାକୁ ପଡିବ, ଯାହାଦ୍ୱାରା App ଭିତରେ ଏହାକୁ ଦେଖାଇପାରିବୁ।

Save କରିବା ପ୍ରକ୍ରିୟାକୁ ସରଳ ଭାବରେ ଏଭଳି ବୁଝିପାରିବା: ଯେପରି କୌଣସି ଜିନିଷକୁ ଗୋଟିଏ drawer ଭିତରେ ରଖାଯାଏ।

ଯେତେବେଳେ ଆମେ ନାମ save କରୁଛୁ, ସେତେବେଳେ ତାହାକୁ ଗୋଟିଏ drawer ଭିତରେ ରଖୁଛୁ ବୋଲି ଭାବନ୍ତୁ।

Save କରିବା ପାଇଁ ଜିନିଷ ବହୁତ ଥାଇପାରେ, ତେଣୁ drawer ମଧ୍ୟ ବହୁତ ଥାଇପାରେ। ପ୍ରତ୍ୟେକ drawer ଭିତରେ କ’ଣ ଅଛି ତାହା ବୁଝିବା ପାଇଁ, ଆମକୁ ପ୍ରତ୍ୟେକ drawer କୁ ଗୋଟିଏ ନାମ ଦେବାକୁ ପଡିବ।

ଉଦାହରଣ:

```id="mqaagq"
name
```

ଏହି ଉଦାହରଣରେ, name ହେଉଛି ନାମ, ଏବଂ FangJunyu ହେଉଛି save କରାଯାଇଥିବା ସୂଚନା।

![Var](../../RESOURCE/007_var.png)

**Swift ରେ, ଯଦି data save କରିବାକୁ ହୁଏ, ନିଶ୍ଚିତ ଭାବରେ variable（var）କିମ୍ବା constant（let）ଘୋଷଣା କରିବାକୁ ପଡିବ।**

ଯହେତୁ ନାମ ସାଧାରଣତଃ ବଦଳାଯାଇପାରେ, ସେହିପାଇଁ ଆମେ variable ବ୍ୟବହାର କରିବା ଉଚିତ।

```swift id="wmhvw2"
var name = "FangJunyu"
```

ଏଠାରେ name ନାମର ଗୋଟିଏ variable ଘୋଷଣା କରାଯାଇଛି, ଏହାର ପ୍ରକାର String, ଏବଂ ଏହାର ମୂଲ୍ୟ "FangJunyu"।

### ଚଳକ ଏବଂ ଧ୍ରୁବକର ପାର୍ଥକ୍ୟ

Variable କୁ var ଦ୍ୱାରା ଘୋଷଣା କରାଯାଏ:

```swift id="id9f5f"
var
```

Constant କୁ let ଦ୍ୱାରା ଘୋଷଣା କରାଯାଏ:

```swift id="ktsgmk"
let
```

ଉଦାହରଣ:

```swift id="ggj0my"
var name = "FangJunyu"
let id = 123456
```

ଯଦି variable ଭାବରେ ଘୋଷଣା କରାଯାଏ, ତାହାର ଅର୍ଥ ହେଉଛି ଏହି ମୂଲ୍ୟକୁ ପରେ ବଦଳାଯାଇପାରିବ; ଯଦି constant ଭାବରେ ଘୋଷଣା କରାଯାଏ, ତେବେ ଏହାକୁ ପୁଣି ବଦଳାଯାଇପାରିବ ନାହିଁ।

ସେହିପରି, variable ଏବଂ constant ର ପ୍ରମୁଖ ପାର୍ଥକ୍ୟ ହେଉଛି: ମୂଲ୍ୟ ବଦଳିପାରିବ କି ନାହିଁ।

### ଧ୍ରୁବକକୁ ପରିବର୍ତ୍ତନ କରିବା

ଯଦି code constant ର ମୂଲ୍ୟକୁ ବଦଳାଇବାର ଚେଷ୍ଟା କରେ:

```swift id="znqmap"
let name = "Sam"
name = "Bob"
```

Swift ଜଣାଇବ ଯେ assignment କରାଯାଇପାରିବ ନାହିଁ, କାରଣ ଏହା ଗୋଟିଏ constant।

```id="7kkqmt"
Cannot assign to property: 'name' is a 'let' constant
```

ଏହି mechanism developer ଙ୍କୁ କିଛି ଦରକାରୀ data ଅପରିକଳ୍ପିତ ଭାବରେ ବଦଳିଯିବାରୁ ବଞ୍ଚାଇଥାଏ।

### SwiftUI ରେ ଦେଖାଇବା

ContentView.swift ଫାଇଲ୍ ଖୋଲନ୍ତୁ, ଏବଂ View ଭିତରେ variable ଘୋଷଣା କରନ୍ତୁ:

```swift id="p2v2ia"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

ଏଠାରେ name ନାମର ଗୋଟିଏ variable ଘୋଷଣା କରାଯାଇଛି, ଏବଂ Text ଦ୍ୱାରା ଏହାକୁ interface ରେ ଦେଖାଯାଇଛି।

ଯଦି ଆମେ variable ର content କୁ ବଦଳାଉ:

```swift id="e6m0hi"
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Text ରେ ଦେଖାଯାଇଥିବା content ମଧ୍ୟ ପରିବର୍ତ୍ତିତ ହେବ।

ଏହି ପ୍ରକାରରେ, ଆମେ variable ବ୍ୟବହାର କରି interface ରେ ଦେଖାଯାଉଥିବା content କୁ ନିୟନ୍ତ୍ରଣ କରିପାରିବୁ, ଏବଂ ପ୍ରତିଥରେ Text ଭିତରର ଟେକ୍ସ୍ଟକୁ ସିଧାସଳଖ ବଦଳାଇବା ଦରକାର ହେବ ନାହିଁ।

ଯଦି ଅନ୍ୟ କୌଣସି ଜଗାକୁ ଏହି ସୂଚନା ଦରକାର ହୁଏ, ତେବେ ଆମେ ଏହି variable କୁ ସେଠାକୁ ପଠାଇପାରିବୁ। ଏହାକୁ ଏଭଳି ବୁଝିପାରନ୍ତି ଯେ, “drawer” ଭିତରର content କୁ ଅନ୍ୟ ଜଗାରେ ବ୍ୟବହାର ପାଇଁ ଦିଆଯାଉଛି।

### SwiftUI ରେ ଚଳକ ଏବଂ ଧ୍ରୁବକର ସ୍ଥାନ

SwiftUI ରେ, variable ଏବଂ constant ସାଧାରଣତଃ body ବାହାରେ ଲେଖାଯାଏ:

```swift id="8cwhtr"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

ନିଶ୍ଚୟ, variable ଏବଂ constant କୁ body ଭିତରେ ମଧ୍ୟ ଲେଖାଯାଇପାରେ:

```swift id="k0k8vm"
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

କିନ୍ତୁ ଏଥିରେ ଗୋଟିଏ ଦରକାରୀ ପାର୍ଥକ୍ୟ ଅଛି:

* ଯଦି variable କିମ୍ବା constant body ଭିତରେ ଲେଖାଯାଏ, ତେବେ ପ୍ରତିଥର view ପୁନର୍ଗଣନା ହେଲେ ସେହି variable ପୁଣିଥରେ ତିଆରି ହେବ।
* ଯଦି body ବାହାରେ ଲେଖାଯାଏ, ତେବେ variable view structure ର property ଭାବେ ରହେ, ଯାହା code structure କୁ ଆଉ ଅଧିକ ସ୍ପଷ୍ଟ କରେ।

ସେହିପାଇଁ, ବାସ୍ତବ development ରେ, variable ଏବଂ constant କୁ body ବାହାରେ ଲେଖାଯାଏ।

## data type

Variable ବହୁତ ପ୍ରକାର data save କରିପାରେ, ଏହି ପ୍ରକାରଗୁଡ଼ିକୁ data type କୁହାଯାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ, ପୂର୍ବରୁ ଆମେ Text ବ୍ୟବହାର କରି ଟେକ୍ସ୍ଟ ଦେଖାଇଥିଲୁ:

```swift id="w8ep8z"
Text("Hello, World")
```

ଏଠାରେ "Hello, World" ହେଉଛି string（String）ପ୍ରକାର।

String ଟେକ୍ସ୍ଟ content କୁ ପ୍ରତିନିଧିତ୍ୱ କରେ, ଏବଂ Swift ରେ ଏହାକୁ ନିଶ୍ଚୟ ଭାବେ double quote "" ଭିତରେ ଲେଖାଯାଇଥାଏ।

ଉଦାହରଣ:

```swift id="lr7g0v"
var hello = "Hello, World"
```

String ବ୍ୟତୀତ, Swift ରେ ଅନେକ ଅନ୍ୟ data type ମଧ୍ୟ ଅଛି।

ଆରମ୍ଭରେ ସବୁଠାରୁ ସାଧାରଣ ଚାରିଟି type ହେଲେ:

* String
* Int
* Double
* Bool

ଏହି ଚାରିଟି type ଦ୍ୱାରା ଅଧିକାଂଶ ମୌଳିକ data processing ସମାପ୍ତ କରାଯାଇପାରେ।

**String**

String ଟେକ୍ସ୍ଟ content କୁ ପ୍ରତିନିଧିତ୍ୱ କରେ, ଉଦାହରଣ:

```swift id="z9yjov"
var name = "FangJunyu"
var city = "Rizhao"
```

String ସାଧାରଣତଃ user name、title、text content ଭଳି ଜିନିଷ ପ୍ରତିନିଧିତ୍ୱ କରିବାପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

**Int**

Int ର ଅର୍ଥ integer, ଅର୍ଥାତ୍ ଦଶମିକ ବିହୀନ ପୂର୍ଣ୍ଣ ସଂଖ୍ୟା।

ଉଦାହରଣ:

```swift id="1t4yao"
var age = 26
var count = 100
```

Integer ସାଧାରଣତଃ age、quantity、count ପରି ତଥ୍ୟ ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

**Double**

Double ହେଉଛି ଦଶମିକ ସହିତ ସଂଖ୍ୟା।

ଉଦାହରଣ:

```swift id="x6hozf"
var weight = 74.5
var height = 185.0
```

Swift ରେ, decimal number ସାଧାରଣତଃ default ଭାବରେ Double ଭାବେ ଗ୍ରହଣ କରାଯାଏ।

ଏହା ସହିତ ସମାନ ଆଉ ଗୋଟିଏ type ହେଉଛି Float, କିନ୍ତୁ ଏହାର ସଂଖ୍ୟାମୂଲ୍ୟ ସୀମା ଅଧିକ ଛୋଟ, ତେଣୁ ବାସ୍ତବ development ରେ Double ଅଧିକ ସାଧାରଣ ଭାବରେ ବ୍ୟବହୃତ ହୁଏ।

**Bool**

Bool type ଦୁଇଟି ଅବସ୍ଥା ପ୍ରତିନିଧିତ୍ୱ କରେ: true ଏବଂ false।

ଉଦାହରଣ:

```swift id="8x9n2q"
var isShowAlert = true
var isLogin = false
```

Bool type ସାଧାରଣତଃ condition judgment ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ଉଦାହରଣସ୍ୱରୂପ, କୌଣସି alert ଦେଖାଯିବ କି ନାହିଁ।

ଯେଉଁ ଅବସ୍ଥାରେ କେବଳ ଦୁଇଟି ଫଳାଫଳ ଥାଏ, ସେଠାରେ Bool ବ୍ୟବହାର କରିବା ବହୁତ ଉପଯୋଗୀ।

### SwiftUI ରେ ଦେଖାଇବା

ଯେତେବେଳେ ଆମେ String ପ୍ରକାରର content ଦେଖାଉ, ସେତେବେଳେ ସିଧାସଳଖ Text ବ୍ୟବହାର କରିପାରୁ:

```swift id="pi0rfu"
Text(name)
```

କିନ୍ତୁ Int、Double ପରି ପ୍ରକାରଗୁଡ଼ିକ string ନୁହେଁ, ତେଣୁ ସେଗୁଡ଼ିକୁ ସିଧାସଳଖ ଟେକ୍ସ୍ଟର ଅଂଶ ଭାବେ ଦେଖାଇହେବ ନାହିଁ।

ଯଦି Text ଭିତରେ ଏହି data ଦେଖାଇବାକୁ ହୁଏ, ତେବେ string interpolation ବ୍ୟବହାର କରାଯିବ:

```swift id="xhf3lu"
\()
```

String interpolation ନିଶ୍ଚୟ ଭାବରେ string ଭିତରେ ଲେଖାଯିବାକୁ ପଡିବ, ଏବଂ variable କିମ୍ବା constant କୁ \() ମଧ୍ୟରେ ରଖିବାକୁ ପଡିବ।

ଉଦାହରଣ:

```swift id="u5n87v"
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

ଉପରୋକ୍ତ କୋଡ୍ ରେ, "" ର ଅର୍ଥ string, ଏବଂ \() ଦ୍ୱାରା variable କିମ୍ବା constant କୁ string ଭିତରେ ପ୍ରବେଶ କରାଯାଏ।

ଉଦାହରଣ:

```swift id="rj835z"
"DoubleNum: \(num * 2)"
```

ଦେଖାଯାଇଥିବା content ହେବ:

```id="f3hfjx"
DoubleNum: 2
```

ଏହି ପ୍ରକାରରେ, ଆମେ string ଭିତରେ variable କିମ୍ବା constant ପ୍ରବେଶ କରି, ପରେ Text ବ୍ୟବହାର କରି ସେଗୁଡ଼ିକୁ interface ରେ ଦେଖାଇପାରୁ।

ଟିପ୍ପଣୀ: \() କେବଳ string "" ଭିତରେ ବ୍ୟବହାର କରାଯାଇପାରେ।

## operator

Variable କିମ୍ବା constant ଘୋଷଣା କରିବାବେଳେ, ଆମେ ଏହି ଲେଖାରୂପ ଦେଖୁଥାଉ:

```swift id="r4zyli"
var num = 1
```

ଏଠାରେ = କୁ assignment operator କୁହାଯାଏ।

ଏହାର କାମ ହେଉଛି: ଡାହାଣ ପଟର ମୂଲ୍ୟକୁ ବାମ ପଟର variable କୁ ଦେବା।

ଏହି ଉଦାହରଣରେ, 1 କୁ num ନାମକ variable କୁ assign କରାଯାଇଛି।

Assignment operator ଛଡ଼ା, ଆଉ କିଛି ସାଧାରଣ numeric operator ମଧ୍ୟ ଅଛି:

* `+`
* `-`
* `*`
* `/`

ଯେତେବେଳେ ଆମେ ସଂଖ୍ୟାର ଗଣନା କରୁ, ଉଦାହରଣସ୍ୱରୂପ Int କିମ୍ବା Double ପ୍ରକାରର data ଉପରେ, ସେତେବେଳେ ଏହି operator ଗୁଡ଼ିକ ବ୍ୟବହୃତ ହୁଏ।

ଉଦାହରଣ:

```swift id="3cbszn"
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

ଗଣନା ସମାପ୍ତ ହେଲାପରେ, ଫଳାଫଳ variable ଭିତରେ save ହୋଇଯାଏ।

## ସାରାଂଶ

Variable、constant ଏବଂ operator programming ର ସବୁଠାରୁ ମୌଳିକ ଧାରଣା।

Variable ଏବଂ constant ଦ୍ୱାରା ଆମେ program ଭିତରେ ବିଭିନ୍ନ ପ୍ରକାର data save କରିପାରୁ; data type ଦ୍ୱାରା data ର ପ୍ରକାର ସ୍ପଷ୍ଟ ହୁଏ; operator ଦ୍ୱାରା data ର ଗଣନା ଏବଂ ପ୍ରକ୍ରିୟାକରଣ କରାଯାଏ।

ଏହି ଜ୍ଞାନଗୁଡ଼ିକ programming ଜଗତର ମୌଳିକ tool ପରି। ଏଗୁଡ଼ିକୁ ଭଲଭାବରେ ଆତ୍ମସାତ୍ କରିପାରିଲେ, ପରବର୍ତ୍ତୀ Swift ଏବଂ SwiftUI ଶିକ୍ଷା ପାଇଁ ଦୃଢ଼ ଭିତି ତିଆରି ହେବ।
