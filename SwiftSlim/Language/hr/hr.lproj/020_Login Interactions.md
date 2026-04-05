# Interakcije prijave

U prethodnoj lekciji izradili smo prikaz prijave i pomoću gumba i logike provjere ostvarili jednostavnu provjeru unesenog sadržaja.

U ovoj lekciji nastavit ćemo na temelju koda iz prethodne lekcije i naučiti o polju za unos lozinke `SecureField`, upozoravajućem okviru `Alert`, kao i o tome kako prema varijablama kontrolirati prikaz različitih prikaza.

Kroz ovu lekciju možeš dodatno razumjeti osnovni tijek interakcije u prikazu prijave, a to je i osnovna logika koja se koristi u mnogim aplikacijama.

## Polje za unos lozinke

U prošloj lekciji koristili smo `TextField` za unos lozinke.

Ali u stvarnom sučelju za prijavu lozinka se obično ne prikazuje izravno, nego se prikazuje kao točkice ili neki drugi skriveni efekt, kako bi se zaštitila privatnost korisnika.

U SwiftUI-ju kontrola namijenjena posebno za unos lozinke je `SecureField`.

Na primjer:

```swift
SecureField("Password", text: $password)
```

Način pisanja vrlo je sličan `TextField`-u, i također zahtijeva tekstualni podsjetnik te povezanu varijablu.

Može se jednostavno razumjeti ovako: `SecureField` je također polje za unos, samo što skriva uneseni sadržaj.

