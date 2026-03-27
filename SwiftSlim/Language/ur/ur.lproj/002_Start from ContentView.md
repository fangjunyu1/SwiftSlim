# ContentView سے آغاز

## سبق سے پہلے کی تیاری

اس سبق میں، ہم ContentView.swift فائل سے آغاز کریں گے، اور منظم انداز میں SwiftUI کی بنیادی ساخت کو سمجھیں گے، جن میں شامل ہیں:

- تبصرے (Comments)
- View کی ساخت
- VStack / HStack / ZStack لے آؤٹ
- SF Symbols آئیکنز
- ویو موڈیفائرز (modifier)
- پری ویو کوڈ #Preview

سب سے پہلے، پہلے بنایا گیا Xcode پروجیکٹ تلاش کریں، اور .xcodeproj فائل پر ڈبل کلک کریں۔

بائیں جانب Navigator نیویگیشن ایریا میں ContentView.swift فائل منتخب کریں۔

نوٹ: ہر بار پروجیکٹ کھولنے پر، Canvas میں "Preview paused" دکھائی دے سکتا ہے۔ Refresh بٹن پر کلک کرنے سے پری ویو دوبارہ فعال ہو جائے گا۔

![Swift](../../RESOURCE/002_view7.png)

## ContentView کو سمجھنا

ContentView کا کوڈ:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
````

اگرچہ یہ کوڈ کم نظر آتا ہے، لیکن اس میں SwiftUI کی بنیادی ساخت شامل ہے۔

### 1. تبصرے

فائل کے اوپر والا حصہ:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

یہ فائل تبصرہ ہے، جو فائل کی معلومات ریکارڈ کرنے کے لیے استعمال ہوتا ہے، اور اس میں فائل کا نام، پروجیکٹ کا نام، بنانے والے کا نام، اور تخلیق کی تاریخ شامل ہوتی ہے۔

Swift میں // سنگل لائن تبصرہ لکھنے کے لیے استعمال ہوتا ہے:

```swift
// یہ ایک تبصرہ ہے
```

تبصرے کوڈ کی پڑھنے کی صلاحیت بہتر بناتے ہیں، اور ڈویلپرز کو کوڈ کی منطق سمجھنے میں مدد دیتے ہیں۔

حقیقی ترقیاتی کام میں، کوڈ بعض اوقات پیچیدہ اور سمجھنے میں مشکل ہو سکتا ہے۔ اگر تبصرے نہ لکھے جائیں، تو تین دن بعد اپنا ہی کوڈ سمجھنا مشکل ہو سکتا ہے۔

اسی لیے، کوڈ لکھتے وقت خود سے تبصرے شامل کرنا ایک اچھی عادت ہے۔ تبصروں کے ذریعے کوڈ کی منطق ریکارڈ کی جا سکتی ہے، جس سے بعد میں کوڈ کی دیکھ بھال آسان ہو جاتی ہے۔

**عارضی طور پر کوڈ کو غیر فعال کرنا**

تبصرے کو عارضی طور پر کوڈ بند کرنے کے لیے بھی استعمال کیا جا سکتا ہے، تاکہ مسئلے کی جانچ کی جا سکے۔

مثال کے طور پر:

```
A
B
C
```

A، B، C تین کوڈ بلاکس ہیں، جن میں سے ایک میں خرابی ہے۔ ہم عارضی طور پر انہیں تبصرے میں بدل کر مسئلہ تلاش کر سکتے ہیں۔

پہلے A کو تبصرہ کریں:

```
// A
B
C
```

اگر A کو تبصرہ کرنے کے بعد کوڈ درست چلنے لگے، تو اس کا مطلب ہے کہ مسئلہ A میں تھا۔

اگر A کو تبصرہ کرنے کے بعد بھی مسئلہ باقی رہے، تو پھر B کو تبصرہ کریں، اور اسی طرح آگے بڑھیں، یہاں تک کہ مسئلہ تلاش ہو جائے۔

