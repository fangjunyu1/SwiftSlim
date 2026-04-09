# struct और class

पिछले पाठ में, हमने अभी-अभी `struct` से परिचय शुरू किया था, एक structure परिभाषित किया था, और साथ ही protocol, `UUID` जैसी बातें भी आगे सीखीं।

अब `struct` keyword के बारे में हमारी एक शुरुआती समझ बन गई है, लेकिन अभी इसे सच में पूरी तरह समझ लेना नहीं कहा जा सकता।

इस पाठ में, हम `struct` को मुख्य विषय बनाकर आगे बढ़ेंगे, और साथ ही `class` को भी जानेंगे। इस पाठ के माध्यम से, तुम और स्पष्ट रूप से समझ पाओगे: instance क्या है, constructor क्या है, और हम `struct` और `class` का उपयोग करके data को व्यवस्थित क्यों कर सकते हैं।

## छात्र प्रबंधन प्रणाली

उदाहरण के लिए, अब हम एक छात्र प्रबंधन प्रणाली विकसित करना चाहते हैं। हर छात्र के पास नाम, लिंग, फोन, उम्र, घर का पता जैसी जानकारी होती है।

इस समय, हम इन जानकारियों को एक साथ जोड़कर एक `Student` structure के रूप में परिभाषित कर सकते हैं:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

यहाँ हम `struct` का उपयोग करके एक छात्र type परिभाषित करते हैं।

इस `Student` structure में कई property शामिल हैं:

- `id`: छात्र की अद्वितीय पहचान
- `name`: छात्र का नाम
- `sex`: छात्र का लिंग
- `phone`: छात्र का फोन
- `age`: छात्र की उम्र
- `address`: घर का पता

इस तरह, पहले बिखरी हुई कई जानकारियाँ मिलकर एक पूरा "छात्र" बन जाती हैं।

यहाँ `Student` `Identifiable` protocol को भी follow करता है, और एक `id` field परिभाषित करता है, ताकि आगे `ForEach` loop के साथ data दिखाना आसान हो।

फिर, हम एक छात्र instance बना सकते हैं:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

यह code दिखाता है कि `Student` इस structure के अनुसार किसी छात्र का ठोस data बनाया जा सकता है।

यहाँ `Student` type है, और `Student(...)` एक बनाए गए instance को दर्शाता है।

SwiftUI में, हम इस instance को किसी variable को assign कर सकते हैं, और फिर उसे display कर सकते हैं।

उदाहरण के लिए:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

इस तरह, हम view में इस छात्र का नाम देख सकते हैं: `Fang Junyu`।

यहाँ, हमने पहले `Student` का एक instance बनाया, फिर उसे `student` variable को assign किया, और अंत में `student.name` के जरिए उसकी property पढ़ी।

## instance क्या है

जब हम पहली बार `struct` सीखना शुरू करते हैं, तो "instance" शब्द थोड़ा अपरिचित लग सकता है।

लेकिन वास्तव में, हम शुरुआत से ही instances का उपयोग करते आए हैं, बस पहले हमने इस पर खास ध्यान नहीं दिया।

उदाहरण के लिए:

```swift
let name = "Fang Junyu"
```

यहाँ `"Fang Junyu"` एक string value है, और मूल रूप से यह `String` type का एक instance है।

हम इसे इस तरह भी लिख सकते हैं:

```swift
let name = String("Fang Junyu")
```

ये दोनों लिखने के तरीके एक ही बात बताते हैं: `String` type का एक instance बनाना और उसे `name` variable को assign करना।

इसी तरह, `Int` के लिए भी यही बात सही है:

```swift
let num = 3
```

यहाँ `3` मूल रूप से `Int` type की एक value है, और इसे `Int` instance के रूप में भी समझा जा सकता है।

इसलिए, instance कोई ऐसा विशेष concept नहीं है जो केवल `struct` में ही दिखाई देता हो।

चाहे `String`, `Int`, `Double`, `Bool`, या custom `Student` हो, ये सभी instances बना सकते हैं।

इसलिए, जब हम लिखते हैं:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

तो यह मूल रूप से `String` या `Int` का instance बनाने जैसा ही है, बस `Student` एक ऐसा type है जिसे हमने खुद परिभाषित किया है।

