# Fill Light యాప్

ఈ పాఠంలో, చాలా ఆసక్తికరమైన ఒక fill light యాప్‌ను తయారు చేయబోతున్నాం. రాత్రి వచ్చినప్పుడు, ఫోన్ స్క్రీన్‌లో భిన్నమైన రంగులను చూపించి, దాన్ని ఒక సరళమైన ఫిల్ లైట్‌గా ఉపయోగించవచ్చు.

ఈ fill light యాప్‌లో స్క్రీన్‌ను తట్టి రంగులను మార్చవచ్చు, అలాగే slider ఉపయోగించి brightness ను సర్దుబాటు చేయవచ్చు.

ఈ ఉదాహరణలో, view యొక్క brightness ను మార్చడానికి `brightness`, view కు tap gesture జోడించడానికి `onTapGesture`, అలాగే `Slider` view control వంటి విషయాలను నేర్చుకుంటాం.

ఫలితం:

![Color](../../Resource/018_color.png)

## రంగును చూపించడం

మొదటగా, view ఒక రంగును చూపించేలా చేద్దాం.

SwiftUI లో, `Color` కేవలం ఒక రంగును మాత్రమే సూచించదు; అది ఒక view గా కూడా చూపించబడుతుంది:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

ఇక్కడ `Color.red` ఒక ఎరుపు view ను సూచిస్తుంది. `.ignoresSafeArea()` రంగు view మొత్తం స్క్రీన్‌ను నింపేలా చేస్తుంది, అందువల్ల ఇది నిజమైన fill light effect లా కనిపిస్తుంది.

ఫలితం:

![Color](../../Resource/018_color1.png)

### రంగుల array మరియు index

ఇప్పుడు ఒకే రంగు మాత్రమే చూపబడుతోంది. కానీ fill light సాధారణంగా ఒక్క రంగు మాత్రమే ఉండదు. ఇది నీలం, పసుపు, ఊదా, తెలుపు వంటి ఇతర రంగులను కూడా చూపించవచ్చు.

స్క్రీన్‌ను తట్టినప్పుడు వేర్వేరు రంగులకు మారాలని మనం కోరుకుంటున్నాం. ఈ రంగులను ఒక array లో ఉంచి కలిపి నిర్వహించవచ్చు:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

ఒకే రకమైన “డేటా సమూహాన్ని” నిల్వ చేయడానికి array చాలా అనుకూలం. ఇక్కడ array లోని ప్రతి element ఒక `Color`.

మనకు ఒక నిర్దిష్ట రంగును చూపించాలంటే, index ను ఉపయోగించవచ్చు:

```swift
colors[0]
```

ఇది array లో `0` index వద్ద ఉన్న రంగును చదవడాన్ని సూచిస్తుంది, అంటే మొదటి రంగు.

ఇప్పుడు code ను ఇలా రాయవచ్చు:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

ఈ విధంగా, స్క్రీన్‌పై array లోని మొదటి రంగు అయిన ఎరుపు కనిపిస్తుంది.

### index తో రంగును నియంత్రించడం

వేర్వేరు రంగులకు మారాలంటే, index ను నేరుగా రాయకుండా, దాన్ని నిర్వహించడానికి ఒక variable అవసరం.

index ను నిల్వ చేయడానికి `@State` ఉపయోగించి ఒక variable ను ప్రకటించవచ్చు:

```swift
@State private var index = 0
```

ఇక్కడ `index` ప్రస్తుత రంగు యొక్క index ను సూచిస్తుంది.

`index` మారినప్పుడు, SwiftUI interface ను మళ్లీ లెక్కించి, చూపబడే content ను update చేస్తుంది.

తర్వాత మొదట ఉన్న `colors[0]` ను ఇలా మార్చవచ్చు:

```swift
colors[index]
```

ఈ విధంగా, view లో చూపబడే రంగు `index` ద్వారా నిర్ణయించబడుతుంది.

ఇప్పుడు code ఇలా మారుతుంది:

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

`index` మారినప్పుడు, `colors[index]` కూడా వేరే రంగును చూపిస్తుంది.

ఉదాహరణకు:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

గమనించాల్సిన విషయం ఏమిటంటే, `index` array యొక్క గరిష్ఠ index ను మించకూడదు; లేకపోతే index out of range error వస్తుంది.

## Tap gesture

ఇప్పుడు `index` ఆధారంగా వేర్వేరు రంగులను చూపించగలం, కానీ ఇంకా తట్టి మార్చలేము.

