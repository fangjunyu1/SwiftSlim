# کسٹم ویو

اس سبق میں ہم SwiftUI کی ایک بہت اہم تحریری تکنیک سیکھیں گے: **کسٹم ویو**۔

کسٹم ویو بار بار استعمال ہونے والے ویو کوڈ کے ایک حصے کو بند کر کے اسے ایک ایسا ویو بنا سکتا ہے جسے دوبارہ استعمال کیا جا سکے۔

App کی حقیقی ڈویلپمنٹ میں ہم اکثر اس صورتِ حال سے گزرتے ہیں: کئی اسکرینوں کی ساخت ایک جیسی ہوتی ہے، صرف دکھایا جانے والا مواد مختلف ہوتا ہے۔

مثال کے طور پر فورم ویب سائٹ کی پوسٹ لسٹ میں ہر پوسٹ کے پاس عنوان، تصویر، لائکس کی تعداد وغیرہ ہو سکتے ہیں۔

![Reddit](../../../Resource/028_view1.png)

شاپنگ ویب سائٹ کی پروڈکٹ لسٹ میں ہر پروڈکٹ کے پاس تصویر، نام اور قیمت وغیرہ ہو سکتے ہیں۔

![Amazon](../../../Resource/028_view2.png)

ان مواد کی ساخت ملتی جلتی ہوتی ہے، فرق صرف دکھائے جانے والے ڈیٹا کا ہوتا ہے۔

اگر ہر آئٹم کا کوڈ ہاتھ سے دوبارہ لکھا جائے تو کوڈ بہت لمبا ہو جائے گا، اور بعد میں ترمیم کرنا بھی آسان نہیں رہے گا۔

اس لیے ہم ایک جیسی ساخت کو ایک کسٹم ویو میں بند کر سکتے ہیں، پھر مختلف مواد کو پیرامیٹر کے طور پر اندر بھیج سکتے ہیں۔

اس طرح ایک ہی ویو مختلف مواد دکھا سکتا ہے۔

## ضرورت کا منظرنامہ

مثال کے طور پر، اب ہم ایک سیٹنگز لسٹ بنانا چاہتے ہیں۔

دکھائی دینے والا نتیجہ:

![view](../../../Resource/028_view.png)

اس سیٹنگز لسٹ میں تین مختلف سیٹنگ آئٹمز ہیں: `Settings`، `Folder`، `Music`۔

اگرچہ ان کے آئیکن، رنگ اور عنوان مختلف ہیں، لیکن مجموعی ساخت ایک جیسی ہے:

- بائیں طرف آئیکن
- آئیکن کے پس منظر کا رنگ
- درمیان میں عنوان
- دائیں طرف تیر

اگر کسٹم ویو استعمال نہ کیا جائے تو ہم شاید اسے اس طرح لکھیں گے:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("ترتیبات")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("فولڈر")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("موسیقی")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

یہ کوڈ درست طریقے سے دکھایا جا سکتا ہے، لیکن مسئلہ بھی بہت واضح ہے: تینوں سیٹنگ آئٹمز کا کوڈ تقریباً مکمل طور پر ایک جیسا ہے۔

مختلف حصے صرف آئیکن، رنگ اور عنوان ہیں:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("ترتیبات")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("فولڈر")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("موسیقی")
```

یعنی ہر سیٹنگ آئٹم کی ساخت مقرر ہے، صرف آئیکن، رنگ اور عنوان مختلف ہیں۔

یہ صورتِ حال کسٹم ویو کے استعمال کے لیے بہت مناسب ہے۔

### شیڈو shadow

یہاں ایک نیا موڈیفائر `.shadow(radius:)` استعمال کیا گیا ہے:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` ویو میں سایہ شامل کر سکتا ہے۔

`radius` سائے کے دھندلاہٹ کے نصف قطر کو ظاہر کرتا ہے۔ عدد جتنا بڑا ہو، سایہ عموماً اتنا ہی زیادہ پھیلتا ہے اور زیادہ نرم نظر آتا ہے۔

یہاں اسے `1` رکھا گیا ہے، یعنی صرف ایک بہت ہلکا سا سایہ شامل کیا گیا ہے۔

## سیٹنگ آئٹم ویو کو بند کرنا

اگلے مرحلے میں ہم ہر سیٹنگ آئٹم کو ایک نئے ویو میں بند کرتے ہیں۔

