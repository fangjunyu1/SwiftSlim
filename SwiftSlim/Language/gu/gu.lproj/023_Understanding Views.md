# દૃશ્યો સમજવું

આ પાઠમાં, આપણે ફરીથી શરૂઆતના `ContentView` પર પાછા ફરીએ છીએ.

```swift
struct ContentView: View {
    var body: some View {
        Text("હેલો, વિશ્વ!")
    }
}
```

જ્યારે આપણે પહેલી વાર SwiftUI ને ઓળખ્યું, ત્યારે `ContentView` માં ઘણી એવી keywords હતી જેને આપણે સમજતા નહોતાં.

જેમ કે `struct`, `View`, `var`, `body`, `some View` જેવી keywords.

તે સમયે આપણે કદાચ ફક્ત એટલું જ જાણતા હતા: **કોડ `body` ની અંદર લખીએ તો interface પર content દેખાશે.**

હવે આપણે `struct`, variables, methods અને protocols શીખી લીધાં છે, એટલે આપણે આ કોડને ફરીથી સમજીએ અને SwiftUI views વચ્ચેનો સંબંધ સમજીએ.

## ContentView ફરી જોવું

SwiftUI project બનાવ્યા પછી, Xcode default રીતે `ContentView` ફાઇલ બનાવે છે.

ઉદાહરણ કોડ આ મુજબ છે:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("હેલો, વિશ્વ!")
        }
        .padding()
    }
}
```

આ કોડને કેટલાંક ભાગોમાં વહેંચીને સમજાવી શકાય છે.

સૌપ્રથમ:

```swift
import SwiftUI
```

આ લાઇન SwiftUI framework import કરવાનું દર્શાવે છે.

SwiftUI import કર્યા પછી, આપણે `View`, `Text`, `Image`, `VStack`, `Button` જેવી SwiftUI views નો ઉપયોગ કરી શકીએ છીએ.

## ContentView સ્ટ્રક્ચર

આ કોડ લાઇન એક structure બનાવવાનું દર્શાવે છે:

```swift
struct ContentView: View
```

તેમાં:

```swift
struct ContentView
```

અર્થાત `ContentView` એક structure છે.

પાછલા પાઠમાં આપણે `struct` વિશે શીખ્યા હતા. તે સંબંધિત fields ને એક સાથે ગોઠવી શકે છે, અને તેમાં properties તથા methods હોઈ શકે છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("હેલો, વિશ્વ!")
    }
}
```

આ ઉદાહરણમાં, `ContentView` માં ત્રણ વસ્તુઓ છે: `name`, `printName` અને `body`.

અર્થાત `struct` સંબંધિત properties, methods અને view content ને એક સાથે ગોઠવી શકે છે.

![contentView](../../Resource/023_contentVIew.png)

## View એક protocol છે

આ કોડ લાઇન આગળ જોયે:

```swift
struct ContentView: View 
```

કોલન પછીનું `View` દર્શાવે છે કે `ContentView` `View` protocol ને conform કરે છે.

આ રીતે સમજી શકાય: જો `ContentView` SwiftUI view બનવા માંગે, તો તેને `View` protocol ની requirements પૂરી કરવી પડે.

### Identifiable protocol

પહેલાં movie list શીખતી વખતે, આપણે `Identifiable` protocol જોયો હતો.

તે સમયે આપણને `ForEach` માં `Movie` array iterate કરવું હતું, પરંતુ `Movie` structure પાસે unique identifier નહોતો, એટલે તે સીધું `ForEach` સાથે ઉપયોગ કરી શકાતું નહોતું.

ત્યારે આપણને `Movie` structure ને `Identifiable` protocol conform કરાવવું પડ્યું, જેથી તે `ForEach` ની unique identifier requirement પૂરી કરે.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protocol ની requirement છે: **આ type પાસે પોતાને ઓળખાવતું `id` field હોવું જોઈએ.**

જ્યારે `Movie` `id` field આપે છે, ત્યારે તે `Identifiable` ની requirements પૂરી કરી શકે છે.

એથી જ્યારે આપણે તેને `ForEach` માં વાપરીએ, SwiftUI દરેક data item ને ઓળખી શકે છે.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protocol

