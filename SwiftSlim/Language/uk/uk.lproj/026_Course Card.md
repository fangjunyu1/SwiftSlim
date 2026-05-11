# Картка курсу

Цей урок — етапний урок-повторення. Ми створимо «картку курсу».

Завдяки цій вправі ми зможемо повторити вивчені раніше `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` та інші елементи, а також навчимося поєднувати кілька невеликих view в один повний модуль інтерфейсу.

Ефект картки курсу:

![view](../../../Resource/026_view.png)

Ця картка курсу переважно містить кілька частин:

- Рівень курсу: `Beginner`
- Вміст курсу: `20+ Lessons`
- Назва курсу: `SwiftUI Beginner Tutorial`
- Опис курсу
- Кнопка: `Start Learning`
- Фон курсу: іконка Swift та фон кольору індиго

Ми можемо завершити цей view у `ContentView`.

## Верхня область

Спочатку створимо верхню область картки курсу.

![view](../../../Resource/026_view1.png)

Ліва частина верхньої області показує рівень курсу, а права частина показує вміст курсу.

Оскільки ці два елементи розташовані горизонтально, можна використати `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Початківець")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ уроків")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Тут ми винесли верхню область в обчислювану властивість:

```swift
var topView: some View
```

Перевага такого підходу в тому, що `body` стає зрозумілішим.

У верхній області переважно використовуються такі елементи:

- `HStack`: розташовує два текстові view горизонтально.
- `Text`: відображає текстовий вміст.
- `Spacer()`: відштовхує лівий текст ліворуч, а правий текст — праворуч.
- `.font(.footnote)`: задає менший стиль тексту.
- `.fontWeight(.bold)`: робить текст жирним.
- `.foregroundStyle(Color.white)`: задає білий колір переднього плану.
- `.padding(.vertical, 10)`: задає вертикальні внутрішні відступи.
- `.padding(.horizontal, 16)`: задає горизонтальні внутрішні відступи.
- `.background(Color.white.opacity(0.15))`: задає напівпрозорий білий фон.
- `.cornerRadius(20)`: задає радіус заокруглення кутів.

Тут для `Beginner` використано `.padding()` у двох напрямках:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Так текст отримує простір зверху/знизу та ліворуч/праворуч, і виглядає більше схожим на мітку.

`Color.white.opacity(0.15)` означає білий колір із непрозорістю `15%`, тобто дуже світлий білий.

### Додавання фону картки

Раніше ми створили `topView`, але саме створення view ще не означає, що він автоматично відобразиться.

У SwiftUI вміст, який дійсно відображається на екрані, потрібно писати в `body`.

Тому спочатку можна помістити `topView` у `body`, щоб показати його:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

У цей момент можна побачити, що верхня область уже відображається:

![view](../../../Resource/026_view2.png)

Однак текст у `topView` білий, а стандартний фон також світлий, тому в світлому режимі його може бути не дуже добре видно.

Тому ми можемо додати зовні `VStack`, а потім задати всій області внутрішній відступ, колір фону та заокруглення кутів:

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

Ефект відображення:

![view](../../../Resource/026_view3.png)

Тут `VStack` наразі містить лише один `topView`, тому може здаватися, що він не обов’язковий.

Але далі ми продовжимо додавати назву курсу, опис курсу та область кнопки. Усі вони розташовуються вертикально, тому завчасне використання `VStack` полегшує подальше поєднання view.

Тут є два модифікатори `.padding()`, і їхня дія різна.

Перший `.padding(20)` написано перед `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Він керує внутрішнім відступом картки, тобто відстанню між вмістом і краєм фону.

