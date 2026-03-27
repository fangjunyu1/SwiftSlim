# ContentView മുതൽ തുടങ്ങാം

## പാഠത്തിന് മുമ്പുള്ള തയ്യാറെടുപ്പ്

ഈ പാഠത്തിൽ നാം `ContentView.swift` file-ൽ നിന്ന് തുടങ്ങുകയും SwiftUI-യുടെ അടിസ്ഥാന ഘടനയെ ക്രമബദ്ധമായി മനസ്സിലാക്കുകയും ചെയ്യും. ഇതിൽ ഉൾപ്പെടുന്നത്:

- comments
- View structure
- VStack / HStack / ZStack layout
- SF Symbols icons
- view modifiers
- preview code `#Preview`

ആദ്യം, നിങ്ങൾ മുമ്പ് സൃഷ്ടിച്ച Xcode project കണ്ടെത്തി `.xcodeproj` file double-click ചെയ്യുക.

ഇടത് വശത്തിലെ Navigator navigation area-യിൽ നിന്ന് `ContentView.swift` file തിരഞ്ഞെടുക്കുക.

ശ്രദ്ധിക്കുക: project ഓരോ തവണ തുറക്കുമ്പോഴും Canvas-ൽ `"Preview paused"` എന്ന് കാണിച്ചേക്കാം. Refresh button അമർത്തിയാൽ preview തിരിച്ചുകിട്ടും.

![Swift](../../RESOURCE/002_view7.png)

## ContentView-നെ പരിചയപ്പെടുക

ContentView code:

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

കോഡ് കുറവാണെങ്കിലും ഇതിൽ SwiftUI-യുടെ core structure ഉൾപ്പെട്ടിരിക്കുന്നു.

### 1. Comment

File-ന്റെ മുകളിൽ:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

ഇത് file comment ആണ്. file name, project name, creator, created time എന്നിവ പോലുള്ള വിവരങ്ങൾ രേഖപ്പെടുത്താൻ ഇത് ഉപയോഗിക്കുന്നു.

Swift-ൽ single-line comment എഴുതാൻ `//` ഉപയോഗിക്കുന്നു:

```swift
// ഇത് ഒരു comment ആണ്
```

Comments code-ന്റെ readability മെച്ചപ്പെടുത്തുകയും developer-ന് code logic മനസ്സിലാക്കാൻ സഹായിക്കുകയും ചെയ്യുന്നു.

യഥാർത്ഥ development-ൽ code ചിലപ്പോൾ മനസ്സിലാക്കാൻ ബുദ്ധിമുട്ടാകാം. comments ഒന്നും ഇല്ലെങ്കിൽ, മൂന്ന് ദിവസം കഴിഞ്ഞ് സ്വന്തം code പോലും മനസ്സിലാകാത്ത അവസ്ഥ വരാം.

അതുകൊണ്ട് code എഴുതുമ്പോൾ സ്വമേധയായി comments ചേർക്കുന്നത് നല്ലൊരു development habit ആണ്. comments ഉപയോഗിച്ച് code logic രേഖപ്പെടുത്തുമ്പോൾ പിന്നീടുള്ള maintenance എളുപ്പമാകും.

**കോഡ് താൽക്കാലികമായി disable ചെയ്യുക**

Comments code താൽക്കാലികമായി disable ചെയ്യാനും debugging-ൽ സഹായിക്കും.

ഉദാഹരണത്തിന്:

```
A
B
C
```

`A`, `B`, `C` മൂന്ന് code sections ആണെന്ന് കരുതുക. ഇവയിൽ ഒന്നിൽ error ഉണ്ട്. അത് കണ്ടെത്താൻ comment ഉപയോഗിച്ച് താൽക്കാലികമായി disable ചെയ്യാം.

ആദ്യം `A`-യ്ക്ക് comment ചേർക്കുക:

```
// A
B
C
```

`A` comment ചെയ്തതിന് ശേഷം code സാധാരണയായി പ്രവർത്തിച്ചാൽ പ്രശ്നം `A`-ലാണെന്ന് മനസ്സിലാക്കാം.

ഇനിയും പ്രശ്നമുണ്ടെങ്കിൽ `B` comment ചെയ്യാം; ഇങ്ങനെ തുടർന്നാൽ പ്രശ്നമുള്ള ഭാഗം കണ്ടെത്താം.

