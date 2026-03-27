# Gem sparegrisens beløb

I den forrige lektion lavede vi en enkel "sparegris". I denne lektion lærer vi, hvordan vi kan gøre beløbet i sparegrisen persistent.

Hovedindholdet i denne lektion er `UserDefaults` og property wrapperen `@AppStorage`. Samtidig ser vi også nærmere på rollen af `onAppear` og brugen af optional-typen (`nil`).

Det er vigtigt at bemærke, at denne lektion bygger videre på koden fra sparegrisen i den forrige lektion.

## Problemet med persistent lagring

Nu er "sparegrisens" brugerflade meget enkel og også meget praktisk at bruge.

![Piggy Bank](../../Resource/014_view.png)

Men der er et tydeligt problem: Hver gang vi opdaterer visningen eller lukker appen, bliver sparegrisens totalbeløb til `0`, og hele det tidligere beløb går tabt.

Det betyder, at dataene ikke faktisk er blevet gemt. Med andre ord kan den nuværende "sparegris" kun gemme midlertidige data.

### Hvorfor kan den ikke gemme persistent?

Det skyldes, at vi bruger en variabel deklareret med `@State`:

```swift
@State private var amount = 0
```

Variabler deklareret med `@State` har en livscyklus, som er fuldstændig afhængig af visningen.

Når visningen oprettes, initialiseres `amount` til `0`, og når visningen destrueres, bliver `amount` også destrueret.

Dataene i `amount` eksisterer kun i hukommelsen og er ikke gemt på enheden.

Hvis vi ikke ønsker, at `amount` skal være bundet til visningens livscyklus, skal vi implementere persistent lagring. Med andre ord skal vi gemme dataene på selve enheden.

### Hvad er "datapersistens"

Datapersistens kan forstås som at gemme data fra "midlertidig hukommelse" til "enhedens lager".

Når visningen eller appen lukkes, går dataene ikke tabt.

I Swift-udvikling kan enkel datapersistens implementeres med `UserDefaults`, mens mere komplekse data kræver `SwiftData` eller `CoreData`.

I denne lektion lærer vi først den enkleste løsning: `UserDefaults`.

## UserDefaults

`UserDefaults` bruges til at gemme lette nøgle-værdi-data og anvendes ofte til grundlæggende typer som `String`, `Int`, `Double` og `Bool`.

### Gem data

`UserDefaults` bruger metoden `set` til at gemme data:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Det første parameter i `UserDefaults` er de data, der skal gemmes. Her sender vi typer som `String` og `Int`.

Det andet parameter `forKey` fungerer som et variabelnavn og bruges til at identificere de data, som `UserDefaults` gemmer.

### Læs data

`UserDefaults` læser data gennem de tilsvarende metoder:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Ved læsning skal man bruge den metode, der svarer til datatypen, ellers kan der opstå fejl eller ukorrekte data.

### Bemærkninger om UserDefaults

#### 1. Returnerer optional-typer

Når man bruger `UserDefaults` til at læse data, returnerer nogle metoder optional-typer (`Optional`).

For eksempel:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Den returnerede type for `name` er:

```swift
String?
```

Det betyder, at der måske findes en værdi, og måske ikke gør.

**Hvorfor returneres en optional-type?**

Det skyldes, at en bestemt nøgle i `UserDefaults` ikke nødvendigvis har tilsvarende data.

For eksempel:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Hvis `"City"` aldrig tidligere er blevet gemt, vil læseresultatet være:

```swift
nil
```

Det er vigtigt at understrege, at `nil` betyder, at der ikke findes data, og ikke at det er en tom streng.

I lektionen om "typesystemet" mødte vi et lignende problem, hvor typekonvertering returnerede optional-typer ved fejl.

I dette tilfælde skal vi bruge `??` til at angive en standardværdi og foretage unwrapping:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Hvis `UserDefaults` kan læse data, bruges den læste værdi. Hvis der ikke læses noget (`nil`), bruges standardværdien.

#### 2. Returnerer ikke-optionale typer

Når `UserDefaults` læser typer som `Int`, `Double` og `Bool`, returnerer det ikke-optionale typer.

