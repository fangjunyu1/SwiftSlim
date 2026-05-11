# କୋର୍ସ କାର୍ଡ

ଏହି ପାଠଟି ଏକ ପର୍ଯ୍ୟାୟ ପୁନରାବୃତ୍ତି ପାଠ। ଆମେ ଏକ “କୋର୍ସ କାର୍ଡ” ସମ୍ପୂର୍ଣ୍ଣ କରିବୁ।

ଏହି ଅଭ୍ୟାସ ମାଧ୍ୟମରେ, ଆମେ ପୂର୍ବରୁ ଶିଖିଥିବା `Text`、`Image`、`VStack`、`HStack`、`Spacer()`、`.padding()`、`.background()`、`.cornerRadius()` ଇତ୍ୟାଦି ବିଷୟକୁ ପୁନରାବୃତ୍ତି କରିପାରିବୁ, ଏବଂ କିପରି ଅନେକ ଛୋଟ ଭ୍ୟୁକୁ ଯୋଡ଼ି ଏକ ସମ୍ପୂର୍ଣ୍ଣ ଭ୍ୟୁ ମଡ୍ୟୁଲ୍ ବନାଇବା ଶିଖିବୁ।

କୋର୍ସ କାର୍ଡର ପ୍ରଭାବ:

![view](../../../Resource/026_view.png)

ଏହି କୋର୍ସ କାର୍ଡରେ ମୁଖ୍ୟତଃ କିଛି ଅଂଶ ରହିଛି:

- କୋର୍ସ ସ୍ତର: `Beginner`
- କୋର୍ସ ବିଷୟବସ୍ତୁ: `20+ Lessons`
- କୋର୍ସ ଶୀର୍ଷକ: `SwiftUI Beginner Tutorial`
- କୋର୍ସ ବର୍ଣ୍ଣନା
- ବଟନ୍: `Start Learning`
- କୋର୍ସ ପୃଷ୍ଠଭୂମି: Swift ଆଇକନ୍ ଏବଂ ଇଣ୍ଡିଗୋ ରଙ୍ଗର ପୃଷ୍ଠଭୂମି

ଆମେ ଏହି ଭ୍ୟୁକୁ `ContentView` ଭିତରେ ସମ୍ପୂର୍ଣ୍ଣ କରିପାରିବୁ।

## ଉପର ଅଞ୍ଚଳ

ପ୍ରଥମେ, କୋର୍ସ କାର୍ଡର ଉପର ଅଞ୍ଚଳ ବନାଇବା।

![view](../../../Resource/026_view1.png)

ଉପର ଅଞ୍ଚଳର ବାମ ପାର୍ଶ୍ୱରେ କୋର୍ସ ସ୍ତର ଦେଖାଯାଏ, ଡାହାଣ ପାର୍ଶ୍ୱରେ କୋର୍ସ ବିଷୟବସ୍ତୁ ଦେଖାଯାଏ।

ଯେହେତୁ ଏହି ଦୁଇଟି ବିଷୟ ଆଡ଼କୁ ସଜାଯାଇଛି, ତେଣୁ `HStack` ବ୍ୟବହାର କରାଯାଇପାରେ।

