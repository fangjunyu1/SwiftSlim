# لاگ اِن تعاملات

پچھلے سبق میں، ہم نے ایک لاگ اِن ویو بنائی تھی اور بٹنوں اور شرطی منطق کی مدد سے درج کیے گئے مواد کی سادہ جانچ نافذ کی تھی۔

اس سبق میں، ہم پچھلے سبق کے کوڈ کی بنیاد پر `SecureField` پاس ورڈ اِن پٹ فیلڈ، `Alert` وارننگ باکس، اور یہ سیکھیں گے کہ متغیرات کی بنیاد پر مختلف ویوز کی نمائش کو کیسے کنٹرول کیا جاتا ہے۔

اس سبق کے ذریعے، آپ لاگ اِن ویو کے بنیادی تعاملی بہاؤ کو مزید بہتر طور پر سمجھ سکتے ہیں۔ یہ وہ بنیادی منطق بھی ہے جو بہت سی ایپس میں عام طور پر استعمال ہوتی ہے۔

## پاس ورڈ اِن پٹ فیلڈ

پچھلے سبق میں، ہم نے پاس ورڈ درج کرنے کے لیے `TextField` استعمال کیا تھا۔

لیکن ایک حقیقی لاگ اِن انٹرفیس میں، پاس ورڈ عام طور پر براہ راست دکھائی نہیں دیتا۔ اس کے بجائے، یہ نقطوں یا کسی اور مخفی اثر کی صورت میں دکھایا جاتا ہے، جو صارف کی پرائیویسی کے تحفظ میں مدد کرتا ہے۔

SwiftUI میں، پاس ورڈ درج کرنے کے لیے خاص طور پر استعمال ہونے والا کنٹرول `SecureField` ہے۔

مثال کے طور پر:

```swift
SecureField("Password", text: $password)
```

اس کی لکھنے کی ساخت `TextField` سے بہت ملتی جلتی ہے۔ اسے بھی ایک اشارتی متن اور ایک باؤنڈ متغیر کی ضرورت ہوتی ہے۔

اسے سادہ انداز میں یوں سمجھا جا سکتا ہے: `SecureField` بھی ایک اِن پٹ فیلڈ ہے، فرق صرف یہ ہے کہ یہ درج کیا گیا مواد چھپا دیتی ہے۔

ہم پاس ورڈ درج کرنے کے لیے پہلے استعمال ہونے والی `TextField` کو براہ راست `SecureField` سے بدل سکتے ہیں:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

جب صارف پاس ورڈ درج کرے گا، تو پاس ورڈ کا مواد اب انٹرفیس پر براہ راست نظر نہیں آئے گا۔

نمائش کا اثر:

![password](../../Resource/020_password.png)

اب ہم یوزر نیم اور پاس ورڈ درج کر سکتے ہیں، اور پھر بٹن پر کلک کر کے معلوم کر سکتے ہیں کہ اِن پٹ درست ہے یا نہیں۔

### فیڈ بیک پیغامات دکھانا

اس سے پہلے، ہم نتائج دکھانے کے لیے مسلسل `print` استعمال کر رہے تھے۔

`print` کا مواد صرف کنسول میں دکھائی دیتا ہے۔ ڈویلپرز اسے Xcode میں پروگرام چلاتے وقت دیکھ سکتے ہیں، لیکن فون پر عام صارفین یہ پیغامات نہیں دیکھ سکتے۔

اس کا مطلب یہ ہے کہ اگرچہ پروگرام نے جانچ مکمل کر لی ہے، پھر بھی صارف کو معلوم نہیں ہوتا کہ درج کیا گیا مواد درست ہے یا نہیں۔

اس وقت ہمیں ایک ایسا طریقہ درکار ہے جو پیغامات کو براہ راست انٹرفیس پر دکھا سکے۔

## Alert وارننگ باکس

SwiftUI میں، ہم `Alert` استعمال کر کے ایک پاپ اَپ پیغام باکس دکھا سکتے ہیں۔

بنیادی استعمال:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

یہ کوڈ پہلے والے کنٹرولز کے مقابلے میں کچھ زیادہ پیچیدہ لگتا ہے، لیکن ہم اسے حصوں میں تقسیم کر کے سمجھ سکتے ہیں۔

`Alert` بنیادی طور پر درج ذیل حصوں پر مشتمل ہوتا ہے:

- `"Title"`: وارننگ باکس کا عنوان
- `isPresented`: ایک باؤنڈ Boolean قدر، جو یہ کنٹرول کرتی ہے کہ وارننگ باکس دکھایا جائے یا نہیں
- `Button(...)`: وارننگ باکس کے اندر موجود بٹن
- `message:`: وارننگ باکس میں دکھایا جانے والا پیغام

