# اقوال کی گردش

اس سبق میں ہم ایک "اقوال کی گردش" (Quote Carousel) feature بنائیں گے، اور ساتھ ہی Swift کی بنیادی معلومات جیسے array اور conditional statements (`if-else`) کو گہرائی سے سیکھیں گے۔

ہم یہ دکھائیں گے کہ کئی اقوال کو کیسے محفوظ کیا جائے، اور button interaction کے ذریعے انہیں بار بار کیسے بدلا جائے۔

![alt text](../../RESOURCE/011_word.png)

## قول دکھانا

سب سے پہلے، ہمیں SwiftUI میں ایک قول دکھانے کی ضرورت ہے۔

سب سے آسان طریقہ `Text` view استعمال کرنا ہے:

```swift
Text("Slow progress is still progress.")
```

یہ code صرف ایک طے شدہ قول دکھا سکتا ہے۔ اگر ہم کئی اقوال دکھانا چاہتے ہیں اور ان کے درمیان تبدیلی بھی چاہتے ہیں، تو ہمیں انہیں محفوظ کرنا ہوگا۔

لیکن عام string variable صرف ایک ہی قول محفوظ کر سکتا ہے:

```swift
let sayings = "Slow progress is still progress."
```

اگر ہمیں کئی اقوال محفوظ کرنے ہوں، تو ہر قول کے لیے الگ variable بنانا پڑے گا:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

لیکن عملی development میں، یہ طریقہ نہ صرف پیچیدہ ہے، بلکہ چونکہ ہر variable ایک دوسرے سے الگ ہے، اس لیے ہم لچکدار carousel effect نہیں بنا سکتے۔

کئی اقوال کو آسانی سے manage کرنے کے لیے، ہمیں ایک data structure استعمال کرنا ہوگا جو انہیں ایک ساتھ محفوظ کرے، اور یہی array ہے۔

Array استعمال کرنے کے بعد، اوپر والا code یوں لکھا جا سکتا ہے:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**نوٹ: programming conventions میں، کئی elements محفوظ کرنے والے array variable کا نام عموماً جمع (plural) میں رکھا جاتا ہے، جیسے sayings، تاکہ اس کے collection ہونے کا احساس ہو۔**

## Array

Swift میں array ایک ایسا مجموعہ ہے جو ترتیب کے ساتھ elements محفوظ کرتا ہے، اور اسے square brackets `[]` کے ذریعے ظاہر کیا جاتا ہے۔

```swift
[]
```

Array کے اندر ایک ہی type کے کئی elements ہو سکتے ہیں، اور انہیں comma `,` سے الگ کیا جاتا ہے۔

مثلاً:

```swift
[101, 102, 103, 104, 105]
```

آپ array کو آسان انداز میں ایک ٹرین کی قطار کی طرح سمجھ سکتے ہیں:

![Array](../../RESOURCE/011_array1.png)

پوری ٹرین اس array object کی نمائندگی کرتی ہے، اور ہر ڈبہ ترتیب سے جڑا ہوتا ہے۔

### Index اور element تک رسائی

چونکہ array میں ترتیب ہوتی ہے، system اس ترتیب کے ذریعے کسی خاص element تک پہنچ سکتا ہے۔ اسی ترتیب کے نمبر کو index کہا جاتا ہے۔

Swift میں (اور زیادہ تر programming languages میں) array کا index `0` سے شروع ہوتا ہے، `1` سے نہیں۔ اس کا مطلب یہ ہے کہ array کا پہلا element index `0` پر ہوتا ہے، دوسرا `1` پر، اور اسی طرح آگے۔

![Array](../../RESOURCE/011_array2.png)

اگر array کے کسی خاص element تک پہنچنا ہو، تو array کے نام کے بعد square brackets لگا کر اس کے اندر مطلوبہ index لکھ دیتے ہیں۔

مثلاً:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

اگر آپ array کی درست حد سے باہر کا index استعمال کریں، تو "Index Out of Range" کی error پیدا ہوگی۔ اس لیے array access کرتے وقت احتیاط ضروری ہے، اور index کا درست حد میں ہونا لازمی ہے۔

**Index Out of Range**

مثلاً، اگر array میں صرف 5 elements ہوں، تو درست index کی range `0` سے `4` تک ہوگی۔ اگر ہم `sayings[5]` تک پہنچنے کی کوشش کریں، تو program متعلقہ "ڈبہ" نہیں ڈھونڈ پائے گا، اور "index out of range" error آ جائے گی، جس سے app crash کر سکتی ہے۔

![Array](../../RESOURCE/011_array3.png)

### Array پر عمل کرنا

Array صرف static تعریف تک محدود نہیں، بلکہ اس میں element شامل کرنا، حذف کرنا، تبدیل کرنا، اور array کی length معلوم کرنا بھی ممکن ہے۔

نوٹ: اگر array کو modify کرنا ہو، تو اسے `let` constant کی بجائے `var` variable کے ساتھ declare کرنا ہوگا۔

**1. نیا element شامل کرنا**

