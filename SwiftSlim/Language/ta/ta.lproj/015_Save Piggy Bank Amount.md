# பணம் சேமிப்பு குடுவைத் தொகையை சேமித்தல்

முந்தைய பாடத்தில், நாம் ஒரு எளிய “பணம் சேமிப்பு குடுவை”யை உருவாக்கினோம். இந்தப் பாடத்தில், அந்த “பணம் சேமிப்பு குடுவை”யின் தொகையை எவ்வாறு நிரந்தரமாகச் சேமிப்பது என்பதைப் பார்க்கப் போகிறோம்.

இந்தப் பாடத்தின் முக்கியக் கற்றல் அம்சங்கள் `UserDefaults` மற்றும் `@AppStorage` property wrapper ஆகும். அதோடு, `onAppear`-ன் பணி, மேலும் optional type (`nil`) பயன்படுத்தும் முறை பற்றியும் விரிவாகப் பார்ப்போம்.

கவனிக்க வேண்டியது என்னவெனில், இந்தப் பாடம் முந்தைய பாடத்தில் உருவாக்கிய “பணம் சேமிப்பு குடுவை” code-ஐத் தொடர்ந்தே செல்லும்.

## நிரந்தர சேமிப்பு சிக்கல்

இப்போது, “பணம் சேமிப்பு குடுவை”யின் interface மிகவும் எளிமையாகவும், பயன்படுத்த வசதியாகவும் இருக்கிறது.

![Piggy Bank](../../Resource/014_view.png)

ஆனால், இதில் ஒரு தெளிவான சிக்கல் உள்ளது: ஒவ்வொரு முறை view refresh ஆகும்போதோ, அல்லது app மூடப்பட்டு மீண்டும் திறக்கப்பட்டாலோ, “பணம் சேமிப்பு குடுவை”யின் மொத்தத் தொகை மீண்டும் `0` ஆகிவிடுகிறது. முன்பிருந்த மொத்தத் தொகையும் முழுவதும் இழக்கப்படுகிறது.

இதன் பொருள், data உண்மையில் சேமிக்கப்படவில்லை. வேறு வார்த்தைகளில் சொன்னால், இப்போது உள்ள “பணம் சேமிப்பு குடுவை” தற்காலிக data-ஐ மட்டும் சேமிக்கிறது.

### ஏன் நிரந்தரமாகச் சேமிக்க முடியவில்லை?

அதற்குக் காரணம், நாம் `@State` பயன்படுத்தி அறிவித்த variable:

```swift
@State private var amount = 0
```

`@State` மூலம் அறிவிக்கப்படும் variable-ன் lifetime, முழுமையாக view-ஐப் பொறுத்தது.

View உருவாக்கப்படும் போது, `amount` `0` ஆக initialize ஆகிறது; view அழிக்கப்படும் போது, `amount`-மும் அழிக்கப்படுகிறது.

இங்கு `amount` சேமிக்கும் data memory-யில் மட்டும் உள்ளது; அது device-இல் சேமிக்கப்படவில்லை.

நமக்கு `amount`-ன் lifetime view-உடன் இணைந்திருக்க வேண்டாம். அதற்காக data persistence செய்ய வேண்டும். அல்லது, data-ஐ device-இல் சேமிக்க வேண்டும்.

### “Data Persistence” என்றால் என்ன?

Data persistence என்பதை, “தற்காலிக memory”-இல் உள்ள data-ஐ “device storage”-க்கு சேமிப்பதாகப் புரிந்துகொள்ளலாம்.

View மூடப்பட்டாலும், அல்லது app மூடப்பட்டாலும், data இழக்கப்படாது.

Swift அபிவிருத்தியில், எளிய data persistence-க்கு `UserDefaults` பயன்படுத்தலாம்; சற்று சிக்கலான data-களுக்கு `SwiftData` அல்லது `CoreData` பயன்படுத்த வேண்டும்.

இந்தப் பாடத்தில், முதலில் மிகவும் எளிய `UserDefaults` பற்றி கற்போம்.

## UserDefaults

`UserDefaults` என்பது lightweight key-value data-ஐச் சேமிக்கப் பயன்படுத்தப்படுகிறது. பொதுவாக `String`, `Int`, `Double`, `Bool` போன்ற அடிப்படை type-களைச் சேமிக்க இதைப் பயன்படுத்துவார்கள்.

