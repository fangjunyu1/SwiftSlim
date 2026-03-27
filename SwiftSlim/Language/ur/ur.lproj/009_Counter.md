# کاؤنٹر

پچھلے دو اسباق میں ہم نے variables، constants، buttons، اور methods سیکھی تھیں۔

اس سبق میں ہم ان تمام معلومات کو ملا کر ایک سادہ counter App بنائیں گے۔

اس مثال میں ہم یہ سیکھیں گے کہ variable کو کیسے محفوظ اور تبدیل کیا جاتا ہے، اور variable کو manage کرنے کے لیے `@State` کیسے استعمال کیا جاتا ہے۔

## کاؤنٹر بنانا

Counter عموماً ایسی quantity کو record کرنے کے لیے استعمال ہوتا ہے جسے بار بار بڑھانا ہو۔ مثال کے طور پر، رسی کودنے کی تعداد، دوڑ کے چکروں کی تعداد وغیرہ۔

اب ہم ایک سادہ counter بناتے ہیں: ایک number دکھایا جائے گا، اور ایک button ہوگا، جسے دبانے پر number بڑھ جائے گا۔

![Num](../../RESOURCE/009_num.png)

### number دکھانا

سب سے پہلے، ہم `Text` کے ذریعے ایک number دکھاتے ہیں۔

```swift
Text("0")
```

لیکن اگر number کو بدلنا ہو، تو `"0"` کو براہِ راست نہیں لکھنا چاہیے، بلکہ number کو ایک variable میں محفوظ کرنا چاہیے۔

```swift
var num = 0
```

پھر `Text` میں variable کو دکھائیں:

```swift
Text("\(num)")
```

یہاں string interpolation `\()` استعمال ہوئی ہے، جس کے ذریعے number کو string میں تبدیل کر کے دکھایا جاتا ہے۔

### button کے ذریعے number بڑھانا

اگلا مرحلہ ایک button شامل کرنا ہے۔

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

جب button دبایا جائے، تو ہم چاہتے ہیں کہ number بڑھ جائے۔

اس لیے button کے اندر variable کو modify کیا جا سکتا ہے:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

اس code کا مطلب ہے: جب button دبایا جائے، تو `num + 1` calculate ہوگا، اور نتیجہ `num` کو assign کر دیا جائے گا۔

### زیادہ مختصر syntax

Swift ایک زیادہ مختصر syntax بھی فراہم کرتا ہے:

```swift
num += 1
```

یہ اس کے برابر ہے:

```swift
num = num + 1
```

اس syntax کو “compound assignment operator” کہا جاتا ہے۔

Swift میں عام compound assignment operators یہ ہیں:

```swift
+=   جمع کر کے assign کرنا
-=   منفی کر کے assign کرنا
*=   ضرب کر کے assign کرنا
/=   تقسیم کر کے assign کرنا
%=   باقی تقسیم assign کرنا
```

مثلاً:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### مکمل code

اب ہم ایک سادہ counter لکھ سکتے ہیں:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

لیکن اس مرحلے پر یہ code درست طریقے سے نہیں چلے گا۔

### error ظاہر ہونا

Xcode یہ error دکھائے گا:

```swift
Cannot assign to property: 'self' is immutable
```

اس کا مطلب ہے کہ property کو modify نہیں کیا جا سکتا، کیونکہ view immutable ہے۔

ایسا کیوں ہوتا ہے؟

## SwiftUI کا کام کرنے کا طریقہ

SwiftUI میں: **interface data-driven ہوتی ہے**، یعنی جب data بدلتا ہے تو interface خود بخود refresh ہوتی ہے۔

لیکن ایک اہم بات یہ ہے کہ SwiftUI صرف تبھی changes کو monitor کرتا ہے اور view کو refresh کرتا ہے جب state (جیسے `@State` یا `@Binding`) تبدیل ہو۔

اگر آپ عام variable استعمال کریں، تو SwiftUI صرف view create ہونے کے وقت اس variable کی value ایک بار پڑھے گا؛ اس کے بعد چاہے variable بدل بھی جائے، interface update نہیں ہوگی۔

مثلاً:

```swift
var num = 0   // 0
num = 1   // 0
```

اوپر والی مثال میں `num` ایک عام variable ہے۔ اگرچہ اس کی value بدل گئی، SwiftUI پھر بھی view کو update نہیں کرے گا، اور interface ابتدائی `0` ہی دکھاتی رہے گی۔

![Num](../../RESOURCE/009_state.png)

اس لیے، صرف اسی وقت SwiftUI خود بخود تبدیلی کو monitor کرتا ہے اور view update کرتا ہے جب data کو state کے طور پر mark کیا جائے، مثلاً `@State`، `@Binding` وغیرہ جیسے property wrappers استعمال کر کے۔

## `@State` property wrapper

SwiftUI میں اگر کسی variable کو modify کرنا ہو اور ساتھ view بھی update کرنی ہو، تو `@State` استعمال کرنا ضروری ہے۔

```swift
@State var num = 0
```

`@State` SwiftUI کو یہ variable observe کرنے دیتا ہے۔

جب variable بدلتا ہے، تو SwiftUI دوبارہ view calculate کرتا ہے اور view کو update کر دیتا ہے۔

مکمل code:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

اب، جب button دبایا جائے گا:

```swift
num += 1
```

تو SwiftUI detect کرے گا کہ `num` بدل گیا ہے، اور پھر خود بخود view کو update کر دے گا۔

![Num](../../RESOURCE/009_state1.png)

## `@State` استعمال کرنے کے اصول

عملی development میں، `@State` عام طور پر دو اصولوں پر عمل کرتا ہے۔

### 1. `@State` عام طور پر `private` کے ساتھ استعمال ہوتا ہے

