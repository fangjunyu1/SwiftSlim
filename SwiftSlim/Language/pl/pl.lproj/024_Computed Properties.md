# Właściwość obliczana

W tej lekcji nauczymy się głównie właściwości obliczanych.

Właściwość obliczana służy do obliczania nowego wyniku na podstawie już istniejących danych. Może obliczać wartości liczbowe, a także treść, która ma zostać wyświetlona w widoku SwiftUI.

Na przykład:

```swift
let a = 10
let b = 20
let c = a + b
```

Tutaj `c` oznacza wynik dodania `a` i `b`.

W zwykłym kodzie taki sposób zapisu jest bardzo częsty.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Wskazówka: w zdarzeniu kliknięcia `Button` można wykonywać zwykły kod Swift.

Jeśli jednak podobny kod zostanie zapisany bezpośrednio we właściwościach widoku SwiftUI, pojawi się problem.

Na przykład:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Ten kod spowoduje błąd.

Na pierwszy rzut oka `a` i `b` zostały zapisane przed `c`, więc wydaje się, że wartość `c` powinna dać się obliczyć.

Jednak podczas deklarowania właściwości w strukturze nie można bezpośrednio użyć takiego zapisu.

## Dlaczego c nie może być bezpośrednio obliczone jako a + b?

Ponieważ `a`, `b` i `c` nie są tymczasowymi stałymi w zdarzeniu kliknięcia przycisku. Są właściwościami widoku `ContentView`.

W zdarzeniu kliknięcia przycisku ten kod może zostać wykonany normalnie:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Dzieje się tak dlatego, że po kliknięciu przycisku kod jest wykonywany po kolei. Najpierw tworzone jest `a`, potem `b`, a na końcu przy użyciu `a + b` obliczane jest `c`.

Jednak podczas deklarowania właściwości wewnątrz widoku sytuacja wygląda inaczej:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Tutaj `a`, `b` i `c` są właściwościami widoku `ContentView`.

Podczas tworzenia widoku `ContentView` Swift musi najpierw przygotować te właściwości. Aby proces tworzenia był bezpieczny, Swift nie pozwala, aby domyślna wartość jednej przechowywanej właściwości instancji bezpośrednio odczytywała inne właściwości tej samej instancji.

Dlatego ta linia spowoduje błąd:

```swift
let c = a + b
```

Można to zrozumieć prosto: **podczas deklarowania właściwości wewnątrz widoku nie można bezpośrednio użyć jednej zwykłej właściwości do obliczenia innej zwykłej właściwości.**

Właściwość, która bezpośrednio przechowuje wartość, nazywa się „właściwością przechowywaną”. Dla łatwiejszego zrozumienia można tymczasowo traktować ją jako zwykłą właściwość.

Na przykład:

```swift
let a = 10
```

`a` przechowuje `10`.

```swift
let b = 20
```

`b` przechowuje `20`.

Ale:

```swift
let c = a + b
```

Tutaj `c` nie jest bezpośrednio wpisaną stałą wartością. Oczekujemy, że zostanie obliczone przez `a + b`.

W sytuacji, gdy „wynik ma zostać uzyskany na podstawie istniejących danych”, bardziej odpowiednia jest właściwość obliczana.

Można to zmienić tak:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Tutaj `c` jest właściwością obliczaną.

```swift
var c: Int {
    return a + b
}
```

Znaczenie jest takie: **gdy trzeba użyć `c`, wtedy odczytywane są `a` i `b`, a wynik `a + b` jest zwracany.**

Na przykład:

```swift
Text("c: \(c)")
```

Dopiero gdy `Text` wyświetla `c`, uruchamiane jest obliczenie `c`.

## Czym jest właściwość obliczana?

Właściwość obliczana wygląda jak zmienna, ale sama nie przechowuje danych.

Na przykład:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Tutaj `c` jest właściwością obliczaną.

Nie przechowuje ona stałej wartości tak jak zwykła właściwość. Za każdym razem, gdy `c` jest odczytywane, kod w `{}` jest wykonywany ponownie, a obliczony wynik zostaje zwrócony.

Można to rozumieć tak:

```swift
var c: Int {
    return a + b
}
```

