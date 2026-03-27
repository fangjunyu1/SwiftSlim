# Створення сторінки особистого резюме

У цьому уроці ми створимо просте view особистого резюме та вивчимо такі теми:

* cornerRadius
* spacing
* ScrollView

У процесі побудови ми повторимо знання про макети, Text і Image, а також реалізуємо керування відступами та ефект прокручування вмісту.

## Особисте резюме

Цільовий результат:

![Swift](../../RESOURCE/004_img.png)

**Спочатку спробуйте виконати завдання самостійно, а вже потім читайте пояснення нижче.**

### Створення проєкту

Створіть новий iOS-проєкт або продовжуйте працювати з попереднім проєктом.

Стандартний код ContentView:

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

Тепер очистьте код і почніть писати власний вміст:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Загальна структура

У реальній розробці ми зазвичай спочатку проєктуємо загальну структуру.

Наша сторінка містить:

1. заголовок
2. особисту інформацію
3. особистий опис

Додамо на зовнішньому рівні VStack:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack дозволяє впорядкувати view по вертикалі, а також керувати розташуванням і відстанями між ними.

### Заголовок

Спочатку створимо Text для показу заголовка.

Тут я використовую своє англомовне ім’я як заголовок:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Зазвичай заголовок роблять більшим і жирнішим, тому тут використаємо модифікатори font і fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Компонування

У SwiftUI вирівнювання за замовчуванням — center, тому зараз заголовок відображається в центрі ContentView.

![Swift](../../RESOURCE/004_img3.png)

Нам потрібно, щоб заголовок був розташований у верхній частині view. Для цього можна скористатися Spacer і скоригувати макет:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer займе залишковий простір і посуне Text у верхню частину контейнера.

![Swift](../../RESOURCE/004_img4.png)

### Вільний простір

Якщо вам здається, що текст занадто близько до верхнього краю, можна використати padding або Spacer.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Це задає верхній відступ 20 для VStack.

**2. Spacer**

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

Також можна використати Spacer і задати йому висоту через frame, щоб отримати вільний простір заданого розміру.

Результат:

![Swift](../../RESOURCE/004_img5.png)

### Зображення

Підготуйте своє портретне фото і додайте його в папку ресурсів Assets.

![Swift](../../RESOURCE/004_img6.png)

У ContentView скористайтеся Image для показу зображення:

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

Оскільки оригінальний розмір зображення досить великий, нам потрібно використати frame для керування його розміром.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

У цей момент ми побачимо одну проблему:

якщо співвідношення width і height у frame не збігається з початковими пропорціями зображення, воно буде деформоване.

Наприклад:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Щоб уникнути деформації, потрібно використати scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Призначення scaledToFit таке:

у межах заданого frame зображення масштабується зі збереженням своїх початкових пропорцій і повністю відображається.

Воно не розтягує зображення примусово на весь frame, а зберігає співвідношення ширини й висоти та масштабує його пропорційно, доки одна зі сторін не торкнеться межі.

Це означає:

* якщо width у frame менший, масштабування відбуватиметься від ширини;
* якщо height у frame менший, масштабування відбуватиметься від висоти;
* зображення завжди зберігатиме початкові пропорції й не буде деформованим.

Зазвичай достатньо задати розмір лише в одному напрямку. Наприклад:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

У такому разі система автоматично обчислить відповідну висоту для width = 140 і збереже пропорції зображення.

Якщо потрібно зафіксувати візуальні пропорції або уникнути стиснення в складному макеті, можна одночасно обмежити і width, і height.

### Закруглені кути

Якщо ви хочете, щоб зображення мало закруглені кути, можна використати модифікатор cornerRadius:

```swift
.cornerRadius(10)
```

Наприклад:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Додайте cornerRadius(20) після модифікаторів Image.

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) означає, що межі view буде обрізано із застосуванням радіуса закруглення 20.

Після додавання закруглення чотири кути зображення стають округлими, і візуальний стиль виглядає м’якшим і сучаснішим.

Такий стиль дизайну дуже поширений у сучасних інтерфейсах. Наприклад, іконки застосунків в iOS мають форму прямокутника із закругленими кутами (хоча системні іконки використовують супереліпс із безперервною кривизною, а не просте закруглення).

### Особиста інформація

Тепер почнемо створювати область особистої інформації ліворуч від зображення. Із структури інтерфейсу видно, що особиста інформація та зображення розташовані горизонтально, тому потрібно використати HStack.

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

Вміст особистої інформації розташовується вертикально.

