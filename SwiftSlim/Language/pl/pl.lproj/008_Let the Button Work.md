# Sprawmy, by przycisk zaczął działać

W tej lekcji nauczymy się głównie przycisku Button, funkcji print do wypisywania informacji debugowych oraz funkcji w Swift.

To wszystko stanowi podstawę programowania interakcji w SwiftUI.

## Przycisk

Przycisk jest jednym z najczęściej używanych kontrolek UI. Gdy chcemy coś pobrać, otworzyć albo zamknąć, zwykle klikamy właśnie przycisk.

Na przykład w App Store klikamy przycisk „Pobierz”, aby pobrać aplikację.

![Button](../../RESOURCE/008_button.png)

W SwiftUI przycisk reprezentowany jest przez Button.

Podstawowe użycie:

```swift
Button("") {
    
}
```

Tę strukturę można podzielić na dwie części:

```swift
Button("Tekst przycisku") {
    Kod wykonywany po kliknięciu przycisku
}
```

Na przykład:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Po uruchomieniu pojawi się przycisk Start.

![Button](../../RESOURCE/008_button1.png)

Gdy użytkownik kliknie przycisk, kod znajdujący się wewnątrz {} zostanie wykonany.

Trzeba pamiętać, że Button jest kontrolką interfejsu SwiftUI, czyli View, dlatego musi zostać zapisany wewnątrz body.

### Modyfikator buttonStyle

W SwiftUI Button oferuje wbudowane systemowe style przycisków, których można używać za pomocą modyfikatora buttonStyle.

Na przykład:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle zastosuje styl przycisku dostarczony przez system.

Do często używanych opcji należą:

* .automatic
* .plain
* .bordered
* .borderedProminent
* .borderless

![Button](../../RESOURCE/008_button7.png)

Różnice między tymi stylami dotyczą głównie tego, czy przycisk ma obramowanie, tło i jak silnie jest wizualnie wyróżniony.

## Wyjście print

W programowaniu często trzeba sprawdzić, czy program rzeczywiście doszedł do danego fragmentu kodu.

Swift udostępnia funkcję print do wypisywania informacji debugowych.

Podstawowy zapis:

```swift
print("Hello")
```

Ta linia kodu wypisze tekst do Console, czyli konsoli.

### Testowanie działania przycisku

Możemy umieścić print wewnątrz przycisku, aby sprawdzić, czy przycisk został kliknięty.

```swift
Button("Start") {
    print("Test 123")
}
```

Po kliknięciu przycisku Console wypisze:

```id="z8ea73"
Test 123
```

To oznacza, że przycisk został prawidłowo uruchomiony.

![Button](../../RESOURCE/008_button3.png)

Uwaga: print jest kodem Swift, a nie kontrolką interfejsu. Nie można go umieścić bezpośrednio w body, bo spowoduje to błąd.

Na przykład taki zapis jest błędny:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Błąd: body musi zwracać View
    }
}
```

W SwiftUI body służy do opisywania struktury interfejsu i można w nim umieszczać tylko kontrolki interfejsu, czyli View, takie jak Text, Button, Image i podobne.

Zwykły kod, taki jak logika obliczeń czy print, musi znajdować się wewnątrz przycisku, funkcji albo innego obsługującego zdarzenie miejsca.

### Console

Treść wypisana przez print pojawi się w Console, czyli konsoli w Xcode.

Jeśli nie widzisz Console, możesz kliknąć przycisk Show the Debug Area w prawym dolnym rogu, aby otworzyć obszar debugowania, a następnie kliknąć Show the Console, aby wyświetlić konsolę.

![](../../RESOURCE/008_button4.png)

W lewym dolnym rogu Console znajdują się dwie zakładki: Executable i Previews.

![](../../RESOURCE/008_button5.png)

Te dwie zakładki odpowiadają różnym środowiskom uruchomieniowym. Gdy używasz podglądu Canvas, wyjście print będzie widoczne w zakładce Previews. Jeśli uruchamiasz aplikację w symulatorze albo na prawdziwym urządzeniu, wyjście pojawi się w zakładce Executable.

Dlatego jeśli zauważysz, że print nic nie wypisuje, najpierw sprawdź, czy masz wybraną właściwą zakładkę.

## Przykład — grafika ASCII

W niektórych projektach programistycznych często można zobaczyć grafikę ASCII.

Grafika ASCII to obraz zbudowany ze zwykłych znaków, na przykład:

![ASCII](../../RESOURCE/008_ascii.png)

Możemy użyć przycisku i print, aby wypisać grafikę ASCII.

Przykładowy kod:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Po kliknięciu przycisku Console wypisze:

```id="tfqf8o"
 /\_/\
( o.o )
 > ^ <
```

Uwaga: znak \ w łańcuchu tekstowym trzeba zapisać jako \, ponieważ ukośnik odwrotny jest w łańcuchach znakiem ucieczki.

## Funkcje

Wewnątrz przycisku możemy pisać kod bezpośrednio.

Na przykład:

```swift
Button("Start") {
    print("Hello")
}
```

Jeśli kodu jest mało, taki zapis nie stanowi problemu. Jednak w prawdziwych projektach logika uruchamiana przez przycisk może być dużo większa.

Na przykład:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // może być jeszcze dużo więcej kodu
}
```

