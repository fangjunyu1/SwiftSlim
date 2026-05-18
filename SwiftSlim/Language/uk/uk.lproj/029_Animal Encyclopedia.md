# Енциклопедія тварин 

У цьому уроці ми продовжимо практикувати власні view та передавання даних.

Ми створимо простий view енциклопедії тварин. На сторінці буде показано п’ять тварин. Коли користувач натисне певну тварину, з’явиться view з деталями: зображенням, ареалом поширення, середовищем існування та описом цієї тварини.

Результат:

![view](../../../Resource/029_view.png)

За допомогою цього прикладу ми потренуємо взаємодію між структурою даних, відображенням списку, натисканням і спливаючим view Sheet.

## Підготовка зображень

Спочатку потрібно підготувати п’ять зображень тварин:

- Дельфін: `dolphin.jpg`
- Жирафа: `giraffe.jpg`
- Лев: `lion.jpg`
- Панда: `panda.jpg`
- Білий ведмідь: `polarBear.jpg`

Можна використати такі зображення:

[Дельфін](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Жирафа](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Лев](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Панда](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Білий ведмідь](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Після завантаження перетягніть зображення до папки ресурсів `Assets` у проєкті Xcode.

![assets](../../../Resource/029_assets.png)

Зверніть увагу: коли зображення використовується в коді, зазвичай не потрібно писати суфікс `.jpg`.

Наприклад, якщо назва ресурсу зображення — `dolphin`, у коді пишемо так:

```swift
Image("dolphin")
```

Якщо назву зображення написано неправильно, зображення не відобразиться належним чином.

Примітка: наведені вище зображення походять із проєктів Wikimedia. Під час використання бажано зберігати посилання на оригінал і інформацію про джерело.

## Створення структури тварини

На цій сторінці кожна тварина має кілька полів інформації:

- Назва тварини
- Зображення тварини
- Емодзі тварини
- Ареал поширення
- Середовище існування
- Опис тварини

Якщо розподілити цю інформацію між багатьма змінними, код стане досить хаотичним. Тому можна створити структуру `Animal` і зберігати інформацію про одну тварину в одному місці.

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

У цьому фрагменті коду:

- `id`: унікальний ідентифікатор тварини.
- `name`: назва тварини.
- `imageName`: назва зображення тварини.
- `avatarEmoji`: емодзі тварини.
- `distributionArea`: ареал поширення.
- `habitat`: середовище існування.
- `animalDescription`: опис тварини.

Серед них:

```swift
let id = UUID()
```

`id` використовується для ідентифікації кожної тварини. Далі ми використаємо `ForEach`, щоб показати список тварин, а також `.sheet(item:)`, щоб відкривати деталі за вибраною твариною. Тому `Animal` має відповідати протоколу `Identifiable`.

Роль `Identifiable` полягає в тому, щоб повідомити SwiftUI: кожна тварина має `id`, за яким її можна відрізнити.

## Створення даних тварин

Далі створимо масив тварин у `ContentView`.

У масиві збережено п’ять об’єктів `Animal`, і кожен `Animal` представляє одну тварину.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Дельфін
        Animal(
            name: "Дельфін",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Теплі та помірні океани по всьому світу.",
            habitat: "Океани, прибережні води та деякі великі річки.",
            animalDescription: "Дельфіни — розумні морські ссавці. Вони живуть групами, спілкуються звуками та відомі своєю грайливою поведінкою."
        ),
        // Жирафа
        Animal(
            name: "Жирафа",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Савани та відкриті рідколісся в Африці.",
            habitat: "Луки, савани та відкриті ліси.",
            animalDescription: "Жирафи — найвищі наземні тварини. Вони мають довгі шиї, довгі ноги й зазвичай живляться листям із високих дерев."
        ),
        // Лев
        Animal(
            name: "Лев",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Переважно трапляються в Африці на південь від Сахари, з невеликою популяцією в західній Індії.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Леви — могутні великі кішки. Вони зазвичай живуть групами, які називаються прайдами, і часто відомі як королі тваринного світу."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Гірські ліси в центральному Китаї.",
            habitat: "Бамбукові ліси в прохолодних і вологих гірських районах.",
            animalDescription: "Панди — це ведмеді, відомі своїм чорно-білим хутром. Вони переважно їдять бамбук і є одними з найвпізнаваніших тварин у світі."
        ),
        // Білий ведмідь
        Animal(
            name: "Білий ведмідь",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Арктичні регіони навколо Північного полюса.",
            habitat: "Морська крига, прибережні райони та холодне арктичне середовище.",
            animalDescription: "Білі ведмеді — великі ведмеді, пристосовані до холодного середовища. Вони добре плавають і переважно залежать від морської криги під час полювання на тюленів."
        )
    ]

    var body: some View {
        Text("Енциклопедія тварин")
    }
}
```

Тут `animals` — це масив:

```swift
let animals: [Animal]
```

`[Animal]` означає, що в цьому масиві зберігається кілька `Animal`.

Інакше кажучи, `animals` — це не одна тварина, а група тварин.

## Відображення списку тварин

Тепер можна використати `ForEach`, щоб показати список тварин.

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

Результат відображення:

![view](../../../Resource/029_view1.png)

У цьому фрагменті коду:

```swift
ForEach(animals) { animal in
    ...
}
```

це означає перебір масиву `animals`.

Під час кожного проходу циклу `animal` означає тварину, яка зараз відображається.

Наприклад, під час першого проходу `animal` — це дельфін; під час другого проходу `animal` — це жирафа.

Тому інформацію про поточну тварину можна показати так:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Так можна відобразити п’ять тварин.

## Додавання натискання до списку тварин

Тепер список уже відображається, але на нього ще не можна натискати.

Якщо потрібно, щоб після натискання певної тварини з’являлися деталі, спочатку треба записати «поточну вибрану тварину».

Тому додамо змінну стану в `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Тут `selectedAnimal` має optional-тип `Animal?`.

