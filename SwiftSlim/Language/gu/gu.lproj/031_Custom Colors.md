# કસ્ટમ રંગો

આ પાઠમાં, આપણે SwiftUI માં રંગોને કસ્ટમાઇઝ કરવાનું શીખીશું.

પાછલા પાઠોમાં, આપણે SwiftUI દ્વારા આપવામાં આવતા ડિફૉલ્ટ રંગોનો ઉપયોગ કરી ચૂક્યા છીએ, ઉદાહરણ તરીકે:

```swift
Color.blue
Color.red
Color.green
```

આ રંગો ઉપયોગમાં ખૂબ સરળ છે, પરંતુ વાસ્તવિક App વિકાસમાં, ડિફૉલ્ટ રંગો ઘણી વાર પૂરતા ચોક્કસ નથી હોતા.

ઉદાહરણ તરીકે, ડિઝાઇનમાં આવા રંગો ઉપયોગમાં લેવાયા હોઈ શકે છે:

```text
#2c54c2
#4875ed
#213e8d
```

આ પ્રકારના રંગને Hex રંગ કહેવામાં આવે છે.

આ પાઠમાં, આપણે પહેલાં SwiftUI ને Hex રંગો સપોર્ટ કરાવશું, પછી `static` નો ઉપયોગ કરીને સામાન્ય રીતે વપરાતા રંગોને ગોઠવશું.

અંતમાં, આપણે કસ્ટમ રંગોને પ્રાણી વિશ્વકોશ વ્યૂમાં લાગુ કરીશું, અને વધુમાં ગ્રેડિયન્ટ પૃષ્ઠભૂમિનો ઉપયોગ કરીને બટનોને વધુ સ્તરયુક્ત દેખાવ આપશું.

## કસ્ટમ રંગોની જરૂર શા માટે પડે?

SwiftUI માં, આપણે સીધા સિસ્ટમ રંગોનો ઉપયોગ કરી શકીએ છીએ.

ઉદાહરણ તરીકે:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

અહીં `.blue` નો અર્થ વાદળી રંગ છે. તે વાસ્તવમાં `Color.blue` નું ટૂંકું સ્વરૂપ છે.

ડિફૉલ્ટ રંગોનો ફાયદો એ છે કે તેઓ સરળ અને સુવિધાજનક છે, પરંતુ રંગોની પસંદગી મર્યાદિત હોય છે.

ઉદાહરણ તરીકે:

```swift
Color.blue
```

આ માત્ર SwiftUI દ્વારા આપવામાં આવેલો ડિફૉલ્ટ વાદળી રંગ દર્શાવી શકે છે.

![Color.blue](../../../Resource/031_color6.png)

પરંતુ વાસ્તવિક વિકાસમાં, આપણે ઘણી વાર વધુ ચોક્કસ રંગોની જરૂર પડે છે.

ઉદાહરણ તરીકે, બધાં વાદળી જ હોવા છતાં, તેમાં હળવો વાદળી, ગાઢ વાદળી, ધૂસર વાદળી અને તેજસ્વી વાદળી જેવા જુદા જુદા પ્રભાવ હોઈ શકે છે.

![More Blue](../../../Resource/031_color5.png)

આ સમયે, જો આપણે માત્ર `Color.blue` નો ઉપયોગ કરીએ, તો ડિઝાઇન અસરને સાચી રીતે પુનઃસર્જિત કરવી મુશ્કેલ બને છે.

એટલે, આપણે SwiftUI ને કસ્ટમ રંગો સપોર્ટ કરાવવાની જરૂર છે.

## Hex રંગ શું છે?

સ્ક્રીન પર દેખાતા રંગો સામાન્ય રીતે લાલ, લીલા અને વાદળી ત્રણ ચેનલથી બનેલા હોય છે. આને RGB કહેવામાં આવે છે.

RGB નો અર્થ છે:

```text
Red     // લાલ
Green   // લીલો
Blue    // વાદળી
```

Hex રંગ RGB રંગ દર્શાવવાની એક રીત છે.

ઉદાહરણ તરીકે:

```swift
#5479FF
```

આ રંગ મૂલ્યને સરળ રીતે ત્રણ ભાગ તરીકે સમજી શકાય:

