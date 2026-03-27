# ସଞ୍ଚୟ କୁମ୍ଭ

ଏହି ପାଠରେ, ଆମେ ଗୋଟିଏ ସରଳ “ସଞ୍ଚୟ କୁମ୍ଭ” ପ୍ରୋଜେକ୍ଟ ତିଆରି କରିବୁ। ଏହାର କାର୍ଯ୍ୟ ସରଳ, କିନ୍ତୁ ଏଥିରେ ସମ୍ପୂର୍ଣ୍ଣ interaction logic ରହିଛି, ତେଣୁ ଏହା ଆରମ୍ଭିକ ଶିକ୍ଷାର୍ଥୀଙ୍କ ପାଇଁ ବହୁତ ଉପଯୁକ୍ତ।

ଏହି ପ୍ରୋଜେକ୍ଟ ମାଧ୍ୟମରେ, ଆମେ TextField (ଇନପୁଟ୍ ବକ୍ସ) ଏବଂ border ସୀମାରେଖା ବିଷୟରେ ଶିଖିବୁ, ସହିତେ data binding ($) କୁ ମଧ୍ୟ ବୁଝିବୁ।

ଶେଷ ଲକ୍ଷ୍ୟ ହେଉଛି ଏମିତି ଗୋଟିଏ “ସଞ୍ଚୟ କୁମ୍ଭ” ତିଆରି କରିବା, ଯେଉଁଠାରେ ରାଶି ଇନପୁଟ୍ କରି, button କୁ click କଲେ ଏହା save ହେବ ଏବଂ ମୋଟ ରାଶିରେ ଯୋଗ ହେବ।

କାର୍ଯ୍ୟର ଫଳାଫଳ:

![Piggy Bank](../../RESOURCE/014_view.png)

## ମୋଟ ରାଶି ଦେଖାଇବା

ପ୍ରଥମେ, ଆମେ view ମଧ୍ୟରେ “ସଞ୍ଚୟ କୁମ୍ଭ” ର ମୋଟ ରାଶିକୁ ଦେଖାଇବାକୁ ପଡ଼ିବ।

ContentView ମଧ୍ୟରେ, “ସଞ୍ଚୟ କୁମ୍ଭ” ର ମୋଟ ରାଶିକୁ ସଞ୍ଚୟ କରିବା ପାଇଁ ଗୋଟିଏ variable ଘୋଷଣା କରିବା:

