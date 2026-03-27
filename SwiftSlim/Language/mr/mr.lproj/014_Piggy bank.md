# गुलक

या धड्यात आपण एक साधा “गुलक” project तयार करू. याची functionality सोपी आहे, पण interaction logic पूर्ण आहे, त्यामुळे तो नवशिक्यांसाठी खूप योग्य आहे.

या project च्या माध्यमातून आपण `TextField` (input field) आणि `border` शिकू, तसेच data binding (`$`) समजून घेऊ.

अंतिम उद्दिष्ट म्हणजे असे “गुलक” project तयार करणे, ज्यात रक्कम input करता येईल, बटणावर क्लिक करून ती save करता येईल, आणि एकूण रक्कम वाढत जाईल.

अंतिम परिणाम:

![Piggy Bank](../../RESOURCE/014_view.png)

## एकूण रक्कम दाखवणे

सर्वप्रथम, view मध्ये “गुलक” मधील एकूण रक्कम दाखवावी लागेल.

`ContentView` मध्ये “गुलक” ची एकूण रक्कम साठवण्यासाठी एक variable declare करू.

```swift
@State private var amount = 0
```

यानंतर, `Text` वापरून ही रक्कम दाखवू:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

इथे `.font` आणि `.fontWeight` वापरून font size आणि thickness सेट केली आहे.

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

`amount` बदलला की `Text` मधील एकूण रक्कमही आपोआप refresh होईल.

## रक्कम input करणे

“गुलक” मध्ये फक्त एकूण रक्कम दाखवणे पुरेसे नाही; वापरकर्त्याला जमा करायची रक्कम input करता यायला हवी. यासाठी SwiftUI मधील `TextField` view control वापरतो.

### TextField

`TextField` हा SwiftUI मधील content input करण्यासाठीचा view control आहे. तो सहसा single-line input साठी वापरला जातो.

`TextField` दोन मुख्य binding formats देते:

**1. String type binding**

```swift
TextField("Placeholder", text: $text)
```

हे नाव, title यांसारख्या text input साठी योग्य आहे.

**2. number type binding（Int/Double）**

```swift
TextField("Amount", value: $number, format: .number)
```

हे वय, पगार, रक्कम यांसारख्या संख्यात्मक input साठी योग्य आहे.

`format: .number` म्हणजे हा input field “number format” नुसार parse आणि display केला जाईल.

#### placeholder text

`TextField` चा पहिला parameter हा placeholder असतो, जो वापरकर्त्याला input करायची सूचना देतो:

```swift
TextField("input your name", text: $text)
```

जेव्हा input field रिकामा असतो, तेव्हा राखाडी रंगात hint text दिसतो.

![textfield](../../RESOURCE/014_textfield.png)

#### data binding

`TextField` स्वतः input content persist करत नाही; data व्यवस्थापनासाठी binding variable लागते.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

वापरकर्ता जे काही input करतो ते थेट `text` variable मध्ये साठवले जाते. `TextField` फक्त input interface देते.

`$` म्हणजे binding:

```swift
$text
```

हे सामान्य variable नसून `Binding` प्रकार आहे.

याचे काम view आणि data यांच्यात संबंध निर्माण करणे आहे:

वापरकर्ता `TextField` मध्ये input करतो तेव्हा `text` आपोआप update होते; आणि `text` बदलल्यावर `TextField` मध्ये दिसणारे content देखील sync होते.

उदाहरणार्थ:

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

`TextField` मध्ये input केल्यावर वरचा `Text` real-time मध्ये sync होऊन दाखवतो.

![textField](../../RESOURCE/014_textfield1.png)

### number type binding

जेव्हा number input करायचा असतो, तेव्हा त्यासाठी योग्य प्रकारचा variable bind करावा लागतो:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

वापरकर्ता रक्कम input करताना `TextField` input content parse करून `number` ची value आपोआप update करतो.

## input field जोडणे

`TextField` चा मूलभूत वापर समजल्यानंतर, तो आपण “गुलक” project मध्ये वापरूया.

“गुलक” मध्ये “रक्कम” input करायची आहे, म्हणून आपण “number type binding（Int/Double）” वापरू. तसेच वापरकर्त्याने input केलेली रक्कम साठवण्यासाठी `number` नावाचा नवीन variable declare करू:

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

आता `TextField` डीफॉल्टने `number` ची value दाखवेल (default `0`).

जेव्हा input content साफ होईल, तेव्हा placeholder “Amount” दिसेल.

यावरून पुन्हा हे स्पष्ट होते की `TextField` binding variable चे value दाखवतो; content तो स्वतः साठवत नाही.

### input field चा आकार

सध्याच्या view मध्ये आपण पाहू शकतो की `TextField` ला border नाही, फक्त एक `0` दिसते, आणि content डावीकडे aligned वाटते.

असा परिणाम दिसतो:

![textfield](../../RESOURCE/014_textfield2.png)

