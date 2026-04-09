# struct і class

На попередньому уроці ми лише почали знайомитися з `struct`, визначили одну структуру, а також розширили знання про protocol, `UUID` та інші теми.

Тепер ми вже маємо початкове розуміння ключового слова `struct`, але поки що не можемо сказати, що справді його розуміємо.

У цьому уроці ми й далі будемо брати `struct` як основну тему, а заодно познайомимося і з `class`. Завдяки цьому уроку тобі стане зрозуміліше: що таке instance, що таке constructor, і чому ми можемо використовувати `struct` та `class` для організації даних.

## Система керування студентами

Наприклад, зараз ми хочемо розробити систему керування студентами. Кожен студент має ім'я, стать, телефон, вік, домашню адресу та іншу інформацію.

У цей момент ми можемо об'єднати цю інформацію разом і визначити її як структуру `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Тут ми використовуємо `struct`, щоб визначити тип студента.

Ця структура `Student` містить кілька properties:

- `id`: унікальний ідентифікатор студента
- `name`: ім'я студента
- `sex`: стать студента
- `phone`: телефон студента
- `age`: вік студента
- `address`: домашня адреса

Таким чином, кілька розрізнених даних поєднуються в одного повноцінного «студента».

Тут `Student` також дотримується protocol `Identifiable` і визначає поле `id`, щоб надалі було зручно показувати дані разом із циклом `ForEach`.

Потім ми можемо створити instance студента:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Цей код означає, що відповідно до структури `Student` можна створити конкретні дані про студента.

Тут `Student` — це тип, а `Student(...)` означає створений instance.

У SwiftUI ми можемо присвоїти цей instance змінній, а потім показати його.

Наприклад:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Таким чином, у view ми можемо побачити ім'я цього студента: `Fang Junyu`.

Тут ми спочатку створили instance `Student`, потім присвоїли його змінній `student`, а наприкінці прочитали його property через `student.name`.

## Що таке instance

Коли ми тільки починаємо вивчати `struct`, слово «instance» може здаватися дуже незнайомим.

Але насправді ми користуємося instance з самого початку, просто раніше не звертали на це особливої уваги.

Наприклад:

```swift
let name = "Fang Junyu"
```

Тут `"Fang Junyu"` є string value, і по суті це instance типу `String`.

Ми також можемо написати так:

```swift
let name = String("Fang Junyu")
```

Обидва ці способи запису означають одне й те саме: створити instance типу `String` і присвоїти його змінній `name`.

Так само це стосується і `Int`:

```swift
let num = 3
```

Тут `3` по суті є value типу `Int`, і його також можна розуміти як instance `Int`.

Отже, instance — це не якийсь особливий concept, який існує лише в `struct`.

Незалежно від того, чи це `String`, `Int`, `Double`, `Bool`, чи наш власний `Student`, усі вони можуть створювати instance.

Тому коли ми пишемо:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

По суті це те саме, що створювати instance `String` або `Int`, просто `Student` — це тип, який ми визначили самі.

## constructor

Коли ми створюємо instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Насправді ми викликаємо initialization method типу `Student`, тобто `init`.

Ти можеш розуміти constructor так: **це вхідна точка, яка відповідає за присвоєння values properties під час створення instance.**

Тобто перш ніж instance буде справді створений, зазвичай він спочатку проходить через `init`.

Наприклад, коли раніше ми вивчали lifecycle view у SwiftUI, ми писали такий код:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Тут `init()` виконується тоді, коли створюється instance `ContentView`, а `onAppear` виконується лише тоді, коли view справді показується на екрані. Тобто створення view і його показ — це не один і той самий момент.

Так само, коли ми створюємо `Student(...)`, ми викликаємо constructor `Student`.

### constructor, який автоматично створює система

Коли ми визначали `Student`, ми не писали `init` вручну:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Але ми все одно можемо безпосередньо створити instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Чому instance можна створити без constructor?

Тому що для `struct`, якщо ми не пишемо constructor вручну, система зазвичай автоматично створює для нас відповідний constructor.

На початковому етапі це можна просто розуміти так: Swift автоматично дописує за нас initialization code.

Приблизно можна вважати, що система доповнює для нас такий код:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Тут потрібно звернути увагу на одну деталь:

```swift
let id = UUID()
```

`id` вже має default value, тому під час створення instance нам не потрібно вручну передавати `id`.

Тобто properties без default value зазвичай потрібно передавати в constructor; properties, які вже мають default value, зазвичай можуть прямо використовувати це початкове значення.

Тому коли ми створюємо instance `Student`, нам потрібно передати лише `name`, `sex`, `phone`, `age` і `address`.

### Підказки compiler

Крім того, коли ми вводимо `Student(...)` у Xcode, ми також можемо побачити підказки параметрів, які дає система.

![student](../../Resource/022_student.png)

Це також показує, що цей поточний тип справді має constructor, автоматично створений системою.

### Писати constructor самостійно

Хоча система може автоматично створити constructor, іноді цей default спосіб initialization не повністю відповідає нашим потребам.

Наприклад, у нас є структура `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Згідно з constructor, який автоматично створила система, під час створення instance ми маємо одночасно передати ці три параметри:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Але якщо зараз ми хочемо внести партію старих фільмів і знаємо лише назву фільму, але не знаємо режисера та рейтингу, це буде незручно.

Тому що ми можемо написати лише так:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Хоч це і працює, але кожного разу повторювати `--` не дуже зручно.

У цей момент ми можемо написати constructor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Тоді, коли ми створюємо старі фільми, нам потрібно передавати лише `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Це і є один із сенсів написання constructor самостійно: **зробити спосіб створення instance більш відповідним до реальних потреб.**

### Аналіз custom constructor