```swift
var topView: some View {
    HStack {
        Text("ଆରମ୍ଭିକ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ ପାଠ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

ଏଠାରେ ଆମେ ଉପର ଅଞ୍ଚଳକୁ ଏକ computed property ଭାବେ ଅଲଗା କରିଛୁ:

```swift
var topView: some View
```

ଏହା କରିବାର ଲାଭ ହେଉଛି `body` କୁ ଅଧିକ ସ୍ପଷ୍ଟ କରିପାରିବା।

ଉପର ଅଞ୍ଚଳରେ ମୁଖ୍ୟତଃ ଏହି ବିଷୟଗୁଡ଼ିକ ବ୍ୟବହାର ହୋଇଛି:

- `HStack`: ଦୁଇଟି ଟେକ୍ସଟ୍‌କୁ ଆଡ଼କୁ ସଜାଏ।
- `Text`: ଟେକ୍ସଟ୍ ବିଷୟବସ୍ତୁ ଦେଖାଏ।
- `Spacer()`: ବାମ ପାର୍ଶ୍ୱର ଟେକ୍ସଟ୍‌କୁ ବାମକୁ, ଡାହାଣ ପାର୍ଶ୍ୱର ଟେକ୍ସଟ୍‌କୁ ଡାହାଣକୁ ଠେଲିଦିଏ।
- `.font(.footnote)`: ଛୋଟ ଟେକ୍ସଟ୍ ଶୈଳୀ ସେଟ୍ କରେ।
- `.fontWeight(.bold)`: ଟେକ୍ସଟ୍‌କୁ bold କରେ।
- `.foregroundStyle(Color.white)`: foreground ରଙ୍ଗକୁ ଧଳା କରେ।
- `.padding(.vertical, 10)`: ଉପର ଓ ତଳ inner padding ସେଟ୍ କରେ।
- `.padding(.horizontal, 16)`: ବାମ ଓ ଡାହାଣ inner padding ସେଟ୍ କରେ।
- `.background(Color.white.opacity(0.15))`: ଅର୍ଦ୍ଧପାରଦର୍ଶୀ ଧଳା ପୃଷ୍ଠଭୂମି ସେଟ୍ କରେ।
- `.cornerRadius(20)`: rounded corners ସେଟ୍ କରେ।

ଏଠାରେ `Beginner` ଦୁଇ ଦିଗର `.padding()` ବ୍ୟବହାର କରିଛି:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

ଏହା ଟେକ୍ସଟ୍‌ର ଉପର-ତଳ ଓ ବାମ-ଡାହାଣ ଦିଗରେ ସ୍ଥାନ ଦେଇଥାଏ, ଯାହା ଦେଖିବାକୁ ଏକ label ପରି ଲାଗେ।

`Color.white.opacity(0.15)` ର ଅର୍ଥ ହେଉଛି opacity `15%` ଥିବା ଧଳା ରଙ୍ଗ, ଅର୍ଥାତ୍ ବହୁତ ହାଲୁକା ଧଳା।

### କାର୍ଡ ପୃଷ୍ଠଭୂମି ଯୋଡ଼ିବା

ପୂର୍ବରୁ ଆମେ `topView` ତିଆରି କରିଛୁ, କିନ୍ତୁ କେବଳ ଭ୍ୟୁ ତିଆରି କଲେ ସେଥି ଆପେଆପେ ଦେଖାଯିବ ନାହିଁ।

SwiftUI ରେ, interface ଉପରେ ସତେଜ ଭାବରେ ଦେଖାଯିବାକୁ ଥିବା ବିଷୟକୁ `body` ଭିତରେ ଲେଖିବା ଦରକାର।

ତେଣୁ, ପ୍ରଥମେ `topView` କୁ `body` ଭିତରେ ରଖି ଦେଖାଇପାରିବା:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

ଏହି ସମୟରେ ଉପର ଅଞ୍ଚଳ ଦେଖାଯାଇଥିବା ଦେଖିପାରିବେ:

![view](../../../Resource/026_view2.png)

କିନ୍ତୁ, `topView` ଭିତରର ଟେକ୍ସଟ୍ ଧଳା ଓ default ପୃଷ୍ଠଭୂମି ମଧ୍ୟ ହାଲୁକା ଥିବାରୁ, light mode ରେ ଏହା ସ୍ପଷ୍ଟ ଦେଖାଯାଇନପାରେ।

ତେଣୁ, ଆମେ ବାହାରେ ଏକ `VStack` ଯୋଡ଼ି, ସମଗ୍ର ଅଞ୍ଚଳକୁ padding, background color ଓ rounded corners ଦେଇପାରିବା:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view3.png)

ଏଠାରେ `VStack` ଭିତରେ ବର୍ତ୍ତମାନ କେବଳ ଗୋଟିଏ `topView` ରହିଛି, ଦେଖିବାକୁ ଲାଗିପାରେ ଯେ ଏହା ଆବଶ୍ୟକ ନୁହେଁ।

କିନ୍ତୁ ପରେ ଆମେ କୋର୍ସ ଶୀର୍ଷକ, କୋର୍ସ ବର୍ଣ୍ଣନା ଓ ବଟନ୍ ଅଞ୍ଚଳ ଯୋଡ଼ିବୁ। ସେଗୁଡ଼ିକ ସମସ୍ତେ ଉପର-ତଳ ଭାବେ ସଜାଯାଇଥିବା ବିଷୟ, ସେହିପାଇଁ ଏଠାରେ ଆଗୁଆଁରୁ `VStack` ବ୍ୟବହାର କଲେ ପରବର୍ତ୍ତୀ view combination ସହଜ ହୁଏ।

ଏଠାରେ ଦୁଇଟି `.padding()` ରହିଛି, ତାଙ୍କର କାମ ଭିନ୍ନ।

ପ୍ରଥମ `.padding(20)` `.background()` ପୂର୍ବରେ ଲେଖାଯାଇଛି:

```swift
.padding(20)
.background(Color.indigo)
```

ଏହା କାର୍ଡର ଭିତର spacing, ଅର୍ଥାତ୍ content ଓ background edge ମଧ୍ୟର ଦୂରତାକୁ ନିୟନ୍ତ୍ରଣ କରେ।

ଦ୍ୱିତୀୟ `.padding(30)` `.background()` ପରେ ଲେଖାଯାଇଛି:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

ଏହା କାର୍ଡର ବାହାର spacing, ଅର୍ଥାତ୍ ସମଗ୍ର କାର୍ଡ ଓ screen edge ମଧ୍ୟର ଦୂରତାକୁ ନିୟନ୍ତ୍ରଣ କରେ।

![view](../../../Resource/026_view4.png)

ତେଣୁ, ସମାନ `.padding()` ହେଲେ ମଧ୍ୟ, ଭିନ୍ନ ସ୍ଥାନରେ ଲେଖିଲେ ତାହାର ପ୍ରଭାବ ଭିନ୍ନ ହୁଏ।

## ବିଷୟବସ୍ତୁ ଅଞ୍ଚଳ

ତାପରେ କୋର୍ସ କାର୍ଡର ବିଷୟବସ୍ତୁ ଅଞ୍ଚଳ ବନାଇବା।

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view5.png)

ବିଷୟବସ୍ତୁ ଅଞ୍ଚଳରେ କୋର୍ସ ଶୀର୍ଷକ ଓ କୋର୍ସ ବର୍ଣ୍ଣନା ରହିଛି। ସେଗୁଡ଼ିକ ଉପର-ତଳ ଭାବେ ସଜାଯାଇଛି, ସେହିପାଇଁ `VStack` ବ୍ୟବହାର କରାଯାଏ।

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI ଆରମ୍ଭିକ ଟ୍ୟୁଟୋରିଆଲ୍")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("SwiftUI ସହିତ ଶୂନ୍ୟରୁ ଆରମ୍ଭ କରନ୍ତୁ ଏବଂ Appleଙ୍କ declarative UI development କୁ ପଦ୍ଧତିଗତ ଭାବେ ଶିଖନ୍ତୁ। ସ୍ପଷ୍ଟ ବ୍ୟାଖ୍ୟା ଓ practical examples ମାଧ୍ୟମରେ, ଆପଣ layout, interaction ଓ state management କୁ ଧୀରେ ଧୀରେ ବୁଝିପାରିବେ, ଏବଂ ସୁନ୍ଦର ଓ ଉପଯୋଗୀ app interfaces ବନାଇପାରିବେ।")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view6.png)

ଏଠାରେ `VStack` ଭିତରେ ଦୁଇଟି parameter ବ୍ୟବହାର ହୋଇଛି:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` ର ଅର୍ଥ ହେଉଛି `VStack` ଭିତରର ଭ୍ୟୁଗୁଡ଼ିକୁ ବାମ ସମନ୍ୱୟ କରିବା।

