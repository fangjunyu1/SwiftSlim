# લોગિન ઇન્ટરૅક્શન

પાછલા પાઠમાં, અમે એક લોગિન વ્યૂ બનાવ્યો હતો અને બટનો તથા નિણય લોજિક દ્વારા ઇનપુટ સામગ્રીની સરળ ચકાસણી અમલમાં મૂકી હતી.

આ પાઠમાં, અમે ગયા પાઠના કોડને આધાર બનાવીને `SecureField` પાસવર્ડ ઇનપુટ બોક્સ, `Alert` ચેતવણી બોક્સ, તેમજ વેરિયેબલ્સ અનુસાર જુદા જુદા વ્યૂ કેવી રીતે દર્શાવવા તે શીખીશું.

આ પાઠ દ્વારા, તમે લોગિન વ્યૂના મૂળભૂત ઇન્ટરૅક્શન પ્રવાહને વધુ સારી રીતે સમજી શકશો, અને આ ઘણા એપ્સમાં ઉપયોગ થતી એક મૂળભૂત લોજિક પણ છે.

## પાસવર્ડ ઇનપુટ બોક્સ

ગયા પાઠમાં, અમે પાસવર્ડ દાખલ કરવા માટે `TextField` નો ઉપયોગ કર્યો હતો.

પરંતુ વાસ્તવિક લોગિન ઇન્ટરફેસમાં, પાસવર્ડ સામાન્ય રીતે સીધો દેખાતો નથી; તે બિંદુઓ અથવા અન્ય છુપાયેલા અસર તરીકે દેખાય છે, જેથી વપરાશકર્તાની ગોપનીયતા સુરક્ષિત રહે.

SwiftUI માં, પાસવર્ડ દાખલ કરવા માટે ખાસ બનાવાયેલ કંટ્રોલ `SecureField` છે.

ઉદાહરણ તરીકે:

```swift
SecureField("Password", text: $password)
```

તેનું લખાણ `TextField` જેવું જ છે, અને તેમાં પણ એક સૂચનાત્મક લખાણ તેમજ એક બાઉન્ડ વેરિયેબલ જોઈએ.

સરળ શબ્દોમાં કહીએ તો: `SecureField` પણ એક ઇનપુટ બોક્સ છે, ફક્ત તે દાખલ કરેલી સામગ્રીને છુપાવે છે.

અમે પહેલાથી પાસવર્ડ દાખલ કરવા માટે ઉપયોગમાં લેવાતા `TextField` ને સીધું `SecureField` માં બદલી શકીએ:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

જ્યારે વપરાશકર્તા પાસવર્ડ દાખલ કરશે, ત્યારે સ્ક્રીન પર પાસવર્ડની સામગ્રી સીધી દેખાશે નહીં.

દર્શાવાનો અસર:

![password](../../Resource/020_password.png)

હવે, અમે યુઝરનેમ અને પાસવર્ડ દાખલ કરી શકીએ છીએ અને બટન પર ક્લિક કર્યા પછી નક્કી કરી શકીએ છીએ કે ઇનપુટ સાચું છે કે નહીં.

### પ્રતિસાદ સંદેશો બતાવવું

પહેલાં અમે સતત પરિણામો બતાવવા માટે `print` નો ઉપયોગ કરતા હતા.

`print` નું સામગ્રી ફક્ત કન્સોલમાં જ દેખાય છે. ડેવલપર Xcode માં પ્રોગ્રામ ચલાવતી વખતે તેને જોઈ શકે છે, પરંતુ સામાન્ય વપરાશકર્તાઓ ફોન પર આ સંદેશાઓ જોઈ શકતા નથી.

એનો અર્થ એ છે કે, ભલે પ્રોગ્રામ ચકાસણી પૂર્ણ કરી ચૂક્યું હોય, વપરાશકર્તા હજુ જાણતા નથી કે દાખલ કરેલું સામગ્રી યોગ્ય છે કે નહીં.

આ સમયે, અમને એવી રીત જોઈએ કે જે સીધી ઇન્ટરફેસ પર સંદેશો બતાવી શકે.

## Alert ચેતવણી બોક્સ

SwiftUI માં, અમે `Alert` નો ઉપયોગ કરીને પોપ-અપ સંદેશ બોક્સ બતાવી શકીએ છીએ.

