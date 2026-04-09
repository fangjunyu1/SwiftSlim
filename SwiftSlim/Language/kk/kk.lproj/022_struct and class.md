# struct және class

Алдыңғы сабақта біз `struct` ұғымымен енді ғана таныса бастадық, бір құрылым анықтадық, сонымен қатар протоколдар, `UUID` және басқа да білім нүктелері туралы да кеңейтіп үйрендік.

Қазір бізде `struct` кілтсөзі туралы бастапқы түсінік бар, бірақ оны толық түсіндік деуге әлі ерте.

Бұл сабақта біз `struct`-ты негізгі мазмұн ретінде жалғастырып оқимыз және сонымен бірге `class`-пен де танысамыз. Осы сабақ арқылы сен мыналарды анығырақ түсінесің: instance деген не, constructor деген не, және неге біз `struct` пен `class` арқылы деректерді ұйымдастыра аламыз.

## Оқушыны басқару жүйесі

Мысалы, қазір біз оқушыны басқару жүйесін дамытқымыз келеді. Әр оқушыда аты, жынысы, телефоны, жасы, үй мекенжайы сияқты ақпараттар болады.

Осы кезде біз бұл ақпараттарды біріктіріп, оны `Student` құрылымы ретінде анықтай аламыз:

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

Мұнда біз `struct` арқылы оқушы типін анықтап отырмыз.

Бұл `Student` құрылымында бірнеше property бар:

- `id`: оқушының бірегей идентификаторы
- `name`: оқушының аты
- `sex`: оқушының жынысы
- `phone`: оқушының телефоны
- `age`: оқушының жасы
- `address`: үй мекенжайы

Осылайша, бастапқыда шашыраңқы болған бірнеше дерек бір толық "оқушыға" біріктіріледі.

Мұндағы `Student` сондай-ақ `Identifiable` протоколына да бағынады және `id` өрісін анықтайды, бұл кейін деректерді `ForEach` циклімен бірге көрсетуге ыңғайлы болады.

Содан кейін біз оқушы instance-ын жасай аламыз:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Бұл код `Student` құрылымына сүйеніп нақты бір оқушы дерегін жасауға болатынын білдіреді.

Мұнда `Student` — тип, ал `Student(...)` — жасалған instance.

SwiftUI-де біз бұл instance-ты айнымалыға тағайындап, кейін оны көрсете аламыз.

Мысалы:

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

Осылайша, біз көріністе осы оқушының атын көре аламыз: `Fang Junyu`.

Мұнда біз алдымен `Student` instance-ын жасадық, содан кейін оны `student` айнымалысына тағайындадық, соңында `student.name` арқылы оның property-сін оқыдық.

## instance деген не

`struct`-ты енді ғана үйрене бастағанда, "instance" деген сөз саған жат көрінуі мүмкін.

Бірақ шын мәнінде, біз instance-тарды әуел бастан пайдаланып келеміз, тек бұрын бұған ерекше назар аудармағанбыз.

Мысалы:

```swift
let name = "Fang Junyu"
```

Мұндағы `"Fang Junyu"` — string мәні, ал мәні жағынан бұл `String` типінің instance-ы.

Оны мынадай түрде де жаза аламыз:

```swift
let name = String("Fang Junyu")
```

Бұл екі жазылу тәсілі бір нәрсені білдіреді: `String` типінің instance-ын жасап, оны `name` айнымалысына тағайындау.

Сол сияқты, `Int` үшін де дәл осылай:

```swift
let num = 3
```

Мұндағы `3` — негізінде `Int` типінің мәні, оны `Int` instance-ы ретінде де түсінуге болады.

Сондықтан instance — тек `struct` ішінде ғана пайда болатын ерекше ұғым емес.

`String`, `Int`, `Double`, `Bool` немесе өзіміз анықтаған `Student` болсын, бұлардың бәрі instance жасай алады.

Сондықтан, біз мынадай жазғанда:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

мәні жағынан бұл `String` немесе `Int` instance-ын жасаумен бірдей, тек `Student` — өзіміз анықтаған тип.

## constructor

Біз instance жасағанда:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

шын мәнінде `Student`-тің initialization method-ы, яғни `init` шақырылады.

Constructor-ды былай түсінуге болады: **instance жасалған кезде property-лерге мән беруге жауап беретін кіру нүктесі.**

Яғни, instance шынымен толық жасалып біткенше, әдетте алдымен `init` арқылы өтеді.

Мысалы, бұрын SwiftUI view lifecycle-ін үйренгенде, біз мынадай код жазғанбыз:

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

Мұнда `init()` `ContentView` instance-ы жасалған кезде орындалады, ал `onAppear` view шынымен экранда көрсетілген кезде ғана орындалады. Яғни, view-дің жасалуы мен көрсетілуі бір уақыт емес.

Сол сияқты, біз `Student(...)` жасағанда да, `Student`-тің constructor-ын шақырып отырмыз.

### Жүйе автоматты түрде жасайтын constructor

Біз `Student`-ті анықтағанда, `init`-ті қолмен жазған жоқпыз:

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

Бірақ соған қарамастан, біз тікелей instance жасай аламыз:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Constructor жазбай-ақ instance неге жасауға болады?