```text
54  // લાલ ચેનલ દર્શાવે છે
79  // લીલી ચેનલ દર્શાવે છે
FF  // વાદળી ચેનલ દર્શાવે છે
```

આ પાઠમાં, આપણે આ મૂલ્યોની ગણતરી કરવાની જરૂર નથી, અને સોળાધારી નિયમોને ઊંડાણથી સમજવાની પણ જરૂર નથી.

હાલ માટે, ફક્ત એટલું જાણવું જરૂરી છે કે `#5479FF` એક ચોક્કસ રંગ દર્શાવે છે.

આગળ જ્યારે આપણે `#2c54c2` અને `#4875ed` જેવી લખાવટ જોઈએ, ત્યારે તેને પહેલાં રંગ મૂલ્ય તરીકે સમજી શકીએ.

Sketch, Figma અને Photoshop જેવા ડિઝાઇન સાધનોમાં પણ આવા રંગ મૂલ્યો ઘણી વાર જોવા મળે છે.

![color](../../../Resource/031_color.png)

પરંતુ, SwiftUI ડિફૉલ્ટ રીતે આવું સીધું લખવાનું સપોર્ટ કરતું નથી:

```swift
Color(hex: "#5479FF")
```

એટલે, આપણે જાતે `Color` પ્રકારને વિસ્તૃત કરવાની જરૂર છે, જેથી તે Hex સ્ટ્રિંગથી રંગ બનાવવાનું સપોર્ટ કરે.

## Color+Hex.swift ફાઇલ બનાવો

સૌપ્રથમ, એક નવી Swift ફાઇલ બનાવો.

ફાઇલનું નામ આ રીતે લખી શકાય:

```text
Color.swift
```

અથવા વધુ સ્પષ્ટ રીતે આ રીતે પણ લખી શકાય:

```text
Color+Hex.swift
```

અહીં વધુ ભલામણ કરેલું નામ છે:

```text
Color+Hex.swift
```

Swift પ્રોજેક્ટમાં, `Color+Hex.swift` જેવા ફાઇલ નામો ખૂબ સામાન્ય છે.

તેનો અર્થ એ છે કે આ ફાઇલ `Color` માટે Hex ક્ષમતા ઉમેરતી એક extension ફાઇલ છે.

ફાઇલનું નામ કોડ ચલાવા પર સીધી અસર કરતું નથી. તે ફક્ત અમને આ ફાઇલનો ઉપયોગ વધુ સરળતાથી સમજવામાં મદદ કરે છે.

## Color(hex:) કોડ ઉમેરો

`Color+Hex.swift` ફાઇલમાં, નીચેનો કોડ લખો:

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

આ કોડ `extension` નો ઉપયોગ કરીને `Color` પ્રકારને વિસ્તૃત કરે છે, અને `Color` માટે એક નવી initialization પદ્ધતિ ઉમેરે છે:

```swift
init(hex: String)
```

આ initialization પદ્ધતિ મળ્યા પછી, આપણે Hex સ્ટ્રિંગને `Color` માં આપી શકીએ છીએ, જેથી કસ્ટમ રંગ બનાવી શકાય:

```swift
Color(hex: "#5479FF")
```

આ extension કોડની અંદર, Hex સ્ટ્રિંગને SwiftUI ઓળખી શકે તેવા RGB રંગમાં રૂપાંતરિત કરવામાં આવે છે.

હાલના તબક્કે, દરેક પંક્તિની રૂપાંતરણ લોજિક ઊંડાણથી સમજવાની જરૂર નથી. ફક્ત એટલું જાણવું પૂરતું છે કે ઉમેરેલી `Color(hex:)` પદ્ધતિ આપણને Hex રંગ મૂલ્યથી કસ્ટમ રંગ બનાવવાની મંજૂરી આપે છે.

## કસ્ટમ રંગોનો ઉપયોગ કરો

હવે, આપણે `ContentView` માં કસ્ટમ રંગો ટેસ્ટ કરી શકીએ છીએ.

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

દર્શાવતી અસર:

![color](../../../Resource/031_color1.png)

આ ઉદાહરણમાં, પહેલી પંક્તિ સિસ્ટમ રંગનો ઉપયોગ કરે છે:

```swift
.foregroundStyle(Color.blue)
```