![Swift](../../RESOURCE/004_img11.png)

Отже, зовнішній контейнер має бути HStack, для особистої інформації використовується VStack, а текстовий вміст показується через Text.

Базова структура:

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

**Зробити назви полів жирними**

Щоб відрізняти назву поля від його значення, можна застосувати fontWeight до назви поля:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Вирівнювання тексту по лівому краю**

За замовчуванням VStack вирівнює вміст по центру. Якщо потрібно, щоб увесь текст був вирівняний по лівому краю, слід задати alignment:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading означає вирівнювання по лівому краю (у середовищі з мовами зліва направо).

![Swift](../../RESOURCE/004_img14.png)

### Інтервали

Якщо потрібно залишити фіксований інтервал між особистою інформацією і зображенням, раніше ми вивчали використання Spacer для створення порожнього простору:

```swift
Spacer()
    .frame(width: 10)
```

Також можна використати параметр spacing у HStack:

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

spacing: 30 означає, що відстань між двома дочірніми view дорівнює 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Що таке spacing?**

У VStack, HStack і ZStack параметр spacing дозволяє керувати відстанню між дочірніми view.

Наприклад:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Усі дочірні view всередині VStack матимуть відстань 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Слід звернути увагу, що spacing впливає лише на "безпосередні дочірні view" і не змінює макет усередині вкладених контейнерів.

**Керування інтервалами всередині списку**

Якщо потрібно збільшити відстань між полями, найпряміший спосіб — задати spacing для VStack:

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

Тоді відстань між усіма дочірніми view стане 10 pt.

Але, якщо придивитися до інтерфейсу, можна помітити одну проблему:

між групами полів з’являється відстань, але така сама відстань виникає і між назвою поля та його значенням.

Це тому, що spacing діє на всі безпосередні дочірні view поточного контейнера.

У цій структурі кожен Text є безпосереднім дочірнім view зовнішнього VStack, тому інтервали однакові для всіх.

Якщо потрібно, щоб відстань була між групами полів, а між назвою поля і значенням залишався щільний стандартний інтервал, можна розглядати "назва поля + значення поля" як єдину логічну групу й обгорнути її окремим VStack:

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

Тепер структура змінюється так: між зовнішніми VStack є відстань, а між елементами у внутрішніх VStack залишається стандартний щільний інтервал, тому між назвою поля та значенням не з’являється зайвий проміжок.

![Swift](../../RESOURCE/004_img18.png)

### Особистий опис

Далі реалізуємо область особистого опису.

З точки зору структури інтерфейсу, вміст опису складається з кількох рядків тексту, розташованих вертикально.

![Swift](../../RESOURCE/004_img19.png)

Тому можна використати VStack разом із Text:

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

**Збільшення відстаней**

Зараз блок особистої інформації та блок особистого опису розміщені досить щільно, і це виглядає не дуже естетично.

![Swift](../../RESOURCE/004_img20.png)

Оскільки обидві частини знаходяться в одному зовнішньому контейнері, можна керувати загальною відстанню саме на рівні зовнішнього контейнера:

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

Результат:

![Swift](../../RESOURCE/004_img21.png)

**Інтервали у списку**

Використайте spacing для задання відстані між рядками особистого опису:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Завершення особистого резюме

Тепер базова структура нашого особистого резюме вже готова.

![Swift](../../RESOURCE/004_img.png)

### Прокручуване view

Зараз структура сторінки побудована на VStack, і якщо рядків опису небагато, усе працює нормально. Але якщо збільшити їх кількість до 20, 30 або навіть більше, висота вмісту перевищить висоту екрана.

Наприклад:

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

У такому випадку виникають два явища:

* нижня частина вмісту обрізається
* сторінка не прокручується

Це не проблема VStack, тому що VStack — лише контейнер для макета, і він не надає можливість прокручування автоматично.

**Що таке ScrollView**

ScrollView — це контейнер із можливістю прокручування, який підходить для великого вмісту, що виходить за межі екрана. Наприклад, для вертикальних або горизонтальних списків.

Базова структура:

```swift
ScrollView {
    ...
}
```

Якщо ми хочемо реалізувати ефект прокручування, потрібно обгорнути весь вміст сторінки в ScrollView:

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

Тоді вся сторінка стане єдиною прокручуваною областю, і коли вміст перевищить висоту екрана, його можна буде природно прокручувати.

За замовчуванням ScrollView показує індикатор прокручування. Якщо потрібно його приховати, можна задати:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Повний код

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
