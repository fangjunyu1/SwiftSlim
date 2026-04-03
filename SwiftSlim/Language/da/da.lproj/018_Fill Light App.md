# Fill Light-app

I denne lektion skal vi bygge en meget sjov fill light-app. Når natten falder på, kan vi lade telefonens skærm vise forskellige farver og bruge den som et enkelt fill light.

Denne fill light-app kan skifte farver ved at trykke på skærmen, og den kan også justere lysstyrken med en skyder.

I dette eksempel lærer vi at bruge `brightness` til at justere en views lysstyrke, `onTapGesture` til at tilføje en trykgestus til et view og kontrollen `Slider`.

Resultat:

![Color](../../Resource/018_color.png)

## Vis en farve

Først skal vi lade viewet vise en farve.

I SwiftUI repræsenterer `Color` ikke kun en farve, men kan også vises som et view:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Her repræsenterer `Color.red` et rødt view. `.ignoresSafeArea()` får farvevisningen til at fylde hele skærmen, så det ligner mere en rigtig fill light-effekt.

Resultat:

![Color](../../Resource/018_color1.png)

### Farvearray og indeks

Lige nu vises der kun én farve. Men et fill light har normalt mere end én farve. Det kan også vise blå, gul, lilla, hvid og andre farver.

Vi vil gerne skifte mellem forskellige farver, når der trykkes på skærmen. Vi kan lægge disse farver i et array for at styre dem samlet:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Et array er velegnet til at gemme "en gruppe data af samme type". Her er hvert element i arrayet en `Color`.

Hvis vi vil vise en bestemt farve, kan vi bruge et indeks:

```swift
colors[0]
```

Det betyder at læse farven ved indeks `0` i arrayet, altså den første farve.

Nu kan koden skrives sådan:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

På den måde viser skærmen den første farve i arrayet, som er rød.

### Brug af indeks til at styre farven

Hvis vi skal skifte mellem forskellige farver, har vi brug for en variabel til at styre indekset i stedet for at skrive indekset fast.

Vi kan bruge `@State` til at deklarere en variabel, der gemmer indekset:

```swift
@State private var index = 0
```

Her repræsenterer `index` indekset for den aktuelle farve.

Når `index` ændrer sig, beregner SwiftUI interfacet igen og opdaterer det viste indhold.

Derefter ændrer vi den oprindelige `colors[0]` til:

```swift
colors[index]
```

På den måde bestemmes farven, der vises i viewet, af `index`.

Nu bliver koden til:

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

Når `index` ændrer sig, vil `colors[index]` også vise en anden farve.

For eksempel:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Det er vigtigt at bemærke, at `index` ikke må overstige arrayets største indeks, ellers opstår der en fejl med indeks uden for området.

## Trykgestus

Nu kan vi vise forskellige farver baseret på `index`, men vi kan endnu ikke trykke for at skifte farve.

I den tidligere lektion "Quote Carousel" brugte vi `Button` til at styre skiftet mellem citater.

Denne gang vil vi dog gerne "trykke på hele farveområdet" for at skifte farve, så `onTapGesture` passer bedre.

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

Når vi trykker på farvevisningen, bliver denne kode udført:

```swift
index += 1
```

Det betyder, at `index` øges med `1`. Når indekset øges, vil `colors[index]` vise den næste farve i arrayet.

### `onTapGesture`

`onTapGesture` er en gestusmodifikator, der tilføjer en trykhandling til et view.

Grundlæggende brug:

```swift
.onTapGesture {
    // code
}
```

For eksempel:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Når der trykkes på dette røde view, udføres koden i klammerne, og dette vises i konsollen:

```swift
Click color
```

Med `onTapGesture` kan vi definere, hvad der skal ske, når der trykkes på et view.

### Forskel fra `Button`

Tidligere lærte vi om viewet `Button`. Både `Button` og `onTapGesture` kan håndtere trykhandlinger, men deres brugsscenarier er ikke helt de samme.

`onTapGesture` er mere velegnet til "at tilføje trykfunktionalitet til et eksisterende view", såsom `Color`, `Image`, `Text` eller et andet almindeligt view.

`Button` er mere velegnet, når vi vil repræsentere en tydelig knap som "Bekræft", "Send" eller "Slet".

I denne fill light-app ønsker vi, at farveskiftet skal være mere enkelt. Når hele farveområdet skifter farve ved tryk, er `onTapGesture` et godt valg her.

## Problemet med indeks

Nu kan vi trykke på skærmen for at skifte mellem forskellige farver.

Men der er et vigtigt problem her: **indekset kan gå ud over arrayets område**.

For eksempel:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Hvis vi bliver ved med at trykke på skærmen, vil `index` til sidst blive `4`, og så opstår der en fejl med "index out of range".

