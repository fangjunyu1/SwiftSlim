# فهم الواجهات

في هذا الدرس، نعود مرة أخرى إلى `ContentView` الذي بدأنا منه.

```swift
struct ContentView: View {
    var body: some View {
        Text("مرحبًا بالعالم!")
    }
}
```

عندما تعرّفنا على SwiftUI لأول مرة، كانت هناك كلمات كثيرة داخل `ContentView` لم نكن نفهمها.

مثل `struct` و`View` و`var` و`body` و`some View` وغيرها من الكلمات المفتاحية.

في ذلك الوقت، ربما كنا نعرف فقط: **إذا كتبنا الكود داخل `body`، فسيظهر المحتوى على الواجهة.**

والآن، بعد أن تعلّمنا `struct` والمتغيرات والدوال والبروتوكولات، يمكننا إعادة فهم هذا الكود، ليساعدنا ذلك على فهم العلاقة بين واجهات SwiftUI.

## مراجعة ContentView

بعد إنشاء مشروع SwiftUI، ينشئ Xcode افتراضيًا ملفًا باسم `ContentView`.

الكود المثال هو:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("مرحبًا بالعالم!")
        }
        .padding()
    }
}
```

يمكن فهم هذا الكود من خلال تقسيمه إلى عدة أجزاء.

أولًا:

```swift
import SwiftUI
```

يعني هذا السطر استيراد إطار عمل SwiftUI.

بعد استيراد SwiftUI، يمكننا استخدام واجهات SwiftUI مثل `View` و`Text` و`Image` و`VStack` و`Button`.

## بنية ContentView

يمثّل هذا السطر إنشاء بنية:

```swift
struct ContentView: View
```

ومن بينها:

```swift
struct ContentView
```

تعني أن `ContentView` هي بنية.

في الدرس السابق تعرّفنا إلى بنية `struct`، وهي تستطيع جمع حقول مختلفة ذات صلة معًا، كما يمكنها أن تحتوي على خصائص ودوال.

على سبيل المثال:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("مرحبًا بالعالم!")
    }
}
```

في هذا المثال، يحتوي `ContentView` على ثلاثة أشياء: `name` و`printName` و`body`.

أي إن `struct` يمكنه جمع الخصائص والدوال ومحتوى الواجهة المرتبط بها في مكان واحد.

![contentView](../../Resource/023_contentVIew.png)

## View هو بروتوكول

نواصل النظر إلى هذا السطر:

```swift
struct ContentView: View 
```

يشير `View` بعد النقطتين إلى أن `ContentView` يلتزم ببروتوكول `View`.

يمكن فهم ذلك على أن `ContentView` إذا أراد أن يصبح واجهة SwiftUI، فعليه أن يحقق متطلبات بروتوكول `View`.

### بروتوكول Identifiable

عندما تعلّمنا قائمة الأفلام سابقًا، تعاملنا مع بروتوكول `Identifiable`.

في ذلك الوقت كنا نحتاج إلى المرور على مصفوفة `Movie` داخل `ForEach`، لكن بنية `Movie` لم تكن تملك معرّفًا فريدًا، لذلك لم تكن تدعم المرور عليها باستخدام `ForEach`.

عندها احتجنا إلى جعل بنية `Movie` تلتزم ببروتوكول `Identifiable`، حتى تحقق متطلب `ForEach` الخاص بالمعرّف الفريد.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

يتطلب بروتوكول `Identifiable`: **أن يمتلك هذا النوع حقل `id` يعرّفه.**

بعد أن يوفّر `Movie` حقل `id`، يصبح قادرًا على تلبية متطلبات `Identifiable`.

وهكذا، عندما نستخدمه في `ForEach`، يستطيع SwiftUI تمييز كل عنصر من البيانات.

```swift
ForEach(lists) { movie in
    // ...
}
```

### بروتوكول View

وينطبق الأمر نفسه على بروتوكول `View`.

إذا أراد نوع ما أن يصبح واجهة SwiftUI، فيجب أن يلتزم ببروتوكول `View`.

