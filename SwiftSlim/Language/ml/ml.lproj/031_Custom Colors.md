# കസ്റ്റം നിറങ്ങൾ

ഈ പാഠത്തിൽ, SwiftUI-യിൽ നിറങ്ങൾ എങ്ങനെ കസ്റ്റമൈസ് ചെയ്യാമെന്ന് നാം പഠിക്കും.

മുൻപുള്ള പാഠങ്ങളിൽ, SwiftUI നൽകുന്ന ഡിഫോൾട്ട് നിറങ്ങൾ നാം ഇതിനകം ഉപയോഗിച്ചിട്ടുണ്ട്, ഉദാഹരണത്തിന്:

```swift
Color.blue
Color.red
Color.green
```

ഈ നിറങ്ങൾ ഉപയോഗിക്കാൻ സൗകര്യപ്രദമാണ്, പക്ഷേ യഥാർത്ഥ App വികസനത്തിൽ ഡിഫോൾട്ട് നിറങ്ങൾ പലപ്പോഴും മതിയായത്ര കൃത്യമാകണമെന്നില്ല.

ഉദാഹരണത്തിന്, ഒരു ഡിസൈൻ ഇത്തരത്തിലുള്ള നിറങ്ങൾ ഉപയോഗിച്ചേക്കാം:

```text
#2c54c2
#4875ed
#213e8d
```

ഇത്തരം നിറത്തെ Hex നിറം എന്നു വിളിക്കുന്നു.

ഈ പാഠത്തിൽ, ആദ്യം SwiftUI-യ്ക്ക് Hex നിറങ്ങൾ പിന്തുണയ്ക്കാൻ സാധ്യമാക്കും, തുടർന്ന് സാധാരണ ഉപയോഗിക്കുന്ന നിറങ്ങൾ ക്രമീകരിക്കാൻ `static` ഉപയോഗിക്കും.

അവസാനം, കസ്റ്റം നിറങ്ങൾ മൃഗ വിജ്ഞാനകോശ കാഴ്ചയിൽ പ്രയോഗിക്കുകയും, ബട്ടണുകൾക്ക് കൂടുതൽ ലെയർ ചെയ്ത തോന്നൽ നൽകാൻ gradient പശ്ചാത്തലം ഉപയോഗിക്കുകയും ചെയ്യും.

## എന്തുകൊണ്ട് കസ്റ്റം നിറങ്ങൾ ആവശ്യമാണ്?

SwiftUI-യിൽ, നമുക്ക് സിസ്റ്റം നിറങ്ങൾ നേരിട്ട് ഉപയോഗിക്കാം.

ഉദാഹരണത്തിന്:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

ഇവിടെ `.blue` എന്നത് നീലയെ സൂചിപ്പിക്കുന്നു. ഇത് യഥാർത്ഥത്തിൽ `Color.blue` എന്നതിന്റെ ചുരുക്കെഴുത്താണ്.

ഡിഫോൾട്ട് നിറങ്ങളുടെ നേട്ടം അവ ലളിതവും സൗകര്യപ്രദവുമാണെന്നതാണ്, പക്ഷേ ലഭ്യമായ തിരഞ്ഞെടുപ്പുകൾ പരിമിതമാണ്.

ഉദാഹരണത്തിന്:

```swift
Color.blue
```

ഇത് SwiftUI നൽകുന്ന ഡിഫോൾട്ട് നീല മാത്രം പ്രതിനിധീകരിക്കും.

![Color.blue](../../../Resource/031_color6.png)

എന്നാൽ യഥാർത്ഥ വികസനത്തിൽ, നമുക്ക് പലപ്പോഴും കൂടുതൽ നിർദ്ദിഷ്ട നിറങ്ങൾ ആവശ്യമായി വരും.

