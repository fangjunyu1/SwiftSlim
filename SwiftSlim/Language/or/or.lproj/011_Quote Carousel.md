# ଉକ୍ତି ରୋଟେସନ୍

ଏହି ପାଠରେ, ଆମେ “ଉକ୍ତି ରୋଟେସନ୍” ନାମକ ଗୋଟିଏ ଫିଚର୍ ତିଆରି କରିବୁ, ଏବଂ Array ଓ if-else ପରି Swift ର ମୌଳିକ ଜ୍ଞାନକୁ ଆଉ ଗଭୀରରେ ଶିଖିବୁ।

ଆମେ ଦେଖିବୁ କିପରି ଅନେକ ଉକ୍ତିକୁ ସଞ୍ଚୟ କରାଯାଏ, ଏବଂ ବଟନ୍ ଇଣ୍ଟରାକ୍ସନ୍ ଦ୍ୱାରା କିପରି ସେଗୁଡିକୁ ଘୁରାଣିଆ ଭାବରେ ଦେଖାଯାଏ।

![alt text](../../RESOURCE/011_word.png)

## ଉକ୍ତି ଦେଖାଇବା

ପ୍ରଥମେ, ଆମକୁ SwiftUI ରେ ଗୋଟିଏ ଉକ୍ତି ଦେଖାଇବାକୁ ପଡିବ।

ସବୁଠାରୁ ସହଜ ଉପାୟ ହେଉଛି `Text` ଭ୍ୟୁ ବ୍ୟବହାର କରିବା:

```swift
Text("Slow progress is still progress.")
````

ଏହି କୋଡ୍ କେବଳ ଗୋଟିଏ ନିଶ୍ଚିତ ଉକ୍ତିକୁ ଦେଖାଇପାରିବ। ଯଦି ଆମେ ଅନେକ ଉକ୍ତିକୁ ଦେଖାଇବାକୁ ଏବଂ ସେମାନଙ୍କୁ ସ୍ୱିଚ୍ କରିବାକୁ ଚାହୁଁଛୁ, ତେବେ ଆମକୁ ସେହି ଉକ୍ତିଗୁଡିକୁ ସଞ୍ଚୟ କରିବାକୁ ପଡିବ।

କିନ୍ତୁ ସାଧାରଣ String ଭେରିଏବଲ୍ କେବଳ ଗୋଟିଏ ଉକ୍ତିକୁ ସଞ୍ଚୟ କରିପାରେ:

```swift id="iznqwd"
let sayings = "Slow progress is still progress."
```

ଯଦି ଆମକୁ ଅନେକ ଉକ୍ତି ସଞ୍ଚୟ କରିବାକୁ ହୁଏ, ତେବେ ପ୍ରତ୍ୟେକ ଉକ୍ତି ପାଇଁ ଅଲଗା ଭେରିଏବଲ୍ ଘୋଷଣା କରିବାକୁ ପଡିବ:

```swift id="xb4u8c"
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

କିନ୍ତୁ ବାସ୍ତବ ଡିଭେଲପମେଣ୍ଟରେ, ଏହି ପ୍ରକ୍ରିୟା କେବଳ ଜଟିଳ ନୁହେଁ, ପ୍ରତ୍ୟେକ ଭେରିଏବଲ୍ ସ୍ୱତନ୍ତ୍ର ଥିବାରୁ ଆମେ ଲଚିଳା ଭାବରେ ରୋଟେସନ୍ ସ୍ୱିଚ୍ ମଧ୍ୟ କରିପାରିବୁ ନାହିଁ।

ଅନେକ ଉକ୍ତିକୁ ସହଜରେ ପରିଚାଳନା କରିବା ପାଇଁ, ଆମକୁ ଗୋଟିଏ data structure ବ୍ୟବହାର କରି ସେଗୁଡିକୁ ଏକାସାଥିରେ ସଞ୍ଚୟ କରିବାକୁ ପଡିବ, ସେହି ହେଉଛି Array।

