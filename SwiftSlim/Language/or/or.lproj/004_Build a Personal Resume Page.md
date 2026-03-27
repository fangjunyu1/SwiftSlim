# ବ୍ୟକ୍ତିଗତ ରେଜ୍ୟୁମେ ପେଜ୍ ତିଆରି କରିବା

ଏହି ପାଠରେ ଆମେ ଗୋଟିଏ ସରଳ ବ୍ୟକ୍ତିଗତ ରେଜ୍ୟୁମେ view ତିଆରି କରିବୁ, ଏବଂ ନିମ୍ନଲିଖିତ ଜ୍ଞାନ ଶିଖିବୁ:

- cornerRadius
- spacing
- ScrollView

ତିଆରି ପ୍ରକ୍ରିୟାରେ, ଆମେ layout、Text ଏବଂ Image ଭଳି ପୂର୍ବରୁ ଶିଖା ଜ୍ଞାନକୁ ପୁନରାବୃତ୍ତି କରିବୁ, ଏବଂ spacing control ଓ content scrolling effect କୁ ମଧ୍ୟ ପ୍ରାୟୋଗିକ ଭାବରେ କାର୍ଯ୍ୟକରିତ କରିବୁ।

## ବ୍ୟକ୍ତିଗତ ରେଜ୍ୟୁମେ

ଲକ୍ଷ୍ୟ ଫଳାଫଳ:

![Swift](../../RESOURCE/004_img.png)

**ଦୟାକରି ପ୍ରଥମେ ନିଜେ ଚେଷ୍ଟା କରି ସମାପ୍ତ କରନ୍ତୁ, ତାପରେ ନିମ୍ନର ବ୍ୟାଖ୍ୟା ପଢନ୍ତୁ।**

### ପ୍ରକଳ୍ପ ସୃଷ୍ଟି

ନୂତନ iOS project ତିଆରି କରନ୍ତୁ, କିମ୍ବା ପୂର୍ବରୁ ବ୍ୟବହୃତ project କୁ ଜାରି ରଖନ୍ତୁ।

default ContentView କୋଡ୍:

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
    }
}
````

ଏବେ କୋଡ୍ ଖାଲି କରନ୍ତୁ, ଏବଂ ନିଜର content ଲେଖିବା ଆରମ୍ଭ କରନ୍ତୁ:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### ସମଗ୍ର ଗଠନ

ବାସ୍ତବ development ରେ, ଆମେ ସାଧାରଣତଃ ପ୍ରଥମେ ସମଗ୍ର structure ଡିଜାଇନ୍ କରୁଥାଉ।

ଆମର ପେଜ୍ ଭିତରେ ରହିବ:

1. ଶୀର୍ଷକ
2. ବ୍ୟକ୍ତିଗତ ସୂଚନା
3. ବ୍ୟକ୍ତିଗତ ପରିଚୟ

ସବୁଠାରୁ ବାହାର ଲେୟରରେ ଗୋଟିଏ VStack ଯୋଡନ୍ତୁ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack view ଗୁଡିକୁ vertical ଭାବରେ ସଜାଇବାକୁ ନିଶ୍ଚିତ କରେ, ଏବଂ view ର arrangement ଓ spacing କୁ control କରିପାରେ।

### ଶୀର୍ଷକ

ପ୍ରଥମେ, ଆମେ ଗୋଟିଏ Text ସୃଷ୍ଟି କରି ଶୀର୍ଷକ ଦେଖାଇବୁ।

ଏଠାରେ, ମୁଁ ନିଜର English ନାମକୁ ଶୀର୍ଷକ ଭାବରେ ଦେଖାଉଛି:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

ଶୀର୍ଷକ ସାଧାରଣତଃ ବଡ ଏବଂ bold ହୋଇଥାଏ, ଏଠାରେ font ଏବଂ fontWeight modifier ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### ପେଜ୍ ବ୍ୟବସ୍ଥାପନା

SwiftUI ର default alignment ହେଉଛି center, ତେଣୁ ଏବେ ଶୀର୍ଷକଟି ContentView ର ମଧ୍ୟଭାଗରେ ଦେଖାଯାଉଛି।

![Swift](../../RESOURCE/004_img3.png)

