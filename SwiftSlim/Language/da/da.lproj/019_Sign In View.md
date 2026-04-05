# Loginvisning

I denne lektion lærer vi et meget praktisk scenarie: en loginvisning.

Uanset om det er en hjemmeside eller en app, er det ofte nødvendigt, at brugeren logger ind på sin konto og indtaster en adgangskode.

For eksempel GitHubs login-side:

![WordPress](../../Resource/019_github.png)

I denne lektion laver vi en lignende loginvisning, så brugeren manuelt kan indtaste konto og adgangskode, og vi kan kontrollere, om der er problemer med det indtastede indhold.

## Øverste layout

Vi skriver koden til loginvisningen i filen `ContentView`.

Først skriver vi mærkeområdet øverst i loginvisningen. Du kan først forberede et passende ikonbillede og lægge det i mappen `Assets`.

![icon](../../Resource/019_icon1.png)

Brug derefter `Image` og modifikatorer til at vise billedet:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Disse modifikatorer betyder:

- `resizable()`: gør det muligt at ændre størrelsen på billedet.
- `scaledToFit()`: skalerer billedet, mens dets oprindelige proportioner bevares.
- `frame(width: 100)`: sætter billedets viste bredde til `100`.

Brug derefter `Text` og modifikatorer til at vise login-titlen:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Brug derefter `VStack` til at arrangere billedet og teksten lodret:

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

Resultat:

![view](../../Resource/019_view.png)

Her er vi færdige med titelområdet øverst i loginvisningen.

### Optimer layoutet

Lige nu er billedet og titlen som standard placeret i midterområdet af det samlede layout.

Hvis vi ønsker, at de skal ligne mere "en loginmarkering øverst på siden", kan vi bruge `Spacer()` til at udvide den resterende plads og lade indholdet blive vist tættere på toppen.

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

Resultat:

![view](../../Resource/019_view1.png)

Men nu er `Image` og `Text` kommet for tæt på toppen af skærmen, og det ser lidt trangt ud.

Her kan vi bruge `padding` til at tilføje topafstand til hele `VStack`.

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

Resultat:

![view](../../Resource/019_view2.png)

På den måde ser titelområdet øverst på siden lidt mere passende ud.

## Brugernavn og adgangskode

En login-side kræver normalt, at brugeren indtaster et brugernavn og en adgangskode.

I SwiftUI kan vi bruge `TextField` til at modtage det indhold, som brugeren indtaster.

Men bemærk: `TextField` gemmer ikke selv inputdata på længere sigt; det er bare en inputkontrol. Det, der faktisk gemmer disse inputdata, er de variabler, vi binder til det.

Derfor skal vi først oprette to `@State`-variabler til at gemme brugernavn og adgangskode:

```swift
@State private var user = ""
@State private var password = ""
```

Når værdien af en `@State`-variabel ændrer sig, opdaterer SwiftUI automatisk de relaterede views.

Brug derefter `TextField` til at binde disse to variabler:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Her betyder `$user` og `$password` "binding".

Det vil sige, at når brugeren skriver tekst i inputfeltet, ændrer variablen sig synkront; og når variablen ændrer sig, ændrer det indhold, der vises i inputfeltet, sig også synkront.

Dette forhold, hvor "view og data synkroniserer med hinanden", er netop binding.

Bemærk, at der her skal bruges skrivemåden med `$`:

```swift
$user
```

Fordi `TextField` ikke har brug for en almindelig streng, men en binding-værdi, der "kan ændre data i begge retninger".

### Vis inputfelterne

Lad os placere dem i `ContentView`:

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

Fordi `user` og `password` lige nu begge som standard er tomme strenge:

```swift
""
```

vil inputfeltet derfor først vise pladsholdertekst, for eksempel:

```swift
input user
```

Denne tekst er kun en hjælp til brugeren om "hvad der skal indtastes her", og er ikke det egentlige inputindhold.

### Optimer inputfelterne

Nu kan inputfelterne allerede bruges, men standardstilen er ret enkel.

For at gøre grænsefladen mere tydelig kan vi tilføje en titel foran inputfeltet og lave en lille stiloptimering af selve inputfeltet.

