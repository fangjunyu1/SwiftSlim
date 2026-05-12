# Xcode فائلوں کا نظم

اس سبق میں، ہم Xcode میں عام فائل آپریشنز سیکھیں گے۔

پچھلے اسباق میں، ہم نے زیادہ تر کوڈ `ContentView` میں لکھا تھا۔ اس سے کوڈ اور دکھائے جانے والے نتیجے کو دیکھنا آسان ہوتا ہے۔

مثال کے طور پر:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

لیکن ایک حقیقی App میں، عام طور پر تمام کوڈ ایک ہی فائل میں نہیں لکھا جاتا۔

جب صفحات، اجزا اور فیچرز زیادہ ہوتے جاتے ہیں، تو ہمیں مختلف views کو الگ الگ SwiftUI فائلوں میں تقسیم کرنا پڑتا ہے۔

مثال کے طور پر:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

اس سے کوڈ کی ساخت زیادہ واضح ہو جاتی ہے، اور بعد میں دیکھ بھال اور ترمیم بھی آسان ہوتی ہے۔

## فائلوں کا نظم کیوں ضروری ہے

SwiftUI میں، ایک صفحہ یا ایک جزو عام طور پر ایک الگ view فائل کے طور پر لکھا جا سکتا ہے۔

مثال کے طور پر:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

یہاں `CardView` ایک SwiftUI view ہے۔

اگر تمام views کو `ContentView` میں ہی لکھ دیا جائے، تو کوڈ بتدریج لمبا ہو جائے گا، اور اسے پڑھنا بھی مشکل ہوتا جائے گا۔

اس لیے ہمیں فائلیں بنانا، فائلوں کے نام بدلنا، فائلیں حذف کرنا، اور مختلف کوڈ فائلوں کو منظم کرنے کے لیے فولڈرز استعمال کرنا سیکھنا چاہیے۔

## SwiftUI فائل بنانا

Xcode میں SwiftUI فائل بنانے کے عام طور پر دو طریقے ہیں:

ایک طریقہ یہ ہے کہ ایک خالی فائل بنائیں، پھر خود کوڈ لکھیں۔

دوسرا طریقہ SwiftUI template فائل بنانا ہے، جس میں Xcode بنیادی کوڈ خودکار طور پر بنا دیتا ہے۔

ابتدائی سیکھنے والوں کے لیے SwiftUI template فائل استعمال کرنا زیادہ بہتر ہے، کیونکہ یہ بنیادی ساخت خودکار طور پر بنا دیتی ہے۔

### خالی فائل بنانا

Xcode کے بائیں طرف Navigator حصے میں، خالی جگہ یا فولڈر پر right-click کریں، پھر `New Empty File` منتخب کریں۔

عمل کی جگہ درج ذیل ہے:

![xcode](../../../Resource/027_view1.png)

خالی فائل بنانے کے بعد، Xcode عام طور پر ایک بے نام Swift فائل بناتا ہے، جیسے `Untitled.swift`۔

ہم اسے `TestView.swift` کے نام سے بدل سکتے ہیں۔

SwiftUI project میں، اگر یہ فائل ایک view دکھانے کے لیے استعمال ہو رہی ہو، تو عام طور پر نام کے آخر میں `View` شامل کرنے کی تجویز دی جاتی ہے۔

مثال کے طور پر:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

یہ لازمی اصول نہیں ہے، لیکن اس سے ہمیں ایک نظر میں معلوم ہو جاتا ہے کہ یہ ایک view فائل ہے۔

خالی فائل بنانے کے بعد، فائل میں صرف default comments ہو سکتے ہیں، یا یہ خالی بھی ہو سکتی ہے۔ یہ Xcode کے version اور بنانے کے طریقے پر منحصر ہے۔

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

اس وقت ہمیں SwiftUI کوڈ خود لکھنا ہوگا:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

اس طرح، ایک سادہ SwiftUI view فائل بن جاتی ہے۔

### فائل کا نام بدلنا

اگر فائل بنانے کے بعد اس کا نام بدلنا ہو، تو Xcode کے بائیں طرف Navigator حصے میں فائل منتخب کریں، پھر Return key `⏎` دبائیں۔

![xcode](../../../Resource/027_view2.png)

اس طرح فائل کا نام تبدیل کیا جا سکتا ہے۔

