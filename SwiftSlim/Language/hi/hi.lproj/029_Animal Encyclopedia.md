# पशु विश्वकोश 

इस पाठ में, हम कस्टम व्यू और डेटा पासिंग का अभ्यास जारी रखेंगे।

हम एक सरल पशु विश्वकोश व्यू बनाएँगे। पेज पर पाँच पशु दिखेंगे। जब किसी पशु पर क्लिक किया जाएगा, तो एक विवरण व्यू पॉप अप होगा, जिसमें उस पशु की तस्वीर, वितरण क्षेत्र, आवास और विवरण दिखेगा।

प्राप्त प्रभाव:

![view](../../../Resource/029_view.png)

इस केस के माध्यम से, हम डेटा संरचना, सूची प्रदर्शन, क्लिक इंटरैक्शन और Sheet पॉप-अप व्यू के बीच सहयोग का अभ्यास कर सकते हैं।

## चित्र सामग्री तैयार करें

सबसे पहले, हमें पाँच पशु चित्र तैयार करने होंगे:

- डॉल्फ़िन: `dolphin.jpg`
- जिराफ़: `giraffe.jpg`
- शेर: `lion.jpg`
- पांडा: `panda.jpg`
- ध्रुवीय भालू: `polarBear.jpg`

आप नीचे दी गई चित्र सामग्री का उपयोग कर सकते हैं:

[डॉल्फ़िन](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[जिराफ़](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[शेर](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[पांडा](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[ध्रुवीय भालू](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

चित्र डाउनलोड करने के बाद, उन्हें Xcode प्रोजेक्ट के `Assets` संसाधन फ़ोल्डर में खींचकर डालें।

![assets](../../../Resource/029_assets.png)

ध्यान देने योग्य बात यह है कि कोड में चित्र का उपयोग करते समय आमतौर पर `.jpg` प्रत्यय लिखने की आवश्यकता नहीं होती।

उदाहरण के लिए, चित्र संसाधन का नाम `dolphin` है, तो कोड में यह लिखें:

```swift
Image("dolphin")
```

यदि चित्र का नाम गलत लिखा गया, तो चित्र सामान्य रूप से प्रदर्शित नहीं होगा।

नोट: ऊपर दिए गए चित्र Wikimedia परियोजना से आते हैं। उपयोग करते समय मूल चित्र लिंक और स्रोत जानकारी बनाए रखने की सलाह दी जाती है।

## पशु संरचना बनाएँ

इस पेज में, हर पशु के पास कई जानकारी होती है:

- पशु का नाम
- पशु की तस्वीर
- पशु इमोजी
- वितरण क्षेत्र
- आवास
- पशु विवरण

यदि हम इन जानकारियों को कई अलग-अलग वेरिएबल में बिखेर दें, तो कोड अपेक्षाकृत अव्यवस्थित हो जाएगा। इसलिए, हम एक `Animal` संरचना बना सकते हैं और एक पशु की जानकारी को साथ रख सकते हैं।

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

इस कोड में:

- `id`: पशु की अनन्य पहचान।
- `name`: पशु का नाम।
- `imageName`: पशु की तस्वीर का नाम।
- `avatarEmoji`: पशु इमोजी।
- `distributionArea`: वितरण क्षेत्र।
- `habitat`: आवास।
- `animalDescription`: पशु विवरण।

इनमें:

```swift
let id = UUID()
```

`id` हर पशु की पहचान करने के लिए उपयोग होता है। क्योंकि आगे हम `ForEach` से पशु सूची दिखाएँगे, और `.sheet(item:)` का उपयोग करके चुने गए पशु के आधार पर विवरण पॉप अप करेंगे, इसलिए `Animal` को `Identifiable` प्रोटोकॉल का पालन कराना आवश्यक है।

`Identifiable` का कार्य SwiftUI को यह बताना है: हर पशु के पास एक ऐसा `id` है जिससे उसकी पहचान अलग की जा सकती है।

## पशु डेटा बनाएँ

इसके बाद, हम `ContentView` में एक पशु array बनाएँगे।

array में पाँच `Animal` सहेजे जाते हैं। हर `Animal` एक पशु को दर्शाता है।

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // डॉल्फ़िन
        Animal(
            name: "डॉल्फ़िन",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "दुनिया भर के गर्म और समशीतोष्ण महासागर।",
            habitat: "महासागर, तटीय जल और कुछ बड़ी नदियाँ।",
            animalDescription: "डॉल्फ़िन बुद्धिमान समुद्री स्तनधारी हैं। वे समूहों में रहती हैं, ध्वनियों से संवाद करती हैं, और अपने चंचल व्यवहार के लिए जानी जाती हैं।"
        ),
        // जिराफ़
        Animal(
            name: "जिराफ़",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "अफ्रीका के सवाना और खुले वन क्षेत्र।",
            habitat: "घास के मैदान, सवाना और खुले जंगल।",
            animalDescription: "जिराफ़ सबसे ऊँचे स्थलीय पशु हैं। उनकी लंबी गर्दन, लंबी टाँगें होती हैं, और वे आमतौर पर ऊँचे पेड़ों की पत्तियाँ खाते हैं।"
        ),
        // शेर
        Animal(
            name: "शेर",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "मुख्य रूप से उप-सहारा अफ्रीका में पाए जाते हैं, पश्चिमी भारत में एक छोटी आबादी के साथ।",
            habitat: "घास के मैदान, सवाना और खुले वन क्षेत्र।",
            animalDescription: "शेर शक्तिशाली बड़ी बिल्लियाँ हैं। वे आमतौर पर प्राइड नामक समूहों में रहते हैं और अक्सर पशु जगत के राजा कहे जाते हैं।"
        ),
        // पांडा
        Animal(
            name: "पांडा",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "मध्य चीन के पर्वतीय जंगल।",
            habitat: "ठंडे और नम पर्वतीय क्षेत्रों के बाँस के जंगल।",
            animalDescription: "पांडा अपने काले-सफेद फर के लिए प्रसिद्ध भालू हैं। वे मुख्य रूप से बाँस खाते हैं और दुनिया के सबसे पहचाने जाने वाले पशुओं में से एक हैं।"
        ),
        // ध्रुवीय भालू
        Animal(
            name: "ध्रुवीय भालू",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "उत्तरी ध्रुव के आसपास के आर्कटिक क्षेत्र।",
            habitat: "समुद्री बर्फ, तटीय क्षेत्र और ठंडे आर्कटिक परिवेश।",
            animalDescription: "ध्रुवीय भालू ठंडे वातावरण के अनुकूल बड़े भालू हैं। वे मजबूत तैराक हैं और सील का शिकार करने के लिए मुख्य रूप से समुद्री बर्फ पर निर्भर रहते हैं।"
        )
    ]

    var body: some View {
        Text("पशु विश्वकोश")
    }
}
```

यहाँ `animals` एक array है:

```swift
let animals: [Animal]
```

`[Animal]` का अर्थ है कि इस array में कई `Animal` सहेजे जाते हैं।

यानी, `animals` एक पशु नहीं, बल्कि पशुओं का एक समूह है।

## पशु सूची दिखाएँ

अब, हम `ForEach` का उपयोग करके पशु सूची दिखा सकते हैं।

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

प्राप्त प्रभाव:

![view](../../../Resource/029_view1.png)

इस कोड में:

```swift
ForEach(animals) { animal in
    ...
}
```

इसका अर्थ है `animals` array को traverse करना।

हर loop में, `animal` वर्तमान में दिखाई जा रही उस पशु वस्तु को दर्शाता है।

उदाहरण के लिए, पहले loop में `animal` डॉल्फ़िन है; दूसरे loop में `animal` जिराफ़ है।

इसलिए, हम नीचे दिए गए तरीके से वर्तमान पशु की जानकारी दिखा सकते हैं:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

इस तरह पाँचों पशु प्रदर्शित किए जा सकते हैं।

## पशु सूची को क्लिक योग्य बनाएँ

अब सूची प्रदर्शित हो चुकी है, लेकिन उस पर क्लिक नहीं किया जा सकता।

यदि हम चाहते हैं कि किसी पशु पर क्लिक करने के बाद विवरण पॉप अप हो, तो पहले हमें “वर्तमान में चुने गए पशु” को रिकॉर्ड करना होगा।

इसलिए, `ContentView` में एक state variable जोड़ें:

```swift
@State private var selectedAnimal: Animal? = nil
```

यहाँ `selectedAnimal` एक optional value type `Animal?` है।

इसका अर्थ है कि इसमें एक पशु हो सकता है, या कोई पशु नहीं भी हो सकता।

default value `nil` है, जिसका अर्थ है कि शुरुआत में कोई पशु चुना नहीं गया।

फिर, हम हर पशु row को `Button` में बदलते हैं:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

मुख्य बात यह code line है:

```swift
selectedAnimal = animal
```

जब उपयोगकर्ता किसी पशु पर क्लिक करता है, तो हम उस पशु को `selectedAnimal` में सहेज देते हैं।

उदाहरण के लिए, उपयोगकर्ता डॉल्फ़िन पर क्लिक करता है, तो `selectedAnimal` में डॉल्फ़िन सहेजी जाती है।

उपयोगकर्ता पांडा पर क्लिक करता है, तो `selectedAnimal` में पांडा सहेजा जाता है।

यानी, `selectedAnimal` उपयोगकर्ता ने वर्तमान में किस पशु पर क्लिक किया है, इसे रिकॉर्ड करने के लिए उपयोग होता है।

## Sheet पॉप-अप व्यू

अब हम button के माध्यम से “वर्तमान में क्लिक किए गए पशु” को रिकॉर्ड कर सकते हैं।

अब हमें एक पॉप-अप व्यू लागू करना है, जिसका उपयोग पशु विवरण दिखाने के लिए होगा।

![view](../../../Resource/029_view2.png)

SwiftUI में, इस तरह का पॉप-अप प्रभाव `Sheet` से लागू किया जा सकता है।

`Sheet` को एक अस्थायी रूप से पॉप अप होने वाले पेज के रूप में समझा जा सकता है। यह वर्तमान पेज के ऊपर दिखाई देता है, और उपयोगकर्ता सामग्री देखने के बाद नीचे swipe करके इसे बंद कर सकता है।

## Sheet उदाहरण

वास्तव में पशु विवरण दिखाने से पहले, हम पहले एक सरल उदाहरण से समझेंगे कि `Sheet` कैसे पॉप अप होता है।

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("शीट दिखाएँ")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("शीट दृश्य")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

प्राप्त प्रभाव:

![view](../../../Resource/029_view3.png)

इस कोड में, हमने एक Boolean value बनाई है:

```swift
@State private var showSheet = false
```

`showSheet` default रूप से `false` है, जिसका अर्थ है कि शुरुआत में `Sheet` नहीं दिखाया जाएगा।

जब button पर क्लिक किया जाता है:

```swift
showSheet.toggle()
```

`toggle()` का अर्थ Boolean value को switch करना है।

यदि पहले `false` था, तो `toggle()` call करने के बाद वह `true` बन जाएगा।

यदि पहले `true` था, तो `toggle()` call करने के बाद वह `false` बन जाएगा।

इसलिए, button पर क्लिक करने के बाद, `showSheet` `false` से `true` में बदल जाएगा।

जब `showSheet` `true` हो जाता है, तो नीचे दिया गया कोड `Sheet` पॉप अप करेगा:

```swift
.sheet(isPresented: $showSheet) {
    Text("शीट दृश्य")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

इस कोड का अर्थ है: जब `showSheet` `true` हो, तो एक `Sheet` पॉप अप करें, और `Sheet` में `Text("शीट दृश्य")` दिखाएँ।

प्राप्त प्रभाव:

![view](../../../Resource/029_view4.png)

यह लिखने का तरीका fixed content पॉप अप करने के लिए उपयुक्त है।

उदाहरण के लिए, button पर क्लिक करने के बाद settings page, instructions page, prompt page आदि पॉप अप करना।

### Sheet प्रदर्शित करने का स्थान

हालाँकि `Sheet` एक पॉप-अप व्यू है, लेकिन SwiftUI में यह `Text()` और `Image()` की तरह सीधे एक स्वतंत्र view के रूप में नहीं लिखा जाता, बल्कि इसे view modifier के रूप में उपयोग किया जाता है।

यानी, `.sheet(...)`, `.font()`, `.padding()`, `.shadow()` जैसे modifiers के समान है। इन्हें किसी view के पीछे जोड़ा जाना चाहिए।

उदाहरण के लिए:

```swift
Button("शीट दिखाएँ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("शीट दृश्य")
}
```

इस उदाहरण में, `.sheet` को `Button` के पीछे जोड़ा गया है।

जब `showSheet` `true` में बदलता है, SwiftUI `Sheet` पॉप अप करेगा और curly braces के अंदर की सामग्री दिखाएगा:

```swift
Text("शीट दृश्य")
```

हालाँकि, वास्तविक development में, यदि किसी page में कई buttons हों, तो आमतौर पर हर button के पीछे एक `.sheet` नहीं जोड़ी जाती।

अधिक सामान्य तरीका है: `.sheet` को बाहरी view के पीछे जोड़ना।

उदाहरण के लिए:

```swift
VStack {
    Button("शीट दिखाएँ") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("शीट दृश्य")
}
```

button `showSheet` को बदलने के लिए जिम्मेदार है, और बाहरी view यह तय करने के लिए जिम्मेदार है कि `showSheet` `true` है या नहीं, ताकि `Sheet` पॉप अप हो।

## Optional value binding Sheet

पहले हमने जो लिखने का तरीका सीखा, वह था:

```swift
.sheet(isPresented: $showSheet) {
    Text("शीट दृश्य")
}
```

यह लिखने का तरीका किसी fixed page के दिखने और छिपने को control करने के लिए उपयुक्त है।

लेकिन पशु विश्वकोश केस में, हमें सिर्फ यह नहीं जानना कि “`Sheet` दिखाना है या नहीं”, बल्कि यह भी जानना है कि “किस पशु पर क्लिक किया गया है”।

उदाहरण के लिए:

उपयोगकर्ता डॉल्फ़िन पर क्लिक करता है, तो `Sheet` में डॉल्फ़िन का विवरण दिखना चाहिए।

उपयोगकर्ता पांडा पर क्लिक करता है, तो `Sheet` में पांडा का विवरण दिखना चाहिए।

इसलिए, यहाँ दूसरी Sheet writing style अधिक उपयुक्त है:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet में दिखाई जाने वाली सामग्री
}
```

इस code में, `Sheet` एक optional value `selectedAnimal` से bind है।

यहाँ ध्यान दें कि `item:` के बाद `$selectedAnimal` लिखा गया है, `selectedAnimal` नहीं।

क्योंकि `Sheet` सिर्फ `selectedAnimal` की value नहीं पढ़ता, बल्कि उसके changes के आधार पर यह तय भी करता है कि पॉप अप करना है या नहीं।

इस code को इस तरह समझा जा सकता है:

- जब `selectedAnimal` `nil` हो, तो `Sheet` न दिखाएँ।
- जब `selectedAnimal` में value हो, तो `Sheet` दिखाएँ।
- जब `Sheet` बंद हो जाए, तो SwiftUI `selectedAnimal` को फिर से `nil` में बदल देगा।

SwiftUI `selectedAnimal` में सहेजे गए पशु को curly braces के अंदर वाले `animal` को पास करेगा।

यानी, `.sheet(item:)` सिर्फ पॉप-अप control नहीं करता, बल्कि चुने गए data को `Sheet` में pass भी करता है।

## Sheet से पशु का नाम दिखाएँ

अब, हम जल्दी से जटिल detail view बनाने की कोशिश नहीं करेंगे।

code को समझना आसान बनाने के लिए, पहले `Sheet` में वर्तमान पशु का नाम दिखाएँगे।

`VStack` के बाहर `.sheet(item:)` जोड़ें:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

यहाँ सबसे महत्वपूर्ण यह code है:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

जब `selectedAnimal` में value होती है, तो `Sheet` पॉप अप होता है।

curly braces के अंदर वाला `animal`, वर्तमान में चुना गया पशु है।

इसलिए:

```swift
Text(animal.name)
```

वर्तमान में क्लिक किए गए पशु का नाम दिखाएगा।

उदाहरण के लिए, `डॉल्फ़िन` पर क्लिक करें, तो Sheet में `डॉल्फ़िन` दिखेगा।

`पांडा` पर क्लिक करें, तो `Sheet` में `पांडा` दिखेगा।

इस तरह, हमने अलग-अलग पशुओं पर क्लिक करने पर अलग-अलग पशु नाम पॉप अप करने का प्रभाव लागू कर दिया।

पशु का नाम दिखाएँ:

![view](../../../Resource/029_view5.png)

हालाँकि, पशु विवरण में केवल एक नाम नहीं होना चाहिए, बल्कि नाम, वितरण क्षेत्र, आवास और विवरण भी दिखना चाहिए।

यदि ये सभी code `.sheet` के अंदर लिख दिए जाएँ, तो code बहुत लंबा हो जाएगा और पढ़ने में असुविधाजनक होगा।

इसलिए, आगे हम एक नया custom view बनाएँगे, जो विशेष रूप से पशु विवरण दिखाने के लिए जिम्मेदार होगा।

## पशु विवरण व्यू बनाएँ

इसके बाद, हम एक नया custom view `AnimalDetailView` बनाएँगे।

यह view एक `Animal` प्राप्त करता है और पशु विवरण दिखाता है।

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**वितरण क्षेत्र** ：\(animal.distributionArea)")

                    Divider()

                    Text("**आवास** ：\(animal.habitat)")

                    Divider()

                    Text("**पशु विवरण** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

प्राप्त प्रभाव:

![view](../../../Resource/029_view2.png)

यहाँ मुख्य बिंदु है:

```swift
var animal: Animal
```

इसका अर्थ है कि `AnimalDetailView` को बाहर से एक पशु प्राप्त करना होगा।

पशु मिलने के बाद, detail view उस पशु की अलग-अलग जानकारियों का उपयोग कर सकता है:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

यानी, `AnimalDetailView` केवल पास किए गए पशु को प्रदर्शित करने के लिए जिम्मेदार है।

### Markdown से bold text

detail view में, हमने ऐसा code लिखा है:

```swift
Text("**आवास:** \(animal.habitat)")
```

यहाँ दो ज्ञान बिंदु हैं।

पहला, `**आवास:**` ने `Markdown` syntax का उपयोग किया है। दो asterisks से घिरा text bold display होगा।

दूसरा, `\()` string interpolation है, जिससे variable की value text में दिखाई जा सकती है।

इस code का अर्थ है पहले bold `आवास:` दिखाना, फिर इस पशु का आवास दिखाना।

## Sheet में विवरण व्यू दिखाएँ

`AnimalDetailView` बनाने के बाद, हम `ContentView` में वापस जाकर `Sheet` के अंदर पहले वाले name view को detail view से बदल सकते हैं।

पहले था:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

अब इसे बदलकर करें:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

यहाँ `animal:` `AnimalDetailView` का parameter name है।

बाद वाला `animal` `.sheet(item:)` से pass किया गया current animal है।

यानी, वर्तमान में क्लिक किए गए पशु को `AnimalDetailView` में दिखाने के लिए pass किया जाता है।

पूरी संरचना:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
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
```

जब उपयोगकर्ता किसी पशु पर क्लिक करता है:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` से एक specific animal में बदल जाता है। `Sheet` यह detect करता है कि `selectedAnimal` में value है, फिर view पॉप अप करता है।

`Sheet` `selectedAnimal` में मौजूद पशु को `AnimalDetailView` view में pass करता है, और `AnimalDetailView` पशु विवरण दिखाता है।

इस तरह, हमने पशु सूची पर क्लिक करने और संबंधित पशु विवरण पॉप अप करने का function लागू कर दिया।

## Sheet की दो writing styles का अंतर

अब, हमने `.sheet(item:)` का उपयोग करके पशु विवरण view का display पूरा कर लिया है।

यहाँ `Sheet` की दो common writing styles का सरल सारांश दे सकते हैं।

### पहली binding Boolean value है

```swift
@State private var showSheet = false

Button("शीट दिखाएँ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("शीट दृश्य")
}
```

यह writing style fixed content पॉप अप करने के लिए उपयुक्त है, जैसे settings page, instructions page, prompt page आदि।

`showSheet` एक Boolean value है, जिसमें केवल दो states हैं: `true` और `false`।

जब `showSheet` `true` हो, तो `Sheet` दिखता है।

जब `showSheet` `false` हो, तो `Sheet` नहीं दिखता।

### दूसरी binding optional value है

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

यह writing style selected data के आधार पर अलग content पॉप अप करने के लिए उपयुक्त है।

इस पाठ में, हम अलग-अलग पशुओं पर क्लिक करके अलग-अलग पशु विवरण दिखाना चाहते हैं, इसलिए `.sheet(item:)` का उपयोग करना अधिक उपयुक्त है।

## पूरा कोड

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // पशु का नाम
    let name: String
    
    // पशु की तस्वीर
    let imageName: String
    
    // पशु label symbol
    let avatarEmoji: String
    
    // वितरण क्षेत्र
    let distributionArea: String
    
    // आवास
    let habitat: String
    
    // पशु विवरण
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // डॉल्फ़िन
        Animal(
            name: "डॉल्फ़िन",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "दुनिया भर के गर्म और समशीतोष्ण महासागर।",
            habitat: "महासागर, तटीय जल और कुछ बड़ी नदियाँ।",
            animalDescription: "डॉल्फ़िन बुद्धिमान समुद्री स्तनधारी हैं। वे समूहों में रहती हैं, ध्वनियों से संवाद करती हैं, और अपने चंचल व्यवहार के लिए जानी जाती हैं।"
        ),
        // जिराफ़
        Animal(
            name: "जिराफ़",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "अफ्रीका के सवाना और खुले वन क्षेत्र।",
            habitat: "घास के मैदान, सवाना और खुले जंगल।",
            animalDescription: "जिराफ़ सबसे ऊँचे स्थलीय पशु हैं। उनकी लंबी गर्दन, लंबी टाँगें होती हैं, और वे आमतौर पर ऊँचे पेड़ों की पत्तियाँ खाते हैं।"
        ),
        // शेर
        Animal(
            name: "शेर",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "मुख्य रूप से उप-सहारा अफ्रीका में पाए जाते हैं, पश्चिमी भारत में एक छोटी आबादी के साथ।",
            habitat: "घास के मैदान, सवाना और खुले वन क्षेत्र।",
            animalDescription: "शेर शक्तिशाली बड़ी बिल्लियाँ हैं। वे आमतौर पर प्राइड नामक समूहों में रहते हैं और अक्सर पशु जगत के राजा कहे जाते हैं।"
        ),
        // पांडा
        Animal(
            name: "पांडा",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "मध्य चीन के पर्वतीय जंगल।",
            habitat: "ठंडे और नम पर्वतीय क्षेत्रों के बाँस के जंगल।",
            animalDescription: "पांडा अपने काले-सफेद फर के लिए प्रसिद्ध भालू हैं। वे मुख्य रूप से बाँस खाते हैं और दुनिया के सबसे पहचाने जाने वाले पशुओं में से एक हैं।"
        ),
        // ध्रुवीय भालू
        Animal(
            name: "ध्रुवीय भालू",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "उत्तरी ध्रुव के आसपास के आर्कटिक क्षेत्र।",
            habitat: "समुद्री बर्फ, तटीय क्षेत्र और ठंडे आर्कटिक परिवेश।",
            animalDescription: "ध्रुवीय भालू ठंडे वातावरण के अनुकूल बड़े भालू हैं। वे मजबूत तैराक हैं और सील का शिकार करने के लिए मुख्य रूप से समुद्री बर्फ पर निर्भर रहते हैं।"
        )
    ]
    
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
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**वितरण क्षेत्र** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**आवास** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**पशु विवरण** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## सारांश

इस पाठ में एक सरल पशु विश्वकोश page पूरा किया गया।

हमने पहले पशु जानकारी को सहेजने के लिए `Animal` structure का उपयोग किया, फिर पाँच पशुओं को सहेजने के लिए array का उपयोग किया, और फिर `ForEach` से पशु सूची दिखाई।

जब उपयोगकर्ता किसी पशु पर क्लिक करता है, तो हम उस पशु को `selectedAnimal` में सहेजते हैं:

```swift
selectedAnimal = animal
```

जब `selectedAnimal` में value होती है, तो `.sheet(item:)` detail view पॉप अप करता है और चुने गए पशु को `AnimalDetailView` में pass करता है।

इस पाठ में सबसे महत्वपूर्ण बात interface style नहीं है, बल्कि इस data passing route को समझना है:

```swift
पशु पर क्लिक → selectedAnimal पशु सहेजता है → Sheet पॉप अप होता है → AnimalDetailView विवरण दिखाता है
```

इस route को समझने के बाद, आगे आप और भी समान functions बना सकते हैं, जैसे product detail, course detail, article detail, contact detail आदि।
