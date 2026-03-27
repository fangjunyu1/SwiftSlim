# Citatencarrousel

In deze les maken we een functie voor een "citatencarrousel" en leren we dieper over basiskennis van Swift, zoals arrays (Array) en voorwaardelijke instructies (`if-else`).

We laten zien hoe je meerdere citaten opslaat en met knopinteractie een doorlopende carrousel van citaten maakt.

![alt text](../../RESOURCE/011_word.png)

## Een citaat weergeven

Eerst moeten we in SwiftUI een citaat weergeven.

De eenvoudigste manier is om de `Text`-view te gebruiken:

```swift
Text("Slow progress is still progress.")
```

Deze code kan maar één vast citaat tonen. Als we meerdere citaten willen tonen en ertussen willen wisselen, moeten we de citaten eerst opslaan.

Maar een gewone stringvariabele kan maar één citaat bewaren:

```swift
let sayings = "Slow progress is still progress."
```

Als je meerdere citaten wilt opslaan, zou je voor elk citaat een aparte variabele moeten declareren:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Maar in echte ontwikkeling is deze aanpak niet alleen omslachtig; omdat elke variabele losstaat, kunnen we ook niet flexibel tussen citaten wisselen.

Om meerdere citaten makkelijk te beheren, hebben we een datastructuur nodig die ze samen opslaat: de array (`Array`).

Met een array kan de bovenstaande code worden opgeslagen als:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tip: volgens programmeerconventies krijgt een arrayvariabele die meerdere elementen opslaat meestal een meervoudige naam, zoals `sayings`, om aan te geven dat het om een verzameling gaat.**

## Arrays

In Swift is een array een geordende verzameling elementen en wordt die weergegeven met vierkante haken `[]`.

```swift
[]
```

In een array kunnen meerdere elementen van hetzelfde type staan, gescheiden door Engelse komma's `,`.

Bijvoorbeeld:

```swift
[101, 102, 103, 104, 105]
```

Je kunt een array eenvoudig zien als een trein:

![Array](../../RESOURCE/011_array1.png)

De hele trein stelt het array-object voor, en elke wagon staat in een vaste volgorde.

### Index en toegang tot elementen

Omdat arrays geordend zijn, kan het systeem een specifiek element vinden op basis van de positie. Dit mechanisme heet een index (`Index`).

In Swift, net als in de meeste programmeertalen, begint de index van een array bij `0`, niet bij `1`. Dat betekent dat het eerste element index `0` heeft, het tweede element index `1`, enzovoort.

![Array](../../RESOURCE/011_array2.png)

Als je een specifiek element uit de array wilt ophalen, zet je achter de naam van de array vierkante haken met daarin de index van het doel-element.

Bijvoorbeeld:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Als je probeert een index te gebruiken die buiten het geldige bereik valt, krijg je een probleem met "Index Out of Range". Daarom moet je bij het openen van array-elementen altijd opletten dat de index geldig is.

**Index buiten bereik**

Als een array bijvoorbeeld maar 5 elementen heeft, zijn de geldige indexen `0` tot en met `4`. Als we `sayings[5]` proberen te openen, kan het programma die "wagon" niet vinden. Dat veroorzaakt een fout "Index Out of Range" en laat de app crashen.

![Array](../../RESOURCE/011_array3.png)

### Werken met arrays

Arrays ondersteunen niet alleen statische definities, maar ook het toevoegen, verwijderen en wijzigen van elementen. Je kunt ook de lengte van een array opvragen.

Tip: als je een array wilt wijzigen, moet je `var` gebruiken en niet `let`.

**1. Element toevoegen**

Met de methode `append` kun je aan het einde van de array een element toevoegen:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Element verwijderen**

Met `remove(at:)` kun je een specifiek element uit de array verwijderen:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Element wijzigen**

Je kunt een element direct aanpassen via zijn index:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Lengte van de array tellen**

Gebruik de eigenschap `count` om het aantal elementen in de array op te halen:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Citaten weergeven met een array

