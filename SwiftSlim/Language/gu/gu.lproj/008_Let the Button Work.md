# બટનને કાર્યરત બનાવવું

આ પાઠમાં આપણે `Button`, `print` દ્વારા debug information output કરવું, અને Swift functions શીખીશું.

આ બધું SwiftUI માં interaction programming નું મૂળભૂત આધાર છે.

## Button

Button આપણા માટે સૌથી સામાન્ય UI controls પૈકીનું એક છે. જ્યારે download, open અથવા exit જેવી ક્રિયાઓ કરવાની હોય, ત્યારે સામાન્ય રીતે button પર click કરાય છે.

ઉદાહરણ તરીકે, App Store માં App download કરવા માટે "Get" button પર click કરીએ છીએ.

![Button](../../RESOURCE/008_button.png)

SwiftUI માં button ને `Button` વડે દર્શાવવામાં આવે છે.

મૂળભૂત ઉપયોગ:

```swift
Button("") {
    
}
```

આ રચનાને બે ભાગોમાં વહેંચી શકાય:

```swift
Button("બટનનું લખાણ") {
    બટન ક્લિક થાય ત્યારે ચાલતો કોડ
}
```

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Run કર્યા પછી `Start` નામનું button દેખાશે.

![Button](../../RESOURCE/008_button1.png)

જ્યારે user button પર click કરે છે, ત્યારે `{}` ની અંદરનો code execute થાય છે.

ધ્યાન રાખવાનું કે `Button` SwiftUI નું interface control (`View`) છે, તેથી તે `body` ની અંદર જ લખવું પડે.

### `buttonStyle` modifier

SwiftUI માં `Button` માટે system-built-in button styles મળે છે, જેને `buttonStyle` modifier વડે વાપરી શકાય.

ઉદાહરણ તરીકે:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` system દ્વારા આપેલી style લાગુ કરે છે.

સામાન્ય options:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

અલગ-अलग styles નો મુખ્ય ફરક એ છે કે button ને border છે કે નહીં, background છે કે નહીં, અને visual emphasis કેટલું છે.

## `print` output

Programming કરતી વખતે ઘણી વાર જોવું પડે છે કે program કોઈ ચોક્કસ code સુધી પહોંચ્યું કે નહીં.

Swift માં debug information output કરવા માટે `print` function મળે છે.

મૂળભૂત syntax:

```swift
print("Hello")
```

આ line text ને Console માં output કરશે.

### Button કાર્ય કરે છે કે નહીં તે ચકાસવું

button click થાય છે કે નહીં તે તપાસવા માટે `print` ને button ની અંદર લખી શકાય.

```swift
Button("Start") {
    print("Test 123")
}
```

button click કરતાં Console માં output આવશે:

```
Test 123
```

આનો અર્થ કે button સફળતાપૂર્વક trigger થયું.

![Button](../../RESOURCE/008_button3.png)

ધ્યાન આપો: `print` Swift code છે, interface control નથી. તેને સીધું `body` ની અંદર મૂકી શકાય નહીં, નહિતર error આવશે.

ઉદાહરણ તરીકે, નીચેનો code ખોટો છે:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // ભૂલ: body એ View return કરવું જોઈએ
    }
}
```

SwiftUI માં `body` interface structure વર્ણવવા માટે છે, એટલે તેમાં ફક્ત `View` controls મૂકી શકાય છે, જેમ કે `Text`, `Button`, `Image` વગેરે.

સામાન્ય code (ગણતરી, `print` વગેરે) button, function અથવા અન્ય event handlers ની અંદર લખવું પડે.

### Console

`print` નું output Xcode ના Console માં દેખાય છે.

જો Console ન દેખાતું હોય, તો જમણી નીચે આવેલા `Show the Debug Area` button પર click કરીને debug area ખોલો, પછી `Show the Console` button પર click કરો.

![](../../RESOURCE/008_button4.png)

Console ના ડાબા નીચે બે tabs હોય છે: `Executable` અને `Previews`.

![](../../RESOURCE/008_button5.png)

આ tabs અલગ run environments માટે છે: જ્યારે Canvas preview માં run કરો ત્યારે `print` output `Previews` હેઠળ દેખાશે; જ્યારે simulator અથવા real device પર App ચલાવો, ત્યારે output `Executable` હેઠળ દેખાશે.

એટલે જો `print` output ન દેખાય, તો પહેલાં યોગ્ય tab પસંદ કર્યું છે કે નહીં તે ચકાસો.

## ઉદાહરણ - ASCII character art

ઘણા code projects માં ASCII character art જોવા મળે છે.

character art એટલે સામાન્ય characters થી બનેલું ચિત્ર, જેમ કે:

![ASCII](../../RESOURCE/008_ascii.png)

અમે button + `print` નો ઉપયોગ કરીને એક ASCII character art output કરી શકીએ.

ઉદાહરણ code:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

button click કરતાં Console માં output આવશે:

```
 /\_/\
( o.o )
 > ^ <
```

નોંધ: string માં `\` લખવા માટે `\\` લખવું પડે છે, કારણ કે backslash string માં escape character છે.

## function

button ની અંદર code સીધું લખી શકાય છે.

જેમ કે:

```swift
Button("Start") {
    print("Hello")
}
```

જો code બહુ નાનું હોય તો આ સરસ છે. પણ actual development માં button દબાવતા ઘણા બધા steps ચાલી શકે છે.

ઉદાહરણ તરીકે:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // કદાચ હજી વધુ code હશે
}
```

