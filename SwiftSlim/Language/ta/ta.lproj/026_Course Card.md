# பாட அட்டை

இந்த பாடம் ஒரு கட்ட மறுபார்வைப் பாடமாகும். நாம் ஒரு “பாட அட்டை”யை முடிப்போம்.

இந்த பயிற்சியின் மூலம், முன்பு கற்ற `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` போன்ற உள்ளடக்கங்களை மீண்டும் பார்த்து, பல சிறிய view-களை ஒரு முழுமையான view module ஆக இணைப்பது எப்படி என்பதையும் கற்போம்.

பாட அட்டையின் விளைவு:

![view](../../../Resource/026_view.png)

இந்த பாட அட்டையில் முக்கியமாக சில பகுதிகள் உள்ளன:

- பாட நிலை: `தொடக்கநிலை`
- பாட உள்ளடக்கம்: `20+ பாடங்கள்`
- பாட தலைப்பு: `SwiftUI தொடக்கநிலை பயிற்சி`
- பாட விளக்கம்
- பொத்தான்: `கற்கத் தொடங்குங்கள்`
- பாட பின்னணி: Swift ஐகான் மற்றும் இண்டிகோ பின்னணி

இந்த view-ஐ `ContentView` இல் முடிக்கலாம்.

## மேல் பகுதி

முதலில், பாட அட்டையின் மேல் பகுதியை உருவாக்குங்கள்.

![view](../../../Resource/026_view1.png)

மேல் பகுதியின் இடது பக்கம் பாட நிலையை காட்டுகிறது; வலது பக்கம் பாட உள்ளடக்கத்தை காட்டுகிறது.

இந்த இரண்டு உள்ளடக்கங்களும் கிடைமட்டமாக வரிசைப்படுத்தப்பட்டுள்ளதால், `HStack` ஐ பயன்படுத்தலாம்.