ముందు ఉన్న “Quote Carousel” ఉదాహరణలో, quote లను మార్చడానికి `Button` ను ఉపయోగించాం.

ఈసారి “మొత్తం రంగు ప్రాంతాన్ని తట్టడం” ద్వారా రంగును మార్చాలని అనుకుంటున్నాం, కాబట్టి `onTapGesture` మరింత సరైనది.

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

మనము రంగు view ను తట్టినప్పుడు, ఇది అమలవుతుంది:

```swift
index += 1
```

దీనర్థం `index` `1` పెరుగుతుంది. index పెరిగిన తర్వాత, `colors[index]` array లోని తరువాతి రంగును చూపిస్తుంది.

### onTapGesture

`onTapGesture` ఒక gesture modifier. ఇది view కు tap action ను జోడిస్తుంది.

ప్రాథమిక ఉపయోగం:

```swift
.onTapGesture {
    // code
}
```

ఉదాహరణకు:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

ఈ ఎరుపు view ను తట్టినప్పుడు, curly braces లోని code అమలవుతుంది, అలాగే console లో ఇది output అవుతుంది:

```swift
Click color
```

`onTapGesture` ద్వారా, ఒక view ను తట్టిన తర్వాత ఏమి జరగాలో సెట్ చేయవచ్చు.

### `Button` తో తేడా

ముందుగా మనం `Button` view గురించి నేర్చుకున్నాం. `Button` మరియు `onTapGesture` రెండూ tap action ను handle చేయగలవు, కానీ వాటి ఉపయోగించే సందర్భాలు పూర్తిగా ఒకేలా ఉండవు.

`onTapGesture` ఇప్పటికే ఉన్న view కు tap capability జోడించడానికి మరింత సరైనది. ఉదాహరణకు `Color`, `Image`, `Text` లేదా ఇతర సాధారణ view లకు.

`Button` అయితే “Confirm”, “Submit”, “Delete” వంటి స్పష్టమైన button ను చూపించడానికి మరింత అనుకూలంగా ఉంటుంది.

ఈ fill light యాప్‌లో, రంగు మార్చే feature ను చాలా సులభంగా ఉంచాలని అనుకుంటున్నాం. మొత్తం రంగు ప్రాంతాన్ని తట్టి రంగు మార్చాలంటే, `onTapGesture` ను ఉపయోగించవచ్చు.

## index సమస్య

ఇప్పుడు స్క్రీన్‌ను తట్టి వేర్వేరు రంగులకు మారవచ్చు.

కానీ ఇక్కడ ఒక ముఖ్యమైన సమస్య ఉంది: **index array పరిధిని దాటవచ్చు**.

ఉదాహరణకు:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

స్క్రీన్‌ను పదే పదే తట్టితే, `index` చివరికి `4` అవుతుంది; అప్పుడు “index out of range” error వస్తుంది.

ఎందుకంటే `colors` array లో `4` elements ఉన్నాయి. కానీ index `0` నుండి ప్రారంభమవుతుంది, కాబట్టి సరైన index పరిధి `0 - 3`; `4` కాదు.

`colors[4]` ను access చేస్తే, “index out of range” జరుగుతుంది.

ప్రస్తుతం ఉన్న code లో, స్క్రీన్‌ను ప్రతి సారి తట్టినప్పుడు `index` ఆటోమేటిక్‌గా `1` పెరుగుతుంది. దీన్ని handle చేయకపోతే, అది చివరికి పరిధిని దాటుతుంది.

అందువల్ల, స్క్రీన్‌ను తట్టినప్పుడు index ను చెక్ చేయాలి: ఇది చివరి రంగు అయితే మొదటి రంగుకు తిరిగి వెళ్లాలి; లేకపోతే `1` పెంచాలి.

దీన్ని `if` statement తో చేయవచ్చు:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

ఈ code లో, `colors.count` అనేది array లోని elements సంఖ్యను సూచిస్తుంది.

ప్రస్తుత array లో `4` రంగులు ఉన్నాయి, కాబట్టి:

```swift
colors.count // 4
```

కాని గరిష్ఠ index `4` కాదు, `3`; ఎందుకంటే index `0` నుండి ప్రారంభమవుతుంది.

అందువల్ల చివరి index ను ఇలా రాస్తాము:

```swift
colors.count - 1
```

అంటే:

```swift
4 - 1 = 3
```