```swift
@State private var amount = 0
````

ତା ପରେ, ଏହି ରାଶିକୁ ଦେଖାଇବା ପାଇଁ Text ବ୍ୟବହାର କରିବା:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

ଏଠାରେ, .font ଏବଂ .fontWeight ବ୍ୟବହାର କରି ଅକ୍ଷରର ଆକାର ଏବଂ ମୋଟାପଣ ସେଟ୍ କରାଯାଇଛି।

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

ଯେତେବେଳେ amount ବଦଳିବ, Text ରେ ଦେଖାଯାଉଥିବା ମୋଟ ରାଶି ମଧ୍ୟ ସ୍ୱୟଂଚାଳିତ ଭାବେ refresh ହେବ।

## ରାଶି ଇନପୁଟ୍ କରିବା

“ସଞ୍ଚୟ କୁମ୍ଭ” କେବଳ ମୋଟ ରାଶି ଦେଖାଇବା ନୁହେଁ, ବ୍ୟବହାରକାରୀଙ୍କୁ ଟଙ୍କା “ଇନପୁଟ୍” କରିବାର ସୁଯୋଗ ମଧ୍ୟ ଦେବା ଦରକାର। ସେଥିପାଇଁ SwiftUI ର TextField view control ବ୍ୟବହାର କରିବାକୁ ପଡ଼ିବ।

### TextField

TextField ହେଉଛି SwiftUI ର ଗୋଟିଏ view control, ଯାହା content ଇନପୁଟ୍ ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ସାଧାରଣତଃ ଏହା single-line input ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

TextField ମୁଖ୍ୟତଃ ଦୁଇ ପ୍ରକାର binding format ଦେଇଥାଏ:

**1. String ପ୍ରକାର ସହିତ binding**

```swift
TextField("Placeholder", text: $text)
```

ଏହା ନାମ, ଶୀର୍ଷକ ଭଳି text input ପାଇଁ ଉପଯୁକ୍ତ।

**2. ସଂଖ୍ୟା ପ୍ରକାର (Int/Double) ସହିତ binding**

```swift
TextField("Amount", value: $number, format: .number)
```

ଏହା ବୟସ, ବେତନ, ରାଶି ଭଳି number input ପାଇଁ ଉପଯୁକ୍ତ।

format: .number ର ଅର୍ଥ, ଏହି input box ଟି “number format” ଅନୁସାରେ parse ଏବଂ display କରିବ।

#### ଟେକ୍ସଟ୍ ପ୍ଲେସହୋଲ୍ଡର

TextField ର ପ୍ରଥମ parameter ହେଉଛି placeholder, ଯାହା ବ୍ୟବହାରକାରୀଙ୍କୁ କଣ ଇନପୁଟ୍ କରିବାକୁ ହେବ ବୋଲି ସୂଚନା ଦେଏ:

```swift
TextField("input your name", text: $text)
```

ଯେତେବେଳେ input box ଖାଲି ଥାଏ, ସେତେବେଳେ ଏକ ଧୂସର ରଙ୍ଗର ସୂଚନା text ଦେଖାଯାଏ।

![textfield](../../RESOURCE/014_textfield.png)

#### ଡାଟା ବାଇଣ୍ଡିଂ

TextField ନିଜେ input content କୁ persistent ଭାବେ save କରେ ନାହିଁ, ଏହାକୁ binding variable ଦ୍ୱାରା data ପରିଚାଳନା କରିବାକୁ ପଡ଼େ।

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

ବ୍ୟବହାରକାରୀଙ୍କ ଇନପୁଟ୍ ସିଧାସଳଖ text variable ମଧ୍ୟରେ save ହେବ, ଏବଂ TextField କେବଳ input interface ପ୍ରଦାନ କରିବ।

$ ର ଅର୍ଥ binding:

```swift
$text
```

ଏହା ସାଧାରଣ variable ନୁହେଁ, ବରଂ ଗୋଟିଏ Binding type।

ଏହାର କାମ ହେଉଛି view ଏବଂ data ମଧ୍ୟରେ ଏକ connection ସୃଷ୍ଟି କରିବା:

ଯେତେବେଳେ ବ୍ୟବହାରକାରୀ TextField ମଧ୍ୟରେ content ଇନପୁଟ୍ କରନ୍ତି, text ସ୍ୱୟଂଚାଳିତ ଭାବେ update ହୁଏ; ଏବଂ text ବଦଳିଲେ, TextField ମଧ୍ୟ ସେହିଅନୁଯାୟୀ update ହୁଏ।

ଉଦାହରଣ:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

TextField ରେ content ଇନପୁଟ୍ କଲେ, ଉପରେ ଥିବା Text real-time ଭାବେ ସେହି content କୁ ଦେଖାଇବ।

![textField](../../RESOURCE/014_textfield1.png)

### ସଂଖ୍ୟା ପ୍ରକାର ସହିତ binding

ଯେତେବେଳେ number input କରିବାକୁ ହୁଏ, ସେତେବେଳେ ସେହି ପ୍ରକାରର variable ସହିତ binding କରିବାକୁ ପଡ଼େ:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

ଯେତେବେଳେ ବ୍ୟବହାରକାରୀ ରାଶି ଇନପୁଟ୍ କରନ୍ତି, TextField input content କୁ parse କରି number ର ମୂଲ୍ୟକୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ update କରିଦେବ।

## ଇନପୁଟ୍ ବକ୍ସ ଯୋଡ଼ିବା

TextField ର ମୌଳିକ ବ୍ୟବହାର ବୁଝିବା ପରେ, ଆମେ ଏହାକୁ “ସଞ୍ଚୟ କୁମ୍ଭ” ପ୍ରୋଜେକ୍ଟରେ ପ୍ରୟୋଗ କରିବୁ।

“ସଞ୍ଚୟ କୁମ୍ଭ” ରେ “ରାଶି” ଇନପୁଟ୍ କରିବାକୁ ପଡ଼େ, ତେଣୁ ଆମେ “number type binding” ବ୍ୟବହାର କରିବୁ, ଏବଂ ବ୍ୟବହାରକାରୀଙ୍କ ଇନପୁଟ୍ କରାଯାଇଥିବା ରାଶିକୁ save କରିବା ପାଇଁ ନୂତନ number variable ଘୋଷଣା କରିବୁ:

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
		}
    }
}
```

