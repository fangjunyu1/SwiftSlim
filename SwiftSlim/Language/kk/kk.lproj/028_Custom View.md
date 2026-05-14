# Пайдаланушы View

Бұл сабақта біз SwiftUI-дегі өте маңызды жазу тәсілін үйренеміз: **пайдаланушы View**.

Пайдаланушы View қайталанатын View кодының бір бөлігін қаптап, оны қайта-қайта қолдануға болатын View-ға айналдыра алады.

Нақты App әзірлеу барысында біз мұндай жағдайды жиі кездестіреміз: көптеген интерфейстердің құрылымы бірдей, тек көрсетілетін мазмұны әртүрлі болады.

Мысалы, форум веб-сайтындағы жазбалар тізімінде әр жазбада тақырып, сурет, лайк саны сияқты ақпарат болуы мүмкін.

![Reddit](../../../Resource/028_view1.png)

Сауда веб-сайтындағы өнімдер тізімінде әр өнімде сурет, атау және баға сияқты ақпарат болуы мүмкін.

![Amazon](../../../Resource/028_view2.png)

Бұл мазмұндардың құрылымы ұқсас; айырмашылығы тек көрсетілетін деректердің әртүрлі болуында.

Егер әр элементтің кодын қолмен жазсақ, код өте ұзақ болып кетеді және кейін өзгерту де ыңғайсыз болады.

Сондықтан біз бірдей құрылымды пайдаланушы View ретінде қаптап, әртүрлі мазмұнды параметрлер ретінде ішіне бере аламыз.

Осылайша, бір View әртүрлі мазмұнды көрсете алады.

## Қажеттілік сценарийі

Мысалы, қазір біз параметрлер тізімін жасағымыз келеді.

Көрсетілу нәтижесі:

![view](../../../Resource/028_view.png)

Бұл параметрлер тізімінде үш түрлі параметр элементі бар: `Параметрлер`, `Қалта`, `Музыка`.

Олардың белгішелері, түстері және тақырыптары әртүрлі болғанымен, жалпы құрылымы бірдей:

- Сол жақ белгіше
- Белгішенің фон түсі
- Ортадағы тақырып
- Оң жақ көрсеткі

Егер пайдаланушы View қолданбасақ, былай жазуымыз мүмкін:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Параметрлер")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Қалта")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Музыка")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Бұл код қалыпты түрде көрсетіледі, бірақ мәселе де өте айқын: үш параметр элементінің коды дерлік толықтай бірдей.

Айырмашылығы тек белгіше, түс және тақырыпта:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Параметрлер")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Қалта")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Музыка")
```

Яғни, әр параметр элементінің құрылымы тұрақты, тек белгіше, түс және тақырып қана өзгеше.

Мұндай жағдай пайдаланушы View қолдануға өте қолайлы.

### Көлеңке shadow

Мұнда жаңа modifier `.shadow(radius:)` қолданылды:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View-ға көлеңке қоса алады.

`radius` көлеңкенің бұлыңғырлану радиусын білдіреді. Мән неғұрлым үлкен болса, әдетте көлеңкенің таралу аймағы соғұрлым кең болады және ол жұмсағырақ көрінеді.

Мұнда ол `1` болып орнатылған, яғни өте жеңіл көлеңке әсері ғана қосылады.

## Параметр элементі View-ын қаптау

Келесіде әр параметр элементін жаңа View ретінде қаптаймыз.

`SettingItemView` жасауға болады:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Бұл View ішінде біз үш property анықтадық:

```swift
let icon: String
let color: Color
let title: String
```

Олардың мағынасы:

- `icon` белгіше атауын білдіреді
- `color` белгішенің фон түсін білдіреді
- `title` параметр элементінің тақырыбын білдіреді

Бұл үш мазмұн әртүрлі параметр элементтерінде әртүрлі болғандықтан, оларды сырттан беруге болатын параметрлерге айналдырамыз.

## Пайдаланушы View қолдану

`SettingItemView` болғаннан кейін, үлкен `HStack` кодын қайта-қайта жазудың қажеті жоқ.

Енді оны былай қолдануға болады:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Параметрлер")
```

Бұл код жолы бір параметр элементі View-ын жасап, үш параметр береді дегенді білдіреді:

```swift
icon: "gear"
color: Color.blue
title: "Параметрлер"
```

