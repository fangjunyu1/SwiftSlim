# Fill Light-app

I den här lektionen ska vi bygga en väldigt intressant fill light-app. När natten kommer kan vi låta telefonens skärm visa olika färger och använda den som en enkel fyllnadslampa.

Den här fill light-appen kan växla färg när man trycker på skärmen och justera ljusstyrkan med en reglagekontroll.

I det här exemplet kommer vi att lära oss `brightness` för att justera en vy:s ljusstyrka, `onTapGesture` för att lägga till en tryckgest på en vy och vykontrollen `Slider`.

Resultat:

![Color](../../Resource/018_color.png)

## Visa en färg

Först låter vi vyn visa en färg.

I SwiftUI representerar `Color` inte bara en färg, utan kan också visas som en vy:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Här representerar `Color.red` en röd vy. `.ignoresSafeArea()` gör att färgvyn fyller hela skärmen, så att den mer liknar en riktig fill light-effekt.

Resultat:

![Color](../../Resource/018_color1.png)

### Färgarray och index

Nu visas bara en färg, men en fill light har vanligtvis mer än en färg. Den kan också visa blått, gult, lila, vitt och andra färger.

Vi vill kunna växla mellan olika färger när man trycker på skärmen. Vi kan lägga dessa färger i en array för att hantera dem tillsammans:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

En array passar bra för att spara ”en grupp data av samma typ”. Här är varje element i arrayen en `Color`.

Om vi vill visa en viss färg kan vi använda ett index:

```swift
colors[0]
```

Det betyder att vi läser färgen vid index `0` i arrayen, alltså den första färgen.

Nu kan koden skrivas så här:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

På så sätt visar skärmen den första färgen i arrayen, alltså röd.

### Index styr färgen

Om vi behöver växla mellan olika färger behöver vi använda en variabel för att hantera indexet i stället för att hårdkoda indexet.

Vi kan använda `@State` för att deklarera en variabel som sparar indexet:

```swift
@State private var index = 0
```

Här representerar `index` indexet för den aktuella färgen.

När `index` ändras kommer SwiftUI att beräkna om gränssnittet och uppdatera det som visas.

Därefter ändrar vi det ursprungliga `colors[0]` till:

```swift
colors[index]
```

På så sätt bestäms färgen som visas i vyn av `index`.

Nu blir koden:

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

När `index` ändras kommer `colors[index]` också att visa en annan färg.

Till exempel:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Det är viktigt att tänka på att `index` inte får gå över arrayens största index, annars uppstår ett fel för index utanför intervallet.

## Tryckgest

Nu kan vi visa olika färger beroende på `index`, men vi kan ännu inte trycka för att växla.

I tidigare ”Citatkarusell” använde vi `Button` för att styra växlingen mellan citat.

Den här gången vill vi däremot växla färg genom att ”trycka på hela färgområdet”, så då passar `onTapGesture` bättre.

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

När vi trycker på färgvyn körs:

```swift
index += 1
```

Det betyder att `index` ökar med `1`. När indexet ökar visar `colors[index]` nästa färg i arrayen.

### onTapGesture

`onTapGesture` är en gestmodifierare som kan lägga till en tryckhandling på en vy.

Grundläggande användning:

```swift
.onTapGesture {
    // code
}
```

Till exempel:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

När man trycker på den här röda vyn körs koden i klamrarna och följande skrivs ut i konsolen:

```swift
Click color
```

Genom `onTapGesture` kan vi bestämma vad som ska hända när en vy trycks på.

### Skillnaden mot `Button`

Tidigare har vi lärt oss vyn `Button`. Både `Button` och `onTapGesture` kan hantera tryck, men deras användningsområden är inte helt samma.

`onTapGesture` passar bättre för att ”lägga till klickfunktion på en befintlig vy”, till exempel `Color`, `Image`, `Text` eller andra vanliga vyer.

`Button` passar bättre när man vill representera en tydlig knapp, som ”Bekräfta”, ”Skicka” eller ”Radera”.

I den här fill light-appen vill vi att färgväxlingen ska vara enklare, så vi kan använda `onTapGesture` för att växla färg genom att trycka på hela färgområdet.

## Problem med index

Nu kan vi trycka på skärmen för att växla mellan olika färger.

Men här finns ett viktigt problem: **indexet kan gå utanför arrayens intervall**.

Till exempel:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Om man fortsätter att trycka på skärmen kommer `index` till slut att bli `4`, och då uppstår ett fel för ”index out of range”.

Det beror på att arrayen `colors` har `4` element, men index börjar räknas från `0`, så giltiga index är `0 - 3`, inte `4`.

