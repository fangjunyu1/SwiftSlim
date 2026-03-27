# ઝગમગતા રંગો

આ પાઠમાં આપણે SwiftUI માં સામાન્ય visual modifiers શીખીશું, જેમાં સમાવેશ થાય છે:

- રંગ
- foreground color
- background color
- offset
- transparency
- blur

આ સાથે આપણે `Safe Area` પણ શીખીશું.

આ modifiers view ના દેખાવને નિયંત્રિત કરવા માટે છે, જેથી ઈન્ટરફેસ વધુ સ્પષ્ટ અને સ્તરિયું લાગે.

## રંગ

SwiftUI માં આપણે લખાણનો રંગ સેટ કરી શકીએ છીએ.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` નો અર્થ નીલો રંગ છે, અને ખરેખરમાં તે `Color.blue` નું સંક્ષિપ્ત સ્વરૂપ છે (type inference ના કારણે).

સામાન્ય રંગોમાં સમાવેશ થાય છે:

```
.black
.green
.yellow
.pink
.gray
...
```

આ બધા `Color` ની static properties છે.

![Color](../../RESOURCE/006_color.png)

અમે `Color` ને રંગના પ્રકાર તરીકે સમજી શકીએ, અને `.blue`, `.red` જેવી values એ તેના actual રંગો છે.

### `Color` view

SwiftUI માં `Color` પોતે પણ view તરીકે દેખાડી શકાય છે.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

આ કોડ `100×100` નો એક લાલ ચોરસ બનાવે છે.

આખું ઈન્ટરફેસ પણ એક રંગરૂપે બતાવી શકાય છે:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Run કર્યા પછી તમે જોશો કે લાલ રંગ આખી screen ભરતો નથી; iPhone ના ઉપર અને નીચે ભાગ હજી સફેદ દેખાય છે. અહીં `Safe Area` નો ખ્યાલ આવે છે.

## `Safe Area`

`Safe Area` એ system દ્વારા content ઢંકાઈ ન જાય તે માટે રાખવામાં આવેલ વિસ્તાર છે, જેમાં સામેલ છે:

1. ઉપરની status bar (સમય, battery)
2. નીચેની Home indicator bar
3. notch અથવા Dynamic Island વિસ્તાર

![Color](../../RESOURCE/006_color3.png)

SwiftUI મૂળભૂત રીતે content ને safe area ની અંદર મર્યાદિત રાખે છે, એટલે view screen ના સંપૂર્ણ કિનારાં સુધી લંબાતી નથી.

### `Safe Area` ને અવગણવી

જો આપણે આખી screen રંગથી ભરવી હોય, તો `ignoresSafeArea` નો ઉપયોગ કરી શકાય:

```swift
Color.red
    .ignoresSafeArea()
```

અથવા `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

હવે view આખી screen સુધી લંબાશે.

નોંધ: `edgesIgnoringSafeArea` જૂનું syntax છે. iOS 14 પછી `ignoresSafeArea` નો ઉપયોગ કરવો વધુ ભલામણ થાય છે.

## Foreground color

### `foregroundStyle` modifier

અગાઉના પાઠોમાં આપણે `foregroundStyle` વડે રંગ સેટ કરવાનું શીખ્યા હતા.

ઉદાહરણ તરીકે:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` નવી style system નો ભાગ છે, જે રંગ, gradients, materials વગેરે support કરે છે.

![Color](../../RESOURCE/006_color2.png)

### `foregroundColor` modifier

`foregroundColor` પણ રંગ સેટ કરી શકે છે:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

તેનો ઉપયોગ `foregroundStyle` જેવા જ રીતે થાય છે.

તાજેતરની Xcode આવૃત્તિઓમાં Xcode સૂચવે છે કે `foregroundColor` ભવિષ્યના iOS versions માં deprecate થઈ શકે છે, તેથી `foregroundStyle` ને પ્રથમ પ્રાથમિકતા આપવી વધુ સારી છે.

## Background

જો view માટે background color ઉમેરવો હોય, તો `background` નો ઉપયોગ થાય છે:

```swift
background(.red)
```

ઉદાહરણ તરીકે, લખાણને background આપવું:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome જેવી App માં જ્યારે આપણે લખાણ પસંદ કરીએ છીએ, ત્યારે આવો જ background effect જોવા મળે છે.

![Color](../../RESOURCE/006_color16.png)

જો background વિસ્તાર મોટો કરવો હોય, તો `padding` સાથે જોડવો પડે:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

અહીં એક મહત્વનો નિયમ યાદ રાખવો:

SwiftUI modifiers ઉપરથી નીચે view બનાવે છે. પાછળ લખાયેલા modifiers પહેલાના પરિણામ પર લાગુ પડે છે.

અટલે:

```swift
.padding()
.background()
```

એનો અર્થ કે background, padding ઉમેર્યા પછીની view ને wrap કરશે.

જો ક્રમ ઉલટો લખીએ:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

તો background વિસ્તાર મોટો નહીં થાય, કારણ કે background એ પછીના padding ને wrap કરતું નથી.

## ઉદાહરણ - ચાર ખૂણાવાળી નટ

હવે આપણે એક સરળ ચાર ખૂણાવાળી નટ જેવું view બનાવીએ.

![Color](../../RESOURCE/006_color8.png)

સૌપ્રથમ `50 × 50` નો સફેદ ચોરસ બનાવીએ:

```swift
Color.white
    .frame(width: 50, height: 50)
