# Teller

In de vorige twee lessen hebben we geleerd over variabelen, constanten, knoppen en methoden.

In deze les gaan we deze kennis combineren om een eenvoudige teller-app te maken.

In dit voorbeeld leren we hoe je variabelen opslaat en verandert, en hoe je `@State` gebruikt om variabelen te beheren.

## Een teller maken

Een teller wordt meestal gebruikt om aantallen bij te houden die voortdurend moeten worden opgeteld. Bijvoorbeeld het aantal sprongen met touwtje springen of het aantal rondes bij het hardlopen.

Laten we nu een eenvoudige teller maken: een getal en een knop tonen, en het getal laten stijgen wanneer op de knop wordt geklikt.

![Num](../../RESOURCE/009_num.png)

### Een getal weergeven

Eerst gebruiken we `Text` om een getal weer te geven.

```swift
Text("0")
```

Maar als het getal moet kunnen veranderen, kunnen we `"0"` niet vast in de code schrijven. In plaats daarvan moeten we een variabele gebruiken om het getal op te slaan.

```swift
var num = 0
```

Toon vervolgens de variabele in `Text`：

```swift
Text("\(num)")
```

Hier gebruiken we stringinterpolatie `\()` om het getal om te zetten naar een string voor weergave.

### Een knop om het getal te verhogen

Daarna voegen we een knop toe.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Wanneer op de knop wordt geklikt, willen we dat het getal toeneemt.

Daarom kunnen we de variabele in de knop aanpassen:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Deze code betekent: wanneer op de knop wordt geklikt, wordt `num + 1` berekend en wordt het resultaat toegewezen aan `num`。

### Een compactere schrijfwijze

Swift biedt een kortere schrijfwijze:

```swift
num += 1
```

Dit is equivalent aan:

```swift
num = num + 1
```

Deze schrijfwijze heet een “samengestelde toewijzingsoperator”.

Veelgebruikte samengestelde toewijzingsoperatoren in Swift zijn:

```
+=   opteltoewijzing
-=   aftrektoewijzing
*=   vermenigvuldigingstoewijzing
/=   delingstoewijzing
%=   resttoewijzing
```

Bijvoorbeeld:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Volledige code

Nu kunnen we een eenvoudige teller schrijven:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Maar op dit moment werkt de code nog niet goed.

### Er verschijnt een fout

Xcode geeft de melding:

```
Cannot assign to property: 'self' is immutable
```

Dit betekent dat de eigenschap niet gewijzigd kan worden, omdat de view onveranderlijk is.

Waarom gebeurt dit?

## Hoe SwiftUI werkt

In SwiftUI is **de interface datagedreven**，wat betekent dat wanneer gegevens veranderen, de interface automatisch wordt vernieuwd.

Maar let op: alleen wanneer een toestand（zoals `@State` of `@Binding`）verandert, zal SwiftUI de verandering observeren en de view opnieuw opbouwen.

Als je een gewone variabele gebruikt, leest SwiftUI de waarde van die variabele alleen wanneer de view wordt aangemaakt. Zelfs als de variabele daarna verandert, wordt de interface niet bijgewerkt.

Bijvoorbeeld:

```swift
var num = 0   // 0
num = 1   // 0
```

In het bovenstaande voorbeeld is `num` een gewone variabele. Hoewel de waarde verandert, zal SwiftUI de view niet bijwerken en blijft de interface de oorspronkelijke `0` tonen.

![Num](../../RESOURCE/009_state.png)

Daarom zal SwiftUI alleen dan automatisch veranderingen observeren en de view updaten wanneer de gegevens als toestand zijn gemarkeerd（bijvoorbeeld met property wrappers zoals `@State` of `@Binding`）。

## De `@State`-property wrapper

In SwiftUI moet je `@State` gebruiken als je een variabele wilt wijzigen en tegelijk de view wilt bijwerken.

```swift
@State var num = 0
```

`@State` zorgt ervoor dat SwiftUI deze variabele observeert.

Wanneer de variabele verandert, zal SwiftUI de view opnieuw berekenen en bijwerken.

Volledige code:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Nu, wanneer op de knop wordt geklikt:

```swift
num += 1
```

zal SwiftUI detecteren dat `num` is veranderd en de view automatisch bijwerken.

![Num](../../RESOURCE/009_state1.png)

## Regels voor het gebruik van `@State`

In echte ontwikkeling volgt `@State` meestal twee regels.

### 1. `@State` gebruikt meestal `private`

`@State`-variabelen worden meestal alleen binnen het huidige type gebruikt（zoals binnen de huidige `View`-structuur）, en worden daarom meestal zo geschreven:

```swift
@State private var num = 0
```