ہم ایک `SettingItemView` بنا سکتے ہیں:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

اس ویو میں ہم نے تین پراپرٹیز تعریف کی ہیں:

```swift
let icon: String
let color: Color
let title: String
```

ان میں:

- `icon` آئیکن کے نام کو ظاہر کرتا ہے
- `color` آئیکن کے پس منظر کے رنگ کو ظاہر کرتا ہے
- `title` سیٹنگ آئٹم کے عنوان کو ظاہر کرتا ہے

چونکہ یہ تینوں مواد مختلف سیٹنگ آئٹمز میں ایک جیسے نہیں ہوتے، اس لیے ہم انہیں ایسے پیرامیٹرز بناتے ہیں جو باہر سے پاس کیے جا سکیں۔

## کسٹم ویو استعمال کرنا

`SettingItemView` بن جانے کے بعد ہمیں بار بار ایک لمبا `HStack` کوڈ لکھنے کی ضرورت نہیں رہتی۔

اب اسے اس طرح استعمال کیا جا سکتا ہے:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ترتیبات")
```

یہ لائن ایک سیٹنگ آئٹم ویو بناتی ہے اور تین پیرامیٹرز پاس کرتی ہے:

```swift
icon: "gear"
color: Color.blue
title: "ترتیبات"
```

پاس کرنے کے بعد، `SettingItemView` کے اندر موجود پراپرٹیز کو متعلقہ ویلیوز مل جائیں گی:

- `icon` کی ویلیو `gear` ہے
- `color` کی ویلیو `Color.blue` ہے
- `title` کی ویلیو `"ترتیبات"` ہے

اس لیے ویو کے اندر `Image(systemName: icon)` گیئر آئیکن دکھائے گا، `.background(color)` نیلا پس منظر استعمال کرے گا، اور `Text(title)` `ترتیبات` دکھائے گا۔

مکمل کوڈ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "ترتیبات")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "فولڈر")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "موسیقی")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/028_view.png)

دیکھا جا سکتا ہے کہ بند کرنے کے بعد دکھائی دینے والا نتیجہ پہلے جیسا ہی ہے، لیکن کوڈ زیادہ واضح ہو گیا ہے۔

پہلے ہر سیٹنگ آئٹم کے لیے ایک مکمل `HStack` لکھنا پڑتا تھا، اب صرف ایک لائن کوڈ کافی ہے:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ترتیبات")
```

یہی کسٹم ویو کا کام ہے: **بار بار دہرائی جانے والی ویو ساخت کو بند کرنا، اور صرف مختلف مواد کو پیرامیٹر کے طور پر پاس کرنا۔**

## پیرامیٹر کیوں پاس کیے جا سکتے ہیں

اب ہم مختصر طور پر سمجھتے ہیں کہ کسٹم ویو میں پیرامیٹر کیوں پاس کیے جا سکتے ہیں۔

SwiftUI میں ویو اصل میں ایک اسٹرکچر ہوتا ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    var body: some View {
        Text("سلام، دنیا!")
    }
}
```

یہاں `ContentView` ایک اسٹرکچر ہے۔

جب ہم لکھتے ہیں:

```swift
ContentView()
```

اصل میں ہم ایک `ContentView` ویو بنا رہے ہوتے ہیں۔

آخر کا `()` اس کے initializer کو کال کرنے کو ظاہر کرتا ہے، اور اسے اس ویو کو بنانے کے طور پر بھی سمجھا جا سکتا ہے۔

چونکہ اس `ContentView` میں باہر سے پاس کی جانے والی کوئی پراپرٹی نہیں ہے، اس لیے براہِ راست لکھا جا سکتا ہے:

```swift
ContentView()
```

لیکن اگر ویو میں کوئی ایسی پراپرٹی ہے جسے ابھی ویلیو نہیں دی گئی، تو ویو بناتے وقت متعلقہ ویلیو پاس کرنا ضروری ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("نام: \(name)")
    }
}
```

یہاں `name` ایک پراپرٹی ہے، اور اس کی کوئی ڈیفالٹ ویلیو نہیں ہے۔

اس لیے `ContentView` بناتے وقت `name` کو ایک مخصوص ویلیو دینا ضروری ہے:

```swift
ContentView(name: "Fang Junyu")
```

اس طرح ویو کے اندر اس ویلیو کو استعمال کیا جا سکتا ہے:

```swift
Text("نام: \(name)")
```

یہی وجہ ہے کہ `SettingItemView` بناتے وقت ہمیں پیرامیٹرز پاس کرنے پڑتے ہیں:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ترتیبات")
```

کیونکہ `SettingItemView` میں تین ایسی پراپرٹیز ہیں جن کی کوئی ڈیفالٹ ویلیو نہیں:

```swift
let icon: String
let color: Color
let title: String
```

اس لیے یہ ویو بناتے وقت انہیں اندر پاس کرنا ضروری ہے۔ پاس کیے گئے پیرامیٹرز کو Swift ویو کے اندر موجود پراپرٹیز کو ویلیو دینے کے لیے استعمال کرے گا۔

## initializer

اب ہم initializer کو مزید سمجھتے ہیں۔

### ڈیفالٹ initializer

جب ہم ایک عام ویو تعریف کرتے ہیں:

```swift
struct ContentView: View {
    var body: some View {
        Text("سلام، دنیا!")
    }
}
```

اس کوڈ میں ہم نے ہاتھ سے initializer نہیں لکھا۔

لیکن جب ہم اس ویو کو استعمال کرتے ہیں تو اسے اس طرح لکھ سکتے ہیں:

```swift
ContentView()
```

یہاں `()` اصل میں `ContentView` بنانے کو ظاہر کرتا ہے، اور اسے اس کا initializer کال کرنا بھی سمجھا جا سکتا ہے۔

### initializer نہیں ہے، پھر بھی کیوں کال کیا جا سکتا ہے؟

کیونکہ Swift کمپائلر ہمارے لیے خود بخود ایک initializer بنا دیتا ہے۔

یہ بات نوٹ کرنے کی ہے کہ **یہ initializer خود بخود بنتا ہے، ہم عام طور پر اسے کوڈ میں براہِ راست نہیں دیکھتے۔**

یعنی اگرچہ ہم نے `struct` میں ہاتھ سے یہ نہیں لکھا:

```swift
init() {

}
```

لیکن Swift کمپائلر پسِ پردہ ہمارے لیے تقریباً اس جیسا initializer بنا دیتا ہے:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("سلام، دنیا!")
    }
}
```

یہی وجہ ہے کہ ہم براہِ راست لکھ سکتے ہیں:

```swift
ContentView()
```

اس لیے حقیقی کوڈ میں ہمیں عموماً initializer ہاتھ سے لکھنے کی ضرورت نہیں ہوتی۔

صرف ایک بات سمجھنا کافی ہے: **SwiftUI ویو بناتے وقت ویو کا initializer کال ہوتا ہے۔ چاہے ہم نے initializer ہاتھ سے نہ لکھا ہو، Swift اسے خود بخود بنا سکتا ہے۔**

### پیرامیٹر والا initializer

اگر ویو میں ایک ایسی پراپرٹی ہے جس کی کوئی ڈیفالٹ ویلیو نہیں، مثلاً:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("نام: \(name)")
    }
}
```

Swift کمپائلر پراپرٹی کے مطابق خود بخود ایک پیرامیٹر والا initializer بناتا ہے۔

اسے آسانی سے اس طرح سمجھا جا سکتا ہے:

```swift
init(name: String) {
    self.name = name
}
```

یہاں:

```swift
init(name: String)
```

اس کا مطلب ہے کہ `ContentView` بناتے وقت `String` قسم کا ایک `name` پیرامیٹر پاس کرنا ضروری ہے۔

جب ہم لکھتے ہیں:

```swift
ContentView(name: "Fang Junyu")
```

اس کا مطلب ہے: `"Fang Junyu"` کو پیرامیٹر کے طور پر initializer کو دینا۔

پھر initializer کے اندر یہ لائن چلے گی:

```swift
self.name = name
```

اس لائن کا مطلب ہے: باہر سے آنے والے `name` کو موجودہ ویو کی اپنی `name` پراپرٹی کو تفویض کرنا۔

اسے آسانی سے اس طرح سمجھا جا سکتا ہے:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("نام: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

اس طرح ویو کے اندر پاس کی گئی ویلیو استعمال کی جا سکتی ہے۔

یہی پیرامیٹر والے ویو کا initialization flow ہے: **جب ویو کی پراپرٹی کے پاس ڈیفالٹ ویلیو نہ ہو تو ویو بناتے وقت متعلقہ پیرامیٹر پاس کرنا ضروری ہوتا ہے، تاکہ initializer پراپرٹی کو ویلیو دے سکے۔**

## جب پراپرٹی کے پاس ڈیفالٹ ویلیو ہو

اگر پراپرٹی کے پاس پہلے سے ڈیفالٹ ویلیو ہو تو ویو بناتے وقت پیرامیٹر پاس نہ بھی کیا جائے تو چلتا ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("نام: \(name)")
    }
}
```

