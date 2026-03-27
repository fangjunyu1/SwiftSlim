# தனிப்பட்ட சுயவிவரப் பக்கத்தை உருவாக்குதல்

இந்தப் பாடத்தில், நாம் ஒரு எளிய தனிப்பட்ட சுயவிவர view-ஐ உருவாக்கப் போகிறோம். அதே நேரத்தில், கீழ்கண்ட அறிவுகளையும் கற்கப் போகிறோம்:

* cornerRadius
* spacing
* ScrollView

இந்த உருவாக்கும் செயல்முறையில், layout, Text, Image போன்ற முன்னர் கற்றவற்றை மீண்டும் பயிற்சி செய்வோம். அதோடு, இடைவெளி கட்டுப்பாடு மற்றும் உள்ளடக்க scrolling விளைவையும் செயல்படுத்துவோம்.

## தனிப்பட்ட சுயவிவரம்

இலக்கு தோற்றம்:

![Swift](../../RESOURCE/004_img.png)

**கீழே உள்ள விளக்கத்தைப் படிப்பதற்கு முன், முதலில் நீங்களே சுயமாக செய்து பார்க்கவும்.**

### திட்டத்தை உருவாக்குதல்

ஒரு புதிய iOS திட்டத்தை உருவாக்கலாம், அல்லது முன்பு உருவாக்கிய திட்டத்தையே தொடர்ந்து பயன்படுத்தலாம்.

இயல்புநிலை ContentView குறியீடு:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

இப்போது உள்ள குறியீட்டை நீக்கி, நம்முடைய சொந்த உள்ளடக்கத்தை எழுதத் தொடங்கலாம்:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### மொத்த அமைப்பு

நடைமுறை அபிவிருத்தியில், நாம் பொதுவாக முதலில் மொத்த கட்டமைப்பை வடிவமைப்போம்.

நமது பக்கத்தில் உள்ளவை:

1. தலைப்பு
2. தனிப்பட்ட தகவல்
3. தனிப்பட்ட அறிமுகம்

அதனால், வெளியேயுள்ள அடுக்காக ஒரு `VStack` சேர்க்கலாம்:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` view-கள் செங்குத்தாக வரிசைப்படுத்தப்படுவதை உறுதி செய்கிறது; மேலும், view-களின் ஒழுங்கையும் இடைவெளியையும் கட்டுப்படுத்த உதவுகிறது.

### தலைப்பு

முதலில், தலைப்பைக் காட்ட ஒரு `Text` உருவாக்குவோம்.

இங்கே, நான் தலைப்பாக எனது ஆங்கிலப் பெயரை பயன்படுத்துகிறேன்:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

தலைப்பு பொதுவாக பெரிதாகவும் bold-ஆகவும் இருக்கும். அதனால், இங்கே `font` மற்றும் `fontWeight` modifier-களைப் பயன்படுத்துகிறோம்:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### அமைப்பியல்

SwiftUI-யின் இயல்புநிலை alignment `center` ஆகும். அதனால், தற்போது தலைப்பு ContentView-இன் மையத்தில் காட்டப்படுகிறது.

![Swift](../../RESOURCE/004_img3.png)

நாம் தலைப்பை view-இன் மேல்பகுதியில் காட்ட வேண்டும். இதற்காக layout-ஐ மாற்ற `Spacer` பயன்படுத்தலாம்:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` மீதமுள்ள இடத்தைப் பிடித்து, `Text`-ஐ container-இன் மேல்புறம் நோக்கி தள்ளும்.

![Swift](../../RESOURCE/004_img4.png)

### காலி இடம்

உரை view-இன் மேல்பகுதிக்குக் மிகவும் நெருக்கமாக இருக்கிறது என்று நினைத்தால், `padding` அல்லது `Spacer` பயன்படுத்தலாம்.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

இது `VStack`-க்கு மேல் பக்க `padding`-ஐ 20 ஆக அமைக்கிறது.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

அல்லது `Spacer`-ஐப் பயன்படுத்தி, `frame` உயரத்தை அமைத்து, ஒரு குறிப்பிட்ட அளவிலான காலி இடத்தைப் பெறலாம்.

விளைவு:

![Swift](../../RESOURCE/004_img5.png)

