# ଫିଲ୍ ଲାଇଟ୍ ଆପ୍

ଏହି ପାଠରେ, ଆମେ ଗୋଟିଏ ବହୁତ ଆକର୍ଷଣୀୟ ଫିଲ୍ ଲାଇଟ୍ ଆପ୍ ତିଆରି କରିବୁ। ରାତି ହେଲେ, ଆମେ ଫୋନ୍ ସ୍କ୍ରିନ୍‌ରେ ଭିନ୍ନ ଭିନ୍ନ ରଙ୍ଗ ଦେଖାଇ ପାରିବୁ ଏବଂ ଏହାକୁ ସରଳ ଫିଲ୍ ଲାଇଟ୍ ଭାବେ ବ୍ୟବହାର କରିପାରିବୁ।

ଏହି ଫିଲ୍ ଲାଇଟ୍ ଆପ୍ ସ୍କ୍ରିନ୍‌କୁ ଟାପ୍ କରି ରଙ୍ଗ ବଦଳାଇପାରିବ, ଏବଂ ସ୍ଲାଇଡର୍ ବ୍ୟବହାର କରି ବ୍ରାଇଟନେସ୍‌କୁ ମଧ୍ୟ ସମଯୋଜନ କରିପାରିବ।

ଏହି ଉଦାହରଣରେ, `brightness` ବ୍ୟବହାର କରି view ର brightness କିପରି ଠିକ କରିବା, `onTapGesture` ବ୍ୟବହାର କରି view ରେ tap gesture କିପରି ଯୋଡିବା, ଏବଂ `Slider` control ବିଷୟରେ ଆମେ ଶିଖିବୁ।

ଫଳାଫଳ:

![Color](../../Resource/018_color.png)

## ରଙ୍ଗ ଦେଖାଇବା

ପ୍ରଥମେ, ଆମେ view ରେ ଗୋଟିଏ ରଙ୍ଗ ଦେଖାଉ।

SwiftUI ରେ, `Color` କେବଳ ଗୋଟିଏ ରଙ୍ଗକୁ ନୁହେଁ, ଏହାକୁ ଗୋଟିଏ view ଭାବେ ମଧ୍ୟ ଦେଖାଇ ପାରିବ:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

ଏଠାରେ, `Color.red` ଗୋଟିଏ ଲାଲ view କୁ ଦର୍ଶାଏ। `.ignoresSafeArea()` ରଙ୍ଗର view କୁ ସମୁଦାୟ ସ୍କ୍ରିନ୍‌ରେ ପ୍ରସାରିତ କରେ, ଯାହା ଏକ ସତ୍ୟ ଫିଲ୍ ଲାଇଟ୍ ପ୍ରଭାବ ପରି ଲାଗେ।

ଫଳାଫଳ:

![Color](../../Resource/018_color1.png)

### ରଙ୍ଗର array ଏବଂ index

ବର୍ତ୍ତମାନ କେବଳ ଗୋଟିଏ ରଙ୍ଗ ଦେଖାଯାଉଛି। କିନ୍ତୁ ଫିଲ୍ ଲାଇଟ୍ ସାଧାରଣତଃ କେବଳ ଗୋଟିଏ ରଙ୍ଗରେ ସୀମିତ ନୁହେଁ। ଏହା ନୀଳ, ହଳଦିଆ, ବାଇଗଣୀ, ଧଳା ଏବଂ ଅନ୍ୟାନ୍ୟ ରଙ୍ଗ ମଧ୍ୟ ଦେଖାଇପାରେ।

ଆମେ ଚାହୁଁଛୁ ଯେ ସ୍କ୍ରିନ୍‌କୁ ଟାପ୍ କଲେ ଭିନ୍ନ ଭିନ୍ନ ରଙ୍ଗ ମଧ୍ୟରେ ପରିବର୍ତ୍ତନ ହେଉ। ଏହି ରଙ୍ଗଗୁଡ଼ିକୁ ଆମେ ଗୋଟିଏ array ମଧ୍ୟରେ ରଖି ସମାନଭାବେ ପରିଚାଳନା କରିପାରିବୁ:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Array “ଏକେ ପ୍ରକାରର ତଥ୍ୟର ଗୋଟିଏ ଦଳ” ସଂରକ୍ଷଣ କରିବା ପାଇଁ ଉପଯୁକ୍ତ। ଏଠାରେ array ର ପ୍ରତ୍ୟେକ element ହେଉଛି ଗୋଟିଏ `Color`।

ଯଦି ଆମେ ନିର୍ଦ୍ଧିଷ୍ଟ ଗୋଟିଏ ରଙ୍ଗ ଦେଖାଇବାକୁ ଚାହୁଁ, ତେବେ index ବ୍ୟବହାର କରିପାରିବୁ:

```swift
colors[0]
```

ଏହାର ଅର୍ଥ ହେଉଛି array ର `0` index ରେ ଥିବା ରଙ୍ଗକୁ ପଢ଼ିବା, ଅର୍ଥାତ୍ ପ୍ରଥମ ରଙ୍ଗ।

ଏବେ କୋଡ୍ ଏହିପରି ଲେଖିହେବ:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

ଏହିପରି କଲେ, ସ୍କ୍ରିନ୍ array ର ପ୍ରଥମ ରଙ୍ଗ, ଅର୍ଥାତ୍ ଲାଲ ରଙ୍ଗ, ଦେଖାଇବ।

### index ଦ୍ୱାରା ରଙ୍ଗ ନିୟନ୍ତ୍ରଣ କରିବା

ଯଦି ଆମକୁ ଭିନ୍ନ ଭିନ୍ନ ରଙ୍ଗ ମଧ୍ୟରେ ବଦଳ କରିବାକୁ ପଡ଼େ, ତେବେ index କୁ ସିଧା ଲେଖିବା ପରିବର୍ତ୍ତେ ଏହାକୁ ପରିଚାଳନା କରିବା ପାଇଁ ଗୋଟିଏ variable ଦରକାର।

Index ସଂରକ୍ଷଣ କରିବା ପାଇଁ `@State` ବ୍ୟବହାର କରି ଗୋଟିଏ variable ଘୋଷଣା କରିପାରିବୁ:

```swift
@State private var index = 0
```

ଏଠାରେ `index` ବର୍ତ୍ତମାନର ରଙ୍ଗର index କୁ ଦର୍ଶାଏ।

`index` ପରିବର୍ତ୍ତନ ହେଲେ, SwiftUI ଇଣ୍ଟରଫେସ୍‌କୁ ପୁଣିଥରେ ଗଣନା କରି ପ୍ରଦର୍ଶିତ ବିଷୟବସ୍ତୁକୁ update କରେ।

ତାପରେ ପୁରୁଣା `colors[0]` କୁ ବଦଳାଇ ଏହା ଲେଖିବା:

```swift
colors[index]
```

ଏହିପରି ଭାବେ, view ରେ ଦେଖାଯାଉଥିବା ରଙ୍ଗ `index` ଦ୍ୱାରା ନିର୍ଦ୍ଧାରିତ ହେବ।

ଏବେ କୋଡ୍ ଏହିପରି ହେବ:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

`index` ବଦଳିଲେ, `colors[index]` ମଧ୍ୟ ଅନ୍ୟ ରଙ୍ଗ ଦେଖାଇବ।

ଉଦାହରଣ:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

ଧ୍ୟାନ ଦେବାକୁ ପଡ଼ିବା ଯୋଗ୍ୟ କଥା ହେଉଛି `index` array ର ସର୍ବାଧିକ index କୁ ଅତିକ୍ରମ କରିବାକୁ ହୁଏ ନାହିଁ, ନହେଲେ out-of-range error ହେବ।

## ଟାପ୍ gesture

ଏବେ ଆମେ `index` ଅନୁସାରେ ଭିନ୍ନ ଭିନ୍ନ ରଙ୍ଗ ଦେଖାଇପାରୁଛୁ, କିନ୍ତୁ ଏପର୍ଯ୍ୟନ୍ତ ଟାପ୍ କରି ରଙ୍ଗ ବଦଳାଇ ପାରୁନାହିଁ।

ପୂର୍ବରୁ “Quote Carousel” ପାଠରେ, quote ବଦଳାଇବା ପାଇଁ ଆମେ `Button` ବ୍ୟବହାର କରିଥିଲୁ।

କିନ୍ତୁ ଏଥର, ଆମେ “ସମଗ୍ର ରଙ୍ଗିନ ଅଞ୍ଚଳକୁ ଟାପ୍” କରି ରଙ୍ଗ ବଦଳାଇବାକୁ ଚାହୁଁଛୁ, ତେଣୁ `onTapGesture` ଅଧିକ ଉପଯୁକ୍ତ।

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

ଆମେ ରଙ୍ଗ view ଉପରେ ଟାପ୍ କଲେ, ଏହି କୋଡ୍ ଚାଲିବ:

```swift
index += 1
```

ଏହାର ଅର୍ଥ `index` କୁ `1` ବଢ଼ାଇବା। Index ବଢ଼ିଗଲେ, `colors[index]` array ର ପରବର୍ତ୍ତୀ ରଙ୍ଗକୁ ଦେଖାଇବ।

### `onTapGesture`

