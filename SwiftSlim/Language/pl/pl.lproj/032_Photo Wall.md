# Galeria zdjęć

W tej lekcji utworzymy stronę galerii zdjęć.

![view](../../../Resource/032_view13.png)

W tym przykładzie powtórzymy wiedzę o `extension`, `self` i instancjach, a także poznamy często używane w SwiftUI kształty `Shape`.

Dzięki tej wiedzy możemy przycinać zwykłe obrazy do różnych stylów, takich jak okrąg, zaokrąglony prostokąt, kapsuła czy elipsa, oraz dodawać do zdjęć efekt obramowania.

W tej lekcji użyjemy kilku nowych pojęć: `Shape`, `clipShape`, `strokeBorder` i `overlay`.

Wśród nich `clipShape` służy do przycinania kształtu widoku, `strokeBorder` do rysowania obramowania kształtu, a `overlay` do nakładania nowego widoku nad bieżącym widokiem.

## Materiały graficzne

Przed rozpoczęciem musimy przygotować kilka obrazów.

Możesz użyć własnych zdjęć albo przykładowych obrazów dostarczonych w tej lekcji.

Przykładowe zdjęcia w tej lekcji pochodzą ze strony [Pixabay](https://pixabay.com/):

[Krajobraz](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Lis](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Architektura](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Kwiaty](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Łabędź](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Po pobraniu obrazów dodaj je do folderu zasobów `Assets` i nazwij kolejno `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

W ten sposób możemy wyświetlać obrazy w SwiftUI za pomocą `Image("1")`, `Image("2")` i podobnych zapisów.

## Wyświetlanie zdjęć

Najpierw wyświetlimy 5 zdjęć w `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/032_view.png)

W tym fragmencie kodu używamy `ScrollView`, aby umożliwić przewijanie listy zdjęć, oraz `VStack`, aby wiele obrazów było ułożonych od góry do dołu.

Każde zdjęcie używa `.resizable()`, `.scaledToFit()` i `.frame(width: 300)` do ustawienia sposobu wyświetlania obrazu, dzięki czemu obraz może się skalować, zachować pełne proporcje i mieć ograniczoną szerokość.

`.padding(.vertical, 100)` na `VStack` służy do zwiększenia odstępu u góry i na dole, aby pierwsze i ostatnie zdjęcie nie znajdowały się zbyt blisko krawędzi ekranu.

Końcowe `.ignoresSafeArea()` oznacza, że widok przewijania ignoruje obszar bezpieczny, dzięki czemu podczas przewijania zdjęcia mogą rozciągać się do górnej i dolnej krawędzi ekranu, a strona wygląda pełniej.

Jednak teraz wszystkie 5 zdjęć używa tych samych modyfikatorów:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Gdy widzimy powtarzający się kod, możemy rozważyć uporządkowanie go za pomocą `extension`.

## Porządkowanie stylu obrazu za pomocą extension

Możemy rozszerzyć `Image` o metodę przeznaczoną specjalnie dla galerii zdjęć:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tutaj rozszerzamy typ `Image` o metodę `photoGalleryStyle`.

Wewnątrz tej metody znajdują się wcześniej powtarzane `.resizable()`, `.scaledToFit()` i `.frame(width: 300)`. Innymi słowy, kod odpowiedzialny za skalowanie obrazu, zachowanie proporcji i ustawienie szerokości został zebrany w jednym miejscu.

Po użyciu tego rozszerzenia pierwotny kod obrazu:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

można uprościć do:

```swift
Image("1")
    .photoGalleryStyle()
```

W ten sposób każde zdjęcie musi tylko wywołać `.photoGalleryStyle()`, aby zastosować ten sam styl galerii zdjęć. Kod staje się prostszy i łatwiej później zmienić go w jednym miejscu.

## Zrozumienie self

W metodzie rozszerzenia zapisaliśmy `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tutaj `self` oznacza bieżącą instancję obrazu, która wywołuje tę metodę.

Na przykład:

```swift
Image("1")
    .photoGalleryStyle()
```

W tym fragmencie kodu `photoGalleryStyle()` jest wywoływane przez `Image("1")`, więc `self` wewnątrz metody oznacza właśnie ten obraz `Image("1")`.

Można to rozumieć prosto: kto wywołuje tę metodę, tego reprezentuje `self`.

Trzeba zauważyć, że modyfikatory SwiftUI stale zwracają nowe wyniki widoku. Dlatego `photoGalleryStyle()` zwraca widok po zastosowaniu modyfikatorów, a nie po prostu pierwotny `Image`.

## Kształty zdjęć

Teraz zdjęcia mogą być już wyświetlane poprawnie. Domyślnie jednak wszystkie te zdjęcia są prostokątne, więc wyglądają dość zwyczajnie.

Jeśli chcemy tylko dodać zdjęciu zaokrąglone rogi, możemy bezpośrednio użyć `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Efekt wyświetlania:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` oznacza dodanie obrazowi zaokrąglenia rogów o wartości `20 pt`. Dla zwykłego obrazu z zaokrąglonymi rogami taki zapis jest już wystarczający.

Jednak `.cornerRadius()` obsługuje tylko efekt zaokrąglonych rogów i nadaje się do zwykłych obrazów z zaokrągleniem. Jeśli chcemy zmienić zdjęcie w więcej różnych kształtów, sam ten modyfikator nie wystarczy.

Wtedy trzeba użyć `Shape` w SwiftUI. `Shape` może reprezentować różne figury, a w połączeniu z `clipShape` pozwala przyciąć obraz do odpowiedniego kształtu.

## Poznanie Shape

W SwiftUI `Shape` oznacza figurę. Podobnie jak `View`, jest to bardzo często używany typ w SwiftUI.

Typowe `Shape` to okrąg, prostokąt, zaokrąglony prostokąt, kapsuła i elipsa. Aby łatwiej zaobserwować wygląd różnych figur, poniższe przykłady ustawiają dla każdej figury inny kolor i rozmiar.

W tych przykładach `.fill()` służy do wypełniania figury kolorem, a `.frame()` do ustawiania jej rozmiaru wyświetlania. Kolor służy tylko do rozróżnienia figur i nie jest stałym kolorem samej figury.

### Circle okrąg

`Circle` oznacza okrąg. Często używa się go do avatarów, okrągłych przycisków, okrągłych obrazów i podobnych efektów interfejsu.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle prostokąt

`Rectangle` oznacza prostokąt. Jest jedną z najbardziej podstawowych figur i może służyć do tworzenia tła, podziału obszarów albo zwykłych obramowań.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle zaokrąglony prostokąt

`RoundedRectangle` oznacza zaokrąglony prostokąt. `cornerRadius` służy do ustawiania wielkości zaokrąglenia.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapsuła

`Capsule` oznacza kształt kapsuły. Jej oba końce są łukami, dlatego często używa się jej do przycisków kapsułowych, tła etykiet i podobnych efektów interfejsu.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipsa

`Ellipse` oznacza elipsę. Jest podobna do `Circle`, ale gdy szerokość i wysokość nie są takie same, wyświetla się jako elipsa.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Na podstawie tych przykładów widać, że `Shape` sam w sobie może być bezpośrednio wyświetlany jako figura. Następnie użyjemy tych `Shape` razem z `clipShape`, aby przycinać zdjęcia i wyświetlać je w różnych kształtach.

## Przycinanie zdjęć za pomocą clipShape

Teraz możemy użyć `clipShape`, aby przyciąć zdjęcia do różnych kształtów.

Na przykład przytnijmy pierwsze zdjęcie do okręgu:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Ten kod oznacza: najpierw wyświetl obraz, a następnie użyj `Circle()`, aby przyciąć go do okręgu.

![view](../../../Resource/032_view2.png)

Podstawowy zapis `clipShape` wygląda tak:

```swift
.clipShape(kształt)
```

Dodaj `.clipShape(...)` po widoku, a w nawiasach wpisz figurę, do której chcesz przyciąć widok.

Na przykład:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Teraz przytniemy 5 zdjęć do różnych kształtów:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/032_view8.png)

Wśród nich efekt po przycięciu przez `Rectangle()` jest zbliżony do zwykłego prostokątnego zdjęcia, więc zmiana wizualna nie jest wyraźna. Służy głównie do porównania z innymi kształtami.

Teraz zdjęcia nie są już tylko zwykłymi prostokątami, lecz mają różne kształty.

## Dodawanie obramowania zdjęcia

Jeśli chcemy dodać obramowanie do okrągłego zdjęcia, możemy najpierw pomyśleć o użyciu `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Jednak zwykle nie otrzymamy w ten sposób okrągłego obramowania, lecz obramowanie prostokątne.

![view](../../../Resource/032_view9.png)

Dzieje się tak, ponieważ `border` dodaje obramowanie według prostokątnego obszaru widoku, a nie według kształtu po przycięciu przez `clipShape`.

Dlatego jeśli chcemy uzyskać okrągłe obramowanie, nie możemy użyć bezpośrednio `border`.

## Rysowanie obramowania kształtu za pomocą strokeBorder

W SwiftUI `strokeBorder` może rysować wewnętrzne obramowanie dla tych często używanych `Shape`.

Na przykład narysujmy okrągłe obramowanie:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Ten kod oznacza: narysuj dla `Circle` brązowe obramowanie o szerokości `10 pt`.

![view](../../../Resource/032_view12.png)

Trzeba tutaj zauważyć, że `strokeBorder` nie dodaje bezpośrednio obramowania do zdjęcia, lecz rysuje obramowanie dla figury `Circle()`.

Innymi słowy, ten fragment kodu daje tylko niezależne okrągłe obramowanie, które nie ma jeszcze związku ze zdjęciem.

Jeśli chcemy, aby to okrągłe obramowanie było wyświetlane nad zdjęciem, musimy dalej użyć `overlay`, aby nałożyć obramowanie na zdjęcie.

## Nakładanie obramowania za pomocą overlay

`overlay` to modyfikator widoku, który może nałożyć nowy widok nad bieżącym widokiem.

Jego podstawową strukturę można rozumieć tak:

```swift
bieżący widok
    .overlay {
        nakładany widok
    }
```

W tym przykładzie bieżącym widokiem jest zdjęcie przycięte już do okręgu:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Nowym widokiem, który chcemy nałożyć, jest okrągłe obramowanie:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Dlatego możemy połączyć zdjęcie i obramowanie:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Tutaj `overlay` oznacza nałożenie nowego widoku nad bieżącym widokiem.

W `overlay` obramowanie będzie nakładane zgodnie z bieżącym zakresem wyświetlania zdjęcia, dlatego nie trzeba osobno ustawiać `frame`. Dopóki kształt obramowania jest zgodny z kształtem przycięcia, obramowanie będzie pasować do zdjęcia.

![view](../../../Resource/032_view10.png)

Ostateczny efekt jest taki, że nad okrągłym zdjęciem znajduje się okrągłe obramowanie.

W porównaniu z `ZStack`, `overlay` lepiej nadaje się do scenariusza „dodania dekoracji do bieżącego widoku”. Zdjęcie jest elementem głównym, a obramowanie jest tylko efektem dodatkowym, dlatego użycie `overlay` jest czytelniejsze.

## Ukończenie galerii zdjęć

Teraz dodamy do każdego zdjęcia odpowiedni kształt i obramowanie:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/032_view13.png)