ఈ logic యొక్క అర్థం ఏమిటంటే, ప్రస్తుత index ఇప్పటికే చివరి రంగును సూచిస్తే దాన్ని `0` గా reset చేయాలి; లేకపోతే `1` పెంచాలి.

ఈ విధంగా, రంగులను loop లో మార్చవచ్చు.

### index ను సరళీకరించడం

code ను ఇంకా సరళంగా రాయాలంటే, ternary operator ను ఉపయోగించవచ్చు:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

ఈ code అంటే: `index == colors.count - 1` నిజమైతే `0` ను return చేస్తుంది. కాకపోతే `index + 1` ను return చేస్తుంది.

చివరగా, ఆ result మళ్లీ `index` కు assign చేయబడుతుంది.

ఇప్పుడు, రంగు మారే effect ను అమలు చేయవచ్చు.

పూర్తి code:

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

ఇప్పుడు స్క్రీన్‌ను తట్టి వేర్వేరు రంగులకు మారవచ్చు, ఒక ప్రాథమిక fill light యాప్ పూర్తవుతుంది.

## రంగు పేరును చూపించడం

రంగులకు సరిపోయే text సమూహాన్ని కూడా జోడించవచ్చు. అప్పుడు రంగు మారినప్పుడు, స్క్రీన్‌పై ప్రస్తుత రంగు పేరు కూడా ఒకేసారి కనిపిస్తుంది.

ఉదాహరణకు:

- ఎరుపు ఉన్నప్పుడు `Red`
- నీలం ఉన్నప్పుడు `Blue`
- పసుపు ఉన్నప్పుడు `Yellow`
- ఊదా ఉన్నప్పుడు `Purple`

ఇక్కడ కూడా రంగు పేర్లను నిల్వ చేయడానికి array ను ఉపయోగించవచ్చు:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

ఈ array లోని text ల క్రమం, రంగుల array లోని క్రమానికి సరిపోవాలి.

తర్వాత, ప్రస్తుత index కు సరిపోయే రంగు పేరును `Text` తో చూపించవచ్చు:

```swift
Text(colorsName[index])
```

`Text`, `index` ఆధారంగా ప్రస్తుత రంగు పేరును చూపిస్తుంది.

`Text` యొక్క appearance ను modifiers తో మెరుగుపరచవచ్చు:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

ఈ విధంగా `Text` తెలుపు రంగులో, పెద్ద title style లో, bold font తో కనిపిస్తుంది.

ఇప్పుడు మన దగ్గర full-screen `Color` view ఉంది. `Text` దాని పైన కనిపించాలంటే, `ZStack` layout container ను ఉపయోగించాలి.

```swift
ZStack {
    Color
    Text
}
```

అందువల్ల code ఇలా మారుతుంది:

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

ఈ విధంగా, background లో రంగు view ఉంటుంది, దాని పైన text view కనిపిస్తుంది.

ఫలితం:

![Color](../../Resource/018_color2.png)

గమనించాల్సిన విషయం ఏమిటంటే, `ZStack` లో తరువాత రాసిన view సాధారణంగా ముందు కనిపిస్తుంది. `Text` ను `Color` కంటే ముందు రాస్తే, తరువాత వచ్చే `Color` view దాన్ని కప్పివేయవచ్చు.

## brightness ను నియంత్రించడం

ఇప్పుడు వేర్వేరు రంగులకు మారగలుగుతున్నాం. కానీ fill light లో ఇంకో ముఖ్యమైన feature ఉంది: **brightness ను సర్దుబాటు చేయడం**.

SwiftUI లో, view యొక్క brightness ను మార్చడానికి `brightness` modifier ను ఉపయోగించవచ్చు.

ఉదాహరణకు:

```swift
.brightness(1)
```

మనము ఇలా రాయవచ్చు:

```swift
colors[index]
    .brightness(0.5)
```

ఈ విధంగా ప్రస్తుత రంగు మరింత ప్రకాశవంతంగా కనిపిస్తుంది, fill light effect కు దగ్గరగా ఉంటుంది.

`brightness` పరిధి `0 - 1`. `0` అంటే అసలు రంగు అలాగే ఉండటం. `1` కు దగ్గరవుతున్న కొద్దీ రంగు మరింత ప్రకాశవంతమవుతుంది; `1` అంటే గరిష్ఠ తెల్లని brightness.