Себебі `struct` үшін, егер біз constructor-ды қолмен жазбасақ, жүйе әдетте біз үшін автоматты түрде қолайлы constructor жасап береді.

Үйренудің бастапқы кезеңінде мұны қарапайым түрде былай түсінуге болады: Swift initialization кодын біз үшін автоматты түрде толықтырады.

Шамамен, жүйе біз үшін мына кодты толықтырып береді деп түсінуге болады:

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

Мұнда бір кішкентай жайтқа назар аудару керек:

```swift
let id = UUID()
```

`id` үшін default value бар, сондықтан instance жасағанда `id`-ді қайтадан қолмен беру қажет емес.

Яғни, default value-сы жоқ property-лерді әдетте constructor арқылы беру керек; ал default value-сы бар property-лер әдетте сол бастапқы default value-ны тікелей пайдалана алады.

Сондықтан `Student` instance-ын жасағанда бізге тек `name`, `sex`, `phone`, `age` және `address` беру жеткілікті.

### Compiler ұсынатын кеңестер

Сонымен қатар, Xcode-та `Student(...)` деп жазғанда, жүйе беретін параметр кеңестерін де көре аламыз.

![student](../../Resource/022_student.png)

Бұл да қазіргі тип үшін жүйе автоматты түрде жасаған constructor шынымен бар екенін көрсетеді.

### Constructor-ды өзіміз жазу

Жүйе constructor-ды автоматты түрде жасай алғанымен, кей жағдайларда бұл default initialization тәсілі біздің қажеттіліктерімізге толық сәйкес келе бермейді.

Мысалы, бізде мынадай `Movie` құрылымы бар:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Жүйе автоматты түрде жасаған constructor бойынша instance жасағанда, біз осы үш параметрдің бәрін бірге беруіміз керек:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Бірақ егер қазір біз ескі фильмдердің бір тобын енгізгіміз келсе және тек фильмнің атын ғана білсек, ал режиссері мен бағасын білмесек, бұл біршама қолайсыз болады.

Өйткені оны тек былай ғана жаза аламыз:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Бұл жұмыс істегенімен, әр жолы `--` деп қайталап жазу ыңғайлы емес.

Осындай кезде біз constructor жаза аламыз:

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

Осылайша, ескі фильмдерді жасағанда тек `name` беру жеткілікті болады:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Бұл — constructor-ды өзіміз жазудың бір мағынасы: **instance жасау тәсілін нақты қажеттіліктерге көбірек сәйкестендіру.**

### Custom constructor-ды талдау

Жаңа ғана қолмен жазған мына constructor-ға қарайық:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Бұл кодтың мағынасы — `Movie` instance-ын жасағанда тек бір ғана `name` параметрін беру қажет.

Содан кейін constructor-дың ішінде берілген `name` instance-тың өзінің `name` property-сіне тағайындалады, ал `director` мен `rating`-ке default value ретінде `--` беріледі.

Мұндағы `self` дегеніміз — "осы ағымдағы instance-тың өзі".

Мысалы:

```swift
self.name = name
```

Сол жақтағы `self.name` instance ішіндегі property-ді білдіреді; оң жақтағы `name` — біз берген параметр.

Мұны сырттан берілген мәнді instance-тың өзінің property-сіне сақтау деп қарапайым түсінуге болады.

Барлық property-лерге мән беріліп болғанда, бұл instance-тың жасалуы аяқталады.

### Constructor механизмі

Біз constructor-ды ашық түрде жариялаған кезде, тағы бір өзгеріс болады:

жүйе бастапқыда автоматты түрде жасаған constructor әдетте енді тікелей қолданыла алмайды.

Мысалы:

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

Енді егер біз қайтадан былай жазсақ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler қате шығарады:

```swift
Extra arguments at positions #2, #3 in call
```

Бұл дегеніміз: сен артық параметрлер бердің.

Бұл қате неге шығады?

Себебі қазіргі `Movie` құрылымында сен қолмен жариялаған мына бір ғана constructor бар:

```swift
init(name: String)
```

Ол тек бір `name` параметрін қабылдайды, ал `director` пен `rating`-ті қабылдамайды.

Яғни, сен өз constructor-ыңды қолмен қосқаннан кейін, бұрын жүйе автоматты түрде жасаған initialization тәсілі енді тікелей қолданыла алмайды.

Егер біз бір уақытта "тек атын беру" мен "толық ақпарат беру" тәсілдерінің екеуін де қолдағымыз келсе, онда тағы бір толық constructor-ды өзіміз жазуымыз керек:

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

Осылайша, бізде екі түрлі constructor болады.

Ескі фильмді жасағанда былай жаза аламыз:

```swift
Movie(name: "The Night of the Hunter")
```

Ал толық ақпараты бар жаңа фильмді жасағанда былай жаза аламыз:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Бұл жазылу тәсілі бір типтің параметр формалары әртүрлі болса, бірнеше constructor-ы бола алатынын да көрсетеді.

## overload деген не

Мұнда тағы бір қажетті білім нүктесін қосайық.

