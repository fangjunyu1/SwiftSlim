# جدار الصور

في هذا الدرس، سننشئ صفحة جدار صور.

![view](../../../Resource/032_view13.png)

في هذا المثال، سنراجع معرفة `extension` و `self` والمثيلات، ونتعلم أشكال `Shape` الشائعة الاستخدام في SwiftUI.

من خلال هذه المعارف، يمكننا قص الصور العادية إلى أنماط مختلفة مثل الدائرة، والمستطيل بزوايا دائرية، والشكل الكبسولي، والشكل البيضاوي، وإضافة تأثير إطار إلى الصور.

سنستخدم في هذا الدرس عدة مفاهيم جديدة: `Shape` و `clipShape` و `strokeBorder` و `overlay`.

من بينها، يُستخدم `clipShape` لقص شكل العرض، ويُستخدم `strokeBorder` لرسم إطار الشكل، ويُستخدم `overlay` لتراكب عرض جديد فوق العرض الحالي.

## مواد الصور

قبل البدء، نحتاج إلى تجهيز عدة صور.

يمكنك استخدام صورك الخاصة، أو استخدام الصور النموذجية المقدمة في هذا الدرس.

أمثلة الصور في هذا الدرس مأخوذة من موقع [Pixabay](https://pixabay.com/):

[منظر طبيعي](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)، [ثعلب](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)، [مبنى](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)، [زهور](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)، [بجعة](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

بعد تنزيل الصور، أضفها إلى مجلد الموارد `Assets`، وسمّها بالترتيب `1` و `2` و `3` و `4` و `5`.

![assets](../../../Resource/032_view17.png)

بهذا، يمكننا عرض الصور في SwiftUI باستخدام `Image("1")` و `Image("2")`.

## عرض الصور

أولاً، نعرض 5 صور داخل `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

تأثير العرض:

![view](../../../Resource/032_view.png)

في هذا الكود، نستخدم `ScrollView` لتنفيذ عرض قابل للتمرير لقائمة الصور، ونستخدم `VStack` لترتيب الصور المتعددة من الأعلى إلى الأسفل.

تُضبط طريقة عرض كل صورة عبر `.resizable()` و `.scaledToFit()` و `.frame(width: 300)`، بحيث يمكن تكبير الصورة أو تصغيرها، مع الحفاظ على نسبتها كاملة، وتقييد عرضها.

تُستخدم `.padding(.vertical, 100)` على `VStack` لزيادة المسافة العلوية والسفلية، وتجنب اقتراب الصورة الأولى والأخيرة كثيراً من حافة الشاشة.

أما `.ignoresSafeArea()` في النهاية، فتعني أن عرض التمرير يتجاهل منطقة الأمان، بحيث يمكن أن تمتد الصور إلى أعلى الشاشة وأسفلها أثناء التمرير، ويصبح عرض الصفحة أكثر اكتمالاً.

لكن الآن، تستخدم الصور الخمس كلها المعدِّلات نفسها:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

عندما نرى كوداً مكرراً، يمكننا التفكير في استخدام `extension` لتنظيمه.

## استخدام extension لتنظيم نمط الصور

يمكننا توسيع `Image` بإضافة طريقة مخصصة لجدار الصور:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

هنا، أضفنا إلى نوع `Image` طريقة باسم `photoGalleryStyle`.

تحتوي هذه الطريقة داخلياً على `.resizable()` و `.scaledToFit()` و `.frame(width: 300)` التي استخدمناها بشكل متكرر سابقاً. أي أنها تجمع أكواد تكبير الصورة أو تصغيرها، وعرضها مع الحفاظ على النسبة، وتحديد عرضها في مكان واحد.

بعد استخدام هذا الامتداد، يصبح كود الصورة الأصلي:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

قابلاً للتبسيط إلى:

```swift
Image("1")
    .photoGalleryStyle()
```

بهذا، تحتاج كل صورة فقط إلى استدعاء `.photoGalleryStyle()` لتطبيق نمط جدار الصور نفسه، فيصبح الكود أبسط، كما يصبح تعديله لاحقاً بشكل موحد أسهل.

## فهم self

في طريقة الامتداد، كتبنا `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

يشير `self` هنا إلى مثيل الصورة الحالي الذي يستدعي هذه الطريقة.

على سبيل المثال:

```swift
Image("1")
    .photoGalleryStyle()
```

في هذا الكود، يتم استدعاء `photoGalleryStyle()` بواسطة `Image("1")`، لذلك يشير `self` داخل الطريقة إلى صورة `Image("1")` هذه.

يمكن فهم الأمر ببساطة هكذا: من يستدعي هذه الطريقة، يمثله `self`.

تحتاج إلى ملاحظة أن معدِّلات SwiftUI تعيد باستمرار نتيجة عرض جديدة. لذلك، ما تعيده `photoGalleryStyle()` هو عرض بعد تطبيق المعدِّلات، وليس مجرد `Image` الأصلية نفسها.

## أشكال الصور

الآن، أصبحت الصور قابلة للعرض بشكل طبيعي. لكن هذه الصور تكون مستطيلة افتراضياً، ويبدو مظهرها عادياً نسبياً.

إذا أردت فقط جعل الصور بزوايا دائرية، يمكنك استخدام `.cornerRadius()` مباشرة:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

تأثير العرض:

![color](../../../Resource/032_view1.png)

تعني `.cornerRadius(20)` إضافة زوايا دائرية بمقدار `20 pt` إلى الصورة. بالنسبة إلى الصور العادية ذات الزوايا الدائرية، هذه الكتابة كافية بالفعل.

لكن `.cornerRadius()` لا يعالج إلا تأثير الزوايا الدائرية، وهو مناسب لصنع صور عادية بزوايا دائرية. إذا أردنا تحويل الصور إلى أشكال مختلفة أكثر، فهذا المعدِّل وحده لا يكفي.

في هذه الحالة، نحتاج إلى استخدام `Shape` في SwiftUI. يمكن أن يمثل `Shape` أشكالاً مختلفة، وعند دمجه مع `clipShape`، يمكننا قص الصورة إلى الشكل المقابل.

## التعرف على Shape

في SwiftUI، يشير `Shape` إلى الشكل الرسومي. وهو، مثل `View`، من الأنواع شائعة الاستخدام جداً في SwiftUI.

تشمل أشكال `Shape` الشائعة: الدائرة، والمستطيل، والمستطيل بزوايا دائرية، والشكل الكبسولي، والشكل البيضاوي. لملاحظة مظهر الأشكال المختلفة بشكل أوضح، ستضبط الأمثلة التالية لوناً وحجماً مختلفين لكل شكل.

في هذه الأمثلة، تُستخدم `.fill()` لتعبئة الشكل بلون، وتُستخدم `.frame()` لتحديد حجم عرض الشكل. اللون هنا فقط للتمييز بين الأشكال المختلفة، وليس لوناً ثابتاً للشكل نفسه.

### Circle الدائرة

يمثل `Circle` دائرة. ويُستخدم كثيراً في الصور الرمزية، والأزرار الدائرية، والصور الدائرية، وغيرها من تأثيرات الواجهة.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle المستطيل

يمثل `Rectangle` مستطيلاً. وهو أحد أكثر الأشكال الأساسية، ويمكن استخدامه أيضاً لصنع الخلفيات، أو تقسيم المناطق، أو الإطارات العادية.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle المستطيل بزوايا دائرية

يمثل `RoundedRectangle` مستطيلاً بزوايا دائرية. ويُستخدم `cornerRadius` لتحديد حجم الزوايا الدائرية.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule الشكل الكبسولي

يمثل `Capsule` شكلاً كبسولياً. تكون نهايتاه على شكل قوسين دائريين، ويُستخدم كثيراً في أزرار الكبسولة وخلفيات الوسوم وغيرها من تأثيرات الواجهة.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse الشكل البيضاوي

يمثل `Ellipse` شكلاً بيضاوياً. وهو يشبه `Circle`، لكنه يظهر كقطع ناقص عندما يختلف العرض عن الارتفاع.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

من خلال هذه الأمثلة، يمكننا أن نرى أن `Shape` نفسه يمكن عرضه مباشرة كشكل رسومي. بعد ذلك، سنستخدم هذه الأشكال `Shape` مع `clipShape` لقص الصور، حتى تظهر الصور بأشكال مختلفة.

## استخدام clipShape لقص الصور

الآن، يمكننا استخدام `clipShape` لقص الصور إلى أشكال مختلفة.

على سبيل المثال، قص الصورة الأولى إلى دائرة:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

يعني هذا الكود: اعرض صورة أولاً، ثم استخدم `Circle()` لقصها إلى دائرة.

![view](../../../Resource/032_view2.png)

الصيغة الأساسية لـ `clipShape` هي:

```swift
.clipShape(الشكل)
```

أضف `.clipShape(...)` بعد العرض، واكتب داخل القوسين الشكل الذي تريد القص إليه.

على سبيل المثال:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

الآن، نقص الصور الخمس إلى أشكال مختلفة:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

تأثير العرض:

![view](../../../Resource/032_view8.png)

من بينها، يكون تأثير القص باستخدام `Rectangle()` قريباً من الصورة المستطيلة العادية، لذلك لا يكون التغير البصري واضحاً، ويُستخدم هنا أساساً للمقارنة مع الأشكال الأخرى.

الآن، لم تعد الصور مجرد مستطيلات عادية، بل أصبحت تمتلك أشكالاً مختلفة.

## إضافة إطار للصور

إذا أردنا إضافة إطار إلى الصورة الدائرية، فقد نفكر في استخدام `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

لكن النتيجة التي نحصل عليها عادة ليست إطاراً دائرياً، بل إطاراً مستطيلاً.

![view](../../../Resource/032_view9.png)

وذلك لأن `border` يضيف الإطار وفق المنطقة المستطيلة للعرض، وليس وفق الشكل الناتج بعد القص بـ `clipShape`.

لذلك، إذا أردنا إطاراً دائرياً، فلا يمكننا استخدام `border` مباشرة.

## استخدام strokeBorder لرسم إطار الشكل

في SwiftUI، يمكن لـ `strokeBorder` أن يرسم إطاراً داخلياً لهذه الأشكال الشائعة من `Shape`.

على سبيل المثال، رسم إطار دائري:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

يعني هذا الكود: ارسم لـ `Circle` إطاراً بنياً، ويكون عرض الإطار `10 pt`.

![view](../../../Resource/032_view12.png)

هنا يجب الانتباه إلى أن `strokeBorder` لا يضيف الإطار إلى الصورة مباشرة، بل يرسم إطاراً للشكل `Circle()`.

أي أن ما نحصل عليه من هذا الكود هو مجرد إطار دائري مستقل، ولا علاقة له بالصورة بعد.

إذا أردت إظهار هذا الإطار الدائري فوق الصورة، فستحتاج إلى متابعة استخدام `overlay` لتراكب الإطار فوق الصورة.

## استخدام overlay لتراكب الإطار

`overlay` هو معدِّل عرض يمكنه تراكب عرض جديد فوق العرض الحالي.

يمكن فهم بنيته الأساسية بهذا الشكل:

```swift
العرض الحالي
    .overlay {
        العرض المتراكب
    }
```

في هذا المثال، العرض الحالي هو الصورة التي تم قصها بالفعل إلى دائرة:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

والعرض الجديد الذي نريد تراكبه هو إطار دائري:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

لذلك، يمكن دمج الصورة والإطار معاً:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

يشير `overlay` هنا إلى تراكب عرض جديد فوق العرض الحالي.

داخل `overlay`، سيتبع الإطار نطاق عرض الصورة الحالية عند التراكب، لذلك لا نحتاج إلى تعيين `frame` منفصل مرة أخرى. طالما كان شكل الإطار مطابقاً لشكل القص، فسيلتصق الإطار بالصورة.

![view](../../../Resource/032_view10.png)

النتيجة النهائية هي أن إطاراً دائرياً يغطي أعلى الصورة الدائرية.

بالمقارنة مع `ZStack`، يكون `overlay` أنسب لهذا النوع من سيناريوهات “إضافة زخرفة إلى العرض الحالي”. الصورة هي العنصر الأساسي، والإطار مجرد تأثير إضافي، لذلك يكون استخدام `overlay` أوضح.

## إكمال جدار الصور

الآن، نضيف لكل صورة الشكل والإطار المطابقين:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

تأثير العرض:

![view](../../../Resource/032_view13.png)

بهذا، اكتملت صفحة جدار صور أساسية.

في هذه الصفحة، نستخدم `ScrollView` لتنفيذ عرض قابل للتمرير، ونستخدم `Image` لعرض الصور، ونستخدم `clipShape` لقص أشكال الصور، ثم نضيف الإطارات عبر `overlay` و `strokeBorder`.

## الكود الكامل

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## الملخص

في هذا الدرس، أكملنا صفحة جدار صور.

![view](../../../Resource/032_view13.png)

في هذا المثال، استخدمنا أولاً `Image` لعرض الصور، ثم استخدمنا `extension` لإضافة طريقة `photoGalleryStyle` إلى `Image`، لتنظيم كود نمط الصور المكرر.

بعد ذلك، تعلمنا أشكال `Shape` الشائعة في SwiftUI، مثل `Circle` و `Rectangle` و `RoundedRectangle` و `Capsule` و `Ellipse`. هذه الأشكال لا يمكن عرضها مباشرة فقط، بل يمكن استخدامها أيضاً مع `clipShape` لقص العرض.

على سبيل المثال:

```swift
.clipShape(Circle())
```

تعني قص العرض إلى دائرة.

في النهاية، استخدمنا `overlay` و `strokeBorder` لإضافة إطار مطابق للشكل إلى الصور. يجب الانتباه إلى أن `border` يرسم الإطار عادة وفق المنطقة المستطيلة للعرض، وإذا أردنا أن يتبع الإطار شكلاً دائرياً أو كبسولياً أو بيضاوياً، فمن الأنسب استخدام `Shape` مطابق للتراكب.

من خلال هذا الدرس، لم نكمل تأثير جدار الصور فقط، بل فهمنا أيضاً طريقة الدمج الشائعة بين `Shape` و `clipShape` و `strokeBorder` و `overlay` في الواجهة.

## تمارين ما بعد الدرس

### 1، إضافة خلفية لجدار الصور

أضف صورة خلفية بملء الشاشة إلى صفحة جدار الصور.

المطلوب: يمكن لصورة الخلفية أن تملأ الشاشة كلها، وأن تتجاهل منطقة الأمان.

### 2، إطار متدرج

عدّل الإطار الأحادي اللون الحالي إلى إطار بتدرج خطي.

يمكنك محاولة استخدام `LinearGradient` لتنفيذ تأثير إطار أكثر ثراءً.

### 3، محاكاة إطار صورة

ابحث على الإنترنت عن بعض أنماط إطارات الصور الحقيقية، وحاول استخدام `overlay` لتراكب إطار صورة، حتى تبدو الصورة أقرب إلى تأثير إطار حقيقي.

تأثير عرض التمرين:

![button](../../../Resource/032_view15.jpeg)

### 4، تنفيذ إطار زر بزوايا دائرية

في التطوير الفعلي، كثيراً ما تستخدم الأزرار إطار مستطيل بزوايا دائرية.

حاول صنع زر بزوايا دائرية، واستخدم `RoundedRectangle` و `strokeBorder` لإضافة إطار بزوايا دائرية إلى الزر.

تأثير عرض التمرين:

![button](../../../Resource/032_view14.png)

### سؤال للتفكير

إذا لم تكن تريد استخدام إطار بلون واحد، ولا إطار بتدرج، بل أردت أن يظهر الإطار بنمط زخرفي معيّن، فكيف يمكن تنفيذ ذلك؟

يمكنك محاولة البحث عن معلومات، والتعرف على استخدامات `overlay` أو `mask` أو `ImagePaint` ذات الصلة.

تأثير عرض التمرين:

![button](../../../Resource/032_view16.png)