`onTapGesture` ହେଉଛି ଗୋଟିଏ gesture modifier, ଯାହା ଗୋଟିଏ view ରେ tap action ଯୋଡ଼େ।

ମୌଳିକ ବ୍ୟବହାର:

```swift
.onTapGesture {
    // code
}
```

ଉଦାହରଣ:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

ଏହି ଲାଲ view କୁ ଟାପ୍ କଲେ, braces ଭିତରର କୋଡ୍ ଚାଲିବ ଏବଂ console ରେ ଏହା ଦେଖାଯିବ:

```swift
Click color
```

`onTapGesture` ଦ୍ୱାରା ଆମେ ଗୋଟିଏ view ଟାପ୍ ହେବା ପରେ କ’ଣ ହେବ ସେଥିକେ ନିର୍ଦ୍ଧାରଣ କରିପାରିବୁ।

### `Button` ସହିତ ପାର୍ଥକ୍ୟ

ପୂର୍ବରୁ ଆମେ `Button` view ବିଷୟରେ ଶିଖିଥିଲୁ। `Button` ଏବଂ `onTapGesture` ଦୁହେଁ tap actions କୁ handle କରିପାରେ, କିନ୍ତୁ ସେମାନଙ୍କର ବ୍ୟବହାର ପରିସ୍ଥିତି ସଂପୂର୍ଣ୍ଣ ଏକରୂପ ନୁହେଁ।

`onTapGesture` “ଏକ ଆଗରୁ ଥିବା view ରେ tap functionality ଯୋଡ଼ିବା” ପାଇଁ ଅଧିକ ଉପଯୁକ୍ତ, ଯେପରି `Color`, `Image`, `Text`, କିମ୍ବା ଅନ୍ୟ ସାଧାରଣ view।

ଅନ୍ୟପଟେ, `Button` “Confirm”, “Submit”, କିମ୍ବା “Delete” ପରି ସ୍ପଷ୍ଟ ଏକ button ଦର୍ଶାଇବା ପାଇଁ ଅଧିକ ଉପଯୁକ୍ତ।

ଏହି ଫିଲ୍ ଲାଇଟ୍ ଆପ୍‌ରେ, ଆମେ ଚାହୁଁଛୁ ଯେ ରଙ୍ଗ ବଦଳାଇବାର କାର୍ଯ୍ୟଟି ଅଧିକ ସରଳ ହେଉ। ସମଗ୍ର ରଙ୍ଗିନ ଅଞ୍ଚଳକୁ ଟାପ୍ କଲେ ରଙ୍ଗ ବଦଳିଯାଉଥିବାରୁ, ଏଠାରେ `onTapGesture` ଭଲ ପସନ୍ଦ।

## index ସମସ୍ୟା

ଏବେ ଆମେ ସ୍କ୍ରିନ୍‌କୁ ଟାପ୍ କରି ଭିନ୍ନ ଭିନ୍ନ ରଙ୍ଗ ମଧ୍ୟରେ ବଦଳ କରିପାରୁଛୁ।

କିନ୍ତୁ ଏଠାରେ ଗୋଟିଏ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ସମସ୍ୟା ଅଛି: **index array ର ସୀମା ଅତିକ୍ରମ କରିପାରେ**।

ଉଦାହରଣ:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

ଆମେ ସ୍କ୍ରିନ୍‌କୁ ପୁନଃପୁନି ଟାପ୍ କରିଚାଲିଲେ, `index` ଶେଷରେ `4` ହେବ, ଏବଂ ସେତେବେଳେ “index out of range” error ଆସିବ।

ଏହାର କାରଣ `colors` array ରେ `4`ଟି element ଥିଲେ ମଧ୍ୟ, indexing `0` ରୁ ଆରମ୍ଭ ହୁଏ, ତେଣୁ valid index range ହେଉଛି `0 - 3`, `4` ନୁହେଁ।

ଯଦି `colors[4]` କୁ access କରିବା, “index out of range” error ହେବ।

ବର୍ତ୍ତମାନ କୋଡ୍‌ରେ, ପ୍ରତ୍ୟେକ tap `index` କୁ ସ୍ୱୟଂଚାଳିତଭାବରେ `1` ବଢ଼ାଏ। ଏହାକୁ ଆମେ handle ନ କଲେ, ଶେଷରେ ଏହା ସୀମା ଛାଡ଼ିଯିବ।

ତେଣୁ, ସ୍କ୍ରିନ୍‌କୁ ଟାପ୍ କଲାବେଳେ ଆମେ index କୁ ଯାଞ୍ଚ କରିବା ଦରକାର: ଯଦି ଏହା ଶେଷ ରଙ୍ଗ ହୋଇଥାଏ, ତେବେ ପ୍ରଥମ ରଙ୍ଗକୁ ଫେରିଯିବ; ନହେଲେ `1` ଯୋଡ଼ିଚାଲିବ।

