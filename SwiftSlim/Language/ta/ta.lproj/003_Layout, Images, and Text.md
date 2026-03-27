# அமைப்பு, படம் மற்றும் உரை

முந்தைய பாடத்தில், நாம் ContentView குறியீட்டை கற்றோம்:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

இந்தப் பாடத்தில், SwiftUI-யின் இயல்புநிலை layout செயல்முறை, மேலும் படம் மற்றும் உரையை எவ்வாறு பயன்படுத்துவது என்பதைப் பார்க்கப் போகிறோம். முந்தைய பாடத்தின் அடிப்படையில், view-களின் அமைப்பையும் அவை எவ்வாறு காட்சியளிக்கப்படுகின்றன என்பதையும் மேலும் நன்றாகப் புரிந்துகொள்வோம். இந்த அறிவு, அடிப்படை interface layout-களை உருவாக்க உதவும்.

## SwiftUI-யின் இயல்புநிலை layout செயல்முறை

ContentView-ஐ preview செய்யும் போது, icon மற்றும் உரை மேலிருந்து தொடங்காமல், மையத்தில் காட்டப்படுவதை கவனிப்போம்.

![Swift](../../RESOURCE/003_view.png)

இயல்பாக, Stack container-இன் alignment முறை `.center` ஆக இருக்கும். அதனால் child view-கள் பொதுவாக மையப்படுத்தப்பட்டபடி தோன்றும்.

### Alignment சீரமைப்பு முறை

மையச் சீரமைப்பு என்பது alignment முறைகளில் ஒன்றே. நாம் இடப்புறச் சீரமைப்போ அல்லது வலப்புறச் சீரமைப்போ விரும்பினால், `alignment`-ஐப் பயன்படுத்தி view-இன் சீரமைப்பை கட்டுப்படுத்த வேண்டும்.

```swift
alignment
```

SwiftUI-யில், alignment பொதுவாக இரண்டு நிலைகளில் வரும்:

**1. Stack container-இன் alignment parameter**

