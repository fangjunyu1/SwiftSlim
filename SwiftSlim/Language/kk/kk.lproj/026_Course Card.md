# Курс картасы

Бұл сабақ — кезеңдік қайталау сабағы. Біз “курс картасын” жасаймыз.

Осы жаттығу арқылы бұрын үйренген `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` сияқты мазмұндарды қайталап, бірнеше шағын көріністі толық бір көрініс модуліне біріктіруді үйренеміз.

Курс картасының нәтижесі:

![view](../../../Resource/026_view.png)

Бұл курс картасы негізінен бірнеше бөліктен тұрады:

- Курс деңгейі: `Бастаушы`
- Курс мазмұны: `20+ сабақ`
- Курс тақырыбы: `SwiftUI бастаушыға арналған оқулық`
- Курс сипаттамасы
- Батырма: `Оқуды бастау`
- Курс фоны: Swift белгішесі және индиго түсті фон

Бұл көріністі `ContentView` ішінде аяқтай аламыз.

## Жоғарғы аймақ

Алдымен, курс картасының жоғарғы аймағын жасаймыз.

![view](../../../Resource/026_view1.png)

Жоғарғы аймақтың сол жағында курс деңгейі, ал оң жағында курс мазмұны көрсетіледі.

Бұл екі мазмұн көлденең орналасатындықтан, `HStack` қолдануға болады.

```swift
var topView: some View {
    HStack {
        Text("Бастаушы")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ сабақ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Мұнда біз жоғарғы аймақты есептелетін қасиет ретінде бөліп алдық:

```swift
var topView: some View
```

Мұның артықшылығы — `body` кодын анығырақ етеді.

Жоғарғы аймақта негізінен мына мазмұндар қолданылады:

- `HStack`: екі мәтінді көлденең орналастырады.
- `Text`: мәтін мазмұнын көрсетеді.
- `Spacer()`: сол жақтағы мәтінді солға, оң жақтағы мәтінді оңға итереді.
- `.font(.footnote)`: кішірек мәтін стилін орнатады.
- `.fontWeight(.bold)`: мәтінді қалың етеді.
- `.foregroundStyle(Color.white)`: алдыңғы түсін ақ түске орнатады.
- `.padding(.vertical, 10)`: жоғарғы және төменгі ішкі аралықты орнатады.
- `.padding(.horizontal, 16)`: сол және оң жақ ішкі аралықты орнатады.
- `.background(Color.white.opacity(0.15))`: жартылай мөлдір ақ фон орнатады.
- `.cornerRadius(20)`: бұрыш радиусын орнатады.

Мұнда `Бастаушы` мәтіні екі бағыттағы `.padding()` қолданады:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Бұл мәтінге тігінен де, көлденеңінен де бос орын береді, сондықтан ол белгіге көбірек ұқсайды.

`Color.white.opacity(0.15)` мөлдірлігі `15%` болатын ақ түсті білдіреді, яғни өте ашық ақ түс.

### Карта фонын қосу

Бұған дейін біз `topView` жасадық, бірақ көріністі жай ғана жасау оны автоматты түрде көрсетпейді.

SwiftUI ішінде экранда нақты көрсетілетін мазмұн `body` ішінде жазылуы керек.

Сондықтан алдымен `topView` мәнін `body` ішіне орналастырып, оны көрсете аламыз:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Осы кезде жоғарғы аймақтың көрсетілгенін көресіз:

![view](../../../Resource/026_view2.png)

Бірақ `topView` ішіндегі мәтін ақ түсті, ал әдепкі фон да ашық болғандықтан, ашық режимде оны анық көру қиын болуы мүмкін.

Сондықтан сыртқы қабатқа `VStack` қосып, бүкіл аймаққа ішкі аралық, фон түсі және бұрыш радиусын орната аламыз:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/026_view3.png)

Мұндағы `VStack` қазір тек бір `topView` қамтиды, сондықтан ол міндетті емес сияқты көрінуі мүмкін.

Бірақ кейін біз курс тақырыбын, курс сипаттамасын және батырма аймағын қосуды жалғастырамыз. Бұлардың бәрі тігінен орналасатын мазмұндар, сондықтан мұнда алдын ала `VStack` қолдану кейін көріністерді біріктіруді жеңілдетеді.

Мұнда екі `.padding()` бар, олардың қызметі әртүрлі.

Бірінші `.padding(20)` `.background()` алдында жазылған:

```swift
.padding(20)
.background(Color.indigo)
```

Ол картаның ішкі аралығын басқарады, яғни мазмұн мен фон шетінің арасындағы қашықтықты анықтайды.

Екінші `.padding(30)` `.background()` кейін жазылған:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Ол картаның сыртқы аралығын басқарады, яғни бүкіл карта мен экран шетінің арасындағы қашықтықты анықтайды.

![view](../../../Resource/026_view4.png)

Сондықтан екеуі де `.padding()` болғанымен, әртүрлі орынға жазылса, әсері де әртүрлі болады.

## Мазмұн аймағы

Енді курс картасының мазмұн аймағын жасаймыз.

Көрсетілу нәтижесі:

![view](../../../Resource/026_view5.png)

Мазмұн аймағында курс тақырыбы және курс сипаттамасы бар. Олар тігінен орналасады, сондықтан `VStack` қолданамыз.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI бастаушыға арналған оқулық")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("SwiftUI-ды нөлден бастап жүйелі түрде үйреніп, Apple-дың декларативті UI әзірлеу тәсілін меңгеріңіз. Түсінікті түсіндірулер мен практикалық мысалдар арқылы орналасу, өзара әрекет және күй басқаруын біртіндеп меңгеріп, әдемі әрі пайдалы қолданба интерфейстерін жасай аласыз.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/026_view6.png)

Бұл `VStack` ішінде екі параметр қолданылады:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` `VStack` ішіндегі көріністерді бастау жиегіне туралауды білдіреді.