ഉദാഹരണത്തിന്, എല്ലാം നീല നിറങ്ങളായാലും, ഇളം നീല, ഇരുണ്ട നീല, ചാരനിറം കലർന്ന നീല, തെളിഞ്ഞ നീല തുടങ്ങിയ വ്യത്യസ്ത ഫലങ്ങൾ ഉണ്ടാകാം.

![More Blue](../../../Resource/031_color5.png)

ഈ സമയത്ത് `Color.blue` മാത്രം ഉപയോഗിച്ചാൽ, ഡിസൈൻ ഫലം പുനഃസൃഷ്ടിക്കുന്നത് ബുദ്ധിമുട്ടായിരിക്കും.

അതിനാൽ, SwiftUI-യ്ക്ക് കസ്റ്റം നിറങ്ങൾ പിന്തുണയ്ക്കാൻ നമുക്ക് സാധ്യമാക്കണം.

## Hex നിറം എന്താണ്?

സ്ക്രീനിലെ നിറങ്ങൾ സാധാരണയായി ചുവപ്പ്, പച്ച, നീല എന്നീ മൂന്ന് ചാനലുകൾ ചേർന്നതാണ്. ഇതാണ് RGB.

RGB എന്നത് ഇവയെ സൂചിപ്പിക്കുന്നു:

```text
Red     // ചുവപ്പ്
Green   // പച്ച
Blue    // നീല
```

RGB നിറം പ്രതിനിധീകരിക്കുന്ന ഒരു രീതിയാണ് Hex നിറം.

ഉദാഹരണത്തിന്:

```swift
#5479FF
```

ഈ നിറമൂല്യം മൂന്ന് ഭാഗങ്ങളായി ലളിതമായി മനസ്സിലാക്കാം:

```text
54  // ചുവപ്പ് ചാനലിനെ സൂചിപ്പിക്കുന്നു
79  // പച്ച ചാനലിനെ സൂചിപ്പിക്കുന്നു
FF  // നീല ചാനലിനെ സൂചിപ്പിക്കുന്നു
```

ഈ പാഠത്തിൽ, ഈ മൂല്യങ്ങൾ കണക്കാക്കേണ്ടതില്ല, hexadecimal നിയമങ്ങൾ ആഴത്തിൽ മനസ്സിലാക്കേണ്ടതുമില്ല.

ഇപ്പോൾ നമുക്ക് അറിയേണ്ടത് ഇത്രമാത്രം: `#5479FF` ഒരു നിർദ്ദിഷ്ട നിറത്തെ സൂചിപ്പിക്കുന്നു.

പിന്നീട് `#2c54c2`, `#4875ed` പോലുള്ള രൂപങ്ങൾ കാണുമ്പോൾ, ആദ്യം അവയെ നിറമൂല്യങ്ങളായി മനസ്സിലാക്കാം.

Sketch, Figma, Photoshop പോലുള്ള ഡിസൈൻ ടൂളുകളിലും ഇത്തരത്തിലുള്ള നിറമൂല്യങ്ങൾ പലപ്പോഴും കാണാം.

![color](../../../Resource/031_color.png)

എന്നാൽ SwiftUI ഡിഫോൾട്ടായി ഇത് നേരിട്ട് എഴുതുന്നത് പിന്തുണയ്ക്കുന്നില്ല:

```swift
Color(hex: "#5479FF")
```

അതിനാൽ, Hex സ്ട്രിംഗുകളിൽ നിന്ന് നിറങ്ങൾ സൃഷ്ടിക്കാൻ പിന്തുണയ്ക്കുന്ന രീതിയിൽ `Color` ടൈപ്പ് നമുക്ക് തന്നെ വിപുലീകരിക്കണം.

## Color+Hex.swift ഫയൽ സൃഷ്ടിക്കുക

ആദ്യം, ഒരു പുതിയ Swift ഫയൽ സൃഷ്ടിക്കുക.

ഫയൽ നാമം ഇങ്ങനെ എഴുതാം:

```text
Color.swift
```

