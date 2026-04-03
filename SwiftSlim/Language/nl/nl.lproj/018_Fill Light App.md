# Fill Light-app

In deze les gaan we een heel interessante fill light-app maken. Wanneer de nacht valt, kunnen we het scherm van de telefoon verschillende kleuren laten tonen en het gebruiken als een eenvoudige fill light.

Deze fill light-app kan kleuren wisselen door op het scherm te tikken, en hij kan ook de helderheid aanpassen met een schuifregelaar.

In dit voorbeeld leren we hoe we `brightness` kunnen gebruiken om de helderheid van een weergave aan te passen, `onTapGesture` om een tikgebaar aan een weergave toe te voegen, en de `Slider`-besturing.

Resultaat:

![Color](../../Resource/018_color.png)

## Een kleur weergeven

Laten we eerst de weergave één kleur laten tonen.

In SwiftUI stelt `Color` niet alleen een kleur voor, maar kan het ook als een weergave worden getoond:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Hier stelt `Color.red` een rode weergave voor. `.ignoresSafeArea()` zorgt ervoor dat de kleurweergave het hele scherm vult, zodat het meer op een echt fill light-effect lijkt.

Resultaat:

![Color](../../Resource/018_color1.png)

### Kleurenarray en index

Op dit moment wordt er maar één kleur getoond. Maar een fill light heeft meestal niet maar één kleur. Het kan ook blauw, geel, paars, wit en andere kleuren tonen.

We willen tussen verschillende kleuren schakelen wanneer op het scherm wordt getikt. We kunnen deze kleuren in een array plaatsen om ze samen te beheren:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Een array is geschikt voor het opslaan van "een groep gegevens van hetzelfde type". Hier is elk element in de array een `Color`.

Als we een bepaalde kleur willen tonen, kunnen we een index gebruiken:

```swift
colors[0]
```

Dit betekent dat we de kleur op index `0` in de array lezen, dus de eerste kleur.

Nu kan de code zo worden geschreven:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Op deze manier toont het scherm de eerste kleur in de array, dus rood.

### De index gebruiken om de kleur te regelen

Als we tussen verschillende kleuren willen schakelen, hebben we een variabele nodig om de index te beheren in plaats van de index vast in te typen.

We kunnen `@State` gebruiken om een variabele te declareren die de index opslaat:

```swift
@State private var index = 0
```

Hier staat `index` voor de index van de huidige kleur.

Wanneer `index` verandert, berekent SwiftUI de interface opnieuw en werkt het de weergegeven inhoud bij.

Daarna veranderen we de oorspronkelijke `colors[0]` in:

```swift
colors[index]
```

Op deze manier wordt de kleur die in de weergave wordt getoond bepaald door `index`.

Nu wordt de code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Wanneer `index` verandert, zal `colors[index]` ook een andere kleur tonen.

Bijvoorbeeld:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Het is belangrijk om op te merken dat `index` niet groter mag worden dan de hoogste index van de array, anders ontstaat er een fout door een index buiten bereik.

## Tikgebaar

Nu kunnen we verschillende kleuren tonen op basis van `index`, maar we kunnen nog niet tikken om te wisselen.

In de vorige les "Citaatcarrousel" gebruikten we `Button` om het wisselen van citaten te regelen.

Maar deze keer willen we "op het hele kleurgebied tikken" om van kleur te wisselen, dus `onTapGesture` is hier geschikter.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Wanneer we op de kleurweergave tikken, wordt deze code uitgevoerd:

```swift
index += 1
```

Dit betekent dat `index` met `1` wordt verhoogd. Nadat de index is verhoogd, zal `colors[index]` de volgende kleur in de array tonen.

### `onTapGesture`

`onTapGesture` is een gesture modifier die een tikactie toevoegt aan een weergave.

Basisgebruik:

```swift
.onTapGesture {
    // code
}
```

Bijvoorbeeld:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Wanneer op deze rode weergave wordt getikt, wordt de code tussen de accolades uitgevoerd en verschijnt dit in de console:

