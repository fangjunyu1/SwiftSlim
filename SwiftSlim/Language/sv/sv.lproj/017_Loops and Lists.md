# Loopar och listor

I den här lektionen ska vi lära oss `for`-loopen i Swift och `ForEach` i SwiftUI.

Båda hjälper oss att läsa elementen i en array i rätt ordning. I riktig utveckling behöver vi ofta ta ut data ur en grupp en post i taget och sedan bearbeta eller visa den, och just loopar är ett viktigt verktyg för att göra det.

När vi surfar på webben eller använder en App ser vi ofta många listor eller poster. Sådant innehåll lagras vanligtvis först i en `array`, läses sedan steg för steg med en `loop` och visas till sist på skärmen.

Till exempel Googles lista med sökresultat:

![Google](../../Resource/017_google.png)

Varje post i sökresultatet motsvarar vanligtvis en datapost och visas sedan en efter en genom en loop.

Därför förekommer `array` och `loop` ofta tillsammans. En `array` ansvarar för att spara en grupp data, och en `loop` ansvarar för att ta fram dessa data i ordning och utföra samma handling på dem.

Nu börjar vi med den mest grundläggande `for`-loopen.

## Nedräkning

Anta att vi vill simulera en nedräkning och skriva ut `”5, 4, 3, 2, 1”` i ordning.

Det mest direkta sättet att skriva det är:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Det här sättet kan visserligen simulera en nedräkning, men om innehållet är stort blir koden väldigt upprepande och svår att ändra senare.

Då kan vi först lägga datan i en array och sedan använda en `for`-loop för att skriva ut den steg för steg:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Det här skrivsättet är kortare och lättare att bygga ut. Även om nedräkningen innehåller många tal behöver vi inte skriva `print` rad för rad om och om igen. Det räcker att låta loopen automatiskt hantera varje element i arrayen.

Vi kan lägga den här koden i en knapp och testa den:

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

När knappen trycks kommer `for`-loopen att, enligt ordningen i arrayen, ta ut varje heltal i `countDown` ett i taget och skriva ut dem i konsolen.

Nu ska vi titta närmare på hur `for`-loopen fungerar.

## for-loop

`for`-loopen används för att bearbeta en grupp data i ordning. De vanligaste objekten är arrayer och intervall.

Grundläggande skrivsätt:

```swift
for element in arrayEllerIntervall {
    kodSomSkaKorlas
}
```

Till exempel koden för nedräkningen nyss:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Här representerar `i` elementet som just nu tas ut, och efter `in` kommer den data som ska loopas över, alltså arrayen `countDown`.

Betydelsen av den här koden är: programmet tar ut varje element ur arrayen `countDown` i ordning. Varje gång ett element tas ut representeras det tillfälligt med `i`, och sedan körs koden inne i klamrarna.

Körningen kan förstås så här:

- Först tas `5` ut, så då är värdet på `i` `5`
- `print(i)` körs och `5` skrivs ut
- Sedan tas nästa element `4` ut
- `print(i)` körs igen och `4` skrivs ut

Sedan behandlas även `3`, `2` och `1` på samma sätt i ordning.

![for](../../Resource/017_for.png)

När alla element i arrayen har bearbetats avslutas `for`-loopen automatiskt.

Med hjälp av `for`-loopen kan vi få fram varje element i arrayen och bygga funktioner som till exempel nedräkning.

**Tips**: `i` är ett mycket vanligt namn i en for-loop för att representera det aktuella elementet, men det är inte ett fast krav. Du kan också använda andra engelska namn.

Till exempel kan vi använda `num` för att representera varje element som tas ut:

```swift
for num in countDown {
    print(num)
}
```

Inne i klamrarna behöver vi då också använda `num` för att representera det aktuella elementet.

### Loopa över ett intervall

`for`-loopen kan inte bara loopa över arrayer, utan också över intervall.

Till exempel, om vi vill beräkna summan av positiva heltal upp till `50`, behöver vi addera alla heltal från `1` till `50` ett efter ett.

Det mest direkta skrivsättet skulle kunna vara:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problemet med det här skrivsättet är att vi måste skriva ut varje tal för hand. Det är både omständligt och olämpligt i verkliga utvecklingsscenarier.

