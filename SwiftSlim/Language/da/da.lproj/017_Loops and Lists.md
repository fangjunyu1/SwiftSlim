# Løkker og lister

I denne lektion skal vi lære `for`-løkken i Swift og `ForEach` i SwiftUI.

Begge kan hjælpe os med at læse elementerne i et array i rækkefølge. I rigtig udvikling har vi ofte brug for at hente en gruppe data ud ét element ad gangen og derefter behandle eller vise dem. En løkke er netop et vigtigt værktøj til at gøre dette.

Når vi browser på nettet eller bruger en app, ser vi ofte mange lister eller elementer. Den slags indhold bliver normalt først gemt i et `array`, derefter læst ét efter ét gennem en `løkke`, og til sidst vist i brugerfladen.

For eksempel Googles liste over søgeresultater:

![Google](../../Resource/017_google.png)

Hvert element i listen over søgeresultater svarer normalt til ét stykke data og bliver vist ét efter ét gennem en løkke.

Derfor optræder `arrays` og `løkker` ofte sammen. Et `array` er ansvarligt for at gemme en gruppe data, og en `løkke` er ansvarlig for at hente disse data i rækkefølge og udføre den samme handling.

Nu begynder vi med den mest grundlæggende `for`-løkke.

## Nedtælling

Antag, at vi vil simulere en nedtællingsfunktion og udskrive `“5, 4, 3, 2, 1”` i rækkefølge.

Den mest direkte måde at skrive det på er:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Denne metode kan godt simulere en nedtælling, men hvis der er meget indhold, bliver den meget gentagende, og det er heller ikke praktisk at ændre senere.

På dette tidspunkt kan vi først lægge dataene i et array og derefter bruge en `for`-løkke til at udskrive dem ét efter ét:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Denne skrivemåde er mere enkel og også lettere at udvide. Selv hvis der er mange tal i nedtællingen, behøver vi ikke skrive `print` linje for linje. Vi skal bare lade løkken automatisk håndtere hvert element i arrayet.

Vi kan lægge denne kode ind i en knap for at teste den:

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

Når der trykkes på knappen, vil `for`-løkken tage hvert heltal i `countDown` i rækkefølge og udskrive det i konsollen.

Lad os derefter se på, hvordan `for`-løkken fungerer.

## for-løkke

En `for`-løkke bruges til at behandle en gruppe data i rækkefølge. De mest almindelige objekter er arrays og intervaller.

Grundlæggende skrivemåde:

```swift
for element in arrayEllerInterval {
    kodeDerSkalUdføres
}
```

For eksempel nedtællingskoden fra før:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Her repræsenterer `i` det aktuelle element, der bliver hentet ud, og efter `in` står de data, der bliver kørt igennem, altså arrayet `countDown`.

Betydningen af denne kode er: programmet henter hvert element ud fra arrayet `countDown` i rækkefølge. Hver gang et element bliver hentet ud, bliver det midlertidigt repræsenteret med `i`, og derefter bliver koden inde i de krøllede parenteser udført.

Udførelsesprocessen kan forstås sådan:

* Det første element, der bliver hentet ud, er `5`, så på dette tidspunkt er værdien af `i` `5`
* `print(i)` bliver udført, og `5` bliver udskrevet
* Derefter fortsætter det med at hente det næste element `4`
* `print(i)` bliver udført igen, og `4` bliver udskrevet

De efterfølgende `3`, `2` og `1` bliver også udført på samme måde.

![for](../../Resource/017_for.png)

Når alle elementerne i arrayet er blevet behandlet, afsluttes `for`-løkken automatisk.

Vi kan bruge `for`-løkken til at hente hvert element i arrayet og udføre funktioner som denne nedtælling.

**Tip**: `i` er en meget almindelig navngivning i en `for`-løkke og bruges til at repræsentere det aktuelle element, der bliver hentet ud, men det er ikke en fast regel. Du kan også bruge andre engelske navne.

For eksempel kan vi bruge `num` til at repræsentere hvert element, der bliver hentet ud:

```swift
for num in countDown {
    print(num)
}
```

Inde i de krøllede parenteser skal du også bruge `num` til at repræsentere det aktuelle element.

### Løkke over et interval

En `for`-løkke kan ikke kun køre over arrays, men også over intervaller.

For eksempel, når vi skal beregne summen af de positive heltal op til `50`, skal vi lægge alle heltallene fra `1` til `50` sammen ét efter ét.

