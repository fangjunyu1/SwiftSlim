# التخطيط والصور والنصوص

في الفصل السابق، تعرّفنا إلى شيفرة `ContentView` التالية:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

في هذا الفصل، سنتعلّم آلية التخطيط الافتراضي في SwiftUI، وكيفية استخدام الصور والنصوص. وبالاعتماد على ما سبق، سنفهم بشكل أعمق بنية العرض وطريقة ظهوره على الشاشة، وهي معرفة تساعدنا على بناء واجهات أساسية.

## آلية التخطيط الافتراضي في SwiftUI

عند معاينة `ContentView`، سنلاحظ أن الأيقونة والنص يظهران في المنتصف، بدلاً من أن يبدأ الترتيب من أعلى الصفحة.

![Swift](../../RESOURCE/003_view.png)

وذلك لأن محاذاة حاويات الـ Stack تكون افتراضياً `.center`، لذا تبدو العناصر متمركزة في الوسط.

### المحاذاة Alignment

من الواضح أن التوسيط ليس سوى نوع واحد من المحاذاة. فإذا أردنا المحاذاة لليسار أو لليمين، نحتاج إلى استخدام `alignment` للتحكم في موضع العناصر.

```swift
alignment
```

في SwiftUI، تظهر المحاذاة غالباً في حالتين:

**1. معامل المحاذاة داخل حاوية Stack**

مثلاً، إذا أردنا جعل الأيقونة والنص في `ContentView` بمحاذاة البداية:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

في `VStack`، يتحكم `alignment` في المحاذاة الأفقية.

خيارات المحاذاة:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

أما `HStack` فهو ترتيب أفقي، لذا يتحكم `alignment` فيه بالمحاذاة العمودية:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

أما `ZStack` فهو تخطيط متراكب، ويمكن أن يضبط المحاذاة أفقياً أو عمودياً بحسب القيمة:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

إذا لم نحدّد `alignment` صراحة، فإن `VStack` و`HStack` و`ZStack` تستخدم `.center` بشكل افتراضي.

**2. المحاذاة داخل `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

عندما تكون المساحة التي يوفّرها `frame` أكبر من الحجم الذاتي للعنصر، فإن `alignment` يحدد موضع العنصر داخل هذه المساحة. وسنتوسع لاحقاً في شرح `frame`، أما الآن فيكفي أخذ فكرة أولية عنه.

### Spacer وآلية توزيع المساحة

يمكن لـ `alignment` أن يرتّب العناصر أفقياً أو عمودياً، لكن عندما نريد أن يظهر النص والصورة عند طرفين مختلفين، فإن المحاذاة وحدها لا تكفي.

مثلاً، إذا أردنا تنفيذ جزء علوي شبيه بموقع [NHK](../../RESOURCE/https://www3.nhk.or.jp/nhkworld/zh/news/)، حيث يظهر شعار NHK في الجهة اليسرى وأيقونة القائمة في الجهة اليمنى.

![Swift](../../RESOURCE/003_alignment3.png)

إذا استخدمنا `alignment` فقط، فسيظهر العنصران في الجهة نفسها، ولن يتوزعا على الطرفين. لذلك نحتاج إلى `Spacer` لملء المساحة المتبقية.

`Spacer` هو عنصر مرن في التخطيط، يملأ المساحة الفارغة تلقائياً.

طريقة الاستخدام:

```swift
Spacer()
```

مثال:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

عند إضافة `Spacer` بين `Image` و`Text`، فإنه يملأ المساحة المتبقية ويدفع الصورة والنص إلى الطرفين العلوي والسفلي.

![Swift](../../RESOURCE/003_view1.png)

وإذا وُجد أكثر من `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

فإن SwiftUI توزّع المساحة المتبقية بينها بالتساوي.

![Swift](../../RESOURCE/003_spacer.png)

## عرض الصور والتحكم في حجمها

تُستخدم `Image` أساساً لعرض الصور. أما أيقونات SF Symbols التي تعرّفنا إليها في الفصل السابق فهي مجرد استخدام واحد من استخداماتها.

طريقة الاستخدام:

```swift
Image("imageName")
```

يوضع اسم الصورة بين علامتي الاقتباس من دون كتابة الامتداد.

### عرض صورة

أولاً، لنجهّز صورة.

![Swift](../../RESOURCE/003_img.jpg)

في Xcode، اختر مجلد `Assets` واسحب الصورة إليه.

![Swift](../../RESOURCE/003_img1.png)

ثم استخدم `Image` في `ContentView` لعرضها:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

ملاحظة: `Image` في SwiftUI لا تدعم تشغيل صور GIF المتحركة، بل تعرض إطاراً ثابتاً فقط.

### التحكم في حجم الصورة

في SwiftUI، تُعرض الصورة بحجمها الأصلي بشكل افتراضي. وإذا أردنا تغيير حجمها، فعلينا أولاً استخدام `resizable()` لجعلها قابلة للتمدد، ثم استخدام `frame` لتحديد أبعادها داخل التخطيط.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### المعدّل `resizable`

