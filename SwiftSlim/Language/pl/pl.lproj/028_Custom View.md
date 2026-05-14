# Niestandardowy View

W tej lekcji nauczymy się bardzo ważnego sposobu pisania w SwiftUI: **niestandardowy View**.

Niestandardowy View może hermetyzować powtarzający się fragment kodu widoku i zamienić go w View, którego można używać wielokrotnie.

Podczas rzeczywistego tworzenia App często spotykamy taką sytuację: struktura wielu ekranów jest taka sama, różni się tylko wyświetlana treść.

Na przykład na liście postów w serwisie forum każdy post może mieć tytuł, obraz, liczbę polubień i inne informacje.

![Reddit](../../../Resource/028_view1.png)

Na liście produktów w serwisie zakupowym każdy produkt może mieć obraz, nazwę, cenę i inne informacje.

![Amazon](../../../Resource/028_view2.png)

Struktura tych treści jest podobna; różnią się tylko wyświetlane dane.

Jeśli ręcznie napiszemy kod dla każdego elementu, kod stanie się bardzo długi, a późniejsze modyfikowanie nie będzie wygodne.

Dlatego możemy zamknąć wspólną strukturę w niestandardowym View, a różną treść przekazywać do środka jako parametry.

Dzięki temu ten sam View może wyświetlać różne treści.

## Scenariusz wymagania

Na przykład teraz chcemy utworzyć listę ustawień.

Efekt wyświetlania:

![view](../../../Resource/028_view.png)

Na tej liście ustawień znajdują się trzy różne elementy: `Ustawienia`, `Folder` i `Muzyka`.

Chociaż ich ikony, kolory i tytuły są różne, ogólna struktura jest taka sama:

- Ikona po lewej
- Kolor tła ikony
- Tytuł pośrodku
- Strzałka po prawej

Jeśli nie użyjemy niestandardowego View, moglibyśmy napisać tak:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Ustawienia")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Folder")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Muzyka")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Ten kod może wyświetlać się poprawnie, ale problem jest również bardzo oczywisty: kod trzech elementów ustawień jest prawie całkowicie taki sam.

Różnią się tylko ikona, kolor i tytuł:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Ustawienia")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Muzyka")
```

Innymi słowy, struktura każdego elementu ustawień jest stała, a różnią się tylko ikona, kolor i tytuł.

Taka sytuacja bardzo dobrze nadaje się do użycia niestandardowego View.

### Cień shadow

Tutaj używamy nowego modyfikatora `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` może dodać cień do View.

`radius` oznacza promień rozmycia cienia. Im większa wartość, tym zwykle większy zakres rozproszenia cienia i tym bardziej miękko on wygląda.

Tutaj ustawiono wartość `1`, co oznacza dodanie tylko bardzo delikatnego efektu cienia.

## Hermetyzowanie View elementu ustawień

Następnie hermetyzujemy każdy element ustawień w nowym View.

Możemy utworzyć `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

W tym View definiujemy trzy właściwości:

```swift
let icon: String
let color: Color
let title: String
```

Wśród nich:

- `icon` oznacza nazwę ikony
- `color` oznacza kolor tła ikony
- `title` oznacza tytuł elementu ustawień

Ponieważ te trzy wartości są różne w różnych elementach ustawień, robimy z nich parametry, które można przekazywać z zewnątrz.

## Używanie niestandardowego View

Gdy mamy już `SettingItemView`, nie musimy już powtarzać dużego fragmentu kodu `HStack`.

Teraz możemy użyć go tak:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ustawienia")
```

Ta linia kodu oznacza utworzenie View elementu ustawień i przekazanie trzech parametrów:

```swift
icon: "gear"
color: Color.blue
title: "Ustawienia"
```

Po przekazaniu właściwości wewnątrz `SettingItemView` otrzymają odpowiednie wartości:

- wartość `icon` to `gear`
- wartość `color` to `Color.blue`
- wartość `title` to `"Ustawienia"`

Dlatego wewnątrz View `Image(systemName: icon)` wyświetli ikonę koła zębatego, `.background(color)` użyje niebieskiego tła, a `Text(title)` wyświetli `Ustawienia`.

Pełny kod:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Ustawienia")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Muzyka")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/028_view.png)

Widać, że po hermetyzacji efekt wyświetlania jest taki sam jak wcześniej, ale kod stał się bardziej czytelny.

Wcześniej każdy element ustawień wymagał napisania całego fragmentu `HStack`, a teraz wystarczy jedna linia kodu:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ustawienia")
```

