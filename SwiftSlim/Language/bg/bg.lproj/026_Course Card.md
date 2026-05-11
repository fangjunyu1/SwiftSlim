# Карта на курс

Този урок е междинен преговор. Ще завършим една „карта на курс“.

Чрез това упражнение можем да преговорим изучените по-рано `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` и други знания, както и да научим как да комбинираме няколко малки изгледа в един цялостен модул на интерфейса.

Ефект на картата на курса:

![view](../../../Resource/026_view.png)

Тази карта на курс основно съдържа няколко части:

- Ниво на курса: `Начинаещ`
- Съдържание на курса: `20+ урока`
- Заглавие на курса: `Урок за начинаещи по SwiftUI`
- Описание на курса
- Бутон: `Започни обучението`
- Фон на курса: Swift икона и фон в цвят индиго

Можем да завършим този изглед в `ContentView`.

## Горна зона

Първо създаваме горната зона на картата на курса.

![view](../../../Resource/026_view1.png)

В лявата част на горната зона се показва нивото на курса, а в дясната част се показва съдържанието на курса.

Тъй като тези две части са подредени хоризонтално, можем да използваме `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Начинаещ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ урока")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Тук отделихме горната зона в изчисляемо свойство:

```swift
var topView: some View
```

Предимството на това е, че `body` става по-ясен.

В горната зона основно се използват следните елементи:

- `HStack`: подрежда двата текста хоризонтално.
- `Text`: показва текстово съдържание.
- `Spacer()`: избутва левия текст наляво и десния текст надясно.
- `.font(.footnote)`: задава по-малък стил на текста.
- `.fontWeight(.bold)`: задава удебелен текст.
- `.foregroundStyle(Color.white)`: задава цвета на предния план на бяло.
- `.padding(.vertical, 10)`: задава вътрешен отстъп отгоре и отдолу.
- `.padding(.horizontal, 16)`: задава вътрешен отстъп отляво и отдясно.
- `.background(Color.white.opacity(0.15))`: задава полупрозрачен бял фон.
- `.cornerRadius(20)`: задава заоблени ъгли.

Тук `Начинаещ` използва `.padding()` в две посоки:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Така текстът има пространство отгоре, отдолу, отляво и отдясно и изглежда повече като етикет.

`Color.white.opacity(0.15)` означава бяло с непрозрачност `15%`, тоест много светло бяло.

### Добавяне на фон на картата

По-рано създадохме `topView`, но само създаването на изглед не означава, че той ще се покаже автоматично.

В SwiftUI съдържанието, което наистина се показва на екрана, трябва да бъде написано в `body`.

Затова първо можем да поставим `topView` в `body`, за да го покажем:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Сега ще видим, че горната зона вече се показва:

![view](../../../Resource/026_view2.png)

Но тъй като текстът в `topView` е бял, а фонът по подразбиране също е светъл, в светъл режим може да не се вижда ясно.

Затова можем да добавим отвън един `VStack`, след което да зададем вътрешен отстъп, цвят на фона и заоблени ъгли за цялата зона:

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

Ефектът е:

![view](../../../Resource/026_view3.png)

Тук във `VStack` засега е поставен само един `topView`, така че изглежда сякаш не е задължителен.

Но по-късно ще продължим да добавяме заглавието на курса, описанието на курса и зоната с бутона. Всички те са съдържание, подредено вертикално, затова предварителното използване на `VStack` тук улеснява последващото комбиниране на изгледите.

Тук има два `.padding()` и техните роли са различни.

Първият `.padding(20)` е написан преди `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Той контролира вътрешния отстъп на картата, тоест разстоянието между съдържанието и ръба на фона.

