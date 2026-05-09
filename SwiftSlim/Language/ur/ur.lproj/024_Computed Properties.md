# حساب شدہ خاصیت

اس سبق میں ہم بنیادی طور پر computed property کے بارے میں سیکھیں گے۔

Computed property موجودہ data کی بنیاد پر ایک نیا result calculate کرنے کے لیے استعمال ہوتی ہے۔ یہ numerical values بھی calculate کر سکتی ہے، اور SwiftUI view میں دکھائے جانے والے content کو بھی calculate کر سکتی ہے۔

مثال کے طور پر:

```swift
let a = 10
let b = 20
let c = a + b
```

یہاں `c` کا مطلب ہے `a` اور `b` کو جمع کرنے کے بعد حاصل ہونے والا result۔

عام code میں اس طرح لکھنا بہت عام ہے۔

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

اشارہ: `Button` کے click event کے اندر عام Swift code چلایا جا سکتا ہے۔

لیکن اگر اسی طرح کا code براہِ راست SwiftUI view کی properties میں لکھا جائے، تو مسئلہ پیدا ہو جائے گا۔

مثال کے طور پر:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

یہ code error دے گا۔

پہلی نظر میں لگتا ہے کہ `a` اور `b` پہلے ہی `c` سے اوپر لکھے گئے ہیں، اس لیے `c` کی value calculate کی جا سکتی ہے۔

لیکن struct کے اندر properties declare کرتے وقت اس طرح براہِ راست نہیں لکھا جا سکتا۔

## c کو براہِ راست a + b کے طور پر کیوں calculate نہیں کیا جا سکتا؟

کیونکہ `a`, `b`, `c` button click event کے اندر temporary constants نہیں ہیں۔ یہ `ContentView` view کی properties ہیں۔

Button click event کے اندر یہ code عام طور پر چل سکتا ہے:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

کیونکہ button click ہونے کے بعد code ترتیب سے چلتا ہے۔ پہلے `a` بنتا ہے، پھر `b` بنتا ہے، اور آخر میں `a + b` کے ذریعے `c` calculate ہوتا ہے۔

لیکن view کے اندر properties declare کرتے وقت صورتِ حال مختلف ہوتی ہے:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

یہاں `a`, `b`, `c` سب `ContentView` view کی properties ہیں۔

جب `ContentView` view create ہوتا ہے، Swift کو پہلے ان properties کو prepare کرنا ہوتا ہے۔ creation process کو محفوظ رکھنے کے لیے Swift ایک instance stored property کی default value میں اسی instance کی دوسری instance properties کو براہِ راست read کرنے کی اجازت نہیں دیتا۔

اس لیے یہ line error دے گی:

```swift
let c = a + b
```

سادہ طور پر یوں سمجھ سکتے ہیں: **view کے اندر properties declare کرتے وقت، ایک عام property کو استعمال کر کے دوسری عام property کو براہِ راست calculate نہیں کیا جا سکتا۔**

اس قسم کی property، جو value کو براہِ راست store کرتی ہے، “stored property” کہلاتی ہے۔ سمجھنے میں آسانی کے لیے اسے عارضی طور پر عام property سمجھ سکتے ہیں۔

مثال کے طور پر:

```swift
let a = 10
```

`a` کے اندر `10` store ہے۔

```swift
let b = 20
```

`b` کے اندر `20` store ہے۔

لیکن:

```swift
let c = a + b
```

یہاں `c` کوئی براہِ راست لکھی ہوئی fixed value نہیں ہے۔ یہ `a + b` کے ذریعے calculate ہونا چاہتی ہے۔

اس طرح کی “موجودہ data سے result حاصل کرنے” والی صورتِ حال میں computed property زیادہ مناسب ہے۔

اسے یوں تبدیل کیا جا سکتا ہے:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

یہاں `c` ایک computed property ہے۔

```swift
var c: Int {
    return a + b
}
```

