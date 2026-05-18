# Kolory niestandardowe

W tej lekcji nauczymy się, jak tworzyć kolory niestandardowe w SwiftUI.

W poprzednich lekcjach używaliśmy już domyślnych kolorów udostępnianych przez SwiftUI, na przykład:

```swift
Color.blue
Color.red
Color.green
```

Te kolory są wygodne w użyciu, ale w prawdziwym tworzeniu aplikacji domyślne kolory często nie są wystarczająco precyzyjne.

Na przykład projekt graficzny może używać takich kolorów:

```text
#2c54c2
#4875ed
#213e8d
```

Taki rodzaj koloru nazywa się kolorem Hex.

W tej lekcji najpierw sprawimy, że SwiftUI będzie obsługiwać kolory Hex, a następnie użyjemy `static`, aby uporządkować często używane kolory.

Na końcu zastosujemy kolory niestandardowe w widoku encyklopedii zwierząt i dodatkowo użyjemy tła z gradientem, aby przyciski wyglądały bardziej warstwowo.

## Dlaczego potrzebujemy kolorów niestandardowych?

W SwiftUI możemy bezpośrednio używać kolorów systemowych.

Na przykład:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Tutaj `.blue` oznacza kolor niebieski. W rzeczywistości jest to skrócona forma `Color.blue`.

Zaletą domyślnych kolorów jest prostota i wygoda, ale dostępny wybór kolorów jest dość ograniczony.

Na przykład:

```swift
Color.blue
```

Może to oznaczać tylko domyślny niebieski kolor udostępniany przez SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Jednak w rzeczywistym tworzeniu aplikacji często potrzebujemy bardziej konkretnych kolorów.

Na przykład, nawet jeśli wszystkie są niebieskie, mogą występować różne efekty: jasnoniebieski, ciemnoniebieski, szaroniebieski lub jaskrawoniebieski.

![More Blue](../../../Resource/031_color5.png)

W takiej sytuacji, jeśli użyjemy tylko `Color.blue`, trudno będzie odtworzyć efekt z projektu.

Dlatego musimy sprawić, aby SwiftUI obsługiwał kolory niestandardowe.

## Czym jest kolor Hex?

Kolory na ekranie zwykle składają się z trzech kanałów: czerwonego, zielonego i niebieskiego. To właśnie RGB.

RGB oznacza odpowiednio:

```text
Red     // Czerwony
Green   // Zielony
Blue    // Niebieski
```

Kolor Hex jest jednym ze sposobów zapisu koloru RGB.

Na przykład:

```swift
#5479FF
```

Tę wartość koloru można w prosty sposób rozumieć jako trzy części:

```text
54  // Oznacza kanał czerwony
79  // Oznacza kanał zielony
FF  // Oznacza kanał niebieski
```

W tej lekcji nie musimy obliczać tych wartości ani dogłębnie rozumieć zasad systemu szesnastkowego.

Na tym etapie wystarczy wiedzieć, że `#5479FF` oznacza konkretny kolor.

W przyszłości, gdy zobaczymy zapis podobny do `#2c54c2` lub `#4875ed`, możemy najpierw potraktować go jako wartość koloru.

W narzędziach projektowych takich jak Sketch, Figma czy Photoshop również często można zobaczyć podobne wartości kolorów.

![color](../../../Resource/031_color.png)

Jednak SwiftUI domyślnie nie pozwala zapisać tego bezpośrednio w taki sposób:

```swift
Color(hex: "#5479FF")
```

Dlatego musimy samodzielnie rozszerzyć typ `Color`, aby obsługiwał tworzenie kolorów z ciągów Hex.

## Tworzenie pliku Color+Hex.swift

Najpierw tworzymy nowy plik Swift.

Nazwa pliku może brzmieć:

```text
Color.swift
```

Można też zapisać ją czytelniej jako:

```text
Color+Hex.swift
```

Tutaj bardziej zalecane jest użycie:

```text
Color+Hex.swift
```

W projektach Swift nazwy plików takie jak `Color+Hex.swift` są bardzo częste.

Oznacza to, że ten plik jest plikiem rozszerzenia, który dodaje do `Color` obsługę Hex.

Nazwa pliku nie wpływa bezpośrednio na działanie kodu. Służy tylko temu, aby łatwiej zrozumieć przeznaczenie tego pliku.

## Dodanie kodu Color(hex:)

