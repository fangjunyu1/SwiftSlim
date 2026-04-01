# Få knappen att börja fungera

I den här lektionen ska vi främst lära oss SwiftUI-knappen `Button`, felsökningsutskrift med `print`, samt Swift-funktioner.

Detta innehåll är grunden för interaktiv programmering i SwiftUI.

## Knapp

Knappen är en av de vanligaste UI-kontrollerna. När vi behöver ladda ner, öppna eller avsluta något klickar vi vanligtvis på en knapp.

Till exempel i App Store klickar man på knappen “Hämta” för att ladda ner en app.

![Button](../../RESOURCE/008_button.png)

I SwiftUI representeras en knapp med `Button`.

Grundläggande användning:

```swift
Button("") {
    
}
```

Strukturen kan delas upp i två delar:

```swift
Button("Knapptext") {
    Kod som körs när knappen klickas
}
```

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Efter körning visas en knapp med texten `Start`.

![Button](../../RESOURCE/008_button1.png)

När användaren klickar på knappen kommer koden inuti `{}` att köras.

Det är viktigt att notera att `Button` är en gränssnittskontroll (`View`) i SwiftUI, därför måste den skrivas i `body`.

### Modifieraren buttonStyle

I SwiftUI erbjuder `Button` systemets inbyggda knappstilar, som kan användas med modifieraren `buttonStyle`.

Till exempel:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` använder en knappstil som tillhandahålls av systemet.

Vanliga alternativ är:

* `.automatic`
* `.plain`
* `.bordered`
* `.borderedProminent`
* `.borderless`

![Button](../../RESOURCE/008_button7.png)

Skillnaderna mellan olika stilar ligger främst i om knappen har ram, bakgrund och hur tydligt den visuellt framhävs.

## print-utskrift

I programmering behöver man ofta kontrollera om programmet har nått en viss kodsektion.

Swift erbjuder funktionen `print` för att skriva ut felsökningsinformation.

Grundläggande skrivsätt:

```swift
print("Hello")
```

Den här raden skriver ut text till `Console` (konsolen).

### Testa om knappen fungerar

Vi kan skriva `print` inuti en knapp för att testa om knappen verkligen klickas.

```swift
Button("Start") {
    print("Test 123")
}
```

När knappen klickas kommer `Console` att visa:

```
Test 123
```

Detta visar att knappen har utlösts korrekt.

![Button](../../RESOURCE/008_button3.png)

Observera: `print` är Swift-kod, inte en gränssnittskontroll. Den kan inte placeras direkt i `body`, annars uppstår ett fel.

Till exempel är följande skrivsätt felaktigt:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Fel: body måste returnera en View
    }
}
```

I SwiftUI används `body` för att beskriva gränssnittsstrukturen och kan bara innehålla gränssnittskontroller (`View`), till exempel `Text`, `Button`, `Image` och så vidare.

Vanlig kod (beräkningslogik, `print` osv.) måste placeras i knappar, funktioner eller andra händelsehanterare.

### Console-konsolen

Det som skrivs ut med `print` visas i `Console` (konsolen) i Xcode.

Om du inte ser `Console` kan du klicka på knappen `Show the Debug Area` längst ned till höger för att öppna felsökningsområdet, och sedan klicka på `Show the Console` för att visa konsolen.

![](../../RESOURCE/008_button4.png)

Längst ned till vänster i `Console` finns två flikar: `Executable` och `Previews`.

![](../../RESOURCE/008_button5.png)

Dessa två flikar motsvarar olika körmiljöer: när du använder förhandsvisningen i `Canvas` visas `print`-utskrifter under fliken `Previews`; om appen körs i simulatorn eller på en fysisk enhet visas utskrifterna under fliken `Executable`.

Om du märker att `print` inte visar något kan du därför först kontrollera att rätt flik är vald.

## Exempel - ASCII-teckenkonst

I vissa kodprojekt ser man ofta ASCII-teckenkonst.

Teckenkonst är bilder som sätts ihop med vanliga tecken, till exempel:

![ASCII](../../RESOURCE/008_ascii.png)

Vi kan använda knapp + `print` för att skriva ut ASCII-teckenkonst.

Exempelkod:

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

När knappen klickas kommer `Console` att visa:

```
 /\_/\
( o.o )
 > ^ <
```

Observera: `\` i en sträng måste skrivas som `\\`, eftersom omvänt snedstreck är ett escape-tecken i strängar.

## Funktioner

I en knapp kan vi skriva kod direkt.

Till exempel:

```swift
Button("Start") {
    print("Hello")
}
```

Om det är lite kod är detta helt okej. Men i verklig utveckling kan logiken som en knapp utlöser vara ganska omfattande.

Till exempel:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Det kan finnas mycket mer kod
}
```

