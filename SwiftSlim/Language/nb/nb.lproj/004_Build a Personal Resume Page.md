# Bygg en personlig CV-side

I denne leksjonen skal vi lage en enkel personlig CV-visning, og lære følgende:

- `cornerRadius`
- `spacing`
- `ScrollView`

Under byggingen skal vi repetere kunnskap om layout, `Text` og `Image`，og samtidig lage effekter for avstandskontroll og rullbart innhold.

## Personlig CV

Måleffekt:

![Swift](../../RESOURCE/004_img.png)

**Prøv først å lage dette selv, og fortsett deretter med forklaringen under.**

### Opprett prosjekt

Opprett et nytt iOS-prosjekt, eller fortsett å bruke det tidligere prosjektet.

Standardkoden i `ContentView`：

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

Tøm nå koden og begynn å skrive ditt eget innhold:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Helhetsstruktur

I faktisk utvikling designer vi som regel først den overordnede strukturen.

Siden vår inneholder:

1. en tittel
2. personlig informasjon
3. en personlig introduksjon

Vi legger først til en `VStack` ytterst:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` sørger for at visningene sorteres vertikalt, og kan samtidig kontrollere rekkefølge og avstand.

### Tittel

Først oppretter vi en `Text` som viser tittelen.

Her bruker jeg mitt engelske navn som tittel:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Titler er vanligvis større og fetere, så her bruker vi modifikatorene `font` og `fontWeight`：

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Oppsett

Standardjusteringen i SwiftUI er `center`，så nå vises tittelen midt i `ContentView`。

![Swift](../../RESOURCE/004_img3.png)

Vi vil vise tittelen øverst i visningen, og kan bruke `Spacer` til å justere layouten:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` vil oppta den gjenværende plassen og skyve `Text` oppover i beholderen.

![Swift](../../RESOURCE/004_img4.png)

### Luft

Hvis du synes teksten ligger for nær toppen, kan du bruke `padding` eller `Spacer`。

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Dette setter toppmargen til `20` for `VStack`。

**2. `Spacer`**

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

Du kan også bruke `Spacer` og sette høyden med `frame` for å få et tomrom med fast høyde.

Resultat:

![Swift](../../RESOURCE/004_img5.png)

### Bilde

Vi forbereder et portrettbilde av oss selv og legger det i ressursmappen `Assets`。

![Swift](../../RESOURCE/004_img6.png)

Bruk `Image` i `ContentView` for å vise bildet:

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

Siden originalstørrelsen på bildet er ganske stor, må vi bruke `frame` for å kontrollere visningsstørrelsen.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Da vil vi oppdage et problem:

Hvis forholdet mellom bredde og høyde i `frame` ikke stemmer med originalbildets forhold, vil bildet bli deformert.

For eksempel:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

For å unngå at bildet blir deformert, må vi bruke `scaledToFit`：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Funksjonen til `scaledToFit` er:

Innenfor den angitte `frame`-størrelsen skaleres bildet i henhold til sine opprinnelige proporsjoner, og hele bildet vises.

Det vil ikke tvinge bildet til å strekkes for å fylle hele `frame`，men beholder forholdet mellom bredde og høyde og skalerer proporsjonalt til én side akkurat treffer kanten.

Det betyr:

- Hvis bredden i `frame` er liten, skaleres bildet med utgangspunkt i bredden.
- Hvis høyden i `frame` er liten, skaleres bildet med utgangspunkt i høyden.
- Bildet beholder alltid sine opprinnelige proporsjoner og blir ikke deformert.

Vanligvis holder det å sette størrelsen i én retning. For eksempel:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Da vil systemet automatisk beregne passende høyde ut fra bredden `140`，samtidig som proporsjonene beholdes.

Hvis du trenger et fast visuelt forhold eller vil unngå at bildet presses sammen i en mer kompleks layout, kan du også begrense både bredde og høyde samtidig.

### Runde hjørner

Hvis du vil vise bildet med avrundede hjørner, kan du bruke modifikatoren `cornerRadius`：

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

Legg til `cornerRadius(20)` etter modifikatorene til `Image`。

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` betyr at grensene til visningen klippes og får en hjørneradius på `20`。

Etter at runde hjørner er lagt til, blir de fire hjørnene på bildet til buer, noe som gjør det visuelle uttrykket mykere og mer moderne.

Denne designstilen er svært vanlig i dagens grensesnittdesign. For eksempel bruker iOS-appikoner formen avrundet rektangel（selv om systemikonene bruker en kontinuerlig superellipse, og ikke bare en enkel hjørnerunding）。

### Personlig informasjon

Nå begynner vi å lage området med personlig informasjon til venstre for bildet. Ut fra grensesnittstrukturen kan vi se at informasjonen og bildet er arrangert horisontalt, så vi må bruke `HStack`。

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

Innholdet i den personlige informasjonen er arrangert vertikalt.

![Swift](../../RESOURCE/004_img11.png)

Derfor bruker vi `HStack` ytterst, `VStack` for den personlige informasjonen, og `Text` for tekstinnholdet.

Grunnstruktur:

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

**Gjør felttitlene fete**

For å skille feltnavn fra feltverdier kan vi bruke `fontWeight` på feltnavnet:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Venstrejuster tekst**

`VStack` er sentrert som standard. Hvis vi vil at all tekst skal være venstrejustert, må vi angi justeringen:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` betyr justert mot venstre side（i språk som skrives fra venstre til høyre）。

