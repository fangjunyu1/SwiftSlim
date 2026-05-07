# View-ларды түсіну

Бұл сабақта біз ең басындағы `ContentView`-қа қайта ораламыз.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

SwiftUI-мен алғаш танысқан кезде, `ContentView` ішінде біз түсінбеген көптеген keyword болды.

Мысалы, `struct`, `View`, `var`, `body`, `some View` сияқты keyword-тар.

Ол кезде біз тек мынаны білген шығармыз: **кодты `body` ішіне жазсақ, interface-та content көрсетіледі.**

Қазір біз `struct`, айнымалылар, methods және protocols туралы үйрендік, сондықтан бұл кодты қайта түсініп, SwiftUI view-лары арасындағы байланысты түсінуге көмектесе аламыз.

## ContentView-ты қайта қарау

SwiftUI project жасағаннан кейін, Xcode әдетте бір `ContentView` файлын автоматты түрде жасайды.

Мысал код төмендегідей:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Бұл кодты бірнеше бөлікке бөліп түсінуге болады.

Алдымен:

```swift
import SwiftUI
```

Бұл код жолы SwiftUI framework-ін import етуді білдіреді.

SwiftUI import еткеннен кейін ғана біз `View`, `Text`, `Image`, `VStack`, `Button` сияқты SwiftUI view-ларын қолдана аламыз.

## ContentView құрылымы

Бұл код жолы бір құрылым жасауды білдіреді:

```swift
struct ContentView: View
```

Мұндағы:

```swift
struct ContentView
```

`ContentView` бір құрылым екенін білдіреді.

Алдыңғы сабақта біз `struct` құрылымын түсінгенбіз. Ол әртүрлі field құрылымдарын біріктіре алады, және ішінде properties, methods болуы мүмкін.

Мысалы:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

Бұл мысалда `ContentView` ішінде үш content бар: `name`, `printName` және `body`.

Яғни `struct` байланысты properties, methods және view content-ін бірге ұйымдастыра алады.

![contentView](../../Resource/023_contentVIew.png)

## View — protocol

Осы код жолын әрі қарай қарайық:

```swift
struct ContentView: View 
```

Қос нүктеден кейінгі `View` мынаны білдіреді: `ContentView` `View` protocol-ын ұстанады.

Оны былай түсінуге болады: егер `ContentView` SwiftUI view болғысы келсе, `View` protocol талаптарын орындауы керек.

### Identifiable protocol

Бұрын movie list үйренген кезде, біз `Identifiable` protocol-ымен танысқанбыз.

Сол кезде `ForEach` ішінде `Movie` array-ін traverse ету керек болды, бірақ `Movie` құрылымында unique identifier болмады, сондықтан ол `ForEach` traversal-ды қолдамады.

Осы кезде `Movie` құрылымын `Identifiable` protocol-ын ұстанатындай ету керек болды, осылайша ол `ForEach`-тің unique identifier талабына сай келеді.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protocol талабы: **бұл type-тың өзін identify ететін `id` field-і болуы керек.**

`Movie` бір `id` field бергеннен кейін, ол `Identifiable` талабын орындай алады.

Осылайша оны `ForEach` ішінде қолданғанда, SwiftUI әр data item-ды тани алады.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protocol

`View` protocol-ы да дәл осылай.

Егер бір type SwiftUI view болғысы келсе, `View` protocol-ын ұстануы керек.

Ал `View` protocol-ының ең маңызды талабы — бір `body` беру.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Оны былай түсінуге болады: `View` protocol талабы: **тек `body` қайтарған SwiftUI view қабылданады, ал `ContentView` SwiftUI view-ды `body` арқылы көрсетеді.**

### View-ды ұстанбасақ не болады?

Егер біз былай жазсақ:

```swift
struct ContentView {
}
```

Бұл жай ғана ordinary structure, SwiftUI view емес.

Ол бірден error бермейді, өйткені ordinary structure өз алдына valid Swift code.

Бірақ оны preview ішіне қойсақ:

```swift
#Preview {
    ContentView()
}
```

Осы кезде error пайда болады.

Себебі: **preview бір SwiftUI view көрсетуі керек, ал бұл `ContentView` `View` protocol-ын ұстанбайды.**

Сондықтан `ContentView` interface-та көрсетілсін десек, оны `View` protocol-ын ұстанатындай ету керек:

```swift
struct ContentView: View {
}
```

Сонымен бірге, `View` protocol талабына сай `body` беру керек. Егер `body` болмаса, compiler бәрібір error береді.

Дұрыс жазылуы:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Осы кезде `ContentView` шынымен көрсетіле алатын SwiftUI view болады.

## body — view көрсетудің entry point-і

SwiftUI-де `body` — view content-інің entry point-і.

```swift
var body: some View {
    Text("Hello, world!")
}
```

Мұны үш бөлікке бөлуге болады:

**1. var body**

```swift
var body
```

Бұл `body` атты айнымалы анықталғанын білдіреді.

**2. some View**

```swift
: some View
```

Бұл `body` бір view қайтаратынын білдіреді.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

Бұл көрсетілетін view content. Бұл кодта бір `Text` view көрсетіледі.

Яғни `body` ішінде не жазылса, interface-та сол көрсетіледі.

Мысалы:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Бұл код мынаны білдіреді: **interface-та vertically arranged content көрсетіледі, оның ішінде екі text бар.**

### body атауын еркін өзгертуге болмайды

Назар аудару керек: `body` деген атауды қалағандай өзгертуге болмайды.

Егер былай жазсақ:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

Бұл `content` те view property, бірақ ол `body`-ды алмастыра алмайды.

Өйткені `View` protocol талап ететін атау дәл `body`.

## some View деген не?

SwiftUI-де `some View` нақты бір view қайтаратынын білдіреді, тек сол view-дың толық type-ын жазудың қажеті жоқ.

```swift
var body: some View
```

Яғни `some View` type жоқ деген сөз емес. Нақты type әлі де бар, compiler бұл type-ты біледі, бірақ ол type өте күрделі болуы мүмкін, сондықтан Swift оны `some View` арқылы жасыруға мүмкіндік береді.

### some деген не?

Swift-та `some` opaque type жариялау үшін қолданылатын keyword.

Opaque type мағынасы: **return value-дың нақты type-ы бар, compiler бұл нақты type-тың не екенін біледі, бірақ біз бұл нақты type-ты тікелей жазбаймыз.**

Мысалы:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

Бұл `makeView` `View` protocol-ын ұстанатын нақты type қайтаратынын білдіреді.

### Неге some керек?

Айнымалыларды үйренген кезде біз мынаны түсіндік: **Swift-тағы мәндерде explicit type annotation болуы керек, немесе compiler type-ты automatic түрде infer етеді.**

Мысалы:

```swift
let a: Int = 10
```

Мұнда `a` constant-ының type-ы `Int`.

SwiftUI view-лары да бұдан бөлек емес. `body` арқылы SwiftUI view көрсеткенде, `body` тиісті SwiftUI type қайтаруы керек.

Мысалы, `body` арқылы бір `Text` text view көрсетсек, `body` тиісті `Text` type қайтаруы керек.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Бұл мысалда `body` ішінде көрсетілетін view — `Text` view, қайтарылатын type та `Text`.

Ішкі type пен жарияланған type сәйкес болғанда ғана compiler-дің type consistency талабына сай келеді.

**Type mismatch мәселесі**

