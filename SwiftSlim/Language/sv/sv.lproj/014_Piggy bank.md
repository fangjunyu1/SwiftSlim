# Spargris

I den här lektionen ska vi utveckla ett enkelt projekt med en “spargris”. Funktionen är enkel men innehåller fullständig interaktionslogik, vilket gör den mycket lämplig för nybörjare.

Genom detta projekt kommer vi att lära oss `TextField` (inmatningsfält) och `border`-ramar, samt förstå databindning (`$`).

Det slutliga målet är att skapa en “spargris” där man kan skriva in ett belopp, trycka på en knapp för att spara det och låta totalsumman öka.

Resultatet ser ut så här:

![Piggy Bank](../../RESOURCE/014_view.png)

## Visa totalbeloppet

Först behöver vi visa spargrisens totala belopp i vyn.

I `ContentView` deklarerar vi en variabel för att spara spargrisens totala belopp.

```swift
@State private var amount = 0
```

Sedan använder vi `Text` för att visa detta belopp:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Här används `.font` och `.fontWeight` för att ställa in textens storlek och tjocklek.

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

När `amount` ändras uppdateras det visade totalbeloppet i `Text` automatiskt.

## Mata in belopp

Spargrisen ska inte bara visa totalbeloppet, utan också låta användaren “mata in” belopp som ska sparas. För detta använder vi SwiftUI-kontrollen `TextField`.

### TextField

`TextField` är en vykontroll i SwiftUI som används för att skriva in innehåll och används vanligtvis för enradsinmatning.

`TextField` erbjuder huvudsakligen två typer av bindning:

**1. Binda till strängtyp (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Detta passar för textinmatning som namn och rubriker.

**2. Binda till numerisk typ (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Detta passar för ålder, lön, belopp och annan numerisk inmatning.

`format: .number` betyder att detta inmatningsfält tolkar och visar innehållet i numeriskt format.

#### Platshållartext

Det första argumentet i `TextField` är en platshållare (`Placeholder`) som används för att visa användaren vad som ska matas in:

```swift
TextField("input your name", text: $text)
```

När inmatningsfältet är tomt visas en grå hjälpt text.

![textfield](../../RESOURCE/014_textfield.png)

#### Databindning

`TextField` ansvarar inte själv för att lagra det inmatade innehållet permanent, utan använder en bunden variabel för att hantera datan.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Det som användaren skriver in sparas direkt i variabeln `text`, medan `TextField` bara ansvarar för själva inmatningsgränssnittet.

`$` betyder bindning (`Binding`):

```swift
$text
```

Detta är inte en vanlig variabel, utan en typ av `Binding`.

Dess funktion är att skapa en koppling mellan vyn och datan:

När användaren skriver i `TextField` uppdateras `text` automatiskt; när `text` ändras uppdateras `TextField` också samtidigt.

Till exempel:

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

När man skriver något i `TextField` visas innehållet ovanför i `Text` i realtid.

![textField](../../RESOURCE/014_textfield1.png)

### Binda numerisk typ

När vi behöver skriva in siffror måste vi binda till en variabel av rätt typ:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

När användaren skriver in ett belopp kommer `TextField` att tolka det inmatade innehållet som ett numeriskt värde och automatiskt uppdatera `number`.

## Lägg till inmatningsfält

När vi nu har förstått den grundläggande användningen av `TextField` kan vi använda den i vårt spargrisprojekt.

Eftersom spargrisen behöver mata in ett “belopp”, använder vi bindning till numerisk typ (`Int/Double`) och lägger till en ny variabel `number` för att lagra användarens inmatning:

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

Nu visar `TextField` som standard värdet i `number` (som från början är `0`).

När innehållet i fältet rensas visas platshållaren “Amount”.

Det visar återigen att `TextField` visar värdet från den bundna variabeln, och inte lagrar innehållet själv.

### Problem med inmatningsfältets storlek

I den nuvarande vyn ser vi att `TextField` saknar ram, bara visar en `0`, och att innehållet verkar vara vänsterjusterat.

Effekten ser ut så här:

![textfield](../../RESOURCE/014_textfield2.png)

Detta beror på att `TextField` som standard upptar hela bredden hos sin föräldervy.

Vi kan verifiera detta genom att lägga till en bakgrundsfärg:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Effekten ser då ut så här:

![textfield](../../RESOURCE/014_textfield3.png)

Som vi kan se fyller `TextField` i själva verket hela radens bredd.

### Ange fast bredd

Om vi vill att inmatningsfältet ska vara mer kompakt kan vi använda `frame` för att begränsa dess bredd:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Effekten ser ut så här:

![textfield](../../RESOURCE/014_textfield4.png)

### Lägg till ram och inre marginal

Eftersom `TextField` inte har någon standardram kan vi lägga till stil manuellt:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Nu ser detta inmatningsfält mer ut som ett “standardfält”.

![textfield](../../RESOURCE/014_textfield5.png)

## Ram

I SwiftUI används `border` för att lägga till en ram runt en vy.

Grundläggande användning:

```swift
border(Color.black, width: 1)
```

Här betyder `Color.black` ramens färg, och `width` anger ramens tjocklek.

I `TextField` använder vi:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Det betyder att vi lägger till en svart ram runt inmatningsfältet med bredden `1 pt`.

Du kan också prova andra färger, till exempel `Color.blue`, `Color.green`, eller göra ramen tjockare med `width: 2`.

## Spara-knapp

Nu har vi en variabel `amount` för att visa totalbeloppet, ett `TextField` för att mata in belopp och variabeln `number` som är bunden till inmatningsfältet.

Den aktuella koden ser ut så här:

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

### Lägg till knapp

Nu behöver vi lägga till en knapp för att utlösa sparfunktionen.

```swift
Button("Save") {
    
}
```

### Implementera sparlogik

Vi vill att när användaren skriver in ett belopp och trycker på knappen, ska det beloppet läggas till totalsumman.

```swift
Button("Save") {
    amount += number
}
```

Här används den sammansatta tilldelningsoperatorn för att lägga användarens belopp `number` till totalsumman `amount`.

### Återställ inmatat belopp

Nu uppstår ett problem: efter att man tryckt på knappen rensas inte beloppet i inmatningsfältet.

Om användaren skriver in `10` och trycker på spara, ligger `10` fortfarande kvar i fältet och påverkar nästa sparbelopp.

Det beror på att `TextField` är bunden till `number`, och när vi trycker på knappen ändrar vi bara `amount`. `number` ändras inte, så fältet visar fortfarande det gamla värdet.

Vi behöver därför lägga till logik för att rensa värdet. När knappen trycks ska beloppet först läggas till totalsumman och sedan återställas:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Nu, när användaren skriver in ett belopp och trycker på knappen, läggs beloppet till totalsumman. `number` återställs till `0`, så att användaren kan mata in ett nytt belopp nästa gång.

Därmed har vi implementerat all sparlogik för vår “spargris”.

## Förbättra vyn

När funktionen är klar kan vi göra en enkel förbättring av gränssnittet genom att lägga till en bakgrundsbild och en knappstil.

Lägg till knappstil:

```swift
.buttonStyle(.borderedProminent)
```

Lägg till bakgrundsbild:

```swift
.background {
    Image("1")
}
```

Nu har vi slutfört utvecklingen av hela “spargris”-projektet.

## Fullständig kod

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

Resultatet ser ut så här:

![Piggy Bank](../../RESOURCE/014_view.png)

Nu kan vi prova att spara `100` eller ännu mer, för att kontrollera om logiken i “spargrisen” har några problem.

Vi kan också köra “spargrisen” i simulatorn eller på en fysisk enhet för att uppleva appen vi har utvecklat.

### Felsökningsutskrift

För att verifiera att logiken fungerar korrekt kan vi också lägga till felsökningsutskrifter i knappen för att kontrollera om det inmatade beloppet hanteras korrekt:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Varje gång vi sparar ett belopp och trycker på knappen kan vi se motsvarande felsökningsutskrifter för att kontrollera om det finns problem i koden.

```id="d98ocz"
---Saving---
amount:11
number:0
```