കൂടുതൽ വ്യക്തമായി ഇങ്ങനെ എഴുതാനും കഴിയും:

```text
Color+Hex.swift
```

ഇവിടെ കൂടുതൽ ശുപാർശ ചെയ്യുന്നത് ഇതാണ്:

```text
Color+Hex.swift
```

Swift പ്രോജക്റ്റുകളിൽ `Color+Hex.swift` പോലുള്ള ഫയൽ പേരുകൾ വളരെ സാധാരണമാണ്.

ഈ ഫയൽ `Color`-ന് Hex കഴിവ് ചേർക്കുന്ന ഒരു extension ഫയലാണെന്ന് അതിന് അർത്ഥമുണ്ട്.

ഫയൽ നാമം കോഡ് പ്രവർത്തനത്തെ നേരിട്ട് ബാധിക്കില്ല. ഫയലിന്റെ ഉപയോഗം നമുക്ക് എളുപ്പത്തിൽ മനസ്സിലാക്കാൻ സഹായിക്കാനാണ് ഇത് ഉപയോഗിക്കുന്നത്.

## Color(hex:) കോഡ് ചേർക്കുക

`Color+Hex.swift` ഫയലിൽ, താഴെയുള്ള കോഡ് എഴുതുക:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

ഈ കോഡ് `extension` ഉപയോഗിച്ച് `Color` ടൈപ്പ് വിപുലീകരിക്കുകയും `Color`-ന് ഒരു പുതിയ initializer ചേർക്കുകയും ചെയ്യുന്നു:

```swift
init(hex: String)
```

ഈ initializer ലഭിച്ചതിനുശേഷം, ഒരു കസ്റ്റം നിറം സൃഷ്ടിക്കാൻ നമുക്ക് Hex സ്ട്രിംഗ് `Color`-ലേക്ക് നൽകാം:

```swift
Color(hex: "#5479FF")
```

ഈ extension കോഡിന്റെ ഉള്ളിൽ, Hex സ്ട്രിംഗ് SwiftUI തിരിച്ചറിയാൻ കഴിയുന്ന RGB നിറമായി മാറ്റപ്പെടുന്നു.

ഈ ഘട്ടത്തിൽ, ഓരോ വരിയിലുമുള്ള പരിവർത്തന തർക്കം ആഴത്തിൽ മനസ്സിലാക്കേണ്ടതില്ല. ചേർത്ത `Color(hex:)` രീതി Hex നിറമൂല്യങ്ങളിൽ നിന്ന് കസ്റ്റം നിറങ്ങൾ സൃഷ്ടിക്കാൻ സഹായിക്കുന്നു എന്നത് മാത്രം അറിയാൽ മതി.

## കസ്റ്റം നിറങ്ങൾ ഉപയോഗിക്കുക

ഇപ്പോൾ, `ContentView`-യിൽ കസ്റ്റം നിറങ്ങൾ പരീക്ഷിക്കാം.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

പ്രദർശന ഫലം:

![color](../../../Resource/031_color1.png)

ഈ ഉദാഹരണത്തിൽ, ആദ്യ വരി സിസ്റ്റം നിറമാണ് ഉപയോഗിക്കുന്നത്:

```swift
.foregroundStyle(Color.blue)
```

അടുത്ത മൂന്ന് വരികൾ കസ്റ്റം Hex നിറങ്ങളാണ് ഉപയോഗിക്കുന്നത്:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

താരതമ്യം ചെയ്താൽ, സിസ്റ്റം നീലയ്ക്ക് ഒരു ഡിഫോൾട്ട് ഫലം മാത്രമേ ഉള്ളൂ എന്ന് കാണാം.

എന്നാൽ Hex നിറങ്ങൾ കൂടുതൽ സൂക്ഷ്മമായ നീല വ്യത്യാസങ്ങൾ പ്രതിനിധീകരിക്കാൻ കഴിയും.

