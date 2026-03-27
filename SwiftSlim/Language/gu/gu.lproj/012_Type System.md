# પ્રકાર પ્રણાલી

પાછલા પાઠોમાં આપણે variables શીખ્યા હતા અને સમજ્યું હતું કે variables અલગ અલગ પ્રકારના data save કરી શકે છે.

ઉદાહરણ તરીકે:

```swift
var hello = "Hello, World"
```

અહીં `hello` એક text save કરે છે, એટલે તેનો પ્રકાર `String` છે.

હવે આપણે પ્રકાર (`Type`) ની કલ્પનાને વ્યવસ્થિત રીતે શીખીશું, સાથે explicit type declaration અને type inference પણ સમજશું, જેથી variable ના મૂળ સ્વભાવને વધુ ઊંડાઈથી સમજવામાં મદદ મળે.

## પ્રકાર શું છે

Swift માં દરેક value નો એક સ્પષ્ટ પ્રકાર હોય છે. પ્રકાર નક્કી કરે છે કે આ value શું છે અને તે શું કરી શકે છે.

ઉદાહરણ તરીકે:

- `42` એ `Int` (પૂર્ણાંક) છે
- `"Hello"` એ `String` (શબ્દમાળા) છે
- `true` એ `Bool` (બૂલિયન) છે

આ બધાં જુદા પ્રકારના values છે અને તેમનો ઉપયોગ પણ જુદો છે.

## Swift ના સામાન્ય મૂળભૂત પ્રકારો

શરૂઆતના અભ્યાસમાં સૌથી સામાન્ય પ્રકારો આ છે:

- `String`: શબ્દમાળા (text)
- `Int`: પૂર્ણાંક
- `Double`: દશાંશવાળી સંખ્યા (વધુ ચોકસાઈ)
- `Bool`: બૂલિયન (`true/false`)

ઉપરાંત `Float` પણ છે, પરંતુ તેની precision `Double` કરતાં ઓછી છે અને સામાન્ય રીતે ઓછો વપરાય છે; `Character` એક single character માટે છે, જેમ કે `"A"` અથવા `"!"`.

### પ્રકાર જાહેર કરવો (explicit type)

Swift માં variable જાહેર કરતી વખતે type હાથે પણ લખી શકાય છે:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

variable નામ પછી `: Type` લખવાથી તેનો પ્રકાર જાહેર થાય છે.

array માટે type લખવાની રીત `: [Type]` છે:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

આ code માં `scores` ફક્ત `Int` પ્રકારના elements રાખી શકે છે, અને `tags` ફક્ત `String` રાખી શકે છે.

explicit type declaration code નો ઇરાદો વધુ સ્પષ્ટ બનાવે છે અને કેટલીક પરિસ્થિતિમાં type inference ની ભૂલો ટાળે છે.

## type inference

ઘણી પરિસ્થિતિઓમાં type ને explicit રીતે લખવાની જરૂર પડતી નથી:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"     // String
var isLogin = false  // Bool
var scores = [90, 85, 78]   // [Int]
var tags = ["Swift", "iOS"] // [String]
```

કારણ કે Swift compiler “initial value” પરથી type આપમેળે અનુમાન કરી લે છે.

## explicit declaration અને type inference

અગાઉના પાઠોમાં આપણે explicit type જેવી લખાણ શૈલી:

```swift
var age: Int = 18
```

નો ઉપયોગ પ્રાથમિકતા તરીકે કર્યો નહોતો, પરંતુ type inference વધુ વાપર્યું:

```swift
var age = 18
```

આ બન્ને લખાણ સમાન અર્થ ધરાવે છે; બંનેમાં `age` નો પ્રકાર `Int` જ રહેશે. તેમાં type inference વધુ ટૂંકો અને સાદો લાગે છે.

શરૂઆતમાં explicit type પર ભાર ન મૂકવાનો કારણ એ છે કે type inference code માં વધારાની માહિતી ઓછું કરે છે, જેથી શીખવાની શરૂઆતમાં સમજણ સરળ બને.

## type કેમ જરૂરી છે

Swift એક strongly typed language છે.

એનો અર્થ એ છે કે એક વાર variable નો પ્રકાર નક્કી થઈ જાય પછી, તેને મનસ્વી રીતે બદલી શકાતો નથી.

ઉદાહરણ તરીકે:

```swift
var age: Int = 18

age = 20    // Success
age = "20"  // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

