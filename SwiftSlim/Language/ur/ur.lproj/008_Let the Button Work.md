# بٹن کو کام پر لگانا

اس سبق میں ہم بنیادی طور پر Button بٹن، `print` کے ذریعے debug information output کرنا، اور Swift functions سیکھیں گے۔

یہ سب SwiftUI میں interactive programming کی بنیاد ہیں۔

## بٹن

بٹن ہمارے سب سے عام UI controls میں سے ایک ہے۔ جب ہمیں download، open، یا exit جیسے operations کرنے ہوں، تو عموماً ہم بٹن پر click کرتے ہیں۔

مثلاً App Store میں، "Get" بٹن پر click کرکے App download کیا جاتا ہے۔

![Button](../../RESOURCE/008_button.png)

SwiftUI میں بٹن کو `Button` کے ذریعے ظاہر کیا جاتا ہے۔

بنیادی استعمال:

```swift
Button("") {
    
}
```

اس کی structure کو دو حصوں میں تقسیم کیا جا سکتا ہے:

```swift
Button("بٹن کا متن") {
    بٹن دبانے پر چلنے والا کوڈ
}
```

مثلاً:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

رن کرنے کے بعد ایک `Start` بٹن دکھائی دے گا۔

![Button](../../RESOURCE/008_button1.png)

جب صارف بٹن پر click کرے گا، تو `{}` کے اندر موجود code execute ہوگا۔

یہ بات یاد رکھیں: `Button` SwiftUI کا ایک interface control (`View`) ہے، اس لیے اسے لازماً `body` کے اندر لکھنا ہوتا ہے۔

### buttonStyle modifier

SwiftUI میں `Button` کے لیے system کے built-in button styles موجود ہیں، جنہیں `buttonStyle` modifier کے ذریعے استعمال کیا جا سکتا ہے۔

مثلاً:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` system کی فراہم کردہ button style استعمال کرے گا۔

عام options یہ ہیں:

* `.automatic`
* `.plain`
* `.bordered`
* `.borderedProminent`
* `.borderless`

![Button](../../RESOURCE/008_button7.png)

مختلف styles کے درمیان بنیادی فرق یہ ہوتا ہے کہ بٹن میں border ہے یا نہیں، background ہے یا نہیں، اور visual emphasis کتنا ہے۔

## print output

Programming میں اکثر یہ دیکھنے کی ضرورت ہوتی ہے کہ program کسی خاص code segment تک پہنچا ہے یا نہیں۔

Swift اس مقصد کے لیے `print` function فراہم کرتا ہے، جو debugging information output کرنے کے لیے استعمال ہوتا ہے۔

بنیادی syntax:

```swift
print("Hello")
```

یہ code text کو Console میں output کرے گا۔

### بٹن کی usability جانچنا

ہم `print` کو بٹن کے اندر لکھ کر یہ جانچ سکتے ہیں کہ بٹن click ہوا ہے یا نہیں۔

```swift
Button("Start") {
    print("Test 123")
}
```

جب بٹن پر click کیا جائے گا، تو Console میں یہ output آئے گا:

```swift
Test 123
```

اس کا مطلب ہے کہ بٹن کامیابی سے trigger ہو چکا ہے۔

![Button](../../RESOURCE/008_button3.png)

نوٹ: `print` ایک Swift code ہے، interface control نہیں۔ اسے براہِ راست `body` کے اندر نہیں رکھا جا سکتا، ورنہ error آئے گی۔

مثلاً، یہ لکھنا غلط ہے:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // خرابی: باڈی کو ایک منظر واپس کرنا چاہیے۔
    }
}
```

SwiftUI میں `body` interface structure بیان کرنے کے لیے ہوتا ہے، اس لیے اس میں صرف interface controls (`View`) رکھے جا سکتے ہیں، جیسے `Text`، `Button`، `Image` وغیرہ۔

عام code (جیسے calculation logic، `print` وغیرہ) کو بٹن، function، یا دوسرے event handlers کے اندر رکھا جانا چاہیے۔

### Console

`print` کا output Xcode کے Console میں دکھائی دیتا ہے۔

اگر Console نظر نہیں آ رہا، تو نیچے دائیں کونے میں موجود `Show the Debug Area` بٹن پر click کرکے debug area کھولیں، پھر `Show the Console` بٹن پر click کرکے Console دکھائیں۔

