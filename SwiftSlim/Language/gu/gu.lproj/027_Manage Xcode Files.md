# Xcode ફાઇલોનું સંચાલન

આ પાઠમાં, આપણે Xcode માં સામાન્ય રીતે થતી ફાઇલ કામગીરી શીખીશું.

પાછલા પાઠોમાં, આપણે મોટાભાગની કોડ `ContentView` માં લખી હતી. આ રીતે કોડ અને દેખાવનું પરિણામ જોવું સરળ બને છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

પરંતુ વાસ્તવિક App માં, સામાન્ય રીતે તમામ કોડ એક જ ફાઇલમાં લખાતો નથી.

જ્યારે પેજ, કોમ્પોનન્ટ અને ફંક્શન વધતા જાય છે, ત્યારે આપણે અલગ-અલગ views ને અલગ SwiftUI ફાઇલોમાં વહેંચવાની જરૂર પડે છે.

ઉદાહરણ તરીકે:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

આથી કોડની રચના વધુ સ્પષ્ટ બને છે, અને આગળ જાળવણી તથા ફેરફાર કરવો સરળ બને છે.

## ફાઇલોનું સંચાલન શા માટે કરવું

SwiftUI માં, એક પેજ અથવા એક કોમ્પોનન્ટ સામાન્ય રીતે અલગ view ફાઇલ તરીકે લખી શકાય છે.

ઉદાહરણ તરીકે:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

અહીં `CardView` એક SwiftUI view છે.

જો તમામ views `ContentView` માં જ લખવામાં આવે, તો કોડ સતત લાંબો બનશે અને વાંચવામાં પણ વધુ મુશ્કેલ બનશે.

તેથી, આપણે ફાઇલ બનાવવી, નામ બદલવું, ફાઇલ કાઢી નાખવી, તેમજ અલગ-અલગ કોડ ફાઇલોને મેનેજ કરવા માટે folders નો ઉપયોગ કરવો શીખવો જોઈએ.

## SwiftUI ફાઇલ બનાવવી

Xcode માં SwiftUI ફાઇલ બનાવવાની સામાન્ય રીતે બે રીતો હોય છે:

એક રીત છે ખાલી ફાઇલ બનાવવી, પછી પોતે કોડ લખવો.

બીજી રીત છે SwiftUI template ફાઇલ બનાવવી, જેમાં Xcode આપમેળે મૂળભૂત કોડ બનાવે છે.

શરૂઆત કરનાર માટે SwiftUI template ફાઇલનો ઉપયોગ વધુ ભલામણ કરાય છે, કારણ કે તે આપમેળે મૂળભૂત માળખું બનાવે છે.

### ખાલી ફાઇલ બનાવવી

Xcode ની ડાબી બાજુના Navigator વિસ્તારમાં, ખાલી જગ્યાએ અથવા folder પર right-click કરો અને `New Empty File` પસંદ કરો.

ક્રિયા કરવાની જગ્યા નીચે મુજબ છે:

![xcode](../../../Resource/027_view1.png)

ખાલી ફાઇલ બનાવ્યા પછી, Xcode સામાન્ય રીતે નામ વગરની Swift ફાઇલ બનાવે છે, જેમ કે `Untitled.swift`.

અમે તેનું નામ બદલીને `TestView.swift` રાખી શકીએ છીએ.

SwiftUI પ્રોજેક્ટમાં, જો આ ફાઇલ કોઈ view બતાવવા માટે વપરાય છે, તો નામના અંતે સામાન્ય રીતે `View` ઉમેરવાની ભલામણ થાય છે.

ઉદાહરણ તરીકે:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

આ ફરજિયાત નિયમ નથી, પરંતુ તેનાથી એક નજરમાં સમજાય છે કે આ view ફાઇલ છે.

ખાલી ફાઇલ બનાવ્યા પછી, ફાઇલમાં માત્ર ડિફૉલ્ટ comments હોઈ શકે છે, અથવા તે ખાલી પણ હોઈ શકે છે. આ Xcode ની આવૃત્તિ અને બનાવવાની રીત પર આધાર રાખે છે.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

આ સમયે, આપણે SwiftUI કોડ હાથથી લખવાની જરૂર પડે છે:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

આ રીતે, એક સરળ SwiftUI view ફાઇલ બનાવાઈ ગઈ.

### ફાઇલનું નામ બદલવું

જો ફાઇલ બનાવ્યા પછી તેનું નામ બદલવું હોય, તો Xcode ની ડાબી બાજુના Navigator વિસ્તારમાં ફાઇલ પસંદ કરો, પછી return key `⏎` દબાવો.

![xcode](../../../Resource/027_view2.png)

