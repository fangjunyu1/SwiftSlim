# Innloggingsinteraksjoner

I forrige leksjon laget vi en innloggingsvisning, og gjennom knapper og vurderingslogikk implementerte vi en enkel validering av det innskrevne innholdet.

I denne leksjonen fortsetter vi med koden fra forrige leksjon som grunnlag, og lærer om passordfeltet `SecureField`, varselboksen `Alert`, samt hvordan man styrer visningen av ulike visninger basert på variabler.

Gjennom denne leksjonen kan du få en dypere forståelse av den grunnleggende interaksjonsflyten i en innloggingsvisning, og dette er også grunnleggende logikk som brukes i mange apper.

## Passordfelt

I forrige leksjon brukte vi `TextField` til å skrive inn passord.

Men i et ekte innloggingsgrensesnitt blir passordet vanligvis ikke vist direkte, men vises som prikker eller med en annen skjuleeffekt, slik at brukerens personvern blir beskyttet.

I SwiftUI er kontrollen som brukes spesielt til passordinntasting `SecureField`.

For eksempel:

```swift
SecureField("Password", text: $password)
```

Skrivemåten ligner veldig på `TextField`, og det krever også en hjelpetekst og en bundet variabel.

Dette kan enkelt forstås slik: `SecureField` er også et inntastingsfelt, men det skjuler innholdet som skrives inn.

Vi kan direkte endre `TextField` som opprinnelig ble brukt til å skrive inn passord, til `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Når brukeren skriver inn passordet, vil innholdet ikke lenger vises direkte på grensesnittet.

Visningseffekt:

![password](../../Resource/020_password.png)

Nå kan vi skrive inn brukernavn og passord, og etter å ha trykket på knappen avgjøre om inntastingen er korrekt.

### Vise tilbakemeldingsmeldinger

Tidligere brukte vi hele tiden `print` til å skrive ut resultater.

Innholdet fra `print` vises bare i konsollen. Utviklere kan se det når de kjører programmet i Xcode, men vanlige brukere på telefonen kan ikke se disse meldingene.

Det betyr at selv om programmet allerede har fullført vurderingen, vet ikke brukeren om det innskrevne innholdet er riktig.

På dette tidspunktet trenger vi en måte å vise meldinger direkte i grensesnittet på.

## Alert-varselboks

I SwiftUI kan vi bruke `Alert` til å vise en popup-meldingsboks.

Grunnleggende bruk:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Denne koden ser litt mer kompleks ut enn de tidligere kontrollene, men vi kan forstå den ved å dele den opp.

`Alert` består hovedsakelig av følgende deler:

- `"Title"`: tittelen på varselboksen
- `isPresented`: en bundet boolsk verdi som brukes til å kontrollere om varselboksen vises
- `Button(...)`: knappen i varselboksen
- `message:`: innholdet i meldingen som vises i varselboksen

Dette kan enkelt forstås slik: når den bundne variabelen blir `true`, vil systemet vise denne varselboksen.

Visningseffekt:

![alert](../../Resource/020_alert3.png)

Tilsvarende struktur:

![alert](../../Resource/020_alert.png)

### Alert er en modifier

Som mange av modifierne vi lærte tidligere, blir også `Alert` lagt til etter en bestemt visning.

For eksempel kan den legges bak en knapp:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Den kan også legges bak den ytre `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

Det vil si at `Alert` ikke er en selvstendig visning som plasseres alene i grensesnittet, men en modifier som er festet til en bestemt visning.

Dette kan enkelt forstås slik: `Alert` skrives vanligvis bak knappen eller det ytre oppsettet for å vise en melding når en bestemt betingelse er oppfylt.

### Vise Alert

Hvis vi vil vise en `Alert`, trenger vi en variabel til å styre den.

For eksempel:

```swift
@State private var showAlert = false
```

Denne variabelen er av typen `Bool`, det vil si at den bare har to verdier: `true` eller `false`.

Deretter binder vi den til `isPresented` for `Alert`:

```swift
isPresented: $showAlert
```

Når `showAlert` er `false`, vises ikke varselboksen; når `showAlert` er `true`, vil varselboksen dukke opp.

### Vise varselboksen gjennom knappen

Nå skal vi først implementere det enkleste scenariet:

Når brukeren ikke skriver inn noe som helst og klikker direkte på `Sign in`-knappen, skal det dukke opp en meldingsboks som forteller: «Du har ikke skrevet inn noe innhold ennå.»

Først lager vi en variabel for å styre denne meldingsboksen:

```swift
@State private var showEmpty = false
```

Deretter legger vi til en `Alert` bak `Button`:

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

Videre utfører vi kontrollen i koden for knappetrykket:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Hvis både `user` og `password` er tomme, endrer vi `showEmpty` til `true`.

Og siden `Alert` er bundet til denne variabelen, vil systemet automatisk vise varselboksen når den blir `true`.

Visningseffekt:

![alert](../../Resource/020_alert1.png)

På denne måten kan brukeren se meldingen med en gang etter å ha trykket på knappen, og utvikleren trenger ikke å gå til konsollen for å se `print`-utskriften.

### Forbedre knappen og varselboksene

Tidligere behandlet vi bare situasjonen «ingenting er fylt inn».

Vi må også håndtere følgende situasjoner:

- brukernavnet er ikke fylt inn
- passordet er ikke fylt inn
- både brukernavn og passord er fylt inn, men inntastingen er feil

Derfor må vi også forberede tilsvarende meldinger for disse tilfellene.

Først legger vi til tre nye variabler:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Deretter fortsetter vi med å legge til tilsvarende `Alert` bak knappen:

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

Deretter fullfører vi beslutningslogikken inni knappen:

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

Når knappen avgjør at brukeren ikke har fylt inn noen informasjon, har utelatt én informasjon, eller at valideringen av inntastingen har feilet, vil den endre den tilsvarende boolske variabelen til `true`, og deretter vil den tilsvarende `Alert` dukke opp.

Her anbefaler jeg at du selv tester noen situasjoner:

- ikke fyll inn noe
- fyll bare inn brukernavnet
- fyll bare inn passordet
- fyll inn både brukernavn og passord, men med feil innhold
- fyll inn både brukernavn og passord, og innholdet er riktig

Slik kan vi bekrefte om koden vår har problemer. Dette er også et svært viktig «test»-trinn i apputvikling.

Hvis programmet oppfører seg feil i et bestemt scenario, betyr det at det kan være et problem i logikken, og at det har oppstått en `Bug` i programmet.

Det vi ofte kaller en `Bug` i utvikling, viser til en feil, mangel eller oppførsel som ikke samsvarer med forventningene.

## Fullføre innloggingsvisningen

`Alert`-ene vi snakket om tidligere handlet alle om hvordan vi kan gi brukeren tilbakemelding når «inntastingen er feil».

Når brukeren skriver inn riktig brukernavn og passord, viser vi vanligvis ikke en «varselboks», men går direkte inn i grensesnittet etter innlogging.

Her er et svært viktig kunnskapspunkt involvert: **vise ulike visninger basert på verdien til en variabel.**

For eksempel:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Her bruker vi typen `Bool` til å administrere visningen av skjermbildet:

- hvis `login` er `true`, betyr det at innloggingen allerede har lykkes, og innholdet etter innlogging vises
- hvis `login` er `false`, betyr det at innloggingen ikke har lykkes, og innloggingsgrensesnittet fortsetter å vises.

Selv om `if`-setningen er en betinget setning i Swift, kan den i `body` i SwiftUI brukes til å kontrollere visningslogikken for skjermbildet.

Det vil si at SwiftUI, basert på resultatet av betingelsen, avgjør hvilken visning som skal vises akkurat nå.

Vi kan legge denne visningslogikken inn i den nåværende `ContentView`:

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

Her har vi lagt til en ny variabel, `login`, som brukes til å angi om brukeren allerede har logget inn med hell.

