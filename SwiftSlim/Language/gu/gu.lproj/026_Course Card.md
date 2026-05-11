# કોર્સ કાર્ડ

આ પાઠ એક તબક્કાવાર સમીક્ષા પાઠ છે. અમે એક “કોર્સ કાર્ડ” પૂર્ણ કરીશું.

આ અભ્યાસ દ્વારા, આપણે પહેલા શીખેલા `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` વગેરે વિષયોની સમીક્ષા કરી શકીએ છીએ, અને ઘણા નાના views ને એક સંપૂર્ણ view module માં કેવી રીતે જોડવા તે શીખી શકીએ છીએ.

કોર્સ કાર્ડનું પરિણામ:

![view](../../../Resource/026_view.png)

આ કોર્સ કાર્ડમાં મુખ્યત્વે નીચેના ભાગો છે:

- કોર્સ સ્તર: `Beginner`
- કોર્સ સામગ્રી: `20+ Lessons`
- કોર્સ શીર્ષક: `SwiftUI Beginner Tutorial`
- કોર્સ વર્ણન
- બટન: `Start Learning`
- કોર્સ પૃષ્ઠભૂમિ: Swift આઇકન અને indigo રંગની પૃષ્ઠભૂમિ

અમે આ view ને `ContentView` માં પૂર્ણ કરી શકીએ છીએ.

## ટોચનો વિસ્તાર

સૌપ્રથમ, કોર્સ કાર્ડનો ટોચનો વિસ્તાર બનાવો.

![view](../../../Resource/026_view1.png)

ટોચના વિસ્તારમાં ડાબી બાજુ કોર્સ સ્તર દેખાય છે, અને જમણી બાજુ કોર્સ સામગ્રી દેખાય છે.

કારણ કે આ બે સામગ્રી આડી રીતે ગોઠવાય છે, તેથી `HStack` નો ઉપયોગ કરી શકાય છે.