આ રીતે ફાઇલનું નામ બદલી શકાય છે.

ધ્યાન આપવાની વાત એ છે કે ફાઇલનું નામ બદલવાથી કોડમાં રહેલું view નું નામ આપમેળે બદલાતું નથી.

ઉદાહરણ તરીકે, ફાઇલનું નામ `ProfileView.swift` કર્યા પછી પણ, કોડમાં હજી `struct TestView: View` હોઈ શકે છે.

આથી જરૂર નથી કે ભૂલ આવે, પરંતુ તે સરળતાથી ગૂંચવણ પેદા કરી શકે છે.

તેથી, ફાઇલનું નામ અને view નું નામ એકસરખું રાખવાની ભલામણ થાય છે. ઉદાહરણ તરીકે, ફાઇલનું નામ `ProfileView.swift` હોય તો view નું નામ પણ `ProfileView` રાખો.

## SwiftUI template ફાઇલ બનાવવી

ખાલી ફાઇલ બનાવવા સિવાય, આપણે સીધું SwiftUI template ફાઇલ પણ બનાવી શકીએ છીએ.

Xcode ની ડાબી બાજુના Navigator વિસ્તારમાં, ખાલી જગ્યાએ અથવા folder પર right-click કરો અને `New File from Template...` પસંદ કરો.

ક્રિયા કરવાની જગ્યા નીચે મુજબ છે:

![xcode](../../../Resource/027_view3.png)

ખૂલતી વિન્ડોમાં, ઉપરથી અલગ-અલગ platform પસંદ કરી શકાય છે, જેમ કે `iOS`, `macOS` વગેરે.

અહીં વર્તમાન પ્રોજેક્ટને અનુરૂપ platform જ પસંદ રાખવું. ઉદાહરણ તરીકે, જો આપણે iOS App બનાવી રહ્યા છીએ, તો `iOS` પસંદ કરો.

![xcode](../../../Resource/027_view4.png)

પછી નીચે `SwiftUI View` પસંદ કરો.

![xcode](../../../Resource/027_view12.png)

પછી `Next` ક્લિક કરો, ફાઇલનું નામ દાખલ કરો અને save કરો.

ઉદાહરણ તરીકે, આપણે `Test2View.swift` નામની ફાઇલ બનાવીએ.

Xcode આપમેળે નીચે જેવી કોડ બનાવશે:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

ખાલી ફાઇલની સરખામણીમાં, template ફાઇલમાં આપમેળે `import SwiftUI`, `struct`, `body` અને `#Preview` સામેલ હોય છે.

તેથી શરૂઆત કરનાર માટે SwiftUI template ફાઇલનો ઉપયોગ વધુ સરળ છે, અને કોડ લખવાનું રહી જવાની શક્યતા પણ ઓછી થાય છે.

**ટિપ**: right-click કરીને ફાઇલ બનાવવાના સિવાય, તમે Xcode ની ડાબી બાજુના Navigator ના તળિયે આવેલા plus બટન પર ક્લિક કરીને પણ ફાઇલ અથવા folder બનાવી શકો છો.

![xcode](../../../Resource/027_view5.png)

## folder બનાવવું

જ્યારે ફાઇલો વધુ થવા લાગે, ત્યારે આપણે folders નો ઉપયોગ કરીને સંચાલન કરી શકીએ છીએ.

Xcode ની ડાબી બાજુના Navigator વિસ્તારમાં, ખાલી જગ્યાએ અથવા folder પર right-click કરો અને `New Folder` પસંદ કરો.

folder બનાવ્યા પછી, સંબંધિત ફાઇલોને folder માં drag કરી શકાય છે.

![xcode](../../../Resource/027_view7.png)

folder મુખ્યત્વે પ્રોજેક્ટનું માળખું ગોઠવવા માટે વપરાય છે, તે view જાતે વાપરવાની રીત બદલતું નથી.

જ્યાં સુધી view નું નામ સાચું છે, ત્યાં સુધી અન્ય ફાઇલોમાં હજી પણ `TestView()` અને `Test2View()` જેવી રીતે તેનો ઉપયોગ કરી શકાય છે.

## ફાઇલ અથવા folder કાઢી નાખવો

જો ફાઇલ અથવા folder કાઢી નાખવો હોય, તો Xcode ની ડાબી બાજુના Navigator વિસ્તારમાં સંબંધિત ફાઇલ પસંદ કરો, પછી right-click કરીને `Delete` પસંદ કરો.

ફાઇલ પસંદ કર્યા પછી delete key `⌫` દબાવીને પણ કરી શકાય છે.

Xcode delete confirmation window બતાવશે.

![xcode](../../../Resource/027_view10.png)