Om meerdere citaten te tonen, kunnen we de citaten in een array opslaan en ze daarna via de index ophalen en weergeven.

Maak eerst in `ContentView` een array `sayings` om de citaten op te slaan, en lees daarna in de `Text`-view via een index het juiste citaat uit:

```swift
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

Hier betekent `sayings[0]` het eerste citaat in de array.

Als je een ander citaat wilt tonen, hoef je alleen de index tussen de haken te veranderen:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### De index van het citaat definiëren

Om een dynamisch wisselend citaat te maken, kunnen we de index niet hard coderen in de `Text`-view.

We moeten een aparte variabele maken om de momenteel getoonde index op te slaan.

In SwiftUI kunnen we een veranderlijke index declareren met `@State`:

```swift
@State private var index = 0
```

SwiftUI luistert naar variabelen die met `@State` zijn gemarkeerd. Wanneer `index` verandert, rendert SwiftUI de view opnieuw en toont het bijbehorende citaat.

Daarna gebruiken we `sayings[index]` om het juiste citaat dynamisch op te halen:

```swift
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

Wanneer de waarde van `index` verandert, toont `Text` een ander citaat.

### De index met een knop bedienen

Om tussen citaten te wisselen, kunnen we `Button` gebruiken om de waarde van `index` te veranderen. Bij elke klik wordt `index` automatisch met `1` verhoogd:

```swift
Button("Next") {
    index += 1
}
```

Wanneer we op de knop klikken, verandert de waarde van `index` van `0` naar `1`, waardoor de view opnieuw wordt opgebouwd. `Text(sayings[index])` leest dan het volgende citaat.

Hier zit echter een potentieel probleem: als we meerdere keren achter elkaar klikken, zal `index` blijven toenemen tot buiten het bereik van de array. Dat veroorzaakt een fout doordat de array-index buiten bereik valt. Als `index` bijvoorbeeld `5` wordt, terwijl de geldige indexen `0` tot en met `4` zijn, crasht het programma.

Om te voorkomen dat de index buiten bereik valt, moeten we een voorwaarde toevoegen zodat `index` niet groter wordt dan het bereik van de array. Dat kan met een `if-else`-instructie die controleert of `index` kleiner is dan de lengte van de array.

## Voorwaardelijke besturing: `if-else`

De `if-else`-instructie is een van de meest gebruikte voorwaardelijke constructies in Swift. Ze wordt gebruikt om te bepalen of een voorwaarde waar is en voert op basis daarvan verschillende codeblokken uit.

Basisstructuur:

```swift
if condition {
    // Code die wordt uitgevoerd wanneer condition true is
} else {
    // Code die wordt uitgevoerd wanneer condition false is
}
```

In een `if`-instructie is `condition` een booleaanse waarde (`Bool`) die `true` of `false` kan zijn. Als de voorwaarde `true` is, wordt de code in het `if`-gedeelte uitgevoerd; anders draait de code in het `else`-gedeelte.

Bijvoorbeeld:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

In dit voorbeeld is `age` gelijk aan `25`. De `if`-instructie controleert of `age > 18` waar is. Omdat dat zo is, wordt `"Big Boy"` uitgevoerd.

Als je geen code in het `else`-gedeelte nodig hebt, kun je dat weglaten:

```swift
if condition {
    // Code die wordt uitgevoerd wanneer condition true is
}
```

### De index binnen bereik houden met voorwaarden

Om te voorkomen dat de array-index buiten bereik valt, kunnen we een `if`-instructie gebruiken om te garanderen dat `index` niet buiten het bereik van de array komt:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logica: de waarde van `sayings.count` is `5`, want er zijn 5 citaten. Daarom is `sayings.count - 1` gelijk aan `4`, en dat is ook de laatste geldige index van de array.

Wanneer `index` kleiner is dan `4`, is het veilig om met `1` te verhogen. Zodra `index` `4` bereikt, is de voorwaarde niet meer waar en gebeurt er niets meer bij een klik op de knop.

