# Djurencyklopedi 

I den här lektionen fortsätter vi att öva på anpassade vyer och dataöverföring.

Vi ska skapa en enkel djurencyklopedivy. Sidan visar fem djur. När du trycker på ett djur visas en detaljvy som visar djurets bild, utbredningsområde, livsmiljö och beskrivning.

Slutresultat:

![view](../../../Resource/029_view.png)

Genom det här exemplet kan vi öva på hur datastrukturer, listvisning, tryckinteraktion och Sheet-popupvyer fungerar tillsammans.

## Förbered bildresurser

Först behöver vi förbereda fem djurbilder:

- Delfin: `dolphin.jpg`
- Giraff: `giraffe.jpg`
- Lejon: `lion.jpg`
- Panda: `panda.jpg`
- Isbjörn: `polarBear.jpg`

Du kan använda följande bildresurser:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Giraff](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lejon](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Isbjörn](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

När du har laddat ned bilderna drar du dem till resursmappen `Assets` i Xcode-projektet.

![assets](../../../Resource/029_assets.png)

Observera att du vanligtvis inte behöver skriva filändelsen `.jpg` när du använder bilder i koden.

Om bildresursens namn till exempel är `dolphin`, skriver du så här i koden:

```swift
Image("dolphin")
```

Om bildnamnet skrivs fel kan bilden inte visas korrekt.

Obs! Bildresurserna ovan kommer från Wikimedia-projektet. Vid användning rekommenderas att du behåller länken till originalbilden och källinformationen.

## Skapa djurstrukturen

På den här sidan har varje djur flera olika uppgifter:

- Djurnamn
- Djurbild
- Djuremoji
- Utbredningsområde
- Livsmiljö
- Djurbeskrivning

Om vi sprider ut den här informationen i många olika variabler blir koden ganska rörig. Därför kan vi skapa en `Animal`-struktur och samla informationen om ett djur på ett ställe.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

I den här koden:

- `id`: djurets unika identifierare.
- `name`: djurnamn.
- `imageName`: namnet på djurets bild.
- `avatarEmoji`: djurets emoji.
- `distributionArea`: utbredningsområde.
- `habitat`: livsmiljö.
- `animalDescription`: djurbeskrivning.

Här:

```swift
let id = UUID()
```

`id` används för att identifiera varje djur. Senare använder vi `ForEach` för att visa djurlistan, och vi använder även `.sheet(item:)` för att visa detaljer utifrån det valda djuret. Därför måste `Animal` följa protokollet `Identifiable`.

Syftet med `Identifiable` är att tala om för SwiftUI att varje djur har ett `id` som kan skilja det från andra djur.

## Skapa djurdata

Därefter skapar vi en djurarray i `ContentView`.

Arrayen innehåller fem `Animal`-värden, och varje `Animal` representerar ett djur.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varma och tempererade hav runt om i världen.",
            habitat: "Hav, kustvatten och några stora floder.",
            animalDescription: "Delfiner är intelligenta marina däggdjur. De lever i grupper, kommunicerar med ljud och är kända för sitt lekfulla beteende."
        ),
        // Giraff
        Animal(
            name: "Giraff",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanner och öppna skogsområden i Afrika.",
            habitat: "Gräsmarker, savanner och öppna skogar.",
            animalDescription: "Giraffer är de högsta landdjuren. De har långa halsar, långa ben och äter vanligtvis blad från höga träd."
        ),
        // Lejon
        Animal(
            name: "Lejon",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Finns främst i Afrika söder om Sahara, med en liten population i västra Indien.",
            habitat: "Gräsmarker, savanner och öppna skogsområden.",
            animalDescription: "Lejon är kraftfulla stora kattdjur. De lever oftast i grupper som kallas flockar och är ofta kända som djurvärldens kungar."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bergsskogar i centrala Kina.",
            habitat: "Bambuskogar i svala och fuktiga bergsområden.",
            animalDescription: "Pandor är björnar som är kända för sin svartvita päls. De äter främst bambu och är ett av världens mest igenkännliga djur."
        ),
        // Isbjörn
        Animal(
            name: "Isbjörn",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiska områden runt Nordpolen.",
            habitat: "Havsis, kustområden och kalla arktiska miljöer.",
            animalDescription: "Isbjörnar är stora björnar som är anpassade till kalla miljöer. De är starka simmare och är främst beroende av havsis för att jaga sälar."
        )
    ]

    var body: some View {
        Text("Djurencyklopedi")
    }
}
```

Här är `animals` en array:

```swift
let animals: [Animal]
```

`[Animal]` betyder att arrayen innehåller flera `Animal`-värden.

Med andra ord är `animals` inte ett enda djur, utan en grupp djur.

## Visa djurlistan

Nu kan vi använda `ForEach` för att visa djurlistan.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Visat resultat:

![view](../../../Resource/029_view1.png)

I den här koden:

```swift
ForEach(animals) { animal in
    ...
}
```

Det betyder att vi itererar över arrayen `animals`.

Vid varje iteration representerar `animal` det djur som just nu visas.

Till exempel är `animal` en delfin vid den första iterationen och en giraff vid den andra.

Därför kan vi visa informationen för det aktuella djuret på följande sätt:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

På så sätt kan vi visa alla fem djur.

## Gör djurlistan tryckbar

Nu visas listan, men den går ännu inte att trycka på.

Om vi vill visa detaljer när användaren trycker på ett djur behöver vi först registrera det ”aktuellt valda djuret”.

Därför lägger vi till en tillståndsvariabel i `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Här är `selectedAnimal` ett optional-värde av typen `Animal?`.