મૂળભૂત ઉપયોગ:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

આ કોડ આગળના કંટ્રોલ કરતાં થોડો વધુ જટિલ લાગે છે, પણ આપણે તેને ભાગોમાં વિભાજિત કરીને સમજી શકીએ.

`Alert` મુખ્યત્વે નીચેના ભાગો ધરાવે છે:

- `"Title"`: ચેતવણી બોક્સનું શીર્ષક
- `isPresented`: એક બાઉન્ડ Boolean મૂલ્ય, જે ચેતવણી બોક્સ દેખાડવો કે નહીં તે નિયંત્રિત કરે છે
- `Button(...)`: ચેતવણી બોક્સનું બટન
- `message:`: ચેતવણી બોક્સમાં દર્શાવાતો સંદેશાનો સામગ્રી

સરળ રીતે સમજીએ તો, જ્યારે બાઉન્ડ વેરિયેબલ `true` બને છે, ત્યારે સિસ્ટમ આ ચેતવણી બોક્સ પોપ અપ કરશે.

દર્શાવાનો અસર:

![alert](../../Resource/020_alert3.png)

સંબંધિત રચના:

![alert](../../Resource/020_alert.png)

### Alert એક મોડિફાયર છે

જેમ ઘણા મોડિફાયર્સ આપણે પહેલાં શીખ્યા છીએ, તેમ `Alert` પણ કોઈ ચોક્કસ વ્યૂ પછી ઉમેરવામાં આવે છે.

ઉદાહરણ તરીકે, તે બટન પછી લગાવી શકાય:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

તે બહારના `VStack` પછી પણ લગાવી શકાય:

```swift
VStack {
    // ...
}
.alert() {...}
```

અર્થાત્, `Alert` ઇન્ટરફેસમાં અલગથી મૂકાયેલ સ્વતંત્ર વ્યૂ નથી, પરંતુ કોઈ ચોક્કસ વ્યૂ સાથે જોડાયેલ એક મોડિફાયર છે.

સરળ રીતે સમજીએ તો, `Alert` સામાન્ય રીતે બટન અથવા બહારના layout પછી લખાય છે, જેથી કોઈ ચોક્કસ શરત પૂર્ણ થાય ત્યારે સંદેશો પોપ અપ થાય.

### Alert બતાવવું

જો આપણે `Alert` બતાવવું હોય, તો તેને નિયંત્રિત કરવા માટે એક વેરિયેબલ જોઈએ.

ઉદાહરણ તરીકે:

```swift
@State private var showAlert = false
```

આ વેરિયેબલ `Bool` પ્રકારનું છે, એટલે તેમાં માત્ર બે મૂલ્યો હોય છે: `true` અથવા `false`.

પછી તેને `Alert` ના `isPresented` સાથે બાંધીએ:

```swift
isPresented: $showAlert
```

જ્યારે `showAlert` `false` હોય, ત્યારે ચેતવણી બોક્સ દેખાશે નહીં; જ્યારે `showAlert` `true` હોય, ત્યારે ચેતવણી બોક્સ દેખાશે.

### બટન દ્વારા ચેતવણી બોક્સ બતાવવું

હવે, ચાલો સૌથી સરળ પરિસ્થિતિ અમલમાં મૂકીએ:

જ્યારે વપરાશકર્તા કશું જ દાખલ ન કરે અને સીધો `Sign in` બટન ક્લિક કરે, ત્યારે એક સંદેશ બોક્સ પોપ અપ થાય અને તેને કહે: “તમે હજી સુધી કોઈ સામગ્રી દાખલ કરી નથી.”

સૌ પ્રથમ, આ સંદેશ બોક્સને નિયંત્રિત કરવા માટે એક વેરિયેબલ બનાવો:

```swift
@State private var showEmpty = false
```

પછી, `Button` પાછળ એક `Alert` ઉમેરો:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

પછી, બટન ક્લિક કોડમાં શરત ચકાસો:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

જો `user` અને `password` બન્ને ખાલી હોય, તો આપણે `showEmpty` ને `true` કરી દઈએ.

અને કારણ કે `Alert` આ વેરિયેબલ સાથે બાઉન્ડ છે, જ્યારે તે `true` બને છે, ત્યારે સિસ્ટમ આપમેળે ચેતવણી બોક્સ બતાવશે.