For eksempel kan vi først tilføje en titel:

```swift
Text("Username")
    .fontWeight(.bold)
```

Brug derefter `HStack` til at placere titlen og inputfeltet på samme linje:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Her bruger vi `HStack`, fordi vi ønsker "at vise titlen til venstre og inputfeltet til højre".

Det er vigtigt at bemærke, at `TextField` som standard optager den resterende tilgængelige plads.

![color](../../Resource/019_view6.png)

For at gøre størrelsen på de to inputfelter mere ensartet kan vi bruge `frame(width:)` til at sætte en bredde, så inputfelterne ser mere ordnede ud.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Tilføj derefter også en ramme, så inputfeltet bliver lidt tydeligere:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Nu føjer vi både brugernavn og adgangskode til `ContentView`-viewet:

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

På dette tidspunkt kan brugeren allerede indtaste brugernavn og adgangskode.

## Login-knap

Nedenfor tilføjer vi en login-knap under inputfelterne.

```swift
Button("Sign in") {

}
```

Brug derefter `buttonStyle` til at give knappen en mere tydelig systemstil:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Visningseffekt:

![view](../../Resource/019_view5.png)

For at bekræfte, at knappen virkelig reagerer på tryk, kan vi først skrive en `print` i knappen for at teste:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Når der trykkes på knappen, vil konsollen udskrive:

```swift
click Sign in
```

Det viser, at knappen allerede har reageret korrekt på trykhandlingen.

## Login-logik

Nu tilføjer vi den mest grundlæggende valideringslogik til login-knappen: **at kontrollere, om brugeren har indtastet brugernavn og adgangskode**.

Vi ønsker at opnå følgende situationer:

- Hvis brugeren ikke indtaster noget, skal `Empty` udskrives
- Hvis brugeren kun indtaster én af delene, skal det angives, hvad der mangler
- Hvis både brugernavn og adgangskode er indtastet, skal `Success` udskrives

### Ingen oplysninger indtastet

Fordi `user` og `password` begge som standard er tomme strenge:

```swift
@State private var user = ""
@State private var password = ""
```

så vil de stadig være tomme, når brugeren ikke har indtastet noget.

I Swift kan typer som `String` bruge `isEmpty` til at afgøre, om indholdet er tomt.

### Egenskaben isEmpty

`isEmpty` bruges ofte til at kontrollere, om strenge, arrays og andet indhold er tomt.

For eksempel:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Hvis indholdet er tomt, returnerer `isEmpty` `true`; hvis indholdet ikke er tomt, returnerer det `false`.

Derfor kan vi bruge det til at afgøre, om brugernavn og adgangskode har noget input.

### Brug isEmpty til at kontrollere variabler

Hvis brugeren ikke har indtastet nogen oplysninger, så:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Her kan vi skrive betingelsen sådan:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Denne kode betyder: hvis `user` er tom, og `password` også er tom, så udskriv:

```swift
Empty
```

Her er `&&` en logisk operator og betyder "og".

Det vil sige, at hele betingelsen kun er opfyldt, når betingelsen til venstre er opfyldt, og betingelsen til højre også er opfyldt.

Derfor vil denne kode kun blive udført, når både brugernavn og adgangskode er tomme.

## Brugeren har kun udfyldt en del

Dernæst ser vi på en anden situation: brugeren har kun udfyldt brugernavnet eller kun udfyldt adgangskoden.

For eksempel:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

På dette tidspunkt er brugernavnet ikke tomt, men adgangskoden er tom.

Vi kan fortsat bruge `isEmpty` til at kontrollere dette:

### Situation hvor brugeren har udfyldt konto eller adgangskode

Hvis brugeren kun har udfyldt brugernavnet eller adgangskoden, skal vi give den tilsvarende besked om, hvad der mangler.

For eksempel, hvis brugeren kun har udfyldt brugernavnet:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logikken i denne kode er: hvis brugernavnet er tomt, så bed om at indtaste brugernavnet. Ellers kontrolleres det, om adgangskoden er tom, og hvis den er det, bedes der om at indtaste adgangskoden.

### Brugeren har udfyldt alle oplysninger

