# struct மற்றும் class

முந்தைய பாடத்தில், நாம் `struct` ஐ இப்போதுதான் அறிமுகமாகத் தொடங்கினோம், ஒரு structure-ஐ வரையறுத்தோம், மேலும் protocol, `UUID` போன்ற அறிவுப் பகுதிகளையும் விரிவாகக் கற்றோம்.

இப்போது, `struct` என்ற keyword பற்றி நமக்கொரு ஆரம்ப நிலை புரிதல் வந்துவிட்டது, ஆனால் அதை உண்மையாகப் புரிந்துகொண்டோம் என்று இன்னும் சொல்ல முடியாது.

இந்தப் பாடத்தில், நாம் தொடர்ந்து `struct` ஐ மைய உள்ளடக்கமாக வைத்து கற்போம், அதே சமயம் `class` ஐயும் அறிந்து கொள்வோம். இந்தப் பாடத்தின் மூலம், நீங்கள் இன்னும் தெளிவாக அறிந்து கொள்வீர்கள்: instance என்பது என்ன, constructor என்பது என்ன, மேலும் `struct` மற்றும் `class` ஐ பயன்படுத்தி தரவை ஏன் ஒழுங்குபடுத்த முடிகிறது என்பதையும்.

## மாணவர் மேலாண்மை அமைப்பு

உதாரணமாக, இப்போது நாம் ஒரு மாணவர் மேலாண்மை அமைப்பை உருவாக்க விரும்புகிறோம். ஒவ்வொரு மாணவருக்கும் பெயர், பாலினம், தொலைபேசி, வயது, வீட்டு முகவரி போன்ற தகவல்கள் உள்ளன.

இந்த நேரத்தில், இந்த தகவல்களை ஒன்றாக சேர்த்து, ஒரு `Student` structure ஆக வரையறுக்கலாம்:

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

இங்கே, நாம் `struct` ஐ பயன்படுத்தி ஒரு மாணவர் வகையை வரையறுக்கிறோம்.

இந்த `Student` structure-இல் பல properties உள்ளன:

- `id`: மாணவரின் தனிப்பட்ட அடையாளம்
- `name`: மாணவரின் பெயர்
- `sex`: மாணவரின் பாலினம்
- `phone`: மாணவரின் தொலைபேசி
- `age`: மாணவரின் வயது
- `address`: வீட்டு முகவரி

இவ்வாறு, முன்பு சிதறியிருந்த பல தரவுகள், ஒரு முழுமையான “மாணவர்” ஆக ஒன்றிணைக்கப்படுகின்றன.

இங்குள்ள `Student`, `Identifiable` protocol-ஐயும் பின்பற்றுகிறது, மேலும் `id` என்ற புலத்தையும் வரையறுக்கிறது; இதனால் பின்னர் `ForEach` loop உடன் தரவை காட்ட வசதியாக இருக்கும்.

பிறகு, நாம் ஒரு மாணவர் instance-ஐ உருவாக்கலாம்:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

இந்த code, `Student` என்ற இந்த structure-ஐ அடிப்படையாகக் கொண்டு ஒரு குறிப்பிட்ட மாணவர் தரவை உருவாக்கலாம் என்பதை குறிக்கிறது.

இதில், `Student` என்பது type, `Student(...)` என்பது உருவாக்கப்பட்ட ஒரு instance ஆகும்.

SwiftUI-யில், இந்த instance-ஐ ஒரு variable-க்கு assign செய்து, பின்னர் அதை காட்டலாம்.

உதாரணமாக:

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

இவ்வாறு, view-இல் இந்த மாணவரின் பெயரை பார்க்கலாம்: `Fang Junyu`.

இங்கே, நாம் முதலில் ஒரு `Student` instance-ஐ உருவாக்கினோம், பின்னர் அதை `student` variable-க்கு assign செய்தோம், இறுதியாக `student.name` மூலம் அதன் property-ஐ படித்தோம்.

## instance என்பது என்ன

`struct` ஐ கற்கத் தொடங்கும் போது, “instance” என்ற சொல் மிகவும் புதிதாகத் தோன்றலாம்.

ஆனால் உண்மையில், நாம்தான் ஆரம்பத்திலிருந்தே instance-களைப் பயன்படுத்திக் கொண்டிருக்கிறோம்; முன்பு அதைக் குறிப்பாக கவனிக்கவில்லை என்பதுதான் வேறுபாடு.

