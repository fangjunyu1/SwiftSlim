# Efektowne kolory

W tej lekcji nauczymy się często używanych wizualnych modyfikatorów w SwiftUI, w tym:

* kolorów
* koloru pierwszego planu
* koloru tła
* przesunięcia
* przezroczystości
* rozmycia

Poznamy także Safe Area (obszar bezpieczny).

Te modyfikatory służą do kontrolowania wyglądu widoków, dzięki czemu interfejs staje się bardziej przejrzysty i warstwowy.

## Kolory

W SwiftUI można ustawić kolor tekstu.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue oznacza kolor niebieski. W rzeczywistości jest to skrócona forma Color.blue, wynikająca z wnioskowania typu.

Do często używanych kolorów należą:

```id="duilw8"
.black
.green
.yellow
.pink
.gray
...
```

Wszystkie są statycznymi właściwościami typu Color.

![Color](../../RESOURCE/006_color.png)

Można traktować Color jako typ koloru, a .blue, .red i podobne jako jego konkretne wartości.

### Widok Color

W SwiftUI Color może być również wyświetlany jako widok.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Ten fragment kodu utworzy czerwony kwadrat o rozmiarze 100 × 100.

Można też sprawić, aby cały ekran był wypełniony jednym kolorem:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Po uruchomieniu można zauważyć, że czerwony kolor nie wypełnia całego ekranu — górna i dolna część iPhone’a nadal pozostają białe. Wynika to z istnienia Safe Area, czyli obszaru bezpiecznego.

## Safe Area (obszar bezpieczny)

Safe Area to obszar zarezerwowany przez system, aby treść nie została zasłonięta. Obejmuje on:

1. górny pasek statusu, czyli godzinę i poziom baterii

2. dolny pasek wskaźnika Home

3. obszar notcha albo Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Domyślnie SwiftUI ogranicza zawartość do obszaru bezpiecznego, dlatego widok nie rozciąga się aż do samych krawędzi ekranu.

### Ignorowanie Safe Area

Jeśli chcesz, aby kolor wypełnił cały ekran, możesz użyć ignoresSafeArea:

```swift
Color.red
    .ignoresSafeArea()
```

albo użyć edgesIgnoringSafeArea:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Wtedy widok rozciągnie się na cały ekran.

Warto zwrócić uwagę, że edgesIgnoringSafeArea to starszy zapis. Od iOS 14 zalecane jest używanie ignoresSafeArea.

## Kolor pierwszego planu

### Modyfikator foregroundStyle

We wcześniejszych lekcjach poznaliśmy foregroundStyle do ustawiania koloru.

Na przykład:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle to nowszy system stylów, który obsługuje kolory, gradienty, materiały i inne efekty.

![Color](../../RESOURCE/006_color2.png)

### Modyfikator foregroundColor

foregroundColor także może ustawiać kolor:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Sposób użycia jest taki sam jak w przypadku foregroundStyle.

W najnowszych wersjach Xcode pojawia się informacja, że foregroundColor może zostać wycofany w przyszłych wersjach iOS, dlatego zaleca się w pierwszej kolejności używać foregroundStyle.

## Tło

Jeśli chcesz dodać kolor tła do widoku, możesz użyć background:

```swift
background(.red)
```

Na przykład, aby dodać tło do tekstu:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Podobny efekt tła można zobaczyć przy zaznaczaniu tekstu w aplikacjach takich jak Word albo Chrome.

![Color](../../RESOURCE/006_color16.png)

Jeśli chcesz powiększyć obszar tła, musisz połączyć je z padding:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Tutaj trzeba zwrócić uwagę na jedną ważną zasadę:

W SwiftUI modyfikatory budują widok od góry do dołu. Modyfikator zapisany później działa na wynik utworzony przez wcześniejsze modyfikatory.

Dlatego:

```swift
.padding()
.background()
```

oznacza, że tło obejmie widok już po dodaniu wewnętrznego odstępu.

Jeśli odwrócisz kolejność:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

tło się nie powiększy, ponieważ nie obejmuje późniejszego padding.

## Przykład — nakrętka o czterech narożnikach

Teraz wykonamy prosty widok przypominający nakrętkę o czterech narożnikach.

![Color](../../RESOURCE/006_color8.png)

