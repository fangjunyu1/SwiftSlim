# جانوروں کی انسائیکلوپیڈیا 

اس سبق میں، ہم کسٹم ویو اور ڈیٹا پاس کرنے کی مشق جاری رکھیں گے۔

ہم ایک سادہ جانوروں کی انسائیکلوپیڈیا ویو بنائیں گے۔ صفحے پر پانچ جانور دکھائے جائیں گے۔ جب کسی جانور پر کلک کیا جائے گا تو ایک تفصیل ویو پاپ اَپ ہوگا، جس میں اس جانور کی تصویر، تقسیم کا علاقہ، رہائش گاہ اور تفصیل دکھائی جائے گی۔

حاصل ہونے والا نتیجہ:

![view](../../../Resource/029_view.png)

اس کیس کے ذریعے ہم ڈیٹا اسٹرکچر، فہرست دکھانے، کلک انٹریکشن اور Sheet پاپ اَپ ویو کے باہمی استعمال کی مشق کر سکتے ہیں۔

## تصویری مواد تیار کریں

سب سے پہلے، ہمیں پانچ جانوروں کی تصاویر تیار کرنی ہوں گی:

- ڈالفن: `dolphin.jpg`
- زرافہ: `giraffe.jpg`
- شیر: `lion.jpg`
- پانڈا: `panda.jpg`
- قطبی ریچھ: `polarBear.jpg`

آپ درج ذیل تصویری مواد استعمال کر سکتے ہیں:

[ڈالفن](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)، [زرافہ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)، [شیر](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)، [پانڈا](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)، [قطبی ریچھ](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

تصاویر ڈاؤن لوڈ کرنے کے بعد، انہیں Xcode پروجیکٹ کے `Assets` ریسورس فولڈر میں گھسیٹ کر شامل کریں۔

![assets](../../../Resource/029_assets.png)

یہ بات نوٹ کریں کہ کوڈ میں تصویر استعمال کرتے وقت عموماً `.jpg` لاحقہ لکھنے کی ضرورت نہیں ہوتی۔

مثال کے طور پر، اگر تصویر ریسورس کا نام `dolphin` ہے، تو کوڈ میں یوں لکھیں:

```swift
Image("dolphin")
```

اگر تصویر کا نام غلط لکھا گیا تو تصویر صحیح طور پر ظاہر نہیں ہوگی۔

نوٹ: اوپر دیا گیا تصویری مواد وکیمیڈیا پروجیکٹ سے ہے۔ استعمال کرتے وقت اصل تصویر کے لنک اور ماخذ کی معلومات برقرار رکھنا بہتر ہے۔

## جانور کا اسٹرکچر بنائیں

اس صفحے میں ہر جانور کی کئی معلومات ہوں گی:

- جانور کا نام
- جانور کی تصویر
- جانور کا ایموجی
- تقسیم کا علاقہ
- رہائش گاہ
- جانور کی تفصیل

اگر ہم ان معلومات کو بہت سے الگ الگ ویریبلز میں پھیلا دیں، تو کوڈ کافی بے ترتیب ہو جائے گا۔ اس لیے ہم ایک `Animal` اسٹرکچر بنا سکتے ہیں، تاکہ ایک جانور کی تمام معلومات ایک جگہ رکھی جا سکیں۔

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

اس کوڈ میں:

- `id`: جانور کی منفرد شناخت۔
- `name`: جانور کا نام۔
- `imageName`: جانور کی تصویر کا نام۔
- `avatarEmoji`: جانور کا ایموجی۔
- `distributionArea`: تقسیم کا علاقہ۔
- `habitat`: رہائش گاہ۔
- `animalDescription`: جانور کی تفصیل۔

ان میں:

```swift
let id = UUID()
```

`id` ہر جانور کی شناخت کے لیے استعمال ہوتا ہے۔ کیونکہ آگے ہم `ForEach` سے جانوروں کی فہرست دکھائیں گے، اور `.sheet(item:)` کے ذریعے منتخب جانور کے مطابق تفصیل پاپ اَپ کریں گے، اس لیے `Animal` کو `Identifiable` پروٹوکول فالو کرنا ہوگا۔

`Identifiable` کا کام SwiftUI کو یہ بتانا ہے کہ ہر جانور کے پاس ایک ایسا `id` ہے جس سے اس کی شناخت الگ کی جا سکتی ہے۔

## جانوروں کا ڈیٹا بنائیں

اس کے بعد، ہم `ContentView` میں جانوروں کی ایک array بنائیں گے۔

اس array میں پانچ `Animal` محفوظ ہوں گے، اور ہر `Animal` ایک جانور کی نمائندگی کرے گا۔

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // ڈالفن
        Animal(
            name: "ڈالفن",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "دنیا بھر کے گرم اور معتدل سمندر۔",
            habitat: "سمندر، ساحلی پانی، اور کچھ بڑے دریا۔",
            animalDescription: "ڈالفن ذہین سمندری ممالیہ ہیں۔ یہ گروہوں میں رہتی ہیں، آوازوں سے رابطہ کرتی ہیں، اور اپنے کھیلنے والے رویے کے لیے مشہور ہیں۔"
        ),
        // زرافہ
        Animal(
            name: "زرافہ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "افریقہ کے سوانا اور کھلے جنگلات۔",
            habitat: "گھاس کے میدان، سوانا، اور کھلے جنگلات۔",
            animalDescription: "زرافے خشکی کے سب سے لمبے جانور ہیں۔ ان کی گردنیں اور ٹانگیں لمبی ہوتی ہیں، اور یہ عموماً اونچے درختوں کے پتے کھاتے ہیں۔"
        ),
        // شیر
        Animal(
            name: "شیر",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "زیادہ تر صحارا کے جنوب میں افریقہ میں پائے جاتے ہیں، جبکہ مغربی بھارت میں ان کی ایک چھوٹی آبادی موجود ہے۔",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "شیر طاقتور بڑے بلی نما جانور ہیں۔ یہ عموماً پرائڈ کہلانے والے گروہوں میں رہتے ہیں، اور اکثر جانوروں کی دنیا کے بادشاہ کہلاتے ہیں۔"
        ),
        // پانڈا
        Animal(
            name: "پانڈا",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "وسطی چین کے پہاڑی جنگلات۔",
            habitat: "ٹھنڈے اور نم پہاڑی علاقوں کے بانس کے جنگلات۔",
            animalDescription: "پانڈا ایسے ریچھ ہیں جو اپنی سیاہ و سفید کھال کی وجہ سے مشہور ہیں۔ یہ بنیادی طور پر بانس کھاتے ہیں اور دنیا کے سب سے آسانی سے پہچانے جانے والے جانوروں میں سے ہیں۔"
        ),
        // قطبی ریچھ
        Animal(
            name: "قطبی ریچھ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "قطبِ شمالی کے آس پاس کے آرکٹک علاقے۔",
            habitat: "سمندری برف، ساحلی علاقے، اور سرد آرکٹک ماحول۔",
            animalDescription: "قطبی ریچھ بڑے ریچھ ہیں جو سرد ماحول کے مطابق ڈھلے ہوئے ہیں۔ یہ مضبوط تیراک ہوتے ہیں اور سیل کا شکار کرنے کے لیے بنیادی طور پر سمندری برف پر انحصار کرتے ہیں۔"
        )
    ]

    var body: some View {
        Text("جانوروں کی انسائیکلوپیڈیا")
    }
}
```

یہاں `animals` ایک array ہے:

```swift
let animals: [Animal]
```

`[Animal]` کا مطلب ہے کہ اس array میں کئی `Animal` محفوظ ہیں۔

یعنی `animals` ایک جانور نہیں، بلکہ جانوروں کا ایک مجموعہ ہے۔

## جانوروں کی فہرست دکھائیں

اب ہم `ForEach` استعمال کر کے جانوروں کی فہرست دکھا سکتے ہیں۔

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

ظاہری نتیجہ:

![view](../../../Resource/029_view1.png)

اس کوڈ میں:

```swift
ForEach(animals) { animal in
    ...
}
```

اس کا مطلب ہے کہ `animals` array کو iterate کیا جا رہا ہے۔

ہر loop میں `animal` اس جانور کو ظاہر کرتا ہے جو اس وقت دکھایا جا رہا ہے۔

مثال کے طور پر، پہلی loop میں `animal` ڈالفن ہے؛ دوسری loop میں `animal` زرافہ ہے۔

اس لیے ہم درج ذیل طریقے سے موجودہ جانور کی معلومات دکھا سکتے ہیں:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

اس طرح پانچوں جانور دکھائے جا سکتے ہیں۔

## جانوروں کی فہرست کو کلک کے قابل بنائیں

اب فہرست دکھائی دے رہی ہے، لیکن ابھی اسے کلک نہیں کیا جا سکتا۔

اگر ہم چاہتے ہیں کہ کسی جانور پر کلک کرنے کے بعد تفصیل پاپ اَپ ہو، تو پہلے ہمیں “موجودہ منتخب جانور” کو ریکارڈ کرنا ہوگا۔

اس لیے `ContentView` میں ایک state ویریبل شامل کریں:

```swift
@State private var selectedAnimal: Animal? = nil
```

یہاں `selectedAnimal` ایک optional قسم `Animal?` ہے۔

اس کا مطلب ہے کہ اس میں ایک جانور ہو بھی سکتا ہے، اور نہیں بھی ہو سکتا۔

اس کی default value `nil` ہے، جس کا مطلب ہے کہ شروع میں کوئی جانور منتخب نہیں ہے۔

پھر ہم ہر جانور والی row کو `Button` میں بدل دیں گے:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

اہم بات یہ کوڈ لائن ہے:

```swift
selectedAnimal = animal
```

جب صارف کسی جانور پر کلک کرتا ہے، تو ہم اس جانور کو `selectedAnimal` میں محفوظ کر دیتے ہیں۔

مثال کے طور پر، صارف ڈالفن پر کلک کرے تو `selectedAnimal` میں ڈالفن محفوظ ہوگی۔

صارف پانڈا پر کلک کرے تو `selectedAnimal` میں پانڈا محفوظ ہوگا۔

یعنی `selectedAnimal` یہ ریکارڈ کرنے کے لیے استعمال ہوتا ہے کہ صارف نے اس وقت کس جانور پر کلک کیا ہے۔

## Sheet پاپ اَپ ویو

اب ہم button کے ذریعے “موجودہ کلک کیے گئے جانور” کو ریکارڈ کر سکتے ہیں۔

اگلا قدم ایک پاپ اَپ ویو بنانا ہے، جو جانور کی تفصیل دکھائے گا۔

![view](../../../Resource/029_view2.png)

SwiftUI میں اس پاپ اَپ اثر کو `Sheet` کے ذریعے بنایا جا سکتا ہے۔

`Sheet` کو ایک عارضی طور پر ظاہر ہونے والا صفحہ سمجھا جا سکتا ہے۔ یہ موجودہ صفحے کے اوپر دکھائی دیتا ہے، اور صارف مواد دیکھنے کے بعد اسے نیچے سوائپ کر کے بند کر سکتا ہے۔

## Sheet مثال

جانور کی اصل تفصیل دکھانے سے پہلے، ہم ایک سادہ مثال سے سمجھیں گے کہ `Sheet` کیسے پاپ اَپ ہوتا ہے۔

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet دکھائیں")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet ویو")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

ظاہری نتیجہ:

![view](../../../Resource/029_view3.png)

اس کوڈ میں ہم نے ایک Boolean value بنائی ہے:

```swift
@State private var showSheet = false
```

`showSheet` کی default value `false` ہے، یعنی شروع میں `Sheet` نہیں دکھایا جاتا۔

جب button پر کلک کیا جاتا ہے:

```swift
showSheet.toggle()
```

`toggle()` کا مطلب Boolean value کو بدلنا ہے۔

اگر پہلے value `false` تھی، تو `toggle()` کال کرنے کے بعد یہ `true` ہو جائے گی۔

اگر پہلے value `true` تھی، تو `toggle()` کال کرنے کے بعد یہ `false` ہو جائے گی۔

اس لیے button پر کلک کرنے کے بعد `showSheet`، `false` سے `true` بن جائے گا۔

جب `showSheet`، `true` ہو جائے گا، تو درج ذیل کوڈ `Sheet` پاپ اَپ کرے گا:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ویو")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

اس کوڈ کا مطلب ہے: جب `showSheet`، `true` ہو تو ایک `Sheet` پاپ اَپ کیا جائے، اور اس `Sheet` میں `Text("Sheet ویو")` دکھایا جائے۔

ظاہری نتیجہ:

![view](../../../Resource/029_view4.png)

یہ طریقہ fixed content پاپ اَپ کرنے کے لیے مناسب ہے۔

مثلاً button پر کلک کرنے کے بعد settings page، explanation page، prompt page وغیرہ دکھائے جا سکتے ہیں۔

### Sheet کہاں لگایا جاتا ہے

اگرچہ `Sheet` ایک پاپ اَپ ویو ہے، لیکن SwiftUI میں یہ `Text()` یا `Image()` کی طرح ایک آزاد ویو کے طور پر نہیں لکھا جاتا، بلکہ ایک view modifier کے طور پر استعمال ہوتا ہے۔

یعنی `.sheet(...)`، `.font()`، `.padding()` اور `.shadow()` جیسے modifiers کی طرح ہے؛ اسے بھی کسی ویو کے بعد لگانا ہوتا ہے۔

مثال:

```swift
Button("Sheet دکھائیں") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ویو")
}
```

اس مثال میں `.sheet` کو `Button` کے بعد لگایا گیا ہے۔

جب `showSheet`، `true` ہو جائے گا، تو SwiftUI `Sheet` پاپ اَپ کرے گا اور braces کے اندر موجود content دکھائے گا:

```swift
Text("Sheet ویو")
```

تاہم اصل development میں، اگر ایک صفحے میں کئی buttons ہوں، تو عموماً ہر button کے ساتھ الگ `.sheet` نہیں لگایا جاتا۔

زیادہ عام طریقہ یہ ہے کہ `.sheet` کو outer view کے بعد لگایا جائے۔

مثال:

```swift
VStack {
    Button("Sheet دکھائیں") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ویو")
}
```

button کا کام `showSheet` کو بدلنا ہے، جبکہ outer view یہ طے کرتا ہے کہ `showSheet`، `true` ہے یا نہیں، اور اسی کے مطابق `Sheet` پاپ اَپ کرتا ہے۔

## Optional value سے Sheet bind کرنا

پچھلے حصے میں ہم نے یہ طریقہ سیکھا تھا:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ویو")
}
```

