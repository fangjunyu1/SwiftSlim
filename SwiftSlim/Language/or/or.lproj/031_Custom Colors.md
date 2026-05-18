# କଷ୍ଟମ ରଙ୍ଗ

ଏହି ପାଠରେ, ଆମେ SwiftUI ରେ କିପରି ନିଜସ୍ୱ ରଙ୍ଗ କଷ୍ଟମ କରିବା ଶିଖିବୁ।

ପୂର୍ବରୁ ଥିବା ପାଠଗୁଡ଼ିକରେ, ଆମେ SwiftUI ଦେଇଥିବା ଡିଫଲ୍ଟ ରଙ୍ଗ ବ୍ୟବହାର କରିଛୁ, ଯେପରିକି:

```swift
Color.blue
Color.red
Color.green
```

ଏହି ରଙ୍ଗଗୁଡ଼ିକ ବ୍ୟବହାର କରିବାକୁ ସୁବିଧାଜନକ, କିନ୍ତୁ ପ୍ରକୃତ App ଡିଭେଲପମେଣ୍ଟରେ, ଡିଫଲ୍ଟ ରଙ୍ଗ ସାଧାରଣତଃ ପର୍ଯ୍ୟାପ୍ତ ନିଖୁତ ହୁଏ ନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଡିଜାଇନ ଚିତ୍ରରେ ଏପରି ରଙ୍ଗ ବ୍ୟବହାର ହୋଇପାରେ:

```text
#2c54c2
#4875ed
#213e8d
```

ଏପରି ରଙ୍ଗକୁ Hex ରଙ୍ଗ କୁହାଯାଏ।

ଏହି ପାଠରେ, ଆମେ ପ୍ରଥମେ SwiftUI କୁ Hex ରଙ୍ଗ ସମର୍ଥନ କରାଇବୁ, ତାପରେ `static` ବ୍ୟବହାର କରି ସାଧାରଣତଃ ବ୍ୟବହୃତ ରଙ୍ଗଗୁଡ଼ିକୁ ସଜାଇ ରଖିବୁ।

ଶେଷରେ, ଆମେ କଷ୍ଟମ ରଙ୍ଗଗୁଡ଼ିକୁ ପଶୁ ବିଶ୍ୱକୋଷ ଭ୍ୟୁରେ ପ୍ରୟୋଗ କରିବୁ, ଏବଂ ପରେ gradient background ବ୍ୟବହାର କରି button ଗୁଡ଼ିକୁ ଅଧିକ ସ୍ତରୀୟ ଦେଖାଇବୁ।

## କଷ୍ଟମ ରଙ୍ଗ କାହିଁକି ଆବଶ୍ୟକ?

SwiftUI ରେ, ଆମେ ସିଧାସଳଖ ସିଷ୍ଟମ ରଙ୍ଗ ବ୍ୟବହାର କରିପାରୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

ଏଠାରେ `.blue` ନୀଳ ରଙ୍ଗକୁ ବୁଝାଏ। ଏହା ବାସ୍ତବରେ `Color.blue` ର ସଂକ୍ଷିପ୍ତ ଲେଖା।

