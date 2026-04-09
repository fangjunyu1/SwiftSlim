# struct و class

في الدرس السابق، بدأنا للتو التعرّف على `struct`، وعرّفنا بنية، وتوسّعنا أيضًا في تعلّم البروتوكولات و`UUID` وغيرها من النقاط المعرفية.

والآن أصبح لدينا فهم أولي للكلمة المفتاحية `struct`، لكنه لا يزال لا يُعد فهمًا حقيقيًا بالكامل.

في هذا الدرس، سنواصل جعل `struct` هو المحور الأساسي، ونتعرّف بالمناسبة إلى `class` أيضًا. ومن خلال هذا الدرس ستعرف بشكل أوضح: ما هو المثيل، وما هو المُنشئ، ولماذا يمكننا استخدام `struct` و`class` لتنظيم البيانات.

## نظام إدارة الطلاب

على سبيل المثال، نريد الآن تطوير نظام لإدارة الطلاب. فلكل طالب معلومات مثل الاسم والجنس والهاتف والعمر والعنوان المنزلي.

في هذه الحالة، يمكننا جمع هذه المعلومات معًا وتعريفها على شكل بنية `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

هنا استخدمنا `struct` لتعريف نوع طالب.

تتضمن بنية `Student` هذه عدة خصائص:

- `id`: المعرّف الفريد للطالب
- `name`: اسم الطالب
- `sex`: جنس الطالب
- `phone`: هاتف الطالب
- `age`: عمر الطالب
- `address`: عنوان المنزل

وبهذه الطريقة، يتم جمع عدة بيانات كانت متفرقة أصلًا في "طالب" كامل.

كما أن `Student` هنا يلتزم أيضًا ببروتوكول `Identifiable`، ويعرّف الحقل `id` لتسهيل عرض البيانات لاحقًا مع حلقة `ForEach`.

بعد ذلك، يمكننا إنشاء مثيل لطالب:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

يعني هذا المقطع البرمجي أنه وفقًا لبنية `Student` هذه، يمكن إنشاء بيانات طالب محددة.

ومن بينها، `Student` هو النوع، أما `Student(...)` فيمثّل مثيلًا تم إنشاؤه.

في SwiftUI، يمكننا إسناد هذا المثيل إلى متغير، ثم عرضه.

على سبيل المثال:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

وبذلك يمكننا أن نرى اسم هذا الطالب داخل الواجهة: `Fang Junyu`.

هنا أنشأنا أولًا مثيلًا من `Student`، ثم أسندناه إلى المتغير `student`، وأخيرًا قرأنا الخاصية بداخله من خلال `student.name`.

## ما هو المثيل

عندما نبدأ للتو في تعلّم `struct`، قد نشعر أن كلمة "مثيل" غريبة جدًا.

لكن في الواقع، نحن نستخدم المثيلات منذ البداية، فقط لم نكن ننتبه إليها بشكل خاص من قبل.

على سبيل المثال:

```swift
let name = "Fang Junyu"
```

إن `"Fang Junyu"` هنا قيمة سلسلة نصية، وهي في جوهرها مثيل من النوع `String`.

ويمكننا أيضًا كتابتها بهذا الشكل:

```swift
let name = String("Fang Junyu")
```

هاتان الطريقتان تعبّران عن الشيء نفسه: إنشاء مثيل من النوع `String` ثم إسناده إلى المتغير `name`.

وبالمثل، ينطبق الأمر نفسه على `Int`:

```swift
let num = 3
```

إن `3` هنا في جوهره قيمة من النوع `Int`، ويمكن فهمه أيضًا على أنه مثيل `Int`.

لذلك، فالمثيل ليس مفهومًا خاصًا يظهر فقط داخل `struct`.

سواء كان `String` أو `Int` أو `Double` أو `Bool` أو حتى `Student` الذي نعرّفه بأنفسنا، فجميعها يمكنها إنشاء مثيلات.

لذلك، عندما نكتب:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

فإن جوهر ذلك مماثل تمامًا لإنشاء مثيل من `String` أو `Int`، إلا أن `Student` هو نوع قمنا نحن بتعريفه.

## المُنشئ

عندما ننشئ مثيلًا:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

فنحن في الواقع نستدعي طريقة التهيئة الخاصة بـ `Student`، أي `init`.

يمكنك فهم المُنشئ على أنه: **المدخل المسؤول عن إسناد القيم إلى الخصائص عند إنشاء المثيل.**

أي أن المثيل عادةً ما يمر أولًا عبر `init` قبل أن يكتمل إنشاؤه فعلًا.

على سبيل المثال، عندما تعلمنا سابقًا دورة حياة عرض SwiftUI، كتبنا كودًا مثل هذا:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

يتم تنفيذ `init()` هنا عند إنشاء مثيل `ContentView`، بينما لا يتم تنفيذ `onAppear` إلا عندما يُعرض هذا العرض فعليًا على الشاشة. أي إن إنشاء العرض وإظهاره ليسا في اللحظة نفسها.

وبالقياس على ذلك، عندما ننشئ `Student(...)` فنحن أيضًا نستدعي مُنشئ `Student`.

### المُنشئ الذي يولّده النظام تلقائيًا

عندما عرّفنا `Student`، لم نكتب `init` يدويًا:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

لكن مع ذلك، لا يزال بإمكاننا إنشاء مثيل مباشرةً:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

لماذا يمكن إنشاء مثيل مع عدم وجود مُنشئ مكتوب؟

لأنه بالنسبة إلى `struct`، إذا لم نكتب مُنشئًا يدويًا، فعادةً ما يولّد لنا النظام مُنشئًا مناسبًا تلقائيًا.

وفي مرحلة التعلّم الأولى، يمكن فهم الأمر ببساطة على أن Swift يكمّل لنا كود التهيئة تلقائيًا.

ويمكن فهمه بصورة تقريبية على أن النظام سيولّد لنا الكود التالي:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

وهنا يجب الانتباه إلى تفصيل صغير:

```swift
let id = UUID()
```

لدى `id` قيمة افتراضية بالفعل، لذلك عند إنشاء المثيل لا نحتاج إلى تمرير `id` يدويًا مرة أخرى.

أي إن الخصائص التي لا تملك قيمة افتراضية تحتاج عادةً إلى تمريرها في المُنشئ؛ أما الخصائص التي تملك قيمة افتراضية، فيمكن غالبًا استخدام قيمتها الأصلية مباشرةً.

لذلك، عند إنشاء مثيل `Student` نحتاج فقط إلى تمرير `name` و`sex` و`phone` و`age` و`address`.

### تلميحات المصرّف

إضافة إلى ذلك، عندما نكتب `Student(...)` في Xcode، يمكننا أيضًا رؤية تلميحات الوسائط التي يعرضها النظام.

![student](../../Resource/022_student.png)

وهذا يوضح في الواقع أيضًا: أن هذا النوع الحالي يملك بالفعل مُنشئًا مولّدًا تلقائيًا من النظام.

### كتابة المُنشئ بأنفسنا

مع أن النظام يمكنه توليد المُنشئ تلقائيًا، فإنه في بعض الأحيان لا تكون طريقة التهيئة الافتراضية هذه مطابقة تمامًا لاحتياجاتنا.

على سبيل المثال، لدينا بنية `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

