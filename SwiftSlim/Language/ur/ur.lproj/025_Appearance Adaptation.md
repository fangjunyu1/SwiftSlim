# ظاہری انداز کی موافقت

اس سبق میں، ہم لائٹ موڈ اور ڈارک موڈ کے لیے ظاہری انداز کی موافقت سیکھیں گے۔

iPhone، iPad اور Mac پر، صارف لائٹ موڈ بھی منتخب کر سکتے ہیں اور ڈارک موڈ بھی۔

جب سسٹم ڈارک موڈ میں تبدیل ہوتا ہے، تو بہت سی Apps کے پس منظر، متن اور آئیکن کے رنگ بھی ساتھ تبدیل ہو جاتے ہیں۔

مثال کے طور پر، دن کے وقت انٹرفیس کا پس منظر ہلکا ہو سکتا ہے، اور رات کے وقت وہ گہرے پس منظر میں بدل سکتا ہے۔

![view](../../../Resource/025_view9.png)

سسٹم کے ظاہری انداز کے مطابق انٹرفیس کو خودکار طور پر ایڈجسٹ کرنے کی اس صلاحیت کو ظاہری انداز کی موافقت کہتے ہیں۔

## Xcode میں ظاہری انداز کی موافقت کا پیش منظر

ظاہری انداز کی موافقت سیکھنے سے پہلے، ہم پہلے یہ سمجھتے ہیں کہ Xcode میں لائٹ موڈ اور ڈارک موڈ کا پیش منظر کیسے دیکھا جائے۔

`Canvas` علاقے کے نیچے، `Device Settings` بٹن پر کلک کریں، اس سے `Canvas Device Settings` پاپ اپ کھل جائے گا۔

![canvas](../../../Resource/025_view.png)

پاپ اپ میں آپ `Color Scheme` کی ترتیب دیکھ سکتے ہیں۔

![canvas1](../../../Resource/025_view1.png)

اس میں:

- `Light Appearance` کا مطلب لائٹ موڈ ہے۔
- `Dark Appearance` کا مطلب ڈارک موڈ ہے۔

ہم یہاں سے پیش منظر کا ظاہری انداز تبدیل کر کے دیکھ سکتے ہیں کہ موجودہ انٹرفیس لائٹ موڈ اور ڈارک موڈ میں کیسا دکھائی دیتا ہے۔

## دونوں ظاہری انداز ساتھ ساتھ دکھانا

اگر آپ لائٹ موڈ اور ڈارک موڈ کو ایک ساتھ دیکھنا چاہتے ہیں، تو `Variants` فیچر استعمال کر سکتے ہیں۔

`Canvas` علاقے کے نیچے، `Variants` بٹن پر کلک کریں، پھر `Color Scheme Variants` منتخب کریں۔

![canvas2](../../../Resource/025_view2.png)

منتخب کرنے کے بعد، `Canvas` لائٹ موڈ اور ڈارک موڈ کے پیش منظر ایک ساتھ دکھائے گا۔

![canvas3](../../../Resource/025_view3.png)

اس طرح دونوں ظاہری انداز میں انٹرفیس کے فرق کا موازنہ زیادہ آسان ہو جاتا ہے۔

سادہ الفاظ میں:

اگر صرف عارضی طور پر لائٹ/ڈارک موڈ بدلنا ہو، تو `Canvas Device Settings` استعمال کیا جا سکتا ہے۔

اگر دونوں ظاہری انداز ایک ساتھ دیکھنے ہوں، تو `Color Scheme Variants` استعمال کیا جا سکتا ہے۔

## View پہلے سے ظاہری انداز کے مطابق ڈھل جاتا ہے

SwiftUI میں، بہت سے سسٹم views پہلے سے لائٹ موڈ اور ڈارک موڈ کے مطابق خودکار طور پر ڈھل جاتے ہیں۔

مثال کے طور پر:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("روشن")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("کچھ کچھ کچھ")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

نمایش کا اثر:

![canvas](../../../Resource/025_view4.png)

آپ دیکھ سکتے ہیں کہ لائٹ موڈ میں آئیکن اور عنوان عموماً گہرے رنگ میں دکھائی دیتے ہیں۔

