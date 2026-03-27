# SwiftUI View வாழ்க்கைச்சுற்று

முந்தைய பாடத்தில், `@State` variables view-ன் வாழ்க்கைச்சுற்றைத் தொடர்ந்து செயல்படுவதை நாம் புரிந்துகொண்டோம். மேலும், `onAppear`-ன் அடிப்படைப் பயன்பாட்டையும் கற்றோம்.

இந்தப் பாடத்தில், SwiftUI view வாழ்க்கைச்சுற்றை இன்னும் ஆழமாகப் புரிந்துகொள்வோம். ஒரு view எவ்வாறு உருவாக்கப்படுகிறது, எவ்வாறு காட்டப்படுகிறது, view-க்குள் உள்ள variables எவ்வாறு உருவாக்கப்படுகின்றன மற்றும் மீண்டும் உருவாக்கப்படுகின்றன என்பதையும் பார்ப்போம். அதோடு, `onAppear`、`onDisappear` மற்றும் `init` constructor பற்றியும் கற்போம்.

இந்த அறிவுகளின் அடிப்படையில், SwiftUI view உருவாக்கத்தின் முழு செயல்முறையைப் பற்றிய ஒரு முழுமையான புரிதலை அமைப்போம்.

## பயன்பாட்டின் தொடக்க ஒழுங்கு

iOS project உருவாக்கும் போது, Xcode இயல்பாக இரண்டு files-ஐ உருவாக்கும்:

```swift
ContentView.swift
ProjectName + App.swift
```

இதில், “ProjectName + App.swift”.swift என்பது முழு app-இன் entry file ஆகும்.

உதாரணமாக:

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

### Code இயங்கும் செயல்முறை

நாம் App-ஐ run செய்யும் போது (simulator அல்லது real device), system முதலில் `@main` keyword-ஐத் தேடும்:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Entry file உறுதிசெய்யப்பட்டதும், code இயங்கத் தொடங்கும்.

முதலில் `App` struct-க்குள் நுழைந்து, `body`-யின் code இயங்கும். அதன் பிறகு `WindowGroup` உருவாக்கப்பட்டு, அதற்குள் உள்ள `ContentView` load செய்யப்படும்.

### WindowGroup-ன் பணி

`WindowGroup` என்பது window-களை நிர்வகிக்கப் பயன்படுகிறது:

```swift
WindowGroup {
    ContentView()
}
```

iPad / macOS-இல் multi-window support உள்ளது; iPhone-இல் பொதுவாக ஒரு window மட்டும் இருக்கும்.

அதனால், iPhone-இல் `WindowGroup` முக்கியமாக முதலில் காட்டப்படும் screen-ஐ நிர்வகிக்கிறது.

### View load ஆகும் செயல்முறை

System `ContentView`-ஐ கண்டுபிடித்த பிறகு:

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

SwiftUI, `body`-யின் code-ஐ இயக்குும். அதன் பிறகு, திரும்ப வரும் view structure-ஐ (`VStack`、`Text` போன்றவை) அடிப்படையாகக் கொண்டு interface-ஐ உருவாக்கி, அதை screen-இல் காட்டும்.

இந்தப் படிகள் முடிந்தபின், நாம் view-இல் `ContentView`-ஐ காண முடியும்.

![ContentView](../../Resource/016_view1.png)

கவனிக்க வேண்டியது: `body`-ன் பணி view-ஐ உருவாக்குவது; view-ஐ சேமிப்பது அல்ல.

அதாவது, ஒவ்வொரு முறையும் view refresh ஆகும் போது, SwiftUI `body`-ஐ மீண்டும் கணக்கிட்டு, புதிய view structure-ஐ உருவாக்கும்.

### Preview view logic

Xcode preview (Canvas) மற்றும் உண்மையான run ஆகியவை இரண்டு வேறு mechanisms ஆகும்.

உதாரணமாக, entry file-இல் ஒரு debug output சேர்ப்போம்:

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

Xcode-இல் `ContentView`-ஐ preview செய்யும்போது, அது `@main` entry-யிலிருந்து தொடங்காது. ஆகவே, entry file-இல் உள்ள `onAppear` trigger ஆகாது.

ஆனால், simulator அல்லது real device-இல் run செய்தால், system `@main`-இலிருந்து தொடங்கி, முழு App flow-ஐ இயக்கும். அப்போது entry-இல் உள்ள `onAppear` trigger ஆகி, debug information output ஆகும்.

முக்கியமான வித்தியாசம் என்னவெனில், Xcode preview என்பது “local rendering” மட்டுமே; அது தற்போதைய view-ஐ மட்டும் காட்டப் பயன்படுகிறது. simulator மற்றும் real device மட்டும் “complete runtime environment” கொடுக்கின்றன; அவை முழு App-ஐ இயக்கும்.

