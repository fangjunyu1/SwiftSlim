# કસ્ટમ દૃશ્ય

આ પાઠમાં, આપણે SwiftUI લખવાની એક ખૂબ મહત્વપૂર્ણ રીત શીખીશું: **કસ્ટમ View**.

કસ્ટમ View પુનરાવર્તિત થતો View કોડનો એક ભાગ પેક કરી શકે છે, અને તેને વારંવાર ઉપયોગ કરી શકાય તેવા View માં બદલી શકે છે.

વાસ્તવિક App વિકાસમાં, આપણે વારંવાર આવી પરિસ્થિતિ જોીએ છીએ: ઘણી ઇન્ટરફેસની રચના સમાન હોય છે, પરંતુ દેખાડવામાં આવતી સામગ્રી અલગ હોય છે.

ઉદાહરણ તરીકે, કોઈ ફોરમ વેબસાઇટની પોસ્ટ સૂચિમાં, દરેક પોસ્ટમાં શીર્ષક, ચિત્ર, લાઈકની સંખ્યા વગેરે માહિતી હોઈ શકે છે.

![Reddit](../../../Resource/028_view1.png)

શોપિંગ વેબસાઇટની પ્રોડક્ટ સૂચિમાં, દરેક પ્રોડક્ટમાં ચિત્ર, નામ અને કિંમત વગેરે માહિતી હોઈ શકે છે.

![Amazon](../../../Resource/028_view2.png)

આ સામગ્રીની રચના સમાન છે; ફરક માત્ર દેખાડવામાં આવતા ડેટામાં છે.

જો દરેક આઇટમ માટે કોડ હાથથી લખીએ, તો કોડ ખૂબ લાંબો થઈ જશે, અને પછી ફેરફાર કરવો પણ અનુકૂળ નહીં રહે.

તેથી, આપણે સમાન રચનાને કસ્ટમ View તરીકે પેક કરી શકીએ છીએ, અને અલગ સામગ્રીને પેરામીટર તરીકે અંદર મોકલી શકીએ છીએ.

આ રીતે, એ જ View અલગ અલગ સામગ્રી બતાવી શકે છે.

## જરૂરી પરિસ્થિતિ

ઉદાહરણ તરીકે, હવે આપણે એક સેટિંગ્સ સૂચિ બનાવવી છે.

દેખાવ પરિણામ:

![view](../../../Resource/028_view.png)

આ સેટિંગ્સ સૂચિમાં ત્રણ અલગ સેટિંગ આઇટમ છે: `સેટિંગ્સ`, `ફોલ્ડર`, `સંગીત`.

તેમના આઇકન, રંગ અને શીર્ષક અલગ હોવા છતાં, સમગ્ર રચના સમાન છે:

- ડાબી બાજુ આઇકન
- આઇકનનો પૃષ્ઠભૂમિ રંગ
- મધ્યમાં શીર્ષક
- જમણી બાજુ તીર