ଏହାକୁ `if` statement ଦ୍ୱାରା କରିହେବ:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

ଏହି କୋଡ୍‌ରେ, `colors.count` ଅର୍ଥ array ର element ସଂଖ୍ୟା।

ବର୍ତ୍ତମାନର array ରେ 4ଟି ରଙ୍ଗ ଅଛି, ସେହିପରି:

```swift
colors.count // 4
```

କିନ୍ତୁ ସର୍ବାଧିକ index `4` ନୁହେଁ, `3`, କାରଣ indexing `0` ରୁ ଆରମ୍ଭ ହୁଏ।

ତେଣୁ ଶେଷ index ଏଭଳି ଲେଖିବାକୁ ପଡ଼େ:

```swift
colors.count - 1
```

ଅର୍ଥାତ୍:

```swift
4 - 1 = 3
```

ଏହି logic ର ଅର୍ଥ ହେଉଛି: ଯଦି ବର୍ତ୍ତମାନର index ଆଗୁଅଠାରୁ ଶେଷ ରଙ୍ଗକୁ ସୂଚାଉଛି, ତେବେ index କୁ `0` କର; ନହେଲେ `1` ବଢ଼ା।

ଏହିପରି ରଙ୍ଗଗୁଡ଼ିକ ଚକ୍ରାକାରରେ ବଦଳିବ।

### index logic କୁ ଆହୁରି ସହଜ କରିବା

କୋଡ୍‌କୁ ଆଉ ସଂକ୍ଷିପ୍ତ କରିବାକୁ ଚାହିଲେ, ternary operator ମଧ୍ୟ ବ୍ୟବହାର କରିପାରିବୁ:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

ଏହି କୋଡ୍‌ର ଅର୍ଥ: `index == colors.count - 1` ଠିକ୍ ଥାଇଲେ `0` ଫେରାଇବ। ନହେଲେ `index + 1` ଫେରାଇବ।

ଶେଷରେ, ଏହି ଫଳାଫଳକୁ ପୁଣି `index` କୁ assign କରାଯାଏ।

ଏବେ ଆମେ ରଙ୍ଗ ବଦଳିବା effect କୁ ସକ୍ରିୟ କରିପାରିବୁ।

ପୂର୍ଣ୍ଣ କୋଡ୍:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

ଏବେ ଆମେ ସ୍କ୍ରିନ୍‌କୁ ଟାପ୍ କରି ଭିନ୍ନ ଭିନ୍ନ ରଙ୍ଗ ମଧ୍ୟରେ ବଦଳ କରିପାରିବୁ। ଏକ ମୌଳିକ ଫିଲ୍ ଲାଇଟ୍ ଆପ୍ ତିଆରି ହୋଇଗଲା।

## ରଙ୍ଗର ନାମ ଦେଖାଇବା

ରଙ୍ଗମାନଙ୍କ ସହିତ ସମ୍ବନ୍ଧିତ ଆଉ ଗୋଟିଏ text group ଯୋଡ଼ିପାରିବୁ, ଯାହାଫଳରେ ରଙ୍ଗ ବଦଳିଲେ ସ୍କ୍ରିନ୍‌ରେ ବର୍ତ୍ତମାନ ରଙ୍ଗର ନାମ ମଧ୍ୟ ଦେଖାଯିବ।

ଉଦାହରଣ:

- ଲାଲ ହେଲେ `Red`
- ନୀଳ ହେଲେ `Blue`
- ହଳଦିଆ ହେଲେ `Yellow`
- ବାଇଗଣୀ ହେଲେ `Purple`

ଏଠି ମଧ୍ୟ ଆମେ ରଙ୍ଗର ନାମଗୁଡ଼ିକ ସଂରକ୍ଷଣ କରିବା ପାଇଁ ଏକ array ବ୍ୟବହାର କରିପାରିବୁ:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

ଏହି array ରେ ଥିବା text ର କ୍ରମ, ରଙ୍ଗର array ର କ୍ରମ ସହିତ ଠିକ୍ ମେଳ ହେବା ଉଚିତ।

ତାପରେ, ବର୍ତ୍ତମାନର index ଅନୁସାରେ ରଙ୍ଗର ନାମ ଦେଖାଇବା ପାଇଁ `Text` ବ୍ୟବହାର କରିପାରିବୁ:

```swift
Text(colorsName[index])
```

`Text` `index` ଅନୁଯାୟୀ ବର୍ତ୍ତମାନର ରଙ୍ଗର ନାମ ଦେଖାଏ।