اس کا مطلب ہے: **جب `c` کو استعمال کرنے کی ضرورت ہو گی، تب `a` اور `b` read کیے جائیں گے، اور `a + b` کا result return کیا جائے گا۔**

مثال کے طور پر:

```swift
Text("c: \(c)")
```

جب `Text` میں `c` دکھایا جائے گا، تب ہی `c` کی calculation ہو گی۔

## Computed property کیا ہے؟

Computed property ایک variable جیسی نظر آتی ہے، لیکن یہ خود data store نہیں کرتی۔

مثال کے طور پر:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

یہاں `c` ایک computed property ہے۔

یہ عام property کی طرح کوئی fixed value store نہیں کرتی۔ ہر بار جب `c` read ہوتی ہے، `{}` کے اندر موجود code دوبارہ چلتا ہے، اور calculated result return ہوتا ہے۔

اسے یوں سمجھ سکتے ہیں:

```swift
var c: Int {
    return a + b
}
```

جب `c` کی ضرورت ہو، تب `a + b` calculate ہوتا ہے۔

لہٰذا computed property اس صورتِ حال کے لیے مناسب ہے: **کسی result کو الگ سے store کرنے کی ضرورت نہیں، کیونکہ اسے موجودہ data سے calculate کیا جا سکتا ہے۔**

## بنیادی لکھنے کا طریقہ