Це означає, що в ньому може бути тварина, а може не бути жодної.

Початкове значення — `nil`, тобто на початку не вибрано жодної тварини.

Потім перетворимо кожен рядок із твариною на `Button`:

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

Головне тут — цей рядок коду:

```swift
selectedAnimal = animal
```

Коли користувач натискає певну тварину, ми зберігаємо цю тварину в `selectedAnimal`.

Наприклад, якщо користувач натискає дельфіна, у `selectedAnimal` зберігається дельфін.

Якщо користувач натискає панду, у `selectedAnimal` зберігається панда.

Тобто `selectedAnimal` використовується для запису того, яку тварину користувач натиснув зараз.

## Спливаючий view Sheet

Тепер ми вже можемо через кнопку записувати «поточну натиснуту тварину».

Далі потрібно реалізувати спливаючий view для показу деталей тварини.

![view](../../../Resource/029_view2.png)

У SwiftUI такий спливаючий ефект можна реалізувати за допомогою `Sheet`.

`Sheet` можна розуміти як тимчасову сторінку, що з’являється поверх поточної. Після перегляду користувач може закрити її свайпом униз.

## Приклад Sheet

Перед тим як справді показувати деталі тварини, спочатку розберемо простий приклад і зрозуміємо, як з’являється `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Показати Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Подання Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Результат відображення:

![view](../../../Resource/029_view3.png)

У цьому коді ми створили булеве значення:

```swift
@State private var showSheet = false
```

`showSheet` за замовчуванням дорівнює `false`, тобто спочатку `Sheet` не показується.

Коли натискаємо кнопку:

```swift
showSheet.toggle()
```

`toggle()` означає перемикання булевого значення.

Якщо раніше було `false`, після виклику `toggle()` стане `true`.

Якщо раніше було `true`, після виклику `toggle()` стане `false`.

Отже, після натискання кнопки `showSheet` зміниться з `false` на `true`.

Коли `showSheet` стає `true`, такий код відкриває `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Подання Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Цей код означає: коли `showSheet` дорівнює `true`, відкривається `Sheet`, а всередині нього показується `Text("Подання Sheet")`.

Результат відображення:

![view](../../../Resource/029_view4.png)

Такий запис підходить для показу фіксованого вмісту.

Наприклад, після натискання кнопки можна відкрити сторінку налаштувань, сторінку пояснення, сторінку підказки тощо.

### Де розміщувати Sheet

Хоча `Sheet` є спливаючим view, у SwiftUI його не записують безпосередньо як окремий view на кшталт `Text()` чи `Image()`. Він використовується як модифікатор view.

Тобто `.sheet(...)` подібний до модифікаторів `.font()`, `.padding()`, `.shadow()` і також має додаватися після певного view.

Наприклад:

```swift
Button("Показати Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Подання Sheet")
}
```

У цьому прикладі `.sheet` додано після `Button`.

Коли `showSheet` стає `true`, SwiftUI відкриває `Sheet` і показує вміст у фігурних дужках:

```swift
Text("Подання Sheet")
```

Однак у реальній розробці, якщо на сторінці є кілька кнопок, зазвичай не додають `.sheet` до кожної кнопки.

