# கணக்கிடப்படும் பண்பு

இந்தப் பாடத்தில் நாம் முக்கியமாக கணக்கிடப்படும் property பற்றி கற்போம்.

கணக்கிடப்படும் property என்பது ஏற்கனவே உள்ள தரவை அடிப்படையாகக் கொண்டு ஒரு புதிய முடிவை கணக்கிடப் பயன்படுகிறது. இது எண் மதிப்புகளை கணக்கிடலாம்; அதேபோல் SwiftUI view-வில் காட்ட வேண்டிய உள்ளடக்கத்தையும் கணக்கிடலாம்.

உதாரணமாக:

```swift
let a = 10
let b = 20
let c = a + b
```

இங்கே `c` என்பது `a` மற்றும் `b` சேர்க்கப்பட்ட பிறகு கிடைக்கும் முடிவைக் குறிக்கிறது.

சாதாரண code-இல் இந்த மாதிரியான எழுதும் முறை மிகவும் பொதுவானது.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

குறிப்பு: `Button`-ன் click event-இல் சாதாரண Swift code-ஐ இயக்கலாம்.

ஆனால் இதே போன்ற code-ஐ SwiftUI view-ன் properties-க்குள் நேரடியாக எழுதினால், பிரச்சனை ஏற்படும்.

உதாரணமாக:

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

இந்த code error காட்டும்.

மேலோட்டமாக பார்த்தால், `a` மற்றும் `b` ஏற்கனவே `c`-க்கு முன் எழுதப்பட்டுள்ளன. எனவே `c`-ன் மதிப்பை கணக்கிட முடியும் போலத் தோன்றலாம்.

ஆனால் struct-இன் properties-ஐ declare செய்யும்போது, இந்த எழுதும் முறையை நேரடியாகப் பயன்படுத்த முடியாது.

## ஏன் c-ஐ நேரடியாக a + b என்று கணக்கிட முடியாது?

ஏனெனில் `a`, `b`, `c` ஆகியவை button click event-இல் உள்ள temporary constants அல்ல. அவை `ContentView` என்ற view-க்குள் உள்ள properties.

Button click event-இல் இந்த code சாதாரணமாக இயங்கும்:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

ஏனெனில் button click செய்யப்பட்ட பிறகு code வரிசையாக இயங்கும். முதலில் `a` உருவாக்கப்படும், பிறகு `b` உருவாக்கப்படும், இறுதியில் `a + b` பயன்படுத்தி `c` கணக்கிடப்படும்.

ஆனால் view-க்குள் properties declare செய்யும்போது நிலைமை வேறுபடும்:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

இங்கே `a`, `b`, `c` அனைத்தும் `ContentView` view-இன் properties.

`ContentView` view உருவாக்கப்படும் போது, Swift முதலில் இந்த properties-ஐ தயார் செய்ய வேண்டும். உருவாக்கும் செயல்முறை பாதுகாப்பாக இருக்க, ஒரு instance stored property-ன் default value-இல் அதே instance-இன் மற்ற instance properties-ஐ நேரடியாகப் படிக்க Swift அனுமதிக்காது.

அதனால் இந்த வரி error காட்டும்:

```swift
let c = a + b
```

எளிமையாக இப்படிப் புரிந்துகொள்ளலாம்: **view-க்குள் properties declare செய்யும்போது, ஒரு சாதாரண property-ஐப் பயன்படுத்தி மற்றொரு சாதாரண property-ஐ நேரடியாக கணக்கிட முடியாது.**

இவ்வாறு மதிப்பை நேரடியாகச் சேமிக்கும் property-ஐ “stored property” என்று அழைக்கப்படுகிறது. புரிந்துகொள்ள எளிதாக, இதை தற்காலிகமாக சாதாரண property என்று கருதலாம்.

உதாரணமாக:

```swift
let a = 10
```

`a` `10`-ஐ சேமிக்கிறது.

```swift
let b = 20
```

`b` `20`-ஐ சேமிக்கிறது.

ஆனால்:

```swift
let c = a + b
```

இங்கே `c` நேரடியாக எழுதப்பட்ட ஒரு fixed value அல்ல. அது `a + b` மூலம் கணக்கிடப்பட வேண்டும் என்று எதிர்பார்க்கப்படுகிறது.

இந்த மாதிரியான “ஏற்கனவே உள்ள தரவிலிருந்து முடிவைப் பெறும்” சூழலுக்கு computed property அதிகம் பொருத்தமானது.

இதைக் கீழ்க்கண்டவாறு மாற்றலாம்:

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