Det betyder att det kan innehålla ett djur, men också att det kan sakna djur.

Standardvärdet är `nil`, vilket betyder att inget djur är valt från början.

Sedan gör vi om varje djurrad till en `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Den viktiga raden är:

```swift
selectedAnimal = animal
```

När användaren trycker på ett djur sparar vi det djuret i `selectedAnimal`.

Om användaren till exempel trycker på delfinen sparas delfinen i `selectedAnimal`.

Om användaren trycker på pandan sparas pandan i `selectedAnimal`.

Med andra ord används `selectedAnimal` för att registrera vilket djur användaren trycker på just nu.

## Sheet-popupvy

Nu kan vi registrera det ”aktuellt tryckta djuret” via knappen.

Därefter behöver vi implementera en popupvy som visar djurets detaljer.

![view](../../../Resource/029_view2.png)

I SwiftUI kan vi använda `Sheet` för att skapa den här typen av popup-effekt.

`Sheet` kan förstås som en sida som visas tillfälligt ovanpå den aktuella sidan. När användaren har läst innehållet kan den stängas genom att svepas nedåt.

## Sheet-exempel

Innan vi verkligen visar djurdetaljer använder vi ett enkelt exempel för att förstå hur `Sheet` visas.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Visa Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet-vy")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Visat resultat:

![view](../../../Resource/029_view3.png)

I den här koden skapar vi ett booleskt värde:

```swift
@State private var showSheet = false
```

`showSheet` är som standard `false`, vilket betyder att `Sheet` inte visas från början.

När knappen trycks:

```swift
showSheet.toggle()
```

`toggle()` betyder att det booleska värdet växlas.

Om det från början är `false` blir det `true` efter att `toggle()` anropas.

Om det från början är `true` blir det `false` efter att `toggle()` anropas.

När knappen trycks ändras alltså `showSheet` från `false` till `true`.

När `showSheet` blir `true` visar följande kod en `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-vy")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Den här koden betyder: när `showSheet` är `true` visas en `Sheet`, och `Text("Sheet-vy")` visas i den.

Visat resultat:

![view](../../../Resource/029_view4.png)

Den här skrivformen passar för att visa fast innehåll.

Till exempel kan en inställningssida, informationssida eller tipsruta visas efter att en knapp trycks.

### Var Sheet placeras

Även om `Sheet` är en popupvy skrivs den i SwiftUI inte direkt som en fristående vy på samma sätt som `Text()` eller `Image()`. Den används i stället som en vymodifierare.

Det betyder att `.sheet(...)` liknar modifierare som `.font()`, `.padding()` och `.shadow()`: den behöver läggas efter en viss vy.

Till exempel:

```swift
Button("Visa Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-vy")
}
```

I det här exemplet läggs `.sheet` efter `Button`.

När `showSheet` blir `true` visar SwiftUI en `Sheet` och visar innehållet i klamrarna:

```swift
Text("Sheet-vy")
```

I praktisk utveckling brukar man dock inte lägga till en `.sheet` på varje knapp om sidan har flera knappar.

Ett vanligare sätt är att lägga `.sheet` efter den yttre vyn.

Till exempel:

```swift
VStack {
    Button("Visa Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-vy")
}
```

