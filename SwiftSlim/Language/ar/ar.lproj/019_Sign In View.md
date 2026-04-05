# واجهة تسجيل الدخول

في هذا الدرس، سنتعلم سيناريو عمليًا جدًا وهو واجهة تسجيل الدخول.

سواء كان موقعًا إلكترونيًا أو تطبيقًا، ففي أثناء الاستخدام يحتاج المستخدم في كثير من الأحيان إلى تسجيل الدخول وإدخال كلمة المرور.

على سبيل المثال، صفحة تسجيل الدخول في GitHub:

![WordPress](../../Resource/019_github.png)

في هذا الدرس، سننشئ واجهة تسجيل دخول مشابهة، بحيث يُدخل المستخدم الحساب وكلمة المرور يدويًا، ثم نتحقق مما إذا كانت هناك مشكلة في المحتوى المُدخل.

## التخطيط العلوي

سنكتب كود واجهة تسجيل الدخول في ملف `ContentView`.

أولًا، لننشئ منطقة الشعار في أعلى واجهة تسجيل الدخول. يمكنك تجهيز صورة أيقونة مناسبة مسبقًا ووضعها في مجلد `Assets`.

![icon](../../Resource/019_icon1.png)

بعد ذلك، استخدم `Image` والمعدلات لعرض الصورة:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

تشير هذه المعدلات إلى:

- `resizable()`: يجعل الصورة قابلة لتغيير الحجم.
- `scaledToFit()`: يحافظ على نسبة الصورة الأصلية عند التحجيم.
- `frame(width: 100)`: يضبط عرض الصورة المعروضة إلى `100`.

بعد ذلك، استخدم `Text` والمعدلات لعرض عنوان تسجيل الدخول:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

ثم استخدم `VStack` لترتيب الصورة والنص عموديًا:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

النتيجة:

![view](../../Resource/019_view.png)

بهذا نكون قد أكملنا منطقة العنوان في أعلى واجهة تسجيل الدخول.

### تحسين التخطيط

حاليًا، تقع الصورة والعنوان افتراضيًا في المنطقة الوسطى من التخطيط العام.

إذا أردنا أن يبدوا أكثر كـ "شعار تسجيل دخول في أعلى الصفحة"، فيمكننا استخدام `Spacer()` لتمديد المساحة المتبقية ودفع المحتوى للاقتراب من الأعلى.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

النتيجة:

![view](../../Resource/019_view1.png)

لكن الآن أصبح `Image` و`Text` قريبين جدًا من أعلى الشاشة، ويبدوان مزدحمين بعض الشيء.

في هذه الحالة، يمكننا استخدام `padding` لإضافة مسافة علوية إلى `VStack` بالكامل.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

النتيجة:

![view](../../Resource/019_view2.png)

بهذه الطريقة تبدو منطقة العنوان في أعلى الصفحة أنسب قليلًا.

## اسم المستخدم وكلمة المرور

تحتاج صفحة تسجيل الدخول عادةً إلى أن يُدخل المستخدم اسم المستخدم وكلمة المرور.

في SwiftUI، يمكننا استخدام `TextField` لاستقبال المحتوى الذي يُدخله المستخدم.

لكن انتبه: `TextField` نفسه لا يحتفظ ببيانات الإدخال على المدى الطويل، فهو مجرد عنصر إدخال. الذي يحفظ هذه القيم فعليًا هو المتغير الذي نربطه به.

لذلك نحتاج أولًا إلى إنشاء متغيرين من `@State` لحفظ اسم المستخدم وكلمة المرور:

```swift
@State private var user = ""
@State private var password = ""
```

عندما تتغير قيمة متغيرات `@State`، تقوم SwiftUI بتحديث العروض المرتبطة تلقائيًا.

بعد ذلك، استخدم `TextField` لربط هذين المتغيرين:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

يمثل `$user` و`$password` هنا "الربط".

