# Loop-கள் மற்றும் பட்டியல்கள்

இந்தப் பாடத்தில், Swift இல் உள்ள `for` loop-ஐவும், SwiftUI இல் உள்ள `ForEach`-ஐவும் கற்போம்.

இரண்டுமே array-இல் உள்ள elements-ஐ வரிசைப்படி வாசிக்க உதவுகின்றன. உண்மையான development-இல், ஒரு data group-இலிருந்து ஒவ்வொரு item-ஐ தனித்தனியாக எடுத்து, அதை process செய்யவும் அல்லது display செய்யவும் அடிக்கடி தேவைப்படும். அந்த வேலையைச் செய்ய loop என்பது மிகவும் முக்கியமான கருவி.

நாம் web-ஐ browse செய்யும்போதோ அல்லது App-ஐ பயன்படுத்தும்போதோ, பல lists அல்லது items-ஐ அடிக்கடி பார்க்கிறோம். இப்படிப்பட்ட content முதலில் `array`-இல் store செய்யப்படும், பின்னர் `loop` மூலம் ஒன்றன்பின் ஒன்றாக வாசிக்கப்பட்டு, இறுதியில் screen-இல் காட்டப்படும்.

உதாரணமாக, Google-இன் search results பட்டியல்:

![Google](../../Resource/017_google.png)

Search results பட்டியலில் உள்ள ஒவ்வொரு item-மும் பொதுவாக ஒரு data item-ஐ குறிக்கும், மற்றும் அவை loop மூலம் ஒன்றன்பின் ஒன்றாகக் காட்டப்படுகின்றன.

அதனால், `array` மற்றும் `loop` பெரும்பாலும் ஒன்றாகவே தோன்றுகின்றன. `Array` ஒரு data group-ஐ சேமிக்கும்; `loop` அந்த data-ஐ வரிசையாக எடுத்து, அதே operation-ஐ செய்கிறது.

இப்போது, மிகவும் அடிப்படையான `for` loop-இலிருந்து தொடங்குவோம்.

## கவுண்ட்டவுன்

நாம் ஒரு countdown feature-ஐ simulate செய்ய வேண்டும் என்று வைத்துக்கொள்வோம். அது `“5, 4, 3, 2, 1”` என்று வரிசையாக output செய்ய வேண்டும்.

அதற்கான மிகவும் நேரடியான எழுதும் முறை:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

இந்த முறை countdown-ஐ simulate செய்ய முடியும். ஆனால் content அதிகமானால், code மிகவும் repeat ஆகும்; பின்னர் அதை மாற்றவும் சிரமமாகும்.

அப்போது, data-ஐ முதலில் array-இல் வைக்கலாம்; பின்னர் `for` loop-ஐ பயன்படுத்தி ஒன்றன்பின் ஒன்றாக output செய்யலாம்:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

இந்த எழுதும் முறை சுருக்கமாகவும், விரிவுபடுத்த எளிதாகவும் இருக்கும். Countdown-இல் numbers அதிகமாக இருந்தாலும், `print`-ஐ ஒவ்வொரு வரியிலும் மீண்டும் மீண்டும் எழுத வேண்டியதில்லை. Array-இல் உள்ள ஒவ்வொரு element-ஐயும் loop தானாக handle செய்தால் போதும்.

இந்த code-ஐ ஒரு button-க்குள் வைத்து test செய்யலாம்:

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

Button-ஐ click செய்தபோது, `for` loop array-இல் உள்ள வரிசைப்படி `countDown`-இன் ஒவ்வொரு integer-ஐயும் ஒன்றன்பின் ஒன்றாக எடுத்து console-இல் print செய்யும்.

அடுத்து, `for` loop எப்படி வேலை செய்கிறது என்று பார்ப்போம்.

## for loop

`for` loop என்பது ஒரு data group-ஐ வரிசையாக process செய்யப் பயன்படுகிறது. இது பொதுவாக arrays மற்றும் ranges மீது அதிகமாக பயன்படுத்தப்படுகிறது.

அடிப்படை எழுதும் முறை:

```swift
for element in arrayAllatuRange {
    executeSeiyaVendiyaCode
}
```

உதாரணமாக, இப்போது பார்த்த countdown code:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

