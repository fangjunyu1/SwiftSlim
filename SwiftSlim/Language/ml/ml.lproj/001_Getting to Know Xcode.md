# Xcode-നെ പരിചയപ്പെടാം

## Xcode എന്താണ്

Xcode എന്നത് Apple ഔദ്യോഗികമായി നൽകുന്ന ഒരു integrated development environment ആണ് (IDE, Integrated Development Environment). ഇത് iOS, macOS, watchOS, tvOS പോലുള്ള Apple പ്ലാറ്റ്‌ഫോം ആപ്പുകൾ വികസിപ്പിക്കാൻ ഉപയോഗിക്കുന്നു.

![Swift](../../RESOURCE/001_xcode.png)

ഈ മുഴുവൻ പഠന യാത്രയിലും code എഴുതാനും program run ചെയ്യാനും നാം Xcode തന്നെ ഉപയോഗിക്കും.

ഈ പാഠത്തിൽ Xcode എങ്ങനെ download ചെയ്യാം, ആദ്യത്തെ iOS app എങ്ങനെ സൃഷ്ടിക്കാം, Xcode interface-ന്റെ അടിസ്ഥാന ഘടന എങ്ങനെ മനസ്സിലാക്കാം എന്നിവ പഠിക്കും.

## Xcode ഡൗൺലോഡ് ചെയ്യുക

ഇപ്പോൾ Xcode ഇൻസ്റ്റാൾ ചെയ്യാൻ രണ്ട് വഴികളുണ്ട്:

1、[Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) വഴി ഡൗൺലോഡ് ചെയ്യുക

