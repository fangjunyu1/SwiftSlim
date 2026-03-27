# Zaczynamy od ContentView

## Przygotowanie przed lekcją

W tej lekcji zaczniemy od pliku ContentView.swift i w uporządkowany sposób poznamy podstawową strukturę SwiftUI, w tym:

* komentarze
* strukturę View
* układy VStack / HStack / ZStack
* ikony SF Symbols
* modyfikatory widoku (modifier)
* kod podglądu #Preview

Najpierw znajdź wcześniej utworzony projekt Xcode i kliknij dwukrotnie plik .xcodeproj.

W lewym obszarze nawigacji Navigator wybierz plik ContentView.swift.

Uwaga: przy każdym otwarciu projektu Canvas może pokazywać komunikat „Preview paused”. Kliknij przycisk odświeżania, aby przywrócić podgląd.

![Swift](../../RESOURCE/002_view7.png)

## Poznanie ContentView

Kod ContentView:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Chociaż kodu jest niewiele, zawiera on podstawową strukturę SwiftUI.

### 1. Komentarze

Na górze pliku:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

To komentarz pliku, używany do zapisywania informacji o pliku, takich jak nazwa pliku, nazwa projektu, autor i data utworzenia.

W Swift do komentarza jednolinijkowego używa się //:

```swift
// To jest komentarz
```

Komentarze zwiększają czytelność kodu i pomagają programistom zrozumieć jego logikę.

W rzeczywistym programowaniu kod bywa trudny do zrozumienia. Jeśli nie piszesz komentarzy, możesz po trzech dniach nie rozumieć już własnego kodu.

Dlatego aktywne dodawanie komentarzy podczas pisania kodu jest dobrym nawykiem programistycznym. Dzięki komentarzom można zapisywać logikę kodu, co ułatwia jego późniejsze utrzymanie.

**Tymczasowe wyłączanie kodu**

Komentarze mogą też tymczasowo wyłączać kod i pomagać w szukaniu problemów.

Na przykład:

```
A
B
C
```

A, B i C to trzy fragmenty kodu, z których jeden zawiera błąd. Możemy tymczasowo komentować kod, aby znaleźć problem.

Najpierw dodajemy komentarz do A:

```
// A
B
C
```

Jeśli po zakomentowaniu A kod działa poprawnie, oznacza to, że problem znajduje się w kodzie A.

Jeśli po zakomentowaniu A problem nadal występuje, możemy zakomentować B i tak dalej, aż znajdziemy wadliwy fragment.

W trakcie programowania pojawia się wiele problemów i bardzo często trzeba używać komentarzy do ich diagnozowania. To pomaga zlokalizować problematyczny kod i znaleźć BUG.

W Xcode można użyć skrótu klawiaturowego:

```
Command ⌘ + /
```

aby szybko dodać albo usunąć komentarz.

### 2. Import frameworka SwiftUI

```swift
import SwiftUI
```

Ten kod oznacza zaimportowanie frameworka SwiftUI.

Typy takie jak View, Text, Image czy VStack pochodzą właśnie z tego frameworka.

Jeśli nie zaimportujesz SwiftUI, Xcode zgłosi błąd:

```
Cannot find type 'View' in scope
```

Oznacza to, że kompilator nie rozpoznaje typu View.

### 3. Struktura View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Przy pierwszym kontakcie ta struktura View może wydawać się obca, ponieważ zawiera słowa kluczowe struct, View, var, body i some.

Nie uczyliśmy się jeszcze tych słów kluczowych. Na razie wystarczy wiedzieć, że ten fragment kodu tworzy widok o nazwie ContentView.

Możesz wyobrazić sobie View jako tablicę do rysowania, na której możemy tworzyć elementy, a narzędziem do tego jest SwiftUI.

Na przykład:

![Swift](../../RESOURCE/002_view.png)

Na powyższym obrazku widać trzy ekrany, które w rzeczywistości są trzema różnymi View.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Kiedy tworzymy aplikację przy użyciu SwiftUI, każda strona jest jednym View.

### 4. Kod SwiftUI

Wewnątrz widoku View znajduje się kod SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ten fragment kodu SwiftUI oznacza pionowy układ zawierający ikonę i tekst.

![Swift](../../RESOURCE/002_view1.png)

#### Układ VStack

```swift
VStack { }  // układ pionowy
```

VStack oznacza kontener układu pionowego. Widoki wewnątrz są ustawiane od góry do dołu.

![Swift](../../RESOURCE/002_view8.png)

