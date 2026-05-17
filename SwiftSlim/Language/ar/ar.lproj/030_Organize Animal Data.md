# تنظيم بيانات الحيوانات

في الدرس السابق، أكملنا مثالًا بسيطًا لموسوعة حيوانات.

![view](../../../Resource/029_view.png)

عندما يضغط المستخدم على أحد الحيوانات، ستعرض الصفحة تفاصيل الحيوان عبر `Sheet`.

لكن في كود الدرس السابق توجد مشكلة: بيانات الحيوانات مكتوبة مباشرة داخل `ContentView`.

على سبيل المثال:

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
            // عرض قائمة الحيوانات
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

يمكن تشغيل هذا الكود بشكل طبيعي، ولكن عندما تزداد بيانات الحيوانات، سيصبح `ContentView` طويلًا جدًا.

كان من المفترض أن يكون `ContentView` مسؤولًا بشكل أساسي عن عرض الواجهة، لكنه الآن يحفظ أيضًا كمية كبيرة من بيانات الحيوانات. هذا يؤثر في قراءة الكود، ولا يسهّل الصيانة اللاحقة.

لذلك، في هذا الدرس سنفعل شيئًا واحدًا:

نرتّب بيانات الحيوانات وننقلها خارج `ContentView`.

## لماذا نحتاج إلى فصل البيانات؟

في SwiftUI، يكون كود العرض عادةً مسؤولًا عن عرض الواجهة.

على سبيل المثال:

```swift
Text("Dolphin")
Image("dolphin")
```

هذه الأكواد كلها مرتبطة بعرض الواجهة.

أما بيانات الحيوان نفسها، مثل اسم الحيوان، واسم الصورة، ومنطقة الانتشار، والموطن، ونص الوصف، فهي ليست بنية الواجهة.

إنها أشبه بمجموعة من البيانات الثابتة:

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

إذا كتبنا كود الواجهة وكود البيانات معًا بالكامل، فسيصبح الكود أكثر فوضى تدريجيًا.

لذلك، يمكننا وضع بيانات الحيوانات داخل نوع `Animal`.

## استخدام static لحفظ البيانات الثابتة

لننظر أولًا إلى طريقة الكتابة بعد التنظيم:

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

هنا أضفنا سطرًا جديدًا من الكود:

```swift
static let animals: [Animal] = [

]
```

يشير `static` إلى خاصية ثابتة.

الخاصية الثابتة تنتمي إلى النوع نفسه، ولا تنتمي إلى مثيل محدد.

قد تبدو هذه الجملة مجردة بعض الشيء، لذلك يمكننا فهمها من خلال مثال بسيط.

## الخصائص العادية والخصائص الثابتة

على سبيل المثال، نعرّف `Student`:

```swift
struct Student {
    let name: String
}
```

هنا `name` خاصية عادية، والخاصية العادية تنتمي إلى مثيل محدد.

إذا أردنا الوصول إلى `name`، فيجب أولًا إنشاء طالب محدد:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

هنا `student` هو مثيل، ويمكنك فهمه مؤقتًا على أنه نسخة محددة من بيانات طالب.

لأن اسم كل طالب قد يكون مختلفًا، يجب وضع `name` داخل الطالب المحدد.

لكن هناك بعض البيانات التي لا تنتمي إلى مثيل محدد.

على سبيل المثال، نريد تجهيز مجموعة من بيانات المثال التي يمكن استخدامها في المعاينة:

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

هنا توجد كلمة `static` قبل `previewStudents`، لذلك فهي خاصية ثابتة.

الخاصية الثابتة لا تنتمي إلى طالب معيّن، بل تنتمي إلى النوع `Student` نفسه.

لذلك، لا نحتاج إلى إنشاء طالب معيّن أولًا، بل يمكننا الوصول إليها مباشرة عبر اسم النوع:

```swift
print(Student.previewStudents.count)    // 3
```

طريقة الوصول هنا هي:

```swift
اسم_النوع.اسم_الخاصية_الثابتة
```

أي:

```swift
Student.previewStudents
```

