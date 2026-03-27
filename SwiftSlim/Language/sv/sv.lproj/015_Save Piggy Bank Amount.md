# Spara spargrisens belopp

I förra lektionen skapade vi en enkel “spargris”. I den här lektionen ska vi lära oss hur man gör så att spargrisens belopp sparas permanent.

Den här lektionen fokuserar främst på `UserDefaults` och egenskapsomslutaren `@AppStorage`, och kommer även att förklara funktionen hos `onAppear` samt hur man använder optional-typer (`nil`).

Observera att den här lektionen bygger vidare på koden för “spargrisen” från föregående lektion.

## Problemet med permanent lagring

Just nu är gränssnittet för “spargrisen” mycket enkelt och också bekvämt att använda.

![Piggy Bank](../../Resource/014_view.png)

Men det finns ett tydligt problem: varje gång vyn uppdateras eller appen stängs, blir spargrisens totalbelopp alltid `0`, och det tidigare sparade beloppet försvinner helt.

Det betyder att datan inte verkligen har sparats. Med andra ord kan den nuvarande “spargrisen” bara lagra tillfällig data.

### Varför kan den inte spara permanent?

Detta beror på att vi använder en variabel deklarerad med `@State`:

```swift
@State private var amount = 0
````

En variabel som deklareras med `@State` har en livscykel som helt beror på vyn.

När vyn skapas initieras `amount` till `0`, och när vyn förstörs förstörs även `amount`.

Datan som lagras i `amount` finns alltså bara i minnet och sparas inte på enheten.

Om vi inte vill att `amount` ska vara bunden till vyens livscykel måste vi implementera permanent datalagring. Det vill säga att spara datan på enheten.

### Vad betyder “datapersistens”?

Datapersistens kan förstås som att flytta data från “tillfälligt minne” till “enhetens lagring”.

När vyn stängs, eller när appen stängs, går datan då inte förlorad.

I Swift-utveckling kan enkel datapersistens implementeras med `UserDefaults`, medan mer komplex data vanligtvis lagras med `SwiftData` eller `CoreData`.

I den här lektionen börjar vi med det enklaste alternativet: `UserDefaults`.

## UserDefaults

`UserDefaults` används för att spara lättviktig nyckel-värde-data och används ofta för att lagra grundläggande typer som `String`, `Int`, `Double` och `Bool`.

### Spara data

`UserDefaults` använder metoden `set` för att spara data:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Det första argumentet i `UserDefaults` representerar datan som ska sparas, här till exempel värden av typen `String` och `Int`.

Det andra argumentet `forKey` fungerar ungefär som ett variabelnamn och används för att identifiera datan som sparas i `UserDefaults`.

### Läsa data

`UserDefaults` använder motsvarande metoder för att läsa data:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

När man läser data måste man använda en metod som motsvarar rätt typ, annars kan fel uppstå eller datan bli felaktig.

### Saker att tänka på med UserDefaults

#### 1. Returnerar optional-typ

När man läser data från `UserDefaults` returnerar vissa metoder en optional-typ (`Optional`).

Till exempel:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Typen för `name` blir då:

```swift
String?
```

Det betyder att värdet kanske finns, men det kanske också inte finns något värde alls.

**Varför returneras en optional-typ?**

Det beror på att en viss `Key` i `UserDefaults` inte nödvändigtvis har någon sparad data.

Till exempel:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Om `Key`-värdet `"City"` aldrig tidigare har sparats, blir resultatet:

```swift
nil
```

Det är viktigt att betona att `nil` betyder att det inte finns någon data, och inte att det är en tom sträng.

I lektionen om “typsystemet” stötte vi på ett liknande problem: när en typkonvertering misslyckas returneras också en optional-typ.

Då behöver vi använda `??` för att ge ett standardvärde och packa upp värdet:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Om `UserDefaults` lyckas läsa data används det lästa värdet; om ingen data hittas (`nil`) används standardvärdet.

#### 2. Returnerar icke-optional-typ

När `UserDefaults` läser `Int`, `Double` och `Bool` returneras däremot icke-optional-typer.

Till exempel:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Även om dessa `Key`-värden aldrig har sparats tidigare blir resultatet inte `nil`.

I stället returneras standardvärden:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Begränsning i datamängd

`UserDefaults` lämpar sig bara för att spara små mängder data, till exempel appinställningar och enkla statusvärden.

I praktiken passar det inte för att lagra stora datamängder eller data som läses och skrivs ofta.

## Spara “spargrisens” belopp

Nu kan vi använda `UserDefaults` för att implementera logiken som sparar spargrisens totalbelopp.

När användaren trycker på knappen läggs det inmatade beloppet till totalbeloppet, och totalbeloppet sparas sedan i `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Nu har vi implementerat logiken för att skriva data.