ڈارک موڈ میں آئیکن اور عنوان خودکار طور پر ہلکے رنگ میں بدل جاتے ہیں۔

اس کی وجہ یہ ہے کہ `Text`، `Image` جیسے SwiftUI views پہلے سے سسٹم کے ظاہری انداز کے مطابق رنگ ایڈجسٹ کرتے ہیں۔

یعنی اگر ہم دستی طور پر کوئی فکسڈ رنگ مقرر نہ کریں، تو SwiftUI ظاہری انداز کی موافقت کا ایک حصہ ہمارے لیے سنبھال لیتا ہے۔

## فکسڈ رنگ خودکار طور پر تبدیل نہیں ہوتے

یہ بات نوٹ کرنا ضروری ہے کہ اگر ہم دستی طور پر کوئی فکسڈ رنگ مقرر کر دیں، تو وہ لائٹ/ڈارک موڈ کے مطابق خودکار طور پر نہیں بدلے گا۔

مثال کے طور پر:

```swift
Text("کچھ کچھ کچھ")
	.foregroundStyle(Color.gray)
```

یہاں متن کو `Color.gray` مقرر کیا گیا ہے، اس لیے یہ ہمیشہ سرمئی رنگ میں دکھائی دے گا۔

ایک اور مثال:

```swift
Text("عنوان")
    .foregroundStyle(Color.white)
```

یہ کوڈ لائٹ موڈ ہو یا ڈارک موڈ، دونوں میں سفید متن دکھائے گا۔

اگر پس منظر بھی ہلکا ہو، تو سفید متن واضح طور پر نظر نہیں آ سکتا۔

اس لیے ظاہری انداز کی موافقت کرتے وقت، `Color.white`، `Color.black` جیسے فکسڈ رنگ بے احتیاطی سے لکھنے سے بچنا چاہیے۔

بہت سے حالات میں، پہلے سسٹم semantic styles استعمال کیے جا سکتے ہیں، مثلاً:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

اس میں:

- `.primary` عموماً مرکزی مواد کے لیے استعمال ہوتا ہے۔
- `.secondary` عموماً ثانوی مواد کے لیے استعمال ہوتا ہے۔

یہ لائٹ/ڈارک موڈ کے مطابق نمایش کا اثر خودکار طور پر ایڈجسٹ کرتے ہیں۔

## ظاہری انداز کے مطابق مختلف مواد دکھانا

کبھی کبھی ہم صرف رنگ کی تبدیلی نہیں چاہتے، بلکہ مختلف ظاہری انداز میں مختلف مواد بھی دکھانا چاہتے ہیں۔

مثال کے طور پر:

- لائٹ موڈ میں عام بلب آئیکن دکھایا جائے۔
- ڈارک موڈ میں روشن بلب آئیکن دکھایا جائے۔
- لائٹ موڈ میں عنوان `Light` دکھایا جائے۔
- ڈارک موڈ میں عنوان `Dark` دکھایا جائے۔

اس وقت ہمیں یہ طے کرنا ہوتا ہے کہ موجودہ سسٹم لائٹ موڈ میں ہے یا ڈارک موڈ میں۔

SwiftUI میں، موجودہ ظاہری انداز `colorScheme` environment value کے ذریعے حاصل کیا جا سکتا ہے:

```swift
@Environment(\.colorScheme) private var colorScheme
```

مکمل کوڈ:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "روشن" : "تاریک"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("کچھ کچھ کچھ")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

نمایش کا اثر:

![view](../../../Resource/025_view5.png)

پیش منظر کے اثر سے دیکھا جا سکتا ہے کہ ایک ہی view مختلف ظاہری انداز میں بالکل ایک جیسا مواد نہیں دکھاتا۔

لائٹ موڈ میں، `Image` عام بلب آئیکن دکھاتا ہے، اور عنوان `Light` ہوتا ہے۔

ڈارک موڈ میں، `Image` روشن بلب آئیکن دکھاتا ہے، اور عنوان `Dark` ہوتا ہے۔