પછીની ત્રણ પંક્તિઓ કસ્ટમ Hex રંગોનો ઉપયોગ કરે છે:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

તુલના કરીને જોઈ શકાય છે કે સિસ્ટમ વાદળી રંગમાં માત્ર એક ડિફૉલ્ટ અસર છે.

પરંતુ Hex રંગો વાદળીના વધુ સૂક્ષ્મ ફેરફારો દર્શાવી શકે છે.

આ જ કસ્ટમ રંગોની કિંમત છે: તે ઇન્ટરફેસના રંગોને વાસ્તવિક ડિઝાઇનની નજીક લાવી શકે છે, અને App ની દૃશ્ય શૈલીને નિયંત્રિત કરવી વધુ સરળ બનાવે છે.

## રંગો ગોઠવવા માટે static નો ઉપયોગ કરો

હવે, આપણે Hex સ્ટ્રિંગ દ્વારા રંગ બનાવી શકીએ છીએ:

```swift
Color(hex: "#2c54c2")
```

આ લખવાની રીત સામાન્ય રીતે કામ કરે છે, પરંતુ જો એ જ રંગ ઘણા સ્થળોએ વારંવાર દેખાય, તો પાછળથી જાળવણી મુશ્કેલ બને છે.

જો આ રંગ મૂલ્ય 10 અલગ અલગ જગ્યાએ લખાયેલું હોય, તો આગળ જઈને આ વાદળી રંગ બદલવો હોય તો દરેક જગ્યાએ જઈને બદલવું પડે.

આ સમયે, આપણે `static` નો ઉપયોગ કરીને સામાન્ય રીતે વપરાતા રંગોને એક જગ્યાએ ગોઠવી શકીએ છીએ.

`Color+Hex.swift` ફાઇલના અંતે, નીચેનો કોડ આગળ ઉમેરો:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

અહીં, આપણે `Color` માટે ત્રણ static properties ઉમેર્યા છે: `animalBlue`, `animalLightBlue` અને `animalDarkBlue`. તેઓ વાદળીના જુદા જુદા ગાઢપણ દર્શાવે છે.

કારણ કે આ properties `static` નો ઉપયોગ કરે છે, તેથી તે `Color` પ્રકાર પોતાનો ભાગ છે.

ઉપયોગ કરતી વખતે, આપણે તેમને સીધા `Color.` દ્વારા access કરી શકીએ છીએ:

```swift
Color.animalBlue
```

આ લખવાની રીત સીધું Hex સ્ટ્રિંગ લખવા કરતાં વધુ સ્પષ્ટ છે.

જ્યારે આપણે `Color.animalBlue` જોઈએ, ત્યારે જાણીએ છીએ કે તે પ્રાણી વિશ્વકોશમાં વપરાતો વાદળી રંગ દર્શાવે છે.

પરંતુ જ્યારે આપણે `Color(hex: "#2c54c2")` જોઈએ, ત્યારે ફક્ત એટલું જ ખબર પડે છે કે તે એક રંગ મૂલ્ય છે, તેની ચોક્કસ ઉપયોગિતા સહેલાઈથી સમજાતી નથી.

રંગોને એક જગ્યાએ સંચાલિત કરવાનો બીજો ફાયદો પણ છે: પછીથી ફેરફાર કરવો વધુ સરળ બને છે.

જો પ્રાણી વિશ્વકોશનો મુખ્ય રંગ બદલવો હોય, તો ફક્ત definition જગ્યાએ ફેરફાર કરવો પડે:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

આ રંગનો ઉપયોગ કરતી બધી જગ્યાઓ સાથે સાથે અપડેટ થઈ જશે.

આ જ `static` નો ઉપયોગ કરીને રંગો ગોઠવવાનો અર્થ છે: રંગોના નામ વધુ સ્પષ્ટ બને છે, અને પછીની જાળવણી વધુ સુવિધાજનક બને છે.

## પ્રાણી વિશ્વકોશમાં લાગુ કરો

હવે, આપણે કસ્ટમ રંગોને અગાઉના પ્રાણી વિશ્વકોશ વ્યૂમાં લાગુ કરી શકીએ છીએ.

પહેલાં, પ્રાણી બટનની પૃષ્ઠભૂમિ સફેદ હતી:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

હવે, આપણે તેને કસ્ટમ રંગમાં બદલી શકીએ છીએ:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

