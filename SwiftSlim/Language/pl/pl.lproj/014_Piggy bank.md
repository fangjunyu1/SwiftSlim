# Skarbonka

W tej lekcji stworzymy prosty projekt „skarbonki”. Jego funkcjonalność jest nieskomplikowana, ale zawiera pełną logikę interakcji, dlatego bardzo dobrze nadaje się dla początkujących.

Dzięki temu projektowi poznamy `TextField` (pole tekstowe), obramowanie `border` oraz zrozumiemy wiązanie danych (`$`).

Naszym ostatecznym celem jest zbudowanie „skarbonki”, do której można wpisać kwotę, nacisnąć przycisk zapisu i sumować całkowitą zgromadzoną kwotę.

Efekt końcowy:

![Piggy Bank](../../RESOURCE/014_view.png)

## Wyświetlanie całkowitej kwoty

Najpierw musimy wyświetlić całkowitą kwotę w „skarbonce”.

W `ContentView` deklarujemy zmienną, która będzie przechowywać całkowitą kwotę:

```swift
@State private var amount = 0
```

Następnie używamy `Text`, aby ją wyświetlić:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Tutaj używamy `.font` oraz `.fontWeight`, aby ustawić rozmiar i grubość czcionki.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Gdy `amount` się zmieni, `Text` automatycznie odświeży wyświetlaną łączną kwotę.

## Wprowadzanie kwoty

„Skarbonka” oprócz wyświetlania całkowitej kwoty musi też pozwalać użytkownikowi „wpisać” wpłacaną kwotę. Do tego potrzebujemy kontrolki `TextField` w SwiftUI.

### TextField

`TextField` to kontrolka widoku w SwiftUI służąca do wprowadzania danych. Najczęściej używa się jej do jednoliniowego wpisywania tekstu.

`TextField` udostępnia głównie dwa formaty wiązania:

**1. Wiązanie typu tekstowego (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Nadaje się do wprowadzania imienia, tytułu i innych treści tekstowych.

**2. Wiązanie typu liczbowego (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Nadaje się do wprowadzania wieku, wynagrodzenia, kwoty i innych danych liczbowych.

`format: .number` oznacza, że pole będzie analizować i wyświetlać dane w formacie liczbowym.

#### Tekst zastępczy

Pierwszy parametr `TextField` to tekst zastępczy (`Placeholder`), który podpowiada użytkownikowi, co należy wpisać:

```swift
TextField("input your name", text: $text)
```

Gdy pole jest puste, wyświetlany jest szary tekst podpowiedzi.

![textfield](../../RESOURCE/014_textfield.png)

#### Wiązanie danych

`TextField` sam nie odpowiada za trwałe przechowywanie wpisanej treści. Dane trzeba obsłużyć za pomocą zmiennej powiązanej z polem.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Treść wpisywana przez użytkownika będzie bezpośrednio zapisywana do zmiennej `text`, a `TextField` odpowiada tylko za interfejs wejściowy.

`$` oznacza wiązanie (`Binding`):

```swift
$text
```

Nie jest to zwykła zmienna, lecz wartość typu `Binding`.

Jej rola polega na utworzeniu połączenia między widokiem a danymi:

gdy użytkownik wpisuje coś w `TextField`, `text` aktualizuje się automatycznie; gdy `text` się zmienia, `TextField` również synchronizuje swój stan.

Na przykład:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Po wpisaniu treści w `TextField`, górny `Text` będzie ją wyświetlał w czasie rzeczywistym.

![textField](../../RESOURCE/014_textfield1.png)

### Wiązanie typu liczbowego

Gdy trzeba wprowadzać liczby, należy powiązać pole z odpowiednim typem zmiennej:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Gdy użytkownik wpisze kwotę, `TextField` przeanalizuje wpisaną wartość i automatycznie zaktualizuje `number`.

## Dodawanie pola wejściowego

Po poznaniu podstawowego użycia `TextField`, zastosujemy je w projekcie „skarbonki”.

W „skarbonce” trzeba wpisać „kwotę”, więc użyjemy sposobu „wiązania typu liczbowego (`Int/Double`)” i dodamy nową zmienną `number`, która będzie przechowywać kwotę wpisaną przez użytkownika:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Teraz `TextField` domyślnie wyświetla wartość `number` (domyślnie jest to `0`).

Gdy zawartość pola zostanie wyczyszczona, pokaże się tekst zastępczy „Amount”.

To ponownie pokazuje, że `TextField` wyświetla wartość zmiennej powiązanej, a nie przechowuje treści samodzielnie.

### Problem z rozmiarem pola wejściowego

W bieżącym widoku zauważymy, że `TextField` nie ma obramowania, pokazuje tylko `0`, a zawartość wygląda na wyrównaną do lewej.

Efekt wygląda tak:

![textfield](../../RESOURCE/014_textfield2.png)

Dzieje się tak dlatego, że `TextField` domyślnie zajmuje całą szerokość widoku nadrzędnego.

Możemy to sprawdzić, dodając kolor tła:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Efekt wygląda tak:

![textfield](../../RESOURCE/014_textfield3.png)

Widać, że `TextField` faktycznie wypełnia całą szerokość wiersza.

### Ustawianie stałej szerokości

Jeśli chcemy, aby pole wejściowe było bardziej zwarte, możemy użyć `frame`, aby ograniczyć jego szerokość:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Efekt wygląda tak:

![textfield](../../RESOURCE/014_textfield4.png)

### Dodawanie obramowania i wewnętrznego odstępu

Ponieważ `TextField` domyślnie nie ma obramowania, możemy ręcznie dodać styl:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Teraz to pole wejściowe bardziej przypomina „standardowe pole tekstowe”.

![textfield](../../RESOURCE/014_textfield5.png)

## Obramowanie

W SwiftUI `border` służy do dodawania obramowania do widoku.

Podstawowe użycie:

```swift
border(Color.black, width: 1)
```

Tutaj `Color.black` oznacza kolor obramowania, a `width` oznacza jego grubość.

W `TextField` używamy:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Oznacza to dodanie do pola wejściowego czarnego obramowania o grubości `1 pt`.

Możesz też spróbować innych kolorów, takich jak `Color.blue`, `Color.green`, albo pogrubić obramowanie, ustawiając `width: 2`.

## Przycisk zapisu pieniędzy

Teraz mamy już zmienną `amount`, która wyświetla całkowitą kwotę, `TextField` do wpisywania kwoty oraz zmienną `number` powiązaną z polem wejściowym.

Aktualny kod wygląda tak:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Dodawanie przycisku

Teraz musimy dodać przycisk, który uruchomi operację odkładania pieniędzy.

```swift
Button("Save") {
    
}
```

### Implementacja logiki odkładania

Chcemy osiągnąć taki efekt, aby użytkownik wpisał kwotę, kliknął przycisk, a kwota automatycznie dodała się do sumy całkowitej.

```swift
Button("Save") {
    amount += number
}
```

Tutaj używamy „złożonego operatora przypisania”, aby dodać wpisaną przez użytkownika kwotę `number` do całkowitej kwoty `amount`.

### Resetowanie wpisanej kwoty

Pojawia się jednak problem: po kliknięciu przycisku kwota w polu wejściowym nie zostaje wyczyszczona.

Jeśli użytkownik wpisze `10` i kliknie zapisz, w polu nadal pozostanie `10`, co wpłynie na następną operację odkładania pieniędzy.

Dzieje się tak dlatego, że `TextField` jest powiązany z `number`, a po kliknięciu przycisku zmieniamy tylko `amount`. `number` się nie zmienia, więc pole wejściowe nadal pokazuje starą wartość.

Musimy więc dodać logikę czyszczenia: po kliknięciu przycisku najpierw dodać wpisaną kwotę, a potem zresetować wartość wejściową:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Teraz, gdy użytkownik wpisze kwotę i kliknie przycisk, wpisana wartość zostanie dodana do całkowitej sumy. `number` zostanie zresetowane do `0`, aby przygotować pole do kolejnego wpisu.

W ten sposób zaimplementowaliśmy całą logikę odkładania pieniędzy w „skarbonce”.

## Ulepszanie widoku

Po ukończeniu funkcjonalności możemy trochę poprawić wygląd interfejsu, dodając obraz tła oraz styl przycisku.

Dodanie stylu przycisku:

```swift
.buttonStyle(.borderedProminent)
```

Dodanie obrazu tła:

```swift
.background {
    Image("1")
}
```

Teraz ukończyliśmy budowę całej „skarbonki”.

## Pełny kod

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Efekt końcowy:

![Piggy Bank](../../RESOURCE/014_view.png)

Teraz możemy spróbować wpłacić `100` albo więcej, aby sprawdzić, czy logika „skarbonki” działa poprawnie.

Można też uruchomić „skarbonkę” na symulatorze albo na prawdziwym urządzeniu, aby przetestować stworzoną aplikację.

### Wyjście debugowania

Aby dodatkowo sprawdzić poprawność logiki, możemy dodać do przycisku kod debugujący i zweryfikować, czy wpisana kwota jest prawidłowo obsługiwana:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Za każdym razem, gdy odkładamy pieniądze i klikamy przycisk, zobaczymy odpowiednie informacje debugujące, które pomogą sprawdzić, czy w logice kodu nie ma błędów.

```swift
---Saving---
amount:11
number:0
```
