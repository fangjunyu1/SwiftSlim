# Variabler og konstanter

I denne leksjonen lærer vi hovedsakelig om variabler og konstanter i Swift, og blir kjent med noen vanlige datatyper og grunnleggende operatorer.

Dette er den mest grunnleggende kunnskapen i programmering, og også et viktig grunnlag for videre læring i SwiftUI.

## Variabler og konstanter i hverdagen

Vi kan forstå variabler og konstanter gjennom ting i hverdagen.

Variabler i hverdagen:

- innholdet i hvert TV-program er forskjellig
- været er ikke det samme hver dag
- klokken endrer seg hvert sekund

Felles for disse tingene er at de endrer seg.

Hvis TV-en alltid bare viste ett bilde, været alltid var solfylt og klokkens visere aldri beveget seg, da ville disse tingene være konstanter.

Den ene kan endre seg, den andre kan ikke.

## Forstå variabler og konstanter

I apputvikling må brukeren ofte fylle inn eller lagre informasjon.

For eksempel:

- kontonavn
- bursdag
- kontaktinformasjon
- adresse

Denne informasjonen blir lagret og vist.

For eksempel, hvis brukeren skriver inn et navn i en app:

```
FangJunyu
```

må vi lagre dette navnet, slik at det kan vises i appen.

Vi kan forstå lagringsprosessen enkelt som å legge noe i en skuff.

Når vi lagrer et navn, er det som å legge navnet i en skuff.

Det kan være mange ting som må lagres, og derfor også mange skuffer. For å vite hva som ligger i hver skuff, må vi gi skuffen et navn.

For eksempel:

```
name
```

I dette eksemplet er `name` navnet, og `FangJunyu` er informasjonen som lagres.

![Var](../../RESOURCE/007_var.png)

**I Swift må vi deklarere data med en variabel（`var`）eller en konstant（`let`）hvis vi vil lagre dem.**

Siden et navn vanligvis kan endres, bør vi bruke en variabel.

```swift
var name = "FangJunyu"
```

Her deklarerer vi en variabel med navnet `name`，typen er `String`，og verdien er `"FangJunyu"`。

### Forskjellen mellom variabler og konstanter

Variabler deklareres med `var`：

```swift
var
```

Konstanter deklareres med `let`：

```swift
let
```

For eksempel:

```swift
var name = "FangJunyu"
let id = 123456
```

Hvis noe deklareres som en variabel, betyr det at verdien kan endres；hvis det deklareres som en konstant, kan det ikke lenger endres.

Dermed er hovedforskjellen mellom variabler og konstanter om verdien får lov til å endre seg.

### Endre en konstant

Hvis koden prøver å endre verdien til en konstant:

```swift
let name = "Sam"
name = "Bob"
```

vil Swift si at tilordningen ikke kan fullføres, fordi det er en konstant.

```
Cannot assign to property: 'name' is a 'let' constant
```

Denne mekanismen kan hjelpe utviklere med å unngå at viktig data endres ved et uhell.

### Visning i SwiftUI

Åpne `ContentView.swift` og deklarer en variabel inne i visningen:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Her deklareres en variabel med navnet `name`，og vi viser den på skjermen med `Text`。

Hvis vi endrer innholdet i variabelen:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

vil teksten som `Text` viser også endres.

På denne måten kan vi bruke variabler til å kontrollere hva som vises i grensesnittet, uten å måtte endre teksten direkte i `Text` hver gang.

Hvis andre steder trenger denne informasjonen, kan vi også sende variabelen videre, som om vi lar andre bruke innholdet i “skuffen”.

### Hvor variabler og konstanter plasseres i SwiftUI

I SwiftUI skrives variabler og konstanter vanligvis utenfor `body`：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Selvfølgelig kan variabler og konstanter også skrives inne i `body`：

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Men det er en viktig forskjell:

- Hvis variabler og konstanter skrives inne i `body`，vil de bli opprettet på nytt hver gang visningen beregnes på nytt
- Hvis de skrives utenfor `body`，eksisterer de som egenskaper på visningsstrukturen og gjør kodestrukturen tydeligere