`Move to Trash` પસંદ કરવું એટલે ફાઇલને Trash માં ખસેડવી.

જો `Remove Reference` દેખાય, તો તેનો અર્થ છે કે માત્ર Xcode પ્રોજેક્ટમાંથી reference દૂર કરાશે, પરંતુ disk પરની મૂળ ફાઇલ કાઢી નહીં નાખાય.

શરૂઆત કરનાર માટે, જો તમે માત્ર પોતાની બનાવેલી સામાન્ય ફાઇલ કાઢી રહ્યા હો, તો સામાન્ય રીતે `Move to Trash` પસંદ કરવું પૂરતું છે.

## અનેક SwiftUI views બતાવવી

ફાઇલ બનાવવી શીખ્યા પછી, આપણે અલગ-અલગ views ને અલગ ફાઇલોમાં વહેંચી શકીએ છીએ.

ઉદાહરણ તરીકે, આપણે બે SwiftUI ફાઇલો બનાવીએ:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` લેખકનું નામ બતાવવા માટે વપરાય છે:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` card background બતાવવા માટે વપરાય છે:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

પછી, આપણે `ContentView` માં આ બે views નો ઉપયોગ કરી શકીએ છીએ:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

run કર્યા પછી, જોઈ શકાય છે કે `CardView` અને `AuthorView` એક સાથે સંયુક્ત રીતે દેખાય છે:

![xcode](../../../Resource/027_view11.png)

આ પરિણામમાં, `CardView` background તરીકે કામ કરે છે, અને `AuthorView` ઉપર દેખાય છે, કારણ કે તેઓ `ZStack` માં મૂકવામાં આવ્યા છે.

`ContentView` માં, આપણે `CardView()` અને `AuthorView()` દ્વારા આ બે views નો ઉપયોગ કરીએ છીએ. નામ પછીનું `()` આ view બનાવવા અને વાપરવાનો અર્થ આપે છે.

આ SwiftUI માં સામાન્ય view nesting છે: એક view ની અંદર અન્ય views નો ઉપયોગ ચાલુ રાખી શકાય છે.

## entry file

છેલ્લે, આપણે ફરી યાદ કરીએ કે App interface ક્યાંથી બતાવવાનું શરૂ કરે છે.

SwiftUI પ્રોજેક્ટમાં, સામાન્ય રીતે એક entry file હોય છે:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

અહીં `@main` દર્શાવે છે કે આ App નું entry position છે.

`WindowGroup` માં, આપણે જોઈએ છીએ:

```swift
ContentView()
```

આનો અર્થ છે કે App શરૂ થયા પછી સૌપ્રથમ `ContentView` બતાવવામાં આવે છે.

પછી `ContentView` ની અંદર ફરી બતાવવામાં આવે છે:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

તેથી view hierarchy ને નીચે મુજબ સમજી શકાય છે:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

જો આપણે entry file માં બતાવાતી view ને `CardView` માં બદલી દઈએ:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

તો App શરૂ થયા પછી ફક્ત `CardView` જ દેખાશે.

અર્થાત્, entry code માંનું `WindowGroup` નક્કી કરે છે કે App શરૂ થયા પછી કઈ view સૌપ્રથમ દેખાશે.

અને આ view ની અંદર, તે આગળ બીજી views પણ બતાવી શકે છે.

## સારાંશ

આ પાઠમાં, આપણે Xcode માં સામાન્ય ફાઇલ સંચાલન કામગીરી શીખી.

અમે SwiftUI ફાઇલ કેવી રીતે બનાવવી, ફાઇલનું નામ કેવી રીતે બદલવું, folder કેવી રીતે બનાવવું, અને ફાઇલ કેવી રીતે કાઢી નાખવી તે સમજ્યું.

સાથે સાથે, આપણે એક મહત્વપૂર્ણ ખ્યાલ પણ શીખ્યા: SwiftUI views ને અલગ-અલગ ફાઇલોમાં વહેંચી શકાય છે, અને પછી અન્ય views માં ઉપયોગ કરી શકાય છે.

ઉદાહરણ તરીકે:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

અહીં `CardView()` અને `AuthorView()` એટલે `ContentView` માં અન્ય views નો ઉપયોગ.

છેલ્લે, આપણે entry file ની display logic પણ ફરી જોઈ.

App શરૂ થાય ત્યારે, તે પહેલા `@main` ચિહ્નિત entry code માં પ્રવેશે છે, પછી `WindowGroup` માં રહેલી view બતાવે છે.

આ આપણને સમજવામાં મદદ કરે છે કે અલગ-અલગ SwiftUI ફાઇલો એકલવાયી નથી. તે એકબીજા સાથે મળીને આખરે સંપૂર્ણ App interface બનાવે છે.
