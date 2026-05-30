# Пользовательское представление

В этом уроке мы изучим очень важный способ написания кода в SwiftUI: **пользовательский View**.

Пользовательский View позволяет инкапсулировать повторяющийся фрагмент кода интерфейса и превратить его во View, который можно использовать снова и снова.

При реальной разработке App мы часто сталкиваемся с такой ситуацией: структура многих экранов одинакова, отличается только отображаемое содержимое.

Например, в списке публикаций на форуме каждая публикация может содержать заголовок, изображение, количество лайков и другую информацию.

![Reddit](../../../Resource/028_view1.png)

В списке товаров на сайте интернет-магазина каждый товар может содержать изображение, название, цену и другую информацию.

![Amazon](../../../Resource/028_view2.png)

Структура такого содержимого похожа, различаются только отображаемые данные.

Если вручную писать код для каждого элемента, код станет очень длинным, и его будет неудобно изменять в дальнейшем.

Поэтому мы можем инкапсулировать одинаковую структуру в пользовательский View, а разное содержимое передавать внутрь как параметры.

Так один и тот же View сможет отображать разное содержимое.

## Сценарий требования

Например, сейчас нам нужно создать список настроек.

Результат отображения:

![view](../../../Resource/028_view.png)

В этом списке настроек есть три разных пункта: `Настройки`, `Папка`, `Музыка`.

Хотя их иконки, цвета и заголовки отличаются, общая структура одинакова:

- Иконка слева
- Цвет фона иконки
- Заголовок в середине
- Стрелка справа

Если не использовать пользовательский View, мы могли бы написать так:

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

Этот код может нормально отображаться, но проблема тоже очевидна: код трех пунктов настроек почти полностью одинаковый.

Отличаются только иконка, цвет и заголовок:

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
Text("Музыка")
```

То есть структура каждого пункта настроек фиксированная, а отличаются только иконка, цвет и заголовок.

Такая ситуация очень подходит для использования пользовательского View.

### Тень shadow

Здесь используется новый модификатор `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` может добавить тень к View.

`radius` означает радиус размытия тени. Чем больше значение, тем обычно шире область распространения тени и тем мягче она выглядит.

Здесь установлено значение `1`, то есть добавляется только очень легкий эффект тени.

## Инкапсуляция View пункта настроек

Далее мы инкапсулируем каждый пункт настроек в новый View.

Можно создать `SettingItemView`:

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

В этом View мы определили три свойства:

```swift
let icon: String
let color: Color
let title: String
```

Среди них:

- `icon` означает имя иконки
- `color` означает цвет фона иконки
- `title` означает заголовок пункта настроек

Поскольку эти три значения отличаются в разных пунктах настроек, мы делаем их параметрами, которые можно передавать извне.

## Использование пользовательского View

После того как у нас появился `SettingItemView`, нам больше не нужно повторно писать большой фрагмент кода `HStack`.

Теперь его можно использовать так:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

Эта строка кода означает создание View пункта настроек и передачу трех параметров:

```swift
icon: "gear"
color: Color.blue
title: "Настройки"
```

После передачи свойства внутри `SettingItemView` получат соответствующие значения:

- значение `icon` — `gear`
- значение `color` — `Color.blue`
- значение `title` — `"Настройки"`

Поэтому внутри View `Image(systemName: icon)` отобразит иконку шестеренки, `.background(color)` использует синий фон, а `Text(title)` отобразит `Настройки`.

Полный код:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Папка")

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

Результат отображения:

![view](../../../Resource/028_view.png)

Можно увидеть, что после инкапсуляции результат отображения такой же, как раньше, но код стал понятнее.

Раньше для каждого пункта настроек нужно было писать целый фрагмент `HStack`, а теперь достаточно одной строки кода:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

В этом и заключается роль пользовательского View: **инкапсулировать повторяющуюся структуру View и передавать только разное содержимое как параметры.**

## Почему можно передавать параметры

Далее кратко разберем, почему пользовательский View может принимать параметры.

В SwiftUI View по своей сути является структурой.

Например:

```swift
struct ContentView: View {
    var body: some View {
        Text("Привет, мир!")
    }
}
```

Здесь `ContentView` — это структура.

Когда мы пишем:

```swift
ContentView()
```

на самом деле мы создаем View `ContentView`.

Следующие за именем `()` означают вызов его метода инициализации; также это можно понимать как создание этого View.

Поскольку у этого `ContentView` нет свойств, которые нужно передавать извне, можно напрямую написать:

```swift
ContentView()
```

Но если во View есть свойство без значения, при создании View нужно передать соответствующее значение.

Например:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("имя: \(name)")
    }
}
```

Здесь `name` — это свойство, и у него нет значения по умолчанию.

Поэтому при создании `ContentView` нужно обязательно передать для `name` конкретное значение:

```swift
ContentView(name: "Fang Junyu")
```

Так View сможет использовать это значение внутри:

```swift
Text("имя: \(name)")
```

Это также причина, почему при создании `SettingItemView` нужно передавать параметры:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

