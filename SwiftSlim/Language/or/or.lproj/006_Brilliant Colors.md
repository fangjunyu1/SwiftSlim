# ରଙ୍ଗର ଚମକ

ଏହି ପାଠରେ ଆମେ SwiftUI ରେ ସାଧାରଣ ଭାବେ ବ୍ୟବହୃତ visual modifier ଗୁଡିକୁ ଶିଖିବୁ, ଯାହାରେ ଅନ୍ତର୍ଭୁକ୍ତ ଅଛି:

- ରଙ୍ଗ
- ପୂର୍ବଭାଗ ରଙ୍ଗ
- ପୃଷ୍ଠଭୂମି ରଙ୍ଗ
- offset
- ପାରଦର୍ଶିତା
- blur

ସେଥିସହିତ ଆମେ Safe Area（ସୁରକ୍ଷିତ ଅଞ୍ଚଳ）ମଧ୍ୟ ଶିଖିବୁ।

ଏହି modifier ଗୁଡିକ view ର ଦୃଶ୍ୟମାନ ଆକୃତିକୁ ନିୟନ୍ତ୍ରଣ କରିବାପାଇଁ ବ୍ୟବହୃତ ହୁଏ, ଯାହା ଫଳରେ interface ଆଉ ଅଧିକ ସ୍ପଷ୍ଟ ଏବଂ ସ୍ତରୀୟ ହୁଏ।

## ରଙ୍ଗ

SwiftUI ରେ, ଟେକ୍ସ୍ଟର ରଙ୍ଗ ସେଟ୍ କରାଯାଇପାରେ।

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
````

.blue ର ଅର୍ଥ ହେଉଛି ନୀଳ ରଙ୍ଗ। ଏହା ବାସ୍ତବରେ Color.blue ର ସରଳ ଲେଖାରୂପ（type inference）ଅଟେ।

ସାଧାରଣ ରଙ୍ଗଗୁଡିକ ହେଲେ:

```id="colors-common"
.black
.green
.yellow
.pink
.gray
...
```

ଏଗୁଡିକ ସବୁ Color ର static property ଅଟେ।

![Color](../../RESOURCE/006_color.png)

ଆପଣ Color କୁ ଗୋଟିଏ ରଙ୍ଗ ପ୍ରକାର ଭାବେ ବୁଝିପାରନ୍ତି, ଏବଂ .blue、.red ହେଉଛି ଏହାର ନିର୍ଦ୍ଦିଷ୍ଟ ରଙ୍ଗ।

### Color view

SwiftUI ରେ, Color ମଧ୍ୟ ଗୋଟିଏ view ଭାବରେ ଦେଖାଯାଇପାରେ।

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

ଏହି କୋଡ୍ 100×100 ଆକାରର ଗୋଟିଏ ଲାଲ୍ ବର୍ଗ ତିଆରି କରିବ।

ସମଗ୍ର interface କୁ ମଧ୍ୟ ଗୋଟିଏ ନିର୍ଦ୍ଦିଷ୍ଟ ରଙ୍ଗରେ ଦେଖାଯାଇପାରେ:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Run କରିବା ପରେ, ଆପଣ ଦେଖିବେ ଯେ ଲାଲ୍ ରଙ୍ଗ ସମଗ୍ର screen କୁ ପୂରା ଭରିନାହିଁ, iPhone ର ଉପର ଏବଂ ତଳ ଅଂଶ ଏହିପର୍ଯ୍ୟନ୍ତ ସଫେଦ ରହିଛି। ଏଠାରେ Safe Area（ସୁରକ୍ଷିତ ଅଞ୍ଚଳ）ର ଅସ୍ତିତ୍ୱ ସମ୍ପୃକ୍ତ ଅଛି।

## Safe Area（ସୁରକ୍ଷିତ ଅଞ୍ଚଳ）

