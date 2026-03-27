# ଲେଆଉଟ୍, ଛବି ଏବଂ ଟେକ୍ସ୍ଟ

ପୂର୍ବବର୍ତ୍ତୀ ପାଠରେ, ଆମେ ContentView କୋଡ୍ ଶିଖିଥିଲୁ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
````

ଏହି ପାଠରେ, ଆମେ SwiftUI ର default layout mechanism ଏବଂ image ଓ text ବ୍ୟବହାର ପ୍ରକ୍ରିୟା ଶିଖିବୁ। ପୂର୍ବରୁ ଶିଖିଥିବା ବିଷୟର ଆଧାରରେ, ଆମେ view ର structure ଏବଂ display method କୁ ଆଉ ଭଲଭାବରେ ବୁଝିବୁ। ଏହି ଜ୍ଞାନ ଆମକୁ ମୌଳିକ interface layout ତିଆରି କରିବାରେ ସହାୟତା କରିବ।

## SwiftUI ର default layout mechanism

ContentView କୁ preview କଲେ, ଆମେ ଦେଖୁଥାଉ ଯେ icon ଏବଂ text ମଧ୍ୟଭାଗରେ ଦେଖାଯାଉଛି, ଶୀର୍ଷଭାଗରୁ ଆରମ୍ଭ ହେଉନାହିଁ।

![Swift](../../RESOURCE/003_view.png)

Default ଭାବରେ, Stack container ର alignment .center ଥାଏ, ତେଣୁ child view ଗୁଡିକ ସାଧାରଣତଃ center alignment ରେ ଦେଖାଯାଏ।

### Alignment ସମନ୍ୱୟ ପ୍ରଣାଳୀ

ସ୍ପଷ୍ଟ ଭାବରେ, center alignment କେବଳ ଗୋଟିଏ alignment ପ୍ରକାର। ଯଦି ଆମେ left alignment କିମ୍ବା right alignment ଚାହୁଁ, ତେବେ alignment ବ୍ୟବହାର କରି view ର ସମନ୍ୱୟକୁ ନିୟନ୍ତ୍ରଣ କରିବାକୁ ପଡିବ।

```swift
alignment
```

SwiftUI ରେ, alignment ସାଧାରଣତଃ ଦୁଇ ପ୍ରକାର ପରିସ୍ଥିତିରେ ଦେଖାଯାଏ:

**1. Stack container ର alignment parameter**

ଉଦାହରଣ ସ୍ୱରୂପ, ContentView ଭିତରେ icon ଓ text କୁ left alignment କରିବା:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

VStack ର alignment ହେଉଛି horizontal direction ର alignment control।

Alignment ପ୍ରକାର:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack ହେଉଛି horizontal arrangement, ତେଣୁ alignment ଏଥିରେ vertical direction ର alignment control କରେ:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack ହେଉଛି overlay arrangement, ଏଥିରେ alignment horizontal କିମ୍ବା vertical ଦୁଇ ଦିଗର alignment control କରିପାରେ:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

ଯଦି explicit ଭାବରେ alignment ଲେଖାଯାଇନଥାଏ, VStack、HStack ଏବଂ ZStack ର default alignment ହେଉଛି .center।

**2. frame ର ଭିତରର alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

ଯେତେବେଳେ frame ଦ୍ୱାରା ଦିଆଯାଇଥିବା size view ର ନିଜର size ଠାରୁ ବଡ ହୁଏ, ସେତେବେଳେ alignment ନିର୍ଦ୍ଦିଷ୍ଟ କରେ view ଟି frame ଭିତରେ କେଉଁଠି ରହିବ। frame ର ବିସ୍ତୃତ ବ୍ୟବହାର ପରବର୍ତ୍ତୀ ପାଠରେ ଆଲୋଚନା କରାଯିବ। ଏଠାରେ କେବଳ ଏକ ସରଳ ପରିଚୟ ଭାବେ ବୁଝିଲେ ଚାଲିବ।

### Spacer ଏବଂ space distribution mechanism

alignment ଦ୍ୱାରା view କୁ horizontal କିମ୍ବା vertical direction ରେ ସଜାଇ ଦେଖାଯାଇପାରେ। କିନ୍ତୁ ଯେତେବେଳେ ଆମେ ଚାହୁଁ ଯେ text ଏବଂ image ଦୁଇ ପ୍ରାନ୍ତରେ ଦେଖାଯାଉ, ସେତେବେଳେ ମାତ୍ର alignment ପର୍ଯ୍ୟାପ୍ତ ହୁଏ ନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଯଦି ଆମେ [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) ୱେବସାଇଟ୍ ର top view ପରି ଗୋଟିଏ ଦୃଶ୍ୟ ତିଆରି କରିବାକୁ ଚାହୁଁ, ଯେଉଁଠାରେ ବାମପଟେ NHK icon ଏବଂ ଡାହାଣପଟେ menu icon ଥାଏ।

