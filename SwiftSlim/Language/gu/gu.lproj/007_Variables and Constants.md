# ચલ અને સ્થિરાંકો

આ પાઠમાં આપણે Swift માં variables અને constants શીખીશું, સાથે કેટલીક સામાન્ય data types અને basic operators ને પણ ઓળખીશું.

આ બધું programming માં સૌથી મૂળભૂત જ્ઞાન છે, અને આગળ SwiftUI શીખવા માટેનું મહત્વપૂર્ણ આધાર પણ છે.

## દૈનિક જીવનમાં variables અને constants

અમે variables અને constants ને જીવનના ઉદાહરણોથી સરળ રીતે સમજીએ.

જીવનમાં variables:

- ટેલિવિઝનમાં દરેક કાર્યક્રમનું content જુદું હોય છે
- દરરોજનું હવામાન એકસરખું નથી રહેતું
- ઘડિયાળ દરેક સેકંડે બદલાય છે

આ બધાની એક સામાન્ય બાબત છે: તેઓ બદલાય છે.

જો ટેલિવિઝનમાં હંમેશા એક જ દૃશ્ય રહે, હવામાન હંમેશા સૂર્યપ્રકાશવાળું રહે અને ઘડિયાળની સોયો ક્યારેય ન ખસે, તો આવી વસ્તુઓ constants ગણાય.

એક બદલાઈ શકે છે, જ્યારે બીજું બદલાતું નથી.

## variables અને constants સમજવું

App development માં સામાન્ય રીતે user પાસેથી કેટલીક માહિતી ભરાવવી અથવા save કરાવવી પડે છે.

ઉદાહરણ તરીકે:

- account નું નામ
- જન્મતારીખ
- સંપર્ક માહિતી
- સરનામું

આ માહિતી save થાય છે અને પછી screen પર બતાવવામાં આવે છે.

ધારી લો user એ App માં એક નામ દાખલ કર્યું:

```
FangJunyu
```

આ નામ આપણે save રાખવું પડે, જેથી App માં ફરી બતાવી શકાય.

આ save કરવાની પ્રક્રિયાને એક drawer માં વસ્તુ મુકવા જેવી સમજાવી શકાય.

જ્યારે આપણે નામ save કરીએ છીએ, ત્યારે જાણે નામને એક drawer માં મૂકી રહ્યા હોઈએ એમ છે.

save કરવાના data ઘણા હોઈ શકે, એટલે drawers પણ ઘણા હોઈ શકે. દરેક drawer માં શું છે તે જાણવા માટે drawer ને નામ આપવું પડે.

ઉદાહરણ તરીકે:

```
name
```

આ ઉદાહરણમાં `name` drawer નું નામ છે, અને `FangJunyu` તેમાં save થયેલી માહિતી છે.

![Var](../../RESOURCE/007_var.png)

**Swift માં data save કરવું હોય, તો variable (`var`) અથવા constant (`let`) જાહેર કરવું જ પડે.**

કારણ કે નામ સામાન્ય રીતે બદલાઈ શકે છે, તેથી અહીં variable નો ઉપયોગ કરવો જોઈએ.

```swift
var name = "FangJunyu"
```

અહીં `name` નામનું variable જાહેર થયું છે, તેનો પ્રકાર `String` છે અને તેનું value `"FangJunyu"` છે.

### variable અને constant નો ફરક

variable `var` વડે જાહેર થાય છે:

```swift
var
```

constant `let` વડે જાહેર થાય છે:

```swift
let
```

ઉદાહરણ તરીકે:

```swift
var name = "FangJunyu"
let id = 123456
```

જો value ને પછી બદલવી હોય તો variable વાપરવામાં આવે છે; જો value બદલવાની ન હોય તો constant વપરાય છે.

એટલે variable અને constant વચ્ચેનો મુખ્ય ફરક એ છે: value બદલવાની પરવાનગી છે કે નહીં.

### constant ને બદલવું

જો code constant ની value બદલવાનો પ્રયાસ કરે:

```swift
let name = "Sam"
name = "Bob"
```

તો Swift error બતાવે છે કે assignment કરી શકાય નહીં, કારણ કે આ constant છે.

```
Cannot assign to property: 'name' is a 'let' constant
```

આ રીત developer ને મહત્વપૂર્ણ data ભૂલથી બદલાઈ જવાથી બચાવવામાં મદદ કરે છે.

### SwiftUI માં બતાવવું

`ContentView.swift` ખોલો અને `View` ની અંદર variable જાહેર કરો:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

અહીં `name` નામનું variable જાહેર કરવામાં આવ્યું છે અને `Text` દ્વારા screen પર બતાવવામાં આવે છે.

જો આપણે variable નું content બદલીએ:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

તો `Text` માં દેખાતું લખાણ પણ બદલાઈ જશે.

આ રીતે variable ની મદદથી screen પર શું બતાવવું તે નિયંત્રિત કરી શકાય છે, અને દર વખતે `Text` ની અંદરનું literal text સીધું બદલવાની જરૂર રહેતી નથી.

જો અન્ય જગ્યાએ પણ આ માહિતી જોઈએ, તો આપણે variable ને ત્યાં pass પણ કરી શકીએ. આ જાણે drawer માંથી વસ્તુ બીજી જગ્યાએ ઉપયોગ માટે આપવાની જેમ છે.

### SwiftUI માં variable અને constant ક્યાં લખાય?

SwiftUI માં variables અને constants સામાન્ય રીતે `body` ની બહાર લખાય છે:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

હા, તેને `body` ની અંદર પણ લખી શકાય:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

