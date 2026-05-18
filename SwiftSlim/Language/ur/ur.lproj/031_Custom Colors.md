# حسبِ ضرورت رنگ

اس سبق میں، ہم سیکھیں گے کہ SwiftUI میں رنگوں کو اپنی ضرورت کے مطابق کیسے بنایا جاتا ہے۔

پچھلے اسباق میں، ہم SwiftUI کے فراہم کردہ ڈیفالٹ رنگ استعمال کر چکے ہیں، مثلاً:

```swift
Color.blue
Color.red
Color.green
```

یہ رنگ استعمال کرنے میں بہت آسان ہیں، لیکن حقیقی App ڈیولپمنٹ میں ڈیفالٹ رنگ عموماً کافی حد تک درست نہیں ہوتے۔

مثلاً، ڈیزائن فائل میں اس طرح کے رنگ استعمال ہو سکتے ہیں:

```text
#2c54c2
#4875ed
#213e8d
```

اس قسم کے رنگ کو Hex رنگ کہا جاتا ہے۔

اس سبق میں، ہم پہلے SwiftUI کو Hex رنگوں کی حمایت دیں گے، پھر `static` استعمال کر کے عام استعمال ہونے والے رنگوں کو منظم کریں گے۔

آخر میں، ہم حسبِ ضرورت رنگوں کو جانوروں کی انسائیکلوپیڈیا ویو میں لاگو کریں گے، اور مزید یہ کہ gradient پس منظر استعمال کریں گے، تاکہ بٹن زیادہ تہہ دار محسوس ہو۔

## حسبِ ضرورت رنگوں کی ضرورت کیوں ہے؟

SwiftUI میں، ہم براہِ راست system colors استعمال کر سکتے ہیں۔

مثلاً:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

یہاں `.blue` نیلا رنگ ظاہر کرتا ہے، یہ دراصل `Color.blue` کی مختصر شکل ہے۔

ڈیفالٹ رنگوں کا فائدہ یہ ہے کہ وہ سادہ اور آسان ہیں، لیکن رنگوں کا انتخاب نسبتاً محدود ہوتا ہے۔

مثلاً:

```swift
Color.blue
```

یہ صرف SwiftUI کے فراہم کردہ ڈیفالٹ نیلے رنگ کو ظاہر کر سکتا ہے۔

![Color.blue](../../../Resource/031_color6.png)

لیکن عملی ڈیولپمنٹ میں، ہمیں اکثر زیادہ مخصوص رنگوں کی ضرورت ہوتی ہے۔

مثلاً، سب نیلا ہونے کے باوجود، ہلکا نیلا، گہرا نیلا، سرمئی مائل نیلا، روشن نیلا وغیرہ مختلف اثرات ہو سکتے ہیں۔

![مزید نیلا](../../../Resource/031_color5.png)

اس وقت، اگر صرف `Color.blue` استعمال کیا جائے، تو ڈیزائن کا اثر بحال کرنا مشکل ہو جاتا ہے۔

اسی لیے، ہمیں SwiftUI کو حسبِ ضرورت رنگوں کی حمایت دینا ضروری ہے۔

## Hex رنگ کیا ہے؟

اسکرین پر رنگ عموماً سرخ، سبز اور نیلے تین channels سے بنتے ہیں، یعنی RGB۔

RGB بالترتیب یہ ظاہر کرتا ہے:

```text
Red     // سرخ
Green   // سبز
Blue    // نیلا
```

Hex رنگ RGB رنگ کی ایک representation ہے۔

مثلاً:

```swift
#5479FF
```

اس رنگ کی value کو آسانی سے تین حصوں میں سمجھا جا سکتا ہے:

```text
54  // سرخ channel ظاہر کرتا ہے
79  // سبز channel ظاہر کرتا ہے
FF  // نیلا channel ظاہر کرتا ہے
```

اس سبق میں، ہمیں ان values کو calculate کرنے کی ضرورت نہیں، اور نہ ہی hexadecimal rules کو گہرائی سے سمجھنے کی ضرورت ہے۔

