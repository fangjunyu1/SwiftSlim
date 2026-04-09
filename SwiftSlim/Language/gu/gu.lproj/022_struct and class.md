# struct અને class

પાછલા પાઠમાં, આપણે હમણાં જ `struct` ને ઓળખવાનું શરૂ કર્યું હતું, એક સ્ટ્રક્ચર વ્યાખ્યાયિત કર્યું હતું, અને સાથે સાથે પ્રોટોકોલ, `UUID` જેવી જાણકારી પણ વધુ શીખી હતી.

હવે `struct` કીવર્ડ વિશે આપણને પ્રાથમિક સમજ આવી ગઈ છે, પરંતુ હજી તેને સાચી સમજ કહી શકાય નહીં.

આ પાઠમાં, આપણે `struct` ને મુખ્ય વિષય તરીકે આગળ રાખીશું, અને સાથે સાથે `class` ને પણ ઓળખીશું. આ પાઠ દ્વારા, તમને વધુ સ્પષ્ટ રીતે સમજાશે: instance શું છે, constructor શું છે, અને શા માટે આપણે `struct` અને `class` નો ઉપયોગ કરીને ડેટાને ગોઠવી શકીએ છીએ.

## વિદ્યાર્થી વ્યવસ્થાપન સિસ્ટમ

ઉદાહરણ તરીકે, હવે આપણે વિદ્યાર્થી વ્યવસ્થાપન સિસ્ટમ વિકસાવવી છે. દરેક વિદ્યાર્થી પાસે નામ, લિંગ, ફોન, વય, ઘરનું સરનામું જેવી માહિતી હોય છે.

આ સમયે, આપણે આ બધી માહિતી એક સાથે જોડીને તેને `Student` સ્ટ્રક્ચર તરીકે વ્યાખ્યાયિત કરી શકીએ:

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

અહીં આપણે `struct` નો ઉપયોગ કરીને વિદ્યાર્થીનો એક પ્રકાર વ્યાખ્યાયિત કર્યો છે.

આ `Student` સ્ટ્રક્ચરમાં અનેક property સામેલ છે:

- `id`: વિદ્યાર્થીની અનન્ય ઓળખ
- `name`: વિદ્યાર્થીનું નામ
- `sex`: વિદ્યાર્થીનું લિંગ
- `phone`: વિદ્યાર્થીનો ફોન
- `age`: વિદ્યાર્થીની વય
- `address`: ઘરનું સરનામું

આ રીતે, પહેલાં વિખરાયેલી અનેક માહિતી મળીને એક સંપૂર્ણ "વિદ્યાર્થી" બની જાય છે.

અહીં `Student` `Identifiable` protocol ને પણ અનુસરે છે, અને `id` ફીલ્ડ વ્યાખ્યાયિત કરે છે, જેથી આગળ `ForEach` લૂપ સાથે ડેટા બતાવવું સરળ બને.

પછી, આપણે વિદ્યાર્થીનું instance બનાવી શકીએ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

આ કોડ દર્શાવે છે કે `Student` આ માળખા મુજબ વિદ્યાર્થીનો ચોક્કસ ડેટા બનાવી શકાય છે.

અહીં `Student` પ્રકાર છે, અને `Student(...)` બનાવાયેલું instance દર્શાવે છે.

SwiftUI માં, આપણે આ instance ને એક variable માં assign કરીને પછી તેને display કરી શકીએ.

ઉદાહરણ તરીકે:

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

આ રીતે, આપણે view માં આ વિદ્યાર્થીનું નામ જોઈ શકીએ: `Fang Junyu`。

અહીં, પહેલા આપણે `Student` નું instance બનાવ્યું, પછી તેને `student` variable ને assign કર્યું, અને અંતે `student.name` દ્વારા તેની property વાંચી.

## instance શું છે

જ્યારે આપણે પ્રથમ વખત `struct` શીખવાનું શરૂ કરીએ છીએ, ત્યારે "instance" શબ્દ થોડો અજાણ્યો લાગી શકે.