```swift
Click color
```

Met `onTapGesture` kunnen we bepalen wat er moet gebeuren nadat op een weergave is getikt.

### Verschil met `Button`

Eerder hebben we de `Button`-weergave geleerd. Zowel `Button` als `onTapGesture` kunnen tikacties verwerken, maar hun gebruikssituaties zijn niet precies hetzelfde.

`onTapGesture` is geschikter om "een tikfunctie toe te voegen aan een bestaande weergave", zoals `Color`, `Image`, `Text` of een andere gewone weergave.

`Button` is geschikter wanneer we een duidelijke knop willen voorstellen, zoals "Bevestigen", "Verzenden" of "Verwijderen".

In deze fill light-app willen we dat de kleurwisselfunctie eenvoudiger is. Door op het hele kleurgebied te tikken om van kleur te wisselen, is `onTapGesture` hier een goede keuze.

## Het indexprobleem

Nu kunnen we op het scherm tikken om tussen verschillende kleuren te wisselen.

Maar hier is een belangrijk probleem: **de index kan buiten het bereik van de array komen**.

Bijvoorbeeld:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Als we het scherm blijven aantikken, zal `index` uiteindelijk `4` worden, en dan ontstaat de fout "index out of range".

Dit komt doordat de `colors`-array `4` elementen heeft, maar indexering begint bij `0`, dus het geldige indexbereik is `0 - 3`, niet `4`.

Als we `colors[4]` openen, ontstaat de fout "index out of range".

In de huidige code verhoogt elke tik `index` automatisch met `1`. Als we dat niet afhandelen, zal het uiteindelijk buiten het geldige bereik komen.

Daarom moeten we de index controleren wanneer op het scherm wordt getikt: als het al de laatste kleur is, gaan we terug naar de eerste kleur; anders blijven we `1` toevoegen.

Dat kunnen we doen met een `if`-statement:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

In deze code betekent `colors.count` het aantal elementen in de array.

In de huidige array zitten 4 kleuren, dus:

```swift
colors.count // 4
```

Maar de hoogste index is niet `4`, maar `3`, omdat indexering begint bij `0`.

Daarom moet de laatste index zo worden geschreven:

```swift
colors.count - 1
```

Dat is:

```swift
4 - 1 = 3
```

Deze logica betekent: als de huidige index al overeenkomt met de laatste kleur, zet de index dan terug op `0`; anders verhoog je hem met `1`.

Op deze manier kunnen de kleuren in een lus wisselen.

### De indexlogica optimaliseren

Als we de code korter willen maken, kunnen we ook de ternaire operator gebruiken:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Deze code betekent: als `index == colors.count - 1` waar is, geef `0` terug. Anders geef je `index + 1` terug.

Tot slot wijzen we het resultaat weer toe aan `index`.

Nu kunnen we het effect van het wisselen van kleuren bereiken.

Volledige code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Nu kunnen we op het scherm tikken en tussen verschillende kleuren wisselen. Een eenvoudige fill light-app is klaar.

## De naam van de kleur weergeven

We kunnen nog een groep tekst toevoegen die overeenkomt met de kleuren, zodat wanneer de kleur verandert, ook de naam van de huidige kleur op het scherm wordt weergegeven.

Bijvoorbeeld:

- Rood toont `Red`
- Blauw toont `Blue`
- Geel toont `Yellow`
- Paars toont `Purple`

Ook hier kunnen we een array gebruiken om de kleurnamen op te slaan:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

De volgorde van de tekst in deze array moet exact overeenkomen met de volgorde van de kleuren in de kleurenarray.

Daarna kunnen we `Text` gebruiken om de naam van de kleur op de huidige index te tonen:

```swift
Text(colorsName[index])
```

`Text` toont de huidige kleurnaam op basis van `index`.

Gebruik modifiers om het uiterlijk van `Text` te verbeteren:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Hierdoor wordt `Text` wit weergegeven, met titelgrootte en vet lettertype.

