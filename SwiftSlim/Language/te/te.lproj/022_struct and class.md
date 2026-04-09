# struct మరియు class

మునుపటి పాఠంలో, మనం ఇప్పుడే `struct` ను పరిచయం చేసుకోవడం ప్రారంభించాము, ఒక structure ను నిర్వచించాము, అలాగే protocol, `UUID` వంటి జ్ఞానాంశాలను కూడా విస్తరించి నేర్చుకున్నాము.

ఇప్పుడు, `struct` keyword గురించి మనకు ఒక ప్రారంభ స్థాయి అవగాహన వచ్చింది, కానీ దాన్ని పూర్తిగా అర్థం చేసుకున్నామని ఇంకా చెప్పలేం.

ఈ పాఠంలో, మనం ఇంకా `struct` నే ప్రధాన అంశంగా తీసుకుని ముందుకు సాగుతాము, అలాగే `class` ను కూడా పరిచయం చేసుకుంటాము. ఈ పాఠం ద్వారా, మీకు మరింత స్పష్టంగా తెలుస్తుంది: instance అంటే ఏమిటి, constructor అంటే ఏమిటి, అలాగే `struct` మరియు `class`లను ఉపయోగించి మనం data ను ఎందుకు నిర్వహించగలము.

## విద్యార్థుల నిర్వహణ వ్యవస్థ

ఉదాహరణకు, ఇప్పుడు మనం ఒక విద్యార్థుల నిర్వహణ వ్యవస్థను అభివృద్ధి చేయాలని అనుకుంటున్నాం. ప్రతి విద్యార్థికి పేరు, లింగం, ఫోన్, వయస్సు, ఇంటి చిరునామా వంటి సమాచారం ఉంటుంది.

ఈ సమయంలో, ఈ సమాచారాన్ని కలిసి ఒక `Student` structure గా నిర్వచించవచ్చు:

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

ఇక్కడ మనం `struct` ను ఉపయోగించి ఒక విద్యార్థి type ను నిర్వచించాము.

ఈ `Student` structure లో అనేక properties ఉన్నాయి:

- `id`: విద్యార్థి యొక్క ప్రత్యేక గుర్తింపు
- `name`: విద్యార్థి పేరు
- `sex`: విద్యార్థి లింగం
- `phone`: విద్యార్థి ఫోన్
- `age`: విద్యార్థి వయస్సు
- `address`: ఇంటి చిరునామా

ఈ విధంగా, మొదట విడిగా ఉన్న అనేక dataలు కలిపి ఒక సంపూర్ణ “విద్యార్థి”గా ఏర్పడతాయి.

ఇక్కడి `Student`, `Identifiable` protocol ను కూడా అనుసరిస్తుంది, అలాగే `id` field ను నిర్వచిస్తుంది, తద్వారా తరువాత `ForEach` loop తో dataను చూపించడం సులభంగా ఉంటుంది.

తర్వాత, మనం ఒక విద్యార్థి instance ను సృష్టించవచ్చు:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ఈ code, `Student` అనే ఈ structure ప్రకారం ఒక నిర్దిష్ట విద్యార్థి data ను సృష్టించవచ్చని సూచిస్తుంది.

ఇందులో, `Student` అనేది type, `Student(...)` అనేది సృష్టించబడిన ఒక instance ను సూచిస్తుంది.

SwiftUI లో, ఈ instance ను ఒక variable కు assign చేసి, తరువాత చూపించవచ్చు.

ఉదాహరణకు:

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

ఇలా, view లో ఈ విద్యార్థి పేరు `Fang Junyu` ను చూడవచ్చు.

ఇక్కడ, మనం ముందుగా ఒక `Student` instance ను సృష్టించాము, తరువాత దాన్ని `student` variable కు assign చేసాము, చివరగా `student.name` ద్వారా అందులోని property ను చదివాము.

## instance అంటే ఏమిటి

`struct` ను నేర్చుకోవడం మొదలుపెట్టినప్పుడు, “instance” అనే పదం చాలా అపరిచితంగా అనిపించవచ్చు.

కానీ నిజానికి, మనం మొదటి నుంచే instance లను ఉపయోగిస్తున్నాము, కేవలం ముందు వాటిపై ప్రత్యేకంగా దృష్టి పెట్టలేదు.

