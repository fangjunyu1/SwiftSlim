# Licznik

W dwóch poprzednich lekcjach poznaliśmy zmienne, stałe, przyciski i funkcje.

W tej lekcji połączymy tę wiedzę i stworzymy prostą aplikację licznika.

W tym przykładzie nauczymy się, jak przechowywać i zmieniać zmienną oraz jak używać @State do zarządzania zmienną.

## Tworzenie licznika

Licznik zwykle służy do zapisywania wartości, która stale się zwiększa. Na przykład liczby skoków na skakance, liczby okrążeń podczas biegu i podobnych sytuacji.

Poniżej stworzymy prosty licznik: wyświetlimy liczbę i przycisk, a kliknięcie przycisku zwiększy tę liczbę.

![Num](../../RESOURCE/009_num.png)

### Wyświetlanie liczby

Najpierw użyjemy Text do wyświetlenia liczby.

```swift id="nha5vg"
Text("0")
```

Jeśli jednak liczba ma się zmieniać, nie możemy po prostu wpisać na stałe "0". Zamiast tego powinniśmy użyć zmiennej do przechowania liczby.

```swift id="ybgzfq"
var num = 0
```

Następnie wyświetlamy zmienną w Text:

```swift id="bqxytn"
Text("\(num)")
```

Tutaj używamy interpolacji łańcucha \(), aby zamienić liczbę na tekst i ją wyświetlić.

### Przycisk zwiększający liczbę

Następnie dodajemy przycisk.

```swift id="6ar5s3"
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Po kliknięciu przycisku chcemy, aby liczba wzrosła.

Dlatego możemy zmienić zmienną wewnątrz przycisku:

```swift id="6ur8dq"
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Ten fragment oznacza: po kliknięciu przycisku zostanie obliczone num + 1, a wynik zostanie przypisany z powrotem do num.

### Krótszy zapis

Swift udostępnia krótszy zapis:

```swift id="ugkb8z"
num += 1
```

Jest on równoważny z:

```swift id="80rcev"
num = num + 1
```

Taki zapis nazywa się „złożonym operatorem przypisania”.

Do często używanych złożonych operatorów przypisania w Swift należą:

```id="4qmvkv"
+=   przypisanie dodawania
-=   przypisanie odejmowania
*=   przypisanie mnożenia
/=   przypisanie dzielenia
%=   przypisanie reszty z dzielenia
```

Na przykład:

```swift id="m4myrd"
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Pełny kod

Teraz możemy napisać prosty licznik:

```swift id="yd81dm"
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Jednak w tym momencie kod nie będzie działał poprawnie.

### Pojawiający się błąd

Xcode pokaże komunikat:

```id="shk17v"
Cannot assign to property: 'self' is immutable
```

Oznacza to, że nie można zmienić właściwości, ponieważ widok jest niemodyfikowalny.

Dlaczego tak się dzieje?

## Jak działa SwiftUI

W SwiftUI **interfejs jest sterowany przez dane**, co oznacza, że gdy dane się zmieniają, interfejs automatycznie się odświeża.

Trzeba jednak pamiętać, że SwiftUI obserwuje zmiany i odświeża widok tylko wtedy, gdy zmienia się stan, na przykład @State albo @Binding.

Jeśli użyjemy zwykłej zmiennej, SwiftUI odczyta jej wartość tylko raz podczas tworzenia widoku. Później, nawet jeśli wartość zmiennej się zmieni, interfejs nie zostanie zaktualizowany.

Na przykład:

```swift id="mn8xmt"
var num = 0   // 0
num = 1   // 0
```

W powyższym przykładzie num jest zwykłą zmienną. Chociaż jej wartość się zmieniła, SwiftUI nie zaktualizuje widoku, więc interfejs nadal pokaże początkowe 0.

![Num](../../RESOURCE/009_state.png)

Dlatego tylko wtedy, gdy dane zostaną oznaczone jako stan, na przykład przy użyciu @State, @Binding i innych property wrapperów, SwiftUI automatycznie będzie obserwować ich zmiany i aktualizować widok.

## Property wrapper @State

W SwiftUI, jeśli chcemy zmieniać zmienną i jednocześnie aktualizować widok, musimy użyć @State.

```swift id="t8kq2y"
@State var num = 0
```

@State sprawia, że SwiftUI obserwuje tę zmienną.

Gdy wartość zmiennej się zmieni, SwiftUI ponownie obliczy widok i go zaktualizuje.

Pełny kod:

```swift id="nyeev3"
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Teraz, gdy klikniemy przycisk:

```swift id="8wmoxt"
num += 1
```

SwiftUI wykryje, że num się zmieniło, a następnie automatycznie zaktualizuje widok.

![Num](../../RESOURCE/009_state1.png)

## Zasady używania @State

W praktyce podczas programowania @State zwykle podlega dwóm zasadom.

### 1. @State zwykle używa private

Zmienne @State zwykle są używane tylko wewnątrz bieżącego typu, na przykład bieżącej struktury View, dlatego zazwyczaj zapisuje się je tak:

```swift id="r7cp0b"
@State private var num = 0
```

Dzięki temu inne widoki nie mogą bezpośrednio odczytywać ani zmieniać tej zmiennej.

Nie uczyliśmy się jeszcze private, więc na razie można to rozumieć tak:

**Treść oznaczona private może być używana tylko w bieżącym widoku, a widoki zewnętrzne nie mają do niej dostępu.**

### 2. @State służy tylko do stanu bieżącego widoku

@State nadaje się do danych zarządzanych przez sam bieżący View.

Na przykład do zawartości pola tekstowego albo stanu przełącznika.

```swift id="h8p3u7"
@State private var isOn = false
@State private var text = ""
```

Jeśli dane mają być współdzielone między wieloma widokami, trzeba użyć innych typów stanu, takich jak @Binding albo @Observable.

Tego nauczymy się w kolejnych lekcjach.

### Przycisk zmniejszania

Licznik oprócz zwiększania może też zmniejszać wartość.

Możemy dodać przycisk -.

```swift id="d8fdxj"
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Następnie używamy HStack, aby ustawić przyciski poziomo:

```swift id="ye68dz"
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Efekt:

![Num](../../RESOURCE/009_num1.png)

Po kliknięciu przycisku + liczba wzrośnie o 1, a po kliknięciu przycisku - zmniejszy się o 1.

### Przycisk resetowania

Możemy też dodać przycisk resetowania, który ustawi liczbę na 0.

```swift id="9q5qye"
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Po kliknięciu przycisku resetowania num otrzyma wartość 0.

Efekt:

![Num](../../RESOURCE/009_num2.png)

Po kliknięciu przycisku 0 liczba wraca do 0.

### Własny wygląd przycisku

Obecnie nasze przyciski mogą wyświetlać tylko tekst:

```swift id="x2upe6"
Button("+") {

}
```

Tak zapisany przycisk może wyświetlać wyłącznie treść tekstową, na przykład + albo -.

W praktycznym programowaniu zwykle chcemy, aby wygląd przycisku był bogatszy, na przykład z użyciem ikon albo innych widoków.

SwiftUI pozwala dostosować zawartość wyświetlaną przez przycisk. W tym celu można użyć innego zapisu Button:

```swift id="wpumc3"
Button(action: {

}, label: {

})
```

W tym zapisie action oznacza kod wykonywany po kliknięciu przycisku, a label oznacza widok wyświetlany na przycisku.

Na przykład możemy sprawić, że przycisk będzie wyświetlał ikonę SF Symbols:

```swift id="6r7nji"
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Dzięki temu przycisk nie wyświetla już tekstu, lecz ikonę.

### Ulepszenie interfejsu licznika

Aby interfejs licznika był czytelniejszy, możemy jeszcze poprawić sposób wyświetlania liczby. Na przykład powiększyć ją:

```swift id="z45132"
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Następnie zmienimy także zawartość przycisków na ikony i odpowiednio powiększymy rozmiar ikon:

```swift id="93lcxj"
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

W ten sam sposób możemy zamienić przycisk zmniejszania i przycisk resetowania na wersje z ikonami:

```swift id="jax7dl"
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Teraz przyciski wyświetlają ikony SF Symbols, a interfejs staje się bardziej intuicyjny.

![Num](../../RESOURCE/009_num3.png)

## Podsumowanie

W tej lekcji, tworząc prosty licznik, ćwiczyliśmy łączne użycie zmiennych, Text i Button. Użyliśmy zmiennej do przechowywania liczby i sterowaliśmy jej zwiększaniem oraz zmniejszaniem za pomocą przycisków, a przy okazji poznaliśmy złożone operatory przypisania, takie jak num += 1 i num -= 1.

W trakcie realizacji zrozumieliśmy też sposób działania SwiftUI: interfejs jest sterowany przez dane. Gdy dane się zmieniają, interfejs jest odświeżany. Dlatego trzeba używać @State do przechowywania zmiennego stanu. Kiedy zmienna @State się zmienia, SwiftUI automatycznie aktualizuje widok.

Na końcu lekko ulepszyliśmy interfejs, zmieniając styl czcionki Text oraz używając Button(action:label:) do dostosowania zawartości przycisku, tak aby przyciski mogły wyświetlać ikony. Dzięki temu interfejs licznika stał się czytelniejszy i ładniejszy.

Teraz poznaliśmy już podstawowy sposób używania widoków SwiftUI. W SwiftUI większość interfejsów jest sterowana przez zmienne. Gdy zmienne się zmieniają, SwiftUI automatycznie odświeża widok. Dlatego podczas tworzenia aplikacji w SwiftUI zwykle najpierw trzeba zaprojektować dane, które mają być przechowywane, a potem na ich podstawie zbudować interfejs i logikę interakcji.

## Pełny kod

```swift id="1yqzcg"
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