وفقًا للمُنشئ الذي يولّده النظام تلقائيًا، يجب علينا عند إنشاء مثيل تمرير هذه الوسائط الثلاثة معًا:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

لكن إذا أردنا الآن إدخال مجموعة من الأفلام القديمة، وكنا نعرف فقط أسماء الأفلام ولا نعرف المخرج أو التقييم، فسيصبح الأمر مزعجًا بعض الشيء.

لأننا لا نستطيع إلا أن نكتب هكذا:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

مع أن هذا يعمل، فإن تكرار كتابة `--` في كل مرة ليس مريحًا.

عندها يمكننا كتابة مُنشئ بأنفسنا:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

وبهذه الطريقة، عند إنشاء أفلام قديمة، نحتاج فقط إلى تمرير `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

هذا هو أحد معاني كتابة المُنشئ بأنفسنا: **جعل طريقة إنشاء المثيل أكثر توافقًا مع الاحتياجات الواقعية.**

### شرح المُنشئ المخصّص

لننظر إلى هذا المُنشئ المكتوب يدويًا قبل قليل:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

معنى هذا الكود هو أنه عند إنشاء مثيل `Movie`، لا يُطلب إلا تمرير وسيط واحد هو `name`.

ثم سيقوم المُنشئ داخليًا بإسناد `name` الممرَّر إلى `name` الخاص بالمثيل نفسه، وإعطاء `director` و`rating` قيمة افتراضية هي `--`.

وتعني `self` هنا "هذا المثيل الحالي نفسه".

على سبيل المثال:

```swift
self.name = name
```

يشير `self.name` في الجهة اليسرى إلى الخاصية الموجودة داخل المثيل؛ أما `name` في الجهة اليمنى فيشير إلى الوسيط الذي قمنا بتمريره.

ويمكن فهم هذا ببساطة على أنه حفظ القيمة القادمة من الخارج داخل خاصية المثيل نفسه.

وعندما تنتهي جميع الخصائص من أخذ القيم، يكتمل إنشاء هذا المثيل.

### آلية المُنشئ

عندما نُصرّح صراحةً عن مُنشئ، يحدث أيضًا تغيير آخر:

فالمُنشئ الذي كان النظام يولّده تلقائيًا في الأصل، لا يعود غالبًا قابلًا للاستخدام مباشرةً.

على سبيل المثال:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

والآن إذا كتبنا من جديد بالشكل التالي:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

فسوف يعطي المصرّف خطأ:

```swift
Extra arguments at positions #2, #3 in call
```

والمعنى هو: لقد مرّرت وسائط زائدة.

لماذا يظهر هذا الخطأ؟

لأن بنية `Movie` الحالية تحتوي فقط على هذا المُنشئ الوحيد الذي صرّحت به يدويًا:

```swift
init(name: String)
```

وهو لا يقبل إلا وسيطًا واحدًا هو `name`، ولا يقبل `director` و`rating`.

أي إنه عندما تضيف مُنشئك الخاص يدويًا، فإن أسلوب التهيئة الذي كان يُولّده النظام تلقائيًا أصلًا لا يعود متاحًا مباشرةً.

إذا كنا نريد دعم "تمرير الاسم فقط" وفي الوقت نفسه دعم "تمرير المعلومات الكاملة"، فعلينا أن نضيف بأنفسنا مُنشئًا كاملًا آخر:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

وبذلك يصبح لدينا مُنشئان مختلفان.

وعند إنشاء فيلم قديم، يمكننا أن نكتب هكذا:

```swift
Movie(name: "The Night of the Hunter")
```

وعند إنشاء فيلم جديد بمعلومات كاملة، يمكننا أن نكتب هكذا:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

وتوضح هذه الطريقة في الكتابة أيضًا: أن النوع نفسه يمكن أن يملك عدة مُنشئات، ما دامت صيغ الوسائط فيها مختلفة.

## ما هو التحميل الزائد

سنضيف هنا نقطة معرفية ضرورية أخرى.

لقد كتبنا للتو مُنشئين لـ `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

