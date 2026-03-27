# વ્યક્તિગત રિઝ્યૂમે પેજ બનાવવું

આ પાઠમાં આપણે એક સરળ વ્યક્તિગત રિઝ્યૂમે view બનાવશું અને નીચેનું જ્ઞાન શીખીશું:

- `cornerRadius`
- `spacing`
- `ScrollView`

બનાવવાની પ્રક્રિયામાં આપણે layout, `Text`, `Image` વગેરેનો પુનરાવર્તન પણ કરીશું, અને spacing control તેમજ scrolling effect ને અમલમાં મૂકાશે.

## વ્યક્તિગત રિઝ્યૂમે

લક્ષ્ય પરિણામ:

![Swift](../../RESOURCE/004_img.png)

**કૃપા કરીને પહેલાં સ્વતંત્ર રીતે બનાવવાનો પ્રયાસ કરો, પછી નીચેની સમજણ વાંચો.**

### પ્રોજેક્ટ બનાવવો

નવો iOS પ્રોજેક્ટ બનાવો, અથવા પહેલાનો પ્રોજેક્ટ જ ચાલુ રાખો.

મૂળભૂત `ContentView` કોડ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

હવે કોડ સાફ કરો અને પોતાનું content લખવાનું શરૂ કરો:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### સમગ્ર રચના

વાસ્તવિક વિકાસમાં આપણે સામાન્ય રીતે પહેલાં overall structure ડિઝાઇન કરીએ છીએ.

અમારા પેજમાં સામેલ છે:

1. શીર્ષક
2. વ્યક્તિગત માહિતી
3. વ્યક્તિગત પરિચય

સૌથી બહાર એક `VStack` ઉમેરીએ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` view ને vertical ક્રમમાં ગોઠવે છે, અને view ની ગોઠવણી તથા spacing નિયંત્રિત કરવામાં મદદ કરે છે.

### શીર્ષક

સૌપ્રથમ, title બતાવવા માટે `Text` બનાવીએ.

અહીં હું title તરીકે મારું અંગ્રેજી નામ બતાવું છું:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

શીર્ષક સામાન્ય રીતે મોટું અને bold હોય છે, તેથી `font` અને `fontWeight` modifiers નો ઉપયોગ કરીએ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### ગોઠવણી

SwiftUI માં મૂળભૂત alignment `center` છે, તેથી હાલ title `ContentView` ના મધ્યમાં દેખાય છે.

![Swift](../../RESOURCE/004_img3.png)

અમે title ને view ના ટોચના ભાગમાં બતાવવું છે, અને layout adjustment માટે `Spacer` નો ઉપયોગ કરી શકીએ:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` બાકી જગ્યા લઈ લે છે અને `Text` ને container ના ઉપરના ભાગમાં ધકેલી દે છે.

![Swift](../../RESOURCE/004_img4.png)

### ખાલી જગ્યા

જો લખાણ view ના ટોચથી વધારે નજીક લાગે, તો `padding` અથવા `Spacer` નો ઉપયોગ કરી શકાય.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

આ `VStack` માટે ઉપરનું padding `20` રાખે છે.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

તમે `Spacer` સાથે `frame` height સેટ કરીને નક્કી ઊંચાઈની ખાલી જગ્યા મેળવી શકો છો.

પરિણામ:

![Swift](../../RESOURCE/004_img5.png)

### ચિત્ર

તમારું portrait photo તૈયાર કરો અને `Assets` resource folder માં મૂકો.

![Swift](../../RESOURCE/004_img6.png)

પછી `ContentView` માં `Image` વડે ચિત્ર બતાવો:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

કારણ કે ચિત્રનું મૂળ કદ મોટું છે, આપણે display size નિયંત્રિત કરવા માટે `frame` નો ઉપયોગ કરવો પડશે.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

અહીં એક સમસ્યા દેખાય છે:

જો `frame` નો width-height ratio ચિત્રના મૂળ ratio સાથે મેળ ન ખાતો હોય, તો ચિત્ર વિકૃત થઈ જાય છે.

ઉદાહરણ તરીકે:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

