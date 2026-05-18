# జంతు డేటాను క్రమబద్ధీకరించడం

గత పాఠంలో, మనం ఒక సాధారణ జంతు విజ్ఞాన ఉదాహరణను పూర్తి చేశాం.

![view](../../../Resource/029_view.png)

వినియోగదారు ఏదైనా జంతువుపై క్లిక్ చేసినప్పుడు, పేజీ `Sheet` ద్వారా జంతు వివరాలను పాప్ అప్‌గా చూపిస్తుంది.

అయితే, గత పాఠంలోని కోడ్‌లో ఒక సమస్య ఉంది: జంతు డేటా నేరుగా `ContentView` లోనే వ్రాయబడింది.

ఉదాహరణకు:

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
            // జంతువుల జాబితాను చూపించు
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ఈ కోడ్ సరిగ్గా నడుస్తుంది. కానీ జంతు డేటా పెరుగుతున్నప్పుడు, `ContentView` చాలా పొడవుగా మారుతుంది.

`ContentView` ప్రధానంగా ఇంటర్‌ఫేస్‌ను చూపించే బాధ్యత వహించాలి. కానీ ఇప్పుడు అది పెద్ద మొత్తంలో జంతు డేటాను కూడా నిల్వ చేస్తోంది. ఇది కోడ్ చదవడాన్ని ప్రభావితం చేస్తుంది, తరువాత నిర్వహణను కూడా అసౌకర్యంగా చేస్తుంది.

అందువల్ల, ఈ పాఠంలో మనం ఒక పని చేయాలి:

జంతు డేటాను `ContentView` నుండి బయటకు తీసి క్రమబద్ధీకరించడం.

## డేటాను ఎందుకు వేరు చేయాలి?

SwiftUI లో, వ్యూ కోడ్ సాధారణంగా ఇంటర్‌ఫేస్‌ను చూపించడానికి బాధ్యత వహిస్తుంది.

ఉదాహరణకు:

```swift
Text("Dolphin")
Image("dolphin")
```

ఈ కోడ్ అంతా ఇంటర్‌ఫేస్ ప్రదర్శనకు సంబంధించినది.

కానీ జంతు డేటా తానే, ఉదాహరణకు జంతువు పేరు, చిత్రం పేరు, విస్తరణ ప్రాంతం, నివాస స్థలం, వివరణ వచనం వంటివి ఇంటర్‌ఫేస్ నిర్మాణం కావు.

అవి ఒక స్థిరమైన సమాచార సమూహంలా ఉంటాయి:

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

ఇంటర్‌ఫేస్ కోడ్ మరియు డేటా కోడ్ అన్నింటినీ కలిపి వ్రాస్తే, కోడ్ మరింత గందరగోళంగా మారుతుంది.

కాబట్టి, మనం జంతు డేటాను `Animal` రకం లో ఉంచవచ్చు.

## static ఉపయోగించి స్థిర డేటాను నిల్వ చేయడం

ముందుగా క్రమబద్ధీకరించిన తర్వాతి వ్రాత విధానాన్ని చూద్దాం:

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

ఇక్కడ కొత్తగా ఒక పంక్తి కోడ్ చేరింది:

```swift
static let animals: [Animal] = [
    
]
```

`static` అంటే స్థిర గుణం.

స్థిర గుణం రకం తనదే, అది ఏదైనా ఒక నిర్దిష్ట ఇన్‌స్టాన్స్‌కు చెందదు.

ఈ వాక్యం కొంత అమూర్తంగా ఉంటుంది. మనం ఒక సరళమైన ఉదాహరణ ద్వారా అర్థం చేసుకోవచ్చు.

## సాధారణ గుణాలు మరియు స్థిర గుణాలు

ఉదాహరణకు, మనం ఒక `Student` ను నిర్వచిస్తాం:

```swift
struct Student {
    let name: String
}
```

ఇక్కడి `name` ఒక సాధారణ గుణం. సాధారణ గుణం ఒక నిర్దిష్ట ఇన్‌స్టాన్స్‌కు చెందుతుంది.

మనం `name` ను యాక్సెస్ చేయాలంటే, ముందుగా ఒక నిర్దిష్ట విద్యార్థిని సృష్టించాలి:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

ఇక్కడ `student` ఒక ఇన్‌స్టాన్స్. దీన్ని తాత్కాలికంగా ఒక నిర్దిష్ట విద్యార్థి డేటాగా అర్థం చేసుకోవచ్చు.

