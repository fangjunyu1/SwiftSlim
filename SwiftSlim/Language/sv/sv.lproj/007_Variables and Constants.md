# Variabler och konstanter

I den här lektionen ska vi främst lära oss variabler och konstanter i Swift, samt bekanta oss med några vanliga datatyper och grundläggande operatorer.

Detta innehåll är den mest grundläggande delen av programmering och är också en viktig grund för att senare lära sig SwiftUI.

## Variabler och konstanter i vardagen

Vi kan förstå variabler och konstanter genom saker i vardagen.

Variabler i vardagen:

- Innehållet i varje TV-program är olika
- Vädret är olika varje dag
- Klockan förändras varje sekund

Det gemensamma för dessa saker är att: de förändras.

Om TV:n alltid visade samma bild, vädret alltid var soligt och klockans visare aldrig rörde sig, då skulle dessa saker vara konstanter.

Det ena kan förändras, det andra förändras inte.

## Förstå variabler och konstanter

Vid apputveckling behöver man ofta att användaren fyller i eller sparar viss information.

Till exempel:

- Kontonamn
- Födelsedag
- Kontaktuppgifter
- Adress

Denna information sparas och visas sedan.

Till exempel, om användaren skriver in ett namn i appen:

```

FangJunyu

```

Behöver vi spara detta namn så att det kan visas i appen.

Man kan enkelt förstå lagringsprocessen som att lägga något i en låda.

När vi sparar ett namn är det som att lägga namnet i en låda.

Det kan finnas mycket som behöver sparas, och därför också många lådor. För att veta vad som finns i varje låda behöver vi ge lådan ett namn.

Till exempel:

```

name

````

I det här exemplet är `name` namnet, och `FangJunyu` är den sparade informationen.

![Var](../../RESOURCE/007_var.png)

**I Swift måste man använda en variabel (`var`) eller en konstant (`let`) för att deklarera data som ska sparas.**

Eftersom ett namn vanligtvis kan ändras, bör vi använda en variabel.

```swift
var name = "FangJunyu"
````

Här deklareras en variabel med namnet `name`, variabelns typ är `String`, och värdet är `"FangJunyu"`.

### Skillnaden mellan variabler och konstanter

Variabler deklareras med `var`:

```swift
var
```

Konstanter deklareras med `let`:

```swift
let
```

Till exempel:

```swift
var name = "FangJunyu"
let id = 123456
```

Om något deklareras som en variabel betyder det att värdet kan ändras; om det deklareras som en konstant kan det inte ändras igen.

Den viktigaste skillnaden mellan variabler och konstanter är alltså: om värdet får ändras eller inte.

### Ändra en konstant

Om koden försöker ändra värdet på en konstant:

```swift
let name = "Sam"
name = "Bob"
```

kommer Swift att visa att tilldelningen inte kan genomföras, eftersom det är en konstant.

```
Cannot assign to property: 'name' is a 'let' constant
```

Denna mekanism kan hjälpa utvecklare att undvika att viktig data ändras av misstag.

### Visa i SwiftUI

Öppna filen `ContentView.swift` och deklarera en variabel i View:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Här deklareras en variabel med namnet `name`, och den visas i gränssnittet genom `Text`.

Om vi ändrar innehållet i variabeln:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

kommer textinnehållet som visas av `Text` också att förändras.

På detta sätt kan vi använda variabler för att styra vilket innehåll som visas i gränssnittet, utan att behöva ändra texten direkt i `Text` varje gång.

Om informationen behövs någon annanstans kan vi också skicka vidare variabeln, ungefär som att ge innehållet i “lådan” till en annan plats att använda.

### Var variabler och konstanter skrivs i SwiftUI

I SwiftUI skrivs variabler och konstanter vanligtvis utanför `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Naturligtvis kan man också skriva variabler och konstanter inne i `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Men det finns en viktig skillnad mellan dessa två:

* Om variabler och konstanter skrivs inne i `body`, skapas de på nytt varje gång vyn beräknas om.
* Om de skrivs utanför `body`, finns de som egenskaper i vystrukturen, vilket gör kodstrukturen tydligare.

Därför skriver man dem i praktisk utveckling oftast utanför `body`.

## Datatyper

Variabler kan spara många olika typer av data. Dessa typer kallas datatyper.

Till exempel använde vi tidigare `Text` för att visa text:

```swift
Text("Hello, World")
```

Här är `"Hello, World"` av typen sträng (`String`).

Strängar används för att representera textinnehåll, och i Swift måste de omges av dubbla citationstecken `""`.

Till exempel:

```swift
var hello = "Hello, World"
```

Utöver strängar finns det många andra datatyper i Swift.

I början är de fyra vanligaste typerna:

* String
* Int
* Double
* Bool

Dessa fyra typer kan användas för att hantera det mesta av grundläggande data.

**String**

`String` representerar textinnehåll, till exempel:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Strängar används vanligtvis för att representera: användarnamn, rubriker och textinnehåll.

**Int**

`Int` representerar heltal, alltså tal utan decimaler.

Till exempel:

```swift
var age = 26
var count = 100
```

Heltal används vanligtvis för att representera: ålder, antal och räknare.

**Double**

`Double` representerar tal med decimaler.

Till exempel:

```swift
var weight = 74.5
var height = 185.0
```

I Swift används decimaler vanligtvis som standardtypen `Double`.

Det finns också en liknande typ som heter `Float`, men den kan representera ett mindre talområde, därför används `Double` oftare i praktisk utveckling.

**Bool**

Typen `Bool` används för att representera två tillstånd: `true` och `false`.

Till exempel:

```swift
var isShowAlert = true
var isLogin = false
```

Typen `Bool` används ofta i villkorsbedömningar. Till exempel om en varningsruta ska visas eller inte.

När det bara finns två möjliga resultat passar det mycket bra att använda `Bool`.

### Visa i SwiftUI

När vi visar ett värde av typen `String` kan vi använda `Text` direkt:

```swift
Text(name)
```

Men typer som `Int` och `Double` är inte strängar, så de kan inte direkt användas som en del av textinnehållet.

Om man vill visa dessa data i `Text`, kan man använda stränginterpolation (`String Interpolation`):

```swift
\()
```

Stränginterpolation måste skrivas inuti en sträng och använder `\()` runt variabeln eller konstanten.

Till exempel:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

I koden ovan betyder `""` en sträng, och `\()` används för att infoga en variabel eller konstant i strängen.

Till exempel:

```swift
"DoubleNum: \(num * 2)"
```

Det som visas blir:

```swift
DoubleNum: 2
```

På detta sätt kan vi infoga variabler eller konstanter i en sträng och sedan visa dem med `Text` i gränssnittet.

Tips: `\()` kan bara användas inuti en sträng `""`.

## Operatorer

När vi deklarerar variabler eller konstanter kan vi se följande skrivsätt:

```swift
var num = 1
```

Här kallas `=` för tilldelningsoperatorn.

Dess funktion är att tilldela värdet på högra sidan till variabeln på vänstra sidan.

I det här exemplet tilldelas `1` till variabeln `num`.

Förutom tilldelningsoperatorn finns det också några vanliga matematiska operatorer:

* `+`
* `-`
* `*`
* `/`

När vi beräknar tal, till exempel data av typen `Int` eller `Double`, använder vi dessa operatorer.

Till exempel:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

När beräkningen är klar sparas resultatet i variabeln.

## Sammanfattning

Variabler, konstanter och operatorer är de mest grundläggande begreppen inom programmering.

Med hjälp av variabler och konstanter kan vi spara olika typer av data i programmet; med hjälp av datatyper kan vi tydligt ange vilken sorts data det handlar om; med hjälp av operatorer kan vi beräkna och bearbeta data.

Denna kunskap är som grundverktygen i programmeringens värld. Att behärska detta innehåll ger en stabil grund för det fortsatta lärandet av Swift och SwiftUI.
