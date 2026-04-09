# struct आणि class

मागील धड्यात, आपण नुकतेच `struct` ची ओळख करून घेतली, एक structure परिभाषित केले, आणि त्यासोबत protocol, `UUID` यांसारख्या गोष्टींबद्दलही अधिक शिकलो.

आता `struct` keyword बद्दल आपल्याला प्राथमिक समज आली आहे, पण अजून ते खरोखर पूर्णपणे समजले असे म्हणता येणार नाही.

या धड्यात, आपण `struct` ला मुख्य विषय म्हणून पुढे नेऊ, आणि सोबतच `class` चीही ओळख करून घेऊ. या धड्यामुळे तुम्हाला अधिक स्पष्टपणे समजेल: instance म्हणजे काय, constructor म्हणजे काय, आणि आपण `struct` व `class` वापरून data का आणि कसे आयोजित करू शकतो.

## विद्यार्थी व्यवस्थापन प्रणाली

उदाहरणार्थ, आता आपण एक विद्यार्थी व्यवस्थापन प्रणाली विकसित करणार आहोत. प्रत्येक विद्यार्थ्याकडे नाव, लिंग, फोन, वय, घरचा पत्ता अशी माहिती असते.

या वेळी आपण ही सर्व माहिती एकत्र करून तिला `Student` structure म्हणून परिभाषित करू शकतो:

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

येथे आपण `struct` वापरून विद्यार्थ्याचा एक type परिभाषित केला आहे.

या `Student` structure मध्ये अनेक properties आहेत:

- `id`: विद्यार्थ्याची अद्वितीय ओळख
- `name`: विद्यार्थ्याचे नाव
- `sex`: विद्यार्थ्याचे लिंग
- `phone`: विद्यार्थ्याचा फोन
- `age`: विद्यार्थ्याचे वय
- `address`: घरचा पत्ता

अशा प्रकारे, आधी वेगवेगळ्या ठिकाणी असलेला अनेक data मिळून एक संपूर्ण "विद्यार्थी" तयार होतो.

येथील `Student` `Identifiable` protocol चेही पालन करतो, आणि `id` field परिभाषित करतो, ज्यामुळे पुढे `ForEach` loop सोबत data दाखवणे सोयीचे होते.

नंतर आपण विद्यार्थ्याचा एक instance तयार करू शकतो:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

हा code दाखवतो की `Student` या रचनेनुसार आपण एखाद्या विशिष्ट विद्यार्थ्याचा data तयार करू शकतो.

येथे `Student` हा type आहे, आणि `Student(...)` म्हणजे तयार केलेला एक instance.

SwiftUI मध्ये, आपण हा instance एखाद्या variable ला assign करून नंतर तो दाखवू शकतो.

उदाहरणार्थ:

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

अशा प्रकारे, आपण view मध्ये या विद्यार्थ्याचे नाव `Fang Junyu` पाहू शकतो.

येथे, आपण आधी `Student` चा एक instance तयार केला, नंतर तो `student` variable ला assign केला, आणि शेवटी `student.name` द्वारे त्याची property वाचली.

## instance म्हणजे काय

जेव्हा आपण `struct` शिकायला सुरुवात करतो, तेव्हा "instance" हा शब्द खूप अनोळखी वाटू शकतो.

पण प्रत्यक्षात, आपण सुरुवातीपासूनच instances वापरत आलो आहोत, फक्त आधी त्याकडे विशेष लक्ष दिले नव्हते.

उदाहरणार्थ:

```swift
let name = "Fang Junyu"
```

येथे `"Fang Junyu"` ही एक string value आहे, आणि मूलत: ती `String` type चा एक instance आहे.

आपण हे असेही लिहू शकतो:

```swift
let name = String("Fang Junyu")
```

ही दोन्ही लिहिण्याची पद्धत एकच गोष्ट सांगतात: `String` type चा instance तयार करणे आणि तो `name` variable ला assign करणे.

तसंच, `Int` साठीही हेच लागू होते:

```swift
let num = 3
```

येथे `3` मूलत: `Int` type ची value आहे, आणि तिला `Int` instance म्हणूनही समजता येते.

म्हणून, instance ही अशी काही खास संकल्पना नाही जी फक्त `struct` मध्येच दिसते.

`String`, `Int`, `Double`, `Bool`, किंवा custom `Student` कोणतेही असो, हे सगळे instances तयार करू शकतात.

