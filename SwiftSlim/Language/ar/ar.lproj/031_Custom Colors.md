# الألوان المخصصة

في هذا الدرس، سنتعلم كيفية تخصيص الألوان في SwiftUI.

في الدروس السابقة، استخدمنا بالفعل الألوان الافتراضية التي توفرها SwiftUI، مثل:

```swift
Color.blue
Color.red
Color.green
```

هذه الألوان سهلة الاستخدام، لكنها في تطوير التطبيقات الحقيقية لا تكون دقيقة بما يكفي عادةً.

على سبيل المثال، قد يستخدم التصميم ألوانًا مثل هذه:

```text
#2c54c2
#4875ed
#213e8d
```

هذا النوع من الألوان يسمى ألوان Hex.

في هذا الدرس، سنجعل SwiftUI تدعم ألوان Hex أولًا، ثم سنستخدم `static` لتنظيم الألوان الشائعة.

وفي النهاية، سنطبق الألوان المخصصة على واجهة موسوعة الحيوانات، ونستخدم خلفية متدرجة لجعل الزر يبدو أكثر عمقًا.

## لماذا نحتاج إلى ألوان مخصصة؟

في SwiftUI، يمكننا استخدام ألوان النظام مباشرةً.

على سبيل المثال:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

هنا تشير `.blue` إلى اللون الأزرق، وهي في الحقيقة كتابة مختصرة لـ `Color.blue`.

ميزة الألوان الافتراضية أنها بسيطة ومريحة، لكن خيارات الألوان فيها محدودة نسبيًا.

على سبيل المثال:

```swift
Color.blue
```

يمكنها فقط تمثيل اللون الأزرق الافتراضي الذي توفره SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

لكن في التطوير الفعلي، نحتاج غالبًا إلى ألوان أكثر تحديدًا.

على سبيل المثال، حتى لو كانت الألوان كلها زرقاء، فقد توجد درجات مختلفة مثل الأزرق الفاتح، والأزرق الداكن، والأزرق الرمادي، والأزرق الساطع.

![More Blue](../../../Resource/031_color5.png)

في هذه الحالة، إذا استخدمنا `Color.blue` فقط، فسيكون من الصعب إعادة إنتاج تأثير التصميم بدقة.

لذلك، نحتاج إلى جعل SwiftUI تدعم الألوان المخصصة.

## ما هي ألوان Hex؟

تتكوّن الألوان على الشاشة عادةً من ثلاث قنوات: الأحمر، والأخضر، والأزرق، أي RGB.

تمثل RGB ما يلي:

```text
Red     // الأحمر
Green   // الأخضر
Blue    // الأزرق
```

لون Hex هو طريقة من طرق تمثيل ألوان RGB.

على سبيل المثال:

```swift
#5479FF
```

يمكن فهم قيمة اللون هذه ببساطة على أنها ثلاثة أجزاء:

```text
54  // يمثل قناة اللون الأحمر
79  // يمثل قناة اللون الأخضر
FF  // يمثل قناة اللون الأزرق
```

في هذا الدرس، لا نحتاج إلى حساب هذه القيم، ولا نحتاج إلى فهم قواعد النظام الست عشري بعمق.

الآن نحتاج فقط إلى معرفة أن: `#5479FF` يمثل لونًا محددًا.

لاحقًا، عندما نرى صيغًا مثل `#2c54c2` أو `#4875ed`، يمكننا أولًا فهمها على أنها قيمة لون.

في أدوات التصميم مثل Sketch و Figma و Photoshop، يمكننا أيضًا رؤية قيم ألوان مشابهة كثيرًا.

![color](../../../Resource/031_color.png)

لكن SwiftUI لا تسمح افتراضيًا بكتابة ذلك مباشرةً:

```swift
Color(hex: "#5479FF")
```

لذلك، نحتاج إلى توسيع نوع `Color` بأنفسنا، حتى يدعم إنشاء الألوان من سلسلة Hex.

## إنشاء ملف Color+Hex.swift

أولًا، ننشئ ملف Swift جديدًا.

يمكن أن يكون اسم الملف:

```text
Color.swift
```

أو يمكن كتابته بشكل أوضح:

```text
Color+Hex.swift
```

هنا نوصي أكثر باستخدام:

```text
Color+Hex.swift
```

في مشاريع Swift، أسماء الملفات مثل `Color+Hex.swift` شائعة جدًا.

وهي تعني أن هذا الملف هو ملف امتداد يضيف قدرة Hex إلى `Color`.

اسم الملف لا يؤثر مباشرةً في تشغيل الكود، لكنه يجعلنا نفهم وظيفة الملف بسهولة أكبر.

## إضافة كود Color(hex:)

في ملف `Color+Hex.swift`، اكتب الكود التالي:

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

