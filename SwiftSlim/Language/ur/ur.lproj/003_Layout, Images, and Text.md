# لے آؤٹ، تصاویر اور متن

پچھلے سبق میں، ہم نے ContentView کا یہ کوڈ سیکھا تھا:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
````

اس سبق میں، ہم SwiftUI کے ڈیفالٹ لے آؤٹ میکانزم، اور تصاویر اور متن کے استعمال کے طریقے سیکھیں گے۔ پچھلے سبق کی بنیاد پر، ہم ویوز کی ساخت اور ان کے ظاہر ہونے کے انداز کو مزید سمجھیں گے۔ یہ معلومات ہمیں بنیادی یوزر انٹرفیس لے آؤٹ بنانے میں مدد دیں گی۔

## SwiftUI کا ڈیفالٹ لے آؤٹ میکانزم

جب ہم ContentView ویو کا preview دیکھتے ہیں، تو ہمیں معلوم ہوتا ہے کہ آئیکن اور متن درمیان میں دکھائی دیتے ہیں، اوپر سے ترتیب وار شروع نہیں ہوتے۔

![Swift](../../RESOURCE/003_view.png)

ڈیفالٹ حالت میں، Stack کنٹینر کی alignment .center ہوتی ہے، اس لیے اس کے اندر موجود child views عام طور پر center میں نظر آتے ہیں۔

### Alignment سیدھ

یہ واضح ہے کہ center alignment صرف alignment کی ایک قسم ہے۔ اگر ہم left alignment یا right alignment چاہتے ہوں، تو ہمیں alignment کے ذریعے ویو کی سیدھ کو کنٹرول کرنا ہوگا۔

```swift
alignment
```

SwiftUI میں alignment عام طور پر دو منظرناموں میں استعمال ہوتی ہے:

**1. Stack کنٹینر کا alignment parameter**

مثال کے طور پر، ContentView میں آئیکن اور متن کو left align کرنا:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

VStack کا alignment افقی سمت میں سیدھ کو کنٹرول کرتا ہے۔

سیدھ کی اقسام:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack افقی ترتیب رکھتا ہے، اس لیے alignment عمودی سمت میں سیدھ کو کنٹرول کرتا ہے:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack تہہ در تہہ ترتیب رکھتا ہے، اس لیے alignment افقی یا عمودی دونوں سمتوں میں سیدھ کو کنٹرول کر سکتا ہے:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

اگر alignment کو واضح طور پر مقرر نہ کیا جائے، تو VStack، HStack اور ZStack کی default alignment .center ہوتی ہے۔

**2. frame کے اندر alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

جب frame کے ذریعے دی گئی جگہ ویو کے اپنے سائز سے بڑی ہو، تو alignment یہ طے کرتی ہے کہ ویو frame کے اندر کہاں رکھا جائے گا۔ frame کے مفصل استعمال کو ہم بعد میں مزید سیکھیں گے، یہاں ابھی صرف ابتدائی سمجھ کافی ہے۔

### Spacer اور جگہ تقسیم کرنے کا میکانزم

alignment ویوز کو افقی یا عمودی سمت میں ترتیب دینے میں مدد دیتی ہے۔ لیکن جب ہم چاہتے ہیں کہ متن اور تصویر دو کناروں پر دکھائی دیں، تو صرف alignment کافی نہیں ہوتی۔

مثال کے طور پر، اگر ہم [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) ویب سائٹ کا اوپری حصہ بنانا چاہیں، جہاں بائیں جانب NHK کا آئیکن ہو اور دائیں جانب مینو یا ڈائریکٹری آئیکن ہو۔

![Swift](../../RESOURCE/003_alignment3.png)

اگر ہم صرف alignment استعمال کریں، تو NHK کا آئیکن اور ڈائریکٹری آئیکن دونوں ایک ہی طرف دکھائی دیں گے۔ انہیں بائیں اور دائیں دو سروں پر تقسیم نہیں کیا جا سکتا، اس لیے باقی ماندہ جگہ تقسیم کرنے کے لیے Spacer کی ضرورت ہوتی ہے۔

Spacer ایک flexible layout view ہے، جو خودکار طور پر باقی ماندہ خالی جگہ بھر دیتا ہے۔

استعمال کا طریقہ:

```swift
Spacer()
```

مثال کے طور پر:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