یعنی یہاں تبدیلی صرف رنگ کی نہیں، بلکہ آئیکن کے نام اور عنوان کے متن میں بھی تبدیلی ہوئی ہے۔

اس کی وجہ یہ ہے کہ ہم نے آئیکن اور عنوان کو براہ راست `body` میں فکسڈ نہیں لکھا، بلکہ `colorScheme` کے مطابق مختلف مواد calculate کیا۔

اس کوڈ میں، ہم نے دو computed properties استعمال کی ہیں:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "روشن" : "تاریک"
}
```

جب `colorScheme` `.light` ہو، تو اس کا مطلب ہے کہ موجودہ موڈ لائٹ موڈ ہے۔

جب `colorScheme` `.dark` ہو، تو اس کا مطلب ہے کہ موجودہ موڈ ڈارک موڈ ہے۔

اس لیے ہم مختلف ظاہری انداز کے مطابق مختلف آئیکن نام اور عنوان متن واپس کر سکتے ہیں۔

یہ computed property کا ایک عام استعمال بھی ہے: موجودہ state کے مطابق view کو دکھانے کے لیے مطلوبہ مواد calculate کرنا۔

## @Environment کو سمجھنا

یہ پہلی بار ہے کہ ہم `@Environment` سے آشنا ہو رہے ہیں۔

`@Environment` کو اس طرح سمجھا جا سکتا ہے: SwiftUI کے environment سے کوئی value پڑھنا۔

App چلتے وقت، سسٹم بہت سی environment معلومات فراہم کرتا ہے، مثلاً:

- موجودہ زبان
- موجودہ ظاہری انداز
- موجودہ layout direction
- موجودہ font size setting

جب ہمیں موجودہ ظاہری انداز حاصل کرنا ہو، تو ہم `colorScheme` پڑھ سکتے ہیں:

```swift
@Environment(\.colorScheme) private var colorScheme
```

اس میں

```swift
\.colorScheme
```

کا مطلب environment سے `colorScheme` value پڑھنا ہے۔

```swift
private var colorScheme
```

کا مطلب پڑھی ہوئی value کو `colorScheme` variable میں محفوظ کرنا ہے۔

variable کا نام آپ خود طے کر سکتے ہیں، مثلاً اسے یوں بھی لکھا جا سکتا ہے:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

جب تک سامنے والا `\.colorScheme` تبدیل نہ ہو، اس کا مطلب یہی ہے کہ موجودہ ظاہری انداز پڑھا جا رہا ہے۔

## colorScheme کی دو عام values

`colorScheme` کی عام طور پر دو values ہوتی ہیں:

```swift
.light
.dark
```

ان کا مطلب ہے:

- `.light`: لائٹ موڈ
- `.dark`: ڈارک موڈ

مثال کے طور پر:

```swift
private var titleName: String {
    colorScheme == .light ? "روشن" : "تاریک"
}
```

اس کوڈ کا مطلب ہے:

اگر موجودہ موڈ لائٹ موڈ ہے، تو `colorScheme == .light` درست ہو گا، اور `"Light"` واپس ہو گا۔

ورنہ، `"Dark"` واپس ہو گا۔

اس لیے، لائٹ موڈ میں:

```swift
Text(titleName)
```

جو دکھایا جاتا ہے وہ ہے:

```swift
روشن
```

ڈارک موڈ میں، دکھایا جاتا ہے:

```swift
تاریک
```

اس طریقے سے، ہم مختلف ظاہری انداز کے مطابق مختلف مواد دکھا سکتے ہیں۔

## رنگ کی موافقت کی مثال

متن اور آئیکن کے علاوہ، کبھی کبھی ہمیں رنگ کی موافقت خود بھی سنبھالنی پڑتی ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("متن")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

نمایش کا اثر:

![view](../../../Resource/025_view6.png)

اس کوڈ میں، متن سفید ہے اور پس منظر سیاہ ہے۔

لائٹ موڈ میں، سیاہ پس منظر کافی واضح ہوتا ہے۔

لیکن ڈارک موڈ میں، اگر پورے انٹرفیس کا پس منظر بھی سیاہ ہو، تو یہ سیاہ پس منظر سسٹم پس منظر میں مل جائے گا اور کافی واضح نہیں لگے گا۔

اس وقت، ہم ظاہری انداز کے مطابق متن کا رنگ اور پس منظر کا رنگ تبدیل کر سکتے ہیں:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("متن")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

نمایش کا اثر:

![view](../../../Resource/025_view7.png)

اب لائٹ موڈ میں سیاہ پس منظر اور سفید متن ہے۔

ڈارک موڈ میں سفید پس منظر اور سیاہ متن ہے۔

اس طرح کسی بھی ظاہری انداز میں، متن اور پس منظر کے درمیان واضح contrast رہتا ہے، اور صارف مواد صاف دیکھ سکتا ہے۔

## Assets استعمال کر کے رنگ کی موافقت

`colorScheme` سے دستی طور پر طے کرنے کے علاوہ، ہم `Assets` resource colors بھی استعمال کر سکتے ہیں تاکہ لائٹ/ڈارک موڈ کے مطابق رنگ ڈھل جائیں۔

یہ طریقہ App میں عمومی طور پر استعمال ہونے والے رنگوں کو manage کرنے کے لیے زیادہ مناسب ہے۔

Xcode project میں، `Assets` resource folder تلاش کریں۔

![assets](../../../Resource/025_color.png)

`Assets` folder کھولیں، خالی جگہ پر right-click کریں، `New Color Set` منتخب کریں، اور ایک نیا color resource بنائیں۔

![assets](../../../Resource/025_color1.png)

یہاں ہم ایک color بناتے ہیں اور اس کا نام `redText` رکھتے ہیں۔

![assets](../../../Resource/025_color2.png)

Color resource میں لائٹ موڈ اور ڈارک موڈ کے لیے الگ الگ رنگ مقرر کیے جا سکتے ہیں۔

![assets](../../../Resource/025_color3.png)

متعلقہ رنگ والا علاقہ منتخب کرنے کے بعد، دائیں طرف Attributes inspector میں رنگ تبدیل کیا جا سکتا ہے۔

اوپر دائیں کونے میں `Hide or show the Inspectors` بٹن پر کلک کریں، inspector area کھولیں۔

پھر `Show the Attributes inspector` منتخب کریں، نیچے `Show Color Panel` تلاش کریں، اور color panel کھولیں۔

![assets](../../../Resource/025_color4.png)

Color panel میں موجود رنگ پر کلک کرنے سے `redText` کے متعلقہ color area میں تبدیلی ساتھ ساتھ ہو جاتی ہے۔

یہاں ہم `redText` کو یوں set کرتے ہیں:

- لائٹ موڈ میں سرخ رنگ دکھائے
- ڈارک موڈ میں سبز رنگ دکھائے

![assets](../../../Resource/025_color5.png)

SwiftUI code میں واپس آ کر، اس رنگ کو اس طرح استعمال کیا جا سکتا ہے:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

اس میں:

```swift
Color("redText")
```

کا مطلب `Assets` سے `redText` نام کا color resource پڑھنا ہے۔

نمایش کا اثر:

![assets](../../../Resource/025_view8.png)

آپ دیکھ سکتے ہیں کہ ایک ہی `Color("redText")` لائٹ موڈ اور ڈارک موڈ میں مختلف رنگ دکھاتا ہے۔

اس سے معلوم ہوتا ہے کہ `Assets` colors خود بھی ظاہری انداز کی موافقت کو support کرتے ہیں۔

## colorScheme اور Assets کا فرق

`colorScheme` اور `Assets` دونوں ظاہری انداز کی موافقت کر سکتے ہیں، لیکن ان کے مناسب استعمال کے scenarios مختلف ہیں۔

اگر صرف لائٹ/ڈارک موڈ کے مطابق متن، image name یا `SF Symbols` name تبدیل کرنا ہو، تو `colorScheme` استعمال کیا جا سکتا ہے۔

مثال کے طور پر:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

اگر App میں اکثر استعمال ہونے والے رنگ ہوں، مثلاً theme color، card background color، text color، تو `Assets` colors زیادہ تجویز کیے جاتے ہیں۔

کیونکہ `Assets` colors کو متعدد views میں reuse کیا جا سکتا ہے، اور بعد میں تبدیلی بھی زیادہ آسان ہوتی ہے۔

مثال کے طور پر:

```swift
Color("redText")
```

اس طرح صرف `Assets` میں رنگ بدلنا کافی ہوتا ہے، اور جہاں جہاں یہ رنگ استعمال ہو رہا ہو، وہ سب جگہ ساتھ بدل جاتے ہیں۔

## خلاصہ

اس سبق میں، ہم نے لائٹ موڈ اور ڈارک موڈ کے لیے ظاہری انداز کی موافقت سیکھی۔

سب سے پہلے، ہم نے سیکھا کہ Xcode کے `Canvas` میں مختلف ظاہری انداز کا پیش منظر کیسے دیکھا جاتا ہے، اور `Color Scheme Variants` استعمال کر کے لائٹ موڈ اور ڈارک موڈ کو ایک ساتھ کیسے دیکھا جاتا ہے۔

پھر ہم نے سمجھا کہ SwiftUI میں `Text`، `Image` جیسے views پہلے سے سسٹم کے ظاہری انداز کے مطابق رنگ خودکار طور پر ایڈجسٹ کرتے ہیں۔

لیکن اگر ہم دستی طور پر فکسڈ رنگ مقرر کریں، مثلاً `Color.white` یا `Color.black`، تو یہ رنگ خودکار طور پر تبدیل نہیں ہوتے۔

اس کے بعد، ہم نے `@Environment` اور `colorScheme` سیکھا:

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme` کے ذریعے، ہم یہ طے کر سکتے ہیں کہ موجودہ موڈ لائٹ ہے یا ڈارک، اور مختلف ظاہری انداز کے مطابق مختلف آئیکن، متن یا رنگ دکھا سکتے ہیں۔

