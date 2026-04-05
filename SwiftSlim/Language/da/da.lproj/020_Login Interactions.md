# Logininteraktioner

I sidste lektion lavede vi en loginvisning og brugte knapper og betingelseslogik til at lave en enkel validering af det indtastede indhold.

I denne lektion fortsætter vi med koden fra sidste lektion som grundlag og lærer om `SecureField`-kodefeltet, `Alert`-advarselsboksen og også, hvordan man styrer visningen af forskellige views ud fra variabler.

Gennem denne lektion kan du få en dybere forståelse af det grundlæggende interaktionsforløb i en loginvisning, og det er også en grundlæggende logik, som bruges i mange apps.

## Kodeordsfelt

I sidste lektion brugte vi `TextField` til at indtaste kodeord.

Men i en rigtig loginflade bliver kodeord normalt ikke vist direkte. I stedet vises de som prikker eller andre skjulte effekter, så brugerens privatliv bliver beskyttet.

I SwiftUI er den kontrol, der specifikt bruges til at indtaste kodeord, `SecureField`.

For eksempel:

```swift
SecureField("Password", text: $password)
```

Skrivemåden ligner meget `TextField`, og den kræver også en hjælpetekst samt en bundet variabel.

Det kan enkelt forstås sådan: `SecureField` er også et inputfelt, men det skjuler det indtastede indhold.

Vi kan direkte ændre det `TextField`, der oprindeligt blev brugt til at indtaste kodeord, til `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Når brugeren indtaster kodeordet, vises indholdet ikke direkte på skærmen.

Visningseffekt:

![password](../../Resource/020_password.png)

Nu kan vi indtaste brugernavn og kodeord og efter at have klikket på knappen afgøre, om inputtet er korrekt.

### Vis feedback

Tidligere har vi hele tiden brugt `print` til at udskrive resultater.

Indholdet af `print` vises kun i konsollen. Udvikleren kan se det, når programmet køres i Xcode, men almindelige brugere kan ikke se disse beskeder på telefonen.

Det vil sige, at selv om programmet allerede har udført kontrollen, ved brugeren ikke, om det indtastede indhold er korrekt.

På dette tidspunkt har vi brug for en måde at vise beskeder direkte i brugerfladen.

## Alert-advarselsboks

I SwiftUI kan vi bruge `Alert` til at vise en pop op-besked.

Grundlæggende brug:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Dette stykke kode ser lidt mere komplekst ud end de tidligere kontroller, men vi kan forstå det ved at dele det op.

`Alert` består hovedsageligt af følgende dele:

- `"Title"`: advarselsboksens titel
- `isPresented`: en bundet boolsk værdi, der bruges til at styre, om advarselsboksen skal vises
- `Button(...)`: knappen i advarselsboksen
- `message:`: beskedindholdet, der vises i advarselsboksen

Det kan enkelt forstås sådan, at når den bundne variabel bliver `true`, vil systemet vise denne beskedboks.

Visningseffekt:

![alert](../../Resource/020_alert3.png)

Tilsvarende struktur:

![alert](../../Resource/020_alert.png)

### Alert er en modifier

Ligesom mange af de modifiers, vi tidligere har lært, bliver `Alert` også tilføjet efter et bestemt view.

For eksempel kan det sættes efter en knap:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Det kan også sættes efter den ydre `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

Det vil sige, at `Alert` ikke er et selvstændigt view, der står alene i brugerfladen, men en modifier, der hænger på et bestemt view.

Det kan enkelt forstås sådan, at `Alert` normalt skrives efter en knap eller et ydre layout for at vise en besked, når en bestemt betingelse er opfyldt.

### Vis Alert

Hvis vi vil vise en `Alert`, har vi brug for en variabel til at styre den.

For eksempel:

```swift
@State private var showAlert = false
```

Denne variabel er af typen `Bool`, altså kun med to værdier: `true` eller `false`.

Derefter binder vi den til `isPresented` i `Alert`:

```swift
isPresented: $showAlert
```

Når `showAlert` er `false`, vises advarselsboksen ikke; når `showAlert` er `true`, popper advarselsboksen op.

### Vis advarselsboks via knappen

Nu skal vi først implementere det enkleste scenarie:

Når brugeren ikke har indtastet noget som helst og bare klikker direkte på knappen `Sign in`, skal der vises en beskedboks, der fortæller: "Du har ikke indtastet noget endnu."

Først opretter vi en variabel til at styre denne beskedboks:

```swift
@State private var showEmpty = false
```

Derefter tilføjer vi en `Alert` efter `Button`:

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

Dernæst laver vi kontrollen i koden, når knappen klikkes:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Hvis både `user` og `password` er tomme, ændrer vi `showEmpty` til `true`.

Og fordi `Alert` er bundet til denne variabel, vil systemet automatisk vise beskedboksen, når den bliver `true`.

Visningseffekt:

![alert](../../Resource/020_alert1.png)

På den måde kan brugeren se beskeden med det samme efter at have trykket på knappen, uden at udvikleren behøver at gå til konsollen for at se `print`-outputtet.

### Gør knappen og advarselsboksen mere komplet

Tidligere håndterede vi kun situationen "intet er udfyldt".

Vi skal også håndtere følgende situationer:

- brugernavnet er ikke udfyldt
- kodeordet er ikke udfyldt
- både brugernavn og kodeord er udfyldt, men inputtet er forkert

Derfor skal vi også forberede passende beskeder til disse situationer.

Først tilføjer vi tre nye variabler:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Derefter fortsætter vi med at tilføje de tilsvarende `Alert` efter knappen:

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

Derefter gør vi bedømmelseslogikken i knappen mere komplet:

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