يسمح `resizable` للصورة أن تدخل في عملية تغيير الحجم داخل التخطيط، بدلاً من بقائها دائماً على حجمها الأصلي.

```swift
.resizable()
```

فقط بعد إضافة `resizable()` يصبح بإمكان `frame` أن يغيّر الحجم الظاهر للصورة فعلاً.

أما إذا تجاهلناه:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

فإن `frame` يوفّر مساحة تخطيط فقط، لكن حجم الصورة نفسه لن يتغير.

### المعدّل `frame`

`frame(width:height:)` يُستخدم لتحديد عرض العنصر وارتفاعه.

الطريقة الأساسية:

```swift
.frame(width: 10,height: 10)
```

مثلاً، إذا أردنا جعل الصورة مستطيلاً بعرض `300` وارتفاع `100`:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

كما يمكن تحديد العرض فقط أو الارتفاع فقط:

```swift
.frame(width: 200)
.frame(height: 100)
```

الجمع بين `resizable` و`frame` يمنحنا مرونة كبيرة في التحكم بحجم الصورة داخل الواجهة.

### النسبة البُعدية: `scaledToFit` و`scaledToFill`

عندما لا تتطابق نسبة العرض إلى الارتفاع في `frame` مع النسبة الأصلية للصورة، قد تتمدد الصورة وتتشوّه.

إذا أردنا الحفاظ على نسبة الصورة الأصلية مع جعلها تتكيّف مع المساحة المتاحة، فيمكننا استخدام `scaledToFit` أو `scaledToFill`.

**scaledToFit**

يحافظ `scaledToFit` على النسبة الأصلية للصورة ويجعل الصورة كلها تظهر داخل المساحة المتاحة من دون قصّ:

```swift
.scaledToFit()
```

أو:

```swift
.aspectRatio(contentMode: .fit)
```

هذا الأسلوب مناسب عندما نريد عرض الصورة بالكامل من دون تشويه.

مثلاً:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

من دون تحديد طريقة التحجيم، لا يمكن للصورة أن تحافظ على أبعادها الأصلية.

![Swift](../../RESOURCE/003_img4.png)

أما إذا استخدمنا `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

يحافظ `scaledToFill` أيضاً على النسبة الأصلية للصورة، لكنه يجعل الصورة تملأ كل المساحة المتاحة. وإذا لم تتطابق النسبة، فسيتم قصّ الجزء الزائد:

```swift
.scaledToFill()
```

أو:

```swift
.aspectRatio(contentMode: .fill)
```

وهذا مناسب عندما نريد أن تغطي الصورة المساحة بالكامل، مثل صور الخلفية أو الـ banner.

**الفرق بينهما**

![Swift](../../RESOURCE/003_img6.png)

## النصوص

في SwiftUI، يُستخدم `Text` لعرض النصوص.

الطريقة الأساسية:

```swift
Text("FangJunyu")
```

تعلّمنا `Text` في الفصل السابق، وفي هذا الفصل سنواصل التعمق في التحكم بحجم الخط وسمكه.

### حجم الخط

يمكن استخدام المعدّل `font` للتحكم في حجم الخط:

```swift
.font(.title)
```

مثلاً:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

الأحجام الشائعة من الأكبر إلى الأصغر:

```text
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### سماكة الخط

إذا أردنا جعل النص أعرض أو أثخن، نستخدم `fontWeight`:

```swift
.fontWeight(.bold)
```

مثلاً:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

السماكات الشائعة من الأخف إلى الأثقل:

```text
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

يتحكم `font` في حجم النص، بينما يتحكم `fontWeight` في سماكته. ويمكن استخدامهما معاً لإعطاء النص حضوراً بصرياً أقوى.

## الخلاصة والتطبيق

حتى الآن، تعلّمنا الأساسيات المتعلقة بالتخطيط الافتراضي في SwiftUI، و`Spacer`، و`Image`، و`Text`. وهذه المعرفة كافية بالفعل لبناء بعض الواجهات البسيطة.

على سبيل المثال: [Google](../../RESOURCE/https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

واجهة Google نظيفة جداً، وتتضمن صوراً ونصوصاً. ويمكننا تحليلها من منظور SwiftUI بالشكل التالي:

1. الواجهة العامة تتكوّن من ثلاثة أجزاء: شعار Google، وصندوق البحث، ونصوص الإرشاد. ويمكن ترتيبها عمودياً باستخدام `VStack`.
2. شعار Google هو صورة، لذا يمكن عرضه بواسطة `Image`.
3. صندوق البحث يحتوي على حقل إدخال وأيقونات. وإذا تجاهلنا الإدخال حالياً، فيمكن استخدام `Image` لعرض أيقونة البحث.
4. نصوص الإرشاد يمكن عرضها باستخدام `Text`. أما الترتيب الأفقي فيمكن تنفيذه بـ `HStack`، ويمكن التحكم في اللون باستخدام `foregroundStyle`.

من خلال هذا النوع من التمرين، يمكننا بناء واجهات بسيطة وتعميق فهمنا لـ `Image` و`Text` ومعدّلاتهما المختلفة.