هذا الكود يستخدم `extension` لتوسيع نوع `Color`، ويضيف إلى `Color` طريقة تهيئة جديدة:

```swift
init(hex: String)
```

بعد وجود طريقة التهيئة هذه، يمكننا تمرير سلسلة Hex إلى `Color`، وبذلك ننشئ لونًا مخصصًا:

```swift
Color(hex: "#5479FF")
```

داخل كود الامتداد هذا، سيتم تحويل سلسلة Hex إلى لون RGB يمكن لـ SwiftUI التعرف عليه.

في هذه المرحلة، لا نحتاج إلى فهم منطق التحويل في كل سطر بعمق. يكفي أن نعرف أن طريقة `Color(hex:)` المضافة تسمح لنا بإنشاء ألوان مخصصة عبر قيم ألوان Hex.

## استخدام الألوان المخصصة

الآن، يمكننا اختبار الألوان المخصصة في `ContentView`.

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

نتيجة العرض:

![color](../../../Resource/031_color1.png)

في هذا المثال، يستخدم السطر الأول لونًا من ألوان النظام:

```swift
.foregroundStyle(Color.blue)
```

أما الأسطر الثلاثة التالية فتستخدم ألوان Hex مخصصة:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

من خلال المقارنة، يمكننا ملاحظة أن اللون الأزرق في النظام له تأثير افتراضي واحد فقط.

أما ألوان Hex فيمكنها تمثيل تغييرات أكثر دقة في درجات الأزرق.

هذه هي قيمة الألوان المخصصة: فهي تجعل ألوان الواجهة أقرب إلى التصميم الحقيقي، كما تجعل التحكم في الأسلوب البصري للتطبيق أكثر سهولة.

## استخدام static لتنظيم الألوان

الآن، يمكننا إنشاء الألوان عبر سلسلة Hex:

```swift
Color(hex: "#2c54c2")
```

هذه الكتابة تعمل بشكل طبيعي، لكن إذا تكرر اللون نفسه في أماكن متعددة، فستصبح الصيانة لاحقًا أقل راحة.

إذا كتبنا قيمة اللون هذه في 10 أماكن، ثم أردنا لاحقًا تعديل هذا اللون الأزرق، فسنحتاج إلى تعديلها واحدًا واحدًا.

في هذه الحالة، يمكننا استخدام `static` لتنظيم الألوان الشائعة في مكان واحد.

في أسفل ملف `Color+Hex.swift`، تابع إضافة الكود التالي:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

هنا أضفنا إلى `Color` ثلاث خصائص ساكنة: `animalBlue` و `animalLightBlue` و `animalDarkBlue`، وهي تمثل درجات مختلفة من اللون الأزرق.

لأن هذه الخصائص تستخدم `static`، فهي تنتمي إلى نوع `Color` نفسه.

عند الاستخدام، يمكن الوصول إليها مباشرةً عبر `Color.`:

```swift
Color.animalBlue
```

هذه الكتابة أوضح من كتابة سلسلة Hex مباشرةً.

عندما نرى `Color.animalBlue`، يمكننا معرفة أنه يمثل اللون الأزرق المستخدم في موسوعة الحيوانات.

أما عندما نرى `Color(hex: "#2c54c2")`، فنحن نعرف فقط أنها قيمة لون، لكن لا يكون من السهل معرفة استخدامها المحدد.

توحيد إدارة الألوان له فائدة أخرى أيضًا: يجعل التعديل لاحقًا أكثر سهولة.

إذا أردنا تعديل اللون الرئيسي لموسوعة الحيوانات، نحتاج فقط إلى تعديل موضع التعريف:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

كل الأماكن التي تستخدم هذا اللون ستتحدث معًا.

هذا هو معنى استخدام `static` لتنظيم الألوان: جعل أسماء الألوان أوضح، وجعل الصيانة اللاحقة أسهل.

## التطبيق على موسوعة الحيوانات

الآن، يمكننا تطبيق الألوان المخصصة على واجهة موسوعة الحيوانات السابقة.

كان لون خلفية زر الحيوان سابقًا أبيض:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

الآن، يمكننا تغييره إلى لون مخصص:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

هنا، `Color.animalBlue` هو اللون الساكن الذي عرّفناه قبل قليل في `Color+Hex.swift`.

يستخدم نص الزر اللون الأبيض:

```swift
.foregroundStyle(Color.white)
```

وتستخدم خلفية رمز emoji للحيوان لونًا أبيض نصف شفاف:

```swift
.background(Color.white.opacity(0.15))
```

بهذا سيكوّن الزر أسلوبًا بصريًا أزرق موحدًا.

تركيز هذه الخطوة ليس إضافة كود معقد، بل تطبيق الألوان المخصصة التي تعلمناها سابقًا في الواجهة فعلًا.

