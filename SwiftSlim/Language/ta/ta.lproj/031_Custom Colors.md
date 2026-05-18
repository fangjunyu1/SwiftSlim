# தனிப்பயன் நிறம்

இந்தப் பாடத்தில், SwiftUI-யில் நிறத்தை எவ்வாறு தனிப்பயனாக்குவது என்பதைப் பார்க்கிறோம்.

முந்தைய பாடங்களில், SwiftUI வழங்கும் இயல்புநிலை நிறங்களை நாம் ஏற்கனவே பயன்படுத்தியிருக்கிறோம், உதாரணமாக:

```swift
Color.blue
Color.red
Color.green
```

இந்த நிறங்களை பயன்படுத்துவது மிகவும் எளிது. ஆனால் உண்மையான App உருவாக்கத்தில், இயல்புநிலை நிறங்கள் பல நேரங்களில் போதுமான துல்லியமாக இருக்காது.

உதாரணமாக, வடிவமைப்பு படத்தில் இப்படிப்பட்ட நிறங்கள் பயன்படுத்தப்படலாம்:

```text
#2c54c2
#4875ed
#213e8d
```

இந்த வகை நிறம் Hex நிறம் எனப்படுகிறது.

இந்தப் பாடத்தில், முதலில் SwiftUI Hex நிறத்தை ஆதரிக்கச் செய்வோம். பின்னர் `static` பயன்படுத்தி பொதுவாகப் பயன்படுத்தப்படும் நிறங்களை ஒழுங்குபடுத்துவோம்.

இறுதியாக, தனிப்பயன் நிறங்களை விலங்கு கலைக்களஞ்சியக் காட்சியில் பயன்படுத்தி, மேலும் gradient பின்னணியைச் சேர்ப்போம். இதனால் பட்டன் அதிக அடுக்குத் தோற்றத்துடன் தெரியும்.

## ஏன் தனிப்பயன் நிறம் தேவை?

SwiftUI-யில், நாம் நேரடியாக system நிறங்களைப் பயன்படுத்தலாம்.

உதாரணமாக:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

இங்கே உள்ள `.blue` நீல நிறத்தைக் குறிக்கிறது. இது உண்மையில் `Color.blue` என்பதன் சுருக்கமான எழுதும் முறை.

இயல்புநிலை நிறங்களின் நன்மை எளிமையும் வசதியும் ஆகும். ஆனால் நிறத் தேர்வு ஒப்பீட்டளவில் வரையறுக்கப்பட்டது.

உதாரணமாக:

```swift
Color.blue
```

இதனால் SwiftUI வழங்கும் இயல்புநிலை நீல நிறத்தையே மட்டும் குறிக்க முடியும்.

![Color.blue](../../../Resource/031_color6.png)

ஆனால் உண்மையான உருவாக்கத்தில், நாம் அடிக்கடி இன்னும் குறிப்பான நிறங்களைத் தேவைப்படுத்துகிறோம்.

உதாரணமாக, எல்லாம் நீல நிறமாக இருந்தாலும், அது வெளிர் நீலம், ஆழமான நீலம், சாம்பல் கலந்த நீலம், பிரகாசமான நீலம் போன்ற பல்வேறு விளைவுகளாக இருக்கலாம்.

![More Blue](../../../Resource/031_color5.png)

இந்த நேரத்தில் `Color.blue` மட்டும் பயன்படுத்தினால், வடிவமைப்பு விளைவை மீண்டும் உருவாக்குவது கடினமாகும்.

எனவே, SwiftUI தனிப்பயன் நிறங்களை ஆதரிக்கச் செய்ய வேண்டும்.

## Hex நிறம் என்றால் என்ன?

திரையில் காணப்படும் நிறங்கள் பொதுவாக சிவப்பு, பச்சை, நீலம் என்ற மூன்று channels-ஆல் உருவாகின்றன. இதுவே RGB.

RGB முறையே குறிக்கும் விஷயங்கள்:

```text
Red     // சிவப்பு
Green   // பச்சை
Blue    // நீலம்
```

Hex நிறம் என்பது RGB நிறத்தை வெளிப்படுத்தும் ஒரு முறை.