પરંતુ હકીકતમાં, આપણે શરૂઆતથી જ instance નો ઉપયોગ કરતા આવ્યા છીએ, બસ પહેલાં તેને ખાસ ધ્યાન આપ્યું નહોતું.

ઉદાહરણ તરીકે:

```swift
let name = "Fang Junyu"
```

અહીં `"Fang Junyu"` એક string value છે, અને મૂળરૂપે તે `String` પ્રકારનું instance છે.

અમે તેને આ રીતે પણ લખી શકીએ:

```swift
let name = String("Fang Junyu")
```

આ બંને લખાણો એક જ વાત દર્શાવે છે: `String` પ્રકારનું instance બનાવવું અને તેને `name` variable ને assign કરવું.

તે જ રીતે, `Int` માટે પણ આ જ વાત સાચી છે:

```swift
let num = 3
```

અહીં `3` મૂળરૂપે `Int` પ્રકારની એક value છે, અને તેને `Int` instance તરીકે પણ સમજાવી શકાય.

એટલે instance એવો કોઈ ખાસ વિચાર નથી જે ફક્ત `struct` માં જ દેખાય.

`String`, `Int`, `Double`, `Bool`, અથવા custom `Student`, એ બધાં instance બનાવી શકે છે.

એથી, જ્યારે આપણે લખીએ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

તે મૂળરૂપે `String` અથવા `Int` નું instance બનાવવાના જેવી જ વાત છે, ફક્ત `Student` આપણો પોતાનો વ્યાખ્યાયિત પ્રકાર છે.

## constructor

જ્યારે આપણે instance બનાવીએ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ત્યારે વાસ્તવમાં આપણે `Student` ની initialization method, એટલે કે `init`, ને call કરી રહ્યા હોઈએ છીએ.

તમે constructor ને આ રીતે સમજી શકો: **instance બનાવતી વખતે property ને value આપવાનો આ પ્રવેશબિંદુ છે.**

અર્થાત, કોઈ instance ખરેખર પૂર્ણ રીતે તૈયાર થાય તે પહેલાં સામાન્ય રીતે તેને પહેલાં `init`માંથી પસાર થવું પડે છે.

ઉદાહરણ તરીકે, જ્યારે આપણે અગાઉ SwiftUI view lifecycle શીખતા હતા, ત્યારે આપણે આવો કોડ લખ્યો હતો:

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

અહીં `init()` `ContentView` instance બનાવતી વખતે ચાલે છે, જ્યારે `onAppear` ત્યારે જ ચાલે છે જ્યારે view સાચે સ્ક્રીન પર દેખાય. એટલે view બનાવવું અને view દેખાડવું એક જ સમય પર થતું નથી.

તે જ રીતે, જ્યારે આપણે `Student(...)` બનાવીએ છીએ, ત્યારે પણ આપણે `Student` નો constructor જ call કરી રહ્યા હોઈએ છીએ.

### સિસ્ટમ દ્વારા આપમેળે બનાવાયેલ constructor

જ્યારે આપણે `Student` વ્યાખ્યાયિત કર્યું, ત્યારે આપણે હાથથી `init` લખ્યું નહોતું:

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

પરંતુ છતાં પણ, આપણે સીધું instance બનાવી શકીએ છીએ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor લખ્યા વિના instance કેમ બનાવી શકાય?

કારણ કે `struct` માટે, જો આપણે હાથથી constructor ના લખીએ, તો સિસ્ટમ સામાન્ય રીતે આપમેળે આપણા માટે યોગ્ય constructor બનાવી દે છે.

શીખવાની શરૂઆતના તબક્કે તેને સરળ રીતે એમ સમજાય: Swift આપણા માટે initialization code આપમેળે ભરી આપે છે.

મોટામોટી રીતે એમ સમજાય કે સિસ્ટમ આપણા માટે નીચેનો કોડ તૈયાર કરી આપે છે:

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

અહીં એક નાની વાત ધ્યાનમાં લેવાની છે:

```swift
let id = UUID()
```

`id` પાસે પહેલેથી જ default value છે, તેથી instance બનાવતી વખતે આપણને `id` ફરીથી હાથથી આપવાની જરૂર નથી.