## constructor

जब हम एक instance बनाते हैं:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

तब वास्तव में हम `Student` की initialization method, यानी `init`, को call कर रहे होते हैं।

तुम constructor को इस तरह समझ सकते हो: **instance बनाते समय property को value देने का यह प्रवेश द्वार है।**

अर्थात, कोई instance सच में पूरी तरह तैयार होने से पहले आम तौर पर पहले `init` से होकर गुजरता है।

उदाहरण के लिए, जब हमने पहले SwiftUI view lifecycle सीखा था, तब हमने ऐसा code लिखा था:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

यहाँ `init()` तब चलता है जब `ContentView` instance बनाया जाता है, जबकि `onAppear` तब चलता है जब view वास्तव में स्क्रीन पर दिखाया जाता है। यानी view का बनना और view का दिखना एक ही समय पर नहीं होता।

इसी तरह, जब हम `Student(...)` बनाते हैं, तब भी हम `Student` के constructor को call कर रहे होते हैं।

### सिस्टम द्वारा अपने आप बनाया गया constructor

जब हमने `Student` को परिभाषित किया था, तब हमने हाथ से `init` नहीं लिखा था:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

लेकिन फिर भी, हम सीधे instance बना सकते हैं:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor लिखे बिना instance क्यों बनाया जा सकता है?

क्योंकि `struct` के लिए, अगर हम हाथ से constructor नहीं लिखते, तो सिस्टम आम तौर पर अपने आप हमारे लिए एक उपयुक्त constructor बना देता है।

सीखने की शुरुआत में इसे सरल रूप में ऐसे समझा जा सकता है: Swift हमारे लिए initialization code अपने आप भर देता है।

लगभग ऐसे समझ सकते हैं कि सिस्टम हमारे लिए नीचे वाला code तैयार कर देता है:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

यहाँ एक छोटी-सी बात पर ध्यान देने की ज़रूरत है:

```swift
let id = UUID()
```

`id` के पास पहले से default value है, इसलिए instance बनाते समय हमें `id` को फिर से हाथ से pass करने की ज़रूरत नहीं होती।

अर्थात, जिन properties के पास default value नहीं होती, उन्हें सामान्यतः constructor में pass करना पड़ता है; और जिन properties के पास पहले से default value होती है, वे आम तौर पर उसी default value का सीधे उपयोग कर सकती हैं।

इसलिए `Student` instance बनाते समय हमें केवल `name`, `sex`, `phone`, `age`, और `address` pass करने की ज़रूरत होती है।

### compiler संकेत

इसके अलावा, जब हम Xcode में `Student(...)` लिखते हैं, तो हमें सिस्टम द्वारा दिए गए parameter hints भी दिखाई देते हैं।

![student](../../Resource/022_student.png)

यह भी वास्तव में दिखाता है कि मौजूदा इस type के लिए सचमुच सिस्टम द्वारा अपने आप बनाया गया constructor मौजूद है।

### खुद constructor लिखना

हालाँकि सिस्टम constructor अपने आप बना सकता है, लेकिन कभी-कभी यह default initialization तरीका पूरी तरह हमारी ज़रूरतों से मेल नहीं खाता।

उदाहरण के लिए, हमारे पास एक `Movie` structure है:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

सिस्टम द्वारा अपने आप बनाए गए constructor के अनुसार, instance बनाते समय हमें ये तीनों parameters एक साथ pass करने पड़ते हैं:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

लेकिन अगर अब हम कुछ पुरानी फिल्मों का data भरना चाहते हैं और केवल फिल्म का नाम जानते हैं, director और rating नहीं जानते, तो यह थोड़ा असुविधाजनक होगा।

क्योंकि तब हमें इसे केवल इस तरह लिखना पड़ेगा:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

हालाँकि यह काम करता है, लेकिन हर बार `--` दोहराकर लिखना सुविधाजनक नहीं है।

इस समय, हम एक constructor लिख सकते हैं:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

इस तरह, पुरानी फिल्में बनाते समय हमें केवल `name` pass करना होगा:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

खुद constructor लिखने का एक अर्थ यह है: **instance बनाने के तरीके को वास्तविक ज़रूरतों के अधिक अनुरूप बनाना।**