### தரவைச் சேமித்தல்

`UserDefaults`-இல் data-ஐச் சேமிக்க `set` method பயன்படுத்தப்படுகிறது:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

`UserDefaults`-இன் முதல் parameter என்பது சேமிக்க வேண்டிய data. இங்கு `String`, `Int` போன்ற data type-கள் கொடுக்கப்பட்டுள்ளன.

இரண்டாவது parameter `forKey` என்பது variable name போன்ற பங்கை வகிக்கிறது; அதாவது, `UserDefaults`-இல் சேமிக்கப்படும் data-ஐ அடையாளப்படுத்தப் பயன்படுகிறது.

### தரவை வாசித்தல்

`UserDefaults`-இல் இருந்து data-ஐப் படிக்க, அதற்குரிய methods பயன்படுத்தப்படுகின்றன:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

வாசிக்கும் போது, பொருத்தமான type method-ஐயே பயன்படுத்த வேண்டும். இல்லையெனில் தவறு அல்லது தவறான data கிடைக்கலாம்.

### UserDefaults பயன்படுத்தும் போது கவனிக்க வேண்டியவை

#### 1. Optional type திரும்ப வரும்

`UserDefaults`-இல் இருந்து data-ஐ வாசிக்கும் போது, சில methods optional type (`Optional`) திருப்பித் தரும்.

உதாரணமாக:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

இதில் `name`-ன் type:

```swift
String?
```

இதன் பொருள், அதற்கு value இருக்கலாம்; அல்லது value இல்லாமலும் இருக்கலாம்.

**ஏன் optional type திரும்ப வருகிறது?**

ஏனெனில், `UserDefaults`-இல் கொடுக்கப்பட்ட ஒரு key-க்கு data இருப்பது கட்டாயமில்லை.

உதாரணமாக:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

முன்பே `"City"` என்ற key-க்கு எந்த data-வும் சேமிக்கப்படவில்லை என்றால், வாசிக்கும் முடிவு:

```swift
nil
```

இங்கே வலியுறுத்த வேண்டியது என்னவென்றால், `nil` என்பது “data இல்லை” என்பதைக் குறிக்கும்; அது empty string அல்ல.

“Type System” என்ற பாடத்தில் நாம் இதற்கு ஒத்த சிக்கலை சந்தித்தோம். அப்போது, data type conversion தோல்வியடைந்தால் optional type திரும்ப வரும் என்று பார்த்தோம்.

அப்படிப்பட்ட சமயங்களில், `??` மூலம் ஒரு default value கொடுத்து unwrap செய்ய வேண்டும்:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

`UserDefaults`-இல் data இருந்தால் அதை பயன்படுத்தும்; data இல்லையெனில் (`nil`) default value-ஐப் பயன்படுத்தும்.

#### 2. Non-optional type திரும்ப வரும்

`UserDefaults`-இல் இருந்து `Int`, `Double`, `Bool` type-களை வாசிக்கும் போது, திரும்ப வரும் value non-optional type ஆக இருக்கும்.

உதாரணமாக:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

இந்த key-களுக்கு முன்னர் ஒருபோதும் data சேமிக்கப்படவில்லை என்றாலும், திரும்ப வரும் value `nil` ஆகாது.

அதற்குப் பதிலாக, default values திரும்ப வரும்:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. தரவு அளவு வரம்பு

`UserDefaults` என்பது மிகக் குறைந்த அளவிலான data-ஐச் சேமிக்க மட்டுமே பொருத்தமானது. உதாரணமாக app settings, எளிய status data போன்றவை.

நடைமுறையில், இது பெரிய அளவிலான data-களையோ, அடிக்கடி read/write செய்யப்படும் data-களையோ சேமிக்கப் பொருத்தமல்ல.

## “பணம் சேமிப்பு குடுவை” தொகையைச் சேமித்தல்

இப்போது, “பணம் சேமிப்பு குடுவை”யின் மொத்தத் தொகையை `UserDefaults` பயன்படுத்தி சேமிக்கும் code logic-ஐ அமைக்கலாம்.

பயனர் button-ஐ அழுத்தும் போது, input செய்யப்பட்ட தொகை மொத்தத் தொகையில் சேர்க்கப்பட்டு, அந்த மொத்தத் தொகை `UserDefaults`-இல் சேமிக்கப்படும்.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

