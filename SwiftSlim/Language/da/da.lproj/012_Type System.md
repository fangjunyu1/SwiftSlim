# Typesystem

I de foregående lektioner har vi allerede lært om variabler, og vi ved, at variabler kan gemme data af forskellige typer.

For eksempel:

```swift
var hello = "Hello, World"
```

Her gemmer `hello` et stykke tekst, og derfor er dens type `String`.

Dernæst vil vi systematisk lære om begrebet type (`Type`) samt eksplicit typedeklaration og typeinferens, så vi kan forstå variablers natur mere i dybden.

## Hvad er en type

I Swift har hver værdi en tydelig type. Typen bestemmer, hvad denne værdi er, og hvad den kan bruges til.

For eksempel:

- `42` er en `Int` (heltal)
- `"Hello"` er en `String` (streng)
- `true` er en `Bool` (boolsk værdi)

De tilhører forskellige typer og bruges også forskelligt.

## Almindelige grundtyper i Swift

På begynderniveau er de mest almindelige typer følgende:

- `String`: streng (tekst)
- `Int`: heltal
- `Double`: flydende tal med decimaler og højere præcision
- `Bool`: boolsk værdi (`true`/`false`)

Derudover findes også `Float` (flydende tal, men med lavere præcision end `Double`, og derfor mindre brugt) og `Character` (et enkelt tegn), som for eksempel `"A"` eller `"!"`.

### Typedeklaration (eksplicit type)

I Swift kan vi manuelt angive typen, når vi erklærer en variabel:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Vi tilføjer `: Type` efter variabelnavnet for at erklære variablens type.

