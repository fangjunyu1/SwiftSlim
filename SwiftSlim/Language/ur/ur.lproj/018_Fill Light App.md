# Fill Light ایپ

اس سبق میں، ہم ایک بہت دلچسپ fill light ایپ بنائیں گے۔ جب رات آتی ہے، تو ہم فون کی اسکرین پر مختلف رنگ دکھا سکتے ہیں اور اسے ایک سادہ fill light کے طور پر استعمال کر سکتے ہیں۔

یہ fill light ایپ اسکرین پر ٹیپ کرکے رنگ بدل سکتی ہے، اور slider کے ذریعے brightness کو بھی ایڈجسٹ کر سکتی ہے۔

اس مثال میں، ہم `brightness` کے ذریعے view کی چمک تبدیل کرنا، `onTapGesture` کے ذریعے view میں tap gesture شامل کرنا، اور `Slider` view control استعمال کرنا سیکھیں گے۔

نتیجہ:

![Color](../../Resource/018_color.png)

## رنگ دکھانا

سب سے پہلے، آئیے view کو ایک رنگ دکھانے دیں۔

SwiftUI میں، `Color` صرف رنگ کی نمائندگی نہیں کرتا بلکہ اسے ایک view کے طور پر بھی دکھایا جا سکتا ہے:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

یہاں `Color.red` ایک سرخ view کی نمائندگی کرتا ہے۔ `.ignoresSafeArea()` رنگ والے view کو پوری اسکرین پر پھیلا دیتا ہے، اس لیے یہ ایک حقیقی fill light effect کے زیادہ قریب لگتا ہے۔

نتیجہ:

![Color](../../Resource/018_color1.png)

### رنگوں کا array اور index

اس وقت صرف ایک رنگ دکھایا جا رہا ہے، لیکن fill light عام طور پر صرف ایک ہی رنگ تک محدود نہیں ہوتی۔ یہ نیلا، پیلا، جامنی، سفید اور دوسرے رنگ بھی دکھا سکتی ہے۔

ہم چاہتے ہیں کہ اسکرین پر ٹیپ کرنے پر مختلف رنگوں کے درمیان تبدیلی ہو سکے۔ اس کے لیے ہم ان رنگوں کو ایک array میں رکھ کر ایک ساتھ manage کر سکتے ہیں:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

array ایک ہی قسم کے “ڈیٹا کے گروپ” کو محفوظ کرنے کے لیے موزوں ہے۔ یہاں array کا ہر element ایک `Color` ہے۔

اگر ہم کوئی خاص رنگ دکھانا چاہتے ہیں، تو ہم index استعمال کر سکتے ہیں:

```swift
colors[0]
```

اس کا مطلب ہے array میں `0` index پر موجود رنگ کو پڑھنا، یعنی پہلا رنگ۔

اب code اس طرح لکھا جا سکتا ہے:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

اس طرح اسکرین پر array کا پہلا رنگ، یعنی سرخ، دکھائی دے گا۔

### index کے ذریعے رنگ کنٹرول کرنا

اگر ہمیں مختلف رنگوں کے درمیان switch کرنا ہو، تو ہمیں index کو hard-code کرنے کے بجائے ایک variable کے ذریعے manage کرنا ہوگا۔

index محفوظ کرنے کے لیے ہم `@State` سے ایک variable declare کر سکتے ہیں:

```swift
@State private var index = 0
```

یہاں `index` موجودہ رنگ کے index کو ظاہر کرتا ہے۔

جب `index` تبدیل ہوتا ہے، تو SwiftUI دوبارہ interface calculate کرتا ہے اور دکھائی جانے والی content کو update کرتا ہے۔

پھر ہم پہلے والے `colors[0]` کو بدل کر یہ لکھتے ہیں:

```swift
colors[index]
```

اس طرح view میں دکھایا جانے والا رنگ `index` سے طے ہوتا ہے۔

اب code اس شکل میں ہو جاتا ہے:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

جب `index` بدلے گا، تو `colors[index]` بھی اس کے مطابق مختلف رنگ دکھائے گا۔

مثال کے طور پر:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

ایک اہم بات یہ ہے کہ `index` array کے زیادہ سے زیادہ index سے بڑا نہیں ہونا چاہیے، ورنہ index out of range error آ جائے گی۔

