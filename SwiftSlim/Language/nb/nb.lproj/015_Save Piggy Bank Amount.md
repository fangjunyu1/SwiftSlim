# Lagre beløpet i sparegrisen

I forrige leksjon laget vi en enkel “sparegris”. I denne leksjonen skal vi lære hvordan beløpet i “sparegrisen” kan lagres vedvarende.

I denne leksjonen lærer vi hovedsakelig `UserDefaults` og egenskapsinnpakningen `@AppStorage`，og vi skal også utvide med forklaring av `onAppear` og hvordan man bruker Optional-typer（`nil`）。

Det er viktig å merke seg at denne leksjonen bygger videre på “sparegris”-koden fra forrige leksjon.

## Problemet med vedvarende lagring

Nå er grensesnittet til “sparegrisen” veldig enkelt og også lett å bruke.

![Piggy Bank](../../Resource/014_view.png)

Men det finnes et tydelig problem: hver gang visningen oppdateres eller appen lukkes, blir totalbeløpet i “sparegrisen” alltid `0`，og det tidligere totalbeløpet går helt tapt.

Dette betyr at dataene egentlig ikke er lagret. Med andre ord kan “sparegrisen” i sin nåværende form bare lagre midlertidige data.

### Hvorfor kan det ikke lagres vedvarende?

Dette skyldes at vi bruker en variabel deklarert med `@State`：

```swift
@State private var amount = 0
```

En variabel deklarert med `@State` har en livssyklus som er helt avhengig av visningen.

Når visningen opprettes, initialiseres `amount` til `0`；når visningen ødelegges, blir også `amount` ødelagt.

Dataene som lagres i `amount` finnes bare i minnet, og blir ikke lagret på enheten.

Hvis vi ikke vil at `amount` skal være bundet til visningens livssyklus, må vi implementere vedvarende lagring. Med andre ord må vi lagre dataene på enheten.

### Hva er “vedvarende datalagring”

Vedvarende datalagring kan forstås som å flytte data fra “midlertidig minne” til “lagring på enheten”.

Når visningen eller appen lukkes, går ikke dataene tapt.

I Swift-utvikling kan enkel vedvarende datalagring gjøres med `UserDefaults`，mens mer kompleks data krever `SwiftData` eller `CoreData`。

I denne leksjonen skal vi først lære den enkleste løsningen, nemlig `UserDefaults`。

## `UserDefaults`

`UserDefaults` brukes til å lagre lette nøkkel-verdi-data, og brukes ofte til grunnleggende typer som `String`、`Int`、`Double`、`Bool` og lignende.

### Lagre data

`UserDefaults` bruker metoden `set` for å lagre data:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Det første argumentet i `UserDefaults` er dataene som skal lagres, her altså verdier av typer som `String` og `Int`。

Det andre argumentet `forKey` kan sammenlignes med et variabelnavn og brukes til å identifisere dataene som lagres i `UserDefaults`。

### Les data

`UserDefaults` bruker tilsvarende metoder for å lese data:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Ved lesing må vi bruke metoden som tilsvarer riktig type, ellers kan det oppstå feil eller unøyaktige data.

### Ting å merke seg om `UserDefaults`

#### 1. Returnerer Optional-type

Når vi leser data med `UserDefaults`，vil noen metoder returnere Optional-typer（Optional）。

For eksempel:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Den returnerte typen til `name` er:

```swift
String?
```

Dette betyr at det kanskje finnes en verdi, eller kanskje ikke.

**Hvorfor returneres en Optional-type?**

Det er fordi en bestemt nøkkel i `UserDefaults` ikke nødvendigvis har tilhørende data.

For eksempel:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Hvis nøkkelen `"City"` aldri har vært lagret tidligere, blir resultatet ved lesing:

```swift
nil
```

Det er viktig å understreke at `nil` betyr at det ikke finnes data, og ikke en tom streng.

I leksjonen om “typesystem” støtte vi på et lignende problem: når typekonvertering mislykkes, returneres en Optional-type.

Da trenger vi å bruke `??` for å gi en standardverdi og pakke den ut:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Hvis `UserDefaults` finner data, brukes den leste verdien；hvis den ikke finner data（`nil`）, brukes standardverdien.

#### 2. Returnerer ikke-Optional-type

Når `UserDefaults` leser typer som `Int`、`Double` og `Bool`，returneres ikke-Optional-typer.

