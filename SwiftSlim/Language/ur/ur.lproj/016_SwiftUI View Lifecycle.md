# SwiftUI ویو لائف سائیکل

پچھلے سبق میں، ہم نے یہ سمجھا تھا کہ @State ویری ایبل ویو کے لائف سائیکل کے ساتھ چلتا ہے، اور ہم نے onAppear کے بنیادی استعمال کو بھی سیکھا تھا۔

اس سبق میں، ہم SwiftUI ویو کے لائف سائیکل کو مزید گہرائی سے سمجھیں گے، یہ جانیں گے کہ ویو کیسے بنایا اور دکھایا جاتا ہے، اور ویو کے اندر موجود ویری ایبلز کیسے بنتے اور دوبارہ بنتے ہیں۔ ساتھ ہی ہم onAppear، onDisappear اور init کنسٹرکٹر بھی سیکھیں گے۔

ان معلومات کی بنیاد پر، ہم SwiftUI ویو کے پورے تعمیراتی عمل کے بارے میں ایک مجموعی سمجھ قائم کریں گے۔

## ایپ کے شروع ہونے کی ترتیب

جب ہم iOS پروجیکٹ بناتے ہیں، تو Xcode ڈیفالٹ طور پر دو فائلیں بناتا ہے:

```
ContentView.swift
پروجیکٹ کا نام + App.swift
```

ان میں سے "پروجیکٹ کا نام + App.swift" پوری ایپ کی entry file ہوتی ہے۔

مثال کے طور پر:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### کوڈ کے چلنے کا عمل

جب ہم App چلاتے ہیں (سیمیولیٹر یا اصلی ڈیوائس پر)، تو سسٹم پہلے @main کی ورڈ کو تلاش کرتا ہے:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

entry file کی تصدیق کے بعد، سسٹم کوڈ چلانا شروع کرتا ہے۔

سب سے پہلے App اسٹرکچر میں داخل ہوتا ہے، body کے اندر موجود کوڈ کو چلاتا ہے، پھر WindowGroup بناتا ہے اور اس کے اندر موجود ContentView کو لوڈ کرتا ہے۔

### WindowGroup کا کردار

WindowGroup ونڈو کو مینیج کرنے کے لیے استعمال ہوتا ہے:

```swift
WindowGroup {
    ContentView()
}
```

iPad اور macOS میں سسٹم multi-window کو سپورٹ کرتا ہے، جبکہ iPhone میں عام طور پر صرف ایک ونڈو ہوتی ہے۔

اس لیے، iPhone میں WindowGroup بنیادی طور پر پہلے دکھائے جانے والے انٹرفیس کو مینیج کرتا ہے۔

### ویو لوڈ ہونے کا عمل

جب سسٹم ContentView کو تلاش کر لیتا ہے:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI body کے اندر موجود کوڈ کو چلاتا ہے، پھر واپس آنے والی ویو اسٹرکچر (جیسے VStack، Text وغیرہ) کی بنیاد پر انٹرفیس بناتا ہے، اور اسے اسکرین پر دکھاتا ہے۔

یہ مراحل مکمل ہونے کے بعد، ہم ویو میں ContentView کو دیکھ سکتے ہیں۔

![ContentView](../../Resource/016_view1.png)

یہ سمجھنا ضروری ہے کہ body کا کام ویو بنانا ہے، ویو کو محفوظ رکھنا نہیں۔

اس کا مطلب یہ ہے کہ ہر بار جب ویو refresh ہوتا ہے، SwiftUI دوبارہ body کو calculate کرتا ہے، اور نئی ویو اسٹرکچر پیدا کرتا ہے۔

### Preview ویو کی لاجک

Xcode Preview (Canvas) اور اصل چلنے والا App دو مختلف mechanisms ہیں۔

مثال کے طور پر، entry file میں ایک debug output شامل کرتے ہیں:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

اگر آپ Xcode میں ContentView کا preview دیکھتے ہیں، تو execution @main entry سے شروع نہیں ہوتی، اس لیے entry file کے اندر موجود onAppear trigger نہیں ہوگا۔

لیکن اگر آپ اسے simulator یا اصلی ڈیوائس پر چلاتے ہیں، تو سسٹم @main سے execution شروع کرے گا، پورے App کو مکمل flow کے ساتھ چلائے گا، اور entry کے اندر موجود onAppear trigger ہوگا اور debug information print ہوگی۔

اصل فرق یہ ہے کہ Xcode Preview صرف "جزوی render" کرتا ہے، جس کا مقصد صرف موجودہ ویو کو دکھانا ہوتا ہے؛ جبکہ simulator اور اصلی ڈیوائس "مکمل runtime environment" فراہم کرتے ہیں، جہاں پورا App execute ہوتا ہے۔