`spacing: 10` ର ଅର୍ଥ ହେଉଛି `VStack` ଭିତରର ଭ୍ୟୁମାନଙ୍କ ମଧ୍ୟରେ `10 pt` ଦୂରତା ରଖିବା।

ତେଣୁ, କୋର୍ସ ଶୀର୍ଷକ ଓ କୋର୍ସ ବର୍ଣ୍ଣନା ବାମ ପାର୍ଶ୍ୱରୁ ସଜାଯିବ, ଏବଂ ସେମାନଙ୍କ ମଧ୍ୟରେ ନିର୍ଦ୍ଦିଷ୍ଟ ଦୂରତା ରହିବ।

କୋର୍ସ ବର୍ଣ୍ଣନା ଅଧିକ ଲମ୍ବା। ସମ୍ପୂର୍ଣ୍ଣ ଦେଖାଇଲେ କାର୍ଡ ବହୁତ ଉଚ୍ଚ ହୋଇଯିବ, ସେହିପାଇଁ ଏଠାରେ `.lineLimit()` ବ୍ୟବହାର କରି ଦେଖାଯିବା ଲାଇନ୍ ସଂଖ୍ୟାକୁ ସୀମିତ କରାଯାଇଛି:

```swift
.lineLimit(3)
```

ଏହାର ଅର୍ଥ ସର୍ବାଧିକ `3` ଲାଇନ୍ ଦେଖାଯିବ। ବିଷୟବସ୍ତୁ ଲାଇନ୍ ସୀମାକୁ ଅତିକ୍ରମ କଲେ, ଅଧିକ ଅଂଶକୁ ସଂକ୍ଷିପ୍ତ କରାଯିବ।

