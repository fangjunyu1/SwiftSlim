# चमकीले रंग

इस पाठ में हम SwiftUI के कुछ सामान्य visual modifiers सीखेंगे, जिनमें शामिल हैं:

- रंग
- foreground color
- background color
- offset
- opacity
- blur

साथ ही हम `Safe Area` भी सीखेंगे।

ये modifiers view की appearance को नियंत्रित करने के लिए उपयोग होते हैं, जिससे interface अधिक स्पष्ट और layered बनती है।

## रंग

SwiftUI में हम text का color सेट कर सकते हैं।

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` का अर्थ है नीला रंग। वास्तव में यह `Color.blue` का simplified form है (type inference)।

सामान्य colors में शामिल हैं:

```
.black
.green
.yellow
.pink
.gray
...
```

ये सभी `Color` की static properties हैं।

![Color](../../RESOURCE/006_color.png)

आप `Color` को एक color type की तरह समझ सकते हैं, और `.blue`、`.red` उसके specific colors हैं।

### `Color` view

SwiftUI में `Color` स्वयं भी एक view के रूप में display हो सकता है।

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

यह code `100×100` का एक लाल square बनाएगा।

आप पूरी interface को भी किसी color में दिखा सकते हैं:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

run करने के बाद आप देखेंगे कि लाल रंग पूरी screen पर नहीं फैला है; iPhone के ऊपर और नीचे अब भी सफेद भाग दिखाई देता है। यहाँ `Safe Area` की अवधारणा आती है।

## `Safe Area`

`Safe Area` वह क्षेत्र है जिसे system content के ढके जाने से बचाने के लिए reserve करता है। इसमें शामिल हैं:

1. ऊपर का status bar (time, battery)

2. नीचे का Home indicator

3. notch या Dynamic Island का क्षेत्र

![Color](../../RESOURCE/006_color3.png)

SwiftUI डिफ़ॉल्ट रूप से content को safe area के भीतर सीमित रखता है, इसलिए view screen edges तक नहीं फैलती।

### `Safe Area` को ignore करना

यदि आप चाहते हैं कि रंग पूरी screen पर फैल जाए, तो `ignoresSafeArea` का उपयोग करें:

```swift
Color.red
    .ignoresSafeArea()
```

या `edgesIgnoringSafeArea` का उपयोग करें:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

इस प्रकार view पूरी screen तक फैल जाएगी।

ध्यान देने योग्य बात यह है कि `edgesIgnoringSafeArea` पुराना syntax है; iOS 14 से `ignoresSafeArea` का उपयोग अधिक recommended है।

## foreground color

### `foregroundStyle` modifier

पिछले पाठों में हमने `foregroundStyle` के माध्यम से color सेट करना सीखा था।

उदाहरण:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` नई styling system है, जो color, gradient, material आदि को support करती है।

![Color](../../RESOURCE/006_color2.png)

### `foregroundColor` modifier

`foregroundColor` से भी color सेट किया जा सकता है:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

इसका उपयोग `foregroundStyle` जैसा ही है।

नवीनतम Xcode versions में, Xcode संकेत देता है कि `foregroundColor` भविष्य के iOS versions में deprecated हो सकता है, इसलिए प्राथमिकता से `foregroundStyle` का उपयोग करना बेहतर है।

## background

यदि आप view में background color जोड़ना चाहते हैं, तो `background` का उपयोग कर सकते हैं:

```swift
background(.red)
```

उदाहरण के लिए, text में background color जोड़ें:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

जब हम Word, Chrome आदि App में text select करते हैं, तो इसी तरह का background effect दिखाई देता है।

![Color](../../RESOURCE/006_color16.png)

यदि आप background को बड़ा करना चाहते हैं, तो `padding` के साथ मिलाकर उपयोग करें:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

यहाँ एक महत्वपूर्ण नियम ध्यान रखना है:

SwiftUI modifiers ऊपर से नीचे तक view को build करते हैं। बाद में लिखा गया modifier, पहले के result पर लागू होता है।

इसलिए:

```swift
.padding()
.background()
```

इसका अर्थ है कि background, padding जुड़ने के बाद बने view को wrap करेगा।

यदि order उलटा हो:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

background बड़ा नहीं होगा, क्योंकि background ने बाद वाले `padding` को wrap नहीं किया।

## उदाहरण - चार-कोनों वाला nut

अब हम एक सरल four-corner nut view बनाएँगे।

![Color](../../RESOURCE/006_color8.png)

