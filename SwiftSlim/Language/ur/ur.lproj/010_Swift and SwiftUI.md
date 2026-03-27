# Swift اور SwiftUI

Apple platforms کی development سیکھتے وقت، بہت سے tutorials میں Swift اور SwiftUI کو الگ الگ سمجھایا جاتا ہے۔ اس سے beginners کے ذہن میں ایک قسم کی ٹوٹی ہوئی سمجھ بنتی ہے، اور وہ غلطی سے یہ سمجھ سکتے ہیں کہ یہ دو بالکل الگ technologies ہیں۔

حقیقت میں، Swift اور SwiftUI گہرے طور پر ایک دوسرے سے جڑے ہوئے ہیں: Swift ایک programming language ہے، جو logic اور data فراہم کرتی ہے؛ جبکہ SwiftUI ایک user interface framework ہے جو Swift کی بنیاد پر بنایا گیا ہے، اور views کی rendering اور interaction کی ذمہ داری سنبھالتا ہے۔

یہ سبق آپ کو ایک واضح ذہنی فریم ورک بنانے میں مدد دے گا: Swift کیا ہے، SwiftUI کیا ہے، اور یہ دونوں code میں ایک دوسرے کے ساتھ کیسے کام کرتے ہیں۔

## Swift کیا ہے؟

Swift Apple کی طرف سے پیش کی گئی ایک جدید programming language ہے، جو iOS، macOS، watchOS، اور tvOS جیسے platforms کے لیے applications بنانے میں استعمال ہوتی ہے۔

![swift](../../RESOURCE/010_swift.png)

Swift ایک strong type اور static language ہے۔ اس کی design میں safety پر زیادہ زور دیا گیا ہے، جس کی وجہ سے کئی عام programming errors (جیسے null pointer یا out-of-bounds) کم ہو جاتے ہیں، اور یہ C اور Objective-C کے ساتھ بھی بے رکاوٹ integration کی حمایت کرتی ہے۔

عملی development میں، Swift زیادہ تر application کے logic والے حصے کو سنبھالتی ہے، مثلاً data processing، network requests، storage operations وغیرہ۔

## SwiftUI کیا ہے؟

SwiftUI Apple کی طرف سے 2019 میں متعارف کرایا گیا ایک نیا interface-building framework ہے۔ SwiftUI declarative programming model استعمال کرتا ہے، جس کی مدد سے developers زیادہ مختصر code کے ذریعے interface structure اور interaction behavior بیان کر سکتے ہیں۔

![swiftui](../../RESOURCE/010_swiftui.png)

Declarative programming کا مطلب یہ ہے کہ developer صرف یہ بتاتا ہے کہ کیا دکھانا ہے، اور system data کی تبدیلی کے مطابق خودکار طور پر view کو refresh کرتا ہے۔ اس طرح interface state کو manually update کرنے کی ضرورت کم ہو جاتی ہے، اور UI development کافی آسان ہو جاتی ہے۔

SwiftUI کا core view components (جیسے `Text`، `Image`، `Button`) اور layout containers (جیسے `VStack`، `HStack`، `ZStack`) پر مشتمل ہے۔ یہ components data binding اور state management کے ذریعے interaction کرتے ہیں، جس سے interface data change ہونے پر خودکار طور پر update ہو سکتی ہے۔

## Swift اور SwiftUI ایک ساتھ کیسے کام کرتے ہیں؟

Swift اور SwiftUI کی ذمہ داریوں کو چند نکات میں یوں سمیٹا جا سکتا ہے:

**1. Swift: logic اور data کو handle کرنا**

Swift بنیادی طور پر data کو manage کرنے، state کو محفوظ رکھنے، اور logic execute کرنے کے لیے استعمال ہوتی ہے۔ یہ code عام طور پر interface rendering کو براہِ راست نہیں چلاتا، بلکہ data اور behavior کو handle کرتا ہے۔

مثلاً، Swift میں data process کرنا:

```swift id="smy8uh"
let markdown = try? String(contentsOf: url)
```

اس قسم کے code میں variable declaration، constant definition، functions، control flow وغیرہ شامل ہوتے ہیں، اور یہ براہِ راست view کی ظاہری شکل کو کنٹرول نہیں کرتے۔

**2. SwiftUI: interface کو declare اور render کرنا**

SwiftUI user interface کے layout اور content کو بنانے کے لیے استعمال ہوتی ہے، اور بنیادی طور پر interface rendering اور view interaction کی ذمہ داری لیتی ہے۔

مثلاً، SwiftUI کے ذریعے ایک text view بنانا:

```swift id="e4wq5v"
Text("SwiftSlim")
```

یہ تمام code interface elements کو بنانے اور کنٹرول کرنے کے لیے ہوتی ہے، اور براہِ راست user interface سے متعلق ہوتی ہے۔

### بنیادی مثال

نیچے ایک سادہ SwiftUI example دیا گیا ہے:

```swift id="9l7uti"
// ContentView.swift

import SwiftUI

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

#Preview {
    ContentView()
}
```

اس example میں:

**SwiftUI code**: `VStack`، `Image`، `Text`، `padding` سب SwiftUI کا حصہ ہیں، اور interface کی display اور layout کے ذمہ دار ہیں۔

**Swift code**: فائل کے اوپر موجود `//` comment اور `import SwiftUI`، Swift code structure کا حصہ ہیں؛ نیچے موجود `#Preview` Xcode preview کے لیے macro ہے، اور اصل interface rendering میں شامل نہیں ہوتا۔

### نسبتاً آگے کی مثال

عملی projects میں، Swift اور SwiftUI اکثر ایک ساتھ استعمال ہوتے ہیں، تاکہ دونوں اپنی اپنی مضبوطی کے مطابق کام کر سکیں:

```swift id="sfon3g"
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

اس example میں:

**SwiftUI code**: `@State` ایک SwiftUI-specific property wrapper ہے، جو view کی mutable state کو declare کرنے کے لیے استعمال ہوتا ہے؛ `Button` اور `Text` SwiftUI view components ہیں، جو interface display اور user interaction کی ذمہ داری لیتے ہیں۔

**Swift code**: `private var name` اور `func printName()` Swift code ہیں، جو data کو store کرتے ہیں اور logic execute کرتے ہیں، اور براہِ راست view rendering کو نہیں چلاتے۔

جب user button پر tap کرتا ہے، تو SwiftUI button کے اندر موجود action code کو trigger کرتا ہے:

```swift id="e5utnx"
Button("Print") {
    printName()
}
```

یہاں `Button` ایک SwiftUI component ہے، جبکہ چلنے والا `printName()` function Swift code ہے، جو مخصوص logic کو execute کرتا ہے۔

اسی تعاون کی وجہ سے Swift اور SwiftUI بغیر کسی رکاوٹ کے ایک ساتھ کام کر سکتے ہیں: Swift data اور logic سنبھالتی ہے، جبکہ SwiftUI user interface کو display کرتی ہے۔

## Swift اور SwiftUI code عموماً کہاں لکھی جاتی ہے؟

SwiftUI میں interface، `body` property کے ذریعے واپس آنے والی view سے بنتی ہے۔ اس لیے وہ تمام code جو interface کو بیان کرتی ہے، عموماً `body` کے اندر لکھی جاتی ہے۔

مثلاً:

```swift id="3l29x5"
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

اس example میں `Text` ایک SwiftUI view component ہے، اس لیے اسے لازماً `body` کے اندر لکھا جاتا ہے، کیونکہ SwiftUI `body` کو پڑھ کر interface generate کرتی ہے۔

وہ code جو interface سے براہِ راست متعلق نہ ہو، جیسے variables، functions، یا data processing logic، عام طور پر `body` کے باہر لکھی جاتی ہے۔ مثلاً:

```swift id="q54je9"
struct ContentView: View {

    // سوئفٹ: ڈیٹا یا منطق
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: انٹرفیس
    var body: some View {
        Text(name)
    }
}
```

یہ بھی یاد رکھنا چاہیے کہ `body` کے اندر بھی Swift syntax استعمال ہو سکتی ہے، جیسے `if`، `for` وغیرہ، لیکن یہاں ان کا مقصد SwiftUI views کی generation کو کنٹرول کرنا ہوتا ہے:

```swift id="w59d0k"
if isLogin {
    Text("Welcome")
}
```

اس لیے SwiftUI development میں سادہ طور پر یوں سمجھا جا سکتا ہے: view code (`Text`، `Image`، `Button` وغیرہ) عموماً `body` کے اندر لکھی جاتی ہے؛ جبکہ data اور logic code (variables، functions وغیرہ) عموماً `body` کے باہر لکھی جاتی ہے۔

## Swift files

جوں جوں ہم آگے سیکھتے جائیں گے، ہم MVVM architecture سے بھی واقف ہوں گے، جہاں ViewModel اور Model layers عموماً pure Swift code پر مشتمل ہوتی ہیں، اور view layer (SwiftUI) سے مکمل طور پر الگ ہوتی ہیں۔

مثلاً، application state کو manage کرنے والی ایک class:

```swift id="l4mupy"
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

یا data structure کو بیان کرنے والی ایک struct:

```swift id="g3qewh"
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

اس قسم کی files کی ذمہ داری data کو manage اور persist کرنا ہوتی ہے۔ چونکہ یہ براہِ راست view میں ظاہر نہیں ہوتیں، اس لیے یہ مکمل طور پر Swift کے دائرے میں آتی ہیں۔

## تاریخی پس منظر

Swift اور SwiftUI کے تعلق کو اچھی طرح سمجھنے کے لیے Apple development technologies کی تاریخی پیش رفت کو جاننا بھی مفید ہے۔ 2026 تک یہ technology stack کئی iterations سے گزری ہے۔

### Swift کی تاریخ

Swift کے آنے سے پہلے، Objective-C Apple platforms کی بنیادی programming language تھی، اور یہ C language کے ساتھ mixed coding کی حمایت کرتی تھی۔ اس کی syntax نسبتاً طویل تھی، اور beginners کے لیے اس میں داخل ہونا نسبتاً مشکل تھا:

```objectivec id="j1n4mf"
// مقصد-C نحو
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 میں Apple نے WWDC کے دوران Swift language متعارف کرائی۔ Swift کی syntax زیادہ modern ہے، type safety زیادہ مضبوط ہے، اور آہستہ آہستہ یہ Objective-C کی جگہ مرکزی development language بن گئی:

```swift id="e086c3"
// تیز نحو
let name = "Fang"
print("Hello, \(name)")
```

تاہم، Objective-C مکمل طور پر ختم نہیں ہوئی۔ یہ اب بھی بہت سے legacy projects اور lower-level frameworks میں وسیع پیمانے پر استعمال ہوتی ہے۔ اس کی بنیادی syntax کو سمجھنا پرانے projects کو maintain کرنے اور system internals کو سمجھنے کے لیے اب بھی مفید ہے۔

### SwiftUI کی تاریخ

SwiftUI کے آنے سے پہلے، iOS میں **UIKit** اور macOS میں **AppKit** استعمال ہوتے تھے۔ یہ دونوں frameworks "imperative" programming style پر مبنی تھے۔ Developers کو یا تو Storyboard کے ذریعے controls drag-and-drop کرنے پڑتے تھے، یا manually code لکھ کر view state کو control کرنا پڑتا تھا۔ اس سے code زیادہ ہوتی تھی اور maintenance cost بھی بڑھ جاتی تھی، خاص طور پر جب interface logic پیچیدہ ہو۔

![storyboard](../../RESOURCE/010_xcode.png)

2019 میں Apple نے WWDC میں رسمی طور پر SwiftUI جاری کیا۔ SwiftUI نے "declarative" programming paradigm متعارف کرایا، جس نے UI development کے عمل کو نمایاں طور پر آسان بنا دیا۔

![storyboard](../../RESOURCE/010_xcode1.png)

یہ بات اہم ہے کہ SwiftUI مکمل طور پر ایک آزاد نچلی سطح کی implementation نہیں ہے۔ مختلف platforms پر یہ بنیادی طور پر UIKit (iOS) یا AppKit (macOS) کے ساتھ bridge اور cooperation کے ذریعے کام کرتی ہے، اور نچلی سطح پر اب بھی انہی frameworks پر انحصار کرتی ہے۔

### Swift اور UIKit/AppKit کا تعلق

اگرچہ Swift ایک general-purpose programming language ہے، اور Apple کے مختلف platforms پر چل سکتی ہے، لیکن یہ مکمل طور پر UIKit یا AppKit کا متبادل نہیں ہے۔ کچھ پیچیدہ interface requirements، یا وہ functionalities جنہیں SwiftUI ابھی تک cover نہیں کرتی، اب بھی UIKit یا AppKit کی مدد سے بنانی پڑتی ہیں۔

مثلاً، UIKit پیچیدہ view controller management، animation effects، gesture recognition وغیرہ میں کافی mature ہے، اور اس کے پیچھے طویل عملی تجربہ موجود ہے۔ SwiftUI کی صلاحیتیں اگرچہ مسلسل بہتر ہو رہی ہیں، لیکن کچھ edge cases میں اب بھی اس کی حدود موجود ہیں۔

اسی لیے بہت سے developers اپنے projects میں SwiftUI اور UIKit (یا AppKit) کو ملا کر استعمال کرتے ہیں، تاکہ دونوں کے فوائد سے بھرپور فائدہ اٹھایا جا سکے۔

اس زاویے سے دیکھا جائے تو SwiftUI کو UIKit / AppKit کی ایک high-level encapsulation سمجھا جا سکتا ہے۔ SwiftUI سیکھتے وقت اگر UIKit اور AppKit کے بنیادی تصورات سے بھی واقفیت حاصل کی جائے، تو legacy projects کی maintenance یا پیچیدہ features کے implementation میں زیادہ مناسب technical فیصلے کیے جا سکتے ہیں۔

## خلاصہ

**Swift**: بنیادی طور پر logic، data processing، control flow وغیرہ لکھنے کے لیے استعمال ہوتی ہے، اور view layout سے براہِ راست متعلق نہیں ہوتی۔

**SwiftUI**: declarative انداز میں user interface بنانے کے لیے استعمال ہوتی ہے، اور view content اور layout سے متعلق code SwiftUI کے دائرے میں آتی ہے۔

عملی development میں، Swift اور SwiftUI عموماً ایک ساتھ استعمال ہوتے ہیں: Swift logic سنبھالتی ہے، اور SwiftUI interface۔

Objective-C اور UIKit سے Swift اور SwiftUI تک، Apple کا development environment بتدریج زیادہ modern اور زیادہ مختصر programming style کی طرف آیا ہے، لیکن UIKit اور AppKit اب بھی بہت سے روایتی projects میں اہمیت رکھتے ہیں۔

Swift اور SwiftUI کے تعلق کو سمجھ کر ہم iOS/macOS development زیادہ مؤثر انداز میں کر سکتے ہیں، اور legacy projects کو maintain کرتے وقت بھی زیادہ مناسب technical انتخاب کر سکتے ہیں۔