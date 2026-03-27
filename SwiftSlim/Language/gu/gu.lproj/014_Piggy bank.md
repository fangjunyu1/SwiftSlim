# પિગી બેંક

આ પાઠમાં આપણે એક સરળ “પિગી બેંક” project બનાવશું. તેમાં logic સરળ છે, પણ interaction flow સંપૂર્ણ છે, તેથી શરૂઆત કરનાર માટે ખૂબ જ યોગ્ય છે.

આ project દ્વારા આપણે `TextField` (input box), `border` અને data binding (`$`) શીખીશું.

અંતિમ લક્ષ્ય એ છે કે user રકમ દાખલ કરી શકે, button દબાવી તેને save કરી શકે અને કુલ રકમમાં ઉમેરણી થાય એવો “પિગી બેંક” project બનાવવો.

પરિણામ:

![Piggy Bank](../../RESOURCE/014_view.png)

## કુલ રકમ બતાવવી

સૌ પ્રથમ, view માં “પિગી બેંક” ની કુલ રકમ બતાવવી છે.

`ContentView` માં કુલ રકમ save કરવા માટે variable જાહેર કરીએ:

```swift
@State private var amount = 0
```

પછી `Text` વડે આ રકમ બતાવો:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

અહીં `.font` અને `.fontWeight` font નું size અને weight ગોઠવે છે.

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

જ્યારે `amount` બદલાય છે, ત્યારે `Text` માં દેખાતી કુલ રકમ પણ આપમેળે refresh થાય છે.

## રકમ દાખલ કરવી

“પિગી બેંક” ફક્ત કુલ રકમ બતાવવા પૂરતું નથી; user ને જમા કરાવવાની અથવા કાઢવાની રકમ “દાખલ” પણ કરવી પડશે. તે માટે SwiftUI નું `TextField` view control વપરાય છે.

### `TextField`

`TextField` SwiftUI માં content દાખલ કરવા માટેનું view control છે, સામાન્ય રીતે single-line input માટે.

`TextField` મુખ્યત્વે બે binding formats આપે છે:

**1. String type સાથે binding**

```swift
TextField("Placeholder", text: $text)
```

આ name, title અથવા text જેવી input માટે યોગ્ય છે.