Array ବ୍ୟବହାର କରିଲେ, ଉପରୋକ୍ତ କୋଡ୍‌କୁ ଏଭଳି ସଞ୍ଚୟ କରାଯାଇପାରିବ:

```swift id="p7vfje"
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**ସୂଚନା: ପ୍ରୋଗ୍ରାମିଂ ନିୟମରେ, ଅନେକ ଉପାଦାନ ଥିବା array ଭେରିଏବଲ୍‌ର ନାମ ସାଧାରଣତଃ plural ଆକାରରେ ଥାଏ, ଯଥା sayings, ଯାହା ତାହାର ସଂଗ୍ରହ ଗୁଣଧର୍ମକୁ ପ୍ରକାଶ କରେ।**

## Array

Swift ରେ, Array ହେଉଛି କ୍ରମିକ ଉପାଦାନଗୁଡିକୁ ସଞ୍ଚୟ କରିବା ପାଇଁ ଗୋଟିଏ collection, ଯାହାକୁ square brackets `[]` ଦ୍ୱାରା ପ୍ରଦର୍ଶିତ କରାଯାଏ।

```swift id="l1z8sn"
[]
```

Array ଭିତରେ ଏକେ ପ୍ରକାରର ଅନେକ ଉପାଦାନ ଥାଇପାରେ, ଏବଂ ସେଗୁଡିକୁ English comma `,` ଦ୍ୱାରା ଅଲଗା କରାଯାଏ।

ଉଦାହରଣ:

```swift id="zt9gx0"
[101, 102, 103, 104, 105]
```

Array କୁ ଆମେ ଏକ ଟ୍ରେନ୍ ଲାଇନ୍ ପରି ସରଳ ଭାବରେ ବୁଝିପାରିବୁ:

![Array](../../RESOURCE/011_array1.png)

ସମ୍ପୂର୍ଣ୍ଣ ଟ୍ରେନ୍‌ଟି ଏହି array object କୁ ପ୍ରତିନିଧିତ୍ୱ କରେ, ଏବଂ ପ୍ରତ୍ୟେକ ବୋଗି କ୍ରମାନୁସାରେ ଲାଗିଥାଏ।

### Index ଏବଂ ଉପାଦାନ ଆକ୍ସେସ୍

Array କ୍ରମିକ ଥିବାରୁ, ସିଷ୍ଟମ୍ ଏହାର କ୍ରମ ଅନୁଯାୟୀ ନିର୍ଦ୍ଦିଷ୍ଟ ଉପାଦାନକୁ ଖୋଜିପାରେ। ଏହି ଖୋଜିବା ପ୍ରଣାଳୀକୁ Index କୁହାଯାଏ।

Swift ରେ (ଏବଂ ଅଧିକାଂଶ programming language ରେ), array ର index 0 ଠାରୁ ଆରମ୍ଭ ହୁଏ, 1 ଠାରୁ ନୁହେଁ। ଅର୍ଥାତ୍ array ର ପ୍ରଥମ ଉପାଦାନର index 0, ଦ୍ୱିତୀୟଟି 1, ଏଭଳି ଚାଲିଥାଏ।

![Array](../../RESOURCE/011_array2.png)

Array ର ନିର୍ଦ୍ଦିଷ୍ଟ ଉପାଦାନକୁ ଆକ୍ସେସ୍ କରିବାକୁ, array ର ନାମ ପରେ square brackets ଯୋଡି ତା’ଭିତରେ target ଉପାଦାନର index ଦିଆଯାଏ।

ଉଦାହରଣ:

```swift id="gucv91"
sayings[0]   // 101
sayings[1]   // 102
```

ଯଦି ଆମେ array ର valid range ବାହାରର index କୁ access କରିବାକୁ ଚେଷ୍ଟା କରୁ, “Index Out of Range” ସମସ୍ୟା ଘଟିବ। ସେହିପାଇଁ array access କରିବାବେଳେ ସାବଧାନ ରହିବା ଆବଶ୍ୟକ, ଏବଂ index valid range ଭିତରେ ଅଛି କିନା ନିଶ୍ଚିତ କରିବା ଦରକାର।

**Index Out of Range**

ଉଦାହରଣ ସ୍ୱରୂପ, ଯଦି array ରେ କେବଳ 5ଟି ଉପାଦାନ ଅଛି, ତେବେ valid index range ହେଉଛି 0 ଠାରୁ 4 ପର୍ଯ୍ୟନ୍ତ। ଯଦି ଆମେ `sayings[5]` କୁ access କରୁ, ପ୍ରୋଗ୍ରାମ୍ ସେହି “ବୋଗି” କୁ ଖୋଜିପାରିବ ନାହିଁ, ଫଳରେ “Index Out of Range” error ହେବ ଏବଂ app crash କରିଯିବ।

![Array](../../RESOURCE/011_array3.png)

### Array ଉପରେ କାର୍ଯ୍ୟ

Array କେବଳ static definition କୁ support କରେ ନୁହେଁ, ଏହା ଉପାଦାନ ଯୋଡିବା, କାଟିବା, ପରିବର୍ତ୍ତନ କରିବା ଏବଂ length ମଧ୍ୟ ପାଇପାରେ।

ସୂଚନା: ଯଦି array କୁ ପରିବର୍ତ୍ତନ କରିବାକୁ ହୁଏ, ତେବେ `let` constant ନୁହେଁ, `var` ଭେରିଏବଲ୍ ବ୍ୟବହାର କରିବା ଦରକାର।

**1. ଉପାଦାନ ଯୋଡିବା**

Array ର ଶେଷରେ ଉପାଦାନ ଯୋଡିବା ପାଇଁ `append` method ବ୍ୟବହାର କରାଯାଏ:

```swift id="uuzvhg"
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. ଉପାଦାନ ବାହାର କରିବା**

