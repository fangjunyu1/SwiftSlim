# பணம் சேமிப்பு குடுவை

இந்தப் பாடத்தில், நாம் ஒரு எளிய “பணம் சேமிப்பு குடுவை” திட்டத்தை உருவாக்கப் போகிறோம். இதில் செயல்பாடு எளிமையாக இருந்தாலும், முழுமையான interaction logic இருக்கும்; ஆகவே, இது தொடக்க நிலை பயிலர்களுக்கு மிகவும் பொருத்தமான ஒரு அறிமுகத் திட்டமாகும்.

இந்தத் திட்டத்தின் மூலம், நாம் `TextField` (உள்ளீட்டு பெட்டி) மற்றும் `border` எல்லை கோடு ஆகியவற்றைக் கற்போம். அதோடு, data binding (`$`) பற்றியும் புரிந்துகொள்வோம்.

இறுதி இலக்கு: ஒரு தொகையை உள்ளிடலாம், button-ஐ அழுத்தி அதை சேமிக்கலாம், மேலும் மொத்த சேமிப்பு தொகையில் அதைச் சேர்க்கலாம் — இப்படியான ஒரு “பணம் சேமிப்பு குடுவை” திட்டத்தை உருவாக்குவது.

செயல்பாட்டு தோற்றம்:

![Piggy Bank](../../RESOURCE/014_view.png)

## மொத்தத் தொகையை காட்டுதல்

முதலில், view-இல் “பணம் சேமிப்பு குடுவை”யின் மொத்தத் தொகையை காட்ட வேண்டும்.

`ContentView`-இல், மொத்தத் தொகையை சேமிக்க ஒரு variable-ஐ அறிவிக்கலாம்.

```swift
@State private var amount = 0
```

பின்னர், `Text` பயன்படுத்தி அந்தத் தொகையை காட்டலாம்:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

இங்கே, `.font` மற்றும் `.fontWeight` பயன்படுத்தி எழுத்தின் அளவையும் தடிமனையும் அமைக்கிறோம்.

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

`amount` மாறும் போது, `Text`-ல் காட்டப்படும் மொத்தத் தொகையும் தானாகப் புதுப்பிக்கப்படும்.

## தொகையை உள்ளிடுதல்

“பணம் சேமிப்பு குடுவை” மொத்தத் தொகையை காட்டுவதற்குப் பின்பு, பயனர் சேமிக்க வேண்டிய தொகையை “உள்ளிடவும்” முடியும் போல இருக்க வேண்டும். இதற்காக SwiftUI-இன் `TextField` view control பயன்படுத்தப்படுகிறது.

### TextField

`TextField` என்பது SwiftUI-இல் உள்ளீட்டுக்காகப் பயன்படும் ஒரு view control ஆகும். இது பொதுவாக ஒற்றை வரி உள்ளீட்டிற்குப் பயன்படுத்தப்படுகிறது.

`TextField` முக்கியமாக இரண்டு binding வடிவங்களை வழங்குகிறது:

**1. String வகையை bind செய்தல்**

```swift
TextField("Placeholder", text: $text)
```

இது பெயர், தலைப்பு போன்ற text input-களுக்கு ஏற்றது.

**2. எண் வகையை bind செய்தல் (Int/Double)**

```swift
TextField("Amount", value: $number, format: .number)
```

இது வயது, சம்பளம், தொகை போன்ற எண் உள்ளீடுகளுக்கு ஏற்றது.

`format: .number` என்பது, இந்த input box எண்ணாக parse செய்து காட்டப்படும் என்பதை குறிக்கிறது.

#### Placeholder உரை

`TextField`-இன் முதல் parameter என்பது placeholder ஆகும். இது பயனருக்கு என்ன உள்ளிட வேண்டும் என்பதைச் சொல்லும்:

```swift
TextField("input your name", text: $text)
```

உள்ளீட்டு பெட்டி காலியாக இருக்கும் போது, சாம்பல் நிறத்தில் ஒரு குறிப்புரை தோன்றும்.

![textfield](../../RESOURCE/014_textfield.png)

#### Data Binding

`TextField` உள்ளீட்டு மதிப்பை தானாக நிரந்தரமாக சேமிக்காது. அதற்குப் பதிலாக, bound செய்யப்பட்ட variable மூலம் தரவை நிர்வகிக்க வேண்டும்.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

பயனர் உள்ளிடும் உள்ளடக்கம் நேரடியாக `text` variable-இல் சேமிக்கப்படும்; `TextField` என்பது உள்ளீட்டு UI-ஐ மட்டும் பொறுப்பேற்கிறது.

`$` என்பது binding-ஐ குறிக்கும்:

```swift
$text
```