### ଭ୍ୟୁକୁ ବାମ ସମନ୍ୱୟ କରିବା

ଏଠାରେ ଆଉ ଗୋଟିଏ କଥା ଧ୍ୟାନ ଦେବା ଦରକାର।

`VStack(alignment: .leading)` କେବଳ `VStack` ଭିତରର ଭ୍ୟୁଗୁଡ଼ିକର alignment କୁ ନିୟନ୍ତ୍ରଣ କରେ; ଏହା `VStack` ନିଜେ ବାହାର container ଭିତରେ କେଉଁଠାରେ ରହିବ ସେଥିକୁ ସିଧାସଳଖ ନିୟନ୍ତ୍ରଣ କରେନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଯଦି କୋର୍ସ ବର୍ଣ୍ଣନା ଛୋଟ ଥାଏ:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI ଆରମ୍ଭିକ ଟ୍ୟୁଟୋରିଆଲ୍")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("କେବଳ କିଛି ବିଷୟବସ୍ତୁ।")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view7.png)

ଦେଖିପାରିବେ, କୋର୍ସ ଶୀର୍ଷକ ଓ କୋର୍ସ ବର୍ଣ୍ଣନା `VStack` ଭିତରେ ବାମ ସମନ୍ୱୟ ହୋଇଥିଲେ ମଧ୍ୟ, ସମଗ୍ର `VStack` କାର୍ଡର ସବୁଠାରୁ ବାମ ପାର୍ଶ୍ୱକୁ ଯାଇନାହିଁ।

ଏହାର କାରଣ ହେଉଛି, ବିଷୟବସ୍ତୁ ଛୋଟ ଥିଲେ `VStack` ର ପ୍ରସ୍ଥ ମଧ୍ୟ ଛୋଟ ହୁଏ। ବାହାର container layout କରିବାବେଳେ ଏହି ସଂକୀର୍ଣ୍ଣ `VStack` କୁ ମଧ୍ୟଭାଗରେ ରଖିପାରେ।