ఎందుకంటే ప్రతి విద్యార్థి పేరు వేరుగా ఉండవచ్చు, అందుకే `name` తప్పనిసరిగా ఒక నిర్దిష్ట విద్యార్థి దగ్గర ఉండాలి.

కానీ కొన్ని డేటా ఏదైనా ఒక నిర్దిష్ట ఇన్‌స్టాన్స్‌కు చెందదు.

ఉదాహరణకు, మనం ప్రివ్యూ కోసం ఉపయోగించగల ఒక ఉదాహరణ డేటా సమూహాన్ని సిద్ధం చేయాలనుకుంటున్నాం:

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

ఇక్కడ `previewStudents` ముందు `static` ఉంది, కాబట్టి అది స్థిర గుణం.

స్థిర గుణం ఏదైనా ఒక విద్యార్థికి చెందదు. అది `Student` అనే రకం తనదే.

కాబట్టి, మనం ముందుగా ఒక విద్యార్థిని సృష్టించాల్సిన అవసరం లేదు. రకం పేరుతోనే నేరుగా యాక్సెస్ చేయవచ్చు:

```swift
print(Student.previewStudents.count)    // 3
```

ఇక్కడ యాక్సెస్ విధానం:

```swift
రకం పేరు.స్థిర గుణం పేరు
```

అంటే:

```swift
Student.previewStudents
```

అదే విధంగా, జంతు విజ్ఞాన ఉదాహరణలో, మనం జంతు డేటాను ఇలా యాక్సెస్ చేయవచ్చు:

```swift
Animal.animals
```

## మళ్లీ ContentView వద్దకు

ఇప్పుడు, జంతు డేటా ఇప్పటికే `Animal` రకం లో నిల్వ చేయబడింది.

కాబట్టి `ContentView` లో ఇక చాలా పొడవైన జంతు అర్రే వ్రాయాల్సిన అవసరం లేదు.

మనం ఇలా మార్చవచ్చు:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // జంతువుల జాబితాను చూపించు
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ఈ పంక్తి కోడ్ అర్థం:

```swift
let animals = Animal.animals
```

`Animal` రకం నుండి `animals` అనే జంతు డేటా సమూహాన్ని తీసి, ప్రస్తుత వ్యూ యొక్క `animals` కాన్స్టెంట్‌లో నిల్వ చేయడం.

ఇలా వ్రాసిన తర్వాత, `ContentView` మరింత సరళంగా మారుతుంది.

`ContentView` ఇంటర్‌ఫేస్‌ను చూపించే బాధ్యత వహిస్తుంది, `Animal.animals` జంతు డేటాను అందించే బాధ్యత వహిస్తుంది.

## Animal ను వేరే ఫైల్‌లోకి విడదీయడం

గత పాఠంలో, ఉదాహరణను సులభంగా అర్థం చేసుకోవడానికి, మనం `Animal` మరియు `ContentView` ను ఒకే ఫైల్‌లో వ్రాశాం.

అప్పుడు కోడ్ ఇంకా తక్కువగా ఉండటంతో, అలా వ్రాయడంలో సమస్య లేదు.

కానీ ఇప్పుడు జంతు డేటా పెరుగుతోంది. అన్ని కోడ్‌ను `ContentView.swift` లోనే కొనసాగిస్తే, ఫైల్ చాలా పొడవుగా మారుతుంది, చదవడానికీ అసౌకర్యంగా ఉంటుంది.

కాబట్టి, మనం `Animal` ను విడిగా ఒక కొత్త Swift ఫైల్‌లో ఉంచవచ్చు.

Xcode లో, ఒక కొత్త Swift ఫైల్‌ను సృష్టించవచ్చు, ఉదాహరణకు:

```swift
Animal.swift
```

తర్వాత `Animal` స్ట్రక్చర్‌ను ఈ ఫైల్‌కు తరలించండి:

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

ఇలా క్రమబద్ధీకరించిన తర్వాత:

`ContentView.swift` ఇంటర్‌ఫేస్‌ను చూపించే బాధ్యత వహిస్తుంది.

`Animal.swift` జంతు డేటా నిర్మాణాన్ని వివరించే బాధ్యత వహిస్తుంది.

