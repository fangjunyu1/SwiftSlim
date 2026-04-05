# સાઇન-ઇન વ્યૂ

આ પાઠમાં, આપણે એક ખૂબ જ ઉપયોગી દૃશ્ય શીખીશું, એટલે કે સાઇન-ઇન વ્યૂ.

વેબસાઇટ હોય કે એપ, તેનો ઉપયોગ કરતી વખતે ઘણી વખત વપરાશકર્તાએ પોતાના એકાઉન્ટમાં સાઇન ઇન કરવું અને પાસવર્ડ દાખલ કરવો જરૂરી બને છે.

ઉદાહરણ તરીકે, GitHub નું સાઇન-ઇન પેજ:

![WordPress](../../Resource/019_github.png)

આ પાઠમાં, આપણે એક આવું જ સાઇન-ઇન વ્યૂ બનાવશું, જેથી વપરાશકર્તા હાથથી એકાઉન્ટ અને પાસવર્ડ દાખલ કરી શકે, અને આપણે તપાસી શકીએ કે દાખલ કરેલા કન્ટેન્ટમાં કોઈ સમસ્યા છે કે નહીં.

## ઉપરનું લેઆઉટ

અમે `ContentView` ફાઇલમાં સાઇન-ઇન વ્યૂનો કોડ લખીશું.

સૌપ્રથમ, ચાલો સાઇન-ઇન વ્યૂના ઉપરના ભાગમાં ઓળખ દર્શાવતો વિભાગ બનાવીએ. તમે પહેલાંથી એક યોગ્ય આઇકન ઇમેજ તૈયાર કરીને તેને `Assets` ફોલ્ડરમાં મૂકી શકો છો.

![icon](../../Resource/019_icon1.png)

ત્યારબાદ, `Image` અને modifiers નો ઉપયોગ કરીને ઇમેજ બતાવો:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

અહીંના આ modifiers નો અર્થ છે:

- `resizable()`: ઇમેજનું કદ બદલવાની મંજૂરી આપે છે.
- `scaledToFit()`: ઇમેજના મૂળ પ્રમાણને જાળવીને તેને સ્કેલ કરે છે.
- `frame(width: 100)`: ઇમેજની દર્શાવવાની પહોળાઈ `100` સેટ કરે છે.

આગળ, `Text` અને modifiers નો ઉપયોગ કરીને સાઇન-ઇન શીર્ષક બતાવો:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

પછી, `VStack` નો ઉપયોગ કરીને ઇમેજ અને લખાણને ઉપરથી નીચે ગોઠવો:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

પરિણામ:

![view](../../Resource/019_view.png)

અહીં સુધીમાં, આપણે સાઇન-ઇન વ્યૂના ઉપરના શીર્ષક વિભાગને પૂર્ણ કરી દીધો છે.

### લેઆઉટ ઑપ્ટિમાઇઝ કરવું

હમણાં, ઇમેજ અને શીર્ષક ડિફૉલ્ટ રીતે સમગ્ર લેઆઉટના મધ્યભાગમાં છે.

જો આપણે ઈચ્છીએ કે તે વધુ "પેજના ઉપરના ભાગમાં સાઇન-ઇન ઓળખ" જેવી લાગે, તો આપણે `Spacer()` નો ઉપયોગ કરીને બાકીનું સ્થાન ફેલાવી શકીએ, જેથી કન્ટેન્ટ ઉપરની તરફ નજીક દેખાય.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

પરિણામ:

![view](../../Resource/019_view1.png)

પણ હવે `Image` અને `Text` સ્ક્રીનના ઉપરના ભાગની ખૂબ નજીક આવી ગયા છે, એટલે થોડું ભીડભાડ ભરેલું લાગે છે.

આ સમયે, આપણે `padding` નો ઉપયોગ કરીને આખા `VStack` ને ઉપરની બાજુ થોડું અંતર આપી શકીએ.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

પરિણામ:

![view](../../Resource/019_view2.png)

આ રીતે, પેજના ઉપરના ભાગનું શીર્ષક વિભાગ વધુ યોગ્ય લાગે છે.

## યુઝરનેમ અને પાસવર્ડ

સાઇન-ઇન પેજ પર સામાન્ય રીતે વપરાશકર્તાને યુઝરનેમ અને પાસવર્ડ દાખલ કરવો પડે છે.

SwiftUI માં, આપણે `TextField` નો ઉપયોગ કરીને વપરાશકર્તા દ્વારા દાખલ કરાયેલ કન્ટેન્ટ મેળવી શકીએ.