وأهم متطلب في بروتوكول `View` هو توفير `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("مرحبًا بالعالم!")
    }
}
```

يمكن فهم متطلب بروتوكول `View` هكذا: **يقبل فقط واجهة SwiftUI التي يعيدها `body`، أما `ContentView` فيعرض واجهة SwiftUI من خلال `body`.**

### ماذا يحدث إذا لم نلتزم بـ View؟

إذا كتبنا هكذا:

```swift
struct ContentView {
}
```

فهذه مجرد بنية عادية، وليست واجهة SwiftUI.

لن يحدث خطأ مباشرة، لأن البنية العادية بحد ذاتها كود Swift صحيح.

لكن إذا وضعناها داخل المعاينة:

```swift
#Preview {
    ContentView()
}
```

فسيظهر خطأ في هذه الحالة.

والسبب هو: **المعاينة تحتاج إلى عرض واجهة SwiftUI، بينما هذا `ContentView` لا يلتزم ببروتوكول `View`.**

لذلك، إذا أردنا أن يظهر `ContentView` على الواجهة، فعلينا أن نجعله يلتزم ببروتوكول `View`:

```swift
struct ContentView: View {
}
```

وفي الوقت نفسه، يجب توفير `body` كما يطلب بروتوكول `View`؛ وإذا لم يكن هناك `body` فسيظل المترجم يعرض خطأ.

الكتابة الصحيحة:

```swift
struct ContentView: View {
    var body: some View {
        Text("مرحبًا بالعالم!")
    }
}
```

عندها فقط يصبح `ContentView` واجهة SwiftUI حقيقية يمكن عرضها.

## body هو مدخل عرض الواجهة

في SwiftUI، يعد `body` مدخل محتوى الواجهة.

```swift
var body: some View {
    Text("مرحبًا بالعالم!")
}
```

يمكن تقسيمه هنا إلى ثلاثة أجزاء:

**1. var body**

```swift
var body
```

يعني تعريف متغير باسم `body`.

**2. some View**

```swift
: some View
```

يعني أن هذا `body` سيعيد واجهة.

**3. { ... }**

```swift
{
    Text("مرحبًا بالعالم!")
}
```

يمثل محتوى الواجهة المعروض، وفي هذا الكود المعروض هو واجهة `Text`.

أي إن ما نكتبه داخل `body` هو ما سيظهر على الواجهة.

