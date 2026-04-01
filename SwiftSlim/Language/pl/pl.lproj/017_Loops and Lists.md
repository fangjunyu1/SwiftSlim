# Pętle i listy

W tej lekcji nauczymy się pętli `for` w Swift oraz `ForEach` w SwiftUI.

Obie pomagają nam odczytywać elementy tablicy po kolei. W rzeczywistym programowaniu często musimy wyciągać grupę danych jeden po drugim, a następnie je przetwarzać albo wyświetlać, a pętla jest właśnie ważnym narzędziem do wykonania tego zadania.

Kiedy przeglądamy strony internetowe albo używamy aplikacji, często widzimy wiele list lub pozycji. Taka zawartość jest zwykle najpierw przechowywana w `tablicy`, a następnie odczytywana kolejno przez `pętlę` i na końcu wyświetlana w interfejsie.

Na przykład lista wyników wyszukiwania Google:

![Google](../../Resource/017_google.png)

Każda pozycja na liście wyników wyszukiwania zwykle odpowiada jednej danej i jest wyświetlana kolejno za pomocą pętli.

Dlatego `tablice` i `pętle` często występują razem. `Tablica` odpowiada za przechowywanie grupy danych, a `pętla` odpowiada za pobieranie tych danych po kolei i wykonywanie na nich tego samego działania.

Poniżej zaczniemy od najbardziej podstawowej pętli `for`.

## Odliczanie

Załóżmy, że chcemy zasymulować funkcję odliczania i kolejno wypisać `„5、4、3、2、1”`.

Najbardziej bezpośredni zapis wygląda tak:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Taki sposób może zasymulować funkcję odliczania, ale jeśli treści jest dużo, kod będzie bardzo powtarzalny, a później jego modyfikacja nie będzie wygodna.

W tym momencie możemy najpierw umieścić dane w tablicy, a następnie użyć pętli `for`, aby kolejno je wypisać:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Ten zapis jest prostszy i łatwiejszy do rozszerzenia. Nawet jeśli w odliczaniu jest dużo liczb, nie musimy powtarzać `print` linia po linii, wystarczy pozwolić pętli automatycznie obsłużyć każdy element tablicy.

Możemy umieścić ten kod w przycisku i go przetestować:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Po kliknięciu przycisku pętla `for` zgodnie z kolejnością w tablicy będzie kolejno pobierać każdą liczbę całkowitą z `countDown` i wypisywać ją w konsoli.

Następnie zobaczmy, jak działa pętla `for`.

## Pętla for

Pętla `for` służy do przetwarzania grupy danych w kolejności. Najczęściej używa się jej z tablicami i zakresami.

Podstawowy zapis:

```swift
for element in tablica_lub_zakres {
    kod do wykonania
}
```

Na przykład kod odliczania sprzed chwili:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Tutaj `i` oznacza aktualnie pobrany element, a po `in` znajduje się zbiór danych, po którym iterujemy, czyli tablica `countDown`.

Znaczenie tego kodu jest następujące: program będzie kolejno pobierał każdy element z tablicy `countDown`. Za każdym razem, gdy pobierze element, tymczasowo oznaczy go jako `i`, a następnie wykona kod w nawiasach klamrowych.

Proces wykonywania można rozumieć tak:

* Za pierwszym razem pobierane jest `5`, więc wtedy wartość `i` wynosi `5`
* Wykonuje się `print(i)`, co wypisuje `5`
* Następnie pobierany jest kolejny element `4`
* Znowu wykonywane jest `print(i)`, co wypisuje `4`

Kolejne `3`、`2`、`1` również zostaną wykonane w ten sam sposób po kolei.

![for](../../Resource/017_for.png)

Gdy wszystkie elementy tablicy zostaną przetworzone, pętla `for` zakończy się automatycznie.

Możemy za pomocą pętli `for` pobrać każdy element tablicy i zrealizować funkcje takie jak odliczanie.

**Wskazówka**: `i` to bardzo częsty sposób nazywania zmiennej w pętli for i służy do oznaczania aktualnie pobranego elementu, ale nie jest to zapis obowiązkowy — można użyć także innych angielskich nazw.

Na przykład użycie `num` do oznaczenia każdego pobranego elementu:

```swift
for num in countDown {
    print(num)
}
```

W nawiasach klamrowych również trzeba używać `num`, aby oznaczyć aktualnie pobrany element.

### Zakres w pętli

Pętla `for` może iterować nie tylko po tablicy, ale także po zakresie.

Na przykład gdy chcemy obliczyć sumę dodatnich liczb całkowitych do `50`, musimy dodać po kolei wszystkie liczby całkowite od `1` do `50`.

Najbardziej bezpośredni zapis mógłby wyglądać tak:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problem z takim zapisem polega na tym, że każdą liczbę trzeba wypisać ręcznie. To jest kłopotliwe i nie nadaje się do prawdziwych scenariuszy programistycznych.

W tym momencie możemy użyć operatora zakresu razem z pętlą `for`.

