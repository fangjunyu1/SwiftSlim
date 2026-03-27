# منی باکس کی رقم محفوظ کرنا

پچھلے سبق میں، ہم نے ایک سادہ "منی باکس" بنایا تھا۔ اس سبق میں، ہم سیکھیں گے کہ "منی باکس" کی رقم کو مستقل طور پر کیسے محفوظ کیا جائے۔

اس سبق میں بنیادی طور پر UserDefaults اور @AppStorage پراپرٹی ریپر سیکھا جائے گا، ساتھ ہی onAppear کے کردار اور Optional قسم (nil) کے استعمال کی بھی توسیعی وضاحت کی جائے گی۔

یہ بات ذہن میں رہے کہ اس سبق میں پچھلے سبق میں بنائے گئے "منی باکس" کے کوڈ کو ہی آگے استعمال کرنا ہے۔

## مستقل محفوظ رکھنے کا مسئلہ

اب "منی باکس" کا انٹرفیس بہت سادہ ہے اور استعمال میں بھی آسان ہے۔

![Piggy Bank](../../Resource/014_view.png)

لیکن ایک واضح مسئلہ ہے: ہر بار ویو ریفریش ہونے یا ایپ بند ہونے کے بعد "منی باکس" کی کل رقم دوبارہ 0 ہو جاتی ہے، اور پہلے کی ساری رقم ختم ہو جاتی ہے۔

اس کا مطلب یہ ہے کہ ڈیٹا حقیقت میں محفوظ نہیں ہو رہا۔ دوسرے الفاظ میں، موجودہ "منی باکس" صرف عارضی ڈیٹا محفوظ کر سکتا ہے۔

### مستقل طور پر محفوظ کیوں نہیں ہو رہا؟

اس کی وجہ یہ ہے کہ ہم نے @State کے ذریعے یہ ویری ایبل استعمال کیا ہے:

```swift
@State private var amount = 0
```

@State سے بنایا گیا ویری ایبل مکمل طور پر ویو کے لائف سائیکل پر منحصر ہوتا ہے۔

جب ویو بنتا ہے تو amount کی ابتدائی قیمت 0 ہوتی ہے، اور جب ویو ختم ہوتا ہے تو amount بھی ختم ہو جاتا ہے۔

یہاں amount میں محفوظ ڈیٹا صرف میموری میں موجود رہتا ہے، ڈیوائس پر محفوظ نہیں کیا جاتا۔

اگر ہم نہیں چاہتے کہ amount ویو کے لائف سائیکل کے ساتھ بندھا رہے، تو ہمیں ڈیٹا کو مستقل طور پر محفوظ کرنا ہوگا۔ یعنی ڈیٹا کو ڈیوائس پر محفوظ کرنا ہوگا۔

### "ڈیٹا پرسیسٹنس" کیا ہے؟

ڈیٹا پرسیسٹنس کو یوں سمجھا جا سکتا ہے کہ ڈیٹا کو "عارضی میموری" سے نکال کر "ڈیوائس اسٹوریج" میں محفوظ کر دیا جائے۔

اس کے بعد، ویو بند ہونے یا ایپ بند ہونے پر بھی ڈیٹا ضائع نہیں ہوتا۔

Swift ڈویلپمنٹ میں، سادہ "ڈیٹا پرسیسٹنس" کے لیے UserDefaults استعمال کیا جا سکتا ہے، جبکہ زیادہ پیچیدہ ڈیٹا کے لیے SwiftData یا CoreData استعمال کی جاتی ہے۔

اس سبق میں، ہم پہلے سب سے آسان UserDefaults سیکھیں گے۔

## UserDefaults

UserDefaults ہلکے وزن کے key-value ڈیٹا کو محفوظ کرنے کے لیے استعمال ہوتا ہے، اور عام طور پر String، Int، Double، Bool جیسی بنیادی اقسام کو محفوظ کرنے کے لیے موزوں ہے۔

### ڈیٹا محفوظ کرنا

