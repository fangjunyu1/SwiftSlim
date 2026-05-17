# விலங்கு தரவை ஒழுங்குபடுத்துதல்

முந்தைய பாடத்தில், எளிய விலங்கு கலைக்களஞ்சிய உதாரணத்தை முடித்தோம்.

![view](../../../Resource/029_view.png)

பயனர் ஒரு விலங்கைத் தட்டும்போது, பக்கம் `Sheet` மூலம் விலங்கு விவரத்தை பாப் அப் ஆகக் காட்டும்.

ஆனால், முந்தைய பாடத்தின் குறியீட்டில் ஒரு பிரச்சினை உள்ளது: விலங்கு தரவு நேரடியாக `ContentView` உள்ளே எழுதப்பட்டுள்ளது.

உதாரணமாக:

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
            // விலங்கு பட்டியலைக் காண்பிக்கவும்
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

இந்தக் குறியீடு சரியாக இயங்கும். ஆனால் விலங்கு தரவு மேலும் மேலும் அதிகரிக்கும்போது, `ContentView` மிகவும் நீளமாகிவிடும்.

`ContentView` முதன்மையாக இடைமுகத்தைக் காண்பிப்பதற்கே பொறுப்பாக இருக்க வேண்டும். ஆனால் இப்போது அது அதிகமான விலங்கு தரவையும் சேமிக்கிறது. இது குறியீட்டை வாசிப்பதையும், பின்னர் பராமரிப்பதையும் கடினமாக்கும்.

எனவே, இந்தப் பாடத்தில் நாம் செய்யப் போவது ஒன்று:

விலங்கு தரவை `ContentView` இலிருந்து வெளியே பிரித்து ஒழுங்குபடுத்துவது.

## ஏன் தரவைப் பிரிக்க வேண்டும்?

SwiftUI-யில், View குறியீடு பொதுவாக இடைமுகத்தைக் காண்பிப்பதற்குப் பொறுப்பாக இருக்கும்.

உதாரணமாக:

```swift
Text("Dolphin")
Image("dolphin")
```

இந்தக் குறியீடுகள் அனைத்தும் இடைமுகக் காட்சியுடன் தொடர்புடையவை.

ஆனால் விலங்கு தரவு தானாகவே, எடுத்துக்காட்டாக விலங்கு பெயர், படம் பெயர், பரவல் பகுதி, வாழிடம், விளக்க உரை ஆகியவை இடைமுக அமைப்பு அல்ல.

அவை நிலையான தகவல்களின் ஒரு தொகுப்பைப் போன்றவை:

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

இடைமுகக் குறியீடும் தரவு குறியீடும் அனைத்தையும் ஒன்றாக எழுதினால், குறியீடு மேலும் மேலும் குழப்பமாகிவிடும்.

ஆகவே, விலங்கு தரவை `Animal` வகைக்குள் வைக்கலாம்.

## static பயன்படுத்தி நிலையான தரவைச் சேமித்தல்

முதலில் ஒழுங்குபடுத்திய பிறகான எழுதும் முறையைப் பார்ப்போம்:

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

இங்கே ஒரு புதிய குறியீட்டு வரி சேர்க்கப்பட்டுள்ளது:

```swift
static let animals: [Animal] = [
    
]
```

`static` என்பது நிலையான பண்பைக் குறிக்கிறது.

நிலையான பண்பு வகை தன்னுடையது; அது ஒரு குறிப்பிட்ட instance-இன் பண்பு அல்ல.

இந்த வாக்கியம் சற்றுக் கருத்துப்பூர்வமாகத் தோன்றலாம். அதை ஒரு எளிய உதாரணத்தின் மூலம் புரிந்துகொள்ளலாம்.

## சாதாரண பண்புகள் மற்றும் நிலையான பண்புகள்

உதாரணமாக, நாம் ஒரு `Student`-ஐ வரையறுக்கிறோம்:

```swift
struct Student {
    let name: String
}
```

இங்கே உள்ள `name` என்பது சாதாரண பண்பு. சாதாரண பண்பு ஒரு குறிப்பிட்ட instance-க்கு சொந்தமானது.

நாம் `name`-ஐ அணுக விரும்பினால், முதலில் ஒரு குறிப்பிட்ட மாணவரை உருவாக்க வேண்டும்:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

