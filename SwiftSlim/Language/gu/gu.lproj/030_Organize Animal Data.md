# પ્રાણીઓના ડેટાને ગોઠવવું

પાછલા પાઠમાં, અમે એક સરળ પ્રાણી જ્ઞાનકોશનો ઉદાહરણ પૂર્ણ કર્યો હતો.

![view](../../../Resource/029_view.png)

જ્યારે વપરાશકર્તા કોઈ પ્રાણી પર ટેપ કરે છે, ત્યારે પેજ `Sheet` દ્વારા પ્રાણીની વિગત બતાવે છે.

પરંતુ, પાછલા પાઠના કોડમાં એક સમસ્યા છે: પ્રાણીનો ડેટા સીધો `ContentView` ની અંદર લખાયેલો છે.

ઉદાહરણ તરીકે:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // પ્રાણીઓની યાદી બતાવો
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

આ કોડ સામાન્ય રીતે ચાલી શકે છે, પરંતુ જ્યારે પ્રાણીઓનો ડેટા વધતો જાય છે, ત્યારે `ContentView` ખૂબ લાંબો બની જશે.

`ContentView` મૂળરૂપે મુખ્યત્વે ઇન્ટરફેસ બતાવવા માટે જવાબદાર હોવો જોઈએ, પરંતુ હવે તે ઘણો પ્રાણી ડેટા પણ સંગ્રહિત કરે છે. આ કોડ વાંચવામાં અસર કરે છે અને પછીના જાળવણીને પણ અસુવિધાજનક બનાવે છે.

તેથી, આ પાઠમાં આપણે એક કામ કરવાનું છે:

પ્રાણી ડેટાને `ContentView` માંથી બહાર ગોઠવવો.

## ડેટાને અલગ શા માટે કરવો?

SwiftUI માં, વ્યૂ કોડ સામાન્ય રીતે ઇન્ટરફેસ બતાવવા માટે જવાબદાર હોય છે.

ઉદાહરણ તરીકે:

```swift
Text("Dolphin")
Image("dolphin")
```

આ કોડ ઇન્ટરફેસ દર્શાવવાની કામગીરી સાથે સંબંધિત છે.

પરંતુ પ્રાણીનો ડેટા પોતે, જેમ કે પ્રાણીનું નામ, ચિત્રનું નામ, વિતરણ વિસ્તાર, વસવાટ સ્થાન અને વર્ણન લખાણ, ઇન્ટરફેસની રચના નથી.

તે વધુમાં નિશ્ચિત માહિતીના એક સમૂહ જેવું છે:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

જો ઇન્ટરફેસ કોડ અને ડેટા કોડ બધું એકસાથે લખવામાં આવે, તો કોડ વધુને વધુ ગૂંચવણભર્યો બનશે.

તેથી, આપણે પ્રાણી ડેટાને `Animal` પ્રકારમાં મૂકી શકીએ છીએ.

## નિશ્ચિત ડેટા સંગ્રહવા માટે static નો ઉપયોગ

પહેલા, ગોઠવેલી લખાણપદ્ધતિ જોઈએ:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

અહીં કોડની એક નવી લાઇન ઉમેરવામાં આવી છે:

```swift
static let animals: [Animal] = [
    
]
```

`static` નો અર્થ સ્થિર પ્રોપર્ટી છે.

સ્થિર પ્રોપર્ટી પ્રકાર પોતાનો ભાગ છે. તે કોઈ ચોક્કસ ઇન્સ્ટન્સનો ભાગ નથી.

આ વાક્ય થોડું અભિધાનાત્મક છે, તેથી આપણે તેને એક સરળ ઉદાહરણ દ્વારા સમજી શકીએ છીએ.

## સામાન્ય પ્રોપર્ટી અને સ્થિર પ્રોપર્ટી

ઉદાહરણ તરીકે, આપણે એક `Student` વ્યાખ્યાયિત કરીએ:

```swift
struct Student {
    let name: String
}
```

અહીં, `name` સામાન્ય પ્રોપર્ટી છે. સામાન્ય પ્રોપર્ટી કોઈ ચોક્કસ ઇન્સ્ટન્સનો ભાગ હોય છે.

જો આપણે `name` ઍક્સેસ કરવું હોય, તો પહેલા એક ચોક્કસ વિદ્યાર્થી બનાવવો પડશે:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

