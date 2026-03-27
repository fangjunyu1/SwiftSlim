# Zmienne i stałe

W tej lekcji nauczymy się przede wszystkim zmiennych i stałych w Swift, a także poznamy kilka często używanych typów danych oraz podstawowe operatory.

To wszystko są najbardziej podstawowe elementy programowania i jednocześnie ważna podstawa do dalszej nauki SwiftUI.

## Zmienne i stałe w życiu codziennym

Możemy zrozumieć zmienne i stałe przez przykłady z codziennego życia.

Zmienne w życiu:

* treść każdego programu w telewizji jest inna
* pogoda każdego dnia się zmienia
* wskazówki zegara zmieniają się co sekundę

Wspólną cechą tych rzeczy jest to, że ulegają zmianie.

Gdyby telewizor zawsze pokazywał tylko jeden obraz, pogoda zawsze była słoneczna, a wskazówki zegara nigdy się nie poruszały, wtedy takie rzeczy byłyby stałymi.

Jedna rzecz może się zmieniać, a druga nie może się zmieniać.

## Zrozumienie zmiennych i stałych

Podczas tworzenia aplikacji często trzeba pozwolić użytkownikowi wprowadzać albo zapisywać różne informacje.

Na przykład:

* nazwę konta
* datę urodzenia
* dane kontaktowe
* adres zamieszkania

Takie informacje są zapisywane i wyświetlane.

Na przykład użytkownik wpisuje w aplikacji nazwę:

```id="x0lzl0"
FangJunyu
```

Musimy zapisać tę nazwę, aby można ją było wyświetlić w aplikacji.

Proces zapisywania można uprościć i wyobrazić sobie jako odkładanie czegoś do szuflady.

Kiedy zapisujemy nazwę, to tak, jakbyśmy wkładali ją do szuflady.

Rzeczy do zapisania może być wiele, więc szuflad też będzie wiele. Aby wiedzieć, co znajduje się w każdej z nich, musimy nadać każdej szufladzie nazwę.

Na przykład:

```id="5osq9g"
name
```

W tym przykładzie name jest nazwą, a FangJunyu jest zapisaną informacją.

![Var](../../RESOURCE/007_var.png)

**W Swift, jeśli chcesz przechowywać dane, musisz zadeklarować je przy użyciu zmiennej (var) albo stałej (let).**

Ponieważ nazwa zwykle może zostać zmieniona, powinniśmy użyć zmiennej.

```swift
var name = "FangJunyu"
```

Tutaj zadeklarowano zmienną o nazwie name. Jej typ to String, a wartość to "FangJunyu".

### Różnica między zmienną a stałą

Zmienne deklaruje się przy użyciu var:

```swift
var
```

Stałe deklaruje się przy użyciu let:

```swift
let
```

Na przykład:

```swift
var name = "FangJunyu"
let id = 123456
```

Jeśli coś zostało zadeklarowane jako zmienna, oznacza to, że jego wartość może zostać zmieniona. Jeśli zostało zadeklarowane jako stała, nie można go już zmienić.

Dlatego główna różnica między zmiennymi a stałymi polega na tym, czy wartość może się zmieniać.

### Zmiana stałej

Jeśli kod spróbuje zmienić wartość stałej:

```swift
let name = "Sam"
name = "Bob"
```

Swift zgłosi, że przypisanie nie może zostać wykonane, ponieważ jest to stała.

```id="53n0vq"
Cannot assign to property: 'name' is a 'let' constant
```

Taki mechanizm pomaga programistom uniknąć przypadkowej zmiany pewnych ważnych danych.

### Wyświetlanie w SwiftUI

Otwórz plik ContentView.swift i zadeklaruj zmienną wewnątrz View:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Tutaj zadeklarowano zmienną o nazwie name i wyświetlono ją na ekranie przy pomocy Text.

Jeśli zmienimy zawartość zmiennej:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

tekst wyświetlany przez Text również się zmieni.

W ten sposób możemy używać zmiennych do kontrolowania treści wyświetlanej w interfejsie, bez konieczności każdorazowego ręcznego zmieniania tekstu wewnątrz Text.

Jeśli inne miejsce w kodzie także potrzebuje tej informacji, możemy przekazać tam zmienną — tak jakbyśmy przekazali zawartość „szuflady” do użycia w innym miejscu.

### Położenie zmiennych i stałych w SwiftUI

W SwiftUI zmienne i stałe zwykle zapisuje się poza body:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Oczywiście można też zapisać zmienne i stałe wewnątrz body:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Jednak istnieje ważna różnica:

* jeśli zmienne i stałe są zapisane wewnątrz body, będą tworzone ponownie przy każdym ponownym obliczaniu widoku
* jeśli są zapisane poza body, istnieją jako właściwości struktury widoku i kod jest bardziej przejrzysty

Dlatego w praktyce programistycznej zwykle zapisuje się zmienne i stałe poza body.

## Typy danych

Zmienne mogą przechowywać wiele różnych rodzajów danych. Te rodzaje nazywa się typami danych.

Na przykład wcześniej używaliśmy Text do wyświetlenia tekstu:

```swift
Text("Hello, World")
```

Tutaj "Hello, World" należy do typu String, czyli łańcucha znaków.

String służy do reprezentowania tekstu, a w Swift musi być zapisany w podwójnych cudzysłowach "".

Na przykład:

```swift
var hello = "Hello, World"
```

Oprócz String w Swift istnieje wiele innych typów danych.

Na początkowym etapie nauki najczęściej spotykane są cztery typy:

* String
* Int
* Double
* Bool

Te cztery typy wystarczają do wykonania większości podstawowych operacji na danych.

**String**

String oznacza treść tekstową. Na przykład:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Łańcuchy znaków zwykle służą do przechowywania takich rzeczy jak nazwa użytkownika, tytuł albo treść tekstu.

**Int**

Int oznacza liczbę całkowitą, czyli liczbę bez części dziesiętnej.

Na przykład:

```swift
var age = 26
var count = 100
```

Liczby całkowite zwykle służą do przedstawiania wieku, ilości albo liczników.

**Double**

Double oznacza liczbę z częścią dziesiętną.

Na przykład:

```swift
var weight = 74.5
var height = 185.0
```

W Swift liczby dziesiętne domyślnie zwykle mają typ Double.

Istnieje też podobny typ o nazwie Float, ale zakres wartości, które może przechowywać, jest mniejszy, dlatego w praktyce częściej używa się Double.

**Bool**

Typ Bool służy do reprezentowania dwóch stanów: true i false.

Na przykład:

```swift
var isShowAlert = true
var isLogin = false
```

Typ Bool jest często używany w instrukcjach warunkowych. Na przykład do określenia, czy wyświetlić okno podpowiedzi.

W sytuacjach, gdzie istnieją tylko dwa możliwe wyniki, typ Bool jest bardzo odpowiedni.

### Wyświetlanie w SwiftUI

Gdy wyświetlamy typ String, możemy użyć Text bezpośrednio:

```swift
Text(name)
```

Jednak Int, Double i podobne typy nie są tekstem, więc nie mogą być bezpośrednio częścią treści tekstowej.

Jeśli chcemy wyświetlić takie dane w Text, możemy użyć interpolacji łańcuchów znaków (String Interpolation):

```swift
\()
```

Interpolację zapisuje się wewnątrz tekstu i obejmuje zmienną albo stałą nawiasami \().

Na przykład:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

W powyższym kodzie "" oznacza łańcuch znaków, a \() służy do wstawiania zmiennej albo stałej do łańcucha.

Na przykład:

```swift
"DoubleNum: \(num * 2)"
```

wyświetli treść:

```id="1ner4u"
DoubleNum: 2
```

W ten sposób możemy wstawiać zmienne albo stałe do tekstu, a następnie wyświetlać je w interfejsie przy pomocy Text.

Wskazówka: \() można używać tylko wewnątrz łańcucha znaków "".

## Operatory

Przy deklarowaniu zmiennej albo stałej możemy zobaczyć zapis taki jak ten:

```swift
var num = 1
```

Tutaj = nazywa się operatorem przypisania.

Jego zadanie polega na przypisaniu wartości z prawej strony do zmiennej po lewej stronie.

W tym przykładzie wartość 1 zostaje przypisana do zmiennej num.

Oprócz operatora przypisania istnieje kilka często używanych operatorów liczbowych:

* `+`
* `-`
* `*`
* `/`

Kiedy wykonujemy obliczenia na liczbach, na przykład na danych typu Int albo Double, używamy właśnie tych operatorów.

Na przykład:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Po wykonaniu obliczeń wynik zostaje zapisany w zmiennej.

## Podsumowanie

Zmienne, stałe i operatory to najbardziej podstawowe pojęcia w programowaniu.

Za pomocą zmiennych i stałych możemy przechowywać w programie różne dane. Dzięki typom danych możemy jasno określić rodzaj tych danych. Dzięki operatorom możemy wykonywać na danych obliczenia i ich przetwarzanie.

Ta wiedza jest jak podstawowy zestaw narzędzi w świecie programowania. Opanowanie tych treści zbuduje mocny fundament do dalszej nauki Swift i SwiftUI.