पहले `50 × 50` का एक सफेद square बनाते हैं:

```swift
Color.white
    .frame(width: 50, height: 50)
```

यदि इसे circle में बदलना हो, तो `cornerRadius` उपयोग करें:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

जब rounded radius width और height के आधे के बराबर होती है, तो यह circle बन जाता है।

अब इसमें एक नीला background जोड़ते हैं:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

नया `padding` outer area को बड़ा करता है, और `background` outer area पर नीला रंग draw करता है।

अब एक four-corner nut जैसा effect तैयार हो गया।

### एक दूसरा तरीका

background color के अलावा, `ZStack` का उपयोग करके भी यह four-corner nut effect बनाया जा सकता है।

हमने पहले सीखा था कि `ZStack` overlay arrangement देता है; four-corner nut को भी एक circle और एक rectangle के overlay के रूप में समझा जा सकता है।

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

`ZStack` views को क्रम से overlay करता है, और बाद में जोड़ा गया view ऊपर दिखाई देता है।

## उदाहरण - दो overlapping circles

कई icons सरल shapes के overlay से बने होते हैं, जैसे दो overlapping circles।

![Color](../../RESOURCE/006_color14.png)

सबसे पहले, दो circles बनाते हैं:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

क्योंकि हमें दोनों circles को overlapping दिखाना है, इसलिए `ZStack` layout का उपयोग करते हैं:

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

इस समय, समान आकार के दोनों circles पूरी तरह overlap हो रहे हैं।

हमें दोनों circles को आंशिक रूप से overlap कराना है, पूरी तरह cover नहीं करना। इसके लिए `offset` से displacement effect बनाया जा सकता है।

## offset

`offset` केवल view की drawing position बदलता है; यह parent view की layout calculation को प्रभावित नहीं करता।

उपयोग:

```swift
.offset(x:y:)
```

`x` horizontal direction का offset है, `y` vertical direction का offset है।

positive value दाईं ओर/नीचे की ओर offset दर्शाती है, और negative value बाईं ओर/ऊपर की ओर।

`offset` का उपयोग करके दो circles को आंशिक रूप से overlap करें:

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

लाल circle की layout position नहीं बदली, लेकिन उसकी drawing position बाईं ओर `25` points खिसक गई। इसलिए दोनों circles में partial overlap का visual effect बनता है।

## opacity

SwiftUI में `opacity` view की transparency सेट करने के लिए उपयोग होता है।

मूल उपयोग:

```swift
.opacity(0.5)
```

`opacity` का parameter `0.0` से `1.0` तक होता है, जहाँ:

- `0` का अर्थ है पूरी तरह transparent
- `1` का अर्थ है opaque

orange circle की transparency सेट करने के लिए `opacity` का उपयोग करें:

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

जब orange circle की `opacity` को `0.8` सेट किया जाता है, तो उसकी opacity `80%` होती है। जब दोनों circles overlap होते हैं, तब overlap क्षेत्र में color blending effect उत्पन्न होता है।

## blur

SwiftUI में `blur` का उपयोग blur effect के लिए किया जा सकता है:

```swift
.blur(radius:10)
```

`radius` blur radius को परिभाषित करता है। value जितनी बड़ी होगी, blur उतना अधिक स्पष्ट होगा।

हम दोनों circles में blur effect जोड़ सकते हैं:

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

अंततः, हम दो बहुत blurred circles देख सकते हैं।

## सारांश

इस पाठ में हमने SwiftUI के सामान्य visual modifiers पर ध्यान दिया, और सीखा कि modifiers के माध्यम से view के color, position और visual effects को कैसे नियंत्रित किया जाए।

ठोस उदाहरणों के माध्यम से, हम देख सकते हैं कि अलग-अलग visual modifiers interface में वास्तव में क्या भूमिका निभाते हैं, और safe area का ज्ञान भी समझा।

ये बहुत बुनियादी modifiers हैं। यदि हम इनका अधिक अभ्यास और उपयोग करें, तो वास्तविक development में interface effects को अधिक स्पष्ट रूप से नियंत्रित कर पाएँगे।

### अभ्यास

- किसी image में opacity और blur effect जोड़ें
- तीन अलग-अलग opacities वाले overlapping circles सेट करें
- एक full-screen background image बनाएँ और safe area ignore करें
- `offset` का उपयोग करके कई views की positions समायोजित करें

अभ्यास का उद्देश्य API याद करना नहीं है, बल्कि visual changes और layout behavior के बीच संबंध को देखना है।
