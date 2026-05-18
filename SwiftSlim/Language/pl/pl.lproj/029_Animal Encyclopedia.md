# Encyklopedia zwierząt 

W tej lekcji będziemy dalej ćwiczyć tworzenie własnych widoków i przekazywanie danych.

Utworzymy prosty widok encyklopedii zwierząt. Na stronie zostanie wyświetlonych pięć zwierząt. Po kliknięciu wybranego zwierzęcia pojawi się widok szczegółów z obrazem, obszarem występowania, siedliskiem i opisem tego zwierzęcia.

Efekt końcowy:

![view](../../../Resource/029_view.png)

Dzięki temu przykładowi możemy przećwiczyć współpracę struktury danych, wyświetlania listy, interakcji kliknięcia oraz widoku prezentowanego za pomocą Sheet.

## Przygotowanie materiałów graficznych

Najpierw musimy przygotować pięć obrazów zwierząt:

- Delfin: `dolphin.jpg`
- Żyrafa: `giraffe.jpg`
- Lew: `lion.jpg`
- Panda: `panda.jpg`
- Niedźwiedź polarny: `polarBear.jpg`

Możesz użyć poniższych materiałów graficznych:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Żyrafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lew](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Niedźwiedź polarny](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Po pobraniu obrazów przeciągnij je do folderu zasobów `Assets` w projekcie Xcode.

![assets](../../../Resource/029_assets.png)

Warto zauważyć, że podczas używania obrazów w kodzie zazwyczaj nie trzeba pisać rozszerzenia `.jpg`.

Na przykład, jeśli nazwa zasobu obrazu to `dolphin`, w kodzie zapisujemy:

```swift
Image("dolphin")
```

Jeśli nazwa obrazu zostanie wpisana błędnie, obraz nie będzie mógł zostać poprawnie wyświetlony.

Uwaga: powyższe materiały graficzne pochodzą z projektu Wikimedia. Przy użyciu zaleca się zachowanie linku do oryginalnego obrazu oraz informacji o źródle.

## Tworzenie struktury zwierzęcia

Na tej stronie każde zwierzę ma kilka informacji:

- Nazwa zwierzęcia
- Obraz zwierzęcia
- Emoji zwierzęcia
- Obszar występowania
- Siedlisko
- Opis zwierzęcia

Jeśli rozdzielimy te informacje na wiele zmiennych, kod stanie się dość chaotyczny. Dlatego możemy utworzyć strukturę `Animal`, aby trzymać informacje o jednym zwierzęciu razem.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

W tym kodzie:

- `id`: unikalny identyfikator zwierzęcia.
- `name`: nazwa zwierzęcia.
- `imageName`: nazwa obrazu zwierzęcia.
- `avatarEmoji`: emoji zwierzęcia.
- `distributionArea`: obszar występowania.
- `habitat`: siedlisko.
- `animalDescription`: opis zwierzęcia.

Wśród nich:

```swift
let id = UUID()
```

`id` służy do identyfikowania każdego zwierzęcia. Później użyjemy `ForEach` do wyświetlenia listy zwierząt, a także `.sheet(item:)` do pokazania szczegółów na podstawie wybranego zwierzęcia, dlatego `Animal` musi być zgodny z protokołem `Identifiable`.

Rola `Identifiable` polega na poinformowaniu SwiftUI: każde zwierzę ma `id`, który pozwala odróżnić jego tożsamość.

## Tworzenie danych zwierząt

Następnie w `ContentView` tworzymy tablicę zwierząt.

Tablica przechowuje pięć wartości `Animal`, a każda wartość `Animal` reprezentuje jedno zwierzę.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Ciepłe i umiarkowane oceany na całym świecie.",
            habitat: "Oceany, wody przybrzeżne i niektóre duże rzeki.",
            animalDescription: "Delfiny to inteligentne ssaki morskie. Żyją w grupach, komunikują się dźwiękami i są znane z zabawowego zachowania."
        ),
        // Żyrafa
        Animal(
            name: "Żyrafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Sawanny i otwarte zadrzewienia w Afryce.",
            habitat: "Trawiaste równiny, sawanny i otwarte lasy.",
            animalDescription: "Żyrafy są najwyższymi zwierzętami lądowymi. Mają długie szyje, długie nogi i zwykle żywią się liśćmi wysokich drzew."
        ),
        // Lew
        Animal(
            name: "Lew",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Występuje głównie w Afryce Subsaharyjskiej, z niewielką populacją w zachodnich Indiach.",
            habitat: "Trawiaste równiny, sawanny i otwarte zadrzewienia.",
            animalDescription: "Lwy to potężne wielkie koty. Zwykle żyją w grupach zwanych stadami i często są nazywane królami świata zwierząt."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Górskie lasy w środkowych Chinach.",
            habitat: "Lasy bambusowe w chłodnych i wilgotnych obszarach górskich.",
            animalDescription: "Pandy to niedźwiedzie znane z czarno-białego futra. Żywią się głównie bambusem i są jednymi z najbardziej rozpoznawalnych zwierząt na świecie."
        ),
        // Niedźwiedź polarny
        Animal(
            name: "Niedźwiedź polarny",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiony arktyczne wokół bieguna północnego.",
            habitat: "Lód morski, obszary przybrzeżne i zimne środowiska arktyczne.",
            animalDescription: "Niedźwiedzie polarne to duże niedźwiedzie przystosowane do zimnych środowisk. Są silnymi pływakami i polegają głównie na lodzie morskim podczas polowania na foki."
        )
    ]

    var body: some View {
        Text("Encyklopedia zwierząt")
    }
}
```

Tutaj `animals` jest tablicą:

```swift
let animals: [Animal]
```

`[Animal]` oznacza, że w tej tablicy zapisanych jest wiele wartości `Animal`.

Innymi słowy, `animals` nie jest jednym zwierzęciem, lecz grupą zwierząt.

## Wyświetlanie listy zwierząt

Teraz możemy użyć `ForEach`, aby wyświetlić listę zwierząt.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/029_view1.png)

W tym kodzie:

```swift
ForEach(animals) { animal in
    ...
}
```

Oznacza to przejście przez tablicę `animals`.

Podczas każdej iteracji `animal` reprezentuje aktualnie wyświetlane zwierzę.

Na przykład podczas pierwszej iteracji `animal` to delfin; podczas drugiej iteracji `animal` to żyrafa.

Dlatego możemy wyświetlić informacje o bieżącym zwierzęciu w taki sposób:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

W ten sposób można wyświetlić pięć zwierząt.

## Umożliwienie klikania listy zwierząt

Lista jest już wyświetlana, ale nie można jej jeszcze kliknąć.

Jeśli chcemy, aby po kliknięciu konkretnego zwierzęcia pojawiły się szczegóły, najpierw musimy zapisać „aktualnie wybrane zwierzę”.

Dlatego dodajemy w `ContentView` zmienną stanu:

```swift
@State private var selectedAnimal: Animal? = nil
```

Tutaj `selectedAnimal` jest wartością opcjonalną typu `Animal?`.

Oznacza to, że może zawierać jedno zwierzę albo nie zawierać żadnego zwierzęcia.

Wartość domyślna to `nil`, co oznacza, że na początku żadne zwierzę nie jest wybrane.

Następnie zmieniamy każdy wiersz zwierzęcia na `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Najważniejsza jest ta linia kodu:

```swift
selectedAnimal = animal
```

Gdy użytkownik kliknie konkretne zwierzę, zapisujemy to zwierzę w `selectedAnimal`.

Na przykład, gdy użytkownik kliknie delfina, w `selectedAnimal` zapisany zostanie delfin.

Gdy użytkownik kliknie pandę, w `selectedAnimal` zapisana zostanie panda.

Innymi słowy, `selectedAnimal` służy do zapisywania tego, które zwierzę użytkownik aktualnie kliknął.

## Widok prezentowany za pomocą Sheet

Teraz możemy już za pomocą przycisku zapisywać „aktualnie kliknięte zwierzę”.

Następnie musimy zaimplementować widok prezentowany, który będzie wyświetlać szczegóły zwierzęcia.

![view](../../../Resource/029_view2.png)

W SwiftUI można użyć `Sheet`, aby uzyskać taki efekt prezentacji.

`Sheet` można rozumieć jako tymczasowo prezentowaną stronę. Pojawia się nad bieżącą stroną, a po obejrzeniu treści użytkownik może przesunąć ją w dół, aby ją zamknąć.

## Przykład Sheet

Zanim naprawdę wyświetlimy szczegóły zwierzęcia, najpierw użyjemy prostego przykładu, aby zrozumieć, jak pojawia się `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Pokaż Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Widok Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/029_view3.png)

W tym kodzie tworzymy wartość logiczną:

```swift
@State private var showSheet = false
```

`showSheet` domyślnie ma wartość `false`, co oznacza, że na początku `Sheet` nie jest wyświetlany.

Po kliknięciu przycisku:

```swift
showSheet.toggle()
```

`toggle()` oznacza przełączenie wartości logicznej.

Jeśli pierwotnie była to wartość `false`, po wywołaniu `toggle()` zmieni się na `true`.

Jeśli pierwotnie była to wartość `true`, po wywołaniu `toggle()` zmieni się na `false`.

Dlatego po kliknięciu przycisku `showSheet` zmieni się z `false` na `true`.

Gdy `showSheet` zmieni się na `true`, poniższy kod zaprezentuje `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Widok Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ten kod oznacza: gdy `showSheet` ma wartość `true`, zaprezentuj `Sheet` i wyświetl w nim `Text("Widok Sheet")`.