ଡିଫଲ୍ଟ ରଙ୍ଗର ଲାଭ ହେଉଛି ସରଳ ଏବଂ ସୁବିଧାଜନକ, କିନ୍ତୁ ରଙ୍ଗ ପସନ୍ଦ ସୀମିତ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Color.blue
```

ଏହା କେବଳ SwiftUI ଦେଇଥିବା ଡିଫଲ୍ଟ ନୀଳ ରଙ୍ଗକୁ ଦର୍ଶାଇପାରେ।

![Color.blue](../../../Resource/031_color6.png)

କିନ୍ତୁ ପ୍ରକୃତ ଡିଭେଲପମେଣ୍ଟରେ, ଆମେ ପ୍ରାୟତଃ ଅଧିକ ନିର୍ଦ୍ଦିଷ୍ଟ ରଙ୍ଗ ଆବଶ୍ୟକ କରୁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ସବୁ ନୀଳ ହେଲେ ମଧ୍ୟ, ହାଲୁକା ନୀଳ, ଗାଢ଼ ନୀଳ, ଧୂସର-ନୀଳ, ଉଜ୍ଜ୍ୱଳ ନୀଳ ଇତ୍ୟାଦି ଭିନ୍ନ ପ୍ରଭାବ ଥାଇପାରେ।

![ଅଧିକ ନୀଳ](../../../Resource/031_color5.png)

ଏହି ସମୟରେ, ଯଦି କେବଳ `Color.blue` ବ୍ୟବହାର କରାଯାଏ, ତେବେ ଡିଜାଇନ ପ୍ରଭାବକୁ ପୁନରୁତ୍ପାଦନ କରିବା କଷ୍ଟକର ହେବ।

ତେଣୁ, ଆମେ SwiftUI କୁ କଷ୍ଟମ ରଙ୍ଗ ସମର୍ଥନ କରାଇବା ଆବଶ୍ୟକ।

## Hex ରଙ୍ଗ କଣ?

ସ୍କ୍ରିନରେ ଦେଖାଯାଉଥିବା ରଙ୍ଗ ସାଧାରଣତଃ ତିନୋଟି channel ଦ୍ୱାରା ଗଠିତ: ଲାଲ, ସବୁଜ ଏବଂ ନୀଳ। ଏହାକୁ RGB କୁହାଯାଏ।

RGB ର ଅର୍ଥ:

```text
Red     // ଲାଲ
Green   // ସବୁଜ
Blue    // ନୀଳ
```

Hex ରଙ୍ଗ ହେଉଛି RGB ରଙ୍ଗ ପ୍ରକାଶ କରିବାର ଏକ ପ୍ରକାର।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
#5479FF
```

ଏହି ରଙ୍ଗ ମୂଲ୍ୟକୁ ସରଳଭାବେ ତିନୋଟି ଅଂଶ ଭାବେ ବୁଝିପାରିବା:

```text
54  // ଲାଲ channel କୁ ବୁଝାଏ
79  // ସବୁଜ channel କୁ ବୁଝାଏ
FF  // ନୀଳ channel କୁ ବୁଝାଏ
```

ଏହି ପାଠରେ, ଆମେ ଏହି ସଂଖ୍ୟାଗୁଡ଼ିକୁ ଗଣନା କରିବା ଆବଶ୍ୟକ ନାହିଁ, ଏବଂ hexadecimal ନିୟମଗୁଡ଼ିକୁ ଗଭୀରରେ ବୁଝିବା ମଧ୍ୟ ଆବଶ୍ୟକ ନାହିଁ।

ଏବେ କେବଳ ଏତିକି ଜାଣିଲେ ହେବ: `#5479FF` ଏକ ନିର୍ଦ୍ଦିଷ୍ଟ ରଙ୍ଗକୁ ବୁଝାଏ।

ଭବିଷ୍ୟତରେ ଯେତେବେଳେ ଆମେ `#2c54c2`, `#4875ed` ପରି ଲେଖା ଦେଖିବୁ, ସେଗୁଡ଼ିକୁ ପ୍ରଥମେ ଏକ ରଙ୍ଗ ମୂଲ୍ୟ ଭାବେ ବୁଝିପାରିବୁ।

Sketch, Figma, Photoshop ପରି design tool ଗୁଡ଼ିକରେ ମଧ୍ୟ ଏପରି ରଙ୍ଗ ମୂଲ୍ୟ ପ୍ରାୟତଃ ଦେଖିବାକୁ ମିଳେ।

![ରଙ୍ଗ](../../../Resource/031_color.png)

କିନ୍ତୁ, SwiftUI ଡିଫଲ୍ଟଭାବେ ଏପରି ସିଧାସଳଖ ଲେଖିପାରେ ନାହିଁ:

```swift
Color(hex: "#5479FF")
```

ତେଣୁ, ଆମେ ନିଜେ `Color` type କୁ ବିସ୍ତାର କରିବାକୁ ପଡ଼ିବ, ଯାହାଦ୍ୱାରା ଏହା Hex string ଦ୍ୱାରା ରଙ୍ଗ ସୃଷ୍ଟି କରିପାରିବ।

## Color+Hex.swift ଫାଇଲ ସୃଷ୍ଟି କରନ୍ତୁ

ପ୍ରଥମେ, ଆମେ ଏକ ନୂତନ Swift ଫାଇଲ ସୃଷ୍ଟି କରୁ।