أي أنه عندما يكتب المستخدم نصًا في حقل الإدخال، تتغير قيمة المتغير في الوقت نفسه؛ وعندما تتغير قيمة المتغير، يتغير أيضًا المحتوى المعروض في حقل الإدخال بالتزامن.

هذه العلاقة التي "يتزامن فيها العرض والبيانات معًا" هي ما يُسمى بالربط.

انتبه، يجب هنا استخدام الصيغة التي تحتوي على `$`:

```swift
$user
```

لأن `TextField` لا يحتاج إلى سلسلة نصية عادية، بل إلى قيمة ربط "يمكنها تعديل البيانات في الاتجاهين".

### عرض حقول الإدخال

لنضعها داخل `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

مظهر العرض:

![view](../../Resource/019_view3.png)

لأن `user` و`password` كلاهما الآن سلاسل فارغة افتراضيًا:

```swift
""
```

لذلك سيظهر أولًا نص العنصر النائب داخل حقل الإدخال، مثل:

```swift
input user
```

هذا النص مجرد تلميح للمستخدم بشأن "ما الذي يجب إدخاله هنا"، وليس المحتوى المُدخل الحقيقي.

### تحسين حقول الإدخال

الآن أصبحت حقول الإدخال قابلة للاستخدام، لكن النمط الافتراضي بسيط نسبيًا.

لجعل الواجهة أوضح، يمكننا إضافة عنوان أمام حقل الإدخال، وإجراء بعض التحسينات البسيطة على نمط الحقل نفسه.

على سبيل المثال، أضف عنوانًا أولًا:

```swift
Text("Username")
    .fontWeight(.bold)
```

ثم استخدم `HStack` لوضع العنوان وحقل الإدخال في السطر نفسه:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

نستخدم `HStack` هنا لأننا نريد "عرض العنوان على اليسار وحقل الإدخال على اليمين".

تجدر الملاحظة إلى أن `TextField` سيشغل افتراضيًا المساحة المتبقية المتاحة.

![color](../../Resource/019_view6.png)

لكي يكون حجم حقلي الإدخال أكثر توحيدًا، يمكننا استخدام `frame(width:)` لتعيين عرض لهما، بحيث يبدوان أكثر ترتيبًا.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

أضف بعد ذلك إطارًا لجعل حقل الإدخال أوضح قليلًا:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

والآن، لنضف اسم المستخدم وكلمة المرور كلاهما إلى عرض `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

مظهر العرض:

![view](../../Resource/019_view4.png)

بهذا أصبح بإمكان المستخدم إدخال اسم المستخدم وكلمة المرور.

## زر تسجيل الدخول

الآن سنضيف زر تسجيل دخول أسفل حقول الإدخال.

```swift
Button("Sign in") {

}
```

بعد ذلك، استخدم `buttonStyle` لإضافة نمط نظام أوضح إلى الزر:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

مظهر العرض:

![view](../../Resource/019_view5.png)

وللتأكد من أن الزر يستجيب للنقر فعلًا، يمكننا أولًا كتابة `print` داخل الزر للاختبار:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

عند النقر على الزر، ستظهر في وحدة التحكم:

```swift
click Sign in
```

وهذا يوضح أن الزر قد استجاب لعملية النقر بنجاح.

## منطق تسجيل الدخول

الآن سنضيف إلى زر تسجيل الدخول أبسط منطق تحقق: **التحقق مما إذا كان المستخدم قد أدخل اسم المستخدم وكلمة المرور**.

نريد تحقيق الحالات التالية:

- إذا لم يُدخل المستخدم أي شيء، فاطبع `Empty`
- إذا أدخل المستخدم واحدًا فقط منهما، فنبّه إلى العنصر الناقص
- إذا تم إدخال اسم المستخدم وكلمة المرور معًا، فاطبع `Success`

### عدم إدخال أي معلومات

لأن `user` و`password` كلاهما سلاسل فارغة افتراضيًا:

```swift
@State private var user = ""
@State private var password = ""
```

