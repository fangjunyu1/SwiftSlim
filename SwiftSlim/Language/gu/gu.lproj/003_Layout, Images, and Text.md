# લેઆઉટ, ચિત્રો અને લખાણ

પાછલા પાઠમાં આપણે `ContentView` નો કોડ શીખ્યો હતો:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

આ પાઠમાં આપણે SwiftUI ની મૂળભૂત layout વ્યવસ્થા, તેમજ images અને text નો ઉપયોગ શીખીશું. અગાઉના પાઠને આધારે view ની રચના અને display કેવી રીતે કાર્ય કરે છે તે વધુ સારી રીતે સમજશું. આ જ્ઞાનથી આપણે મૂળભૂત UI layouts બનાવી શકીશું.

## SwiftUI ની મૂળભૂત layout વ્યવસ્થા

જ્યારે આપણે `ContentView` preview કરીએ છીએ, ત્યારે આપણે જોયું કે આયકોન અને લખાણ મધ્યમાં દેખાય છે, ઉપરથી શરૂ થતાં નથી.

![Swift](../../RESOURCE/003_view.png)

મૂલભૂત રીતે `Stack` container નું alignment `.center` હોય છે, એટલે child views સામાન્ય રીતે centered effect સાથે દેખાય છે.

### `Alignment` ગોઠવણી

કેન્દ્ર ગોઠવણી alignment નો માત્ર એક પ્રકાર છે. જો આપણે ડાબી બાજુ કે જમણી બાજુ ગોઠવણી ઇચ્છીએ, તો `alignment` નો ઉપયોગ કરીને view ની ગોઠવણી નિયંત્રિત કરવી પડે.

```swift
alignment
```

SwiftUI માં alignment સામાન્ય રીતે બે સ્થિતિમાં દેખાય છે:

**1. `Stack` container નો alignment parameter**

