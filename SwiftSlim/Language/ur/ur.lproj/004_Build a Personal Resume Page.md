# ذاتی ریزیومے صفحہ بنانا

اس سبق میں ہم ایک سادہ ذاتی ریزیومے ویو بنائیں گے، اور درج ذیل معلومات سیکھیں گے:

- cornerRadius
- spacing
- ScrollView

تیاری کے عمل کے دوران، ہم layout، Text اور Image جیسے موضوعات کا دوبارہ جائزہ لیں گے، اور spacing کنٹرول اور content scrolling کا اثر نافذ کریں گے۔

## ذاتی ریزیومے

ہدفی نتیجہ:

![Swift](../../RESOURCE/004_img.png)

**براہِ کرم پہلے خود سے اسے مکمل کرنے کی کوشش کریں، پھر نیچے دی گئی وضاحت پڑھیں۔**

### پروجیکٹ بنانا

ایک نیا iOS پروجیکٹ بنائیں، یا پہلے بنایا گیا پروجیکٹ استعمال کرتے رہیں۔

ڈیفالٹ ContentView کوڈ:

```swift
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
````

اب کوڈ کو صاف کریں، اور اپنا مواد لکھنا شروع کریں:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### مجموعی ساخت

حقیقی ڈیولپمنٹ میں، ہم عام طور پر پہلے مجموعی ساخت ڈیزائن کرتے ہیں۔

ہمارے صفحے میں شامل ہیں:

1. عنوان
2. ذاتی معلومات
3. ذاتی تعارف

ہم سب سے باہر ایک VStack شامل کرتے ہیں:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack اس بات کو یقینی بناتا ہے کہ views عمودی ترتیب میں ہوں، اور یہ views کی ترتیب اور spacing کو کنٹرول بھی کر سکتا ہے۔

### عنوان

سب سے پہلے، ہم عنوان دکھانے کے لیے ایک Text بناتے ہیں۔

یہاں، میں عنوان کے طور پر اپنا انگریزی نام دکھا رہا ہوں:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

عنوان عام طور پر بڑا اور bold ہوتا ہے، اس لیے یہاں ہم font اور fontWeight modifiers استعمال کرتے ہیں:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### لے آؤٹ

SwiftUI کی ڈیفالٹ alignment center ہوتی ہے، اس وقت عنوان ContentView کے درمیان میں دکھائی دے رہا ہے۔

![Swift](../../RESOURCE/004_img3.png)

ہمیں عنوان کو view کے اوپری حصے میں دکھانا ہے، اس کے لیے ہم layout کو ایڈجسٹ کرنے کے لیے Spacer استعمال کر سکتے ہیں:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer باقی ماندہ جگہ لے لیتا ہے، اور Text کو container کے اوپر کی طرف دھکیل دیتا ہے۔

![Swift](../../RESOURCE/004_img4.png)

### خالی جگہ

اگر آپ کو لگے کہ متن اوپر کے بہت قریب ہے، تو آپ padding یا Spacer استعمال کر سکتے ہیں۔

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

VStack کے padding کی اوپری margin کو 20 پر سیٹ کریں۔

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer بھی استعمال کیا جا سکتا ہے، اور frame کی height سیٹ کر کے ایک مقررہ اونچائی کی خالی جگہ حاصل کی جا سکتی ہے۔

حاصل شدہ نتیجہ:

![Swift](../../RESOURCE/004_img5.png)

### تصویر

ہم اپنی ایک پورٹریٹ تصویر تیار کرتے ہیں، اور اسے Assets resource folder میں رکھتے ہیں۔

![Swift](../../RESOURCE/004_img6.png)

ContentView میں تصویر دکھانے کے لیے Image استعمال کریں:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

کیونکہ تصویر کا اصل سائز نسبتاً بڑا ہے، اس لیے ہمیں دکھانے کے سائز کو کنٹرول کرنے کے لیے frame استعمال کرنا ہوگا۔

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

اس وقت ہمیں ایک مسئلہ نظر آئے گا:

اگر frame کی width اور height کا تناسب تصویر کے اصل تناسب سے مختلف ہو، تو تصویر بگڑ جائے گی۔

مثال کے طور پر:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

تصویر کو بگڑنے سے بچانے کے لیے، ہمیں scaledToFit استعمال کرنا ہوگا:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

scaledToFit کا کام یہ ہے:

دیے گئے frame کی حدود کے اندر، تصویر کے اصل تناسب کے مطابق اسے scale کرنا، اور تصویر کے مواد کو مکمل طور پر دکھانا۔

یہ تصویر کو زبردستی پورے frame میں کھینچ کر نہیں بھرتا، بلکہ width اور height کے تناسب کو برقرار رکھتے ہوئے proportional scaling کرتا ہے، یہاں تک کہ ایک کنارہ ٹھیک حد سے مل جائے۔

اس کا مطلب یہ ہے:

* اگر frame کی width کم ہو، تو تصویر width کو بنیاد بنا کر scale ہوگی۔
* اگر frame کی height کم ہو، تو تصویر height کو بنیاد بنا کر scale ہوگی۔
* تصویر ہمیشہ اپنا اصل تناسب برقرار رکھے گی، اور بگڑے گی نہیں۔

عام طور پر ایک سمت کا سائز سیٹ کرنا کافی ہوتا ہے۔ مثال کے طور پر:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

اس طرح سسٹم width 140 کے مطابق خودکار طور پر مناسب height کا حساب کرے گا، اور ساتھ ہی تصویر کا تناسب برقرار رکھے گا۔

اگر آپ کو visual ratio کو مقرر رکھنا ہو، یا پیچیدہ layout میں image کو compress ہونے سے بچانا ہو، تو width اور height دونوں کو ساتھ constrain کیا جا سکتا ہے۔

### گول کونے

اگر آپ چاہتے ہیں کہ تصویر rounded corners کے ساتھ دکھائی دے، تو آپ cornerRadius modifier استعمال کر سکتے ہیں:

```swift
.cornerRadius(10)
```

مثال کے طور پر:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image کے modifiers کے بعد cornerRadius(20) شامل کریں۔

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) کا مطلب ہے view کی boundary کو clip کرنا، اور 20 کے corner radius کو apply کرنا۔

Rounded corners شامل کرنے کے بعد، تصویر کے چاروں کونے arc جیسی شکل اختیار کر لیتے ہیں، جس سے visual effect زیادہ نرم اور جدید محسوس ہوتا ہے۔

یہ design style موجودہ interface design میں بہت عام ہے، مثلاً iOS کے app icons بھی rounded rectangle شکل استعمال کرتے ہیں (البتہ system icons میں continuous curvature والی superellipse شکل استعمال ہوتی ہے، صرف سادہ rounded corners نہیں)۔

### ذاتی معلومات

اب ہم تصویر کے بائیں جانب موجود ذاتی معلومات کے حصے کو بنانا شروع کرتے ہیں۔ Interface structure سے واضح ہے کہ ذاتی معلومات اور تصویر افقی طور پر ترتیب میں ہیں، اس لیے HStack استعمال کرنا ہوگا۔

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

ذاتی معلومات کا مواد عمودی ترتیب میں ہے۔

![Swift](../../RESOURCE/004_img11.png)

اس لیے، outer layer میں HStack استعمال ہوگا، ذاتی معلومات کے لیے VStack، اور متن کے مواد کے لیے Text استعمال ہوگا۔

بنیادی ساخت:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**فیلڈ کے عنوان کو bold کرنا**

فیلڈ کے نام اور فیلڈ کی value میں فرق دکھانے کے لیے، فیلڈ نام پر fontWeight استعمال کیا جا سکتا ہے:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**متن کو بائیں جانب align کرنا**

VStack ڈیفالٹ طور پر center aligned ہوتا ہے۔ اگر آپ چاہتے ہیں کہ تمام متن بائیں طرف align ہو، تو alignment مقرر کرنا ہوگا:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading کا مطلب ہے بائیں طرف alignment (left-to-right language environment میں)۔

![Swift](../../RESOURCE/004_img14.png)

### فاصلہ

اگر آپ چاہتے ہیں کہ ذاتی معلومات اور تصویر کے درمیان ایک مقررہ فاصلہ رہے، تو پہلے ہم Spacer سے خالی جگہ بنانے کا طریقہ سیکھ چکے ہیں:

```swift
Spacer()
    .frame(width: 10)
