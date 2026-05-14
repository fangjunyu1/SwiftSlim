# العرض المخصص

في هذا الدرس، سنتعلّم صيغة مهمة جدًا في SwiftUI: **العرض المخصص**.

يمكن للعرض المخصص تغليف جزء متكرر من كود الواجهة، وتحويله إلى عرض يمكن استخدامه مرارًا.

عند تطوير التطبيقات فعليًا، نواجه كثيرًا هذا الموقف: تكون بنية الكثير من الواجهات متشابهة، لكن المحتوى المعروض مختلف.

مثلًا، في قائمة منشورات موقع منتدى، قد يحتوي كل منشور على عنوان وصورة وعدد الإعجابات ومعلومات أخرى.

![Reddit](../../../Resource/028_view1.png)

وفي قائمة منتجات موقع تسوّق، قد يحتوي كل منتج على صورة واسم وسعر ومعلومات أخرى.

![Amazon](../../../Resource/028_view2.png)

بنية هذه العناصر متشابهة، والاختلاف يكون فقط في البيانات المعروضة.

إذا كتبنا كود كل عنصر يدويًا، سيصبح الكود طويلًا جدًا، ولن يكون تعديلُه لاحقًا مريحًا.

لذلك، يمكننا تغليف البنية المتشابهة في عرض مخصص، ثم تمرير المحتوى المختلف إليه كمعاملات.

بهذه الطريقة، يمكن للعرض نفسه عرض محتوى مختلف.

## سيناريو المتطلب

مثلًا، نريد الآن إنشاء قائمة إعدادات.

النتيجة المعروضة:

![العرض](../../../Resource/028_view.png)

في قائمة الإعدادات هذه، توجد ثلاثة عناصر إعداد مختلفة، وهي `Settings` و `Folder` و `Music`.

على الرغم من أن الأيقونة واللون والعنوان تختلف بينها، فإن البنية العامة واحدة:

- الأيقونة في الجهة اليسرى
- لون خلفية الأيقونة
- العنوان في الوسط
- السهم في الجهة اليمنى

إذا لم نستخدم عرضًا مخصصًا، فقد نكتب الكود بهذا الشكل:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Settings")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Folder")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Music")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

يمكن لهذا الكود أن يعرض الواجهة بشكل طبيعي، لكن المشكلة واضحة أيضًا: كود عناصر الإعداد الثلاثة متطابق تقريبًا.

الأجزاء المختلفة هي الأيقونة واللون والعنوان فقط:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Settings")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Music")
```

أي أن بنية كل عنصر إعداد ثابتة، ولا يختلف إلا الأيقونة واللون والعنوان.

هذا النوع من الحالات مناسب جدًا لاستخدام العرض المخصص.

### الظل shadow

هنا استخدمنا مُعدِّلًا جديدًا هو `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

يمكن لـ `.shadow(radius:)` إضافة ظل إلى العرض.

يشير `radius` إلى نصف قطر تمويه الظل. كلما زادت القيمة، غالبًا زاد نطاق انتشار الظل، وبدا أكثر نعومة.

هنا عيّنّاه إلى `1`، أي إضافة تأثير ظل خفيف جدًا فقط.

## تغليف عرض عنصر الإعداد

بعد ذلك، سنغلّف كل عنصر إعداد في عرض جديد.