`Text` ର ଦୃଶ୍ୟକୁ ଭଲ କରିବା ପାଇଁ modifiers ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

ଏଥିରେ `Text` ଧଳା ରଙ୍ଗରେ, title size ସହିତ, ଏବଂ bold font weight ରେ ଦେଖାଯିବ।

ଏବେ ଆମ ପାଖରେ full-screen `Color` view ଅଛି। ଯଦି `Text` କୁ `Color` view ର ଉପରେ ଦେଖାଇବାକୁ ଚାହୁଁ, ତେବେ ଦୁଇଟିକୁ ଏକାଅପରେ ରଖିବା ପାଇଁ `ZStack` layout container ବ୍ୟବହାର କରିବାକୁ ପଡ଼ିବ।

```swift
ZStack {
    Color
    Text
}
```

ତେଣୁ କୋଡ୍ ଏଭଳି ହୁଏ:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

ଏହିପରି ପଛପଟରେ ରଙ୍ଗର view ରହିବ, ଏବଂ ତାହାର ଉପରେ text view ଲେୟର୍ ହୋଇ ଦେଖାଯିବ।

ଫଳାଫଳ:

![Color](../../Resource/018_color2.png)

ଧ୍ୟାନ ଦେବାକୁ ପଡ଼ିବା କଥା ହେଉଛି, `ZStack` ରେ ପରେ ଲେଖାଯାଇଥିବା view ସାଧାରଣତଃ ସାମ୍ନାରେ ଦେଖାଯାଏ। ଯଦି `Text` କୁ `Color` ପୂର୍ବରୁ ଲେଖାଯାଏ, ପରବର୍ତ୍ତୀ `Color` view `Text` କୁ ଢାକିଦେଇପାରେ।

## ବ୍ରାଇଟନେସ୍ ନିୟନ୍ତ୍ରଣ

ଏବେ ଆମେ ଭିନ୍ନ ଭିନ୍ନ ରଙ୍ଗ ବଦଳାଇପାରୁଛୁ, କିନ୍ତୁ ଫିଲ୍ ଲାଇଟ୍‌ର ଆଉ ଗୋଟିଏ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ବିଶେଷତା ଅଛି: **ବ୍ରାଇଟନେସ୍ ସମଯୋଜନ କରିବା**।

SwiftUI ରେ, view ର brightness ସମଯୋଜନ କରିବା ପାଇଁ `brightness` modifier ବ୍ୟବହାର କରିପାରିବୁ।

ଉଦାହରଣ:

```swift
.brightness(1)
```

ଆମେ ଏଭଳି ଲେଖିପାରିବୁ:

```swift
colors[index]
    .brightness(0.5)
```

ଏହା ବର୍ତ୍ତମାନର ରଙ୍ଗକୁ ଅଧିକ ଉଜ୍ଜ୍ୱଳ କରେ, ଏବଂ ଏହାକୁ ଫିଲ୍ ଲାଇଟ୍ ପ୍ରଭାବ ସହିତ ଆଉ ନିକଟ କରେ।

ବ୍ରାଇଟନେସ୍‌ର range `0 - 1` ଅଟେ। `0` ର ଅର୍ଥ ମୂଳ ରଙ୍ଗକୁ ଅବିକଳ ରଖିବା, ଏବଂ value `1` ପାଖକୁ ଯେତେ ନିକଟ ହେବ, ରଙ୍ଗ ସେତେ ଉଜ୍ଜ୍ୱଳ ହେବ। `1` ର ଅର୍ଥ ସବୁଠାରୁ ଉଜ୍ଜ୍ୱଳ ଧଳା ପରିଣାମ।

ଆମେ କୋଡ୍‌ରେ `brightness` କୁ ନିୟନ୍ତ୍ରଣ କରିପାରୁଥିଲେ ମଧ୍ୟ, ବ୍ୟବହାରକାରୀ ଏହାକୁ ସିଧାସଳଖ ନିଜେ ନିୟନ୍ତ୍ରଣ କରିପାରୁନାହାନ୍ତି।

ସେଥିପାଇଁ ଆମେ ଗୋଟିଏ drag କରିପାରିବା control ଯୋଡ଼ିବାକୁ ପଡ଼ିବ: `Slider`।

## `Slider` view

SwiftUI ରେ, `Slider` ହେଉଛି ଗୋଟିଏ control ଯାହା ଗୋଟିଏ ନିର୍ଦ୍ଧିଷ୍ଟ range ଭିତରେ value ବାଛିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। Apple ଏହାକୁ “ସୀମାବଦ୍ଧ ଲିନିୟର୍ ରେଞ୍ଜରୁ ମୂଲ୍ୟ ବାଛିବା ପାଇଁ control” ବୋଲି ବର୍ଣ୍ଣନା କରେ।

