# सानुकूल रंग

या धड्यात आपण SwiftUI मध्ये रंग कसे सानुकूलित करायचे ते शिकू.

मागील धड्यांमध्ये आपण SwiftUI ने दिलेले डीफॉल्ट रंग वापरले आहेत, उदाहरणार्थ:

```swift
Color.blue
Color.red
Color.green
```

हे रंग वापरण्यास सोयीचे आहेत, पण खऱ्या App विकासात डीफॉल्ट रंग अनेकदा पुरेसे अचूक नसतात.

उदाहरणार्थ, डिझाइनमध्ये असे रंग वापरलेले असू शकतात:

```text
#2c54c2
#4875ed
#213e8d
```

या प्रकारच्या रंगाला Hex रंग म्हणतात.

या धड्यात आपण आधी SwiftUI ला Hex रंगांचे समर्थन देऊ, नंतर `static` वापरून नेहमी वापरले जाणारे रंग व्यवस्थित करू.

शेवटी, आपण सानुकूल रंग प्राणी विश्वकोश दृश्यात लागू करू आणि बटणांना अधिक स्तरयुक्त दिसण्यासाठी gradient background वापरू.

## सानुकूल रंगांची गरज का आहे?

SwiftUI मध्ये आपण system colors थेट वापरू शकतो.

उदाहरणार्थ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

येथील `.blue` म्हणजे निळा रंग. तो प्रत्यक्षात `Color.blue` ची संक्षिप्त लेखन पद्धत आहे.

डीफॉल्ट रंगांचा फायदा म्हणजे ते सोपे आणि सोयीचे असतात, पण रंगांची निवड मर्यादित असते.

उदाहरणार्थ:

```swift
Color.blue
```

हे फक्त SwiftUI ने दिलेला डीफॉल्ट निळा रंग दर्शवू शकते.

![Color.blue](../../../Resource/031_color6.png)

परंतु प्रत्यक्ष विकासात आपल्याला अनेकदा अधिक विशिष्ट रंगांची गरज असते.

उदाहरणार्थ, सर्व रंग निळे असले तरी हलका निळा, गडद निळा, करडा निळा, उजळ निळा असे वेगवेगळे परिणाम असू शकतात.

![More Blue](../../../Resource/031_color5.png)

अशा वेळी फक्त `Color.blue` वापरल्यास डिझाइनचा परिणाम अचूकपणे पुनरुत्पादित करणे कठीण होते.

म्हणून, आपल्याला SwiftUI ला सानुकूल रंगांचे समर्थन द्यावे लागते.

## Hex रंग म्हणजे काय?

स्क्रीनवरील रंग सामान्यतः लाल, हिरवा आणि निळा या तीन चॅनेल्सपासून बनतात, म्हणजेच RGB.

RGB यांचा अर्थ:

```text
Red     // लाल
Green   // हिरवा
Blue    // निळा
```

Hex रंग हा RGB रंग दर्शवण्याचा एक मार्ग आहे.

उदाहरणार्थ:

```swift
#5479FF
```

हा रंगमूल्य सोप्या पद्धतीने तीन भागांमध्ये समजता येतो:

```text
54  // लाल चॅनेल दर्शवते
79  // हिरवा चॅनेल दर्शवते
FF  // निळा चॅनेल दर्शवते
```

या धड्यात आपल्याला ही मूल्ये मोजण्याची गरज नाही, तसेच hexadecimal नियम खोलवर समजून घेण्याचीही गरज नाही.

आत्ता फक्त एवढे जाणून घ्यायचे आहे: `#5479FF` एक विशिष्ट रंग दर्शवते.

नंतर जेव्हा आपण `#2c54c2`, `#4875ed` अशा स्वरूपातील लेखन पाहू, तेव्हा त्याला आधी रंगमूल्य म्हणून समजू शकतो.

Sketch, Figma, Photoshop अशा डिझाइन साधनांमध्येही अशा प्रकारची रंगमूल्ये अनेकदा दिसतात.

![color](../../../Resource/031_color.png)

परंतु SwiftUI डीफॉल्टने असे थेट लिहिण्यास समर्थन देत नाही:

```swift
Color(hex: "#5479FF")
```

म्हणून, आपल्याला स्वतः `Color` type विस्तारावी लागेल, जेणेकरून ती Hex string मधून रंग तयार करू शकेल.

## Color+Hex.swift फाइल तयार करा

सुरुवातीला, आपण एक नवीन Swift file तयार करू.

फाइलचे नाव असे ठेवू शकतो:

```text
Color.swift
```

किंवा अधिक स्पष्टपणे असे लिहू शकतो:

```text
Color+Hex.swift
```

येथे अधिक शिफारस केलेले नाव आहे:

```text
Color+Hex.swift
```

Swift प्रकल्पांमध्ये `Color+Hex.swift` सारखी फाइल नावे खूप सामान्य आहेत.

याचा अर्थ ही फाइल `Color` ला Hex क्षमता जोडणारी extension file आहे.

