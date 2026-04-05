# Interakcje logowania

W poprzedniej lekcji utworzyliśmy widok logowania i za pomocą przycisków oraz logiki warunkowej zrealizowaliśmy proste sprawdzanie poprawności wprowadzonych danych.

W tej lekcji będziemy dalej rozwijać kod z poprzedniej lekcji, aby poznać pole wprowadzania hasła `SecureField`, okno ostrzeżenia `Alert` oraz sposób sterowania wyświetlaniem różnych widoków na podstawie zmiennych.

Dzięki tej lekcji możesz lepiej zrozumieć podstawowy przepływ interakcji w widoku logowania. To także podstawowa logika często używana w wielu aplikacjach.

## Pole wprowadzania hasła

W poprzedniej lekcji używaliśmy `TextField` do wpisywania hasła.

Jednak w prawdziwym interfejsie logowania hasło zwykle nie jest wyświetlane bezpośrednio. Zamiast tego pojawia się jako kropki lub w innej ukrytej formie, co pomaga chronić prywatność użytkownika.

W SwiftUI kontrolką przeznaczoną specjalnie do wprowadzania haseł jest `SecureField`.

Na przykład:

```swift
SecureField("Password", text: $password)
```

Jego składnia jest bardzo podobna do `TextField`. Również wymaga tekstu podpowiedzi i powiązanej zmiennej.

Można to prosto zrozumieć tak: `SecureField` także jest polem tekstowym, ale ukrywa wprowadzaną zawartość.

Możemy bezpośrednio zamienić `TextField`, którego wcześniej używaliśmy do wpisywania hasła, na `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Gdy użytkownik wpisuje hasło, jego treść nie będzie już bezpośrednio widoczna w interfejsie.

Efekt wyświetlania:

![password](../../Resource/020_password.png)

Teraz możemy wprowadzić nazwę użytkownika i hasło, a następnie kliknąć przycisk, aby sprawdzić, czy dane są poprawne.

### Wyświetlanie komunikatów zwrotnych

Wcześniej cały czas używaliśmy `print` do wypisywania wyników.

Zawartość `print` pojawia się tylko w konsoli. Programista może ją zobaczyć podczas uruchamiania programu w Xcode, ale zwykły użytkownik na telefonie nie widzi tych komunikatów.

Oznacza to, że mimo iż program zakończył już sprawdzanie, użytkownik nadal nie wie, czy wpisane dane są poprawne.

W tym momencie potrzebujemy sposobu, aby wyświetlić komunikat bezpośrednio w interfejsie.

## Okno ostrzeżenia Alert

W SwiftUI możemy użyć `Alert`, aby wyświetlić wyskakujące okno komunikatu.

Podstawowe użycie:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Ten kod wygląda trochę bardziej skomplikowanie niż poprzednie kontrolki, ale możemy go zrozumieć, rozkładając go na części.

`Alert` składa się głównie z następujących elementów:

- `"Title"`: tytuł okna ostrzeżenia
- `isPresented`: powiązana wartość logiczna służąca do sterowania tym, czy okno ostrzeżenia jest wyświetlane
- `Button(...)`: przycisk w oknie ostrzeżenia
- `message:`: treść komunikatu wyświetlana w oknie ostrzeżenia

Można to prosto zrozumieć tak: gdy powiązana zmienna stanie się `true`, system wyświetli to okno ostrzeżenia.

Efekt wyświetlania:

![alert](../../Resource/020_alert3.png)

Odpowiadająca struktura:

![alert](../../Resource/020_alert.png)

### Alert jest modyfikatorem

Podobnie jak wiele modyfikatorów, których uczyliśmy się wcześniej, `Alert` również dodaje się po określonym widoku.

Na przykład może być dołączony po przycisku:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Może też być dołączony po zewnętrznym `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

To oznacza, że `Alert` nie jest samodzielnym widokiem umieszczanym niezależnie w interfejsie. Zamiast tego jest modyfikatorem dołączonym do określonego widoku.

Można to prosto zrozumieć tak: `Alert` zwykle zapisuje się po przycisku albo po zewnętrznym układzie, aby wyświetlić komunikat po spełnieniu określonego warunku.

### Wyświetlanie Alert

Jeśli chcemy wyświetlić `Alert`, potrzebujemy zmiennej, która będzie nim sterować.

Na przykład:

```swift
@State private var showAlert = false
```

Ta zmienna ma typ `Bool`, czyli tylko dwie wartości: `true` albo `false`.