Om vi försöker läsa `colors[4]` uppstår ett fel för ”index utanför intervallet”.

I den nuvarande koden ökar `index` automatiskt med `1` varje gång vi trycker på skärmen. Om vi inte hanterar det kommer det förr eller senare att gå utanför intervallet.

Därför måste vi kontrollera indexet när skärmen trycks på: om det redan är den sista färgen går vi tillbaka till den första färgen, annars ökar vi vidare med `1`.

Det kan vi göra med en `if`-sats:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

I den här koden betyder `colors.count` antalet element i arrayen.

I den aktuella arrayen finns `4` färger, alltså:

```swift
colors.count // 4
```

Men det största indexet är inte `4`, utan `3`, eftersom index börjar från `0`.

Därför skriver vi det sista indexet som:

```swift
colors.count - 1
```

Det vill säga:

```swift
4 - 1 = 3
```

Den här logiken betyder att om indexet redan motsvarar den sista färgen återställs det till `0`, annars ökar det med `1`.

På så sätt kan färgerna växla i en loop.

### Förenkla indexet

Om vi vill göra koden mer kompakt kan vi också använda den ternära operatorn:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Den här koden betyder att om `index == colors.count - 1` är sant returneras `0`. Om det inte är sant returneras `index + 1`.

Till sist tilldelas resultatet tillbaka till `index`.

Nu kan vi få färgväxlingen att fungera.

Fullständig kod:

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

Nu kan vi trycka på skärmen och växla mellan olika färger, och en grundläggande fill light-app är klar.

## Visa färgnamn

Vi kan också lägga till en grupp texter som motsvarar färgerna, så att skärmen samtidigt visar namnet på den aktuella färgen när vi växlar.

Till exempel:

- visa `Red` när färgen är röd
- visa `Blue` när färgen är blå
- visa `Yellow` när färgen är gul
- visa `Purple` när färgen är lila

Här kan vi också använda en array för att spara färgnamnen:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Ordningen på texterna i arrayen ska motsvara ordningen i färgarrayen.

Sedan kan vi använda `Text` för att visa färgnamnet som motsvarar det aktuella indexet:

```swift
Text(colorsName[index])
```

`Text` visar det aktuella färgnamnet baserat på `index`.

Vi använder modifierare för att förbättra utseendet på `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

På så sätt visas `Text` i vitt, med stor titelstil och fet text.

Nu har vi en helskärmsvy av typen `Color`. Om vi vill att `Text` ska visas ovanpå `Color` måste vi använda layoutcontainern `ZStack`.

```swift
ZStack {
    Color
    Text
}
```

Då ändras koden till:

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

Nu är bakgrunden en färgvy och ovanpå den visas en textvy.

Resultat:

![Color](../../Resource/018_color2.png)

Det är viktigt att tänka på att i `ZStack` visas vyn som skrivs senare vanligtvis framför. Om `Text` skrivs före `Color` kan den senare `Color`-vyn täcka över texten.

## Styr ljusstyrkan

Nu kan vi växla mellan olika färger, men fill light har också en viktig funktion till: **att justera ljusstyrkan**.

I SwiftUI kan vi använda modifieraren `brightness` för att justera en vy:s ljusstyrka.

Till exempel:

```swift
.brightness(1)
```

Vi kan skriva så här:

```swift
colors[index]
    .brightness(0.5)
