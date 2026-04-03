# Fill Light செயலி

இந்த பாடத்தில், மிகவும் சுவாரஸ்யமான ஒரு fill light செயலியை உருவாக்கப் போகிறோம். இரவு வந்தபோது, தொலைபேசி திரையில் வெவ்வேறு நிறங்களை காட்டச்செய்து, அதை ஒரு எளிய ஒளி நிரப்பும் விளக்காக பயன்படுத்தலாம்.

இந்த fill light செயலியில் திரையைத் தட்டுவதன் மூலம் நிறங்களை மாற்றலாம், மேலும் slider பயன்படுத்தி ஒளிர்வை சரிசெய்யலாம்.

இந்த எடுத்துக்காட்டில், காட்சியின் ஒளிர்வை மாற்ற `brightness`, காட்சிக்கு தட்டும் gesture சேர்க்க `onTapGesture`, மேலும் `Slider` view control போன்றவற்றை கற்போம்.

விளைவு:

![Color](../../Resource/018_color.png)

## நிறத்தை காட்டுதல்

முதலில், view ஒரு நிறத்தை காட்டும்படி செய்வோம்.

SwiftUI-யில், `Color` என்பது ஒரு நிறத்தை மட்டும் குறிக்காது; அது ஒரு view ஆகவும் காட்டப்படலாம்:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

இங்கு `Color.red` என்பது ஒரு சிவப்பு view-ஐ குறிக்கிறது. `.ignoresSafeArea()` என்பது நிற view முழு திரையையும் நிரப்பச் செய்கிறது; அதனால் அது ஒரு உண்மையான fill light effect போல தெரியும்.

விளைவு:

![Color](../../Resource/018_color1.png)

### நிற array மற்றும் index

இப்போது ஒரு நிறம் மட்டும் காட்டப்படுகிறது. ஆனால் fill light சாதாரணமாக ஒரு நிறத்தில் மட்டும் இருக்காது. அது நீலம், மஞ்சள், ஊதா, வெள்ளை போன்ற நிறங்களையும் காட்டலாம்.

திரையைத் தட்டும்போது வெவ்வேறு நிறங்களுக்கு மாற வேண்டும் என்று நாம் விரும்புகிறோம். இந்த நிறங்களை ஒரு array-யில் வைத்து ஒன்றாக நிர்வகிக்கலாம்:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

ஒரே வகையைச் சேர்ந்த “ஒரு தொகுப்பு தரவை” சேமிக்க array மிகவும் பொருத்தமானது. இங்கு array-இல் உள்ள ஒவ்வொரு element-மும் ஒரு `Color` ஆகும்.

ஒரு குறிப்பிட்ட நிறத்தை காட்ட வேண்டுமெனில், index-ஐ பயன்படுத்தலாம்:

```swift
colors[0]
```

இது array-இல் `0` index-ல் இருக்கும் நிறத்தைப் படிப்பதைக் குறிக்கிறது; அதாவது முதல் நிறம்.

இப்போது code-ஐ இவ்வாறு எழுதலாம்:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

இவ்வாறு திரையில் array-இன் முதல் நிறமான சிவப்பு காட்டப்படும்.

### index மூலம் நிறத்தை கட்டுப்படுத்துதல்

வெவ்வேறு நிறங்களுக்கு மாற வேண்டும் என்றால், index-ஐ நேரடியாக எழுதாமல், அதை நிர்வகிக்க ஒரு variable தேவை.

index-ஐ சேமிக்க `@State`-ஐ பயன்படுத்தி ஒரு variable அறிவிக்கலாம்:

```swift
@State private var index = 0
```

இங்கு `index` என்பது தற்போதைய நிறத்தின் index ஆகும்.

`index` மாற்றமடைந்தால், SwiftUI interface-ஐ மீண்டும் கணக்கிட்டு, காட்சியையும் புதுப்பிக்கும்.

அதன் பிறகு பழைய `colors[0]`-ஐ இதனால் மாற்றலாம்:

```swift
colors[index]
```

இவ்வாறு view-இல் காட்டப்படும் நிறம் `index` மூலம் தீர்மானிக்கப்படும்.

இப்போது code இவ்வாறு மாறும்:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

`index` மாறும்போது, `colors[index]` வேறு நிறத்தைக் காட்டும்.

உதாரணமாக:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

கவனிக்க வேண்டியது என்னவெனில், `index` array-இன் அதிகபட்ச index-ஐ விட அதிகமாக இருக்கக்கூடாது; இல்லையெனில் index out of range error ஏற்படும்.

## தட்டும் gesture

இப்போது `index` அடிப்படையில் வெவ்வேறு நிறங்களை காட்டலாம், ஆனால் தட்டி மாற்ற இன்னும் முடியாது.

முன்னர் இருந்த “Quote Carousel” எடுத்துக்காட்டில், quote-களை மாற்ற `Button` பயன்படுத்தினோம்.

இந்த முறை “முழு நிறப்பகுதியையே தட்டுவது” மூலம் நிறத்தை மாற்ற வேண்டும் என்பதால், `onTapGesture` அதிகம் பொருத்தமானது.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

நாம் நிற view-ஐ தட்டும்போது, இதுவே இயங்கும்:

```swift
index += 1
```

இதன் பொருள் `index` `1` ஆக அதிகரிக்கும். index அதிகரித்த பிறகு, `colors[index]` array-இல் இருக்கும் அடுத்த நிறத்தைக் காட்டும்.

### onTapGesture

`onTapGesture` என்பது ஒரு gesture modifier ஆகும்; இது view-க்கு tap செயலைச் சேர்க்கிறது.

அடிப்படை பயன்பாடு:

```swift
.onTapGesture {
    // code
}
```

உதாரணமாக:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

இந்த சிவப்பு view-ஐ தட்டினால், curly braces-இல் உள்ள code இயங்கும்; மேலும் console-ல் இதை output ஆக பெறலாம்:

```swift
Click color
```

`onTapGesture` மூலம், ஒரு view-ஐ தட்டியபின் என்ன நடக்க வேண்டும் என்பதை நாம் அமைக்கலாம்.

### `Button` உடன் வித்தியாசம்

முன்பு `Button` view பற்றி கற்றோம். `Button` மற்றும் `onTapGesture` இரண்டும் tap action-ஐ கையாளலாம்; ஆனால் அவற்றின் பயன்பாட்டு சூழல்கள் முற்றிலும் ஒன்றல்ல.

`onTapGesture` என்பது ஏற்கனவே உள்ள view-க்கு tap capability சேர்க்க மிகவும் பொருத்தமானது. எடுத்துக்காட்டாக `Color`, `Image`, `Text` அல்லது பிற சாதாரண view-கள்.

`Button` என்பது “Confirm”, “Submit”, “Delete” போன்ற தெளிவான button-களை குறிக்க மிகவும் பொருத்தமானது.

இந்த fill light செயலியில், நிறமாற்றத்தை மிகவும் எளிமையாக வைத்திருக்க விரும்புகிறோம். முழு நிறப்பகுதியையும் தட்டி நிறத்தை மாற்ற வேண்டுமென்றால், `onTapGesture`-ஐ பயன்படுத்தலாம்.

## index பிரச்சனை

இப்போது திரையைத் தட்டி வெவ்வேறு நிறங்களுக்கு மாற முடிகிறது.

ஆனால் இங்கே ஒரு முக்கிய பிரச்சனை உள்ளது: **index array வரம்பை மீறக்கூடும்**.

உதாரணமாக:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

திரையை தொடர்ந்து தட்டிக்கொண்டே இருந்தால், `index` இறுதியில் `4` ஆகிவிடும்; அப்போது “index out of range” error ஏற்படும்.