![Swift](../../RESOURCE/004_img14.png)

### Avstand

Hvis vi vil beholde en fast avstand mellom den personlige informasjonen og bildet, har vi tidligere lært å bruke `Spacer` for å lage luft:

```swift
Spacer()
    .frame(width: 10)
```

Vi kan også bruke parameteren `spacing` i `HStack`：

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

`spacing: 30` betyr at avstanden mellom de to underliggende visningene er `30 pt`。

![Swift](../../RESOURCE/004_img15.png)

**Hva er `spacing`?**

I `VStack`、`HStack` og `ZStack` kan `spacing` kontrollere avstanden mellom underliggende visninger.

For eksempel:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Da settes avstanden mellom de underliggende visningene i `VStack` til `10 pt`。

![Swift](../../RESOURCE/004_img16.png)

Merk at `spacing` bare virker på “direkte underliggende visninger”, og påvirker ikke layouten inne i nestede beholdere.

**Kontroller avstanden inne i listen**

Hvis vi vil øke avstanden mellom feltene, er den mest direkte måten å sette `spacing` på `VStack`：

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

Da blir avstanden mellom alle underliggende visninger `10 pt`。

Men hvis vi ser på grensesnittet, vil vi oppdage et problem:

Det blir avstand både mellom feltgruppene og mellom feltnavnet og feltverdien.

Dette er fordi `spacing` virker på alle direkte underliggende visninger i den aktuelle beholderen.

I denne strukturen er hver `Text` en direkte underliggende visning i den ytre `VStack`，så avstanden blir lik overalt.

Hvis vi vil ha avstand mellom feltgruppene, men beholde den vanlige tette avstanden mellom feltnavn og feltverdi, kan vi behandle “feltnavn + feltverdi” som én logisk enhet og pakke den inn i en egen `VStack`：

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

Da blir strukturen slik at de ytre `VStack`-ene har avstand mellom seg, mens de indre `VStack`-ene beholder standard tett avstand, og derfor blir det ingen ekstra åpning mellom feltnavnet og feltverdien.

![Swift](../../RESOURCE/004_img18.png)

### Personlig introduksjon

Deretter lager vi området for den personlige introduksjonen.

Ut fra grensesnittstrukturen kan vi se at introduksjonsinnholdet består av flere tekstlinjer, og tekstene er arrangert vertikalt.

![Swift](../../RESOURCE/004_img19.png)

Derfor kan vi bruke `VStack` sammen med `Text`：

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

**Øk avstanden**

Nå ligger den personlige informasjonen og introduksjonen ganske tett, og stilen ser ikke særlig pen ut.

![Swift](../../RESOURCE/004_img20.png)

Siden de begge ligger i samme ytre beholder, kan vi styre den overordnede avstanden på den ytre beholderen:

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

Resultat:

![Swift](../../RESOURCE/004_img21.png)

**Listeavstand**

Bruk `spacing` for å angi avstanden mellom tekstlinjene i introduksjonen:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Fullfør den personlige CV-en

Nå er grunnstrukturen i den personlige CV-siden vår ferdig.

![Swift](../../RESOURCE/004_img.png)

### Rullevisning

Nå bruker sideoppsettet `VStack`，og det fungerer fint når det er få introduksjonstekster. Men hvis vi øker det til 20, 30 eller enda flere linjer, vil høyden på innholdet overstige skjermen.

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

Da oppstår to ting:

- innholdet nederst blir avkuttet
- siden kan ikke rulles

Dette er ikke et problem med `VStack`。`VStack` er bare en layoutbeholder og gir ikke automatisk rullefunksjon.

**Hva er `ScrollView`**

`ScrollView` er en rullbar beholder, og passer til mye innhold som overskrider skjermstørrelsen, for eksempel vertikale eller horisontale lister.

Grunnstruktur:

```swift
ScrollView {
    ...
}
```

Hvis vi vil lage en rulleeffekt, må vi pakke hele sideinnholdet inn i `ScrollView`：

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

Da blir hele siden et rullbart område, og når innholdet overstiger skjermhøyden, kan siden rulles naturlig.

`ScrollView` viser som standard en indikator for rulling. Hvis du vil skjule den, kan du sette:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Fullstendig kode

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