### படம்

இப்போது, நம்முடைய ஒரு portrait புகைப்படத்தைத் தயாரித்து, அதை `Assets` resource folder-க்குள் சேர்க்கிறோம்.

![Swift](../../RESOURCE/004_img6.png)

அதன்பிறகு, ContentView-இல் `Image` பயன்படுத்தி படத்தை காட்டலாம்:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

படத்தின் அசல் அளவு பெரியதாக இருப்பதால், அதை காட்டும் அளவை கட்டுப்படுத்த `frame` பயன்படுத்த வேண்டும்.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

இப்போது நாம் ஒரு பிரச்சினையை காணலாம்:

`frame`-இன் அகலம்-உயரம் விகிதம், படத்தின் அசல் விகிதத்துடன் பொருந்தவில்லை என்றால், படம் விலகிய வடிவமாக மாறிவிடும்.

உதாரணமாக:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

படம் விலகாமல் இருக்க, `scaledToFit` பயன்படுத்த வேண்டும்:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit`-இன் பணி என்னவென்றால்:

கொடுக்கப்பட்ட `frame` வரம்புக்குள், படத்தின் அசல் விகிதத்தைப் பாதுகாத்தபடி, அதை அளவுமாற்றம் செய்து முழுமையாகக் காட்டுவது.

இது, படத்தை முழு `frame`-ஐ நிரப்புமாறு இழுக்காது. அதற்கு பதிலாக, அகலம்-உயரம் விகிதம் மாறாமல், சம அளவாக அளவுமாற்றம் செய்யும். ஒரு பக்கம் எல்லையைத் தொடும் வரை அளவு மாற்றப்படும்.

அதாவது:

* `frame`-இன் அகலம் சிறியதாக இருந்தால், படம் அகலத்தை அடிப்படையாகக் கொண்டு அளவுமாற்றம் செய்யப்படும்.
* `frame`-இன் உயரம் சிறியதாக இருந்தால், படம் உயரத்தை அடிப்படையாகக் கொண்டு அளவுமாற்றம் செய்யப்படும்.
* படம் எப்போதும் அதன் அசல் விகிதத்தைப் பாதுகாக்கும்; விலகாது.

பொதுவாக, ஒரு திசைக்கான அளவை மட்டும் அமைத்தாலும் போதும். உதாரணமாக:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

இவ்வாறு, அகலம் 140 என்பதை அடிப்படையாகக் கொண்டு, கணினி தானாகவே பொருத்தமான உயரத்தை கணக்கிடும்; அதே நேரத்தில் படத்தின் விகிதமும் பாதுகாக்கப்படும்.

சில நேரங்களில், காட்சி விகிதத்தைத் தெளிவாக நிர்ணயிக்கவோ, அல்லது சிக்கலான layout-இல் படம் சுருங்காமல் இருக்கவோ, அகலமும் உயரமும் இரண்டையும் கட்டுப்படுத்தலாம்.

### வளையமுள்ள மூலைகள்

படம் rounded corner வடிவில் காட்டப்பட வேண்டும் என்றால், `cornerRadius` modifier பயன்படுத்தலாம்:

```swift
.cornerRadius(10)
```

உதாரணமாக:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

`Image`-இன் modifier-களின் பின் `cornerRadius(20)` சேர்க்கப்படுகிறது.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` என்பது view-இன் எல்லைகளை crop செய்து, 20 radius கொண்ட rounded corners-ஐப் பயன்படுத்துவது என்று பொருள்.

Rounded corner சேர்த்த பிறகு, படத்தின் நான்கு மூலைகளும் வளைந்த வடிவமாக மாறும். இதனால் காட்சி இன்னும் மென்மையாகவும் நவீனமாகவும் தோன்றும்.

இந்த வடிவமைப்பு நடைமுறை, தற்போதைய interface design-இல் மிகவும் பொதுவானது. உதாரணமாக, iOS App icon-களும் rounded rectangle வடிவில் காணப்படும். ஆனால், system icon-கள் சாதாரண rounded corner அல்ல; continuous curvature கொண்ட superellipse வடிவைப் பயன்படுத்துகின்றன.

### தனிப்பட்ட தகவல்