`spacing: 10` `VStack` ішіндегі көріністердің арасында `10 pt` аралық сақталатынын білдіреді.

Сондықтан курс тақырыбы мен курс сипаттамасы сол жақтан бастап орналасады және араларында белгілі бір қашықтық сақталады.

Курс сипаттамасы салыстырмалы түрде ұзын. Егер ол толық көрсетілсе, карта өте биік болып кетеді, сондықтан мұнда көрсетілетін жол санын шектеу үшін `.lineLimit()` қолданылады:

```swift
.lineLimit(3)
```

Бұл ең көбі `3` жол көрсетілетінін білдіреді. Мазмұн жол шегінен асып кетсе, артық бөлігі қысқартылады.

### Көріністі солға туралау

Мұнда тағы бір нәрсеге назар аудару керек.

`VStack(alignment: .leading)` тек `VStack` ішіндегі көріністердің туралануын басқара алады. Ол `VStack` өзі сыртқы контейнер ішінде қай жерде орналасатынын тікелей басқармайды.

Мысалы, курс сипаттамасы салыстырмалы түрде қысқа болса:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI бастаушыға арналған оқулық")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Тек кейбір мазмұн.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/026_view7.png)

Курс тақырыбы мен курс сипаттамасы `VStack` ішінде солға тураланғанымен, бүкіл `VStack` картаның ең сол жақ шетіне жабыспағанын көруге болады.

Себебі мазмұн қысқа болғанда, `VStack` ені де салыстырмалы түрде тар болады. Сыртқы контейнер орналасуды есептегенде, осы тарлау `VStack` мәнін ортаға қоюы мүмкін.

Мұны былай түсінуге болады: `VStack(alignment: .leading)` ішкі солға туралауға жауап береді.
Бірақ ол бүкіл мазмұн аймағын ең сол жаққа итеруге жауап бермейді.

Егер бүкіл мазмұн аймағын шынымен солға туралағымыз келсе, оны тағы бір `HStack` ішіне орап, `Spacer()` қосуға болады:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI бастаушыға арналған оқулық")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Тек кейбір мазмұн.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/026_view8.png)

Мұндағы `HStack` — көлденең орналасу.

`Spacer()` оң жақтағы қалған кеңістікті алады, осылайша сол жақтағы `VStack` мәнін ең сол жаққа итереді.

Сондықтан `HStack + Spacer()` бүкіл мазмұн аймағының орнын басқару үшін қолданыла алады.

Нақты курс картасында курс сипаттамасы салыстырмалы түрде ұзын және әдетте көбірек енді алады, сондықтан бұл мәселе айқын байқалмауы мүмкін. Бірақ бұл айырмашылықты түсіну маңызды, өйткені кейін қысқа мәтін орналасуларын жасағанда мұндай жағдай жиі кездеседі.

### Ішкі көріністер арасындағы қашықтықты басқару

