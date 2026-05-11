# کورس کارڈ

یہ سبق ایک مرحلہ وار ریویو سبق ہے۔ ہم ایک “کورس کارڈ” مکمل کریں گے۔

اس مشق کے ذریعے ہم پہلے سیکھے گئے `Text`، `Image`، `VStack`، `HStack`، `Spacer()`، `.padding()`، `.background()`، `.cornerRadius()` وغیرہ کو دہرا سکتے ہیں، اور یہ بھی سیکھیں گے کہ کئی چھوٹے ویوز کو ملا کر ایک مکمل ویو ماڈیول کیسے بنایا جاتا ہے۔

کورس کارڈ کا اثر:

![view](../../../Resource/026_view.png)

یہ کورس کارڈ بنیادی طور پر چند حصوں پر مشتمل ہے:

- کورس کی سطح: `ابتدائی`
- کورس کا مواد: `20+ اسباق`
- کورس کا عنوان: `SwiftUI ابتدائی ٹیوٹوریل`
- کورس کی تفصیل
- بٹن: `سیکھنا شروع کریں`
- کورس کا پس منظر: Swift آئیکن اور انڈیگو پس منظر

ہم اس ویو کو `ContentView` میں مکمل کر سکتے ہیں۔

## اوپری حصہ

سب سے پہلے، کورس کارڈ کا اوپری حصہ بنائیں۔

![view](../../../Resource/026_view1.png)

اوپری حصے کے بائیں طرف کورس کی سطح دکھائی جاتی ہے، اور دائیں طرف کورس کا مواد دکھایا جاتا ہے۔

کیونکہ یہ دونوں مواد افقی طور پر ترتیب دیے گئے ہیں، اس لیے `HStack` استعمال کیا جا سکتا ہے۔

```swift
var topView: some View {
    HStack {
        Text("ابتدائی")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ اسباق")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

یہاں ہم نے اوپری حصے کو ایک computed property میں الگ کیا ہے:

```swift
var topView: some View
```

اس کا فائدہ یہ ہے کہ `body` زیادہ واضح رہتا ہے۔

اوپری حصے میں بنیادی طور پر یہ چیزیں استعمال ہوئیں:

- `HStack`: دو متون کو افقی طور پر ترتیب دیتا ہے۔
- `Text`: متن دکھاتا ہے۔
- `Spacer()`: بائیں متن کو بائیں طرف اور دائیں متن کو دائیں طرف دھکیلتا ہے۔
- `.font(.footnote)`: نسبتاً چھوٹا ٹیکسٹ اسٹائل مقرر کرتا ہے۔
- `.fontWeight(.bold)`: متن کو بولڈ کرتا ہے۔
- `.foregroundStyle(Color.white)`: foreground رنگ سفید مقرر کرتا ہے۔
- `.padding(.vertical, 10)`: اوپر اور نیچے کی اندرونی جگہ مقرر کرتا ہے۔
- `.padding(.horizontal, 16)`: بائیں اور دائیں کی اندرونی جگہ مقرر کرتا ہے۔
- `.background(Color.white.opacity(0.15))`: نیم شفاف سفید پس منظر مقرر کرتا ہے۔
- `.cornerRadius(20)`: گول کنارے مقرر کرتا ہے۔

یہاں `ابتدائی` نے دو سمتوں کی `.padding()` استعمال کی ہے:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

اس سے متن کے اوپر نیچے اور بائیں دائیں جگہ بنتی ہے، اور یہ ایک لیبل جیسا دکھائی دیتا ہے۔

`Color.white.opacity(0.15)` کا مطلب ہے `15%` opacity والا سفید رنگ، یعنی بہت ہلکا سفید۔

### کارڈ کا پس منظر شامل کرنا

پچھلے حصے میں ہم نے `topView` بنایا، لیکن صرف ویو بنانے سے وہ خود بخود ظاہر نہیں ہوتا۔

SwiftUI میں، جو مواد واقعی انٹرفیس پر ظاہر ہوتا ہے، اسے `body` میں لکھنا ضروری ہے۔

لہٰذا، پہلے `topView` کو `body` میں رکھ کر دکھایا جا سکتا ہے:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

اس وقت آپ دیکھیں گے کہ اوپری حصہ ظاہر ہو چکا ہے:

![view](../../../Resource/026_view2.png)

لیکن چونکہ `topView` میں متن سفید ہے، اور default پس منظر بھی ہلکا ہے، اس لیے light mode میں اسے دیکھنا آسان نہیں ہو سکتا۔

اس لیے ہم بیرونی حصے میں ایک `VStack` شامل کر سکتے ہیں، پھر پورے علاقے کے لیے اندرونی جگہ، پس منظر کا رنگ اور گول کنارے مقرر کر سکتے ہیں:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view3.png)

یہاں `VStack` میں فی الحال صرف ایک `topView` رکھا گیا ہے، اس لیے یہ ضروری محسوس نہیں ہوتا۔

لیکن بعد میں ہم کورس کا عنوان، کورس کی تفصیل اور بٹن کا حصہ بھی شامل کریں گے۔ یہ سب عمودی طور پر ترتیب پانے والا مواد ہے، اس لیے یہاں پہلے سے `VStack` استعمال کرنا بعد میں ویوز کو جوڑنے کے لیے آسان ہے۔

یہاں دو `.padding()` ہیں، اور ان کے کام مختلف ہیں۔

پہلا `.padding(20)`، `.background()` سے پہلے لکھا گیا ہے:

```swift
.padding(20)
.background(Color.indigo)
```

یہ کارڈ کے اندرونی margin کو کنٹرول کرتا ہے، یعنی مواد اور پس منظر کے کنارے کے درمیان کا فاصلہ۔

دوسرا `.padding(30)`، `.background()` کے بعد لکھا گیا ہے:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

یہ کارڈ کے بیرونی margin کو کنٹرول کرتا ہے، یعنی پورے کارڈ اور اسکرین کے کنارے کے درمیان کا فاصلہ۔

![view](../../../Resource/026_view4.png)

اس لیے، ایک ہی `.padding()` مختلف جگہوں پر لکھنے سے اس کا اثر بھی مختلف ہو جاتا ہے۔

## مواد کا حصہ

اس کے بعد کورس کارڈ کا مواد والا حصہ بنائیں۔

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view5.png)

مواد کے حصے میں کورس کا عنوان اور کورس کی تفصیل شامل ہیں۔ یہ دونوں اوپر نیچے ترتیب پاتے ہیں، اس لیے `VStack` استعمال کیا جاتا ہے۔

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI ابتدائی ٹیوٹوریل")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("SwiftUI کے ساتھ صفر سے شروع کریں، اور Apple کی declarative UI development کو منظم طریقے سے سیکھیں۔ واضح وضاحتوں اور عملی مثالوں کے ذریعے، آپ آہستہ آہستہ layout، interaction، اور state management پر عبور حاصل کریں گے، تاکہ خوبصورت اور مفید app interfaces بنا سکیں۔")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view6.png)

یہاں `VStack` میں دو parameters استعمال ہوئے ہیں:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` کا مطلب ہے کہ `VStack` کے اندر موجود ویوز کو بائیں طرف align کیا جائے۔

