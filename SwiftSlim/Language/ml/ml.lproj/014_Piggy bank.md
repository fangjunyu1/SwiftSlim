# പിഗ്ഗി ബാങ്ക്

ഈ പാഠത്തിൽ നാം ഒരു ലളിതമായ “piggy bank” project വികസിപ്പിക്കും. Functionality ലളിതമാണ്, പക്ഷേ സമ്പൂർണ്ണ interaction logic ഇതിൽ ഉൾപ്പെടുന്നു. അതിനാൽ തുടങ്ങുന്നവർക്ക് ഇത് വളരെ അനുയോജ്യം.

ഈ project വഴി `TextField` (input box), `border`, കൂടാതെ data binding (`$`) എന്നിവ പഠിക്കും.

അവസാന ലക്ഷ്യം: ഒരു amount input ചെയ്ത്, button click ചെയ്ത് save ചെയ്യുകയും total amount-ലേക്ക് add ചെയ്യുകയും ചെയ്യുന്ന “piggy bank” project സൃഷ്ടിക്കുക.

ഫലം:

![Piggy Bank](../../RESOURCE/014_view.png)

## ആകെ amount കാണിക്കുക

ആദ്യം view-ൽ “piggy bank”-ന്റെ total amount കാണിക്കണം.

`ContentView`-ൽ “piggy bank”-ന്റെ total amount save ചെയ്യാൻ ഒരു variable declare ചെയ്യുക.

```swift
@State private var amount = 0
```

ശേഷം `Text` ഉപയോഗിച്ച് ഈ amount കാണിക്കുക:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

ഇവിടെ `.font`, `.fontWeight` ഉപയോഗിച്ച് font size ഉം thickness ഉം set ചെയ്യുന്നു.

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

`amount` മാറുമ്പോൾ `Text` കാണിക്കുന്ന total amount-ും സ്വയം refresh ചെയ്യും.

## Amount input ചെയ്യുക

“Piggy bank” total amount കാണിക്കുന്നതിനു പുറമെ, user-ന് deposit അല്ലെങ്കിൽ withdrawal amount input ചെയ്യാനും കഴിയണം. അതിനായി SwiftUI-യിലെ `TextField` view control വേണം.

### `TextField`

`TextField` SwiftUI-ൽ content input ചെയ്യാനുള്ള view control ആണ്; സാധാരണയായി single-line input-നാണ് ഇത് ഉപയോഗിക്കുന്നത്.

`TextField` പ്രധാനമായും രണ്ട് binding formats നൽകുന്നു:

**1. String type bind ചെയ്യുക**

```swift
TextField("Placeholder", text: $text)
```

ഇത് പേര്, title പോലുള്ള text input-ുകൾക്കായി അനുയോജ്യം.

