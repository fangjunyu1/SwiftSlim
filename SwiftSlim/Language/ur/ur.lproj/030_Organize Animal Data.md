# جانوروں کا ڈیٹا منظم کرنا

پچھلے سبق میں، ہم نے جانوروں کی ایک سادہ انسائیکلوپیڈیا مثال مکمل کی تھی۔

![view](../../../Resource/029_view.png)

جب صارف کسی جانور پر ٹیپ کرتا ہے، تو صفحہ `Sheet` کے ذریعے جانور کی تفصیل دکھاتا ہے۔

لیکن پچھلے سبق کے کوڈ میں ایک مسئلہ موجود ہے: جانوروں کا ڈیٹا براہِ راست `ContentView` کے اندر لکھا گیا ہے۔

مثال کے طور پر:

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
            // جانوروں کی فہرست دکھائیں
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

یہ کوڈ عام طور پر چل سکتا ہے، لیکن جب جانوروں کا ڈیٹا زیادہ ہو جائے گا، تو `ContentView` بہت لمبا ہو جائے گا۔

`ContentView` کو بنیادی طور پر انٹرفیس دکھانے کی ذمہ داری سنبھالنی چاہیے، لیکن اب یہ بہت سا جانوروں کا ڈیٹا بھی محفوظ کر رہا ہے۔ اس سے کوڈ پڑھنے کی آسانی متاثر ہوتی ہے، اور بعد میں دیکھ بھال بھی مشکل ہو جاتی ہے۔

اس لیے، اس سبق میں ہم ایک کام کریں گے:

جانوروں کا ڈیٹا `ContentView` سے باہر منتقل کریں گے۔

## ڈیٹا کو الگ کیوں کریں؟

SwiftUI میں، view code عموماً انٹرفیس دکھانے کی ذمہ داری سنبھالتا ہے۔

مثال کے طور پر:

```swift
Text("Dolphin")
Image("dolphin")
```

یہ کوڈ انٹرفیس کے ڈسپلے سے متعلق ہیں۔

لیکن جانوروں کا ڈیٹا خود، جیسے جانور کا نام، تصویر کا نام، تقسیم کا علاقہ، رہائش گاہ، اور تفصیلی متن، انٹرفیس کی ساخت نہیں ہے۔

یہ زیادہ ایک مقررہ معلومات کے مجموعے جیسا ہے:

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

اگر انٹرفیس کوڈ اور ڈیٹا کوڈ سب ایک ساتھ لکھ دیے جائیں، تو کوڈ زیادہ سے زیادہ بے ترتیب ہو جائے گا۔

اس لیے، ہم جانوروں کا ڈیٹا `Animal` type میں رکھ سکتے ہیں۔

## مقررہ ڈیٹا محفوظ کرنے کے لیے static استعمال کریں

پہلے ہم منظم کرنے کے بعد کی لکھنے کی صورت دیکھتے ہیں:

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

یہاں ایک نئی code line شامل ہوئی ہے:

```swift
static let animals: [Animal] = [
    
]
```

`static` کا مطلب static property ہے۔

static property خود type سے تعلق رکھتی ہے، کسی ایک مخصوص instance سے نہیں۔

یہ جملہ کچھ abstract ہے، اس لیے ہم اسے ایک سادہ مثال سے سمجھ سکتے ہیں۔

## عام properties اور static properties

مثلاً، ہم ایک `Student` define کرتے ہیں:

```swift
struct Student {
    let name: String
}
```

یہاں `name` ایک عام property ہے۔ عام property کسی ایک مخصوص instance سے تعلق رکھتی ہے۔

اگر ہم `name` تک رسائی چاہتے ہیں، تو پہلے ایک مخصوص student بنانا ضروری ہے:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

یہاں `student` ایک instance ہے۔ ابھی اسے student data کی ایک مخصوص کاپی سمجھ سکتے ہیں۔

کیونکہ ہر student کا نام مختلف ہو سکتا ہے، اس لیے `name` کو کسی مخصوص student پر رکھنا ضروری ہے۔

لیکن کچھ data کسی ایک مخصوص instance سے تعلق نہیں رکھتا۔

مثلاً، ہم preview کے لیے sample data کا ایک گروپ تیار کرنا چاہتے ہیں:

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

یہاں `previewStudents` کے آگے `static` ہے، اس لیے یہ static property ہے۔

static property کسی ایک student سے تعلق نہیں رکھتی، بلکہ خود `Student` type سے تعلق رکھتی ہے۔

اس لیے، ہمیں پہلے کوئی student بنانے کی ضرورت نہیں۔ ہم type name کے ذریعے براہِ راست access کر سکتے ہیں:

```swift
print(Student.previewStudents.count)    // 3
```

یہاں access کا طریقہ یہ ہے:

```swift
TypeName.staticPropertyName
```

یعنی:

```swift
Student.previewStudents
```

اسی طرح، animal encyclopedia میں، ہم جانوروں کے data تک اس طرح access کر سکتے ہیں:

```swift
Animal.animals
```

## واپس ContentView کی طرف

اب، جانوروں کا data `Animal` type میں محفوظ ہو چکا ہے۔

اس لیے `ContentView` کے اندر اب بہت لمبی animal array لکھنے کی ضرورت نہیں۔

ہم اسے اس طرح بدل سکتے ہیں:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // جانوروں کی فہرست دکھائیں
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

یہ line of code ظاہر کرتی ہے:

```swift
let animals = Animal.animals
```

`Animal` type سے `animals` جانوروں کا data نکالیں، پھر اسے current view کے `animals` constant میں محفوظ کریں۔

اس طرح لکھنے کے بعد، `ContentView` زیادہ مختصر ہو جاتا ہے۔

`ContentView` انٹرفیس دکھانے کی ذمہ داری سنبھالتا ہے، اور `Animal.animals` جانوروں کا data فراہم کرنے کی ذمہ داری سنبھالتا ہے۔

## Animal کو الگ file میں منتقل کریں

پچھلے سبق میں، مثال کو سمجھنا آسان بنانے کے لیے، ہم نے `Animal` اور `ContentView` کو ایک ہی file میں لکھا تھا۔

کیونکہ اس وقت code نسبتاً کم تھا، اس لیے ایسا لکھنے میں کوئی مسئلہ نہیں تھا۔

لیکن اب جانوروں کا data زیادہ ہوتا جا رہا ہے۔ اگر ہم تمام code کو `ContentView.swift` کے اندر ہی رکھتے رہیں، تو file بہت لمبی ہو جائے گی اور پڑھنے میں بھی مشکل ہو گی۔

اس لیے، ہم `Animal` کو ایک نئے Swift file میں الگ رکھ سکتے ہیں۔

Xcode میں، آپ ایک نیا Swift file بنا سکتے ہیں، مثلاً:

```swift
Animal.swift
```

پھر `Animal` struct کو اس file میں منتقل کریں:

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

اس طرح منظم کرنے کے بعد:

`ContentView.swift` انٹرفیس دکھانے کی ذمہ داری سنبھالتا ہے۔

`Animal.swift` جانوروں کے data کی structure بیان کرنے کی ذمہ داری سنبھالتا ہے۔

اگرچہ یہ مختلف files میں رکھے گئے ہیں، لیکن جب تک یہ ایک ہی project میں ہیں، `ContentView` اب بھی براہِ راست `Animal` استعمال کر سکتا ہے۔

مثال کے طور پر:

```swift
let animals = Animal.animals
```

یہاں `ContentView.swift` میں اضافی طور پر `Animal.swift` import کرنے کی ضرورت نہیں۔

Swift خود ایک ہی project میں موجود Swift files کو پہچان لیتا ہے۔

## code کو مزید منظم کرنے کے لیے extension استعمال کریں

اب، ہم نے جانوروں کا data `ContentView` سے `Animal` میں منتقل کر دیا ہے۔

لیکن `Animal` struct کے اندر اب بھی دو طرح کے code ایک ساتھ موجود ہیں:

پہلی قسم جانور model کی اپنی properties ہیں:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

دوسری قسم مقررہ animal data ہے:

```swift
static let animals: [Animal] = [
    // ...
]
```

code structure کو زیادہ واضح بنانے کے لیے، ہم `extension` استعمال کر کے ان دونوں حصوں کو الگ کر سکتے ہیں۔

`extension` کا مطلب توسیع ہے۔

یہ موجودہ type کی بنیاد پر نیا code مزید شامل کر سکتی ہے۔

مثال کے طور پر:

```swift
extension Animal {
    
}
```

اس کا مطلب ہے کہ ہم `Animal` type کو extend کر رہے ہیں۔

## جانوروں کا data extension میں رکھیں

ہم `Animal` کو اس طرح بدل سکتے ہیں:

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

اس طرح منظم کرنے کے بعد، code structure زیادہ واضح ہو جاتی ہے۔

`struct Animal` یہ بیان کرنے کی ذمہ داری سنبھالتا ہے کہ ایک جانور کے پاس کون سی properties ہونی چاہییں۔

`extension Animal` مقررہ animal data کا ایک گروپ محفوظ کرنے کی ذمہ داری سنبھالتا ہے۔

توجہ دیں، اگرچہ `animals` کو `extension Animal` میں منتقل کیا گیا ہے، لیکن اسے استعمال کرنے کا طریقہ نہیں بدلتا۔

ہم اب بھی اسے اس طرح استعمال کر سکتے ہیں:

```swift
let animals = Animal.animals
```

یہ بھی `extension` کی ایک خصوصیت ہے: یہ صرف code کو منظم کرنے میں مدد دیتی ہے، external calling method کو تبدیل نہیں کرتی۔