ଏଭଳି ବୁଝିପାରିବେ: `VStack(alignment: .leading)` ଭିତର ଭାଗର ବାମ alignment ପାଇଁ ଦାୟୀ।
କିନ୍ତୁ ଏହା ସମଗ୍ର content area କୁ ସବୁଠାରୁ ବାମକୁ ଠେଲିବା ପାଇଁ ଦାୟୀ ନୁହେଁ।

ଯଦି ସମଗ୍ର content area କୁ ସତରେ ବାମକୁ ଲଗାଇବାକୁ ଚାହୁଁଛନ୍ତି, ବାହାରେ ଆଉ ଗୋଟିଏ `HStack` ଘେରି, `Spacer()` ଯୋଡ଼ିପାରିବେ:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI ଆରମ୍ଭିକ ଟ୍ୟୁଟୋରିଆଲ୍")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("କେବଳ କିଛି ବିଷୟବସ୍ତୁ।")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view8.png)

ଏଠାରେ `HStack` ହେଉଛି horizontal layout।

`Spacer()` ଡାହାଣ ପାର୍ଶ୍ୱର ବାକି ସ୍ଥାନ ଦଖଲ କରିବ, ଏହାର ଫଳରେ ବାମ ପାର୍ଶ୍ୱର `VStack` କୁ ସବୁଠାରୁ ବାମକୁ ଠେଲିଦେବ।

ତେଣୁ, `HStack + Spacer()` ସମଗ୍ର content area ର ଅବସ୍ଥାନ ନିୟନ୍ତ୍ରଣ ପାଇଁ ବ୍ୟବହାର କରାଯାଇପାରେ।

ବାସ୍ତବ କୋର୍ସ କାର୍ଡରେ, କୋର୍ସ ବର୍ଣ୍ଣନା ତୁଳନାମୂଳକ ଲମ୍ବା ଥାଏ ଏବଂ ସାଧାରଣତଃ ଅଧିକ ପ୍ରସ୍ଥ ଦଖଲ କରେ, ସେହିପାଇଁ ଏହି ସମସ୍ୟା ସବୁବେଳେ ସ୍ପଷ୍ଟ ହୋଇନପାରେ। କିନ୍ତୁ ଏହି ତଫାତ୍ ବୁଝିବା ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ, କାରଣ ପରେ ଛୋଟ ଟେକ୍ସଟ୍ layout ବନାଇବାବେଳେ ପ୍ରାୟ ଏହିପରି ପରିସ୍ଥିତି ଦେଖିବାକୁ ମିଳେ।

### ଭିତର ଭ୍ୟୁମାନଙ୍କ ମଧ୍ୟର ଦୂରତା ନିୟନ୍ତ୍ରଣ

