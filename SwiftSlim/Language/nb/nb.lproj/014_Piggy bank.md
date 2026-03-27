# Sparegris

I denne leksjonen skal vi utvikle et enkelt “sparegris”-prosjekt. Funksjonaliteten er enkel, men inneholder komplett interaksjonslogikk og passer svært godt for nybegynnere.

Gjennom dette prosjektet skal vi lære om `TextField`（inndatafelt）og `border`，samt forstå databinding（`$`）。

Det endelige målet er å lage et “sparegris”-prosjekt der man kan skrive inn et beløp, trykke på en knapp for å lagre det, og summere totalbeløpet.

Resultatet skal se slik ut:

![Piggy Bank](../../RESOURCE/014_view.png)

## Vis totalbeløp

Først må vi vise totalbeløpet i “sparegrisen” i visningen.

I `ContentView` deklarerer vi en variabel for å lagre totalbeløpet i “sparegrisen”。

```swift
@State private var amount = 0
```

Deretter bruker vi `Text` til å vise dette beløpet:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Her bruker vi `.font` og `.fontWeight` til å sette skriftstørrelse og tykkelse.

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

Når `amount` endres, vil totalbeløpet som vises i `Text` også oppdateres automatisk.

## Skriv inn beløp

I tillegg til å vise totalbeløpet må “sparegrisen” også la brukeren “skrive inn” beløpet som skal settes inn eller tas ut. Da trenger vi SwiftUI-kontrollen `TextField`。

### `TextField`

`TextField` er en visningskontroll i SwiftUI som brukes til å skrive inn innhold, vanligvis i én linje.

`TextField` tilbyr hovedsakelig to bindingstyper:

**1. Bind til strengtype（`String`）**

```swift
TextField("Placeholder", text: $text)
```

Passer for tekstinnhold som navn eller titler.

**2. Bind til talltype（`Int/Double`）**

```swift
TextField("Amount", value: $number, format: .number)
```

Passer for alder, lønn, beløp og annet numerisk innhold.

`format: .number` betyr at dette feltet tolker og viser innholdet i “tallformat”。

#### Plassholdertekst

Det første argumentet til `TextField` er plassholderen（Placeholder）, som brukes for å gi brukeren et hint om hva som skal skrives inn:

```swift
TextField("input your name", text: $text)
```

Når feltet er tomt, vises en grå hjelpetekst.

![textfield](../../RESOURCE/014_textfield.png)

#### Databinding

`TextField` lagrer ikke innholdet permanent selv. Dataene må administreres gjennom en bundet variabel.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Innholdet brukeren skriver inn lagres direkte i variabelen `text`，mens `TextField` bare står for selve innskrivingsgrensesnittet.

`$` betyr binding（Binding）：

```swift
$text
```

Dette er ikke en vanlig variabel, men en `Binding`-type。

Hensikten er å opprette en kobling mellom visningen og dataene:

Når brukeren skriver i `TextField`，oppdateres `text` automatisk；når `text` endres, oppdateres også `TextField` tilsvarende.

For eksempel:

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

Når brukeren skriver i `TextField`，vil `Text` øverst oppdateres i sanntid.

![textField](../../RESOURCE/014_textfield1.png)

### Bind til talltype

Når vi trenger å skrive inn tall, må vi binde til en variabel av riktig type:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Når brukeren skriver inn et beløp, vil `TextField` tolke innholdet og automatisk oppdatere verdien til `number`。

## Legg til inndatafelt

Etter å ha forstått grunnleggende bruk av `TextField`，skal vi bruke det i “sparegris”-prosjektet.

“Sparegrisen” trenger innskriving av “beløp”, så vi bruker måten “bind til talltype（`Int/Double`）”, og legger til en ny variabel `number` for å lagre beløpet brukeren skriver inn:

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

Nå viser `TextField` verdien av `number` som standard（standardverdien er `0`）。

Når innholdet slettes, vises plassholderen `"Amount"`。

Dette viser igjen at `TextField` viser verdien i den bundne variabelen, og ikke lagrer innholdet selv.

### Problem med størrelsen på feltet

I den nåværende visningen vil vi se at `TextField` ikke har noen kant, bare viser en `0`，og at innholdet ser venstrejustert ut.