Gdy potrzebne jest `c`, obliczane jest `a + b`.

Dlatego właściwość obliczana pasuje do takiej sytuacji: **wyniku nie trzeba przechowywać osobno, ponieważ można go obliczyć na podstawie już istniejących danych.**

## Podstawowy sposób zapisu

Właściwość obliczana zwykle składa się z trzech części:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklarowanie za pomocą `var`

```swift
var c
```

Właściwość obliczana musi być deklarowana za pomocą `var`; nie można użyć `let`.

Dzieje się tak dlatego, że właściwość obliczana nie jest stałą przechowywaną wartością, lecz wynikiem dynamicznie obliczanym przy każdym odczycie.

### 2. Podanie typu zwracanego

```swift
var c: Int
```

Właściwość obliczana musi mieć podany typ zwracany.

Tutaj `c` ostatecznie zwraca liczbę całkowitą, więc typem jest `Int`.

### 3. Zapisanie logiki obliczania w {}

```swift
{
    return a + b
}
```

W `{}` zapisuje się logikę obliczania. Tutaj zwracany wynik to `a + b`.

## Słowo kluczowe return

Właściwość obliczana musi zwrócić wynik.

Na przykład:

```swift
var c: Int {
    return a + b
}
```

Tutaj `return` oznacza: zwróć wynik obliczenia `a + b`.

Jeśli we właściwości obliczanej znajduje się tylko jedno wyrażenie, które bezpośrednio tworzy wynik, można pominąć `return`:

```swift
var c: Int {
    a + b
}
```

Jeśli jednak właściwość obliczana zawiera kilka linii kodu, trzeba użyć `return`, aby jasno wskazać zwracany wynik.

Na przykład:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Tutaj proces obliczania jest podzielony na dwa kroki.

Pierwszy krok to obliczenie całkowitej ceny:

```swift
let total = count * price
```

Drugi krok to połączenie całkowitej ceny z tekstem i zwrócenie wyniku:

```swift
return "Total：\(total) $"
```

Jeśli usuniemy `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Ten kod spowoduje błąd.

Powód jest taki: **ta właściwość obliczana zawiera już kilka linii kodu, więc Swift nie może automatycznie określić, która linia jest ostatecznym wynikiem do zwrócenia.**

Dlatego gdy we właściwości obliczanej znajduje się tylko jedno wyrażenie tworzące wynik, można pominąć `return`.

```swift
var c: Int {
    a + b
}
```

Gdy właściwość obliczana zawiera kilka linii kodu, zaleca się jawne zapisanie `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Różnica między właściwością obliczaną a zwykłą właściwością

Zwykła właściwość przechowuje dane.

```swift
var c = 30
```

Tutaj `c` przechowuje konkretną wartość: `30`.

Właściwość obliczana nie przechowuje danych.

```swift
var c: Int {
    a + b
}
```

Tutaj `c` nie przechowuje `30`. Dostarcza jedynie sposób obliczenia.

Gdy `c` jest odczytywane, Swift wykonuje:

```swift
a + b
```

Następnie zwraca obliczony wynik.

Dlatego właściwość obliczana nadaje się do sytuacji, w których wynik ma zostać obliczony na podstawie innych danych.

## body też jest właściwością obliczaną

Po poznaniu właściwości obliczanych możemy ponownie zrozumieć najczęściej spotykany kod w SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Tutaj `body` również jest właściwością obliczaną.

Jest deklarowane za pomocą `var`:

```swift
var body
```

Ma typ zwracany:

```swift
some View
```

W `{}` zwracana jest zawartość widoku SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Dlatego `body` można rozumieć tak: gdy SwiftUI musi wyświetlić ten widok, odczytuje `body` i tworzy interfejs na podstawie treści zwróconej przez `body`.

Gdyby zapisać `return`, można to rozumieć tak:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Jednak w SwiftUI zwykle pomijamy `return` i zapisujemy bezpośrednio:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Gdy dane `@State` się zmieniają, SwiftUI ponownie odczytuje `body` i aktualizuje interfejs zgodnie z nowymi danymi.

Na przykład:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Po kliknięciu przycisku `count` się zmienia.

```swift
count += 1
```

Po zmianie `count` SwiftUI ponownie oblicza `body`, więc tekst w interfejsie również zostaje zaktualizowany.

