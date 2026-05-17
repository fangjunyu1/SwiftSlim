# प्राण्यांचा डेटा व्यवस्थित करणे

मागील धड्यात, आपण प्राण्यांच्या ज्ञानकोशाचे एक साधे उदाहरण पूर्ण केले.

![view](../../../Resource/029_view.png)

वापरकर्ता एखाद्या प्राण्यावर क्लिक करतो तेव्हा, पृष्ठ `Sheet` द्वारे प्राण्याचे तपशील पॉप अप करेल.

परंतु, मागील धड्याच्या कोडमध्ये एक समस्या होती: प्राण्यांचा डेटा थेट `ContentView` मध्ये लिहिला होता.

उदाहरणार्थ:

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
            // प्राण्यांची यादी दाखवा
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

हा कोड सामान्यपणे चालू शकतो, पण प्राण्यांचा डेटा वाढत गेल्यावर `ContentView` खूप लांब होईल.

`ContentView` ने मुख्यतः इंटरफेस दाखवण्याची जबाबदारी घ्यायला हवी होती, पण आता ते मोठ्या प्रमाणात प्राण्यांचा डेटा देखील साठवत आहे. यामुळे कोड वाचणे अवघड होते आणि पुढील देखभालही सोयीची राहत नाही.

म्हणून, या धड्यात आपण एक गोष्ट करणार आहोत:

प्राण्यांचा डेटा `ContentView` मधून वेगळा करून व्यवस्थित करणे.

## डेटा वेगळा का करावा?

SwiftUI मध्ये, दृश्याचा कोड सामान्यतः इंटरफेस दाखवण्याची जबाबदारी घेतो.

उदाहरणार्थ:

```swift
Text("Dolphin")
Image("dolphin")
```

हे कोड इंटरफेस दाखवण्याशी संबंधित आहेत.

पण प्राण्यांचा डेटा स्वतः, जसे की प्राण्याचे नाव, प्रतिमेचे नाव, वितरण क्षेत्र, अधिवास, वर्णन मजकूर, हे इंटरफेसची रचना नाहीत.

ते निश्चित माहितीच्या एका संचासारखे अधिक आहेत:

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

जर इंटरफेस कोड आणि डेटा कोड सर्व एकत्र लिहिले, तर कोड अधिकाधिक गोंधळलेला होईल.

म्हणून, आपण प्राण्यांचा डेटा `Animal` प्रकारात ठेवू शकतो.

## निश्चित डेटा साठवण्यासाठी static वापरणे

आधी व्यवस्थित केल्यानंतरची लिहिण्याची पद्धत पाहू:

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

येथे कोडची एक नवीन ओळ जोडली आहे:

```swift
static let animals: [Animal] = [
    
]
```

`static` म्हणजे स्थिर गुणधर्म.

स्थिर गुणधर्म प्रकाराचा स्वतःचा असतो, एखाद्या विशिष्ट instance चा नसतो.

हे वाक्य थोडे अमूर्त आहे, म्हणून आपण एक साधे उदाहरण वापरून समजू शकतो.

## सामान्य गुणधर्म आणि स्थिर गुणधर्म

उदाहरणार्थ, आपण एक `Student` परिभाषित करतो:

```swift
struct Student {
    let name: String
}
```

येथील `name` हा सामान्य गुणधर्म आहे. सामान्य गुणधर्म एखाद्या विशिष्ट instance चा असतो.

जर आपल्याला `name` ला access करायचे असेल, तर आधी एक विशिष्ट विद्यार्थी तयार करणे आवश्यक आहे:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

येथील `student` हा एक instance आहे. सुरुवातीला आपण त्याला विद्यार्थ्याच्या विशिष्ट डेटाचा एक संच असेही समजू शकतो.

कारण प्रत्येक विद्यार्थ्याचे नाव वेगळे असू शकते, म्हणून `name` हे विशिष्ट विद्यार्थ्याच्या अंगावर ठेवावे लागते.

परंतु, काही डेटा एखाद्या विशिष्ट instance चा नसतो.

उदाहरणार्थ, आपल्याला preview साठी उदाहरण डेटाचा एक संच तयार करायचा आहे:

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

येथील `previewStudents` च्या आधी `static` आहे, म्हणून तो स्थिर गुणधर्म आहे.

स्थिर गुणधर्म एखाद्या विद्यार्थ्याचा नसून `Student` या प्रकाराचा स्वतःचा असतो.

म्हणून, आपल्याला आधी एखादा विद्यार्थी तयार करण्याची गरज नाही. आपण थेट प्रकाराच्या नावाद्वारे access करू शकतो:

```swift
print(Student.previewStudents.count)    // 3
```

येथील access करण्याची पद्धत अशी आहे:

```swift
प्रकाराचे_नाव.स्थिर_गुणधर्माचे_नाव
```

म्हणजेच:

```swift
Student.previewStudents
```

त्याचप्रमाणे, प्राण्यांच्या ज्ञानकोशात आपण प्राण्यांचा डेटा असा access करू शकतो:

```swift
Animal.animals
```

## पुन्हा ContentView कडे

आता प्राण्यांचा डेटा `Animal` प्रकारात साठवला गेला आहे.

म्हणून `ContentView` मध्ये पुन्हा फार लांब प्राण्यांचा array लिहिण्याची गरज नाही.

आपण असे बदलू शकतो:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // प्राण्यांची यादी दाखवा
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ही ओळ असे दर्शवते:

```swift
let animals = Animal.animals
```

`Animal` प्रकारातून `animals` हा प्राण्यांच्या डेटाचा संच काढून, तो सध्याच्या दृश्यातील `animals` constant मध्ये साठवला जातो.

असे लिहिल्यानंतर `ContentView` अधिक संक्षिप्त होते.

`ContentView` इंटरफेस दाखवण्याची जबाबदारी घेतो, तर `Animal.animals` प्राण्यांचा डेटा पुरवण्याची जबाबदारी घेतो.

## Animal ला स्वतंत्र फाइलमध्ये वेगळे करणे

मागील धड्यात, उदाहरण अधिक सोपे समजावे म्हणून आपण `Animal` आणि `ContentView` एकाच फाइलमध्ये लिहिले होते.

कारण तेव्हा कोड अजून कमी होता, त्यामुळे असे लिहिण्यात अडचण नव्हती.

परंतु आता प्राण्यांचा डेटा वाढत आहे. जर सर्व कोड `ContentView.swift` मध्येच ठेवला, तर फाइल खूप लांब होईल आणि वाचायलाही सोयीची राहणार नाही.

म्हणून, आपण `Animal` स्वतंत्र नवीन Swift फाइलमध्ये ठेवू शकतो.

Xcode मध्ये, एक नवीन Swift फाइल तयार करू शकतो, उदाहरणार्थ:

```swift
Animal.swift
```

नंतर `Animal` struct या फाइलमध्ये हलवा:

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

असे व्यवस्थित केल्यानंतर:

`ContentView.swift` इंटरफेस दाखवण्याची जबाबदारी घेतो.

`Animal.swift` प्राण्यांच्या डेटाची रचना वर्णन करण्याची जबाबदारी घेतो.

जरी ते वेगवेगळ्या फाइल्समध्ये ठेवले असले, तरी जोपर्यंत ते एकाच project मध्ये आहेत, `ContentView` अजूनही `Animal` थेट वापरू शकतो.

उदाहरणार्थ:

```swift
let animals = Animal.animals
```

येथे `ContentView.swift` मध्ये वेगळे `Animal.swift` import करण्याची गरज नाही.

Swift त्याच project मधील Swift फाइल्स आपोआप ओळखतो.

## कोड आणखी व्यवस्थित करण्यासाठी extension वापरणे

आता आपण प्राण्यांचा डेटा `ContentView` मधून `Animal` मध्ये हलवला आहे.

तरीही, `Animal` struct मध्ये अजूनही दोन प्रकारचे कोड एकत्र आहेत:

पहिला प्रकार म्हणजे प्राण्यांच्या model चे स्वतःचे गुणधर्म:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

दुसरा प्रकार म्हणजे निश्चित प्राण्यांचा डेटा:

```swift
static let animals: [Animal] = [
    // ...
]
```

कोडची रचना अधिक स्पष्ट करण्यासाठी, आपण `extension` वापरून हे दोन भाग वेगळे करू शकतो.

`extension` चा अर्थ विस्तार असा आहे.

तो मूळ प्रकाराच्या आधारावर नवीन कोड पुढे जोडू शकतो.

उदाहरणार्थ:

```swift
extension Animal {
    
}
```

याचा अर्थ आपण `Animal` या प्रकाराचा विस्तार करत आहोत.

## प्राण्यांचा डेटा extension मध्ये ठेवणे

आपण `Animal` असे बदलू शकतो:

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

असे व्यवस्थित केल्यानंतर कोडची रचना अधिक स्पष्ट होते.

`struct Animal` एखाद्या प्राण्यात कोणते गुणधर्म असावेत हे वर्णन करण्याची जबाबदारी घेतो.

`extension Animal` निश्चित प्राण्यांच्या डेटाचा संच साठवण्याची जबाबदारी घेतो.

लक्षात घ्या, `animals` ला `extension Animal` मध्ये हलवले असले तरी वापरण्याची पद्धत बदलत नाही.

आपण अजूनही असे वापरू शकतो:

```swift
let animals = Animal.animals
```

हे `extension` चे एक वैशिष्ट्य आहे: तो फक्त कोड व्यवस्थित करण्यास मदत करतो, बाहेरील calling पद्धत बदलत नाही.