یہ بات نوٹ کریں کہ فائل کا نام بدلنے سے کوڈ کے اندر view کا نام خودکار طور پر تبدیل نہیں ہوتا۔

مثال کے طور پر، فائل کا نام `ProfileView.swift` کرنے کے بعد بھی، کوڈ میں `struct TestView: View` رہ سکتا ہے۔

یہ لازمی طور پر error نہیں بناتا، لیکن آسانی سے الجھن پیدا کر سکتا ہے۔

اس لیے بہتر ہے کہ فائل کا نام اور view کا نام ایک جیسا رکھا جائے۔ مثال کے طور پر، اگر فائل کا نام `ProfileView.swift` ہے، تو view کا نام بھی `ProfileView` استعمال کیا جائے۔

## SwiftUI template فائل بنانا

خالی فائل بنانے کے علاوہ، ہم براہ راست SwiftUI template فائل بھی بنا سکتے ہیں۔

Xcode کے بائیں طرف Navigator حصے میں، خالی جگہ یا فولڈر پر right-click کریں، پھر `New File from Template...` منتخب کریں۔

عمل کی جگہ درج ذیل ہے:

![xcode](../../../Resource/027_view3.png)

کھلنے والی window میں، اوپر مختلف platforms منتخب کیے جا سکتے ہیں، جیسے `iOS`، `macOS` وغیرہ۔

یہاں current project کے مطابق platform ہی منتخب رہنے دیں۔ مثال کے طور پر، اگر ہم iOS App بنا رہے ہیں، تو `iOS` منتخب کریں۔

![xcode](../../../Resource/027_view4.png)

پھر نیچے `SwiftUI View` منتخب کریں۔

![xcode](../../../Resource/027_view12.png)

اس کے بعد `Next` پر click کریں، فائل کا نام درج کریں اور save کریں۔

مثال کے طور پر، ہم `Test2View.swift` بناتے ہیں۔

Xcode خودکار طور پر نیچے جیسے کوڈ بنائے گا:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

خالی فائل کے مقابلے میں، template فائل میں `import SwiftUI`، `struct`، `body` اور `#Preview` خودکار طور پر شامل ہوتے ہیں۔

اس لیے ابتدائی سیکھنے والوں کے لیے SwiftUI template فائل استعمال کرنا زیادہ آسان ہے، اور کوڈ بھول جانے کا امکان بھی کم ہوتا ہے۔

**اشارہ**: right-click کر کے فائل بنانے کے علاوہ، Xcode کے بائیں طرف Navigator کے نیچے plus button پر click کر کے بھی فائل یا فولڈر بنایا جا سکتا ہے۔

![xcode](../../../Resource/027_view5.png)

## فولڈر بنانا

جب فائلیں زیادہ ہو جائیں، تو ہم انہیں منظم کرنے کے لیے فولڈرز استعمال کر سکتے ہیں۔

Xcode کے بائیں طرف Navigator حصے میں، خالی جگہ یا فولڈر پر right-click کریں، پھر `New Folder` منتخب کریں۔

فولڈر بنانے کے بعد، متعلقہ فائلوں کو اس فولڈر میں drag کیا جا سکتا ہے۔

![xcode](../../../Resource/027_view7.png)

فولڈرز بنیادی طور پر project structure کو منظم کرنے کے لیے استعمال ہوتے ہیں، یہ view کے استعمال کے طریقے کو نہیں بدلتے۔

جب تک view کا نام درست ہے، اسے دوسرے files میں اب بھی `TestView()`، `Test2View()` جیسے طریقے سے استعمال کیا جا سکتا ہے۔

## فائل یا فولڈر حذف کرنا

اگر فائل یا فولڈر حذف کرنا ہو، تو Xcode کے بائیں طرف Navigator حصے میں متعلقہ فائل منتخب کریں، پھر right-click کر کے `Delete` منتخب کریں۔

فائل منتخب کرنے کے بعد delete key `⌫` بھی دبائی جا سکتی ہے۔

Xcode حذف کرنے کی confirmation window دکھائے گا۔

![xcode](../../../Resource/027_view10.png)

`Move to Trash` منتخب کرنے کا مطلب ہے فائل کو Trash میں منتقل کرنا۔

