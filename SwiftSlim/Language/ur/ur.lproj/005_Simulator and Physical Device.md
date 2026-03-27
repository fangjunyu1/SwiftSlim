# سمیولیٹر اور حقیقی ڈیوائس

اب تک ہم بنیادی ویو کی تعمیر مکمل کر چکے ہیں۔ اس سبق کا بنیادی موضوع یہ ہے کہ App کو سمیولیٹر اور حقیقی ڈیوائس (Physical Device) پر کیسے چلایا جائے۔

مجھے اب بھی یاد ہے کہ جب میں نے پہلی بار App کو iPhone پر انسٹال کیا تھا، تو میں بہت خوش ہوا تھا، کیونکہ میں اپنی ڈویلپمنٹ کے نتائج کو زیادہ واضح طور پر دیکھ سکتا تھا۔ یہ ایک مثبت فیڈبیک ہوتا ہے۔ جب ہم اپنے بنائے ہوئے App کو خود استعمال کر سکتے ہیں، تو دلچسپی ہمیں مزید علم سیکھنے کی طرف خود بخود لے جاتی ہے۔

اب، براہِ کرم پچھلے سبق میں مکمل کیے گئے اپنے ذاتی ریزیومے کے پروجیکٹ کو کھولیے، اور سمیولیٹر اور حقیقی ڈیوائس پر چلانے کی تیاری کیجیے۔

## سمیولیٹر

Xcode میں کئی طرح کے سمیولیٹر شامل ہوتے ہیں، جن میں مختلف ماڈلز کے iPhone، iPad، اور Apple Watch شامل ہیں۔ سمیولیٹر آپ کو یہ جانچنے میں مدد دیتا ہے کہ مختلف ماڈلز یا سسٹم ورژنز پر App کا لے آؤٹ کیسے نظر آتا ہے۔

### سمیولیٹر منتخب کرنا

Xcode کے اوپر موجود ٹول بار میں ڈیوائس لسٹ سے ایک سمیولیٹر منتخب کریں (مثلاً iPhone 16)۔

![Swift](../../RESOURCE/005_xcode.png)

### سمیولیٹر چلانا

اس کے بعد اوپر بائیں جانب موجود Run بٹن پر کلک کریں۔

![Swift](../../RESOURCE/005_xcode1.png)

Xcode خودکار طور پر پروجیکٹ کو build کرے گا اور سمیولیٹر شروع کرے گا۔

![Swift](../../RESOURCE/005_xcode2.png)

### سمیولیٹر بند کرنا

اگر آپ سمیولیٹر بند کرنا چاہتے ہیں، تو Xcode ٹول بار میں موجود Stop بٹن پر کلک کریں۔

![Swift](../../RESOURCE/005_xcode3.png)

آپ سمیولیٹر کو براہِ راست بھی بند کر سکتے ہیں:

![Swift](../../RESOURCE/005_xcode17.png)

اگر آپ سمیولیٹر کو براہِ راست بند کرتے ہیں، تو Xcode یہ پیغام دکھا سکتا ہے:

```swift
Thread 1: signal SIGTERM
```

یہ عموماً پروگرام کی منطقی خرابی نہیں ہوتی، بلکہ اس وجہ سے ہوتا ہے کہ debug process کو باہر سے terminate کر دیا گیا ہے۔ عام طور پر اسے نظر انداز کیا جا سکتا ہے، اور یہ App کی logic کی خرابی نہیں ہے۔

Xcode Preview کے مقابلے میں، سمیولیٹر حقیقی runtime environment کے زیادہ قریب ہوتا ہے۔ لیکن پھر بھی یہ مکمل حقیقی ڈیوائس ماحول نہیں ہوتا۔ یہ layout verification اور مختلف ڈیوائس ماڈلز کے مطابق testing کے لیے موزوں ہے۔

## ٹیسٹ ماحول کی ترجیح کے بارے میں

حقیقی development workflow میں، testing کی ترتیب یہ ہونی چاہیے:

حقیقی ڈیوائس > سمیولیٹر > Xcode Preview

Preview تیزی سے UI ایڈجسٹ کرنے کے لیے موزوں ہے؛ سمیولیٹر ساختی testing کے لیے موزوں ہے؛ جبکہ آخری تصدیق لازماً حقیقی ڈیوائس پر ہونی چاہیے، خاص طور پر iCloud سے متعلق operations کے لیے۔

## حقیقی ڈیوائس

Xcode Preview اور سمیولیٹر دونوں میں کچھ display inaccuracies ہو سکتی ہیں، اس لیے حقیقی ڈیوائس فیصلہ کن اہمیت رکھتی ہے۔ system permissions، performance، notifications جیسے رویّے صرف حقیقی ڈیوائس پر مکمل طور پر verify کیے جا سکتے ہیں۔

### Developer Mode کھولنا

iPhone میں:

Settings → Privacy & Security → Developer Mode → Turn On

![Swift](../../RESOURCE/005_xcode4.png)

سسٹم ڈیوائس کو زبردستی restart کرے گا۔ اگر Developer Mode فعال نہ ہو تو debugging کے لیے App نہیں چل سکے گا۔

### Developer Team کی ترتیب

Xcode میں Developer Team سیٹ کرنا ضروری ہے، ورنہ App کو sign کرکے انسٹال نہیں کیا جا سکے گا۔

ترتیب کا راستہ:

Project Name → TARGETS → Signing & Capabilities → Team

اگر وہاں "Add Account..." دکھائی دے، تو اس کا مطلب ہے کہ ابھی Apple account شامل نہیں کیا گیا۔