દર્શાવાનો અસર:

![alert](../../Resource/020_alert1.png)

આ રીતે, વપરાશકર્તા બટન ક્લિક કર્યા પછી તરત જ સંદેશ જોઈ શકશે, અને ડેવલપરને `print` નું આઉટપુટ જોવા માટે કન્સોલમાં જવું નહીં પડે.

### બટન અને ચેતવણી બોક્સને વધુ પૂર્ણ બનાવવું

પહેલાં, અમે ફક્ત “કશું જ ભરાયું નથી” એવી પરિસ્થિતિ સંભાળી હતી.

હવે અમને નીચેની પરિસ્થિતિઓ પણ સંભાળવી પડશે:

- યુઝરનેમ ભરાયું નથી
- પાસવર્ડ ભરાયો નથી
- યુઝરનેમ અને પાસવર્ડ બન્ને ભરાયેલા છે, પણ ઇનપુટ ખોટું છે

તેથી, આ પરિસ્થિતિઓ માટે પણ અનુરૂપ સંદેશા તૈયાર કરવાની જરૂર છે.

સૌ પ્રથમ, ત્રણ નવા વેરિયેબલ ઉમેરો:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

પછી બટન પાછળ અનુરૂપ `Alert` ઉમેરતા જાઓ:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

આગળ, બટનની અંદરની નિર્ણય લોજિક પૂર્ણ કરો:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

જ્યારે બટન નક્કી કરે છે કે વપરાશકર્તાએ કોઈ માહિતી ભરી નથી, એક માહિતી છોડી દીધી છે, અથવા ઇનપુટ વૅલિડેશન નિષ્ફળ ગયું છે, ત્યારે તે અનુરૂપ Boolean વેરિયેબલને `true` માં બદલી દેશે, અને પછી અનુરૂપ `Alert` પોપ અપ થશે.

અહીં હું ભલામણ કરું છું કે તમે કેટલીક પરિસ્થિતિઓ જાતે ટેસ્ટ કરો:

- કશું જ ન ભરો
- ફક્ત યુઝરનેમ ભરો
- ફક્ત પાસવર્ડ ભરો
- યુઝરનેમ અને પાસવર્ડ બન્ને ભરો, પરંતુ ખોટી સામગ્રી સાથે
- યુઝરનેમ અને પાસવર્ડ બન્ને ભરો, અને સામગ્રી સાચી હોય

આથી આપણે ચકાસી શકીએ કે આપણા કોડમાં કોઈ સમસ્યા છે કે નહીં. આ એપ ડેવલપમેન્ટમાં ખૂબ જ મહત્વનો “ટેસ્ટિંગ” પગલું પણ છે.

જો કોઈ ચોક્કસ પરિસ્થિતિમાં પ્રોગ્રામ ખોટું વર્તન કરે, તો તેનો અર્થ એ છે કે લોજિકમાં સમસ્યા હોઈ શકે છે અને પ્રોગ્રામમાં `Bug` આવ્યો છે.

ડેવલપમેન્ટમાં જેને આપણે ઘણીવાર `Bug` કહીએ છીએ, તે ભૂલ, ખામી અથવા અપેક્ષા મુજબ ન હોતા વર્તનને સૂચવે છે.

## લોગિન વ્યૂ પૂર્ણ કરવું

પહેલાં ઉલ્લેખ કરેલા `Alert` બધા જ “ઇનપુટ ખોટું હોય” ત્યારે વપરાશકર્તાને સંદેશ આપવા વિશે હતા.

જ્યારે વપરાશકર્તા યોગ્ય યુઝરનેમ અને પાસવર્ડ દાખલ કરે છે, ત્યારે અમે સામાન્ય રીતે “ચેતવણી બોક્સ” પોપ અપ કરતા નથી; બદલે સીધા લોગિન પછીની ઇન્ટરફેસમાં પ્રવેશીએ છીએ.

અહીં એક ખૂબ જ મહત્વપૂર્ણ મુદ્દો છે: **વેરિયેબલના મૂલ્ય અનુસાર જુદા જુદા વ્યૂ દર્શાવવું.**

ઉદાહરણ તરીકે:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

