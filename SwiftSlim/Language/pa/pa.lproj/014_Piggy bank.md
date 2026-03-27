# ਗੁੱਲਕ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ “ਗੁੱਲਕ” project ਬਣਾਵਾਂਗੇ। ਇਸਦੀ functionality ਸਧਾਰਣ ਹੈ, ਪਰ ਇਸ ਵਿੱਚ ਪੂਰੀ interaction logic ਸ਼ਾਮਲ ਹੈ, ਇਸ ਲਈ ਇਹ beginners ਲਈ ਬਹੁਤ ਉਚਿਤ ਹੈ।

ਇਸ project ਰਾਹੀਂ ਅਸੀਂ TextField (input box) ਅਤੇ border ਬਾਰੇ ਸਿੱਖਾਂਗੇ, ਨਾਲ ਹੀ data binding ($) ਨੂੰ ਵੀ ਸਮਝਾਂਗੇ।

ਅੰਤਿਮ ਲੱਖ ਹੈ ਇੱਕ ਐਸਾ “ਗੁੱਲਕ” project ਤਿਆਰ ਕਰਨਾ ਜਿਸ ਵਿੱਚ ਰਕਮ ਦਾਖਲ ਕੀਤੀ ਜਾ ਸਕੇ, button 'ਤੇ click ਕਰਕੇ save ਕੀਤੀ ਜਾ ਸਕੇ, ਅਤੇ total amount ਨੂੰ ਜੋੜ ਕੇ ਦਿਖਾਇਆ ਜਾ ਸਕੇ।

ਅਸਰ:

![Piggy Bank](../../RESOURCE/014_view.png)

## ਕੁੱਲ ਰਕਮ ਦਿਖਾਉਣਾ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਸਾਨੂੰ view ਵਿੱਚ “ਗੁੱਲਕ” ਦੀ ਕੁੱਲ ਰਕਮ ਦਿਖਾਉਣੀ ਹੈ।

ContentView ਵਿੱਚ ਇੱਕ variable declare ਕਰੋ ਜੋ “ਗੁੱਲਕ” ਦੀ total amount ਸੰਭਾਲੇ।