## Tap gesture

اب ہم `index` کے مطابق مختلف رنگ دکھا سکتے ہیں، لیکن ابھی ٹیپ کرکے ان کو بدل نہیں سکتے۔

پہلے والے “Quote Carousel” میں ہم نے quote بدلنے کے لیے `Button` استعمال کیا تھا۔

لیکن اس بار ہم “پورے رنگ والے حصے پر ٹیپ” کرکے رنگ بدلنا چاہتے ہیں، اس لیے `onTapGesture` زیادہ مناسب ہے۔

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

جب ہم رنگ والے view پر ٹیپ کرتے ہیں، تو یہ code چلتا ہے:

```swift
index += 1
```

اس کا مطلب ہے کہ `index` میں `1` کا اضافہ ہو جاتا ہے۔ جب index بڑھتا ہے، تو `colors[index]` array کا اگلا رنگ دکھاتا ہے۔

### onTapGesture

`onTapGesture` ایک gesture modifier ہے جو view میں tap action شامل کر سکتا ہے۔

بنیادی استعمال:

```swift
.onTapGesture {
    // code
}
```

مثال کے طور پر:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

جب اس سرخ view پر ٹیپ کیا جائے گا، تو curly braces کے اندر کا code چلے گا، اور console میں یہ output آئے گا:

```swift
Click color
```

`onTapGesture` کے ذریعے ہم یہ طے کر سکتے ہیں کہ کسی view پر ٹیپ کرنے کے بعد کیا ہونا چاہیے۔

### `Button` سے فرق

ہم پہلے `Button` view کے بارے میں سیکھ چکے ہیں۔ `Button` اور `onTapGesture` دونوں tap action کو handle کر سکتے ہیں، لیکن ان کے استعمال کے مواقع مکمل طور پر ایک جیسے نہیں ہوتے۔

`onTapGesture` پہلے سے موجود view میں tap capability شامل کرنے کے لیے زیادہ موزوں ہے، جیسے `Color`, `Image`, `Text` یا دوسرے عام view۔

جبکہ `Button` کسی واضح button کو ظاہر کرنے کے لیے زیادہ مناسب ہے، جیسے “Confirm”، “Submit” یا “Delete”۔

اس fill light ایپ میں، ہم رنگ بدلنے والے feature کو زیادہ سادہ رکھنا چاہتے ہیں، اس لیے پورے رنگ والے حصے پر ٹیپ کرکے رنگ بدلنے کے لیے `onTapGesture` استعمال کیا جا سکتا ہے۔

## index کا مسئلہ

اب ہم اسکرین پر ٹیپ کرکے مختلف رنگوں کے درمیان switch کر سکتے ہیں۔

لیکن یہاں ایک اہم مسئلہ موجود ہے: **index array کی حد سے باہر جا سکتا ہے**۔

مثال کے طور پر:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

اگر ہم اسکرین پر بار بار ٹیپ کرتے رہیں، تو آخرکار `index` کی value `4` ہو جائے گی، اور پھر “index out of range” error ہو گی۔

اس کی وجہ یہ ہے کہ `colors` array میں `4` elements ہیں، لیکن index `0` سے شروع ہوتا ہے، اس لیے درست index range `0 - 3` ہے، `4` نہیں۔

اگر ہم `colors[4]` access کریں، تو “index out of range” ہو گا۔

موجودہ code میں، اسکرین پر ہر بار ٹیپ کرنے سے `index` خودکار طور پر `1` بڑھ جاتا ہے۔ اگر ہم اسے handle نہ کریں، تو یہ آخرکار حد سے باہر چلا جائے گا۔

اس لیے، اسکرین پر ٹیپ کرتے وقت ہمیں index کو check کرنا ہوگا: اگر یہ آخری رنگ ہے تو پہلے رنگ پر واپس آنا چاہیے، ورنہ `1` بڑھانا چاہیے۔

یہ ہم `if` statement کے ذریعے کر سکتے ہیں:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

اس code میں، `colors.count` array میں موجود elements کی تعداد کو ظاہر کرتا ہے۔

موجودہ array میں `4` رنگ ہیں، اس لیے:

```swift
colors.count // 4
```

لیکن زیادہ سے زیادہ index `4` نہیں بلکہ `3` ہے، کیونکہ index `0` سے شروع ہوتا ہے۔