For eksempel:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Selv om disse nøklene aldri har vært lagret før, vil returverdien ikke være `nil`。

I stedet returneres standardverdier:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Begrenset datamengde

`UserDefaults` passer bare for små mengder data, som appkonfigurasjon og enkel tilstandsinformasjon.

I praksis passer det ikke for store datamengder eller data som leses og skrives veldig ofte.

## Lagre “sparegris”-beløpet

Nå kan vi bruke `UserDefaults` for å implementere logikken som lagrer totalbeløpet i “sparegrisen”.

Når brukeren trykker på knappen, legges det innskrevne beløpet til totalbeløpet, og totalbeløpet lagres deretter i `UserDefaults`。

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Nå har vi implementert logikken for å skrive data.

## Forklaring av logikken for vedvarende lagring

Selv om vi allerede har fullført logikken for å skrive vedvarende data, vil vi oppdage i faktisk kjøring at variabelen `amount` fortsatt er `0` hver gang visningen oppdateres eller appen åpnes igjen.

Dette er fordi:

```swift
@State private var amount = 0
```

I SwiftUI vil en `@State`-variabel bli initialisert på nytt når visningen opprettes på nytt.

Selv om verdien til `amount` er lagret i `UserDefaults`，vil `amount` likevel bli satt tilbake til `0` når visningen lastes inn på nytt.

Dette viser at vi bare har lagret dataene i `UserDefaults`，men ikke gjenopprettet dem i visningen.

Derfor må vi, når visningen lastes inn, også lese dataene manuelt fra `UserDefaults` og tilordne dem tilbake til `amount`，slik at hele logikken for vedvarende lagring blir fullført.

### Logisk sammenligning

Vi kan forstå prosessen som “tavlen i et klasserom”：

Når læreren underviser, skriver hun innhold på tavlen. Dette innholdet tilsvarer tilstanden i den nåværende visningen（`@State`）。

Når timen er over, viskes tavlen ren for å gjøre klar til neste time. Dette tilsvarer at visningen blir ødelagt, og dataene i `@State` blir tømt.

For å unngå at undervisningsinnholdet går tapt, lagrer læreren innholdet i undervisningsmaterialet på forhånd. Dette materialet tilsvarer dataene som er lagret i `UserDefaults`。

Når neste undervisning begynner, er tavlen tom i starten（`@State` blir initialisert），og læreren må skrive det gamle innholdet tilbake på tavlen ut fra undervisningsmaterialet（lese `UserDefaults`）。

Det er viktig å forstå at tavlen ikke automatisk gjenoppretter det gamle innholdet. Det må skrives tilbake ved å “lese undervisningsmaterialet”（lese `UserDefaults`）。

## Bruk `onAppear` til å lese data

Når visningen vises, må vi lese verdien fra `UserDefaults` manuelt og tilordne den til `amount` i `@State`，slik at vedvarende lagring faktisk blir realisert.

I SwiftUI kan vi bruke `onAppear` til å kjøre initialiseringslogikk når visningen vises:

```swift
.onAppear {}
```

Vi legger koden som leser `UserDefaults` inn i `onAppear`：

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Når visningen opprettes, initialiseres `amount` til `0`；når visningen vises, utløses `onAppear`，og verdien leses fra `UserDefaults` og tilordnes `amount`。På denne måten kan visningen vise det sist lagrede totalbeløpet.

Nå er hele logikken for vedvarende lagring i “sparegrisen” fullført.

## Fullstendig kode

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

## `@AppStorage`-egenskapsinnpakning

