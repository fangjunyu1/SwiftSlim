# ଲଗଇନ୍ ଇଣ୍ଟରାକ୍ସନ୍

ପୂର୍ବ ପାଠରେ, ଆମେ ଗୋଟିଏ ଲଗଇନ୍ ଭ୍ୟୁ ତିଆରି କରିଥିଲୁ ଏବଂ ବଟନ୍ ଓ ବିଚାର ଲଜିକ୍ ମାଧ୍ୟମରେ ଇନପୁଟ୍ ବିଷୟବସ୍ତୁର ସରଳ ଯାଞ୍ଚ କରିଥିଲୁ।

ଏହି ପାଠରେ, ଆମେ ପୂର୍ବ ପାଠର କୋଡ୍‌କୁ ଆଧାର କରି `SecureField` ପାସୱାର୍ଡ ଇନପୁଟ୍ ବକ୍ସ, `Alert` ସତର୍କତା ବକ୍ସ, ଏବଂ ଭେରିଏବଲ୍‌ର ଆଧାରରେ ଭିନ୍ନ ଭ୍ୟୁ କିପରି ଦେଖାଯିବ ତାହା ଶିଖିବା।

ଏହି ପାଠ ମାଧ୍ୟମରେ, ଆପଣ ଲଗଇନ୍ ଭ୍ୟୁର ମୌଳିକ ଇଣ୍ଟରାକ୍ସନ୍ ପ୍ରବାହକୁ ଅଧିକ ଭଲଭାବେ ବୁଝିପାରିବେ, ଏବଂ ଏହା ଅନେକ ଆପ୍‌ରେ ବ୍ୟବହୃତ ହେଉଥିବା ଏକ ମୌଳିକ ଲଜିକ୍ ମଧ୍ୟ ଅଟେ।

## ପାସୱାର୍ଡ ଇନପୁଟ୍ ବକ୍ସ

ଗତ ପାଠରେ, ଆମେ ପାସୱାର୍ଡ ଲେଖିବାକୁ `TextField` ବ୍ୟବହାର କରିଥିଲୁ।

କିନ୍ତୁ ପ୍ରକୃତ ଲଗଇନ୍ ଇଣ୍ଟରଫେସ୍‌ରେ, ପାସୱାର୍ଡ ସାଧାରଣତଃ ସିଧାସଳଖ ଦେଖାଯାଏ ନାହିଁ; ପରିବର୍ତ୍ତେ ଏହା ଡଟ୍ କିମ୍ବା ଅନ୍ୟ କୌଣସି ଲୁଚାଇଥିବା ପ୍ରଭାବ ଭାବରେ ଦେଖାଯାଏ, ଯାହାଦ୍ୱାରା ବ୍ୟବହାରକାରୀଙ୍କ ଗୋପନୀୟତା ରକ୍ଷା ପାଏ।