`spacing: 10` کا مطلب ہے کہ `VStack` کے اندر موجود ویوز کے درمیان `10 pt` کا فاصلہ رکھا جائے۔

اس لیے، کورس کا عنوان اور کورس کی تفصیل بائیں طرف سے ترتیب پائیں گے، اور ان کے درمیان ایک مناسب فاصلہ رہے گا۔

کورس کی تفصیل نسبتاً لمبی ہے۔ اگر اسے پورا دکھایا جائے تو کارڈ بہت اونچا ہو جائے گا، اس لیے یہاں `.lineLimit()` سے ظاہر ہونے والی لائنوں کی تعداد محدود کی گئی ہے:

```swift
.lineLimit(3)
```

اس کا مطلب ہے کہ زیادہ سے زیادہ `3` لائنیں دکھائی جائیں گی۔ جب مواد اس حد سے زیادہ ہو جائے تو اضافی حصہ مختصر کر دیا جائے گا۔

### ویو کو بائیں طرف align کرنا

یہاں ایک بات اور بھی نوٹ کرنی چاہیے۔

`VStack(alignment: .leading)` صرف `VStack` کے اندر موجود ویوز کی alignment کو کنٹرول کرتا ہے۔ یہ خود `VStack` کی بیرونی container میں position کو براہ راست کنٹرول نہیں کرتا۔

مثال کے طور پر، اگر کورس کی تفصیل نسبتاً چھوٹی ہو:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI ابتدائی ٹیوٹوریل")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("کچھ مختصر مواد۔")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view7.png)

آپ دیکھ سکتے ہیں کہ کورس کا عنوان اور کورس کی تفصیل اگرچہ `VStack` کے اندر بائیں طرف align ہیں، لیکن پورا `VStack` کارڈ کے بالکل بائیں کنارے تک نہیں پہنچا۔

اس کی وجہ یہ ہے کہ جب مواد چھوٹا ہوتا ہے، تو `VStack` کی چوڑائی بھی نسبتاً کم ہو جاتی ہے۔ بیرونی container layout بناتے وقت اس کم چوڑائی والے `VStack` کو درمیان میں رکھ سکتا ہے۔