Det skyldes, at arrayet `colors` har `4` elementer, men indekseringen starter fra `0`, så det gyldige indeksområde er `0 - 3`, ikke `4`.

Hvis vi forsøger at læse `colors[4]`, opstår der en fejl med "index out of range".

I den nuværende kode øger hvert tryk `index` med `1`. Hvis vi ikke håndterer det, vil det til sidst gå uden for det gyldige område.

Derfor skal vi kontrollere indekset, når der trykkes på skærmen: hvis det allerede er den sidste farve, går vi tilbage til den første farve, ellers fortsætter vi med at lægge `1` til.

Vi kan gøre det med en `if`-sætning:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

I denne kode betyder `colors.count` antallet af elementer i arrayet.

Der er 4 farver i det aktuelle array, så:

```swift
colors.count // 4
```

Men det største indeks er ikke `4`, det er `3`, fordi indekseringen starter fra `0`.

Derfor skal det sidste indeks skrives som:

```swift
colors.count - 1
```

Det vil sige:

```swift
4 - 1 = 3
```

Denne logik betyder: hvis det aktuelle indeks allerede svarer til den sidste farve, så nulstil indekset til `0`; ellers øges det med `1`.

På den måde kan farverne skifte i en løkke.

### Forenkling af indekslogikken

Hvis vi vil gøre koden mere kortfattet, kan vi også bruge den ternære operator:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Denne kode betyder: hvis `index == colors.count - 1` er sandt, så returnér `0`. Ellers returnér `index + 1`.

Til sidst tildeles resultatet tilbage til `index`.

Nu kan vi opnå effekten med farveskift.

Komplet kode:

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

Nu kan vi trykke på skærmen og skifte mellem forskellige farver. En grundlæggende fill light-app er færdig.

## Vis farvens navn

Vi kan tilføje en anden gruppe tekst, der svarer til farverne, så når farven ændres, vises også navnet på den aktuelle farve på skærmen.

For eksempel:

- Rød viser `Red`
- Blå viser `Blue`
- Gul viser `Yellow`
- Lilla viser `Purple`

Her kan vi også bruge et array til at gemme farvenavnene:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Rækkefølgen af teksten i dette array skal svare præcist til rækkefølgen af farverne i farvearrayet.

Derefter kan vi bruge `Text` til at vise farvenavnet for det aktuelle indeks:

```swift
Text(colorsName[index])
```

`Text` viser det aktuelle farvenavn i forhold til `index`.

Brug modifikatorer til at forbedre udseendet af `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Dette får `Text` til at vises i hvidt, med titelstørrelse og fed skrift.

Nu har vi et `Color`-view i fuld skærm. Hvis vi vil have `Text` til at vises oven på `Color`-viewet, skal vi bruge layoutcontaineren `ZStack` til at lægge dem oven på hinanden.

```swift
ZStack {
    Color
    Text
}
```

Så bliver koden til:

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

På denne måde er baggrunden farvevisningen, og en tekstvisning lægges ovenpå.

Resultat:

![Color](../../Resource/018_color2.png)

Det er vigtigt at bemærke, at i en `ZStack` vises views, der skrives senere, normalt foran. Hvis `Text` skrives før `Color`, kan det senere `Color`-view dække `Text`.

## Styring af lysstyrke

Nu kan vi skifte mellem forskellige farver, men et fill light har en anden vigtig funktion: **justering af lysstyrke**.

I SwiftUI kan vi bruge modifikatoren `brightness` til at justere et views lysstyrke.

For eksempel:

```swift
.brightness(1)
```

Vi kan skrive:

```swift
colors[index]
    .brightness(0.5)