Najpierw utwórzmy biały kwadrat 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Jeśli chcemy zamienić go w koło, możemy użyć cornerRadius:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Gdy promień zaokrąglenia jest równy połowie szerokości i wysokości, kształt staje się kołem.

Teraz dodajmy niebieskie tło:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Nowo dodany padding powiększa zewnętrzny obszar, a background rysuje niebieski kolor na tym zewnętrznym obszarze.

W ten sposób uzyskaliśmy efekt nakrętki o czterech narożnikach.

### Inny sposób myślenia

Oprócz użycia koloru tła do zbudowania takiego efektu, można go także uzyskać za pomocą ZStack.

Wcześniej poznaliśmy ZStack jako układ nakładający widoki. Tę nakrętkę można również rozumieć jako połączenie koła i prostokąta wyświetlanych jeden na drugim.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack nakłada widoki w kolejności, a widoki dodane później pojawiają się na wierzchu.

## Przykład — dwa nachodzące na siebie koła

Wiele ikon składa się z prostych kształtów nałożonych na siebie, na przykład z dwóch nachodzących na siebie kół.

![Color](../../RESOURCE/006_color14.png)

Najpierw utwórzmy dwa koła:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Ponieważ chcemy, aby te dwa koła nakładały się na siebie, użyjemy układu ZStack:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

W tym momencie dwa koła o tym samym rozmiarze nakładają się całkowicie.

Chcemy, aby zachodziły na siebie tylko częściowo, a nie w pełni. Do tego można użyć offset, aby uzyskać efekt przesunięcia.

## Przesunięcie

offset zmienia tylko pozycję rysowania widoku i nie wpływa na obliczenia układu w widoku nadrzędnym.

Sposób użycia:

```swift
.offset(x:y:)
```

x oznacza przesunięcie w poziomie, a y przesunięcie w pionie.

Wartości dodatnie oznaczają przesunięcie w prawo albo w dół, a wartości ujemne w lewo albo w górę.

Użyjmy offset, aby dwa koła zachodziły na siebie częściowo:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Pozycja czerwonego koła w układzie się nie zmienia, ale jego pozycja rysowania przesuwa się o 25 punktów w lewo. Dzięki temu dwa koła dają wizualny efekt częściowego nałożenia.

## Przezroczystość

W SwiftUI opacity służy do ustawiania przezroczystości widoku.

Podstawowe użycie:

```swift
.opacity(0.5)
```

Zakres parametru opacity wynosi od 0.0 do 1.0, gdzie:

* 0 oznacza pełną przezroczystość
* 1 oznacza brak przezroczystości

Możemy użyć opacity, aby ustawić przezroczystość pomarańczowego koła:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Po ustawieniu opacity pomarańczowego koła na 0.8 jego krycie wynosi 80%. Gdy oba koła nachodzą na siebie, w obszarze nakładania pojawia się efekt mieszania kolorów.

## Rozmycie

W SwiftUI można użyć blur, aby dodać efekt rozmycia:

```swift
.blur(radius:10)
```

radius określa promień rozmycia. Im większa wartość, tym wyraźniejszy efekt rozmycia.

Możemy dodać efekt rozmycia do dwóch kół:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

W końcu zobaczymy dwa bardzo rozmyte koła.

## Podsumowanie

Ta lekcja koncentrowała się na często używanych wizualnych modyfikatorach w SwiftUI i pokazała, jak za ich pomocą kontrolować kolor, położenie oraz efekty wizualne widoków.

Dzięki konkretnym przykładom można zobaczyć rzeczywiste działanie różnych wizualnych modyfikatorów w interfejsie i jednocześnie zrozumieć pojęcie bezpiecznego obszaru.

Są to bardzo podstawowe modyfikatory. Warto dużo ćwiczyć i często ich używać, ponieważ pomaga to bardziej świadomie kontrolować wygląd interfejsu w praktycznym programowaniu.

### Ćwiczenia po lekcji

* dodaj efekt przezroczystości i rozmycia do jednego obrazu
* ustaw trzy koła o różnych poziomach przezroczystości, nakładające się na siebie
* utwórz obraz tła wypełniający cały ekran i ignorujący obszar bezpieczny
* użyj offset do zmiany położenia wielu widoków

Celem ćwiczeń nie jest zapamiętywanie API, lecz obserwowanie związku między zmianami wizualnymi a zachowaniem układu.
