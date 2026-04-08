# Lista filmów

W tej lekcji stworzymy listę filmów.

![movie](../../Resource/021_movie.png)

Na liście będą wyświetlane plakat, nazwa, reżyser i ocena każdego filmu.

W tym przykładzie nauczymy się bardzo ważnego zagadnienia: struktury `struct`. Pomaga ona połączyć wiele informacji o jednym filmie w jedną całość. Oprócz tego zetkniemy się także z `UUID()`, `ForEach`, linią podziału `Divider` oraz z tym, jak używać niestandardowych obiektów do zarządzania danymi.

Ta wiedza jest bardzo często używana w dalszej pracy ze SwiftUI. Po ukończeniu tej lekcji nie tylko stworzysz listę filmów, ale też zaczniesz rozumieć „jak wyświetlać grupę danych jako interfejs”.

## Pojedynczy film

Możemy najpierw zacząć od interfejsu pojedynczego filmu.

![movie](../../Resource/021_movie1.png)

Układ tego interfejsu składa się głównie z dwóch części: po lewej stronie jest plakat filmu, a po prawej opis filmu.

### Plakat filmu

Po lewej stronie wyświetlany jest plakat filmu, a do pokazania obrazu możemy użyć `Image`.

Na przykład:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Ten kod oznacza wyświetlenie obrazu o nazwie `"The Shawshank Redemption"`.

Warto tutaj zwrócić uwagę, że nazwa obrazu musi naprawdę istnieć w folderze zasobów `Assets`, w przeciwnym razie interfejs nie wyświetli poprawnie tego obrazu.

![movie](../../Resource/021_movie2.png)

Działanie tych modyfikatorów jest następujące:

- `resizable()` oznacza, że rozmiar obrazu można zmieniać.
- `scaledToFit()` oznacza, że podczas skalowania zachowywane są oryginalne proporcje, aby obraz nie został rozciągnięty i zniekształcony.
- `frame(height: 180)` oznacza ustawienie wysokości obrazu na 180.
- `cornerRadius(10)` oznacza ustawienie zaokrąglenia rogów obrazu na 10.

W ten sposób otrzymamy plakat filmu o odpowiednim rozmiarze i zaokrąglonych rogach.

![movie](../../Resource/021_movie3.png)

### Opis filmu

Po prawej stronie wyświetlany jest opis filmu, w tym nazwa filmu, reżyser i ocena.

![movie](../../Resource/021_movie4.png)

Do wyświetlenia tej części możemy użyć `Text`:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

W tym kodzie `.font` oznacza rozmiar czcionki, a `.fontWeight` oznacza jej grubość.

Aby uzyskać wyraźniejsze odstępy między „nazwą filmu”, „informacją o reżyserze” i „informacją o ocenie”, tutaj na najbardziej zewnętrznym poziomie używamy `VStack` i ustawiamy:

```swift
spacing: 10
```

Oznacza to, że odstęp między każdą grupą zawartości wewnątrz tego `VStack` wynosi 10.

Powodem, dla którego reżyser i ocena są osobno opakowane dodatkowym `VStack`, jest to, że oba należą do struktury „tytuł + treść”. Dzięki temu warstwy interfejsu są bardziej czytelne, a dalsze dopasowywanie stylu staje się wygodniejsze.

Dodatkowo `VStack` jest domyślnie wyrównany do środka. Aby cały tekst był wyrównany do lewej, ustawiamy:

```swift
alignment: .leading
```

Dzięki temu część z opisem filmu wygląda schludniej.

### Linia podziału

Teraz, mimo że treść opisu filmu została rozdzielona dzięki `spacing`, granica między różnymi treściami nadal nie jest wystarczająco wyraźna.

W tym momencie możemy dodać linię podziału:

```swift
Divider()
```

Na przykład:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

W ten sposób część z opisem filmu zyska wyraźniejszy efekt podziału.

![movie](../../Resource/021_movie4.png)