ઉદાહરણ તરીકે, `ContentView` માં આયકોન અને લખાણને ડાબી બાજુ ગોઠવવું:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack` નો `alignment` horizontal direction નું alignment નિયંત્રિત કરે છે.

ગોઠવણીના વિકલ્પો:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` horizontal layout છે, એટલે તેનો `alignment` vertical direction નિયંત્રિત કરે છે:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` overlap layout છે, એટલે `alignment` horizontal અથવા vertical બંને દિશામાં નિયંત્રિત કરી શકે છે:

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

જો `alignment` સ્પષ્ટ રીતે ન આપીએ, તો `VStack`, `HStack`, અને `ZStack` ડિફોલ્ટ તરીકે `.center` વાપરે છે.

**2. `frame` ની અંદરનું alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

જ્યારે `frame` view ની પોતાની સાઇઝ કરતાં મોટું હોય, ત્યારે `alignment` તે `frame` ની અંદર view ક્યાં ગોઠવાશે તે નક્કી કરે છે. `frame` નો વિગતવાર ઉપયોગ આપણે આગળ જોઈશું; અત્યારે ફક્ત પ્રાથમિક સમજ પૂરતી છે.

### `Spacer` અને જગ્યા વહેંચણી

`alignment` views ને horizontal કે vertical ક્રમમાં ગોઠવી શકે છે. પણ, જ્યારે આપણે લખાણ અને ચિત્રને બે છેડે દેખાડવા માંગીએ, ત્યારે ફક્ત alignment પૂરતું નથી.

ઉદાહરણ તરીકે, જો આપણે [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) વેબસાઇટના ટોચના view જેવી રચના બનાવવા માંગીએ, જેમાં ડાબી બાજુ NHK નો લોગો હોય અને જમણી બાજુ menu icon હોય:

![Swift](../../RESOURCE/003_alignment3.png)

જો આપણે ફક્ત alignment નો જ ઉપયોગ કરીએ, તો NHK લોગો અને menu icon એક જ બાજુએ દેખાશે. બંનેને ડાબે-જમણે વહેંચી શકાશે નહીં, તેથી બાકી જગ્યા વહેંચવા માટે `Spacer` ની જરૂર પડે છે.

`Spacer` એ layout માટેની એક flexible view છે, જે આપમેળે બાકી રહેલી જગ્યા ભરે છે.

ઉપયોગ:

```swift
Spacer()
```

ઉદાહરણ તરીકે:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

જ્યારે આપણે `Image` અને `Text` વચ્ચે `Spacer` ઉમેરીએ છીએ, ત્યારે `Spacer` બાકી જગ્યા ભરી દે છે અને `Image` ને ઉપર તથા `Text` ને નીચે ધકેલી દે છે.

![Swift](../../RESOURCE/003_view1.png)

જો ઘણા `Spacer` હોય:

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

તો બાકી જગ્યા `Spacer` વચ્ચે સમાન રીતે વહેંચાય છે.

![Swift](../../RESOURCE/003_spacer.png)

## `Image` નું પ્રદર્શન અને કદ નિયંત્રણ

`Image` view નો મુખ્ય ઉપયોગ ચિત્ર દર્શાવવા માટે થાય છે. અગાઉના પાઠમાં શીખેલા `SF Symbols` આયકોન એ `Image` નો ફક્ત એક ઉપયોગ છે.

ઉપયોગ:

```swift
Image("imageName")
```

ડબલ quotesની અંદર image નું નામ હોય છે; extension લખવાની જરૂર નથી.

### ચિત્ર દર્શાવવું

સૌપ્રથમ, આપણે એક ચિત્ર તૈયાર કરીએ.

![Swift](../../RESOURCE/003_img.jpg)

Xcode માં `Assets` resource folder પસંદ કરો અને ચિત્રને તેમાં drag કરો.

![Swift](../../RESOURCE/003_img1.png)

પછી `ContentView` માં `Image` નો ઉપયોગ કરીને ચિત્ર બતાવો:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

નોંધ: SwiftUI નું `Image` GIF animation ચલાવી શકતું નથી; તે ફક્ત static frame બતાવે છે.

### ચિત્રનું કદ નિયંત્રિત કરવું

SwiftUI માં `Image` મૂળભૂત રીતે મૂળ image size પર જ દેખાય છે. જો display size બદલવી હોય, તો પહેલાં `resizable` નો ઉપયોગ કરીને image ને scalable બનાવવું પડે, અને પછી `frame` થી layout size નક્કી કરવી પડે.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### `resizable` modifier

`resizable` modifier image ને layout માં scale થવામાં મદદ કરે છે, એટલે image હંમેશા માત્ર મૂળ કદ પર બંધાઈને નથી રહેતું.

```swift
.resizable()
```

ફક્ત `resizable()` ઉમેર્યા પછી જ `frame` image ના actual display size ને બદલી શકે છે.

જો `resizable` છોડીને લખીએ:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

તો `frame` ફક્ત layout space આપે છે, પરંતુ image પોતે કદ બદલતું નથી.

### `frame` modifier

`frame(width:height)` view ની width અને height નક્કી કરવા માટે છે.

મૂલભૂત ઉપયોગ:

```swift
.frame(width: 10,height: 10)
```

ઉદાહરણ તરીકે, image ને width `300` અને height `100` ધરાવતા rectangle માં દર્શાવવું:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

અથવા ફક્ત width અથવા height અલગથી પણ નક્કી કરી શકાય:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` નું સંયોજન UI માં image ની display size ને લવચીક રીતે નિયંત્રિત કરી શકે છે અને તેને scalable પણ રાખે છે.

### સ્કેલિંગનો પ્રમાણ: `scaledToFit` અને `scaledToFill`

જ્યારે `frame` ની width અને height નું પ્રમાણ image ના મૂળ પ્રમાણથી જુદું હોય, ત્યારે image ખેંચાઈને વિકૃત થઈ શકે છે.

જો આપણે image નું મૂળ પ્રમાણ જાળવી રાખીને તેને ઉપલબ્ધ layout જગ્યા પ્રમાણે ફિટ કરવું હોય, તો `scaledToFit` અથવા `scaledToFill` નો ઉપયોગ કરી શકાય.

**`scaledToFit`**

`scaledToFit` image નું મૂળ width-height ratio જાળવે છે અને image ને ઉપલબ્ધ જગ્યા અંદર સંપૂર્ણ રીતે ફિટ કરે છે, કોઈ cropping કર્યા વગર:

```swift
.scaledToFit()
```

અથવા

```swift
.aspectRatio(contentMode: .fit)
```

આ પદ્ધતિ તેવા દૃશ્યો માટે યોગ્ય છે જ્યાં image સંપૂર્ણ રીતે દેખાવું જોઈએ અને વિકૃતિ ન આવવી જોઈએ.