અહીં, `student` એક ઇન્સ્ટન્સ છે. હાલ માટે તમે તેને વિદ્યાર્થી ડેટાની એક ચોક્કસ નકલ તરીકે સમજી શકો છો.

કારણ કે દરેક વિદ્યાર્થીનું નામ અલગ હોઈ શકે છે, તેથી `name` ચોક્કસ વિદ્યાર્થી પર જ મૂકવું પડે છે.

પરંતુ, કેટલાક ડેટા કોઈ ચોક્કસ ઇન્સ્ટન્સના નથી હોતા.

ઉદાહરણ તરીકે, આપણે પ્રિવ્યૂ માટે નમૂના ડેટાનો એક સમૂહ તૈયાર કરવા માગીએ છીએ:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

અહીં, `previewStudents` ના આગળ `static` છે, તેથી તે સ્થિર પ્રોપર્ટી છે.

સ્થિર પ્રોપર્ટી કોઈ એક વિદ્યાર્થીની નથી. તે `Student` પ્રકાર પોતાનો ભાગ છે.

તેથી, આપણે પહેલા કોઈ વિદ્યાર્થી બનાવવાની જરૂર નથી. આપણે પ્રકારના નામ દ્વારા તેને સીધું ઍક્સેસ કરી શકીએ છીએ:

```swift
print(Student.previewStudents.count)    // 3
```

અહીં ઍક્સેસ કરવાની રીત છે:

```swift
TypeName.staticPropertyName
```

અર્થાત:

```swift
Student.previewStudents
```

એ જ રીતે, પ્રાણી જ્ઞાનકોશમાં, આપણે પ્રાણી ડેટાને આ રીતે ઍક્સેસ કરી શકીએ છીએ:

```swift
Animal.animals
```

## પાછા ContentView પર

હવે, પ્રાણી ડેટા `Animal` પ્રકારમાં સંગ્રહિત થઈ ગયો છે.

તેથી `ContentView` ની અંદર હવે ખૂબ લાંબી પ્રાણી એરે લખવાની જરૂર નથી.

અમે તેને આ રીતે બદલી શકીએ છીએ:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // પ્રાણીઓની યાદી બતાવો
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

કોડની આ લાઇનનો અર્થ છે:

```swift
let animals = Animal.animals
```

`Animal` પ્રકારમાંથી `animals` આ પ્રાણી ડેટા કાઢો, અને પછી તેને વર્તમાન વ્યૂના `animals` કૉન્સ્ટન્ટમાં સાચવો.

આ રીતે લખ્યા પછી, `ContentView` વધુ સંક્ષિપ્ત બને છે.

`ContentView` ઇન્ટરફેસ બતાવવા માટે જવાબદાર છે, અને `Animal.animals` પ્રાણી ડેટા પૂરો પાડવા માટે જવાબદાર છે.

## Animal ને અલગ ફાઇલમાં ખસેડવું

પાછલા પાઠમાં, ઉદાહરણને વધુ સરળતાથી સમજવા માટે, અમે `Animal` અને `ContentView` ને એક જ ફાઇલમાં લખ્યા હતા.

કારણ કે તે સમયે કોડ હજુ ઓછો હતો, તેથી આ રીતે લખવામાં કોઈ સમસ્યા નહોતી.

પરંતુ હવે પ્રાણી ડેટા વધતો જાય છે. જો આપણે બધા કોડને `ContentView.swift` ની અંદર જ મૂકતા રહીએ, તો ફાઇલ ખૂબ લાંબી બનશે અને વાંચવામાં પણ મુશ્કેલ બનશે.

તેથી, આપણે `Animal` ને નવી Swift ફાઇલમાં અલગથી મૂકી શકીએ છીએ.

Xcode માં, તમે નવી Swift ફાઇલ બનાવી શકો છો, ઉદાહરણ તરીકે:

```swift
Animal.swift
```

પછી `Animal` સ્ટ્રક્ટને આ ફાઇલમાં ખસેડો:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

આ રીતે ગોઠવ્યા પછી:

`ContentView.swift` ઇન્ટરફેસ બતાવવા માટે જવાબદાર છે.

`Animal.swift` પ્રાણી ડેટાની રચના વર્ણવવા માટે જવાબદાર છે.

