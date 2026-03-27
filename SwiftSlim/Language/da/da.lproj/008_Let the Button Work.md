# Få knappen til at virke

I denne lektion lærer vi hovedsageligt om `Button`-knapper, `print` til debug-output og Swift-funktioner.

Disse emner er grundlaget for interaktiv programmering i SwiftUI.

## Knapper

Knapper er et af de mest almindelige UI-kontroller, vi bruger. Når vi skal downloade, åbne eller afslutte noget, klikker vi som regel på en knap.

For eksempel klikker man på knappen "Hent" i App Store for at downloade en app.

![Button](../../RESOURCE/008_button.png)

I SwiftUI repræsenteres knapper med `Button`.

Grundlæggende brug:

```swift
Button("") {
    
}
```

Strukturen kan opdeles i to dele:

```swift
Button("Knaptekst") {
    Kode der udføres, når knappen trykkes
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

Når den køres, vises en `Start`-knap.

![Button](../../RESOURCE/008_button1.png)

Når brugeren trykker på knappen, bliver koden inde i `{}` udført.

Det er vigtigt at bemærke, at `Button` er en SwiftUI-brugerfladekontrol (`View`), så den skal skrives inde i `body`.

### buttonStyle-modifier

I SwiftUI tilbyder `Button` systemets indbyggede knapstile, som kan bruges gennem modifieren `buttonStyle`.

For eksempel:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` bruger en knapstil, som systemet stiller til rådighed.

Almindelige muligheder omfatter:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Forskellen mellem de forskellige stilarter ligger hovedsageligt i, om knappen har ramme, baggrund og hvor stærkt den visuelt fremhæves.

## print-output

I programmering har man ofte brug for at kontrollere, om programmet faktisk når frem til et bestemt stykke kode.

Swift stiller funktionen `print` til rådighed til at udskrive debug-information.

Grundlæggende skrivemåde:

```swift
print("Hello")
```

Denne linje vil sende teksten til `Console`.

### Test om knappen virker

Vi kan skrive `print` inde i en knap for at teste, om knappen bliver trykket.

```swift
Button("Start") {
    print("Test 123")
}
```

Når knappen trykkes, vil `Console` vise:

```
Test 123
```

Det betyder, at knappen er blevet aktiveret korrekt.

![Button](../../RESOURCE/008_button3.png)

Bemærk: `print` er Swift-kode, ikke en brugerfladekontrol. Den kan ikke lægges direkte i `body`, ellers opstår der fejl.

For eksempel er denne skrivemåde forkert:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Fejl: body skal returnere et View
    }
}
```

I SwiftUI bruges `body` til at beskrive brugerfladens struktur, så der må kun stå brugerfladekontroller (`View`) som `Text`, `Button` og `Image`.

Almindelig kode som beregningslogik, `print` osv. skal placeres i knapper, funktioner eller andre event handlers.

### Console

Det indhold, som `print` udskriver, vises i Xcodes `Console`.

Hvis du ikke kan se `Console`, kan du klikke på knappen `Show the Debug Area` nederst til højre for at åbne debugområdet og derefter klikke på `Show the Console` for at vise konsollen.

![](../../RESOURCE/008_button4.png)

Nederst til venstre i `Console` er der to faner: `Executable` og `Previews`.

![](../../RESOURCE/008_button5.png)

Disse to faner svarer til forskellige køremiljøer: når man bruger Canvas-forhåndsvisningen, vises `print`-output under fanen `Previews`; hvis appen kører i simulatoren eller på en fysisk enhed, vises output under fanen `Executable`.

Derfor kan du først kontrollere, om du har valgt den rigtige fane, hvis du ikke kan se output fra `print`.

## Eksempel - ASCII-tegning

I nogle kodeprojekter ser man ofte ASCII-tegninger.

ASCII-tegninger er figurer sammensat af almindelige tegn, for eksempel:

![ASCII](../../RESOURCE/008_ascii.png)

Vi kan bruge en kombination af knap og `print` til at vise en ASCII-tegning.

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

Når knappen trykkes, vil `Console` vise:

```
 /\_/\
( o.o )
 > ^ <
```

Bemærk: Tegnet `\` i en streng skal skrives som `\\`, fordi backslash er et escape-tegn i strenge.

## Funktioner

Vi kan skrive kode direkte i knappen.

For eksempel:

```swift
Button("Start") {
    print("Hello")
}
```

Hvis der kun er lidt kode, er det helt fint. Men i reel udvikling kan logikken, der udløses af en knap, være ret omfattende.

For eksempel:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Der kan være meget mere kode
}
```

Hvis der kommer mere og mere kode, vil det gøre brugerfladekoden rodet og sværere at læse og vedligeholde.