ପୂର୍ବରୁ ଆମେ `VStack` ଭିତରେ `spacing: 10` ଲେଖିଥିଲୁ:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` ଭିତର ଭ୍ୟୁମାନଙ୍କ ମଧ୍ୟର ଦୂରତା ନିୟନ୍ତ୍ରଣ କରିବାକୁ ବ୍ୟବହୃତ ହୁଏ।

ଯଦି `spacing` ସେଟ୍ ନକରାଯାଏ, `VStack` ର default spacing ମଧ୍ୟ ଥାଏ, କିନ୍ତୁ ସେହି default spacing ସବୁବେଳେ ଆମେ ଚାହୁଁଥିବା ପ୍ରଭାବ ସହିତ ମେଳ ଖାଏନାହିଁ।

ଏଠାରେ, କୋର୍ସ ଶୀର୍ଷକ ଓ କୋର୍ସ ବର୍ଣ୍ଣନା ଅତ୍ୟଧିକ ନିକଟ ହେଲେ ଭିଡ଼ିଆ ଲାଗିବ, ସେହିପାଇଁ ବ୍ୟବହାର କରାଯାଏ:

```swift
spacing: 10
```

ଏହା ସେମାନଙ୍କ ମଧ୍ୟରେ କିଛି ସ୍ଥାନ ରଖେ।

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view9.png)

ସେହିପରି, ଉପର ଅଞ୍ଚଳ ଓ ବିଷୟବସ୍ତୁ ଅଞ୍ଚଳ ମଧ୍ୟ ଉପର-ତଳ ଭାବେ ସଜାଯାଇଛି, ସେଗୁଡ଼ିକ ମଧ୍ୟର ଦୂରତାକୁ ମଧ୍ୟ `spacing` ଦ୍ୱାରା ନିୟନ୍ତ୍ରଣ କରିପାରିବା।

ଏବେ, `topView` ଓ `contentView` କୁ `body` ଭିତରେ ରଖନ୍ତୁ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view10.png)

ଏଠାରେ `VStack(spacing: 20)` `topView` ଓ `contentView` ମଧ୍ୟର ଦୂରତାକୁ ନିୟନ୍ତ୍ରଣ କରେ।

ଅର୍ଥାତ୍:

```swift
VStack(alignment: .leading, spacing: 10)
```

କୋର୍ସ ଶୀର୍ଷକ ଓ କୋର୍ସ ବର୍ଣ୍ଣନା ମଧ୍ୟର ଦୂରତାକୁ ନିୟନ୍ତ୍ରଣ କରେ।

```swift
VStack(spacing: 20)
```

ଉପର ଅଞ୍ଚଳ ଓ ବିଷୟବସ୍ତୁ ଅଞ୍ଚଳ ମଧ୍ୟର ଦୂରତାକୁ ନିୟନ୍ତ୍ରଣ କରେ।

ଦୁଇଟିର ନାମ `spacing` ହେଲେ ମଧ୍ୟ, ସେମାନେ ଭିନ୍ନ `VStack` ଉପରେ କାମ କରୁଥିବାରୁ ପ୍ରଭାବର scope ମଧ୍ୟ ଭିନ୍ନ।

ଏଭଳି କରି ବିଷୟବସ୍ତୁ ଅଞ୍ଚଳର ଭ୍ୟୁ ସମ୍ପୂର୍ଣ୍ଣ ହୋଇଗଲା।

## ବଟନ୍ ଅଞ୍ଚଳ

ତାପରେ ତଳ ବଟନ୍ ଅଞ୍ଚଳ ବନାଇବା।

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view11.png)

ବଟନ୍ ଅଞ୍ଚଳ ମୁଖ୍ୟତଃ ଗୋଟିଏ play icon ଓ ଗୋଟିଏ ଟେକ୍ସଟ୍‌ରୁ ଗଠିତ।

ଆମେ `Image` ବ୍ୟବହାର କରି play icon ଦେଖାଇପାରିବା, ଏବଂ `Text` ବ୍ୟବହାର କରି button text ଦେଖାଇପାରିବା।

ଏଠାରେ ପ୍ରଥମେ ଗୋଟିଏ ବଟନ୍ ରୂପ ବନାଇବା:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("ବଟନ୍ କ୍ଲିକ୍ ହେଲା")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("ଶିଖିବା ଆରମ୍ଭ କରନ୍ତୁ")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view12.png)

ଏଠାରେ ଦୁଇଟି `HStack` ବ୍ୟବହାର ହୋଇଛି:

ଭିତରର `HStack` icon ଓ text କୁ ଆଡ଼କୁ ସଜାଇବା ପାଇଁ ବ୍ୟବହୃତ:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("ଶିଖିବା ଆରମ୍ଭ କରନ୍ତୁ")
}
```

ବାହାରର `HStack` `Spacer()` ସହିତ ମିଶି ଏହି ବଟନ୍ ରୂପକୁ ବାମକୁ ଦେଖାଇବା ପାଇଁ ବ୍ୟବହୃତ:

```swift
HStack {
    ...
    Spacer()
}
```

ବଟନ୍ କ୍ଲିକ୍ କଲେ console ରେ `ବଟନ୍ କ୍ଲିକ୍ ହେଲା` output ହେବ।

## ମୂଳ କାର୍ଡ ସମ୍ପୂର୍ଣ୍ଣ