અહીં, `Color.animalBlue` એ આપણે હમણાં `Color+Hex.swift` માં વ્યાખ્યાયિત કરેલો static રંગ છે.

બટનનો ટેક્સ્ટ સફેદ રંગનો ઉપયોગ કરે છે:

```swift
.foregroundStyle(Color.white)
```

પ્રાણી emoji ની પૃષ્ઠભૂમિ અર્ધપારદર્શક સફેદ રંગનો ઉપયોગ કરે છે:

```swift
.background(Color.white.opacity(0.15))
```

આ રીતે બટન માટે એકસમાન વાદળી દૃશ્ય શૈલી બને છે.

આ પગલાનું મુખ્ય ધ્યાન જટિલ કોડ ઉમેરવું નથી, પરંતુ અગાઉ શીખેલા કસ્ટમ રંગોને સાચા અર્થમાં ઇન્ટરફેસમાં લાગુ કરવું છે.

## ગ્રેડિયન્ટ પૃષ્ઠભૂમિનો ઉપયોગ કરો

એકમાત્ર રંગનો ઉપયોગ કરવા ઉપરાંત, આપણે અનેક રંગોને જોડીને ગ્રેડિયન્ટ અસર પણ બનાવી શકીએ છીએ.

ઉદાહરણ તરીકે, આપણે અગાઉ આ રંગો વ્યાખ્યાયિત કર્યા હતા:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

આ રંગો માત્ર અલગ અલગ રીતે જ નહીં, પણ જોડીને ગ્રેડિયન્ટ પૃષ્ઠભૂમિ તરીકે પણ ઉપયોગ કરી શકાય છે.

SwiftUI માં, `LinearGradient` નો ઉપયોગ કરીને રેખીય ગ્રેડિયન્ટ બનાવી શકાય છે.

ઉદાહરણ તરીકે:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

આ કોડ ડાબેથી જમણે જતી ગ્રેડિયન્ટ પૃષ્ઠભૂમિ બનાવે છે, જેમાં રંગ `Color.animalBlue` થી ધીમે ધીમે `Color.animalLightBlue` તરફ બદલાય છે.

અહીં, `colors` ગ્રેડિયન્ટમાં ભાગ લેતા રંગો સેટ કરવા માટે છે, જ્યારે `startPoint` અને `endPoint` ગ્રેડિયન્ટની દિશા નિયંત્રિત કરવા માટે છે.

### ગ્રેડિયન્ટ અસર ટેસ્ટ કરો

અપણે એક સરળ Text નો ઉપયોગ કરીને ગ્રેડિયન્ટ પૃષ્ઠભૂમિ ટેસ્ટ કરી શકીએ છીએ.

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

દર્શાવતી અસર:

![color](../../../Resource/031_color3.png)

આ ઉદાહરણમાં, `Text` ની પૃષ્ઠભૂમિ હવે એકમાત્ર રંગ નથી. તેના બદલે, તે ડાબેથી જમણે ધીમે ધીમે બદલાતો ગ્રેડિયન્ટ રંગ છે.

સામાન્ય પૃષ્ઠભૂમિ રંગની તુલનામાં, ગ્રેડિયન્ટ પૃષ્ઠભૂમિમાં વધુ સ્તરિયતા હોય છે, અને તે ઇન્ટરફેસમાં દૃશ્ય કેન્દ્રબિંદુ બનાવવામાં વધુ મદદરૂપ બને છે.

## પ્રાણી વિશ્વકોશમાં ગ્રેડિયન્ટ પૃષ્ઠભૂમિનો ઉપયોગ કરો

હવે, આપણે પ્રાણી બટનની પૃષ્ઠભૂમિ રંગને બદલી શકીએ છીએ:

```swift
.background(Color.animalBlue)
```

ગ્રેડિયન્ટ પૃષ્ઠભૂમિમાં:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

પૂર્ણ કોડ નીચે મુજબ છે:

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

દર્શાવતી અસર:

![color](../../../Resource/031_color4.png)

હવે, પ્રાણી બટન માત્ર એકમાત્ર પૃષ્ઠભૂમિ રંગ ધરાવતું નથી. તેના બદલે, તેમાં ડાબેથી જમણે જતી ગ્રેડિયન્ટ અસર છે.