Na tym polega rola niestandardowego View: **hermetyzuje powtarzającą się strukturę View i przekazuje tylko różną treść jako parametry.**

## Dlaczego można przekazywać parametry

Następnie krótko zrozumiemy, dlaczego niestandardowy View może przyjmować parametry.

W SwiftUI View jest zasadniczo strukturą.

Na przykład:

```swift
struct ContentView: View {
    var body: some View {
        Text("Witaj, świecie!")
    }
}
```

Tutaj `ContentView` jest strukturą.

Gdy piszemy:

```swift
ContentView()
```

w rzeczywistości tworzymy View `ContentView`.

Końcowe `()` oznacza wywołanie jego metody inicjalizacji; można to również rozumieć jako utworzenie tego View.

Ponieważ ten `ContentView` nie ma właściwości, które trzeba przekazać z zewnątrz, możemy napisać bezpośrednio:

```swift
ContentView()
```

Jeśli jednak View ma właściwość bez przypisanej wartości, podczas tworzenia View trzeba przekazać odpowiednią wartość.

Na przykład:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("imię: \(name)")
    }
}
```

Tutaj `name` jest właściwością i nie ma wartości domyślnej.

Dlatego podczas tworzenia `ContentView` trzeba podać konkretną wartość dla `name`:

```swift
ContentView(name: "Fang Junyu")
```

Dzięki temu View może używać tej wartości wewnątrz:

```swift
Text("imię: \(name)")
```

To jest również powód, dla którego podczas tworzenia `SettingItemView` trzeba przekazać parametry:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ustawienia")
```

Ponieważ w `SettingItemView` są trzy właściwości bez wartości domyślnych:

```swift
let icon: String
let color: Color
let title: String
```

Dlatego podczas tworzenia tego View trzeba przekazać je do środka. Przekazane parametry zostaną użyte przez Swift do przypisania wartości właściwościom wewnątrz View.

## Metoda inicjalizacji

Następnie zrozumiemy trochę głębiej metodę inicjalizacji.

### Domyślna metoda inicjalizacji

Gdy definiujemy zwykły View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Witaj, świecie!")
    }
}
```

W tym kodzie nie napisaliśmy ręcznie metody inicjalizacji.

Ale gdy używamy tego View, możemy napisać tak:

```swift
ContentView()
```

Tutaj `()` w rzeczywistości oznacza utworzenie `ContentView`; można to również rozumieć jako wywołanie jego metody inicjalizacji.

### Dlaczego można ją wywołać, chociaż nie widać metody inicjalizacji?

Ponieważ kompilator Swift automatycznie generuje dla nas metodę inicjalizacji.

Warto zauważyć: **ta metoda inicjalizacji jest generowana automatycznie i zwykle nie widzimy jej bezpośrednio w kodzie.**

Innymi słowy, chociaż nie napisaliśmy ręcznie w `struct`:

```swift
init() {

}
```

kompilator Swift w tle wygeneruje dla nas mniej więcej taką metodę inicjalizacji:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Witaj, świecie!")
    }
}
```

Właśnie dlatego możemy napisać bezpośrednio:

```swift
ContentView()
```

Dlatego w rzeczywistym kodzie zwykle nie musimy ręcznie wypisywać metody inicjalizacji.

Wystarczy zrozumieć jedną rzecz: **podczas tworzenia SwiftUI View wywoływana jest metoda inicjalizacji tego View. Nawet jeśli nie napiszemy metody inicjalizacji ręcznie, Swift może automatycznie ją wygenerować.**

### Metoda inicjalizacji z parametrami

