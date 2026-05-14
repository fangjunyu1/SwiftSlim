# Персонализиран изглед

В този урок ще научим един много важен начин на писане в SwiftUI: **персонализиран изглед**.

Персонализираният изглед може да капсулира повтарящ се фрагмент от код за изглед и да го превърне в изглед, който може да се използва многократно.

При реална разработка на App често срещаме такава ситуация: структурата на много интерфейси е една и съща, но показваното съдържание е различно.

Например в списък с публикации във форум всеки елемент може да има заглавие, изображение, брой харесвания и друга информация.

![Reddit](../../../Resource/028_view1.png)

В списък с продукти в онлайн магазин всеки продукт може да има изображение, име, цена и друга информация.

![Amazon](../../../Resource/028_view2.png)

Структурата на тези елементи е подобна. Разликата е само в данните, които се показват.

Ако пишем кода за всеки елемент ръчно, кодът ще стане много дълъг и няма да е удобен за последващи промени.

Затова можем да капсулираме еднаквата структура в персонализиран изглед, а различното съдържание да подаваме като параметри.

Така един и същ изглед може да показва различно съдържание.

## Сценарий на изискването

Например сега искаме да направим списък с настройки.

Краен резултат:

![view](../../../Resource/028_view.png)

В този списък с настройки има три различни елемента: `Настройки`, `Папка`, `Музика`.

Макар че техните икони, цветове и заглавия са различни, общата структура е една и съща:

- икона отляво
- цвят на фона на иконата
- заглавие в средата
- стрелка отдясно

Ако не използваме персонализиран изглед, може да напишем така:

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

                Text("Настройки")
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

                Text("Папка")
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

                Text("Музика")
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

Този код може да се покаже нормално, но проблемът също е очевиден: кодът на трите елемента с настройки е почти напълно еднакъв.

Различават се само иконата, цветът и заглавието:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Настройки")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Папка")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Музика")
```

Тоест структурата на всеки елемент с настройки е фиксирана, а различни са само иконата, цветът и заглавието.

Такава ситуация е много подходяща за използване на персонализиран изглед.

### Сянка shadow

Тук използвахме нов модификатор `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` може да добави сянка към изгледа.

`radius` означава радиус на размазване на сянката. Колкото по-голяма е стойността, толкова по-голяма обикновено е зоната на разпространение на сянката и толкова по-мека изглежда тя.

Тук стойността е `1`, което означава, че добавяме само много лек ефект на сянка.

## Капсулиране на изглед за елемент с настройки

След това ще капсулираме всеки елемент с настройки в нов изглед.

Можем да създадем `SettingItemView`:

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

В този изглед дефинираме три свойства:

```swift
let icon: String
let color: Color
let title: String
```

Сред тях:

- `icon` означава име на иконата
- `color` означава цвят на фона на иконата
- `title` означава заглавие на елемента с настройки

Тъй като тези три части съдържание са различни в различните елементи с настройки, ги правим параметри, които могат да се подадат отвън.

## Използване на персонализиран изглед

След като имаме `SettingItemView`, вече не е нужно да пишем многократно голям фрагмент код с `HStack`.

Сега можем да го използваме така:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

Този ред код означава създаване на изглед за елемент с настройки и подаване на три параметъра:

```swift
icon: "gear"
color: Color.blue
title: "Настройки"
```

След подаването свойствата вътре в `SettingItemView` ще получат съответните стойности:

- стойността на `icon` е `gear`
- стойността на `color` е `Color.blue`
- стойността на `title` е `"Настройки"`

Затова вътре в изгледа `Image(systemName: icon)` ще покаже икона със зъбно колело, `.background(color)` ще използва син фон, а `Text(title)` ще покаже `Настройки`.

Пълен код:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Папка")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Музика")
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

Краен резултат:

![view](../../../Resource/028_view.png)

Можем да видим, че след капсулирането крайният резултат е същият като преди, но кодът е станал по-ясен.

Преди за всеки елемент с настройки трябваше да пишем цял фрагмент `HStack`; сега е нужен само един ред код:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

Това е ролята на персонализирания изглед: **да капсулира повтарящата се структура на изгледа и да подава само различното съдържание като параметри.**

## Защо можем да подаваме параметри

След това нека накратко разберем защо персонализираният изглед може да приема параметри.

В SwiftUI изгледът по същество е структура.

Например:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Тук `ContentView` е структура.

Когато пишем:

```swift
ContentView()
```

всъщност създаваме изглед `ContentView`.

Следващите `()` означават извикване на неговия инициализатор, което може да се разбира и като създаване на този изглед.

Тъй като този `ContentView` няма свойства, които трябва да бъдат подадени отвън, можем директно да напишем:

```swift
ContentView()
```

Но ако в изгледа има свойство без зададена стойност, при създаване на изгледа трябва да подадем съответната стойност.

Например:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("име: \(name)")
    }
}
```

Тук `name` е свойство и няма стойност по подразбиране.

Затова при създаване на `ContentView` трябва да дадем конкретна стойност на `name`:

```swift
ContentView(name: "Fang Junyu")
```

Така изгледът вътре ще може да използва тази стойност:

```swift
Text("име: \(name)")
```

Това е и причината, поради която при създаване на `SettingItemView` трябва да подадем параметри:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

