# அழகான நிறங்கள்

இந்தப் பாடத்தில், SwiftUI-இல் பொதுவாகப் பயன்படுத்தப்படும் சில visual modifier-களைப் பார்க்கப் போகிறோம். அவை:

* நிறம்
* முன்னணி நிறம்
* பின்னணி நிறம்
* இடமாற்றம்
* வெளிப்படைத்தன்மை
* மங்கல்

அதோடு, Safe Area (பாதுகாப்பு பகுதி) பற்றியும் கற்போம்.

இந்த modifier-கள் view-இன் தோற்றத்தை கட்டுப்படுத்தப் பயன்படுகின்றன; இதனால் interface இன்னும் தெளிவாகவும் அடுக்குகளுடன் காணப்படவும் செய்யலாம்.

## நிறம்

SwiftUI-இல், உரையின் நிறத்தை அமைக்கலாம்.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` என்பது நீல நிறத்தை குறிக்கிறது. உண்மையில் இது `Color.blue`-இன் சுருக்கமான எழுதும் முறை; இது type inference காரணமாக இயங்குகிறது.

பொதுவான நிறங்கள்:

```swift
.black
.green
.yellow
.pink
.gray
...
```

இவை அனைத்தும் `Color`-இன் static property-கள்.

![Color](../../RESOURCE/006_color.png)

`Color`-ஐ ஒரு நிற வகையாகக் கருதலாம்; `.blue`, `.red` போன்றவை அதன் குறிப்பிட்ட நிறங்கள்.

### Color view

SwiftUI-இல், `Color`-ஐ ஒரு view ஆகவும் காட்டலாம்.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

இந்தக் குறியீடு 100 × 100 அளவுள்ள ஒரு சிவப்பு சதுரத்தை உருவாக்கும்.

முழு interface-ஐயும் ஒரு நிறமாகக் காட்டலாம்:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

இயக்கிய பிறகு, சிவப்பு நிறம் முழு திரையையும் மூடவில்லை என்பதைப் பார்க்கலாம். iPhone-இன் மேல் மற்றும் கீழ் பகுதிகள் இன்னும் வெள்ளையாக இருக்கும். இதற்கு காரணம் Safe Area (பாதுகாப்பு பகுதி) ஆகும்.

## Safe Area（பாதுகாப்பு பகுதி）

Safe Area என்பது உள்ளடக்கம் மறைக்கப்படாமல் இருக்க system ஒதுக்கி வைக்கும் பகுதி. அதில் உள்ளவை:

1. மேல் பகுதியில் உள்ள status bar (நேரம், battery)

2. கீழே உள்ள Home indicator bar

3. notch அல்லது Dynamic Island பகுதி

![Color](../../RESOURCE/006_color3.png)

SwiftUI இயல்பாக உள்ளடக்கத்தை safe area-க்குள் மட்டுமே கட்டுப்படுத்தும். அதனால், view திரையின் எல்லைகள்வரை நீளாது.

### Safe Area-ஐ புறக்கணித்தல்

நிறம் முழு திரையையும் மூட வேண்டும் என்றால், `ignoresSafeArea` பயன்படுத்தலாம்:

```swift
Color.red
    .ignoresSafeArea()
```

அல்லது `edgesIgnoringSafeArea` பயன்படுத்தலாம்:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

இவ்வாறு செய்தால், view முழு திரையையும் நோக்கி நீளும்.

கவனம்: `edgesIgnoringSafeArea` என்பது பழைய எழுதும் முறை. iOS 14 முதல், `ignoresSafeArea` பயன்படுத்த பரிந்துரைக்கப்படுகிறது.

## முன்னணி நிறம்

### foregroundStyle modifier

முந்தைய பாடங்களில், `foregroundStyle` மூலம் நிறத்தை அமைத்ததைக் கற்றோம்.

உதாரணமாக:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` என்பது புதிய style system ஆகும். இது நிறம், gradient, material போன்றவற்றை ஆதரிக்கிறது.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier

`foregroundColor` பயன்படுத்தியும் நிறத்தை அமைக்கலாம்:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

இதன் பயன்பாடு `foregroundStyle` போலவே இருக்கும்.

சமீபத்திய Xcode பதிப்புகளில், `foregroundColor` எதிர்கால iOS பதிப்புகளில் பயன்பாட்டிலிருந்து நீக்கப்படக்கூடும் என்று Xcode எச்சரிக்கை காட்டலாம். அதனால், முதன்மையாக `foregroundStyle` பயன்படுத்துவது சிறந்தது.

## பின்னணி