Подивімося на цей constructor, який ми щойно написали вручну:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Зміст цього коду полягає в тому, що під час створення instance `Movie` потрібно передати лише один параметр `name`.

Потім усередині constructor переданий `name` буде присвоєний власному `name` цього instance, а для `director` і `rating` буде задано default value `--`.

`self` тут означає «цей поточний instance сам».

Наприклад:

```swift
self.name = name
```

`self.name` зліва означає property у самому instance; `name` справа означає параметр, який ми передали.

Це можна просто зрозуміти як збереження value, переданого ззовні, у власній property instance.

Коли всі properties отримали значення, цей instance вважається створеним.

### Механізм constructor

Коли ми явно оголошуємо constructor, виникає ще одна зміна:

Той constructor, який система спочатку автоматично створила, зазвичай уже не можна використовувати напряму.

Наприклад:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Тепер, якщо ми знову напишемо так:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler повідомить про помилку:

```swift
Extra arguments at positions #2, #3 in call
```

Це означає: ти передав зайві arguments.

Чому виникає ця помилка?

Тому що в поточній структурі `Movie` є лише один constructor, який ти оголосив вручну:

```swift
init(name: String)
```

Він приймає лише один параметр `name` і не приймає `director` та `rating`.

Тобто після того, як ти вручну додав свій constructor, початковий спосіб initialization, який система автоматично створювала раніше, вже не можна використовувати напряму.

Якщо ми хочемо підтримувати і варіант «передати лише назву», і варіант «передати повну інформацію», нам потрібно самостійно дописати ще один повний constructor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Таким чином, ми матимемо два різні constructors.

Коли створюємо старі фільми, можемо писати так:

```swift
Movie(name: "The Night of the Hunter")
```

Коли створюємо нові фільми з повною інформацією, можемо писати так:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Такий спосіб запису також показує: один і той самий тип може мати кілька constructors, якщо форми їхніх параметрів відрізняються.

## Що таке overloading

Тут ще додамо одну необхідну тему.

Щойно ми написали для `Movie` два `init`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Такий спосіб запису, коли «ім'я function однакове, але параметри різні», називається «overloading».

Тут обидві functions називаються `init`, але вони приймають різні параметри, тому Swift може розрізнити, яку саме function ти викликаєш.

Наприклад:

```swift
Movie(name: "Days of Heaven")
```

Викличе:

```swift
init(name: String)
```

А:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Викличе іншу, повну version initialization method.

Отже, роль overloading полягає в тому, щоб один і той самий тип міг пропонувати різні способи створення відповідно до різних ситуацій.

## Знайомство з class

Далі давай коротко познайомимося і з `class`.

Окрім поширеного в Swift `struct`, багато мов програмування також використовують `class` для створення instance, наприклад Java, C#, Kotlin та інші.

У Swift синтаксис `class` дуже схожий на `struct`.

Наприклад:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Ти помітиш, що окрім зміни keyword з `struct` на `class`, інші частини виглядають майже однаково.

Спосіб створення instance також дуже схожий:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Тому на рівні syntax `struct` і `class` справді дуже схожі.

### Відмінність між Struct і Class

Хоча `struct` і `class` виглядають дуже схожими, вони не є повністю однаковими.

**1. Різний спосіб initialization**

Для `struct`, якщо ми не пишемо constructor вручну, система зазвичай автоматично створює відповідний initialization method.

Але для `class`, якщо є properties без default value, то зазвичай потрібно вручну написати `init`, інакше буде помилка.

Наприклад:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Цей `class` не має constructor, тому properties не були initialized, і виникає помилка.

compiler покаже щось на кшталт:

```swift
Class 'Movie' has no initializers
```

Тому в цьому прикладі для `class` потрібно вручну написати constructor.

**2. `struct` — це value type, а `class` — reference type**

`struct` — це value type, а `class` — reference type.

На початковому етапі не потрібно повністю опановувати ці два concepts, достатньо мати про них просте уявлення.

Наприклад, `struct` більше схожий на «створити нову копію value».

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Тут після присвоєння `user1` до `user2` це наче створення нової копії даних, тому зміна `user2` не впливає на `user1`.

А `class` більше схожий на «разом посилатися на один і той самий instance».

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Тут `user1` і `user2` посилаються на один і той самий instance.

Зараз нам не потрібно повністю розуміти внутрішній механізм value type і reference type, достатньо знати, що `struct` більше підходить для зберігання незалежних даних, а `class` — для випадків, коли в кількох місцях потрібно ділити один і той самий instance.

## Як обирати на початковому етапі

На поточному етапі для звичайних data model варто спочатку розглядати `struct`, а для даних, які потрібно ділити та змінювати синхронно, вже розглядати `class`.

Це не абсолютне правило, але для початківців це достатньо практичний спосіб судження.

Особливо у SwiftUI ти часто помічатимеш, що `struct` вже може виконати більшу частину роботи.

Крім того, у багатьох матеріалах із програмування те, що створюється через `class`, також називають «object». На початковому етапі можеш поки що розуміти це як instance і не обов'язково спеціально розрізняти.

## Підсумок

У цьому уроці ми глибше вивчили `struct` і заодно познайомилися з `class`; обидва можна використовувати для визначення types.

Types можуть створювати instance. Коли створюється instance, викликається constructor, тобто `init`.

Для `struct`, якщо ми не пишемо constructor вручну, система зазвичай автоматично створює відповідний constructor. Якщо default constructor не відповідає потребам, ми також можемо написати constructor вручну.

Крім того, ми також попередньо зрозуміли різницю між `struct` і `class`: `struct` — це value type, а `class` — reference type. У SwiftUI на початковому етапі частіше за все ми стикаємося саме з `struct`.

Пізніше, коли ми будемо вивчати передачу values у view, data model та state management, цей вміст ще не раз знадобиться.
