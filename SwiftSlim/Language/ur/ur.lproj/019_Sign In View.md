# سائن اِن منظر

اس سبق میں ہم ایک بہت ہی عملی منظرنامہ سیکھیں گے، یعنی سائن اِن منظر۔

چاہے وہ ویب سائٹ ہو یا App، استعمال کے دوران بہت سے مواقع پر صارف کو اپنے اکاؤنٹ اور پاس ورڈ کے ساتھ لاگ اِن کرنا پڑتا ہے۔

مثال کے طور پر، GitHub کا لاگ اِن صفحہ:

![WordPress](../../Resource/019_github.png)

اس سبق میں ہم ایک ایسا ہی سائن اِن منظر بنائیں گے، تاکہ صارف خود سے اکاؤنٹ اور پاس ورڈ درج کر سکے اور یہ جانچ سکے کہ درج کردہ مواد میں کوئی مسئلہ تو نہیں۔

## اوپری ترتیب

ہم `ContentView` فائل میں سائن اِن منظر کا کوڈ لکھیں گے۔

سب سے پہلے، آئیے سائن اِن منظر کے اوپری حصے میں شناختی علاقہ بناتے ہیں۔ آپ پہلے ایک مناسب آئیکن تصویر تیار کر کے اسے `Assets` فولڈر میں رکھ سکتے ہیں۔

![icon](../../Resource/019_icon1.png)

پھر تصویر دکھانے کے لیے `Image` اور modifiers استعمال کریں:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

یہ modifiers درج ذیل معنی رکھتے ہیں:

- `resizable()`: تصویر کا سائز تبدیل کرنے کی اجازت دیتا ہے۔
- `scaledToFit()`: تصویر کو اس کے اصل تناسب کے ساتھ اسکیل کرتا ہے۔
- `frame(width: 100)`: تصویر کی دکھائی جانے والی چوڑائی `100` مقرر کرتا ہے۔

اس کے بعد، سائن اِن عنوان دکھانے کے لیے `Text` اور modifiers استعمال کریں:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

پھر تصویر اور متن کو اوپر نیچے ترتیب دینے کے لیے `VStack` استعمال کریں:

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

نتیجہ:

![view](../../Resource/019_view.png)

یہاں تک ہم سائن اِن منظر کے اوپری عنوانی حصے کو مکمل کر چکے ہیں۔

### ترتیب کو بہتر بنانا

اب تصویر اور عنوان پورے layout کے درمیانی حصے میں ڈیفالٹ طور پر موجود ہیں۔

اگر ہم چاہیں کہ وہ زیادہ “صفحے کے اوپر موجود لاگ اِن شناخت” جیسے نظر آئیں، تو ہم `Spacer()` استعمال کر کے باقی جگہ کو بھر سکتے ہیں، تاکہ مواد اوپر کے قریب دکھائی دے۔

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

نتیجہ:

![view](../../Resource/019_view1.png)

لیکن اب `Image` اور `Text` اسکرین کے اوپری حصے کے بہت قریب ہیں اور کچھ تنگ لگ رہے ہیں۔

اس وقت ہم پورے `VStack` کے لیے اوپر کا فاصلہ بڑھانے کے لیے `padding` استعمال کر سکتے ہیں۔

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

نتیجہ:

![view](../../Resource/019_view2.png)

اس طرح صفحے کے اوپری حصے کا عنوانی علاقہ زیادہ مناسب لگتا ہے۔

## یوزرنیم اور پاس ورڈ

لاگ اِن صفحہ عام طور پر صارف سے یوزرنیم اور پاس ورڈ درج کرنے کا تقاضا کرتا ہے۔

SwiftUI میں، ہم صارف کی درج کی گئی معلومات حاصل کرنے کے لیے `TextField` استعمال کر سکتے ہیں۔

لیکن یہ یاد رکھنا ضروری ہے: `TextField` خود ان پٹ ڈیٹا کو طویل مدت کے لیے محفوظ نہیں رکھتا، یہ صرف ایک input control ہے۔ اصل میں ان معلومات کو وہ variables محفوظ رکھتے ہیں جنہیں ہم اس کے ساتھ bind کرتے ہیں۔

اس لیے، ہمیں پہلے دو `@State` variables بنانے کی ضرورت ہے، تاکہ یوزرنیم اور پاس ورڈ محفوظ کیے جا سکیں:

```swift
@State private var user = ""
@State private var password = ""
```

جب `@State` variable کی value بدلتی ہے، تو SwiftUI متعلقہ view کو خودکار طور پر refresh کرتا ہے۔

اس کے بعد، ان دونوں variables کو bind کرنے کے لیے `TextField` استعمال کریں:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

یہاں `$user` اور `$password` کا مطلب “binding” ہے۔

