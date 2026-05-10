# Dostosowanie wyglądu

W tej lekcji nauczymy się dostosowywania wyglądu do trybu jasnego i trybu ciemnego.

Na iPhonie, iPadzie i Macu użytkownik może wybrać tryb jasny albo tryb ciemny.

Gdy system przełącza się na tryb ciemny, tła, teksty i kolory ikon w wielu Appach również zmieniają się razem z nim.

Na przykład w dzień interfejs może mieć jasne tło, a w nocy może zmienić się na ciemne tło.

![view](../../../Resource/025_view9.png)

Taka możliwość automatycznego dostosowywania wyglądu interfejsu do wyglądu systemu nazywa się dostosowaniem wyglądu.

## Podgląd dostosowania wyglądu w Xcode

Zanim zaczniemy uczyć się dostosowania wyglądu, najpierw zobaczmy, jak w Xcode podglądać tryb jasny i tryb ciemny.

Na dole obszaru `Canvas` kliknij przycisk `Device Settings`, aby otworzyć okno `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

W tym oknie można zobaczyć ustawienie `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

W nim:

- `Light Appearance` oznacza tryb jasny.
- `Dark Appearance` oznacza tryb ciemny.

Możemy tutaj przełączać podgląd wyglądu i sprawdzać, jak bieżący interfejs wygląda w trybie jasnym oraz w trybie ciemnym.

## Równoległe wyświetlanie dwóch wyglądów

Jeśli chcemy jednocześnie zobaczyć tryb jasny i tryb ciemny, możemy użyć funkcji `Variants`.

Na dole obszaru `Canvas` kliknij przycisk `Variants` i wybierz `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Po wybraniu tej opcji `Canvas` pokaże jednocześnie podgląd trybu jasnego i trybu ciemnego.

![canvas3](../../../Resource/025_view3.png)

Dzięki temu łatwiej porównać różnice w interfejsie w obu wyglądach.

Mówiąc prościej:

Jeśli chcemy tylko tymczasowo przełączać tryb jasny/ciemny, możemy użyć `Canvas Device Settings`.

Jeśli chcemy jednocześnie zobaczyć oba wyglądy, możemy użyć `Color Scheme Variants`.

## Widoki domyślnie dostosowują wygląd

W SwiftUI wiele widoków systemowych domyślnie automatycznie dostosowuje się do trybu jasnego i trybu ciemnego.

Na przykład:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Jasny")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("jakiś tekst")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Efekt wyświetlania:

![canvas](../../../Resource/025_view4.png)

Widać, że w trybie jasnym ikona i tytuł zwykle są wyświetlane w ciemnym kolorze.

W trybie ciemnym ikona i tytuł automatycznie zmieniają się na jasny kolor.

Dzieje się tak, ponieważ widoki SwiftUI takie jak `Text` i `Image` domyślnie dostosowują kolory do wyglądu systemu.

Innymi słowy, jeśli nie ustawimy ręcznie stałego koloru, SwiftUI pomoże nam obsłużyć część dostosowania wyglądu.

## Stałe kolory nie zamieniają się automatycznie

Trzeba pamiętać, że jeśli ręcznie ustawimy stały kolor, nie będzie on automatycznie zamieniany między trybem jasnym i ciemnym.

Na przykład:

```swift
Text("jakiś tekst")
	.foregroundStyle(Color.gray)
```

Ten tekst ma ustawiony `Color.gray`, więc zawsze będzie wyświetlany na szaro.

Inny przykład:

```swift
Text("Tytuł")
    .foregroundStyle(Color.white)
```

Ten kod będzie wyświetlał biały tekst zarówno w trybie jasnym, jak i w trybie ciemnym.

Jeśli tło również jest jasne, biały tekst może być trudny do odczytania.

Dlatego podczas dostosowywania wyglądu należy unikać przypadkowego wpisywania na stałe kolorów takich jak `Color.white` i `Color.black`.

W wielu przypadkach lepiej najpierw użyć systemowych stylów semantycznych, na przykład:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Wśród nich:

- `.primary` zwykle służy do głównej treści.
- `.secondary` zwykle służy do treści drugorzędnej.

One automatycznie dostosowują efekt wyświetlania do trybu jasnego i ciemnego.

## Wyświetlanie różnych treści zależnie od wyglądu

Czasami chcemy, aby zmieniały się nie tylko kolory, lecz także treść wyświetlana w różnych wyglądach.

Na przykład:

- W trybie jasnym pokazujemy zwykłą ikonę żarówki.
- W trybie ciemnym pokazujemy świecącą ikonę żarówki.
- W trybie jasnym tytuł wyświetla `Jasny`.
- W trybie ciemnym tytuł wyświetla `Ciemny`.

Wtedy trzeba sprawdzić, czy bieżący system jest w trybie jasnym, czy w trybie ciemnym.

W SwiftUI bieżący tryb wyglądu można uzyskać przez wartość środowiskową `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Pełny kod:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Jasny" : "Ciemny"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("jakiś tekst")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/025_view5.png)

