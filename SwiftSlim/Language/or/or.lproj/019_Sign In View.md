# ସାଇନ୍-ଇନ୍ ଭ୍ୟୁ

ଏହି ପାଠରେ ଆମେ ଗୋଟିଏ ବହୁତ ପ୍ରୟୋଜନୀୟ ପରିସ୍ଥିତି ଶିଖିବୁ, ସେହା ହେଲା ସାଇନ୍-ଇନ୍ ଭ୍ୟୁ।

ସେଥି ଓେବସାଇଟ୍ ହେଉ କି App, ବ୍ୟବହାର ସମୟରେ ଅନେକ ସମୟରେ ବ୍ୟବହାରକାରୀଙ୍କୁ ନିଜ ଖାତା ଏବଂ ପାସୱାର୍ଡ ଦେଇ ଲଗଇନ୍ କରିବାକୁ ପଡେ।

ଉଦାହରଣ ସ୍ୱରୂପ, GitHub ର ଲଗଇନ୍ ପୃଷ୍ଠା:

![WordPress](../../Resource/019_github.png)

ଏହି ପାଠରେ ଆମେ ଏକ ସଦୃଶ ସାଇନ୍-ଇନ୍ ଭ୍ୟୁ ତିଆରି କରିବୁ, ଯେଉଁଠାରେ ବ୍ୟବହାରକାରୀ ନିଜେ ଖାତା ଏବଂ ପାସୱାର୍ଡ ଲେଖିପାରିବେ ଏବଂ ଇନପୁଟ୍‌ରେ କୌଣସି ସମସ୍ୟା ଅଛି କି ନାହିଁ ଯାଞ୍ଚ କରିପାରିବେ।

## ଶୀର୍ଷ ଲେଆଉଟ୍

ଆମେ `ContentView` ଫାଇଲ୍‌ରେ ସାଇନ୍-ଇନ୍ ଭ୍ୟୁର କୋଡ୍ ଲେଖିବୁ।

ପ୍ରଥମେ, ଆସନ୍ତୁ ସାଇନ୍-ଇନ୍ ଭ୍ୟୁର ଉପର ଭାଗର ଚିହ୍ନିତ କ୍ଷେତ୍ର ତିଆରି କରିବା। ଆପଣ ଗୋଟିଏ ଉଚିତ ଆଇକନ୍ ଛବି ପ୍ରସ୍ତୁତ କରି `Assets` ଫୋଲ୍ଡରରେ ରଖିପାରିବେ।

![icon](../../Resource/019_icon1.png)

ତାପରେ, ଛବିକୁ ଦେଖାଇବା ପାଇଁ `Image` ଏବଂ modifier ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

ଏଠାରେ ଥିବା କିଛି modifier ର ଅର୍ଥ:

- `resizable()`: ଛବିର ଆକାର ବଦଳାଯାଇପାରିବ।
- `scaledToFit()`: ଛବିର ମୂଳ ଅନୁପାତ ରଖି ସ୍କେଲ୍ କରେ।
- `frame(width: 100)`: ଛବିର ଦେଖାଯାଉଥିବା ପ୍ରସ୍ଥକୁ `100` କରେ।

ତାପରେ, ସାଇନ୍-ଇନ୍ ଶୀର୍ଷକ ଦେଖାଇବା ପାଇଁ `Text` ଏବଂ modifier ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

ତାପରେ, ଛବି ଏବଂ ଟେକ୍ସ୍ଟକୁ ଉପର-ତଳେ ରଖିବା ପାଇଁ `VStack` ବ୍ୟବହାର କରନ୍ତୁ:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

କାର୍ଯ୍ୟକ୍ଷମ ପରିଣାମ:

![view](../../Resource/019_view.png)

ଏଯାଏଁ ଆସି ଆମେ ସାଇନ୍-ଇନ୍ ଭ୍ୟୁର ଉପର ଶୀର୍ଷକ ଅଞ୍ଚଳ ସମାପ୍ତ କରିଛୁ।

### ଲେଆଉଟ୍ ସୁଧାରଣ

ବର୍ତ୍ତମାନ ଛବି ଏବଂ ଶୀର୍ଷକ ସମଗ୍ର ଲେଆଉଟ୍‌ର ମଧ୍ୟଭାଗରେ ଅଛି।