Другий `.padding(30)` написано після `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Він керує зовнішнім відступом картки, тобто відстанню між усією карткою та краєм екрана.

![view](../../../Resource/026_view4.png)

Отже, хоча це той самий `.padding()`, розміщення в різних позиціях дає різний ефект.

## Область вмісту

Далі створимо область вмісту картки курсу.

Ефект відображення:

![view](../../../Resource/026_view5.png)

Область вмісту містить назву курсу та опис курсу. Вони розташовані вертикально, тому використовується `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Посібник SwiftUI для початківців")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Почніть з нуля зі SwiftUI та системно вивчайте декларативну розробку інтерфейсів Apple. Завдяки зрозумілим поясненням і практичним прикладам ви поступово опануєте компонування, взаємодію та керування станом, щоб створювати красиві й корисні інтерфейси застосунків.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Ефект відображення:

![view](../../../Resource/026_view6.png)

У цьому `VStack` використано два параметри:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` означає, що view всередині `VStack` вирівнюються за переднім краєм.

`spacing: 10` означає, що між view всередині `VStack` зберігається відстань `10 pt`.

Тому назва курсу та опис курсу починатимуться з лівого боку, а між ними залишатиметься певна відстань.

Опис курсу відносно довгий. Якщо показати його повністю, картка стане дуже високою, тому тут використовується `.lineLimit()`, щоб обмежити кількість рядків для відображення:

```swift
.lineLimit(3)
```

Це означає, що буде показано максимум `3` рядки. Коли вміст перевищує обмеження кількості рядків, зайва частина буде опущена.

### Вирівнювання view ліворуч

Тут потрібно звернути увагу ще на один момент.

`VStack(alignment: .leading)` може керувати лише вирівнюванням view всередині `VStack`. Він не керує безпосередньо положенням самого `VStack` у зовнішньому контейнері.

Наприклад, якщо опис курсу відносно короткий:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Посібник SwiftUI для початківців")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Трохи вмісту.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Ефект відображення:

![view](../../../Resource/026_view7.png)

Можна побачити, що хоча назва курсу й опис курсу вирівняні ліворуч усередині `VStack`, весь `VStack` не прилягає до лівого краю картки.

Це тому, що коли вміст короткий, ширина `VStack` також стає відносно малою. Під час компонування зовнішній контейнер може розмістити цей вужчий `VStack` по центру.

Це можна розуміти так: `VStack(alignment: .leading)` відповідає за внутрішнє вирівнювання ліворуч.
Але він не відповідає за те, щоб посунути всю область вмісту до самого лівого краю.

Якщо потрібно, щоб уся область вмісту справді вирівнювалася ліворуч, можна обгорнути її ще одним `HStack` і додати `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Посібник SwiftUI для початківців")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Трохи вмісту.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Ефект відображення:

![view](../../../Resource/026_view8.png)

Тут `HStack` — це горизонтальний layout.

`Spacer()` займає решту простору праворуч, завдяки чому лівий `VStack` відштовхується до самого лівого краю.

Тому `HStack + Spacer()` можна використовувати для керування положенням усієї області вмісту.

У реальній картці курсу опис зазвичай відносно довгий і займає більше ширини, тому ця проблема може бути неочевидною. Але важливо зрозуміти цю різницю, тому що під час створення layout для коротких текстів подібні ситуації часто трапляються.

### Керування відстанню між внутрішніми view

Раніше ми написали `spacing: 10` у `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` використовується для керування відстанню між внутрішніми view.

Якщо не задавати `spacing`, `VStack` також матиме стандартну відстань, але вона не обов’язково відповідатиме потрібному нам ефекту.

Тут, якщо назва курсу й опис курсу будуть надто близько один до одного, layout виглядатиме тісним, тому використовується:

```swift
spacing: 10
```

Це залишає між ними трохи простору.

Ефект відображення:

![view](../../../Resource/026_view9.png)

Так само верхня область і область вмісту також розташовані вертикально, тому `spacing` теж можна використовувати для керування відстанню між ними.

Тепер помістимо `topView` і `contentView` у `body`:

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

Ефект відображення:

![view](../../../Resource/026_view10.png)

Тут `VStack(spacing: 20)` керує відстанню між `topView` і `contentView`.

Інакше кажучи:

```swift
VStack(alignment: .leading, spacing: 10)
```

Керує відстанню між назвою курсу та описом курсу.