`remove(at:)` method ଦ୍ୱାରା, array ର ନିର୍ଦ୍ଦିଷ୍ଟ ଉପାଦାନକୁ କାଟିପାରିବା:

```swift id="izh1ew"
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. ଉପାଦାନ ପରିବର୍ତ୍ତନ କରିବା**

Index ବ୍ୟବହାର କରି ସିଧାସଳଖ ଭାବରେ array ର ଉପାଦାନକୁ ପରିବର୍ତ୍ତନ କରିପାରିବା:

```swift id="dhr61j"
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Array ର length ଗଣନା କରିବା**

Array ର ଉପାଦାନ ସଂଖ୍ୟା ପାଇଁ `count` property ବ୍ୟବହାର କରାଯାଏ:

```swift id="ckj6o2"
var num = [0, 1, 2]
num.count   // 3
```

### Array ବ୍ୟବହାର କରି ଉକ୍ତି ଦେଖାଇବା

ଅନେକ ଉକ୍ତି ଦେଖାଇବା ପାଇଁ, ଆମେ ସେଗୁଡିକୁ array ରେ ସଞ୍ଚୟ କରିପାରିବା, ଏବଂ ପରେ index ବ୍ୟବହାର କରି access ଓ display କରିପାରିବା।

ପ୍ରଥମେ, `ContentView` ଭିତରେ ଗୋଟିଏ `sayings` array ତିଆରି କରି ଉକ୍ତିଗୁଡିକୁ ସଞ୍ଚୟ କରିବା, ତାପରେ `Text` view ଭିତରେ index ଦ୍ୱାରା ଉଚିତ ଉକ୍ତିକୁ ପଢ଼ି ଦେଖାଇବା:

```swift id="g8vw93"
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

ଏଠାରେ, `sayings[0]` ର ଅର୍ଥ ହେଉଛି array ର ପ୍ରଥମ ଉକ୍ତି।

ଯଦି ଅନ୍ୟ ଉକ୍ତି ଦେଖାଇବାକୁ ହୁଏ, ତେବେ କେବଳ square brackets ଭିତରେ ଥିବା index ମୂଲ୍ୟକୁ ବଦଳାଇଲେ ହେବ:

```swift id="72s6ew"
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### ଉକ୍ତିର index ନିର୍ଦ୍ଦିଷ୍ଟ କରିବା