SwiftUI ରେ, ପାସୱାର୍ଡ ଇନପୁଟ୍ ପାଇଁ ବିଶେଷଭାବରେ ବ୍ୟବହୃତ କଣ୍ଟ୍ରୋଲ୍ ହେଉଛି `SecureField`।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
SecureField("Password", text: $password)
```

ଏହାର ଲେଖା ପ୍ରକାର `TextField` ସହ ବହୁତ ମିଳିଥାଏ। ଏଥିପାଇଁ ମଧ୍ୟ ଗୋଟିଏ ସୂଚନାମୂଳକ ଟେକ୍ସ୍ଟ ଏବଂ ଗୋଟିଏ ବାଉଣ୍ଡ ଭେରିଏବଲ୍ ଆବଶ୍ୟକ।

ଏହାକୁ ସରଳ ଭାବରେ ଏଭଳି ବୁଝିପାରିବା: `SecureField` ମଧ୍ୟ ଗୋଟିଏ ଇନପୁଟ୍ ବକ୍ସ, କେବଳ ଏହା ଲେଖାଯାଇଥିବା ବିଷୟବସ୍ତୁକୁ ଲୁଚାଇ ରଖେ।

ପୂର୍ବରୁ ପାସୱାର୍ଡ ଲେଖିବା ପାଇଁ ବ୍ୟବହୃତ `TextField` କୁ ଆମେ ସିଧାସଳଖ `SecureField` କୁ ବଦଳାଇପାରିବା:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ବ୍ୟବହାରକାରୀ ପାସୱାର୍ଡ ଲେଖୁଥିବାବେଳେ, ପାସୱାର୍ଡର ବିଷୟବସ୍ତୁ ଇଣ୍ଟରଫେସ୍‌ରେ ସିଧାସଳଖ ଦେଖାଯିବ ନାହିଁ।

ପ୍ରଦର୍ଶନ ପ୍ରଭାବ:

![password](../../Resource/020_password.png)

ଏବେ, ଆମେ ୟୁଜରନେମ୍ ଏବଂ ପାସୱାର୍ଡ ଲେଖିପାରିବା, ଏବଂ ବଟନ୍ କ୍ଲିକ୍ କରିବା ପରେ ଇନପୁଟ୍ ଠିକ୍ କି ନୁହେଁ ତାହା ନିର୍ଣ୍ଣୟ କରିପାରିବା।

### ପ୍ରତିକ୍ରିୟା ସନ୍ଦେଶ ଦେଖାଇବା

ଏହାର ପୂର୍ବରୁ, ଆମେ ଫଳାଫଳ ଆଉଟପୁଟ୍ କରିବାକୁ ସବୁବେଳେ `print` ବ୍ୟବହାର କରୁଥିଲୁ।

`print` ର ବିଷୟବସ୍ତୁ କେବଳ କନସୋଲ୍‌ରେ ଦେଖାଯାଏ। ଡିଭେଲପରମାନେ Xcode ରେ ପ୍ରୋଗ୍ରାମ୍ ଚଲାଇବାବେଳେ ଏହାକୁ ଦେଖିପାରନ୍ତି, କିନ୍ତୁ ସାଧାରଣ ବ୍ୟବହାରକାରୀମାନେ ଫୋନ୍‌ରେ ଏହି ସନ୍ଦେଶଗୁଡ଼ିକୁ ଦେଖିପାରନ୍ତି ନାହିଁ।

ଏହାର ଅର୍ଥ, ପ୍ରୋଗ୍ରାମ୍ ଯାଞ୍ଚ ସମ୍ପୂର୍ଣ୍ଣ କରିଥିଲେ ମଧ୍ୟ, ବ୍ୟବହାରକାରୀ ଇନପୁଟ୍ ବିଷୟବସ୍ତୁ ଠିକ୍ କି ନୁହେଁ ଜାଣିପାରେ ନାହିଁ।

ଏହି ସମୟରେ, ଆମକୁ ଏଭଳି ଗୋଟିଏ ଉପାୟ ଆବଶ୍ୟକ ଯାହା ସିଧାସଳଖ ଇଣ୍ଟରଫେସ୍‌ରେ ସନ୍ଦେଶ ଦେଖାଇପାରିବ।

## Alert ସତର୍କତା ବକ୍ସ

SwiftUI ରେ, ଆମେ `Alert` ବ୍ୟବହାର କରି ଗୋଟିଏ ପପ୍-ଅପ୍ ସନ୍ଦେଶ ବକ୍ସ ଦେଖାଇପାରିବା।

ମୌଳିକ ବ୍ୟବହାର:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

ଏହି କୋଡ୍ ପୂର୍ବରୁ ଶିଖିଥିବା କଣ୍ଟ୍ରୋଲ୍‌ଗୁଡ଼ିକଠାରୁ ଅଲ୍ପ ଅଧିକ ଜଟିଳ ଲାଗେ, କିନ୍ତୁ ଏହାକୁ ଭାଗ କରି ବୁଝିପାରିବା।

`Alert` ମୁଖ୍ୟତଃ ନିମ୍ନଲିଖିତ ଅଂଶଗୁଡ଼ିକୁ ନେଇ ଗଠିତ:

- `"Title"`: ସତର୍କତା ବକ୍ସର ଶୀର୍ଷକ
- `isPresented`: ସତର୍କତା ବକ୍ସ ଦେଖାଯିବ କି ନାହିଁ ତାହା ନିୟନ୍ତ୍ରଣ କରୁଥିବା ଗୋଟିଏ ବାଉଣ୍ଡ Boolean ମୂଲ୍ୟ
- `Button(...)`: ସତର୍କତା ବକ୍ସର ବଟନ୍
- `message:`: ସତର୍କତା ବକ୍ସରେ ଦେଖାଯାଉଥିବା ସନ୍ଦେଶର ବିଷୟବସ୍ତୁ

ଏହାକୁ ସରଳ ଭାବରେ ଏଭଳି ବୁଝିପାରିବା: ବାଉଣ୍ଡ ଭେରିଏବଲ୍ `true` ହେଲେ, ସିଷ୍ଟମ୍ ଏହି ସତର୍କତା ବକ୍ସକୁ ପପ୍ ଅପ୍ କରିଦେବ।

ପ୍ରଦର୍ଶନ ପ୍ରଭାବ:

![alert](../../Resource/020_alert3.png)

ଅନୁରୂପ ଗଠନ:

![alert](../../Resource/020_alert.png)

### Alert ହେଉଛି ଗୋଟିଏ modifier

ପୂର୍ବରୁ ଆମେ ଶିଖିଥିବା ଅନେକ modifier ପରି, `Alert` ମଧ୍ୟ କୌଣସି ନିର୍ଦ୍ଦିଷ୍ଟ view ପରେ ଯୋଡ଼ାଯାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଏହାକୁ ବଟନ୍‌ର ପରେ ଯୋଡ଼ାଯାଇପାରେ:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

ଏହାକୁ ବାହାରର `VStack` ପରେ ମଧ୍ୟ ଯୋଡ଼ାଯାଇପାରେ:

```swift
VStack {
    // ...
}
.alert() {...}
```

ଅର୍ଥାତ୍, `Alert` ହେଉଛି ଇଣ୍ଟରଫେସ୍‌ରେ ଅଲଗାରେ ରଖାଯାଇଥିବା ଗୋଟିଏ ସ୍ୱତନ୍ତ୍ର view ନୁହେଁ; ଏହା କୌଣସି ନିର୍ଦ୍ଦିଷ୍ଟ view ସହ ଯୁକ୍ତ ଥିବା ଗୋଟିଏ modifier।

ଏହାକୁ ସରଳ ଭାବରେ ଏଭଳି ବୁଝାଯାଇପାରେ: `Alert` ସାଧାରଣତଃ ବଟନ୍ କିମ୍ବା ବାହ୍ୟ layout ପରେ ଲେଖାଯାଏ, ଯାହାଦ୍ୱାରା କୌଣସି ନିର୍ଦ୍ଦିଷ୍ଟ ଅବସ୍ଥା ପୂରଣ ହେଲେ ସନ୍ଦେଶ ପପ୍ ଅପ୍ ହେବ।

### Alert ଦେଖାଇବା

ଯଦି ଆମେ `Alert` ଦେଖାଇବାକୁ ଚାହୁଁଛୁ, ତାହେଲେ ଏହାକୁ ନିୟନ୍ତ୍ରଣ କରିବା ପାଇଁ ଗୋଟିଏ ଭେରିଏବଲ୍ ଆବଶ୍ୟକ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
@State private var showAlert = false
```

