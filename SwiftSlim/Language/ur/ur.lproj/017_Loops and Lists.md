# لوپس اور فہرستیں

اس سبق میں ہم Swift میں `for` لوپ اور SwiftUI میں `ForEach` سیکھیں گے۔

یہ دونوں ہمیں array کے عناصر کو ترتیب کے ساتھ پڑھنے میں مدد دیتے ہیں۔ اصل development میں ہمیں اکثر کسی data group کو ایک ایک کر کے نکالنا، پھر اسے process یا display کرنا ہوتا ہے، اور loop اسی کام کو مکمل کرنے کا ایک اہم ذریعہ ہے۔

جب ہم ویب براؤز کرتے ہیں یا کوئی App استعمال کرتے ہیں تو ہمیں اکثر بہت سی lists یا items نظر آتے ہیں۔ ایسا content عموماً پہلے `array` میں محفوظ کیا جاتا ہے، پھر `loop` کے ذریعے ایک ایک کر کے پڑھا جاتا ہے، اور آخر میں interface پر دکھایا جاتا ہے۔

مثلاً Google کے search results کی فہرست:

![Google](../../Resource/017_google.png)

Search results کی فہرست میں ہر ایک item عموماً ایک data item کے مطابق ہوتا ہے، اور loop کے ذریعے ایک ایک کر کے دکھایا جاتا ہے۔

اسی لیے `array` اور `loop` اکثر ساتھ ساتھ آتے ہیں۔ `Array` ایک data group کو محفوظ کرتی ہے، جبکہ `loop` اس data کو ترتیب سے نکالتا ہے اور ایک ہی جیسا عمل انجام دیتا ہے۔

اب ہم سب سے بنیادی `for` loop سے شروع کرتے ہیں۔

## الٹی گنتی

فرض کریں ہمیں ایک countdown feature بنانا ہے، جو باری باری `“5، 4، 3، 2، 1”` output کرے۔

سب سے سیدھا طریقہ یہ ہے:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

یہ طریقہ countdown کو simulate تو کر سکتا ہے، لیکن اگر content زیادہ ہو تو code بہت repetitive لگتا ہے، اور بعد میں اسے modify کرنا بھی آسان نہیں رہتا۔

اس وقت ہم data کو پہلے array میں رکھ سکتے ہیں، پھر `for` loop کے ذریعے اسے باری باری print کر سکتے ہیں:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

یہ طریقہ زیادہ مختصر ہے اور اسے بڑھانا بھی آسان ہے۔ چاہے countdown میں numbers بہت زیادہ ہوں، ہمیں `print` کو بار بار الگ الگ نہیں لکھنا پڑتا؛ بس loop کو array کے ہر element کو خود بخود handle کرنے دینا کافی ہوتا ہے۔

ہم اس code کو ایک button کے اندر رکھ کر test کر سکتے ہیں:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

جب button پر click کیا جائے گا تو `for` loop array کی ترتیب کے مطابق `countDown` کے ہر integer کو ایک ایک کر کے نکالے گا اور console میں print کرے گا۔

اگلا قدم یہ دیکھنا ہے کہ `for` loop کیسے کام کرتا ہے۔

## for لوپ

`for` loop ایک data group کو ترتیب کے ساتھ process کرنے کے لیے استعمال ہوتا ہے۔ سب سے عام چیزیں جن پر یہ چلتا ہے وہ arrays اور ranges ہیں۔

بنیادی لکھنے کا طریقہ:

```swift
for عنصر in arrayYaRange {
    chalneWalaCode
}
```

مثال کے طور پر، ابھی والا countdown code:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

یہاں `i` اس element کو ظاہر کرتا ہے جو اس وقت نکالا گیا ہے، اور `in` کے بعد وہ data آتا ہے جس پر loop چلنا ہے، یعنی `countDown` array۔

اس code کا مطلب یہ ہے: program `countDown` array میں سے ہر element کو ترتیب سے نکالتا ہے۔ جب بھی ایک element نکالا جاتا ہے تو اسے عارضی طور پر `i` سے ظاہر کیا جاتا ہے، پھر curly braces کے اندر والا code چلایا جاتا ہے۔

Execution process کو ہم یوں سمجھ سکتے ہیں:

- پہلی بار `5` نکالا جاتا ہے، اس لیے اس وقت `i` کی value `5` ہوتی ہے
- `print(i)` چلتا ہے اور `5` output ہوتا ہے
- پھر اگلا element `4` نکالا جاتا ہے
- دوبارہ `print(i)` چلتا ہے اور `4` output ہوتا ہے

بعد والے `3`، `2` اور `1` بھی اسی طریقے سے باری باری execute ہوتے ہیں۔

