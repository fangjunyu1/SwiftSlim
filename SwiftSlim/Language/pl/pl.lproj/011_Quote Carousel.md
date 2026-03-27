# Karuzela cytatów

W tej lekcji zrealizujemy funkcję „karuzeli cytatów” i dokładniej poznamy podstawowe elementy Swift, takie jak tablice (Array) oraz instrukcje warunkowe if-else.

Pokażemy, jak przechowywać wiele cytatów i jak za pomocą interakcji z przyciskiem zrealizować ich cykliczne przełączanie.

![alt text](../../RESOURCE/011_word.png)

## Wyświetlanie cytatu

Najpierw musimy wyświetlić jeden cytat w SwiftUI.

Najprostszym sposobem jest użycie widoku Text:

```swift
Text("Slow progress is still progress.")
```

Ten kod potrafi wyświetlić tylko jeden stały cytat. Jeśli chcemy pokazać wiele cytatów i umożliwić przełączanie między nimi, musimy je wcześniej zapisać.

Jednak zwykła zmienna typu String może przechowywać tylko jeden cytat:

```swift
let sayings = "Slow progress is still progress."
```

Jeśli chcemy przechowywać wiele cytatów, musielibyśmy zadeklarować osobną zmienną dla każdego cytatu:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

W praktycznym programowaniu takie podejście jest jednak nie tylko uciążliwe, lecz także mało elastyczne, ponieważ każda zmienna jest niezależna i trudno na tej podstawie zrealizować wygodne przełączanie cytatów.

Aby wygodnie zarządzać wieloma cytatami, potrzebujemy struktury danych, która pozwala przechowywać je razem. Tą strukturą jest tablica (Array).

Po użyciu tablicy powyższy kod można zapisać tak:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Wskazówka: w konwencjach programistycznych nazwy zmiennych przechowujących wiele elementów zwykle zapisuje się w liczbie mnogiej, na przykład sayings, aby podkreślić ich zbiorczy charakter.**

## Tablica

W Swift tablica to uporządkowana kolekcja elementów, zapisywana przy użyciu nawiasów kwadratowych [].

```swift
[]
```

Wewnątrz tablicy można umieścić wiele elementów tego samego typu, oddzielonych przecinkami.

Na przykład:

```swift
[101, 102, 103, 104, 105]
```

Tablicę można prosto wyobrazić sobie jako pociąg:

![Array](../../RESOURCE/011_array1.png)

Cały pociąg reprezentuje obiekt tablicy, a każdy wagon jest ustawiony w określonej kolejności.

### Indeks i dostęp do elementów

Ponieważ tablica jest uporządkowana, system może określić pozycję konkretnego elementu na podstawie kolejności. Ten mechanizm nazywa się indeksem (Index).

W Swift, podobnie jak w większości języków programowania, indeksy tablic zaczynają się od 0, a nie od 1. Oznacza to, że pierwszy element ma indeks 0, drugi ma indeks 1 i tak dalej.

![Array](../../RESOURCE/011_array2.png)

Jeśli chcesz uzyskać dostęp do konkretnego elementu tablicy, wystarczy po nazwie tablicy dodać nawiasy kwadratowe i wpisać w nich indeks docelowego elementu.

Na przykład:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Jeśli spróbujesz uzyskać dostęp do indeksu wykraczającego poza prawidłowy zakres tablicy, wystąpi problem „Index Out of Range”, czyli wyjście poza zakres indeksu. Dlatego podczas pracy z tablicą trzeba uważać, aby indeks zawsze mieścił się w poprawnym zakresie.

**Wyjście poza zakres indeksu**

Na przykład, jeśli tablica ma 5 elementów, prawidłowe indeksy to 0 do 4. Jeśli spróbujemy odczytać sayings[5], program nie znajdzie odpowiadającego „wagonu”, co spowoduje błąd wyjścia poza zakres indeksu i doprowadzi do awarii aplikacji.

![Array](../../RESOURCE/011_array3.png)

### Operacje na tablicy

Tablice obsługują nie tylko statyczne definiowanie, ale także dodawanie, usuwanie i modyfikowanie elementów oraz pobieranie długości tablicy.

Wskazówka: jeśli chcesz modyfikować tablicę, musisz zadeklarować ją jako zmienną przy użyciu var, a nie jako stałą let.