اس لیے آخری index کو اس طرح لکھتے ہیں:

```swift
colors.count - 1
```

یعنی:

```swift
4 - 1 = 3
```

اس logic کا مطلب یہ ہے کہ اگر موجودہ index پہلے ہی آخری رنگ پر ہے، تو اسے `0` پر reset کر دیا جائے، ورنہ `1` بڑھا دیا جائے۔

اس طرح رنگ loop میں بدلتے رہتے ہیں۔

### index کو مختصر بنانا

اگر ہم code کو اور مختصر بنانا چاہیں، تو ternary operator استعمال کر سکتے ہیں:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

اس code کا مطلب ہے: اگر `index == colors.count - 1` درست ہو، تو `0` return کرو۔ اگر درست نہ ہو، تو `index + 1` return کرو۔

آخر میں یہ result دوبارہ `index` کو assign کر دیا جاتا ہے۔

اب ہم رنگ بدلنے والا effect حاصل کر سکتے ہیں۔

مکمل code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

اب ہم اسکرین پر ٹیپ کرکے مختلف رنگوں میں switch کر سکتے ہیں، اور ایک بنیادی fill light ایپ مکمل ہو جاتی ہے۔

## رنگ کا نام دکھانا

ہم رنگوں کے مطابق text کا ایک مجموعہ بھی شامل کر سکتے ہیں، تاکہ رنگ بدلتے وقت اسکرین پر موجودہ رنگ کا نام بھی ساتھ ساتھ دکھائی دے۔

مثال کے طور پر:

- سرخ ہونے پر `Red`
- نیلا ہونے پر `Blue`
- پیلا ہونے پر `Yellow`
- جامنی ہونے پر `Purple`

یہاں بھی ہم رنگوں کے نام محفوظ کرنے کے لیے array استعمال کر سکتے ہیں:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

اس array میں text کی ترتیب، رنگوں والے array کی ترتیب سے ایک جیسی ہونی چاہیے۔

اس کے بعد ہم `Text` استعمال کرکے موجودہ index کے مطابق رنگ کا نام دکھا سکتے ہیں:

```swift
Text(colorsName[index])
```

`Text`، `index` کے مطابق موجودہ رنگ کا نام دکھائے گا۔

modifier استعمال کرکے `Text` کی appearance بہتر بنا سکتے ہیں:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

اس طرح `Text` سفید رنگ میں، بڑے title style اور bold font کے ساتھ نظر آئے گا۔

اب ہمارے پاس full-screen `Color` view موجود ہے۔ اگر ہم چاہتے ہیں کہ `Text`، `Color` view کے اوپر دکھائی دے، تو ہمیں `ZStack` layout container استعمال کرنا ہوگا۔

```swift
ZStack {
    Color
    Text
}
```

اس طرح code بدل کر یہ ہو جاتا ہے:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

اس طرح پس منظر میں رنگ والا view ہو گا اور اس کے اوپر text view نظر آئے گا۔

نتیجہ:

![Color](../../Resource/018_color2.png)

یہ بات یاد رکھنے کی ہے کہ `ZStack` میں بعد میں لکھا گیا view عام طور پر سامنے دکھائی دیتا ہے۔ اگر `Text` کو `Color` سے پہلے لکھا جائے، تو بعد میں آنے والا `Color` اسے ڈھانپ سکتا ہے۔

## brightness کو کنٹرول کرنا

اب ہم مختلف رنگوں کے درمیان switch کر سکتے ہیں، لیکن fill light کا ایک اور اہم feature بھی ہے: **brightness کو adjust کرنا**۔

SwiftUI میں، ہم view کی brightness بدلنے کے لیے `brightness` modifier استعمال کر سکتے ہیں۔

مثال کے طور پر:

```swift
.brightness(1)
```

ہم اسے اس طرح لکھ سکتے ہیں:

```swift
colors[index]
    .brightness(0.5)
```

اس طرح موجودہ رنگ زیادہ روشن نظر آئے گا، اور fill light effect کے زیادہ قریب لگے گا۔