`View` protocol પણ આવું જ છે.

જો કોઈ type SwiftUI view બનવા માંગે, તો તેને `View` protocol conform કરવું પડે.

`View` protocol ની સૌથી મહત્વપૂર્ણ requirement છે કે તે `body` આપે.

```swift
struct ContentView: View {
    var body: some View {
        Text("હેલો, વિશ્વ!")
    }
}
```

`View` protocol ની requirement આ રીતે સમજી શકાય: **તે `body` દ્વારા return થતી SwiftUI view સ્વીકારે છે, અને `ContentView` `body` દ્વારા SwiftUI views બતાવે છે.**

### View conform ન કરીએ તો શું થાય?

જો આપણે આવું લખીએ:

```swift
struct ContentView {
}
```

આ ફક્ત સામાન્ય structure છે, SwiftUI view નથી.

તે સીધો error આપશે નહીં, કારણ કે સામાન્ય structure પોતે valid Swift code છે.

પરંતુ જો આપણે તેને preview માં મૂકીએ:

```swift
#Preview {
    ContentView()
}
```

ત્યારે error આવશે.

કારણ છે: **preview ને SwiftUI view બતાવવી પડે છે, પરંતુ આ `ContentView` `View` protocol conform કરતું નથી.**

તેથી જો આપણે `ContentView` ને interface પર બતાવી શકાય એવું બનાવવું હોય, તો તેને `View` protocol conform કરાવવું પડે:

```swift
struct ContentView: View {
}
```

તે સાથે, `View` protocol ની requirement મુજબ `body` આપવું પડે. જો `body` ન હોય, compiler હજુ error આપશે.

સાચી રીત:

```swift
struct ContentView: View {
    var body: some View {
        Text("હેલો, વિશ્વ!")
    }
}
```

આ સમયે `ContentView` એક સાચી display કરી શકાય તેવી SwiftUI view છે.

## body view display કરવાની entry છે

SwiftUI માં, `body` view content ની entry છે.

```swift
var body: some View {
    Text("હેલો, વિશ્વ!")
}
```

અહીં તેને ત્રણ ભાગમાં વહેંચી શકાય:

**1. var body**

```swift
var body
```

આ `body` નામની variable define કરે છે.

**2. some View**

```swift
: some View
```

આનો અર્થ છે કે આ `body` એક view return કરશે.

**3. { ... }**

```swift
{
    Text("હેલો, વિશ્વ!")
}
```

આ display થતું view content દર્શાવે છે. આ કોડમાં display થતું content `Text` view છે.

અર્થાત `body` ની અંદર જે લખીએ, તે interface પર દેખાય છે.

