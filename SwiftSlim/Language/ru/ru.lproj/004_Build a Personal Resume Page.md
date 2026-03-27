# Создание страницы личного резюме

В этом уроке мы создадим простое представление личного резюме и изучим следующие темы:

- cornerRadius
- spacing
- ScrollView

В процессе создания мы повторим работу с макетами, Text и Image, а также реализуем управление отступами и эффект прокрутки содержимого.

## Личное резюме

Целевой результат:

![Swift](../../RESOURCE/004_img.png)

**Сначала попробуйте выполнить задачу самостоятельно, а затем переходите к разбору ниже.**

### Создание проекта

Создайте новый iOS-проект или продолжайте использовать тот, который создавали ранее.

Код ContentView по умолчанию:

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
````

Теперь очистите код и начните писать своё содержимое:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Общая структура

В реальной разработке мы обычно сначала проектируем общую структуру.

Наша страница содержит:

1. заголовок
2. личную информацию
3. личное описание

Снаружи добавим VStack:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack позволяет расположить представления вертикально, а также управлять их порядком и расстояниями между ними.

### Заголовок

Сначала создадим Text для отображения заголовка.

Здесь я использую в качестве заголовка своё английское имя:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Обычно заголовок делают крупнее и жирнее, поэтому здесь используются модификаторы font и fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Компоновка

По умолчанию в SwiftUI выравнивание — по центру, поэтому сейчас заголовок отображается в середине ContentView.

![Swift](../../RESOURCE/004_img3.png)

Нам нужно разместить заголовок в верхней части представления. Для этого можно использовать Spacer:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer занимает оставшееся пространство и выталкивает Text вверх внутри контейнера.

![Swift](../../RESOURCE/004_img4.png)

### Свободное пространство

Если вам кажется, что текст расположен слишком близко к верхнему краю, можно использовать padding или Spacer.

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

Это задаёт верхний отступ 20 для VStack.

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

Также можно использовать Spacer и задать ему высоту через frame, чтобы получить пустое пространство фиксированной высоты.

Результат:

![Swift](../../RESOURCE/004_img5.png)

### Изображение

Подготовим свою фотографию и поместим её в папку ресурсов Assets.

![Swift](../../RESOURCE/004_img6.png)

В ContentView используем Image для отображения фотографии:

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

Поскольку исходный размер изображения довольно большой, нам нужно использовать frame, чтобы управлять его размером на экране.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Здесь мы увидим проблему:

если соотношение ширины и высоты у frame не совпадает с исходным соотношением сторон изображения, изображение деформируется.

Например:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Чтобы избежать искажения, нужно использовать scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Функция scaledToFit заключается в следующем:

в пределах заданного frame изображение масштабируется с сохранением исходных пропорций и полностью отображается.

Оно не растягивается принудительно, чтобы заполнить весь frame, а сохраняет отношение ширины к высоте и масштабируется пропорционально, пока одна из сторон не совпадёт с границей.

Это означает:

* если ширина frame меньше, изображение будет масштабироваться относительно ширины
* если высота frame меньше, изображение будет масштабироваться относительно высоты
* изображение всегда сохраняет исходные пропорции и не деформируется

Обычно достаточно задать размер только по одному направлению. Например:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

В этом случае система автоматически вычислит подходящую высоту на основе ширины 140, сохранив пропорции изображения.

Если нужно зафиксировать визуальные пропорции или избежать сжатия в более сложном макете, можно ограничить и ширину, и высоту одновременно.

### Скругление углов

Если вы хотите, чтобы изображение отображалось со скруглёнными углами, можно использовать модификатор cornerRadius:

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

Добавьте cornerRadius(20) после модификаторов Image.

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) означает, что границы представления будут обрезаны с применением радиуса скругления 20.

После добавления скругления четыре угла изображения станут закруглёнными, и визуально оно будет выглядеть мягче и современнее.

Такой стиль очень распространён в современном интерфейсном дизайне. Например, иконки приложений в iOS имеют форму скруглённого прямоугольника, хотя системные иконки используют непрерывную кривизну суперэллипса, а не простое скругление углов.

### Личная информация

Теперь начнём реализовывать блок личной информации слева от изображения. По структуре интерфейса видно, что личная информация и изображение расположены по горизонтали, поэтому нужно использовать HStack.

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

Содержимое личной информации расположено вертикально.

