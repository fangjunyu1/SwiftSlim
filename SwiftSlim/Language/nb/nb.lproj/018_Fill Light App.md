# Fill Light-app

I denne leksjonen skal vi lage en veldig interessant fill light-app. Når natten kommer, kan vi få telefonskjermen til å vise forskjellige farger og bruke den som et enkelt fill light.

Denne fill light-appen kan bytte farger ved å trykke på skjermen, og den kan også justere lysstyrken med en glidebryter.

I dette eksempelet skal vi lære å bruke `brightness` for å justere lysstyrken til en visning, `onTapGesture` for å legge til en trykkgest på en visning, og `Slider`-kontrollen.

Resultat:

![Color](../../Resource/018_color.png)

## Vise en farge

Først skal vi la visningen vise en farge.

I SwiftUI representerer `Color` ikke bare en farge, men kan også vises som en visning:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Her representerer `Color.red` en rød visning. `.ignoresSafeArea()` gjør at fargevisningen fyller hele skjermen, slik at den ser mer ut som en ekte fill light-effekt.

Resultat:

![Color](../../Resource/018_color1.png)

### Fargearray og indeks

Akkurat nå vises bare én farge. Men et fill light har vanligvis mer enn én farge. Det kan også vise blått, gult, lilla, hvitt og andre farger.

Vi vil kunne bytte mellom forskjellige farger når skjermen trykkes på. Vi kan legge disse fargene i en array for å håndtere dem samlet:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

En array passer til å lagre "en gruppe data av samme type". Her er hvert element i arrayen en `Color`.

Hvis vi vil vise en bestemt farge, kan vi bruke en indeks:

```swift
colors[0]
```

Dette betyr å lese fargen på indeks `0` i arrayen, altså den første fargen.

Nå kan koden skrives slik:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

På denne måten viser skjermen den første fargen i arrayen, som er rød.

### Bruke indeks til å styre fargen

Hvis vi trenger å bytte mellom forskjellige farger, trenger vi en variabel for å styre indeksen i stedet for å skrive indeksen fast.

Vi kan bruke `@State` til å deklarere en variabel som lagrer indeksen:

```swift
@State private var index = 0
```

Her representerer `index` indeksen til den nåværende fargen.

Når `index` endrer seg, regner SwiftUI ut grensesnittet på nytt og oppdaterer det som vises.

Deretter endrer vi den opprinnelige `colors[0]` til:

```swift
colors[index]
```

På denne måten blir fargen som vises i visningen bestemt av `index`.

Nå blir koden slik:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Når `index` endrer seg, vil `colors[index]` også vise en annen farge.

For eksempel:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Det er viktig å merke seg at `index` ikke kan gå forbi den største indeksen i arrayen, ellers oppstår en feil fordi indeksen er utenfor området.

## Trykkgest

Nå kan vi vise forskjellige farger basert på `index`, men vi kan fortsatt ikke trykke for å bytte farger.

I den tidligere leksjonen om «Sitatkarusell» brukte vi `Button` for å styre bytting av sitater.

Denne gangen vil vi derimot «trykke på hele fargeområdet» for å bytte farge, så `onTapGesture` passer bedre.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Når vi trykker på fargevisningen, kjører denne koden:

```swift
index += 1
```

Dette betyr å øke `index` med `1`. Etter at indeksen øker, vil `colors[index]` vise neste farge i arrayen.

### `onTapGesture`

`onTapGesture` er en gestmodifikator som legger til en trykkehandling på en visning.

Grunnleggende bruk:

```swift
.onTapGesture {
    // code
}
```

For eksempel:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Når denne røde visningen trykkes på, vil koden i klammene kjøre, og dette blir skrevet ut i konsollen:

```swift
Click color
```

Gjennom `onTapGesture` kan vi bestemme hva som skal skje etter at en visning blir trykket på.

### Forskjellen fra `Button`

Tidligere lærte vi om visningen `Button`. Både `Button` og `onTapGesture` kan håndtere trykkehandlinger, men bruksområdene deres er ikke helt de samme.

`onTapGesture` passer bedre for å «legge til trykkfunksjon på en eksisterende visning», for eksempel `Color`, `Image`, `Text` eller en annen vanlig visning.

`Button` passer bedre når vi vil representere en tydelig knapp, som «Bekreft», «Send inn» eller «Slett».

I denne fill light-appen ønsker vi at fargebyttefunksjonen skal være enklere. Å trykke på hele fargeområdet for å bytte farge gjør `onTapGesture` til et godt valg her.

## Problemet med indeksen

Nå kan vi trykke på skjermen for å bytte mellom forskjellige farger.

Men her finnes det et viktig problem: **indeksen kan gå utenfor området til arrayen**.

For eksempel:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Hvis vi fortsetter å trykke på skjermen, vil `index` til slutt bli `4`, og da oppstår feilen «index out of range».