இங்கே `student` என்பது ஒரு instance. அதை முதலில் ஒரு குறிப்பிட்ட மாணவர் தரவாகவும் புரிந்துகொள்ளலாம்.

ஒவ்வொரு மாணவரின் பெயரும் மாறுபடலாம் என்பதால், `name` குறிப்பிட்ட மாணவர் instance-இல் இருக்க வேண்டும்.

ஆனால் சில தரவு ஒரு குறிப்பிட்ட instance-க்கு சொந்தமானதல்ல.

உதாரணமாக, preview செய்யக்கூடிய ஒரு எடுத்துக்காட்டு தரவுத் தொகுப்பைத் தயாரிக்க விரும்புகிறோம்:

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

இங்கே `previewStudents`-க்கு முன் `static` உள்ளது. எனவே அது ஒரு நிலையான பண்பு.

நிலையான பண்பு ஒரு குறிப்பிட்ட மாணவருக்குச் சொந்தமானதல்ல; அது `Student` என்ற வகை தன்னுடையது.

எனவே, முதலில் ஒரு குறிப்பிட்ட மாணவரை உருவாக்காமல், நேரடியாக வகைப் பெயர் மூலம் அணுகலாம்:

```swift
print(Student.previewStudents.count)    // 3
```

இங்கே அணுகும் முறை:

```swift
வகைப் பெயர்.நிலையான பண்புப் பெயர்
```

அதாவது:

```swift
Student.previewStudents
```

அதேபோல், விலங்கு கலைக்களஞ்சியத்தில் நாம் விலங்கு தரவை இவ்வாறு அணுகலாம்:

```swift
Animal.animals
```

## ContentView-க்கு திரும்புவது

இப்போது விலங்கு தரவு `Animal` வகைக்குள் சேமிக்கப்பட்டுள்ளது.

எனவே `ContentView` உள்ளே நீண்ட விலங்கு array-ஐ மீண்டும் எழுத வேண்டியதில்லை.

நாம் இதை இவ்வாறு மாற்றலாம்:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // விலங்கு பட்டியலைக் காண்பிக்கவும்
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

இந்த குறியீட்டு வரியின் பொருள்:

```swift
let animals = Animal.animals
```

`Animal` வகையிலிருந்து `animals` என்ற விலங்கு தரவுத் தொகுப்பை எடுத்துக்கொண்டு, அதை தற்போதைய View-வின் `animals` constant-இல் சேமிக்கிறது.

இவ்வாறு எழுதிய பிறகு, `ContentView` மேலும் சுருக்கமாக இருக்கும்.

`ContentView` இடைமுகத்தைக் காண்பிப்பதற்குப் பொறுப்பு; `Animal.animals` விலங்கு தரவை வழங்குவதற்குப் பொறுப்பு.

## Animal-ஐ தனி கோப்பாகப் பிரித்தல்

முந்தைய பாடத்தில், உதாரணத்தை எளிதாகப் புரிந்துகொள்ள, `Animal` மற்றும் `ContentView` ஆகியவற்றை ஒரே கோப்பில் எழுதினோம்.

அப்போது குறியீடு இன்னும் குறைவாக இருந்ததால், அப்படி எழுதுவது பிரச்சினையில்லை.

ஆனால் இப்போது விலங்கு தரவு அதிகரித்து வருகிறது. தொடர்ந்து அனைத்து குறியீட்டையும் `ContentView.swift` உள்ளே எழுதினால், கோப்பு மிகவும் நீளமாகிவிடும்; வாசிப்பதும் சிரமமாகும்.

எனவே, `Animal`-ஐ தனியாக ஒரு புதிய Swift கோப்பில் வைக்கலாம்.

Xcode-இல், எடுத்துக்காட்டாக ஒரு புதிய Swift கோப்பை உருவாக்கலாம்:

```swift
Animal.swift
```

பின்னர் `Animal` structure-ஐ இந்த கோப்பிற்கு நகர்த்தலாம்:

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

இவ்வாறு ஒழுங்குபடுத்திய பிறகு:

`ContentView.swift` இடைமுகத்தைக் காண்பிப்பதற்குப் பொறுப்பு.

`Animal.swift` விலங்கு தரவின் அமைப்பை விவரிப்பதற்குப் பொறுப்பு.

அவை வெவ்வேறு கோப்புகளில் இருந்தாலும், ஒரே project-இல் இருக்கும் வரை, `ContentView` இன்னும் `Animal`-ஐ நேரடியாகப் பயன்படுத்தலாம்.