`Divider` to bardzo prosty, ale bardzo często używany widok, którego zadaniem jest oddzielanie różnych treści.

W `VStack` `Divider()` jest wyświetlany jako pozioma linia.

W `HStack` `Divider()` jest wyświetlany jako pionowa linia.

Ponadto styl `Divider` można zmieniać za pomocą `.frame`, `.background`, `.padding` i innych metod.

Na przykład:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Spowoduje to utworzenie niebieskiej linii podziału o grubości 2 z wewnętrznymi marginesami po lewej i prawej stronie.

![divider](../../Resource/021_divider.png)

### Kompletny interfejs

Na końcu możemy użyć `HStack`, aby ustawić plakat filmu i opis filmu obok siebie po lewej i prawej stronie.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Tutaj `HStack(spacing: 20)` oznacza pozostawienie odstępu 20 między lewą i prawą częścią.

Warto zauważyć, że `Divider()`, podobnie jak wspomniane wcześniej `TextField` i `Slider`, domyślnie stara się zajmować tyle dostępnej przestrzeni, ile to możliwe.

Dlatego ustawiamy stałą szerokość dla zewnętrznego `VStack` w prawej części opisu:

```swift
.frame(width: 200)
```

Dzięki temu szerokość linii podziału i obszaru tekstowego pozostanie taka sama, a całość będzie wyglądała bardziej schludnie.

Na tym etapie ukończyliśmy interfejs wyświetlania „pojedynczego filmu”.

![movie](../../Resource/021_movie1.png)

## Przechowywanie filmów w tablicy

Jeśli chcemy wyświetlić wiele filmów jeden po drugim w tym samym stylu, oznacza to, że dla każdego filmu trzeba byłoby napisać podobny kod jeszcze raz.

Na przykład:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Kod zapisany w ten sposób może osiągnąć zamierzony efekt, ale będzie go coraz więcej i stanie się trudny w utrzymaniu.

Na przykład, jeśli trzeba zmienić odstęp wszystkich filmów z `20` na `15`, albo zmienić szerokość po prawej stronie z `200` na
`220`, trzeba ręcznie modyfikować każdy powtarzający się fragment kodu.

To oczywiście nie jest wydajna metoda.

Wcześniej uczyliśmy się tablic oraz tego, jak używać `ForEach`, aby wielokrotnie wyświetlać widoki na podstawie tablicy.

Na przykład:

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

Ten sposób świetnie nadaje się do obsługi sytuacji, w których mamy „tylko jeden rodzaj danych”, na przykład grupę nazw obrazów.

Jednak film to nie tylko jedna wartość. Zawiera co najmniej:

1. Plakat filmu
2. Nazwę filmu
3. Reżysera
4. Ocenę

Innymi słowy, jeden film to w rzeczywistości grupa powiązanych danych, a nie pojedynczy string.

Jeśli użyjemy tylko tablic, to możemy przechowywać te informacje jedynie osobno:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Podczas wyświetlania trzeba polegać na tych samych indeksach, aby dopasować je jeden do jednego:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Problem z takim sposobem zapisu polega na tym, że koszt utrzymania jest bardzo wysoki.

Ponieważ dane jednego filmu są rozdzielone do wielu tablic, wystarczy, że jedna tablica będzie miała o jeden element za dużo, o jeden za mało albo w innej kolejności, a wynik wyświetlania będzie błędny.

Szczególnie przy dodawaniu lub usuwaniu filmów trzeba jednocześnie modyfikować kilka tablic, przez co bardzo łatwo coś przeoczyć.

Jak więc połączyć takie informacje jak „nazwa filmu, reżyser, ocena” w jedną całość?

Do tego potrzebujemy `struct`.

## Definiowanie struktury `struct`

W Swift `struct` oznacza „strukturę”.

Możesz ją rozumieć jako „niestandardowy typ danych”, który może łączyć kilka powiązanych pól w jedną całość.

Podstawowe użycie:

```swift
struct StructName {
	let name: String
}
```

