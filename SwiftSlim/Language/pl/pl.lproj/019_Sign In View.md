# Widok logowania

W tej lekcji nauczymy się bardzo praktycznego scenariusza, czyli widoku logowania.

Niezależnie od tego, czy jest to strona internetowa, czy aplikacja, podczas korzystania bardzo często użytkownik musi zalogować się na konto i wpisać hasło.

Na przykład strona logowania GitHub:

![WordPress](../../Resource/019_github.png)

W tej lekcji stworzymy podobny widok logowania, aby użytkownik mógł ręcznie wpisać konto i hasło oraz sprawdzić, czy z wprowadzoną treścią nie ma problemu.

## Górny układ

Kod widoku logowania napiszemy w pliku `ContentView`.

Najpierw utworzymy obszar identyfikacyjny u góry widoku logowania. Możesz wcześniej przygotować odpowiednią ikonę i umieścić ją w folderze `Assets`.

![icon](../../Resource/019_icon1.png)

Następnie użyj `Image` i modyfikatorów, aby wyświetlić obraz:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Kilka tych modyfikatorów oznacza:

- `resizable()`: pozwala zmieniać rozmiar obrazu.
- `scaledToFit()`: skaluje obraz z zachowaniem jego pierwotnych proporcji.
- `frame(width: 100)`: ustawia szerokość wyświetlanego obrazu na `100`.

Następnie użyj `Text` i modyfikatorów, aby wyświetlić tytuł logowania:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Potem użyj `VStack`, aby ułożyć obraz i tekst jeden pod drugim:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Efekt:

![view](../../Resource/019_view.png)

W tym miejscu ukończyliśmy górny obszar tytułu widoku logowania.

### Optymalizacja układu

Teraz obraz i tytuł domyślnie znajdują się w środkowej części całego układu.

Jeśli chcemy, aby bardziej przypominały „znacznik logowania u góry strony”, możemy użyć `Spacer()`, aby rozciągnąć pozostałą przestrzeń i sprawić, że zawartość będzie wyświetlana bliżej góry.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Efekt:

![view](../../Resource/019_view1.png)

Jednak teraz `Image` i `Text` znajdują się zbyt blisko górnej krawędzi ekranu i wyglądają trochę zbyt ciasno.

W tym momencie możemy użyć `padding`, aby dodać górny odstęp do całego `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Efekt:

![view](../../Resource/019_view2.png)

Dzięki temu obszar tytułu na górze strony wygląda odpowiedniej.

## Nazwa użytkownika i hasło

Strona logowania zwykle wymaga od użytkownika wpisania nazwy użytkownika i hasła.

W SwiftUI możemy użyć `TextField`, aby odbierać treść wpisywaną przez użytkownika.

Ale pamiętaj: `TextField` sam z siebie nie przechowuje długoterminowo wpisanych danych, jest tylko kontrolką wejściową. To, co naprawdę przechowuje tę treść, to zmienne, które do niego przypiszemy.

Dlatego najpierw musimy utworzyć dwie zmienne `@State`, aby przechowywać nazwę użytkownika i hasło:

```swift
@State private var user = ""
@State private var password = ""
```

Gdy wartość zmiennej `@State` się zmienia, SwiftUI automatycznie odświeża powiązany widok.

Następnie użyj `TextField`, aby powiązać te dwie zmienne:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Tutaj `$user` i `$password` oznaczają „wiązanie”.

Oznacza to, że gdy użytkownik wpisuje tekst w polu, zmienna zmienia się jednocześnie; a gdy zmienna się zmienia, zawartość wyświetlana w polu również zmienia się jednocześnie.

Ta relacja, w której „widok i dane synchronizują się wzajemnie”, to właśnie wiązanie.

Zwróć uwagę, że tutaj trzeba użyć zapisu z `$`:

```swift
$user
```

Ponieważ `TextField` nie potrzebuje zwykłego łańcucha znaków, ale wartości powiązania, która „może modyfikować dane w obie strony”.

### Wyświetlanie pól wejściowych

Umieśćmy je w `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efekt wyświetlania:

![view](../../Resource/019_view3.png)

Ponieważ teraz `user` i `password` domyślnie są pustymi łańcuchami:

```swift
""
```

Pole wejściowe najpierw wyświetli tekst zastępczy, na przykład:

```swift
input user
```

Ten tekst tylko podpowiada użytkownikowi „co należy tu wpisać” i nie jest rzeczywistą treścią wejściową.

### Optymalizacja pól wejściowych

Teraz pola wejściowe są już używalne, ale domyślny styl jest dość prosty.

Dla większej czytelności interfejsu możemy dodać tytuł przed polem wejściowym i lekko poprawić styl samego pola.