## डेटा जास्त असल्यास, पुन्हा AnimalData फाइल तयार करू शकतो

आता आपण `Animal` ला स्वतंत्र `Animal.swift` फाइलमध्ये ठेवले आहे.

जर प्राण्यांचा डेटा कमी असेल, तर `extension Animal` थेट `Animal.swift` मध्येही लिहू शकतो.

परंतु, जर प्राण्यांचा डेटा अधिकाधिक वाढत असेल, तर पुन्हा एक फाइल तयार करू शकतो, उदाहरणार्थ:

```swift
AnimalData.swift
```

नंतर निश्चित प्राण्यांचा डेटा त्यात ठेवा:

```swift
extension Animal {
    static let animals: [Animal] = [
        // प्राण्यांचा डेटा
    ]
}
```

असे केल्यानंतर कोडचे कामकाज अधिक स्पष्ट होते:

`Animal.swift` फक्त प्राण्यांचा model परिभाषित करण्याची जबाबदारी घेतो.

`AnimalData.swift` फक्त प्राण्यांचा डेटा साठवण्याची जबाबदारी घेतो.

`ContentView.swift` फक्त इंटरफेस दाखवण्याची जबाबदारी घेतो.

प्रत्येक फाइलची जबाबदारी अधिक स्पष्ट होते.

लक्षात घ्या, `AnimalData.swift` हे फक्त फाइलचे नाव आहे, नवीन Swift प्रकार नाही. या फाइलमध्ये अजूनही `extension Animal` द्वारे `Animal` मध्ये निश्चित डेटा जोडला जात आहे.

## पूर्ण कोड

खाली व्यवस्थित केलेला `Animal.swift` कोड आहे:

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

व्यवस्थित केलेला `AnimalData.swift` कोड:

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

`ContentView.swift` मध्ये असे वापरू शकतो:

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

सूचना: `Animal.swift` आणि `AnimalData.swift` फाइल्समध्ये पहिल्या ओळीत हे लिहिले आहे:

```swift
import Foundation
```

यापूर्वी SwiftUI इंटरफेस लिहिताना आपण अनेकदा हे वापरत होतो:

```swift
import SwiftUI
```

कारण `ContentView`, `Text`, `Button`, `Color` या गोष्टी इंटरफेसशी संबंधित आहेत, म्हणून इंटरफेस फाइल लिहिताना सहसा SwiftUI import करणे आवश्यक असते.

परंतु येथील `Animal.swift` आणि `AnimalData.swift` या इंटरफेस फाइल्स नाहीत. त्या मुख्यतः प्राण्यांचा model परिभाषित करण्यासाठी आणि प्राण्यांचा डेटा साठवण्यासाठी वापरल्या जातात.

या कोडमध्ये `UUID()` ला `Foundation` आवश्यक आहे, म्हणून `Foundation` import करणे पुरेसे आहे.

## सारांश

या धड्यात आपण मुख्यतः एक गोष्ट केली: प्राण्यांचा डेटा `ContentView` मधून वेगळा करून व्यवस्थित केला.

मूळ लिहिण्याची पद्धत म्हणजे प्राण्यांचा डेटा थेट `ContentView` मध्ये लिहिणे. अशा प्रकारे कोड चालू शकतो, पण डेटा वाढल्यावर दृश्याची फाइल अधिकाधिक लांब होते.

व्यवस्थित केल्यानंतर, `ContentView` फक्त इंटरफेस दाखवण्याची जबाबदारी घेतो, तर `Animal.animals` प्राण्यांचा डेटा पुरवण्याची जबाबदारी घेतो.

या धड्यात आपण अजून दोन नवीन ज्ञानबिंदू शिकले.

पहिला म्हणजे `static`.

`static` म्हणजे स्थिर गुणधर्म. स्थिर गुणधर्म प्रकाराचा स्वतःचा असतो आणि “प्रकाराचे नाव.गुणधर्माचे नाव” या पद्धतीने थेट access करता येतो.

उदाहरणार्थ:

```swift
Animal.animals
```

दुसरा म्हणजे `extension`.

`extension` म्हणजे विस्तार. तो त्याच प्रकाराचा कोड वेगळा लिहू शकतो, ज्यामुळे कोडची रचना अधिक स्पष्ट होते.

या उदाहरणात, आपण प्राण्यांचा डेटा साठवण्यासाठी `extension Animal` वापरला, त्यामुळे `Animal` struct स्वतः अधिक संक्षिप्त झाला.

याशिवाय, `Animal` मुख्यतः data model साठवतो आणि थेट SwiftUI इंटरफेस लिहित नाही, म्हणून येथे `import Foundation` वापरले आहे.

या धड्याचा मुख्य मुद्दा कोड अधिक गुंतागुंतीचा करणे नाही, तर कोड वाचणे आणि देखभाल करणे अधिक सोपे करणे आहे.