ஒரு view-க்கு background color சேர்க்க வேண்டுமெனில், `background` பயன்படுத்தலாம்:

```swift
background(.red)
```

உதாரணமாக, உரைக்கு background color சேர்ப்பது:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome போன்ற App-களில் நாம் உரையைத் தேர்வு செய்யும் போது, இதுபோன்ற background effect-ஐப் பார்க்கலாம்.

![Color](../../RESOURCE/006_color16.png)

Background பகுதியை பெரிதாக்க வேண்டும் என்றால், `padding`-ஐ சேர்த்து பயன்படுத்த வேண்டும்:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

இங்கே ஒரு முக்கியமான விதியை கவனிக்க வேண்டும்:

SwiftUI modifier-கள் மேலிருந்து கீழாக view-ஐ கட்டமைக்கின்றன. பின்னர் எழுதப்படும் modifier, அதற்கு முன்னர் உருவான விளைவின் மீது செயல்படும்.

அதனால்:

```swift
.padding()
.background()
```

இதன் பொருள், `padding` சேர்க்கப்பட்ட பிந்தைய view-ஐ `background` சுற்றிக்கொள்ளும்.

ஆனால் வரிசையை மாற்றி எழுதினால்:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Background பெரிதாகாது, ஏனெனில் `background` பின்னர் சேர்க்கப்பட்ட `padding`-ஐ உள்ளடக்குவதில்லை.

## உதாரணம் - நான்கு மூலை நட்டு

இப்போது, ஒரு எளிய “நான்கு மூலை நட்டு” view-ஐ உருவாக்கலாம்.

![Color](../../RESOURCE/006_color8.png)

முதலில், 50 × 50 அளவுள்ள ஒரு வெள்ளை சதுரத்தை உருவாக்குவோம்:

```swift
Color.white
    .frame(width: 50, height: 50)
```

அதை வட்டமாக மாற்ற வேண்டுமெனில், `cornerRadius` பயன்படுத்தலாம்:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

மூலை வட்ட அளவு, width மற்றும் height-இன் பாதியாக இருந்தால், அது வட்டமாக மாறும்.

இப்போது, அதற்கு ஒரு நீல பின்னணி சேர்ப்போம்:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

புதிதாகச் சேர்க்கப்பட்ட `padding`, வெளியேயுள்ள பகுதியை பெரிதாக்கும். `background`, அந்த வெளியேயுள்ள பகுதியில் நீல நிறத்தை வரையும்.

இதன் மூலம், ஒரு நான்கு மூலை நட்டு போன்ற effect உருவாகிறது.

### மற்றொரு அணுகுமுறை

Background color பயன்படுத்துவதற்குப் பதிலாக, `ZStack` கொண்டு இதே நான்கு மூலை நட்டு effect-ஐ உருவாக்கலாம்.

