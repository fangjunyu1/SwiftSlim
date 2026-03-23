# حصّالة النقود

في هذا الفصل، سنطوّر مشروعاً بسيطاً لحصّالة نقود. الوظيفة نفسها بسيطة، لكنها تتضمن منطق تفاعل متكامل، ولذلك فهي مناسبة جداً للمبتدئين.

من خلال هذا المشروع، سنتعلّم `TextField` و`border`، وسنتعرف أيضاً إلى ربط البيانات (`$`).

والهدف النهائي هو تنفيذ مشروع "حصّالة نقود" يستطيع المستخدم فيه إدخال مبلغ، ثم الضغط على زر لحفظه وإضافته إلى المجموع الكلي.

النتيجة المتوقعة:

![Piggy Bank](../../RESOURCE/014_view.png)

## عرض المبلغ الإجمالي

أولاً، نحتاج إلى عرض المبلغ الإجمالي الموجود في الحصّالة داخل الواجهة.

في `ContentView`، نُعرّف متغيراً لحفظ المبلغ الإجمالي:

```swift
@State private var amount = 0
```

ثم نستخدم `Text` لعرض هذا المبلغ:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

هنا نستخدم `.font` و`.fontWeight` لضبط حجم الخط وسماكته.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
```

عندما تتغير قيمة `amount`، فإن المبلغ المعروض في `Text` سيتحدّث تلقائياً.

## إدخال المبلغ

إلى جانب عرض الإجمالي، نحتاج أيضاً إلى السماح للمستخدم بإدخال المبلغ الذي يريد إيداعه أو سحبه. ولهذا نحتاج إلى استخدام عنصر الإدخال `TextField` في SwiftUI.

### `TextField`

`TextField` هو عنصر واجهة يُستخدم لإدخال المحتوى، وعادةً ما يُستخدم للإدخال في سطر واحد.

يدعم `TextField` بشكل رئيسي طريقتين للربط:

**1. الربط مع نص من نوع `String`**

```swift
TextField("Placeholder", text: $text)
```

وهذا مناسب للأسماء، والعناوين، وغيرها من المدخلات النصية.

**2. الربط مع قيمة رقمية من نوع `Int` أو `Double`**

```swift
TextField("Amount", value: $number, format: .number)
```

وهذا مناسب للعمر، والراتب، والمبالغ المالية، وغيرها من القيم الرقمية.

الجزء `format: .number` يعني أن حقل الإدخال سيقوم بتحليل وعرض الإدخال على أنه رقم.

#### النص الإرشادي Placeholder

المعامل الأول في `TextField` هو النص الإرشادي (`Placeholder`)، ويُستخدم لتوجيه المستخدم إلى ما يجب إدخاله:

```swift
TextField("input your name", text: $text)
```

عندما يكون الحقل فارغاً، يظهر هذا النص بلون رمادي.

![textfield](../../RESOURCE/014_textfield.png)

#### ربط البيانات

`TextField` لا يقوم بحفظ المدخلات بشكل مستقل. بل يحتاج إلى متغير مرتبط به لإدارة البيانات.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

المحتوى الذي يُدخله المستخدم يُحفَظ مباشرة في المتغير `text`، بينما يتولى `TextField` فقط مسؤولية واجهة الإدخال.

والرمز `$` يشير إلى الربط (`Binding`):

```swift
$text
```

هذه ليست قيمة عادية، بل قيمة من نوع `Binding`.

وظيفتها هي إنشاء اتصال بين الواجهة والبيانات:

- عندما يكتب المستخدم داخل `TextField`، تتحدث `text` تلقائياً
- وعندما تتغير `text`، يتحدث `TextField` أيضاً تلقائياً

مثال:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("text:\(text)")
            TextField("input your name", text: $text)
                .frame(width: 150)
        }
    }
}
```

عند إدخال النص داخل `TextField`، سيعرض `Text` الموجود فوقه المحتوى نفسه بشكل متزامن وفوري.

![textField](../../RESOURCE/014_textfield1.png)

### الربط مع نوع رقمي

عندما نحتاج إلى إدخال أرقام، يجب أن نربط الحقل بمتغير من النوع الرقمي المناسب:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

عندما يُدخل المستخدم مبلغاً، سيقوم `TextField` بتحليل الإدخال وتحديث قيمة `number` تلقائياً.

## إضافة حقل الإدخال

بعد أن فهمنا الاستخدام الأساسي لـ `TextField`, يمكننا تطبيقه في مشروع الحصّالة.