جب ہم Image اور Text کے درمیان Spacer شامل کرتے ہیں، تو Spacer باقی ماندہ جگہ بھر دیتا ہے، اور Image اور Text کو اوپر اور نیچے کے دونوں سروں کی طرف دھکیل دیتا ہے۔

![Swift](../../RESOURCE/003_view1.png)

اگر ایک سے زیادہ Spacer موجود ہوں:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

تو باقی ماندہ جگہ ان تمام Spacer کے درمیان برابر تقسیم ہو جائے گی۔

![Swift](../../RESOURCE/003_spacer.png)

## Image کی نمائش اور سائز کنٹرول

Image ویو بنیادی طور پر تصاویر دکھانے کے لیے استعمال ہوتی ہے۔ پچھلے سبق میں ہم نے جو SF Symbols آئیکن سیکھے تھے، وہ دراصل Image کا ایک استعمال تھے۔

استعمال کا طریقہ:

```swift
Image("imageName")
```

Image کے double quotes کے اندر تصویر کا نام لکھا جاتا ہے، اس میں file extension لکھنے کی ضرورت نہیں ہوتی۔

### تصویر دکھانا

سب سے پہلے، ہم ایک تصویر تیار کرتے ہیں۔

![Swift](../../RESOURCE/003_img.jpg)

Xcode میں Assets ریسورس فولڈر منتخب کریں، اور تصویر کو drag کر کے Assets میں شامل کر دیں۔

![Swift](../../RESOURCE/003_img1.png)

ContentView میں Image استعمال کر کے تصویر دکھائیں:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

نوٹ: SwiftUI کی Image GIF animation چلانے کی سپورٹ نہیں کرتی، یہ صرف static frame دکھا سکتی ہے۔

### تصویر کے سائز کو کنٹرول کرنا

SwiftUI میں Image ڈیفالٹ طور پر تصویر کے اصل سائز میں دکھائی دیتی ہے۔ اگر ہم تصویر کے ظاہر ہونے کا سائز بدلنا چاہتے ہیں، تو پہلے resizable استعمال کرنا ہوگا تاکہ تصویر scale ہو سکے، پھر frame کے ذریعے layout size مقرر کرنا ہوگا۔

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier

resizable modifier تصویر کو layout کے اندر scale ہونے کی اجازت دیتا ہے، یعنی تصویر ہمیشہ اصل سائز میں محدود نہیں رہتی۔

```swift
.resizable()
```

صرف resizable() شامل کرنے کے بعد ہی frame حقیقت میں تصویر کے ظاہر ہونے والے سائز کو بدل سکتا ہے۔

اگر resizable کو چھوڑ دیا جائے:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

تو frame صرف تصویر کے لیے layout space مہیا کرے گا، لیکن خود تصویر کا سائز تبدیل نہیں ہوگا۔

### frame modifier

frame(width:height:) ویو کی چوڑائی اور اونچائی مقرر کرنے کے لیے استعمال ہوتا ہے۔

بنیادی استعمال:

```swift
.frame(width: 10, height: 10)
```

مثال کے طور پر، تصویر کو width 300 اور height 100 والے مستطیل میں بدلنا:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

صرف width یا صرف height بھی الگ سے مقرر کی جا سکتی ہے:

```swift
.frame(width: 200)
.frame(height: 100)
```

resizable + frame کا مجموعہ ہمیں interface میں تصویر کے سائز کو لچکدار انداز میں کنٹرول کرنے دیتا ہے، جبکہ تصویر scale ہونے کے قابل بھی رہتی ہے۔

### اسکیل کا تناسب: scaledToFit اور scaledToFill

جب ہم frame کے ذریعے ایسی width اور height مقرر کرتے ہیں جن کا تناسب تصویر کے اصل تناسب سے مختلف ہو، تو تصویر کھنچ کر بگڑ سکتی ہے۔

اگر ہم چاہتے ہیں کہ تصویر اپنا اصل تناسب برقرار رکھتے ہوئے دستیاب layout space کے مطابق خود کو ڈھال لے، تو ہم scaledToFit یا scaledToFill استعمال کر سکتے ہیں۔

**scaledToFit**

scaledToFit تصویر کے اصل width-height ratio کو برقرار رکھتا ہے، اور تصویر کو اس طرح scale کرتا ہے کہ وہ مکمل طور پر دستیاب جگہ کے اندر سما جائے، بغیر کسی crop کے:

```swift
.scaledToFit()
```

یا:

```swift
.aspectRatio(contentMode: .fit)
```

