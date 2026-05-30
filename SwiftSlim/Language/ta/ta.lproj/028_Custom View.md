# தனிப்பயன் காட்சி

இந்த பாடத்தில், நாம் மிகவும் முக்கியமான SwiftUI எழுதும் முறையைப் பழகுகிறோம்: **தனிப்பயன் View**.

தனிப்பயன் View என்பது மீண்டும் மீண்டும் தோன்றும் View குறியீட்டை தொகுத்து, அதை பல முறை பயன்படுத்தக்கூடிய View ஆக மாற்றுகிறது.

உண்மையான App உருவாக்கத்தில், நாங்கள் அடிக்கடி இப்படியான நிலையை சந்திப்போம்: பல திரைகளின் அமைப்பு ஒரே மாதிரியாக இருக்கும், ஆனால் காட்டப்படும் உள்ளடக்கம் மட்டும் வேறுபடும்.

உதாரணமாக, ஒரு மன்ற இணையதளத்தின் பதிவுப் பட்டியலில், ஒவ்வொரு பதிவுக்கும் தலைப்பு, படம், விருப்ப எண்ணிக்கை போன்ற தகவல்கள் இருக்கலாம்.

![Reddit](../../../Resource/028_view1.png)

ஒரு ஷாப்பிங் இணையதளத்தின் தயாரிப்பு பட்டியலில், ஒவ்வொரு தயாரிப்புக்கும் படம், பெயர், விலை போன்ற தகவல்கள் இருக்கலாம்.

![Amazon](../../../Resource/028_view2.png)

இந்த உள்ளடக்கங்களின் அமைப்பு ஒத்ததாக இருக்கும்; வேறுபாடு காட்டப்படும் தரவில்தான் இருக்கும்.

ஒவ்வொரு உருப்படிக்கும் கைமுறையாக குறியீடு எழுதினால், குறியீடு மிகவும் நீளமாகும், பின்னர் மாற்றுவதும் சிரமமாகும்.

அதனால், ஒரே மாதிரியான அமைப்பை ஒரு தனிப்பயன் View ஆக தொகுத்து, வேறுபடும் உள்ளடக்கத்தை அளவுருக்களாக உள்ளே அனுப்பலாம்.

இவ்வாறு, ஒரே View பல்வேறு உள்ளடக்கங்களை காட்ட முடியும்.

## தேவைக் காட்சி

உதாரணமாக, இப்போது நாம் ஒரு அமைப்புகள் பட்டியலை உருவாக்க வேண்டும்.

காட்சி விளைவு:

![view](../../../Resource/028_view.png)

இந்த அமைப்புகள் பட்டியலில், `அமைப்புகள்`, `கோப்புறை`, `இசை` என்ற மூன்று வெவ்வேறு அமைப்பு உருப்படிகள் உள்ளன.

அவற்றின் ஐகான், நிறம், தலைப்பு வேறுபட்டிருந்தாலும், மொத்த அமைப்பு ஒரே மாதிரியாக உள்ளது:

- இடப்புற ஐகான்
- ஐகானின் பின்னணி நிறம்
- நடுப்பகுதி தலைப்பு
- வலப்புற அம்பு

தனிப்பயன் View பயன்படுத்தாமல் இருந்தால், நாம் இதுபோல் எழுதலாம்:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("அமைப்புகள்")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("கோப்புறை")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("இசை")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

இந்த குறியீடு சாதாரணமாக காட்டப்படும், ஆனால் பிரச்சினையும் தெளிவாக தெரிகிறது: மூன்று அமைப்பு உருப்படிகளின் குறியீடு கிட்டத்தட்ட முழுவதும் ஒன்றே.

