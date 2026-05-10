# દેખાવ અનુકૂલન

આ પાઠમાં, આપણે લાઇટ મોડ અને ડાર્ક મોડ માટે ઇન્ટરફેસનું દેખાવ અનુકૂલન શીખીશું.

iPhone, iPad અને Mac પર, વપરાશકર્તાઓ લાઇટ મોડ અથવા ડાર્ક મોડ પસંદ કરી શકે છે.

જ્યારે સિસ્ટમ ડાર્ક મોડમાં બદલાય છે, ત્યારે ઘણી Apps ના બેકગ્રાઉન્ડ, લખાણ અને આઇકનના રંગો પણ તેની સાથે બદલાય છે.

ઉદાહરણ તરીકે, દિવસ દરમિયાન ઇન્ટરફેસ હળવા રંગના બેકગ્રાઉન્ડ સાથે દેખાઈ શકે છે, અને રાત્રે તે ગાઢ બેકગ્રાઉન્ડમાં બદલાઈ શકે છે.

![view](../../../Resource/025_view9.png)

સિસ્ટમના દેખાવ અનુસાર ઇન્ટરફેસનું પ્રદર્શન આપમેળે સમાયોજિત કરવાની આ ક્ષમતાને દેખાવ અનુકૂલન કહેવામાં આવે છે.

## Xcode માં દેખાવ અનુકૂલનનું પૂર્વાવલોકન

દેખાવ અનુકૂલન શીખતા પહેલાં, ચાલો પહેલાં સમજીએ કે Xcode માં લાઇટ મોડ અને ડાર્ક મોડનું પૂર્વાવલોકન કેવી રીતે કરવું.

`Canvas` વિસ્તારના તળિયે, `Device Settings` બટન પર ક્લિક કરો. તેનાથી `Canvas Device Settings` પોપ-અપ ખુલશે.

![canvas](../../../Resource/025_view.png)

પોપ-અપમાં તમે `Color Scheme` સેટિંગ જોઈ શકો છો.

![canvas1](../../../Resource/025_view1.png)

અહીં:

- `Light Appearance` લાઇટ મોડ દર્શાવે છે.
- `Dark Appearance` ડાર્ક મોડ દર્શાવે છે.

અહીંથી આપણે પૂર્વાવલોકન દેખાવ બદલી શકીએ છીએ અને વર્તમાન ઇન્ટરફેસ લાઇટ મોડ અને ડાર્ક મોડમાં કેવી રીતે દેખાય છે તે જોઈ શકીએ છીએ.

## બે દેખાવને બાજુબાજુ બતાવવું

જો તમે લાઇટ મોડ અને ડાર્ક મોડને એકસાથે જોવા માંગતા હો, તો `Variants` સુવિધાનો ઉપયોગ કરી શકો છો.

`Canvas` વિસ્તારના તળિયે, `Variants` બટન પર ક્લિક કરો અને `Color Scheme Variants` પસંદ કરો.

![canvas2](../../../Resource/025_view2.png)

પસંદ કર્યા પછી, `Canvas` લાઇટ મોડ અને ડાર્ક મોડના પૂર્વાવલોકનને એકસાથે બતાવશે.

![canvas3](../../../Resource/025_view3.png)

આ રીતે બે દેખાવ હેઠળના ઇન્ટરફેસના તફાવતોની તુલના કરવી વધુ સરળ બને છે.

સરળ રીતે કહીએ તો:

જો તમે ફક્ત સમયાંતરે લાઇટ/ડાર્ક મોડ વચ્ચે બદલાવ કરવા માંગતા હો, તો `Canvas Device Settings` નો ઉપયોગ કરી શકો છો.

જો તમે બંને દેખાવને એકસાથે જોવા માંગતા હો, તો `Color Scheme Variants` નો ઉપયોગ કરી શકો છો.

## Views મૂળભૂત રીતે દેખાવ સાથે અનુકૂળ થાય છે

SwiftUI માં, ઘણી સિસ્ટમ views મૂળભૂત રીતે લાઇટ મોડ અને ડાર્ક મોડ સાથે આપમેળે અનુકૂળ થાય છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("પ્રકાશ")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("કેટલુંક લખાણ")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

દર્શાવવાનો પરિણામ:

![canvas](../../../Resource/025_view4.png)

તમે જોઈ શકો છો કે લાઇટ મોડમાં, આઇકન અને શીર્ષક સામાન્ય રીતે ગાઢ રંગમાં દેખાય છે.

ડાર્ક મોડમાં, આઇકન અને શીર્ષક આપમેળે હળવા રંગમાં બદલાઈ જાય છે.

