# Typesystem

I de tidligere leksjonene har vi allerede lært om variabler, og vet at variabler kan lagre data av ulike typer.

For eksempel:

```swift
var hello = "Hello, World"
```

Her lagrer `hello` en tekst, så typen er `String`。

Deretter skal vi lære om begrepet type（Type）på en mer systematisk måte, samt eksplisitt typedeklarasjon og typeinferens, slik at vi kan forstå den egentlige naturen til variabler bedre.

## Hva er en type

I Swift har hver verdi en tydelig type. Typen bestemmer hva denne verdien er, og hva den kan brukes til.

For eksempel:

- `42` er en `Int`（heltall）
- `"Hello"` er `String`（streng）
- `true` er `Bool`（boolsk verdi）

Disse tilhører ulike typer og brukes også på ulike måter.

## Vanlige grunnleggende typer i Swift

I startfasen er de vanligste typene:

- `String`：streng（tekst）
- `Int`：heltall
- `Double`：flyttall（med desimaler, høyere presisjon）
- `Bool`：boolsk verdi（true/false）

I tillegg finnes også `Float`（flyttall）, men presisjonen er lavere enn `Double` og den brukes derfor sjeldnere；det finnes også `Character`（ett enkelt tegn）, for eksempel `"A"`、`"!"` og andre enkelttegn.

### Typedeklarasjon（eksplisitt type）

I Swift kan vi angi typen manuelt når vi deklarerer en variabel:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Vi legger til `: type` etter variabelnavnet for å deklarere typen.

Typen til en array skrives som `: [type]`：

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

I denne koden kan arrayen `scores` bare lagre elementer av typen `Int`，og `tags` kan bare lagre `String`。

Eksplisitt typedeklarasjon gjør hensikten med koden tydeligere, og kan i noen tilfeller unngå feil i typeinferens.

## Typeinferens

I mange tilfeller trenger vi ikke å deklarere typen eksplisitt:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Dette er fordi Swift-kompilatoren automatisk kan utlede typen basert på “startverdien”.

## Eksplisitt deklarasjon og typeinferens

I tidligere leksjoner introduserte vi ikke eksplisitt typedeklarasjon, for eksempel:

```swift
var age: Int = 18
```

I stedet prioriterte vi typeinferens:

```swift
var age = 18
```

I dette eksemplet er disse to skrivemåtene ekvivalente. `age` blir bestemt som typen `Int` i begge tilfeller. Sammenlignet med eksplisitt typedeklarasjon er typeinferens kortere og enklere.

Grunnen til at vi ikke la vekt på eksplisitt deklarasjon tidlig, er at typeinferens reduserer ekstra informasjon i koden og dermed gjør startfasen lettere å forstå for nybegynnere.

## Hvorfor trenger vi typer

Swift er et sterkt typet språk（Strongly Typed Language）。

Det betyr: når typen til en variabel først er bestemt, kan den ikke endres vilkårlig.

For eksempel:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Den første `20` er av typen `Int`，så den kan tilordnes til `age`；den andre `"20"` er av typen `String`，og stemmer ikke overens med `Int`，derfor oppstår det en feil.

`nums` er en array av typen `[Int]`，så den kan bare lagre heltall, og ikke blande inn strenger.

Typer begrenser hvordan data brukes, og gjør det mulig å oppdage typefeil under kompilering, noe som reduserer BUG-er forårsaket av typeforvirring og øker stabiliteten og vedlikeholdbarheten i koden.

## Når må typen deklareres eksplisitt

Selv om Swift kan utlede typer automatisk, finnes det tilfeller der kompilatoren ikke klarer det, eller gjetter feil. Da må vi deklarere typen manuelt.

**1. Tom array**

Når vi oppretter en tom array, må typen deklareres eksplisitt:

```swift
var nums: [Int] = []
```

Hvis typen ikke skrives:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Kompilatoren kan ikke utlede elementtypen i en tom array, og det fører derfor til en kompilasjonsfeil.

**2. Unngå feil inferens**

```swift
var value = 10   // Int
```

I dette eksemplet kan `10` riktignok også representere et flyttall（`Double`）, men siden det ikke finnes desimalpunkt, vil kompilatoren som standard tolke det som `Int`。

Hvis vi ønsker at `value` skal være et flyttall, må vi deklarere typen eksplisitt:

```swift
var value: Double = 10   // Double
```

