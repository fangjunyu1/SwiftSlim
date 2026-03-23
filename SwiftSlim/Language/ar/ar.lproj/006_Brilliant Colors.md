# ألوان زاهية

في هذا الفصل سنتعلّم بعض المعدّلات البصرية الشائعة في SwiftUI، ومنها:

- الألوان
- لون المقدمة
- لون الخلفية
- الإزاحة
- الشفافية
- التمويه

وسنتعرّف أيضاً إلى مفهوم `Safe Area`.

تُستخدم هذه المعدّلات للتحكم في مظهر العناصر البصري، وجعل الواجهة أوضح وأكثر تدرجاً.

## الألوان

في SwiftUI يمكننا تغيير لون النص.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

تعني `.blue` اللون الأزرق، وهي في الواقع صيغة مختصرة من `Color.blue` بفضل استنتاج النوع.

ومن الألوان الشائعة:

```text
.black
.green
.yellow
.pink
.gray
...
```

كل هذه قيم ثابتة من النوع `Color`.

![Color](../../RESOURCE/006_color.png)

يمكنك أن تفهم `Color` على أنه نوع يمثل اللون، بينما `.blue` و`.red` وغيرهما تمثل ألواناً محددة من هذا النوع.

### عنصر `Color`

في SwiftUI، يمكن لـ `Color` نفسه أن يظهر كعنصر مرئي:

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

هذه الشيفرة تنشئ مربعاً أحمر بحجم `100 × 100`.

ويمكننا أيضاً جعل الواجهة كلها بلون واحد:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

بعد التشغيل، سنلاحظ أن اللون الأحمر لا يغطي الشاشة بالكامل، وأن أعلى وأسفل شاشة iPhone ما زالا باللون الأبيض. ويرتبط ذلك بوجود `Safe Area`.

## المنطقة الآمنة Safe Area

المنطقة الآمنة هي مساحة يحتفظ بها النظام حتى لا تُحجب العناصر. وهي تشمل:

1. منطقة شريط الحالة في الأعلى، مثل الوقت والبطارية
2. منطقة مؤشر Home في الأسفل
3. منطقة النتوء أو Dynamic Island

![Color](../../RESOURCE/006_color3.png)

بشكل افتراضي، يقيّد SwiftUI المحتوى داخل المنطقة الآمنة، ولذلك لا تتمدد الواجهة إلى أطراف الشاشة بالكامل.

### تجاهل المنطقة الآمنة

إذا أردنا أن يملأ اللون كامل الشاشة، يمكننا استخدام `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

أو الصيغة الأقدم:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

بهذا يتمدد العنصر ليغطي الشاشة كلها.

ومن المهم ملاحظة أن `edgesIgnoringSafeArea` صيغة أقدم، ومنذ iOS 14 أصبحت `ignoresSafeArea` هي الصيغة الموصى بها.

## لون المقدمة

### المعدّل `foregroundStyle`

في الدروس السابقة تعرّفنا إلى `foregroundStyle` لتغيير اللون.

مثلاً:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

يُعد `foregroundStyle` جزءاً من نظام تنسيق أحدث، ويدعم الألوان والتدرجات والخامات وغيرها.

![Color](../../RESOURCE/006_color2.png)

### المعدّل `foregroundColor`

يمكن أيضاً استخدام `foregroundColor` لتحديد اللون:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

وهو شبيه في الاستخدام بـ `foregroundStyle`.

وفي الإصدارات الأحدث من Xcode، قد تظهر ملاحظة تفيد بأن `foregroundColor` قد يصبح قديماً في المستقبل، ولذلك يُفضّل استخدام `foregroundStyle`.

## الخلفية

إذا أردنا إضافة لون خلفية إلى عنصر ما، نستخدم `background`:

```swift
background(.red)
```

مثلاً، لإضافة خلفية إلى نص:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

يمكن رؤية تأثير مشابه عند تحديد النص في تطبيقات مثل Word أو Chrome.

![Color](../../RESOURCE/006_color16.png)

وإذا أردنا توسيع مساحة الخلفية، نحتاج إلى دمجها مع `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

وهنا توجد قاعدة مهمة:

في SwiftUI، تُبنى العناصر بالمعدلات من الأعلى إلى الأسفل. والمعدّل المكتوب لاحقاً يطبّق على النتيجة الناتجة عن المعدّلات السابقة.

لذلك:

```swift
.padding()
.background()
```

يعني أن الخلفية ستغطي العنصر بعد إضافة الحشو.

أما إذا عكسنا الترتيب:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

فلن تتمدّد الخلفية، لأنها لم تغطِّ الحشو المضاف لاحقاً.

