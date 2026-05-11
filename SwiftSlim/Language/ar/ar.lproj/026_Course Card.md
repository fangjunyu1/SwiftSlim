# بطاقة الدورة

هذا الدرس هو درس مراجعة مرحلية، وسننجز فيه «بطاقة دورة».

من خلال هذا التمرين، يمكننا مراجعة ما تعلمناه سابقًا مثل `Text` و`Image` و`VStack` و`HStack` و`Spacer()` و`.padding()` و`.background()` و`.cornerRadius()`، ونتعلم كيف نجمع عدة عروض صغيرة في وحدة عرض كاملة.

تأثير بطاقة الدورة:

![view](../../../Resource/026_view.png)

تتكون بطاقة الدورة هذه أساسًا من عدة أجزاء:

- مستوى الدورة: `مبتدئ`
- محتوى الدورة: `20+ درسًا`
- عنوان الدورة: `دليل SwiftUI للمبتدئين`
- وصف الدورة
- الزر: `ابدأ التعلم`
- خلفية الدورة: أيقونة Swift وخلفية باللون النيلي

يمكننا إكمال هذا العرض داخل `ContentView`.

## المنطقة العلوية

أولًا، ننشئ المنطقة العلوية لبطاقة الدورة.

![view](../../../Resource/026_view1.png)

يعرض الجانب الأيسر من المنطقة العلوية مستوى الدورة، ويعرض الجانب الأيمن محتوى الدورة.

لأن هذين المحتويين مرتبان أفقيًا، يمكن استخدام `HStack`.

```swift
var topView: some View {
    HStack {
        Text("مبتدئ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ درسًا")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

هنا فصلنا المنطقة العلوية في خاصية محسوبة:

```swift
var topView: some View
```

ميزة ذلك أنه يجعل `body` أوضح.

تستخدم المنطقة العلوية أساسًا هذه العناصر:

- `HStack`: يجعل النصين مرتبين أفقيًا.
- `Text`: يعرض محتوى النص.
- `Spacer()`: يدفع النص الأيسر إلى اليسار، ويدفع النص الأيمن إلى اليمين.
- `.font(.footnote)`: يضبط نمط نص أصغر.
- `.fontWeight(.bold)`: يضبط النص ليكون عريضًا.
- `.foregroundStyle(Color.white)`: يضبط لون المقدمة إلى الأبيض.
- `.padding(.vertical, 10)`: يضبط الحشوة العلوية والسفلية.
- `.padding(.horizontal, 16)`: يضبط الحشوة اليمنى واليسرى.
- `.background(Color.white.opacity(0.15))`: يضبط خلفية بيضاء شبه شفافة.
- `.cornerRadius(20)`: يضبط الزوايا الدائرية.

يستخدم `مبتدئ` نوعين من `.padding()` في اتجاهين:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

هذا يجعل للنص مساحة من الأعلى والأسفل ومن اليمين واليسار، فيبدو أقرب إلى وسم.

`Color.white.opacity(0.15)` يعني لونًا أبيض بدرجة عتامة `15%`، أي أبيض خفيف جدًا.

### إضافة خلفية البطاقة

أنشأنا سابقًا `topView`، لكن إنشاء العرض فقط لا يجعله يظهر تلقائيًا.

في SwiftUI، المحتوى الذي يظهر فعليًا على الواجهة يجب أن يُكتب داخل `body`.

لذلك، يمكن أولًا وضع `topView` داخل `body` لعرضه:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

في هذه المرحلة، سترى أن المنطقة العلوية قد ظهرت:

![view](../../../Resource/026_view2.png)

لكن لأن النص داخل `topView` أبيض، والخلفية الافتراضية فاتحة أيضًا، فقد لا يكون واضحًا في الوضع الفاتح.

لذلك، يمكننا إضافة `VStack` في الطبقة الخارجية، ثم ضبط الحشوة ولون الخلفية والزوايا الدائرية للمنطقة كلها:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

تأثير العرض:

![view](../../../Resource/026_view3.png)

يحتوي `VStack` هنا حاليًا على `topView` واحد فقط، لذلك قد يبدو غير ضروري.

لكننا سنواصل لاحقًا إضافة عنوان الدورة ووصف الدورة ومنطقة الزر. هذه كلها محتويات مرتبة عموديًا، لذلك استخدام `VStack` مسبقًا يسهّل متابعة تركيب العرض لاحقًا.

هنا توجد دالتا `.padding()`، ولكل منهما دور مختلف.

أول `.padding(20)` مكتوبة قبل `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

وهي تتحكم في الهامش الداخلي للبطاقة، أي المسافة بين المحتوى وحافة الخلفية.

