# Енциклопедия на животните 

В този урок ще продължим да упражняваме персонализирани изгледи и предаване на данни.

Ще създадем прост изглед за енциклопедия на животните. На страницата ще се показват пет животни. Когато докоснем някое животно, ще се отвори детайлен изглед, който показва снимката, района на разпространение, местообитанието и описанието на това животно.

Краен резултат:

![view](../../../Resource/029_view.png)

Чрез този пример можем да упражним как структурата от данни, показването на списък, взаимодействието с докосване и изскачащият Sheet работят заедно.

## Подготовка на изображенията

Първо трябва да подготвим пет изображения на животни:

- Делфин: `dolphin.jpg`
- Жираф: `giraffe.jpg`
- Лъв: `lion.jpg`
- Панда: `panda.jpg`
- Полярна мечка: `polarBear.jpg`

Можем да използваме следните изображения:

[Делфин](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[Жираф](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[Лъв](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[Панда](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[Полярна мечка](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

След като изтеглим изображенията, ги плъзгаме в папката с ресурси `Assets` на Xcode проекта.

![assets](../../../Resource/029_assets.png)

Трябва да обърнем внимание, че когато използваме изображения в кода, обикновено не е нужно да пишем разширението `.jpg`.

Например, ако името на ресурса е `dolphin`, в кода пишем:

```swift
Image("dolphin")
```

Ако името на изображението е написано грешно, изображението няма да се покаже правилно.

Бележка: Горните изображения са от проектите на Wikimedia. При използване е препоръчително да се запазят оригиналните връзки и информацията за източника.

## Създаване на структура Animal

В тази страница всяко животно има няколко части информация:

- Име на животното
- Изображение на животното
- Емоджи на животното
- Район на разпространение
- Местообитание
- Описание на животното

Ако разпръснем тази информация в много отделни променливи, кодът ще стане по-объркан. Затова можем да създадем структура `Animal`, която събира информацията за едно животно на едно място.

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

В този код:

- `id`: уникалният идентификатор на животното.
- `name`: името на животното.
- `imageName`: името на изображението на животното.
- `avatarEmoji`: емоджито на животното.
- `distributionArea`: районът на разпространение.
- `habitat`: местообитанието.
- `animalDescription`: описанието на животното.

Сред тях:

```swift
let id = UUID()
```

`id` се използва за идентифициране на всяко животно. По-късно ще използваме `ForEach`, за да покажем списъка с животни, и ще използваме `.sheet(item:)`, за да отворим детайл според избраното животно, затова трябва `Animal` да спазва протокола `Identifiable`.

Ролята на `Identifiable` е да каже на SwiftUI: всяко животно има `id`, чрез който може да бъде различено.

## Създаване на данни за животните

След това създаваме масив с животни в `ContentView`.

В масива се съхраняват пет `Animal`, като всеки `Animal` представлява едно животно.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Делфин
        Animal(
            name: "Делфин",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Топли и умерени океани по целия свят.",
            habitat: "Океани, крайбрежни води и някои големи реки.",
            animalDescription: "Делфините са интелигентни морски бозайници. Те живеят на групи, общуват чрез звуци и са известни с игривото си поведение."
        ),
        // Жираф
        Animal(
            name: "Жираф",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Савани и открити гористи местности в Африка.",
            habitat: "Пасища, савани и открити гори.",
            animalDescription: "Жирафите са най-високите сухоземни животни. Те имат дълги вратове, дълги крака и обикновено се хранят с листа от високи дървета."
        ),
        // Лъв
        Animal(
            name: "Лъв",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Среща се главно в Субсахарска Африка, с малка популация в Западна Индия.",
            habitat: "Пасища, савани и открити гористи местности.",
            animalDescription: "Лъвовете са мощни големи котки. Те обикновено живеят в групи, наречени прайдове, и често са известни като царете на животинския свят."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Планински гори в Централен Китай.",
            habitat: "Бамбукови гори в хладни и влажни планински райони.",
            animalDescription: "Пандите са мечки, известни с черно-бялата си козина. Те се хранят главно с бамбук и са едни от най-разпознаваемите животни в света."
        ),
        // Полярна мечка
        Animal(
            name: "Полярна мечка",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Арктически райони около Северния полюс.",
            habitat: "Морски лед, крайбрежни райони и студена арктическа среда.",
            animalDescription: "Полярните мечки са големи мечки, приспособени към студена среда. Те са силни плувци и разчитат главно на морския лед, за да ловуват тюлени."
        )
    ]

    var body: some View {
        Text("Енциклопедия на животните")
    }
}
```

Тук `animals` е масив:

```swift
let animals: [Animal]
```

`[Animal]` означава, че в този масив се съхраняват няколко `Animal`.

С други думи, `animals` не е едно животно, а група животни.

## Показване на списък с животни

Сега можем да използваме `ForEach`, за да покажем списъка с животни.

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

Краен резултат:

![view](../../../Resource/029_view1.png)

В този код:

```swift
ForEach(animals) { animal in
    ...
}
```

означава обхождане на масива `animals`.

При всяко повторение `animal` представлява животното, което се показва в момента.

Например при първото повторение `animal` е делфинът; при второто повторение `animal` е жирафът.

Затова можем да покажем информацията за текущото животно така:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Така петте животни могат да бъдат показани.

## Позволяване на списъка да бъде натискан

Сега списъкът вече се показва, но все още не може да се натиска.

Ако искаме след натискане на определено животно да се отвори детайл, първо трябва да запишем „текущо избраното животно“.

Затова добавяме променлива за състояние в `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Тук `selectedAnimal` е незадължителен тип `Animal?`.

Това означава, че може да съдържа едно животно, а може и да няма животно.

Стойността по подразбиране е `nil`, което означава, че в началото не е избрано нито едно животно.

След това променяме всеки ред с животно на `Button`:

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

Най-важният ред е този:

```swift
selectedAnimal = animal
```

Когато потребителят натисне някое животно, ние записваме това животно в `selectedAnimal`.

Например, ако потребителят натисне делфина, в `selectedAnimal` се записва делфинът.

Ако потребителят натисне пандата, в `selectedAnimal` се записва пандата.

С други думи, `selectedAnimal` се използва, за да запише кое животно потребителят е натиснал в момента.

## Изскачащ изглед Sheet

Сега вече можем чрез бутона да запишем „животното, което е натиснато в момента“.

Следва да реализираме изскачащ изглед, който да показва детайлите на животното.

![view](../../../Resource/029_view2.png)

В SwiftUI можем да използваме `Sheet`, за да реализираме този изскачащ ефект.

`Sheet` може да се разбира като временна изскачаща страница. Тя се показва над текущата страница, а след като потребителят прегледа съдържанието, може да я затвори чрез плъзгане надолу.

## Пример за Sheet

Преди наистина да покажем детайлите на животното, нека първо използваме прост пример, за да разберем как се отваря `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Покажи Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Изглед Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Краен резултат:

![view](../../../Resource/029_view3.png)

В този код създадохме булева стойност:

```swift
@State private var showSheet = false
```

`showSheet` по подразбиране е `false`, което означава, че в началото `Sheet` не се показва.

Когато натиснем бутона:

```swift
showSheet.toggle()
```

`toggle()` означава превключване на булева стойност.

Ако преди е била `false`, след извикване на `toggle()` ще стане `true`.

Ако преди е била `true`, след извикване на `toggle()` ще стане `false`.

Затова след натискане на бутона `showSheet` ще се промени от `false` на `true`.

Когато `showSheet` стане `true`, следният код ще отвори `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Изглед Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Този код означава: когато `showSheet` е `true`, отвори `Sheet` и покажи `Text("Изглед Sheet")` в него.

Краен резултат:

![view](../../../Resource/029_view4.png)

Този начин на писане е подходящ за показване на фиксирано съдържание.

Например след натискане на бутон да се отвори страница с настройки, страница с обяснение, страница с подсказка и т.н.

### Място на показване на Sheet

Въпреки че `Sheet` е изскачащ изглед, в SwiftUI той не се пише директно като самостоятелен изглед като `Text()` или `Image()`, а се използва като модификатор на изглед.

С други думи, `.sheet(...)` е подобен на модификатори като `.font()`, `.padding()` и `.shadow()`, и трябва да бъде добавен след някой изглед.

Например:

```swift
Button("Покажи Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Изглед Sheet")
}
```

В този пример `.sheet` е добавен след `Button`.

Когато `showSheet` стане `true`, SwiftUI ще отвори `Sheet` и ще покаже съдържанието в скобите:

```swift
Text("Изглед Sheet")
```

В реалната разработка обаче, ако една страница има няколко бутона, обикновено не добавяме `.sheet` към всеки бутон.

По-често срещаният подход е: добавяме `.sheet` след външния изглед.

Например:

```swift
VStack {
    Button("Покажи Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Изглед Sheet")
}
```

Бутонът отговаря за промяната на `showSheet`, а външният изглед отговаря да отвори `Sheet` според това дали `showSheet` е `true`.

## Sheet с обвързване към незадължителна стойност

Предишният начин на писане, който научихме, е:

```swift
.sheet(isPresented: $showSheet) {
    Text("Изглед Sheet")
}
```

Този начин е подходящ за контролиране на показването и скриването на една фиксирана страница.

Но в примера с енциклопедията на животните не ни трябва само да знаем „дали да се отвори `Sheet`“, а и „кое животно е натиснато“.

Например:

Ако потребителят натисне делфина, в `Sheet` трябва да се покажат детайлите за делфина.

Ако потребителят натисне пандата, в `Sheet` трябва да се покажат детайлите за пандата.

Затова тук е по-подходящо да използваме друг начин за писане на Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Съдържанието, показвано в Sheet
}
```

В този код `Sheet` е обвързан с незадължителната стойност `selectedAnimal`.

Тук трябва да обърнем внимание, че след `item:` пишем `$selectedAnimal`, а не `selectedAnimal`.

Защото `Sheet` не само чете стойността на `selectedAnimal`, но и трябва да решава дали да се отвори според нейните промени.

Този код може да се разбира така:

- Когато `selectedAnimal` е `nil`, `Sheet` не се показва.
- Когато `selectedAnimal` има стойност, `Sheet` се показва.
- Когато `Sheet` бъде затворен, SwiftUI отново ще промени `selectedAnimal` на `nil`.

SwiftUI ще предаде животното, записано в `selectedAnimal`, към `animal` в скобите.

С други думи, `.sheet(item:)` не само контролира отварянето, но и предава избраните данни в `Sheet`.

## Използване на Sheet за показване на името на животното

Сега нека не бързаме да създаваме сложен детайлен изглед.

За да стане кодът по-лесен за разбиране, първо ще покажем името на текущото животно в `Sheet`.

Добавяме `.sheet(item:)` извън `VStack`:

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

Най-важната част тук е този код:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Когато `selectedAnimal` има стойност, `Sheet` ще се отвори.

`animal` в скобите е текущо избраното животно.

Затова:

```swift
Text(animal.name)
```

ще покаже името на текущо натиснатото животно.

Например, ако натиснем `Делфин`, в Sheet ще се покаже `Делфин`.

Ако натиснем `Панда`, в `Sheet` ще се покаже `Панда`.

Така реализирахме ефекта: при натискане на различни животни се отваря името на различното животно.

Показване на името на животното:

![view](../../../Resource/029_view5.png)

Но детайлите на животното не трябва да показват само име. Те трябва да показват още име, район на разпространение, местообитание и описание.

Ако напишем целия този код вътре в `.sheet`, кодът ще стане много дълъг и неудобен за четене.

Затова следва да създадем нов персонализиран изглед, който е специално отговорен за показването на детайлите на животното.

## Създаване на детайлен изглед за животно

След това създаваме нов персонализиран изглед `AnimalDetailView`.

Този изглед приема един `Animal` и показва детайлите на животното.

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
                    Text("**Район на разпространение** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Местообитание** ：\(animal.habitat)")

                    Divider()

                    Text("**Описание на животното** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Краен резултат:

![view](../../../Resource/029_view2.png)

Тук най-важното е:

```swift
var animal: Animal
```

Това означава, че `AnimalDetailView` трябва да получи едно животно отвън.

След като получи животното, детайлният изглед може да използва различната информация за него:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

С други думи, `AnimalDetailView` отговаря само за показване на животното, което му е предадено.

### Удебелен текст с Markdown

В детайлния изглед написахме такъв код:

```swift
Text("**Местообитание:** \(animal.habitat)")
```

Тук има две знания.

Първо, `**Местообитание:**` използва синтаксиса на `Markdown`. Текстът, ограден с две звездички, ще се показва удебелено.

Второ, `\()` е интерполация на низ и може да показва стойността на променлива в текст.

Този код означава първо да се покаже удебеленото `Местообитание:`, а след това да се покаже местообитанието на това животно.

## Показване на детайлния изглед в Sheet

След като създадем `AnimalDetailView`, можем да се върнем в `ContentView` и да заменим предишния изглед с име в `Sheet` с детайлния изглед.

Преди беше:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Сега го променяме на:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Тук `animal:` е името на параметъра на `AnimalDetailView`.

Следващото `animal` е текущото животно, предадено от `.sheet(item:)`.

Тоест предаваме текущо натиснатото животно на `AnimalDetailView`, за да бъде показано.

Пълна структура:

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

Когато потребителят натисне животно:

```swift
selectedAnimal = animal
```

`selectedAnimal` се променя от `nil` на конкретно животно, а когато `Sheet` засече, че `selectedAnimal` има стойност, той отваря изгледа.

`Sheet` предава животното от `selectedAnimal` на изгледа `AnimalDetailView`, а `AnimalDetailView` показва детайлите на животното.

Така реализирахме функцията: натискане на животно в списъка и отваряне на съответните детайли.

## Разлика между двата начина за писане на Sheet

Сега вече използвахме `.sheet(item:)`, за да покажем детайлен изглед за животно.

Тук можем накратко да обобщим двата често срещани начина за писане на `Sheet`.

### Първият начин е обвързване с булева стойност

```swift
@State private var showSheet = false

Button("Покажи Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Изглед Sheet")
}
```

Този начин е подходящ за показване на фиксирано съдържание, например страница с настройки, страница с обяснение, страница с подсказка и т.н.

`showSheet` е булева стойност и има само две състояния: `true` и `false`.

Когато `showSheet` е `true`, `Sheet` се показва.

Когато `showSheet` е `false`, `Sheet` не се показва.

### Вторият начин е обвързване с незадължителна стойност

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Този начин е подходящ за показване на различно съдържание според избраните данни.

В този урок натискаме различни животни и трябва да показваме различни детайли, затова използването на `.sheet(item:)` е по-подходящо.

## Пълен код

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Име на животното
    let name: String
    
    // Изображение на животното
    let imageName: String
    
    // Емоджи на животното
    let avatarEmoji: String
    
    // Район на разпространение
    let distributionArea: String
    
    // Местообитание
    let habitat: String
    
    // Описание на животното
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Делфин
        Animal(
            name: "Делфин",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Топли и умерени океани по целия свят.",
            habitat: "Океани, крайбрежни води и някои големи реки.",
            animalDescription: "Делфините са интелигентни морски бозайници. Те живеят на групи, общуват чрез звуци и са известни с игривото си поведение."
        ),
        // Жираф
        Animal(
            name: "Жираф",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Савани и открити гористи местности в Африка.",
            habitat: "Пасища, савани и открити гори.",
            animalDescription: "Жирафите са най-високите сухоземни животни. Те имат дълги вратове, дълги крака и обикновено се хранят с листа от високи дървета."
        ),
        // Лъв
        Animal(
            name: "Лъв",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Среща се главно в Субсахарска Африка, с малка популация в Западна Индия.",
            habitat: "Пасища, савани и открити гористи местности.",
            animalDescription: "Лъвовете са мощни големи котки. Те обикновено живеят в групи, наречени прайдове, и често са известни като царете на животинския свят."
        ),
        // Панда
        Animal(
            name: "Панда",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Планински гори в Централен Китай.",
            habitat: "Бамбукови гори в хладни и влажни планински райони.",
            animalDescription: "Пандите са мечки, известни с черно-бялата си козина. Те се хранят главно с бамбук и са едни от най-разпознаваемите животни в света."
        ),
        // Полярна мечка
        Animal(
            name: "Полярна мечка",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Арктически райони около Северния полюс.",
            habitat: "Морски лед, крайбрежни райони и студена арктическа среда.",
            animalDescription: "Полярните мечки са големи мечки, приспособени към студена среда. Те са силни плувци и разчитат главно на морския лед, за да ловуват тюлени."
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
                    Text("**Район на разпространение** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Местообитание** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Описание на животното** ：\(animal.animalDescription)")
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

## Обобщение

В този урок завършихме проста страница за енциклопедия на животните.

Първо използвахме структурата `Animal`, за да съхраняваме информацията за животните. След това използвахме масив, за да съхраним пет животни, и използвахме `ForEach`, за да покажем списъка с животни.

Когато потребителят натисне някое животно, записваме това животно в `selectedAnimal`:

```swift
selectedAnimal = animal
```

Когато `selectedAnimal` има стойност, `.sheet(item:)` ще отвори детайлния изглед и ще предаде избраното животно на `AnimalDetailView`.

Най-важното в този урок не е стилът на интерфейса, а разбирането на тази линия на предаване на данни:

```swift
Натискане на животно → selectedAnimal записва животното → Sheet се отваря → AnimalDetailView показва детайлите
```

След като разберем тази линия, по-късно можем да създаваме още подобни функции, например детайли за продукт, детайли за курс, детайли за статия, детайли за контакт и т.н.
