# Aplikacja Fill Light

W tej lekcji zbudujemy bardzo ciekawą aplikację fill light. Kiedy zapada noc, możemy wyświetlać na ekranie telefonu różne kolory i używać go jako prostego światła do doświetlania.

Ta aplikacja fill light potrafi zmieniać kolory po stuknięciu ekranu, a także regulować jasność za pomocą suwaka.

W tym przykładzie nauczymy się używać `brightness` do regulacji jasności widoku, `onTapGesture` do dodawania gestu stuknięcia do widoku oraz kontrolki `Slider`.

Rezultat:

![Color](../../Resource/018_color.png)

## Wyświetlanie koloru

Najpierw sprawmy, aby widok wyświetlał jeden kolor.

W SwiftUI `Color` nie tylko reprezentuje kolor, ale może też być wyświetlany jako widok:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Tutaj `Color.red` reprezentuje czerwony widok. `.ignoresSafeArea()` sprawia, że widok koloru wypełnia cały ekran, dzięki czemu wygląda bardziej jak prawdziwy efekt fill light.

Rezultat:

![Color](../../Resource/018_color1.png)

### Tablica kolorów i indeks

W tej chwili wyświetlany jest tylko jeden kolor. Ale fill light zazwyczaj nie ma tylko jednego koloru. Może również wyświetlać niebieski, żółty, fioletowy, biały i inne kolory.

Chcemy przełączać się między różnymi kolorami po stuknięciu ekranu. Możemy umieścić te kolory w tablicy, aby zarządzać nimi wspólnie:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Tablica nadaje się do przechowywania „grupy danych tego samego typu”. Tutaj każdy element tablicy jest typu `Color`.

Jeśli chcemy wyświetlić konkretny kolor, możemy użyć indeksu:

```swift
colors[0]
```

To oznacza odczytanie koloru z indeksu `0` w tablicy, czyli pierwszego koloru.

Teraz kod można napisać tak:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

W ten sposób ekran pokazuje pierwszy kolor z tablicy, czyli czerwony.

### Używanie indeksu do sterowania kolorem

Jeśli chcemy przełączać się między różnymi kolorami, potrzebujemy zmiennej do zarządzania indeksem zamiast wpisywać indeks na stałe.

Możemy użyć `@State`, aby zadeklarować zmienną przechowującą indeks:

```swift
@State private var index = 0
```

Tutaj `index` reprezentuje indeks aktualnego koloru.

Gdy `index` się zmienia, SwiftUI ponownie oblicza interfejs i aktualizuje wyświetlaną zawartość.

Następnie zmieniamy wcześniejsze `colors[0]` na:

```swift
colors[index]
```

W ten sposób kolor wyświetlany w widoku jest określany przez `index`.

Teraz kod staje się taki:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Kiedy `index` się zmienia, `colors[index]` również wyświetla inny kolor.

Na przykład:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Warto pamiętać, że `index` nie może przekroczyć największego indeksu tablicy, bo w przeciwnym razie wystąpi błąd wyjścia poza zakres.

## Gest stuknięcia

Teraz możemy wyświetlać różne kolory na podstawie `index`, ale nadal nie możemy ich zmieniać stuknięciem.

W poprzedniej lekcji „Karuzela cytatów” używaliśmy `Button`, aby sterować zmianą cytatów.

Tym razem jednak chcemy „stuknąć cały obszar koloru”, aby zmienić kolor, dlatego `onTapGesture` jest bardziej odpowiedni.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Kiedy stukniemy widok koloru, wykona się ten kod:

```swift
index += 1
```

To oznacza zwiększenie `index` o `1`. Gdy indeks wzrośnie, `colors[index]` pokaże następny kolor w tablicy.

### `onTapGesture`

`onTapGesture` to modyfikator gestu, który dodaje akcję stuknięcia do widoku.

Podstawowe użycie:

```swift
.onTapGesture {
    // code
}
```

Na przykład:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Gdy ten czerwony widok zostanie stuknięty, kod wewnątrz nawiasów klamrowych zostanie wykonany, a w konsoli pojawi się:

```swift
Click color
```

Dzięki `onTapGesture` możemy określić, co ma się wydarzyć po stuknięciu widoku.

### Różnica względem `Button`

Wcześniej poznaliśmy widok `Button`. Zarówno `Button`, jak i `onTapGesture` mogą obsługiwać stuknięcia, ale ich zastosowania nie są dokładnie takie same.

`onTapGesture` lepiej nadaje się do „dodawania funkcji stuknięcia do istniejącego widoku”, takiego jak `Color`, `Image`, `Text` lub inny zwykły widok.

`Button` lepiej nadaje się wtedy, gdy chcemy przedstawić wyraźny przycisk, na przykład „Potwierdź”, „Wyślij” lub „Usuń”.

W tej aplikacji fill light chcemy, aby funkcja zmiany koloru była prostsza. Stuknięcie całego obszaru koloru zmienia kolor, więc `onTapGesture` jest tutaj dobrym wyborem.

## Problem z indeksem

Teraz możemy stukać ekran, aby przełączać się między różnymi kolorami.

Ale jest tutaj ważny problem: **indeks może wyjść poza zakres tablicy**.

Na przykład:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Jeśli będziemy dalej stukać ekran, `index` ostatecznie stanie się `4`, a wtedy wystąpi błąd „index out of range”.

Dzieje się tak dlatego, że tablica `colors` ma `4` elementy, ale indeksowanie zaczyna się od `0`, więc prawidłowy zakres indeksów to `0 - 3`, a nie `4`.

Jeśli odwołamy się do `colors[4]`, wystąpi błąd „index out of range”.

W obecnym kodzie każde stuknięcie automatycznie zwiększa `index` o `1`. Jeśli tego nie obsłużymy, w końcu na pewno wyjdzie poza dozwolony zakres.

Dlatego przy stukaniu ekranu musimy sprawdzić indeks: jeśli to już ostatni kolor, wracamy do pierwszego; w przeciwnym razie nadal dodajemy `1`.

Możemy to zrobić za pomocą instrukcji `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

W tym kodzie `colors.count` oznacza liczbę elementów w tablicy.

W obecnej tablicy są 4 kolory, więc:

```swift
colors.count // 4
```

Ale największy indeks to nie `4`, tylko `3`, ponieważ indeksowanie zaczyna się od `0`.

Dlatego ostatni indeks trzeba zapisać tak:

```swift
colors.count - 1
```

Czyli:

```swift
4 - 1 = 3
```

Ta logika oznacza: jeśli bieżący indeks już odpowiada ostatniemu kolorowi, ustaw indeks z powrotem na `0`; w przeciwnym razie zwiększ go o `1`.

W ten sposób kolory mogą zmieniać się w pętli.

### Uproszczenie logiki indeksu

Jeśli chcemy, aby kod był krótszy, możemy użyć także operatora trójargumentowego:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Ten kod oznacza: jeśli `index == colors.count - 1` jest prawdziwe, zwróć `0`. W przeciwnym razie zwróć `index + 1`.

Na końcu przypisujemy wynik z powrotem do `index`.

Teraz możemy uzyskać efekt zmiany kolorów.

Pełny kod:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Teraz możemy stukać ekran i przełączać się między różnymi kolorami. Podstawowa aplikacja fill light jest gotowa.

## Wyświetlanie nazwy koloru

Możemy dodać kolejną grupę tekstów odpowiadających kolorom, tak aby kiedy kolor się zmieni, na ekranie pojawiała się także nazwa aktualnego koloru.

Na przykład:

- Czerwony pokazuje `Red`
- Niebieski pokazuje `Blue`
- Żółty pokazuje `Yellow`
- Fioletowy pokazuje `Purple`

Tutaj również możemy użyć tablicy do przechowywania nazw kolorów:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Kolejność tekstów w tej tablicy musi dokładnie odpowiadać kolejności kolorów w tablicy kolorów.

Następnie możemy użyć `Text`, aby wyświetlić nazwę koloru dla bieżącego indeksu:

```swift
Text(colorsName[index])
```

`Text` wyświetla nazwę aktualnego koloru zgodnie z `index`.

Użyjmy modyfikatorów, aby poprawić wygląd `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

