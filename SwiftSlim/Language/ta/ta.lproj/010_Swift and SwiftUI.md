# ஸ்விஃப்ட் மற்றும் ஸ்விஃப்ட்யூஐ

Apple தள மேம்பாட்டைப் படிக்கும் போது, பல பாடங்கள் Swift மற்றும் SwiftUI-ஐ தனித்தனியாக கற்பிக்க முனைகின்றன. இது தொடக்கநிலை பயில்பவர்களுக்கு ஒரு துண்டிக்கப்பட்ட உணர்வை உருவாக்கி, இவை இரண்டு முழுமையாக வேறு தொழில்நுட்பங்கள் என்று தவறாக நினைக்கச் செய்யலாம்.

உண்மையில், Swift மற்றும் SwiftUI ஆழமாக ஒருங்கிணைந்தவை: Swift என்பது நிரலாக்க மொழி; அது தர்க்கத்தையும் தரவையும் வழங்குகிறது. SwiftUI என்பது Swift மீது கட்டப்பட்ட பயனர் இடைமுக கட்டமைப்பு; அது view-களின் render மற்றும் interaction-ஐ பொறுப்பாக மேற்கொள்கிறது.

இந்தப் பாடம், Swift என்பது என்ன, SwiftUI என்பது என்ன, மேலும் அவை code-இல் எப்படி ஒன்றுடன் ஒன்று இணைந்து செயல்படுகின்றன என்பதைக் தெளிவாகப் புரிந்துகொள்ள உதவும்.

## Swift என்பது என்ன?

Swift என்பது Apple நிறுவனம் அறிமுகப்படுத்திய ஒரு நவீன நிரலாக்க மொழி. இது iOS, macOS, watchOS மற்றும் tvOS போன்ற தளங்களுக்கான பயன்பாடுகளை உருவாக்கப் பயன்படுகிறது.

![swift](../../RESOURCE/010_swift.png)

Swift ஒரு strong type கொண்ட, static language ஆகும். இது பாதுகாப்பை அதிகம் கவனத்தில் கொண்டு வடிவமைக்கப்பட்டுள்ளது; அதனால் null pointer, out-of-bounds போன்ற பொதுவான பல நிரலாக்கப் பிழைகள் குறைக்கப்படுகின்றன. மேலும், இது C மற்றும் Objective-C உடன் இடையறாத ஒருங்கிணைப்பை ஆதரிக்கிறது.

நடைமுறை மேம்பாட்டில், Swift பெரும்பாலும் பயன்பாட்டின் logic பகுதியை கையாளுகிறது. உதாரணமாக, data processing, network requests, storage operations போன்றவை.

## SwiftUI என்பது என்ன?

SwiftUI என்பது Apple நிறுவனம் 2019 ஆம் ஆண்டு அறிமுகப்படுத்திய புதிய UI கட்டமைப்பு ஆகும். SwiftUI, declarative programming முறைமையைப் பயன்படுத்துகிறது; இதன் மூலம் developer-கள் சுருக்கமான code-ஐ பயன்படுத்தி UI-ன் அமைப்பையும் interaction-களையும் விவரிக்க முடியும்.

![swiftui](../../RESOURCE/010_swiftui.png)

Declarative programming என்பதன் பொருள், developer-கள் திரையில் என்ன காட்ட வேண்டும் என்பதை மட்டும் அறிவிக்கிறார்கள்; பின்னர் data மாறும்போது system தானாகவே view-ஐ refresh செய்கிறது. இதனால் UI state-ஐ developer கையால் update செய்ய வேண்டிய அவசியம் குறைகிறது, மேலும் UI development மிகவும் எளிமையாகிறது.

SwiftUI-ன் மையம் view components (உதா: Text, Image, Button) மற்றும் layout containers (உதா: VStack, HStack, ZStack) ஆகும். இக்கூறுகள் data binding மற்றும் state management மூலம் ஒன்றுடன் ஒன்று செயல்பட்டு, data மாறும்போது interface தானாக பதிலளித்து refresh ஆகும்.

## Swift மற்றும் SwiftUI எப்படி இணைந்து செயல்படுகின்றன?

Swift மற்றும் SwiftUI-ன் பொறுப்புகளை கீழே உள்ளபடி சுருக்கலாம்:

**1. Swift: logic மற்றும் data-ஐ கையாளுதல்**

Swift முக்கியமாக data-ஐ நிர்வகிக்க, state-ஐ சேமிக்க, மற்றும் logic-ஐ இயக்கப் பயன்படுகிறது. இத்தகைய code, பொதுவாக UI render-ஐ நேரடியாக கட்டுப்படுத்தாது; மாறாக data மற்றும் behavior-ஐ கையாளும்.

