# Karta kursu

Ta lekcja jest lekcją powtórkową po pewnym etapie nauki. Utworzymy w niej „kartę kursu”.

Dzięki temu ćwiczeniu możemy powtórzyć poznane wcześniej elementy, takie jak `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` i inne, a także nauczyć się łączyć wiele małych widoków w kompletny moduł widoku.

Efekt karty kursu:

![view](../../../Resource/026_view.png)

Ta karta kursu składa się głównie z kilku części:

- Poziom kursu: `Beginner`
- Zawartość kursu: `20+ Lessons`
- Tytuł kursu: `SwiftUI Beginner Tutorial`
- Opis kursu
- Przycisk: `Start Learning`
- Tło kursu: ikona Swift i tło w kolorze indygo

Możemy utworzyć ten widok w `ContentView`.

## Obszar górny

Najpierw utwórzmy górny obszar karty kursu.

![view](../../../Resource/026_view1.png)

Po lewej stronie obszaru górnego wyświetlany jest poziom kursu, a po prawej stronie zawartość kursu.

Ponieważ te dwa elementy są ułożone poziomo, możemy użyć `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Początkujący")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lekcji")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Tutaj wydzieliliśmy obszar górny jako właściwość obliczaną:

```swift
var topView: some View
```

Zaletą takiego podejścia jest to, że `body` pozostaje bardziej przejrzyste.

Obszar górny wykorzystuje głównie następujące elementy:

- `HStack`: układa dwa teksty poziomo.
- `Text`: wyświetla treść tekstową.
- `Spacer()`: przesuwa tekst po lewej stronie w lewo, a tekst po prawej stronie w prawo.
- `.font(.footnote)`: ustawia mniejszy styl tekstu.
- `.fontWeight(.bold)`: ustawia pogrubienie tekstu.
- `.foregroundStyle(Color.white)`: ustawia kolor pierwszego planu na biały.
- `.padding(.vertical, 10)`: ustawia pionowy odstęp wewnętrzny.
- `.padding(.horizontal, 16)`: ustawia poziomy odstęp wewnętrzny.
- `.background(Color.white.opacity(0.15))`: ustawia półprzezroczyste białe tło.
- `.cornerRadius(20)`: ustawia zaokrąglenie narożników.

Tutaj `Beginner` używa `.padding()` w dwóch kierunkach:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Dzięki temu tekst ma przestrzeń u góry, u dołu, po lewej i po prawej stronie, więc wygląda bardziej jak etykieta.

`Color.white.opacity(0.15)` oznacza biel o nieprzezroczystości `15%`, czyli bardzo delikatną biel.

### Dodawanie tła karty

Wcześniej utworzyliśmy `topView`, ale samo utworzenie widoku nie sprawia, że zostanie on automatycznie wyświetlony.

W SwiftUI treść, która rzeczywiście ma zostać pokazana na ekranie, musi zostać zapisana w `body`.

Dlatego możemy najpierw umieścić `topView` w `body`, aby go wyświetlić:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

W tym momencie zobaczymy, że obszar górny został już wyświetlony:

![view](../../../Resource/026_view2.png)

Ponieważ jednak tekst w `topView` jest biały, a domyślne tło też jest jasne, w trybie jasnym może być trudno go zobaczyć.

Dlatego możemy dodać na zewnątrz `VStack`, a następnie ustawić dla całego obszaru odstęp wewnętrzny, kolor tła i zaokrąglenie narożników:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Efekt wyświetlania:

![view](../../../Resource/026_view3.png)

W tym miejscu `VStack` zawiera na razie tylko jeden `topView`, więc może wyglądać, jakby nie był konieczny.

Później będziemy jednak dalej dodawać tytuł kursu, opis kursu i obszar przycisku. Wszystkie te elementy są ułożone pionowo, dlatego wcześniejsze użycie `VStack` ułatwi dalsze łączenie widoków.

W tym miejscu są dwa `.padding()`, a ich działanie jest różne.

Pierwszy `.padding(20)` jest zapisany przed `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Kontroluje on odstęp wewnętrzny karty, czyli odległość między treścią a krawędzią tła.