ઉદાહરણ તરીકે:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("નામ:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

આ કોડનો અર્થ છે: **interface પર vertical રીતે ગોઠવાયેલું content દેખાય છે, જેમાં બે text views છે.**

### body નામ મનપસંદ રીતે બદલી શકાય નહીં

ધ્યાન રાખવું જોઈએ કે `body` નામને મનપસંદ રીતે બદલી શકાય નહીં.

જો આપણે આવું લખીએ:

```swift
struct ContentView: View {
    var content: some View {
        Text("હેલો, વિશ્વ!")
    }
}
```

આ `content` પણ view property છે, પરંતુ તે `body` ને replace કરી શકતું નથી.

કારણ કે `View` protocol જે નામ માંગે છે તે `body` છે.

## some View શું છે?

SwiftUI માં, `some View` નો અર્થ એક ચોક્કસ view return કરવો, પરંતુ તે view નો સંપૂર્ણ type લખવાની જરૂર નથી.

```swift
var body: some View
```

અર્થાત `some View` નો અર્થ type નથી એવો નથી. સાચો type હજી પણ અસ્તિત્વમાં છે, અને compiler તે type જાણે છે, પરંતુ type complex હોઈ શકે છે, એટલે Swift આપણને તેને `some View` વડે છુપાવવા દે છે.

### some શું છે?

Swift માં, `some` opaque type declare કરવા માટેનું keyword છે.

opaque type નો અર્થ છે: **return value પાસે concrete type હોય છે, અને compiler જાણે છે કે તે concrete type શું છે, પરંતુ આપણે તે concrete type સીધો લખતા નથી.**

ઉદાહરણ તરીકે:

```swift
func makeView() -> some View {
    Text("હેલો")
}
```

આનો અર્થ છે કે `makeView` `View` protocol conform કરતો concrete type return કરશે.

### some ની જરૂર શા માટે?

variables શીખતી વખતે આપણે શીખ્યું હતું: **Swift માં values ને explicit type annotation જોઈએ, અથવા compiler તેનો type automatically infer કરે.**

ઉદાહરણ તરીકે:

```swift
let a: Int = 10
```

અહીં constant `a` `Int` type છે.

SwiftUI views પણ exception નથી. જ્યારે આપણે `body` વડે SwiftUI view display કરીએ, ત્યારે `body` ને સંબંધિત SwiftUI type return કરવું પડે.

ઉદાહરણ તરીકે, જો આપણે `body` વડે `Text` view display કરીએ, તો `body` ને સંબંધિત `Text` type return કરવું પડે.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

આ ઉદાહરણમાં, `body` ની અંદર display થતી view `Text` view છે, અને return type પણ `Text` છે.

ફક્ત internal type અને declared type મેળ ખાતા હોય ત્યારે જ compiler ની type consistency requirement પૂરી થાય છે.

**Type mismatch સમસ્યા**

જો આપણે `body` નો type `Color` રાખીએ, પરંતુ `Text` display કરીએ:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` નો type અને internal code નો type મેળ ખાતો નથી, એટલે type mismatch error થાય છે.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

આ સમયે આપણને `body` નો return type હાથથી બદલવો પડે.

**Complex view types**

વાસ્તવિક development માં interface સામાન્ય રીતે ફક્ત એક `Text` ધરાવતું નથી.

જો આપણે વધુ complex `VStack` display કરવું હોય, તો આપણને complex return type હાથથી લખવો પડે.

ઉદાહરણ તરીકે:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("હેલો, વિશ્વ!")
    }
}
```

આ કોડ `VStack` return કરે છે, અને `VStack` ની અંદર `Image` અને `Text` type ની views છે.

`body` નો return type છે:

```swift
VStack<TupleView<(Image,Text)>>
```

જોઈ શકાય છે કે આ return type ખૂબ complex છે, અને તેમાં `TupleView` પણ આવે છે, જે આપણે પહેલાં જોયું નહોતું.

અહીં `TupleView` ને આ રીતે સમજી શકાય: **ઘણી child views ને એક view તરીકે wrap કરવું.**

**હજુ વધુ complex view types**

જો આપણે view માં modifiers ઉમેરીએ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("હેલો, વિશ્વ!")
    }
    .padding()
}
```

તો આ view નો return type ખૂબ complex બની જાય છે અને અહીં વિગતે વર્ણવી શકાતો નથી.

હાલનો return type `VStack<TupleView<(Image,Text)>>` હવે modifiers ને વર્ણવી શકતો નથી, એટલે error થાય છે.

**some View return type સરળ બનાવે છે**

આ સ્થિતિ માટે SwiftUI એક સરળ solution આપે છે: કોડ સરળ બનાવવા માટે `some View` નો ઉપયોગ.

જ્યારે આપણે `body` ને `some View` type કરીએ:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("હેલો, વિશ્વ!")
    }
    .padding()
}
```

ત્યારે દરેક વખત view code બદલીએ ત્યારે સંપૂર્ણ return type ફરીથી લખવાની જરૂર રહેતી નથી.

કારણ કે `some View` નો અર્થ `View` protocol conform કરતી concrete view return કરવી.

બીજા શબ્દોમાં, `VStack`, `Image` જેવી SwiftUI views બધાં `View` protocol conform કરે છે. modifiers ઉમેર્યા પછી return થતો view type પણ `View` protocol conform કરે છે.

એથી તે બધું `some View` તરીકે return કરી શકાય છે.

### some View કોઈપણ view મનપસંદ રીતે return કરી શકતું નથી