Computed property عموماً تین حصوں پر مشتمل ہوتی ہے:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` کے ذریعے declare کرنا

```swift
var c
```

Computed property کو لازماً `var` کے ذریعے declare کیا جاتا ہے، `let` استعمال نہیں کیا جا سکتا۔

کیونکہ computed property کوئی fixed stored value نہیں ہوتی، بلکہ ہر بار read ہونے پر dynamically calculate ہونے والا result ہوتی ہے۔

### 2. Return type بتانا

```swift
var c: Int
```

Computed property کو return type بتانا ہوتا ہے۔

یہاں `c` آخر میں integer return کرے گی، اس لیے type `Int` ہے۔

### 3. {} کے اندر calculation logic لکھنا

```swift
{
    return a + b
}
```

`{}` کے اندر calculation logic لکھی جاتی ہے۔ یہاں return ہونے والا result `a + b` ہے۔

## return keyword

Computed property کو ایک result return کرنا ہوتا ہے۔

مثال کے طور پر:

```swift
var c: Int {
    return a + b
}
```

یہاں `return` کا مطلب ہے: `a + b` کی calculation کا result باہر return کرنا۔

اگر computed property کے اندر صرف ایک expression ہو جو براہِ راست result بناتی ہو، تو `return` کو چھوڑا جا سکتا ہے:

```swift
var c: Int {
    a + b
}
```

لیکن اگر computed property کے اندر کئی lines کا code ہو، تو result کو واضح طور پر return کرنے کے لیے `return` استعمال کرنا چاہیے۔

مثال کے طور پر:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

یہاں calculation process دو steps میں تقسیم ہے۔

پہلا step، total price calculate کرنا:

```swift
let total = count * price
```

دوسرا step، total price کو text میں جوڑ کر return کرنا:

```swift
return "Total：\(total) $"
```

اگر `return` ہٹا دیا جائے:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

یہ code error دے گا۔

وجہ یہ ہے: **اس computed property کے اندر پہلے ہی کئی lines کا code ہے، Swift خود سے یہ فیصلہ نہیں کر سکتا کہ کون سی line آخر میں return ہونے والا result ہے۔**

اس لیے، اگر computed property کے اندر result دینے والی صرف ایک expression ہو، تو `return` چھوڑا جا سکتا ہے۔

```swift
var c: Int {
    a + b
}
```

اگر computed property کے اندر کئی lines کا code ہو، تو `return` کو واضح طور پر لکھنا بہتر ہے۔

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Computed property اور عام property کا فرق

عام property data store کرتی ہے۔

```swift
var c = 30
```

یہاں `c` ایک خاص value store کرتی ہے: `30`۔

Computed property data store نہیں کرتی۔

```swift
var c: Int {
    a + b
}
```

یہاں `c` `30` store نہیں کرتی۔ یہ صرف calculation کا طریقہ فراہم کرتی ہے۔

جب `c` read ہوتی ہے، Swift یہ code چلاتا ہے:

```swift
a + b
```

پھر calculated result return کرتا ہے۔

اس لیے computed property ان situations کے لیے مناسب ہے جہاں result کو دوسرے data کی بنیاد پر calculate کرنا ہو۔

## body بھی computed property ہے

Computed property سیکھنے کے بعد، ہم SwiftUI میں سب سے زیادہ دکھائی دینے والے اس code کو دوبارہ سمجھ سکتے ہیں:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

یہاں `body` بھی ایک computed property ہے۔

یہ `var` کے ذریعے declare کی گئی ہے:

```swift
var body
```

اس کا return type ہے:

```swift
some View
```

اس کے `{}` کے اندر return ہونے والی چیز SwiftUI view content ہے:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

اس لیے `body` کو یوں سمجھا جا سکتا ہے: جب SwiftUI کو یہ view دکھانا ہوتا ہے، SwiftUI `body` کو read کرتا ہے، اور `body` کی return کی ہوئی content کی بنیاد پر interface بناتا ہے۔

اگر `return` لکھیں، تو اسے یوں سمجھ سکتے ہیں:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

لیکن SwiftUI میں عموماً ہم `return` نہیں لکھتے، بلکہ براہِ راست یوں لکھتے ہیں:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

جب `@State` data بدلتا ہے، SwiftUI `body` کو دوبارہ read کرتا ہے، اور نئے data کے مطابق interface update کرتا ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

button click کرنے کے بعد `count` بدلتا ہے۔

```swift
count += 1
```

`count` بدلنے کے بعد SwiftUI `body` کو دوبارہ calculate کرتا ہے، اس لیے interface میں موجود text بھی update ہو جاتا ہے۔

```swift
Text("count: \(count)")
```

SwiftUI میں data بدلنے کے بعد interface کے خودکار طور پر refresh ہونے کی وجہ بھی یہی ہے۔

### body کے اندر complex calculations لکھنے کی سفارش نہیں کی جاتی

کیونکہ `body` computed property ہے، اس لیے یہ کئی بار read اور دوبارہ calculate ہو سکتی ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

جب `name` بدلتا ہے، SwiftUI `body` کو دوبارہ calculate کرتا ہے۔

اس وقت `body` کے اندر کا code بھی دوبارہ چلتا ہے، اور `num` بھی دوبارہ create ہوتا ہے۔

```swift
let num = 10
```

اس example میں `num` بہت simple ہے، اس لیے اس کا اثر بڑا نہیں۔

لیکن اگر `body` کے اندر complex calculations کی جائیں، مثلاً بڑی مقدار میں data filtering، sorting، image processing وغیرہ، تو interface کی smoothness متاثر ہو سکتی ہے۔

اس لیے SwiftUI میں `body` کو بنیادی طور پر interface structure بیان کرنے کی ذمہ داری رکھنی چاہیے۔

simple temporary data کو `body` کے اندر لکھا جا سکتا ہے۔

complex calculations کو `body` کے باہر computed property، method، یا الگ data processing part میں منتقل کرنا بہتر ہے۔

## مثال: count اور total price

اب ایک simple example کے ذریعے computed property کو سمجھتے ہیں۔

فرض کریں ایک carrot کی price 2 $ ہے۔ user button click کر کے خریدی جانے والی quantity بدل سکتا ہے، اور interface میں total price دکھانی ہے۔

Total price کا calculation method:

```text
Quantity * Unit price
```

اگر total price کو عام variable میں store کریں، تو یہ کچھ inconvenient ہو گا۔

کیونکہ ہر بار quantity بدلنے پر total price کو manually update کرنا پڑے گا۔

اس سے بہتر طریقہ computed property استعمال کرنا ہے:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

دکھایا جانے والا نتیجہ:

![view](../../Resource/024_view.png)

اس example میں:

```swift
@State private var count = 1
```

`count` carrot کی quantity کو ظاہر کرتا ہے۔ button click کرنے پر `count` بدلتا ہے۔

```swift
private let price = 2
```

`price` carrot کی unit price کو ظاہر کرتا ہے۔ یہاں یہ fixed value ہے، اس لیے `let` استعمال کیا گیا ہے۔

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` total price کو ظاہر کرتا ہے۔