```

જો તેને વર્તુળ બનાવવા માંગીએ, તો `cornerRadius` નો ઉપયોગ કરી શકાય:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

જ્યારે corner radius width અને height ના અડધા જેટલું હોય, ત્યારે shape circle બની જાય છે.

હવે તેમાં એક નીલો background ઉમેરીએ:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

નવું ઉમેરાયેલ `padding` બહારનું ક્ષેત્ર મોટું કરે છે, અને `background` એ બહારના વિસ્તારમાં નીલો રંગ ભરે છે.

હવે ચાર ખૂણાવાળી નટ જેવો effect પૂર્ણ થયો.

### બીજી રીત

Background color નો ઉપયોગ કર્યા વગર પણ `ZStack` વડે આ effect બનાવી શકાય છે.

અગાઉ આપણે શીખ્યું કે `ZStack` overlap layout આપે છે, એટલે નટને એક circle અને એક rectangle overlay તરીકે પણ સમજી શકાય.

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

`ZStack` views ને ક્રમ પ્રમાણે એકબીજા પર ચડાવીને ગોઠવે છે, અને પછી ઉમેરાયેલી view ઉપરની સ્તરે દેખાય છે.

## ઉદાહરણ - overlap થતા બે વર્તુળ

ઘણા icons સરળ shapes ને overlap કરીને બને છે, ઉદાહરણ તરીકે overlap થતા બે circles.

![Color](../../RESOURCE/006_color14.png)

સૌપ્રથમ બે circles બનાવીએ:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

કારણ કે આ બંને circles ને overlap બતાવવાના છે, તેથી `ZStack` layout વાપરીએ:

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

હાલ બે સમાન કદનાં circles સંપૂર્ણપણે overlap થાય છે.

અમે ઇચ્છીએ છીએ કે તેઓ સંપૂર્ણપણે નહીં, પરંતુ ભાગે overlap થાય. તે માટે `offset` નો ઉપયોગ કરી શકાય.

## Offset

`offset` ફક્ત view ની drawing position બદલે છે; તે parent layout ના ગણિતને અસર કરતું નથી.

ઉપયોગ:

```swift
.offset(x:y:)
```

`x` horizontal offset છે અને `y` vertical offset છે.

Positive value જમણે / નીચે ખસેડે છે, અને negative value ડાબે / ઉપર ખસેડે છે.

બે circles ને ભાગે overlap કરવા માટે `offset` વાપરીએ:

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

લાલ circle ની layout position બદલાતી નથી, પરંતુ તેની drawing position `25 pt` જેટલી ડાબી તરફ ખસી જાય છે. તેથી બંને circles overlap થતો visual effect બનાવે છે.

## Transparency

SwiftUI માં `opacity` નો ઉપયોગ view ની transparency સેટ કરવા માટે થાય છે.

મૂલભૂત ઉપયોગ:

```swift
.opacity(0.5)
```

`opacity` નું મૂલ્ય `0.0` થી `1.0` વચ્ચે હોય છે, જેમાં:

- `0` એટલે સંપૂર્ણ પારદર્શક
- `1` એટલે સંપૂર્ણ અસ્પષ્ટ

અમે નારંગી circle માટે transparency સેટ કરવા `opacity` નો ઉપયોગ કરી શકીએ:

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

જ્યારે નારંગી circle ની `opacity` `0.8` થાય છે, ત્યારે તેની opacity `80%` થાય છે, અને overlap વિસ્તાર રંગોનું મિશ્રણ બતાવે છે.

## Blur

SwiftUI માં `blur` વડે blur effect સેટ કરી શકાય છે:

```swift
.blur(radius:10)
```

`radius` blur નો વ્યાસ નક્કી કરે છે. મૂલ્ય જેટલું મોટું, blur effect એટલો વધુ સ્પષ્ટ.

અમે બંને circles માટે blur effect ઉમેરી શકીએ:

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

અંતે આપણે બે ખૂબ જ blur થયેલા circles જોઈ શકીએ છીએ.

## સારાંશ

આ પાઠ SwiftUI ના સામાન્ય visual modifiers પર કેન્દ્રિત હતો, અને આપણે શીખ્યું કે modifiers દ્વારા કેવી રીતે રંગ, position અને visual effect નિયંત્રિત કરી શકાય.

ચોક્કસ ઉદાહરણો દ્વારા આપણે જુદા visual modifiers view પર કેવી અસર કરે છે તે જોયું, અને safe area નો ખ્યાલ પણ સમજ્યો.

આ બધા ખૂબ જ મૂળભૂત modifiers છે. તેમની વધુ પ્રેક્ટિસ અને વપરાશથી વાસ્તવિક વિકાસમાં UI effect ને વધુ સ્પષ્ટ રીતે નિયંત્રિત કરી શકાય છે.

### પાઠ પછીના અભ્યાસ

- એક ચિત્ર પર transparency અને blur effect ઉમેરો
- જુદી opacity ધરાવતા ત્રણ overlap થતા circles બનાવો
- આખી screen ભરતું background image બનાવો અને safe area ને ignore કરો
- ઘણા views ની position બદલવા માટે `offset` વાપરો

આ અભ્યાસનો હેતુ API યાદ કરવો નથી, પરંતુ visual ફેરફારો અને layout behavior વચ્ચેના સંબંધનું નિરીક્ષણ કરવું છે.