ଏହି ଭେରିଏବଲ୍ `Bool` ପ୍ରକାରର, ଅର୍ଥାତ୍ ଏହାର କେବଳ ଦୁଇଟି ମୂଲ୍ୟ ଅଛି: `true` କିମ୍ବା `false`।

ତାପରେ ଏହାକୁ `Alert` ର `isPresented` ସହ bind କରାଯାଏ:

```swift
isPresented: $showAlert
```

`showAlert` `false` ଥିଲେ, ସତର୍କତା ବକ୍ସ ଦେଖାଯିବ ନାହିଁ; `showAlert` `true` ହେଲେ, ସତର୍କତା ବକ୍ସ ପପ୍ ଅପ୍ ହେବ।

### ବଟନ୍ ମାଧ୍ୟମରେ ସତର୍କତା ବକ୍ସ ଦେଖାଇବା

ଏବେ, ପ୍ରଥମେ ସବୁଠାରୁ ସରଳ ପରିସ୍ଥିତିକୁ ଜାରି କରିବା:

ଯେତେବେଳେ ବ୍ୟବହାରକାରୀ କିଛି ମଧ୍ୟ ଇନପୁଟ୍ କରେ ନାହିଁ ଏବଂ ସିଧାସଳଖ `Sign in` ବଟନ୍ କ୍ଲିକ୍ କରେ, “ଆପଣ ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ବିଷୟବସ୍ତୁ ଲେଖିନାହାନ୍ତି” ବୋଲି କହୁଥିବା ଗୋଟିଏ ସନ୍ଦେଶ ବକ୍ସ ପପ୍ ଅପ୍ ହେବ।