આનું કારણ એ છે કે `Text`, `Image` જેવી SwiftUI views મૂળભૂત રીતે સિસ્ટમ દેખાવ અનુસાર પોતાના રંગોને સમાયોજિત કરે છે.

અર્થાત્, જો આપણે હાથથી કોઈ સ્થિર રંગ નક્કી ન કરીએ, તો SwiftUI આપણા માટે દેખાવ અનુકૂલનનો એક ભાગ સંભાળી લે છે.

## સ્થિર રંગો આપમેળે બદલાતા નથી

ધ્યાનમાં રાખવાની વાત એ છે કે જો આપણે હાથથી કોઈ સ્થિર રંગ નક્કી કરીએ, તો તે લાઇટ/ડાર્ક મોડ અનુસાર આપમેળે બદલાતો નથી.

ઉદાહરણ તરીકે:

```swift
Text("કેટલુંક લખાણ")
	.foregroundStyle(Color.gray)
```

અહીંનું લખાણ `Color.gray` તરીકે નક્કી કરેલું છે, એટલે તે હંમેશા રાખોડી રંગમાં જ દેખાશે.

બીજું ઉદાહરણ:

```swift
Text("શીર્ષક")
    .foregroundStyle(Color.white)
```

આ કોડ લાઇટ મોડ હોય કે ડાર્ક મોડ, બંને સ્થિતિમાં સફેદ લખાણ બતાવશે.

જો બેકગ્રાઉન્ડ પણ હળવા રંગનું હોય, તો સફેદ લખાણ વાંચવામાં મુશ્કેલ થઈ શકે છે.

તેથી દેખાવ અનુકૂલન કરતી વખતે, `Color.white`, `Color.black` જેવા સ્થિર રંગોને સહેલાઈથી કોડમાં લખી દેવાનું શક્ય હોય ત્યાં સુધી ટાળવું જોઈએ.

ઘણી સ્થિતિમાં, તમે પહેલા સિસ્ટમ semantic styles નો ઉપયોગ કરી શકો છો, જેમ કે:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

અહીં:

- `.primary` સામાન્ય રીતે મુખ્ય સામગ્રી માટે વપરાય છે.
- `.secondary` સામાન્ય રીતે ગૌણ સામગ્રી માટે વપરાય છે.

તે લાઇટ/ડાર્ક મોડ અનુસાર પોતાનો દેખાવ આપમેળે સમાયોજિત કરે છે.

## દેખાવ અનુસાર અલગ સામગ્રી બતાવવી

ક્યારેક, આપણે માત્ર રંગ બદલાવા માગતા નથી, પણ અલગ દેખાવ હેઠળ અલગ સામગ્રી પણ બતાવવી હોય છે.

ઉદાહરણ તરીકે:

- લાઇટ મોડમાં સામાન્ય લાઇટબલ્બ આઇકન બતાવવું.
- ડાર્ક મોડમાં તેજ આપતું લાઇટબલ્બ આઇકન બતાવવું.
- લાઇટ મોડમાં શીર્ષક તરીકે `પ્રકાશ` બતાવવું.
- ડાર્ક મોડમાં શીર્ષક તરીકે `અંધારું` બતાવવું.

આ સમયે, વર્તમાન સિસ્ટમ લાઇટ મોડમાં છે કે ડાર્ક મોડમાં છે તે નક્કી કરવાની જરૂર પડે છે.

SwiftUI માં, વર્તમાન દેખાવ મોડ `colorScheme` environment value દ્વારા મેળવી શકાય છે:

```swift
@Environment(\.colorScheme) private var colorScheme
```

સંપૂર્ણ કોડ:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "પ્રકાશ" : "અંધારું"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("કેટલુંક લખાણ")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

દર્શાવવાનો પરિણામ:

![view](../../../Resource/025_view5.png)

પૂર્વાવલોકન પરિણામથી જોઈ શકાય છે કે એક જ view અલગ દેખાવ મોડ હેઠળ સંપૂર્ણપણે સમાન સામગ્રી બતાવતું નથી.

લાઇટ મોડમાં, `Image` સામાન્ય લાઇટબલ્બ આઇકન બતાવે છે, અને શીર્ષક `પ્રકાશ` તરીકે દેખાય છે.

ડાર્ક મોડમાં, `Image` તેજ આપતું લાઇટબલ્બ આઇકન બતાવે છે, અને શીર્ષક `અંધારું` તરીકે દેખાય છે.