कारण `TextField` डीफॉल्टने parent view ची संपूर्ण रुंदी घेण्याचा प्रयत्न करतो.

हे तपासण्यासाठी आपण background color देऊ शकतो:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

परिणाम:

![textfield](../../RESOURCE/014_textfield3.png)

यावरून दिसते की `TextField` प्रत्यक्षात पूर्ण ओळ व्यापतो.

### निश्चित रुंदी सेट करणे

जर input field अधिक compact हवा असेल, तर `frame` वापरून रुंदी मर्यादित करू शकतो:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

परिणाम:

![textfield](../../RESOURCE/014_textfield4.png)

### border आणि padding जोडणे

`TextField` ला default border नसल्यामुळे, आपण manually style देऊ शकतो:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

आता हा input field अधिक “standard input field” सारखा दिसतो.

![textfield](../../RESOURCE/014_textfield5.png)

## border

SwiftUI मध्ये `border` वापरून view ला चौकट देता येते.

मूलभूत वापर:

```swift
border(Color.black, width: 1)
```

इथे `Color.black` हा border चा रंग आहे, आणि `width` ही त्याची जाडी आहे.

`TextField` मध्ये आपण असे वापरले:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

याचा अर्थ input field ला काळ्या रंगाचा, 1 pt जाडीचा border देणे.

तुम्ही इतर रंगही वापरून पाहू शकता, जसे `Color.blue`, `Color.green`, किंवा border जाड करून `width: 2` करू शकता.

## पैसे साठवण्याचे बटण

आता आपल्या कडे एकूण रक्कम दाखवण्यासाठी `amount` variable आहे, रक्कम input करण्यासाठी `TextField` आहे, आणि input field शी binding असलेला `number` variable आहे.

सध्याचा code:

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

### बटण जोडणे

पुढे, पैसे जमा करण्याची क्रिया trigger करण्यासाठी एक बटण जोडू.

```swift
Button("Save") {
    
}
```

### पैसे साठवण्याची logic

आपल्याला असे करायचे आहे की वापरकर्ता रक्कम input करेल, आणि बटणावर क्लिक केल्यावर ती एकूण रक्कमेत जमा होईल.

```swift
Button("Save") {
    amount += number
}
```

इथे compound assignment operator वापरून वापरकर्त्याने input केलेली `number` रक्कम `amount` मध्ये जमा केली जाते.

### input रक्कम reset करणे

आता एक समस्या आहे: प्रत्येकवेळी बटणावर क्लिक केल्यावर input field मधील रक्कम साफ होत नाही.

जर वापरकर्त्याने `10` input केले आणि save केले, तर input field मध्ये अजूनही `10` राहते, ज्यामुळे पुढील input मध्ये गोंधळ होऊ शकतो.

याचे कारण म्हणजे `TextField` हे `number` शी bind आहे. आपण बटण क्लिक करताना फक्त `amount` बदलतो, पण `number` बदलत नाही, त्यामुळे input field जुनाच value दाखवतो.

म्हणून clear logic जोडावी लागेल: बटणावर क्लिक केल्यावर आधी input रक्कम जमा करायची, आणि नंतर input value reset करायची:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

आता वापरकर्ता रक्कम input करून बटणावर क्लिक करेल तेव्हा ती रक्कम एकूण रक्कमेत जमा होईल, आणि `number` पुन्हा `0` होईल, जे पुढील input साठी सोयीचे आहे.

अशा प्रकारे आपण “गुलक” ची मुख्य saving logic पूर्ण केली आहे.

## view सुधारणा

functionality पूर्ण झाल्यानंतर, interface मध्ये थोडी साधी सुधारणा करू शकतो: background image जोडणे आणि button style लावणे.

button style जोडणे:

```swift
.buttonStyle(.borderedProminent)
```

background image जोडणे:

```swift
.background {
    Image("1")
}
```

आता आपण संपूर्ण “गुलक” project पूर्ण केले आहे.

## पूर्ण कोड

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

अंतिम परिणाम:

![Piggy Bank](../../RESOURCE/014_view.png)

आता आपण 100 किंवा त्याहून अधिक रक्कम जमा करून “गुलक” ची logic योग्य आहे का हे तपासू शकतो.

किंवा “गुलक” सिम्युलेटर किंवा प्रत्यक्ष डिव्हाइसवर चालवून आपण तयार केलेला app अनुभवू शकतो.

### debug output

logic योग्य आहे का ते तपासण्यासाठी, बटणामध्ये debug logic जोडता येते, ज्यामुळे input केलेली रक्कम योग्यरीत्या हाताळली जात आहे का ते पडताळता येते:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

प्रत्येक saving नंतर बटणावर क्लिक केल्यावर पुढील debug output दिसेल, ज्यामुळे code logic मध्ये काही समस्या आहे का ते तपासता येईल.

```
---Saving---
amount:11
number:0
```
