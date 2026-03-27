# गुल्लक

इस पाठ में हम एक सरल “piggy bank” project बनाएँगे। इसका feature set सरल है, लेकिन interaction logic पूरी है, इसलिए यह beginners के लिए बहुत उपयुक्त है।

इस project के माध्यम से हम `TextField` (input field), `border`, और data binding (`$`) सीखेंगे।

अंतिम लक्ष्य है ऐसा “piggy bank” project बनाना जिसमें amount input की जा सके, और button click करने पर वह save होकर total amount में जुड़ जाए।

परिणाम:

![Piggy Bank](../../RESOURCE/014_view.png)

## कुल amount दिखाना

सबसे पहले, हमें view में “piggy bank” की total amount दिखानी है।

`ContentView` में, total amount save करने के लिए एक variable declare करें।

```swift
@State private var amount = 0
```

फिर, इस amount को `Text` से display करें:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

यहाँ `.font` और `.fontWeight` का उपयोग font size और thickness सेट करने के लिए किया गया है।

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

जब `amount` बदलेगी, `Text` में दिखाई जाने वाली total amount भी automatically refresh हो जाएगी।

## amount input करना

“piggy bank” केवल total amount दिखाने के लिए नहीं है, बल्कि user को amount “input” करने की भी ज़रूरत है। इसके लिए SwiftUI का view control `TextField` उपयोग होता है।

### `TextField`

`TextField` SwiftUI का content input control है, जो आमतौर पर single-line input के लिए उपयोग होता है।

`TextField` मुख्य रूप से दो binding formats देती है:

**1. string type binding (`String`)**

```swift
TextField("Placeholder", text: $text)
```

यह names, titles और text input के लिए उपयुक्त है।