ஏனெனில் `colors` array-இல் `4` elements உள்ளன. ஆனால் index `0`-இல் இருந்து தொடங்குவதால், செல்லுபடியாகும் index வரம்பு `0 - 3`; `4` அல்ல.

`colors[4]`-ஐ அணுகினால், “index out of range” ஏற்படும்.

இப்போது உள்ள code-இல், திரையை ஒவ்வொரு முறை தட்டும் போதும் `index` தானாகவே `1` ஆக அதிகரிக்கிறது. அதை நாம் கையாளாவிட்டால், அது இறுதியில் வரம்பை மீறும்.

எனவே, திரையைத் தட்டும்போது index-ஐ சரிபார்க்க வேண்டும்: இது கடைசி நிறமாக இருந்தால் மீண்டும் முதல் நிறத்திற்குச் செல்ல வேண்டும்; இல்லையெனில் `1` ஆக அதிகரிக்க வேண்டும்.

இதை `if` statement மூலம் செய்யலாம்:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

இந்த code-இல், `colors.count` என்பது array-இல் உள்ள elements எண்ணிக்கையை குறிக்கிறது.

தற்போதைய array-இல் `4` நிறங்கள் உள்ளன, ஆகவே:

```swift
colors.count // 4
```

ஆனால் அதிகபட்ச index `4` அல்ல, `3`; ஏனெனில் index `0`-இல் இருந்து தொடங்குகிறது.

ஆகவே கடைசி index இவ்வாறு எழுதப்படும்:

```swift
colors.count - 1
```

அதாவது:

```swift
4 - 1 = 3
```

இந்த logic என்ன சொல்கிறது என்றால், தற்போதைய index கடைசி நிறத்தைக் குறிப்பதாக இருந்தால் அதை `0` ஆக reset செய்ய வேண்டும்; இல்லையெனில் `1` ஆக அதிகரிக்க வேண்டும்.

இவ்வாறு நிறங்களை loop ஆக மாற்றலாம்.

### index-ஐ சுருக்கமாக எழுதுதல்

code இன்னும் சுருக்கமாக வேண்டும் என்றால், ternary operator-ஐ பயன்படுத்தலாம்:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

இந்த code-ன் பொருள்: `index == colors.count - 1` உண்மை என்றால் `0` return செய்யும். இல்லையெனில் `index + 1` return செய்யும்.

இறுதியாக, அந்த result மீண்டும் `index`-க்கு assign செய்யப்படுகிறது.

இப்போது, நிறமாற்ற effect-ஐ செயல்படுத்தலாம்.

முழு code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

இப்போது திரையைத் தட்டி வெவ்வேறு நிறங்களுக்கு மாறலாம்; ஒரு அடிப்படை fill light செயலி தயாராகிவிட்டது.

## நிறத்தின் பெயரை காட்டுதல்

நிறங்களுக்கு ஏற்ப சில text-களையும் சேர்க்கலாம். அப்போது நிறம் மாறும்போது திரையில் அதற்கான தற்போதைய நிறத்தின் பெயரும் ஒரே நேரத்தில் காட்டப்படும்.

உதாரணமாக:

- சிவப்பு இருக்கும் போது `Red`
- நீலம் இருக்கும் போது `Blue`
- மஞ்சள் இருக்கும் போது `Yellow`
- ஊதா இருக்கும் போது `Purple`

இங்கேயும் நிறங்களின் பெயர்களை சேமிக்க ஒரு array-ஐ பயன்படுத்தலாம்:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

இந்த array-இல் உள்ள text-களின் வரிசை, நிற array-இன் வரிசையுடன் ஒன்றுக்கு ஒன்று பொருந்த வேண்டும்.

பிறகு தற்போதைய index-க்கு ஏற்ப நிறத்தின் பெயரை `Text` மூலம் காட்டலாம்:

```swift
Text(colorsName[index])
```

`Text`, `index` அடிப்படையில் தற்போதைய நிறத்தின் பெயரை காட்டும்.

