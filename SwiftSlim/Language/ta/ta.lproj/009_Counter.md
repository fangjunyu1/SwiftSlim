# எண்ணி

முந்தைய இரண்டு பாடங்களில், நாங்கள் மாறிகள், மாறாத மாறிகள், பட்டன்கள், மற்றும் methods பற்றி கற்றோம்.

இந்தப் பாடத்தில், அந்த அறிவுகளை ஒன்றாக இணைத்து, ஒரு எளிய counter app-ஐ உருவாக்கப் போகிறோம்.

இந்த உதாரணத்தில், மாறிகளை எவ்வாறு சேமித்து மாற்றுவது, மேலும் `@State` பயன்படுத்தி மாறிகளை எவ்வாறு நிர்வகிப்பது என்பதையும் கற்போம்.

## எண்ணியை உருவாக்குதல்

Counter பொதுவாக தொடர்ந்து கூட்டிக்கொண்டே செல்லும் எண்ணிக்கையை பதிவு செய்யப் பயன்படுகிறது. உதாரணமாக, கயிறு தாண்டிய எண்ணிக்கை, ஓடிய சுற்றுகள் போன்றவை.

இப்போது, ஒரு எளிய counter உருவாக்குவோம்: ஒரு எண்ணை காட்டி, ஒரு பட்டனை அழுத்தும் போது அந்த எண் அதிகரிக்க வேண்டும்.

![Num](../../RESOURCE/009_num.png)

### எண்ணைக் காட்டுதல்

முதலில், `Text` பயன்படுத்தி எண்ணைக் காட்டுவோம்.

```swift id="0pu8bk"
Text("0")
```

ஆனால், அந்த எண் மாற வேண்டுமெனில், `"0"` என்று நேரடியாக எழுதக்கூடாது. அதற்கு பதிலாக, அந்த எண்ணை ஒரு variable-இல் சேமிக்க வேண்டும்.

```swift id="ty4ymo"
var num = 0
```

பிறகு, `Text`-இல் அந்த variable-ஐக் காட்டலாம்:

```swift id="7u4w77"
Text("\(num)")
```

இங்கே string interpolation `\()` பயன்படுத்தப்படுகிறது. இதன் மூலம், எண்ணை string ஆக மாற்றி காட்டலாம்.

### பட்டன் மூலம் எண்ணை அதிகரித்தல்

அடுத்து, ஒரு பட்டன் சேர்ப்போம்.

```swift id="74fnad"
Button("+") {

}
.buttonStyle(.borderedProminent)
```

பட்டன் அழுத்தப்படும் போது, எண் அதிகரிக்க வேண்டும் என்று விரும்புகிறோம்.

அதனால், பட்டனுக்குள் variable-ஐ மாற்றலாம்:

```swift id="95naop"
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

இந்தக் குறியீட்டின் பொருள்: பட்டன் அழுத்தப்படும் போது, `num + 1` கணக்கிடப்பட்டு, அதன் விளைவு மீண்டும் `num`-க்கு assign செய்யப்படும்.

### இன்னும் சுருக்கமான எழுதும் முறை

Swift இதற்காக இன்னும் சுருக்கமான ஒரு எழுதும் முறையை வழங்குகிறது:

```swift id="n3bafx"
num += 1
```

இது கீழேயுள்ள code-க்கு சமம்:

```swift id="9wo4xq"
num = num + 1
```

இந்த எழுதும் முறை “compound assignment operator” என்று அழைக்கப்படுகிறது.

Swift-இல் பொதுவாகப் பயன்படுத்தப்படும் compound assignment operator-கள்:

```id="ntxqpi"
+=   கூட்டல் assign
-=   கழித்தல் assign
*=   பெருக்கல் assign
/=   வகுத்தல் assign
%=   மீதி assign
```

உதாரணமாக:

```swift id="ntppl9"
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### முழு குறியீடு

இப்போது, ஒரு எளிய counter-ஐ எழுதலாம்:

```swift id="9lcyji"
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

ஆனால், இந்த code இப்போது சரியாக இயங்காது.

### பிழை தோன்றுதல்

Xcode கீழேயுள்ள பிழையை காட்டும்:

```id="65w6v7"
Cannot assign to property: 'self' is immutable
```

இதன் பொருள், property-ஐ மாற்ற முடியாது; ஏனெனில் view mutable அல்ல.

ஏன் இப்படியாகிறது?

## SwiftUI-யின் செயல்முறை

SwiftUI-யில்: **interface என்பது data மூலம் இயக்கப்படுகிறது**. அதாவது, data மாறும்போது interface தானாக refresh ஆகும்.

ஆனால், ஒரு முக்கிய விஷயம் என்னவென்றால்: state (`@State`, `@Binding` போன்றவை) மாறும் போது மட்டுமே SwiftUI அந்த மாற்றத்தைக் கண்காணித்து view-ஐ refresh செய்யும்.

சாதாரண variable பயன்படுத்தினால், SwiftUI view உருவாக்கப்படும் போது ஒருமுறை மட்டுமே அதன் value-ஐப் படிக்கும். அதன் பிறகு variable மாறினாலும், interface update ஆகாது.

உதாரணமாக:

```swift id="py1swn"
var num = 0   // 0
num = 1   // 0
```

மேலுள்ள உதாரணத்தில், `num` என்பது ஒரு சாதாரண variable. அதன் value மாறியிருந்தாலும், SwiftUI view-ஐ update செய்யாது. அதனால், interface-இல் ஆரம்ப மதிப்பு `0` தான் காட்டப்படும்.

![Num](../../RESOURCE/009_state.png)

அதனால், data state ஆகக் குறிக்கப்படும்போது மட்டுமே — உதாரணமாக `@State`, `@Binding` போன்ற property wrapper-கள் மூலம் — SwiftUI அதன் மாற்றங்களை தானாகக் கண்காணித்து view-ஐ update செய்யும்.

## @State property wrapper

SwiftUI-யில், variable-ஐ மாற்றியும் view-ஐ update செய்யவும் வேண்டுமெனில், கட்டாயமாக `@State` பயன்படுத்த வேண்டும்.

```swift id="rkk3e0"
@State var num = 0
```

`@State`, SwiftUI-க்கு இந்த variable-ஐக் கண்காணிக்கச் சொல்கிறது.

இந்த variable மாறும்போது, SwiftUI view-ஐ மறுபடியும் கணக்கிட்டு, அதை update செய்யும்.

முழு code:

```swift id="n9v8gw"
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

இப்போது, பட்டன் அழுத்தப்படும் போது:

```swift id="8p344a"
num += 1
```

SwiftUI, `num` மாறியதை உணர்ந்து, view-ஐ தானாகவே update செய்யும்.

![Num](../../RESOURCE/009_state1.png)

## @State பயன்படுத்தும் விதிகள்

நடைமுறை development-இல், `@State` பொதுவாக இரண்டு விதிகளைப் பின்பற்றுகிறது.

### 1. @State பொதுவாக private உடன் எழுதப்படுகிறது

`@State` variable பொதுவாக தற்போதைய type-இல் மட்டுமே பயன்படுத்தப்படும். உதாரணமாக, தற்போதைய `View` struct-இல்.

அதனால், இது பொதுவாக இவ்வாறு எழுதப்படும்:

```swift id="2f2tqt"
@State private var num = 0
```

இது, பிற view-கள் இந்த variable-ஐ நேரடியாக access செய்யவோ மாற்றவோ முடியாதபடி பாதுகாக்கும்.

நாம் இன்னும் `private` பற்றி கற்றിട്ടില്ല. இப்போது இதை எளிதாகப் புரிந்துகொள்ள வேண்டுமெனில்:

**`private` கொண்டு குறிக்கப்பட்ட உள்ளடக்கம் தற்போதைய view-க்குள் மட்டுமே பயன்படுத்த முடியும்; வெளிப்புற view-களால் அதை பயன்படுத்த முடியாது.**

### 2. @State தற்போதைய view-இன் state-க்கு மட்டும்

`@State`, தற்போதைய `View` தானாக நிர்வகிக்கும் data-க்கு பொருத்தமானது.

உதாரணமாக, input field உள்ளடக்கம் அல்லது switch நிலை:

```swift id="1fk13w"
@State private var isOn = false
@State private var text = ""
```

Data பல view-களுக்கு இடையில் பகிரப்பட வேண்டுமெனில், வேறு state type-கள் தேவைப்படும். உதாரணமாக `@Binding` அல்லது `@Observable`.

அவற்றைப் பற்றி அடுத்தடுத்த பாடங்களில் கற்போம்.

### குறைக்கும் பட்டன்

Counter-இல், எண்ணை அதிகரிப்பதுடன், குறைக்கவும் முடியும்.

அதற்காக, ஒரு `-` பட்டன் சேர்க்கலாம்.

```swift id="8dl3ub"
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

பிறகு, பட்டன்களை `HStack` கொண்டு கிடைமட்டமாக ஒழுங்குபடுத்தலாம்:

```swift id="eoia0a"
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

விளைவு:

![Num](../../RESOURCE/009_num1.png)

`+` பட்டனை அழுத்தும்போது, எண் 1 அதிகரிக்கும்; `-` பட்டனை அழுத்தும்போது, எண் 1 குறையும்.

### reset பட்டன்

இன்னொரு reset பட்டனையும் சேர்க்கலாம். இது எண்ணை மீண்டும் `0` ஆக மாற்றும்.

