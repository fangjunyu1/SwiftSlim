# Фото галереясы

Бұл сабақта біз фото галерея беті жасаймыз.

![view](../../../Resource/032_view13.png)

Бұл мысалда біз `extension`, `self` және instance туралы білімді қайталап, SwiftUI-де жиі қолданылатын `Shape` фигураларын үйренеміз.

Осы білім арқылы қарапайым суреттерді шеңбер, бұрышы дөңгелектелген тіктөртбұрыш, капсула, эллипс сияқты әртүрлі стильдерге қиып, фотоларға жиек әсерін қоса аламыз.

Бұл сабақта бірнеше жаңа білім нүктесі қолданылады: `Shape`, `clipShape`, `strokeBorder` және `overlay`.

Олардың ішінде `clipShape` көріністің пішінін қию үшін, `strokeBorder` фигура жиегін салу үшін, ал `overlay` ағымдағы көріністің үстіне жаңа көріністі қабаттап қою үшін қолданылады.

## Сурет ресурстары

Бастамас бұрын бірнеше сурет дайындауымыз керек.

Өз фотоларыңызды қолдануға болады немесе осы сабақта берілген үлгі суреттерді қолдануға болады.

Бұл сабақтағы фото үлгілері [Pixabay](https://pixabay.com/) сайтынан алынған:

[Пейзаж](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Түлкі](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Ғимарат](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Гүл](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Аққу](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Суреттерді жүктеп алғаннан кейін оларды `Assets` ресурс қалтасына қосып, ретімен `1`, `2`, `3`, `4`, `5` деп атаңыз.

![assets](../../../Resource/032_view17.png)

Осылайша SwiftUI-де суреттерді `Image("1")`, `Image("2")` түрінде көрсете аламыз.

## Фотоларды көрсету

Алдымен `ContentView` ішінде 5 фото көрсетеміз:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Көрсету нәтижесі:

![view](../../../Resource/032_view.png)

Бұл кодта біз `ScrollView` арқылы фото тізімін айналдырып көрсетуге мүмкіндік береміз және бірнеше суретті жоғарыдан төмен қарай орналастыру үшін `VStack` қолданамыз.

Әр сурет `.resizable()`, `.scaledToFit()` және `.frame(width: 300)` арқылы көрсету әсерін орнатады. Осылайша сурет масштабталып, пропорциясын толық сақтап көрсетіледі және ені шектеледі.

`VStack` үстіндегі `.padding(.vertical, 100)` жоғарғы және төменгі аралықты ұлғайту үшін қолданылады, сондықтан бірінші және соңғы фото экран жиегіне тым жақын тұрмайды.

Соңғы `.ignoresSafeArea()` айналдыру көрінісі қауіпсіз аймақты елемейтінін білдіреді. Фотолар айналған кезде экранның жоғарғы және төменгі бөлігіне дейін созылып, беттің көрсетілуі толықырақ болады.

Бірақ қазір 5 суреттің бәрі бірдей modifier-лерді қолданады:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Қайталанатын кодты көргенде, оны `extension` арқылы реттеуді қарастыруға болады.

## extension арқылы сурет стилін реттеу

Біз `Image` үшін фото галереяға арналған арнайы әдіс кеңейте аламыз:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Мұнда біз `Image` типіне `photoGalleryStyle` әдісін кеңейттік.

Бұл әдістің ішінде жоғарыда қайталанған `.resizable()`, `.scaledToFit()` және `.frame(width: 300)` бар. Басқаша айтқанда, ол суретті масштабтау, пропорциямен көрсету және енін орнату кодтарын бірге жинақтайды.

Бұл кеңейтуді қолданғаннан кейін бастапқы сурет коды:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

мынадай түрде қысқарады:

```swift
Image("1")
    .photoGalleryStyle()
```

Осылайша әр сурет бірдей фото галерея стилін қолдану үшін тек `.photoGalleryStyle()` шақырады. Код ықшам болады және кейін бірдей өзгерту енгізу де ыңғайлырақ.

## self түсінігі

Кеңейту әдісінде біз `self` жаздық:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Мұндағы `self` осы әдісті шақырған ағымдағы сурет instance-ын білдіреді.

Мысалы:

```swift
Image("1")
    .photoGalleryStyle()
```

Бұл кодта `photoGalleryStyle()` әдісін `Image("1")` шақырады, сондықтан әдіс ішіндегі `self` дәл осы `Image("1")` суретін білдіреді.

Қарапайым түсінік: әдісті кім шақырса, `self` соны білдіреді.

Назар аудару керек нәрсе: SwiftUI modifier-лері үнемі жаңа view нәтижесін қайтарады. Сондықтан `photoGalleryStyle()` бастапқы `Image`-дің өзін жай ғана қайтармайды, ол modifier қолданылған көріністі қайтарады.

## Фото пішіндері

Енді фотолар қалыпты көрсетіледі. Бірақ бұл фотолар әдепкіде тіктөртбұрыш, сондықтан көрінісі біршама қарапайым.

Егер фотоға тек дөңгелектелген бұрыш бергіңіз келсе, `.cornerRadius()` тікелей қолдануға болады:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Көрсету нәтижесі:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` суретке `20 pt` бұрыш радиусын қосатынын білдіреді. Қарапайым дөңгелек бұрышты сурет үшін мұндай жазу жеткілікті.

Бірақ `.cornerRadius()` тек дөңгелек бұрыш әсерін өңдейді, ол қарапайым дөңгелек бұрышты суреттерге қолайлы. Егер фотоларды көбірек әртүрлі пішінге айналдырғымыз келсе, тек осы modifier жеткіліксіз.

Осы кезде SwiftUI-дегі `Shape` қолдану керек. `Shape` әртүрлі фигураларды білдіре алады, ал `clipShape` бірге қолданылғанда суретті сәйкес пішінге қия алады.

## Shape түсінігі

SwiftUI-де `Shape` фигураны білдіреді. Ол `View` сияқты SwiftUI-де өте жиі қолданылатын типтердің бірі.

Жиі кездесетін `Shape` түрлеріне шеңбер, тіктөртбұрыш, бұрышы дөңгелектелген тіктөртбұрыш, капсула және эллипс кіреді. Әртүрлі фигуралардың сыртқы түрін айқынырақ байқау үшін төмендегі мысалдарда әр фигураға бөлек түс пен өлшем берілген.

Бұл мысалдарда `.fill()` фигураны түспен толтыру үшін, ал `.frame()` фигураның көрсетілу өлшемін орнату үшін қолданылады. Түстер тек әртүрлі фигураларды ажырату үшін берілген, олар фигуралардың өзіне бекітілген тұрақты түс емес.

### Circle шеңбер

`Circle` шеңберді білдіреді. Ол avatar, дөңгелек батырма, дөңгелек сурет сияқты интерфейс әсерлерінде жиі қолданылады.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle тіктөртбұрыш

`Rectangle` тіктөртбұрышты білдіреді. Ол ең негізгі фигуралардың бірі және фон, бөлінген аймақ немесе қарапайым жиек жасау үшін де қолданыла алады.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle дөңгелектелген тіктөртбұрыш

`RoundedRectangle` бұрышы дөңгелектелген тіктөртбұрышты білдіреді. `cornerRadius` бұрыш радиусын орнату үшін қолданылады.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule капсула

`Capsule` капсула пішінін білдіреді. Оның екі ұшы доға тәрізді, ол капсула батырмалары, tag фоны сияқты интерфейс әсерлерінде жиі қолданылады.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse эллипс

`Ellipse` эллипсті білдіреді. Ол `Circle`-ге ұқсас, бірақ ені мен биіктігі бірдей болмаған кезде эллипс болып көрсетіледі.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Осы мысалдар арқылы `Shape` өзі тікелей фигура ретінде көрсетіле алатынын көруге болады. Келесіде осы `Shape` түрлерін `clipShape` бірге қолданып, фотоларды әртүрлі пішінде көрсету үшін қиямыз.

## clipShape арқылы фотоларды қию

Енді `clipShape` арқылы фотоларды әртүрлі пішінге қия аламыз.

Мысалы, бірінші фотосуретті шеңбер етіп қию:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Бұл код мынаны білдіреді: алдымен суретті көрсетеді, содан кейін `Circle()` арқылы оны шеңбер етіп қияды.

![view](../../../Resource/032_view2.png)

`clipShape` негізгі жазылуы:

```swift
.clipShape(shape)
```

View-ден кейін `.clipShape(...)` қосып, жақшаның ішіне қию қажет фигураны жазамыз.

Мысалы:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Енді 5 фотоны бөлек-бөлек әртүрлі пішінге қиямыз:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Көрсету нәтижесі:

![view](../../../Resource/032_view8.png)

Олардың ішінде `Rectangle()` арқылы қиғаннан кейінгі әсер кәдімгі тіктөртбұрыш фотоға жақын, сондықтан визуалды өзгеріс айқын емес. Ол негізінен басқа пішіндермен салыстыру үшін қолданылады.

Енді фотолар жай ғана кәдімгі тіктөртбұрыш емес, олардың әртүрлі пішіні бар.

## Фото жиегін қосу

Егер шеңбер фотосына жиек қосқымыз келсе, `border` қолдануды ойлауымыз мүмкін:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Бірақ мұндайда әдетте шеңбер жиек емес, тіктөртбұрыш жиек алынады.

![view](../../../Resource/032_view9.png)

Себебі `border` жиекті `clipShape` арқылы қиылған пішін бойынша емес, view-дің тіктөртбұрыш аймағы бойынша қосады.

Сондықтан шеңбер жиек қажет болса, `border`-ді тікелей қолдануға болмайды.

## strokeBorder арқылы фигура жиегін салу

SwiftUI-де `strokeBorder` осы жиі қолданылатын `Shape` түрлеріне ішкі жиек сала алады.

Мысалы, шеңбер жиек салу:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Бұл код мынаны білдіреді: `Circle` үшін қоңыр түсті жиек салады, жиектің қалыңдығы `10 pt`.

![view](../../../Resource/032_view12.png)

Мұнда назар аудару керек: `strokeBorder` фотоға тікелей жиек қоспайды, ол `Circle()` фигурасына жиек салады.

Яғни бұл код тек жеке тұрған шеңбер жиегін жасайды, оның фотомен әлі байланысы жоқ.

Егер осы шеңбер жиегін фотаның үстінде көрсеткіміз келсе, `overlay` қолдануды жалғастырып, жиекті фотоның үстіне қабаттап қоюымыз керек.

## overlay арқылы жиекті қабаттау

`overlay` — ағымдағы view үстіне жаңа view қабаттай алатын view modifier.

Оның негізгі құрылымын былай түсінуге болады:

```swift
Ағымдағы view
    .overlay {
        Қабатталатын view
    }
```

Бұл мысалда ағымдағы view — шеңбер етіп қиылған фото:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Үстіне қабаттағымыз келетін жаңа view — шеңбер жиек:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Сондықтан фото мен жиекті біріктіруге болады:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Мұндағы `overlay` ағымдағы view үстіне жаңа view қабаттауды білдіреді.

`overlay` ішінде жиек ағымдағы фотоның көрсетілу аймағына сәйкес қабатталады, сондықтан бөлек `frame` орнатудың қажеті жоқ. Жиек пішіні қию пішінімен бірдей болса, жиек фотоға дәл келіп тұрады.

![view](../../../Resource/032_view10.png)

Соңғы нәтиже: шеңбер фотоның үстіне шеңбер жиек жабылады.

`ZStack`-пен салыстырғанда, `overlay` мұндай «ағымдағы view-ге безендіру қосу» сценарийіне көбірек сәйкес келеді. Фото негізгі объект, ал жиек тек қосымша әсер, сондықтан `overlay` қолдану анықырақ.

## Фото галереясын аяқтау

Енді әр фотоға сәйкес пішін мен жиек қосамыз:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Көрсету нәтижесі:

![view](../../../Resource/032_view13.png)

Осылайша негізгі фото галерея беті аяқталды.

Бұл бетте біз `ScrollView` арқылы айналдырып көрсетуді іске асырдық, `Image` арқылы фотоларды көрсеттік, `clipShape` арқылы фото пішіндерін қиып, `overlay` және `strokeBorder` арқылы жиек қостық.

## Толық код

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Қорытынды

Бұл сабақта біз фото галерея беті жасадық.

![view](../../../Resource/032_view13.png)

Бұл мысалда алдымен `Image` арқылы фотоларды көрсеттік, кейін `extension` арқылы `Image` үшін `photoGalleryStyle` әдісін кеңейтіп, қайталанатын сурет стилі кодын реттедік.

Содан кейін SwiftUI-дегі жиі қолданылатын `Shape` түрлерін үйрендік, мысалы `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` және `Ellipse`. Бұл фигуралар тек тікелей көрсетіліп қана қоймай, `clipShape` бірге қолданылып view-ді қиюға да жарайды.

Мысалы:

```swift
.clipShape(Circle())
```

view-ді шеңбер етіп қиюды білдіреді.

Соңында біз `overlay` және `strokeBorder` арқылы фотоларға сәйкес пішіндегі жиек қостық. Назар аудару керек: `border` әдетте жиекті view-дің тіктөртбұрыш аймағы бойынша салады. Егер жиек шеңбер, капсула немесе эллипс пішінімен жүруі керек болса, бірдей `Shape` қабаттау қолайлырақ.

Бұл сабақ арқылы біз фото галерея әсерін ғана аяқтап қоймай, интерфейсте `Shape`, `clipShape`, `strokeBorder` және `overlay` жиі қалай бірге қолданылатынын да түсіндік.

## Сабақтан кейінгі жаттығулар

### 1、Фото галерея фонын қосу

Фото галерея бетіне толық экранды фон суретін қосыңыз.

Талап: фон суреті бүкіл экранды толтырып, қауіпсіз аймақты елемеуі керек.

### 2、Градиент жиек

Қазіргі бір түсті жиектерді сызықтық градиент жиектерге өзгертіңіз.

Байырақ жиек әсерін жасау үшін `LinearGradient` қолданып көруге болады.

### 3、Шынайы фото жақтауын имитациялау

Интернеттен нақты фото жақтауларының кейбір стильдерін іздеп, фотоларды шынайы жақтауға ұқсас ету үшін `overlay` арқылы сурет жақтауын қабаттап көріңіз.

Жаттығу көрсету нәтижесі:

![button](../../../Resource/032_view15.jpeg)

### 4、Дөңгелек бұрышты батырма жиегін іске асыру

Нақты әзірлеуде батырмалар жиі дөңгелек бұрышты тіктөртбұрыш жиегін қолданады.

Дөңгелек бұрышты батырма жасап көріңіз және `RoundedRectangle` пен `strokeBorder` арқылы батырмаға дөңгелек бұрышты жиек қосыңыз.

Жаттығу көрсету нәтижесі:

![button](../../../Resource/032_view14.png)

### Ойлану сұрағы

Егер бір түсті жиек те, градиент жиек те қолданғыңыз келмей, жиек белгілі бір өрнек әсерін көрсетсін десеңіз, оны қалай іске асыру керек?

`overlay`, `mask` немесе `ImagePaint` сияқты байланысты қолдану тәсілдерін түсіну үшін материалдар іздеп көруге болады.

Жаттығу көрсету нәтижесі:

![button](../../../Resource/032_view16.png)