இப்போது, படத்தின் இடப்புறத்தில் இருக்கும் தனிப்பட்ட தகவல் பகுதியை உருவாக்கலாம். Interface அமைப்பைப் பார்த்தால், தகவலும் படமும் கிடைமட்டமாக வரிசைப்படுத்தப்பட்டுள்ளன. அதனால், `HStack` தேவைப்படுகிறது.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

தனிப்பட்ட தகவல் உள்ளடக்கம் செங்குத்தாக வரிசைப்படுத்தப்பட்டுள்ளது.

![Swift](../../RESOURCE/004_img11.png)

அதனால், வெளிப்புறமாக `HStack`, தனிப்பட்ட தகவலுக்கு `VStack`, உரைக்கு `Text` பயன்படுத்தலாம்.

அடிப்படை அமைப்பு:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**புலத் தலைப்புகளை bold ஆக்குதல்**

Field name மற்றும் field value இரண்டையும் வேறுபடுத்திக் காட்ட, field name-க்கு `fontWeight` பயன்படுத்தலாம்:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**உரையை இடப்புறமாக align செய்தல்**

`VStack` இயல்பாக center alignment-இல் இருக்கும். எல்லா உரைகளையும் இடப்புறமாகச் சீரமைக்க வேண்டுமெனில், alignment அமைக்க வேண்டும்:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` என்பது இடப்புற alignment-ஐ குறிக்கிறது; இது left-to-right மொழி சூழலில் இடப்புறம் ஆகும்.

![Swift](../../RESOURCE/004_img14.png)

### இடைவெளி

தனிப்பட்ட தகவலும் படமும் இடையில் ஒரு நிலையான இடைவெளி வேண்டும் என்றால், முன்பு கற்றபடி `Spacer` பயன்படுத்தலாம்:

```swift
Spacer()
    .frame(width: 10)
```

அல்லது, `HStack`-இன் `spacing` parameter-ஐப் பயன்படுத்தலாம்:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` என்பது இரண்டு child view-களுக்கு இடையிலான இடைவெளி 30 pt என்பதைக் குறிக்கிறது.

![Swift](../../RESOURCE/004_img15.png)

**spacing என்பது என்ன?**

`VStack`, `HStack`, `ZStack` ஆகியவற்றில், `spacing` child view-களுக்கு இடையிலான தூரத்தை கட்டுப்படுத்துகிறது.

உதாரணமாக:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

இந்த `VStack`-இல் child view-களுக்கு இடையிலான இடைவெளி 10 pt ஆகும்.

![Swift](../../RESOURCE/004_img16.png)

கவனிக்க வேண்டியது, `spacing` என்பது “நேரடி child view”-களுக்கு மட்டும் பொருந்தும்; nested container-களின் உள்ளமைப்பை இது பாதிக்காது.

**பட்டியலின் உள் இடைவெளியை கட்டுப்படுத்துதல்**

Field-களுக்கு இடையில் இடைவெளி சேர்க்க வேண்டுமெனில், மிகவும் நேரடியான முறை `VStack`-இல் `spacing` அமைப்பது:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

இப்போது, எல்லா child view-களுக்குமிடையில் 10 pt இடைவெளி இருக்கும்.

ஆனால் interface-ஐ கவனித்தால், ஒரு பிரச்சினை தெரியும்:

Field group-களுக்கிடையே இடைவெளி உள்ளது; அதே நேரத்தில் field name மற்றும் field value இடையிலும் அதே இடைவெளி உருவாகிறது.

ஏனெனில், `spacing` தற்போதைய container-இன் அனைத்து நேரடி child view-களுக்கும் பொருந்துகிறது.

இந்த அமைப்பில், ஒவ்வொரு `Text`-மும் வெளிப்புற `VStack`-இன் நேரடி child view ஆகும். அதனால், எல்லாவற்றுக்கும் ஒரே மாதிரியான இடைவெளி கொடுக்கப்படுகிறது.

Field group-களுக்கு இடையே இடைவெளி இருக்க வேண்டும்; ஆனால் field name மற்றும் field value இடையில் இயல்பான நெருக்கமான இடைவெளியே போதுமானது என்றால், “field name + field value” என்ற ஜோடியை ஒரு logical group ஆகக் கருதி, வெளியே ஒரு `VStack` கொண்டு சுற்றலாம்:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

