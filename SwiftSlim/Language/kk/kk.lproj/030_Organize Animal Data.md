# Жануарлар деректерін реттеу

Алдыңғы сабақта біз қарапайым жануарлар энциклопедиясы мысалын аяқтадық.

![view](../../../Resource/029_view.png)

Пайдаланушы белгілі бір жануарды басқанда, бет `Sheet` арқылы жануар туралы толық ақпаратты қалқымалы түрде көрсетеді.

Бірақ алдыңғы сабақтағы кодта бір мәселе бар: жануарлар деректері тікелей `ContentView` ішінде жазылған.

Мысалы:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Жануарлар тізімін көрсету
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Бұл код дұрыс жұмыс істейді, бірақ жануарлар деректері көбейген сайын `ContentView` өте ұзақ болып кетеді.

`ContentView` негізінен интерфейсті көрсетуге жауап беруі керек еді, бірақ қазір ол көп жануар деректерін де сақтап тұр. Бұл кодты оқуды қиындатады және кейінгі қызмет көрсетуді қолайсыз етеді.

Сондықтан бұл сабақта біз бір нәрсе істейміз:

жануарлар деректерін `ContentView` ішінен шығарып реттейміз.

## Деректерді неге бөлу керек?

SwiftUI ішінде view коды әдетте интерфейсті көрсетуге жауап береді.

Мысалы:

```swift
Text("Dolphin")
Image("dolphin")
```

Бұл кодтардың барлығы интерфейсті көрсетуге қатысты.

Ал жануар деректерінің өзі, мысалы жануар атауы, сурет атауы, таралу аймағы, тіршілік ортасы және сипаттама мәтіні, интерфейс құрылымы емес.

Олар тұрақты мәліметтердің бір тобына көбірек ұқсайды:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

Егер интерфейс кодын және деректер кодын түгел бірге жазсақ, код барған сайын ретсіз болады.

Сондықтан жануарлар деректерін `Animal` типіне орналастыруға болады.

## Тұрақты деректерді static арқылы сақтау

Алдымен реттелгеннен кейінгі жазылу тәсілін қарайық:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Мұнда жаңа бір жол код қосылды:

```swift
static let animals: [Animal] = [
    
]
```

`static` статикалық қасиетті білдіреді.

Статикалық қасиет белгілі бір нақты instance-қа емес, типтің өзіне тиесілі.

Бұл сөйлем сәл абстрактілі, оны қарапайым мысал арқылы түсінуге болады.

## Кәдімгі қасиет және статикалық қасиет

Мысалы, біз `Student` анықтаймыз:

```swift
struct Student {
    let name: String
}
```

Мұндағы `name` — кәдімгі қасиет. Кәдімгі қасиет белгілі бір нақты instance-қа тиесілі.

Егер `name`-ге қол жеткізгіміз келсе, алдымен нақты бір студент жасауымыз керек:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Мұндағы `student` — instance. Оны алдымен нақты бір студент дерегі деп түсінуге болады.

Әр студенттің аты әртүрлі болуы мүмкін болғандықтан, `name` нақты студенттің ішінде орналасуы керек.

Бірақ кейбір деректер белгілі бір нақты instance-қа тиесілі емес.

Мысалы, біз preview үшін бір топ мысал дерек дайындағымыз келеді:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

Мұндағы `previewStudents` алдында `static` бар, сондықтан ол статикалық қасиет.

Статикалық қасиет белгілі бір студентке емес, `Student` типінің өзіне тиесілі.

Сондықтан бізге алдымен белгілі бір студент жасаудың қажеті жоқ, тип атауы арқылы тікелей қол жеткізе аламыз:

```swift
print(Student.previewStudents.count)    // 3
```

Мұндағы қол жеткізу тәсілі:

```swift
Тип атауы.Статикалық қасиет атауы
```

яғни:

```swift
Student.previewStudents
```