W pliku `Color+Hex.swift` wpisz poniższy kod:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Ten kod używa `extension`, aby rozszerzyć typ `Color`, i dodaje do `Color` nowy inicjalizator:

```swift
init(hex: String)
```

Po dodaniu tego inicjalizatora możemy przekazać ciąg Hex do `Color`, aby utworzyć kolor niestandardowy:

```swift
Color(hex: "#5479FF")
```

Wewnątrz tego rozszerzenia ciąg Hex zostanie przekształcony na kolor RGB, który SwiftUI potrafi rozpoznać.

Na obecnym etapie nie trzeba dogłębnie rozumieć logiki konwersji każdej linii. Wystarczy wiedzieć, że dodana metoda `Color(hex:)` pozwala tworzyć kolory niestandardowe na podstawie wartości Hex.

## Używanie kolorów niestandardowych

Teraz możemy przetestować kolory niestandardowe w `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Efekt wyświetlania:

![color](../../../Resource/031_color1.png)

W tym przykładzie pierwszy wiersz używa koloru systemowego:

```swift
.foregroundStyle(Color.blue)
```

Kolejne trzy wiersze używają niestandardowych kolorów Hex:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Przez porównanie można zauważyć, że systemowy niebieski ma tylko jeden domyślny efekt.

Kolory Hex mogą natomiast przedstawiać bardziej szczegółowe odmiany niebieskiego.

Na tym polega wartość kolorów niestandardowych: pozwalają one zbliżyć kolory interfejsu do rzeczywistego projektu i ułatwiają kontrolowanie stylu wizualnego aplikacji.

## Używanie static do porządkowania kolorów

Teraz możemy już tworzyć kolory na podstawie ciągów Hex:

```swift
Color(hex: "#2c54c2")
```

Taki zapis działa poprawnie, ale jeśli ten sam kolor pojawia się wielokrotnie w różnych miejscach, późniejsze utrzymanie staje się mniej wygodne.

Jeśli ta wartość koloru została wpisana w 10 miejscach, to gdy w przyszłości będziemy chcieli zmienić ten niebieski, trzeba będzie poprawiać ją po kolei.

W takiej sytuacji możemy użyć `static`, aby uporządkować często używane kolory w jednym miejscu.

Na dole pliku `Color+Hex.swift` dodaj dalej poniższy kod:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Tutaj dodaliśmy do `Color` trzy właściwości statyczne: `animalBlue`, `animalLightBlue` i `animalDarkBlue`. Oznaczają one różne odcienie niebieskiego.

Ponieważ te właściwości używają `static`, należą do samego typu `Color`.

Podczas używania można uzyskać do nich dostęp bezpośrednio przez `Color.`:

```swift
Color.animalBlue
```

Taki zapis jest czytelniejszy niż bezpośrednie wpisywanie ciągu Hex.

Gdy widzimy `Color.animalBlue`, możemy wiedzieć, że oznacza on niebieski używany w encyklopedii zwierząt.

Natomiast gdy widzimy `Color(hex: "#2c54c2")`, możemy tylko stwierdzić, że jest to wartość koloru, ale trudniej od razu zrozumieć jej konkretne zastosowanie.

Zarządzanie kolorami w jednym miejscu ma jeszcze jedną zaletę: późniejsze zmiany są wygodniejsze.

Jeśli chcemy dostosować główny kolor encyklopedii zwierząt, wystarczy zmienić miejsce definicji:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Wszystkie miejsca używające tego koloru zostaną zaktualizowane razem.

To jest sens używania `static` do porządkowania kolorów: nazwy kolorów stają się czytelniejsze, a późniejsze utrzymanie wygodniejsze.

## Zastosowanie w encyklopedii zwierząt

Teraz możemy zastosować kolory niestandardowe w poprzednim widoku encyklopedii zwierząt.

Wcześniej tło przycisku zwierzęcia było białe:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Teraz możemy zmienić je na kolor niestandardowy:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Tutaj `Color.animalBlue` to kolor statyczny, który przed chwilą zdefiniowaliśmy w `Color+Hex.swift`.

Tekst przycisku używa koloru białego:

```swift
.foregroundStyle(Color.white)
```

Tło emoji zwierzęcia używa półprzezroczystej bieli:

```swift
.background(Color.white.opacity(0.15))
```

Dzięki temu przycisk tworzy spójny niebieski styl wizualny.

Najważniejsze w tym kroku nie jest dodawanie skomplikowanego kodu, lecz rzeczywiste zastosowanie wcześniej poznanych kolorów niestandardowych w interfejsie.

## Używanie tła z gradientem

Oprócz używania pojedynczego koloru możemy także połączyć kilka kolorów w efekt gradientu.

Na przykład wcześniej zdefiniowaliśmy te kolory:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Te kolory można używać nie tylko pojedynczo, ale także łączyć w tło z gradientem.

W SwiftUI można użyć `LinearGradient`, aby utworzyć gradient liniowy.

Na przykład:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Ten kod tworzy tło z gradientem od lewej do prawej, w którym kolor stopniowo przechodzi z `Color.animalBlue` do `Color.animalLightBlue`.

Tutaj `colors` służy do ustawienia kolorów uczestniczących w gradiencie, a `startPoint` i `endPoint` służą do kontrolowania kierunku gradientu.

### Testowanie efektu gradientu

Możemy użyć prostego `Text`, aby przetestować tło z gradientem.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Efekt wyświetlania:

![color](../../../Resource/031_color3.png)

W tym przykładzie tło `Text` nie jest już pojedynczym kolorem, lecz kolorem gradientowym, który stopniowo zmienia się od lewej do prawej.

W porównaniu ze zwykłym kolorem tła, tło z gradientem ma więcej warstwowości i łatwiej tworzy wizualny punkt skupienia w interfejsie.

## Używanie tła z gradientem w encyklopedii zwierząt

Teraz możemy zmienić kolor tła przycisku zwierzęcia:

```swift
.background(Color.animalBlue)
```

Na tło z gradientem:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Pełny kod wygląda następująco:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Efekt wyświetlania:

![color](../../../Resource/031_color4.png)

Teraz przycisk zwierzęcia nie jest już tylko jednolitym tłem, lecz ma efekt gradientu od lewej do prawej.

W porównaniu z jednokolorowym tłem, tło z gradientem może sprawić, że interfejs wygląda bardziej warstwowo i jest bliższy projektowi wizualnemu prawdziwej aplikacji.

## Różnica między tłem jednokolorowym a tłem z gradientem

Tło jednokolorowe używa tylko jednego koloru.

Na przykład:

```swift
.background(Color.animalBlue)
```

Taki zapis jest prosty i czytelny, dlatego nadaje się do większości podstawowych interfejsów.

Tło z gradientem używa wielu kolorów.

Na przykład:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Taki zapis może sprawić, że interfejs będzie bardziej warstwowy, ale może też łatwiej zwiększyć złożoność wizualną.

Dlatego w rzeczywistym tworzeniu aplikacji można rozumieć to w ten sposób:

Tło jednokolorowe pasuje do zwykłego tekstu, zwykłych przycisków, zwykłych kart i zwykłych teł stron.

Tło z gradientem pasuje do ważnych przycisków, górnych obszarów, kart okładkowych, wejść do funkcji i innych miejsc wymagających podkreślenia.

## Podsumowanie

W tej lekcji nauczyliśmy się, jak używać kolorów niestandardowych w SwiftUI.

Najpierw poznaliśmy kolory Hex.

Na przykład:

```text
#2c54c2
```

Oznacza on konkretny kolor.

Następnie użyliśmy `extension Color`, aby rozszerzyć typ `Color`.

Dzięki temu SwiftUI może tworzyć kolory w następujący sposób:

```swift
Color(hex: "#2c54c2")
```

Potem użyliśmy `static`, aby uporządkować często używane kolory:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

W ten sposób w innych widokach można używać go bezpośrednio:

```swift
Color.animalBlue
```

W porównaniu z każdorazowym wpisywaniem ciągów Hex, ta metoda jest czytelniejsza i ułatwia późniejszą jednolitą zmianę kolorów.

Na końcu poznaliśmy `LinearGradient` i połączyliśmy kolory niestandardowe w tło z gradientem:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Dzięki tej lekcji przeszliśmy cały proces od „tworzenia kolorów niestandardowych” do „używania kolorów w prawdziwym interfejsie”.

W przyszłości, gdy jeden kolor będzie musiał być używany wielokrotnie w wielu miejscach, można najpierw rozważyć uporządkowanie go w rozszerzeniu `Color`.

Dzięki temu kod będzie czytelniejszy, a styl interfejsu łatwiejszy do ujednolicenia.
