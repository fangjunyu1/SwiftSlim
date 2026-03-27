# Poznanie Xcode

## Czym jest Xcode

Xcode to oficjalne zintegrowane środowisko programistyczne Apple (IDE, Integrated Development Environment), używane do tworzenia aplikacji na platformy Apple, takie jak iOS, macOS, watchOS i tvOS.

![Swift](../../RESOURCE/001_xcode.png)

W całym procesie nauczania będziemy używać Xcode do pisania kodu i uruchamiania programów.

W tej lekcji nauczymy się, jak pobrać Xcode, utworzyć pierwszą aplikację na iOS oraz wstępnie poznać strukturę interfejsu Xcode.

## Pobieranie Xcode

Obecnie Xcode można zainstalować na dwa sposoby:

1. Pobierając przez [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Pobierając przez [oficjalną stronę Apple Developer](https://developer.apple.com/xcode/)

Oba sposoby pozwalają pobrać Xcode. Różnica polega na tym, że na oficjalnej stronie Apple Developer oprócz wersji stabilnej można pobrać również [wersję Beta](https://developer.apple.com/download/all/?q=Xcode) albo starsze wersje.

Jeśli uczysz się programowania, zaleca się korzystanie z wersji stabilnej. Wersja Beta służy głównie do testowania nowych funkcji i może być niestabilna.

## Tworzenie pierwszego projektu

Po otwarciu Xcode zobaczysz ekran startowy.

![Swift](../../RESOURCE/001_xcode1.png)

Po lewej stronie znajdują się trzy często używane opcje:

* Create New Project —— utworzenie nowego projektu
* Clone Git Repository —— sklonowanie repozytorium Git
* Open Existing Project —— otwarcie istniejącego projektu

Po prawej stronie wyświetlane są ostatnio otwierane projekty Xcode.

Wybieramy opcję „Create New Project”.

### Wybór szablonu projektu

![Swift](../../RESOURCE/001_xcode2.png)

Przechodzimy do ekranu wyboru szablonu projektu. Widać tu wiele platform (iOS, macOS itd.) oraz różne typy szablonów projektów.

Opis najczęściej spotykanych szablonów:

* App —— najbardziej podstawowy typ aplikacji (zalecany)
* Document App —— aplikacja oparta na modelu dokumentów
* Game —— do tworzenia gier
* Framework —— moduł wielokrotnego użytku

Na etapie początkującym wybieramy tylko szablon „iOS” - „App”, ponieważ jest to typ aplikacji z interfejsem.

Klikamy „Next”.

### Wypełnianie informacji o projekcie

Przechodzimy do ekranu wypełniania informacji o projekcie. Musimy uzupełnić pola zgodnie z ich przeznaczeniem.

![Swift](../../RESOURCE/001_xcode3.png)

Znaczenie poszczególnych pól:

* Product Name —— nazwa projektu, na przykład: SwiftSlimTest
* Team —— zespół deweloperski; jeśli nie masz płatnego konta Apple Developer, możesz nic nie wybierać
* Organization Identifier —— identyfikator organizacji, zwykle w formacie odwróconej nazwy domeny, na przykład:

  * com.yourname
  * com.yourcompany
  * jeśli nie masz domeny, możesz użyć swojego angielskiego imienia i nazwiska jako identyfikatora
* Bundle Identifier —— unikalny identyfikator aplikacji, generowany automatycznie na podstawie Organization Identifier i Product Name
* Interface —— technologia interfejsu, wybierz SwiftUI
* Language —— język programowania, wybierz Swift
* Testing System —— domyślnie zostanie utworzony cel testowy (Unit Tests); na etapie początkującym można to pominąć
* Storage —— framework do lokalnej trwałej pamięci danych; może automatycznie integrować SwiftData albo Core Data; na etapie początkującym można to pominąć

Po uzupełnieniu klikamy „Next”.

### Zapisywanie projektu

![Swift](../../RESOURCE/001_xcode4.png)

Wybierz odpowiedni folder do zapisania projektu.

Kliknij przycisk „Create”, a Xcode automatycznie wygeneruje strukturę projektu.

## Struktura projektu Xcode

Po zapisaniu projektu Xcode w Finderze można zobaczyć wygenerowany folder projektu.

![Swift](../../RESOURCE/001_xcode5.png)

* Assets.xcassets —— folder do przechowywania obrazów, ikon aplikacji i innych zasobów

* ContentView.swift —— domyślnie wygenerowany plik widoku SwiftUI; w kolejnych lekcjach będziemy tutaj pisać kod interfejsu

* SwiftSlimTestApp.swift —— plik wejściowy aplikacji (App Entry Point), odpowiedzialny za uruchamianie aplikacji; na razie nie musimy go rozumieć

* SwiftSlimTest.xcodeproj —— plik projektu Xcode; dwukrotne kliknięcie tego pliku otwiera projekt

## Poznanie interfejsu Xcode

Kliknij dwukrotnie plik .xcodeproj, aby otworzyć projekt, a następnie w lewym obszarze Navigator wybierz plik ContentView.swift.

Interfejs Xcode składa się głównie z pięciu obszarów:

* Navigator —— obszar nawigacji, używany do przeglądania struktury plików i wyszukiwania
* Editor —— obszar edycji, używany do pisania kodu Swift lub SwiftUI
* Canvas —— obszar podglądu, używany do podglądu SwiftUI
* Inspector —— obszar inspektora właściwości, używany do przeglądania i modyfikowania właściwości plików
* Debug Area —— obszar debugowania, do przeglądania logów wyjściowych

![Swift](../../RESOURCE/001_xcode6.png)

Uwaga: Canvas służy głównie do podglądu widoków SwiftUI. Z punktu widzenia oficjalnej architektury Xcode jest to pomocniczy panel podglądu dla Editora (Preview Pane). Canvas można włączyć tylko wtedy, gdy otwarty jest plik widoku SwiftUI; inne typy plików nie pokazują funkcji podglądu.

W kolejnych lekcjach będziemy głównie pisać kod Swift i SwiftUI w obszarze Editor.

Przy pierwszym otwarciu projektu Xcode obszary Inspector i Debug Area mogą być domyślnie ukryte. Można je wyświetlić, klikając przyciski w prawym górnym i prawym dolnym rogu.

![Swift](../../RESOURCE/001_xcode7.png)

Wskazówka: obszar Inspector służy głównie do przeglądania i zmiany właściwości plików. W praktyce podczas programowania często ukrywa się ten obszar, aby uzyskać więcej miejsca do edycji.

## Podsumowanie

W tej lekcji nauczyliśmy się, jak pobrać Xcode, utworzyć pierwszy projekt Xcode oraz poznaliśmy podstawowy układ interfejsu Xcode.

Poniżej czas na samodzielne ćwiczenia:

* Możesz spróbować tworzyć i usuwać pliki w obszarze Navigator.
* Obejrzeć kod w obszarze Editor i zaobserwować jego strukturę.
* Sprawdzić przyciski w obszarze Canvas i spróbować powiększyć lub pomniejszyć widok podglądu.

W następnej lekcji zaczniemy pisać prosty kod, który pomoże nam jeszcze lepiej poznać Xcode.
