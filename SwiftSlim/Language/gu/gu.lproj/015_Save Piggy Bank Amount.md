# પિગી બેંકની રકમ સાચવવી

પાછલા પાઠમાં આપણે એક સરળ “પિગી બેંક” બનાવી હતી. આ પાઠમાં આપણે શીખીશું કે “પિગી બેંક” ની રકમને કેવી રીતે persistent રીતે save કરવી.

આ પાઠમાં ખાસ કરીને `UserDefaults` અને `@AppStorage` property wrapper શીખીશું. સાથે `onAppear` નું કામ અને optional type (`nil`) નો ઉપયોગ પણ સમજશું.

નોંધ: આ પાઠ માટે પહેલાંના પાઠમાં બનાવેલી “પિગી બેંક” ની code base જ ચાલુ રાખવી પડશે.

## persistent saving ની સમસ્યા

હાલમાં “પિગી બેંક” નો interface ખૂબ જ સરળ અને ઉપયોગી છે.

![Piggy Bank](../../Resource/014_view.png)

પણ તેમાં એક સ્પષ્ટ સમસ્યા છે: જ્યારે પણ view refresh થાય અથવા app બંધ કરીને ફરી ખોલીએ, “પિગી બેંક” ની કુલ રકમ ફરી `0` થઈ જાય છે, અને જૂનો data ખોવાઈ જાય છે.

એનો અર્થ એ છે કે data વાસ્તવમાં save થઈ રહ્યો નથી. અત્યારે “પિગી બેંક” ફક્ત temporary data જ રાખી શકે છે.

### persistent save કેમ થતું નથી?

કારણ કે આપણે `@State` થી variable જાહેર કર્યું છે:

```swift
@State private var amount = 0
```

`@State` variable નો lifecycle સંપૂર્ણપણે view પર આધારિત છે.

જ્યારે view create થાય છે, ત્યારે `amount` `0` થી initialize થાય છે; view destroy થાય છે ત્યારે `amount` પણ દૂર થાય છે.

એટલે `amount` નું data ફક્ત memory માં છે, device storage માં સાચવાતું નથી.

જો આપણે ઈચ્છીએ કે `amount` view ના lifecycle થી સ્વતંત્ર રહે, તો data ને persistent રીતે save કરવું પડશે, એટલે device પર લખવું પડશે.

### “data persistence” શું છે

data persistence નો અર્થ એ છે કે data ને “temporary memory” માંથી “device storage” માં save કરવો.

તેથી view બંધ થાય કે app બંધ થાય, data ખોવાતો નથી.

Swift development માં સરળ persistence માટે `UserDefaults` વાપરી શકાય છે; વધુ જટિલ data માટે `SwiftData` અથવા `CoreData` જોઈએ.

આ પાઠમાં આપણે સૌથી સરળ `UserDefaults` થી શરૂઆત કરીશું.

## `UserDefaults`

`UserDefaults` હલકાં key-value data save કરવા માટે છે, જેમ કે `String`, `Int`, `Double`, `Bool` જેવી basic types.

### data save કરવું

`UserDefaults` માં data save કરવા માટે `set` method વપરાય છે:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

પહેલો parameter save કરાતું data છે; અહીં `String`, `Int` વગેરે છે.

બીજો parameter `forKey` એ variable name જેવી ઓળખ આપે છે, જેના દ્વારા data પછી વાંચી શકાય છે.

### data વાંચવું

`UserDefaults` માંથી value વાંચવા માટે સંબંધિત methods વપરાય છે:

```swift
let name = UserDefaults.standard.string(forKey: "name")   // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")    // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember") // true
```

વાંચતી વખતે યોગ્ય પ્રકાર માટે યોગ્ય method જ વાપરવી જોઈએ, નહીં તો error અથવા ખોટું data મળી શકે.

### `UserDefaults` બાબતે ધ્યાનમાં રાખવાની વાતો

#### 1. optional type પાછું આવે છે

`UserDefaults` માંથી data વાંચતાં કેટલીક methods optional type પરત આપે છે.

ઉદાહરણ તરીકે:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

અહીં `name` નો પ્રકાર છે:

```swift
String?
```

એનો અર્થ એ કે value હોઈ પણ શકે અને ન પણ હોઈ શકે.

**optional type કેમ મળે છે?**

કારણ કે `UserDefaults` માં કોઈ ચોક્કસ key માટે value હોવાની ખાતરી નથી.

ઉદાહરણ તરીકે:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

જો પહેલાં ક્યારેય `"City"` key માટે data save ન કર્યું હોય, તો result:

```swift
nil
```

ખાસ નોંધ: `nil` નો અર્થ “કોઈ data નથી”; એ empty string નથી.

“Type System” પાઠમાં આપણે આવું જોયું હતું: જ્યારે type conversion નિષ્ફળ જાય, ત્યારે optional type મળે છે.

એવી પરિસ્થિતિમાં `??` વડે default value આપી optional ને unwrap કરી શકાય:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