```swift
VStack(spacing: 20)
```

Керує відстанню між верхньою областю та областю вмісту.

В обох випадках це `spacing`, але він діє на різні контейнери `VStack`, тому й область впливу також різна.

Таким чином view області вмісту завершено.

## Область кнопки

Далі створимо нижню область кнопки.

Ефект відображення:

![view](../../../Resource/026_view11.png)

Область кнопки переважно складається з іконки відтворення та фрагмента тексту.

Ми можемо використати `Image` для відображення іконки відтворення, а `Text` — для відображення тексту кнопки.

Тут спочатку створимо зовнішній вигляд кнопки:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("кнопку натиснуто")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Почати навчання")
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

Ефект відображення:

![view](../../../Resource/026_view12.png)

Тут використано два контейнери `HStack`:

Внутрішній `HStack` використовується для горизонтального розташування іконки й тексту:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Почати навчання")
}
```

Зовнішній `HStack` разом зі `Spacer()` використовується, щоб зовнішній вигляд кнопки вирівнювався ліворуч:

```swift
HStack {
    ...
    Spacer()
}
```

Коли кнопку натиснути, у консолі буде виведено `кнопку натиснуто`.

## Базову картку завершено

Тепер поєднаємо верхню область, область вмісту та область кнопки:

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

Ефект відображення:

![view](../../../Resource/026_view13.png)

На цьому етапі базова картка курсу вже завершена.

## Фон з іконкою Swift

Нарешті додамо до картки напівпрозорий фон з іконкою Swift.

![view](../../../Resource/026_view.png)

Раніше ми використовували `Color.indigo` як колір фону. Насправді `.background()` може додавати не лише колір, а й повний view.

Тому спочатку можна створити спеціальний фоновий view:

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

У цьому фоновому view ми використовуємо `VStack`, `HStack` і `Spacer()`, щоб відштовхнути іконку Swift у правий нижній кут.

Оскільки іконка Swift використовується лише як декоративний фон, тут застосовано напівпрозорий білий колір:

```swift
Color.white.opacity(0.15)
```

Так іконка не буде надто помітною і не впливатиме на текстовий вміст попереду.

Далі додамо `backgroundView` до картки:

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

Фінальний ефект:

![view](../../../Resource/026_view14.png)

Тут послідовно використано два `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Перший `.background()` використовується для додавання фону з іконкою Swift.
Другий `.background()` використовується для додавання фону кольору індиго.

Так іконка Swift відображатиметься над фоном кольору індиго і буде частиною фону картки.

Звідси видно, що `.background()` може додавати не лише кольори, а й кастомні view. Кілька `.background()` також можна комбінувати, щоб отримувати багатші фонові ефекти.

На цьому повну картку курсу завершено.

## Підсумок

У цьому уроці через картку курсу ми повторили поширені базові способи компонування у SwiftUI.

Ми використовували `Text` для відображення тексту, `Image` для відображення системної іконки, а `VStack`, `HStack` і `Spacer()` — для керування розташуванням view.

Ми вивчили `.lineLimit()`, який може обмежувати максимальну кількість рядків тексту. Коли вміст перевищує це обмеження, зайва частина опускається.

Водночас ми також повторили поширені модифікатори, такі як `.padding()`, `.background()`, `.cornerRadius()` і `.foregroundStyle()`.

Після завершення цього уроку ми вже можемо поєднувати кілька невеликих view в один повний модуль картки.

Це також дуже поширений підхід у розробці SwiftUI: спочатку розділити view на невеликі частини, а потім поєднати їх у повний інтерфейс.

## Повний код

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
            Text("Початківець")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ уроків")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Посібник SwiftUI для початківців")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Почніть з нуля зі SwiftUI та системно вивчайте декларативну розробку інтерфейсів Apple. Завдяки зрозумілим поясненням і практичним прикладам ви поступово опануєте компонування, взаємодію та керування станом, щоб створювати красиві й корисні інтерфейси застосунків.")
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
    	        print("кнопку натиснуто")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Почати навчання")
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