ଫାଇଲ ନାମ ଏଭଳି ଲେଖିପାରିବେ:

```text
Color.swift
```

କିମ୍ବା ଅଧିକ ସ୍ପଷ୍ଟ ଭାବରେ ଏଭଳି ଲେଖିପାରିବେ:

```text
Color+Hex.swift
```

ଏଠାରେ ଅଧିକ ସୁପାରିଶ କରାଯାଉଛି:

```text
Color+Hex.swift
```

Swift project ରେ, `Color+Hex.swift` ପରି ଫାଇଲ ନାମଗୁଡ଼ିକ ବହୁତ ସାଧାରଣ।

ଏହାର ଅର୍ଥ ହେଉଛି ଏହି ଫାଇଲ `Color` କୁ Hex କ୍ଷମତା ଯୋଡ଼ିବା ପାଇଁ ଥିବା extension file।

ଫାଇଲ ନାମ କୋଡ୍ ଚାଲିବାକୁ ସିଧାସଳଖ ପ୍ରଭାବିତ କରେ ନାହିଁ; ଏହା କେବଳ ଆମକୁ ଏହି ଫାଇଲର ଉଦ୍ଦେଶ୍ୟ ଅଧିକ ସହଜରେ ବୁଝିବାରେ ସାହାଯ୍ୟ କରେ।

## Color(hex:) କୋଡ୍ ଯୋଡନ୍ତୁ

`Color+Hex.swift` ଫାଇଲରେ ନିମ୍ନଲିଖିତ କୋଡ୍ ଲେଖନ୍ତୁ:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

ଏହି କୋଡ୍ `extension` ବ୍ୟବହାର କରି `Color` type କୁ ବିସ୍ତାର କରିଛି, ଏବଂ `Color` ପାଇଁ ଏକ ନୂତନ initialization method ଯୋଡ଼ିଛି:

```swift
init(hex: String)
```

ଏହି initialization method ଥିଲେ, ଆମେ Hex string କୁ `Color` କୁ ପଠାଇପାରିବୁ, ଏବଂ ଏକ କଷ୍ଟମ ରଙ୍ଗ ସୃଷ୍ଟି କରିପାରିବୁ:

```swift
Color(hex: "#5479FF")
```

ଏହି extension code ଭିତରେ Hex string କୁ SwiftUI ବୁଝିପାରୁଥିବା RGB ରଙ୍ଗରେ ପରିବର୍ତ୍ତନ କରାଯାଏ।

ଏହି ଚରଣରେ ପ୍ରତ୍ୟେକ line ର conversion logic ଗଭୀରରେ ବୁଝିବା ଆବଶ୍ୟକ ନାହିଁ। କେବଳ ଏତିକି ବୁଝିଲେ ହେବ ଯେ ଯୋଡ଼ାଯାଇଥିବା `Color(hex:)` method ଆମକୁ Hex ରଙ୍ଗ ମୂଲ୍ୟ ଦ୍ୱାରା କଷ୍ଟମ ରଙ୍ଗ ସୃଷ୍ଟି କରିବାକୁ ଦେଇଥାଏ।

## କଷ୍ଟମ ରଙ୍ଗ ବ୍ୟବହାର କରନ୍ତୁ

ଏବେ, ଆମେ `ContentView` ରେ କଷ୍ଟମ ରଙ୍ଗ ପରୀକ୍ଷା କରିପାରିବୁ।

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

ଦେଖାଯାଉଥିବା ପ୍ରଭାବ:

![ରଙ୍ଗ](../../../Resource/031_color1.png)

ଏହି ଉଦାହରଣରେ, ପ୍ରଥମ line ସିଷ୍ଟମ ରଙ୍ଗ ବ୍ୟବହାର କରୁଛି:

```swift
.foregroundStyle(Color.blue)
```

ପରବର୍ତ୍ତୀ ତିନୋଟି line କଷ୍ଟମ Hex ରଙ୍ଗ ବ୍ୟବହାର କରୁଛି:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

ତୁଳନା କଲେ ଦେଖାଯାଏ ଯେ ସିଷ୍ଟମ ନୀଳର କେବଳ ଗୋଟିଏ ଡିଫଲ୍ଟ ପ୍ରଭାବ ଅଛି।

