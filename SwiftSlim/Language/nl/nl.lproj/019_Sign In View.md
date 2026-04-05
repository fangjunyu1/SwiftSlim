# Inlogweergave

In deze les leren we een heel praktisch scenario kennen: de inlogweergave.

Of het nu om een website of een app gaat, in veel gevallen moeten gebruikers tijdens het gebruik inloggen met hun account en wachtwoord.

Bijvoorbeeld de GitHub-inlogpagina:

![WordPress](../../Resource/019_github.png)

In deze les maken we een vergelijkbare inlogweergave, zodat de gebruiker handmatig een account en wachtwoord kan invoeren en kan controleren of er problemen zijn met de invoer.

## Bovenste lay-out

We schrijven de code voor de inlogweergave in het bestand `ContentView`.

Laten we eerst het herkenningsgebied bovenaan de inlogweergave maken. Je kunt eerst een geschikt pictogram voorbereiden en dat in de map `Assets` plaatsen.

![icon](../../Resource/019_icon1.png)

Gebruik daarna `Image` en modifiers om de afbeelding weer te geven:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Deze modifiers betekenen:

- `resizable()`: maakt het mogelijk de grootte van de afbeelding aan te passen.
- `scaledToFit()`: schaalt de afbeelding met behoud van de oorspronkelijke verhouding.
- `frame(width: 100)`: stelt de weergavebreedte van de afbeelding in op `100`.

Vervolgens gebruiken we `Text` en modifiers om de inlogtitel te tonen:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Daarna gebruiken we `VStack` om de afbeelding en tekst onder elkaar te plaatsen:

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

Het resultaat:

![view](../../Resource/019_view.png)

Tot hier hebben we het titelgebied bovenaan de inlogweergave voltooid.

### Lay-out optimaliseren

Nu staan de afbeelding en titel standaard in het midden van de totale lay-out.

Als we willen dat ze meer lijken op een "inlogmarkering bovenaan de pagina", kunnen we `Spacer()` gebruiken om de resterende ruimte op te vullen, zodat de inhoud dichter bij de bovenkant verschijnt.

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

Het resultaat:

![view](../../Resource/019_view1.png)

Maar nu staan `Image` en `Text` weer te dicht bij de bovenrand van het scherm en oogt het wat krap.

Op dat moment kunnen we `padding` gebruiken om extra bovenruimte toe te voegen aan de hele `VStack`.

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

Het resultaat:

![view](../../Resource/019_view2.png)

Zo ziet het titelgebied bovenaan de pagina er beter uit.

## Gebruikersnaam en wachtwoord

Op een inlogpagina moet de gebruiker meestal een gebruikersnaam en wachtwoord invoeren.

In SwiftUI kunnen we `TextField` gebruiken om de door de gebruiker ingevoerde inhoud te ontvangen.

Let wel op: `TextField` bewaart de ingevoerde gegevens niet zelf langdurig; het is slechts een invoercomponent. Wat deze inhoud echt bewaart, zijn de variabelen die we eraan koppelen.

Daarom moeten we eerst twee `@State`-variabelen maken om de gebruikersnaam en het wachtwoord op te slaan:

```swift
@State private var user = ""
@State private var password = ""
```

Wanneer de waarde van een `@State`-variabele verandert, ververst SwiftUI automatisch de bijbehorende weergave.

Vervolgens gebruiken we `TextField` om deze twee variabelen te binden:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Hier betekenen `$user` en `$password` "binding".

Dat wil zeggen: wanneer de gebruiker tekst invoert in het veld, verandert de variabele tegelijkertijd; en wanneer de variabele verandert, verandert ook de inhoud die in het veld wordt weergegeven.

Deze relatie waarbij "weergave en gegevens met elkaar synchroniseren" heet binding.

Let op dat we hier de schrijfwijze met `$` moeten gebruiken:

```swift
$user
```

Omdat `TextField` geen gewone string nodig heeft, maar een gebonden waarde die "gegevens in twee richtingen kan wijzigen".

### Invoervelden weergeven

Laten we ze in `ContentView` plaatsen:

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

Weergave-effect:

![view](../../Resource/019_view3.png)

Omdat `user` en `password` nu standaard beide lege strings zijn:

```swift
""
```

Zal het veld eerst tijdelijke placeholdertekst tonen, bijvoorbeeld:

```swift
input user
```

Deze tekst is alleen een hint voor de gebruiker over "wat hier moet worden ingevoerd" en is niet de echte ingevoerde inhoud.

### Invoervelden optimaliseren

Nu kunnen de invoervelden al gebruikt worden, maar de standaardstijl is vrij eenvoudig.

