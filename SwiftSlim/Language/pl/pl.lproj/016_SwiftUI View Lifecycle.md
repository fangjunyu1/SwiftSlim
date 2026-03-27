# Cykl życia widoku w SwiftUI

W poprzedniej lekcji dowiedzieliśmy się, że zmienne `@State` podążają za cyklem życia widoku, a także poznaliśmy podstawowe użycie `onAppear`.

W tej lekcji lepiej zrozumiemy cykl życia widoku w SwiftUI: dowiemy się, jak widok jest tworzony i wyświetlany, jak zmienne wewnątrz widoku są tworzone i odtwarzane, a także poznamy `onAppear`, `onDisappear` oraz konstruktor `init`.

Na podstawie tej wiedzy zbudujemy całościowe zrozumienie procesu tworzenia widoku w SwiftUI.

## Kolejność uruchamiania aplikacji

Podczas tworzenia projektu iOS Xcode domyślnie generuje dwa pliki:

```swift id="g8k3p2"
ContentView.swift
ProjectName + App.swift
```

Spośród nich plik `ProjectName + App.swift` jest plikiem wejściowym całej aplikacji.

Na przykład:

```swift id="x2m9qa"
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Przepływ wykonywania kodu

Gdy uruchamiamy aplikację (na symulatorze albo na prawdziwym urządzeniu), system wyszukuje słowo kluczowe `@main`:

```swift id="4n7vlu"
@main
struct SwiftSlimTestApp: App {...}
```

Po potwierdzeniu pliku wejściowego rozpoczyna wykonywanie kodu.

Najpierw wchodzi do struktury `App`, wykonuje kod w `body`, następnie tworzy `WindowGroup` i ładuje znajdujący się w nim `ContentView`.

### Rola WindowGroup

`WindowGroup` służy do zarządzania oknami:

```swift id="0mb83m"
WindowGroup {
    ContentView()
}
```

Systemy iPad oraz macOS obsługują wiele okien, natomiast iPhone zwykle ma tylko jedno okno.

Dlatego na iPhonie `WindowGroup` zarządza głównie pierwszym wyświetlanym ekranem.

### Proces ładowania widoku

Gdy system znajdzie `ContentView`:

```swift id="34wx0f"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI wykona kod w `body`, a następnie na podstawie zwróconej struktury widoku (takiej jak `VStack`, `Text` itd.) zbuduje interfejs i wyświetli go na ekranie.

Po zakończeniu tych kroków możemy zobaczyć `ContentView` w widoku.

![ContentView](../../Resource/016_view1.png)

Trzeba zwrócić uwagę, że rolą `body` jest generowanie widoku, a nie jego przechowywanie.

To oznacza, że za każdym razem, gdy widok jest odświeżany, SwiftUI ponownie oblicza `body` i generuje nową strukturę widoku.

### Logika widoku podglądu

Podgląd Xcode (`Canvas`) i rzeczywiste uruchomienie to dwa różne mechanizmy.

Na przykład, jeśli dodamy wyjście debugowania w pliku wejściowym:

```swift id="2tq61v"
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Podczas podglądu widoku `ContentView` w Xcode wykonanie nie zaczyna się od wejścia `@main`, dlatego `onAppear` z pliku wejściowego nie zostanie wywołane.

Jeśli jednak uruchomimy aplikację na symulatorze albo na prawdziwym urządzeniu, system rozpocznie od `@main`, przejdzie przez pełny proces działania aplikacji, wywoła `onAppear` z wejścia i wypisze informację debugowania.

Klucz polega na tym, że podgląd w Xcode jest tylko „częściowym renderowaniem” i służy wyłącznie do pokazywania bieżącego widoku; symulator i prawdziwe urządzenie dostarczają „pełne środowisko uruchomieniowe” i wykonują całą aplikację.

Dlatego podczas testowania funkcji aplikacji należy opierać się na symulatorze albo prawdziwym urządzeniu, ponieważ podgląd Xcode nie zapewnia pełnego środowiska działania.

## Cykl życia widoku

Na obecnym etapie cały nasz kod znajduje się w `ContentView`. Jednak w rzeczywistej aplikacji App zwykle zawiera wiele widoków, które przełączają się między sobą w różnych scenariuszach.

Na przykład w „skarbonce”:

![PiggyBank](../../Resource/016_view.png)

Gdy klikniemy „Save Money”, wyświetlany jest widok `SaveView`; gdy odkładanie pieniędzy się zakończy albo widok zostanie zamknięty, `SaveView` zostaje usunięty.

Ten proces to właśnie cykl życia widoku: od utworzenia widoku, przez jego wyświetlenie, aż do ostatecznego usunięcia.

### Zamknięcie aplikacji

Gdy aplikacja zostaje zamknięta, wszystkie widoki są usuwane, a powiązane stany znikają.

Dlatego `ContentView` i inne widoki są usuwane z pamięci, a cały stan działania aplikacji zostaje wyczyszczony.

## Cykl życia zmiennych w widoku

W SwiftUI cykl życia zmiennych jest zwykle powiązany z widokiem.

Na przykład:

```swift id="g6r8kj"
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Zmienna @State

Zmienna zadeklarowana za pomocą `@State` jest powiązana z cyklem życia widoku.

```swift id="0jpn45"
@State private var name = "FangJunyu"
```

Gdy widok jest tworzony, `name` również zostaje utworzone; gdy widok jest usuwany, `name` także zostaje zniszczone.