Сол сияқты, жануарлар энциклопедиясында жануарлар деректеріне былай қол жеткізе аламыз:

```swift
Animal.animals
```

## ContentView-ге қайта оралу

Енді жануарлар деректері `Animal` типінде сақталды.

Сондықтан `ContentView` ішінде ұзын жануарлар массивін қайта жазудың қажеті жоқ.

Біз оны былай өзгерте аламыз:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Жануарлар тізімін көрсету
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Бұл жол код мынаны білдіреді:

```swift
let animals = Animal.animals
```

`Animal` типінен `animals` атты жануарлар деректерін алып, оларды ағымдағы view ішіндегі `animals` тұрақтысына сақтаймыз.

Осылай жазғаннан кейін `ContentView` әлдеқайда ықшам болады.

`ContentView` интерфейсті көрсетуге жауап береді, ал `Animal.animals` жануарлар деректерін беруге жауап береді.

## Animal-ды бөлек файлға шығару

Алдыңғы сабақта мысалды түсіну оңай болуы үшін `Animal` мен `ContentView` бір файлда жазылды.

Себебі ол кезде код әлі аз болатын, бұлай жазуда мәселе жоқ еді.

Бірақ қазір жануарлар деректері көбейіп жатыр. Егер барлық кодты әрі қарай да `ContentView.swift` ішінде жазсақ, файл өте ұзақ болады және оқуға қолайсыз болады.

Сондықтан `Animal`-ды бөлек жаңа Swift файлына орналастыруға болады.

Xcode ішінде жаңа Swift файлын жасауға болады, мысалы:

```swift
Animal.swift
```

Содан кейін `Animal` құрылымын осы файлға жылжытамыз:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Осылай реттегеннен кейін:

`ContentView.swift` интерфейсті көрсетуге жауап береді.

`Animal.swift` жануар деректерінің құрылымын сипаттауға жауап береді.

Олар әртүрлі файлдарда орналасса да, бір жобаның ішінде болғандықтан, `ContentView` әлі де `Animal`-ды тікелей пайдалана алады.

Мысалы:

```swift
let animals = Animal.animals
```

Мұнда `ContentView.swift` ішінде `Animal.swift` файлын қосымша import етудің қажеті жоқ.

Swift бір жобадағы Swift файлдарын автоматты түрде таниды.

## Кодты extension арқылы әрі қарай реттеу

Енді біз жануарлар деректерін `ContentView` ішінен `Animal` ішіне жылжыттық.

Бірақ `Animal` құрылымында әлі де екі түрлі код қатар орналасқан:

Бірінші түрі — жануар моделінің өз қасиеттері:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Екінші түрі — тұрақты жануарлар деректері:

```swift
static let animals: [Animal] = [
    // ...
]
```

Код құрылымы түсініктірек болуы үшін біз `extension` арқылы бұл екі бөлікті бөле аламыз.

`extension` кеңейту дегенді білдіреді.

Ол бастапқы типтің негізінде жаңа код қосуды жалғастыра алады.

Мысалы:

```swift
extension Animal {
    
}
```

Бұл біз `Animal` типін кеңейтіп жатқанымызды білдіреді.

## Жануарлар деректерін extension ішіне орналастыру

Біз `Animal`-ды былай өзгерте аламыз:

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Осылай реттегеннен кейін код құрылымы түсініктірек болады.

`struct Animal` бір жануарда қандай қасиеттер болуы керегін сипаттауға жауап береді.

`extension Animal` тұрақты жануарлар деректерінің бір тобын сақтауға жауап береді.

Назар аударыңыз: `animals` `extension Animal` ішіне жылжытылғанымен, пайдалану тәсілі өзгермейді.

Біз оны әлі де былай пайдалана аламыз:

```swift
let animals = Animal.animals
```

Бұл да `extension` ерекшеліктерінің бірі: ол тек кодты реттеуге көмектеседі, сыртқы шақыру тәсілін өзгертпейді.