```

Dette gør den aktuelle farve lysere og tættere på effekten af et fill light.

Lysstyrkeområdet er `0 - 1`. `0` betyder at beholde den oprindelige farve, og jo tættere værdien er på `1`, desto lysere bliver farven. `1` betyder det lyseste hvide resultat.

Selvom vi kan styre `brightness` i koden, kan brugeren stadig ikke justere det direkte.

Derfor skal vi tilføje en kontrol, der kan trækkes: `Slider`.

## `Slider`-view

I SwiftUI er `Slider` en kontrol, der bruges til at vælge en værdi inden for et område. Apple beskriver den som "en kontrol til at vælge en værdi fra et afgrænset lineært område".

Grundlæggende brug:

```swift
Slider(value: $value, in: 0...1)
```

Forklaring af parametre:

1. `value: $value`: `Slider` skal bindes til en variabel.

    Når skyderen trækkes, ændres variablens værdi samtidig. Omvendt, hvis variablen ændrer sig, opdateres skyderen også.

    Dette minder meget om den `TextField`, vi lærte tidligere. Begge "binder en kontrol til en variabel".

    En bundet variabel skal have symbolet `$` foran sig for at repræsentere en binding.

2. `in: 0...1`: Denne parameter repræsenterer værdiområdet for skyderen.

    Her betyder `0...1`, at minimumsværdien er `0`, og maksimumsværdien er `1`.

    Når skyderen trækkes helt til venstre, er den bundne variabel tæt på `0`; når den trækkes helt til højre, er den tæt på `1`.

For eksempel:

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

`Slider` er bundet til variablen `value`. Når skyderen trækkes, ændres værdien af `value` samtidig.

Udseende:

![Slider](../../Resource/018_slider.png)

Når `Slider` flyttes til venstre, bliver den bundne værdi `value` til `0`. Når den flyttes til højre, bliver den til `1`.

### Værdiområde

Værdiområdet for `Slider` er ikke fast. Det kan også skrives som:

```swift
0...100
```

eller et andet område.

Men i denne fill light-app skal vi styre lysstyrken, så `0...1` er det mest passende valg.

## Brug af `Slider` til at styre lysstyrke

Nu skal vi forbinde `Slider` med `brightness`.

Først opretter vi en variabel til at gemme lysstyrkeværdien:

```swift
@State private var slider = 0.0
```

Her er `0.0` en værdi af typen `Double`.

Da `Slider` normalt bindes til en numerisk type, og vi her ønsker, at den skal ændre sig kontinuerligt, er `Double` mere passende. Derudover kan `brightness` kun tage en værdi af typen `Double`.

Derefter sender vi denne værdi ind i `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Når `slider == 0`, forbliver farven i sin standardtilstand. Jo tættere `slider` er på `1`, desto lysere ser farven ud.

### Tilføj `Slider`-kontrollen

Tilføj derefter en `Slider`-kontrol for at ændre denne variabel:

```swift
Slider(value: $slider, in: 0...1)
```

Når skyderen ændrer sig, ændres værdien af `slider` også, og `brightness(slider)` opdaterer lysstyrken samtidig.

Dette er et meget typisk eksempel på, at "variabler driver viewet" i SwiftUI.

### Justering af udseendet på `Slider`

Som standard bruger `Slider` den tilgængelige bredde.

Vi kan give den en fast bredde:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Derefter tilføjer vi nogle flere modifikatorer for at gøre den lettere at se:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Dette giver skyderen en hvid baggrund og afrundede hjørner, så den træder tydeligere frem oven på `Color`-viewet.

Til sidst placerer vi den nederst på skærmen.

Da vi allerede bruger `ZStack`, kan vi placere en `VStack` inde i den og bruge `Spacer()` til at skubbe `Slider` ned i bunden.

## Komplet kode

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

## Opsummering

Ved at bruge den viden, vi lærte tidligere, sammen med grundlæggende begreber som farver og arrays, har vi bygget en meget interessant fill light-app.

Gennem denne fill light-app lærte vi at bruge `brightness` til at justere lysstyrke, `onTapGesture` til at tilføje trykhandlinger til views og kontrollen `Slider`.

Vi tilføjede `onTapGesture` til `Color`-viewet for at skifte farver. Vi brugte også `Slider`-kontrollen til at ændre en variabel, der styrer `brightness`, hvilket er et andet eksempel på, at "variabler driver viewet".

Vi gennemgik også den ternære operator, brugte `ZStack` til at lægge views oven på hinanden og brugte arrays til at styre en gruppe data af samme type. Dette hjælper med at uddybe vores forståelse af arrays og indekser, inklusive det praktiske problem med at undgå fejl med indeks uden for området.

Selvom dette eksempel ikke er kompliceret, forbinder det mange af de grundlæggende idéer, vi har lært før. Når de kombineres i et lille virkeligt projekt, bliver det lettere at forstå, hvad hvert begreb bruges til.

### Virkeligt brugsscenarie

Forestil dig at stille en gammel iPhone på bordet og bruge den fill light-app, du selv har udviklet, til at styre lysets farve. Det ville være en meget god oplevelse.

Der findes mange "fill light"-apps i App Store, og de ser heller ikke særlig komplicerede ud.

![AppStore](../../Resource/018_appStore.PNG)

Vi kan begynde at udvikle simple apps og forsøge at udgive dem i App Store. Det øger ikke kun vores interesse for udvikling, men dokumenterer også vores vækst.

### Øvelse efter lektionen

Du kan fortsætte med at tænke over måder at udvide denne fill light-app på, for eksempel:

- Tilføje flere farver
- Vise den aktuelle lysstyrkeværdi
- Forbedre designet af området med skyderen i bunden

Når du virkelig tager denne viden i brug, vil du opdage, at hvert begreb, vi lærer, faktisk er et værktøj til at bygge apps.

Jo flere værktøjer vi mestrer, desto flere funktioner kan vi skabe.