Вторият `.padding(30)` е написан след `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Той контролира външния отстъп на картата, тоест разстоянието между цялата карта и ръба на екрана.

![view](../../../Resource/026_view4.png)

Затова, макар и все да е `.padding()`, когато е написан на различни места, ефектът също е различен.

## Зона със съдържание

След това създаваме зоната със съдържание на картата на курса.

Ефектът е:

![view](../../../Resource/026_view5.png)

Зоната със съдържание включва заглавие и описание на курса. Те са подредени вертикално, затова използваме `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Урок за начинаещи по SwiftUI")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Започнете от нулата със SwiftUI и систематично изучете декларативното UI разработване на Apple. Чрез ясни обяснения и практически примери постепенно ще овладеете оформление, взаимодействие и управление на състояние, за да създавате красиви и полезни интерфейси за приложения.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Ефектът е:

![view](../../../Resource/026_view6.png)

В този `VStack` използвахме два параметъра:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` означава, че изгледите вътре във `VStack` се подравняват вляво.

`spacing: 10` означава, че между изгледите вътре във `VStack` се запазва разстояние от `10 pt`.

Затова заглавието и описанието на курса ще започват отляво и между тях ще остане определено разстояние.

Описанието на курса е сравнително дълго. Ако се покаже изцяло, картата ще стане много висока, затова тук използваме `.lineLimit()`, за да ограничим броя на показваните редове:

```swift
.lineLimit(3)
```

Това означава, че се показват най-много `3` реда. Когато съдържанието надхвърли ограничението, излишната част ще бъде съкратена.

### Подравняване на изгледите вляво

Тук трябва да обърнем внимание и на още един детайл.

`VStack(alignment: .leading)` може да контролира само начина на подравняване на изгледите вътре във `VStack`. Той не контролира директно позицията на самия `VStack` във външния контейнер.

Например, ако описанието на курса е сравнително кратко:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Урок за начинаещи по SwiftUI")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Само малко съдържание.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Ефектът е:

![view](../../../Resource/026_view7.png)

Можем да видим, че въпреки че заглавието и описанието са подравнени вляво вътре във `VStack`, целият `VStack` не е прилепнал до най-левия край на картата.

Причината е, че когато съдържанието е сравнително кратко, ширината на `VStack` също ще бъде сравнително малка. При подреждане външният контейнер може да постави този по-тесен `VStack` в средата.

Можем да го разберем така: `VStack(alignment: .leading)` отговаря за вътрешното подравняване вляво.
Но той не отговаря за избутването на цялата зона със съдържание до най-левия край.

Ако искаме цялата зона със съдържание наистина да е вляво, можем да я обвием отвън с още един `HStack` и да добавим `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Урок за начинаещи по SwiftUI")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Само малко съдържание.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Ефектът е:

![view](../../../Resource/026_view8.png)

Тук `HStack` е хоризонтално оформление.

`Spacer()` ще заеме оставащото пространство вдясно и така ще избутва левия `VStack` към най-левия край.

Следователно `HStack + Spacer()` може да се използва за контролиране на позицията на цялата зона със съдържание.

В реалната карта на курса описанието обикновено е сравнително дълго и заема повече ширина, така че този проблем може да не е очевиден. Но е важно да разберем тази разлика, защото при създаване на оформления с кратък текст по-късно често ще срещаме подобни ситуации.

### Контролиране на разстоянието между вътрешните изгледи

По-рано във `VStack` написахме `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` се използва за контролиране на разстоянието между вътрешните изгледи.

Ако не зададем `spacing`, `VStack` също ще има разстояние по подразбиране, но то не винаги отговаря на желания ефект.

Тук, ако заглавието и описанието на курса са твърде близо, ще изглеждат претрупани, затова използваме:

```swift
spacing: 10
```

Така между тях остава малко пространство.

Ефектът е:

![view](../../../Resource/026_view9.png)

По същия начин горната зона и зоната със съдържание също са подредени вертикално, така че можем да използваме `spacing`, за да контролираме разстоянието между тях.

Сега поставяме `topView` и `contentView` в `body`:

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

Ефектът е:

![view](../../../Resource/026_view10.png)

Тук `VStack(spacing: 20)` контролира разстоянието между `topView` и `contentView`.

Тоест:

```swift
VStack(alignment: .leading, spacing: 10)
```