అవి వేర్వేరు ఫైళ్లలో ఉన్నా, ఒకే ప్రాజెక్ట్‌లో ఉన్నంత వరకు, `ContentView` ఇంకా నేరుగా `Animal` ను ఉపయోగించవచ్చు.

ఉదాహరణకు:

```swift
let animals = Animal.animals
```

ఇక్కడ `ContentView.swift` లో అదనంగా `Animal.swift` ను దిగుమతి చేయాల్సిన అవసరం లేదు.

Swift ఒకే ప్రాజెక్ట్‌లోని Swift ఫైళ్లను స్వయంగా గుర్తిస్తుంది.

## extension ఉపయోగించి కోడ్‌ను మరింత క్రమబద్ధీకరించడం

ఇప్పుడు, మనం జంతు డేటాను `ContentView` నుండి `Animal` లోకి తరలించాము.

అయితే, `Animal` స్ట్రక్చర్‌లో ఇంకా రెండు రకాల కోడ్ ఒకేసారి ఉన్నాయి:

మొదటి రకం జంతు మోడల్‌కు చెందిన గుణాలు:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

రెండవ రకం స్థిరమైన జంతు డేటా:

```swift
static let animals: [Animal] = [
    // ...
]
```

కోడ్ నిర్మాణాన్ని మరింత స్పష్టంగా చేయడానికి, మనం `extension` ఉపయోగించి ఈ రెండు భాగాలను వేరు చేయవచ్చు.

`extension` అంటే విస్తరణ.

ఇది ఇప్పటికే ఉన్న రకం ఆధారంగా కొత్త కోడ్‌ను కొనసాగించి జోడించగలదు.

ఉదాహరణకు:

```swift
extension Animal {
    
}
```

దీని అర్థం మనం `Animal` అనే రకాన్ని విస్తరిస్తున్నాం.

## జంతు డేటాను extension లో ఉంచడం

మనం `Animal` ను ఇలా మార్చవచ్చు:

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

ఇలా క్రమబద్ధీకరించిన తర్వాత, కోడ్ నిర్మాణం మరింత స్పష్టంగా ఉంటుంది.

`struct Animal` ఒక జంతువుకు ఏ గుణాలు ఉండాలో వివరించే బాధ్యత వహిస్తుంది.

`extension Animal` స్థిరమైన జంతు డేటా సమూహాన్ని నిల్వ చేసే బాధ్యత వహిస్తుంది.

గమనించండి, `animals` ను `extension Animal` లోకి తరలించినప్పటికీ, ఉపయోగించే విధానం మారదు.

మనం ఇంకా ఇలా ఉపయోగించవచ్చు:

```swift
let animals = Animal.animals
```

ఇదీ `extension` యొక్క ఒక లక్షణం: ఇది కోడ్‌ను క్రమబద్ధీకరించడానికి మాత్రమే సహాయపడుతుంది, బయట ఉపయోగించే పద్ధతిని మార్చదు.

## డేటా ఎక్కువగా ఉన్నప్పుడు, AnimalData ఫైల్‌ను మళ్లీ కొత్తగా సృష్టించవచ్చు

ఇప్పుడు, మనం `Animal` ను విడిగా `Animal.swift` ఫైల్‌లో ఉంచాము.

జంతు డేటా తక్కువగా ఉంటే, `extension Animal` ను కూడా నేరుగా `Animal.swift` లో వ్రాయవచ్చు.

కానీ జంతు డేటా మరింత పెరుగుతున్నట్లయితే, మరో కొత్త ఫైల్‌ను సృష్టించవచ్చు, ఉదాహరణకు:

```swift
AnimalData.swift
```

తర్వాత స్థిరమైన జంతు డేటాను అందులో ఉంచండి:

```swift
extension Animal {
    static let animals: [Animal] = [
        // జంతు డేటా
    ]
}
```

ఇలా చేసిన తర్వాత, కోడ్ బాధ్యతల విభజన మరింత స్పష్టంగా ఉంటుంది:

`Animal.swift` జంతు మోడల్‌ను నిర్వచించే బాధ్యత మాత్రమే వహిస్తుంది.

`AnimalData.swift` జంతు డేటాను నిల్వ చేసే బాధ్యత మాత్రమే వహిస్తుంది.

`ContentView.swift` ఇంటర్‌ఫేస్‌ను చూపించే బాధ్యత మాత్రమే వహిస్తుంది.

ప్రతి ఫైల్ బాధ్యత మరింత స్పష్టంగా ఉంటుంది.