اب صرف یہ جاننا کافی ہے: `#5479FF` ایک مخصوص رنگ ظاہر کرتا ہے۔

آئندہ جب ہم `#2c54c2`، `#4875ed` جیسی writing دیکھیں، تو اسے پہلے ایک color value کے طور پر سمجھ سکتے ہیں۔

Sketch، Figma، Photoshop جیسے design tools میں بھی اس طرح کی color values اکثر نظر آتی ہیں۔

![رنگ](../../../Resource/031_color.png)

لیکن، SwiftUI میں ڈیفالٹ طور پر براہِ راست یوں نہیں لکھا جا سکتا:

```swift
Color(hex: "#5479FF")
```

اس لیے، ہمیں خود `Color` type کو extend کرنا ہوگا، تاکہ یہ Hex string کے ذریعے color بنانے کی حمایت کرے۔

## Color+Hex.swift فائل بنانا

سب سے پہلے، ہم ایک نئی Swift فائل بناتے ہیں۔

فائل کا نام یوں رکھا جا سکتا ہے:

```text
Color.swift
```

یا زیادہ واضح طور پر یوں لکھا جا سکتا ہے:

```text
Color+Hex.swift
```

یہاں زیادہ recommend کیا جاتا ہے کہ استعمال کریں:

```text
Color+Hex.swift
```

Swift project میں، `Color+Hex.swift` جیسے file names بہت عام ہیں۔

اس کا مطلب ہے کہ یہ فائل `Color` میں Hex capability شامل کرنے والی extension file ہے۔

فائل کا نام براہِ راست code execution کو متاثر نہیں کرتا، یہ صرف ہمیں اس فائل کا مقصد آسانی سے سمجھانے کے لیے ہے۔

## Color(hex:) code شامل کرنا

`Color+Hex.swift` فائل میں، نیچے دیا گیا code لکھیں:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

یہ code `extension` استعمال کر کے `Color` type کو extend کرتا ہے، اور `Color` میں ایک نیا initializer شامل کرتا ہے:

```swift
init(hex: String)
```

اس initializer کے بعد، ہم Hex string کو `Color` میں pass کر سکتے ہیں، اور یوں ایک custom color بنا سکتے ہیں:

```swift
Color(hex: "#5479FF")
```

یہ extension code اندرونی طور پر Hex string کو SwiftUI کے قابلِ شناخت RGB color میں convert کرتا ہے۔

اس مرحلے پر ہر line کی conversion logic کو گہرائی سے سمجھنے کی ضرورت نہیں، صرف یہ جاننا کافی ہے کہ شامل کیا گیا `Color(hex:)` method ہمیں Hex color value کے ذریعے custom color بنانے دیتا ہے۔

## حسبِ ضرورت رنگ استعمال کرنا

اب، ہم `ContentView` میں custom color کو test کر سکتے ہیں۔

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Display effect:

![رنگ](../../../Resource/031_color1.png)

اس example میں، پہلی line system color استعمال کرتی ہے:

```swift
.foregroundStyle(Color.blue)
```

بعد کی تین lines custom Hex colors استعمال کرتی ہیں:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

comparison کے ذریعے دیکھا جا سکتا ہے کہ system blue کا صرف ایک default effect ہے۔

جبکہ Hex colors نیلے رنگ کی زیادہ باریک changes ظاہر کر سکتے ہیں۔

یہی custom colors کی value ہے: یہ interface کے colors کو حقیقی design کے زیادہ قریب بنا سکتا ہے، اور ہمیں App کے visual style کو control کرنا بھی زیادہ آسان بناتا ہے۔

## static استعمال کر کے رنگ منظم کرنا

اب، ہم Hex string کے ذریعے color بنا سکتے ہیں:

```swift
Color(hex: "#2c54c2")
```