W poprzednim rozdziale o operatorach poznaliśmy już operator zakresu:

```swift
1...3   // 1, 2, 3
```

Tutaj `...` oznacza zakres domknięty, czyli obejmujący zarówno początek, jak i koniec.

Dlatego tutaj możemy użyć pętli `for` dla zakresu liczb całkowitych od `1` do `50`:

```swift
for i in 1...50 {
    
}
```

Musimy dodać te liczby całkowite, więc potrzebujemy jeszcze zmiennej do przechowywania sumy:

```swift
var count = 0
```

Następnie podczas każdej iteracji dodajemy aktualnie pobraną liczbę do `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Ten kod oznacza:

* `count` służy do przechowywania bieżącej sumy
* pętla `for` będzie kolejno pobierać liczby całkowite od `1` do `50`
* za każdym razem, gdy pobrana zostanie liczba, wykona się `count += i`
* po zakończeniu pętli w `count` będzie przechowywana końcowa suma

W ten sposób możemy otrzymać sumę wszystkich dodatnich liczb całkowitych do `50`.

Podobnie, jeśli chcemy obliczyć sumę liczb całkowitych od `1` do `100`, wystarczy zmienić zakres:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Pętla `for` może iterować nie tylko po tablicy, ale także po zakresie. Ta zdolność do przetwarzania danych kolejno i w sposób powtarzalny jest w programowaniu bardzo powszechna.

Pomaga nam ona automatycznie obsługiwać wiele powtarzalnych zadań bez konieczności ręcznego zapisywania każdej liczby w sumowaniu lub innych podobnych powtarzalnych operacjach.

## Pętle w SwiftUI

Wspomniana wcześniej pętla `for` należy do samego języka Swift.

Ale w SwiftUI nie możemy bezpośrednio użyć `for` wewnątrz struktury widoku do generowania widoków:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Dzieje się tak dlatego, że wewnątrz `VStack` potrzebne są widoki SwiftUI, a zwykła pętla `for` sama w sobie nie jest widokiem.

Jeśli chcemy w SwiftUI wielokrotnie generować interfejs na podstawie zawartości tablicy, musimy użyć `ForEach`.

Na przykład jeśli chcemy wyświetlić imiona wszystkich członków grupy, możemy napisać:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Efekt wyświetlania:

![for1](../../Resource/017_for1.png)

Następnie dodajmy ten sam modyfikator do każdego `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Teraz każdy `Text` jest wyświetlany mniejszą i grubszą czcionką.

Efekt wyświetlania:

![](../../Resource/017_for2.png)

Chociaż modyfikatory sprawiają, że interfejs wygląda lepiej, jednocześnie wydłużają kod i czynią go bardziej powtarzalnym.

Jeśli imion będzie więcej albo później będziemy chcieli jednolicie zmienić czcionkę, kolor i inne style, trzeba będzie wielokrotnie pisać i modyfikować dużo takiego samego kodu. To jest niewygodne i utrudnia utrzymanie.

W tym momencie możemy najpierw umieścić te imiona w tablicy, a następnie użyć `ForEach` w SwiftUI, aby na podstawie danych w tablicy wielokrotnie generować widoki:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Ten zestaw kodu jest prostszy. `ForEach` będzie kolejno odczytywać każdy element w tablicy i wyświetlać odpowiadającą mu zawartość w interfejsie.

Gdy później dodamy nowe imiona, wystarczy zmodyfikować imiona w tablicy `names`; nie trzeba za każdym razem powtarzać `Text` i złożonych modyfikatorów.

## ForEach

`ForEach` to struktura w SwiftUI używana do wielokrotnego generowania widoków. Można ją rozumieć jako coś podobnego do pętli `for` w SwiftUI.

Podstawowe użycie:

```swift
ForEach(tablica, id: \.self) { element in
    kod SwiftUI
}
```

Na przykład nazwy członków grupy sprzed chwili:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ten kod oznacza:

`names` to tablica, po której iterujemy, czyli dane, które mają zostać wyświetlone.

`id:\.self` oznacza użycie samego elementu tablicy do rozróżniania każdej pozycji.

W obecnym przykładzie tablica przechowuje napisy:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Dlatego SwiftUI bezpośrednio użyje samych napisów "Sam"、"John"、"Wathon"、"Bob" do rozróżnienia różnych treści.

Dla prostych tablic typów takich jak `String` i `Int`, które są częste na etapie początkującym, zwykle możemy najpierw po prostu pisać:

```swift
id: \.self
```

Na razie wystarczy zapamiętać tylko ten jeden zapis — nie trzeba jeszcze głębiej rozumieć innych zasad dotyczących id.

`item in` oznacza aktualnie pobrany element.

Na przykład podczas pierwszej iteracji `item` to `"Sam"`, a podczas drugiej iteracji `item` to `"John"`.

Dlatego:

```swift
Text(item)
```

będzie kolejno zamieniać się w:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