یعنی جب صارف input box میں کچھ لکھتا ہے تو variable بھی ساتھ ساتھ بدلتا ہے؛ اور جب variable بدلتا ہے تو box میں دکھائی جانے والی معلومات بھی ساتھ ساتھ بدلتی ہیں۔

یہ “view اور data کے باہمی ہم آہنگ ہونے” والا تعلق ہی binding کہلاتا ہے۔

یہاں یاد رکھیں کہ `$` والی لکھائی استعمال کرنی ضروری ہے:

```swift
$user
```

کیونکہ `TextField` کو عام string نہیں بلکہ ایسی binding value چاہیے جو “data کو دو طرفہ طور پر بدل سکے”۔

### ان پٹ باکس دکھانا

آئیے انہیں `ContentView` میں رکھیں:

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

دکھائی دینے والا نتیجہ:

![view](../../Resource/019_view3.png)

کیونکہ اس وقت `user` اور `password` دونوں کی ڈیفالٹ value خالی strings ہیں:

```swift
""
```

اس لیے input box سب سے پہلے placeholder متن دکھائے گا، مثال کے طور پر:

```swift
input user
```

یہ متن صرف صارف کو یہ اشارہ دیتا ہے کہ “یہاں کیا درج کرنا ہے”، یہ اصل input content نہیں ہے۔

### ان پٹ باکس کو بہتر بنانا

اب input boxes استعمال کے قابل ہیں، لیکن ڈیفالٹ style کافی سادہ ہے۔

انٹرفیس کو زیادہ واضح بنانے کے لیے، ہم input box کے سامنے عنوان شامل کر سکتے ہیں اور box پر معمولی style optimization بھی کر سکتے ہیں۔

مثال کے طور پر، پہلے ایک عنوان شامل کریں:

```swift
Text("Username")
    .fontWeight(.bold)
```

پھر، عنوان اور input box کو ایک ہی لائن میں رکھنے کے لیے `HStack` استعمال کریں:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

یہاں `HStack` اس لیے استعمال کیا گیا ہے کیونکہ ہم چاہتے ہیں کہ “بائیں طرف عنوان اور دائیں طرف input box” نظر آئے۔

یہ بات قابلِ توجہ ہے کہ `TextField` ڈیفالٹ طور پر باقی دستیاب جگہ کو گھیر لیتا ہے۔

![color](../../Resource/019_view6.png)

دونوں input boxes کا سائز زیادہ یکساں دکھانے کے لیے، ہم `frame(width:)` استعمال کر کے ایک چوڑائی مقرر کر سکتے ہیں، تاکہ boxes زیادہ ترتیب سے نظر آئیں۔

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

پھر ایک border شامل کریں، تاکہ input box زیادہ نمایاں نظر آئے:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

اب ہم یوزرنیم اور پاس ورڈ دونوں کو `ContentView` view میں شامل کرتے ہیں:

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

دکھائی دینے والا نتیجہ:

![view](../../Resource/019_view4.png)

اس مرحلے تک صارف یوزرنیم اور پاس ورڈ درج کر سکتا ہے۔

## سائن اِن بٹن

اب ہم input boxes کے نیچے ایک سائن اِن بٹن شامل کرتے ہیں۔

```swift
Button("Sign in") {

}
```

پھر، بٹن کو زیادہ واضح system style دینے کے لیے `buttonStyle` استعمال کریں:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

دکھائی دینے والا نتیجہ:

![view](../../Resource/019_view5.png)

یہ یقینی بنانے کے لیے کہ بٹن واقعی click پر response دے سکتا ہے، ہم پہلے بٹن کے اندر test کے لیے `print` لکھ سکتے ہیں:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

جب بٹن پر click کیا جائے گا تو console یہ دکھائے گا:

```swift
click Sign in
```

یہ ظاہر کرتا ہے کہ بٹن click پر کامیابی سے جواب دے رہا ہے۔

## سائن اِن لاجک

اب ہم سائن اِن بٹن میں سب سے بنیادی validation logic شامل کرتے ہیں: **یہ جانچنا کہ صارف نے یوزرنیم اور پاس ورڈ درج کیا ہے یا نہیں**۔

ہم درج ذیل حالات حاصل کرنا چاہتے ہیں:

- اگر صارف نے کچھ بھی درج نہ کیا ہو تو `Empty` دکھائیں
- اگر صارف نے دونوں میں سے صرف ایک چیز درج کی ہو تو بتائیں کہ کون سی چیز غائب ہے
- اگر یوزرنیم اور پاس ورڈ دونوں درج ہوں تو `Success` دکھائیں

### کوئی معلومات درج نہیں کی گئی