وبما أن الحصّالة تحتاج إلى إدخال "مبلغ"، فنحن نستخدم طريقة الربط بالنوع الرقمي (`Int/Double`)، ونضيف متغيراً جديداً باسم `number` لحفظ المبلغ الذي يُدخله المستخدم:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
        }
    }
}
```

الآن سيعرض `TextField` القيمة الحالية لـ `number` بشكل افتراضي، وهي `0`.

وعندما نفرغ المحتوى، سيظهر النص الإرشادي `"Amount"`.

وهذا يوضح مرة أخرى أن `TextField` يعرض قيمة المتغير المرتبط به، ولا يحتفظ بالمحتوى بنفسه.

### مشكلة حجم حقل الإدخال

في الواجهة الحالية، سنلاحظ أن `TextField` لا يحتوي على إطار، وأنه يعرض فقط الرقم `0`، كما يبدو المحتوى فيه بمحاذاة اليسار.

الشكل الحالي:

![textfield](../../RESOURCE/014_textfield2.png)

وذلك لأن `TextField` يشغل العرض الكامل للعنصر الأب بشكل افتراضي.

يمكننا التحقق من ذلك بإضافة لون خلفية:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

النتيجة:

![textfield](../../RESOURCE/014_textfield3.png)

سنلاحظ أن `TextField` يملأ عرض السطر بالكامل.

### تحديد عرض ثابت

إذا أردنا أن يكون حقل الإدخال أكثر إحكاماً، فيمكننا استخدام `frame` لتحديد عرضه:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

النتيجة:

![textfield](../../RESOURCE/014_textfield4.png)

### إضافة حد ومسافة داخلية

بما أن `TextField` لا يملك إطاراً افتراضياً، فيمكننا تنسيقه يدوياً:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

الآن أصبح حقل الإدخال يبدو أكثر شبهاً بحقل إدخال "قياسي".

![textfield](../../RESOURCE/014_textfield5.png)

## الإطار `border`

في SwiftUI، يُستخدم `border` لإضافة إطار إلى العنصر.

الاستخدام الأساسي:

```swift
border(Color.black, width: 1)
```

حيث إن:

- `Color.black` تمثل لون الإطار
- `width` تمثل سماكة الإطار

وفي `TextField` نستخدم:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

وهذا يعني إضافة إطار أسود بعرض `1 pt` حول حقل الإدخال.

ويمكنك أيضاً تجربة ألوان أخرى مثل `Color.blue` أو `Color.green`، أو جعل الإطار أكثر سماكة عبر `width: 2`.

## زر الحفظ

الآن أصبح لدينا:

- المتغير `amount` لعرض المبلغ الإجمالي
- حقل `TextField` لإدخال المبلغ
- والمتغير `number` المرتبط بحقل الإدخال

والشيفرة الحالية هي:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
        }
    }
}
```

### إضافة الزر

بعد ذلك، نحتاج إلى إضافة زر ليقوم بتنفيذ عملية حفظ المبلغ.

```swift
Button("Save") {
    
}
```

### تنفيذ منطق الادخار

ما نريده هو أن يُدخل المستخدم مبلغاً، ثم يضغط على الزر، فيُضاف هذا المبلغ تلقائياً إلى المبلغ الإجمالي.

```swift
Button("Save") {
    amount += number
}
```

هنا نستخدم عامل الإسناد المركب، بحيث تتم إضافة مبلغ الإدخال `number` إلى المبلغ الإجمالي `amount`.

### إعادة تعيين مبلغ الإدخال

لكن توجد الآن مشكلة: في كل مرة نضغط فيها على الزر، لا يتم مسح القيمة الموجودة داخل حقل الإدخال.

فإذا أدخل المستخدم `10` ثم ضغط حفظ، سيظل الحقل يعرض `10`، وهذا قد يسبب إرباكاً عند الإدخال التالي.

والسبب هو أن `TextField` مرتبط بالمتغير `number`. فعند الضغط على الزر، قمنا بتعديل `amount` فقط، ولم تتغير `number`، ولذلك بقيت القيمة القديمة معروضة.

لذلك نحتاج إلى إضافة منطق تنظيف. فعند الضغط على الزر، يجب أولاً إضافة المبلغ إلى الإجمالي، ثم إعادة تعيين قيمة الإدخال:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

الآن، عندما يُدخل المستخدم مبلغاً ثم يضغط حفظ، تتم إضافته إلى الإجمالي، ثم تُعاد قيمة `number` إلى `0` استعداداً للإدخال التالي.

وبهذا نكون قد أنجزنا منطق الادخار الكامل في مشروع الحصّالة.

## تحسين الواجهة

بعد اكتمال الوظيفة، يمكننا إجراء بعض التحسينات البسيطة على الواجهة، مثل إضافة صورة خلفية وتنسيق مظهر الزر.

إضافة نمط للزر:

```swift
.buttonStyle(.borderedProminent)
```

إضافة صورة خلفية:

```swift
.background {
    Image("1")
}
```

الآن نكون قد أكملنا مشروع الحصّالة بالكامل.

## الشيفرة الكاملة

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

النتيجة:

![Piggy Bank](../../RESOURCE/014_view.png)

الآن يمكننا تجربة إيداع `100` أو مبلغ أكبر، للتحقق من أن منطق الحصّالة يعمل بشكل صحيح.

كما يمكننا تشغيل الحصّالة على المحاكي أو على جهاز فعلي لتجربة التطبيق الذي طورناه.

### مخرجات التصحيح

وللتحقق من صحة المنطق، يمكننا أيضاً إضافة شيفرة تصحيح داخل الزر:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

وفي كل مرة نضغط فيها زر الحفظ، سنرى مخرجات التصحيح المقابلة، مما يساعدنا على التأكد من أن منطق الشيفرة يعمل بالشكل الصحيح.

```text
---Saving---
amount:11
number:0
```
