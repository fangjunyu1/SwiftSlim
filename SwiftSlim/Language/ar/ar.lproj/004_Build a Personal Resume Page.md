# بناء صفحة سيرة ذاتية شخصية

في هذا الفصل سننشئ واجهة بسيطة لسيرة ذاتية شخصية، ونتعلّم:

- `cornerRadius`
- `spacing`
- `ScrollView`

وأثناء ذلك سنراجع أيضاً مفاهيم التخطيط و`Text` و`Image`، وننفّذ التحكم في المسافات وإمكانية التمرير.

## السيرة الذاتية الشخصية

النتيجة المستهدفة:

![Swift](../../RESOURCE/004_img.png)

**جرّب أولاً أن تنفّذ الواجهة بنفسك، ثم واصل قراءة الشرح أدناه.**

### إنشاء المشروع

أنشئ مشروع iOS جديداً، أو واصل العمل على المشروع السابق.

الشيفرة الافتراضية في `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

الآن احذف الشيفرة وابدأ بكتابة محتواك الخاص:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### البنية العامة

في التطوير العملي، نبدأ عادة بتصميم الهيكل العام للواجهة.

صفحتنا تتضمن:

1. العنوان
2. المعلومات الشخصية
3. التعريف الشخصي

سنضيف `VStack` في الطبقة الخارجية:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

يضمن `VStack` ترتيب العناصر عمودياً، كما يسمح بالتحكم في ترتيب العناصر والمسافات بينها.

### العنوان

أولاً، ننشئ `Text` لعرض العنوان.

هنا سأعرض اسمي الإنجليزي كعنوان:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

عادة يكون العنوان أكبر حجماً وأكثر سماكة، لذا نستخدم `font` و`fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### التخطيط

المحاذاة الافتراضية في SwiftUI هي `center`، لذلك يظهر العنوان حالياً في وسط `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

لكننا نريد أن يظهر العنوان في أعلى الواجهة، ويمكننا استخدام `Spacer` لتحقيق ذلك:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

يأخذ `Spacer` المساحة المتبقية، ويدفع `Text` إلى أعلى الحاوية.

![Swift](../../RESOURCE/004_img4.png)

### المساحة الفارغة

إذا شعرت أن النص قريب جداً من الأعلى، فيمكنك استخدام `padding` أو `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

هذا يضيف هامشاً علوياً مقداره `20` إلى `VStack`.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

يمكنك أيضاً استخدام `Spacer` مع `frame(height:)` للحصول على فراغ بارتفاع محدد.

النتيجة:

![Swift](../../RESOURCE/004_img5.png)

### الصورة

لنجهّز صورة شخصية ونضعها داخل مجلد `Assets`.

![Swift](../../RESOURCE/004_img6.png)

ثم نستخدم `Image` داخل `ContentView` لعرضها:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

بما أن حجم الصورة الأصلي كبير نسبياً، فنحتاج إلى استخدام `frame` للتحكم في حجم العرض.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

سنلاحظ هنا مشكلة:

إذا لم تتطابق نسبة العرض والارتفاع في `frame` مع نسبة الصورة الأصلية، فستتعرّض الصورة للتشوّه.

مثلاً:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

ولمنع هذا التشوه، نستخدم `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

وظيفة `scaledToFit` هي:

تصغير أو تكبير الصورة داخل المساحة المحددة مع الحفاظ على نسبة أبعادها الأصلية، وعرض الصورة كاملة.

فهي لا تمدد الصورة قسراً لتملأ الإطار بالكامل، بل تُبقي النسبة الأصلية ثابتة، وتكبر أو تصغر بشكل متناسب حتى يلتصق أحد الجانبين بالحد.

وهذا يعني:

- إذا كان عرض `frame` أصغر، فسيُبنى التغيير على العرض
- وإذا كان ارتفاع `frame` أصغر، فسيُبنى التغيير على الارتفاع
- وستحافظ الصورة دائماً على نسبتها الأصلية من دون تشوّه

وغالباً يكفي أن نحدد بعداً واحداً فقط. مثلاً:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

في هذه الحالة، يحسب النظام الارتفاع المناسب تلقائياً بناءً على عرض `140` مع الحفاظ على التناسب.

وإذا كنت تحتاج إلى نسبة بصرية ثابتة أو تريد منع الضغط في التخطيطات الأكثر تعقيداً، فيمكنك تحديد العرض والارتفاع معاً.

### الزوايا الدائرية

إذا أردنا أن تظهر الصورة بزوايا دائرية، نستخدم المعدّل `cornerRadius`:

```swift
.cornerRadius(10)
```

مثلاً:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

نضيف `cornerRadius(20)` بعد معدّلات الصورة.

![Swift](../../RESOURCE/004_img9.png)

تعني `cornerRadius(20)` قصّ حواف العنصر وتطبيق نصف قطر دائري مقداره `20`.

بعد إضافة الزوايا الدائرية، تصبح زوايا الصورة الأربع منحنية، مما يجعل الإحساس البصري ألطف وأكثر حداثة.

وهذا الأسلوب شائع جداً في تصميم الواجهات الحديثة، فحتى أيقونات تطبيقات iOS تأخذ هيئة المستطيل ذي الزوايا المستديرة.

### المعلومات الشخصية

الآن سنبدأ في تنفيذ منطقة المعلومات الشخصية الموجودة على يسار الصورة. وبالنظر إلى بنية الواجهة، نجد أن المعلومات الشخصية والصورة مرتبتان أفقياً، لذلك نحتاج إلى `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

أما محتوى المعلومات الشخصية نفسه فهو مرتب عمودياً.