ఉదాహరణకు:

```swift
let name = "Fang Junyu"
```

ఇక్కడ `"Fang Junyu"` ఒక string value, దాని అసలు స్వరూపంలో అది `String` type యొక్క ఒక instance.

మనము ఇలా కూడా వ్రాయవచ్చు:

```swift
let name = String("Fang Junyu")
```

ఈ రెండు రాయబడిన విధానాలూ ఒకటే అర్థాన్ని ఇస్తాయి: `String` type యొక్క ఒక instance ను సృష్టించి, దానిని `name` variable కు assign చేయడం.

అదే విధంగా, `Int` కూడా:

```swift
let num = 3
```

ఇక్కడ `3`, అసలు చూస్తే `Int` type యొక్క ఒక value, దానిని ఒక `Int` instance గా కూడా అర్థం చేసుకోవచ్చు.

అందువల్ల, instance అనేది `struct` లో మాత్రమే కనిపించే ప్రత్యేక భావన కాదు.

`String`, `Int`, `Double`, `Bool`, లేదా మనం స్వయంగా నిర్వచించిన `Student` అయినా, ఇవన్నీ instance లను సృష్టించగలవు.

అందువల్ల, మనం ఇలా వ్రాసినప్పుడు:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

దాని స్వభావం `String`, `Int` యొక్క instance లను సృష్టించడం లాంటిదే, కానీ `Student` అనేది మనమే నిర్వచించిన type.

## constructor

మనము ఒక instance ను సృష్టించినప్పుడు:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

నిజానికి, మనం `Student` యొక్క initialization method అయిన `init` ను పిలుస్తున్నాము.

constructor ను మీరు ఇలా అర్థం చేసుకోవచ్చు: **instance ను సృష్టించే సమయంలో properties కు values ను assign చేసే ప్రవేశద్వారం.**

అంటే, ఒక instance నిజంగా సృష్టించబడే ముందు, సాధారణంగా అది ముందుగా `init` ద్వారా వెళ్లాలి.

ఉదాహరణకు, ముందు SwiftUI view lifecycle ను నేర్చుకున్నప్పుడు, మనం ఇలా code వ్రాసాము:

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

ఇక్కడ, `ContentView` instance సృష్టించబడినప్పుడు `init()` అమలవుతుంది, కానీ `onAppear` మాత్రం view నిజంగా screen పై కనబడినప్పుడు మాత్రమే అమలవుతుంది. అంటే, view సృష్టించబడటం మరియు view చూపించబడటం ఒకే సమయం కాదు.

అలాగే, మనం `Student(...)` ను సృష్టించినప్పుడు, `Student` యొక్క constructor ను పిలుస్తున్నాము.

### system స్వయంచాలకంగా సృష్టించే constructor

మనము `Student` ను నిర్వచించినప్పుడు, `init` ను చేతితో వ్రాయలేదు:

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

అయినా, మనం ఇంకా నేరుగా ఒక instance ను సృష్టించగలుగుతున్నాము:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor లేకుండానే instance ను ఎలా సృష్టించగలుగుతున్నాం?

ఎందుకంటే `struct` కొరకు, మనం constructor ను చేతితో వ్రాయకపోతే, system సాధారణంగా మన కోసం ఒక సరైన constructor ను స్వయంచాలకంగా సృష్టిస్తుంది.

ప్రారంభ దశలో, దీన్ని సులభంగా ఇలా అర్థం చేసుకోవచ్చు: Swift మన కోసం initialization code ను ఆటోమేటిక్‌గా పూర్తి చేస్తుంది.

సుమారు, system మన కోసం కింది code ను నింపుతుందని అర్థం చేసుకోవచ్చు:

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

ఇక్కడ ఒక చిన్న విషయాన్ని గమనించాలి:

```swift
let id = UUID()
```

`id` కు ఇప్పటికే default value ఉంది, కాబట్టి instance ను సృష్టించే సమయంలో మనం `id` ను చేతితో pass చేయాల్సిన అవసరం లేదు.

అంటే, default value లేని properties ను సాధారణంగా constructor లో pass చేయాలి; ఇప్పటికే default value ఉన్న properties అయితే ఆ default value నే నేరుగా ఉపయోగించవచ్చు.