જો કસ્ટમ View નો ઉપયોગ ન કરીએ, તો આપણે કદાચ આ રીતે લખીએ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("સેટિંગ્સ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("ફોલ્ડર")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("સંગીત")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

આ કોડ સામાન્ય રીતે દેખાઈ શકે છે, પરંતુ સમસ્યા પણ ખૂબ સ્પષ્ટ છે: ત્રણ સેટિંગ આઇટમનો કોડ લગભગ સંપૂર્ણપણે સમાન છે.

ફરક માત્ર આઇકન, રંગ અને શીર્ષકમાં છે:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("સેટિંગ્સ")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("ફોલ્ડર")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("સંગીત")
```

અર્થાત, દરેક સેટિંગ આઇટમની રચના સ્થિર છે, માત્ર આઇકન, રંગ અને શીર્ષક અલગ છે.

આવી પરિસ્થિતિ કસ્ટમ View વાપરવા માટે ખૂબ યોગ્ય છે.

### છાયો shadow

અહીં આપણે એક નવો modifier `.shadow(radius:)` ઉપયોગ કર્યો છે:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View માં છાયો ઉમેરી શકે છે.

`radius` છાયાના blur radius ને દર્શાવે છે. મૂલ્ય જેટલું મોટું હોય, સામાન્ય રીતે છાયાનો ફેલાવો તેટલો મોટો થાય છે, અને તે વધુ નરમ દેખાય છે.

અહીં તેને `1` પર સેટ કરવામાં આવ્યું છે, એટલે માત્ર ખૂબ હળવો છાયો પ્રભાવ ઉમેરવામાં આવ્યો છે.

## સેટિંગ આઇટમ View ને પેક કરવું

આગળ, આપણે દરેક સેટિંગ આઇટમને નવા View તરીકે પેક કરીએ છીએ.

`SettingItemView` બનાવી શકાય છે:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

આ View માં, આપણે ત્રણ properties વ્યાખ્યાયિત કરી છે:

```swift
let icon: String
let color: Color
let title: String
```

તેમાં:

- `icon` આઇકનનું નામ દર્શાવે છે
- `color` આઇકનનો પૃષ્ઠભૂમિ રંગ દર્શાવે છે
- `title` સેટિંગ આઇટમનું શીર્ષક દર્શાવે છે

કારણ કે આ ત્રણ સામગ્રી અલગ અલગ સેટિંગ આઇટમમાં અલગ હોય છે, તેથી આપણે તેને બહારથી મોકલી શકાય એવા પેરામીટર બનાવીએ છીએ.

## કસ્ટમ View નો ઉપયોગ કરવો

`SettingItemView` થયા પછી, હવે આપણે લાંબા `HStack` કોડને વારંવાર લખવાની જરૂર નથી.

હવે તેને આ રીતે વાપરી શકાય છે:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "સેટિંગ્સ")
```

આ કોડ લાઇનનો અર્થ છે એક સેટિંગ આઇટમ View બનાવવું અને ત્રણ પેરામીટર મોકલવા:

```swift
icon: "gear"
color: Color.blue
title: "સેટિંગ્સ"
```

મોકલ્યા પછી, `SettingItemView` ની અંદરની properties સંબંધિત મૂલ્યો મેળવે છે:

- `icon` નું મૂલ્ય `gear` છે
- `color` નું મૂલ્ય `Color.blue` છે
- `title` નું મૂલ્ય `"સેટિંગ્સ"` છે

તેથી, View અંદરનું `Image(systemName: icon)` ગિયર આઇકન બતાવશે, `.background(color)` નીલો પૃષ્ઠભૂમિ વાપરશે, અને `Text(title)` `સેટિંગ્સ` બતાવશે.

પૂર્ણ કોડ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "સેટિંગ્સ")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "ફોલ્ડર")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "સંગીત")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

દેખાવ પરિણામ:

![view](../../../Resource/028_view.png)

જોઈ શકાય છે કે પેક કર્યા પછી દેખાવ પરિણામ પહેલાની જેમ જ છે, પરંતુ કોડ વધુ સ્પષ્ટ થયો છે.

પહેલાં દરેક સેટિંગ આઇટમ માટે સંપૂર્ણ `HStack` ભાગ લખવો પડતો હતો, હવે ફક્ત એક કોડ લાઇન પૂરતી છે:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "સેટિંગ્સ")
```

આ જ કસ્ટમ View ની ભૂમિકા છે: **પુનરાવર્તિત View રચનાને પેક કરવી, અને ફક્ત અલગ સામગ્રીને પેરામીટર તરીકે મોકલવી.**

## પેરામીટર કેમ મોકલી શકાય છે

આગળ, આપણે સરળ રીતે સમજીએ કે કસ્ટમ View પેરામીટર કેમ સ્વીકારી શકે છે.

SwiftUI માં, View મૂળભૂત રીતે એક structure છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        Text("નમસ્તે, વિશ્વ!")
    }
}
```

અહીં `ContentView` એક structure છે.

જ્યારે આપણે લખીએ છીએ:

```swift
ContentView()
```

વાસ્તવમાં આપણે એક `ContentView` View બનાવી રહ્યા છીએ.

પાછળનું `()` તેની initialization method ને call કરવાનું દર્શાવે છે; તેને આ View બનાવવું તરીકે પણ સમજાઈ શકે છે.

કારણ કે આ `ContentView` માં બહારથી મોકલવાની કોઈ properties નથી, તેથી સીધું આ રીતે લખી શકાય છે:

```swift
ContentView()
```