ଏବେ, TextField default ଭାବେ number ର value କୁ ଦେଖାଇବ (default ହେଉଛି 0)।

ଯେତେବେଳେ input content କୁ ସଫା କରାଯାଏ, ସେତେବେଳେ placeholder “Amount” ଦେଖାଯିବ।

ଏହା ପୁଣିଥରେ ପ୍ରମାଣ କରେ ଯେ TextField ଦେଖାଉଛି binding variable ର ମୂଲ୍ୟକୁ, ନିଜେ content save କରୁ ନାହିଁ।

### ଇନପୁଟ୍ ବକ୍ସର ଆକାର ସମସ୍ୟା

ବର୍ତ୍ତମାନର view ରେ, ଆମେ ଦେଖିବୁ ଯେ TextField ର କୌଣସି border ନାହିଁ, କେବଳ 0 ଦେଖାଯାଉଛି, ଏବଂ content ଟି left-aligned ଲାଗୁଛି।

ଫଳାଫଳ ଏପରି:

![textfield](../../RESOURCE/014_textfield2.png)

ଏହାର କାରଣ ହେଉଛି, TextField default ଭାବେ ତାହାର parent view ର ସମ୍ପୂର୍ଣ୍ଣ width ଦଖଲ କରେ।

ଆମେ background color ଯୋଡ଼ି ଏହାକୁ verify କରିପାରିବା:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

ଫଳାଫଳ ଏପରି:

![textfield](../../RESOURCE/014_textfield3.png)

ଏଠାରେ ସ୍ପଷ୍ଟ ଯେ TextField ବାସ୍ତବରେ ସମସ୍ତ row width କୁ ପୂରଣ କରୁଛି।

### ନିର୍ଦ୍ଧାରିତ ପ୍ରସ୍ଥ ସେଟ୍ କରିବା

ଯଦି ଆମେ input box କୁ ଅଧିକ compact କରିବାକୁ ଚାହୁଁଛୁ, ତେବେ frame ବ୍ୟବହାର କରି width କୁ ସୀମିତ କରିପାରିବା:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

ଫଳାଫଳ ଏପରି:

![textfield](../../RESOURCE/014_textfield4.png)

### ସୀମାରେଖା ଏବଂ ଭିତର ସ୍ପେସ୍ ଯୋଡ଼ିବା

TextField ର default ଭାବରେ କୌଣସି border ନଥିବାରୁ, ଆମେ ନିଜେ style ଯୋଡ଼ିପାରିବା:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ଏବେ, ଏହି input box ଟି ଅଧିକ “standard input box” ପରି ଦେଖାଯିବ।

![textfield](../../RESOURCE/014_textfield5.png)

## ସୀମାରେଖା

SwiftUI ରେ, border view ରେ ସୀମାରେଖା ଯୋଡ଼ିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

ମୌଳିକ ବ୍ୟବହାର:

```swift
border(Color.black, width: 1)
```

ଏଠାରେ, Color.black ର ଅର୍ଥ ସୀମାରେଖାର ରଙ୍ଗ, ଏବଂ width ର ଅର୍ଥ ହେଉଛି ସୀମାରେଖାର ମୋଟାଇ।

TextField ରେ, ଆମେ ଏହାକୁ ଏଭଳି ବ୍ୟବହାର କରୁଛୁ:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ଏହାର ଅର୍ଥ ହେଉଛି, input box ରେ ଗୋଟିଏ କଳା ରଙ୍ଗର, 1 pt width ଥିବା ସୀମାରେଖା ଯୋଡ଼ାଯାଇଛି।

ଆପଣ Color.blue, Color.green ପରି ଅନ୍ୟ ରଙ୍ଗ ମଧ୍ୟ ଚେଷ୍ଟା କରିପାରିବେ, କିମ୍ବା width: 2 କରି ସୀମାରେଖାକୁ ଅଧିକ ମୋଟା କରିପାରିବେ।

## ସଞ୍ଚୟ ବଟନ୍

ଏବେ, ଆମ ପାଖରେ ମୋଟ ରାଶି ଦେଖାଇବା ପାଇଁ amount variable ଅଛି, user input ପାଇଁ TextField ଅଛି, ଏବଂ input box ସହିତ bound ଥିବା number variable ଅଛି।

