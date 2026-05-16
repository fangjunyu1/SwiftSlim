# Жануарлар энциклопедиясы

Бұл сабақта біз реттелетін көріністер мен деректерді беруді жаттықтыруды жалғастырамыз.

Біз қарапайым жануарлар энциклопедиясы көрінісін жасаймыз. Бетте бес жануар көрсетіледі. Белгілі бір жануарды басқанда, осы жануардың суретін, таралу аймағын, мекендеу ортасын және сипаттамасын көрсететін мәлімет көрінісі ашылады.

Нәтиже:

![view](../../../Resource/029_view.png)

Осы мысал арқылы деректер құрылымы, тізім көрсету, басу әрекеті және Sheet қалқымалы көрінісі арасындағы байланысты жаттықтыра аламыз.

## Сурет материалдарын дайындау

Алдымен бес жануар суретін дайындауымыз керек:

- Дельфин: `dolphin.jpg`
- Керік: `giraffe.jpg`
- Арыстан: `lion.jpg`
- Панда: `panda.jpg`
- Ақ аю: `polarBear.jpg`

Төмендегі сурет материалдарын пайдалануға болады:

[Дельфин](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[Керік](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[Арыстан](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[Панда](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[Ақ аю](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Суреттерді жүктеп алғаннан кейін, оларды Xcode жобасындағы `Assets` ресурс қалтасына сүйреп апарыңыз.

![assets](../../../Resource/029_assets.png)

Назар аударыңыз: кодта суретті қолданғанда, әдетте `.jpg` жұрнағын жазудың қажеті жоқ.

Мысалы, сурет ресурсының атауы `dolphin` болса, кодта былай жазылады:

```swift
Image("dolphin")
```

Егер сурет атауы қате жазылса, сурет дұрыс көрсетілмейді.

Ескерту: жоғарыдағы сурет материалдары Wikimedia жобасынан алынған. Қолданған кезде бастапқы сурет сілтемесі мен дереккөз ақпаратын сақтаған жөн.

## Жануар құрылымын жасау

Бұл бетте әр жануардың бірнеше ақпараты бар:

- Жануар атауы
- Жануар суреті
- Жануар эмодзиі
- Таралу аймағы
- Мекендеу ортасы
- Жануар сипаттамасы

Егер бұл ақпаратты көптеген айнымалыға бөліп жазсақ, код ретсіз болады. Сондықтан бір жануардың ақпаратын біріктіру үшін `Animal` құрылымын жасай аламыз.

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

Бұл кодта:

- `id`: жануардың бірегей идентификаторы.
- `name`: жануар атауы.
- `imageName`: жануар суретінің атауы.
- `avatarEmoji`: жануар эмодзиі.
- `distributionArea`: таралу аймағы.
- `habitat`: мекендеу ортасы.
- `animalDescription`: жануар сипаттамасы.

Оның ішінде:

```swift
let id = UUID()
```

`id` әр жануарды белгілеу үшін қолданылады. Кейін біз жануарлар тізімін көрсету үшін `ForEach` қолданамыз және таңдалған жануарға қарай мәліметті ашу үшін `.sheet(item:)` қолданамыз. Сондықтан `Animal` құрылымы `Identifiable` протоколына сай болуы керек.

`Identifiable` SwiftUI-ға әр жануардың өзін ажыратуға болатын `id` мәні бар екенін айтады.

## Жануар деректерін жасау

Енді `ContentView` ішінде жануарлар массивін жасаймыз.

Массивте бес `Animal` сақталады, әр `Animal` бір жануарды білдіреді.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Дельфин
        Animal(
            name: "Дельфин",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Дүние жүзіндегі жылы және қоңыржай мұхиттар.",
            habitat: "Мұхиттар, жағалау сулары және кейбір ірі өзендер.",
            animalDescription: "Дельфиндер — ақылды теңіз сүтқоректілері. Олар топпен өмір сүреді, дыбыстар арқылы байланысады және ойнақы мінезімен танымал."
        ),
        // Керік
        Animal(
            name: "Керік",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Африкадағы саванналар мен ашық орманды алқаптар.",
            habitat: "Шалғындар, саванналар және ашық ормандар.",
            animalDescription: "Керіктер — құрлықтағы ең биік жануарлар. Олардың мойны мен аяқтары ұзын, әдетте биік ағаштардың жапырақтарымен қоректенеді."
        ),
        // Арыстан
        Animal(
            name: "Арыстан",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Негізінен Сахараның оңтүстігіндегі Африкада кездеседі, ал батыс Үндістанда шағын популяциясы бар.",
            habitat: "Шалғындар, саванналар және ашық орманды алқаптар.",
            animalDescription: "Арыстандар — күшті ірі мысықтар. Олар көбіне прайд деп аталатын топтарда өмір сүреді және жиі жануарлар әлемінің патшасы ретінде белгілі."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Қытайдың орталық бөлігіндегі тау ормандары.",
            habitat: "Салқын әрі ылғалды тау аймақтарындағы бамбук ормандары.",
            animalDescription: "Пандалар — қара-ақ жүнімен белгілі аюлар. Олар негізінен бамбукпен қоректенеді және әлемдегі ең оңай танылатын жануарлардың бірі."
        ),
        // Ақ аю
        Animal(
            name: "Ақ аю",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Солтүстік полюс маңындағы Арктика аймақтары.",
            habitat: "Теңіз мұзы, жағалау аймақтары және суық Арктика ортасы.",
            animalDescription: "Ақ аюлар — суық ортаға бейімделген ірі аюлар. Олар жақсы жүзеді және итбалық аулау үшін негізінен теңіз мұзына сүйенеді."
        )
    ]

    var body: some View {
        Text("Жануарлар энциклопедиясы")
    }
}
```

Мұндағы `animals` — массив:

```swift
let animals: [Animal]
```

`[Animal]` бұл массивте бірнеше `Animal` сақталатынын білдіреді.

Яғни `animals` бір жануар емес, жануарлар тобы.

## Жануарлар тізімін көрсету

Енді жануарлар тізімін көрсету үшін `ForEach` қолдана аламыз.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
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

Көрсетілу нәтижесі:

![view](../../../Resource/029_view1.png)

Бұл кодта:

```swift
ForEach(animals) { animal in
    ...
}
```

Бұл `animals` массивін аралап шығуды білдіреді.

Әр айналымда `animal` қазіргі көрсетіліп жатқан жануарды білдіреді.

Мысалы, бірінші айналымда `animal` — дельфин; екінші айналымда `animal` — керік.

Сондықтан қазіргі жануардың ақпаратын төмендегідей көрсете аламыз:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Осылайша бес жануарды экранға шығара аламыз.

## Жануарлар тізімін басылатын ету

Қазір тізім көрсетілді, бірақ оны әлі басуға болмайды.

Егер бір жануарды басқаннан кейін мәлімет ашылсын десек, алдымен “қазіргі таңдалған жануарды” жазып алуымыз керек.

Сондықтан `ContentView` ішіне күй айнымалысын қосамыз:

```swift
@State private var selectedAnimal: Animal? = nil
```

Мұндағы `selectedAnimal` — `Animal?` атты optional мән түрі.

Бұл оның ішінде бір жануар болуы да, болмауы да мүмкін екенін білдіреді.

Бастапқы мәні `nil`, яғни басында ешбір жануар таңдалмаған.

Содан кейін әр жануар жолын `Button` түріне өзгертеміз:

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
                .clipShape(Circle())
            
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

Негізгі бөлік — мына код жолы:

```swift
selectedAnimal = animal
```

Пайдаланушы белгілі бір жануарды басқанда, сол жануарды `selectedAnimal` ішінде сақтаймыз.

Мысалы, пайдаланушы дельфинді басса, `selectedAnimal` ішінде дельфин сақталады.

Пайдаланушы панданы басса, `selectedAnimal` ішінде панда сақталады.

Яғни `selectedAnimal` пайдаланушы қазір қай жануарды басқанын жазып алу үшін қолданылады.

## Sheet қалқымалы көрінісі

Енді біз батырма арқылы “қазір басылған жануарды” жаза аламыз.

Келесі қадамда жануар мәліметін көрсету үшін қалқымалы көрініс жасаймыз.

![view](../../../Resource/029_view2.png)

SwiftUI ішінде мұндай қалқымалы әсерді `Sheet` арқылы жасауға болады.

`Sheet` уақытша ашылатын бет ретінде түсіндіріледі. Ол қазіргі беттің үстінде көрсетіледі, ал пайдаланушы мазмұнды қарап болған соң төмен сырғытып жаба алады.

## Sheet мысалы

Жануар мәліметін нақты көрсетпес бұрын, `Sheet` қалай ашылатынын қарапайым мысалмен түсініп алайық.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet көрсету")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet көрінісі")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/029_view3.png)

Бұл кодта біз Boolean мәнін жасаймыз:

```swift
@State private var showSheet = false
```

`showSheet` бастапқыда `false`, яғни басында `Sheet` көрсетілмейді.

Батырманы басқанда:

```swift
showSheet.toggle()
```

`toggle()` Boolean мәнін ауыстыруды білдіреді.

Егер бастапқыда `false` болса, `toggle()` шақырылғаннан кейін `true` болады.

Егер бастапқыда `true` болса, `toggle()` шақырылғаннан кейін `false` болады.

Сондықтан батырманы басқаннан кейін `showSheet` `false` мәнінен `true` мәніне өзгереді.

`showSheet` `true` болған кезде, төмендегі код `Sheet` ашады:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet көрінісі")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Бұл код: `showSheet` `true` болған кезде бір `Sheet` ашып, оның ішінде `Text("Sheet көрінісі")` көрсетеді.

Көрсетілу нәтижесі:

![view](../../../Resource/029_view4.png)

Бұл жазу тәсілі тұрақты мазмұнды ашуға ыңғайлы.

Мысалы, батырманы басқаннан кейін баптаулар беті, түсіндірме беті немесе ескерту беті ашылуы мүмкін.

### Sheet көрсетілетін орны

`Sheet` қалқымалы көрініс болғанымен, SwiftUI ішінде ол `Text()` немесе `Image()` сияқты жеке көрініс ретінде тікелей жазылмайды, ол көрініс модификаторы ретінде қолданылады.

Яғни `.sheet(...)` модификаторы `.font()`, `.padding()`, `.shadow()` сияқты белгілі бір көріністің соңына қосылады.

Мысалы:

```swift
Button("Sheet көрсету") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet көрінісі")
}
```

Бұл мысалда `.sheet` `Button` соңына қосылған.

`showSheet` `true` болған кезде, SwiftUI `Sheet` ашып, фигуралық жақшаның ішіндегі мазмұнды көрсетеді:

```swift
Text("Sheet көрінісі")
```

Алайда нақты әзірлеуде бір бетте бірнеше батырма болса, әдетте әр батырмаға жеке `.sheet` қоспайды.

Көбірек қолданылатын тәсіл — `.sheet` модификаторын сыртқы көріністің соңына қосу.

Мысалы:

```swift
VStack {
    Button("Sheet көрсету") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet көрінісі")
}
```

Батырма `showSheet` мәнін өзгертеді, ал сыртқы көрініс `showSheet` `true` ма, соған қарай `Sheet` ашады.

## Optional мәнді Sheet-ке байланыстыру

Бұған дейін біз мына жазу тәсілін үйрендік:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet көрінісі")
}
```

Бұл жазу тәсілі тұрақты бір бетті көрсету мен жасыруды басқаруға ыңғайлы.

Бірақ жануарлар энциклопедиясы мысалында біз тек “`Sheet` ашыла ма?” дегенді емес, “қай жануар басылды?” дегенді де білуіміз керек.

Мысалы:

Пайдаланушы дельфинді басса, `Sheet` ішінде дельфин мәліметі көрсетілуі керек.

Пайдаланушы панданы басса, `Sheet` ішінде панда мәліметі көрсетілуі керек.

Сондықтан бұл жерде Sheet-тің басқа жазу тәсілін қолданған дұрыс:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet ішінде көрсетілетін мазмұн
}
```

Бұл кодта `Sheet` `selectedAnimal` optional мәніне байланыстырылған.

Мұнда назар аударыңыз: `item:` соңынан `selectedAnimal` емес, `$selectedAnimal` жазылады.

Себебі `Sheet` `selectedAnimal` мәнін тек оқымайды, оның өзгерісіне қарай ашылу-ашылмауын да шешеді.

Бұл кодты былай түсінуге болады:

- `selectedAnimal` `nil` болса, `Sheet` көрсетілмейді.
- `selectedAnimal` мәнге ие болса, `Sheet` көрсетіледі.
- `Sheet` жабылған кезде, SwiftUI `selectedAnimal` мәнін қайтадан `nil` етеді.

SwiftUI `selectedAnimal` ішінде сақталған жануарды фигуралық жақшаның ішіндегі `animal` мәніне береді.

Яғни `.sheet(item:)` тек ашылуды басқармайды, таңдалған деректі `Sheet` ішіне де береді.

## Sheet арқылы жануар атауын көрсету

Енді күрделі мәлімет көрінісін жасауға асықпайық.

Код түсініктірек болуы үшін алдымен `Sheet` ішінде қазіргі жануардың атауын көрсетеміз.

`VStack` сыртына `.sheet(item:)` қосамыз:

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
                        .clipShape(Circle())
                    
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

Мұнда ең маңыздысы — мына код:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal` мәнге ие болған кезде, `Sheet` ашылады.

Фигуралық жақшадағы `animal` — қазіргі таңдалған жануар.

Сондықтан:

```swift
Text(animal.name)
```

қазір басылған жануардың атауын көрсетеді.

Мысалы, `Дельфин` басылса, Sheet ішінде `Дельфин` көрсетіледі.

`Панда` басылса, `Sheet` ішінде `Панда` көрсетіледі.

Осылайша әртүрлі жануарды басқанда, әртүрлі жануар атауы ашылатын әсерді жасадық.

Жануар атауын көрсету:

![view](../../../Resource/029_view5.png)

Бірақ жануар мәліметі тек атаудан тұрмауы керек. Онда атау, таралу аймағы, мекендеу ортасы және сипаттама көрсетілуі керек.

Егер бұл кодтардың бәрін `.sheet` ішіне жазсақ, код тым ұзын болып, оқуға ыңғайсыз болады.

Сондықтан келесі қадамда жануар мәліметін көрсетуге арналған жаңа реттелетін көрініс жасаймыз.

## Жануар мәліметі көрінісін жасау

Енді жаңа реттелетін `AnimalDetailView` көрінісін жасаймыз.

Бұл көрініс бір `Animal` қабылдап, жануар мәліметін көрсетеді.

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
                    Text("**Таралу аймағы** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Мекендеу ортасы** ：\(animal.habitat)")

                    Divider()

                    Text("**Жануар сипаттамасы** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/029_view2.png)

Мұндағы негізгі бөлік:

```swift
var animal: Animal
```

Бұл `AnimalDetailView` сырттан бір жануар қабылдауы керек екенін білдіреді.

Жануарды алғаннан кейін, мәлімет көрінісі осы жануардың әртүрлі ақпаратын қолдана алады:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Яғни `AnimalDetailView` тек берілген жануарды көрсетуге жауапты.

### Markdown арқылы қалың мәтін

Мәлімет көрінісінде біз мынадай код жаздық:

```swift
Text("**Мекендеу ортасы:** \(animal.habitat)")
```

Мұнда екі маңызды нәрсе бар.

Біріншіден, `**Мекендеу ортасы:**` `Markdown` синтаксисін қолданады. Екі жұлдызшаның ішіндегі мәтін қалың болып көрсетіледі.

Екіншіден, `\()` — string interpolation, ол айнымалы мәнін мәтін ішінде көрсетуге мүмкіндік береді.

Бұл код алдымен қалың `Мекендеу ортасы:` мәтінін, содан кейін осы жануардың мекендеу ортасын көрсетеді.

## Sheet ішінде мәлімет көрінісін көрсету

`AnimalDetailView` жасалғаннан кейін, `ContentView` ішіне қайтып, `Sheet` ішіндегі бастапқы атау көрінісін мәлімет көрінісіне ауыстыра аламыз.

Бұрын былай еді:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Енді былай өзгертеміз:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Мұндағы `animal:` — `AnimalDetailView` параметрінің атауы.

Соңындағы `animal` — `.sheet(item:)` арқылы берілген қазіргі жануар.

Яғни қазір басылған жануарды көрсету үшін `AnimalDetailView` ішіне береміз.

Толық құрылым:

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
                        .clipShape(Circle())
                    
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

Пайдаланушы жануарды басқанда:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` мәнінен нақты жануарға өзгереді. `Sheet` `selectedAnimal` мәні бар екенін байқап, көріністі ашады.

`Sheet` `selectedAnimal` ішіндегі жануарды `AnimalDetailView` көрінісіне береді, ал `AnimalDetailView` жануар мәліметін көрсетеді.

Осылайша жануарлар тізімін басқанда, сәйкес жануар мәліметі ашылатын функцияны жасадық.

## Sheet-тің екі жазу тәсілінің айырмашылығы

Енді біз `.sheet(item:)` арқылы жануар мәліметі көрінісін көрсетуді аяқтадық.

Мұнда `Sheet` қолданудың екі кең таралған тәсілін қысқаша қорытындылайық.

### Бірінші түрі — Boolean мәнін байланыстыру

```swift
@State private var showSheet = false

Button("Sheet көрсету") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet көрінісі")
}
```

Бұл жазу тәсілі баптаулар беті, түсіндірме беті, ескерту беті сияқты тұрақты мазмұнды ашуға ыңғайлы.

`showSheet` — Boolean мәні, оның тек `true` және `false` деген екі күйі бар.

`showSheet` `true` болса, `Sheet` көрсетіледі.

`showSheet` `false` болса, `Sheet` көрсетілмейді.

### Екінші түрі — optional мәнді байланыстыру

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Бұл жазу тәсілі таңдалған дерекке қарай әртүрлі мазмұнды ашуға ыңғайлы.

Бұл сабақта біз әртүрлі жануарды басқанда әртүрлі жануар мәліметін көрсетуіміз керек, сондықтан `.sheet(item:)` қолдану ыңғайлырақ.

## Толық код

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Жануар атауы
    let name: String
    
    // Жануар суреті
    let imageName: String
    
    // Жануар белгішесі
    let avatarEmoji: String
    
    // Таралу аймағы
    let distributionArea: String
    
    // Мекендеу ортасы
    let habitat: String
    
    // Жануар сипаттамасы
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Дельфин
        Animal(
            name: "Дельфин",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Дүние жүзіндегі жылы және қоңыржай мұхиттар.",
            habitat: "Мұхиттар, жағалау сулары және кейбір ірі өзендер.",
            animalDescription: "Дельфиндер — ақылды теңіз сүтқоректілері. Олар топпен өмір сүреді, дыбыстар арқылы байланысады және ойнақы мінезімен танымал."
        ),
        // Керік
        Animal(
            name: "Керік",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Африкадағы саванналар мен ашық орманды алқаптар.",
            habitat: "Шалғындар, саванналар және ашық ормандар.",
            animalDescription: "Керіктер — құрлықтағы ең биік жануарлар. Олардың мойны мен аяқтары ұзын, әдетте биік ағаштардың жапырақтарымен қоректенеді."
        ),
        // Арыстан
        Animal(
            name: "Арыстан",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Негізінен Сахараның оңтүстігіндегі Африкада кездеседі, ал батыс Үндістанда шағын популяциясы бар.",
            habitat: "Шалғындар, саванналар және ашық орманды алқаптар.",
            animalDescription: "Арыстандар — күшті ірі мысықтар. Олар көбіне прайд деп аталатын топтарда өмір сүреді және жиі жануарлар әлемінің патшасы ретінде белгілі."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Қытайдың орталық бөлігіндегі тау ормандары.",
            habitat: "Салқын әрі ылғалды тау аймақтарындағы бамбук ормандары.",
            animalDescription: "Пандалар — қара-ақ жүнімен белгілі аюлар. Олар негізінен бамбукпен қоректенеді және әлемдегі ең оңай танылатын жануарлардың бірі."
        ),
        // Ақ аю
        Animal(
            name: "Ақ аю",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Солтүстік полюс маңындағы Арктика аймақтары.",
            habitat: "Теңіз мұзы, жағалау аймақтары және суық Арктика ортасы.",
            animalDescription: "Ақ аюлар — суық ортаға бейімделген ірі аюлар. Олар жақсы жүзеді және итбалық аулау үшін негізінен теңіз мұзына сүйенеді."
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
                            .clipShape(Circle())

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
                    Text("**Таралу аймағы** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Мекендеу ортасы** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Жануар сипаттамасы** ：\(animal.animalDescription)")
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

## Қорытынды

Бұл сабақта қарапайым жануарлар энциклопедиясы беті жасалды.

Алдымен жануар ақпаратын сақтау үшін `Animal` құрылымын қолдандық, кейін бес жануарды массивке сақтадық, содан соң жануарлар тізімін көрсету үшін `ForEach` қолдандық.

Пайдаланушы белгілі бір жануарды басқанда, сол жануарды `selectedAnimal` ішінде сақтаймыз:

```swift
selectedAnimal = animal
```

`selectedAnimal` мәнге ие болғанда, `.sheet(item:)` мәлімет көрінісін ашады және таңдалған жануарды `AnimalDetailView` ішіне береді.

Бұл сабақтағы ең маңызды нәрсе интерфейс стилі емес, мына дерек беру бағытын түсіну:

```swift
Жануарды басу → selectedAnimal жануарды сақтайды → Sheet ашылады → AnimalDetailView мәліметті көрсетеді
```

Осы бағытты түсінгеннен кейін, болашақта тауар мәліметі, курс мәліметі, мақала мәліметі, контакт мәліметі сияқты ұқсас функцияларды жасай аласыз.