ଏବେ, ଉପର ଅଞ୍ଚଳ, ବିଷୟବସ୍ତୁ ଅଞ୍ଚଳ ଓ ବଟନ୍ ଅଞ୍ଚଳକୁ ଯୋଡ଼ନ୍ତୁ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ଦେଖାଯାଇଥିବା ପ୍ରଭାବ:

![view](../../../Resource/026_view13.png)

ଏପର୍ଯ୍ୟନ୍ତ, ଗୋଟିଏ ମୂଳ କୋର୍ସ କାର୍ଡ ସମ୍ପୂର୍ଣ୍ଣ ହୋଇଗଲା।

## Swift ଆଇକନ୍ ପୃଷ୍ଠଭୂମି

ଶେଷରେ, ଆମେ କାର୍ଡରେ ଗୋଟିଏ ଅର୍ଦ୍ଧପାରଦର୍ଶୀ Swift ଆଇକନ୍ ପୃଷ୍ଠଭୂମି ଯୋଡ଼ିବୁ।

![view](../../../Resource/026_view.png)

ପୂର୍ବରୁ ଆମେ `Color.indigo` କୁ background color ଭାବେ ବ୍ୟବହାର କରିଥିଲୁ। ବାସ୍ତବରେ, `.background()` ରେ କେବଳ color ନୁହେଁ, ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ view ମଧ୍ୟ ଯୋଡ଼ାଯାଇପାରେ।

ତେଣୁ, ପ୍ରଥମେ ଆମେ ଏକ dedicated background view ତିଆରି କରିପାରିବା:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

ଏହି background view ଭିତରେ, ଆମେ `VStack`、`HStack` ଏବଂ `Spacer()` ବ୍ୟବହାର କରି Swift ଆଇକନ୍‌କୁ ଡାହାଣ ତଳ କୋଣକୁ ଠେଲିଦେଇଛୁ।

Swift ଆଇକନ୍ କେବଳ ସଜାଣା ପୃଷ୍ଠଭୂମି ଭାବେ ବ୍ୟବହୃତ ହେଉଥିବାରୁ, ଏଠାରେ ଅର୍ଦ୍ଧପାରଦର୍ଶୀ ଧଳା ରଙ୍ଗ ବ୍ୟବହାର କରାଯାଇଛି:

```swift
Color.white.opacity(0.15)
```

ଏହା ଦ୍ୱାରା ଆଇକନ୍ ଅତ୍ୟଧିକ ସ୍ପଷ୍ଟ ହେବ ନାହିଁ, ଏବଂ ଆଗର ଟେକ୍ସଟ୍ ବିଷୟବସ୍ତୁକୁ ପ୍ରଭାବିତ କରିବ ନାହିଁ।

ତାପରେ, `backgroundView` କୁ କାର୍ଡରେ ଯୋଡ଼ନ୍ତୁ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ଅନ୍ତିମ ପ୍ରଭାବ:

![view](../../../Resource/026_view14.png)

ଏଠାରେ ଲଗାତାର ଦୁଇଟି `.background()` ବ୍ୟବହାର ହୋଇଛି:

```swift
.background(backgroundView)
.background(Color.indigo)
```

ପ୍ରଥମ `.background()` Swift ଆଇକନ୍ ପୃଷ୍ଠଭୂମି ଯୋଡ଼ିବା ପାଇଁ ବ୍ୟବହୃତ।
ଦ୍ୱିତୀୟ `.background()` ଇଣ୍ଡିଗୋ ରଙ୍ଗର ପୃଷ୍ଠଭୂମି ଯୋଡ଼ିବା ପାଇଁ ବ୍ୟବହୃତ।

ଏହିପରି Swift ଆଇକନ୍ ଇଣ୍ଡିଗୋ ପୃଷ୍ଠଭୂମି ଉପରେ ଦେଖାଯିବ, ଏବଂ କାର୍ଡ background ର ଏକ ଅଂଶ ଭାବେ ଦେଖାଯିବ।