Resultatet ser slik ut:

![textfield](../../RESOURCE/014_textfield2.png)

Dette er fordi `TextField` som standard opptar hele bredden til foreldervisningen.

Vi kan bekrefte dette ved å legge til en bakgrunnsfarge:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Resultatet blir:

![textfield](../../RESOURCE/014_textfield3.png)

Vi ser at `TextField` faktisk fyller hele linjens bredde.

### Sett fast bredde

Hvis vi vil at inndatafeltet skal være mer kompakt, kan vi bruke `frame` til å begrense bredden:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Resultatet blir:

![textfield](../../RESOURCE/014_textfield4.png)

### Legg til kant og indre marg

Siden `TextField` som standard ikke har noen kant, kan vi legge til stil manuelt:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Nå ser dette inndatafeltet mer ut som et “standard inndatafelt”.

![textfield](../../RESOURCE/014_textfield5.png)

## Kantlinje

I SwiftUI brukes `border` til å legge til en kant rundt en visning.

Grunnleggende bruk:

```swift
border(Color.black, width: 1)
```

Her betyr `Color.black` fargen på kanten, og `width` tykkelsen.

I `TextField` bruker vi:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Dette betyr at vi legger til en svart kant rundt inndatafeltet med tykkelsen `1 pt`。

Du kan også prøve andre farger, som `Color.blue`、`Color.green`，eller gjøre kanten tykkere med `width: 2`。

## Lagre-knapp

Nå har vi variabelen `amount` for å vise totalbeløpet, et `TextField` for å skrive inn beløpet, og variabelen `number` som er bundet til inndatafeltet.

Den nåværende koden er:

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

### Legg til knapp

Deretter må vi legge til en knapp som utløser sparehandlingen.

```swift
Button("Save") {
    
}
```

### Implementer logikken for sparing

Vi ønsker at når brukeren skriver inn et beløp og trykker på knappen, skal beløpet automatisk legges til totalbeløpet.

```swift
Button("Save") {
    amount += number
}
```

Her bruker vi en sammensatt tilordningsoperator for å legge det innskrevne beløpet `number` til totalbeløpet `amount`。

### Nullstill innskrevet beløp

Nå har vi et problem: hver gang knappen trykkes, blir ikke beløpet i feltet tømt.

Hvis brukeren skriver inn `10` og klikker lagre, vil feltet fortsatt vise `10`，og det vil påvirke neste innskriving.

Dette skyldes at `TextField` er bundet til `number`。Når vi klikker på knappen, endres bare `amount`，mens `number` ikke endres. Derfor vises fortsatt den gamle verdien i inndatafeltet.

Vi må legge til en ryddeoperasjon: når knappen trykkes, skal sparebeløpet først legges til totalbeløpet, og deretter skal det innskrevne beløpet nullstilles:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Nå, når brukeren skriver inn et beløp og klikker på knappen, legges beløpet til totalen. `number` nullstilles til `0`，slik at brukeren kan skrive inn et nytt beløp neste gang.

Dermed har vi fullført all sparelogikken til “sparegrisen”.

## Optimaliser visningen

Etter at funksjonaliteten er ferdig, kan vi gjøre grensesnittet litt penere ved å legge til bakgrunnsbilde og knappestil.

Legg til knappestil:

```swift
.buttonStyle(.borderedProminent)
```

Legg til bakgrunnsbilde:

```swift
.background {
    Image("1")
}
```

Nå har vi fullført hele utviklingen av “sparegrisen”.

## Fullstendig kode

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

Resultatet:

![Piggy Bank](../../RESOURCE/014_view.png)

Nå kan vi prøve å sette inn `100` eller mer for å kontrollere om logikken i “sparegrisen” har noen problemer.

Eller vi kan kjøre “sparegrisen” i simulator eller på fysisk enhet for å oppleve appen vi har laget.

### Feilsøkingsutskrift

For å kontrollere at logikken er riktig, kan vi også legge til feilsøkingslogikk i knappen for å sjekke at beløpet som skrives inn er korrekt:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Hver gang vi sparer og klikker på knappen, kan vi se den tilsvarende feilsøkingsutskriften og kontrollere om det finnes problemer i kodelogikken.

```
---Saving---
amount:11
number:0
```