வேறுபடும் இடங்கள் ஐகான், நிறம், தலைப்பு மட்டுமே:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("அமைப்புகள்")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("கோப்புறை")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("இசை")
```

அதாவது, ஒவ்வொரு அமைப்பு உருப்படியின் அமைப்பு நிரந்தரமானது; ஐகான், நிறம், தலைப்பு மட்டும் வேறுபடுகின்றன.

இத்தகைய நிலை தனிப்பயன் View பயன்படுத்த மிகவும் ஏற்றது.

### நிழல் shadow

இங்கே புதிய modifier `.shadow(radius:)` பயன்படுத்தப்பட்டுள்ளது:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View க்கு நிழலை சேர்க்கலாம்.

`radius` என்பது நிழலின் மங்கலாக்கும் ஆரத்தை குறிக்கிறது. மதிப்பு அதிகமாக இருந்தால், நிழல் பரவும் பகுதி பொதுவாக அதிகமாகும், மேலும் அது மென்மையாக தெரியும்.

இங்கே `1` என அமைக்கப்பட்டுள்ளது; அதாவது மிகவும் லேசான நிழல் விளைவு மட்டும் சேர்க்கப்படுகிறது.

## அமைப்பு உருப்படி View ஐ தொகுத்தல்

அடுத்து, ஒவ்வொரு அமைப்பு உருப்படியையும் ஒரு புதிய View ஆக தொகுப்போம்.

`SettingItemView` ஒன்றை உருவாக்கலாம்:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

இந்த View இல், நாம் மூன்று பண்புகளை வரையறுத்துள்ளோம்:

```swift
let icon: String
let color: Color
let title: String
```

அவற்றில்:

- `icon` என்பது ஐகான் பெயரை குறிக்கிறது
- `color` என்பது ஐகான் பின்னணி நிறத்தை குறிக்கிறது
- `title` என்பது அமைப்பு உருப்படியின் தலைப்பை குறிக்கிறது

இந்த மூன்று உள்ளடக்கங்களும் வெவ்வேறு அமைப்பு உருப்படிகளில் வேறுபடும் என்பதால், அவற்றை வெளியில் இருந்து அனுப்பக்கூடிய அளவுருக்களாக மாற்றுகிறோம்.

## தனிப்பயன் View ஐ பயன்படுத்துதல்

`SettingItemView` கிடைத்த பிறகு, நாம் இனி பெரிய `HStack` குறியீட்டைக் மீண்டும் எழுத வேண்டியதில்லை.

இப்போது இதுபோல் பயன்படுத்தலாம்:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "அமைப்புகள்")
```

இந்த குறியீட்டு வரி ஒரு அமைப்பு உருப்படி View ஐ உருவாக்கி, மூன்று அளவுருக்களை அனுப்புகிறது:

```swift
icon: "gear"
color: Color.blue
title: "அமைப்புகள்"
```

அனுப்பிய பிறகு, `SettingItemView` உள்ளே இருக்கும் பண்புகள் தொடர்புடைய மதிப்புகளைப் பெறும்:

- `icon` இன் மதிப்பு `gear`
- `color` இன் மதிப்பு `Color.blue`
- `title` இன் மதிப்பு `"அமைப்புகள்"`

ஆகவே, View உள்ளேயுள்ள `Image(systemName: icon)` கியர் ஐகானை காட்டும், `.background(color)` நீல பின்னணியைப் பயன்படுத்தும், `Text(title)` `அமைப்புகள்` என்பதை காட்டும்.

முழு குறியீடு:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "அமைப்புகள்")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "கோப்புறை")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "இசை")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

காட்சி விளைவு:

![view](../../../Resource/028_view.png)

தொகுத்த பிறகும் காட்சி விளைவு முன்பைப் போலவே இருப்பதை பார்க்கலாம், ஆனால் குறியீடு தெளிவாகியுள்ளது.