உதாரணமாக:

```swift
let animals = Animal.animals
```

இங்கே `ContentView.swift`-இல் கூடுதலாக `Animal.swift`-ஐ import செய்ய தேவையில்லை.

Swift ஒரே project-இல் உள்ள Swift கோப்புகளை தானாக அடையாளம் காணும்.

## extension பயன்படுத்தி குறியீட்டை தொடர்ந்து ஒழுங்குபடுத்துதல்

இப்போது விலங்கு தரவை `ContentView`-இலிருந்து `Animal`-க்குள் நகர்த்தியுள்ளோம்.

ஆனால் `Animal` structure-இல் இன்னும் இரண்டு வகை குறியீடுகள் ஒன்றாக உள்ளன:

முதல் வகை விலங்கு model-இன் சொந்த பண்புகள்:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

இரண்டாவது வகை நிலையான விலங்கு தரவு:

```swift
static let animals: [Animal] = [
    // ...
]
```

குறியீட்டு அமைப்பை மேலும் தெளிவாக்க, இந்த இரண்டு பகுதிகளையும் `extension` பயன்படுத்தி பிரிக்கலாம்.

`extension` என்பதன் பொருள் விரிவாக்கம்.

இது ஏற்கனவே உள்ள வகையின் அடிப்படையில் புதிய குறியீட்டைத் தொடர்ந்து சேர்க்க உதவும்.

உதாரணமாக:

```swift
extension Animal {
    
}
```

இதன் பொருள் நாம் `Animal` என்ற வகையை விரிவாக்கிக் கொண்டிருக்கிறோம்.

## விலங்கு தரவை extension-க்குள் வைப்பது

நாம் `Animal`-ஐ இவ்வாறு மாற்றலாம்:

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

இவ்வாறு ஒழுங்குபடுத்திய பிறகு, குறியீட்டு அமைப்பு மேலும் தெளிவாக இருக்கும்.

`struct Animal` ஒரு விலங்கிற்கு எந்த பண்புகள் இருக்க வேண்டும் என்பதை விவரிப்பதற்குப் பொறுப்பு.

`extension Animal` ஒரு நிலையான விலங்கு தரவுத் தொகுப்பைச் சேமிப்பதற்குப் பொறுப்பு.

கவனிக்கவும்: `animals` `extension Animal`-க்குள் நகர்த்தப்பட்டாலும், பயன்படுத்தும் முறை மாறாது.

நாம் இன்னும் இவ்வாறு பயன்படுத்தலாம்:

```swift
let animals = Animal.animals
```

இதுவும் `extension`-இன் ஒரு சிறப்பு: அது குறியீட்டை ஒழுங்குபடுத்த உதவுகிறது; வெளிப்புற அழைக்கும் முறையை மாற்றாது.

## தரவு அதிகமாக இருக்கும் போது, மீண்டும் AnimalData கோப்பை உருவாக்கலாம்

இப்போது நாம் `Animal`-ஐ தனி `Animal.swift` கோப்பில் வைத்துள்ளோம்.

விலங்கு தரவு குறைவாக இருந்தால், `extension Animal`-ஐயும் நேரடியாக `Animal.swift`-இல் எழுதலாம்.

ஆனால் விலங்கு தரவு மேலும் மேலும் அதிகரித்தால், எடுத்துக்காட்டாக மீண்டும் ஒரு புதிய கோப்பை உருவாக்கலாம்:

```swift
AnimalData.swift
```

பின்னர் நிலையான விலங்கு தரவை அதில் வைக்கலாம்:

```swift
extension Animal {
    static let animals: [Animal] = [
        // விலங்கு தரவு
    ]
}
```

இவ்வாறு செய்த பிறகு, குறியீட்டின் பொறுப்புப் பிரிவு மேலும் தெளிவாகும்:

`Animal.swift` விலங்கு model-ஐ வரையறுப்பதற்கே பொறுப்பு.

`AnimalData.swift` விலங்கு தரவைச் சேமிப்பதற்கே பொறுப்பு.

`ContentView.swift` இடைமுகத்தைக் காண்பிப்பதற்கே பொறுப்பு.

ஒவ்வொரு கோப்பின் பொறுப்பும் மேலும் தெளிவாக இருக்கும்.