W ten sposób podstawowa strona galerii zdjęć jest gotowa.

Na tej stronie użyliśmy `ScrollView` do przewijania, `Image` do wyświetlania zdjęć, `clipShape` do przycinania kształtu zdjęć, a `overlay` i `strokeBorder` do dodawania obramowań.

## Pełny kod

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Podsumowanie

W tej lekcji ukończyliśmy stronę galerii zdjęć.

![view](../../../Resource/032_view13.png)

W tym przykładzie najpierw użyliśmy `Image` do wyświetlenia zdjęć, a następnie rozszerzyliśmy `Image` za pomocą `extension` o metodę `photoGalleryStyle`, aby uporządkować powtarzający się kod stylu obrazu.

Następnie poznaliśmy często używane w SwiftUI `Shape`, takie jak `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` i `Ellipse`. Te figury można nie tylko bezpośrednio wyświetlać, lecz także łączyć z `clipShape`, aby przycinać widoki.

Na przykład:

```swift
.clipShape(Circle())
```

oznacza przycięcie widoku do okręgu.

Na koniec użyliśmy `overlay` i `strokeBorder`, aby dodać zdjęciom obramowania zgodne z ich kształtami. Trzeba zauważyć, że `border` zwykle rysuje obramowanie według prostokątnego obszaru widoku. Jeśli chcemy, aby obramowanie podążało za okręgiem, kapsułą lub elipsą, lepiej nałożyć ten sam `Shape`.

