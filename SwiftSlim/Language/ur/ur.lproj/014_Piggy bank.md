# مٹی کا گلک

اس سبق میں ہم ایک سادہ "مٹی کا گلک" project بنائیں گے۔ اس کی functionality سادہ ہے، مگر اس میں مکمل interactive logic موجود ہے، اس لیے یہ beginners کے لیے بہت موزوں ہے۔

اس project کے ذریعے ہم `TextField` (input box) اور `border` کو سیکھیں گے، اور data binding (`$`) کو بھی سمجھیں گے۔

آخری مقصد یہ ہے کہ ایک ایسا "مٹی کا گلک" project بنایا جائے جس میں رقم داخل کی جا سکے، button دبانے پر وہ محفوظ ہو، اور کل رقم میں جمع ہوتی جائے۔

حاصل ہونے والا نتیجہ:

![Piggy Bank](../../RESOURCE/014_view.png)

## کل رقم دکھانا

سب سے پہلے، ہمیں view میں "مٹی کا گلک" کی کل رقم دکھانی ہے۔

`ContentView` میں ایک variable declare کریں جو "مٹی کا گلک" کی کل رقم محفوظ کرے۔

```swift id="wjqoja"
@State private var amount = 0
```

پھر `Text` کے ذریعے یہ رقم دکھائیں:

```swift id="frcjlwm"
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

یہاں `.font` اور `.fontWeight` استعمال کرکے font کا size اور weight طے کیا گیا ہے۔

```swift id="ma5our"
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

جب `amount` بدلے گا، تو `Text` میں دکھائی جانے والی کل رقم بھی خود بخود update ہو جائے گی۔

## رقم داخل کرنا

"مٹی کا گلک" میں صرف کل رقم دکھانا کافی نہیں، بلکہ user کو جمع کی جانے والی رقم "داخل" کرنے کی سہولت بھی دینی ہے، اور اس کے لیے SwiftUI کا `TextField` استعمال ہوگا۔

### TextField

`TextField` SwiftUI کا وہ view control ہے جو input لینے کے لیے استعمال ہوتا ہے، اور عموماً single-line input کے لیے ہوتا ہے۔

`TextField` بنیادی طور پر binding کی دو شکلیں فراہم کرتا ہے:

**1. String type کے ساتھ binding**

```swift id="d8ts06"
TextField("Placeholder", text: $text)
```

یہ names، titles، یا عام text input کے لیے موزوں ہے۔

**2. Numeric type (Int/Double) کے ساتھ binding**

```swift id="ioc32m"
TextField("Amount", value: $number, format: .number)
```

یہ age، salary، amount جیسے numeric inputs کے لیے موزوں ہے۔

`format: .number` کا مطلب ہے کہ یہ input box "number format" کے مطابق input کو parse اور display کرے گا۔

#### Text placeholder

`TextField` کا پہلا parameter placeholder ہوتا ہے، جو user کو input کے بارے میں hint دیتا ہے:

```swift id="g3kpr0"
TextField("input your name", text: $text)
```

جب input box خالی ہوگا، تو اس میں ایک ہلکا سرمئی hint text دکھائی دے گا۔

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

`TextField` input content کو خود persist نہیں کرتا، بلکہ data کو ایک bound variable کے ذریعے manage کیا جاتا ہے۔

```swift id="1efts7"
@State private var text = ""
TextField("Placeholder", text: $text)
```

User کی داخل کی گئی value براہِ راست `text` variable میں محفوظ ہو جاتی ہے، اور `TextField` صرف input interface مہیا کرتا ہے۔

`$` binding کو ظاہر کرتا ہے:

```swift id="1bjkq1"
$text
```

یہ عام variable نہیں، بلکہ `Binding` type ہے۔

اس کا کام view اور data کے درمیان ایک تعلق قائم کرنا ہے:

جب user `TextField` میں کچھ لکھتا ہے، تو `text` خودکار طور پر update ہو جاتا ہے؛ اور جب `text` بدلے، تو `TextField` بھی اسی کے مطابق update ہو جاتا ہے۔