یہ طریقہ کسی fixed page کے show اور hide کو کنٹرول کرنے کے لیے مناسب ہے۔

لیکن جانوروں کی انسائیکلوپیڈیا کے کیس میں ہمیں صرف یہ نہیں جاننا کہ “کیا `Sheet` پاپ اَپ ہو”، بلکہ یہ بھی جاننا ہے کہ “کس جانور پر کلک کیا گیا ہے”۔

مثال:

صارف ڈالفن پر کلک کرے تو `Sheet` میں ڈالفن کی تفصیل دکھائی جانی چاہیے۔

صارف پانڈا پر کلک کرے تو `Sheet` میں پانڈا کی تفصیل دکھائی جانی چاہیے۔

اس لیے یہاں `Sheet` کا ایک دوسرا طریقہ زیادہ مناسب ہے:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet میں دکھایا جانے والا content
}
```

اس کوڈ میں `Sheet` ایک optional value `selectedAnimal` سے bind ہے۔

یہاں نوٹ کریں کہ `item:` کے بعد `$selectedAnimal` لکھا گیا ہے، `selectedAnimal` نہیں۔

کیونکہ `Sheet` صرف `selectedAnimal` کی value نہیں پڑھتا، بلکہ اس کی تبدیلی کے مطابق یہ بھی طے کرتا ہے کہ پاپ اَپ ہونا ہے یا نہیں۔

اس کوڈ کو یوں سمجھا جا سکتا ہے:

- جب `selectedAnimal`، `nil` ہو تو `Sheet` نہیں دکھایا جاتا۔
- جب `selectedAnimal` میں value ہو تو `Sheet` دکھایا جاتا ہے۔
- جب `Sheet` بند ہوتا ہے، تو SwiftUI دوبارہ `selectedAnimal` کو `nil` بنا دیتا ہے۔

SwiftUI، `selectedAnimal` میں محفوظ جانور کو braces کے اندر موجود `animal` تک پہنچا دیتا ہے۔

یعنی `.sheet(item:)` صرف پاپ اَپ کو کنٹرول نہیں کرتا، بلکہ selected data کو `Sheet` کے اندر بھی pass کرتا ہے۔

## Sheet سے جانور کا نام دکھائیں

ابھی ہم جلدی سے complex detail view نہیں بنائیں گے۔

کوڈ کو آسانی سے سمجھنے کے لیے، پہلے ہم `Sheet` میں موجودہ جانور کا نام دکھائیں گے۔

`VStack` کے باہر `.sheet(item:)` شامل کریں:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

یہاں سب سے اہم حصہ یہ کوڈ ہے:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

جب `selectedAnimal` میں value ہو، تو `Sheet` پاپ اَپ ہوگا۔

braces کے اندر موجود `animal` ہی موجودہ منتخب جانور ہے۔

اس لیے:

```swift
Text(animal.name)
```

یہ موجودہ کلک کیے گئے جانور کا نام دکھائے گا۔

مثال کے طور پر، `ڈالفن` پر کلک کرنے سے Sheet میں `ڈالفن` دکھائی دے گا۔

`پانڈا` پر کلک کرنے سے `Sheet` میں `پانڈا` دکھائی دے گا۔

اس طرح ہم نے مختلف جانوروں پر کلک کر کے مختلف جانوروں کے نام پاپ اَپ کرنے کا اثر بنا لیا۔

جانور کا نام دکھانا:

![view](../../../Resource/029_view5.png)

لیکن جانور کی تفصیل میں صرف نام نہیں ہونا چاہیے؛ اس میں نام، تقسیم کا علاقہ، رہائش گاہ اور تفصیل بھی ہونی چاہیے۔

اگر یہ تمام کوڈ `.sheet` کے اندر لکھ دیا جائے تو کوڈ بہت لمبا ہو جائے گا اور پڑھنا مشکل ہوگا۔

اس لیے آگے ہم ایک نیا custom view بنائیں گے، جو خاص طور پر جانور کی تفصیل دکھانے کا ذمہ دار ہوگا۔

## جانور کی تفصیل کا ویو بنائیں

اب ہم ایک نیا custom view `AnimalDetailView` بنائیں گے۔

یہ ویو ایک `Animal` وصول کرے گا اور جانور کی تفصیل دکھائے گا۔

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**تقسیم کا علاقہ** ：\(animal.distributionArea)")

                    Divider()

                    Text("**رہائش گاہ** ：\(animal.habitat)")

                    Divider()

                    Text("**جانور کی تفصیل** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

ظاہری نتیجہ:

![view](../../../Resource/029_view2.png)

یہاں اہم نکتہ یہ ہے:

```swift
var animal: Animal
```

اس کا مطلب ہے کہ `AnimalDetailView` کو باہر سے ایک جانور وصول کرنا ہوگا۔

جانور وصول کرنے کے بعد، detail view اس جانور کی مختلف معلومات استعمال کر سکتا ہے:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

یعنی `AnimalDetailView` صرف pass کیے گئے جانور کو دکھانے کا ذمہ دار ہے۔

### Markdown میں bold text

detail view میں ہم نے یہ کوڈ لکھا ہے:

```swift
Text("**رہائش گاہ:** \(animal.habitat)")
```

یہاں دو اہم نکات ہیں۔

پہلا، `**رہائش گاہ:**` نے `Markdown` syntax استعمال کیا ہے۔ دو asterisks کے درمیان موجود text bold دکھائی دیتا ہے۔

دوسرا، `\()` string interpolation ہے، جس سے variable کی value text میں دکھائی جا سکتی ہے۔

اس کوڈ کا مطلب ہے کہ پہلے bold `رہائش گاہ:` دکھایا جائے، پھر اس جانور کی رہائش گاہ دکھائی جائے۔

## Sheet میں detail view دکھائیں

`AnimalDetailView` بنانے کے بعد، ہم `ContentView` میں واپس جا سکتے ہیں اور `Sheet` کے اندر موجود پرانے name view کو detail view سے بدل سکتے ہیں۔

پہلے یہ تھا:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

اب اسے یوں بدلیں:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

یہاں `animal:`، `AnimalDetailView` کا parameter name ہے۔

بعد والا `animal` وہ موجودہ جانور ہے جو `.sheet(item:)` کے ذریعے pass کیا گیا ہے۔

یعنی موجودہ کلک کیے گئے جانور کو `AnimalDetailView` میں دکھانے کے لیے pass کیا جا رہا ہے۔

مکمل structure:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

جب صارف جانور پر کلک کرتا ہے:

```swift
selectedAnimal = animal
```

`selectedAnimal`، `nil` سے ایک مخصوص جانور بن جاتا ہے۔ جب `Sheet` دیکھتا ہے کہ `selectedAnimal` میں value ہے، تو ویو پاپ اَپ ہو جاتا ہے۔

`Sheet`، `selectedAnimal` میں موجود جانور کو `AnimalDetailView` ویو میں pass کرتا ہے، اور `AnimalDetailView` جانور کی تفصیل دکھاتا ہے۔

اس طرح ہم نے جانوروں کی فہرست پر کلک کر کے متعلقہ جانور کی تفصیل پاپ اَپ کرنے کی functionality مکمل کر لی۔

## Sheet کی دو لکھنے کی صورتوں کا فرق

اب ہم `.sheet(item:)` استعمال کر کے جانور کی detail view دکھانے کا کام مکمل کر چکے ہیں۔

یہاں `Sheet` کی دو عام writing styles کا مختصر خلاصہ کیا جا سکتا ہے۔

### پہلی صورت Boolean value سے bind کرنا ہے

```swift
@State private var showSheet = false