Drugi `.padding(30)` jest zapisany po `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Kontroluje on odstęp zewnętrzny karty, czyli odległość między całą kartą a krawędzią ekranu.

![view](../../../Resource/026_view4.png)

Dlatego nawet jeśli używamy tego samego `.padding()`, jego położenie w kodzie wpływa na rezultat.

## Obszar treści

Następnie utwórzmy obszar treści karty kursu.

Efekt wyświetlania:

![view](../../../Resource/026_view5.png)

Obszar treści zawiera tytuł kursu i opis kursu. Są one ułożone pionowo, więc używamy `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Samouczek SwiftUI dla początkujących")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Zacznij od zera ze SwiftUI i systematycznie ucz się deklaratywnego tworzenia interfejsów Apple. Dzięki jasnym wyjaśnieniom i praktycznym przykładom stopniowo opanujesz układ, interakcje i zarządzanie stanem, aby tworzyć piękne i użyteczne interfejsy aplikacji.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/026_view6.png)

W tym `VStack` użyliśmy dwóch parametrów:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` oznacza, że widoki wewnątrz `VStack` są wyrównane do lewej strony.

`spacing: 10` oznacza, że między widokami wewnątrz `VStack` zachowany jest odstęp `10 pt`.

Dlatego tytuł kursu i opis kursu będą układać się od lewej strony, a między nimi pozostanie pewna odległość.

Opis kursu jest dość długi. Gdyby został wyświetlony w całości, karta stałaby się bardzo wysoka, dlatego tutaj używamy `.lineLimit()`, aby ograniczyć liczbę wyświetlanych wierszy:

```swift
.lineLimit(3)
```

Oznacza to maksymalnie `3` wiersze. Gdy treść przekroczy ten limit, nadmiarowa część zostanie pominięta.

### Wyrównanie widoku do lewej

Tutaj trzeba zwrócić uwagę na jeszcze jedną rzecz.

`VStack(alignment: .leading)` może kontrolować tylko sposób wyrównania widoków wewnątrz `VStack`. Nie kontroluje bezpośrednio położenia samego `VStack` w zewnętrznym kontenerze.

Na przykład, jeśli opis kursu jest krótki:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Samouczek SwiftUI dla początkujących")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Przykładowa treść.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Efekt wyświetlania:

![view](../../../Resource/026_view7.png)

Możemy zobaczyć, że tytuł kursu i opis kursu są wprawdzie wyrównane do lewej wewnątrz `VStack`, ale cały `VStack` nie przylega do lewej krawędzi karty.

Dzieje się tak dlatego, że gdy treść jest krótka, szerokość `VStack` również jest dość mała. Podczas układania zewnętrzny kontener może umieścić ten węższy `VStack` pośrodku.

Można to rozumieć tak: `VStack(alignment: .leading)` odpowiada za wyrównanie wewnętrzne do lewej.
Ale nie odpowiada za przesunięcie całego obszaru treści do skrajnej lewej strony.

Jeśli chcemy, aby cały obszar treści naprawdę przylegał do lewej, możemy owinąć go na zewnątrz kolejnym `HStack` i dodać `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Samouczek SwiftUI dla początkujących")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Przykładowa treść.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/026_view8.png)

Tutaj `HStack` jest układem poziomym.

`Spacer()` zajmie pozostałą przestrzeń po prawej stronie, dzięki czemu przesunie lewy `VStack` do skrajnej lewej strony.

Dlatego `HStack + Spacer()` może służyć do kontrolowania położenia całego obszaru treści.

W rzeczywistej karcie kursu opis kursu jest dość długi i zwykle zajmuje większą szerokość, więc ten problem niekoniecznie będzie widoczny. Jednak zrozumienie tej różnicy jest ważne, ponieważ przy tworzeniu układów z krótkim tekstem często spotkamy podobne sytuacje.

### Kontrolowanie odległości między widokami wewnętrznymi

Wcześniej zapisaliśmy w `VStack` parametr `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` służy do kontrolowania odległości między widokami wewnętrznymi.

Jeśli nie ustawimy `spacing`, `VStack` także będzie mieć domyślny odstęp, ale domyślny odstęp nie zawsze odpowiada efektowi, którego chcemy.

Tutaj tytuł kursu i opis kursu wyglądałyby zbyt ciasno, gdyby były zbyt blisko siebie, więc używamy:

```swift
spacing: 10
```

aby zostawić między nimi trochę miejsca.

Efekt wyświetlania:

![view](../../../Resource/026_view9.png)

Podobnie obszar górny i obszar treści również są ułożone pionowo, więc także możemy użyć `spacing`, aby kontrolować odległość między nimi.

