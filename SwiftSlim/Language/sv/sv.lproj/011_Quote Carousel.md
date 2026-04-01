# Citatkarusell

I den här lektionen ska vi skapa en funktion för en "citatkarusell" och samtidigt fördjupa oss i grundläggande Swift-kunskaper som arrayer (Array) och villkorssatser (if-else).

Vi kommer att visa hur man sparar flera citat och hur man genom knappinteraktion kan skapa en cirkulerande visning av citat.

![alt text](../../RESOURCE/011_word.png)

## Visa ett citat

Först behöver vi visa ett citat i SwiftUI.

Det enklaste sättet är att använda vyn Text:

```swift id="77fweq"
Text("Slow progress is still progress.")
```

Den här koden kan bara visa ett fast citat. Om vi vill visa flera citat och växla mellan dem behöver vi spara citaten.

Men en vanlig strängvariabel kan bara lagra ett enda citat:

```swift id="qqzboj"
let sayings = "Slow progress is still progress."
```

Om vi behöver spara flera citat måste vi deklarera en variabel för varje enskilt citat:

```swift id="f0abtr"
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Men i praktisk utveckling är detta inte bara omständligt, utan eftersom varje variabel är fristående kan vi inte heller skapa en flexibel karusellväxling.

För att kunna hantera flera citat på ett smidigt sätt behöver vi en datastruktur som lagrar dem tillsammans, och det är just vad en array (Array) är.

Med en array kan koden ovan i stället sparas så här:

```swift id="4kvq0h"
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tips: I programmeringspraxis använder man ofta pluralform för variabelnamn som lagrar flera element i en array, till exempel sayings, för att visa att det är en samling.**

## Arrayer

I Swift är en array en samling av ordnade element och skrivs med hakparenteser [].

```id="2wz9aq"
[]
```

Inuti en array kan det finnas flera element av samma typ, och elementen skiljs åt med engelska kommatecken `,`.

Till exempel:

```swift id="n7zt3l"
[101, 102, 103, 104, 105]
```

Man kan enkelt förstå en array som ett tåg:

![Array](../../RESOURCE/011_array1.png)

Hela tåget representerar array-objektet, och varje vagn är ordnad i följd.

### Index och åtkomst till element

Eftersom arrayen är ordnad kan systemet hitta ett specifikt element utifrån dess position i ordningen. Denna positionsmekanism kallas index.

I Swift, liksom i de flesta programmeringsspråk, börjar index i en array från 0 och inte från 1. Det betyder att det första elementet i arrayen har index 0, det andra har index 1, och så vidare.

![Array](../../RESOURCE/011_array2.png)

Om man vill komma åt ett specifikt element i arrayen räcker det att skriva arrayens namn följt av hakparenteser med målindexet inuti.

Till exempel:

```swift id="yz2vq0"
sayings[0]   // 101
sayings[1]   // 102
```

Om man försöker komma åt ett index utanför arrayens giltiga intervall uppstår ett problem som kallas "index out of range". Därför måste man vara försiktig när man använder index och se till att det ligger inom giltigt område.

**Index utanför gränsen**

Till exempel, om arrayen bara har 5 element, är det giltiga indexintervallet 0 till 4. Om vi försöker komma åt `sayings[5]` kommer programmet inte att hitta motsvarande "vagn", vilket leder till felet "index out of range" och gör att appen kraschar.

![Array](../../RESOURCE/011_array3.png)

### Arbeta med arrayer

En array stödjer inte bara statisk definition, utan även operationer som att lägga till, ta bort och ändra element, samt att hämta längden på arrayen.

Tips: Om du behöver ändra en array måste du deklarera den med `var`, inte med konstanten `let`.

**1. Lägga till element**

Man kan använda metoden `append` för att lägga till ett element längst bak i arrayen:

```swift id="bkny7m"
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Ta bort element**

Med metoden `remove(at:)` kan man ta bort ett visst element i arrayen:

```swift id="uac9xa"
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Ändra element**

Man kan direkt använda index för att ändra ett element i arrayen:

```swift id="csgvwl"
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Räkna antal element**

Man använder egenskapen `count` för att hämta antalet element i arrayen:

```swift id="fd9m94"
var num = [0, 1, 2]
num.count   // 3
```

### Visa citat med en array

För att visa flera citat kan vi spara citaten i en array och sedan komma åt och visa dem via index.

Först skapar vi i ContentView en array med namnet sayings för att lagra citaten, och sedan använder vi index i Text-vyn för att läsa och visa rätt citat:

```swift id="33uq2h"
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Här betyder `sayings[0]` det första citatet i arrayen.

Om vi vill visa ett annat citat behöver vi bara ändra indexvärdet i hakparenteserna:

```swift id="4cj3vg"
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definiera citatets index

För att skapa en dynamisk växling mellan citat kan vi inte "hårdkoda" indexet direkt i Text-vyn.

Vi behöver skapa en variabel som separat lagrar det index som visas just nu.

I SwiftUI kan vi använda @State för att deklarera ett förändringsbart index:

```swift id="j5n2d4"
@State private var index = 0
```

SwiftUI övervakar variabler som är omslutna av @State. När `index` ändras kommer SwiftUI att rendera om vyn och visa motsvarande citat.

Sedan använder vi `sayings[index]` för att dynamiskt hämta citatet ur arrayen:

```swift id="1csz2u"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

När värdet på `index` ändras kommer Text att visa ett annat citat.

### Använd knappar för att styra index

För att styra växlingen av citat kan vi använda Button för att ändra värdet på `index`. Varje gång man trycker på knappen ökar `index` automatiskt med 1:

```swift id="g1mhc0"
Button("Next") {
    index += 1
}
```

När vi trycker på knappen ändras `index` från 0 till 1, vilket utlöser en uppdatering av vyn, och `Text(sayings[index])` läser då nästa citat.

Men här finns ett potentiellt problem: om man trycker flera gånger i rad kommer `index` att öka till ett värde som ligger utanför arrayens intervall, vilket leder till ett indexfel. Till exempel, när `index` blir 5 medan arrayens giltiga index är 0 till 4, kraschar programmet.

För att förhindra att arrayindex går utanför gränsen behöver vi lägga till villkorsstyrning så att `index` inte kan överskrida arrayens intervall. Det kan vi göra med en if-else-sats som kontrollerar om `index` är mindre än arrayens längd.

## Villkorsstyrning: if-else-satser

if-else-satsen är en av de vanligaste villkorssatserna i Swift. Den används för att kontrollera om ett villkor är uppfyllt och sedan köra olika kodblock beroende på om villkoret är sant eller falskt.

Grundstruktur:

```swift id="s7xalc"
if condition {
    // Kod som körs när condition är true
} else {
    // Kod som körs när condition är false
}
```

I en if-sats är villkoret `condition` ett booleskt värde av typen Bool, alltså antingen `true` eller `false`. När villkoret är `true` körs koden i if-delen, annars körs koden i else-delen.

Till exempel:

```swift id="m0jlwm"
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

I detta exempel är värdet på `age` 25. if-satsen kontrollerar om `age > 18` är sant, och eftersom villkoret uppfylls skrivs `"Big Boy"` ut.

Om man inte behöver någon else-del kan den utelämnas:

```swift id="rp6t1p"
if condition {
    // Kod som körs när condition är true
}
```

### Använd villkor för att kontrollera indexområdet

För att undvika att arrayindex går utanför gränsen kan vi använda en if-sats för att säkerställa att `index` inte blir större än arrayens intervall:

```swift id="xz6mw2"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logisk analys: värdet på `sayings.count` är 5 eftersom det finns 5 citat, så `sayings.count - 1` blir 4, vilket också är det sista giltiga indexet i arrayen.