Development സമയത്ത് പലതരം പ്രശ്നങ്ങളും വരും. അവയിൽ പലതിന്റെ കാരണം കണ്ടെത്താൻ code comment ചെയ്ത് പരിശോധിക്കേണ്ടിവരും. ഇത് bug ഉണ്ടായിരിക്കുന്ന ഭാഗം pinpoint ചെയ്യാൻ സഹായിക്കുന്നു.

Xcode-ൽ keyboard shortcut:

```
Command ⌘ + /
```

ഇത് ഉപയോഗിച്ച് comment വേഗത്തിൽ add ചെയ്യാനും remove ചെയ്യാനും കഴിയും.

### 2. SwiftUI framework import ചെയ്യുക

```swift
import SwiftUI
```

ഈ code SwiftUI framework import ചെയ്യുന്നു.

SwiftUI-യിലെ `View`, `Text`, `Image`, `VStack` പോലുള്ള types എല്ലാം ഈ framework-ലാണ് ഉള്ളത്.

SwiftUI import ചെയ്യാത്ത പക്ഷം Xcode error കാണിക്കും:

```
Cannot find type 'View' in scope
```

അത് compiler-ന് `View` type തിരിച്ചറിയാനാകുന്നില്ലെന്നതാണ് അർത്ഥം.

### 3. View structure

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ഈ `View` structure ആദ്യമായി കാണുമ്പോൾ അല്പം അന്യമായതായി തോന്നാം, കാരണം ഇതിൽ `struct`, `View`, `var`, `body`, `some` തുടങ്ങിയ keywords ഉണ്ട്.

ഈ keywords നാം ഇനിയും പഠിച്ചിട്ടില്ല. ഇപ്പോൾ അറിയേണ്ടത് ഇത്രയേ ഉള്ളു: ഈ code `ContentView` എന്ന പേരിലുള്ള ഒരു View സൃഷ്ടിക്കുന്നു.

`View`-നെ ഒരു drawing board പോലെ ചിന്തിക്കാം. നമുക്ക് അതിന് മുകളിൽ വരയ്ക്കാം; ആ വരയ്ക്കാനുള്ള tool SwiftUI ആണ്.

ഉദാഹരണത്തിന്:

![Swift](../../RESOURCE/002_view.png)

മുകളിൽ കാണുന്ന ചിത്രം മൂന്ന് pages കാണിക്കുന്നു; യാഥാർത്ഥ്യത്തിൽ അവ മൂന്ന് വ്യത്യസ്ത Views ആണ്.

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

SwiftUI ഉപയോഗിച്ച് app നിർമ്മിക്കുമ്പോൾ ഓരോ page-വും ഒരു View ആയിരിക്കും.

### 4. SwiftUI code

View-ന്റെ ഉള്ളിലെ SwiftUI code:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ഈ code ഒരു vertical arrangement container കാണിക്കുന്നു; container-ന്റെ ഉള്ളിൽ ഒരു icon ഉം ഒരു text ഉം കാണിക്കുന്നു.

`Image` ഉപയോഗിച്ച് SF Symbols icons കാണിക്കാം, കൂടാതെ modifiers ഉപയോഗിച്ച് icon-ന്റെ size ഉം color ഉം നിയന്ത്രിക്കാം.

`Text` view text content കാണിക്കുന്നു.

`padding` എന്നത് margin പോലെ പ്രവർത്തിക്കുന്നു; ഇത് view-ന്റെ ചുറ്റും ഒരു transparent space ഉണ്ടാക്കുന്നു.

അവസാനമായി `#Preview` preview view ഉണ്ട്; ഇത് Canvas-ൽ preview കാണിക്കാൻ സഹായിക്കുന്നു.

### പാഠാനന്തര അഭ്യാസം

തുടങ്ങുന്നവർക്ക് ഈ പാഠത്തിലെ ഉള്ളടക്കം അല്പം സങ്കീർണ്ണമായി തോന്നാം. താഴെ പറയുന്ന അഭ്യാസങ്ങൾ വഴി ഇതിനെ കൂടുതൽ ഉറപ്പാക്കാം:

- SF Symbols icon name മാറ്റുക
- icon-ന്റെ foreground color കറുപ്പാക്കി മാറ്റുക
- `VStack`-നെ `HStack` ആക്കി മാറ്റുക
- `Image` അല്ലെങ്കിൽ `Text` comment ചെയ്ത് preview view-ൽ വരുന്ന മാറ്റം നിരീക്ഷിക്കുക