પરંતુ જો View અંદર કોઈ એવી property હોય જેને મૂલ્ય આપવામાં આવ્યું નથી, તો View બનાવતી વખતે સંબંધિત મૂલ્ય મોકલવું પડે છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("નામ: \(name)")
    }
}
```

અહીં `name` એક property છે, અને તેનું default value નથી.

તેથી `ContentView` બનાવતી વખતે, `name` ને ચોક્કસ મૂલ્ય આપવું જરૂરી છે:

```swift
ContentView(name: "Fang Junyu")
```

આ રીતે, View અંદર આ મૂલ્યનો ઉપયોગ કરી શકાય છે:

```swift
Text("નામ: \(name)")
```

આ પણ એ કારણ છે કે `SettingItemView` બનાવતી વખતે આપણે પેરામીટર મોકલવા પડે છે:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "સેટિંગ્સ")
```

કારણ કે `SettingItemView` માં default value વગરની ત્રણ properties છે:

```swift
let icon: String
let color: Color
let title: String
```

તેથી આ View બનાવતી વખતે, તેને અંદર મોકલવી પડે છે. મોકલાયેલા પેરામીટર Swift દ્વારા View અંદરની properties ને મૂલ્ય આપવા માટે વપરાય છે.

## Initialization method

આગળ, આપણે initialization method ને થોડું વધુ ઊંડાણથી સમજીએ.

### Default initialization method

જ્યારે આપણે સામાન્ય View વ્યાખ્યાયિત કરીએ છીએ:

```swift
struct ContentView: View {
    var body: some View {
        Text("નમસ્તે, વિશ્વ!")
    }
}
```

આ કોડમાં, આપણે initialization method હાથથી લખી નથી.

પરંતુ જ્યારે આપણે આ View વાપરીએ છીએ, ત્યારે આ રીતે લખી શકીએ છીએ:

```swift
ContentView()
```

અહીં `()` વાસ્તવમાં `ContentView` બનાવવાનું દર્શાવે છે; તેને તેની initialization method ને call કરવું તરીકે પણ સમજાઈ શકે છે.

### initialization method દેખાતી ન હોવા છતાં તેને કેમ call કરી શકાય?

કારણ કે Swift compiler આપમેળે આપણા માટે એક initialization method બનાવે છે.

ધ્યાન આપવાની બાબત છે: **આ initialization method આપમેળે બને છે, અને સામાન્ય રીતે આપણે તેને કોડમાં સીધી જોઈ શકતા નથી.**

અર્થાત, ભલે આપણે `struct` માં હાથથી આ ન લખ્યું હોય:

```swift
init() {

}
```

Swift compiler પાછળથી આપણા માટે અંદાજે આવી initialization method બનાવશે:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("નમસ્તે, વિશ્વ!")
    }
}
```

એટલા માટે આપણે સીધું આ રીતે લખી શકીએ છીએ:

```swift
ContentView()
```

તેથી વાસ્તવિક કોડમાં, સામાન્ય રીતે initialization method હાથથી લખવાની જરૂર નથી.

ફક્ત એક બાબત સમજવી જરૂરી છે: **SwiftUI View બનાવતી વખતે, તે View ની initialization method call થાય છે. ભલે આપણે initialization method હાથથી ન લખી હોય, Swift તેને આપમેળે બનાવી શકે છે.**

### પેરામીટરવાળી initialization method

જો View માં default value વગરની કોઈ property હોય, ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("નામ: \(name)")
    }
}
```

Swift compiler property ના આધારે પેરામીટરવાળી initialization method આપમેળે બનાવે છે.

તેને સરળ રીતે આ રીતે સમજાઈ શકે છે:

```swift
init(name: String) {
    self.name = name
}
```

અહીં:

```swift
init(name: String)
```

નો અર્થ છે કે `ContentView` બનાવતી વખતે `String` પ્રકારનું `name` પેરામીટર મોકલવું પડે છે.

જ્યારે આપણે લખીએ છીએ:

```swift
ContentView(name: "Fang Junyu")
```

તેનો અર્થ છે: `"Fang Junyu"` ને initialization method માટે પેરામીટર તરીકે મોકલવું.

પછી initialization method અંદર આ ચાલશે:

```swift
self.name = name
```

આ કોડ લાઇનનો અર્થ છે: બહારથી મોકલાયેલ `name` ને હાલના View ની પોતાની `name` property ને આપવું.

