# பட்டனை செயல்படச் செய்வோம்

இந்தப் பாடத்தில், முக்கியமாக SwiftUI-இல் உள்ள Button பட்டன், `print` மூலம் debug output, மற்றும் Swift function-களைப் பற்றி கற்போம்.

இவை SwiftUI interaction programming-இன் அடிப்படை அறிவுகள்.

## பட்டன்

பட்டன் என்பது நாம் அதிகம் பயன்படுத்தும் UI control-களில் ஒன்று. பதிவிறக்கம் செய்ய, திறக்க, அல்லது வெளியேற போன்ற செயல்பாடுகள் தேவைப்படும் போது, பொதுவாக பட்டனைத் தட்டுவோம்.

உதாரணமாக, App Store-இல் “Get” பட்டனைத் தட்டி App-ஐ பதிவிறக்கம் செய்கிறோம்.

![Button](../../RESOURCE/008_button.png)

SwiftUI-இல், பட்டன் `Button` மூலம் குறிக்கப்படுகிறது.

அடிப்படை பயன்பாடு:

```swift
Button("") {
    
}
```

இதன் அமைப்பை இரண்டு பகுதிகளாகப் பார்க்கலாம்:

```swift
Button("பட்டன் உரை") {
    பட்டன் அழுத்தப்படும் போது செயல்படும் குறியீடு
}
```

உதாரணமாக:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

இதை இயக்கிய பிறகு, ஒரு `Start` பட்டன் காட்டப்படும்.

![Button](../../RESOURCE/008_button1.png)

பயனர் பட்டனைத் தட்டும் போது, `{}` உள்ளேயுள்ள code செயல்படும்.

கவனம்: `Button` என்பது SwiftUI-யின் interface control (`View`) ஆகும். அதனால், இது கட்டாயமாக `body`-க்குள் எழுதப்பட வேண்டும்.

### buttonStyle modifier

SwiftUI-இல், `Button`-க்கு system built-in button style-கள் உள்ளன. அவற்றை `buttonStyle` modifier மூலம் பயன்படுத்தலாம்.

உதாரணமாக:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle`, system வழங்கும் button style-ஐப் பயன்படுத்தும்.

பொதுவான option-கள்:

* .automatic
* .plain
* .bordered
* .borderedProminent
* .borderless

![Button](../../RESOURCE/008_button7.png)

இந்த வெவ்வேறு style-களின் முக்கிய வேறுபாடு என்னவென்றால்: பட்டனில் border இருக்கிறதா, background இருக்கிறதா, visual emphasis எவ்வளவு உள்ளது என்பதில்தான்.

## print output

Programming-இல், program குறிப்பிட்ட code பகுதி வரை சென்றுள்ளதா என்பதைப் பார்க்க வேண்டும் என்ற அவசியம் அடிக்கடி இருக்கும்.

Swift அதற்காக `print` function-ஐ வழங்குகிறது; இது debug தகவலை output செய்யப் பயன்படுகிறது.

அடிப்படை எழுதும் முறை:

```swift
print("Hello")
```

இந்த வரி, உரையை Console-இல் output செய்யும்.

### பட்டன் இயங்குகிறதா என்பதைச் சோதித்தல்

பட்டன் உண்மையில் அழுத்தப்பட்டதா என்பதைச் சோதிக்க, பட்டனுக்குள் `print` எழுதலாம்.

```swift
Button("Start") {
    print("Test 123")
}
```

பட்டனைத் தட்டும் போது, Console-இல் கீழே உள்ள output காணப்படும்:

```id="ux7ib1"
Test 123
```

இதன் பொருள், பட்டன் வெற்றிகரமாக trigger செய்யப்பட்டுள்ளது.

![Button](../../RESOURCE/008_button3.png)

கவனம்: `print` என்பது Swift code; அது interface control அல்ல. அதனால், அதை நேரடியாக `body`-க்குள் எழுத முடியாது; இல்லையெனில் error வரும்.

உதாரணமாக, கீழே உள்ளபடி எழுதுவது தவறு:

```swift id="vyokko"
struct ContentView: View {
    var body: some View {
        print("Test 123")  // தவறு: body ஒரு View-ஐத் திருப்பித் தர வேண்டும்
    }
}
```

SwiftUI-யில், `body` என்பது interface அமைப்பை விவரிக்கப் பயன்படுகிறது. அதற்குள் `Text`, `Button`, `Image` போன்ற interface control (`View`)கள் மட்டுமே இருக்க வேண்டும்.

சாதாரண code-கள், உதாரணமாக கணக்கீட்டு logic, `print` போன்றவை, button, function, அல்லது பிற event handler-களுக்குள் எழுதப்பட வேண்டும்.

### Console கட்டுப்பாட்டு பகுதி

`print` output செய்த உள்ளடக்கம், Xcode-இன் Console-இல் காட்டப்படும்.

Console தெரியவில்லை என்றால், கீழ் வலது மூலையில் உள்ள `Show the Debug Area` பொத்தானை அழுத்தி debug பகுதியைத் திறக்கவும். அதன் பிறகு `Show the Console` பொத்தானை அழுத்தி Console-ஐக் காட்டலாம்.

![](../../RESOURCE/008_button4.png)

Console-இன் கீழ் இடப்பகுதியில் இரண்டு tab-கள் உள்ளன: `Executable` மற்றும் `Previews`.

![](../../RESOURCE/008_button5.png)

இந்த இரண்டு tab-களும் வேறு வேறு running environment-களை குறிக்கும். Canvas preview-இல் view-ஐப் பார்க்கும் போது, `print` output `Previews` tab-இல் வரும். App-ஐ simulator அல்லது உண்மையான சாதனத்தில் இயக்கினால், output `Executable` tab-இல் வரும்.

அதனால், `print` output தெரியவில்லை என்றால், முதலில் சரியான tab தேர்வு செய்யப்பட்டுள்ளதா என்பதைச் சரிபார்க்கவும்.

## உதாரணம் - ASCII character art

சில code project-களில், ASCII character art அடிக்கடி காணப்படும்.

Character art என்பது சாதாரண எழுத்துக்களைப் பயன்படுத்தி உருவாக்கப்படும் ஓவியம் போன்ற வடிவமாகும். உதாரணமாக:

![ASCII](../../RESOURCE/008_ascii.png)

பட்டன் + `print` பயன்படுத்தி, ஒரு ASCII character art output செய்யலாம்.

உதாரண code:

```swift id="bbkwnc"
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

