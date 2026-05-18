# Энциклопедия животных 

В этом уроке мы продолжим практиковать пользовательские представления и передачу данных.

Мы создадим простое представление энциклопедии животных. На странице будут показаны пять животных. При нажатии на одно из них появится подробное представление с изображением животного, областью распространения, средой обитания и описанием.

Итоговый результат:

![view](../../../Resource/029_view.png)

На этом примере мы сможем потренировать совместную работу структуры данных, отображения списка, взаимодействия по нажатию и всплывающего представления Sheet.

## Подготовка изображений

Сначала нам нужно подготовить пять изображений животных:

- Дельфин: `dolphin.jpg`
- Жираф: `giraffe.jpg`
- Лев: `lion.jpg`
- Панда: `panda.jpg`
- Белый медведь: `polarBear.jpg`

Можно использовать следующие изображения:

[Дельфин](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Жираф](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Лев](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Панда](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Белый медведь](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

После загрузки изображений перетащите их в папку ресурсов `Assets` проекта Xcode.

![assets](../../../Resource/029_assets.png)

Важно учитывать, что при использовании изображения в коде обычно не нужно писать суффикс `.jpg`.

Например, если имя ресурса изображения — `dolphin`, в коде пишем так:

```swift
Image("dolphin")
```

Если имя изображения написано неправильно, изображение не сможет нормально отображаться.

Примечание: указанные выше изображения взяты из проектов Wikimedia. При использовании рекомендуется сохранять ссылку на оригинал и информацию об источнике.

## Создание структуры животного

На этой странице у каждого животного есть несколько видов информации:

- Название животного
- Изображение животного
- Эмодзи животного
- Область распространения
- Среда обитания
- Описание животного

Если разбросать эту информацию по множеству переменных, код станет довольно запутанным. Поэтому мы можем создать структуру `Animal` и собрать информацию об одном животном в одном месте.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

В этом коде:

- `id`: уникальный идентификатор животного.
- `name`: название животного.
- `imageName`: имя изображения животного.
- `avatarEmoji`: эмодзи животного.
- `distributionArea`: область распространения.
- `habitat`: среда обитания.
- `animalDescription`: описание животного.

Среди них:

```swift
let id = UUID()
```

`id` используется для идентификации каждого животного. Поскольку далее мы будем использовать `ForEach` для отображения списка животных, а также `.sheet(item:)` для показа деталей выбранного животного, нужно, чтобы `Animal` соответствовал протоколу `Identifiable`.

Назначение `Identifiable` — сообщить SwiftUI: у каждого животного есть `id`, по которому можно различать его идентичность.

## Создание данных животных

Далее мы создадим массив животных в `ContentView`.

В массиве хранится пять значений `Animal`, и каждое значение `Animal` представляет одно животное.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Дельфин
        Animal(
            name: "Дельфин",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Тёплые и умеренные океаны по всему миру.",
            habitat: "Океаны, прибрежные воды и некоторые крупные реки.",
            animalDescription: "Дельфины — умные морские млекопитающие. Они живут группами, общаются с помощью звуков и известны своим игривым поведением."
        ),
        // Жираф
        Animal(
            name: "Жираф",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Саванны и открытые редколесья Африки.",
            habitat: "Луга, саванны и открытые леса.",
            animalDescription: "Жирафы — самые высокие наземные животные. У них длинные шеи, длинные ноги, и обычно они питаются листьями высоких деревьев."
        ),
        // Лев
        Animal(
            name: "Лев",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "В основном встречается в Африке к югу от Сахары, небольшая популяция есть в западной Индии.",
            habitat: "Луга, саванны и открытые редколесья.",
            animalDescription: "Львы — сильные большие кошки. Обычно они живут группами, которые называются прайдами, и часто известны как цари животного мира."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Горные леса центрального Китая.",
            habitat: "Бамбуковые леса в прохладных и влажных горных районах.",
            animalDescription: "Панды — медведи, известные своей чёрно-белой шерстью. Они в основном едят бамбук и являются одними из самых узнаваемых животных в мире."
        ),
        // Белый медведь
        Animal(
            name: "Белый медведь",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Арктические регионы вокруг Северного полюса.",
            habitat: "Морской лёд, прибрежные районы и холодная арктическая среда.",
            animalDescription: "Белые медведи — крупные медведи, приспособленные к холодной среде. Они хорошо плавают и в основном зависят от морского льда при охоте на тюленей."
        )
    ]

    var body: some View {
        Text("Энциклопедия животных")
    }
}
```

Здесь `animals` — это массив:

```swift
let animals: [Animal]
```

`[Animal]` означает, что в этом массиве хранится несколько значений `Animal`.

То есть `animals` — это не одно животное, а группа животных.

## Отображение списка животных

Теперь мы можем использовать `ForEach` для отображения списка животных.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Результат отображения:

![view](../../../Resource/029_view1.png)

В этом коде:

```swift
ForEach(animals) { animal in
    ...
}
```

означает перебор массива `animals`.

При каждом проходе цикла `animal` означает текущее животное, которое отображается.

Например, при первом проходе `animal` — это дельфин; при втором проходе `animal` — это жираф.

Поэтому мы можем отображать информацию о текущем животном следующим образом:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Так можно вывести пять животных.

## Сделать список животных кликабельным

Теперь список уже отображается, но по нему ещё нельзя нажимать.

Если мы хотим показывать детали после нажатия на определённое животное, сначала нужно записать «текущее выбранное животное».

Поэтому добавим в `ContentView` переменную состояния:

```swift
@State private var selectedAnimal: Animal? = nil
```

Здесь `selectedAnimal` — это опциональный тип `Animal?`.

Это означает, что в нём может быть одно животное, а может и не быть животного.

Значение по умолчанию — `nil`, то есть в начале не выбрано ни одно животное.

Затем мы изменим каждую строку животного на `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Главная строка — это этот код:

```swift
selectedAnimal = animal
```

Когда пользователь нажимает на определённое животное, мы сохраняем это животное в `selectedAnimal`.

Например, пользователь нажимает на дельфина, и в `selectedAnimal` сохраняется дельфин.

Пользователь нажимает на панду, и в `selectedAnimal` сохраняется панда.

Иными словами, `selectedAnimal` используется для записи того, на какое животное пользователь нажал сейчас.

## Всплывающее представление Sheet

Теперь мы уже можем с помощью кнопки записывать «текущее нажатое животное».

Далее нужно реализовать всплывающее представление для отображения деталей животного.

![view](../../../Resource/029_view2.png)

В SwiftUI для такого всплывающего эффекта можно использовать `Sheet`.

`Sheet` можно понимать как временно всплывающую страницу. Она отображается поверх текущей страницы, а после просмотра пользователь может смахнуть её вниз, чтобы закрыть.

## Пример Sheet

Перед тем как действительно показывать детали животного, сначала на простом примере разберём, как появляется `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Показать Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Представление Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Результат отображения:

![view](../../../Resource/029_view3.png)

В этом коде мы создали булево значение:

```swift
@State private var showSheet = false
```

`showSheet` по умолчанию равно `false`, то есть сначала `Sheet` не отображается.

Когда нажимаем кнопку:

```swift
showSheet.toggle()
```

`toggle()` означает переключение булевого значения.

Если раньше было `false`, после вызова `toggle()` станет `true`.

Если раньше было `true`, после вызова `toggle()` станет `false`.

Поэтому после нажатия кнопки `showSheet` изменится с `false` на `true`.

Когда `showSheet` становится `true`, следующий код показывает `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Представление Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Этот код означает: когда `showSheet` равно `true`, показать `Sheet` и внутри `Sheet` отобразить `Text("Представление Sheet")`.

Результат отображения:

![view](../../../Resource/029_view4.png)

Такая запись подходит для показа фиксированного содержимого.

Например, после нажатия кнопки можно показать страницу настроек, страницу описания, страницу подсказки и так далее.

### Место размещения Sheet

Хотя `Sheet` является всплывающим представлением, в SwiftUI оно не записывается напрямую как отдельное представление вроде `Text()` или `Image()`, а используется как модификатор представления.

То есть `.sheet(...)`, как и `.font()`, `.padding()`, `.shadow()`, нужно добавлять после некоторого представления.

Например:

```swift
Button("Показать Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Представление Sheet")
}
```

В этом примере `.sheet` добавлен после `Button`.

Когда `showSheet` становится `true`, SwiftUI показывает `Sheet` и отображает содержимое внутри фигурных скобок:

```swift
Text("Представление Sheet")
```

Однако в реальной разработке, если на странице есть несколько кнопок, обычно не добавляют `.sheet` к каждой кнопке.

Более распространённый подход — добавлять `.sheet` после внешнего представления.

Например:

```swift
VStack {
    Button("Показать Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Представление Sheet")
}
```

Кнопка отвечает за изменение `showSheet`, а внешнее представление отвечает за показ `Sheet` в зависимости от того, равно ли `showSheet` значению `true`.

## Sheet с привязкой опционального значения

Запись, которую мы изучили выше:

```swift
.sheet(isPresented: $showSheet) {
    Text("Представление Sheet")
}
```

Эта запись подходит для управления показом и скрытием одной фиксированной страницы.

Но в примере с энциклопедией животных нам нужно знать не только «показывать ли `Sheet`», но и «на какое животное нажали».

Например:

Пользователь нажал на дельфина, значит в `Sheet` должны отображаться детали дельфина.

Пользователь нажал на панду, значит в `Sheet` должны отображаться детали панды.

Поэтому здесь больше подходит другая запись Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Содержимое, отображаемое в Sheet
}
```

В этом коде `Sheet` привязан к опциональному значению `selectedAnimal`.

Здесь важно заметить: после `item:` пишется `$selectedAnimal`, а не `selectedAnimal`.

Потому что `Sheet` не только читает значение `selectedAnimal`, но и должен по его изменению решать, нужно ли показываться.

Этот код можно понимать так:

- Когда `selectedAnimal` равно `nil`, `Sheet` не отображается.
- Когда у `selectedAnimal` есть значение, `Sheet` отображается.
- Когда `Sheet` закрывается, SwiftUI снова меняет `selectedAnimal` на `nil`.

SwiftUI передаст животное, сохранённое в `selectedAnimal`, в `animal` внутри фигурных скобок.

Иными словами, `.sheet(item:)` не только управляет появлением, но и передаёт выбранные данные в `Sheet`.

## Использование Sheet для отображения названия животного

Теперь не будем сразу создавать сложное подробное представление.

Чтобы код было легче понять, сначала отобразим в `Sheet` название текущего животного.

Добавьте `.sheet(item:)` снаружи `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Самая важная часть здесь — этот код:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Когда у `selectedAnimal` есть значение, `Sheet` появляется.

`animal` внутри фигурных скобок — это текущее выбранное животное.

Поэтому:

```swift
Text(animal.name)
```

отобразит название текущего нажатого животного.

Например, нажимаем `Дельфин`, и в Sheet отображается `Дельфин`.

Нажимаем `Панда`, и в `Sheet` отображается `Панда`.

Так мы реализовали эффект: при нажатии на разные животные появляется название соответствующего животного.

Отображение названия животного:

![view](../../../Resource/029_view5.png)

Однако детали животного не должны показывать только одно название. Они должны показывать название, область распространения, среду обитания и описание.

Если весь этот код написать прямо внутри `.sheet`, код станет очень длинным и неудобным для чтения.

Поэтому далее мы создадим новое пользовательское представление, которое будет специально отвечать за отображение деталей животного.

## Создание подробного представления животного

Далее мы создадим новое пользовательское представление `AnimalDetailView`.