## مثال - صامولة رباعية الزوايا

الآن سننشئ عنصراً بصرياً بسيطاً يشبه صامولة ذات أربع زوايا.

![Color](../../RESOURCE/006_color8.png)

لنبدأ بمربع أبيض بحجم `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

وإذا أردنا تحويله إلى دائرة، نستخدم `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

عندما يكون نصف القطر مساوياً لنصف العرض والارتفاع، يصبح الشكل دائرة.

والآن نضيف خلفية زرقاء:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

الحشو الجديد يوسّع المنطقة الخارجية، ثم يرسم `background` اللون الأزرق على هذه المساحة. وهكذا نكون قد حصلنا على شكل يشبه الصامولة.

### طريقة أخرى للتفكير

إلى جانب استخدام الخلفية، يمكننا تنفيذ هذا الشكل عبر `ZStack`.

فقد تعلّمنا سابقاً أن `ZStack` يتيح ترتيب العناصر فوق بعضها. ويمكن فهم هذا الشكل على أنه دائرة ومربع متراكبان.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

داخل `ZStack`، تظهر العناصر حسب ترتيبها، ويظهر العنصر المضاف لاحقاً في الطبقة العليا.

## مثال - دائرتان متداخلتان

كثير من الأيقونات تتكون من أشكال بسيطة متراكبة، مثل دائرتين متداخلتين.

![Color](../../RESOURCE/006_color14.png)

أولاً، ننشئ دائرتين:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

وبما أننا نريد تراكبهما، سنستخدم `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

حالياً تتطابق الدائرتان تماماً لأن حجمهما متساوٍ.

لكننا نريد تداخلاً جزئياً لا تطابقاً كاملاً، وهنا نستخدم `offset`.

## الإزاحة Offset

المعدّل `offset` يغيّر موضع الرسم فقط، ولا يغيّر الحساب التخطيطي الذي يجريه العنصر الأب.

طريقة الاستخدام:

```swift
.offset(x:y:)
```

القيمة `x` تعني الإزاحة الأفقية، و`y` تعني الإزاحة العمودية.

القيم الموجبة تحرّك العنصر إلى اليمين أو الأسفل، أما القيم السالبة فتحرّكه إلى اليسار أو الأعلى.

لجعل الدائرتين تتداخلان جزئياً:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

رغم أن موضع الدائرة الحمراء ضمن التخطيط لم يتغير، فإن موضع رسمها تحرك 25 نقطة إلى اليسار، مما أعطى تأثير التداخل الجزئي.

## الشفافية

في SwiftUI يمكن استخدام `opacity` لضبط شفافية العنصر.

الصيغة الأساسية:

```swift
.opacity(0.5)
```

وقيمتها تتراوح من `0.0` إلى `1.0`:

- `0` يعني شفافاً تماماً
- `1` يعني غير شفاف

يمكننا استخدام `opacity` مع الدائرة البرتقالية:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

عند ضبط شفافية الدائرة البرتقالية على `0.8`، تصبح بدرجة 80%، وعندما تتداخل الدائرتان يظهر تأثير مزج الألوان في منطقة التداخل.

## التمويه Blur

في SwiftUI يمكن استخدام `blur` لإضافة تأثير تمويه:

```swift
.blur(radius:10)
```

القيمة `radius` تحدد نصف قطر التمويه، وكلما زادت كانت النتيجة أكثر وضوحاً.

يمكننا إضافة تأثير التمويه إلى الدائرتين:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

في النهاية سنحصل على دائرتين ضبابيتين جداً.

## الخلاصة

تمحور هذا الفصل حول بعض المعدّلات البصرية الشائعة في SwiftUI، وتعلّمنا من خلاله كيف نتحكم في اللون والموضع والأثر البصري للعناصر.

ومن خلال الأمثلة العملية، رأينا أثر هذه المعدّلات داخل الواجهة، كما تعرّفنا أيضاً إلى مفهوم المنطقة الآمنة.

كل هذه مفاهيم أساسية جداً، وكثرة التدريب عليها ستساعدنا لاحقاً على التحكم بشكل أوضح في نتائج الواجهة.

### تمارين بعد الدرس

- أضف تأثير الشفافية والتمويه إلى صورة
- أنشئ ثلاث دوائر بدرجات شفافية مختلفة مع تداخل بينها
- أنشئ صورة خلفية تملأ الشاشة وتتجاهل المنطقة الآمنة
- استخدم `offset` لتعديل مواضع عدة عناصر

الهدف من هذه التمارين ليس حفظ الـ API، بل ملاحظة العلاقة بين التغيّر البصري وسلوك التخطيط.