அதனால், App functionality-ஐ சோதிக்கும் போது, simulator அல்லது real device முடிவுகளையே நம்ப வேண்டும். Xcode preview முழுமையான runtime environment வழங்காது.

## View-ன் வாழ்க்கைச்சுற்று

தற்போதைய கட்டத்தில், நம்முடைய code அனைத்தும் `ContentView`-இல் உள்ளது. ஆனால், உண்மையான apps-இல், ஒரு App பல views-ஐக் கொண்டிருக்கும்; அவை பல்வேறு சூழல்களில் மாறி மாறிக் காணப்படும்.

உதாரணமாக, “பணம் சேமிப்பு குடுவை” app-இல்:

![PiggyBank](../../Resource/016_view.png)

“Save money” என்பதை tap செய்தால், `SaveView` காட்டப்படும்; சேமித்தல் முடிந்ததும் அல்லது அதை மூடியதும், `SaveView` நீக்கப்படும்.

இதுவே view வாழ்க்கைச்சுற்று: view உருவாக்கம், view காட்டுதல், பின்னர் view நீக்குதல்.

### App-ஐ மூடுதல்

App மூடப்பட்டால், அனைத்து views-மும் நீக்கப்படும்; அவற்றுடன் தொடர்புடைய state-களும் மறைந்து விடும்.

அதனால், `ContentView` உட்பட அனைத்து views-மும் memory-இலிருந்து அகற்றப்படும்; App-ன் முழு runtime state-மும் clear ஆகும்.

## View-இல் உள்ள variables-ன் வாழ்க்கைச்சுற்று

SwiftUI-இல், variables-ன் வாழ்க்கைச்சுற்று பொதுவாக view-உடன் தொடர்புடையதாக இருக்கும்.

உதாரணமாக:

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

### @State variable

`@State` மூலம் அறிவிக்கப்படும் variable, view-ன் வாழ்க்கைச்சுற்றுடன் இணைந்திருக்கும்.

```swift
@State private var name = "FangJunyu"
```

View உருவாக்கப்படும் போது, `name`-மும் உருவாகும்; view நீக்கப்படும் போது, `name`-மும் அழிக்கப்படும்.

அதனால்தான், `UserDefaults` போன்ற முறைகள் மூலம் data persistence தேவைப்படுகிறது.

### body-க்குள் உள்ள variable

`body`-க்குள் வரையறுக்கப்படும் variable:

```swift
var num = 10
```

இதன் வாழ்க்கைச்சுற்று, `body` செயல்படும் காலத்துடன் இணைந்திருக்கிறது.

SwiftUI-இன் state மாறும் போது, உதாரணமாக:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

`name` மாறியவுடன், `@State` data change-ஐ detect செய்து, SwiftUI-க்கு view-ஐ மீண்டும் கணக்கிடச் சொலும். அதனால் `body` மீண்டும் கணக்கிடப்படும்.

`body` மீண்டும் கணக்கிடப்படும் போது, `body`-க்குள் உள்ள code அனைத்தும் மீண்டும் இயங்கும். அதனால், `body`-க்குள் உள்ள variables (`num` போன்றவை) மீண்டும் உருவாக்கப்படும்.

இதனால்தான், `body`-க்குள் சிக்கலான variables-ஐ வரையறுப்பது பரிந்துரைக்கப்படாது.

ஏனெனில், ஒவ்வொரு view refresh-க்கும், `body`-க்குள் உள்ள variables அனைத்தும் மீண்டும் உருவாக்கப்படும். இது கணக்கீட்டு செலவை அதிகரிக்கவும், performance-ஐ பாதிக்கவும் செய்யலாம்.

SwiftUI-இல், data-வின் தன்மைக்கு ஏற்ப வேறு வேறு முறைகளில் data-ஐ நிர்வகிக்க வேண்டும். View வாழ்க்கைச்சுற்றுடன் இணைந்து இருக்க வேண்டிய data-ஐ `@State`-இல் வைக்கலாம்; தற்காலிக கணக்கீட்டு data-ஐ `body`-க்குள் வைக்கலாம்.

## onAppear மற்றும் onDisappear

முந்தைய பாடத்தில், `onAppear` பற்றி நாம் ஏற்கனவே கற்றோம். View screen-இல் தோன்றும் போது, `onAppear` அழைக்கப்படும்.

```swift
.onAppear {}
```

உதாரணமாக:

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

Xcode preview அல்லது run செய்யும் போது, `onAppear`-க்குள் உள்ள debug output-ஐ காணலாம்.

### onDisappear

`onAppear`-க்கு இணையானது `onDisappear`:

```swift
.onDisappear {}
```

View மூடப்படும் போது, `onDisappear` அழைக்கப்படும்.

உதாரணமாக:

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