ପ୍ରଥମେ, ଏହି ସନ୍ଦେଶ ବକ୍ସକୁ ନିୟନ୍ତ୍ରଣ କରିବା ପାଇଁ ଗୋଟିଏ ଭେରିଏବଲ୍ ସୃଷ୍ଟି କରନ୍ତୁ:

```swift
@State private var showEmpty = false
```

ତାପରେ, `Button` ପରେ ଗୋଟିଏ `Alert` ଯୋଡନ୍ତୁ:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

ତାପରେ, ବଟନ୍ କ୍ଲିକ୍ କୋଡ୍‌ରେ ଯାଞ୍ଚ କରନ୍ତୁ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

ଯଦି `user` ଏବଂ `password` ଉଭୟ ଖାଲି ଥାଏ, ତେବେ ଆମେ `showEmpty` କୁ `true` କରିଦେବୁ।

ଏବଂ `Alert` ଏହି ଭେରିଏବଲ୍‌ ସହ ବାଉଣ୍ଡ ଥିବାରୁ, ଏହା `true` ହେଲେ ସିଷ୍ଟମ୍ ସ୍ୱୟଂଚାଳିତ ଭାବେ ସତର୍କତା ବକ୍ସ ଦେଖାଇବ।

ପ୍ରଦର୍ଶନ ପ୍ରଭାବ:

![alert](../../Resource/020_alert1.png)

ଏପରି କଲେ, ବ୍ୟବହାରକାରୀ ବଟନ୍ କ୍ଲିକ୍ କରିବା ସହସହି ସନ୍ଦେଶ ଦେଖିପାରିବେ, ଏବଂ ଡିଭେଲପର୍‌ଙ୍କୁ `print` ଆଉଟପୁଟ୍ ଦେଖିବା ପାଇଁ କନସୋଲ୍‌କୁ ଯିବାକୁ ପଡ଼ିବ ନାହିଁ।

### ବଟନ୍ ଏବଂ ସତର୍କତା ବକ୍ସକୁ ଆହୁରି ସଂପୂର୍ଣ୍ଣ କରିବା

ପୂର୍ବରୁ, ଆମେ କେବଳ “କିଛି ମଧ୍ୟ ଭରାଯାଇନାହିଁ” ବୋଲିଥିବା ପରିସ୍ଥିତିକୁ ମାତ୍ର ହାଣ୍ଡଲ୍ କରିଥିଲୁ।

ଆମକୁ ଏହି ନିମ୍ନୋକ୍ତ ପରିସ୍ଥିତିଗୁଡ଼ିକୁ ମଧ୍ୟ ହାଣ୍ଡଲ୍ କରିବାକୁ ପଡ଼ିବ:

- ୟୁଜରନେମ୍ ଭରାଯାଇନାହିଁ
- ପାସୱାର୍ଡ ଭରାଯାଇନାହିଁ
- ୟୁଜରନେମ୍ ଏବଂ ପାସୱାର୍ଡ ଉଭୟ ଭରାଯାଇଛି, କିନ୍ତୁ ଇନପୁଟ୍ ଭୁଲ୍

ସେହିପାଇଁ, ଏହି ପରିସ୍ଥିତିଗୁଡ଼ିକ ପାଇଁ ମଧ୍ୟ ଉଚିତ ସନ୍ଦେଶ ତିଆରି କରିବାକୁ ପଡ଼ିବ।

ପ୍ରଥମେ, ତିନୋଟି ନୂତନ ଭେରିଏବଲ୍ ଯୋଡନ୍ତୁ:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

ତାପରେ ବଟନ୍ ପଛରେ ସମ୍ବନ୍ଧିତ `Alert` ଯୋଡିବାକୁ ଜାରି ରଖନ୍ତୁ:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

ତାପରେ, ବଟନ୍‌ର ଭିତର ନିଷ୍ପତ୍ତି ଲଜିକ୍‌କୁ ପୂର୍ଣ୍ଣ କରନ୍ତୁ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

ଯେତେବେଳେ ବଟନ୍ ନିର୍ଣ୍ଣୟ କରେ ଯେ ବ୍ୟବହାରକାରୀ କୌଣସି ସୂଚନା ଭରିନାହାନ୍ତି, ଗୋଟିଏ ସୂଚନା ଛାଡ଼ିଦେଇଛନ୍ତି, କିମ୍ବା ଇନପୁଟ୍ ଯାଞ୍ଚ ବିଫଳ ହୋଇଛି, ସେତେବେଳେ ଏହା ସମ୍ବନ୍ଧିତ Boolean ଭେରିଏବଲ୍‌କୁ `true` କରିଦେବ, ଏବଂ ପରେ ସମ୍ବନ୍ଧିତ `Alert` ପପ୍ ଅପ୍ ହେବ।