Safe Area ହେଉଛି ସିଷ୍ଟମ୍ ଦ୍ୱାରା ସେହି ଅଞ୍ଚଳ ଯାହା content ଢାକିଯିବାକୁ ବାରଣ କରିବା ପାଇଁ ରଖାଯାଇଛି। ଏଥିରେ ଅନ୍ତର୍ଭୁକ୍ତ ଅଛି:

1. ଉପର ଭାଗର status bar（ସମୟ, battery）

2. ତଳ ଭାଗର Home indicator bar

3. notch କିମ୍ବା Dynamic Island ଅଞ୍ଚଳ

![Color](../../RESOURCE/006_color3.png)

SwiftUI default ଭାବରେ content କୁ safe area ମଧ୍ୟରେ ସୀମିତ ରଖେ, ତେଣୁ view screen ର ଧାର ପର୍ଯ୍ୟନ୍ତ ବିସ୍ତାରିତ ହୁଏନାହିଁ।

### Safe Area କୁ ignore କରିବା

ଯଦି ଆପଣ ରଙ୍ଗକୁ ସମଗ୍ର screen ଉପରେ ଭରିବାକୁ ଚାହୁଁଛନ୍ତି, ignoresSafeArea ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Color.red
    .ignoresSafeArea()
```

କିମ୍ବା edgesIgnoringSafeArea ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

ଏହିପରି କଲେ view ସମଗ୍ର screen ଉପରେ ବିସ୍ତାରିତ ହେବ।

ଏଠାରେ ଧ୍ୟାନ ଦେବାକୁ ଥିବା କଥା ହେଉଛି, edgesIgnoringSafeArea ପୁରୁଣା ଲେଖାରୂପ ଅଟେ। iOS 14 ଠାରୁ ignoresSafeArea ବ୍ୟବହାର କରିବାକୁ ଅଧିକ ପରାମର୍ଶ ଦିଆଯାଏ।

## ପୂର୍ବଭାଗ ରଙ୍ଗ

### foregroundStyle modifier

ପୂର୍ବରୁ ଆମେ foregroundStyle ବ୍ୟବହାର କରି ରଙ୍ଗ ସେଟ୍ କରିବା ଶିଖିଥିଲୁ।

ଉଦାହରଣ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle ହେଉଛି ନୂତନ style system, ଯାହା ରଙ୍ଗ, gradient, material ଇତ୍ୟାଦିକୁ support କରେ।

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier

foregroundColor ଦ୍ୱାରା ମଧ୍ୟ ରଙ୍ଗ ସେଟ୍ କରାଯାଇପାରେ:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

ଏହାର ବ୍ୟବହାର foregroundStyle ସହିତ ସମାନ।

ନବୀନ Xcode version ରେ, Xcode ସୂଚନା ଦେଏ ଯେ foregroundColor ଭବିଷ୍ୟତ iOS version ଗୁଡିକରେ ବ୍ୟବହାରରୁ ବାହାରିଯାଇପାରେ, ସେହିପାଇଁ foregroundStyle କୁ ଅଧିକ ପ୍ରାଧାନ୍ୟ ଦେବା ଉଚିତ।

## ପୃଷ୍ଠଭୂମି

ଯଦି ଗୋଟିଏ view କୁ ପୃଷ୍ଠଭୂମି ରଙ୍ଗ ଦେବାକୁ ଚାହୁଁଛନ୍ତି, background ବ୍ୟବହାର କରନ୍ତୁ:

```swift
background(.red)
```

ଉଦାହରଣ ସ୍ୱରୂପ, ଟେକ୍ସ୍ଟକୁ ପୃଷ୍ଠଭୂମି ରଙ୍ଗ ଯୋଡିବା:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

ଆମେ Word、Chrome ଇତ୍ୟାଦି App ଗୁଡିକରେ ଟେକ୍ସ୍ଟ ଚୟନ କରିବାବେଳେ ଏହାର ସଦୃଶ ପୃଷ୍ଠଭୂମି ରଙ୍ଗ ଦେଖିପାରୁ।

![Color](../../RESOURCE/006_color16.png)

ଯଦି ଆପଣ ପୃଷ୍ଠଭୂମିକୁ ବଡ କରିବାକୁ ଚାହୁଁଛନ୍ତି, padding ସହିତ ଏହାକୁ ଯୋଡିବା ଦରକାର:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

ଏଠାରେ ଗୋଟିଏ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ନିୟମ ମନେ ରଖିବା ଦରକାର:

SwiftUI modifier ଗୁଡିକ ଉପରୁ ତଳକୁ ଯାଇ view କୁ ଗଠନ କରନ୍ତି। ପରେ ଲେଖାଯାଇଥିବା modifier ପୂର୍ବରୁ ମିଳିଥିବା ଫଳାଫଳ ଉପରେ କାମ କରେ।

ସେହିପାଇଁ:

```swift
.padding()
.background()
```

ଏହାର ଅର୍ଥ ହେଉଛି background, padding ଯୋଡାଯାଇଥିବା view କୁ ଆବରଣ କରିବ।

ଯଦି କ୍ରମକୁ ଉଲଟା ଲେଖାଯାଏ:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

ତେବେ ପୃଷ୍ଠଭୂମି ବଡ ହେବ ନାହିଁ, କାରଣ background ପରବର୍ତ୍ତୀ padding କୁ ଆବରଣ କରୁନାହିଁ।

## ଉଦାହରଣ - ଚାରିକୋଣ ନଟ୍

ଏବେ, ଆମେ ଗୋଟିଏ ସରଳ ଚାରିକୋଣ ନଟ୍ view ତିଆରି କରିବୁ।

![Color](../../RESOURCE/006_color8.png)

ପ୍ରଥମେ 50 × 50 ଆକାରର ଗୋଟିଏ ସଫେଦ ବର୍ଗ ତିଆରି କରନ୍ତୁ:

```swift
Color.white
    .frame(width: 50, height: 50)