Защото в `SettingItemView` има три свойства без стойности по подразбиране:

```swift
let icon: String
let color: Color
let title: String
```

Затова при създаване на този изглед трябва да ги подадем. Подадените параметри ще бъдат използвани от Swift, за да присвои стойности на свойствата вътре в изгледа.

## Инициализатор

След това ще разберем инициализатора още една стъпка по-нататък.

### Инициализатор по подразбиране

Когато дефинираме обикновен изглед:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

В този код не сме написали инициализатор ръчно.

Но когато използваме този изглед, можем да напишем така:

```swift
ContentView()
```

Тук `()` всъщност означава, че създаваме `ContentView`, или може да се разбира като извикване на неговия инициализатор.

### Защо можем да го извикаме, въпреки че няма инициализатор?

Защото Swift компилаторът автоматично ни генерира инициализатор.

Важно е да се отбележи, че **този инициализатор се генерира автоматично и обикновено не го виждаме директно в кода.**

Тоест, макар че не сме написали ръчно в `struct`:

```swift
init() {

}
```

Swift компилаторът ще генерира зад кулисите подобен инициализатор:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hello, World!")
    }
}
```

Това е причината да можем директно да напишем:

```swift
ContentView()
```

Затова в реалния код обикновено няма нужда да пишем инициализатора ръчно.

Достатъчно е да разберем едно нещо: **при създаване на SwiftUI изглед се извиква инициализаторът на изгледа. Дори да не сме написали инициализатор ръчно, Swift може автоматично да генерира такъв за нас.**

### Инициализатор с параметри

Ако в изгледа има свойство без стойност по подразбиране, например:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("име: \(name)")
    }
}
```

Swift компилаторът ще генерира автоматично инициализатор с параметри според свойството.

Можем да го разберем просто като:

```swift
init(name: String) {
    self.name = name
}
```

Тук:

```swift
init(name: String)
```

означава, че при създаване на `ContentView` трябва да подадем параметър `name` от тип `String`.

Когато пишем:

```swift
ContentView(name: "Fang Junyu")
```

смисълът е: подаваме `"Fang Junyu"` като параметър на инициализатора.

След това вътре в инициализатора ще се изпълни:

```swift
self.name = name
```

Смисълът на този ред код е: стойността `name`, подадена отвън, се присвоява на собственото свойство `name` на текущия изглед.

Можем да го разберем просто като:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("име: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Така изгледът вътре може да използва подадената стойност.

Това е процесът на инициализиране на изглед с параметри: **когато свойството в изгледа няма стойност по подразбиране, при създаване на изгледа трябва да подадем съответния параметър, за да може инициализаторът да завърши присвояването на стойност.**

## Когато свойството има стойност по подразбиране

Ако свойството вече има стойност по подразбиране, при създаване на изгледа може да не подаваме параметър.

Например:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("име: \(name)")
    }
}
```

Тук `name` вече има стойност по подразбиране:

```swift
"Fang Junyu"
```

Затова при създаване на `ContentView` можем директно да напишем:

```swift
ContentView()
```

В този момент `name` ще използва стойността по подразбиране и интерфейсът ще покаже:

```swift
име: Fang Junyu
```

Разбира се, при създаване на изгледа можем да подадем и нова стойност:

```swift
ContentView(name: "Sam")
```

Тогава изгледът ще използва подаденото отвън `"Sam"`, вместо стойността по подразбиране, и интерфейсът ще покаже:

```swift
име: Sam
```

За по-лесно разбиране можем да си представим автоматично генерирания от Swift компилатора инициализатор така:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Тук `name: String = "Fang Junyu"` означава: ако при създаване на изгледа не бъде подадено `name`, използва се стойността по подразбиране `"Fang Junyu"`; ако при създаване на изгледа бъде подадено ново `name`, използва се подадената стойност.

Тоест: **ако отвън не бъде подаден параметър, се използва стойността по подразбиране на свойството; ако отвън бъде подаден параметър, се използва подадената стойност.**

## Обратно към SettingItemView

Сега нека отново погледнем SettingItemView:

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

Структурата на този изглед е фиксирана.

Фиксираните части включват:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Различните части включват:

```swift
icon
color
title
```

Затова правим различното съдържание свойства и го подаваме чрез параметри при създаване на изгледа.

Когато създаваме различни елементи с настройки, трябва само да подадем различни параметри:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
SettingItemView(icon: "folder", color: Color.brown, title: "Папка")
SettingItemView(icon: "music.note", color: Color.purple, title: "Музика")
```

Така един и същ `SettingItemView` може да покаже три различни елемента с настройки.

Това е най-често срещаният начин за използване на персонализиран изглед.

## Обобщение

В този урок научихме какво е персонализиран изглед.

Основната роля на персонализирания изглед е: **да капсулира повтарящия се код за изглед, така че той да може да се използва многократно.**

В този пример структурата на трите елемента с настройки е една и съща, а различни са само иконата, цветът и заглавието.

Затова създадохме `SettingItemView`:

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

След това, когато използваме този изглед, подаваме различни параметри:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

Тези параметри ще влязат вътре в `SettingItemView`.

По този начин можем с по-малко код да създаваме изгледи с еднаква структура, но различно съдържание.

Това също е много често срещан начин на писане при разработка със SwiftUI.