Następnie powiąż ją z `isPresented` w `Alert`:

```swift
isPresented: $showAlert
```

Gdy `showAlert` ma wartość `false`, okno ostrzeżenia się nie pojawi. Gdy `showAlert` ma wartość `true`, okno ostrzeżenia zostanie wyświetlone.

### Wyświetlanie okna ostrzeżenia za pomocą przycisku

Teraz najpierw zrealizujmy najprostszy scenariusz:

Gdy użytkownik nic nie wpisze i od razu kliknie przycisk `Sign in`, wyświetl okno komunikatu informujące go, że jeszcze nic nie wprowadził.

Najpierw utwórz zmienną sterującą tym oknem komunikatu:

```swift
@State private var showEmpty = false
```

Następnie dodaj `Alert` po `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Kolejno wykonaj sprawdzenie w kodzie kliknięcia przycisku:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Jeśli zarówno `user`, jak i `password` są puste, ustaw `showEmpty` na `true`.

A ponieważ `Alert` jest powiązany z tą zmienną, gdy stanie się ona `true`, system automatycznie wyświetli okno ostrzeżenia.

Efekt wyświetlania:

![alert](../../Resource/020_alert1.png)

Dzięki temu po kliknięciu przycisku użytkownik może natychmiast zobaczyć komunikat, a programista nie musi sprawdzać wyniku `print` w konsoli.

### Udoskonalenie przycisku i okien ostrzeżeń

Wcześniej obsłużyliśmy tylko sytuację, gdy „nic nie zostało wpisane”.

Nadal musimy obsłużyć następujące sytuacje:

- brak nazwy użytkownika
- brak hasła
- nazwa użytkownika i hasło zostały wpisane, ale dane są niepoprawne

Dlatego musimy też przygotować odpowiednie komunikaty dla tych przypadków.

Najpierw dodaj trzy nowe zmienne:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Następnie dalej dodawaj odpowiednie `Alert` po przycisku:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Następnie uzupełnij logikę warunkową w przycisku:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Gdy przycisk wykryje, że użytkownik nie wpisał żadnych informacji, pominął jedną z nich albo walidacja danych się nie powiodła, odpowiednia zmienna logiczna zostanie ustawiona na `true`, a następnie pojawi się odpowiedni `Alert`.

Tutaj polecam samodzielnie przetestować kilka sytuacji:

- nic nie wpisywać
- wpisać tylko nazwę użytkownika
- wpisać tylko hasło
- wpisać nazwę użytkownika i hasło, ale z niepoprawną treścią
- wpisać nazwę użytkownika i hasło, a treść jest poprawna

Pomaga to sprawdzić, czy w naszym kodzie nie ma problemów. To także bardzo ważny etap „testowania” w tworzeniu aplikacji.

Jeśli w jakimś scenariuszu program zachowuje się niepoprawnie, oznacza to, że w logice może występować problem i w programie pojawił się `Bug`.

To, co w programowaniu zwykle nazywa się `Bug`, oznacza błąd, usterkę albo zachowanie niezgodne z oczekiwaniami.

## Dokończenie widoku logowania

Przykłady `Alert`, o których mówiliśmy wcześniej, dotyczyły sposobu informowania użytkownika, gdy „wprowadzone dane są błędne”.

Gdy użytkownik wpisze poprawną nazwę użytkownika i hasło, zazwyczaj nie wyświetlamy „okna ostrzeżenia”. Zamiast tego bezpośrednio przechodzimy do interfejsu po zalogowaniu.

To dotyczy bardzo ważnego pojęcia: **wyświetlania różnych widoków na podstawie wartości zmiennej.**

Na przykład:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Tutaj używamy typu `Bool` do zarządzania tym, który widok jest wyświetlany:

- jeśli `login` ma wartość `true`, oznacza to, że logowanie zakończyło się sukcesem i wyświetlana jest zawartość po zalogowaniu
- jeśli `login` ma wartość `false`, oznacza to, że logowanie się nie powiodło i nadal wyświetlany jest interfejs logowania.

Choć instrukcja `if` jest w Swift instrukcją warunkową, w `body` SwiftUI może służyć do sterowania logiką wyświetlania widoków.

Oznacza to, że SwiftUI określa, który widok powinien być aktualnie pokazany, na podstawie wyniku warunku.

Możemy umieścić tę logikę wyświetlania w bieżącym `ContentView`:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Kod oryginalnego widoku logowania
		}
	}
}
```