`brightness` کی range `0 - 1` ہے۔ `0` کا مطلب ہے اصل رنگ کو برقرار رکھنا۔ جتنا value `1` کے قریب ہو گی، رنگ اتنا زیادہ روشن ہو گا، اور `1` زیادہ سے زیادہ سفید brightness کو ظاہر کرتا ہے۔

اگرچہ ہم code میں `brightness` کو کنٹرول کر سکتے ہیں، لیکن user ابھی اسے خود adjust نہیں کر سکتا۔

اس کے لیے ہمیں ایک ایسا control شامل کرنا ہوگا جسے drag کیا جا سکے: `Slider`

## Slider view

SwiftUI میں، `Slider` ایک slider control ہے جو کسی range کے اندر value منتخب کرنے کے لیے استعمال ہوتا ہے۔ Apple documentation اسے “a control for selecting a value from a bounded linear range” کے طور پر بیان کرتی ہے۔

بنیادی استعمال:

```swift
Slider(value: $value, in: 0...1)
```

parameters کی وضاحت:

1. `value: $value`: `Slider` کو ایک variable کے ساتھ bind کرنا ضروری ہے۔

    جب slider کو drag کیا جاتا ہے، تو variable کی value بھی ساتھ ساتھ تبدیل ہوتی ہے۔ اسی طرح اگر variable بدلے، تو slider بھی update ہو جاتا ہے۔

    یہ پہلے سیکھے گئے `TextField` سے کافی ملتا جلتا ہے، کیونکہ دونوں میں “control کو variable کے ساتھ bind کرنا” شامل ہے۔
    
    bound variable کے آگے `$` کی علامت لگانی ہوتی ہے تاکہ binding ظاہر ہو۔

2. `in: 0...1`: یہ parameter slider کی value range کو ظاہر کرتا ہے۔

    یہاں `0...1` کا مطلب ہے: کم سے کم value `0` اور زیادہ سے زیادہ value `1`

    جب slider کو بالکل بائیں لے جائیں، تو bound variable `0` کے قریب ہو گا؛ جب بالکل دائیں لے جائیں، تو `1` کے قریب ہو گا۔

مثال کے طور پر:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider`، `value` variable کے ساتھ bind ہے، اس لیے slider کو drag کرنے پر `value` بھی ساتھ بدلتی ہے۔

ظاہری شکل:

![Slider](../../Resource/018_slider.png)

جب `Slider` بائیں طرف ہو، تو bound `value` `0` ہو جاتی ہے؛ اور جب دائیں طرف ہو، تو `1` ہو جاتی ہے۔

### value range

`Slider` کی value range مقررہ نہیں ہوتی۔ اسے اس طرح بھی لکھا جا سکتا ہے:

```swift
0...100
```

یا کوئی اور range بھی استعمال کی جا سکتی ہے۔

لیکن اس fill light میں ہمیں brightness کو control کرنا ہے، اس لیے `0...1` سب سے مناسب ہے۔

## Slider کے ذریعے brightness کنٹرول کرنا

اب ہم `Slider` اور `brightness` کو آپس میں جوڑیں گے۔

سب سے پہلے، brightness کی value محفوظ کرنے کے لیے ایک variable بناتے ہیں:

```swift
@State private var slider = 0.0
```

یہاں `0.0` ایک `Double` type value ہے۔

چونکہ `Slider` عام طور پر numeric type کے ساتھ bind ہوتا ہے، اور یہاں ہم continuous تبدیلی چاہتے ہیں، اس لیے `Double` زیادہ مناسب ہے۔ اس کے علاوہ `brightness` بھی صرف `Double` type value قبول کرتا ہے۔

پھر اس value کو `brightness` میں دیتے ہیں:

```swift
colors[index]
    .brightness(slider)