آخر میں، ہم نے `Assets` colors سیکھے۔

`Assets` colors لائٹ موڈ اور ڈارک موڈ کے لیے الگ الگ رنگ set کر سکتے ہیں، اس لیے یہ App میں عمومی color resources manage کرنے کے لیے مناسب ہیں۔

ظاہری انداز کی موافقت App کو دن اور رات دونوں میں بہتر display effect دیتی ہے، اور متن کے نظر نہ آنے یا پس منظر کے غیر واضح ہونے جیسے مسائل سے بچاتی ہے۔

حقیقی development میں، SwiftUI کی default adaptation capability اور `Assets` colors کو پہلے استعمال کرنے کی تجویز ہے۔

جب مختلف ظاہری انداز میں متن، آئیکن، image تبدیل کرنے کی ضرورت ہو، یا چند خاص display effects سنبھالنے ہوں، تب `colorScheme` سے طے کریں۔

## اضافی معلومات: font size مقرر کرنا

اس سے پہلے `font` سیکھتے وقت، ہم نے کچھ system font styles استعمال کیے تھے:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

`.largeTitle`، `.callout` جیسے system font styles کے علاوہ، font size دستی طور پر بھی مقرر کیا جا سکتا ہے۔

مثال کے طور پر:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

یہاں:

```swift
.font(.system(size: 100))
```

کا مطلب font size کو `100 pt` مقرر کرنا ہے۔

`SF Symbols` icons کے لیے بھی `font` آئیکن کے size کو متاثر کرتا ہے۔

اس لیے اگر آپ آئیکن کو بڑا دکھانا چاہتے ہیں، تو `.font(.system(size:))` کے ذریعے size مقرر کر سکتے ہیں۔

مثال کے طور پر:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

یہ نوٹ کرنا ضروری ہے کہ دستی font size زیادہ flexible ہے، لیکن عام text میں بڑی مقدار میں fixed font sizes استعمال کرنے کی سفارش نہیں کی جاتی۔

عام text کے لیے پہلے `.title`، `.headline`، `.body`، `.caption` جیسے system font styles استعمال کیے جائیں۔

اس سے مختلف devices اور صارف کی font settings کے ساتھ بہتر adaptation حاصل ہوتی ہے۔
