# Zarządzanie plikami Xcode

W tej lekcji nauczymy się typowych operacji na plikach w Xcode.

W poprzednich lekcjach większość kodu pisaliśmy w `ContentView`. Dzięki temu łatwiej obserwować kod i efekt wyświetlania.

Na przykład:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Jednak w prawdziwej aplikacji zwykle nie umieszcza się całego kodu w jednym pliku.

Gdy stron, komponentów i funkcji jest coraz więcej, musimy rozdzielać różne widoki do różnych plików SwiftUI.

Na przykład:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Dzięki temu struktura kodu jest czytelniejsza, a późniejsza konserwacja i modyfikacja stają się łatwiejsze.

## Dlaczego trzeba zarządzać plikami

W SwiftUI stronę lub komponent można zwykle zapisać jako osobny plik widoku.

Na przykład:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Tutaj `CardView` jest widokiem SwiftUI.

Jeśli wszystkie widoki zostaną zapisane w `ContentView`, kod będzie stawał się coraz dłuższy i coraz trudniejszy do czytania.

Dlatego musimy nauczyć się tworzyć, zmieniać nazwy i usuwać pliki, a także używać folderów do zarządzania różnymi plikami kodu.

## Tworzenie pliku SwiftUI

W Xcode istnieją dwie częste metody tworzenia pliku SwiftUI:

Jedna polega na utworzeniu pustego pliku, a następnie samodzielnym napisaniu kodu.

Druga polega na utworzeniu pliku szablonu SwiftUI, dzięki czemu Xcode automatycznie wygeneruje podstawowy kod.

Dla początkujących bardziej zalecane jest używanie pliku szablonu SwiftUI, ponieważ automatycznie generuje on podstawową strukturę.

### Tworzenie pustego pliku

W obszarze Navigator po lewej stronie Xcode kliknij prawym przyciskiem myszy puste miejsce lub folder, a następnie wybierz `New Empty File`.

Miejsce wykonania operacji pokazano poniżej:

![xcode](../../../Resource/027_view1.png)

Po utworzeniu pustego pliku Xcode zwykle wygeneruje nienazwany plik Swift, na przykład `Untitled.swift`.

Możemy zmienić jego nazwę na `TestView.swift`.

W projekcie SwiftUI, jeśli ten plik służy do wyświetlania widoku, zwykle zaleca się dodanie `View` na końcu nazwy.

Na przykład:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Nie jest to obowiązkowa reguła, ale pomaga od razu rozpoznać, że jest to plik widoku.

Po utworzeniu pustego pliku może on zawierać tylko domyślne komentarze albo może być pusty. Zależy to od wersji Xcode i sposobu utworzenia.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

W tym momencie musimy ręcznie napisać kod SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

W ten sposób zostaje utworzony prosty plik widoku SwiftUI.

### Zmiana nazwy pliku

Jeśli po utworzeniu pliku chcesz zmienić jego nazwę, możesz wybrać plik w obszarze Navigator po lewej stronie Xcode, a następnie nacisnąć klawisz Return `⏎`.

![xcode](../../../Resource/027_view2.png)

Wtedy możesz zmodyfikować nazwę pliku.

Trzeba pamiętać, że zmiana nazwy pliku nie zmienia automatycznie nazwy widoku w kodzie.

Na przykład po zmianie nazwy pliku na `ProfileView.swift` kod nadal może zawierać `struct TestView: View`.

Chociaż nie musi to powodować błędu, łatwo może wywołać zamieszanie.

Dlatego zaleca się utrzymywanie zgodności nazwy pliku i nazwy widoku. Na przykład, jeśli nazwa pliku to `ProfileView.swift`, nazwa widoku również powinna używać `ProfileView`.

## Tworzenie pliku szablonu SwiftUI

Oprócz tworzenia pustego pliku możemy też bezpośrednio utworzyć plik szablonu SwiftUI.

W obszarze Navigator po lewej stronie Xcode kliknij prawym przyciskiem myszy puste miejsce lub folder, a następnie wybierz `New File from Template...`.

Miejsce wykonania operacji pokazano poniżej:

![xcode](../../../Resource/027_view3.png)

W wyskakującym oknie u góry można wybrać różne platformy, takie jak `iOS`, `macOS` i inne.

Tutaj pozostaw platformę zgodną z bieżącym projektem. Na przykład, jeśli tworzymy aplikację iOS, wybierz `iOS`.

![xcode](../../../Resource/027_view4.png)

Następnie na dole wybierz `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Następnie kliknij `Next`, wprowadź nazwę pliku i zapisz go.

Na przykład utworzymy plik `Test2View.swift`.

Xcode automatycznie wygeneruje kod podobny do poniższego:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

W porównaniu z pustym plikiem plik szablonu automatycznie zawiera `import SwiftUI`, `struct`, `body` oraz `#Preview`.