Dette skjer fordi `colors`-arrayen har `4` elementer, men indeksering starter på `0`, så gyldig indeksområde er `0 - 3`, ikke `4`.

Hvis vi prøver å lese `colors[4]`, vil feilen «index out of range» oppstå.

I den nåværende koden øker hvert trykk automatisk `index` med `1`. Hvis vi ikke håndterer dette, vil det til slutt gå utenfor gyldig område.

Derfor må vi sjekke indeksen når skjermen trykkes på: hvis det allerede er den siste fargen, går vi tilbake til den første fargen; ellers fortsetter vi å legge til `1`.

Vi kan bruke en `if`-setning til dette:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

I denne koden betyr `colors.count` antall elementer i arrayen.

I den nåværende arrayen finnes det 4 farger, så:

```swift
colors.count // 4
```

Men den største indeksen er ikke `4`, den er `3`, fordi indeksering starter på `0`.

Derfor må den siste indeksen skrives slik:

```swift
colors.count - 1
```

Det vil si:

```swift
4 - 1 = 3
```

Denne logikken betyr: hvis den nåværende indeksen allerede tilsvarer den siste fargen, sett indeksen tilbake til `0`; ellers øk den med `1`.

På denne måten kan fargene bytte i en løkke.

### Forenkle indekslogikken

Hvis vi vil gjøre koden mer kortfattet, kan vi også bruke ternæroperatøren:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Denne koden betyr: hvis `index == colors.count - 1` er sant, returner `0`. Hvis ikke, returner `index + 1`.

Til slutt tilordner vi resultatet tilbake til `index`.

Nå kan vi oppnå effekten av fargebytte.

Fullstendig kode:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Nå kan vi trykke på skjermen og bytte mellom forskjellige farger. En grunnleggende fill light-app er ferdig.

## Vise fargenavnet

Vi kan legge til en annen gruppe tekst som tilsvarer fargene, slik at når fargen endres, vises også navnet på den nåværende fargen på skjermen.

For eksempel:

- Rød viser `Red`
- Blå viser `Blue`
- Gul viser `Yellow`
- Lilla viser `Purple`

Her kan vi også bruke en array for å lagre fargenavnene:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Rekkefølgen på teksten i denne arrayen må samsvare nøyaktig med rekkefølgen på fargene i fargearrayen.

Deretter kan vi bruke `Text` til å vise fargenavnet for den nåværende indeksen:

```swift
Text(colorsName[index])
```

`Text` viser det nåværende fargenavnet basert på `index`.

Bruk modifikatorer for å forbedre utseendet til `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Dette gjør at `Text` vises i hvitt, med tittelstørrelse og fet skrift.

Nå har vi en `Color`-visning i fullskjerm. Hvis vi vil at `Text` skal vises oppå `Color`-visningen, må vi bruke `ZStack`-layoutbeholderen for å stable dem oppå hverandre.

```swift
ZStack {
    Color
    Text
}
```

Da blir koden slik:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

På denne måten er bakgrunnen fargevisningen, og over den ligger en tekstvisning.

Resultat:

![Color](../../Resource/018_color2.png)

Det er viktig å merke seg at i en `ZStack` vises visninger som skrives senere vanligvis foran. Hvis `Text` skrives før `Color`, kan `Color`-visningen som skrives etterpå dekke `Text`.

## Kontrollere lysstyrken

Nå kan vi bytte mellom forskjellige farger, men et fill light har også en annen viktig funksjon: **å justere lysstyrken**.

I SwiftUI kan vi bruke modifikatoren `brightness` for å justere lysstyrken til en visning.

For eksempel:

```swift
.brightness(1)
```

Vi kan skrive:

```swift
colors[index]
    .brightness(0.5)
```

Dette gjør den nåværende fargen lysere og mer lik effekten av et fill light.

Lysstyrkeområdet er `0 - 1`. `0` betyr å beholde den opprinnelige fargen, og jo nærmere verdien er `1`, desto lysere blir fargen. `1` betyr det lyseste hvite resultatet.

Selv om vi kan kontrollere `brightness` i koden, kan brukeren fortsatt ikke justere den direkte selv.

Derfor må vi legge til en kontroll som kan dras: `Slider`.

## `Slider`-visning

I SwiftUI er `Slider` en kontroll som brukes til å velge en verdi innenfor et område. Apple beskriver den som «en kontroll for å velge en verdi fra et begrenset lineært område».

Grunnleggende bruk:

```swift
Slider(value: $value, in: 0...1)
```

Forklaring av parametere:

1. `value: $value`: `Slider` må være bundet til en variabel.

    Når glidebryteren flyttes, endres verdien til variabelen samtidig. Omvendt, hvis variabelen endres, vil glidebryteren også oppdateres.

    Dette ligner veldig på `TextField`, som vi lærte tidligere. Begge «binder en kontroll til en variabel».

    En bundet variabel trenger symbolet `$` foran for å representere binding.

2. `in: 0...1`: denne parameteren representerer verdiområdet til glidebryteren.

    Her betyr `0...1` at minimumsverdien er `0` og maksimumsverdien er `1`.

    Når glidebryteren flyttes helt til venstre, vil den bundne variabelen være nær `0`; når den flyttes helt til høyre, vil den være nær `1`.

For eksempel:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` er bundet til variabelen `value`. Når glidebryteren flyttes, endres også verdien til `value` samtidig.

