# Variabelen en constanten

In deze les leren we vooral over variabelen en constanten in Swift, en maken we kennis met enkele veelgebruikte datatypen en basisoperatoren.

Deze inhoud vormt de meest fundamentele kennis in programmeren en is ook een belangrijke basis voor het verdere leren van SwiftUI.

## Variabelen en constanten in het dagelijks leven

We kunnen variabelen en constanten begrijpen aan de hand van dingen uit het dagelijks leven.

Variabelen in het dagelijks leven:

- de inhoud van elk programma op televisie is anders
- het weer is elke dag anders
- een klok verandert elke seconde

Het gemeenschappelijke kenmerk van deze dingen is: ze veranderen.

Als de televisie altijd maar één beeld zou tonen, het weer altijd zonnig zou zijn en de wijzers van de klok nooit zouden bewegen, dan zouden deze dingen constanten zijn.

Het ene kan veranderen, het andere niet.

## Variabelen en constanten begrijpen

Bij appontwikkeling moeten gebruikers meestal bepaalde informatie invullen of opslaan.

Bijvoorbeeld:

- accountnaam
- verjaardag
- contactgegevens
- adres

Deze informatie wordt opgeslagen en weergegeven.

Bijvoorbeeld, als een gebruiker een naam invoert in een app:

```
FangJunyu
```

dan moeten we deze naam opslaan, zodat we hem in de app kunnen weergeven.

We kunnen het opslagproces eenvoudig begrijpen als: iets in een lade bewaren.

Wanneer we een naam opslaan, is het alsof we die naam in een lade leggen.

Er kunnen veel dingen zijn die moeten worden opgeslagen, en dus ook veel laden. Om te weten wat er in elke lade zit, moeten we elke lade een naam geven.

Bijvoorbeeld:

```
name
```

In dit voorbeeld is `name` de naam en `FangJunyu` de opgeslagen informatie.

![Var](../../RESOURCE/007_var.png)

**In Swift moet je, als je gegevens wilt opslaan, altijd een variabele（`var`）of constante（`let`）declareren.**

Omdat een naam meestal aangepast kan worden, moeten we hiervoor een variabele gebruiken.

```swift
var name = "FangJunyu"
```

Hier declareren we een variabele met de naam `name`，van het type `String`，met als waarde `"FangJunyu"`。

### Het verschil tussen variabelen en constanten

Variabelen worden gedeclareerd met `var`：

```swift
var
```

Constanten worden gedeclareerd met `let`：

```swift
let
```

Bijvoorbeeld:

```swift
var name = "FangJunyu"
let id = 123456
```

Als iets als variabele wordt gedeclareerd, betekent dit dat de waarde kan worden gewijzigd；als het als constante wordt gedeclareerd, kan het daarna niet meer worden aangepast.

Daarom is het belangrijkste verschil tussen variabelen en constanten: of de waarde mag veranderen.

### Een constante wijzigen

Als de code probeert de waarde van een constante te wijzigen:

```swift
let name = "Sam"
name = "Bob"
```

zal Swift melden dat de toewijzing niet kan worden uitgevoerd, omdat het een constante is.

```
Cannot assign to property: 'name' is a 'let' constant
```

Dit mechanisme helpt ontwikkelaars voorkomen dat bepaalde belangrijke gegevens per ongeluk worden gewijzigd.

### Weergave in SwiftUI

Open het bestand `ContentView.swift` en declareer binnen de View een variabele:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Hier wordt een variabele met de naam `name` gedeclareerd en via `Text` in de interface weergegeven.

Als we de inhoud van de variabele wijzigen:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

zal de tekst die `Text` toont ook veranderen.

Op deze manier kunnen we variabelen gebruiken om de inhoud van de interface te sturen, zonder telkens direct de tekst in `Text` te moeten aanpassen.

Als andere plekken deze informatie nodig hebben, kunnen we de variabele ook doorgeven, alsof we de inhoud van de “lade” ergens anders laten gebruiken.

### De plaats van variabelen en constanten in SwiftUI

In SwiftUI worden variabelen en constanten meestal buiten `body` geschreven:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Natuurlijk kun je variabelen en constanten ook binnen `body` schrijven:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Toch is er een belangrijk verschil tussen deze twee:

- als variabelen en constanten binnen `body` staan, worden ze telkens opnieuw aangemaakt wanneer de view opnieuw wordt berekend
- als ze buiten `body` staan, bestaan ze als eigenschappen van de view-structuur en is de codestructuur duidelijker