તેને સરળ રીતે આ રીતે સમજાઈ શકે છે:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("નામ: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

આ રીતે, View અંદર મોકલાયેલ મૂલ્યનો ઉપયોગ કરી શકાય છે.

આ પેરામીટરવાળા View ની initialization પ્રક્રિયા છે: **જ્યારે View અંદરની property પાસે default value નથી, ત્યારે View બનાવતી વખતે સંબંધિત પેરામીટર મોકલવું જરૂરી છે, જેથી initialization method property ને મૂલ્ય આપવાનું કામ પૂર્ણ કરે.**

## જ્યારે property પાસે default value હોય

જો property પાસે પહેલેથી default value હોય, તો View બનાવતી વખતે પેરામીટર ન મોકલ્યું હોય તો પણ ચાલે છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("નામ: \(name)")
    }
}
```

અહીં `name` પાસે પહેલેથી default value છે:

```swift
"Fang Junyu"
```

તેથી `ContentView` બનાવતી વખતે સીધું આ રીતે લખી શકાય છે:

```swift
ContentView()
```

આ સમયે, `name` default value નો ઉપયોગ કરશે, અને ઇન્ટરફેસ બતાવશે:

```swift
નામ: Fang Junyu
```

નિશ્ચિતપણે, View બનાવતી વખતે નવું મૂલ્ય પણ મોકલી શકાય છે:

```swift
ContentView(name: "Sam")
```

આ સમયે, View default value નહિ પરંતુ બહારથી મોકલાયેલ `"Sam"` નો ઉપયોગ કરશે, અને ઇન્ટરફેસ બતાવશે:

```swift
નામ: Sam
```

સમજવામાં સરળતા માટે, Swift compiler આપમેળે બનાવતી initialization method ને સરળ રીતે આ રીતે જોઈ શકાય છે:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

અહીં `name: String = "Fang Junyu"` નો અર્થ છે: View બનાવતી વખતે `name` ન મોકલવામાં આવે, તો default value `"Fang Junyu"` નો ઉપયોગ કરો; View બનાવતી વખતે નવું `name` મોકલવામાં આવે, તો મોકલાયેલ મૂલ્યનો ઉપયોગ કરો.

અર્થાત: **જો બહારથી પેરામીટર ન મોકલવામાં આવે, તો property નું default value વપરાય છે; જો બહારથી પેરામીટર મોકલવામાં આવે, તો મોકલાયેલ મૂલ્ય વપરાય છે.**

## ફરી SettingItemView પર આવીએ

હવે આપણે ફરી SettingItemView જોઈએ:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

આ View ની રચના સ્થિર છે.

સ્થિર ભાગોમાં સામેલ છે:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

અલગ ભાગોમાં સામેલ છે:

```swift
icon
color
title
```

તેથી, આપણે અલગ સામગ્રીને properties બનાવીએ છીએ, અને View બનાવતી વખતે તેને પેરામીટર તરીકે મોકલીએ છીએ.

જ્યારે આપણે અલગ અલગ સેટિંગ આઇટમ બનાવીએ છીએ, ત્યારે ફક્ત અલગ પેરામીટર મોકલવા પડે છે:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "સેટિંગ્સ")
SettingItemView(icon: "folder", color: Color.brown, title: "ફોલ્ડર")
SettingItemView(icon: "music.note", color: Color.purple, title: "સંગીત")
```

આ રીતે, એ જ `SettingItemView` ત્રણ અલગ સેટિંગ આઇટમ બતાવી શકે છે.

આ કસ્ટમ View નો સૌથી સામાન્ય ઉપયોગ છે.

## સારાંશ

આ પાઠમાં, આપણે કસ્ટમ View શીખ્યું.

કસ્ટમ View ની મુખ્ય ભૂમિકા છે: **પુનરાવર્તિત View કોડને પેક કરવી, જેથી તેને ફરીથી ઉપયોગ કરી શકાય.**

આ ઉદાહરણમાં, ત્રણ સેટિંગ આઇટમની રચના સમાન છે, માત્ર આઇકન, રંગ અને શીર્ષક અલગ છે.

તેથી આપણે `SettingItemView` બનાવ્યું:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

પછી, આ View વાપરતી વખતે અલગ પેરામીટર મોકલીએ છીએ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "સેટિંગ્સ")
```

અહીંના પેરામીટર `SettingItemView` અંદર જશે.

આ રીતથી, આપણે ઓછા કોડનો ઉપયોગ કરીને સમાન રચના પરંતુ અલગ સામગ્રી ધરાવતા Views બનાવી શકીએ છીએ.

આ SwiftUI વિકાસમાં ખૂબ સામાન્ય લખવાની રીત પણ છે.