உதாரணமாக, Swift-இல் data-ஐ கையாளுவது:

```swift
let markdown = try? String(contentsOf: url)
```

இந்த code-ல் variable declaration, constant definition, function, control flow போன்ற Swift அம்சங்கள் உள்ளன; இவை view-ன் தோற்றத்தை நேரடியாக நிர்ணயிப்பவை அல்ல.

**2. SwiftUI: UI-ஐ அறிவித்து render செய்வது**

SwiftUI பயனர் இடைமுகத்தின் layout மற்றும் content-ஐ உருவாக்கப் பயன்படுகிறது. இது முக்கியமாக UI-ஐ render செய்வதையும் view interaction-ஐ கையாளுவதையும் பொறுப்பாக மேற்கொள்கிறது.

உதாரணமாக, SwiftUI-யைப் பயன்படுத்தி ஒரு text view உருவாக்குவது:

```swift
Text("SwiftSlim")
```

இத்தகைய code UI கூறுகளை உருவாக்கவும் கட்டுப்படுத்தவும் பயன்படுகிறது; அதனால் இது நேரடியாக UI-யுடன் தொடர்புடையது.

### அடிப்படை எடுத்துக்காட்டு

கீழே ஒரு எளிய SwiftUI எடுத்துக்காட்டு உள்ளது:

```swift
// ContentView.swift

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

இந்த எடுத்துக்காட்டில்:

**SwiftUI code**: VStack, Image, Text, padding ஆகியவை அனைத்தும் SwiftUI-க்குச் சேர்ந்தவை; இவை UI-ன் காட்சி மற்றும் layout-ஐ பொறுப்பாக கையாள்கின்றன.

**Swift code**: கோப்பின் மேல் பகுதியிலுள்ள // comment மற்றும் import SwiftUI, Swift code அமைப்பின் பகுதிகள்; கீழேயுள்ள #Preview என்பது Xcode preview-க்கான macro ஆகும், இது உண்மையான UI rendering-ல் பங்கேற்காது.

### மேம்பட்ட எடுத்துக்காட்டு

நடைமுறை திட்டங்களில், Swift மற்றும் SwiftUI பெரும்பாலும் கலந்தே பயன்படுத்தப்படுகின்றன; ஒவ்வொன்றும் தங்களுக்கான திறமையான பணிகளை மேற்கொள்கின்றன:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

இந்த எடுத்துக்காட்டில்:

**SwiftUI code**: @State என்பது SwiftUI-க்கு தனிப்பட்ட property wrapper ஆகும்; இது view-இன் மாற்றக்கூடிய state-ஐ அறிவிக்கப் பயன்படுகிறது. Button மற்றும் Text ஆகியவை SwiftUI view components; இவை UI display மற்றும் user interaction-ஐ கையாள்கின்றன.

**Swift code**: private var name மற்றும் func printName() ஆகியவை Swift code; இவை data-ஐ சேமிக்கவும் logic-ஐ இயக்கவும் பயன்படுகின்றன; UI rendering-ஐ நேரடியாக கட்டுப்படுத்தாது.

பயனர் button-ஐ அழுத்தும் போது, SwiftUI button-இல் உள்ள action code-ஐ இயக்கும்:

```swift
Button("Print") {
    printName()
}
```

இங்கு Button என்பது SwiftUI component; ஆனால் அதில் இயக்கப்படும் printName() function என்பது Swift code ஆகும், அது குறிப்பிட்ட logic-ஐ செயல்படுத்துகிறது.

இந்த இணைப்பு, Swift மற்றும் SwiftUI ஒன்றுடன் ஒன்று இடையறாது இயங்க உதவுகிறது: Swift data மற்றும் logic-ஐ கையாள்கிறது; SwiftUI UI-ஐ கையாள்கிறது.

## Swift மற்றும் SwiftUI code பொதுவாக எந்த இடத்தில் எழுதப்படுகிறது?

SwiftUI-யில், UI என்பது body property திருப்பி அளிக்கும் view மூலம் உருவாக்கப்படுகிறது. ஆகவே, UI-ஐ விவரிக்கும் அனைத்து code-களும் பொதுவாக body-க்குள் எழுதப்படுகின்றன.

உதாரணமாக:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

இந்த எடுத்துக்காட்டில், Text என்பது SwiftUI view component ஆகும். எனவே அது body-க்குள் இருக்க வேண்டும்; ஏனெனில் SwiftUI, body-ஐப் படித்தே UI-ஐ உருவாக்குகிறது.

UI-யுடன் நேரடியாக தொடர்பில்லாத code, உதா: variables, functions, data processing logic போன்றவை பொதுவாக body-க்கு வெளியே எழுதப்படுகின்றன. உதாரணமாக:

```swift
struct ContentView: View {

