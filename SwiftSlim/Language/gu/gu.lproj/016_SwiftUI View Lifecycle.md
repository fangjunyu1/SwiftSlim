# SwiftUI view lifecycle

પાછલા પાઠમાં આપણે સમજ્યું હતું કે `@State` variables view ના lifecycle સાથે જોડાયેલા હોય છે, અને `onAppear` નો મૂળભૂત ઉપયોગ પણ શીખ્યો હતો.

આ પાઠમાં આપણે SwiftUI view lifecycle ને વધુ સારી રીતે સમજશું: view કેવી રીતે create થાય છે અને screen પર દેખાય છે, view ના variables કેવી રીતે create અને recreate થાય છે, અને `onAppear`, `onDisappear`, તેમજ `init` constructor કેવી રીતે કામ કરે છે.

આ જ્ઞાન દ્વારા આપણે SwiftUI view ના આખા build process અંગે વધુ સ્પષ્ટ સમજ બનાવી શકીશું.

## app ની startup sequence

iOS project બનાવતાં Xcode default રીતે બે files બનાવે છે:

```
ContentView.swift
પ્રોજેક્ટનામ + App.swift
```

અહીં “પ્રોજેક્ટનામ + App.swift” આખા application માટેનું entry file છે.

ઉદાહરણ તરીકે:

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

### code execution flow

જ્યારે આપણે app ચલાવીએ (simulator અથવા real device પર), ત્યારે system `@main` keyword શોધે છે:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

entry point મળ્યા પછી code execution શરૂ થાય છે.

સૌપ્રથમ App struct માં પ્રવેશ થાય છે, પછી `body` નો code ચાલે છે, પછી `WindowGroup` બનાવાય છે અને તેની અંદરનું `ContentView` load થાય છે.

### `WindowGroup` નું કામ

`WindowGroup` windows manage કરવા માટે છે:

```swift
WindowGroup {
    ContentView()
}
```

iPad અને macOS પર multi-window support છે, જ્યારે iPhone પર સામાન્ય રીતે ફક્ત એક જ window હોય છે.

એટલે iPhone પર `WindowGroup` મુખ્યત્વે પ્રથમ દેખાતું interface manage કરે છે.

### view load થવાની પ્રક્રિયા

જ્યારે system `ContentView` શોધે છે:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI `body` નો code execute કરે છે, પછી પાછા મળેલા view structure (`VStack`, `Text` વગેરે) પરથી interface બનાવે છે અને તેને screen પર બતાવે છે.

આ બધું પૂર્ણ થયા પછી આપણે screen પર `ContentView` જોઈ શકીએ.

![ContentView](../../Resource/016_view1.png)

અહીં ધ્યાનમાં રાખવાનું કે `body` view ને store કરતું નથી; તે view generate કરે છે.

એટલે જ્યારે પણ view refresh થાય, SwiftUI `body` ને ફરીથી calculate કરે છે અને નવી view structure બનાવે છે.

### preview logic

Xcode preview (Canvas) અને actual run, બે જુદા mechanisms છે.

ઉદાહરણ તરીકે, entry file માં debug output ઉમેરો:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

જો Xcode માં `ContentView` preview કરો, તો preview `@main` entry થી run થતું નથી, એટલે entry file માંનું `onAppear` trigger નહીં થાય.

પરંતુ simulator અથવા physical device પર run કરીએ, તો system `@main` થી શરૂ કરીને આખું App ચલાવે છે, એટલે entry માંનું `onAppear` પણ ચાલે છે અને debug output મળશે.

મુખ્ય મુદ્દો એ છે: Xcode preview “સ્થાનિક render” છે, જે ફક્ત હાલનું view બતાવવા માટે છે; simulator અને physical device “પૂર્ણ running environment” આપે છે, જ્યાં આખું App ચાલે છે.

એટલે App feature test કરતી વખતે simulator અથવા physical device પર આધાર રાખવો જોઈએ; Xcode preview સંપૂર્ણ runtime environment નથી.

## view નો lifecycle

હાલ સુધી આપણા મોટાભાગના code `ContentView` માં જ છે. પરંતુ actual app માં ઘણી views હોય છે અને જુદી પરિસ્થિતિઓમાં એક view થી બીજી view પર બદલાવ થાય છે.

ઉદાહરણ તરીકે “પિગી બેંક” માં:

![PiggyBank](../../Resource/016_view.png)

જો “જમા કરો” પર click કરીએ, તો `SaveView` દેખાય; જ્યારે saving પૂરી થાય અથવા view બંધ થાય, ત્યારે `SaveView` દૂર થાય છે.

આ જ એક view નો lifecycle છે: view create થાય છે, દેખાય છે, અને અંતે દૂર થાય છે.

### app બંધ કરવું

જ્યારે app બંધ થાય છે, ત્યારે બધી views દૂર થાય છે અને સંબંધિત state પણ અદૃશ્ય થાય છે.

એટલે `ContentView` અને અન્ય views memory માંથી દૂર થાય છે, અને app ની runtime state સાફ થઈ જાય છે.

## view માં variables નો lifecycle