முந்தைய பாடத்தில் பார்த்ததுபோல், `ZStack` மூலம் view-களை ஒன்றின் மேல் ஒன்றாக அடுக்கிக் காட்டலாம். நான்கு மூலை நட்டையும், ஒரு வட்டமும் ஒரு செவ்வகமும் ஒன்றின் மேல் ஒன்று இருப்பதாகக் கருதலாம்.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack`, view-களை வரிசைப்படி அடுக்கும். பின்னர் சேர்க்கப்படும் view மேலிருக்கும்.

## உதாரணம் - ஒன்றுடன் ஒன்று ஒட்டிய இரண்டு வட்டங்கள்

பல சின்னங்கள் எளிய வடிவங்களை அடுக்கி உருவாக்கப்படுகின்றன. உதாரணமாக, ஒன்றின் மீது ஒன்று பகுதி அளவில் ஒட்டியிருக்கும் இரண்டு வட்டங்கள்.

![Color](../../RESOURCE/006_color14.png)

முதலில், இரண்டு வட்டங்களை உருவாக்குவோம்:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

இரண்டு வட்டங்களையும் ஒன்றின் மேல் ஒன்று காட்ட வேண்டும் என்பதால், `ZStack` layout பயன்படுத்த வேண்டும்:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

இப்போது, ஒரே அளவுள்ள இரண்டு வட்டங்களும் முழுமையாக ஒன்றின் மீது ஒன்று ஒட்டியிருக்கும்.

நமக்கு வேண்டியது, முழுமையாக மூடாமல், ஒரு பகுதி மட்டும் ஒட்டியிருப்பதுபோல் காட்டுவது. அதற்கு `offset` பயன்படுத்தி இடமாற்றத் தோற்றத்தை உருவாக்கலாம்.

## இடமாற்றம்

`offset` என்பது view-இன் வரைவிடத்தை மட்டும் மாற்றும்; parent view-இன் layout கணக்கீட்டை அது மாற்றாது.

பயன்பாடு:

```swift
.offset(x:y:)
```

`x` என்பது கிடைமட்ட இடமாற்றம்; `y` என்பது செங்குத்து இடமாற்றம்.

நேர்மறை மதிப்பு வலப்புறம் / கீழ்ப்புறம் நகரும்; எதிர்மறை மதிப்பு இடப்புறம் / மேற்புறம் நகரும்.

`offset` பயன்படுத்தி, இரண்டு வட்டங்களையும் பகுதி அளவில் ஒட்டவிடலாம்:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

சிவப்பு வட்டம் layout-இல் தனது அசல் இடத்திலேயே இருக்கும். ஆனால் அதன் வரைவிடம் இடப்புறமாக 25 point நகர்த்தப்படும். அதன் விளைவாக, இரண்டு வட்டங்களும் பகுதி அளவில் ஒட்டியிருப்பதுபோன்ற தோற்றம் கிடைக்கும்.

## வெளிப்படைத்தன்மை

SwiftUI-இல், `opacity` view-இன் வெளிப்படைத்தன்மையை அமைக்கப் பயன்படுகிறது.

அடிப்படை பயன்பாடு:

```swift
.opacity(0.5)
```

`opacity`-இன் மதிப்பு 0.0 முதல் 1.0 வரை இருக்கும்:

* 0 என்பது முழுமையாகத் தெளிவானது
* 1 என்பது முழுமையாகத் தெளிவற்றது

ஆரஞ்சு வட்டத்தின் வெளிப்படைத்தன்மையை `opacity` மூலம் அமைக்கலாம்:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

ஆரஞ்சு வட்டத்தின் `opacity`-ஐ 0.8 ஆக அமைத்த பிறகு, அதன் தெளிவற்ற தன்மை 80% ஆக இருக்கும். இரண்டு வட்டங்கள் ஒட்டும் பகுதியில், நிறங்கள் கலந்துபோன effect தோன்றும்.

## மங்கல்

SwiftUI-இல், `blur` பயன்படுத்தி மங்கல் effect அமைக்கலாம்:

```swift
.blur(radius:10)
```

`radius` என்பது மங்கலின் பரப்பளவை வரையறுக்கிறது. அதன் மதிப்பு அதிகமாக இருக்கும் போது, மங்கல் விளைவு இன்னும் தெளிவாகத் தெரியும்.

இரண்டு வட்டங்களுக்கும் blur effect சேர்க்கலாம்:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

இறுதியில், மிகவும் மங்கலாகத் தோன்றும் இரண்டு வட்டங்களைப் பார்க்கலாம்.

## சுருக்கம்

இந்தப் பாடம் SwiftUI-யில் பொதுவாகப் பயன்படும் visual modifier-களை மையமாகக் கொண்டது. Modifier-கள் மூலம் view-இன் நிறம், இடம், visual effect ஆகியவற்றை எவ்வாறு கட்டுப்படுத்துவது என்பதை கற்றோம்.

குறிப்பிட்ட உதாரணங்கள் மூலம், பல்வேறு visual modifier-கள் interface-இல் எப்படி செயல்படுகின்றன என்பதைப் பார்த்தோம். அதோடு, safe area பற்றிய அறிவும் அறிந்தோம்.

இவை எல்லாம் மிகவும் அடிப்படையான modifier-கள். அவற்றை அடிக்கடி பயிற்சி செய்து பயன்படுத்துவதன் மூலம், நடைமுறை அபிவிருத்தியில் interface effect-களை இன்னும் தெளிவாகக் கட்டுப்படுத்த முடியும்.

### பாடத்திற்குப் பிந்தைய பயிற்சி

* ஒரு படத்திற்கு transparency மற்றும் blur effect சேர்க்கவும்
* மூன்று வட்டங்களை, மூன்று வேறு opacity மதிப்புகளுடன் ஒன்றின் மேல் ஒன்று அடுக்கவும்
* முழு திரையையும் மூடும் ஒரு background image உருவாக்கி, safe area-ஐ புறக்கணிக்கவும்
* பல view-களின் இடங்களை `offset` கொண்டு மாற்றிப் பார்க்கவும்

இந்தப் பயிற்சிகளின் நோக்கம் API-ஐ மனப்பாடம் செய்வது அல்ல; மாறாக, visual மாற்றங்களுக்கும் layout நடத்தைக்கும் இடையிலான உறவை கவனிப்பதே.
