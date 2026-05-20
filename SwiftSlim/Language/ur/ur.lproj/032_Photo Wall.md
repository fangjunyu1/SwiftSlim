# فوٹو گیلری

اس سبق میں ہم ایک فوٹو گیلری صفحہ بنائیں گے۔

![view](../../../Resource/032_view13.png)

اس مثال میں، ہم `extension`، `self` اور instance کے علم کا اعادہ کریں گے، اور SwiftUI میں عام طور پر استعمال ہونے والی `Shape` شکلوں کے بارے میں سیکھیں گے۔

ان معلومات کے ذریعے، ہم عام تصاویر کو دائرہ، گول کونوں والی مستطیل، capsule اور ellipse جیسی مختلف صورتوں میں کاٹ سکتے ہیں، اور تصاویر میں border effect شامل کر سکتے ہیں۔

اس سبق میں چند نئے نکات استعمال ہوں گے: `Shape`، `clipShape`، `strokeBorder` اور `overlay`۔

ان میں، `clipShape` view کی شکل کو کاٹنے کے لیے استعمال ہوتا ہے، `strokeBorder` شکل کا border بنانے کے لیے استعمال ہوتا ہے، اور `overlay` موجودہ view کے اوپر ایک نیا view تہہ کے طور پر رکھنے کے لیے استعمال ہوتا ہے۔

## تصویری مواد

شروع کرنے سے پہلے، ہمیں چند تصاویر تیار کرنی ہوں گی۔

آپ اپنی تصاویر استعمال کر سکتے ہیں، یا اس سبق میں دی گئی مثال کی تصاویر استعمال کر سکتے ہیں۔

