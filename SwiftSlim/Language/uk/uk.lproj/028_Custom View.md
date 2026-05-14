# Користувацький View

У цьому уроці ми вивчимо дуже важливий спосіб написання SwiftUI: **користувацький View**.

Користувацький View може інкапсулювати повторюваний фрагмент коду інтерфейсу й перетворити його на View, який можна використовувати багато разів.

Під час реальної розробки App ми часто стикаємося з такою ситуацією: структура багатьох екранів однакова, відрізняється лише відображуваний вміст.

Наприклад, у списку дописів на форумі кожен допис може містити заголовок, зображення, кількість вподобань та іншу інформацію.

![Reddit](../../../Resource/028_view1.png)

У списку товарів на сайті інтернет-магазину кожен товар може містити зображення, назву, ціну та іншу інформацію.

![Amazon](../../../Resource/028_view2.png)

Структура цього вмісту подібна, різниця полягає лише в даних, які відображаються.

Якщо вручну писати код для кожного елемента, код стане дуже довгим, і його буде незручно змінювати надалі.

Тому ми можемо інкапсулювати однакову структуру в користувацький View, а різний вміст передавати всередину як параметри.

Так один і той самий View зможе відображати різний вміст.

## Сценарій вимоги

Наприклад, зараз нам потрібно створити список налаштувань.

Результат відображення:

![view](../../../Resource/028_view.png)

У цьому списку налаштувань є три різні пункти: `Налаштування`, `Папка`, `Музика`.

Хоча їхні іконки, кольори й заголовки відрізняються, загальна структура однакова:

- Іконка зліва
- Колір фону іконки
- Заголовок посередині
- Стрілка справа

Якщо не використовувати користувацький View, ми могли б написати так:

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

                Text("Налаштування")
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

Цей код може нормально відображатися, але проблема також дуже очевидна: код трьох пунктів налаштувань майже повністю однаковий.

Відрізняються лише іконка, колір і заголовок:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Налаштування")
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

Тобто структура кожного пункту налаштувань є фіксованою, а відрізняються лише іконка, колір і заголовок.

Така ситуація дуже добре підходить для використання користувацького View.

### Тінь shadow

Тут використано новий модифікатор `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` може додати тінь до View.

`radius` означає радіус розмиття тіні. Що більше значення, то зазвичай більша область розсіювання тіні, і вона виглядає м’якшою.

Тут встановлено значення `1`, що означає додавання лише дуже легкого ефекту тіні.

## Інкапсуляція View пункту налаштувань

Далі ми інкапсулюємо кожен пункт налаштувань у новий View.

Можна створити `SettingItemView`:

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

У цьому View ми визначили три властивості:

```swift
let icon: String
let color: Color
let title: String
```

Серед них:

- `icon` означає назву іконки
- `color` означає колір фону іконки
- `title` означає заголовок пункту налаштувань

Оскільки ці три значення відрізняються в різних пунктах налаштувань, ми робимо їх параметрами, які можна передавати ззовні.

## Використання користувацького View

Після того як у нас є `SettingItemView`, нам більше не потрібно повторно писати великий фрагмент коду `HStack`.

Тепер його можна використовувати так:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Налаштування")
```

Цей рядок коду означає створення View пункту налаштувань і передавання трьох параметрів:

```swift
icon: "gear"
color: Color.blue
title: "Налаштування"
```

Після передавання властивості всередині `SettingItemView` отримають відповідні значення:

- значення `icon` — `gear`
- значення `color` — `Color.blue`
- значення `title` — `"Налаштування"`

Тому всередині View `Image(systemName: icon)` відобразить іконку шестерні, `.background(color)` використає синій фон, а `Text(title)` відобразить `Налаштування`.

Повний код:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Налаштування")

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

Результат відображення:

![view](../../../Resource/028_view.png)

Можна побачити, що після інкапсуляції результат відображення такий самий, як і раніше, але код став зрозумілішим.

Раніше для кожного пункту налаштувань потрібно було писати цілий фрагмент `HStack`, а тепер достатньо лише одного рядка коду:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Налаштування")
```

Саме в цьому полягає роль користувацького View: **інкапсулювати повторювану структуру View і передавати лише різний вміст як параметри.**

## Чому можна передавати параметри

Далі коротко розберімося, чому користувацький View може приймати параметри.

У SwiftUI View по суті є структурою.

Наприклад:

```swift
struct ContentView: View {
    var body: some View {
        Text("Привіт, світе!")
    }
}
```

Тут `ContentView` — це структура.

Коли ми пишемо:

```swift
ContentView()
```

фактично ми створюємо View `ContentView`.

Дужки `()` позаду означають виклик його методу ініціалізації; також це можна розуміти як створення цього View.

Оскільки цей `ContentView` не має властивостей, які потрібно передавати ззовні, можна просто написати:

```swift
ContentView()
```

Але якщо у View є властивість без значення, під час створення View потрібно передати відповідне значення.

Наприклад:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ім’я: \(name)")
    }
}
```

Тут `name` — це властивість, і вона не має значення за замовчуванням.

Тому під час створення `ContentView` потрібно обов’язково надати `name` конкретне значення:

```swift
ContentView(name: "Fang Junyu")
```

Так View зможе використовувати це значення всередині:

```swift
Text("ім’я: \(name)")
```

Це також причина, чому під час створення `SettingItemView` потрібно передавати параметри:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Налаштування")
```