```

آپ HStack کے spacing parameter کو بھی استعمال کر سکتے ہیں:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 کا مطلب ہے کہ دونوں child views کے درمیان فاصلہ 30 pt ہوگا۔

![Swift](../../RESOURCE/004_img15.png)

**spacing کیا ہے؟**

VStack، HStack اور ZStack میں، spacing child views کے درمیان فاصلے کو کنٹرول کر سکتا ہے۔

مثال کے طور پر:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

VStack کے child views کے درمیان فاصلہ 10pt پر سیٹ ہو جائے گا۔

![Swift](../../RESOURCE/004_img16.png)

یہ بات یاد رکھنی چاہیے کہ spacing صرف "براہِ راست child views" پر اثر انداز ہوتا ہے، nested containers کے اندرونی layout پر نہیں۔

**فہرست کے اندر فاصلے کو کنٹرول کرنا**

اگر آپ چاہتے ہیں کہ مختلف fields کے درمیان فاصلہ بڑھے، تو سب سے سیدھا طریقہ یہ ہے کہ VStack پر spacing سیٹ کریں:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

اس طرح تمام child views کے درمیان فاصلہ 10 pt ہو جائے گا۔

لیکن interface دیکھنے سے ایک مسئلہ نظر آتا ہے:

Field groups کے درمیان فاصلہ موجود ہے، اور ساتھ ہی field name اور field value کے درمیان بھی وہی فاصلہ آ گیا ہے۔

اس کی وجہ یہ ہے کہ spacing موجودہ container کے تمام براہِ راست child views پر لاگو ہوتا ہے۔

اس structure میں، ہر Text outer VStack کا براہِ راست child view ہے، اس لیے spacing یکساں ہے۔

اگر آپ چاہتے ہیں کہ field groups کے درمیان فاصلہ ہو، لیکن field name اور field value کے درمیان default compact spacing برقرار رہے، تو "field name + field value" کو ایک منطقی اکائی سمجھ کر باہر سے ایک VStack میں لپیٹ دیں:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

اس وقت structure یہ ہو جائے گا کہ outer VStack کے درمیان spacing ہوگی، جبکہ inner VStack کے اندر default compact spacing رہے گی، اس لیے field name اور field value کے درمیان اضافی خالی جگہ ظاہر نہیں ہوگی۔

![Swift](../../RESOURCE/004_img18.png)

### ذاتی تعارف

اب ہم ذاتی تعارف کے حصے کو بناتے ہیں۔

Interface structure کے مطابق، تعارف کا مواد کئی سطروں کے متن پر مشتمل ہے، اور متن عمودی ترتیب میں ہے۔

![Swift](../../RESOURCE/004_img19.png)

اس لیے، VStack کے ساتھ Text استعمال کیا جا سکتا ہے:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**فاصلہ بڑھانا**

اب ذاتی معلومات اور ذاتی تعارف کے حصے نسبتاً بہت compact ہیں، اور style زیادہ خوبصورت نہیں لگتی۔

![Swift](../../RESOURCE/004_img20.png)

چونکہ یہ دونوں ایک ہی outer container کے اندر موجود ہیں، اس لیے outer container پر مجموعی spacing کنٹرول کی جا سکتی ہے:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

حاصل شدہ نتیجہ:

![Swift](../../RESOURCE/004_img21.png)

**فہرست کا فاصلہ**

ذاتی تعارف کے متن کے درمیان spacing سیٹ کرنے کے لیے spacing استعمال کریں:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### ذاتی ریزیومے مکمل کرنا

اب ہمارے ذاتی ریزیومے کا بنیادی فریم ورک مکمل ہو چکا ہے۔

![Swift](../../RESOURCE/004_img.png)

### اسکرول ویو

اس وقت صفحے کی ساخت VStack استعمال کر رہی ہے۔ جب تعارفی متن کم ہو تو کوئی مسئلہ نہیں، لیکن اگر اسے 20، 30 یا اس سے بھی زیادہ سطروں تک بڑھا دیا جائے، تو content کی height اسکرین سے باہر نکل جائے گی۔

مثال کے طور پر:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

اس وقت دو چیزیں سامنے آئیں گی:

* نیچے کا مواد کٹ جائے گا
* صفحہ scroll نہیں ہوگا

یہ VStack کا مسئلہ نہیں ہے۔ VStack صرف ایک layout container ہے، یہ خودکار طور پر scrolling کی صلاحیت فراہم نہیں کرتا۔

**ScrollView کیا ہے**

ScrollView ایک scrollable container ہے، جو ایسے مواد کے لیے موزوں ہے جو اسکرین کے سائز سے زیادہ ہو جائے۔ مثال کے طور پر عمودی یا افقی فہرستیں۔

بنیادی ساخت:

```swift
ScrollView {
    ...
}
```

اگر آپ scrolling effect حاصل کرنا چاہتے ہیں، تو پورے صفحے کے مواد کو ScrollView کے اندر لپیٹنا ہوگا:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

اس طرح، پورا صفحہ ایک scrollable area بن جائے گا۔ جب مواد اسکرین کی height سے بڑھ جائے گا، تو صفحہ قدرتی طور پر scroll ہو سکے گا۔

ScrollView ڈیفالٹ طور پر scroll bar indicator دکھاتا ہے۔ اگر آپ scroll bar کو چھپانا چاہتے ہیں، تو آپ یہ سیٹنگ استعمال کر سکتے ہیں:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## مکمل کوڈ

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```