உதாரணமாக:

```swift
#5479FF
```

இந்த நிற மதிப்பை எளிமையாக மூன்று பகுதிகளாகப் புரிந்து கொள்ளலாம்:

```text
54  // சிவப்பு channel-ஐ குறிக்கிறது
79  // பச்சை channel-ஐ குறிக்கிறது
FF  // நீலம் channel-ஐ குறிக்கிறது
```

இந்தப் பாடத்தில், இந்த மதிப்புகளை கணக்கிட வேண்டிய அவசியமில்லை. பதினாறடிப்படை விதிகளையும் ஆழமாகப் புரிந்து கொள்ள தேவையில்லை.

இப்போது தெரிந்து கொள்ள வேண்டியது ஒன்றே: `#5479FF` ஒரு குறிப்பிட்ட நிறத்தை குறிக்கிறது.

பின்னர் நாம் `#2c54c2`, `#4875ed` போன்ற எழுதுமுறைகளைப் பார்க்கும்போது, முதலில் அதை ஒரு நிற மதிப்பாகவே புரிந்து கொள்ளலாம்.

Sketch, Figma, Photoshop போன்ற வடிவமைப்பு கருவிகளிலும் இதுபோன்ற நிற மதிப்புகளை அடிக்கடி காணலாம்.

![color](../../../Resource/031_color.png)

ஆனால் SwiftUI இயல்பாக இப்படிப் நேரடியாக எழுத முடியாது:

```swift
Color(hex: "#5479FF")
```

எனவே, Hex string மூலம் நிறத்தை உருவாக்கும் திறனைப் பெற நாம் `Color` வகையை நாமே விரிவாக்க வேண்டும்.

## Color+Hex.swift கோப்பை உருவாக்குதல்

முதலில், ஒரு புதிய Swift கோப்பை உருவாக்குவோம்.

கோப்பு பெயரை இவ்வாறு எழுதலாம்:

```text
Color.swift
```

அல்லது மேலும் தெளிவாக இவ்வாறு எழுதலாம்:

```text
Color+Hex.swift
```

இங்கே பயன்படுத்த அதிகமாக பரிந்துரிக்கப்படுவது:

```text
Color+Hex.swift
```

Swift திட்டங்களில், `Color+Hex.swift` போன்ற கோப்பு பெயர்கள் மிகவும் பொதுவானவை.

இந்த கோப்பு `Color`-க்கு Hex திறனைச் சேர்க்கும் extension கோப்பு என்பதை இது குறிக்கிறது.

கோப்பு பெயர் code ஓடுவதைக் நேரடியாக பாதிக்காது. ஆனால் அந்த கோப்பின் பயன்பாட்டை எளிதாகப் புரிந்து கொள்ள உதவும்.

## Color(hex:) code சேர்த்தல்

`Color+Hex.swift` கோப்பில், கீழே உள்ள code-ஐ எழுதவும்:

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

இந்த code `extension` பயன்படுத்தி `Color` வகையை விரிவாக்குகிறது. மேலும் `Color`-க்கு ஒரு புதிய initialization method-ஐ சேர்க்கிறது:

```swift
init(hex: String)
```

இந்த initialization method கிடைத்த பிறகு, Hex string-ஐ `Color`-க்கு அனுப்பி, தனிப்பயன் நிறத்தை உருவாக்கலாம்:

```swift
Color(hex: "#5479FF")
```

இந்த extension code உள்ளே Hex string-ஐ SwiftUI அறியக்கூடிய RGB நிறமாக மாற்றும்.

இந்த கட்டத்தில் ஒவ்வொரு வரியின் மாற்று logic-ஐ ஆழமாகப் புரிந்து கொள்ள தேவையில்லை. சேர்க்கப்பட்ட `Color(hex:)` method, Hex நிற மதிப்பின் மூலம் தனிப்பயன் நிறத்தை உருவாக்க உதவுகிறது என்பதை மட்டும் புரிந்து கொண்டால் போதும்.

## தனிப்பயன் நிறத்தைப் பயன்படுத்துதல்