Gdy kodu robi się coraz więcej, pisanie go bezpośrednio wewnątrz przycisku sprawia, że kod interfejsu staje się chaotyczny i trudniejszy do czytania oraz utrzymania.

Dlatego zazwyczaj porządkujemy taki kod wewnątrz funkcji, a następnie wywołujemy tę funkcję z przycisku.

### Czym jest funkcja

Funkcja to fragment kodu, którego można używać wielokrotnie.

Gdy pewien kod ma zostać wykonany, wystarczy wywołać funkcję, a wtedy zostanie uruchomiony kod znajdujący się w jej wnętrzu.

Dzięki temu struktura kodu staje się bardziej przejrzysta, a sam kod łatwiej wykorzystać ponownie.

### Podstawowy zapis

W Swift funkcję definiuje się przy użyciu słowa kluczowego **func**:

```swift
func randomInt() {
    // code
}
```

Ten fragment definiuje funkcję.

randomInt to nazwa funkcji, która służy do identyfikowania tego fragmentu kodu.

() oznacza miejsce na parametry, czyli dane przekazywane z zewnątrz. Jeśli dane nie są potrzebne, nawiasy mogą pozostać puste.

{} to obszar kodu funkcji. W środku zapisuje się cały kod, który ma zostać wykonany.

Na przykład:

```swift
func getName() {
    print("FangJunyu")
}
```

Ta funkcja służy do wypisania jednej linii tekstu.

### Wywoływanie funkcji

Samo zdefiniowanie funkcji tylko ją tworzy. Jeśli chcesz ją wykonać, musisz ją jeszcze wywołać.

Wywołanie polega na dopisaniu () po nazwie funkcji:

```swift
getName()
```

Gdy program dojdzie do tej linii, wykona kod znajdujący się w funkcji getName.

Pełny przykład:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Po uruchomieniu Console wypisze:

```id="53ea9v"
FangJunyu
```

### Używanie funkcji w SwiftUI

W widoku SwiftUI funkcje zwykle zapisuje się poza body.

Na przykład:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Po kliknięciu przycisku zostanie wywołana funkcja getName().

Dzięki temu kod interfejsu pozostaje prosty, a konkretna logika jest obsługiwana wewnątrz funkcji.

### Parametry funkcji

Czasami funkcja ma wykonywać różne działania w zależności od przekazanych danych.

Na przykład chcemy, aby funkcja mogła wypisywać różne imiona, a nie tylko stałe "FangJunyu".

Wtedy można użyć parametrów. Parametr można rozumieć jako dane przekazywane podczas wywoływania funkcji.

Na przykład:

```swift
func getName(name: String) {
    print(name)
}
```

Ta funkcja otrzymała dodatkowy parametr. name to nazwa parametru, a String to jego typ.

To oznacza, że funkcja musi otrzymać dane typu String.

Ponieważ funkcja teraz wymaga danych, podczas wywołania trzeba je przekazać.

```swift
getName(name: "Sam")
```

Gdy podczas wywołania przekażemy "Sam", funkcja użyje tej wartości i ją wypisze.

Wynik działania:

```id="f2pu5i"
Sam
```

## Przykład — użycie funkcji do wypisania grafiki ASCII

W poprzednim przykładzie umieściliśmy print bezpośrednio wewnątrz przycisku.

Ale jeśli grafika ASCII jest bardziej złożona, kod stanie się bardzo długi. Wtedy można przenieść logikę do funkcji, aby kod interfejsu był bardziej przejrzysty.

Przykładowy kod:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Po uruchomieniu i kliknięciu przycisku Console wypisze:

```id="ia1s0j"
 /\_/\
( o.o )
 > ^ <
```

Tutaj dzieją się dwie rzeczy. Gdy użytkownik kliknie przycisk:

1. przycisk wywołuje funkcję printCat()
2. kod print znajdujący się w funkcji zostaje wykonany

Dzięki temu kod interfejsu odpowiada tylko za wywołanie zdarzenia, a właściwa logika znajduje się w funkcji.

W praktycznym programowaniu większość działań przycisków realizuje się właśnie za pomocą funkcji.

## Podsumowanie

W tej lekcji nauczyliśmy się trzech ważnych rzeczy:

**1. Button**

Button to kontrolka SwiftUI służąca do uruchamiania działań.

```swift
Button("Start") {

}
```

Gdy użytkownik kliknie przycisk, kod zapisany w nawiasach klamrowych zostanie wykonany.

**2. print**

print służy do wypisywania informacji debugowych do Console.

```swift
print("Hello")
```

Programista może dzięki Console obserwować stan działania programu.

**3. Funkcje**

Funkcja to fragment kodu, którego można używać wielokrotnie.

```swift
func sayHello() {
    print("Hello")
}
```

Wywołanie funkcji:

```swift
sayHello()
```

Jeśli funkcja potrzebuje danych, można użyć parametrów:

```swift
func sayHello(name: String) {
    print(name)
}
```

W kolejnych lekcjach będziemy dalej poznawać kolejne kontrolki SwiftUI oraz to, jak dane współpracują z interfejsem.

## Ćwiczenia

Spróbuj wykonać następujące ćwiczenia:

1. utwórz przycisk z tekstem "Hello"
2. po kliknięciu przycisku wypisz w Console tekst Hello Swift
3. przenieś kod wypisujący do funkcji, a następnie wywołaj tę funkcję z przycisku
