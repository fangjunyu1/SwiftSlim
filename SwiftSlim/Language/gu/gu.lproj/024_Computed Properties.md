# કમ્પ્યુટેડ પ્રોપર્ટીઝ

આ પાઠમાં આપણે મુખ્યત્વે કમ્પ્યુટેડ પ્રોપર્ટીઝ શીખીશું.

કમ્પ્યુટેડ પ્રોપર્ટીઝનો ઉપયોગ હાજર ડેટાના આધારે નવું પરિણામ ગણવા માટે થાય છે. તે સંખ્યાત્મક મૂલ્યો ગણાવી શકે છે, અને SwiftUI views માં બતાવવાની સામગ્રી પણ ગણાવી શકે છે.

ઉદાહરણ તરીકે:

```swift
let a = 10
let b = 20
let c = a + b
```

અહીં `c` એટલે `a` અને `b` ઉમેર્યા પછીનું પરિણામ.

સામાન્ય કોડમાં, આ પ્રકારનું લખાણ ખૂબ સામાન્ય છે.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

ટિપ: `Button` ના tap event માં સામાન્ય Swift કોડ ચલાવી શકાય છે.

પરંતુ જો આવો જ કોડ સીધો SwiftUI view ની properties માં લખીએ, તો સમસ્યા આવશે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

આ કોડ ભૂલ આપશે.

એવું લાગે છે કે `a` અને `b` પહેલેથી `c` પહેલાં લખાયેલા છે, એટલે `c` નું મૂલ્ય ગણાવી શકાય તેમ લાગે છે.

પરંતુ structure ની property declarations માં, આ રીતે સીધું લખી શકાતું નથી.

## c સીધું a + b કેમ ગણાવી શકતું નથી

કારણ કે `a`, `b`, અને `c` button tap event માંના temporary constants નથી, પરંતુ `ContentView` view ની properties છે.

button tap event માં આ કોડ સામાન્ય રીતે ચાલી શકે છે:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

કારણ કે button tap થયા પછી કોડ ક્રમમાં ચાલે છે. પહેલા `a` બનાવાય છે, પછી `b` બનાવાય છે, અને અંતે `a + b` થી `c` ગણાય છે.

પરંતુ view ની અંદર properties declare કરતી વખતે સ્થિતિ અલગ હોય છે:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

અહીં `a`, `b`, અને `c` બધી `ContentView` view ની properties છે.

`ContentView` view બનાવતી વખતે Swift ને પહેલા આ properties તૈયાર કરવી પડે છે. બનાવવાની પ્રક્રિયા સુરક્ષિત રહે તે માટે, Swift એક instance stored property ના default value ને એ જ instance ની અન્ય instance properties સીધી વાંચવાની મંજૂરી આપતું નથી.

તેથી આ લાઇન ભૂલ આપશે:

```swift
let c = a + b
```

સરળ રીતે સમજીએ તો: **view ની અંદર properties declare કરતી વખતે, એક ordinary property નો ઉપયોગ સીધો બીજી ordinary property ગણવા માટે કરી શકાતો નથી.**

જે property સીધું મૂલ્ય સાચવે છે તેને "stored property" કહેવામાં આવે છે. સમજવામાં સરળતા રહે તે માટે, હાલ માટે તેને ordinary property તરીકે પણ સમજી શકાય.

ઉદાહરણ તરીકે:

```swift
let a = 10
```

`a` `10` સાચવે છે.

```swift
let b = 20
```

`b` `20` સાચવે છે.

પરંતુ:

```swift
let c = a + b
```

અહીં `c` સીધું લખાયેલું મૂલ્ય નથી, પરંતુ આપણે તેને `a + b` દ્વારા ગણાવવા માંગીએ છીએ.

આવી "હાજર ડેટાના આધારે પરિણામ મેળવવાની" સ્થિતિ માટે computed property વધુ યોગ્ય છે.

આ રીતે બદલાવી શકાય:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

અહીં `c` computed property છે.

```swift
var c: Int {
    return a + b
}
```