କିନ୍ତୁ Hex ରଙ୍ଗ ଅଧିକ ସୂକ୍ଷ୍ମ ନୀଳ ପରିବର୍ତ୍ତନଗୁଡ଼ିକୁ ଦର୍ଶାଇପାରେ।

ଏହାହିଁ କଷ୍ଟମ ରଙ୍ଗର ମୂଲ୍ୟ: ଏହା interface ର ରଙ୍ଗକୁ ପ୍ରକୃତ design ସହିତ ଅଧିକ ନିକଟ କରେ, ଏବଂ App ର visual style କୁ ନିୟନ୍ତ୍ରଣ କରିବାକୁ ଅଧିକ ସୁବିଧାଜନକ କରେ।

## static ବ୍ୟବହାର କରି ରଙ୍ଗ ସଜାନ୍ତୁ

ଏବେ, ଆମେ Hex string ଦ୍ୱାରା ରଙ୍ଗ ସୃଷ୍ଟି କରିପାରୁ:

```swift
Color(hex: "#2c54c2")
```

ଏହି ଲେଖା ପ୍ରକାର ସଠିକ ଭାବେ ବ୍ୟବହାର କରିହେବ। କିନ୍ତୁ ଯଦି ଏହି ଏକେ ରଙ୍ଗ ଅନେକ ସ୍ଥାନରେ ପୁନରାବୃତ୍ତି ହୁଏ, ପରେ maintenance କରିବା ସୁବିଧାଜନକ ହୁଏ ନାହିଁ।

ଯଦି 10ଟି ସ୍ଥାନରେ ଏହି ରଙ୍ଗ ମୂଲ୍ୟ ଲେଖାଯାଇଛି, ଭବିଷ୍ୟତରେ ଏହି ନୀଳକୁ ବଦଳାଇବାକୁ ଚାହିଁଲେ ପ୍ରତ୍ୟେକଟାକୁ ଅଲଗା ଅଲଗା କରି ବଦଳାଇବାକୁ ପଡ଼ିବ।

ଏହି ସମୟରେ, ଆମେ `static` ବ୍ୟବହାର କରି ସାଧାରଣତଃ ବ୍ୟବହୃତ ରଙ୍ଗଗୁଡ଼ିକୁ ଏକ ସ୍ଥାନରେ ସଜାଇପାରୁ।

`Color+Hex.swift` ଫାଇଲର ତଳ ଭାଗରେ, ନିମ୍ନଲିଖିତ କୋଡ୍ ଜାରି ରଖି ଯୋଡନ୍ତୁ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ଏଠାରେ, ଆମେ `Color` ପାଇଁ ତିନୋଟି static property ଯୋଡ଼ିଛୁ: `animalBlue`, `animalLightBlue` ଏବଂ `animalDarkBlue`; ସେମାନେ ଭିନ୍ନ ଗାଢ଼ତାର ନୀଳ ରଙ୍ଗକୁ ବୁଝାନ୍ତି।

ଏହି property ଗୁଡ଼ିକ `static` ବ୍ୟବହାର କରିଥିବାରୁ, ସେଗୁଡ଼ିକ `Color` type ନିଜର।

ବ୍ୟବହାର କରିବାବେଳେ, `Color.` ଦ୍ୱାରା ସିଧାସଳଖ access କରିପାରିବେ:

```swift
Color.animalBlue
```

ଏହି ଲେଖା ପ୍ରକାର ସିଧାସଳଖ Hex string ଲେଖିବାଠାରୁ ଅଧିକ ସ୍ପଷ୍ଟ।

ଯେତେବେଳେ ଆମେ `Color.animalBlue` ଦେଖୁ, ଆମେ ଜାଣିପାରୁ ଯେ ଏହା ପଶୁ ବିଶ୍ୱକୋଷରେ ବ୍ୟବହୃତ ନୀଳ ରଙ୍ଗକୁ ବୁଝାଏ।

କିନ୍ତୁ `Color(hex: "#2c54c2")` ଦେଖିଲେ, କେବଳ ଏହା ଏକ ରଙ୍ଗ ମୂଲ୍ୟ ବୋଲି ଜଣାପଡ଼େ; ତାହାର ନିର୍ଦ୍ଦିଷ୍ଟ ଉଦ୍ଦେଶ୍ୟ ସହଜରେ ବୁଝିପାରିବା ଯାଏନି।