கவனிக்கவும்: `AnimalData.swift` என்பது ஒரு கோப்பு பெயர் மட்டுமே; அது புதிய Swift வகை அல்ல. இந்த கோப்பில் இன்னும் `extension Animal` மூலம் `Animal`-க்கு நிலையான தரவு சேர்க்கப்படுகிறது.

## முழு குறியீடு

கீழே ஒழுங்குபடுத்திய பிறகான `Animal.swift` குறியீடு:

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

ஒழுங்குபடுத்திய பிறகான `AnimalData.swift` குறியீடு:

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

`ContentView.swift`-இல், இவ்வாறு பயன்படுத்தலாம்:

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
                            .clipShape(Circle())
                        
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

குறிப்பு: `Animal.swift` மற்றும் `AnimalData.swift` கோப்புகளில், முதல் வரியில் இரண்டிலும் இது எழுதப்பட்டுள்ளது:

```swift
import Foundation
```

முன்பு SwiftUI இடைமுகம் எழுதும்போது, நாம் அடிக்கடி இதைப் பயன்படுத்தினோம்:

```swift
import SwiftUI
```

இதற்கு காரணம், `ContentView`, `Text`, `Button`, `Color` போன்றவை அனைத்தும் இடைமுகத்துடன் தொடர்புடையவை. எனவே இடைமுகக் கோப்புகளை எழுதும்போது பொதுவாக SwiftUI-ஐ import செய்ய வேண்டும்.

ஆனால் இங்கே உள்ள `Animal.swift` மற்றும் `AnimalData.swift` இரண்டும் இடைமுகக் கோப்புகள் அல்ல. அவை முதன்மையாக விலங்கு model-ஐ வரையறுக்கவும், விலங்கு தரவைச் சேமிக்கவும் பயன்படுத்தப்படுகின்றன.

இந்தக் குறியீட்டில், `UUID()`-ஐப் பயன்படுத்த `Foundation` தேவை. எனவே `Foundation`-ஐ import செய்தாலே போதும்.

## சுருக்கம்

இந்தப் பாடத்தில் நாம் முக்கியமாக ஒரு விஷயத்தைச் செய்தோம்: விலங்கு தரவை `ContentView`-இலிருந்து வெளியே ஒழுங்குபடுத்தினோம்.

முந்தைய எழுதும் முறை விலங்கு தரவை நேரடியாக `ContentView`-இல் எழுதுவது. இப்படியும் குறியீடு இயங்கும். ஆனால் தரவு அதிகரிக்கும்போது, View கோப்பு மேலும் மேலும் நீளமாகிவிடும்.

ஒழுங்குபடுத்திய பிறகு, `ContentView` இடைமுகத்தைக் காண்பிப்பதற்கே பொறுப்பு; `Animal.animals` விலங்கு தரவை வழங்குவதற்குப் பொறுப்பு.

இந்தப் பாடத்தில் மேலும் இரண்டு புதிய அறிவுகளையும் கற்றோம்.

முதல் ஒன்று `static`.

`static` என்பது நிலையான பண்பைக் குறிக்கிறது. நிலையான பண்பு வகை தன்னுடையது. அதை “வகைப் பெயர்.பண்புப் பெயர்” என்ற முறையில் நேரடியாக அணுகலாம்.

உதாரணமாக:

```swift
Animal.animals
```

இரண்டாவது ஒன்று `extension`.

`extension` என்பது விரிவாக்கம். இது ஒரே வகைக்குரிய குறியீட்டை பிரித்து எழுத உதவும், இதனால் குறியீட்டு அமைப்பு மேலும் தெளிவாகும்.

இந்த உதாரணத்தில், நாம் `extension Animal` பயன்படுத்தி விலங்கு தரவைச் சேமித்தோம். இதனால் `Animal` structure தானாகவே மேலும் சுருக்கமாகிறது.

மேலும், `Animal` முக்கியமாக தரவு model-ஐச் சேமிக்கிறது; SwiftUI இடைமுகத்தை நேரடியாக எழுதவில்லை. எனவே இங்கே `import Foundation` பயன்படுத்தப்படுகிறது.

இந்தப் பாடத்தின் முக்கிய நோக்கம் குறியீட்டை மேலும் சிக்கலாக்குவது அல்ல; அதை வாசிக்கவும் பராமரிக்கவும் எளிதாக்குவது.