UserDefaults میں set میتھڈ کے ذریعے ڈیٹا محفوظ کیا جاتا ہے:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults کے پہلے پیرامیٹر میں وہ ڈیٹا دیا جاتا ہے جسے محفوظ کرنا ہے، یہاں String، Int وغیرہ جیسی اقسام دی گئی ہیں۔

دوسرا پیرامیٹر forKey کسی ویری ایبل کے نام جیسا ہوتا ہے، جو UserDefaults میں محفوظ کیے گئے ڈیٹا کی شناخت کے لیے استعمال ہوتا ہے۔

### ڈیٹا پڑھنا

UserDefaults میں متعلقہ میتھڈ کے ذریعے ڈیٹا پڑھا جاتا ہے:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

پڑھتے وقت متعلقہ قسم کا درست میتھڈ استعمال کرنا ضروری ہے، ورنہ غلطی آ سکتی ہے یا ڈیٹا درست نہیں ملے گا۔

### UserDefaults کے اہم نکات

#### 1. Optional قسم واپس آنا

UserDefaults سے ڈیٹا پڑھتے وقت بعض میتھڈز Optional قسم (Optional) واپس کرتے ہیں۔

مثال کے طور پر:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

اس سے ملنے والے name کی قسم یہ ہوتی ہے:

```swift
String?
```

اس کا مطلب ہے کہ ویلیو موجود بھی ہو سکتی ہے اور نہیں بھی۔

**یہ Optional کیوں واپس کرتا ہے؟**

کیونکہ UserDefaults میں کسی مخصوص Key کے لیے ضروری نہیں کہ پہلے سے کوئی ویلیو محفوظ ہو۔

مثال کے طور پر:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

اگر "City" نامی Key کے لیے پہلے کبھی کوئی ویلیو محفوظ نہ کی گئی ہو، تو نتیجہ یہ ہوگا:

```swift
nil
```

یہاں خاص طور پر سمجھنا ضروری ہے کہ nil کا مطلب "کوئی ڈیٹا موجود نہیں" ہے، یہ خالی اسٹرنگ نہیں ہے۔

"ٹائپ سسٹم" والے سبق میں بھی ہم نے اسی طرح کی صورت دیکھی تھی، جب ٹائپ کنورژن ناکام ہوتی ہے تو Optional قسم واپس آتی ہے۔

ایسی صورت میں، ہم ?? کے ذریعے ایک ڈیفالٹ ویلیو دے کر اسے unwrap کرتے ہیں:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

اگر UserDefaults سے ویلیو مل جائے تو وہی استعمال ہوگی، اور اگر ویلیو نہ ملے (nil) تو ڈیفالٹ ویلیو استعمال ہوگی۔

#### 2. Non-Optional قسم واپس آنا

UserDefaults جب Int، Double، Bool قسم کا ڈیٹا پڑھتا ہے، تو یہ Non-Optional ویلیو واپس کرتا ہے۔

مثال کے طور پر:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

چاہے ان Keys کے لیے پہلے کبھی کوئی ویلیو محفوظ نہ کی گئی ہو، تب بھی نتیجہ nil نہیں ہوگا۔

بلکہ یہ ڈیفالٹ ویلیو واپس کرے گا:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. ڈیٹا کی مقدار کی حد

UserDefaults صرف کم مقدار کے ڈیٹا کے لیے موزوں ہے، جیسے ایپ کی سیٹنگز، سادہ اسٹیٹس وغیرہ۔

عملی استعمال میں، یہ بڑی مقدار کے ڈیٹا یا بہت زیادہ بار پڑھے اور لکھے جانے والے ڈیٹا کے لیے مناسب نہیں ہے۔

## "منی باکس" کی رقم محفوظ کرنا

اب ہم UserDefaults استعمال کر کے "منی باکس" کی کل رقم محفوظ کرنے کی لاجک بنا سکتے ہیں۔

جب صارف بٹن پر کلک کرے، تو درج کی گئی رقم کل رقم میں جمع ہوگی، اور پھر کل رقم UserDefaults میں محفوظ کر دی جائے گی۔

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

