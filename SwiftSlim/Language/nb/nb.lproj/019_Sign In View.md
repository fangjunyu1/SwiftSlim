# Innloggingsvisning

I denne leksjonen skal vi lære et veldig praktisk scenario, nemlig en innloggingsvisning.

Enten det er et nettsted eller en app, må brukeren i mange tilfeller logge inn med konto og passord under bruk.

For eksempel GitHubs innloggingsside:

![WordPress](../../Resource/019_github.png)

I denne leksjonen skal vi lage en lignende innloggingsvisning, slik at brukeren manuelt kan skrive inn konto og passord og kontrollere om det er problemer med innholdet.

## Toppoppsett

Vi skal skrive koden for innloggingsvisningen i filen `ContentView`.

Først lager vi identitetsområdet øverst i innloggingsvisningen. Du kan først forberede et passende ikonbilde og legge det i mappen `Assets`.

![icon](../../Resource/019_icon1.png)

Deretter bruker vi `Image` og modifikatorer for å vise bildet:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Disse modifikatorene betyr:

- `resizable()`: gjør at bildet kan endre størrelse.
- `scaledToFit()`: skalerer bildet mens den opprinnelige proporsjonen beholdes.
- `frame(width: 100)`: setter visningsbredden til `100`.

Deretter bruker vi `Text` og modifikatorer for å vise innloggingstittelen:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Så bruker vi `VStack` til å plassere bildet og teksten over hverandre:

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

Resultatet blir:

![view](../../Resource/019_view.png)

Nå har vi fullført tittelområdet øverst i innloggingsvisningen.

### Optimalisere oppsettet

Nå ligger bildet og tittelen som standard i den midtre delen av hele oppsettet.

Hvis vi vil at de skal ligne mer på en "innloggingsidentitet øverst på siden", kan vi bruke `Spacer()` til å fylle ut resten av plassen, slik at innholdet vises nærmere toppen.

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

Resultatet blir:

![view](../../Resource/019_view1.png)

Men nå ligger `Image` og `Text` for nær toppen av skjermen og ser litt trange ut.

Da kan vi bruke `padding` for å legge til toppmarg for hele `VStack`.

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

Resultatet blir:

![view](../../Resource/019_view2.png)

Slik ser tittelområdet øverst på siden mer passende ut.

## Brukernavn og passord

En innloggingsside krever vanligvis at brukeren skriver inn brukernavn og passord.

I SwiftUI kan vi bruke `TextField` til å motta innholdet brukeren skriver inn.

Men merk: `TextField` lagrer ikke innskrevne data på lang sikt av seg selv, det er bare en inndatakontroll. Det som faktisk lagrer innholdet, er variablene vi binder til det.

Derfor må vi først opprette to `@State`-variabler for å lagre brukernavn og passord:

```swift
@State private var user = ""
@State private var password = ""
```

Når verdien til en `@State`-variabel endres, oppdaterer SwiftUI automatisk den relaterte visningen.

Deretter bruker vi `TextField` til å binde disse to variablene:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Her betyr `$user` og `$password` "binding".

Det vil si at når brukeren skriver i feltet, endres variabelen samtidig; og når variabelen endres, oppdateres også innholdet som vises i feltet.

Dette forholdet der "visning og data synkroniseres med hverandre", er binding.

Merk at vi må bruke skrivemåten med `$` her:

```swift
$user
```

Fordi `TextField` ikke trenger en vanlig streng, men en bindingsverdi som "kan endre data i begge retninger".

### Vise inndatafeltene

La oss plassere dem i `ContentView`:

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

Visningseffekt:

![view](../../Resource/019_view3.png)

Fordi `user` og `password` nå som standard er tomme strenger:

```swift
""
```

Vil feltet først vise plassholdertekst, for eksempel:

```swift
input user
```

Denne teksten er bare et hint til brukeren om "hva som skal skrives inn her", og er ikke det egentlige innholdet.

### Optimalisere inndatafeltene

Nå kan inndatafeltene allerede brukes, men standardstilen er ganske enkel.

