# Løkker og lister

I denne leksjonen skal vi lære om `for`-løkker i Swift, og `ForEach` i SwiftUI.

Begge disse kan hjelpe oss med å lese elementene i en array i riktig rekkefølge. I faktisk utvikling må vi ofte hente ut en gruppe data ett og ett element om gangen, og deretter behandle eller vise dem. Løkker er nettopp et viktig verktøy for å fullføre denne typen arbeid.

Når vi surfer på nettsider eller bruker en App, ser vi ofte mange lister eller elementer. Slike innhold blir vanligvis først lagret i en `array`, og deretter lest ut ett og ett element om gangen gjennom en `løkke`, før det til slutt vises i grensesnittet.

For eksempel, Googles søkeresultatliste:

![Google](../../Resource/017_google.png)

Hvert element i søkeresultatlisten tilsvarer vanligvis én datapost, og vises ett etter ett ved hjelp av en løkke.

Derfor dukker `array` og `løkker` ofte opp sammen. En `array` er ansvarlig for å lagre en gruppe data, mens en `løkke` er ansvarlig for å hente ut disse dataene i rekkefølge og utføre den samme operasjonen.

La oss nå begynne med den mest grunnleggende `for`-løkken.

## Nedtelling

La oss si at vi vil simulere en nedtellingsfunksjon og skrive ut `“5、4、3、2、1”` ett etter ett.

Den mest direkte måten å skrive dette på er:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Denne måten kan riktignok simulere en nedtelling, men dersom innholdet blir stort, vil det se veldig repetitivt ut, og det blir heller ikke praktisk å endre senere.

Da kan vi først legge dataene inn i en array, og deretter bruke en `for`-løkke til å skrive dem ut ett etter ett:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Denne måten å skrive på er mer kortfattet, og også lettere å utvide. Selv om det er mange tall i nedtellingen, trenger vi ikke å skrive `print` om og om igjen linje for linje. Vi trenger bare å la løkken automatisk håndtere hvert element i arrayen.

Vi kan legge denne koden inn i en knapp for å teste den:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Når knappen trykkes, vil `for`-løkken hente ut hvert heltall i `countDown` ett etter ett i rekkefølgen de ligger i arrayen, og skrive dem ut i konsollen.

Nå skal vi se nærmere på hvordan `for`-løkken fungerer.

## for-løkke

En `for`-løkke brukes til å behandle en gruppe data i rekkefølge. De vanligste objektene er array og intervaller.

Grunnleggende skrivemåte:

```swift
for element in array eller intervall {
    kode som skal kjøres
}
```

For eksempel, nedtellingskoden vi nettopp så:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Her representerer `i` elementet som nettopp er hentet ut. Etter `in` kommer dataene som skal itereres over, altså arrayen `countDown`.

Denne koden betyr: programmet vil hente ut hvert element fra arrayen `countDown` i rekkefølge. Hver gang ett element hentes ut, blir det midlertidig representert ved `i`, og deretter kjøres koden inne i klammeparentesene.

Kjøreprosessen kan forstås slik:

* Første gang hentes `5` ut, så verdien til `i` er `5`
* `print(i)` kjøres, og `5` skrives ut
* Deretter hentes neste element `4` ut
* `print(i)` kjøres igjen, og `4` skrives ut

De følgende `3`、`2`、`1` vil også kjøres ett etter ett på samme måte.

![for](../../Resource/017_for.png)

Når alle elementene i arrayen er behandlet, avsluttes `for`-løkken automatisk.

Vi kan bruke `for`-løkken til å hente hvert element i arrayen og gjennomføre funksjoner som nedtelling.

**Tips**: `i` er en veldig vanlig navngivning i en for-løkke, brukt for å representere elementet som nettopp er hentet ut, men det er ikke en fast regel. Vi kan også bruke andre engelske navn.

For eksempel kan vi bruke `num` til å representere hvert element som hentes ut:

```swift
for num in countDown {
    print(num)
}
```

Inne i klammeparentesene må vi også bruke `num` for å representere elementet som er hentet ut.

### Løkke over intervaller

En `for`-løkke kan ikke bare iterere over array, men også over intervaller.

For eksempel, dersom vi vil regne ut summen av de positive heltallene opp til `50`, må vi legge sammen alle heltallene fra `1` til `50` ett etter ett.

Den mest direkte måten å skrive dette på kunne være:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problemet med denne måten er at vi må skrive hvert tall manuelt. Det er både tungvint og lite egnet for reelle utviklingssituasjoner.