ترقی کے دوران بہت سے مسائل آتے ہیں، اور اکثر ہمیں تبصرے کے ذریعے کوڈ بند کر کے مسئلے کی وجہ تلاش کرنی پڑتی ہے۔ اس سے مسئلہ پیدا کرنے والا کوڈ اور BUG تلاش کرنے میں مدد ملتی ہے۔

Xcode میں، آپ یہ شارٹ کٹ استعمال کر سکتے ہیں:

```
Command ⌘ + /
```

اس سے تبصرہ تیزی سے شامل یا حذف کیا جا سکتا ہے۔

### 2. SwiftUI فریم ورک درآمد کرنا

```swift
import SwiftUI
```

یہ کوڈ SwiftUI فریم ورک کو درآمد کرنے کے لیے استعمال ہوتا ہے۔

SwiftUI میں View، Text، Image، VStack وغیرہ سب اسی فریم ورک سے آتے ہیں۔

اگر SwiftUI فریم ورک درآمد نہ کیا جائے، تو Xcode یہ خرابی دکھائے گا:

```
Cannot find type 'View' in scope
```

اس کا مطلب ہے کہ کمپائلر View ٹائپ کو پہچان نہیں پا رہا۔

### 3. View کی ساخت

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

پہلی بار یہ View ساخت دیکھنے پر یہ اجنبی لگ سکتی ہے، کیونکہ اس میں struct، View، var، body، some جیسے کئی کلیدی الفاظ شامل ہیں۔

ہم نے ابھی یہ کلیدی الفاظ نہیں سیکھے، اس لیے فی الحال صرف اتنا سمجھنا کافی ہے کہ یہ کوڈ ContentView نام کا ایک View بناتا ہے۔

آپ View کو ایک ڈرائنگ بورڈ کے طور پر سمجھ سکتے ہیں، جس پر ہم چیزیں بناتے ہیں، اور SwiftUI وہ آلہ ہے جس سے ہم یہ کام کرتے ہیں۔

مثال کے طور پر:

![Swift](../../RESOURCE/002_view.png)

اوپر کی تصویر میں تین صفحات دکھائے گئے ہیں، اور حقیقت میں وہ تین الگ View ہیں۔

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

جب ہم SwiftUI سے App بناتے ہیں، تو ہر صفحہ دراصل ایک View ہوتا ہے۔

### 4. SwiftUI کوڈ

View کے اندر SwiftUI کوڈ اس طرح دکھایا گیا ہے:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

اس SwiftUI کوڈ کا مطلب ہے کہ یہ ایک عمودی لے آؤٹ ہے، جس میں ایک آئیکن اور ایک متن دکھایا جا رہا ہے۔

![Swift](../../RESOURCE/002_view1.png)

#### VStack لے آؤٹ

```swift
VStack { }  // عمودی لے آؤٹ
```

VStack ایک عمودی لے آؤٹ کنٹینر ہے۔ اس کے اندر موجود ویوز اوپر سے نیچے ترتیب میں لگتے ہیں۔

![Swift](../../RESOURCE/002_view8.png)

SwiftUI میں عام طور پر تین قسم کے لے آؤٹس استعمال ہوتے ہیں:

* VStack —— عمودی ترتیب
* HStack —— افقی ترتیب
* ZStack —— تہہ در تہہ ترتیب (Z-axis)

```swift
HStack { }  // افقی ترتیب
ZStack { }  // تہہ در تہہ ترتیب
```

مختلف لے آؤٹس کی ترتیب کی مثال:

![Swift](../../RESOURCE/002_view2.png)

مثال کے طور پر، HStack کے ذریعے افقی ترتیب:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

آپ دیکھ سکتے ہیں کہ زمین کا آئیکن اور متن افقی طور پر دکھائے جا رہے ہیں۔

![Swift](../../RESOURCE/002_view3.png)