اسے الگ سے store کرنے کی ضرورت نہیں، کیونکہ total price ہمیشہ `count * price` کے ذریعے calculate کی جا سکتی ہے۔

جب `count` `1` ہو:

```swift
totalPrice = 1 * 2
```

دکھایا جانے والا result:

```swift
totalPrice: 2 $
```

`+` button click کرنے کے بعد `count` `2` ہو جاتا ہے۔

اس وقت جب `totalPrice` دوبارہ read ہوتی ہے، یہ دوبارہ calculate ہوتی ہے:

```swift
totalPrice = 2 * 2
```

دکھایا جانے والا result:

```swift
totalPrice: 4 $
```

یہی computed property کا کام ہے: موجودہ data کی بنیاد پر نئے result کو dynamic طور پر calculate کرنا۔

## Computed property کو condition check کے لیے بھی استعمال کیا جا سکتا ہے

Computed property صرف numbers calculate نہیں کرتی، بلکہ judgment result بھی return کر سکتی ہے۔

مثال کے طور پر، ہم چاہتے ہیں کہ quantity کی minimum value 1 ہو۔

جب quantity پہلے ہی 1 ہو، تو `-` button کو مزید کم نہیں کرنا چاہیے۔

اس کے لیے ایک computed property add کر سکتے ہیں:

```swift
private var canDecrease: Bool {
    count > 1
}
```

مکمل code:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

دکھایا جانے والا نتیجہ:

![view](../../Resource/024_view1.png)

یہاں:

```swift
private var canDecrease: Bool {
    count > 1
}
```

یہ code بتاتا ہے کہ current quantity کو مزید decrease کیا جا سکتا ہے یا نہیں۔

جب `count` `1` سے زیادہ ہو:

```swift
canDecrease == true
```

اس کا مطلب ہے decrease کیا جا سکتا ہے۔

جب `count` `1` کے برابر ہو:

```swift
canDecrease == false
```

اس کا مطلب ہے مزید decrease نہیں کیا جا سکتا۔

### Button کے اندر condition check

Button کے اندر یہ code استعمال کیا گیا ہے:

```swift
if canDecrease {
    count -= 1
}
```

صرف اس وقت `count` decrease ہو گا جب `canDecrease` `true` ہو۔

### View کے foreground color کو control کرنا

`canDecrease` کے ذریعے button کے foreground color کو بھی control کیا جا سکتا ہے:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

یہاں ternary operator استعمال کیا گیا ہے:

```swift
canDecrease ? Color.primary : Color.gray
```

اس code کا مطلب ہے: اگر `canDecrease` `true` ہو، تو foreground color `Color.primary` ہو گا؛ اگر `canDecrease` `false` ہو، تو foreground color `Color.gray` ہو گا۔

`Color.primary` SwiftUI کی فراہم کردہ system semantic color ہے۔ یہ current interface میں main text color کو ظاہر کرتی ہے۔

Light Mode میں `Color.primary` عام طور پر black کے قریب ہوتی ہے؛ Dark Mode میں عام طور پر white کے قریب ہوتی ہے۔

اس لیے `Color.primary` استعمال کرنے کا فائدہ یہ ہے کہ یہ Light Mode اور Dark Mode کے مطابق خودکار طور پر adapt ہو جاتی ہے۔