کیونکہ `user` اور `password` دونوں کی ڈیفالٹ value خالی strings ہیں:

```swift
@State private var user = ""
@State private var password = ""
```

لہٰذا جب صارف کچھ بھی درج نہیں کرتا تو یہ دونوں خالی ہی رہتے ہیں۔

Swift میں، `String` جیسے types `isEmpty` استعمال کر کے یہ جانچ سکتے ہیں کہ مواد خالی ہے یا نہیں۔

### isEmpty خاصیت

`isEmpty` اکثر strings، arrays اور دوسرے مواد کے خالی ہونے کی جانچ کے لیے استعمال ہوتی ہے۔

مثال کے طور پر:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

اگر مواد خالی ہو تو `isEmpty` `true` واپس کرتا ہے؛ اگر مواد خالی نہ ہو تو `false` واپس کرتا ہے۔

اس لیے ہم اسے یہ جانچنے کے لیے استعمال کر سکتے ہیں کہ یوزرنیم اور پاس ورڈ میں کچھ درج کیا گیا ہے یا نہیں۔

### variables کو جانچنے کے لیے isEmpty استعمال کرنا

اگر صارف نے کوئی معلومات درج نہ کی ہو، تو:

```swift
user.isEmpty // true
password.isEmpty    // true
```

اس وقت ہم شرط کو اس طرح لکھ سکتے ہیں:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

اس کوڈ کا مطلب ہے: اگر `user` خالی ہے اور `password` بھی خالی ہے، تو یہ دکھائیں:

```swift
Empty
```

یہاں `&&` ایک logical operator ہے، جس کا مطلب “اور” ہے۔

یعنی جب بائیں طرف والی شرط درست ہو اور دائیں طرف والی شرط بھی درست ہو، تبھی پوری شرط درست ہوتی ہے۔

لہٰذا یہ کوڈ صرف اسی صورت میں چلے گا جب یوزرنیم اور پاس ورڈ دونوں خالی ہوں۔

## صارف نے صرف کچھ حصہ بھرا ہے

اب ایک اور صورتِ حال پر غور کرتے ہیں: صارف نے صرف یوزرنیم بھرا ہے، یا صرف پاس ورڈ بھرا ہے۔

مثال کے طور پر:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

اس وقت یوزرنیم خالی نہیں ہے، لیکن پاس ورڈ خالی ہے۔

اسے جانچنے کے لیے ہم `isEmpty` استعمال کرنا جاری رکھ سکتے ہیں:

### صارف کے اکاؤنٹ یا پاس ورڈ بھرنے کی صورت

اگر صارف نے صرف یوزرنیم یا صرف پاس ورڈ بھرا ہے، تو ہمیں اس کے مطابق بتانا ہوگا کہ کیا غائب ہے۔

مثال کے طور پر، اگر صارف نے صرف یوزرنیم بھرا ہو:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

اس کوڈ کی منطق یہ ہے: اگر یوزرنیم خالی ہے تو یوزرنیم درج کرنے کو کہیں۔ ورنہ چیک کریں کہ پاس ورڈ خالی ہے یا نہیں؛ اگر پاس ورڈ خالی ہو تو پاس ورڈ درج کرنے کو کہیں۔

### صارف نے تمام معلومات بھر دی ہیں

اگر یوزرنیم اور پاس ورڈ دونوں درج ہو چکے ہوں، تو دونوں کے لیے `isEmpty` `false` واپس کرے گا۔

اس صورت میں ہم اسے اس طرح لکھ سکتے ہیں:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

یہاں `!` کا مطلب “الٹ” یا “نفی” ہے۔

مثال کے طور پر:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

یعنی `user.isEmpty` یہ جانچنے کے لیے ہے کہ “یوزرنیم خالی ہے یا نہیں”، اور `!user.isEmpty` یہ جانچنے کے لیے ہے کہ “یوزرنیم خالی نہیں ہے”۔

پاس ورڈ کے لیے بھی یہی logic ہے۔

لہٰذا اس کوڈ کا مطلب ہے: یوزرنیم خالی نہیں ہے، اور پاس ورڈ بھی خالی نہیں ہے۔

جب یہ دونوں شرطیں پوری ہوتی ہیں تو یہ دکھایا جاتا ہے:

```swift
Success
```

## مکمل validation logic

اب ہم ان تینوں صورتوں کو یکجا کر کے `Button` میں لکھتے ہیں:

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

اس کوڈ کے چلنے کی ترتیب کو اس طرح سمجھا جا سکتا ہے:

پہلے مرحلے میں، پہلے یہ جانچا جاتا ہے:

```swift
if user.isEmpty && password.isEmpty
```

اگر یوزرنیم اور پاس ورڈ دونوں خالی ہوں، تو فوراً `Empty` دکھایا جاتا ہے۔

