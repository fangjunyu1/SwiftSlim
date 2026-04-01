# Lussen en lijsten

In deze les leren we de `for`-lus in Swift en `ForEach` in SwiftUI.

Ze helpen ons allebei om elementen in een array in volgorde te lezen. In echte ontwikkeling moeten we vaak een groep gegevens één voor één ophalen en die daarna verwerken of weergeven, en een lus is precies een belangrijk hulpmiddel om dat te doen.

Wanneer we door webpagina’s bladeren of een app gebruiken, zien we vaak veel lijsten of items. Zulke inhoud wordt meestal eerst opgeslagen in een `array`, en daarna via een `lus` één voor één uitgelezen en uiteindelijk in de interface weergegeven.

Bijvoorbeeld de lijst met zoekresultaten van Google:

![Google](../../Resource/017_google.png)

Elk item in de lijst met zoekresultaten komt meestal overeen met één stuk data en wordt via een lus één voor één weergegeven.

Daarom verschijnen `arrays` en `lussen` vaak samen. Een `array` is verantwoordelijk voor het opslaan van een groep gegevens, en een `lus` haalt deze gegevens in volgorde op en voert dezelfde bewerking uit.

Hieronder beginnen we eerst met de meest basale `for`-lus.

## Aftellen

Stel dat we een aftelfunctie willen simuleren en achtereenvolgens `“5、4、3、2、1”` willen uitvoeren.

De meest directe schrijfwijze is:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Hoewel deze manier het aftellen kan simuleren, wordt het erg herhalend als er veel inhoud is, en later is het ook niet handig om aan te passen.

Op dat moment kunnen we de gegevens eerst in een array zetten en daarna met een `for`-lus achtereenvolgens uitvoeren:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Deze schrijfwijze is beknopter en ook makkelijker uit te breiden. Zelfs als er veel getallen in het aftellen zitten, hoeven we `print` niet regel voor regel te herhalen; we hoeven de lus alleen maar automatisch elk element in de array te laten verwerken.

We kunnen deze code in een knop zetten om te testen:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Wanneer je op de knop klikt, haalt de `for`-lus in de volgorde van de array elk geheel getal uit `countDown` en print dat naar de console.

Laten we nu bekijken hoe de `for`-lus werkt.

## for-lus

De `for`-lus wordt gebruikt om een groep gegevens in volgorde te verwerken. De meest voorkomende objecten zijn arrays en bereiken.

Basissyntax:

```swift
for element in array of bereik {
    uit te voeren code
}
```

Bijvoorbeeld de aftelcode van zojuist:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Hier staat `i` voor het huidige opgehaalde element, en achter `in` staat de data waarover geloopt wordt, dus de array `countDown`.

De betekenis van deze code is: het programma haalt uit de array `countDown` elk element in volgorde op. Elke keer dat er een element wordt opgehaald, wordt dat tijdelijk aangeduid met `i`, en daarna wordt de code tussen de accolades uitgevoerd.

Het uitvoeringsproces kun je zo begrijpen:

* De eerste keer wordt `5` opgehaald, dus op dat moment is de waarde van `i` `5`
* `print(i)` wordt uitgevoerd en geeft `5` weer
* Daarna wordt het volgende element `4` opgehaald
* Opnieuw wordt `print(i)` uitgevoerd en wordt `4` weergegeven

De daaropvolgende `3`、`2` en `1` worden op dezelfde manier achtereenvolgens uitgevoerd.

![for](../../Resource/017_for.png)

Wanneer alle elementen in de array verwerkt zijn, eindigt de `for`-lus automatisch.

Met de `for`-lus kunnen we elk element in een array ophalen en functies zoals aftellen uitvoeren.

**Tip**: `i` is een heel gebruikelijke naam in een for-lus en wordt gebruikt om het huidige opgehaalde element aan te duiden, maar het is niet verplicht; je kunt ook andere Engelse namen gebruiken.

Bijvoorbeeld `num` gebruiken om elk opgehaald element aan te duiden:

```swift
for num in countDown {
    print(num)
}
```

Binnen de accolades moet je dan ook `num` gebruiken om het huidige opgehaalde element aan te duiden.

### Lusbereik

De `for`-lus kan niet alleen over arrays lopen, maar ook over een bereik.

Wanneer we bijvoorbeeld de som van alle positieve gehele getallen binnen `50` willen berekenen, moeten we alle gehele getallen tussen `1` en `50` één voor één optellen.

De meest directe schrijfwijze zou kunnen zijn:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Het probleem van deze schrijfwijze is dat we elk getal handmatig moeten uitschrijven. Dat is omslachtig en niet geschikt voor echte ontwikkelscenario’s.

Op dat moment kunnen we de bereik-operator in combinatie met een `for`-lus gebruiken om dit te doen.

