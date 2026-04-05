# Interakcije prijave

V prejšnji lekciji smo ustvarili pogled za prijavo ter z uporabo gumbov in pogojne logike izvedli preprosto preverjanje vnesene vsebine.

V tej lekciji bomo nadaljevali na podlagi kode iz prejšnje lekcije in se naučili o polju za vnos gesla `SecureField`, opozorilnem oknu `Alert` ter o tem, kako glede na spremenljivke nadzorovati prikaz različnih pogledov.

S to lekcijo lahko bolje razumete osnovni potek interakcije v pogledu za prijavo. To je tudi osnovna logika, ki se pogosto uporablja v mnogih aplikacijah.

## Polje za vnos gesla

V prejšnji lekciji smo za vnos gesla uporabljali `TextField`.

V resničnem prijavnem vmesniku pa geslo običajno ni prikazano neposredno. Namesto tega se prikaže kot pike ali z drugim skritim učinkom, kar pomaga zaščititi zasebnost uporabnika.

V SwiftUI je kontrolnik, posebej namenjen vnosu gesel, `SecureField`.

Na primer:

```swift
SecureField("Password", text: $password)
```

Njegov zapis je zelo podoben `TextField`. Prav tako potrebuje besedilo namiga in vezano spremenljivko.

To si lahko preprosto razlagate tako: `SecureField` je prav tako vnosno polje, le da skrije vneseno vsebino.

`TextField`, ki smo ga prvotno uporabljali za vnos gesla, lahko neposredno zamenjamo z `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Ko uporabnik vnese geslo, vsebina gesla v vmesniku ne bo več neposredno prikazana.

Učinek prikaza:

![password](../../Resource/020_password.png)

Zdaj lahko vnesemo uporabniško ime in geslo, nato pa kliknemo gumb, da preverimo, ali je vnos pravilen.

### Prikaz povratnih sporočil

Prej smo ves čas uporabljali `print` za izpis rezultatov.

Vsebina iz `print` se prikaže samo v konzoli. Razvijalci jo lahko vidijo, ko program zaženejo v Xcode, običajni uporabniki na telefonu pa teh sporočil ne vidijo.

To pomeni, da čeprav je program preverjanje že opravil, uporabnik še vedno ne ve, ali je vnesena vsebina pravilna.

Na tej točki potrebujemo način, kako prikazati sporočila neposredno v vmesniku.

## Opozorilno okno Alert

V SwiftUI lahko za prikaz pojavnega okna s sporočilom uporabimo `Alert`.

Osnovna uporaba:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Ta koda je videti nekoliko bolj zapletena kot prejšnji kontrolniki, vendar jo lahko razumemo, če jo razdelimo na dele.

`Alert` v glavnem vsebuje naslednje dele:

- `"Title"`: naslov opozorilnega okna
- `isPresented`: vezana logična vrednost, ki nadzoruje, ali se opozorilno okno prikaže
- `Button(...)`: gumb v opozorilnem oknu
- `message:`: vsebina sporočila, prikazana v opozorilnem oknu

To si lahko preprosto razlagate tako: ko vezana spremenljivka postane `true`, sistem prikaže to opozorilno okno.

Učinek prikaza:

![alert](../../Resource/020_alert3.png)

Ustrezna struktura:

![alert](../../Resource/020_alert.png)

### Alert je modifikator

Tako kot veliko modifikatorjev, ki smo se jih naučili prej, se tudi `Alert` doda za določen pogled.

Na primer, lahko je pritrjen za gumb:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Lahko je pritrjen tudi za zunanji `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

To pomeni, da `Alert` ni samostojen pogled, ki je vmesniku dodan neodvisno. Namesto tega je modifikator, pritrjen na določen pogled.

To si lahko preprosto razlagate tako: `Alert` je običajno napisan za gumbom ali za zunanjo postavitvijo, da prikaže sporočilo, ko je izpolnjen določen pogoj.

### Prikaz Alert

Če želimo prikazati `Alert`, potrebujemo spremenljivko, ki ga bo nadzorovala.

Na primer:

```swift
@State private var showAlert = false
```