Här kan vi i stället använda intervalloperatorn tillsammans med `for`-loopen.

I kapitlet om ”operatorer” tidigare lärde vi oss redan intervalloperatorn:

```swift
1...3   // 1, 2, 3
```

Här betyder `...` ett slutet intervall, alltså att både start och slut ingår.

Därför kan vi här använda `for`-loopen för heltalsintervallet från `1` till `50`:

```swift
for i in 1...50 {
    
}
```

Vi behöver addera dessa heltal, så vi behöver också en variabel för att spara summan:

```swift
var count = 0
```

Sedan lägger vi till det tal som tas ut till `count` vid varje varv i loopen:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Den här koden betyder:

- `count` används för att spara den aktuella summan
- `for`-loopen tar ut heltalen från `1` till `50` i ordning
- Varje gång ett heltal tas ut körs `count += i`
- När loopen är slut innehåller `count` den slutliga summan.

På så sätt kan vi få summan av alla positiva heltal upp till `50`.

På samma sätt, om vi vill beräkna summan av heltalen från `1` till `100`, behöver vi bara ändra intervallet:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for`-loopen kan alltså inte bara användas med arrayer utan också med ett intervall. Den här förmågan att upprepat bearbeta data i rätt ordning är mycket vanlig i utveckling.

Den hjälper oss att automatiskt hantera mycket upprepande arbete utan att vi behöver skriva additionsprocessen för varje tal, eller andra liknande repetitiva steg, för hand.

## Loopar i SwiftUI

`for`-loopen ovan tillhör själva Swift-språket.

Men i SwiftUI kan vi inte använda `for` direkt inne i en view-struktur för att skapa views:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Det beror på att `VStack` måste innehålla SwiftUI-vyer, medan en vanlig `for`-loop i sig själv inte är en view.

Om vi vill skapa gränssnitt upprepade gånger i SwiftUI baserat på innehållet i en array måste vi använda `ForEach`.

Om vi till exempel vill visa namnen på alla medlemmar i en grupp kan vi skriva:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Visat resultat:

![for1](../../Resource/017_for1.png)

Sedan lägger vi till samma modifierare för varje `Text`:

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

Nu visas varje `Text` med mindre och fetare text.

Visat resultat:

![](../../Resource/017_for2.png)

Även om modifierarna gör gränssnittet snyggare gör de också koden längre och mer upprepande.

Om listan med namn blir längre, eller om vi senare vill ändra typsnitt, färg och andra stilar på ett enhetligt sätt, behöver vi skriva och ändra mycket likadan kod om och om igen. Det är både omständligt och svårare att underhålla.

Då kan vi först lägga dessa namn i en array och sedan använda `ForEach` i SwiftUI för att skapa views upprepade gånger utifrån datan i arrayen:

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

Den här kodgruppen är mer kompakt. `ForEach` läser varje element i arrayen i ordning och visar motsvarande innehåll på skärmen.

När vi senare lägger till nya namn behöver vi bara ändra innehållet i arrayen `names`. Vi behöver inte varje gång lägga till `Text` och komplicerade modifierare på nytt.

## ForEach

`ForEach` är en struktur i SwiftUI som används för att skapa views upprepade gånger. Du kan se den som en struktur i SwiftUI som fungerar ungefär som en `for`-loop.

Grundläggande användning:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-kod
}
```

Till exempel gruppnamnen från nyss:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Den här koden betyder:

`names` är arrayen som loopas över, alltså den data som ska visas.

`id:\.self` betyder att själva elementet i arrayen används för att skilja varje element åt.

I det här exemplet innehåller arrayen strängar:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Därför använder SwiftUI direkt strängarna "Sam", "John", "Wathon", "Bob" själva för att skilja olika innehåll åt.

För enkla arrayer som String och Int, som är vanliga i början, kan vi vanligtvis börja med att skriva:

```swift
id: \.self
```

Just nu räcker det att komma ihåg det här skrivsättet. Du behöver inte fördjupa dig i fler regler för id ännu.

`item in` betyder att `item` representerar elementet som just nu tas ut.

Till exempel är `item` `"Sam"` vid första varvet och `"John"` vid det andra varvet.

Därför:

```swift
Text(item)
```