உதாரணமாக:

```swift
let name = "Fang Junyu"
```

இங்கே `"Fang Junyu"` என்பது ஒரு string value ஆகும்; அதன் சாராம்சத்தில், அது `String` type-இன் ஒரு instance ஆகும்.

நாம் இதுபோலவும் எழுதலாம்:

```swift
let name = String("Fang Junyu")
```

இந்த இரண்டு எழுதும் முறைகளும் ஒரே விஷயத்தைக் குறிக்கின்றன: `String` type-இன் ஒரு instance-ஐ உருவாக்கி அதை `name` variable-க்கு assign செய்வது.

அதேபோல, `Int`-க்கும் இது பொருந்தும்:

```swift
let num = 3
```

இங்கே `3`, அதன் சாராம்சத்தில் `Int` type value ஆகும்; அதையும் `Int` instance ஆகப் புரிந்துகொள்ளலாம்.

அதனால், instance என்பது `struct`-இல் மட்டுமே வரும் ஒரு சிறப்பு கருத்தல்ல.

`String`, `Int`, `Double`, `Bool`, அல்லது நாமே உருவாக்கிய `Student` எதுவாக இருந்தாலும், அவை அனைத்தும் instance-களை உருவாக்க முடியும்.

எனவே, நாம் இவ்வாறு எழுதும்போது:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

அதன் சாராம்சத்தில், இது `String`, `Int` instance-களை உருவாக்குவதற்கு சமமானதே; வித்தியாசம் என்னவென்றால் `Student` என்பது நாமே வரையறுத்த type ஆகும்.

## constructor

நாம் ஒரு instance-ஐ உருவாக்கும் போது:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

உண்மையில், நாம் `Student`-இன் initialization method-ஐ, அதாவது `init`-ஐ அழைக்கிறோம்.

constructor என்பதை நீங்கள் இப்படிப் புரிந்துகொள்ளலாம்: **instance உருவாக்கப்படும் போது property-களுக்கு மதிப்புகளை வழங்கும் entry point.**

அதாவது, ஒரு instance உண்மையாக உருவாகும் முன், அது பொதுவாக முதலில் `init` வழியாகச் செல்லும்.

உதாரணமாக, முன்பு SwiftUI view lifecycle-ஐ கற்றபோது, நாம் இப்படிப்பட்ட code-ஐ எழுதியிருந்தோம்:

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

இங்கே, `ContentView` instance உருவாக்கப்படும் போது `init()` இயங்கும்; ஆனால் `onAppear` என்பது view உண்மையில் screen-இல் காட்டப்படும் போது மட்டுமே இயங்கும். அதாவது, view உருவாக்கப்படுவது மற்றும் view காட்டப்படுவது ஒரே நேரத்தில் நிகழ்வதில்லை.

அதேபோல், நாம் `Student(...)` உருவாக்கும் போது, `Student`-இன் constructor-ஐ அழைக்கிறோம்.

### system தானாக உருவாக்கும் constructor

நாம் `Student`-ஐ வரையறுத்தபோது, `init`-ஐ கையால் எழுதவில்லை:

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

ஆனால், நாம் இன்னும் நேரடியாக instance-ஐ உருவாக்க முடிகிறது:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor எழுதாமல் instance உருவாக்க முடியுமா?

ஏனெனில் `struct` க்கு, நாம் constructor-ஐ கையால் எழுதவில்லை என்றால், system பொதுவாக தகுந்த constructor-ஐ தானாக உருவாக்கும்.

தொடக்க கட்டத்தில், இதை எளிதாக இப்படிப் புரிந்துகொள்ளலாம்: Swift நமக்குப் பதிலாக initialization code-ஐ தானாகச் சேர்க்கிறது.

சுமார் இப்படிப்பட்ட code-ஐ system நிரப்பும் என்று புரிந்துகொள்ளலாம்:

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

இங்கே ஒரு சிறிய விவரத்தை கவனிக்க வேண்டும்:

```swift
let id = UUID()
```

`id` க்கு ஏற்கனவே default value உள்ளது, ஆகவே instance உருவாக்கும் போது நாம் `id`-ஐ கையால் pass செய்ய வேண்டியதில்லை.

அதாவது, default value இல்லாத properties பொதுவாக constructor-இல் pass செய்யப்பட வேண்டும்; ஏற்கனவே default value உள்ள properties, அந்த default value-ஐ நேரடியாகப் பயன்படுத்தலாம்.