```swift
var topView: some View {
    HStack {
        Text("தொடக்கநிலை")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ பாடங்கள்")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

இங்கே, மேல் பகுதியை ஒரு computed property ஆக பிரித்துள்ளோம்:

```swift
var topView: some View
```

இப்படிச் செய்வதன் நன்மை, `body` மேலும் தெளிவாக இருக்கும்.

மேல் பகுதி முக்கியமாக பின்வரும் உள்ளடக்கங்களைப் பயன்படுத்துகிறது:

- `HStack`: இரண்டு text view-களை கிடைமட்டமாக வரிசைப்படுத்துகிறது.
- `Text`: உரை உள்ளடக்கத்தை காட்டுகிறது.
- `Spacer()`: இடது உரையை இடதுபுறத்துக்கும், வலது உரையை வலதுபுறத்துக்கும் தள்ளுகிறது.
- `.font(.footnote)`: சிறிய உரை பாணியை அமைக்கிறது.
- `.fontWeight(.bold)`: உரையை bold ஆக்குகிறது.
- `.foregroundStyle(Color.white)`: foreground நிறத்தை வெள்ளையாக அமைக்கிறது.
- `.padding(.vertical, 10)`: செங்குத்து உள்ளமை இடைவெளியை அமைக்கிறது.
- `.padding(.horizontal, 16)`: கிடைமட்ட உள்ளமை இடைவெளியை அமைக்கிறது.
- `.background(Color.white.opacity(0.15))`: அரைத் தெளிவான வெள்ளை பின்னணியை அமைக்கிறது.
- `.cornerRadius(20)`: மூலை வளைவை அமைக்கிறது.

இங்கே, `தொடக்கநிலை` இரண்டு திசைகளிலும் `.padding()` ஐ பயன்படுத்துகிறது:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

இதனால் உரைக்கு மேல்கீழாகவும் இடதுவலமாகவும் இடைவெளி கிடைக்கும்; அது ஒரு tag போலத் தோன்றும்.

`Color.white.opacity(0.15)` என்பது `15%` opacity கொண்ட வெள்ளையை குறிக்கிறது; அதாவது மிகவும் மென்மையான வெள்ளை.

### அட்டை பின்னணியைச் சேர்க்கவும்

முன்பு நாம் `topView` ஐ உருவாக்கினோம். ஆனால் view ஒன்றை உருவாக்குவது மட்டும் அதை தானாகக் காட்டாது.

SwiftUI இல், திரையில் உண்மையில் காட்ட வேண்டிய உள்ளடக்கம் `body` இல் எழுதப்பட வேண்டும்.

எனவே, முதலில் `topView` ஐ `body` உள்ளே வைத்து காட்டலாம்:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

இந்த நிலையில், மேல் பகுதி ஏற்கனவே காட்டப்பட்டிருப்பதை நீங்கள் காணலாம்:

![view](../../../Resource/026_view2.png)

ஆனால் `topView` இல் உள்ள உரை வெள்ளையாகவும், இயல்புநிலை பின்னணியும் வெளிராகவும் இருப்பதால், light mode இல் அது தெளிவாக தெரியாமல் இருக்கலாம்.

எனவே, வெளிப்புறத்தில் ஒரு `VStack` ஐ சேர்த்து, பின்னர் முழுப் பகுதிக்கும் padding, background color மற்றும் corner radius அமைக்கலாம்:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

காட்சி விளைவு:

![view](../../../Resource/026_view3.png)

இங்கே உள்ள `VStack` தற்போது ஒரு `topView` மட்டும் கொண்டுள்ளது; ஆகவே அது அவசியமில்லாதது போலத் தோன்றலாம்.

ஆனால் பின்னர் நாம் பாட தலைப்பு, பாட விளக்கம் மற்றும் பொத்தான் பகுதியை தொடர்ந்து சேர்ப்போம். அவை அனைத்தும் செங்குத்தாக வரிசைப்படுத்தப்படும் உள்ளடக்கங்கள். எனவே இங்கே முன்கூட்டியே `VStack` பயன்படுத்துவது, பின்னர் view-களை இணைக்க எளிதாக்கும்.

இங்கே இரண்டு `.padding()` modifier-கள் உள்ளன; அவற்றின் பணிகள் வேறுபடும்.

முதல் `.padding(20)` `.background()` க்கு முன் எழுதப்பட்டுள்ளது:

```swift
.padding(20)
.background(Color.indigo)
```

இது அட்டையின் உள் padding-ஐ கட்டுப்படுத்துகிறது; அதாவது உள்ளடக்கத்துக்கும் பின்னணி விளிம்புக்கும் இடையிலான தூரம்.

இரண்டாவது `.padding(30)` `.background()` க்கு பிறகு எழுதப்பட்டுள்ளது:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

இது அட்டையின் வெளிப்புற padding-ஐ கட்டுப்படுத்துகிறது; அதாவது முழு அட்டைக்கும் திரை விளிம்புக்கும் இடையிலான தூரம்.

![view](../../../Resource/026_view4.png)

எனவே, இரண்டும் `.padding()` என்றாலும், வேறு இடங்களில் வைத்தால் வேறு விளைவுகளை உருவாக்கும்.

## உள்ளடக்க பகுதி

அடுத்து, பாட அட்டையின் உள்ளடக்க பகுதியை உருவாக்குங்கள்.

காட்சி விளைவு:

![view](../../../Resource/026_view5.png)

உள்ளடக்க பகுதியில் பாட தலைப்பும் பாட விளக்கமும் உள்ளன. அவை செங்குத்தாக வரிசைப்படுத்தப்படுவதால், `VStack` ஐ பயன்படுத்துகிறோம்.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI தொடக்கநிலை பயிற்சி")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("பூஜ்ஜியத்திலிருந்து SwiftUI-ஐ தொடங்கி, Apple-ன் declarative UI development-ஐ முறையாகக் கற்போம். தெளிவான விளக்கங்களும் நடைமுறை உதாரணங்களும் மூலம், layout, interaction, state management ஆகியவற்றை படிப்படியாகக் கற்று, அழகான மற்றும் பயனுள்ள app interface-களை உருவாக்கலாம்.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

காட்சி விளைவு:

![view](../../../Resource/026_view6.png)

இந்த `VStack` இல் இரண்டு parameter-கள் பயன்படுத்தப்பட்டுள்ளன:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` என்பது `VStack` உள்ளே உள்ள view-களை leading edge-க்கு align செய்வதாகும்.

`spacing: 10` என்பது `VStack` உள்ளே உள்ள view-களுக்கு இடையில் `10 pt` இடைவெளி வைப்பதாகும்.

எனவே, பாட தலைப்பும் பாட விளக்கமும் இடது பக்கம் தொடங்கி, அவற்றுக்கு இடையில் ஒரு குறிப்பிட்ட தூரம் இருக்கும்.