### View کی disabled state کو control کرنا

`disabled` اس بات کو control کرنے کے لیے استعمال ہوتا ہے کہ view disabled state میں ہے یا نہیں:

```swift
.disabled(!canDecrease)
```

جب `disabled` `false` ہو، تو view click کیا جا سکتا ہے۔

جب `disabled` `true` ہو، تو view disabled state میں ہوتا ہے اور click نہیں کیا جا سکتا۔

یہاں `canDecrease` کو condition کے طور پر استعمال کیا گیا ہے، اس لیے code کو سمجھنا آسان ہو جاتا ہے۔

`canDecrease` دیکھتے ہی سمجھ آ جاتا ہے کہ اس کا مطلب ہے “کیا current state میں مزید decrease کیا جا سکتا ہے؟”

### اضافی وضاحت: دو بار check کیوں کیا گیا؟

`-` button میں:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

یہاں `.disabled(!canDecrease)` بھی استعمال ہوا ہے، اور button کے اندر `if canDecrease` بھی استعمال ہوا ہے۔

`.disabled(!canDecrease)` interface level پر button کو disabled کر دیتا ہے، تاکہ user اسے click نہ کر سکے۔

`if canDecrease` code چلنے سے پہلے دوبارہ check کرتا ہے۔ صرف decrease possible ہونے کی صورت میں `count -= 1` execute ہوتا ہے۔

یہ double protection ہے۔ actual development میں، اگر button پہلے ہی disabled ہے، تو اندرونی condition کو چھوڑا جا سکتا ہے۔ لیکن teaching example میں اسے رکھنا `canDecrease` کے role کو زیادہ واضح کرتا ہے۔

## خلاصہ

اس lesson میں ہم نے بنیادی طور پر computed property سیکھی۔

Computed property value کو براہِ راست store نہیں کرتی۔ جب یہ read ہوتی ہے، تو موجودہ data کی بنیاد پر result calculate کرتی ہے۔

مثال کے طور پر:

```swift
var c: Int {
    a + b
}
```

یہاں `c` کو الگ سے store کرنے کی ضرورت نہیں، کیونکہ اسے `a + b` کے ذریعے calculate کیا جا سکتا ہے۔

Computed property کو لازماً `var` کے ذریعے declare کیا جاتا ہے، اور return type بتانا ضروری ہے۔

```swift
var canDecrease: Bool {
    count > 1
}
```

Computed property نہ صرف numerical value return کر سکتی ہے، بلکہ judgment result، text content، حتیٰ کہ SwiftUI view content بھی return کر سکتی ہے۔

اس lesson میں ہم نے `return` بھی سیکھا۔

`return` کا مطلب ہے result واپس کرنا:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

اگر computed property کے اندر result دینے والی صرف ایک expression ہو، تو `return` چھوڑا جا سکتا ہے۔

```swift
var totalPrice: Int {
    count * price
}
```

اس کے علاوہ، ہم نے `Color.primary` اور `disabled` کے بارے میں بھی جانا۔

`Color.primary` SwiftUI کی system semantic color ہے۔ یہ Light Mode اور Dark Mode کے مطابق display effect کو خودکار طور پر adjust کرتی ہے۔

```swift
.foregroundStyle(Color.primary)
```

`disabled` اس بات کو control کرنے کے لیے استعمال ہوتا ہے کہ view disabled ہے یا نہیں۔

```swift
.disabled(true)
```

اس کا مطلب ہے disabled، click نہیں کیا جا سکتا۔

```swift
.disabled(false)
```

اس کا مطلب ہے available، click کیا جا سکتا ہے۔

اس لیے computed property SwiftUI میں بہت عام ہے۔ یہ calculation results، conditions، اور display content کو زیادہ واضح طریقے سے organize کرنے میں مدد کرتی ہے۔
