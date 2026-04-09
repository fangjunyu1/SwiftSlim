# struct i class

W poprzedniej lekcji dopiero zaczęliśmy poznawać `struct`, zdefiniowaliśmy jedną strukturę i dodatkowo poszerzyliśmy wiedzę o protokoły, `UUID` i inne zagadnienia.

Teraz mamy już wstępne pojęcie o słowie kluczowym `struct`, ale wciąż nie można powiedzieć, że naprawdę je rozumiemy.

W tej lekcji dalej będziemy skupiać się na `struct` jako głównej treści, a przy okazji poznamy też `class`. Dzięki tej lekcji jaśniej zrozumiesz: czym jest instance, czym jest konstruktor i dlaczego możemy używać `struct` i `class` do organizowania danych.

## System zarządzania uczniami

Na przykład teraz chcemy stworzyć system zarządzania uczniami. Każdy uczeń ma informacje takie jak imię, płeć, telefon, wiek, adres domowy i tak dalej.

W tym momencie możemy połączyć te informacje razem i zdefiniować je jako strukturę `Student`:

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

Tutaj używamy `struct`, aby zdefiniować typ ucznia.

Ta struktura `Student` zawiera wiele właściwości:

- `id`: unikalny identyfikator ucznia
- `name`: imię ucznia
- `sex`: płeć ucznia
- `phone`: telefon ucznia
- `age`: wiek ucznia
- `address`: adres domowy

W ten sposób kilka wcześniej rozproszonych danych zostaje połączonych w jednego pełnego „ucznia”.

Tutaj `Student` również jest zgodny z protokołem `Identifiable` i definiuje pole `id`, dzięki czemu późniejsze wyświetlanie danych razem z pętlą `ForEach` jest wygodne.

Następnie możemy utworzyć instance ucznia:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Ten kod oznacza, że na podstawie struktury `Student` można utworzyć konkretne dane ucznia.

Tutaj `Student` jest typem, a `Student(...)` oznacza utworzoną instance.

W SwiftUI możemy przypisać tę instance do zmiennej, a następnie ją wyświetlić.

Na przykład:

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

W ten sposób możemy zobaczyć w widoku imię tego ucznia: `Fang Junyu`.

Tutaj najpierw utworzyliśmy instance `Student`, potem przypisaliśmy ją do zmiennej `student`, a na końcu odczytaliśmy jej właściwość przez `student.name`.

## Czym jest instance

Kiedy dopiero zaczynamy uczyć się `struct`, słowo „instance” może wydawać się bardzo obce.

Ale w rzeczywistości używamy instances już od samego początku, tylko wcześniej nie zwracaliśmy na to szczególnej uwagi.

Na przykład:

```swift
let name = "Fang Junyu"
```

Tutaj `"Fang Junyu"` jest wartością tekstową i w istocie jest instance typu `String`.

Możemy też zapisać to tak:

```swift
let name = String("Fang Junyu")
```

Oba te sposoby zapisu wyrażają to samo: utworzenie instance typu `String` i przypisanie jej do zmiennej `name`.

To samo dotyczy także `Int`:

```swift
let num = 3
```

Tutaj `3` jest w istocie wartością typu `Int` i można ją też rozumieć jako instance `Int`.

A więc instance nie jest jakimś szczególnym pojęciem, które pojawia się tylko w `struct`.

Niezależnie od tego, czy chodzi o `String`, `Int`, `Double`, `Bool`, czy własny `Student`, wszystkie z nich mogą tworzyć instances.

Dlatego kiedy piszemy:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

to w istocie jest to to samo co tworzenie instance `String` albo `Int`, z tą różnicą, że `Student` jest typem zdefiniowanym przez nas samych.

## Konstruktor

Kiedy tworzymy instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

w rzeczywistości wywołujemy metodę inicjalizacji `Student`, czyli `init`.

Konstruktor możesz rozumieć tak: **to wejście odpowiedzialne za przypisywanie wartości właściwościom podczas tworzenia instance.**

To znaczy, zanim instance naprawdę zostanie w pełni utworzona, zwykle najpierw musi przejść przez `init`.

Na przykład, kiedy wcześniej uczyliśmy się cyklu życia widoków SwiftUI, pisaliśmy taki kod:

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

Tutaj `init()` wykonuje się wtedy, gdy tworzona jest instance `ContentView`, natomiast `onAppear` wykonuje się dopiero wtedy, gdy widok naprawdę zostaje pokazany na ekranie. To znaczy, że utworzenie widoku i jego wyświetlenie nie dzieją się w tym samym momencie.

Podobnie, gdy tworzymy `Student(...)`, również wywołujemy konstruktor `Student`.

### Konstruktor generowany automatycznie przez system

Kiedy definiowaliśmy `Student`, nie pisaliśmy ręcznie `init`:

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

