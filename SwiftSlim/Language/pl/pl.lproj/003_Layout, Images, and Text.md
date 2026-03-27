# Układ, obraz i tekst

W poprzedniej lekcji poznaliśmy kod ContentView:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

W tej lekcji nauczymy się domyślnego mechanizmu układu w SwiftUI oraz sposobu używania obrazów i tekstu. Na podstawie poprzedniej lekcji lepiej zrozumiemy strukturę widoków i sposób ich wyświetlania. Ta wiedza pozwoli nam budować podstawowe układy interfejsu.

## Domyślny mechanizm układu w SwiftUI

Podczas podglądu widoku ContentView zauważymy, że ikona i tekst są wyśrodkowane, a nie ułożone od góry.

![Swift](../../RESOURCE/003_view.png)

Domyślnie kontenery Stack mają wyrównanie .center, dlatego widoki podrzędne zwykle są wyświetlane na środku.

### Alignment — wyrównanie

Wyraźnie widać, że wyśrodkowanie to tylko jeden z rodzajów wyrównania. Jeśli chcemy wyrównać do lewej albo do prawej, musimy użyć alignment do kontrolowania wyrównania widoku.

```swift
alignment
```

W SwiftUI wyrównanie zwykle pojawia się w dwóch sytuacjach:

**1. Parametr wyrównania kontenera Stack**

Na przykład, aby ikona i tekst w ContentView były wyrównane do lewej:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

alignment w VStack kontroluje wyrównanie w poziomie.

Sposoby wyrównania:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack układa elementy poziomo, więc alignment kontroluje wyrównanie w pionie:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack układa elementy warstwowo, więc alignment może kontrolować wyrównanie w poziomie albo pionie:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Jeśli alignment nie zostanie ustawione jawnie, VStack, HStack i ZStack domyślnie używają .center.

**2. alignment wewnątrz frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Gdy rozmiar podany przez frame jest większy niż własny rozmiar widoku, alignment decyduje o położeniu widoku wewnątrz frame. Dokładniejsze użycie frame omówimy później, tutaj wystarczy wstępne zrozumienie.

### Spacer i mechanizm rozdzielania przestrzeni

alignment pozwala porządkować widoki w poziomie albo pionie. Jednak gdy chcemy, aby tekst i obraz znajdowały się na dwóch końcach, samo wyrównanie nie wystarczy.

Na przykład, gdy chcemy zrobić górny widok podobny do strony [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), gdzie po lewej stronie znajduje się ikona strony NHK, a po prawej ikona menu serwisu.

![Swift](../../RESOURCE/003_alignment3.png)

Jeśli użyjemy tylko alignment, ikona NHK i ikona menu będą wyświetlane tylko po jednej stronie. Nie da się rozmieścić dwóch ikon po lewej i prawej stronie jednocześnie, dlatego potrzebujemy Spacer do rozdzielania pozostałej przestrzeni.

Spacer to elastyczny widok układu, który może automatycznie wypełniać pozostałą przestrzeń.

Sposób użycia:

```swift
Spacer()
```

Na przykład:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Gdy dodamy Spacer między Image i Text, Spacer wypełni pozostałą przestrzeń i wypchnie Image oraz Text odpowiednio do góry i do dołu.

![Swift](../../RESOURCE/003_view1.png)

Jeśli istnieje kilka Spacer:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Pozostała przestrzeń zostanie rozdzielona po równo między wszystkie Spacer.

![Swift](../../RESOURCE/003_spacer.png)

## Wyświetlanie obrazu i kontrola rozmiaru w Image

Widok Image służy głównie do wyświetlania obrazów. Ikony SF Symbols, których uczyliśmy się w poprzedniej lekcji, są tylko jednym ze sposobów użycia Image.

Sposób użycia:

```swift
Image("imageName")
```

W cudzysłowie w Image wpisuje się nazwę obrazu, bez rozszerzenia pliku.

### Wyświetlanie obrazu

Najpierw przygotowujemy obraz.

![Swift](../../RESOURCE/003_img.jpg)

W Xcode wybieramy folder zasobów Assets i przeciągamy obraz do Assets.

![Swift](../../RESOURCE/003_img1.png)

W ContentView używamy Image do wyświetlenia obrazu:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Uwaga: Image w SwiftUI nie obsługuje odtwarzania animacji GIF, może wyświetlać tylko statyczną klatkę.

### Kontrola rozmiaru obrazu

W SwiftUI Image domyślnie wyświetla obraz w jego oryginalnym rozmiarze. Jeśli chcemy zmienić rozmiar wyświetlania, najpierw musimy użyć resizable, aby obraz można było skalować, a następnie użyć frame do określenia rozmiaru układu.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modyfikator resizable

Modyfikator resizable pozwala obrazowi uczestniczyć w skalowaniu w układzie zamiast zawsze używać rozmiaru oryginalnego.