To sprawia, że `Text` jest wyświetlany na biało, rozmiarem tytułu i pogrubioną czcionką.

Teraz mamy pełnoekranowy widok `Color`. Jeśli chcemy, aby `Text` pojawił się na widoku `Color`, musimy użyć kontenera układu `ZStack`, aby je na siebie nałożyć.

```swift
ZStack {
    Color
    Text
}
```

Wtedy kod staje się taki:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

W ten sposób tłem jest widok koloru, a nad nim nakładany jest widok tekstu.

Rezultat:

![Color](../../Resource/018_color2.png)

Warto zauważyć, że w `ZStack` widoki zapisane później zwykle pojawiają się z przodu. Jeśli `Text` zostanie zapisany przed `Color`, później zapisany widok `Color` może zakryć `Text`.

## Sterowanie jasnością

Teraz możemy zmieniać różne kolory, ale fill light ma jeszcze jedną ważną funkcję: **regulację jasności**.

W SwiftUI możemy użyć modyfikatora `brightness`, aby regulować jasność widoku.

Na przykład:

```swift
.brightness(1)
```

Możemy napisać:

```swift
colors[index]
    .brightness(0.5)
```

To sprawia, że aktualny kolor staje się jaśniejszy i bardziej przypomina efekt fill light.

Zakres jasności to `0 - 1`. `0` oznacza zachowanie oryginalnego koloru, a im bliżej wartość jest `1`, tym jaśniejszy staje się kolor. `1` oznacza najjaśniejszy biały rezultat.

Chociaż możemy sterować `brightness` w kodzie, użytkownik nadal nie może regulować tego bezpośrednio samodzielnie.

Dlatego musimy dodać kontrolkę, którą można przeciągać: `Slider`.

## Widok `Slider`

W SwiftUI `Slider` to kontrolka używana do wybierania wartości z określonego zakresu. Apple opisuje ją jako „kontrolkę do wybierania wartości z ograniczonego zakresu liniowego”.

Podstawowe użycie:

```swift
Slider(value: $value, in: 0...1)
```

Wyjaśnienie parametrów:

1. `value: $value`: `Slider` musi być powiązany ze zmienną.

    Gdy suwak jest przesuwany, wartość zmiennej zmienia się w tym samym czasie. I odwrotnie, jeśli zmienna się zmieni, suwak również zostanie zaktualizowany.

    To jest bardzo podobne do `TextField`, którego uczyliśmy się wcześniej. Oba „wiążą kontrolkę ze zmienną”.

    Powiązana zmienna potrzebuje symbolu `$` przed sobą, aby oznaczyć binding.

2. `in: 0...1`: ten parametr reprezentuje zakres wartości suwaka.

    Tutaj `0...1` oznacza, że minimalna wartość to `0`, a maksymalna wartość to `1`.

    Gdy suwak zostanie przesunięty całkowicie w lewo, powiązana zmienna będzie bliska `0`; gdy zostanie przesunięty całkowicie w prawo, będzie bliska `1`.

Na przykład:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` jest powiązany ze zmienną `value`. Gdy suwak jest przesuwany, wartość zmiennej `value` również zmienia się w tym samym czasie.

Wygląd:

![Slider](../../Resource/018_slider.png)

Gdy `Slider` zostanie przesunięty w lewo, powiązana wartość `value` stanie się `0`. Gdy zostanie przesunięty w prawo, stanie się `1`.

### Zakres wartości

Zakres wartości `Slider` nie jest stały. Można go też zapisać tak:

```swift
0...100
```

albo jako inny zakres.

Ale w tej aplikacji fill light musimy sterować jasnością, więc `0...1` jest najodpowiedniejszym wyborem.

## Używanie `Slider` do sterowania jasnością

Teraz musimy połączyć `Slider` z `brightness`.

Najpierw utwórzmy zmienną do przechowywania wartości jasności:

```swift
@State private var slider = 0.0
```

Tutaj `0.0` to wartość typu `Double`.

Ponieważ `Slider` jest zwykle powiązany z typem liczbowym, a tutaj chcemy, aby zmieniał się płynnie, `Double` jest bardziej odpowiedni. Dodatkowo `brightness` może przyjmować tylko wartość typu `Double`.

Następnie przekażmy tę wartość do `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Gdy `slider == 0`, kolor pozostaje w stanie domyślnym. Im bliżej `slider` jest do `1`, tym jaśniej wygląda kolor.