![Swift](../../RESOURCE/003_alignment3.png)

ଯଦି ଆମେ କେବଳ alignment ବ୍ୟବହାର କରିବା, ତେବେ NHK icon ଏବଂ menu icon ଦୁହେଁ ମାତ୍ର ଗୋଟିଏ ପଟରେ ଦେଖାଯିବ। ଏହା ଦୁଇଟି icon କୁ ବାମ ଓ ଡାହାଣ ପ୍ରାନ୍ତରେ ଭାଗ କରିପାରିବ ନାହିଁ। ସେହିପାଇଁ ଅବଶିଷ୍ଟ space ବଣ୍ଟନ କରିବାକୁ Spacer ଦରକାର ହୁଏ।

Spacer ହେଉଛି ଗୋଟିଏ elastic layout view, ଯାହା ଅବଶିଷ୍ଟ space କୁ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ପୂରଣ କରେ।

ବ୍ୟବହାର ପ୍ରକ୍ରିୟା:

```swift
Spacer()
```

ଉଦାହରଣ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

ଯେତେବେଳେ ଆମେ Image ଏବଂ Text ମଧ୍ୟରେ Spacer ଯୋଡୁଥାଉ, Spacer ଅବଶିଷ୍ଟ space କୁ ଭରିଦିଏ, ଏବଂ Image ଓ Text କୁ ଉପର ଓ ତଳ ଦୁଇ ପ୍ରାନ୍ତକୁ ଠେଲିଦିଏ।

![Swift](../../RESOURCE/003_view1.png)

ଯଦି ଅନେକ Spacer ରହେ:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

ତେବେ ଅବଶିଷ୍ଟ space Spacer ମଧ୍ୟରେ ସମାନ ଭାବରେ ବଣ୍ଟନ ହେବ।

![Swift](../../RESOURCE/003_spacer.png)

## Image ର display ଏବଂ size control

Image view ପ୍ରଧାନତଃ ଛବି ଦେଖାଇବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ପୂର୍ବ ପାଠରେ ଶିଖିଥିବା SF Symbols icon, Image ର କେବଳ ଗୋଟିଏ ପ୍ରୟୋଗ ମାତ୍ର।

ବ୍ୟବହାର ପ୍ରକ୍ରିୟା:

```swift
Image("imageName")
```

Image ର double quote ଭିତରେ ଛବିର ନାମ ଥାଏ, ଏଠାରେ file extension ଲେଖିବାକୁ ପଡେ ନାହିଁ।

### ଛବି ଦେଖାଇବା

ପ୍ରଥମେ, ଆମେ ଗୋଟିଏ ଛବି ପ୍ରସ୍ତୁତ କରୁ।

![Swift](../../RESOURCE/003_img.jpg)

Xcode ରେ Assets resource folder ବାଛନ୍ତୁ, ଏବଂ ଛବିକୁ Assets ମଧ୍ୟରେ drag କରନ୍ତୁ।

![Swift](../../RESOURCE/003_img1.png)

ContentView ଭିତରେ, Image ବ୍ୟବହାର କରି ଛବି ଦେଖାନ୍ତୁ:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

ଧ୍ୟାନ ଦିଅନ୍ତୁ: SwiftUI ର Image GIF animation play କରିପାରେ ନାହିଁ（କେବଳ static frame ଦେଖାଏ）。

### ଛବିର ଆକାର ନିୟନ୍ତ୍ରଣ

SwiftUI ରେ, Image default ଭାବେ ଛବିର original size ରେ ଦେଖାଯାଏ। ଯଦି display size ପରିବର୍ତ୍ତନ କରିବାକୁ ଚାହୁଁ, ପ୍ରଥମେ resizable ବ୍ୟବହାର କରି ଛବିକୁ scalable କରିବାକୁ ପଡେ, ପରେ frame ବ୍ୟବହାର କରି layout size ନିର୍ଦ୍ଦିଷ୍ଟ କରିବାକୁ ପଡେ।

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier

resizable modifier ଛବିକୁ layout ଭିତରେ scale ହେବାକୁ ଅନୁମତି ଦେଏ, ଯାହାଦ୍ୱାରା ଏହା original size ରେ fixed ରହିନଥାଏ।