```

På så sätt blir den aktuella färgen ljusare och ser mer ut som en fill light-effekt.

`brightness` har intervallet `0 - 1`. `0` betyder att den ursprungliga färgen behålls. Ju närmare `1`, desto ljusare blir färgen, och `1` betyder maximal vit ljusstyrka.

Även om vi kan styra `brightness` i koden kan användaren ännu inte justera den själv.

Vi behöver lägga till en kontroll som går att dra: `Slider`.

## Reglagevyn Slider

I SwiftUI är `Slider` en reglagekontroll som används för att välja ett värde inom ett intervall. Apple beskriver den som ”en kontroll för att välja ett värde inom ett begränsat linjärt intervall”.

Grundläggande användning:

```swift
Slider(value: $value, in: 0...1)
```

Förklaring av parametrarna:

1. `value: $value`: `Slider` behöver bindas till en variabel.

    När reglaget dras ändras variabelns värde samtidigt. Omvänt gäller också att om variabeln ändras uppdateras reglaget.

    Det liknar `TextField` som vi lärt oss tidigare, eftersom båda bygger på att ”binda kontrollen till en variabel”.
    
    Framför den bundna variabeln måste vi lägga till symbolen `$` för att visa att det är en bindning.

2. `in: 0...1`: den här parametern anger reglagets värdeintervall.

    Här betyder `0...1` att det minsta värdet är `0` och det största är `1`.

    När reglaget dras längst till vänster blir den bundna variabeln nära `0`; när det dras längst till höger blir den nära `1`.

Till exempel:

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

`Slider` är bunden till variabeln `value`, så när reglaget flyttas ändras `value` samtidigt.

Utseende:

![Slider](../../Resource/018_slider.png)

När `Slider` står längst till vänster blir det bundna värdet `0`, och när det står längst till höger blir det `1`.

### Värdeintervall

Värdeintervallet för `Slider` är inte fast. Det kan också skrivas som:

```swift
0...100
```

eller något annat intervall.

Men i den här fill light-appen behöver vi kontrollera ljusstyrkan, så `0...1` passar bäst.

## Använd Slider för att styra ljusstyrkan

Nu ska vi koppla ihop `Slider` och `brightness`.

Först skapar vi en variabel för att spara ljusstyrkans värde:

```swift
@State private var slider = 0.0
```

Här är `0.0` ett värde av typen `Double`.

Eftersom `Slider` vanligtvis binds till ett numeriskt värde och vi vill att det ska kunna ändras kontinuerligt passar `Double` bättre. Dessutom tar `brightness` bara emot värden av typen `Double`.

Sedan skickar vi detta värde till `brightness`:

```swift
colors[index]
    .brightness(slider)
```

När `slider == 0` behåller färgen sitt standardläge. Ju närmare `slider` är `1`, desto ljusare ser färgen ut.

### Lägg till kontrollen Slider

Sedan lägger vi till en `Slider` som ändrar den här variabeln:

```swift
Slider(value: $slider, in: 0...1)
```

När reglaget ändras kommer `slider` också att ändras, och `brightness(slider)` justerar samtidigt ljusstyrkan.

Det här är ett väldigt typiskt exempel i SwiftUI på att ”variabler driver vyn”.

### Justera utseendet på Slider

Som standard använder `Slider` tillgängligt utrymme för sin bredd.

Vi kan ge den en fast bredd:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Sedan lägger vi till några modifierare så att den syns tydligare:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

På så sätt får reglaget en vit bakgrund och rundade hörn, så att det syns tydligare ovanpå `Color`-vyn.

Till sist placerar vi den längst ned på skärmen.

Eftersom vi redan använder `ZStack` kan vi lägga in en `VStack` i den och använda `Spacer()` för att trycka ner `Slider` till botten.

## Fullständig kod

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

Resultat:

![Color](../../Resource/018_color.png)

## Sammanfattning

Vi använde kunskaper vi lärt oss tidigare tillsammans med grundläggande kunskap om färger och arrayer för att bygga en mycket intressant fill light-app.

Genom den här fill light-appen lärde vi oss att använda `brightness` för att justera ljusstyrka, `onTapGesture` för att lägga till en tryckhandling på en vy och kontrollen `Slider`.

Vi lade till `onTapGesture` på vyn `Color` och implementerade funktionen för att växla färg. Genom `Slider` styr vi en variabel som hanterar `brightness`, vilket gör att vi kan justera färgens ljusstyrka. Detta är också ett exempel på att ”variabler driver vyn”.

Vi repeterade den ternära operatorn, använde `ZStack` för att stapla vyer och använde arrayer för att hantera en grupp data av samma typ. På så sätt fördjupar vi vår förståelse för arrayer och index, och tar i praktiken hänsyn till problemet med index utanför intervallet.

Det här exemplet är inte komplicerat, men det knyter ihop mycket av den grundläggande kunskap vi har lärt oss tidigare. När vi använder det i ett litet verkligt projekt blir det lättare att förstå vilken roll varje koncept spelar.

### Verkligt användningsscenario

Föreställ dig att du lägger en gammal iPhone på skrivbordet och använder din egen fill light-app för att styra färgen på ljuset. Det vore en mycket bra användarupplevelse.

I App Store finns det många ”fill light”-appar, och de ser inte heller särskilt komplicerade ut.

![AppStore](../../Resource/018_appStore.PNG)

Vi kan börja med att utveckla enkla appar och försöka publicera dem i App Store. Det ökar inte bara vårt intresse för utveckling, utan dokumenterar också vår utveckling över tid.

### Övning efter lektionen

Du kan fortsätta fundera på hur den här fill light-appen kan byggas ut, till exempel:

- lägga till fler färger
- visa det aktuella ljusstyrkevärdet
- förbättra designen för området med reglaget längst ned

När du verkligen börjar använda dessa grundkunskaper kommer du att upptäcka att varje sak vi lär oss faktiskt är ett verktyg för att bygga appar.