![Swift](../../RESOURCE/005_xcode5.png)

Add بٹن پر کلک کریں، اور Apple ID سے sign in کریں۔

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID سے login کرنے کے بعد، متعلقہ account منتخب کریں اور Developer Team کی configuration مکمل کریں۔

![Swift](../../RESOURCE/005_xcode7.png)

### ڈیوائس کو جوڑنا

iPhone کو ایک cable کے ذریعے Mac سے connect کریں۔

پہلی بار connect کرتے وقت:

* Mac پوچھے گا کہ کیا iPhone کو اس Mac سے connect کرنا ہے
* iPhone پوچھے گا کہ کیا اس کمپیوٹر پر trust کرنا ہے

آپ کو iPhone پر "Trust" پر tap کرنا ہوگا اور lock screen password درج کرنا ہوگا۔ اس کے بعد Xcode کی device list میں اپنا iPhone منتخب کریں۔

![Swift](../../RESOURCE/005_xcode9.png)

اوپر بائیں جانب موجود Run بٹن پر کلک کریں۔

![Swift](../../RESOURCE/005_xcode1.png)

Xcode پروجیکٹ کو build کرے گا اور App کو iPhone پر انسٹال کر دے گا۔

![Swift](../../RESOURCE/005_view.png)

**Wireless Debugging**

iOS 11 اور اس کے بعد کے ورژنز میں، Xcode wireless debugging کو سپورٹ کرتا ہے۔

![Swift](../../RESOURCE/005_xcode18.png)

شرائط:

1. iPhone اور Mac کی پہلی pairing لازماً data cable کے ذریعے ہونی چاہیے
2. iPhone اور Mac ایک ہی Wi-Fi نیٹ ورک پر ہوں
3. دونوں ڈیوائسز unlocked حالت میں ہوں

ایک بار cable کے ذریعے pairing مکمل ہو جائے، تو بعد میں cable ہٹانے کے باوجود، اگر دونوں ایک ہی نیٹ ورک میں ہوں، تو براہِ راست Run کیا جا سکتا ہے۔

نوٹ:

* اگر ڈیوائس device list میں نظر نہ آئے، تو دوبارہ cable لگا کر connect کریں
* Wi-Fi debugging کبھی کبھار غیر مستحکم ہوتی ہے، اگر connection error آئے تو دوبارہ cable لگا دیں
* کمپنی کے نیٹ ورک یا isolated network environment میں یہ محدود ہو سکتی ہے

## عام غلطیاں اور ان کے حل

جب Xcode کے ذریعے iPhone پر debugging کی جاتی ہے، تو مختلف قسم کی error messages سامنے آ سکتی ہیں۔ نیچے چند عام مسائل اور ان کے متعلقہ حل دیے گئے ہیں، تاکہ آپ جلدی سے مسئلہ پہچان کر حل کر سکیں۔

**1. Pairing مکمل نہیں ہوئی**

```swift
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

اس کا مطلب ہے کہ Xcode اور iPhone کے درمیان debugging pairing ابھی مکمل نہیں ہوئی۔

حل: تصدیق کریں کہ iPhone پر "Trust" پر tap کیا جا چکا ہے۔ اگر پھر بھی error آئے، تو Xcode کو restart کرکے دوبارہ connect کریں۔

**2. Developer Team configured نہیں ہے**

```swift
Signing for "SwiftSlimTest" requires a development team.
```

ممکن ہے کہ Developer Team configure نہ کی گئی ہو۔

حل: Signing & Capabilities میں login شدہ account منتخب کریں۔

**3. Developer Disk Image mount نہیں ہو سکی**

```swift
Previous preparation error: The developer disk image could not be mounted on this device.
```

یہ عام طور پر اس وقت ہوتا ہے جب installation کے دوران عمل منقطع ہو جائے (مثلاً cable نکال دینا یا زبردستی روک دینا)، جس کی وجہ سے دوبارہ installation کے وقت پابندی یا error آ جاتی ہے۔

حل: iPhone کو restart کریں، پھر cable دوبارہ لگا کر connect کریں۔

**4. Debug tunnel connection ناکام ہو گئی**

```swift
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

یہ error اکثر VPN یا network proxy کی مداخلت کی وجہ سے آتی ہے۔

حل: VPN یا network proxy بند کریں، پھر دوبارہ کوشش کریں۔

**5. ڈیوائس unlocked نہیں ہے**

```swift
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

ڈیوائس lock screen پر ہے؛ iPhone unlock کر دیں۔

**6. ڈیوائس registered نہیں ہے**

```swift
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

اس کا مطلب ہے کہ یہ ڈیوائس آپ کے developer account کی device list میں شامل نہیں ہے، اس لیے Xcode اس کے لیے قانونی provisioning profile نہیں بنا سکتا اور App انسٹال نہیں کر سکتا۔

حل: "Register Device" پر کلک کریں تاکہ ڈیوائس خودکار طور پر register ہو جائے۔

**7. Deployment version مطابقت نہیں رکھتی**

```swift
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

اس کا مطلب ہے کہ ڈیوائس کا system version پروجیکٹ کے minimum deployment version سے کم ہے۔

تبدیلی کا راستہ:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

version کو اس طرح ایڈجسٹ کریں کہ وہ ڈیوائس کے system version سے زیادہ نہ ہو۔

ترمیم کے بعد، build folder کو clean کریں:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

clean مکمل ہونے کے بعد، دوبارہ Run کریں۔
