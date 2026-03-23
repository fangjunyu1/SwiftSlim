# Създаване на страница с лично CV

В този урок ще създадем прост изглед за лично CV и ще научим следните неща:

- `cornerRadius`
- `spacing`
- `ScrollView`

По време на изграждането ще преговорим подредбите, `Text` и `Image`, а също така ще реализираме контрол на разстоянията и ефект на превъртане на съдържанието.

## Лично CV

Целевият резултат:

![Swift](../../RESOURCE/004_img.png)

**Първо опитай самостоятелно да го направиш, след което продължи с обяснението по-долу.**

### Създаване на проект

Създай нов iOS проект или продължи да използваш проекта, който вече имаш.

Стандартният код на `ContentView` изглежда така:

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

Сега изчисти този код и започни да пишеш собственото си съдържание:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Обща структура

В реалната разработка обикновено първо планираме общата структура.

Нашата страница съдържа:

1. заглавие
2. лична информация
3. лично представяне

Добавяме `VStack` като най-външен контейнер:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` гарантира, че изгледите ще бъдат подредени вертикално, и ни позволява да контролираме тяхната подредба и разстояния.

### Заглавие

Първо създаваме `Text`, който да показва заглавието.

Тук аз използвам английското си име като заглавие:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Заглавията обикновено са по-големи и по-дебели, затова тук използваме модификаторите `font` и `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Подредба

В SwiftUI стандартното подравняване е `center`, така че в момента заглавието се показва в средата на `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Ние искаме заглавието да се показва в горната част на изгледа, така че можем да използваме `Spacer`, за да коригираме подредбата:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` заема останалото пространство и избутва `Text` към горната част на контейнера.

![Swift](../../RESOURCE/004_img4.png)

### Празно пространство

Ако смяташ, че текстът е твърде близо до горния край, можеш да използваш `padding` или `Spacer`.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Това задава горно отстояние `20` за `VStack`.

**2. `Spacer`**

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

Можеш също да използваш `Spacer` и да зададеш височина чрез `frame`, за да получиш празно пространство с конкретен размер.

Резултат:

![Swift](../../RESOURCE/004_img5.png)

### Изображение

Подготви своя профилна снимка и я постави в папката с ресурси `Assets`.

![Swift](../../RESOURCE/004_img6.png)

След това използвай `Image` в `ContentView`, за да я покажеш:

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

Тъй като оригиналният размер на изображението е сравнително голям, трябва да използваме `frame`, за да контролираме показвания размер.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Тук ще забележим един проблем:

Ако съотношението между ширина и височина на `frame` не съвпада с оригиналното съотношение на изображението, то ще се деформира.

Например:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

За да избегнем деформацията, трябва да използваме `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Ролята на `scaledToFit` е следната:

В рамките на зададения `frame` той мащабира изображението според оригиналните му пропорции и показва цялото съдържание.

Той не разтяга насила изображението, за да запълни целия `frame`, а запазва съотношението между ширина и височина и го мащабира пропорционално, докато едната страна точно достигне границата.

Това означава:

- ако ширината на `frame` е по-малка, изображението ще се мащабира според ширината
- ако височината на `frame` е по-малка, изображението ще се мащабира според височината
- изображението винаги ще запазва оригиналните си пропорции и няма да се деформира

Обикновено е достатъчно да зададеш размера само в една посока. Например:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Така системата автоматично ще изчисли подходящата височина според ширината `140`, като запази пропорциите на изображението.

Ако искаш да поддържаш фиксирано визуално съотношение или да избегнеш притискане в по-сложна подредба, можеш едновременно да ограничиш и ширината, и височината.

### Заоблени ъгли

Ако искаш изображението да се показва със заоблени ъгли, можеш да използваш модификатора `cornerRadius`:

```swift
.cornerRadius(10)
```

Например:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Добавяме `cornerRadius(20)` след модификаторите на `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` означава, че границата на изгледа ще бъде изрязана и ще се приложи радиус на заобляне `20`.

След добавяне на заоблените ъгли четирите ъгъла на изображението ще станат извити, което прави визуалния ефект по-мек и по-модерен.

Този стил на дизайн е много често срещан в съвременните интерфейси. Например иконите на приложенията в iOS също използват форма на заоблен правоъгълник, макар че системните икони използват непрекъсната суперелипса, а не просто обикновено заобляне.

### Лична информация

Сега нека реализираме областта за лична информация вляво от изображението. По структурата на интерфейса се вижда, че личната информация и изображението са подредени хоризонтално, затова трябва да използваме `HStack`.

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

Самото съдържание на личната информация е подредено вертикално.

![Swift](../../RESOURCE/004_img11.png)

Затова използваме `HStack` отвън, `VStack` за информацията и `Text` за текстовото съдържание.

Основната структура е:

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

**Удебеляване на имената на полетата**

За да различаваме имената на полетата от техните стойности, можем да приложим `fontWeight` към имената на полетата:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Ляво подравняване на текста**

`VStack` по подразбиране е центриран. Ако искаме целият текст да бъде подравнен вляво, трябва изрично да зададем подравняване:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` означава подравняване към лявата страна в езикова среда отляво надясно.