म्हणून, जेव्हा आपण असे लिहितो:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ते मूलभूतपणे `String` किंवा `Int` चा instance तयार करण्यासारखेच आहे, फक्त `Student` हा आपण स्वतः परिभाषित केलेला type आहे.

## constructor

जेव्हा आपण एक instance तयार करतो:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

तेव्हा आपण प्रत्यक्षात `Student` ची initialization method, म्हणजे `init`, call करत असतो.

constructor ला तुम्ही असे समजू शकता: **instance तयार करताना properties ला values देण्याचा हा प्रवेशबिंदू आहे.**

म्हणजे, एखादा instance प्रत्यक्षात पूर्ण तयार होण्यापूर्वी तो साधारणपणे आधी `init` मधून जातो.

उदाहरणार्थ, आपण आधी SwiftUI view lifecycle शिकत असताना असा code लिहिला होता:

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

येथे `init()` हे `ContentView` instance तयार होताना चालते, तर `onAppear` हे view खरोखर screen वर दिसल्यावरच चालते. म्हणजेच, view तयार होणे आणि view दिसणे हे एकाच वेळी होत नाही.

त्याचप्रमाणे, आपण `Student(...)` तयार करताना `Student` चा constructor call करत असतो.

### सिस्टीमकडून आपोआप तयार होणारा constructor

जेव्हा आपण `Student` परिभाषित केले, तेव्हा आपण `init` हाताने लिहिले नव्हते:

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

तरीसुद्धा, आपण थेट instance तयार करू शकतो:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor न लिहिताही instance तयार कसा होऊ शकतो?

कारण `struct` साठी, जर आपण constructor हाताने लिहिला नाही, तर सिस्टीम साधारणपणे आपोआप आपल्या साठी योग्य constructor तयार करते.

शिकण्याच्या सुरुवातीच्या टप्प्यात हे साधेपणाने असे समजू शकतो: Swift आपल्या वतीने initialization code आपोआप भरून देतो.

मोठ्या प्रमाणावर असे समजू शकतो की सिस्टीम आपल्या साठी खालील code तयार करते:

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

येथे एक छोटासा मुद्दा लक्षात घ्यावा लागेल:

```swift
let id = UUID()
```

`id` कडे आधीपासूनच default value आहे, त्यामुळे instance तयार करताना आपल्याला `id` पुन्हा हाताने pass करण्याची गरज नसते.

म्हणजे, ज्या properties कडे default value नसते, त्या साधारणपणे constructor मध्ये pass कराव्या लागतात; आणि ज्या properties कडे आधीपासून default value असते, त्या साधारणपणे तीच value थेट वापरू शकतात.

म्हणून `Student` instance तयार करताना आपल्याला फक्त `name`, `sex`, `phone`, `age`, आणि `address` pass करावे लागतात.

### compiler कडून मिळणारे संकेत

याशिवाय, जेव्हा आपण Xcode मध्ये `Student(...)` लिहितो, तेव्हा सिस्टीम देत असलेले parameter hints देखील दिसतात.

![student](../../Resource/022_student.png)

हे देखील प्रत्यक्षात दाखवते की सध्याच्या या type साठी सिस्टीमने आपोआप तयार केलेला constructor खरोखरच अस्तित्वात आहे.

### स्वतः constructor लिहिणे

जरी सिस्टीम constructor आपोआप तयार करू शकत असली, तरी कधीकधी ही default initialization पद्धत आपल्या गरजांशी पूर्णपणे जुळत नाही.

उदाहरणार्थ, आपल्याकडे `Movie` structure आहे:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

सिस्टीमने आपोआप तयार केलेल्या constructor नुसार, instance तयार करताना आपल्याला हे तीनही parameters एकाच वेळी pass करावे लागतात:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

पण जर आता आपल्याला काही जुन्या चित्रपटांची नोंद करायची असेल, आणि फक्त चित्रपटाचे नावच माहिती असेल, director आणि rating माहिती नसेल, तर ते थोडे गैरसोयीचे ठरेल.

कारण मग आपल्याला हे फक्त असेच लिहावे लागेल:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

हे काम करत असले तरी, दरवेळी `--` लिहिणे सोयीचे नाही.

अशा वेळी, आपण एक constructor लिहू शकतो:

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

अशा प्रकारे, जुने चित्रपट तयार करताना फक्त `name` pass केले की पुरेसे होते:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

स्वतः constructor लिहिण्याचा हा एक अर्थ आहे: **instance तयार करण्याची पद्धत प्रत्यक्ष गरजांशी अधिक जुळवून घेणे.**