`some View` complex types છુપાવી શકે છે, પરંતુ તે “typeless” નથી.

તેનો મુખ્ય નિયમ છે: **compiler ને એક concrete return type નક્કી કરી શકવું જોઈએ**.

ઉદાહરણ તરીકે:

```swift
var title: some View {
    Text("હેલો")
}
```

અહીં `Text` view return થાય છે.

પરંતુ જો આપણે બે views return કરવાનો પ્રયાસ કરીએ, તો error થાય છે:

```swift
var title: some View {
    Text("હેલો")
    Image(systemName: "star")
}
```

કારણ કે `some View` અંતે એક view structure return કરવું પડે છે, પરંતુ અહીં આપણે બે independent views return કરવાનો પ્રયાસ કરીએ છીએ.

### Solution

સામાન્ય રીતે બે solutions હોય છે: container અને `@ViewBuilder`.

**1. container વડે wrap કરવું**

```swift
var title: some View {
    VStack {
        Text("હેલો")
        Image(systemName: "star")
    }
}
```

આ કોડમાં, `title` `VStack` return કરે છે, જ્યારે `Text` અને `Image` `VStack` ની અંદરની child views છે.

`some View` ને મળતું view structure `VStack<...>` છે, જે `some View` દ્વારા એક view structure return કરવાની requirement પૂરી કરે છે. 

આ કારણથી જ SwiftUI શીખવાની શરૂઆતથી આપણે outer `VStack` container માં view code wrap કરવાની ભલામણ કરીએ છીએ.

**2. @ViewBuilder નો ઉપયોગ કરવો**

અમે `some View` પહેલા `@ViewBuilder` modifier પણ ઉમેરી શકીએ:

```swift
@ViewBuilder
var title: some View {
    Text("હેલો")
    Image(systemName: "star")
}
```

`@ViewBuilder` ઘણી views ને એક return result માં combine કરી શકે છે.

તેનો મૂળ અર્થ હજી પણ ઘણી views ને એક view માં merge કરવો છે, જેથી `some View` ની એક view structure return કરવાની requirement પૂરી થાય.

### body સીધું ઘણી views શા માટે લખી શકે?

