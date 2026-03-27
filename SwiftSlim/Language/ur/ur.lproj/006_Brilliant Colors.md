# دلکش رنگ

اس سبق میں ہم SwiftUI میں عام طور پر استعمال ہونے والے visual modifiers سیکھیں گے، جن میں شامل ہیں:

* رنگ
* foreground color
* background color
* offset
* opacity
* blur

اس کے ساتھ ہم Safe Area (محفوظ علاقہ) بھی سیکھیں گے۔

یہ modifiers ویو کی ظاہری شکل کو کنٹرول کرنے کے لیے استعمال ہوتے ہیں، تاکہ interface زیادہ واضح اور زیادہ تہہ دار محسوس ہو۔

## رنگ

SwiftUI میں ہم متن کا رنگ مقرر کر سکتے ہیں۔

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue کا مطلب نیلا رنگ ہے۔ دراصل یہ Color.blue کی مختصر شکل ہے (type inference کی وجہ سے)۔

عام رنگ یہ ہیں:

```swift
.black
.green
.yellow
.pink
.gray
...
```

یہ سب Color کی static properties ہیں۔

![Color](../../RESOURCE/006_color.png)

آپ Color کو ایک رنگی type کے طور پر سمجھ سکتے ہیں، جبکہ .blue، .red وغیرہ اس کے مخصوص رنگ ہیں۔

### Color ویو

SwiftUI میں، Color خود بھی ایک ویو کے طور پر دکھایا جا سکتا ہے۔

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

یہ کوڈ 100×100 کا ایک سرخ مربع بناتا ہے۔

آپ پوری اسکرین کو بھی ایک خاص رنگ میں دکھا سکتے ہیں:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

رن کرنے کے بعد آپ دیکھیں گے کہ سرخ رنگ پوری اسکرین پر نہیں پھیلتا، اور iPhone کے اوپر اور نیچے اب بھی سفید حصہ موجود رہتا ہے۔ یہاں Safe Area (محفوظ علاقہ) کا تصور شامل ہوتا ہے۔

## Safe Area (محفوظ علاقہ)

Safe Area وہ علاقہ ہے جو سسٹم اس لیے محفوظ رکھتا ہے تاکہ content ڈھک نہ جائے۔ اس میں شامل ہیں:

1. اوپر کا status bar (وقت، بیٹری)

2. نیچے والا Home indicator

3. notch یا Dynamic Island والا حصہ

![Color](../../RESOURCE/006_color3.png)

SwiftUI بطورِ ڈیفالٹ content کو safe area کے اندر محدود رکھتا ہے، اس لیے ویو اسکرین کے کناروں تک نہیں پھیلتی۔

### Safe Area کو نظر انداز کرنا

اگر آپ چاہتے ہیں کہ رنگ پوری اسکرین پر پھیل جائے، تو ignoresSafeArea استعمال کر سکتے ہیں:

```swift
Color.red
    .ignoresSafeArea()
```

یا edgesIgnoringSafeArea استعمال کر سکتے ہیں:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

اس طرح ویو پوری اسکرین تک پھیل جائے گی۔

یہ بات ذہن میں رکھیں کہ edgesIgnoringSafeArea پرانا انداز ہے، اور iOS 14 کے بعد ignoresSafeArea استعمال کرنا زیادہ موزوں سمجھا جاتا ہے۔

## foreground color

### foregroundStyle modifier

پچھلے اسباق میں ہم foregroundStyle کے ذریعے رنگ مقرر کرنا سیکھ چکے ہیں۔

مثلاً:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle ایک نیا style system ہے، جو رنگ، gradient، material وغیرہ کو سپورٹ کرتا ہے۔

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier

foregroundColor بھی رنگ مقرر کرنے کے لیے استعمال ہو سکتا ہے:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

اس کا استعمال foregroundStyle کی طرح ہی ہے۔

Xcode کے نئے ورژنز میں، Xcode یہ اشارہ دیتا ہے کہ foregroundColor مستقبل کے iOS ورژنز میں deprecated ہو سکتا ہے، اس لیے foregroundStyle کو ترجیح دینا بہتر ہے۔

## پس منظر

اگر آپ کسی ویو کے لیے background color شامل کرنا چاہتے ہیں، تو background استعمال کریں:

```swift
background(.red)
```

مثلاً، متن کے پیچھے background color شامل کرنے کے لیے:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

جب ہم Word، Chrome اور دوسرے Apps میں متن منتخب کرتے ہیں، تو ہمیں اسی طرح کا background effect دکھائی دیتا ہے۔

![Color](../../RESOURCE/006_color16.png)

اگر آپ background کو بڑا کرنا چاہتے ہیں، تو padding کے ساتھ استعمال کریں:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

یہاں ایک اہم اصول سمجھنا ضروری ہے:

SwiftUI modifiers اوپر سے نیچے ویو بناتے ہیں۔ بعد میں لکھا جانے والا modifier، پہلے کے نتیجے پر لاگو ہوتا ہے۔

اس لیے:

```swift
.padding()
.background()
```

اس کا مطلب یہ ہے کہ background، padding شامل ہونے کے بعد والے ویو کو گھیرے گا۔

اگر ترتیب الٹ دی جائے:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

تو background بڑا نہیں ہوگا، کیونکہ background نے بعد میں آنے والے padding کو شامل نہیں کیا۔

## مثال - چار کونوں والا نٹ

اب ہم ایک سادہ چار کونوں والے نٹ جیسا ویو بناتے ہیں۔

![Color](../../RESOURCE/006_color8.png)

