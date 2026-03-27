# System typów

W poprzednich lekcjach poznaliśmy już zmienne i wiemy, że mogą one przechowywać dane różnych typów.

Na przykład:

```swift
var hello = "Hello, World"
```

Tutaj `hello` przechowuje fragment tekstu, więc jego typ to `String`.

Następnie systematycznie poznamy pojęcie typu (`Type`), a także jawne deklarowanie typu i wnioskowanie typu, aby głębiej zrozumieć istotę zmiennych.

## Czym jest typ

W Swift każda wartość ma jednoznacznie określony typ. Typ decyduje o tym, czym jest dana wartość i co można z nią zrobić.

Na przykład:

* `42` to `Int` (liczba całkowita)
* `"Hello"` to `String` (ciąg znaków)
* `true` to `Bool` (wartość logiczna)

Należą one do różnych typów i mają różne zastosowania.

## Najczęściej używane podstawowe typy w Swift

Na początkowym etapie nauki najczęściej spotyka się następujące typy:

* `String`: ciąg znaków (tekst)
* `Int`: liczba całkowita
* `Double`: liczba zmiennoprzecinkowa (z częścią dziesiętną, o wyższej precyzji)
* `Bool`: wartość logiczna (`true`/`false`)

Oprócz tego istnieje także `Float` (liczba zmiennoprzecinkowa), ale ma niższą precyzję niż `Double`, więc zwykle używa się go rzadziej; oraz `Character` (pojedynczy znak), na przykład `"A"`, `"!"` i inne pojedyncze znaki.

### Deklarowanie typu (jawny typ)

W Swift można ręcznie określić typ podczas deklarowania zmiennej:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Po nazwie zmiennej dodaje się `: Typ`, aby zadeklarować typ zmiennej.

Składnia typu dla tablic to `: [Typ]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

W tym kodzie tablica `scores` może przechowywać tylko elementy typu `Int`, a `tags` tylko typu `String`.

Jawne deklarowanie typu sprawia, że intencja kodu jest bardziej czytelna, a w niektórych sytuacjach pomaga uniknąć błędów wnioskowania typu.

## Wnioskowanie typu

W wielu przypadkach nie trzeba jawnie deklarować typu:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"     // String
var isLogin = false  // Bool
var scores = [90, 85, 78]    // [Int]
var tags = ["Swift", "iOS"]  // [String]
```

Dzieje się tak dlatego, że kompilator Swift automatycznie wnioskuje typ na podstawie „wartości początkowej”.

## Jawna deklaracja a wnioskowanie typu

W poprzednich lekcjach nie wprowadzaliśmy jawnej deklaracji, na przykład:

```swift
var age: Int = 18
```

Zamiast tego najpierw używaliśmy wnioskowania typu:

```swift
var age = 18
```

W tym przykładzie oba zapisy są równoważne — `age` zostanie określone jako typ `Int`. W porównaniu z tym zapis oparty na wnioskowaniu typu jest prostszy.

Powodem, dla którego na początku nie kładliśmy nacisku na jawne deklarowanie typu, jest to, że wnioskowanie typu zmniejsza ilość dodatkowych informacji w kodzie, a tym samym obniża koszt zrozumienia go na etapie nauki.

## Dlaczego typy są potrzebne

Swift jest językiem silnie typowanym (`Strongly Typed Language`).

Oznacza to, że gdy typ zmiennej zostanie już określony, nie można go dowolnie zmieniać.

Na przykład:

```swift
var age: Int = 18

age = 20      // Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Pierwsze `20` ma typ `Int`, więc można je przypisać do `age`; drugie `"20"` ma typ `String`, który nie zgadza się z `Int`, dlatego pojawi się błąd.

`nums` jest tablicą typu `[Int]`, więc może przechowywać tylko liczby całkowite i nie można do niej mieszać ciągów znaków.

Typy ograniczają sposób użycia danych i pozwalają wykrywać problemy z niezgodnością typów już na etapie kompilacji, co zmniejsza liczbę błędów wynikających z chaosu typów oraz zwiększa stabilność i łatwość utrzymania kodu.

## Kiedy trzeba jawnie zadeklarować typ

Chociaż Swift potrafi automatycznie wnioskować typ, w niektórych sytuacjach kompilator nie potrafi go określić albo określa go błędnie. Wtedy trzeba zadeklarować typ ręcznie.

**1. Pusta tablica**

Podczas tworzenia pustej tablicy trzeba jawnie zadeklarować typ:

```swift
var nums: [Int] = []
```

Jeśli nie podasz typu:

```swift
var nums = []   // Error, Empty collection literal requires an explicit type
```

Kompilator nie potrafi wywnioskować typu elementów pustej tablicy, dlatego pojawia się błąd kompilacji.

**2. Unikanie błędów wnioskowania**

```swift
var value = 10   // Int
```

W tym przykładzie, chociaż `10` może również reprezentować liczbę zmiennoprzecinkową (`Double`), ponieważ nie ma części dziesiętnej, kompilator domyślnie uzna ją za typ `Int`.

Jeśli chcesz, aby `value` było liczbą zmiennoprzecinkową, trzeba jawnie określić typ:

```swift
var value: Double = 10   // Double
```

Gdy wynik wnioskowania typu nie jest zgodny z oczekiwaniami, należy użyć jawnej deklaracji typu lub zmienić formę literału, aby zapewnić poprawny typ.

**3. Typy własne**

Później będziemy uczyć się także własnych typów. Przy ich użyciu zwykle również trzeba jawnie deklarować typ:

```swift
var info: GameInfo
var users: [User] = []
```

Przyczyna jest taka sama jak w przypadku pustej tablicy — kompilator nie potrafi automatycznie wywnioskować typu z pustej wartości.

## Konwersja typów

W Swift różne typy nie konwertują się automatycznie — trzeba robić to ręcznie.

Na przykład dodawanie dwóch liczb różnych typów:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b    // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

W tym kodzie `a` ma typ `Int`, a `b` ma typ `Double`. Typy są różne, więc nie można wykonać działania bezpośrednio.

Przed wykonaniem działania trzeba najpierw przekonwertować jedną z wartości na ten sam typ:

```swift
var result = Double(a) + b
```

Ten zapis oznacza, że `a` typu `Int` zostaje przekonwertowane do `Double`, a następnie dodane do `b`, a wynik zostaje przypisany do `result`.

Trzeba pamiętać, że konwersja typu nie zmienia typu oryginalnej zmiennej. Na przykład `Double(a)` nie zmienia `a` z `Int` na `Double`, lecz tworzy nową wartość typu `Double`, która bierze udział w obliczeniu.

Inne typy można konwertować w podobny sposób, używając formy: typ docelowy + `()`, przekazując do środka wartość do konwersji. Na przykład:

```
Int()、Double()、String()
```

Przykład:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Trzeba pamiętać, że nie każda konwersja kończy się tak samo — na przykład przy `Double → Int` część dziesiętna zostaje po prostu odcięta, bez zaokrąglania.

## Alias typu

W Swift można również nadać istniejącemu typowi alias, aby kod był bardziej czytelny semantycznie:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Tutaj `UserID` w swojej istocie nadal jest `Int` — typ się nie zmienia, zmienia się tylko nazwa, która staje się bardziej znacząca.

W większych projektach, gdzie kodu jest dużo, a typy są bardziej złożone, aliasy typów poprawiają czytelność.

## Przykład użycia typów

Poniżej, na prostym przykładzie, pokażemy rolę typów w rzeczywistej pracy z kodem.

### Tworzenie zmiennej

Najpierw tworzymy zmienną `age`:

```swift
var age = 20
```

Ponieważ tę zmienną trzeba wyświetlać i modyfikować w SwiftUI, należy zadeklarować ją za pomocą `@State`:

```swift
@State private var age = 20
```

`private`, o którym wspominaliśmy wcześniej, oznacza, że ta zmienna może być używana tylko w bieżącym widoku. Wrócimy do tego później.

### Wyświetlanie danych w SwiftUI

Wyświetlenie zmiennej `age` w SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Teraz widok pokaże:

```swift
age: 20
```

### Modyfikowanie danych

Następnie dodajemy dwa przyciski do modyfikowania `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Wynik działania

Po kliknięciu `changeAge1`, do `age` zostanie przypisane `18`:

```swift
age = 18
```

Ponieważ `18` ma typ `Int`, zgodny z typem `age`, przypisanie powiedzie się.

`changeAge2` spowoduje błąd:

```swift
age = "18"
```

Komunikat błędu:

```
Cannot assign value of type 'String' to type 'Int'
```

Dzieje się tak dlatego, że `"18"` ma typ `String` (ciągi znaków trzeba ujmować w `""`), a `age` ma typ `Int`. Typy są niezgodne, więc przypisanie nie jest możliwe.

### Dlaczego pojawia się błąd?

Klucz tkwi w tej linii kodu:

```swift
@State private var age = 20   // Int
```

Mimo że typ nie został jawnie zadeklarowany, ponieważ wartość początkowa `20` ma typ `Int`, kompilator automatycznie wywnioskuje, że `age` ma typ `Int`.

Gdy typ zostanie ustalony, nie można już przypisać wartości innego typu.

Co więcej, przycisk `changeAge2` nie „zawiedzie w czasie działania”, lecz spowoduje błąd już na etapie kompilacji — kod nie przejdzie kompilacji.

To także jedna z zalet silnego typowania w Swift: problemy z typami można wykryć już podczas pisania kodu.

### Poprawny zapis

Po usunięciu błędnego kodu:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Po kliknięciu przycisku `changeAge1` widok zaktualizuje się do:

```swift
age: 18
```

### Jawna deklaracja typu (opcjonalnie)

Można też przy definiowaniu wyraźnie określić typ:

```swift
@State private var age: Int = 20
```

Taki zapis czyni typ bardziej oczywistym, ale w prostych sytuacjach nie jest konieczny.

## Podsumowanie

W tej lekcji omówiliśmy system typów w Swift oraz jego rolę w praktyce.