Efekt wyświetlania:

![view](../../../Resource/029_view4.png)

Ten sposób zapisu nadaje się do prezentowania stałej treści.

Na przykład po kliknięciu przycisku można zaprezentować stronę ustawień, stronę objaśnień, stronę podpowiedzi itp.

### Miejsce umieszczenia Sheet

Chociaż `Sheet` jest widokiem prezentowanym, w SwiftUI nie zapisuje się go bezpośrednio jako niezależnego widoku, takiego jak `Text()` czy `Image()`. Używa się go jako modyfikatora widoku.

Innymi słowy, `.sheet(...)`, podobnie jak `.font()`, `.padding()` i `.shadow()`, musi zostać dodany po pewnym widoku.

Na przykład:

```swift
Button("Pokaż Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Widok Sheet")
}
```

W tym przykładzie `.sheet` zostało dodane po `Button`.

Gdy `showSheet` zmieni się na `true`, SwiftUI zaprezentuje `Sheet` i wyświetli zawartość w nawiasach klamrowych:

```swift
Text("Widok Sheet")
```

Jednak w rzeczywistym rozwoju aplikacji, jeśli na stronie jest wiele przycisków, zazwyczaj nie dodaje się `.sheet` do każdego przycisku osobno.

Częściej stosuje się takie podejście: dodać `.sheet` po widoku zewnętrznym.

Na przykład:

```swift
VStack {
    Button("Pokaż Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Widok Sheet")
}
```

Przycisk odpowiada za zmianę `showSheet`, a widok zewnętrzny odpowiada za prezentację `Sheet` w zależności od tego, czy `showSheet` ma wartość `true`.

## Powiązanie Sheet z wartością opcjonalną

Wcześniej poznaliśmy taki zapis:

```swift
.sheet(isPresented: $showSheet) {
    Text("Widok Sheet")
}
```

Ten sposób zapisu nadaje się do kontrolowania pokazywania i ukrywania stałej strony.

Jednak w przykładzie encyklopedii zwierząt nie wystarczy wiedzieć, „czy należy zaprezentować `Sheet`”; musimy też wiedzieć, „które zwierzę zostało kliknięte”.

Na przykład:

Gdy użytkownik kliknie delfina, w `Sheet` powinny zostać wyświetlone szczegóły delfina.

Gdy użytkownik kliknie pandę, w `Sheet` powinny zostać wyświetlone szczegóły pandy.