જો દરેક image માટે width અને height સરખી જ આપી દઈએ, તો image ખેંચાઈ જવાની શક્યતા રહે છે.

ઉદાહરણ તરીકે:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

સ્કેલિંગ પ્રમાણ ન ગોઠવીએ તો image મૂળ સ્વરૂપમાં દેખાતું નથી.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` સેટ કરવાથી image પોતાનું મૂળ પ્રમાણ જાળવે છે.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` પણ image નું પ્રમાણ જાળવે છે, પરંતુ તે સમગ્ર ઉપલબ્ધ જગ્યા ભરે છે. જો પ્રમાણ ન મેળ ખાતું હોય, તો વધારાનો ભાગ crop થાય છે:

```swift
.scaledToFill()
```

અથવા

```swift
.aspectRatio(contentMode: .fill)
```

આ પદ્ધતિ ત્યારે યોગ્ય છે જ્યારે image આખો વિસ્તાર ઢાંકી દેવી જોઈએ, જેમ કે background image અથવા banner.

**બન્ને વચ્ચેનો તફાવત**

![Swift](../../RESOURCE/003_img6.png)

## લખાણ

SwiftUI માં `Text` નો ઉપયોગ લખાણ દર્શાવવા માટે થાય છે.

મૂલભૂત ઉપયોગ:

```swift
Text("FangJunyu")
```

અગાઉના પાઠમાં આપણે `Text` શીખ્યા હતા. આ પાઠમાં આપણે વધુ આગળ જઈને font size અને font weight નિયંત્રિત કરવાની રીત શીખીશું, જેથી view માં લખાણ વધુ અસરકારક બને.

### ફોન્ટનું કદ

`font` modifier નો ઉપયોગ કરીને લખાણનું કદ નિયંત્રિત કરી શકાય છે:

```swift
.font(.title)
```

ઉદાહરણ તરીકે:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

સામાન્ય રીતે વપરાતાં font sizes (મોટા પરથી નાના સુધી):

```
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

### ફોન્ટની જાડાઈ

જો લખાણને bold કરવું હોય, તો `fontWeight` modifier વાપરી શકાય:

```swift
.fontWeight(.bold)
```

ઉદાહરણ તરીકે:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

સામાન્ય font weights (પાતળીથી જાડી સુધી):

```
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

`font` ફોન્ટનું કદ નિયંત્રિત કરે છે, અને `fontWeight` ફોન્ટની જાડાઈ નિયંત્રિત કરે છે. બન્નેને સાથે વાપરીને લખાણના દેખાવને વધુ સમૃદ્ધ બનાવવામાં આવે છે.

## સારાંશ અને પ્રેક્ટિસ

હવે સુધી આપણે SwiftUI નું મૂળભૂત layout, `Spacer`, `Image` અને `Text` જેવા આધારભૂત જ્ઞાન શીખ્યા. આ જ્ઞાન થોડા સરળ views બનાવવા માટે પૂરતું છે.

ઉદાહરણ તરીકે: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google નું ઇન્ટરફેસ બહુ જ સ્વચ્છ છે. તેમાં image અને text બન્ને છે, અને આપણે SwiftUI ના દૃષ્ટિકોણથી તેની રચનાનું વિશ્લેષણ કરી શકીએ:

1. સંપૂર્ણ રચના ત્રણ ભાગમાં વહેંચાય છે: Google logo, search box, અને સૂચનાત્મક લખાણ. આ માટે `VStack` vertical ગોઠવણી માટે વાપરી શકાય.
2. Google logo એક image છે, તેથી `Image` થી દર્શાવી શકાય.
3. Search box માં input field અને icon બન્ને છે. જો હાલ input field ને અવગણીએ, તો search icon ને `Image` થી દર્શાવી શકાય.
4. સૂચનાત્મક લખાણ `Text` વડે દર્શાવી શકાય. તેની horizontal ગોઠવણી માટે `HStack` અને font color માટે `foregroundStyle` નો ઉપયોગ કરી શકાય.

આ જ્ઞાનનો અભ્યાસ કરીને આપણે થોડાં સરળ views બનાવી શકીએ છીએ અને `Image`, `Text` તથા તેમના modifiers વિશેની સમજ વધુ મજબૂત બનાવી શકીએ છીએ.