ଏଠାରେ ମୁଁ ପରାମର୍ଶ ଦେବି ଯେ ଆପଣ କିଛି ପରିସ୍ଥିତିକୁ ନିଜେ ପରୀକ୍ଷା କରନ୍ତୁ:

- କିଛି ମଧ୍ୟ ଭରନ୍ତୁ ନାହିଁ
- କେବଳ ୟୁଜରନେମ୍ ଭରନ୍ତୁ
- କେବଳ ପାସୱାର୍ଡ ଭରନ୍ତୁ
- ୟୁଜରନେମ୍ ଏବଂ ପାସୱାର୍ଡ ଉଭୟ ଭରନ୍ତୁ, କିନ୍ତୁ ଭୁଲ୍ ବିଷୟବସ୍ତୁ ସହିତ
- ୟୁଜରନେମ୍ ଏବଂ ପାସୱାର୍ଡ ଉଭୟ ଭରନ୍ତୁ, ଏବଂ ବିଷୟବସ୍ତୁ ଠିକ୍ ହେଉ

ଏହା ଦ୍ୱାରା ଆମ କୋଡ୍‌ରେ ସମସ୍ୟା ଅଛି କି ନାହିଁ ଯାଞ୍ଚ କରିପାରିବା। ଏହା ଆପ୍ ଡେଭେଲପମେଣ୍ଟରେ ଖୁବ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ “testing” ପଦକ୍ଷେପ ମଧ୍ୟ ଅଟେ।

ଯଦି କୌଣସି ପରିସ୍ଥିତିରେ ପ୍ରୋଗ୍ରାମ୍ ଠିକ୍‌ ଭାବରେ କାମ କରୁନାହିଁ, ତାହାର ଅର୍ଥ ହେଉଛି ଲଜିକ୍‌ରେ ସମସ୍ୟା ଥାଇପାରେ ଏବଂ ପ୍ରୋଗ୍ରାମ୍‌ରେ `Bug` ଆସିଛି।

ଡେଭେଲପମେଣ୍ଟରେ ଆମେ ଯାହାକୁ `Bug` କୁହୁଁ, ତାହା ଅର୍ଥ ହେଉଛି ତ୍ରୁଟି, ଅଭାବ, କିମ୍ବା ଆଶାକରା ଆଚରଣ ସହିତ ମେଳ ନଥିବା ବ୍ୟବହାର।

## ଲଗଇନ୍ ଭ୍ୟୁକୁ ସମ୍ପୂର୍ଣ୍ଣ କରିବା

ପୂର୍ବରୁ କୁହାଯାଇଥିବା `Alert` ଗୁଡ଼ିକ ସବୁ “ଇନପୁଟ୍ ଭୁଲ୍ ଥିବାବେଳେ” ବ୍ୟବହାରକାରୀଙ୍କୁ କିପରି ସୂଚନା ଦେବା ସେଥି ପାଇଁ ଥିଲା।

ବ୍ୟବହାରକାରୀ ଠିକ୍ ୟୁଜରନେମ୍ ଏବଂ ପାସୱାର୍ଡ ଦେଇଥିବାବେଳେ, ଆମେ ସାଧାରଣତଃ “ସତର୍କତା ବକ୍ସ” ପପ୍ ଅପ୍ କରୁନାହୁଁ; ବରଂ ସିଧାସଳଖ ଲଗଇନ୍ ପରବର୍ତ୍ତୀ ଇଣ୍ଟରଫେସ୍‌କୁ ପ୍ରବେଶ କରୁ।

ଏଠାରେ ଗୋଟିଏ ଅତ୍ୟନ୍ତ ଜରୁରୀ ଧାରଣା ରହିଛି: **ଭେରିଏବଲ୍‌ର ମୂଲ୍ୟ ଅନୁଯାୟୀ ଭିନ୍ନ view ଦେଖାଇବା।**

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

ଏଠାରେ, view ର ପ୍ରଦର୍ଶନକୁ ନିୟନ୍ତ୍ରଣ କରିବାକୁ ଆମେ `Bool` ପ୍ରକାର ବ୍ୟବହାର କରୁଛୁ:

- `login` `true` ହେଲେ, ତାହାର ଅର୍ଥ ଲଗଇନ୍ ସଫଳ ହୋଇଛି, ଏବଂ ଲଗଇନ୍ ପରବର୍ତ୍ତୀ ବିଷୟବସ୍ତୁ ଦେଖାଯାଏ
- `login` `false` ହେଲେ, ତାହାର ଅର୍ଥ ଲଗଇନ୍ ସଫଳ ହୋଇନାହିଁ, ଏବଂ ଲଗଇନ୍ ଇଣ୍ଟରଫେସ୍ ଦେଖାଯାଇଥାଏ।

`if` ଷ୍ଟେଟମେଣ୍ଟ Swift ରେ ଗୋଟିଏ conditional statement ହେଲେ ମଧ୍ୟ, SwiftUI ର `body` ଭିତରେ view ର ପ୍ରଦର୍ଶନ ଲଜିକ୍‌କୁ ନିୟନ୍ତ୍ରଣ କରିବାପାଇଁ ଏହାକୁ ବ୍ୟବହାର କରାଯାଇପାରେ।

ଅର୍ଥାତ୍, SwiftUI ଶର୍ତ୍ତର ଫଳାଫଳ ଆଧାରରେ ବର୍ତ୍ତମାନ କେଉଁ view ଦେଖାଯିବା ଉଚିତ୍ ତାହା ନିର୍ଣ୍ଣୟ କରିବ।

ଏହି ପ୍ରଦର୍ଶନ ଲଜିକ୍‌କୁ ଆମେ ବର୍ତ୍ତମାନର `ContentView` ଭିତରେ ରଖିପାରିବା:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

ଏଠାରେ, ବ୍ୟବହାରକାରୀ ସଫଳତାର ସହିତ ଲଗଇନ୍ କରିଛନ୍ତି କି ନାହିଁ ଦେଖାଇବାକୁ ଆମେ `login` ନାମର ଗୋଟିଏ ନୂଆ ଭେରିଏବଲ୍ ଯୋଡିଛୁ।

ତାପରେ, ପୂର୍ବରୁ ଲେଖାଯାଇଥିବା ଲଗଇନ୍ view କୋଡ୍‌କୁ `else` statement ପଛରେ ରଖିଛୁ।

view ପ୍ରଦର୍ଶନ ଲଜିକ୍:

- `login` `false` ଥିବାବେଳେ, ତାହାର ଅର୍ଥ ହେଉଛି ଲଗଇନ୍ ଏଯାବତ୍ ସଫଳ ହୋଇନାହିଁ, ତେଣୁ ପୁରୁଣା ଲଗଇନ୍ view ଦେଖାଯାଇଥାଏ।
- `login` `true` ଥିବାବେଳେ, ତାହାର ଅର୍ଥ ଲଗଇନ୍ ସଫଳ; ଏହି ସମୟରେ ଲଗଇନ୍ view ଆଉ ଦେଖାଯିବ ନାହିଁ, ବରଂ `Login successful` ଦେଖାଯିବ।

ଅର୍ଥାତ୍, `ContentView` `login` ର ମୂଲ୍ୟ ଅନୁଯାୟୀ ଭିନ୍ନ view ବିଷୟବସ୍ତୁ ଦେଖାଇବ।

ତାପରେ, ବଟନ୍‌ର ଭିତରେ ଥିବା ଲଗଇନ୍ ସଫଳତା ଲଜିକ୍‌କୁ ଆମେ ସଂଶୋଧନ କରିବା:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

ଯେତେବେଳେ ବ୍ୟବହାରକାରୀ ଦେଇଥିବା ୟୁଜରନେମ୍ ଏବଂ ପାସୱାର୍ଡ ଉଭୟ ଠିକ୍ ଥାଏ, ଆମେ `login` କୁ `true` କରିଦେବୁ।

`login` ର ମୂଲ୍ୟ ବଦଳିବା ସହିତ, `ContentView` ଭିତରର `if` ପରୀକ୍ଷାର ଫଳାଫଳ ମଧ୍ୟ ବଦଳିଯାଏ, ଏବଂ ଇଣ୍ଟରଫେସ୍ ପୁରୁଣା ଲଗଇନ୍ view ରୁ `Login successful` କୁ ବଦଳିଯାଏ।