Z podglądu widać, że ten sam widok w różnych trybach wyglądu nie wyświetla dokładnie tej samej treści.

W trybie jasnym `Image` pokazuje zwykłą ikonę żarówki, a tytuł wyświetla `Jasny`.

W trybie ciemnym `Image` pokazuje świecącą ikonę żarówki, a tytuł wyświetla `Ciemny`.

Innymi słowy, tutaj zmienia się nie tylko kolor, ale także sama nazwa ikony i tekst tytułu.

Dzieje się tak, ponieważ nie wpisaliśmy ikony i tytułu bezpośrednio na stałe w `body`, lecz obliczamy różne treści na podstawie `colorScheme`.

W tym fragmencie kodu użyliśmy dwóch właściwości obliczanych:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Jasny" : "Ciemny"
}
```

Gdy `colorScheme` ma wartość `.light`, oznacza to, że bieżący tryb to tryb jasny.

Gdy `colorScheme` ma wartość `.dark`, oznacza to, że bieżący tryb to tryb ciemny.

Dlatego możemy zwracać różne nazwy ikon i teksty tytułów zależnie od trybu wyglądu.

To także częste zastosowanie właściwości obliczanych: obliczanie treści, którą widok ma wyświetlić, na podstawie bieżącego stanu.

## Zrozumienie @Environment

To nasz pierwszy kontakt z `@Environment`.

`@Environment` można rozumieć jako: odczytanie wartości ze środowiska SwiftUI.

Podczas działania Appa system dostarcza wiele informacji środowiskowych, na przykład:

- bieżący język
- bieżący tryb wyglądu
- bieżący kierunek układu
- bieżące ustawienie rozmiaru czcionki

Gdy potrzebujemy uzyskać bieżący tryb wyglądu, możemy odczytać `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Tutaj

```swift
\.colorScheme
```

oznacza odczytanie wartości `colorScheme` ze środowiska.

```swift
private var colorScheme
```

oznacza zapisanie odczytanej wartości do zmiennej `colorScheme`.

Nazwę zmiennej można wybrać samodzielnie, na przykład można też napisać:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Dopóki wcześniejsze `\.colorScheme` się nie zmienia, oznacza to odczytywanie bieżącego trybu wyglądu.

## Dwie częste wartości colorScheme

`colorScheme` ma zwykle dwie wartości:

```swift
.light
.dark
```

Oznaczają one:

- `.light`: tryb jasny
- `.dark`: tryb ciemny

Na przykład:

```swift
private var titleName: String {
    colorScheme == .light ? "Jasny" : "Ciemny"
}
```

Znaczenie tego kodu jest następujące:

Jeśli obecnie jest tryb jasny, warunek `colorScheme == .light` jest spełniony, więc zwracane jest `"Jasny"`.

W przeciwnym razie zwracane jest `"Ciemny"`.

Dlatego w trybie jasnym:

```swift
Text(titleName)
```

wyświetlane jest:

```swift
Jasny
```

W trybie ciemnym wyświetlane jest:

```swift
Ciemny
```

W ten sposób możemy wyświetlać różne treści zależnie od wyglądu.

## Przykład dostosowania kolorów

Oprócz tekstu i ikon czasami musimy samodzielnie obsłużyć dostosowanie kolorów.

Na przykład:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Tekst")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/025_view6.png)

W tym kodzie tekst jest biały, a tło jest czarne.

W trybie jasnym czarne tło jest dość wyraźne.

Jednak w trybie ciemnym, jeśli całe tło interfejsu również jest czarne, to czarne tło zleje się z tłem systemowym i będzie wyglądać mniej wyraźnie.

Wtedy możemy przełączać kolor tekstu i kolor tła zależnie od trybu wyglądu:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Tekst")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/025_view7.png)

Teraz w trybie jasnym tło jest czarne, a tekst biały.

W trybie ciemnym tło jest białe, a tekst czarny.

Dzięki temu niezależnie od wyglądu tekst i tło mają wyraźny kontrast, a użytkownik może jasno zobaczyć treść.

## Używanie Assets do dostosowania kolorów

Oprócz ręcznego sprawdzania za pomocą `colorScheme` możemy też używać kolorów zasobów `Assets`, aby dostosować się do trybu jasnego i ciemnego.

Ta metoda lepiej nadaje się do zarządzania wspólnymi kolorami w Appie.

W projekcie Xcode znajdź folder zasobów `Assets`.

![assets](../../../Resource/025_color.png)

Otwórz folder `Assets`, kliknij prawym przyciskiem myszy puste miejsce i wybierz `New Color Set`, aby utworzyć nowy zasób koloru.

![assets](../../../Resource/025_color1.png)

Tutaj tworzymy kolor i nadajemy mu nazwę `redText`.

![assets](../../../Resource/025_color2.png)

Zasób koloru może mieć osobno ustawione kolory dla trybu jasnego i trybu ciemnego.

![assets](../../../Resource/025_color3.png)

Po wybraniu odpowiedniego obszaru koloru można zmienić kolor w inspektorze atrybutów po prawej stronie.