ഇതാണ് കസ്റ്റം നിറങ്ങളുടെ മൂല്യം: അവ interface നിറങ്ങളെ യഥാർത്ഥ ഡിസൈനിനോട് കൂടുതൽ അടുത്തതാക്കുകയും, App-ന്റെ ദൃശ്യശൈലി നിയന്ത്രിക്കാൻ നമുക്ക് കൂടുതൽ സൗകര്യം നൽകുകയും ചെയ്യുന്നു.

## നിറങ്ങൾ ക്രമീകരിക്കാൻ static ഉപയോഗിക്കുക

ഇപ്പോൾ, Hex സ്ട്രിംഗുകളിൽ നിന്ന് നമുക്ക് ഇതിനകം നിറങ്ങൾ സൃഷ്ടിക്കാം:

```swift
Color(hex: "#2c54c2")
```

ഈ എഴുത്തുരീതി സാധാരണയായി പ്രവർത്തിക്കും, പക്ഷേ ഒരേ നിറം പല സ്ഥലങ്ങളിലും ആവർത്തിച്ച് പ്രത്യക്ഷപ്പെട്ടാൽ, പിന്നീടുള്ള പരിപാലനം സൗകര്യപ്രദമാകില്ല.

ഈ നിറമൂല്യം 10 സ്ഥലങ്ങളിൽ എഴുതിയിട്ടുണ്ടെങ്കിൽ, പിന്നീട് ഈ നീല മാറ്റണമെങ്കിൽ ഓരോ സ്ഥലവും പ്രത്യേകം തിരുത്തണം.

ഈ സമയത്ത്, സാധാരണ ഉപയോഗിക്കുന്ന നിറങ്ങൾ ഒരിടത്ത് ക്രമീകരിക്കാൻ നമുക്ക് `static` ഉപയോഗിക്കാം.

`Color+Hex.swift` ഫയലിന്റെ അടിയിൽ, താഴെയുള്ള കോഡ് തുടർന്നു ചേർക്കുക:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ഇവിടെ, നാം `Color`-ന് മൂന്ന് static properties ചേർത്തിരിക്കുന്നു: `animalBlue`, `animalLightBlue`, `animalDarkBlue`. അവ വ്യത്യസ്ത തീവ്രതകളിലുള്ള നീലയെ പ്രതിനിധീകരിക്കുന്നു.

ഈ properties `static` ഉപയോഗിക്കുന്നതിനാൽ, അവ `Color` ടൈപ്പ് തന്നെക്കാണ് சேர்ந்தത്.

ഉപയോഗിക്കുമ്പോൾ, `Color.` വഴി നേരിട്ട് അവ access ചെയ്യാം:

```swift
Color.animalBlue
```

Hex സ്ട്രിംഗ് നേരിട്ട് എഴുതുന്നതിനേക്കാൾ ഈ എഴുത്തുരീതി കൂടുതൽ വ്യക്തമാണ്.

`Color.animalBlue` കാണുമ്പോൾ, അത് മൃഗ വിജ്ഞാനകോശത്തിൽ ഉപയോഗിക്കുന്ന നീല നിറമാണെന്ന് നമുക്ക് മനസ്സിലാക്കാം.

എന്നാൽ `Color(hex: "#2c54c2")` കാണുമ്പോൾ, അത് ഒരു നിറമൂല്യമാണെന്നു മാത്രമേ അറിയൂ; അതിന്റെ നിർദ്ദിഷ്ട ഉപയോഗം എളുപ്പത്തിൽ മനസ്സിലാകില്ല.

നിറങ്ങൾ ഒരിടത്ത് മാനേജ് ചെയ്യുന്നതിനും മറ്റൊരു ഗുണമുണ്ട്: പിന്നീട് മാറ്റങ്ങൾ ചെയ്യുന്നത് എളുപ്പമാണ്.