ଆମେ ଶୀର୍ଷକକୁ view ର ଉପରେ ଦେଖାଇବାକୁ ଚାହୁଁଛୁ, ଏଥିପାଇଁ Spacer ବ୍ୟବହାର କରି layout କୁ ସମଯୋଜନ କରିପାରିବା:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer ଅବଶିଷ୍ଟ ସ୍ଥାନକୁ ଦଖଲ କରି, Text କୁ container ର ଉପର ପଟକୁ ଠେଲିଦେବ।

![Swift](../../RESOURCE/004_img4.png)

### ଖାଲି ସ୍ଥାନ

ଯଦି ଆପଣଙ୍କୁ ଲାଗେ ଯେ ଟେକ୍ସ୍ଟ ଅଂଶଟି ଉପରକୁ ବହୁତ ନିକଟ, ତେବେ padding କିମ୍ବା Spacer ବ୍ୟବହାର କରନ୍ତୁ।

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

ଏଠାରେ VStack ର top padding କୁ 20 ରେ ସେଟ୍ କରାଯାଇଛି।

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

ଆପଣ Spacer ବ୍ୟବହାର କରି ନିର୍ଦ୍ଦିଷ୍ଟ ଉଚ୍ଚତାର ଖାଲି ସ୍ଥାନ ମଧ୍ୟ ପାଇପାରିବେ।

ଫଳାଫଳ:

![Swift](../../RESOURCE/004_img5.png)

### ଛବି

ଆମେ ନିଜର ଗୋଟିଏ ପୋର୍ଟ୍ରେଟ୍ ଫଟୋ ପ୍ରସ୍ତୁତ କରି Assets resource folder ଭିତରେ ରଖିବୁ।

![Swift](../../RESOURCE/004_img6.png)

ContentView ଭିତରେ Image ବ୍ୟବହାର କରି ଛବି ଦେଖାନ୍ତୁ:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

ଯହେତୁ ଛବିର original size ବଡ, ତେଣୁ frame ବ୍ୟବହାର କରି display size control କରିବାକୁ ପଡିବ।

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

ଏଠାରେ ଆମେ ଗୋଟିଏ ସମସ୍ୟା ଦେଖିବୁ:

ଯଦି frame ର width-height ratio ଛବିର original ratio ସହିତ ସମାନ ନୁହେଁ, ତେବେ ଛବି ବିକୃତ ହୋଇଯିବ।

ଉଦାହରଣ:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

ଛବି ବିକୃତ ହେବାକୁ ବାଚାଇବା ପାଇଁ, ଆମେ scaledToFit ବ୍ୟବହାର କରିବାକୁ ପଡିବ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

scaledToFit ର କାର୍ଯ୍ୟ ହେଉଛି:

ଦିଆଯାଇଥିବା frame ସୀମା ମଧ୍ୟରେ, ଛବିର ମୂଳ ଅନୁପାତକୁ ରଖି ସ୍କେଲ୍ କରିବା ଏବଂ ସମସ୍ତ ଛବିକୁ ପୂରା ଦେଖାଇବା।

ଏହା ଛବିକୁ ବାଧ୍ୟ କରି ସମଗ୍ର frame କୁ ଭରିବା ପାଇଁ stretch କରେନାହିଁ, ବରଂ width-height ratio କୁ ଅବିକୃତ ରଖି ସମାନ ଅନୁପାତରେ ସ୍କେଲ୍ କରେ, ଯାହାପର୍ଯ୍ୟନ୍ତ ଗୋଟିଏ ପାଶ ସୀମାକୁ ସଠିକ୍ ଭାବେ ଛୁଇଁନାହିଁ।

ଏହାର ଅର୍ଥ:

* ଯଦି frame ର width କମ୍ ଥାଏ, ଛବି width କୁ ଆଧାର କରି ସ୍କେଲ୍ ହେବ।
* ଯଦି frame ର height କମ୍ ଥାଏ, ଛବି height କୁ ଆଧାର କରି ସ୍କେଲ୍ ହେବ।
* ଛବି ସବୁବେଳେ ତାର original ratio ରଖିବ, ବିକୃତ ହେବ ନାହିଁ।

ସାଧାରଣତଃ ଗୋଟିଏ ଦିଗର size set କରିଲେ ଯଥେଷ୍ଟ। ଉଦାହରଣ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

