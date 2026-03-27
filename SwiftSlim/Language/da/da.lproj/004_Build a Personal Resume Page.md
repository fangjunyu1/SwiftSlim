# Byg en personlig CV-side

I denne lektion skal vi lave en enkel personlig CV-visning og lære følgende:

- `cornerRadius`
- `spacing`
- `ScrollView`

Under opbygningen vil vi repetere viden om layout, `Text` og `Image`, og vi vil også implementere styring af afstand og effekten af rullende indhold.

## Personligt CV

Måleffekt:

![Swift](../../RESOURCE/004_img.png)

**Prøv først at lave den selv, før du læser forklaringen nedenfor videre.**

### Opret projekt

Opret et nyt iOS-projekt, eller fortsæt med det projekt, du allerede har brugt tidligere.

Standardkoden i `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Ryd nu koden, og begynd at skrive dit eget indhold:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Overordnet struktur

I rigtig udvikling starter vi som regel med at designe den overordnede struktur.

Vores side indeholder:

1. En titel
2. Personlige oplysninger
3. En personlig introduktion

Vi lægger en `VStack` helt yderst:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` sikrer, at visningerne arrangeres lodret, og den kan også styre rækkefølge og afstand mellem visningerne.

### Titel

Først opretter vi en `Text` til at vise titlen.

Her viser jeg titlen som mit eget engelske navn:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Titler bliver normalt større og mere fremhævede, så her bruger vi modifierne `font` og `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Layout

SwiftUIs standardjustering er `center`, så titlen vises nu midt i `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Vi vil have titlen vist øverst i visningen, og det kan vi opnå ved at bruge `Spacer` til at justere layoutet:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` optager den resterende plads og skubber `Text` op til toppen af containeren.

![Swift](../../RESOURCE/004_img4.png)

### Luft

Hvis du synes, teksten ligger for tæt på toppen, kan du bruge `padding` eller `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Det sætter den øverste `padding` for `VStack` til `20`.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Man kan også bruge `Spacer` og sætte en bestemt højde med `frame` for at få et tomrum med en fast højde.

Resultatet bliver:

![Swift](../../RESOURCE/004_img5.png)

### Billede

Vi forbereder et portrætbillede af os selv og lægger det i ressourcemappen `Assets`.

![Swift](../../RESOURCE/004_img6.png)

Vis derefter billedet i `ContentView` med `Image`:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Fordi billedets oprindelige størrelse er ret stor, skal vi bruge `frame` til at styre, hvordan det vises.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Så opdager vi et problem:

Hvis forholdet mellem bredde og højde i `frame` ikke matcher billedets oprindelige forhold, vil billedet blive forvrænget.

For eksempel:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

For at undgå at billedet bliver forvrænget, skal vi bruge `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Funktionen af `scaledToFit` er:

Inden for den givne `frame` bliver billedet skaleret i forhold til sine oprindelige proportioner og vist fuldt ud.

Det vil ikke tvinge billedet til at strække sig for at fylde hele `frame`, men bevarer bredde-højde-forholdet og skalerer proportionelt, indtil den ene side netop rammer kanten.

Det betyder:

- Hvis `frame`-bredden er mindre, skaleres billedet med bredden som reference
- Hvis `frame`-højden er mindre, skaleres billedet med højden som reference
- Billedet bevarer altid sine oprindelige proportioner og bliver ikke deformeret

Normalt kan man nøjes med at sætte størrelsen i én retning. For eksempel:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

På den måde vil systemet automatisk beregne en passende højde ud fra bredden `140`, samtidig med at billedets proportioner bevares.

Hvis man vil fastlåse det visuelle forhold eller undgå, at billedet bliver presset sammen i et mere komplekst layout, kan man begrænse både bredde og højde på samme tid.

### Afrundede hjørner

Hvis du vil have billedet vist med afrundede hjørner, kan du bruge modifieren `cornerRadius`:

```swift
.cornerRadius(10)
```

For eksempel:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Tilføj `cornerRadius(20)` efter billedets modifiers.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` betyder, at visningens kanter bliver klippet og forsynet med en radius på `20`.

Efter at afrundede hjørner er tilføjet, bliver billedets fire hjørner buede, hvilket giver et blødere og mere moderne visuelt udtryk.

Denne designstil er meget almindelig i moderne interface-design. For eksempel bruger iOS-appikoner også afrundede rektangler, selv om systemikoner bruger en superellipse med kontinuerlig kurve i stedet for helt simple afrundede hjørner.

### Personlige oplysninger