## استخدام خلفية متدرجة

إلى جانب استخدام لون واحد، يمكننا أيضًا دمج عدة ألوان لإنشاء تأثير متدرج.

على سبيل المثال، عرّفنا الألوان التالية سابقًا:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

هذه الألوان لا يمكن استخدامها بشكل منفصل فقط، بل يمكن أيضًا دمجها في خلفية متدرجة.

في SwiftUI، يمكن استخدام `LinearGradient` لإنشاء تدرج خطي.

على سبيل المثال:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

هذا الكود ينشئ خلفية متدرجة من اليسار إلى اليمين، حيث ينتقل اللون تدريجيًا من `Color.animalBlue` إلى `Color.animalLightBlue`.

من بينها، تُستخدم `colors` لتعيين الألوان المشاركة في التدرج، وتُستخدم `startPoint` و `endPoint` للتحكم في اتجاه التدرج.

### اختبار تأثير التدرج

يمكننا استخدام `Text` بسيط لاختبار الخلفية المتدرجة.

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

نتيجة العرض:

![color](../../../Resource/031_color3.png)

في هذا المثال، لم تعد خلفية `Text` لونًا واحدًا، بل أصبحت لونًا متدرجًا يتغير تدريجيًا من اليسار إلى اليمين.

مقارنةً بالخلفية العادية، تجعل الخلفية المتدرجة الواجهة أكثر عمقًا، كما تسهل إنشاء نقطة تركيز بصرية.

## استخدام خلفية متدرجة في موسوعة الحيوانات

الآن، يمكننا تغيير لون خلفية زر الحيوان من:

```swift
.background(Color.animalBlue)
```

إلى خلفية متدرجة:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

الكود الكامل كما يلي:

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

نتيجة العرض:

![color](../../../Resource/031_color4.png)

الآن، لم يعد زر الحيوان يمتلك لون خلفية واحدًا فقط، بل أصبح لديه تأثير متدرج من اليسار إلى اليمين.

مقارنةً بالخلفية أحادية اللون، يمكن للخلفية المتدرجة أن تجعل الواجهة تبدو أكثر عمقًا، كما تجعلها أقرب إلى التصميم البصري في التطبيقات الحقيقية.

## الفرق بين الخلفية أحادية اللون والخلفية المتدرجة

الخلفية أحادية اللون تستخدم لونًا واحدًا فقط.

على سبيل المثال:

```swift
.background(Color.animalBlue)
```

هذه الكتابة بسيطة وواضحة، وتناسب معظم الواجهات الأساسية.

الخلفية المتدرجة تستخدم عدة ألوان.

على سبيل المثال:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

هذه الكتابة يمكنها جعل الواجهة أكثر عمقًا، لكنها قد تزيد التعقيد البصري بسهولة أكبر أيضًا.

لذلك، في التطوير الفعلي، يمكن فهم الأمر بهذه الطريقة:

الخلفية أحادية اللون مناسبة للنصوص العادية، والأزرار العادية، والبطاقات العادية، وخلفيات الصفحات العادية.

الخلفية المتدرجة مناسبة للأزرار المهمة، والمناطق العلوية، وبطاقات الغلاف، ومداخل الوظائف، وغيرها من المواضع التي تحتاج إلى إبراز.

## الخلاصة

في هذا الدرس، تعلمنا كيفية استخدام الألوان المخصصة في SwiftUI.

أولًا، تعرفنا على ألوان Hex.

على سبيل المثال:

```text
#2c54c2
```

إنها تمثل لونًا محددًا.

ثم استخدمنا `extension Color` لتوسيع نوع `Color`.

وبذلك أصبح بإمكان SwiftUI إنشاء الألوان بالطريقة التالية:

```swift
Color(hex: "#2c54c2")
```

بعد ذلك، استخدمنا `static` لتنظيم الألوان الشائعة:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

بهذا يمكن استخدامه مباشرةً في الواجهات الأخرى:

```swift
Color.animalBlue
```

مقارنةً بكتابة سلسلة Hex في كل مرة، هذه الطريقة أوضح وأسهل عند تعديل الألوان بشكل موحد لاحقًا.

أخيرًا، تعلمنا `LinearGradient`، ودمجنا الألوان المخصصة في خلفية متدرجة:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

من خلال هذا الدرس، أكملنا العملية من "إنشاء ألوان مخصصة" إلى "استخدام الألوان في واجهة حقيقية".

لاحقًا، عندما نحتاج إلى استخدام لون معين في عدة أماكن، يمكننا أولًا التفكير في تنظيمه داخل امتداد `Color`.

بهذه الطريقة يصبح الكود أوضح، ويصبح توحيد أسلوب الواجهة أسهل أيضًا.
