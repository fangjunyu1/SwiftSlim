# पशु डेटा व्यवस्थित करना

पिछले पाठ में, हमने पशु विश्वकोश का एक सरल उदाहरण पूरा किया।

![view](../../../Resource/029_view.png)

जब उपयोगकर्ता किसी पशु पर टैप करता है, तो पेज `Sheet` के माध्यम से पशु का विवरण दिखाता है।

लेकिन पिछले पाठ के कोड में एक समस्या है: पशु डेटा सीधे `ContentView` के अंदर लिखा गया है।

उदाहरण के लिए:

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
            // पशु सूची दिखाएँ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

यह कोड सामान्य रूप से चल सकता है, लेकिन जब पशु डेटा बढ़ता जाता है, तो `ContentView` बहुत लंबा हो जाएगा।

`ContentView` को मूल रूप से मुख्य रूप से इंटरफ़ेस दिखाने के लिए ज़िम्मेदार होना चाहिए, लेकिन अब यह बड़ी मात्रा में पशु डेटा भी सहेज रहा है। इससे कोड पढ़ना प्रभावित होता है और बाद में रखरखाव भी कम सुविधाजनक हो जाता है।

इसलिए, इस पाठ में हम एक काम करेंगे:

पशु डेटा को `ContentView` से बाहर व्यवस्थित करेंगे।

## डेटा को अलग क्यों करें?

SwiftUI में, व्यू कोड आमतौर पर इंटरफ़ेस दिखाने के लिए ज़िम्मेदार होता है।

उदाहरण के लिए:

```swift
Text("Dolphin")
Image("dolphin")
```

ये कोड इंटरफ़ेस प्रदर्शन से जुड़े हैं।

लेकिन पशु डेटा स्वयं, जैसे पशु का नाम, छवि का नाम, वितरण क्षेत्र, आवास और विवरण पाठ, इंटरफ़ेस संरचना नहीं है।

वे निश्चित जानकारी के एक समूह जैसे अधिक हैं:

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

यदि इंटरफ़ेस कोड और डेटा कोड सब एक साथ लिख दिए जाएँ, तो कोड धीरे-धीरे अधिक अव्यवस्थित हो जाएगा।

इसलिए, हम पशु डेटा को `Animal` प्रकार में रख सकते हैं।

## निश्चित डेटा सहेजने के लिए static का उपयोग करना

पहले, हम व्यवस्थित की गई लिखावट देखें:

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

यहाँ कोड की एक नई पंक्ति जोड़ी गई है:

```swift
static let animals: [Animal] = [
    
]
```

`static` का अर्थ है स्थिर गुण।

स्थिर गुण प्रकार स्वयं से संबंधित होता है, किसी एक विशिष्ट इंस्टेंस से संबंधित नहीं होता।

यह वाक्य थोड़ा अमूर्त है, इसलिए हम इसे एक सरल उदाहरण के माध्यम से समझ सकते हैं।

## सामान्य गुण और स्थिर गुण

उदाहरण के लिए, हम एक `Student` परिभाषित करते हैं:

```swift
struct Student {
    let name: String
}
```

यहाँ `name` एक सामान्य गुण है। सामान्य गुण किसी एक विशिष्ट इंस्टेंस से संबंधित होता है।

यदि हम `name` तक पहुँच चाहते हैं, तो हमें पहले एक विशिष्ट छात्र बनाना होगा:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

यहाँ `student` एक इंस्टेंस है। अभी आप इसे छात्र डेटा की एक विशिष्ट प्रति के रूप में समझ सकते हैं।

क्योंकि हर छात्र का नाम अलग हो सकता है, इसलिए `name` को किसी विशिष्ट छात्र पर रखना आवश्यक है।

लेकिन कुछ डेटा किसी एक विशिष्ट इंस्टेंस से संबंधित नहीं होता।

उदाहरण के लिए, हम प्रीव्यू के लिए नमूना डेटा का एक समूह तैयार करना चाहते हैं:

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

यहाँ `previewStudents` के आगे `static` है, इसलिए यह एक स्थिर गुण है।

स्थिर गुण किसी एक छात्र से संबंधित नहीं होता, बल्कि `Student` इस प्रकार स्वयं से संबंधित होता है।

इसलिए, हमें पहले कोई छात्र बनाने की आवश्यकता नहीं है। हम सीधे प्रकार नाम के माध्यम से इसे एक्सेस कर सकते हैं:

```swift
print(Student.previewStudents.count)    // 3
```

यहाँ एक्सेस करने का तरीका है:

```swift
प्रकार नाम.स्थिर गुण नाम
```

अर्थात:

```swift
Student.previewStudents
```

इसी तरह, पशु विश्वकोश में, हम पशु डेटा को इस तरह एक्सेस कर सकते हैं:

```swift
Animal.animals
```

## ContentView पर वापस

अब, पशु डेटा `Animal` प्रकार में सहेजा जा चुका है।

इसलिए `ContentView` के अंदर अब बहुत लंबा पशु ऐरे लिखने की आवश्यकता नहीं है।

हम इसे इस तरह बदल सकते हैं:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // पशु सूची दिखाएँ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

यह पंक्ति दर्शाती है:

```swift
let animals = Animal.animals
```

`Animal` प्रकार से `animals` नाम का यह पशु डेटा निकालें, और फिर उसे वर्तमान व्यू के `animals` स्थिरांक में सहेजें।

इस तरह लिखने के बाद, `ContentView` अधिक संक्षिप्त हो जाता है।

`ContentView` इंटरफ़ेस दिखाने के लिए ज़िम्मेदार है, और `Animal.animals` पशु डेटा उपलब्ध कराने के लिए ज़िम्मेदार है।

## Animal को अलग फ़ाइल में अलग करना

पिछले पाठ में, उदाहरण को अधिक आसानी से समझाने के लिए, हमने `Animal` और `ContentView` को एक ही फ़ाइल में लिखा था।

क्योंकि उस समय कोड अभी अपेक्षाकृत कम था, इसलिए इस तरह लिखने में कोई समस्या नहीं थी।

लेकिन अब पशु डेटा धीरे-धीरे अधिक हो रहा है। यदि हम सभी कोड को `ContentView.swift` में ही रखते रहें, तो फ़ाइल बहुत लंबी हो जाएगी और पढ़ने में भी कम सुविधाजनक होगी।

इसलिए, हम `Animal` को अकेले एक नई Swift फ़ाइल में रख सकते हैं।

Xcode में, आप एक नई Swift फ़ाइल बना सकते हैं, उदाहरण के लिए:

```swift
Animal.swift
```

फिर `Animal` स्ट्रक्चर को इस फ़ाइल में ले जाएँ:

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

इस तरह व्यवस्थित करने के बाद:

`ContentView.swift` इंटरफ़ेस दिखाने के लिए ज़िम्मेदार है।

`Animal.swift` पशु डेटा की संरचना का वर्णन करने के लिए ज़िम्मेदार है।

हालाँकि वे अलग-अलग फ़ाइलों में रखे गए हैं, लेकिन जब तक वे एक ही प्रोजेक्ट में हैं, `ContentView` फिर भी सीधे `Animal` का उपयोग कर सकता है।

उदाहरण के लिए:

```swift
let animals = Animal.animals
```

यहाँ `ContentView.swift` में अतिरिक्त रूप से `Animal.swift` आयात करने की आवश्यकता नहीं है।

Swift एक ही प्रोजेक्ट में मौजूद Swift फ़ाइलों को स्वचालित रूप से पहचान लेता है।

## कोड को आगे व्यवस्थित करने के लिए extension का उपयोग करना

अब, हमने पशु डेटा को `ContentView` से `Animal` में स्थानांतरित कर दिया है।

हालाँकि, `Animal` स्ट्रक्चर में अभी भी एक साथ दो प्रकार के कोड शामिल हैं:

पहला प्रकार पशु मॉडल के स्वयं के गुण हैं:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

दूसरा प्रकार निश्चित पशु डेटा है:

```swift
static let animals: [Animal] = [
    // ...
]
```

कोड संरचना को और स्पष्ट बनाने के लिए, हम इन दो भागों को अलग करने के लिए `extension` का उपयोग कर सकते हैं।

`extension` का अर्थ है विस्तार।

यह मौजूदा प्रकार के आधार पर नया कोड जोड़ना जारी रख सकता है।

उदाहरण के लिए:

```swift
extension Animal {
    
}
```

इसका अर्थ है कि हम `Animal` प्रकार को विस्तारित कर रहे हैं।

## पशु डेटा को extension में रखना

हम `Animal` को इस तरह बदल सकते हैं:

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

इस तरह व्यवस्थित करने के बाद, कोड संरचना अधिक स्पष्ट हो जाती है।

`struct Animal` यह वर्णन करने के लिए ज़िम्मेदार है कि एक पशु में कौन-कौन से गुण होने चाहिए।

`extension Animal` निश्चित पशु डेटा का एक समूह सहेजने के लिए ज़िम्मेदार है।

ध्यान दें, हालाँकि `animals` को `extension Animal` में ले जाया गया है, लेकिन उपयोग का तरीका नहीं बदलता।

हम अभी भी इसे इस तरह उपयोग कर सकते हैं:

```swift
let animals = Animal.animals
```

यह `extension` की एक विशेषता भी है: यह केवल हमें कोड व्यवस्थित करने में मदद करता है, बाहरी कॉलिंग तरीका नहीं बदलता।

