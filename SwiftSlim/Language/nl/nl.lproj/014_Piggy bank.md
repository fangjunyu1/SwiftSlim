# Spaarpot

In deze les bouwen we een eenvoudig "spaarpot"-project. De functionaliteit is simpel, maar bevat wel volledige interactieve logica, waardoor het heel geschikt is voor beginners.

Met dit project leren we `TextField` (invoerveld) en `border`, en maken we kennis met databinding (`$`).

Het uiteindelijke doel is een "spaarpot"-project te maken waarin je een bedrag kunt invoeren, op een knop kunt klikken om het op te slaan en het totaalbedrag kunt laten oplopen.

Het resultaat:

![Piggy Bank](../../RESOURCE/014_view.png)

## Het totaalbedrag weergeven

Eerst moeten we in de view het totaalbedrag van de "spaarpot" tonen.

Declareer in `ContentView` een variabele om het totaalbedrag van de "spaarpot" op te slaan.

```swift
@State private var amount = 0
```

Gebruik daarna `Text` om dit bedrag weer te geven:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Hier gebruiken we `.font` en `.fontWeight` om de grootte en dikte van het lettertype in te stellen.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Wanneer `amount` verandert, wordt het totaalbedrag in `Text` automatisch vernieuwd.

## Een bedrag invoeren

Naast het tonen van het totaalbedrag moet de "spaarpot" de gebruiker ook een bedrag laten invoeren. Daarvoor gebruiken we in SwiftUI de viewcomponent `TextField`.

### `TextField`

`TextField` is een viewcomponent in SwiftUI voor het invoeren van tekst, meestal bedoeld voor invoer op één regel.

`TextField` biedt vooral twee soorten binding:

**1. Binding aan een stringtype (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Geschikt voor tekstinvoer zoals namen of titels.

**2. Binding aan een numeriek type (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Geschikt voor cijfers zoals leeftijd, salaris of bedragen.

`format: .number` betekent dat dit invoerveld de inhoud als een getal zal parseren en weergeven.

#### Tijdelijke tekst in het veld

De eerste parameter van `TextField` is de placeholder, bedoeld om de gebruiker te laten zien wat er moet worden ingevoerd:

```swift
TextField("input your name", text: $text)
```

Wanneer het invoerveld leeg is, wordt er grijze hinttekst getoond.

![textfield](../../RESOURCE/014_textfield.png)

#### Databinding

`TextField` slaat ingevoerde inhoud niet zelf blijvend op en heeft een gebonden variabele nodig om de gegevens te beheren.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

De invoer van de gebruiker wordt rechtstreeks opgeslagen in de variabele `text`. `TextField` verzorgt alleen de invoerinterface.

`$` betekent binding (`Binding`):

```swift
$text
```

Dit is geen gewone variabele, maar een waarde van het type `Binding`.

De functie ervan is een verbinding te maken tussen de view en de data:

Wanneer de gebruiker in `TextField` typt, wordt `text` automatisch bijgewerkt; wanneer `text` verandert, wordt `TextField` op zijn beurt ook synchroon vernieuwd.

Bijvoorbeeld:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Wanneer je in `TextField` typt, wordt de `Text` daarboven in realtime mee bijgewerkt.

![textField](../../RESOURCE/014_textfield1.png)

### Binding aan een numeriek type

Wanneer je cijfers wilt invoeren, moet je een variabele van het juiste type binden:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Wanneer de gebruiker een bedrag invoert, zal `TextField` de ingevoerde inhoud parseren en de waarde van `number` automatisch bijwerken.

## Een invoerveld toevoegen

Nu we het basisgebruik van `TextField` kennen, passen we het toe op het "spaarpot"-project.

De "spaarpot" moet een "bedrag" invoeren, dus gebruiken we de manier met "binding aan een numeriek type (`Int/Double`)" en voegen we een extra variabele `number` toe om het ingevoerde bedrag op te slaan:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Nu toont `TextField` standaard de waarde van `number`, die in het begin `0` is.

Wanneer de inhoud wordt gewist, verschijnt de placeholder "Amount".

Dit laat opnieuw zien dat `TextField` de waarde van de gebonden variabele weergeeft, en niet zelf de inhoud bewaart.

### Probleem met de grootte van het invoerveld

In de huidige view zien we dat `TextField` geen rand heeft, alleen een `0` toont en links uitgelijnd lijkt.

Het effect is als volgt:

![textfield](../../RESOURCE/014_textfield2.png)

Dat komt doordat `TextField` standaard de volledige breedte van de bovenliggende view inneemt.

We kunnen dat controleren door een achtergrondkleur toe te voegen:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Het effect is als volgt:

![textfield](../../RESOURCE/014_textfield3.png)

Je kunt zien dat `TextField` in werkelijkheid de hele regelbreedte vult.

### Een vaste breedte instellen

Als we het invoerveld compacter willen maken, kunnen we met `frame` de breedte beperken:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Het effect is als volgt:

![textfield](../../RESOURCE/014_textfield4.png)

### Een rand en binnenmarge toevoegen

Omdat `TextField` standaard geen rand heeft, kunnen we zelf stijlen toevoegen:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Nu ziet dit invoerveld er meer uit als een "standaard invoerveld".

![textfield](../../RESOURCE/014_textfield5.png)

## Rand

In SwiftUI wordt `border` gebruikt om een rand rond een view te plaatsen.

Basisgebruik:

```swift
border(Color.black, width: 1)
```

Hierbij geeft `Color.black` de kleur van de rand aan en `width` de dikte.

In `TextField` gebruiken we:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Dit betekent dat we een zwarte rand van `1 pt` breed toevoegen aan het invoerveld.

Je kunt ook andere kleuren proberen, zoals `Color.blue`, `Color.green`, of de rand dikker maken met `width: 2`.

## Spaar-knop

Nu hebben we een variabele `amount` om het totaalbedrag te tonen, een `TextField` om een bedrag in te voeren, en een variabele `number` die met het invoerveld is verbonden.

De huidige code ziet er zo uit:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Een knop toevoegen

Daarna moeten we een knop toevoegen om de spaaractie uit te voeren.

```swift
Button("Save") {
    
}
```

### De spaarlogica realiseren

We willen dat wanneer de gebruiker een bedrag invoert en op de knop klikt, dat bedrag automatisch wordt opgeteld bij het totaalbedrag.

```swift
Button("Save") {
    amount += number
}
```

Hier gebruiken we de samengestelde toekenningsoperator om het door de gebruiker ingevoerde bedrag `number` op te tellen bij het totaalbedrag `amount`.

### Het ingevoerde bedrag resetten

Nu is er nog een probleem: telkens wanneer op de knop wordt geklikt, wordt het bedrag in het invoerveld niet gewist.

Als de gebruiker `10` invoert en op opslaan klikt, blijft in het invoerveld nog steeds `10` staan, wat de volgende invoer beïnvloedt.

Dat komt doordat `TextField` is gebonden aan `number`. Wanneer we op de knop klikken, passen we alleen `amount` aan; `number` verandert niet, dus het invoerveld toont nog steeds de oude waarde.

We moeten daarom een resetlogica toevoegen: nadat op de knop is geklikt, wordt eerst het bedrag bij het totaal opgeteld en daarna de ingevoerde waarde teruggezet:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Nu wordt het ingevoerde bedrag aan het totaal toegevoegd wanneer de gebruiker een bedrag invoert en op de knop klikt. Daarna wordt `number` teruggezet naar `0`, zodat de gebruiker opnieuw kan invoeren.

Daarmee hebben we alle basislogica van de "spaarpot" gerealiseerd.

## De view verbeteren

Nadat de functionaliteit klaar is, kunnen we de interface nog wat verbeteren door een achtergrondafbeelding en een knopstijl toe te voegen.

Een knopstijl toevoegen:

```swift
.buttonStyle(.borderedProminent)
```

Een achtergrondafbeelding toevoegen:

```swift
.background {
    Image("1")
}
```

Nu hebben we de volledige ontwikkeling van de "spaarpot" afgerond.

## Volledige code

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Het resultaat:

![Piggy Bank](../../RESOURCE/014_view.png)

Nu kunnen we proberen `100` of meer geld op te slaan om te controleren of de logica van de "spaarpot" problemen heeft.

Je kunt de "spaarpot" ook in de simulator of op een echt apparaat uitvoeren om de app die we hebben gemaakt te ervaren.

### Debug-uitvoer

Om te controleren of de logica correct is, kunnen we ook debugcode in de knop toevoegen om na te gaan of het ingevoerde bedrag juist wordt verwerkt:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Elke keer dat je geld opslaat en op de knop klikt, kun je de bijbehorende debug-uitvoer zien en zo controleren of er een probleem in de code zit.

```
---Saving---
amount:11
number:0
```