પણ બંને વચ્ચે એક મહત્વપૂર્ણ ફરક છે:

- જો variable અથવા constant `body` ની અંદર લખાય, તો દરેક વખત view ફરી calculate થાય ત્યારે તે ફરીથી create થાય છે
- જો તે `body` ની બહાર લખાય, તો તે view structure ની property તરીકે રહે છે અને code વધુ સ્પષ્ટ લાગે છે

એટલે actual development માં variables અને constants સામાન્ય રીતે `body` ની બહાર જ લખવામાં આવે છે.

## data types

variables માં અનેક પ્રકારના data save કરી શકાય છે, અને એ અલગ પ્રકારોને data types કહેવામાં આવે છે.

ઉદાહરણ તરીકે, આપણે અગાઉ `Text` વડે text બતાવ્યું હતું:

```swift
Text("Hello, World")
```

અહીં `"Hello, World"` એ string (`String`) પ્રકાર છે.

string text content બતાવવા માટે વપરાય છે, અને Swift માં તેને double quotes `""` માં લખવું પડે છે.

ઉદાહરણ તરીકે:

```swift
var hello = "Hello, World"
```

string ઉપરાંત Swift માં ઘણી બધી બીજી data types પણ છે.

શરૂઆતમાં સૌથી સામાન્ય ચાર પ્રકાર છે:

- `String`
- `Int`
- `Double`
- `Bool`

આ ચાર પ્રકાર મોટા ભાગના basic data processing માટે પૂરતા પડે છે.

**String**

`String` text content દર્શાવે છે, જેમ કે:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

string સામાન્ય રીતે user name, title અથવા લખાણ content માટે વપરાય છે.

**Int**

`Int` integer દર્શાવે છે, એટલે કે દશાંશ વગરની પૂર્ણ સંખ્યા.

ઉદાહરણ તરીકે:

```swift
var age = 26
var count = 100
```

integer સામાન્ય રીતે ઉંમર, સંખ્યા અને count દર્શાવવા માટે વપરાય છે.

**Double**

`Double` દશાંશવાળી સંખ્યા દર્શાવે છે.

ઉદાહરણ તરીકે:

```swift
var weight = 74.5
var height = 185.0
```

Swift માં દશાંશ સંખ્યાઓ સામાન્ય રીતે default તરીકે `Double` પ્રકારની હોય છે.

તેને મળતો એક પ્રકાર `Float` પણ છે, પણ તેની value range નાની હોય છે, તેથી actual development માં `Double` વધુ સામાન્ય છે.

**Bool**

`Bool` પ્રકાર બે સ્થિતિઓ દર્શાવે છે: `true` અને `false`.

ઉદાહરણ તરીકે:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` સામાન્ય રીતે condition checking માટે વપરાય છે, જેમ કે alert બતાવવો કે નહીં.

જ્યાં ફક્ત બે જ પરિણામ હોય, ત્યાં `Bool` ખાસ યોગ્ય છે.

### SwiftUI માં બતાવવું

જ્યારે આપણે `String` પ્રકાર બતાવીએ છીએ, ત્યારે સીધું `Text` વાપરી શકીએ:

```swift
Text(name)
```

પણ `Int`, `Double` જેવા પ્રકાર string નથી, તેથી તેમને સીધા text content તરીકે મૂકી શકાતાં નથી.

જો `Text` માં આવા data બતાવવા હોય, તો string interpolation નો ઉપયોગ કરીએ:

```swift
\()
```

string interpolation string ના અંદર લખાય છે અને variable અથવા constant ને `\()` માં મૂકવામાં આવે છે.

ઉદાહરણ તરીકે:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

અહીં `""` string દર્શાવે છે અને `\()` variable અથવા constant ને string માં ઉમેરવા માટે છે.

જેમ કે:

```swift
"DoubleNum: \(num * 2)"
```

તેનું displayed content હશે:

```swift
DoubleNum: 2
```

આ રીતે આપણે string ની અંદર variable અથવા constant દાખલ કરીને તેને `Text` વડે interface પર બતાવી શકીએ.

ટિપ: `\()` ફક્ત string `""` ની અંદર જ વાપરી શકાય.

## operators

જ્યારે variable અથવા constant જાહેર કરીએ ત્યારે આપણે નીચે જેવી syntax જોઈએ છીએ:

```swift
var num = 1
```

અહીંનું `=` assignment operator કહેવાય છે.

તેનું કામ છે: જમણી બાજુનું value ડાબી બાજુના variable ને આપવું.

આ ઉદાહરણમાં `1` ને `num` ને assign કરવામાં આવ્યું છે.

assignment operator સિવાય કેટલાક સામાન્ય numeric operators પણ છે:

- `+`
- `-`
- `*`
- `/`

જ્યારે આપણે `Int` અથવા `Double` જેવા data પર ગણતરી કરીએ, ત્યારે આ operators વપરાય છે.

ઉદાહરણ તરીકે:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

ગણતરી થયા પછી result variable માં save થાય છે.

## સારાંશ

variables, constants અને operators programming ના સૌથી મૂળભૂત ખ્યાલો છે.

variables અને constants દ્વારા આપણે program માં વિવિધ data save કરી શકીએ છીએ; data types દ્વારા data કયા પ્રકારનું છે તે સ્પષ્ટ થાય છે; અને operators દ્વારા data પર ગણતરી અને પ્રક્રિયા કરી શકાય છે.

આ બધું programming દુનિયાનાં મૂળભૂત tools જેવા છે. આ બાબતો સારી રીતે સમજશો તો આગળ Swift અને SwiftUI શીખવા માટે મજબૂત પાયો તૈયાર થશે.