## Förklaring av logiken för datapersistens

Även om vi nu har skrivit logiken för att spara data permanent, kommer vi i praktiken att märka att `amount` fortfarande är `0` varje gång vyn uppdateras eller appen öppnas igen.

Detta beror på:

```swift
@State private var amount = 0
```

I SwiftUI initieras en `@State`-variabel på nytt när vyn skapas.

Även om värdet på `amount` redan har sparats i `UserDefaults`, återställs `amount` fortfarande till `0` när vyn laddas om.

Det visar att vi just nu bara sparar datan i `UserDefaults`, men inte återställer den i själva vyn.

Därför måste vi, när vyn laddas, också läsa data från `UserDefaults` manuellt och tilldela den till `amount`, för att hela logiken för datapersistens ska fungera.

### Logisk jämförelse

Man kan förstå processen som en “svart tavla i ett klassrum”:

När lektionen pågår skriver läraren innehållet på tavlan, och detta motsvarar tillståndet (`@State`) i den aktuella vyn.

När lektionen är slut suddas tavlan ren för att förbereda för nästa lektion. Detta motsvarar att vyn förstörs och att datan i `@State` rensas.

För att undervisningsinnehållet inte ska gå förlorat sparar läraren det i förväg i kursmaterialet. Detta kursmaterial motsvarar datan som sparas i `UserDefaults`.

När nästa lektion börjar är tavlan tom från början (`@State` initieras), och läraren måste skriva upp det tidigare innehållet igen utifrån kursmaterialet (läsa från `UserDefaults`).

Det viktiga att förstå är att tavlan inte automatiskt återställer det gamla innehållet. Det måste skrivas tillbaka genom att “läsa kursmaterialet” (läsa `UserDefaults`).

## Läsa data med onAppear

När vyn visas behöver vi manuellt läsa värdet från `UserDefaults` och tilldela det till `amount` i `@State`, för att uppnå verklig datapersistens.

I SwiftUI kan man använda `onAppear` för att köra initialiseringslogik när vyn visas:

```swift
.onAppear {}
```