`@State` variable عموماً صرف موجودہ type (مثلاً موجودہ View struct) کے اندر استعمال ہوتا ہے، اس لیے اکثر اسے یوں لکھا جاتا ہے:

```swift
@State private var num = 0
```

اس طرح دوسرے views اس variable کو براہِ راست access یا modify نہیں کر سکتے۔

ابھی ہم نے `private` نہیں سیکھا، اسے سادہ انداز میں یوں سمجھیں:

**`private` سے مراد یہ ہے کہ اس سے modify کیا گیا content صرف موجودہ view کے اندر استعمال ہو سکتا ہے، باہر والا view اسے استعمال نہیں کر سکتا۔**

### 2. `@State` صرف موجودہ view کی state کے لیے ہوتا ہے

`@State` ایسے data کے لیے موزوں ہے جسے موجودہ View خود manage کرتی ہے۔

مثلاً، text field کا content، یا switch کی state۔

```swift
@State private var isOn = false
@State private var text = ""
```

اگر data کو کئی views کے درمیان share کرنا ہو، تو پھر دوسری state types استعمال کی جاتی ہیں، مثلاً `@Binding` یا `@Observable`۔

یہ چیزیں ہم بعد کے اسباق میں سیکھیں گے۔

### کم کرنے والا button

Counter صرف بڑھانے کے لیے نہیں، کم کرنے کے لیے بھی ہو سکتا ہے۔

ہم ایک `-` button شامل کر سکتے ہیں۔

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

پھر `HStack` استعمال کر کے buttons کو افقی ترتیب میں رکھ سکتے ہیں:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

نتیجہ:

![Num](../../RESOURCE/009_num1.png)

جب `+` button دبایا جائے گا، number میں 1 کا اضافہ ہوگا؛ جب `-` button دبایا جائے گا، number میں 1 کی کمی ہوگی۔

### reset button

ہم ایک reset button بھی شامل کر سکتے ہیں، جو number کو دوبارہ `0` کر دے۔

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

جب reset button دبایا جائے گا، تو `num` کو `0` assign کر دیا جائے گا۔

نتیجہ:

![Num](../../RESOURCE/009_num2.png)

جب `0` button دبایا جائے گا، number دوبارہ `0` ہو جائے گا۔

### custom button

اس وقت ہمارے buttons صرف text دکھا سکتے ہیں:

```swift
Button("+") {

}
```

اس syntax والا button صرف text content دکھا سکتا ہے، مثلاً `+` یا `-`۔

عملی development میں، ہم عموماً چاہتے ہیں کہ button کی appearance زیادہ بہتر ہو، مثلاً icon یا کسی اور view کے ذریعے۔

SwiftUI ہمیں button کے display content کو customize کرنے دیتا ہے۔ اس کے لیے button کی ایک اور syntax استعمال کی جاتی ہے:

```swift
Button(action: {

}, label: {

})
```

اس syntax میں `action` سے مراد وہ code ہے جو button دبانے پر execute ہوگا، اور `label` وہ view ہے جو button کے اوپر دکھائی دے گی۔

مثلاً، ہم button پر ایک SF Symbols icon دکھا سکتے ہیں:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

اب button text کے بجائے ایک icon دکھائے گا۔

### counter interface کو بہتر بنانا

Counter کی interface کو زیادہ واضح بنانے کے لیے ہم number کے display style کو بھی بہتر کر سکتے ہیں۔ مثلاً number کو بڑا دکھانا:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

اس کے بعد، ہم button کے display content کو بھی icons میں بدل سکتے ہیں، اور icon size بھی مناسب حد تک بڑا کر سکتے ہیں:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

اسی طرح، ہم کم کرنے والے button اور reset button کو بھی icons میں تبدیل کر سکتے ہیں:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

اب buttons پر SF Symbols icons دکھائی دیں گے، اور interface زیادہ واضح محسوس ہوگی۔

![Num](../../RESOURCE/009_num3.png)

## خلاصہ

اس سبق میں ہم نے ایک سادہ counter بنا کر variable، `Text`، اور `Button` کے استعمال کی جامع مشق کی۔ ہم نے variable میں number محفوظ کیا، اور button کے ذریعے اسے بڑھانا یا کم کرنا سیکھا، ساتھ ہی compound assignment operators جیسے `num += 1` اور `num -= 1` بھی سیکھے۔

اس عمل کے دوران ہم نے SwiftUI کے کام کرنے کے طریقے کو بھی سمجھا: interface data-driven ہوتی ہے۔ جب data بدلتا ہے، تبھی interface refresh ہوتی ہے۔ اسی لیے ہمیں change ہونے والی state کو `@State` کے ذریعے محفوظ کرنا پڑتا ہے۔ جب `@State` variable بدلتا ہے، تو SwiftUI خود بخود view کو update کر دیتا ہے۔

آخر میں ہم نے interface میں سادہ بہتری بھی کی، `Text` کی font style تبدیل کی، اور `Button(action:label:)` کے ذریعے button content کو customize کیا، تاکہ buttons icons دکھا سکیں، اور counter کی interface زیادہ واضح اور خوبصورت بن جائے۔

اب ہم SwiftUI views کے بنیادی استعمال سے واقف ہو چکے ہیں۔ SwiftUI میں زیادہ تر interfaces variables کے ذریعے چلتی ہیں۔ جب variables بدلتی ہیں، تو SwiftUI خود بخود view کو update کر دیتا ہے۔ اسی لیے SwiftUI App development میں ہم عموماً پہلے یہ طے کرتے ہیں کہ کون سا data محفوظ کرنا ہے، اور پھر اسی data کی بنیاد پر interface اور interaction logic بناتے ہیں۔

## مکمل code

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
