# Operatory

W tej lekcji będziemy uczyć się operatorów Swift (`Operators`).

Gdy wykonujemy obliczenia, porównania albo oceny logiczne, musimy używać operatorów. Takie operacje przewijają się przez cały proces działania programu i są jedną z najbardziej podstawowych umiejętności w programowaniu.

```swift
let a = 100 * 8
```

W trakcie nauki programowania wiele osób zauważa, że osoby mające pewne myślenie matematyczne często łatwiej rozumieją logikę programu. Wynika to z tego, że programowanie w swojej istocie nie może obyć się bez „obliczeń” i „oceny reguł”, a właśnie to jest podstawową rolą operatorów.

W praktyce operatory nie służą tylko do prostych obliczeń liczbowych, ale są też szeroko wykorzystywane w wielu konkretnych scenariuszach.

Na przykład w grze z klockami, gdy użytkownik przeciąga klocek na określoną pozycję, trzeba obliczyć:

* pozycję współrzędnych klocka
* miejsca, które klocek może wypełnić
* czy pozycja docelowa jest dostępna

Te procesy „obliczanie + ocenianie” w swojej istocie opierają się właśnie na operatorach.

![Block](../../Resource/013_block.png)

Nauka operatorów to nie tylko nauka liczenia, ale także budowanie podstaw pod późniejsze układy interfejsu, przetwarzanie danych i logikę interakcji.

## Sposób wykonywania obliczeń w SwiftUI

W SwiftUI obliczenia zwykle wykonuje się przez wywołanie funkcji za pomocą `Button`, a następnie logika obliczeń jest realizowana wewnątrz funkcji.

Na przykład:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Po kliknięciu przycisku w `Console` pojawi się:

```swift
c: 20
```

W tej lekcji będziemy konsekwentnie umieszczać logikę obliczeń w `func`, uruchamiać ją przyciskiem i używać `print` do wypisywania wyników.

W kolejnych przykładach, aby uprościć prezentację kodu, będziemy bezpośrednio zaznaczać wynik obliczeń w kodzie i nie będziemy już za każdym razem powtarzać wypisywania przez `print`.

## Zarządzanie wyjściem w Console

Ponieważ każde kliknięcie generuje nowe informacje w konsoli, można kliknąć przycisk czyszczenia w prawym dolnym rogu obszaru `Console`, aby usunąć historię logów i łatwiej zobaczyć bieżący wynik.

![Console](../../Resource/013_console.png)

## Inny zapis Button

Gdy przycisk wykonuje tylko jedną funkcję, można użyć prostszego zapisu:

```swift
Button(action: ) {
    // View
}
```

W tym zapisie `action` określa funkcję, która ma zostać wykonana po kliknięciu przycisku (funkcja bez parametrów), a nawiasy klamrowe `{}` służą do zdefiniowania widoku przycisku.

W połączeniu z poznaną wcześniej funkcją `calculate` można to zapisać tak:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Po kliknięciu przycisku funkcja `calculate` zostanie wykonana bezpośrednio.

Dlatego gdy logika przycisku jest prosta i polega tylko na wywołaniu jednej funkcji, zapis z `action` jest czytelniejszy i bardziej zgodny z dobrymi praktykami.

## Operatory arytmetyczne

Operatory arytmetyczne (`Arithmetic Operators`) służą do obliczeń liczbowych:

* `+` dodawanie
* `-` odejmowanie
* `*` mnożenie
* `/` dzielenie
* `%` modulo (reszta z dzielenia)

Przykład:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Trzeba pamiętać, że Swift jest językiem silnie typowanym i nie miesza automatycznie różnych typów danych:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Gdy dwa typy są różne, trzeba ręcznie wykonać konwersję typu.

## Operatory porównania

Operatory porównania (`Comparison Operators`) służą do sprawdzania relacji między dwiema wartościami, a wynikiem jest `Bool`:

* `==` równe
* `!=` nierówne
* `>` większe niż
* `<` mniejsze niż
* `>=` większe lub równe
* `<=` mniejsze lub równe

Przykład:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Operatory porównania są często używane w instrukcjach warunkowych. Na przykład w „karuzeli cytatów” trzeba kontrolować, aby indeks nie przekroczył zakresu tablicy:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Jeżeli `index` jest mniejsze niż `sayings.count - 1`, wynik porównania będzie `true` i kod w instrukcji `if` zostanie wykonany; jeżeli wynik będzie `false`, dalszy kod nie zostanie wykonany.