Derfor skrives variabler og konstanter vanligvis utenfor `body` i faktisk utvikling.

## Datatyper

Variabler kan lagre mange forskjellige typer data, og disse typene kalles datatyper.

For eksempel brukte vi tidligere `Text` til å vise tekst:

```swift
Text("Hello, World")
```

Her er `"Hello, World"` av typen streng（`String`）。

Strenger brukes til å representere tekstinnhold, og i Swift må de omsluttes av doble anførselstegn `""`。

For eksempel:

```swift
var hello = "Hello, World"
```

I tillegg til strenger finnes det mange andre datatyper i Swift.

De fire vanligste typene i startfasen er:

- `String`
- `Int`
- `Double`
- `Bool`

Disse fire typene dekker det meste av grunnleggende databehandling.

**`String`**

`String` representerer tekstinnhold, for eksempel:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Strenger brukes ofte til å representere brukernavn, titler og tekstinnhold.

**`Int`**

`Int` representerer heltall, altså tall uten desimaler.

For eksempel:

```swift
var age = 26
var count = 100
```

Heltall brukes ofte til å representere alder, antall og telling.

**`Double`**

`Double` representerer tall med desimaler.

For eksempel:

```swift
var weight = 74.5
var height = 185.0
```

I Swift brukes desimaltall vanligvis som standard som `Double`。

Det finnes også en lignende type som heter `Float`，men den kan representere et mindre tallområde, og derfor brukes `Double` oftere i faktisk utvikling.

**`Bool`**

Typen `Bool` brukes til å representere to tilstander: `true` og `false`。

For eksempel:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` brukes ofte i betingede vurderinger. For eksempel om en melding skal vises eller ikke.

Når det bare finnes to mulige resultater, passer `Bool` svært godt.

### Visning i SwiftUI

Når vi viser en verdi av typen `String`，kan vi bruke `Text` direkte:

```swift
Text(name)
```

Men typer som `Int` og `Double` er ikke strenger, og kan derfor ikke brukes direkte som en del av tekstinnholdet.

Hvis vi vil vise disse dataene i `Text`，kan vi bruke strenginterpolasjon（String Interpolation）：

```swift
\()
```

Strenginterpolasjon må skrives inne i en streng og omgis av `\()` rundt variabelen eller konstanten.

For eksempel:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

I koden over betyr `""` en streng, og `\()` brukes til å sette en variabel eller konstant inn i strengen.

For eksempel:

```swift
"DoubleNum: \(num * 2)"
```

Det viste innholdet blir:

```swift
DoubleNum: 2
```

På denne måten kan vi sette inn variabler eller konstanter i en streng, og deretter vise dem i grensesnittet med `Text`。

Tips: `\()` kan bare brukes inne i en streng `""`。

## Operatorer

Når vi deklarerer en variabel eller konstant, ser vi ofte denne skrivemåten:

```swift
var num = 1
```

Her kalles `=` en tilordningsoperator.

Funksjonen er å tilordne verdien på høyre side til variabelen på venstre side.

I dette eksemplet blir `1` tilordnet variabelen `num`。

I tillegg til tilordningsoperatoren finnes det også noen vanlige regneoperatorer:

- `+`
- `-`
- `*`
- `/`

Når vi regner med tall, som data av typen `Int` eller `Double`，bruker vi disse operatorene.

For eksempel:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Etter beregningen lagres resultatet i variabelen.

## Oppsummering

Variabler, konstanter og operatorer er de mest grunnleggende begrepene i programmering.

Gjennom variabler og konstanter kan vi lagre ulike typer data i programmet；gjennom datatyper kan vi tydelig angi hvilken type data det er；gjennom operatorer kan vi regne på og behandle dataene.

Denne kunnskapen er som grunnleggende verktøy i programmeringens verden. Når vi behersker dem, legger vi et solid grunnlag for videre læring i Swift og SwiftUI.