ଯଦି ଆମେ ଚାହୁଁଛୁ ଯେ ସେମାନେ "ପୃଷ୍ଠାର ଉପର ଭାଗର ଲଗଇନ୍ ଚିହ୍ନ" ପରି ଲାଗୁ, ତେବେ ଅବଶିଷ୍ଟ ସ୍ଥାନକୁ ଭରିବା ପାଇଁ `Spacer()` ବ୍ୟବହାର କରି ସାମଗ୍ରୀକୁ ଉପରକୁ ନିକଟରେ ଦେଖାଇପାରିବା।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

କାର୍ଯ୍ୟକ୍ଷମ ପରିଣାମ:

![view](../../Resource/019_view1.png)

କିନ୍ତୁ ଏବେ `Image` ଏବଂ `Text` ସ୍କ୍ରିନ୍‌ର ଉପରୁ ଅତ୍ୟଧିକ ନିକଟରେ ଅଛି ଏବଂ କିଛି ଭିଡ଼ାଭିଡ଼ି ଲାଗୁଛି।

ଏହି ସମୟରେ, ସମଗ୍ର `VStack` ପାଇଁ ଉପର ଭାଗର ଅନ୍ତର ଯୋଗ କରିବାକୁ `padding` ବ୍ୟବହାର କରିପାରିବା।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

କାର୍ଯ୍ୟକ୍ଷମ ପରିଣାମ:

![view](../../Resource/019_view2.png)

ଏଭଳି କରି ପୃଷ୍ଠାର ଉପର ଶୀର୍ଷକ ଅଞ୍ଚଳ ଅଧିକ ଉଚିତ ଲାଗେ।

## ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ

ଲଗଇନ୍ ପୃଷ୍ଠାରେ ସାଧାରଣତଃ ବ୍ୟବହାରକାରୀଙ୍କୁ ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଲେଖିବାକୁ ପଡେ।

SwiftUI ରେ, ବ୍ୟବହାରକାରୀ ଯାହା ଲେଖନ୍ତି ତାହା ଗ୍ରହଣ କରିବା ପାଇଁ ଆମେ `TextField` ବ୍ୟବହାର କରିପାରିବା।

କିନ୍ତୁ ଧ୍ୟାନ ଦିଅନ୍ତୁ: `TextField` ନିଜେ ଦୀର୍ଘ ସମୟ ପର୍ଯ୍ୟନ୍ତ ଇନପୁଟ୍ ଡାଟା ସଂରକ୍ଷଣ କରେନାହିଁ, ଏହା କେବଳ ଗୋଟିଏ ଇନପୁଟ୍ କଣ୍ଟ୍ରୋଲ୍। ଯାହା ପ୍ରକୃତରେ ଏହି ଡାଟା ସଂରକ୍ଷଣ କରେ, ସେଗୁଡିକ ହେଉଛି ଆମେ ଯାହାକୁ ବାଇଣ୍ଡ୍ କରୁଛୁ ସେଇ ଭେରିଏବଲ୍‌ଗୁଡିକ।

ସେହିପାଇଁ, ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ସଂରକ୍ଷଣ ପାଇଁ ପ୍ରଥମେ ଆମକୁ ଦୁଇଟି `@State` ଭେରିଏବଲ୍ ତିଆରି କରିବାକୁ ପଡିବ:

```swift
@State private var user = ""
@State private var password = ""
```

ଯେତେବେଳେ `@State` ଭେରିଏବଲ୍‌ର ମୂଲ୍ୟ ବଦଳିଯାଏ, SwiftUI ସମ୍ବନ୍ଧିତ ଭ୍ୟୁକୁ ସ୍ୱୟଂଚାଳିତଭାବେ ରିଫ୍ରେଶ କରେ।

ତାପରେ, ଏହି ଦୁଇ ଭେରିଏବଲ୍‌କୁ ବାଇଣ୍ଡ୍ କରିବା ପାଇଁ `TextField` ବ୍ୟବହାର କରନ୍ତୁ:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

ଏଠାରେ `$user` ଏବଂ `$password` ର ଅର୍ଥ "ବାଇଣ୍ଡିଂ"।