For å gjøre grensesnittet tydeligere kan vi legge til en tittel foran feltet og gjøre litt enkel stilforbedring på selve feltet.

For eksempel kan vi først legge til en tittel:

```swift
Text("Username")
    .fontWeight(.bold)
```

Deretter bruker vi `HStack` for å plassere tittelen og feltet på samme rad:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Vi bruker `HStack` her fordi vi vil "vise tittelen til venstre og feltet til høyre".

Merk at `TextField` som standard vil oppta den gjenværende tilgjengelige plassen.

![color](../../Resource/019_view6.png)

For å gjøre størrelsen på de to inndatafeltene mer ensartet kan vi bruke `frame(width:)` for å sette en bredde, slik at feltene ser ryddigere ut.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Legg deretter til en ramme slik at feltet blir tydeligere:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Nå legger vi både brukernavn og passord til i `ContentView`-visningen:

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

Visningseffekt:

![view](../../Resource/019_view4.png)

På dette punktet kan brukeren skrive inn brukernavn og passord.

## Innloggingsknapp

Nå legger vi til en innloggingsknapp nederst under feltene.

```swift
Button("Sign in") {

}
```

Deretter bruker vi `buttonStyle` for å gi knappen en tydeligere systemstil:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Visningseffekt:

![view](../../Resource/019_view5.png)

For å bekrefte at knappen faktisk reagerer på trykk, kan vi først skrive en `print` i knappen som test:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Når du klikker på knappen, vil konsollen skrive ut:

```swift
click Sign in
```

Dette viser at knappen allerede reagerer riktig på klikk.

## Innloggingslogikk

Nå legger vi til den mest grunnleggende valideringslogikken for innloggingsknappen: **sjekk om brukeren har skrevet inn brukernavn og passord**.

Vi ønsker å håndtere følgende situasjoner:

- Hvis brukeren ikke skriver inn noe, skriv ut `Empty`
- Hvis brukeren bare skriver inn én av dem, gi beskjed om hvilken som mangler
- Hvis både brukernavn og passord er skrevet inn, skriv ut `Success`

### Ingen informasjon skrevet inn

Fordi `user` og `password` som standard begge er tomme strenger:

```swift
@State private var user = ""
@State private var password = ""
```

Er de fortsatt tomme når brukeren ikke skriver inn noe.

I Swift kan typer som `String` bruke `isEmpty` for å sjekke om innholdet er tomt.

### Egenskapen isEmpty

`isEmpty` brukes ofte til å sjekke om strenger, arrayer og annet innhold er tomt.

For eksempel:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Hvis innholdet er tomt, returnerer `isEmpty` `true`; hvis innholdet ikke er tomt, returnerer `isEmpty` `false`.

Derfor kan vi bruke det til å avgjøre om brukernavn og passord har innhold.

### Bruke isEmpty til å sjekke variabler

Hvis brukeren ikke har skrevet inn noen informasjon, blir det slik:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Da kan vi skrive betingelsen slik:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Denne koden betyr: hvis `user` er tom, og `password` også er tom, så skriv ut:

```swift
Empty
```

Her er `&&` en logisk operator som betyr "og".

Det vil si at hele betingelsen bare blir sann når betingelsen til venstre er oppfylt og betingelsen til høyre også er oppfylt.

Derfor vil denne koden bare kjøres når både brukernavn og passord er tomme.

## Brukeren fylte bare ut en del

Deretter ser vi på en annen situasjon: brukeren fylte bare inn brukernavn, eller bare passord.

For eksempel:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Da er brukernavnet ikke tomt, men passordet er tomt.

Vi kan fortsette å bruke `isEmpty` til å sjekke dette:

### Når brukeren har skrevet inn konto eller passord

Hvis brukeren bare har skrevet inn brukernavn eller passord, må vi gi en tilsvarende melding om hva som mangler.

For eksempel hvis brukeren bare har skrevet inn brukernavn:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logikken i denne koden er: hvis brukernavnet er tomt, be om å fylle inn brukernavnet. Ellers sjekkes om passordet er tomt; hvis det er tomt, be om å fylle inn passordet.

### Brukeren har fylt inn all informasjon

