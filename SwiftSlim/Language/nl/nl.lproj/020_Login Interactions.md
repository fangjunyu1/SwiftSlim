# Inloginteracties

In de vorige les hebben we een inlogweergave gemaakt en via knoppen en beoordelingslogica een eenvoudige controle van de ingevoerde inhoud gerealiseerd.

In deze les gaan we verder op basis van de code uit de vorige les en leren we het wachtwoordinvoerveld `SecureField`, het waarschuwingsvenster `Alert`, en hoe je op basis van variabelen verschillende weergaven kunt tonen.

Door deze les kun je de basisinteractie van een inlogweergave verder begrijpen, en dit is ook basislogica die in veel apps wordt gebruikt.

## Wachtwoordinvoerveld

In de vorige les gebruikten we `TextField` om een wachtwoord in te voeren.

Maar in een echt inlogscherm wordt het wachtwoord meestal niet direct weergegeven. In plaats daarvan wordt het als stippen of met een ander verbergeffect getoond, zodat de privacy van de gebruiker beschermd blijft.

In SwiftUI is de controle die speciaal wordt gebruikt voor het invoeren van wachtwoorden `SecureField`.

Bijvoorbeeld:

```swift
SecureField("Password", text: $password)
```

De schrijfwijze lijkt erg op `TextField`, en het heeft ook een hinttekst en een gebonden variabele nodig.

Je kunt het eenvoudig zo begrijpen: `SecureField` is ook een invoerveld, alleen verbergt het de ingevoerde inhoud.

