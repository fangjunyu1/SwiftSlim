# Typsystem

I de tidigare lektionerna har vi redan lärt oss om variabler och förstått att variabler kan lagra data av olika typer.

Till exempel:

```swift id="b9n3qf"
var hello = "Hello, World"
```

Här lagrar `hello` en textsträng, så dess typ är `String`.

Härnäst ska vi systematiskt lära oss begreppet typ (Type), samt explicit typdeklaration och typinferens, så att vi kan förstå variablers natur på ett djupare sätt.

## Vad är en typ

I Swift har varje värde en tydlig typ. Typen avgör vad värdet är och vad det kan göra.

Till exempel:

* `42` är en `Int` (heltal)
* `"Hello"` är en `String` (sträng)
* `true` är en `Bool` (boolesk)

De tillhör olika typer och används därför på olika sätt.

## Vanliga grundtyper i Swift

I början av lärandet är följande typer de vanligaste:

* `String`: sträng (text)
* `Int`: heltal
* `Double`: flyttal (med decimaler, högre precision)
* `Bool`: boolesk (`true/false`)

Dessutom finns `Float` (flyttal), men med lägre precision än `Double`, så den används generellt mer sällan; samt `Character` (ett enskilt tecken), till exempel `"A"`, `"!"` och andra enstaka tecken.

### Typdeklaration (explicit typ)

I Swift kan man ange typen manuellt när man deklarerar en variabel:

```swift id="emxf70"
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Man deklarerar typen genom att skriva `: Typ` efter variabelnamnet.

Syntaxen för arraytyper är `: [Typ]`:

```swift id="dprlt8"
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

I den här koden kan arrayen `scores` bara lagra element av typen `Int`, och `tags` kan bara lagra element av typen `String`.

Att deklarera typen explicit kan göra avsikten med koden tydligare och i vissa situationer undvika felaktig typinferens.

## Typinferens

I många fall behöver man inte deklarera typen explicit:

```swift id="ud0j20"
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Detta beror på att Swift-kompilatorn automatiskt kan härleda typen utifrån **startvärdet**.

## Explicit typdeklaration och typinferens

I tidigare lektioner introducerade vi inte explicit typdeklaration, till exempel:

```swift id="7tltjc"
var age: Int = 18
```

I stället använde vi först typinferens:

```swift id="gfnzl1"
var age = 18
```

I detta exempel är de två skrivsätten likvärdiga. `age` kommer i båda fallen att bestämmas som typen `Int`. Jämfört med detta är skrivsättet med typinferens mer kortfattat.

Anledningen till att vi inte betonade explicita typdeklarationer i början är att typinferens kan minska mängden extra information i koden och därmed sänka förståelsekostnaden för nybörjare.

## Varför behövs typer

Swift är ett starkt typat språk (Strongly Typed Language).

Det betyder att när typen för en variabel väl har bestämts kan den inte ändras godtyckligt.

Till exempel:

```swift id="vmzicu"
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Det första `20` är av typen `Int` och kan tilldelas till `age`; det andra `"20"` är av typen `String` och matchar inte `Int`, så det ger ett fel.

`nums` är en array av typen `[Int]` och kan därför bara lagra heltal; den kan inte blandas med strängar.

Typer begränsar hur data får användas och gör det möjligt att upptäcka problem med typmismatch redan vid kompilering, vilket minskar buggar orsakade av typförvirring och förbättrar kodens stabilitet och underhållbarhet.

## När måste man deklarera typen explicit

Även om Swift kan härleda typen automatiskt finns det vissa situationer där kompilatorn inte kan härleda den, eller där den härleder fel. Då måste man deklarera typen manuellt.

**1. Tom array**

När man skapar en tom array måste typen deklareras explicit:

```swift id="iepm00"
var nums: [Int] = []
```

Om man inte skriver typen:

```swift id="ok5hav"
var nums = []   // Error，Empty collection literal requires an explicit type
```

kan kompilatorn inte avgöra vilken elementtyp den tomma arrayen ska ha, och därför uppstår ett kompileringsfel.

**2. Undvika felaktig inferens**

```swift id="j2j3pw"
var value = 10   // Int
```

I det här exemplet kan `10` visserligen också representera ett flyttal (`Double`), men eftersom det inte finns någon decimalpunkt kommer kompilatorn som standard att tolka det som typen `Int`.

Om man vill att `value` ska vara ett flyttal måste typen deklareras explicit:

```swift id="gxeft1"
var value: Double = 10   // Double
```

När resultatet av typinferensen inte matchar det man vill ha bör man använda explicit typdeklaration eller ändra formen på litteralen för att säkerställa korrekt typ.

**3. Egna typer**