    // Swift：தரவு அல்லது தர்க்கம்
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：பயனர் இடைமுகம்
    var body: some View {
        Text(name)
    }
}
```

கவனிக்க வேண்டியது என்னவென்றால், body-க்குள் கூட Swift syntax பயன்படுத்தலாம். உதாரணமாக if, for போன்ற control flow statements. ஆனால் அவை SwiftUI view-ஐ எப்படி உருவாக்க வேண்டும் என்பதை கட்டுப்படுத்தும் நோக்கில் பயன்படுத்தப்படுகின்றன:

```
if isLogin {
    Text("Welcome")
}
```

எனவே, SwiftUI development-இல் இதைப் எளிமையாக இவ்வாறு புரிந்துகொள்ளலாம்: view code (Text, Image, Button போன்றவை) பொதுவாக body-க்குள் எழுதப்படும்; data மற்றும் logic code (variables, functions போன்றவை) பொதுவாக body-க்கு வெளியே எழுதப்படும்.

## Swift கோப்புகள்

கற்றல் ஆழமாகும் போது, நாம் MVVM architecture-ஐயும் சந்திப்போம். இதில் ViewModel மற்றும் Model அடுக்குகள் பொதுவாக pure Swift code-ஆக இருக்கும்; அவை view layer (SwiftUI) இலிருந்து பிரிக்கப்பட்டிருக்கும்.

உதாரணமாக, app state-ஐ நிர்வகிக்கும் ஒரு class:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

அல்லது data structure-ஐ விவரிக்கும் ஒரு struct:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

இத்தகைய file-களின் பணி, data-ஐ நிர்வகிப்பதும் persist செய்வதும் தான்; அவை நேரடியாக UI-யில் காட்டப்படுவதில்லை. ஆகவே, இவை முழுமையாக Swift-க்கு சேர்ந்தவை.

## வரலாற்றுப் பின்னணி

Swift மற்றும் SwiftUI-ன் உறவைப் புரிந்துகொள்ள, Apple development technology-யின் மாற்றப் பயணத்தையும் அறிந்து கொள்ள வேண்டும். 2026 வரையிலான நிலவரப்படி, இந்த தொழில்நுட்ப அடுக்கு பல கட்டங்களை கடந்து வளர்ச்சி பெற்றுள்ளது.

### Swift-ன் வரலாறு

Swift உருவாகும் முன், Objective-C தான் Apple தளங்களின் முக்கிய programming language ஆக இருந்தது; இது C மொழியுடன் mixed programming-ஐ ஆதரித்தது. அதன் syntax சற்று நீளமாக இருந்ததால், தொடக்கநிலை பயில்பவர்களுக்கு அது சிரமமாக இருந்தது:

```Obj-c
// Objective-C எழுதும் முறை
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014-ல், Apple WWDC-யில் Swift language-ஐ அறிமுகப்படுத்தியது. Swift-ன் syntax அதிகம் நவீனமானது, type safety அதிகம் கொண்டது, மேலும் அது படிப்படியாக Objective-C-ஐ மாற்றி முக்கிய development language ஆக மாறியது:

```swift
// Swift எழுதும் முறை
let name = "Fang"
print("Hello, \(name)")
```

ஆனால் Objective-C முற்றிலும் மறைந்துவிடவில்லை. அது இன்னும் பல legacy projects மற்றும் low-level frameworks-இல் பரவலாக பயன்படுத்தப்படுகிறது. அதன் அடிப்படை syntax-ஐ அறிந்திருப்பது, பழைய திட்டங்களை பராமரிக்கவும், system-ன் அடித்தளத்தைப் புரிந்துகொள்ளவும் உதவும்.

### SwiftUI-ன் வரலாறு

SwiftUI வருவதற்கு முன், iOS-இல் **UIKit**, macOS-இல் **AppKit** பயன்படுத்தப்பட்டன. இந்த இரு framework-களும் "imperative" programming முறையைப் பயன்படுத்தின. Developer-கள் Storyboard மூலம் controls-ஐ drag செய்து அமைக்க வேண்டியிருந்தது அல்லது UI state-ஐ code மூலம் கைமுறையாக கட்டுப்படுத்த வேண்டியிருந்தது. இதனால் code அதிகரித்து, maintenance cost கூடிக்கொண்டே போனது; குறிப்பாக UI logic சிக்கலானபோது இது தெளிவாக தெரிந்தது.