Utseende:

![Slider](../../Resource/018_slider.png)

Når `Slider` flyttes til venstre, blir den bundne `value` lik `0`. Når den flyttes til høyre, blir den `1`.

### Verdiområde

Verdiområdet til `Slider` er ikke fast. Det kan også skrives slik:

```swift
0...100
```

eller som et annet område.

Men i denne fill light-appen må vi kontrollere lysstyrken, så `0...1` er det mest passende valget.

## Bruke `Slider` til å kontrollere lysstyrken

Nå må vi koble `Slider` sammen med `brightness`.

Først lager vi en variabel for å lagre lysstyrkeverdien:

```swift
@State private var slider = 0.0
```

Her er `0.0` en verdi av typen `Double`.

Siden `Slider` vanligvis bindes til en numerisk type, og vi her ønsker at den skal endre seg kontinuerlig, er `Double` mer passende. I tillegg kan `brightness` bare ta imot en verdi av typen `Double`.

Deretter sender vi denne verdien inn i `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Når `slider == 0`, forblir fargen i standardtilstanden. Jo nærmere `slider` er `1`, desto lysere ser fargen ut.

### Legge til `Slider`-kontrollen

Deretter legger vi til en `Slider`-kontroll for å endre denne variabelen:

```swift
Slider(value: $slider, in: 0...1)
```

Når glidebryteren endres, endres også verdien av `slider`, og `brightness(slider)` oppdaterer lysstyrken samtidig.

Dette er et veldig typisk eksempel på at «variabler driver visningen» i SwiftUI.

### Justere utseendet til `Slider`

Som standard bruker `Slider` den tilgjengelige bredden.

Vi kan gi den en fast bredde:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Deretter legger vi til noen flere modifikatorer for å gjøre den lettere å se:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Dette gir glidebryteren hvit bakgrunn og avrundede hjørner, slik at den skiller seg tydeligere ut over `Color`-visningen.

Til slutt plasserer vi den nederst på skjermen.

Siden vi allerede bruker `ZStack`, kan vi plassere en `VStack` inni den og bruke `Spacer()` for å skyve `Slider` ned til bunnen.

## Fullstendig kode

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Resultat:

![Color](../../Resource/018_color.png)

## Oppsummering

Ved å bruke kunnskapen vi lærte tidligere, sammen med grunnleggende konsepter som farger og arrays, har vi laget en veldig interessant fill light-app.

Gjennom denne fill light-appen lærte vi å bruke `brightness` til å justere lysstyrke, `onTapGesture` til å legge til trykkehandlinger på visninger, og `Slider`-kontrollen.

Vi la til `onTapGesture` på `Color`-visningen for å bytte farger. Vi brukte også `Slider`-kontrollen til å endre en variabel som styrer `brightness`, noe som er et annet eksempel på at «variabler driver visningen».

Vi gikk også gjennom ternæroperatøren, brukte `ZStack` til å stable visninger oppå hverandre, og brukte arrays til å håndtere en gruppe data av samme type. Dette hjelper oss å forstå arrays og indekser enda bedre, inkludert det praktiske problemet med å unngå feil der indeksen går utenfor området.

Selv om dette eksemplet ikke er komplisert, knytter det sammen mange av de grunnleggende idéene vi har lært tidligere. Når de brukes i et lite, ekte prosjekt, blir det lettere å forstå hva hvert enkelt begrep brukes til.

### Virkelig bruksscenario

Tenk deg at du setter en gammel iPhone på bordet og bruker fill light-appen du har laget selv til å kontrollere fargen på lyset. Det ville vært en veldig god opplevelse.

Det finnes mange «fill light»-apper i App Store, og de ser heller ikke særlig kompliserte ut.

![AppStore](../../Resource/018_appStore.PNG)

Vi kan begynne med å utvikle enkle apper og prøve å publisere dem på App Store. Dette øker ikke bare interessen vår for utvikling, men dokumenterer også veksten vår.

### Øvelse etter timen

Du kan fortsette å tenke på hvordan denne fill light-appen kan utvides, for eksempel:

- Legg til flere farger
- Vis den nåværende lysstyrkeverdien
- Forbedre utformingen av slider-området nederst

Når du virkelig begynner å bruke denne kunnskapen, vil du oppdage at hvert begrep vi lærer faktisk er et verktøy for å bygge apper.

Jo flere verktøy vi mestrer, desto flere funksjoner kan vi lage.