Daarom worden variabelen en constanten in echte ontwikkeling meestal buiten `body` geplaatst.

## Datatypen

Variabelen kunnen veel verschillende soorten gegevens opslaan, en deze soorten noemen we datatypen.

Bijvoorbeeld, eerder gebruikten we `Text` om tekst weer te geven:

```swift
Text("Hello, World")
```

Hier behoort `"Hello, World"` tot het type string（`String`）。

Strings worden gebruikt om tekstinhoud weer te geven, en in Swift moeten ze tussen dubbele aanhalingstekens `""` staan.

Bijvoorbeeld:

```swift
var hello = "Hello, World"
```

Naast strings zijn er in Swift nog veel andere datatypen.

In de beginfase zijn de vier meest voorkomende typen:

- `String`
- `Int`
- `Double`
- `Bool`

Met deze vier typen kun je de meeste basale gegevensverwerking uitvoeren.

**`String`**

`String` betekent tekstinhoud, bijvoorbeeld:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Strings worden meestal gebruikt voor: gebruikersnamen, titels en tekstinhoud.

**`Int`**

`Int` betekent gehele getallen, dus getallen zonder decimalen.

Bijvoorbeeld:

```swift
var age = 26
var count = 100
```

Gehele getallen worden meestal gebruikt voor: leeftijd, aantallen en tellingen.

**`Double`**

`Double` betekent getallen met decimalen.

Bijvoorbeeld:

```swift
var weight = 74.5
var height = 185.0
```

In Swift gebruiken decimalen standaard meestal het type `Double`。

Er bestaat ook een vergelijkbaar type genaamd `Float`，maar dat kan een kleiner waardenbereik weergeven. Daarom wordt `Double` in de praktijk vaker gebruikt.

**`Bool`**

Het type `Bool` wordt gebruikt om twee toestanden uit te drukken: `true` en `false`。

Bijvoorbeeld:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` wordt vaak gebruikt voor voorwaardelijke controles. Bijvoorbeeld of er een melding moet worden getoond.

Voor situaties met slechts twee uitkomsten is `Bool` bijzonder geschikt.

### Weergave in SwiftUI

Wanneer we een `String`-type weergeven, kunnen we direct `Text` gebruiken:

```swift
Text(name)
```

Maar typen zoals `Int` en `Double` zijn geen strings, en kunnen daarom niet direct als onderdeel van tekstinhoud worden gebruikt.

Als we deze gegevens in `Text` willen weergeven, kunnen we stringinterpolatie（String Interpolation）gebruiken:

```swift
\()
```

Stringinterpolatie moet binnen de stringinhoud worden geschreven en gebruikt `\()` om een variabele of constante heen.

Bijvoorbeeld:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

In de bovenstaande code betekenen `""` een string, en `\()` wordt gebruikt om een variabele of constante in de string in te voegen.

Bijvoorbeeld:

```swift
"DoubleNum: \(num * 2)"
```

De weergegeven inhoud is:

```swift
DoubleNum: 2
```

Op deze manier kunnen we variabelen of constanten in een string invoegen en ze vervolgens met `Text` in de interface weergeven.

Tip: `\()` kan alleen binnen een string `""` worden gebruikt.

## Operatoren

Bij het declareren van een variabele of constante zien we vaak de volgende schrijfwijze:

```swift
var num = 1
```

Hier heet `=` de toewijzingsoperator.

Zijn functie is: de waarde aan de rechterkant toewijzen aan de variabele aan de linkerkant.

In dit voorbeeld wordt `1` toegewezen aan de variabele `num`。

Naast de toewijzingsoperator zijn er ook enkele veelgebruikte rekenoperatoren:

- `+`
- `-`
- `*`
- `/`

Wanneer we rekenen met getallen, bijvoorbeeld gegevens van het type `Int` of `Double`，dan gebruiken we deze operatoren.

Bijvoorbeeld:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Na de berekening wordt het resultaat in de variabele opgeslagen.

## Samenvatting

Variabelen, constanten en operatoren zijn de meest fundamentele concepten in programmeren.

Met variabelen en constanten kunnen we allerlei soorten gegevens in een programma opslaan；met datatypen kunnen we duidelijk maken wat voor soort gegevens het zijn；met operatoren kunnen we deze gegevens berekenen en verwerken.

Deze kennis is als het basisgereedschap van de programmeerwereld. Als je deze inhoud beheerst, leg je een stevige basis voor het verdere leren van Swift en SwiftUI.