గమనించండి, `AnimalData.swift` కేవలం ఫైల్ పేరు మాత్రమే, ఇది కొత్త Swift రకం కాదు. ఈ ఫైల్‌లో ఇంకా `extension Animal` ద్వారా `Animal` కు స్థిర డేటాను జోడిస్తున్నాం.

## పూర్తి కోడ్

కింద క్రమబద్ధీకరించిన `Animal.swift` కోడ్ ఉంది:

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

క్రమబద్ధీకరించిన `AnimalData.swift` కోడ్:

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

`ContentView.swift` లో, ఇలా ఉపయోగించవచ్చు:

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

సూచన: `Animal.swift` మరియు `AnimalData.swift` ఫైళ్లలో, మొదటి పంక్తిలో రెండింటిలోనూ ఇలా వ్రాయబడింది:

```swift
import Foundation
```

ముందు మనం SwiftUI ఇంటర్‌ఫేస్ వ్రాసేటప్పుడు, తరచుగా ఇలా ఉపయోగించాము:

```swift
import SwiftUI
```

ఎందుకంటే `ContentView`, `Text`, `Button`, `Color` ఇవన్నీ ఇంటర్‌ఫేస్‌కు సంబంధించినవి. అందువల్ల ఇంటర్‌ఫేస్ ఫైల్ వ్రాసేటప్పుడు సాధారణంగా SwiftUI దిగుమతి చేయాలి.

కానీ ఇక్కడి `Animal.swift` మరియు `AnimalData.swift` రెండూ ఇంటర్‌ఫేస్ ఫైళ్లు కావు. అవి ప్రధానంగా జంతు మోడల్‌ను నిర్వచించడానికి మరియు జంతు డేటాను నిల్వ చేయడానికి ఉపయోగించబడతాయి.

ఈ కోడ్‌లో, `UUID()` ఉపయోగించడానికి `Foundation` అవసరం. కాబట్టి `Foundation` దిగుమతి చేస్తే సరిపోతుంది.

## సారాంశం

ఈ పాఠంలో మనం ప్రధానంగా ఒక పని చేశాం: జంతు డేటాను `ContentView` నుండి బయటకు తీసి క్రమబద్ధీకరించాం.

మునుపటి వ్రాత విధానం జంతు డేటాను నేరుగా `ContentView` లో వ్రాయడం. అలా కోడ్ నడుస్తుంది, కానీ డేటా పెరిగినప్పుడు, వ్యూ ఫైల్ మరింత పొడవుగా మారుతుంది.

క్రమబద్ధీకరించిన తర్వాత, `ContentView` ఇంటర్‌ఫేస్‌ను చూపించే బాధ్యత మాత్రమే వహిస్తుంది, `Animal.animals` జంతు డేటాను అందించే బాధ్యత వహిస్తుంది.

ఈ పాఠంలో ఇంకో రెండు కొత్త విషయాలు కూడా నేర్చుకున్నాం.

మొదటిది `static`.

`static` అంటే స్థిర గుణం. స్థిర గుణం రకం తనదే. “రకం పేరు.గుణం పేరు” విధానంతో నేరుగా యాక్సెస్ చేయవచ్చు.

ఉదాహరణకు:

```swift
Animal.animals
```

రెండవది `extension`.

`extension` అంటే విస్తరణ. ఇది ఒకే రకానికి చెందిన కోడ్‌ను విడిగా వ్రాయడానికి సహాయపడుతుంది, తద్వారా కోడ్ నిర్మాణం మరింత స్పష్టంగా ఉంటుంది.

ఈ ఉదాహరణలో, మనం `extension Animal` ఉపయోగించి జంతు డేటాను నిల్వ చేశాం, తద్వారా `Animal` స్ట్రక్చర్ తానే మరింత సరళంగా మారింది.

అదనంగా, `Animal` ప్రధానంగా డేటా మోడల్‌ను నిల్వ చేస్తుంది, SwiftUI ఇంటర్‌ఫేస్‌ను నేరుగా వ్రాయదు. కాబట్టి ఇక్కడ ఉపయోగించేది `import Foundation`.

ఈ పాఠం యొక్క ప్రధాన ఉద్దేశ్యం కోడ్‌ను మరింత క్లిష్టంగా చేయడం కాదు, కోడ్‌ను చదవడానికి మరియు నిర్వహించడానికి సులభంగా చేయడం.