W Swift każda wartość ma jasno określony typ. Typ określa znaczenie danych oraz operacje, w których mogą brać udział.

Swift jest językiem silnie typowanym — gdy typ zmiennej zostanie ustalony, nie można już przypisać do niej wartości innego typu. To ograniczenie pozwala wykrywać błędy już na etapie kompilacji, dzięki czemu zmniejsza liczbę problemów w czasie działania i zwiększa bezpieczeństwo kodu.

Typ zmiennej może zostać automatycznie wywnioskowany z wartości początkowej albo jawnie zadeklarowany. W niektórych sytuacjach (np. puste tablice, błędne wnioskowanie typu, własne typy) kompilator nie potrafi poprawnie określić typu — wtedy jawna deklaracja jest konieczna.

Różne typy nie konwertują się automatycznie. Trzeba używać jawnej konwersji za pomocą `Int()`、`Double()`、`String()` i podobnych.

Typy obsługują również aliasy. Szczególnie w bardziej złożonych projektach aliasy typów poprawiają czytelność kodu.

Typ nie jest tylko etykietą danych, ale również mechanizmem ograniczającym, który zapewnia, że dane są używane w sposób bezpieczny, jednoznaczny i kontrolowany.

## Wiedza rozszerzająca — typ opcjonalny

Podczas konwersji typów niektóre operacje mogą się nie udać.

Na przykład konwersja `String` do `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Tutaj `Double(input)` nie zwraca `Double`, lecz:

```
Double?
```

To właśnie typ opcjonalny (`Optional`).

### Dlaczego zwracany jest typ opcjonalny?

Ponieważ zawartość łańcucha znaków jest niepewna — `"3.14"` można przekonwertować do `Double`, ale `"Hello"` już nie.

Innymi słowy, ta operacja może się udać albo nie.

Dlatego Swift używa typu opcjonalnego do reprezentowania takiej niepewności.

### Czym jest typ opcjonalny?

Typ opcjonalny oznacza, że wartość może istnieć, ale może też nie istnieć.

Na przykład:

```
Double?
```

Ten typ oznacza, że jeśli wartość istnieje, przy wypisywaniu zobaczysz `Optional(...)`, a jeśli jej nie ma, zostanie zwrócone `nil`.

Trzeba pamiętać, że `nil` oznacza „brak wartości”, a nie `0` ani pusty ciąg znaków.

### Przykład

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Wynik:

```
pi:Optional(3.14)
```

Oznacza to, że ciąg znaków został pomyślnie przekonwertowany do `Double`, otrzymując `3.14`, ale ponieważ typem jest `Double?`, wartość jest opakowana w `Optional`.

Jeśli konwersja się nie powiedzie:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Wynik:

```
pi: nil
```

Ponieważ `"Hello"` nie da się przekonwertować do typu `Double`, konwersja kończy się niepowodzeniem i zwracane jest `nil`.

### Czym jest `Optional(...)`?

Gdy bezpośrednio wypisujemy typ opcjonalny:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift wyświetla jego „opis debugowy”:

```
Optional(3.14)
```

Nie jest to część rzeczywistych danych, lecz wskazówka, że bieżąca wartość ma „typ opcjonalny” i zawiera w środku jakąś wartość.

### Rozpakowywanie typu opcjonalnego

W praktyce zwykle chcemy wyciągnąć z typu opcjonalnego rzeczywistą wartość. Ten proces nazywa się rozpakowywaniem (`Unwrapping`).

Jednym z typowych sposobów jest użycie `??` w celu podania wartości domyślnej:

```
??
```

Nazywa się to: operatorem scalania z `nil` (`Nil-Coalescing Operator`).

Na przykład:

```swift
name ?? "FangJunyu"
```

Ten zapis oznacza: jeśli `name` ma wartość, zwróć ją; jeśli jest `nil`, użyj wartości domyślnej `"FangJunyu"`.

Trzeba pamiętać, że wartość domyślna musi mieć ten sam typ co typ opcjonalny.

### Użycie `??` do podania wartości domyślnej

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")    // 30
```

Wynik:

```
pi: 30
```

Podczas konwersji `input` do typu `Double` konwersja się powiedzie i zostanie wypisana wartość. Jeśli konwersja się nie powiedzie, zostanie użyta wartość domyślna podana przez `??`.

Jeśli konwersja się nie powiedzie:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Wynik:

```
pi: 10
```

Tutaj podczas konwersji `input` do `Double` konwersja kończy się niepowodzeniem i zwraca `nil`, a `??` dostarcza wartość domyślną dla `nil`.

Typ opcjonalny służy do reprezentowania sytuacji „wartość może istnieć, ale może też nie istnieć”.

W operacjach, które mogą się nie udać, takich jak konwersja typu, Swift zwraca typ opcjonalny, aby zapewnić bezpieczeństwo programu.

Gdy chcemy użyć znajdującej się w nim wartości, możemy przez `??` podać wartość domyślną, dzięki czemu nawet przy `nil` nadal otrzymamy sensowny wynik.
