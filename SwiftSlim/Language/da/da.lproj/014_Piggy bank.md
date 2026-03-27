# Sparegris

I denne lektion udvikler vi et enkelt "sparegris"-projekt. Funktionaliteten er simpel, men det indeholder en komplet interaktionslogik og er derfor meget velegnet til begyndere.

Gennem dette projekt lærer vi `TextField` (inputfelt), `border` og får en forståelse af databinding (`$`).

Det endelige mål er at implementere et "sparegris"-projekt, hvor man kan indtaste et beløb, trykke på en knap for at gemme det og gradvist akkumulere totalbeløbet.

Resultat:

![Piggy Bank](../../RESOURCE/014_view.png)

## Vis totalbeløbet

Først skal vi vise det samlede beløb i "sparegrisen" i visningen.

I `ContentView` erklærer vi en variabel til at gemme det samlede beløb i sparegrisen.

```swift
@State private var amount = 0
```

Derefter bruger vi `Text` til at vise dette beløb:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Her bruger vi `.font` og `.fontWeight` til at indstille skriftens størrelse og tykkelse.

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

Når `amount` ændrer sig, bliver totalbeløbet, som `Text` viser, også automatisk opdateret.

## Indtast beløb

Ud over at vise totalbeløbet skal "sparegrisen" også gøre det muligt for brugeren at "indtaste" et ind- eller udbetalingsbeløb. Til det skal vi bruge SwiftUI-kontrollen `TextField`.

### TextField

`TextField` er en SwiftUI-visning, der bruges til indtastning af indhold, normalt til input på én linje.

`TextField` tilbyder hovedsageligt to former for binding:

**1. Binding til strengtype (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Denne form er velegnet til tekstindhold som navne og titler.

**2. Binding til numerisk type (`Int`/`Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Denne form er velegnet til alder, løn, beløb og andre numeriske input.

`format: .number` betyder, at inputfeltet vil analysere og vise indholdet i nummerformat.

#### Tekst-placeholder

Det første parameter i `TextField` er en placeholder, som bruges til at give brugeren et hint om, hvad der skal indtastes:

```swift
TextField("input your name", text: $text)
```

Når inputfeltet er tomt, vises en grå hjælpetekst.

![textfield](../../RESOURCE/014_textfield.png)

#### Databinding

`TextField` er ikke ansvarlig for at gemme det indtastede indhold permanent. Data skal styres gennem en bundet variabel.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Det indhold, brugeren skriver, bliver gemt direkte i variablen `text`, og `TextField` tager sig kun af selve inputgrænsefladen.

`$` betyder binding (`Binding`):

```swift
$text
```

Dette er ikke en almindelig variabel, men en værdi af typen `Binding`.

Dens funktion er at oprette forbindelsen mellem visningen og data:

Når brugeren skriver noget i `TextField`, opdateres `text` automatisk. Når `text` ændrer sig, opdateres `TextField` også tilsvarende.

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

Når du skriver indhold i `TextField`, vil `Text` ovenover blive opdateret i realtid.

![textField](../../RESOURCE/014_textfield1.png)

### Binding til taltype

Når vi skal indtaste tal, skal vi binde til en variabel af den tilsvarende type:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Når brugeren indtaster et beløb, vil `TextField` analysere indholdet og automatisk opdatere værdien af `number`.

## Tilføj inputfeltet

Når vi har forstået den grundlæggende brug af `TextField`, anvender vi det nu på "sparegris"-projektet.

"Sparegrisen" skal kunne modtage et "beløb", så vi bruger metoden "binding til numerisk type (`Int`/`Double`)" og tilføjer en ny variabel `number` til at gemme det beløb, brugeren indtaster:

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

Nu viser `TextField` som standard værdien af `number` (som standard er `0`).

Når inputindholdet tømmes, vises placeholderen `"Amount"`.

Det viser igen, at `TextField` viser værdien af den bundne variabel og ikke selv gemmer indholdet.

### Problem med inputfeltets størrelse

I den aktuelle visning vil vi se, at `TextField` ikke har nogen kant, kun viser et `0`, og at indholdet ser venstrejusteret ud.

Effekten ser sådan ud:

![textfield](../../RESOURCE/014_textfield2.png)

Det skyldes, at `TextField` som standard fylder hele bredden af sin forældrevisning.

Vi kan kontrollere det ved at tilføje en baggrundsfarve:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Effekten ser sådan ud:

![textfield](../../RESOURCE/014_textfield3.png)

Her kan vi se, at `TextField` faktisk fylder hele linjens bredde.

### Sæt en fast bredde

Hvis vi ønsker, at inputfeltet skal være mere kompakt, kan vi bruge `frame` til at begrænse bredden:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Effekten ser sådan ud:

![textfield](../../RESOURCE/014_textfield4.png)

### Tilføj ramme og indre afstand

Da `TextField` ikke har en ramme som standard, kan vi manuelt tilføje stil:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Nu ligner inputfeltet meget mere et "standard inputfelt".

![textfield](../../RESOURCE/014_textfield5.png)

## Ramme

I SwiftUI bruges `border` til at tilføje en ramme omkring en visning.

Grundlæggende brug:

```swift
border(Color.black, width: 1)
```

Her betyder `Color.black` rammens farve, og `width` betyder rammens tykkelse.

I `TextField` bruger vi:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Det betyder, at inputfeltet får en sort ramme med tykkelsen `1 pt`.

Du kan også prøve andre farver som `Color.blue`, `Color.green`, eller gøre rammen tykkere med `width: 2`.

## Gem penge-knap

Nu har vi variablen `amount` til at vise totalbeløbet, et `TextField` til at indtaste beløb og variablen `number`, som er bundet til inputfeltet.

Den aktuelle kode ser sådan ud:

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

### Tilføj en knap

Nu skal vi tilføje en knap til at udløse handlingen, hvor der lægges penge i sparegrisen.

```swift
Button("Save") {
    
}
```

### Implementér logikken for at lægge penge i sparegrisen

Vi vil opnå, at når brugeren indtaster et beløb og trykker på knappen, bliver beløbet automatisk lagt til totalbeløbet.

```swift
Button("Save") {
    amount += number
}
```

Her bruger vi en sammensat tildelingsoperator til at lægge brugerens indtastede beløb `number` til totalbeløbet `amount`.

### Nulstil det indtastede beløb

Nu er der et problem: Hver gang der trykkes på knappen, bliver beløbet i inputfeltet ikke ryddet.

Hvis brugeren indtaster `10` og derefter trykker gem, står der stadig `10` i inputfeltet, og det vil påvirke næste indtastning.

Det skyldes, at `TextField` er bundet til `number`. Når vi trykker på knappen, ændrer vi kun `amount`, mens `number` ikke ændrer sig. Derfor bliver den gamle værdi stående i inputfeltet.

Vi skal tilføje en rydningslogik, så der efter klik først lægges penge til sparegrisen, og derefter nulstilles det indtastede beløb:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Nu vil det indtastede beløb blive lagt til totalbeløbet, når brugeren trykker på knappen. `number` nulstilles til `0`, så brugeren kan begynde en ny indtastning.

På den måde har vi implementeret hele logikken for at lægge penge i "sparegrisen".

## Optimer visningen

Når funktionen er færdig, kan vi lave en enkel visuel optimering ved at tilføje et baggrundsbillede og en knapstil.

Tilføj knapstil:

```swift
.buttonStyle(.borderedProminent)
```

Tilføj baggrundsbillede:

```swift
.background {
    Image("1")
}
```

Nu er hele "sparegris"-projektet færdigt.

## Fuld kode

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

Resultat:

![Piggy Bank](../../RESOURCE/014_view.png)

Nu kan vi prøve at lægge `100` eller flere penge i sparegrisen for at teste, om logikken fungerer korrekt.

Vi kan også køre "sparegrisen" i simulatoren eller på en fysisk enhed for at opleve den app, vi selv har udviklet.

### Debug-output

For at kontrollere om logikken er korrekt, kan vi også tilføje debuglogik i knappen for at kontrollere, om det indtastede beløb er korrekt:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Hver gang vi gemmer penge og trykker på knappen, kan vi se det tilsvarende debug-output og kontrollere, om kodelogikken er korrekt.

```
---Saving---
amount:11
number:0
```