`append` method کے ذریعے array کے آخر میں element شامل کیا جا سکتا ہے:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. element حذف کرنا**

`remove(at:)` method کے ذریعے array کے کسی مخصوص element کو حذف کیا جا سکتا ہے:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. element تبدیل کرنا**

Index کے ذریعے array کے کسی element کو براہِ راست بدلا جا سکتا ہے:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. array کی length معلوم کرنا**

`count` property کے ذریعے array میں موجود elements کی تعداد معلوم کی جا سکتی ہے:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Array استعمال کرکے قول دکھانا

کئی اقوال دکھانے کے لیے ہم انہیں array میں محفوظ کر سکتے ہیں، اور پھر index کے ذریعے کسی خاص قول کو پڑھ کر دکھا سکتے ہیں۔

سب سے پہلے `ContentView` میں ایک `sayings` array بنائیں، پھر `Text` view میں index کے ذریعے متعلقہ قول دکھائیں:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

یہاں `sayings[0]` سے مراد array کا پہلا قول ہے۔

اگر آپ دوسرا قول دکھانا چاہیں، تو square brackets کے اندر index بدل دیں:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### قول کے index کو define کرنا

اگر ہمیں اقوال کو dynamically بدلنا ہو، تو ہم `Text` میں index کو hard-code نہیں کر سکتے۔

اس کے لیے ہمیں ایک الگ variable بنانا ہوگا، جو موجودہ دکھائے جانے والے index کو محفوظ کرے۔

SwiftUI میں ہم `@State` کے ذریعے ایک mutable index declare کر سکتے ہیں:

```swift
@State private var index = 0
```

SwiftUI `@State` سے لپٹے ہوئے variable کو monitor کرتا ہے۔ جب `index` بدلتا ہے، SwiftUI view کو دوبارہ render کرتی ہے، اور متعلقہ قول دکھاتی ہے۔

پھر ہم `sayings[index]` کے ذریعے array سے dynamic قول حاصل کریں گے:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

جب `index` کی value بدلے گی، `Text` مختلف قول دکھائے گا۔

### Button کے ذریعے index کنٹرول کرنا

اقوال کی تبدیلی کو control کرنے کے لیے ہم `Button` استعمال کر سکتے ہیں۔ ہر بار button دبانے پر `index` میں `1` کا اضافہ ہو:

```swift
Button("Next") {
    index += 1
}
```

جب ہم button دبائیں گے، تو `index` کی value `0` سے `1` ہو جائے گی، view refresh ہوگی، اور `Text(sayings[index])` اگلا قول پڑھے گا۔

لیکن یہاں ایک ممکنہ مسئلہ ہے: اگر button بار بار دبایا جائے، تو `index` array کی حد سے باہر جا سکتا ہے، اور اس سے index out of range error آ سکتی ہے۔ مثال کے طور پر، جب `index` کی value `5` ہو جائے (جبکہ درست range `0` سے `4` ہے)، تو program crash ہو جائے گا۔

Array index out of range سے بچنے کے لیے ہمیں condition control لانا ہوگا، تاکہ `index` array کی حد سے باہر نہ جائے۔ اس کے لیے `if-else` statement استعمال کی جا سکتی ہے۔

## Conditional control: `if-else` statements

`if-else` statement Swift کی سب سے عام conditional branch statements میں سے ہے۔ یہ کسی condition کے درست یا غلط ہونے کی بنیاد پر مختلف code blocks چلاتی ہے۔

بنیادی structure:

```swift
if condition {
    // حالت درست ہونے پر، کوڈ کو عمل میں لایا جائے گا۔
} else {
    // حالت غلط ہونے پر کوڈ پر عمل درآمد کیا جاتا ہے۔
}
```

`if` statement میں `condition` ایک Boolean value ہوتی ہے (`Bool` type)، یعنی `true` یا `false`۔ اگر condition `true` ہو، تو `if` والا حصہ چلے گا، ورنہ `else` والا حصہ چلے گا۔

مثلاً:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

اس example میں `age` کی value `25` ہے، اور `if` statement یہ جانچتی ہے کہ `age > 18` درست ہے یا نہیں۔ چونکہ condition درست ہے، اس لیے `"Big Boy"` output ہوگا۔

اگر `else` والے حصے کی ضرورت نہ ہو، تو اسے چھوڑا بھی جا سکتا ہے:

```swift
if condition {
    // حالت درست ہونے پر کوڈ پر عمل درآمد کیا جاتا ہے۔
}
```

### Condition کے ذریعے index کی حد کنٹرول کرنا

Array index out of range سے بچنے کے لیے ہم `if` statement استعمال کر سکتے ہیں تاکہ `index` array کی صحیح حد میں رہے:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logic کی وضاحت: `sayings.count` کی value `5` ہے، اس لیے `sayings.count - 1` کی value `4` ہوگی، اور یہی array کا آخری درست index بھی ہے۔

جب `index` کی value `4` سے کم ہوگی، تو button دبانے پر `index += 1` محفوظ ہوگا؛ لیکن جب `index` `4` تک پہنچ جائے گا، تو condition پوری نہیں ہوگی، اور button دبانے پر کچھ نہیں ہوگا۔