Берілгеннен кейін, `SettingItemView` ішіндегі properties сәйкес мәндерді алады:

- `icon` мәні — `gear`
- `color` мәні — `Color.blue`
- `title` мәні — `"Параметрлер"`

Сондықтан View ішіндегі `Image(systemName: icon)` тісті дөңгелек белгішесін көрсетеді, `.background(color)` көк фонды қолданады, ал `Text(title)` `Параметрлер` мәтінін көрсетеді.

Толық код:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Параметрлер")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Қалта")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Музыка")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Көрсетілу нәтижесі:

![view](../../../Resource/028_view.png)

Қаптағаннан кейін көрсетілу нәтижесі бұрынғыдай екенін, бірақ код айқынырақ болғанын көруге болады.

Бұрын әр параметр элементі үшін толық `HStack` бөлігін жазу керек еді, ал қазір бір ғана код жолы жеткілікті:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Параметрлер")
```

Пайдаланушы View-дың рөлі осында: **қайталанатын View құрылымын қаптап, тек әртүрлі мазмұнды параметр ретінде беру.**

## Параметрлерді неге беруге болады

Енді пайдаланушы View неге параметр қабылдай алатынын қысқаша түсінейік.

SwiftUI-де View негізінен structure болып табылады.

Мысалы:

```swift
struct ContentView: View {
    var body: some View {
        Text("Сәлем, әлем!")
    }
}
```

Мұндағы `ContentView` — structure.

Біз былай жазғанда:

```swift
ContentView()
```

шын мәнінде `ContentView` View-ын жасап жатырмыз.

Соңындағы `()` оның initialization method-ын шақыруды білдіреді; мұны осы View-ды жасау деп те түсінуге болады.

Бұл `ContentView` ішінде сырттан берілетін properties жоқ болғандықтан, тікелей былай жаза аламыз:

```swift
ContentView()
```

Бірақ View ішінде мәні берілмеген property болса, View жасағанда сәйкес мәнді беру керек.

Мысалы:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("аты: \(name)")
    }
}
```

Мұнда `name` — property, және оның default value-ы жоқ.

Сондықтан `ContentView` жасағанда, `name` үшін нақты мән беру міндетті:

```swift
ContentView(name: "Fang Junyu")
```

Осылайша View ішінде бұл мәнді қолдануға болады:

```swift
Text("аты: \(name)")
```

Бұл `SettingItemView` жасағанда параметр берудің себебі де осы:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Параметрлер")
```

Өйткені `SettingItemView` ішінде default value-ы жоқ үш property бар:

```swift
let icon: String
let color: Color
let title: String
```

Сондықтан бұл View-ды жасағанда, оларды ішке беру керек. Берілген параметрлерді Swift View ішіндегі properties-ке мән тағайындау үшін қолданады.

## Initialization method

Келесіде initialization method-ты тереңірек түсінейік.

### Default initialization method

Біз қарапайым View анықтағанда:

```swift
struct ContentView: View {
    var body: some View {
        Text("Сәлем, әлем!")
    }
}
```

Бұл кодта біз initialization method-ты қолмен жазған жоқпыз.

Бірақ бұл View-ды қолданғанда, былай жаза аламыз:

```swift
ContentView()
```

Мұндағы `()` шын мәнінде `ContentView` жасауды білдіреді; оны initialization method-ын шақыру деп те түсінуге болады.

### initialization method көрінбесе де, оны неге шақыруға болады?

Өйткені Swift compiler біз үшін initialization method-ты автоматты түрде жасайды.

Назар аудару керек: **бұл initialization method автоматты түрде жасалады, және біз әдетте оны кодта тікелей көрмейміз.**

Яғни, біз `struct` ішінде қолмен былай жазбасақ та:

```swift
init() {

}
```

Swift compiler артқы жақта біз үшін шамамен осындай initialization method жасайды:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Сәлем, әлем!")
    }
}
```

Сондықтан біз тікелей былай жаза аламыз:

```swift
ContentView()
```

Осы себепті нақты кодта initialization method-ты әдетте қолмен жазудың қажеті жоқ.

Тек бір нәрсені түсіну керек: **SwiftUI View жасалғанда, сол View-дың initialization method-ы шақырылады. Біз initialization method-ты қолмен жазбасақ та, Swift оны автоматты түрде жасай алады.**