பாட விளக்கம் சற்றே நீளமானது. முழுவதும் காட்டினால் அட்டை மிகவும் உயரமாகிவிடும். எனவே இங்கே காட்டப்படும் வரிகளின் எண்ணிக்கையை கட்டுப்படுத்த `.lineLimit()` பயன்படுத்தப்படுகிறது:

```swift
.lineLimit(3)
```

இதன் பொருள் அதிகபட்சம் `3` வரிகள் காட்டப்படும். உள்ளடக்கம் வரி வரம்பை மீறினால், கூடுதல் பகுதி விடப்படும்.

### View-ஐ இடதுபுறமாக align செய்யுங்கள்

இங்கே இன்னொரு விஷயத்தை கவனிக்க வேண்டும்.

`VStack(alignment: .leading)` என்பது `VStack` உள்ளே உள்ள view-களின் alignment-ஐ மட்டுமே கட்டுப்படுத்தும். அது வெளிப்புற container இல் `VStack` தானாக இருக்கும் இடத்தை நேரடியாக கட்டுப்படுத்தாது.

உதாரணமாக, பாட விளக்கம் சற்றுக் குறுகியதாக இருந்தால்:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI தொடக்கநிலை பயிற்சி")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("சில உள்ளடக்கம் மட்டும்.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

காட்சி விளைவு:

![view](../../../Resource/026_view7.png)

பாட தலைப்பும் பாட விளக்கமும் `VStack` உள்ளே இடதுபுறமாக align செய்யப்பட்டிருந்தாலும், முழு `VStack` அட்டையின் மிக இடது விளிம்புடன் align ஆகவில்லை என்பதை காணலாம்.

இதற்குக் காரணம், உள்ளடக்கம் குறுகியதாக இருந்தால் `VStack` இன் அகலமும் சற்றுக் குறுகியதாக மாறும். வெளிப்புற container layout செய்யும் போது, இந்த குறுகிய `VStack` ஐ நடுவில் வைக்கக்கூடும்.

இவ்வாறு புரிந்துகொள்ளலாம்: `VStack(alignment: .leading)` என்பது உள் இடது alignment-க்கு பொறுப்பு.
ஆனால் முழு உள்ளடக்க பகுதியை மிக இடதுபுறத்துக்கு தள்ளுவது அதன் பொறுப்பு அல்ல.

முழு உள்ளடக்க பகுதி உண்மையில் இடதுபுறம் align ஆக வேண்டுமெனில், அதை இன்னொரு `HStack` உள்ளே wrap செய்து `Spacer()` சேர்க்கலாம்:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI தொடக்கநிலை பயிற்சி")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("சில உள்ளடக்கம் மட்டும்.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

காட்சி விளைவு:

![view](../../../Resource/026_view8.png)

இங்கே உள்ள `HStack` ஒரு கிடைமட்ட layout ஆகும்.

`Spacer()` வலது பக்கத்தில் உள்ள மீதமுள்ள இடத்தைப் பிடிக்கும்; அதன் மூலம் இடது பக்கத்தில் உள்ள `VStack` மிக இடதுபுறத்துக்கு தள்ளப்படும்.

எனவே, `HStack + Spacer()` முழு உள்ளடக்க பகுதியின் இடத்தை கட்டுப்படுத்த பயன்படுத்தலாம்.

உண்மையான பாட அட்டையில், பாட விளக்கம் நீளமானதாகவும் பொதுவாக அதிக அகலத்தைப் பிடிப்பதாகவும் இருக்கும். ஆகவே இந்த பிரச்சினை அவ்வளவு வெளிப்படையாகத் தெரியாமல் இருக்கலாம். ஆனால் இந்த வேறுபாட்டைப் புரிந்துகொள்வது முக்கியம்; ஏனெனில் பின்னர் குறுகிய உரை layout உருவாக்கும்போது இதுபோன்ற நிலைகள் அடிக்கடி வரும்.

### உள் view-களுக்கிடையிலான தூரத்தை கட்டுப்படுத்துங்கள்