### custom constructor का विश्लेषण

आओ, अभी-अभी हाथ से लिखे गए इस constructor को देखें:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

इस code का मतलब है कि `Movie` instance बनाते समय केवल एक `name` parameter देना आवश्यक है।

फिर constructor के अंदर pass किया गया `name`, instance के अपने `name` को assign किया जाएगा, और `director` तथा `rating` को default value `--` दी जाएगी।

यहाँ `self` का मतलब है "यह वर्तमान instance स्वयं"।

उदाहरण के लिए:

```swift
self.name = name
```

बाएँ तरफ का `self.name` instance की property को दर्शाता है; दाएँ तरफ का `name` उस parameter को दर्शाता है जो हमने pass किया है।

इसे सरल रूप में ऐसे समझा जा सकता है कि बाहर से आई value को instance की अपनी property में सहेजा जा रहा है।

जब सभी properties को value मिल जाती है, तब यह instance बनना पूरा हो जाता है।

### constructor की कार्यप्रणाली

जब हम स्पष्ट रूप से कोई constructor declare करते हैं, तब एक और बदलाव भी होता है:

सिस्टम पहले जो constructor अपने आप बनाता था, वह आम तौर पर अब सीधे उपयोग नहीं किया जा सकता।

उदाहरण के लिए:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

अब अगर हम फिर से इस तरह लिखें:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

तो compiler error देगा:

```swift
Extra arguments at positions #2, #3 in call
```

इसका मतलब है: तुमने अतिरिक्त parameters pass किए हैं।

यह error क्यों आता है?

क्योंकि मौजूदा `Movie` structure में केवल यही एक constructor मौजूद है, जिसे तुमने हाथ से declare किया है:

```swift
init(name: String)
```

यह केवल एक `name` parameter स्वीकार करता है, `director` और `rating` स्वीकार नहीं करता।

अर्थात, जब तुम अपना constructor हाथ से जोड़ते हो, तब सिस्टम द्वारा पहले अपने आप बनाई गई initialization style अब सीधे उपयोग नहीं की जा सकती।

अगर हम एक साथ "केवल नाम pass करना" और "पूरी जानकारी pass करना" - दोनों को support करना चाहते हैं, तो हमें खुद एक और पूरा constructor जोड़ना होगा:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

इस तरह, हमारे पास दो अलग-अलग constructors हो जाते हैं।

पुरानी फिल्म बनाते समय हम इस तरह लिख सकते हैं:

```swift
Movie(name: "The Night of the Hunter")
```

और पूरी जानकारी के साथ नई फिल्म बनाते समय हम इस तरह लिख सकते हैं:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

यह लिखने का तरीका यह भी दिखाता है कि एक ही type के कई constructors हो सकते हैं, जब तक उनके parameters का रूप अलग हो।

## overload क्या है

यहाँ हम एक और ज़रूरी ज्ञान-बिंदु जोड़ते हैं।

अभी हमने `Movie` के लिए दो `init` लिखे:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

इस तरह का लिखना, "एक ही function name लेकिन अलग parameters", "overload" कहलाता है।

यहाँ दोनों functions का नाम `init` है, लेकिन वे अलग parameters लेते हैं, इसलिए Swift समझ सकती है कि तुम कौन-सा function call कर रहे हो।

उदाहरण के लिए:

```swift
Movie(name: "Days of Heaven")
```

यह call करेगा:

```swift
init(name: String)
```

और:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

यह initialization method के दूसरे पूर्ण संस्करण को call करेगा।

इसलिए overload का काम यह है: एक ही type को अलग-अलग परिस्थितियों के अनुसार अलग-अलग निर्माण-तरीके देने देना।

## class से परिचय

अब आगे, संक्षेप में `class` को भी जानते हैं।

Swift में सामान्य `struct` के अलावा, कई programming languages instances बनाने के लिए `class` का उपयोग करती हैं, जैसे Java, C#, Kotlin आदि।

Swift में `class` लिखने का तरीका `struct` के बहुत करीब है।

उदाहरण के लिए:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

तुम देखोगे कि `struct` की जगह `class` keyword होने के अलावा, बाकी सब लगभग समान दिखता है।