اب code نے اقوال کی تبدیلی کا feature مکمل کر لیا ہے:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### اقوال کو loop میں چلانا

اگر ہم چاہتے ہیں کہ آخری قول دکھانے کے بعد button دبانے پر دوبارہ پہلا قول دکھایا جائے، تاکہ carousel بار بار چلے، تو ہم `else` حصہ استعمال کر سکتے ہیں:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

جب button دبایا جائے گا، اگر `index` array کے آخری element تک پہنچ چکا ہوگا، تو اسے دوبارہ `0` پر reset کر دیا جائے گا، اور carousel دوبارہ شروع ہو جائے گی۔

## قول والے view کو بہتر بنانا

اب ہمارا quote carousel logic مکمل ہو چکا ہے، لیکن ہم interface کو مزید خوبصورت بھی بنا سکتے ہیں۔

مکمل code:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

اس example میں `Text` view کے ساتھ سفید نیم شفاف background اور rounded corners شامل کیے گئے ہیں، `Button` پر `.borderedProminent` style لگائی گئی ہے، اور `VStack` کے لیے background image رکھی گئی ہے۔

اضافی نکتہ: جب `background()` modifier کے ذریعے image background استعمال کی جاتی ہے، تو اس کا default behavior یہ ہوتا ہے کہ وہ موجودہ view کے layout area کو حتیٰ الامکان بھر دے۔ بہت سے حالات میں یہ قدرتی طور پر Safe Area تک بھی پھیل جاتی ہے۔

اب ہم quote carousel والا view مکمل کر چکے ہیں۔

![SwiftUI View](../../RESOURCE/011_word.png)

## خلاصہ

اس سبق کے ذریعے ہم نے سیکھا کہ array کا استعمال کرتے ہوئے کئی اقوال کو کیسے محفوظ کیا جاتا ہے، اور `if` اور `if-else` statements کے ذریعے ان کی carousel کیسے بنائی جاتی ہے۔

ہم نے array کی بنیادی operations بھی سمجھیں، جیسے elements شامل کرنا، حذف کرنا، تبدیل کرنا، اور index out of range سے بچنا۔

یہ سبق صرف quote carousel بنانے تک محدود نہیں تھا، بلکہ اس نے array اور conditional statements کے بنیادی استعمال کو بھی جوڑ کر یہ سکھایا کہ data کو کیسے handle کیا جائے اور program flow کو کیسے control کیا جائے۔

## اضافی علم - Multiple condition checking: `if-else if-else` statements

عملی development میں اکثر ایک سے زیادہ conditions handle کرنا پڑتی ہیں۔ مثال کے طور پر، کسی game میں اگر score `1` ہو تو event A چلے، اگر `2` ہو تو event B، اگر `3` ہو تو event C، وغیرہ۔

ایسی صورت میں، جہاں دو سے زیادہ conditional branches ہوں، ہم `if-else if-else` statements استعمال کرتے ہیں۔

بنیادی syntax:

```swift
if conditionA {
    // کوڈ کو اس وقت عمل میں لایا جاتا ہے جب conditionA درست ہو۔
} else if conditionB {
    // کوڈ کو لاگو کیا جاتا ہے جب شرط بی درست ہو۔
} else if conditionC {
    // کوڈ پر عمل درآمد کیا جاتا ہے جب شرط سی درست ہو۔
} else {
    // تمام شرائط پوری نہ ہونے پر کوڈ کو لاگو کیا جائے گا۔
}
```

اس صورت میں، program conditions کو ترتیب سے چیک کرتا ہے، اور جو پہلی condition درست ہو، اسی کا code block execute کرتا ہے۔ اگر کوئی بھی condition درست نہ ہو، تو `else` والا code چلے گا۔

Quote carousel میں بھی ہم `if-else if-else` statements استعمال کر سکتے ہیں:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

جب `index` کی value `0`، `1`، `2`، یا `3` ہو، تو ہر بار button دبانے پر `index += 1` چلے گا؛ اور جب `index` کی value `4` ہوگی (یعنی آخری element)، تو `index` دوبارہ `0` کر دیا جائے گا، اور carousel loop میں چلتی رہے گی۔

`else` branch یہاں safety کے لیے رکھی گئی ہے، تاکہ اگر کبھی کوئی invalid value آ جائے (مثلاً `index` غلطی سے بدل جائے)، تو بھی program درست حالت میں واپس آ جائے۔

یہ بھی یاد رکھنا چاہیے کہ یہاں `==` کا مطلب "کیا دونوں برابر ہیں" ہے۔ اگر `if` statement میں `index` کسی عدد کے برابر ہو، تو وہ `true` واپس کرے گا اور متعلقہ code block execute ہوگا۔ اگر برابر نہ ہو، تو program اگلی `if` condition کو چیک کرے گا۔

اس قسم کی multiple condition checking مختلف حالات میں مختلف code چلانے کے لیے بہت مفید ہوتی ہے۔