یہ طریقہ ان صورتوں کے لیے مناسب ہے جہاں ہم تصویر کو مکمل طور پر دکھانا چاہتے ہوں اور بگاڑ سے بچنا چاہتے ہوں۔

اگر ہر تصویر کے لیے ایک جیسی width اور height مقرر کر دی جائے، تو تصویر کے کھنچنے کا امکان رہتا ہے۔

مثال کے طور پر:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

اگر scaling ratio مقرر نہ کیا جائے، تو تصویر اپنے اصل تناسب کے مطابق نہیں دکھائی دے گی۔

![Swift](../../RESOURCE/003_img4.png)

scaledToFit مقرر کرنے سے تصویر اپنا اصل تناسب برقرار رکھ سکتی ہے۔

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill بھی تصویر کا تناسب برقرار رکھتا ہے، لیکن یہ پورا دستیاب علاقہ بھر دیتا ہے۔ اگر تناسب مختلف ہو، تو اضافی حصہ crop ہو جاتا ہے:

```swift
.scaledToFill()
```

یا:

```swift
.aspectRatio(contentMode: .fill)
```

یہ طریقہ ان صورتوں کے لیے مناسب ہے جہاں تصویر کو پورا علاقہ ڈھانپنا ہو، جیسے background image یا banner۔ خاص طور پر پس منظر کی تصاویر میں یہ زیادہ استعمال ہوتا ہے۔

**دونوں کے درمیان فرق**

![Swift](../../RESOURCE/003_img6.png)

## متن

SwiftUI میں Text متن دکھانے کے لیے استعمال ہوتا ہے۔

بنیادی استعمال:

```swift
Text("FangJunyu")
```

ہم نے پچھلے سبق میں Text سیکھا تھا۔ اس سبق میں ہم مزید یہ سیکھیں گے کہ font size اور font weight کو کیسے کنٹرول کیا جائے، تاکہ متن ویو میں زیادہ مؤثر انداز میں نظر آئے۔

### فونٹ کا سائز

font modifier استعمال کر کے متن کا سائز کنٹرول کیا جا سکتا ہے:

```swift
.font(.title)
```

مثال کے طور پر:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

عام فونٹ سائز (بڑے سے چھوٹے کی ترتیب میں):

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### فونٹ کی موٹائی

اگر ہم متن کو bold کرنا چاہتے ہیں، تو fontWeight modifier استعمال کیا جا سکتا ہے:

```swift
.fontWeight(.bold)
```

مثال کے طور پر:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

عام font weight (باریک سے موٹے کی ترتیب میں):

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font فونٹ کے سائز کو کنٹرول کرتا ہے، جبکہ fontWeight فونٹ کی موٹائی کو کنٹرول کرتا ہے۔ دونوں کو ایک ساتھ استعمال کر کے متن کی ظاہری قوت کو بہتر بنایا جا سکتا ہے۔

## خلاصہ اور مشق

اب تک ہم SwiftUI کے default layout، Spacer، Image اور Text جیسی بنیادی چیزیں سیکھ چکے ہیں۔ یہ معلومات اتنی کافی ہیں کہ ہم کچھ سادہ ویوز تیار کر سکیں۔

مثال کے طور پر: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google کا interface بہت سادہ اور صاف ہے۔ اس میں تصویر اور متن دونوں شامل ہیں۔ ہم SwiftUI کے نقطۂ نظر سے اس کی ساخت کو اس طرح سمجھ سکتے ہیں:

1. پوری اسکرین کو تین حصوں میں تقسیم کیا جا سکتا ہے: Google کا لوگو، search box، اور hint text۔ اس کے لیے VStack استعمال کیا جا سکتا ہے۔
2. Google کا لوگو ایک تصویر ہے، اسے Image سے دکھایا جا سکتا ہے۔
3. Search box میں input field اور آئیکن شامل ہیں۔ اگر input field کو فی الحال نظر انداز کریں، تو search icon کو Image سے دکھایا جا سکتا ہے۔
4. Hint text کو Text سے دکھایا جا سکتا ہے۔ متن کی افقی ترتیب HStack سے کی جا سکتی ہے، اور font color کو foregroundStyle سے کنٹرول کیا جا سکتا ہے۔

ان معلومات کی مشق کے ذریعے، ہم کچھ سادہ ویوز بنا سکتے ہیں، اور Image اور Text ویوز کے ساتھ ساتھ ان کے modifiers کے استعمال کو مزید بہتر طور پر سمجھ سکتے ہیں۔
