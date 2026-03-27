# ಹುಂಡಿ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಸರಳವಾದ "ಹುಂಡಿ" ಪ್ರಾಜೆಕ್ಟ್ ಒಂದನ್ನು ನಿರ್ಮಿಸುತ್ತೇವೆ. ಇದರ ವೈಶಿಷ್ಟ್ಯಗಳು ಸರಳವಾಗಿದ್ದು, ಪೂರ್ಣ ಸಂವಹನ logic ಒಳಗೊಂಡಿರುವುದರಿಂದ, ಆರಂಭಿಕರಿಗೆ ಇದು ತುಂಬಾ ಸೂಕ್ತ.

ಈ ಪ್ರಾಜೆಕ್ಟ್ ಮೂಲಕ, ನಾವು `TextField` (input field) ಮತ್ತು `border` ಕುರಿತು ಕಲಿಯುತ್ತೇವೆ, ಜೊತೆಗೆ data binding (`$`) ನ್ನೂ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೇವೆ.

ಕೊನೆಯ ಗುರಿ ಏನೆಂದರೆ, ಮೊತ್ತವನ್ನು ನಮೂದಿಸಿ, button ಒತ್ತಿ, ಆ ಮೊತ್ತವನ್ನು save ಮಾಡಿ total amount ಗೆ ಸೇರಿಸುವ "ಹುಂಡಿ" project ನಿರ್ಮಿಸುವುದು.

ಅಂತಿಮ ಪರಿಣಾಮ:

![Piggy Bank](../../RESOURCE/014_view.png)

## ಒಟ್ಟು ಮೊತ್ತವನ್ನು ತೋರಿಸುವುದು

ಮೊದಲು, view ನಲ್ಲಿ "ಹುಂಡಿ" ಯ ಒಟ್ಟು amount ಅನ್ನು ತೋರಿಸಬೇಕು.

`ContentView` ನಲ್ಲಿ, "ಹುಂಡಿ" ಯ total amount ಅನ್ನು ಉಳಿಸಲು ಒಂದು variable ಘೋಷಿಸೋಣ.

```swift
@State private var amount = 0
```

ನಂತರ, `Text` ಬಳಸಿ ಈ amount ಅನ್ನು ತೋರಿಸಬಹುದು:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

ಇಲ್ಲಿ `.font` ಮತ್ತು `.fontWeight` ಬಳಸಿ font size ಮತ್ತು weight ಅನ್ನು ಹೊಂದಿಸಲಾಗಿದೆ.

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

`amount` ಬದಲಾಗುವಾಗ, `Text` ತೋರಿಸುವ total amount ಕೂಡ ಸ್ವಯಂ refresh ಆಗುತ್ತದೆ.

## ಮೊತ್ತವನ್ನು ನಮೂದಿಸುವುದು

"ಹುಂಡಿ" ಯಲ್ಲಿ total amount ತೋರಿಸುವುದರ ಜೊತೆಗೆ, ಬಳಕೆದಾರರು ಹಣವನ್ನು "ನಮೂದಿಸಲು" ಸಹ ಸಾಧ್ಯವಾಗಬೇಕು. ಇದಕ್ಕಾಗಿ SwiftUI ಯ `TextField` view control ಅನ್ನು ಬಳಸಬೇಕು.

### TextField

`TextField` ಎಂದರೆ SwiftUI ಯಲ್ಲಿ input ಗಾಗಿ ಬಳಸುವ view control ಆಗಿದ್ದು, ಸಾಮಾನ್ಯವಾಗಿ single-line input ಗಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ.

`TextField` ಮುಖ್ಯವಾಗಿ ಎರಡು binding formats ಒದಗಿಸುತ್ತದೆ:

**1. ಸ್ಟ್ರಿಂಗ್ ಪ್ರಕಾರದ binding (`String`)**

```swift
TextField("Placeholder", text: $text)
```

ಹೆಸರು, ಶೀರ್ಷಿಕೆ ಮುಂತಾದ text input ಗಳಿಗೆ ಇದು ಸೂಕ್ತ.