```swift
.resizable()
```

Dopiero po dodaniu resizable() frame może naprawdę zmienić rozmiar wyświetlanego obrazu.

Jeśli pominiemy resizable:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

frame zapewni tylko przestrzeń układu, ale sam rozmiar obrazu się nie zmieni.

### Modyfikator frame

frame(width:height) służy do określenia szerokości i wysokości widoku.

Podstawowe użycie:

```swift
.frame(width: 10,height: 10)
```

Na przykład ustawienie obrazu jako prostokąta o szerokości 300 i wysokości 100:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Można też ustawić tylko szerokość albo tylko wysokość:

```swift
.frame(width: 200)
.frame(height: 100)
```

Połączenie resizable + frame pozwala elastycznie kontrolować rozmiar obrazu w interfejsie, jednocześnie zachowując możliwość skalowania.

### Proporcje skalowania: scaledToFit i scaledToFill

Gdy używamy frame z szerokością i wysokością o innych proporcjach niż oryginalny obraz, obraz może zostać rozciągnięty i zniekształcony.

Jeśli chcemy zachować proporcje obrazu i jednocześnie dopasować go do dostępnej przestrzeni układu, możemy użyć scaledToFit albo scaledToFill.

**scaledToFit**

scaledToFit zachowuje oryginalne proporcje obrazu i skaluje go tak, aby całkowicie zmieścił się w dostępnej przestrzeni, bez przycinania:

```swift
.scaledToFit()
```

albo

```swift
.aspectRatio(contentMode: .fit)
```

To podejście nadaje się do sytuacji, w których chcemy wyświetlić cały obraz i uniknąć zniekształcenia.

Jeśli każdemu obrazowi ustawimy tę samą szerokość i wysokość, łatwo o rozciągnięcie obrazu.

Na przykład:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Bez ustawienia proporcji skalowania obraz nie będzie wyświetlany zgodnie z oryginalnymi proporcjami.

![Swift](../../RESOURCE/003_img4.png)

Ustawienie scaledToFit pozwala zachować oryginalne proporcje obrazu.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill również zachowuje proporcje obrazu, ale wypełnia całą dostępną przestrzeń. Jeśli proporcje się nie zgadzają, nadmiarowe części zostaną przycięte:

```swift
.scaledToFill()
```

albo

```swift
.aspectRatio(contentMode: .fill)
```

To podejście nadaje się do sytuacji, w których obraz ma pokryć cały obszar, na przykład jako tło lub banner. Sprawdza się szczególnie, gdy obraz jest używany jako tło.

**Różnica między nimi**

![Swift](../../RESOURCE/003_img6.png)

## Tekst

W SwiftUI do wyświetlania tekstu używa się Text.

Podstawowe użycie:

```swift
Text("FangJunyu")
```

W poprzedniej lekcji poznaliśmy Text. W tej lekcji pójdziemy krok dalej i nauczymy się kontrolować rozmiar oraz grubość czcionki, aby tekst był bardziej wyrazisty w widoku.

### Rozmiar czcionki

Do kontrolowania rozmiaru tekstu służy modyfikator font:

```swift
.font(.title)
```

Na przykład:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Często używane rozmiary czcionki, od największego do najmniejszego:

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Grubość czcionki

Jeśli chcemy pogrubić tekst, możemy użyć modyfikatora fontWeight:

```swift
.fontWeight(.bold)
```

Na przykład:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Często używane grubości czcionki, od najcieńszej do najgrubszej:

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font kontroluje rozmiar czcionki, a fontWeight jej grubość. Oba można łączyć, aby wzbogacić wygląd tekstu.

## Podsumowanie i praktyka

Do tej pory nauczyliśmy się podstaw SwiftUI związanych z domyślnym układem, Spacer, Image i Text. Ta wiedza już wystarcza do stworzenia kilku prostych widoków.

Na przykład: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Interfejs Google jest bardzo prosty i czysty. Zawiera obraz oraz tekst, więc możemy spróbować przeanalizować jego strukturę z perspektywy SwiftUI:

1. Całość można podzielić na trzy części: logo Google, pole wyszukiwania i tekst podpowiedzi. Można użyć VStack do pionowego ułożenia.
2. Logo Google jest obrazem, więc można użyć Image do jego wyświetlenia.
3. Pole wyszukiwania zawiera pole wprowadzania i ikonę. Jeśli na razie pominiemy samo pole wprowadzania, można użyć Image do wyświetlenia ikony wyszukiwania.
4. Tekst podpowiedzi wyświetlamy za pomocą Text, poziome ułożenie tekstu można zrealizować przez HStack, a kolor tekstu kontrolować przy użyciu foregroundStyle.

Ćwicząc te elementy wiedzy, możemy tworzyć proste widoki i pogłębiać zrozumienie widoków Image i Text oraz ich modyfikatorów.