તેનો અર્થ છે: **જ્યારે `c` વાપરવાની જરૂર પડે, ત્યારે `a` અને `b` વાંચો અને `a + b` નું પરિણામ return કરો.**

ઉદાહરણ તરીકે:

```swift
Text("c: \(c)")
```

જ્યારે `Text` `c` બતાવે છે, ત્યારે જ `c` ની ગણતરી શરૂ થાય છે.

## computed property શું છે?

computed property variable જેવી લાગે છે, પરંતુ તે પોતે ડેટા સાચવતી નથી.

ઉદાહરણ તરીકે:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

અહીં `c` computed property છે.

તે ordinary property ની જેમ કોઈ fixed value સાચવતી નથી, પરંતુ જ્યારે પણ `c` વાંચવામાં આવે છે, ત્યારે `{}` ની અંદરનો કોડ ફરી ચલાવે છે અને ગણતરીનું પરિણામ return કરે છે.

આ રીતે સમજી શકાય:

```swift
var c: Int {
    return a + b
}
```

જ્યારે `c` વાપરવાની જરૂર પડે, ત્યારે `a + b` ગણવામાં આવે છે.

તેથી computed property આ સ્થિતિ માટે યોગ્ય છે: **એક પરિણામને અલગથી સાચવવાની જરૂર નથી, કારણ કે તે હાજર ડેટાથી ગણાવી શકાય છે.**

## મૂળભૂત લખાણ