Den mest direkte skrivemåde kunne være:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problemet med denne skrivemåde er, at vi skal skrive hvert tal manuelt. Det er besværligt og ikke egnet til rigtige udviklingsscenarier.

På dette tidspunkt kan vi bruge interval-operatoren sammen med en `for`-løkke.

I kapitlet om “operatorer” tidligere lærte vi allerede interval-operatoren:

```swift
1...3   // 1, 2, 3
```

Her betyder `...` et lukket interval, altså at både start- og slutværdien er med.

Derfor kan vi her bruge en `for`-løkke over heltalsintervallet fra `1` til `50`:

```swift
for i in 1...50 {
    
}
```

Vi skal lægge disse heltal sammen, så vi har også brug for en variabel til at gemme summen:

```swift
var count = 0
```

Derefter lægger vi ved hver gennemløbning det aktuelle tal, der bliver hentet ud, til `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Denne kode betyder:

* `count` bruges til at gemme den aktuelle sum
* `for`-løkken henter heltallene fra `1` til `50` ét efter ét
* Hver gang et heltal bliver hentet ud, bliver `count += i` udført
* Når løkken er færdig, gemmes den endelige sum i `count`

På denne måde kan vi få summen af alle positive heltal op til `50`.

På samme måde, hvis vi vil beregne summen af heltallene fra `1` til `100`, skal vi bare ændre intervallet:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

En `for`-løkke kan altså ikke kun køre over arrays, men også over et interval.

Denne evne til at behandle gentagne data i rækkefølge er meget almindelig i udvikling.

Den kan hjælpe os med automatisk at håndtere meget gentagende arbejde, uden at vi manuelt behøver at skrive sammenlægningen af hvert tal eller andre lignende gentagne handlinger.

## Løkker i SwiftUI

`for`-løkken ovenfor hører til Swift-sproget.

Men i SwiftUI kan vi ikke bruge `for` direkte inde i visningsstrukturen til at generere views:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Det skyldes, at indholdet i `VStack` skal være SwiftUI-views, mens en almindelig `for`-løkke i sig selv ikke er et view.

Hvis vi i SwiftUI vil generere brugerflade gentagne gange ud fra indholdet i et array, skal vi bruge `ForEach`.

Hvis vi for eksempel vil vise navnene på alle medlemmer i en gruppe, kan vi skrive det sådan:

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

Derefter tilføjer vi de samme modifikatorer til hver `Text`:

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

Nu bliver hver `Text` vist med en mindre og tykkere skrifttype.

Visningsresultat:

![](../../Resource/017_for2.png)

Selvom modifikatorerne gør brugerfladen pænere, gør de også koden længere og mere gentagende.

Hvis navnene fortsætter med at blive flere, eller hvis vi senere vil ændre skrifttype, farve eller andre stilarter samlet, skal vi gentage og ændre meget ens kode, hvilket er besværligt og ikke nemt at vedligeholde.

På dette tidspunkt kan vi først lægge disse navne i et array og derefter bruge `ForEach` i SwiftUI til at generere views gentagne gange ud fra dataene i arrayet:

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

Denne kode er mere enkel. `ForEach` læser hvert element i arrayet i rækkefølge og viser det tilsvarende indhold i brugerfladen.

Når vi senere tilføjer nye navne, skal vi kun ændre navnene i arrayet `names` og behøver ikke hver gang at tilføje ny `Text` og de samme modifikatorer igen.

## ForEach

`ForEach` er en struktur i SwiftUI, som bruges til at generere views gentagne gange. Du kan forstå den som en struktur i SwiftUI, der minder om en `for`-løkke.

Grundlæggende brug:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-kode
}
```

For eksempel gruppens navne fra før:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Denne kode betyder:

`names` er det array, der bliver kørt igennem, altså de data, der skal vises.

`id:\.self` betyder, at selve elementet i arrayet bruges til at skelne mellem hvert element.

I det aktuelle eksempel indeholder arrayet strenge:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Derfor vil SwiftUI direkte bruge strengene `"Sam"`, `"John"`, `"Wathon"` og `"Bob"` til at skelne mellem de forskellige elementer.

For simple arrays, som er almindelige i begyndelsesfasen, såsom `String` og `Int`, kan vi normalt bare skrive:

```swift
id: \.self
```

Lige nu behøver du kun at huske denne ene skrivemåde. Der er ikke behov for at gå dybere ind i flere regler for `id` endnu.

I `item in` repræsenterer `item` det aktuelle element, der er hentet ud.

For eksempel er `item` `"Sam"` i den første gennemløbning, og i den anden gennemløbning er det `"John"`.