અહીં પહેલું `20` એ `Int` છે, એટલે `age` ને assign થઈ શકે છે; બીજું `"20"` એ `String` છે, જે `Int` સાથે મેળ ખાતું નથી, એટલે error થાય છે.

`nums` એ `[Int]` પ્રકારનું array છે, એટલે તેમાં ફક્ત integers જ હોઈ શકે; string mix કરી શકાતી નથી.

પ્રકાર data નો ઉપયોગ મર્યાદિત રાખે છે, જેથી compile stage પર જ type mismatch જેવી સમસ્યાઓ શોધી શકાય. આથી bugs ઘટે છે અને code વધુ સ્થિર અને maintainable બને છે.

## ક્યારે explicit type ફરજિયાત બને

જોકે Swift ઘણી વાર type આપમેળે શોધી શકે છે, કેટલીક સ્થિતિઓમાં compiler type શોધી શકતો નથી, અથવા ખોટો type પસંદ કરી શકે છે. ત્યારે explicit type લખવો પડે.

**1. ખાલી array**

ખાલી array બનાવતી વખતે explicit type ફરજિયાત છે:

```swift
var nums: [Int] = []
```

જો type ન લખીએ:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

compiler ખાલી array જોઈને તેમાં કયો પ્રકારના elements આવશે તે જાણી શકતો નથી, તેથી compile error થાય છે.

**2. inference ની ભૂલ ટાળવી**

```swift
var value = 10   // Int
```

આ ઉદાહરણમાં `10` ને `Double` પણ માનવામાં આવી શકે, પણ દશાંશ બિંદુ ન હોવાથી compiler default તરીકે તેને `Int` માને છે.

જો `value` ને floating-point number તરીકે જ રાખવો હોય, તો explicit type લખો:

```swift
var value: Double = 10   // Double
```

જ્યારે inference નું પરિણામ આપણી અપેક્ષા મુજબ ન હોય, ત્યારે explicit type અથવા literal ની રચનામાં ફેરફાર કરીને type ને સ્પષ્ટ કરવું જોઈએ.

**3. custom types**

આગળ આપણે custom types પણ શીખીશું. custom types વાપરતાં પણ explicit declaration ઘણી વાર જરૂરી બને છે:

```swift
var info: GameInfo
var users: [User] = []
```

આનું કારણ પણ ખાલી array જેવું જ છે: compiler ખાલી value પરથી type આપમેળે નક્કી કરી શકતો નથી.

## type conversion

Swift માં અલગ પ્રકારો વચ્ચે automatic conversion થતું નથી; conversion હાથેથી કરવું પડે.

ઉદાહરણ તરીકે, બે અલગ પ્રકારની સંખ્યાઓને ઉમેરવી હોય:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b   // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

અહીં `a` એ `Int` છે, `b` એ `Double` છે, એટલે બંનેનો પ્રકાર જુદો છે અને સીધી ગણતરી થઈ શકતી નથી.

ગણતરી પહેલાં એક value ને બીજા જેવા પ્રકારમાં ફેરવવી પડે:

```swift
var result = Double(a) + b
```

અહીં `Int` પ્રકારના `a` ને `Double` માં ફેરવી પછી `b` સાથે ઉમેરવામાં આવે છે.

ધ્યાન રાખો કે type conversion મૂળ variable નો પ્રકાર બદલતું નથી. `Double(a)` ફક્ત ગણતરી માટે નવું `Double` value બનાવે છે; `a` હજી પણ `Int` જ રહે છે.

બીજા પ્રકારો માટે પણ આ જ રીત છે: target type + `()` વડે conversion થાય છે. જેમ કે:

```
Int()、Double()、String()
```

ઉદાહરણ:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

ખાસ નોંધ: બધા conversions સમાન રીતે કામ કરતા નથી. ઉદાહરણ તરીકે, `Double → Int` કરતી વખતે દશાંશ ભાગ કાપી નાખવામાં આવે છે; round off થતું નથી.

## type alias

Swift માં પહેલેથી અસ્તિત્વમાં રહેલા type માટે alias પણ બનાવાઈ શકે, જેથી code નો અર્થ વધુ સ્પષ્ટ બને:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

અહીં `UserID` મૂળભૂત રીતે `Int` જ છે; પ્રકાર બદલાતો નથી, ફક્ત નામ વધુ અર્થપૂર્ણ બને છે.