Knappen ansvarar för att ändra `showSheet`, och den yttre vyn ansvarar för att visa `Sheet` utifrån om `showSheet` är `true`.

## Sheet bundet till ett optional-värde

Tidigare lärde vi oss följande skrivform:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-vy")
}
```

Den här skrivformen passar för att styra visning och döljning av en fast sida.

Men i djurencyklopediexemplet behöver vi inte bara veta ”om `Sheet` ska visas”, utan också ”vilket djur som trycktes”.

Till exempel:

Om användaren trycker på delfinen ska delfinens detaljer visas i `Sheet`.

Om användaren trycker på pandan ska pandans detaljer visas i `Sheet`.

Därför passar en annan Sheet-skrivform bättre här:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Innehållet som visas i Sheet
}
```

I den här koden binds `Sheet` till optional-värdet `selectedAnimal`.

Observera att det efter `item:` står `$selectedAnimal`, inte `selectedAnimal`.

Det beror på att `Sheet` inte bara läser värdet i `selectedAnimal`, utan också behöver avgöra om den ska visas utifrån hur värdet ändras.

Den här koden kan förstås så här:

- När `selectedAnimal` är `nil` visas ingen `Sheet`.
- När `selectedAnimal` har ett värde visas `Sheet`.
- När `Sheet` stängs sätter SwiftUI tillbaka `selectedAnimal` till `nil`.

SwiftUI skickar djuret som sparats i `selectedAnimal` till `animal` i klamrarna.

Med andra ord styr `.sheet(item:)` inte bara visningen, utan skickar även in de valda data till `Sheet`.

## Använd Sheet för att visa djurnamnet

Nu behöver vi inte skynda oss att skapa en komplex detaljvy.

För att göra koden lättare att förstå visar vi först namnet på det aktuella djuret i `Sheet`.

Lägg till `.sheet(item:)` utanför `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Den viktigaste delen är den här koden:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

När `selectedAnimal` har ett värde visas `Sheet`.

`animal` i klamrarna är det djur som är valt just nu.

Därför:

```swift
Text(animal.name)
```

visar namnet på det djur som användaren tryckte på.

Om du till exempel trycker på `Delfin` visas `Delfin` i Sheet.

Om du trycker på `Panda` visas `Panda` i `Sheet`.

På så sätt har vi åstadkommit effekten där olika djurnamn visas när olika djur trycks.

Visa djurnamn:

![view](../../../Resource/029_view5.png)

Men djurdetaljer bör inte bara visa ett namn. De bör även visa namn, utbredningsområde, livsmiljö och beskrivning.

Om all den koden skrivs inuti `.sheet` blir koden väldigt lång och svårare att läsa.

Därför skapar vi härnäst en ny anpassad vy som särskilt ansvarar för att visa djurdetaljer.

## Skapa djurdetaljvyn

Därefter skapar vi en ny anpassad vy, `AnimalDetailView`.

Den här vyn tar emot ett `Animal` och visar djurets detaljer.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Utbredningsområde**: \(animal.distributionArea)")

                    Divider()

                    Text("**Livsmiljö**: \(animal.habitat)")

                    Divider()

                    Text("**Djurbeskrivning**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Visat resultat:

![view](../../../Resource/029_view2.png)

Det viktiga här är:

```swift
var animal: Animal
```

Det betyder att `AnimalDetailView` behöver ta emot ett djur utifrån.

När djuret har tagits emot kan detaljvyn använda alla uppgifter om det djuret:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Med andra ord ansvarar `AnimalDetailView` bara för att visa djuret som skickas in.

### Fetstil med Markdown

I detaljvyn skrev vi följande kod:

```swift
Text("**Livsmiljö:** \(animal.habitat)")
```

Här finns två saker att känna till.

För det första använder `**Livsmiljö:**` `Markdown`-syntax. Text som omges av två asterisker visas i fetstil.

För det andra är `\()` stränginterpolation, vilket kan visa värdet från en variabel i texten.

Den här koden betyder att den först visar `Livsmiljö:` i fetstil och sedan visar djurets livsmiljö.

## Visa detaljvyn i Sheet

När `AnimalDetailView` har skapats kan vi gå tillbaka till `ContentView` och ersätta den tidigare namnvisningen i `Sheet` med detaljvyn.

Tidigare var det:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Nu ändrar vi till:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Här är `animal:` parameternamnet i `AnimalDetailView`.

`animal` efter det är det aktuella djuret som skickas in av `.sheet(item:)`.

Det innebär att det djur som användaren just tryckte på skickas till `AnimalDetailView` för visning.

Fullständig struktur:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

När användaren trycker på ett djur:

```swift
selectedAnimal = animal
```

`selectedAnimal` ändras från `nil` till ett specifikt djur. När `Sheet` upptäcker att `selectedAnimal` har ett värde visas vyn.

`Sheet` skickar djuret i `selectedAnimal` till vyn `AnimalDetailView`, och `AnimalDetailView` visar djurets detaljer.

På så sätt har vi implementerat funktionen där rätt djurdetaljer visas när ett djur i listan trycks.

## Skillnaden mellan två Sheet-skrivformer

Nu har vi använt `.sheet(item:)` för att visa djurdetaljvyn.

Här kan vi kort sammanfatta två vanliga sätt att skriva `Sheet`.

### Den första binder ett booleskt värde

```swift
@State private var showSheet = false