```

جب `slider == 0` ہو، تو رنگ default حالت میں رہتا ہے؛ اور جیسے جیسے `slider` `1` کے قریب جاتا ہے، رنگ زیادہ روشن نظر آتا ہے۔

### Slider control شامل کرنا

اگلا مرحلہ یہ ہے کہ اس variable کو تبدیل کرنے کے لیے ایک `Slider` control شامل کیا جائے:

```swift
Slider(value: $slider, in: 0...1)
```

جب slider بدلے گا، تو `slider` کی value بھی بدلے گی، اور `brightness(slider)` بھی اسی وقت brightness کو update کرے گا۔

یہ SwiftUI میں “variable drives the view” کی ایک بہت عام مثال ہے۔

### Slider کی appearance ایڈجسٹ کرنا

عام طور پر `Slider` اپنی width کو available space کے مطابق رکھتا ہے۔

ہم اسے ایک fixed width دے سکتے ہیں:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

پھر اسے زیادہ واضح بنانے کے لیے چند modifiers شامل کرتے ہیں:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

اس طرح slider کے باہر سفید background اور rounded corners ہوں گے، جس سے یہ `Color` view پر زیادہ نمایاں دکھائی دے گا۔

آخر میں، ہم اسے اسکرین کے نیچے رکھیں گے۔

کیونکہ ہم پہلے ہی `ZStack` استعمال کر چکے ہیں، اس لیے اس کے اندر ایک `VStack` رکھ کر، `Spacer()` کے ذریعے `Slider` کو نیچے دھکیل سکتے ہیں۔

## مکمل code

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

نتیجہ:

![Color](../../Resource/018_color.png)

## خلاصہ

ہم نے پہلے سیکھی ہوئی معلومات کو، رنگوں اور array جیسے بنیادی concepts کے ساتھ ملا کر، ایک بہت دلچسپ fill light ایپ بنائی۔

اس fill light ایپ کے ذریعے ہم نے `brightness` استعمال کرکے brightness کو adjust کرنا، `onTapGesture` کے ذریعے view میں tap action شامل کرنا، اور `Slider` view control استعمال کرنا سیکھا۔

ہم نے `Color` view میں `onTapGesture` شامل کیا اور رنگ بدلنے والا feature بنایا۔ `Slider` control کے ذریعے ہم ایک variable کو control کرتے ہیں جو `brightness` کو manage کرتا ہے، اور اس طرح رنگ کی چمک کو adjust کرتے ہیں۔ یہ بھی “variable drives the view” کی ایک مثال ہے۔

ہم نے ternary operator کو دہرایا، view کو overlay کرنے کے لیے `ZStack` استعمال کیا، اور ایک ہی قسم کے data group کو manage کرنے کے لیے array استعمال کیا۔ اس سے array اور index کے بارے میں ہماری سمجھ مزید مضبوط ہوتی ہے، اور عملی طور پر index out of range کے مسئلے کو بھی مدنظر رکھا جاتا ہے۔

یہ مثال پیچیدہ نہیں ہے، لیکن یہ پہلے سیکھی گئی بہت سی بنیادی چیزوں کو ایک ساتھ جوڑتی ہے۔ جب ہم انہیں ایک حقیقی چھوٹے project میں استعمال کرتے ہیں، تو یہ سمجھنا زیادہ آسان ہو جاتا ہے کہ ہر concept کا کردار کیا ہے۔

### حقیقی استعمال کا منظر

تصور کریں کہ آپ ایک پرانا iPhone میز پر رکھتے ہیں، اور اپنی بنائی ہوئی fill light ایپ کے ذریعے روشنی کے رنگ کو control کرتے ہیں۔ یہ ایک بہت اچھا تجربہ ہو گا۔

App Store میں بہت سی “fill light” ایپس دیکھی جا سکتی ہیں، اور وہ بھی زیادہ پیچیدہ نظر نہیں آتیں۔

![AppStore](../../Resource/018_appStore.PNG)

ہم سادہ ایپس بنا کر شروعات کر سکتے ہیں، اور انہیں App Store پر شائع کرنے کی کوشش کر سکتے ہیں۔ یہ نہ صرف development میں ہماری دلچسپی بڑھاتا ہے، بلکہ ہماری ترقی کے سفر کو بھی محفوظ کرتا ہے۔

### سبق کے بعد مشق

آپ اس fill light ایپ کو مزید کیسے بڑھایا جا سکتا ہے، اس کے بارے میں بھی سوچ سکتے ہیں۔ مثال کے طور پر:

- مزید رنگ شامل کریں
- موجودہ brightness value دکھائیں
- نیچے والے slider حصے کے design کو بہتر بنائیں

جب آپ واقعی اس بنیادی علم کو استعمال کرنا شروع کریں گے، تو آپ دیکھیں گے کہ ہم جو کچھ بھی سیکھتے ہیں، وہ دراصل ایپ development کے لیے ایک tool ہے۔