முன்பு ஒவ்வொரு அமைப்பு உருப்படிக்கும் முழு `HStack` பகுதியை எழுத வேண்டியிருந்தது; இப்போது ஒரு குறியீட்டு வரி போதும்:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "அமைப்புகள்")
```

இதுதான் தனிப்பயன் View இன் பணி: **மீண்டும் மீண்டும் வரும் View அமைப்பை தொகுத்து, வேறுபடும் உள்ளடக்கத்தை மட்டும் அளவுருவாக அனுப்புதல்.**

## ஏன் அளவுருக்களை அனுப்ப முடியும்

அடுத்து, தனிப்பயன் View ஏன் அளவுருக்களைப் பெற முடிகிறது என்பதை எளிமையாகப் புரிந்துகொள்வோம்.

SwiftUI இல், View அடிப்படையில் ஒரு structure ஆகும்.

உதாரணமாக:

```swift
struct ContentView: View {
    var body: some View {
        Text("வணக்கம், உலகம்!")
    }
}
```

இங்கே `ContentView` ஒரு structure.

நாம் எழுதும்போது:

```swift
ContentView()
```

உண்மையில் நாம் ஒரு `ContentView` View ஐ உருவாக்குகிறோம்.

பின்புறத்தில் உள்ள `()` என்பது அதன் initialization method ஐ அழைப்பதைக் குறிக்கிறது; இதை இந்த View ஐ உருவாக்குவது என்றும் புரிந்துகொள்ளலாம்.

இந்த `ContentView` க்கு வெளியில் இருந்து அனுப்ப வேண்டிய பண்புகள் இல்லை என்பதால், நேரடியாக இவ்வாறு எழுதலாம்:

```swift
ContentView()
```

ஆனால், View இல் மதிப்பு வழங்கப்படாத பண்பு இருந்தால், View உருவாக்கும் போது அதற்கான மதிப்பை அனுப்ப வேண்டும்.

உதாரணமாக:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("பெயர்: \(name)")
    }
}
```

இங்கே `name` ஒரு பண்பு, அதற்கு இயல்புநிலை மதிப்பு இல்லை.

அதனால் `ContentView` உருவாக்கும் போது, `name` க்கு ஒரு குறிப்பிட்ட மதிப்பை வழங்க வேண்டும்:

```swift
ContentView(name: "Fang Junyu")
```

இதனால் View உள்ளே அந்த மதிப்பைப் பயன்படுத்த முடியும்:

```swift
Text("பெயர்: \(name)")
```

இதுவே `SettingItemView` உருவாக்கும்போது நாம் அளவுருக்களை அனுப்ப வேண்டிய காரணம்:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "அமைப்புகள்")
```

ஏனெனில் `SettingItemView` இல் இயல்புநிலை மதிப்பில்லாத மூன்று பண்புகள் உள்ளன:

```swift
let icon: String
let color: Color
let title: String
```

ஆகவே இந்த View ஐ உருவாக்கும்போது, அவற்றை உள்ளே அனுப்ப வேண்டும். அனுப்பப்படும் அளவுருக்களை Swift View உள்ளேயுள்ள பண்புகளுக்கு மதிப்பளிக்கப் பயன்படுத்தும்.

## Initialization method

அடுத்து, initialization method ஐ இன்னும் ஒரு படி புரிந்துகொள்வோம்.

### இயல்புநிலை initialization method

நாம் ஒரு சாதாரண View ஐ வரையறுக்கும் போது:

```swift
struct ContentView: View {
    var body: some View {
        Text("வணக்கம், உலகம்!")
    }
}
```

இந்த குறியீட்டில், நாம் கையால் initialization method எழுதவில்லை.

ஆனால் இந்த View ஐ பயன்படுத்தும்போது, இவ்வாறு எழுதலாம்:

```swift
ContentView()
```

இங்கே `()` உண்மையில் `ContentView` ஐ உருவாக்குவதைக் குறிக்கிறது; இதை அதன் initialization method ஐ அழைப்பதாகவும் புரிந்துகொள்ளலாம்.

### initialization method இல்லாதபோதும் ஏன் அழைக்க முடிகிறது?

ஏனெனில் Swift compiler தானாகவே நமக்காக ஒரு initialization method ஐ உருவாக்கும்.

கவனிக்க வேண்டியது: **இந்த initialization method தானாக உருவாக்கப்படுகிறது; பொதுவாக அதை குறியீட்டில் நேரடியாக காண முடியாது.**

அதாவது, நாம் `struct` உள்ளே கையால் இவ்வாறு எழுதவில்லை என்றாலும்:

```swift
init() {

}
```

Swift compiler பின்னணியில் நமக்காக இதுபோன்ற initialization method ஒன்றை உருவாக்கும்:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("வணக்கம், உலகம்!")
    }
}
```