இப்போது, `ContentView`-இல் தனிப்பயன் நிறத்தைச் சோதிக்கலாம்.

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

காட்சி விளைவு:

![color](../../../Resource/031_color1.png)

இந்த எடுத்துக்காட்டில், முதல் வரி system நிறத்தைப் பயன்படுத்துகிறது:

```swift
.foregroundStyle(Color.blue)
```

பிற மூன்று வரிகள் தனிப்பயன் Hex நிறங்களைப் பயன்படுத்துகின்றன:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

ஒப்பிடுவதன் மூலம், system நீல நிறத்திற்கு ஒரு இயல்புநிலை விளைவு மட்டுமே இருப்பதை காணலாம்.

ஆனால் Hex நிறங்கள் மேலும் நுணுக்கமான நீல நிற மாற்றங்களை வெளிப்படுத்த முடியும்.

இதுவே தனிப்பயன் நிறத்தின் மதிப்பு: இது interface-இன் நிறத்தை உண்மையான வடிவமைப்பிற்கு மேலும் அருகில் கொண்டு செல்ல உதவும். மேலும் App-இன் visual style-ஐ கட்டுப்படுத்தவும் வசதியாக இருக்கும்.

## static பயன்படுத்தி நிறங்களை ஒழுங்குபடுத்துதல்

இப்போது, Hex string மூலம் நிறத்தை உருவாக்க முடிகிறது:

```swift
Color(hex: "#2c54c2")
```

இந்த எழுதுமுறை சாதாரணமாக பயன்படுத்த முடியும். ஆனால் அதே நிறம் பல இடங்களில் மீண்டும் மீண்டும் தோன்றினால், பின்னர் பராமரிப்பது சிரமமாகும்.

10 இடங்களில் இந்த நிற மதிப்பை எழுதியிருந்தால், பின்னர் இந்த நீலத்தை மாற்ற விரும்பும் போது ஒவ்வொன்றையும் தனித்தனியாக மாற்ற வேண்டும்.

இந்த நேரத்தில், `static` பயன்படுத்தி பொதுவாகப் பயன்படுத்தப்படும் நிறங்களை ஒரே இடத்தில் ஒழுங்குபடுத்தலாம்.

`Color+Hex.swift` கோப்பின் அடிப்பகுதியில், கீழே உள்ள code-ஐ தொடர்ந்து சேர்க்கவும்:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

இங்கே, `Color`-க்கு மூன்று static properties சேர்த்துள்ளோம்: `animalBlue`, `animalLightBlue`, `animalDarkBlue`. அவை முறையே வேறு வேறு ஆழங்களைக் கொண்ட நீல நிறங்களை குறிக்கின்றன.

இந்த properties `static` பயன்படுத்துவதால், அவை `Color` type-இற்கே சொந்தமானவை.

பயன்படுத்தும் போது, `Color.` மூலம் நேரடியாக அணுகலாம்:

```swift
Color.animalBlue
```

இந்த எழுதுமுறை நேரடியாக Hex string எழுதுவதைவிட தெளிவாக இருக்கும்.

`Color.animalBlue`-ஐ பார்க்கும்போது, இது விலங்கு கலைக்களஞ்சியத்தில் பயன்படுத்தப்படும் நீல நிறம் என்பதை அறியலாம்.

ஆனால் `Color(hex: "#2c54c2")`-ஐ பார்க்கும்போது, அது ஒரு நிற மதிப்பு என்பதை மட்டுமே தெரிந்து கொள்ள முடியும். அதன் குறிப்பான பயன்பாட்டை எளிதாக அறிய முடியாது.

நிறங்களை ஒரே இடத்தில் நிர்வகிப்பதற்கும் இன்னொரு நன்மை உள்ளது: பின்னர் மாற்றுவது வசதியாக இருக்கும்.

விலங்கு கலைக்களஞ்சியத்தின் பிரதான நிறத்தை மாற்ற விரும்பினால், வரையறுத்த இடத்தையே மாற்றினால் போதும்:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

இந்த நிறத்தைப் பயன்படுத்தும் எல்லா இடங்களும் ஒன்றாக புதுப்பிக்கப்படும்.

