# Räknare

I de två föregående lektionerna lärde vi oss om variabler, konstanter, knappar och metoder.

I den här lektionen ska vi kombinera dessa kunskaper och skapa en enkel räknarapp.

I det här exemplet kommer vi att lära oss hur man sparar och ändrar variabler, samt hur man använder @State för att hantera variabler.

## Skapa en räknare

En räknare används vanligtvis för att registrera ett antal som hela tiden ökar. Till exempel antal hopprep, antal varv vid löpning och andra liknande situationer.

Nu ska vi skapa en enkel räknare: visa ett tal och en knapp, och låta talet öka när man trycker på knappen.

![Num](../../RESOURCE/009_num.png)

### Visa talet

Först använder vi Text för att visa ett tal.

```swift
Text("0")
````

Men om talet behöver kunna ändras kan vi inte skriva in `"0"` direkt, utan bör använda en variabel för att spara talet.

```swift
var num = 0
```

Sedan visar vi variabeln i Text:

```swift
Text("\(num)")
```

Här används stränginterpolation \() för att omvandla talet till en sträng och visa det.

### Knapp för att öka talet

Därefter lägger vi till en knapp.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

När knappen trycks vill vi att talet ska öka.

Därför kan vi ändra variabeln inne i knappen:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Den här koden betyder: när man trycker på knappen beräknas `num + 1`, och resultatet tilldelas sedan till `num`.

### Ett mer kortfattat sätt att skriva

Swift erbjuder ett mer kortfattat sätt att skriva detta:

```swift
num += 1
```

Det motsvarar:

```swift
num = num + 1
```

Det här sättet att skriva kallas för en sammansatt tilldelningsoperator.

Vanliga sammansatta tilldelningsoperatorer i Swift är:

```
+=   additionstilldelning
-=   subtraktionstilldelning
*=   multiplikationstilldelning
/=   divisionstilldelning
%=   resttilldelning
```

Till exempel:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Fullständig kod

Nu kan vi skriva en enkel räknare:

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

Men just nu kan koden inte köras korrekt.

### Ett fel uppstår

Xcode visar då:

```
Cannot assign to property: 'self' is immutable
```

Det betyder att egenskapen inte kan ändras eftersom vyn är oföränderlig.

Varför blir det så?

## Hur SwiftUI fungerar

I SwiftUI gäller detta: **gränssnittet drivs av data**, vilket betyder att när data ändras uppdateras gränssnittet automatiskt.

Men det är viktigt att förstå att SwiftUI bara övervakar förändringar och uppdaterar vyn när ett tillstånd ändras, till exempel @State eller @Binding.

Om man använder en vanlig variabel läser SwiftUI bara dess värde en gång när vyn skapas. Även om variabeln senare ändras kommer gränssnittet inte att uppdateras.

Till exempel:

```swift
var num = 0   // 0
num = 1   // 0
```

I exemplet ovan är `num` en vanlig variabel. Även om dess värde ändras kommer SwiftUI inte att uppdatera vyn, och gränssnittet visar fortfarande det ursprungliga värdet 0.

![Num](../../RESOURCE/009_state.png)

Därför är det bara när data markeras som tillstånd, till exempel med egenskapsomslag som @State eller @Binding, som SwiftUI automatiskt kan övervaka förändringar och uppdatera vyn.

## Egenskapsomslaget @State

I SwiftUI måste man använda @State om man vill ändra en variabel och samtidigt uppdatera vyn.

```swift
@State var num = 0
```

@State gör att SwiftUI övervakar denna variabel.

När variabeln ändras räknar SwiftUI om vyn och uppdaterar gränssnittet.

Fullständig kod:

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

Nu, när knappen trycks:

```swift
num += 1
```

kommer SwiftUI att upptäcka att `num` har ändrats och automatiskt uppdatera vyn.

![Num](../../RESOURCE/009_state1.png)

## Regler för att använda @State

I praktisk utveckling följer @State vanligtvis två regler.

### 1. @State används vanligtvis tillsammans med private

En @State-variabel används oftast bara i den aktuella typen, till exempel i den aktuella View-strukturen, och skrivs därför ofta så här:

```swift
@State private var num = 0
```

Detta förhindrar att andra vyer direkt kan komma åt eller ändra variabeln.

Vi har ännu inte gått igenom `private`, så du kan tills vidare förstå det så här:

**Innehåll som markeras med `private` kan bara användas i den aktuella vyn och inte av yttre vyer.**

### 2. @State används bara för tillstånd i den aktuella vyn

@State lämpar sig för data som den aktuella View själv hanterar.

Till exempel innehållet i ett inmatningsfält eller statusen för en växel:

```swift
@State private var isOn = false
@State private var text = ""
```

Om data behöver delas mellan flera vyer måste man använda andra typer av tillstånd, till exempel @Binding eller @Observable.

Dessa delar kommer vi att gå igenom i senare lektioner.

### Knapp för att minska

En räknare kan inte bara öka, utan också minska.

Vi kan lägga till en knapp med `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Sedan använder vi HStack för att placera knapparna horisontellt:

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