ثاني `.padding(30)` مكتوبة بعد `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

وهي تتحكم في الهامش الخارجي للبطاقة، أي المسافة بين البطاقة كلها وحافة الشاشة.

![view](../../../Resource/026_view4.png)

لذلك، حتى إن كان كلاهما `.padding()`، فإن موضع كتابتهما مختلف، وبالتالي يكون التأثير مختلفًا.

## منطقة المحتوى

بعد ذلك، ننشئ منطقة المحتوى في بطاقة الدورة.

تأثير العرض:

![view](../../../Resource/026_view5.png)

تحتوي منطقة المحتوى على عنوان الدورة ووصف الدورة، وهما مرتبان عموديًا، لذلك نستخدم `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("دليل SwiftUI للمبتدئين")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("ابدأ من الصفر مع SwiftUI وتعلّم تطوير واجهات Apple التصريحي بشكل منهجي. من خلال شروحات واضحة وأمثلة عملية، ستتقن تدريجيًا التخطيط والتفاعل وإدارة الحالة لبناء واجهات تطبيقات جميلة ومفيدة.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

تأثير العرض:

![view](../../../Resource/026_view6.png)

يستخدم `VStack` هنا معاملين:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` يعني جعل العروض داخل `VStack` محاذاة إلى جهة البداية.

`spacing: 10` يعني إبقاء مسافة `10 pt` بين العروض داخل `VStack`.

لذلك، سيبدأ ترتيب عنوان الدورة ووصفها من جهة البداية، وسيبقى بينهما مقدار معين من المسافة.

وصف الدورة طويل نسبيًا. إذا عُرض كاملًا، فستصبح البطاقة مرتفعة جدًا، لذلك نستخدم هنا `.lineLimit()` لتقييد عدد الأسطر المعروضة:

```swift
.lineLimit(3)
```

وهو يعني عرض `3` أسطر كحد أقصى. عندما يتجاوز المحتوى هذا الحد، يتم اختصار الجزء الزائد.

### محاذاة العرض إلى جهة البداية

توجد نقطة أخرى يجب الانتباه إليها هنا.

`VStack(alignment: .leading)` يستطيع التحكم فقط في محاذاة العروض داخل `VStack`، ولا يتحكم مباشرة في موقع `VStack` نفسه داخل الحاوية الخارجية.

على سبيل المثال، إذا كان وصف الدورة قصيرًا نسبيًا:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("دليل SwiftUI للمبتدئين")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("بعض المحتوى فقط.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

تأثير العرض:

![view](../../../Resource/026_view7.png)

يمكن أن نرى أن عنوان الدورة ووصفها، رغم أنهما محاذيان إلى جهة البداية داخل `VStack`، فإن `VStack` كله لا يلتصق بأقصى بداية البطاقة.

السبب هو أنه عندما يكون المحتوى قصيرًا نسبيًا، يصبح عرض `VStack` نفسه ضيقًا أيضًا. وعند تنفيذ التخطيط، قد تضع الحاوية الخارجية هذا `VStack` الضيق نسبيًا في المنتصف.

يمكن فهم ذلك هكذا: `VStack(alignment: .leading)` مسؤول عن المحاذاة الداخلية إلى جهة البداية.

لكنه غير مسؤول عن دفع منطقة المحتوى كلها إلى أقصى جهة البداية.

إذا أردنا أن تقترب منطقة المحتوى كلها فعليًا من جهة البداية، يمكن تغليفها بطبقة `HStack` إضافية وإضافة `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("دليل SwiftUI للمبتدئين")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("بعض المحتوى فقط.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

تأثير العرض:

![view](../../../Resource/026_view8.png)

`HStack` هنا تخطيط أفقي.

سيشغل `Spacer()` المساحة المتبقية في الجهة المقابلة، وبذلك يدفع `VStack` في الجهة الأخرى إلى أقصى جهة البداية.

لذلك، يمكن استخدام `HStack + Spacer()` للتحكم في موقع منطقة المحتوى كلها.

في بطاقة الدورة الفعلية، يكون وصف الدورة طويلًا نسبيًا، وغالبًا سيشغل عرضًا أكبر، لذلك قد لا تكون هذه المشكلة واضحة دائمًا. لكن فهم هذا الفرق مهم، لأنك ستواجه حالات مشابهة كثيرًا عند إنشاء تخطيطات النصوص القصيرة لاحقًا.

### التحكم في المسافة بين العروض الداخلية

كتبنا سابقًا `spacing: 10` داخل `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

يُستخدم `spacing` للتحكم في المسافة بين العروض الداخلية.

إذا لم نضبط `spacing`، فسيكون لدى `VStack` أيضًا مسافة افتراضية، لكن المسافة الافتراضية قد لا تطابق التأثير الذي نريده.

في هذا المثال، إذا كانت المسافة بين عنوان الدورة ووصفها صغيرة جدًا، فسيبدو المحتوى مزدحمًا، لذلك نستخدم:

```swift
spacing: 10
```

لإبقاء مقدار من المسافة بينهما.

تأثير العرض:

![view](../../../Resource/026_view9.png)

وبالمثل، المنطقة العلوية ومنطقة المحتوى مرتبتان عموديًا أيضًا، ويمكن استخدام `spacing` للتحكم في المسافة بينهما.

الآن، نضع `topView` و`contentView` داخل `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

تأثير العرض:

![view](../../../Resource/026_view10.png)

يتحكم `VStack(spacing: 20)` هنا في المسافة بين `topView` و`contentView`.

أي أن:

```swift
VStack(alignment: .leading, spacing: 10)
```

يتحكم في المسافة بين عنوان الدورة ووصف الدورة.

```swift
VStack(spacing: 20)
```

يتحكم في المسافة بين المنطقة العلوية ومنطقة المحتوى.

كلاهما `spacing`، لكنهما يعملان على `VStack` مختلف، لذلك يختلف نطاق التأثير أيضًا.

بهذا تكتمل عروض منطقة المحتوى.

## منطقة الزر

بعد ذلك، ننشئ منطقة الزر في الأسفل.

تأثير العرض:

![view](../../../Resource/026_view11.png)

تتكون منطقة الزر أساسًا من أيقونة تشغيل ونص.

يمكننا استخدام `Image` لعرض أيقونة التشغيل، واستخدام `Text` لعرض نص الزر.

هنا ننشئ أولًا مظهر الزر:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("تم النقر على الزر")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("ابدأ التعلم")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

تأثير العرض:

![view](../../../Resource/026_view12.png)

استخدمنا هنا اثنين من `HStack`:

يُستخدم `HStack` الداخلي لترتيب الأيقونة والنص أفقيًا:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("ابدأ التعلم")
}
```

ويُستخدم `HStack` الخارجي مع `Spacer()` لجعل مظهر الزر يظهر ملاصقًا لجهة البداية:

```swift
HStack {
    ...
    Spacer()
}
```

عند النقر على الزر، سيطبع الطرفية `تم النقر على الزر`.

## اكتمال البطاقة الأساسية

الآن، نجمع المنطقة العلوية ومنطقة المحتوى ومنطقة الزر معًا:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

تأثير العرض:

![view](../../../Resource/026_view13.png)

إلى هنا، اكتملت بطاقة دورة أساسية.

## خلفية أيقونة Swift

أخيرًا، نضيف إلى البطاقة خلفية أيقونة Swift شبه شفافة.

![view](../../../Resource/026_view.png)

استخدمنا سابقًا `Color.indigo` كلون للخلفية. في الواقع، لا تقتصر `.background()` على إضافة لون فقط، بل يمكنها أيضًا إضافة عرض كامل.

لذلك، يمكننا أولًا إنشاء عرض خلفية مخصص:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

في عرض الخلفية هذا، نستخدم `VStack` و`HStack` و`Spacer()` لدفع أيقونة Swift إلى الزاوية السفلية في جهة النهاية.

لأن أيقونة Swift تُستخدم فقط كخلفية زخرفية، نستخدم هنا لونًا أبيض شبه شفاف:

```swift
Color.white.opacity(0.15)
```

بهذه الطريقة، لن تكون الأيقونة بارزة أكثر من اللازم، ولن تؤثر في محتوى النص الموجود في المقدمة.

بعد ذلك، نضيف `backgroundView` إلى البطاقة:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

تأثير التنفيذ:

![view](../../../Resource/026_view14.png)

استخدمنا هنا اثنين من `.background()` بشكل متتابع:

```swift
.background(backgroundView)
.background(Color.indigo)
```

أول `.background()` يُستخدم لإضافة خلفية أيقونة Swift.

ثاني `.background()` يُستخدم لإضافة الخلفية باللون النيلي.

بهذا ستظهر أيقونة Swift فوق الخلفية النيلية، وتظهر كجزء من خلفية البطاقة.

ومن هنا يمكن أن نرى أن `.background()` لا تضيف لونًا فقط، بل يمكنها أيضًا إضافة عرض مخصص. كما يمكن الجمع بين عدة `.background()` لإنشاء تأثيرات خلفية أغنى.

إلى هنا، اكتملت بطاقة دورة كاملة.

## الملخص

من خلال بطاقة دورة، راجعنا في هذا الدرس طرق التخطيط الأساسية الشائعة في SwiftUI.

استخدمنا `Text` لعرض النص، واستخدمنا `Image` لعرض أيقونة النظام، واستخدمنا `VStack` و`HStack` و`Spacer()` للتحكم في ترتيب العروض.

تعلمنا `.lineLimit()`، وهي تستطيع تقييد الحد الأقصى لعدد أسطر النص المعروضة. عندما يتجاوز المحتوى هذا الحد، يتم اختصار الجزء الزائد.

وفي الوقت نفسه، راجعنا أيضًا المعدّلات الشائعة مثل `.padding()` و`.background()` و`.cornerRadius()` و`.foregroundStyle()`.

بعد إكمال هذا الدرس، أصبح بإمكاننا جمع عدة عروض صغيرة في وحدة بطاقة كاملة.

وهذا أيضًا أسلوب شائع جدًا في تطوير SwiftUI: نفصل العروض الصغيرة أولًا، ثم نجمعها في واجهة كاملة.

## الكود الكامل

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("مبتدئ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ درسًا")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("دليل SwiftUI للمبتدئين")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("ابدأ من الصفر مع SwiftUI وتعلّم تطوير واجهات Apple التصريحي بشكل منهجي. من خلال شروحات واضحة وأمثلة عملية، ستتقن تدريجيًا التخطيط والتفاعل وإدارة الحالة لبناء واجهات تطبيقات جميلة ومفيدة.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("تم النقر على الزر")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("ابدأ التعلم")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
