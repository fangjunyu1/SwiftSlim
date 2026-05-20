# ఫోటో గ్యాలరీ

ఈ పాఠంలో, మనం ఒక ఫోటో గ్యాలరీ పేజీని తయారు చేస్తాము.

![view](../../../Resource/032_view13.png)

ఈ ఉదాహరణలో, మనం `extension`, `self` మరియు instance గురించి తెలిసిన విషయాలను మళ్లీ పరిశీలించి, SwiftUI లో తరచుగా ఉపయోగించే `Shape` ఆకారాలను నేర్చుకుంటాము.

ఈ జ్ఞానంతో, సాధారణ చిత్రాలను వృత్తం, rounded rectangle, capsule, ellipse వంటి భిన్నమైన శైలులుగా కత్తిరించవచ్చు, అలాగే ఫోటోలకు border ప్రభావాన్ని జోడించవచ్చు.

ఈ పాఠంలో కొన్ని కొత్త జ్ఞాన బిందువులు ఉపయోగిస్తాము: `Shape`, `clipShape`, `strokeBorder` మరియు `overlay`.

వాటిలో, `clipShape` view ఆకారాన్ని కత్తిరించడానికి ఉపయోగిస్తారు, `strokeBorder` ఆకారానికి border గీయడానికి ఉపయోగిస్తారు, `overlay` view పైన కొత్త view ను పొరలా జోడించడానికి ఉపయోగిస్తారు.

## చిత్ర వనరులు

ప్రారంభించే ముందు, మనం కొన్ని చిత్రాలను సిద్ధం చేయాలి.

మీరు మీ స్వంత ఫోటోలను ఉపయోగించవచ్చు, లేదా ఈ పాఠంలో ఇచ్చిన నమూనా చిత్రాలను ఉపయోగించవచ్చు.

