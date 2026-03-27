# Жеке түйіндеме бетін құрастыру

Бұл сабақта біз қарапайым жеке түйіндеме view-ін жасаймыз және келесі білімдерді үйренеміз:

- cornerRadius
- spacing
- ScrollView

Құрастыру барысында біз layout, Text және Image сияқты білімдерді қайталаймыз, сондай-ақ арақашықтықты басқару мен мазмұнды айналдыру әсерін іске асырамыз.

## Жеке түйіндеме

Мақсатты нәтиже:

![Swift](../../RESOURCE/004_img.png)

**Алдымен өз бетіңізше жасап көріңіз, содан кейін ғана төмендегі түсіндірмені оқуды жалғастырыңыз.**

### Жоба құру

Жаңа iOS жобасын жасаңыз немесе алдыңғы жобаңызды жалғастырыңыз.

Әдепкі ContentView коды:

```swift
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

Енді осы кодты тазалап, өз мазмұныңызды жаза бастаңыз:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Жалпы құрылым

Нақты әзірлеуде біз әдетте алдымен жалпы құрылымды жобалаймыз.

Біздің бетте мыналар болады:

1. Тақырып
2. Жеке ақпарат
3. Жеке таныстыру

Ең сыртқы қабатқа `VStack` қосамыз:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` view-лердің тік ретпен орналасуын қамтамасыз етеді және олардың орналасуы мен арақашықтығын басқаруға мүмкіндік береді.

### Тақырып

Алдымен тақырыпты көрсету үшін `Text` жасаймыз.

Мұнда мен тақырып ретінде өзімнің ағылшынша атымды қолданамын:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Тақырып әдетте үлкен әрі жуан болады, сондықтан мұнда `font` және `fontWeight` modifier-лерін қолданамыз:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Беттеу

SwiftUI-дің әдепкі туралануы `center`, сондықтан тақырып қазір ContentView-дің ортасында көрсетіліп тұр.

![Swift](../../RESOURCE/004_img3.png)

Біз тақырыпты view-дің жоғарғы жағына шығаруымыз керек. Оны `Spacer` арқылы реттей аламыз:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` қалған кеңістікті алып, `Text`-ті контейнердің жоғарғы жағына итереді.

![Swift](../../RESOURCE/004_img4.png)

### Бос кеңістік

Егер мәтін жоғарғы жаққа тым жақын көрінсе, `padding` немесе `Spacer` қолдануға болады.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Бұл `VStack` үшін жоғарғы шегіністі 20 етіп орнатады.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Сонымен қатар `Spacer` қолданып, `frame` биіктігін орнату арқылы белгілі бір мөлшердегі бос орын алуға болады.

Нәтиже:

![Swift](../../RESOURCE/004_img5.png)

### Сурет

Өзіңіздің портрет суретіңізді дайындап, оны Assets ресурс қалтасына орналастырыңыз.

![Swift](../../RESOURCE/004_img6.png)

ContentView ішінде суретті `Image` арқылы көрсетіңіз:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Суреттің бастапқы өлшемі үлкен болғандықтан, көрсету өлшемін `frame` арқылы басқару керек.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Осы кезде бір мәселені байқаймыз:

Егер `frame` ені мен биіктігінің қатынасы суреттің бастапқы қатынасына сәйкес келмесе, сурет деформацияланады.

Мысалы:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Суреттің бұзылып кетпеуі үшін `scaledToFit` қолдану керек:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` қызметі:

Берілген `frame` аясында суретті бастапқы пропорциясымен масштабтап, оның мазмұнын толық көрсету.

Ол суретті бүкіл `frame`-ді толтыру үшін күшпен созбайды, керісінше ен мен биіктік қатынасын сақтап, бір жағы шекараға дәл келгенше пропорционалды түрде үлкейтеді не кішірейтеді.

Бұл мынаны білдіреді:

- Егер `frame` ені кішірек болса, сурет енге сүйеніп масштабталады.
- Егер `frame` биіктігі кішірек болса, сурет биіктікке сүйеніп масштабталады.
- Сурет әрқашан бастапқы пропорциясын сақтайды, деформация болмайды.

Көбіне бір бағыттағы өлшемді ғана орнатуға болады. Мысалы:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Бұл кезде жүйе ені 140 болғанда, суреттің пропорциясын сақтай отырып, лайықты биіктікті автоматты түрде есептейді.

Егер көрнекі қатынасты бекіту немесе күрделі layout ішінде сығылып кетуден сақтау керек болса, ен мен биіктікті бірге шектеуге болады.

### Дөңгелек бұрыш

Егер суретті дөңгелек бұрышпен көрсеткіңіз келсе, `cornerRadius` modifier-ін қолданыңыз:

```swift
.cornerRadius(10)
```

Мысалы:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image modifier-лерінің соңына `cornerRadius(20)` қосамыз.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` view шекарасын қиып, 20 радиусты дөңгелек бұрыш қолданатынын білдіреді.

Дөңгелек бұрыш қосылғаннан кейін, суреттің төрт бұрышы жұмсақ доғаға айналады, соның нәтижесінде көрініс заманауи әрі жұмсақ болады.

Мұндай дизайн стилі қазіргі интерфейстерде өте жиі қолданылады. Мысалы, iOS қолданба белгішелері де дөңгелек төртбұрыш формасын пайдаланады (дегенмен жүйелік белгішелерде жай дөңгелек емес, үздіксіз қисықтықты суперэллипс қолданылады).

### Жеке ақпарат

Енді суреттің сол жағындағы жеке ақпарат аймағын жасаймыз. Интерфейс құрылымынан көретініміздей, жеке ақпарат пен сурет көлденең орналасқан, сондықтан `HStack` пайдалану керек.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Жеке ақпарат мазмұны тік бағытта орналасады.

![Swift](../../RESOURCE/004_img11.png)

Сондықтан сыртқы қабатта `HStack`, жеке ақпарат үшін `VStack`, ал мәтін мазмұны үшін `Text` қолданамыз.

Негізгі құрылым:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Өріс тақырыптарын жуан ету**

Өріс атауы мен өріс мәнін ажырату үшін өріс атауына `fontWeight` қолдануға болады:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Мәтінді солға туралау**

`VStack` әдепкі бойынша ортаға тураланады. Егер барлық мәтінді солға туралау керек болса, туралау параметрін орнату қажет:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` сол жақ бойынша туралауды білдіреді (солдан оңға қарай оқылатын тіл ортасында).