પરંતુ એક વાત ધ્યાનમાં રાખવાની છે: `TextField` પોતે લાંબા સમય સુધી દાખલ કરેલો ડેટા સાચવી રાખતું નથી, તે માત્ર એક ઇનપુટ કંટ્રોલ છે. આ ઇનપુટ કન્ટેન્ટને સાચવે છે તે વેરિએબલ્સ છે, જેને આપણે તેની સાથે bind કરીએ છીએ.

એટલે, સૌપ્રથમ અમારે બે `@State` વેરિએબલ્સ બનાવવાની જરૂર છે, જે યુઝરનેમ અને પાસવર્ડ સાચવે:

```swift
@State private var user = ""
@State private var password = ""
```

જ્યારે `@State` વેરિએબલનું value બદલાય છે, ત્યારે SwiftUI સંબંધિત views ને આપમેળે refresh કરે છે.

ત્યારબાદ, આ બે વેરિએબલ્સને bind કરવા માટે `TextField` નો ઉપયોગ કરો:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

અહીં `$user` અને `$password` નો અર્થ "binding" છે.

એનો અર્થ એ છે કે જ્યારે વપરાશકર્તા ઇનપુટ બોક્સમાં લખે છે, ત્યારે વેરિએબલનું value પણ તે જ સમયે બદલાય છે; અને જ્યારે વેરિએબલ બદલાય છે, ત્યારે ઇનપુટ બોક્સમાં દેખાતું કન્ટેન્ટ પણ તે જ સમયે બદલાય છે.

વ્યૂ અને ડેટા "એકબીજા સાથે સિંકમાં રહે" તે સંબંધને binding કહેવામાં આવે છે.

ધ્યાન આપો કે અહીં `$` સાથેની આ લખાવટ વાપરવી પડશે:

```swift
$user
```

કારણ કે `TextField` ને સામાન્ય string નહીં, પરંતુ એવી binding value જોઈએ છે, જે "બે દિશામાં ડેટા બદલી શકે".

### ઇનપુટ બોક્સ બતાવવું

ચાલો, તેને `ContentView` માં મૂકીએ:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

દર્શાવવાનો પરિણામ:

![view](../../Resource/019_view3.png)

કારણ કે હમણાં `user` અને `password` બંને ડિફૉલ્ટ રીતે ખાલી string છે:

```swift
""
```

એટલે ઇનપુટ બોક્સમાં પહેલા placeholder લખાણ દેખાશે, ઉદાહરણ તરીકે:

```swift
input user
```

આ લખાણ માત્ર વપરાશકર્તાને "અહીં શું દાખલ કરવું જોઈએ" તે બતાવે છે, અને એ સાચું દાખલ કરેલું કન્ટેન્ટ નથી.

### ઇનપુટ બોક્સ ઑપ્ટિમાઇઝ કરવું

હવે ઇનપુટ બોક્સ ઉપયોગમાં લઈ શકાય છે, પરંતુ ડિફૉલ્ટ સ્ટાઇલ તુલનાત્મક રીતે સરળ છે.

ઇન્ટરફેસને વધુ સ્પષ્ટ બનાવવા માટે, આપણે ઇનપુટ બોક્સની આગળ શીર્ષક ઉમેરવા સાથે, ઇનપુટ બોક્સ પર થોડું સરળ સ્ટાઇલ ઑપ્ટિમાઇઝેશન કરી શકીએ.

ઉદાહરણ તરીકે, પહેલા એક શીર્ષક ઉમેરો:

```swift
Text("Username")
    .fontWeight(.bold)
```

ત્યારબાદ, `HStack` નો ઉપયોગ કરીને શીર્ષક અને ઇનપુટ બોક્સને એક જ લાઇનમાં મૂકો:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

અહીં આપણે `HStack` નો ઉપયોગ કરીએ છીએ કારણ કે આપણે "ડાબી બાજુ શીર્ષક અને જમણી બાજુ ઇનપુટ બોક્સ" બતાવવું છે.

એક વાત ધ્યાનમાં રાખવા જેવી છે કે `TextField` ડિફૉલ્ટ રીતે બાકી રહેલું ઉપલબ્ધ સ્થાન લઈ લે છે.

![color](../../Resource/019_view6.png)

બંને ઇનપુટ બોક્સનું કદ વધુ સમાન દેખાય તે માટે, આપણે `frame(width:)` નો ઉપયોગ કરીને તેની પહોળાઈ નક્કી કરી શકીએ, જેથી ઇનપુટ બોક્સ વધુ ગોઠવાયેલા લાગે.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