اس سبق کی مثال والی تصاویر [Pixabay](https://pixabay.com/) ویب سائٹ سے لی گئی ہیں:

[منظر](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)، [لومڑی](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)، [عمارت](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)، [پھول](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)، [ہنس](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

تصاویر ڈاؤن لوڈ کرنے کے بعد، انہیں `Assets` resource folder میں شامل کریں، اور ترتیب سے `1`، `2`، `3`، `4`، `5` نام دیں۔

![assets](../../../Resource/032_view17.png)

اس طرح، ہم SwiftUI میں `Image("1")`، `Image("2")` وغیرہ کے ذریعے تصاویر دکھا سکتے ہیں۔

## تصاویر دکھانا

سب سے پہلے، ہم `ContentView` میں 5 تصاویر دکھاتے ہیں:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ظاہری نتیجہ:

![view](../../../Resource/032_view.png)

اس کوڈ میں، ہم `ScrollView` استعمال کر کے تصاویر کی فہرست کو scrollable بناتے ہیں، اور `VStack` استعمال کر کے کئی تصاویر کو اوپر سے نیچے ترتیب دیتے ہیں۔

ہر تصویر `.resizable()`، `.scaledToFit()` اور `.frame(width: 300)` کے ذریعے اپنی display effect سیٹ کرتی ہے، تاکہ تصویر scale ہو سکے، اپنا aspect ratio برقرار رکھ سکے، اور اس کی چوڑائی محدود رہے۔

`VStack` پر موجود `.padding(.vertical, 100)` اوپر اور نیچے کا فاصلہ بڑھانے کے لیے استعمال ہوتا ہے، تاکہ پہلی اور آخری تصویر screen کے کناروں کے بہت زیادہ قریب نہ ہوں۔

آخر میں `.ignoresSafeArea()` کا مطلب ہے کہ scroll view safe area کو نظر انداز کرے، تاکہ تصاویر scroll ہوتے وقت screen کے اوپر اور نیچے تک پھیل سکیں، اور صفحہ زیادہ مکمل دکھائی دے۔

لیکن اس وقت 5 تصاویر ایک ہی modifiers استعمال کر رہی ہیں:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

جب ہمیں دہرایا ہوا کوڈ نظر آئے، تو ہم اسے منظم کرنے کے لیے `extension` استعمال کرنے پر غور کر سکتے ہیں۔

## extension استعمال کر کے تصویری style منظم کرنا

ہم `Image` کے لیے فوٹو گیلری مخصوص method extend کر سکتے ہیں:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

یہاں، ہم نے `Image` type کے لیے ایک `photoGalleryStyle` method extend کیا ہے۔

اس method کے اندر پہلے دہرائے گئے `.resizable()`، `.scaledToFit()` اور `.frame(width: 300)` شامل ہیں۔ یعنی یہ تصویر کی scaling، proportional display اور width setting کے کوڈ کو ایک جگہ منظم کر دیتا ہے۔

اس extension کو استعمال کرنے کے بعد، اصل تصویری کوڈ:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

اس طرح مختصر کیا جا سکتا ہے:

```swift
Image("1")
    .photoGalleryStyle()
```

اس طرح، ہر تصویر کو صرف `.photoGalleryStyle()` call کرنے کی ضرورت ہے، اور وہی فوٹو گیلری style apply ہو جائے گا۔ کوڈ زیادہ صاف ہو جاتا ہے، اور بعد میں unified modification بھی زیادہ آسان ہو جاتی ہے۔

## self کو سمجھنا

extension method میں، ہم نے `self` لکھا ہے:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

یہاں `self` اس موجودہ image instance کو ظاہر کرتا ہے جو یہ method call کر رہا ہے۔

مثال کے طور پر:

```swift
Image("1")
    .photoGalleryStyle()
```

اس کوڈ میں، `photoGalleryStyle()` کو `Image("1")` نے call کیا ہے، اس لیے method کے اندر موجود `self` اسی `Image("1")` تصویر کو ظاہر کرتا ہے۔

سادہ طور پر اسے یوں سمجھا جا سکتا ہے: جو اس method کو call کرتا ہے، `self` اسی کو ظاہر کرتا ہے۔

یہ بات نوٹ کرنے کی ہے کہ SwiftUI کے modifiers مسلسل نئے view results واپس کرتے ہیں۔ اس لیے `photoGalleryStyle()` ایک modified view واپس کرتا ہے، نہ کہ صرف اصل `Image` کو ہی واپس کرتا ہے۔

## تصویر کی شکلیں

اب تصاویر عام طور پر دکھائی دے رہی ہیں۔ لیکن یہ تصاویر default طور پر مستطیل ہوتی ہیں، اس لیے قدرے عام لگتی ہیں۔

اگر آپ صرف تصاویر میں گول کونے شامل کرنا چاہتے ہیں، تو براہ راست `.cornerRadius()` استعمال کر سکتے ہیں:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

ظاہری نتیجہ:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` کا مطلب ہے کہ تصویر میں `20 pt` کا corner radius شامل کیا جائے۔ عام rounded-corner images کے لیے یہ syntax کافی ہے۔

لیکن `.cornerRadius()` صرف rounded-corner effect کو handle کر سکتا ہے، اور ordinary rounded-corner images بنانے کے لیے مناسب ہے۔ اگر ہم تصاویر کو مزید مختلف شکلوں میں بدلنا چاہتے ہیں، تو صرف یہ modifier کافی نہیں ہے۔

اس وقت ہمیں SwiftUI میں `Shape` استعمال کرنے کی ضرورت ہوتی ہے۔ `Shape` مختلف graphics کو ظاہر کر سکتا ہے، اور `clipShape` کے ساتھ مل کر تصویر کو متعلقہ شکل میں crop کر سکتا ہے۔

## Shape کو سمجھنا

SwiftUI میں، `Shape` graphic کو ظاہر کرتا ہے۔ `View` کی طرح، یہ بھی SwiftUI میں بہت عام استعمال ہونے والی type ہے۔

عام `Shape` types میں circle، rectangle، rounded rectangle، capsule اور ellipse شامل ہیں۔ مختلف graphics کی ظاہری شکل کو زیادہ intuitively دیکھنے کے لیے، نیچے دی گئی مثالوں میں ہر graphic کے لیے مختلف color اور size سیٹ کیے گئے ہیں۔

ان مثالوں میں، `.fill()` graphic کو رنگ سے بھرنے کے لیے استعمال ہوتا ہے، اور `.frame()` graphic کا display size سیٹ کرنے کے لیے استعمال ہوتا ہے۔ رنگ صرف مختلف graphics میں فرق کرنے کے لیے ہیں، یہ خود graphics کے fixed colors نہیں ہیں۔

### Circle دائرہ

`Circle` دائرہ ظاہر کرتا ہے۔ یہ اکثر avatar، circular button، circular image اور دوسرے interface effects میں استعمال ہوتا ہے۔

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle مستطیل

`Rectangle` مستطیل ظاہر کرتا ہے۔ یہ بنیادی ترین graphics میں سے ایک ہے، اور background، divided area یا ordinary border بنانے کے لیے بھی استعمال ہو سکتا ہے۔

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle گول کونوں والی مستطیل

`RoundedRectangle` گول کونوں والی مستطیل ظاہر کرتا ہے۔ `cornerRadius` corner radius سیٹ کرنے کے لیے استعمال ہوتا ہے۔

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule کیپسول شکل

`Capsule` capsule shape کو ظاہر کرتا ہے۔ اس کے دونوں سرے arc کی شکل کے ہوتے ہیں، اور یہ اکثر capsule buttons، tag backgrounds اور دوسرے interface effects کے لیے استعمال ہوتا ہے۔

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse بیضوی شکل

`Ellipse` ellipse کو ظاہر کرتا ہے۔ یہ `Circle` سے ملتا جلتا ہے، لیکن جب width اور height مختلف ہوں، تو یہ ellipse کے طور پر دکھائی دیتا ہے۔

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

ان مثالوں سے دیکھا جا سکتا ہے کہ `Shape` خود بھی براہ راست graphic کے طور پر دکھائی دے سکتا ہے۔ اس کے بعد، ہم ان `Shape` types کو `clipShape` کے ساتھ استعمال کر کے تصاویر crop کریں گے، تاکہ تصاویر مختلف شکلوں میں دکھائی دیں۔

## clipShape استعمال کر کے تصاویر crop کرنا

اب، ہم `clipShape` استعمال کر کے تصاویر کو مختلف شکلوں میں crop کر سکتے ہیں۔

مثال کے طور پر، پہلی تصویر کو دائرے میں crop کریں:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

اس کوڈ کا مطلب ہے: پہلے ایک تصویر دکھائیں، پھر `Circle()` استعمال کر کے اسے دائرے میں crop کریں۔

![view](../../../Resource/032_view2.png)

`clipShape` کی بنیادی syntax یہ ہے:

```swift
.clipShape(شکل)
```

view کے بعد `.clipShape(...)` شامل کریں، اور parentheses کے اندر وہ graphic لکھیں جس میں آپ crop کرنا چاہتے ہیں۔

مثال کے طور پر:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

اب ہم 5 تصاویر کو الگ الگ شکلوں میں crop کرتے ہیں:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ظاہری نتیجہ:

![view](../../../Resource/032_view8.png)

ان میں، `Rectangle()` سے crop کرنے کے بعد effect عام rectangular photo کے قریب ہوتا ہے، اس لیے visual change واضح نہیں ہوتا، اور یہ بنیادی طور پر دوسری shapes کے ساتھ comparison کے لیے استعمال ہوتا ہے۔

اب تصاویر صرف ordinary rectangles نہیں رہیں، بلکہ ان کی مختلف شکلیں ہیں۔

## تصویر کا border شامل کرنا

اگر ہم circular photo میں border شامل کرنا چاہیں، تو ممکن ہے ہم `border` استعمال کرنے کا سوچیں:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

لیکن اس طرح عموماً circular border نہیں ملتا، بلکہ rectangular border ملتا ہے۔

![view](../../../Resource/032_view9.png)

اس کی وجہ یہ ہے کہ `border` view کے rectangular area کے مطابق border شامل کرتا ہے، نہ کہ `clipShape` سے crop ہونے کے بعد والی shape کے مطابق۔

اس لیے، اگر ہم circular border چاہتے ہیں، تو `border` کو براہ راست استعمال نہیں کر سکتے۔

## strokeBorder استعمال کر کے shape border بنانا

SwiftUI میں، `strokeBorder` ان common `Shape` types کے لیے inner border draw کر سکتا ہے۔

مثال کے طور پر، ایک circular border draw کریں:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

اس کوڈ کا مطلب ہے: `Circle` کے لیے ایک brown border draw کریں، جس کی border width `10 pt` ہو۔

![view](../../../Resource/032_view12.png)

یہاں نوٹ کرنا ضروری ہے کہ `strokeBorder` براہ راست تصویر میں border شامل نہیں کرتا، بلکہ `Circle()` اس graphic کے لیے border draw کرتا ہے۔

یعنی، اس کوڈ سے صرف ایک independent circular border بنتا ہے، اور ابھی اس کا تصویر سے تعلق نہیں ہے۔

اگر ہم چاہتے ہیں کہ یہ circular border تصویر کے اوپر دکھائی دے، تو ہمیں `overlay` استعمال کرتے ہوئے border کو تصویر پر overlay کرنا ہو گا۔

## overlay استعمال کر کے border کو overlay کرنا

`overlay` ایک view modifier ہے، جو current view کے اوپر نیا view overlay کر سکتا ہے۔

اس کی basic structure کو یوں سمجھا جا سکتا ہے:

```swift
موجودہ view
    .overlay {
        overlay view
    }
```

اس مثال میں، current view وہ تصویر ہے جسے پہلے ہی circle میں crop کیا جا چکا ہے:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

ہم جس نئے view کو overlay کرنا چاہتے ہیں، وہ circular border ہے:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

لہٰذا، ہم تصویر اور border کو combine کر سکتے ہیں:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

یہاں `overlay` کا مطلب ہے کہ current view کے اوپر ایک نیا view overlay کیا جائے۔

`overlay` کے اندر، border current photo کے display range کے مطابق overlay ہوتا ہے، اس لیے الگ سے `frame` سیٹ کرنے کی ضرورت نہیں ہوتی۔ جب تک border shape اور clipping shape ایک جیسی ہوں، border تصویر کے ساتھ fit ہو سکتا ہے۔

![view](../../../Resource/032_view10.png)

آخری effect یہ ہے کہ circular photo کے اوپر ایک circular border cover ہو جاتا ہے۔

`ZStack` کے مقابلے میں، `overlay` اس طرح کے “current view میں decoration شامل کرنے” والے scenario کے لیے زیادہ مناسب ہے۔ تصویر main subject ہے، اور border صرف additional effect ہے، اس لیے `overlay` استعمال کرنا زیادہ واضح ہے۔

## فوٹو گیلری مکمل کرنا

اب، ہم ہر تصویر میں corresponding shape اور border شامل کرتے ہیں:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ظاہری نتیجہ:

![view](../../../Resource/032_view13.png)

اس طرح، ایک basic photo gallery page مکمل ہو گیا۔

اس page میں، ہم `ScrollView` استعمال کر کے scrollable display بناتے ہیں، `Image` استعمال کر کے تصاویر دکھاتے ہیں، `clipShape` سے photo shapes crop کرتے ہیں، اور `overlay` اور `strokeBorder` کے ذریعے border شامل کرتے ہیں۔

## مکمل کوڈ

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## خلاصہ

اس سبق میں، ہم نے ایک photo gallery page مکمل کیا۔

![view](../../../Resource/032_view13.png)

اس مثال میں، ہم نے پہلے `Image` استعمال کر کے تصاویر دکھائیں، پھر `extension` کے ذریعے `Image` کے لیے `photoGalleryStyle` method extend کیا، تاکہ repeated image style code کو منظم کیا جا سکے۔

اس کے بعد، ہم نے SwiftUI میں common `Shape` types سیکھیں، جیسے `Circle`، `Rectangle`، `RoundedRectangle`، `Capsule` اور `Ellipse`۔ یہ graphics نہ صرف براہ راست دکھائے جا سکتے ہیں، بلکہ `clipShape` کے ساتھ مل کر views crop کرنے کے لیے بھی استعمال ہو سکتے ہیں۔

مثال کے طور پر:

```swift
.clipShape(Circle())
```

اس کا مطلب ہے view کو circle میں crop کرنا۔

آخر میں، ہم نے `overlay` اور `strokeBorder` استعمال کر کے تصاویر میں corresponding shape borders شامل کیے۔ یہ بات نوٹ کرنے کی ہے کہ `border` عموماً view کے rectangular area کے مطابق border draw کرتا ہے۔ اگر آپ چاہتے ہیں کہ border circle، capsule یا ellipse کے ساتھ follow کرے، تو اسی `Shape` کو overlay کرنا زیادہ مناسب ہے۔

اس سبق کے ذریعے، ہم نے نہ صرف photo gallery effect مکمل کیا، بلکہ interface میں `Shape`، `clipShape`، `strokeBorder` اور `overlay` کے common combination کو بھی سمجھا۔

## سبق کے بعد کی مشقیں

### 1. فوٹو گیلری background شامل کریں

فوٹو گیلری page میں ایک full-screen background image شامل کریں۔

تقاضا: background image پورے screen کو fill کرے، اور safe area کو ignore کرے۔

### 2. Gradient border

موجودہ single-color borders کو linear gradient borders میں تبدیل کریں۔

آپ `LinearGradient` استعمال کر کے زیادہ rich border effects بنانے کی کوشش کر سکتے ہیں۔

### 3. simulated photo frame

انٹرنیٹ پر کچھ حقیقی photo frame styles تلاش کریں، اور `overlay` استعمال کر کے image frame overlay کرنے کی کوشش کریں، تاکہ تصاویر real picture frame کے زیادہ قریب لگیں۔

مشق کا ظاہری نتیجہ:

![button](../../../Resource/032_view15.jpeg)

### 4. rounded button border بنائیں

حقیقی development میں، buttons اکثر rounded rectangle borders استعمال کرتے ہیں۔

ایک rounded button بنانے کی کوشش کریں، اور `RoundedRectangle` اور `strokeBorder` استعمال کر کے button میں rounded border شامل کریں۔

مشق کا ظاہری نتیجہ:

![button](../../../Resource/032_view14.png)

### سوچنے کا سوال

اگر آپ single-color border نہیں استعمال کرنا چاہتے، اور gradient border بھی نہیں استعمال کرنا چاہتے، بلکہ چاہتے ہیں کہ border کسی pattern effect کو دکھائے، تو اسے کیسے implement کیا جائے؟

آپ related usages جیسے `overlay`، `mask` یا `ImagePaint` کے بارے میں جاننے کے لیے material تلاش کرنے کی کوشش کر سکتے ہیں۔

مشق کا ظاہری نتیجہ:

![button](../../../Resource/032_view16.png)