ચિત્ર વિકૃતિથી બચવા માટે `scaledToFit` નો ઉપયોગ કરવો પડે:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` નો અર્થ:

આપેલા `frame` ની અંદર ચિત્રને તેના મૂળ proportion પ્રમાણે scale કરવું અને સંપૂર્ણ image content દેખાડવું.

તે image ને frame ભરવા માટે ખેંચતું નથી, પરંતુ width-height ratio જાળવી રાખીને proportional રીતે scale કરે છે, જ્યાં સુધી કોઈ એક બાજુ frame ની હદ સુધી ન પહોંચે.

તેનો અર્થ:

- જો `frame` ની width નાની હોય, તો image width ને આધાર માનીને scale થશે
- જો `frame` ની height નાની હોય, તો image height ને આધાર માનીને scale થશે
- image હંમેશા મૂળ proportion જાળવે છે, તેથી વિકૃતિ થતી નથી

સામાન્ય રીતે એક જ દિશામાં માપ સેટ કરવું પૂરતું હોય છે. ઉદાહરણ તરીકે:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

આ રીતે system width `140` પરથી આપમેળે યોગ્ય height ગણે છે અને proportion જાળવી રાખે છે.

જો ચોક્કસ visual ratio જાળવવો હોય અથવા image ને complex layout માં compress થવાથી બચાવવી હોય, તો width અને height બન્ને constrain કરી શકાય.

### ગોળ ખૂણાં

જો ચિત્ર rounded corners સાથે દેખાડવું હોય, તો `cornerRadius` modifier વાપરી શકાય:

```swift
.cornerRadius(10)
```

ઉદાહરણ તરીકે:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

અહીં `Image` ના modifiers પછી `cornerRadius(20)` ઉમેર્યું છે.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` view ની boundary ને clip કરે છે અને `20` ના rounded corner radius લાગુ કરે છે.

Rounded corners ઉમેર્યા પછી, ચિત્રના ચારેય ખૂણા વળાંકવાળા દેખાય છે, જેના કારણે visual effect વધુ નરમ અને આધુનિક બને છે.

આ પ્રકારની design શૈલી આજના UI ડિઝાઇનમાં ઘણી સામાન્ય છે. ઉદાહરણ તરીકે, iOS app icons પણ rounded rectangle આકારમાં હોય છે, ભલે system icons માં simple corner ના બદલે continuous curvature superellipse વપરાતો હોય.

### વ્યક્તિગત માહિતી

હવે ચિત્રની ડાબી બાજુનું વ્યક્તિગત માહિતી વિસ્તાર બનાવીએ. ઈન્ટરફેસની રચના પરથી સ્પષ્ટ છે કે વ્યક્તિગત માહિતી અને ચિત્ર horizontal રીતે ગોઠવાયેલા છે, એટલે `HStack` જરૂરી છે.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

વ્યક્તિગત માહિતીનું content vertical ગોઠવણીમાં છે.

![Swift](../../RESOURCE/004_img11.png)

અટલે outer layer માટે `HStack`, વ્યક્તિગત માહિતી માટે `VStack`, અને actual લખાણ માટે `Text` વાપરીએ.

મૂલભૂત રચના:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**ફીલ્ડ શીર્ષકો bold કરવું**

ફીલ્ડના નામ અને મૂલ્ય વચ્ચે ફરક દેખાડવા માટે field name પર `fontWeight` લગાડી શકીએ:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**લખાણને ડાબી બાજુ ગોઠવવું**

`VStack` મૂળભૂત રીતે center alignment ધરાવે છે. જો બધા લખાણને ડાબી બાજુ ગોઠવવું હોય, તો alignment સેટ કરવું પડશે:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` નો અર્થ ડાબી બાજુ ગોઠવણી (left-to-right ભાષા પરિસ્થિતિમાં).

![Swift](../../RESOURCE/004_img14.png)

### અંતર

જો આપણે વ્યક્તિગત માહિતી અને ચિત્ર વચ્ચે નિશ્ચિત અંતર રાખવું હોય, તો પહેલાં શીખેલી રીત `Spacer` વડે ખાલી જગ્યા બનાવવાની છે:

```swift
Spacer()
    .frame(width: 10)
```

અથવા `HStack` ના `spacing` parameter નો ઉપયોગ કરી શકાય:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` નો અર્થ બે child views વચ્ચે `30 pt`નું અંતર.

![Swift](../../RESOURCE/004_img15.png)

**`spacing` શું છે?**

`VStack`, `HStack`, અને `ZStack` માં `spacing` child views વચ્ચેનું અંતર નિયંત્રિત કરે છે.

ઉદાહરણ તરીકે:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

`VStack` ની child views વચ્ચેનું અંતર `10 pt` બની જશે.

![Swift](../../RESOURCE/004_img16.png)

ધ્યાનમાં રાખવાનું કે `spacing` ફક્ત "direct child views" પર જ અસર કરે છે, nested container ની અંદરની layout પર નહીં.