ત્યારબાદ, ઇનપુટ બોક્સ વધુ સ્પષ્ટ દેખાય તે માટે એક border પણ ઉમેરો:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

હવે, ચાલો યુઝરનેમ અને પાસવર્ડ બંનેને `ContentView` વ્યૂમાં ઉમેરીએ:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

દર્શાવવાનો પરિણામ:

![view](../../Resource/019_view4.png)

અહીં સુધીમાં, વપરાશકર્તા હવે યુઝરનેમ અને પાસવર્ડ દાખલ કરી શકે છે.

## સાઇન-ઇન બટન

હવે, આપણે ઇનપુટ બોક્સની નીચે એક સાઇન-ઇન બટન ઉમેરશું.

```swift
Button("Sign in") {

}
```

ત્યારબાદ, `buttonStyle` નો ઉપયોગ કરીને બટનને વધુ સ્પષ્ટ system style આપો:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

દર્શાવવાનો પરિણામ:

![view](../../Resource/019_view5.png)

બટન ખરેખર ટૅપનો પ્રતિસાદ આપે છે કે નહીં તેની ખાતરી કરવા માટે, આપણે પહેલા બટનની અંદર એક `print` લખીને ચકાસી શકીએ:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

જ્યારે બટન પર ટૅપ કરવામાં આવશે, ત્યારે console માં આ આઉટપુટ થશે:

```swift
click Sign in
```

આ બતાવે છે કે બટને સફળતાપૂર્વક ટૅપ એક્શનનો પ્રતિસાદ આપ્યો છે.

## સાઇન-ઇન લોજિક

હવે, આપણે સાઇન-ઇન બટનમાં સૌથી મૂળભૂત validation logic ઉમેરીશું: **વપરાશકર્તાએ યુઝરનેમ અને પાસવર્ડ દાખલ કર્યા છે કે નહીં તે તપાસવી**.

અમે નીચેની પરિસ્થિતિઓ હાંસલ કરવા માંગીએ છીએ:

- જો વપરાશકર્તાએ કંઈપણ દાખલ ન કર્યું હોય, તો `Empty` આઉટપુટ કરો
- જો વપરાશકર્તાએ બંનેમાંથી ફક્ત એક જ દાખલ કર્યું હોય, તો કયું બાકી છે તે જણાવો
- જો યુઝરનેમ અને પાસવર્ડ બંને દાખલ થયા હોય, તો `Success` આઉટપુટ કરો

### કોઈ માહિતી દાખલ કરવામાં આવી નથી

કારણ કે `user` અને `password` બંને ડિફૉલ્ટ રીતે ખાલી string છે:

```swift
@State private var user = ""
@State private var password = ""
```

એટલે જ્યારે વપરાશકર્તા કંઈપણ દાખલ ન કરે, ત્યારે તે હજુ પણ ખાલી જ રહેશે.

Swift માં, `String` જેવા પ્રકારો `isEmpty` નો ઉપયોગ કરીને કન્ટેન્ટ ખાલી છે કે નહીં તે નક્કી કરી શકે છે.

### isEmpty પ્રોપર્ટી

`isEmpty` નો ઉપયોગ સામાન્ય રીતે strings, arrays અને અન્ય કન્ટેન્ટ ખાલી છે કે નહીં તે ચકાસવા માટે થાય છે.

ઉદાહરણ તરીકે:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

જો કન્ટેન્ટ ખાલી હોય, તો `isEmpty` `true` રિટર્ન કરે છે; જો કન્ટેન્ટ ખાલી ન હોય, તો તે `false` રિટર્ન કરે છે.

એટલે, યુઝરનેમ અને પાસવર્ડમાં કન્ટેન્ટ છે કે નહીં તે નક્કી કરવા માટે આપણે તેનો ઉપયોગ કરી શકીએ.

### isEmpty વડે વેરિએબલ્સ તપાસવી

જો વપરાશકર્તાએ કોઈ માહિતી દાખલ ન કરી હોય, તો:

```swift
user.isEmpty // true
password.isEmpty    // true
```

આ સમયે, આપણે શરત આ રીતે લખી શકીએ:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

આ કોડનો અર્થ છે: જો `user` ખાલી હોય અને `password` પણ ખાલી હોય, તો આ આઉટપુટ કરો:

```swift
Empty
```

અહીં `&&` એક logical operator છે અને તેનો અર્થ "અને" થાય છે.