ମୌଳିକ ବ୍ୟବହାର:

```swift
Slider(value: $value, in: 0...1)
```

ପାରାମିଟର ବ୍ୟାଖ୍ୟା:

1. `value: $value`: `Slider` କୁ ଗୋଟିଏ variable ସହିତ bind କରିବାକୁ ପଡ଼େ।

    ସ୍ଲାଇଡର୍ ଟାଣାଯାଇଲେ, variable ର value ମଧ୍ୟ ସେହି ସମୟରେ ବଦଳେ। ପୁଣି, variable ବଦଳିଲେ slider ମଧ୍ୟ update ହୁଏ।

    ଏହା ଆମେ ପୂର୍ବରୁ ଶିଖିଥିବା `TextField` ସହ ବହୁତ ସମାନ। ଦୁହେଁ “control କୁ variable ସହିତ bind କରନ୍ତି”।

    Binding ଦର୍ଶାଇବା ପାଇଁ bind ହୋଇଥିବା variable ର ଆଗରେ `$` ଚିହ୍ନ ଲଗାଇବାକୁ ପଡ଼େ।

2. `in: 0...1`: ଏହି parameter slider ର value range କୁ ଦର୍ଶାଏ।

    ଏଠାରେ `0...1` ର ଅର୍ଥ minimum value `0` ଏବଂ maximum value `1`।

    Slider କୁ ସମ୍ପୂର୍ଣ୍ଣ ବାମଦିଗକୁ ଟାଣିଲେ, bind ହୋଇଥିବା variable `0` ର ନିକଟରେ ଥାଏ; ସମ୍ପୂର୍ଣ୍ଣ ଡାହାଣକୁ ଟାଣିଲେ ଏହା `1` ର ନିକଟରେ ଥାଏ।

ଉଦାହରଣ:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` `value` variable ସହିତ bind ହୋଇଛି। Slider କୁ ଟାଣିଲେ `value` variable ର ମୂଲ୍ୟ ମଧ୍ୟ ସେହି ସମୟରେ ବଦଳିଯାଏ।

ଦୃଶ୍ୟ:

![Slider](../../Resource/018_slider.png)

`Slider` କୁ ବାମକୁ ନେଲେ bind ହୋଇଥିବା `value` `0` ହେବ। ଡାହାଣକୁ ନେଲେ ଏହା `1` ହେବ।

### value range

`Slider` ର value range ସ୍ଥାୟୀ ନୁହେଁ। ଏହାକୁ ଏଭଳି ମଧ୍ୟ ଲେଖିପାରିବ:

```swift
0...100
```

କିମ୍ବା ଅନ୍ୟ କୌଣସି range।

କିନ୍ତୁ ଏହି ଫିଲ୍ ଲାଇଟ୍ ଆପ୍‌ରେ ବ୍ରାଇଟନେସ୍ ନିୟନ୍ତ୍ରଣ କରିବା ଦରକାର, ସେଥିପାଇଁ `0...1` ସବୁଠାରୁ ଭଲ ପସନ୍ଦ।

## `Slider` ବ୍ୟବହାର କରି ବ୍ରାଇଟନେସ୍ ନିୟନ୍ତ୍ରଣ

ଏବେ `Slider` କୁ `brightness` ସହିତ ଯୋଡ଼ିବା ଦରକାର।

ପ୍ରଥମେ, ବ୍ରାଇଟନେସ୍ ମୂଲ୍ୟ ସଂରକ୍ଷଣ ପାଇଁ ଗୋଟିଏ variable ସୃଷ୍ଟି କରନ୍ତୁ:

```swift
@State private var slider = 0.0
```

ଏଠାରେ `0.0` ଗୋଟିଏ `Double` ପ୍ରକାରର ମୂଲ୍ୟ।

କାରଣ `Slider` ସାଧାରଣତଃ numeric type ସହିତ bind ହୁଏ, ଏବଂ ଏଠାରେ ଆମେ ଚାହୁଁଛୁ ଯେ ଏହା ଅବିରତ ଭାବେ ବଦଳୁ, ସେଥିପାଇଁ `Double` ଅଧିକ ଉପଯୁକ୍ତ। ତାସହ `brightness` କେବଳ `Double` ପ୍ରକାରର value ଗ୍ରହଣ କରେ।

ତାପରେ ଏହି value କୁ `brightness` ରେ ପଠାନ୍ତୁ:

```swift
colors[index]
    .brightness(slider)
