# Karusell med sitater

I denne leksjonen skal vi lage funksjonen “karusell med sitater”, og samtidig lære mer om grunnleggende Swift-kunnskap som arrayer（`Array`）og betingede utsagn（`if-else`）。

Vi skal vise hvordan man lagrer flere sitater, og bruke knappinteraksjon for å lage en sirkulerende visning av sitater.

![alt text](../../RESOURCE/011_word.png)

## Vis et sitat

Først må vi vise ett sitat i SwiftUI.

Den enkleste måten er å bruke `Text`-visningen:

```swift
Text("Slow progress is still progress.")
```

Denne koden kan bare vise ett fast sitat. Hvis vi vil vise flere sitater og kunne bytte mellom dem, må vi lagre sitatene.

Men en vanlig strengvariabel kan bare lagre ett sitat:

```swift
let sayings = "Slow progress is still progress."
```

Hvis vi trenger å lagre flere sitater, må vi deklarere en egen variabel for hvert sitat:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Men i faktisk utvikling er dette ikke bare tungvint. Siden hver variabel er uavhengig, kan vi heller ikke lage en fleksibel karusellvisning.

For å gjøre det enklere å administrere flere sitater, trenger vi en datastruktur som kan lagre dem sammen. Det er nettopp det en array（`Array`）er.

Etter at vi bruker en array, kan koden over lagres slik:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tips: I programmeringskonvensjoner brukes vanligvis flertallsform i navnet på en arrayvariabel som lagrer flere elementer, for eksempel `sayings`, for å vise at det er en samling.**

## Array

I Swift er en array en samling av ordnede elementer, og den skrives med hakeparenteser `[]`。

```swift
[]
```

Inne i en array kan vi ha flere elementer av samme type, og de skilles med engelsk komma `,`。

For eksempel:

```swift
[101, 102, 103, 104, 105]
```

Vi kan enkelt forstå en array som et tog:

![Array](../../RESOURCE/011_array1.png)

Hele toget representerer array-objektet, og hver vogn er ordnet i rekkefølge.

### Indeks og tilgang til elementer

Siden arrayer er ordnede, kan systemet finne bestemte elementer ut fra rekkefølgen. Denne mekanismen kalles indeks（Index）。

I Swift（og i de fleste programmeringsspråk）starter indeksene i en array på `0`，ikke `1`。Det betyr at det første elementet i arrayen har indeks `0`，det andre har indeks `1`，og så videre.

![Array](../../RESOURCE/011_array2.png)

Hvis vi vil hente et bestemt element i en array, trenger vi bare å legge til hakeparenteser etter arraynavnet, og skrive indeksen til elementet inni.

For eksempel:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Hvis vi prøver å få tilgang til en indeks utenfor gyldig område, oppstår problemet “Index Out of Range”。Derfor må vi være forsiktige når vi bruker indekser, og sørge for at de er innenfor gyldig område.

**Indeks utenfor området**

For eksempel: når arrayen bare har 5 elementer, er det gyldige indeksområdet `0` til `4`。Hvis vi prøver å få tilgang til `sayings[5]`，vil programmet ikke finne den tilsvarende “vognen”, og det vil føre til feilen “Index Out of Range”, som igjen kan få appen til å krasje.

![Array](../../RESOURCE/011_array3.png)

### Arbeid med arrayer

Arrayer støtter ikke bare statisk definisjon, men også operasjoner som å legge til, slette og endre elementer, og vi kan også få lengden på arrayen.

Tips: Hvis du vil endre en array, må den deklareres med `var`，ikke med konstanten `let`。

**1. Legg til elementer**

Vi kan bruke metoden `append` for å legge til et element bakerst i arrayen:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Slett elementer**

Med metoden `remove(at:)` kan vi slette et bestemt element i arrayen:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Endre elementer**

Vi kan bruke indeksen direkte for å endre et element i arrayen:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Tell lengden på arrayen**

Bruk egenskapen `count` for å hente antall elementer i arrayen:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Bruk array for å vise sitater

For å vise flere sitater kan vi lagre sitatene i en array, og deretter bruke en indeks for å hente og vise dem.

Først oppretter vi en `sayings`-array i `ContentView` for å lagre sitatene, og deretter leser og viser vi riktig sitat gjennom indeks i `Text`-visningen:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Her betyr `sayings[0]` det første sitatet i arrayen.

Hvis vi vil vise et annet sitat, trenger vi bare å endre indeksverdien i hakeparentesene:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definer sitatets indeks

For å få til dynamisk veksling mellom sitatene kan vi ikke skrive indeksen fast i `Text`-visningen.

Vi trenger å opprette en variabel som separat lagrer den indeksen som vises nå.

I SwiftUI kan vi bruke `@State` for å deklarere en indeks som kan endres:

```swift
@State private var index = 0
```

SwiftUI overvåker variabler som er pakket inn med `@State`。Når `index` endres, vil SwiftUI rendre visningen på nytt og vise det tilsvarende sitatet.

Deretter bruker vi `sayings[index]` til dynamisk å hente sitatet fra arrayen:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Når verdien til `index` endres, vil `Text` vise et annet sitat.

### Bruk en knapp til å kontrollere indeksen

For å styre byttet mellom sitatene kan vi bruke `Button` til å endre verdien av `index`。Hver gang knappen trykkes, øker `index` automatisk med `1`：

```swift
Button("Next") {
    index += 1
}
```

Når vi klikker på knappen, vil verdien til `index` gå fra `0` til `1`，utløse en oppdatering av visningen, og `Text(sayings[index])` vil lese neste sitat.