### Dodawanie kontrolki `Slider`

Następnie dodajmy kontrolkę `Slider`, aby zmieniać tę zmienną:

```swift
Slider(value: $slider, in: 0...1)
```

Gdy suwak się zmienia, zmienia się też wartość `slider`, a `brightness(slider)` aktualizuje jasność w tym samym czasie.

To bardzo typowy przykład tego, że „zmienne sterują widokiem” w SwiftUI.

### Dostosowanie wyglądu `Slider`

Domyślnie `Slider` używa dostępnej szerokości.

Możemy nadać mu stałą szerokość:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Następnie dodajmy jeszcze kilka modyfikatorów, aby był lepiej widoczny:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

To daje suwakowi białe tło i zaokrąglone rogi, dzięki czemu wyraźniej wyróżnia się na widoku `Color`.

Na końcu umieśćmy go na dole ekranu.

Ponieważ już używamy `ZStack`, możemy wstawić do niego `VStack` i użyć `Spacer()`, aby przesunąć `Slider` na dół.

## Pełny kod

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Rezultat:

![Color](../../Resource/018_color.png)

## Podsumowanie

Wykorzystując wiedzę, której nauczyliśmy się wcześniej, razem z podstawowymi pojęciami, takimi jak kolory i tablice, stworzyliśmy bardzo ciekawą aplikację fill light.

Dzięki tej aplikacji fill light nauczyliśmy się używać `brightness` do regulacji jasności, `onTapGesture` do dodawania akcji stuknięcia do widoków oraz kontrolki `Slider`.

Dodaliśmy `onTapGesture` do widoku `Color`, aby zmieniać kolory. Użyliśmy także kontrolki `Slider`, aby zmieniać zmienną zarządzającą `brightness`, co jest kolejnym przykładem tego, że „zmienne sterują widokiem”.

Powtórzyliśmy również operator trójargumentowy, użyliśmy `ZStack` do nakładania widoków na siebie, oraz wykorzystaliśmy tablice do zarządzania grupą danych tego samego typu. To pomaga pogłębić nasze zrozumienie tablic i indeksów, w tym praktycznego problemu unikania błędów indeksu poza zakresem.

Chociaż ten przykład nie jest skomplikowany, łączy wiele podstawowych idei, których nauczyliśmy się wcześniej. Gdy są użyte razem w małym, rzeczywistym projekcie, łatwiej zrozumieć, do czego służy każda z tych koncepcji.

### Prawdziwy scenariusz użycia

Wyobraź sobie, że kładziesz starego iPhone’a na biurku i używasz stworzonej przez siebie aplikacji fill light do sterowania kolorem światła. To byłoby bardzo przyjemne doświadczenie.

W App Store jest wiele aplikacji „fill light”, i one również nie wyglądają na bardzo skomplikowane.

![AppStore](../../Resource/018_appStore.PNG)

Możemy zacząć od tworzenia prostych aplikacji i próbować publikować je w App Store. To nie tylko zwiększa nasze zainteresowanie programowaniem, ale także zapisuje nasz rozwój.

### Ćwiczenie po lekcji

Możesz dalej zastanawiać się nad sposobami rozwinięcia tej aplikacji fill light, na przykład:

- Dodanie większej liczby kolorów
- Pokazanie bieżącej wartości jasności
- Ulepszenie wyglądu dolnego obszaru suwaka

Kiedy naprawdę zaczniesz używać tej wiedzy, odkryjesz, że każda koncepcja, której się uczymy, jest w rzeczywistości narzędziem do tworzenia aplikacji.

Im więcej narzędzi opanujemy, tym więcej funkcji będziemy mogli stworzyć.
