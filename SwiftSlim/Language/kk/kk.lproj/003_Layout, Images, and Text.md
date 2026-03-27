# Орналасу, суреттер және мәтін

Алдыңғы сабақта біз ContentView кодын үйрендік:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Бұл сабақта біз SwiftUI-дің әдепкі орналасу механизмін, сондай-ақ суреттер мен мәтінді қолдану тәсілдерін үйренеміз. Алдыңғы сабақтың негізінде view құрылымы мен оның экранда көрсетілу жолын тереңірек түсінеміз, ал бұл білім қарапайым интерфейс құруға көмектеседі.

## SwiftUI-дің әдепкі орналасу механизмі

ContentView view-ін preview арқылы қарағанда, белгіше мен мәтіннің жоғарыдан басталмай, экранның ортасына орналасқанын байқаймыз.

![Swift](../../RESOURCE/003_view.png)

Әдепкі жағдайда Stack контейнерінің туралануы `.center` болады, сондықтан ішкі view-лер әдетте ортаға тураланған түрде көрінеді.

### Alignment туралау тәсілі

Ортаға туралау — туралаудың тек бір түрі ғана. Егер біз солға немесе оңға туралағымыз келсе, view-дің туралануын `alignment` арқылы басқаруымыз керек.

```swift
alignment
```

SwiftUI-де туралау әдетте екі жағдайда кездеседі:

**1. Stack контейнерінің туралау параметрі**

Мысалы, ContentView ішіндегі белгіше мен мәтінді солға туралау:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack` ішіндегі `alignment` көлденең бағыттағы туралауды басқарады.

Туралау түрлері:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` — көлденең реттеу, сондықтан оның `alignment` параметрі тік бағыттағы туралауды басқарады:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` — қабаттап реттеу, мұнда `alignment` көлденең немесе тік бағыттағы туралауды басқара алады:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Егер `alignment` анық көрсетілмесе, `VStack`, `HStack` және `ZStack` әдепкі бойынша `.center` қолданады.

**2. frame ішіндегі alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Егер `frame` беретін өлшем view-дің өз өлшемінен үлкен болса, `alignment` view-дің сол `frame` ішіндегі орнын анықтайды. `frame` туралы толығырақ кейінірек қарастырамыз, әзірге осы жерден қысқаша танысып алу жеткілікті.

### Spacer және кеңістікті бөлу механизмі

`alignment` view-лерді көлденең не тік бағытта реттеуге көмектеседі. Бірақ егер біз мәтін мен суретті екі шетке орналастырғымыз келсе, бір ғана туралау түрі жеткіліксіз болады.

Мысалы, [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) сайтының жоғарғы view-ін жасайық делік: сол жақта NHK сайтының белгішесі, ал оң жақта мәзір белгішесі орналасады.

![Swift](../../RESOURCE/003_alignment3.png)

Егер тек `alignment` қолдансақ, NHK сайтының белгішесі де, мәзір белгішесі де бір жаққа ғана жиналып қалады. Екі белгішені сол және оң жаққа бөлу мүмкін болмайды, сондықтан бос кеңістікті бөлу үшін `Spacer` қажет.

`Spacer` — layout үшін қолданылатын серпімді view, ол қалған бос орынды автоматты түрде толтырады.

Қолданылуы:

```swift
Spacer()
```

Мысалы:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Image пен Text арасына `Spacer` қосқанда, ол қалған бос орынды толтырып, Image пен Text-ті сәйкесінше жоғары және төмен жаққа итереді.

![Swift](../../RESOURCE/003_view1.png)

Егер бірнеше `Spacer` болса:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Қалған кеңістік барлық `Spacer` арасында тең бөлінеді.

![Swift](../../RESOURCE/003_spacer.png)

## Image көрсету және өлшемін басқару

`Image` view-і негізінен сурет көрсету үшін пайдаланылады. Өткен сабақтағы SF Symbols белгішелері де `Image` қолдануының бір түрі ғана.

Қолданылуы:

```swift
Image("imageName")
```

Қос тырнақша ішіне сурет атауы жазылады, файл кеңейтімін көрсету қажет емес.

### Сурет көрсету

Алдымен бізге бір сурет дайындау керек.

![Swift](../../RESOURCE/003_img.jpg)

Xcode-та Assets ресурс қалтасын таңдап, суретті Assets ішіне сүйреп апарыңыз.

![Swift](../../RESOURCE/003_img1.png)

ContentView ішінде `Image` арқылы суретті көрсету:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Ескерту: SwiftUI-дегі `Image` GIF анимациясын ойната алмайды, тек статикалық кадрды ғана көрсете алады.

### Сурет өлшемін басқару

SwiftUI-де `Image` әдепкі бойынша суреттің бастапқы өлшемімен көрсетіледі. Егер өлшемін өзгерту керек болса, алдымен суретті масштабталатын ету үшін `resizable` қолдану қажет, содан кейін layout өлшемін анықтау үшін `frame` пайдаланылады.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier-і

`resizable` modifier-і суреттің layout ішінде масштабталуына мүмкіндік береді, яғни ол бастапқы өлшемде қатып қалмайды.

```swift
.resizable()
```

Тек `resizable()` қосылғанда ғана `frame` суреттің экрандағы нақты өлшемін өзгерте алады.

Егер `resizable` көрсетілмесе:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

Бұл жағдайда `frame` тек layout үшін орын береді, ал суреттің өз өлшемі өзгермейді.

### frame modifier-і

`frame(width:height)` view-дің ені мен биіктігін орнату үшін пайдаланылады.

Негізгі қолданылуы:

```swift
.frame(width: 10,height: 10)
```

Мысалы, суретті ені 300, биіктігі 100 болатын тікбұрышқа келтіру:


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Ені мен биіктікті бөлек те орнатуға болады:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` тіркесімі суреттің интерфейстегі өлшемін икемді басқаруға мүмкіндік береді және оның масштабталуын сақтайды.