முன்பு நாம் `VStack` இல் `spacing: 10` என்று எழுதியிருந்தோம்:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` என்பது உள் view-களுக்கிடையிலான தூரத்தை கட்டுப்படுத்தப் பயன்படுத்தப்படுகிறது.

`spacing` அமைக்கப்படாவிட்டாலும், `VStack` க்கு ஒரு இயல்புநிலை spacing இருக்கும். ஆனால் அந்த இயல்புநிலை spacing நாம் விரும்பும் விளைவுடன் பொருந்தாமல் இருக்கலாம்.

இங்கே, பாட தலைப்பும் பாட விளக்கமும் ஒன்றுக்கொன்று மிக அருகில் இருந்தால் layout நெருக்கமாகத் தோன்றும். எனவே நாம் இதைப் பயன்படுத்துகிறோம்:

```swift
spacing: 10
```

இதனால் அவற்றுக்கு இடையில் சிறிது இடைவெளி இருக்கும்.

காட்சி விளைவு:

![view](../../../Resource/026_view9.png)

அதேபோல், மேல் பகுதியும் உள்ளடக்க பகுதியும் செங்குத்தாக வரிசைப்படுத்தப்பட்டுள்ளன. எனவே அவற்றுக்கிடையிலான தூரத்தை கட்டுப்படுத்தவும் `spacing` பயன்படுத்தலாம்.

இப்போது, `topView` மற்றும் `contentView` ஐ `body` இல் வையுங்கள்:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

காட்சி விளைவு:

![view](../../../Resource/026_view10.png)

இங்கே, `VStack(spacing: 20)` என்பது `topView` மற்றும் `contentView` இடையிலான தூரத்தை கட்டுப்படுத்துகிறது.

வேறுவிதமாகச் சொன்னால்:

```swift
VStack(alignment: .leading, spacing: 10)
```

பாட தலைப்புக்கும் பாட விளக்கத்துக்கும் இடையிலான தூரத்தை கட்டுப்படுத்துகிறது.

```swift
VStack(spacing: 20)
```

மேல் பகுதியும் உள்ளடக்க பகுதியும் இடையிலான தூரத்தை கட்டுப்படுத்துகிறது.

இரண்டும் `spacing` தான். ஆனால் அவை வேறு `VStack` container-களில் செயல்படுகின்றன. எனவே பாதிக்கப்படும் வரம்பும் வேறுபடும்.

இதனால், உள்ளடக்க பகுதி view முடிந்தது.

## பொத்தான் பகுதி

அடுத்து, கீழேயுள்ள பொத்தான் பகுதியை உருவாக்குங்கள்.

காட்சி விளைவு:

![view](../../../Resource/026_view11.png)

பொத்தான் பகுதி முக்கியமாக ஒரு play icon மற்றும் ஒரு உரை துண்டைக் கொண்டுள்ளது.

play icon-ஐ காட்ட `Image` ஐவும், பொத்தான் உரையை காட்ட `Text` ஐவும் பயன்படுத்தலாம்.

இங்கே முதலில் பொத்தான் தோற்றத்தை உருவாக்குங்கள்:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("பொத்தான் கிளிக் செய்யப்பட்டது")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("கற்கத் தொடங்குங்கள்")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

காட்சி விளைவு:

![view](../../../Resource/026_view12.png)

இங்கே இரண்டு `HStack` container-கள் பயன்படுத்தப்பட்டுள்ளன:

உள்ளேயுள்ள `HStack` icon மற்றும் உரையை கிடைமட்டமாக வரிசைப்படுத்தப் பயன்படுத்தப்படுகிறது:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("கற்கத் தொடங்குங்கள்")
}
```

வெளிப்புற `HStack`, `Spacer()` உடன் சேர்ந்து, பொத்தான் தோற்றத்தை இடதுபுறமாக align செய்யப் பயன்படுத்தப்படுகிறது:

```swift
HStack {
    ...
    Spacer()
}
```

பொத்தானைத் தட்டும்போது, console `பொத்தான் கிளிக் செய்யப்பட்டது` என்று output செய்யும்.

## அடிப்படை அட்டை முடிந்தது

இப்போது மேல் பகுதி, உள்ளடக்க பகுதி மற்றும் பொத்தான் பகுதியை இணைக்குங்கள்:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

காட்சி விளைவு:

![view](../../../Resource/026_view13.png)

இந்த நிலையில், ஒரு அடிப்படை பாட அட்டை முடிந்துவிட்டது.

## Swift ஐகான் பின்னணி

இறுதியாக, அட்டைக்கு ஒரு அரைத் தெளிவான Swift icon பின்னணியைச் சேர்க்கவும்.

![view](../../../Resource/026_view.png)