![storyboard](../../RESOURCE/010_xcode.png)

2019-ல், Apple WWDC-யில் SwiftUI-ஐ அதிகாரப்பூர்வமாக அறிமுகப்படுத்தியது. SwiftUI, "declarative" programming paradigm-ஐ கொண்டு வந்து, UI development செயல்முறையை பெரிதும் எளிமையாக்கியது.

![storyboard](../../RESOURCE/010_xcode1.png)

கவனிக்க வேண்டிய முக்கிய விஷயம் என்னவென்றால், SwiftUI ஒரு முற்றிலும் தனித்தனி அடித்தள செயலாக்கம் அல்ல. ஒவ்வொரு தளத்திலும், அது UIKit (iOS) அல்லது AppKit (macOS) உடன் bridge செய்து ஒருங்கிணைந்து செயல்படுகிறது; அதன் அடிப்படை இயக்கம் இன்னும் இந்த இரு framework-களையும் சார்ந்தே இருக்கிறது.

### Swift மற்றும் UIKit/AppKit இடையிலான உறவு

Swift ஒரு பொது பயன்பாட்டு programming language ஆக இருந்தாலும், அது UIKit அல்லது AppKit-ஐ முழுமையாக மாற்ற முடியாது. சில சிக்கலான UI தேவைகள், அல்லது SwiftUI இன்னும் முழுமையாக ஆதரிக்காத அம்சங்களுக்கு, UIKit அல்லது AppKit உதவி இன்னும் தேவைப்படுகிறது.

உதாரணமாக, UIKit view controller management, animation effects, gesture recognition போன்ற சிக்கலான UI தேவைகளில் ஏற்கனவே மிகுந்த முதிர்ச்சியை அடைந்துள்ளது; அது பல ஆண்டுகளாக production சூழலில் பரிசோதிக்கப்பட்டுள்ளது. SwiftUI இவ்வகை திறன்களில் தொடர்ந்து மேம்பட்டு வந்தாலும், சில edge cases-இல் இன்னும் வரம்புகள் உள்ளன.

அதனால், பல developer-கள் ஒரே திட்டத்தில் SwiftUI மற்றும் UIKit (அல்லது AppKit)-ஐ கலந்தே பயன்படுத்துகிறார்கள்; இதன் மூலம் இரண்டின் பலத்தையும் பயன்படுத்த முடிகிறது.

இந்த கோணத்தில் பார்க்கும்போது, SwiftUI-ஐ UIKit / AppKit-ன் ஒரு உயர்நிலை abstraction அல்லது encapsulation என்று புரிந்துகொள்ளலாம். SwiftUI-யைக் கற்கும் போது UIKit மற்றும் AppKit-ன் அடிப்படை கருத்துக்களையும் ஓரளவு அறிந்திருப்பது, பழைய திட்டங்களை பராமரிக்கவும், சிக்கலான அம்சங்களை உருவாக்கவும், மேலும் பொருத்தமான தொழில்நுட்பத் தீர்மானங்களை எடுக்கவும் உதவும்.

## சுருக்கம்

**Swift**: logic, data processing, control flow போன்றவற்றை எழுதப் பயன்படுகிறது; இது view layout-இற்கு நேரடியாகச் சேர்ந்ததல்ல.

**SwiftUI**: declarative முறையில் UI-ஐ கட்டமைக்கப் பயன்படுகிறது; view content மற்றும் layout தொடர்பான code இதனுள் வருகிறது.

நடைமுறை development-இல், Swift மற்றும் SwiftUI பொதுவாக இணைத்தே பயன்படுத்தப்படுகின்றன. Swift logic-ஐ கையாள்கிறது; SwiftUI UI-ஐ கையாள்கிறது.

Objective-C மற்றும் UIKit-இலிருந்து Swift மற்றும் SwiftUI-க்கான மாற்றம், Apple development சூழலை மேலும் நவீனமாகவும் சுருக்கமாகவும் மாற்றியுள்ளது. இருந்தாலும் UIKit மற்றும் AppKit இன்னும் பல பாரம்பரிய திட்டங்களில் முக்கியத்துவம் பெற்றவையாகவே உள்ளன.

Swift மற்றும் SwiftUI இடையிலான உறவைப் புரிந்துகொள்வதன் மூலம், நாம் iOS/macOS development-ஐ மேலும் திறமையாகச் செய்ய முடியும். அதேசமயம் பழைய திட்டங்களை பராமரிக்கும் போது, இன்னும் பொருத்தமான தொழில்நுட்பத் தேர்வுகளை மேற்கொள்ளவும் முடியும்.