Hvis både brukernavn og passord allerede er skrevet inn, vil `isEmpty` for begge returnere `false`.

Da kan vi skrive det slik:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Her betyr `!` "ikke", altså negasjon.

For eksempel:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Det vil si at `user.isEmpty` brukes til å avgjøre "om brukernavnet er tomt", mens `!user.isEmpty` brukes til å avgjøre "om brukernavnet ikke er tomt".

Det samme gjelder for passordet.

Så betydningen av denne koden er: brukernavnet er ikke tomt, og passordet er heller ikke tomt.

Når begge disse betingelsene er oppfylt, skrives dette ut:

```swift
Success
```

## Fullstendig valideringslogikk

Nå kombinerer vi disse tre situasjonene og skriver dem inn i `Button`:

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

Kjørerekkefølgen til denne koden kan forstås slik:

Først sjekkes:

```swift
if user.isEmpty && password.isEmpty
```

Hvis både brukernavn og passord er tomme, skrives `Empty` ut direkte.

Hvis de ikke begge er tomme, fortsetter programmet med å sjekke denne linjen:

```swift
else if user.isEmpty || password.isEmpty
```

Her betyr `||` "eller".

Det vil si at så lenge én av betingelsene er oppfylt, er hele uttrykket oppfylt.

Derfor vil `else if`-blokken kjøres så lenge brukernavnet er tomt, eller passordet er tomt.

Etter at vi går inn i kodeblokken, sjekker vi videre hvilket felt som faktisk ikke er fylt ut:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Hvis de to foregående betingelsene ikke er oppfylt, betyr det at brukernavnet ikke er tomt og at passordet heller ikke er tomt.

Da går programmet inn i den siste `else`:

```swift
print("Success")
```

Slik fullfører vi den mest grunnleggende valideringslogikken for innloggingsinput.

## Validering av brukernavn og passord

Logikken ovenfor sjekker bare "om det finnes innhold".

Men i en ekte app er det ikke nok bare å skrive inn innhold. Vanligvis må brukernavn og passord også sendes til serveren for verifisering.

Hvis serveren bekrefter at brukernavnet finnes og passordet er riktig, tillates innlogging; ellers vises en feil.

For å øve på denne prosessen kan vi først sette et midlertidig brukernavn og passord i koden for å simulere "korrekt innloggingsinformasjon":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Når brukernavn og passord begge ikke er tomme, sammenligner vi dem videre for å se om de er riktige:

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

Her betyr `==` "om de er like".

For eksempel:

```swift
user == userID
```

Det betyr om brukernavnet brukeren skrev inn er helt identisk med det riktige brukernavnet vi har satt. Passordet vurderes på samme måte.

Derfor skrives `Success` ut når brukernavnet og passordet som er skrevet inn er lik de fastsatte verdiene; hvis bare én av dem er ulik, skrives `Input error` ut.

Slik fullfører vi en enkel "simulert innloggingsverifisering".

Selv om dette ennå ikke er en ekte innloggingsfunksjon koblet til en server, er det allerede nok til å hjelpe oss å forstå: **etter at knappen trykkes, kan forskjellig kode kjøres basert på ulike betingelser**.

## Oppsummering

I denne leksjonen fullførte vi en grunnleggende innloggingsvisning og fokuserte særlig på logikken for "å avgjøre innholdet basert på betingelser".

Kjerneinnholdet i denne leksjonen er å bruke `isEmpty` til å sjekke om en streng er tom, og å bruke `if`-setninger sammen med logiske operatorer for å håndtere ulike situasjoner.

To svært viktige logiske operatorer er:

- `&&`: betyr "og", begge betingelsene må være oppfylt
- `||`: betyr "eller", det er nok at én betingelse er oppfylt

Når disse betingelsene til slutt blir `true` eller `false`, vil `if`-setningen kjøre forskjellig kode basert på resultatet.

Gjennom denne innloggingsvisningen har vi allerede begynt å komme i kontakt med en utviklingsmåte som kombinerer "grensesnitt + data + logisk vurdering".

## Fullstendig kode

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
