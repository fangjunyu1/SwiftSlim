# Стена от снимки

В този урок ще създадем страница със стена от снимки.

![view](../../../Resource/032_view13.png)

В този пример ще преговорим знанията за `extension`, `self` и инстанциите и ще научим често използваните графични фигури `Shape` в SwiftUI.

Чрез тези знания можем да изрязваме обикновени изображения в различни стилове, като кръг, заоблен правоъгълник, капсула, елипса и други, както и да добавяме рамка към снимките.

В този урок ще използваме няколко нови понятия: `Shape`, `clipShape`, `strokeBorder` и `overlay`.

Сред тях `clipShape` се използва за изрязване на формата на изгледа, `strokeBorder` се използва за рисуване на рамка на фигура, а `overlay` се използва за наслагване на нов изглед върху текущия изглед.

## Изображения

Преди да започнем, трябва да подготвим няколко изображения.

Можете да използвате свои собствени снимки, а можете да използвате и примерните изображения, предоставени в този урок.

Примерните снимки в този урок са от сайта [Pixabay](https://pixabay.com/):

[Пейзаж](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Лисица](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Сграда](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Цвете](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Лебед](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

След като изтеглите изображенията, добавете ги в папката с ресурси `Assets` и ги именувайте последователно като `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

Така ще можем да показваме изображенията в SwiftUI чрез `Image("1")`, `Image("2")` и т.н.

## Показване на снимки

Първо ще покажем 5 снимки в `ContentView`:

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

Ефект на показване:

![view](../../../Resource/032_view.png)

В този код използваме `ScrollView`, за да реализираме превъртащ се списък със снимки, и използваме `VStack`, за да подредим няколко изображения отгоре надолу.

Всяко изображение използва `.resizable()`, `.scaledToFit()` и `.frame(width: 300)`, за да се настрои ефектът на показване, така че изображението да може да се мащабира, да запази пропорциите си и да ограничи ширината си.

`.padding(.vertical, 100)` върху `VStack` се използва за добавяне на горно и долно отстояние, за да се избегне първата и последната снимка да са прекалено близо до краищата на екрана.

Последният `.ignoresSafeArea()` означава, че превъртащият се изглед игнорира безопасната зона, така че снимките да могат да се разширяват до горната и долната част на екрана при превъртане и страницата да се показва по-пълно.

Но сега всичките 5 изображения използват едни и същи модификатори:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Когато видим повтарящ се код, можем да помислим за използване на `extension`, за да го подредим.

## Използване на extension за организиране на стила на изображенията

Можем да разширим `Image` с метод, специално предназначен за стената от снимки:

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

Тук разширяваме типа `Image` с метод `photoGalleryStyle`.

Вътре в този метод са включени използваните по-рано повтарящи се `.resizable()`, `.scaledToFit()` и `.frame(width: 300)`. С други думи, той събира на едно място кода за мащабиране на изображението, показване с пропорции и настройване на ширината.

След използването на това разширение първоначалният код на изображението:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

може да бъде опростен до:

```swift
Image("1")
    .photoGalleryStyle()
```

Така всяко изображение трябва само да извика `.photoGalleryStyle()`, за да приложи същия стил на стената от снимки. Кодът става по-кратък и по-удобен за последваща обща промяна.

## Разбиране на self

В метода на разширението написахме `self`:

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

Тук `self` означава текущата инстанция на изображението, която извиква този метод.

Например:

```swift
Image("1")
    .photoGalleryStyle()
```

В този код `photoGalleryStyle()` се извиква от `Image("1")`, затова `self` вътре в метода представлява тази снимка `Image("1")`.

Можем да го разберем просто така: който извиква този метод, `self` представлява него.

Трябва да се отбележи, че модификаторите в SwiftUI постоянно връщат нов резултат от изглед. Затова `photoGalleryStyle()` връща модифициран изглед, а не просто първоначалния `Image` сам по себе си.

## Форма на снимките

Сега снимките вече могат да се показват нормално. Но тези снимки по подразбиране са правоъгълни и изглеждат сравнително обикновено.

Ако просто искаме снимката да има заоблени ъгли, можем директно да използваме `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Ефект на показване:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` означава добавяне на заобляне на ъглите от `20 pt` към изображението. За обикновена снимка със заоблени ъгли този начин на писане вече е достатъчен.

Но `.cornerRadius()` може да обработва само ефект на заоблени ъгли и е подходящ за създаване на обикновени изображения със заоблени ъгли. Ако искаме снимката да се превърне в повече различни форми, само този модификатор не е достатъчен.

Тогава трябва да използваме `Shape` в SwiftUI. `Shape` може да представлява различни фигури и в комбинация с `clipShape` може да изрязва изображението в съответната форма.

## Запознаване със Shape

В SwiftUI `Shape` означава фигура. Подобно на `View`, това също е много често използван тип в SwiftUI.

Често срещани `Shape` са кръг, правоъгълник, заоблен правоъгълник, капсула и елипса. За да наблюдаваме по-интуитивно външния вид на различните фигури, примерите по-долу задават различни цветове и размери на всяка фигура.

В тези примери `.fill()` се използва за запълване на фигурата с цвят, а `.frame()` се използва за задаване на размера на показване на фигурата. Цветът е само за разграничаване на различните фигури и не е фиксиран цвят на самата фигура.

### Circle кръг

`Circle` означава кръг. Той често се използва за аватари, кръгли бутони, кръгли изображения и други интерфейсни ефекти.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle правоъгълник

`Rectangle` означава правоъгълник. Това е една от най-основните фигури и може да се използва за създаване на фон, разделяне на области или обикновени рамки.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle заоблен правоъгълник

`RoundedRectangle` означава заоблен правоъгълник. `cornerRadius` се използва за задаване на големината на заоблянето.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule капсула

`Capsule` означава капсулообразна форма. Двата ѝ края са дъговидни и тя често се използва за капсулни бутони, фон на етикети и други интерфейсни ефекти.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse елипса

`Ellipse` означава елипса. Тя е подобна на `Circle`, но когато ширината и височината не са еднакви, се показва като елипса.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

От тези примери можем да видим, че самият `Shape` може директно да се показва като фигура. След това ще използваме тези `Shape` заедно с `clipShape`, за да изрязваме снимките и да ги показваме в различни форми.

## Използване на clipShape за изрязване на снимки

Сега можем да използваме `clipShape`, за да изрязваме снимките в различни форми.

Например, изрязваме първата снимка в кръг:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Този код означава: първо се показва изображение, след което се използва `Circle()`, за да се изреже в кръг.

![view](../../../Resource/032_view2.png)

Основният синтаксис на `clipShape` е:

```swift
.clipShape(фигура)
```

Добавяме `.clipShape(...)` след изгледа, а в скобите записваме фигурата, в която трябва да се изреже.

Например:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Сега ще изрежем 5-те снимки в различни форми:

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

Ефект на показване:

![view](../../../Resource/032_view8.png)

Сред тях ефектът след изрязване с `Rectangle()` е близък до обикновена правоъгълна снимка, затова визуалната промяна не е очевидна и основно служи за сравнение с другите форми.

Сега снимките вече не са само обикновени правоъгълници, а имат различни форми.

## Добавяне на рамка към снимка

Ако искаме да добавим рамка към кръгла снимка, може да ни хрумне да използваме `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Но така обикновено няма да получим кръгла рамка, а правоъгълна рамка.

![view](../../../Resource/032_view9.png)

Причината е, че `border` добавя рамка според правоъгълната област на изгледа, а не според формата след изрязване с `clipShape`.

Затова, ако искаме кръгла рамка, не можем директно да използваме `border`.

## Използване на strokeBorder за рисуване на рамка на фигура

В SwiftUI `strokeBorder` може да рисува вътрешна рамка за тези често срещани `Shape`.

Например, рисуваме кръгла рамка:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Този код означава: рисуваме кафява рамка за `Circle`, като ширината на рамката е `10 pt`.

![view](../../../Resource/032_view12.png)

Тук трябва да се отбележи, че `strokeBorder` не добавя рамка директно към снимката, а рисува рамка за фигурата `Circle()`.

С други думи, този код създава само самостоятелна кръгла рамка, която все още няма връзка със снимката.

Ако искаме тази кръгла рамка да се показва върху снимката, трябва да продължим да използваме `overlay`, за да наслагаме рамката върху снимката.

## Използване на overlay за наслагване на рамка

`overlay` е модификатор на изглед, който може да наслагва нов изглед върху текущия изглед.

Основната му структура може да се разбира така:

```swift
текущ изглед
    .overlay {
        наслагван изглед
    }
```

В този пример текущият изглед е снимка, която вече е изрязана в кръг:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Новият изглед, който искаме да наслагаме, е кръгла рамка:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Затова можем да комбинираме снимката и рамката:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Тук `overlay` означава наслагване на нов изглед върху текущия изглед.

В `overlay` рамката ще следва областта на показване на текущата снимка, затова не е нужно допълнително да задаваме `frame`. Докато формата на рамката и формата на изрязване са еднакви, рамката ще прилепва към снимката.

![view](../../../Resource/032_view10.png)

Крайният ефект е, че върху кръглата снимка е покрита кръгла рамка.

В сравнение със `ZStack`, `overlay` е по-подходящ за сценарии като „добавяне на декорация към текущия изглед“. Снимката е основният обект, а рамката е само допълнителен ефект, затова използването на `overlay` е по-ясно.

## Завършване на стената от снимки

Сега ще добавим съответната форма и рамка към всяка снимка:

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

Ефект на показване:

![view](../../../Resource/032_view13.png)

Така една базова страница със стена от снимки е завършена.

В тази страница използваме `ScrollView`, за да реализираме превъртащо показване, използваме `Image`, за да показваме снимки, използваме `clipShape`, за да изрязваме формата на снимките, и чрез `overlay` и `strokeBorder` добавяме рамки.

## Пълен код

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

## Обобщение

В този урок завършихме страница със стена от снимки.

![view](../../../Resource/032_view13.png)

В този пример първо използвахме `Image`, за да показваме снимки, а след това чрез `extension` разширихме `Image` с метод `photoGalleryStyle`, който служи за организиране на повтарящия се код за стил на изображенията.

След това научихме често срещаните `Shape` в SwiftUI, например `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` и `Ellipse`. Тези фигури могат не само да се показват директно, но и да се използват заедно с `clipShape` за изрязване на изгледи.

Например:

```swift
.clipShape(Circle())
```

означава изрязване на изгледа в кръг.

Накрая използвахме `overlay` и `strokeBorder`, за да добавим рамки със съответните форми към снимките. Трябва да се отбележи, че `border` обикновено рисува рамка според правоъгълната област на изгледа. Ако искаме рамката да следва кръг, капсула или елипса, по-подходящо е да използваме същия `Shape` за наслагване.

Чрез този урок не само завършихме ефекта на стена от снимки, но и разбрахме често срещаната комбинация от `Shape`, `clipShape`, `strokeBorder` и `overlay` в интерфейса.

## Упражнения след урока

### 1、Добавяне на фон към стената от снимки

Добавете изображение за фон на цял екран към страницата със стена от снимки.

Изискване: фоновото изображение трябва да може да запълва целия екран и да игнорира безопасната зона.

### 2、Градиентна рамка

Променете съществуващата едноцветна рамка в линейна градиентна рамка.

Можете да опитате да използвате `LinearGradient`, за да реализирате по-богат ефект на рамката.

### 3、Имитация на рамка за снимка

Потърсете в интернет някои стилове на реални рамки за снимки и опитайте да използвате `overlay`, за да наслагате изображение на рамка, така че снимката да изглежда по-близо до истинска фоторамка.

Ефект на показване на упражнението:

![button](../../../Resource/032_view15.jpeg)

### 4、Създаване на рамка на бутон със заоблени ъгли

В реалната разработка бутоните често използват рамка със заоблен правоъгълник.

Опитайте да създадете бутон със заоблени ъгли и да използвате `RoundedRectangle` и `strokeBorder`, за да добавите заоблена рамка към бутона.

Ефект на показване на упражнението:

![button](../../../Resource/032_view14.png)

### Въпрос за размисъл

Ако не искаме да използваме едноцветна рамка и не искаме да използваме градиентна рамка, а искаме рамката да показва някакъв шарен ефект, как трябва да го реализираме?

Можете да опитате да потърсите материали и да разберете свързаните употреби на `overlay`, `mask` или `ImagePaint`.

Ефект на показване на упражнението:

![button](../../../Resource/032_view16.png)