જો `UserDefaults` માં value હોય, તો એ જ વાપરાય; ન હોય (`nil`) તો default value વાપરાય.

#### 2. non-optional type પાછાં આવતાં methods

`UserDefaults` જ્યારે `Int`, `Double`, `Bool` વાંચે છે, ત્યારે non-optional value આપે છે.

ઉદાહરણ તરીકે:

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")   // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar") // false
```

ભલે આ keys માટે ક્યારેય data save ન થયું હોય, result `nil` નહીં હોય.

તે default values આપશે:

```swift
Int -> 0
Double -> 0.0
Bool -> false
```

#### 3. data ની માત્રાની મર્યાદા

`UserDefaults` ફક્ત નાનું data save કરવા યોગ્ય છે, જેમ કે app settings, simple states વગેરે.

actual development માં મોટા પ્રમાણમાં data અથવા વારંવાર read/write થતું data save કરવા માટે તે યોગ્ય નથી.

## “પિગી બેંક” ની રકમ save કરવી

હવે આપણે `UserDefaults` નો ઉપયોગ કરીને “પિગી બેંક” ની કુલ રકમ save કરવાની logic બનાવી શકીએ.

જ્યારે user button click કરે, ત્યારે દાખલ કરેલી રકમ કુલમાં ઉમેરાય અને કુલ `UserDefaults` માં save થાય:

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

હવે data write કરવાની logic પૂરી થાય છે.

## persistence logic સમજવું

ભલે write logic તૈયાર છે, actual run દરમિયાન દેખાશે કે view refresh થાય કે app ફરી ખૂલે, `amount` ફરી `0` જ થાય છે.

તેનું કારણ:

```swift
@State private var amount = 0
```

SwiftUI માં `@State` variable view create થાય ત્યારે ફરી initialize થાય છે.

એટલે `UserDefaults` માં `amount` save થયેલું હોવા છતાં, view ફરી load થાય ત્યારે `amount` ફરી `0` બની જાય છે.

એથી સમજાય છે કે હાલમાં આપણે data `UserDefaults` માં લખી રહ્યા છીએ, પણ view માં પાછું restore નથી કરી રહ્યા.

તેથી view load થાય ત્યારે `UserDefaults` માંથી value વાંચીને `amount` ને assign કરવી પડશે, ત્યારેજ સંપૂર્ણ persistence logic કામ કરશે.

### logic ને એક ઉદાહરણથી સમજવું

આ પ્રક્રિયાને “ક્લાસરૂમની બ્લેકબોર્ડ” જેવી સમજો:

વર્ગમાં શિક્ષક બ્લેકબોર્ડ પર લખે છે; આ content હાલની view state (`@State`) જેવું છે.

ક્લાસ પૂરો થાય પછી બ્લેકબોર્ડ સાફ થાય છે. આ view destroy થવા જેવું છે, એટલે `@State` data પણ દૂર થાય છે.

મહત્વનું content ખોવાઈ ન જાય તે માટે શિક્ષક તેને slides અથવા notes માં save કરે છે. આ `UserDefaults` સમાન છે.

અગલી વાર ક્લાસ શરૂ થાય ત્યારે બ્લેકબોર્ડ ખાલી હોય છે (`@State` ફરી initialize), તેથી notes જોઈને અગાઉનું content ફરી લખવું પડે (અર્થાત `UserDefaults` વાંચવું પડે).

મુખ્ય મુદ્દો એ છે કે બ્લેકબોર્ડ પોતે આપમેળે જૂનું content પાછું લાવતું નથી; “notes વાંચી ફરી લખવું” પડે છે.

## `onAppear` વડે data વાંચવું

જ્યારે view દેખાય, ત્યારે `UserDefaults` માંથી value વાંચીને `@State` ની `amount` variable ને assign કરવી જોઈએ, જેથી સાચી persistence થાય.

SwiftUI માં view દેખાય ત્યારે initialization જેવી logic ચલાવવા `onAppear` વાપરી શકાય:

```swift
.onAppear {}
```

`UserDefaults` વાંચવાનું code `onAppear` માં મૂકો:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

view create થાય ત્યારે `amount` પહેલા `0` હોય છે; view દેખાય ત્યારે `onAppear` ચાલે છે, `UserDefaults` માંથી value વાંચીને `amount` ને assign કરે છે. હવે view પાછલી saved કુલ રકમ બતાવી શકે છે.

આ સાથે “પિગી બેંક” ની persistence logic પૂર્ણ થાય છે.

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## `@AppStorage` property wrapper

SwiftUI `@AppStorage` property wrapper આપે છે, જે `UserDefaults` આધારિત saving logic ને સરળ બનાવે છે.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` મૂળભૂત રીતે `UserDefaults` પરનું wrapper છે, અને `"amount"` એ `UserDefaults` ની key છે.

જ્યારે view create થાય છે, ત્યારે તે `UserDefaults` માંથી value વાંચે છે; જ્યારે variable બદલાય છે, ત્યારે value આપમેળે `UserDefaults` માં લખાય છે.