ଉକ୍ତିକୁ dynamic ଭାବରେ switch କରିବାର effect ପାଇଁ, ଆମେ `Text` view ଭିତରେ index କୁ “ଲେଖି ଧରି” ରଖିପାରିବୁ ନାହିଁ।

ଆମକୁ ଗୋଟିଏ ଭେରିଏବଲ୍ ତିଆରି କରି ବର୍ତ୍ତମାନ ଦେଖାଯାଉଥିବା index ମୂଲ୍ୟକୁ ଅଲଗା ଭାବରେ ସଞ୍ଚୟ କରିବାକୁ ପଡିବ।

SwiftUI ରେ, ଆମେ `@State` ବ୍ୟବହାର କରି ଗୋଟିଏ mutable index ଘୋଷଣା କରିପାରିବା:

```swift id="pptjlwm"
@State private var index = 0
```

SwiftUI, `@State` ରେ wrap ହୋଇଥିବା ଭେରିଏବଲ୍‌କୁ ନଜର ରଖେ। ଯେତେବେଳେ `index` ପରିବର୍ତ୍ତିତ ହୁଏ, SwiftUI ଭ୍ୟୁକୁ ପୁନଃ render କରେ ଏବଂ ସମ୍ବନ୍ଧିତ ଉକ୍ତିକୁ ଦେଖାଏ।

ତାପରେ, ଆମେ `sayings[index]` ବ୍ୟବହାର କରି array ଭିତରେ ଥିବା ଉକ୍ତିକୁ dynamic ଭାବରେ ନେବା:

```swift id="eqmmjw"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

ଯେତେବେଳେ `index` ର ମୂଲ୍ୟ ପରିବର୍ତ୍ତିତ ହୁଏ, `Text` ଭିନ୍ନ ଉକ୍ତିକୁ ଦେଖାଇବ।

### ବଟନ୍ ବ୍ୟବହାର କରି index ନିୟନ୍ତ୍ରଣ

ଉକ୍ତି switch କରିବାକୁ, ଆମେ `Button` ବ୍ୟବହାର କରି `index` ର ମୂଲ୍ୟକୁ ବଦଳାଇପାରିବା। ପ୍ରତ୍ୟେକ କ୍ଲିକ୍‌ରେ, `index` ସ୍ୱୟଂଚାଳିତ ଭାବରେ 1 ବଢ଼ିବ:

```swift id="2u5o18"
Button("Next") {
    index += 1
}
```

ଯେତେବେଳେ ଆମେ ବଟନ୍ କ୍ଲିକ୍ କରୁ, `index` ର ମୂଲ୍ୟ 0 ଠାରୁ 1 ହେବ, ଭ୍ୟୁ refresh ହେବ, ଏବଂ `Text(sayings[index])` ପରବର୍ତ୍ତୀ ଉକ୍ତିକୁ ପଢ଼ିବ।

କିନ୍ତୁ ଏଠାରେ ଗୋଟିଏ ଲୁକାଇଥିବା ସମସ୍ୟା ଅଛି: ଯଦି ଆମେ ବଟନ୍‌କୁ ଲଗାତାର କ୍ଲିକ୍ କରୁ, `index` array ର range ବାହାରକୁ ବଢ଼ିଯିବ, ଯାହା array index out of range error ସୃଷ୍ଟି କରିବ। ଉଦାହରଣ ସ୍ୱରୂପ, ଯେତେବେଳେ `index` 5 କୁ ପହଞ୍ଚିବ (array ର valid index ହେଉଛି 0 ଠାରୁ 4), ପ୍ରୋଗ୍ରାମ୍ crash କରିଯିବ।

Array index out of range କୁ ରୋକିବା ପାଇଁ, ଆମକୁ condition control ଆଣିବାକୁ ପଡିବ, ଯାହା ନିଶ୍ଚିତ କରିବ ଯେ `index` array ର range ବାହାରକୁ ଯିବ ନାହିଁ। ଏହା ପାଇଁ if-else statement ବ୍ୟବହାର କରି `index` array ର length ଠାରୁ କମ୍ କିନା ଯାଞ୍ଚ କରିପାରିବା।

## Condition control: if-else statement

if-else statement Swift ର ସବୁଠାରୁ ସାଧାରଣ condition branch statement ମଧ୍ୟରୁ ଗୋଟିଏ, ଯାହା ଶର୍ତ୍ତ ସତ୍ୟ କିନା ଯାଞ୍ଚ କରି, ସେହି ଅନୁଯାୟୀ ଭିନ୍ନ code block କୁ execute କରେ।

ମୂଳ ଗଠନ:

```swift id="b4jht6"
if condition {
    // condition true ହେଲେ ଚାଲିବା code
} else {
    // condition false ହେଲେ ଚାଲିବା code
}
```

if statement ଭିତରେ, `condition` ଗୋଟିଏ Boolean value (`Bool` type), ଯାହା `true` କିମ୍ବା `false` ହୋଇପାରେ। ଯଦି condition `true` ହୁଏ, if ଅଂଶର କୋଡ୍ execute ହୁଏ; ନଚେତ୍ else ଅଂଶ execute ହୁଏ।

ଉଦାହରଣ:

```swift id="6ql9sr"
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