وبالمثل، في موسوعة الحيوانات، يمكننا الوصول إلى بيانات الحيوانات بهذه الطريقة:

```swift
Animal.animals
```

## العودة إلى ContentView

الآن، تم حفظ بيانات الحيوانات داخل نوع `Animal`.

لذلك لم نعد بحاجة إلى كتابة مصفوفة حيوانات طويلة داخل `ContentView`.

يمكننا تعديلها إلى:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil

    let animals = Animal.animals

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // عرض قائمة الحيوانات
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

هذا السطر من الكود يعني:

```swift
let animals = Animal.animals
```

نأخذ مجموعة بيانات الحيوانات `animals` من نوع `Animal`، ثم نحفظها في الثابت `animals` داخل العرض الحالي.

بعد الكتابة بهذه الطريقة، سيصبح `ContentView` أكثر اختصارًا.

`ContentView` مسؤول عن عرض الواجهة، و`Animal.animals` مسؤول عن توفير بيانات الحيوانات.

## نقل Animal إلى ملف منفصل

في الدرس السابق، ومن أجل جعل المثال أسهل فهمًا، كتبنا `Animal` و`ContentView` في الملف نفسه.

لأن كمية الكود في ذلك الوقت كانت قليلة، لم تكن هذه الطريقة مشكلة.

لكن الآن أصبحت بيانات الحيوانات أكثر، وإذا واصلنا كتابة كل الأكواد داخل `ContentView.swift`، فسيصبح الملف طويلًا جدًا، ولن يكون مناسبًا للقراءة.

لذلك يمكننا وضع `Animal` وحده في ملف Swift جديد.

في Xcode، يمكن إنشاء ملف Swift جديد، مثل:

```swift
Animal.swift
```

ثم ننقل بنية `Animal` إلى هذا الملف:

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

بعد هذا التنظيم:

`ContentView.swift` مسؤول عن عرض الواجهة.

`Animal.swift` مسؤول عن وصف بنية بيانات الحيوان.

على الرغم من أنهما موضوعان في ملفين مختلفين، ما داما داخل المشروع نفسه، فلا يزال بإمكان `ContentView` استخدام `Animal` مباشرة.

على سبيل المثال:

```swift
let animals = Animal.animals
```

هنا لا نحتاج إلى استيراد `Animal.swift` بشكل إضافي داخل `ContentView.swift`.

سيتعرّف Swift تلقائيًا إلى ملفات Swift الموجودة في المشروع نفسه.

## استخدام extension لمتابعة تنظيم الكود

الآن، نقلنا بيانات الحيوانات من `ContentView` إلى داخل `Animal`.

لكن بنية `Animal` ما زالت تحتوي في الوقت نفسه على نوعين من الكود:

النوع الأول هو خصائص نموذج الحيوان نفسه:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

النوع الثاني هو بيانات الحيوانات الثابتة:

```swift
static let animals: [Animal] = [
    // ...
]
```

لجعل بنية الكود أوضح، يمكننا استخدام `extension` لفصل هذين الجزأين.

معنى `extension` هو التوسيع.

يمكنه إضافة كود جديد إلى نوع موجود أصلًا.

على سبيل المثال:

```swift
extension Animal {

}
```

هذا يعني أننا نوسّع نوع `Animal`.

## وضع بيانات الحيوانات في extension

يمكننا تعديل `Animal` إلى الشكل التالي:

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

بعد هذا التنظيم، ستصبح بنية الكود أوضح.

`struct Animal` مسؤول عن وصف الخصائص التي يجب أن يمتلكها الحيوان.

`extension Animal` مسؤول عن حفظ مجموعة من بيانات الحيوانات الثابتة.

انتبه، رغم نقل `animals` إلى `extension Animal`، فإن طريقة الاستخدام لا تتغير.

ما زال بإمكاننا استخدامها هكذا:

```swift
let animals = Animal.animals
```

وهذه أيضًا إحدى خصائص `extension`: فهو يساعدنا فقط على تنظيم الكود، ولا يغيّر طريقة الاستدعاء الخارجية.

## عندما تكون البيانات كثيرة، يمكن إنشاء ملف AnimalData جديد