```swift id="1djhht"
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

இந்த reset பட்டன் அழுத்தப்படும் போது, `num`-க்கு `0` assign செய்யப்படும்.

விளைவு:

![Num](../../RESOURCE/009_num2.png)

`0` பட்டனை அழுத்தும் போது, எண் `0` ஆக மாறும்.

### தனிப்பயன் பட்டன்

இப்போது நம்முடைய பட்டன்கள் உரையை மட்டுமே காட்டுகின்றன:

```swift id="tq4kf1"
Button("+") {

}
```

இவ்வாறு எழுதப்பட்ட பட்டன், `+` அல்லது `-` போன்ற text-ஐ மட்டுமே காட்ட முடியும்.

நடைமுறை development-இல், பட்டனின் தோற்றம் இன்னும் வளமாக இருக்க வேண்டும் என்று பெரும்பாலும் விரும்புவோம். உதாரணமாக, icon அல்லது வேறு view-களைப் பயன்படுத்தலாம்.

SwiftUI, பட்டனின் காட்சி உள்ளடக்கத்தை தனிப்பயனாக்க அனுமதிக்கிறது. அப்போது, பட்டனின் மற்றொரு எழுதும் முறையைப் பயன்படுத்தலாம்:

```swift id="g93p1s"
Button(action: {

}, label: {

})
```

இந்த எழுதும் முறையில், `action` என்பது பட்டன் அழுத்தப்படும் போது இயங்கும் code; `label` என்பது பட்டனில் காட்டப்படும் view.

உதாரணமாக, பட்டனில் ஒரு SF Symbols icon-ஐக் காட்டலாம்:

```swift id="mujlwm"
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

இப்போது பட்டன் text அல்லாமல், ஒரு icon-ஐக் காட்டும்.

### counter interface-ஐ மேம்படுத்துதல்

Counter interface இன்னும் தெளிவாக இருக்க, எண்ணைக் காட்டும் style-ஐ மாற்றலாம். உதாரணமாக, எண்ணை பெரிதாக்கலாம்:

```swift id="t5mnre"
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

அடுத்து, பட்டன்களின் காட்சி உள்ளடக்கத்தையும் icon-களாக மாற்றி, அவற்றின் icon அளவையும் சிறிது பெரிதாக்கலாம்:

```swift id="1w9tl8"
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

அதேபோல், குறைக்கும் பட்டனையும் reset பட்டனையும் icon வடிவமாக மாற்றலாம்:

```swift id="x9uvwn"
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

இப்போது பட்டன்கள் SF Symbols icon-களை காட்டும். இதனால் interface இன்னும் நேரடியாகப் புரிந்துகொள்ளும் வகையில் இருக்கும்.

![Num](../../RESOURCE/009_num3.png)

## சுருக்கம்

இந்தப் பாடத்தில், ஒரு எளிய counter-ஐ உருவாக்கி, variable, `Text`, மற்றும் `Button` பயன்பாட்டை ஒருங்கிணைத்து பயிற்சி செய்தோம். எண்ணைச் சேமிக்க variable பயன்படுத்தினோம்; பட்டன்கள் மூலம் அந்த எண்ணை அதிகரிக்கவும் குறைக்கவும் செய்தோம். அதே நேரத்தில், `num += 1` மற்றும் `num -= 1` போன்ற compound assignment operator-களையும் கற்றோம்.

இந்த செயல்முறையில், SwiftUI எவ்வாறு செயல்படுகிறது என்பதையும் புரிந்துகொண்டோம்: interface என்பது data மூலம் இயக்கப்படுகிறது. Data மாறும்போதுதான் interface refresh ஆகும். அதனால், மாறக்கூடிய state-ஐச் சேமிக்க `@State` பயன்படுத்த வேண்டும். `@State` variable மாறும்போது, SwiftUI view-ஐ தானாகவே update செய்யும்.

இறுதியாக, interface-ஐ சிறிது மேம்படுத்தினோம். `Text`-இன் font style-ஐ மாற்றினோம்; மேலும் `Button(action:label:)` பயன்படுத்தி பட்டன்களின் உள்ளடக்கத்தை custom செய்தோம். இதன் மூலம், பட்டன்கள் icon-களை காட்ட முடிந்தது; அதனால் counter interface இன்னும் தெளிவாகவும் அழகாகவும் மாறியது.

இப்போது, நாம் SwiftUI view-இன் அடிப்படை பயன்பாட்டைத் தொடந்து அறிந்துவிட்டோம். SwiftUI-யில், பெரும்பாலான interface-கள் variable-கள் மூலம் இயக்கப்படுகின்றன. Variable மாறும்போது, SwiftUI view-ஐ தானாக update செய்யும். அதனால், SwiftUI app உருவாக்கும் போது, பொதுவாக முதலில் சேமிக்க வேண்டிய data-ஐ வடிவமைத்து, பின்னர் அந்த data அடிப்படையில் interface மற்றும் interaction logic-ஐ உருவாக்குகிறோம்.

## முழு குறியீடு

```swift id="ujy064"
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