எனவே, `Student` instance உருவாக்கும் போது, `name`, `sex`, `phone`, `age`, `address` ஆகியவற்றை மட்டும் pass செய்தால் போதும்.

### compiler hint

மேலும், நாம் Xcode-இல் `Student(...)` என்று type செய்யும் போது, system தரும் parameter hint-ஐயும் பார்க்கலாம்.

![student](../../Resource/022_student.png)

இது உண்மையில் இன்னொரு விஷயத்தையும் காட்டுகிறது: தற்போதைய இந்த type-க்கு system தானாக உருவாக்கிய constructor இருக்கிறது.

### நாமே constructor எழுதுதல்

system constructor-ஐ தானாக உருவாக்க முடிந்தாலும், சில நேரங்களில் இந்த default initialization முறை நமது தேவைகளுக்கு முழுமையாகப் பொருந்தாது.

உதாரணமாக, நமக்கு ஒரு `Movie` structure உள்ளது:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

system தானாக உருவாக்கிய constructor படி, instance உருவாக்கும் போது, இந்த மூன்று parameters-ஐயும் ஒன்றாக pass செய்ய வேண்டும்:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ஆனால், இப்போது பழைய படங்களின் ஒரு தொகுப்பை உள்ளிட வேண்டும், ஆனால் படத்தின் பெயர் மட்டும் தெரியும், director மற்றும் rating தெரியாது என்றால், அது சற்று சிரமமாக இருக்கும்.

ஏனெனில் நம்மால் இவ்வாறு மட்டுமே எழுத முடியும்:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

இது வேலை செய்தாலும், ஒவ்வொரு முறையும் `--` என்று மீண்டும் மீண்டும் எழுதுவது வசதியாக இல்லை.

அப்போது நாம் ஒரு constructor எழுதலாம்:

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

இவ்வாறு, பழைய படங்களை உருவாக்கும் போது, `name` மட்டும் pass செய்தால் போதும்:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

இதுவே நாமே constructor எழுதுவதன் ஒரு அர்த்தம்: **instance உருவாக்கும் முறையை நிஜ தேவைகளுக்கு இன்னும் பொருத்தமாக மாற்றுவது.**

### custom constructor பகுப்பாய்வு

இப்போது நாமே எழுதிய இந்த constructor-ஐப் பார்ப்போம்:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

இந்த code-இன் பொருள், `Movie` instance உருவாக்கும் போது, `name` என்ற ஒரு parameter மட்டும் pass செய்ய வேண்டும் என்பதாகும்.

பிறகு, constructor-இன் உள்ளே, pass செய்யப்பட்ட `name`, instance-இன் `name` property-க்கு assign செய்யப்படும்; `director` மற்றும் `rating`-க்கு default value `--` கொடுக்கப்படும்.

இங்கே `self` என்பது “தற்போதைய இந்த instance தானே” என்று பொருள்.

உதாரணமாக:

```swift
self.name = name
```

இடப்பக்கத்தில் உள்ள `self.name` என்பது instance-இன் property; வலப்பக்கத்தில் உள்ள `name` என்பது நாம் pass செய்த parameter.

இதை எளிதாக இப்படிப் புரிந்துகொள்ளலாம்: வெளியிருந்து pass செய்யப்பட்ட value, instance-இன் சொந்த property-இல் சேமிக்கப்படுகிறது.

அனைத்து properties-க்கும் values assign செய்யப்பட்ட பிறகு, அந்த instance உருவாகிவிடும்.

### constructor mechanism

நாம் constructor-ஐ வெளிப்படையாக declare செய்தால், இன்னொரு மாற்றமும் ஏற்படும்:

மூலத்தில் system தானாக உருவாக்கிய constructor பொதுவாக இனி நேரடியாகப் பயன்படுத்த முடியாது.

உதாரணமாக:

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

இப்போது நாம் மீண்டும் இவ்வாறு எழுதினால்:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler error தரும்:

```swift
Extra arguments at positions #2, #3 in call
```

அதன் பொருள்: நீங்கள் தேவையற்ற கூடுதல் arguments-ஐ pass செய்துள்ளீர்கள்.

ஏன் இந்த error வருகிறது?

ஏனெனில் தற்போதைய `Movie` structure-இல், நீங்கள் கையால் declare செய்த இந்த ஒரு constructor மட்டுமே உள்ளது:

```swift
init(name: String)
```