இதுதான் நாம் நேரடியாக இவ்வாறு எழுத முடிவதற்கான காரணம்:

```swift
ContentView()
```

எனவே, உண்மையான குறியீட்டில், பொதுவாக initialization method ஐ கையால் எழுத தேவையில்லை.

ஒரு விஷயத்தை மட்டும் புரிந்துகொள்ள வேண்டும்: **SwiftUI View ஐ உருவாக்கும் போது, அந்த View இன் initialization method அழைக்கப்படும். நாம் கையால் initialization method எழுதாவிட்டாலும், Swift அதை தானாக உருவாக்கக்கூடும்.**

### அளவுரு கொண்ட initialization method

View இல் இயல்புநிலை மதிப்பில்லாத ஒரு பண்பு இருந்தால், உதாரணமாக:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("பெயர்: \(name)")
    }
}
```

Swift compiler பண்பின் அடிப்படையில் தானாகவே அளவுரு கொண்ட initialization method ஐ உருவாக்கும்.

இதைக் எளிமையாக இவ்வாறு புரிந்துகொள்ளலாம்:

```swift
init(name: String) {
    self.name = name
}
```

இங்கே:

```swift
init(name: String)
```

`ContentView` உருவாக்கும்போது, `String` வகையைச் சேர்ந்த `name` அளவுருவை அனுப்ப வேண்டும் என்பதைக் குறிக்கிறது.

நாம் இவ்வாறு எழுதும்போது:

```swift
ContentView(name: "Fang Junyu")
```

அதன் பொருள்: `"Fang Junyu"` ஐ initialization method க்கு அளவுருவாக அனுப்புவது.

பிறகு initialization method உள்ளே இது செயல்படும்:

```swift
self.name = name
```

இந்த குறியீட்டு வரியின் பொருள்: வெளியிலிருந்து அனுப்பப்பட்ட `name` ஐ தற்போதைய View இன் சொந்த `name` பண்புக்கு ஒதுக்குவது.

இதைக் எளிமையாக இவ்வாறு புரிந்துகொள்ளலாம்:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("பெயர்: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

இதனால் View உள்ளே அனுப்பப்பட்ட மதிப்பைப் பயன்படுத்த முடியும்.

இதுவே அளவுரு கொண்ட View இன் initialization செயல்முறை: **View உள்ளேயுள்ள பண்பிற்கு இயல்புநிலை மதிப்பு இல்லாதபோது, View உருவாக்கும்போது அதற்கான அளவுருவை அனுப்ப வேண்டும்; initialization method அந்த பண்பிற்கு மதிப்பு ஒதுக்கும்.**

## பண்பிற்கு இயல்புநிலை மதிப்பு இருக்கும் நிலை

பண்பிற்கு ஏற்கனவே இயல்புநிலை மதிப்பு இருந்தால், View உருவாக்கும் போது அளவுரு அனுப்பாமல் இருக்கலாம்.

உதாரணமாக:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("பெயர்: \(name)")
    }
}
```

இங்கே `name` க்கு ஏற்கனவே ஒரு இயல்புநிலை மதிப்பு உள்ளது:

```swift
"Fang Junyu"
```

எனவே `ContentView` உருவாக்கும்போது, நேரடியாக இவ்வாறு எழுதலாம்:

```swift
ContentView()
```

இந்த நேரத்தில் `name` இயல்புநிலை மதிப்பைப் பயன்படுத்தும், இடைமுகம் இவ்வாறு காட்டும்:

```swift
பெயர்: Fang Junyu
```

நிச்சயமாக, View உருவாக்கும் போது புதிய மதிப்பையும் அனுப்பலாம்:

```swift
ContentView(name: "Sam")
```