Mimo to wciąż możemy bezpośrednio utworzyć instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Dlaczego można utworzyć instance bez napisania konstruktora?

Dlatego że dla `struct`, jeśli nie napiszemy konstruktora ręcznie, system zwykle automatycznie generuje dla nas odpowiedni konstruktor.

Na początkowym etapie nauki można to po prostu rozumieć tak: Swift automatycznie uzupełnia za nas kod inicjalizacji.

W przybliżeniu można to rozumieć tak, że system dopisuje nam następujący kod:

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

Tutaj trzeba zwrócić uwagę na jeden szczegół:

```swift
let id = UUID()
```

`id` ma już wartość domyślną, więc przy tworzeniu instance nie musimy ponownie ręcznie przekazywać `id`.

To znaczy, że właściwości bez wartości domyślnej zwykle trzeba przekazać w konstruktorze, natomiast właściwości, które już mają wartość domyślną, zwykle mogą po prostu używać tej oryginalnej wartości.

Dlatego tworząc instance `Student`, musimy przekazać tylko `name`, `sex`, `phone`, `age` i `address`.

### Podpowiedzi kompilatora

Dodatkowo, kiedy wpisujemy `Student(...)` w Xcode, możemy też zobaczyć podpowiedzi parametrów podawane przez system.

![student](../../Resource/022_student.png)

To również pokazuje, że bieżący typ rzeczywiście ma konstruktor wygenerowany automatycznie przez system.

### Pisanie konstruktora samodzielnie

Chociaż system może automatycznie wygenerować konstruktor, czasem ta domyślna metoda inicjalizacji nie odpowiada w pełni naszym potrzebom.

Na przykład mamy strukturę `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Według konstruktora wygenerowanego automatycznie przez system, przy tworzeniu instance musimy jednocześnie przekazać te trzy parametry:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ale jeśli teraz chcemy wprowadzić grupę starych filmów i znamy tylko ich nazwy, a nie znamy reżysera ani oceny, staje się to trochę niewygodne.

Bo wtedy możemy pisać to tylko tak:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Chociaż to działa, ciągłe powtarzanie `--` za każdym razem nie jest wygodne.

Wtedy możemy napisać konstruktor:

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

W ten sposób, tworząc stare filmy, musimy przekazać tylko `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

To jest jedno ze znaczeń pisania konstruktora samodzielnie: **sprawić, by sposób tworzenia instances lepiej odpowiadał rzeczywistym potrzebom.**

### Analiza custom konstruktora

Spójrzmy na ten ręcznie napisany konstruktor sprzed chwili:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Znaczenie tego kodu jest takie, że przy tworzeniu instance `Movie` trzeba przekazać tylko jeden parametr `name`.

Następnie wewnątrz konstruktora przekazane `name` zostanie przypisane do własnego `name` instance, a `director` i `rating` otrzymają wartość domyślną `--`.

Tutaj `self` oznacza „ten bieżący instance sam”.

Na przykład:

```swift
self.name = name
```

`self.name` po lewej stronie oznacza właściwość instance, a `name` po prawej stronie oznacza parametr, który przekazaliśmy.

Można to po prostu rozumieć jako zapisanie wartości przekazanej z zewnątrz do własnej właściwości instance.

Kiedy wszystkie właściwości dostaną wartości, tworzenie tej instance jest zakończone.

### Mechanizm konstruktora

Kiedy jawnie deklarujemy konstruktor, zachodzi jeszcze jedna zmiana:

konstruktor, który system wcześniej generował automatycznie, zwykle nie może już być używany bezpośrednio.

Na przykład:

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

Teraz, jeśli znowu napiszemy tak:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

kompilator zgłosi błąd:

```swift
Extra arguments at positions #2, #3 in call
```

To znaczy: przekazałeś zbędne parametry.

Dlaczego pojawia się ten błąd?

Ponieważ w bieżącej strukturze `Movie` istnieje tylko ten jeden konstruktor, który zadeklarowałeś ręcznie:

```swift
init(name: String)
```

Przyjmuje on tylko jeden parametr `name` i nie przyjmuje `director` ani `rating`.

To znaczy, że gdy ręcznie dodasz własny konstruktor, pierwotny automatycznie generowany sposób inicjalizacji nie może już być bezpośrednio używany.

Jeśli chcemy obsługiwać jednocześnie „podanie tylko nazwy” i „podanie pełnych informacji”, to musimy sami dopisać jeszcze jeden pełny konstruktor:

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

W ten sposób mamy już dwa różne konstruktory.

Tworząc stary film, możemy napisać tak:

```swift
Movie(name: "The Night of the Hunter")
```

A tworząc nowy film z pełnymi informacjami, możemy napisać tak:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ten sposób zapisu pokazuje też, że ten sam typ może mieć wiele konstruktorów, o ile ich formy parametrów są różne.