```swift
var topView: some View {
    HStack {
        Text("શરૂઆત કરનાર")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ પાઠ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

અહીં અમે ટોચના વિસ્તારને એક computed property માં અલગ કર્યો છે:

```swift
var topView: some View
```

આ કરવાથી `body` વધુ સ્પષ્ટ બને છે.

ટોચના વિસ્તારમાં મુખ્યત્વે નીચેની બાબતો વપરાય છે:

- `HStack`: બે text ને આડી રીતે ગોઠવે છે.
- `Text`: લખાણ સામગ્રી બતાવે છે.
- `Spacer()`: ડાબી બાજુનું text ડાબે ધકેલી દે છે અને જમણી બાજુનું text જમણે ધકેલી દે છે.
- `.font(.footnote)`: નાનું text style સેટ કરે છે.
- `.fontWeight(.bold)`: text ને bold બનાવે છે.
- `.foregroundStyle(Color.white)`: foreground color સફેદ સેટ કરે છે.
- `.padding(.vertical, 10)`: ઉપર-નીચેનો અંદરનો અંતર સેટ કરે છે.
- `.padding(.horizontal, 16)`: ડાબે-જમણેનો અંદરનો અંતર સેટ કરે છે.
- `.background(Color.white.opacity(0.15))`: અર્ધપારદર્શક સફેદ પૃષ્ઠભૂમિ સેટ કરે છે.
- `.cornerRadius(20)`: rounded corners સેટ કરે છે.

અહીં `Beginner` માટે બે દિશામાં `.padding()` વપરાયું છે:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

આથી text ની ઉપર-નીચે અને ડાબે-જમણે બંને તરફ જગ્યા રહે છે, અને તે વધુ label જેવું દેખાય છે.

`Color.white.opacity(0.15)` નો અર્થ `15%` opacity ધરાવતો સફેદ રંગ છે, એટલે કે ખૂબ હળવો સફેદ રંગ.

### કાર્ડ પૃષ્ઠભૂમિ ઉમેરવી

અગાઉ અમે `topView` બનાવ્યું, પરંતુ ફક્ત view બનાવવાથી તે આપમેળે દેખાતું નથી.

SwiftUI માં, interface પર ખરેખર દેખાવાની સામગ્રી `body` માં લખવાની હોય છે.

તેથી, પહેલા `topView` ને `body` માં મૂકી બતાવી શકાય છે:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

હવે તમે જોશો કે ટોચનો વિસ્તાર દેખાવા લાગ્યો છે:

![view](../../../Resource/026_view2.png)

પરંતુ `topView` માં text સફેદ છે અને default background પણ હળવી હોય છે, તેથી light mode માં તે સહેલાઈથી દેખાય નહીં.

તેથી, આપણે બહાર એક `VStack` ઉમેરી શકીએ, અને સમગ્ર વિસ્તારને padding, background color અને rounded corners આપી શકીએ:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

દેખાવનું પરિણામ:

![view](../../../Resource/026_view3.png)

અહીં `VStack` માં હાલમાં માત્ર એક `topView` મૂક્યું છે, તેથી તે જરૂરી ન લાગે.

પરંતુ આગળ અમે કોર્સ title, કોર્સ description અને button area ઉમેરવાના છીએ. આ બધું ઉપર-નીચે ગોઠવાતું content છે, એટલે અહીં પહેલેથી `VStack` નો ઉપયોગ કરવાથી પછી views જોડવામાં સરળતા રહે છે.

અહીં બે `.padding()` છે, અને તેમની ભૂમિકાઓ અલગ છે.

પહેલું `.padding(20)` `.background()` પહેલાં લખાયું છે:

```swift
.padding(20)
.background(Color.indigo)
```

તે card ની અંદરની margin નિયંત્રિત કરે છે, એટલે content અને background edge વચ્ચેનું અંતર.

બીજું `.padding(30)` `.background()` પછી લખાયું છે:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

તે card ની બહારની margin નિયંત્રિત કરે છે, એટલે આખા card અને screen edge વચ્ચેનું અંતર.

![view](../../../Resource/026_view4.png)

તેથી, એક જ `.padding()` હોવા છતાં, તે અલગ સ્થાન પર લખાય તો અસર પણ અલગ થાય છે.

## સામગ્રી વિસ્તાર

હવે કોર્સ કાર્ડનો સામગ્રી વિસ્તાર બનાવીએ.

દેખાવનું પરિણામ:

![view](../../../Resource/026_view5.png)

સામગ્રી વિસ્તારમાં કોર્સ title અને કોર્સ description હોય છે. તે ઉપર-નીચે ગોઠવાય છે, તેથી `VStack` નો ઉપયોગ કરીએ છીએ.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI શરૂઆત કરનાર ટ્યુટોરીયલ")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("શૂન્યથી SwiftUI શરૂ કરો અને Apple ના declarative UI development ને વ્યવસ્થિત રીતે શીખો. સ્પષ્ટ સમજાવટ અને વ્યવહારુ ઉદાહરણો દ્વારા, તમે layout, interaction અને state management ધીમે ધીમે શીખશો, જેથી સુંદર અને ઉપયોગી app interfaces બનાવી શકો.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

દેખાવનું પરિણામ:

![view](../../../Resource/026_view6.png)

અહીંના `VStack` માં બે parameters વપરાયા છે:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` નો અર્થ `VStack` અંદરના views ને left aligned રાખવાનો છે.

`spacing: 10` નો અર્થ `VStack` અંદરના views વચ્ચે `10 pt` નું અંતર રાખવાનો છે.

તેથી, કોર્સ title અને કોર્સ description ડાબી બાજુથી ગોઠવાય છે, અને તેમની વચ્ચે થોડું અંતર રહે છે.

કોર્સ description લાંબું છે. જો બધું જ દેખાડીએ, તો card ખૂબ ઊંચું થઈ જશે. તેથી અહીં `.lineLimit()` વડે lines ની સંખ્યા મર્યાદિત કરીએ છીએ:

```swift
.lineLimit(3)
```

તેનો અર્થ વધારેમાં વધારે `3` lines બતાવવો. જ્યારે content મર્યાદાથી વધે, ત્યારે વધારાનો ભાગ છોડાઈ જાય છે.

### View ને ડાબે ગોઠવવું

અહીં એક વાત ધ્યાનમાં લેવી જોઈએ.

`VStack(alignment: .leading)` ફક્ત `VStack` અંદરના views ની alignment નિયંત્રિત કરે છે. તે `VStack` પોતે બહારના container માં ક્યાં રહે તે સીધું નિયંત્રિત કરતું નથી.

ઉદાહરણ તરીકે, જો કોર્સ description ટૂંકું હોય:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI શરૂઆત કરનાર ટ્યુટોરીયલ")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("માત્ર થોડી સામગ્રી.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

દેખાવનું પરિણામ:

![view](../../../Resource/026_view7.png)

જોઈ શકાય છે કે કોર્સ title અને કોર્સ description `VStack` અંદર left aligned છે, પરંતુ આખું `VStack` card ના સૌથી ડાબા ભાગે પહોંચ્યું નથી.

આનું કારણ એ છે કે content ટૂંકું હોય ત્યારે `VStack` ની width પણ નાની હોય છે. બહારનો container layout કરતી વખતે આ નાનકડા `VStack` ને મધ્યમાં મૂકી શકે છે.