Derfor vil:

```swift
Text(item)
```

efter tur blive til:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Så funktionen af denne kode er: at hente hvert navn ud fra arrayet `names` ét efter ét og generere et `Text`-view for hvert navn.

### Udførelsesproces

Udførelsesprocessen kan forstås sådan:

* `ForEach` læser først det første element `"Sam"` fra arrayet `names`
* `item` repræsenterer midlertidigt `"Sam"`
* `Text(item)` viser `"Sam"`
* Derefter fortsætter den med at læse det næste element `"John"`
* Og udfører igen den samme view-kode

Til sidst bliver alle navnene i arrayet vist.

Fordelen ved denne skrivemåde er, at når der kommer flere navne, behøver vi ikke skrive mange `Text` gentagne gange. Vi skal bare ændre indholdet af arrayet.

### Løkke over billeder

`ForEach` kan ikke kun vise tekst, men også billeder, farver eller andre SwiftUI-views.

For eksempel forbereder vi 4 billeder:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Træk disse fire billeder ind i Assets-mappen i Xcode.

![image](../../Resource/017_for3.png)

Hvis vi ikke bruger `ForEach`, skal vi skrive hvert billede manuelt:

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

Denne skrivemåde kan godt opnå funktionen, men koden bliver forholdsvis lang.

Hvis der kommer flere billeder, skal vi skrive mere og mere gentaget `Image`-kode.

Hvis vi senere vil ændre billedstørrelsen samlet, skal vi også ændre dem ét efter ét.

På dette tidspunkt kan vi lægge billednavnene i et array og derefter bruge `ForEach` til at generere billed-views gentagne gange:

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

Her er `images` et streng-array, og hvert element i det er navnet på et billede.

`ForEach(images, id: \.self)` betyder, at hvert element i arrayet `images` bliver læst i rækkefølge, elementet selv bruges til at skelne mellem hver post, og derefter bliver det tilsvarende view genereret ud fra det aktuelle element.

For eksempel, hvis det første element, der læses, er `"430F9BEF"`, så svarer:

```swift
Image(item)
```

til:

```swift
Image("430F9BEF")
```

De næste billeder bliver også vist ét efter ét på samme måde.

![image](../../Resource/017_for4.png)

Her bruger vi stadig:

```swift
id: \.self
```

Årsagen er den samme som før, fordi elementerne i arrayet `images` også er simple strenge, så vi kan i begyndelsesfasen direkte bruge selve elementet som måde at skelne dem på.

Du kan forstå det som en fast formel:

**Når `ForEach` kører over et simpelt array af typen `String` eller `Int`, skriver vi normalt `id: \.self`.**

### Tilføj billeder

Hvis vi senere skal tilføje nye billeder, behøver vi kun at ændre indholdet i arrayet:

```swift
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Vi behøver ikke igen at skrive ny `Image`-kode.

Hvis der er mange billeder, kan det bruges sammen med `ScrollView`, ellers kan indholdet ikke vises fuldt ud, når det går ud over skærmen.

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

### Redigér billeder

Når vi skal ændre billedstilen samlet, skal vi kun ændre koden inde i `ForEach`.

For eksempel ved at ændre bredden til `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Så bliver alle billeder ændret på én gang, og vi behøver ikke ændre dem ét efter ét.

Det er en vigtig funktion ved `ForEach`:

**Når flere views har den samme struktur og kun indholdet er forskelligt, kan vi skrive view-koden én gang og derefter lade dataene i arrayet bestemme, hvad der skal vises.**

## Opsummering

I denne lektion lærte vi `for`-løkken og `ForEach`.

`for`-løkken bruges til at behandle elementerne i et array eller et interval i rækkefølge og hælder mere mod databehandling.

`ForEach` bruges i SwiftUI til at generere views gentagne gange ud fra indholdet i et array og hælder mere mod visning af brugerfladen.

I den nuværende begyndelsesfase er den mest almindelige skrivemåde for `ForEach`:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-kode
}
```

Her betyder `id: \.self`, at selve elementet bruges til at skelne mellem hvert element.

Når indholdet i arrayet er simple typer som `String` og `Int`, kan vi normalt i starten bruge denne ene skrivemåde.

Senere, når du browser på nettet eller bruger apps og ser en gruppe gentagne tekster, billeder eller andet listeindhold, kan du tænke på, at dette indhold i SwiftUI normalt først bliver lagt i et array og derefter vist ét efter ét med `ForEach`.