### custom constructor चे विश्लेषण

आता आपण आत्ताच हाताने लिहिलेला हा constructor पाहूया:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

या code चा अर्थ असा आहे की `Movie` instance तयार करताना फक्त `name` हा एकच parameter द्यावा लागतो.

नंतर constructor च्या आत दिलेले `name`, instance च्या स्वतःच्या `name` ला assign केले जाते, आणि `director` व `rating` यांना default value `--` दिली जाते.

येथे `self` म्हणजे "हा सध्याचा instance स्वतः".

उदाहरणार्थ:

```swift
self.name = name
```

डाव्या बाजूचे `self.name` instance मधील property दर्शवते; उजव्या बाजूचे `name` आपण दिलेला parameter दर्शवते.

हे सोप्या भाषेत असे समजू शकतो की बाहेरून आलेली value instance च्या स्वतःच्या property मध्ये साठवली जाते.

जेव्हा सर्व properties ना values मिळतात, तेव्हा हा instance तयार होण्याची प्रक्रिया पूर्ण होते.

### constructor ची कार्यपद्धती

जेव्हा आपण स्पष्टपणे constructor declare करतो, तेव्हा आणखी एक बदल होतो:

सिस्टीमने आधी आपोआप तयार केलेला constructor साधारणपणे आता थेट वापरता येत नाही.

उदाहरणार्थ:

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

आता जर आपण पुन्हा असे लिहिले:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

तर compiler error दाखवेल:

```swift
Extra arguments at positions #2, #3 in call
```

याचा अर्थ: तुम्ही जास्तीचे parameters pass केले आहेत.

हा error का येतो?

कारण सध्याच्या `Movie` structure मध्ये फक्त हा एकच constructor आहे, जो तुम्ही हाताने declare केला आहे:

```swift
init(name: String)
```

तो फक्त `name` हा एकच parameter स्वीकारतो; `director` आणि `rating` स्वीकारत नाही.

म्हणजे, तुम्ही स्वतःचा constructor हाताने जोडल्यावर, आधी सिस्टीमने आपोआप तयार केलेली initialization style आता थेट वापरता येत नाही.

जर आपल्याला एकाचवेळी "फक्त नाव देणे" आणि "पूर्ण माहिती देणे" हे दोन्ही support करायचे असतील, तर आपल्यालाच एक पूर्ण constructor अजून लिहावा लागेल:

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

अशा प्रकारे, आपल्याकडे दोन वेगळे constructors होतात.

जुना चित्रपट तयार करताना आपण असे लिहू शकतो:

```swift
Movie(name: "The Night of the Hunter")
```

पूर्ण माहिती असलेला नवा चित्रपट तयार करताना आपण असे लिहू शकतो:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

या प्रकारच्या लिखाणातून हेही दिसते की एकाच type साठी अनेक constructors असू शकतात, जोपर्यंत त्यांच्या parameters चे स्वरूप वेगळे असते.

## overload म्हणजे काय

येथे आपण अजून एक आवश्यक ज्ञानबिंदू जोडूया.

आत्ताच आपण `Movie` साठी दोन `init` लिहिले:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

या प्रकारच्या, "एकच function name पण वेगळे parameters" असलेल्या लिखाणाला "overload" म्हणतात.

येथे दोन्ही functions चे नाव `init` आहे, पण त्या वेगवेगळे parameters घेत असल्यामुळे, Swift ला तुम्ही कोणते function call करत आहात ते ओळखता येते.

उदाहरणार्थ:

```swift
Movie(name: "Days of Heaven")
```

हे call करेल:

```swift
init(name: String)
```

आणि:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

हे initialization method च्या दुसऱ्या पूर्ण version ला call करेल.

म्हणून overload चे काम म्हणजे, एकाच type ला वेगवेगळ्या परिस्थितीनुसार वेगवेगळे निर्माण मार्ग देणे.

## class ची ओळख

आता पुढे, संक्षिप्तपणे `class` चीही ओळख करून घेऊया.

Swift मधील सामान्य `struct` शिवाय, अनेक programming languages instances तयार करण्यासाठी `class` वापरतात, जसे Java, C#, Kotlin इत्यादी.

Swift मध्ये `class` लिहिण्याची पद्धत `struct` शी खूप जवळची आहे.

उदाहरणार्थ:

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

तुम्हाला दिसेल की `struct` ऐवजी `class` keyword आले आहे, एवढाच फरक आहे; बाकी सर्व जवळजवळ सारखेच दिसते.