اسے یوں سمجھا جا سکتا ہے: `VStack(alignment: .leading)` اندرونی بائیں alignment کا ذمہ دار ہے۔
لیکن یہ پورے مواد کے علاقے کو سب سے بائیں طرف دھکیلنے کا ذمہ دار نہیں ہے۔

اگر آپ چاہتے ہیں کہ پورا مواد والا حصہ واقعی بائیں طرف رہے، تو باہر ایک اور `HStack` wrap کیا جا سکتا ہے، اور `Spacer()` شامل کیا جا سکتا ہے:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI ابتدائی ٹیوٹوریل")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("کچھ مختصر مواد۔")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view8.png)

یہاں `HStack` ایک افقی layout ہے۔

`Spacer()` دائیں طرف کی باقی جگہ لے لیتا ہے، اور اس طرح بائیں طرف کے `VStack` کو سب سے بائیں طرف دھکیل دیتا ہے۔

لہٰذا، `HStack + Spacer()` پورے مواد والے حصے کی position کنٹرول کرنے کے لیے استعمال کیا جا سکتا ہے۔

حقیقی کورس کارڈ میں، کورس کی تفصیل نسبتاً لمبی ہوتی ہے اور عموماً زیادہ چوڑائی گھیرتی ہے، اس لیے یہ مسئلہ واضح نہ بھی ہو۔ لیکن اس فرق کو سمجھنا اہم ہے، کیونکہ بعد میں مختصر متن کا layout بناتے وقت ایسے حالات اکثر آتے ہیں۔

### اندرونی ویوز کے درمیان فاصلہ کنٹرول کرنا

پچھلے حصے میں ہم نے `VStack` میں `spacing: 10` لکھا تھا:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` اندرونی ویوز کے درمیان فاصلے کو کنٹرول کرتا ہے۔

اگر `spacing` مقرر نہ کیا جائے، تو `VStack` میں default فاصلہ بھی ہوتا ہے، لیکن default فاصلہ ہمیشہ مطلوبہ اثر کے مطابق نہیں ہوتا۔

یہاں، کورس کے عنوان اور کورس کی تفصیل کے درمیان فاصلہ بہت کم ہو تو layout بھیڑ بھاڑ محسوس ہوتا ہے، اس لیے استعمال کیا گیا:

```swift
spacing: 10
```

اس سے ان کے درمیان تھوڑی جگہ باقی رہتی ہے۔

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view9.png)

اسی طرح، اوپری حصہ اور مواد والا حصہ بھی عمودی طور پر ترتیب پاتے ہیں، اس لیے ان کے درمیان فاصلے کو بھی `spacing` سے کنٹرول کیا جا سکتا ہے۔

اب `topView` اور `contentView` کو `body` میں رکھیں:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view10.png)

یہاں `VStack(spacing: 20)`، `topView` اور `contentView` کے درمیان فاصلے کو کنٹرول کرتا ہے۔

یعنی:

```swift
VStack(alignment: .leading, spacing: 10)
```

کورس کے عنوان اور کورس کی تفصیل کے درمیان فاصلے کو کنٹرول کرتا ہے۔

```swift
VStack(spacing: 20)
```

اوپری حصے اور مواد والے حصے کے درمیان فاصلے کو کنٹرول کرتا ہے۔

دونوں `spacing` ہیں، لیکن مختلف `VStack` پر اثر انداز ہوتے ہیں، اس لیے ان کا دائرہ اثر بھی مختلف ہے۔

اس طرح، مواد والے حصے کا ویو مکمل ہو گیا۔

## بٹن کا حصہ

اس کے بعد نیچے والا بٹن حصہ بنائیں۔

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view11.png)

بٹن کا حصہ بنیادی طور پر ایک play آئیکن اور ایک متن سے بنتا ہے۔

ہم `Image` سے play آئیکن دکھا سکتے ہیں، اور `Text` سے بٹن کا متن دکھا سکتے ہیں۔

یہاں پہلے ایک بٹن کی ظاہری شکل بنائیں:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("بٹن پر کلک ہوا")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("سیکھنا شروع کریں")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view12.png)

یہاں دو `HStack` استعمال ہوئے ہیں:

اندر والا `HStack` آئیکن اور متن کو افقی طور پر ترتیب دینے کے لیے استعمال ہوتا ہے:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("سیکھنا شروع کریں")
}
```

باہر والا `HStack`، `Spacer()` کے ساتھ مل کر، بٹن کی ظاہری شکل کو بائیں طرف دکھانے کے لیے استعمال ہوتا ہے:

```swift
HStack {
    ...
    Spacer()
}
```