2、[Apple Developer ഔദ്യോഗിക വെബ്‌സൈറ്റ്](https://developer.apple.com/xcode/) വഴി ഡൗൺലോഡ് ചെയ്യുക

രണ്ടു വഴികളും Xcode download ചെയ്യാൻ ഉപയോഗിക്കാം. വ്യത്യാസം എന്തെന്നാൽ Apple Developer website-ൽ stable version-ിനൊപ്പം [Beta](https://developer.apple.com/download/all/?q=Xcode) versions ഉം പഴയ versions ഉം ലഭ്യമാണ്.

വികസനം പഠിക്കാൻ മാത്രമാണെങ്കിൽ stable version ഉപയോഗിക്കുന്നത് ശുപാർശ ചെയ്യപ്പെടുന്നു. Beta version പ്രധാനമായും പുതിയ features പരീക്ഷിക്കാൻ വേണ്ടിയുള്ളതാണ്; അതിനാൽ സ്ഥിരത കുറവായിരിക്കാം.

## ആദ്യ project സൃഷ്ടിക്കുക

Xcode തുറന്ന ശേഷം നിങ്ങൾക്ക് ഒരു startup screen കാണാം.

![Swift](../../RESOURCE/001_xcode1.png)

ഇടത് വശത്ത് മൂന്ന് സാധാരണ options ഉണ്ടാകും:

- Create New Project —— പുതിയ project സൃഷ്ടിക്കുക  
- Clone Git Repository —— Git repository clone ചെയ്യുക  
- Open Existing Project —— ഇതിനകം ഉള്ള project തുറക്കുക

വലത് വശത്ത് ഏറ്റവും ഒടുവിൽ തുറന്ന Xcode projects കാണിക്കും.

ഇവയിൽ നാം `"Create New Project"` തിരഞ്ഞെടുക്കാം.

### Project template തിരഞ്ഞെടുക്കുക

![Swift](../../RESOURCE/001_xcode2.png)

അടുത്തതായി project template തിരഞ്ഞെടുക്കുന്ന screen-ലേക്ക് കടക്കും. ഇവിടെ നിരവധി platforms (iOS, macOS തുടങ്ങിയവ)യും വിവിധ project template തരങ്ങളും കാണിക്കും.

സാധാരണ templates:
- App —— ഏറ്റവും അടിസ്ഥാനപരമായ application type (ശുപാർശ ചെയ്യുന്നത്)
- Document App —— document mode അടിസ്ഥാനമാക്കിയ app
- Game —— ഗെയിം വികസനത്തിനായി
- Framework —— വീണ്ടും ഉപയോഗിക്കാവുന്ന module

പഠനത്തിന്റെ ആദ്യഘട്ടത്തിൽ `"iOS" - "App"` template മാത്രം തിരഞ്ഞെടുക്കാം, കാരണം ഇത് interface app-ിന്റെ അടിസ്ഥാന രൂപമാണ്.

ശേഷം `"Next"` അമർത്തുക.

### Project വിവരങ്ങൾ പൂരിപ്പിക്കുക

അടുത്തതായി project information form screen വരും. ഇവിടെ ഓരോ field-ഉം അനുസരിച്ച് വിവരങ്ങൾ നൽകണം.

![Swift](../../RESOURCE/001_xcode3.png)

ഓരോ field-ിന്റെ അർത്ഥം:

- Product Name —— project പേര്, ഉദാഹരണം: `SwiftSlimTest`
- Team —— developer ടീം. Paid Apple Developer account ഇല്ലെങ്കിൽ ഇത് ഒഴിച്ചേക്കാം
- Organization Identifier —— organization identifier. സാധാരണ reverse domain format ആണ് ഉപയോഗിക്കുന്നത്, ഉദാഹരണത്തിന്:
  - `com.yourname`
  - `com.yourcompany`
  - domain ഇല്ലെങ്കിൽ നിങ്ങളുടെ ഇംഗ്ലീഷ് പേരും ഉപയോഗിക്കാം
- Bundle Identifier —— app-ന്റെ unique identifier. ഇത് Organization Identifier, Product Name എന്നിവ ചേർത്ത് auto-generate ചെയ്യും
- Interface —— UI technology, ഇവിടെ `SwiftUI` തിരഞ്ഞെടുക്കുക
- Language —— development language, ഇവിടെ `Swift` തിരഞ്ഞെടുക്കുക
- Testing System —— default ആയി test target (Unit Tests) ഉണ്ടാകും; തുടക്കത്തിൽ ഇത് ശ്രദ്ധിക്കേണ്ടതില്ല
- Storage —— local data persistence framework. SwiftData അല്ലെങ്കിൽ Core Data integrate ചെയ്യാം; തുടക്കത്തിൽ ഇത് കൂടി ഒഴിവാക്കാം

എല്ലാം പൂരിപ്പിച്ച ശേഷം `"Next"` അമർത്തുക.

### Project save ചെയ്യുക

![Swift](../../RESOURCE/001_xcode4.png)

project save ചെയ്യാനുള്ള അനുയോജ്യമായ folder തിരഞ്ഞെടുക്കുക.

`"Create"` button അമർത്തുമ്പോൾ Xcode project structure സ്വയം സൃഷ്ടിക്കും.

## Xcode project structure

Xcode project save ചെയ്ത ശേഷം, Finder-ൽ generate ചെയ്ത project folder കാണാം.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— ചിത്രങ്ങൾ, App icon തുടങ്ങിയ resources സൂക്ഷിക്കാൻ ഉപയോഗിക്കുന്ന folder

- ContentView.swift —— default ആയി സൃഷ്ടിക്കുന്ന SwiftUI view file. പിന്നീട് നാം ഇവിടെ interface code എഴുതും.

- SwiftSlimTestApp.swift —— app entry point file. ഇത് app launch ചെയ്യാൻ ഉത്തരവാദിയാണെങ്കിലും ഇപ്പോൾ അതിനെക്കുറിച്ച് അറിയേണ്ടതില്ല.

- SwiftSlimTest.xcodeproj —— Xcode project file. ഇതിൽ double-click ചെയ്താൽ project തുറക്കാം.

## Xcode interface-നെ പരിചയപ്പെടുക

`.xcodeproj` file double-click ചെയ്ത് project തുറക്കുക. തുടർന്ന് ഇടത് വശത്തുള്ള Navigator ഭാഗത്ത് `ContentView.swift` file തിരഞ്ഞെടുക്കുക.

Xcode interface പ്രധാനമായും അഞ്ച് ഭാഗങ്ങളാണ്:

- Navigator —— navigation area, file structure കാണാനും search ചെയ്യാനും
- Editor —— editing area, Swift അല്ലെങ്കിൽ SwiftUI code എഴുതാൻ
- Canvas —— canvas area, SwiftUI preview കാണാൻ
- Inspector —— property inspection area, file properties കാണാനും മാറ്റാനും
- Debug Area —— debugging area, log output കാണാൻ

![Swift](../../RESOURCE/001_xcode6.png)

ശ്രദ്ധിക്കുക: Canvas പ്രധാനമായും SwiftUI view preview-ക്കാണ് ഉപയോഗിക്കുന്നത്. Xcode-ന്റെ ഔദ്യോഗിക architecture അനുസരിച്ച്, ഇത് Editor-ന്റെ സഹായക preview pane ആണ്. SwiftUI view file തുറന്നിരിക്കുമ്പോഴേ Canvas പ്രവർത്തിക്കൂ; മറ്റ് തരത്തിലുള്ള files-ക്ക് preview കാണിക്കില്ല.

പിന്നീടുള്ള പാഠങ്ങളിൽ നാം പ്രധാനമായും Editor ഭാഗത്താണ് Swift, SwiftUI code എഴുതുക.

Xcode project ആദ്യമായി തുറക്കുമ്പോൾ Inspector, Debug Area എന്നിവ default ആയി hidden ആയിരിക്കാം. മുകളിലെ വലതുവശത്തും താഴത്തെ വലതുവശത്തുമുള്ള buttons അമർത്തി അവ കാണിക്കാം.

![Swift](../../RESOURCE/001_xcode7.png)

സൂചന: Inspector ഭാഗം file properties കാണാനും മാറ്റാനും സഹായിക്കുന്നു. യഥാർത്ഥ development-ൽ, വലിയ editing space കിട്ടാൻ പലപ്പോഴും ഇത് hide ചെയ്യാറുണ്ട്.

## സംഗ്രഹം

ഈ പാഠത്തിൽ Xcode എങ്ങനെ download ചെയ്യാം, ആദ്യത്തെ Xcode project എങ്ങനെ സൃഷ്ടിക്കാം, Xcode interface-ന്റെ അടിസ്ഥാന layout എന്താണ് എന്നിവ പഠിച്ചു.

ഇപ്പോൾ കുറച്ച് സ്വതന്ത്രമായി പരീക്ഷിക്കാം:
- Navigator ഭാഗത്ത് files create ചെയ്യാനും delete ചെയ്യാനും ശ്രമിക്കുക.  
- Editor ഭാഗത്തിലെ code നോക്കി അതിന്റെ ഘടന ശ്രദ്ധിക്കുക.
- Canvas ഭാഗത്തിലെ buttons നോക്കി preview zoom in / zoom out ചെയ്തു നോക്കുക.

അടുത്ത പാഠത്തിൽ നാം ചില ലളിതമായ code എഴുതാൻ തുടങ്ങും, അതുവഴി Xcode-നെ ഇനിയും കൂടുതൽ മനസ്സിലാക്കാനും കഴിയും。  