Ta spremenljivka je tipa `Bool`, kar pomeni, da ima samo dve vrednosti: `true` ali `false`.

Nato jo povežemo z `isPresented` od `Alert`:

```swift
isPresented: $showAlert
```

Ko je `showAlert` `false`, se opozorilno okno ne prikaže. Ko je `showAlert` `true`, se opozorilno okno prikaže.

### Prikaz opozorilnega okna prek gumba

Zdaj najprej izvedimo najpreprostejši scenarij:

Ko uporabnik ne vnese ničesar in neposredno klikne gumb `Sign in`, naj se prikaže okno s sporočilom, ki mu pove, da še ni vnesel nobene vsebine.

Najprej ustvarite spremenljivko za nadzor tega okna s sporočilom:

```swift
@State private var showEmpty = false
```

Nato za `Button` dodajte `Alert`:

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

Nato v kodi ob kliku na gumb izvedite preverjanje:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Če sta `user` in `password` oba prazna, nastavite `showEmpty` na `true`.

Ker je `Alert` vezan na to spremenljivko, bo sistem, ko postane `true`, samodejno prikazal opozorilno okno.

Učinek prikaza:

![alert](../../Resource/020_alert1.png)

Tako lahko uporabnik po kliku na gumb takoj vidi sporočilo, razvijalcu pa ni treba preverjati izpisa `print` v konzoli.

### Izboljšanje gumba in opozorilnih oken

Prej smo obravnavali samo primer, ko »ni bilo izpolnjeno nič«.

Še vedno moramo obravnavati naslednje situacije:

- uporabniško ime manjka
- geslo manjka
- uporabniško ime in geslo sta izpolnjena, vendar je vnos napačen

Zato moramo pripraviti tudi ustrezna sporočila za te primere.

Najprej dodajte tri nove spremenljivke:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Nato za gumbom še naprej dodajajte ustrezne `Alert`:

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

Nato dopolnite logiko odločanja znotraj gumba:

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

Ko gumb ugotovi, da uporabnik ni izpolnil nobenih podatkov, je izpustil en podatek ali preverjanje vnosa ni uspelo, ustrezno logično spremenljivko spremeni v `true`, nato pa se prikaže ustrezen `Alert`.

Tukaj vam priporočam, da sami preizkusite več situacij:

- ne izpolnite ničesar
- izpolnite samo uporabniško ime
- izpolnite samo geslo
- izpolnite uporabniško ime in geslo, vendar z napačno vsebino
- izpolnite uporabniško ime in geslo, vsebina pa je pravilna

To pomaga preveriti, ali ima naša koda kakšne težave. To je tudi zelo pomemben korak »testiranja« pri razvoju aplikacij.

Če se program v določenem scenariju obnaša napačno, to pomeni, da je morda težava v logiki in da se je v programu pojavil `Bug`.

Kar razvijalci pogosto imenujejo `Bug`, pomeni napako, pomanjkljivost ali vedenje, ki ne ustreza pričakovanjem.

## Dokončanje pogleda za prijavo

Primeri `Alert`, o katerih smo govorili prej, so bili vsi povezani s tem, kako uporabniku podati povratno informacijo, ko je »vnos napačen«.

Ko uporabnik vnese pravilno uporabniško ime in geslo, običajno ne prikažemo »opozorilnega okna«. Namesto tega neposredno preidemo v vmesnik po prijavi.

To vključuje zelo pomemben koncept: **prikazovanje različnih pogledov glede na vrednost spremenljivke.**

Na primer:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Tukaj za upravljanje prikazanega pogleda uporabljamo tip `Bool`:

- če je `login` `true`, to pomeni, da je prijava že uspela in se prikaže vsebina po prijavi
- če je `login` `false`, to pomeni, da prijava ni uspela in se prijavni vmesnik še naprej prikazuje.

Čeprav je stavek `if` v Swiftu pogojni stavek, se lahko znotraj `body` v SwiftUI uporablja za nadzor logike prikaza pogledov.

To pomeni, da SwiftUI glede na rezultat pogoja določi, kateri pogled naj bo trenutno prikazan.