Dlatego tutaj bardziej odpowiedni jest inny sposób użycia Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Treść wyświetlana w Sheet
}
```

W tym kodzie `Sheet` jest powiązany z wartością opcjonalną `selectedAnimal`.

Zwróć uwagę, że po `item:` wpisujemy `$selectedAnimal`, a nie `selectedAnimal`.

Ponieważ `Sheet` nie tylko odczytuje wartość `selectedAnimal`, ale także musi na podstawie jej zmian zdecydować, czy ma się pojawić.

Ten kod można rozumieć tak:

- Gdy `selectedAnimal` ma wartość `nil`, `Sheet` nie jest wyświetlany.
- Gdy `selectedAnimal` ma wartość, `Sheet` jest wyświetlany.
- Gdy `Sheet` zostanie zamknięty, SwiftUI ponownie zmieni `selectedAnimal` na `nil`.

SwiftUI przekaże zwierzę zapisane w `selectedAnimal` do `animal` w nawiasach klamrowych.

Innymi słowy, `.sheet(item:)` nie tylko kontroluje prezentację, ale także przekazuje wybrane dane do `Sheet`.

## Użycie Sheet do wyświetlenia nazwy zwierzęcia

Teraz nie musimy od razu tworzyć złożonego widoku szczegółów.

Aby kod był łatwiejszy do zrozumienia, najpierw wyświetlimy w `Sheet` nazwę aktualnego zwierzęcia.

Dodaj `.sheet(item:)` na zewnątrz `VStack`:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Najważniejszy jest tutaj ten fragment kodu:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Gdy `selectedAnimal` ma wartość, `Sheet` zostanie zaprezentowany.

`animal` w nawiasach klamrowych to aktualnie wybrane zwierzę.

Dlatego:

```swift
Text(animal.name)
```

Wyświetli nazwę aktualnie klikniętego zwierzęcia.

Na przykład po kliknięciu `Delfin` w Sheet zostanie wyświetlone `Delfin`.

Po kliknięciu `Panda` w `Sheet` zostanie wyświetlone `Panda`.

W ten sposób zrealizowaliśmy efekt: kliknięcie różnych zwierząt pokazuje różne nazwy zwierząt w widoku prezentowanym.

Wyświetlanie nazwy zwierzęcia:

![view](../../../Resource/029_view5.png)

Jednak szczegóły zwierzęcia nie powinny wyświetlać tylko jednej nazwy. Powinny też zawierać nazwę, obszar występowania, siedlisko i opis.

Jeśli wpiszemy cały ten kod w `.sheet`, kod stanie się bardzo długi i mniej czytelny.

Dlatego dalej utworzymy nowy własny widok, który będzie specjalnie odpowiadał za wyświetlanie szczegółów zwierzęcia.

## Tworzenie widoku szczegółów zwierzęcia

Następnie tworzymy nowy własny widok `AnimalDetailView`.

Ten widok przyjmuje jedno `Animal` i wyświetla szczegóły zwierzęcia.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Obszar występowania**: \(animal.distributionArea)")

                    Divider()

                    Text("**Siedlisko**: \(animal.habitat)")

                    Divider()

                    Text("**Opis zwierzęcia**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/029_view2.png)

Najważniejsze jest tutaj:

```swift
var animal: Animal
```

Oznacza to, że `AnimalDetailView` musi przyjąć jedno zwierzę z zewnątrz.

Po otrzymaniu zwierzęcia widok szczegółów może używać różnych informacji o tym zwierzęciu:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Innymi słowy, `AnimalDetailView` odpowiada tylko za wyświetlenie przekazanego zwierzęcia.

### Pogrubiony tekst Markdown

W widoku szczegółów napisaliśmy taki kod:

```swift
Text("**Siedlisko:** \(animal.habitat)")
```

Są tu dwa punkty do zrozumienia.

Po pierwsze, `**Siedlisko:**` używa składni `Markdown`. Tekst otoczony dwoma gwiazdkami zostanie wyświetlony pogrubieniem.

Po drugie, `\()` to interpolacja tekstu. Pozwala wyświetlić wartość zmiennej w tekście.

Ten kod najpierw wyświetla pogrubione `Siedlisko:`, a następnie pokazuje siedlisko tego zwierzęcia.

## Wyświetlanie widoku szczegółów w Sheet

Po utworzeniu `AnimalDetailView` możemy wrócić do `ContentView` i zastąpić pierwotny widok nazwy w `Sheet` widokiem szczegółów.

Pierwotnie było:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Teraz zmieniamy na:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Tutaj `animal:` jest nazwą parametru `AnimalDetailView`.

Następujące po nim `animal` to aktualne zwierzę przekazane przez `.sheet(item:)`.

Czyli przekazujemy aktualnie kliknięte zwierzę do `AnimalDetailView` w celu wyświetlenia.

Pełna struktura:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
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
```

Gdy użytkownik kliknie zwierzę:

```swift
selectedAnimal = animal
```

`selectedAnimal` zmienia się z `nil` na konkretne zwierzę. Gdy `Sheet` wykryje, że `selectedAnimal` ma wartość, zaprezentuje widok.

`Sheet` przekazuje zwierzę z `selectedAnimal` do widoku `AnimalDetailView`, a `AnimalDetailView` wyświetla szczegóły zwierzęcia.

W ten sposób zrealizowaliśmy funkcję: kliknięcie listy zwierząt otwiera szczegóły odpowiadającego zwierzęcia.

## Różnica między dwoma sposobami użycia Sheet

Teraz użyliśmy już `.sheet(item:)` do wyświetlenia widoku szczegółów zwierzęcia.

Tutaj możemy krótko podsumować dwa popularne sposoby używania `Sheet`.