Her kan vi i stedet bruke intervalloperatoren sammen med en `for`-løkke.

I kapitlet om «operatorer» tidligere har vi allerede lært om intervalloperatoren:

```swift
1...3   // 1, 2, 3
```

Her betyr `...` et lukket intervall, altså at både startpunktet og sluttpunktet er inkludert.

Derfor kan vi her bruke `for`-løkken over heltallsintervallet fra `1` til `50`:

```swift
for i in 1...50 {
    
}
```

Siden vi skal summere disse tallene, trenger vi også en variabel for å lagre summen:

```swift
var count = 0
```

Deretter, for hver runde i løkken, legger vi det nåværende tallet til i `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Denne koden betyr:

* `count` brukes til å lagre summen så langt
* `for`-løkken henter ut heltallene fra `1` til `50` ett etter ett
* Hver gang et heltall hentes ut, kjøres `count += i`
* Når løkken er ferdig, lagrer `count` den endelige summen

På denne måten kan vi få summen av alle positive heltall opp til `50`.

På samme måte, dersom vi vil regne ut summen av heltallene fra `1` til `100`, trenger vi bare å endre intervallet:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

En `for`-løkke kan altså ikke bare iterere over array, men også over et intervall. Denne evnen til å behandle data i rekkefølge og gjentatte ganger er veldig vanlig i utvikling.

Den kan hjelpe oss med automatisk å håndtere mange repeterende oppgaver, uten at vi trenger å skrive ut prosessen med å summere hvert tall, eller andre lignende gjentatte operasjoner, for hånd.

## Løkker i SwiftUI

`for`-løkken vi så på tidligere tilhører Swift-språket.

Men i SwiftUI kan vi ikke bruke `for` direkte inne i en view-struktur for å generere views:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Det er fordi det som trengs inne i `VStack` er SwiftUI-views, mens en vanlig `for`-løkke i seg selv ikke er en view.

Hvis vi vil generere grensesnittet gjentatte ganger i SwiftUI basert på innholdet i en array, må vi bruke `ForEach`.

For eksempel, dersom vi vil vise navnene på alle medlemmene i en gruppe, kan vi skrive slik:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Visningsresultat:

![for1](../../Resource/017_for1.png)

Deretter legger vi til de samme modifikatorene på hver `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Nå vil hver `Text` vises med mindre og fetere skrift.

Visningsresultat:

![](../../Resource/017_for2.png)

Selv om modifikatorene gjør grensesnittet penere, gjør de også koden lengre og mer repetitiv.

Hvis navnene fortsetter å øke, eller vi senere vil endre skrifttype, farge og andre stiler samtidig, må vi gjenta og endre mye av den samme koden. Det blir ganske tungvint og vanskelig å vedlikeholde.

Da kan vi først legge disse navnene inn i en array, og deretter bruke `ForEach` i SwiftUI til å generere views gjentatte ganger basert på dataene i arrayen:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Denne koden er mer kortfattet. `ForEach` vil lese hvert element i arrayen ett etter ett og vise det tilsvarende innholdet i grensesnittet.

Når vi senere vil legge til nye navn, trenger vi bare å endre navnene i arrayen `names`, uten å måtte legge til `Text` og kompliserte modifikatorer på nytt hver gang.

## ForEach

`ForEach` er en struktur i SwiftUI som brukes til å generere views gjentatte ganger. Den kan forstås som en struktur i SwiftUI som ligner på en `for`-løkke.