ભલે તેઓ અલગ ફાઇલોમાં મૂકાયેલા હોય, પરંતુ જ્યાં સુધી તેઓ એક જ પ્રોજેક્ટમાં હોય, ત્યાં સુધી `ContentView` હજુ પણ `Animal` નો સીધો ઉપયોગ કરી શકે છે.

ઉદાહરણ તરીકે:

```swift
let animals = Animal.animals
```

અહીં `ContentView.swift` માં વધારાના રૂપે `Animal.swift` આયાત કરવાની જરૂર નથી.

Swift એક જ પ્રોજેક્ટમાં આવેલી Swift ફાઇલોને આપમેળે ઓળખી લે છે.

## કોડને આગળ ગોઠવવા માટે extension નો ઉપયોગ

હવે, અમે પ્રાણી ડેટાને `ContentView` માંથી `Animal` માં ખસેડી દીધો છે.

પરંતુ, `Animal` સ્ટ્રક્ટમાં હજુ પણ બે પ્રકારના કોડ સાથે-સાથે છે:

પહેલો પ્રકાર પ્રાણી મોડલની પોતાની પ્રોપર્ટીઓ છે:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

બીજો પ્રકાર નિશ્ચિત પ્રાણી ડેટા છે:

```swift
static let animals: [Animal] = [
    // ...
]
```

કોડની રચનાને વધુ સ્પષ્ટ બનાવવા માટે, આપણે `extension` નો ઉપયોગ કરીને આ બે ભાગોને અલગ કરી શકીએ છીએ.

`extension` નો અર્થ વિસ્તરણ છે.

તે મૂળ પ્રકારના આધારે નવા કોડને આગળ ઉમેરવાની છૂટ આપે છે.

ઉદાહરણ તરીકે:

```swift
extension Animal {
    
}
```

આનો અર્થ છે કે આપણે `Animal` પ્રકારને વિસ્તારી રહ્યા છીએ.

## પ્રાણી ડેટાને extension માં મૂકવું

અમે `Animal` ને આ રીતે બદલી શકીએ છીએ:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

આ રીતે ગોઠવ્યા પછી, કોડની રચના વધુ સ્પષ્ટ બને છે.

`struct Animal` એક પ્રાણી પાસે કઈ પ્રોપર્ટીઓ હોવી જોઈએ તે વર્ણવવા માટે જવાબદાર છે.

`extension Animal` નિશ્ચિત પ્રાણી ડેટાનો એક સમૂહ સંગ્રહવા માટે જવાબદાર છે.

ધ્યાન રાખો, ભલે `animals` ને `extension Animal` માં ખસેડવામાં આવ્યું હોય, પરંતુ તેનો ઉપયોગ કરવાની રીત બદલાતી નથી.

અમે હજુ પણ તેનો ઉપયોગ આ રીતે કરી શકીએ છીએ:

```swift
let animals = Animal.animals
```

આ `extension` ની પણ એક વિશેષતા છે: તે ફક્ત કોડ ગોઠવવામાં મદદ કરે છે, બહારથી કૉલ કરવાની રીતને બદલતું નથી.

## ડેટા વધુ હોય ત્યારે, ફરીથી AnimalData ફાઇલ બનાવી શકાય

હવે, અમે `Animal` ને અલગ `Animal.swift` ફાઇલમાં મૂકી દીધો છે.

જો પ્રાણી ડેટા ઓછો હોય, તો તમે `extension Animal` ને સીધું `Animal.swift` માં લખી શકો છો.

પરંતુ, જો પ્રાણી ડેટા વધુ અને વધુ થાય, તો તમે બીજી ફાઇલ પણ બનાવી શકો છો, ઉદાહરણ તરીકે:

```swift
AnimalData.swift
```

પછી નિશ્ચિત પ્રાણી ડેટાને તેમાં મૂકો:

```swift
extension Animal {
    static let animals: [Animal] = [
        // પ્રાણી ડેટા
    ]
}
```

આ કર્યા પછી, કોડની જવાબદારીઓ વધુ સ્પષ્ટ બને છે:

`Animal.swift` માત્ર પ્રાણી મોડલ વ્યાખ્યાયિત કરવા માટે જવાબદાર છે.

`AnimalData.swift` માત્ર પ્રાણી ડેટા સંગ્રહવા માટે જવાબદાર છે.

`ContentView.swift` માત્ર ઇન્ટરફેસ બતાવવા માટે જવાબદાર છે.