**1. Dodawanie elementu**

Można użyć metody append, aby dodać element na końcu tablicy:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Usuwanie elementu**

Za pomocą metody remove(at:) można usunąć wskazany element tablicy:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modyfikowanie elementu**

Można bezpośrednio zmienić element tablicy przy użyciu jego indeksu:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Liczenie długości tablicy**

Właściwość count zwraca liczbę elementów tablicy:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Wyświetlanie cytatów przy użyciu tablicy

Aby wyświetlić wiele cytatów, możemy zapisać je w tablicy, a następnie uzyskiwać do nich dostęp przez indeks i je wyświetlać.

Najpierw tworzymy w ContentView tablicę sayings do przechowywania cytatów, a następnie w widoku Text odczytujemy i wyświetlamy odpowiedni cytat przez indeks:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Tutaj sayings[0] oznacza pierwszy cytat w tablicy.

Jeśli chcemy wyświetlić inny cytat, wystarczy zmienić indeks w nawiasach kwadratowych:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definiowanie indeksu cytatu

Aby uzyskać efekt dynamicznego przełączania cytatów, nie możemy „na sztywno” wpisać indeksu bezpośrednio w widoku Text.

Musimy utworzyć zmienną, która będzie osobno przechowywać aktualnie wyświetlany indeks.

W SwiftUI możemy użyć @State do zadeklarowania zmiennego indeksu:

```swift
@State private var index = 0
```

SwiftUI będzie obserwować zmienną opakowaną przez @State. Gdy index się zmieni, SwiftUI ponownie wyrenderuje widok i pokaże odpowiedni cytat.

Następnie używamy sayings[index], aby dynamicznie pobierać cytat z tablicy:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Gdy wartość index się zmienia, Text pokazuje inny cytat.

### Używanie przycisku do sterowania indeksem

Aby sterować przełączaniem cytatów, możemy użyć Button do zmiany wartości index. Przy każdym kliknięciu przycisku index zwiększa się o 1:

```swift
Button("Next") {
    index += 1
}
```

Gdy klikniemy przycisk, wartość index zmieni się z 0 na 1, co spowoduje odświeżenie widoku, a Text(sayings[index]) odczyta kolejny cytat.

Pojawia się tu jednak potencjalny problem: jeśli będziemy klikać przycisk wiele razy, index będzie rosnąć aż do wartości wykraczającej poza zakres tablicy, co spowoduje błąd indeksu poza zakresem. Na przykład, gdy index osiągnie 5, a prawidłowe indeksy to od 0 do 4, program się zawiesi.

Aby temu zapobiec, musimy wprowadzić kontrolę warunkową, która zagwarantuje, że index nie wyjdzie poza zakres tablicy. Można to zrobić przy pomocy instrukcji if-else, sprawdzając, czy index jest mniejszy niż długość tablicy.

## Sterowanie warunkowe: instrukcja if-else

Instrukcja if-else to jedna z najczęściej używanych instrukcji warunkowych w Swift. Służy do sprawdzania, czy warunek jest spełniony, i wykonywania różnych bloków kodu w zależności od tego, czy warunek jest prawdziwy, czy fałszywy.

Podstawowa struktura:

```swift
if condition {
    // Kod wykonywany, gdy condition jest true
} else {
    // Kod wykonywany, gdy condition jest false
}
```

W instrukcji if warunek condition jest wartością logiczną typu Bool, czyli może być true albo false. Jeśli warunek jest true, wykonywany jest kod w części if, w przeciwnym razie wykonywany jest kod w części else.

Na przykład:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

W tym przykładzie age ma wartość 25, więc instrukcja if sprawdza, czy age > 18 jest prawdą. Ponieważ warunek jest spełniony, zostanie wypisane "Big Boy".

Jeśli nie potrzebujemy części else, można ją pominąć:

```swift
if condition {
    // Kod wykonywany, gdy condition jest true
}
```

### Używanie warunku do kontroli zakresu indeksu

Aby zapobiec wyjściu indeksu poza zakres tablicy, można użyć instrukcji if, aby upewnić się, że index nie przekroczy granic tablicy:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analiza logiki: sayings.count ma wartość 5, ponieważ mamy 5 cytatów, więc sayings.count - 1 daje 4, czyli ostatni poprawny indeks tablicy.

