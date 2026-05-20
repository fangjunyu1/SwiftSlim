# புகைப்படச் சுவர்

இந்தப் பாடத்தில், நாம் ஒரு புகைப்படச் சுவர் பக்கத்தை உருவாக்கப் போகிறோம்.

![காட்சி](../../../Resource/032_view13.png)

இந்த எடுத்துக்காட்டில், `extension`, `self` மற்றும் instance பற்றிய அறிவை மீண்டும் பார்க்கிறோம். மேலும் SwiftUI-இல் பொதுவாகப் பயன்படுத்தப்படும் `Shape` வடிவங்களையும் கற்றுக்கொள்கிறோம்.

இந்த அறிவைப் பயன்படுத்தி, சாதாரணப் படங்களை வட்டம், வட்ட மூலை கொண்ட செவ்வகம், காப்ஸ்யூல் வடிவம், நீள்வட்டம் போன்ற பல்வேறு பாணிகளில் வெட்டிக் காட்டலாம். மேலும் புகைப்படங்களுக்கு border விளைவையும் சேர்க்கலாம்.

இந்தப் பாடத்தில் சில புதிய அறிவுப் புள்ளிகள் பயன்படுத்தப்படும்: `Shape`, `clipShape`, `strokeBorder` மற்றும் `overlay`.

இதில், `clipShape` view-இன் வடிவத்தை வெட்டுவதற்கு பயன்படும். `strokeBorder` வடிவத்தின் border-ஐ வரைவதற்கு பயன்படும். `overlay` view-இன் மேல் புதிய view-ஐ அடுக்கிப் போடுவதற்கு பயன்படும்.

## பட வளங்கள்

தொடங்குவதற்கு முன், சில படங்களைத் தயாரிக்க வேண்டும்.

நீங்கள் உங்கள் சொந்த புகைப்படங்களைப் பயன்படுத்தலாம். இந்தப் பாடத்தில் வழங்கப்பட்டுள்ள மாதிரி படங்களையும் பயன்படுத்தலாம்.