ରଙ୍ଗକୁ ଏକ ସ୍ଥାନରେ ମ୍ୟାନେଜ୍ କରିବାର ଆଉ ଏକ ଲାଭ ଅଛି: ପରେ ବଦଳାଇବା ଅଧିକ ସୁବିଧାଜନକ।

ଯଦି ପଶୁ ବିଶ୍ୱକୋଷର ମୁଖ୍ୟ ରଙ୍ଗକୁ ସମନ୍ୱୟ କରିବାକୁ ଚାହୁଁଛୁ, କେବଳ definition ଥିବା ସ୍ଥାନକୁ ବଦଳାଇଲେ ହେବ:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

ଏହି ରଙ୍ଗ ବ୍ୟବହାର କରୁଥିବା ସମସ୍ତ ସ୍ଥାନ ଏକାସାଥିରେ update ହୋଇଯିବ।

ଏହାହିଁ `static` ବ୍ୟବହାର କରି ରଙ୍ଗ ସଜାଇବାର ଅର୍ଥ: ରଙ୍ଗର ନାମ ଅଧିକ ସ୍ପଷ୍ଟ ହୁଏ, ଏବଂ ପରବର୍ତ୍ତୀ maintenance ମଧ୍ୟ ଅଧିକ ସୁବିଧାଜନକ ହୁଏ।

## ପଶୁ ବିଶ୍ୱକୋଷରେ ପ୍ରୟୋଗ କରନ୍ତୁ

ଏବେ, ଆମେ କଷ୍ଟମ ରଙ୍ଗକୁ ପୂର୍ବରୁ ଥିବା ପଶୁ ବିଶ୍ୱକୋଷ view ରେ ପ୍ରୟୋଗ କରିପାରୁ।

ପୂର୍ବରୁ ପଶୁ button ର background ସ୍ୱେତ ଥିଲା:

```swift
.background(Color.white)
```

![ଗୋଟିଏ ସ୍ୱେତ button](../../../Resource/031_color7.png)

ଏବେ, ଆମେ ଏହାକୁ କଷ୍ଟମ ରଙ୍ଗରେ ବଦଳାଇପାରୁ:

```swift
.background(Color.animalBlue)
```

![ଗୋଟିଏ ନୀଳ button](../../../Resource/031_color8.png)

ଏଠାରେ `Color.animalBlue` ହେଉଛି ଆମେ ଏମାତ୍ର `Color+Hex.swift` ରେ define କରିଥିବା static color।

Button ର text ସ୍ୱେତ ରଙ୍ଗ ବ୍ୟବହାର କରେ:

```swift
.foregroundStyle(Color.white)
```

ପଶୁ emoji ର background ଅର୍ଦ୍ଧପାରଦର୍ଶୀ ସ୍ୱେତ ବ୍ୟବହାର କରେ:

```swift
.background(Color.white.opacity(0.15))
```

ଏହାଦ୍ୱାରା button ଗୁଡ଼ିକ ଏକ ସମନ୍ୱିତ ନୀଳ visual style ଗଠନ କରିବ।

ଏହି ପଦକ୍ଷେପର ମୁଖ୍ୟ କଥା ଜଟିଳ code ବଢ଼ାଇବା ନୁହେଁ; ବରଂ ପୂର୍ବରୁ ଶିଖିଥିବା କଷ୍ଟମ ରଙ୍ଗକୁ ପ୍ରକୃତ interface ରେ ପ୍ରୟୋଗ କରିବା।

## Gradient background ବ୍ୟବହାର କରନ୍ତୁ

ଏକମାତ୍ର ରଙ୍ଗ ବ୍ୟବହାର କରିବା ବ୍ୟତୀତ, ଆମେ ଅନେକ ରଙ୍ଗକୁ ମିଶାଇ gradient effect ତିଆରି କରିପାରୁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଆମେ ପୂର୍ବରୁ ଏହି ରଙ୍ଗଗୁଡ଼ିକ define କରିଛୁ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ଏହି ରଙ୍ଗଗୁଡ଼ିକୁ କେବଳ ଅଲଗା ଭାବରେ ବ୍ୟବହାର କରିହେବ ନୁହେଁ, gradient background ଭାବରେ ମଧ୍ୟ ମିଶାଇପାରିବ।