## Operatory logiczne

Operatory logiczne (`Logical Operators`) służą do łączenia wielu warunków:

* `&&` i (`AND`)
* `||` lub (`OR`)
* `!` nie (`NOT`)

### `&&` i

Gdy wiele warunków musi być spełnionych jednocześnie, używa się `&&`.

Na przykład:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

W tym kodzie są dwa warunki: `age >= 18` oraz `age <= 100`.

Tylko wtedy, gdy oba te warunki są `true`, `legalAge` będzie miało wartość `true`; jeśli choć jeden warunek nie jest spełniony, wynik będzie `false`.

### `||` lub

Gdy wystarczy spełnić tylko jeden z wielu warunków, używa się `||`.

Na przykład:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Ten kod oznacza, że jeśli spełniony jest warunek `money >= 50` albo `creditCard >= 50`, to `payAllowed` będzie `true`.

Dopiero gdy oba warunki nie są spełnione, wynik będzie `false`.

Na przykład w scenariuszu płatności można zapłacić gotówką albo kartą kredytową. Jeżeli żadna z tych opcji nie działa, płatność się nie powiedzie.

### `!` nie

`!` to operator logicznego zaprzeczenia (`NOT`), używany do odwracania wartości `Bool`.

Można to rozumieć tak, że `!` zamienia `true` na `false`, a `false` na `true`.

Na przykład:

```swift
let allowed = true
let result = !allowed   // false
```

Tutaj `!allowed` oznacza odwrócenie wartości `allowed`.

Trzeba pamiętać, że `!` i `!=` to dwa różne operatory: `!` odwraca wartość `Bool`, a `!=` jest operatorem porównania, który zwraca `Bool`.

## Operatory przypisania

Operatory przypisania (`Assignment Operators`) służą do przypisywania lub aktualizowania wartości zmiennych:

* `=` przypisanie

Zarówno przy deklarowaniu zmiennej, jak i podczas obliczeń, występuje operacja przypisania:

```swift
let a = 5
```

Ten kod oznacza przypisanie wartości `5` do zmiennej `a`.

### Złożone operatory przypisania

W praktyce, oprócz podstawowego operatora przypisania, bardzo często używa się także „złożonych operatorów przypisania”, które pozwalają od razu wykonać obliczenie na dotychczasowej wartości i ją zaktualizować:

* `+=`
* `-=`
* `*=`
* `/=`

W poprzedniej lekcji o „liczniku” zdążyliśmy już krótko poznać złożone operatory przypisania.

Na przykład gdy po kliknięciu przycisku chcemy automatycznie zwiększyć wartość zmiennej:

```swift
var num = 10
num += 5   // num = 15
```

Ten kod oznacza, że `num` zostaje dodane do `5`, a wynik ponownie przypisany do `num`.

Dlatego jest on równoważny zapisowi:

```swift
var num = 10
num = num + 5   // num = 15
```

## Operator trójargumentowy

W Swift operator trójargumentowy (`Ternary Operator`) sprawdza warunek i zwraca jeden z dwóch wyników:

```swift
warunek ? wartość1 : wartość2
```

Jego logika działania jest taka: jeśli warunek ma wartość `true`, zwracana jest „wartość1”; jeśli warunek ma wartość `false`, zwracana jest „wartość2”.

Na przykład:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Ten kod sprawdza wartość `showColor`: jeśli jest `true`, zwraca `Color.blue`, a tło będzie niebieskie; jeśli jest `false`, zwraca `Color.clear`, czyli tło nie będzie widoczne.

Wskazówka: `Color.clear` oznacza kolor przezroczysty (nic nie jest wyświetlane).

### Różnica względem `if-else`

Operator trójargumentowy jest logicznie równoważny instrukcji `if-else`.

Na przykład powyższy kod można zapisać tak:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

W obu przypadkach logika działania jest dokładnie taka sama: gdy warunek jest `true`, wykonywany jest pierwszy wynik; gdy warunek jest `false`, wykonywany jest drugi wynik.

W praktyce operator trójargumentowy ma bardziej zwięzły zapis i lepiej nadaje się do prostych sytuacji typu „jedno z dwóch”, często używa się go do bezpośredniego zwracania wartości.