பட்டனைத் தட்டும் போது, Console-இல் கீழ்கண்ட output வரும்:

```id="ioz5xf"
 /\_/\
( o.o )
 > ^ <
```

கவனம்: string-இல் உள்ள `\` என்பதை `\\` என்று எழுத வேண்டும். ஏனெனில் backslash என்பது string-இல் escape character ஆகும்.

## Function

பட்டனுக்குள், நாமே நேரடியாக code எழுதலாம்.

உதாரணமாக:

```swift
Button("Start") {
    print("Hello")
}
```

Code குறைவாக இருந்தால், இவ்வாறு எழுதுவதில் பிரச்சினையில்லை. ஆனால் நடைமுறை development-இல், ஒரு பட்டன் trigger செய்யும் logic மிகவும் அதிகமாக இருக்கலாம்.

உதாரணமாக:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // இன்னும் பல code இருக்கக்கூடும்
}
```

Code அதிகரித்து வந்தால், அதை நேரடியாக பட்டனுக்குள் எழுதுவது interface code-ஐ குழப்பமாக்கும். மேலும், படிக்கவும் maintain செய்யவும் சிரமமாக இருக்கும்.

அதனால், இந்த logic-ஐ பொதுவாக ஒரு function-க்குள் ஒழுங்குபடுத்து வோம். பின்னர் பட்டனில் அந்த function-ஐ அழைப்போம்.

### Function என்பது என்ன

Function என்பது மீண்டும் மீண்டும் பயன்படுத்தக்கூடிய ஒரு code பகுதி.

சில code-களை execute செய்ய வேண்டுமெனில், அந்த function-ஐ அழைத்தால் போதும்; function உள்ளேயுள்ள code இயக்கப்படும்.

இதனால், code structure இன்னும் தெளிவாக இருக்கும்; மேலும், code-ஐ மீண்டும் பயன்படுத்தவும் எளிதாகும்.

### அடிப்படை எழுதும் முறை

Swift-இல், function `func` என்ற keyword கொண்டு வரையறுக்கப்படுகிறது:

```swift
func randomInt() {
    // code
}
```

இந்த code, ஒரு function-ஐ வரையறுக்கிறது.

`randomInt` என்பது function-இன் பெயர்; இந்த code பகுதியை அடையாளப்படுத்த இதைப் பயன்படுத்துகிறோம்.

`()` என்பது parameter இடமாகும்; இதன் மூலம் வெளியிலிருந்து தரவைப் பெறலாம். தரவு தேவையில்லை என்றால், அதை காலியாகவிடலாம்.

`{}` உள்ளே தான் function-இன் code பகுதி இருக்கும். இயங்க வேண்டிய அனைத்து code-களும் இதற்குள் எழுதப்படும்.

உதாரணமாக:

```swift
func getName() {
    print("FangJunyu")
}
```

இந்த function-இன் வேலை, ஒரு உரையை output செய்வது.

### Function-ஐ அழைப்பது

Function-ஐ வரையறுப்பது, அந்த code பகுதியை உருவாக்குவது மட்டுமே. அதை execute செய்ய வேண்டுமெனில், function-ஐ call செய்ய வேண்டும்.

Call செய்யும் முறை: function பெயருக்குப் பின்னர் `()` சேர்த்தல்.

```swift
getName()
```

Program இந்த வரிக்கு வந்ததும், `getName` function உள்ளேயுள்ள code இயங்கும்.

முழு உதாரணம்:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

இதை இயக்கிய பிறகு, Console-இல் கீழ்கண்ட output வரும்:

```id="jlwmxy"
FangJunyu
```

### SwiftUI-இல் function பயன்படுத்துதல்

SwiftUI view-இல், function பொதுவாக `body`-க்கு வெளியே எழுதப்படும்.

உதாரணமாக:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

இப்போது பட்டனைத் தட்டும் போது, `getName()` function அழைக்கப்படும்.

இதனால், interface code சுத்தமாக இருக்கும்; logic function-க்குள் தனியாகச் செயல்படும்.

### Function parameter

சில நேரங்களில், ஒரு function வெவ்வேறு data-களைப் பொறுத்து வேறு வேறு செயல்களைச் செய்ய வேண்டும்.

உதாரணமாக, function நிலையான `"FangJunyu"` என்பதையே output செய்யாமல், வெவ்வேறு பெயர்களை output செய்ய வேண்டும் என நினைக்கலாம்.

அப்போது parameter பயன்படுத்தலாம். Parameter-ஐ, function அழைக்கும் போது வழங்கப்படும் data என்று புரிந்துகொள்ளலாம்.

உதாரணமாக:

```swift
func getName(name: String) {
    print(name)
}
```

இந்த function-இல் ஒரு புதிய parameter சேர்க்கப்பட்டுள்ளது. `name` என்பது parameter பெயர்; `String` என்பது அதன் type.

இதன் பொருள், இந்த function ஒரு `String` type data-ஐ ஏற்க வேண்டும்.

Function-க்கு இப்போது data தேவைப்படுவதால், அதை call செய்யும் போது அந்த data-ஐ கட்டாயமாக வழங்க வேண்டும்.

```swift
getName(name: "Sam")
```

இப்போது `"Sam"` வழங்கப்படும் போது, function அதன் உள்ளே அந்த value-ஐ output செய்யும்.

இயக்கும் விளைவு:

```id="o9pqos"
Sam
```

## உதாரணம் - function பயன்படுத்தி ASCII character art output செய்தல்

முந்தைய உதாரணத்தில், `print` code-ஐ நேரடியாக பட்டனுக்குள் எழுதினோம்.

ஆனால் character art சற்றுக் குழப்பமானதாக இருந்தால், code நீளமாகிவிடும். அப்போது, logic-ஐ function-க்குள் மாற்றிவைத்தால், interface code இன்னும் தெளிவாக இருக்கும்.

உதாரண code:

```swift id="oxg8gg"
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

இதை இயக்கி, பட்டனைத் தட்டும் போது, Console-இல் output:

```id="cbhsy8"
 /\_/\
( o.o )
 > ^ <
```

இங்கே இரண்டு விஷயங்கள் நடக்கின்றன. பயனர் பட்டனைத் தட்டிய பிறகு:

1. பட்டன் `printCat()` function-ஐ அழைக்கிறது
2. function உள்ளேயுள்ள `print` code செயல்படுகிறது

இதனால், interface code event-ஐ trigger செய்வதற்கே பொறுப்பாக இருக்கும்; குறிப்பிட்ட logic function-க்குள் செயல்படும்.

நடைமுறை development-இல், பெரும்பாலான button operation-கள் function மூலம் செய்யப்படுகின்றன.

## சுருக்கம்

இந்தப் பாடத்தில் மூன்று முக்கிய விஷயங்களை கற்றோம்:

**1. Button பட்டன்**

`Button` என்பது SwiftUI-யில் action trigger செய்யப் பயன்படும் control ஆகும்.

```swift
Button("Start") {

}
```

பயனர் பட்டனைத் தட்டும் போது, `{}` உள்ளேயுள்ள code செயல்படும்.

**2. print output**

`print` என்பது Console-இல் debug information output செய்யப் பயன்படும்.

```swift
print("Hello")
```

இதன் மூலம் developer, program எந்த நிலையில் இயங்குகிறது என்பதை Console-இல் பார்க்க முடியும்.

**3. Function**

Function என்பது மீண்டும் பயன்படுத்தக்கூடிய code பகுதி.

```swift
func sayHello() {
    print("Hello")
}
```

Function-ஐ அழைப்பது:

```swift
sayHello()
```

Function-க்கு data தேவைப்பட்டால், parameter பயன்படுத்தலாம்:

```swift
func sayHello(name: String) {
    print(name)
}
```

அடுத்தடுத்த பாடங்களில், இன்னும் பல SwiftUI control-களையும், data எவ்வாறு interface-உடன் interact செய்கிறது என்பதையும் தொடர்ந்து கற்போம்.

## பயிற்சி

கீழே உள்ள பயிற்சிகளைச் செய்து பார்க்கவும்:

1. `"Hello"` என்ற உரையுடன் ஒரு button உருவாக்கவும்
2. பட்டனைத் தட்டும் போது, Console-இல் `Hello Swift` என்று output செய்யவும்
3. அந்த output code-ஐ ஒரு function-க்குள் எழுதிவைத்து, பின்னர் button-இல் அந்த function-ஐ அழைக்கவும்