இதன் மூலம், data write செய்யும் logic-ஐ நாம் செயல்படுத்திவிட்டோம்.

## Data Persistence Logic விளக்கம்

இப்போது data persistence-க்கான write logic முடிந்திருந்தாலும், app-ஐ உண்மையில் இயக்கிப் பார்த்தால் ஒரு விஷயம் தெரியும்: view refresh ஆனபோதோ, app மீண்டும் திறக்கப்பட்டபோதோ, `amount` variable இன்னும் `0`-ஆகத்தான் இருக்கும்.

அதற்குக் காரணம்:

```swift
@State private var amount = 0
```

SwiftUI-இல், `@State` variable view உருவாக்கப்படும் போது மீண்டும் initialize செய்யப்படும்.

`UserDefaults`-இல் `amount` value சேமிக்கப்பட்டிருந்தாலும், view மீண்டும் load ஆகும் போது `amount` மீண்டும் `0` ஆக reset ஆகிவிடும்.

இதனால் என்ன தெரிகிறது என்றால், நாம் தற்போதைக்கு data-ஐ `UserDefaults`-இல் சேமித்துள்ளோம்; ஆனால் அந்த data-ஐ view-இல் மீண்டும் restore செய்யவில்லை.

ஆகவே, view load ஆகும் போது, `UserDefaults`-இல் இருந்து data-ஐ கையால் வாசித்து, அதை மீண்டும் `amount`-க்கு assign செய்ய வேண்டும். அப்படிச் செய்தால்தான் முழுமையான data persistence logic நிறைவேறும்.

### தர்க்க ஒப்புமை

இந்த செயல்முறையை “வகுப்பறை கரும்பலகை” என்று ஒப்பிட்டு நினைக்கலாம்:

பாடம் நடைபெறும் போது, ஆசிரியர் கரும்பலகையில் எழுதுவார். அது தற்போதைய view state (`@State`) போல.

பாடம் முடிந்தபின், அடுத்தப் பாடத்திற்காக கரும்பலகை அழிக்கப்படும். இது view அழிக்கப்படும் போது `@State` data அழிக்கப்படுவதைப் போன்றது.

பாடத் தகவல் இழக்காமல் இருக்க, ஆசிரியர் அதைப் பாடக்குறிப்பில் முன்பே சேமித்து வைப்பார். அந்தக் குறிப்பே `UserDefaults`-இல் உள்ள data போல.

அடுத்த முறை வகுப்பு தொடங்கும் போது, கரும்பலகை மீண்டும் காலியாக இருக்கும் (`@State` initialize ஆகும்). அப்போது ஆசிரியர் பாடக்குறிப்பைப் பார்த்து, முந்தைய தகவலை மீண்டும் பலகையில் எழுத வேண்டும் (`UserDefaults`-இல் இருந்து வாசித்தல்).

கவனிக்க வேண்டியது: கரும்பலகை தானாகவே பழைய தகவலை மீட்டெடுக்காது; “பாடக்குறிப்பை வாசித்தல்” (`UserDefaults`-ஐ வாசித்தல்) மூலமே அதை மீண்டும் எழுத வேண்டும்.

## onAppear பயன்படுத்தி தரவை வாசித்தல்

View screen-இல் தோன்றும் போது, `UserDefaults`-இல் உள்ள value-ஐ கையால் வாசித்து, அதை `@State`-இன் `amount` variable-க்கு assign செய்ய வேண்டும். அதுவே உண்மையான data persistence-ஐ உருவாக்கும்.

SwiftUI-இல், view தோன்றும் போது initialization logic ஓடச் செய்ய `onAppear` பயன்படுத்தலாம்:

```swift
.onAppear {}
```

`UserDefaults`-ஐ வாசிக்கும் code-ஐ, `onAppear`-க்குள் இடலாம்:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

View உருவாக்கப்படும் போது, `amount` முதலில் `0` ஆக initialize ஆகும்; view தோன்றும் போது `onAppear` இயக்கப்பட்டு, `UserDefaults`-இல் இருந்து data வாசித்து `amount`-க்கு assign செய்யும். இவ்வாறு, view-இல் முந்தைய மொத்தத் தொகைத் திரும்பக் காட்டப்படும்.