Grunnleggende bruk:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-kode
}
```

For eksempel, gruppenavnene vi nettopp så:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Denne koden betyr:

`names` er arrayen som itereres over, altså dataene som skal vises.

`id:\.self` betyr at selve elementet i arrayen brukes til å skille hvert element fra de andre.

I eksempelet her lagrer arrayen strenger:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Derfor vil SwiftUI bruke selve strengene "Sam"、"John"、"Wathon"、"Bob" til å skille forskjellig innhold.

For enkle arraytyper som String og Int, som er vanlige i startfasen, kan vi vanligvis skrive slik:

```swift
id: \.self
```

Foreløpig trenger vi bare å huske denne ene skrivemåten, og vi trenger ikke å gå dypere inn i andre `id`-regler.

`item` i `item in` representerer elementet som nettopp er hentet ut.

For eksempel, i første runde av løkken er `item` `"Sam"`, og i andre runde er `item` `"John"`.

Derfor:

```swift
Text(item)
```

vil ett etter ett bli til:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Dermed er funksjonen til denne koden: å hente ut hvert navn fra arrayen `names` ett etter ett, og generere en `Text`-view for hvert navn.

### Kjøreforløp

Kjøreforløpet kan forstås slik:

* `ForEach` leser først det første elementet `"Sam"` i arrayen `names`
* `item` representerer midlertidig `"Sam"`
* `Text(item)` viser `"Sam"`
* Deretter leses neste element `"John"`
* Så kjøres den samme view-koden på nytt

Til slutt vil alle navnene i arrayen vises.

Fordelen med denne måten å skrive på er: når antall navn øker, trenger vi ikke å skrive mange `Text` på nytt. Vi trenger bare å endre innholdet i arrayen.

### Løkke over bilder

`ForEach` kan ikke bare vise tekst, men også bilder, farger og andre SwiftUI-views.

For eksempel, la oss si at vi har forberedt 4 bilder:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Dra disse fire bildene inn i Assets-mappen i Xcode.

![image](../../Resource/017_for3.png)

Hvis vi ikke bruker `ForEach`, må vi skrive hvert bilde manuelt:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Visningsresultat:

![image](../../Resource/017_for4.png)

Denne måten fungerer, men koden blir relativt lang.

Hvis det blir flere og flere bilder, må vi skrive mer og mer `Image`-kode om igjen.

Hvis vi senere vil endre bildestørrelsen samlet, må vi også gå inn og endre ett bilde av gangen.

Da kan vi legge bildenes navn i en array, og deretter bruke `ForEach` til å generere bilde-views gjentatte ganger:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Her er `images` en array av strenger, og hvert element i arrayen er navnet på et bilde.

`ForEach(images, id: \.self)` betyr å lese hvert element i arrayen `images` ett etter ett, bruke selve elementet for å skille hver post, og deretter generere den tilsvarende viewen basert på det nåværende elementet.

For eksempel, dersom det første elementet som leses er `"430F9BEF"`, så:

```swift
Image(item)
```

tilsvarer:

```swift
Image("430F9BEF")
```

De neste bildene vil også vises ett etter ett på samme måte.

![image](../../Resource/017_for4.png)

Her bruker vi fortsatt:

```swift
id: \.self
```

Grunnen er den samme som tidligere: elementene i arrayen `images` er også enkle strengtyper, så i startfasen kan vi bruke selve elementet direkte som måte å skille dem på.

Dette kan enkelt forstås som en fast regel:

**Når `ForEach` itererer over en enkel array som `String` eller `Int`, skriver vi vanligvis `id: \.self`.**

### Legge til bilder

Hvis vi senere trenger å legge til flere bilder, trenger vi bare å endre innholdet i arrayen:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Vi trenger ikke å skrive ny `Image`-kode om igjen.

Hvis det er mange bilder, kan vi bruke dette sammen med `ScrollView`, ellers vil innhold som går utenfor skjermen ikke kunne forhåndsvises fullstendig.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Endre bilder

Når vi vil endre stilen på alle bildene samlet, trenger vi bare å endre koden inne i `ForEach`.

For eksempel, endre bredden til `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

På denne måten vil alle bildene endres samtidig, og vi trenger ikke å gå inn og endre ett og ett.

Dette er en viktig funksjon ved `ForEach`:

**Når flere views har samme struktur, men bare ulikt innhold, kan vi skrive én view-kode og la dataene i arrayen bestemme hva som skal vises.**

## Oppsummering

I denne leksjonen lærte vi om `for`-løkken og `ForEach`.

`for`-løkken brukes til å behandle elementene i en array eller et intervall i rekkefølge, og er mer rettet mot databehandling.

`ForEach` brukes i SwiftUI til å generere views gjentatte ganger basert på innholdet i en array, og er mer rettet mot visning av views.

På dette startnivået er den vanligste skrivemåten for `ForEach` slik:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-kode
}
```

Her betyr `id: \.self` at selve elementet brukes til å skille hver post.

Når innholdet i arrayen er enkle typer som `String`、`Int`, kan vi vanligvis begynne med denne ene skrivemåten.

I fremtiden, når vi ser gjentatt tekst, bilder eller annet listeinnhold på nettsider eller i App-er, kan vi tenke på at slikt innhold i SwiftUI vanligvis først legges i en array, og deretter vises ett etter ett gjennom `ForEach`.