الآن، وضعنا `Animal` في ملف `Animal.swift` منفصل.

إذا كانت بيانات الحيوانات قليلة، فيمكن كتابة `extension Animal` مباشرة داخل `Animal.swift`.

لكن إذا أصبحت بيانات الحيوانات أكثر فأكثر، يمكن أيضًا إنشاء ملف جديد، مثل:

```swift
AnimalData.swift
```

ثم نضع بيانات الحيوانات الثابتة فيه:

```swift
extension Animal {
    static let animals: [Animal] = [
        // بيانات الحيوانات
    ]
}
```

بعد القيام بذلك، يصبح تقسيم مسؤوليات الكود أوضح:

`Animal.swift` مسؤول فقط عن تعريف نموذج الحيوان.

`AnimalData.swift` مسؤول فقط عن حفظ بيانات الحيوانات.

`ContentView.swift` مسؤول فقط عن عرض الواجهة.

تصبح مسؤولية كل ملف أوضح.

انتبه، `AnimalData.swift` هو مجرد اسم ملف، وليس نوع Swift جديدًا. في هذا الملف ما زلنا نستخدم `extension Animal` لإضافة بيانات ثابتة إلى `Animal`.

## الكود الكامل

فيما يلي كود `Animal.swift` بعد التنظيم:

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

كود `AnimalData.swift` بعد التنظيم:

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

في `ContentView.swift`، يمكن استخدامه بهذه الطريقة:

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

ملاحظة: في ملفي `Animal.swift` و`AnimalData.swift`، كتبنا في السطر الأول:

```swift
import Foundation
```

في السابق، عند كتابة واجهات SwiftUI، كنا نستخدم كثيرًا:

```swift
import SwiftUI
```

وذلك لأن `ContentView` و`Text` و`Button` و`Color` كلها مرتبطة بالواجهة، لذلك عند كتابة ملفات الواجهة نحتاج عادةً إلى استيراد SwiftUI.

لكن `Animal.swift` و`AnimalData.swift` هنا ليسا ملفي واجهة، بل يُستخدمان أساسًا لتعريف نموذج الحيوان وحفظ بيانات الحيوانات.

في هذا الكود، يحتاج `UUID()` إلى استخدام `Foundation`، لذلك يكفي استيراد `Foundation`.

## الخلاصة

في هذا الدرس، فعلنا شيئًا واحدًا بشكل أساسي: رتّبنا بيانات الحيوانات ونقلناها خارج `ContentView`.

كانت الطريقة الأصلية هي كتابة بيانات الحيوانات مباشرة داخل `ContentView`. يمكن تشغيل الكود بهذه الطريقة، ولكن عندما تصبح البيانات أكثر، سيصبح ملف العرض أطول فأطول.

بعد التنظيم، أصبح `ContentView` مسؤولًا فقط عن عرض الواجهة، وأصبح `Animal.animals` مسؤولًا عن توفير بيانات الحيوانات.

تعلمنا في هذا الدرس أيضًا مفهومين جديدين.

الأول هو `static`.

يشير `static` إلى خاصية ثابتة. الخاصية الثابتة تنتمي إلى النوع نفسه، ويمكن الوصول إليها مباشرة بطريقة "اسم النوع.اسم الخاصية".

على سبيل المثال:

```swift
Animal.animals
```

الثاني هو `extension`.

يشير `extension` إلى التوسيع. يمكنه تقسيم كود النوع نفسه وكتابته في أماكن منفصلة، مما يجعل بنية الكود أوضح.

في هذا المثال، استخدمنا `extension Animal` لحفظ بيانات الحيوانات، مما جعل بنية `Animal` نفسها أكثر اختصارًا.

بالإضافة إلى ذلك، يحفظ `Animal` نموذج البيانات بشكل أساسي، ولا يكتب واجهة SwiftUI مباشرة، لذلك نستخدم هنا `import Foundation`.

ليست نقطة هذا الدرس أن نجعل الكود أكثر تعقيدًا، بل أن نجعله أسهل قراءة وصيانة.