instance तयार करण्याची पद्धतही खूप समान आहे:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

म्हणून syntax च्या पातळीवर `struct` आणि `class` खरोखरच खूप सारखे आहेत.

### Struct आणि Class मधील फरक

जरी `struct` आणि `class` खूप सारखे दिसतात, तरी ते पूर्णपणे सारखे नाहीत.

**1. initialization ची पद्धत वेगळी असते**

`struct` साठी, जर आपण constructor हाताने लिहिला नाही, तर सिस्टीम साधारणपणे योग्य initialization method आपोआप तयार करते.

पण `class` साठी, जर अशा properties असतील ज्यांच्याकडे default value नाही, तर साधारणपणे `init` हाताने लिहावा लागतो; नाहीतर error येतो.

उदाहरणार्थ:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

या `class` मध्ये constructor नसल्यामुळे properties initialize होत नाहीत, म्हणून error येतो.

compiler साधारणपणे असा संदेश दाखवतो:

```swift
Class 'Movie' has no initializers
```

म्हणून या उदाहरणात `class` साठी constructor हाताने लिहिणे आवश्यक आहे.

**2. `struct` हा value type आहे, `class` हा reference type आहे**

`struct` हा value type आहे, आणि `class` हा reference type आहे.

शिकण्याच्या सुरुवातीच्या टप्प्यात, या दोन concepts ला पूर्णपणे समजून घेणे आवश्यक नाही; फक्त एक साधी प्राथमिक समज पुरेशी आहे.

उदाहरणार्थ, `struct` हा "नवीन value ची copy" यासारखा अधिक असतो.

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

येथे `user1` ला `user2` ला assign केल्यानंतर, मुळात नवीन data copy तयार होते; म्हणून `user2` बदलल्यावर `user1` वर परिणाम होत नाही.

दुसरीकडे, `class` हा "एकाच instance कडे एकत्र निर्देश करणे" यासारखा अधिक असतो.

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

येथे `user1` आणि `user2` हे एकाच instance कडे निर्देश करतात.

आत्ता value type आणि reference type यांचे आतील कार्य पूर्णपणे समजून घेण्याची गरज नाही; फक्त एवढे माहीत असले की `struct` स्वतंत्र data साठवण्यासाठी अधिक योग्य आहे, तर `class` अनेक ठिकाणी एकच instance share करायचा असेल तेव्हा अधिक योग्य आहे.

## सुरुवातीच्या टप्प्यात कसे निवडावे

सध्याच्या टप्प्यात, सामान्य data model साठी आधी `struct` विचारात घ्या; आणि shared data व synchronized बदलांची गरज असेल तेव्हा `class` विचारात घ्या.

हे काही पूर्ण नियम नाही, पण नवशिक्यांसाठी पुरेसे व्यावहारिक असे निर्णयमानक आहे.

विशेषतः SwiftUI मध्ये, तुम्हाला अनेक वेळा दिसेल की `struct` नेच बहुतेक काम होऊ शकते.

याशिवाय, अनेक programming materials मध्ये `class` ने तयार झालेल्या गोष्टीला "object" असेही म्हटले जाते. सुरुवातीच्या टप्प्यात, तुम्ही त्याला instance म्हणूनच समजू शकता; वेगळे फरक करण्याची गरज नाही.

## सारांश

या धड्यात, आपण `struct` अधिक खोलवर शिकलो, आणि त्याचवेळी `class` चीही ओळख करून घेतली. हे दोन्ही types परिभाषित करण्यासाठी वापरले जाऊ शकतात.

Types instances तयार करू शकतात. Instance तयार करताना constructor, म्हणजे `init`, call होतो.

`struct` साठी, जर आपण constructor हाताने लिहिला नाही, तर सिस्टीम साधारणपणे योग्य constructor आपोआप तयार करते. जर default constructor गरजा पूर्ण करत नसेल, तर आपण स्वतःही constructor लिहू शकतो.

याशिवाय, `struct` आणि `class` मधील प्राथमिक फरकाबद्दलही आपल्याला समजले: `struct` हा value type आहे, तर `class` हा reference type आहे. SwiftUI मध्ये सुरुवातीच्या टप्प्यात सामान्यतः `struct` जास्त वेळा भेटतो.

पुढे views दरम्यान value pass करणे, data models, आणि state management शिकताना, हे सर्व पुन्हा पुन्हा उपयोगी पडणार आहे.