Om de interface duidelijker te maken, kunnen we een titel voor het invoerveld toevoegen en het veld zelf een eenvoudige stijlverbetering geven.

Voeg bijvoorbeeld eerst een titel toe:

```swift
Text("Username")
    .fontWeight(.bold)
```

Gebruik daarna `HStack` om de titel en het invoerveld op dezelfde regel te zetten:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Hier gebruiken we `HStack`, omdat we willen dat "links de titel staat en rechts het invoerveld".

Let op dat `TextField` standaard de resterende beschikbare ruimte inneemt.

![color](../../Resource/019_view6.png)

Om de grootte van de twee invoervelden consistenter te maken, kunnen we `frame(width:)` gebruiken om een breedte in te stellen, zodat de velden er netter uitzien.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Voeg daarna een rand toe om het invoerveld duidelijker te maken:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Nu voegen we zowel gebruikersnaam als wachtwoord toe aan de `ContentView`-weergave:

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

Weergave-effect:

![view](../../Resource/019_view4.png)

Tot hier kan de gebruiker al een gebruikersnaam en wachtwoord invoeren.

## Inlogknop

Hieronder voegen we onder de invoervelden een inlogknop toe.

```swift
Button("Sign in") {

}
```

Gebruik daarna `buttonStyle` om de knop een duidelijkere systeemstijl te geven:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Weergave-effect:

![view](../../Resource/019_view5.png)

Om te bevestigen dat de knop echt op klikken reageert, kunnen we eerst een `print` in de knop schrijven om te testen:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Wanneer je op de knop klikt, geeft de console het volgende weer:

```swift
click Sign in
```

Dit laat zien dat de knop al succesvol op de klik reageert.

## Inloglogica

Nu voegen we de meest basale validatielogica toe aan de inlogknop: **controleren of de gebruiker een gebruikersnaam en wachtwoord heeft ingevoerd**.

We willen de volgende situaties realiseren:

- Als de gebruiker niets heeft ingevoerd, geef `Empty` weer
- Als de gebruiker slechts één van beide heeft ingevoerd, geef aan welke ontbreekt
- Als zowel gebruikersnaam als wachtwoord zijn ingevoerd, geef `Success` weer

### Geen informatie ingevoerd

Omdat `user` en `password` standaard beide lege strings zijn:

```swift
@State private var user = ""
@State private var password = ""
```

Blijven ze leeg wanneer de gebruiker niets invoert.

In Swift kunnen typen zoals `String` `isEmpty` gebruiken om te bepalen of de inhoud leeg is.

### De eigenschap isEmpty

`isEmpty` wordt vaak gebruikt om te controleren of strings, arrays en andere inhoud leeg zijn.

Bijvoorbeeld:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Als de inhoud leeg is, retourneert `isEmpty` `true`; als de inhoud niet leeg is, retourneert `isEmpty` `false`.

Daarom kunnen we het gebruiken om te bepalen of er inhoud is ingevoerd voor de gebruikersnaam en het wachtwoord.

### isEmpty gebruiken om variabelen te controleren

Als de gebruiker geen informatie heeft ingevoerd, dan geldt:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Dan kunnen we de voorwaarde zo schrijven:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Deze code betekent: als `user` leeg is en `password` ook leeg is, geef dan het volgende weer:

```swift
Empty
```

Hier is `&&` een logische operator die "en" betekent.

Dat wil zeggen: pas wanneer de linker voorwaarde waar is en de rechter voorwaarde ook waar is, is de volledige voorwaarde waar.

Dus alleen wanneer zowel gebruikersnaam als wachtwoord leeg zijn, wordt deze code uitgevoerd.

## De gebruiker heeft slechts een deel ingevuld

Laten we vervolgens naar een andere situatie kijken: de gebruiker heeft alleen de gebruikersnaam ingevuld, of alleen het wachtwoord.

Bijvoorbeeld:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Dan is de gebruikersnaam niet leeg, maar het wachtwoord wel.

We kunnen `isEmpty` blijven gebruiken om dit te controleren:

### Situatie waarin de gebruiker account of wachtwoord invult

Als de gebruiker alleen de gebruikersnaam of alleen het wachtwoord heeft ingevuld, moeten we een passende melding geven over wat ontbreekt.

Bijvoorbeeld wanneer de gebruiker alleen de gebruikersnaam heeft ingevuld:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

De logica van deze code is: als de gebruikersnaam leeg is, vraag dan om de gebruikersnaam in te vullen. Anders controleer je of het wachtwoord leeg is; als dat zo is, vraag dan om het wachtwoord in te vullen.