મોટા codebase અથવા જટિલ types ધરાવતા projects માં type alias code ને વધુ વાંચનીય બનાવે છે.

## type example

હવે એક સરળ ઉદાહરણથી જોઈએ કે actual development માં type કેવી રીતે કામ કરે છે.

### variable બનાવવું

સૌપ્રથમ, `age` નામનું variable બનાવીએ:

```swift
var age = 20
```

કારણ કે આ variable ને SwiftUI માં બતાવવું અને બદલવું છે, તેથી તેને `@State` સાથે જાહેર કરવું જોઈએ:

```swift
@State private var age = 20
```

`private` વિશે થોડું પહેલેથી શીખ્યા છીએ. તેનો અર્થ એ કે આ variable ફક્ત હાલના view ની અંદર વપરાય છે.

### SwiftUI માં data બતાવવું

SwiftUI માં `age` variable બતાવવા:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

હવે view પર દેખાશે:

```swift
age: 20
```

### data બદલવું

હવે `age` બદલવા માટે બે buttons ઉમેરીએ:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### run result

જ્યારે `changeAge1` click થાય છે, ત્યારે `age` ને `18` assign થાય છે:

```swift
age = 18
```

કારણ કે `18` એ `Int` છે અને `age` નો પ્રકાર પણ `Int` છે, એટલે assignment સફળ છે.

`changeAge2` error આપશે:

```swift
age = "18"
```

error message:

```
Cannot assign value of type 'String' to type 'Int'
```

કારણ કે `"18"` એ `String` છે (શબ્દમાળા `""` માં લખાય છે), જ્યારે `age` એ `Int` છે. બંને પ્રકારો સરખા નથી, એટલે assignment શક્ય નથી.

### error કેમ આવે?

મુખ્ય કારણ આ line છે:

```swift
@State private var age = 20   // Int
```

ભલે explicit type લખેલો નથી, પણ શરૂઆતની value `20` `Int` હોવાથી compiler `age` ને `Int` તરીકે infer કરે છે.

એક વાર પ્રકાર નક્કી થઈ ગયો પછી, તેને બીજા પ્રકારની value assign કરી શકાતી નથી.

અને નોંધનીય છે કે `changeAge2` runtime માં નહીં, compile stage પર જ error આપે છે. code compile જ નહીં થાય.

આ Swift ની strong typing ની એક મોટી ખાસિયત છે: લખાણ સમયે જ type સંબંધિત સમસ્યાઓ ઝડપાઈ જાય છે.

### યોગ્ય લખાણ

ખોટો code દૂર કર્યા પછી:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

`changeAge1` button click કરતાં view update થઈને દેખાડશે:

```
age: 18
```

### explicit type declaration (વૈકલ્પિક)

અમે શરૂઆતમાં type ને સ્પષ્ટ રીતે પણ લખી શકીએ:

```swift
@State private var age: Int = 20
```

આ લખાણ type ને વધુ સ્પષ્ટ બનાવે છે, પણ સરળ પરિસ્થિતિમાં હંમેશા જરૂરી નથી.

## સારાંશ

આ પાઠમાં આપણે Swift ની type system અને actual development માં તેની ભૂમિકા શીખી.

Swift માં દરેક value નો સ્પષ્ટ પ્રકાર હોય છે, અને તે પ્રકાર data નો અર્થ તથા તે કઈ કામગીરીમાં ભાગ લઈ શકે તે નક્કી કરે છે.

Swift strongly typed છે. variable નો પ્રકાર એક વાર નક્કી થઈ જાય પછી, તેને બીજા પ્રકારની value assign કરી શકાતી નથી. આ નિયંત્રણ compile stage પર ભૂલો ઝડપે છે, runtime problems ઓછા કરે છે અને code safety વધારે છે.

variable નો પ્રકાર initial value પરથી automatically infer થઈ શકે છે અથવા explicit રીતે લખી શકાય છે. કેટલીક પરિસ્થિતિઓમાં (જેમ કે ખાલી array, inference error, custom type) compiler type સચોટ જાણી શકતો નથી, એટલે explicit declaration ફરજિયાત બને છે.

અલગ પ્રકારો વચ્ચે automatic conversion થતું નથી; `Int()`、`Double()`、`String()` જેવી રચના વડે conversion કરવું પડે છે.

type માટે alias પણ બનાવી શકાય, ખાસ કરીને મોટા projects માં તે readability વધારવામાં મદદ કરે છે.