Button("Sheet دکھائیں") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ویو")
}
```

یہ طریقہ fixed content پاپ اَپ کرنے کے لیے مناسب ہے، مثلاً settings page، explanation page، prompt page وغیرہ۔

`showSheet` ایک Boolean value ہے، جس کی صرف دو states ہوتی ہیں: `true` اور `false`۔

جب `showSheet`، `true` ہو تو `Sheet` دکھائی دیتا ہے۔

جب `showSheet`، `false` ہو تو `Sheet` نہیں دکھائی دیتا۔

### دوسری صورت optional value سے bind کرنا ہے

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

یہ طریقہ selected data کے مطابق مختلف content پاپ اَپ کرنے کے لیے مناسب ہے۔

اس سبق میں ہم مختلف جانوروں پر کلک کرتے ہیں اور مختلف جانوروں کی تفصیل دکھانی ہوتی ہے، اس لیے `.sheet(item:)` استعمال کرنا زیادہ مناسب ہے۔

## مکمل کوڈ

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // جانور کا نام
    let name: String
    
    // جانور کی تصویر
    let imageName: String
    
    // جانور کا لیبل symbol
    let avatarEmoji: String
    
    // تقسیم کا علاقہ
    let distributionArea: String
    
    // رہائش گاہ
    let habitat: String
    
    // جانور کی تفصیل
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // ڈالفن
        Animal(
            name: "ڈالفن",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "دنیا بھر کے گرم اور معتدل سمندر۔",
            habitat: "سمندر، ساحلی پانی، اور کچھ بڑے دریا۔",
            animalDescription: "ڈالفن ذہین سمندری ممالیہ ہیں۔ یہ گروہوں میں رہتی ہیں، آوازوں سے رابطہ کرتی ہیں، اور اپنے کھیلنے والے رویے کے لیے مشہور ہیں۔"
        ),
        // زرافہ
        Animal(
            name: "زرافہ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "افریقہ کے سوانا اور کھلے جنگلات۔",
            habitat: "گھاس کے میدان، سوانا، اور کھلے جنگلات۔",
            animalDescription: "زرافے خشکی کے سب سے لمبے جانور ہیں۔ ان کی گردنیں اور ٹانگیں لمبی ہوتی ہیں، اور یہ عموماً اونچے درختوں کے پتے کھاتے ہیں۔"
        ),
        // شیر
        Animal(
            name: "شیر",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "زیادہ تر صحارا کے جنوب میں افریقہ میں پائے جاتے ہیں، جبکہ مغربی بھارت میں ان کی ایک چھوٹی آبادی موجود ہے۔",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "شیر طاقتور بڑے بلی نما جانور ہیں۔ یہ عموماً پرائڈ کہلانے والے گروہوں میں رہتے ہیں، اور اکثر جانوروں کی دنیا کے بادشاہ کہلاتے ہیں۔"
        ),
        // پانڈا
        Animal(
            name: "پانڈا",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "وسطی چین کے پہاڑی جنگلات۔",
            habitat: "ٹھنڈے اور نم پہاڑی علاقوں کے بانس کے جنگلات۔",
            animalDescription: "پانڈا ایسے ریچھ ہیں جو اپنی سیاہ و سفید کھال کی وجہ سے مشہور ہیں۔ یہ بنیادی طور پر بانس کھاتے ہیں اور دنیا کے سب سے آسانی سے پہچانے جانے والے جانوروں میں سے ہیں۔"
        ),
        // قطبی ریچھ
        Animal(
            name: "قطبی ریچھ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "قطبِ شمالی کے آس پاس کے آرکٹک علاقے۔",
            habitat: "سمندری برف، ساحلی علاقے، اور سرد آرکٹک ماحول۔",
            animalDescription: "قطبی ریچھ بڑے ریچھ ہیں جو سرد ماحول کے مطابق ڈھلے ہوئے ہیں۔ یہ مضبوط تیراک ہوتے ہیں اور سیل کا شکار کرنے کے لیے بنیادی طور پر سمندری برف پر انحصار کرتے ہیں۔"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**تقسیم کا علاقہ** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**رہائش گاہ** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**جانور کی تفصیل** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## خلاصہ

اس سبق میں ہم نے جانوروں کی ایک سادہ انسائیکلوپیڈیا page مکمل کیا۔

ہم نے پہلے `Animal` اسٹرکچر سے جانوروں کی معلومات محفوظ کیں، پھر array میں پانچ جانور محفوظ کیے، اور آخر میں `ForEach` سے جانوروں کی فہرست دکھائی۔

جب صارف کسی جانور پر کلک کرتا ہے، تو ہم اس جانور کو `selectedAnimal` میں محفوظ کرتے ہیں:

```swift
selectedAnimal = animal
```

جب `selectedAnimal` میں value ہو تو `.sheet(item:)` detail view پاپ اَپ کرتا ہے، اور selected animal کو `AnimalDetailView` میں pass کرتا ہے۔

اس سبق میں سب سے اہم چیز interface style نہیں، بلکہ اس data passing route کو سمجھنا ہے:

```swift
جانور پر کلک → selectedAnimal جانور محفوظ کرتا ہے → Sheet پاپ اَپ ہوتا ہے → AnimalDetailView تفصیل دکھاتا ہے
```

اس route کو سمجھنے کے بعد، آپ آگے اسی طرح کی مزید functionality بنا سکتے ہیں، مثلاً product detail، course detail، article detail، contact detail وغیرہ۔