اسے سادہ انداز میں یوں سمجھا جا سکتا ہے: جب باؤنڈ متغیر `true` ہو جاتا ہے، تو سسٹم یہ وارننگ باکس دکھا دیتا ہے۔

نمائش کا اثر:

![alert](../../Resource/020_alert3.png)

متعلقہ ساخت:

![alert](../../Resource/020_alert.png)

### Alert ایک modifier ہے

جیسے ہم نے پہلے بہت سے modifiers سیکھے تھے، ویسے ہی `Alert` بھی کسی نہ کسی ویو کے بعد لگایا جاتا ہے۔

مثال کے طور پر، یہ بٹن کے بعد لگایا جا سکتا ہے:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

یا یہ بیرونی `VStack` کے بعد بھی لگایا جا سکتا ہے:

```swift
VStack {
    // ...
}
.alert() {...}
```

اس کا مطلب یہ ہے کہ `Alert` کوئی الگ سے رکھا گیا آزاد ویو نہیں ہے، بلکہ یہ کسی خاص ویو سے منسلک ایک modifier ہے۔

اسے سادہ انداز میں یوں سمجھا جا سکتا ہے: `Alert` عام طور پر بٹن یا بیرونی layout کے بعد لکھی جاتی ہے، تاکہ کسی خاص شرط کے پورا ہونے پر ایک پیغام ظاہر کیا جا سکے۔

### Alert دکھانا

اگر ہم `Alert` دکھانا چاہتے ہیں، تو اسے کنٹرول کرنے کے لیے ایک متغیر کی ضرورت ہوتی ہے۔

مثال کے طور پر:

```swift
@State private var showAlert = false
```

یہ متغیر `Bool` قسم کا ہے، یعنی اس کی صرف دو قدریں ہیں: `true` یا `false`۔

پھر اسے `Alert` کے `isPresented` کے ساتھ bind کریں:

```swift
isPresented: $showAlert
```

جب `showAlert` `false` ہو گا تو وارننگ باکس ظاہر نہیں ہو گا؛ اور جب `showAlert` `true` ہو گا تو وارننگ باکس ظاہر ہو جائے گا۔

### بٹن کے ذریعے وارننگ باکس دکھانا

اب پہلے سب سے سادہ منظرنامہ نافذ کرتے ہیں:

جب صارف کچھ بھی درج نہ کرے اور براہ راست `Sign in` بٹن پر کلک کرے، تو ایک پیغام باکس ظاہر کریں جو اسے بتائے کہ اس نے ابھی کوئی مواد درج نہیں کیا۔

سب سے پہلے، اس پیغام باکس کو کنٹرول کرنے کے لیے ایک متغیر بنائیں:

```swift
@State private var showEmpty = false
```

پھر `Button` کے بعد ایک `Alert` شامل کریں:

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

اس کے بعد، بٹن کلک کے کوڈ میں جانچ کریں:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

اگر `user` اور `password` دونوں خالی ہوں، تو `showEmpty` کو `true` کر دیں۔

اور چونکہ `Alert` اس متغیر کے ساتھ bind ہے، اس لیے جب یہ `true` ہو جائے گا تو سسٹم خود بخود وارننگ باکس دکھا دے گا۔

نمائش کا اثر:

![alert](../../Resource/020_alert1.png)

اس طرح، بٹن دبانے کے بعد صارف فوراً پیغام دیکھ سکتا ہے، اور ڈویلپر کو کنسول میں `print` آؤٹ پٹ دیکھنے کی ضرورت نہیں رہتی۔

### بٹن اور وارننگ باکس کو مزید بہتر بنانا

اس سے پہلے، ہم نے صرف “کچھ بھی نہ بھرنے” والی صورت کو سنبھالا تھا۔

ہمیں ابھی ان صورتوں کو بھی سنبھالنا ہے:

- یوزر نیم درج نہیں کیا گیا
- پاس ورڈ درج نہیں کیا گیا
- یوزر نیم اور پاس ورڈ دونوں درج کیے گئے ہیں، لیکن مواد غلط ہے

اس لیے ہمیں ان صورتوں کے لیے متعلقہ پیغامات بھی تیار کرنے ہوں گے۔

سب سے پہلے، تین نئے متغیرات شامل کریں:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

پھر بٹن کے بعد متعلقہ `Alert` شامل کرتے جائیں:

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

اس کے بعد، بٹن کے اندر فیصلہ سازی کی منطق کو مکمل کریں:

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

جب بٹن یہ طے کرتا ہے کہ صارف نے کوئی معلومات درج نہیں کیں، ایک معلومات چھوڑی ہے، یا اِن پٹ ویریفکیشن ناکام ہوئی ہے، تو متعلقہ Boolean متغیر `true` ہو جاتا ہے، اور پھر متعلقہ `Alert` ظاہر ہو جاتی ہے۔

