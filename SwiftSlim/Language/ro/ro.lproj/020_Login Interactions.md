# Interacțiuni de autentificare

În lecția anterioară, am creat o vizualizare de autentificare și am folosit butoane plus logică condițională pentru a implementa o validare simplă a conținutului introdus.

În această lecție, vom continua pe baza codului din lecția anterioară pentru a învăța despre câmpul de introducere a parolei `SecureField`, caseta de avertizare `Alert` și cum să controlăm afișarea diferitelor vizualizări în funcție de variabile.

Prin această lecție, poți înțelege mai bine fluxul de interacțiune de bază al unei vizualizări de autentificare. Aceasta este, de asemenea, o logică de bază folosită frecvent în multe aplicații.

## Câmpul de introducere a parolei

În lecția anterioară, am folosit `TextField` pentru a introduce parola.

Totuși, într-o interfață reală de autentificare, parola de obicei nu este afișată direct. În schimb, este afișată sub formă de puncte sau cu alt efect ascuns, ceea ce ajută la protejarea confidențialității utilizatorului.

În SwiftUI, controlul folosit special pentru introducerea parolelor este `SecureField`.

De exemplu:

```swift
SecureField("Password", text: $password)
```

Sintaxa lui este foarte asemănătoare cu `TextField`. Are nevoie și el de un text indicativ și de o variabilă legată.

Poți să-l înțelegi simplu astfel: `SecureField` este tot un câmp de introducere, doar că ascunde conținutul introdus.