A więc zadanie tego kodu polega na tym, aby kolejno pobierać każde imię z tablicy `names` i dla każdego imienia utworzyć widok `Text`.

### Proces wykonywania

Proces wykonywania można rozumieć tak:

* `ForEach` najpierw odczytuje pierwszy element `"Sam"` z tablicy `names`
* `item` tymczasowo oznacza `"Sam"`
* `Text(item)` wyświetla `"Sam"`
* następnie odczytywany jest kolejny element `"John"`
* potem ten sam kod widoku wykonywany jest ponownie

Ostatecznie wszystkie imiona z tablicy zostaną wyświetlone.

Zaletą takiego zapisu jest to, że gdy imion jest więcej, nie musimy powtarzać wielu `Text`, wystarczy zmodyfikować zawartość tablicy.

### Iterowanie po zdjęciach

`ForEach` może wyświetlać nie tylko tekst, ale także obrazy, kolory albo inne widoki SwiftUI.

Na przykład przygotowujemy 4 obrazy:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Przeciągnij te cztery obrazy do folderu Assets w Xcode.

![image](../../Resource/017_for3.png)

Jeśli nie użyjemy `ForEach`, musimy każdą grafikę wpisać ręcznie:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Efekt wyświetlania:

![image](../../Resource/017_for4.png)

Taki zapis działa, ale kod jest dość długi.

Jeśli obrazów będzie coraz więcej, trzeba będzie powtarzać coraz więcej kodu `Image`.

Jeśli później będziemy chcieli jednolicie zmienić rozmiar obrazów, również trzeba będzie poprawiać je jeden po drugim.

W tym momencie możemy umieścić nazwy obrazów w tablicy, a następnie użyć `ForEach`, aby wielokrotnie generować widoki obrazów:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Tutaj `images` to tablica napisów, a każdy element tablicy jest nazwą obrazu.

`ForEach(images, id: \.self)` oznacza kolejno odczytywanie każdego elementu z tablicy `images`, użycie samego elementu do rozróżniania każdej pozycji, a następnie wygenerowanie odpowiedniego widoku na podstawie aktualnego elementu.

Na przykład pierwszy odczytany element to `"430F9BEF"`, więc:

```swift
Image(item)
```

jest równoważne:

```swift
Image("430F9BEF")
```

Pozostałe obrazy również będą wyświetlane kolejno w ten sam sposób.

![image](../../Resource/017_for4.png)

Tutaj wciąż używamy:

```swift
id: \.self
```

Powód jest taki sam jak wcześniej: ponieważ elementy w tablicy `images` też są prostymi napisami, na etapie początkującym można bezpośrednio używać samego elementu jako sposobu rozróżniania.

Można to prosto zapamiętać jako stałą formułę:

**Gdy `ForEach` iteruje po prostej tablicy typu `String` lub `Int`, zwykle piszemy `id: \.self`.**

### Dodawanie obrazów

Jeśli później chcemy dodać nowe obrazy, wystarczy zmodyfikować zawartość tablicy:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Nie trzeba już powtarzać nowego kodu `Image`.

Jeśli obrazów jest dużo, można połączyć to z `ScrollView`, w przeciwnym razie po przekroczeniu ekranu nie będzie można ich w pełni podejrzeć.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Modyfikowanie obrazów

Kiedy chcemy jednolicie zmienić styl obrazów, wystarczy zmienić kod wewnątrz `ForEach`.

Na przykład zmienić szerokość na `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

W ten sposób wszystkie obrazy zostaną zmienione jednocześnie i nie trzeba ich poprawiać pojedynczo.

To jest jedno z ważnych zastosowań `ForEach`:

**Gdy wiele widoków ma tę samą strukturę, a różni się tylko zawartość, można napisać tylko jeden kod widoku, a dane z tablicy zdecydują o tym, co zostanie wyświetlone.**

## Podsumowanie

W tej lekcji nauczyliśmy się pętli `for` i `ForEach`.

Pętla `for` służy do kolejnego przetwarzania elementów w tablicy lub zakresie i jest bardziej ukierunkowana na przetwarzanie danych.

`ForEach` służy w SwiftUI do wielokrotnego generowania widoków na podstawie zawartości tablicy i jest bardziej ukierunkowane na wyświetlanie widoków.

Na obecnym etapie początkującym najczęstszy zapis `ForEach` to:

```swift
ForEach(tablica, id: \.self) { element in
    kod SwiftUI
}
```

Tutaj `id: \.self` oznacza użycie samego elementu do rozróżnienia każdej pozycji.

Gdy zawartość tablicy to proste typy takie jak `String` i `Int`, zwykle możemy na początku używać właśnie tego jednego zapisu.

W przyszłości, gdy podczas przeglądania stron internetowych lub aplikacji zobaczysz grupę powtarzających się tekstów, obrazów albo innych treści listy, możesz pomyśleć o tym, że w SwiftUI taka treść zwykle jest najpierw umieszczana w tablicy, a potem kolejno wyświetlana za pomocą `ForEach`.
