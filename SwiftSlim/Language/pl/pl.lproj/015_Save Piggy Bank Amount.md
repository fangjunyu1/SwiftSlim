# Zapisywanie kwoty w skarbonce

W poprzedniej lekcji stworzyliśmy prostą „skarbonkę”. W tej lekcji nauczymy się, jak sprawić, aby kwota w „skarbonce” była zapisywana trwale.

Ta lekcja koncentruje się głównie na `UserDefaults` oraz opakowaniu właściwości `@AppStorage`, a dodatkowo rozszerza temat działania `onAppear` oraz sposobu użycia typu opcjonalnego (`nil`).

Trzeba pamiętać, że ta lekcja wymaga wykorzystania kodu „skarbonki” stworzonego w poprzedniej lekcji.

## Problem trwałego zapisu danych

Obecny interfejs „skarbonki” jest bardzo prosty i wygodny w użyciu.

![Piggy Bank](../../Resource/014_view.png)

Istnieje jednak wyraźny problem: za każdym razem, gdy widok zostanie odświeżony albo aplikacja zostanie zamknięta, całkowita kwota w „skarbonce” znów staje się `0`, a wcześniej zgromadzone pieniądze całkowicie znikają.

Oznacza to, że dane nie są naprawdę zapisywane. Innymi słowy, obecna „skarbonka” potrafi przechowywać jedynie dane tymczasowe.

### Dlaczego dane nie są zapisywane trwale?

Dzieje się tak dlatego, że używamy zmiennej zadeklarowanej przez `@State`:

```swift
@State private var amount = 0
```

Zmienna zadeklarowana przez `@State` ma cykl życia całkowicie zależny od widoku.

Gdy widok jest tworzony, `amount` zostaje zainicjalizowane jako `0`; gdy widok zostaje zniszczony, `amount` również zostaje usunięte.

Dane przechowywane tutaj przez `amount` istnieją tylko w pamięci i nie są zapisywane na urządzeniu.

Jeśli nie chcemy, aby `amount` było związane z cyklem życia widoku, musimy zaimplementować trwały zapis danych. Innymi słowy, trzeba zapisać dane na urządzeniu.

### Czym jest „trwałość danych”

Trwałość danych można rozumieć jako zapisanie danych z „tymczasowej pamięci” do „pamięci urządzenia”.

Dzięki temu po zamknięciu widoku albo zamknięciu aplikacji dane nie zostaną utracone.

W programowaniu w Swift proste „trwałe zapisywanie danych” można realizować za pomocą `UserDefaults`, a bardziej złożone dane wymagają użycia `SwiftData` albo `CoreData`.

W tej lekcji najpierw poznamy najprostsze rozwiązanie, czyli `UserDefaults`.

## UserDefaults

`UserDefaults` służy do przechowywania lekkich danych w formie par klucz-wartość i jest często używany do zapisywania podstawowych typów, takich jak `String`, `Int`, `Double`, `Bool` itd.

### Zapisywanie danych

`UserDefaults` używa metody `set` do zapisywania danych:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Pierwszy parametr `UserDefaults` oznacza dane, które mają zostać zapisane — tutaj przekazujemy dane typu `String`, `Int` itd.

Drugi parametr `forKey` działa podobnie do nazwy zmiennej i służy do identyfikowania danych zapisanych w `UserDefaults`.

### Odczytywanie danych

`UserDefaults` używa odpowiednich metod do odczytu:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Podczas odczytu trzeba używać metody odpowiadającej właściwemu typowi, w przeciwnym razie mogą pojawić się błędy albo nieprawidłowe dane.

### Uwagi dotyczące UserDefaults

#### 1. Zwracanie typu opcjonalnego

Podczas odczytu danych z `UserDefaults` niektóre metody zwracają typ opcjonalny (`Optional`).

Na przykład:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Typ zwracany przez `name` to:

```swift
String?
```

To oznacza, że wartość może istnieć, ale może też nie istnieć.

**Dlaczego zwracany jest typ opcjonalny?**

Dzieje się tak dlatego, że dla danego `Key` w `UserDefaults` nie zawsze musi istnieć przypisana wartość.

Na przykład:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Jeśli wcześniej nigdy nie zapisano danych pod kluczem `"City"`, wynik odczytu będzie:

```swift
nil
```

Trzeba podkreślić, że `nil` oznacza brak danych, a nie pusty tekst.

W lekcji o „systemie typów” spotkaliśmy już podobny problem: gdy konwersja typu kończy się niepowodzeniem, zwracany jest typ opcjonalny.

W takiej sytuacji trzeba użyć `??`, aby dostarczyć wartość domyślną i rozpakować wartość:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Jeśli `UserDefaults` odczyta dane, zostanie użyta odczytana wartość; jeśli odczyt się nie powiedzie (`nil`), zostanie użyta wartość domyślna.

#### 2. Zwracanie typu nieopcjonalnego

Podczas odczytu `Int`, `Double` i `Bool` z `UserDefaults`, zwracane są typy nieopcjonalne.