اب ہم نے ڈیٹا لکھنے کی لاجک مکمل کر لی ہے۔

## ڈیٹا پرسیسٹنس کی لاجک کی وضاحت

اگرچہ ہم نے ڈیٹا کو مستقل محفوظ کرنے کے لیے لکھنے والی لاجک مکمل کر لی ہے، لیکن اصل چلانے پر آپ دیکھیں گے کہ ہر بار ویو ریفریش ہونے یا ایپ دوبارہ کھلنے پر amount پھر بھی 0 ہوتا ہے۔

اس کی وجہ یہ ہے:

```swift
@State private var amount = 0
```

SwiftUI میں، @State ویری ایبل ویو بننے کے وقت دوبارہ initialize ہو جاتا ہے۔

اگرچہ UserDefaults میں amount محفوظ ہو چکا ہوتا ہے، لیکن ویو دوبارہ لوڈ ہونے پر amount پھر 0 پر ری سیٹ ہو جاتا ہے۔

اس سے واضح ہوتا ہے کہ اس وقت ہم نے صرف ڈیٹا کو UserDefaults میں محفوظ کیا ہے، لیکن ویو میں اسے بحال نہیں کیا۔

اسی لیے، ویو لوڈ ہوتے وقت ہمیں UserDefaults سے ویلیو دوبارہ پڑھ کر amount کو دینی ہوگی، تبھی مکمل ڈیٹا پرسیسٹنس کی لاجک کام کرے گی۔

### منطقی مثال

اس عمل کو "کلاس روم کے بلیک بورڈ" سے سمجھا جا سکتا ہے:

کلاس کے دوران، استاد بلیک بورڈ پر لکھتا ہے۔ یہ مواد ویو کے موجودہ اسٹیٹ (@State) کی طرح ہے۔

جب کلاس ختم ہو جاتی ہے، تو بلیک بورڈ صاف کر دیا جاتا ہے تاکہ اگلی کلاس کے لیے تیار ہو جائے۔ یہ ویو کے ختم ہونے جیسا ہے، اور @State میں موجود ڈیٹا بھی ختم ہو جاتا ہے۔

تاکہ پڑھایا گیا مواد ضائع نہ ہو، استاد پہلے ہی اسے نوٹس یا مواد میں محفوظ کر لیتا ہے۔ یہ مواد بالکل UserDefaults میں محفوظ ڈیٹا کی طرح ہے۔

جب اگلی بار کلاس شروع ہوتی ہے، تو بلیک بورڈ شروع میں خالی ہوتا ہے (@State کی ابتدائی حالت)، اور استاد محفوظ شدہ مواد دیکھ کر وہی چیز دوبارہ بلیک بورڈ پر لکھتا ہے (یعنی UserDefaults سے پڑھتا ہے)۔

سمجھنے کی بات یہ ہے کہ بلیک بورڈ خود بخود پچھلا مواد واپس نہیں لاتا، اسے "محفوظ شدہ مواد پڑھ کر" (UserDefaults سے پڑھ کر) دوبارہ لکھنا پڑتا ہے۔

## onAppear کے ذریعے ڈیٹا پڑھنا

جب ویو ظاہر ہو، تو UserDefaults میں محفوظ ویلیو کو دستی طور پر پڑھ کر @State والے amount میں دینا ضروری ہے، تاکہ اصل ڈیٹا پرسیسٹنس حاصل ہو سکے۔

SwiftUI میں، onAppear کے ذریعے ویو کے ظاہر ہونے کے وقت ابتدائی لاجک چلائی جا سکتی ہے:

```swift
.onAppear {}
```

UserDefaults سے پڑھنے والا کوڈ onAppear کے اندر رکھا جا سکتا ہے:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

جب ویو بنتا ہے، amount کی ابتدائی قیمت 0 ہوتی ہے؛ جب ویو ظاہر ہوتا ہے، onAppear چلتا ہے، UserDefaults سے ویلیو پڑھ کر amount کو دی جاتی ہے۔ اس طرح ویو پچھلی محفوظ شدہ کل رقم دکھا سکتا ہے۔