જો આપણે `var body` ની અંદર ઘણી views લખીએ, જેમ કે:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("હેલો, વિશ્વ!")
}
```

કેટલાક cases માં આ `body` error આપશે નહીં.

કારણ કે `View` protocol માં `body` default રીતે `@ViewBuilder` support કરે છે:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protocol ના source code માં આપણે જોઈ શકીએ છીએ કે `@ViewBuilder` પહેલેથી `body` variable ને modify કરે છે.

તેથી સામાન્ય `some View` ની તુલનામાં `body` પાસે એક વધારાનું special handling layer છે, એટલે SwiftUI ઘણી views ને automatically એક view માં combine કરે છે.

**પહેલા containers નો ઉપયોગ કરો**

શરૂઆત કરનારાઓને સમજવામાં સરળ રહે તે માટે, ઘણી views ગોઠવવા પહેલા `VStack`, `HStack`, `ZStack`, `Group` જેવા containers વાપરવાની ભલામણ છે.

ઉદાહરણ તરીકે:

```swift
var body: some View {
    VStack {
        Text("હેલો")
        Image(systemName: "star")
    }
}
```

આ કોડને વધુ intuitive બનાવે છે: **outer layer `VStack` છે, અને તેની અંદર બે child views છે.**

## Views split કરવી

જો interface સરળ હોય, તો આપણે આખો કોડ `body` ની અંદર લખી શકીએ.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote માં આપનું સ્વાગત છે")
                Text("સુપ્રભાત")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("મને ક્લિક કરો") {
                print("મને ક્લિક કરો ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

આ view ની display style:

![view](../../Resource/023_view1.png)

આ code સામાન્ય રીતે ચાલી શકે છે, પરંતુ જો view code ખૂબ complex બને, તો `body` ની અંદરનો code લાંબો થતો જશે, અને તેને વાંચવું તથા modify કરવું વધુ મુશ્કેલ બનશે.

આ સમયે, આપણે અલગ અલગ areas ને independent view properties માં split કરી શકીએ.

### ઉપરની view split કરવી

ઉદાહરણ તરીકે, ઉપરનો area અલગ કરીએ:

```swift
var topHome: some View {
    HStack {
        Text("હોમ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

અહીં `topHome` એક variable છે, જે view return કરે છે.

કારણ કે તે view return કરે છે, તેનો type આ રીતે લખી શકાય:

```swift
some View
```

આ વાસ્તવમાં `body` જેવી જ usage છે:

```swift
var topHome: some View { }
var body: some View { }
```

બન્ને variables વડે views display કરે છે, અને return type `some View` છે.

### અન્ય views split કરવી

પછી, અન્ય parts split કરીએ:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote માં આપનું સ્વાગત છે")
        Text("સુપ્રભાત")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("મને ક્લિક કરો") {
        print("મને ક્લિક કરો")
    }
    .buttonStyle(.borderedProminent)
}
```

split કર્યા પછી, view variables ને `body` માં મૂકીએ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("હોમ")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote માં આપનું સ્વાગત છે")
            Text("સુપ્રભાત")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("મને ક્લિક કરો") {
            print("મને ક્લિક કરો")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

હવે `body` ફક્ત page structure વર્ણવવા માટે જવાબદાર છે:

```swift
topBar
welcomeText
colorList
clickButton
```

દરેક part ની ચોક્કસ implementation નીચેની સંબંધિત property માં મૂકવામાં આવે છે.

આ રીતે views split કરવાથી page structure વધુ clear બને છે. દરેક view area નું પોતાનું નામ હોય છે, એટલે code વાંચવો સરળ બને છે.

કોડના કોઈ ખાસ ભાગને modify કરતી વખતે, complex code માં શોધવાને બદલે આપણે સંબંધિત view area સીધું શોધી શકીએ.

### some View એક જ view return કરે છે

આ split view માં, જો આપણે ઘણી views return કરવાનો પ્રયાસ કરીએ:

```swift
var topBar: some View {
    Text("હોમ")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

error થાય છે, કારણ કે `some View` ફક્ત એક view structure return કરી શકે છે.

`body` થી અલગ રીતે, ordinary computed properties પાસે default રીતે `@ViewBuilder` નથી.

તેથી જો આપણને ઘણી views return કરવી હોય, તો આપણે `VStack`, `HStack` અથવા `Group` container વાપરીને ઘણી views ને એકમાં combine કરી શકીએ.

```swift
var topBar: some View {
    VStack {
        Text("હોમ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

અથવા views combine કરવા `@ViewBuilder` ઉમેરીએ:

```swift
@ViewBuilder
var topBar: some View {
    Text("હોમ")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

આથી આપણે ઘણી views return કરી શકીએ.

### if ઘણી views return કરે છે

ઉદાહરણ તરીકે:

```swift
var topHome: some View {
    if step == "હોમ" {
        HStack {
            Text("હોમ")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("ખાલી")
    }
}
```

આ code માં, `topHome` `step` ના content પ્રમાણે `HStack` અથવા `Text` return કરે છે, જે બે અલગ view types છે.

કારણ કે `some View` ને એક ચોક્કસ concrete return type જોઈએ છે, ordinary computed property માં `if` ની બે branches સીધા અલગ view types return કરી શકતી નથી, એટલે error થાય છે.

**Solution હજી પણ container માં wrap કરવું અથવા `@ViewBuilder` વાપરવું છે.**

### split views parentheses કેમ વાપરતી નથી?

`body` ની અંદર split કરેલી view properties વાપરતી વખતે, આપણે સીધું લખીએ:

```swift
topBar
welcomeText
colorList
clickButton
```

આ રીતે નહીં:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

કારણ કે `topBar`, `welcomeText`, `colorList` અને `clickButton` variables છે. વધુ ચોક્કસ કહીએ તો, તે computed properties છે, methods નથી.

**Properties ને parentheses ની જરૂર નથી.**

જો આપણે તેને method તરીકે લખીએ, તો પણ similar effect મેળવી શકાય:

```swift
func topBar() -> some View {
    HStack {
        Text("હોમ")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

આ code પણ similar effect મેળવી શકે છે. આ method call કરતાં view return થાય છે.

તેનો ઉપયોગ કરતી વખતે, આપણે લખવું પડે:

```swift
topBar()
```

SwiftUI માં, જો આપણે ફક્ત એવી view split કરીએ જેમાં parameters ની જરૂર નથી, તો computed property વાપરવું વધુ સામાન્ય છે.

```swift
var topBar: some View { ... }
```

## Nested views

કોડને properties માં split કરવા ઉપરાંત, આપણે નવી view structures પણ બનાવી શકીએ.

ઉદાહરણ તરીકે:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

આ `PinkColorView`, `ContentView` જેવી જ independent SwiftUI view છે.

જો તેને `ContentView` માં display કરવી હોય, તો view name પછી `()` ઉમેરી શકીએ.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

અહીં:

```swift
PinkColorView()
```

નો અર્થ `PinkColorView` instance બનાવવો.

કારણ કે `PinkColorView` `View` protocol conform કરે છે, તે `Text`, `Image`, `Button` જેવી જ રીતે બીજી views માં મૂકીને display કરી શકાય છે.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

આ view nesting છે: એક view બીજી view ની અંદર display થઈ શકે છે.

## View property કે નવી view?

જ્યારે view code સરળ હોય, ત્યારે સામાન્ય રીતે તેને split કરવાની જરૂર નથી. code વધુ complex બને ત્યારે જ views split કરવાની ભલામણ છે.

### View properties ક્યારે વાપરવી

જો તે current view માં content નો નાનો ભાગ હોય, તો view property વાપરી શકાય.

ઉદાહરણ તરીકે:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

આ content સામાન્ય રીતે ફક્ત current view માં જ વપરાય છે.

### નવી view ક્યારે બનાવવી

જો content relatively independent હોય, અથવા ભવિષ્યમાં ઘણી pages પર reuse થઈ શકે, તો નવી view બનાવવી વધુ યોગ્ય છે.

ઉદાહરણ તરીકે:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

આ title view છે. જો આપણે આ view ને બીજી views માં reusable component તરીકે વાપરવા માંગીએ.

અમે નવી view બનાવી શકીએ:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

પછી તેને અન્ય જગ્યાએ વાપરીએ:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

આ સમયે, આ view reusable independent component છે.

તેને સરળ રીતે આ રીતે summarize કરી શકાય:

- current view ના content areas `var xxx: some View` વાપરી શકે
- reusable independent components ને નવી `struct XxxView: View` તરીકે બનાવી શકાય
- data pass કરવાની જરૂર હોય તેવા components સામાન્ય રીતે નવી views તરીકે વધુ યોગ્ય છે.

## સારાંશ

આ પાઠમાં, આપણે SwiftUI ની સૌથી basic અને સૌથી મહત્વપૂર્ણ view structure ફરીથી સમજી.

`ContentView` એક structure છે. તે `struct` વડે define થાય છે અને page-related code ગોઠવવા માટે વપરાય છે.

`View` એક protocol છે. કોઈ structure SwiftUI view બનવા માંગે, તો તેને `View` protocol conform કરવું પડે.

`body` એ content છે જે `View` protocol આપણને provide કરવા કહે છે, અને તે નક્કી કરે છે કે આ view શું display કરશે.

`some View` નો અર્થ કોઈ ચોક્કસ concrete view return કરવી, તેના complex full type લખવાની જરૂર વગર.

જ્યારે view code લાંબો બને, ત્યારે આપણે `var xxx: some View` વાપરીને view code ને અનેક નાના areas માં split કરી શકીએ.

જ્યારે content નો કોઈ ભાગ relatively independent હોય અથવા reuse કરવાની જરૂર હોય, ત્યારે નવી view structure બનાવી શકાય અને તેને બીજી views માં `XxxView()` વડે display કરી શકાય.

સરળ શબ્દોમાં, SwiftUI interfaces ઘણી views ને combine કરીને બને છે. એક page માં ઘણી નાની views હોઈ શકે છે, અને નાની view પણ બીજી views ધરાવી શકે છે.