```

ଯଦି ଏହାକୁ ଗୋଲାକାର କରିବାକୁ ଚାହୁଁଛନ୍ତି, cornerRadius ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

ଯେତେବେଳେ corner radius ମୂଲ୍ୟ width ଏବଂ height ର ଅର୍ଧ ହୁଏ, ସେତେବେଳେ ଏହା ଗୋଲାକାର ହୋଇଯାଏ।

ଏବେ, ଗୋଟିଏ ନୀଳ ପୃଷ୍ଠଭୂମି ଯୋଡନ୍ତୁ:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

ନୂତନ ଯୋଡାଯାଇଥିବା padding ବାହ୍ୟ ଅଞ୍ଚଳକୁ ବଡ କରିଦିଏ, ଏବଂ background ସେହି ବାହ୍ୟ ଅଞ୍ଚଳ ଉପରେ ନୀଳ ରଙ୍ଗ ଆକେ।

ଏବେ ଗୋଟିଏ ଚାରିକୋଣ ନଟ୍ ଦୃଶ୍ୟ ସମାପ୍ତ ହୋଇଗଲା।

### ଅନ୍ୟ ଏକ ଧାରଣା

ପୃଷ୍ଠଭୂମି ରଙ୍ଗ ବ୍ୟବହାର କରି ଚାରିକୋଣ ନଟ୍ ତିଆରି କରିବା ସହିତସହିତ, ZStack ବ୍ୟବହାର କରି ମଧ୍ୟ ଏହା କରାଯାଇପାରେ।

ଆଗରୁ ଆମେ ଶିଖିଛୁ ଯେ ZStack overlay arrangement କରିପାରେ। ଚାରିକୋଣ ନଟ୍ କୁ ମଧ୍ୟ ଗୋଟିଏ ବୃତ୍ତ ଏବଂ ଗୋଟିଏ ଆୟତର overlay ଭାବରେ ବୁଝାଯାଇପାରେ।

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack view ଗୁଡିକୁ କ୍ରମାନୁସାରେ overlay କରେ, ପରେ ଯୋଡାଯାଇଥିବା view ଉପର ତଳରେ ଦେଖାଯାଏ।

## ଉଦାହରଣ - ଦୁଇଟି overlap ହୋଇଥିବା ବୃତ୍ତ

ଅନେକ icon ସରଳ ଆକୃତିଗୁଡିକର overlay ଦ୍ୱାରା ତିଆରି ହୁଏ, ଉଦାହରଣ ସ୍ୱରୂପ ଦୁଇଟି overlap ହୋଇଥିବା ବୃତ୍ତ।

![Color](../../RESOURCE/006_color14.png)

ପ୍ରଥମେ, ଦୁଇଟି ବୃତ୍ତ ସୃଷ୍ଟି କରନ୍ତୁ:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

ଯେହେତୁ ଆମେ ଦୁଇଟି ବୃତ୍ତକୁ overlay ଭାବରେ ଦେଖାଇବାକୁ ଚାହୁଁଛୁ, ତେଣୁ ZStack layout ବ୍ୟବହାର କରନ୍ତୁ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

ଏହି ସମୟରେ, ସମାନ ଆକାରର ଦୁଇଟି ବୃତ୍ତ ପୂରାପୂରି overlap ହୋଇଛି।

ଆମକୁ ଦୁଇଟି ବୃତ୍ତକୁ ଅଂଶିକ overlap କରାଇବାକୁ ହେବ, ସମ୍ପୂର୍ଣ୍ଣ ଭାବରେ ଏକାଠି ଢାକିଦେବା ନୁହେଁ। ଏଥିପାଇଁ offset ବ୍ୟବହାର କରି shift effect ସୃଷ୍ଟି କରାଯାଇପାରେ।

## offset

offset କେବଳ view ର ଆଙ୍କାଯାଉଥିବା ଅବସ୍ଥାନକୁ ପରିବର୍ତ୍ତନ କରେ, parent view ର layout calculation କୁ ପ୍ରଭାବିତ କରେନାହିଁ।

ବ୍ୟବହାର ପ୍ରକ୍ରିୟା:

```swift
.offset(x:y:)
```

x ହେଉଛି horizontal direction ର shift ମୂଲ୍ୟ, ଏବଂ y ହେଉଛି vertical direction ର shift ମୂଲ୍ୟ।

ଧନାତ୍ମକ ମୂଲ୍ୟର ଅର୍ଥ ଡାହାଣ / ତଳକୁ shift, ଋଣାତ୍ମକ ମୂଲ୍ୟର ଅର୍ଥ ବାମ / ଉପରକୁ shift।

offset ବ୍ୟବହାର କରି ଦୁଇଟି ବୃତ୍ତକୁ ଅଂଶିକ overlap କରାଇବା:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

ଲାଲ୍ ବୃତ୍ତର layout ଭିତରେ ଅବସ୍ଥାନ ପରିବର୍ତ୍ତିତ ହୋଇନାହିଁ, କିନ୍ତୁ ଏହାର drawing position ବାମକୁ 25 point ସରିଗଲା। ଏହିପରି ଦୁଇଟି ବୃତ୍ତ ଅଂଶିକ overlap ହୋଇଥିବା visual effect ସୃଷ୍ଟି କରେ।

## ପାରଦର୍ଶିତା

SwiftUI ରେ, opacity view ର ପାରଦର୍ଶିତା ସେଟ୍ କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

ମୌଳିକ ବ୍ୟବହାର:

```swift
.opacity(0.5)
```

opacity ର parameter ର ମୂଲ୍ୟ 0.0 ଠାରୁ 1.0 ପର୍ଯ୍ୟନ୍ତ, ଯେଉଁଥିରେ:

* 0 ର ଅର୍ଥ ସମ୍ପୂର୍ଣ୍ଣ ପାରଦର୍ଶୀ
* 1 ର ଅର୍ଥ ଅପାରଦର୍ଶୀ

orange ବୃତ୍ତର ପାରଦର୍ଶିତା ସେଟ୍ କରିବା ପାଇଁ opacity ବ୍ୟବହାର କରାଯାଇପାରେ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

ଯେତେବେଳେ orange ବୃତ୍ତର opacity 0.8 ରେ ସେଟ୍ କରାଯାଏ, ତାହାର ଅପାରଦର୍ଶିତା 80% ହୁଏ। ଯେତେବେଳେ ଦୁଇଟି ବୃତ୍ତ overlap କରେ, overlap ଅଞ୍ଚଳରେ ରଙ୍ଗ ମିଶ୍ରଣର effect ଦେଖାଯାଏ।

## blur

SwiftUI ରେ, blur ବ୍ୟବହାର କରି ଧୁସର effect ସେଟ୍ କରାଯାଇପାରେ:

```swift
.blur(radius:10)
```

radius blur ର ବ୍ୟାପ୍ତିକୁ ନିର୍ଦ୍ଦିଷ୍ଟ କରେ। ମୂଲ୍ୟ ଯେତେ ବଡ, blur effect ସେତେ ଅଧିକ ସ୍ପଷ୍ଟ ହୁଏ।

ଆମେ ଏହି ଦୁଇଟି ବୃତ୍ତକୁ blur effect ଯୋଡିପାରୁ:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

ଶେଷରେ, ଆମେ ଦୁଇଟି ବହୁତ ଧୁସର ବୃତ୍ତ ଦେଖିପାରୁ।

## ସାରାଂଶ

ଏହି ପାଠ SwiftUI ରେ ସାଧାରଣ visual modifier ଉପରେ କେନ୍ଦ୍ରିତ ଥିଲା। ଆମେ modifier ମାଧ୍ୟମରେ କିପରି view ର ରଙ୍ଗ, ଅବସ୍ଥାନ ଏବଂ visual effect କୁ ନିୟନ୍ତ୍ରଣ କରିହେବ ତାହା ଶିଖିଲୁ।

ନିର୍ଦ୍ଦିଷ୍ଟ ଉଦାହରଣ ମାଧ୍ୟମରେ, ଆମେ ଭିନ୍ନ visual modifier ଗୁଡିକ interface ଭିତରେ ପ୍ରାୟୋଗିକ ଭାବରେ କିପରି କାମ କରେ ତାହା ଦେଖିଲୁ, ଏବଂ safe area ବିଷୟରେ ମଧ୍ୟ ଜ୍ଞାନ ପାଇଲୁ।

ଏଗୁଡିକ ସବୁ ବହୁତ ମୌଳିକ modifier। ଆମେ ଏମାନଙ୍କୁ ଅଧିକ ଅଭ୍ୟାସ ଏବଂ ବ୍ୟବହାର କରିପାରୁ, ଯାହା ବାସ୍ତବ development ରେ interface effect କୁ ଆଉ ଅଧିକ ସ୍ପଷ୍ଟତାରେ ନିୟନ୍ତ୍ରଣ କରିବାରେ ସହାୟକ ହେବ।

### ପାଠ ପରବର୍ତ୍ତୀ ଅଭ୍ୟାସ

* ଗୋଟିଏ ଛବିକୁ transparency ଏବଂ blur effect ଯୋଡନ୍ତୁ
* ଭିନ୍ନ transparency ଥିବା ତିନୋଟି overlap ବୃତ୍ତ ସେଟ୍ କରନ୍ତୁ
* ସମଗ୍ର screen ଭରିଥିବା ଗୋଟିଏ background image ସୃଷ୍ଟି କରନ୍ତୁ ଏବଂ safe area କୁ ignore କରନ୍ତୁ
* offset ବ୍ୟବହାର କରି ଅନେକ view ର ଅବସ୍ଥାନ ସମଯୋଜନ କରନ୍ତୁ

ଅଭ୍ୟାସର ଉଦ୍ଦେଶ୍ୟ API ମନେ ରଖିବା ନୁହେଁ, ବରଂ ଦୃଶ୍ୟମାନ ପରିବର୍ତ୍ତନ ଏବଂ layout behavior ମଧ୍ୟର ସମ୍ପର୍କକୁ ଅବଲୋକନ କରିବା।