Blir i ordning:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Det som koden gör är alltså att ta varje namn ur arrayen `names` i ordning och skapa en `Text`-view för varje namn.

### Körningsprocess

Körningsprocessen kan förstås så här:

- `ForEach` läser först det första elementet `"Sam"` i arrayen `names`
- `item` representerar tillfälligt `"Sam"`
- `Text(item)` visar `"Sam"`
- Sedan fortsätter den med att läsa nästa element `"John"`
- Och kör samma view-kod igen

Till slut visas alla namn i arrayen.

Fördelen med det här skrivsättet är att när antalet namn växer behöver vi inte skriva många `Text` om och om igen. Det räcker att ändra innehållet i arrayen.

### Loopa över foton

`ForEach` kan inte bara visa text utan också bilder, färger eller andra SwiftUI-vyer.

Till exempel kan vi förbereda 4 bilder:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Dra dessa fyra bilder till Assets-mappen i Xcode.

![image](../../Resource/017_for3.png)

Om vi inte använder `ForEach` måste vi skriva ut varje bild manuellt:

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

Visat resultat:

![image](../../Resource/017_for4.png)

Det här sättet fungerar, men koden blir ganska lång.

Om antalet bilder blir större måste vi skriva allt mer `Image`-kod om och om igen.

Om vi senare vill ändra bildstorleken på ett enhetligt sätt måste vi också gå igenom dem en i taget.

Då kan vi lägga bildnamnen i en array och sedan använda `ForEach` för att skapa bild-vyer upprepade gånger:

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

Här är `images` en array av strängar, och varje element i arrayen är namnet på en bild.

`ForEach(images, id: \.self)` betyder att varje element i arrayen `images` läses i ordning, att själva elementet används för att skilja posterna åt och att motsvarande view sedan skapas utifrån det aktuella elementet.

Till exempel, om det första som läses är `"430F9BEF"`, då:

```swift
Image(item)
```

Motsvarar:

```swift
Image("430F9BEF")
```

Bilderna som följer visas också i ordning på samma sätt.

![image](../../Resource/017_for4.png)

Här använder vi fortfarande:

```swift
id: \.self
```

Anledningen är densamma som tidigare. Elementen i arrayen `images` är också enkla strängtyper, så i början räcker det att använda själva elementet som sätt att skilja dem åt.

Det går att komma ihåg som en fast regel:

**När `ForEach` loopar över en enkel array som `String` eller `Int` skriver man vanligtvis `id: \.self`.**

### Lägg till bilder

Om vi senare behöver lägga till fler bilder räcker det att ändra innehållet i arrayen:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Vi behöver inte skriva ny `Image`-kod om igen.

Om det finns många bilder kan vi använda detta tillsammans med `ScrollView`, annars går det inte att förhandsgranska allt när innehållet går utanför skärmen.

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

### Ändra bilder

När vi behöver ändra bildstilen enhetligt räcker det att ändra koden inne i `ForEach`.

Till exempel kan vi ändra bredden till `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

På så sätt ändras alla bilder samtidigt, och vi behöver inte redigera dem en i taget.

Det här är en viktig roll för `ForEach`:

**När flera views har samma struktur och bara innehållet skiljer sig, behöver vi bara skriva view-koden en gång och låta datan i arrayen avgöra vad som ska visas.**

## Sammanfattning

I den här lektionen lärde vi oss `for`-loopen och `ForEach`.

`for`-loopen används för att bearbeta element i en array eller ett intervall i ordning och lutar mer åt databearbetning.

`ForEach` används i SwiftUI för att skapa views upprepade gånger utifrån innehållet i en array och lutar mer åt visning av gränssnitt.

På den nuvarande nybörjarnivån är det vanligaste skrivsättet för `ForEach`:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI-kod
}
```

Här betyder `id: \.self` att själva elementet används för att skilja varje element åt.

När innehållet i arrayen är enkla typer som `String` och `Int` kan vi vanligtvis börja med just det här skrivsättet.

Senare, när du surfar på webben eller använder en App och ser grupper av upprepad text, bilder eller annat listinnehåll, kan du tänka på att sådant innehåll i SwiftUI vanligtvis först läggs i en array och sedan visas ett i taget med `ForEach`.