આ રીતે સમજી શકાય: `VStack(alignment: .leading)` અંદરની left alignment માટે જવાબદાર છે.
પરંતુ તે આખા content area ને સૌથી ડાબે ધકેલવા માટે જવાબદાર નથી.

જો આખો content area ખરેખર ડાબે રહે તે ઈચ્છીએ, તો બહાર ફરી એક `HStack` લપેટી અને `Spacer()` ઉમેરો:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI શરૂઆત કરનાર ટ્યુટોરીયલ")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("માત્ર થોડી સામગ્રી.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

દેખાવનું પરિણામ:

![view](../../../Resource/026_view8.png)

અહીં `HStack` horizontal layout છે.

`Spacer()` જમણી બાજુની બાકીની જગ્યા લઈ લે છે, જેથી ડાબી બાજુનું `VStack` સૌથી ડાબે ધકેલાય છે.

તેથી, `HStack + Spacer()` નો ઉપયોગ આખા content area ની position નિયંત્રિત કરવા માટે કરી શકાય છે.

વાસ્તવિક કોર્સ card માં, કોર્સ description લાંબું હોય છે અને સામાન્ય રીતે વધુ width લે છે, તેથી આ સમસ્યા હંમેશા સ્પષ્ટ દેખાય નહીં. પરંતુ આ તફાવત સમજવો મહત્વનો છે, કારણ કે પછી ટૂંકા text layout બનાવતી વખતે આવું વારંવાર મળે છે.

### અંદરના views વચ્ચેનું અંતર નિયંત્રિત કરવું

અગાઉ અમે `VStack` માં `spacing: 10` લખ્યું હતું:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` અંદરના views વચ્ચેનું અંતર નિયંત્રિત કરે છે.

જો `spacing` સેટ ન કરીએ, તો `VStack` માં પણ default spacing હોય છે, પરંતુ default spacing હંમેશા આપણને જોઈએ તેવા પરિણામ જેવી ન હોય.

અહીં, કોર્સ title અને કોર્સ description બહુ નજીક હોય તો ભીડવાળું લાગે છે, તેથી અમે ઉપયોગ કરીએ છીએ:

```swift
spacing: 10
```

આથી તેમની વચ્ચે થોડું અંતર રહે છે.

દેખાવનું પરિણામ:

![view](../../../Resource/026_view9.png)

એ જ રીતે, ટોચનો વિસ્તાર અને content area પણ ઉપર-નીચે ગોઠવાય છે, તેથી તેમની વચ્ચેનું અંતર નિયંત્રિત કરવા માટે પણ `spacing` વાપરી શકાય છે.

હવે, `topView` અને `contentView` ને `body` માં મૂકો:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

દેખાવનું પરિણામ:

![view](../../../Resource/026_view10.png)

અહીં `VStack(spacing: 20)` `topView` અને `contentView` વચ્ચેનું અંતર નિયંત્રિત કરે છે.

અર્થાત્:

```swift
VStack(alignment: .leading, spacing: 10)
```

કોર્સ title અને કોર્સ description વચ્ચેનું અંતર નિયંત્રિત કરે છે.

```swift
VStack(spacing: 20)
```

ટોચના વિસ્તાર અને content area વચ્ચેનું અંતર નિયંત્રિત કરે છે.

બંને `spacing` છે, પરંતુ તે અલગ `VStack` પર કામ કરે છે, તેથી તેમના અસર વિસ્તાર પણ અલગ છે.

આ રીતે, content area નું view પૂર્ણ થયું.

## બટન વિસ્તાર

હવે નીચેનો button area બનાવીએ.

દેખાવનું પરિણામ:

![view](../../../Resource/026_view11.png)

button area મુખ્યત્વે એક play icon અને એક text થી બનેલો છે.

અમે `Image` વડે play icon બતાવી શકીએ છીએ, અને `Text` વડે button text બતાવી શકીએ છીએ.

અહીં પહેલા એક button appearance બનાવીએ:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("બટન ક્લિક થયું")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("શીખવાનું શરૂ કરો")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

દેખાવનું પરિણામ:

![view](../../../Resource/026_view12.png)

અહીં બે `HStack` વપરાયા છે:

અંદરનું `HStack` icon અને text ને આડી રીતે ગોઠવવા માટે છે:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("શીખવાનું શરૂ કરો")
}
```

બહારનું `HStack` `Spacer()` સાથે મળીને button appearance ને ડાબે બતાવવા માટે છે:

```swift
HStack {
    ...
    Spacer()
}
```