Tutaj dodaliśmy nową zmienną `login`, aby wskazać, czy użytkownik zalogował się pomyślnie.

Następnie umieściliśmy kod widoku logowania, który wcześniej napisaliśmy, po instrukcji `else`.

Logika wyświetlania widoku:

- gdy `login` ma wartość `false`, oznacza to, że logowanie jeszcze się nie powiodło, więc nadal wyświetlany jest oryginalny widok logowania.
- gdy `login` ma wartość `true`, oznacza to, że logowanie zakończyło się sukcesem. W tym momencie widok logowania nie jest już pokazywany, a zamiast niego wyświetla się `Login successful`.

Oznacza to, że `ContentView` będzie pokazywać różną zawartość widoku w zależności od wartości `login`.

Następnie zmodyfikujmy logikę sukcesu logowania wewnątrz przycisku:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Gdy nazwa użytkownika i hasło wpisane przez użytkownika są poprawne, ustawiamy `login` na `true`.

Gdy tylko wartość `login` się zmieni, wynik sprawdzenia `if` w `ContentView` również się zmieni, a interfejs przełączy się z oryginalnego widoku logowania na `Login successful`.

Efekt wyświetlania wygląda następująco:

![view](../../Resource/020_view.png)

Teraz naprawdę zastosowaliśmy ideę „wyświetlania różnych widoków w zależności od warunków” w tej bieżącej stronie logowania.

W prawdziwych aplikacjach zwykle działa to właśnie w ten sposób: różne widoki są wyświetlane na podstawie określonej wartości.

Na przykład gdy użytkownik nie jest zalogowany, wyświetlana jest strona logowania. Po pomyślnym zalogowaniu wyświetlany jest inny interfejs.

Podstawowa idea jest taka: **używać zmian zmiennych do sterowania tym, jaką zawartość pokazuje interfejs.**

## Podsumowanie

W tej lekcji nauczyliśmy się trzech ważnych rzeczy:

1. Używać `SecureField` do wprowadzania haseł, aby ich treść nie była bezpośrednio widoczna w interfejsie.
2. Używać `Alert` do wyświetlania użytkownikowi komunikatów zamiast wypisywać je tylko w konsoli.
3. Używać zmiennych i warunków `if` do sterowania wyświetlaniem różnych widoków, co pozwala przełączać się między interfejsem przed zalogowaniem a po zalogowaniu.

Dzięki poznaniu tych pojęć potrafimy już zbudować widok logowania z podstawowymi interakcjami i lepiej rozumiemy ideę tworzenia aplikacji w SwiftUI: „gdy stan się zmienia, interfejs się aktualizuje”.

## Pełny kod

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Wiedza rozszerzona - Alert z wieloma przyciskami

We wcześniejszej części tej lekcji używaliśmy najbardziej podstawowego `Alert`, który ma tylko jeden przycisk i służy głównie do przekazywania komunikatu użytkownikowi.

W rzeczywistości `Alert` może też zawierać wiele przycisków, aby użytkownik mógł wybrać różne opcje.

Na przykład:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Po kliknięciu przycisku pojawi się okno komunikatu z trzema opcjami: `Ok`, `delete` i `cancel`.

Efekt wyświetlania:

![alert](../../Resource/020_alert2.png)

Kliknięcie różnych przycisków spowoduje wykonanie odpowiadającego im kodu.

### Właściwość `role` przycisku Button

Tutaj zauważysz, że `Button` wewnątrz `Alert` trochę różni się od zwykłej składni przycisku, której uczyliśmy się wcześniej:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Tutaj pojawia się dodatkowy parametr `role`.

W SwiftUI `role` służy do poinformowania systemu, jaki rodzaj działania reprezentuje ten przycisk.

Niektóre często spotykane role to:

- `.cancel`: anulowanie
- `.destructive`: działanie niebezpieczne, na przykład usuwanie
- `nil`: zwykłe działanie

Różne wartości `role` zwykle prowadzą też do różnych stylów wizualnych w interfejsie.

Na przykład działania niebezpieczne są często wyświetlane w bardziej przyciągającym uwagę stylu, aby przypomnieć użytkownikowi o ostrożności.

Ponadto `role` dostarcza przyciskowi dodatkowych informacji semantycznych, dzięki czemu czytniki ekranu, takie jak VoiceOver na urządzeniach Apple, mogą łatwiej wyjaśnić użytkownikowi przeznaczenie przycisku.

Dlatego w odpowiednich sytuacjach dodawanie `role` do przycisku jest bardzo dobrym nawykiem.