code లో `brightness` ను నియంత్రించగలిగినా, user స్వయంగా దీన్ని ఇంకా మార్చలేడు.

అందుకోసం drag చేయగల ఒక control అవసరం: `Slider`.

## Slider view

SwiftUI లో, `Slider` అనేది ఒక range లో value ను ఎంచుకోవడానికి ఉపయోగించే control. Apple documentation దీనిని “a control for selecting a value from a bounded linear range” అని వివరిస్తుంది.

ప్రాథమిక ఉపయోగం:

```swift
Slider(value: $value, in: 0...1)
```

parameters వివరణ:

1. `value: $value`: `Slider` ఒక variable కు bind చేయాలి.

    slider ను drag చేసినప్పుడు, ఆ variable యొక్క value కూడా అదే సమయంలో మారుతుంది. తిరిగి variable మారితే, slider కూడా update అవుతుంది.

    ఇది మనం ముందుగా నేర్చుకున్న `TextField` లాంటిదే; రెండింటిలోనూ “control ను ఒక variable కు bind చేయడం” అనే అంశం ఉంటుంది.
    
    bind చేసిన variable ముందు `$` symbol ను జోడించాలి. అది binding ను సూచిస్తుంది.

2. `in: 0...1`: ఈ parameter slider యొక్క value range ను సూచిస్తుంది.

    ఇక్కడ `0...1` అంటే కనిష్ఠ విలువ `0`, గరిష్ఠ విలువ `1`.

    slider ను ఎడమవైపు చివరికి drag చేస్తే bind చేసిన variable `0` కు దగ్గరగా ఉంటుంది; కుడివైపు చివరికి drag చేస్తే `1` కు దగ్గరగా ఉంటుంది.

ఉదాహరణకు:

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

`Slider`, `value` variable కు bind చేయబడింది. కాబట్టి slider ను drag చేసినప్పుడు, `value` కూడా అదే సమయంలో మారుతుంది.

రూపం:

![Slider](../../Resource/018_slider.png)

`Slider` ఎడమవైపున ఉంటే bind చేసిన `value` `0` అవుతుంది; కుడివైపున ఉంటే అది `1` అవుతుంది.

### value range

`Slider` యొక్క value range స్థిరమైనది కాదు. దాన్ని ఇలా కూడా రాయవచ్చు:

```swift
0...100
```

లేదా మరేదైనా range గా ఉపయోగించవచ్చు.

కానీ ఈ fill light యాప్‌లో మనం brightness ను నియంత్రించాలి కాబట్టి, `0...1` అత్యంత సరైనది.

## Slider తో brightness నియంత్రించడం

ఇప్పుడు `Slider` మరియు `brightness` ను కలపబోతున్నాం.

మొదట, brightness value ను నిల్వ చేయడానికి ఒక variable సృష్టిద్దాం:

```swift
@State private var slider = 0.0
```

ఇక్కడ `0.0` ఒక `Double` type value.

`Slider` సాధారణంగా numeric type కు bind చేయబడుతుంది. ఇక్కడ value నిరంతరం మారాలని మనకు కావాలి కాబట్టి `Double` మరింత సరైనది. అంతేకాదు, `brightness` కూడా `Double` type value నే అంగీకరిస్తుంది.

తర్వాత ఈ value ను `brightness` కు పంపవచ్చు:

```swift
colors[index]
    .brightness(slider)
```

`slider == 0` అయితే, రంగు default స్థితిలో ఉంటుంది. `slider` `1` కు దగ్గరవుతున్న కొద్దీ, రంగు మరింత ప్రకాశంగా కనిపిస్తుంది.

### Slider control ను జోడించడం

తర్వాత, ఈ variable ను మార్చడానికి ఒక `Slider` control ను జోడిద్దాం:

```swift
Slider(value: $slider, in: 0...1)
```

slider మారినప్పుడు, `slider` value కూడా మారుతుంది; అదే సమయంలో `brightness(slider)` brightness ను update చేస్తుంది.

ఇది SwiftUI లో చాలా సాధారణమైన “variable drives the view” అనే విధానానికి మంచి ఉదాహరణ.

### Slider appearance ను సర్దుబాటు చేయడం

సాధారణంగా, `Slider` అందుబాటులో ఉన్న స్థలానికి అనుగుణంగా తన width ను నిర్ణయిస్తుంది.

దానికి ఒక fixed width ఇవ్వవచ్చు:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