ଅର୍ଥାତ୍, ବ୍ୟବହାରକାରୀ ଇନପୁଟ୍ ବକ୍ସରେ ଟେକ୍ସ୍ଟ ଲେଖିବା ସମୟରେ ଭେରିଏବଲ୍‌ର ମୂଲ୍ୟ ମଧ୍ୟ ସେହି ସମୟରେ ବଦଳିଯାଏ; ଭେରିଏବଲ୍ ବଦଳିଲେ, ବକ୍ସରେ ଦେଖାଯାଉଥିବା ଟେକ୍ସ୍ଟ ମଧ୍ୟ ବଦଳିଯାଏ।

"ଭ୍ୟୁ ଏବଂ ଡାଟା ପରସ୍ପର ସମନ୍ୱୟ ହେଉଥିବା" ଏହି ସମ୍ପର୍କକୁ ବାଇଣ୍ଡିଂ କୁହାଯାଏ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ, ଏଠାରେ `$` ସହିତ ଥିବା ଲେଖାଶୈଳୀ ବ୍ୟବହାର କରିବାକୁ ପଡିବ:

```swift
$user
```

କାରଣ `TextField` କୁ ସାଧାରଣ string ନୁହେଁ, ବରଂ "ଦୁଇ ଦିଗରେ ଡାଟା ବଦଳାଇପାରୁଥିବା" ଗୋଟିଏ binding value ଆବଶ୍ୟକ।

### ଇନପୁଟ୍ ବକ୍ସ ଦେଖାଇବା

ସେଗୁଡିକୁ `ContentView` ଭିତରେ ରଖନ୍ତୁ:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

ଦେଖାଯାଉଥିବା ପରିଣାମ:

![view](../../Resource/019_view3.png)

କାରଣ ବର୍ତ୍ତମାନ `user` ଏବଂ `password` ଦୁହିଁଟିର ଡିଫଲ୍ଟ ମୂଲ୍ୟ ଖାଲି string:

```swift
""
```

ସେହିପାଇଁ ଇନପୁଟ୍ ବକ୍ସରେ ପ୍ରଥମେ placeholder ଟେକ୍ସ୍ଟ ଦେଖାଯିବ, ଯେପରି:

```swift
input user
```

ଏହି ଟେକ୍ସ୍ଟ କେବଳ ବ୍ୟବହାରକାରୀଙ୍କୁ "ଏଠାରେ କ'ଣ ଲେଖିବା ଉଚିତ" ବୋଲି ସୂଚନା ଦେବା ପାଇଁ, ଏହା ପ୍ରକୃତ ଇନପୁଟ୍ ନୁହେଁ।

### ଇନପୁଟ୍ ବକ୍ସ ସୁଧାରଣ

ବର୍ତ୍ତମାନ ଇନପୁଟ୍ ବକ୍ସଗୁଡିକ ବ୍ୟବହାର କରିହୋଇପାରୁଛି, କିନ୍ତୁ ଡିଫଲ୍ଟ ଶୈଳୀ ଅଳ୍ପ ସରଳ।

ଇଣ୍ଟରଫେସ୍‌କୁ ଅଧିକ ସ୍ପଷ୍ଟ କରିବା ପାଇଁ ଆମେ ଇନପୁଟ୍ ବକ୍ସର ପୂର୍ବରୁ ଏକ ଶୀର୍ଷକ ଯୋଗ କରିପାରିବା ଏବଂ ବକ୍ସ ପାଇଁ କିଛି ସରଳ ଶୈଳୀ ସୁଧାରଣ କରିପାରିବା।

ଉଦାହରଣ ସ୍ୱରୂପ, ପ୍ରଥମେ ଗୋଟିଏ ଶୀର୍ଷକ ଯୋଗ କରନ୍ତୁ:

```swift
Text("Username")
    .fontWeight(.bold)
```

ତାପରେ, ଶୀର୍ଷକ ଏବଂ ଇନପୁଟ୍ ବକ୍ସକୁ ଏକେ ଲାଇନ୍‌ରେ ରଖିବା ପାଇଁ `HStack` ବ୍ୟବହାର କରନ୍ତୁ:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

ଏଠାରେ `HStack` ବ୍ୟବହାର କରାଯାଇଛି, କାରଣ ଆମେ "ବାମପଟେ ଶୀର୍ଷକ ଏବଂ ଡାହାଣପଟେ ଇନପୁଟ୍ ବକ୍ସ" ଦେଖାଇବାକୁ ଚାହୁଁଛୁ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ, `TextField` ଡିଫଲ୍ଟ ଭାବେ ଅବଶିଷ୍ଟ ଉପଲବ୍ଧ ସ୍ଥାନକୁ ଦଖଲ କରିଥାଏ।