اگر `Remove Reference` نظر آئے، تو اس کا مطلب ہے کہ صرف Xcode project سے reference ہٹایا جائے گا، لیکن disk پر موجود اصل فائل حذف نہیں ہوگی۔

ابتدائی سیکھنے والوں کے لیے، اگر صرف اپنی ابھی بنائی ہوئی عام فائل حذف کرنی ہو، تو عموماً `Move to Trash` منتخب کرنا کافی ہے۔

## کئی SwiftUI views دکھانا

فائل بنانا سیکھنے کے بعد، ہم مختلف views کو مختلف فائلوں میں تقسیم کر سکتے ہیں۔

مثال کے طور پر، ہم دو SwiftUI فائلیں بناتے ہیں:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` مصنف کا نام دکھانے کے لیے استعمال ہوتا ہے:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` card background دکھانے کے لیے استعمال ہوتا ہے:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

اس کے بعد، ہم ان دونوں views کو `ContentView` میں استعمال کر سکتے ہیں:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

چلانے کے بعد، ہم دیکھ سکتے ہیں کہ `CardView` اور `AuthorView` ایک ساتھ compose ہو کر دکھائے گئے ہیں:

![xcode](../../../Resource/027_view11.png)

اس نتیجے میں، `CardView` background کے طور پر ہے، اور `AuthorView` اوپر دکھائی دیتا ہے، کیونکہ انہیں `ZStack` میں رکھا گیا ہے۔

`ContentView` میں، ہم `CardView()` اور `AuthorView()` کے ذریعے ان دونوں views کو استعمال کرتے ہیں۔ نام کے بعد `()` کا مطلب ہے اس view کو بنانا اور استعمال کرنا۔

یہ SwiftUI میں عام view nesting ہے: ایک view کے اندر دوسرے views استعمال کیے جا سکتے ہیں۔

## entry file

آخر میں، ہم دوبارہ دیکھتے ہیں کہ App interface کہاں سے دکھانا شروع کرتا ہے۔

SwiftUI project میں، عام طور پر ایک entry file ہوتی ہے:

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

یہاں `@main` بتاتا ہے کہ یہ App کا entry point ہے۔

`WindowGroup` میں، ہم دیکھتے ہیں:

```swift
ContentView()
```

اس کا مطلب ہے کہ App شروع ہونے کے بعد سب سے پہلے `ContentView` دکھایا جاتا ہے۔

پھر `ContentView` کے اندر یہ بھی دکھایا جاتا ہے:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

اس لیے view hierarchy کو اس طرح سمجھا جا سکتا ہے:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

اگر ہم entry file میں دکھائے جانے والے view کو `CardView` میں بدل دیں:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

تو App شروع ہونے کے بعد صرف `CardView` دکھایا جائے گا۔

یعنی entry code میں موجود `WindowGroup` یہ طے کرتا ہے کہ App شروع ہونے کے بعد سب سے پہلے کون سا view دکھایا جائے۔

اور اس view کے اندر، دوسرے views مزید دکھائے جا سکتے ہیں۔

## خلاصہ

اس سبق میں، ہم نے Xcode میں عام فائل management operations سیکھے۔

ہم نے سیکھا کہ SwiftUI فائل کیسے بنائی جاتی ہے، فائل کا نام کیسے بدلا جاتا ہے، فولڈر کیسے بنایا جاتا ہے، اور فائل کیسے حذف کی جاتی ہے۔

ساتھ ہی، ہم نے ایک اہم concept بھی سیکھا: SwiftUI views کو مختلف files میں تقسیم کیا جا سکتا ہے، پھر انہیں دوسرے views میں استعمال کیا جا سکتا ہے۔

مثال کے طور پر:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

یہاں `CardView()` اور `AuthorView()` کا مطلب ہے `ContentView` میں دوسرے views استعمال کرنا۔

آخر میں، ہم نے entry file کی display logic بھی دوبارہ دیکھی۔

App شروع ہونے پر، پہلے `@main` کے نشان والے entry code میں داخل ہوتا ہے، پھر `WindowGroup` کے اندر موجود view دکھاتا ہے۔

یہ ہمیں سمجھنے میں مدد دیتا ہے کہ مختلف SwiftUI files الگ تھلگ نہیں ہوتیں۔ وہ آپس میں combine ہو سکتی ہیں، اور آخر میں مکمل App interface بناتی ہیں۔