Kliknij przycisk `Hide or show the Inspectors` w prawym górnym rogu, aby otworzyć obszar inspektorów.

Następnie wybierz `Show the Attributes inspector`, na dole znajdź `Show Color Panel` i otwórz panel kolorów.

![assets](../../../Resource/025_color4.png)

Po kliknięciu koloru w panelu kolorów odpowiedni obszar koloru `redText` zmieni się równocześnie.

Tutaj ustawiamy `redText` następująco:

- w trybie jasnym wyświetla kolor czerwony
- w trybie ciemnym wyświetla kolor zielony

![assets](../../../Resource/025_color5.png)

Po powrocie do kodu SwiftUI możemy użyć tego koloru tak:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

W tym miejscu:

```swift
Color("redText")
```

oznacza odczytanie z `Assets` zasobu koloru o nazwie `redText`.

Efekt wyświetlania:

![assets](../../../Resource/025_view8.png)

Widać, że ten sam `Color("redText")` wyświetla różne kolory w trybie jasnym i w trybie ciemnym.

To pokazuje, że same kolory `Assets` również obsługują dostosowanie wyglądu.

## Różnica między colorScheme i Assets

Zarówno `colorScheme`, jak i `Assets` mogą służyć do dostosowania wyglądu, ale nadają się do różnych sytuacji.

Jeśli chodzi tylko o przełączanie treści tekstu, nazwy obrazu albo nazwy `SF Symbols` zależnie od trybu jasnego/ciemnego, można użyć `colorScheme`.

Na przykład:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Jeśli są to kolory często używane w Appie, takie jak kolor motywu, kolor tła karty lub kolor tekstu, bardziej zaleca się użycie kolorów `Assets`.

Ponieważ kolory `Assets` można ponownie wykorzystywać w wielu widokach, a późniejsze modyfikacje są wygodniejsze.

Na przykład:

```swift
Color("redText")
```

Wtedy wystarczy zmienić kolor w `Assets`, a wszystkie miejsca używające tego koloru zmienią się razem.

## Podsumowanie

W tej lekcji nauczyliśmy się dostosowywania wyglądu do trybu jasnego i trybu ciemnego.

Najpierw nauczyliśmy się, jak w `Canvas` w Xcode podglądać różne wyglądy, oraz jak używać `Color Scheme Variants`, aby jednocześnie oglądać tryb jasny i tryb ciemny.

Następnie dowiedzieliśmy się, że widoki SwiftUI takie jak `Text` i `Image` domyślnie automatycznie dostosowują kolory do wyglądu systemu.

Jeśli jednak ręcznie ustawimy stały kolor, na przykład `Color.white` lub `Color.black`, takie kolory nie będą automatycznie zamieniane.

Potem nauczyliśmy się `@Environment` i `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Dzięki `colorScheme` możemy sprawdzić, czy bieżący tryb to tryb jasny, czy tryb ciemny, i wyświetlać różne ikony, teksty lub kolory zależnie od wyglądu.

Na końcu nauczyliśmy się kolorów `Assets`.

Kolory `Assets` mogą mieć osobno ustawione kolory dla trybu jasnego i ciemnego, dlatego nadają się do zarządzania wspólnymi zasobami kolorów w Appie.

Dostosowanie wyglądu może sprawić, że App będzie wyglądać lepiej zarówno w dzień, jak i w nocy, a także pomoże uniknąć problemów takich jak nieczytelny tekst lub niewyraźne tło.

W praktycznym programowaniu zaleca się najpierw korzystać z domyślnych możliwości dostosowania SwiftUI oraz kolorów `Assets`.

Gdy w różnych wyglądach trzeba przełączać tekst, ikony, obrazy albo obsłużyć niewielką liczbę specjalnych efektów wyświetlania, wtedy użyj `colorScheme` do sprawdzenia trybu.

## Wiedza dodatkowa: określanie rozmiaru czcionki

Podczas wcześniejszej nauki `font` używaliśmy kilku systemowych stylów czcionek:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Oprócz używania systemowych stylów czcionki takich jak `.largeTitle` i `.callout`, można też ręcznie określić rozmiar czcionki.

Na przykład:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Tutaj:

```swift
.font(.system(size: 100))
```

oznacza ustawienie rozmiaru czcionki na `100 pt`.

W przypadku ikon `SF Symbols` `font` również wpływa na rozmiar ikony.

Dlatego jeśli chcemy, aby ikona była większa, możemy określić rozmiar za pomocą `.font(.system(size:))`.

Na przykład:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Trzeba pamiętać, że ręczne określanie rozmiaru czcionki jest bardziej elastyczne, ale w zwykłym tekście nie zaleca się częstego używania stałych rozmiarów.

W przypadku zwykłego tekstu lepiej najpierw używać systemowych stylów czcionki, takich jak `.title`, `.headline`, `.body` i `.caption`.

Dzięki temu można lepiej dostosować się do różnych urządzeń i ustawień rozmiaru czcionki użytkownika.