இந்தப் பாடத்தின் புகைப்பட எடுத்துக்காட்டுகள் [Pixabay](https://pixabay.com/) இணையதளத்திலிருந்து எடுக்கப்பட்டவை:

[இயற்கைக் காட்சி](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [நரி](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [கட்டிடம்](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [மலர்கள்](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [அன்னம்](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

படங்களைப் பதிவிறக்கிய பிறகு, அவற்றை `Assets` resource folder-இல் சேர்த்து, அவற்றை முறையே `1`, `2`, `3`, `4`, `5` என்று பெயரிடுங்கள்.

![வளங்கள்](../../../Resource/032_view17.png)

இதனால் SwiftUI-இல் `Image("1")`, `Image("2")` போன்ற முறையில் படங்களை காட்டலாம்.

## புகைப்படங்களை காட்டுதல்

முதலில், `ContentView`-இல் 5 புகைப்படங்களை காட்டுவோம்:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

காட்சி விளைவு:

![காட்சி](../../../Resource/032_view.png)

இந்தக் code-இல், புகைப்படப் பட்டியல் scroll ஆகக் காட்டப்படுவதற்கு `ScrollView` பயன்படுத்துகிறோம். பல படங்கள் மேலிருந்து கீழாக வரிசையாக அமைவதற்கு `VStack` பயன்படுத்துகிறோம்.

ஒவ்வொரு படத்திற்கும் `.resizable()`, `.scaledToFit()` மற்றும் `.frame(width: 300)` மூலம் படத்தின் காட்சி விளைவை அமைக்கிறோம். இதனால் படம் அளவு மாறலாம், விகிதம் காக்கப்பட்டபடி முழுமையாக காட்டப்படும், மேலும் படத்தின் அகலம் கட்டுப்படுத்தப்படும்.

`VStack` மேல் உள்ள `.padding(.vertical, 100)` மேல்புற மற்றும் கீழ்புற இடைவெளியை அதிகரிக்கிறது. இதனால் முதல் புகைப்படமும் கடைசி புகைப்படமும் திரையின் விளிம்புகளுக்கு மிக அருகில் ஒட்டிப் போகாமல் இருக்கும்.

இறுதியில் உள்ள `.ignoresSafeArea()` scroll view பாதுகாப்புப் பகுதியை புறக்கணிக்கச் செய்கிறது. இதனால் புகைப்படங்கள் scroll ஆகும் போது திரையின் மேல் மற்றும் கீழ் பகுதிகளுக்கு நீள முடியும், பக்கத்தின் காட்சி மேலும் முழுமையாக இருக்கும்.

ஆனால், இப்போது 5 படங்களும் ஒரே modifiers-ஐ பயன்படுத்துகின்றன:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

மீண்டும் மீண்டும் வரும் code-ஐ பார்க்கும்போது, அதை `extension` மூலம் ஒழுங்குபடுத்தலாம்.

## extension பயன்படுத்தி படப் பாணியை ஒழுங்குபடுத்துதல்

`Image`-க்கு புகைப்படச் சுவருக்கான ஒரு சிறப்பு முறையை விரிவாக்கலாம்:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

இங்கே, `Image` type-க்கு `photoGalleryStyle` என்ற method-ஐ விரிவாக்கினோம்.

இந்த method-இன் உள்ளே முன்பு மீண்டும் மீண்டும் பயன்படுத்திய `.resizable()`, `.scaledToFit()` மற்றும் `.frame(width: 300)` உள்ளன. அதாவது, படத்தின் scaling, proportion display மற்றும் width setting ஆகிய code-களை ஒன்றாகச் சேர்த்து ஒழுங்குபடுத்துகிறது.

இந்த extension-ஐ பயன்படுத்திய பிறகு, பழைய பட code:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

இதுபோல் எளிமைப்படுத்தலாம்:

```swift
Image("1")
    .photoGalleryStyle()
```

இதனால் ஒவ்வொரு படமும் `.photoGalleryStyle()`-ஐ மட்டும் அழைத்தால் போதும். அதே புகைப்படச் சுவர் பாணி பயன்படுத்தப்படும். code மேலும் சுருக்கமாக இருக்கும், பின்னர் ஒரே இடத்தில் மாற்றுவதும் எளிதாகும்.

## self-ஐப் புரிந்துகொள்ளுதல்

extension method-இல் நாம் `self` என்று எழுதினோம்:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

இங்குள்ள `self`, இந்த method-ஐ அழைக்கும் தற்போதைய image instance-ஐ குறிக்கிறது.

உதாரணமாக:

```swift
Image("1")
    .photoGalleryStyle()
```

இந்த code-இல், `photoGalleryStyle()`-ஐ `Image("1")` அழைக்கிறது. எனவே method-இன் உள்ளே உள்ள `self` இந்த `Image("1")` படத்தையே குறிக்கிறது.

எளிமையாகப் புரிந்துகொள்ளலாம்: யார் இந்த method-ஐ அழைக்கிறார்களோ, `self` அவரையே குறிக்கும்.

கவனிக்க வேண்டியது என்னவெனில், SwiftUI modifiers தொடர்ந்து புதிய view result-ஐ திருப்பித் தருகின்றன. எனவே `photoGalleryStyle()` திருப்பித் தருவது, திருத்தப்பட்ட ஒரு view. அது அசல் `Image`-ஐ மட்டும் நேரடியாகத் திருப்பித் தருவது அல்ல.

## புகைப்பட வடிவங்கள்

இப்போது, புகைப்படங்கள் சாதாரணமாக காட்டப்படுகின்றன. ஆனால் இந்த புகைப்படங்கள் default-ஆக செவ்வகமாகவே இருக்கும், எனவே தோற்றம் சாதாரணமாகத் தெரிகிறது.

புகைப்படத்திற்கு round corners மட்டும் வேண்டும் என்றால், `.cornerRadius()`-ஐ நேரடியாகப் பயன்படுத்தலாம்:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

காட்சி விளைவு:

![நிறம்](../../../Resource/032_view1.png)

`.cornerRadius(20)` என்பது படத்திற்கு `20 pt` அளவிலான round corners சேர்ப்பதை குறிக்கிறது. சாதாரண round-corner image உருவாக்க இந்த எழுத்துமுறை போதுமானது.

ஆனால், `.cornerRadius()` round corner effect-ஐ மட்டுமே கையாளும். சாதாரண round-corner படங்களை உருவாக்க இது பொருத்தமானது. புகைப்படத்தை மேலும் பல்வேறு வடிவங்களாக மாற்ற வேண்டும் என்றால், இந்த modifier மட்டும் போதாது.

அப்போது SwiftUI-இல் உள்ள `Shape`-ஐ பயன்படுத்த வேண்டும். `Shape` பல்வேறு வடிவங்களை குறிக்க முடியும். அதை `clipShape` உடன் சேர்த்து பயன்படுத்தினால், படத்தை அந்த வடிவத்துக்கேற்ப வெட்டிக் காட்டலாம்.

## Shape அறிமுகம்

SwiftUI-இல் `Shape` என்பது வடிவத்தை குறிக்கிறது. `View` போலவே, இது SwiftUI-இல் மிகவும் பொதுவாகப் பயன்படுத்தப்படும் type ஆகும்.

பொதுவான `Shape`-களில் வட்டம், செவ்வகம், வட்ட மூலை கொண்ட செவ்வகம், காப்ஸ்யூல் வடிவம் மற்றும் நீள்வட்டம் அடங்கும். வெவ்வேறு வடிவங்களின் தோற்றத்தை மேலும் நேரடியாகக் காண, கீழே உள்ள எடுத்துக்காட்டுகளில் ஒவ்வொரு வடிவத்திற்கும் வெவ்வேறு நிறங்களும் அளவுகளும் அமைக்கப்படுகின்றன.

இந்த எடுத்துக்காட்டுகளில், `.fill()` வடிவத்தில் நிறம் நிரப்பப் பயன்படும். `.frame()` வடிவத்தின் காட்சி அளவை அமைக்கப் பயன்படும். நிறம் என்பது வெவ்வேறு வடிவங்களை வேறுபடுத்துவதற்காக மட்டுமே; அது வடிவத்தின் நிரந்தர நிறம் அல்ல.

### Circle வட்டம்

`Circle` வட்டத்தை குறிக்கிறது. இது avatar, வட்ட button, வட்ட image போன்ற interface effects-களில் பொதுவாகப் பயன்படுத்தப்படுகிறது.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![வட்டம்](../../../Resource/032_view3.png)

### Rectangle செவ்வகம்

`Rectangle` செவ்வகத்தை குறிக்கிறது. இது மிகவும் அடிப்படையான வடிவங்களில் ஒன்றாகும். background, பிரிப்பு பகுதி அல்லது சாதாரண border உருவாக்கவும் பயன்படுத்தலாம்.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![செவ்வகம்](../../../Resource/032_view4.png)

### RoundedRectangle வட்ட மூலை கொண்ட செவ்வகம்

`RoundedRectangle` வட்ட மூலை கொண்ட செவ்வகத்தை குறிக்கிறது. `cornerRadius` round corner அளவை அமைக்கப் பயன்படும்.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![செவ்வகம்](../../../Resource/032_view5.png)

### Capsule காப்ஸ்யூல் வடிவம்

`Capsule` காப்ஸ்யூல் வடிவத்தை குறிக்கிறது. இதன் இரு முனைகளும் வளைந்த arc வடிவமாக இருக்கும். இது capsule button, tag background போன்ற interface effects-களில் பொதுவாகப் பயன்படுத்தப்படுகிறது.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![செவ்வகம்](../../../Resource/032_view6.png)

### Ellipse நீள்வட்டம்

`Ellipse` நீள்வட்டத்தை குறிக்கிறது. இது `Circle`-க்கு ஒத்தது. ஆனால் அகலமும் உயரமும் சமமல்லாதபோது, நீள்வட்டமாக காட்டப்படும்.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![செவ்வகம்](../../../Resource/032_view7.png)

இந்த எடுத்துக்காட்டுகள் மூலம், `Shape` தானாகவே ஒரு வடிவமாக நேரடியாகக் காட்ட முடியும் என்பதை பார்க்கலாம். அடுத்து, இந்த `Shape`-களை `clipShape` உடன் சேர்த்து புகைப்படங்களை வெட்டிப் பயன்படுத்துவோம். இதனால் புகைப்படங்கள் வெவ்வேறு வடிவங்களில் காட்டப்படும்.

## clipShape பயன்படுத்தி புகைப்படத்தை வெட்டுதல்

இப்போது, `clipShape`-ஐ பயன்படுத்தி புகைப்படங்களை வெவ்வேறு வடிவங்களாக வெட்டலாம்.

உதாரணமாக, முதல் புகைப்படத்தை வட்டமாக வெட்டுதல்:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

இந்த code-இன் பொருள்: முதலில் ஒரு படத்தை காட்டி, பின்னர் `Circle()` பயன்படுத்தி அதை வட்டமாக வெட்டுகிறது.

![காட்சி](../../../Resource/032_view2.png)

`clipShape`-இன் அடிப்படை எழுத்துமுறை:

```swift
.clipShape(வடிவம்)
```

view-க்குப் பிறகு `.clipShape(...)` சேர்த்து, parentheses உள்ளே வெட்ட வேண்டிய வடிவத்தை எழுத வேண்டும்.

உதாரணமாக:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

இப்போது, 5 புகைப்படங்களையும் வெவ்வேறு வடிவங்களாக வெட்டுவோம்:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

காட்சி விளைவு:

![காட்சி](../../../Resource/032_view8.png)

இதில், `Rectangle()` மூலம் வெட்டிய விளைவு சாதாரண செவ்வக புகைப்படத்துடன் நெருக்கமாக இருக்கும். எனவே காட்சி மாற்றம் தெளிவாகத் தெரியாது. இது முக்கியமாக மற்ற வடிவங்களுடன் ஒப்பிடுவதற்காக பயன்படுத்தப்படுகிறது.

இப்போது புகைப்படங்கள் சாதாரண செவ்வகமாக மட்டும் இல்லாமல், வெவ்வேறு வடிவங்களைக் கொண்டுள்ளன.

## புகைப்பட border சேர்த்தல்

வட்ட புகைப்படத்திற்கு border சேர்க்க விரும்பினால், `border` பயன்படுத்தலாம் என்று நினைக்கலாம்:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

ஆனால், இவ்வாறு பெறுவது பொதுவாக வட்ட border அல்ல. அது ஒரு செவ்வக border ஆகும்.

![காட்சி](../../../Resource/032_view9.png)

ஏனெனில் `border` என்பது view-இன் செவ்வகப் பகுதியை அடிப்படையாகக் கொண்டு border சேர்க்கும். `clipShape` மூலம் வெட்டப்பட்ட பிறகான வடிவத்தை அடிப்படையாகக் கொண்டு border சேர்ப்பதில்லை.

எனவே, வட்ட border வேண்டும் என்றால் `border`-ஐ நேரடியாகப் பயன்படுத்த முடியாது.

## strokeBorder பயன்படுத்தி வடிவ border வரைவது

SwiftUI-இல், `strokeBorder` இந்த பொதுவான `Shape`-களுக்கு உள்ளக border வரைய முடியும்.

உதாரணமாக, ஒரு வட்ட border வரைவது:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

இந்த code-இன் பொருள்: `Circle`-க்கு பழுப்பு நிற border வரையவும், border அகலம் `10 pt` ஆக இருக்கவும் செய்கிறது.

![காட்சி](../../../Resource/032_view12.png)

இங்கே கவனிக்க வேண்டியது: `strokeBorder` புகைப்படத்திற்கு நேரடியாக border சேர்ப்பதில்லை. அது `Circle()` என்ற வடிவத்திற்கே border வரைகிறது.

அதாவது, இந்த code மூலம் கிடைப்பது ஒரு தனித்து நிற்கும் வட்ட border மட்டுமே. அது இன்னும் புகைப்படத்துடன் தொடர்பு கொள்ளவில்லை.

இந்த வட்ட border புகைப்படத்தின் மேல் காட்டப்பட வேண்டும் என்றால், `overlay`-ஐ தொடர்ந்து பயன்படுத்தி border-ஐ புகைப்படத்தின் மேல் அடுக்க வேண்டும்.

## overlay பயன்படுத்தி border அடுக்குதல்

`overlay` என்பது ஒரு view modifier. இது தற்போதைய view-இன் மேல் புதிய view-ஐ அடுக்க முடியும்.

அதன் அடிப்படை அமைப்பை இவ்வாறு புரிந்துகொள்ளலாம்:

```swift
தற்போதைய view
    .overlay {
        அடுக்கப்படும் view
    }
```

இந்த எடுத்துக்காட்டில், தற்போதைய view என்பது ஏற்கனவே வட்டமாக வெட்டப்பட்ட புகைப்படம்:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![காட்சி](../../../Resource/032_view2.png)

அதன் மேல் அடுக்க வேண்டிய புதிய view என்பது ஒரு வட்ட border:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![காட்சி](../../../Resource/032_view12.png)

எனவே, புகைப்படத்தையும் border-ஐயும் இவ்வாறு இணைக்கலாம்:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

இங்குள்ள `overlay`, தற்போதைய view-இன் மேல் ஒரு புதிய view-ஐ அடுக்குவதை குறிக்கிறது.

`overlay`-இல், border தற்போதைய புகைப்படத்தின் காட்சி வரம்பைப் பின்பற்றி அடுக்கப்படும். எனவே தனியாக `frame` அமைக்கத் தேவையில்லை. border வடிவமும் clipping வடிவமும் ஒன்றாக இருந்தால், border புகைப்படத்துடன் சரியாக ஒட்டிப் பொருந்தும்.

![காட்சி](../../../Resource/032_view10.png)

இறுதி விளைவு: வட்ட புகைப்படத்தின் மேல் ஒரு வட்ட border மூடப்பட்டுள்ளது.

`ZStack`-ஐ ஒப்பிடும்போது, `overlay` இவ்வகையான “தற்போதைய view-க்கு அலங்காரம் சேர்ப்பது” போன்ற சூழல்களுக்கு மிகவும் பொருத்தமானது. புகைப்படமே முக்கிய பொருள்; border என்பது கூடுதல் விளைவு மட்டுமே. எனவே `overlay` பயன்படுத்துவது மேலும் தெளிவாக இருக்கும்.

## புகைப்படச் சுவரை முடித்தல்

இப்போது, ஒவ்வொரு புகைப்படத்திற்கும் அதற்கேற்ற வடிவமும் border-ஐயும் சேர்ப்போம்:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

காட்சி விளைவு:

![காட்சி](../../../Resource/032_view13.png)

இதனால், ஒரு அடிப்படை புகைப்படச் சுவர் பக்கம் முடிந்தது.

இந்தப் பக்கத்தில், scroll display-ஐ உருவாக்க `ScrollView` பயன்படுத்தினோம். புகைப்படங்களை காட்ட `Image` பயன்படுத்தினோம். புகைப்பட வடிவங்களை வெட்ட `clipShape` பயன்படுத்தினோம். மேலும் `overlay` மற்றும் `strokeBorder` மூலம் border சேர்த்தோம்.

## முழு code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## சுருக்கம்

இந்தப் பாடத்தில், நாம் ஒரு புகைப்படச் சுவர் பக்கத்தை முடித்தோம்.

![காட்சி](../../../Resource/032_view13.png)

இந்த எடுத்துக்காட்டில், முதலில் `Image` பயன்படுத்தி புகைப்படங்களை காட்டினோம். பின்னர் `extension` மூலம் `Image`-க்கு `photoGalleryStyle` என்ற method-ஐ விரிவாக்கினோம். இது மீண்டும் மீண்டும் வரும் படப் பாணி code-ஐ ஒழுங்குபடுத்த பயன்பட்டது.

பின்னர், SwiftUI-இல் பொதுவான `Shape`-களை கற்றோம். எடுத்துக்காட்டாக `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` மற்றும் `Ellipse`. இந்த வடிவங்கள் நேரடியாக காட்டப்படுவதோடு, `clipShape` உடன் சேர்ந்து view-ஐ வெட்டவும் பயன்படுகின்றன.

உதாரணமாக:

```swift
.clipShape(Circle())
```

இது view-ஐ வட்டமாக வெட்டுவதை குறிக்கிறது.

இறுதியாக, புகைப்படங்களுக்கு அதற்கேற்ற வடிவ border சேர்க்க `overlay` மற்றும் `strokeBorder` பயன்படுத்தினோம். கவனிக்க வேண்டியது: `border` பொதுவாக view-இன் செவ்வகப் பகுதியை அடிப்படையாகக் கொண்டு border வரையும். border வட்டம், காப்ஸ்யூல் அல்லது நீள்வட்டத்தைப் பின்பற்ற வேண்டும் என்றால், அதே `Shape`-ஐ அடுக்கிப் பயன்படுத்துவது மேலும் பொருத்தமானது.

இந்தப் பாடத்தின் மூலம், நாம் புகைப்படச் சுவர் விளைவைக் கட்டியமைத்ததோடு மட்டுமல்லாமல், interface-இல் `Shape`, `clipShape`, `strokeBorder` மற்றும் `overlay` ஆகியவை அடிக்கடி சேர்த்து பயன்படுத்தப்படும் முறையையும் புரிந்துகொண்டோம்.

## பாடத்திற்குப் பிந்தைய பயிற்சி

### 1. புகைப்படச் சுவர் பின்னணி சேர்த்தல்

புகைப்படச் சுவர் பக்கத்திற்கு ஒரு full-screen background image சேர்க்கவும்.

தேவை: background image முழு திரையையும் நிரப்ப வேண்டும். மேலும் safe area-ஐ புறக்கணிக்க வேண்டும்.

### 2. Gradient border

தற்போதைய single-color border-ஐ linear gradient border ஆக மாற்றுங்கள்.

மேலும் வளமான border விளைவுகளை உருவாக்க `LinearGradient` பயன்படுத்திப் பார்க்கலாம்.

### 3. உண்மையான புகைப்பட frame border

இணையத்தில் சில உண்மையான photo frame styles-ஐ தேடுங்கள். `overlay` பயன்படுத்தி image border-ஐ அடுக்கிப் பாருங்கள். இதனால் புகைப்படம் உண்மையான photo frame-க்கு மேலும் நெருக்கமாகத் தெரியும்.

பயிற்சி காட்சி விளைவு:

![button](../../../Resource/032_view15.jpeg)

### 4. வட்ட மூலை button border உருவாக்குதல்

உண்மையான development-இல், buttons பெரும்பாலும் rounded rectangle border-ஐ பயன்படுத்தும்.

ஒரு rounded button உருவாக்கி, `RoundedRectangle` மற்றும் `strokeBorder` பயன்படுத்தி button-க்கு rounded-corner border சேர்த்துப் பாருங்கள்.

பயிற்சி காட்சி விளைவு:

![button](../../../Resource/032_view14.png)

### சிந்தனை கேள்வி

single-color border-ஐயும் gradient border-ஐயும் பயன்படுத்தாமல், border ஒரு pattern effect போல தெரிய வேண்டும் என்றால், அதை எப்படி செயல்படுத்தலாம்?

தகவல்களைத் தேடி, `overlay`, `mask` அல்லது `ImagePaint` போன்ற தொடர்புடைய பயன்பாடுகளைப் பற்றி அறிய முயற்சி செய்யலாம்.

பயிற்சி காட்சி விளைவு:

![button](../../../Resource/032_view16.png)
