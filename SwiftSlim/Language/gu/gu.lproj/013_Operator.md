# operators

આ પાઠમાં આપણે Swift ના operators શીખીશું.

જ્યારે આપણે ગણતરી, સરખામણી અથવા logic judgment કરીએ છીએ, ત્યારે operators જરૂરી બને છે. program ના લગભગ દરેક ભાગમાં તેમનો ઉપયોગ થાય છે, તેથી programming ના સૌથી મૂળભૂત કૌશલ્યોમાંથી આ એક છે.

```swift
let a = 100 * 8
```

Programming શીખતા ઘણા લોકો જોશે કે જેમને થોડું ગણિતીય વિચાર સ્પષ્ટ હોય, તેઓ program logic સરળતાથી સમજી શકે છે. તેનું કારણ એ છે કે programming નું મૂળ “ગણતરી” અને “નિયમ આધારિત નિર્ણય” પર ટકેલું છે, અને operators એ જ કામ માટેના મુખ્ય સાધન છે.

actual development માં operators ફક્ત સરળ સંખ્યાત્મક ગણતરી માટે જ નહીં, પરંતુ અનેક ચોક્કસ પરિસ્થિતિઓમાં પણ વપરાય છે.

ઉદાહરણ તરીકે, block game માં જ્યારે user કોઈ block ને નિર્ધારિત સ્થાન પર ખેંચે છે, ત્યારે હિસાબ કરવો પડે:

- block ની coordinate position
- block કયા સ્થાને fit થઈ શકે
- target position ઉપલબ્ધ છે કે નહીં

આ “ગણતરી + નિર્ણય” ની પ્રક્રિયાનો આધાર operators જ છે.

![Block](../../Resource/013_block.png)

operators શીખવાનો અર્થ ફક્ત ગણિત કરવું નથી, પરંતુ આગળ interface layout, data processing અને interaction logic માટે મજબૂત પાયો બનાવવો પણ છે.

## SwiftUI માં ગણતરી કેવી રીતે ચલાવવામાં આવે છે

SwiftUI માં સામાન્ય રીતે `Button` દ્વારા કોઈ function trigger થાય છે, અને પછી function ની અંદર calculation logic ચલાવવામાં આવે છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

button click કરતાં Console માં output આવશે:

```
c: 20
```

આ પાઠમાં આપણે operators સંબંધિત logic ને `func` ની અંદર લખીશું, button દ્વારા તેને ચલાવીશું અને `print` થી result બતાવીશું.

આગળના ઉદાહરણોમાં code ને સરળ રાખવા માટે, આપણે ઘણીવાર result સીધું comment માં બતાવીશું અને વારંવાર `print` લખશું નહીં.

## Console output નું સંચાલન

કારણ કે દરેક click પર output વધશે, તેથી Console વિસ્તારના જમણા નીચે આવેલ clear button થી જૂના logs સાફ કરી શકાય, જેથી હાલનું result વધુ સરળતાથી જોઈ શકાય.

![Console](../../Resource/013_console.png)

## Button નો બીજો syntax

જો button ફક્ત એક function ચલાવે છે, તો વધુ સરળ syntax પણ વાપરી શકાય:

```swift
Button(action: ) {
    // View
}
```

આ syntax માં `action` એ button click વખતે ચલાવવાનો function (parameter વિનાનો function) છે, અને curly braces `{}` button માટેનો view define કરે છે.

ઉપર બતાવેલા `calculate` function સાથે આ રીતે લખી શકાય:

```swift
Button(action: calculate) {
    Text("Button")
}
```

હવે button click કરતાં `calculate` function સીધું જ ચાલશે.

એટલે જ્યારે button logic સરળ હોય અને ફક્ત એક function call કરવાનું હોય, ત્યારે `action` syntax વધુ સાફ અને વ્યવસ્થિત લાગે છે.

## arithmetic operators

arithmetic operators સંખ્યાત્મક ગણતરી માટે વપરાય છે:

- `+` ઉમેરણી
- `-` બાદબાકી
- `*` ગુણાકાર
- `/` ભાગાકાર
- `%` remainder (બાકી ભાગ)

ઉદાહરણ:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

એક મહત્વપૂર્ણ વાત એ છે કે Swift strongly typed language છે, તેથી જુદા data types ને આપમેળે mix નથી કરતી:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

જ્યારે બે values ના પ્રકાર જુદા હોય, ત્યારે પહેલા હાથેથી type conversion કરવું પડે.

## comparison operators

comparison operators બે values વચ્ચેનો સંબંધ તપાસે છે અને Bool result આપે છે:

- `==` બરાબર
- `!=` બરાબર નહીં
- `>` મોટું
- `<` નાનું
- `>=` મોટું અથવા બરાબર
- `<=` નાનું અથવા બરાબર

ઉદાહરણ:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

comparison operators ઘણીવાર conditions માં વપરાય છે. ઉદાહરણ તરીકે, “quote carousel” માં index array ની સીમા બહાર ન જાય તે માટે:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

જો `index < sayings.count - 1` સાચું હોય, તો `if` ની અંદરનો code ચાલે છે; નહીં તો નહીં.

## logical operators

logical operators ઘણા conditions ને જોડવા માટે વપરાય છે:

- `&&` અને (AND)
- `||` અથવા (OR)
- `!` નહીં (NOT)

### `&&` અને

જ્યારે ઘણા conditions એકસાથે સાચા હોવા જરૂરી હોય, ત્યારે `&&` વાપરાય છે.

ઉદાહરણ તરીકે:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

અહીં બે conditions છે: `age >= 18` અને `age <= 100`.

ફક્ત ત્યારે જ `legalAge` `true` બનશે, જ્યારે બન્ને conditions સાચા હોય. એક પણ ખોટી હોય, તો result `false` છે.

### `||` અથવા

જ્યારે ઘણાં conditions માંથી કોઈ એક સાચું હોવું પૂરતું હોય, ત્યારે `||` વાપરાય છે.

ઉદાહરણ તરીકે:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

આ code નો અર્થ એ છે કે `money >= 50` અથવા `creditCard >= 50` માંથી એક પણ સાચું હોય, તો `payAllowed` `true` બને છે.

ફક્ત ત્યારે જ `false` મળશે, જ્યારે બન્ને conditions ખોટા હોય.

ચુકવણીના ઉદાહરણમાં, cash અથવા credit cardમાંથી કોઈ પણ એકથી payment થઈ જાય તો ચાલે; બન્ને નિષ્ફળ જાય ત્યારે જ payment નિષ્ફળ ગણાય.

### `!` નહીં

`!` logical NOT operator છે, જે Bool value ને ઉલટાવી દે છે.

સરળ રીતે કહીએ તો, `true` ને `false` અને `false` ને `true` બનાવે છે.

ઉદાહરણ તરીકે:

```swift
let allowed = true
let result = !allowed   // false
```

અહીં `!allowed` એટલે `allowed` ની value ને ઉલટાવવી.

નોંધ: `!` અને `!=` અલગ operators છે. `!` Bool value ને negate કરે છે, જ્યારે `!=` comparison operator છે.

## assignment operators

assignment operators variable ને value આપવા અથવા update કરવા માટે વપરાય છે:

- `=` assignment

variable declaration અથવા calculation માં assignment હંમેશા જોવા મળે છે:

```swift
let a = 5
```

આ code નો અર્થ `5` ને variable `a` ને આપવો.

### compound assignment operators

actual development માં ફક્ત basic assignment જ નહીં, પરંતુ “compound assignment operators” પણ બહુ વપરાય છે. તે જૂની value ને લઈને સીધી ગણતરી અને update કરે છે:

- `+=`
- `-=`
- `*=`
- `/=`

અગાઉ “counter” પાઠમાં આપણે આ વિશે થોડું શીખ્યા હતા.

ઉદાહરણ તરીકે, button click કરતાં variable વધારવો:

```swift
var num = 10
num += 5   // num = 15
```

એનો અર્થ `num` ને `5` ઉમેરો અને result પાછું `num` માં save કરો.

આથી તે નીચેના લખાણ જેટલું જ છે:

```swift
var num = 10
num = num + 5   // num = 15
```

## ternary operator

Swift માં ternary operator condition આધારે બે results માંથી એક return કરે છે:

```swift
condition ? value1 : value2
```

જો condition `true` હોય તો `value1`, નહીંતર `value2`.

ઉદાહરણ તરીકે:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

અહીં `showColor` `true` હોય તો `Color.blue` return થાય છે, અને background વાદળી બને છે; નહીંતર `Color.clear`, એટલે પારદર્શક background.

ટિપ: `Color.clear` નો અર્થ પારદર્શક રંગ, એટલે કંઈ દેખાતું નથી.

### `if-else` થી ફરક

લોજીકલી ternary operator `if-else` જેટલો જ છે.

ઉદાહરણ તરીકે, ઉપરનું code આ રીતે પણ લખી શકાય:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

બંનેમાં logic સમાન છે: condition `true` હોય તો પહેલું result, નહીંતર બીજું.