اس لیے، App کی functionality چیک کرتے وقت simulator یا اصلی ڈیوائس کو معیار بنانا چاہیے، کیونکہ Xcode Preview مکمل runtime environment فراہم نہیں کرتا۔

## ویو کا لائف سائیکل

موجودہ مرحلے میں، ہمارا سارا کوڈ ContentView میں موجود ہے۔ لیکن اصل ایپلیکیشن میں، ایک App میں عام طور پر کئی ویوز ہوتے ہیں، اور وہ مختلف scenarios میں ایک دوسرے کے ساتھ switch ہوتے ہیں۔

مثال کے طور پر، "منی باکس" میں:

![PiggyBank](../../Resource/016_view.png)

جب "Save Money" پر کلک کیا جاتا ہے، تو SaveView دکھایا جاتا ہے؛ اور جب saving مکمل ہو جائے یا ویو بند ہو، تو SaveView ہٹا دیا جاتا ہے۔

یہی عمل ایک ویو کا لائف سائیکل ہے: ویو بننا، ویو دکھنا، اور آخر میں ویو کا ہٹ جانا۔

### ایپ بند کرنا

جب App بند ہوتا ہے، تو تمام ویوز ہٹا دیے جاتے ہیں، اور ان سے متعلقہ states بھی ختم ہو جاتی ہیں۔

اس لیے، ContentView اور دوسرے ویوز میموری سے ہٹا دیے جاتے ہیں، اور پوری ایپ کی runtime state صاف ہو جاتی ہے۔

## ویو میں ویری ایبلز کا لائف سائیکل

SwiftUI میں، ویری ایبلز کا لائف سائیکل عموماً ویو کے ساتھ بندھا ہوتا ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State ویری ایبل

@State سے declare کیا گیا ویری ایبل ویو کے لائف سائیکل کے ساتھ بندھا ہوتا ہے۔

```swift
@State private var name = "FangJunyu"
```

جب ویو بنتا ہے، تو name بھی بنتا ہے؛ اور جب ویو ہٹایا جاتا ہے، تو name بھی ختم ہو جاتا ہے۔

اسی لیے ہمیں UserDefaults جیسی تکنیک استعمال کرنی پڑتی ہے تاکہ ڈیٹا مستقل طور پر محفوظ رکھا جا سکے۔

### body کے اندر کا ویری ایبل

وہ ویری ایبل جو body کے اندر define کیا جاتا ہے:

```swift
var num = 10
```

اس کا لائف سائیکل body کے execution process کے ساتھ بندھا ہوتا ہے۔

جب SwiftUI میں state تبدیل ہوتی ہے، مثال کے طور پر:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

جب name بدلتا ہے، تو @State اس تبدیلی کو detect کرتا ہے، اور SwiftUI کو notify کرتا ہے کہ ویو کو دوبارہ calculate کیا جائے، یعنی body کو دوبارہ calculate کیا جاتا ہے۔

جب body دوبارہ calculate ہوتا ہے، تو body کے اندر کا سارا کوڈ دوبارہ execute ہوتا ہے، اور body کے اندر موجود ویری ایبلز (جیسے num) بھی دوبارہ بنائے جاتے ہیں۔

اسی لیے، body کے اندر پیچیدہ ویری ایبلز define کرنے کی سفارش نہیں کی جاتی۔

کیونکہ ہر بار ویو refresh ہونے پر، body کے اندر موجود ویری ایبلز دوبارہ بنیں گے، جس سے calculation cost بڑھ سکتی ہے اور performance متاثر ہو سکتی ہے۔

SwiftUI میں، مختلف قسم کے ڈیٹا کو مختلف طریقے سے manage کرنا چاہیے۔ جو ڈیٹا ویو کے لائف سائیکل کے ساتھ چلنا چاہیے، اسے @State میں رکھا جا سکتا ہے؛ اور جو ڈیٹا صرف وقتی calculation کے لیے ہو، اسے body میں رکھا جا سکتا ہے۔

## onAppear اور onDisappear

پچھلے سبق میں، ہم onAppear سیکھ چکے ہیں۔ جب ویو اسکرین پر ظاہر ہوتا ہے، تو onAppear کال ہوتا ہے۔

```swift
.onAppear {}
```

مثال کے طور پر:

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
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode Preview یا اصل execution میں، آپ onAppear کے اندر موجود debug output دیکھ سکتے ہیں۔

### onDisappear