## डेटा अधिक होने पर, फिर से AnimalData फ़ाइल बनाई जा सकती है

अब, हमने `Animal` को अलग `Animal.swift` फ़ाइल में रख दिया है।

यदि पशु डेटा कम है, तो आप `extension Animal` को सीधे `Animal.swift` में भी लिख सकते हैं।

लेकिन यदि पशु डेटा धीरे-धीरे अधिक हो रहा है, तो आप एक और फ़ाइल भी बना सकते हैं, उदाहरण के लिए:

```swift
AnimalData.swift
```

फिर निश्चित पशु डेटा को इसमें रखें:

```swift
extension Animal {
    static let animals: [Animal] = [
        // पशु डेटा
    ]
}
```

ऐसा करने के बाद, कोड का कार्य-विभाजन अधिक स्पष्ट हो जाता है:

`Animal.swift` केवल पशु मॉडल परिभाषित करने के लिए ज़िम्मेदार है।

`AnimalData.swift` केवल पशु डेटा सहेजने के लिए ज़िम्मेदार है।

`ContentView.swift` केवल इंटरफ़ेस दिखाने के लिए ज़िम्मेदार है।

हर फ़ाइल की ज़िम्मेदारी अधिक स्पष्ट होती है।

ध्यान दें, `AnimalData.swift` केवल फ़ाइल नाम है, कोई नया Swift प्रकार नहीं है। इस फ़ाइल में हम फिर भी `extension Animal` के माध्यम से `Animal` में निश्चित डेटा जोड़ रहे हैं।

## पूरा कोड

नीचे व्यवस्थित किया गया `Animal.swift` कोड है:

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

व्यवस्थित किया गया `AnimalData.swift` कोड:

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

`ContentView.swift` में, आप इसे इस तरह उपयोग कर सकते हैं:

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

सुझाव: `Animal.swift` और `AnimalData.swift` फ़ाइलों में, पहली पंक्ति में यह लिखा है:

```swift
import Foundation
```

पहले जब हम SwiftUI इंटरफ़ेस लिखते थे, तो अक्सर यह उपयोग करते थे:

```swift
import SwiftUI
```

ऐसा इसलिए है क्योंकि `ContentView`, `Text`, `Button`, `Color` ये सब इंटरफ़ेस से जुड़े हैं, इसलिए इंटरफ़ेस फ़ाइल लिखते समय आमतौर पर SwiftUI आयात करने की आवश्यकता होती है।

लेकिन यहाँ `Animal.swift` और `AnimalData.swift` इंटरफ़ेस फ़ाइलें नहीं हैं। वे मुख्य रूप से पशु मॉडल परिभाषित करने और पशु डेटा सहेजने के लिए उपयोग होती हैं।

इस कोड में, `UUID()` को `Foundation` की आवश्यकता होती है, इसलिए `Foundation` आयात करना पर्याप्त है।

## सारांश

इस पाठ में हमने मुख्य रूप से एक काम किया: पशु डेटा को `ContentView` से बाहर व्यवस्थित किया।

मूल लिखावट पशु डेटा को सीधे `ContentView` में लिखना था। ऐसा कोड चल सकता है, लेकिन जब डेटा बढ़ता है, तो व्यू फ़ाइल लंबी होती जाएगी।

व्यवस्थित करने के बाद, `ContentView` केवल इंटरफ़ेस दिखाने के लिए ज़िम्मेदार है, और `Animal.animals` पशु डेटा प्रदान करने के लिए ज़िम्मेदार है।

इस पाठ में दो नए ज्ञान-बिंदु भी सीखे गए।

पहला है `static`।

`static` का अर्थ है स्थिर गुण। स्थिर गुण प्रकार स्वयं से संबंधित होता है, और “प्रकार नाम.गुण नाम” के तरीके से सीधे एक्सेस किया जा सकता है।

उदाहरण के लिए:

```swift
Animal.animals
```

दूसरा है `extension`।

`extension` का अर्थ है विस्तार। यह एक ही प्रकार के कोड को अलग-अलग भागों में लिख सकता है, जिससे कोड संरचना अधिक स्पष्ट होती है।

इस उदाहरण में, हम पशु डेटा सहेजने के लिए `extension Animal` का उपयोग करते हैं, जिससे `Animal` स्ट्रक्चर स्वयं अधिक संक्षिप्त हो जाता है।

इसके अलावा, `Animal` मुख्य रूप से डेटा मॉडल सहेजता है और सीधे SwiftUI इंटरफ़ेस नहीं लिखता, इसलिए यहाँ `import Foundation` का उपयोग किया गया है।

इस पाठ का मुख्य बिंदु कोड को अधिक जटिल बनाना नहीं है, बल्कि कोड को पढ़ने और बनाए रखने में आसान बनाना है।