W tym kodzie `struct` to słowo kluczowe oznaczające, że definiujemy strukturę. `StructName` to nazwa struktury.

Zawartość w nawiasach klamrowych to pola, które ta struktura zawiera, a każde pole musi mieć wyraźnie zapisane nazwę i typ.

Zazwyczaj nazwa `struct` zaczyna się wielką literą, na przykład `Movie`, `Student`, `UserInfo`. To powszechna konwencja nazewnicza w Swift.

Możesz prosto rozumieć `struct` jako puste pudełko opakowaniowe, w którym każde pole jest jak zarezerwowane puste miejsce w środku.

Kiedy te miejsca nie są jeszcze wypełnione, jest to tylko puste pudełko. Dopiero po wypełnieniu wszystkich pól odpowiednimi wartościami staje się ono kompletnym pudełkiem prezentowym.

### Instancja `struct`

Wcześniej zdefiniowaliśmy tylko samą strukturę, co odpowiada przygotowaniu wzoru pudełka.

Nadal musimy wypełnić je konkretną treścią, aby otrzymać prawdziwą „instancję”, której można używać.

Przy tworzeniu instancji zwykle dodaje się `()` po nazwie struktury:

```swift
StructName(...)
```

To, co wpisujemy w nawiasach, to zawartość pól wymagana przez tę strukturę.

Na przykład:

```swift
StructName(name: "Fang Junyu")
```

Ten kod oznacza: utwórz nową instancję zgodnie z formatem struktury `StructName` i przypisz polu `name` wartość `"Fang Junyu"`.

Kiedy wypełnimy wszystkie wymagane pola, odpowiada to zapełnieniu pudełka.

Wtedy otrzymujemy kompletną instancję struktury.

### Dostęp do właściwości `struct`

Po utworzeniu instancji możemy używać „składni kropkowej”, aby uzyskać dostęp do jej właściwości.

Podstawowy zapis:

```swift
instance.propertyName
```

Na przykład:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Tutaj `st` jest instancją struktury, a `st.name` oznacza odczytanie wartości `name` z tej instancji.

Możesz rozumieć ten sposób odczytu tak: gdy piszemy `st.name`, to tak, jakbyśmy odczytywali zawartość umieszczoną w określonym miejscu w pudełku.

Taki sposób zapisu będzie bardzo częsty w późniejszych interfejsach SwiftUI.

Na przykład, jeśli mamy strukturę studenta zawierającą imię, wiek i klasę, to podczas wyświetlania w interfejsie możemy osobno odczytywać:

```swift
student.name
student.age
student.className
```

Zaletą takiego rozwiązania jest to, że dane stają się bardziej przejrzyste i łatwiejsze w zarządzaniu.

### Miejsce dla `struct`

Dla początkujących zwykle można zapisać strukturę poza `ContentView`.

Na przykład:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Dzięki temu struktura będzie bardziej przejrzysta i łatwiejsza do czytania.

Zauważysz, że samo `ContentView` w rzeczywistości też jest `struct`.

### Struktura `Movie`

Mając powyższe podstawy, możemy zdefiniować strukturę filmu:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Jest to struktura o nazwie `Movie`, składająca się z trzech pól: `name`, `director` i `rating`, które oznaczają odpowiednio nazwę filmu, reżysera i ocenę.

Dzięki temu informacje związane z jednym filmem nie muszą już być rozbijane na kilka tablic, lecz mogą zostać bezpośrednio połączone w jedną całość.

Na przykład możemy utworzyć taką instancję filmu:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Ta instancja reprezentuje „jeden kompletny zestaw danych filmu”.

### Przechowywanie struktur w tablicy

Wcześniej mówiliśmy, że tablica może przechowywać tylko jeden typ.

Teraz mamy już strukturę `Movie`, więc tablica może przechowywać wiele `Movie`.

```swift
let lists: [Movie] = []
```

Na przykład:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

W tej tablicy `lists` przechowywane są nie stringi, lecz wiele instancji `Movie`.