![Swift](../../RESOURCE/004_img14.png)

### Разстояние

Ако искаме да има фиксирано разстояние между личната информация и изображението, един от начините, които научихме по-рано, е да използваме `Spacer`:

```swift
Spacer()
    .frame(width: 10)
```

Можем също да използваме параметъра `spacing` на `HStack`:

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

`spacing: 30` означава, че разстоянието между двата дъщерни изгледа ще бъде `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**Какво е `spacing`?**

В `VStack`, `HStack` и `ZStack`, `spacing` контролира разстоянието между дъщерните изгледи.

Например:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Разстоянието между дъщерните изгледи в `VStack` ще бъде `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Трябва да се отбележи, че `spacing` действа само върху „директните дъщерни изгледи“ и не влияе върху подредбата във вложените контейнери.

**Контрол на вътрешното разстояние в списъка**

Ако искаме да увеличим разстоянието между отделните полета, най-директният начин е да зададем `spacing` на `VStack`:

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

Така разстоянието между всички дъщерни изгледи ще стане `10 pt`.

Но ако погледнем интерфейса, ще видим един проблем:

Между групите полета има разстояние, но също така се появява същото разстояние и между името на полето и стойността му.

Това е така, защото `spacing` действа върху всички директни дъщерни изгледи на текущия контейнер.

В тази структура всеки `Text` е директен дъщерен изглед на външния `VStack`, затова разстоянието е еднакво навсякъде.

Ако искаме между групите полета да има разстояние, а между името на полето и стойността му да остане стандартното компактно разстояние, можем да третираме „име на поле + стойност на поле“ като едно логическо цяло и да го обгърнем с отделен `VStack`:

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

Тогава структурата става такава, че външният `VStack` има разстояние между отделните групи, а вътрешните `VStack` остават с компактното стандартно разстояние, така че между името на полето и стойността му няма да се появи допълнителна празнина.

![Swift](../../RESOURCE/004_img18.png)

### Лично представяне

След това реализираме секцията за лично представяне.

От структурата на интерфейса се вижда, че съдържанието на представянето се състои от няколко реда текст, подредени вертикално.

![Swift](../../RESOURCE/004_img19.png)

Затова можем да използваме `VStack` заедно с `Text`:

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

**Добавяне на разстояние**

В момента личната информация и секцията за лично представяне са твърде близо една до друга и стилът не изглежда достатъчно добре.

![Swift](../../RESOURCE/004_img20.png)

Тъй като и двете се намират в един и същи външен контейнер, можем да контролираме общото разстояние чрез външния контейнер:

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

Резултат:

![Swift](../../RESOURCE/004_img21.png)

**Разстояние в списъка**

Използвай `spacing`, за да зададеш разстоянието между редовете в личното представяне:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Завършване на личното CV

Сега основната рамка на нашето лично CV е завършена.

![Swift](../../RESOURCE/004_img.png)

### ScrollView

В момента структурата на страницата използва `VStack`. Когато текстовете в представянето са малко, няма проблем. Но ако ги увеличим до 20, 30 или дори повече, височината на съдържанието ще надхвърли екрана.

Например:

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

Тогава ще се появят две явления:

- съдържанието в долната част ще бъде отрязано
- страницата няма да може да се превърта

Това не е проблем на `VStack`. `VStack` е просто контейнер за подредба и не предоставя автоматично възможност за превъртане.

**Какво е `ScrollView`**

`ScrollView` е контейнер с възможност за превъртане, подходящ за голямо количество съдържание, което надхвърля размера на екрана. Например вертикални или хоризонтални списъци.

Основна структура:

```swift
ScrollView {
    ...
}
```

Ако искаме да реализираме превъртане, трябва да обгърнем цялото съдържание на страницата с `ScrollView`:

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

Така цялата страница се превръща в област с превъртане и когато съдържанието надвиши височината на екрана, можем естествено да го превъртаме.

`ScrollView` по подразбиране показва индикатор за превъртане. Ако искаме да го скрием, можем да зададем:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Пълен код

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