இப்போது, “பணம் சேமிப்பு குடுவை”யின் முழு data persistence logic முடிந்துவிட்டது.

## முழுமையான code

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage Property Wrapper

SwiftUI, `UserDefaults`-ஐ இன்னும் எளிமையாகப் பயன்படுத்த `@AppStorage` property wrapper-ஐ வழங்குகிறது.

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` என்பது `UserDefaults`-க்கு மேல் இருக்கும் ஒரு wrapper ஆகும். இதில் `"amount"` என்பது `UserDefaults`-இன் key ஆகும்.

View உருவாக்கப்படும் போது, இது `UserDefaults`-இல் இருந்து data-ஐ வாசிக்கும்; variable மாறும் போது, தானாகவே `UserDefaults`-இல் எழுதிவிடும்.

மேலும், இது SwiftUI-இன் state update mechanism-ஐ ஆதரிக்கிறது. `@State` போலவே, value மாறும் போது SwiftUI view refresh ஆகும்.

அதாவது, `@AppStorage` data read மற்றும் save logic இரண்டையும் தானாகச் செய்கிறது. இனி கையால் `UserDefaults`-ஐ அழைக்க வேண்டியதில்லை; `onAppear` மூலம் கையால் data வாசிக்கவும் தேவையில்லை.

ஆகவே, code-இல் இருக்கும் `UserDefaults` logic-ஐ `@AppStorage`-ஆல் மாற்றலாம்:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## சுருக்கம்

இந்தப் பாடத்தில் நாம் முக்கியமாக கற்றவை பின்வருமாறு:

முதலில், `UserDefaults` என்பது lightweight data-ஐச் சேமிக்கப் பயன்படுகிறது. நாம் இதைப் பயன்படுத்தி மொத்தத் தொகையை device-இல் சேமித்தோம். `UserDefaults` data-ஐ வாசிக்கும் மற்றும் எழுதும் methods வழங்குகிறது; மேலும் optional types போன்றவற்றையும் கவனிக்க வேண்டும்.

அடுத்து, `@State` என்பது view-இல் உள்ள தற்காலிக state-ஐ நிர்வகிக்க மட்டுமே பயன்படும். அதன் lifetime, view-உடன் இணைந்திருக்கும். View மீண்டும் உருவாக்கப்பட்டால், `@State` மீண்டும் initialize ஆகும்.

`UserDefaults` data-ஐ மீண்டும் restore செய்யும் போது, `onAppear`-ஐப் பயன்படுத்தி view தோன்றும் தருணத்தில் `UserDefaults`-ஐ வாசித்து, data restoration செய்தோம்.

இறுதியாக, `UserDefaults`-க்கு பதிலாக `@AppStorage`-ஐப் பயன்படுத்தி, view load ஆகும் போது தானாக data-ஐ வாசிக்கவும், data மாறும்போது தானாக save செய்யவும் வழி செய்தோம். இதன் மூலம் கையால் `UserDefaults` மற்றும் `onAppear` logic எழுத வேண்டிய அவசியம் இல்லாமல் போகிறது.

இந்த அறிவுகளின் மூலம், app-இல் அடிப்படை data storage feature-ஐ உருவாக்கி, data-ஐ நிரந்தரமாகச் சேமிக்கலாம்.

## பாடத்திற்குப் பிந்தைய பயிற்சி

இப்போது, “பணம் சேமிப்பு குடுவை” தொகையைச் சேமிக்க முடிகிறது. ஆனால் அதன் செயல்பாடு இன்னும் முழுமையாக இல்லை.

1. பயனர் தொகையை எடுத்துக்கொள்ள வேண்டுமெனில், அதற்கான withdraw logic வடிவமைக்க வேண்டும்.
2. தொகையை முழுவதும் காலி செய்ய வேண்டுமெனில், reset logic-ஐயும் உருவாக்க வேண்டும்.
3. “பணம் சேமிப்பு குடுவை”க்கு ஒரு பெயர் சேர்க்க வேண்டுமெனில், `String` type data-ஐச் சேமிக்கும் logic-ஐயும் சேர்க்க வேண்டும்.

தற்போதைய அடிப்படையில் இந்த அம்சங்களை மேம்படுத்தி, “பணம் சேமிப்பு குடுவை”யை இன்னும் முழுமையானதாக மாற்றலாம்.

## விரிவாக்க அறிவு - Input Box Default Value சிக்கல்

இப்போது, input box-இன் interaction-ஐ இன்னும் சிறப்பாக மாற்றலாம்; அதனால் உள்ளீடு செய்வது இன்னும் வசதியாகும்.

![textfield](../../Resource/015_view.png)

தற்போதைய implementation-இல், input box-இன் default value `0` ஆக உள்ளது. ஒவ்வொரு முறை தொகையை உள்ளிடும் போது, பயனர் முதலில் `0`-ஐ நீக்கிவிட்டு, பின்னர் புதிய எண்ணை உள்ளிட வேண்டும். இந்த interaction அனுபவம் சிறப்பானதல்ல.

அதற்கு பதிலாக, input box ஆரம்பத்தில் காலியாக இருக்க வேண்டும்; `0` காட்டக்கூடாது.

அதற்குக் காரணம், `TextField` மற்றும் `number` இரண்டும் two-way binding-இல் உள்ளன:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

`number` ஆரம்பத்தில் `0` ஆக இருந்தால், input box-லும் `0`தான் காட்டப்படும்.

ஆகவே, `number`-ஐ empty value ஆக மாற்ற வேண்டும்; அதாவது `nil`.

```swift
@State private var number = nil
```

இப்போது ஒரு error வரும்:

```swift
Generic parameter 'Value' could not be inferred
```

இதுவே “Type System” பாடத்தில் பார்த்த நிலை: compiler ஒரு variable-ன் type-ஐ தானாகக் கணிக்க முடியாதபோது, நாம் type-ஐ வெளிப்படையாக அறிவிக்க வேண்டும்.

ஏனெனில், நாம் `number`-ஐ `nil` ஆக அமைத்துள்ளோம்; ஆனால் `nil`-க்கு தனியாக எந்த type தகவலும் இல்லை. ஆகவே compiler-க்கு இது `String`ஆ, `Int`ஆ, அல்லது வேறு ஏதாவது typeஆ என்பது புரியாது. அதனால் error வருகிறது.

ஆகவே, `number`-க்கு type-ஐ வெளிப்படையாக அறிவிக்க வேண்டும்:

```swift
@State private var number:Int? = nil
```

இங்கே `Int?` என்பது optional type (`Optional`) ஆகும். அதாவது, `number`-க்கு `Int` value இருக்கலாம்; அல்லது `nil` ஆகவும் இருக்கலாம்.

இவ்வாறு initialize செய்தால், input box ஆரம்பத்தில் காலியாகக் காட்டப்படும்; `0` அல்ல.

### Optional Type-ஐ unwrap செய்தல்

`number`-ஐ optional type-ஆக மாற்றிய பிறகு, முந்தைய கணக்கீட்டு code error தரும்:

```swift
amount += number
```

அதில் வரும் செய்தி:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

அதற்குக் காரணம், `number` இப்போது `nil` ஆக இருக்கலாம். அதை நேரடியாகக் கணக்கில் பயன்படுத்தினால், அது இதுபோலாகிவிடும்:

```swift
amount += nil
```

தெளிவாகவே, `nil`-ஐ `amount`-உடன் கூட்ட முடியாது. அது செல்லுபடியாகும் செயல்பாடு அல்ல.

ஆகவே, optional type-ஐ கணக்கீட்டில் பயன்படுத்தும் முன், அதை முதலில் unwrap செய்ய வேண்டும்.

இங்கு `??` பயன்படுத்தி default value கொடுக்கலாம்:

```swift
amount += number ?? 0
```

`number` `nil` ஆக இருந்தால், default value `0` பயன்படுத்தப்படும்; `number`-க்கு value இருந்தால், பயனர் உள்ளிட்ட உண்மையான value பயன்படுத்தப்படும்.

இவ்வாறு செய்வதால், கணக்கீடு சரியாக இருக்கும். அதே நேரத்தில், input box ஆரம்பத்தில் காலியாகவும் இருக்கும். இனி பயனர் ஒவ்வொரு முறை `0`-ஐ கையால் நீக்க வேண்டிய அவசியம் இல்லை.

## விரிவாக்க code

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