على سبيل المثال:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("الاسم:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

يعني هذا الكود: **تعرض الواجهة محتوى مرتبًا عموديًا، وفيه نصان.**

### لا يمكن تغيير اسم body عشوائيًا

يجب الانتباه إلى أن اسم `body` لا يمكن تغييره عشوائيًا.

إذا كتبناه هكذا:

```swift
struct ContentView: View {
    var content: some View {
        Text("مرحبًا بالعالم!")
    }
}
```

فإن `content`، رغم أنه خاصية واجهة أيضًا، لا يمكنه أن يحل محل `body`.

لأن الاسم الذي يطلبه بروتوكول `View` هو `body`.

## ما معنى some View؟

في SwiftUI، يعني `some View` إعادة واجهة محددة، لكن من دون الحاجة إلى كتابة النوع الكامل لتلك الواجهة.

```swift
var body: some View
```

أي إن `some View` لا يعني عدم وجود نوع، فالنوع الحقيقي ما زال موجودًا، والمترجم يعرف هذا النوع، لكن هذا النوع قد يكون معقدًا، لذلك يسمح Swift لنا باستخدام `some View` لإخفائه.

### ما هو some؟

في Swift، تعد `some` كلمة مفتاحية لإعلان النوع غير الشفاف (opaque type).

معنى النوع غير الشفاف هو: **القيمة المعادة لها نوع محدد، والمترجم يعرف هذا النوع المحدد، لكننا لا نكتب هذا النوع مباشرة.**

على سبيل المثال:

```swift
func makeView() -> some View {
    Text("مرحبًا")
}
```

يعني ذلك أن `makeView` ستعيد نوعًا محددًا يلتزم ببروتوكول `View`.

### لماذا نحتاج إلى some؟

عند تعلّم المتغيرات، عرفنا أن: **القيم في Swift تحتاج إلى توضيح نوعها صراحة، أو أن يستنتج المترجم نوعها تلقائيًا.**

على سبيل المثال:

```swift
let a: Int = 10
```

الثابت `a` هنا من النوع `Int`.

واجهات SwiftUI ليست استثناءً، فعندما نستخدم `body` لعرض واجهة SwiftUI، يجب أن نجعل `body` يعيد نوع SwiftUI المناسب.

مثلًا، إذا استخدمنا `body` لعرض واجهة نصية `Text`، فعلينا أن نجعل `body` يعيد النوع `Text` المقابل.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

في هذا المثال، ما يظهر داخل `body` هو واجهة `Text`، والنوع المعاد هو أيضًا `Text`.

فقط عندما يكون النوع الداخلي متوافقًا مع النوع المعلن، يتحقق شرط اتساق النوع لدى المترجم.

**مشكلة عدم اتساق النوع**

إذا عيّنا نوع `body` إلى `Color`، لكن المعروض كان `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

فإن نوع `body` لا يتوافق مع نوع الكود الداخلي، وبالتالي يظهر خطأ عدم اتساق النوع.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

في هذه الحالة، نحتاج إلى تعديل نوع الإرجاع في `body` يدويًا.

**أنواع الواجهات المعقدة**

في التطوير الفعلي، لا تكون الواجهة عادة مجرد `Text` واحد.

إذا أردنا عرض `VStack` أكثر تعقيدًا، فسنحتاج إلى توضيح نوع الإرجاع المعقد يدويًا.

على سبيل المثال:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("مرحبًا بالعالم!")
    }
}
```

يعني هذا الكود إعادة `VStack`، وداخل `VStack` توجد واجهات من نوع `Image` و`Text`.

نوع الإرجاع في `body` هو:

```swift
VStack<TupleView<(Image,Text)>>
```

يمكننا أن نرى أن نوع الإرجاع هذا معقد جدًا، كما يظهر فيه `TupleView` الذي لم نره من قبل.

يمكن فهم `TupleView` هنا على أنه: **يمثل تغليف عدة واجهات فرعية داخل واجهة واحدة.**

**أنواع واجهات أكثر تعقيدًا**

إذا أضفنا معدّلات إلى الواجهة:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("مرحبًا بالعالم!")
    }
    .padding()
}
```

عندها يصبح نوع إرجاع هذه الواجهة معقدًا جدًا، ولا يمكن وصفه هنا بالتفصيل.

وسيفشل نوع الإرجاع الحالي `VStack<TupleView<(Image,Text)>>` لأنه لا يستطيع وصف المعدّلات، مما يؤدي إلى خطأ.

**تبسيط نوع الإرجاع باستخدام some View**

في هذه الحالة، يقدم SwiftUI حلًا بسيطًا، وهو استخدام `some View` لتبسيط الكتابة.

عندما نغير `body` إلى النوع `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("مرحبًا بالعالم!")
    }
    .padding()
}
```

لن نحتاج في كل مرة نعدّل فيها كود الواجهة إلى كتابة نوع الإرجاع الكامل.

لأن `some View` يعني إرجاع واجهة محددة تلتزم ببروتوكول `View`.

بعبارة أخرى، واجهات SwiftUI مثل `VStack` و`Image` كلها واجهات تلتزم ببروتوكول `View`. وبعد إضافة المعدّلات، يظل نوع الواجهة المعاد ملتزمًا ببروتوكول `View`.

لذلك يمكن إرجاعها جميعًا بوصفها `some View`.

### some View لا يمكنه إرجاع أي واجهة عشوائيًا

رغم أن `some View` يستطيع إخفاء الأنواع المعقدة، فإنه ليس "بلا نوع".

قاعدته الأساسية هي: **يجب أن يستطيع المترجم تحديد نوع إرجاع محدد.**

على سبيل المثال:

```swift
var title: some View {
    Text("مرحبًا")
}
```

هنا القيمة المعادة هي واجهة `Text`.

لكن إذا حاولنا إرجاع واجهتين، فسيحدث خطأ:

```swift
var title: some View {
    Text("مرحبًا")
    Image(systemName: "star")
}
```

لأن `some View` يحتاج في النهاية إلى إرجاع بنية واجهة واحدة، بينما نحاول هنا إرجاع واجهتين مستقلتين.

### الحل

عادة توجد طريقتان للحل: الحاوية و`@ViewBuilder`.

**1. استخدام حاوية للتغليف**

```swift
var title: some View {
    VStack {
        Text("مرحبًا")
        Image(systemName: "star")
    }
}
```

في هذا الكود، يعيد `title` واجهة `VStack`، أما `Text` و`Image` فهما واجهتان فرعيتان داخل `VStack`.

بنية الواجهة التي يستقبلها `some View` هي `VStack<...>`، وبذلك تتحقق قاعدة إرجاع بنية واجهة واحدة في `some View`. 

وهذا هو السبب في أننا منذ بداية تعلّم SwiftUI نوصي باستخدام حاوية `VStack` في الطبقة الخارجية لتغليف كود الواجهة.

**2. استخدام @ViewBuilder**

يمكننا أيضًا إضافة المعدّل `@ViewBuilder` قبل `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("مرحبًا")
    Image(systemName: "star")
}
```

يستطيع `@ViewBuilder` دمج عدة واجهات في نتيجة إرجاع واحدة.

وجوهره ما زال هو دمج عدة واجهات في واجهة واحدة، لتلبية متطلب `some View` الخاص بإرجاع بنية واجهة واحدة.

### لماذا يمكن لـ body كتابة عدة واجهات مباشرة؟

إذا كتبنا عدة واجهات داخل `var body`، مثلًا:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("مرحبًا بالعالم!")
}
```