இதுவே `static` பயன்படுத்தி நிறங்களை ஒழுங்குபடுத்துவதன் பொருள்: நிறப் பெயர்கள் மேலும் தெளிவாகும். பின்னர் பராமரிப்பதும் எளிதாகும்.

## விலங்கு கலைக்களஞ்சியத்தில் பயன்படுத்துதல்

இப்போது, தனிப்பயன் நிறங்களை முன்பு செய்த விலங்கு கலைக்களஞ்சியக் காட்சியில் பயன்படுத்தலாம்.

முன்பு விலங்கு பட்டன் பின்னணி வெள்ளையாக இருந்தது:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

இப்போது, அதை தனிப்பயன் நிறமாக மாற்றலாம்:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

இங்கே உள்ள `Color.animalBlue` என்பது நாங்கள் முன்பு `Color+Hex.swift`-இல் வரையறுத்த static நிறம்.

பட்டன் உரை வெள்ளை நிறத்தைப் பயன்படுத்துகிறது:

```swift
.foregroundStyle(Color.white)
```

விலங்கு emoji-யின் பின்னணி பாதி வெளிப்படையான வெள்ளை நிறத்தைப் பயன்படுத்துகிறது:

```swift
.background(Color.white.opacity(0.15))
```

இதனால் பட்டன் ஒரே மாதிரியான நீல visual style-ஐ உருவாக்கும்.

இந்த படியின் முக்கியம் சிக்கலான code-ஐ அதிகரிப்பது அல்ல. மாறாக, முன்பு கற்ற தனிப்பயன் நிறத்தை உண்மையில் interface-இல் பயன்படுத்துவது.

## gradient பின்னணி பயன்படுத்துதல்

ஒற்றை நிறத்தைப் பயன்படுத்துவதற்கு கூடுதலாக, பல நிறங்களை இணைத்து gradient effect உருவாக்கலாம்.

உதாரணமாக, முன்பு நாம் வரையறுத்த நிறங்கள்:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

இந்த நிறங்களை தனித்தனியாகப் பயன்படுத்தலாம். அதேபோல் gradient பின்னணியாகவும் இணைக்கலாம்.

SwiftUI-யில், `LinearGradient` பயன்படுத்தி linear gradient உருவாக்கலாம்.

உதாரணமாக:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

இந்த code இடமிருந்து வலமாக செல்லும் gradient பின்னணியை உருவாக்கும். நிறம் `Color.animalBlue`-இல் இருந்து மெதுவாக `Color.animalLightBlue`-க்கு மாறும்.

இதில், `colors` gradient-இல் பங்கேற்கும் நிறங்களை அமைக்கிறது. `startPoint` மற்றும் `endPoint` gradient திசையை கட்டுப்படுத்துகின்றன.

### gradient effect-ஐ சோதித்தல்

ஒரு எளிய Text மூலம் gradient பின்னணியைச் சோதிக்கலாம்.

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

காட்சி விளைவு:

![color](../../../Resource/031_color3.png)

இந்த எடுத்துக்காட்டில், `Text`-இன் பின்னணி இனி ஒற்றை நிறமாக இல்லை. அது இடமிருந்து வலமாக மெதுவாக மாறும் gradient நிறமாக உள்ளது.

சாதாரண பின்னணி நிறத்துடன் ஒப்பிடும்போது, gradient பின்னணி அதிக அடுக்குத் தோற்றத்தைக் கொண்டிருக்கும். மேலும் interface-இல் visual focus உருவாக்கவும் எளிதாக இருக்கும்.

## விலங்கு கலைக்களஞ்சியத்தில் gradient பின்னணி பயன்படுத்துதல்

இப்போது, விலங்கு பட்டனின் பின்னணி நிறத்தை:

```swift
.background(Color.animalBlue)
```

gradient பின்னணியாக மாற்றலாம்:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

முழு code கீழே உள்ளது:

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

காட்சி விளைவு:

![color](../../../Resource/031_color4.png)