Потому что в `SettingItemView` есть три свойства без значений по умолчанию:

```swift
let icon: String
let color: Color
let title: String
```

Поэтому при создании этого View нужно передать их внутрь. Переданные параметры Swift использует для присваивания значений свойствам внутри View.

## Метод инициализации

Далее немного глубже разберем метод инициализации.

### Метод инициализации по умолчанию

Когда мы определяем обычный View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Привет, мир!")
    }
}
```

В этом коде мы не писали метод инициализации вручную.

Но когда мы используем этот View, можно написать так:

```swift
ContentView()
```

Здесь `()` на самом деле означает создание `ContentView`; также это можно понимать как вызов его метода инициализации.

### Почему метода инициализации не видно, но его все равно можно вызвать?

Потому что компилятор Swift автоматически создает для нас метод инициализации.

Важно заметить: **этот метод инициализации создается автоматически, и обычно мы не видим его напрямую в коде.**

То есть, хотя мы не написали вручную внутри `struct` следующее:

```swift
init() {

}
```

компилятор Swift за кулисами создаст для нас примерно такой метод инициализации:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Привет, мир!")
    }
}
```

Именно поэтому мы можем напрямую написать:

```swift
ContentView()
```

Поэтому в реальном коде обычно не нужно вручную выписывать метод инициализации.

Достаточно понять один момент: **при создании SwiftUI View будет вызван метод инициализации этого View. Даже если мы не написали метод инициализации вручную, Swift может автоматически создать его для нас.**

### Метод инициализации с параметрами

Если во View есть свойство без значения по умолчанию, например:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("имя: \(name)")
    }
}
```

компилятор Swift автоматически создаст метод инициализации с параметром на основе свойства.

Это можно просто представить так:

```swift
init(name: String) {
    self.name = name
}
```

Здесь:

```swift
init(name: String)
```

означает, что при создании `ContentView` нужно передать параметр `name` типа `String`.

Когда мы пишем:

```swift
ContentView(name: "Fang Junyu")
```

это означает: передать `"Fang Junyu"` как параметр в метод инициализации.

Затем внутри метода инициализации выполнится:

```swift
self.name = name
```

Эта строка кода означает: присвоить `name`, переданный извне, собственному свойству `name` текущего View.

Это можно просто представить так:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("имя: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Так View сможет использовать переданное значение внутри.

Это и есть процесс инициализации View с параметрами: **когда свойство внутри View не имеет значения по умолчанию, при создании View нужно передать соответствующий параметр, чтобы метод инициализации завершил присваивание значения свойству.**

## Случай, когда у свойства есть значение по умолчанию

Если у свойства уже есть значение по умолчанию, при создании View можно не передавать параметр.

Например:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("имя: \(name)")
    }
}
```

Здесь у `name` уже есть значение по умолчанию:

```swift
"Fang Junyu"
```

Поэтому при создании `ContentView` можно напрямую написать:

```swift
ContentView()
```

В этот момент `name` использует значение по умолчанию, и интерфейс отобразит:

```swift
имя: Fang Junyu
```

Конечно, при создании View можно также передать новое значение:

```swift
ContentView(name: "Sam")
```

В этот момент View будет использовать переданное извне `"Sam"`, а не значение по умолчанию, и интерфейс отобразит:

```swift
имя: Sam
```

Для удобства понимания метод инициализации, который компилятор Swift автоматически создает, можно упрощенно представить так:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Здесь `name: String = "Fang Junyu"` означает: если при создании View не передан `name`, использовать значение по умолчанию `"Fang Junyu"`; если при создании View передан новый `name`, использовать переданное значение.

То есть: **если извне параметр не передан, используется значение свойства по умолчанию; если извне параметр передан, используется переданное значение.**

## Вернемся к SettingItemView

Теперь снова посмотрим на SettingItemView:

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

Структура этого View фиксированная.

К фиксированным частям относятся:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

К разным частям относятся:

```swift
icon
color
title
```

Поэтому мы делаем разное содержимое свойствами и передаем его как параметры при создании View.

Когда мы создаем разные пункты настроек, нужно только передать разные параметры:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
SettingItemView(icon: "folder", color: Color.brown, title: "Папка")
SettingItemView(icon: "music.note", color: Color.purple, title: "Музыка")
```

Так один и тот же `SettingItemView` сможет отобразить три разных пункта настроек.

Это самый распространенный способ использования пользовательского View.

## Итоги

В этом уроке мы изучили пользовательский View.

Ключевая роль пользовательского View: **инкапсулировать повторяющийся код интерфейса, чтобы его можно было использовать повторно.**

В этом примере структура трех пунктов настроек одинаковая, отличаются только иконка, цвет и заголовок.

Поэтому мы создали `SettingItemView`:

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

Затем при использовании этого View мы передаем разные параметры:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Настройки")
```

Эти параметры попадут внутрь `SettingItemView`.

Таким способом мы можем с меньшим количеством кода создавать View с одинаковой структурой, но разным содержимым.

Это также очень распространенный способ написания кода при разработке SwiftUI.