![](../../RESOURCE/008_button4.png)

Console کے نیچے بائیں جانب دو tabs ہوتے ہیں: `Executable` اور `Previews`۔

![](../../RESOURCE/008_button5.png)

یہ دونوں tabs مختلف runtime environments سے متعلق ہوتے ہیں: اگر آپ Canvas preview میں ہیں، تو `print` کا output `Previews` tab کے اندر دکھے گا؛ اگر آپ simulator یا حقیقی device پر App چلا رہے ہیں، تو output `Executable` tab کے اندر دکھے گا۔

لہٰذا، اگر آپ کو `print` کا output نہ ملے، تو پہلے یہ چیک کریں کہ آپ نے درست tab منتخب کیا ہے۔

## مثال - ASCII character art

کچھ code projects میں اکثر ASCII character art دیکھنے کو ملتی ہے۔

Character art عام characters کو ملا کر بنائی گئی تصویر ہوتی ہے، مثلاً:

![ASCII](../../RESOURCE/008_ascii.png)

ہم بٹن + `print` کے ذریعے ایک ASCII character art output کر سکتے ہیں۔

مثالی code:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

جب بٹن پر click کیا جائے گا، تو Console میں یہ output آئے گا:

```swift
 /\_/\
( o.o )
 > ^ <
```

نوٹ: string کے اندر `\` لکھنے کے لیے `\\` لکھنا پڑتا ہے، کیونکہ backslash string میں escape character ہوتا ہے۔

## Functions

بٹن کے اندر ہم براہِ راست code لکھ سکتے ہیں۔

مثلاً:

```swift
Button("Start") {
    print("Hello")
}
```

اگر code کم ہو، تو یہ طریقہ ٹھیک ہے۔ لیکن عملی development میں، ایک بٹن کے ذریعے چلنے والی logic کافی زیادہ ہو سکتی ہے۔

مثلاً:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // شاید یہاں مزید بہت سا کوڈ ہو
}
```

اگر code بڑھتا جائے، تو اسے براہِ راست بٹن کے اندر لکھنے سے interface code بے ترتیب ہو جائے گا، اور پڑھنا یا maintain کرنا مشکل ہو جائے گا۔

اسی لیے ہم عموماً اس logic کو ایک function میں منتقل کرتے ہیں، پھر بٹن کے اندر وہ function call کرتے ہیں۔

### Function کیا ہے

Function دراصل code کا ایک ایسا حصہ ہے جسے بار بار استعمال کیا جا سکتا ہے۔

جب کبھی کسی خاص code کو execute کرنا ہو، تو ہم صرف وہ function call کرتے ہیں، اور function کے اندر کا code چل جاتا ہے۔

اس سے code structure زیادہ واضح ہو جاتی ہے، اور repeated use بھی آسان ہو جاتا ہے۔

### بنیادی syntax

Swift میں function کو `func` keyword کے ذریعے define کیا جاتا ہے:

```swift
func randomInt() {
    // code
}
```

یہ code ایک function define کرتا ہے۔

`randomInt` function کا نام ہے، جو اس code block کی شناخت کرتا ہے۔

`()` parameter کی جگہ ہے، جہاں آپ باہر سے data وصول کر سکتے ہیں۔ اگر کسی data کی ضرورت نہ ہو، تو اسے خالی چھوڑ سکتے ہیں۔

`{}` کے اندر function کا code area ہوتا ہے، اور جو بھی code execute کرنا ہو، وہ یہیں لکھا جاتا ہے۔

مثلاً:

```swift
func getName() {
    print("FangJunyu")
}
```

اس function کا کام ایک text output کرنا ہے۔

### Function کو call کرنا

Function define کرنا صرف اس code کو بنانا ہے۔ اگر آپ اسے چلانا چاہتے ہیں، تو اسے call بھی کرنا ہوگا۔

Call کرنے کے لیے function کے نام کے بعد `()` لگایا جاتا ہے:

```swift
getName()
```

جب program اس line تک پہنچتا ہے، تو `getName` function کے اندر موجود code execute ہو جاتا ہے۔

مکمل مثال:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

رن کرنے کے بعد، Console میں یہ output آئے گا:

```swift
FangJunyu
```

### SwiftUI میں function استعمال کرنا

SwiftUI view میں، functions عموماً `body` کے باہر لکھی جاتی ہیں۔

مثلاً:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

جب بٹن پر click کیا جائے گا، تو `getName()` function call ہوگا۔

اس طرح interface code سادہ رہتا ہے، جبکہ اصل logic function کے اندر handle ہوتی ہے۔

### Function parameters

کبھی کبھی ایک function کو مختلف data کے مطابق مختلف کام کرنے کی ضرورت ہوتی ہے۔

مثلاً، ہم چاہتے ہیں کہ function صرف `"FangJunyu"` output نہ کرے، بلکہ مختلف names output کر سکے۔

اس صورت میں parameters استعمال کیے جاتے ہیں۔ Parameter کو یوں سمجھیں: وہ data جو function call کرتے وقت اس کے اندر بھیجا جاتا ہے۔

مثلاً:

```swift
func getName(name: String) {
    print(name)
}
```

اس function میں ایک parameter شامل کیا گیا ہے۔ `name` parameter کا نام ہے، اور `String` اس کی type ہے۔

اس کا مطلب ہے کہ function کو ایک `String` type کا data وصول کرنا ضروری ہے۔

چونکہ اب function کو data درکار ہے، اس لیے call کرتے وقت وہ data دینا بھی ضروری ہوگا۔

```swift
getName(name: "Sam")
```

جب call کے دوران `"Sam"` دیا جائے گا، تو function کے اندر اسی value کو output کیا جائے گا۔

رن کا نتیجہ:

```swift
Sam
```

## مثال - function کے ذریعے ASCII character art output کرنا

پچھلی مثال میں ہم نے `print` کو براہِ راست بٹن کے اندر لکھا تھا۔

لیکن اگر character art زیادہ پیچیدہ ہو، تو code لمبا ہو جائے گا۔ اس صورت میں logic کو function میں منتقل کیا جا سکتا ہے، تاکہ interface code زیادہ واضح رہے۔

مثالی code:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

رن کرنے کے بعد بٹن پر click کریں، تو Console میں یہ output آئے گا:

```swift
 /\_/\
( o.o )
 > ^ <
```

یہاں دو چیزیں ہوتی ہیں، جب صارف بٹن پر click کرتا ہے:

1. بٹن `printCat()` function کو call کرتا ہے
2. function کے اندر موجود `print` code execute ہوتا ہے

اس طریقے سے interface code صرف event trigger کرنے کی ذمہ داری رکھتا ہے، جبکہ اصل logic function کے اندر handle کی جاتی ہے۔

عملی development میں، زیادہ تر buttons کی operations functions کے ذریعے ہی انجام دی جاتی ہیں۔

## خلاصہ

اس سبق میں ہم نے تین اہم چیزیں سیکھیں:

**1. Button بٹن**

`Button` SwiftUI میں action trigger کرنے کے لیے استعمال ہونے والا control ہے۔

```swift
Button("Start") {

}
```

جب صارف بٹن پر click کرتا ہے، تو braces کے اندر موجود code execute ہو جاتا ہے۔

**2. print output**

`print` debugging information کو Console میں output کرنے کے لیے استعمال ہوتا ہے۔

```swift
print("Hello")
```

Developer Console کے ذریعے program کی running state دیکھ سکتا ہے۔

**3. Function**

Function code کا ایک ایسا حصہ ہے جسے بار بار استعمال کیا جا سکتا ہے۔

```swift
func sayHello() {
    print("Hello")
}
```

Function کو call کرنا:

```swift
sayHello()
```

اگر function کو data درکار ہو، تو parameters استعمال کیے جا سکتے ہیں:

```swift
func sayHello(name: String) {
    print(name)
}
```

آنے والے اسباق میں ہم مزید SwiftUI controls اور data کے interface کے ساتھ interaction کو سیکھیں گے۔

## مشق

نیچے دی گئی مشقیں کرنے کی کوشش کریں:

1. ایک بٹن بنائیں، جس کا متن `"Hello"` ہو
2. بٹن پر click کرنے پر Console میں `Hello Swift` output کریں
3. output والے code کو ایک function میں لکھیں، پھر بٹن کے اندر اسی function کو call کریں