Na przykład:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Nawet jeśli dla tych kluczy nigdy wcześniej nie zapisano żadnych danych, zwracana wartość nie będzie `nil`.

Zamiast tego zwracane są wartości domyślne:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Ograniczenie ilości danych

`UserDefaults` nadaje się tylko do zapisywania niewielkiej ilości danych, takich jak ustawienia aplikacji, proste stany i podobne informacje.

W praktyce nie nadaje się do przechowywania dużej ilości danych ani danych wymagających bardzo częstego odczytu i zapisu.

## Zapisywanie kwoty „skarbonki”

Teraz możemy użyć `UserDefaults`, aby zaimplementować logikę zapisywania łącznej kwoty w „skarbonce”.

Gdy użytkownik kliknie przycisk, wpisana kwota zostaje dodana do sumy, a łączna kwota zostaje zapisana do `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Teraz zaimplementowaliśmy logikę zapisu danych.

## Wyjaśnienie logiki trwałego zapisu danych

Chociaż zapis danych został już zaimplementowany, podczas rzeczywistego działania zauważymy, że za każdym razem, gdy widok zostaje odświeżony albo aplikacja uruchamiana ponownie, zmienna `amount` nadal ma wartość `0`.

Dzieje się tak dlatego, że:

```swift
@State private var amount = 0
```

W SwiftUI zmienna `@State` jest inicjalizowana ponownie przy każdym utworzeniu widoku.

Chociaż w `UserDefaults` została zapisana wartość `amount`, po ponownym załadowaniu widoku `amount` nadal zostanie zresetowane do `0`.

To pokazuje, że obecnie dane są jedynie zapisywane do `UserDefaults`, ale nie są jeszcze przywracane do widoku.

Dlatego podczas ładowania widoku trzeba dodatkowo ręcznie odczytać dane z `UserDefaults` i ponownie przypisać je do `amount`, aby cała logika trwałego przechowywania danych była kompletna.

### Porównanie logiczne

Można to porównać do „tablicy w klasie”:

Podczas lekcji nauczyciel zapisuje treści na tablicy. Te treści są jak bieżący stan widoku (`@State`).

Po zakończeniu lekcji tablica zostaje wytarta, aby przygotować ją na kolejne zajęcia. To odpowiada zniszczeniu widoku i wyczyszczeniu danych `@State`.

Aby uniknąć utraty treści, nauczyciel zapisuje je wcześniej w materiałach lekcyjnych. Te materiały są odpowiednikiem danych zapisanych w `UserDefaults`.

Gdy kolejna lekcja zaczyna się od nowa, tablica jest początkowo pusta (`@State` zostaje zainicjalizowane), a nauczyciel musi na podstawie materiałów ponownie przepisać wiedzę na tablicę (odczytać `UserDefaults`).

Trzeba zrozumieć, że tablica nie odzyskuje poprzedniej treści automatycznie — trzeba ją przywrócić przez „odczyt materiałów” (czyli odczyt `UserDefaults`).

## Odczytywanie danych za pomocą onAppear

Gdy widok się pojawia, trzeba ręcznie odczytać wartość z `UserDefaults` i przypisać ją do zmiennej `amount` oznaczonej przez `@State`, aby rzeczywiście uzyskać trwały zapis danych.

W SwiftUI można użyć `onAppear`, aby wykonać logikę inicjalizacji w momencie pojawienia się widoku:

```swift
.onAppear {}
```

Umieszczamy kod odczytu `UserDefaults` wewnątrz `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Gdy widok zostaje utworzony, `amount` jest inicjalizowane jako `0`; gdy widok się pojawia, uruchamia się `onAppear`, które odczytuje wartość z `UserDefaults` i przypisuje ją do `amount`. W ten sposób widok może wyświetlić ostatnio zapisaną sumę.

Teraz cała logika trwałego przechowywania danych dla „skarbonki” jest kompletna.

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Opakowanie właściwości @AppStorage