Når knappen vurderer, at brugeren ikke har udfyldt nogen oplysninger, har udeladt én oplysning, eller at inputvalideringen er mislykket, ændres den tilsvarende boolske variabel til `true`, og derefter vises den tilsvarende `Alert`.

Her anbefaler jeg, at du selv tester nogle forskellige situationer:

- udfyld ikke noget
- udfyld kun brugernavnet
- udfyld kun kodeordet
- udfyld både brugernavn og kodeord, men med forkert indhold
- udfyld både brugernavn og kodeord, og indholdet er korrekt

For at bekræfte, om der er problemer i vores kode. Det er også et meget vigtigt trin i appudvikling, nemlig "test".

Hvis programmet opfører sig forkert i et bestemt scenarie, betyder det, at der sandsynligvis er et problem i logikken, og at der er opstået en `Bug` i programmet.

Det, man ofte kalder en `Bug` i udvikling, betyder en fejl, en mangel eller en adfærd, som ikke lever op til forventningerne.

## Fuldfør loginvisningen

De `Alert`, vi talte om før, handlede alle om, hvordan man giver brugeren beskeder ved "forkert input".

Når brugeren indtaster det korrekte brugernavn og kodeord, viser vi normalt ikke en "advarselsboks", men går direkte videre til grænsefladen efter login.

Her er der et meget vigtigt videnspunkt: **Vis forskellige views afhængigt af værdien i en variabel.**

For eksempel:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Her bruger vi typen `Bool` til at styre visningen af views:

- hvis `login` er `true`, betyder det, at login allerede er lykkedes, og indholdet efter login vises
- hvis `login` er `false`, betyder det, at login ikke er lykkedes, og loginfladen vises fortsat.

Selvom `if`-sætningen er en betinget sætning i Swift, kan den i SwiftUI's `body` bruges til at styre logikken for, hvilket view der skal vises.

Det vil sige, at SwiftUI ud fra resultatet af betingelsen afgør, hvilket view der skal vises nu.

Vi kan lægge denne visningslogik ind i den nuværende `ContentView`:

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

Her har vi tilføjet en ny variabel, `login`, som bruges til at vise, om brugeren allerede er logget ind.

Derefter har vi placeret den loginvisningskode, vi allerede havde skrevet, efter `else`.

Logikken for visning af views:

- når `login` er `false`, betyder det, at login endnu ikke er lykkedes, og den oprindelige loginvisning vises fortsat.
- når `login` er `true`, betyder det, at login er lykkedes, og så vises loginvisningen ikke længere; i stedet vises `Login successful`.

Det vil sige, at `ContentView` viser forskelligt indhold alt efter værdien af `login`.

Lad os derefter ændre logikken for vellykket login i knappen:

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

Når det brugernavn og kodeord, som brugeren har indtastet, begge er korrekte, ændrer vi `login` til `true`.

Så snart værdien af `login` ændrer sig, ændres også resultatet af `if`-kontrollen i `ContentView`, og grænsefladen skifter fra den oprindelige loginvisning til `Login successful`.

Visningseffekten er som følger:

![view](../../Resource/020_view.png)

Nu har vi altså virkelig taget viden om "at vise forskellige views baseret på betingelser" i brug på denne aktuelle login-side.

I rigtige apps bruges denne type vurdering også ofte: forskellige views vises ud fra en bestemt værdi.

For eksempel vises login-siden, når brugeren ikke er logget ind; når brugeren er logget ind med succes, vises en anden grænseflade.

Kernetanken er: **Brug ændringer i variabler til at styre, hvilket indhold grænsefladen viser.**

## Opsummering

I denne lektion har vi lært tre vigtige ting:

1. At bruge `SecureField` til at indtaste kodeord, så kodeordets indhold ikke vises direkte i grænsefladen.
2. At bruge `Alert` til at vise beskeder til brugeren i stedet for kun at skrive til konsollen.
3. At bruge variabler og `if`-kontrol til at styre visningen af forskellige views og implementere skiftet mellem grænsefladen før og efter login.

Gennem denne viden er vi nu i stand til at færdiggøre en loginvisning med grundlæggende interaktion og samtidig få en dybere forståelse af SwiftUI's udviklingstanke: "Tilstanden ændrer sig, og grænsefladen opdateres."

## Fuld kode

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

## Udvidet viden - Alert med flere knapper

I den forrige del af denne lektion brugte vi den mest grundlæggende `Alert`, som kun havde én knap og hovedsageligt blev brugt til at give brugeren en besked.

Faktisk kan `Alert` også indeholde flere knapper, så brugeren kan træffe forskellige valg.

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

Når der klikkes på knappen, vises en beskedboks med tre valgmuligheder: `Ok`, `delete` og `cancel`.

Visningseffekt:

![alert](../../Resource/020_alert2.png)

Når der klikkes på forskellige knapper, udføres den tilsvarende kode.

### Button's role-egenskab

Her vil du opdage, at `Button` inde i `Alert` er lidt anderledes end den almindelige knap, vi lærte tidligere:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Her er der tilføjet en ekstra parameter, `role`.

I SwiftUI bruges `role` til at fortælle systemet, hvilken type handling denne knap tilhører.

Nogle almindelige roller er:

- `.cancel`: annulleringshandling
- `.destructive`: farlig handling, for eksempel sletning
- `nil`: almindelig handling

Forskellige `role` giver normalt også forskellige visuelle stilarter i grænsefladen.

For eksempel vises farlige handlinger ofte med en mere iøjnefaldende stil for at minde brugeren om at klikke med forsigtighed.

Desuden giver `role` ekstra semantisk information til knappen, hvilket gør det lettere for skærmlæsere (som VoiceOver på Apple-enheder) at forklare knapens funktion til brugeren.

Derfor er det en rigtig god vane at tilføje `role` til en knap i passende scenarier.