Derfor samler vi normalt denne kode i en funktion og kalder derefter funktionen fra knappen.

### Hvad er en funktion

En funktion er et stykke kode, som kan genbruges.

Når noget kode skal udføres, behøver vi kun kalde denne funktion, og så bliver koden inde i funktionen kørt.

Det gør kodestrukturen mere overskuelig og gør det også lettere at genbruge logik.

### Grundlæggende skrivemåde

I Swift bruges nøgleordet `func` til at definere funktioner:

```swift
func randomInt() {
    // code
}
```

Denne kode definerer en funktion.

`randomInt` er funktionsnavnet, som bruges til at identificere dette stykke kode.

`()` er stedet for parametre. Her kan funktionen modtage data udefra. Hvis ingen data er nødvendige, kan de forblive tomme.

Inde i `{}` ligger funktionskoden, og al kode, der skal udføres, skrives her.

For eksempel:

```swift
func getName() {
    print("FangJunyu")
}
```

Funktionen her bruges til at udskrive et stykke tekst.

### Kald en funktion

At definere en funktion betyder kun, at koden er oprettet. Hvis vi vil udføre den, skal vi også kalde den.

Det gør man ved at sætte `()` efter funktionsnavnet:

```swift
getName()
```

Når programmet når til denne linje, vil koden inde i `getName` blive udført.

Komplet eksempel:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Når det køres, vil `Console` vise:

```
FangJunyu
```

### Brug funktioner i SwiftUI

I SwiftUI-visninger skrives funktioner som regel uden for `body`.

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

Når knappen trykkes, bliver funktionen `getName()` kaldt.

På den måde kan brugerfladekoden forblive enkel, mens den konkrete logik placeres i funktioner.

### Funktionsparametre

Nogle gange skal en funktion udføre forskellige handlinger afhængigt af forskellige data.

For eksempel vil vi gerne have, at funktionen kan udskrive forskellige navne i stedet for kun det faste navn `"FangJunyu"`.

Her kan vi bruge parametre, som kan forstås som de data, der sendes ind, når funktionen kaldes.

For eksempel:

```swift
func getName(name: String) {
    print(name)
}
```

Denne funktion har fået en ekstra parameter. `name` er parameternavnet, og `String` er parametertypen.

Det betyder, at funktionen skal modtage data af typen `String`.

Fordi funktionen nu kræver data, skal disse data gives, når funktionen kaldes.

```swift
getName(name: "Sam")
```

Når `"Sam"` sendes ind ved kaldet, vil funktionen bruge denne værdi og udskrive den.

Resultat ved kørsel:

```
Sam
```

## Eksempel - brug en funktion til at udskrive ASCII-tegning

I det tidligere eksempel skrev vi `print` direkte inde i knappen.

Men hvis ASCII-tegningen er mere kompleks, bliver koden lang. I den situation kan vi lægge logikken i en funktion, så brugerfladekoden bliver renere.

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

Når programmet køres, og knappen trykkes, vil `Console` vise:

```
 /\_/\
( o.o )
 > ^ <
```

Her sker der to ting, når brugeren trykker på knappen:

1. Knappen kalder funktionen `printCat()`
2. `print`-koden inde i funktionen bliver udført

På den måde er brugerfladekoden kun ansvarlig for at udløse handlingen, mens den konkrete logik håndteres i funktionen.

I reel udvikling bliver størstedelen af knaphandlinger netop implementeret gennem funktioner.

## Opsummering

I denne lektion lærte vi tre vigtige ting:

**1. Button-knapper**

`Button` er en kontrol i SwiftUI, der bruges til at udløse handlinger.

```swift
Button("Start") {

}
```

Når brugeren trykker på knappen, bliver koden i klammerne udført.

**2. print-output**

`print` bruges til at sende debug-information til `Console`.

```swift
print("Hello")
```

Udvikleren kan bruge `Console` til at se programmets kørselsstatus.

**3. Funktioner**

En funktion er et stykke kode, som kan genbruges.

```swift
func sayHello() {
    print("Hello")
}
```

Kald af funktionen:

```swift
sayHello()
```

Hvis funktionen har brug for data, kan den bruge parametre:

```swift
func sayHello(name: String) {
    print(name)
}
```

I de næste lektioner fortsætter vi med at lære flere SwiftUI-kontroller samt hvordan data interagerer med brugerfladen.

## Øvelser

Prøv at gennemføre følgende øvelser:

1. Opret en knap med teksten `"Hello"`
2. Når knappen trykkes, skal `Console` vise `Hello Swift`
3. Flyt outputkoden ind i en funktion, og kald derefter funktionen fra knappen
