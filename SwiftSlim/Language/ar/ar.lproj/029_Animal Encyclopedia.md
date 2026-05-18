# موسوعة الحيوانات 

في هذا الدرس، سنواصل التدريب على إنشاء العروض المخصصة ونقل البيانات.

سننشئ عرضا بسيطا لموسوعة الحيوانات. ستعرض الصفحة خمسة حيوانات، وعند النقر على أحدها ستظهر واجهة تفاصيل تعرض صورة الحيوان ومنطقة انتشاره وموطنه ووصفه.

النتيجة النهائية:

![view](../../../Resource/029_view.png)

من خلال هذا المثال، يمكننا التدريب على تنسيق بنية البيانات وعرض القائمة وتفاعل النقر وواجهة Sheet المنبثقة.

## تجهيز مواد الصور

أولا، نحتاج إلى تجهيز خمس صور للحيوانات:

- الدلفين: `dolphin.jpg`
- الزرافة: `giraffe.jpg`
- الأسد: `lion.jpg`
- الباندا: `panda.jpg`
- الدب القطبي: `polarBear.jpg`

يمكنك استخدام مواد الصور التالية:

[الدلفين](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)، [الزرافة](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)، [الأسد](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)، [الباندا](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)، [الدب القطبي](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

بعد تنزيل الصور، اسحبها إلى مجلد الموارد `Assets` في مشروع Xcode.

![assets](../../../Resource/029_assets.png)

تجدر ملاحظة أنه عند استخدام الصور في الكود، لا نحتاج عادة إلى كتابة اللاحقة `.jpg`.

على سبيل المثال، إذا كان اسم مورد الصورة هو `dolphin`، فاكتب في الكود:

```swift
Image("dolphin")
```

إذا كُتب اسم الصورة بشكل خاطئ، فلن تظهر الصورة بشكل صحيح.

ملاحظة: مواد الصور أعلاه من مشاريع ويكيميديا، ويُنصح عند استخدامها بالاحتفاظ برابط الصورة الأصلي ومعلومات المصدر.

## إنشاء بنية الحيوان

في هذه الصفحة، لكل حيوان عدة معلومات:

- اسم الحيوان
- صورة الحيوان
- الرمز التعبيري للحيوان
- منطقة الانتشار
- الموطن
- وصف الحيوان

إذا وزعنا هذه المعلومات في متغيرات كثيرة، فسيصبح الكود مربكا. لذلك يمكننا إنشاء بنية `Animal` ووضع معلومات الحيوان الواحد معا.

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
```

في هذا الجزء من الكود:

- `id`: المعرّف الفريد للحيوان.
- `name`: اسم الحيوان.
- `imageName`: اسم صورة الحيوان.
- `avatarEmoji`: الرمز التعبيري للحيوان.
- `distributionArea`: منطقة الانتشار.
- `habitat`: الموطن.
- `animalDescription`: وصف الحيوان.

ومن بينها:

```swift
let id = UUID()
```

يُستخدم `id` لتمييز كل حيوان. لأننا سنستخدم لاحقا `ForEach` لعرض قائمة الحيوانات، وسنستخدم أيضا `.sheet(item:)` لعرض التفاصيل حسب الحيوان المحدد، لذلك يجب أن تتبع `Animal` بروتوكول `Identifiable`.

وظيفة `Identifiable` هي إخبار SwiftUI بأن لكل حيوان `id` يمكن تمييز هويته من خلاله.

## إنشاء بيانات الحيوانات

بعد ذلك، ننشئ مصفوفة حيوانات داخل `ContentView`.

تحفظ المصفوفة خمسة عناصر من نوع `Animal`، وكل `Animal` يمثل حيوانا واحدا.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // الدلفين
        Animal(
            name: "الدلفين",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "المحيطات الدافئة والمعتدلة حول العالم.",
            habitat: "المحيطات والمياه الساحلية وبعض الأنهار الكبيرة.",
            animalDescription: "الدلافين ثدييات بحرية ذكية. تعيش في مجموعات، وتتواصل بالأصوات، وتُعرف بسلوكها المرح."
        ),
        // الزرافة
        Animal(
            name: "الزرافة",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "السافانا والغابات المفتوحة في إفريقيا.",
            habitat: "المراعي والسافانا والغابات المفتوحة.",
            animalDescription: "الزرافات أطول الحيوانات البرية. لها أعناق طويلة وأرجل طويلة، وتتغذى عادة على أوراق الأشجار العالية."
        ),
        // الأسد
        Animal(
            name: "الأسد",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "توجد أساسا في إفريقيا جنوب الصحراء، مع مجموعة صغيرة في غرب الهند.",
            habitat: "المراعي والسافانا والغابات المفتوحة.",
            animalDescription: "الأسود قطط كبيرة قوية. تعيش عادة في مجموعات تسمى الزمر، وغالبا ما تُعرف بأنها ملوك عالم الحيوان."
        ),
        // الباندا
        Animal(
            name: "الباندا",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "الغابات الجبلية في وسط الصين.",
            habitat: "غابات الخيزران في المناطق الجبلية الباردة والرطبة.",
            animalDescription: "الباندا من فصيلة الدببة وتُعرف بفروها الأسود والأبيض. تتغذى أساسا على الخيزران، وهي من أكثر الحيوانات تميزا في العالم."
        ),
        // الدب القطبي
        Animal(
            name: "الدب القطبي",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "المناطق القطبية الشمالية حول القطب الشمالي.",
            habitat: "الجليد البحري والمناطق الساحلية والبيئات القطبية الباردة.",
            animalDescription: "الدببة القطبية دببة كبيرة تكيفت مع البيئات الباردة. وهي سباحة قوية وتعتمد أساسا على الجليد البحري لصيد الفقمات."
        )
    ]

    var body: some View {
        Text("موسوعة الحيوانات")
    }
}
```

هنا، `animals` هي مصفوفة:

```swift
let animals: [Animal]
```

يشير `[Animal]` إلى أن هذه المصفوفة تحفظ عدة عناصر من نوع `Animal`.

أي أن `animals` ليست حيوانا واحدا، بل مجموعة من الحيوانات.

## عرض قائمة الحيوانات

الآن، يمكننا استخدام `ForEach` لعرض قائمة الحيوانات.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

نتيجة العرض:

![view](../../../Resource/029_view1.png)

في هذا الجزء من الكود:

```swift
ForEach(animals) { animal in
    ...
}
```

يعني ذلك المرور على مصفوفة `animals`.

في كل دورة، يمثّل `animal` الحيوان الحالي الذي يتم عرضه.

على سبيل المثال، في الدورة الأولى يكون `animal` هو الدلفين؛ وفي الدورة الثانية يكون `animal` هو الزرافة.

لذلك، يمكننا عرض معلومات الحيوان الحالي بالطريقة التالية:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

وبذلك يمكن عرض الحيوانات الخمسة.

## جعل قائمة الحيوانات قابلة للنقر

الآن أصبحت القائمة معروضة، لكنها لا تزال غير قابلة للنقر.

إذا أردنا إظهار التفاصيل بعد النقر على حيوان معين، فعلينا أولا تسجيل "الحيوان المحدد حاليا".

لذلك، نضيف متغير حالة داخل `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

هنا، `selectedAnimal` هو نوع اختياري `Animal?`.

هذا يعني أنه قد يحتوي على حيوان، وقد لا يحتوي على أي حيوان.

القيمة الافتراضية هي `nil`، وهذا يعني أنه في البداية لا يوجد أي حيوان محدد.

بعد ذلك، نحول كل صف من صفوف الحيوانات إلى `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

النقطة الأساسية هي هذا السطر من الكود:

```swift
selectedAnimal = animal
```

عندما ينقر المستخدم على حيوان معين، نحفظ هذا الحيوان في `selectedAnimal`.

على سبيل المثال، إذا نقر المستخدم على الدلفين، فسيحفظ `selectedAnimal` الدلفين.

وإذا نقر المستخدم على الباندا، فسيحفظ `selectedAnimal` الباندا.

أي أن `selectedAnimal` يُستخدم لتسجيل الحيوان الذي نقر عليه المستخدم حاليا.

## واجهة Sheet المنبثقة

الآن أصبح بإمكاننا تسجيل "الحيوان الذي تم النقر عليه حاليا" من خلال الزر.

بعد ذلك، نحتاج إلى تنفيذ واجهة منبثقة لعرض تفاصيل الحيوان.

![view](../../../Resource/029_view2.png)

في SwiftUI، يمكن استخدام `Sheet` لتحقيق هذا التأثير المنبثق.

يمكن فهم `Sheet` على أنه صفحة مؤقتة تنبثق فوق الصفحة الحالية. وبعد أن ينتهي المستخدم من مشاهدة المحتوى، يمكنه السحب إلى الأسفل لإغلاقها.

## مثال على Sheet

قبل عرض تفاصيل الحيوان فعليا، لنستخدم مثالا بسيطا لفهم كيفية ظهور `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("عرض Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("واجهة Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

نتيجة العرض:

![view](../../../Resource/029_view3.png)

في هذا الكود، أنشأنا قيمة منطقية:

```swift
@State private var showSheet = false
```

القيمة الافتراضية لـ `showSheet` هي `false`، وهذا يعني أن `Sheet` لا يظهر في البداية.

عند النقر على الزر:

```swift
showSheet.toggle()
```

يعني `toggle()` تبديل القيمة المنطقية.

إذا كانت القيمة الأصلية `false`، فستصبح `true` بعد استدعاء `toggle()`.

وإذا كانت القيمة الأصلية `true`، فستصبح `false` بعد استدعاء `toggle()`.

لذلك، بعد النقر على الزر، سيتغير `showSheet` من `false` إلى `true`.

عندما يصبح `showSheet` هو `true`، سيُظهر الجزء التالي من الكود `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("واجهة Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

يعني هذا الكود: عندما يكون `showSheet` هو `true`، تظهر `Sheet` ويُعرض داخلها `Text("واجهة Sheet")`.

نتيجة العرض:

![view](../../../Resource/029_view4.png)

هذه الطريقة مناسبة لإظهار محتوى ثابت.

على سبيل المثال، إظهار صفحة إعدادات أو صفحة شرح أو صفحة تنبيه بعد النقر على زر.

### موضع كتابة Sheet

رغم أن `Sheet` واجهة منبثقة، فإنه في SwiftUI لا يُكتب كعرض مستقل مثل `Text()` أو `Image()`، بل يُستخدم كمعدّل عرض.

أي أن `.sheet(...)` يشبه المعدّلات مثل `.font()` و`.padding()` و`.shadow()`، ويجب إضافته بعد أحد العروض.

مثال:

```swift
Button("عرض Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("واجهة Sheet")
}
```

في هذا المثال، أُضيفت `.sheet` بعد `Button`.

عندما يصبح `showSheet` هو `true`، سيعرض SwiftUI `Sheet` ويُظهر المحتوى الموجود داخل الأقواس المعقوفة:

```swift
Text("واجهة Sheet")
```

لكن في التطوير الفعلي، إذا كانت الصفحة تحتوي على عدة أزرار، فعادة لا نضيف `.sheet` لكل زر.

الطريقة الأكثر شيوعا هي إضافة `.sheet` بعد العرض الخارجي.

مثال:

```swift
VStack {
    Button("عرض Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("واجهة Sheet")
}
```

يتولى الزر تعديل `showSheet`، بينما يتولى العرض الخارجي إظهار `Sheet` حسب ما إذا كان `showSheet` يساوي `true`.

## ربط Sheet بقيمة اختيارية

الصيغة التي تعلمناها سابقا هي:

```swift
.sheet(isPresented: $showSheet) {
    Text("واجهة Sheet")
}
```

هذه الصيغة مناسبة للتحكم في إظهار وإخفاء صفحة ثابتة.

لكن في مثال موسوعة الحيوانات، لا نحتاج فقط إلى معرفة "هل يجب إظهار `Sheet`"، بل نحتاج أيضا إلى معرفة "أي حيوان تم النقر عليه".

مثال:

إذا نقر المستخدم على الدلفين، فيجب أن تعرض `Sheet` تفاصيل الدلفين.

إذا نقر المستخدم على الباندا، فيجب أن تعرض `Sheet` تفاصيل الباندا.

لذلك، من الأنسب هنا استخدام صيغة أخرى من Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // المحتوى المعروض داخل Sheet
}
```

في هذا الكود، ترتبط `Sheet` بقيمة اختيارية هي `selectedAnimal`.

يجب الانتباه هنا إلى أن ما بعد `item:` هو `$selectedAnimal`، وليس `selectedAnimal`.

لأن `Sheet` لا يقرأ قيمة `selectedAnimal` فقط، بل يحتاج أيضا إلى تحديد ما إذا كان سيظهر بناء على تغيّرها.

يمكن فهم هذا الكود بهذه الطريقة:

- عندما يكون `selectedAnimal` هو `nil`، لا تُعرض `Sheet`.
- عندما يكون لدى `selectedAnimal` قيمة، تُعرض `Sheet`.
- عندما تُغلق `Sheet`، سيعيد SwiftUI قيمة `selectedAnimal` إلى `nil`.

سيمرر SwiftUI الحيوان المحفوظ في `selectedAnimal` إلى `animal` داخل الأقواس المعقوفة.

أي أن `.sheet(item:)` لا تتحكم في الظهور فقط، بل تمرر أيضا البيانات المحددة إلى `Sheet`.

## استخدام Sheet لعرض اسم الحيوان

الآن، لا نتعجل في إنشاء واجهة تفاصيل معقدة.

لجعل الكود أسهل للفهم، سنعرض أولا اسم الحيوان الحالي داخل `Sheet`.

أضف `.sheet(item:)` بعد `VStack`:

```swift
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
                        .cornerRadius(20)
                    
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
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

أهم جزء هنا هو هذا الكود:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

عندما يكون لدى `selectedAnimal` قيمة، ستظهر `Sheet`.

`animal` داخل الأقواس المعقوفة هو الحيوان المحدد حاليا.

لذلك:

```swift
Text(animal.name)
```

سيعرض اسم الحيوان الذي تم النقر عليه حاليا.

على سبيل المثال، عند النقر على `الدلفين`، ستعرض Sheet `الدلفين`.

وعند النقر على `الباندا`، ستعرض `Sheet` `الباندا`.

وبذلك نكون قد حققنا تأثير عرض أسماء مختلفة عند النقر على حيوانات مختلفة.

عرض اسم الحيوان:

![view](../../../Resource/029_view5.png)

لكن تفاصيل الحيوان لا ينبغي أن تعرض الاسم فقط، بل يجب أن تعرض الاسم ومنطقة الانتشار والموطن والوصف أيضا.

إذا كتبنا كل هذه الأكواد داخل `.sheet`، فسيصبح الكود طويلا وغير مريح للقراءة.

لذلك، سننشئ بعد ذلك عرضا مخصصا جديدا مسؤولا فقط عن عرض تفاصيل الحيوان.

## إنشاء عرض تفاصيل الحيوان

بعد ذلك، ننشئ عرضا مخصصا جديدا باسم `AnimalDetailView`.

يستقبل هذا العرض كائنا من نوع `Animal` ويعرض تفاصيل الحيوان.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**منطقة الانتشار** ：\(animal.distributionArea)")

                    Divider()

                    Text("**الموطن** ：\(animal.habitat)")

                    Divider()

                    Text("**وصف الحيوان** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

نتيجة العرض:

![view](../../../Resource/029_view2.png)

النقطة الأساسية هنا هي:

```swift
var animal: Animal
```

هذا يعني أن `AnimalDetailView` يحتاج إلى استقبال حيوان من الخارج.

بعد استقبال الحيوان، يمكن لعرض التفاصيل استخدام مختلف معلومات هذا الحيوان:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

أي أن `AnimalDetailView` مسؤول فقط عن عرض الحيوان الذي تم تمريره إليه.

### النص الغامق في Markdown

في عرض التفاصيل، كتبنا كودا مثل هذا:

```swift
Text("**الموطن:** \(animal.habitat)")
```

هنا توجد نقطتان معرفيتان.

الأولى: يستخدم `**الموطن:**` صيغة `Markdown`. النص المحاط بنجمتين سيظهر بخط عريض.

الثانية: `\()` هو إدراج نصي، ويمكنه عرض قيمة المتغير داخل النص.

يعني هذا الكود عرض `الموطن:` بخط عريض أولا، ثم عرض موطن هذا الحيوان.

## عرض واجهة التفاصيل داخل Sheet

بعد إنشاء `AnimalDetailView`، يمكننا العودة إلى `ContentView` واستبدال عرض الاسم الأصلي داخل `Sheet` بعرض التفاصيل.

كان الكود سابقا:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

والآن نغيّره إلى:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

هنا، `animal:` هو اسم معامل `AnimalDetailView`.

أما `animal` الذي بعده فهو الحيوان الحالي الذي مررته `.sheet(item:)`.

أي أننا نمرر الحيوان الذي تم النقر عليه حاليا إلى `AnimalDetailView` لعرضه.

البنية الكاملة:

```swift
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
                        .cornerRadius(20)
                    
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
```

عندما ينقر المستخدم على الحيوان:

```swift
selectedAnimal = animal
```

يتحول `selectedAnimal` من `nil` إلى حيوان محدد، وبعد أن تكتشف `Sheet` أن لدى `selectedAnimal` قيمة، تظهر الواجهة.

تمرر `Sheet` الحيوان الموجود في `selectedAnimal` إلى عرض `AnimalDetailView`، ثم يعرض `AnimalDetailView` تفاصيل الحيوان.

وبذلك نكون قد حققنا وظيفة النقر على قائمة الحيوانات ثم عرض تفاصيل الحيوان المقابل.

## الفرق بين طريقتي كتابة Sheet

الآن، استخدمنا `.sheet(item:)` لإكمال عرض تفاصيل الحيوان.

يمكننا هنا تلخيص الطريقتين الشائعتين لكتابة `Sheet` باختصار.

### الطريقة الأولى: الربط بقيمة منطقية

```swift
@State private var showSheet = false

Button("عرض Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("واجهة Sheet")
}
```

هذه الطريقة مناسبة لإظهار محتوى ثابت، مثل صفحة إعدادات أو صفحة شرح أو صفحة تنبيه.

`showSheet` قيمة منطقية لها حالتان فقط: `true` و `false`.

عندما يكون `showSheet` هو `true`، تظهر `Sheet`.

عندما يكون `showSheet` هو `false`، لا تظهر `Sheet`.

### الطريقة الثانية: الربط بقيمة اختيارية

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

هذه الطريقة مناسبة لإظهار محتوى مختلف بناء على البيانات المحددة.

في هذا الدرس، ننقر على حيوانات مختلفة ونحتاج إلى عرض تفاصيل مختلفة، لذلك يكون استخدام `.sheet(item:)` أنسب.

## الكود الكامل

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // اسم الحيوان
    let name: String
    
    // صورة الحيوان
    let imageName: String
    
    // رمز الحيوان
    let avatarEmoji: String
    
    // منطقة الانتشار
    let distributionArea: String
    
    // الموطن
    let habitat: String
    
    // وصف الحيوان
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // الدلفين
        Animal(
            name: "الدلفين",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "المحيطات الدافئة والمعتدلة حول العالم.",
            habitat: "المحيطات والمياه الساحلية وبعض الأنهار الكبيرة.",
            animalDescription: "الدلافين ثدييات بحرية ذكية. تعيش في مجموعات، وتتواصل بالأصوات، وتُعرف بسلوكها المرح."
        ),
        // الزرافة
        Animal(
            name: "الزرافة",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "السافانا والغابات المفتوحة في إفريقيا.",
            habitat: "المراعي والسافانا والغابات المفتوحة.",
            animalDescription: "الزرافات أطول الحيوانات البرية. لها أعناق طويلة وأرجل طويلة، وتتغذى عادة على أوراق الأشجار العالية."
        ),
        // الأسد
        Animal(
            name: "الأسد",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "توجد أساسا في إفريقيا جنوب الصحراء، مع مجموعة صغيرة في غرب الهند.",
            habitat: "المراعي والسافانا والغابات المفتوحة.",
            animalDescription: "الأسود قطط كبيرة قوية. تعيش عادة في مجموعات تسمى الزمر، وغالبا ما تُعرف بأنها ملوك عالم الحيوان."
        ),
        // الباندا
        Animal(
            name: "الباندا",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "الغابات الجبلية في وسط الصين.",
            habitat: "غابات الخيزران في المناطق الجبلية الباردة والرطبة.",
            animalDescription: "الباندا من فصيلة الدببة وتُعرف بفروها الأسود والأبيض. تتغذى أساسا على الخيزران، وهي من أكثر الحيوانات تميزا في العالم."
        ),
        // الدب القطبي
        Animal(
            name: "الدب القطبي",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "المناطق القطبية الشمالية حول القطب الشمالي.",
            habitat: "الجليد البحري والمناطق الساحلية والبيئات القطبية الباردة.",
            animalDescription: "الدببة القطبية دببة كبيرة تكيفت مع البيئات الباردة. وهي سباحة قوية وتعتمد أساسا على الجليد البحري لصيد الفقمات."
        )
    ]
    
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
                            .cornerRadius(20)

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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**منطقة الانتشار** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**الموطن** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**وصف الحيوان** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## الخلاصة

في هذا الدرس أكملنا صفحة بسيطة لموسوعة الحيوانات.

استخدمنا أولا بنية `Animal` لحفظ معلومات الحيوان، ثم استخدمنا مصفوفة لحفظ خمسة حيوانات، وبعد ذلك استخدمنا `ForEach` لعرض قائمة الحيوانات.

عندما ينقر المستخدم على حيوان معين، نحفظ هذا الحيوان في `selectedAnimal`:

```swift
selectedAnimal = animal
```

عندما يكون لدى `selectedAnimal` قيمة، ستُظهر `.sheet(item:)` عرض التفاصيل، وتمرر الحيوان المحدد إلى `AnimalDetailView`.

الأهم في هذا الدرس ليس أسلوب الواجهة، بل فهم مسار نقل البيانات التالي:

```swift
النقر على الحيوان → يحفظ selectedAnimal الحيوان → تظهر Sheet → يعرض AnimalDetailView التفاصيل
```

بعد فهم هذا المسار، يمكنك لاحقا إنشاء مزيد من الوظائف المشابهة، مثل تفاصيل المنتج وتفاصيل الدرس وتفاصيل المقال وتفاصيل جهة الاتصال.
