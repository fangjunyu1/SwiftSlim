# Laat de knop werken

In deze les leren we vooral over `Button`-knoppen, `print` voor debug-uitvoer en Swift-functies.

Deze inhoud vormt de basis van interactief programmeren in SwiftUI.

## Knoppen

Knoppen zijn de UI-elementen die we het vaakst gebruiken. Wanneer we bijvoorbeeld iets moeten downloaden, openen of afsluiten, klikken we meestal op een knop.

In de App Store klik je bijvoorbeeld op de knop “Download” om een app te downloaden.

![Button](../../RESOURCE/008_button.png)

In SwiftUI wordt een knop weergegeven met `Button`。

Basisgebruik:

```swift
Button("") {
    
}
```

De structuur kan worden verdeeld in twee delen:

```swift
Button("Knoptekst") {
    code die wordt uitgevoerd wanneer op de knop wordt geklikt
}
```

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Na het uitvoeren verschijnt een knop met `Start`。

![Button](../../RESOURCE/008_button1.png)

Wanneer de gebruiker op de knop klikt, wordt de code binnen `{}` uitgevoerd.

Belangrijk om te weten: `Button` is een interface-element（`View`）van SwiftUI, dus moet het binnen `body` worden geschreven.

### De `buttonStyle`-modifier

In SwiftUI biedt `Button` ingebouwde systeemstijlen voor knoppen, die gebruikt kunnen worden via de `buttonStyle`-modifier.

Bijvoorbeeld:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` gebruikt een knopstijl die door het systeem wordt geleverd.

Veelvoorkomende opties zijn:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

De verschillen tussen deze stijlen zitten vooral in de aanwezigheid van een rand, een achtergrond en de mate van visuele nadruk.

## `print`-uitvoer

Bij programmeren moeten we vaak controleren of een programma daadwerkelijk een bepaald stuk code bereikt.

Swift biedt de functie `print` om debug-informatie uit te voeren.

Basisvorm:

```swift
print("Hello")
```

Deze regel code schrijft tekst uit naar de Console（console）。

### Testen of de knop werkt

We kunnen `print` in de knop schrijven om te testen of de knop is ingedrukt.

```swift
Button("Start") {
    print("Test 123")
}
```

Wanneer op de knop wordt geklikt, zal de Console het volgende tonen:

```
Test 123
```

Dit laat zien dat de knop succesvol is geactiveerd.

![Button](../../RESOURCE/008_button3.png)

Let op: `print` is Swift-code, geen interface-element. Het kan niet direct in `body` worden geplaatst, anders krijg je een fout.

Bijvoorbeeld, de onderstaande schrijfwijze is fout:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // fout: body moet een View retourneren
    }
}
```

In SwiftUI wordt `body` gebruikt om de interface-structuur te beschrijven, en daar mogen alleen interface-elementen（`View`）staan, zoals `Text`、`Button`、`Image` enzovoort.

Gewone code（berekeningslogica, `print` enzovoort）moet in knoppen, functies of andere event handlers worden geplaatst.

### De Console

De inhoud die door `print` wordt uitgevoerd, wordt weergegeven in de Console（console）van Xcode.

Als je de Console niet ziet, kun je op de knop `Show the Debug Area` rechtsonder klikken om het debuggebied te openen, en vervolgens op `Show the Console` klikken om de console te tonen.

![](../../RESOURCE/008_button4.png)

Linksonder in de Console staan twee labels: `Executable` en `Previews`。

![](../../RESOURCE/008_button5.png)

Deze twee labels komen overeen met verschillende uitvoeromgevingen: wanneer je een view in Canvas voorvertoont, verschijnt de `print`-uitvoer onder `Previews`；wanneer je de app in de simulator of op een echt apparaat uitvoert, verschijnt de uitvoer onder `Executable`。

Als je merkt dat `print` geen uitvoer laat zien, controleer dan eerst of je het juiste label hebt geselecteerd.

## Voorbeeld - ASCII-tekentjes

In sommige codeprojecten zien we vaak ASCII-tekeningen.

ASCII-tekeningen zijn patronen die met gewone tekens zijn opgebouwd, bijvoorbeeld:

![ASCII](../../RESOURCE/008_ascii.png)

We kunnen een knop + `print` gebruiken om een ASCII-tekening uit te voeren.

Voorbeeldcode:

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

Wanneer op de knop wordt geklikt, geeft de Console het volgende weer:

```
 /\_/\
( o.o )
 > ^ <
```

Let op: `\` in strings moet als `\\` worden geschreven, omdat de backslash in strings een escape-teken is.

## Functies

Binnen een knop kunnen we direct code schrijven.

Bijvoorbeeld:

```swift
Button("Start") {
    print("Hello")
}
```

Als er weinig code is, is dat geen probleem. Maar in echte ontwikkeling kan de logica die door één knop wordt geactiveerd veel uitgebreider zijn.

Bijvoorbeeld:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // er kan nog veel meer code zijn
}
```

Als de code steeds langer wordt, maakt direct schrijven binnen de knop de interfacecode rommelig en minder makkelijk leesbaar en onderhoudbaar.

Daarom organiseren we deze code meestal in een functie, en roepen we die functie vervolgens in de knop aan.