દરેક ફાઇલની જવાબદારી વધુ સ્પષ્ટ છે.

ધ્યાન રાખો, `AnimalData.swift` ફક્ત ફાઇલનું નામ છે, નવી Swift ટાઇપ નથી. આ ફાઇલની અંદર હજુ પણ `extension Animal` દ્વારા `Animal` માં નિશ્ચિત ડેટા ઉમેરવામાં આવે છે.

## પૂર્ણ કોડ

નીચે ગોઠવાયેલ `Animal.swift` કોડ છે:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

ગોઠવાયેલ `AnimalData.swift` કોડ:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

`ContentView.swift` માં, તમે આ રીતે ઉપયોગ કરી શકો છો:

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
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

સૂચન: `Animal.swift` અને `AnimalData.swift` ફાઇલોમાં, પહેલી લાઇન લખેલી છે:

```swift
import Foundation
```

પહેલાં, જ્યારે અમે SwiftUI ઇન્ટરફેસ લખતા હતા, ત્યારે ઘણી વાર ઉપયોગ કરતા હતા:

```swift
import SwiftUI
```

કારણ કે `ContentView`, `Text`, `Button`, `Color` આ બધું ઇન્ટરફેસ સાથે સંબંધિત છે, તેથી ઇન્ટરફેસ ફાઇલ લખતી વખતે સામાન્ય રીતે SwiftUI આયાત કરવાની જરૂર પડે છે.

પરંતુ અહીં `Animal.swift` અને `AnimalData.swift` ઇન્ટરફેસ ફાઇલો નથી. તે મુખ્યત્વે પ્રાણી મોડલ વ્યાખ્યાયિત કરવા અને પ્રાણી ડેટા સંગ્રહવા માટે વપરાય છે.

આ કોડમાં, `UUID()` ને `Foundation` ની જરૂર છે, તેથી `Foundation` આયાત કરવું પૂરતું છે.

## સારાંશ

આ પાઠમાં, અમે મુખ્યત્વે એક કામ કર્યું: પ્રાણી ડેટાને `ContentView` માંથી બહાર ગોઠવ્યો.

મૂળ લખાણપદ્ધતિમાં પ્રાણી ડેટા સીધો `ContentView` ની અંદર લખાતો હતો. આ કોડ ચાલી શકે છે, પરંતુ જ્યારે ડેટા વધે છે, ત્યારે વ્યૂ ફાઇલ વધુને વધુ લાંબી બને છે.

ગોઠવ્યા પછી, `ContentView` માત્ર ઇન્ટરફેસ બતાવવા માટે જવાબદાર છે, અને `Animal.animals` પ્રાણી ડેટા પૂરો પાડવા માટે જવાબદાર છે.

આ પાઠમાં બે નવા જ્ઞાનબિંદુઓ પણ શીખ્યા.

પહેલું `static` છે.

`static` નો અર્થ સ્થિર પ્રોપર્ટી છે. સ્થિર પ્રોપર્ટી પ્રકાર પોતાનો ભાગ હોય છે, અને “TypeName.propertyName” પદ્ધતિથી સીધી ઍક્સેસ કરી શકાય છે.

ઉદાહરણ તરીકે:

```swift
Animal.animals
```

બીજું `extension` છે.

`extension` નો અર્થ વિસ્તરણ છે. તે એક જ પ્રકારના કોડને અલગ ભાગોમાં લખી શકે છે, જેથી કોડની રચના વધુ સ્પષ્ટ બને છે.

આ ઉદાહરણમાં, અમે પ્રાણી ડેટા સંગ્રહવા માટે `extension Animal` નો ઉપયોગ કરીએ છીએ, જેથી `Animal` સ્ટ્રક્ટ પોતે વધુ સંક્ષિપ્ત બને છે.

આ ઉપરાંત, `Animal` મુખ્યત્વે ડેટા મોડલ સંગ્રહે છે અને સીધો SwiftUI ઇન્ટરફેસ લખતો નથી, તેથી અહીં `import Foundation` નો ઉપયોગ થાય છે.

આ પાઠનો મુખ્ય મુદ્દો કોડને વધુ જટિલ બનાવવાનો નથી, પરંતુ કોડને વાંચવા અને જાળવવા માટે વધુ સરળ બનાવવાનો છે.