Егер `body` type-ын `Color` етіп қойып, бірақ `Text` көрсетсек:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` type-ы мен ішкі code type-ы сәйкес емес, сондықтан type mismatch error пайда болады.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Осы кезде `body` return type-ын қолмен өзгертуіміз керек.

**Күрделі view type-тары**

Нақты development кезінде interface әдетте бір ғана `Text`-тен тұрмайды.

Егер күрделірек `VStack` көрсету керек болса, күрделі return type-ты қолмен annotation жасау керек болады.

Мысалы:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

Бұл код бір `VStack` қайтарылатынын, ал `VStack` ішінде `Image` және `Text` type view-лары бар екенін білдіреді.

`body` return type-ы:

```swift
VStack<TupleView<(Image,Text)>>
```

Көріп тұрғанымыздай, бұл return type өте күрделі, әрі біз бұрын көрмеген `TupleView` та қосылды.

Мұндағы `TupleView` былай түсініледі: **бірнеше child view-ды бір view ретінде wrap ету.**

**Одан да күрделі view type-тары**

Егер view-ға modifiers қоссақ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Онда бұл view-дың return type-ы өте күрделі болып кетеді, оны мұнда нақты сипаттау мүмкін емес.

Қолданыстағы `VStack<TupleView<(Image,Text)>>` return type modifiers-ты сипаттай алмайды, сондықтан error болады.

**some View return type-ты жеңілдетеді**

Мұндай жағдайда SwiftUI қысқа solution береді, яғни жазуды жеңілдету үшін `some View` қолдану.

`body` type-ын `some View` етіп өзгерткенде:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

View code-ды әр өзгерткен сайын толық return type-ты қайта жазудың қажеті болмайды.

Себебі `some View` `View` protocol-ын ұстанатын нақты view қайтаруды білдіреді.

Басқаша айтқанда, `VStack`, `Image` және басқа SwiftUI view-ларының бәрі `View` protocol-ын ұстанады. Modifier қосылғаннан кейін қайтарылатын view type та `View` protocol-ын ұстанады.

Сондықтан олардың бәрі `some View` ретінде қайтарыла алады.

### some View кез келген view-ды еркін қайтара алмайды

`some View` күрделі type-тарды жасыра алғанымен, ол "type жоқ" деген сөз емес.

Оның негізгі rule-ы: **compiler бір нақты return type-ты анықтай алуы керек**.

Мысалы:

```swift
var title: some View {
    Text("Hello")
}
```

Мұнда қайтарылатын view — `Text`.

Бірақ екі view қайтаруға тырыссақ, error болады:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Өйткені `some View` соңында бір view structure қайтаруы керек, ал мұнда екі independent view қайтаруға әрекет жасалып тұр.

### Шешім

Әдетте екі solution бар: container және `@ViewBuilder`.

**1. Container арқылы wrap ету**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Бұл кодта `title` бір `VStack` қайтарады, ал `Text` пен `Image` — `VStack` ішіндегі child view-лар.

`some View` қабылдайтын view structure — бір `VStack<...>`, сондықтан ол `some View`-дың бір view structure қайтару талабына сай келеді. 

Міне сондықтан SwiftUI үйрене бастағаннан-ақ view code-ды ең сыртқы layer-де `VStack` container-ымен wrap етуді ұсынамыз.

**2. @ViewBuilder қолдану**

`some View` алдына `@ViewBuilder` modifier-ын да қоса аламыз:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` бірнеше view-ды бір return result-қа combine ете алады.

Оның мәні бәрібір бірнеше view-ды бір view-ға біріктіру, осылайша `some View`-дың бір view structure қайтару талабын орындау.

### Неге body ішінде бірнеше view-ды тікелей жаза аламыз?

Егер `var body` ішінде бірнеше view жазсақ, мысалы:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

Кейбір жағдайларда мұндай `body` error бермейді.

Себебі `View` protocol ішіндегі `body` default түрде `@ViewBuilder` қолдайды:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protocol source code-ында `@ViewBuilder` `body` айнымалысын бұрыннан modify еткенін көруге болады.

Сондықтан `body` ordinary `some View`-пен салыстырғанда бір қабат special handling-ке ие, сол арқылы SwiftUI бірнеше view-ды автоматты түрде бір view-ға combine етеді.

**Container қолдану ұсынылады**

Beginners үшін түсінуді жеңілдету мақсатында, бірнеше view-ды ұйымдастыру үшін алдымен `VStack`, `HStack`, `ZStack`, `Group` сияқты containers қолдану ұсынылады.