instance बनाने का तरीका भी बहुत समान है:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

इसलिए syntax के स्तर पर `struct` और `class` वास्तव में बहुत समान हैं।

### Struct और Class का अंतर

हालाँकि `struct` और `class` बहुत समान दिखते हैं, वे पूरी तरह एक जैसे नहीं हैं।

**1. initialization का तरीका अलग है**

`struct` के लिए, अगर हम हाथ से constructor नहीं लिखते, तो सिस्टम आम तौर पर अपने आप एक उपयुक्त initialization method बना देता है।

लेकिन `class` के लिए, अगर ऐसी properties हैं जिनकी default value नहीं है, तो आम तौर पर `init` हाथ से लिखना पड़ता है, नहीं तो error आएगा।

उदाहरण के लिए:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

इस `class` में constructor न होने के कारण properties initialize नहीं होतीं, इसलिए error आता है।

compiler आम तौर पर इस तरह का संकेत दिखाएगा:

```swift
Class 'Movie' has no initializers
```

इसलिए, इस उदाहरण में `class` के लिए constructor हाथ से लिखना आवश्यक है।

**2. `struct` value type है, `class` reference type है**

`struct` value type है, और `class` reference type है।

सीखने की शुरुआत में इन दोनों concepts को पूरी तरह समझना ज़रूरी नहीं है; केवल एक सरल प्रारंभिक समझ होना ही पर्याप्त है।

उदाहरण के लिए, `struct` को "नई value की copy" की तरह समझा जा सकता है।

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

यहाँ `user1` को `user2` में assign करने के बाद, मूल रूप से नए data की copy बनती है, इसलिए `user2` बदलने से `user1` प्रभावित नहीं होता।

दूसरी ओर, `class` को "एक ही instance की ओर साथ में संकेत करना" की तरह समझा जा सकता है।

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

यहाँ `user1` और `user2` एक ही instance की ओर संकेत करते हैं।

अभी के लिए value type और reference type के अंदरूनी तंत्र को पूरी तरह समझने की ज़रूरत नहीं है; केवल इतना जानना काफी है कि `struct` स्वतंत्र data को सहेजने के लिए अधिक उपयुक्त है, जबकि `class` उन स्थितियों के लिए अधिक उपयुक्त है जहाँ कई जगहों को एक ही instance share करना होता है।

## शुरुआती चरण में कैसे चुनें

मौजूदा चरण में सामान्य data model के लिए पहले `struct` पर विचार करो, और जहाँ shared data तथा synchronized बदलावों की ज़रूरत हो, वहाँ `class` पर विचार करो।

यह कोई पूर्ण नियम नहीं है, लेकिन शुरुआती लोगों के लिए यह काफी व्यावहारिक निर्णय-तरीका है।

खासकर SwiftUI में, तुम अक्सर पाओगे कि `struct` से ही अधिकांश काम पूरे हो जाते हैं।

इसके अलावा, कई programming materials में `class` से बनी चीज़ को "object" भी कहा जाता है। शुरुआती चरण में, तुम इसे instance के रूप में ही समझ सकते हो, अलग से अंतर करने की ज़रूरत नहीं है।

## सारांश

इस पाठ में, हमने `struct` को और गहराई से सीखा, और साथ ही `class` को भी जाना। दोनों का उपयोग type परिभाषित करने के लिए किया जा सकता है।

type instances बना सकते हैं। instance बनाते समय constructor, यानी `init`, call होता है।

`struct` के लिए, अगर constructor हाथ से नहीं लिखा गया हो, तो सिस्टम आम तौर पर अपने आप एक उपयुक्त constructor बना देता है। अगर default constructor ज़रूरत पूरी नहीं करता, तो हम खुद भी constructor लिख सकते हैं।

इसके अलावा, हमने `struct` और `class` के बीच का प्रारंभिक अंतर भी जाना: `struct` value type है, जबकि `class` reference type है। SwiftUI में शुरुआती चरण में आम तौर पर `struct` से ज्यादा सामना होता है।

आगे जब हम views के बीच value pass करना, data model, और state management सीखेंगे, तब ये सारी बातें आगे भी काम आएँगी।