`Text` காட்சித் தோற்றத்தை modifier-கள் மூலம் மேம்படுத்தலாம்:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

இவ்வாறு `Text` வெள்ளை நிறத்தில், பெரிய title style-இல், bold font-உடன் காட்டப்படும்.

இப்போது நமக்கு முழுத்திரை `Color` view உள்ளது. `Text` அதன்மேல் காட்டப்பட வேண்டுமெனில், `ZStack` layout container-ஐ பயன்படுத்த வேண்டும்.

```swift
ZStack {
    Color
    Text
}
```

அதனால் code இவ்வாறு மாறும்:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

இவ்வாறு பின்னணியில் நிற view இருக்கும்; அதன் மேல் text view காட்டப்படும்.

விளைவு:

![Color](../../Resource/018_color2.png)

கவனிக்க வேண்டியது என்னவெனில், `ZStack`-இல் பின்னர் எழுதப்பட்ட view பொதுவாக முன்னால் காட்டப்படும். `Text`-ஐ `Color`-க்கு முன் எழுதினால், பின்னர் வரும் `Color` view அதைப் மூடிக்கொள்ளலாம்.

## ஒளிர்வை கட்டுப்படுத்துதல்

இப்போது வெவ்வேறு நிறங்களுக்கு மாற முடிகிறது. ஆனால் fill light-இல் இன்னும் ஒரு முக்கிய செயல்பாடு உள்ளது: **ஒளிர்வை மாற்றுதல்**.

SwiftUI-யில், view-இன் brightness-ஐ மாற்ற `brightness` modifier-ஐ பயன்படுத்தலாம்.

உதாரணமாக:

```swift
.brightness(1)
```

நாம் இதுபோல் எழுதலாம்:

```swift
colors[index]
    .brightness(0.5)
```

இவ்வாறு தற்போதைய நிறம் இன்னும் பிரகாசமாகி, fill light effect-க்கு அருகில் தோன்றும்.

`brightness` வரம்பு `0 - 1`. `0` என்பது இயல்புநிலையான நிறத்தை வைத்திருப்பதைக் குறிக்கும். `1`-க்கு நெருங்கும் போது நிறம் மேலும் பிரகாசமாகும்; `1` என்பது மிக அதிகமான வெள்ளை ஒளிர்வைக் குறிக்கும்.

code-இல் `brightness`-ஐ கட்டுப்படுத்த முடிந்தாலும், பயனர் தானாக அதை மாற்ற முடியாது.

அதற்காக இழுத்து மாற்றக்கூடிய ஒரு control தேவை: `Slider`.

## Slider view

SwiftUI-யில், `Slider` என்பது ஒரு வரம்பிற்குள் மதிப்பைத் தேர்ந்தெடுக்கப் பயன்படும் control ஆகும். Apple documentation இதை “a control for selecting a value from a bounded linear range” என்று விவரிக்கிறது.

அடிப்படை பயன்பாடு:

```swift
Slider(value: $value, in: 0...1)
```

parameter விளக்கம்:

1. `value: $value`: `Slider` ஒரு variable-க்கு bind செய்யப்பட வேண்டும்.

    slider-ஐ இழுக்கும் போது, அந்த variable-ன் value அதே நேரத்தில் மாறும். மாறாக variable மாறினாலும் slider-மும் update ஆகும்.

    இது முன்பு கற்ற `TextField` போலவே தான்; இரண்டிலும் “control-ஐ ஒரு variable-க்கு bind செய்வது” என்ற அடிப்படை உள்ளது.
    
    bind செய்யப்பட்ட variable முன் `$` symbol சேர்க்க வேண்டும். அது binding-ஐ குறிக்கும்.

2. `in: 0...1`: இந்த parameter slider-இன் value range-ஐ குறிக்கிறது.

    இங்கு `0...1` என்பது குறைந்தபட்சம் `0`, அதிகபட்சம் `1` என்பதைக் குறிக்கிறது.

    slider-ஐ மிக இடப்பக்கமாக இழுத்தால் bind செய்யப்பட்ட variable `0`-க்கு அருகில் இருக்கும்; மிக வலப்பக்கமாக இழுத்தால் `1`-க்கு அருகில் இருக்கும்.