Nu hebben we een schermvullende `Color`-weergave. Als we willen dat `Text` boven op de `Color`-weergave verschijnt, moeten we de lay-outcontainer `ZStack` gebruiken om ze over elkaar heen te leggen.

```swift
ZStack {
    Color
    Text
}
```

Dan wordt de code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Op deze manier is de achtergrond de kleurweergave en ligt daarboven een tekstweergave.

Resultaat:

![Color](../../Resource/018_color2.png)

Belangrijk om op te merken is dat in een `ZStack` weergaven die later worden geschreven meestal vooraan verschijnen. Als `Text` vóór `Color` wordt geschreven, kan de later geschreven `Color`-weergave `Text` bedekken.

## De helderheid regelen

Nu kunnen we wisselen tussen verschillende kleuren, maar een fill light heeft nog een andere belangrijke functie: **het aanpassen van de helderheid**.

In SwiftUI kunnen we de modifier `brightness` gebruiken om de helderheid van een weergave aan te passen.

Bijvoorbeeld:

```swift
.brightness(1)
```

We kunnen schrijven:

```swift
colors[index]
    .brightness(0.5)
```

Hierdoor wordt de huidige kleur helderder en komt deze dichter bij het effect van een fill light.

Het helderheidsbereik is `0 - 1`. `0` betekent de oorspronkelijke kleur behouden, en hoe dichter de waarde bij `1` ligt, hoe helderder de kleur wordt. `1` betekent het helderste witte resultaat.

Hoewel we `brightness` in de code kunnen regelen, kan de gebruiker het nog niet direct zelf aanpassen.

Daarom moeten we een versleepbare besturing toevoegen: `Slider`.

## `Slider`-weergave

In SwiftUI is `Slider` een besturing die wordt gebruikt om een waarde binnen een bereik te kiezen. Apple beschrijft het als "een besturing om een waarde te kiezen uit een begrensd lineair bereik".

Basisgebruik:

```swift
Slider(value: $value, in: 0...1)
```

Uitleg van de parameters:

1. `value: $value`: `Slider` moet gekoppeld zijn aan een variabele.

    Wanneer de schuifregelaar wordt verplaatst, verandert de waarde van de variabele tegelijk mee. Omgekeerd wordt de schuifregelaar ook bijgewerkt als de variabele verandert.

    Dit lijkt erg op `TextField`, dat we eerder hebben geleerd. Beide "koppelen een besturing aan een variabele".

    Een gekoppelde variabele moet het symbool `$` ervoor hebben om de binding aan te geven.

2. `in: 0...1`: deze parameter geeft het waardebereik van de schuifregelaar aan.

    Hier betekent `0...1` dat de minimumwaarde `0` is en de maximumwaarde `1`.

    Wanneer de schuifregelaar helemaal naar links wordt verplaatst, ligt de gekoppelde variabele dicht bij `0`; wanneer hij helemaal naar rechts wordt verplaatst, ligt hij dicht bij `1`.

Bijvoorbeeld:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` is gekoppeld aan de variabele `value`. Wanneer de schuifregelaar wordt verplaatst, verandert de waarde van `value` op hetzelfde moment.

Uiterlijk:

![Slider](../../Resource/018_slider.png)

Wanneer de `Slider` naar links wordt verplaatst, wordt de gekoppelde `value` `0`. Wanneer deze naar rechts wordt verplaatst, wordt die `1`.

### Waardebereik

Het waardebereik van `Slider` is niet vast. Het kan ook zo worden geschreven:

```swift
0...100
```

of als een ander bereik.

Maar in deze fill light-app moeten we de helderheid regelen, dus `0...1` is de meest geschikte keuze.

## `Slider` gebruiken om de helderheid te regelen

Nu moeten we `Slider` verbinden met `brightness`.

Maak eerst een variabele om de helderheidswaarde op te slaan:

```swift
@State private var slider = 0.0
```

Hier is `0.0` een waarde van het type `Double`.

Omdat `Slider` meestal gekoppeld wordt aan een numeriek type, en we hier willen dat deze continu verandert, is `Double` geschikter. Bovendien kan `brightness` alleen een `Double`-waarde accepteren.

Geef daarna deze waarde door aan `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Wanneer `slider == 0`, blijft de kleur in de standaardtoestand. Hoe dichter `slider` bij `1` ligt, hoe helderder de kleur eruitziet.