એટલે કે, આખી શરત ત્યારે જ સાચી થશે જ્યારે ડાબી બાજુની શરત સાચી હોય અને જમણી બાજુની શરત પણ સાચી હોય.

તેથી, આ કોડ ત્યારે જ ચાલશે જ્યારે યુઝરનેમ અને પાસવર્ડ બંને ખાલી હશે.

## વપરાશકર્તાએ ફક્ત એક ભાગ ભર્યો

ત્યારબાદ, ચાલો બીજી પરિસ્થિતિ વિચારીએ: વપરાશકર્તાએ ફક્ત યુઝરનેમ ભર્યો છે અથવા ફક્ત પાસવર્ડ ભર્યો છે.

ઉદાહરણ તરીકે:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

આ સમયે, યુઝરનેમ ખાલી નથી, પરંતુ પાસવર્ડ ખાલી છે.

અમે `isEmpty` નો ઉપયોગ કરીને આગળ પણ તપાસી શકીએ:

### વપરાશકર્તાએ એકાઉન્ટ અથવા પાસવર્ડ ભર્યો હોય તેવી પરિસ્થિતિ

જો વપરાશકર્તાએ ફક્ત યુઝરનેમ અથવા ફક્ત પાસવર્ડ ભર્યો હોય, તો અમારે તેના અનુરૂપ શું બાકી છે તે જણાવવું પડશે.

ઉદાહરણ તરીકે, જો વપરાશકર્તાએ ફક્ત યુઝરનેમ ભર્યો હોય:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

આ કોડની લોજિક એ છે: જો યુઝરનેમ ખાલી હોય, તો યુઝરનેમ દાખલ કરવા કહો. નહિતર, પાસવર્ડ ખાલી છે કે નહીં તે તપાસો, અને જો ખાલી હોય, તો પાસવર્ડ દાખલ કરવા કહો.

### વપરાશકર્તાએ બધી માહિતી ભરી

જો યુઝરનેમ અને પાસવર્ડ બંને પહેલાથી દાખલ થયેલા હોય, તો બંને માટે `isEmpty` `false` રિટર્ન કરશે.

આ સમયે, આપણે તેને આ રીતે લખી શકીએ:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

અહીં `!` નો અર્થ "negation" થાય છે.

ઉદાહરણ તરીકે:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

એટલે કે, `user.isEmpty` નો ઉપયોગ "યુઝરનેમ ખાલી છે કે નહીં" તે નક્કી કરવા થાય છે, જ્યારે `!user.isEmpty` નો ઉપયોગ "યુઝરનેમ ખાલી નથી" તે નક્કી કરવા થાય છે.

પાસવર્ડ માટે પણ એ જ લોજિક લાગુ પડે છે.

તેથી, આ કોડનો અર્થ છે: યુઝરનેમ ખાલી નથી, અને પાસવર્ડ પણ ખાલી નથી.

જ્યારે આ બંને શરતો સાચી હોય, ત્યારે આઉટપુટ હશે:

```swift
Success
```

## સંપૂર્ણ validation logic

હવે, ચાલો આ ત્રણેય પરિસ્થિતિઓને ભેગી કરીને `Button` માં લખીએ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

આ કોડનું execution order આ રીતે સમજાઈ શકે છે:

પહેલા પગલા તરીકે, આપણે પહેલા તપાસીએ:

```swift
if user.isEmpty && password.isEmpty
```

જો યુઝરનેમ અને પાસવર્ડ બંને ખાલી હોય, તો સીધું `Empty` આઉટપુટ થશે.

જો બંને ખાલી ન હોય, તો આપણે આ લાઇન તપાસવાનું ચાલુ રાખીએ:

```swift
else if user.isEmpty || password.isEmpty
```

અહીં `||` નો અર્થ "અથવા" થાય છે.

એટલે કે, જ્યાં સુધી એક શરત સાચી હોય, ત્યાં સુધી આખી શરત સાચી રહેશે.

તેથી, જ્યાં સુધી યુઝરનેમ ખાલી હોય અથવા પાસવર્ડ ખાલી હોય, ત્યાં સુધી `else if` નું code block ચાલશે.

કોડ બ્લોકમાં પ્રવેશ્યા પછી, કયું ઇનપુટ બોક્સ ભરાયું નથી તે વધુ સ્પષ્ટ રીતે તપાસીએ:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

જો ઉપરની બે શરતોમાંથી એક પણ સાચી ન હોય, તો તેનો અર્થ છે કે યુઝરનેમ ખાલી નથી અને પાસવર્ડ પણ ખાલી નથી.