```swift
Text("count: \(count)")
```

To jest także powód, dla którego w SwiftUI interfejs może automatycznie odświeżać się po zmianie danych.

### Nie zaleca się pisania złożonych obliczeń w body

Ponieważ `body` jest właściwością obliczaną, może być odczytywane i obliczane ponownie wiele razy.

Na przykład:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Gdy `name` się zmienia, SwiftUI ponownie oblicza `body`.

Wtedy kod wewnątrz `body` również zostaje wykonany ponownie, a `num` zostaje utworzone od nowa.

```swift
let num = 10
```

W tym przykładzie `num` jest bardzo proste, więc wpływ jest niewielki.

Jednak jeśli w `body` wykonywane są złożone obliczenia, takie jak filtrowanie dużej ilości danych, sortowanie, przetwarzanie obrazów i podobne operacje, może to wpłynąć na płynność interfejsu.

Dlatego w SwiftUI `body` powinno głównie odpowiadać za opisywanie struktury interfejsu.

Proste dane tymczasowe można zapisywać w `body`.

Złożone obliczenia warto przenieść poza `body`, na przykład do właściwości obliczanej, metody albo osobnej części odpowiedzialnej za przetwarzanie danych.

## Przykład: liczba i całkowita cena

Teraz zrozumiemy właściwość obliczaną na prostym przykładzie.

Załóżmy, że jedna marchewka kosztuje 2 $. Użytkownik może kliknąć przycisk, aby zmienić liczbę kupowanych marchewek, a interfejs musi pokazać całkowitą cenę.

Sposób obliczania całkowitej ceny:

```text
Liczba * Cena jednostkowa
```

Jeśli całkowitą cenę zapiszemy w zwykłej zmiennej, będzie to dość kłopotliwe.

Dzieje się tak dlatego, że za każdym razem, gdy liczba się zmienia, trzeba ręcznie aktualizować całkowitą cenę.

Lepszym sposobem jest użycie właściwości obliczanej:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Wyświetlany efekt:

![view](../../Resource/024_view.png)

W tym przykładzie:

```swift
@State private var count = 1
```

`count` oznacza liczbę marchewek. Po kliknięciu przycisku `count` się zmienia.

```swift
private let price = 2
```

`price` oznacza cenę jednostkową marchewki. Tutaj jest to wartość stała, więc używamy `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` oznacza całkowitą cenę.

Nie trzeba jej przechowywać osobno, ponieważ całkowitą cenę zawsze można obliczyć przez `count * price`.

Gdy `count` wynosi `1`:

```swift
totalPrice = 1 * 2
```

Wyświetlany wynik to:

```swift
totalPrice: 2 $
```

Po kliknięciu przycisku `+` `count` staje się `2`.

Wtedy, gdy `totalPrice` zostanie ponownie odczytane, obliczy się na nowo:

```swift
totalPrice = 2 * 2
```

Wyświetlany wynik to:

```swift
totalPrice: 4 $
```

Na tym polega rola właściwości obliczanej: dynamicznie oblicza nowy wynik na podstawie już istniejących danych.

## Właściwość obliczana może być używana do sprawdzania warunków

Właściwość obliczana może nie tylko obliczać liczby, ale także zwracać wynik sprawdzenia warunku.

Na przykład, gdy chcemy, aby minimalna liczba wynosiła 1.

Gdy liczba już wynosi 1, przycisk `-` nie powinien dalej jej zmniejszać.

Można dodać taką właściwość obliczaną:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Pełny kod:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Wyświetlany efekt:

![view](../../Resource/024_view1.png)

Tutaj:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Ten kod oznacza, czy aktualnie można jeszcze zmniejszyć liczbę.

Gdy `count` jest większe niż `1`:

```swift
canDecrease == true
```

Oznacza to, że można zmniejszać.

Gdy `count` jest równe `1`:

```swift
canDecrease == false
```

Oznacza to, że nie można już dalej zmniejszać.

### Sprawdzanie warunku w przycisku

W przycisku użyto:

```swift
if canDecrease {
    count -= 1
}
```

Tylko gdy `canDecrease` ma wartość `true`, można zmniejszyć `count`.