In het eerdere hoofdstuk “operatoren” hebben we de bereik-operator al geleerd:

```swift
1...3   // 1, 2, 3
```

Hier staat `...` voor een gesloten bereik, dat wil zeggen: begin- en eindpunt zijn inbegrepen.

Daarom kunnen we hier een `for`-lus gebruiken voor het bereik van de gehele getallen van `1` tot `50`:

```swift
for i in 1...50 {
    
}
```

We moeten deze gehele getallen optellen, dus we hebben ook een variabele nodig om de totale som op te slaan:

```swift
var count = 0
```

Daarna tellen we tijdens elke iteratie het huidige opgehaalde getal op bij `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Deze code betekent:

* `count` wordt gebruikt om de huidige totale som op te slaan
* De `for`-lus haalt de gehele getallen van `1` tot `50` één voor één op
* Elke keer dat er een geheel getal wordt opgehaald, wordt `count += i` één keer uitgevoerd
* Na het einde van de lus bevat `count` de uiteindelijke totale som

Zo kunnen we de som van alle positieve gehele getallen binnen `50` krijgen.

Op dezelfde manier hoeven we, als we de som van de gehele getallen van `1` tot `100` willen berekenen, alleen het bereik aan te passen:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

De `for`-lus kan dus niet alleen over arrays lopen, maar ook over een bereik. Dit vermogen om gegevens in volgorde herhaald te verwerken is heel gebruikelijk in ontwikkeling.

Het kan ons helpen om veel repetitief werk automatisch af te handelen, zonder dat we handmatig elk getal voor de optelling of andere soortgelijke herhalende bewerkingen hoeven uit te schrijven.

## Lussen in SwiftUI

De eerdere `for`-lus hoort bij de Swift-taal.

Maar in SwiftUI kunnen we `for` niet direct in de view-structuur gebruiken om views te genereren:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Dat komt omdat `VStack` SwiftUI-views nodig heeft, en een gewone `for`-lus zelf geen view is.

Als we in SwiftUI op basis van de inhoud van een array herhaaldelijk een interface willen genereren, moeten we `ForEach` gebruiken.

Als we bijvoorbeeld de namen van alle leden van een groep willen tonen, kunnen we dit schrijven:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Weergave-effect:

![for1](../../Resource/017_for1.png)

Daarna voegen we aan elke `Text` dezelfde modifier toe:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Nu wordt elke `Text` weergegeven met een kleiner en vetter lettertype.

Weergave-effect:

![](../../Resource/017_for2.png)

Hoewel modifiers de interface mooier maken, zorgen ze er ook voor dat de code langer en repetitiever wordt.

Als er meer namen bijkomen, of als we later lettertype, kleur en andere stijlen uniform willen aanpassen, moeten we veel dezelfde code herhaald schrijven en aanpassen. Dat is omslachtig en niet handig in onderhoud.

Op dat moment kunnen we eerst deze namen in een array zetten en daarna `ForEach` in SwiftUI gebruiken om op basis van de gegevens in de array herhaald views te genereren:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Deze codegroep is beknopter. `ForEach` leest achtereenvolgens elk element in de array uit en toont de overeenkomstige inhoud in de interface.

Wanneer we later namen toevoegen, hoeven we alleen de namen in de array `names` aan te passen; we hoeven niet telkens opnieuw `Text` en de complexe modifiers toe te voegen.

## ForEach

`ForEach` is een structuur in SwiftUI die gebruikt wordt om herhaaldelijk views te genereren. Je kunt het begrijpen als een soort structuur in SwiftUI die lijkt op een `for`-lus.

Basisgebruik:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-code
}
```

Bijvoorbeeld de groepsnamen van zojuist:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Deze code betekent:

`names` is de array waarover geloopt wordt, dus de gegevens die getoond moeten worden.

`id:\.self` betekent dat het element zelf gebruikt wordt om elk item te onderscheiden.

In het huidige voorbeeld bevat de array strings:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Dus SwiftUI gebruikt direct de strings "Sam"、"John"、"Wathon" en "Bob" zelf om verschillende inhoud van elkaar te onderscheiden.

Voor eenvoudige arrays die in de beginfase vaak voorkomen, zoals `String` en `Int`, kunnen we meestal eerst gewoon schrijven:

```swift
id: \.self
```

Je hoeft nu alleen deze ene schrijfwijze te onthouden; het is nog niet nodig om dieper in andere regels voor id te duiken.

`item in` betekent het huidige opgehaalde element.

Bijvoorbeeld: tijdens de eerste iteratie is `item` `"Sam"`, en tijdens de tweede iteratie is `item` `"John"`.

Dus:

```swift
Text(item)
```

wordt achtereenvolgens:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

De functie van deze code is dus: uit de array `names` elke naam één voor één ophalen en voor elke naam een `Text`-view genereren.

### Uitvoeringsproces