Teraz umieśćmy `topView` i `contentView` w `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/026_view10.png)

Tutaj `VStack(spacing: 20)` kontroluje odległość między `topView` i `contentView`.

Innymi słowy:

```swift
VStack(alignment: .leading, spacing: 10)
```

kontroluje odległość między tytułem kursu i opisem kursu.

```swift
VStack(spacing: 20)
```

kontroluje odległość między obszarem górnym i obszarem treści.

Oba są `spacing`, ale działają na różnych `VStack`, więc wpływają na różne zakresy.

W ten sposób widok obszaru treści jest gotowy.

## Obszar przycisku

Następnie utwórzmy dolny obszar przycisku.

Efekt wyświetlania:

![view](../../../Resource/026_view11.png)

Obszar przycisku składa się głównie z ikony odtwarzania i krótkiego tekstu.

Możemy użyć `Image`, aby wyświetlić ikonę odtwarzania, oraz `Text`, aby wyświetlić tekst przycisku.

Najpierw utwórzmy wygląd przycisku:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("kliknięto przycisk")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Rozpocznij naukę")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/026_view12.png)

Tutaj użyliśmy dwóch `HStack`:

Wewnętrzny `HStack` służy do poziomego ułożenia ikony i tekstu:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Rozpocznij naukę")
}
```

Zewnętrzny `HStack` w połączeniu ze `Spacer()` służy do wyrównania wyglądu przycisku do lewej strony:

```swift
HStack {
    ...
    Spacer()
}
```

Po kliknięciu przycisku w konsoli zostanie wypisane `kliknięto przycisk`.

## Podstawowa karta jest gotowa

Teraz połączmy obszar górny, obszar treści i obszar przycisku:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efekt wyświetlania:

![view](../../../Resource/026_view13.png)

Do tego momentu podstawowa karta kursu jest już gotowa.

## Tło z ikoną Swift

Na koniec dodajmy do karty półprzezroczyste tło z ikoną Swift.

![view](../../../Resource/026_view.png)

Wcześniej użyliśmy `Color.indigo` jako koloru tła. W rzeczywistości `.background()` może dodawać nie tylko kolor, ale także kompletny widok.

Dlatego możemy najpierw utworzyć osobny widok tła:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

W tym widoku tła używamy `VStack`, `HStack` i `Spacer()`, aby przesunąć ikonę Swift do prawego dolnego rogu.

Ponieważ ikona Swift pełni tylko funkcję dekoracyjnego tła, używamy tutaj półprzezroczystej bieli:

```swift
Color.white.opacity(0.15)
```

Dzięki temu ikona nie będzie zbyt wyraźna i nie będzie przeszkadzać treści znajdującej się z przodu.

Następnie dodajmy `backgroundView` do karty:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efekt końcowy:

![view](../../../Resource/026_view14.png)

Tutaj użyliśmy kolejno dwóch `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Pierwszy `.background()` służy do dodania tła z ikoną Swift.
Drugi `.background()` służy do dodania tła w kolorze indygo.

W ten sposób ikona Swift zostanie wyświetlona nad tłem w kolorze indygo i stanie się częścią tła karty.

Widać więc, że `.background()` może dodawać nie tylko kolor, ale także widok niestandardowy. Wiele `.background()` można również łączyć, aby uzyskać bogatsze efekty tła.

Do tego momentu kompletna karta kursu jest gotowa.

## Podsumowanie

W tej lekcji, poprzez utworzenie karty kursu, powtórzyliśmy częste podstawowe sposoby układania widoków w SwiftUI.

Użyliśmy `Text` do wyświetlania tekstu, `Image` do wyświetlania ikony systemowej oraz `VStack`, `HStack` i `Spacer()` do kontrolowania rozmieszczenia widoków.

Nauczyliśmy się używać `.lineLimit()`, które może ograniczyć maksymalną liczbę wyświetlanych wierszy tekstu. Gdy treść przekroczy ten limit, nadmiarowa część zostanie pominięta.

Jednocześnie powtórzyliśmy także częste modyfikatory, takie jak `.padding()`, `.background()`, `.cornerRadius()` i `.foregroundStyle()`.

Po ukończeniu tej lekcji potrafimy już łączyć wiele małych widoków w kompletny moduł karty.

Jest to również bardzo częsty sposób myślenia w programowaniu SwiftUI: najpierw dzielimy interfejs na małe widoki, a potem łączymy je w pełny ekran.

## Pełny kod

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Początkujący")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lekcji")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Samouczek SwiftUI dla początkujących")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Zacznij od zera ze SwiftUI i systematycznie ucz się deklaratywnego tworzenia interfejsów Apple. Dzięki jasnym wyjaśnieniom i praktycznym przykładom stopniowo opanujesz układ, interakcje i zarządzanie stanem, aby tworzyć piękne i użyteczne interfejsy aplikacji.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("kliknięto przycisk")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Rozpocznij naukę")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