To znaczy, że każdy element tablicy jest kompletnym filmem.

Dzięki temu, gdy chcemy wyświetlić listę filmów, możemy użyć `ForEach`, aby odczytywać każdy film jeden po drugim.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Tutaj `movie in` oznacza, że w każdej iteracji z tablicy pobierany jest jeden film i tymczasowo nazywany `movie`.

Następnie możemy używać:

```swift
movie.name
movie.director
movie.rating
```

aby osobno odczytać nazwę, reżysera i ocenę tego filmu oraz wyświetlić je w interfejsie.

## Błąd `ForEach`

Do tego miejsca ukończyliśmy podstawowy zapis tablicy filmów i `ForEach`.

Jednak jeśli bezpośrednio uruchomimy poniższy kod:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

pojawi się błąd:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Ten błąd oznacza, że gdy piszesz `id: \.self`, SwiftUI musi potraktować każdy element tablicy jako „unikalny identyfikator”, aby je rozróżniać.

Taki sposób zapisu nadaje się do prostych typów, takich jak `String` i `Int`, ponieważ same w sobie są stosunkowo łatwe do rozróżnienia.

Jednak `Movie` jest niestandardową strukturą zdefiniowaną przez nas, a `ForEach` nie wie, jak potraktować ją samą jako unikalny identyfikator, dlatego pojawia się błąd.

Najczęstszym sposobem rozwiązania tego problemu jest sprawienie, aby `Movie` stosowało się do protokołu `Identifiable`.

## Protokół

W Swift protokół można rozumieć jako rodzaj „zasady” lub „wymagania”.

Można to porównać do porozumienia w organizacji międzynarodowej: jeśli jakieś państwo chce dołączyć do organizacji międzynarodowej, zwykle musi najpierw spełnić pewne zasady wyznaczone przez tę organizację, ujawnić pewne dane i przestrzegać wspólnych reguł. Dopiero po spełnieniu tych warunków może do niej dołączyć albo uczestniczyć w określonych sprawach.

Protokół działa na podobnej zasadzie.

Kiedy jakiś typ chce stosować się do określonego protokołu, musi spełnić treści wymagane przez ten protokół. Dopiero po spełnieniu tych wymagań może korzystać z odpowiadającej mu funkcjonalności.

Podstawowy zapis:

```swift
struct Movie: Identifiable {
    // ...
}
```

Tutaj `: Identifiable` oznacza, że `Movie` stosuje się do protokołu `Identifiable`.

Jeśli jakiś typ stosuje się do wielu protokołów, można je oddzielić przecinkami:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Dla `Identifiable` najważniejsze wymaganie jest takie: typ musi mieć `id`, które może go identyfikować.

Na przykład:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Tutaj `id` jest jak numer dokumentu tożsamości, używany do rozróżnienia każdego filmu.

Dopóki `id` każdego filmu jest inne, SwiftUI może poprawnie rozróżnić każdy element tablicy.

Na przykład:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

A następnie użyj w `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Wtedy błąd już się nie pojawi.

Ponieważ `Movie` już stosuje się do `Identifiable`, jeszcze częstszym zapisem jest bezpośrednie pominięcie `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Ponieważ SwiftUI już wie, że do rozróżniania każdej pozycji ma używać `movie.id`.

## Identyfikator rozróżniający w `ForEach`

Poniżej głębiej zrozumiemy rolę `id` w `ForEach`.

Na przykład:

```swift
ForEach(lists, id: \.self)
```

Tutaj oznacza to: użyj samego elementu jako identyfikatora rozróżniającego.

A:

```swift
ForEach(lists, id: \.id)
```

oznacza: użyj pola `id` elementu jako identyfikatora rozróżniającego.

Jeśli jakieś pole samo w sobie może zagwarantować unikalność, można go też tymczasowo użyć.

Na przykład, jeśli nazwa każdego filmu jest inna, poniższy zapis może również działać poprawnie przy obecnych danych:

```swift
ForEach(lists, id: \.name)
```

Ale jest tu ukryty problem: `name` nie zawsze musi być unikalne.

Załóżmy, że później dodasz jeszcze jeden film o tej samej nazwie, wtedy `name` nie będzie już w stanie dokładnie rozróżnić każdego elementu.

W takiej sytuacji kod może nadal się kompilować, ale podczas odświeżania widoku, aktualizacji, wstawiania i usuwania SwiftUI może rozpoznać elementy błędnie, powodując nieprawidłowe wyświetlanie.

Dlatego gdy potrzebujemy stabilnie rozróżniać dane, najlepiej używać naprawdę unikalnego pola, czyli `id`.

## UUID

Choć ręczne wpisywanie `id: 1`, `id: 2` może rozwiązać problem, nadal istnieje ryzyko: można przypadkowo wpisać powtarzające się `id`, a unikalna identyfikacja przestanie działać.

Na przykład:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

W ten sposób pojawią się dwa takie same `id`, a unikalna identyfikacja straci ważność.

Aby uniknąć ręcznych błędów, zwykle używamy `UUID()`.

W Swift `UUID()` losowo generuje 128-bitowy identyfikator. Zwykle jest wyświetlany jako długi ciąg liter i cyfr.

Na przykład:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Tutaj `UUID()` tak naprawdę tworzy instancję typu `UUID`, możesz więc rozumieć ją jako automatycznie generowany „unikalny numer”.

Dlatego wartości tworzone za każdym razem prawie nigdy się nie powtarzają, więc świetnie nadają się do użycia jako `id`.

Możemy zmodyfikować `Movie` do postaci:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Ten kod oznacza, że pole `id` w strukturze `Movie` domyślnie otrzyma wartość nowej instancji `UUID`.

Innymi słowy, za każdym razem gdy tworzymy nowy `Movie`, system najpierw automatycznie wygeneruje dla nas unikalne `id`.

`id` ma już wartość domyślną, więc później przy tworzeniu instancji `Movie` nie trzeba już ręcznie wpisywać `id`.

Na przykład:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Chociaż tutaj `id` nie jest zapisane, w rzeczywistości ta instancja filmu nadal posiada własne `id`; po prostu ta wartość została już automatycznie wygenerowana przez `UUID()`.

Po użyciu tej metody nie trzeba już ręcznie wpisywać `id` dla każdego filmu, co nie tylko zmniejsza ilość kodu, ale też pozwala uniknąć błędów wynikających z powtarzających się id.

Na końcu wystarczy dodać u góry obraz `Banner` i użyć `ScrollView`, aby zawartość można było przewijać, i wtedy cały widok listy filmów będzie gotowy.

## Podsumowanie

W tej lekcji nauczyliśmy się bardzo ważnego zagadnienia: `struct`.

Dzięki `struct` możemy połączyć wiele powiązanych pól jednego filmu w jedną całość, zamiast rozdzielać nazwę, reżysera i ocenę do wielu osobnych tablic.

Po połączeniu danych możemy użyć `ForEach`, aby wyświetlać każdy film z tablicy jeden po drugim w widoku.

Jednocześnie zrozumieliśmy też rolę „identyfikatora rozróżniającego” w `ForEach`. SwiftUI musi wiedzieć, jak rozróżniać każdy element w tablicy, aby móc poprawnie wyświetlać i aktualizować widok.

Dlatego sprawiliśmy, że `Movie` stosuje się do protokołu `Identifiable`, i nadaliśmy mu unikalne `id`.

Aby uniknąć błędów przy ręcznym wpisywaniu `id`, nauczyliśmy się dalej `UUID()`, które pozwala systemowi automatycznie generować unikalny identyfikator.

Po ukończeniu tej lekcji nie tylko ukończyłeś listę filmów, ale też zacząłeś poznawać ważny sposób myślenia w SwiftUI: **najpierw uporządkuj dane, a następnie generuj widok na podstawie tych danych.**

## Kompletny kod

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