Putem schimba direct `TextField` folosit inițial pentru introducerea parolei în `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Când utilizatorul introduce parola, conținutul parolei nu va mai fi afișat direct în interfață.

Efect de afișare:

![password](../../Resource/020_password.png)

Acum putem introduce numele de utilizator și parola, apoi să apăsăm butonul pentru a verifica dacă datele introduse sunt corecte.

### Afișarea mesajelor de feedback

Mai devreme, am folosit în mod constant `print` pentru a afișa rezultatele.

Conținutul de la `print` apare doar în consolă. Dezvoltatorii îl pot vedea atunci când rulează programul în Xcode, dar utilizatorii obișnuiți pe telefon nu pot vedea aceste mesaje.

Asta înseamnă că, deși programul a finalizat deja validarea, utilizatorul tot nu știe dacă datele introduse sunt corecte.

În acest moment, avem nevoie de o metodă prin care să afișăm mesajele direct în interfață.

## Caseta de avertizare Alert

În SwiftUI, putem folosi `Alert` pentru a afișa o casetă de mesaj.

Utilizare de bază:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Acest cod pare puțin mai complex decât controalele anterioare, dar îl putem înțelege descompunându-l.

`Alert` conține în principal următoarele părți:

- `"Title"`: titlul casetei de avertizare
- `isPresented`: o valoare booleană legată, folosită pentru a controla dacă se afișează caseta de avertizare
- `Button(...)`: butonul din caseta de avertizare
- `message:`: conținutul mesajului afișat în caseta de avertizare

Poți să înțelegi simplu astfel: când variabila legată devine `true`, sistemul va afișa această casetă de avertizare.

Efect de afișare:

![alert](../../Resource/020_alert3.png)

Structură corespunzătoare:

![alert](../../Resource/020_alert.png)

### Alert este un modificator

La fel ca multe dintre modificatoarele pe care le-am învățat mai devreme, `Alert` se adaugă tot după o anumită vizualizare.

De exemplu, poate fi atașat după un buton:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Poate fi atașat și după `VStack`-ul exterior:

```swift
VStack {
    // ...
}
.alert() {...}
```

Asta înseamnă că `Alert` nu este o vizualizare independentă plasată separat în interfață. În schimb, este un modificator atașat unei anumite vizualizări.

Poți să o înțelegi simplu astfel: `Alert` este de obicei scris după un buton sau după aspectul exterior pentru a afișa un mesaj când este îndeplinită o anumită condiție.

### Afișarea unui Alert

Dacă vrem să afișăm un `Alert`, avem nevoie de o variabilă care să îl controleze.

De exemplu:

```swift
@State private var showAlert = false
```

Această variabilă este de tip `Bool`, ceea ce înseamnă că are doar două valori: `true` sau `false`.

Apoi o legăm de `isPresented` al lui `Alert`:

```swift
isPresented: $showAlert
```

Când `showAlert` este `false`, caseta de avertizare nu va fi afișată. Când `showAlert` este `true`, caseta de avertizare va apărea.

### Afișarea casetei de avertizare printr-un buton

Acum, să implementăm mai întâi cel mai simplu scenariu:

Când utilizatorul nu introduce nimic și apasă direct butonul `Sign in`, apare o casetă de mesaj care îi spune că încă nu a introdus niciun conținut.

Mai întâi, creează o variabilă pentru a controla această casetă de mesaj:

```swift
@State private var showEmpty = false
```

Apoi, adaugă un `Alert` după `Button`:

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

În continuare, efectuează verificarea în codul executat la apăsarea butonului:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Dacă atât `user`, cât și `password` sunt goale, setează `showEmpty` la `true`.

Și pentru că `Alert` este legat de această variabilă, când ea devine `true`, sistemul va afișa automat caseta de avertizare.

Efect de afișare:

![alert](../../Resource/020_alert1.png)

În acest fel, după ce utilizatorul apasă butonul, poate vedea imediat mesajul, iar dezvoltatorul nu trebuie să verifice rezultatul lui `print` în consolă.

### Îmbunătățirea butonului și a casetelor de avertizare

Mai devreme, am tratat doar cazul în care „nu a fost completat nimic”.

Mai trebuie să tratăm și următoarele situații:

- lipsește numele de utilizator
- lipsește parola
- atât numele de utilizator, cât și parola sunt completate, dar datele introduse sunt incorecte

Prin urmare, trebuie să pregătim și mesaje corespunzătoare pentru aceste cazuri.

Mai întâi, adaugă trei variabile noi:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Apoi continuă să adaugi `Alert`-urile corespunzătoare după buton:

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

În continuare, completează logica de decizie din interiorul butonului:

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

Când butonul determină că utilizatorul nu a completat nicio informație, a lăsat necompletată una dintre informații sau a eșuat validarea datelor introduse, schimbă variabila booleană corespunzătoare în `true`, iar apoi apare `Alert`-ul corespunzător.

Aici îți recomand să testezi singur mai multe situații:

- nu completa nimic
- completează doar numele de utilizator
- completează doar parola
- completează atât numele de utilizator, cât și parola, dar cu conținut incorect
- completează atât numele de utilizator, cât și parola, iar conținutul este corect

Acest lucru ajută la verificarea dacă există probleme în codul nostru. Este și o etapă de „testare” foarte importantă în dezvoltarea aplicațiilor.

Dacă programul se comportă incorect într-un anumit scenariu, înseamnă că poate exista o problemă în logică și că a apărut un `Bug` în program.

Ceea ce dezvoltatorii numesc de obicei `Bug` se referă la o eroare, un defect sau un comportament care nu corespunde așteptărilor.

## Finalizarea vizualizării de autentificare

Exemplele de `Alert` despre care am vorbit mai devreme erau toate despre cum să oferim feedback utilizatorului atunci când „datele introduse sunt greșite”.

Când utilizatorul introduce numele de utilizator și parola corecte, de obicei nu afișăm o „casetă de avertizare”. În schimb, intrăm direct în interfața de după autentificare.

Aceasta implică un concept foarte important: **afișarea unor vizualizări diferite în funcție de valoarea unei variabile.**

De exemplu:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Aici folosim tipul `Bool` pentru a gestiona ce vizualizare este afișată:

- dacă `login` este `true`, înseamnă că autentificarea a reușit deja și este afișat conținutul de după autentificare
- dacă `login` este `false`, înseamnă că autentificarea nu a reușit și interfața de autentificare continuă să fie afișată.

Deși instrucțiunea `if` este o instrucțiune condițională în Swift, în interiorul lui `body` din SwiftUI ea poate fi folosită pentru a controla logica de afișare a vizualizărilor.

Asta înseamnă că SwiftUI determină care vizualizare trebuie afișată în acel moment pe baza rezultatului condiției.

Putem pune această logică de afișare în `ContentView`-ul curent:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Codul original al vizualizării de autentificare
		}
	}
}
```