இது `name` என்ற ஒரு parameter-ஐ மட்டுமே ஏற்கும்; `director`, `rating`-ஐ ஏற்காது.

அதாவது, நீங்கள் உங்கள் சொந்த constructor-ஐ கையால் சேர்த்தபின், முன்பு system தானாக உருவாக்கிய initialization முறை இனி நேரடியாக பயன்படுத்த முடியாது.

நாம் “பெயரை மட்டும் pass செய்வது” மற்றும் “முழு தகவல்களையும் pass செய்வது” ஆகிய இரண்டையும் ஆதரிக்க விரும்பினால், இன்னொரு முழுமையான constructor-ஐ நாமே கூடுதலாக எழுத வேண்டும்:

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

இவ்வாறு, நமக்கு இரண்டு வெவ்வேறு constructors இருக்கும்.

பழைய படங்களை உருவாக்கும் போது, இவ்வாறு எழுதலாம்:

```swift
Movie(name: "The Night of the Hunter")
```

முழு தகவல்களுடன் புதிய படங்களை உருவாக்கும் போது, இவ்வாறு எழுதலாம்:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

இந்த எழுத்து முறை இன்னொரு விஷயத்தையும் காட்டுகிறது: ஒரே type-க்கு பல constructors இருக்கலாம்; அவற்றின் parameter வடிவம் வேறுபட்டால் போதும்.

## overloading என்பது என்ன

இங்கே இன்னொரு அவசியமான அறிவுப் பகுதியைச் சேர்த்துக் கொள்வோம்.

இப்போதுதான் `Movie` க்கு இரண்டு `init` எழுதியுள்ளோம்:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

“ஒரே function name, ஆனால் parameters வேறு” என்ற இந்த எழுத்து முறை, “overloading” என்று அழைக்கப்படுகிறது.

இங்கே, இரண்டு functions-க்கும் `init` என்றே பெயர், ஆனால் அவை பெறும் parameters வேறுபடுகின்றன; அதனால் Swift நீங்கள் எந்த function-ஐ அழைக்கிறீர்கள் என்பதை வேறுபடுத்த முடியும்.

உதாரணமாக:

```swift
Movie(name: "Days of Heaven")
```

இது அழைப்பது:

```swift
init(name: String)
```

ஆனால்:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

மற்றொரு முழுமையான initialization method-ஐ அழைக்கும்.

எனவே, overloading-இன் பங்கு என்னவென்றால்: ஒரே type, வெவ்வேறு சூழல்களுக்கு ஏற்ப வெவ்வேறு உருவாக்க முறைகளை வழங்க முடியும்.

## class ஐ அறிதல்

அடுத்து, `class` ஐ சுருக்கமாக அறிந்துகொள்வோம்.

Swift-இல் பொதுவாகப் பயன்படுத்தப்படும் `struct` தவிர, பல programming languages instance உருவாக்க `class`-ஐ பயன்படுத்துகின்றன; உதாரணமாக Java, C#, Kotlin போன்றவை.

Swift-இல், `class` எழுதும் முறை `struct` உடன் மிகவும் ஒத்ததாகும்.

உதாரணமாக:

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

`struct` என்பதிலிருந்து `class` என்று keyword மட்டும் மாறியதைத் தவிர, மற்ற பகுதிகள் கிட்டத்தட்ட ஒன்றுபோலத் தோன்றுகின்றன என்பதை நீங்கள் காண்பீர்கள்.

instance உருவாக்கும் முறையும் மிகவும் ஒத்ததாகும்:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ஆகையால், syntax அளவில் பார்த்தால், `struct` மற்றும் `class` உண்மையிலேயே மிகவும் ஒத்தவை.

### Struct மற்றும் Class இடையிலான வேறுபாடு

`struct` மற்றும் `class` மிகவும் ஒத்ததாகத் தோன்றினாலும், அவை முற்றிலும் ஒன்றல்ல.

**1. Initialization முறை வேறுபடும்**

`struct` க்கு, constructor-ஐ கையால் எழுதவில்லை என்றால், system பொதுவாக தகுந்த initialization method-ஐ தானாக உருவாக்கும்.

ஆனால் `class` க்கு, சில properties-க்கு இன்னும் default value இல்லையெனில், பொதுவாக `init`-ஐ கையால் எழுத வேண்டும்; இல்லையெனில் error வரும்.

உதாரணமாக:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

இந்த `class`-க்கு constructor இல்லை, அதனால் properties initialize செய்யப்படவில்லை என்பதால் error வரும்.