SwiftUI tilbyr egenskapsinnpakningen `@AppStorage`，som kan forenkle lagringslogikken med `UserDefaults`。

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` er en innpakning rundt `UserDefaults`，og `"amount"` tilsvarer nøkkelen i `UserDefaults`。

Når visningen opprettes, leses data automatisk fra `UserDefaults`；når variabelen endres, skrives den automatisk tilbake til `UserDefaults`。

Den støtter også SwiftUIs mekanisme for tilstandsoppdatering. Akkurat som `@State` vil SwiftUI-visningen oppdateres når verdien endres.

Det betyr at `@AppStorage` kan ta hånd om både lesing og lagring av data, slik at vi ikke lenger trenger å kalle `UserDefaults` manuelt, og heller ikke bruke `onAppear` for å lese dataene selv.

Derfor kan vi bruke `@AppStorage` til å erstatte `UserDefaults` i koden:

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

## Oppsummering

I denne leksjonen lærte vi hovedsakelig følgende:

Først lærte vi at `UserDefaults` brukes til å lagre lette data, og at vi kan bruke det til å lagre totalbeløpet på enheten. `UserDefaults` tilbyr metoder for lesing og skriving, og vi må også håndtere Optional-typer i enkelte tilfeller.

For det andre brukes `@State` bare til å håndtere midlertidig tilstand i en visning, og livssyklusen følger visningen. Når visningen opprettes på nytt, initialiseres `@State` igjen.

Når vi gjenoppretter data fra `UserDefaults`，lærte vi å bruke `onAppear` til å lese `UserDefaults` når visningen vises, og slik fullføre gjenoppretting av data.

Til slutt lærte vi å bruke `@AppStorage` til å erstatte `UserDefaults`，slik at data leses automatisk når visningen lastes, og skrives automatisk når data endres. Dermed kan vi erstatte den manuelle logikken med `UserDefaults` og `onAppear`。

Gjennom denne kunnskapen kan vi implementere en grunnleggende lagringsfunksjon i en app, slik at data kan lagres vedvarende.

## Øvelse etter timen

Nå støtter “sparegrisen” lagring av beløp, men funksjonen er fortsatt ikke komplett.

1. Når brukeren ønsker å ta ut penger, må vi lage en tilsvarende uttakslogikk.
2. Når brukeren vil tømme beløpet helt, må vi også implementere logikk for tilbakestilling.
3. Hvis vi vil gi sparegrisen et navn, må vi også introdusere lagring av data av typen `String`。

Du kan bygge videre på det eksisterende grunnlaget og gjøre funksjonene mer komplette, slik at “sparegrisen” blir mer fullverdig.

## Ekstra kunnskap - problemet med standardverdi i inndatafeltet

Nå kan vi også optimalisere interaksjonen i inndatafeltet ytterligere, slik at det blir mer praktisk å skrive inn data.

![textfield](../../Resource/015_view.png)

I den nåværende implementasjonen er standardverdien i feltet `0`。Hver gang brukeren skal skrive inn et beløp, må `0` først slettes, og deretter må et nytt tall skrives inn. Denne interaksjonsopplevelsen er ikke særlig god.

Vi bør la den opprinnelige verdien i inndatafeltet være tom, i stedet for `0`。

Dette skyldes at `TextField` og `number` er toveis bundet:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Når `number` initialiseres til `0`，vil inndatafeltet også vise `0`。

Derfor må vi endre `number` til en tom verdi, altså `nil`。

```swift
@State private var number = nil
```

Da oppstår feilen:

```
Generic parameter 'Value' could not be inferred
```

Dette er nøyaktig den situasjonen vi snakket om i “typesystemet”: når kompilatoren ikke automatisk kan utlede typen til en variabel, må vi deklarere typen eksplisitt.

Siden vi setter `number` til `nil`，og `nil` i seg selv ikke inneholder noen typeinformasjon, kan ikke kompilatoren avgjøre om variabelen er `String`、`Int` eller noe annet, og det fører til feil.

Derfor må vi deklarere typen til `number` eksplisitt:

```swift
@State private var number:Int? = nil
```

Her betyr `Int?` en Optional-type（Optional），som betyr at verdien til `number` enten kan være `Int` eller `nil`。

Når vi initialiserer den til `nil`，vil inndatafeltet være tomt i stedet for å vise `0`。

### Pakk ut Optional-typen

Når vi har gjort `number` om til en Optional-type, vil den opprinnelige beregningskoden gi feil:

```swift
amount += number
```

Meldingen er:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Dette er fordi `number` nå kan være `nil`。Hvis det deltar direkte i en beregning, blir det i praksis:

```swift
amount += nil
```

Det er åpenbart at `nil` ikke kan legges til `amount`，så dette er en ugyldig operasjon.

Derfor må Optional-typer pakkes ut før de brukes i beregninger.

Her kan vi bruke `??` til å gi en standardverdi:

```swift
amount += number ?? 0
```

Når `number` er `nil`，brukes standardverdien `0`；når `number` har en verdi, brukes den faktiske innskrevne verdien.

Dette sikrer både korrekt beregning og gjør at feltet er tomt som standard, slik at brukeren slipper å slette `0` manuelt før hver innskriving.

## Utvidet kode

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