فإذا لم يُدخل المستخدم أي شيء، فستظل قيمتهما فارغة.

في Swift، يمكن للأنواع مثل `String` استخدام `isEmpty` لتحديد ما إذا كان المحتوى فارغًا.

### الخاصية isEmpty

تُستخدم `isEmpty` غالبًا للتحقق مما إذا كانت السلاسل النصية أو المصفوفات وغيرها من المحتويات فارغة.

على سبيل المثال:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

إذا كان المحتوى فارغًا فستُرجع `isEmpty` القيمة `true`؛ وإذا لم يكن فارغًا فستُرجع `false`.

لذلك يمكننا استخدامها لتحديد ما إذا كان اسم المستخدم وكلمة المرور يحتويان على مدخلات.

### استخدام isEmpty لاكتشاف المتغيرات

إذا لم يُدخل المستخدم أي معلومات، فسيكون الوضع كالتالي:

```swift
user.isEmpty // true
password.isEmpty    // true
```

في هذه الحالة يمكننا كتابة الشرط هكذا:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

يعني هذا الكود: إذا كان `user` فارغًا، وكان `password` فارغًا أيضًا، فاطبع:

```swift
Empty
```

العامل `&&` هنا هو عامل منطقي ويعني "و".

أي أن الشرط بأكمله لا يتحقق إلا إذا تحقق الشرط الموجود على اليسار وكذلك الشرط الموجود على اليمين.

لذلك لن يُنفَّذ هذا الكود إلا عندما يكون كل من اسم المستخدم وكلمة المرور فارغين.

## المستخدم أدخل جزءًا فقط

بعد ذلك، لنفكر في حالة أخرى: أن يُدخل المستخدم اسم المستخدم فقط، أو كلمة المرور فقط.

على سبيل المثال:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

في هذا الوقت لا يكون اسم المستخدم فارغًا، لكن كلمة المرور تكون فارغة.

يمكننا متابعة استخدام `isEmpty` للتحقق:

### حالة إدخال الحساب أو كلمة المرور

إذا أدخل المستخدم اسم المستخدم فقط أو كلمة المرور فقط، فنحن بحاجة إلى إعطاء تلميح بالنقص المناسب.

على سبيل المثال، إذا أدخل المستخدم اسم المستخدم فقط:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

منطق هذا الكود هو: إذا كان اسم المستخدم فارغًا، فاطلب إدخال اسم المستخدم. وإلا فتحقق مما إذا كانت كلمة المرور فارغة، وإذا كانت فارغة فاطلب إدخال كلمة المرور.

### المستخدم أدخل كل المعلومات

إذا كان اسم المستخدم وكلمة المرور كلاهما قد أُدخلا، فستُرجع `isEmpty` في الحالتين القيمة `false`.

عندها يمكننا كتابة ذلك هكذا:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

الرمز `!` هنا يعني "العكس".

على سبيل المثال:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

أي أن `user.isEmpty` يُستخدم للحكم على "ما إذا كان اسم المستخدم فارغًا"، بينما `!user.isEmpty` يُستخدم للحكم على "ما إذا كان اسم المستخدم غير فارغ".

وينطبق المنطق نفسه على كلمة المرور.

إذًا فمعنى هذا الكود هو: اسم المستخدم غير فارغ، وكلمة المرور أيضًا غير فارغة.

عندما يتحقق الشرطان معًا، ستكون المخرجات:

```swift
Success
```

## منطق التحقق الكامل