Om koden blir allt längre kommer gränssnittskoden att bli rörig om allt skrivs direkt i knappen, och den blir också svårare att läsa och underhålla.

Därför brukar vi samla denna kod i en funktion och sedan anropa funktionen i knappen.

### Vad är en funktion

En funktion är en kodsektion som kan återanvändas.

När viss kod behöver köras behöver vi bara anropa funktionen, så körs koden inuti den.

Detta gör kodstrukturen tydligare och gör det också enklare att återanvända kod.

### Grundläggande skrivsätt

I Swift definieras funktioner med nyckelordet **func**:

```swift
func randomInt() {
    // code
}
```

Den här koden definierar en funktion.

`randomInt` är funktionsnamnet, som används för att identifiera denna kodsektion.

`()` är platsen för parametrar, där man kan ta emot data som skickas in utifrån. Om ingen data behövs kan den lämnas tom.

Inuti `{}` finns funktionens kodområde, och all kod som ska köras skrivs här.

Till exempel:

```swift
func getName() {
    print("FangJunyu")
}
```

Den här funktionen har som uppgift att skriva ut en text.

### Anropa en funktion

Att definiera en funktion innebär bara att skapa denna kodsektion. Om man vill köra den måste man också anropa den.

Anropet görs genom att lägga till `()` efter funktionsnamnet:

```swift
getName()
```

När programmet kör till denna rad kommer koden i funktionen `getName` att köras.

Fullständigt exempel:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Efter körning kommer `Console` att visa:

```
FangJunyu
```

### Använda funktioner i SwiftUI

I SwiftUI-vyer skrivs funktioner vanligtvis utanför `body`.

Till exempel:

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

När knappen klickas kommer funktionen `getName()` att anropas.

På så sätt kan gränssnittskoden hållas ren, medan den konkreta logiken hanteras i funktioner.

### Funktionsparametrar

Ibland behöver en funktion utföra olika operationer beroende på olika data.

Till exempel kanske vi vill att funktionen ska kunna skriva ut olika namn, i stället för att alltid skriva ut `"FangJunyu"`.

Då kan vi använda parametrar. Parametrar kan förstås som: data som skickas in när funktionen anropas.

Till exempel:

```swift
func getName(name: String) {
    print(name)
}
```

Den här funktionen har fått en ny parameter. `name` är parameterns namn och `String` är parameterns typ.

Det betyder att funktionen behöver ta emot ett värde av typen `String`.

Eftersom funktionen nu behöver data måste vi ange detta värde när vi anropar den.

```swift
getName(name: "Sam")
```

När `"Sam"` skickas in vid anropet kommer funktionen att använda detta värde för utskrift.

Resultat:

```
Sam
```

## Exempel - skriva ut ASCII-teckenkonst med en funktion

I det tidigare exemplet skrev vi `print` direkt inuti knappen.

Men om teckenkonsten är mer komplex blir koden snabbt lång. Då kan vi lägga logiken i en funktion för att göra gränssnittskoden tydligare.

Exempelkod:

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

Efter körning och klick på knappen kommer `Console` att visa:

```
 /\_/\
( o.o )
 > ^ <
```

Här händer två saker när användaren klickar på knappen:

1. Knappen anropar funktionen `printCat()`
2. `print`-koden inuti funktionen körs

Detta gör att gränssnittskoden bara ansvarar för att utlösa händelsen, medan den konkreta logiken hanteras i funktionen.

I praktisk utveckling implementeras de flesta knappåtgärder genom funktioner.

## Sammanfattning

I den här lektionen lärde vi oss tre viktiga delar:

**1. Button-knappen**

`Button` är kontrollen i SwiftUI som används för att utlösa en åtgärd.

```swift
Button("Start") {

}
```

När användaren klickar på knappen körs koden i klammerparenteserna.

**2. print-utskrift**

`print` används för att skriva ut felsökningsinformation till `Console`.

```swift
print("Hello")
```

Utvecklaren kan använda `Console` för att kontrollera programmets körstatus.

**3. Funktioner**

En funktion är en kodsektion som kan återanvändas.

```swift
func sayHello() {
    print("Hello")
}
```

Anropa funktionen:

```swift
sayHello()
```

Om funktionen behöver data kan man använda parametrar:

```swift
func sayHello(name: String) {
    print(name)
}
```

I kommande lektioner kommer vi att fortsätta lära oss fler SwiftUI-kontroller och hur data interagerar med gränssnittet.

## Övning

Försök att slutföra följande övningar:

1. Skapa en knapp med texten `"Hello"`
2. När knappen klickas, skriv ut `Hello Swift` i `Console`
3. Lägg utskriftskoden i en funktion och anropa sedan funktionen i knappen