ଏହି ଉଦାହରଣରେ, `age` ର ମୂଲ୍ୟ 25। if statement `age > 18` ସତ୍ୟ କିନା ଯାଞ୍ଚ କରେ, condition ସତ୍ୟ ହେବାରୁ `"Big Boy"` output ହୁଏ।

ଯଦି else ଅଂଶ ଦରକାର ନାହିଁ, ତେବେ ଏହାକୁ ଛାଡ଼ାଯାଇପାରେ:

```swift id="z2288t"
if condition {
    // condition true ହେଲେ ଚାଲିବା code
}
```

### Condition ଦ୍ୱାରା index range ନିୟନ୍ତ୍ରଣ

Array index out of range କୁ ରୋକିବା ପାଇଁ, if statement ବ୍ୟବହାର କରି `index` array ର range ବାହାରକୁ ଯାଉନାହିଁ କିନା ନିଶ୍ଚିତ କରିପାରିବା:

```swift id="ld1hup"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logic analysis: `sayings.count` ର ମୂଲ୍ୟ 5 (ମୋଟ 5ଟି ଉକ୍ତି ଅଛି), ତେଣୁ `sayings.count - 1` ର ମୂଲ୍ୟ 4। ଏହା ହେଉଛି array ର ଶେଷ valid index।

ଯେତେବେଳେ `index` 4 ଠାରୁ କମ୍ ଅଛି, ବଟନ୍ କ୍ଲିକ୍ କରି `+1` କରିବା ସୁରକ୍ଷିତ; ଏକଥର `index` 4 କୁ ପହଞ୍ଚିଗଲେ, condition ଆଉ ସତ୍ୟ ହେବ ନାହିଁ, ତେଣୁ ବଟନ୍ କ୍ଲିକ୍ କଲେ କୌଣସି ପରିବର୍ତ୍ତନ ହେବ ନାହିଁ।

ଏବେ, କୋଡ୍‌ଟି ଉକ୍ତି switch କରିବାର functionality କୁ ପ୍ରୟୋଗ କରିସାରିଛି:

```swift id="p2wmop"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### ଘୁରାଣିଆ ଉକ୍ତି

ଯଦି ଆମେ ଚାହୁଁଛୁ ଯେ ଶେଷ ଉକ୍ତି ଦେଖାଇସାରିଲାପରେ ପୁଣି ବଟନ୍ କ୍ଲିକ୍ କଲେ ପ୍ରଥମ ଉକ୍ତି ଦେଖାଯାଉ, ତେବେ ଉକ୍ତିଗୁଡିକୁ ଘୁରାଣିଆ ଭାବରେ ଦେଖାଇପାରିବୁ। ଏହା else ଅଂଶ ଦ୍ୱାରା କରାଯାଇପାରେ:

```swift id="315czo"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

ବଟନ୍ କ୍ଲିକ୍ ହେଲେ, ଯଦି `index` array ର ଶେଷ ଉପାଦାନକୁ ପହଞ୍ଚିଯାଇଛି, ତେବେ `index` କୁ ପୁଣି `0` କରାଯିବ, ଏବଂ ଉକ୍ତିଗୁଡିକୁ ଆଉଥରେ ଆରମ୍ଭରୁ ଘୁରାଣିଆ ଭାବରେ ଦେଖାଇବ।

## ଉକ୍ତି ଭ୍ୟୁକୁ ଆଉ ଭଲ କରିବା

ଏବେ ଆମର ଉକ୍ତି ରୋଟେସନ୍ logic ତିଆରି ହୋଇଗଲା, କିନ୍ତୁ interface କୁ ଆଉ ସୁନ୍ଦର କରିବା ପାଇଁ ଆମେ ଏହାକୁ ଆଉ ଭଲ କରିପାରିବା।

ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍:

```swift id="i9dcph"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

ଏହି ଉଦାହରଣରେ, `Text` view ରେ ଧଳା ଅର୍ଧପାରଦର୍ଶୀ background ଏବଂ rounded corners ଯୋଡାଯାଇଛି, `Button` ରେ `.borderedProminent` style ବ୍ୟବହୃତ ହୋଇଛି, ଏବଂ `VStack` କୁ background image ଦିଆଯାଇଛି।

ଜ୍ଞାନ ଉପପୂରକ: `background()` modifier ବ୍ୟବହାର କରି image background handle କଲାବେଳେ, ଏହାର default behavior ହେଉଛି ସମ୍ଭବ ଥିବା ସବୁଠାରୁ ଅଧିକ ଭାଗରେ ବର୍ତ୍ତମାନ view ଥିବା layout region କୁ ଭରିଦେବା। ଅନେକ ପରିସ୍ଥିତିରେ, ଏହା ସ୍ୱାଭାବିକ ଭାବରେ Safe Area ପର୍ଯ୍ୟନ୍ତ ପ୍ରସାରିତ ହୋଇପାରେ।

ଏବେ, ଆମେ ଉକ୍ତି ରୋଟେସନ୍ ଭ୍ୟୁକୁ ପ୍ରୟୋଗ କରିସାରିଛୁ।

![SwiftUI View](../../RESOURCE/011_word.png)

## ସାରାଂଶ

ଏହି ପାଠ ଦ୍ୱାରା, ଆମେ ଶିଖିଲୁ କିପରି array ବ୍ୟବହାର କରି ଅନେକ ଉକ୍ତିକୁ ସଞ୍ଚୟ କରିବା, ଏବଂ if ଓ if-else statement ବ୍ୟବହାର କରି ଉକ୍ତି ରୋଟେସନ୍ କରିବା।

ଆମେ array ର ମୌଳିକ କାର୍ଯ୍ୟଗୁଡିକୁ ମଧ୍ୟ ବୁଝିଲୁ, ଯଥା ନୂତନ ଉପାଦାନ ଯୋଡିବା, କାଟିବା, ପରିବର୍ତ୍ତନ କରିବା, ଏବଂ array index out of range କୁ କିପରି ରୋକିବା।

ଏହି ପାଠ କେବଳ ଉକ୍ତି ରୋଟେସନ୍ functionality ବିଷୟରେ ନୁହେଁ, ଏହା array ଏବଂ conditional statements ର ମୌଳିକ ବ୍ୟବହାରକୁ ମଧ୍ୟ ମିଶାଇଛି, ଯାହା ଆମକୁ data handle କରିବା ଏବଂ program flow ନିୟନ୍ତ୍ରଣ କରିବାର କ୍ଷମତା ଦିଏ।