વાપરવામાં ternary operator વધુ ટૂંકો છે અને “બેમાંથી એક” જેવી સરળ પરિસ્થિતિ માટે ઘણો સુયોગ્ય છે.

SwiftUI view building માં આ બહુ સામાન્ય છે:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

એક જ line માં condition આધારે view effect બદલાય છે.

## range operators

range operators interval દર્શાવવા માટે વપરાય છે:

- `...` closed range (બંને અંતો સહિત)
- `..<` half-open range (જમણો અંત સિવાય)

ઉદાહરણ તરીકે:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

`1...3` નો અર્થ `1` થી `3` સુધી, જેમાં `3` પણ આવે છે; `5..<8` નો અર્થ `5` થી `8` સુધી, પરંતુ `8` વગર.

વિસ્તૃત સ્વરૂપ (માત્ર જાણ માટે):

```
5...    // >= 5
...5    // <= 5
```

આ “one-sided range” કહેવાય છે અને conditions અથવા pattern matching માં કામ લાગે છે.

આગળ `for` loop શીખતાં range operators વધુ વપરાશમાં આવશે; હાલ માટે તેને સતત સંખ્યાઓની range તરીકે સમજો.

## operators ની practice

હવે થોડા સરળ ઉદાહરણોથી જોઈએ કે view logic માં operators કેવી રીતે કામ કરે છે.

### 1. વાહનોની કુલ સંખ્યા ગણવી

ધારો કે કોઈ એક ચોરાહે દરરોજ `500` વાહનો પસાર થાય છે. `30` દિવસમાં કુલ કેટલા વાહનો પસાર થશે?

અહીં arithmetic operator વાપરી શકાય:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

અહીં ગણતરી સરળ છે: દરરોજ `500` વાહનો, `30` દિવસ માટે `500 × 30`, એટલે કુલ `15000`.

### 2. in-app purchase સભ્યતા તપાસવી

અમે ચકાસી શકીએ કે કોઈ user સભ્ય છે કે નહીં. જો તેની પાસે lifetime membership હોય અથવા subscription membership હોય, તો તેને member ગણીએ.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

અહીં `||` (OR) operator વપરાયો છે: `lifeTime = false`, એટલે lifetime membership નથી; `subscription = true`, એટલે subscription છે.

કારણ કે બેમાંથી એક condition સાચી છે, `isMember` `true` બને છે.

## સારાંશ

Swift માં operators data calculation અને logic judgment નો આધાર છે. જેમ `Text` content બતાવે છે, તેમ operators data પર actual પ્રક્રિયા કરે છે.

સરળ ગણતરીથી લઈને જટિલ logic, view state control અને layout calculation સુધી, operators દરેક જગ્યાએ મહત્વપૂર્ણ છે.

જુદી જુદી પરિસ્થિતિઓમાં practice કરવાથી આ પાઠમાં દર્શાવેલા operators ધીમે ધીમે સ્વાભાવિક બની જાય છે, અને આગળના અભ્યાસ માટે મજબૂત આધાર આપે છે.

### વિસ્તૃત જ્ઞાન - bitwise operators

Swift માં વધુ નીચલા સ્તરના operators પણ છે, જેમને bitwise operators કહેવાય:

- `&` (bitwise AND)
- `|` (bitwise OR)
- `^` (bitwise XOR)
- `~` (bitwise NOT)
- `>>` (right shift)
- `<<` (left shift)

ઉદાહરણ તરીકે:

```swift
let a = 6  // બાઈનરી 110
let b = 3  // બાઈનરી 011

print(a & b) // 2 (બાઈનરી 010)
print(a | b) // 7 (બાઈનરી 111)
print(a ^ b) // 5 (બાઈનરી 101)
print(~a)    // -7 (બિટવાઈઝ ઉલટાવ)
```

Swift માં integers binary complement સ્વરૂપમાં દર્શાવવામાં આવે છે, એટલે bitwise inversion પછી અનુરૂપ negative result મળે છે.

bitwise operators સીધા binary data પર કામ કરે છે અને સામાન્ય રીતે low-level data processing અથવા performance optimization જેવા ક્ષેત્રોમાં વપરાય છે.

શરૂઆતના અભ્યાસ માટે આ operators બહુ સામાન્ય નથી, અને સામાન્ય iOS અથવા SwiftUI development માં પણ ઓછી જરૂર પડે છે, એટલે અહીં તેમને ઊંડાણથી સમજાવવામાં આવ્યા નથી.

આગળ જો low-level logic અથવા performance optimization ની જરૂર પડે, તો તેને વધુ વિગતે શીખી શકાય.