இங்கே `c` என்பது computed property.

```swift
var c: Int {
    return a + b
}
```

இதன் பொருள்: **`c`-ஐ பயன்படுத்த வேண்டிய நேரத்தில் தான் `a` மற்றும் `b` படிக்கப்படும்; பிறகு `a + b`-ன் முடிவு return செய்யப்படும்.**

உதாரணமாக:

```swift
Text("c: \(c)")
```

`Text` `c`-ஐ காட்டும் போது தான் `c`-ன் கணக்கீடு நடக்கும்.

## Computed property என்றால் என்ன?

Computed property ஒரு variable போலத் தோன்றும், ஆனால் அது தானாகவே data-வை சேமிக்காது.

உதாரணமாக:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

இங்கே `c` என்பது computed property.

இது சாதாரண property போல ஒரு fixed value-ஐ சேமிக்காது. ஒவ்வொரு முறையும் `c` படிக்கப்படும் போது, `{}` உள்ள code மீண்டும் இயக்கப்பட்டு, கணக்கிடப்பட்ட முடிவு return செய்யப்படும்.

இதை இப்படிப் புரிந்துகொள்ளலாம்:

```swift
var c: Int {
    return a + b
}
```

`c` தேவைப்படும் போது, `a + b` கணக்கிடப்படும்.

அதனால் computed property இந்த சூழலுக்கு பொருத்தமானது: **ஒரு முடிவை தனியாகச் சேமிக்க வேண்டியதில்லை; அது ஏற்கனவே உள்ள தரவிலிருந்து கணக்கிடப்பட முடியும்.**

## அடிப்படை எழுதும் முறை