## ବିସ୍ତାରିତ ଜ୍ଞାନ - ଅନେକ ଶର୍ତ୍ତ ନିର୍ଣ୍ଣୟ: if-else if-else statement

ବାସ୍ତବ ଡିଭେଲପମେଣ୍ଟରେ, ଆମକୁ ପ୍ରାୟତଃ ଅନେକ ଶର୍ତ୍ତ handle କରିବାକୁ ପଡେ। ଉଦାହରଣ ସ୍ୱରୂପ, କୌଣସି ଗେମ୍‌ରେ score 1 ହେଲେ event A trigger ହେବ, 2 ହେଲେ event B, 3 ହେଲେ event C, ଏଭଳି ଚାଲିଥାଏ।

ଦୁଇଟାଠାରୁ ଅଧିକ condition branch ଥିବା ପରିସ୍ଥିତିରେ, ଆମକୁ if-else if-else statement ବ୍ୟବହାର କରି multiple condition checking କରିବାକୁ ହୁଏ।

ମୌଳିକ syntax:

```swift id="72p4g1"
if conditionA {
    // conditionA true ହେଲେ ଚାଲିବା code
} else if conditionB {
    // conditionB true ହେଲେ ଚାଲିବା code
} else if conditionC {
    // conditionC true ହେଲେ ଚାଲିବା code
} else {
    // ସମସ୍ତ condition ଭୁଲ୍ ହେଲେ ଚାଲିବା code
}
```

ଏହି ପରିସ୍ଥିତିରେ, ପ୍ରୋଗ୍ରାମ୍ କ୍ରମାନୁସାରେ condition ଗୁଡିକୁ ଯାଞ୍ଚ କରିବ, ଏବଂ ପ୍ରଥମ ସତ୍ୟ condition ପାଇଁ ଥିବା code କୁ execute କରିବ। ଯଦି କୌଣସି condition ସତ୍ୟ ନୁହେଁ, ତେବେ else ପରବର୍ତ୍ତୀ code execute ହେବ।

ଉକ୍ତି ରୋଟେସନ୍‌ରେ ମଧ୍ୟ, ଆମେ if-else if-else statement ବ୍ୟବହାର କରି multiple condition checking କରିପାରିବା:

```swift id="r9i6ce"
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

ଯେତେବେଳେ `index` 0, 1, 2, 3 ଥାଏ, ପ୍ରତ୍ୟେକ କ୍ଲିକ୍‌ରେ `index += 1` ହେବ; ଏବଂ `index` 4 (ଶେଷ ଉପାଦାନ) ହେଲେ, `index` କୁ `0` କରାଯିବ, ଯାହା ଫଳରେ ଘୁରାଣିଆ effect ମିଳିବ।

else branch ହେଉଛି fallback, ଯାହା invalid value ଆସିଯାଇଲେ (ଯଥା `index` ଭୁଲରେ ପରିବର୍ତ୍ତିତ ହେଲେ) ସେଥିରୁ ସୁରକ୍ଷା ଦେଏ।

ଏଠାରେ ଧ୍ୟାନ ଦେବା ଯୋଗ୍ୟ କଥା ହେଉଛି, `==` ର ଅର୍ଥ ହେଉଛି “ସମାନ କିନା” ଯାଞ୍ଚ କରିବା। ଯଦି if statement ରେ `index` କୌଣସି ସଂଖ୍ୟା ସହ ସମାନ ହୁଏ, ତେବେ `true` ଫେରାଇ ପରବର୍ତ୍ତୀ code block execute କରିବ। ଯଦି ସମାନ ନୁହେଁ, ତେବେ ପରବର୍ତ୍ତୀ if statement କୁ ଯିବ।

ଏହିପରି multiple condition checking ଭିନ୍ନ ଭିନ୍ନ condition ସ୍ଥିତିରେ ଭିନ୍ନ ଭିନ୍ନ code execute କରିବାରେ ବହୁତ ଉପଯୋଗୀ।