W budowaniu widoków SwiftUI operator trójargumentowy jest bardzo częsty, na przykład:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Taki zapis pozwala w jednej linii kodu dynamicznie zmieniać wygląd widoku zależnie od warunku.

## Operatory zakresu

Operatory zakresu (`Range Operators`) służą do reprezentowania przedziałów:

* `...` zakres domknięty (zawiera oba końce)
* `..<` zakres półotwarty (nie zawiera prawego końca)

Na przykład:

```swift
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Można to rozumieć tak, że `1...3` oznacza od 1 do 3, włącznie z 3; natomiast `5..<8` oznacza od 5 do 8, ale bez 8.

Rozszerzone formy (tylko do ogólnego poznania):

```swift
5...    // >= 5
...5    // <= 5
```

Ten zapis oznacza „zakres jednostronny” i często jest używany w instrukcjach warunkowych albo dopasowywaniu wzorców.

Operatorów zakresu będziemy później używać w pętlach `for`. Na razie można je rozumieć po prostu jako ciągły zakres wartości liczbowych.

## Ćwiczenie operatorów

Poniżej, przez kilka prostych przykładów, przećwiczymy działanie operatorów w widoku.

### 1. Obliczanie łącznej liczby pojazdów

Na przykład na pewnym skrzyżowaniu każdego dnia przejeżdża 500 pojazdów. Obliczmy łączną liczbę pojazdów w ciągu 30 dni.

Możemy użyć operatora obliczeniowego:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Proces obliczenia jest następujący: każdego dnia 500 pojazdów, więc suma za 30 dni to 500 × 30, a wynik końcowy to 15000 pojazdów.

### 2. Sprawdzanie członkostwa w zakupach wewnątrz aplikacji

Możemy sprawdzić, czy dana osoba jest członkiem, jeśli ma aktywowane członkostwo dożywotnie albo subskrypcję — wystarczy dowolny jeden z tych warunków.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

W tym kodzie użyto operatora `||` (`lub`): `lifeTime = false` oznacza brak członkostwa dożywotniego, a `subscription = true` oznacza aktywną subskrypcję.

Ponieważ wystarczy spełnić jeden z warunków, `isMember` ma wartość `true`. Oznacza to, że ta osoba jest członkiem.

## Podsumowanie

W Swift operatory są podstawą obliczeń danych i oceny logiki — podobnie jak `Text` służy do wyświetlania treści, tak operatory służą do przetwarzania samych danych.

Od najprostszych obliczeń liczbowych, przez złożone warunki logiczne, aż po sterowanie stanem widoku i obliczenia układu — wszędzie potrzebne są operatory.

Dzięki ćwiczeniu w różnych scenariuszach można stopniowo oswoić się i opanować różne typy operatorów przedstawione w tej lekcji. To ważna podstawa do dalszej nauki.

### Wiedza rozszerzająca — operatory bitowe

Oprócz tego Swift udostępnia także bardziej niskopoziomową grupę operatorów — operatory bitowe (`Bitwise Operators`):

* `&` (bitowe AND)
* `|` (bitowe OR)
* `^` (bitowe XOR)
* `~` (bitowe NOT)
* `>>` (przesunięcie w prawo)
* `<<` (przesunięcie w lewo)

Na przykład:

```swift
let a = 6  // binarnie 110
let b = 3  // binarnie 011

print(a & b) // 2 (binarnie 010)
print(a | b) // 7 (binarnie 111)
print(a ^ b) // 5 (binarnie 101)
print(~a)    // -7 (negacja bitowa)
```

W Swift liczby całkowite są reprezentowane binarnie w kodzie uzupełnień do dwóch, dlatego po wykonaniu negacji otrzymujemy odpowiadający wynik ujemny.

Operatory bitowe działają bezpośrednio na liczbach binarnych i są zwykle używane w niskopoziomowym przetwarzaniu danych oraz scenariuszach optymalizacji wydajności.

Dla początkujących zastosowania tych operatorów są dość rzadkie, a w zwykłym tworzeniu aplikacji iOS lub SwiftUI również nie pojawiają się często, dlatego tutaj nie będziemy ich omawiać głębiej.

Jeśli później pojawi się potrzeba pracy z logiką niskopoziomową albo optymalizacją wydajności, wtedy można do nich wrócić i uczyć się ich dokładniej.