### ചെറിയ അതിശയിപ്പിക്കൽ: Code Completion

Code എഴുതുമ്പോൾ നിങ്ങൾ ശ്രദ്ധിച്ചിരിക്കാം: Xcode ലഭ്യമായ options list സ്വയം കാണിക്കും.

ഉദാഹരണത്തിന്, `imageScale` modifier മാറ്റുമ്പോൾ:

```swift
.imageScale(.)
```

Xcode ലഭ്യമായ options കാണിക്കും:

![Swift](../../RESOURCE/002_view10.png)

ഇത് code completion mechanism ആണ്. ഇത് type inference ഉം enum member suggestions ഉം അടിസ്ഥാനമാക്കിയതാണ്; അതിനാൽ typing speed മെച്ചപ്പെടുകയും mistakes കുറയുകയും ചെയ്യും.

അടുത്ത പാഠങ്ങളിൽ `enum`-നെ ഔദ്യോഗികമായി പരിചയപ്പെടും. ഇപ്പോൾ ഇതിനെക്കുറിച്ച് ഒരു ലളിതമായ പരിചയം മാത്രം മതിയാകും.

ഈ SwiftUI code ഒരു vertical layout ആണ്, അതിൽ ഒരു icon-വും ഒരു text-വും കാണിക്കുന്നു.

![Swift](../../RESOURCE/002_view1.png)

#### VStack layout

```swift
VStack { }  // vertical layout
```

`VStack` എന്നത് vertical layout container ആണ്. അതിനുള്ളിലെ views മുകളിൽ നിന്ന് താഴേക്ക് ക്രമീകരിക്കപ്പെടും.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI-യിലെ സാധാരണ മൂന്ന് layouts:

- `VStack` —— vertical arrangement
- `HStack` —— horizontal arrangement
- `ZStack` —— overlay arrangement (Z-axis)

```swift
HStack { }  // horizontal arrangement
ZStack { }  // overlay arrangement
```

ഓരോ layout-ിന്റെയും ക്രമീകരണ സൂചന:

![Swift](../../RESOURCE/002_view2.png)

ഉദാഹരണത്തിന് `HStack` ഉപയോഗിച്ച് horizontal arrangement:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ഇപ്പോൾ globe icon ഉം text ഉം horizontal ആയി കാണാം.

![Swift](../../RESOURCE/002_view3.png)

Horizontally ക്രമീകരിക്കണമെങ്കിൽ `HStack` ഉപയോഗിക്കും. Overlay ആയി ഒരുമീതെ ഒന്നായി വേണമെങ്കിൽ `ZStack` ഉപയോഗിക്കും.

#### Imageയും SF Symbolsഉം

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ഈ code ഒരു globe icon കാണിക്കുന്നു. ഈ icon Apple-ന്റെ SF Symbols icon system-ിൽ നിന്നുള്ളതാണ്.

![Swift](../../RESOURCE/002_view9.png)

ഈ code-ന്റെ അർത്ഥം: ഒരു globe icon കാണിക്കുക, വലിയ വലിപ്പത്തിൽ, accent color ഉപയോഗിച്ച്.

Globe icon മാത്രം അല്ല, മറ്റു icons ഉം കാണിക്കാം.

ഉദാഹരണത്തിന് ഒരു backpack icon:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**മറ്റ് icons എങ്ങനെ കാണിക്കാം?**

ഇതിന് Apple-ന്റെ official system icon library ആയ SF Symbols ഉപയോഗിക്കണം.