![Swift](../../RESOURCE/004_img11.png)

لذلك نستخدم `HStack` في الخارج، و`VStack` للمعلومات الشخصية، و`Text` للمحتوى النصي.

البنية الأساسية:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**جعل عناوين الحقول عريضة**

للتمييز بين اسم الحقل وقيمته، يمكننا استخدام `fontWeight` مع اسم الحقل:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**محاذاة النص إلى البداية**

`VStack` يستخدم التوسيط افتراضياً. وإذا أردنا أن تكون جميع النصوص بمحاذاة البداية، فعلينا تحديد ذلك صراحة:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

تعبّر `.leading` عن المحاذاة إلى جهة البداية.

![Swift](../../RESOURCE/004_img14.png)

### المسافات

إذا أردنا الحفاظ على مسافة ثابتة بين المعلومات الشخصية والصورة، فيمكننا استخدام `Spacer` كما تعلّمنا سابقاً:

```swift
Spacer()
    .frame(width: 10)
```

أو يمكننا استخدام معامل `spacing` في `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

تعني `spacing: 30` أن المسافة بين العنصرين داخل الحاوية هي `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**ما هو spacing؟**

في `VStack` و`HStack` و`ZStack`، يتحكم `spacing` في المسافة بين العناصر الأبناء المباشرين.

مثلاً:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

في هذه الحالة تصبح المسافة بين العناصر الأبناء في الـ `VStack` الخارجي `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

لكن من المهم الانتباه إلى أن `spacing` يؤثر فقط في العناصر الأبناء المباشرين، ولا يؤثر في التخطيط داخل الحاويات المتداخلة.

**التحكم في المسافات داخل القائمة**

إذا أردنا زيادة المسافة بين الحقول، فأبسط طريقة هي إضافة `spacing` إلى `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

بهذا تصبح المسافة بين جميع العناصر `10 pt`.

لكن إذا تأملنا النتيجة، سنلاحظ مشكلة:

المسافة تظهر بين كل مجموعة حقول، ولكنها تظهر أيضاً بين اسم الحقل وقيمته.

وذلك لأن `spacing` يطبّق على جميع الأبناء المباشرين داخل الحاوية.

في هذه البنية، كل عنصر `Text` هو ابن مباشر للـ `VStack` الخارجي، ولذلك تُطبق عليه المسافة بالتساوي.

وإذا أردنا أن تكون هناك مسافة بين المجموعات فقط، بينما يبقى اسم الحقل وقيمته متقاربين، فيمكننا اعتبار كل "اسم حقل + قيمة" مجموعة منطقية واحدة ونلفّها في `VStack` مستقل:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

الآن أصبحت هناك مسافات بين مجموعات الحقول في الـ `VStack` الخارجي، بينما تحافظ الحاويات الداخلية على التباعد الافتراضي المضغوط، فلا تظهر فجوة إضافية بين اسم الحقل وقيمته.

![Swift](../../RESOURCE/004_img18.png)

### التعريف الشخصي

بعد ذلك، ننفذ منطقة التعريف الشخصي.

من بنية الواجهة، نلاحظ أن محتوى التعريف يتكوّن من عدة أسطر نصية مرتبة عمودياً.

![Swift](../../RESOURCE/004_img19.png)

لذلك يمكن استخدام `VStack` مع `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**زيادة المسافة**

حالياً تبدو منطقة المعلومات الشخصية ومنطقة التعريف متقاربتين جداً، وهذا ليس جميلاً بصرياً.

![Swift](../../RESOURCE/004_img20.png)

وبما أنهما موجودتان داخل الحاوية الخارجية نفسها، فيمكننا التحكم في التباعد العام من تلك الحاوية:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

النتيجة:

![Swift](../../RESOURCE/004_img21.png)

**المسافات داخل القائمة**

يمكننا أيضاً استخدام `spacing` للتحكم في المسافة بين أسطر التعريف الشخصي:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### إكمال السيرة الذاتية

بهذا نكون قد أكملنا البنية الأساسية للسيرة الذاتية الشخصية.

![Swift](../../RESOURCE/004_img.png)

### العرض القابل للتمرير

حالياً تستخدم الصفحة `VStack`. وهذا لا يسبب مشكلة إذا كان عدد أسطر التعريف قليلاً. لكن إذا أصبحت 20 أو 30 سطراً أو أكثر، فسيصبح ارتفاع المحتوى أكبر من الشاشة.

مثلاً:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

عند هذه النقطة ستظهر مشكلتان:

- سيتم اقتطاع المحتوى السفلي
- لن تكون الصفحة قابلة للتمرير

وهذا ليس خطأ في `VStack` نفسها، لأنها مجرد حاوية تخطيط ولا توفر التمرير تلقائياً.

**ما هي `ScrollView`؟**

`ScrollView` هي حاوية قابلة للتمرير، ومناسبة للمحتوى الذي يتجاوز حجم الشاشة، سواء كان عمودياً أو أفقياً.

البنية الأساسية:

```swift
ScrollView {
    ...
}
```

إذا أردنا جعل الصفحة قابلة للتمرير، فعلينا أن نغلف كامل الصفحة داخل `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

بهذا تصبح الصفحة كلها منطقة قابلة للتمرير. وعندما يتجاوز المحتوى ارتفاع الشاشة، يمكن للمستخدم أن يمرّرها بشكل طبيعي.

وتعرض `ScrollView` مؤشر التمرير افتراضياً. وإذا أردت إخفاءه، يمكنك استخدام:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## الشيفرة الكاملة

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
