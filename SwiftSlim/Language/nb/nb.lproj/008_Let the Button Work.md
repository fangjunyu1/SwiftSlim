# La knappen begynne å virke

I denne leksjonen lærer vi hovedsakelig om `Button`，`print` for feilsøkingsutskrift, og Swift-funksjoner.

Dette er grunnlaget for interaktiv programmering i SwiftUI.

## Knapp

Knappen er en av de vanligste UI-kontrollene vi bruker. Når vi trenger å laste ned, åpne eller avslutte noe, klikker vi vanligvis på en knapp.

For eksempel kan vi trykke på “Hent”-knappen i App Store for å laste ned en app.

![Button](../../RESOURCE/008_button.png)

I SwiftUI representeres en knapp med `Button`。

Grunnleggende bruk:

```swift
Button("") {
    
}
```

Strukturen kan deles inn i to deler:

```swift
Button("Knappetekst") {
    kode som kjøres når knappen trykkes
}
```

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Etter kjøring vises en `Start`-knapp.

![Button](../../RESOURCE/008_button1.png)

Når brukeren klikker på knappen, vil koden inne i `{}` bli utført.

Merk: `Button` er en grensesnittkontroll（`View`）i SwiftUI, og må derfor skrives inne i `body`。

### Modifikatoren `buttonStyle`

I SwiftUI gir `Button` innebygde systemknappestiler som kan brukes med modifikatoren `buttonStyle`。

For eksempel:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` bruker en knappestil som systemet tilbyr.

Vanlige alternativer inkluderer:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Forskjellen mellom de ulike stilene handler hovedsakelig om om knappen har ramme, bakgrunn og hvor sterk den visuelle fremhevingen er.

## `print`-utskrift

I programmering trenger vi ofte å kontrollere om programmet faktisk har kjørt til en bestemt del av koden.

Swift tilbyr funksjonen `print` for å skrive ut feilsøkingsinformasjon.

Grunnleggende skrivemåte:

```swift
print("Hello")
```

Denne linjen vil skrive teksten ut til Console（konsollen）。

### Test om knappen virker

Vi kan skrive `print` inne i knappen for å teste om knappen faktisk blir trykket.

```swift
Button("Start") {
    print("Test 123")
}
```

Når knappen trykkes, vil Console vise:

```
Test 123
```

Dette viser at knappen er blitt utløst.

![Button](../../RESOURCE/008_button3.png)

Merk: `print` er Swift-kode, ikke en grensesnittkontroll. Den kan ikke plasseres direkte i `body`，ellers blir det feil.

For eksempel er dette feil:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // feil: body må returnere en View
    }
}
```

I SwiftUI brukes `body` til å beskrive grensesnittstrukturen, og kan bare inneholde grensesnittkontroller（`View`），som `Text`、`Button`、`Image` og så videre.

Vanlig kode（beregningslogikk, `print` osv.）må plasseres i knapper, funksjoner eller andre hendelsesbehandlere.

### Console-konsollen

Innholdet som skrives ut med `print` vises i Console（konsollen）i Xcode.

Hvis du ikke ser Console, kan du klikke på `Show the Debug Area` nederst til høyre for å åpne debug-området, og deretter klikke på `Show the Console` for å vise konsollen.

![](../../RESOURCE/008_button4.png)

Nederst til venstre i Console finnes to etiketter: `Executable` og `Previews`。

![](../../RESOURCE/008_button5.png)

Disse to etikettene tilsvarer ulike kjøremiljøer: Når du forhåndsviser en visning i Canvas, vises `print`-utskrift under `Previews`；hvis appen kjører i simulator eller på ekte enhet, vises utskriften under `Executable`。

Derfor, hvis du oppdager at `print` ikke viser noe, kan du først kontrollere at riktig etikett er valgt.

## Eksempel - ASCII-tegning

I enkelte kodeprosjekter ser vi ofte ASCII-tegninger.

ASCII-tegning er bilder laget av vanlige tegn, for eksempel:

![ASCII](../../RESOURCE/008_ascii.png)

Vi kan bruke knapp + `print` til å skrive ut en ASCII-tegning.

Eksempelkode:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Når knappen trykkes, vil Console vise:

```
 /\_/\
( o.o )
 > ^ <
```

Merk: `\` i en streng må skrives som `\\`，fordi bakoverstrek er et escape-tegn i strenger.

## Funksjoner

Inne i en knapp kan vi skrive kode direkte.

For eksempel:

```swift
Button("Start") {
    print("Hello")
}
```

Hvis det er lite kode, er dette helt greit. Men i virkelig utvikling kan logikken som utløses av én knapp være mye større.

For eksempel:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // det kan være mye mer kode
}
```

Hvis det blir mer og mer kode, vil det bli rotete å skrive alt direkte inne i knappen, og det blir også vanskeligere å lese og vedlikeholde.