![for](../../Resource/017_for.png)

جب array کے تمام elements process ہو جاتے ہیں تو `for` loop خود بخود ختم ہو جاتا ہے۔

ہم `for` loop کی مدد سے array کے ہر element کو حاصل کر سکتے ہیں اور countdown جیسا feature مکمل کر سکتے ہیں۔

**اشارہ**: `i` for loop میں ایک بہت common naming ہے، جو موجودہ element کو ظاہر کرنے کے لیے استعمال ہوتی ہے، لیکن یہ لازمی نہیں ہے؛ آپ دوسرے English names بھی استعمال کر سکتے ہیں۔

مثلاً ہر نکالے گئے element کے لیے `num` استعمال کریں:

```swift
for num in countDown {
    print(num)
}
```

Curly braces کے اندر بھی موجودہ element کو ظاہر کرنے کے لیے `num` ہی استعمال کرنا ہوگا۔

### range پر loop

`for` loop صرف arrays پر ہی نہیں بلکہ ranges پر بھی چل سکتا ہے۔

مثلاً جب ہمیں `50` تک کے مثبت integers کا مجموعہ نکالنا ہو تو ہمیں `1` سے `50` تک کے تمام integers کو باری باری جمع کرنا ہوگا۔

سب سے سیدھا طریقہ شاید یہ ہو:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

اس طریقے کا مسئلہ یہ ہے کہ ہمیں ہر number ہاتھ سے لکھنا پڑتا ہے، جو نہ صرف مشکل ہے بلکہ حقیقی development scenarios کے لیے بھی مناسب نہیں۔

اس وقت ہم range operator کو `for` loop کے ساتھ ملا کر یہ کام کر سکتے ہیں۔

پچھلے "operators" والے chapter میں ہم range operator سیکھ چکے ہیں:

```swift
1...3   // 1, 2, 3
```

یہاں `...` closed range کو ظاہر کرتا ہے، یعنی اس میں start اور end دونوں شامل ہوتے ہیں۔

لہٰذا یہاں `1` سے `50` تک کی integer range پر `for` loop استعمال کیا جا سکتا ہے:

```swift
for i in 1...50 {
    
}
```

ہمیں ان integers کو جمع کرنا ہے، اس لیے ایک variable بھی چاہیے جو total کو محفوظ کرے:

```swift
var count = 0
```

پھر loop کی ہر iteration میں موجودہ number کو `count` میں شامل کر دیں:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

اس code کا مطلب یہ ہے:

- `count` موجودہ total کو محفوظ کرتا ہے
- `for` loop `1` سے `50` تک integers کو باری باری نکالتا ہے
- جب بھی ایک integer نکلتا ہے، `count += i` execute ہوتا ہے
- loop ختم ہونے کے بعد `count` میں final total محفوظ ہوتا ہے۔

اس طرح ہم `50` تک کے تمام مثبت integers کا مجموعہ حاصل کر سکتے ہیں۔