Apple Developer website തുറന്ന് [SF Symbols](https://developer.apple.com/sf-symbols/) download ചെയ്യുക.

![Swift](../../RESOURCE/002_sf.png)

SF Symbols App തുറക്കുക.

![Swift](../../RESOURCE/002_sf1.png)

ഇടത് വശത്ത് symbol categories ഉം വലത് വശത്ത് അനുബന്ധ icons ഉം കാണാം.

ഒരു icon-ൽ right-click ചെയ്ത് `"Copy Name"` തിരഞ്ഞെടുക്കുക; അതാണ് string name.

ഉദാഹരണത്തിന്:

```
"globe"
"backpack"
"heart"
```

copy ചെയ്ത icon name `Image(systemName:)`-ൽ വെച്ചാൽ വിവിധ icons കാണിക്കാം.

ശ്രദ്ധിക്കുക: ഓരോ SF Symbols icon-ക്കും ഒരു minimum supported system version ഉണ്ട്. System version വളരെ പഴയതാണെങ്കിൽ icon കാണിക്കപ്പെടാതിരിക്കാൻ സാധ്യതയുണ്ട്. അതിന്റെ compatibility വിവരങ്ങൾ SF Symbols App-ൽ പരിശോധിക്കണം.

#### Modifiers

SwiftUI-ൽ modifier എന്നത് view-യുടെ appearance അല്ലെങ്കിൽ behavior മാറ്റാൻ ഉപയോഗിക്കുന്ന ഒരു method ആണ്.

Modifiers-നെ വസ്ത്രം പോലെ കരുതാം. വ്യത്യസ്ത വസ്ത്രം ധരിക്കുമ്പോൾ രൂപവും വ്യത്യസ്തമാകും.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale`, `foregroundStyle` എന്നിവ `Image` view-യുടെ modifiers ആണ്. `Image`-ന്റെ content മാറ്റാതെ, അതിന്റെ appearance മാത്രം മാറ്റുന്നു.

**1. imageScale**

```swift
.imageScale(.large)
```

ഇത് SF Symbols icon-ന്റെ വലിപ്പം നിയന്ത്രിക്കുന്നു:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

വിവിധ options മാറ്റി SF Symbols icon-നെ വ്യത്യസ്ത വലിപ്പങ്ങളിൽ കാണിക്കാം.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` foreground color നിയന്ത്രിക്കാൻ ഉപയോഗിക്കുന്നു.

`.tint` എന്നത് നിലവിലെ environment-ലെ accent color ആണ്. default ആയി iOS-ൽ ഇത് blue ആയിരിക്കും.

Foreground color red ആക്കണമെങ്കിൽ:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text view

`Text` ഒരു text view ആണ്; ഇത് strings കാണിക്കാൻ ഉപയോഗിക്കുന്നു.

```swift
Text("Hello, world!")
```

ഉദാഹരണത്തിന്, എന്റെ പേര് കാണിക്കുക:

```swift
Text("FangJunyu")
```

ശ്രദ്ധിക്കുക: strings എല്ലായ്പ്പോഴും `""` double quotes ഉപയോഗിച്ച് പൊതിയണം.

നിങ്ങളുടെ പേര്, ഫോൺ നമ്പർ തുടങ്ങിയവ കാണിച്ച് നോക്കാം.

#### padding

SwiftUI-ൽ `padding` എന്നത് view content-നും അതിന്റെ boundary-ക്കും ഇടയിൽ extra space നൽകുന്നതാണ്. ഇത് “inner spacing” അല്ലെങ്കിൽ “content inset” ആയി കരുതാം.

```swift
HStack {
    ...
}
.padding()
```

മുകളിലെ code `HStack` view-യ്ക്ക് system default padding ചേർക്കുന്നു.

**padding എന്താണ്?**

`padding` എന്നത് “view content-നും അതിന്റെ boundary-ക്കും ഇടയിലെ വിട്ടിടം” എന്നർത്ഥം.

താഴെയുള്ള ചിത്രത്തിൽ, blue നിറമുള്ള `HStack`-ന് padding നൽകിയാൽ blue area അകത്തോട്ടു ചുരുങ്ങിയതുപോലെ തോന്നും; കാണുമ്പോൾ അത് “ഒരു വളയം കുറഞ്ഞത്” പോലെ തോന്നും.

![Swift](../../RESOURCE/002_view6.png)

**default padding**

`padding()` modifier default ആയി system recommended standard spacing ഉപയോഗിക്കുന്നു.

```swift
.padding()
```

വ്യത്യസ്ത platform-ുകളിലും contexts-ലും ഈ value മാറാം. ഉദാഹരണത്തിന്:

- iOS-ൽ സാധാരണ ഏകദേശം `16 pt`
- macOS അല്ലെങ്കിൽ watchOS-ൽ system spacing വ്യത്യസ്തമായിരിക്കാം; അത് platform design guideline അനുസരിച്ചിരിക്കും

**custom padding**

ഒരു view-ക്ക് പ്രത്യേക direction-കളിൽ padding നിശ്ചയിക്കാനും കഴിയും.

1. ഒരു direction മാത്രം

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Direction വിശദീകരണം:

- `.top`: മുകളിലെ padding
- `.bottom`: താഴെയുള്ള padding
- `.leading`: മുന്നിലെ വശം
- `.trailing`: പിന്നിലെ വശം

![Swift](../../RESOURCE/002_view12.png)

ശ്രദ്ധിക്കുക: `leading`, `trailing` എന്നിവ language direction അനുസരിച്ച് സ്വയം മാറും. ഉദാഹരണത്തിന് Arabic പോലെയുള്ള RTL environment-ിൽ ഇത് reverse ആകും.

2. ഒരേസമയം പല directions

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Array ഉപയോഗിച്ച് ഒരേസമയം പല directions-ഉം നിർദേശിക്കാം. Arrays-ന്റെ ഉപയോഗം പിന്നീടുള്ള പാഠങ്ങളിൽ വിശദമായി പഠിക്കും; ഇപ്പോൾ ഈ syntax പരിചയപ്പെടുക മതി.

3. horizontal അല്ലെങ്കിൽ vertical direction

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

ഇത് തുല്യമാണ്:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**padding നീക്കം ചെയ്യുക**

padding ഒന്നും വേണ്ടെങ്കിൽ `.padding(0)` ഉപയോഗിക്കാം:

```swift
.padding(0)
```

അല്ലെങ്കിൽ modifier തന്നെ നീക്കം ചെയ്യാം:

```swift
// .padding()
```

### 6. Preview code

```swift
#Preview {
    ContentView()
}
```

ഈ code Canvas-ൽ `ContentView` preview സൃഷ്ടിക്കുന്നു.

ശ്രദ്ധിക്കുക: `#Preview` എന്നത് Swift 5.9 / Xcode 15-ൽ വന്ന പുതിയ syntax ആണ്. അതിനു മുമ്പ് `PreviewProvider` structure ആയിരുന്നു ഉപയോഗിച്ചിരുന്നത്.

**Preview comment ചെയ്താൽ എന്ത് സംഭവിക്കും?**

`Preview` comment ചെയ്താൽ:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas-ൽ render ചെയ്യാവുന്ന content ഇനി കാണിക്കപ്പെടുകയില്ല.

![Swift](../../RESOURCE/002_xcode.png)

അതായത് Canvas-ൽ preview view കാണിക്കണമോ വേണ്ടയോ എന്ന് `#Preview` ആണ് നിയന്ത്രിക്കുന്നത്.

Xcode-ൽ SwiftUI view preview ചെയ്യേണ്ടപ്പോൾ `#Preview` code ചേർക്കുക. Preview വേണ്ടതില്ലെങ്കിൽ `#Preview` comment ചെയ്യുകയോ delete ചെയ്യുകയോ ചെയ്യാം.

## സംഗ്രഹം

`ContentView.swift` file-ൽ code വളരെ കൂടുതലല്ലെങ്കിലും, അതിനുള്ളിൽ SwiftUI-യുടെ നിരവധി core concepts ഉൾപ്പെട്ടിരിക്കുന്നു. തുടങ്ങുന്നവർക്ക് ഇത് ആദ്യം അല്പം അന്യമായി തോന്നാം. പക്ഷേ code structure പൊളിച്ച് നോക്കുമ്പോൾ SwiftUI-യെക്കുറിച്ചുള്ള ഒരു അടിസ്ഥാന ധാരണ രൂപപ്പെടും.

ഈ പാഠത്തിലെ ഉള്ളടക്കം ഒന്ന് വീണ്ടുമിരുത്താം. ആദ്യം `//` comment പഠിച്ചു; ഇത് code logic വിശദീകരിക്കാനോ code താൽക്കാലികമായി disable ചെയ്യാനോ ഉപയോഗിക്കാം.

തുടർന്ന്, SwiftUI file-ൽ SwiftUI framework നിർബന്ധമായും import ചെയ്യേണ്ടതുണ്ടെന്ന് മനസ്സിലാക്കി:

```swift
import SwiftUI
```

Framework import ചെയ്യാതെ compiler-ന് `View` പോലുള്ള types തിരിച്ചറിയാനാകില്ല.

പിന്നീട് SwiftUI view-യുടെ അടിസ്ഥാന ഘടനയും പരിചയപ്പെട്ടു:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ഇവിടെ `ContentView` ആണ് view-ന്റെ പേര്.

നാം മൂന്ന് സാധാരണ layout containers-ഉം പഠിച്ചു: `VStack` (vertical arrangement), `HStack` (horizontal arrangement), `ZStack` (overlay arrangement).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```