മൃഗ വിജ്ഞാനകോശത്തിന്റെ പ്രധാന നിറം ക്രമീകരിക്കണമെങ്കിൽ, നിർവചിച്ചിരിക്കുന്ന സ്ഥലത്ത് മാത്രം മാറ്റിയാൽ മതി:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

ഈ നിറം ഉപയോഗിക്കുന്ന എല്ലാ സ്ഥലങ്ങളും ഒരുമിച്ച് update ചെയ്യപ്പെടും.

നിറങ്ങൾ ക്രമീകരിക്കാൻ `static` ഉപയോഗിക്കുന്നതിന്റെ അർത്ഥം ഇതാണ്: നിറങ്ങളുടെ പേരുകൾ കൂടുതൽ വ്യക്തമായിരിക്കും, പിന്നീടുള്ള പരിപാലനം കൂടുതൽ സൗകര്യപ്രദമായിരിക്കും.

## മൃഗ വിജ്ഞാനകോശത്തിൽ പ്രയോഗിക്കുക

ഇപ്പോൾ, മുൻപത്തെ മൃഗ വിജ്ഞാനകോശ കാഴ്ചയിൽ കസ്റ്റം നിറങ്ങൾ പ്രയോഗിക്കാം.

മുൻപ്, മൃഗ ബട്ടണിന്റെ പശ്ചാത്തലം വെള്ളയായിരുന്നു:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

ഇപ്പോൾ, അതിനെ കസ്റ്റം നിറമാക്കി മാറ്റാം:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

ഇവിടെ `Color.animalBlue` എന്നത് നാം ഇപ്പോൾ `Color+Hex.swift`-ൽ നിർവചിച്ച static നിറമാണ്.

ബട്ടൺ ടെക്സ്റ്റ് വെള്ള നിറം ഉപയോഗിക്കുന്നു:

```swift
.foregroundStyle(Color.white)
```

മൃഗ emoji-യുടെ പശ്ചാത്തലം അർദ്ധപാരദർശക വെള്ള നിറം ഉപയോഗിക്കുന്നു:

```swift
.background(Color.white.opacity(0.15))
```

ഇതിലൂടെ ബട്ടണിന് ഏകീകൃത നീല ദൃശ്യശൈലി ലഭിക്കും.

ഈ ഘട്ടത്തിന്റെ പ്രധാന ലക്ഷ്യം സങ്കീർണ്ണ കോഡ് കൂട്ടിച്ചേർക്കൽ അല്ല, മുമ്പ് പഠിച്ച കസ്റ്റം നിറങ്ങൾ interface-ൽ യഥാർത്ഥമായി പ്രയോഗിക്കലാണ്.

## Gradient പശ്ചാത്തലം ഉപയോഗിക്കുക

ഒറ്റ നിറം ഉപയോഗിക്കുന്നതിനു പുറമെ, പല നിറങ്ങൾ ചേർത്ത് gradient ഫലവും ഉണ്ടാക്കാം.

ഉദാഹരണത്തിന്, മുമ്പ് നാം ഈ നിറങ്ങൾ നിർവചിച്ചിരുന്നു:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ഈ നിറങ്ങൾ ഓരോന്നായി മാത്രമല്ല, gradient പശ്ചാത്തലമായി കൂടി ചേർത്ത് ഉപയോഗിക്കാം.

SwiftUI-യിൽ, ഒരു linear gradient സൃഷ്ടിക്കാൻ `LinearGradient` ഉപയോഗിക്കാം.

ഉദാഹരണത്തിന്:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ഈ കോഡ് ഇടത് മുതൽ വലത് വരെ പോകുന്ന ഒരു gradient പശ്ചാത്തലം സൃഷ്ടിക്കുന്നു; നിറം `Color.animalBlue`-ൽ നിന്ന് `Color.animalLightBlue`-ലേക്ക് ക്രമേണ മാറും.