Computed property பொதுவாக மூன்று பகுதிகளைக் கொண்டுள்ளது:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` மூலம் declare செய்வது

```swift
var c
```

Computed property கண்டிப்பாக `var` மூலம் declare செய்யப்பட வேண்டும்; `let` பயன்படுத்த முடியாது.

ஏனெனில் computed property என்பது fixed stored value அல்ல. அது ஒவ்வொரு முறையும் படிக்கப்படும் போது dynamic-ஆக கணக்கிடப்படும் முடிவு.

### 2. Return type-ஐ குறிப்பிடுவது

```swift
var c: Int
```

Computed property return type-ஐ குறிப்பிட வேண்டும்.

இங்கே `c` இறுதியில் integer return செய்யும், எனவே type `Int`.

### 3. {} உள்ளே கணக்கீட்டு logic எழுதுவது

```swift
{
    return a + b
}
```

`{}` உள்ளே கணக்கீட்டு logic எழுதப்படும். இங்கே return செய்யப்படும் முடிவு `a + b`.

## return keyword

Computed property ஒரு முடிவை return செய்ய வேண்டும்.

உதாரணமாக:

```swift
var c: Int {
    return a + b
}
```

இங்கே `return` என்பது `a + b`-ன் கணக்கீட்டு முடிவை வெளியே return செய்வது என்று பொருள்.

Computed property-க்குள் நேரடியாக முடிவை உருவாக்கும் ஒரு expression மட்டும் இருந்தால், `return`-ஐ தவிர்க்கலாம்:

```swift
var c: Int {
    a + b
}
```

ஆனால் computed property-க்குள் பல வரி code இருந்தால், எந்த முடிவை return செய்ய வேண்டும் என்பதை தெளிவாகக் காட்ட `return` பயன்படுத்த வேண்டும்.

உதாரணமாக:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

இங்கே கணக்கீட்டு செயல்முறை இரண்டு படிகளாகப் பிரிக்கப்பட்டுள்ளது.

முதல் படி, மொத்த விலையை கணக்கிடுவது:

```swift
let total = count * price
```

இரண்டாவது படி, மொத்த விலையை text-ஆக இணைத்து return செய்வது:

```swift
return "Total：\(total) $"
```

`return`-ஐ அகற்றினால்:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

இந்த code error காட்டும்.

காரணம்: **இந்த computed property-க்குள் ஏற்கனவே பல வரி code உள்ளது. எந்த வரி இறுதியாக return செய்ய வேண்டிய முடிவு என்பதை Swift தானாகத் தீர்மானிக்க முடியாது.**

அதனால் computed property-க்குள் முடிவைத் தரும் ஒரு expression மட்டும் இருந்தால், `return`-ஐ தவிர்க்கலாம்.

```swift
var c: Int {
    a + b
}
```

Computed property-க்குள் பல வரி code இருந்தால், `return`-ஐ தெளிவாக எழுதுவது நல்லது.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Computed property மற்றும் சாதாரண property-ன் வித்தியாசம்

சாதாரண property data-வை சேமிக்கும்.

```swift
var c = 30
```

இங்கே `c` ஒரு குறிப்பிட்ட மதிப்பை சேமிக்கிறது: `30`.

Computed property data-வை சேமிக்காது.

```swift
var c: Int {
    a + b
}
```

இங்கே `c` `30`-ஐ சேமிக்கவில்லை. அது கணக்கிடும் முறையை மட்டும் வழங்குகிறது.

`c` படிக்கப்படும் போது, Swift இதை இயக்கும்:

```swift
a + b
```

பிறகு கணக்கிடப்பட்ட முடிவை return செய்யும்.

அதனால் மற்ற தரவை அடிப்படையாகக் கொண்டு முடிவை கணக்கிட வேண்டிய சூழல்களுக்கு computed property பொருத்தமானது.

## body-யும் computed property தான்

Computed property-ஐ கற்ற பிறகு, SwiftUI-ல் அடிக்கடி காணப்படும் இந்த code-ஐ மீண்டும் புரிந்துகொள்ளலாம்:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

இங்கே `body`-யும் ஒரு computed property தான்.

இது `var` மூலம் declare செய்யப்பட்டுள்ளது:

```swift
var body
```

இதற்கு return type உள்ளது:

```swift
some View
```

இதன் `{}` உள்ளே return செய்யப்படுவது SwiftUI view content:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

அதனால் `body`-ஐ இப்படிப் புரிந்துகொள்ளலாம்: SwiftUI இந்த view-ஐ காட்ட வேண்டியபோது, அது `body`-ஐ படித்து, `body` return செய்யும் content-ஐ அடிப்படையாகக் கொண்டு interface-ஐ உருவாக்குகிறது.

`return` எழுதினால், இதை இப்படிப் புரிந்துகொள்ளலாம்:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ஆனால் SwiftUI-ல் பொதுவாக நாம் `return`-ஐ தவிர்த்து நேரடியாக இப்படி எழுதுவோம்:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

`@State` data மாறும்போது, SwiftUI `body`-ஐ மீண்டும் படித்து, புதிய data-வின் அடிப்படையில் interface-ஐ update செய்யும்.

உதாரணமாக:

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

button click செய்த பிறகு `count` மாறும்.

```swift
count += 1
```

`count` மாறிய பிறகு, SwiftUI `body`-ஐ மீண்டும் கணக்கிடும். அதனால் interface-இல் உள்ள text-வும் update ஆகும்.

```swift
Text("count: \(count)")
```

SwiftUI-ல் data மாறிய பிறகு interface தானாக refresh ஆகும் காரணமும் இதுதான்.

### body-க்குள் சிக்கலான கணக்கீடுகளை எழுத பரிந்துரைக்கப்படாது

`body` computed property என்பதால், அது பலமுறை படிக்கப்படவும் மீண்டும் கணக்கிடப்படவும் வாய்ப்பு உள்ளது.

உதாரணமாக:

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

`name` மாறும்போது, SwiftUI `body`-ஐ மீண்டும் கணக்கிடும்.

அப்போது `body` உள்ள code-யும் மீண்டும் இயங்கும்; `num`-வும் மீண்டும் உருவாக்கப்படும்.

```swift
let num = 10
```

இந்த உதாரணத்தில் `num` மிகவும் எளிமையானது, அதனால் பெரிய தாக்கம் இல்லை.

ஆனால் `body`-க்குள் பெருமளவு data filtering, sorting, image processing போன்ற சிக்கலான கணக்கீடுகள் செய்யப்பட்டால், interface smoothness பாதிக்கப்படலாம்.

எனவே SwiftUI-ல் `body` முக்கியமாக interface structure-ஐ விவரிக்கும் பொறுப்பை ஏற்க வேண்டும்.

எளிய temporary data-வை `body`-க்குள் எழுதலாம்.

சிக்கலான கணக்கீடுகளை `body`-க்கு வெளியே உள்ள computed property, method அல்லது தனியான data processing பகுதிக்குள் வைக்கலாம்.

## உதாரணம்: எண்ணிக்கை மற்றும் மொத்த விலை

இப்போது ஒரு எளிய உதாரணத்தின் மூலம் computed property-ஐ புரிந்துகொள்வோம்.

ஒரு carrot-ன் விலை 2 $ என்று நினைப்போம். பயனர் button click செய்து வாங்கும் எண்ணிக்கையை மாற்றலாம்; interface-இல் மொத்த விலை காட்டப்பட வேண்டும்.

மொத்த விலையின் கணக்கீட்டு முறை:

```text
எண்ணிக்கை * ஒற்றை விலை
```

மொத்த விலையை சாதாரண variable-இல் சேமித்தால், அது கொஞ்சம் சிரமமாக இருக்கும்.

ஏனெனில் ஒவ்வொரு முறையும் எண்ணிக்கை மாறும்போது, மொத்த விலையை கைமுறையாக update செய்ய வேண்டும்.

சிறந்த முறை computed property பயன்படுத்துவது:

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

காட்டப்படும் விளைவு:

![view](../../Resource/024_view.png)

இந்த உதாரணத்தில்:

```swift
@State private var count = 1
```

`count` carrot-ன் எண்ணிக்கையை குறிக்கிறது. button click செய்தால் `count` மாறும்.

```swift
private let price = 2
```

`price` carrot-ன் ஒற்றை விலையை குறிக்கிறது. இங்கே இது fixed value, எனவே `let` பயன்படுத்தப்படுகிறது.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` மொத்த விலையை குறிக்கிறது.