Поширеніший спосіб — додати `.sheet` після зовнішнього view.

Наприклад:

```swift
VStack {
    Button("Показати Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Подання Sheet")
}
```

Кнопка відповідає за зміну `showSheet`, а зовнішній view відповідає за відкриття `Sheet` залежно від того, чи дорівнює `showSheet` значенню `true`.

## Прив’язування Sheet до optional-значення

Раніше ми вивчили такий запис:

```swift
.sheet(isPresented: $showSheet) {
    Text("Подання Sheet")
}
```

Такий запис підходить для керування показом і приховуванням фіксованої сторінки.

Але в прикладі з енциклопедією тварин нам потрібно знати не лише, «чи відкривати `Sheet`», а й «яку саме тварину натиснули».

Наприклад:

Якщо користувач натискає дельфіна, у `Sheet` мають показуватися деталі дельфіна.

Якщо користувач натискає панду, у `Sheet` мають показуватися деталі панди.

Тому тут краще використати інший спосіб запису Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Вміст, що відображається в Sheet
}
```

У цьому коді `Sheet` прив’язано до optional-значення `selectedAnimal`.

Зверніть увагу: після `item:` пишеться `$selectedAnimal`, а не `selectedAnimal`.

Тому що `Sheet` не лише читає значення `selectedAnimal`, а й вирішує, чи відкриватися, відповідно до його змін.

Цей код можна зрозуміти так:

- Коли `selectedAnimal` дорівнює `nil`, `Sheet` не показується.
- Коли `selectedAnimal` має значення, `Sheet` показується.
- Коли `Sheet` закривається, SwiftUI знову змінює `selectedAnimal` на `nil`.

SwiftUI передає тварину, збережену в `selectedAnimal`, у `animal` всередині фігурних дужок.

Інакше кажучи, `.sheet(item:)` не лише керує відкриттям, а й передає вибрані дані в `Sheet`.

## Використання Sheet для показу назви тварини

Тепер не поспішаймо створювати складний view деталей.

Щоб код було легше зрозуміти, спочатку покажемо в `Sheet` назву поточної тварини.

Додайте `.sheet(item:)` після `VStack`:

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

Найважливішим тут є цей фрагмент коду:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Коли `selectedAnimal` має значення, `Sheet` відкривається.

`animal` у фігурних дужках — це поточна вибрана тварина.

Отже:

```swift
Text(animal.name)
```

відобразить назву тварини, яку зараз натиснули.

Наприклад, якщо натиснути `Дельфін`, у Sheet буде показано `Дельфін`.

Якщо натиснути `Панда`, у `Sheet` буде показано `Панда`.

Так ми реалізували ефект, коли натискання різних тварин відкриває різні назви тварин.

Показ назви тварини:

![view](../../../Resource/029_view5.png)

Однак деталі тварини не мають показувати лише назву. Вони також мають показувати назву, ареал поширення, середовище існування та опис.

Якщо написати весь цей код усередині `.sheet`, код стане дуже довгим і незручним для читання.

Тому далі створимо новий власний view, який спеціально відповідатиме за показ деталей тварини.

## Створення view деталей тварини

Далі створимо новий власний view `AnimalDetailView`.

Цей view приймає один `Animal` і показує деталі тварини.

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
                    Text("**Ареал поширення** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Середовище існування** ：\(animal.habitat)")

                    Divider()

                    Text("**Опис тварини** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Результат відображення:

![view](../../../Resource/029_view2.png)

Головне тут:

```swift
var animal: Animal
```

Це означає, що `AnimalDetailView` має отримати тварину ззовні.

Після отримання тварини view деталей може використовувати різну інформацію цієї тварини:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Тобто `AnimalDetailView` відповідає лише за відображення переданої тварини.

### Жирний текст у Markdown

У view деталей ми написали такий код:

```swift
Text("**Середовище існування:** \(animal.habitat)")
```

Тут є два моменти для розуміння.

По-перше, `**Середовище існування:**` використовує синтаксис `Markdown`. Текст, обгорнутий двома зірочками, відображається жирним.

По-друге, `\()` — це інтерполяція рядка, яка дозволяє показувати значення змінної в тексті.

Цей код спочатку показує жирний напис `Середовище існування:`, а потім показує середовище існування цієї тварини.

## Показ view деталей у Sheet

Після створення `AnimalDetailView` можна повернутися до `ContentView` і замінити початковий view з назвою в `Sheet` на view деталей.

Було так:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Тепер змінюємо на:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Тут `animal:` — це назва параметра `AnimalDetailView`.

А `animal` після нього — це поточна тварина, передана через `.sheet(item:)`.

Тобто ми передаємо поточну натиснуту тварину в `AnimalDetailView` для відображення.

Повна структура:

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

Коли користувач натискає тварину:

```swift
selectedAnimal = animal
```

`selectedAnimal` змінюється з `nil` на конкретну тварину. Коли `Sheet` виявляє, що `selectedAnimal` має значення, він відкриває view.

`Sheet` передає тварину з `selectedAnimal` до view `AnimalDetailView`, а `AnimalDetailView` показує деталі тварини.

Так ми реалізували функцію: натискання тварини в списку відкриває відповідні деталі.

## Різниця між двома способами запису Sheet

Тепер ми вже використали `.sheet(item:)`, щоб реалізувати показ view деталей тварини.

Тут можна коротко підсумувати два поширені способи запису `Sheet`.

### Перший спосіб — прив’язування булевого значення

```swift
@State private var showSheet = false