یہاں میں مشورہ دوں گا کہ آپ خود چند صورتیں آزما کر دیکھیں:

- کچھ بھی نہ بھریں
- صرف یوزر نیم بھریں
- صرف پاس ورڈ بھریں
- یوزر نیم اور پاس ورڈ دونوں بھریں، لیکن مواد غلط ہو
- یوزر نیم اور پاس ورڈ دونوں بھریں، اور مواد درست ہو

یہ اس بات کی جانچ میں مدد دیتا ہے کہ آیا ہمارے کوڈ میں کوئی مسئلہ ہے یا نہیں۔ یہ App development میں ایک بہت اہم “testing” مرحلہ بھی ہے۔

اگر پروگرام کسی خاص صورت میں غلط برتاؤ کرے، تو اس کا مطلب ہے کہ منطق میں مسئلہ ہو سکتا ہے، اور پروگرام میں ایک `Bug` موجود ہے۔

Development میں عام طور پر `Bug` سے مراد غلطی، خامی، یا ایسا رویہ ہے جو توقعات کے مطابق نہ ہو۔

## لاگ اِن ویو مکمل کرنا

جن `Alert` مثالوں پر ہم نے پہلے بات کی، وہ سب اس بارے میں تھیں کہ جب “اِن پٹ غلط ہو” تو صارف کو فیڈ بیک کیسے دیا جائے۔

جب صارف درست یوزر نیم اور پاس ورڈ درج کرتا ہے، تو ہم عام طور پر “وارننگ باکس” نہیں دکھاتے۔ اس کے بجائے ہم براہ راست لاگ اِن کے بعد والے انٹرفیس میں داخل ہو جاتے ہیں۔

یہ ایک بہت اہم تصور سے متعلق ہے: **کسی متغیر کی قدر کی بنیاد پر مختلف ویوز دکھانا۔**

مثال کے طور پر:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

یہاں ہم یہ طے کرنے کے لیے `Bool` قسم استعمال کرتے ہیں کہ کون سا ویو دکھایا جائے:

- اگر `login` `true` ہو، تو اس کا مطلب ہے کہ لاگ اِن پہلے ہی کامیاب ہو چکا ہے، اور لاگ اِن کے بعد والا مواد دکھایا جائے گا
- اگر `login` `false` ہو، تو اس کا مطلب ہے کہ لاگ اِن کامیاب نہیں ہوا، اور لاگ اِن انٹرفیس ہی دکھایا جاتا رہے گا۔

اگرچہ `if` اسٹیٹمنٹ Swift میں ایک شرطی بیان ہے، لیکن SwiftUI کے `body` میں اسے ویوز کی display logic کنٹرول کرنے کے لیے استعمال کیا جا سکتا ہے۔

اس کا مطلب ہے کہ SwiftUI شرط کے نتیجے کی بنیاد پر طے کرتی ہے کہ اس وقت کون سا ویو دکھایا جانا چاہیے۔