Effekt:

![Num](../../RESOURCE/009_num1.png)

När man trycker på `+` ökar talet med 1, och när man trycker på `-` minskar talet med 1.

### Återställningsknapp

Vi kan också lägga till en återställningsknapp som sätter talet till 0.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

När man trycker på återställningsknappen tilldelas `num` värdet 0.

Effekt:

![Num](../../RESOURCE/009_num2.png)

När man trycker på knappen `0` blir talet 0.

### Anpassad knapp

Just nu kan våra knappar bara visa text:

```swift
Button("+") {

}
```

En knapp som skrivs på detta sätt kan bara visa textinnehåll, till exempel `+` eller `-`.

I verklig utveckling vill vi ofta att knappar ska ha ett rikare utseende, till exempel med ikoner eller andra vyer.

SwiftUI gör det möjligt att anpassa knappens utseende. Då kan man använda en annan skrivform för Button:

```swift
Button(action: {

}, label: {

})
```

I denna skrivform anger `action` vilken kod som ska köras när knappen trycks, och `label` anger vilken vy som ska visas på knappen.

Till exempel kan vi låta knappen visa en SF Symbols-ikon:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

På så sätt visar knappen inte längre text, utan en ikon.

### Förbättra räknarens gränssnitt

För att göra räknarens gränssnitt tydligare kan vi justera hur talet visas. Till exempel kan vi göra talet större:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Därefter kan vi också ändra knapparnas innehåll till ikoner och göra ikonerna lite större:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

På samma sätt kan vi ändra minskningsknappen och återställningsknappen till ikoner:

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

Nu visar knapparna SF Symbols-ikoner, och gränssnittet blir mer intuitivt.

![Num](../../RESOURCE/009_num3.png)

## Sammanfattning

I den här lektionen skapade vi en enkel räknare och repeterade samtidigt användningen av variabler, Text och Button. Vi använde en variabel för att spara talet och lät knappar styra om talet skulle öka eller minska. Samtidigt lärde vi oss sammansatta tilldelningsoperatorer, till exempel `num += 1` och `num -= 1`.

Under arbetet fick vi också förståelse för hur SwiftUI fungerar: gränssnittet drivs av data. När data ändras uppdateras gränssnittet. Därför måste vi använda @State för att spara tillstånd som kan förändras. När en @State-variabel ändras uppdaterar SwiftUI automatiskt vyn.

Till sist gjorde vi några enkla förbättringar av gränssnittet genom att justera Text-stilen och använda `Button(action:label:)` för att anpassa knappens innehåll, så att knapparna kunde visa ikoner och räknaren blev tydligare och snyggare.

Nu har vi börjat komma i kontakt med de mest grundläggande användningssätten för SwiftUI-vyer. I SwiftUI byggs större delen av gränssnittet upp med hjälp av variabler. När en variabel ändras uppdaterar SwiftUI automatiskt vyn. Därför behöver vi i utveckling av SwiftUI-appar ofta först tänka igenom vilka data som behöver sparas, och sedan bygga gränssnitt och interaktionslogik utifrån dessa data.

## Fullständig kod

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