**યાદીની અંદરના અંતરને નિયંત્રિત કરવું**

જો આપણે fields વચ્ચે અંતર વધારવું હોય, તો સૌથી સીધી રીત `VStack` પર `spacing` સેટ કરવાની છે:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

આ રીતે દરેક child view વચ્ચેનું અંતર `10 pt` થશે.

પરંતુ ઈન્ટરફેસ જોતા એક સમસ્યા દેખાય છે:

ફીલ્ડ જૂથો વચ્ચે અંતર છે, પણ ફીલ્ડ નામ અને તેના value વચ્ચે પણ એ જ અંતર આવી ગયું છે.

કારણ કે `spacing` વર્તમાન container ના બધા direct child views પર લાગુ પડે છે.

આ રચનામાં દરેક `Text` outer `VStack` નો direct child છે, એટલે બધે સમાન અંતર લાગે છે.

જો આપણે field groups વચ્ચે અંતર જોઈએ, પણ field name અને field value વચ્ચે default compact અંતર જાળવવું હોય, તો "field name + field value" ને એક logical group માનીને બહાર `VStack` માં wrap કરી શકાય:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

હવે outer `VStack` વચ્ચે અંતર રહેશે, અને inner `VStack` અંદર default compact spacing રહેશે, એટલે field name અને field value વચ્ચે વધારાનું અંતર નહીં આવે.

![Swift](../../RESOURCE/004_img18.png)

### વ્યક્તિગત પરિચય

હવે વ્યક્તિગત પરિચય વિભાગ અમલમાં મૂકીએ.

ઈન્ટરફેસની રચના પ્રમાણે, પરિચયમાં ઘણી line ના text છે અને તે vertical ગોઠવણીમાં છે.

![Swift](../../RESOURCE/004_img19.png)

અટલે `VStack` સાથે `Text` વાપરી શકાય:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**અંતર વધારવું**

હાલ વ્યક્તિગત માહિતી અને વ્યક્તિગત પરિચયનો ભાગ થોડો વધુ compact લાગે છે અને visual effect બહુ સુંદર નથી.

![Swift](../../RESOURCE/004_img20.png)

કારણ કે આ બન્ને એક જ outer container માં છે, એટલે overall spacing outer container પર નિયંત્રિત કરી શકાય:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

પરિણામ:

![Swift](../../RESOURCE/004_img21.png)

**યાદી વચ્ચેનું અંતર**

વ્યક્તિગત પરિચયની lines વચ્ચેનું અંતર `spacing` વડે સેટ કરી શકાય:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### વ્યક્તિગત રિઝ્યૂમે પૂર્ણ કરવું

હવે આપણા વ્યક્તિગત રિઝ્યૂમેની મૂળભૂત રચના પૂર્ણ થઈ ગઈ છે.

![Swift](../../RESOURCE/004_img.png)

### સ્ક્રોલિંગ view

હાલ પેજની રચના `VStack` વડે છે, એટલે પરિચયના લખાણ થોડા હોય ત્યારે કોઈ સમસ્યા નથી. પણ જો તેને 20, 30 અથવા વધુ lines સુધી વધારવામાં આવે, તો content screen height થી બહાર નીકળી જશે.

ઉદાહરણ તરીકે:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

આ સમયે બે બાબતો દેખાશે:

- નીચેનું content કાપાઈ જશે
- પેજ scroll નહીં થાય

આ `VStack` ની સમસ્યા નથી. `VStack` ફક્ત layout container છે; તે આપમેળે scrolling capacity આપતું નથી.

**`ScrollView` શું છે**

`ScrollView` એ scroll કરી શકાય તેવો container છે, અને screen size કરતાં વધારે content માટે યોગ્ય છે, જેમ કે vertical અથવા horizontal lists.

મૂલભૂત રચના:

```swift
ScrollView {
    ...
}
```

જો scrolling effect અમલમાં મૂકવો હોય, તો આખું page content `ScrollView` ની અંદર wrap કરવું પડે:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

હવે આખું પેજ scroll કરી શકાય તેવા વિસ્તારમાં ફેરવાઈ જશે. જ્યારે content screen height ને વટાવી જશે, ત્યારે કુદરતી રીતે scroll થઈ શકશે.

મૂળભૂત રીતે `ScrollView` scroll indicator બતાવે છે. જો આપણે scroll bar છુપાવવી હોય, તો આ રીતે સેટ કરી શકાય:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## સંપૂર્ણ કોડ

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