ଏହାଦ୍ୱାରା ସିଷ୍ଟମ୍ width 140 ଅନୁସାରେ ଉଚିତ height କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ହିସାବ କରିବ, ସେଥିସହିତ ଛବିର ratio କୁ ରଖିବ।

ଯଦି ନିର୍ଦ୍ଦିଷ୍ଟ visual ratio ରଖିବା ଆବଶ୍ୟକ କିମ୍ବା ଜଟିଳ layout ମଧ୍ୟରେ ଛବି ଚାପିଯିବାକୁ ବାଚାଇବା ଦରକାର, ତେବେ width ଓ height ଦୁହେଁକୁ ଏକାସାଥି constrain କରାଯାଇପାରେ।

### rounded corner

ଯଦି ଛବିକୁ rounded corner ସହିତ ଦେଖାଇବାକୁ ଚାହୁଁ, cornerRadius modifier ବ୍ୟବହାର କରନ୍ତୁ:

```swift
.cornerRadius(10)
```

ଉଦାହରଣ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image ର modifier ଚେନ୍ ର ଶେଷରେ cornerRadius(20) ଯୋଡନ୍ତୁ।

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) ର ଅର୍ଥ ହେଉଛି view ର boundary କୁ clip କରି 20 ର rounded corner radius ପ୍ରୟୋଗ କରିବା।

rounded corner ଯୋଡିବା ପରେ, ଛବିର ଚାରିଟି କୋଣ ଗୋଲାକାର ହୋଇଯିବ, ଯାହା ଦୃଶ୍ୟକୁ ଆଉ ମୃଦୁ ଏବଂ modern କରିଦେଇଥାଏ।

ଏହି design style ବର୍ତ୍ତମାନର interface design ରେ ବହୁତ ସାଧାରଣ। ଉଦାହରଣ ସ୍ୱରୂପ, iOS app icon ମଧ୍ୟ rounded rectangle ଆକୃତି ବ୍ୟବହାର କରେ（ହେଲେ ମଧ୍ୟ system icon ଗୁଡିକ ସରଳ rounded corner ନୁହେଁ, ବରଂ continuous curvature ଥିବା superellipse ବ୍ୟବହାର କରନ୍ତି）。

### ବ୍ୟକ୍ତିଗତ ସୂଚନା

ଏବେ ଛବିର ବାମ ପଟରେ ବ୍ୟକ୍ତିଗତ ସୂଚନା ଅଂଶ ତିଆରି କରିବା ଆରମ୍ଭ କରନ୍ତୁ। Interface structure ଠାରୁ ଦେଖିପାରିବା ଯେ, ବ୍ୟକ୍ତିଗତ ସୂଚନା ଏବଂ ଛବି horizontal ଭାବରେ ସଜାଯାଇଛି, ତେଣୁ HStack ବ୍ୟବହାର କରିବାକୁ ପଡିବ।

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

ବ୍ୟକ୍ତିଗତ ସୂଚନାର content vertical ଭାବରେ ସଜାଯାଇଛି।

![Swift](../../RESOURCE/004_img11.png)

ସେହିପାଇଁ, outer layer ରେ HStack, ବ୍ୟକ୍ତିଗତ ସୂଚନା ପାଇଁ VStack, ଏବଂ text content ପାଇଁ Text ବ୍ୟବହାର କରିବାକୁ ପଡିବ।

ମୌଳିକ ଗଠନ:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**field title କୁ bold କରିବା**

field name ଏବଂ field value ରେ ପାର୍ଥକ୍ୟ ସୃଷ୍ଟି କରିବା ପାଇଁ, field title ରେ fontWeight ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**text କୁ left alignment କରିବା**

VStack default ଭାବରେ center alignment ଥାଏ। ଯଦି ସମସ୍ତ text କୁ left alignment କରିବାକୁ ଚାହୁଁ, alignment set କରିବାକୁ ପଡିବ:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading ର ଅର୍ଥ ହେଉଛି left alignment（left-to-right language environment ରେ）。

![Swift](../../RESOURCE/004_img14.png)

### spacing