फाइलचे नाव कोडच्या रनिंगवर थेट परिणाम करत नाही. ते फक्त या फाइलचा उपयोग आपल्याला अधिक सहज समजण्यासाठी असते.

## Color(hex:) कोड जोडा

`Color+Hex.swift` फाइलमध्ये खालील कोड लिहा:

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

हा कोड `extension` वापरून `Color` type विस्तारतो आणि `Color` मध्ये एक नवीन initializer जोडतो:

```swift
init(hex: String)
```

हा initializer मिळाल्यानंतर आपण Hex string `Color` ला देऊन सानुकूल रंग तयार करू शकतो:

```swift
Color(hex: "#5479FF")
```

या extension code च्या आत Hex string SwiftUI ला ओळखता येणाऱ्या RGB रंगात रूपांतरित केली जाते.

सध्याच्या टप्प्यावर प्रत्येक ओळीतील रूपांतरण logic खोलवर समजण्याची गरज नाही. फक्त एवढे समजणे पुरेसे आहे की जोडलेली `Color(hex:)` method आपल्याला Hex रंगमूल्यांद्वारे सानुकूल रंग तयार करू देते.

## सानुकूल रंग वापरणे

आता आपण `ContentView` मध्ये सानुकूल रंगांची चाचणी करू शकतो.

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

दृश्य परिणाम:

![color](../../../Resource/031_color1.png)

या उदाहरणात, पहिली ओळ system color वापरते:

```swift
.foregroundStyle(Color.blue)
```

पुढील तीन ओळी सानुकूल Hex रंग वापरतात:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

तुलना केल्यावर दिसते की system blue फक्त एक डीफॉल्ट परिणाम देतो.

पण Hex रंग निळ्या रंगातील अधिक सूक्ष्म बदल दर्शवू शकतात.

सानुकूल रंगांचे महत्त्व हेच आहे: ते interface चे रंग वास्तविक डिझाइनच्या अधिक जवळ आणतात आणि App च्या visual style वर नियंत्रण ठेवणे सोपे करतात.

## static वापरून रंग व्यवस्थित करणे

आता आपण Hex string मधून रंग तयार करू शकतो:

```swift
Color(hex: "#2c54c2")
```

ही लेखनपद्धत नीट काम करते, पण तोच रंग अनेक ठिकाणी पुन्हा पुन्हा वापरला गेला, तर नंतर देखभाल करणे सोयीचे राहत नाही.

जर 10 ठिकाणी हेच रंगमूल्य लिहिले असेल, तर नंतर हा निळा रंग बदलायचा असल्यास प्रत्येक ठिकाणी वेगळे बदल करावे लागतील.

अशा वेळी आपण `static` वापरून नेहमी वापरले जाणारे रंग एका ठिकाणी व्यवस्थित करू शकतो.

`Color+Hex.swift` फाइलच्या शेवटी पुढील कोड जोडत राहा:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

येथे आपण `Color` मध्ये तीन static properties जोडल्या आहेत: `animalBlue`, `animalLightBlue` आणि `animalDarkBlue`. त्या निळ्या रंगाच्या वेगवेगळ्या छटा दर्शवतात.

या properties मध्ये `static` वापरले असल्याने त्या `Color` type स्वतःशी संबंधित आहेत.

वापरताना आपण त्या थेट `Color.` द्वारे access करू शकतो:

```swift
Color.animalBlue
```

ही लेखनपद्धत थेट Hex string लिहिण्यापेक्षा अधिक स्पष्ट आहे.

जेव्हा आपण `Color.animalBlue` पाहतो, तेव्हा हा प्राणी विश्वकोशात वापरला जाणारा निळा रंग आहे हे समजू शकते.

पण `Color(hex: "#2c54c2")` पाहिल्यास तो एक रंगमूल्य आहे एवढेच कळते; त्याचा विशिष्ट उपयोग लगेच समजत नाही.

रंग एकत्रितपणे व्यवस्थापित करण्याचा अजून एक फायदा आहे: नंतर बदल करणे अधिक सोपे होते.

जर प्राणी विश्वकोशाचा मुख्य रंग बदलायचा असेल, तर फक्त definition असलेली जागा बदलावी लागते:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

हा रंग वापरणाऱ्या सर्व जागा एकत्र update होतील.

`static` वापरून रंग व्यवस्थित करण्याचा अर्थ हाच आहे: रंगांची नावे अधिक स्पष्ट होतात आणि नंतरची देखभाल अधिक सोयीची होते.

## प्राणी विश्वकोशात लागू करणे

आता आपण सानुकूल रंग आधीच्या प्राणी विश्वकोश view मध्ये लागू करू शकतो.

पूर्वी प्राणी button चा background पांढरा होता:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

आता आपण तो सानुकूल रंगात बदलू शकतो:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

येथील `Color.animalBlue` हा आपण आत्ताच `Color+Hex.swift` मध्ये define केलेला static color आहे.

Button text पांढरा रंग वापरतो:

```swift
.foregroundStyle(Color.white)
```

प्राणी emoji च्या background साठी अर्धपारदर्शक पांढरा रंग वापरतो:

```swift
.background(Color.white.opacity(0.15))
```