Dlatego dla początkujących używanie pliku szablonu SwiftUI jest prostsze i zmniejsza ryzyko pominięcia wymaganego kodu.

**Wskazówka**: Oprócz tworzenia pliku przez kliknięcie prawym przyciskiem myszy możesz też kliknąć przycisk plusa na dole obszaru Navigator po lewej stronie Xcode, aby utworzyć plik lub folder.

![xcode](../../../Resource/027_view5.png)

## Tworzenie folderu

Gdy plików jest coraz więcej, możemy używać folderów do zarządzania nimi.

W obszarze Navigator po lewej stronie Xcode kliknij prawym przyciskiem myszy puste miejsce lub folder, a następnie wybierz `New Folder`.

Po utworzeniu folderu możesz przeciągnąć do niego powiązane pliki.

![xcode](../../../Resource/027_view7.png)

Foldery służą głównie do organizowania struktury projektu. Nie zmieniają sposobu używania samego widoku.

Dopóki nazwa widoku jest poprawna, nadal można go używać w innych plikach w formach takich jak `TestView()` i `Test2View()`.

## Usuwanie pliku lub folderu

Jeśli chcesz usunąć plik lub folder, możesz wybrać odpowiedni plik w obszarze Navigator po lewej stronie Xcode, następnie kliknąć prawym przyciskiem myszy i wybrać `Delete`.

Możesz też wybrać plik i nacisnąć klawisz Delete `⌫`.

Xcode wyświetli okno potwierdzenia usunięcia.

![xcode](../../../Resource/027_view10.png)

Wybierz `Move to Trash`, aby przenieść plik do Kosza.

Jeśli zobaczysz `Remove Reference`, oznacza to, że z projektu Xcode zostanie usunięte tylko odwołanie, a oryginalny plik na dysku nie zostanie usunięty.

Dla początkujących, jeśli usuwasz tylko zwykły plik, który właśnie utworzyłeś, zwykle wystarczy wybrać `Move to Trash`.

## Wyświetlanie wielu widoków SwiftUI

Po nauczeniu się tworzenia plików możemy rozdzielać różne widoki do różnych plików.

Na przykład tworzymy dwa pliki SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` służy do wyświetlania imienia autora:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` służy do wyświetlania tła karty:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Następnie możemy użyć tych dwóch widoków wewnątrz `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Po uruchomieniu widać, że `CardView` i `AuthorView` są połączone i wyświetlane razem:

![xcode](../../../Resource/027_view11.png)

W tym wyniku `CardView` działa jako tło, a `AuthorView` jest wyświetlany nad nim. Dzieje się tak, ponieważ zostały umieszczone w `ZStack`.

W `ContentView` używamy tych dwóch widoków przez `CardView()` i `AuthorView()`. `()` po nazwie oznacza utworzenie i użycie tego widoku.

To typowe zagnieżdżanie widoków w SwiftUI: wewnątrz jednego widoku można dalej używać innych widoków.

## Plik wejściowy

Na koniec wróćmy do tego, skąd aplikacja zaczyna wyświetlać interfejs.

W projekcie SwiftUI zwykle istnieje plik wejściowy:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Tutaj `@main` oznacza, że jest to punkt wejścia aplikacji.

Wewnątrz `WindowGroup` widzimy:

```swift
ContentView()
```

Oznacza to, że po uruchomieniu aplikacja najpierw wyświetla `ContentView`.

Następnie wewnątrz `ContentView` wyświetlane jest także:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Dlatego hierarchię widoków można rozumieć tak:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Jeśli zmienimy widok wyświetlany w pliku wejściowym na `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Wtedy po uruchomieniu aplikacja wyświetli tylko `CardView`.

Innymi słowy, `WindowGroup` w kodzie wejściowym decyduje, który widok zostanie wyświetlony jako pierwszy po uruchomieniu aplikacji.

Wewnątrz tego widoku można dalej wyświetlać inne widoki.

## Podsumowanie

W tej lekcji poznaliśmy typowe operacje zarządzania plikami w Xcode.

Nauczyliśmy się, jak tworzyć pliki SwiftUI, jak zmieniać nazwy plików, jak tworzyć foldery oraz jak usuwać pliki.

Jednocześnie poznaliśmy też ważną koncepcję: widoki SwiftUI można rozdzielać do różnych plików, a następnie używać ich wewnątrz innych widoków.

Na przykład:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Tutaj `CardView()` i `AuthorView()` to inne widoki używane wewnątrz `ContentView`.

Na koniec wróciliśmy też do logiki wyświetlania pliku wejściowego.

Gdy aplikacja się uruchamia, najpierw wchodzi do kodu wejściowego oznaczonego `@main`, a następnie wyświetla widok znajdujący się w `WindowGroup`.

Pomaga to zrozumieć, że różne pliki SwiftUI nie są od siebie odizolowane. Mogą być ze sobą łączone i ostatecznie tworzyć kompletny interfejs aplikacji.