یہ writing normal طور پر استعمال ہو سکتی ہے، لیکن اگر ایک ہی color کئی جگہوں پر بار بار آئے، تو بعد میں maintenance اتنی آسان نہیں رہتی۔

اگر 10 جگہوں پر یہی color value لکھی گئی ہو، اور بعد میں اس blue کو modify کرنا ہو، تو ہر جگہ الگ الگ modify کرنا پڑے گا۔

اس وقت، ہم `static` استعمال کر کے common colors کو ایک جگہ منظم کر سکتے ہیں۔

`Color+Hex.swift` فائل کے آخر میں، نیچے دیا گیا code مزید شامل کریں:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

یہاں، ہم نے `Color` میں تین static properties شامل کی ہیں: `animalBlue`، `animalLightBlue` اور `animalDarkBlue`، جو مختلف گہرائی کے نیلے رنگ ظاہر کرتی ہیں۔

چونکہ یہ properties `static` استعمال کرتی ہیں، اس لیے یہ خود `Color` type سے تعلق رکھتی ہیں۔

استعمال کرتے وقت، `Color.` کے ذریعے براہِ راست access کیا جا سکتا ہے:

```swift
Color.animalBlue
```

یہ writing براہِ راست Hex string لکھنے سے زیادہ واضح ہے۔

جب ہم `Color.animalBlue` دیکھتے ہیں، تو ہمیں معلوم ہو سکتا ہے کہ یہ جانوروں کی انسائیکلوپیڈیا میں استعمال ہونے والا blue ہے۔

جبکہ `Color(hex: "#2c54c2")` دیکھنے پر، صرف اتنا معلوم ہوتا ہے کہ یہ ایک color value ہے، لیکن اس کا خاص استعمال آسانی سے سمجھ نہیں آتا۔

colors کو centrally manage کرنے کا ایک اور فائدہ ہے: بعد میں modify کرنا آسان ہوتا ہے۔

اگر جانوروں کی انسائیکلوپیڈیا کا main color adjust کرنا ہو، تو صرف definition والی جگہ modify کرنا کافی ہے:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

اس color کو استعمال کرنے والی تمام جگہیں ایک ساتھ update ہو جائیں گی۔

یہی `static` استعمال کر کے colors کو منظم کرنے کا معنی ہے: color names زیادہ واضح ہوتے ہیں، اور future maintenance بھی زیادہ آسان ہو جاتی ہے۔

## جانوروں کی انسائیکلوپیڈیا میں لاگو کرنا

اب، ہم custom colors کو پچھلے animal encyclopedia view میں apply کر سکتے ہیں۔

پہلے animal button کا background سفید تھا:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

اب، ہم اسے custom color میں بدل سکتے ہیں:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

یہاں `Color.animalBlue` وہ static color ہے جو ہم نے ابھی `Color+Hex.swift` میں define کیا ہے۔

Button text سفید استعمال کرتا ہے:

```swift
.foregroundStyle(Color.white)
```

animal emoji کا background semi-transparent white استعمال کرتا ہے:

```swift
.background(Color.white.opacity(0.15))
```

اس طرح button ایک unified blue visual style بنائے گا۔

اس step کا focus complex code بڑھانا نہیں، بلکہ پچھلے حصے میں سیکھے گئے custom colors کو واقعی interface میں apply کرنا ہے۔

## gradient پس منظر استعمال کرنا

ایک single color استعمال کرنے کے علاوہ، ہم کئی colors کو ملا کر gradient effect بھی بنا سکتے ہیں۔

مثلاً، ہم نے پہلے یہ colors define کیے تھے:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

یہ colors نہ صرف اکیلے استعمال ہو سکتے ہیں، بلکہ gradient background میں combine بھی کیے جا سکتے ہیں۔

SwiftUI میں، `LinearGradient` استعمال کر کے linear gradient بنایا جا سکتا ہے۔

مثلاً:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

یہ code left سے right کی طرف ایک gradient background بنائے گا، جس میں color `Color.animalBlue` سے آہستہ آہستہ `Color.animalLightBlue` میں transition کرے گا۔

