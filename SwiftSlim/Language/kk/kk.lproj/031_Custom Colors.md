# Пайдаланушы түстері

Бұл сабақта SwiftUI ішінде түстерді қалай пайдаланушы түрде баптауды үйренеміз.

Алдыңғы сабақтарда біз SwiftUI ұсынатын әдепкі түстерді қолданып көрдік, мысалы:

```swift
Color.blue
Color.red
Color.green
```

Бұл түстерді қолдану өте ыңғайлы, бірақ нақты App әзірлеуде әдепкі түстер көбіне жеткілікті дәл болмайды.

Мысалы, дизайн макетінде мынадай түстер қолданылуы мүмкін:

```text
#2c54c2
#4875ed
#213e8d
```

Мұндай түс Hex түсі деп аталады.

Бұл сабақта біз алдымен SwiftUI-ге Hex түстерін қолдауды қосамыз, содан кейін жиі қолданылатын түстерді `static` арқылы реттейміз.

Соңында пайдаланушы түстерін жануарлар энциклопедиясы көрінісіне қолданамыз және батырмаларға тереңірек қабаттылық беру үшін градиент фонды пайдаланамыз.

## Неге пайдаланушы түстері қажет?

SwiftUI ішінде жүйелік түстерді тікелей қолдана аламыз.

Мысалы:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Мұндағы `.blue` көк түсті білдіреді. Ол шын мәнінде `Color.blue` жазылымының қысқартылған түрі.

Әдепкі түстердің артықшылығы — қарапайым әрі ыңғайлы, бірақ түс таңдауы салыстырмалы түрде шектеулі.

Мысалы:

```swift
Color.blue
```

Ол тек SwiftUI ұсынатын әдепкі көк түсті ғана білдіре алады.

![Color.blue](../../../Resource/031_color6.png)

Бірақ нақты әзірлеуде бізге жиі нақтырақ түстер қажет болады.

Мысалы, бәрі көк түс болғанымен, ашық көк, қою көк, сұрлау көк, жарық көк сияқты әртүрлі әсерлер болуы мүмкін.

![More Blue](../../../Resource/031_color5.png)

Бұл кезде тек `Color.blue` қолдансақ, дизайндағы әсерді дәл қайталау қиын болады.

Сондықтан SwiftUI-ге пайдаланушы түстерін қолдауды қосуымыз керек.

## Hex түсі деген не?

Экрандағы түстер әдетте қызыл, жасыл, көк деген үш арнадан тұрады, яғни RGB.

RGB мыналарды білдіреді:

```text
Red     // Қызыл
Green   // Жасыл
Blue    // Көк
```

Hex түсі — RGB түсін көрсету тәсілдерінің бірі.

Мысалы:

```swift
#5479FF
```

Бұл түс мәнін қарапайым түрде үш бөлікке бөлуге болады:

```text
54  // Қызыл арнаны білдіреді
79  // Жасыл арнаны білдіреді
FF  // Көк арнаны білдіреді
```

Бұл сабақта бұл мәндерді есептеуіміз де, он алтылық ережелерді терең түсінуіміз де қажет емес.

Қазір тек мынаны білу жеткілікті: `#5479FF` нақты бір түсті білдіреді.

Кейін `#2c54c2`, `#4875ed` сияқты жазылымдарды көргенде, оны алдымен түс мәні ретінде түсінуге болады.

Sketch, Figma, Photoshop сияқты дизайн құралдарында да осындай түс мәндері жиі кездеседі.

![color](../../../Resource/031_color.png)

Бірақ SwiftUI әдепкі түрде мынадай жазуды тікелей қолдамайды:

```swift
Color(hex: "#5479FF")
```

Сондықтан біз `Color` түрін өзіміз кеңейтіп, Hex жолы арқылы түс жасау мүмкіндігін қосамыз.

## Color+Hex.swift файлын жасау

Алдымен жаңа Swift файлын жасаймыз.

Файл атауын былай жазуға болады:

```text
Color.swift
```

Немесе анығырақ етіп былай жазуға болады:

```text
Color+Hex.swift
```

Мұнда мына атауды қолдану көбірек ұсынылады:

```text
Color+Hex.swift
```

Swift жобаларында `Color+Hex.swift` сияқты файл атаулары өте жиі кездеседі.

Ол бұл файлдың `Color` түріне Hex мүмкіндігін қосатын кеңейту файлы екенін білдіреді.