### Масштаб қатынасы: scaledToFit және scaledToFill

Егер `frame` арқылы берілген ен мен биіктік қатынасы суреттің бастапқы қатынасына сәйкес келмесе, сурет созылып, пішіні бұзылуы мүмкін.

Егер суреттің пропорциясын сақтай отырып, оны қолжетімді layout кеңістігіне бейімдегіміз келсе, `scaledToFit` немесе `scaledToFill` қолдануға болады.

**scaledToFit**

`scaledToFit` суреттің бастапқы ен/биіктік қатынасын сақтайды да, суретті қолжетімді кеңістікке толық сыйғызатындай етіп масштабтайды, бірақ оны қимайды:

```swift
.scaledToFit()
```

немесе

```swift
.aspectRatio(contentMode: .fit)
```

Бұл тәсіл суретті толық көрсету керек және оны деформацияламау қажет болған жағдайда ыңғайлы.

Егер барлық суретке бірдей ен мен биіктік берілсе, созылу қаупі туады.

Мысалы:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Масштаб қатынасы орнатылмаса, сурет бастапқы пропорциясымен көрсетілмейді.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` орнатқанда сурет бастапқы пропорциясын сақтайды.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` да сурет пропорциясын сақтайды, бірақ барлық қолжетімді кеңістікті толтырады. Егер пропорция сәйкес келмесе, артық бөлігі қиылады:

```swift
.scaledToFill()
```

немесе

```swift
.aspectRatio(contentMode: .fill)
```

Бұл тәсіл суретті бүкіл аймақты жабу үшін қолданғанда, мысалы, фондық сурет немесе banner ретінде пайдаланғанда қолайлы. Яғни сурет фон ретінде қолданылатын жағдайларға ыңғайлы.

**Екеуінің айырмашылығы**

![Swift](../../RESOURCE/003_img6.png)

## Мәтін

SwiftUI-де `Text` мәтінді көрсету үшін қолданылады.

Негізгі қолданылуы:

```swift
Text("FangJunyu")
```

Өткен сабақта біз `Text`-ті көрдік, ал бұл жолы оның қаріп өлшемі мен жуандығын басқаруды үйренеміз, сонда мәтін view ішінде әсерлірек көрінеді.

### Қаріп өлшемі

Мәтін өлшемін `font` modifier-і арқылы басқаруға болады:

```swift
.font(.title)
```

Мысалы:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Кең қолданылатын қаріп өлшемдері (үлкеннен кішіге қарай):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Қаріп жуандығы

Егер мәтінді қалың қылғымыз келсе, `fontWeight` modifier-ін пайдаланамыз:

```swift
.fontWeight(.bold)
```

Мысалы:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Жиі қолданылатын қаріп жуандығы (жұқадан қалыңға қарай):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` қаріп өлшемін басқарады, `fontWeight` қаріп жуандығын басқарады. Екеуін бірге қолдану мәтіннің көрінісін байытады.

## Қорытынды және тәжірибе

Осы уақытқа дейін біз SwiftUI-дің әдепкі layout-ын, `Spacer`, `Image` және `Text` сияқты негізгі білімдерді үйрендік. Бұлар қарапайым view-лерді жасауға жеткілікті.

Мысалы: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google интерфейсі өте таза көрінеді, онда сурет те, мәтін де бар. Біз оны SwiftUI тұрғысынан талдап көре аламыз:

1. Жалпы интерфейс үш бөліктен тұрады: Google белгішесі, іздеу жолағы және ескертпе мәтін. Бұларды `VStack` арқылы тік реттеуге болады.
2. Google белгішесі — бір сурет, оны `Image` арқылы көрсетуге болады.
3. Іздеу жолағында енгізу өрісі мен белгіше бар. Егер енгізу өрісін елемесек, іздеу белгішесін `Image` арқылы көрсетуге болады.
4. Ескертпе мәтін `Text` арқылы көрсетіледі, ал мәтіннің көлденең реттелуі үшін `HStack`, қаріп түсін өзгерту үшін `foregroundStyle` қолдануға болады.

Осы білімдерді қайталап тәжірибе жасау арқылы қарапайым view-лерді құрып, `Image` пен `Text` view-лерін және олардың modifier-лерін жақсырақ түсінуге болады.