అందువల్ల, `Student` instance ను సృష్టించే సమయంలో, `name`, `sex`, `phone`, `age`, `address`లను మాత్రమే pass చేస్తే సరిపోతుంది.

### compiler సూచనలు

అదనంగా, మనం Xcode లో `Student(...)` అని type చేసినప్పుడు, system ఇచ్చే parameter సూచనలను కూడా చూడగలం.

![student](../../Resource/022_student.png)

ఇది నిజానికి ఇంకో విషయం కూడా చెబుతుంది: ప్రస్తుత ఈ type కి system స్వయంచాలకంగా సృష్టించిన constructor నిజంగానే ఉంది.

### మనమే constructor వ్రాయడం

system constructor ను స్వయంచాలకంగా సృష్టించగలిగినా, కొన్నిసార్లు ఈ default initialization విధానం మన అవసరాలకు పూర్తిగా సరిపోదు.

ఉదాహరణకు, మనకు ఒక `Movie` structure ఉంది:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

system స్వయంచాలకంగా సృష్టించిన constructor ప్రకారం, మనం instance ను సృష్టించే సమయంలో ఈ మూడు parameters ను ఒకేసారి pass చేయాలి:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

కానీ, ఇప్పుడు మనం పాత సినిమాల సమూహాన్ని నమోదు చేయాలి, అయితే సినిమా పేరు మాత్రమే తెలుసు, director మరియు rating తెలియకపోతే, అది కొంచెం అసౌకర్యంగా ఉంటుంది.

ఎందుకంటే మనం ఇలా మాత్రమే వ్రాయగలం:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

ఇది పని చేసినా, ప్రతి సారి `--` ను మళ్లీ మళ్లీ వ్రాయడం సౌకర్యంగా ఉండదు.

అప్పుడు మనం ఒక constructor ను వ్రాయవచ్చు:

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

ఇలా చేస్తే, పాత సినిమాలను సృష్టించే సమయంలో `name` మాత్రమే pass చేస్తే సరిపోతుంది:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

ఇదే మనమే constructor వ్రాయడానికి ఒక ముఖ్యమైన అర్థం: **instance ను సృష్టించే విధానాన్ని నిజమైన అవసరాలకు మరింత సరిపడేలా చేయడం.**

### custom constructor విశ్లేషణ

ఇప్పుడు మనం చేతితో వ్రాసిన ఈ constructor ను చూద్దాం:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

ఈ code యొక్క అర్థం ఏమిటంటే, `Movie` instance ను సృష్టించే సమయంలో ఒక `name` parameter మాత్రమే ఇవ్వాలి.

తర్వాత, constructor లోపల pass చేసిన `name` ను instance యొక్క `name` కు assign చేస్తుంది, అలాగే `director` మరియు `rating` కు ఒక default value `--` ఇస్తుంది.

ఇక్కడ `self` అంటే “ప్రస్తుతం ఉన్న ఈ instance తానే”.

ఉదాహరణకు:

```swift
self.name = name
```

ఎడమవైపు ఉన్న `self.name` అనేది instance లోని property ను సూచిస్తుంది; కుడివైపు ఉన్న `name` అనేది మనం pass చేసిన parameter ను సూచిస్తుంది.

దీన్ని సులభంగా ఇలా అర్థం చేసుకోవచ్చు: బయట నుంచి pass చేసిన value ను instance యొక్క స్వంత property లో నిల్వ చేయడం.

అన్ని properties కు values assign అయిన తర్వాత, ఆ instance సృష్టించబడుతుంది.

### constructor mechanism

మనము స్పష్టంగా ఒక constructor ను declare చేసినప్పుడు, ఇంకో మార్పు కూడా జరుగుతుంది:

మూలంగా system స్వయంచాలకంగా సృష్టించిన constructor సాధారణంగా ఇక నేరుగా ఉపయోగించలేం.

ఉదాహరణకు:

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

ఇప్పుడు మనం మళ్లీ ఇలా వ్రాస్తే:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler ఒక error ఇస్తుంది:

```swift
Extra arguments at positions #2, #3 in call
```

దాని అర్థం: మీరు అదనపు arguments ను pass చేశారు.

ఈ error ఎందుకు వస్తుంది?

ఎందుకంటే ప్రస్తుత `Movie` structure లో, మీరు చేతితో declare చేసిన ఈ ఒక్క constructor మాత్రమే ఉంది:

```swift
init(name: String)
```

ఇది `name` అనే ఒకే parameter ను మాత్రమే అంగీకరిస్తుంది; `director` మరియు `rating` ను అంగీకరించదు.

అంటే, మీరు మీ స్వంత constructor ను చేతితో చేర్చిన తర్వాత, ముందుగా system స్వయంచాలకంగా సృష్టించిన initialization విధానం ఇక నేరుగా ఉపయోగించలేం.

మనము “పేరు మాత్రమే ఇవ్వడం” మరియు “పూర్తి సమాచారం ఇవ్వడం” రెండింటినీ support చేయాలనుకుంటే, మనమే ఇంకో పూర్తి constructor ను జోడించాలి:

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

ఇలా, మనకు రెండు భిన్నమైన constructors ఉంటాయి.

పాత సినిమాలను సృష్టించే సమయంలో, ఇలా వ్రాయవచ్చు:

```swift
Movie(name: "The Night of the Hunter")
```

పూర్తి సమాచారం ఉన్న కొత్త సినిమాలను సృష్టించే సమయంలో, ఇలా వ్రాయవచ్చు:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ఈ వ్రాయబడిన విధానం ఇంకో విషయం కూడా చూపిస్తుంది: ఒకే type కు అనేక constructors ఉండవచ్చు, వాటి parameter రూపాలు భిన్నంగా ఉంటే సరిపోతుంది.

## overloading అంటే ఏమిటి

ఇక్కడ ఇంకో అవసరమైన జ్ఞానాంశాన్ని చేర్చుకుందాం.

ఇప్పుడే మనం `Movie` కోసం రెండు `init` లను వ్రాసాము:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

“ఒకే function పేరు, కానీ parameters వేరు” అనే ఈ విధమైన వ్రాతను “overloading” అంటారు.

ఇక్కడ రెండు functions కూడా `init` అని పిలవబడతాయి, కానీ అవి తీసుకునే parameters వేరు, కాబట్టి Swift మీరు ఏ function ను పిలుస్తున్నారో గుర్తించగలదు.

ఉదాహరణకు:

```swift
Movie(name: "Days of Heaven")
```

ఇది పిలిచేది:

```swift
init(name: String)
```

కానీ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ఇది మరో పూర్తి initialization method ను పిలుస్తుంది.

అందువల్ల, overloading యొక్క ప్రయోజనం ఏమిటంటే: ఒకే type, వేర్వేరు పరిస్థితులకు అనుగుణంగా వేర్వేరు creation విధానాలను అందించగలదు.

## class ను పరిచయం చేసుకుందాం

తర్వాత, మనం `class` ను కూడా సంక్షిప్తంగా పరిచయం చేసుకుందాం.

Swift లో సాధారణంగా కనిపించే `struct` తో పాటు, అనేక programming languages instance లను సృష్టించడానికి `class` ను ఉపయోగిస్తాయి, ఉదాహరణకు Java, C#, Kotlin మొదలైనవి.

Swift లో, `class` యొక్క వ్రాతపద్ధతి `struct` కు చాలా దగ్గరగా ఉంటుంది.

ఉదాహరణకు:

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

మీరు గమనిస్తారు, keyword `struct` నుండి `class` గా మారినదిని తప్ప మిగతా భాగాలన్నీ దాదాపు ఒకేలా కనిపిస్తాయి.

instance ను సృష్టించే విధానం కూడా చాలా సమానంగా ఉంటుంది:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

కాబట్టి, syntax స్థాయిలో `struct` మరియు `class` నిజంగా చాలా సమానంగా ఉంటాయి.

### Struct మరియు Class మధ్య తేడా

`struct` మరియు `class` చాలా సమానంగా కనిపించినప్పటికీ, అవి పూర్తిగా ఒకటే కావు.

**1. initialization విధానం వేరు**

`struct` కొరకు, మనం constructor ను చేతితో వ్రాయకపోతే, system సాధారణంగా సరైన initialization method ను స్వయంచాలకంగా సృష్టిస్తుంది.

కానీ `class` కొరకు, కొన్ని properties కు ఇంకా default values లేకపోతే, సాధారణంగా `init` ను చేతితో వ్రాయాలి; లేకపోతే error వస్తుంది.