compiler பொதுவாக இப்படிப்பட்ட hint தரும்:

```swift
Class 'Movie' has no initializers
```

எனவே, இந்த எடுத்துக்காட்டில் `class` க்கு constructor-ஐ கையால் எழுத வேண்டும்.

**2. `struct` என்பது value type, `class` என்பது reference type**

`struct` என்பது value type, `class` என்பது reference type.

தொடக்க கட்டத்தில், இந்த இரண்டு கருத்துகளையும் முழுமையாகக் கற்றிருக்க வேண்டிய அவசியமில்லை; ஒரு எளிய புரிதல் இருந்தாலே போதும்.

உதாரணமாக, `struct` என்பது “ஒரு புதிய value copy உருவாக்குவது” போன்றது.

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

இங்கே `user1`-ஐ `user2`-க்கு assign செய்த பிறகு, அது ஒரு புதிய data copy உருவானது போன்றது; ஆகவே `user2`-ஐ மாற்றினாலும் `user1` பாதிக்கப்படாது.

ஆனால் `class` என்பது “ஒரே instance-ஐ இருவரும் சுட்டிக்காட்டுவது” போன்றது.

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

இங்கே `user1` மற்றும் `user2`, ஒரே instance-ஐ சுட்டிக்காட்டுகின்றன.

இப்போது value type, reference type ஆகியவற்றின் அடிப்படை உள்முறையை முழுமையாகப் புரிந்துகொள்ள வேண்டியதில்லை; `struct` தனித்தனி தரவுகளைச் சேமிக்க ஏற்றது, `class` பல இடங்களில் ஒரே instance-ஐ பகிர வேண்டிய சூழலில் ஏற்றது என்பதை மட்டும் அறிந்தால் போதும்.

## தொடக்க கட்டத்தில் எப்படி தேர்வு செய்வது

தற்போதைய கட்டத்தில், சாதாரண data model களுக்குப் `struct`-ஐ முதலில் பரிசீலிக்கலாம்; பகிரப்பட்டு ஒரே நேரத்தில் மாற்றப்பட வேண்டிய தரவுகளுக்கு `class`-ஐப் பரிசீலிக்கலாம்.

இது ஒரு முழுமையான நிரந்தர விதி அல்ல; ஆனால் தொடக்கநிலையினருக்கு போதுமான அளவு பயனுள்ள ஒரு தேர்வு முறை.

குறிப்பாக SwiftUI-யில், பல நேரங்களில் `struct` ஏற்கனவே பெரும்பாலான பணிகளைச் செய்ய முடியும் என்பதை நீங்கள் காண்பீர்கள்.

மேலும், பல programming materials-இல் `class` மூலம் உருவாக்கப்படும் உள்ளடக்கத்தை “object” என்றும் அழைப்பார்கள். தொடக்க கட்டத்தில், அதை instance போலவே புரிந்துகொள்ளலாம்; இரண்டையும் குறிப்பாக வேறுபடுத்தத் தேவையில்லை.

## சுருக்கம்

இந்தப் பாடத்தில், நாம் `struct` ஐ ஆழமாகக் கற்றோம், அதோடு `class` ஐயும் அறிந்துகொண்டோம்; இவ்விரண்டும் types-ஐ வரையறுக்கப் பயன்படுத்தப்படலாம்.

types instance-களை உருவாக்க முடியும். instance உருவாக்கும் போது, constructor, அதாவது `init`, அழைக்கப்படும்.

`struct` க்கு, constructor-ஐ கையால் எழுதவில்லை என்றால், system பொதுவாக தகுந்த constructor-ஐ தானாக உருவாக்கும். default constructor தேவையை பூர்த்தி செய்யவில்லை என்றால், நாமே constructor-ஐ கையால் எழுதலாம்.

மேலும், `struct` மற்றும் `class` இடையிலான வேறுபாட்டையும் ஆரம்ப நிலையில் அறிந்துகொண்டோம்: `struct` என்பது value type, `class` என்பது reference type. SwiftUI-யில், தொடக்கநிலையிலேயே அதிகமாகச் சந்திக்கப்படுவது பொதுவாக `struct` தான்.

பின்னர் view-களில் value pass செய்தல், data model கள் மற்றும் state management ஆகியவற்றைக் கற்கும் போது, இந்த உள்ளடக்கங்கள் தொடர்ந்து பயன்படும்.