உதாரணமாக, ContentView-இல் உள்ள icon மற்றும் உரையை இடப்புறமாகச் சீரமைப்பது:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack`-இன் `alignment`, கிடைமட்ட திசையில் சீரமைப்பை கட்டுப்படுத்துகிறது.

சீரமைப்பு வகைகள்:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` என்பது கிடைமட்ட வரிசைப்படுத்தல்; இதில் `alignment`, செங்குத்து திசையில் சீரமைப்பை கட்டுப்படுத்துகிறது:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` என்பது அடுக்கி வரிசைப்படுத்தும் layout; இதில் `alignment` மூலம் கிடைமட்டத்தையோ செங்குத்தையோ கட்டுப்படுத்தலாம்:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

`alignment`-ஐத் தெளிவாகக் குறிப்பிடவில்லை என்றால், `VStack`, `HStack`, `ZStack` மூன்றிலும் இயல்புநிலை மதிப்பு `.center` ஆகும்.

**2. frame-க்குள் உள்ள alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

`frame` வழங்கும் அளவு, view-இன் சொந்த அளவை விட பெரியதாக இருந்தால், அந்த `frame`-க்குள் view எங்கு இருக்கும் என்பதை `alignment` தீர்மானிக்கிறது. `frame`-இன் விரிவான பயன்பாட்டை அடுத்த பாடங்களில் பார்க்கப் போகிறோம்; இங்கே இதை ஒரு ஆரம்பநிலை அறிமுகமாக மட்டும் அறிந்திருக்கலாம்.

### Spacer மற்றும் இடவசதி பகிர்வு முறை

`alignment` மூலம் view-களை கிடைமட்டமாகவோ செங்குத்தாகவோ வரிசைப்படுத்திக் காட்டலாம். ஆனால், நாம் உரையும் படமும் இரு முனைகளில் தோன்ற வேண்டும் என்று நினைத்தால், alignment மட்டும் போதுமானதாக இருக்காது.

உதாரணமாக, [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) இணையதளத்தின் மேல் பகுதியில், இடப்புறத்தில் NHK சின்னமும் வலப்புறத்தில் menu icon-மும் உள்ள ஒரு view-ஐ உருவாக்க வேண்டும் என்று கொள்ளலாம்.

![Swift](../../RESOURCE/003_alignment3.png)

நாம் `alignment` மட்டும் பயன்படுத்தினால், NHK சின்னமும் menu icon-மும் ஒரே புறத்தில் மட்டும் காட்சியளிக்கும். இரண்டு icon-களையும் இடது-வலது பக்கங்களில் பிரித்து வைக்க முடியாது. அதனால், மீதமுள்ள இடத்தைப் பகிர்வதற்கு `Spacer` தேவைப்படுகிறது.

`Spacer` என்பது layout-க்காகப் பயன்படும் ஒரு நெகிழ்வான view; இது தானாகவே மீதமுள்ள இடத்தை நிரப்பும்.

பயன்பாடு:

```swift
Spacer()
```

உதாரணமாக:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

`Image` மற்றும் `Text` இடையே `Spacer` சேர்த்தால், அது மீதமுள்ள இடத்தை நிரப்பி, `Image`-ஐ மேல்புறத்துக்கும் `Text`-ஐ கீழ்புறத்துக்கும் தள்ளும்.

![Swift](../../RESOURCE/003_view1.png)

பல `Spacer`-கள் இருந்தால்:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

மீதமுள்ள இடம், எல்லா `Spacer`-களுக்கும் சமமாகப் பகிரப்படும்.

![Swift](../../RESOURCE/003_spacer.png)

## Image-இன் காட்சி மற்றும் அளவு கட்டுப்பாடு

`Image` view முக்கியமாக படங்களை காட்டப் பயன்படுகிறது. முந்தைய பாடத்தில் கற்ற SF Symbols icon-கள், `Image`-இன் ஒரு பயன்பாடு மட்டுமே.

பயன்பாடு:

```swift
Image("imageName")
```

`Image`-இன் இரட்டை குறியீட்டு குறிக்குள் உள்ளவை, படத்தின் பெயர். இதில் file extension எழுத வேண்டியதில்லை.

### படம் காட்டுதல்

முதலில், ஒரு படத்தைத் தயாரிப்போம்.

![Swift](../../RESOURCE/003_img.jpg)

Xcode-இல் `Assets` resource folder-ஐத் தேர்வு செய்து, படத்தை அதற்குள் drag செய்து விடவும்.

![Swift](../../RESOURCE/003_img1.png)

பிறகு, ContentView-இல் `Image` பயன்படுத்தி படத்தை காட்டலாம்:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

கவனம்: SwiftUI-யின் `Image`, GIF animation-ஐ இயக்க ஆதரிக்காது; அது static frame-ஐ மட்டும் காட்டும்.

### படத்தின் அளவை கட்டுப்படுத்துதல்

SwiftUI-யில், `Image` இயல்பாக அதன் அசல் அளவிலேயே காட்டப்படும். நாம் அதன் காட்சி அளவை மாற்ற விரும்பினால், முதலில் `resizable` பயன்படுத்தி படத்தை மாற்றக்கூடியதாக மாற்ற வேண்டும்; அதன் பிறகு `frame` பயன்படுத்தி layout அளவை நிர்ணயிக்க வேண்டும்.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier

`resizable` modifier, layout-இல் படம் அளவு மாறக்கூடியதாக இருக்க அனுமதிக்கிறது; அசல் அளவை நிலையாகப் பயன்படுத்தாது.

```swift
.resizable()
```

`resizable()` சேர்க்கப்பட்டால்தான், `frame` உண்மையில் படத்தின் காட்சி அளவை மாற்றும்.

`resizable` இல்லாமல்:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

இங்கே `frame`, படத்திற்கான layout இடத்தை மட்டும் வழங்கும்; படம் தானாகச் சுருங்கவோ பெருகவோ செய்யாது.

### frame modifier

`frame(width:height)` என்பது view-இன் அகலத்தையும் உயரத்தையும் நிர்ணயிக்கப் பயன்படுகிறது.

அடிப்படை பயன்பாடு:

```swift
.frame(width: 10,height: 10)
```

உதாரணமாக, ஒரு படத்தை அகலம் 300, உயரம் 100 கொண்ட செவ்வகமாக அமைப்பது:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

அல்லது, அகலமோ உயரமோ ஒன்றை மட்டும் அமைக்கலாம்:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` சேர்ந்து பயன்படுத்தப்பட்டால், interface-இல் படத்தின் காட்சி அளவை நெகிழ்வாக கட்டுப்படுத்த முடியும்; அதே நேரத்தில் படத்தின் resize செய்யும் திறனும் பாதுகாக்கப்படும்.

### அளவுத்தொகை: scaledToFit மற்றும் scaledToFill

`frame` மூலம் கொடுக்கப்படும் அகலம்-உயரம் விகிதம், படத்தின் அசல் விகிதத்துடன் பொருந்தாமல் இருந்தால், படம் இழுக்கப்பட்டு விலகிய வடிவமாக மாறலாம்.

படத்தின் விகிதத்தைப் பாதுகாத்தபடி, கிடைக்கக்கூடிய layout இடத்தில் அதை பொருத்த வேண்டுமெனில் `scaledToFit` அல்லது `scaledToFill` பயன்படுத்தலாம்.

**scaledToFit**

`scaledToFit`, படத்தின் அசல் அகலம்-உயரம் விகிதத்தைப் பாதுகாத்தபடி, அது முழுமையாக கிடைக்கக்கூடிய இடத்துக்குள் பொருந்தும் வரை அளவை மாற்றும்; படம் வெட்டப்படாது:

```swift
.scaledToFit()
```

அல்லது

```swift
.aspectRatio(contentMode: .fit)
```

முழு படத்தையும் காட்ட வேண்டும்; மாற்றிய வடிவமாகத் தோன்றக் கூடாது என்ற சூழல்களுக்கு இது பொருத்தமானது.