**2. Numeric type bind ചെയ്യുക (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

ഇത് age, salary, amount പോലുള്ള numeric input-ുകൾക്കായി ഉപയോഗിക്കുന്നു.

`format: .number` എന്നത് input box “number format” അനുസരിച്ച് input parse ചെയ്യുകയും display ചെയ്യുകയും ചെയ്യുമെന്ന് അർത്ഥമാക്കുന്നു.

#### Text placeholder

`TextField`-ന്റെ ആദ്യ parameter placeholder ആണ്, user എന്ത് input ചെയ്യണമെന്ന് സൂചിപ്പിക്കാൻ:

```swift
TextField("input your name", text: $text)
```

Input box കാലിയായാൽ gray നിറത്തിലുള്ള hint text കാണിക്കും.

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

`TextField` input content persistent ആയി save ചെയ്യുന്നില്ല; data manage ചെയ്യാൻ bind ചെയ്ത variable ആവശ്യമാണ്.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

User input ചെയ്യുന്ന content നേരിട്ട് `text` variable-ലേക്ക് save ചെയ്യും; `TextField` input UI-യ്ക്ക് മാത്രമാണ് ഉത്തരവാദി.

`$` binding (`Binding`) സൂചിപ്പിക്കുന്നു:

```swift
$text
```

ഇത് സാധാരണ variable അല്ല; ഒരു `Binding` type ആണ്.

ഇതിന്റെ ജോലി view-നും data-ക്കും ഇടയിൽ connection സ്ഥാപിക്കുകയാണ്:

User `TextField`-ൽ content input ചെയ്യുമ്പോൾ `text` സ്വയം update ചെയ്യും; `text` മാറുമ്പോൾ `TextField`-വും sync ആയി update ചെയ്യും.

ഉദാഹരണത്തിന്:

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

`TextField`-ൽ content input ചെയ്താൽ മുകളിൽ ഉള്ള `Text` real-time ആയി അതേ content കാണിക്കും.

![textField](../../RESOURCE/014_textfield1.png)

### Numeric type bind ചെയ്യുക

Number input ചെയ്യേണ്ടപ്പോൾ അനുയോജ്യമായ type variable bind ചെയ്യണം:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

User amount input ചെയ്യുമ്പോൾ `TextField` input content parse ചെയ്ത് `number` value സ്വയം update ചെയ്യും.

## Input box ചേർക്കുക

ഇപ്പോൾ `TextField`-ന്റെ അടിസ്ഥാന ഉപയോഗം മനസ്സിലാക്കിയതിനാൽ, അത് “piggy bank” project-ിൽ ഉപയോഗിക്കാം.

“Piggy bank” project-ൽ input ചെയ്യേണ്ടത് “amount” ആണെന്നതിനാൽ, “numeric type bind ചെയ്യൽ (`Int/Double`)" രീതി ഉപയോഗിക്കുന്നു. കൂടാതെ user input ചെയ്യുന്ന amount save ചെയ്യാൻ ഒരു `number` variable കൂടി ചേർക്കാം:

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

ഇപ്പോൾ `TextField` default ആയി `number`-ന്റെ value (`0`) കാണിക്കും.

Input content clear ചെയ്താൽ placeholder `"Amount"` കാണിക്കും.

ഇതിലൂടെ `TextField` bind ചെയ്ത variable-ന്റെ value ആണ് കാണിക്കുന്നതെന്നും, താനെത്തന്നെ content save ചെയ്യുന്നില്ലെന്നും വീണ്ടും വ്യക്തമാകും.

### Input box size പ്രശ്നം

ഇപ്പോഴുള്ള view-ൽ `TextField`-ന് border ഇല്ല, `0` മാത്രം കാണിക്കുന്നു, content left aligned പോലെ തോന്നുന്നു.

ഫലം:

![textfield](../../RESOURCE/014_textfield2.png)

ഇതിന് കാരണം `TextField` default ആയി parent view-യുടെ മുഴുവൻ width കൈക്കൊള്ളുന്നു.

ഇത് പരിശോധിക്കാൻ background color ചേർക്കാം:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

ഫലം:

![textfield](../../RESOURCE/014_textfield3.png)

ഇപ്പോൾ `TextField` യഥാർത്ഥത്തിൽ മുഴുവൻ row width-ും fill ചെയ്യുന്നുവെന്ന് കാണാം.

### Fixed width set ചെയ്യുക

Input box കൂടുതൽ compact ആക്കണമെന്ന് ആഗ്രഹിക്കുന്നുവെങ്കിൽ `frame` ഉപയോഗിച്ച് width നിയന്ത്രിക്കാം:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

ഫലം:

![textfield](../../RESOURCE/014_textfield4.png)

### Border, padding ചേർക്കുക

`TextField` default ആയി border ഇല്ലാത്തതിനാൽ style manual ആയി ചേർക്കാം:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ഇപ്പോൾ ഈ input box ഒരു “standard input box” പോലെയാകും തോന്നുക.

![textfield](../../RESOURCE/014_textfield5.png)

## Border

SwiftUI-ൽ `border` ഒരു view-ന് border ചേർക്കാൻ ഉപയോഗിക്കുന്നു.

അടിസ്ഥാന ഉപയോഗം:

```swift
border(Color.black, width: 1)
```

ഇവിടെ `Color.black` border-ന്റെ color ആണ്; `width` border-ന്റെ thickness ആണ്.

`TextField`-ൽ നാം ഉപയോഗിക്കുന്നത്:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

അത് input box-ന് black നിറമുള്ള, `1 pt` width ഉള്ള border ചേർക്കുന്നു എന്നർത്ഥം.

മറ്റ് colors ആയ `Color.blue`, `Color.green` എന്നിവയും ശ്രമിക്കാം; അല്ലെങ്കിൽ border `width: 2` ആയി കൂടി കട്ടിയാക്കാം.

## Save button

ഇപ്പോൾ നമുക്ക് total amount കാണിക്കുന്ന `amount` variable ഉം, amount input ചെയ്യാനുള്ള `TextField` ഉം, input box-നോട് bind ചെയ്ത `number` variable ഉം ഉണ്ട്.

ഇപ്പോഴത്തെ code:

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

### Button ചേർക്കുക

ഇപ്പോൾ save action trigger ചെയ്യാൻ ഒരു button ചേർക്കണം.

```swift
Button("Save") {
    
}
```

### Save logic നടപ്പാക്കുക

User amount input ചെയ്ത് button click ചെയ്താൽ അത് total amount-ലേക്ക് add ചെയ്യപ്പെടണം.


```swift
Button("Save") {
    amount += number
}
```

ഇവിടെ “compound assignment operator” ഉപയോഗിച്ച് user input ചെയ്ത `number`, total amount ആയ `amount`-ലേക്ക് ചേർക്കുന്നു.

### Input amount reset ചെയ്യുക

ഇപ്പോൾ ഒരു പ്രശ്നമുണ്ട്: button ഓരോ തവണ click ചെയ്താലും input box-ിലുള്ള amount clear ആവുന്നില്ല.

User `10` input ചെയ്ത് save click ചെയ്താൽ, input box-ൽ ഇപ്പോഴും `10` തന്നെയായിരിക്കും. അതിനാൽ അടുത്ത input-നെ അത് ബാധിക്കും.

ഇതിന് കാരണം `TextField` bind ചെയ്തിരിക്കുന്നത് `number`-നോടാണ്. Button click ചെയ്യുമ്പോൾ നാം `amount` മാത്രം മാറ്റുന്നു; `number` മാറുന്നില്ല. അതിനാൽ പഴയ value തന്നെ input box-ൽ കാണിക്കും.

അതുകൊണ്ട് ഒരു clear logic ചേർക്കണം: button click ചെയ്താൽ ആദ്യം amount total-ലേക്ക് add ചെയ്യുകയും, പിന്നാലെ input ചെയ്ത amount reset ചെയ്യുകയും വേണം:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

ഇപ്പോൾ user amount input ചെയ്ത് button click ചെയ്താൽ, amount total-ലേക്ക് കൂട്ടിച്ചേർക്കും. `number` `0` ആയി reset ചെയ്യും; അതിനാൽ അടുത്ത input-ിന് തയ്യാറാകും.

ഇതോടെ “piggy bank”-ന്റെ എല്ലാ saving logic-ഉം നടപ്പായി.

## View optimize ചെയ്യുക

Functionality പൂർത്തിയായ ശേഷം interface കുറച്ച് optimize ചെയ്യാം: background image, button style എന്നിവ ചേർക്കാം.

Button style ചേർക്കുക:

```swift
.buttonStyle(.borderedProminent)
```

Background image ചേർക്കുക:

```swift
.background {
    Image("1")
}
```

ഇപ്പോൾ “piggy bank” development പൂർണ്ണമായി പൂർത്തിയാക്കി.

## പൂർണ്ണ കോഡ്

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

ഫലം:

![Piggy Bank](../../RESOURCE/014_view.png)

ഇപ്പോൾ `100` അല്ലെങ്കിൽ അതിലും കൂടുതൽ പണം save ചെയ്ത് “piggy bank” logic-ൽ പ്രശ്നമുണ്ടോ എന്ന് പരിശോധിക്കാം.

അല്ലെങ്കിൽ “piggy bank” simulator അല്ലെങ്കിൽ physical device-ൽ run ചെയ്തു നമ്മുടെ app അനുഭവിച്ചു നോക്കാം.

### Debug output

Logic ശരിയാണോ പരിശോധിക്കാൻ, button-നുള്ളിൽ debug logic കൂടി ചേർത്ത് input amount ശരിയാണോ എന്ന് പരിശോധിക്കാം:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ഓരോ save-ഉം button click-ഉം കഴിഞ്ഞ് അതിനനുസരിച്ചുള്ള debug output കാണാം; അതുവഴി code logic-ൽ പ്രശ്നമുണ്ടോ എന്ന് പരിശോധിക്കാം.

```
---Saving---
amount:11
number:0
```