To właśnie dlatego trzeba używać takich mechanizmów jak `UserDefaults`, aby zapewnić trwałe przechowywanie danych.

### Zmienna wewnątrz body

Zmienne zdefiniowane w `body`:

```swift id="3vk0nx"
var num = 10
```

Ich cykl życia jest związany z procesem wykonywania `body`.

Gdy stan SwiftUI się zmienia, na przykład:

```swift id="o6gdl7"
@State private var name = "FangJunyu"
name = "Hu"
```

Gdy `name` się zmienia, `@State` wykrywa zmianę danych i powiadamia SwiftUI o konieczności ponownego obliczenia widoku, więc `body` jest przeliczane od nowa.

Podczas ponownego obliczania `body` cały kod wewnątrz `body` zostaje wykonany ponownie, a zmienne w `body` (takie jak `num`) zostają utworzone od nowa.

To również wyjaśnia, dlaczego nie zaleca się definiowania złożonych zmiennych w `body`.

Ponieważ przy każdym odświeżeniu widoku zmienne w `body` są tworzone od nowa, zwiększa to koszt obliczeń i wpływa na wydajność.

W SwiftUI różne rodzaje danych powinny być zarządzane różnymi metodami: dane, które mają podążać za cyklem życia widoku, można przechowywać w `@State`; dane do tymczasowych obliczeń można umieszczać w `body`.

## onAppear i onDisappear

W poprzedniej lekcji poznaliśmy już `onAppear`: gdy widok się pojawia, `onAppear` zostaje wywołane.

```swift id="c0xj4n"
.onAppear {}
```

Na przykład:

```swift id="v15wsh"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

W podglądzie Xcode albo podczas uruchomienia można zobaczyć wynik debugowania z `onAppear`.

### onDisappear

Odpowiednikiem `onAppear` jest `onDisappear`:

```swift id="9xk48v"
.onDisappear {}
```

Gdy widok zostaje zamknięty, `onDisappear` zostaje wywołane.

Na przykład:

```swift id="2cg3pz"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Gdy widok zostaje usunięty, wykonany zostaje kod znajdujący się w `onDisappear`.

Wskazówka: na obecnym etapie używany `ContentView` jest widokiem głównym aplikacji i nie można go bezpośrednio zamknąć ani usunąć. Dlatego na tym etapie nie da się bezpośrednio zaobserwować działania `onDisappear`.

Dopiero w późniejszej nauce przechodzenia między stronami i otwierania nowych widoków będzie można zobaczyć wywołanie `onDisappear`.

## Logika tworzenia i wyświetlania

Trzeba pamiętać, że utworzenie widoku i jego wyświetlenie to dwa różne etapy.

Gdy widok jest tworzony, wywoływana jest metoda konstruktora struktury:

```swift id="r58n7k"
init() {}
```

Ponieważ widok SwiftUI jest strukturą `struct`:

```swift id="gm0y0d"
struct ContentView: View { ... }
```

to gdy instancja widoku zostaje utworzona, wykonywany jest konstruktor `init`. Dopiero gdy widok zostaje wyświetlony, wywoływana jest metoda `onAppear`.

Na przykład:

```swift id="2j44rx"
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
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Podczas podglądu widoku w Xcode można zobaczyć takie informacje debugowania:

```swift id="vry4w1"
Create ContentView
Show ContentView
```

To pokazuje, że najpierw wykonywany jest `init`, aby utworzyć widok, następnie obliczany jest kod w `body`, a na końcu widok jest wyświetlany i wykonywane jest `onAppear`.

Dlatego trzeba rozumieć, że etap tworzenia widoku i etap jego wyświetlania są rozdzielone.

### Konstruktor init

`init` jest podstawową składnią Swift. Zarówno `struct`, jak i `class` mogą go definiować i służy on do inicjalizacji obiektu.

```swift id="w1mjdc"
init() {}
```

W SwiftUI, gdy widok jest tworzony, system wywołuje metodę `init` widoku, której można użyć do odbierania parametrów i inicjalizacji danych.

Jeśli nie napiszemy `init` ręcznie, Swift automatycznie wygeneruje domyślny konstruktor dla `struct`.

Dla widoków SwiftUI, takich jak `ContentView`, podczas tworzenia widoku wykonywane jest `init`, a podczas wyświetlania widoku wykonywane jest `onAppear`.

Dlatego `init` jest konstruktorem wykonywanym w momencie utworzenia widoku i będzie przydatny później przy przekazywaniu parametrów albo inicjalizacji danych.

## Podsumowanie

W tej lekcji poznaliśmy kolejność uruchamiania aplikacji — od pliku wejściowego aż do wykonania pliku `ContentView`.

Zrozumieliśmy cykl życia widoku w SwiftUI: podczas tworzenia widoku wykonywane jest `init`, podczas pojawienia się na ekranie wykonywane jest `onAppear`, a podczas usunięcia albo zamknięcia widoku wykonywane jest `onDisappear`.

Poznaliśmy też mechanizm aktualizacji widoku: widok jest sterowany przez stan. Gdy stan taki jak `@State` ulega zmianie, SwiftUI odświeża widok, ponownie oblicza `body`, a zmienne znajdujące się w `body` są również tworzone od nowa.

Cykl życia zmiennych jest powiązany z cyklem życia widoku, natomiast tymczasowe zmienne w `body` są tworzone od nowa przy każdym odświeżeniu.

Zrozumienie tych cykli życia oraz zachowania zmiennych pomaga lepiej organizować kod i sprawia, że logika aplikacji staje się bardziej przejrzysta.