Når resultatet av typeinferens ikke stemmer med forventningen, bør vi bruke eksplisitt typedeklarasjon eller justere formen på litteralen for å sikre korrekt type.

**3. Egendefinerte typer**

Senere skal vi også lære egendefinerte typer. Når vi bruker slike typer, må vi vanligvis også deklarere dem eksplisitt:

```swift
var info: GameInfo
var users: [User] = []
```

Årsaken er den samme som for tomme arrayer: kompilatoren kan ikke utlede typen automatisk fra en tom verdi.

## Typekonvertering

I Swift kan ulike typer ikke konverteres automatisk; vi må gjøre det manuelt.

For eksempel, hvis vi vil legge sammen to tall av forskjellige typer:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

I denne koden er `a` av typen `Int`，og `b` er `Double`。Siden typene er forskjellige, kan operasjonen ikke utføres direkte.

Før vi gjør regnestykket, må vi først konvertere en av verdiene til samme type:

```swift
var result = Double(a) + b
```

Denne koden betyr at `a` først konverteres fra `Int` til `Double`，og deretter legges sammen med `b`。Resultatet tilordnes så til `result`。

Merk at typekonvertering ikke endrer typen til den opprinnelige variabelen. For eksempel vil `Double(a)` ikke endre typen til `a`，men oppretter i stedet en ny `Double`-verdi som brukes i operasjonen.

Andre typer kan også konverteres på lignende måte, ved å bruke måltypen + `()` og sende inn verdien som skal konverteres. For eksempel:

```
Int()、Double()、String()
```

Eksempel:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Merk at ikke alle typekonverteringer lykkes fullt ut. For eksempel blir desimaldelen bare kuttet bort når `Double → Int`，uten avrunding.

## Typealias

I Swift kan vi også gi en eksisterende type et alias for å gjøre betydningen i koden tydeligere:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Her er `UserID` egentlig fortsatt `Int`，typen er ikke endret, men navnet er blitt mer meningsfullt.

I prosjekter med mye kode og mer kompliserte typer kan typealias gjøre koden mer lesbar.

## Typeeksempel

Nedenfor bruker vi et enkelt eksempel for å vise hvilken rolle typer spiller i faktisk utvikling.

### Opprett en variabel

Først lager vi en variabel `age`：

```swift
var age = 20
```

Siden vi trenger å vise og endre denne variabelen i SwiftUI, må vi deklarere den med `@State`：

```swift
@State private var age = 20
```

`private` ble nevnt tidligere, og betyr at denne variabelen bare kan brukes i den nåværende visningen. Vi skal lære mer om dette senere.

### Vis data i SwiftUI

Vis variabelen `age` i SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Nå vil visningen vise:

```swift
age: 20
```

### Endre data

Deretter legger vi til to knapper for å endre `age`：

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Kjøreresultat

Når vi klikker på `changeAge1`，vil `age` få verdien `18`：

```swift
age = 18
```

Siden `18` er av typen `Int` og samsvarer med typen til `age`，lykkes tilordningen.

`changeAge2` vil gi en feil:

```swift
age = "18"
```

Feilmelding:

```
Cannot assign value of type 'String' to type 'Int'
```

Dette skyldes at `"18"` er av typen `String`（strenger må være omsluttet av `""`）, mens `age` er av typen `Int`。Typene samsvarer ikke, og tilordning er derfor ikke mulig.

### Hvorfor oppstår feilen?

Nøkkelen ligger i denne linjen:

```swift
@State private var age = 20   // Int
```

Selv om typen ikke er deklarert eksplisitt, vil kompilatoren automatisk utlede `age` som typen `Int` fordi startverdien `20` er en `Int`。

Når typen først er bestemt, kan den ikke lenger tilordnes en verdi av en annen type.

Dessuten feiler ikke `changeAge2` først ved kjøring, men allerede i kompileringen. Koden kan derfor ikke kompilere.

Dette er også en av fordelene ved Swifts sterke typesystem: typeproblemer kan oppdages mens koden skrives.

### Korrekt skrivemåte

Etter å ha fjernet den feilaktige koden:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Når `changeAge1` trykkes, oppdateres visningen til:

```
age: 18
```

### Eksplisitt typedeklarasjon（valgfritt）

Vi kan også angi typen tydelig når vi definerer variabelen:

```swift
@State private var age: Int = 20
```

Denne skrivemåten gjør typen tydeligere, men er ikke nødvendig i enkle scenarier.

## Oppsummering