இங்கே `i` என்பது தற்போது எடுக்கப்பட்ட element-ஐ குறிக்கிறது. `in` க்கு பிறகு வரும் data தான் loop செய்யப்பட வேண்டியது; அதாவது `countDown` array.

இந்த code-ன் பொருள்: program `countDown` array-இலிருந்து ஒவ்வொரு element-ஐயும் வரிசையாக எடுக்கும். ஒவ்வொரு element-ஐ எடுக்கும் போது, அதை தற்காலிகமாக `i` என்று குறிப்பிடும்; பிறகு curly braces-இல் உள்ள code-ஐ execute செய்யும்.

Execution process-ஐ இப்படி புரிந்துகொள்ளலாம்:

- முதல் முறையாக `5` எடுக்கப்படும்; எனவே அந்த நேரத்தில் `i`-ன் value `5`
- `print(i)` execute ஆகும்; `5` output ஆகும்
- அதன் பிறகு அடுத்த element `4` எடுக்கப்படும்
- `print(i)` மீண்டும் execute ஆகும்; `4` output ஆகும்

பின்னர் வரும் `3`, `2`, `1`-மும் இதே முறையில் ஒன்றன்பின் ஒன்றாக execute ஆகும்.

![for](../../Resource/017_for.png)

Array-இல் உள்ள அனைத்து elements-உம் process செய்யப்பட்ட பிறகு, `for` loop தானாக முடியும்.

`for` loop-ஐ பயன்படுத்தி array-இல் உள்ள ஒவ்வொரு element-ஐயும் பெறலாம்; countdown போன்ற features-ஐ உருவாக்கலாம்.

**குறிப்பு**: `i` என்பது for loop-இல் தற்போது எடுக்கப்படும் element-ஐ குறிக்கப் பயன்படும் ஒரு பொதுவான பெயர். ஆனால் இது கட்டாயமானது அல்ல; வேறு English பெயர்களையும் பயன்படுத்தலாம்.

உதாரணமாக, ஒவ்வொரு element-ஐ குறிக்க `num`-ஐப் பயன்படுத்தலாம்:

```swift
for num in countDown {
    print(num)
}
```

Curly braces-க்குள் இருக்கும் code-இலும் தற்போதைய element-ஐ குறிக்க `num`-ஐயே பயன்படுத்த வேண்டும்.

### range-ஐ loop செய்வது

`for` loop array-களை மட்டும் அல்ல, range-களையும் loop செய்ய முடியும்.

உதாரணமாக, `50`-க்குள் உள்ள positive integers-இன் total-ஐ கணக்கிட வேண்டுமானால், `1` முதல் `50` வரை உள்ள அனைத்து integers-ஐயும் ஒன்றன்பின் ஒன்றாகச் சேர்க்க வேண்டும்.

மிகவும் நேரடியான எழுதும் முறை இப்படி இருக்கலாம்:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

இந்த எழுதும் முறையின் பிரச்சினை என்னவென்றால், ஒவ்வொரு எண்ணையும் கையால் எழுத வேண்டும். அது சிரமமாகவும், உண்மையான development scenarios-க்கு பொருத்தமற்றதாகவும் இருக்கும்.

இப்போது range operator-ஐ `for` loop உடன் சேர்த்து இதை செய்யலாம்.

முன்னைய “operators” chapter-இல், range operator பற்றி நாம் ஏற்கனவே கற்றிருந்தோம்:

```swift
1...3   // 1, 2, 3
```

இதில் `...` என்பது closed range-ஐ குறிக்கும்; அதாவது start point-உம் end point-உம் இரண்டும் சேர்க்கப்படும்.

அதனால், இங்கே `1` முதல் `50` வரையிலான integer range-ஐ `for` loop மூலம் பயன்படுத்தலாம்:

```swift
for i in 1...50 {
    
}
```

இந்த integers-ஐ சேர்க்க வேண்டியதால், total-ஐ store செய்ய ஒரு variable கூட தேவை:

```swift
var count = 0
```

பிறகு ஒவ்வொரு loop iteration-இலும் தற்போது எடுக்கப்பட்ட number-ஐ `count`-க்கு சேர்க்கலாம்:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

இந்த code-ன் பொருள்:

- `count` தற்போதைய total-ஐ சேமிக்கிறது
- `for` loop `1` முதல் `50` வரை உள்ள integers-ஐ வரிசையாக எடுக்கிறது
- ஒவ்வொரு integer-மும் எடுக்கப்படும் போது `count += i` execute ஆகிறது
- loop முடிந்தபின் `count`-இல் final total இருக்கும்.