View remove ஆகும் போது, `onDisappear`-க்குள் உள்ள code அழைக்கப்படும்.

குறிப்பு: தற்போதைய கட்டத்தில் நாம் பயன்படுத்தும் `ContentView` என்பது App-ன் root view ஆகும். அதை நேரடியாக close செய்யவோ remove செய்யவோ முடியாது. அதனால், இந்த நிலையிலே `onDisappear` செயல்பாட்டை நேரடியாகக் கவனிக்க முடியாது.

பின்னர் page navigation அல்லது புதிய view திறக்கும் போது, `onDisappear` எப்போது அழைக்கப்படுகிறது என்பதைப் பார்க்கலாம்.

## உருவாக்கம் மற்றும் காட்சி logic

கவனிக்க வேண்டியது: view-ன் creation மற்றும் display ஆகியவை இரண்டு வேறு கட்டங்களாகும்.

View உருவாக்கப்படும் போது, struct-இன் constructor அழைக்கப்படும்:

```swift
init() {}
```

ஏனெனில் SwiftUI view என்பது `struct` structure ஆகும்:

```swift
struct ContentView: View { ... }
```

அதனால், view instance உருவாக்கப்படும் போது, `init` constructor இயங்கும். View screen-இல் காட்டப்படும் போது மட்டுமே `onAppear` method அழைக்கப்படும்.

உதாரணமாக:

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

Xcode-இல் preview செய்யும்போது, பின்வரும் debug output-ஐப் பார்க்கலாம்:

```swift
Create ContentView
Show ContentView
```

இதனால் என்ன தெரிகிறது என்றால்: முதலில் `init` மூலம் view உருவாக்கப்படுகிறது; அதன் பிறகு `body`-யின் code கணக்கிடப்படுகிறது; கடைசியாக view screen-இல் காட்டப்பட்டு `onAppear` அழைக்கப்படுகிறது.

அதனால், view creation மற்றும் view display என்பது தனித்தனி கட்டங்கள் என்பதை தெளிவாகப் புரிந்துகொள்ள வேண்டும்.

### init constructor

`init` என்பது Swift-இன் அடிப்படை syntax ஆகும். இதை `struct` மற்றும் `class` இரண்டிலும் வரையறுக்கலாம்; object-ஐ initialize செய்ய இதைப் பயன்படுத்துகிறோம்.

```swift
init() {}
```

SwiftUI-இல், view உருவாக்கப்படும் போது, system view-இன் `init` method-ஐ அழைக்கும். இது parameters பெறவும், data initialize செய்யவும் பயன்படுத்தலாம்.

நாம் தனியாக `init` எழுதவில்லை என்றால், Swift, `struct`-க்கு ஒரு default constructor-ஐ தானாக உருவாக்கும்.

`ContentView` போன்ற SwiftUI views-க்கு, view உருவாக்கப்படும் போது `init` இயங்கும்; view காட்டப்படும் போது `onAppear` இயங்கும்.

அதனால், `init` என்பது view உருவாக்கப்படும் நேரத்தில் செயல்படும் constructor. பின்னர் parameters pass செய்வதிலும், data initialize செய்வதிலும் இது பயன்படும்.

## சுருக்கம்

இந்தப் பாடத்தில், app தொடங்கும் ஒழுங்கை கற்றோம் — entry file-இலிருந்து `ContentView` வரை code எவ்வாறு இயங்குகிறது என்பதைப் புரிந்துகொண்டோம்.

SwiftUI view வாழ்க்கைச்சுற்றைப் பற்றியும் அறிந்தோம்: view உருவாக்கப்படும் போது `init` இயங்கும், screen-இல் காட்டப்படும் போது `onAppear` இயங்கும், view remove அல்லது close செய்யப்படும் போது `onDisappear` இயங்கும்.

மேலும், view update mechanism-ஐப் புரிந்துகொண்டோம்: view என்பது state-driven ஆகும். `@State` போன்ற state-கள் மாறும் போது, SwiftUI view-ஐ refresh செய்து, `body`-ஐ மீண்டும் கணக்கிடும். `body`-க்குள் உள்ள variables-ும் மீண்டும் உருவாக்கப்படும்.

Variables-ன் வாழ்க்கைச்சுற்று view-உடன் இணைந்திருக்கலாம்; அதே சமயம் `body`-க்குள் உள்ள temporary values ஒவ்வொரு refresh-க்கும் மீண்டும் உருவாக்கப்படும்.

இந்த வாழ்க்கைச்சுற்றும், variables-ன் நடத்தையும் நன்றாகப் புரிந்துகொண்டால், code-ஐ இன்னும் சிறப்பாக ஒழுங்குபடுத்த முடியும்; மேலும் App logic-ஐ தெளிவாக எழுத உதவும்.