Denne leksjonen handlet hovedsakelig om Swifts typesystem og hvordan det brukes i praksis.

I Swift har hver verdi en tydelig type. Typen bestemmer betydningen av dataene og hvilke operasjoner de kan delta i.

Swift er sterkt typet. Når en variabels type først er bestemt, kan den ikke senere tilordnes en verdi av en annen type. Denne begrensningen gjør det mulig å oppdage feil i kompileringen, redusere problemer ved kjøring og øke sikkerheten i koden.

Typen til en variabel kan utledes automatisk fra startverdien, eller deklareres eksplisitt. I noen tilfeller（som tomme arrayer, feil typeinferens eller egendefinerte typer）kan ikke kompilatoren utlede typen riktig, og da må typen deklareres eksplisitt.

Ulike typer kan ikke konverteres automatisk. Vi må bruke `Int()`、`Double()`、`String()` og lignende for eksplisitt konvertering.

Typer støtter også aliaser. Spesielt i komplekse prosjekter kan typealias forbedre lesbarheten.

Typer er ikke bare merkelapper på data, men også en mekanisme for begrensning som sikrer at data brukes på en trygg, tydelig og kontrollerbar måte.

## Ekstra kunnskap - Optional-typer

Når vi konverterer typer, kan noen operasjoner mislykkes.

For eksempel å konvertere en `String` til `Double`：

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Her returnerer `Double(input)` ikke en `Double`，men:

```
Double?
```

Dette er en Optional-type（Optional）。

### Hvorfor returneres en Optional-type?

Fordi innholdet i en streng er usikkert. `"3.14"` kan konverteres til `Double`，men `"Hello"` kan ikke konverteres til `Double`。

Det betyr at denne operasjonen enten kan lykkes eller feile.

Derfor bruker Swift Optional-typer for å representere denne usikkerheten.

### Hva er en Optional-type?

En Optional-type betyr at en verdi kanskje finnes, eller kanskje ikke finnes.

For eksempel:

```
Double?
```

Denne typen betyr at hvis det finnes en verdi, vil det ved utskrift stå `Optional(...)`，og hvis ingen verdi finnes, returneres `nil`。

Det er viktig å merke seg at `nil` betyr “ingen verdi”, og ikke `0` eller en tom streng.

### Eksempel

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Utskrift:

```
pi:Optional(3.14)
```

Dette betyr at strengen ble konvertert til `Double` med verdien `3.14`，men siden typen er `Double?`，er den pakket inn i `Optional`。

Hvis konverteringen mislykkes:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Utskrift:

```
pi: nil
```

Siden `"Hello"` ikke kan konverteres til typen `Double`，mislykkes konverteringen og returnerer `nil`。

### Hva er `Optional(...)`？

Når vi skriver ut en Optional direkte:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

viser Swift dens “debug-beskrivelse”：

```
Optional(3.14)
```

Dette er ikke en del av den faktiske dataen, men en påminnelse om at den nåværende verdien er en Optional-type og at den inneholder en verdi.

### Pakke ut en Optional

I faktisk utvikling må vi ofte hente ut den egentlige verdien fra en Optional. Denne prosessen kalles unwrapping.

En vanlig måte er å bruke `??` for å gi en standardverdi:

```
??
```

Dette kalles Nil-Coalescing Operator.

For eksempel:

```swift
name ?? "FangJunyu"
```

Denne koden betyr at hvis `name` har en verdi, returneres den；hvis den er `nil`，brukes standardverdien `"FangJunyu"`。

Det er viktig å merke seg at typen til standardverdien må være den samme som typen i Optional.

### Bruk `??` til å gi en standardverdi

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Utskrift:

```
pi: 30
```

Når `input` konverteres til `Double`，lykkes konverteringen og verdien skrives ut. Hvis konverteringen hadde feilet, ville standardverdien etter `??` blitt brukt.

Hvis konverteringen mislykkes:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Utskrift:

```
pi: 10
```

Her mislykkes konverteringen av `input` til `Double` og returnerer `nil`，og `??` gir en standardverdi for `nil`。

Optional-typer brukes for å representere situasjoner der “det kanskje finnes en verdi, eller kanskje ikke”.

I operasjoner som typekonvertering, der det kan oppstå feil, returnerer Swift en Optional-type for å sikre sikkerheten i programmet.

Når vi trenger å bruke verdien i en Optional, kan vi gi en standardverdi med `??`，slik at vi fortsatt kan få et rimelig resultat selv om `nil` oppstår.
