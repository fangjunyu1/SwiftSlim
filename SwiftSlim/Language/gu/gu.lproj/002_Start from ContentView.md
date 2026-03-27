# ContentView થી શરૂઆત

## પાઠ પહેલાંની તૈયારી

આ પાઠમાં આપણે `ContentView.swift` ફાઇલથી શરૂઆત કરીને SwiftUI ની મૂળભૂત રચનાને સિસ્ટમેટિક રીતે ઓળખીશું, જેમાં સામેલ છે:

- ટિપ્પણીઓ
- `View` સ્ટ્રક્ચર
- `VStack` / `HStack` / `ZStack` લેઆઉટ
- `SF Symbols` આયકોન્સ
- view modifiers (`modifier`)
- preview code `#Preview`

સૌપ્રથમ, પહેલાં બનાવેલ Xcode પ્રોજેક્ટ શોધો અને `.xcodeproj` ફાઇલ પર ડબલ-ક્લિક કરો.

ડાબી બાજુના `Navigator` વિસ્તારમાં `ContentView.swift` ફાઇલ પસંદ કરો.

નોંધ: દરેક વખત પ્રોજેક્ટ ખોલતા `Canvas` માં `"Preview paused"` દેખાઈ શકે છે. Refresh બટન દબાવો એટલે preview ફરી શરૂ થઈ જશે.

![Swift](../../RESOURCE/002_view7.png)

## ContentView ને ઓળખીએ

`ContentView` નો કોડ:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

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

#Preview {
    ContentView()
}
```

કોડ ખૂબ ઓછો છે, પરંતુ તેમાં SwiftUI ની મુખ્ય રચના સમાયેલી છે.

### 1. ટિપ્પણીઓ

ફાઇલના ઉપરના ભાગમાં:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

આ ફાઇલ ટિપ્પણીઓ છે, જે ફાઇલ વિશેની માહિતી નોંધવા માટે વપરાય છે, જેમ કે ફાઇલનું નામ, પ્રોજેક્ટનું નામ, સર્જક અને બનાવવાની તારીખ.

Swift માં single-line comment માટે `//` નો ઉપયોગ થાય છે:

```swift
// આ ટિપ્પણી છે
```

ટિપ્પણીઓ કોડને વાંચવા અને સમજવા વધુ સરળ બનાવે છે, અને ડેવલપરને કોડની લોજિક સમજવામાં મદદ કરે છે.

વાસ્તવિક વિકાસમાં કોડ ઘણીવાર જટિલ બની શકે છે. જો ટિપ્પણીઓ ન લખવામાં આવે, તો ત્રણ દિવસ પછી પોતાનો કોડ પણ સમજાય નહીં તેવી સ્થિતિ આવી શકે.

આ કારણે, કોડ લખતી વખતે પોતે ટિપ્પણીઓ ઉમેરવાની ટેવ ખૂબ જ સારી ટેવ છે. ટિપ્પણીઓ કોડની લોજિક નોંધે છે અને પછીની મેન્ટેનન્સમાં મદદ કરે છે.

**કોડને તાત્કાલિક છુપાવવું**

ટિપ્પણીઓનો ઉપયોગ કોડને તાત્કાલિક અક્ષમ કરીને સમસ્યા શોધવા માટે પણ કરી શકાય છે.

ઉદાહરણ તરીકે:

```
A
B
C
```

`A`, `B`, `C` ત્રણ કોડ બ્લોક છે, અને તેમાં કોઈ એકમાં ભૂલ છે. આપણે સમસ્યા શોધવા માટે તાત્કાલિક comment કરી શકીએ.

સૌપ્રથમ `A` ને comment કરો:

```
// A
B
C
```

જો `A` comment કર્યા પછી કોડ સામાન્ય ચાલે, તો સમસ્યા `A` માં છે.

જો સમસ્યા હજી રહે, તો પછી `B` ને comment કરી તપાસી શકાય, અને આ રીતે આગળ વધીને સમસ્યાવાળો ભાગ શોધી શકાય.

વિકાસ દરમિયાન ઘણી સમસ્યાઓ આવતી હોય છે, અને comment નો ઉપયોગ કરીને સમસ્યા શોધવાનું આ એક અત્યંત ઉપયોગી સાધન છે.

Xcode માં, તમે આ shortcut નો ઉપયોગ કરી શકો છો:

```
Command ⌘ + /
```

ઝડપથી comment ઉમેરવા અથવા દૂર કરવા માટે.

### 2. SwiftUI framework ઇમ્પોર્ટ કરવું

```swift
import SwiftUI
```

આ કોડ સૂચવે છે કે આપણે `SwiftUI` framework ઇમ્પોર્ટ કરી રહ્યા છીએ.