```swift
.resizable()
```

କେବଳ resizable() ଯୋଡିବା ପରେ frame ସତରେ ଛବିର display size ପରିବର୍ତ୍ତନ କରିପାରେ।

ଯଦି resizable କୁ ଛାଡିଦିଆଯାଏ:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

ତେବେ frame କେବଳ ଛବି ପାଇଁ layout space ପ୍ରଦାନ କରିବ, କିନ୍ତୁ ଛବିର ନିଜର size ପରିବର୍ତ୍ତନ ହେବ ନାହିଁ।

### frame modifier

frame(width:height) view ର width ଏବଂ height ନିର୍ଦ୍ଦିଷ୍ଟ କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

ମୌଳିକ ବ୍ୟବହାର:

```swift
.frame(width: 10,height: 10)
```

ଉଦାହରଣ ସ୍ୱରୂପ, ଛବିକୁ width 300 ଏବଂ height 100 ଥିବା ଆୟତାକାର ଆକାରରେ ସେଟ୍ କରିବା।

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

ପୃଥକ ଭାବରେ width କିମ୍ବା height ମଧ୍ୟ ସେଟ୍ କରିହେବ:

```swift
.frame(width: 200)
.frame(height: 100)
```

resizable + frame ର ଏହି combination ଦ୍ୱାରା interface ରେ image ର display size କୁ ଲଚିଳା ଭାବରେ control କରାଯାଇପାରେ, ସେଥିସହିତ scalable ability ମଧ୍ୟ ରହିଥାଏ।

### Scaling ratio: scaledToFit ଏବଂ scaledToFill

ଯେତେବେଳେ frame ଦ୍ୱାରା set କରାଯାଇଥିବା width ଏବଂ height ର ratio ମିଳେନାହିଁ, ସେତେବେଳେ ଛବି stretch ହୋଇ ବିକୃତ ହୋଇପାରେ।

ଯଦି ଆମେ ଚାହୁଁ ଯେ ଛବି ତାହାର original ratio ରଖି layout space ଭିତରେ ଖାପ ଖାଉ, ତେବେ scaledToFit କିମ୍ବା scaledToFill ବ୍ୟବହାର କରିପାରିବା।

**scaledToFit**

scaledToFit ଛବିର original width-height ratio ରଖିଥାଏ, ଏବଂ ଛବିକୁ scale କରି available space ଭିତରେ ପୂରା fit କରାଯାଏ, କୌଣସି clipping ହୁଏ ନାହିଁ:

```swift
.scaledToFit()
```

କିମ୍ବା

```swift
.aspectRatio(contentMode: .fit)
```

ଏହି ପ୍ରକ୍ରିୟା ସେହି scenario ପାଇଁ ଭଲ ଯେଉଁଠାରେ ଛବିକୁ ପୂରା ଦେଖାଇବା ଦରକାର ଏବଂ ବିକୃତି ଚାହିଁନାହୁଁ।

ଯଦି ପ୍ରତ୍ୟେକ ଛବିକୁ ସମାନ width ଏବଂ height ଦିଆଯାଏ, ତେବେ ଛବି stretch ହେବାର ସମ୍ଭାବନା ରହିଥାଏ।

ଉଦାହରଣ:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

ଯଦି scaling ratio set କରାଯାଇନଥାଏ, ତେବେ ଛବି original proportion ରେ ଦେଖାଯାଇପାରେ ନାହିଁ।

![Swift](../../RESOURCE/003_img4.png)

scaledToFit ବ୍ୟବହାର କଲେ ଛବିକୁ original ratio ରେ ରଖିହେବ।

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill ମଧ୍ୟ ଛବିର ratio ରଖେ, କିନ୍ତୁ ଏହା ସମସ୍ତ available space କୁ ପୂରା ଭରିଦିଏ। ଯଦି ratio ମିଳେନାହିଁ, ତେବେ ଅତିରିକ୍ତ ଅଂଶ clip ହୋଇଯାଏ:

```swift
.scaledToFill()
```

କିମ୍ବା

```swift
.aspectRatio(contentMode: .fill)
```

ଏହି ପ୍ରକ୍ରିୟା ସେହି scenario ପାଇଁ ଭଲ ଯେଉଁଠାରେ ଛବିକୁ ପୂରା ଅଞ୍ଚଳ ଢାକିଦେବା ଦରକାର, ଯେପରି background image କିମ୍ବା banner। ବିଶେଷତଃ background ଭାବରେ ଛବି ବ୍ୟବହାର କରିବାରେ ଏହା ଉପଯୋଗୀ।