Skrivemåden for en arraytype er `: [Type]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

I denne kode kan arrayet `scores` kun gemme elementer af typen `Int`, og `tags` kan kun gemme elementer af typen `String`.

Eksplicit typedeklaration kan gøre hensigten i koden tydeligere og kan i visse situationer forhindre fejl i typeinferens.

## Typeinferens

I mange situationer behøver vi ikke skrive typen eksplicit:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Det skyldes, at Swift-kompileren automatisk kan udlede typen ud fra "startværdien".

## Eksplicit deklaration og typeinferens

I de tidligere lektioner introducerede vi ikke eksplicit typedeklaration, som for eksempel:

```swift
var age: Int = 18
```

I stedet prioriterede vi typeinferens:

```swift
var age = 18
```

I dette eksempel er de to skrivemåder ækvivalente, og `age` bliver i begge tilfælde fastlagt som typen `Int`. Sammenlignet med den første er typeinferens mere kortfattet.

Grunden til, at vi ikke lagde vægt på eksplicit typedeklaration i begyndelsen, er, at typeinferens reducerer mængden af ekstra information i koden og dermed gør det lettere for begyndere at forstå.

## Hvorfor har vi brug for typer

Swift er et stærkt typet sprog (`Strongly Typed Language`).

Det betyder: Når en variabels type først er fastlagt, kan den ikke ændres vilkårligt.

For eksempel:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Den første `20` er af typen `Int` og kan derfor tildeles til `age`. Den anden `"20"` er af typen `String`, og fordi den ikke matcher typen `Int`, opstår der en fejl.

`nums` er et array af typen `[Int]`, så det kan kun gemme heltal og må ikke blandes med strenge.

Typer kan begrænse, hvordan data bruges, og de kan opdage typeproblemer allerede under kompilering. På den måde reduceres bugs, der skyldes typeforvirring, og kodens stabilitet og vedligeholdbarhed forbedres.

## Hvornår skal man erklære typen eksplicit

Selvom Swift normalt automatisk kan udlede typer, findes der situationer, hvor kompileren ikke kan gøre det, eller gør det forkert. I sådanne tilfælde skal vi erklære typen manuelt.

**1. Tomme arrays**

Når man opretter et tomt array, skal typen angives eksplicit:

```swift
var nums: [Int] = []
```

Hvis typen ikke skrives:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

kan kompileren ikke udlede typen på arrayets elementer fra et tomt array, og derfor opstår der en kompileringsfejl.

**2. Undgå forkert inferens**

```swift
var value = 10   // Int
```

I dette eksempel kan `10` godt også repræsentere et flydende tal (`Double`), men fordi der ikke er et decimalpunktum, vil kompileren som standard udlede typen som `Int`.

Hvis vi ønsker, at `value` skal være et flydende tal, skal vi erklære typen eksplicit:

```swift
var value: Double = 10   // Double
```

Når resultatet af typeinferens ikke svarer til det, vi forventer, bør vi bruge eksplicit typedeklaration eller ændre formen på litteralen for at sikre den rigtige type.

**3. Brugerdefinerede typer**

Senere vil vi også lære om brugerdefinerede typer. Når man bruger dem, er det ofte også nødvendigt at deklarere typen eksplicit:

```swift
var info: GameInfo
var users: [User] = []
```

Årsagen er den samme som ved tomme arrays: kompileren kan ikke automatisk udlede typen ud fra en tom værdi.

## Typekonvertering

I Swift kan forskellige typer ikke automatisk konverteres mellem hinanden. Det skal gøres manuelt.

For eksempel når vi vil lægge to tal af forskellige typer sammen:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

I denne kode er `a` af typen `Int`, og `b` er af typen `Double`. Fordi typerne er forskellige, kan de ikke bruges direkte i samme regneudtryk.

Før vi regner, skal vi først konvertere den ene værdi til samme type:

```swift
var result = Double(a) + b
```

Denne kode betyder, at vi konverterer `a`, som er af typen `Int`, til typen `Double`, og derefter lægger den sammen med `b`. Resultatet gemmes i `result`.

Det er vigtigt at bemærke, at typekonvertering ikke ændrer den oprindelige variabels type. For eksempel vil `Double(a)` ikke ændre `a` fra `Int` til `Double`, men i stedet oprette en ny `Double`-værdi til brug i udregningen.

Andre typer kan også konverteres på en lignende måde, nemlig ved at bruge måltypen efterfulgt af `()` og sende værdien ind. For eksempel:

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

Det er vigtigt at bemærke, at ikke alle konverteringer bevarer værdien fuldstændigt. For eksempel, når `Double` konverteres til `Int`, bliver decimaldelen blot skåret væk i stedet for afrundet.

## Typealias

I Swift kan vi også give en eksisterende type et alias, så kodens betydning bliver tydeligere:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Her er `UserID` i bund og grund stadig en `Int`. Typen er ikke ændret, men navnet er blevet mere meningsfuldt.

I projekter med meget kode og komplekse typer kan typealias gøre koden lettere at læse.

## Typeeksempel

Nedenfor bruger vi et enkelt eksempel til at demonstrere, hvilken rolle typer spiller i reel udvikling.

### Opret en variabel

Først opretter vi en variabel `age`:

```swift
var age = 20
```

Fordi vi vil vise og ændre denne variabel i SwiftUI, skal vi bruge `@State` til at deklarere den:

```swift
@State private var age = 20
```

Vi har tidligere nævnt `private`, som betyder, at variablen kun kan bruges i den aktuelle visning. Det vil vi lære mere om senere.

### Vis data i SwiftUI

Vis variablen `age` i SwiftUI:

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

Nu vil visningen vise:

```swift
age: 20
```

### Ændr data

Dernæst tilføjer vi to knapper for at ændre `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Køreresultat

Når der trykkes på `changeAge1`, vil `age` blive sat til `18`:

```swift
age = 18
```

Fordi `18` er af typen `Int` og matcher typen på `age`, lykkes tildelingen.

`changeAge2` vil derimod give en fejl:

```swift
age = "18"
```

Fejlmeddelelse:

```
Cannot assign value of type 'String' to type 'Int'
```

Det skyldes, at `"18"` er af typen `String` og `age` er af typen `Int`. Typerne stemmer ikke overens, så tildelingen kan ikke gennemføres.

### Hvorfor opstår fejlen?

Nøglen ligger i denne linje:

```swift
@State private var age = 20   // Int
```

Selvom typen ikke er skrevet eksplicit, vil kompileren automatisk udlede `age` som typen `Int`, fordi startværdien `20` er et heltal.

Når typen først er fastlagt, kan der ikke længere tildeles værdier af andre typer.

Og `changeAge2`-knappen fejler ikke "under kørsel", men allerede i kompileringsfasen, så koden slet ikke kan bygges.

Det er også en af fordelene ved Swift som et stærkt typet sprog: typeproblemer kan opdages allerede, mens man skriver koden.

### Korrekt skrivemåde

Når den fejlagtige kode er fjernet:

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

Når der trykkes på knappen `changeAge1`, opdateres visningen til:

```
age: 18
```

### Eksplicit typedeklaration (valgfrit)

Vi kan også eksplicit angive typen ved definitionen:

```swift
@State private var age: Int = 20
```

Denne skrivemåde gør typen endnu tydeligere, men i enkle scenarier er den ikke nødvendig.