તે SwiftUI ની state update system સાથે જોડાય છે. `@State` જેવી જ રીતે value બદલાય ત્યારે view પણ refresh થાય છે.

એટલે `@AppStorage` વડે data read અને save બન્ને આપમેળે થાય છે. હવે `UserDefaults` ને હાથેથી call કરવાની કે `onAppear` માં value વાંચવાની જરૂર રહેતી નથી.

તેથી આપણે code માં `UserDefaults` ને `@AppStorage` થી બદલી શકીએ:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## સારાંશ

આ પાઠમાં આપણે મુખ્યત્વે આ બાબતો શીખી:

સૌ પ્રથમ, `UserDefaults` હલકો data save કરવા માટે છે. આપણે કુલ રકમ device પર save કરવા માટે `UserDefaults` નો ઉપયોગ કર્યો. તે data read અને write કરવાની methods આપે છે, અને optional types જેવી બાબતોને પણ ધ્યાનમાં લેવું પડે છે.

બીજું, `@State` variables ફક્ત view ની temporary state માટે છે. તેમનો lifecycle view સાથે જોડાયેલો છે. view ફરી create થાય, ત્યારે `@State` ફરી initialize થાય છે.

પછી `UserDefaults` માંથી data restore કરવા માટે `onAppear` નો ઉપયોગ શીખ્યો, જેથી view દેખાય ત્યારે data પાછું load થઈ શકે.

છેલ્લે, `@AppStorage` વડે `UserDefaults` ની logic ને વધુ સરળ બનાવી, જેથી view load થાય ત્યારે data આપમેળે read થાય અને value બદલાય ત્યારે આપમેળે save થાય.

આ જ્ઞાન દ્વારા આપણે basic app data storage feature બનાવી શકીએ છીએ, જેથી data persistent રહે.

## પાઠ પછીનો અભ્યાસ

હવે “પિગી બેંક” માં રકમ save થવા લાગી છે, પણ feature હજી સંપૂર્ણ નથી.

1. જો user ને રકમ કાઢવી હોય, તો withdraw logic ડિઝાઇન કરવી પડશે.
2. જો user આખી રકમ clear કરવા માંગે, તો reset logic પણ ઉમેરવી પડશે.
3. જો પિગી બેંક માટે નામ ઉમેરવું હોય, તો `String` પ્રકારનું data પણ save કરવું પડશે.

આ આધાર પર તમે feature ને વધુ પૂર્ણ બનાવી શકો છો.

## વિસ્તૃત જ્ઞાન - input box ના default value ની સમસ્યા

હવે input box ની interaction ને વધુ અનુકૂળ પણ બનાવી શકાય છે.

![textfield](../../Resource/015_view.png)

હાલની implementation માં input box નું default value `0` છે. એટલે user દર વખતે નવી રકમ લખતાં પહેલાં `0` કાઢે છે, જે સારું user experience નથી.

અમે input box નું પ્રારંભિક value ખાલી રાખવું જોઈએ, `0` નહીં.

કારણ કે `TextField` અને `number` બે તરફથી bind છે:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

જ્યારે `number` `0` થી initialize થાય છે, ત્યારે input box પણ `0` બતાવે છે.

એટલે `number` ને empty value, એટલે `nil`, બનાવવું પડશે.

```swift
@State private var number = nil
```

અહીં error આવશે:

```
Generic parameter 'Value' could not be inferred
```

આ “Type System” પાઠમાં સમજાવેલી જ પરિસ્થિતિ છે: જ્યારે variable નો type compiler આપમેળે જાણી શકતો નથી, ત્યારે explicit type લખવો પડે.

કારણ કે `number` ને `nil` આપવામાં આવ્યું છે, અને `nil` માં પોતે type information નથી, compiler જાણી શકતો નથી કે variable `String` છે, `Int` છે કે કંઈ બીજું.

એટલે `number` માટે explicit type લખવું પડે:

```swift
@State private var number:Int? = nil
```

અહીં `Int?` optional type છે. એટલે `number` માં `Int` value પણ હોઈ શકે અથવા `nil` પણ હોઈ શકે.

હવે initialization સમયે તેને `nil` આપવાથી input box ખાલી દેખાશે, `0` નહીં.

### optional type ને unwrap કરવું

જ્યારે `number` optional type બને છે, ત્યારે જૂનું calculation code error આપે છે:

```swift
amount += number
```

error:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

કારણ કે `number` હવે `nil` પણ હોઈ શકે છે. જો તેને સીધું ગણતરીમાં વાપરીએ, તો એ જાણે:

```swift
amount += nil
```

જે માન્ય નથી.

એટલે optional type ને ગણતરીમાં વાપરતાં પહેલાં unwrap કરવું પડે.

અહીં `??` વડે default value આપી શકાય:

```swift
amount += number ?? 0
```

જો `number` `nil` હોય, તો default તરીકે `0` વપરાય; જો value હોય, તો actual input value વપરાય.

આથી ગણતરી સાચી રહે છે અને input box default માં ખાલી પણ રહે છે.

## વિસ્તૃત code

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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
