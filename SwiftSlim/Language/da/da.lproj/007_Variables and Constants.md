# Variabler og konstanter

I denne lektion lærer vi hovedsageligt om variabler og konstanter i Swift, og vi lærer også nogle almindelige datatyper og grundlæggende operatorer at kende.

Disse emner er noget af det mest grundlæggende i programmering og udgør også et vigtigt fundament for den videre læring af SwiftUI.

## Variabler og konstanter i hverdagen

Vi kan forstå variabler og konstanter ved hjælp af ting fra hverdagen.

Variabler i hverdagen:

- Hvert program på tv viser forskelligt indhold
- Vejret er ikke det samme hver dag
- Et ur ændrer sig hvert sekund

Det fælles kendetegn ved disse ting er, at de ændrer sig.

Hvis fjernsynet altid viste det samme billede, vejret altid var solrigt, og urets visere aldrig bevægede sig, så ville disse ting være konstanter.

Den ene kan ændre sig, den anden kan ikke.

## Forstå variabler og konstanter

I appudvikling er det ofte nødvendigt, at brugeren udfylder eller gemmer nogle oplysninger.

For eksempel:

- Kontonavn
- Fødselsdag
- Kontaktoplysninger
- Adresse

Disse oplysninger bliver gemt og derefter vist.

For eksempel indtaster brugeren et navn i appen:

```
FangJunyu
```

Vi er nødt til at gemme dette navn, så det senere kan vises i appen.

Vi kan forstå gemmeprocessen meget enkelt som at lægge noget i en skuffe.

Når vi gemmer et navn, er det som at lægge navnet ned i en skuffe.

Der kan være mange ting, der skal gemmes, og derfor også mange skuffer. For at vide, hvad der ligger i hver skuffe, skal vi give hver skuffe et navn.

For eksempel:

```
name
```

I dette eksempel er `name` navnet, og `FangJunyu` er den gemte information.

![Var](../../RESOURCE/007_var.png)

**I Swift skal man bruge en variabel (`var`) eller en konstant (`let`), hvis man vil gemme data.**

Da et navn normalt kan ændres, bør vi bruge en variabel.

```swift
var name = "FangJunyu"
```

Her erklæres en variabel ved navn `name`. Dens type er `String`, og dens værdi er `"FangJunyu"`.

### Forskellen på variabler og konstanter

Variabler erklæres med `var`:

```swift
var
```

Konstanter erklæres med `let`:

```swift
let
```

For eksempel:

```swift
var name = "FangJunyu"
let id = 123456
```

Hvis noget erklæres som en variabel, betyder det, at værdien kan ændres. Hvis det erklæres som en konstant, kan værdien ikke ændres bagefter.

Den vigtigste forskel mellem variabler og konstanter er derfor: om værdien må ændres eller ej.

### Ændring af en konstant

Hvis koden prøver at ændre en konstant:

```swift
let name = "Sam"
name = "Bob"
```

vil Swift fortælle, at tildelingen ikke kan gennemføres, fordi det er en konstant.

```
Cannot assign to property: 'name' is a 'let' constant
```

Denne mekanisme hjælper udviklere med at undgå, at vigtige data bliver ændret ved et uheld.

### Visning i SwiftUI

Åbn filen `ContentView.swift`, og erklær en variabel inde i `View`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Her erklæres en variabel ved navn `name`, og den vises på skærmen gennem `Text`.

Hvis vi ændrer indholdet af variablen:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

vil teksten, der vises i `Text`, også ændre sig.

På denne måde kan vi bruge variabler til at styre det indhold, der vises i interfacet, uden at vi hver gang behøver ændre teksten direkte inde i `Text`.

Hvis andre steder også skal have adgang til denne information, kan vi sende variablen videre, hvilket svarer til at give indholdet fra "skuffen" videre til et andet sted, hvor det skal bruges.

### Placeringen af variabler og konstanter i SwiftUI

I SwiftUI skrives variabler og konstanter normalt uden for `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Man kan selvfølgelig også skrive variabler og konstanter inde i `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Men der er en vigtig forskel mellem de to:

- Hvis variabler og konstanter skrives inde i `body`, bliver de oprettet på ny hver gang viewet beregnes igen
- Hvis de skrives uden for `body`, eksisterer de som egenskaber på view-strukturen, og kodestrukturen bliver mere tydelig

Derfor placerer man i reel udvikling normalt variabler og konstanter uden for `body`.

## Datatyper

Variabler kan gemme mange forskellige typer data. Disse typer kaldes datatyper.

For eksempel brugte vi tidligere `Text` til at vise tekst:

```swift
Text("Hello, World")
```

Her er `"Hello, World"` af typen streng (`String`).

En streng bruges til at repræsentere tekstindhold, og i Swift skal den stå i dobbelte anførselstegn `""`.

For eksempel:

```swift
var hello = "Hello, World"
```

Ud over strenge findes der mange andre datatyper i Swift.

De fire mest almindelige typer på begynderniveau er:

- `String`
- `Int`
- `Double`
- `Bool`

Disse fire typer kan dække det meste grundlæggende databehandling.

**String**

`String` betyder tekstindhold, for eksempel:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Strenge bruges ofte til at repræsentere brugernavne, titler og tekstindhold.

**Int**

`Int` betyder heltal, altså tal uden decimaler.

For eksempel:

```swift
var age = 26
var count = 100
```

Heltal bruges ofte til at repræsentere alder, antal og optælling.

**Double**

`Double` betyder tal med decimaler.

For eksempel:

```swift
var weight = 74.5
var height = 185.0
```

I Swift bruges decimaler som standard normalt som typen `Double`.

Der findes også en lignende type ved navn `Float`, men den har et mindre værdiområde. Derfor bruges `Double` oftere i reel udvikling.

**Bool**

`Bool` bruges til at repræsentere to tilstande: `true` og `false`.

For eksempel:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` bruges ofte til betingede vurderinger, for eksempel om en advarselsboks skal vises.

Når der kun er to mulige resultater, er `Bool` meget velegnet.

### Visning i SwiftUI

Når vi viser en værdi af typen `String`, kan vi bruge `Text` direkte:

```swift
Text(name)
```

Men typer som `Int` og `Double` er ikke strenge og kan derfor ikke direkte bruges som en del af tekstindholdet.

Hvis vi vil vise sådanne data i `Text`, kan vi bruge strenginterpolation (`String Interpolation`):

```swift
\()
```

Strenginterpolation skal skrives inde i en streng og bruger `\()` omkring variablen eller konstanten.

For eksempel:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

I koden ovenfor betyder `""` en streng, og `\()` bruges til at indsætte en variabel eller konstant i strengen.

For eksempel:

```swift
"DoubleNum: \(num * 2)"
```

Det viste indhold bliver:

```swift
DoubleNum: 2
```

På denne måde kan vi indsætte variabler eller konstanter i en streng og derefter vise dem i interfacet med `Text`.

Tip: `\()` kan kun bruges inde i strenge med `""`.

## Operatorer

Når vi erklærer en variabel eller konstant, ser vi ofte følgende skrivemåde:

```swift
var num = 1
```

Her kaldes `=` for tildelingsoperatoren.

Dens funktion er at tildele værdien på højre side til variablen på venstre side.

I dette eksempel bliver `1` tildelt variablen `num`.

Ud over tildelingsoperatoren findes der også nogle almindelige numeriske operatorer:

- `+`
- `-`
- `*`
- `/`

Når vi regner med tal, for eksempel data af typen `Int` eller `Double`, bruger vi disse operatorer.

For eksempel:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Når beregningen er udført, bliver resultatet gemt i variablen.

## Opsummering

Variabler, konstanter og operatorer er nogle af de mest grundlæggende begreber i programmering.

Gennem variabler og konstanter kan vi gemme forskellige slags data i et program. Gennem datatyper kan vi tydeligt definere, hvilken slags data det er. Gennem operatorer kan vi beregne og behandle data.

Denne viden er som grundlæggende værktøjer i programmeringens verden. Når man behersker dem, får man et solidt fundament for senere at lære Swift og SwiftUI.