உதாரணமாக:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider`, `value` variable-க்கு bind செய்யப்பட்டுள்ளது. எனவே slider-ஐ இழுக்கும் போது `value` அதே நேரத்தில் மாறும்.

காட்சி:

![Slider](../../Resource/018_slider.png)

`Slider` இடது பக்கத்தில் இருந்தால் bind செய்யப்பட்ட `value` `0` ஆகும்; வலது பக்கத்தில் இருந்தால் அது `1` ஆகும்.

### value range

`Slider`-இன் value range நிரந்தரமானதல்ல. இதுபோலவும் எழுதலாம்:

```swift
0...100
```

அல்லது வேறு எந்த range-ஆகவும் அமைக்கலாம்.

ஆனால் இந்த fill light செயலியில் ஒளிர்வை கட்டுப்படுத்த வேண்டும் என்பதால், `0...1` தான் மிகச் சரியானது.

## Slider மூலம் brightness-ஐ கட்டுப்படுத்துதல்

இப்போது `Slider` மற்றும் `brightness`-ஐ ஒன்றுடன் ஒன்று இணைக்கப் போகிறோம்.

முதலில், brightness value-ஐ சேமிக்க ஒரு variable உருவாக்குவோம்:

```swift
@State private var slider = 0.0
```

இங்கு `0.0` என்பது `Double` type value ஆகும்.

`Slider` பொதுவாக numeric type-க்கு bind செய்யப்படுகிறது. இங்கு value தொடர்ச்சியாக மாற வேண்டும் என்பதால் `Double` பயன்படுத்துவது பொருத்தமானது. அதோடு, `brightness`-மும் `Double` type value-ஐ மட்டுமே ஏற்கும்.

பிறகு அந்த value-ஐ `brightness`-க்கு கொடுக்கலாம்:

```swift
colors[index]
    .brightness(slider)