مثلاً:

```swift id="vl8hbc"
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

جب `TextField` میں کچھ لکھا جائے گا، تو اوپر والا `Text` بھی real time میں وہی content دکھائے گا۔

![textField](../../RESOURCE/014_textfield1.png)

### Numeric type کے ساتھ binding

جب input number کی صورت میں ہو، تو اسی type کا variable bind کرنا ضروری ہے:

```swift id="pax7ky"
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

جب user رقم داخل کرے گا، تو `TextField` input content کو parse کرے گا، اور `number` کی value خودکار طور پر update ہو جائے گی۔

## Input box شامل کرنا

`TextField` کی بنیادی syntax سمجھنے کے بعد، اب ہم اسے "مٹی کا گلک" project میں استعمال کرتے ہیں۔

چونکہ "مٹی کا گلک" میں "رقم" داخل کرنی ہے، اس لیے ہم "numeric type binding (Int/Double)" والی شکل استعمال کریں گے، اور ایک نیا `number` variable بنائیں گے جو user کی داخل کی گئی رقم محفوظ کرے:

```swift id="ofagju"
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

اب `TextField` بطورِ default `number` کی value دکھائے گا (ابتدائی value `0` ہے)۔

جب input content کو صاف کیا جائے گا، تو placeholder `"Amount"` دکھائی دے گا۔

اس سے ایک بار پھر واضح ہوتا ہے کہ `TextField` اپنی value خود محفوظ نہیں کرتا، بلکہ bound variable کی value دکھاتا ہے۔

### Input box کے size کا مسئلہ

موجودہ view میں ہم دیکھیں گے کہ `TextField` کے گرد کوئی border نہیں ہے، صرف ایک `0` دکھائی دیتا ہے، اور content بائیں طرف aligned نظر آتی ہے۔

نتیجہ کچھ یوں ہوگا:

![textfield](../../RESOURCE/014_textfield2.png)

اس کی وجہ یہ ہے کہ `TextField` بطورِ default parent view کی پوری چوڑائی لینے کی کوشش کرتا ہے۔

ہم background color لگا کر یہ بات verify کر سکتے ہیں:

```swift id="b8iyu4"
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

نتیجہ:

![textfield](../../RESOURCE/014_textfield3.png)

یہاں واضح ہے کہ `TextField` حقیقت میں پوری line کی width لے رہا ہے۔

### Fixed width مقرر کرنا

اگر ہم چاہتے ہیں کہ input box زیادہ compact ہو، تو `frame` استعمال کر کے اس کی width محدود کر سکتے ہیں:

```swift id="81sn1o"
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

نتیجہ:

![textfield](../../RESOURCE/014_textfield4.png)

### Border اور padding شامل کرنا

چونکہ `TextField` میں default طور پر border نہیں ہوتی، اس لیے ہم styling manually شامل کر سکتے ہیں:

```swift id="8tt0bp"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

اب یہ input box زیادہ ایک "معیاری input box" جیسا لگے گا۔

![textfield](../../RESOURCE/014_textfield5.png)

## Border

SwiftUI میں `border` کسی view کے گرد border لگانے کے لیے استعمال ہوتا ہے۔

بنیادی استعمال:

```swift id="u1x9w6"
border(Color.black, width: 1)
```

اس میں `Color.black` border کا رنگ ظاہر کرتا ہے، اور `width` border کی موٹائی کو ظاہر کرتا ہے۔

`TextField` میں ہم نے یہ استعمال کیا:

```swift id="lbq2ly"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

اس کا مطلب ہے کہ input box کے گرد ایک سیاہ border لگائی گئی ہے، جس کی چوڑائی 1 pt ہے۔

آپ دوسری colors بھی آزما سکتے ہیں، جیسے `Color.blue`، `Color.green`، یا border کو موٹا کرنے کے لیے `width: 2`۔

## Save button

اب ہمارے پاس کل رقم دکھانے کے لیے `amount` variable موجود ہے، user input کے لیے `TextField` موجود ہے، اور اس کے ساتھ bind کیا گیا `number` variable بھی موجود ہے۔

اب تک کا code یہ ہے:

```swift id="sl5pcy"
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