ବର୍ତ୍ତମାନର କୋଡ୍‌ ଏପରି:

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
		}
    }
}
```

### ବଟନ୍ ଯୋଡ଼ିବା

ଏବେ, ଆମକୁ ଗୋଟିଏ button ଯୋଡ଼ିବାକୁ ପଡ଼ିବ, ଯାହା ସଞ୍ଚୟ କାର୍ଯ୍ୟକୁ trigger କରିବ।

```swift
Button("Save") {
    
}
```

### ସଞ୍ଚୟ ଲଜିକ୍ କାର୍ଯ୍ୟକରିତ କରିବା

ଆମେ ଚାହୁଁଛୁ ଯେ, user ରାଶି ଇନପୁଟ୍ କରି button କୁ click କଲେ, ସେହି ରାଶି ସ୍ୱୟଂଚାଳିତ ଭାବେ ମୋଟ ରାଶିରେ ଯୋଗ ହେଉ।

```swift
Button("Save") {
    amount += number
}
```

ଏଠାରେ “compound assignment operator” ବ୍ୟବହାର କରାଯାଇଛି, ଯାହା user ଇନପୁଟ୍ କରିଥିବା ରାଶି number କୁ ମୋଟ ରାଶି amount ସହିତ ଯୋଡ଼ିଦେଏ।

### ଇନପୁଟ୍ ରାଶିକୁ ରିସେଟ୍ କରିବା

ଏବେ ଗୋଟିଏ ସମସ୍ୟା ଅଛି, ପ୍ରତ୍ୟେକଥର button କୁ click କଲା ପରେ, input box ରେ ଥିବା ରାଶି clear ହୁଏ ନାହିଁ।

ଯଦି user 10 ଇନପୁଟ୍ କରି save କ୍ଲିକ୍ କରେ, ତେବେ input box ରେ 10 ରହିଯାଏ, ଯାହା ପରବର୍ତ୍ତୀଥର ସଞ୍ଚୟ ରାଶି ଇନପୁଟ୍ କରିବାରେ ପ୍ରଭାବ ପକାଇବ।

ଏହାର କାରଣ ହେଉଛି, TextField number ସହିତ bound ଅଛି। ଆମେ button କୁ click କଲାବେଳେ କେବଳ amount କୁ ବଦଳାଉଛୁ, କିନ୍ତୁ number ବଦଳୁ ନାହିଁ, ତେଣୁ input box ରେ ପୁରୁଣା value ରହିଯାଏ।

ତେଣୁ, ଆମକୁ ଗୋଟିଏ clear logic ଯୋଡ଼ିବାକୁ ପଡ଼ିବ। Button କୁ click କଲା ପରେ, ପ୍ରଥମେ ରାଶିକୁ ମୋଟରେ ଯୋଡ଼ିବା, ତା ପରେ input ରାଶିକୁ reset କରିବା:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

ଏବେ, user ରାଶି ଇନପୁଟ୍ କରି button କୁ click କଲେ, ଇନପୁଟ୍ କରାଯାଇଥିବା ରାଶି ମୋଟ ରାଶିରେ ଯୋଗ ହେବ। number କୁ 0 କରାଯିବ, ଯାହା ପରବର୍ତ୍ତୀ ଇନପୁଟ୍ ପାଇଁ ସୁବିଧା ଦେବ।

ଏପରିକରି, ଆମେ “ସଞ୍ଚୟ କୁମ୍ଭ” ର ସମସ୍ତ ସଞ୍ଚୟ logic କୁ କାର୍ଯ୍ୟକରିତ କରିସାରିଲୁ।

## ଭ୍ୟୁକୁ ଉନ୍ନତ କରିବା

କାର୍ଯ୍ୟ ସମ୍ପୂର୍ଣ୍ଣ ହେବା ପରେ, ଆମେ interface ରେ ସରଳ ଉନ୍ନତି କରିପାରିବା, ଯେପରିକି background image ଏବଂ button style ଯୋଡ଼ିବା।

Button style ଯୋଡ଼ିବା:

```swift
.buttonStyle(.borderedProminent)
```

Background image ଯୋଡ଼ିବା:

```swift
.background {
    Image("1")
}
```

ଏବେ, ଆମେ ସମ୍ପୂର୍ଣ୍ଣ “ସଞ୍ଚୟ କୁମ୍ଭ” ବିକାଶ କାର୍ଯ୍ୟକୁ ସମାପ୍ତ କରିଛୁ।

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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

କାର୍ଯ୍ୟର ଫଳାଫଳ:

![Piggy Bank](../../RESOURCE/014_view.png)

ଏବେ, ଆମେ 100 କିମ୍ବା ତାଠାରୁ ଅଧିକ ଟଙ୍କା ସଞ୍ଚୟ କରି ଦେଖିପାରିବା, “ସଞ୍ଚୟ କୁମ୍ଭ” ର logic ଭିତରେ କୌଣସି ସମସ୍ୟା ଅଛି କି ନାହିଁ।

କିମ୍ବା “ସଞ୍ଚୟ କୁମ୍ଭ” କୁ simulator କିମ୍ବା real device ରେ ଚଲାଇ ଆମେ ନିଜେ ତିଆରି କରିଥିବା ଏହି app ର ଅନୁଭବ ନିଅପାରିବା।

### ଡିବଗ୍ ଆଉଟପୁଟ୍

ଲଜିକ୍ ସଠିକ୍ କି ନୁହେଁ ବୁଝିବା ପାଇଁ, ଆମେ button ମଧ୍ୟରେ debug logic ମଧ୍ୟ ଯୋଡ଼ିପାରିବା, ଯାହା ଦ୍ୱାରା ଇନପୁଟ୍ କରାଯାଇଥିବା ରାଶି ସଠିକ୍ କି ନୁହେଁ ବୁଝିହେବ:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ପ୍ରତ୍ୟେକଥର ସଞ୍ଚୟ କରି button କୁ click କଲେ, ଆମେ ସମ୍ବନ୍ଧିତ debug output କୁ ଦେଖିପାରିବା, ଯାହା ଦ୍ୱାରା code logic ଭିତରେ କୌଣସି ସମସ୍ୟା ଅଛି କି ନାହିଁ ଯାଞ୍ଚ କରିହେବ।

```
---Saving---
amount:11
number:0
```