ఉదాహరణకు:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

ఈ `class` కు constructor లేకపోవడం వల్ల, properties initialize కాలేదు కాబట్టి error వస్తుంది.

compiler సాధారణంగా ఇలా సూచిస్తుంది:

```swift
Class 'Movie' has no initializers
```

అందువల్ల, ఈ ఉదాహరణలో `class` కు constructor ను చేతితో వ్రాయాలి.

**2. `struct` అనేది value type, `class` అనేది reference type**

`struct` అనేది value type, `class` అనేది reference type.

ప్రారంభ దశలో, ఈ రెండు concepts ను పూర్తిగా నేర్చుకోవాల్సిన అవసరం లేదు; ఒక సరళమైన అవగాహన ఉంటే సరిపోతుంది.

ఉదాహరణకు, `struct` అనేది “ఒక కొత్త value copy ను తయారు చేయడం” లాంటిది.

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

ఇక్కడ `user1` ను `user2` కు assign చేసిన తర్వాత, అది కొత్త data copy ని చేసినట్టే, కాబట్టి `user2` లో మార్పు చేసినా `user1` పై ప్రభావం ఉండదు.

కానీ `class` అనేది “ఒకే instance ను కలిసి సూచించడం” లాంటిది.

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

ఇక్కడ `user1` మరియు `user2` రెండూ ఒకే instance ను సూచిస్తాయి.

ఇప్పుడు మనకు value type, reference type ల యొక్క అంతర్గత mechanism ను పూర్తిగా అర్థం చేసుకోవాల్సిన అవసరం లేదు; `struct` స్వతంత్ర data ను నిల్వ చేయడానికి సరిపోతుంది, `class` అనేక చోట్ల ఒకే instance ను పంచుకోవాల్సిన సందర్భాలకు సరిపోతుంది అని తెలుసుకుంటే సరిపోతుంది.

## ప్రారంభ దశలో ఎలా ఎంచుకోవాలి

ప్రస్తుతం, సాధారణ data models కొరకు ముందుగా `struct` ను పరిగణించాలి, పంచుకోవాల్సిన మరియు సమకాలికంగా మార్చాల్సిన data కొరకు తర్వాత `class` ను పరిగణించాలి.

ఇది ఒక సంపూర్ణ నియమం కాదు, కానీ ప్రారంభికుల కోసం ఇది చాలా ఉపయోగకరమైన నిర్ణయ విధానం.

ప్రత్యేకంగా SwiftUI లో, చాలా సందర్భాల్లో `struct` ఇప్పటికే ఎక్కువ భాగం పనిని పూర్తి చేయగలదని మీరు గమనిస్తారు.

అదనంగా, అనేక programming materials లో `class` తో సృష్టించిన విషయాలను “object” అని కూడా పిలుస్తారు. ప్రారంభ దశలో, దాన్ని ఒక instance లాగా అర్థం చేసుకోవచ్చు, ప్రత్యేకంగా వేరు చేయాల్సిన అవసరం లేదు.

## సారాంశం

ఈ పాఠంలో, మనం `struct` ను లోతుగా నేర్చుకున్నాము, అలాగే `class` ను కూడా పరిచయం చేసుకున్నాము; ఇవి రెండూ types ను నిర్వచించడానికి ఉపయోగించవచ్చు.

types instance లను సృష్టించగలవు. instance ను సృష్టించే సమయంలో constructor, అంటే `init`, పిలవబడుతుంది.

`struct` కొరకు, మనం constructor ను చేతితో వ్రాయకపోతే, system సాధారణంగా సరైన constructor ను స్వయంచాలకంగా సృష్టిస్తుంది. default constructor అవసరాలను తీరించకపోతే, మనమే constructor ను చేతితో వ్రాయవచ్చు.

అదనంగా, `struct` మరియు `class` మధ్య తేడా గురించి కూడా ఒక ప్రారంభ అవగాహన పొందాము: `struct` ఒక value type, `class` ఒక reference type. SwiftUI లో, ప్రారంభ దశలో ఎక్కువగా కలిసేది సాధారణంగా `struct` నే.

తరువాత, views లో value passing, data models మరియు state management ను నేర్చుకునే సమయంలో, ఈ విషయాలు మళ్లీ మళ్లీ ఉపయోగపడతాయి.