અર્થાત્, અહીંનો ફેરફાર માત્ર રંગનો નથી. આઇકનનું નામ અને શીર્ષક લખાણ પોતે પણ બદલાયું છે.

આનું કારણ એ છે કે આપણે આઇકન અને શીર્ષકને સીધા `body` માં સ્થિર રીતે લખ્યાં નથી, પરંતુ `colorScheme` અનુસાર અલગ સામગ્રી ગણતરીથી મેળવીએ છીએ.

આ કોડમાં, આપણે બે computed properties નો ઉપયોગ કર્યો છે:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "પ્રકાશ" : "અંધારું"
}
```

જ્યારે `colorScheme` `.light` હોય, ત્યારે તેનો અર્થ વર્તમાન સ્થિતિ લાઇટ મોડ છે.

જ્યારે `colorScheme` `.dark` હોય, ત્યારે તેનો અર્થ વર્તમાન સ્થિતિ ડાર્ક મોડ છે.

તેથી આપણે અલગ દેખાવ મોડ મુજબ અલગ આઇકન નામ અને શીર્ષક લખાણ પરત કરી શકીએ છીએ.

આ પણ computed property નો એક સામાન્ય ઉપયોગ છે: વર્તમાન સ્થિતિ અનુસાર view ને બતાવવાની જરૂરી સામગ્રી ગણવી.

## @Environment સમજવું

આપણે પહેલી વાર `@Environment` સાથે પરિચિત થઈ રહ્યા છીએ.

`@Environment` ને આ રીતે સમજવામાં આવી શકે છે: SwiftUI ના environment માંથી કોઈ value વાંચવી.

App ચાલે ત્યારે, સિસ્ટમ ઘણી environment માહિતી પૂરી પાડે છે, જેમ કે:

- વર્તમાન ભાષા
- વર્તમાન દેખાવ મોડ
- વર્તમાન layout દિશા
- વર્તમાન font size સેટિંગ

જ્યારે અમને વર્તમાન દેખાવ મોડ મેળવવો હોય, ત્યારે `colorScheme` વાંચી શકાય છે:

```swift
@Environment(\.colorScheme) private var colorScheme
```

અહીં:

```swift
\.colorScheme
```

environment માંથી `colorScheme` value વાંચવાનું સૂચવે છે.

```swift
private var colorScheme
```

વાંચેલી value ને `colorScheme` variable માં સાચવવાનું સૂચવે છે.

variable નું નામ તમે જાતે નક્કી કરી શકો છો. ઉદાહરણ તરીકે, આ રીતે પણ લખી શકાય છે:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

જ્યાં સુધી આગળનું `\.colorScheme` બદલાતું નથી, ત્યાં સુધી તેનો અર્થ વર્તમાન દેખાવ મોડ વાંચવો જ થાય છે.

## colorScheme ના બે સામાન્ય values

`colorScheme` ના સામાન્ય રીતે બે values હોય છે:

```swift
.light
.dark
```

તેનો અર્થ:

- `.light`: લાઇટ મોડ
- `.dark`: ડાર્ક મોડ

ઉદાહરણ તરીકે:

```swift
private var titleName: String {
    colorScheme == .light ? "પ્રકાશ" : "અંધારું"
}
```

આ કોડનો અર્થ છે:

જો વર્તમાન સ્થિતિ લાઇટ મોડ છે, તો `colorScheme == .light` સાચું છે, તેથી તે `"પ્રકાશ"` પરત કરે છે.

નહીંતર, તે `"અંધારું"` પરત કરે છે.

તેથી લાઇટ મોડમાં:

```swift
Text(titleName)
```

દર્શાતું લખાણ છે:

```swift
પ્રકાશ
```

ડાર્ક મોડમાં, દર્શાતું લખાણ છે:

```swift
અંધારું
```

આ રીતે, આપણે અલગ દેખાવ અનુસાર અલગ સામગ્રી બતાવી શકીએ છીએ.

## રંગ અનુકૂલનનું ઉદાહરણ

લખાણ અને આઇકન સિવાય, ક્યારેક આપણને રંગ અનુકૂલન પોતે પણ સંભાળવું પડે છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("લખાણ")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

દર્શાવવાનો પરિણામ:

![view](../../../Resource/025_view6.png)

આ કોડમાં, લખાણ સફેદ છે અને બેકગ્રાઉન્ડ કાળું છે.

લાઇટ મોડમાં, કાળું બેકગ્રાઉન્ડ સ્પષ્ટ દેખાય છે.

પરંતુ ડાર્ક મોડમાં, જો આખા ઇન્ટરફેસનું બેકગ્રાઉન્ડ પણ કાળું હોય, તો આ કાળું બેકગ્રાઉન્ડ સિસ્ટમ બેકગ્રાઉન્ડમાં ભળી જશે અને ઓછું સ્પષ્ટ લાગશે.

આ સમયે, આપણે દેખાવ મોડ અનુસાર લખાણનો રંગ અને બેકગ્રાઉન્ડ રંગ બદલી શકીએ છીએ:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("લખાણ")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

દર્શાવવાનો પરિણામ:

![view](../../../Resource/025_view7.png)

હવે, લાઇટ મોડમાં કાળું બેકગ્રાઉન્ડ અને સફેદ લખાણ છે.

ડાર્ક મોડમાં સફેદ બેકગ્રાઉન્ડ અને કાળું લખાણ છે.

આ રીતે, કોઈપણ દેખાવમાં લખાણ અને બેકગ્રાઉન્ડ વચ્ચે સ્પષ્ટ contrast રહે છે, અને વપરાશકર્તા સામગ્રી સ્પષ્ટ રીતે જોઈ શકે છે.

## રંગ અનુકૂલન માટે Assets નો ઉપયોગ કરવો

`colorScheme` વડે હાથથી નિર્ણય લેવાના બદલે, આપણે `Assets` resource colors વડે પણ લાઇટ/ડાર્ક મોડ માટે રંગ અનુકૂલન કરી શકીએ છીએ.

આ રીત App માં સામાન્ય રીતે વપરાતા રંગોને સંચાલિત કરવા માટે વધુ યોગ્ય છે.

Xcode project માં, `Assets` resource folder શોધો.

![assets](../../../Resource/025_color.png)

`Assets` folder ખોલો, ખાલી વિસ્તારમાં right-click કરો, અને `New Color Set` પસંદ કરીને નવો color resource બનાવો.

![assets](../../../Resource/025_color1.png)

અહીં આપણે એક color બનાવીને તેનું નામ `redText` રાખીએ છીએ.

![assets](../../../Resource/025_color2.png)

color resource માં લાઇટ મોડ અને ડાર્ક મોડ માટે અલગ-અલગ રંગો સેટ કરી શકાય છે.

![assets](../../../Resource/025_color3.png)

સંબંધિત રંગ વિસ્તાર પસંદ કર્યા પછી, જમણી બાજુના inspector માં રંગ બદલી શકાય છે.

ઉપર જમણા ખૂણાના `Hide or show the Inspectors` બટન પર ક્લિક કરીને inspector વિસ્તાર ખોલો.

પછી `Show the Attributes inspector` પસંદ કરો, તળિયે `Show Color Panel` શોધો અને color panel ખોલો.

![assets](../../../Resource/025_color4.png)

color panel માં કોઈ રંગ પર ક્લિક કરો, અને `redText` ના સંબંધિત રંગ વિસ્તારમાં એકસાથે ફેરફાર થશે.

અહીં આપણે `redText` ને આ રીતે સેટ કરીએ છીએ:

- લાઇટ મોડમાં લાલ રંગ બતાવે છે
- ડાર્ક મોડમાં લીલો રંગ બતાવે છે

![assets](../../../Resource/025_color5.png)

SwiftUI code માં પાછા આવીને, તમે આ રંગનો ઉપયોગ આ રીતે કરી શકો છો:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

અહીં:

```swift
Color("redText")
```

`Assets` માંથી `redText` નામનો color resource વાંચવાનું સૂચવે છે.

દર્શાવવાનો પરિણામ:

![assets](../../../Resource/025_view8.png)

તમે જોઈ શકો છો કે સમાન `Color("redText")` લાઇટ મોડ અને ડાર્ક મોડમાં અલગ રંગો દર્શાવે છે.

આ બતાવે છે કે `Assets` colors પોતે પણ દેખાવ અનુકૂલનને સપોર્ટ કરે છે.

## colorScheme અને Assets નો તફાવત

`colorScheme` અને `Assets` બંને દેખાવ અનુકૂલન કરી શકે છે, પરંતુ તે અલગ પરિસ્થિતિઓ માટે યોગ્ય છે.

જો તમે ફક્ત લાઇટ/ડાર્ક મોડ અનુસાર લખાણ, image name અથવા `SF Symbols` name બદલવા માંગતા હો, તો `colorScheme` નો ઉપયોગ કરી શકો છો.

ઉદાહરણ તરીકે:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

જો રંગ App માં વારંવાર વપરાતો હોય, જેમ કે theme color, card background color અથવા text color, તો `Assets` colors નો ઉપયોગ વધુ ભલામણપાત્ર છે.

કારણ કે `Assets` colors અનેક views માં ફરી વાપરી શકાય છે અને પછીથી ફેરફાર કરવો પણ વધુ સરળ છે.

ઉદાહરણ તરીકે:

```swift
Color("redText")
```

આ રીતે, તમને માત્ર `Assets` માં રંગ બદલવાની જરૂર પડે છે, અને આ રંગ વાપરતા બધા સ્થળો એકસાથે બદલાઈ જશે.

## સારાંશ

આ પાઠમાં, આપણે લાઇટ મોડ અને ડાર્ક મોડ માટે દેખાવ અનુકૂલન શીખ્યું.

સૌપ્રથમ, આપણે Xcode ના `Canvas` માં અલગ દેખાવનું પૂર્વાવલોકન કેવી રીતે કરવું તે શીખ્યું, અને `Color Scheme Variants` વડે લાઇટ મોડ અને ડાર્ક મોડને એકસાથે કેવી રીતે જોવા તે પણ શીખ્યું.

પછી, આપણે સમજ્યું કે SwiftUI માં `Text`, `Image` જેવી views મૂળભૂત રીતે સિસ્ટમ દેખાવ અનુસાર પોતાના રંગોને આપમેળે અનુકૂળ કરે છે.

પરંતુ, જો આપણે `Color.white` અથવા `Color.black` જેવા સ્થિર રંગો હાથથી નક્કી કરીએ, તો આ રંગો આપમેળે બદલાતા નથી.

પછી, આપણે `@Environment` અને `colorScheme` શીખ્યાં:

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme` દ્વારા, આપણે વર્તમાન સ્થિતિ લાઇટ મોડ છે કે ડાર્ક મોડ છે તે જાણી શકીએ છીએ, અને અલગ દેખાવ અનુસાર અલગ આઇકન, લખાણ અથવા રંગ બતાવી શકીએ છીએ.