અર્થાત, જે property પાસે default value નથી, તેને સામાન્ય રીતે constructor માં આપવી પડે; અને જે property પાસે પહેલેથી default value છે, તે સામાન્ય રીતે એ જ મૂળ default value નો સીધો ઉપયોગ કરી શકે.

એથી `Student` instance બનાવતી વખતે આપણને ફક્ત `name`, `sex`, `phone`, `age` અને `address` આપવાની જરૂર છે.

### compiler સૂચનો

આ ઉપરાંત, જ્યારે આપણે Xcode માં `Student(...)` લખીએ છીએ, ત્યારે સિસ્ટમ આપતા parameter hints પણ જોઈ શકીએ છીએ.

![student](../../Resource/022_student.png)

આ પણ વાસ્તવમાં બતાવે છે કે હાલના આ પ્રકાર માટે ખરેખર સિસ્ટમ-આપમેળે બનાવેલો constructor છે.

### પોતે constructor લખવો

જોકે સિસ્ટમ constructor આપમેળે બનાવી શકે છે, કેટલાક સમયે આ default initialization રીત સંપૂર્ણપણે અમારી જરૂરિયાતો મુજબ બંધબેસતી નથી.

ઉદાહરણ તરીકે, આપણી પાસે એક `Movie` સ્ટ્રક્ચર છે:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

સિસ્ટમ-આપમેળે બનાવેલા constructor મુજબ, instance બનાવતી વખતે આપણને આ ત્રણેય parameters એકસાથે આપવા પડે:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

પણ જો હવે આપણે જૂની ફિલ્મોનો એક સમૂહ દાખલ કરવા માંગતા હોઈએ અને ફક્ત ફિલ્મનું નામ જ જાણતા હોઈએ, director અને rating ના જાણતા હોઈએ, તો થોડી મુશ્કેલી થાય.

કારણ કે ત્યારે આપણે ફક્ત આ રીતે જ લખી શકીએ:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

જોકે આ કામ કરે છે, પણ દર વખતે `--` લખવું અનુકૂળ નથી.

આ સમયે, આપણે એક constructor લખી શકીએ:

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

આ રીતે, જૂની ફિલ્મો બનાવતી વખતે ફક્ત `name` આપવું પૂરતું બને છે:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

પોતે constructor લખવાનો આ એક અર્થ છે: **instance બનાવવાની રીતને વાસ્તવિક જરૂરિયાતો સાથે વધુ સારી રીતે મેળ ખવડાવવો.**

### custom constructor નું વિશ્લેષણ

ચાલો, થોડા પહેલાં લખેલા આ hand-written constructor ને જોઈએ:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

આ કોડનો અર્થ એ છે કે `Movie` instance બનાવતી વખતે ફક્ત એક `name` parameter આપવો જરૂરી છે.

પછી constructor ની અંદર આપેલું `name` instance ના પોતાના `name` ને assign થશે, અને `director` તથા `rating` ને default value `--` આપવામાં આવશે.

અહીં `self` નો અર્થ છે "હાલનું આ instance પોતે".

ઉદાહરણ તરીકે:

```swift
self.name = name
```

ડાબી બાજુનું `self.name` instance ની property દર્શાવે છે; જમણી બાજુનું `name` આપણે આપેલો parameter દર્શાવે છે.

સરળ રીતે સમજીએ તો, બહારથી આપેલી value instance ની પોતાની property માં સાચવવામાં આવે છે.

જ્યારે બધી properties ને values મળી જાય, ત્યારે આ instance બનાવવાની પ્રક્રિયા પૂર્ણ થાય છે.

### constructor ની કાર્યપ્રણાલી

જ્યારે આપણે સ્પષ્ટ રીતે કોઈ constructor declare કરીએ છીએ, ત્યારે બીજી એક બદલી પણ થાય છે:

સિસ્ટમ જે constructor પહેલા આપમેળે બનાવતી હતી, તે પછી સામાન્ય રીતે સીધો ઉપયોગ કરી શકાય નહીં.

ઉદાહરણ તરીકે:

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

હવે જો આપણે ફરીથી આ રીતે લખીએ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

તો compiler error આપશે:

```swift
Extra arguments at positions #2, #3 in call
```

તેનો અર્થ છે: તમે વધારાના parameters આપ્યા છે.

આ error કેમ આવે છે?

કારણ કે હાલના `Movie` સ્ટ્રક્ચરમાં ફક્ત આ એક જ constructor છે, જે તમે હાથથી declare કર્યો છે:

```swift
init(name: String)
```

તે ફક્ત `name` parameter સ્વીકારે છે, `director` અને `rating` સ્વીકારતું નથી.

અર્થાત, તમે જ્યારે પોતાનો constructor હાથથી ઉમેરો છો, ત્યારે સિસ્ટમ પહેલાં આપમેળે બનાવતી initialization રીત હવે સીધી ઉપયોગી રહેતી નથી.

જો આપણે એકસાથે "ફક્ત નામ આપવું" અને "પૂર્ણ માહિતી આપવી" - બન્નેને support કરવા માંગીએ, તો આપણને પોતે જ એક વધુ સંપૂર્ણ constructor ઉમેરવો પડશે:

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

આ રીતે, આપણાં પાસે બે જુદા constructors થઈ જાય છે.

જૂની ફિલ્મ બનાવતી વખતે આપણે આ રીતે લખી શકીએ:

```swift
Movie(name: "The Night of the Hunter")
```

પૂર્ણ માહિતી સાથે નવી ફિલ્મ બનાવતી વખતે આપણે આ રીતે લખી શકીએ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

આ લખાણની રીત એ પણ બતાવે છે કે એક જ પ્રકારના અનેક constructors હોઈ શકે, જો તેમના parameter સ્વરૂપો અલગ હોય.

## overload શું છે

અહીં આપણે એક વધુ જરૂરી જ્ઞાનબિંદુ ઉમેરીએ.

હમણાં જ આપણે `Movie` માટે બે `init` લખ્યા:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

આ પ્રકારનું લખાણ, "એક જ function name, પરંતુ parameters અલગ", તેને "overload" કહે છે.

અહીં બંને functions નું નામ `init` છે, પણ તેઓ જુદા parameters લે છે, તેથી Swift સમજી શકે છે કે તમે કયું function call કરી રહ્યા છો.

ઉદાહરણ તરીકે:

```swift
Movie(name: "Days of Heaven")
```

તે call કરશે:

```swift
init(name: String)
```

અને:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

તે initialization method ની બીજી સંપૂર્ણ આવૃત્તિને call કરશે.

એથી overload નો કામ એ છે: એક જ પ્રકારને જુદી જુદી પરિસ્થિતિઓ માટે જુદી રચનાપદ્ધતિ આપવી.

## class ની ઓળખ

આગળ, ચાલો સંક્ષેપમાં `class` ને પણ ઓળખીએ.

Swift માં સામાન્ય `struct` ઉપરાંત, ઘણી programming languages instance બનાવવા માટે `class` નો ઉપયોગ કરે છે, જેમ કે Java, C#, Kotlin વગેરે.

Swift માં `class` લખવાની રીત `struct` જેવી જ ખૂબ નજીક છે.

ઉદાહરણ તરીકે:

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

તમે જોશો કે `struct` ની જગ્યાએ `class` કીવર્ડ વપરાયેલું હોવા સિવાય, બાકીની બધી બાબતો લગભગ સમાન લાગે છે.

instance બનાવવાની રીત પણ ઘણી સમાન છે:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

એથી syntax સ્તરે `struct` અને `class` ખરેખર ખૂબ સમાન લાગે છે.

### Struct અને Class નો ફરક

જોકે `struct` અને `class` ખૂબ મળતા આવે છે, તેઓ સંપૂર્ણપણે એકસરખા નથી.

**1. initialization કરવાની રીત અલગ છે**

`struct` માટે, જો આપણે હાથથી constructor ના લખીએ, તો સિસ્ટમ સામાન્ય રીતે આપમેળે યોગ્ય initialization method બનાવી આપે છે.

પરંતુ `class` માટે, જો એવી properties હોય જેમની default value નથી, તો સામાન્ય રીતે `init` હાથથી લખવું પડે, નહીં તો error આવશે.