Trzy najczęściej używane układy w SwiftUI to:

* VStack —— układ pionowy
* HStack —— układ poziomy
* ZStack —— układ nakładający elementy (oś Z)

```swift
HStack { }  // układ poziomy
ZStack { }  // układ nakładający
```

Schemat ułożenia poszczególnych układów:

![Swift](../../RESOURCE/002_view2.png)

Na przykład użycie HStack do ułożenia poziomego:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Widać, że ikona globusa i tekst są ustawione poziomo.

![Swift](../../RESOURCE/002_view3.png)

Gdy chcemy ułożyć elementy poziomo, używamy HStack. Gdy chcemy układać je warstwowo, używamy ZStack.

#### Image i SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Ten fragment kodu wyświetla ikonę globusa. Ikona pochodzi z systemu ikon Apple SF Symbols.

![Swift](../../RESOURCE/002_view9.png)

Kod oznacza wyświetlenie ikony globusa w dużym rozmiarze i z kolorem akcentu.

Oprócz globusa możemy wyświetlać także inne ikony.

Na przykład plecak:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Jak wyświetlić inne ikony?**

Trzeba użyć oficjalnej biblioteki ikon systemowych Apple, czyli SF Symbols.

Wejdź na oficjalną stronę Apple Developer i pobierz [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Otwórz aplikację SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Po lewej stronie znajdują się kategorie symboli, a po prawej odpowiadające im ikony.

Kliknij ikonę prawym przyciskiem i wybierz „Copy Name”, aby skopiować jej nazwę będącą odpowiednim ciągiem znaków.

Na przykład:

```
"globe"
"backpack"
"heart"
```

Wstaw skopiowaną nazwę ikony do Image(systemName:), a wtedy możesz wyświetlić różne ikony.

Uwaga: każda ikona SF Symbols ma minimalną wersję systemu, od której jest obsługiwana. Jeśli wersja systemu jest zbyt niska, ikona może się nie wyświetlić. Informacje o zgodności można sprawdzić w aplikacji SF Symbols.

#### Modyfikatory

W SwiftUI modyfikator (modifier) to metoda służąca do zmiany wyglądu albo zachowania widoku.

Można wyobrazić sobie modyfikatory jak ubrania — inne ubranie daje inny wygląd.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale i foregroundStyle to modyfikatory widoku Image. Zmieniają jego wygląd bez zmiany samej zawartości Image.

**1. imageScale**

```swift
.imageScale(.large)
```

Pozwala kontrolować rozmiar ikon SF Symbols:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

Możemy zmieniać różne opcje, aby symbole SF Symbols wyświetlały się w różnych rozmiarach.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle pozwala kontrolować kolor pierwszego planu.

.tint oznacza aktualny kolor akcentu środowiska (accent color). Domyślnie na iOS jest to kolor niebieski.

Jeśli chcemy zmienić kolor pierwszego planu na czerwony:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Widok Text

Text to widok tekstowy używany do wyświetlania ciągów znaków.

```swift
Text("Hello, world!")
```

Na przykład, aby wyświetlić moje imię:

```swift
Text("FangJunyu")
```

Uwaga: ciąg znaków musi być ujęty w podwójne cudzysłowy "".

Możesz spróbować wyświetlić swoje imię, numer telefonu albo inne treści.

#### padding — odstęp wewnętrzny

W SwiftUI padding służy do dodania pustej przestrzeni między zawartością widoku a jego granicą. Jest to „wewnętrzny margines” (padding / content inset).

```swift
HStack {
    ...
}
.padding()
```

Powyższy kod oznacza dodanie domyślnego systemowego odstępu do widoku HStack.

**Czym jest padding?**

padding oznacza „obszar pustej przestrzeni między zawartością widoku a jego granicą”.

Na poniższym rysunku po ustawieniu padding dla niebieskiego HStack niebieski obszar kurczy się do środka i wizualnie wygląda na „trochę mniejszy”.

![Swift](../../RESOURCE/002_view6.png)

**Domyślny odstęp**

Modyfikator padding() domyślnie używa standardowego odstępu zalecanego przez system.

```swift
.padding()
```

Na różnych platformach i w różnych kontekstach ta wartość może się różnić, na przykład:

* na iOS zwykle wynosi około 16 pt
* na macOS lub watchOS standardowy odstęp może być inny, większy albo mniejszy, zależnie od zasad projektowych danej platformy

**Własny odstęp**

Można też ustawić osobny odstęp dla wybranego kierunku.

1. Ustawienie jednego kierunku

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Opis kierunków:

* .top: górny odstęp
* .bottom: dolny odstęp
* .leading: odstęp od strony początkowej
* .trailing: odstęp od strony końcowej

![Swift](../../RESOURCE/002_view12.png)

Uwaga: leading i trailing automatycznie dostosowują się do kierunku języka. Na przykład w środowisku arabskim (RTL) zostaną automatycznie odwrócone.

2. Ustawienie wielu kierunków

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Można użyć tablicy, aby jednocześnie wskazać wiele kierunków. Szczegółowe użycie tablic zostanie omówione później, tutaj wystarczy znać ten zapis.

3. Ustawienie kierunku poziomego albo pionowego

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

To jest równoważne z:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Usunięcie odstępu**

Jeśli nie chcesz żadnego odstępu, możesz użyć .padding(0), aby go usunąć:

```swift
.padding(0)
```

albo po prostu usunąć modyfikator padding:

```swift
// .padding()
```

### 6. Kod podglądu Preview

```swift
#Preview {
    ContentView()
}
```

Ten kod oznacza wygenerowanie podglądu widoku ContentView w Canvas.

Uwaga: #Preview to nowa składnia wprowadzona w Swift 5.9 / Xcode 15. Wcześniej używano struktury PreviewProvider.

**Co się stanie po zakomentowaniu Preview?**

Jeśli zakomentujemy Preview:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas nie będzie już wyświetlał renderowanej zawartości.

![Swift](../../RESOURCE/002_xcode.png)

To właśnie #Preview steruje wyświetlaniem podglądu widoku w Canvas.

Gdy chcemy podglądać widok SwiftUI w Xcode, dodajemy kod #Preview. Jeśli podgląd nie jest potrzebny, można kod #Preview zakomentować albo usunąć.

## Podsumowanie

Chociaż plik ContentView.swift nie zawiera dużo kodu, w rzeczywistości obejmuje wiele podstawowych pojęć SwiftUI. Dla początkujących ten fragment może wydawać się obcy, ale dzięki rozłożeniu kodu na części można zbudować pierwsze zrozumienie SwiftUI.

Przypomnijmy, czego nauczyliśmy się w tej lekcji. Najpierw poznaliśmy komentarze //, których można używać do opisywania logiki kodu albo tymczasowego wyłączania fragmentów kodu.

Następnie dowiedzieliśmy się, że plik SwiftUI musi importować framework SwiftUI:

```swift
import SwiftUI
```

Jeśli framework nie zostanie zaimportowany, kompilator nie będzie w stanie rozpoznać typów takich jak View.

Potem poznaliśmy podstawową strukturę widoku SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Tutaj ContentView jest nazwą widoku.

Poznaliśmy także trzy często używane kontenery układu: VStack (układ pionowy), HStack (układ poziomy) oraz ZStack (układ warstwowy).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ten fragment kodu oznacza wyświetlenie kontenera z układem pionowym, a wewnątrz niego ikony i tekstu.

Image może wyświetlać ikony SF Symbols, a za pomocą modyfikatorów można kontrolować rozmiar i kolor ikony.

Widok Text może wyświetlać treść tekstową.

padding to odstęp, który dodaje przezroczystą przestrzeń wokół widoku.

Na końcu mamy widok podglądu #Preview, który pozwala wyświetlić podgląd w Canvas.

### Ćwiczenia po lekcji

Dla początkujących treść tej lekcji może być dość złożona. Możemy poprzez dodatkowe ćwiczenia pogłębić zrozumienie poznanych zagadnień:

* zmień nazwę ikony SF Symbols
* zmień kolor pierwszego planu ikony na czarny
* zamień VStack na HStack
* zakomentuj Image albo Text i obserwuj zmiany w widoku podglądu

### Ciekawostka: uzupełnianie kodu (Code Completion)

Podczas wpisywania kodu mogłeś już zauważyć, że Xcode automatycznie pokazuje listę dostępnych opcji.

Na przykład, gdy zmieniamy modyfikator imageScale:

```swift
.imageScale(.)
```

Xcode pokaże dostępne opcje:

![Swift](../../RESOURCE/002_view10.png)

To jest mechanizm uzupełniania kodu (Code Completion). Działa on na podstawie wnioskowania typów i podpowiedzi członków wyliczenia, dzięki czemu zwiększa wydajność pisania kodu i zmniejsza liczbę błędów.

W kolejnych lekcjach oficjalnie przedstawimy wyliczenia (enum), a na razie potraktuj to jako krótkie wprowadzenie.