ପ୍ରଦର୍ଶନ ପ୍ରଭାବ ନିମ୍ନରୂପ:

![view](../../Resource/020_view.png)

ଏବେ ଆମେ “ଶର୍ତ୍ତ ଅନୁଯାୟୀ ଭିନ୍ନ view ଦେଖାଇବା” ବିଷୟର ଜ୍ଞାନକୁ ପ୍ରକୃତରେ ଏହି ଚାଲୁଥିବା ଲଗଇନ୍ ପେଜରେ ବ୍ୟବହାର କରିଛୁ।

ବାସ୍ତବ ଆପ୍‌ମାନଙ୍କରେ ମଧ୍ୟ ସାଧାରଣତଃ ଏହିପରି କରାଯାଏ: ଗୋଟିଏ ନିର୍ଦ୍ଦିଷ୍ଟ ମୂଲ୍ୟ ଆଧାରରେ ଭିନ୍ନ view ଦେଖାଯାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ, ବ୍ୟବହାରକାରୀ ଲଗଇନ୍ ନଥିଲେ ଲଗଇନ୍ ପେଜ୍ ଦେଖାଯାଏ; ବ୍ୟବହାରକାରୀ ସଫଳତାର ସହିତ ଲଗଇନ୍ କରିଦେଲେ, ଅନ୍ୟ ଗୋଟିଏ ଇଣ୍ଟରଫେସ୍ ଦେଖାଯାଏ।

ମୂଳ ଧାରଣା ହେଉଛି: **ଭେରିଏବଲ୍‌ର ପରିବର୍ତ୍ତନ ମାଧ୍ୟମରେ ଇଣ୍ଟରଫେସ୍‌ରେ କେଉଁ ବିଷୟବସ୍ତୁ ଦେଖାଯିବ ତାହା ନିୟନ୍ତ୍ରଣ କରିବା।**

## ସାରାଂଶ

ଏହି ପାଠରେ, ଆମେ ତିନୋଟି ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ କଥା ଶିଖିଲୁ:

1. ପାସୱାର୍ଡ ଇନପୁଟ୍ ପାଇଁ `SecureField` ବ୍ୟବହାର କରିବା, ଯାହାଦ୍ୱାରା ପାସୱାର୍ଡର ବିଷୟବସ୍ତୁ ଇଣ୍ଟରଫେସ୍‌ରେ ସିଧାସଳଖ ଦେଖାଯିବ ନାହିଁ।
2. କେବଳ କନସୋଲ୍‌ରେ ଆଉଟପୁଟ୍ ଦେଖାଇବା ପରିବର୍ତ୍ତେ, ବ୍ୟବହାରକାରୀଙ୍କୁ ସନ୍ଦେଶ ଦେଖାଇବା ପାଇଁ `Alert` ବ୍ୟବହାର କରିବା।
3. ଭିନ୍ନ view ର ପ୍ରଦର୍ଶନକୁ ନିୟନ୍ତ୍ରଣ କରିବା ଏବଂ ଲଗଇନ୍ ପୂର୍ବରୁ ଓ ପରେର ଇଣ୍ଟରଫେସ୍‌ରେ ସ୍ୱିଚ୍ ଆଣିବା ପାଇଁ ଭେରିଏବଲ୍ ଏବଂ `if` ନିଷ୍ପତ୍ତି ବ୍ୟବହାର କରିବା।

ଏହି ଜ୍ଞାନଗୁଡ଼ିକୁ ଶିଖିବା ମାଧ୍ୟମରେ, ଆମେ ଏବେ ମୌଳିକ ଇଣ୍ଟରାକ୍ସନ୍ ପ୍ରଭାବ ସହ ଗୋଟିଏ ଲଗଇନ୍ view କୁ ସମ୍ପୂର୍ଣ୍ଣ କରିପାରୁଛୁ, ଏବଂ SwiftUI ରେ “state ବଦଳିଲେ interface ଅପଡେଟ୍ ହୁଏ” ବୋଲିଥିବା ଉନ୍ନତି ଧାରଣାକୁ ଆହୁରି ଭଲଭାବେ ବୁଝିପାରୁଛୁ।

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## ବିସ୍ତାରିତ ଜ୍ଞାନ - ଅନେକ ବଟନ୍ ସହିତ Alert

