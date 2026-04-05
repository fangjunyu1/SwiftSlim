# تفاعلات تسجيل الدخول

في الدرس السابق، أنشأنا عرض تسجيل دخول، ومن خلال الأزرار ومنطق التحقق، حققنا فحصًا بسيطًا لمحتوى الإدخال.

في هذا الدرس، سنواصل اعتمادًا على كود الدرس السابق، ونتعلم مربع إدخال كلمة المرور `SecureField`، ومربع التنبيه `Alert`، وكذلك كيفية التحكم في عرض الواجهات المختلفة وفقًا للمتغيرات.

من خلال هذا الدرس، يمكنك فهم التدفق الأساسي للتفاعل في عرض تسجيل الدخول بشكل أعمق، وهو أيضًا منطق أساسي يُستخدم في كثير من التطبيقات.

## مربع إدخال كلمة المرور

في الدرس السابق، استخدمنا `TextField` لإدخال كلمة المرور.

لكن في واجهات تسجيل الدخول الحقيقية، لا تُعرض كلمة المرور عادةً مباشرة، بل تظهر على شكل نقاط أو تأثيرات إخفاء أخرى، وذلك لحماية خصوصية المستخدم.

في SwiftUI، العنصر المخصص لإدخال كلمة المرور هو `SecureField`.

على سبيل المثال:

```swift
SecureField("Password", text: $password)
```

طريقة كتابته تشبه كثيرًا `TextField`، فهو يحتاج أيضًا إلى نص تلميحي ومتغير مرتبط.

يمكن فهمه ببساطة على أن: `SecureField` هو أيضًا مربع إدخال، لكنه يُخفي المحتوى الذي يتم إدخاله.

يمكننا مباشرةً استبدال `TextField` المستخدم سابقًا لإدخال كلمة المرور بـ `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

عندما يُدخل المستخدم كلمة المرور، لن يُعرض محتواها مباشرة على الواجهة.

تأثير العرض:

![password](../../Resource/020_password.png)

الآن، يمكننا إدخال اسم المستخدم وكلمة المرور، ثم النقر على الزر للتحقق مما إذا كان الإدخال صحيحًا.

### عرض رسالة تغذية راجعة

في السابق كنا نستخدم `print` باستمرار لإخراج النتائج.

محتوى `print` يظهر فقط في وحدة التحكم، ويمكن للمطور رؤيته عند تشغيل البرنامج في Xcode، لكن المستخدم العادي على الهاتف لا يمكنه رؤية هذه الرسائل.

وهذا يعني أنه رغم أن البرنامج أكمل التحقق، فإن المستخدم لا يعرف ما إذا كان المحتوى الذي أدخله صحيحًا.

في هذه الحالة، نحتاج إلى طريقة لعرض الرسائل مباشرة على الواجهة.

## مربع التنبيه Alert

في SwiftUI، يمكننا استخدام `Alert` لإظهار مربع تنبيه منبثق.

الاستخدام الأساسي:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

قد يبدو هذا المقطع أكثر تعقيدًا قليلًا من العناصر السابقة، ويمكننا فهمه بعد تفكيكه.

يتكون `Alert` بشكل أساسي من الأجزاء التالية:

- `"Title"`: عنوان مربع التنبيه
- `isPresented`: قيمة منطقية مرتبطة تُستخدم للتحكم في إظهار مربع التنبيه
- `Button(...)`: زر مربع التنبيه
- `message:`: محتوى الرسالة المعروضة داخل مربع التنبيه

يمكن فهمه ببساطة على أنه عندما تصبح القيمة المرتبطة `true`، سيقوم النظام بإظهار مربع التنبيه هذا.

تأثير العرض:

![alert](../../Resource/020_alert3.png)

البنية المقابلة:

![alert](../../Resource/020_alert.png)

### Alert هو معدِّل

مثل كثير من المعدِّلات التي تعلمناها سابقًا، فإن `Alert` أيضًا يُضاف بعد أحد العروض.

على سبيل المثال، يمكن إضافته بعد الزر:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

كما يمكن إضافته بعد `VStack` الخارجي:

```swift
VStack {
    // ...
}
.alert() {...}
```

أي أن `Alert` ليس عرضًا مستقلًا يوضع بمفرده في الواجهة، بل هو معدِّل مرتبط بعرض معين.

يمكن فهمه ببساطة على أن `Alert` يُكتب عادةً بعد الزر أو التخطيط الخارجي ليُظهر رسالة عندما يتحقق شرط معين.

### عرض Alert

إذا أردنا عرض `Alert`، فنحن بحاجة إلى متغير للتحكم فيه.

على سبيل المثال:

```swift
@State private var showAlert = false
```

هذا المتغير من النوع `Bool`، أي إن له قيمتين فقط: `true` أو `false`.

ثم نربطه مع `isPresented` الخاص بـ `Alert`:

```swift
isPresented: $showAlert
```

عندما تكون قيمة `showAlert` هي `false`، لن يظهر مربع التنبيه؛ وعندما تكون `true`، سيظهر مربع التنبيه.

### إظهار مربع التنبيه عبر الزر

الآن، لننفذ أولًا أبسط سيناريو:

عندما لا يُدخل المستخدم أي شيء إطلاقًا ثم ينقر مباشرة على زر `Sign in`، يظهر مربع تنبيه ليخبره: "لم تُدخل أي محتوى بعد".

أولًا، أنشئ متغيرًا للتحكم في مربع التنبيه هذا:

```swift
@State private var showEmpty = false
```

ثم أضف `Alert` بعد `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