![color](../../Resource/019_view6.png)

ଦୁଇଟି ଇନପୁଟ୍ ବକ୍ସର ଆକାରକୁ ଅଧିକ ସମାନ କରିବା ପାଇଁ, ଆମେ `frame(width:)` ବ୍ୟବହାର କରି ପ୍ରସ୍ଥ ସେଟ୍ କରିପାରିବା, ଯାହାର ଫଳରେ ବକ୍ସଗୁଡିକ ଅଧିକ ସୁଖିଳା ଦେଖାଯିବ।

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

ତାପରେ, ଇନପୁଟ୍ ବକ୍ସକୁ ଅଧିକ ସ୍ପଷ୍ଟ କରିବା ପାଇଁ ଗୋଟିଏ border ଯୋଗ କରନ୍ତୁ:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ଏବେ ଆମେ `ContentView` ଭ୍ୟୁରେ ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଦୁହିଁଟିକୁ ଯୋଗ କରିବା:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

ଦେଖାଯାଉଥିବା ପରିଣାମ:

![view](../../Resource/019_view4.png)

ଏଯାଏଁ ଆସି ବ୍ୟବହାରକାରୀ ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଲେଖିପାରିବେ।

## ସାଇନ୍-ଇନ୍ ବଟନ୍

ଏବେ ଆମେ ଇନପୁଟ୍ ବକ୍ସର ତଳେ ଗୋଟିଏ ସାଇନ୍-ଇନ୍ ବଟନ୍ ଯୋଗ କରିବା।

```swift
Button("Sign in") {

}
```

ତାପରେ, ବଟନ୍‌କୁ ଅଧିକ ସ୍ପଷ୍ଟ ସିଷ୍ଟମ୍ ଶୈଳୀ ଦେବା ପାଇଁ `buttonStyle` ବ୍ୟବହାର କରନ୍ତୁ:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

ଦେଖାଯାଉଥିବା ପରିଣାମ:

![view](../../Resource/019_view5.png)

ବଟନ୍‌ଟି ନିଶ୍ଚୟ କ୍ଲିକ୍‌ରେ ପ୍ରତିକ୍ରିୟା କରୁଛି କି ନାହିଁ ସୁନିଶ୍ଚିତ କରିବାକୁ, ପ୍ରଥମେ ଆମେ ବଟନ୍‌ରେ ଗୋଟିଏ `print` ଲେଖି ପରୀକ୍ଷା କରିପାରିବା:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

ବଟନ୍‌କୁ କ୍ଲିକ୍ କଲେ, କନସୋଲ୍‌ରେ ଏହା ଦେଖାଯିବ:

```swift
click Sign in
```

ଏଥିରୁ ବୁଝାଯାଏ ଯେ ବଟନ୍‌ଟି ସଫଳତାର ସହିତ କ୍ଲିକ୍ କାର୍ଯ୍ୟରେ ପ୍ରତିକ୍ରିୟା କରୁଛି।

## ସାଇନ୍-ଇନ୍ ଲଜିକ୍

ଏବେ ଆମେ ସାଇନ୍-ଇନ୍ ବଟନ୍‌ରେ ଗୋଟିଏ ସର୍ବାଧିକ ମୌଳିକ ଯାଞ୍ଚ ଲଜିକ୍ ଯୋଗ କରିବା: **ବ୍ୟବହାରକାରୀ ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଲେଖିଛନ୍ତି କି ନାହିଁ ଯାଞ୍ଚ କରିବା**।

ଆମେ ନିମ୍ନଲିଖିତ କିଛି ପରିସ୍ଥିତି କାର୍ଯ୍ୟକାରୀ କରିବାକୁ ଚାହୁଁଛୁ:

- ବ୍ୟବହାରକାରୀ କିଛିମଧ୍ୟ ଲେଖିନାହାନ୍ତି ହେଲେ, `Empty` ଆଉଟପୁଟ୍ କରନ୍ତୁ
- ବ୍ୟବହାରକାରୀ କେବଳ ଗୋଟିଏ ଅଂଶ ଲେଖିଥିଲେ, କେଉଁଟି ଅଭାବ ଅଛି ତାହା ସୂଚନା ଦିଅନ୍ତୁ
- ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଦୁହିଁଟି ଲେଖାହୋଇଥିଲେ, `Success` ଆଉଟପୁଟ୍ କରନ୍ତୁ