SwiftUI ରେ, `LinearGradient` ବ୍ୟବହାର କରି linear gradient ସୃଷ୍ଟି କରିପାରିବେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ଏହି କୋଡ୍ ବାମରୁ ଡାହାଣକୁ ଯାଉଥିବା gradient background ସୃଷ୍ଟି କରେ, ଯେଉଁଠାରେ ରଙ୍ଗ `Color.animalBlue` ରୁ ଧୀରେ ଧୀରେ `Color.animalLightBlue` କୁ ପରିବର୍ତ୍ତିତ ହୁଏ।

ଏଠାରେ, `colors` gradient ରେ ଅଂଶଗ୍ରହଣ କରୁଥିବା ରଙ୍ଗଗୁଡ଼ିକୁ set କରେ, ଏବଂ `startPoint` ଓ `endPoint` gradient direction କୁ control କରେ।

### Gradient effect ପରୀକ୍ଷା କରନ୍ତୁ

ଆମେ ଏକ ସରଳ Text ବ୍ୟବହାର କରି gradient background ପରୀକ୍ଷା କରିପାରୁ।

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

ଦେଖାଯାଉଥିବା ପ୍ରଭାବ:

![ରଙ୍ଗ](../../../Resource/031_color3.png)

ଏହି ଉଦାହରଣରେ, `Text` ର background ଆଉ ଏକମାତ୍ର ରଙ୍ଗ ନୁହେଁ; ଏହା ବାମରୁ ଡାହାଣକୁ ଧୀରେ ଧୀରେ ପରିବର୍ତ୍ତିତ ହେଉଥିବା gradient color।

ସାଧାରଣ background color ସହିତ ତୁଳନା କଲେ, gradient background ଅଧିକ ସ୍ତରୀୟ ହୁଏ, ଏବଂ interface ରେ visual focus ସୃଷ୍ଟି କରିବାକୁ ଅଧିକ ସହଜ କରେ।

## ପଶୁ ବିଶ୍ୱକୋଷରେ gradient background ବ୍ୟବହାର କରନ୍ତୁ

ଏବେ, ଆମେ ପଶୁ button ର background color କୁ:

```swift
.background(Color.animalBlue)
```

gradient background କୁ ବଦଳାଇପାରୁ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

ସମ୍ପୂର୍ଣ୍ଣ code ନିମ୍ନରୂପ:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ଦେଖାଯାଉଥିବା ପ୍ରଭାବ:

![ରଙ୍ଗ](../../../Resource/031_color4.png)

ଏବେ, ପଶୁ button ଗୁଡ଼ିକ ଆଉ କେବଳ ଏକମାତ୍ର background color ନୁହେଁ; ସେମାନଙ୍କର ବାମରୁ ଡାହାଣକୁ ଯାଉଥିବା gradient effect ଅଛି।

ଏକ ରଙ୍ଗର background ସହିତ ତୁଳନା କଲେ, gradient background interface କୁ ଅଧିକ ସ୍ତରୀୟ କରିପାରେ, ଏବଂ ପ୍ରକୃତ App ର visual design ସହିତ ଅଧିକ ନିକଟ ଲାଗେ।

## ଏକ ରଙ୍ଗର background ଏବଂ gradient background ର ତଫାତ