جب بٹن پر کلک کیا جائے گا، تو console میں `بٹن پر کلک ہوا` output ہو گا۔

## بنیادی کارڈ مکمل

اب اوپری حصہ، مواد والا حصہ اور بٹن والا حصہ جوڑ دیں:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

دکھائی دینے والا نتیجہ:

![view](../../../Resource/026_view13.png)

یہاں تک، ایک بنیادی کورس کارڈ مکمل ہو چکا ہے۔

## Swift آئیکن پس منظر

آخر میں، ہم کارڈ کے لیے ایک نیم شفاف Swift آئیکن پس منظر شامل کریں گے۔

![view](../../../Resource/026_view.png)

پہلے ہم `Color.indigo` کو پس منظر کے رنگ کے طور پر استعمال کر چکے ہیں۔ اصل میں، `.background()` رنگ کے علاوہ ایک مکمل ویو بھی شامل کر سکتا ہے۔

اس لیے، ہم پہلے ایک الگ پس منظر ویو بنا سکتے ہیں:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

اس پس منظر ویو میں ہم نے `VStack`، `HStack` اور `Spacer()` استعمال کیے، تاکہ Swift آئیکن کو نیچے دائیں کونے میں دھکیلا جا سکے۔

کیونکہ Swift آئیکن صرف decorative background کے طور پر ہے، اس لیے یہاں نیم شفاف سفید استعمال کیا گیا ہے:

```swift
Color.white.opacity(0.15)
```

اس طرح آئیکن بہت زیادہ نمایاں نہیں ہو گا، اور سامنے والے متن کو متاثر نہیں کرے گا۔

اس کے بعد، `backgroundView` کو کارڈ میں شامل کریں:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

حاصل ہونے والا نتیجہ:

![view](../../../Resource/026_view14.png)

یہاں مسلسل دو `.background()` استعمال ہوئے ہیں:

```swift
.background(backgroundView)
.background(Color.indigo)
```

پہلا `.background()` Swift آئیکن پس منظر شامل کرنے کے لیے استعمال ہوتا ہے۔
دوسرا `.background()` انڈیگو پس منظر شامل کرنے کے لیے استعمال ہوتا ہے۔

اس طرح، Swift آئیکن انڈیگو پس منظر کے اوپر ظاہر ہو گا، اور کارڈ کے پس منظر کے ایک حصے کے طور پر دکھائی دے گا۔

یہاں سے دیکھا جا سکتا ہے کہ `.background()` رنگ شامل کرنے کے علاوہ custom view بھی شامل کر سکتا ہے۔ متعدد `.background()` کو ایک ساتھ استعمال کر کے زیادہ بھرپور پس منظر اثرات بھی بنائے جا سکتے ہیں۔

یہاں تک، ایک مکمل کورس کارڈ بن چکا ہے۔

## خلاصہ

اس سبق میں ہم نے ایک کورس کارڈ کے ذریعے SwiftUI میں عام بنیادی layout طریقوں کو دہرایا۔

ہم نے `Text` سے متن دکھایا، `Image` سے system icon دکھایا، اور `VStack`، `HStack` اور `Spacer()` سے ویوز کی ترتیب کنٹرول کی۔

ہم نے `.lineLimit()` سیکھا۔ یہ متن کی زیادہ سے زیادہ دکھائی جانے والی لائنوں کو محدود کر سکتا ہے۔ جب مواد حد سے زیادہ ہو جائے، تو اضافی حصہ مختصر کر دیا جاتا ہے۔

ساتھ ہی، ہم نے `.padding()`، `.background()`، `.cornerRadius()`، `.foregroundStyle()` وغیرہ جیسے عام modifiers بھی دہرائے۔

یہ سبق مکمل کرنے کے بعد، ہم کئی چھوٹے ویوز کو ایک مکمل کارڈ ماڈیول میں جوڑ سکتے ہیں۔

یہ SwiftUI development میں ایک بہت عام سوچ بھی ہے: پہلے چھوٹے ویوز میں تقسیم کریں، پھر انہیں ملا کر مکمل interface بنائیں۔

## مکمل کوڈ

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("ابتدائی")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ اسباق")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI ابتدائی ٹیوٹوریل")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("SwiftUI کے ساتھ صفر سے شروع کریں، اور Apple کی declarative UI development کو منظم طریقے سے سیکھیں۔ واضح وضاحتوں اور عملی مثالوں کے ذریعے، آپ آہستہ آہستہ layout، interaction، اور state management پر عبور حاصل کریں گے، تاکہ خوبصورت اور مفید app interfaces بنا سکیں۔")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("بٹن پر کلک ہوا")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("سیکھنا شروع کریں")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