اب "منی باکس" کی پوری ڈیٹا پرسیسٹنس لاجک مکمل ہو جاتی ہے۔

## مکمل کوڈ

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage پراپرٹی ریپر

SwiftUI میں @AppStorage نامی پراپرٹی ریپر موجود ہے، جو UserDefaults کی محفوظ کرنے والی لاجک کو آسان بنا دیتا ہے۔

```
@AppStorage("amount") private var amount = 0
```

@AppStorage دراصل UserDefaults کی ایک wrapper شکل ہے، اور "amount" یہاں UserDefaults کی Key کے برابر ہے۔

جب ویو بنتا ہے، تو یہ UserDefaults سے ڈیٹا پڑھ لیتا ہے؛ اور جب ویری ایبل کی ویلیو بدلتی ہے، تو یہ خودکار طور پر UserDefaults میں محفوظ بھی کر دیتا ہے۔

یہ SwiftUI کے state update mechanism کے ساتھ کام کرتا ہے، اور @State کی طرح ویلیو بدلنے پر ویو کو refresh بھی کرتا ہے۔

یعنی @AppStorage خود ہی ڈیٹا پڑھنے اور محفوظ کرنے دونوں کی لاجک سنبھال لیتا ہے، اس لیے نہ UserDefaults کو دستی طور پر کال کرنے کی ضرورت رہتی ہے، اور نہ onAppear کے ذریعے دستی طور پر ڈیٹا پڑھنے کی۔

اس لیے، ہم کوڈ میں UserDefaults کی جگہ @AppStorage استعمال کر سکتے ہیں:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## خلاصہ

اس سبق میں ہم نے بنیادی طور پر یہ نکات سیکھے:

سب سے پہلے، UserDefaults ہلکے وزن کے ڈیٹا کو محفوظ کرنے کے لیے استعمال ہوتا ہے۔ ہم نے UserDefaults کے ذریعے کل رقم کو ڈیوائس پر محفوظ کیا۔ UserDefaults پڑھنے اور لکھنے کے میتھڈز دیتا ہے، اور اس میں Optional قسم جیسی صورتوں کو بھی سمجھنا پڑتا ہے۔

اس کے بعد، @State ویری ایبل صرف ویو کے اندر عارضی حالت کو manage کرنے کے لیے ہوتا ہے، اور اس کا لائف سائیکل ویو کے ساتھ جڑا ہوتا ہے۔ جب ویو دوبارہ بنتا ہے، تو @State بھی دوبارہ initialize ہو جاتا ہے۔

UserDefaults سے ڈیٹا بحال کرنے کے عمل میں، ہم نے onAppear استعمال کرنا سیکھا، تاکہ ویو ظاہر ہوتے وقت محفوظ شدہ ڈیٹا پڑھا جا سکے اور ویو میں دوبارہ دکھایا جا سکے۔

آخر میں، ہم نے @AppStorage کے ذریعے UserDefaults کو replace کیا، تاکہ ویو لوڈ ہونے پر ڈیٹا خودکار طور پر پڑھا جائے، اور ویلیو بدلنے پر خودکار طور پر محفوظ بھی ہو جائے۔ اس طرح UserDefaults اور onAppear کی دستی لاجک کی ضرورت کم ہو جاتی ہے۔

ان نکات کے ذریعے، ہم ایک بنیادی App data storage feature بنا سکتے ہیں، تاکہ ڈیٹا مستقل طور پر محفوظ رہے۔

## سبق کے بعد مشق

اب "منی باکس" میں رقم محفوظ کرنے کی سہولت تو موجود ہے، لیکن اس کی functionality ابھی مکمل نہیں ہے۔

1. اگر صارف رقم نکالنا چاہے، تو اس کے لیے مناسب نکالنے کی لاجک بھی بنانی ہوگی۔
2. اگر صارف پوری رقم صاف کرنا چاہے، تو reset کی functionality بھی شامل کرنی ہوگی۔
3. اگر "منی باکس" کے لیے نام شامل کرنا ہو، تو String قسم کا ڈیٹا محفوظ کرنا بھی سیکھنا ہوگا۔