ଏକ ରଙ୍ଗର background କେବଳ ଗୋଟିଏ ରଙ୍ଗ ବ୍ୟବହାର କରେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
.background(Color.animalBlue)
```

ଏହି ଲେଖା ପ୍ରକାର ସରଳ ଏବଂ ସ୍ପଷ୍ଟ, ଅଧିକାଂଶ ମୂଳ interface ପାଇଁ ଉପଯୁକ୍ତ।

Gradient background ଅନେକ ରଙ୍ଗ ବ୍ୟବହାର କରେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

ଏହି ଲେଖା ପ୍ରକାର interface କୁ ଅଧିକ ସ୍ତରୀୟ କରିପାରେ, କିନ୍ତୁ visual complexity କୁ ମଧ୍ୟ ଅଧିକ ସହଜରେ ବଢ଼ାଇଦିଏ।

ତେଣୁ, ପ୍ରକୃତ ଡିଭେଲପମେଣ୍ଟରେ ଏଭଳି ବୁଝିପାରିବେ:

ଏକ ରଙ୍ଗର background ସାଧାରଣ text, ସାଧାରଣ button, ସାଧାରଣ card ଏବଂ ସାଧାରଣ page background ପାଇଁ ଉପଯୁକ୍ତ।

Gradient background ମୁଖ୍ୟ button, ଶୀର୍ଷ ଅଞ୍ଚଳ, cover card, feature entry ଇତ୍ୟାଦି ଯେଉଁଠାରେ emphasis ଦରକାର, ସେହି ସ୍ଥାନଗୁଡ଼ିକ ପାଇଁ ଉପଯୁକ୍ତ।

## ସାରାଂଶ

ଏହି ପାଠରେ, ଆମେ SwiftUI ରେ କିପରି କଷ୍ଟମ ରଙ୍ଗ ବ୍ୟବହାର କରିବା ଶିଖିଲୁ।

ପ୍ରଥମେ, ଆମେ Hex ରଙ୍ଗ ବିଷୟରେ ବୁଝିଲୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```text
#2c54c2
```

ଏହା ଏକ ନିର୍ଦ୍ଦିଷ୍ଟ ରଙ୍ଗକୁ ବୁଝାଏ।

ତାପରେ, ଆମେ `extension Color` ବ୍ୟବହାର କରି `Color` type କୁ ବିସ୍ତାର କଲୁ।

ଏହା SwiftUI କୁ ନିମ୍ନଲିଖିତ ଉପାୟରେ ରଙ୍ଗ ସୃଷ୍ଟି କରିବାକୁ ସମର୍ଥ କରେ:

```swift
Color(hex: "#2c54c2")
```

ପରେ, ଆମେ `static` ବ୍ୟବହାର କରି ସାଧାରଣତଃ ବ୍ୟବହୃତ ରଙ୍ଗଗୁଡ଼ିକୁ ସଜାଇଲୁ:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

ଏହାଦ୍ୱାରା, ଅନ୍ୟ view ଗୁଡ଼ିକରେ ସିଧାସଳଖ ଏଭଳି ବ୍ୟବହାର କରିପାରିବେ:

```swift
Color.animalBlue
```

ପ୍ରତିଥର Hex string ଲେଖିବା ସହିତ ତୁଳନା କଲେ, ଏହି ଉପାୟ ଅଧିକ ସ୍ପଷ୍ଟ, ଏବଂ ପରେ ଏକାଠି ରଙ୍ଗ ବଦଳାଇବା ଅଧିକ ସୁବିଧାଜନକ।

ଶେଷରେ, ଆମେ `LinearGradient` ଶିଖିଲୁ, ଏବଂ କଷ୍ଟମ ରଙ୍ଗଗୁଡ଼ିକୁ gradient background ଭାବେ ମିଶାଇଲୁ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ଏହି ପାଠ ମାଧ୍ୟମରେ, ଆମେ “କଷ୍ଟମ ରଙ୍ଗ ସୃଷ୍ଟି କରିବା” ଠାରୁ “ପ୍ରକୃତ interface ରେ ରଙ୍ଗ ବ୍ୟବହାର କରିବା” ପର୍ଯ୍ୟନ୍ତର ପ୍ରକ୍ରିୟା ସମ୍ପୂର୍ଣ୍ଣ କଲୁ।

ଭବିଷ୍ୟତରେ, ଯେତେବେଳେ ଗୋଟିଏ ରଙ୍ଗ ଅନେକ ସ୍ଥାନରେ ପୁନରାବୃତ୍ତି ବ୍ୟବହାର ହେବ, ସେତେବେଳେ ପ୍ରଥମେ ତାହାକୁ `Color` extension ମଧ୍ୟରେ ସଜାଇ ରଖିବାକୁ ବିଚାର କରିପାରିବେ।

ଏଭଳି କରିଲେ code ଅଧିକ ସ୍ପଷ୍ଟ ହେବ, ଏବଂ interface style କୁ ଏକାକୀକୃତ କରିବା ମଧ୍ୟ ଅଧିକ ସହଜ ହେବ।
