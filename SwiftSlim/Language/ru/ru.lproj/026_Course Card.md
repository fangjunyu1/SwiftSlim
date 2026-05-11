# Карточка курса

Этот урок — этапное повторение. Мы создадим «карточку курса».

С помощью этого упражнения мы повторим уже изученные `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` и другие элементы, а также узнаем, как объединять несколько небольших представлений в полноценный модуль интерфейса.

Вид карточки курса:

![view](../../../Resource/026_view.png)

Эта карточка курса в основном содержит несколько частей:

- Уровень курса: `Начинающий`
- Содержание курса: `20+ уроков`
- Заголовок курса: `SwiftUI для начинающих`
- Описание курса
- Кнопка: `Начать обучение`
- Фон курса: значок Swift и фон цвета индиго

Мы можем создать это представление в `ContentView`.

## Верхняя область

Сначала создадим верхнюю область карточки курса.

![view](../../../Resource/026_view1.png)

Слева в верхней области отображается уровень курса, а справа — содержание курса.

Поскольку эти два элемента расположены горизонтально, можно использовать `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Начинающий")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ уроков")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Здесь мы вынесли верхнюю область в вычисляемое свойство:

```swift
var topView: some View
```

Преимущество такого подхода в том, что он делает `body` более понятным.

В верхней области в основном используются следующие элементы:

- `HStack`: располагает два текста горизонтально.
- `Text`: отображает текстовое содержимое.
- `Spacer()`: прижимает левый текст к левому краю, а правый текст — к правому краю.
- `.font(.footnote)`: задаёт небольшой стиль текста.
- `.fontWeight(.bold)`: делает текст полужирным.
- `.foregroundStyle(Color.white)`: задаёт белый цвет переднего плана.
- `.padding(.vertical, 10)`: задаёт внутренние отступы сверху и снизу.
- `.padding(.horizontal, 16)`: задаёт внутренние отступы слева и справа.
- `.background(Color.white.opacity(0.15))`: задаёт полупрозрачный белый фон.
- `.cornerRadius(20)`: задаёт скругление углов.

Для `Начинающий` используются `.padding()` в двух направлениях:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Так вокруг текста появляется пространство сверху, снизу, слева и справа, и он больше похож на метку.

`Color.white.opacity(0.15)` означает белый цвет с непрозрачностью `15%`, то есть очень светлый белый оттенок.

### Добавление фона карточки

Ранее мы создали `topView`, но одно лишь создание представления не означает, что оно автоматически появится на экране.

В SwiftUI содержимое, которое действительно отображается в интерфейсе, нужно поместить в `body`.

Поэтому сначала можно поместить `topView` в `body` для отображения:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Теперь можно увидеть, что верхняя область уже отображается:

![view](../../../Resource/026_view2.png)

Однако текст в `topView` белый, а фон по умолчанию тоже светлый, поэтому в светлом режиме его может быть трудно рассмотреть.

Поэтому мы можем добавить внешний `VStack`, а затем задать всей области внутренние отступы, цвет фона и скругление углов:

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

Результат отображения:

![view](../../../Resource/026_view3.png)

Сейчас в этом `VStack` находится только один `topView`, поэтому кажется, что он не обязателен.

Но позже мы продолжим добавлять заголовок курса, описание курса и область кнопки. Все они располагаются вертикально, поэтому заранее использовать здесь `VStack` удобно для дальнейшего объединения представлений.

Здесь есть два `.padding()`, и их назначение различается.

Первый `.padding(20)` написан перед `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Он управляет внутренним отступом карточки, то есть расстоянием между содержимым и краями фона.

Второй `.padding(30)` написан после `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Он управляет внешним отступом карточки, то есть расстоянием между всей карточкой и краями экрана.

![view](../../../Resource/026_view4.png)

Поэтому один и тот же `.padding()` даёт разный эффект, если написать его в разных местах.

## Область содержимого

Далее создадим область содержимого карточки курса.

Результат отображения:

![view](../../../Resource/026_view5.png)

Область содержимого включает заголовок курса и описание курса. Они расположены вертикально, поэтому используется `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI для начинающих")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Начните с нуля со SwiftUI и системно изучайте декларативную разработку интерфейсов Apple. Благодаря понятным объяснениям и практическим примерам вы постепенно освоите компоновку, взаимодействие и управление состоянием, чтобы создавать красивые и полезные интерфейсы приложений.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Результат отображения:

![view](../../../Resource/026_view6.png)

В этом `VStack` используются два параметра:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` означает, что представления внутри `VStack` выравниваются по левому краю.

`spacing: 10` означает, что между представлениями внутри `VStack` сохраняется интервал `10 pt`.

Поэтому заголовок и описание курса будут располагаться от левого края, а между ними останется определённое расстояние.

Описание курса довольно длинное. Если показать его полностью, карточка станет очень высокой, поэтому здесь используется `.lineLimit()` для ограничения количества строк:

```swift
.lineLimit(3)
```

Это означает, что максимум отображается `3` строки. Когда содержимое превышает это ограничение, лишняя часть будет сокращена.

### Выравнивание представления по левому краю

Здесь нужно обратить внимание ещё на один момент.

`VStack(alignment: .leading)` может управлять только выравниванием представлений внутри `VStack`; оно не управляет напрямую положением самого `VStack` во внешнем контейнере.

Например, если описание курса короткое:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI для начинающих")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Небольшое содержимое.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Результат отображения:

![view](../../../Resource/026_view7.png)

Можно увидеть, что заголовок и описание курса внутри `VStack` действительно выровнены по левому краю, но весь `VStack` не прижат к самому левому краю карточки.

Это связано с тем, что когда содержимое короткое, ширина `VStack` также становится небольшой. При раскладке внешний контейнер может разместить этот более узкий `VStack` по центру.

Можно понимать это так: `VStack(alignment: .leading)` отвечает за внутреннее выравнивание по левому краю.
Но оно не отвечает за то, чтобы сдвинуть всю область содержимого к самому левому краю.

Если нужно, чтобы вся область содержимого действительно была прижата влево, можно дополнительно обернуть её в `HStack` и добавить `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI для начинающих")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Небольшое содержимое.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Результат отображения:

![view](../../../Resource/026_view8.png)

Здесь `HStack` — это горизонтальная компоновка.

`Spacer()` занимает оставшееся пространство справа и тем самым прижимает левый `VStack` к самому левому краю.

Поэтому `HStack + Spacer()` можно использовать для управления положением всей области содержимого.

В реальной карточке курса описание обычно длинное и занимает большую ширину, поэтому эта проблема может быть неочевидной. Но понять это различие важно, потому что при создании макетов с коротким текстом похожая ситуация встречается часто.

### Управление расстоянием между внутренними представлениями

Ранее мы написали в `VStack` `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` используется для управления расстоянием между внутренними представлениями.

Если не задавать `spacing`, у `VStack` тоже будет стандартный интервал, но он не всегда соответствует нужному нам эффекту.

Здесь слишком маленькое расстояние между заголовком курса и описанием будет выглядеть тесно, поэтому используется:

```swift
spacing: 10
```

Так между ними сохраняется немного пространства.

Результат отображения:

![view](../../../Resource/026_view9.png)

Точно так же верхняя область и область содержимого тоже располагаются вертикально, поэтому для управления расстоянием между ними также можно использовать `spacing`.

Теперь поместим `topView` и `contentView` в `body`:

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

Результат отображения:

![view](../../../Resource/026_view10.png)

Здесь `VStack(spacing: 20)` управляет расстоянием между `topView` и `contentView`.

То есть:

```swift
VStack(alignment: .leading, spacing: 10)
```

управляет расстоянием между заголовком курса и описанием курса.

```swift
VStack(spacing: 20)
```

управляет расстоянием между верхней областью и областью содержимого.

Оба используют `spacing`, но применяются к разным `VStack`, поэтому область их влияния тоже различается.

Так представление области содержимого завершено.

## Область кнопки

Далее создадим нижнюю область кнопки.

Результат отображения:

![view](../../../Resource/026_view11.png)

Область кнопки в основном состоит из значка воспроизведения и текста.

Мы можем использовать `Image` для отображения значка воспроизведения и `Text` для отображения текста кнопки.

Сначала создадим внешний вид кнопки:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("кнопка нажата")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Начать обучение")
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

Результат отображения:

![view](../../../Resource/026_view12.png)

Здесь используются два `HStack`:

Внутренний `HStack` используется для горизонтального расположения значка и текста:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Начать обучение")
}
```

Внешний `HStack` вместе со `Spacer()` используется, чтобы прижать внешний вид кнопки к левому краю:

```swift
HStack {
    ...
    Spacer()
}
```

При нажатии на кнопку в консоль будет выведено `кнопка нажата`.

## Базовая карточка готова

Теперь объединим верхнюю область, область содержимого и область кнопки:

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

Результат отображения:

![view](../../../Resource/026_view13.png)

На этом базовая карточка курса уже готова.

## Фон со значком Swift

В конце добавим в карточку полупрозрачный фон со значком Swift.

![view](../../../Resource/026_view.png)

Ранее мы использовали `Color.indigo` в качестве цвета фона. На самом деле `.background()` может добавлять не только цвет, но и полноценное представление.

Поэтому сначала можно создать отдельное фоновое представление:

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

В этом фоновом представлении мы используем `VStack`, `HStack` и `Spacer()`, чтобы сдвинуть значок Swift в правый нижний угол.

Поскольку значок Swift используется только как декоративный фон, здесь применяется полупрозрачный белый цвет:

```swift
Color.white.opacity(0.15)
```

Так значок не будет слишком заметным и не будет мешать текстовому содержимому спереди.

Затем добавим `backgroundView` в карточку:

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

Результат реализации:

![view](../../../Resource/026_view14.png)

Здесь последовательно используются два `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Первый `.background()` используется для добавления фона со значком Swift.
Второй `.background()` используется для добавления фона цвета индиго.

Так значок Swift будет отображаться поверх фона цвета индиго и станет частью фона карточки.

Отсюда видно, что `.background()` может добавлять не только цвет, но и пользовательское представление. Несколько `.background()` также можно комбинировать, чтобы создавать более богатые фоновые эффекты.

На этом полная карточка курса завершена.

## Итоги

В этом уроке на примере карточки курса мы повторили распространённые базовые способы компоновки в SwiftUI.

Мы использовали `Text` для отображения текста, `Image` для отображения системного значка, а также `VStack`, `HStack` и `Spacer()` для управления расположением представлений.

Мы изучили `.lineLimit()`: он может ограничивать максимальное количество отображаемых строк текста. Когда содержимое превышает это ограничение, лишняя часть будет сокращена.

Кроме того, мы повторили часто используемые модификаторы `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` и другие.

После завершения этого урока мы уже можем объединять несколько небольших представлений в полноценный модуль карточки.

Это также очень распространённый подход в разработке SwiftUI: сначала разделить интерфейс на небольшие представления, а затем объединить их в полноценный экран.

## Полный код

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
            Text("Начинающий")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ уроков")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI для начинающих")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Начните с нуля со SwiftUI и системно изучайте декларативную разработку интерфейсов Apple. Благодаря понятным объяснениям и практическим примерам вы постепенно освоите компоновку, взаимодействие и управление состоянием, чтобы создавать красивые и полезные интерфейсы приложений.")
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
    	        print("кнопка нажата")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Начать обучение")
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