### De `Slider`-besturing toevoegen

Voeg daarna een `Slider`-besturing toe om deze variabele te veranderen:

```swift
Slider(value: $slider, in: 0...1)
```

Wanneer de schuifregelaar verandert, verandert ook de waarde van `slider`, en `brightness(slider)` werkt de helderheid tegelijkertijd bij.

Dit is een heel typisch voorbeeld van hoe "variabelen de weergave aansturen" in SwiftUI.

### Het uiterlijk van `Slider` aanpassen

Standaard gebruikt `Slider` de beschikbare breedte.

We kunnen het een vaste breedte geven:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Voeg daarna nog een paar modifiers toe zodat het beter zichtbaar wordt:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Dit geeft de schuifregelaar een witte achtergrond en afgeronde hoeken, waardoor hij duidelijker zichtbaar wordt boven de `Color`-weergave.

Plaats hem tot slot onderaan het scherm.

Omdat we al `ZStack` gebruiken, kunnen we daarin een `VStack` plaatsen en `Spacer()` gebruiken om de `Slider` naar beneden te duwen.

## Volledige code

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Resultaat:

![Color](../../Resource/018_color.png)

## Samenvatting

Door de kennis die we eerder hebben geleerd te combineren met basisconcepten zoals kleuren en arrays, hebben we een heel interessante fill light-app gebouwd.

Via deze fill light-app hebben we geleerd hoe we `brightness` kunnen gebruiken om helderheid aan te passen, `onTapGesture` kunnen gebruiken om tikacties aan weergaven toe te voegen, en de `Slider`-besturing kunnen gebruiken.

We hebben `onTapGesture` toegevoegd aan de `Color`-weergave om kleuren te wisselen. We gebruikten ook de `Slider`-besturing om een variabele te veranderen die `brightness` beheert, wat nog een voorbeeld is van hoe "variabelen de weergave aansturen".

We hebben ook de ternaire operator herhaald, `ZStack` gebruikt om weergaven op elkaar te stapelen, en arrays gebruikt om een groep gegevens van hetzelfde type te beheren. Dit helpt ons om arrays en indexen beter te begrijpen, inclusief het praktische probleem van het vermijden van fouten met indexen buiten bereik.

Hoewel dit voorbeeld niet ingewikkeld is, verbindt het veel van de basisideeën die we eerder hebben geleerd. Wanneer ze samenkomen in een klein echt project, wordt het gemakkelijker om te begrijpen waarvoor elk concept wordt gebruikt.

### Praktisch gebruiksscenario

Stel je voor dat je een oude iPhone op tafel zet en de fill light-app die je zelf hebt gemaakt gebruikt om de kleur van het licht te regelen. Dat zou een heel prettige ervaring zijn.

Er zijn veel "fill light"-apps in de App Store, en ook die zien er niet erg ingewikkeld uit.

![AppStore](../../Resource/018_appStore.PNG)

We kunnen beginnen met het ontwikkelen van eenvoudige apps en proberen ze in de App Store te publiceren. Dit vergroot niet alleen onze interesse in ontwikkeling, maar legt ook onze groei vast.

### Oefening na de les

Je kunt blijven nadenken over manieren om deze fill light-app verder uit te breiden, bijvoorbeeld:

- Meer kleuren toevoegen
- De huidige helderheidswaarde weergeven
- Het ontwerp van het onderste slidergebied verbeteren

Wanneer je deze kennis echt begint te gebruiken, zul je ontdekken dat elk concept dat we leren in feite een hulpmiddel is om apps te bouwen.

Hoe meer hulpmiddelen we beheersen, hoe meer functies we kunnen maken.