## Czym jest overload

Tutaj dodajmy jeszcze jeden potrzebny punkt wiedzy.

Przed chwilą napisaliśmy dwa `init` dla `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Taki sposób pisania, czyli „ta sama nazwa funkcji, ale różne parametry”, nazywa się „overload”.

Tutaj obie funkcje mają nazwę `init`, ale ponieważ przyjmują różne parametry, Swift potrafi rozróżnić, którą funkcję wywołujesz.

Na przykład:

```swift
Movie(name: "Days of Heaven")
```

wywoła:

```swift
init(name: String)
```

Natomiast:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

wywoła drugą pełną wersję metody inicjalizacji.

Zatem rola overload polega na tym, by pozwolić temu samemu typowi oferować różne sposoby tworzenia w zależności od sytuacji.

## Poznanie class

Następnie krótko poznajmy też `class`.

Oprócz powszechnego w Swift `struct`, wiele języków programowania używa `class` do tworzenia instances, na przykład Java, C#, Kotlin i inne.

W Swift sposób zapisu `class` jest bardzo podobny do `struct`.

Na przykład:

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

Zauważysz, że poza zmianą słowa kluczowego z `struct` na `class`, pozostałe części wyglądają prawie tak samo.

Sposób tworzenia instance jest również bardzo podobny:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Dlatego na poziomie składni `struct` i `class` naprawdę są do siebie bardzo podobne.

### Różnica między Struct a Class

Chociaż `struct` i `class` wyglądają bardzo podobnie, nie są dokładnie tym samym.

**1. Sposób inicjalizacji jest inny**

Dla `struct`, jeśli nie napiszemy konstruktora ręcznie, system zwykle automatycznie generuje odpowiednią metodę inicjalizacji.

Ale dla `class`, jeśli istnieją właściwości, które nie mają jeszcze wartości domyślnej, zwykle musimy ręcznie napisać `init`, inaczej pojawi się błąd.

Na przykład:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ta `class` spowoduje błąd, ponieważ nie ma konstruktora, więc jej właściwości nie są inicjalizowane.

Kompilator wyświetli coś podobnego do:

```swift
Class 'Movie' has no initializers
```

Dlatego w tym przykładzie `class` musi mieć ręcznie napisany konstruktor.

**2. `struct` to value type, a `class` to reference type**

`struct` to value type, a `class` to reference type.

Na początku nauki nie trzeba w pełni opanować tych dwóch pojęć; wystarczy proste wstępne zrozumienie.

Na przykład `struct` bardziej przypomina „kopiowanie nowej wartości”.

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

Tutaj po przypisaniu `user1` do `user2` tak naprawdę powstaje nowa kopia danych, więc zmiana `user2` nie wpływa na `user1`.

Z kolei `class` bardziej przypomina „wspólne wskazywanie na tę samą instance”.

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

Tutaj `user1` i `user2` wskazują na tę samą instance.

Na razie nie musimy w pełni rozumieć wewnętrznego mechanizmu value type i reference type; wystarczy wiedzieć, że `struct` lepiej nadaje się do przechowywania niezależnych danych, a `class` lepiej wtedy, gdy wiele miejsc ma współdzielić tę samą instance.

## Jak wybierać na początku nauki

Na obecnym etapie dla zwykłych modeli danych najpierw warto rozważać `struct`, a gdy potrzebne są współdzielone dane i zsynchronizowane zmiany, wtedy rozważać `class`.

To nie jest absolutna reguła, ale dla początkujących to wystarczająco praktyczny sposób oceniania.

Szczególnie w SwiftUI często zauważysz, że `struct` już potrafi wykonać większość pracy.

Ponadto w wielu materiałach programistycznych to, co tworzy `class`, bywa także nazywane „obiektem”. Na początku nauki możesz po prostu rozumieć to jako instance, bez konieczności celowego rozróżniania.

## Podsumowanie

W tej lekcji głębiej poznaliśmy `struct`, a przy okazji również `class`; obu można używać do definiowania typów.

Typy mogą tworzyć instances. Gdy tworzona jest instance, wywoływany jest konstruktor, czyli `init`.

Dla `struct`, jeśli nie napiszemy konstruktora ręcznie, system zwykle automatycznie generuje odpowiedni konstruktor. Jeśli domyślny konstruktor nie spełnia potrzeb, możemy również napisać go sami.

Dodatkowo uzyskaliśmy też początkowe zrozumienie różnicy między `struct` a `class`: `struct` to value type, a `class` to reference type. W SwiftUI na początku nauki zwykle częściej spotkasz `struct`.

Później, gdy będziemy uczyć się przekazywania wartości między widokami, modeli danych i zarządzania stanem, cała ta treść nadal będzie używana.