### କୌଣସି ସୂଚନା ଲେଖାଯାଇନାହିଁ

କାରଣ `user` ଏବଂ `password` ଦୁହିଁଟିର ଡିଫଲ୍ଟ ମୂଲ୍ୟ ଖାଲି string:

```swift
@State private var user = ""
@State private var password = ""
```

ସେହିପାଇଁ ବ୍ୟବହାରକାରୀ କିଛିମଧ୍ୟ ଲେଖିନାହାନ୍ତି ହେଲେ ସେଗୁଡିକ ଖାଲି ରହିଯାଏ।

Swift ରେ, `String` ପରି type ଗୁଡିକରେ `isEmpty` ବ୍ୟବହାର କରି ବିଷୟବସ୍ତୁ ଖାଲି କି ନୁହେଁ ଯାଞ୍ଚ କରିପାରିବା।

### isEmpty ଗୁଣ

`isEmpty` ସାଧାରଣତଃ string, array ଇତ୍ୟାଦି ଖାଲି କି ନୁହେଁ ଯାଞ୍ଚ ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

ବିଷୟବସ୍ତୁ ଖାଲି ହେଲେ `isEmpty` `true` ଫେରାଇଥାଏ; ଖାଲି ନହେଲେ `isEmpty` `false` ଫେରାଇଥାଏ।

ସେହିପାଇଁ, ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡରେ ଇନପୁଟ୍ ଅଛି କି ନାହିଁ ବୁଝିବା ପାଇଁ ଆମେ ଏହାକୁ ବ୍ୟବହାର କରିପାରିବା।

### ଭେରିଏବଲ୍ ଯାଞ୍ଚ ପାଇଁ isEmpty ବ୍ୟବହାର

ଯଦି ବ୍ୟବହାରକାରୀ କୌଣସି ସୂଚନା ଲେଖିନାହାନ୍ତି, ତେବେ:

```swift
user.isEmpty // true
password.isEmpty    // true
```

ଏହି ସମୟରେ, ଆମେ ଏଭଳି ଶର୍ତ୍ତ ଲେଖିପାରିବା:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

ଏହି କୋଡ୍‌ର ଅର୍ଥ ହେଉଛି: ଯଦି `user` ଖାଲି ଅଛି ଏବଂ `password` ମଧ୍ୟ ଖାଲି ଅଛି, ତେବେ ଆଉଟପୁଟ୍ କରନ୍ତୁ:

```swift
Empty
```

ଏଠାରେ `&&` ଗୋଟିଏ logical operator, ଯାହାର ଅର୍ଥ "ଏବଂ"।

ଅର୍ଥାତ୍, ବାମପଟିର ଶର୍ତ୍ତ ସତ୍ୟ ଏବଂ ଡାହାଣପଟିର ଶର୍ତ୍ତ ମଧ୍ୟ ସତ୍ୟ ହେଲେମାତ୍ର ସମଗ୍ର ଶର୍ତ୍ତ ସତ୍ୟ ହୁଏ।

ସେହିପାଇଁ, କେବଳ ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଦୁହିଁଟି ଖାଲି ଥିଲେ ଏହି କୋଡ୍ ଚାଲିବ।

## ବ୍ୟବହାରକାରୀ କେବଳ ଅଂଶିକ ସୂଚନା ଭରିଛନ୍ତି

ଏବେ ଆମେ ଅନ୍ୟ ଗୋଟିଏ ପରିସ୍ଥିତି ଭାବିବା: ବ୍ୟବହାରକାରୀ କେବଳ ବ୍ୟବହାରକାରୀନାମ ଭରିଛନ୍ତି, କିମ୍ବା କେବଳ ପାସୱାର୍ଡ ଭରିଛନ୍ତି।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

ଏହି ସମୟରେ ବ୍ୟବହାରକାରୀନାମ ଖାଲି ନୁହେଁ, କିନ୍ତୁ ପାସୱାର୍ଡ ଖାଲି।

ଆମେ ଏହା ଯାଞ୍ଚ କରିବାକୁ `isEmpty` ବ୍ୟବହାର କରିଚାଲିପାରିବା:

### ବ୍ୟବହାରକାରୀ ଖାତା କିମ୍ବା ପାସୱାର୍ଡ ଭରିଥିବା ପରିସ୍ଥିତି

ଯଦି ବ୍ୟବହାରକାରୀ କେବଳ ବ୍ୟବହାରକାରୀନାମ କିମ୍ବା ପାସୱାର୍ଡ ଭରିଛନ୍ତି, ତେବେ ଯେଉଁ ତଥ୍ୟ ଅଭାବ ଅଛି ସେହି ଅନୁଯାୟୀ ସୂଚନା ଦେବାକୁ ପଡିବ।

ଉଦାହରଣ ସ୍ୱରୂପ, ବ୍ୟବହାରକାରୀ କେବଳ ବ୍ୟବହାରକାରୀନାମ ଭରିଛନ୍ତି:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ଏହି କୋଡ୍‌ର ଲଜିକ୍ ହେଉଛି: ବ୍ୟବହାରକାରୀନାମ ଖାଲି ହେଲେ, ବ୍ୟବହାରକାରୀନାମ ଲେଖିବାକୁ କୁହନ୍ତୁ। ନହେଲେ ପାସୱାର୍ଡ ଖାଲି କି ନାହିଁ ଯାଞ୍ଚ କରନ୍ତୁ; ପାସୱାର୍ଡ ଖାଲି ହେଲେ, ପାସୱାର୍ଡ ଲେଖିବାକୁ କୁହନ୍ତୁ।

### ବ୍ୟବହାରକାରୀ ସମସ୍ତ ସୂଚନା ଭରିଛନ୍ତି

ଯଦି ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଦୁହିଁଟି ଲେଖାହୋଇଥାଏ, ତେବେ ସେମାନଙ୍କର `isEmpty` ଦୁହିଁଟି `false` ଫେରାଇବ।

ଏହି ସମୟରେ ଆମେ ଏଭଳି ଲେଖିପାରିବା:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

ଏଠାରେ `!` ର ଅର୍ଥ "ଉଲ୍ଟା" କିମ୍ବା "not"।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

ଅର୍ଥାତ୍, `user.isEmpty` ରେ "ବ୍ୟବହାରକାରୀନାମ ଖାଲି କି ନୁହେଁ" ଯାଞ୍ଚ ହୁଏ, ଏବଂ `!user.isEmpty` ରେ "ବ୍ୟବହାରକାରୀନାମ ଖାଲି ନୁହେଁ କି ନୁହେଁ" ଯାଞ୍ଚ ହୁଏ।

ପାସୱାର୍ଡ ପାଇଁ ମଧ୍ୟ ସେଇ ଲଜିକ୍ ଲାଗୁ ହୁଏ।

ସେହିପାଇଁ, ଏହି କୋଡ୍‌ର ଅର୍ଥ ହେଉଛି: ବ୍ୟବହାରକାରୀନାମ ଖାଲି ନୁହେଁ, ଏବଂ ପାସୱାର୍ଡ ମଧ୍ୟ ଖାଲି ନୁହେଁ।

ଯେତେବେଳେ ଏହି ଦୁଇ ଶର୍ତ୍ତ ପୂରଣ ହୁଏ, ତେବେ ଆଉଟପୁଟ୍ ହୁଏ:

```swift
Success
```

## ସମ୍ପୂର୍ଣ୍ଣ ଯାଞ୍ଚ ଲଜିକ୍

ଏବେ ଆମେ ଏହି ତିନୋଟି ପରିସ୍ଥିତିକୁ ଏକସାଥିରେ ଯୋଡି `Button` ଭିତରେ ଲେଖିବା:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

ଏହି କୋଡ୍‌ର କାର୍ଯ୍ୟନ୍ୱୟନ କ୍ରମକୁ ଏଭଳି ବୁଝିପାରିବା:

ପ୍ରଥମ ପଦକ୍ଷେପ, ପ୍ରଥମେ ଯାଞ୍ଚ କରନ୍ତୁ:

```swift
if user.isEmpty && password.isEmpty
```

ଯଦି ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଦୁହିଁଟି ଖାଲି ହୁଏ, ତେବେ ସିଧାସଳଖ `Empty` ଆଉଟପୁଟ୍ ହୁଏ।