અહીં અમે વ્યૂનું પ્રદર્શન સંચાલિત કરવા માટે `Bool` પ્રકારનો ઉપયોગ કરીએ છીએ:

- જો `login` `true` હોય, તો તેનો અર્થ એ છે કે લોગિન સફળ થયું છે અને લોગિન પછીનું સામગ્રી દર્શાવવામાં આવે છે
- જો `login` `false` હોય, તો તેનો અર્થ એ છે કે લોગિન સફળ થયું નથી અને લોગિન ઇન્ટરફેસ બતાવાતું રહે છે.

જોકે `if` સ્ટેટમેન્ટ Swift માં એક કન્ડિશનલ સ્ટેટમેન્ટ છે, SwiftUI ના `body` માં તેનો ઉપયોગ વ્યૂના પ્રદર્શન લોજિકને નિયંત્રિત કરવા માટે થઈ શકે છે.

એનો અર્થ એ છે કે SwiftUI શરતના પરિણામના આધારે નક્કી કરશે કે હાલમાં કયો વ્યૂ બતાવવો જોઈએ.

અમે આ પ્રદર્શન લોજિકને હાલના `ContentView` માં મૂકી શકીએ:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

અહીં, અમે એક નવો `login` વેરિયેબલ ઉમેર્યો છે, જે દર્શાવે છે કે વપરાશકર્તા સફળતાપૂર્વક લોગિન થયો છે કે નહીં.

પછી, અમે પહેલેથી લખેલો લોગિન વ્યૂનો કોડ `else` સ્ટેટમેન્ટ પછી મૂકી દીધો.

વ્યૂ પ્રદર્શન લોજિક:

- જ્યારે `login` `false` હોય, ત્યારે તેનો અર્થ છે કે લોગિન હજુ સફળ થયું નથી, એટલે મૂળ લોગિન વ્યૂ બતાવાતું રહે છે.
- જ્યારે `login` `true` હોય, ત્યારે તેનો અર્થ છે કે લોગિન સફળ થયું છે; આ સમયે લોગિન વ્યૂ હવે બતાવાતું નથી, અને તેના બદલે `Login successful` બતાવવામાં આવે છે.

એનો અર્થ એ છે કે `ContentView` `login` ના મૂલ્ય અનુસાર અલગ વ્યૂ સામગ્રી દર્શાવશે.

હવે, ચાલો બટનની અંદર લોગિન સફળતાની લોજિકમાં ફેરફાર કરીએ:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

જ્યારે વપરાશકર્તા દ્વારા દાખલ કરાયેલ યુઝરનેમ અને પાસવર્ડ બન્ને સાચા હોય, ત્યારે આપણે `login` ને `true` કરી દઈએ છીએ.

જેમ જ `login` નું મૂલ્ય બદલાય છે, તેમ `ContentView` ની અંદરનું `if` ચકાસણું પરિણામ પણ બદલાય છે, અને ઇન્ટરફેસ મૂળ લોગિન વ્યૂમાંથી `Login successful` માં બદલાઈ જાય છે.

દર્શાવાનો અસર નીચે મુજબ છે:

![view](../../Resource/020_view.png)

હવે, અમે “શરત મુજબ જુદા જુદા વ્યૂ દર્શાવવાની” આ સમજણને ખરેખર આ વર્તમાન લોગિન પેજમાં ઉપયોગમાં લીધી છે.

વાસ્તવિક એપ્સમાં પણ સામાન્ય રીતે આ જ રીતે થાય છે: કોઈ ચોક્કસ મૂલ્યના આધારે જુદા જુદા વ્યૂ દેખાડવામાં આવે છે.

ઉદાહરણ તરીકે, જ્યારે વપરાશકર્તા લોગિન ન હોય ત્યારે લોગિન પેજ દેખાડાય છે; અને સફળતાપૂર્વક લોગિન થયા પછી બીજી ઇન્ટરફેસ દેખાડવામાં આવે છે.

મૂળ વિચાર આ છે: **વેરિયેબલ્સના પરિવર્તન દ્વારા ઇન્ટરફેસમાં શું સામગ્રી બતાવવી તે નિયંત્રિત કરવું.**

## સારાંશ

આ પાઠમાં, અમે ત્રણ મહત્વપૂર્ણ બાબતો શીખ્યા:

1. પાસવર્ડ દાખલ કરવા માટે `SecureField` નો ઉપયોગ કરવો, જેથી પાસવર્ડની સામગ્રી સીધી ઇન્ટરફેસ પર દેખાય નહીં.
2. ફક્ત કન્સોલમાં આઉટપુટ બતાવવાને બદલે, વપરાશકર્તાને સંદેશા બતાવવા માટે `Alert` નો ઉપયોગ કરવો.
3. જુદા જુદા વ્યૂના પ્રદર્શનને નિયંત્રિત કરવા અને લોગિન પહેલાં તથા પછીની ઇન્ટરફેસ વચ્ચે સ્વિચ અમલમાં મૂકવા માટે વેરિયેબલ્સ અને `if` શરતોનો ઉપયોગ કરવો.

આ જ્ઞાન શીખવાથી, હવે અમે મૂળભૂત ઇન્ટરૅક્શન અસરવાળો લોગિન વ્યૂ પૂર્ણ કરી શકીએ છીએ, અને SwiftUI માં “સ્થિતિ બદલાય ત્યારે ઇન્ટરફેસ અપડેટ થાય છે” આ ડેવલપમેન્ટ વિચારધારાને વધુ સારી રીતે સમજી શકીએ છીએ.

## સંપૂર્ણ કોડ

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## વિસ્તૃત જ્ઞાન - ઘણા બટનવાળો Alert

આ પાઠના અગાઉના ભાગમાં, અમે સૌથી મૂળભૂત `Alert` નો ઉપયોગ કર્યો હતો, જેમાં ફક્ત એક બટન હતું અને જેનો મુખ્ય ઉપયોગ વપરાશકર્તાને સૂચિત કરવા માટે થતો હતો.

હકીકતમાં, `Alert` માં ઘણા બટનો પણ હોઈ શકે છે, જેથી વપરાશકર્તા જુદી જુદી પસંદગીઓ કરી શકે.

ઉદાહરણ તરીકે:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

બટન પર ક્લિક કર્યા પછી, ત્રણ વિકલ્પોવાળો સંદેશ બોક્સ પોપ અપ થશે: `Ok`, `delete`, અને `cancel`.

દર્શાવાનો અસર:

![alert](../../Resource/020_alert2.png)

જુદા જુદા બટન પર ક્લિક કરતા અનુરૂપ કોડ ચલાવવામાં આવશે.

### Button નું role ગુણધર્મ

અહીં તમે ધ્યાન આપશો કે `Alert` ની અંદરનું `Button`, અમે અગાઉ શીખેલા સામાન્ય બટનના લખાણથી થોડું જુદું છે:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

અહીં એક વધારાનો `role` પેરામીટર છે.

SwiftUI માં, `role` નો ઉપયોગ સિસ્ટમને જણાવવા માટે થાય છે કે આ બટન કઈ પ્રકારની ક્રિયાને રજૂ કરે છે.

કેટલાક સામાન્ય roles આ છે:

- `.cancel`: રદ કરવાની ક્રિયા
- `.destructive`: જોખમી ક્રિયા, ઉદાહરણ તરીકે delete
- `nil`: સામાન્ય ક્રિયા

અલગ અલગ `role` મૂલ્યો સામાન્ય રીતે ઇન્ટરફેસમાં જુદી જુદી દૃશ્ય શૈલીઓ પણ આપે છે.

ઉદાહરણ તરીકે, જોખમી ક્રિયાઓ ઘણીવાર વધુ ધ્યાન ખેંચે એવી શૈલીમાં બતાવવામાં આવે છે, જેથી વપરાશકર્તાને સાવચેતીથી ક્લિક કરવાની યાદ અપાય.

તે ઉપરાંત, `role` બટન માટે વધારાની અર્થસભર માહિતી પણ પૂરી પાડે છે, જે સ્ક્રીન રીડર્સને (જેમ કે Apple ડિવાઇસ પર VoiceOver) વપરાશકર્તાને બટનનું કાર્ય સમજાવવામાં મદદ કરે છે.

તેથી, યોગ્ય પરિસ્થિતિમાં બટનને `role` ઉમેરવું એક ખૂબ જ સારી ટેવ છે.