## data زیادہ ہو تو الگ AnimalData file بھی بنائی جا سکتی ہے

اب، ہم نے `Animal` کو ایک الگ `Animal.swift` file میں رکھ دیا ہے۔

اگر animal data زیادہ نہیں ہے، تو آپ `extension Animal` کو براہِ راست `Animal.swift` میں لکھ سکتے ہیں۔

لیکن اگر animal data زیادہ سے زیادہ ہوتا جائے، تو آپ ایک اور file بھی بنا سکتے ہیں، مثلاً:

```swift
AnimalData.swift
```

پھر مقررہ animal data اس میں رکھیں:

```swift
extension Animal {
    static let animals: [Animal] = [
        // جانوروں کا data
    ]
}
```

ایسا کرنے کے بعد، code responsibilities زیادہ واضح ہو جاتی ہیں:

`Animal.swift` صرف animal model define کرنے کی ذمہ داری سنبھالتا ہے۔

`AnimalData.swift` صرف animal data محفوظ کرنے کی ذمہ داری سنبھالتا ہے۔

`ContentView.swift` صرف انٹرفیس دکھانے کی ذمہ داری سنبھالتا ہے۔

ہر file کی responsibility زیادہ واضح ہو جاتی ہے۔

توجہ دیں، `AnimalData.swift` صرف file name ہے، کوئی نیا Swift type نہیں۔ اس file میں ہم اب بھی `extension Animal` کے ذریعے `Animal` میں fixed data شامل کر رہے ہیں۔

## مکمل code

ذیل میں منظم کیا ہوا `Animal.swift` code ہے:

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

منظم کیا ہوا `AnimalData.swift` code:

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

`ContentView.swift` میں، آپ اسے اس طرح استعمال کر سکتے ہیں:

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

اشارہ: `Animal.swift` اور `AnimalData.swift` دونوں files میں، پہلی line یہ لکھی گئی ہے:

```swift
import Foundation
```

اس سے پہلے جب ہم SwiftUI interfaces لکھتے تھے، تو ہم اکثر یہ استعمال کرتے تھے:

```swift
import SwiftUI
```

اس کی وجہ یہ ہے کہ `ContentView`، `Text`، `Button`، اور `Color` سب interface سے متعلق ہیں، اس لیے interface files لکھتے وقت عموماً SwiftUI import کرنا ضروری ہوتا ہے۔

لیکن یہاں `Animal.swift` اور `AnimalData.swift` interface files نہیں ہیں۔ یہ بنیادی طور پر animal model define کرنے اور animal data محفوظ کرنے کے لیے استعمال ہوتی ہیں۔

اس code میں، `UUID()` کو `Foundation` کی ضرورت ہوتی ہے، اس لیے `Foundation` import کرنا کافی ہے۔

## خلاصہ

اس سبق میں ہم نے بنیادی طور پر ایک کام کیا: جانوروں کا data `ContentView` سے باہر منتقل کیا۔

اصل لکھنے کا طریقہ یہ تھا کہ جانوروں کا data براہِ راست `ContentView` کے اندر لکھا گیا تھا۔ یہ code چل سکتا ہے، لیکن جب data زیادہ ہو جائے گا، تو view file زیادہ سے زیادہ لمبی ہو جائے گی۔

منظم کرنے کے بعد، `ContentView` صرف انٹرفیس دکھانے کی ذمہ داری سنبھالتا ہے، اور `Animal.animals` جانوروں کا data فراہم کرنے کی ذمہ داری سنبھالتا ہے۔

اس سبق میں دو نئے knowledge points بھی سیکھے گئے۔

پہلا `static` ہے۔

`static` کا مطلب static property ہے۔ static property خود type سے تعلق رکھتی ہے، اور “TypeName.propertyName” کے ذریعے براہِ راست access کی جا سکتی ہے۔

مثال کے طور پر:

```swift
Animal.animals
```

دوسرا `extension` ہے۔

`extension` کا مطلب توسیع ہے۔ یہ ایک ہی type کے code کو الگ الگ حصوں میں لکھ سکتی ہے، جس سے code structure زیادہ واضح ہو جاتی ہے۔

اس مثال میں، ہم `extension Animal` استعمال کر کے animal data محفوظ کرتے ہیں، جس سے `Animal` struct خود زیادہ مختصر ہو جاتا ہے۔

اس کے علاوہ، `Animal` بنیادی طور پر data model محفوظ کرتا ہے اور براہِ راست SwiftUI interface نہیں لکھتا، اس لیے یہاں ہم `import Foundation` استعمال کرتے ہیں۔

اس سبق کا focus code کو زیادہ پیچیدہ بنانا نہیں، بلکہ code کو پڑھنے اور maintain کرنے میں آسان بنانا ہے۔