Hvis både brugernavn og adgangskode allerede er indtastet, vil `isEmpty` returnere `false` for dem begge.

Her kan vi skrive det sådan:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Her betyder `!` "negation".

For eksempel:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Det vil sige, at `user.isEmpty` bruges til at afgøre, "om brugernavnet er tomt", og `!user.isEmpty` bruges til at afgøre, "om brugernavnet ikke er tomt".

Adgangskoden følger præcis samme logik.

Så betydningen af denne kode er: brugernavnet er ikke tomt, og adgangskoden er heller ikke tom.

Når begge disse betingelser er opfyldt, bliver outputtet:

```swift
Success
```

## Komplet valideringslogik

Nu kombinerer vi disse tre situationer og skriver dem ind i `Button`:

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

Rækkefølgen, som denne kode udføres i, kan forstås sådan:

Første trin er først at kontrollere:

```swift
if user.isEmpty && password.isEmpty
```

Hvis både brugernavn og adgangskode er tomme, udskrives `Empty` direkte.

Hvis de ikke begge er tomme, fortsætter vi med at kontrollere denne linje:

```swift
else if user.isEmpty || password.isEmpty
```

Her betyder `||` "eller".

Det vil sige, at så længe én af betingelserne er opfyldt, er hele betingelsen opfyldt.

Derfor vil `else if`-kodeblokken blive udført, så længe brugernavnet er tomt, eller adgangskoden er tom.

Efter at være gået ind i kodeblokken kontrollerer vi yderligere, hvilket inputfelt der præcis ikke er blevet udfyldt:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Hvis ingen af de to foregående betingelser er opfyldt, betyder det, at brugernavnet ikke er tomt, og adgangskoden heller ikke er tom.

Så går programmet ind i den sidste `else`:

```swift
print("Success")
```

På den måde har vi fuldført den mest grundlæggende valideringslogik for login-input.

## Validering af brugernavn og adgangskode

Logikken ovenfor kontrollerer kun, "om der er indtastet indhold eller ej".

Men i en rigtig app er det ikke nok blot at indtaste indhold. Normalt skal vi også sende brugernavn og adgangskode til serveren for at blive verificeret.

Hvis serveren bekræfter, at brugernavnet findes, og at adgangskoden er korrekt, tillades login; ellers gives der besked om, at login mislykkedes.

For at øve denne proces kan vi først sætte en midlertidig konto og adgangskode i koden for at simulere "korrekte loginoplysninger":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Når både brugernavn og adgangskode ikke er tomme, sammenligner vi derefter, om de er korrekte:

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

Her betyder `==` "om det er lig med".

For eksempel:

```swift
user == userID
```

Det betyder, om det brugernavn, som brugeren har indtastet, er fuldstændig det samme som det korrekte brugernavn, vi har sat; adgangskodekontrollen følger den samme logik.

Derfor vil output være `Success`, når det indtastede brugernavn og adgangskoden er lig med de satte værdier; så længe én af dem ikke er lig, vil output være `Input error`.

På den måde har vi gennemført en enkel "simuleret loginverifikation".

Selvom det endnu ikke er en rigtig loginfunktion, der er forbundet til en server, er det allerede nok til at hjælpe os med at forstå: **efter at der er trykket på knappen, kan forskellig kode udføres alt efter forskellige betingelser**.

## Opsummering

I denne lektion har vi fuldført en grundlæggende loginvisning og især lært om "logikken til at vurdere det indtastede indhold ud fra betingelser".

Kernen i denne lektion er: at bruge `isEmpty` til at afgøre, om en streng er tom, og at bruge `if`-sætninger sammen med logiske operatorer til at håndtere forskellige situationer.

Blandt dem er der to meget vigtige logiske operatorer:

- `&&`: betyder "og", begge betingelser skal være opfyldt
- `||`: betyder "eller", det er nok, at én betingelse er opfyldt

Når disse betingelser til sidst giver `true` eller `false`, vil `if`-sætningen udføre forskellig kode baseret på resultatet.

Gennem denne loginvisning er vi allerede begyndt at komme i kontakt med en udviklingsmetode, der kombinerer "grænseflade + data + logisk vurdering".

## Komplet kode

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