છેલ્લે, આપણે `Assets` colors શીખ્યાં.

`Assets` colors માં લાઇટ મોડ અને ડાર્ક મોડ માટે અલગ રંગો સેટ કરી શકાય છે, તેથી તે App માં સામાન્ય color resources સંચાલિત કરવા માટે યોગ્ય છે.

દેખાવ અનુકૂલન App ને દિવસ અને રાત્રિ બંને સમયમાં વધુ સારું દેખાડે છે, અને લખાણ વાંચવામાં મુશ્કેલી અથવા બેકગ્રાઉન્ડ અસ્પષ્ટ જેવી સમસ્યાઓ પણ ટાળી શકે છે.

વાસ્તવિક વિકાસમાં, SwiftUI ની મૂળભૂત અનુકૂલન ક્ષમતા અને `Assets` colors ને પ્રાથમિકતા આપવાની ભલામણ છે.

જ્યારે અલગ દેખાવ હેઠળ લખાણ, આઇકન, image બદલવાની જરૂર હોય, અથવા થોડી ખાસ display effects સંભાળવી હોય, ત્યારે જ `colorScheme` વડે નિર્ણય લો.

## વિસ્તૃત જ્ઞાન: font size નક્કી કરવી

પહેલાં `font` શીખતી વખતે, આપણે કેટલીક system font styles નો ઉપયોગ કર્યો હતો:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

`.largeTitle`, `.callout` જેવી system font styles વાપરવા સિવાય, તમે font size હાથથી પણ નક્કી કરી શકો છો.

ઉદાહરણ તરીકે:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

અહીં:

```swift
.font(.system(size: 100))
```

font size ને `100 pt` પર સેટ કરવાનું સૂચવે છે.

`SF Symbols` icons માટે, `font` પણ icon size પર અસર કરે છે.

તેથી, જો તમે icon ને વધુ મોટું દેખાડવા માંગતા હો, તો `.font(.system(size:))` વડે size નક્કી કરી શકો છો.

ઉદાહરણ તરીકે:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

ધ્યાનમાં રાખવાની વાત એ છે કે font size હાથથી નક્કી કરવી વધુ લવચીક છે, છતાં સામાન્ય લખાણ માટે ઘણી માત્રામાં fixed font sizes વાપરવાની ભલામણ નથી.

સામાન્ય લખાણ માટે `.title`, `.headline`, `.body`, `.caption` જેવી system font styles ને પ્રાથમિકતા આપો.

આ રીતે અલગ devices અને વપરાશકર્તાના font settings સાથે વધુ સારું અનુકૂલન થઈ શકે છે.