ત્યારબાદ પ્રોગ્રામ છેલ્લાં `else` માં જશે:

```swift
print("Success")
```

આ રીતે, આપણે સાઇન-ઇન ઇનપુટ માટેની સૌથી મૂળભૂત validation logic પૂર્ણ કરી છે.

## યુઝરનેમ અને પાસવર્ડ validation

ઉપરની લોજિક ફક્ત "કંઈક દાખલ થયું છે કે નહીં" તે જ તપાસે છે.

પરંતુ વાસ્તવિક એપમાં ફક્ત કન્ટેન્ટ દાખલ કરવું પૂરતું નથી. સામાન્ય રીતે, યુઝરનેમ અને પાસવર્ડને સર્વર પર મોકલી તેની ચકાસણી પણ કરવી પડે છે.

જો સર્વર ખાતરી કરે કે યુઝરનેમ અસ્તિત્વમાં છે અને પાસવર્ડ સાચો છે, તો તે સાઇન-ઇન કરવાની પરવાનગી આપશે; નહિતર, સાઇન-ઇન નિષ્ફળ થયું છે તે જણાવી દેશે.

આ પ્રક્રિયાનો અભ્યાસ કરવા માટે, આપણે કોડમાં એક અસ્થાયી એકાઉન્ટ અને પાસવર્ડ સેટ કરી શકીએ, જેથી "સાચી સાઇન-ઇન માહિતી" નું અનુસરણ થઈ શકે:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

જ્યારે યુઝરનેમ અને પાસવર્ડ બંને ખાલી ન હોય, ત્યારે આપણે પછી તપાસીએ કે તે સાચા છે કે નહીં:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

અહીં `==` નો અર્થ "બરાબર છે કે નહીં" થાય છે.

ઉદાહરણ તરીકે:

```swift
user == userID
```

એનો અર્થ એ છે કે વપરાશકર્તાએ દાખલ કરેલો યુઝરનેમ શું આપણે સેટ કરેલા સાચા યુઝરનેમ સાથે સંપૂર્ણપણે મેળ ખાતો છે? પાસવર્ડ ચકાસણી પણ એ જ લોજિક અનુસરે છે.

તેથી, જ્યારે દાખલ કરેલો યુઝરનેમ અને પાસવર્ડ સેટ કરેલા values સાથે સરખા હોય, ત્યારે `Success` આઉટપુટ થશે; અને જ્યારે તેમાંમાંથી એક પણ સરખું ન હોય, ત્યારે `Input error` આઉટપુટ થશે.

આ રીતે, આપણે એક સરળ "mock sign-in verification" પૂર્ણ કર્યું.

જોકે આ હજી સુધી સર્વર સાથે જોડાયેલું સાચું સાઇન-ઇન ફીચર નથી, છતાં તે આપણને સમજવામાં પૂરતું મદદરૂપ છે: **બટન પર ટૅપ થયા પછી, જુદી જુદી શરતો મુજબ જુદો કોડ ચાલી શકે છે**.

## સારાંશ

આ પાઠમાં, આપણે એક મૂળભૂત સાઇન-ઇન વ્યૂ પૂર્ણ કર્યો અને ખાસ કરીને "શરતોના આધારે ઇનપુટ કન્ટેન્ટને કેવી રીતે જજ કરવું" તે લોજિક શીખ્યા.

આ પાઠનું મુખ્ય કન્ટેન્ટ છે: string ખાલી છે કે નહીં તે નક્કી કરવા માટે `isEmpty` નો ઉપયોગ, અને જુદી જુદી પરિસ્થિતિઓ હેન્ડલ કરવા માટે `if` statements સાથે logical operators નો ઉપયોગ.

આમાંથી બે ખૂબ જ મહત્વપૂર્ણ logical operators છે:

- `&&`: અર્થ "અને", બંને શરતો પૂરી થવી જોઈએ
- `||`: અર્થ "અથવા", ફક્ત એક શરત પૂરી થાય તો પણ ચાલે

જ્યારે આ શરતો આખરે `true` અથવા `false` આપે છે, ત્યારે `if` statement પરિણામ અનુસાર જુદો કોડ ચલાવે છે.

આ સાઇન-ઇન વ્યૂ દ્વારા આપણે પહેલેથી જ "ઇન્ટરફેસ + ડેટા + લોજિકલ નિર્ણય" જોડતી development રીત સાથે પરિચિત થવા લાગ્યા છીએ.

## સંપૂર્ણ કોડ

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