**2. numeric type binding (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

यह age, salary, amount जैसी numeric inputs के लिए उपयुक्त है।

`format: .number` का अर्थ है कि यह input field “number format” के अनुसार parse और display करेगी।

#### text placeholder

`TextField` का पहला parameter placeholder होता है, जो user को input hint देता है:

```swift
TextField("input your name", text: $text)
```

जब input field खाली होती है, तो एक gray hint text दिखाई देती है।

![textfield](../../RESOURCE/014_textfield.png)

#### data binding

`TextField` स्वयं input content को permanently save नहीं करती। इसके लिए data को binding variable के माध्यम से manage करना पड़ता है।

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

user द्वारा input की गई content सीधे `text` variable में save होगी; `TextField` केवल input interface के लिए ज़िम्मेदार है।

`$` binding (`Binding`) को दर्शाता है:

```swift
$text
```

यह कोई सामान्य variable नहीं, बल्कि `Binding` type है।

इसका कार्य view और data के बीच connection बनाना है:

जब user `TextField` में content input करेगा, `text` automatically update होगी; और जब `text` बदलेगी, `TextField` भी synchronously update होगी।

उदाहरण:

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

`TextField` में content input करने पर ऊपर की `Text` उसे real time में दिखाएगी।

![textField](../../RESOURCE/014_textfield1.png)

### number type bind करना

जब numeric value input करनी हो, तो उसी type का variable bind करना होगा:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

जब user amount input करेगा, `TextField` input content को parse करके `number` की value automatically update करेगी।

## input field जोड़ना

`TextField` का basic usage समझने के बाद, अब इसे “piggy bank” project में उपयोग करते हैं।

“piggy bank” को “amount” input करनी है, इसलिए हम “numeric type binding (`Int/Double`)" का उपयोग करेंगे, और user input save करने के लिए एक नया `number` variable जोड़ेंगे:

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

अब, `TextField` default रूप से `number` की value दिखाती है (default `0`)।

जब input content clear कर दी जाए, तो placeholder `"Amount"` दिखाई देगा।

यह फिर से दिखाता है कि `TextField` binding variable की value दिखाती है, न कि अपनी content को खुद store करती है।

### input field size की समस्या

वर्तमान view में आप देखेंगे कि `TextField` में कोई border नहीं है, केवल एक `0` दिखाई देता है, और content left aligned लगती है।

परिणाम:

![textfield](../../RESOURCE/014_textfield2.png)

ऐसा इसलिए है क्योंकि `TextField` default रूप से parent view की पूरी width घेर लेती है।

हम background color जोड़कर इसे verify कर सकते हैं:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

परिणाम:

![textfield](../../RESOURCE/014_textfield3.png)

आप देख सकते हैं कि `TextField` वास्तव में पूरी row width भर रही है।

### fixed width सेट करना

यदि हम input field को अधिक compact बनाना चाहें, तो `frame` के माध्यम से उसकी width limit कर सकते हैं:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

परिणाम:

![textfield](../../RESOURCE/014_textfield4.png)

### border और padding जोड़ना

क्योंकि `TextField` में default border नहीं होती, हम manually style जोड़ सकते हैं:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

अब यह input field एक “standard input field” जैसी दिखेगी।

![textfield](../../RESOURCE/014_textfield5.png)

## border

SwiftUI में `border` view में border जोड़ने के लिए उपयोग होता है।

मूल usage:

```swift
border(Color.black, width: 1)
```

यहाँ `Color.black` border color है, और `width` उसकी thickness है।

`TextField` में हम उपयोग करते हैं:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

इसका अर्थ है input field में `1 pt` चौड़ी काली border जोड़ना।

आप अन्य colors भी try कर सकते हैं, जैसे `Color.blue`、`Color.green`, या thicker border `width: 2`।

## Save बटन

अब हमारे पास total amount दिखाने वाला `amount` variable है, input amount के लिए `TextField` है, और input field से bound `number` variable है।

वर्तमान code:

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

### button जोड़ना

अब हमें एक button जोड़नी है, जो saving action trigger करे।

```swift
Button("Save") {
    
}
```

### saving logic लागू करना

हम चाहते हैं कि user amount input करे, button click करे, और वह amount total amount में automatically जुड़ जाए।

```swift
Button("Save") {
    amount += number
}
```

यहाँ compound assignment operator का उपयोग हुआ है, जो user input `number` को total `amount` में जोड़ता है।

### input amount reset करना

अब एक समस्या है: हर बार button click करने के बाद input field का amount clear नहीं होता।

यदि user `10` input करे और save button दबाए, तो input field में अभी भी `10` रहेगा, जो अगली saving amount को प्रभावित करेगा।

ऐसा इसलिए है क्योंकि `TextField` `number` से bound है। button click पर हमने केवल `amount` बदली है, `number` नहीं बदला, इसलिए input field अभी भी पुरानी value दिखाती है।

हमें clear logic जोड़नी होगी: button click होने पर पहले amount add की जाए, फिर input amount reset की जाए:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

अब, जब user amount input करके button click करेगा, input amount total amount में जुड़ जाएगी, और `number` reset होकर `0` हो जाएगी, ताकि अगली input के लिए field तैयार रहे।

इस तरह “piggy bank” की saving logic पूरी हो जाती है।

## view को बेहतर बनाना

feature पूरा होने के बाद, हम interface को थोड़ा बेहतर बना सकते हैं, जैसे background image और button style जोड़ना।

button style जोड़ना:

```swift
.buttonStyle(.borderedProminent)
```

background image जोड़ना:

```swift
.background {
    Image("1")
}
```

अब हम पूरे “piggy bank” feature का development पूरा कर चुके हैं।

## पूर्ण code

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

परिणाम:

![Piggy Bank](../../RESOURCE/014_view.png)

अब, हम `100` या उससे अधिक amount save करके “piggy bank” logic को test कर सकते हैं।

या “piggy bank” को simulator या real device पर run करके अपने बनाए हुए app का अनुभव कर सकते हैं।

### debug output

logic सही है या नहीं यह verify करने के लिए, हम button में debug logic भी जोड़ सकते हैं, ताकि input amount सही है या नहीं यह देखा जा सके:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

हर बार saving करके button click करने पर हमें corresponding debug output दिखेगी, जिससे code logic में problem है या नहीं, यह जाँचा जा सकता है।

```
---Saving---
amount:11
number:0
```