هذا النوع من الكتابة، "نفس اسم الدالة ولكن بمعاملات مختلفة"، يُسمّى "التحميل الزائد".

هنا، كلتا الدالتين اسمهما `init`، لكن الوسائط التي تستقبلانها مختلفة، لذلك تستطيع Swift التمييز بين الدالة التي تقوم باستدعائها.

على سبيل المثال:

```swift
Movie(name: "Days of Heaven")
```

سيستدعي:

```swift
init(name: String)
```

أما:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

فسوف يستدعي النسخة الكاملة الأخرى من طريقة التهيئة.

لذلك، فدور التحميل الزائد هو: أن يتيح للنوع نفسه توفير طرق إنشاء مختلفة وفقًا لسيناريوهات مختلفة.

## التعرّف إلى class

بعد ذلك، لنتعرّف ببساطة إلى `class`.

إلى جانب `struct` الشائع في Swift، تستخدم كثير من لغات البرمجة `class` لإنشاء المثيلات، مثل Java وC# وKotlin وغيرها.

في Swift، طريقة كتابة `class` قريبة جدًا من `struct`.

على سبيل المثال:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

ستلاحظ أنه باستثناء تغيّر الكلمة المفتاحية من `struct` إلى `class`، تبدو بقية الأجزاء متشابهة جدًا تقريبًا.

كما أن طريقة إنشاء المثيل متشابهة أيضًا:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

لذلك، على مستوى الصياغة، فإن `struct` و`class` متشابهان فعلًا.