computed property સામાન્ય રીતે ત્રણ ભાગો ધરાવે છે:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` વડે declare કરવું

```swift
var c
```

computed property ને `var` વડે જ declare કરવી પડે છે; `let` વાપરી શકાતું નથી.

કારણ કે computed property કોઈ fixed stored value નથી, પરંતુ દર વખત વાંચવામાં આવે ત્યારે dynamically ગણાતું પરિણામ છે.

### 2. return type દર્શાવવો

```swift
var c: Int
```

computed property ને તેનો return type દર્શાવવો પડે છે.

અહીં `c` અંતે integer return કરશે, તેથી type `Int` છે.

### 3. ગણતરીની logic લખવા {} વાપરવું

```swift
{
    return a + b
}
```

`{}` ની અંદર ગણતરીની logic લખાય છે; અહીં `a + b` return થાય છે.

## return keyword

computed property ને પરિણામ return કરવું પડે છે.

ઉદાહરણ તરીકે:

```swift
var c: Int {
    return a + b
}
```

અહીં `return` નો અર્થ છે: `a + b` ની ગણતરીનું પરિણામ બહાર return કરો.

જો computed property માં ફક્ત એક expression હોય જે સીધું પરિણામ આપે છે, તો `return` છોડી શકાય:

```swift
var c: Int {
    a + b
}
```

પરંતુ જો computed property માં અનેક લાઇનોનો કોડ હોય, તો પરિણામ સ્પષ્ટ રીતે return કરવા `return` વાપરવું પડે છે.

ઉદાહરણ તરીકે:

```swift
var totalPriceText: String {
    let total = count * price
    return "કુલ: \(total) $"
}
```

અહીં ગણતરીની પ્રક્રિયા બે પગલાંમાં વહેંચાય છે.

પહેલું પગલું, પહેલા કુલ કિંમત ગણવી:

```swift
let total = count * price
```

બીજું પગલું, કુલ કિંમતને text માં જોડીને return કરવી:

```swift
return "કુલ: \(total) $"
```

જો `return` કાઢી નાખીએ:

```swift
var totalPriceText: String {
    let total = count * price
    "કુલ: \(total) $"
}
```

આ કોડ ભૂલ આપશે.

કારણ છે: **આ computed property માં પહેલેથી અનેક લાઇનોનો કોડ છે, અને Swift હવે આપોઆપ નક્કી કરી શકતું નથી કે કઈ લાઇન અંતિમ return થતું પરિણામ છે.**

તેથી, computed property માં ફક્ત એક result line હોય ત્યારે `return` છોડી શકાય.

```swift
var c: Int {
    a + b
}
```

computed property માં અનેક લાઇનોનો કોડ હોય ત્યારે `return` સ્પષ્ટ રીતે લખવાની ભલામણ છે.

```swift
var totalPriceText: String {
    let total = count * price
    return "કુલ: \(total) $"
}
```

## computed property અને ordinary property નો ફરક

ordinary property ડેટા સાચવે છે.

```swift
var c = 30
```

અહીં `c` એક ચોક્કસ મૂલ્ય સાચવે છે: `30`.

computed property ડેટા સાચવતી નથી.

```swift
var c: Int {
    a + b
}
```

અહીં `c` `30` સાચવતી નથી. તે માત્ર ગણતરી કરવાની રીત આપે છે.

જ્યારે `c` વાંચવામાં આવે છે, ત્યારે Swift ચલાવે છે:

```swift
a + b
```

પછી ગણતરીનું પરિણામ return કરે છે.

તેથી computed properties તે સ્થિતિઓ માટે યોગ્ય છે જ્યાં પરિણામ બીજા ડેટાથી ગણવામાં આવે છે.

## body પણ computed property છે

computed properties શીખ્યા પછી, આપણે SwiftUI માં સૌથી સામાન્ય કોડને ફરી સમજી શકીએ છીએ:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

અહીં `body` પણ computed property છે.

તે `var` વડે declare થાય છે:

```swift
var body
```

તેમાં return type છે:

```swift
some View
```

તેના `{}` માં SwiftUI view content return થાય છે:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

તેથી `body` ને આ રીતે સમજી શકાય: જ્યારે SwiftUI ને આ view બતાવવાની જરૂર પડે છે, ત્યારે તે `body` વાંચે છે અને `body` જે content return કરે છે તેના આધારે interface બનાવે છે.

જો `return` લખીએ, તો તેને આ રીતે સમજાવી શકાય:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

પરંતુ SwiftUI માં આપણે સામાન્ય રીતે `return` છોડીને સીધું લખીએ છીએ:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

જ્યારે `@State` data બદલાય છે, ત્યારે SwiftUI ફરી `body` વાંચે છે અને નવા data અનુસાર interface update કરે છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("ગણતરી: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

button tap કર્યા પછી `count` બદલાય છે.

```swift
count += 1
```

`count` બદલાયા પછી SwiftUI `body` ફરી ગણાવે છે, તેથી interface માંનો text પણ update થાય છે.

```swift
Text("ગણતરી: \(count)")
```

આ પણ એ કારણ છે કે SwiftUI માં data બદલાયા પછી interface આપોઆપ refresh થઈ શકે છે.

### body માં complex calculations લખવાની ભલામણ નથી

કારણ કે `body` computed property છે, તે અનેક વાર વાંચાઈ અને ફરી ગણાઈ શકે છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("નંબર: \(num)")
            Text("નામ: \(name)")
        }
    }
}
```

જ્યારે `name` બદલાય છે, ત્યારે SwiftUI `body` ફરી ગણાવે છે.

આ સમયે `body` ની અંદરનો કોડ પણ ફરી ચાલે છે, અને `num` પણ ફરી બનાવાય છે.

```swift
let num = 10
```

આ ઉદાહરણમાં `num` ખૂબ સરળ છે, તેથી અસર મોટી નથી.

પરંતુ જો `body` માં complex calculations ચાલે, જેમ કે મોટા પ્રમાણમાં data filter કરવો, sort કરવો, image processing કરવી વગેરે, તો interface ની smoothness પર અસર થઈ શકે છે.

તેથી SwiftUI માં `body` મુખ્યત્વે interface structure વર્ણવવા માટે જવાબદાર હોવું જોઈએ.

સરળ temporary data `body` ની અંદર લખી શકાય છે.

complex calculations ને `body` બહારની computed properties, methods, અથવા અલગ data processing માં રાખી શકાય છે.

## ઉદાહરણ: માત્રા અને કુલ કિંમત

હવે એક સરળ ઉદાહરણ દ્વારા computed properties સમજીએ.