Senare kommer vi också att lära oss om egna typer. När man använder egna typer behöver man ofta också deklarera typen explicit:

```swift id="r7v8iv"
var info: GameInfo
var users: [User] = []
```

Anledningen är densamma som för tomma arrayer: kompilatorn kan inte automatiskt härleda typen från ett tomt värde.

## Typkonvertering

I Swift sker ingen automatisk konvertering mellan olika typer; man måste konvertera manuellt.

Till exempel, att addera två tal med olika typer:

```swift id="ch9o0h"
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

I denna kod är `a` av typen `Int` och `b` av typen `Double`. Eftersom typerna skiljer sig åt kan de inte användas direkt i samma operation.

Innan man gör beräkningen måste man först konvertera ett av värdena till samma typ:

```swift id="elq0eu"
var result = Double(a) + b
```

Detta betyder att `a`, som är av typen `Int`, först konverteras till `Double`, och sedan adderas med `b`. Resultatet tilldelas därefter till `result`.

Det är viktigt att notera att typkonvertering inte ändrar den ursprungliga variabelns typ. `Double(a)` ändrar till exempel inte typen på `a`, utan skapar ett nytt värde av typen `Double` som används i beräkningen.

Andra typer kan också konverteras på liknande sätt, alltså genom att använda måltypen följt av `()`, och skicka in värdet som ska konverteras. Till exempel:

```id="nj9nqv"
Int()、Double()、String()
```

Exempel:

```swift id="u1damy"
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Det är viktigt att notera att inte alla typkonverteringar fungerar på samma sätt. Till exempel, vid `Double → Int` kapas decimaldelen direkt bort, utan avrundning.

## Typalias

I Swift kan man också ge en befintlig typ ett alias för att göra kodens betydelse tydligare:

```swift id="uskmz9"
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Här är `UserID` i grunden fortfarande `Int`; typen har inte ändrats, bara fått ett mer meningsfullt namn.

I projekt med mycket kod och mer komplexa typer kan typalias göra koden lättare att läsa.

## Typexempel

Nedan visar vi genom ett enkelt exempel vilken roll typer spelar i praktisk utveckling.

### Skapa en variabel

Först skapar vi en variabel `age`:

```swift id="jeu8n4"
var age = 20
```

Eftersom vi behöver visa och ändra denna variabel i SwiftUI, måste vi deklarera den med @State:

```swift id="efg1bc"
@State private var age = 20
```

`private` nämndes tidigare och betyder att denna variabel bara kan användas i den aktuella vyn. Vi kommer att lära oss mer om detta senare.

### Visa data i SwiftUI

Visa variabeln `age` i SwiftUI:

```swift id="1ghit3"
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Nu kommer vyn att visa:

```swift id="5x49se"
age: 20
```

### Ändra data

Därefter lägger vi till två knappar för att ändra `age`:

```swift id="u0e4op"
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Körresultat

När man trycker på `changeAge1` tilldelas `age` värdet 18:

```swift id="g8f0v2"
age = 18
```

Eftersom `18` är av typen `Int` och matchar typen för `age`, lyckas tilldelningen.

`changeAge2` ger däremot ett fel:

```swift id="hawnr9"
age = "18"
```

Felmeddelande:

```id="c6otj7"
Cannot assign value of type 'String' to type 'Int'
```

Detta beror på att `"18"` är av typen `String` (strängar måste omges av `""`), medan `age` är av typen `Int`. Typerna stämmer alltså inte överens, så tilldelningen misslyckas.

### Varför uppstår felet?

Nyckeln ligger i denna rad:

```swift id="v5ekna"
@State private var age = 20   // Int
```

Även om typen inte deklarerades explicit kommer kompilatorn att inferera `age` som typen `Int`, eftersom startvärdet `20` är av typen `Int`.

När typen väl har bestämts kan den inte längre tilldelas ett värde av en annan typ.

Dessutom misslyckas inte knappen `changeAge2` först vid körning, utan ger ett fel redan under kompilering, vilket innebär att koden inte kan kompileras.

Detta är också en av fördelarna med Swifts starka typning: typfel kan upptäckas redan medan koden skrivs.

### Korrekt skrivsätt

Efter att ha tagit bort den felaktiga koden:

```swift id="2oamr4"
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

När man trycker på knappen `changeAge1` uppdateras vyn till:

```id="72iek2"
age: 18
```

### Explicit typdeklaration (valfritt)

Man kan också ange typen tydligt redan vid deklarationen:

```swift id="re5zoh"
@State private var age: Int = 20
```

Detta skrivsätt gör typen tydligare, men i enkla situationer är det inte nödvändigt.

## Sammanfattning

Den här lektionen handlade främst om Swifts typsystem och dess roll i praktisk utveckling.