![Swift](../../RESOURCE/004_img14.png)

### Арақашықтық

Егер жеке ақпарат пен сурет арасында бекітілген қашықтық қалдырғымыз келсе, бұған дейін `Spacer` арқылы бос орын жасауды үйрендік:

```swift
Spacer()
    .frame(width: 10)
```

Сонымен қатар `HStack`-тің `spacing` параметрін де қолдануға болады:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` екі ішкі view арасындағы қашықтық 30 pt болатынын білдіреді.

![Swift](../../RESOURCE/004_img15.png)

**spacing деген не?**

`VStack`, `HStack`, `ZStack` ішінде `spacing` ішкі view-лер арасындағы қашықтықты басқарады.

Мысалы:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Бұл кезде `VStack` ішіндегі ішкі view-лер арасындағы қашықтық 10pt болады.

![Swift](../../RESOURCE/004_img16.png)

Маңыздысы, `spacing` тек "тікелей ішкі view-лерге" ғана әсер етеді, ол ішкі контейнерлердің өз layout-ына әсер етпейді.

**Тізім ішіндегі арақашықтықты басқару**

Егер өрістердің арасында қашықтық қосқымыз келсе, ең тура тәсіл — `VStack`-ке `spacing` беру:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Осылайша барлық ішкі view арасындағы қашықтық 10 pt болады.

Бірақ интерфейсті қарасақ, бір мәселе шығады:

Өрістер тобының арасында да, өріс атауы мен өріс мәнінің арасында да бірдей қашықтық пайда болады.

Себебі `spacing` ағымдағы контейнердің барлық тікелей ішкі view-леріне бірдей әсер етеді.

Бұл құрылымда әрбір `Text` сыртқы `VStack`-тің тікелей ішкі view-і болып тұр, сондықтан арақашықтық бәріне бірдей қолданылады.

Егер өрістер топтарының арасында қашықтық болып, ал өріс атауы мен оның мәні әдепкі жақын аралықта қалсын десек, "өріс атауы + өріс мәні" жұбын бір логикалық блок ретінде қарастырып, сыртын `VStack`-пен орау керек:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Осы кезде құрылым мынадай болады: сыртқы `VStack` блоктарының арасында қашықтық бар, ал ішкі `VStack` ішінде әдепкі тығыз аралық сақталады. Сондықтан өріс атауы мен өріс мәні арасында артық бос орын пайда болмайды.

![Swift](../../RESOURCE/004_img18.png)

### Жеке таныстыру

Келесі қадамда жеке таныстыру аймағын жасаймыз.

Интерфейс құрылымынан қарайтын болсақ, таныстыру мазмұны бірнеше жол мәтіннен тұрады және тік бағытта орналасады.

![Swift](../../RESOURCE/004_img19.png)

Сондықтан `VStack` пен `Text` қолдануға болады:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Арақашықтықты үлкейту**

Қазір жеке ақпарат пен жеке таныстыру бөлімдері бір-біріне тым жақын, сондықтан көрінісі аса әдемі емес.

![Swift](../../RESOURCE/004_img20.png)

Өйткені олардың екеуі де бір сыртқы контейнерде орналасқан, жалпы арақашықтықты сол сыртқы контейнерден басқаруға болады:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Нәтиже:

![Swift](../../RESOURCE/004_img21.png)

**Тізім аралығы**

Жеке таныстыру мәтіндерінің арасындағы қашықтықты `spacing` арқылы орнатуға болады:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Жеке түйіндемені аяқтау

Енді біздің жеке түйіндемеміздің негізгі құрылымы дайын болды.

![Swift](../../RESOURCE/004_img.png)

### Айналдыру view-і

Қазір бет құрылымы `VStack` қолданып тұр. Егер таныстыру мәтіндері аз болса, мәселе жоқ. Бірақ оны 20, 30 немесе одан да көп жолға арттырсақ, мазмұн биіктігі экраннан асып кетеді.

Мысалы:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Мұндайда екі құбылыс пайда болады:

- Төменгі мазмұн қиылып қалады
- Бет айналмайды

Бұл `VStack`-тің қатесі емес. `VStack` тек layout контейнері, ол айналдыру мүмкіндігін автоматты түрде бермейді.

**ScrollView деген не**

`ScrollView` — айналдыруға болатын контейнер. Ол экран өлшемінен асып кететін көп мазмұнға қолайлы. Мысалы, тік немесе көлденең тізімдер үшін.

Негізгі құрылым:

```swift
ScrollView {
    ...
}
```

Егер айналдыру әсерін іске асырғымыз келсе, беттегі бүкіл мазмұнды `ScrollView` ішіне орау керек:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Осылайша, бүкіл бет айналдыруға болатын аймаққа айналады. Мазмұн экран биіктігінен асқанда, табиғи түрде айналдыруға болады.

`ScrollView` әдепкі бойынша scroll indicator көрсетеді. Егер оны жасыру керек болса, мынаны жазыңыз:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Толық код

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