Her finnes det imidlertid et potensielt problem: hvis knappen trykkes kontinuerlig, vil `index` til slutt øke til en verdi som ligger utenfor arrayens område. Dette vil føre til feilen “arrayindeks utenfor område”. Hvis `index` for eksempel blir `5`（mens arrayens indeksområde er `0` til `4`）, vil programmet krasje.

For å forhindre at arrayindeksen går utenfor området, må vi introdusere en betingelseskontroll som sikrer at `index` ikke går utenfor arrayens grenser. Vi kan bruke en `if-else`-setning for å sjekke om `index` er mindre enn arrayens lengde.

## Betingelseskontroll: `if-else`

`if-else` er den vanligste betingede grenen i Swift. Den brukes til å sjekke om en betingelse er sann, og kjøre ulike kodeblokker basert på om betingelsen er sann eller usann.

Grunnstruktur:

```swift
if condition {
    // kode som kjøres når condition er true
} else {
    // kode som kjøres når condition er false
}
```

I en `if`-setning er `condition` en boolsk verdi（`Bool`），som kan være `true` eller `false`。Når betingelsen er `true`，kjøres koden i `if`-delen；ellers kjøres koden i `else`-delen.

For eksempel:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

I dette eksemplet er `age` lik `25`，og `if`-setningen sjekker om `age > 18` er sant. Siden betingelsen er oppfylt, skrives `"Big Boy"` ut.

Hvis vi ikke trenger `else`-delen, kan den utelates:

```swift
if condition {
    // kode som kjøres når condition er true
}
```

### Bruk betingelseskontroll for å begrense indeksområdet

For å forhindre at arrayindeksen går utenfor området, kan vi bruke `if` for å sikre at `index` ikke overskrider arrayens gyldige område:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logikkanalyse: verdien til `sayings.count` er `5`（det finnes 5 sitater）, så `sayings.count - 1` er `4`，som også er den siste gyldige indeksen i arrayen.

Når `index` er mindre enn `4`，er det trygt å øke den med `1` når knappen trykkes；så snart `index` når `4`，er betingelsen ikke lenger oppfylt, og et nytt trykk på knappen vil ikke gjøre noe.

Nå har koden implementert funksjonen for sitatbytte:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Sirkulerende sitater

Hvis vi ønsker at det første sitatet skal vises igjen når det siste sitatet er nådd og knappen trykkes, slik at vi får en sirkulerende sitatvisning, kan vi gjøre det gjennom `else`-delen:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Når knappen trykkes og `index` har nådd det siste elementet i arrayen, blir `index` satt tilbake til `0`，og sitatene begynner å vises fra start igjen.

## Forbedre sitatvisningen

Nå har vi implementert logikken for sitatkarusellen, men vi kan fortsatt gjøre grensesnittet penere.

Fullstendig kode:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

I dette eksemplet får `Text`-visningen en hvit halvgjennomsiktig bakgrunn og avrundede hjørner, `Button` bruker stilen `.borderedProminent`，og `VStack` får et bakgrunnsbilde.

Ekstra kunnskap: Når vi bruker modifikatoren `background()` med et bilde som bakgrunn, er standardoppførselen å fylle layoutområdet til den aktuelle visningen så mye som mulig. I mange tilfeller kan den naturlig strekke seg og dekke sikkerhetsområdet（Safe Area）。

Nå har vi realisert selve visningen for sitatkarusellen.

![SwiftUI View](../../RESOURCE/011_word.png)

## Oppsummering

Gjennom denne leksjonen lærte vi hvordan vi bruker arrayer til å lagre flere sitater, og hvordan vi bruker `if` og `if-else` til å implementere en karusell for sitater.

Vi lærte også de grunnleggende operasjonene på arrayer, som å legge til, slette og endre elementer, og hvordan man kan unngå at arrayindeksen går utenfor gyldig område.

Denne leksjonen forklarte ikke bare hvordan sitatkarusellen fungerer, men kombinerte også den grunnleggende bruken av arrayer og betingede setninger, slik at vi fikk trent på håndtering av data og kontroll av programflyt.

## Ekstra kunnskap - flere betingelser: `if-else if-else`

I faktisk utvikling må vi ofte håndtere flere betingelser. For eksempel, i et spill kan hendelse A trigges når poengsummen er `1`，hendelse B når den er `2`，hendelse C når den er `3`，og så videre.

Når vi står overfor mer enn to betingede grener, må vi bruke `if-else if-else` for å gjøre flere vurderinger.

Grunnsyntaks:

```swift
if conditionA {
    // kode som kjøres når conditionA er true
} else if conditionB {
    // kode som kjøres når conditionB er true
} else if conditionC {
    // kode som kjøres når conditionC er true
} else {
    // kode som kjøres når ingen betingelser er oppfylt
}
```

I dette tilfellet vil programmet sjekke betingelsene i rekkefølge, og utføre den første som er oppfylt. Hvis ingen betingelser er oppfylt, kjøres koden etter `else`。

I sitatkarusellen kan vi også bruke `if-else if-else` til å gjøre flere vurderinger:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Når `index` er `0`、`1`、`2` eller `3`，vil hvert klikk utføre `index += 1`；når `index` er `4`（det siste elementet）, settes `index` tilbake til `0`，slik at vi får en sirkulerende visning.

`else`-grenen fungerer som en sikkerhetsmekanisme for å forhindre ugyldige verdier（for eksempel hvis `index` feilaktig blir endret）。

Det er viktig å merke seg at `==` her betyr å sjekke “om to verdier er like”。Hvis `if`-setningen finner at `index` er lik et bestemt tall, returnerer den `true` og utfører kodeblokken etterpå. Hvis de ikke er like, fortsetter den til neste `if`-sjekk.

Denne typen flere vurderinger gjør det mulig å kjøre forskjellig kode under ulike betingelser.