Button("Visa Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-vy")
}
```

Den här skrivformen passar för att visa fast innehåll, till exempel en inställningssida, informationssida eller tipsruta.

`showSheet` är ett booleskt värde och har bara två tillstånd: `true` och `false`.

När `showSheet` är `true` visas `Sheet`.

När `showSheet` är `false` visas inte `Sheet`.

### Den andra binder ett optional-värde

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Den här skrivformen passar för att visa olika innehåll utifrån valda data.

I den här lektionen trycker vi på olika djur och behöver visa detaljer för olika djur, så `.sheet(item:)` passar bättre.

## Fullständig kod

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Djurnamn
    let name: String
    
    // Djurbild
    let imageName: String
    
    // Djuremoji
    let avatarEmoji: String
    
    // Utbredningsområde
    let distributionArea: String
    
    // Livsmiljö
    let habitat: String
    
    // Djurbeskrivning
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varma och tempererade hav runt om i världen.",
            habitat: "Hav, kustvatten och några stora floder.",
            animalDescription: "Delfiner är intelligenta marina däggdjur. De lever i grupper, kommunicerar med ljud och är kända för sitt lekfulla beteende."
        ),
        // Giraff
        Animal(
            name: "Giraff",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanner och öppna skogsområden i Afrika.",
            habitat: "Gräsmarker, savanner och öppna skogar.",
            animalDescription: "Giraffer är de högsta landdjuren. De har långa halsar, långa ben och äter vanligtvis blad från höga träd."
        ),
        // Lejon
        Animal(
            name: "Lejon",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Finns främst i Afrika söder om Sahara, med en liten population i västra Indien.",
            habitat: "Gräsmarker, savanner och öppna skogsområden.",
            animalDescription: "Lejon är kraftfulla stora kattdjur. De lever oftast i grupper som kallas flockar och är ofta kända som djurvärldens kungar."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bergsskogar i centrala Kina.",
            habitat: "Bambuskogar i svala och fuktiga bergsområden.",
            animalDescription: "Pandor är björnar som är kända för sin svartvita päls. De äter främst bambu och är ett av världens mest igenkännliga djur."
        ),
        // Isbjörn
        Animal(
            name: "Isbjörn",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiska områden runt Nordpolen.",
            habitat: "Havsis, kustområden och kalla arktiska miljöer.",
            animalDescription: "Isbjörnar är stora björnar som är anpassade till kalla miljöer. De är starka simmare och är främst beroende av havsis för att jaga sälar."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Utbredningsområde**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Livsmiljö**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Djurbeskrivning**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Sammanfattning

I den här lektionen byggde vi en enkel djurencyklopedisida.

Först använde vi strukturen `Animal` för att spara djurinformation, sedan använde vi en array för att spara fem djur, och därefter använde vi `ForEach` för att visa djurlistan.

När användaren trycker på ett djur sparar vi det djuret i `selectedAnimal`:

```swift
selectedAnimal = animal
```

När `selectedAnimal` har ett värde visar `.sheet(item:)` detaljvyn och skickar det valda djuret till `AnimalDetailView`.

Det viktigaste i den här lektionen är inte gränssnittets stil, utan att förstå den här dataöverföringskedjan:

```swift
Tryck på djur → selectedAnimal sparar djuret → Sheet visas → AnimalDetailView visar detaljer
```

När du förstår den här kedjan kan du senare skapa fler liknande funktioner, till exempel produktdetaljer, kursdetaljer, artikeldetaljer och kontaktdetaljer.