For eksempel:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Selv hvis disse nøgler aldrig tidligere er blevet gemt, vil resultatet ikke være `nil`.

I stedet returneres en standardværdi:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Begrænsning i datamængde

`UserDefaults` egner sig kun til at gemme mindre mængder data, som for eksempel appindstillinger eller simple tilstande.

I praksis egner det sig ikke til store datamængder eller data, der læses og skrives meget hyppigt.

## Gem "sparegrisens" beløb

Nu kan vi bruge `UserDefaults` til at implementere logikken, der gemmer sparegrisens samlede beløb.

Når brugeren trykker på knappen, lægges det indtastede beløb til totalen, og totalbeløbet gemmes i `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Nu har vi implementeret logikken til at skrive data.

## Forklaring af logikken bag datapersistens

Selvom vi allerede har færdiggjort logikken til vedvarende lagring, opdager vi under faktisk kørsel, at variablen `amount` stadig er `0`, hver gang visningen opdateres eller appen åbnes igen.

Det skyldes:

```swift
@State private var amount = 0
```

I SwiftUI bliver `@State`-variabler initialiseret på ny, når visningen oprettes.

Selvom værdien af `amount` er gemt i `UserDefaults`, nulstilles `amount` stadig til `0`, når visningen indlæses igen.

Det viser, at vi foreløbig kun har gemt dataene i `UserDefaults`, men ikke gendannet dem i selve visningen.

Derfor skal vi, når visningen indlæses, manuelt læse dataene fra `UserDefaults` og tildele dem til `amount`. Først da bliver hele logikken for persistent lagring gennemført.

### Logisk analogi

Man kan forstå denne proces som "klassens tavle":

Når der undervises, skriver læreren indhold på tavlen. Dette svarer til den aktuelle tilstand i visningen (`@State`).

Når timen slutter, bliver tavlen visket ren for at forberede næste undervisning. Det svarer til, at visningen destrueres, og dataene i `@State` bliver ryddet.

For at undgå at miste undervisningsindholdet gemmer læreren det på forhånd i undervisningsmateriale. Dette materiale svarer til de data, der er gemt i `UserDefaults`.

Når næste undervisning begynder, er tavlen tom fra start (`@State` initialiseres), og læreren skal skrive det tidligere indhold op igen ud fra materialet, altså læse dataene fra `UserDefaults`.

Det er vigtigt at forstå, at tavlen ikke automatisk gendanner det tidligere indhold. Det skal skrives op igen gennem "læsning af materialet", altså ved at læse fra `UserDefaults`.

## Brug onAppear til at læse data

Når visningen vises, skal vi manuelt læse værdien fra `UserDefaults` og tildele den til `amount`, som er en `@State`-variabel. På den måde bliver datapersistens reelt gennemført.

I SwiftUI kan vi bruge `onAppear` til at udføre initialiseringslogik, når visningen vises:

```swift
.onAppear {}
```

Læg koden til at læse `UserDefaults` i `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Når visningen oprettes, initialiseres `amount` til `0`; når visningen vises, udløses `onAppear`, og værdien læses fra `UserDefaults` og tilskrives `amount`. På denne måde kan visningen vise det totalbeløb, der sidst blev gemt.

Nu er hele logikken for datapersistens i "sparegrisen" gennemført.

## Fuld kode

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage property wrapper

SwiftUI tilbyder property wrapperen `@AppStorage`, som kan forenkle logikken omkring lagring med `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` er en indpakning af `UserDefaults`, og `"amount"` svarer til nøglen i `UserDefaults`.

Når visningen oprettes, læses dataene fra `UserDefaults`; når variablen ændrer sig, skrives den automatisk tilbage til `UserDefaults`.

Den understøtter SwiftUIs mekanisme til opdatering af tilstand, og ligesom `@State` vil den opdatere SwiftUI-visningen, når værdien ændres.

Det betyder, at `@AppStorage` både kan stå for læsning og gemning af data, så vi ikke længere behøver manuelt at kalde `UserDefaults` eller bruge `onAppear` til at læse data.

Derfor kan vi bruge `@AppStorage` til at erstatte den tidligere `UserDefaults`-logik:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Opsummering

I denne lektion lærte vi hovedsageligt følgende:

Først lærte vi, at `UserDefaults` bruges til at gemme lette data. Vi brugte `UserDefaults` til at gemme totalbeløbet på enheden. `UserDefaults` tilbyder metoder til læsning og skrivning, og vi så også, at man skal håndtere optional-typer i visse situationer.

Dernæst lærte vi, at `@State`-variabler kun bruges til at styre midlertidig tilstand i visningen, og at deres livscyklus følger visningens livscyklus. Når visningen oprettes igen, bliver `@State` også initialiseret på ny.

Ved gendannelse af data fra `UserDefaults` lærte vi at bruge `onAppear` til at læse `UserDefaults`, når visningen vises, og dermed gennemføre gendannelsen af data.

Til sidst brugte vi `@AppStorage` som erstatning for `UserDefaults`, så visningen automatisk læser data ved indlæsning og automatisk skriver dem ved ændringer. Derved erstattes den manuelle logik med `UserDefaults` og `onAppear`.

Gennem denne viden kan vi implementere en grundlæggende datalagringsfunktion i en app, så data kan gemmes vedvarende.

## Øvelser efter timen

Nu understøtter "sparegrisen" gemning af beløb, men funktionaliteten er stadig ikke fuldstændig.

1. Hvis brugeren vil tage penge ud, skal der designes en tilsvarende udbetalingslogik.
2. Hvis brugeren vil nulstille beløbet helt, skal der også implementeres en nulstillingslogik.
3. Hvis vi vil give sparegrisen et navn, skal vi også indføre lagring af data af typen `String`.

Du kan bygge videre på den nuværende version og gøre "sparegrisen" mere komplet.

## Udvidet viden - Problemet med standardværdien i inputfeltet

Vi kan stadig forbedre interaktionen i inputfeltet, så det bliver mere bekvemt at indtaste.

![textfield](../../Resource/015_view.png)

I den nuværende implementering er standardværdien i inputfeltet `0`. Hver gang brugeren vil skrive et nyt beløb, skal de først slette `0` og derefter indtaste det nye tal. Denne brugeroplevelse er ikke særlig god.

Vi bør lade inputfeltets startværdi være tom i stedet for `0`.

Det skyldes, at `TextField` og `number` er bundet tovejs:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Når `number` initialiseres til `0`, viser inputfeltet også `0`.

Derfor skal vi ændre `number` til en tom værdi, altså `nil`.

```swift
@State private var number = nil
```

På dette tidspunkt opstår følgende fejl:

```
Generic parameter 'Value' could not be inferred
```

Det er netop den situation, vi talte om i lektionen om "typesystemet": Når en variabel ikke automatisk kan typeinfereres, skal dens type deklareres eksplicit.

Fordi vi sætter `number` til `nil`, og `nil` i sig selv ikke indeholder nogen typeinformation, kan kompileren ikke afgøre, om variablen skal være `String`, `Int` eller noget andet, og derfor opstår fejlen.

Derfor skal vi deklarere typen af `number` eksplicit:

```swift
@State private var number:Int? = nil
```

Her betyder `Int?` en optional-type (`Optional`), og det betyder, at værdien af `number` enten kan være et `Int` eller `nil`.

På den måde vil inputfeltet være tomt ved initialisering i stedet for at vise `0`, når vi sætter værdien til `nil`.

### Unwrap optional-typen

Når vi ændrer `number` til en optional-type, vil den oprindelige beregningskode give en fejl:

```swift
amount += number
```

Fejlmeddelelse:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Det skyldes, at `number` nu kan være `nil`. Hvis vi bruger den direkte i en beregning, bliver det til:

```swift
amount += nil
```

Det er tydeligt, at `nil` ikke kan lægges til `amount`, så denne operation er ugyldig.

Derfor skal optional-typer unwraps, før de kan bruges i beregninger.

Her kan vi bruge `??` til at give en standardværdi:

```swift
amount += number ?? 0
```

Når `number` er `nil`, bruges standardværdien `0`; når `number` har en værdi, bruges den faktiske indtastede værdi.

På den måde sikrer vi både, at beregningen bliver korrekt, og at inputfeltet som standard er tomt, så brugeren ikke længere behøver manuelt at slette `0`.

## Udvidet kode

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