### Pierwszy sposób: powiązanie z wartością logiczną

```swift
@State private var showSheet = false

Button("Pokaż Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Widok Sheet")
}
```

Ten sposób zapisu nadaje się do prezentowania stałej treści, na przykład strony ustawień, strony objaśnień, strony podpowiedzi itp.

`showSheet` jest wartością logiczną i ma tylko dwa stany: `true` oraz `false`.

Gdy `showSheet` ma wartość `true`, `Sheet` jest wyświetlany.

Gdy `showSheet` ma wartość `false`, `Sheet` nie jest wyświetlany.

### Drugi sposób: powiązanie z wartością opcjonalną

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Ten sposób zapisu nadaje się do prezentowania różnych treści na podstawie wybranych danych.

W tej lekcji klikamy różne zwierzęta i musimy wyświetlać różne szczegóły zwierząt, dlatego użycie `.sheet(item:)` jest bardziej odpowiednie.

## Pełny kod

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Nazwa zwierzęcia
    let name: String
    
    // Obraz zwierzęcia
    let imageName: String
    
    // Emoji zwierzęcia
    let avatarEmoji: String
    
    // Obszar występowania
    let distributionArea: String
    
    // Siedlisko
    let habitat: String
    
    // Opis zwierzęcia
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Ciepłe i umiarkowane oceany na całym świecie.",
            habitat: "Oceany, wody przybrzeżne i niektóre duże rzeki.",
            animalDescription: "Delfiny to inteligentne ssaki morskie. Żyją w grupach, komunikują się dźwiękami i są znane z zabawowego zachowania."
        ),
        // Żyrafa
        Animal(
            name: "Żyrafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Sawanny i otwarte zadrzewienia w Afryce.",
            habitat: "Trawiaste równiny, sawanny i otwarte lasy.",
            animalDescription: "Żyrafy są najwyższymi zwierzętami lądowymi. Mają długie szyje, długie nogi i zwykle żywią się liśćmi wysokich drzew."
        ),
        // Lew
        Animal(
            name: "Lew",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Występuje głównie w Afryce Subsaharyjskiej, z niewielką populacją w zachodnich Indiach.",
            habitat: "Trawiaste równiny, sawanny i otwarte zadrzewienia.",
            animalDescription: "Lwy to potężne wielkie koty. Zwykle żyją w grupach zwanych stadami i często są nazywane królami świata zwierząt."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Górskie lasy w środkowych Chinach.",
            habitat: "Lasy bambusowe w chłodnych i wilgotnych obszarach górskich.",
            animalDescription: "Pandy to niedźwiedzie znane z czarno-białego futra. Żywią się głównie bambusem i są jednymi z najbardziej rozpoznawalnych zwierząt na świecie."
        ),
        // Niedźwiedź polarny
        Animal(
            name: "Niedźwiedź polarny",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiony arktyczne wokół bieguna północnego.",
            habitat: "Lód morski, obszary przybrzeżne i zimne środowiska arktyczne.",
            animalDescription: "Niedźwiedzie polarne to duże niedźwiedzie przystosowane do zimnych środowisk. Są silnymi pływakami i polegają głównie na lodzie morskim podczas polowania na foki."
        )
    ]
    
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
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Obszar występowania**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Siedlisko**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Opis zwierzęcia**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Podsumowanie

W tej lekcji ukończyliśmy prostą stronę encyklopedii zwierząt.

Najpierw użyliśmy struktury `Animal` do zapisania informacji o zwierzętach, następnie użyliśmy tablicy do zapisania pięciu zwierząt, a potem użyliśmy `ForEach`, aby wyświetlić listę zwierząt.

Gdy użytkownik kliknie konkretne zwierzę, zapisujemy je w `selectedAnimal`:

```swift
selectedAnimal = animal
```

Gdy `selectedAnimal` ma wartość, `.sheet(item:)` zaprezentuje widok szczegółów i przekaże wybrane zwierzę do `AnimalDetailView`.

Najważniejsze w tej lekcji nie jest styl interfejsu, lecz zrozumienie tej ścieżki przekazywania danych:

```swift
Kliknięcie zwierzęcia → selectedAnimal zapisuje zwierzę → Sheet zostaje zaprezentowany → AnimalDetailView wyświetla szczegóły
```

Po zrozumieniu tej ścieżki można później tworzyć więcej podobnych funkcji, takich jak szczegóły produktu, szczegóły kursu, szczegóły artykułu czy szczegóły kontaktu.