இதனை தனியாகச் சேமிக்கத் தேவையில்லை, ஏனெனில் மொத்த விலை எப்போதும் `count * price` மூலம் கணக்கிடப்படலாம்.

`count` `1` ஆக இருக்கும்போது:

```swift
totalPrice = 1 * 2
```

காட்டப்படும் முடிவு:

```swift
totalPrice: 2 $
```

`+` button click செய்த பிறகு, `count` `2` ஆகும்.

அப்போது `totalPrice` மீண்டும் படிக்கப்படும் போது, அது மீண்டும் கணக்கிடப்படும்:

```swift
totalPrice = 2 * 2
```

காட்டப்படும் முடிவு:

```swift
totalPrice: 4 $
```

இதுவே computed property-ன் வேலை: ஏற்கனவே உள்ள data-வை அடிப்படையாகக் கொண்டு புதிய முடிவை dynamic-ஆக கணக்கிடுவது.

## Computed property-ஐ condition check-க்கும் பயன்படுத்தலாம்

Computed property எண்களை மட்டும் கணக்கிடுவதில்லை; அது judgment result-ஐயும் return செய்யலாம்.

உதாரணமாக, எண்ணிக்கையின் குறைந்தபட்ச மதிப்பு 1 ஆக இருக்க வேண்டும் என்று நாம் விரும்புகிறோம்.

எண்ணிக்கை ஏற்கனவே 1 ஆக இருந்தால், `-` button மேலும் குறைக்கக் கூடாது.

இதற்காக ஒரு computed property சேர்க்கலாம்:

```swift
private var canDecrease: Bool {
    count > 1
}
```

முழு code:

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

காட்டப்படும் விளைவு:

![view](../../Resource/024_view1.png)

இங்கே:

```swift
private var canDecrease: Bool {
    count > 1
}
```

இந்த code தற்போதைய எண்ணிக்கையை இன்னும் குறைக்க முடியுமா என்பதை குறிக்கிறது.

`count` `1`-ஐ விட பெரியதாக இருக்கும் போது:

```swift
canDecrease == true
```

அதாவது குறைக்க முடியும்.

`count` `1`-க்கு சமமாக இருக்கும் போது:

```swift
canDecrease == false
```

அதாவது இனி குறைக்க முடியாது.

### Button-க்குள் condition check

Button-க்குள் இது பயன்படுத்தப்படுகிறது:

```swift
if canDecrease {
    count -= 1
}
```

`canDecrease` `true` ஆக இருந்தால் மட்டுமே `count` குறைக்கப்படும்.

### View-ன் foreground color-ஐ கட்டுப்படுத்துவது

`canDecrease`-ஐப் பயன்படுத்தி button-ன் foreground color-ஐயும் கட்டுப்படுத்தலாம்:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

இங்கே ternary operator பயன்படுத்தப்பட்டுள்ளது:

```swift
canDecrease ? Color.primary : Color.gray
```

இந்த code-ன் பொருள்: `canDecrease` `true` என்றால் foreground color `Color.primary`; `canDecrease` `false` என்றால் foreground color `Color.gray`.

`Color.primary` என்பது SwiftUI வழங்கும் system semantic color. இது தற்போதைய interface-இல் உள்ள முக்கிய text color-ஐ குறிக்கிறது.

Light Mode-இல் `Color.primary` பொதுவாக கருப்பிற்கு அருகில் இருக்கும்; Dark Mode-இல் பொதுவாக வெள்ளைக்கு அருகில் இருக்கும்.