ଯଦି ବ୍ୟକ୍ତିଗତ ସୂଚନା ଏବଂ ଛବି ମଧ୍ୟରେ ନିର୍ଦ୍ଦିଷ୍ଟ ଦୂରତା ରଖିବାକୁ ଚାହୁଁ, ପୂର୍ବରୁ ଆମେ Spacer ବ୍ୟବହାର କରି gap ସୃଷ୍ଟି କରିଥିଲୁ:

```swift
Spacer()
    .frame(width: 10)
```

ଏଠାରେ HStack ର spacing parameter ବ୍ୟବହାର କରିପାରିବେ:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 ର ଅର୍ଥ ହେଉଛି ଦୁଇଟି child view ମଧ୍ୟର spacing 30 pt।

![Swift](../../RESOURCE/004_img15.png)

**spacing କ’ଣ?**

VStack、HStack、ZStack ରେ, spacing ଦ୍ୱାରା child view ମଧ୍ୟର ଦୂରତା control କରାଯାଏ।

ଉଦାହରଣ:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

VStack ଭିତରର child view ମଧ୍ୟର spacing 10pt ରେ ସେଟ୍ ହେବ।

![Swift](../../RESOURCE/004_img16.png)

ଏଠାରେ ଧ୍ୟାନ ଦେବାକୁ ଥିବା କଥା ହେଉଛି, spacing କେବଳ “direct child view” ଉପରେ କାମ କରେ, nested container ଭିତରର layout କୁ ପ୍ରଭାବିତ କରେନାହିଁ।

**list ର internal spacing କୁ control କରିବା**

ଯଦି field ମଧ୍ୟରେ spacing ବଢାଇବାକୁ ଚାହୁଁ, ସର୍ବାଧିକ ସିଧା ପ୍ରକ୍ରିୟା ହେଉଛି VStack ରେ spacing set କରିବା:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

ଏହାର ଫଳରେ ସମସ୍ତ child view ମଧ୍ୟର spacing 10 pt ହୋଇଯିବ।

କିନ୍ତୁ interface କୁ ଧ୍ୟାନଦେଇ ଦେଖିଲେ ଗୋଟିଏ ସମସ୍ୟା ମିଳେ:

field group ମଧ୍ୟରେ spacing ଅଛି, ସେଥିସହିତ field name ଏବଂ field value ମଧ୍ୟରେ ମଧ୍ୟ ସେଇ spacing ଆସିଯାଇଛି।

ଏହାର କାରଣ ହେଉଛି spacing ବର୍ତ୍ତମାନ container ର ସମସ୍ତ direct child view ଉପରେ କାମ କରୁଛି।

ଏହି structure ରେ, ପ୍ରତ୍ୟେକ Text ବାହାରର VStack ର direct child view ଅଟେ, ତେଣୁ spacing ଏକରକମ ଭାବରେ ପ୍ରୟୋଗ ହେଉଛି।

ଯଦି ଆପଣ ଚାହୁଁଛନ୍ତି ଯେ field group ମଧ୍ୟରେ spacing ରହୁ, କିନ୍ତୁ field name ଓ field value ମଧ୍ୟରେ default compact spacing ରୁହୁ, ତେବେ “field name + field value” କୁ ଗୋଟିଏ logical group ଭାବରେ ନେଇ ବାହାରରେ VStack ରେ wrap କରନ୍ତୁ:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

ଏହି ସମୟରେ structure ଏମିତି ହୋଇଯାଏ ଯେ outer VStack ମଧ୍ୟରେ spacing ରହିଛି, କିନ୍ତୁ inner VStack ମଧ୍ୟରେ default compact spacing ରହିଛି। ତେଣୁ field name ଓ field value ମଧ୍ୟରେ ଅତିରିକ୍ତ ଖାଲି ସ୍ଥାନ ଆସେନାହିଁ।

![Swift](../../RESOURCE/004_img18.png)

### ବ୍ୟକ୍ତିଗତ ପରିଚୟ

ଏବେ ବ୍ୟକ୍ତିଗତ ପରିଚୟ ଅଂଶକୁ ତିଆରି କରନ୍ତୁ।

Interface structure ଠାରୁ ଦେଖିଲେ, ପରିଚୟ content ଅନେକ line ର text ଦ୍ୱାରା ଗଠିତ, ଏବଂ ସେଗୁଡିକ vertical ଭାବରେ ସଜାଯାଇଛି।