We kunnen de `TextField` die oorspronkelijk voor het invoeren van het wachtwoord werd gebruikt direct veranderen in `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Wanneer de gebruiker een wachtwoord invoert, wordt de inhoud van het wachtwoord niet direct op de interface weergegeven.

Weergave-effect:

![password](../../Resource/020_password.png)

Nu kunnen we de gebruikersnaam en het wachtwoord invoeren en na het klikken op de knop bepalen of de invoer correct is.

### Feedbackmeldingen tonen

Hiervoor gebruikten we steeds `print` om resultaten uit te voeren.

De inhoud van `print` wordt alleen in de console weergegeven. Ontwikkelaars kunnen dit zien wanneer ze het programma in Xcode uitvoeren, maar gewone gebruikers op een telefoon kunnen deze meldingen niet zien.

Dat betekent dat, hoewel het programma de beoordeling al heeft afgerond, de gebruiker nog steeds niet weet of de ingevoerde inhoud correct is.

Op dit moment hebben we een manier nodig om meldingen direct op de interface te tonen.

## Alert-waarschuwingsvenster

In SwiftUI kunnen we `Alert` gebruiken om een pop-upberichtvenster te tonen.

Basisgebruik:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Deze code ziet er iets complexer uit dan de vorige controls, maar we kunnen hem begrijpen door hem op te splitsen.

`Alert` bestaat voornamelijk uit de volgende onderdelen:

- `"Title"`: de titel van het waarschuwingsvenster
- `isPresented`: een gebonden booleaanse waarde die bepaalt of het waarschuwingsvenster wordt weergegeven
- `Button(...)`: de knop van het waarschuwingsvenster
- `message:`: de inhoud van de melding die in het waarschuwingsvenster wordt weergegeven

Je kunt het eenvoudig zo begrijpen: wanneer de gebonden variabele `true` wordt, zal het systeem dit meldingvenster laten verschijnen.

Weergave-effect:

![alert](../../Resource/020_alert3.png)

Bijbehorende structuur:

![alert](../../Resource/020_alert.png)

### Alert is een modifier

Net als veel modifiers die we eerder hebben geleerd, wordt `Alert` ook achter een bepaalde weergave toegevoegd.

Het kan bijvoorbeeld achter een knop worden geplaatst:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Het kan ook achter de buitenste `VStack` worden geplaatst:

```swift
VStack {
    // ...
}
.alert() {...}
```

Dat betekent dat `Alert` geen zelfstandige weergave is die apart in de interface staat, maar een modifier die aan een bepaalde weergave is gekoppeld.

Eenvoudig gezegd wordt `Alert` meestal achter de knop of de buitenste layout geschreven om een melding te laten verschijnen wanneer aan een bepaalde voorwaarde is voldaan.

### Alert tonen

Als we een `Alert` willen tonen, hebben we een variabele nodig om die te besturen.

Bijvoorbeeld:

```swift
@State private var showAlert = false
```

Deze variabele is van het type `Bool`, wat betekent dat die maar twee waarden heeft: `true` of `false`.

Daarna koppelen we deze aan `isPresented` van `Alert`:

```swift
isPresented: $showAlert
```

Wanneer `showAlert` `false` is, wordt het waarschuwingsvenster niet getoond; wanneer `showAlert` `true` is, verschijnt het waarschuwingsvenster.

### Het waarschuwingsvenster via de knop tonen

Laten we nu eerst het eenvoudigste scenario implementeren:

Wanneer de gebruiker helemaal niets invoert en direct op de knop `Sign in` klikt, verschijnt er een berichtvenster dat zegt: "Je hebt nog geen inhoud ingevoerd."

Maak eerst een variabele aan om dit berichtvenster te besturen:

```swift
@State private var showEmpty = false
```

Voeg daarna een `Alert` achter `Button` toe:

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

Vervolgens voeren we in de code van de knopklik de controle uit:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Als zowel `user` als `password` leeg zijn, zetten we `showEmpty` op `true`.

En omdat `Alert` weer aan deze variabele is gekoppeld, zal het systeem automatisch het waarschuwingsvenster tonen wanneer die `true` wordt.

Weergave-effect:

![alert](../../Resource/020_alert1.png)

Zo kan de gebruiker direct na het klikken op de knop de melding zien, zonder dat de ontwikkelaar in de console de uitvoer van `print` hoeft te bekijken.

### De knop en het waarschuwingsvenster verbeteren

Eerder hebben we alleen de situatie afgehandeld waarin “helemaal niets is ingevuld”.

We moeten ook nog de volgende situaties afhandelen:

- de gebruikersnaam is niet ingevuld
- het wachtwoord is niet ingevuld
- de gebruikersnaam en het wachtwoord zijn ingevuld, maar de invoer is fout

Daarom moeten we ook voor deze gevallen passende meldingen voorbereiden.

Voeg eerst drie nieuwe variabelen toe:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Voeg daarna achter de knop de bijbehorende `Alert`-vensters toe:

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

Vervolgens maken we de beoordelingslogica in de knop compleet:

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

Wanneer de knop bepaalt dat de gebruiker geen informatie heeft ingevuld, één onderdeel heeft overgeslagen of dat de invoervalidatie is mislukt, verandert hij de bijbehorende booleaanse variabele naar `true`, en daarna verschijnt de bijbehorende `Alert`.

Hier raad ik je aan om zelf een paar situaties te testen:

- vul niets in
- vul alleen de gebruikersnaam in
- vul alleen het wachtwoord in
- vul zowel de gebruikersnaam als het wachtwoord in, maar met verkeerde inhoud
- vul zowel de gebruikersnaam als het wachtwoord in, en de inhoud is correct

Zo kunnen we controleren of er problemen in onze code zitten. Dit is ook een heel belangrijke “test”-stap in app-ontwikkeling.

Als het programma zich in een bepaalde situatie niet goed gedraagt, betekent dit dat er mogelijk een probleem in de logica zit en dat er een `Bug` in het programma is ontstaan.

Wat men in ontwikkeling vaak een `Bug` noemt, verwijst naar een fout, een gebrek of gedrag dat niet aan de verwachtingen voldoet.

## De inlogweergave voltooien

De `Alert`-voorbeelden waar we het eerder over hadden, gingen allemaal over hoe je de gebruiker een melding geeft wanneer “de invoer fout is”.

Wanneer de gebruiker de juiste gebruikersnaam en het juiste wachtwoord invoert, tonen we meestal geen “waarschuwingsvenster”, maar gaan we direct door naar de interface na het inloggen.

Hier is een heel belangrijk kennispunt aan de orde: **verschillende weergaven tonen op basis van de waarde van een variabele.**

Bijvoorbeeld:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Hier gebruiken we het type `Bool` om het tonen van de weergave te beheren:

- als `login` `true` is, betekent dit dat het inloggen al is gelukt en dat de inhoud na het inloggen wordt weergegeven
- als `login` `false` is, betekent dit dat het inloggen niet is gelukt en dat de inloginterface zichtbaar blijft.

Hoewel de `if`-instructie een voorwaardelijke instructie is in Swift, kan deze in de `body` van SwiftUI worden gebruikt om de weergavelogica van views te sturen.

Dat betekent dat SwiftUI op basis van het resultaat van de voorwaarde bepaalt welke view op dit moment moet worden getoond.

We kunnen deze weergavelogica in de huidige `ContentView` plaatsen:

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

Hier hebben we een nieuwe variabele `login` toegevoegd, die aangeeft of de gebruiker al succesvol is ingelogd.

Daarna hebben we de code van de inlogweergave die we eerder al hadden geschreven, achter de `else`-instructie geplaatst.

Weergavelogica:

- wanneer `login` `false` is, betekent dit dat het inloggen nog niet is gelukt, dus blijft de oorspronkelijke inlogweergave zichtbaar.
- wanneer `login` `true` is, betekent dit dat het inloggen geslaagd is; op dat moment wordt de inlogweergave niet meer getoond, maar verschijnt `Login successful`.

Dat betekent dat `ContentView` verschillende inhoud zal tonen afhankelijk van de waarde van `login`.

Laten we daarna de logica voor succesvol inloggen in de knop aanpassen:

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

Wanneer zowel de door de gebruiker ingevoerde gebruikersnaam als het wachtwoord correct zijn, zetten we `login` op `true`.

Zodra de waarde van `login` verandert, verandert ook de uitkomst van de `if`-controle in `ContentView`, en schakelt de interface over van de oorspronkelijke inlogweergave naar `Login successful`.

Het weergave-effect is als volgt:

![view](../../Resource/020_view.png)

Nu hebben we de kennis van “verschillende weergaven tonen op basis van voorwaarden” echt toegepast op deze huidige inlogpagina.

In echte apps wordt dit meestal ook op deze manier gedaan: op basis van een bepaalde waarde worden verschillende weergaven getoond.

Bijvoorbeeld, wanneer de gebruiker niet is ingelogd, wordt de inlogpagina getoond; nadat de gebruiker succesvol is ingelogd, wordt een andere interface getoond.

Het kernidee is: **door veranderingen in variabelen te gebruiken om te bepalen welke inhoud op de interface wordt weergegeven.**

## Samenvatting

In deze les hebben we drie belangrijke dingen geleerd:

1. `SecureField` gebruiken om wachtwoorden in te voeren, zodat de inhoud van het wachtwoord niet direct op de interface wordt weergegeven.
2. `Alert` gebruiken om meldingen aan de gebruiker te tonen, in plaats van ze alleen naar de console uit te schrijven.
3. Variabelen en `if`-beoordelingen gebruiken om het tonen van verschillende weergaven te beheren en zo de overgang tussen de interface vóór en na het inloggen te realiseren.

Door deze kennis te leren, kunnen we nu een inlogweergave met basisinteractie-effecten voltooien en tegelijkertijd beter de SwiftUI-ontwikkelgedachte begrijpen: “als de toestand verandert, wordt de interface bijgewerkt”.

## Volledige code

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

## Uitgebreide kennis - Alert met meerdere knoppen

In het eerdere deel van deze les gebruikten we de meest eenvoudige `Alert`, die slechts één knop had en vooral werd gebruikt om de gebruiker te informeren.

In werkelijkheid kan `Alert` ook meerdere knoppen bevatten, zodat de gebruiker verschillende keuzes kan maken.

Bijvoorbeeld:

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

Na het klikken op de knop verschijnt een berichtvenster met drie opties: `Ok`, `delete` en `cancel`.

Weergave-effect:

![alert](../../Resource/020_alert2.png)

Wanneer op verschillende knoppen wordt geklikt, wordt de bijbehorende code uitgevoerd.

### De `role`-eigenschap van Button

Hier zul je merken dat de `Button` in `Alert` een beetje verschilt van de gewone knopsyntaxis die we eerder hebben geleerd:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Hier is een extra parameter toegevoegd, `role`.

In SwiftUI wordt `role` gebruikt om het systeem te vertellen tot welk type actie deze knop behoort.

Enkele veelvoorkomende rollen zijn:

- `.cancel`: annuleeractie
- `.destructive`: gevaarlijke actie, bijvoorbeeld verwijderen
- `nil`: gewone actie

Verschillende `role`-waarden zorgen meestal ook voor verschillende visuele stijlen in de interface.

Bijvoorbeeld, gevaarlijke acties worden vaak in een meer opvallende stijl weergegeven om de gebruiker eraan te herinneren voorzichtig te klikken.

Bovendien geeft `role` ook extra semantische informatie voor de knop, waardoor schermlezers (zoals VoiceOver op Apple-apparaten) de functie van de knop makkelijker aan de gebruiker kunnen uitleggen.

Daarom is het in passende situaties een heel goede gewoonte om `role` aan een knop toe te voegen.