Dzięki tej lekcji nie tylko ukończyliśmy efekt galerii zdjęć, lecz także zrozumieliśmy częsty sposób łączenia `Shape`, `clipShape`, `strokeBorder` i `overlay` w interfejsie.

## Ćwiczenia po lekcji

### 1、Dodaj tło galerii zdjęć

Dodaj pełnoekranowy obraz tła do strony galerii zdjęć.

Wymaganie: obraz tła może wypełniać cały ekran i ignorować obszar bezpieczny.

### 2、Obramowanie gradientowe

Zmień obecne jednokolorowe obramowanie na liniowe obramowanie gradientowe.

Możesz spróbować użyć `LinearGradient`, aby uzyskać bogatszy efekt obramowania.

### 3、Imitacja ramki zdjęcia

Wyszukaj w internecie kilka stylów prawdziwych ramek do zdjęć i spróbuj użyć `overlay`, aby nałożyć ramkę graficzną na zdjęcie, tak aby wyglądało bardziej jak prawdziwa oprawa.

Efekt ćwiczenia:

![button](../../../Resource/032_view15.jpeg)

### 4、Utwórz obramowanie przycisku z zaokrąglonymi rogami

W rzeczywistym programowaniu przyciski często używają obramowania w kształcie zaokrąglonego prostokąta.

Spróbuj utworzyć przycisk z zaokrąglonymi rogami i użyj `RoundedRectangle` oraz `strokeBorder`, aby dodać do niego zaokrąglone obramowanie.

Efekt ćwiczenia:

![button](../../../Resource/032_view14.png)

### Pytanie do przemyślenia

Jeśli nie chcemy używać jednokolorowego obramowania ani obramowania gradientowego, lecz chcemy, aby obramowanie miało jakiś wzór, jak można to zrobić?

Możesz spróbować wyszukać materiały i poznać powiązane zastosowania `overlay`, `mask` albo `ImagePaint`.

Efekt ćwiczenia:

![button](../../../Resource/032_view16.png)