જ્યારે button પર click થાય છે, ત્યારે console માં `બટન ક્લિક થયું` output થાય છે.

## મૂળભૂત કાર્ડ પૂર્ણ

હવે, ટોચનો વિસ્તાર, content area અને button area ને જોડો:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

દેખાવનું પરિણામ:

![view](../../../Resource/026_view13.png)

અહીં સુધીમાં, એક મૂળભૂત કોર્સ card પૂર્ણ થઈ ગયું છે.

## Swift આઇકન પૃષ્ઠભૂમિ

છેલ્લે, આપણે card માટે એક અર્ધપારદર્શક Swift icon background ઉમેરીએ છીએ.

![view](../../../Resource/026_view.png)

અગાઉ અમે background color તરીકે `Color.indigo` નો ઉપયોગ કર્યો હતો. વાસ્તવમાં, `.background()` માત્ર રંગ ઉમેરવા માટે જ નહીં, પણ એક સંપૂર્ણ view ઉમેરવા માટે પણ વાપરી શકાય છે.

તેથી, અમે પહેલાં એક અલગ background view બનાવી શકીએ છીએ:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

આ background view માં, અમે `VStack`, `HStack` અને `Spacer()` નો ઉપયોગ કરીને Swift icon ને નીચે જમણી બાજુ ધકેલ્યું છે.

કારણ કે Swift icon માત્ર decorative background તરીકે છે, તેથી અહીં અર્ધપારદર્શક સફેદ રંગ વપરાયો છે:

```swift
Color.white.opacity(0.15)
```

આથી icon વધુ સ્પષ્ટ નહીં લાગે અને આગળના text content પર અસર નહીં કરે.

પછી, `backgroundView` ને card માં ઉમેરો:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

અંતિમ પરિણામ:

![view](../../../Resource/026_view14.png)

અહીં બે `.background()` સતત વપરાયા છે:

```swift
.background(backgroundView)
.background(Color.indigo)
```

પહેલું `.background()` Swift icon background ઉમેરવા માટે છે.
બીજું `.background()` indigo background ઉમેરવા માટે છે.

આ રીતે, Swift icon indigo background ઉપર દેખાશે, અને card background ના એક ભાગ તરીકે દેખાશે.

અહીંથી જોઈ શકાય છે કે `.background()` માત્ર રંગ ઉમેરવા માટે જ નહીં, પણ custom view ઉમેરવા માટે પણ વાપરી શકાય છે. ઘણા `.background()` ને સાથે વાપરીને વધુ સમૃદ્ધ background effects પણ બનાવી શકાય છે.

અહીં સુધીમાં, એક સંપૂર્ણ કોર્સ card પૂર્ણ થયું.

## સારાંશ

આ પાઠમાં, એક કોર્સ card દ્વારા SwiftUI માં સામાન્ય basic layout methods ની સમીક્ષા કરી.

અમે `Text` વડે text બતાવ્યું, `Image` વડે system icon બતાવ્યું, અને `VStack`, `HStack` તથા `Spacer()` વડે views ની ગોઠવણી નિયંત્રિત કરી.

અમે `.lineLimit()` શીખ્યું. તે text ને વધારેમાં વધારે કેટલી lines બતાવવી તે મર્યાદિત કરી શકે છે. જ્યારે content મર્યાદાથી વધે, ત્યારે વધારાનો ભાગ છોડાઈ જાય છે.

સાથે સાથે, અમે `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` જેવા સામાન્ય modifiers ની પણ સમીક્ષા કરી.

આ પાઠ પૂર્ણ કર્યા પછી, આપણે ઘણા નાના views ને એક સંપૂર્ણ card module માં જોડવા સક્ષમ થઈ ગયા છીએ.

SwiftUI development માં આ ખૂબ સામાન્ય વિચારસરણી છે: પહેલા નાના views અલગ કરો, પછી તેમને સંપૂર્ણ interface માં જોડો.

## સંપૂર્ણ કોડ

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("શરૂઆત કરનાર")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ પાઠ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI શરૂઆત કરનાર ટ્યુટોરીયલ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("શૂન્યથી SwiftUI શરૂ કરો અને Apple ના declarative UI development ને વ્યવસ્થિત રીતે શીખો. સ્પષ્ટ સમજાવટ અને વ્યવહારુ ઉદાહરણો દ્વારા, તમે layout, interaction અને state management ધીમે ધીમે શીખશો, જેથી સુંદર અને ઉપયોગી app interfaces બનાવી શકો.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("બટન ક્લિક થયું")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("શીખવાનું શરૂ કરો")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