Aici, am adăugat o variabilă nouă, `login`, pentru a indica dacă utilizatorul s-a autentificat deja cu succes.

Apoi, am plasat codul vizualizării de autentificare pe care îl scrisesem deja după instrucțiunea `else`.

Logica de afișare a vizualizării:

- când `login` este `false`, înseamnă că autentificarea nu a reușit încă, așa că vizualizarea originală de autentificare continuă să fie afișată.
- când `login` este `true`, înseamnă că autentificarea a reușit. În acest moment, vizualizarea de autentificare nu mai este afișată, iar în locul ei este afișat `Login successful`.

Asta înseamnă că `ContentView` va afișa conținuturi diferite în funcție de valoarea lui `login`.

În continuare, să modificăm logica de succes a autentificării din interiorul butonului:

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

Când numele de utilizator și parola introduse de utilizator sunt ambele corecte, setăm `login` la `true`.

De îndată ce valoarea lui `login` se schimbă, se schimbă și rezultatul verificării `if` din `ContentView`, iar interfața trece de la vizualizarea originală de autentificare la `Login successful`.

Efectul de afișare este următorul:

![view](../../Resource/020_view.png)

Acum am aplicat cu adevărat ideea de „afișare a unor vizualizări diferite în funcție de condiții” la această pagină de autentificare.

În aplicațiile reale, de obicei așa funcționează și ele: sunt afișate vizualizări diferite în funcție de o anumită valoare.

De exemplu, când utilizatorul nu este autentificat, este afișată pagina de autentificare. După ce utilizatorul se autentifică cu succes, este afișată o altă interfață.

Ideea de bază este: **folosește schimbările variabilelor pentru a controla ce conținut afișează interfața.**

## Rezumat

În această lecție, am învățat trei lucruri importante:

1. Să folosim `SecureField` pentru introducerea parolelor, astfel încât conținutul parolei să nu fie afișat direct în interfață.
2. Să folosim `Alert` pentru a afișa mesaje utilizatorului, în loc să le afișăm doar în consolă.
3. Să folosim variabile și condiții `if` pentru a controla afișarea diferitelor vizualizări, făcând posibilă comutarea între interfața de dinainte și cea de după autentificare.

Prin învățarea acestor concepte, acum suntem capabili să finalizăm o vizualizare de autentificare cu efecte de interacțiune de bază și să înțelegem mai bine ideea de dezvoltare SwiftUI conform căreia „când starea se schimbă, interfața se actualizează”.

## Cod complet

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

## Cunoștințe extinse - Alert cu mai multe butoane

În partea anterioară a acestei lecții, am folosit cel mai de bază `Alert`, care are un singur buton și este folosit în principal pentru a avertiza utilizatorul.

De fapt, `Alert` poate conține și mai multe butoane, astfel încât utilizatorul să poată face alegeri diferite.

De exemplu:

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

După apăsarea butonului, va apărea o casetă de mesaj cu trei opțiuni: `Ok`, `delete` și `cancel`.

Efect de afișare:

![alert](../../Resource/020_alert2.png)

Apăsarea diferitelor butoane va executa codul corespunzător.

### Proprietatea `role` a lui Button

Aici vei observa că `Button` din interiorul lui `Alert` este puțin diferit de sintaxa normală a butonului pe care am învățat-o anterior:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Aici există un parametru suplimentar `role`.

În SwiftUI, `role` este folosit pentru a spune sistemului ce tip de acțiune reprezintă acest buton.

Câteva roluri comune sunt:

- `.cancel`: o acțiune de anulare
- `.destructive`: o acțiune periculoasă, cum ar fi ștergerea
- `nil`: o acțiune normală

Valorile diferite ale lui `role` duc de obicei și la stiluri vizuale diferite în interfață.

De exemplu, acțiunile periculoase sunt adesea afișate într-un stil mai vizibil pentru a le aminti utilizatorilor să apese cu grijă.

În plus, `role` oferă și informații semantice suplimentare pentru buton, ceea ce le permite cititoarelor de ecran, cum ar fi VoiceOver pe dispozitivele Apple, să explice mai ușor utilizatorului scopul butonului.

Prin urmare, în situațiile potrivite, adăugarea lui `role` unui buton este un obicei foarte bun.