இந்த நேரத்தில், View இயல்புநிலை மதிப்பைப் பயன்படுத்தாமல், வெளியில் இருந்து அனுப்பப்பட்ட `"Sam"` ஐ பயன்படுத்தும்; இடைமுகம் இவ்வாறு காட்டும்:

```swift
பெயர்: Sam
```

புரிந்துகொள்ள எளிதாக, Swift compiler தானாக உருவாக்கும் initialization method ஐ இவ்வாறு எளிமையாகக் கருதலாம்:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

இங்கே `name: String = "Fang Junyu"` என்பதன் பொருள்: View உருவாக்கும் போது `name` அனுப்பப்படவில்லை என்றால், இயல்புநிலை மதிப்பு `"Fang Junyu"` பயன்படுத்தப்படும்; View உருவாக்கும் போது புதிய `name` அனுப்பப்பட்டால், அனுப்பப்பட்ட மதிப்பு பயன்படுத்தப்படும்.

அதாவது: **வெளியில் இருந்து அளவுரு அனுப்பப்படவில்லை என்றால், பண்பின் இயல்புநிலை மதிப்பு பயன்படுத்தப்படும்; வெளியில் இருந்து அளவுரு அனுப்பப்பட்டால், அனுப்பப்பட்ட மதிப்பு பயன்படுத்தப்படும்.**

## மீண்டும் SettingItemView க்கு திரும்புவோம்

இப்போது நாம் மீண்டும் SettingItemView ஐ பார்ப்போம்:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

இந்த View இன் அமைப்பு நிரந்தரமானது.

நிரந்தரமான பகுதிகளில் அடங்குவது:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

வேறுபடும் பகுதிகளில் அடங்குவது:

```swift
icon
color
title
```

அதனால், வேறுபடும் உள்ளடக்கத்தை பண்புகளாக மாற்றி, View உருவாக்கும் போது அளவுருக்களாக அனுப்புகிறோம்.

நாம் வெவ்வேறு அமைப்பு உருப்படிகளை உருவாக்கும் போது, வெவ்வேறு அளவுருக்களை மட்டும் அனுப்ப வேண்டும்:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "அமைப்புகள்")
SettingItemView(icon: "folder", color: Color.brown, title: "கோப்புறை")
SettingItemView(icon: "music.note", color: Color.purple, title: "இசை")
```

இவ்வாறு, ஒரே `SettingItemView` மூன்று வெவ்வேறு அமைப்பு உருப்படிகளை காட்ட முடியும்.

இதுவே தனிப்பயன் View இன் மிகவும் பொதுவான பயன்பாட்டு முறை.

## சுருக்கம்

இந்த பாடத்தில், நாம் தனிப்பயன் View ஐ கற்றுக்கொண்டோம்.

தனிப்பயன் View இன் மையப் பணி: **மீண்டும் மீண்டும் வரும் View குறியீட்டை தொகுத்து, அதை மீண்டும் பயன்படுத்தக்கூடியதாக மாற்றுவது.**

இந்த எடுத்துக்காட்டில், மூன்று அமைப்பு உருப்படிகளின் அமைப்பு ஒரே மாதிரி; ஐகான், நிறம், தலைப்பு மட்டும் வேறுபடுகின்றன.

அதனால் நாம் `SettingItemView` ஒன்றை உருவாக்கினோம்:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

பிறகு, இந்த View ஐ பயன்படுத்தும்போது வெவ்வேறு அளவுருக்களை அனுப்புகிறோம்:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "அமைப்புகள்")
```

இங்கே உள்ள அளவுருக்கள் `SettingItemView` உள்ளே செல்கின்றன.

இந்த முறையில், குறைவான குறியீட்டுடன், அமைப்பு ஒரே மாதிரி ஆனால் உள்ளடக்கம் வேறுபடும் View களை உருவாக்க முடியும்.

இது SwiftUI உருவாக்கத்தில் மிகவும் பொதுவான எழுதும் முறையாகவும் உள்ளது.