ഇവിടെ, `colors` gradient-ൽ പങ്കെടുക്കുന്ന നിറങ്ങൾ സജ്ജമാക്കാൻ ഉപയോഗിക്കുന്നു; `startPoint`, `endPoint` എന്നിവ gradient ദിശ നിയന്ത്രിക്കാൻ ഉപയോഗിക്കുന്നു.

### Gradient ഫലം പരീക്ഷിക്കുക

Gradient പശ്ചാത്തലം പരീക്ഷിക്കാൻ ഒരു ലളിതമായ Text ഉപയോഗിക്കാം.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

പ്രദർശന ഫലം:

![color](../../../Resource/031_color3.png)

ഈ ഉദാഹരണത്തിൽ, `Text`-ന്റെ പശ്ചാത്തലം ഇനി ഒറ്റ നിറമല്ല. പകരം, അത് ഇടത്ത് നിന്ന് വലത്തേക്ക് ക്രമേണ മാറുന്ന gradient നിറമാണ്.

സാധാരണ പശ്ചാത്തല നിറവുമായി താരതമ്യം ചെയ്യുമ്പോൾ, gradient പശ്ചാത്തലത്തിന് കൂടുതൽ ലെയറിംഗ് തോന്നൽ ഉണ്ടാകും, കൂടാതെ interface-ൽ ദൃശ്യപ്രാധാന്യം സൃഷ്ടിക്കാൻ കൂടുതൽ എളുപ്പമാണ്.

## മൃഗ വിജ്ഞാനകോശത്തിൽ Gradient പശ്ചാത്തലം ഉപയോഗിക്കുക

ഇപ്പോൾ, മൃഗ ബട്ടണിന്റെ പശ്ചാത്തല നിറം മാറ്റാം:

```swift
.background(Color.animalBlue)
```

Gradient പശ്ചാത്തലമാക്കി:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

പൂർണ്ണ കോഡ് താഴെ കൊടുക്കുന്നു:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

പ്രദർശന ഫലം:

![color](../../../Resource/031_color4.png)

ഇപ്പോൾ, മൃഗ ബട്ടൺ ഇനി ഒറ്റ പശ്ചാത്തല നിറം മാത്രമല്ല. അതിന് ഇടത് മുതൽ വലത് വരെ പോകുന്ന gradient ഫലം ഉണ്ട്.

ഒറ്റ നിറമുള്ള പശ്ചാത്തലവുമായി താരതമ്യം ചെയ്യുമ്പോൾ, gradient പശ്ചാത്തലം interface കൂടുതൽ ലെയർ ചെയ്തതുപോലെ തോന്നിക്കുകയും യഥാർത്ഥ App-കളിലെ ദൃശ്യ ഡിസൈനിനോട് കൂടുതൽ അടുത്തതാക്കുകയും ചെയ്യും.

## ഒറ്റ നിറ പശ്ചാത്തലവും Gradient പശ്ചാത്തലവും തമ്മിലുള്ള വ്യത്യാസം