### Параметрі бар initialization method

Егер View ішінде default value-ы жоқ property болса, мысалы:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("аты: \(name)")
    }
}
```

Swift compiler property негізінде параметрі бар initialization method-ты автоматты түрде жасайды.

Мұны қарапайым түрде былай түсінуге болады:

```swift
init(name: String) {
    self.name = name
}
```

Мұнда:

```swift
init(name: String)
```

`ContentView` жасағанда `String` түріндегі `name` параметрін беру керек дегенді білдіреді.

Біз былай жазғанда:

```swift
ContentView(name: "Fang Junyu")
```

мағынасы: `"Fang Junyu"` мәнін initialization method-қа параметр ретінде беру.

Содан кейін initialization method ішінде мына код орындалады:

```swift
self.name = name
```

Бұл код жолының мағынасы: сырттан берілген `name` мәнін ағымдағы View-дың өз `name` property-іне тағайындау.

Қарапайым түрде былай түсінуге болады:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("аты: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Осылайша View ішінде берілген мәнді қолдануға болады.

Параметрі бар View-дың initialization процесі осы: **View ішіндегі property-де default value болмаса, View жасағанда сәйкес параметрді беру керек, сонда initialization method property-ге мән тағайындауды аяқтайды.**

## property-де default value бар жағдай

Егер property-де default value бұрыннан болса, View жасағанда параметр бермесе де болады.

Мысалы:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("аты: \(name)")
    }
}
```

Мұнда `name`-де default value бұрыннан бар:

```swift
"Fang Junyu"
```

Сондықтан `ContentView` жасағанда тікелей былай жазуға болады:

```swift
ContentView()
```

Бұл кезде `name` default value қолданады, ал интерфейс былай көрсетеді:

```swift
аты: Fang Junyu
```

Әрине, View жасағанда жаңа мәнді де беруге болады:

```swift
ContentView(name: "Sam")
```

Бұл кезде View default value-ды емес, сырттан берілген `"Sam"` мәнін қолданады, ал интерфейс былай көрсетеді:

```swift
аты: Sam
```

Түсінуді жеңілдету үшін, Swift compiler автоматты түрде жасайтын initialization method-ты қарапайым түрде былай көруге болады:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Мұндағы `name: String = "Fang Junyu"` дегені: View жасағанда `name` берілмесе, default value `"Fang Junyu"` қолданылады; View жасағанда жаңа `name` берілсе, берілген мән қолданылады.

Яғни: **сырттан параметр берілмесе, property-дің default value-ы қолданылады; сырттан параметр берілсе, берілген мән қолданылады.**

## SettingItemView-ға қайта оралу

Енді SettingItemView-ға қайта қарайық:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Бұл View-дың құрылымы тұрақты.

Тұрақты бөліктерге мыналар кіреді:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Әртүрлі бөліктерге мыналар кіреді:

```swift
icon
color
title
```

Сондықтан біз әртүрлі мазмұнды properties етіп жасап, View жасағанда параметр ретінде береміз.

Әртүрлі параметр элементтерін жасағанда, тек әртүрлі параметрлерді беру керек:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Параметрлер")
SettingItemView(icon: "folder", color: Color.brown, title: "Қалта")
SettingItemView(icon: "music.note", color: Color.purple, title: "Музыка")
```

Осылайша бір `SettingItemView` үш түрлі параметр элементін көрсете алады.

Бұл пайдаланушы View қолданудың ең кең таралған тәсілі.

## Қорытынды

Бұл сабақта біз пайдаланушы View-ды үйрендік.

Пайдаланушы View-дың негізгі рөлі: **қайталанатын View кодын қаптап, оны қайта қолдануға мүмкіндік беру.**

Бұл мысалда үш параметр элементінің құрылымы бірдей, тек белгіше, түс және тақырып әртүрлі.

Сондықтан біз `SettingItemView` жасадық:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Содан кейін бұл View-ды қолданғанда әртүрлі параметрлер береміз:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Параметрлер")
```

Мұндағы параметрлер `SettingItemView` ішіне кіреді.

Осы тәсіл арқылы біз аз кодпен құрылымы бірдей, бірақ мазмұны әртүрлі Views жасай аламыз.

Бұл SwiftUI әзірлеуінде өте жиі қолданылатын жазу тәсілі.