Nu heeft de code al de functie om tussen citaten te wisselen:

```swift
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

### Citaten laten rondgaan

Als we willen dat na het laatste citaat bij een volgende klik opnieuw het eerste citaat wordt getoond, kunnen we dat met het `else`-gedeelte doen:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Wanneer op de knop wordt geklikt en `index` bij het laatste element van de array is aangekomen, wordt `index` teruggezet naar `0` en begint de citatenreeks opnieuw.

## De citatenweergave verbeteren

De logica van de carrousel werkt nu, maar we kunnen de interface nog verder verbeteren zodat ze mooier oogt.

Volledige code:

```swift
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

In dit voorbeeld krijgt de `Text`-view een witte halftransparante achtergrond en afgeronde hoeken. De knop gebruikt de stijl `.borderedProminent`, en `VStack` heeft een achtergrondafbeelding.

Aanvullende kennis: wanneer je de modifier `background()` gebruikt om een afbeeldingsachtergrond toe te passen, probeert die standaard het beschikbare layoutgebied van de huidige view zo veel mogelijk te vullen. In veel gevallen strekt de achtergrond zich vanzelf uit tot in de veilige zone (`Safe Area`).

Nu hebben we de view voor de citatencarrousel gebouwd.

![SwiftUI View](../../RESOURCE/011_word.png)

## Samenvatting

In deze les hebben we geleerd hoe je meerdere citaten opslaat met een array, en hoe je met `if` en `if-else` een citatencarrousel maakt.

We hebben ook de basisbewerkingen van arrays bekeken, zoals elementen toevoegen, verwijderen en wijzigen, en geleerd hoe je voorkomt dat een array-index buiten bereik valt.

Deze les liet niet alleen zien hoe de citatencarrousel werkt, maar combineerde ook het basisgebruik van arrays en voorwaardelijke instructies, zodat we beter leren omgaan met data en de stroom van het programma kunnen besturen.

## Uitbreidingskennis - meervoudige voorwaarden: `if-else if-else`

In echte ontwikkeling moeten we vaak meerdere voorwaarden afhandelen. Bijvoorbeeld: in een spel moet gebeurtenis A worden geactiveerd wanneer de score gelijk is aan `1`, gebeurtenis B bij `2`, gebeurtenis C bij `3`, enzovoort.

Bij scenario's met meer dan twee vertakkingen gebruiken we `if-else if-else` voor meervoudige voorwaardelijke controle.

Basissyntaxis:

```swift
if conditionA {
    // Code die wordt uitgevoerd wanneer conditionA true is
} else if conditionB {
    // Code die wordt uitgevoerd wanneer conditionB true is
} else if conditionC {
    // Code die wordt uitgevoerd wanneer conditionC true is
} else {
    // Code die wordt uitgevoerd wanneer geen enkele voorwaarde waar is
}
```

In dit geval controleert het programma de voorwaarden in volgorde en voert het het eerste overeenkomende blok uit. Als geen enkele voorwaarde waar is, wordt de code na `else` uitgevoerd.

Ook in de citatencarrousel kunnen we `if-else if-else` gebruiken voor meerdere controles:

```swift
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

Wanneer `index` `0`, `1`, `2` of `3` is, voert een klik op de knop `index += 1` uit. Wanneer `index` `4` is, dus het laatste element, wordt `index` teruggezet naar `0`, zodat de carrousel blijft doorlopen.

De `else`-tak is een vangnet om ongeldige waarden op te vangen, bijvoorbeeld wanneer `index` per ongeluk verkeerd is aangepast.

Belangrijk om te weten: `==` betekent hier "is gelijk aan". Als de `if`-instructie controleert of `index` gelijk is aan een bepaalde waarde, geeft dat `true` terug en wordt het bijbehorende codeblok uitgevoerd. Als het niet gelijk is, gaat het programma verder naar de volgende `if`-controle.

Dit soort meervoudige voorwaarden is nuttig wanneer je in verschillende omstandigheden verschillende code wilt uitvoeren.