اگر دونوں خالی نہ ہوں، تو پروگرام اگلی سطر کو جانچنا جاری رکھتا ہے:

```swift
else if user.isEmpty || password.isEmpty
```

یہاں `||` کا مطلب “یا” ہے۔

یعنی اگر ایک بھی شرط پوری ہو جائے تو پورا اظہار درست ہو جاتا ہے۔

لہٰذا، جب تک یوزرنیم خالی ہو یا پاس ورڈ خالی ہو، `else if` والا code block چلے گا۔

code block میں داخل ہونے کے بعد، ہم مزید جانچتے ہیں کہ اصل میں کون سا input box نہیں بھرا گیا:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

اگر پہلی دو شرطیں پوری نہ ہوں، تو اس کا مطلب ہے کہ یوزرنیم خالی نہیں ہے اور پاس ورڈ بھی خالی نہیں ہے۔

پھر program آخری `else` میں داخل ہوتا ہے:

```swift
print("Success")
```

اس طرح ہم نے لاگ اِن input کی سب سے بنیادی validation logic مکمل کر لی۔

## یوزرنیم اور پاس ورڈ کی جانچ

اوپر والی logic صرف یہ چیک کرتی ہے کہ “کچھ درج کیا گیا ہے یا نہیں”۔

لیکن ایک حقیقی App میں صرف کچھ درج کرنا کافی نہیں ہوتا۔ عموماً یوزرنیم اور پاس ورڈ کو server پر بھیج کر تصدیق بھی کرنی ہوتی ہے۔

اگر server یہ تصدیق کرے کہ یوزرنیم موجود ہے اور پاس ورڈ درست ہے، تو لاگ اِن کی اجازت دی جائے گی؛ ورنہ لاگ اِن ناکام ہونے کی اطلاع دی جائے گی۔

اس عمل کی مشق کے لیے، ہم پہلے code میں ایک عارضی اکاؤنٹ اور پاس ورڈ مقرر کر سکتے ہیں، تاکہ “درست لاگ اِن معلومات” کی نقل کی جا سکے:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

جب یوزرنیم اور پاس ورڈ دونوں خالی نہ ہوں، تو ہم پھر ان کا موازنہ کریں گے کہ آیا وہ درست ہیں یا نہیں:

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

یہاں `==` کا مطلب “برابر ہیں یا نہیں” ہے۔

مثال کے طور پر:

```swift
user == userID
```

اس کا مطلب ہے کہ صارف کی طرف سے درج کیا گیا یوزرنیم، ہمارے مقرر کردہ درست یوزرنیم سے مکمل طور پر یکساں ہے یا نہیں؛ پاس ورڈ کے لیے بھی یہی logic ہے۔

لہٰذا، جب درج کیا گیا یوزرنیم اور پاس ورڈ مقررہ values کے برابر ہوں، تو `Success` دکھایا جاتا ہے؛ اگر ان میں سے کوئی ایک بھی برابر نہ ہو، تو `Input error` دکھایا جاتا ہے۔

اس طرح ہم نے ایک سادہ “فرضی لاگ اِن verification” مکمل کر لیا۔

اگرچہ یہ ابھی بھی server سے منسلک حقیقی لاگ اِن فنکشن نہیں ہے، پھر بھی یہ ہمیں یہ سمجھنے میں کافی مدد دیتا ہے: **بٹن پر click کرنے کے بعد، مختلف conditions کے مطابق مختلف code چلایا جا سکتا ہے**۔

## خلاصہ

اس سبق میں ہم نے ایک بنیادی سائن اِن منظر مکمل کیا اور خاص طور پر “conditions کے مطابق input content کا فیصلہ کرنے والی logic” سیکھی۔

اس سبق کا بنیادی نکتہ یہ ہے: string کے خالی ہونے کو جانچنے کے لیے `isEmpty` استعمال کرنا، اور مختلف حالات کو سنبھالنے کے لیے `if` statements کو logical operators کے ساتھ استعمال کرنا۔

ان میں دو بہت اہم logical operators یہ ہیں:

- `&&`: اس کا مطلب “اور” ہے، دونوں شرطیں پوری ہونی چاہئیں
- `||`: اس کا مطلب “یا” ہے، صرف ایک شرط پوری ہونا کافی ہے

جب یہ conditions آخرکار `true` یا `false` بن جاتی ہیں، تو `if` statement نتیجے کے مطابق مختلف code چلاتی ہے۔

اس سائن اِن منظر کے ذریعے ہم پہلے ہی “interface + data + logical judgment” کو یکجا کرنے والے development طریقے سے واقف ہونا شروع ہو چکے ہیں۔

## مکمل کوڈ

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