இது ஒரு சாதாரண variable அல்ல; இது `Binding` வகையைச் சேர்ந்தது.

இதன் பணி, view மற்றும் data இடையே தொடர்பு அமைப்பதாகும்:

பயனர் `TextField`-இல் உள்ளிடும் போது, `text` தானாகப் புதுப்பிக்கும்; அதேபோல் `text` மாறினால், `TextField`-லும் அதே மாற்றம் உடனடியாக பிரதிபலிக்கும்.

உதாரணமாக:

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

`TextField`-இல் உள்ளடக்கம் எழுதும் போது, மேலே உள்ள `Text` அதையே உடனுக்குடன் காட்டும்.

![textField](../../RESOURCE/014_textfield1.png)

### எண் வகையை bind செய்தல்

எண்களை உள்ளிட வேண்டுமானால், அதற்கேற்ற வகை variable-ஐ bind செய்ய வேண்டும்:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

பயனர் தொகையை உள்ளிடும் போது, `TextField` அந்த உள்ளீட்டை எண்ணாக parse செய்து, `number`-ன் மதிப்பை தானாகப் புதுப்பிக்கும்.

## உள்ளீட்டு பெட்டியைச் சேர்த்தல்

இப்போது `TextField`-இன் அடிப்படைப் பயன்பாட்டை புரிந்துகொண்டதால், அதை “பணம் சேமிப்பு குடுவை” திட்டத்தில் பயன்படுத்தலாம்.

“பணம் சேமிப்பு குடுவை”யில் “தொகை”யை உள்ளிட வேண்டும். ஆகவே, “எண் வகையை bind செய்வது” என்ற முறையைப் பயன்படுத்தி, பயனர் உள்ளிட்ட தொகையை சேமிக்க `number` என்ற புதிய variable-ஐ சேர்க்கிறோம்:

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

இப்போது, `TextField` இயல்பாக `number`-ன் மதிப்பை (default ஆக 0) காட்டும்.

உள்ளீட்டை முழுவதும் அழித்துவிட்டால், placeholder ஆன “Amount” காட்டப்படும்.

இதன் மூலம் மீண்டும் ஒரு விஷயம் தெளிவாகிறது: `TextField` தனியாக மதிப்பைச் சேமிக்காது; அது bound செய்யப்பட்ட variable-ன் மதிப்பை மட்டுமே காட்டுகிறது.

### உள்ளீட்டு பெட்டியின் அளவு சிக்கல்

தற்போதைய view-இல், `TextField`-க்கு எந்த border-மும் இல்லை; ஒரு `0` மட்டும் காட்டப்படுகிறது, மேலும் அது இடப்புறத்தில் align ஆனதுபோலத் தோன்றும்.

அதன் தோற்றம்:

![textfield](../../RESOURCE/014_textfield2.png)

இது `TextField` இயல்பாக parent view-இன் முழு அகலத்தையும் எடுத்துக்கொள்வதால் ஏற்படுகிறது.

இதைக் காண்பதற்காக background color சேர்த்து சரிபார்க்கலாம்:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

அதன் தோற்றம்:

![textfield](../../RESOURCE/014_textfield3.png)

இப்போது `TextField` உண்மையில் முழு வரியின் அகலத்தையும் நிரப்புவதை தெளிவாகக் காணலாம்.

### நிரந்தர அகலத்தை அமைத்தல்

உள்ளீட்டு பெட்டி சற்றுச் சுருக்கமாக இருக்க வேண்டும் என்றால், `frame` பயன்படுத்தி அதன் அகலத்தை வரையறுக்கலாம்:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

அதன் தோற்றம்:

![textfield](../../RESOURCE/014_textfield4.png)

### Border மற்றும் Padding சேர்த்தல்

`TextField`-க்கு இயல்பாக border இல்லை. ஆகவே, நாமே style சேர்க்கலாம்:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

இப்போது, இந்த input box ஒரு “சாதாரண உள்ளீட்டு பெட்டி” போலத் தோன்றும்.

![textfield](../../RESOURCE/014_textfield5.png)

## Border

SwiftUI-இல், `border` என்பது view-க்கு ஓரம் சேர்க்கப் பயன்படுத்தப்படுகிறது.

அடிப்படைப் பயன்பாடு:

```swift
border(Color.black, width: 1)
```

இதில், `Color.black` என்பது border-ன் நிறத்தைக் குறிக்கிறது; `width` என்பது அதன் தடிமனைச் சொல்கிறது.

`TextField`-இல், நாம் இதைப் பயன்படுத்துவது:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

இதன் பொருள், input box-க்கு கருப்பு நிறத்தில், 1 pt அகலமுள்ள border சேர்க்கப்படுகிறது.