type ફક્ત data label નથી, પરંતુ એક constraint mechanism પણ છે, જે data નો ઉપયોગ સુરક્ષિત, સ્પષ્ટ અને નિયંત્રિત રાખે છે.

## વિસ્તૃત જ્ઞાન - optional type

type conversion દરમિયાન કેટલીક operations નિષ્ફળ પણ જઈ શકે છે.

ઉદાહરણ તરીકે, `String` ને `Double` માં ફેરવવું:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

અહીં `Double(input)` નો result `Double` નથી, પરંતુ:

```
Double?
```

આને optional type કહેવામાં આવે છે.

### optional type કેમ પાછું આવે?

કારણ કે string નું content નિશ્ચિત નથી. `"3.14"` ને `Double` માં ફેરવી શકાય છે, પણ `"Hello"` ને નહીં.

અથવા, આ operation સફળ પણ થઈ શકે અને નિષ્ફળ પણ જઈ શકે.

એટલે Swift આવી અનિશ્ચિતતા બતાવવા માટે optional type વાપરે છે.

### optional type શું છે?

optional type નો અર્થ એ છે: કોઈ value હોઈ પણ શકે અને ન પણ હોઈ શકે.

ઉદાહરણ તરીકે:

```
Double?
```

આ પ્રકાર બતાવે છે કે value હોય તો print વખતે `Optional(...)` દેખાઈ શકે, અને value ન હોય તો `nil` મળશે.

નોંધ: `nil` નો અર્થ “કોઈ value નથી”, એ `0` અથવા empty string નથી.

### ઉદાહરણ

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

output:

```
pi:Optional(3.14)
```

આનો અર્થ એ છે કે string સફળતાપૂર્વક `Double` માં ફેરવાયું અને `3.14` મળ્યું, પણ કારણ કે તેનો પ્રકાર `Double?` છે, તેથી value `Optional` ની અંદર wrapped છે.

જો conversion નિષ્ફળ જાય:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

output:

```
pi: nil
```

કારણ કે `"Hello"` ને `Double` માં ફેરવી શકાય નહીં, conversion નિષ્ફળ જાય છે અને `nil` પાછું આવે છે.

### `Optional(...)` શું છે?

જ્યારે આપણે optional type ને સીધું print કરીએ:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

ત્યારે Swift તેનું “debug description” બતાવે છે:

```
Optional(3.14)
```

આ actual data નો ભાગ નથી; તે ફક્ત સૂચવે છે કે હાલની value optional type છે અને તેની અંદર એક value ઉપલબ્ધ છે.

### optional value ને unwrapping કરવું

actual development માં આપણે optional type માંથી સાચી value બહાર કાઢવી પડે છે. આ પ્રક્રિયાને unwrapping કહે છે.

એક સામાન્ય રીત `??` વડે default value આપવાની છે:

```
??
```

આને nil-coalescing operator કહે છે.

ઉદાહરણ તરીકે:

```swift
name ?? "FangJunyu"
```

આ code નો અર્થ: જો `name` માં value હોય, તો એ return કરવી; જો `nil` હોય, તો default value `"FangJunyu"` વાપરવી.

નોંધ: default value નો પ્રકાર optional type ની અંદરની value સાથે મળતો હોવો જોઈએ.

### `??` વડે default value આપવી

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)") // 30
```

output:

```
pi: 30
```

અહીં `input` સફળતાપૂર્વક `Double` માં convert થાય છે, એટલે actual value output થાય છે. જો conversion નિષ્ફળ જાય, તો `??` દ્વારા આપેલી default value output થાય છે.

જો conversion નિષ્ફળ જાય:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

output:

```
pi: 10
```

અહીં `input` ને `Double` માં convert કરતાં નિષ્ફળતા મળે છે અને `nil` મળે છે, તેથી `??` default value આપે છે.

optional type એ “value હોઈ પણ શકે અને ન પણ હોઈ શકે” એવી પરિસ્થિતિ બતાવવા માટે છે.

type conversion જેવી નિષ્ફળ જઈ શકતી operations માં Swift optional type પરત આપે છે, જેથી program વધુ સુરક્ષિત રહે.

જ્યારે આપણે actual value ની જરૂર હોય, ત્યારે `??` વડે default value આપીને `nil` ની પરિસ્થિતિમાં પણ યોગ્ય પરિણામ મેળવી શકીએ.