அதனால் `Color.primary` பயன்படுத்துவதன் நன்மை: இது Light Mode மற்றும் Dark Mode-க்கு தானாக பொருந்திக் கொள்கிறது.

### View-ன் disabled state-ஐ கட்டுப்படுத்துவது

`disabled` view disabled state-இல் உள்ளதா என்பதை கட்டுப்படுத்தப் பயன்படுகிறது:

```swift
.disabled(!canDecrease)
```

`disabled` `false` என்றால், view-ஐ click செய்யலாம்.

`disabled` `true` என்றால், view disabled state-இல் இருக்கும்; click செய்ய முடியாது.

இங்கே `canDecrease` condition-ஆக பயன்படுத்தப்பட்டதால், code-ஐப் புரிந்துகொள்வது எளிதாகிறது.

`canDecrease`-ஐ பார்த்தவுடன், அது “தற்போது இன்னும் குறைக்க முடியுமா” என்பதைக் குறிக்கிறது என்பதை அறியலாம்.

### கூடுதல் விளக்கம்: ஏன் இரண்டு முறை check செய்கிறோம்?

`-` button-இல்:

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

இங்கே `.disabled(!canDecrease)`-யும் பயன்படுத்தப்பட்டுள்ளது; button-க்குள் `if canDecrease`-யும் பயன்படுத்தப்பட்டுள்ளது.

`.disabled(!canDecrease)` interface level-இல் button-ஐ disabled செய்து, user அதை click செய்ய முடியாதபடி செய்கிறது.

`if canDecrease` code இயங்குவதற்கு முன் மீண்டும் ஒரு முறை check செய்கிறது. குறைக்க முடிந்தால் மட்டுமே `count -= 1` இயங்கும்.

இது double protection. உண்மையான development-இல், button ஏற்கனவே disabled ஆக இருந்தால், உள்ளே உள்ள condition-ஐ தவிர்க்கலாம். ஆனால் teaching example-இல் அதை வைத்திருப்பது `canDecrease`-ன் பங்கை மேலும் தெளிவாகக் காட்டும்.

## சுருக்கம்

இந்தப் பாடத்தில் நாம் முக்கியமாக computed property பற்றி கற்றோம்.

Computed property மதிப்பை நேரடியாகச் சேமிக்காது. அது படிக்கப்படும் போது, ஏற்கனவே உள்ள data-வை அடிப்படையாகக் கொண்டு முடிவை கணக்கிடும்.

உதாரணமாக:

```swift
var c: Int {
    a + b
}
```

இங்கே `c`-ஐ தனியாகச் சேமிக்க வேண்டியதில்லை, ஏனெனில் அதை `a + b` மூலம் கணக்கிடலாம்.

Computed property கண்டிப்பாக `var` மூலம் declare செய்யப்பட வேண்டும், மேலும் return type குறிப்பிடப்பட வேண்டும்.

```swift
var canDecrease: Bool {
    count > 1
}
```

Computed property எண் மதிப்புகளை மட்டும் அல்லாமல், judgment result, text content, கூட SwiftUI view content-ஐயும் return செய்ய முடியும்.

இந்தப் பாடத்தில் நாம் `return` பற்றியும் கற்றோம்.

`return` என்பது ஒரு முடிவை return செய்வது என்று பொருள்:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Computed property-க்குள் முடிவை நேரடியாக உருவாக்கும் ஒரு expression மட்டும் இருந்தால், `return`-ஐ தவிர்க்கலாம்.

```swift
var totalPrice: Int {
    count * price
}
```

மேலும், நாம் `Color.primary` மற்றும் `disabled` பற்றியும் அறிந்தோம்.

`Color.primary` என்பது SwiftUI-ன் system semantic color. இது Light Mode மற்றும் Dark Mode-க்கு ஏற்ப display effect-ஐ தானாக மாற்றிக் கொள்கிறது.

```swift
.foregroundStyle(Color.primary)
```

`disabled` view disabled ஆக உள்ளதா என்பதை கட்டுப்படுத்தப் பயன்படுகிறது.

```swift
.disabled(true)
```

இதன் பொருள் disabled, click செய்ய முடியாது.

```swift
.disabled(false)
```

இதன் பொருள் available, click செய்யலாம்.

அதனால் computed property SwiftUI-ல் மிகவும் பொதுவாகப் பயன்படுத்தப்படுகிறது. இது கணக்கீட்டு முடிவுகள், conditions, மற்றும் display content ஆகியவற்றை மேலும் தெளிவாக ஒழுங்குபடுத்த உதவுகிறது.