SwiftUI udostępnia opakowanie właściwości `@AppStorage`, które upraszcza logikę zapisywania do `UserDefaults`.

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` jest opakowaniem dla `UserDefaults`, a `"amount"` odpowiada kluczowi `Key` w `UserDefaults`.

Gdy widok zostaje utworzony, dane są odczytywane z `UserDefaults`; gdy zmienna się zmienia, wartość jest automatycznie zapisywana do `UserDefaults`.

Obsługuje również mechanizm odświeżania stanu w SwiftUI i podobnie jak `@State`, po zmianie wartości odświeża widok.

Innymi słowy, `@AppStorage` potrafi realizować logikę odczytu i zapisu danych, więc nie trzeba już ręcznie wywoływać `UserDefaults` ani używać `onAppear` do ręcznego odczytu danych.

Dlatego możemy zastąpić w kodzie `UserDefaults` przez `@AppStorage`:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## Podsumowanie

W tej lekcji poznaliśmy głównie następujące zagadnienia:

Po pierwsze, `UserDefaults` służy do przechowywania lekkich danych. Użyliśmy `UserDefaults`, aby zapisać całkowitą kwotę na urządzeniu. `UserDefaults` udostępnia metody odczytu i zapisu, a przy jego użyciu trzeba również uwzględniać sytuacje związane z typami opcjonalnymi.

Po drugie, zmienna `@State` służy wyłącznie do zarządzania tymczasowym stanem widoku, a jej cykl życia jest zgodny z cyklem życia widoku. Gdy widok zostaje utworzony ponownie, `@State` jest inicjalizowane od nowa.

Przy przywracaniu danych z `UserDefaults` nauczyliśmy się używać `onAppear`, aby odczytać `UserDefaults` w momencie pojawienia się widoku i odtworzyć dane.

Na końcu użyliśmy `@AppStorage` zamiast `UserDefaults`, dzięki czemu dane są automatycznie odczytywane podczas ładowania widoku i automatycznie zapisywane przy zmianie wartości. To zastępuje ręczne wywoływanie `UserDefaults` i logikę z `onAppear`.

Dzięki tej wiedzy możemy zaimplementować podstawowe przechowywanie danych w aplikacji, aby dane mogły być zapisywane trwale.

## Ćwiczenie po lekcji

Teraz „skarbonka” obsługuje już zapisywanie kwoty, ale jej funkcjonalność wciąż nie jest kompletna.

1. Jeśli użytkownik chce wypłacić pieniądze, trzeba zaprojektować odpowiednią logikę wypłaty.
2. Jeśli użytkownik chce wyczyścić kwotę, trzeba również zaimplementować logikę resetowania.
3. Jeśli chcemy dodać nazwę dla skarbonki, trzeba będzie zapisywać także dane typu `String`.

Można dalej rozbudować istniejący projekt, aby „skarbonka” była bardziej kompletna funkcjonalnie.

## Wiedza rozszerzająca — problem domyślnej wartości pola wejściowego

Teraz możemy dodatkowo ulepszyć interakcję z polem wejściowym, aby wpisywanie wartości było wygodniejsze.

![textfield](../../Resource/015_view.png)

W obecnej implementacji domyślną wartością pola wejściowego jest `0`. Za każdym razem, gdy użytkownik chce wpisać kwotę, najpierw musi usunąć `0`, a dopiero potem wpisać nową liczbę. Taki sposób interakcji nie jest wygodny.

Powinniśmy sprawić, aby początkowa wartość pola wejściowego była pusta, a nie równa `0`.

Dzieje się tak dlatego, że `TextField` i `number` są ze sobą powiązane dwukierunkowo:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Gdy `number` ma początkowo wartość `0`, pole wejściowe również pokazuje `0`.

Dlatego musimy zmienić `number` na pustą wartość, czyli `nil`.

```swift
@State private var number = nil
```

W tym momencie pojawi się błąd:

```swift
Generic parameter 'Value' could not be inferred
```

To właśnie sytuacja, o której mówiliśmy w lekcji o „systemie typów”: gdy nie da się automatycznie wywnioskować typu zmiennej, trzeba jawnie zadeklarować jej typ.

Ponieważ ustawiliśmy `number` na `nil`, a samo `nil` nie zawiera żadnej informacji o typie, kompilator nie potrafi określić, czy zmienna ma być typu `String`, `Int` czy innego, więc zgłasza błąd.

Dlatego musimy jawnie zadeklarować typ `number`:

```swift
@State private var number:Int? = nil
```

Tutaj `Int?` oznacza typ opcjonalny (`Optional`), czyli `number` może mieć wartość `Int`, ale może też być `nil`.

Dzięki temu po ustawieniu początkowej wartości na `nil`, pole wejściowe będzie puste zamiast pokazywać `0`.

### Rozpakowywanie typu opcjonalnego

Gdy zmienimy `number` na typ opcjonalny, dotychczasowy kod obliczeń zacznie zgłaszać błąd:

```swift
amount += number
```

Komunikat:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Dzieje się tak dlatego, że `number` może teraz być `nil`. Jeśli od razu użyjemy go w obliczeniu, otrzymamy sytuację podobną do:

```swift
amount += nil
```

To oczywiście nie ma sensu, bo `nil` nie można dodać do `amount` — taka operacja jest niedozwolona.

Dlatego przy używaniu typu opcjonalnego w obliczeniach trzeba najpierw go rozpakować.

Tutaj można użyć `??`, aby podać wartość domyślną:

```swift
amount += number ?? 0
```

Gdy `number` jest `nil`, zostanie użyta domyślna wartość `0`; gdy `number` ma wartość, zostaną użyte rzeczywiste dane wpisane przez użytkownika.

To zapewnia poprawność obliczeń, a jednocześnie daje efekt pustego pola wejściowego na początku, dzięki czemu użytkownik nie musi już ręcznie usuwać `0`.

## Kod rozszerzony

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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