ان میں، `colors` gradient میں حصہ لینے والے colors set کرنے کے لیے استعمال ہوتا ہے، جبکہ `startPoint` اور `endPoint` gradient direction کو control کرنے کے لیے استعمال ہوتے ہیں۔

### gradient effect test کرنا

ہم ایک simple Text سے gradient background test کر سکتے ہیں۔

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Display effect:

![رنگ](../../../Resource/031_color3.png)

اس example میں، `Text` کا background اب single color نہیں، بلکہ left سے right تک آہستہ بدلتا ہوا gradient color ہے۔

عام background color کے مقابلے میں، gradient background زیادہ layering دے سکتا ہے، اور interface میں visual focus پیدا کرنا بھی زیادہ آسان بناتا ہے۔

## جانوروں کی انسائیکلوپیڈیا میں gradient background استعمال کرنا

اب، ہم animal button کے background color کو:

```swift
.background(Color.animalBlue)
```

gradient background میں modify کر سکتے ہیں:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Complete code درج ذیل ہے:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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
```

Display effect:

![رنگ](../../../Resource/031_color4.png)

اب، animal button صرف single background color نہیں رہا، بلکہ اس میں left سے right تک gradient effect موجود ہے۔

single-color background کے مقابلے میں، gradient background interface کو زیادہ layered دکھا سکتا ہے، اور حقیقی App میں visual design کے زیادہ قریب بناتا ہے۔

## single-color background اور gradient background کا فرق

single-color background صرف ایک color استعمال کرتا ہے۔

مثلاً:

```swift
.background(Color.animalBlue)
```

یہ writing simple اور واضح ہے، اور زیادہ تر basic interfaces کے لیے مناسب ہے۔

gradient background کئی colors استعمال کرتا ہے۔

مثلاً:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

یہ writing interface کو زیادہ layered بنا سکتی ہے، لیکن visual complexity بھی بڑھا سکتی ہے۔

اسی لیے، practical development میں اسے اس طرح سمجھا جا سکتا ہے:

single-color background عام text، عام buttons، عام cards، اور عام page backgrounds کے لیے مناسب ہے۔

gradient background اہم buttons، top area، cover cards، feature entries وغیرہ جیسے emphasized positions کے لیے مناسب ہے۔

## خلاصہ

اس سبق میں، ہم نے SwiftUI میں custom colors استعمال کرنے کا طریقہ سیکھا۔

سب سے پہلے، ہم نے Hex color کو سمجھا۔

مثلاً:

```text
#2c54c2
```

یہ ایک specific color ظاہر کرتا ہے۔

پھر، ہم نے `extension Color` استعمال کر کے `Color` type کو extend کیا۔

تاکہ SwiftUI نیچے دیے گئے طریقے سے color بنا سکے:

```swift
Color(hex: "#2c54c2")
```

اس کے بعد، ہم نے `static` استعمال کر کے common colors کو organize کیا:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

اس طرح، دوسرے views میں براہِ راست استعمال کیا جا سکتا ہے:

```swift
Color.animalBlue
```

ہر بار Hex string لکھنے کے مقابلے میں، یہ approach زیادہ واضح ہے، اور بعد میں colors کو centrally modify کرنا بھی زیادہ آسان بناتا ہے۔

آخر میں، ہم نے `LinearGradient` سیکھا، اور custom colors کو gradient background میں combine کیا:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

اس سبق کے ذریعے، ہم نے “custom color بنانا” سے “حقیقی interface میں color استعمال کرنا” تک کا عمل مکمل کیا۔

آئندہ جب کوئی color کئی جگہوں پر بار بار استعمال ہونے کی ضرورت ہو، تو اسے پہلے `Color` extension میں organize کرنے پر غور کیا جا سکتا ہے۔

اس طرح code زیادہ واضح ہوگا، اور interface style کو unify کرنا بھی زیادہ آسان ہو جائے گا۔