När `index` är mindre än 4 är det säkert att öka det med 1 när knappen trycks. När `index` väl har nått 4 uppfylls inte längre villkoret, och då händer inget när man trycker på knappen.

Nu har koden redan uppnått funktionen att växla citat:

```swift id="ayst8a"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Cirkulerande citat

Om vi vill att det första citatet ska visas igen när det sista citatet redan visats och man trycker på knappen, så att citaten visas i en loop, kan vi använda else-delen för att göra detta:

```swift id="47v65d"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

När man trycker på knappen och `index` redan är vid det sista elementet i arrayen, återställs `index` till 0 och citaten börjar visas från början igen.

## Förbättra citatvyn

Nu har logiken för vår citatkarusell redan blivit klar, men vi kan fortfarande förbättra gränssnittet ytterligare så att det blir snyggare.

Fullständig kod:

```swift id="oxkkmc"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

I detta exempel har Text-vyn fått en vit halvtransparent bakgrund och rundade hörn, Button använder stilen `.borderedProminent`, och VStack har fått en bakgrundsbild.

Kompletterande kunskapspunkt: När man använder modifieraren `background()` för att hantera en bildbakgrund, är dess standardbeteende att fylla det layoutområde där den aktuella vyn befinner sig så mycket som möjligt. I många fall kan den naturligt sträcka sig och täcka även säkerhetsområdet (Safe Area).

Nu har vi alltså skapat vyn för en citatkarusell.

![SwiftUI View](../../RESOURCE/011_word.png)

## Sammanfattning

Genom denna lektion har vi lärt oss hur man använder en array för att lagra flera citat, och hur man med hjälp av `if` och `if-else` kan skapa en karusellvisning för citat.

Vi har också förstått grundläggande operationer på arrayer, såsom att lägga till, ta bort och ändra element, samt hur man förhindrar att arrayindex går utanför gränsen.

Den här lektionen förklarade inte bara hur man bygger en citatkarusell, utan kombinerade också grundläggande användning av arrayer och villkorssatser, vilket hjälper oss att utveckla förmågan att hantera data och styra programmets flöde.

## Utökad kunskap - Flera villkor: if-else if-else-satser

I praktisk utveckling behöver man ofta hantera flera villkor. Till exempel i ett spel, där händelse A triggas när poängen är 1, händelse B när poängen är 2, händelse C när poängen är 3, och så vidare.

När man står inför scenarier med fler än två villkorsgrenar behöver man använda en `if-else if-else`-sats för att göra flera bedömningar.

Grundläggande syntax:

```swift id="3r9djq"
if conditionA {
    // Kod som körs när conditionA är true
} else if conditionB {
    // Kod som körs när conditionB är true
} else if conditionC {
    // Kod som körs när conditionC är true
} else {
    // Kod som körs när inget villkor uppfylls
}
```

I detta fall kommer programmet att kontrollera villkoren i ordning och köra det första villkor som uppfylls. Om inget villkor uppfylls körs koden efter else.

I citatkarusellen kan vi också använda `if-else if-else` för att göra flera kontroller:

```swift id="jlwm1i"
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

När `index` är 0, 1, 2 eller 3 körs `index += 1` varje gång knappen trycks. När `index` är 4, alltså det sista elementet, återställs `index` till 0 för att skapa en loop.

else-grenen används som en säkerhetsåtgärd om ett ogiltigt värde skulle uppstå, till exempel om `index` skulle ändras felaktigt.

Det är viktigt att notera att `==` här betyder att man kontrollerar "om två värden är lika". Om if-satsen bedömer att `index` är lika med ett visst tal returneras `true`, och det efterföljande kodblocket körs. Om de inte är lika går programmet vidare till nästa if-sats.

Den här typen av flerfaldiga villkor är användbar när man behöver köra olika kod i olika villkorssituationer.