இப்போது, விலங்கு பட்டன் இனி ஒற்றை பின்னணி நிறமாக மட்டும் இல்லை. அது இடமிருந்து வலமாக செல்லும் gradient effect-ஐ கொண்டுள்ளது.

ஒற்றை நிற பின்னணியுடன் ஒப்பிடும்போது, gradient பின்னணி interface-ஐ அதிக அடுக்குத் தோற்றத்துடன் காட்டும். மேலும் உண்மையான App-களில் காணப்படும் visual design-க்கு மேலும் அருகில் இருக்கும்.

## ஒற்றை நிற பின்னணி மற்றும் gradient பின்னணியின் வித்தியாசம்

ஒற்றை நிற பின்னணி ஒரு நிறத்தை மட்டுமே பயன்படுத்துகிறது.

உதாரணமாக:

```swift
.background(Color.animalBlue)
```

இந்த எழுதுமுறை எளிமையாகவும் தெளிவாகவும் இருக்கும். பெரும்பாலான அடிப்படை interfaces-க்கு இது பொருத்தமானது.

gradient பின்னணி பல நிறங்களைப் பயன்படுத்தும்.

உதாரணமாக:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

இந்த எழுதுமுறை interface-ஐ அதிக அடுக்குத் தோற்றத்துடன் காட்டும். ஆனால் visual complexity-யையும் எளிதாக அதிகரிக்கலாம்.

எனவே உண்மையான உருவாக்கத்தில், இதுபோல் புரிந்து கொள்ளலாம்:

ஒற்றை நிற பின்னணி சாதாரண text, சாதாரண button, சாதாரண card, சாதாரண page background ஆகியவற்றிற்கு பொருத்தமானது.

gradient பின்னணி முக்கிய button, மேல் பகுதி, cover card, function entry போன்ற கவனம் செலுத்த வேண்டிய இடங்களுக்கு பொருத்தமானது.

## சுருக்கம்

இந்தப் பாடத்தில், SwiftUI-யில் தனிப்பயன் நிறத்தை எவ்வாறு பயன்படுத்துவது என்பதை கற்றோம்.

முதலில், Hex நிறம் பற்றி புரிந்துகொண்டோம்.

உதாரணமாக:

```text
#2c54c2
```

இது ஒரு குறிப்பிட்ட நிறத்தை குறிக்கிறது.

பின்னர், `extension Color` பயன்படுத்தி `Color` வகையை விரிவாக்கினோம்.

இதனால் SwiftUI கீழே உள்ள முறையில் நிறத்தை உருவாக்க முடியும்:

```swift
Color(hex: "#2c54c2")
```

அடுத்து, `static` பயன்படுத்தி பொதுவாகப் பயன்படுத்தப்படும் நிறங்களை ஒழுங்குபடுத்தினோம்:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

இதனால், மற்ற views-இல் நேரடியாக இவ்வாறு பயன்படுத்தலாம்:

```swift
Color.animalBlue
```

ஒவ்வொரு முறையும் Hex string எழுதுவதுடன் ஒப்பிடும்போது, இந்த முறை மேலும் தெளிவானது. பின்னர் நிறத்தை ஒரே இடத்தில் மாற்றவும் வசதியாக இருக்கும்.

இறுதியாக, `LinearGradient`-ஐ கற்றோம். மேலும் தனிப்பயன் நிறங்களை இணைத்து gradient பின்னணியை உருவாக்கினோம்:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

இந்தப் பாடத்தின் மூலம், “தனிப்பயன் நிறத்தை உருவாக்குதல்” முதல் “உண்மையான interface-இல் நிறத்தைப் பயன்படுத்துதல்” வரை ஒரு முழு செயல்முறையை முடித்தோம்.

பின்னர், ஒரு நிறத்தை பல இடங்களில் மீண்டும் மீண்டும் பயன்படுத்த வேண்டியிருந்தால், முதலில் அதை `Color` extension-இல் ஒழுங்குபடுத்துவதை கருத்தில் கொள்ளலாம்.

இதனால் code மேலும் தெளிவாகும். interface style-ஐ ஒரே மாதிரியாக வைத்திருப்பதும் எளிதாகும்.