Nu skal vi implementere området med personlige oplysninger til venstre for billedet. Ud fra interface-strukturen kan vi se, at de personlige oplysninger og billedet ligger vandret ved siden af hinanden, så vi skal bruge `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Indholdet af de personlige oplysninger er arrangeret lodret.

![Swift](../../RESOURCE/004_img11.png)

Derfor bruger vi `HStack` yderst, `VStack` til de personlige oplysninger og `Text` til selve tekstindholdet.

Grundstruktur:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Gør felttitler fede**

For at skelne mellem feltnavn og feltværdi kan vi bruge `fontWeight` på feltnavnene:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Venstrejustér teksten**

`VStack` er som standard centreret. Hvis vi vil have al tekst venstrejusteret, skal vi sætte justeringen:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` betyder justering mod venstre side i et sprogmiljø, der læser fra venstre mod højre.

![Swift](../../RESOURCE/004_img14.png)

### Afstand

Hvis vi vil have en fast afstand mellem de personlige oplysninger og billedet, har vi tidligere lært at bruge `Spacer` til tomrum:

```swift
Spacer()
    .frame(width: 10)
```

Vi kan også bruge parameteren `spacing` i `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` betyder, at afstanden mellem de to underliggende visninger er `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**Hvad er spacing?**

I `VStack`, `HStack` og `ZStack` kan `spacing` kontrollere afstanden mellem underliggende visninger.

For eksempel:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Afstanden mellem underliggende visninger i `VStack` bliver sat til `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Det er vigtigt at bemærke, at `spacing` kun virker på direkte underliggende visninger og ikke påvirker layoutet inde i indlejrede containere.

**Kontrollér afstand inde i listen**

Hvis vi vil tilføje afstand mellem felterne, er den mest direkte metode at sætte `spacing` på `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Så bliver afstanden mellem alle underliggende visninger `10 pt`.

Men hvis vi ser på interfacet, opdager vi et problem:

Der er nu afstand mellem feltgrupperne, men der er også samme afstand mellem feltnavn og feltværdi.

Det skyldes, at `spacing` virker på alle direkte underliggende visninger i den aktuelle container.

I denne struktur er hver `Text` en direkte underliggende visning af den ydre `VStack`, så afstanden bliver ensartet.

Hvis vi vil have afstand mellem feltgrupperne, men lade feltnavn og feltværdi beholde deres kompakte standardafstand, kan vi betragte "feltnavn + feltværdi" som en logisk enhed og pakke den ind i en ekstra `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

På dette tidspunkt bliver strukturen sådan, at der er afstand mellem de ydre `VStack`s, mens de indre `VStack`s bruger standard kompakt afstand. Derfor opstår der ikke ekstra mellemrum mellem feltnavn og feltværdi.

![Swift](../../RESOURCE/004_img18.png)

### Personlig introduktion

Nu implementerer vi området med den personlige introduktion.

Set ud fra interface-strukturen består introduktionen af flere linjer tekst, og teksten er arrangeret lodret.

![Swift](../../RESOURCE/004_img19.png)

Derfor kan vi bruge `VStack` sammen med `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Øg afstanden**

Nu ligger den personlige informationsdel og introduktionsdelen forholdsvis tæt, og stilen er ikke særlig pæn.

![Swift](../../RESOURCE/004_img20.png)

Fordi de begge ligger i samme ydre container, kan vi styre den samlede afstand på den ydre container:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Effekten bliver:

![Swift](../../RESOURCE/004_img21.png)

**Afstand i listen**

Brug `spacing` til at sætte afstand mellem linjerne i den personlige introduktion:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Færdiggør det personlige CV

Nu er den grundlæggende struktur i vores personlige CV færdig.

![Swift](../../RESOURCE/004_img.png)

### ScrollView

Lige nu bruger siden `VStack`. Det fungerer fint, når der kun er få introduktionstekster, men hvis vi øger det til 20, 30 eller endnu flere linjer, vil indholdets højde overstige skærmen.

For eksempel:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Så vil der opstå to fænomener:

- Indholdet nederst bliver skåret af
- Siden kan ikke rulle

Det er ikke et problem med `VStack`. `VStack` er bare en layoutcontainer og giver ikke automatisk mulighed for rulning.

**Hvad er ScrollView**

`ScrollView` er en scrollbar container, som er velegnet til større mængder indhold, der overstiger skærmstørrelsen, for eksempel lodrette eller vandrette lister.

Grundstruktur:

```swift
ScrollView {
    ...
}
```

Hvis vi vil opnå rulleeffekt, skal vi pakke hele sidens indhold ind i `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

På den måde bliver hele siden et område, der kan rulles. Når indholdet overstiger skærmens højde, kan man rulle naturligt.

`ScrollView` viser som standard en scrollbarindikator. Hvis du vil skjule den, kan du sætte:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Fuld kode

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