Derfor samler vi vanligvis denne koden i en funksjon, og kaller funksjonen inne i knappen.

### Hva er en funksjon

En funksjon er en kodeblokk som kan brukes om igjen.

Når en bestemt kode skal kjøres, trenger vi bare å kalle denne funksjonen, så vil koden inne i funksjonen kjøre.

Dette gjør kodestrukturen tydeligere og gjør det enklere å bruke koden flere ganger.

### Grunnleggende skrivemåte

I Swift defineres funksjoner med nøkkelordet **func**：

```swift
func randomInt() {
    // code
}
```

Denne koden definerer en funksjon.

`randomInt` er funksjonsnavnet og brukes til å identifisere denne kodeblokken.

`()` er plassen for parametere, der data kan tas imot utenfra. Hvis ingen data trengs, kan den stå tom.

Inne i `{}` finnes funksjonens kodeområde. All kode som skal kjøres, skrives her.

For eksempel:

```swift
func getName() {
    print("FangJunyu")
}
```

Denne funksjonen skriver ut en tekstlinje.

### Kalle en funksjon

Å definere en funksjon betyr bare å opprette den. Hvis du vil kjøre den, må du også kalle den.

Måten å kalle den på er å legge til `()` etter funksjonsnavnet:

```swift
getName()
```

Når programmet kjører til denne linjen, vil koden i funksjonen `getName` bli utført.

Fullstendig eksempel:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Etter kjøring vil Console vise:

```
FangJunyu
```

### Bruk funksjoner i SwiftUI

I en SwiftUI-visning skrives funksjoner vanligvis utenfor `body`。

For eksempel:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Når knappen trykkes, vil funksjonen `getName()` bli kalt.

Dette gjør at grensesnittkoden holder seg ryddig, mens den konkrete logikken behandles i funksjonen.

### Funksjonsparametere

Noen ganger trenger en funksjon å gjøre forskjellige ting avhengig av ulike data.

For eksempel kan vi ønske at funksjonen skal skrive ut ulike navn, i stedet for bare den faste teksten `"FangJunyu"`。

Da kan vi bruke parametere. Parametere kan forstås som data som sendes inn når funksjonen kalles.

For eksempel:

```swift
func getName(name: String) {
    print(name)
}
```

Denne funksjonen har fått én ekstra parameter. `name` er navnet på parameteren, og `String` er typen.

Det betyr at funksjonen må motta data av typen `String`。

Siden funksjonen nå trenger data, må disse dataene oppgis når funksjonen kalles.

```swift
getName(name: "Sam")
```

Når `"Sam"` sendes inn ved kall, vil funksjonen bruke denne verdien i utskriften.

Resultat:

```
Sam
```

## Eksempel - skriv ut ASCII-tegning med funksjon

I det forrige eksemplet skrev vi `print` direkte inni knappen.

Men hvis ASCII-tegningen er mer kompleks, blir koden veldig lang. Da kan logikken flyttes til en funksjon, slik at grensesnittkoden blir tydeligere.

Eksempelkode:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Når du klikker på knappen etter kjøring, vil Console vise:

```
 /\_/\
( o.o )
 > ^ <
```

Her skjer to ting når brukeren klikker på knappen:

1. knappen kaller funksjonen `printCat()`
2. `print`-koden inne i funksjonen blir utført

Dette gjør at grensesnittkoden bare trenger å utløse hendelsen, mens den konkrete logikken behandles i funksjonen.

I faktisk utvikling vil de fleste knapphandlinger bli gjennomført via funksjoner.

## Oppsummering

I denne leksjonen lærte vi tre viktige ting:

**1. `Button`-knappen**

`Button` er en kontroll i SwiftUI som brukes til å utløse handlinger.

```swift
Button("Start") {

}
```

Når brukeren klikker på knappen, kjøres koden i krøllparentesene.

**2. `print`-utskrift**

`print` brukes til å sende feilsøkingsinformasjon til Console.

```swift
print("Hello")
```

Utvikleren kan bruke Console til å se hva programmet gjør.

**3. funksjoner**

En funksjon er en kodeblokk som kan brukes flere ganger.

```swift
func sayHello() {
    print("Hello")
}
```

Kall funksjonen:

```swift
sayHello()
```

Hvis funksjonen trenger data, kan vi bruke parametere:

```swift
func sayHello(name: String) {
    print(name)
}
```

I de kommende leksjonene skal vi fortsette å lære flere SwiftUI-kontroller og hvordan data samhandler med grensesnittet.

## Øvelse

Prøv å fullføre følgende øvelser:

1. opprett en knapp med teksten `"Hello"`
2. når knappen trykkes, skriv ut `Hello Swift` i Console
3. flytt utskriftskoden inn i en funksjon, og kall denne funksjonen i knappen