એક રંગની પૃષ્ઠભૂમિની તુલનામાં, ગ્રેડિયન્ટ પૃષ્ઠભૂમિ ઇન્ટરફેસને વધુ સ્તરયુક્ત દેખાવ આપે છે અને વાસ્તવિક App ની દૃશ્ય ડિઝાઇનની નજીક લાવે છે.

## એકરંગી પૃષ્ઠભૂમિ અને ગ્રેડિયન્ટ પૃષ્ઠભૂમિનો ફરક

એકરંગી પૃષ્ઠભૂમિ માત્ર એક રંગનો ઉપયોગ કરે છે.

ઉદાહરણ તરીકે:

```swift
.background(Color.animalBlue)
```

આ લખવાની રીત સરળ અને સ્પષ્ટ છે, અને મોટાભાગના મૂળભૂત ઇન્ટરફેસ માટે યોગ્ય છે.

ગ્રેડિયન્ટ પૃષ્ઠભૂમિ અનેક રંગોનો ઉપયોગ કરે છે.

ઉદાહરણ તરીકે:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

આ લખવાની રીત ઇન્ટરફેસને વધુ સ્તરિય બનાવી શકે છે, પરંતુ તે દૃશ્ય જટિલતા પણ વધારે સરળતાથી વધારી શકે છે.

એટલે, વાસ્તવિક વિકાસમાં, આપણે તેને આ રીતે સમજી શકીએ:

એકરંગી પૃષ્ઠભૂમિ સામાન્ય ટેક્સ્ટ, સામાન્ય બટન, સામાન્ય કાર્ડ અને સામાન્ય પેજ પૃષ્ઠભૂમિ માટે યોગ્ય છે.

ગ્રેડિયન્ટ પૃષ્ઠભૂમિ મુખ્ય બટન, ટોચનો વિસ્તાર, કવર કાર્ડ, ફીચર પ્રવેશદ્વાર અને ભાર આપવાની જરૂર હોય તેવી અન્ય જગ્યાઓ માટે યોગ્ય છે.

## સારાંશ

આ પાઠમાં, આપણે SwiftUI માં કસ્ટમ રંગોનો ઉપયોગ કેવી રીતે કરવો તે શીખ્યા.

સૌપ્રથમ, આપણે Hex રંગો વિશે શીખ્યા.

ઉદાહરણ તરીકે:

```text
#2c54c2
```

તે એક ચોક્કસ રંગ દર્શાવે છે.

પછી, આપણે `extension Color` નો ઉપયોગ કરીને `Color` પ્રકારને વિસ્તૃત કર્યો.

આથી SwiftUI નીચેની રીતથી રંગ બનાવી શકે છે:

```swift
Color(hex: "#2c54c2")
```

ત્યારબાદ, આપણે `static` નો ઉપયોગ કરીને સામાન્ય રીતે વપરાતા રંગોને ગોઠવ્યા:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

આ રીતે, અન્ય views માં તેને સીધા ઉપયોગ કરી શકાય છે:

```swift
Color.animalBlue
```

દરેક વખતે Hex સ્ટ્રિંગ લખવાની તુલનામાં, આ રીત વધુ સ્પષ્ટ છે અને પછીથી રંગોને એકસરખા રીતે બદલવાનું વધુ સુવિધાજનક બનાવે છે.

અંતમાં, આપણે `LinearGradient` શીખ્યું અને કસ્ટમ રંગોને જોડીને ગ્રેડિયન્ટ પૃષ્ઠભૂમિ બનાવી:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

આ પાઠ દ્વારા, આપણે “કસ્ટમ રંગો બનાવવાથી” લઈને “વાસ્તવિક ઇન્ટરફેસમાં રંગોનો ઉપયોગ કરવાની” પ્રક્રિયા પૂર્ણ કરી.

આગળ, જ્યારે કોઈ રંગને અનેક જગ્યાએ વારંવાર ઉપયોગ કરવાની જરૂર પડે, ત્યારે તેને પહેલાં `Color` extension માં ગોઠવવાનો વિચાર કરી શકાય.

આથી કોડ વધુ સ્પષ્ટ બનશે અને ઇન્ટરફેસની શૈલીને એકરૂપ બનાવવી વધુ સરળ બનશે.