જો code વધતું જાય, તો તેને button ની અંદર સીધું રાખવાથી interface code ગૂંચવાયેલું લાગે છે અને maintain કરવું મુશ્કેલ બને છે.

એટલે આપણે સામાન્ય રીતે આ logic ને function માં ગોઠવીએ છીએ, અને પછી button માં તે function ને call કરીએ છીએ.

### function શું છે?

function એટલે ફરીથી વાપરી શકાય એવો code નો એક ભાગ.

જ્યારે કોઈ code ચલાવવો હોય, ત્યારે function call કરીએ અને તેના અંદરનો code execute થાય છે.

આથી code structure વધુ સ્પષ્ટ બને છે અને reuse કરવું સરળ બને છે.

### મૂળભૂત syntax

Swift માં function `func` keyword વડે define થાય છે:

```swift
func randomInt() {
    // code
}
```

આ code એક function define કરે છે.

`randomInt` function નું નામ છે, જે આ code block ને ઓળખ આપે છે.

`() ` parameter માટેની જગ્યા છે, જ્યાં બહારથી data લઈ શકાય. જો data ન જોઈએ તો ખાલી રાખી શકાય.

`{}` ની અંદર function નો actual code લખાય છે.

ઉદાહરણ તરીકે:

```swift
func getName() {
    print("FangJunyu")
}
```

આ function text output કરે છે.

### function call કરવું

function define કરવું એટલે ફક્ત તે code બનાવવું. તેને execute કરવા માટે call પણ કરવું પડે.

call કરવાની રીત એ છે કે function નામ પછી `()` લખવું:

```swift
getName()
```

program આ line સુધી પહોંચે ત્યારે `getName` function નો code execute થાય છે.

પૂર્ણ ઉદાહરણ:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Run કર્યા પછી Console માં output આવશે:

```
FangJunyu
```

### SwiftUI માં function નો ઉપયોગ

SwiftUI view માં functions સામાન્ય રીતે `body` ની બહાર લખાય છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

button click થાય ત્યારે `getName()` function call થશે.

આથી interface code સાફ રહે છે અને actual logic function માં ગોઠવાઈ જાય છે.

### function parameters

ક્યારેક function ને જુદા data મુજબ જુદું કામ કરવું પડે છે.

ઉદાહરણ તરીકે, આપણે function દ્વારા ફક્ત `"FangJunyu"` જ નહીં, પણ અલગ અલગ નામ output કરવા માંગીએ.

એટલે parameter નો ઉપયોગ થાય છે. parameter એટલે function call કરતી વખતે આપવામાં આવતું data.

ઉદાહરણ તરીકે:

```swift
func getName(name: String) {
    print(name)
}
```

આ function માં હવે `name` નામનું parameter છે, અને `String` તેનો પ્રકાર છે.

એનો અર્થ કે function ને `String` પ્રકારનું data મળવું જરૂરી છે.

કારણ કે હવે function ને data જોઈએ છે, તેથી call કરતી વખતે તે data આપવું પડશે.

```swift
getName(name: "Sam")
```

જ્યારે call સમયે `"Sam"` આપીએ, ત્યારે function અંદર એ value નો ઉપયોગ થશે.

run result:

```
Sam
```

## ઉદાહરણ - function વડે ASCII character art output કરવું

અગાઉના ઉદાહરણમાં `print` ને સીધું button ની અંદર લખ્યું હતું.

પણ જો character art વધુ જટિલ હોય, તો code લાંબો બની જાય. ત્યારે logic ને function માં મૂકવાથી interface code વધુ સાફ રહે છે.

ઉદાહરણ code:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Run કર્યા પછી button click કરવાથી Console માં output આવશે:

```
 /\_/\
( o.o )
 > ^ <
```

અહીં બે બાબતો થાય છે, જ્યારે user button પર click કરે:

1. button `printCat()` function ને call કરે છે
2. function ની અંદરનો `print` code execute થાય છે

આ રીતે interface code ફક્ત event trigger કરે છે, અને actual logic function માં રહે છે.

actual development માં મોટા ભાગની button actions function મારફતે જ અમલમાં મૂકાય છે.

## સારાંશ

આ પાઠમાં આપણે ત્રણ મહત્વપૂર્ણ બાબતો શીખી:

**1. Button**

`Button` SwiftUI માં action trigger કરવા માટેનો control છે.

```swift
Button("Start") {

}
```

user button click કરે ત્યારે curly braces ની અંદરનો code execute થાય છે.

**2. `print` output**

`print` Console માં debug information output કરવા માટે વપરાય છે.

```swift
print("Hello")
```

developer Console દ્વારા program ની ચાલતી સ્થિતિ જોઈ શકે છે.

**3. function**

function ફરીથી વાપરી શકાય એવો code block છે.

```swift
func sayHello() {
    print("Hello")
}
```

function call કરવું:

```swift
sayHello()
```

જો function ને data જોઈએ, તો parameter વાપરી શકાય:

```swift
func sayHello(name: String) {
    print(name)
}
```

આગામી પાઠોમાં આપણે વધુ SwiftUI controls અને data interface સાથે કેવી રીતે interact કરે છે તે શીખીશું.

## અભ્યાસ

નીચેના exercises પોતે કરવાનો પ્રયાસ કરો:

1. `"Hello"` લખાણવાળું button બનાવો
2. button click થાય ત્યારે Console માં `Hello Swift` output કરો
3. output કરતો code એક function માં મૂકો, અને પછી button માં એ function call કરો