Это представление принимает один `Animal` и отображает детали животного.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Область распространения**: \(animal.distributionArea)")

                    Divider()

                    Text("**Среда обитания**: \(animal.habitat)")

                    Divider()

                    Text("**Описание животного**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Результат отображения:

![view](../../../Resource/029_view2.png)

Главное здесь:

```swift
var animal: Animal
```

Это означает, что `AnimalDetailView` должен получить одно животное извне.

После получения животного подробное представление может использовать разную информацию об этом животном:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

То есть `AnimalDetailView` отвечает только за отображение переданного в него животного.

### Жирный текст Markdown

В подробном представлении мы написали такой код:

```swift
Text("**Среда обитания:** \(animal.habitat)")
```

Здесь есть два важных момента.

Во-первых, `**Среда обитания:**` использует синтаксис `Markdown`. Текст, заключённый в две звёздочки, будет отображаться жирным.

Во-вторых, `\()` — это строковая интерполяция, которая позволяет показать значение переменной в тексте.

Этот код означает: сначала показать жирным текст `Среда обитания:`, а затем показать среду обитания этого животного.

## Отображение подробного представления в Sheet

После создания `AnimalDetailView` мы можем вернуться в `ContentView` и заменить исходное представление с названием внутри `Sheet` на подробное представление.

Изначально было так:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Теперь изменим на:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Здесь `animal:` — имя параметра `AnimalDetailView`.

Следующее `animal` — это текущее животное, переданное из `.sheet(item:)`.

То есть мы передаём текущее нажатое животное в `AnimalDetailView` для отображения.

Полная структура:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Когда пользователь нажимает на животное:

```swift
selectedAnimal = animal
```

`selectedAnimal` меняется с `nil` на конкретное животное, и после того как `Sheet` обнаруживает, что у `selectedAnimal` есть значение, он показывает представление.

`Sheet` передаёт животное из `selectedAnimal` в представление `AnimalDetailView`, а `AnimalDetailView` отображает детали животного.

Так мы реализовали функцию: нажать на список животных и показать детали соответствующего животного.

## Разница между двумя способами записи Sheet

Теперь мы уже использовали `.sheet(item:)`, чтобы завершить отображение подробного представления животного.

Здесь можно кратко подытожить две распространённые записи `Sheet`.

### Первый способ — привязка булевого значения

```swift
@State private var showSheet = false

Button("Показать Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Представление Sheet")
}
```

Эта запись подходит для показа фиксированного содержимого, например страницы настроек, страницы описания, страницы подсказки и так далее.

`showSheet` — это булево значение, у которого есть только два состояния: `true` и `false`.

Когда `showSheet` равно `true`, `Sheet` отображается.

Когда `showSheet` равно `false`, `Sheet` не отображается.

### Второй способ — привязка опционального значения

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Эта запись подходит для показа разного содержимого на основе выбранных данных.

В этом уроке мы нажимаем на разных животных и должны показывать детали разных животных, поэтому использовать `.sheet(item:)` более уместно.

## Полный код

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Название животного
    let name: String
    
    // Изображение животного
    let imageName: String
    
    // Символ-метка животного
    let avatarEmoji: String
    
    // Область распространения
    let distributionArea: String
    
    // Среда обитания
    let habitat: String
    
    // Описание животного
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Дельфин
        Animal(
            name: "Дельфин",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Тёплые и умеренные океаны по всему миру.",
            habitat: "Океаны, прибрежные воды и некоторые крупные реки.",
            animalDescription: "Дельфины — умные морские млекопитающие. Они живут группами, общаются с помощью звуков и известны своим игривым поведением."
        ),
        // Жираф
        Animal(
            name: "Жираф",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Саванны и открытые редколесья Африки.",
            habitat: "Луга, саванны и открытые леса.",
            animalDescription: "Жирафы — самые высокие наземные животные. У них длинные шеи, длинные ноги, и обычно они питаются листьями высоких деревьев."
        ),
        // Лев
        Animal(
            name: "Лев",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "В основном встречается в Африке к югу от Сахары, небольшая популяция есть в западной Индии.",
            habitat: "Луга, саванны и открытые редколесья.",
            animalDescription: "Львы — сильные большие кошки. Обычно они живут группами, которые называются прайдами, и часто известны как цари животного мира."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Горные леса центрального Китая.",
            habitat: "Бамбуковые леса в прохладных и влажных горных районах.",
            animalDescription: "Панды — медведи, известные своей чёрно-белой шерстью. Они в основном едят бамбук и являются одними из самых узнаваемых животных в мире."
        ),
        // Белый медведь
        Animal(
            name: "Белый медведь",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Арктические регионы вокруг Северного полюса.",
            habitat: "Морской лёд, прибрежные районы и холодная арктическая среда.",
            animalDescription: "Белые медведи — крупные медведи, приспособленные к холодной среде. Они хорошо плавают и в основном зависят от морского льда при охоте на тюленей."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Область распространения**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Среда обитания**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Описание животного**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Итоги

В этом уроке мы завершили простую страницу энциклопедии животных.

Сначала мы использовали структуру `Animal` для хранения информации о животном, затем массив для хранения пяти животных, а потом `ForEach` для отображения списка животных.

Когда пользователь нажимает на определённое животное, мы сохраняем это животное в `selectedAnimal`:

```swift
selectedAnimal = animal
```

Когда у `selectedAnimal` есть значение, `.sheet(item:)` показывает подробное представление и передаёт выбранное животное в `AnimalDetailView`.

Самое важное в этом уроке — не стиль интерфейса, а понимание этого маршрута передачи данных:

```swift
Нажатие на животное → selectedAnimal сохраняет животное → Sheet появляется → AnimalDetailView показывает детали
```

После понимания этого маршрута в будущем можно создавать больше похожих функций, например детали товара, детали урока, детали статьи, детали контакта и так далее.