الآن، لنجمع هذه الحالات الثلاث ونكتبها داخل `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

يمكن فهم ترتيب تنفيذ هذا الكود بهذه الطريقة:

الخطوة الأولى، نتحقق أولًا من:

```swift
if user.isEmpty && password.isEmpty
```

إذا كان كل من اسم المستخدم وكلمة المرور فارغين، فسيطبع مباشرة `Empty`.

وإذا لم يكونا فارغين معًا، فسنواصل الحكم على الجملة التالية:

```swift
else if user.isEmpty || password.isEmpty
```

الرمز `||` هنا يعني "أو".

أي أنه ما دام أحد الشرطين متحققًا، فإن الشرط الكلي يتحقق.

لذلك، ما دام اسم المستخدم فارغًا أو كلمة المرور فارغة، فسيُنفَّذ مقطع الكود الخاص بـ `else if`.

بعد الدخول إلى مقطع الكود، نتحقق بشكل إضافي من حقل الإدخال الذي لم يتم ملؤه:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

إذا لم يتحقق أي من الشرطين السابقين، فهذا يعني أن اسم المستخدم غير فارغ وكلمة المرور أيضًا غير فارغة.

وعندها سيدخل البرنامج إلى `else` الأخيرة:

```swift
print("Success")
```

وبذلك نكون قد أكملنا أبسط منطق للتحقق من إدخال تسجيل الدخول.

## التحقق من اسم المستخدم وكلمة المرور

المنطق السابق يتحقق فقط من "وجود محتوى مُدخل أم لا".

لكن في التطبيقات الحقيقية لا يكفي مجرد إدخال المحتوى. فعادةً ما نحتاج أيضًا إلى إرسال اسم المستخدم وكلمة المرور إلى الخادم للتحقق.

إذا أكد الخادم أن اسم المستخدم موجود وأن كلمة المرور صحيحة، فيُسمح بتسجيل الدخول؛ وإلا فسيتم تنبيه المستخدم بفشل تسجيل الدخول.

وللتدرب على هذه العملية، يمكننا أولًا تعيين حساب وكلمة مرور مؤقتين في الكود لمحاكاة "بيانات تسجيل الدخول الصحيحة":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

عندما لا يكون اسم المستخدم وكلمة المرور فارغين، نقارن بعد ذلك ما إذا كانا صحيحين:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

الرمز `==` هنا يعني "هل هو مساوي".

على سبيل المثال:

```swift
user == userID
```

والمقصود هو: هل اسم المستخدم الذي أدخله المستخدم يطابق تمامًا اسم المستخدم الصحيح الذي حددناه؟ ويجري الحكم على كلمة المرور بالطريقة نفسها.

لذلك، عندما تكون قيمة اسم المستخدم وكلمة المرور المدخلتين مساوية للقيم المحددة، تكون النتيجة `Success`؛ وما دام أحدهما غير متساوٍ، تكون النتيجة `Input error`.

وبذلك نكون قد أنجزنا "محاكاة بسيطة للتحقق من تسجيل الدخول".

وعلى الرغم من أنها ليست بعد وظيفة تسجيل دخول حقيقية متصلة بخادم، فإنها تكفي بالفعل لمساعدتنا على فهم: **بعد النقر على الزر، يمكن تنفيذ أكواد مختلفة وفقًا لشروط مختلفة**.

## الخلاصة

في هذا الدرس، أكملنا واجهة تسجيل دخول أساسية، وركزنا على تعلم "منطق الحكم على المدخلات وفقًا للشروط".

المحتوى الأساسي في هذا الدرس هو: استخدام `isEmpty` للحكم على ما إذا كانت السلسلة النصية فارغة، واستخدام جملة `if` مع العوامل المنطقية لمعالجة الحالات المختلفة.

ومن بين هذه العوامل، يوجد عاملان منطقيان مهمان جدًا:

- `&&`: يعني "و"، ويجب تحقق الشرطين معًا
- `||`: يعني "أو"، ويكفي تحقق أحد الشرطين

وعندما تعطي هذه الشروط في النهاية `true` أو `false`، تقوم جملة `if` بتنفيذ كود مختلف بحسب النتيجة.

ومن خلال واجهة تسجيل الدخول هذه، بدأنا بالفعل في ملامسة أسلوب التطوير الذي يجمع بين "الواجهة + البيانات + الحكم المنطقي".

## الكود الكامل

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