ଏଠାରୁ ଦେଖିପାରିବା, `.background()` କେବଳ ରଙ୍ଗ ଯୋଡ଼ିବାକୁ ନୁହେଁ, custom view ମଧ୍ୟ ଯୋଡ଼ିପାରେ। ଏକାଧିକ `.background()` କୁ ମଧ୍ୟ ମିଶାଇ ବ୍ୟବହାର କରି, ଅଧିକ ସମୃଦ୍ଧ background effect ସୃଷ୍ଟି କରାଯାଇପାରେ।

ଏପର୍ଯ୍ୟନ୍ତ, ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ କୋର୍ସ କାର୍ଡ ସମ୍ପୂର୍ଣ୍ଣ ହୋଇଗଲା।

## ସାରାଂଶ

ଏହି ପାଠରେ ଏକ କୋର୍ସ କାର୍ଡ ମାଧ୍ୟମରେ SwiftUI ର ସାଧାରଣ basic layout ପ୍ରଣାଳୀଗୁଡ଼ିକୁ ପୁନରାବୃତ୍ତି କରିଲୁ।

ଆମେ `Text` ବ୍ୟବହାର କରି ଟେକ୍ସଟ୍ ଦେଖାଇଲୁ, `Image` ବ୍ୟବହାର କରି system icon ଦେଖାଇଲୁ, ଏବଂ `VStack`、`HStack` ଓ `Spacer()` ବ୍ୟବହାର କରି view arrangement ନିୟନ୍ତ୍ରଣ କଲୁ।

`.lineLimit()` ଶିଖିଲୁ। ଏହା text ସର୍ବାଧିକ କେତେ ଲାଇନ୍ ଦେଖାଯିବାକୁ ସୀମିତ କରିପାରେ। ବିଷୟବସ୍ତୁ ସୀମାକୁ ଅତିକ୍ରମ କଲେ, ଅଧିକ ଅଂଶକୁ ସଂକ୍ଷିପ୍ତ କରାଯିବ।

ସେହି ସମୟରେ, ଆମେ `.padding()`、`.background()`、`.cornerRadius()`、`.foregroundStyle()` ଇତ୍ୟାଦି ସାଧାରଣ modifiers କୁ ମଧ୍ୟ ପୁନରାବୃତ୍ତି କଲୁ।

ଏହି ପାଠ ସମ୍ପୂର୍ଣ୍ଣ କରିବା ପରେ, ଆମେ ଏକାଧିକ ଛୋଟ ଭ୍ୟୁକୁ ଯୋଡ଼ି ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ କାର୍ଡ module ବନାଇପାରିବୁ।

ଏହା SwiftUI development ରେ ବହୁତ ସାଧାରଣ ଚିନ୍ତାଧାରା: ପ୍ରଥମେ ଛୋଟ ଭ୍ୟୁରେ ଭାଗ କରନ୍ତୁ, ପରେ ସେଗୁଡ଼ିକୁ ଯୋଡ଼ି ସମ୍ପୂର୍ଣ୍ଣ interface ବନାନ୍ତୁ।

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("ଆରମ୍ଭିକ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ ପାଠ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI ଆରମ୍ଭିକ ଟ୍ୟୁଟୋରିଆଲ୍")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("SwiftUI ସହିତ ଶୂନ୍ୟରୁ ଆରମ୍ଭ କରନ୍ତୁ ଏବଂ Appleଙ୍କ declarative UI development କୁ ପଦ୍ଧତିଗତ ଭାବେ ଶିଖନ୍ତୁ। ସ୍ପଷ୍ଟ ବ୍ୟାଖ୍ୟା ଓ practical examples ମାଧ୍ୟମରେ, ଆପଣ layout, interaction ଓ state management କୁ ଧୀରେ ଧୀରେ ବୁଝିପାରିବେ, ଏବଂ ସୁନ୍ଦର ଓ ଉପଯୋଗୀ app interfaces ବନାଇପାରିବେ।")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("ବଟନ୍ କ୍ଲିକ୍ ହେଲା")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("ଶିଖିବା ଆରମ୍ଭ କରନ୍ତୁ")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