آپ موجودہ بنیاد پر ان features کو مزید مکمل کر سکتے ہیں، تاکہ "منی باکس" زیادہ مکمل بن جائے۔

## اضافی علم - ان پٹ فیلڈ کی ڈیفالٹ ویلیو کا مسئلہ

اب ہم ان پٹ فیلڈ کے interaction کو مزید بہتر بھی بنا سکتے ہیں، تاکہ input کرنا زیادہ آسان ہو جائے۔

![textfield](../../Resource/015_view.png)

موجودہ implementation میں، input field کی default value 0 ہے۔ ہر بار رقم درج کرتے وقت صارف کو پہلے 0 حذف کرنا پڑتا ہے، پھر نئی رقم لکھنی پڑتی ہے۔ یہ interaction experience مناسب نہیں ہے۔

ہمیں input field کی ابتدائی ویلیو 0 کے بجائے خالی رکھنی چاہیے۔

اس کی وجہ یہ ہے کہ TextField اور number دو طرفہ binding میں جڑے ہوئے ہیں:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

جب number کی ابتدائی ویلیو 0 ہوتی ہے، تو input field میں بھی 0 دکھائی دیتا ہے۔

اس لیے، ہمیں number کو خالی ویلیو یعنی nil بنانا ہوگا۔

```swift
@State private var number = nil
```

اس وقت یہ error آئے گی:

```
Generic parameter 'Value' could not be inferred
```

یہ وہی صورت ہے جو ہم نے "ٹائپ سسٹم" میں سیکھی تھی: جب ویری ایبل کی قسم خودکار طور پر اندازہ نہ کی جا سکے، تو ہمیں اس کی قسم واضح طور پر لکھنی پڑتی ہے۔

کیونکہ ہم نے number کو nil بنایا ہے، اور nil خود کسی خاص قسم کی معلومات نہیں رکھتا، اس لیے compiler یہ طے نہیں کر سکتا کہ یہ ویری ایبل String ہے، Int ہے، یا کوئی اور قسم۔ اسی وجہ سے error آتی ہے۔

لہٰذا، ہمیں number کی type واضح طور پر declare کرنی ہوگی:

```swift
@State private var number:Int? = nil
```

یہاں Int? کا مطلب Optional قسم ہے، یعنی number کی ویلیو Int بھی ہو سکتی ہے اور nil بھی۔

اس طرح، شروع میں اسے nil دینے سے input field خالی دکھائی دے گی، 0 نہیں۔

### Optional کو unwrap کرنا

جب ہم number کو Optional قسم بنا دیتے ہیں، تو پہلے والا calculation code error دینے لگتا ہے:

```swift
amount += number
```

اس کی warning یا error یہ ہوگی:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

اس کی وجہ یہ ہے کہ number اب nil بھی ہو سکتا ہے۔ اگر اسے براہ راست calculation میں استعمال کریں، تو صورت کچھ یوں بن جاتی ہے:

```swift
amount += nil
```

ظاہر ہے، nil کو amount کے ساتھ جمع نہیں کیا جا سکتا۔ یہ درست عمل نہیں ہے۔

اس لیے، جب Optional قسم کو calculation میں استعمال کرنا ہو، تو پہلے اسے unwrap کرنا ضروری ہوتا ہے۔

یہاں ہم ?? کے ذریعے ایک default value دے سکتے ہیں:

```swift
amount += number ?? 0
```

اگر number کی ویلیو nil ہو، تو default value 0 استعمال ہوگی؛ اور اگر number میں ویلیو موجود ہو، تو وہی اصل input استعمال ہوگا۔

اس طرح calculation بھی درست رہتی ہے، اور input field کو خالی default رکھنے والا بہتر interaction بھی حاصل ہو جاتا ہے۔ صارف کو ہر بار 0 مٹانا نہیں پڑتا۔

## اضافی کوڈ

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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