Jeśli w View znajduje się właściwość bez wartości domyślnej, na przykład:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("imię: \(name)")
    }
}
```

kompilator Swift automatycznie wygeneruje metodę inicjalizacji z parametrem na podstawie właściwości.

Można to prosto rozumieć tak:

```swift
init(name: String) {
    self.name = name
}
```

Tutaj:

```swift
init(name: String)
```

oznacza, że podczas tworzenia `ContentView` trzeba przekazać parametr `name` typu `String`.

Gdy piszemy:

```swift
ContentView(name: "Fang Junyu")
```

oznacza to: przekazać `"Fang Junyu"` jako parametr do metody inicjalizacji.

Następnie wewnątrz metody inicjalizacji zostanie wykonane:

```swift
self.name = name
```

Ta linia kodu oznacza: przypisać `name` przekazane z zewnątrz do własnej właściwości `name` bieżącego View.

Można to prosto rozumieć tak:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("imię: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

W ten sposób View może używać przekazanej wartości wewnątrz.

To jest proces inicjalizacji View z parametrami: **gdy właściwość wewnątrz View nie ma wartości domyślnej, podczas tworzenia View trzeba przekazać odpowiedni parametr, aby metoda inicjalizacji zakończyła przypisanie wartości do właściwości.**

## Sytuacja, gdy właściwość ma wartość domyślną

Jeśli właściwość ma już wartość domyślną, podczas tworzenia View można nie przekazywać parametru.

Na przykład:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("imię: \(name)")
    }
}
```

Tutaj `name` ma już wartość domyślną:

```swift
"Fang Junyu"
```

Dlatego podczas tworzenia `ContentView` możemy napisać bezpośrednio:

```swift
ContentView()
```

Wtedy `name` użyje wartości domyślnej, a interfejs wyświetli:

```swift
imię: Fang Junyu
```

Oczywiście podczas tworzenia View można też przekazać nową wartość:

```swift
ContentView(name: "Sam")
```

Wtedy View użyje `"Sam"` przekazanego z zewnątrz, zamiast wartości domyślnej, a interfejs wyświetli:

```swift
imię: Sam
```

Dla łatwiejszego zrozumienia metodę inicjalizacji automatycznie generowaną przez kompilator Swift można uprościć do takiej postaci:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Tutaj `name: String = "Fang Junyu"` oznacza: jeśli podczas tworzenia View nie zostanie przekazane `name`, użyj wartości domyślnej `"Fang Junyu"`; jeśli podczas tworzenia View zostanie przekazane nowe `name`, użyj przekazanej wartości.

Innymi słowy: **jeśli z zewnątrz nie przekazano parametru, używana jest wartość domyślna właściwości; jeśli z zewnątrz przekazano parametr, używana jest przekazana wartość.**

## Powrót do SettingItemView

Teraz wróćmy do SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Struktura tego View jest stała.

Stałe części obejmują:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Różne części obejmują:

```swift
icon
color
title
```

Dlatego z różnej treści robimy właściwości i przekazujemy je jako parametry podczas tworzenia View.

Gdy tworzymy różne elementy ustawień, wystarczy przekazać różne parametry:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ustawienia")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Muzyka")
```

Dzięki temu ten sam `SettingItemView` może wyświetlić trzy różne elementy ustawień.

To najczęstszy sposób używania niestandardowego View.

## Podsumowanie

W tej lekcji nauczyliśmy się niestandardowego View.

Główna rola niestandardowego View to: **hermetyzować powtarzający się kod widoku, aby można go było ponownie wykorzystać.**

W tym przykładzie struktura trzech elementów ustawień jest taka sama, różnią się tylko ikona, kolor i tytuł.

Dlatego utworzyliśmy `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Następnie podczas używania tego View przekazujemy różne parametry:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ustawienia")
```

Te parametry trafiają do wnętrza `SettingItemView`.

W ten sposób możemy użyć mniej kodu, aby tworzyć View o tej samej strukturze, ale z różną treścią.

Jest to również bardzo powszechny sposób pisania w rozwoju SwiftUI.
