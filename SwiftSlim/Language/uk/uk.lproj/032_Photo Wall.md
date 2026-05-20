# Фотогалерея

У цьому уроці ми створимо сторінку фотогалереї.

![view](../../../Resource/032_view13.png)

У цьому прикладі ми повторимо знання про `extension`, `self` та екземпляри, а також вивчимо часто використовувані графічні типи `Shape` у SwiftUI.

За допомогою цих знань ми зможемо обрізати звичайні зображення до різних стилів, наприклад кола, прямокутника із заокругленими кутами, капсули та еліпса, а також додавати до фотографій ефект рамки.

У цьому уроці будуть використані кілька нових понять: `Shape`, `clipShape`, `strokeBorder` і `overlay`.

Серед них `clipShape` використовується для обрізання форми подання, `strokeBorder` — для малювання рамки форми, а `overlay` — для накладання нового подання поверх поточного подання.

## Матеріали зображень

Перед початком нам потрібно підготувати кілька зображень.

Ви можете використати власні фотографії або приклади зображень, надані в цьому уроці.

Приклади фотографій у цьому уроці взято із сайту [Pixabay](https://pixabay.com/):

[Пейзаж](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Лисиця](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Будівля](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Квітка](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Лебідь](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Після завантаження зображень додайте їх до папки ресурсів `Assets` і послідовно назвіть `1`, `2`, `3`, `4` та `5`.

![assets](../../../Resource/032_view17.png)

Так ми зможемо відображати зображення у SwiftUI за допомогою `Image("1")`, `Image("2")` тощо.

## Відображення фотографій

Спочатку відобразимо 5 фотографій у `ContentView`:

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

Результат відображення:

![view](../../../Resource/032_view.png)

У цьому коді ми використовуємо `ScrollView`, щоб реалізувати прокручуване відображення списку фотографій, і `VStack`, щоб розташувати кілька зображень зверху вниз.

Кожне зображення використовує `.resizable()`, `.scaledToFit()` і `.frame(width: 300)` для налаштування ефекту відображення, щоб зображення могло масштабуватися, зберігати пропорції та мати обмежену ширину.

`.padding(.vertical, 100)` на `VStack` використовується для збільшення верхнього й нижнього відступів, щоб перша й остання фотографії не були надто близько до країв екрана.

Останній `.ignoresSafeArea()` означає, що прокручуване подання ігнорує безпечну область, завдяки чому фотографії під час прокручування можуть простягатися до верхнього й нижнього країв екрана, а сторінка виглядає повнішою.

Однак зараз усі 5 зображень використовують однакові модифікатори:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Коли ми бачимо повторюваний код, можна подумати про використання `extension` для його впорядкування.

## Використання extension для впорядкування стилю зображень

Ми можемо розширити `Image` методом, спеціально призначеним для фотогалереї:

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

Тут ми розширюємо тип `Image` методом `photoGalleryStyle`.

Цей метод містить раніше повторювані `.resizable()`, `.scaledToFit()` і `.frame(width: 300)`. Іншими словами, він об'єднує код масштабування зображення, пропорційного відображення та налаштування ширини.

Після використання цього розширення початковий код зображення:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

можна спростити до:

```swift
Image("1")
    .photoGalleryStyle()
```

Так кожне зображення має лише викликати `.photoGalleryStyle()`, щоб застосувати однаковий стиль фотогалереї. Код стає чистішим, а подальші єдині зміни виконувати зручніше.

## Розуміння self

У методі розширення ми написали `self`:

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

Тут `self` означає поточний екземпляр зображення, який викликає цей метод.

Наприклад:

```swift
Image("1")
    .photoGalleryStyle()
```

У цьому коді `photoGalleryStyle()` викликається через `Image("1")`, тому `self` усередині методу означає саме це зображення `Image("1")`.

Це можна просто розуміти так: хто викликає цей метод, того й представляє `self`.

Важливо зазначити, що модифікатори SwiftUI постійно повертають нові результати подання. Тому `photoGalleryStyle()` повертає модифіковане подання, а не просто початковий `Image`.

## Форми фотографій

Тепер фотографії вже можуть нормально відображатися. Однак за замовчуванням ці фотографії мають прямокутну форму, що виглядає досить звичайно.

Якщо потрібно лише додати фотографіям заокруглені кути, можна безпосередньо використати `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Результат відображення:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` означає додавання до зображення радіуса заокруглення `20 pt`. Для звичайних зображень із заокругленими кутами такого запису вже достатньо.

Однак `.cornerRadius()` може обробляти лише ефект заокруглених кутів і підходить для створення звичайних зображень із заокругленням. Якщо ми хочемо перетворити фотографії на більшу кількість різних форм, одного цього модифікатора недостатньо.

У такому разі потрібно використати `Shape` у SwiftUI. `Shape` може представляти різні графічні фігури, а в поєднанні з `clipShape` дає змогу обрізати зображення до відповідної форми.

## Розуміння Shape

У SwiftUI `Shape` означає графічну форму. Як і `View`, це дуже часто використовуваний тип у SwiftUI.

Поширені типи `Shape` включають коло, прямокутник, прямокутник із заокругленими кутами, капсулу та еліпс. Щоб наочніше побачити вигляд різних фігур, у наступних прикладах для кожної фігури встановлено різні кольори й розміри.

У цих прикладах `.fill()` використовується для заливання фігури кольором, а `.frame()` — для встановлення розміру відображення фігури. Кольори потрібні лише для розрізнення різних фігур і не є фіксованими кольорами самих фігур.

### Circle

`Circle` означає коло. Його часто використовують для аватарів, круглих кнопок, круглих зображень та інших ефектів інтерфейсу.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle

`Rectangle` означає прямокутник. Це одна з найпростіших фігур, яку також можна використовувати для створення фону, розділених областей або звичайних рамок.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle

`RoundedRectangle` означає прямокутник із заокругленими кутами. `cornerRadius` використовується для встановлення розміру заокруглення.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule

`Capsule` означає форму капсули. Її два кінці є дугами, тому її часто використовують для капсульних кнопок, фонів міток та інших ефектів інтерфейсу.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse

`Ellipse` означає еліпс. Він схожий на `Circle`, але коли ширина й висота різні, відображається як еліпс.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

З цих прикладів видно, що `Shape` сам по собі може безпосередньо відображатися як фігура. Далі ми використаємо ці типи `Shape` разом із `clipShape`, щоб обрізати фотографії та показати їх у різних формах.

## Використання clipShape для обрізання фотографій

Тепер ми можемо використовувати `clipShape`, щоб обрізати фотографії до різних форм.

Наприклад, обрізати першу фотографію до кола:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Цей код означає: спочатку відобразити зображення, а потім використати `Circle()`, щоб обрізати його до кола.

![view](../../../Resource/032_view2.png)

Базовий синтаксис `clipShape` такий:

```swift
.clipShape(форма)
```

Додайте `.clipShape(...)` після подання, а в дужках укажіть фігуру, до якої потрібно його обрізати.

Наприклад:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Тепер обріжемо 5 фотографій до різних форм:

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

Результат відображення:

![view](../../../Resource/032_view8.png)

Серед них результат обрізання за допомогою `Rectangle()` близький до звичайної прямокутної фотографії, тому візуальна зміна неочевидна. Він головним чином використовується для порівняння з іншими формами.

Тепер фотографії більше не є лише звичайними прямокутниками, а мають різні форми.

## Додавання рамок до фотографій

Якщо ми хочемо додати рамку до круглої фотографії, можемо подумати про використання `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Однак зазвичай у результаті отримується не кругла рамка, а прямокутна.

![view](../../../Resource/032_view9.png)

Це тому, що `border` додає рамку відповідно до прямокутної області подання, а не відповідно до форми після обрізання `clipShape`.

Тому, якщо ми хочемо отримати круглу рамку, не можна безпосередньо використовувати `border`.

## Використання strokeBorder для малювання рамок фігур

У SwiftUI `strokeBorder` може малювати внутрішні рамки для цих поширених типів `Shape`.

Наприклад, намалюємо круглу рамку:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Цей код означає: намалювати для `Circle` коричневу рамку з шириною `10 pt`.

![view](../../../Resource/032_view12.png)

Тут важливо зазначити, що `strokeBorder` не додає рамку безпосередньо до фотографії. Натомість він малює рамку для графічної фігури `Circle()`.

Іншими словами, цей код створює лише незалежну круглу рамку, яка ще не пов'язана з фотографією.

Якщо ми хочемо, щоб ця кругла рамка відображалася поверх фотографії, потрібно далі використати `overlay`, щоб накласти рамку на фотографію.

## Використання overlay для накладання рамок

`overlay` — це модифікатор подання, який може накладати нове подання поверх поточного подання.

Його базову структуру можна розуміти так:

```swift
Поточне подання
    .overlay {
        Накладене подання
    }
```

У цьому прикладі поточне подання — це фотографія, яку вже обрізано до кола:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Нове подання, яке ми хочемо накласти, — це кругла рамка:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Отже, можна поєднати фотографію й рамку:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Тут `overlay` означає накладання нового подання поверх поточного подання.

В `overlay` рамка накладається відповідно до області відображення поточної фотографії, тому немає потреби окремо задавати `frame`. Поки форма рамки збігається з формою обрізання, рамка точно прилягатиме до фотографії.

![view](../../../Resource/032_view10.png)

Кінцевий ефект такий: кругла рамка накриває круглу фотографію зверху.

Порівняно із `ZStack`, `overlay` більше підходить для сценарію «додати декор до поточного подання». Фотографія є основним об'єктом, а рамка — лише додатковим ефектом, тому використання `overlay` робить код зрозумілішим.

## Завершення фотогалереї

Тепер додамо до кожної фотографії відповідну форму й рамку:

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

Результат відображення:

![view](../../../Resource/032_view13.png)

Так базову сторінку фотогалереї завершено.

На цій сторінці ми використовуємо `ScrollView` для реалізації прокручуваного відображення, `Image` — для показу фотографій, `clipShape` — для обрізання форми фотографій, а `overlay` і `strokeBorder` — для додавання рамок.

## Повний код

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

## Підсумок

У цьому уроці ми завершили сторінку фотогалереї.

![view](../../../Resource/032_view13.png)

У цьому прикладі ми спочатку використали `Image` для відображення фотографій, а потім через `extension` розширили `Image` методом `photoGalleryStyle`, щоб упорядкувати повторюваний код стилю зображень.

Далі ми вивчили поширені типи `Shape` у SwiftUI, наприклад `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` і `Ellipse`. Ці фігури можна не лише відображати безпосередньо, а й використовувати разом із `clipShape` для обрізання подань.

Наприклад:

```swift
.clipShape(Circle())
```

означає обрізати подання до кола.

Нарешті, ми використали `overlay` і `strokeBorder`, щоб додати до фотографій рамки відповідної форми. Важливо зазначити, що `border` зазвичай малює рамку відповідно до прямокутної області подання. Якщо потрібно, щоб рамка повторювала коло, капсулу або еліпс, краще накласти такий самий `Shape`.

Завдяки цьому уроку ми не лише створили ефект фотогалереї, а й зрозуміли поширене поєднання `Shape`, `clipShape`, `strokeBorder` і `overlay` в інтерфейсах.

## Післяурочні вправи

### 1. Додати фон фотогалереї

Додайте до сторінки фотогалереї повноекранне фонове зображення.

Вимога: фонове зображення має заповнювати весь екран і ігнорувати безпечну область.

### 2. Градієнтна рамка

Змініть наявні одноколірні рамки на лінійні градієнтні рамки.

Можна спробувати використати `LinearGradient`, щоб створити багатші ефекти рамки.

### 3. Імітована фоторамка

Пошукайте в інтернеті стилі справжніх фоторамок і спробуйте використати `overlay`, щоб накласти рамки-зображення, завдяки чому фотографії виглядатимуть ближче до справжніх рамок.

Результат відображення вправи:

![button](../../../Resource/032_view15.jpeg)

### 4. Реалізувати рамку кнопки із заокругленими кутами

У реальній розробці кнопки часто використовують рамки у вигляді прямокутника із заокругленими кутами.

Спробуйте створити кнопку із заокругленими кутами та використати `RoundedRectangle` і `strokeBorder`, щоб додати до кнопки заокруглену рамку.

Результат відображення вправи:

![button](../../../Resource/032_view14.png)

### Питання для роздумів

Якщо ви не хочете використовувати одноколірну рамку або градієнтну рамку, а хочете, щоб рамка мала певний візерунковий ефект, як це реалізувати?

Можна спробувати пошукати матеріали й дізнатися про пов'язані способи використання, такі як `overlay`, `mask` або `ImagePaint`.

Результат відображення вправи:

![button](../../../Resource/032_view16.png)