### Button شامل کرنا

اب ہمیں ایک button شامل کرنا ہے، جو save operation کو trigger کرے۔

```swift id="s4eqz7"
Button("Save") {
    
}
```

### Save logic بنانا

ہم چاہتے ہیں کہ user رقم داخل کرے، پھر button دبائے، اور وہ رقم خود بخود کل رقم میں جمع ہو جائے۔

```swift id="3x0gsc"
Button("Save") {
    amount += number
}
```

یہاں compound assignment operator استعمال کیا گیا ہے، جس کے ذریعے user کی داخل کی گئی رقم `number` کو کل رقم `amount` میں جمع کیا جاتا ہے۔

### Input amount کو reset کرنا

اب ایک مسئلہ ہے: ہر بار button دبانے کے بعد input box خود خالی نہیں ہوتا۔

اگر user `10` داخل کرے اور save پر click کرے، تو input box میں پھر بھی `10` ہی رہتا ہے، جو اگلی بار رقم داخل کرنے میں رکاوٹ بن سکتا ہے۔

اس کی وجہ یہ ہے کہ `TextField`، `number` سے bound ہے۔ جب button دبایا گیا، تو ہم نے صرف `amount` بدلا، `number` نہیں بدلا، اس لیے input box میں پرانی value موجود رہی۔

اس کے لیے ہمیں clearing logic شامل کرنا ہوگی: button دبانے کے بعد پہلے رقم کو کل رقم میں شامل کریں، پھر input value reset کر دیں:

```swift id="qqvlem"
Button("Save") {
    amount += number
	number = 0
}
```

اب جب user رقم داخل کرے گا اور button دبائے گا، تو input رقم کل رقم میں جمع ہو جائے گی، اور `number` دوبارہ `0` ہو جائے گا، تاکہ اگلی input کے لیے box تیار رہے۔

اس طرح ہم نے "مٹی کا گلک" کی بنیادی saving logic مکمل کر لی۔

## View کو بہتر بنانا

Functionality مکمل ہونے کے بعد ہم interface میں کچھ سادہ بہتری بھی لا سکتے ہیں، جیسے background image اور button style شامل کرنا۔

Button style شامل کرنا:

```swift id="551ozd"
.buttonStyle(.borderedProminent)
```

Background image شامل کرنا:

```swift id="9gez8k"
.background {
    Image("1")
}
```

اب ہم "مٹی کا گلک" project کی development مکمل کر چکے ہیں۔

## مکمل code

```swift id="pv9tzw"
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

حاصل ہونے والا نتیجہ:

![Piggy Bank](../../RESOURCE/014_view.png)

اب ہم `100` یا اس سے زیادہ رقم save کر کے آزما سکتے ہیں، تاکہ یہ جانچا جا سکے کہ "مٹی کا گلک" کی logic میں کوئی مسئلہ تو نہیں۔

یا پھر "مٹی کا گلک" کو simulator یا حقیقی device پر چلا کر اپنی بنائی ہوئی app کا تجربہ کیا جا سکتا ہے۔

### Debug output

Logic کو verify کرنے کے لیے ہم button کے اندر debug output بھی شامل کر سکتے ہیں، تاکہ یہ دیکھا جا سکے کہ داخل کی گئی رقم درست طریقے سے process ہو رہی ہے یا نہیں:

```swift id="ecylqm"
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ہر بار save کرنے اور button دبانے پر ہم متعلقہ debug output دیکھ سکیں گے، اور اس سے code logic میں مسئلہ ہونے یا نہ ہونے کی جانچ ہو سکے گی۔

```swift id="lb8rkl"
---Saving---
amount:11
number:0
```