## Деректер көп болғанда, тағы AnimalData файлын жасауға болады

Енді біз `Animal`-ды бөлек `Animal.swift` файлына орналастырдық.

Егер жануарлар деректері аз болса, `extension Animal`-ды да тікелей `Animal.swift` ішінде жазуға болады.

Бірақ жануарлар деректері барған сайын көбейсе, тағы бір файл жасауға болады, мысалы:

```swift
AnimalData.swift
```

Содан кейін тұрақты жануарлар деректерін соның ішіне орналастырамыз:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Жануарлар деректері
    ]
}
```

Осылай жасағаннан кейін кодтың міндеттері айқынырақ болады:

`Animal.swift` тек жануар моделін анықтауға жауап береді.

`AnimalData.swift` тек жануарлар деректерін сақтауға жауап береді.

`ContentView.swift` тек интерфейсті көрсетуге жауап береді.

Әр файлдың міндеті айқынырақ болады.

Назар аударыңыз: `AnimalData.swift` тек файл атауы, жаңа Swift типі емес. Бұл файлдың ішінде әлі де `extension Animal` арқылы `Animal`-ға тұрақты деректер қосылып жатыр.

## Толық код

Төменде реттелгеннен кейінгі `Animal.swift` коды берілген:

```swift
import Foundation

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

Реттелгеннен кейінгі `AnimalData.swift` коды:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

`ContentView.swift` ішінде былай пайдалануға болады:

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
```

Ескерту: `Animal.swift` және `AnimalData.swift` файлдарының бірінші жолында мыналар жазылған:

```swift
import Foundation
```

Бұған дейін SwiftUI интерфейсін жазғанда біз жиі мынаны қолдандық:

```swift
import SwiftUI
```

Себебі `ContentView`, `Text`, `Button`, `Color` сияқты мазмұндар интерфейске қатысты, сондықтан интерфейс файлын жазғанда әдетте SwiftUI import ету керек.

Бірақ мұндағы `Animal.swift` және `AnimalData.swift` интерфейс файлдары емес. Олар негізінен жануар моделін анықтауға және жануарлар деректерін сақтауға арналған.

Бұл кодта `UUID()` үшін `Foundation` қажет, сондықтан `Foundation` import етсек жеткілікті.

## Қорытынды

Бұл сабақта біз негізінен бір нәрсе жасадық: жануарлар деректерін `ContentView` ішінен шығарып реттедік.

Бұрынғы жазу тәсілінде жануарлар деректері тікелей `ContentView` ішінде жазылатын. Код жұмыс істей алады, бірақ деректер көбейгенде view файлы барған сайын ұзақ болады.

Реттегеннен кейін `ContentView` тек интерфейсті көрсетуге жауап береді, ал `Animal.animals` жануарлар деректерін беруге жауап береді.

Бұл сабақта тағы екі жаңа білім үйрендік.

Біріншісі — `static`.

`static` статикалық қасиетті білдіреді. Статикалық қасиет типтің өзіне тиесілі және оны «тип атауы.қасиет атауы» тәсілімен тікелей қолдануға болады.

Мысалы:

```swift
Animal.animals
```

Екіншісі — `extension`.

`extension` кеңейтуді білдіреді. Ол бір типтің кодын бөліп жазуға мүмкіндік береді, осылайша код құрылымы түсініктірек болады.

Бұл мысалда біз `extension Animal` арқылы жануарлар деректерін сақтадық, сондықтан `Animal` құрылымының өзі ықшамырақ болды.

Сонымен қатар, `Animal` негізінен деректер моделін сақтайды және SwiftUI интерфейсін тікелей жазбайды, сондықтан мұнда `import Foundation` қолданылады.

Бұл сабақтың негізгі мақсаты кодты күрделендіру емес, оны оқуға және қызмет көрсетуге ыңғайлы ету.