في بعض الحالات، لن يحدث خطأ في هذا `body`.

والسبب هو أن `body` في بروتوكول `View` يدعم `@ViewBuilder` افتراضيًا:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

في كود مصدر بروتوكول `View`، يمكننا أن نرى أن `@ViewBuilder` يسبق متغير `body`.

لذلك يمتلك `body` طبقة معالجة خاصة أكثر من `some View` العادي، مما يجعل SwiftUI يدمج عدة واجهات تلقائيًا في واجهة واحدة.

**يوصى باستخدام الحاويات**

حتى يكون الأمر أسهل على المبتدئين، ننصح أولًا باستخدام حاويات مثل `VStack` و`HStack` و`ZStack` و`Group` لتنظيم عدة واجهات.

على سبيل المثال:

```swift
var body: some View {
    VStack {
        Text("مرحبًا")
        Image(systemName: "star")
    }
}
```

هكذا يصبح الكود أوضح: **الطبقة الخارجية هي `VStack`، وداخلها واجهتان فرعيتان.**

## تقسيم الواجهة

إذا كانت الواجهة بسيطة، فيمكننا كتابة كل الكود داخل `body`.

على سبيل المثال:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("مرحبًا بك في Qinote")
                Text("صباح الخير")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("اضغط علي") {
                print("اضغط علي ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

شكل عرض هذه الواجهة:

![view](../../Resource/023_view1.png)

يمكن لهذا الكود أن يعمل بشكل طبيعي، لكن إذا أصبح كود الواجهة معقدًا جدًا، فسيطول الكود داخل `body` أكثر فأكثر، وستزداد صعوبة قراءته وتعديله.

عندها يمكننا تقسيم المناطق المختلفة إلى خصائص واجهة مستقلة.

### تقسيم الواجهة العلوية

مثلًا، نفصل المنطقة العلوية:

```swift
var topHome: some View {
    HStack {
        Text("الرئيسية")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

هنا `topHome` متغير يعيد واجهة.

لأنه يعيد واجهة، يمكن كتابة نوعه هكذا:

```swift
some View
```

وهذا في الحقيقة يشبه استخدام `body`:

```swift
var topHome: some View { }
var body: some View { }
```

كلاهما يستخدم متغيرًا لعرض واجهة، ونوع الإرجاع هو `some View`.

### تقسيم واجهات أخرى

بعد ذلك، نواصل تقسيم الأجزاء الأخرى:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("مرحبًا بك في Qinote")
        Text("صباح الخير")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("اضغط علي") {
        print("اضغط علي")
    }
    .buttonStyle(.borderedProminent)
}
```

بعد التقسيم، يمكن وضع متغيرات الواجهة داخل `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("الرئيسية")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("مرحبًا بك في Qinote")
            Text("صباح الخير")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("اضغط علي") {
            print("اضغط علي")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

الآن يصبح `body` مسؤولًا فقط عن وصف بنية الصفحة:

```swift
topBar
welcomeText
colorList
clickButton
```

أما التنفيذ التفصيلي لكل جزء، فيوضع في الخصائص المقابلة أسفل ذلك.

تجعل طريقة تقسيم الواجهة هذه بنية الصفحة أوضح، ولكل منطقة واجهة اسمها الخاص، مما يجعل القراءة أكثر مباشرة.

وعند تعديل جزء معين من الكود، يمكننا العثور مباشرة على منطقة الواجهة المقابلة، بدلًا من البحث داخل كمية كبيرة من الكود المعقد.

### some View يعيد واجهة واحدة

في هذا التقسيم، إذا حاولنا إرجاع عدة واجهات:

```swift
var topBar: some View {
    Text("الرئيسية")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

فسيحدث خطأ، لأن `some View` لا يستطيع إلا إرجاع بنية واجهة واحدة.

وعلى خلاف `body`، فإن الخصائص المحسوبة العادية لا تملك `@ViewBuilder` افتراضيًا.

لذلك، إذا احتجنا إلى إرجاع عدة واجهات، يمكن استخدام حاوية مثل `VStack` أو `HStack` أو `Group` لدمج عدة واجهات في واجهة واحدة.

```swift
var topBar: some View {
    VStack {
        Text("الرئيسية")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

أو إضافة `@ViewBuilder` لدمج الواجهات:

```swift
@ViewBuilder
var topBar: some View {
    Text("الرئيسية")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

وبذلك يمكننا إرجاع عدة واجهات.

### if يعيد عدة واجهات

على سبيل المثال:

```swift
var topHome: some View {
    if step == "الرئيسية" {
        HStack {
            Text("الرئيسية")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("لا شيء")
    }
}
```

في هذا الكود، يعيد `topHome` حسب محتوى `step` نوعين مختلفين من الواجهات: `HStack` أو `Text`.

لأن `some View` يحتاج إلى نوع إرجاع محدد، لا يمكن لفرعي `if` في خاصية محسوبة عادية إرجاع نوعين مختلفين من الواجهات مباشرة، مما يؤدي إلى خطأ.

**يبقى الحل هو استخدام حاوية للتغليف، أو استخدام `@ViewBuilder`.**

### لماذا لا نستخدم الأقواس عند تقسيم الواجهة؟

عند استخدام خصائص الواجهة المقسمة داخل `body`، نكتب مباشرة:

```swift
topBar
welcomeText
colorList
clickButton
```

ولا نكتب:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

والسبب هو أن `topBar` و`welcomeText` و`colorList` و`clickButton` متغيرات، وهذه المتغيرات في الحقيقة خصائص محسوبة وليست دوال.

**الخاصية لا تحتاج إلى أقواس.**

إذا كتبناها على شكل دالة، فيمكن أيضًا تحقيق تأثير مشابه:

```swift
func topBar() -> some View {
    HStack {
        Text("الرئيسية")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

يمكن لهذا الكود أيضًا تحقيق تأثير مشابه، فاستدعاء هذه الدالة يعيد واجهة.

وعند الاستخدام يجب كتابته هكذا:

```swift
topBar()
```

في SwiftUI، إذا كنا نقسم واجهة لا تحتاج إلى تمرير معاملات، فإن استخدام الخصائص المحسوبة أكثر شيوعًا.

```swift
var topBar: some View { ... }
```

## الواجهات المتداخلة

بالإضافة إلى تقسيم الكود إلى خصائص، يمكننا أيضًا إنشاء بنى واجهة جديدة.

على سبيل المثال:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

هذه `PinkColorView`، مثل `ContentView`، هي واجهة SwiftUI مستقلة.

إذا احتجنا إلى عرضها داخل `ContentView`، يمكننا إضافة `()` بعد اسم الواجهة.

على سبيل المثال:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

وهذا:

```swift
PinkColorView()
```

يعني إنشاء مثيل من `PinkColorView`.

لأن `PinkColorView` تلتزم ببروتوكول `View`، يمكن وضعها للعرض داخل واجهات أخرى مثل `Text` و`Image` و`Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

هذا هو تداخل الواجهات: يمكن لواجهة أن تظهر داخل واجهة أخرى.

## خاصية واجهة أم إنشاء واجهة جديدة؟

عندما يكون كود الواجهة بسيطًا، لا نحتاج عادة إلى تقسيم الكود، ولا ننصح بتقسيم الواجهة إلا عندما يصبح الكود أكثر تعقيدًا.

### متى نستخدم خاصية واجهة؟

إذا كان المحتوى مجرد جزء صغير داخل الواجهة الحالية، فيمكن استخدام خاصية واجهة.

على سبيل المثال:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

عادة تُستخدم هذه المحتويات داخل الواجهة الحالية فقط.

### متى ننشئ واجهة جديدة؟

إذا كانت هذه المحتويات مستقلة نسبيًا، أو قد نعيد استخدامها في عدة صفحات لاحقًا، فمن الأنسب إنشاء واجهة جديدة.

على سبيل المثال:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

هذه واجهة عنوان، وإذا أردنا استخدامها كمكوّن عام يمكن إعادة استخدامه في واجهات أخرى.

يمكننا إنشاء واجهة جديدة:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

ثم نستخدمها في أماكن أخرى:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

عندها تصبح هذه الواجهة مكوّنًا مستقلًا قابلًا لإعادة الاستخدام.

يمكن تلخيص الأمر ببساطة:

- منطقة محتوى داخل الواجهة الحالية: يمكن استخدام `var xxx: some View`
- مكوّن مستقل قابل لإعادة الاستخدام: يمكن إنشاء `struct XxxView: View`
- مكوّن يحتاج إلى تمرير بيانات: عادة يكون إنشاء واجهة جديدة أنسب.

## الخلاصة

في هذا الدرس، أعدنا فهم بنية الواجهة الأساسية والأهم في SwiftUI.

`ContentView` هي بنية، تُعرّف باستخدام `struct`، وتُستخدم لتنظيم الكود المرتبط بالصفحة.

`View` هو بروتوكول، وإذا أرادت بنية ما أن تصبح واجهة SwiftUI، فعليها الالتزام ببروتوكول `View`.

`body` هو المحتوى الذي يطلب منا بروتوكول `View` توفيره، وهو يحدد ما الذي تعرضه هذه الواجهة.

`some View` يعني إرجاع نوع محدد من الواجهات، ونحن لا نحتاج إلى كتابة نوعه الكامل المعقد.

عندما يصبح كود الواجهة طويلًا، يمكننا استخدام `var xxx: some View` لتقسيم كود الواجهة إلى عدة مناطق صغيرة.

عندما يكون جزء من المحتوى مستقلًا نسبيًا أو يحتاج إلى إعادة استخدام، يمكننا إنشاء بنية واجهة جديدة، ثم عرضها في واجهات أخرى باستخدام `XxxView()`.

ببساطة، واجهة SwiftUI تتكوّن من واجهات صغيرة مجمعة معًا؛ فالصفحة الواحدة يمكن أن تحتوي على عدة واجهات صغيرة، والواجهة الصغيرة يمكنها بدورها أن تحتوي على واجهات أخرى.