بعد ذلك، أجرِ التحقق داخل كود النقر على الزر:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

إذا كان كل من `user` و `password` فارغين، فسنغيّر `showEmpty` إلى `true`.

وبما أن `Alert` مرتبط بهذا المتغير، فعندما تصبح قيمته `true`، سيعرض النظام مربع التنبيه تلقائيًا.

تأثير العرض:

![alert](../../Resource/020_alert1.png)

بهذه الطريقة، بعد أن ينقر المستخدم الزر، سيتمكن من رؤية الرسالة فورًا، ولن يحتاج المطور إلى الذهاب إلى وحدة التحكم لرؤية مخرجات `print`.

### تحسين الزر ومربعات التنبيه

في السابق، تعاملنا فقط مع حالة "عدم تعبئة أي شيء".

ما زلنا بحاجة إلى التعامل مع الحالات التالية:

- عدم إدخال اسم المستخدم
- عدم إدخال كلمة المرور
- تم إدخال اسم المستخدم وكلمة المرور، لكن الإدخال غير صحيح

لذلك، نحتاج أيضًا إلى تجهيز رسائل مقابلة لهذه الحالات.

أولًا، أضف ثلاثة متغيرات جديدة:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

ثم تابع بإضافة `Alert` المقابل بعد الزر:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

بعد ذلك، حسّن منطق التحقق داخل الزر:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

عندما يحدد الزر أن المستخدم لم يُدخل أي معلومات، أو ترك معلومة واحدة فارغة، أو فشل التحقق من الإدخال، فسيتم تغيير المتغير المنطقي المقابل إلى `true`، ثم يظهر `Alert` المناسب.

أنصحك هنا بأن تختبر بنفسك عدة حالات:

- عدم إدخال أي شيء
- إدخال اسم المستخدم فقط
- إدخال كلمة المرور فقط
- إدخال اسم المستخدم وكلمة المرور، لكن المحتوى غير صحيح
- إدخال اسم المستخدم وكلمة المرور، والمحتوى صحيح

وذلك للتحقق مما إذا كان في كودنا أي مشكلة، وهذه أيضًا خطوة "اختبار" مهمة جدًا في تطوير التطبيقات.

إذا كان سلوك البرنامج غير صحيح في أحد السيناريوهات، فهذا يعني أن هناك على الأرجح مشكلة في المنطق أو أن هناك `Bug` في البرنامج.

ما يُسمى عادةً في التطوير بـ `Bug` يشير إلى خطأ أو ثغرة أو سلوك لا يطابق المتوقع داخل البرنامج.

## إكمال عرض تسجيل الدخول

كانت كل أمثلة `Alert` السابقة تتعلق بكيفية إعطاء المستخدم رسالة عند "الإدخال الخاطئ".

عندما يُدخل المستخدم اسم المستخدم وكلمة المرور الصحيحين، فعادةً لا نعرض "مربع تنبيه"، بل ننتقل مباشرةً إلى الواجهة بعد تسجيل الدخول.

وهنا نصل إلى نقطة معرفية مهمة جدًا: **عرض واجهات مختلفة بناءً على قيمة المتغير.**

على سبيل المثال:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

هنا نستخدم النوع `Bool` لإدارة عرض الواجهة:

- إذا كانت `login` تساوي `true`، فهذا يعني أن تسجيل الدخول نجح بالفعل، وسيتم عرض المحتوى بعد تسجيل الدخول
- إذا كانت `login` تساوي `false`، فهذا يعني أن تسجيل الدخول لم ينجح، وتستمر واجهة تسجيل الدخول في الظهور.

مع أن عبارة `if` هي جملة شرطية في Swift، إلا أنه داخل `body` في SwiftUI يمكن استخدامها للتحكم في منطق عرض الواجهة.

أي أن SwiftUI سيحدد أي عرض يجب إظهاره حاليًا بناءً على نتيجة الشرط.