### De gebruiker heeft alle informatie ingevuld

Als zowel gebruikersnaam als wachtwoord zijn ingevoerd, zullen hun `isEmpty`-waarden beide `false` teruggeven.

Dan kunnen we dit zo schrijven:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Hier betekent `!` "niet", dus negatie.

Bijvoorbeeld:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Met andere woorden: `user.isEmpty` wordt gebruikt om te bepalen "of de gebruikersnaam leeg is", en `!user.isEmpty` wordt gebruikt om te bepalen "of de gebruikersnaam niet leeg is".

Voor het wachtwoord geldt dezelfde logica.

Dus de betekenis van deze code is: de gebruikersnaam is niet leeg, en het wachtwoord is ook niet leeg.

Wanneer beide voorwaarden waar zijn, wordt het volgende weergegeven:

```swift
Success
```

## Volledige validatielogica

Nu combineren we deze drie situaties en schrijven we ze in de `Button`:

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

De uitvoervolgorde van deze code kun je zo begrijpen:

Stap één: controleer eerst:

```swift
if user.isEmpty && password.isEmpty
```

Als zowel gebruikersnaam als wachtwoord leeg zijn, wordt direct `Empty` weergegeven.

Als ze niet allebei leeg zijn, controleert het programma verder deze regel:

```swift
else if user.isEmpty || password.isEmpty
```

Hier betekent `||` "of".

Dat wil zeggen: zolang één van de voorwaarden waar is, is de hele uitdrukking waar.

Dus zolang de gebruikersnaam leeg is of het wachtwoord leeg is, wordt het codeblok van `else if` uitgevoerd.

Na het binnengaan van het codeblok controleren we verder welk invoerveld precies niet is ingevuld:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Als de eerste twee voorwaarden niet waar zijn, betekent dit dat de gebruikersnaam niet leeg is en het wachtwoord ook niet leeg is.

Dan gaat het programma naar de laatste `else`:

```swift
print("Success")
```

Zo hebben we de meest basale validatielogica voor de inloginvoer voltooid.

## Validatie van gebruikersnaam en wachtwoord

De bovenstaande logica controleert alleen "of er inhoud is ingevoerd".

Maar in een echte app is alleen iets invoeren niet genoeg. Meestal moeten de gebruikersnaam en het wachtwoord ook naar de server worden gestuurd voor verificatie.

Als de server bevestigt dat de gebruikersnaam bestaat en het wachtwoord correct is, wordt inloggen toegestaan; anders wordt een mislukte login gemeld.

Om dit proces te oefenen, kunnen we eerst een tijdelijk account en wachtwoord in de code instellen om "correcte inloginformatie" te simuleren:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Wanneer zowel gebruikersnaam als wachtwoord niet leeg zijn, vergelijken we vervolgens of ze correct zijn:

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

Hier betekent `==` "of ze gelijk zijn".

Bijvoorbeeld:

```swift
user == userID
```

Dat betekent: is de door de gebruiker ingevoerde gebruikersnaam exact gelijk aan de juiste gebruikersnaam die wij hebben ingesteld? Voor het wachtwoord geldt dezelfde logica.

Daarom wordt `Success` weergegeven wanneer de ingevoerde gebruikersnaam en het wachtwoord gelijk zijn aan de ingestelde waarden; zodra er één niet gelijk is, wordt `Input error` weergegeven.

Zo hebben we een eenvoudige "gesimuleerde inlogverificatie" voltooid.

Hoewel dit nog geen echte inlogfunctie is die met een server is verbonden, is het al voldoende om ons te helpen begrijpen: **na het klikken op de knop kan op basis van verschillende voorwaarden verschillende code worden uitgevoerd**.

## Samenvatting

In deze les hebben we een eenvoudige inlogweergave voltooid en vooral de logica geleerd van "invoerinhoud beoordelen op basis van voorwaarden".

De kern van deze les is het gebruik van `isEmpty` om te bepalen of een string leeg is, en het gebruik van `if`-statements samen met logische operatoren om verschillende situaties af te handelen.

Twee zeer belangrijke logische operatoren zijn:

- `&&`: betekent "en", beide voorwaarden moeten waar zijn
- `||`: betekent "of", slechts één voorwaarde hoeft waar te zijn

Wanneer deze voorwaarden uiteindelijk `true` of `false` opleveren, zal de `if`-statement op basis van het resultaat verschillende code uitvoeren.

Met deze inlogweergave zijn we al begonnen kennis te maken met een ontwikkelwijze die "interface + gegevens + logische beoordeling" combineert.

## Volledige code

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