![Swift](../../RESOURCE/004_img19.png)

ସେହିପାଇଁ, VStack ଏବଂ Text ବ୍ୟବହାର କରନ୍ତୁ:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**spacing ବଢାଇବା**

ଏବେ ବ୍ୟକ୍ତିଗତ ସୂଚନା ଏବଂ ବ୍ୟକ୍ତିଗତ ପରିଚୟ ଅଂଶଟି ବହୁତ compact, ଦୃଶ୍ୟରେ ବହୁତ ସୁନ୍ଦର ନୁହେଁ।

![Swift](../../RESOURCE/004_img20.png)

ଯେହେତୁ ସେମାନେ ଏକେ outer container ଭିତରେ ଅଛନ୍ତି, ସମଗ୍ର spacing outer container ରେ control କରାଯାଇପାରେ:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

ଫଳାଫଳ:

![Swift](../../RESOURCE/004_img21.png)

**list spacing**

ବ୍ୟକ୍ତିଗତ ପରିଚୟ ଟେକ୍ସ୍ଟ ମଧ୍ୟରେ spacing set କରିବା ପାଇଁ:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### ବ୍ୟକ୍ତିଗତ ରେଜ୍ୟୁମେ ସମାପ୍ତ

ଏବେ, ଆମର ବ୍ୟକ୍ତିଗତ ରେଜ୍ୟୁମେ ର ମୌଳିକ framework ସମାପ୍ତ ହୋଇଯାଇଛି।

![Swift](../../RESOURCE/004_img.png)

### scroll view

ଏବେ ପେଜ୍ structure ରେ VStack ବ୍ୟବହୃତ ହେଉଛି। ଯେତେବେଳେ ପରିଚୟ ଟେକ୍ସ୍ଟ କମ୍ ଥାଏ, ସେତେବେଳେ କୌଣସି ସମସ୍ୟା ନାହିଁ। କିନ୍ତୁ ଯଦି 20, 30 କିମ୍ବା ତାହାଠାରୁ ଅଧିକ text ଯୋଡାଯାଏ, ତେବେ content ର height ସ୍କ୍ରିନ୍ ର ସୀମାକୁ ଅତିକ୍ରମ କରିଦେବ।

ଉଦାହରଣ:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

ଏହି ସମୟରେ ଦୁଇଟି ଘଟଣା ଦେଖାଯିବ:

* ତଳ ଅଂଶର content କଟିଯିବ
* ପେଜ୍ କୁ scroll କରିହେବ ନାହିଁ

ଏହା VStack ର ସମସ୍ୟା ନୁହେଁ। VStack କେବଳ ଗୋଟିଏ layout container, ଏହା ସ୍ୱୟଂଚାଳିତ ଭାବରେ scrolling କ୍ଷମତା ଦେଉନାହିଁ।

**ScrollView କ’ଣ**

ScrollView ହେଉଛି ଗୋଟିଏ scroll କରିପାରୁଥିବା container, ଯାହା ସ୍କ୍ରିନ୍ ର size କୁ ଅତିକ୍ରମ କରୁଥିବା ଅଧିକ content ପାଇଁ ଉପଯୋଗୀ। ଉଦାହରଣ ସ୍ୱରୂପ, vertical କିମ୍ବା horizontal list।

ମୌଳିକ ଗଠନ:

```swift
ScrollView {
    ...
}
```

ଯଦି scroll effect କୁ କାର୍ଯ୍ୟକରିତ କରିବାକୁ ଚାହୁଁ, ସମଗ୍ର ପେଜ୍ content କୁ ScrollView ଭିତରେ wrap କରିବାକୁ ପଡିବ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

ଏହିପରି କଲେ, ସମଗ୍ର ପେଜ୍ ଗୋଟିଏ scrollable area ହୋଇଯିବ। ଯେତେବେଳେ content ସ୍କ୍ରିନ୍ height କୁ ଅତିକ୍ରମ କରିବ, ସେତେବେଳେ ସ୍ୱାଭାବିକ ଭାବରେ scroll କରିହେବ।

ScrollView default ଭାବରେ scrollbar indicator ଦେଖାଏ। ଯଦି scrollbar କୁ ଲୁଚାଇବାକୁ ଚାହୁଁ, ତେବେ set କରନ୍ତୁ:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