यामुळे button मध्ये एकसंध निळी visual style तयार होते.

या पायरीचा मुख्य मुद्दा जटिल कोड वाढवणे नाही, तर आधी शिकलेले सानुकूल रंग प्रत्यक्ष interface मध्ये खरोखर लागू करणे आहे.

## Gradient Background वापरणे

एकाच रंगाशिवाय, आपण अनेक रंग एकत्र करून gradient effect देखील तयार करू शकतो.

उदाहरणार्थ, आपण आधी हे रंग define केले आहेत:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

हे रंग स्वतंत्रपणे वापरता येतात, तसेच gradient background म्हणूनही एकत्र करता येतात.

SwiftUI मध्ये linear gradient तयार करण्यासाठी `LinearGradient` वापरू शकतो.

उदाहरणार्थ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

हा कोड डावीकडून उजवीकडे जाणारा gradient background तयार करतो, ज्यात रंग `Color.animalBlue` पासून हळूहळू `Color.animalLightBlue` कडे बदलतो.

यामध्ये `colors` gradient मध्ये सहभागी होणारे रंग सेट करण्यासाठी वापरले जाते, तर `startPoint` आणि `endPoint` gradient ची दिशा नियंत्रित करण्यासाठी वापरले जातात.

### Gradient effect ची चाचणी

Gradient background चाचणी करण्यासाठी आपण एक साधा Text वापरू शकतो.

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

दृश्य परिणाम:

![color](../../../Resource/031_color3.png)

या उदाहरणात `Text` चा background आता एकाच रंगाचा नाही; तो डावीकडून उजवीकडे हळूहळू बदलणारा gradient color आहे.

सामान्य background color च्या तुलनेत gradient background मध्ये अधिक स्तर जाणवतो आणि interface मध्ये visual focus निर्माण करणे सोपे होते.

## प्राणी विश्वकोशात Gradient Background वापरणे

आता आपण प्राणी button चा background color:

```swift
.background(Color.animalBlue)
```

gradient background मध्ये बदलू शकतो:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

पूर्ण कोड खालीलप्रमाणे आहे:

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

दृश्य परिणाम:

![color](../../../Resource/031_color4.png)

आता प्राणी button फक्त एकाच background color मध्ये नाही, तर त्याला डावीकडून उजवीकडे जाणारा gradient effect आहे.

Single-color background च्या तुलनेत gradient background interface अधिक स्तरयुक्त दिसू शकतो आणि खऱ्या App मधील visual design च्या अधिक जवळ वाटतो.

## Single-color background आणि gradient background यातील फरक

Single-color background फक्त एक रंग वापरतो.

उदाहरणार्थ:

```swift
.background(Color.animalBlue)
```

ही लेखनपद्धत साधी आणि स्पष्ट आहे, आणि बहुतेक basic interfaces साठी योग्य आहे.

Gradient background अनेक रंग वापरतो.

उदाहरणार्थ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

ही लेखनपद्धत interface ला अधिक स्तरयुक्त बनवू शकते, पण visual complexity देखील अधिक सहज वाढवू शकते.

म्हणून प्रत्यक्ष विकासात असे समजता येते:

Single-color background सामान्य text, सामान्य buttons, सामान्य cards आणि सामान्य page backgrounds साठी योग्य असतो.

Gradient background key buttons, top areas, cover cards, feature entrances आणि जोर देण्याची गरज असलेल्या इतर जागांसाठी योग्य असतो.

## सारांश

या धड्यात आपण SwiftUI मध्ये सानुकूल रंग कसे वापरायचे ते शिकलो.

सुरुवातीला आपण Hex रंग समजून घेतला.

उदाहरणार्थ:

```text
#2c54c2
```

तो एक विशिष्ट रंग दर्शवतो.

यानंतर आपण `extension Color` वापरून `Color` type विस्तारला.

यामुळे SwiftUI खालील पद्धतीने रंग तयार करू शकते:

```swift
Color(hex: "#2c54c2")
```

नंतर आपण `static` वापरून नेहमी वापरले जाणारे रंग व्यवस्थित केले:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

अशा प्रकारे इतर views मध्ये थेट वापरता येते:

```swift
Color.animalBlue
```

प्रत्येक वेळी Hex string लिहिण्याच्या तुलनेत ही पद्धत अधिक स्पष्ट आहे आणि नंतर रंग एकत्रितपणे बदलणेही अधिक सोयीचे करते.

शेवटी, आपण `LinearGradient` शिकलो आणि सानुकूल रंग एकत्र करून gradient background तयार केला:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

या धड्याद्वारे आपण “सानुकूल रंग तयार करणे” पासून “खऱ्या interface मध्ये रंग वापरणे” पर्यंतची प्रक्रिया पूर्ण केली.

नंतर एखादा रंग अनेक ठिकाणी वारंवार वापरायचा असेल, तर आधी तो `Color` extension मध्ये व्यवस्थित करण्याचा विचार करू शकतो.

यामुळे code अधिक स्पष्ट होईल आणि interface style एकसंध ठेवणे अधिक सोपे होईल.