வேறு நிறங்களையும் முயற்சிக்கலாம்; உதாரணமாக `Color.blue`, `Color.green`, அல்லது `width: 2` என்று border-ஐ கொஞ்சம் தடிமனாக்கலாம்.

## சேமிப்பு Button

இப்போது, மொத்தத் தொகையை காட்டும் `amount` variable, உள்ளீட்டிற்கான `TextField`, மேலும் அதனுடன் bind செய்யப்பட்ட `number` variable — இவை அனைத்தும் நமக்குக் கிடைத்துவிட்டன.

தற்போதைய code:

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

### Button சேர்த்தல்

அடுத்ததாக, சேமிப்பு செயல்பாட்டைத் தொடங்க ஒரு button சேர்க்க வேண்டும்.

```swift
Button("Save") {
    
}
```

### சேமிப்பு logic-ஐ செயல்படுத்தல்

பயனர் உள்ளிடும் தொகை, button-ஐ அழுத்தும் போது தானாக மொத்தத் தொகையில் சேர வேண்டும்.

```swift
Button("Save") {
    amount += number
}
```

இங்கே, “compound assignment operator” பயன்படுத்தி, பயனர் உள்ளிட்ட `number` தொகையை மொத்தத் தொகையான `amount`-க்கு கூட்டுகிறோம்.

### உள்ளீட்டு தொகையை reset செய்தல்

இப்போது ஒரு சிக்கல் உள்ளது: button அழுத்திய பிறகும், input box-இல் உள்ள தொகை அழிக்கப்படவில்லை.

பயனர் `10` உள்ளிட்டுப் சேமித்தால், input box-இல் இன்னும் `10`தான் இருக்கும். இது அடுத்த முறை சேமிக்கும் போது குழப்பத்தை உண்டாக்கும்.

இதற்குக் காரணம், `TextField` என்பது `number`-க்கு bind செய்யப்பட்டிருக்கிறது. ஆனால் button அழுத்தும் போது நாம் `amount`-ஐ மட்டும் மாற்றினோம்; `number` மாறவில்லை. அதனால் input box பழைய மதிப்பையே காட்டிக் கொண்டிருக்கிறது.

இதைக் சரி செய்ய, button அழுத்திய பிறகு, முதலில் தொகையை மொத்தத்தில் சேர்த்து, பின்னர் உள்ளீட்டு மதிப்பை reset செய்ய வேண்டும்:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

இப்போது, பயனர் தொகையை உள்ளிட்டு button அழுத்தும் போது, அந்தத் தொகை மொத்த சேமிப்பில் சேரும். அதன் பிறகு `number` மீண்டும் `0` ஆக மாறும்; இதனால் அடுத்த முறை புதிய தொகையை உள்ளிட வசதியாக இருக்கும்.

இவ்வாறு, “பணம் சேமிப்பு குடுவை”யின் அனைத்து சேமிப்பு logic-களையும் நாம்செயல்படுத்திவிட்டோம்.

## View-ஐ மேம்படுத்தல்

அடிப்படைச் செயல்பாடு முடிந்த பின், UI-ஐ சற்றுச் சிறப்பாக மாற்றலாம். உதாரணமாக, background image மற்றும் button style சேர்க்கலாம்.

Button style சேர்த்தல்:

```swift
.buttonStyle(.borderedProminent)
```

Background image சேர்த்தல்:

```swift
.background {
    Image("1")
}
```

இப்போது, முழு “பணம் சேமிப்பு குடுவை” திட்டத்தையும் நாம் முடித்துவிட்டோம்.

## முழுமையான code

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

செயல்பாட்டு தோற்றம்:

![Piggy Bank](../../RESOURCE/014_view.png)

இப்போது, `100` அல்லது அதற்கும் மேற்பட்ட தொகையைச் சேமித்து, “பணம் சேமிப்பு குடுவை” logic-இல் ஏதேனும் சிக்கல் உள்ளதா என்று சோதிக்கலாம்.

அல்லது, இந்த “பணம் சேமிப்பு குடுவை”யை simulator அல்லது real device-இல் இயக்கி, நாமே உருவாக்கிய app-ஐ அனுபவித்துப் பார்க்கலாம்.

### Debug output

Logic சரியாக இயங்குகிறதா என்பதை உறுதிப்படுத்த, button action-இல் debug code-ஐ சேர்த்தும் பார்க்கலாம்:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ஒவ்வொரு முறையும் தொகையைச் சேமித்து button அழுத்தும் போது, தொடர்புடைய debug output console-இல் தோன்றும். இதன் மூலம் code logic-இல் ஏதேனும் பிழை உள்ளதா என்று பார்க்கலாம்.

```id="n234lz"
---Saving---
amount:11
number:0
```