Мысалы:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Осылай code интуитивтірек: **сыртқы layer — бір `VStack`, ішінде екі child view бар.**

## View-ларды бөлу

Егер interface салыстырмалы түрде simple болса, барлық code-ды `body` ішінде жаза аламыз.

Мысалы:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote-қа қош келдіңіз")
                Text("Қайырлы таң")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("мені бас") {
                print("мені бас ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Бұл view-дың display style-ы:

![view](../../Resource/023_view1.png)

Бұл code қалыпты жұмыс істей алады, бірақ view code өте complex болса, `body` ішіндегі code барған сайын ұзарып, оқу және өзгерту қиындығы үнемі артады.

Осы кезде әртүрлі areas-ты independent view properties ретінде бөле аламыз.

### Жоғарғы view-ды бөлу

Мысалы, жоғарғы area-ны бөліп шығарайық:

```swift
var topHome: some View {
    HStack {
        Text("Басты бет")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Мұндағы `topHome` — бір айнымалы, ол бір view қайтарады.

Қайтарылатыны view болғандықтан, type-ты былай жазуға болады:

```swift
some View
```

Бұл шын мәнінде `body`-мен бірдей usage:

```swift
var topHome: some View { }
var body: some View { }
```

Екеуі де view көрсету үшін айнымалыны қолданады, return type — `some View`.

### Басқа view-ларды бөлу

Содан кейін басқа бөліктерді де бөлеміз:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote-қа қош келдіңіз")
        Text("Қайырлы таң")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Мені бас") {
        print("мені бас")
    }
    .buttonStyle(.borderedProminent)
}
```

Бөлгеннен кейін, view айнымалыларын `body` ішіне қоя аламыз:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Басты бет")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote-қа қош келдіңіз")
            Text("Қайырлы таң")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Мені бас") {
            print("мені бас")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Енді `body` тек page structure-ды сипаттауға жауапты:

```swift
topBar
welcomeText
colorList
clickButton
```

Әр бөліктің нақты implementation-ы төмендегі тиісті property ішінде орналасқан.

View-ды осылай бөлу page structure-ды айқынырақ етеді. Әр view area-ның өз атауы бар, оқу интуитивтірек болады.

Белгілі бір бөліктің code-ын өзгерткенде, complex code арасынан іздемей, тиісті view area-ны бірден табуға болады.

### some View бір view қайтарады

Бұл бөлінген view ішінде, егер бірнеше view қайтаруға тырыссақ:

```swift
var topBar: some View {
    Text("Басты бет")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` тек бір view structure қайтара алатындықтан, error пайда болады.

`body`-дан айырмашылығы, ordinary computed property default түрде `@ViewBuilder` болмайды.

Сондықтан бірнеше view қайтару қажет болса, `VStack`, `HStack` немесе `Group` container қолданып бірнеше view-ды біреуіне combine етуге болады.

```swift
var topBar: some View {
    VStack {
        Text("Басты бет")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Немесе view-ларды combine ету үшін `@ViewBuilder` қосуға болады:

```swift
@ViewBuilder
var topBar: some View {
    Text("Басты бет")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Осылай біз бірнеше view қайтаруды жүзеге асыра аламыз.

### if бірнеше view қайтарады

Мысалы:

```swift
var topHome: some View {
    if step == "Басты бет" {
        HStack {
            Text("Басты бет")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Жоқ")
    }
}
```

Бұл code ішінде `topHome` `step` content-іне қарай `HStack` немесе `Text` деген екі different type view қайтарады.

`some View` бір нақты determined return type қажет ететіндіктен, ordinary computed property ішіндегі `if`-тің екі branch-ы different type view-ды тікелей қайтара алмайды, сондықтан error болады.

**Solution әлі де container арқылы wrap ету немесе `@ViewBuilder` modifier-ын қолдану.**

### Бөлінген view неге жақша қолданбайды

`body` ішінде бөлінген view properties қолданғанда, біз тікелей былай жазамыз:

```swift
topBar
welcomeText
colorList
clickButton
```

Ал былай жазбаймыз:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Себебі `topBar`, `welcomeText`, `colorList`, `clickButton` — айнымалылар. Бұл айнымалылар шын мәнінде computed properties, methods емес.

**Properties үшін жақша қажет емес.**

Егер method ретінде жазсақ, ұқсас effect жасауға да болады:

```swift
func topBar() -> some View {
    HStack {
        Text("Басты бет")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Бұл code та ұқсас effect бере алады. Бұл method-ты шақырғанда бір view қайтарылады.

Қолданғанда былай жазу керек:

```swift
topBar()
```

SwiftUI-де егер parameter қажет етпейтін view-ды ғана бөлсек, computed property тәсілі жиірек қолданылады.

```swift
var topBar: some View { ... }
```

## Nested view-лар

Code-ды properties-ке бөлуден бөлек, жаңа view structure-лар да жасай аламыз.

Мысалы:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Бұл `PinkColorView`, `ContentView` сияқты, independent SwiftUI view.

Егер оны `ContentView` ішінде көрсету керек болса, view атауынан кейін `()` қосуға болады.

Мысалы:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Мұндағы:

```swift
PinkColorView()
```

бір `PinkColorView` instance жасау дегенді білдіреді.

`PinkColorView` `View` protocol-ын ұстанатындықтан, оны `Text`, `Image`, `Button` сияқты басқа view-лар ішіне қойып көрсетуге болады.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Бұл — view nesting, бір view басқа view ішінде көрсетіле алады.

## View property ме, әлде жаңа view жасау ма?

View code салыстырмалы түрде simple болса, әдетте code-ды бөлу қажет емес. Тек code complex болғанда ғана view бөлуді ұсынамыз.

### View property қолданылатын жағдай

Егер бұл current view ішіндегі кішкентай content block қана болса, view property қолдануға болады.

Мысалы:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Бұл contents әдетте тек current view ішінде қолданылады.

### Жаңа view жасау жағдайы

Егер бұл contents салыстырмалы түрде independent болса, немесе кейін бірнеше page ішінде reuse болуы мүмкін болса, жаңа view жасау қолайлырақ.

Мысалы:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Бұл title view. Егер біз бұл view-ды common component ретінде басқа view-ларда reuse еткіміз келсе.

Жаңа view жасай аламыз:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Содан кейін басқа жерде қолданамыз:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Осы кезде бұл view reusable independent component болады.

Қарапайым түрде былай қорытындылауға болады:

- current view-дың content area-сы: `var xxx: some View` қолдануға болады
- reusable independent component: жаңа `struct XxxView: View` жасауға болады
- data pass етуді қажет ететін component: әдетте жаңа view жасау қолайлырақ.

## Қорытынды

Бұл сабақта біз SwiftUI ішіндегі ең basic, бірақ ең important view structure-ды қайта түсіндік.

`ContentView` — құрылым. Ол `struct` арқылы defined етіледі және page-related code-ды ұйымдастыру үшін қолданылады.

`View` — protocol. Егер бір structure SwiftUI view болғысы келсе, `View` protocol-ын ұстануы керек.

`body` — `View` protocol бізден provide етуді талап ететін content. Ол бұл view қандай content көрсететінін анықтайды.

`some View` нақты бір view түрін return етуді білдіреді, ал біз оның complex full type-ын жазудың қажеті жоқ.

View code ұзара бастағанда, `var xxx: some View` қолдану арқылы view code-ды бірнеше small area-ға бөле аламыз.

Белгілі бір content block салыстырмалы түрде independent болса, немесе reuse қажет болса, жаңа view structure жасап, оны басқа view-ларда `XxxView()` арқылы көрсете аламыз.

Қарапайым айтқанда, SwiftUI interface бір-бір view-ларды combine ету арқылы құралады. Бір page бірнеше small view қамтуы мүмкін, ал бір small view әрі қарай басқа view-ларды contain ете алады.