Na przykład najpierw dodajmy tytuł:

```swift
Text("Username")
    .fontWeight(.bold)
```

Następnie użyj `HStack`, aby umieścić tytuł i pole wejściowe w jednym wierszu:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Tutaj używamy `HStack`, ponieważ chcemy „wyświetlić tytuł po lewej stronie, a pole wejściowe po prawej”.

Warto zauważyć, że `TextField` domyślnie zajmuje pozostałą dostępną przestrzeń.

![color](../../Resource/019_view6.png)

Aby rozmiary dwóch pól wejściowych były bardziej jednolite, możemy użyć `frame(width:)`, aby ustawić dla nich szerokość i sprawić, że będą wyglądały bardziej równo.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Następnie dodaj obramowanie, aby pole wejściowe było bardziej widoczne:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Teraz dodajmy zarówno nazwę użytkownika, jak i hasło do widoku `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efekt wyświetlania:

![view](../../Resource/019_view4.png)

W tym miejscu użytkownik może już wpisać nazwę użytkownika i hasło.

## Przycisk logowania

Poniżej dodamy przycisk logowania pod polami wejściowymi.

```swift
Button("Sign in") {

}
```

Następnie użyj `buttonStyle`, aby nadać przyciskowi bardziej widoczny styl systemowy:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Efekt wyświetlania:

![view](../../Resource/019_view5.png)

Aby potwierdzić, że przycisk rzeczywiście reaguje na kliknięcie, możemy najpierw wpisać w przycisku `print` jako test:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Po kliknięciu przycisku konsola wypisze:

```swift
click Sign in
```

To pokazuje, że przycisk poprawnie reaguje na kliknięcie.

## Logika logowania

Teraz dodamy do przycisku logowania najbardziej podstawową logikę walidacji: **sprawdzenie, czy użytkownik wpisał nazwę użytkownika i hasło**.

Chcemy zrealizować następujące sytuacje:

- Jeśli użytkownik nic nie wpisał, wypisz `Empty`
- Jeśli użytkownik wpisał tylko jedną z tych rzeczy, podpowiedz, której brakuje
- Jeśli zarówno nazwa użytkownika, jak i hasło zostały wpisane, wypisz `Success`

### Nie wpisano żadnych informacji

Ponieważ `user` i `password` domyślnie są pustymi łańcuchami:

```swift
@State private var user = ""
@State private var password = ""
```

Więc gdy użytkownik nic nie wpisze, nadal pozostają puste.

W Swift typy takie jak `String` mogą używać `isEmpty`, aby sprawdzić, czy zawartość jest pusta.

### Właściwość isEmpty

`isEmpty` jest często używane do sprawdzania, czy ciągi znaków, tablice i inne treści są puste.

Na przykład:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Jeśli zawartość jest pusta, `isEmpty` zwraca `true`; jeśli zawartość nie jest pusta, `isEmpty` zwraca `false`.

Dlatego możemy użyć tego do sprawdzenia, czy nazwa użytkownika i hasło zawierają jakąkolwiek treść.

### Używanie isEmpty do sprawdzania zmiennych

Jeśli użytkownik nie wpisał żadnych informacji, wtedy:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Wtedy możemy zapisać warunek w ten sposób:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Ten kod oznacza: jeśli `user` jest puste i `password` też jest puste, to wypisz:

```swift
Empty
```

Tutaj `&&` jest operatorem logicznym oznaczającym „i”.

To znaczy, że gdy warunek po lewej stronie jest spełniony i warunek po prawej stronie również jest spełniony, cały warunek jest spełniony.

Dlatego ten kod wykona się tylko wtedy, gdy zarówno nazwa użytkownika, jak i hasło są puste.

## Użytkownik wypełnił tylko część

Następnie rozważmy inną sytuację: użytkownik wpisał tylko nazwę użytkownika albo tylko hasło.

Na przykład:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Wtedy nazwa użytkownika nie jest pusta, ale hasło jest puste.

Możemy dalej używać `isEmpty`, aby to sprawdzić:

### Sytuacja, gdy użytkownik wpisał konto lub hasło

Jeśli użytkownik wpisał tylko nazwę użytkownika albo tylko hasło, musimy wyświetlić odpowiednią wskazówkę, czego brakuje.

Na przykład, gdy użytkownik wpisał tylko nazwę użytkownika:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logika tego kodu jest taka: jeśli nazwa użytkownika jest pusta, poproś o jej wpisanie. W przeciwnym razie sprawdź, czy hasło jest puste; jeśli hasło jest puste, poproś o wpisanie hasła.

### Użytkownik wpisał wszystkie informacje

Jeśli zarówno nazwa użytkownika, jak i hasło zostały już wpisane, wtedy `isEmpty` dla obu zwróci `false`.

Wtedy możemy zapisać to tak:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Tutaj `!` oznacza „negację”.

Na przykład:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

To znaczy, że `user.isEmpty` służy do sprawdzenia „czy nazwa użytkownika jest pusta”, a `!user.isEmpty` służy do sprawdzenia „czy nazwa użytkownika nie jest pusta”.

Dla hasła obowiązuje ta sama logika.

Tak więc znaczenie tego kodu jest takie: nazwa użytkownika nie jest pusta i hasło również nie jest puste.

Gdy oba te warunki są spełnione, wypisywane jest:

```swift
Success
```

## Pełna logika walidacji

Teraz połączmy te trzy sytuacje i zapiszmy je w `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Kolejność wykonywania tego kodu można zrozumieć w ten sposób:

Pierwszy krok, najpierw sprawdzamy:

```swift
if user.isEmpty && password.isEmpty
```

Jeśli zarówno nazwa użytkownika, jak i hasło są puste, od razu wypisywane jest `Empty`.

Jeśli oba nie są puste, program przechodzi do sprawdzenia tego wiersza:

```swift
else if user.isEmpty || password.isEmpty
```

Tutaj `||` oznacza „lub”.

To znaczy, że jeśli choć jeden warunek jest spełniony, całe wyrażenie jest spełnione.

Dlatego, dopóki nazwa użytkownika jest pusta albo hasło jest puste, zostanie wykonany blok kodu `else if`.

Po wejściu do bloku kodu dalej sprawdzamy, które dokładnie pole wejściowe nie zostało uzupełnione:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Jeśli dwa poprzednie warunki nie są spełnione, oznacza to, że nazwa użytkownika nie jest pusta, a hasło również nie jest puste.

Wtedy program przejdzie do ostatniego `else`:

```swift
print("Success")
```

W ten sposób ukończyliśmy najbardziej podstawową logikę walidacji danych logowania.

## Sprawdzanie nazwy użytkownika i hasła

Powyższa logika sprawdza jedynie „czy jakakolwiek treść została wpisana”.

Ale w prawdziwej aplikacji samo wpisanie treści nie wystarczy. Zwykle trzeba jeszcze wysłać nazwę użytkownika i hasło na serwer w celu weryfikacji.

Jeśli serwer potwierdzi, że nazwa użytkownika istnieje i hasło jest poprawne, logowanie zostanie dozwolone; w przeciwnym razie wyświetli się informacja o niepowodzeniu logowania.

Aby przećwiczyć ten proces, możemy najpierw ustawić w kodzie tymczasowe konto i hasło, symulując „prawidłowe dane logowania”:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Gdy zarówno nazwa użytkownika, jak i hasło nie są puste, porównujemy je dalej, aby sprawdzić, czy są poprawne:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Tutaj `==` oznacza „czy są równe”.

Na przykład:

```swift
user == userID
```

Oznacza to, czy wpisana przez użytkownika nazwa użytkownika jest dokładnie taka sama jak poprawna nazwa użytkownika, którą ustawiliśmy. Dla hasła obowiązuje ta sama logika.

Dlatego gdy wpisana nazwa użytkownika i hasło są równe ustawionym wartościom, wypisywane jest `Success`; jeśli choć jedna z nich nie jest równa, wypisywane jest `Input error`.

W ten sposób ukończyliśmy prostą „symulowaną weryfikację logowania”.

Chociaż nie jest to jeszcze prawdziwa funkcja logowania połączona z serwerem, to już w zupełności wystarcza, aby pomóc nam zrozumieć: **po kliknięciu przycisku można wykonywać różny kod w zależności od różnych warunków**.

## Podsumowanie

W tej lekcji ukończyliśmy podstawowy widok logowania i skupiliśmy się na nauce „logiki oceniania treści wejściowej na podstawie warunków”.

Sednem tej lekcji jest używanie `isEmpty` do sprawdzania, czy ciąg znaków jest pusty, oraz używanie instrukcji `if` w połączeniu z operatorami logicznymi do obsługi różnych sytuacji.

Dwa bardzo ważne operatory logiczne to:

- `&&`: oznacza „i”, oba warunki muszą być spełnione
- `||`: oznacza „lub”, wystarczy, że jeden warunek będzie spełniony

Gdy te warunki ostatecznie dają `true` lub `false`, instrukcja `if` wykonuje różny kod w zależności od wyniku.

Dzięki temu widokowi logowania zaczęliśmy już poznawać sposób tworzenia aplikacji łączący „interfejs + dane + ocenę logiczną”.

## Pełny kod

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