**2. ಸಂಖ್ಯಾ ಪ್ರಕಾರದ binding (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

ವಯಸ್ಸು, ಸಂಬಳ, ಹಣ ಮುಂತಾದ ಸಂಖ್ಯಾತ್ಮಕ input ಗಳಿಗೆ ಇದು ಸೂಕ್ತ.

`format: .number` ಅಂದರೆ, ಈ input field content ಅನ್ನು "number format" ಆಧರಿಸಿ parse ಮತ್ತು display ಮಾಡುತ್ತದೆ.

#### ಪಠ್ಯ placeholder

`TextField` ನ ಮೊದಲ parameter placeholder ಆಗಿದ್ದು, ಬಳಕೆದಾರರಿಗೆ ಏನು ನಮೂದಿಸಬೇಕು ಎಂದು ಸೂಚಿಸುತ್ತದೆ:

```swift
TextField("input your name", text: $text)
```

input field ಖಾಲಿಯಾಗಿರುವಾಗ, ಇದು ಒಂದು grey prompt text ತೋರಿಸುತ್ತದೆ.

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

`TextField` ಸ್ವತಃ input content ಅನ್ನು ಶಾಶ್ವತವಾಗಿ ಉಳಿಸುವುದಿಲ್ಲ; data ಅನ್ನು binding variable ಮೂಲಕ ನಿರ್ವಹಿಸಬೇಕು.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

ಬಳಕೆದಾರರ input ನೇರವಾಗಿ `text` variable ಗೆ ಉಳಿಯುತ್ತದೆ. `TextField` ಕೇವಲ input interface ಗೆ ಜವಾಬ್ದಾರಿಯಾಗಿದೆ.

`$` ಅಂದರೆ binding:

```swift
$text
```

ಇದು ಸಾಮಾನ್ಯ variable ಅಲ್ಲ, ಬದಲಿಗೆ `Binding` type.

ಇದರ ಕೆಲಸ view ಮತ್ತು data ನಡುವಿನ ಸಂಪರ್ಕವನ್ನು ನಿರ್ಮಿಸುವುದು:

ಬಳಕೆದಾರರು `TextField` ನಲ್ಲಿ type ಮಾಡಿದಾಗ `text` ಸ್ವಯಂ update ಆಗುತ್ತದೆ; `text` ಬದಲಾಗುವಾಗ `TextField` ಕೂಡ ಸಮಕಾಲೀನವಾಗಿ update ಆಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

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

`TextField` ನಲ್ಲಿ input ಕೊಟ್ಟಾಗ, ಮೇಲಿರುವ `Text` ಅದನ್ನು real-time ನಲ್ಲಿ ತೋರಿಸುತ್ತದೆ.

![textField](../../RESOURCE/014_textfield1.png)

### ಸಂಖ್ಯಾ ಪ್ರಕಾರವನ್ನು bind ಮಾಡುವುದು

ಸಂಖ್ಯೆಗಳನ್ನು ನಮೂದಿಸಬೇಕಾದರೆ, ಅದಕ್ಕೆ ಸಂಬಂಧಿಸಿದ type ನ variable ಗೆ bind ಮಾಡಬೇಕು:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

ಬಳಕೆದಾರರು amount ನಮೂದಿಸಿದಾಗ, `TextField` input content ಅನ್ನು parse ಮಾಡಿ `number` value ಯನ್ನು ಸ್ವಯಂ update ಮಾಡುತ್ತದೆ.

## input field ಸೇರಿಸುವುದು

`TextField` ನ ಮೂಲ ಬಳಕೆಯನ್ನು ತಿಳಿದ ನಂತರ, ಅದನ್ನು "ಹುಂಡಿ" project ನಲ್ಲಿ ಬಳಸೋಣ.

"ಹುಂಡಿ" ಯಲ್ಲಿ "amount" ಅನ್ನು input ಮಾಡಬೇಕಿದೆ, ಆದ್ದರಿಂದ ನಾವು "numeric type binding (`Int/Double`)" ವಿಧಾನವನ್ನು ಬಳಸುತ್ತೇವೆ. ಹಾಗೇ ಬಳಕೆದಾರರು ನಮೂದಿಸುವ ಹಣವನ್ನು ಉಳಿಸಲು `number` variable ಒಂದನ್ನೂ ಸೇರಿಸುತ್ತೇವೆ:

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

ಈಗ `TextField` default ಆಗಿ `number` value ಯನ್ನು ತೋರಿಸುತ್ತದೆ (default 0).

input content ಅನ್ನು clear ಮಾಡಿದಾಗ, placeholder `"Amount"` ತೋರುತ್ತದೆ.

ಇದರಿಂದ ಮತ್ತೆ ಒಂದು ವಿಷಯ ಸ್ಪಷ್ಟ: `TextField` ತೋರಿಸುವುದು bound variable ನ value; ಅದು content ಅನ್ನು ಸ್ವತಃ ಉಳಿಸಿಕೊಳ್ಳುವುದಿಲ್ಲ.

### input field ಗಾತ್ರದ ಸಮಸ್ಯೆ

ಈ view ನಲ್ಲಿ ನೋಡಿದರೆ, `TextField` ಗೆ border ಇಲ್ಲ; ಅದು ಕೇವಲ ಒಂದು `0` ತೋರಿಸುತ್ತದೆ ಮತ್ತು content left-aligned ಆಗಿರುತ್ತದೆ.

ಪರಿಣಾಮ ಹೀಗಿದೆ:

![textfield](../../RESOURCE/014_textfield2.png)

ಇದಕ್ಕೆ ಕಾರಣ, `TextField` default ಆಗಿ parent view ಯ ಸಂಪೂರ್ಣ ಅಗಲವನ್ನು ಹಿಡಿದುಕೊಳ್ಳುತ್ತದೆ.

ಇದನ್ನು background color ಸೇರಿಸಿ ಪರಿಶೀಲಿಸಬಹುದು:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

ಪರಿಣಾಮ ಹೀಗಿದೆ:

![textfield](../../RESOURCE/014_textfield3.png)

ಇದರಿಂದ `TextField` ನಿಜವಾಗಿ ಸಂಪೂರ್ಣ ಸಾಲಿನ ಅಗಲವನ್ನು ತುಂಬುತ್ತದೆ ಎಂಬುದು ಗೊತ್ತಾಗುತ್ತದೆ.

### ನಿಶ್ಚಿತ ಅಗಲವನ್ನು ಹೊಂದಿಸುವುದು

input field ಇನ್ನಷ್ಟು compact ಆಗಿರಲಿ ಎಂದರೆ, `frame` ಬಳಸಿ ಅದರ width ಅನ್ನು ಮಿತಿಗೊಳಿಸಬಹುದು:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

ಪರಿಣಾಮ ಹೀಗಿದೆ:

![textfield](../../RESOURCE/014_textfield4.png)

### border ಮತ್ತು ಒಳ padding ಸೇರಿಸುವುದು

`TextField` ಗೆ default ಆಗಿ border ಇರದ ಕಾರಣ, ನಾವು style ಅನ್ನು ಕೈಯಾರೆ ಸೇರಿಸಬಹುದು:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ಈಗ ಈ input field ಒಂದು "standard input field" ಹಾಗೆ ಕಾಣುತ್ತದೆ.

![textfield](../../RESOURCE/014_textfield5.png)

## border

SwiftUI ನಲ್ಲಿ `border` ಅನ್ನು ಒಂದು view ಗೆ border ಸೇರಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

ಮೂಲ ಬಳಕೆ:

```swift
border(Color.black, width: 1)
```

ಇಲ್ಲಿ `Color.black` border ನ ಬಣ್ಣ, `width` border ನ ದಪ್ಪವನ್ನು ಸೂಚಿಸುತ್ತದೆ.

`TextField` ನಲ್ಲಿ, ನಾವು ಹೀಗೆ ಬಳಸುತ್ತೇವೆ:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ಇದು input field ಗೆ ಕಪ್ಪು ಬಣ್ಣದ, 1 pt ಅಗಲದ border ಸೇರಿಸುತ್ತದೆ.

ಇಚ್ಛಿಸಿದರೆ ಬೇರೆ ಬಣ್ಣಗಳಾದ `Color.blue`, `Color.green` ಮುಂತಾದವುಗಳನ್ನೂ ಪ್ರಯೋಗಿಸಬಹುದು, ಅಥವಾ `width: 2` ಎಂದು border ದಪ್ಪವನ್ನೂ ಹೆಚ್ಚಿಸಬಹುದು.

## ಹಣ ಉಳಿಸುವ button

ಈಗ ನಮ್ಮ ಬಳಿ total amount ತೋರಿಸಲು `amount` variable ಇದೆ, ಹಣ ನಮೂದಿಸಲು `TextField` ಇದೆ, ಮತ್ತು input field ಗೆ bind ಆಗಿರುವ `number` variable ಕೂಡ ಇದೆ.

ಪ್ರಸ್ತುತ ಕೋಡ್ ಹೀಗಿದೆ:

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

### button ಸೇರಿಸುವುದು

ಈಗ, ಹಣ ಉಳಿಸುವ action ಅನ್ನು trigger ಮಾಡಲು ಒಂದು button ಸೇರಿಸಬೇಕು.

```swift
Button("Save") {
    
}
```

### ಹಣ ಉಳಿಸುವ logic ಕಾರ್ಯಗತಗೊಳಿಸುವುದು

ಬಳಕೆದಾರರು amount ನಮೂದಿಸಿ, button ಒತ್ತಿದಾಗ, ಆ amount ಸ್ವಯಂ total amount ಗೆ ಸೇರಬೇಕು ಎಂದು ನಾವು ಬಯಸುತ್ತೇವೆ.


```swift
Button("Save") {
    amount += number
}
```

ಇಲ್ಲಿ compound assignment operator ಬಳಸಿ, ಬಳಕೆದಾರರ input amount `number` ಅನ್ನು total amount `amount` ಗೆ ಸೇರಿಸಲಾಗುತ್ತಿದೆ.

### input amount ಅನ್ನು reset ಮಾಡುವುದು

ಈಗ ಒಂದು ಸಮಸ್ಯೆ ಇದೆ: ಪ್ರತಿ ಬಾರಿ button ಒತ್ತಿದರೂ, input field ನಲ್ಲಿರುವ amount clear ಆಗುವುದಿಲ್ಲ.

ಬಳಕೆದಾರರು 10 ನಮೂದಿಸಿ save ಒತ್ತಿದ ನಂತರವೂ, input field ನಲ್ಲಿ 10 ಉಳಿದೇ ಇರುತ್ತದೆ. ಇದು ಮುಂದಿನ ಹಣ ನಮೂದಿಸುವಿಕೆಯನ್ನು ತೊಂದರೆಗೊಳಿಸುತ್ತದೆ.

ಇದಕ್ಕೆ ಕಾರಣ `TextField` `number` ಗೆ bind ಆಗಿದೆ. button ಒತ್ತಿದಾಗ ನಾವು ಕೇವಲ `amount` ಅನ್ನು ಬದಲಾಯಿಸಿದ್ದೇವೆ, `number` ಬದಲಾಗಿಲ್ಲ; ಆದ್ದರಿಂದ input field ಇನ್ನೂ ಹಳೆಯ value ಯನ್ನೇ ತೋರಿಸುತ್ತದೆ.

ಹೀಗಾಗಿ clear logic ಸೇರಿಸಬೇಕು: button ಒತ್ತಿದ ನಂತರ ಮೊದಲು input amount ಅನ್ನು total ಗೆ ಸೇರಿಸಿ, ನಂತರ input amount ಅನ್ನು reset ಮಾಡಬೇಕು:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

ಈಗ ಬಳಕೆದಾರ amount ನಮೂದಿಸಿ button ಒತ್ತಿದಾಗ, amount total ಗೆ ಸೇರುತ್ತದೆ. `number` 0 ಗೆ reset ಆಗುತ್ತದೆ, ಹೀಗಾಗಿ ಮುಂದಿನ input ಗೆ ಸಿದ್ಧವಾಗುತ್ತದೆ.

ಈ ಮೂಲಕ "ಹುಂಡಿ" ಯ ಮೂಲ saving logic ಸಂಪೂರ್ಣವಾಗುತ್ತದೆ.

## view ಅನ್ನು optimize ಮಾಡುವುದು

functionality ಪೂರ್ಣವಾದ ನಂತರ, background image ಮತ್ತು button style ಸೇರಿಸಿ interface ಅನ್ನು ಸ್ವಲ್ಪ optimize ಮಾಡಬಹುದು.

button style ಸೇರಿಸುವುದು:

```swift
.buttonStyle(.borderedProminent)
```

background image ಸೇರಿಸುವುದು:

```swift
.background {
    Image("1")
}
```

ಈಗ ನಾವು ಸಂಪೂರ್ಣ "ಹುಂಡಿ" project ಅನ್ನು ನಿರ್ಮಿಸಿದ್ದೇವೆ.

## ಪೂರ್ಣ ಕೋಡ್

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

ಅಂತಿಮ ಪರಿಣಾಮ:

![Piggy Bank](../../RESOURCE/014_view.png)

ಈಗ ನಾವು 100 ಅಥವಾ ಅದಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ಹಣವನ್ನು ಉಳಿಸಿ, "ಹುಂಡಿ" ಯ logic ನಲ್ಲಿ ಸಮಸ್ಯೆಗಳಿವೆಯೇ ಎಂದು ಪರೀಕ್ಷಿಸಬಹುದು.

ಅಥವಾ "ಹುಂಡಿ" ಯನ್ನು simulator ಅಥವಾ physical device ನಲ್ಲಿ ನಡೆಸಿ, ನಾವು ನಿರ್ಮಿಸಿದ app ಅನ್ನು ಅನುಭವಿಸಬಹುದು.

### debug output

logic ಸರಿಯಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಲು, button ಒಳಗೆ debug logic ಕೂಡ ಸೇರಿಸಬಹುದು:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ಪ್ರತಿ ಬಾರಿ save button ಒತ್ತಿದಾಗ, ಸಂಬಂಧಿಸಿದ debug output ಅನ್ನು ನೋಡಿ code logic ಸರಿಯಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಬಹುದು.

```
---Saving---
amount:11
number:0
```