Deretter la vi koden for innloggingsvisningen som allerede var skrevet tidligere, bak `else`-setningen.

Visningslogikk:

- når `login` er `false`, betyr det at innloggingen ennå ikke har lykkes, så den opprinnelige innloggingsvisningen fortsetter å vises.
- når `login` er `true`, betyr det at innloggingen er vellykket; da vises ikke lenger innloggingsvisningen, men `Login successful` vises i stedet.

Det vil si at `ContentView` vil vise forskjellig visningsinnhold avhengig av verdien til `login`.

Deretter endrer vi logikken for vellykket innlogging inni knappen:

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

Når både brukernavnet og passordet som brukeren har skrevet inn er riktige, endrer vi `login` til `true`.

Når verdien til `login` endres, vil også resultatet av `if`-vurderingen i `ContentView` endres, og grensesnittet vil bytte fra den opprinnelige innloggingsvisningen til `Login successful`.

Visningseffekten er som følger:

![view](../../Resource/020_view.png)

Nå har vi virkelig brukt kunnskapen om «å vise ulike visninger basert på betingelser» på denne nåværende innloggingssiden.

I faktiske apper er dette vanligvis også måten det gjøres på: ulike visninger vises basert på en bestemt verdi.

For eksempel, når brukeren ikke er logget inn, vises innloggingssiden; etter at brukeren har logget inn med hell, vises et annet grensesnitt.

Kjernetanken er: **å styre hvilket innhold som vises i grensesnittet gjennom endringer i variabler.**

## Oppsummering

I denne leksjonen lærte vi tre viktige ting:

1. Å bruke `SecureField` til å skrive inn passord, slik at passordinnholdet ikke vises direkte på grensesnittet.
2. Å bruke `Alert` til å vise meldinger til brukeren, i stedet for bare å skrive dem ut i konsollen.
3. Å bruke variabler og `if`-vurderinger til å kontrollere visningen av ulike visninger og dermed gjennomføre bytte mellom grensesnittet før og etter innlogging.

Gjennom å lære dette er vi nå i stand til å fullføre en innloggingsvisning med grunnleggende interaksjonseffekter, og vi kan også bedre forstå SwiftUI-utviklingsideen om at «når tilstanden endres, oppdateres grensesnittet».

## Fullstendig kode

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

## Utvidet kunnskap - Alert med flere knapper

I forrige del av denne leksjonen brukte vi den mest grunnleggende `Alert`, som bare har én knapp og hovedsakelig brukes til å gi brukeren et hint.

Faktisk kan `Alert` også inneholde flere knapper, slik at brukeren kan gjøre ulike valg.

For eksempel:

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

Etter å ha klikket på knappen, vil en meldingsboks med tre alternativer dukke opp: `Ok`, `delete` og `cancel`.

Visningseffekt:

![alert](../../Resource/020_alert2.png)

Når du klikker på ulike knapper, kjøres den tilsvarende koden.

### role-egenskapen til Button

Her vil du oppdage at `Button` inne i `Alert` er litt annerledes enn den vanlige knappesyntaksen vi lærte tidligere:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Her finnes det en ekstra parameter, `role`.

I SwiftUI brukes `role` til å fortelle systemet hvilken type handling denne knappen tilhører.

Noen vanlige roller er:

- `.cancel`: avbryt-handling
- `.destructive`: farlig handling, for eksempel sletting
- `nil`: vanlig handling

Ulike `role`-verdier fører som regel også til ulike visuelle stiler i grensesnittet.

For eksempel vises farlige handlinger ofte med en mer iøynefallende stil for å minne brukeren om å klikke forsiktig.

I tillegg gir `role` ekstra semantisk informasjon for knappen, noe som gjør det lettere for skjermlesere (for eksempel VoiceOver på Apple-enheter) å forklare knappens rolle til brukeren.

Derfor er det en veldig god vane å legge til `role` på en knapp i passende situasjoner.