![Swift](../../RESOURCE/004_img11.png)

Поэтому снаружи используется HStack, для блока личной информации — VStack, а текст отображается через Text.

Базовая структура:

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

**Жирное начертание названий полей**

Чтобы визуально отделить названия полей от их значений, для названий можно использовать fontWeight:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Выравнивание текста по левому краю**

По умолчанию VStack выравнивает содержимое по центру. Если нужно, чтобы весь текст был выровнен по левому краю, следует указать alignment:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading означает выравнивание по левой стороне в языковой среде с направлением слева направо.

![Swift](../../RESOURCE/004_img14.png)

### Расстояние между элементами

Если вы хотите оставить фиксированное расстояние между блоком личной информации и изображением, ранее мы изучали использование Spacer для создания пустого пространства:

```swift
Spacer()
    .frame(width: 10)
```

Также можно использовать параметр spacing у HStack:

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

spacing: 30 означает, что расстояние между двумя дочерними представлениями будет равно 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Что такое spacing?**

В VStack, HStack и ZStack параметр spacing управляет расстоянием между дочерними представлениями.

Например:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Расстояние между дочерними представлениями внутри VStack будет установлено в 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Нужно обратить внимание, что spacing действует только на **непосредственные дочерние представления** и не влияет на компоновку внутри вложенных контейнеров.

**Управление расстоянием внутри списка**

Если нужно увеличить расстояние между полями, самый прямой способ — задать spacing у VStack:

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

В этом случае расстояние между всеми дочерними представлениями станет 10 pt.

Но если посмотреть на интерфейс, появится проблема:

между группами полей будет отступ, и при этом между названием поля и его значением тоже появится такой же отступ.

Это происходит потому, что spacing действует на все непосредственные дочерние представления текущего контейнера.

В этой структуре каждый Text является непосредственным дочерним элементом внешнего VStack, поэтому расстояние везде одинаковое.

Если вы хотите, чтобы расстояние было только между группами полей, а между названием поля и значением оставался компактный интервал по умолчанию, можно рассматривать «название поля + значение поля» как логическую группу и обернуть её во внутренний VStack:

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

Теперь структура меняется: между внутренними VStack внешнего уровня есть расстояние, а внутри каждого вложенного VStack остаётся стандартный компактный интервал. Поэтому между названием поля и его значением не возникает лишнего промежутка.

![Swift](../../RESOURCE/004_img18.png)

### Личное описание

Далее реализуем область личного описания.

По структуре интерфейса видно, что содержимое описания состоит из нескольких строк текста, расположенных вертикально.

![Swift](../../RESOURCE/004_img19.png)

Поэтому можно использовать VStack вместе с Text:

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

**Увеличение расстояния**

Сейчас блок личной информации и блок личного описания расположены довольно плотно, и внешний вид получается не очень аккуратным.

![Swift](../../RESOURCE/004_img20.png)

Поскольку они находятся внутри одного внешнего контейнера, можно управлять общим расстоянием на уровне внешнего контейнера:

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

**Расстояние внутри списка**

Используйте spacing, чтобы задать расстояние между строками личного описания:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Завершение страницы резюме

Теперь базовый каркас нашего личного резюме уже готов.

![Swift](../../RESOURCE/004_img.png)

### ScrollView — прокручиваемое представление

Сейчас структура страницы основана на VStack, и когда текста в описании немного, всё работает нормально. Но если увеличить количество строк до 20, 30 или больше, высота содержимого превысит экран.

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

Тогда возникнут два явления:

* нижняя часть содержимого будет обрезана
* страницу нельзя будет прокручивать

Это не проблема VStack. VStack — это просто контейнер компоновки, он сам по себе не добавляет возможность прокрутки.

**Что такое ScrollView**

ScrollView — это прокручиваемый контейнер, который подходит для большого объёма содержимого, выходящего за пределы экрана. Например, для вертикальных или горизонтальных списков.

Базовая структура:

```swift
ScrollView {
    ...
}
```

Если вы хотите реализовать прокрутку, нужно обернуть всё содержимое страницы в ScrollView:

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

Так вся страница становится одной прокручиваемой областью, и когда содержимое превышает высоту экрана, его можно естественно прокручивать.

По умолчанию ScrollView показывает индикатор прокрутки. Если вы хотите скрыть его, можно указать:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Полный код

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