```

`slider == 0` என்றால் நிறம் இயல்புநிலையிலேயே இருக்கும். `slider` `1`-க்கு நெருங்கும் போது நிறம் மேலும் பிரகாசமாகத் தெரியும்.

### Slider control-ஐ சேர்த்தல்

அடுத்ததாக, இந்த variable-ஐ மாற்ற ஒரு `Slider` control சேர்ப்போம்:

```swift
Slider(value: $slider, in: 0...1)
```

slider மாறும்போது, `slider` value-மும் மாறும்; அதே நேரத்தில் `brightness(slider)` மூலம் brightness-மும் update ஆகும்.

இது SwiftUI-யில் மிகவும் பொதுவான “variable drives the view” என்ற அணுகுமுறையின் ஒரு நல்ல உதாரணம்.

### Slider தோற்றத்தை சரிசெய்தல்

இயல்பாக, `Slider` கிடைக்கும் இடவசதிக்கேற்ப தனது அகலத்தை எடுத்துக்கொள்ளும்.

அதற்கு ஒரு fixed width அமைக்கலாம்:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

பின்னர் அது தெளிவாகத் தெரிய சில modifier-களைச் சேர்ப்போம்:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

இவ்வாறு slider-க்கு வெள்ளை பின்னணி மற்றும் rounded corners கிடைக்கும்; அதனால் `Color` view மேல் அது இன்னும் தெளிவாகத் தெரியும்.

இறுதியாக, அதை திரையின் அடிப்பகுதியில் வைப்போம்.

ஏற்கனவே `ZStack` பயன்படுத்தியுள்ளதால், அதன் உள்ளே ஒரு `VStack`-ஐ வைத்து, `Spacer()` மூலம் `Slider`-ஐ கீழே தள்ளலாம்.

## முழு code

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

விளைவு:

![Color](../../Resource/018_color.png)

## சுருக்கம்

நாம் முன்பு கற்ற அறிவையும், நிறங்கள் மற்றும் array போன்ற அடிப்படை கருத்துகளையும் இணைத்து, மிகவும் சுவாரஸ்யமான fill light செயலியை உருவாக்கினோம்.

இந்த fill light செயலியின் மூலம், `brightness` பயன்படுத்தி ஒளிர்வை மாற்றுவது, `onTapGesture` மூலம் view-க்கு tap action சேர்ப்பது, மேலும் `Slider` view control-ஐ பயன்படுத்துவது ஆகியவற்றை கற்றோம்.

`Color` view-க்கு `onTapGesture` சேர்த்து, நிறமாற்ற செயல்பாட்டை உருவாக்கினோம். `Slider` control மூலம் ஒரு variable-ஐ கட்டுப்படுத்து `brightness`-ஐ நிர்வகித்தோம்; இதன் மூலம் நிறத்தின் ஒளிர்வை மாற்ற முடிந்தது. இதுவும் “variable drives the view” என்ற கருத்தின் ஒரு எடுத்துக்காட்டு.

ternary operator-ஐ மீண்டும் பார்த்தோம், view-களை overlay செய்ய `ZStack`-ஐ பயன்படுத்தினோம், மேலும் ஒரே வகை தரவுக் குழுவை நிர்வகிக்க array-ஐ பயன்படுத்தினோம். இதன் மூலம் array மற்றும் index பற்றிய நம் புரிதல் மேலும் ஆழமானது; நடைமுறையில் index out of range பிரச்சனையையும் கவனத்தில் கொண்டோம்.

இந்த எடுத்துக்காட்டு சிக்கலானதல்ல. ஆனால் நாம் முன்பு கற்றிருந்த பல அடிப்படை கருத்துகளை ஒன்றாக இணைக்கிறது. ஒரு சிறிய உண்மையான project-இல் அவற்றை பயன்படுத்தும்போது, ஒவ்வொரு கருத்தும் எதற்காக பயன்படுகிறது என்பதை இன்னும் எளிதாகப் புரிந்துகொள்ளலாம்.

### உண்மையான பயன்பாட்டு நிலை

ஒரு பழைய iPhone-ஐ மேசையின் மீது வைத்து, நீங்கள் உருவாக்கிய fill light செயலியை பயன்படுத்தி ஒளியின் நிறத்தை கட்டுப்படுத்துகிறீர்கள் என்று நினைத்துப் பாருங்கள். அது மிகவும் நல்ல அனுபவமாக இருக்கும்.

App Store-ல் பல “fill light” செயலிகளை காணலாம்; அவையும் மிகவும் சிக்கலானதாகத் தெரியவில்லை.

![AppStore](../../Resource/018_appStore.PNG)

எளிய செயலிகளிலிருந்து தொடங்கி, App Store-ல் வெளியிட முயற்சிக்கலாம். அது development மீது நமக்கு அதிக ஆர்வத்தைத் தருவதோடு, நம்முடைய வளர்ச்சி பயணத்தையும் பதிவு செய்யும்.

### பாடத்திற்குப் பிறகான பயிற்சி

இந்த fill light செயலியை மேலும் எப்படி விரிவுபடுத்தலாம் என்று தொடர்ந்து சிந்திக்கலாம். உதாரணமாக:

- இன்னும் அதிக நிறங்களைச் சேர்க்கவும்
- தற்போதைய brightness மதிப்பைக் காட்டவும்
- கீழே உள்ள slider பகுதியின் தோற்றத்தை மேம்படுத்தவும்

இந்த அடிப்படை அறிவுகளை நீங்கள் உண்மையில் பயன்படுத்தத் தொடங்கும் போது, நாம் கற்ற ஒவ்வொரு அறிவுப் பகுதிக்கும் app development-இல் ஒரு கருவி என்ற உண்மையை கண்டுபிடிப்பீர்கள்.