يمكننا إنشاء `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

في هذا العرض، عرّفنا ثلاث خصائص:

```swift
let icon: String
let color: Color
let title: String
```

وهي:

- `icon` يمثّل اسم الأيقونة
- `color` يمثّل لون خلفية الأيقونة
- `title` يمثّل عنوان عنصر الإعداد

لأن هذه المحتويات الثلاثة تختلف بين عناصر الإعداد المختلفة، نجعلها معاملات يمكن تمريرها من الخارج.

## استخدام العرض المخصص

بعد أن أصبح لدينا `SettingItemView`، لم نعد بحاجة إلى تكرار كتابة كتلة كبيرة من كود `HStack`.

يمكننا الآن استخدامه بهذا الشكل:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

يعني هذا السطر إنشاء عرض عنصر إعداد، وتمرير ثلاثة معاملات إليه:

```swift
icon: "gear"
color: Color.blue
title: "Settings"
```

بعد تمريرها، ستحصل الخصائص داخل `SettingItemView` على القيم المقابلة:

- قيمة `icon` هي `gear`
- قيمة `color` هي `Color.blue`
- قيمة `title` هي `"Settings"`

لذلك، سيعرض `Image(systemName: icon)` داخل العرض أيقونة الترس، وستستخدم `.background(color)` خلفية زرقاء، وسيعرض `Text(title)` النص `Settings`.

الكود الكامل:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Settings")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

النتيجة المعروضة:

![العرض](../../../Resource/028_view.png)

يمكن أن نلاحظ أن النتيجة بعد التغليف هي نفسها كما كانت من قبل، لكن الكود أصبح أوضح.

في السابق، كان كل عنصر إعداد يحتاج إلى كتابة كتلة `HStack` كاملة، أما الآن فنحتاج إلى سطر واحد فقط من الكود:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

هذه هي وظيفة العرض المخصص: **تغليف بنية العرض المتكررة، وتمرير المحتوى المختلف فقط كمعاملات.**

## لماذا يمكن تمرير المعاملات

بعد ذلك، لنفهم ببساطة لماذا يمكن للعرض المخصص استقبال المعاملات.

في SwiftUI، العرض في جوهره هو بنية.

مثلًا:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

هنا `ContentView` هو بنية.

عندما نكتب:

```swift
ContentView()
```

فهذا في الحقيقة يعني إنشاء عرض `ContentView`.

تشير الأقواس `()` في النهاية إلى استدعاء طريقة التهيئة الخاصة به، ويمكن أيضًا فهمها على أنها إنشاء هذا العرض.

لأن `ContentView` هذا لا يحتوي على خصائص تحتاج إلى تمريرها من الخارج، يمكننا كتابة:

```swift
ContentView()
```

لكن إذا كان في العرض خصائص لم تُعطَ قيمًا، فيجب تمرير القيم المقابلة عند إنشاء العرض.

مثلًا:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

هنا `name` خاصية، وليست لها قيمة افتراضية.

لذلك عند إنشاء `ContentView`، يجب إعطاء `name` قيمة محددة:

```swift
ContentView(name: "Fang Junyu")
```

بهذه الطريقة، يمكن استخدام هذه القيمة داخل العرض:

```swift
Text("name: \(name)")
```

وهذا هو السبب أيضًا في أننا نحتاج إلى تمرير المعاملات عند إنشاء `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

لأن `SettingItemView` يحتوي على ثلاث خصائص ليست لها قيم افتراضية:

```swift
let icon: String
let color: Color
let title: String
```

لذلك عند إنشاء هذا العرض، يجب تمريرها إليه. سيستخدم Swift المعاملات التي تم تمريرها لإسناد القيم إلى الخصائص داخل العرض.

## طريقة التهيئة

بعد ذلك، لنفهم طريقة التهيئة بصورة أعمق قليلًا.

### طريقة التهيئة الافتراضية

عندما نعرّف عرضًا عاديًا:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

في هذا الكود، لم نكتب طريقة التهيئة يدويًا.

لكن عندما نستخدم هذا العرض، يمكننا كتابة:

```swift
ContentView()
```

هنا تعني `()` في الحقيقة إنشاء `ContentView`، ويمكن فهمها أيضًا على أنها استدعاء طريقة التهيئة الخاصة به.

### لماذا يمكن الاستدعاء رغم عدم وجود طريقة تهيئة مكتوبة؟

لأن مترجم Swift ينشئ لنا طريقة تهيئة تلقائيًا.

يجب الانتباه إلى أن **طريقة التهيئة هذه تُنشأ تلقائيًا، وعادةً لا نراها مباشرة في الكود.**

أي أننا، رغم أننا لم نكتب يدويًا داخل `struct`:

```swift
init() {

}
```