ఈ పాఠంలోని ఫోటో ఉదాహరణలు [Pixabay](https://pixabay.com/) వెబ్‌సైట్ నుండి తీసుకోబడ్డాయి:

[ప్రకృతి దృశ్యం](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[నక్క](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[భవనం](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[పూలు](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[హంస](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

చిత్రాలను డౌన్‌లోడ్ చేసిన తర్వాత, వాటిని `Assets` resource folder లోకి జోడించి, వరుసగా `1`, `2`, `3`, `4`, `5` అని పేర్లు పెట్టండి.

![assets](../../../Resource/032_view17.png)

ఇలా చేస్తే, SwiftUI లో `Image("1")`, `Image("2")` వంటి విధంగా చిత్రాలను చూపించవచ్చు.

## ఫోటోలను చూపించడం

మొదట, మనం `ContentView` లో 5 ఫోటోలను చూపిస్తాము:

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

ప్రదర్శన ఫలితం:

![view](../../../Resource/032_view.png)

ఈ కోడ్‌లో, మనం `ScrollView` ఉపయోగించి ఫోటో జాబితాను scroll చేయగల విధంగా చూపిస్తాము, అలాగే `VStack` ఉపయోగించి అనేక చిత్రాలను పై నుండి కిందకు అమర్చుతాము.

ప్రతి చిత్రం `.resizable()`, `.scaledToFit()` మరియు `.frame(width: 300)` ద్వారా display effect ను సెట్ చేస్తుంది. ఇలా చేస్తే చిత్రం పరిమాణం మారగలదు, అసలు నిష్పత్తిని కాపాడుకుంటూ పూర్తిగా కనిపిస్తుంది, అలాగే చిత్ర వెడల్పు పరిమితం అవుతుంది.

`VStack` పై ఉన్న `.padding(.vertical, 100)` పైకీ కిందకీ spacing పెంచడానికి ఉపయోగిస్తారు, తద్వారా మొదటి ఫోటో మరియు చివరి ఫోటో screen edge కి చాలా దగ్గరగా ఉండవు.

చివరలో ఉన్న `.ignoresSafeArea()` అంటే scroll view safe area ను పట్టించుకోకుండా ఉండటాన్ని సూచిస్తుంది. ఫోటోలు scroll అవుతున్నప్పుడు అవి screen పైభాగం మరియు కిందభాగం వరకు విస్తరించగలవు, అందువల్ల పేజీ మరింత పూర్తిగా కనిపిస్తుంది.

అయితే, ఇప్పుడు 5 చిత్రాలన్నీ ఒకే modifiers ను ఉపయోగిస్తున్నాయి:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

ఇలాంటి పునరావృత కోడ్ కనిపించినప్పుడు, దానిని `extension` తో సర్దుబాటు చేయాలని ఆలోచించవచ్చు.

## extension తో చిత్రం శైలిని సర్దుబాటు చేయడం

మనము `Image` కు ఫోటో గ్యాలరీకి ప్రత్యేకమైన ఒక method ను విస్తరించవచ్చు:

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

ఇక్కడ, మనం `Image` type కు `photoGalleryStyle` అనే method ను విస్తరించాము.

ఈ method లో ముందు పునరావృతంగా ఉపయోగించిన `.resizable()`, `.scaledToFit()` మరియు `.frame(width: 300)` ఉన్నాయి. అంటే, ఇది చిత్రం scaling, proportional display మరియు width setting కోడ్‌లను ఒకచోట చేర్చుతుంది.

ఈ extension ఉపయోగించిన తర్వాత, అసలు చిత్రం కోడ్:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

ఇలా సరళీకరించవచ్చు:

```swift
Image("1")
    .photoGalleryStyle()
```

ఇలా ప్రతి చిత్రం కేవలం `.photoGalleryStyle()` ను పిలిస్తే చాలు, అదే ఫోటో గ్యాలరీ శైలి వర్తిస్తుంది. కోడ్ మరింత సంక్షిప్తంగా ఉంటుంది, తరువాత ఒకేసారి మార్చుకోవడమూ సులభం అవుతుంది.

## self ను అర్థం చేసుకోవడం

extension method లో, మనం `self` అని వ్రాశాము:

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

ఇక్కడ `self` అంటే, ఈ method ను పిలుస్తున్న ప్రస్తుత image instance.

ఉదాహరణకు:

```swift
Image("1")
    .photoGalleryStyle()
```

ఈ కోడ్‌లో, `photoGalleryStyle()` ను `Image("1")` పిలుస్తోంది. కాబట్టి method లోని `self` ఈ `Image("1")` చిత్రాన్నే సూచిస్తుంది.

సులభంగా అర్థం చేసుకోవాలంటే: ఈ method ను ఎవరు పిలుస్తారో, `self` వాళ్లనే సూచిస్తుంది.

గమనించాల్సిన విషయం ఏమిటంటే, SwiftUI modifiers వరుసగా కొత్త view result ను తిరిగి ఇస్తుంటాయి. అందువల్ల `photoGalleryStyle()` తిరిగి ఇచ్చేది modifier చేసిన view, కేవలం అసలు `Image` మాత్రమే కాదు.

## ఫోటో ఆకారాలు

ఇప్పుడు, ఫోటోలు సాధారణంగా కనిపిస్తున్నాయి. కానీ ఈ ఫోటోలు default గా rectangle రూపంలో ఉంటాయి, అందువల్ల కొంచెం సాధారణంగా కనిపిస్తాయి.

కేవలం ఫోటోలకు rounded corners ఇవ్వాలనుకుంటే, నేరుగా `.cornerRadius()` ఉపయోగించవచ్చు:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

ప్రదర్శన ఫలితం:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` అంటే చిత్రానికి `20 pt` rounded corner జోడించడం. సాధారణ rounded image కోసం ఈ విధానం సరిపోతుంది.

అయితే, `.cornerRadius()` కేవలం rounded corner effect ను మాత్రమే పరిష్కరిస్తుంది, సాధారణ rounded images తయారికి ఇది అనుకూలం. మనం ఫోటోలను ఇంకా ఎక్కువ భిన్నమైన ఆకారాలుగా మార్చాలనుకుంటే, ఈ modifier మాత్రమే సరిపోదు.

ఈ సమయంలో SwiftUI లోని `Shape` ను ఉపయోగించాలి. `Shape` వేర్వేరు ఆకారాలను సూచించగలదు. దాన్ని `clipShape` తో కలిపితే, చిత్రాన్ని ఆ ఆకారానికి అనుగుణంగా కత్తిరించవచ్చు.

## Shape పరిచయం

SwiftUI లో, `Shape` ఆకారాన్ని సూచిస్తుంది. ఇది `View` లాగే SwiftUI లో చాలా తరచుగా ఉపయోగించే type.

సాధారణ `Shape` లలో circle, rectangle, rounded rectangle, capsule మరియు ellipse ఉన్నాయి. వేర్వేరు ఆకారాల రూపాన్ని మరింత స్పష్టంగా గమనించడానికి, కింది ఉదాహరణల్లో ప్రతి ఆకారానికి వేర్వేరు రంగు మరియు పరిమాణం ఇస్తాము.

ఈ ఉదాహరణల్లో, `.fill()` ఆకారానికి రంగు నింపడానికి ఉపయోగిస్తారు, `.frame()` ఆకారం చూపబడే పరిమాణాన్ని సెట్ చేయడానికి ఉపయోగిస్తారు. రంగు కేవలం వేర్వేరు ఆకారాలను గుర్తించడానికి మాత్రమే; అది ఆ ఆకారం యొక్క శాశ్వత రంగు కాదు.

### Circle వృత్తం

`Circle` వృత్తాన్ని సూచిస్తుంది. ఇది avatar, round button, round image వంటి interface effects కోసం తరచుగా ఉపయోగిస్తారు.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle చతురస్రాకారం

`Rectangle` rectangle ను సూచిస్తుంది. ఇది అత్యంత ప్రాథమికమైన ఆకారాల్లో ఒకటి. background, separated area లేదా సాధారణ border తయారికి కూడా ఉపయోగించవచ్చు.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle గుండ్రని మూలల చతురస్రాకారం

`RoundedRectangle` rounded rectangle ను సూచిస్తుంది. `cornerRadius` rounded corner పరిమాణాన్ని సెట్ చేయడానికి ఉపయోగిస్తారు.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule క్యాప్సూల్ ఆకారం

`Capsule` capsule ఆకారాన్ని సూచిస్తుంది. దీని రెండు చివరలు వృత్తాకార వంకరలుగా ఉంటాయి. capsule buttons, tag backgrounds వంటి interface effects కోసం ఇది తరచుగా ఉపయోగిస్తారు.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse దీర్ఘవృత్తం

`Ellipse` ellipse ను సూచిస్తుంది. ఇది `Circle` కు దగ్గరగా ఉంటుంది, కానీ width మరియు height వేర్వేరుగా ఉన్నప్పుడు ellipse గా కనిపిస్తుంది.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

ఈ ఉదాహరణల ద్వారా, `Shape` స్వతహాగా నేరుగా ఆకారంగా కనిపించగలదని చూడవచ్చు. తర్వాత, మనం ఈ `Shape` లను `clipShape` తో కలిపి ఫోటోలను కత్తిరిస్తాము, తద్వారా ఫోటోలు వేర్వేరు ఆకారాల్లో కనిపిస్తాయి.

## clipShape తో ఫోటోలను కత్తిరించడం

ఇప్పుడు, మనం `clipShape` ఉపయోగించి ఫోటోలను వేర్వేరు ఆకారాలుగా కత్తిరించవచ్చు.

ఉదాహరణకు, మొదటి ఫోటోను వృత్తంగా కత్తిరించడం:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

ఈ కోడ్ అర్థం: ముందుగా ఒక చిత్రాన్ని చూపించి, తరువాత `Circle()` ఉపయోగించి దాన్ని వృత్తంగా కత్తిరించాలి.

![view](../../../Resource/032_view2.png)

`clipShape` యొక్క ప్రాథమిక రచన విధానం:

```swift
.clipShape(ఆకారం)
```

view తరువాత `.clipShape(...)` జోడించి, brackets లో కత్తిరించాలనుకున్న ఆకారాన్ని వ్రాయాలి.

ఉదాహరణకు:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

ఇప్పుడు, మనం 5 ఫోటోలను వరుసగా వేర్వేరు ఆకారాలుగా కత్తిరిస్తాము:

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

ప్రదర్శన ఫలితం:

![view](../../../Resource/032_view8.png)

ఇందులో, `Rectangle()` తో కత్తిరించిన తర్వాతి ప్రభావం సాధారణ rectangular photo కు దగ్గరగా ఉంటుంది, కాబట్టి దృశ్య మార్పు స్పష్టంగా ఉండదు. ఇది ప్రధానంగా ఇతర ఆకారాలతో పోల్చడానికి ఉపయోగిస్తాము.

ఇప్పుడు, ఫోటోలు ఇక సాధారణ rectangles మాత్రమే కావు; అవి వేర్వేరు ఆకారాలను కలిగి ఉన్నాయి.

## ఫోటో border జోడించడం

మనము వృత్తాకార ఫోటోకు border జోడించాలనుకుంటే, `border` ఉపయోగించాలని అనిపించవచ్చు:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

కానీ, ఇలా పొందే ఫలితం సాధారణంగా వృత్తాకార border కాదు; అది rectangular border అవుతుంది.

![view](../../../Resource/032_view9.png)

దీనికి కారణం, `border` view యొక్క rectangular area ప్రకారం border జోడిస్తుంది, `clipShape` ద్వారా కత్తిరించిన ఆకారం ప్రకారం కాదు.

కాబట్టి, మనకు వృత్తాకార border కావాలంటే, `border` ను నేరుగా ఉపయోగించకూడదు.

## strokeBorder తో ఆకార border గీయడం

SwiftUI లో, `strokeBorder` ఈ సాధారణ `Shape` లకు లోపలి border గీయగలదు.

ఉదాహరణకు, ఒక circular border గీయడం:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

ఈ కోడ్ అర్థం: `Circle` కు brown border గీయాలి, border width `10 pt`.

![view](../../../Resource/032_view12.png)

ఇక్కడ గమనించాల్సిన విషయం ఏమిటంటే, `strokeBorder` నేరుగా ఫోటోకు border జోడించదు; అది `Circle()` అనే ఆకారానికి border గీయుతుంది.

అంటే, ఈ కోడ్ ద్వారా పొందేది ఒక స్వతంత్ర circular border మాత్రమే; అది ఇంకా ఫోటోతో సంబంధం కలిగి లేదు.

ఈ circular border ఫోటో పైన కనిపించాలంటే, `overlay` ను కొనసాగించి ఉపయోగించాలి, border ను ఫోటోపై పొరలా జోడించాలి.

## overlay తో border ను పొరలా జోడించడం

`overlay` ఒక view modifier. ఇది ప్రస్తుత view పైన కొత్త view ను పొరలా జోడించగలదు.

దాని ప్రాథమిక నిర్మాణాన్ని ఇలా అర్థం చేసుకోవచ్చు:

```swift
ప్రస్తుత view
    .overlay {
        పొరగా జోడించబడే view
    }
```

ఈ ఉదాహరణలో, ప్రస్తుత view ఇప్పటికే వృత్తంగా కత్తిరించిన ఫోటో:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

మనము పైకి పొరలా జోడించాలనుకునే కొత్త view ఒక circular border:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

అందువల్ల, ఫోటో మరియు border ను ఇలా కలపవచ్చు:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

ఇక్కడ `overlay` అంటే ప్రస్తుత view పైన కొత్త view ను పొరలా జోడించడం.

`overlay` లో, border ప్రస్తుత ఫోటో display range ను అనుసరించి పొరలా అమరుతుంది. కాబట్టి మళ్లీ వేరుగా `frame` సెట్ చేయాల్సిన అవసరం లేదు. border shape మరియు clipping shape ఒకేలా ఉంటే, border ఫోటోకు సరిపోతుంది.

![view](../../../Resource/032_view10.png)

చివరి ఫలితం ఏమిటంటే, వృత్తాకార ఫోటో పైన ఒక circular border కప్పబడుతుంది.

`ZStack` తో పోల్చితే, `overlay` “ప్రస్తుత view కు decoration జోడించడం” వంటి సందర్భాలకు మరింత అనుకూలం. ఫోటో ప్రధాన భాగం, border కేవలం అదనపు effect. అందువల్ల `overlay` ఉపయోగించడం మరింత స్పష్టంగా ఉంటుంది.

## ఫోటో గ్యాలరీని పూర్తి చేయడం

ఇప్పుడు, ప్రతి ఫోటోకు సరిపడే ఆకారం మరియు border జోడిద్దాం:

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

ప్రదర్శన ఫలితం:

![view](../../../Resource/032_view13.png)

ఇలా, ఒక ప్రాథమిక ఫోటో గ్యాలరీ పేజీ పూర్తయింది.

ఈ పేజీలో, మనం `ScrollView` ఉపయోగించి scrolling display సాధించాము, `Image` తో ఫోటోలను చూపించాము, `clipShape` తో ఫోటో ఆకారాలను కత్తిరించాము, అలాగే `overlay` మరియు `strokeBorder` ద్వారా border జోడించాము.

## పూర్తి కోడ్

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

## సారాంశం

ఈ పాఠంలో, మనం ఒక ఫోటో గ్యాలరీ పేజీని పూర్తి చేశాము.

![view](../../../Resource/032_view13.png)

ఈ ఉదాహరణలో, మనం ముందుగా `Image` ఉపయోగించి ఫోటోలను చూపించాము. తరువాత `extension` ద్వారా `Image` కు `photoGalleryStyle` method ను విస్తరించాము, పునరావృతమైన image style code ను సర్దుబాటు చేయడానికి.

తరువాత, SwiftUI లోని సాధారణ `Shape` లను నేర్చుకున్నాము, ఉదాహరణకు `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` మరియు `Ellipse`. ఈ ఆకారాలు నేరుగా చూపించడమే కాకుండా, `clipShape` తో కలిసి view ను కత్తిరించడానికి కూడా ఉపయోగించవచ్చు.

ఉదాహరణకు:

```swift
.clipShape(Circle())
```

అంటే view ను వృత్తంగా కత్తిరించడం.

చివరగా, మనం `overlay` మరియు `strokeBorder` ఉపయోగించి ఫోటోలకు corresponding shape border జోడించాము. గమనించాల్సింది ఏమిటంటే, `border` సాధారణంగా view యొక్క rectangular area ప్రకారం border గీయుతుంది. border వృత్తం, capsule లేదా ellipse ను అనుసరించాలని ఉంటే, అదే `Shape` ను పొరలా జోడించడం మరింత అనుకూలం.

ఈ పాఠం ద్వారా, మనం ఫోటో గ్యాలరీ effect ను మాత్రమే పూర్తి చేయలేదు, interface లో `Shape`, `clipShape`, `strokeBorder` మరియు `overlay` కలిసి ఉపయోగించే సాధారణ విధానాన్ని కూడా అర్థం చేసుకున్నాము.

## పాఠం తరువాత వ్యాయామాలు

### 1、ఫోటో గ్యాలరీ background జోడించడం

ఫోటో గ్యాలరీ పేజీకి full-screen background image జోడించండి.

అవసరం: background image మొత్తం screen ను నింపాలి, safe area ను ignore చేయాలి.

### 2、gradient border

ఇప్పటికే ఉన్న single-color border ను linear gradient border గా మార్చండి.

మరింత సమృద్ధిగా కనిపించే border effect కోసం `LinearGradient` ఉపయోగించి ప్రయత్నించవచ్చు.

### 3、నిజమైన ఫోటో border ను అనుకరించడం

ఇంటర్నెట్‌లో కొన్ని నిజమైన photo border styles కోసం search చేసి, `overlay` తో image border ను పొరలా జోడించడానికి ప్రయత్నించండి. ఫోటో నిజమైన frame effect కు దగ్గరగా కనిపించేలా చేయండి.

వ్యాయామ ప్రదర్శన ఫలితం:

![button](../../../Resource/032_view15.jpeg)

### 4、rounded button border అమలు చేయడం

ప్రాక్టికల్ development లో, buttons తరచుగా rounded rectangle border ఉపయోగిస్తాయి.

ఒక rounded button తయారు చేసి, `RoundedRectangle` మరియు `strokeBorder` ఉపయోగించి button కు rounded border జోడించడానికి ప్రయత్నించండి.

వ్యాయామ ప్రదర్శన ఫలితం:

![button](../../../Resource/032_view14.png)

### ఆలోచన ప్రశ్న

single-color border కూడా కాదు, gradient border కూడా కాదు; border ఒక విధమైన pattern effect చూపించాలని ఉంటే, దాన్ని ఎలా అమలు చేయాలి?

`overlay`, `mask` లేదా `ImagePaint` వంటి సంబంధిత usages గురించి తెలుసుకోవడానికి 자료ాలు search చేయవచ్చు.

వ్యాయామ ప్రదర్శన ఫలితం:

![button](../../../Resource/032_view16.png)