Жаңа ғана біз `Movie` үшін екі `init` жаздық:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Осындай "бірдей функция атауы, бірақ әртүрлі параметрлер" түріндегі жазылу "overload" деп аталады.

Мұнда екі функцияның да аты `init`, бірақ қабылдайтын параметрлері әртүрлі болғандықтан, Swift сенің қай функцияны шақырып тұрғаныңды ажырата алады.

Мысалы:

```swift
Movie(name: "Days of Heaven")
```

мына constructor-ды шақырады:

```swift
init(name: String)
```

Ал:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

initialization method-тың басқа толық нұсқасын шақырады.

Сондықтан overload-тың рөлі — бір типке әртүрлі жағдайларға байланысты әртүрлі жасау тәсілдерін ұсынуға мүмкіндік беру.

## class-пен танысу

Келесіде, `class`-пен де қысқаша танысайық.

Swift-тегі жиі қолданылатын `struct`-тан бөлек, көптеген бағдарламалау тілдері instance жасау үшін `class` пайдаланады, мысалы Java, C#, Kotlin және тағы басқалар.

Swift-те `class` жазылу тәсілі `struct`-қа өте ұқсас.

Мысалы:

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

Сен `struct` кілтсөзінің `class`-қа ауысқанынан басқа, қалған бөліктері шамамен бірдей көрінетінін байқайсың.

Instance жасау тәсілі де өте ұқсас:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Сондықтан синтаксис деңгейінде `struct` пен `class` шынымен өте ұқсас.

### Struct пен Class арасындағы айырмашылық

`struct` пен `class` өте ұқсас көрінгенімен, олар толықтай бірдей емес.

**1. Initialization тәсілі әртүрлі**

`struct` үшін, егер біз constructor-ды қолмен жазбасақ, жүйе әдетте автоматты түрде қолайлы initialization method жасайды.

Ал `class` үшін, егер default value-сы жоқ property-лер болса, әдетте `init`-ті қолмен жазу керек, әйтпесе қате шығады.

Мысалы:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Бұл `class` қате береді, себебі онда constructor жоқ, сондықтан property-лер инициализацияланбай қалады.

Compiler шамамен мынадай хабарлама көрсетеді:

```swift
Class 'Movie' has no initializers
```

Сондықтан бұл мысалда `class` үшін constructor-ды қолмен жазу міндетті.

**2. `struct` — value type, `class` — reference type**

`struct` — value type, ал `class` — reference type.

Үйренудің бастапқы кезеңінде бұл екі ұғымды толық меңгеру міндетті емес, тек қарапайым бастапқы түсінік болса жеткілікті.

Мысалы, `struct` көбірек "жаңа мәнді көшіру" ұғымына ұқсайды.

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

Мұнда `user1`-ді `user2`-ге тағайындағаннан кейін, жаңа деректің көшірмесі жасалғандай болады, сондықтан `user2`-ні өзгерту `user1`-ге әсер етпейді.

Ал `class` көбірек "бір instance-қа бірге сілтеу" ұғымына ұқсайды.

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

Мұнда `user1` мен `user2` бір instance-қа сілтеп тұр.

Қазір value type пен reference type-тың ішкі механизмін толық түсінудің қажеті жоқ; тек `struct` тәуелсіз деректерді сақтауға көбірек ыңғайлы, ал `class` бірнеше орынға бір instance-ты ортақ пайдалануға ыңғайлы екенін білу жеткілікті.

## Бастапқы кезеңде қалай таңдау керек

Қазіргі кезеңде қарапайым data model үшін алдымен `struct`-ты қарастырған дұрыс; ал ортақ деректер мен синхронды өзгерістер керек болғанда `class`-ты қарастырған жөн.

Бұл абсолютті ереже емес, бірақ жаңадан бастаушылар үшін жеткілікті практикалық таңдау жолы.

Әсіресе SwiftUI-де көп жағдайда `struct`-тың өзі жұмыстың басым бөлігін орындап шығатынын көресің.

Сонымен қатар, көптеген бағдарламалау материалдарында `class` арқылы жасалған нәрсе "object" деп те аталады. Бастапқы кезеңде оны жай ғана instance ретінде түсіне беруге болады, оларды әдейі ажыратудың қажеті жоқ.

## Қорытынды

Бұл сабақта біз `struct`-ты тереңірек үйрендік, сонымен бірге `class`-пен де таныстық; екеуі де типтерді анықтау үшін қолданылады.

Типтер instance жасай алады. Instance жасалған кезде constructor, яғни `init` шақырылады.

`struct` үшін, егер constructor-ды қолмен жазбасақ, жүйе әдетте автоматты түрде қолайлы constructor жасап береді. Егер default constructor қажеттіліктерге сай келмесе, constructor-ды өзіміз де жаза аламыз.

Сонымен қатар, біз `struct` пен `class` арасындағы айырмашылық туралы да бастапқы түсінік алдық: `struct` — value type, ал `class` — reference type. SwiftUI-де бастапқы кезеңде көбіне жиірек кездесетіні — `struct`.

Кейін view-лер арасында value беру, data model және state management-ті үйренгенде, осының бәрі әрі қарай да қолданылатын болады.