`View`, `Text`, `Image`, `VStack` જેવા SwiftUI પ્રકારો બધા આ framework માંથી આવે છે.

જો `SwiftUI` ઇમ્પોર્ટ ન કરીએ, તો Xcode ભૂલ બતાવશે:

```
Cannot find type 'View' in scope
```

અર્થાત compiler `View` પ્રકારને ઓળખી શકતો નથી.

### 3. `View` સ્ટ્રક્ચર

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

પહેલી વાર આ `View` સ્ટ્રક્ચર જોતા તમને અજાણ્યું લાગી શકે, કારણ કે તેમાં `struct`, `View`, `var`, `body`, `some` જેવા keywords છે.

હાલમાં આપણે આ keywords વિગતે શીખ્યા નથી. અત્યારે એટલું જ જાણવું પૂરતું છે કે આ કોડ `ContentView` નામનું એક `View` બનાવે છે.

તમે `View` ને એક drawing board તરીકે સમજી શકો, જેના પર આપણે કંઈક દોરી શકીએ, અને આ દોરવાનું સાધન એટલે SwiftUI.

ઉદાહરણ તરીકે:

![Swift](../../RESOURCE/002_view.png)

ઉપરના ચિત્રમાં ત્રણ અલગ પેજ છે, અને વાસ્તવમાં તે ત્રણ અલગ `View` છે.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

જ્યારે આપણે SwiftUI નો ઉપયોગ કરીને App બનાવીએ છીએ, ત્યારે દરેક પેજ એક `View` હોય છે.

### 4. SwiftUI કોડ

`View` ની અંદર દેખાતો SwiftUI કોડ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

આ SwiftUI કોડ દર્શાવે છે કે આ એક vertical layout છે, જેમાં એક આયકોન અને એક લખાણ દેખાડવામાં આવે છે.

![Swift](../../RESOURCE/002_view1.png)

#### `VStack` લેઆઉટ

```swift
VStack { }  // vertical layout
```

`VStack` એટલે vertical layout container. તેની અંદરની views ઉપરથી નીચે ગોઠવાય છે.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI માં સામાન્ય ત્રણ layout પ્રકારો છે:

- `VStack` —— vertical ગોઠવણી
- `HStack` —— horizontal ગોઠવણી
- `ZStack` —— overlap ગોઠવણી (Z-axis)

```swift
HStack { }  // horizontal ગોઠવણી
ZStack { }  // overlap ગોઠવણી
```

વિવિધ layout ની ગોઠવણીનો અંદાજ:

![Swift](../../RESOURCE/002_view2.png)

ઉદાહરણ તરીકે, `HStack` નો ઉપયોગ કરીને horizontal ગોઠવણી:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

અહીં globe આયકોન અને લખાણ આડું ગોઠવાયેલું દેખાશે.

![Swift](../../RESOURCE/002_view3.png)

જ્યારે આપણે horizontal ગોઠવણી ઇચ્છીએ ત્યારે `HStack` નો ઉપયોગ કરીએ, અને overlap ગોઠવણી માટે `ZStack` નો ઉપયોગ કરીએ.

#### `Image` અને `SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

આ કોડ globe આયકોન દર્શાવે છે. આ globe આયકોન Apple ના `SF Symbols` સિસ્ટમમાંથી આવે છે.

![Swift](../../RESOURCE/002_view9.png)

આ કોડનો અર્થ છે: એક globe આયકોન દર્શાવવો, મોટા કદમાં, અને accent color સાથે.

અમે ફક્ત globe જ નહીં, અન્ય આયકોન પણ દર્શાવી શકીએ.

ઉદાહરણ તરીકે, backpack દર્શાવવો:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**બીજા આયકોન કેવી રીતે દર્શાવવાના?**

તે માટે Apple દ્વારા આપવામાં આવેલી અધિકૃત system icons library `SF Symbols` નો ઉપયોગ કરવો પડે.