Možemo izravno promijeniti `TextField` koji smo ranije koristili za unos lozinke u `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Kada korisnik unosi lozinku, sadržaj lozinke više se neće izravno prikazivati na sučelju.

Prikazni efekt:

![password](../../Resource/020_password.png)

Sada možemo unijeti korisničko ime i lozinku te nakon klika na gumb provjeriti je li unos ispravan.

### Prikaz povratnih poruka

Ranije smo stalno koristili `print` za ispis rezultata.

Sadržaj `print`-a prikazuje se samo u konzoli. Programeri ga mogu vidjeti kada pokreću program u Xcodeu, ali obični korisnici na telefonu ne mogu vidjeti te poruke.

To znači da, iako je program već završio provjeru, korisnik još uvijek ne zna je li uneseni sadržaj ispravan.

U tom trenutku trebamo način da poruke prikažemo izravno na sučelju.

## Upozoravajući okvir Alert

U SwiftUI-ju možemo koristiti `Alert` za prikaz skočnog okvira s porukom.

Osnovna upotreba:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Ovaj dio koda izgleda malo složenije od prethodnih kontrola, ali možemo ga razumjeti ako ga rastavimo.

`Alert` uglavnom sadrži sljedeće dijelove:

- `"Title"`: naslov upozoravajućeg okvira
- `isPresented`: povezana booleanska vrijednost koja se koristi za kontrolu prikaza upozoravajućeg okvira
- `Button(...)`: gumb u upozoravajućem okviru
- `message:`: sadržaj poruke prikazan unutar upozoravajućeg okvira

To se jednostavno može razumjeti ovako: kada povezana varijabla postane `true`, sustav će prikazati ovaj upozoravajući okvir.

Prikazni efekt:

![alert](../../Resource/020_alert3.png)

Odgovarajuća struktura:

![alert](../../Resource/020_alert.png)

### Alert je modifikator

Kao i mnogi modifikatori koje smo ranije učili, i `Alert` se dodaje iza nekog prikaza.

Na primjer, može se primijeniti iza gumba:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Može se primijeniti i iza vanjskog `VStack`-a:

```swift
VStack {
    // ...
}
.alert() {...}
```

To znači da `Alert` nije samostalan prikaz koji stoji zasebno u sučelju, nego modifikator vezan uz određeni prikaz.

Jednostavno se može razumjeti ovako: `Alert` se obično piše iza gumba ili vanjskog rasporeda kako bi prikazao poruku kada je ispunjen određeni uvjet.

### Prikazivanje Alert-a

Ako želimo prikazati `Alert`, potrebna nam je varijabla koja ga kontrolira.

Na primjer:

```swift
@State private var showAlert = false
```

Ova varijabla je tipa `Bool`, što znači da ima samo dvije vrijednosti: `true` ili `false`.

Zatim je povezujemo s `isPresented` od `Alert`:

```swift
isPresented: $showAlert
```

Kada je `showAlert` `false`, upozoravajući okvir se neće prikazati; kada je `showAlert` `true`, upozoravajući okvir će se pojaviti.

### Prikaz upozoravajućeg okvira preko gumba

Sada prvo implementirajmo najjednostavniji scenarij:

Kada korisnik ne unese baš ništa i izravno klikne gumb `Sign in`, pojavit će se okvir s porukom koji mu govori: "Još nisi unio nikakav sadržaj."

Najprije stvori varijablu za upravljanje ovim okvirom poruke:

```swift
@State private var showEmpty = false
```

Zatim dodaj `Alert` iza `Button`:

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

Nakon toga provedi provjeru u kodu za klik na gumb:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Ako su i `user` i `password` prazni, postavit ćemo `showEmpty` na `true`.

A budući da je `Alert` povezan s tom varijablom, kada ona postane `true`, sustav će automatski prikazati upozoravajući okvir.

Prikazni efekt:

![alert](../../Resource/020_alert1.png)

Na taj način korisnik može odmah vidjeti poruku nakon klika na gumb, bez potrebe da programer ide u konzolu provjeravati `print` izlaz.

### Usavršavanje gumba i upozoravajućih okvira

Ranije smo obrađivali samo situaciju "ništa nije ispunjeno".

Također moramo obraditi sljedeće situacije:

- korisničko ime nije ispunjeno
- lozinka nije ispunjena
- korisničko ime i lozinka su ispunjeni, ali je unos pogrešan

Zato moramo pripremiti odgovarajuće poruke i za te situacije.

Najprije dodaj tri nove varijable:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Zatim nastavi dodavati odgovarajuće `Alert` okvire iza gumba:

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

Nakon toga dovrši logiku odlučivanja unutar gumba:

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

Kada gumb procijeni da korisnik nije ispunio nikakve informacije, propustio je jedan podatak ili provjera unosa nije uspjela, promijenit će odgovarajuću booleansku varijablu u `true`, a zatim će se pojaviti odgovarajući `Alert`.

Ovdje ti preporučujem da sam testiraš nekoliko situacija:

- ne ispuniti ništa
- ispuniti samo korisničko ime
- ispuniti samo lozinku
- ispuniti i korisničko ime i lozinku, ali s pogrešnim sadržajem
- ispuniti i korisničko ime i lozinku, a sadržaj je ispravan

Tako možemo provjeriti ima li naš kod problema. To je također vrlo važan korak "testiranja" u razvoju aplikacija.

Ako se program u nekom scenariju ne ponaša ispravno, to znači da možda postoji problem u logici i da se u programu pojavio `Bug`.

Ono što se u razvoju često naziva `Bug` odnosi se na pogrešku, propust ili ponašanje koje ne odgovara očekivanjima.

## Dovršavanje prikaza prijave

Ranije spomenuti `Alert`-i bavili su se time kako korisniku dati poruku kada je "unos pogrešan".

Kada korisnik unese ispravno korisničko ime i lozinku, obično ne prikazujemo "upozoravajući okvir", nego izravno ulazimo u sučelje nakon prijave.

Ovdje je uključena vrlo važna točka znanja: **prikaz različitih prikaza prema vrijednosti varijable.**

Na primjer:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Ovdje koristimo tip `Bool` za upravljanje prikazom prikaza:

- ako je `login` `true`, to znači da je prijava već uspješna i prikazuje se sadržaj nakon prijave
- ako je `login` `false`, to znači da prijava nije uspjela i sučelje za prijavu se i dalje prikazuje.

Iako je `if` naredba uvjetna naredba u Swiftu, unutar SwiftUI-jeva `body` može se koristiti za kontrolu logike prikaza prikaza.

To znači da će SwiftUI prema rezultatu uvjeta odlučiti koji bi prikaz trenutno trebao biti prikazan.

Ovu logiku prikaza možemo staviti u trenutni `ContentView`:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Ovdje smo dodali novu varijablu `login`, koja se koristi za označavanje je li se korisnik već uspješno prijavio.

Zatim smo iza `else` naredbe stavili kod prikaza prijave koji smo već ranije napisali.

Logika prikaza:

- kada je `login` `false`, to znači da prijava još nije uspješna, pa se i dalje prikazuje izvorni prikaz prijave.
- kada je `login` `true`, to znači da je prijava uspješna; tada se prikaz prijave više ne prikazuje, nego se prikazuje `Login successful`.

To znači da će `ContentView` prikazivati različit sadržaj prikaza ovisno o vrijednosti `login`.

Zatim izmijenimo logiku uspješne prijave unutar gumba:

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

Kada su korisničko ime i lozinka koje je korisnik unio oboje ispravni, promijenit ćemo `login` u `true`.

Čim se vrijednost `login` promijeni, promijenit će se i rezultat `if` provjere unutar `ContentView`, a sučelje će se prebaciti s izvornog prikaza prijave na `Login successful`.

Prikazni efekt je sljedeći:

![view](../../Resource/020_view.png)

Sada smo stvarno primijenili znanje o "prikazivanju različitih prikaza prema uvjetima" na ovu trenutnu stranicu prijave.

U stvarnim aplikacijama to se također obično radi na ovaj način: različiti prikazi se prikazuju prema određenoj vrijednosti.

Na primjer, kada korisnik nije prijavljen, prikazuje se stranica za prijavu; nakon uspješne prijave prikazuje se drugo sučelje.

Glavna ideja je: **putem promjena varijabli kontrolirati koji se sadržaj prikazuje na sučelju.**

## Sažetak

U ovoj lekciji naučili smo tri važne stvari:

1. Koristiti `SecureField` za unos lozinke tako da sadržaj lozinke ne bude izravno prikazan na sučelju.
2. Koristiti `Alert` za prikaz poruka korisniku umjesto da ih samo ispisujemo u konzoli.
3. Koristiti varijable i `if` uvjete za kontrolu prikaza različitih prikaza te za ostvarivanje prebacivanja između sučelja prije i nakon prijave.

Učenjem ovih znanja sada već možemo dovršiti prikaz prijave s osnovnim interakcijskim efektima i dodatno razumjeti SwiftUI razvojnu ideju: "stanje se mijenja, sučelje se ažurira".

## Potpuni kod

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

## Prošireno znanje - Alert s više gumba

U prethodnom dijelu ove lekcije koristili smo najosnovniji `Alert`, koji ima samo jedan gumb i uglavnom služi za davanje obavijesti korisniku.

Zapravo, `Alert` može sadržavati i više gumba kako bi korisnik mogao donijeti različite odluke.

Na primjer:

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

Nakon klika na gumb pojavit će se okvir poruke s tri opcije: `Ok`, `delete` i `cancel`.

Prikazni efekt:

![alert](../../Resource/020_alert2.png)

Klik na različite gumbe izvršit će odgovarajući kod.

### Svojstvo role u Button-u

Ovdje ćeš primijetiti da je `Button` unutar `Alert`-a malo drugačiji od običnog načina pisanja gumba koji smo ranije učili:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Ovdje postoji dodatni parametar `role`.

U SwiftUI-ju se `role` koristi kako bi se sustavu reklo kojoj vrsti radnje pripada ovaj gumb.

Neke uobičajene uloge su:

- `.cancel`: radnja otkazivanja
- `.destructive`: opasna radnja, primjerice brisanje
- `nil`: obična radnja

Različite vrijednosti `role` obično također donose različite vizualne stilove na sučelju.

Na primjer, opasne radnje često se prikazuju upečatljivijim stilom kako bi podsjetile korisnika da klikne oprezno.

Osim toga, `role` pruža i dodatne semantičke informacije za gumb, što pomaže čitačima zaslona (kao što je VoiceOver na Apple uređajima) da korisniku objasne svrhu gumba.

Zato je dodavanje `role` gumba u odgovarajućim situacijama vrlo dobra navika.