తర్వాత ఇది స్పష్టంగా కనిపించేందుకు కొన్ని modifiers ను జోడిద్దాం:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

ఈ విధంగా slider కు తెలుపు background మరియు rounded corners వస్తాయి, కాబట్టి `Color` view పై ఇది మరింత స్పష్టంగా కనిపిస్తుంది.

చివరగా, దీన్ని స్క్రీన్ దిగువన ఉంచుదాం.

మనం ఇప్పటికే `ZStack` ఉపయోగిస్తున్నందున, దానిలో ఒక `VStack` ను ఉంచి, `Spacer()` ద్వారా `Slider` ను దిగువకు నెట్టవచ్చు.

## పూర్తి code

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

ఫలితం:

![Color](../../Resource/018_color.png)

## సారాంశం

మనం ముందుగా నేర్చుకున్న జ్ఞానాన్ని, రంగులు మరియు array వంటి ప్రాథమిక భావాలతో కలిపి, చాలా ఆసక్తికరమైన fill light యాప్‌ను తయారు చేశాం.

ఈ fill light యాప్ ద్వారా, `brightness` ఉపయోగించి brightness ను సర్దుబాటు చేయడం, `onTapGesture` ద్వారా view కు tap action జోడించడం, అలాగే `Slider` view control ను ఉపయోగించడం నేర్చుకున్నాం.

`Color` view కు `onTapGesture` జోడించి, రంగులు మార్చే feature ను అమలు చేశాం. `Slider` control ద్వారా ఒక variable ను నియంత్రించి `brightness` ను నిర్వహించాం; దీని ద్వారా రంగు యొక్క ప్రకాశాన్ని సర్దుబాటు చేసాం. ఇదీ “variable drives the view” అనే భావనకు ఒక ఉదాహరణ.

మనం ternary operator ను మళ్లీ చూశాం, view లను overlay చేయడానికి `ZStack` ను ఉపయోగించాం, అలాగే ఒకే రకమైన డేటా సమూహాన్ని నిర్వహించడానికి array ను ఉపయోగించాం. దీని వల్ల array మరియు index పై మన అవగాహన మరింత లోతుగా మారింది; అలాగే ప్రాక్టికల్‌గా index out of range సమస్యను కూడా పరిగణనలోకి తీసుకున్నాం.

ఈ ఉదాహరణ క్లిష్టమైనది కాదు. కానీ ముందుగా నేర్చుకున్న అనేక ప్రాథమిక భావాలను ఇది ఒకచోట కలుపుతుంది. ఒక చిన్న నిజ జీవిత project లో వాటిని ఉపయోగించినప్పుడు, ప్రతి భావన ఎందుకు ఉపయోగపడుతుందో ఇంకా సులభంగా అర్థమవుతుంది.

### నిజ జీవిత వినియోగ దృశ్యం

ఒక పాత iPhone ను టేబుల్‌పై పెట్టి, మీరు తయారుచేసిన fill light యాప్‌తో వెలుతురు రంగును నియంత్రిస్తున్నారని ఊహించుకోండి. అది చాలా మంచి అనుభవం అవుతుంది.

App Store లో చాలా “fill light” యాప్‌లు కనిపిస్తాయి; అవి కూడా చాలా క్లిష్టంగా కనిపించవు.

![AppStore](../../Resource/018_appStore.PNG)

మనము సరళమైన యాప్‌లతో ప్రారంభించి, వాటిని App Store లో విడుదల చేయడానికి ప్రయత్నించవచ్చు. అది development పై మన ఆసక్తిని పెంచడమే కాకుండా, మన ఎదుగుదల ప్రయాణాన్ని కూడా నమోదు చేస్తుంది.

### పాఠం తర్వాత వ్యాయామం

ఈ fill light యాప్‌ను ఇంకా ఎలా విస్తరించవచ్చో మీరు ఆలోచించవచ్చు. ఉదాహరణకు:

- ఇంకా ఎక్కువ రంగులను జోడించండి
- ప్రస్తుత brightness value ను చూపించండి
- దిగువనున్న slider ప్రాంతం రూపాన్ని మెరుగుపరచండి

మీరు ఈ ప్రాథమిక జ్ఞానాన్ని నిజంగా ఉపయోగించడం ప్రారంభించినప్పుడు, మనం నేర్చుకునే ప్రతి జ్ఞాన భాగమూ యాప్ అభివృద్ధికి ఒక సాధనం అని మీరు గుర్తిస్తారు.