**ଦୁଇଟିର ପାର୍ଥକ୍ୟ**

![Swift](../../RESOURCE/003_img6.png)

## ଟେକ୍ସ୍ଟ

SwiftUI ରେ, Text ଟେକ୍ସ୍ଟ ଦେଖାଇବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

ମୌଳିକ ବ୍ୟବହାର:

```swift
Text("FangJunyu")
```

ପୂର୍ବ ପାଠରେ ଆମେ Text ଶିଖିଥିଲୁ। ଏହି ପାଠରେ, ଆମେ ଆଉ ଆଗକୁ ବଢି font size ଏବଂ font weight କିପରି control କରାଯାଏ ଶିଖିବୁ, ଯାହାଦ୍ୱାରା text କୁ ଆଉ ଅଧିକ ପ୍ରଭାବଶାଳୀ କରିପାରିବୁ।

### ଫଣ୍ଟ ଆକାର

font modifier ବ୍ୟବହାର କରି text ର size control କରାଯାଏ:

```swift
.font(.title)
```

ଉଦାହରଣ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

ସାଧାରଣ font size（ବଡ ଠାରୁ ଛୋଟ）:

```id="font-sizes"
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### ଫଣ୍ଟ ମୋଟାପଣ

ଯଦି ଟେକ୍ସ୍ଟକୁ bold କରିବାକୁ ଚାହୁଁ, fontWeight modifier ବ୍ୟବହାର କରନ୍ତୁ:

```swift
.fontWeight(.bold)
```

ଉଦାହରଣ:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

ସାଧାରଣ font weight（ପତଳା ଠାରୁ ମୋଟା）:

```id="font-weights"
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font ଫଣ୍ଟର size control କରେ, ଏବଂ fontWeight ଫଣ୍ଟର ମୋଟାପଣ control କରେ। ଏହି ଦୁଇଟିକୁ ଏକସାଥି ବ୍ୟବହାର କରି text ର presentation କୁ ସମୃଦ୍ଧ କରାଯାଇପାରେ।

## ସାରାଂଶ ଏବଂ ଅଭ୍ୟାସ

ଏପର୍ଯ୍ୟନ୍ତ, ଆମେ SwiftUI ର default layout, Spacer, Image ଏବଂ Text ଭଳି ମୌଳିକ ଜ୍ଞାନ ଶିଖିଛୁ। ଏହି ଜ୍ଞାନ ଦ୍ୱାରା କିଛି ସରଳ view ତିଆରି କରିବା ପାଇଁ ପର୍ଯ୍ୟାପ୍ତ।

ଉଦାହରଣ ସ୍ୱରୂପ: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google ର interface ବହୁତ ସରଳ ଏବଂ ସଫା। ଏଥିରେ ଛବି ଏବଂ ଟେକ୍ସ୍ଟ ରହିଛି। ଆମେ SwiftUI ର ଦୃଷ୍ଟିକୋଣରୁ Google ର interface structure କୁ ବିଶ୍ଳେଷଣ କରିପାରିବୁ:

1. ସମୁଦାୟ interface କୁ ତିନି ଭାଗରେ ଭାଗ କରାଯାଇପାରେ: Google icon, search box ଏବଂ hint text। ଏହା ପାଇଁ VStack ଦ୍ୱାରା vertical arrangement କରିହେବ।
2. Google icon ଗୋଟିଏ ଛବି, ଯାହାକୁ Image ବ୍ୟବହାର କରି ଦେଖାଯାଇପାରେ।
3. Search box ଭିତରେ input field ଏବଂ icon ରହିଛି। input field କୁ ଅନଦେଖା କଲେ, search icon କୁ Image ଦ୍ୱାରା ଦେଖାଯାଇପାରେ।
4. Hint text କୁ Text ଦ୍ୱାରା ଦେଖାଯାଇପାରେ। ଏବଂ text ର horizontal arrangement ପାଇଁ HStack ବ୍ୟବହାର କରିହେବ, font color ପାଇଁ foregroundStyle ବ୍ୟବହାର କରାଯାଇପାରେ।

ଏହି ଜ୍ଞାନଗୁଡିକୁ ଅଭ୍ୟାସ କରି, ଆମେ କିଛି ସରଳ view ତିଆରି କରିପାରିବୁ, ଏବଂ Image ଓ Text view ସହ ତାହାର modifier ବ୍ୟବହାର ଉପରେ ଆମର ବୁଝାପଡ଼ା ଆଉ ଗଭୀର ହେବ।