இப்போது, வெளிப்புற `VStack`-களுக்கிடையே இடைவெளி இருக்கும்; உள்புற `VStack`-களுக்குள் default compact spacing இருக்கும். அதனால், field name மற்றும் field value இடையில் தேவையற்ற கூடுதல் இடைவெளி இருக்காது.

![Swift](../../RESOURCE/004_img18.png)

### தனிப்பட்ட அறிமுகம்

அடுத்து, தனிப்பட்ட அறிமுகப் பகுதியை உருவாக்கலாம்.

Interface அமைப்பைப் பார்த்தால், அறிமுக உள்ளடக்கம் பல வரி உரைகளால் ஆனது. அவை செங்குத்தாக வரிசைப்படுத்தப்பட்டுள்ளன.

![Swift](../../RESOURCE/004_img19.png)

அதனால், `VStack` மற்றும் `Text` சேர்த்து பயன்படுத்தலாம்:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**இடைவெளி அதிகரித்தல்**

இப்போது தனிப்பட்ட தகவலும் தனிப்பட்ட அறிமுகப் பகுதியும் ஒன்றுக்கொன்று மிகவும் நெருக்கமாக உள்ளன. அதனால், காட்சி அழகாகத் தெரியவில்லை.

![Swift](../../RESOURCE/004_img20.png)

ஏனெனில் அவை இரண்டும் ஒரே வெளிப்புற container-க்குள் உள்ளன. அதனால், அந்த வெளிப்புற container-இல் மொத்த spacing-ஐ கட்டுப்படுத்தலாம்:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

விளைவு:

![Swift](../../RESOURCE/004_img21.png)

**பட்டியல் இடைவெளி**

தனிப்பட்ட அறிமுக உரைகளுக்கிடையே இடைவெளி அமைக்க `spacing` பயன்படுத்தலாம்:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### தனிப்பட்ட சுயவிவரத்தை முடித்தல்

இப்போது, நம்முடைய தனிப்பட்ட சுயவிவரத்தின் அடிப்படை அமைப்பு முடிந்துவிட்டது.

![Swift](../../RESOURCE/004_img.png)

### Scroll view

இப்போது பக்க அமைப்பு `VStack` பயன்படுத்தி உருவாக்கப்பட்டுள்ளது. அறிமுக உரைகள் குறைவாக இருந்தால் பிரச்சினையில்லை. ஆனால் அது 20, 30 அல்லது அதற்கு மேலான வரிகளாக அதிகரித்தால், உள்ளடக்க உயரம் திரை உயரத்தை மீறிவிடும்.

உதாரணமாக:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

அப்போது இரண்டு விஷயங்கள் நடக்கும்:

* கீழேயுள்ள உள்ளடக்கம் துண்டிக்கப்பட்டுவிடும்
* பக்கம் scroll செய்ய முடியாது

இது `VStack`-இன் பிரச்சினை அல்ல. `VStack` என்பது ஒரு layout container மட்டுமே; இது தானாக scrolling திறனை வழங்காது.

**ScrollView என்பது என்ன**

`ScrollView` என்பது scroll செய்யக்கூடிய ஒரு container ஆகும். திரை அளவை மீறும் அதிகமான உள்ளடக்கங்களுக்கு இது பொருத்தமானது. உதாரணமாக, செங்குத்து அல்லது கிடைமட்ட பட்டியல்கள்.

அடிப்படை அமைப்பு:

```swift
ScrollView {
    ...
}
```

Scrolling effect வேண்டும் என்றால், முழு page உள்ளடக்கத்தையும் `ScrollView`-க்குள் சுற்றி வைக்க வேண்டும்:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

இவ்வாறு செய்தால், முழுப் பக்கமும் scroll செய்யக்கூடிய ஒரு பகுதியாய் மாறும். உள்ளடக்கம் திரை உயரத்தை மீறும்போது, அது இயல்பாக scroll ஆகும்.

இயல்பாக `ScrollView` scroll bar indicator-ஐக் காட்டும். அதை மறைக்க வேண்டுமெனில்:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## முழு குறியீடு

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