Button("Показати Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Подання Sheet")
}
```

Такий запис підходить для відкриття фіксованого вмісту, наприклад сторінки налаштувань, сторінки пояснення, сторінки підказки тощо.

`showSheet` — це булеве значення, яке має лише два стани: `true` і `false`.

Коли `showSheet` дорівнює `true`, `Sheet` показується.

Коли `showSheet` дорівнює `false`, `Sheet` не показується.

### Другий спосіб — прив’язування optional-значення

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Такий запис підходить для відкриття різного вмісту залежно від вибраних даних.

У цьому уроці ми натискаємо різних тварин і маємо показувати різні деталі, тому `.sheet(item:)` підходить краще.

## Повний код

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Назва тварини
    let name: String
    
    // Зображення тварини
    let imageName: String
    
    // Емодзі тварини
    let avatarEmoji: String
    
    // Ареал поширення
    let distributionArea: String
    
    // Середовище існування
    let habitat: String
    
    // Опис тварини
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Дельфін
        Animal(
            name: "Дельфін",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Теплі та помірні океани по всьому світу.",
            habitat: "Океани, прибережні води та деякі великі річки.",
            animalDescription: "Дельфіни — розумні морські ссавці. Вони живуть групами, спілкуються звуками та відомі своєю грайливою поведінкою."
        ),
        // Жирафа
        Animal(
            name: "Жирафа",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Савани та відкриті рідколісся в Африці.",
            habitat: "Луки, савани та відкриті ліси.",
            animalDescription: "Жирафи — найвищі наземні тварини. Вони мають довгі шиї, довгі ноги й зазвичай живляться листям із високих дерев."
        ),
        // Лев
        Animal(
            name: "Лев",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Переважно трапляються в Африці на південь від Сахари, з невеликою популяцією в західній Індії.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Леви — могутні великі кішки. Вони зазвичай живуть групами, які називаються прайдами, і часто відомі як королі тваринного світу."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Гірські ліси в центральному Китаї.",
            habitat: "Бамбукові ліси в прохолодних і вологих гірських районах.",
            animalDescription: "Панди — це ведмеді, відомі своїм чорно-білим хутром. Вони переважно їдять бамбук і є одними з найвпізнаваніших тварин у світі."
        ),
        // Білий ведмідь
        Animal(
            name: "Білий ведмідь",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Арктичні регіони навколо Північного полюса.",
            habitat: "Морська крига, прибережні райони та холодне арктичне середовище.",
            animalDescription: "Білі ведмеді — великі ведмеді, пристосовані до холодного середовища. Вони добре плавають і переважно залежать від морської криги під час полювання на тюленів."
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
                    Text("**Ареал поширення** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Середовище існування** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Опис тварини** ：\(animal.animalDescription)")
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

## Підсумок

У цьому уроці ми завершили просту сторінку енциклопедії тварин.

Спочатку ми використали структуру `Animal` для збереження інформації про тварин, потім масив для збереження п’яти тварин, а далі `ForEach` для відображення списку тварин.

Коли користувач натискає певну тварину, ми зберігаємо її в `selectedAnimal`:

```swift
selectedAnimal = animal
```

Коли `selectedAnimal` має значення, `.sheet(item:)` відкриває view деталей і передає вибрану тварину в `AnimalDetailView`.

Найважливіше в цьому уроці — не стиль інтерфейсу, а розуміння такого маршруту передавання даних:

```swift
Натиснути тварину → selectedAnimal зберігає тварину → Sheet відкривається → AnimalDetailView показує деталі
```

Після розуміння цього маршруту надалі можна створювати більше подібних функцій, наприклад деталі товару, деталі курсу, деталі статті, деталі контакту тощо.