ہم اس display logic کو موجودہ `ContentView` میں رکھ سکتے ہیں:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// اصل لاگ اِن ویو کا کوڈ
		}
	}
}
```

یہاں، ہم نے `login` نامی ایک نیا متغیر شامل کیا، جو یہ ظاہر کرتا ہے کہ آیا صارف کامیابی سے لاگ اِن ہو چکا ہے یا نہیں۔

پھر ہم نے پہلے سے لکھی گئی لاگ اِن ویو کا کوڈ `else` اسٹیٹمنٹ کے بعد رکھ دیا۔

ویو ڈسپلے منطق:

- جب `login` `false` ہو، تو اس کا مطلب ہے کہ لاگ اِن ابھی کامیاب نہیں ہوا، اس لیے اصل لاگ اِن ویو دکھائی جاتی رہے گی۔
- جب `login` `true` ہو، تو اس کا مطلب ہے کہ لاگ اِن کامیاب ہے۔ اس وقت لاگ اِن ویو مزید نہیں دکھائی جائے گی، اور اس کی جگہ `Login successful` دکھایا جائے گا۔

اس کا مطلب ہے کہ `ContentView`، `login` کی قدر کے مطابق مختلف ویو مواد دکھائے گا۔

اب بٹن کے اندر لاگ اِن کامیابی کی منطق میں تبدیلی کرتے ہیں:

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

جب صارف کی طرف سے درج کیا گیا یوزر نیم اور پاس ورڈ دونوں درست ہوں، تو ہم `login` کو `true` کر دیتے ہیں۔

جیسے ہی `login` کی قدر بدلتی ہے، `ContentView` میں `if` جانچ کا نتیجہ بھی بدل جاتا ہے، اور انٹرفیس اصل لاگ اِن ویو سے `Login successful` میں تبدیل ہو جاتا ہے۔

نمائش کا اثر درج ذیل ہے:

![view](../../Resource/020_view.png)

اب ہم نے “شرائط کی بنیاد پر مختلف ویوز دکھانے” کے تصور کو واقعی اس موجودہ لاگ اِن صفحے پر لاگو کر دیا ہے۔

حقیقی App میں بھی عام طور پر یہی طریقہ استعمال ہوتا ہے: کسی خاص قدر کی بنیاد پر مختلف ویوز دکھائے جاتے ہیں۔

مثال کے طور پر، جب صارف لاگ اِن نہ ہو تو لاگ اِن صفحہ دکھایا جاتا ہے؛ اور جب صارف کامیابی سے لاگ اِن کر لے تو ایک اور انٹرفیس دکھایا جاتا ہے۔

بنیادی خیال یہ ہے: **متغیرات میں تبدیلی کے ذریعے کنٹرول کریں کہ انٹرفیس کون سا مواد دکھائے۔**

## خلاصہ

اس سبق میں، ہم نے تین اہم چیزیں سیکھیں:

1. پاس ورڈ درج کرنے کے لیے `SecureField` استعمال کرنا، تاکہ پاس ورڈ کا مواد انٹرفیس پر براہ راست نظر نہ آئے۔
2. صارف کو پیغامات دکھانے کے لیے `Alert` استعمال کرنا، صرف کنسول میں آؤٹ پٹ دینے کے بجائے۔
3. مختلف ویوز کی نمائش کو کنٹرول کرنے کے لیے متغیرات اور `if` شرائط استعمال کرنا، تاکہ لاگ اِن سے پہلے اور بعد کے انٹرفیسز کے درمیان تبدیلی ممکن ہو سکے۔

ان تصورات کو سیکھنے کے بعد، اب ہم ایک بنیادی تعاملات والی لاگ اِن ویو مکمل کر سکتے ہیں، اور SwiftUI کی اس development thinking کو بہتر طور پر سمجھ سکتے ہیں کہ “جب state بدلے، تو انٹرفیس update ہو جاتا ہے”۔

## مکمل کوڈ

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

## اضافی علم - متعدد بٹنوں والا Alert

اس سبق کے پہلے حصے میں، ہم نے سب سے بنیادی `Alert` استعمال کیا تھا، جس میں صرف ایک بٹن ہوتا ہے اور جو بنیادی طور پر صارف کو اطلاع دینے کے لیے استعمال ہوتا ہے۔

درحقیقت، `Alert` میں کئی بٹن بھی ہو سکتے ہیں، تاکہ صارف مختلف انتخاب کر سکے۔

مثال کے طور پر:

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

بٹن پر کلک کرنے کے بعد، `Ok`، `delete`، اور `cancel` کے ساتھ ایک پیغام باکس ظاہر ہو گا۔

نمائش کا اثر:

![alert](../../Resource/020_alert2.png)

مختلف بٹنوں پر کلک کرنے سے متعلقہ کوڈ چلے گا۔

### Button کی `role` خصوصیت

یہاں آپ دیکھیں گے کہ `Alert` کے اندر موجود `Button`، اس عام بٹن syntax سے تھوڑا مختلف ہے جو ہم نے پہلے سیکھا تھا:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

یہاں ایک اضافی `role` parameter موجود ہے۔

SwiftUI میں، `role` اس لیے استعمال ہوتا ہے تاکہ سسٹم کو بتایا جا سکے کہ یہ بٹن کس قسم کے عمل کی نمائندگی کرتا ہے۔

چند عام roles یہ ہیں:

- `.cancel`: منسوخی کا عمل
- `.destructive`: خطرناک عمل، جیسے حذف کرنا
- `nil`: عام عمل

مختلف `role` values عام طور پر انٹرفیس میں مختلف visual styles کا باعث بھی بنتی ہیں۔

مثال کے طور پر، خطرناک اعمال اکثر زیادہ نمایاں انداز میں دکھائے جاتے ہیں تاکہ صارفین کو احتیاط سے کلک کرنے کی یاد دہانی ہو۔

اس کے علاوہ، `role` بٹن کے لیے اضافی معنوی معلومات بھی فراہم کرتا ہے، جس سے VoiceOver جیسے screen readers کے لیے صارف کو بٹن کے مقصد کی وضاحت کرنا آسان ہو جاتا ہے۔

اس لیے مناسب حالات میں کسی بٹن کے ساتھ `role` شامل کرنا ایک بہت اچھی عادت ہے۔