جب ہمیں افقی ترتیب درکار ہو، تو ہم HStack استعمال کرتے ہیں۔ اور جب تہہ در تہہ ترتیب چاہیے ہو، تو ZStack استعمال کرتے ہیں۔

#### Image اور SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

یہ کوڈ ایک زمین کا آئیکن دکھاتا ہے، اور یہ آئیکن Apple کے SF Symbols آئیکن سسٹم سے آتا ہے۔

![Swift](../../RESOURCE/002_view9.png)

اس کوڈ کا مطلب ہے: ایک زمین کا آئیکن دکھانا، بڑے سائز میں، اور رنگ موجودہ accent color کے مطابق ہوگا۔

ہم صرف زمین کا آئیکن ہی نہیں، بلکہ دوسرے آئیکنز بھی دکھا سکتے ہیں۔

مثال کے طور پر، ایک بیگ دکھانا:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**دوسرے آئیکنز کیسے دکھائیں؟**

اس کے لیے ہمیں Apple کی آفیشل سسٹم آئیکن لائبریری SF Symbols استعمال کرنی ہوگی۔

Apple Developer کی آفیشل ویب سائٹ کھولیں، اور [SF Symbols](https://developer.apple.com/sf-symbols/) ڈاؤن لوڈ کریں۔

![Swift](../../RESOURCE/002_sf.png)

SF Symbols ایپ کھولیں۔

![Swift](../../RESOURCE/002_sf1.png)

بائیں جانب علامتوں کی اقسام ہوتی ہیں، اور دائیں جانب متعلقہ آئیکنز دکھائے جاتے ہیں۔

کسی آئیکن پر رائٹ کلک کریں اور "Copy Name" منتخب کریں، اس کا نام وہی اسٹرنگ ہوتا ہے۔

مثال کے طور پر:

```
"globe"
"backpack"
"heart"
```

کاپی کیا گیا آئیکن نام Image(systemName:) کے اندر ڈال دیں، تو مختلف آئیکنز دکھائے جا سکتے ہیں۔

نوٹ: ہر SF Symbols آئیکن کا ایک کم از کم سپورٹڈ سسٹم ورژن ہوتا ہے۔ اگر سسٹم ورژن بہت کم ہو، تو آئیکن دکھائی نہیں دے سکتا۔ اس کی compatibility معلومات SF Symbols ایپ میں دیکھی جا سکتی ہیں۔

#### موڈیفائر

SwiftUI میں modifier ایک ایسا طریقہ ہے جو View کی ظاہری شکل یا رویے کو تبدیل کرنے کے لیے استعمال ہوتا ہے۔

آپ modifier کو کپڑوں کی طرح سمجھ سکتے ہیں۔ مختلف کپڑے پہننے سے ظاہری شکل بھی مختلف ہو جاتی ہے۔

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale اور foregroundStyle، Image View کے modifiers ہیں۔ یہ Image کے بنیادی مواد کو بدلے بغیر اس کی ظاہری شکل کو بدلتے ہیں۔

**1. imageScale**

```swift
.imageScale(.large)
```

یہ SF Symbols آئیکن کا سائز کنٹرول کرتا ہے:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

ہم مختلف آپشنز منتخب کر کے SF Symbols آئیکن کا سائز بدل سکتے ہیں۔

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle سامنے والے رنگ کو کنٹرول کرتا ہے۔

.tint سے مراد موجودہ ماحول کا accent color ہے، جو iOS میں عموماً نیلا ہوتا ہے۔

اگر ہم رنگ کو سرخ کرنا چاہیں:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text ویو

Text ایک متنی ویو ہے، جو اسٹرنگ دکھانے کے لیے استعمال ہوتا ہے۔

```swift
Text("Hello, world!")
```

مثال کے طور پر، میرا نام دکھانا:

```swift
Text("FangJunyu")
```

نوٹ: اسٹرنگ کو لازماً "" ڈبل کوٹس میں لکھا جاتا ہے۔

آپ اپنے نام، فون نمبر، یا کوئی اور متن دکھا کر بھی دیکھ سکتے ہیں۔

#### padding مارجن

SwiftUI میں padding ویو کے مواد اور اس کی سرحد کے درمیان خالی جگہ بڑھانے کے لیے استعمال ہوتا ہے۔ یہ اندرونی مارجن (padding / content inset) کہلاتا ہے۔

```swift
HStack {
    ...
}
.padding()
```

اوپر والا کوڈ HStack ویو میں سسٹم کا default padding شامل کرتا ہے۔

**padding کیا ہے؟**

padding سے مراد "ویو کے مواد اور اس کی سرحد کے درمیان موجود خالی جگہ" ہے۔

نیچے تصویر میں، نیلے رنگ کے HStack پر padding لگانے کے بعد، نیلا حصہ اندر کی طرف سکڑ جاتا ہے، اور دیکھنے میں ایسا لگتا ہے جیسے وہ ایک دائرہ کم ہو گیا ہو۔

![Swift](../../RESOURCE/002_view6.png)

**ڈیفالٹ مارجن**

padding() modifier سسٹم کی تجویز کردہ معیاری spacing استعمال کرتا ہے۔

```swift
.padding()
```

مختلف پلیٹ فارمز اور حالات میں اس کی قدر مختلف ہو سکتی ہے، مثلاً:

* iOS میں عموماً تقریباً 16 pt۔
* macOS یا watchOS میں سسٹم کی standard spacing مختلف ہو سکتی ہے، جو ہر پلیٹ فارم کے ڈیزائن اصولوں پر منحصر ہے۔

**اپنی مرضی کا مارجن**

آپ مخصوص سمتوں میں الگ padding بھی دے سکتے ہیں۔

1. ایک سمت مقرر کرنا

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

سمتوں کی وضاحت:

* .top: اوپری مارجن
* .bottom: نچلا مارجن
* .leading: ابتدائی سمت کا مارجن
* .trailing: آخری سمت کا مارجن

![Swift](../../RESOURCE/002_view12.png)

نوٹ: leading اور trailing زبان کی سمت کے مطابق خودکار طور پر بدل جاتے ہیں۔ مثال کے طور پر عربی جیسی RTL زبان میں یہ خود بخود الٹ جائیں گے۔

2. ایک سے زیادہ سمتیں مقرر کرنا

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

آپ array کے ذریعے ایک ساتھ کئی سمتیں مقرر کر سکتے ہیں۔ array کی تفصیل بعد کے اسباق میں دی جائے گی، یہاں صرف اس طرزِ تحریر کو پہچاننا کافی ہے۔

3. افقی یا عمودی سمت مقرر کرنا

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

یہ درج ذیل کے برابر ہے:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**padding ہٹانا**

اگر آپ کوئی padding نہیں چاہتے، تو .padding(0) استعمال کر سکتے ہیں:

```swift
.padding(0)
```

یا padding modifier کو براہ راست حذف کر سکتے ہیں:

```swift
// .padding()
```

### 6. Preview پری ویو کوڈ

```swift
#Preview {
    ContentView()
}
```

یہ کوڈ Canvas میں ContentView کا preview تیار کرتا ہے۔

نوٹ: #Preview ایک نئی syntax ہے، جو Swift 5.9 / Xcode 15 میں متعارف کرائی گئی۔ اس سے پہلے PreviewProvider structure استعمال ہوتا تھا۔

**اگر Preview کو تبصرہ کر دیا جائے تو کیا ہوگا؟**

اگر Preview کو تبصرہ کر دیا جائے:

```swift
// #Preview {
//    ContentView()
// }
```

تو Canvas میں render ہونے والا کوئی مواد نہیں دکھایا جائے گا۔

![Swift](../../RESOURCE/002_xcode.png)

اس کا مطلب ہے کہ #Preview ہی Canvas میں preview دکھانے کو کنٹرول کرتا ہے۔

جب ہمیں Xcode میں SwiftUI view کا preview دیکھنا ہو، تو #Preview کوڈ شامل کرتے ہیں۔ اگر preview کی ضرورت نہ ہو، تو #Preview کو تبصرہ یا حذف کیا جا سکتا ہے۔

## خلاصہ

اگرچہ ContentView.swift فائل میں کوڈ کم ہے، لیکن حقیقت میں اس میں SwiftUI کے کئی بنیادی تصورات شامل ہیں۔ ابتدائی سیکھنے والوں کے لیے یہ کوڈ اجنبی محسوس ہو سکتا ہے، لیکن اگر اسے حصوں میں توڑا جائے، تو SwiftUI کی ابتدائی سمجھ بننے لگتی ہے۔

اس سبق میں ہم نے پہلے تبصرہ // سیکھا، جسے ہم کوڈ کی وضاحت یا عارضی طور پر کوڈ بند کرنے کے لیے استعمال کر سکتے ہیں۔

پھر ہم نے جانا کہ SwiftUI فائل میں SwiftUI فریم ورک ضرور درآمد کرنا ہوتا ہے:

```swift
import SwiftUI
```

اگر فریم ورک درآمد نہ کیا جائے، تو کمپائلر View جیسی اقسام کو پہچان نہیں سکے گا۔

اس کے بعد، ہم نے SwiftUI view کی بنیادی ساخت دیکھی:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

اس میں ContentView ویو کا نام ہے۔

ہم نے تین عام لے آؤٹ کنٹینرز بھی سیکھے: VStack (عمودی ترتیب)، HStack (افقی ترتیب)، اور ZStack (تہہ در تہہ ترتیب)۔

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

اس کوڈ میں ایک عمودی ترتیب والا کنٹینر دکھایا جا رہا ہے، جس کے اندر ایک آئیکن اور ایک متن موجود ہے۔

Image، SF Symbols آئیکن دکھا سکتا ہے، اور modifiers کے ذریعے آئیکن کا سائز اور رنگ کنٹرول کیا جا سکتا ہے۔

Text ویو متن دکھانے کے لیے استعمال ہوتا ہے۔

padding مارجن ہے، جو ویو کے ارد گرد ایک شفاف خالی جگہ بناتا ہے۔

آخر میں #Preview preview view ہے، جو Canvas میں preview دکھاتا ہے۔

### سبق کے بعد کی مشق

ابتدائی سیکھنے والوں کے لیے اس سبق کا مواد کچھ پیچیدہ محسوس ہو سکتا ہے۔ اس لیے مزید مشق کے ذریعے اس سبق کے تصورات کو بہتر طور پر سمجھا جا سکتا ہے:

* SF Symbols آئیکن کا نام تبدیل کریں
* آئیکن کا foreground color سیاہ کریں
* VStack کو HStack میں بدلیں
* Image یا Text کو تبصرہ کریں، اور preview میں تبدیلی دیکھیں

### اضافی حصہ: کوڈ کمپلیشن (Code Completion)

کوڈ لکھتے وقت، آپ نے شاید غور کیا ہوگا کہ Xcode خودکار طور پر دستیاب آپشنز کی فہرست دکھاتا ہے۔

مثال کے طور پر، جب ہم imageScale modifier کو تبدیل کرتے ہیں:

```swift
.imageScale(.)
```

تو Xcode دستیاب آپشنز دکھا دیتا ہے:

![Swift](../../RESOURCE/002_view10.png)

یہ Code Completion میکانزم کہلاتا ہے۔ یہ type inference اور enum members کی تجاویز کی بنیاد پر کام کرتا ہے، اور لکھنے کی رفتار بڑھاتا ہے اور غلطیاں کم کرتا ہے۔

آنے والے اسباق میں ہم enum کو باقاعدہ طور پر سیکھیں گے، فی الحال یہاں صرف بنیادی تعارف کافی ہے۔