Тому що в `SettingItemView` є три властивості без значень за замовчуванням:

```swift
let icon: String
let color: Color
let title: String
```

Отже, під час створення цього View потрібно передати їх усередину. Передані параметри Swift використає для присвоєння значень властивостям усередині View.

## Метод ініціалізації

Далі ще глибше розберімо метод ініціалізації.

### Метод ініціалізації за замовчуванням

Коли ми визначаємо звичайний View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Привіт, світе!")
    }
}
```

У цьому коді ми не писали метод ініціалізації вручну.

Але коли ми використовуємо цей View, можна написати так:

```swift
ContentView()
```

Тут `()` фактично означає створення `ContentView`; також це можна розуміти як виклик його методу ініціалізації.

### Чому метод ініціалізації не видно, але його все одно можна викликати?

Тому що компілятор Swift автоматично створює метод ініціалізації для нас.

Важливо звернути увагу: **цей метод ініціалізації створюється автоматично, і зазвичай ми не бачимо його безпосередньо в коді.**

Тобто хоча ми не написали вручну в `struct` таке:

```swift
init() {

}
```

компілятор Swift за лаштунками створить для нас приблизно такий метод ініціалізації:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Привіт, світе!")
    }
}
```

Саме тому ми можемо прямо написати:

```swift
ContentView()
```

Отже, у реальному коді нам зазвичай не потрібно вручну виписувати метод ініціалізації.

Потрібно лише зрозуміти одну річ: **під час створення SwiftUI View буде викликано метод ініціалізації цього View. Навіть якщо ми не написали метод ініціалізації вручну, Swift може автоматично створити його для нас.**

### Метод ініціалізації з параметрами

Якщо у View є властивість без значення за замовчуванням, наприклад:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ім’я: \(name)")
    }
}
```

компілятор Swift автоматично створить метод ініціалізації з параметром на основі властивості.

Це можна просто уявити так:

```swift
init(name: String) {
    self.name = name
}
```

Тут:

```swift
init(name: String)
```

означає, що під час створення `ContentView` потрібно передати параметр `name` типу `String`.

Коли ми пишемо:

```swift
ContentView(name: "Fang Junyu")
```

це означає: передати `"Fang Junyu"` як параметр у метод ініціалізації.

Потім усередині методу ініціалізації буде виконано:

```swift
self.name = name
```

Цей рядок коду означає: присвоїти `name`, переданий ззовні, власній властивості `name` поточного View.

Це можна просто уявити так:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ім’я: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Так View зможе використовувати передане значення всередині.

Це і є процес ініціалізації View з параметрами: **коли властивість усередині View не має значення за замовчуванням, під час створення View потрібно передати відповідний параметр, щоб метод ініціалізації виконав присвоєння значення властивості.**

## Випадок, коли властивість має значення за замовчуванням

Якщо властивість уже має значення за замовчуванням, під час створення View можна не передавати параметр.

Наприклад:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ім’я: \(name)")
    }
}
```

Тут `name` уже має значення за замовчуванням:

```swift
"Fang Junyu"
```

Тому під час створення `ContentView` можна прямо написати:

```swift
ContentView()
```

У цей момент `name` використає значення за замовчуванням, а інтерфейс відобразить:

```swift
ім’я: Fang Junyu
```

Звичайно, під час створення View також можна передати нове значення:

```swift
ContentView(name: "Sam")
```

У цей момент View використає `"Sam"`, передане ззовні, а не значення за замовчуванням, і інтерфейс відобразить:

```swift
ім’я: Sam
```

Для зручності розуміння метод ініціалізації, автоматично створений компілятором Swift, можна просто уявити так:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Тут `name: String = "Fang Junyu"` означає: якщо під час створення View не передано `name`, використати значення за замовчуванням `"Fang Junyu"`; якщо під час створення View передано нове `name`, використати передане значення.

Тобто: **якщо ззовні параметр не передано, використовується значення властивості за замовчуванням; якщо ззовні параметр передано, використовується передане значення.**

## Повернімося до SettingItemView

Тепер повернімося до SettingItemView:

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

Структура цього View є фіксованою.

До фіксованих частин належать:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

До різних частин належать:

```swift
icon
color
title
```

Тому ми робимо різний вміст властивостями й передаємо його як параметри під час створення View.

Коли ми створюємо різні пункти налаштувань, потрібно лише передати різні параметри:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Налаштування")
SettingItemView(icon: "folder", color: Color.brown, title: "Папка")
SettingItemView(icon: "music.note", color: Color.purple, title: "Музика")
```

Так один і той самий `SettingItemView` зможе відобразити три різні пункти налаштувань.

Це найпоширеніший спосіб використання користувацького View.

## Підсумок

У цьому уроці ми вивчили користувацький View.

Ключова роль користувацького View: **інкапсулювати повторюваний код інтерфейсу, щоб його можна було повторно використовувати.**

У цьому прикладі структура трьох пунктів налаштувань однакова, відрізняються лише іконка, колір і заголовок.

Тому ми створили `SettingItemView`:

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

Потім під час використання цього View ми передаємо різні параметри:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Налаштування")
```

Тут параметри потраплять усередину `SettingItemView`.

Завдяки цьому способу ми можемо створювати View з однаковою структурою, але різним вмістом, використовуючи менше коду.

Це також дуже поширений спосіб написання коду в розробці SwiftUI.