Zo voorkom je dat andere views deze variabele direct benaderen of wijzigen.

We hebben `private` nog niet geleerd, maar je kunt het voorlopig eenvoudig zo begrijpen:

**Inhoud die door `private` wordt gemarkeerd, kan alleen in de huidige view worden gebruikt, en niet door views daarbuiten.**

### 2. `@State` wordt alleen gebruikt voor de toestand van de huidige view

`@State` is geschikt voor gegevens die door de huidige `View` zelf worden beheerd.

Bijvoorbeeld de inhoud van een invoerveld of de toestand van een schakelaar.

```swift
@State private var isOn = false
@State private var text = ""
```

Als gegevens tussen meerdere views gedeeld moeten worden, moet je andere toestandstypen gebruiken, zoals `@Binding` of `@Observable`。

Deze onderwerpen leren we in latere lessen.

### Een knop om te verlagen

Een teller moet niet alleen kunnen verhogen, maar ook kunnen verlagen.

We kunnen een `-`-knop toevoegen.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Daarna gebruiken we `HStack` om de knoppen horizontaal te rangschikken:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Effect:

![Num](../../RESOURCE/009_num1.png)

Wanneer op de `+`-knop wordt geklikt, stijgt het getal met `1`；wanneer op de `-`-knop wordt geklikt, daalt het getal met `1`。

### Een resetknop

We kunnen ook een resetknop toevoegen om het getal weer op `0` te zetten.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Wanneer op de resetknop wordt geklikt, krijgt `num` opnieuw de waarde `0`。

Effect:

![Num](../../RESOURCE/009_num2.png)

Wanneer op de `0`-knop wordt geklikt, wordt het getal `0`。

### Aangepaste knop

Op dit moment kunnen onze knoppen alleen tekst tonen:

```swift
Button("+") {

}
```

Knoppen die op deze manier zijn geschreven kunnen alleen tekstinhoud tonen, zoals `+` of `-`。

In echte ontwikkeling willen we vaak dat het uiterlijk van knoppen rijker is, bijvoorbeeld met iconen of andere views.

SwiftUI laat ons de inhoud van een knop aanpassen. Dan kunnen we de andere schrijfwijze van een knop gebruiken:

```swift
Button(action: {

}, label: {

})
```

In deze schrijfwijze staat `action` voor de code die wordt uitgevoerd wanneer op de knop wordt geklikt, en `label` voor de view die de knop weergeeft.

Bijvoorbeeld, we kunnen de knop een `SF Symbols`-icoon laten tonen:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Zo toont de knop niet langer tekst, maar een icoon.

### De tellerinterface verbeteren

Om de interface van de teller duidelijker te maken, kunnen we ook de stijl van de getalweergave aanpassen. Bijvoorbeeld door het getal groter te maken:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Vervolgens veranderen we de inhoud van de knoppen ook in iconen en vergroten we de iconen iets:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Op dezelfde manier kunnen we ook de knop om te verlagen en de resetknop omzetten naar icoonvorm:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Nu tonen de knoppen `SF Symbols`-iconen, en de interface wordt ook intuïtiever.

![Num](../../RESOURCE/009_num3.png)

## Samenvatting

In deze les hebben we via het maken van een eenvoudige teller gecombineerd geoefend met het gebruik van variabelen, `Text` en `Button`。We gebruikten variabelen om het getal op te slaan en knoppen om het getal te verhogen of te verlagen, terwijl we ook samengestelde toewijzingsoperatoren leerden zoals `num += 1` en `num -= 1`。

Tijdens het implementeren leerden we ook hoe SwiftUI werkt: de interface wordt aangedreven door gegevens. Alleen wanneer de gegevens veranderen, wordt de interface vernieuwd. Daarom moeten we `@State` gebruiken om veranderlijke toestand op te slaan, zodat SwiftUI de view automatisch kan bijwerken wanneer een `@State`-variabele verandert.

Ten slotte hebben we de interface eenvoudig geoptimaliseerd door de letterstijl van `Text` aan te passen en `Button(action:label:)` te gebruiken om de knopinhoud aan te passen, zodat de knoppen iconen kunnen tonen en de tellerinterface duidelijker en mooier wordt.

Nu hebben we kennisgemaakt met de basismanier waarop SwiftUI-views werken. In SwiftUI worden de meeste interfaces aangedreven door variabelen. Wanneer variabelen veranderen, werkt SwiftUI de view automatisch bij. Daarom moeten we bij het ontwikkelen van SwiftUI-apps meestal eerst nadenken over welke gegevens opgeslagen moeten worden, en daarna op basis van die gegevens de interface en interactielogica opbouwen.

## Volledige code

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