## Opsummering

Denne lektion handlede hovedsageligt om Swifts typesystem og dets rolle i reel udvikling.

I Swift har hver værdi en tydelig type, og typen bestemmer både dataværdiernes betydning og hvilke operationer de kan deltage i.

Swift er stærkt typet. Når en variabels type først er fastlagt, kan den ikke tildeles værdier af andre typer. Denne begrænsning gør det muligt at opdage fejl i kompileringsfasen, reducere problemer under kørsel og forbedre kodens sikkerhed.

En variabels type kan udledes automatisk ud fra startværdien eller angives eksplicit. I nogle situationer, som tomme arrays, fejl i typeudledning eller brugerdefinerede typer, kan kompileren ikke udlede typen korrekt, og så er en eksplicit deklaration nødvendig.

Forskellige typer kan ikke automatisk konverteres mellem hinanden. Man skal eksplicit bruge former som `Int()`, `Double()` og `String()`.

Typer understøtter også aliaser. Især i mere komplekse projekter kan typealias gøre koden mere læsbar.

Typer er ikke kun etiketter på data, men også en begrænsningsmekanisme, der sikrer, at brugen af data er sikker, tydelig og kontrollerbar.

## Udvidet viden - Optionals

Ved typekonvertering findes der operationer, som kan mislykkes.

For eksempel at konvertere en `String` til `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Her returnerer `Double(input)` ikke en `Double`, men:

```
Double?
```

Det er netop en optional type (`Optional`).

### Hvorfor returneres en optional?

Fordi indholdet af en streng ikke er sikkert. `"3.14"` kan konverteres til `Double`, men `"Hello"` kan ikke.

Det vil sige, at operationen enten kan lykkes eller mislykkes.

Derfor bruger Swift optional-typen til at repræsentere denne usikkerhed.

### Hvad er en optional type?

En optional type betyder, at en værdi muligvis findes, og muligvis ikke findes.

For eksempel:

```
Double?
```

Denne type betyder, at hvis der findes en værdi, vil den ved udskrivning blive vist som `Optional(...)`, og hvis der ikke findes nogen værdi, returneres `nil`.

Det er vigtigt at bemærke, at `nil` betyder "ingen værdi", ikke `0` eller en tom streng.

### Eksempel

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```
pi:Optional(3.14)
```

Det betyder, at strengen er blevet konverteret korrekt til `Double`, så resultatet er `3.14`, men fordi typen er `Double?`, er den pakket ind i `Optional`.

Hvis konverteringen mislykkes:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```
pi: nil
```

Fordi `"Hello"` ikke kan konverteres til typen `Double`, mislykkes konverteringen, og der returneres `nil`.

### Hvad er Optional(...)?

Når vi udskriver en optional type direkte:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

vil Swift vise dens "debug description":

```
Optional(3.14)
```

Dette er ikke en del af selve dataene, men en påmindelse om, at den aktuelle værdi er en optional type, og at der indeni ligger en reel værdi.

### Unwrap en optional type

I reel udvikling har vi normalt brug for at tage den faktiske værdi ud af en optional. Denne proces kaldes unwrapping.

En almindelig måde er at bruge `??` til at give en standardværdi:

```
??
```

Det kaldes nil-coalescing-operatoren (`Nil-Coalescing Operator`).

For eksempel:

```swift
name ?? "FangJunyu"
```

Denne kode betyder: Hvis `name` har en værdi, returneres denne værdi. Hvis den er `nil`, bruges standardværdien `"FangJunyu"`.

Det er vigtigt at bemærke, at typen på standardværdien skal være den samme som optional-typen.

### Brug ?? til at give en standardværdi

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```
pi: 30
```

Når `input` konverteres til typen `Double`, lykkes konverteringen, og værdien udskrives. Hvis konverteringen mislykkes, udskrives standardværdien, som er angivet med `??`.

Hvis konverteringen mislykkes:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```
pi: 10
```

Her mislykkes konverteringen af `input` til `Double`, og der returneres `nil`. `??` vil derefter levere en standardværdi til dette `nil`.

Optional-typer bruges til at repræsentere situationer, hvor "en værdi måske findes, eller måske ikke findes".

I operationer, der kan mislykkes, som typekonvertering, returnerer Swift en optional type for at bevare programmets sikkerhed.

Når vi har brug for at bruge værdien, kan vi give en standardværdi med `??`, så vi stadig kan få et rimeligt resultat, selv hvis der opstår `nil`.