இவ்வாறு `50`-க்குள் உள்ள அனைத்து positive integers-இன் total-ஐ பெறலாம்.

அதேபோல், `1` முதல் `100` வரை உள்ள integers-இன் total-ஐ கணக்கிட வேண்டுமானால், range-ஐ மட்டும் மாற்றினால் போதும்:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` loop array-களை மட்டுமல்ல, ஒரு range-ஐயும் loop செய்ய முடியும். Data-ஐ வரிசையாக மீண்டும் மீண்டும் process செய்யும் இந்த திறன் development-இல் மிகவும் பொதுவானது.

இது, ஒவ்வொரு எண்ணிற்கான addition process-ஐயோ அல்லது இதுபோன்ற repetitive operations-ஐயோ கையால் எழுதாமல், பல repeat work-களை தானாகச் செய்ய உதவுகிறது.

## SwiftUI-இல் loop

மேலே பார்த்த `for` loop என்பது Swift language-இன் ஒரு பகுதி.

ஆனால் SwiftUI-இல், view structure-க்குள் `for`-ஐ நேரடியாகப் பயன்படுத்தி views உருவாக்க முடியாது:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

ஏனெனில் `VStack`-க்குள் SwiftUI views இருக்க வேண்டும்; ஆனால் சாதாரண `for` loop தனியாக ஒரு view அல்ல.

SwiftUI-இல் array-இன் content-ஐ அடிப்படையாகக் கொண்டு interface-ஐ மீண்டும் மீண்டும் உருவாக்க வேண்டுமானால், `ForEach`-ஐ பயன்படுத்த வேண்டும்.

உதாரணமாக, ஒரு குழுவில் உள்ள எல்லா members-இன் names-ஐ காட்ட வேண்டுமானால், இப்படிச் எழுதலாம்:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

காணப்படும் விளைவு:

![for1](../../Resource/017_for1.png)

பிறகு, ஒவ்வொரு `Text`-க்கும் ஒரே modifiers-ஐச் சேர்ப்போம்:

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

இப்போது ஒவ்வொரு `Text`-மும் சிறியதும், தடித்ததுமான font-ஆகக் காட்டப்படும்.

காணப்படும் விளைவு:

![](../../Resource/017_for2.png)

Modifiers interface-ஐ அழகாக மாற்றினாலும், code-ஐ நீளமாகவும், அதிகமாக repeat ஆகவும் மாற்றுகின்றன.

Names தொடர்ந்து அதிகரித்தாலோ, அல்லது பின்னர் font, color போன்ற styles-ஐ ஒரே மாதிரியாக மாற்ற வேண்டியிருந்தாலோ, ஒரே மாதிரியான code-ஐ பல முறை எழுதவும் மாற்றவும் வேண்டி வரும். இது சிரமமாகவும், maintain செய்ய கடினமாகவும் இருக்கும்.

அப்போது, இந்த names-ஐ முதலில் array-இல் வைக்கலாம்; பின்னர் SwiftUI-இல் உள்ள `ForEach`-ஐப் பயன்படுத்தி array data-ஐ அடிப்படையாகக் கொண்டு views-ஐ மீண்டும் மீண்டும் உருவாக்கலாம்:

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

இந்த code group மிகவும் சுருக்கமானது. `ForEach` array-இல் உள்ள ஒவ்வொரு element-ஐயும் வரிசையாகப் படித்து, அதற்கான content-ஐ screen-இல் காட்டும்.

பின்னர் புதிய names சேர்க்க வேண்டுமென்றால், `names` array-இன் content-ஐ மட்டும் மாற்றினால் போதும். ஒவ்வொரு முறையும் `Text` மற்றும் சிக்கலான modifiers-ஐ மீண்டும் சேர்க்க வேண்டியதில்லை.

## ForEach

`ForEach` என்பது SwiftUI-இல் views-ஐ மீண்டும் மீண்டும் உருவாக்கப் பயன்படுத்தப்படும் structure. இதை SwiftUI-இல் இருக்கும் `for` loop போன்ற ஒரு structure என்று புரிந்துகொள்ளலாம்.

அடிப்படை பயன்பாடு:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

உதாரணமாக, இப்போது பார்த்த குழு names:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

இந்த code-ன் பொருள்:

`names` என்பது loop செய்யப்படும் array; அதாவது display செய்ய வேண்டிய data.

`id:\.self` என்பது array-இல் உள்ள element-ஐயே ஒவ்வொரு item-ஐ distinguish செய்யப் பயன்படுத்துவது.

இந்த example-இல் array string values-ஐ store செய்கிறது:

```swift
["Sam", "John", "Wathon", "Bob"]
```

அதனால் SwiftUI, "Sam", "John", "Wathon", "Bob" என்ற string values-ஐ நேரடியாகவே வெவ்வேறு content-ஐ பிரித்தறியப் பயன்படுத்தும்.

Beginner stage-இல் பொதுவாக வரும் String, Int போன்ற simple arrays-க்கு, நாம்முதல் இப்படிச் எழுதலாம்:

```swift
id: \.self
```

இப்போது இந்த ஒரே எழுதும் முறையை நினைவில் வைத்துக்கொண்டால் போதும். id பற்றிய மேலும் பல விதிகளை ஆழமாக அறிந்திருக்க வேண்டியதில்லை.

`item in`-இல் உள்ள `item` என்பது தற்போது எடுக்கப்பட்ட element-ஐக் குறிக்கும்.

உதாரணமாக, முதல் loop-இல் `item` என்பது `"Sam"`; இரண்டாவது loop-இல் அது `"John"`.

அதனால்:

```swift
Text(item)
```

இது வரிசையாக இப்படி மாறும்:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

அதாவது, இந்த code-ன் வேலை `names` array-இலிருந்து ஒவ்வொரு name-ஐயும் வரிசையாக எடுத்து, ஒவ்வொரு name-க்கும் ஒரு `Text` view உருவாக்குவது.

### செயல்முறை

Execution process-ஐ இப்படி புரிந்துகொள்ளலாம்:

- `ForEach` முதலில் `names` array-இன் முதல் element `"Sam"`-ஐ வாசிக்கும்
- `item` தற்காலிகமாக `"Sam"`-ஐ குறிக்கும்
- `Text(item)` `"Sam"`-ஐக் காட்டும்
- அதன் பிறகு அடுத்த element `"John"`-ஐ வாசிக்கும்
- அதே view code மீண்டும் execute ஆகும்

இறுதியில் array-இல் உள்ள அனைத்து names-உம் display ஆகும்.

இந்த எழுதும் முறையின் நன்மை என்னவென்றால், names அதிகரித்தாலும் நாம் நிறைய `Text`-ஐ மீண்டும் மீண்டும் எழுத வேண்டியதில்லை; array content-ஐ மட்டும் மாற்றினால் போதும்.

### புகைப்படங்களை loop செய்வது

`ForEach` text மட்டும் அல்ல, images, colors அல்லது பிற SwiftUI views-களையும் display செய்ய முடியும்.

உதாரணமாக, 4 படங்களைத் தயார் செய்வோம்:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

இந்த நான்கு படங்களையும் Xcode-இன் Assets folder-க்குள் drag செய்யுங்கள்.

![image](../../Resource/017_for3.png)

`ForEach`-ஐ பயன்படுத்தாமல் இருந்தால், ஒவ்வொரு image-ஐயும் தனித்தனியாகக் கையால் எழுத வேண்டும்:

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

காணப்படும் விளைவு:

![image](../../Resource/017_for4.png)

இந்த முறை வேலை செய்யும்; ஆனால் code மிகவும் நீளமாக இருக்கும்.

Images அதிகரிக்க அதிகரிக்க, மேலும் அதிக `Image` code-ஐ மீண்டும் எழுத வேண்டி வரும்.

பின்னர் image size-ஐ ஒரே மாதிரியாக மாற்ற வேண்டுமானால், ஒவ்வொன்றாகப் போய் மாற்ற வேண்டும்.

அப்போது image names-ஐ array-இல் வைக்கலாம்; பின்னர் `ForEach` மூலம் image views-ஐ மீண்டும் மீண்டும் உருவாக்கலாம்:

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

இங்கே `images` என்பது string array; array-இன் ஒவ்வொரு element-மும் ஒரு image name.

`ForEach(images, id: \.self)` என்பது `images` array-இன் ஒவ்வொரு element-ஐயும் வரிசையாகப் படித்து, item-களை distinguish செய்ய element-ஐயே பயன்படுத்தி, தற்போதைய element-ஐ வைத்து அதற்கான view-ஐ உருவாக்கும் என்பதைக் குறிக்கிறது.

உதாரணமாக, முதல் முறையாக `"430F9BEF"` வாசிக்கப்பட்டால்:

```swift
Image(item)
```

அது இதற்குச் சமம்:

```swift
Image("430F9BEF")
```

பிற images-களும் இதேபோல் ஒன்றன்பின் ஒன்றாக display ஆகும்.

![image](../../Resource/017_for4.png)

இங்கும் நாம் பயன்படுத்துவது:

```swift
id: \.self
```

இதற்கான காரணமும் முந்தையதைப் போலவே தான். `images` array-இன் elements-உம் simple string types தான்; எனவே beginner stage-இல் element-ஐயே distinguishing value-ஆகப் பயன்படுத்தினால் போதும்.

இதைக் கீழே உள்ள நிலையான formula போல நினைவில் வைத்துக்கொள்ளலாம்:

**`ForEach` என்பது `String` அல்லது `Int` போன்ற simple array-ஐ loop செய்யும் போது, பொதுவாக `id: \.self` என்று எழுதப்படும்.**

### படங்களைச் சேர்த்தல்

பின்னர் புதிய images சேர்க்க வேண்டுமானால், array content-ஐ மட்டும் மாற்றினால் போதும்:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

புதிய `Image` code-ஐ மீண்டும் மீண்டும் எழுத வேண்டியதில்லை.

Images அதிகமாக இருந்தால், இதை `ScrollView` உடன் சேர்த்து பயன்படுத்தலாம்; இல்லையெனில் content screen-ஐ தாண்டிய பிறகு முழுவதையும் preview செய்ய முடியாது.

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

### படங்களை மாற்றுதல்

Images-இன் style-ஐ ஒரே மாதிரியாக மாற்ற வேண்டுமானால், `ForEach`-க்குள் உள்ள code-ஐ மட்டும் மாற்றினால் போதும்.

உதாரணமாக, width-ஐ `80` ஆக மாற்றலாம்:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

இவ்வாறு அனைத்து images-உம் ஒரே நேரத்தில் update ஆகும்; ஒவ்வொன்றாக மாற்ற வேண்டியதில்லை.

இதுவே `ForEach`-இன் முக்கியமான ஒரு பயன்:

**பல views-க்கு ஒரே structure இருந்தாலும், content மட்டும் வேறுபட்டால், view code-ஐ ஒருமுறை மட்டும் எழுதலாம்; பின்னர் array data தான் என்ன display ஆக வேண்டும் என்பதை நிர்ணயிக்கும்.**

## சுருக்கம்

இந்தப் பாடத்தில், `for` loop மற்றும் `ForEach` ஆகியவற்றைக் கற்றோம்.

`for` loop என்பது array அல்லது range-இல் உள்ள elements-ஐ வரிசையாக process செய்யப் பயன்படுகிறது; இது data handling-ஐ அதிகமாகச் சார்ந்தது.

`ForEach` என்பது SwiftUI-இல் array content-ஐ அடிப்படையாகக் கொண்டு views-ஐ மீண்டும் மீண்டும் உருவாக்கப் பயன்படுகிறது; இது UI display-ஐ அதிகமாகச் சார்ந்தது.

தற்போதைய beginner stage-இல், `ForEach`-இன் பொதுவான எழுதும் முறை:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

இதில் `id: \.self` என்பது ஒவ்வொரு element-ஐயும் distinguish செய்ய element-ஐயே பயன்படுத்துவது.

Array-இன் content `String`, `Int` போன்ற simple types ஆக இருக்கும்போது, பொதுவாக இந்த எழுதும் முறையைத்தான் முதலில் பயன்படுத்தலாம்.

பின்னர் web browse செய்யும்போதோ அல்லது App பயன்படுத்தும்போதோ, repeated text, images அல்லது list content போன்றவற்றைக் காணும்போது, SwiftUI-இல் அவை பொதுவாக முதலில் array-இல் வைக்கப்பட்டு, பின்னர் `ForEach` மூலம் ஒன்றன்பின் ஒன்றாகக் காட்டப்படுகின்றன என்று நினைக்கலாம்.