முன்பு நாம் `Color.indigo` ஐ background color ஆக பயன்படுத்தினோம். உண்மையில், `.background()` என்பது நிறம் மட்டும் அல்ல, ஒரு முழுமையான view-ஐயும் சேர்க்க முடியும்.

எனவே, முதலில் ஒரு தனிப்பட்ட background view-ஐ உருவாக்கலாம்:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

இந்த background view இல், Swift icon-ஐ கீழ் வலது மூலையில் தள்ள `VStack`, `HStack` மற்றும் `Spacer()` ஐ பயன்படுத்துகிறோம்.

Swift icon வெறும் அலங்கார பின்னணியாக மட்டுமே பயன்படுத்தப்படுவதால், இங்கே அரைத் தெளிவான வெள்ளை பயன்படுத்தப்படுகிறது:

```swift
Color.white.opacity(0.15)
```

இதனால் icon மிகவும் கண்கவர் ஆகாது; முன்னிலையிலுள்ள உரை உள்ளடக்கத்தையும் பாதிக்காது.

அடுத்து, `backgroundView` ஐ அட்டையில் சேர்க்கவும்:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

இறுதி விளைவு:

![view](../../../Resource/026_view14.png)

இங்கே இரண்டு `.background()` modifier-கள் தொடர்ந்து பயன்படுத்தப்பட்டுள்ளன:

```swift
.background(backgroundView)
.background(Color.indigo)
```

முதல் `.background()` Swift icon பின்னணியைச் சேர்க்கப் பயன்படுத்தப்படுகிறது.
இரண்டாவது `.background()` இண்டிகோ பின்னணியைச் சேர்க்கப் பயன்படுத்தப்படுகிறது.

இதனால் Swift icon இண்டிகோ பின்னணியின் மேல் தோன்றி, அட்டையின் பின்னணியின் ஒரு பகுதியாக காட்டப்படும்.

இதிலிருந்து, `.background()` நிறங்களை மட்டும் அல்லாமல் custom view-களையும் சேர்க்க முடியும் என்பதை பார்க்கலாம். மேலும் பல `.background()` modifier-களை சேர்த்து, செழுமையான பின்னணி விளைவுகளை உருவாக்கலாம்.

இந்த நிலையில், ஒரு முழுமையான பாட அட்டை முடிந்துவிட்டது.

## சுருக்கம்

இந்த பாடத்தில், ஒரு பாட அட்டையின் மூலம் SwiftUI இல் பொதுவாகப் பயன்படுத்தப்படும் அடிப்படை layout முறைகளை மீண்டும் பார்த்தோம்.

உரையை காட்ட `Text`, system icon-ஐ காட்ட `Image`, view arrangement-ஐ கட்டுப்படுத்த `VStack`, `HStack`, `Spacer()` ஆகியவற்றை பயன்படுத்தினோம்.

`.lineLimit()` ஐ கற்றோம். இது ஒரு text காட்டக்கூடிய அதிகபட்ச வரிகளின் எண்ணிக்கையை கட்டுப்படுத்தும். உள்ளடக்கம் வரம்பை மீறினால், கூடுதல் பகுதி விடப்படும்.

அதே நேரத்தில், `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` போன்ற பொதுவான modifier-களையும் மீண்டும் பார்த்தோம்.

இந்த பாடத்தை முடித்த பிறகு, பல சிறிய view-களை ஒரு முழுமையான card module ஆக இணைக்க முடியும்.

இது SwiftUI development-இல் மிகவும் பொதுவான சிந்தனை: முதலில் view-களை சிறிய பகுதிகளாகப் பிரித்து, பின்னர் அவற்றை ஒரு முழுமையான interface ஆக இணைப்பது.

## முழு Code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("தொடக்கநிலை")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ பாடங்கள்")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI தொடக்கநிலை பயிற்சி")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("பூஜ்ஜியத்திலிருந்து SwiftUI-ஐ தொடங்கி, Apple-ன் declarative UI development-ஐ முறையாகக் கற்போம். தெளிவான விளக்கங்களும் நடைமுறை உதாரணங்களும் மூலம், layout, interaction, state management ஆகியவற்றை படிப்படியாகக் கற்று, அழகான மற்றும் பயனுள்ள app interface-களை உருவாக்கலாம்.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("பொத்தான் கிளிக் செய்யப்பட்டது")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("கற்கத் தொடங்குங்கள்")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