يمكننا وضع منطق العرض هذا داخل `ContentView` الحالي:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// The original login view code
		}
	}
}
```

هنا أضفنا متغيرًا جديدًا باسم `login` لتمثيل ما إذا كان المستخدم قد سجّل الدخول بنجاح.

ثم وضعنا كود عرض تسجيل الدخول الذي كتبناه سابقًا بعد عبارة `else`.

منطق عرض الواجهة:

- عندما تكون قيمة `login` هي `false`، فهذا يعني أن تسجيل الدخول لم ينجح بعد، لذا نستمر في عرض واجهة تسجيل الدخول الأصلية.
- عندما تكون قيمة `login` هي `true`، فهذا يعني أن تسجيل الدخول نجح، وعندها لن تُعرض واجهة تسجيل الدخول، بل سيُعرض `Login successful`.

أي أن `ContentView` سيعرض محتوى واجهة مختلفًا وفقًا لاختلاف قيمة `login`.

بعد ذلك، لنعدّل منطق نجاح تسجيل الدخول داخل الزر:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

عندما يكون اسم المستخدم وكلمة المرور اللذان أدخلهما المستخدم صحيحين، فإننا نغيّر `login` إلى `true`.

بمجرد أن تتغير قيمة `login`، ستتغير أيضًا نتيجة حكم `if` داخل `ContentView`، وستنتقل الواجهة من عرض تسجيل الدخول الأصلي إلى `Login successful`.

يظهر تأثير العرض كما يلي:

![view](../../Resource/020_view.png)

الآن، نكون قد استخدمنا بالفعل معرفة "عرض واجهات مختلفة بناءً على الشرط" داخل صفحة تسجيل الدخول الحالية.

وفي التطبيقات الفعلية، تكون هذه عادةً هي طريقة الحكم نفسها، حيث يتم عرض واجهات مختلفة بناءً على قيمة معينة.

على سبيل المثال، عندما لا يكون المستخدم قد سجّل الدخول، يتم عرض صفحة تسجيل الدخول؛ وبعد نجاح تسجيل الدخول، يتم عرض واجهة أخرى.

الفكرة الأساسية هي: **التحكم في المحتوى الذي تعرضه الواجهة من خلال تغيّر المتغيرات.**

## الخلاصة

في هذا الدرس، تعلمنا ثلاثة أمور مهمة:

1. استخدام `SecureField` لإدخال كلمة المرور بحيث لا يظهر محتواها مباشرة على الواجهة.
2. استخدام `Alert` لعرض رسائل للمستخدم بدلًا من الاكتفاء بالإخراج في وحدة التحكم.
3. استخدام المتغيرات وعبارة `if` للتحكم في عرض واجهات مختلفة، وتحقيق التبديل بين الواجهة قبل تسجيل الدخول وبعده.

من خلال تعلم هذه المعارف، أصبحنا قادرين بالفعل على إكمال عرض تسجيل دخول يمتلك تأثيرات تفاعل أساسية، وفهم فكرة التطوير في SwiftUI بصورة أعمق: "تتغير الحالة، فتتحدث الواجهة".

## الكود الكامل

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## معرفة إضافية - Alert بعدة أزرار

في هذا الدرس السابق، استخدمنا أبسط شكل من `Alert`، والذي يحتوي على زر واحد فقط ويُستخدم أساسًا لتذكير المستخدم.

في الواقع، يمكن أن يحتوي `Alert` أيضًا على عدة أزرار، ليجعل المستخدم يختار بين خيارات مختلفة.

على سبيل المثال:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

عند النقر على الزر، سيظهر مربع تنبيه يحتوي على ثلاثة خيارات: `Ok` و `delete` و `cancel`.

تأثير العرض:

![alert](../../Resource/020_alert2.png)

عند النقر على أزرار مختلفة، سيتم تنفيذ الكود المقابل.

### الخاصية role في Button

ستلاحظ هنا أن `Button` داخل `Alert` يختلف قليلًا عن طريقة كتابة الزر العادي التي تعلمناها سابقًا:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

هنا تمت إضافة المعامل `role`.

في SwiftUI، يُستخدم `role` لإخبار النظام: ما نوع العملية التي يمثلها هذا الزر.

من الأدوار الشائعة:

- `.cancel`: عملية إلغاء
- `.destructive`: عملية خطرة، مثل الحذف
- `nil`: عملية عادية

غالبًا ما تختلف أنماط العرض على الواجهة باختلاف `role`.

فعلى سبيل المثال، غالبًا ما تُعرض العمليات الخطرة بنمط أكثر لفتًا للانتباه لتذكير المستخدم بضرورة النقر بحذر.

بالإضافة إلى ذلك، يوفر `role` معلومات دلالية إضافية للزر، ما يسهّل على قارئات الشاشة (مثل VoiceOver على أجهزة Apple) توضيح وظيفة الزر للمستخدم.

لذلك، فإن إضافة `role` إلى الزر في السيناريو المناسب تُعد عادةً جيدة جدًا.