إلا أن مترجم Swift ينشئ في الخلفية طريقة تهيئة شبيهة بهذا الشكل:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hello, World!")
    }
}
```

ولهذا السبب يمكننا كتابة:

```swift
ContentView()
```

لذلك، في الكود الفعلي، لا نحتاج غالبًا إلى كتابة طريقة التهيئة يدويًا.

نحتاج فقط إلى فهم نقطة واحدة: **عند إنشاء عرض SwiftUI، يتم استدعاء طريقة التهيئة الخاصة بالعرض. وحتى إذا لم نكتب طريقة التهيئة يدويًا، فقد ينشئها Swift تلقائيًا.**

### طريقة التهيئة ذات المعاملات

إذا كان في العرض خاصية ليست لها قيمة افتراضية، مثل:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

سينشئ مترجم Swift، اعتمادًا على الخصائص، طريقة تهيئة ذات معاملات تلقائيًا.

يمكن فهمها ببساطة بهذا الشكل:

```swift
init(name: String) {
    self.name = name
}
```

هنا:

```swift
init(name: String)
```

يعني أنه عند إنشاء `ContentView`، يجب تمرير معامل `name` من نوع `String`.

عندما نكتب:

```swift
ContentView(name: "Fang Junyu")
```

فالمعنى هو: تمرير `"Fang Junyu"` كمعامل إلى طريقة التهيئة.

بعد ذلك، سينفّذ داخل طريقة التهيئة:

```swift
self.name = name
```

معنى هذا السطر هو: إسناد قيمة `name` القادمة من الخارج إلى خاصية `name` الخاصة بالعرض الحالي.

يمكن فهم ذلك ببساطة هكذا:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("name: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

بهذه الطريقة، يمكن للعرض استخدام القيمة التي مُرّرت إليه داخله.

هذا هو مسار تهيئة العرض ذي المعاملات: **عندما لا تكون للخصائص داخل العرض قيم افتراضية، يجب تمرير المعاملات المقابلة عند إنشاء العرض، حتى تكمل طريقة التهيئة إسناد القيم إلى الخصائص.**

## حالة وجود قيمة افتراضية للخاصية

إذا كانت الخاصية لها قيمة افتراضية بالفعل، فيمكن إنشاء العرض من دون تمرير معامل.

مثلًا:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("name: \(name)")
    }
}
```

هنا للخاصية `name` قيمة افتراضية بالفعل:

```swift
"Fang Junyu"
```

لذلك عند إنشاء `ContentView`، يمكننا كتابة:

```swift
ContentView()
```

في هذه الحالة، سيستخدم `name` القيمة الافتراضية، وستعرض الواجهة:

```swift
name: Fang Junyu
```

وبالطبع، يمكن أيضًا تمرير قيمة جديدة عند إنشاء العرض:

```swift
ContentView(name: "Sam")
```

في هذه الحالة، سيستخدم العرض قيمة `"Sam"` التي مُرّرت من الخارج، بدلًا من استخدام القيمة الافتراضية، وستعرض الواجهة:

```swift
name: Sam
```

ولتسهيل الفهم، يمكننا النظر إلى طريقة التهيئة التي ينشئها مترجم Swift تلقائيًا على أنها شبيهة بهذا الشكل:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

هنا `name: String = "Fang Junyu"` يعني: إذا لم نمرر `name` عند إنشاء العرض، فسيتم استخدام القيمة الافتراضية `"Fang Junyu"`؛ وإذا مررنا قيمة جديدة عند إنشاء العرض، فسيتم استخدام القيمة التي مُرّرت.

أي: **إذا لم يمرر الخارج معاملًا، فسيتم استخدام القيمة الافتراضية للخاصية؛ وإذا مرر الخارج معاملًا، فسيتم استخدام القيمة التي مُرّرت.**

## العودة إلى SettingItemView

الآن لنعد وننظر مرة أخرى إلى SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

بنية هذا العرض ثابتة.

الأجزاء الثابتة تشمل:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

أما الأجزاء المختلفة فتشمل:

```swift
icon
color
title
```

لذلك، نجعل المحتوى المختلف خصائص، ونمرره عبر المعاملات عند إنشاء العرض.

عندما ننشئ عناصر إعداد مختلفة، نحتاج فقط إلى تمرير معاملات مختلفة:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
```

بهذه الطريقة، يمكن لنفس `SettingItemView` عرض ثلاثة عناصر إعداد مختلفة.

هذه هي أكثر طريقة شائعة لاستخدام العرض المخصص.

## الخلاصة

في هذا الدرس، تعلّمنا العرض المخصص.

الدور الأساسي للعرض المخصص هو: **تغليف كود العرض المتكرر حتى يمكن إعادة استخدامه.**

في هذا المثال، بنية عناصر الإعداد الثلاثة واحدة، ولا يختلف إلا الأيقونة واللون والعنوان.

لذلك أنشأنا `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ثم عند استخدام هذا العرض، نمرر معاملات مختلفة:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

ستدخل هذه المعاملات إلى داخل `SettingItemView`.

وبهذه الطريقة، يمكننا استخدام كود أقل لإنشاء عروض لها البنية نفسها ولكن بمحتوى مختلف.

وهذه أيضًا صيغة شائعة جدًا في تطوير SwiftUI.