**2. Numeric type સાથે binding (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

આ age, salary, amount જેવી સંખ્યાત્મક input માટે યોગ્ય છે.

`format: .number` નો અર્થ એ છે કે input box content ને number format તરીકે parse અને display કરશે.

#### placeholder text

`TextField` નો પહેલો parameter placeholder છે, જે user ને શું દાખલ કરવું તે સૂચવે છે:

```swift
TextField("input your name", text: $text)
```

જ્યારે input box ખાલી હોય, ત્યારે તેમાં ધૂળિયા રંગનું સૂચક લખાણ દેખાય છે.

![textfield](../../RESOURCE/014_textfield.png)

#### data binding

`TextField` પોતે input data ને persist કરીને રાખતું નથી; data manage કરવા માટે bound variable જોઈએ.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

user જે લખે છે તે સીધું `text` variable માં save થાય છે; `TextField` ફક્ત input interface માટે છે.

`$` binding દર્શાવે છે:

```swift
$text
```

આ સામાન્ય variable નથી, પણ `Binding` પ્રકાર છે.

તેનું કામ view અને data વચ્ચે connection બનાવવાનું છે:

જ્યારે user `TextField` માં content દાખલ કરે છે, ત્યારે `text` આપમેળે update થાય છે; અને જ્યારે `text` બદલાય, ત્યારે `TextField` પણ synchronously update થાય છે.

ઉદાહરણ તરીકે:

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

`TextField` માં input કરતાં ઉપરનું `Text` real time માં તેની સાથે બદલાય છે.

![textField](../../RESOURCE/014_textfield1.png)

### number type સાથે binding

જ્યારે number input કરાવવું હોય, ત્યારે તેનો યોગ્ય પ્રકાર bind કરવો પડે:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

જ્યારે user રકમ દાખલ કરે છે, ત્યારે `TextField` input ને parse કરીને `number` variable update કરે છે.

## input box ઉમેરવું

હવે `TextField` ની basic સમજણ પછી, તેને “પિગી બેંક” project માં લાગુ કરીએ.

“પિગી બેંક” માં “રકમ” દાખલ કરવી છે, એટલે numeric binding format વાપરીએ અને user ની input save કરવા માટે `number` variable ઉમેરીએ:

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

હવે `TextField` default તરીકે `number` ની value બતાવે છે (`0`).

જ્યારે input content ખાલી કરાય, ત્યારે placeholder “Amount” દેખાય છે.

આ ફરી બતાવે છે કે `TextField` bound variable ની value બતાવે છે, પોતે data save કરતું નથી.

### input box ના size ની સમસ્યા

હાલના view માં આપણે જોશું કે `TextField` ને કોઈ border નથી, ફક્ત `0` દેખાય છે, અને content left aligned લાગે છે.

અસર આ રીતે દેખાય છે:

![textfield](../../RESOURCE/014_textfield2.png)

તેનું કારણ એ છે કે `TextField` default તરીકે parent view ની આખી width લેવાનો પ્રયત્ન કરે છે.

આ ચકાસવા માટે background color ઉમેરો:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

પરિણામ:

![textfield](../../RESOURCE/014_textfield3.png)

આથી જોઈ શકાય છે કે `TextField` ખરેખર આખી row ની width ભરે છે.

### fixed width ગોઠવવી

જો input box વધુ compact જોઈએ, તો `frame` વડે તેની width મર્યાદિત કરી શકાય:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

પરિણામ:

![textfield](../../RESOURCE/014_textfield4.png)

### border અને inner padding ઉમેરવી

કારણ કે `TextField` default રીતે border સાથે આવતું નથી, style હાથેથી ઉમેરવું પડે:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

હવે input box વધુ “standard input box” જેવું લાગે છે.

![textfield](../../RESOURCE/014_textfield5.png)

## border

SwiftUI માં `border` view ને border આપવા માટે વપરાય છે.

મૂળભૂત ઉપયોગ:

```swift
border(Color.black, width: 1)
```

અહીં `Color.black` border નો રંગ છે અને `width` તેની જાડાઈ છે.

`TextField` માટે આપણે આ વાપરીએ:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

એટલે input box માટે 1 pt જાડાઈનો કાળો border ઉમેરાય છે.

તમે `Color.blue`, `Color.green` જેવા બીજા રંગો અથવા `width: 2` જેવી વધુ જાડાઈ પણ અજમાવી શકો.

## પૈસા જમા કરવાનું button

હવે આપણા પાસે કુલ રકમ બતાવવા માટે `amount` variable છે, input માટે `TextField` છે, અને input box સાથે bound `number` variable છે.

હાલનું code આ છે:

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

### button ઉમેરવું

હવે પૈસા save કરવાની action trigger કરવા માટે button ઉમેરવું છે.

```swift
Button("Save") {
    
}
```

### જમા કરવાની logic

અમે ઈચ્છીએ છીએ કે user રકમ દાખલ કરે, button દબાવે અને રકમ કુલ રકમમાં ઉમેરાઈ જાય.

```swift
Button("Save") {
    amount += number
}
```

અહીં compound assignment operator નો ઉપયોગ થયો છે, જે user દ્વારા દાખલ કરેલી `number` ને કુલ `amount` સાથે ઉમેરે છે.

### input રકમ reset કરવી

હવે એક સમસ્યા છે: button click પછી input box માં લખેલી રકમ સાફ થતી નથી.

જો user `10` દાખલ કરે અને save દબાવે, તો input box માં હજી પણ `10` જ રહે છે, જે આગળની input ને અસર કરશે.

એનું કારણ એ છે કે `TextField` `number` સાથે bound છે. button click વખતે આપણે ફક્ત `amount` બદલી રહ્યા છીએ; `number` બદલાતું નથી, એટલે input box જૂની value જ બતાવે છે.

અેથી clear logic ઉમેરવી પડશે: click પછી પહેલા રકમ કુલમાં ઉમેરો, પછી input value reset કરો:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

હવે user રકમ દાખલ કરીને button click કરે ત્યારે, રકમ કુલમાં ઉમેરાય છે અને `number` ફરી `0` થાય છે, જેથી આગળની input માટે box તૈયાર રહે.

આ સાથે “પિગી બેંક” નું મુખ્ય saving logic પૂર્ણ થાય છે.

## view ને optimize કરવું

functionality પૂર્ણ થયા પછી interface ને થોડું સુંદર બનાવી શકાય, જેમ કે background image અને button style ઉમેરવી.

button style ઉમેરવું:

```swift
.buttonStyle(.borderedProminent)
```

background image ઉમેરવી:

```swift
.background {
    Image("1")
}
```

હવે આપણું પૂરું “પિગી બેંક” project તૈયાર છે.

## સંપૂર્ણ code

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

અંતિમ અસર:

![Piggy Bank](../../RESOURCE/014_view.png)

હવે તમે `100` અથવા વધુ રકમ જમા કરીને “પિગી બેંક” ની logic માં કોઈ સમસ્યા છે કે નહીં તે ચકાસી શકો છો.

અથવા project ને simulator અથવા real device પર ચલાવીને અનુભવ પણ મેળવી શકો છો.

### debug output

logic યોગ્ય રીતે કામ કરે છે કે નહીં તે ચકાસવા માટે, button ની અંદર debug output પણ ઉમેરાઈ શકે:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

દરેક વખત save પર click કરતાં, Console માં આ પ્રકારનું debug output જોઈ શકાય:

```
---Saving---
amount:11
number:0
```