### Sterowanie kolorem pierwszego planu widoku

Można także użyć `canDecrease`, aby sterować kolorem pierwszego planu przycisku:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Tutaj użyto operatora trójargumentowego:

```swift
canDecrease ? Color.primary : Color.gray
```

Znaczenie tego kodu jest następujące: jeśli `canDecrease` ma wartość `true`, kolor pierwszego planu używa `Color.primary`; jeśli `canDecrease` ma wartość `false`, kolor pierwszego planu używa `Color.gray`.

`Color.primary` to semantyczny kolor systemowy dostarczany przez SwiftUI. Oznacza główny kolor tekstu w aktualnym interfejsie.

W trybie jasnym `Color.primary` zwykle jest zbliżony do czerni; w trybie ciemnym zwykle jest zbliżony do bieli.

Dlatego zaletą używania `Color.primary` jest to, że automatycznie dostosowuje się do trybu jasnego i ciemnego.

### Sterowanie stanem wyłączenia widoku

`disabled` służy do sterowania tym, czy widok jest w stanie wyłączonym:

```swift
.disabled(!canDecrease)
```

Gdy `disabled` ma wartość `false`, widok można kliknąć.

Gdy `disabled` ma wartość `true`, widok jest wyłączony i nie można go kliknąć.

Tutaj `canDecrease` jest używane jako warunek, dzięki czemu kod jest łatwiejszy do zrozumienia.

Widząc `canDecrease`, można od razu zrozumieć, że oznacza ono „czy obecnie można jeszcze zmniejszyć”.

### Dodatkowe wyjaśnienie: dlaczego sprawdzamy dwa razy?

W przycisku `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Tutaj użyto zarówno `.disabled(!canDecrease)`, jak i `if canDecrease` wewnątrz przycisku.

`.disabled(!canDecrease)` odpowiada za wyłączenie przycisku na poziomie interfejsu, aby użytkownik nie mógł go kliknąć.

`if canDecrease` ponownie sprawdza warunek przed wykonaniem kodu. Tylko gdy można zmniejszyć, wykonywane jest `count -= 1`.

To jest podwójne zabezpieczenie. W praktycznym tworzeniu aplikacji, jeśli przycisk jest już wyłączony, wewnętrzne sprawdzenie można pominąć. Jednak w przykładzie dydaktycznym jego pozostawienie może wyraźniej pokazać rolę `canDecrease`.

## Podsumowanie

W tej lekcji poznaliśmy głównie właściwości obliczane.

Właściwość obliczana nie przechowuje wartości bezpośrednio. Gdy jest odczytywana, oblicza wynik na podstawie już istniejących danych.

Na przykład:

```swift
var c: Int {
    a + b
}
```

Tutaj `c` nie musi być przechowywane osobno, ponieważ można je obliczyć przez `a + b`.

Właściwość obliczana musi być deklarowana za pomocą `var` i musi mieć podany typ zwracany.

```swift
var canDecrease: Bool {
    count > 1
}
```

Właściwość obliczana może zwracać nie tylko wartości liczbowe, ale także wynik sprawdzenia warunku, treść tekstową, a nawet zawartość widoku SwiftUI.

W tej lekcji poznaliśmy także `return`.

`return` oznacza zwrócenie wyniku:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Jeśli we właściwości obliczanej znajduje się tylko jedno wyrażenie, które bezpośrednio tworzy wynik, można pominąć `return`.

```swift
var totalPrice: Int {
    count * price
}
```

Poza tym poznaliśmy także `Color.primary` i `disabled`.

`Color.primary` to semantyczny kolor systemowy SwiftUI. Automatycznie dostosowuje sposób wyświetlania do trybu jasnego i ciemnego.

```swift
.foregroundStyle(Color.primary)
```

`disabled` służy do sterowania tym, czy widok jest wyłączony.

```swift
.disabled(true)
```

Oznacza to, że widok jest wyłączony i nie można go kliknąć.

```swift
.disabled(false)
```

Oznacza to, że widok jest dostępny i można go kliknąć.

Dlatego właściwości obliczane są bardzo często używane w SwiftUI. Pomagają jaśniej organizować wyniki obliczeń, warunki i wyświetlaną treść.