ഒറ്റ നിറ പശ്ചാത്തലം ഒരു നിറം മാത്രം ഉപയോഗിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
.background(Color.animalBlue)
```

ഈ എഴുത്തുരീതി ലളിതവും വ്യക്തവുമാണ്, മിക്ക അടിസ്ഥാന interfaces-ക്കും ഇത് അനുയോജ്യമാണ്.

Gradient പശ്ചാത്തലം പല നിറങ്ങൾ ഉപയോഗിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

ഈ എഴുത്തുരീതി interface കൂടുതൽ ലെയർ ചെയ്തതുപോലെ തോന്നിക്കാൻ കഴിയും, പക്ഷേ ദൃശ്യ സങ്കീർണ്ണതയും എളുപ്പത്തിൽ കൂട്ടാം.

അതിനാൽ, യഥാർത്ഥ വികസനത്തിൽ, ഇതിനെ ഇങ്ങനെ മനസ്സിലാക്കാം:

ഒറ്റ നിറ പശ്ചാത്തലങ്ങൾ സാധാരണ ടെക്സ്റ്റ്, സാധാരണ ബട്ടണുകൾ, സാധാരണ കാർഡുകൾ, സാധാരണ പേജ് പശ്ചാത്തലങ്ങൾ എന്നിവയ്ക്ക് അനുയോജ്യമാണ്.

Gradient പശ്ചാത്തലങ്ങൾ പ്രധാന ബട്ടണുകൾ, മുകളിലെ പ്രദേശങ്ങൾ, കവർ കാർഡുകൾ, ഫീച്ചർ പ്രവേശനങ്ങൾ, പ്രത്യേകം ഊന്നിക്കാട്ടേണ്ട മറ്റ് സ്ഥാനങ്ങൾ എന്നിവയ്ക്ക് അനുയോജ്യമാണ്.

## സംഗ്രഹം

ഈ പാഠത്തിൽ, SwiftUI-യിൽ കസ്റ്റം നിറങ്ങൾ എങ്ങനെ ഉപയോഗിക്കാമെന്ന് നാം പഠിച്ചു.

ആദ്യം, Hex നിറങ്ങളെക്കുറിച്ച് നാം പഠിച്ചു.

ഉദാഹരണത്തിന്:

```text
#2c54c2
```

ഇത് ഒരു നിർദ്ദിഷ്ട നിറത്തെ സൂചിപ്പിക്കുന്നു.

തുടർന്ന്, `Color` ടൈപ്പ് വിപുലീകരിക്കാൻ നാം `extension Color` ഉപയോഗിച്ചു.

ഇതിലൂടെ SwiftUI-യ്ക്ക് താഴെ കാണുന്ന രീതിയിൽ നിറങ്ങൾ സൃഷ്ടിക്കാൻ കഴിയും:

```swift
Color(hex: "#2c54c2")
```

അടുത്തതായി, സാധാരണ ഉപയോഗിക്കുന്ന നിറങ്ങൾ ക്രമീകരിക്കാൻ നാം `static` ഉപയോഗിച്ചു:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

ഇങ്ങനെ ചെയ്താൽ, മറ്റ് views-ൽ ഇത് നേരിട്ട് ഉപയോഗിക്കാം:

```swift
Color.animalBlue
```

ഓരോ തവണയും Hex സ്ട്രിംഗ് എഴുതുന്നതുമായി താരതമ്യം ചെയ്യുമ്പോൾ, ഈ രീതി കൂടുതൽ വ്യക്തമാണ്, കൂടാതെ പിന്നീട് നിറങ്ങൾ ഏകീകൃതമായി മാറ്റാനും കൂടുതൽ സൗകര്യപ്രദമാണ്.

അവസാനം, നാം `LinearGradient` പഠിക്കുകയും കസ്റ്റം നിറങ്ങൾ ചേർത്ത് gradient പശ്ചാത്തലം സൃഷ്ടിക്കുകയും ചെയ്തു:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ഈ പാഠത്തിലൂടെ, “കസ്റ്റം നിറങ്ങൾ സൃഷ്ടിക്കൽ” മുതൽ “യഥാർത്ഥ interface-ൽ നിറങ്ങൾ ഉപയോഗിക്കൽ” വരെയുള്ള പ്രക്രിയ നാം പൂർത്തിയാക്കി.

പിന്നീട്, ഒരു നിറം പല സ്ഥലങ്ങളിലും ആവർത്തിച്ച് ഉപയോഗിക്കേണ്ടിവരുമ്പോൾ, ആദ്യം അത് `Color` extension-ൽ ക്രമീകരിക്കുന്നത് പരിഗണിക്കാം.

ഇതിലൂടെ കോഡ് കൂടുതൽ വ്യക്തമായിരിക്കും, interface ശൈലി ഏകീകരിക്കാനും കൂടുതൽ എളുപ്പമാകും.