ધારો કે એક ગાજરની unit price 2 $ છે, user buttons tap કરીને ખરીદીની માત્રા બદલી શકે છે, અને interface ને કુલ કિંમત બતાવવી છે.

કુલ કિંમત ગણવાની રીત:

```
માત્રા * unit price
```

જો કુલ કિંમત સાચવવા ordinary variable વાપરીએ, તો થોડું મુશ્કેલ બનશે.

કારણ કે દર વખતે માત્રા બદલાય ત્યારે કુલ કિંમત manually update કરવી પડશે.

સારી રીત computed property વાપરવાની છે:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("કિંમત: \(price) $")
                Text("માત્રા: \(count)")
                Text("કુલ કિંમત: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

display result:

![view](../../Resource/024_view.png)

આ ઉદાહરણમાં:

```swift
@State private var count = 1
```

`count` ગાજરની માત્રા દર્શાવે છે. button tap કરતી વખતે `count` બદલાય છે.

```swift
private let price = 2
```

`price` ગાજરની unit price દર્શાવે છે. અહીં fixed value છે, તેથી `let` વપરાય છે.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` કુલ કિંમત દર્શાવે છે.

તેને અલગથી સાચવવાની જરૂર નથી, કારણ કે કુલ કિંમત હંમેશા `count * price` થી ગણાવી શકાય છે.

જ્યારે `count` `1` હોય:

```swift
totalPrice = 1 * 2
```

બતાવાતું પરિણામ છે:

```swift
કુલ કિંમત: 2 $
```

`+` button tap કર્યા પછી `count` `2` બને છે.

આ સમયે `totalPrice` ફરી વાંચીએ, તો તે ફરી ગણાશે:

```swift
totalPrice = 2 * 2
```

બતાવાતું પરિણામ છે:

```swift
કુલ કિંમત: 4 $
```

આ computed property નું કામ છે: હાજર data ના આધારે dynamic રીતે નવું પરિણામ ગણવું.

## computed properties નો ઉપયોગ checks માટે કરી શકાય છે

computed properties ફક્ત numerical values જ નહીં, check results પણ return કરી શકે છે.

ઉદાહરણ તરીકે, જ્યારે આપણે minimum quantity 1 રાખવા માંગીએ છીએ.

જ્યારે quantity પહેલેથી 1 હોય, ત્યારે `-` button વધુ ઘટાડવો જોઈએ નહીં.

અમે computed property ઉમેરી શકીએ:

```swift
private var canDecrease: Bool {
    count > 1
}
```

પૂર્ણ કોડ:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("કિંમત: \(price) $")
                Text("માત્રા: \(count)")
                Text("કુલ કિંમત: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

display result:

![view](../../Resource/024_view1.png)

અહીં:

```swift
private var canDecrease: Bool {
    count > 1
}
```

આ કોડ દર્શાવે છે કે હાલમાં ઘટાડવું શક્ય છે કે નહીં.

જ્યારે `count` `1` કરતાં મોટું હોય:

```swift
canDecrease == true
```

એનો અર્થ ઘટાડવું શક્ય છે.

જ્યારે `count` `1` બરાબર હોય:

```swift
canDecrease == false
```

એનો અર્થ હવે વધુ ઘટાડવું શક્ય નથી.

### button માં condition check

button માં વપરાય છે:

```swift
if canDecrease {
    count -= 1
}
```

માત્ર `canDecrease` `true` હોય ત્યારે જ `count` ઘટાડાઈ શકે છે.

### view નો foreground color control કરવો

અમે `canDecrease` વડે button નો foreground color પણ control કરી શકીએ:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

અહીં ternary operator વપરાયો છે:

```swift
canDecrease ? Color.primary : Color.gray
```

આ કોડનો અર્થ છે: જો `canDecrease` `true` હોય, તો foreground color તરીકે `Color.primary` વાપરો; જો `canDecrease` `false` હોય, તો `Color.gray` વાપરો.

`Color.primary` SwiftUI દ્વારા આપવામાં આવતો system semantic color છે. તે હાલના interface માં મુખ્ય text color દર્શાવે છે.

light mode માં `Color.primary` સામાન્ય રીતે black નજીક હોય છે; dark mode માં `Color.primary` સામાન્ય રીતે white નજીક હોય છે.

તેથી `Color.primary` વાપરવાનો ફાયદો એ છે કે તે light mode અને dark mode સાથે આપોઆપ અનુકૂળ થઈ જાય છે.

### view ની disabled state control કરવી

`disabled` નો ઉપયોગ view disabled state માં છે કે નહીં તે control કરવા થાય છે:

```swift
.disabled(!canDecrease)
```

જ્યારે `disabled` `false` હોય, ત્યારે view tap કરી શકાય છે.

જ્યારે `disabled` `true` હોય, ત્યારે view disabled હોય છે અને tap કરી શકાતું નથી.

અહીં condition તરીકે `canDecrease` વાપરવાથી કોડ વધુ સરળતાથી સમજાય છે.

`canDecrease` જોતા જ સમજાય છે કે તેનો અર્થ "હમણાં આગળ ઘટાડવું શક્ય છે કે નહીં" છે.

### વધારાની નોંધ: બે check કેમ છે?

`-` button માં:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

અહીં `.disabled(!canDecrease)` પણ વપરાય છે, અને button ની અંદર `if canDecrease` પણ વપરાય છે.

`.disabled(!canDecrease)` interface માં button ને disabled કરવાની જવાબદારી લે છે, જેથી user તેને tap ન કરી શકે.

`if canDecrease` કોડ ચલાવતાં પહેલાં ફરી check કરવાની જવાબદારી લે છે. તે `count -= 1` ફક્ત ઘટાડવાની મંજૂરી હોય ત્યારે ચલાવે છે.

આ double protection છે. વાસ્તવિક development માં, જો button પહેલેથી disabled હોય, તો અંદરનો check છોડાઈ શકે છે. પરંતુ teaching example માં તેને રાખવાથી `canDecrease` ની ભૂમિકા વધુ સ્પષ્ટ થાય છે.

## સારાંશ

આ પાઠમાં આપણે મુખ્યત્વે computed properties શીખી.

computed property value સીધી સાચવતી નથી. તેના બદલે, જ્યારે તે વાંચવામાં આવે છે, ત્યારે હાજર data પરથી પરિણામ ગણાવે છે.

ઉદાહરણ તરીકે:

```swift
var c: Int {
    a + b
}
```

અહીં `c` ને અલગથી સાચવવાની જરૂર નથી, કારણ કે તે `a + b` દ્વારા ગણાવી શકાય છે.

computed property ને `var` વડે declare કરવી જ પડે છે, અને તેને return type દર્શાવવો પડે છે.

```swift
var canDecrease: Bool {
    count > 1
}
```

computed properties માત્ર numerical values જ નહીં, check results, text content, અને SwiftUI view content પણ return કરી શકે છે.

આ પાઠમાં આપણે `return` પણ શીખ્યું.

`return` એટલે પરિણામ return કરવું:

```swift
var totalPriceText: String {
    let total = count * price
    return "કુલ: \(total) $"
}
```

જો computed property માં ફક્ત એક expression હોય જે સીધું પરિણામ આપે છે, તો `return` છોડી શકાય.

```swift
var totalPrice: Int {
    count * price
}
```

આ ઉપરાંત, આપણે `Color.primary` અને `disabled` વિશે પણ જાણ્યું.

`Color.primary` SwiftUI નો system semantic color છે. તે light mode અને dark mode અનુસાર display effect આપોઆપ adjust કરે છે.

```swift
.foregroundStyle(Color.primary)
```

`disabled` નો ઉપયોગ view disabled છે કે નહીં તે control કરવા થાય છે.

```swift
.disabled(true)
```

એનો અર્થ disabled, tap કરી શકાતું નથી.

```swift
.disabled(false)
```

એનો અર્થ available, tap કરી શકાય છે.

તેથી computed properties SwiftUI માં ખૂબ સામાન્ય છે. તે calculation results, check conditions, અને displayed content ને વધુ સ્પષ્ટ રીતે ગોઠવવામાં મદદ કરે છે.