Бұған дейін біз `VStack` ішінде `spacing: 10` жаздық:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` ішкі көріністер арасындағы қашықтықты басқару үшін қолданылады.

Егер `spacing` орнатылмаса, `VStack` әдепкі аралыққа ие болады, бірақ әдепкі аралық біз қалаған нәтижеге сәйкес келмеуі мүмкін.

Мұнда курс тақырыбы мен курс сипаттамасы бір-біріне тым жақын болса, орналасу тығыз көрінеді, сондықтан біз мынаны қолданамыз:

```swift
spacing: 10
```

Бұл олардың арасында аздап бос орын қалдырады.

Көрсетілу нәтижесі:

![view](../../../Resource/026_view9.png)

Сол сияқты, жоғарғы аймақ пен мазмұн аймағы да тігінен орналасады, сондықтан олардың арасындағы қашықтықты басқару үшін де `spacing` қолдануға болады.

Енді `topView` және `contentView` мәндерін `body` ішіне орналастырамыз:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/026_view10.png)

Мұнда `VStack(spacing: 20)` `topView` пен `contentView` арасындағы қашықтықты басқарады.

Яғни:

```swift
VStack(alignment: .leading, spacing: 10)
```

Курс тақырыбы мен курс сипаттамасы арасындағы қашықтықты басқарады.

```swift
VStack(spacing: 20)
```

Жоғарғы аймақ пен мазмұн аймағы арасындағы қашықтықты басқарады.

Екеуі де `spacing`, бірақ олар әртүрлі `VStack` контейнерлеріне әсер етеді, сондықтан ықпал ететін ауқымы да әртүрлі.

Осылайша, мазмұн аймағының көрінісі аяқталды.

## Батырма аймағы

Енді төменгі батырма аймағын жасаймыз.

Көрсетілу нәтижесі:

![view](../../../Resource/026_view11.png)

Батырма аймағы негізінен ойнату белгішесі мен бір мәтіннен тұрады.

Ойнату белгішесін көрсету үшін `Image`, ал батырма мәтінін көрсету үшін `Text` қолдана аламыз.

Мұнда алдымен батырманың сыртқы көрінісін жасаймыз:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("батырма басылды")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Оқуды бастау")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/026_view12.png)

Мұнда екі `HStack` қолданылады:

Ішкі `HStack` белгіше мен мәтінді көлденең орналастыру үшін қолданылады:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Оқуды бастау")
}
```

Сыртқы `HStack` `Spacer()` бірге батырма көрінісін солға туралау үшін қолданылады:

```swift
HStack {
    ...
    Spacer()
}
```

Батырма басылғанда, консоль `батырма басылды` деп шығарады.

## Негізгі карта аяқталды

Енді жоғарғы аймақты, мазмұн аймағын және батырма аймағын біріктіреміз:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/026_view13.png)

Осы жерге дейін негізгі курс картасы аяқталды.

## Swift белгішесі бар фон

Соңында, картаға жартылай мөлдір Swift белгішесі бар фон қосамыз.

![view](../../../Resource/026_view.png)

Бұған дейін біз фон түсі ретінде `Color.indigo` қолдандық. Шын мәнінде, `.background()` тек түс қана емес, толық бір көріністі де қоса алады.

Сондықтан алдымен арнайы фон көрінісін жасай аламыз:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Бұл фон көрінісінде біз `VStack`, `HStack` және `Spacer()` қолданып, Swift белгішесін төменгі оң жақ бұрышқа итереміз.

Swift белгішесі тек сәндік фон ретінде қолданылатындықтан, мұнда жартылай мөлдір ақ түс қолданылды:

```swift
Color.white.opacity(0.15)
```

Осылайша белгіше тым айқын болмайды және алдындағы мәтін мазмұнына әсер етпейді.

Келесіде `backgroundView` мәнін картаға қосамыз:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Қорытынды нәтиже:

![view](../../../Resource/026_view14.png)

Мұнда екі `.background()` қатарынан қолданылды:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Бірінші `.background()` Swift белгішесі бар фонды қосу үшін қолданылады.
Екінші `.background()` индиго түсті фонды қосу үшін қолданылады.

Осылайша Swift белгішесі индиго түсті фонның үстінде көрсетіледі және карта фонының бір бөлігі ретінде көрінеді.

Осы жерден `.background()` тек түстерді ғана емес, жеке көріністерді де қоса алатынын көруге болады. Бірнеше `.background()` модификаторын біріктіріп, байырақ фон әсерлерін жасауға болады.

Осылайша толық курс картасы аяқталды.

## Қорытынды

Бұл сабақта біз курс картасы арқылы SwiftUI ішіндегі жиі қолданылатын негізгі орналасу тәсілдерін қайталадық.

Біз мәтінді көрсету үшін `Text`, жүйелік белгішені көрсету үшін `Image`, ал көріністердің орналасуын басқару үшін `VStack`, `HStack` және `Spacer()` қолдандық.

Біз `.lineLimit()` үйрендік. Ол мәтін көрсететін ең көп жол санын шектей алады. Мазмұн шектен асқанда, артық бөлігі қысқартылады.

Сонымен қатар `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` сияқты жиі қолданылатын модификаторларды да қайталадық.

Бұл сабақты аяқтағаннан кейін, бірнеше шағын көріністі толық бір карта модуліне біріктіре аламыз.

Бұл SwiftUI әзірлеуіндегі өте жиі кездесетін ойлау тәсілі: алдымен шағын көріністерге бөлу, содан кейін оларды толық интерфейске біріктіру.

## Толық код

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Бастаушы")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ сабақ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI бастаушыға арналған оқулық")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("SwiftUI-ды нөлден бастап жүйелі түрде үйреніп, Apple-дың декларативті UI әзірлеу тәсілін меңгеріңіз. Түсінікті түсіндірулер мен практикалық мысалдар арқылы орналасу, өзара әрекет және күй басқаруын біртіндеп меңгеріп, әдемі әрі пайдалы қолданба интерфейстерін жасай аласыз.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("батырма басылды")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Оқуды бастау")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