Apple Developer ની અધિકૃત વેબસાઇટ ખોલો અને [SF Symbols](https://developer.apple.com/sf-symbols/) ડાઉનલોડ કરો.

![Swift](../../RESOURCE/002_sf.png)

પછી `SF Symbols` App ખોલો.

![Swift](../../RESOURCE/002_sf1.png)

ડાબી બાજુએ symbols categories છે અને જમણી બાજુએ સંબંધિત આયકોન્સ છે.

કોઈ આયકોન પર right-click કરીને `"拷贝1个名称"` પસંદ કરો; આ નામ જ તેનો string value છે.

ઉદાહરણ તરીકે:

```
"globe"
"backpack"
"heart"
```

આ આયકોનનું નામ `Image(systemName:)` માં મૂકો, અને તમે જુદા જુદા આયકોન દર્શાવી શકશો.

નોંધ: દરેક `SF Symbols` આયકોન માટે ઓછામાં ઓછું supported system version હોય છે. જો system version ઓછું હોય, તો આયકોન દેખાય નહીં. તેની compatibility માહિતી `SF Symbols` App માં જોઈ શકાય છે.

#### Modifiers

SwiftUI માં modifier એ view ના દેખાવ અથવા વર્તનમાં ફેરફાર કરવા માટેની એક રીત છે.

તમે modifier ને કપડાં જેમ સમજી શકો: કપડાં બદલાય એટલે દેખાવ પણ બદલાય.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` અને `foregroundStyle` એ `Image` view ના modifiers છે. `Image` ના મૂળ content ને બદલે વગર તે તેના દેખાવમાં ફેરફાર કરે છે.

**1. `imageScale`**

```swift
.imageScale(.large)
```

તે `SF Symbols` આયકોનનું કદ નિયંત્રિત કરે છે:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

તમે જુદા વિકલ્પ અજમાવીને `SF Symbols` આયકોનના જુદા કદ જોઈ શકો.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` foreground color નિયંત્રિત કરી શકે છે.

`.tint` હાલના environment ની accent color દર્શાવે છે. મૂળભૂત રીતે iOS માં તે નીલો હોય છે.

જો આપણે foreground color ને લાલ કરવા માંગીએ:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### `Text` view

`Text` એ ટેક્સ્ટ view છે, જે string દર્શાવવા માટે વપરાય છે.

```swift
Text("Hello, world!")
```

ઉદાહરણ તરીકે, મારું નામ બતાવવું:

```swift
Text("FangJunyu")
```

નોંધ: string હંમેશા `""` ડબલ quotes માં જ લખવો.

તમે તમારું નામ, ફોન નંબર અથવા બીજું કંઈપણ લખાણ દર્શાવવાનો પ્રયાસ કરી શકો.

#### `padding` અંતર

SwiftUI માં `padding` નો ઉપયોગ view ના content અને તેની boundary વચ્ચે ખાલી જગ્યા ઉમેરવા માટે થાય છે. તેને internal spacing (`padding / content inset`) કહી શકાય.

```swift
HStack {
    ...
}
.padding()
```

આ કોડ `HStack` view ને system default padding આપે છે.

**`padding` શું છે?**

`padding` એટલે "view ના content અને તેની boundary વચ્ચેની ખાલી જગ્યા".

નીચેના ચિત્રમાં, blue `HStack` પર padding ઉમેર્યા પછી blue વિસ્તાર અંદર તરફ સિકુડી જાય છે, એટલે તે "એક રિંગ જેટલો નાનો" દેખાય છે.

![Swift](../../RESOURCE/002_view6.png)

**Default padding**

`padding()` modifier system દ્વારા ભલામણ કરાયેલ default spacing વાપરે છે.

```swift
.padding()
```

આ મૂલ્ય પ્લેટફોર્મ અને context મુજબ બદલાઈ શકે છે. ઉદાહરણ તરીકે:

- iOS માં સામાન્ય રીતે આશરે `16 pt`
- macOS અથવા watchOS માં system default spacing જુદું હોઈ શકે છે, અને તે દરેક પ્લેટફોર્મની design guidelines પર આધારિત હોય છે

**Custom padding**

અમે view માટે અલગ અલગ દિશામાં અલગ padding પણ આપી શકીએ.

1. એક જ દિશામાં

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

દિશાનો અર્થ:

- `.top`: ઉપરનું અંતર
- `.bottom`: નીચેનું અંતર
- `.leading`: શરૂઆતની બાજુનું અંતર
- `.trailing`: અંતની બાજુનું અંતર

![Swift](../../RESOURCE/002_view12.png)

નોંધ: `leading` અને `trailing` ભાષાની દિશા મુજબ આપમેળે બદલાય છે. ઉદાહરણ તરીકે Arabic (`RTL`) પરિસ્થિતિમાં તે આપમેળે ઉલટાઈ જાય છે.

2. ઘણી દિશાઓ એકસાથે

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Array દ્વારા ઘણા દિશા વિકલ્પો એકસાથે આપી શકાય છે. Array નો વિગતવાર ઉપયોગ આગળના પાઠોમાં શીખીશું; અત્યારે ફક્ત આ રીતે લખી શકાય છે તે જાણવું પૂરતું છે.

3. Horizontal અથવા vertical દિશા

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

જે નીચેના બરાબર છે:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Padding દૂર કરવું**

જો તમારે કોઈ padding ન જ જોઈએ, તો `.padding(0)` વાપરી શકો:

```swift
.padding(0)
```

અથવા સીધું modifier કાઢી નાખો:

```swift
// .padding()
```

### 6. Preview કોડ

```swift
#Preview {
    ContentView()
}
```

આ કોડ `Canvas` માં `ContentView` view preview બનાવે છે.

નોંધ: `#Preview` Swift 5.9 / Xcode 15 માં ઉમેરાયેલું નવું syntax છે. તે પહેલાં `PreviewProvider` સ્ટ્રક્ચર વપરાતું હતું.

**જો `Preview` ને comment કરી દઈએ તો શું થશે?**

જો `Preview` ને comment કરીએ:

```swift
// #Preview {
//    ContentView()
// }
```

તો `Canvas` માં render થઈ શકે તેવું content દેખાશે નહીં.

![Swift](../../RESOURCE/002_xcode.png)

અર્થાત `#Preview` જ `Canvas` માં preview view બતાવવાનું નિયંત્રિત કરે છે.

જ્યારે Xcode માં SwiftUI view preview જોઈએ, ત્યારે `#Preview` ઉમેરવું. જો preview ની જરૂર ન હોય, તો `#Preview` ને comment અથવા delete પણ કરી શકાય.

## સારાંશ

ભલે `ContentView.swift` ફાઇલમાં કોડ ઓછો હોય, પરંતુ તેમાં SwiftUI ના ઘણા મુખ્ય ખ્યાલો સમાયેલા છે. શરૂઆતના શીખનાર માટે આ કોડ અજાણ્યો લાગી શકે, પરંતુ તેને ભાગોમાં તોડી સમજવાથી SwiftUI ની પ્રાથમિક સમજણ બાંધી શકાય.

આ પાઠમાં આપણે સૌપ્રથમ `//` ટિપ્પણીઓ શીખી, જેનો ઉપયોગ કોડની લોજિક સમજાવવા કે કોડને તાત્કાલિક અક્ષમ કરવા થાય છે.

પછી સમજ્યું કે SwiftUI ફાઇલમાં `SwiftUI` framework ઇમ્પોર્ટ કરવું ફરજિયાત છે:

```swift
import SwiftUI
```

જો framework ઇમ્પોર્ટ ન કરીએ, તો compiler `View` જેવા પ્રકારોને ઓળખી નહીં શકે.

પછી આપણે SwiftUI view ની મૂળભૂત રચના ઓળખી:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

અહીં `ContentView` view નું નામ છે.

અમે ત્રણ સામાન્ય layout containers પણ શીખ્યા: `VStack` (vertical), `HStack` (horizontal), અને `ZStack` (overlap).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

આ કોડ vertical container દર્શાવે છે, અને container ની અંદર એક આયકોન તથા એક લખાણ દર્શાવે છે.

`Image` થી `SF Symbols` આયકોન દેખાડી શકાય છે, અને modifiers દ્વારા તેનો કદ અને રંગ નિયંત્રિત કરી શકાય છે.

`Text` view દ્વારા લખાણ દેખાડવામાં આવે છે.

`padding` એ અંતર છે, જે view ની આસપાસ એક પારદર્શક જગ્યા ઉમેરે છે.

અંતે `#Preview` preview view છે, જે `Canvas` માં preview દર્શાવે છે.

### પાઠ પછીનો અભ્યાસ

શરૂઆતના શીખનારાઓ માટે આ પાઠ થોડો જટિલ લાગી શકે. તેથી, વધુ અભ્યાસ દ્વારા સમજ વધુ મજબૂત બનાવી શકાય:

- `SF Symbols` આયકોનનું નામ બદલો
- આયકોનનો foreground color કાળો કરો
- `VStack` ને `HStack` થી બદલો
- `Image` અથવા `Text` ને comment કરીને preview માં ફેરફાર નિહાળો

### વધારાનું: Code Completion

કોડ લખતી વખતે તમે કદાચ ધ્યાન આપ્યું હશે કે Xcode આપમેળે ઉપલબ્ધ વિકલ્પોની યાદી બતાવે છે.

ઉદાહરણ તરીકે, જ્યારે આપણે `imageScale` modifier બદલી રહ્યા હોઈએ:

```swift
.imageScale(.)
```

ત્યારે Xcode ઉપલબ્ધ વિકલ્પો બતાવે છે:

![Swift](../../RESOURCE/002_view10.png)

આ `Code Completion` સિસ્ટમ છે. તે type inference અને enum members ની સૂચનાઓ પર આધારિત છે, અને ટાઇપિંગ ઝડપ વધારે છે તેમજ ભૂલો ઘટાડે છે.

આગામી પાઠોમાં આપણે `enum` ને સત્તાવાર રીતે ઓળખીશું; અત્યારે તેની માત્ર પ્રાથમિક ઓળખ પૂરતી છે.