ஒவ்வொரு படத்துக்கும் ஒரே அகலமும் உயரமும் அமைத்தால், படங்கள் இழுக்கப்பட்டு காணப்படும் நிலை தவிர்க்க முடியாது.

உதாரணமாக:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

இங்கே scaling mode அமைக்கப்படாததால், படம் அதன் அசல் விகிதத்தில் காட்டப்படாது.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` அமைத்தால், படம் அதன் அசல் விகிதத்தைப் பாதுகாத்து காட்டப்படும்.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill`-உம் படத்தின் விகிதத்தைப் பாதுகாக்கும். ஆனால் இது கிடைக்கக்கூடிய இடத்தை முழுவதும் நிரப்பும். விகிதம் பொருந்தவில்லை என்றால், கூடுதலாக இருக்கும் பகுதி வெட்டப்படும்:

```swift
.scaledToFill()
```

அல்லது

```swift
.aspectRatio(contentMode: .fill)
```

இது படம் முழுப் பகுதியையும் மூட வேண்டிய சூழல்களுக்கு ஏற்றது. உதாரணமாக background image அல்லது banner. குறிப்பாக background ஆகப் பயன்படுத்தும் படங்களுக்கு இது மிகவும் பொருத்தமானது.

**இரண்டிற்கும் உள்ள வேறுபாடு**

![Swift](../../RESOURCE/003_img6.png)

## உரை

SwiftUI-யில், `Text` உரையை காட்டப் பயன்படுகிறது.

அடிப்படை பயன்பாடு:

```swift
Text("FangJunyu")
```

முந்தைய பாடத்தில் `Text`-ஐ அறிந்தோம். இந்தப் பாடத்தில், எழுத்தளவையும் எழுத்தின் தடிமனையும் எவ்வாறு கட்டுப்படுத்துவது என்பதை மேலும் கற்கப் போகிறோம்; இதனால் view-இல் உரை மேலும் வெளிப்படையாகத் தோன்றும்.

### எழுத்தளவு

`font` modifier பயன்படுத்தி எழுத்தளவை கட்டுப்படுத்தலாம்:

```swift
.font(.title)
```

உதாரணமாக:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

பொதுவாகப் பயன்படுத்தப்படும் எழுத்தளவுகள் (பெரியது முதல் சிறியது வரை):

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### எழுத்தின் தடிமன்

உரையை bold ஆக மாற்ற வேண்டுமெனில், `fontWeight` modifier பயன்படுத்தலாம்:

```swift
.fontWeight(.bold)
```

உதாரணமாக:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

பொதுவாகப் பயன்படுத்தப்படும் எழுத்துத் தடிமன்கள் (மெல்லியது முதல் தடிமனானது வரை):

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` எழுத்தளவை கட்டுப்படுத்துகிறது; `fontWeight` எழுத்தின் தடிமனைக் கட்டுப்படுத்துகிறது. இவை இரண்டையும் சேர்த்து பயன்படுத்தி, உரையின் வெளிப்பாட்டை மேம்படுத்தலாம்.

## சுருக்கம் மற்றும் பயிற்சி

இதுவரை, SwiftUI-யின் இயல்புநிலை layout, `Spacer`, `Image`, `Text` போன்ற அடிப்படை விஷயங்களை கற்றுள்ளோம். இவை சில எளிய view-களை உருவாக்குவதற்கு ஏற்கனவே போதுமானவை.

உதாரணமாக: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google interface மிகவும் சுத்தமாக உள்ளது. அதில் படம் மற்றும் உரை இரண்டும் உள்ளன. SwiftUI கோணத்தில் அதன் அமைப்பைப் பகுத்து பார்க்கலாம்:

1. முழு interface-ஐ மூன்று பகுதிகளாகப் பிரிக்கலாம்: Google logo, search box, மற்றும் குறிப்புரை உரை. இவற்றை `VStack` பயன்படுத்தி செங்குத்தாக ஒழுங்குபடுத்தலாம்.
2. Google logo ஒரு படம்; அதைக் காட்ட `Image` பயன்படுத்தலாம்.
3. Search box-இல் input field மற்றும் icon இரண்டும் உள்ளன. input field-ஐ இப்போது புறக்கணித்தால், search icon-ஐ `Image` மூலம் காட்டலாம்.
4. குறிப்புரை உரையை `Text` மூலம் காட்டலாம்; உரையின் கிடைமட்ட வரிசைப்படுத்தலுக்கு `HStack` பயன்படுத்தலாம்; எழுத்து நிறத்தை `foregroundStyle` மூலம் கட்டுப்படுத்தலாம்.

இந்த அறிவுகளைப் பயன்படுத்தி பயிற்சி செய்தால், சில எளிய view-களை உருவாக்க முடியும். அதே நேரத்தில், `Image` மற்றும் `Text` view-களையும் அவற்றின் modifier-களையும் ஆழமாகப் புரிந்துகொள்ளவும் பயன்படுத்தவும் இது உதவும்.