### Wat is een functie

Een functie is een stuk code dat hergebruikt kan worden.

Wanneer bepaalde code moet worden uitgevoerd, hoeven we alleen maar deze functie aan te roepen, en dan zal de code binnen de functie worden uitgevoerd.

Dit maakt de codestructuur duidelijker en hergebruik eenvoudiger.

### Basisvorm

In Swift worden functies gedefinieerd met het sleutelwoord **func**：

```swift
func randomInt() {
    // code
}
```

Deze code definieert een functie.

`randomInt` is de functienaam, waarmee dit stuk code wordt geïdentificeerd.

`()` geeft de plaats van parameters aan, waar externe gegevens kunnen worden doorgegeven. Als er geen gegevens nodig zijn, kan dit leeg blijven.

Binnen `{}` staat het codegebied van de functie. Alle code die moet worden uitgevoerd, wordt daar geschreven.

Bijvoorbeeld:

```swift
func getName() {
    print("FangJunyu")
}
```

De functie van deze functie is om een tekstregel uit te voeren.

### Een functie aanroepen

Het definiëren van een functie betekent alleen dat je deze code hebt gemaakt. Als je haar wilt uitvoeren, moet je haar ook aanroepen.

De manier om dat te doen is door `()` achter de functienaam te zetten:

```swift
getName()
```

Wanneer het programma deze regel bereikt, zal de code in de functie `getName` worden uitgevoerd.

Volledig voorbeeld:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Na het uitvoeren zal de Console het volgende tonen:

```
FangJunyu
```

### Functies gebruiken in SwiftUI

In SwiftUI-views worden functies meestal buiten `body` geschreven.

Bijvoorbeeld:

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

Wanneer op de knop wordt geklikt, wordt de functie `getName()` aangeroepen.

Hierdoor blijft de interfacecode overzichtelijk, terwijl de concrete logica in de functie wordt afgehandeld.

### Functieparameters

Soms moet een functie verschillende handelingen uitvoeren op basis van verschillende gegevens.

Bijvoorbeeld, we willen dat de functie verschillende namen kan uitvoeren in plaats van alleen de vaste tekst `"FangJunyu"`。

Daarvoor kunnen we parameters gebruiken. Parameters kun je begrijpen als: gegevens die worden doorgegeven op het moment dat de functie wordt aangeroepen.

Bijvoorbeeld:

```swift
func getName(name: String) {
    print(name)
}
```

Deze functie heeft een extra parameter gekregen. `name` is de naam van de parameter en `String` is het type.

Dit betekent dat de functie gegevens van het type `String` moet ontvangen.

Omdat de functie nu gegevens nodig heeft, moet die waarde ook worden meegegeven bij het aanroepen.

```swift
getName(name: "Sam")
```

Wanneer `"Sam"` wordt meegegeven, zal de functie deze waarde gebruiken voor de uitvoer.

Resultaat:

```
Sam
```

## Voorbeeld - ASCII-tekentjes uitvoeren via een functie

In het vorige voorbeeld schreven we `print` direct binnen de knop.

Maar als de ASCII-tekening complexer wordt, wordt de code erg lang. Dan kunnen we de logica in een functie plaatsen, zodat de interfacecode overzichtelijker blijft.

Voorbeeldcode:

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

Na het uitvoeren en klikken op de knop, zal de Console het volgende tonen:

```
 /\_/\
( o.o )
 > ^ <
```

Hier gebeuren twee dingen wanneer de gebruiker op de knop klikt:

1. de knop roept de functie `printCat()` aan
2. de `print`-code in de functie wordt uitgevoerd

Op deze manier is de interfacecode alleen verantwoordelijk voor het activeren van een gebeurtenis, terwijl de concrete logica in de functie wordt afgehandeld.

In echte ontwikkeling worden de meeste knopacties via functies gerealiseerd.

## Samenvatting

In deze les hebben we drie belangrijke dingen geleerd:

**1. De `Button`-knop**

`Button` is een control in SwiftUI die wordt gebruikt om acties te activeren.

```swift
Button("Start") {

}
```

Wanneer de gebruiker op de knop klikt, wordt de code binnen de accoladen uitgevoerd.

**2. `print`-uitvoer**

`print` wordt gebruikt om debug-informatie naar de Console uit te voeren.

```swift
print("Hello")
```

Ontwikkelaars kunnen via de Console de uitvoeringsstatus van het programma bekijken.

**3. Functies**

Een functie is een stuk code dat hergebruikt kan worden.

```swift
func sayHello() {
    print("Hello")
}
```

De functie aanroepen:

```swift
sayHello()
```

Als de functie gegevens nodig heeft, kunnen we parameters gebruiken:

```swift
func sayHello(name: String) {
    print(name)
}
```

In de volgende lessen zullen we verder leren over meer SwiftUI-controls en hoe gegevens met de interface samenwerken.

## Oefening

Probeer de volgende oefening te voltooien:

1. Maak een knop waarvan de tekst `"Hello"` is
2. Wanneer op de knop wordt geklikt, moet in de Console `Hello Swift` worden uitgevoerd
3. Schrijf de uitvoercode in een functie en roep die functie vervolgens aan in de knop