ଏହି ପାଠର ପୂର୍ବ ଅଂଶରେ, ଆମେ ସବୁଠାରୁ ମୌଳିକ `Alert` ବ୍ୟବହାର କରିଥିଲୁ, ଯାହାରେ କେବଳ ଗୋଟିଏ ବଟନ୍ ଥିଲା ଏବଂ ମୁଖ୍ୟତଃ ବ୍ୟବହାରକାରୀଙ୍କୁ ସୂଚନା ଦେବାକୁ ବ୍ୟବହୃତ ହୁଏ।

ବାସ୍ତବରେ, `Alert` ରେ ଅନେକ ବଟନ୍‌ ମଧ୍ୟ ଥାଇପାରେ, ଯାହାଦ୍ୱାରା ବ୍ୟବହାରକାରୀ ଭିନ୍ନ ଭିନ୍ନ ପସନ୍ଦ କରିପାରିବେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

ବଟନ୍ କ୍ଲିକ୍ କରିବା ପରେ, `Ok`, `delete`, ଏବଂ `cancel` ବୋଲି ତିନୋଟି ବିକଳ୍ପ ଥିବା ଗୋଟିଏ ସନ୍ଦେଶ ବକ୍ସ ପପ୍ ଅପ୍ ହେବ।

ପ୍ରଦର୍ଶନ ପ୍ରଭାବ:

![alert](../../Resource/020_alert2.png)

ଭିନ୍ନ ବଟନ୍ କ୍ଲିକ୍ କରିଲେ ସମ୍ବନ୍ଧିତ କୋଡ୍ ଚାଲିବ।

### Button ର `role` ଗୁଣଧର୍ମ

ଏଠାରେ ଆପଣ ଧ୍ୟାନ ଦେବେ ଯେ, `Alert` ଭିତରର `Button` ଆମେ ପୂର୍ବରୁ ଶିଖିଥିବା ସାଧାରଣ ବଟନ୍ syntax ଠାରୁ କିଛି ଭିନ୍ନ:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

ଏଠାରେ ଅତିରିକ୍ତ `role` parameter ଅଛି।

SwiftUI ରେ, ଏହି ବଟନ୍ କେଉଁ ପ୍ରକାରର କାର୍ଯ୍ୟକୁ ପ୍ରତିନିଧିତ୍ୱ କରେ ତାହା ସିଷ୍ଟମ୍‌କୁ କହିବା ପାଇଁ `role` ବ୍ୟବହାର ହୁଏ।

କିଛି ସାଧାରଣ role ହେଉଛି:

- `.cancel`: ରଦ୍ଦ କାର୍ଯ୍ୟ
- `.destructive`: ଜୋଖିମପୂର୍ଣ୍ଣ କାର୍ଯ୍ୟ, ଉଦାହରଣ ସ୍ୱରୂପ delete
- `nil`: ସାଧାରଣ କାର୍ଯ୍ୟ

ଭିନ୍ନ `role` ମୂଲ୍ୟ ସାଧାରଣତଃ ଇଣ୍ଟରଫେସ୍‌ରେ ଭିନ୍ନ visual style ମଧ୍ୟ ଆଣିଥାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଜୋଖିମପୂର୍ଣ୍ଣ କାର୍ଯ୍ୟଗୁଡ଼ିକୁ ବ୍ୟବହାରକାରୀଙ୍କୁ ସାବଧାନରେ କ୍ଲିକ୍ କରିବାକୁ ମନେପକାଇବା ପାଇଁ ଅଧିକ ଆକର୍ଷଣୀୟ style ରେ ଦେଖାଯାଏ।

ଏହା ଛଡ଼ା, `role` ବଟନ୍ ପାଇଁ ଅତିରିକ୍ତ semantic ସୂଚନା ମଧ୍ୟ ଦେଇଥାଏ, ଯାହାଦ୍ୱାରା screen reader (ଉଦାହରଣ ସ୍ୱରୂପ Apple ଡିଭାଇସର VoiceOver) ବ୍ୟବହାରକାରୀଙ୍କୁ ବଟନ୍‌ର ଉଦ୍ଦେଶ୍ୟ ବୁଝାଇବାକୁ ସହଜ ହୁଏ।

ସେହିପାଇଁ, ଉଚିତ ପରିସ୍ଥିତିରେ ଗୋଟିଏ ବଟନ୍‌ରେ `role` ଯୋଡିବା ଏକ ଖୁବ ଭଲ ଅଭ୍ୟାସ।