ଯଦି ଦୁହିଁଟି ଖାଲି ନୁହେଁ, ତେବେ ପରବର୍ତ୍ତୀ ଏହି ଲାଇନ୍‌କୁ ଯାଞ୍ଚ କରାଯାଏ:

```swift
else if user.isEmpty || password.isEmpty
```

ଏଠାରେ `||` ର ଅର୍ଥ "କିମ୍ବା"।

ଅର୍ଥାତ୍, ଯେକୌଣସି ଗୋଟିଏ ଶର୍ତ୍ତ ସତ୍ୟ ହେଲେମାତ୍ର ସମଗ୍ର ଶର୍ତ୍ତ ସତ୍ୟ ହୁଏ।

ସେହିପାଇଁ ବ୍ୟବହାରକାରୀନାମ ଖାଲି ହେଉ କିମ୍ବା ପାସୱାର୍ଡ ଖାଲି ହେଉ, `else if` ର କୋଡ୍ ବ୍ଲକ୍ ଚାଲିବ।

କୋଡ୍ ବ୍ଲକ୍‌ରେ ପ୍ରବେଶ କରିବା ପରେ, କେଉଁ ଇନପୁଟ୍ ବକ୍ସ ଭରାଯାଇନାହିଁ ତାହା ପୁଣିଥରେ ଯାଞ୍ଚ କରିବା:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ଯଦି ଆଗରୁ ଥିବା ଦୁଇଟି ଶର୍ତ୍ତ ପୂରଣ ହୁଏନାହିଁ, ତେବେ ତାହାର ଅର୍ଥ ବ୍ୟବହାରକାରୀନାମ ଖାଲି ନୁହେଁ ଏବଂ ପାସୱାର୍ଡ ମଧ୍ୟ ଖାଲି ନୁହେଁ।

ତେବେ ପ୍ରୋଗ୍ରାମ୍ ଶେଷ `else` ଭିତରକୁ ପ୍ରବେଶ କରେ:

```swift
print("Success")
```

ଏଭଳି ଆମେ ସର୍ବାଧିକ ମୌଳିକ ଲଗଇନ୍ ଇନପୁଟ୍ ଯାଞ୍ଚ ଲଜିକ୍ ସମାପ୍ତ କଲୁ।

## ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଯାଞ୍ଚ

ଉପରୋକ୍ତ ଲଜିକ୍ କେବଳ "କିଛି ଲେଖାଯାଇଛି କି ନୁହେଁ" ଯାଞ୍ଚ କରେ।

କିନ୍ତୁ ପ୍ରକୃତ App ରେ କେବଳ କିଛି ଲେଖିବା ମାତ୍ରରେ କାମ ସରେନାହିଁ। ସାଧାରଣତଃ ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡକୁ server କୁ ପଠାଇ ଯାଞ୍ଚ କରିବାକୁ ପଡେ।

ଯଦି server ନିଶ୍ଚିତ କରେ ଯେ ବ୍ୟବହାରକାରୀନାମ ଅଛି ଏବଂ ପାସୱାର୍ଡ ଠିକ୍, ତେବେ ଲଗଇନ୍ ଅନୁମତି ମିଳିବ; ନହେଲେ ଲଗଇନ୍ ବିଫଳ ବୋଲି ସୂଚନା ଦିଆଯିବ।

ଏହି ପ୍ରକ୍ରିୟାର ଅଭ୍ୟାସ ପାଇଁ, ଆମେ ପ୍ରଥମେ କୋଡ୍‌ରେ ଗୋଟିଏ ଅସ୍ଥାୟୀ ଖାତା ଏବଂ ପାସୱାର୍ଡ ସେଟ୍ କରି "ଠିକ୍ ଲଗଇନ୍ ସୂଚନା" କୁ ଅନୁକରଣ କରିପାରିବା:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ଦୁହିଁଟି ଖାଲି ନୁହେଁ ହେଲେ, ପରେ ଆମେ ସେଗୁଡିକ ଠିକ୍ କି ନୁହେଁ ତୁଳନା କରିବା:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