یہاں `name` کے پاس پہلے سے ایک ڈیفالٹ ویلیو ہے:

```swift
"Fang Junyu"
```

اس لیے `ContentView` بناتے وقت براہِ راست لکھا جا سکتا ہے:

```swift
ContentView()
```

اس وقت `name` ڈیفالٹ ویلیو استعمال کرے گا، اور اسکرین دکھائے گی:

```swift
نام: Fang Junyu
```

یقیناً، ویو بناتے وقت ایک نئی ویلیو بھی پاس کی جا سکتی ہے:

```swift
ContentView(name: "Sam")
```

اس وقت ویو باہر سے پاس کیے گئے `"Sam"` کو استعمال کرے گا، ڈیفالٹ ویلیو استعمال نہیں کرے گا، اور اسکرین دکھائے گی:

```swift
نام: Sam
```

سمجھنے میں آسانی کے لیے Swift کمپائلر کے خود بخود بنائے گئے initializer کو سادہ طور پر اس طرح سمجھا جا سکتا ہے:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

یہاں `name: String = "Fang Junyu"` کا مطلب ہے: اگر ویو بناتے وقت `name` پاس نہ کیا جائے تو ڈیفالٹ ویلیو `"Fang Junyu"` استعمال کرو؛ اگر ویو بناتے وقت نیا `name` پاس کیا جائے تو پاس کی گئی ویلیو استعمال کرو۔

یعنی: **اگر باہر سے پیرامیٹر پاس نہ کیا جائے تو پراپرٹی کی ڈیفالٹ ویلیو استعمال ہو گی؛ اگر باہر سے پیرامیٹر پاس کیا جائے تو پاس کی گئی ویلیو استعمال ہو گی۔**

## دوبارہ SettingItemView کی طرف

اب ہم دوبارہ SettingItemView کو دیکھتے ہیں:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

اس ویو کی ساخت مقرر ہے۔

مقرر حصوں میں شامل ہیں:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

مختلف حصوں میں شامل ہیں:

```swift
icon
color
title
```

اس لیے ہم مختلف مواد کو پراپرٹیز بناتے ہیں، اور ویو بناتے وقت انہیں پیرامیٹرز کے ذریعے پاس کرتے ہیں۔

جب ہم مختلف سیٹنگ آئٹمز بناتے ہیں تو صرف مختلف پیرامیٹرز پاس کرنے کی ضرورت ہوتی ہے:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ترتیبات")
SettingItemView(icon: "folder", color: Color.brown, title: "فولڈر")
SettingItemView(icon: "music.note", color: Color.purple, title: "موسیقی")
```

اس طرح ایک ہی `SettingItemView` تین مختلف سیٹنگ آئٹمز دکھا سکتا ہے۔

یہ کسٹم ویو کے استعمال کا سب سے عام طریقہ ہے۔

## خلاصہ

اس سبق میں ہم نے کسٹم ویو سیکھا۔

کسٹم ویو کا بنیادی کام ہے: **بار بار دہرائے جانے والے ویو کوڈ کو بند کرنا، تاکہ اسے دوبارہ استعمال کیا جا سکے۔**

اس مثال میں تینوں سیٹنگ آئٹمز کی ساخت ایک جیسی ہے، صرف آئیکن، رنگ اور عنوان مختلف ہیں۔

اس لیے ہم نے ایک `SettingItemView` بنایا:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

پھر اس ویو کو استعمال کرتے وقت مختلف پیرامیٹرز پاس کیے:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ترتیبات")
```

یہاں کے پیرامیٹرز `SettingItemView` کے اندر داخل ہوں گے۔

اس طریقے سے ہم کم کوڈ کے ساتھ ایک جیسی ساخت مگر مختلف مواد والے ویوز بنا سکتے ہیں۔

یہ SwiftUI ڈویلپمنٹ میں ایک بہت عام تحریری طریقہ بھی ہے۔