ઉદાહરણ તરીકે:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

આ `class` માં constructor ના હોવાને કારણે properties initialize થતી નથી, એટલે error આવે છે.

compiler સામાન્ય રીતે આ પ્રકારની સૂચના બતાવે છે:

```swift
Class 'Movie' has no initializers
```

એથી, આ ઉદાહરણમાં `class` માટે constructor હાથથી લખવો ફરજીયાત છે.

**2. `struct` value type છે, `class` reference type છે**

`struct` value type છે, અને `class` reference type છે.

શીખવાની શરૂઆતમાં આ બે વિચારોને સંપૂર્ણ રીતે આવડવું જરૂરી નથી; માત્ર સરળ પ્રાથમિક સમજ પૂરતી છે.

ઉદાહરણ તરીકે, `struct` ને "નવી value ની copy" જેવી રીતે સમજાવી શકાય.

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

અહીં `user1` ને `user2` ને assign કર્યા પછી, મૂળરૂપે નવી data copy બને છે, તેથી `user2` બદલવાથી `user1` પર અસર થતી નથી.

બીજી તરફ, `class` ને "એક જ instance તરફ મળીને સંકેત કરવું" જેવી રીતે સમજાવી શકાય.

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

અહીં `user1` અને `user2` એક જ instance તરફ સંકેત કરે છે.

હાલ માટે value type અને reference type ની અંદરની કાર્યપ્રણાલી સંપૂર્ણ રીતે સમજવાની જરૂર નથી; ફક્ત એટલું જાણવું પૂરતું છે કે `struct` સ્વતંત્ર ડેટા સાચવવા માટે વધુ યોગ્ય છે, અને `class` તેવા સંજોગોમાં વધુ યોગ્ય છે જ્યાં અનેક જગ્યાએ એક જ instance share કરવો પડે.

## શરૂઆતના તબક્કે કેવી રીતે પસંદ કરવું

હાલના તબક્કે સામાન્ય data model માટે પહેલાં `struct` વિચારવો, અને જ્યાં shared data તથા synchronized ફેરફારો જોઈએ ત્યાં `class` વિચારવો.

આ કોઈ સંપૂર્ણ નિયમ નથી, પણ નવા શીખનારાઓ માટે આ પૂરતું ઉપયોગી નિર્ધારણ છે.

ખાસ કરીને SwiftUI માં તમને ઘણી વાર લાગશે કે `struct` વડે જ મોટાભાગનું કામ થઈ જાય છે.

વધારેમાં, ઘણા programming materials માં `class` દ્વારા બનેલી વસ્તુને "object" પણ કહેવામાં આવે છે. શરૂઆતના તબક્કે તમે તેને instance તરીકે જ સમજી શકો, અલગથી ફરક પાડવાની જરૂર નથી.

## સારાંશ

આ પાઠમાં, આપણે `struct` ને વધુ ઊંડાઈથી શીખ્યું, અને સાથે સાથે `class` ને પણ ઓળખ્યું. બંનેનો ઉપયોગ type વ્યાખ્યાયિત કરવા માટે થઈ શકે છે.

type instance બનાવી શકે છે. instance બનાવતી વખતે constructor, એટલે કે `init`, call થાય છે.

`struct` માટે, જો constructor હાથથી ના લખાયો હોય, તો સિસ્ટમ સામાન્ય રીતે યોગ્ય constructor આપમેળે બનાવે છે. જો default constructor જરૂરિયાત પૂરી ન કરે, તો આપણે પોતે પણ constructor લખી શકીએ.

આ ઉપરાંત, આપણે `struct` અને `class` વચ્ચેનો મૂળભૂત ફરક પણ જાણી લીધો: `struct` value type છે, જ્યારે `class` reference type છે. SwiftUI માં શરૂઆતના તબક્કે સામાન્ય રીતે વધુ વાર `struct` સાથે સામનો થાય છે.

આગળ જઈને જ્યારે આપણે views વચ્ચે value pass કરવી, data model અને state management શીખીશું, ત્યારે આ બધું જ ફરી ઉપયોગમાં આવશે.