контролира разстоянието между заглавието и описанието на курса.

```swift
VStack(spacing: 20)
```

контролира разстоянието между горната зона и зоната със съдържание.

И двете са `spacing`, но действат върху различни `VStack`, затова обхватът им на влияние също е различен.

Така изгледът на зоната със съдържание е завършен.

## Зона с бутон

След това създаваме долната зона с бутона.

Ефектът е:

![view](../../../Resource/026_view11.png)

Зоната с бутона основно се състои от икона за възпроизвеждане и текст.

Можем да използваме `Image`, за да покажем иконата за възпроизвеждане, и `Text`, за да покажем текста на бутона.

Тук първо създаваме външен вид на бутон:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("бутонът е натиснат")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Започни обучението")
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

Ефектът е:

![view](../../../Resource/026_view12.png)

Тук използвахме два `HStack`:

Вътрешният `HStack` се използва за хоризонтално подреждане на иконата и текста:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Започни обучението")
}
```

Външният `HStack` заедно със `Spacer()` се използва, за да постави този външен вид на бутона вляво:

```swift
HStack {
    ...
    Spacer()
}
```

Когато натиснем бутона, в конзолата ще се изведе `бутонът е натиснат`.

## Основната карта е завършена

Сега комбинираме горната зона, зоната със съдържание и зоната с бутона:

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

Ефектът е:

![view](../../../Resource/026_view13.png)

До тук една основна карта на курс вече е завършена.

## Фон със Swift икона

Накрая добавяме към картата полупрозрачен фон със Swift икона.

![view](../../../Resource/026_view.png)

По-рано използвахме `Color.indigo` като цвят на фона. Всъщност `.background()` може да добавя не само цвят, но и цял изглед.

Затова първо можем да създадем специален фонов изглед:

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

В този фонов изглед използваме `VStack`, `HStack` и `Spacer()`, за да избутаме Swift иконата в долния десен ъгъл.

Тъй като Swift иконата служи само като декоративен фон, тук използваме полупрозрачно бяло:

```swift
Color.white.opacity(0.15)
```

Така иконата няма да бъде прекалено забележима и няма да влияе на текстовото съдържание отпред.

След това добавяме `backgroundView` към картата:

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

Полученият ефект е:

![view](../../../Resource/026_view14.png)

Тук използвахме два `.background()` последователно:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Първият `.background()` се използва за добавяне на фон със Swift икона.
Вторият `.background()` се използва за добавяне на фон в цвят индиго.

Така Swift иконата ще се показва върху фона в цвят индиго и ще бъде част от фона на картата.

Оттук можем да видим, че `.background()` може да добавя не само цвят, но и персонализиран изглед. Няколко `.background()` могат също да се комбинират, за да се получи по-богат фонов ефект.

До тук една цялостна карта на курс е завършена.

## Обобщение

В този урок чрез карта на курс преговорихме често използвани основни начини за оформление в SwiftUI.

Използвахме `Text`, за да показваме текст, `Image`, за да показваме системни икони, и `VStack`, `HStack` и `Spacer()`, за да контролираме подреждането на изгледите.

Научихме `.lineLimit()`, който може да ограничава максималния брой редове на текста. Когато съдържанието надхвърли ограничението, излишната част се съкращава.

Също така преговорихме често използвани модификатори като `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` и други.

След завършването на този урок вече можем да комбинираме няколко малки изгледа в един цялостен модул на карта.

Това е и много често срещан подход в разработването със SwiftUI: първо разделяме на малки изгледи, после ги комбинираме в цял интерфейс.

## Пълен код

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
            Text("Начинаещ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ урока")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Урок за начинаещи по SwiftUI")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Започнете от нулата със SwiftUI и систематично изучете декларативното UI разработване на Apple. Чрез ясни обяснения и практически примери постепенно ще овладеете оформление, взаимодействие и управление на състояние, за да създавате красиви и полезни интерфейси за приложения.")
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
    	        print("бутонът е натиснат")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Започни обучението")
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