To logiko prikaza lahko postavimo v trenutni `ContentView`:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Koda izvirnega prijavnega pogleda
		}
	}
}
```

Tukaj smo dodali novo spremenljivko `login`, ki označuje, ali se je uporabnik že uspešno prijavil.

Nato smo za stavek `else` postavili kodo prijavnega pogleda, ki smo jo že napisali.

Logika prikaza pogleda:

- ko je `login` `false`, to pomeni, da prijava še ni uspela, zato se še naprej prikazuje izvirni prijavni pogled.
- ko je `login` `true`, to pomeni, da je prijava uspešna. Takrat se prijavni pogled ne prikazuje več, namesto njega pa se prikaže `Login successful`.

To pomeni, da bo `ContentView` glede na vrednost `login` prikazoval različno vsebino pogleda.

Nato spremenimo logiko uspešne prijave znotraj gumba:

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

Ko sta uporabniško ime in geslo, ki ju vnese uporabnik, oba pravilna, nastavimo `login` na `true`.

Ko se vrednost `login` spremeni, se spremeni tudi rezultat preverjanja `if` v `ContentView`, vmesnik pa se preklopi z izvirnega prijavnega pogleda na `Login successful`.

Učinek prikaza je naslednji:

![view](../../Resource/020_view.png)

Zdaj smo idejo »prikazovanja različnih pogledov glede na pogoje« resnično uporabili na tej trenutni prijavni strani.

V resničnih aplikacijah to običajno deluje prav tako: glede na določeno vrednost so prikazani različni pogledi.

Na primer, ko uporabnik ni prijavljen, se prikaže prijavna stran; po uspešni prijavi uporabnika pa se prikaže drug vmesnik.

Osrednja ideja je: **s spremembami spremenljivk nadzorovati, katero vsebino prikazuje vmesnik.**

## Povzetek

V tej lekciji smo se naučili treh pomembnih stvari:

1. Uporabljati `SecureField` za vnos gesel, tako da vsebina gesla ni neposredno prikazana v vmesniku.
2. Uporabljati `Alert` za prikaz sporočil uporabniku namesto tega, da jih izpisujemo samo v konzolo.
3. Uporabljati spremenljivke in pogoje `if` za nadzor prikaza različnih pogledov, kar omogoča preklapljanje med vmesnikom pred prijavo in po njej.

S tem znanjem lahko zdaj dokončamo pogled za prijavo z osnovnimi interakcijskimi učinki in bolje razumemo razvojno idejo SwiftUI: »ko se stanje spremeni, se vmesnik posodobi«.

## Celotna koda

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

## Razširjeno znanje - Alert z več gumbi

V prejšnjem delu te lekcije smo uporabili najbolj osnovni `Alert`, ki ima samo en gumb in se uporablja predvsem za obveščanje uporabnika.

Pravzaprav lahko `Alert` vsebuje tudi več gumbov, tako da lahko uporabnik sprejme različne odločitve.

Na primer:

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

Po kliku na gumb se prikaže okno s tremi možnostmi: `Ok`, `delete` in `cancel`.

Učinek prikaza:

![alert](../../Resource/020_alert2.png)

Klik na različne gumbe izvede ustrezno kodo.

### Lastnost `role` pri Button

Tukaj boste opazili, da je `Button` znotraj `Alert` nekoliko drugačen od običajne sintakse gumba, ki smo se jo učili prej:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Tukaj je dodan dodaten parameter `role`.

V SwiftUI se `role` uporablja za to, da sistemu pove, kakšno vrsto dejanja predstavlja ta gumb.

Nekatere pogoste vloge so:

- `.cancel`: dejanje preklica
- `.destructive`: nevarno dejanje, na primer brisanje
- `nil`: običajno dejanje

Različne vrednosti `role` običajno vodijo tudi do različnih vizualnih slogov v vmesniku.

Na primer, nevarna dejanja so pogosto prikazana z bolj opaznim slogom, da uporabnike opozorijo na previdno klikanje.

Poleg tega `role` gumbu zagotavlja dodatne pomenske informacije, kar bralnikom zaslona, kot je VoiceOver na napravah Apple, olajša razlago namena gumba uporabniku.

Zato je dodajanje `role` gumbu v ustreznih situacijah zelo dobra navada.
