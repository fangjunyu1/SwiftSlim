# Swift i SwiftUI

Podczas nauki tworzenia aplikacji na platformy Apple wiele kursów ma tendencję do omawiania Swift i SwiftUI osobno. Łatwo wtedy o poczucie rozdzielenia i błędne wrażenie, że są to dwie całkowicie niezależne technologie.

W rzeczywistości Swift i SwiftUI tworzą silnie zintegrowaną całość: Swift jest językiem programowania i odpowiada za logikę oraz dane, natomiast SwiftUI jest frameworkiem interfejsu użytkownika zbudowanym na Swift, odpowiedzialnym za renderowanie widoków i interakcję.

Ta lekcja pomoże Ci zbudować jasny model myślenia: czym jest Swift, czym jest SwiftUI i jak współpracują ze sobą w kodzie.

## Czym jest Swift?

Swift to nowoczesny język programowania stworzony przez Apple. Służy do tworzenia aplikacji na platformy takie jak iOS, macOS, watchOS i tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift jest językiem silnie typowanym i statycznym. W projekcie większy nacisk położono na bezpieczeństwo, dzięki czemu ograniczono wiele typowych błędów programistycznych, takich jak puste wskaźniki czy wyjście poza zakres. Swift wspiera też płynną integrację z C i Objective-C.

W praktycznym programowaniu Swift częściej odpowiada za część logiczną aplikacji, na przykład przetwarzanie danych, żądania sieciowe czy operacje zapisu.

## Czym jest SwiftUI?

SwiftUI to nowy framework do budowy interfejsu użytkownika, wydany przez Apple w 2019 roku. SwiftUI wykorzystuje deklaratywny model programowania, który pozwala programistom opisywać strukturę interfejsu i zachowanie interakcji przy użyciu prostszego kodu.

![swiftui](../../RESOURCE/010_swiftui.png)

Programowanie deklaratywne oznacza, że programista mówi systemowi tylko, co ma zostać wyświetlone, a system automatycznie odświeża widok wraz ze zmianą danych. Nie trzeba już ręcznie aktualizować stanu interfejsu, co znacznie upraszcza złożoność tworzenia UI.

Rdzeniem SwiftUI są komponenty widoków, takie jak Text, Image i Button, oraz kontenery układu, takie jak VStack, HStack i ZStack. Komponenty te współpracują poprzez wiązanie danych i zarządzanie stanem, dzięki czemu interfejs może reagować na zmiany danych i automatycznie się odświeżać.

## Jak współpracują Swift i SwiftUI?

Zakres odpowiedzialności Swift i SwiftUI można podsumować następująco:

**1. Swift: obsługa logiki i danych**

Swift służy głównie do zarządzania danymi, przechowywania stanu i wykonywania logiki. Taki kod zwykle nie wpływa bezpośrednio na renderowanie interfejsu, lecz odpowiada za obsługę danych i zachowań.

Na przykład przetwarzanie danych w Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Taki kod obejmuje deklaracje zmiennych, definicje stałych, funkcje, przepływ sterowania i podobne elementy. Nie wpływa bezpośrednio na wyświetlanie widoku.

**2. SwiftUI: deklarowanie i renderowanie interfejsu**

SwiftUI służy do budowy układu i treści interfejsu użytkownika. Odpowiada głównie za renderowanie widoku i interakcję z interfejsem.

Na przykład utworzenie prostego widoku tekstowego w SwiftUI:

```swift
Text("SwiftSlim")
```

Taki kod służy do budowania i kontrolowania elementów interfejsu, więc bezpośrednio dotyczy warstwy UI.

### Podstawowy przykład

Poniżej znajduje się prosty przykład SwiftUI:

```swift
// ContentView.swift

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

W tym przykładzie:

**Kod SwiftUI**: VStack, Image, Text i padding należą do SwiftUI i odpowiadają za wyświetlanie oraz układ interfejsu.

**Kod Swift**: komentarze // na górze pliku i import SwiftUI należą do struktury kodu Swift; #Preview na dole jest makrem używanym do podglądu w Xcode i nie bierze udziału w rzeczywistym renderowaniu interfejsu.

### Bardziej zaawansowany przykład

W rzeczywistych projektach Swift i SwiftUI są często używane razem, aby wykonywać zadania, w których każde z nich jest najlepsze:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

W tym przykładzie:

**Kod SwiftUI**: @State jest specjalnym property wrapperem SwiftUI używanym do deklarowania zmiennego stanu widoku; Button i Text są komponentami widoku SwiftUI i odpowiadają za wyświetlanie interfejsu oraz interakcję użytkownika.

**Kod Swift**: private var name i func printName() to kod Swift używany do przechowywania danych i wykonywania logiki. Nie wpływa bezpośrednio na renderowanie widoku.

Gdy użytkownik kliknie przycisk, SwiftUI uruchomi kod działania zapisany wewnątrz przycisku:

```swift
Button("Print") {
    printName()
}
```

Tutaj Button jest komponentem SwiftUI, natomiast wykonywana funkcja printName() jest kodem Swift odpowiedzialnym za konkretną logikę.

Taka współpraca pozwala Swift i SwiftUI działać bezproblemowo razem: Swift odpowiada za dane i logikę, a SwiftUI za prezentację interfejsu użytkownika.

## Gdzie zwykle zapisuje się kod Swift i SwiftUI?

W SwiftUI interfejs jest budowany przez widoki zwracane z właściwości body. Dlatego cały kod opisujący interfejs zwykle zapisuje się właśnie w body.

Na przykład:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

W tym przykładzie Text jest komponentem widoku SwiftUI, więc musi znajdować się w body, ponieważ SwiftUI odczytuje body, aby zbudować interfejs.

Kod niezwiązany bezpośrednio z interfejsem, taki jak zmienne, funkcje czy logika przetwarzania danych, zwykle zapisuje się poza body. Na przykład:

```swift
struct ContentView: View {

    // Swift: dane lub logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interfejs
    var body: some View {
        Text(name)
    }
}
```

Trzeba zauważyć, że w body nadal można używać składni Swift, takiej jak if czy for. Służy ona jednak jedynie do sterowania generowaniem widoków SwiftUI:

```swift
if isLogin {
    Text("Welcome")
}
```

Dlatego w programowaniu SwiftUI można w uproszczeniu przyjąć, że kod widoków, taki jak Text, Image i Button, zwykle zapisuje się w body, a kod danych i logiki, taki jak zmienne i funkcje, zwykle zapisuje się poza body.

## Pliki Swift

Wraz z dalszą nauką zetkniemy się także z architekturą MVVM, gdzie warstwy ViewModel i Model zwykle składają się z czystego kodu Swift i są całkowicie oddzielone od warstwy widoku, czyli SwiftUI.

Na przykład klasa używana do zarządzania stanem aplikacji:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Albo struktura opisująca model danych:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Rolą takich plików jest zarządzanie danymi i ich trwałe przechowywanie. Nie są one bezpośrednio wyświetlane w widoku, więc należą w całości do Swift.

## Tło historyczne

Aby zrozumieć relację między Swift a SwiftUI, warto też znać ewolucję technologii deweloperskich Apple. Do 2026 roku ten stos technologiczny przeszedł kilka dużych iteracji.

### Historia Swift

Zanim pojawił się Swift, głównym językiem programowania na platformach Apple był Objective-C, który wspierał mieszanie z językiem C. Jego składnia była bardziej rozwlekła i miała wyższy próg wejścia dla początkujących:

```Obj-c
// Zapis w Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

W 2014 roku Apple zaprezentowało język Swift podczas WWDC. Swift miał nowocześniejszą składnię i wyższe bezpieczeństwo typów, a następnie stopniowo zastąpił Objective-C jako główny język programowania:

```swift
// Zapis w Swift
let name = "Fang"
print("Hello, \(name)")
```

Objective-C nie zniknął jednak ze sceny. Nadal jest szeroko używany w wielu istniejących projektach i frameworkach niższego poziomu. Znajomość jego podstawowej składni nadal ma wartość przy utrzymywaniu starszych projektów i zrozumieniu działania systemu od środka.

### Historia SwiftUI

Zanim pojawiło się SwiftUI, iOS używał **UIKit**, a macOS używał **AppKit**. Oba frameworki opierały się na „imperatywnym” modelu programowania. Programista musiał przeciągać kontrolki w Storyboardzie albo ręcznie pisać kod, aby sterować stanem widoku. Powodowało to dużą ilość kodu i wysoki koszt utrzymania, szczególnie przy złożonej logice interfejsu.

![storyboard](../../RESOURCE/010_xcode.png)

W 2019 roku Apple oficjalnie zaprezentowało SwiftUI podczas WWDC. SwiftUI wprowadziło „deklaratywny” paradygmat programowania i znacząco uprościło proces tworzenia interfejsu.

![storyboard](../../RESOURCE/010_xcode1.png)

Warto zauważyć, że SwiftUI nie jest całkowicie niezależną implementacją od podstaw. Na każdej platformie w istocie współpracuje z UIKit na iOS albo z AppKit na macOS poprzez warstwę pośrednią. Na poziomie niższym nadal opiera się na tych dwóch frameworkach.

### Relacja Swift do UIKit i AppKit

Chociaż Swift jest uniwersalnym językiem programowania, który może działać na różnych platformach Apple, nie jest w stanie całkowicie zastąpić UIKit ani AppKit. W przypadku niektórych bardziej złożonych wymagań interfejsu albo funkcji, których SwiftUI jeszcze nie obejmuje, nadal trzeba korzystać z UIKit albo AppKit.

Na przykład UIKit jest bardzo dojrzały w obszarach takich jak zarządzanie złożonymi kontrolerami widoku, animacje czy rozpoznawanie gestów i został sprawdzony w ogromnej liczbie rzeczywistych projektów produkcyjnych. SwiftUI stale rozwija swoje możliwości, ale w niektórych skrajnych scenariuszach nadal ma ograniczenia.

Dlatego wielu programistów łączy w jednym projekcie SwiftUI z UIKit albo AppKit, aby w pełni wykorzystać zalety obu rozwiązań.

Patrząc z tej perspektywy, można traktować SwiftUI jako wyższego poziomu opakowanie nad UIKit i AppKit. Ucząc się SwiftUI, warto równocześnie poznać podstawowe pojęcia UIKit i AppKit. Pomaga to podejmować rozsądniejsze decyzje techniczne przy utrzymywaniu starszych projektów albo implementowaniu bardziej złożonych funkcji.

## Podsumowanie

**Swift**: służy głównie do pisania logiki, przetwarzania danych, sterowania przepływem programu i innych elementów niezwiązanych z układem widoku.

**SwiftUI**: służy do deklaratywnego budowania interfejsu użytkownika. Kod opisujący zawartość widoku i układ należy do SwiftUI.

W praktycznym programowaniu Swift i SwiftUI zwykle używa się razem: Swift obsługuje logikę, a SwiftUI obsługuje interfejs.

Od Objective-C i UIKit do Swift i SwiftUI środowisko programistyczne Apple stopniowo przesuwało się w stronę bardziej nowoczesnego i prostszego stylu programowania, ale UIKit i AppKit w wielu starszych projektach nadal pozostają istotne.

Dzięki zrozumieniu relacji między Swift i SwiftUI możemy wydajniej tworzyć aplikacje na iOS i macOS, a także podejmować rozsądniejsze decyzje techniczne przy utrzymywaniu starszych projektów.