سب سے پہلے 50 × 50 کا ایک سفید مربع بنائیں:

```swift
Color.white
    .frame(width: 50, height: 50)
```

اگر آپ اسے گول بنانا چاہتے ہیں، تو cornerRadius استعمال کریں:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

جب corner radius چوڑائی اور اونچائی کے نصف کے برابر ہو، تو شکل دائرے میں بدل جاتی ہے۔

اب ایک نیلا background شامل کرتے ہیں:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

یہ نیا padding بیرونی حصہ بڑا کرتا ہے، اور background اسی بیرونی حصے پر نیلا رنگ بناتا ہے۔

اب چار کونوں والے نٹ جیسا ایک effect مکمل ہو گیا۔

### ایک اور طریقہ

background color استعمال کرنے کے علاوہ، ہم ZStack کے ذریعے بھی یہی effect بنا سکتے ہیں۔

ہم پہلے سیکھ چکے ہیں کہ ZStack ویوز کو ایک دوسرے کے اوپر رکھنے کے لیے استعمال ہوتا ہے۔ چار کونوں والے نٹ کو بھی ایک دائرے اور ایک مستطیل کی تہہ بندی کے طور پر سمجھا جا سکتا ہے۔

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack ویوز کو ترتیب کے مطابق تہہ در تہہ دکھاتا ہے، اور بعد میں شامل ہونے والی ویو اوپر نظر آتی ہے۔

## مثال - دو overlapping circles

بہت سے آئیکون سادہ shapes کی تہہ بندی سے بنتے ہیں، مثلاً دو overlapping circles۔

![Color](../../RESOURCE/006_color14.png)

سب سے پہلے، دو circles بنائیں:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

چونکہ ہمیں دونوں circles کو overlap کرانا ہے، اس لیے ZStack layout استعمال کرتے ہیں:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

اس وقت، ایک ہی سائز کے دونوں circles پوری طرح ایک دوسرے کے اوپر آ جاتے ہیں۔

ہم چاہتے ہیں کہ دونوں circles جزوی طور پر overlap ہوں، مکمل طور پر نہیں۔ اس کے لیے offset استعمال کیا جا سکتا ہے۔

## offset

offset صرف ویو کی drawing position تبدیل کرتا ہے، parent view کی layout calculation کو نہیں۔

اس کا استعمال یوں ہے:

```swift
.offset(x:y:)
```

x افقی سمت میں offset ہے، جبکہ y عمودی سمت میں offset ہے۔

مثبت value کا مطلب دائیں / نیچے کی طرف جانا ہے، جبکہ منفی value کا مطلب بائیں / اوپر کی طرف جانا ہے۔

دو circles کو جزوی overlap دینے کے لیے offset استعمال کریں:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

سرخ circle کی layout position تبدیل نہیں ہوئی، لیکن اس کی drawing position بائیں طرف 25 points منتقل ہو گئی۔ اس لیے دونوں circles میں جزوی overlap کا effect پیدا ہوا۔

## opacity

SwiftUI میں opacity ویو کی شفافیت مقرر کرنے کے لیے استعمال ہوتی ہے۔

بنیادی استعمال:

```swift
.opacity(0.5)
```

opacity کی value 0.0 سے 1.0 تک ہوتی ہے، جہاں:

* 0 کا مطلب مکمل شفاف
* 1 کا مطلب مکمل غیر شفاف

ہم نارنجی circle کی opacity مقرر کر سکتے ہیں:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

جب نارنجی circle کی opacity کو 0.8 مقرر کیا جاتا ہے، تو اس کی non-transparency 80% رہ جاتی ہے۔ جب دونوں circles overlap کرتے ہیں، تو overlap والے حصے میں رنگ ملاپ کا اثر بنتا ہے۔

## blur

SwiftUI میں blur effect شامل کرنے کے لیے blur استعمال کیا جا سکتا ہے:

```swift
.blur(radius:10)
```

radius blur کی شدت کو ظاہر کرتا ہے۔ جتنا بڑا عدد ہوگا، blur اتنا ہی واضح ہوگا۔

ہم دونوں circles پر blur effect شامل کر سکتے ہیں:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

آخر میں، ہم دو بہت دھندلے circles دیکھ سکتے ہیں۔

## خلاصہ

اس سبق میں ہم نے SwiftUI کے عام visual modifiers کا مطالعہ کیا، اور سیکھا کہ modifiers کے ذریعے ویو کے رنگ، مقام، اور visual effects کو کیسے کنٹرول کیا جاتا ہے۔

عملی مثالوں کے ذریعے ہم نے دیکھا کہ مختلف visual modifiers interface میں کیسے اثر انداز ہوتے ہیں، اور safe area کے تصور کو بھی سمجھا۔

یہ سب بہت بنیادی modifiers ہیں۔ ان کی زیادہ مشق اور استعمال آپ کو عملی development میں interface کے effects کو زیادہ واضح طریقے سے کنٹرول کرنے میں مدد دے گا۔

### سبق کے بعد کی مشق

* کسی تصویر پر opacity اور blur effect لگائیں
* تین مختلف opacity والے overlapping circles بنائیں
* ایک ایسی background image بنائیں جو پوری اسکرین پر پھیل جائے اور safe area کو ignore کرے
* offset استعمال کرکے کئی ویوز کی position کو ایڈجسٹ کریں

ان مشقوں کا مقصد API کو رٹنا نہیں، بلکہ visual changes اور layout behavior کے باہمی تعلق کو غور سے سمجھنا ہے۔