```

`slider == 0` ହେଲେ, ରଙ୍ଗ ତାର default ଅବସ୍ଥାରେ ରହିଥାଏ। `slider` `1` ର ଯେତେ ନିକଟରେ ରହିବ, ରଙ୍ଗ ସେତେ ଅଧିକ ଉଜ୍ଜ୍ୱଳ ଦେଖାଯିବ।

### `Slider` control ଯୋଡ଼ିବା

ପରବର୍ତ୍ତୀତ, ଏହି variable କୁ ବଦଳାଇବା ପାଇଁ `Slider` control ଯୋଡ଼ନ୍ତୁ:

```swift
Slider(value: $slider, in: 0...1)
```

ସ୍ଲାଇଡର୍ ବଦଳିଲେ, `slider` ର value ମଧ୍ୟ ବଦଳେ, ଏବଂ `brightness(slider)` ସେହି ସମୟରେ ବ୍ରାଇଟନେସ୍ update କରେ।

ଏହା SwiftUI ର “variable ଦ୍ୱାରା view ଚାଲିଥାଏ” ବୋଲି ଧାରଣାର ଗୋଟିଏ ଖୁବ ସାଧାରଣ ଉଦାହରଣ।

### `Slider` ର ଦୃଶ୍ୟ ସମଯୋଜନ

ଡିଫଲ୍ଟ ଭାବରେ, `Slider` ଉପଲବ୍ଧ ପୂରା ଚଉଡ଼ା ବ୍ୟବହାର କରେ।

ଆମେ ଏହାକୁ ଗୋଟିଏ ନିଶ୍ଚିତ ଚଉଡ଼ା ଦେଇପାରିବୁ:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

ତାପରେ ଆଉ କିଛି modifiers ଯୋଡ଼ନ୍ତୁ ଯେପରି ଏହା ଆହୁରି ସ୍ପଷ୍ଟ ଦେଖାଯାଉ:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

ଏହା slider କୁ ଧଳା background ଏବଂ ଗୋଲାକାର କୋଣା ଦିଏ, ଯାହାଦ୍ୱାରା ଏହା `Color` view ଉପରେ ଆହୁରି ସ୍ପଷ୍ଟ ହୁଏ।

ଶେଷରେ, ଏହାକୁ ସ୍କ୍ରିନ୍‌ର ତଳଭାଗରେ ରଖନ୍ତୁ।

ଆମେ ପୂର୍ବରୁ `ZStack` ବ୍ୟବହାର କରୁଥିବାରୁ, ଏହାର ଭିତରେ `VStack` ରଖି `Spacer()` ବ୍ୟବହାର କରି `Slider` କୁ ତଳକୁ ଠେଲିପାରିବୁ।

## ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

ଫଳାଫଳ:

![Color](../../Resource/018_color.png)

## ସାରାଂଶ

ଆଗରୁ ଶିଖିଥିବା ଜ୍ଞାନ ସହିତ ଏବଂ ରଙ୍ଗ, array ପରି ମୌଳିକ ଧାରଣାଗୁଡ଼ିକୁ ବ୍ୟବହାର କରି, ଆମେ ବହୁତ ଆକର୍ଷଣୀୟ ଫିଲ୍ ଲାଇଟ୍ ଆପ୍ ତିଆରି କଲୁ।

ଏହି ଫିଲ୍ ଲାଇଟ୍ ଆପ୍ ଦ୍ୱାରା, `brightness` ବ୍ୟବହାର କରି ବ୍ରାଇଟନେସ୍ ସମଯୋଜନ କରିବା, `onTapGesture` ବ୍ୟବହାର କରି view ଗୁଡ଼ିକୁ tap actions ଯୋଡ଼ିବା, ଏବଂ `Slider` control ବ୍ୟବହାର କରିବା ଆମେ ଶିଖିଲୁ।

ରଙ୍ଗ ବଦଳାଇବା ପାଇଁ ଆମେ `Color` view ରେ `onTapGesture` ଯୋଡ଼ିଲୁ। `brightness` କୁ manage କରୁଥିବା variable କୁ ବଦଳାଇବା ପାଇଁ `Slider` control ମଧ୍ୟ ବ୍ୟବହାର କଲୁ, ଯାହା “variable ଦ୍ୱାରା view ଚାଲିଥାଏ” ବୋଲି ଧାରଣାର ଆଉ ଗୋଟିଏ ଉଦାହରଣ।

ଆମେ ternary operator କୁ ମଧ୍ୟ ପୁନରାବୃତ୍ତି କରିଲୁ, view ଗୁଡ଼ିକୁ ଏକାଅପରେ ଦେଖାଇବା ପାଇଁ `ZStack` ବ୍ୟବହାର କଲୁ, ଏବଂ ଏକେ ପ୍ରକାରର data group କୁ manage କରିବା ପାଇଁ array ବ୍ୟବହାର କଲୁ। ଏଥିରେ array ଏବଂ index ବିଷୟରେ ଆମର ବୁଝାମଣା ଆହୁରି ଗଭୀର ହୁଏ, ବିଶେଷକରି out-of-range error ଏଡ଼ାଇବାର ପ୍ରାୟୋଗିକ ପ୍ରଶ୍ନରେ।

ଏହି ଉଦାହରଣ ବହୁତ ଜଟିଳ ନୁହେଁ, କିନ୍ତୁ ଏହା ଆଗରୁ ଶିଖିଥିବା ଅନେକ ମୌଳିକ ଧାରଣାକୁ ଏକେସାଥେ ଯୋଡ଼େ। ସେଗୁଡ଼ିକୁ ଗୋଟିଏ ଛୋଟ ପ୍ରକୃତ ପ୍ରୋଜେକ୍ଟରେ ବ୍ୟବହାର କଲେ, ପ୍ରତ୍ୟେକ ଧାରଣା କାହିଁକି ଦରକାର ସେଥିକି ଅଧିକ ସହଜରେ ବୁଝିହେବ।

### ପ୍ରାକୃତିକ ବ୍ୟବହାର ପରିସ୍ଥିତି

କଳ୍ପନା କରନ୍ତୁ, ଆପଣ ଗୋଟିଏ ପୁରୁଣା iPhone କୁ ଟେବୁଲ୍ ଉପରେ ରଖି, ଆପଣ ନିଜେ ତିଆରି କରିଥିବା ଫିଲ୍ ଲାଇଟ୍ ଆପ୍‌ରେ ଆଲୋକର ରଙ୍ଗକୁ ନିୟନ୍ତ୍ରଣ କରୁଛନ୍ତି। ଏହା ଏକ ଖୁବ ଭଲ ଅନୁଭବ ହେବ।

App Store ରେ ଅନେକ “ଫିଲ୍ ଲାଇଟ୍” ଆପ୍ ଅଛି, ଏବଂ ସେମାନେ ମଧ୍ୟ ଖୁବ ଜଟିଳ ଲାଗୁନଥାନ୍ତି।

![AppStore](../../Resource/018_appStore.PNG)

ଆମେ ସରଳ ଆପ୍‌ଗୁଡ଼ିକୁ ନିର୍ମାଣ କରି ଆରମ୍ଭ କରିପାରିବୁ, ଏବଂ ସେଗୁଡ଼ିକୁ App Store ରେ ପ୍ରକାଶ କରିବାକୁ ଚେଷ୍ଟା କରିପାରିବୁ। ଏହା କେବଳ ବିକାଶ ପ୍ରତି ଆଗ୍ରହ ବଢ଼ାଏ ନୁହେଁ, ଆମର ବୃଦ୍ଧିର ଯାତ୍ରାକୁ ମଧ୍ୟ ରେକର୍ଡ କରେ।

### ପାଠ ପରବର୍ତ୍ତୀ ଅଭ୍ୟାସ

ଏହି ଫିଲ୍ ଲାଇଟ୍ ଆପ୍‌କୁ ଆଉ କିପରି ବିସ୍ତାର କରିହେବ, ସେଥିପାଇଁ ଆପଣ ଭାବିଚାଲିପାରିବେ, ଯେପରି:

- ଆଉ ଅଧିକ ରଙ୍ଗ ଯୋଡ଼ନ୍ତୁ
- ବର୍ତ୍ତମାନର ବ୍ରାଇଟନେସ୍ ମୂଲ୍ୟ ଦେଖାନ୍ତୁ
- ତଳର slider ଅଞ୍ଚଳର ଡିଜାଇନ୍‌କୁ ଆଉ ସୁନ୍ଦର କରନ୍ତୁ

ଆପଣ ଯେତେବେଳେ ଏହି ଜ୍ଞାନକୁ ସତ୍ୟରେ ବ୍ୟବହାର କରିବାକୁ ଆରମ୍ଭ କରିବେ, ତେବେ ଆପଣ ଦେଖିବେ ଯେ ଆମେ ଶିଖୁଥିବା ପ୍ରତ୍ୟେକ ଧାରଣା ବାସ୍ତବରେ ଆପ୍ ତିଆରି କରିବାର ଗୋଟିଏ ଉପକରଣ।

ଆମେ ଯେତେ ଅଧିକ ଉପକରଣ ଆତ୍ମସାତ୍ କରିବୁ, ସେତେ ଅଧିକ ବୈଶିଷ୍ଟ୍ୟ ତିଆରି କରିପାରିବୁ।