### الفرق بين Struct و Class

مع أن `struct` و`class` يبدوان متشابهين جدًا، فإنهما ليسا متماثلين تمامًا.

**1. تختلف طريقة التهيئة**

بالنسبة إلى `struct`، إذا لم نكتب مُنشئًا يدويًا، فعادةً ما يولّد النظام تلقائيًا طريقة تهيئة مناسبة.

أما بالنسبة إلى `class`، فإذا كانت هناك خصائص لم تحصل بعد على قيم افتراضية، فعادةً يجب كتابة `init` يدويًا، وإلا فسيحدث خطأ.

على سبيل المثال:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

هذا الـ `class` سيعطي خطأ لأنه لا يحتوي على مُنشئ، مما يؤدي إلى عدم تهيئة الخصائص.

وسيظهر للمصرّف تلميح شبيه بـ:

```swift
Class 'Movie' has no initializers
```

لذلك، في هذا المثال، يجب على `class` كتابة مُنشئ يدويًا.

**2. `struct` نوع قيمة، و`class` نوع مرجعي**

`struct` نوع قيمة، و`class` نوع مرجعي.

في مرحلة التعلّم الأولى، لا تحتاج إلى إتقان هذين المفهومين، ويكفي فقط أن تكون لديك معرفة بسيطة بهما.

فعلى سبيل المثال، يشبه `struct` أكثر فكرة "نسخ قيمة جديدة".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

بعد إسناد `user1` إلى `user2` هنا، فكأننا نسخنا بيانات جديدة، لذلك فإن تعديل `user2` لن يؤثر في `user1`.

أما `class` فيشبه أكثر فكرة "الإشارة المشتركة إلى المثيل نفسه".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

يشير كل من `user1` و`user2` هنا إلى المثيل نفسه.

ولا نحتاج الآن إلى فهم الآلية الداخلية لنوع القيمة والنوع المرجعي بشكل كامل، بل يكفي أن نعرف أن `struct` أنسب لحفظ البيانات المستقلة، وأن `class` أنسب عندما تحتاج عدة أماكن إلى مشاركة المثيل نفسه.

## كيف نختار في مرحلة التعلّم الأولى

في المرحلة الحالية، من الأفضل التفكير أولًا في `struct` عند التعامل مع نماذج البيانات العادية، ثم التفكير في `class` عند الحاجة إلى بيانات مشتركة تُعدَّل وتُزامَن.

وهذا ليس قانونًا مطلقًا، لكنه بالنسبة إلى المبتدئين طريقة حكم عملية بما يكفي.

وخاصةً في SwiftUI، ستجد في كثير من الأحيان أن `struct` قادر أصلًا على إنجاز معظم الأعمال.

إضافة إلى ذلك، في كثير من المواد البرمجية، يُطلَق على ما يتم إنشاؤه بواسطة `class` أيضًا اسم "كائن". وفي مرحلة التعلّم الأولى، يمكنك أن تفهمه أولًا على أنه مثيل، من دون الحاجة إلى التمييز المقصود بينهما.

## الخلاصة

في هذا الدرس، تعلّمنا `struct` بعمق أكبر، وتعرّفنا بالمناسبة إلى `class` أيضًا، وكلاهما يمكن استخدامه لتعريف الأنواع.

يمكن للنوع إنشاء مثيلات. وعند إنشاء المثيل، يتم استدعاء المُنشئ، أي `init`.

بالنسبة إلى `struct`، إذا لم نكتب المُنشئ يدويًا، فعادةً ما يولّد النظام مُنشئًا مناسبًا تلقائيًا. وإذا لم يكن المُنشئ الافتراضي مناسبًا، فيمكننا أيضًا كتابة المُنشئ يدويًا.

إضافة إلى ذلك، تعرّفنا أيضًا بشكل أولي إلى الفرق بين `struct` و`class`: فـ `struct` نوع قيمة، و`class` نوع مرجعي. وفي SwiftUI، يكون `struct` عادةً هو الأكثر شيوعًا في مرحلة التعلّم الأولى.

وعندما نتعلّم لاحقًا تمرير القيم في العروض، ونماذج البيانات، وإدارة الحالة، فسيستمر استخدام هذه المفاهيم هناك أيضًا.