Het uitvoeringsproces kun je zo begrijpen:

* `ForEach` leest eerst het eerste element `"Sam"` uit de array `names`
* `item` stelt tijdelijk `"Sam"` voor
* `Text(item)` toont `"Sam"`
* Daarna wordt het volgende element `"John"` gelezen
* Vervolgens wordt dezelfde view-code opnieuw uitgevoerd

Uiteindelijk worden alle namen in de array weergegeven.

Het voordeel van deze schrijfwijze is: wanneer het aantal namen groter wordt, hoeven we niet veel `Text`-regels te herhalen; we hoeven alleen de inhoud van de array aan te passen.

### Foto’s loopen

`ForEach` kan niet alleen tekst tonen, maar ook afbeeldingen, kleuren of andere SwiftUI-views.

Stel bijvoorbeeld dat we 4 afbeeldingen voorbereiden:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Sleep deze vier afbeeldingen naar de map Assets in Xcode.

![image](../../Resource/017_for3.png)

Als we geen `ForEach` gebruiken, moeten we elke afbeelding handmatig uitschrijven:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Weergave-effect:

![image](../../Resource/017_for4.png)

Hoewel deze schrijfwijze de functie kan realiseren, wordt de code vrij lang.

Als er steeds meer afbeeldingen bijkomen, moeten we steeds meer `Image`-code herhalen.

Als we later de afbeeldingsgrootte uniform willen aanpassen, moeten we die ook één voor één wijzigen.

Op dat moment kunnen we de afbeeldingsnamen in een array zetten en daarna `ForEach` gebruiken om herhaald afbeeldingsviews te genereren:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Hier is `images` een string-array, en elk element in de array is een afbeeldingsnaam.

`ForEach(images, id: \.self)` betekent: lees achtereenvolgens elk element uit de array `images`, gebruik het element zelf om elk item te onderscheiden, en genereer daarna op basis van het huidige element de bijbehorende view.

Bijvoorbeeld: de eerste keer dat `"430F9BEF"` wordt gelezen, dan is:

```swift
Image(item)
```

gelijk aan:

```swift
Image("430F9BEF")
```

De volgende afbeeldingen worden op dezelfde manier achtereenvolgens weergegeven.

![image](../../Resource/017_for4.png)

Ook hier gebruiken we nog steeds:

```swift
id: \.self
```

De reden is dezelfde als eerder: omdat de elementen in de array `images` ook eenvoudige strings zijn, kunnen we in de beginfase direct het element zelf als onderscheidingswijze gebruiken.

Je kunt het eenvoudig begrijpen als een vaste formule:

**Wanneer `ForEach` over een eenvoudige array zoals `String` of `Int` loopt, schrijven we meestal `id: \.self`.**

### Afbeeldingen toevoegen

Als we later afbeeldingen moeten toevoegen, hoeven we alleen de inhoud van de array aan te passen:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

We hoeven dan geen nieuwe `Image`-code meer te herhalen.

Als er veel afbeeldingen zijn, kun je dit samen met `ScrollView` gebruiken, anders kun je de inhoud niet volledig bekijken zodra die buiten het scherm valt.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Afbeeldingen aanpassen

Wanneer we de stijl van afbeeldingen uniform willen aanpassen, hoeven we alleen de code binnen `ForEach` te wijzigen.

Bijvoorbeeld: verander de breedte naar `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Zo worden alle afbeeldingen tegelijk aangepast, zonder dat we ze één voor één hoeven te veranderen.

Dat is een belangrijke functie van `ForEach`:

**Wanneer meerdere views dezelfde structuur hebben en alleen de inhoud verschillend is, kun je één stuk view-code schrijven en daarna door de data in de array laten bepalen wat wordt weergegeven.**

## Samenvatting

In deze les hebben we `for`-lussen en `ForEach` geleerd.

De `for`-lus wordt gebruikt om elementen in arrays of bereiken in volgorde te verwerken en is meer gericht op dataverwerking.

`ForEach` wordt gebruikt om in SwiftUI op basis van array-inhoud herhaaldelijk views te genereren en is meer gericht op de weergave van views.

Voor het huidige beginnersniveau is de meest voorkomende schrijfwijze van `ForEach`:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-code
}
```

Daarin betekent `id: \.self` dat het element zelf gebruikt wordt om elk item te onderscheiden.

Wanneer de inhoud van de array uit eenvoudige types zoals `String` en `Int` bestaat, kunnen we meestal eerst deze ene schrijfwijze gebruiken.

Later, wanneer je tijdens het browsen op webpagina’s of in apps een groep herhaalde teksten, afbeeldingen of andere lijstinhoud ziet, kun je eraan denken dat zulke inhoud in SwiftUI meestal eerst in een array wordt gezet en daarna via `ForEach` één voor één wordt weergegeven.