onAppear کے مقابلے میں onDisappear استعمال ہوتا ہے:

```swift
.onDisappear {}
```

جب ویو بند ہوتا ہے، تو onDisappear کال ہوتا ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

جب ویو ہٹایا جاتا ہے، تو onDisappear کے اندر موجود کوڈ execute ہوتا ہے۔

نوٹ: موجودہ مرحلے میں استعمال ہونے والا ContentView ایپ کا root view ہے، اس لیے اسے براہ راست بند یا remove نہیں کیا جا سکتا۔ اسی وجہ سے، اس مرحلے پر onDisappear کے execution کو واضح طور پر observe کرنا ممکن نہیں ہوتا۔

بعد میں جب ہم page navigation یا نیا ویو کھولنا سیکھیں گے، تب onDisappear کے call ہونے کو دیکھا جا سکے گا۔

## بننے اور دکھنے کی لاجک

یہ سمجھنا ضروری ہے کہ ویو کا بننا اور ویو کا دکھنا، دو الگ مراحل ہیں۔

جب ویو create ہوتا ہے، تو struct کا constructor کال ہوتا ہے:

```swift
init() {}
```

کیونکہ SwiftUI کا ویو ایک struct ہوتا ہے:

```swift
struct ContentView: View { ... }
```

اس لیے، جب ویو کی instance create ہوتی ہے، تو init constructor execute ہوتا ہے۔ اور جب ویو اسکرین پر ظاہر ہوتا ہے، تب onAppear کال ہوتا ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

اگر آپ Xcode میں preview دیکھیں، تو debug output میں یہ نظر آ سکتا ہے:

```swift
Create ContentView
Show ContentView
```

اس سے واضح ہوتا ہے کہ پہلے init کے ذریعے ویو create ہوتا ہے، پھر body کے اندر کا کوڈ calculate ہوتا ہے، اور آخر میں ویو ظاہر ہوتا ہے اور onAppear execute ہوتا ہے۔

اس لیے، یہ سمجھنا ضروری ہے کہ ویو کا create ہونا اور ویو کا display ہونا الگ الگ مراحل ہیں۔

### init کنسٹرکٹر

init Swift کی بنیادی syntax کا حصہ ہے۔ struct اور class دونوں میں اسے define کیا جا سکتا ہے، اور یہ object کو initialize کرنے کے لیے استعمال ہوتا ہے۔

```swift
init() {}
```

SwiftUI میں، جب ویو create ہوتا ہے، تو سسٹم اس ویو کا init method کال کرتا ہے۔ اسے parameters وصول کرنے یا ابتدائی data تیار کرنے کے لیے استعمال کیا جا سکتا ہے۔

اگر آپ init خود نہ لکھیں، تو Swift struct کے لیے خود بخود ایک default constructor generate کر دیتا ہے۔

ContentView جیسے SwiftUI ویوز کے لیے، ویو create ہوتے وقت init execute ہوتا ہے، اور ویو display ہوتے وقت onAppear execute ہوتا ہے۔

اس لیے، init ویو کے create ہونے کے وقت چلنے والا constructor ہے، اور بعد میں parameters pass کرنے یا data initialize کرنے میں اس کا کردار اہم ہوگا۔

## خلاصہ

اس سبق میں ہم نے ایپ کے startup sequence کو سیکھا، یعنی entry file سے لے کر ContentView تک execution کا flow کیسے چلتا ہے۔

ہم نے SwiftUI ویو لائف سائیکل کو سمجھا: ویو create ہوتے وقت init execute ہوتا ہے، اسکرین پر ظاہر ہونے پر onAppear execute ہوتا ہے، اور ویو کے remove یا close ہونے پر onDisappear execute ہوتا ہے۔

ہم نے ویو update mechanism بھی سیکھا: ویو state-driven ہوتا ہے، اور جب @State جیسی state تبدیل ہوتی ہے، تو SwiftUI ویو کو refresh کرتا ہے، body کو دوبارہ calculate کرتا ہے، اور body کے اندر موجود ویری ایبلز بھی دوبارہ بن جاتے ہیں۔

ویری ایبلز کا لائف سائیکل ویو کے لائف سائیکل کے ساتھ جڑا ہوتا ہے، جبکہ body کے اندر موجود عارضی ویری ایبلز ہر refresh پر دوبارہ create ہوتے ہیں۔

ان lifecycle اور variable behavior کو سمجھنے سے ہم کوڈ کو زیادہ بہتر طریقے سے organize کر سکتے ہیں، اور App کی logic کو زیادہ واضح بنا سکتے ہیں۔