Gdy index jest mniejszy niż 4, kliknięcie przycisku i wykonanie index += 1 jest bezpieczne. Kiedy index osiągnie 4, warunek przestaje być spełniony i kliknięcie przycisku nie daje już żadnego efektu.

W tym momencie kod już realizuje przełączanie cytatów:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Cytaty w pętli

Jeśli chcemy, aby po wyświetleniu ostatniego cytatu kolejne kliknięcie przycisku znów pokazało pierwszy cytat, a więc aby cytaty wyświetlały się w pętli, można to zrealizować przy użyciu części else:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Po kliknięciu przycisku, jeśli index osiągnie ostatni element tablicy, zostanie zresetowany do 0 i cytaty zaczną się wyświetlać od początku.

## Ulepszanie widoku cytatów

Teraz logika karuzeli cytatów już działa, ale możemy jeszcze poprawić wygląd interfejsu, aby był ładniejszy.

Pełny kod:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

W tym przykładzie do widoku Text dodano białe półprzezroczyste tło i zaokrąglone rogi, przycisk Button używa stylu .borderedProminent, a VStack ma ustawiony obraz jako tło.

Uzupełnienie wiedzy: podczas używania modyfikatora background() do obsługi obrazu tła, jego domyślne zachowanie polega na maksymalnym wypełnieniu obszaru układu bieżącego widoku. W wielu sytuacjach może on naturalnie rozciągać się aż do bezpiecznego obszaru (Safe Area).

W ten sposób uzyskaliśmy widok karuzeli cytatów.

![SwiftUI View](../../RESOURCE/011_word.png)

## Podsumowanie

W tej lekcji nauczyliśmy się, jak używać tablicy do przechowywania wielu cytatów i jak za pomocą if oraz if-else zrealizować ich przełączanie.

Poznaliśmy również podstawowe operacje na tablicach, takie jak dodawanie, usuwanie i modyfikowanie elementów, a także sposoby zapobiegania wyjściu indeksu poza zakres.

Ta lekcja nie tylko pokazała, jak zaimplementować karuzelę cytatów, lecz także połączyła ten przykład z podstawowym użyciem tablic i instrukcji warunkowych, pomagając nam zrozumieć, jak przetwarzać dane i sterować przepływem programu.

## Wiedza rozszerzona — wielokrotne warunki: instrukcja if-else if-else

W praktycznym programowaniu często trzeba obsługiwać wiele warunków. Na przykład w pewnej grze zdarzenie A uruchamia się, gdy liczba punktów wynosi 1, zdarzenie B uruchamia się przy 2, zdarzenie C przy 3 i tak dalej.

W sytuacjach, gdzie mamy więcej niż dwie gałęzie warunkowe, potrzebujemy instrukcji if-else if-else do wykonywania wielu porównań.

Podstawowa składnia:

```swift
if conditionA {
    // Kod wykonywany, gdy conditionA jest true
} else if conditionB {
    // Kod wykonywany, gdy conditionB jest true
} else if conditionC {
    // Kod wykonywany, gdy conditionC jest true
} else {
    // Kod wykonywany, gdy żaden warunek nie jest spełniony
}
```

W takim przypadku program sprawdza warunki po kolei i wykonuje pierwszy spełniony blok. Jeśli żaden warunek nie zostanie spełniony, wykona kod po else.

W karuzeli cytatów również możemy użyć instrukcji if-else if-else do wielokrotnego sprawdzania warunków:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Gdy index wynosi 0, 1, 2 albo 3, każde kliknięcie przycisku wykonuje index += 1. Gdy index wynosi 4, czyli wskazuje ostatni element, index zostaje zresetowany do 0, co realizuje cykliczne przełączanie.

Gałąź else pełni rolę zabezpieczenia, aby obsłużyć nieprawidłowe wartości, na przykład gdyby index został zmieniony błędnie.

Warto zauważyć, że użyty tutaj operator == służy do sprawdzania „czy jest równe”. Jeśli instrukcja if stwierdzi, że index jest równy konkretnej liczbie, zwróci true i wykona odpowiedni blok kodu. Jeśli nie, przejdzie do kolejnego warunku.

Takie wielokrotne warunki są przydatne wtedy, gdy w zależności od różnych sytuacji chcemy wykonywać różne fragmenty kodu.