Vi placerar koden som läser från `UserDefaults` i `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

När vyn skapas initieras `amount` till `0`; när vyn visas utlöses `onAppear`, som läser från `UserDefaults` och tilldelar värdet till `amount`. På så sätt kan vyn visa det totalbelopp som sparades senast.

Nu är hela logiken för datapersistens i “spargrisen” färdig.

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Egenskapsomslutaren @AppStorage

SwiftUI erbjuder egenskapsomslutaren `@AppStorage`, som kan förenkla logiken för att spara med `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` är en inkapsling av `UserDefaults`, där `"amount"` motsvarar nyckeln (`Key`) i `UserDefaults`.

När vyn skapas läses data från `UserDefaults`; när variabeln ändras skrivs den automatiskt tillbaka till `UserDefaults`.

Den stöder SwiftUI:s mekanism för statusuppdatering och fungerar, precis som `@State`, så att SwiftUI-vyn uppdateras när värdet ändras.

Det betyder alltså att `@AppStorage` kan hantera både läsning och sparande av data, så att vi inte längre behöver anropa `UserDefaults` manuellt eller använda `onAppear` för att läsa in data.

Därför kan vi använda `@AppStorage` för att ersätta `UserDefaults` i koden:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## Sammanfattning

I den här lektionen lärde vi oss huvudsakligen följande:

Först lärde vi oss att `UserDefaults` används för att spara lättviktig data, och vi använde `UserDefaults` för att spara totalbeloppet på enheten. `UserDefaults` erbjuder metoder för att läsa och skriva data, och vi behöver också hantera optional-typer i vissa fall.

Därefter såg vi att `@State` bara används för att hantera tillfälligt tillstånd i en vy, och att dess livscykel är densamma som vyens. När vyn skapas på nytt initieras `@State` också på nytt.

När vi återställde data från `UserDefaults` lärde vi oss att använda `onAppear` för att läsa data när vyn visas och därmed återställa tillståndet.

Till sist använde vi `@AppStorage` för att ersätta `UserDefaults`, så att data automatiskt läses när vyn laddas och automatiskt skrivs när datan ändras. På så sätt ersätts logiken med manuella anrop till `UserDefaults` och `onAppear`.

Med denna kunskap kan vi implementera grundläggande datalagring i en app, så att data kan sparas permanent.

## Övning efter lektionen

Nu stöder “spargrisen” sparande av belopp, men funktionen är fortfarande inte komplett.

1. När användaren vill ta ut pengar behöver du utforma motsvarande logik för uttag.
2. När användaren vill nollställa beloppet behöver du också implementera återställningslogik.
3. Om du vill ge spargrisen ett namn behöver du även lägga till lagring av data av typen `String`.

Du kan vidareutveckla dessa funktioner utifrån den nuvarande grunden, så att “spargrisen” blir mer komplett.

## Utökad kunskap - problemet med standardvärdet i inmatningsfältet

Nu kan vi också förbättra interaktionen i inmatningsfältet ytterligare, så att det blir enklare att mata in data.

![textfield](../../Resource/015_view.png)

I den nuvarande implementationen är standardvärdet i inmatningsfältet `0`. Varje gång användaren vill skriva in ett belopp måste `0` först raderas innan ett nytt värde skrivs in, och det är inte en rimlig användarupplevelse.

Vi bör i stället låta inmatningsfältet vara tomt från början, i stället för att visa `0`.

Detta beror på att `TextField` och `number` är dubbelriktat bundna:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

När `number` initieras till `0`, visar inmatningsfältet också `0`.

Därför behöver vi ändra `number` till ett tomt värde, det vill säga `nil`.

```swift
@State private var number = nil
```

Då uppstår ett fel:

```
Generic parameter 'Value' could not be inferred
```

Detta är precis det vi tog upp i lektionen om “typsystemet”: när en variabels typ inte kan härledas automatiskt måste vi deklarera typen uttryckligen.

Eftersom vi sätter `number` till `nil`, och `nil` i sig inte innehåller någon typinformation, kan kompilatorn inte avgöra om variabeln ska vara `String`, `Int` eller någon annan typ, och därför uppstår felet.

Därför behöver vi uttryckligen ange typen för `number`:

```swift
@State private var number:Int? = nil
```

Här betyder `Int?` en optional-typ (`Optional`), vilket innebär att `number` antingen kan vara ett `Int`-värde eller `nil`.

På så sätt kan vi initiera den till `nil`, och inmatningsfältet visas då som tomt i stället för att visa `0`.

### Packa upp optional-typer

När vi har ändrat `number` till en optional-typ uppstår ett fel i den tidigare beräkningskoden:

```swift
amount += number
```

Felmeddelandet är:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Detta beror på att `number` nu kan vara `nil`. Om vi låter den delta direkt i en beräkning motsvarar det:

```swift
amount += nil
```

Det är uppenbart att `nil` inte kan adderas med `amount`, och detta är därför inte en giltig operation.

Därför måste vi först packa upp en optional-typ innan den används i beräkningar.

Här kan vi använda `??` för att ge ett standardvärde:

```swift
amount += number ?? 0
```

När `number` är `nil` används standardvärdet `0`; när `number` har ett värde används det verkliga inmatade värdet.

På så sätt säkerställs både att beräkningen fungerar korrekt och att inmatningsfältet kan vara tomt som standard, så att användaren inte längre behöver radera `0` manuellt.

## Utökad kod

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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