I Swift har varje värde en tydlig typ, och typen avgör datans innebörd samt vilka operationer den kan delta i.

Swift är starkt typat. När en variabels typ väl har bestämts kan den inte längre tilldelas ett värde av en annan typ. Denna begränsning gör att fel kan upptäckas redan vid kompilering, vilket minskar problem vid körning och ökar kodens säkerhet.

Typen på en variabel kan härledas automatiskt utifrån startvärdet, men kan också deklareras explicit. I vissa situationer, som tomma arrayer, felaktig typinferens eller egna typer, kan kompilatorn inte härleda typen korrekt, och då måste man deklarera den explicit.

Det sker ingen automatisk konvertering mellan olika typer; man måste konvertera explicit genom till exempel `Int()`, `Double()` eller `String()`.

Typer stöder också alias. Särskilt i mer komplexa projekt kan typalias förbättra läsbarheten.

En typ är inte bara en etikett för data, utan också en mekanism för begränsning som säkerställer att data används på ett säkert, tydligt och kontrollerat sätt.

## Utökad kunskap - optionella typer

Vid typkonvertering finns det operationer som kan misslyckas.

Till exempel, att konvertera en `String` till `Double`:

```swift id="u3zdm7"
let input = "3.14"
let pi = Double(input)  // Double?
```

Här returnerar `Double(input)` inte en `Double`, utan:

```id="p2cz0c"
Double?
```

Detta är en optionell typ (Optional).

### Varför returneras en optionell typ?

Eftersom innehållet i en sträng är osäkert. `"3.14"` kan konverteras till `Double`, men `"Hello"` kan inte det.

Det betyder att operationen kan lyckas, men den kan också misslyckas.

Därför använder Swift optionella typer för att representera denna osäkerhet.

### Vad är en optionell typ?

En optionell typ betyder att ett värde kan finnas, men det kan också saknas.

Till exempel:

```id="0hf0cl"
Double?
```

Denna typ betyder att om det finns ett värde visas det vid utskrift som `Optional(...)`; om det inte finns något värde returneras `nil`.

Det är viktigt att notera att `nil` betyder "inget värde", inte `0` eller en tom sträng.

### Exempel

```swift id="j9gqfy"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Utskrift:

```id="xkokn9"
pi:Optional(3.14)
```

Det betyder att strängen konverterades till `Double` och gav `3.14`, men eftersom typen är `Double?` är värdet inneslutet i `Optional`.

Om konverteringen misslyckas:

```swift id="mz7vho"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Utskrift:

```id="owzaf5"
pi: nil
```

Eftersom `"Hello"` inte kan konverteras till typen `Double` misslyckas konverteringen och `nil` returneras.

### Vad är Optional(...)?

När vi skriver ut en optionell typ direkt:

```swift id="u6ksr8"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

visar Swift dess "debuggbeskrivning":

```id="um5n3k"
Optional(3.14)
```

Detta är inte en del av det faktiska datavärdet, utan en indikation på att det aktuella värdet är av en optionell typ och att det finns ett värde inuti.

### Packa upp en optionell typ

I praktisk utveckling behöver vi ofta ta ut det faktiska värdet ur en optionell typ. Den processen kallas uppackning (Unwrapping).

Ett vanligt sätt är att använda `??` för att ange ett standardvärde:

```id="dm5mg1"
??
```

Detta kallas för: nil-sammanslagningsoperatorn (Nil-Coalescing Operator).

Till exempel:

```swift id="0dxfra"
name ?? "FangJunyu"
```

Denna kod betyder att om `name` har ett värde returneras det värdet; om det är `nil` används standardvärdet `"FangJunyu"`.

Det är viktigt att notera att standardvärdets typ måste stämma överens med den optionella typen.

### Använd `??` för att ge ett standardvärde

```swift id="7p52gx"
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Utskrift:

```id="r96ajp"
pi: 30
```

När `input` konverteras till typen `Double` lyckas konverteringen och värdet skrivs ut. Om konverteringen misslyckas skrivs i stället standardvärdet som anges med `??` ut.

Om konverteringen misslyckas:

```swift id="yzq4dr"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Utskrift:

```id="dbv3bi"
pi: 10
```

Här misslyckas konverteringen av `input` till typen `Double` och returnerar `nil`, så `??` ger ett standardvärde för `nil`.

Optionella typer används för att representera situationer där "ett värde kan finnas, men också saknas".

Vid operationer som kan misslyckas, till exempel typkonvertering, returnerar Swift en optionell typ för att garantera programmets säkerhet.

När vi behöver använda värdet kan vi ange ett standardvärde med `??`, så att vi fortfarande får ett rimligt resultat även om `nil` uppstår.