اسی طرح اگر ہمیں `1` سے `100` تک کے integers کا مجموعہ نکالنا ہو تو صرف range بدلنی ہوگی:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` loop صرف array پر ہی نہیں، بلکہ ایک range پر بھی چل سکتا ہے۔ Data کو ترتیب سے بار بار process کرنے کی یہ صلاحیت development میں بہت عام ہے۔

یہ ہمیں بہت سے repetitive کام خودکار طور پر کرنے میں مدد دیتی ہے، بغیر اس کے کہ ہم ہر number کے addition process یا اسی طرح کے دوسرے repetitive steps کو ہاتھ سے لکھیں۔

## SwiftUI میں loop

اوپر والا `for` loop Swift language کا حصہ ہے۔

لیکن SwiftUI میں ہم view structure کے اندر `for` کو براہ راست استعمال کر کے views generate نہیں کر سکتے:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

اس کی وجہ یہ ہے کہ `VStack` کے اندر SwiftUI views ہونے چاہییں، جبکہ عام `for` loop خود ایک view نہیں ہوتا۔

اگر ہم SwiftUI میں array کے content کی بنیاد پر interface کو بار بار generate کرنا چاہتے ہیں تو ہمیں `ForEach` استعمال کرنا ہوگا۔

مثلاً اگر ہمیں کسی گروپ کے تمام members کے names دکھانے ہوں تو ہم یوں لکھ سکتے ہیں:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Display result:

![for1](../../Resource/017_for1.png)

پھر ہم ہر `Text` پر ایک جیسے modifiers شامل کرتے ہیں:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

اب ہر `Text` چھوٹے اور زیادہ bold font میں نظر آتا ہے۔

Display result:

![](../../Resource/017_for2.png)

اگرچہ modifiers interface کو زیادہ خوبصورت بناتے ہیں، لیکن وہ code کو لمبا اور زیادہ repetitive بھی بنا دیتے ہیں۔

اگر names مزید بڑھ جائیں، یا بعد میں ہمیں font، color اور دوسری styles کو ایک ساتھ modify کرنا ہو، تو ہمیں بہت سا ایک جیسا code بار بار لکھنا اور بدلنا پڑے گا۔ یہ کافی مشکل بھی ہے اور maintain کرنا بھی آسان نہیں رہتا۔

اس وقت ہم ان names کو پہلے array میں رکھ سکتے ہیں، پھر SwiftUI کے `ForEach` سے array کے data کی بنیاد پر views کو بار بار generate کر سکتے ہیں:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

یہ code زیادہ مختصر ہے۔ `ForEach` array کے ہر element کو ایک ایک کر کے پڑھتا ہے اور متعلقہ content کو interface پر دکھاتا ہے۔

بعد میں جب ہمیں نئے names شامل کرنے ہوں، تو صرف `names` array کے content کو بدلنا کافی ہوگا؛ ہر بار `Text` اور پیچیدہ modifiers دوبارہ شامل کرنے کی ضرورت نہیں ہوگی۔

## ForEach

`ForEach` SwiftUI میں views کو بار بار generate کرنے کے لیے استعمال ہونے والی ایک structure ہے۔ آپ اسے SwiftUI کے اندر `for` loop جیسی ایک structure کے طور پر سمجھ سکتے ہیں۔

بنیادی استعمال:

```swift
ForEach(array, id: \.self) { عنصر in
    SwiftUICode
}
```

مثلاً ابھی والے group names:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

اس code کا مطلب یہ ہے:

`names` وہ array ہے جس پر loop چل رہا ہے، یعنی وہ data جو display ہونا ہے۔

`id:\.self` کا مطلب ہے کہ array کے element خود ہی ہر item کو الگ پہچاننے کے لیے استعمال ہوں گے۔

اس مثال میں array کے اندر strings محفوظ ہیں:

```swift
["Sam", "John", "Wathon", "Bob"]
```

اس لیے SwiftUI مختلف content میں فرق کرنے کے لیے براہ راست "Sam"، "John"، "Wathon"، "Bob" انہی strings کو استعمال کرتا ہے۔

ابتدائی مرحلے میں عام simple arrays جیسے String اور Int کے لیے ہم عموماً یہ لکھ سکتے ہیں:

```swift
id: \.self
```

فی الحال آپ کو بس یہی ایک لکھنے کا طریقہ یاد رکھنا ہے؛ id کے مزید rules کو گہرائی سے سمجھنے کی ضرورت نہیں۔

`item in` میں `item` موجودہ element کو ظاہر کرتا ہے۔

مثلاً پہلی iteration میں `item` `"Sam"` ہوتا ہے، دوسری iteration میں `item` `"John"` ہوتا ہے۔

اس لیے:

```swift
Text(item)
```

باری باری یہ بن جاتا ہے:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

یعنی اس code کا کام `names` array میں سے ہر name کو ایک ایک کر کے نکالنا اور ہر name کے لیے ایک `Text` view بنانا ہے۔

### execution process

Execution process کو ہم یوں سمجھ سکتے ہیں:

- `ForEach` پہلے `names` array کے پہلے element `"Sam"` کو پڑھتا ہے
- `item` عارضی طور پر `"Sam"` کو ظاہر کرتا ہے
- `Text(item)` `"Sam"` دکھاتا ہے
- پھر وہ اگلا element `"John"` پڑھتا ہے
- اور وہی view code دوبارہ execute ہوتا ہے

آخر میں array کے تمام names دکھا دیے جاتے ہیں۔

اس طریقے کا فائدہ یہ ہے کہ جب names کی تعداد بڑھتی ہے تو ہمیں بہت سے `Text` بار بار نہیں لکھنے پڑتے؛ صرف array کا content بدلنا کافی ہوتا ہے۔

### تصاویر پر loop

`ForEach` صرف text ہی نہیں دکھا سکتا، بلکہ images، colors یا دوسرے SwiftUI views بھی دکھا سکتا ہے۔

مثلاً ہم 4 تصاویر تیار کرتے ہیں:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

ان چار تصاویر کو Xcode کے Assets folder میں drag کریں۔

![image](../../Resource/017_for3.png)

اگر ہم `ForEach` استعمال نہ کریں تو ہمیں ہر تصویر کو الگ الگ ہاتھ سے لکھنا ہوگا:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Display result:

![image](../../Resource/017_for4.png)

یہ طریقہ feature تو پورا کر دیتا ہے، لیکن code نسبتاً لمبا ہو جاتا ہے۔

جوں جوں تصاویر بڑھتی جاتی ہیں، ہمیں اتنا ہی زیادہ `Image` code بار بار لکھنا پڑتا ہے۔

بعد میں اگر ہم تمام تصاویر کا size ایک ساتھ بدلنا چاہیں، تو ہمیں انہیں ایک ایک کر کے modify کرنا پڑے گا۔

اس وقت ہم image names کو array میں رکھ سکتے ہیں، پھر `ForEach` کے ذریعے image views کو بار بار generate کر سکتے ہیں:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

یہاں `images` ایک string array ہے، اور array کا ہر element ایک image name ہے۔

`ForEach(images, id: \.self)` کا مطلب ہے کہ `images` array کے ہر element کو باری باری پڑھا جائے، item کو distinguish کرنے کے لیے خود element استعمال ہو، اور پھر موجودہ element کی بنیاد پر متعلقہ view generate کیا جائے۔

مثلاً اگر پہلی بار `"430F9BEF"` پڑھا جائے، تو:

```swift
Image(item)
```

یہ دراصل اس کے برابر ہوگا:

```swift
Image("430F9BEF")
```

بعد والی تصاویر بھی اسی طرح باری باری دکھائی جائیں گی۔

![image](../../Resource/017_for4.png)

یہاں بھی ہم استعمال کرتے ہیں:

```swift
id: \.self
```

وجہ پہلے جیسی ہی ہے، کیونکہ `images` array کے elements بھی simple string type ہیں، اس لیے ابتدائی مرحلے میں خود element کو distinguish کرنے کے لیے استعمال کرنا کافی ہے۔

آپ اسے ایک سادہ formula کی طرح یاد رکھ سکتے ہیں:

**جب `ForEach` کسی simple array جیسے `String` یا `Int` پر loop کرے، تو عموماً `id: \.self` لکھا جاتا ہے۔**

### نئی تصاویر شامل کرنا

اگر بعد میں نئی تصاویر شامل کرنی ہوں تو صرف array کا content بدلنا کافی ہے:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

نیا `Image` code بار بار دوبارہ لکھنے کی ضرورت نہیں ہوگی۔

اگر تصاویر زیادہ ہوں تو اسے `ScrollView` کے ساتھ استعمال کیا جا سکتا ہے، ورنہ content screen سے باہر نکل جائے تو مکمل preview ممکن نہیں رہے گا۔

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### تصاویر میں تبدیلی

جب ہمیں images کی style ایک ساتھ modify کرنی ہو تو صرف `ForEach` کے اندر والا code بدلنا کافی ہوتا ہے۔

مثلاً width کو `80` کر دیں:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

اس طرح تمام images ایک ساتھ بدل جائیں گی، اور ایک ایک کر کے modify کرنے کی ضرورت نہیں ہوگی۔

یہی `ForEach` کے ایک اہم کردار کی مثال ہے:

**جب کئی views کی structure ایک جیسی ہو اور صرف content مختلف ہو، تو ہم view code ایک ہی بار لکھ سکتے ہیں، پھر array کا data طے کرے گا کہ کیا display ہونا ہے۔**

## خلاصہ

اس سبق میں ہم نے `for` loop اور `ForEach` سیکھا۔

`for` loop array یا range کے elements کو ترتیب کے ساتھ process کرنے کے لیے استعمال ہوتا ہے، اور یہ نسبتاً data handling کی طرف زیادہ مائل ہے۔

`ForEach` SwiftUI میں array کے content کی بنیاد پر views کو بار بار generate کرنے کے لیے استعمال ہوتا ہے، اور یہ زیادہ interface display کی طرف مائل ہے۔

ابتدائی مرحلے میں `ForEach` کا سب سے عام لکھنے کا طریقہ یہ ہے:

```swift
ForEach(array, id: \.self) { عنصر in
    SwiftUICode
}
```

یہاں `id: \.self` کا مطلب ہے کہ ہر element کو distinguish کرنے کے لیے خود element استعمال کیا جاتا ہے۔

جب array میں `String` یا `Int` جیسی simple types ہوں، تو ہم عموماً پہلے یہی طریقہ استعمال کر سکتے ہیں۔

آگے چل کر جب آپ ویب براؤز کریں یا کوئی App استعمال کریں، اور آپ کو بار بار نظر آنے والا text، images یا دوسری list content دکھائی دے، تو آپ سوچ سکتے ہیں کہ SwiftUI میں ایسا content عموماً پہلے array میں رکھا جاتا ہے، پھر `ForEach` کے ذریعے باری باری display کیا جاتا ہے۔