Файл атауы кодтың орындалуына тікелей әсер етпейді, тек бұл файлдың мақсатын оңай түсіну үшін қолданылады.

## Color(hex:) кодын қосу

`Color+Hex.swift` файлына төмендегі кодты жазыңыз:

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

Бұл код `extension` арқылы `Color` түрін кеңейтеді және `Color` үшін жаңа инициализация әдісін қосады:

```swift
init(hex: String)
```

Осы инициализация әдісі болғаннан кейін, Hex жолын `Color` ішіне беріп, пайдаланушы түсін жасай аламыз:

```swift
Color(hex: "#5479FF")
```

Бұл кеңейту коды ішінде Hex жолы SwiftUI тани алатын RGB түсіне түрлендіріледі.

Қазіргі кезеңде әрбір түрлендіру жолын терең түсіну қажет емес. Тек қосылған `Color(hex:)` әдісі Hex түс мәні арқылы пайдаланушы түсін жасауға мүмкіндік беретінін білу жеткілікті.

## Пайдаланушы түсін қолдану

Енді `ContentView` ішінде пайдаланушы түсін тексеріп көре аламыз.

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

Көрсету нәтижесі:

![color](../../../Resource/031_color1.png)

Бұл мысалда бірінші жол жүйелік түсті қолданады:

```swift
.foregroundStyle(Color.blue)
```

Кейінгі үш жол пайдаланушы Hex түстерін қолданады:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Салыстыру арқылы жүйелік көктің тек бір әдепкі әсері бар екенін байқауға болады.

Ал Hex түсі көк түстің әлдеқайда нәзік өзгерістерін көрсете алады.

Пайдаланушы түсінің құндылығы осында: ол интерфейстің түсін нақты дизайнға жақындатады және App-тың визуалды стилін басқаруды жеңілдетеді.

## Түстерді static арқылы реттеу

Енді біз Hex жолы арқылы түс жасай аламыз:

```swift
Color(hex: "#2c54c2")
```

Бұл жазылым қалыпты жұмыс істейді, бірақ бір түс бірнеше жерде қайталанса, кейін оны күтіп ұстау онша ыңғайлы болмайды.

Егер осы түс мәні 10 жерде жазылса, кейін бұл көк түсті өзгерткіңіз келсе, әр жерді жеке өзгерту керек болады.

Бұл кезде жиі қолданылатын түстерді `static` арқылы бір жерге жинауға болады.

`Color+Hex.swift` файлының соңына төмендегі кодты қосуды жалғастырыңыз:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Мұнда біз `Color` үшін үш статикалық қасиет қостық: `animalBlue`, `animalLightBlue` және `animalDarkBlue`. Олар көк түстің әртүрлі ашық-қою реңктерін білдіреді.

Бұл қасиеттер `static` қолданғандықтан, олар `Color` түрінің өзіне тиесілі болады.

Қолдану кезінде оларға `Color.` арқылы тікелей қол жеткізуге болады:

```swift
Color.animalBlue
```

Бұл жазылым Hex жолын тікелей жазғаннан түсініктірек.

`Color.animalBlue` көргенде, оның жануарлар энциклопедиясында қолданылатын көк түс екенін біле аламыз.

Ал `Color(hex: "#2c54c2")` көргенде, оның түс мәні екенін ғана білеміз, бірақ нақты қай мақсатта қолданылатынын бірден түсіну қиын.

Түстерді бір жерден басқарудың тағы бір артықшылығы бар: кейін өзгерту оңайырақ.

Егер жануарлар энциклопедиясының негізгі түсін реттегіңіз келсе, тек анықталған орынды өзгерту жеткілікті:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Осы түсті қолданатын барлық жер бірге жаңарады.

`static` арқылы түстерді реттеудің мәні осында: түс атаулары анық болады, әрі кейінгі күтім ыңғайлы болады.

## Жануарлар энциклопедиясына қолдану

Енді пайдаланушы түстерін алдыңғы жануарлар энциклопедиясы көрінісіне қолдана аламыз.

Бұрын жануар батырмасының фоны ақ түсті болатын:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Енді оны пайдаланушы түске ауыстыра аламыз:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Мұндағы `Color.animalBlue` — жаңа ғана `Color+Hex.swift` ішінде анықтаған статикалық түс.

Батырма мәтіні ақ түсті қолданады:

```swift
.foregroundStyle(Color.white)
```

Жануар emoji фоны жартылай мөлдір ақ түсті қолданады:

```swift
.background(Color.white.opacity(0.15))
```

Осылайша батырма біртұтас көк визуалды стиль қалыптастырады.

Бұл қадамның басты мақсаты күрделі код қосу емес, алдыңғы үйренген пайдаланушы түстерін шын интерфейске қолдану.

## Градиент фонды қолдану

Бір ғана түсті қолданумен қатар, бірнеше түсті біріктіріп градиент әсерін де жасауға болады.

Мысалы, біз жоғарыда мына түстерді анықтадық:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Бұл түстерді жеке қолдануға да, градиент фонға біріктіруге де болады.

SwiftUI ішінде сызықтық градиент жасау үшін `LinearGradient` қолдануға болады.

Мысалы:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Бұл код солдан оңға қарай градиент фон жасайды, түс `Color.animalBlue` мәнінен біртіндеп `Color.animalLightBlue` мәніне өтеді.

Мұнда `colors` градиентке қатысатын түстерді орнатады, ал `startPoint` және `endPoint` градиент бағытын басқарады.

### Градиент әсерін тексеру

Градиент фонды қарапайым Text арқылы тексеріп көре аламыз.

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

Көрсету нәтижесі:

![color](../../../Resource/031_color3.png)

Бұл мысалда `Text` фоны енді бір түсті емес, солдан оңға қарай біртіндеп өзгеретін градиент түсі болады.

Қарапайым фон түсімен салыстырғанда, градиент фон көбірек қабаттылық береді және интерфейсте визуалды екпін жасауды жеңілдетеді.

## Жануарлар энциклопедиясында градиент фонды қолдану

Енді жануар батырмасының фон түсін:

```swift
.background(Color.animalBlue)
```

градиент фонға өзгерте аламыз:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Толық код төмендегідей:

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

Көрсету нәтижесі:

![color](../../../Resource/031_color4.png)

Енді жануар батырмасы тек бір түсті фон емес, солдан оңға қарай градиент әсеріне ие болады.

Бір түсті фонмен салыстырғанда, градиент фон интерфейсті қабаттылығы көбірек етіп көрсетеді және нақты App ішіндегі визуалды дизайнға жақындатады.

## Бір түсті фон мен градиент фонның айырмашылығы

Бір түсті фон тек бір түсті қолданады.

Мысалы:

```swift
.background(Color.animalBlue)
```

Бұл жазылым қарапайым әрі түсінікті, көпшілік базалық интерфейстерге сәйкес келеді.

Градиент фон бірнеше түсті қолданады.

Мысалы:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Бұл жазылым интерфейске көбірек қабаттылық бере алады, бірақ визуалды күрделілікті де оңай арттырады.

Сондықтан нақты әзірлеуде оны былай түсінуге болады:

Бір түсті фон қарапайым мәтінге, қарапайым батырмаға, қарапайым карточкаға және қарапайым бет фонына сәйкес келеді.

Градиент фон маңызды батырма, жоғарғы аймақ, мұқаба карточкасы, функция кіреберісі сияқты ерекше көрсету керек орындарға сәйкес келеді.

## Қорытынды

Бұл сабақта SwiftUI ішінде пайдаланушы түстерін қалай қолдануды үйрендік.

Алдымен Hex түсін түсіндік.

Мысалы:

```text
#2c54c2
```

Ол нақты бір түсті білдіреді.

Содан кейін `extension Color` арқылы `Color` түрін кеңейттік.

SwiftUI мынадай тәсілмен түс жасай алатын болды:

```swift
Color(hex: "#2c54c2")
```

Одан кейін жиі қолданылатын түстерді `static` арқылы реттедік:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Осылайша басқа көріністерде тікелей қолдануға болады:

```swift
Color.animalBlue
```

Әр жолы Hex жолын жазумен салыстырғанда, бұл тәсіл түсініктірек және кейін түсті бір жерден өзгертуге ыңғайлы.

Соңында `LinearGradient` үйрендік және пайдаланушы түстерін градиент фонға біріктірдік:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Бұл сабақ арқылы біз “пайдаланушы түсін жасау” кезеңінен “түсті нақты интерфейсте қолдану” кезеңіне дейінгі процесті аяқтадық.

Кейін бір түс бірнеше жерде қайталанып қолданылса, оны алдымен `Color` кеңейтуіне реттеп қоюды қарастыруға болады.

Осылай код түсініктірек болады, ал интерфейс стилін бірізді ету де жеңілдейді.