ଏଠାରେ `==` ର ଅର୍ଥ "ସମାନ କି ନୁହେଁ"।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
user == userID
```

ଏହାର ଅର୍ଥ, ବ୍ୟବହାରକାରୀ ଲେଖିଥିବା ବ୍ୟବହାରକାରୀନାମ ଆମେ ସେଟ୍ କରିଥିବା ଠିକ୍ ବ୍ୟବହାରକାରୀନାମ ସହ ପୂରାପୁରି ମେଳାଉଛି କି ନାହିଁ; ପାସୱାର୍ଡ ପାଇଁ ମଧ୍ୟ ସେହି ଲଜିକ୍ ଲାଗୁ ହୁଏ।

ସେହିପାଇଁ, ଇନପୁଟ୍ ହୋଇଥିବା ବ୍ୟବହାରକାରୀନାମ ଏବଂ ପାସୱାର୍ଡ ସେଟ୍ ମୂଲ୍ୟ ସହ ସମାନ ହେଲେ `Success` ଆଉଟପୁଟ୍ ହୁଏ; ଯେକୌଣସି ଗୋଟିଏ ସମାନ ନହେଲେ `Input error` ଆଉଟପୁଟ୍ ହୁଏ।

ଏଭଳି ଆମେ ଗୋଟିଏ ସରଳ "ଅନୁକଳିତ ଲଗଇନ୍ ଯାଞ୍ଚ" ସମାପ୍ତ କଲୁ।

ଯଦିଓ ଏହା ଏବେପର୍ଯ୍ୟନ୍ତ ସର୍ଭର ସହ ଯୋଡାଯାଇଥିବା ପ୍ରକୃତ ଲଗଇନ୍ ଫଙ୍କସନ୍ ନୁହେଁ, ତଥାପି ଏହା ଆମକୁ ବୁଝିବାକୁ ପ୍ରଚୁର ସାହାଯ୍ୟ କରେ: **ବଟନ୍ କ୍ଲିକ୍ ହେବା ପରେ, ଭିନ୍ନ ଶର୍ତ୍ତ ଅନୁଯାୟୀ ଭିନ୍ନ କୋଡ୍ ଚାଲିପାରେ**।

## ସାରାଂଶ

ଏହି ପାଠରେ ଆମେ ଗୋଟିଏ ମୌଳିକ ସାଇନ୍-ଇନ୍ ଭ୍ୟୁ ସମାପ୍ତ କରିଛୁ ଏବଂ ବିଶେଷ କରି "ଶର୍ତ୍ତ ଅନୁସାରେ ଇନପୁଟ୍ ବିଷୟବସ୍ତୁ ନିର୍ଣ୍ଣୟ କରିବାର ଲଜିକ୍" ଶିଖିଛୁ।

ଏହି ପାଠର ମୁଖ୍ୟ ବିଷୟ ହେଉଛି `isEmpty` ବ୍ୟବହାର କରି string ଖାଲି କି ନୁହେଁ ଯାଞ୍ଚ କରିବା, ଏବଂ `if` statement ସହ logical operator ବ୍ୟବହାର କରି ଭିନ୍ନ ପରିସ୍ଥିତି ହାତଲ କରିବା।

ଦୁଇଟି ବହୁତ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ logical operator ହେଉଛି:

- `&&`: "ଏବଂ" ବୁଝାଏ, ଦୁଇଟି ଶର୍ତ୍ତ ଉଭୟ ପୂରଣ ହେବା ଆବଶ୍ୟକ
- `||`: "କିମ୍ବା" ବୁଝାଏ, ଯେକୌଣସି ଗୋଟିଏ ଶର୍ତ୍ତ ପୂରଣ ହେଲେ ଚାଲିବ

ଯେତେବେଳେ ଏହି ଶର୍ତ୍ତଗୁଡିକ ଶେଷରେ `true` କିମ୍ବା `false` ହୋଇଯାଏ, `if` statement ସେହି ପରିଣାମ ଅନୁଯାୟୀ ଭିନ୍ନ କୋଡ୍ ଚାଲାଏ।

ଏହି ସାଇନ୍-ଇନ୍ ଭ୍ୟୁ ମାଧ୍ୟମରେ ଆମେ "ଇଣ୍ଟରଫେସ୍ + ଡାଟା + ତର୍କସଙ୍ଗତ ନିର୍ଣ୍ଣୟ" ମିଶାଇଥିବା ଏକ ବିକାଶ ପ୍ରକ୍ରିୟା ସହ ପରିଚିତ ହେବା ଆରମ୍ଭ କରିଛୁ।

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