SwiftUI માં variables નો lifecycle ઘણીવાર view સાથે જોડાયેલો હોય છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State` variables

`@State` વડે જાહેર કરેલી variables view ના lifecycle સાથે બંધાયેલી છે.

```swift
@State private var name = "FangJunyu"
```

જ્યારે view create થાય છે, ત્યારે `name` પણ create થાય છે; view દૂર થાય છે ત્યારે `name` પણ destroy થાય છે.

એથી જ data persistence માટે `UserDefaults` જેવી રીતોની જરૂર પડે છે.

### `body` ની અંદરની variables

`body` ની અંદર જાહેર કરેલી variable:

```swift
var num = 10
```

તેનો lifecycle `body` ના execution સાથે જોડાયેલો છે.

જ્યારે SwiftUI state બદલાય છે, જેમ કે:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

`name` બદલાતા `@State` data change detect કરે છે અને SwiftUI ને view ફરી calculate કરવા કહે છે.

`body` ફરી calculate થાય ત્યારે, તેમાંનો બધો code ફરી ચાલે છે, એટલે `body` ની અંદરની variables (`num` જેવી) ફરી create થાય છે.

આથી જ `body` ની અંદર જટિલ variables define કરવી ભલામણ થતી નથી.

કારણ કે દરેક refresh પર `body` ની અંદરની variables ફરીથી create થાય છે, જે performance cost વધારી શકે છે.

SwiftUI માં જુદા પ્રકારના data માટે જુદી management પદ્ધતિઓ વાપરવી જોઈએ: view ના lifecycle સાથે રહેતું data `@State` માં રાખવું અને temporary computed data `body` ની અંદર રાખી શકાય.

## `onAppear` અને `onDisappear`

પાછલા પાઠમાં આપણે `onAppear` શીખ્યું હતું: view દેખાય ત્યારે `onAppear` call થાય છે.

```swift
.onAppear {}
```

ઉદાહરણ તરીકે:

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
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode preview અથવા actual run દરમિયાન `onAppear` માંથી debug output જોઈ શકાય છે.

### `onDisappear`

`onAppear` નો જોડીદાર `onDisappear` છે:

```swift
.onDisappear {}
```

જ્યારે view બંધ થાય અથવા દૂર થાય, ત્યારે `onDisappear` call થાય છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

જ્યારે view remove થાય છે, ત્યારે `onDisappear` નો code ચાલે છે.

ટિપ: હાલના તબક્કે `ContentView` app નું root view છે, તેથી તેને સીધું બંધ કે દૂર કરી શકાતું નથી. આથી અત્યારે `onDisappear` નું effect સ્પષ્ટ રીતે જોવું મુશ્કેલ છે.

આગળ navigation અથવા નવા views ખોલવાનું શીખીશું ત્યારે `onDisappear` નો ઉપયોગ વધુ સ્પષ્ટ થશે.

## create અને show, બે જુદા તબક્કા

એક મહત્વની બાબત એ છે કે view create થવું અને view screen પર દેખાવું, બે જુદા stages છે.

જ્યારે view create થાય છે, ત્યારે struct નો constructor call થાય છે:

```swift
init() {}
```

કારણ કે SwiftUI views `struct` છે:

```swift
struct ContentView: View { ... }
```

એટલે view instance create થાય ત્યારે `init` execute થાય છે. પરંતુ view screen પર દેખાય ત્યારે `onAppear` execute થાય છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Xcode preview માં debug output આ રીતે જોઈ શકાય:

```swift
Create ContentView
Show ContentView
```

આથી સમજાય છે: પહેલા `init` view create કરે છે, પછી `body` calculate થાય છે, અને અંતે view દેખાતાં `onAppear` execute થાય છે.

એટલે view creation અને display, બે અલગ stages છે.

### `init` constructor

`init` Swift ની મૂળભૂત syntax છે. `struct` અને `class` બન્નેમાં define કરી શકાય છે, અને object initialize કરવા માટે વપરાય છે.

```swift
init() {}
```

SwiftUI માં જ્યારે view create થાય છે, ત્યારે system view નું `init` call કરે છે. તેનો ઉપયોગ parameters સ્વીકારવા અથવા initial data તૈયાર કરવા માટે થઈ શકે છે.

જો આપણે `init` જાતે ન લખીએ, તો Swift `struct` માટે default constructor બનાવી આપે છે.

`ContentView` જેવા SwiftUI views માટે, view create થાય ત્યારે `init` ચાલે છે; view દેખાય ત્યારે `onAppear` ચાલે છે.

એટલે `init` view creation નું method છે, અને આગળ parameters pass કરવા અથવા initial setup માટે ઉપયોગી બનશે.

## સારાંશ

આ પાઠમાં આપણે app startup sequence શીખી, એટલે entry file થી `ContentView` સુધી code execution flow સમજ્યો.

અમે SwiftUI view lifecycle સમજ્યું: view create થાય ત્યારે `init` ચાલે છે, screen પર દેખાય ત્યારે `onAppear`, અને view બંધ થાય અથવા દૂર થાય ત્યારે `onDisappear`.

અમે view update mechanism પણ સમજ્યો: views state-driven છે. જ્યારે `@State` જેવી state બદલાય છે, SwiftUI view refresh કરે છે, `body` ફરીથી calculate થાય છે, અને `body` ની અંદરની variables ફરી create થાય છે.

variables નો lifecycle view ના lifecycle સાથે જોડાયેલો હોઈ શકે છે, જ્યારે `body` ની અંદરનો temporary data દરેક refresh પર ફરી બને છે.

આ lifecycle અને variable behavior સારી રીતે સમજવાથી code ને વધુ ગોઠવેલા રીતે organize કરી શકાય છે અને app logic વધુ સ્પષ્ટ બને છે.