```swift
@State private var amount = 0
````

ਫਿਰ, ਇਸ ਰਕਮ ਨੂੰ ਦਿਖਾਉਣ ਲਈ Text ਵਰਤੋ:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

ਇੱਥੇ .font ਅਤੇ .fontWeight ਨਾਲ font ਦਾ size ਅਤੇ weight set ਕੀਤਾ ਗਿਆ ਹੈ।

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

ਜਦੋਂ amount ਬਦਲਦਾ ਹੈ, ਤਾਂ Text ਵਿੱਚ ਦਿਖ ਰਹੀ total amount ਵੀ ਆਪਣੇ ਆਪ refresh ਹੋ ਜਾਂਦੀ ਹੈ।

## ਰਕਮ ਦਾਖਲ ਕਰਨਾ

“ਗੁੱਲਕ” ਵਿੱਚ ਸਿਰਫ total amount ਦਿਖਾਉਣੀ ਹੀ ਨਹੀਂ, ਸਗੋਂ user ਨੂੰ ਜਮ੍ਹਾ ਜਾਂ ਕੱਢੀ ਜਾਣ ਵਾਲੀ ਰਕਮ “ਦਾਖਲ” ਕਰਨ ਦੀ ਵੀ ਲੋੜ ਹੈ। ਇਸ ਲਈ ਸਾਨੂੰ SwiftUI ਦਾ TextField view control ਵਰਤਣਾ ਪਵੇਗਾ।

### TextField

TextField SwiftUI ਵਿੱਚ input ਲਈ ਵਰਤਿਆ ਜਾਣ ਵਾਲਾ view control ਹੈ, ਜੋ ਆਮ ਤੌਰ 'ਤੇ single-line input ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

TextField ਆਮ ਤੌਰ 'ਤੇ binding ਦੀਆਂ ਦੋ ਮੁੱਖ ਰੂਪ-ਰੇਖਾਵਾਂ ਦਿੰਦਾ ਹੈ:

**1. String type ਨੂੰ bind ਕਰਨਾ**

```swift
TextField("Placeholder", text: $text)
```

ਇਹ names, titles ਆਦਿ ਜਿਹੀ text input ਲਈ ਉਚਿਤ ਹੈ।

**2. Numeric type (Int/Double) ਨੂੰ bind ਕਰਨਾ**

```swift
TextField("Amount", value: $number, format: .number)
```

ਇਹ age, salary, amount ਵਰਗੀਆਂ numeric inputs ਲਈ ਉਚਿਤ ਹੈ।

format: .number ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਇਹ input box input ਨੂੰ “number format” ਦੇ ਰੂਪ ਵਿੱਚ parse ਅਤੇ display ਕਰੇਗਾ।

#### Text placeholder

TextField ਦਾ ਪਹਿਲਾ parameter placeholder ਹੁੰਦਾ ਹੈ, ਜੋ user ਨੂੰ input ਲਈ ਸੰਕੇਤ ਦੇਂਦਾ ਹੈ:

```swift
TextField("input your name", text: $text)
```

ਜਦੋਂ input box ਖਾਲੀ ਹੁੰਦਾ ਹੈ, ਤਦੋਂ ਇੱਕ ਧੁੰਦਲਾ (gray) hint text ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

TextField ਆਪ input content ਨੂੰ permanent save ਨਹੀਂ ਕਰਦਾ; data ਨੂੰ manage ਕਰਨ ਲਈ ਇਸਨੂੰ ਇੱਕ bound variable ਨਾਲ ਜੋੜਨਾ ਪੈਂਦਾ ਹੈ।

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

User ਦੁਆਰਾ ਦਾਖਲ ਕੀਤਾ ਗਿਆ content ਸਿੱਧੇ text variable ਵਿੱਚ save ਹੁੰਦਾ ਹੈ; TextField ਸਿਰਫ input interface ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਨਿਭਾਂਦਾ ਹੈ।

$ binding ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ:

```swift
$text
```

ਇਹ ਕੋਈ ਆਮ variable ਨਹੀਂ, ਸਗੋਂ ਇੱਕ Binding type ਹੈ।

ਇਸਦਾ ਕੰਮ view ਅਤੇ data ਦੇ ਵਿਚਕਾਰ connection ਬਣਾਉਣਾ ਹੈ:

ਜਦੋਂ user TextField ਵਿੱਚ ਕੁਝ ਲਿਖਦਾ ਹੈ, ਤਾਂ text ਆਪਣੇ ਆਪ update ਹੋ ਜਾਂਦਾ ਹੈ; ਅਤੇ ਜਦੋਂ text ਬਦਲਦਾ ਹੈ, ਤਾਂ TextField ਵੀ synchronized ਢੰਗ ਨਾਲ update ਹੁੰਦਾ ਹੈ।

ਉਦਾਹਰਨ ਵਜੋਂ:

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

TextField ਵਿੱਚ content ਦਾਖਲ ਕਰਨ 'ਤੇ, ਉੱਪਰ ਵਾਲਾ Text ਵੀ real-time ਵਿੱਚ synchronized display ਕਰੇਗਾ।

![textField](../../RESOURCE/014_textfield1.png)

### Number type ਨੂੰ bind ਕਰਨਾ

ਜਦੋਂ number input ਕਰਨੀ ਹੋਵੇ, ਤਾਂ ਉਸ ਨਾਲ ਜੁੜੀ ਹੋਈ type ਵਾਲੇ variable ਨੂੰ bind ਕਰਨਾ ਪੈਂਦਾ ਹੈ:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

ਜਦੋਂ user amount ਦਾਖਲ ਕਰਦਾ ਹੈ, TextField input content ਨੂੰ parse ਕਰਕੇ ਆਪਣੇ ਆਪ number ਦੀ value update ਕਰਦਾ ਹੈ।

## Input box ਜੋੜਨਾ

TextField ਦੀ ਬੁਨਿਆਦੀ ਵਰਤੋਂ ਸਮਝਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ ਇਸਨੂੰ “ਗੁੱਲਕ” project ਵਿੱਚ ਲਾਗੂ ਕਰਦੇ ਹਾਂ।

“ਗੁੱਲਕ” ਵਿੱਚ “ਰਕਮ” ਦਾਖਲ ਕਰਨੀ ਹੈ, ਇਸ ਲਈ ਅਸੀਂ “numeric type binding (Int/Double)” ਵਾਲਾ ਤਰੀਕਾ ਵਰਤਦੇ ਹਾਂ, ਅਤੇ user ਦੁਆਰਾ ਦਾਖਲ ਕੀਤੀ ਰਕਮ ਸੰਭਾਲਣ ਲਈ ਇੱਕ ਨਵਾਂ number variable ਜੋੜਦੇ ਹਾਂ:

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

ਹੁਣ, TextField default ਤੌਰ 'ਤੇ number ਦੀ value ਦਿਖਾਉਂਦਾ ਹੈ (default 0 ਹੈ)।

ਜਦੋਂ input content ਨੂੰ clear ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ placeholder “Amount” ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।

ਇਸ ਨਾਲ ਇਹ ਗੱਲ ਇੱਕ ਵਾਰ ਫਿਰ ਸਪੱਸ਼ਟ ਹੁੰਦੀ ਹੈ ਕਿ TextField bound variable ਦੀ value ਦਿਖਾਂਦਾ ਹੈ, ਨਾ ਕਿ ਆਪਣੇ ਆਪ content save ਕਰਦਾ ਹੈ।

### Input box size ਦੀ ਸਮੱਸਿਆ

ਮੌਜੂਦਾ view ਵਿੱਚ, ਅਸੀਂ ਵੇਖਾਂਗੇ ਕਿ TextField ਵਿੱਚ ਕੋਈ border ਨਹੀਂ ਹੈ, ਸਿਰਫ ਇੱਕ 0 ਦਿਖਦਾ ਹੈ, ਅਤੇ content left aligned ਲੱਗਦਾ ਹੈ।

ਅਸਰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਹੈ:

![textfield](../../RESOURCE/014_textfield2.png)

ਇਸਦਾ ਕਾਰਣ ਇਹ ਹੈ ਕਿ TextField default ਤੌਰ 'ਤੇ parent view ਦੀ ਪੂਰੀ width ਲੈ ਲੈਂਦਾ ਹੈ।

ਅਸੀਂ ਇਸਨੂੰ background color ਜੋੜ ਕੇ verify ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

ਅਸਰ ਹੇਠਾਂ ਦਿੱਤੇ ਤਰ੍ਹਾਂ ਹੈ:

![textfield](../../RESOURCE/014_textfield3.png)

ਇਸ ਨਾਲ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ TextField ਅਸਲ ਵਿੱਚ ਪੂਰੀ line ਦੀ width ਭਰ ਰਿਹਾ ਹੈ।

### Fixed width set ਕਰਨਾ

ਜੇ ਅਸੀਂ input box ਨੂੰ ਹੋਰ compact ਬਣਾਉਣਾ ਚਾਹੀਏ, ਤਾਂ frame ਨਾਲ ਇਸਦੀ width limit ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

ਅਸਰ ਹੇਠਾਂ ਦਿੱਤੇ ਤਰ੍ਹਾਂ ਹੈ:

![textfield](../../RESOURCE/014_textfield4.png)

### Border ਅਤੇ padding ਜੋੜਨਾ

ਕਿਉਂਕਿ TextField ਵਿੱਚ default ਰੂਪ ਵਿੱਚ border ਨਹੀਂ ਹੁੰਦਾ, ਇਸ ਲਈ ਅਸੀਂ style ਹੱਥੋਂ ਜੋੜ ਸਕਦੇ ਹਾਂ:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ਹੁਣ ਇਹ input box ਇੱਕ “standard input box” ਵਾਂਗ ਹੋਰ ਜ਼ਿਆਦਾ ਲੱਗਦਾ ਹੈ।

![textfield](../../RESOURCE/014_textfield5.png)

## Border

SwiftUI ਵਿੱਚ, border view ਦੇ ਚਾਰਾਂ ਪਾਸਿਆਂ border ਜੋੜਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਮੂਲ ਵਰਤੋਂ:

```swift
border(Color.black, width: 1)
```

ਇੱਥੇ Color.black border ਦਾ ਰੰਗ ਦਰਸਾਉਂਦਾ ਹੈ, ਅਤੇ width border ਦੀ ਮੋਟਾਈ।

TextField ਵਿੱਚ, ਅਸੀਂ ਇਹ ਵਰਤਦੇ ਹਾਂ:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ input box ਲਈ ਇੱਕ ਕਾਲਾ border ਜੋੜਿਆ ਜਾ ਰਿਹਾ ਹੈ, ਜਿਸਦੀ ਚੌੜਾਈ 1 pt ਹੈ।

ਤੁਸੀਂ ਹੋਰ colors ਵੀ ਅਜ਼ਮਾ ਸਕਦੇ ਹੋ, ਜਿਵੇਂ Color.blue, Color.green, ਜਾਂ border ਨੂੰ ਹੋਰ ਮੋਟਾ ਕਰਨ ਲਈ width: 2।

## Save button

ਹੁਣ ਸਾਡੇ ਕੋਲ total amount ਦਿਖਾਉਣ ਲਈ amount variable ਹੈ, input ਲਈ ਇੱਕ TextField ਹੈ, ਅਤੇ input box ਨਾਲ bound number variable ਹੈ।

ਮੌਜੂਦਾ code ਹੇਠਾਂ ਦਿੱਤਾ ਗਿਆ ਹੈ:

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

### Button ਜੋੜਨਾ

ਹੁਣ, ਸਾਨੂੰ save operation trigger ਕਰਨ ਲਈ ਇੱਕ button ਜੋੜਨ ਦੀ ਲੋੜ ਹੈ।

```swift
Button("Save") {
    
}
```

### Save logic ਲਾਗੂ ਕਰਨਾ

ਅਸੀਂ ਇਹ functionality ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ user ਰਕਮ ਦਾਖਲ ਕਰੇ, button 'ਤੇ click ਕਰੇ, ਅਤੇ ਉਹ ਰਕਮ ਆਪਣੇ ਆਪ total amount ਵਿੱਚ ਜੁੜ ਜਾਵੇ।

```swift
Button("Save") {
    amount += number
}
```

ਇੱਥੇ “compound assignment operator” ਵਰਤਿਆ ਗਿਆ ਹੈ, ਜੋ user ਦੁਆਰਾ ਦਾਖਲ ਕੀਤੀ amount number ਨੂੰ total amount ਵਿੱਚ ਜੋੜਦਾ ਹੈ।

### Input amount reset ਕਰਨਾ

ਹੁਣ ਇੱਕ ਸਮੱਸਿਆ ਹੈ: ਹਰ ਵਾਰ button click ਕਰਨ ਤੋਂ ਬਾਅਦ input box ਵਿੱਚੋਂ amount clear ਨਹੀਂ ਹੁੰਦੀ।

ਜਦੋਂ user 10 ਦਾਖਲ ਕਰਕੇ save ਕਰਦਾ ਹੈ, ਤਾਂ input box ਵਿੱਚ 10 ਫਿਰ ਵੀ ਰਹਿੰਦਾ ਹੈ, ਜੋ ਅਗਲੀ ਵਾਰ ਦੀ saving ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਕਰ ਸਕਦਾ ਹੈ।

ਇਸਦਾ ਕਾਰਣ ਇਹ ਹੈ ਕਿ TextField number ਨਾਲ bound ਹੈ। ਜਦੋਂ ਅਸੀਂ button click ਕਰਦੇ ਹਾਂ, ਅਸੀਂ ਸਿਰਫ amount ਨੂੰ ਬਦਲਦੇ ਹਾਂ; number ਨਹੀਂ ਬਦਲਦਾ, ਇਸ ਲਈ input box ਪੁਰਾਣੀ value ਦਿਖਾਉਂਦਾ ਰਹਿੰਦਾ ਹੈ।

ਸਾਨੂੰ ਇੱਕ clear logic ਜੋੜਨੀ ਪਵੇਗੀ, ਤਾਂ ਜੋ button click ਹੋਣ 'ਤੇ ਪਹਿਲਾਂ saving amount total ਵਿੱਚ ਜੋੜੀ ਜਾਵੇ, ਅਤੇ ਫਿਰ input amount reset ਕਰ ਦਿੱਤੀ ਜਾਵੇ:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

ਹੁਣ, ਜਦੋਂ user amount ਦਾਖਲ ਕਰਕੇ button 'ਤੇ click ਕਰਦਾ ਹੈ, input amount total amount ਵਿੱਚ ਜੁੜ ਜਾਵੇਗੀ। ਫਿਰ number ਨੂੰ 0 ਕਰ ਦਿੱਤਾ ਜਾਵੇਗਾ, ਤਾਂ ਜੋ user ਅਗਲੀ ਵਾਰ ਨਵੀਂ amount ਦਾਖਲ ਕਰ ਸਕੇ।

ਇਸ ਤਰ੍ਹਾਂ ਅਸੀਂ “ਗੁੱਲਕ” ਦੀ ਪੂਰੀ save logic ਤਿਆਰ ਕਰ ਲਈ ਹੈ।

## View ਨੂੰ optimize ਕਰਨਾ

Functionality ਪੂਰੀ ਹੋਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ interface ਨੂੰ ਸਧਾਰਣ ਤਰੀਕੇ ਨਾਲ optimize ਕਰ ਸਕਦੇ ਹਾਂ, ਜਿਵੇਂ background image ਅਤੇ button style ਜੋੜ ਕੇ।

Button style ਜੋੜਨਾ:

```swift
.buttonStyle(.borderedProminent)
```

Background image ਜੋੜਨਾ:

```swift
.background {
    Image("1")
}
```

ਹੁਣ, ਅਸੀਂ ਪੂਰਾ “ਗੁੱਲਕ” development ਕੰਮ ਮੁਕੰਮਲ ਕਰ ਲਿਆ ਹੈ।

## ਪੂਰਾ ਕੋਡ

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

ਅਸਰ:

![Piggy Bank](../../RESOURCE/014_view.png)

ਹੁਣ, ਅਸੀਂ 100 ਜਾਂ ਇਸ ਤੋਂ ਵੀ ਵੱਧ ਰਕਮ save ਕਰਕੇ ਦੇਖ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ “ਗੁੱਲਕ” ਦੀ logic ਵਿੱਚ ਕੋਈ ਸਮੱਸਿਆ ਤਾਂ ਨਹੀਂ, ਇਹ verify ਕੀਤਾ ਜਾ ਸਕੇ।

ਜਾਂ ਫਿਰ “ਗੁੱਲਕ” ਨੂੰ simulator ਜਾਂ physical device 'ਤੇ ਚਲਾ ਕੇ, ਆਪਣੇ ਬਣਾਏ ਹੋਏ “ਗੁੱਲਕ” app ਦਾ ਤਜ਼ਰਬਾ ਲਿਆ ਜਾ ਸਕਦਾ ਹੈ।

### Debug output

Logic ਦੇ ਸਹੀ ਹੋਣ ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ, ਅਸੀਂ button ਵਿੱਚ debugging logic ਵੀ ਜੋੜ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ verify ਕੀਤਾ ਜਾ ਸਕੇ ਕਿ input amount ਸਹੀ ਹੈ ਜਾਂ ਨਹੀਂ:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ਹਰ ਵਾਰ ਜਦੋਂ amount save ਕਰਕੇ button 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਅਸੀਂ ਸੰਬੰਧਿਤ debug output ਵੇਖ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ code logic ਵਿੱਚ ਕੋਈ ਸਮੱਸਿਆ ਹੈ ਜਾਂ ਨਹੀਂ, ਇਹ ਜਾਂਚਿਆ ਜਾ ਸਕੇ।

```id="b2ex6e"
---Saving---
amount:11
number:0
```
