# Een persoonlijke cv-pagina bouwen

In deze les maken we een eenvoudige persoonlijke cv-weergave en leren we de volgende kennispunten:

- cornerRadius
- spacing
- ScrollView

Tijdens het bouwen herhalen we lay-outs, Text en Image, en realiseren we afstandscontrole en scrollende inhoud.

## Persoonlijk cv

Doeleffect:

![Swift](../../RESOURCE/004_img.png)

**Probeer het eerst zelfstandig te maken voordat je verdergaat met de uitleg hieronder.**

### Een project aanmaken

Maak een nieuw iOS-project aan, of gebruik het project van eerder verder.

De standaard ContentView-code:

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

Maak de code nu leeg en begin je eigen inhoud te schrijven:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Algemene structuur

In echte ontwikkeling ontwerpen we meestal eerst de algemene structuur.

Onze pagina bevat:

1. Titel
2. Persoonlijke informatie
3. Persoonlijke introductie

We voegen aan de buitenste laag een VStack toe:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack zorgt ervoor dat views verticaal worden gerangschikt, en kan ook de plaatsing en afstand tussen views regelen.

### Titel

Eerst maken we een Text om de titel weer te geven.

Hier toon ik mijn Engelse naam als titel:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Een titel is meestal groter en vetgedrukt. Hier gebruiken we de modifiers font en fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Opmaak

De standaard uitlijning van SwiftUI is center, dus de titel verschijnt in het midden van ContentView.

![Swift](../../RESOURCE/004_img3.png)

We moeten de titel bovenaan de view plaatsen. Daarvoor kunnen we Spacer gebruiken om de lay-out aan te passen:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer neemt de resterende ruimte in en duwt Text naar de bovenkant van de container.

![Swift](../../RESOURCE/004_img4.png)

### Witruimte

Als je vindt dat de tekst te dicht bij de bovenkant staat, kun je padding of Spacer gebruiken.

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

Stel de bovenste padding van VStack in op 20.

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

Je kunt ook Spacer gebruiken en met frame een vaste hoogte instellen om witruimte van een bepaalde hoogte te krijgen.

Resultaat:

![Swift](../../RESOURCE/004_img5.png)

### Afbeelding

We bereiden een profielfoto voor en plaatsen die in de map Assets.

![Swift](../../RESOURCE/004_img6.png)

In ContentView gebruiken we Image om de afbeelding weer te geven:

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

Omdat de originele afbeelding vrij groot is, moeten we frame gebruiken om de weergegeven grootte te regelen.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Dan merken we een probleem op:

Als de breedte-hoogteverhouding van frame niet overeenkomt met de oorspronkelijke verhouding van de afbeelding, vervormt de afbeelding.

Bijvoorbeeld:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Om vervorming te voorkomen, moeten we scaledToFit gebruiken:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

De functie van scaledToFit is:

Binnen het opgegeven frame wordt de afbeelding geschaald volgens de oorspronkelijke verhouding en volledig weergegeven.

De afbeelding wordt niet geforceerd uitgerekt om het hele frame te vullen, maar behoudt de breedte-hoogteverhouding en schaalt gelijkmatig totdat één zijde precies tegen de rand past.

Dat betekent:

* Als de breedte van het frame kleiner is, wordt de afbeelding geschaald op basis van de breedte.
* Als de hoogte van het frame kleiner is, wordt de afbeelding geschaald op basis van de hoogte.
* De afbeelding behoudt altijd de oorspronkelijke verhouding en vervormt niet.

Meestal kun je één richting instellen. Bijvoorbeeld:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Op deze manier berekent het systeem automatisch een geschikte hoogte op basis van de breedte 140, terwijl de beeldverhouding behouden blijft.

Als je een vaste visuele verhouding nodig hebt of wilt voorkomen dat de afbeelding in een complexe lay-out wordt samengedrukt, kun je zowel breedte als hoogte beperken.

### Afgeronde hoeken

Als je de afbeelding met afgeronde hoeken wilt weergeven, kun je de modifier cornerRadius gebruiken:

```swift
.cornerRadius(10)
```

Bijvoorbeeld:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Voeg cornerRadius(20) toe achter de modifiers van Image.

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) betekent dat de rand van de view wordt bijgesneden en een afgeronde hoekstraal van 20 krijgt.

Na het toevoegen van afgeronde hoeken worden de vier hoeken van de afbeelding boogvormig, wat het visuele effect zachter en moderner maakt.

Deze ontwerpstijl is erg gebruikelijk in hedendaagse interfaceontwerpen. Zo gebruiken de app-iconen van iOS ook een afgeronde rechthoekige vorm (al gebruiken systeempictogrammen een superellips met doorlopende kromming, en niet simpelweg gewone afgeronde hoeken).

### Persoonlijke informatie

Nu beginnen we met het maken van het gedeelte met persoonlijke informatie links van de afbeelding. Vanuit de interfacestructuur is te zien dat de persoonlijke informatie en de afbeelding horizontaal zijn gerangschikt, dus moeten we HStack gebruiken.

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

De inhoud van de persoonlijke informatie is verticaal gerangschikt.

![Swift](../../RESOURCE/004_img11.png)

Daarom gebruiken we buitenaan HStack, voor de persoonlijke informatie een VStack, en voor de tekstinhoud Text.

Basisstructuur:

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

**Veldtitels vet maken**

Om veldnamen en veldwaarden van elkaar te onderscheiden, kun je fontWeight gebruiken voor de veldnamen:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Tekst links uitlijnen**

VStack is standaard gecentreerd. Als je wilt dat alle tekst links wordt uitgelijnd, moet je de uitlijning instellen:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading betekent uitlijnen aan de linkerkant (in een taalomgeving van links naar rechts).

![Swift](../../RESOURCE/004_img14.png)

### Afstand

Als je een vaste afstand tussen de persoonlijke informatie en de afbeelding wilt behouden, hebben we eerder Spacer gebruikt om witruimte te maken:

```swift
Spacer()
    .frame(width: 10)
```

Je kunt ook de parameter spacing van HStack gebruiken:

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

spacing: 30 betekent dat de afstand tussen twee subviews 30 pt is.

![Swift](../../RESOURCE/004_img15.png)

**Wat is spacing?**

In VStack, HStack en ZStack kan spacing worden gebruikt om de afstand tussen subviews te regelen.

Bijvoorbeeld:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

De afstand tussen de subviews in VStack wordt ingesteld op 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Let erop dat spacing alleen werkt op de "directe subviews" en geen invloed heeft op de lay-out binnen geneste containers.

**Afstand binnen de lijst regelen**

Als je meer afstand tussen de velden wilt, is de eenvoudigste manier om spacing op VStack te zetten:

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

Zo wordt de afstand tussen alle subviews 10 pt.

Maar als je de interface bekijkt, zie je een probleem:

Er is afstand tussen de veldgroepen, maar ook tussen de veldnaam en de veldwaarde verschijnt dezelfde afstand.

Dat komt doordat spacing werkt op alle directe subviews van de huidige container.

In deze structuur is elke Text een directe subview van de buitenste VStack, dus de afstand is overal gelijk.

Als je afstand wilt tussen de veldgroepen, maar de veldnaam en veldwaarde compact bij elkaar wilt houden, kun je "veldnaam + veldwaarde" als één logische eenheid zien en deze in een aparte VStack plaatsen:

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

Nu heeft de structuur afstand tussen de buitenste VStacks, terwijl de binnenste VStacks de standaard compacte afstand behouden. Daarom ontstaat er geen extra ruimte tussen de veldnaam en de veldwaarde.

![Swift](../../RESOURCE/004_img18.png)

### Persoonlijke introductie

Vervolgens maken we het gedeelte voor de persoonlijke introductie.

Vanuit de interfacestructuur bestaat de introductie uit meerdere regels tekst, en de tekst is verticaal gerangschikt.

![Swift](../../RESOURCE/004_img19.png)

Daarom kun je VStack samen met Text gebruiken:

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

**Meer afstand toevoegen**

Nu staan de persoonlijke informatie en de persoonlijke introductie vrij dicht op elkaar, en de stijl is niet erg mooi.

![Swift](../../RESOURCE/004_img20.png)

Omdat ze zich allebei in dezelfde buitenste container bevinden, kunnen we de totale afstand regelen via die buitenste container:

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

Resultaat:

![Swift](../../RESOURCE/004_img21.png)

**Lijstafstand**

Gebruik spacing om de afstand tussen de regels van de persoonlijke introductie in te stellen:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Het persoonlijke cv afronden

Nu is het basisframe van ons persoonlijke cv klaar.

![Swift](../../RESOURCE/004_img.png)

### Scrollende view

Op dit moment gebruikt de paginastructuur VStack. Als het aantal regels in de introductie klein is, is dat geen probleem, maar als je er 20, 30 of nog meer toevoegt, zal de hoogte van de inhoud buiten het scherm vallen.

Bijvoorbeeld:

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

Dan treden er twee verschijnselen op:

* De inhoud onderaan wordt afgekapt
* De pagina kan niet scrollen

Dit is geen probleem van VStack. VStack is slechts een lay-outcontainer en biedt niet automatisch scrollfunctionaliteit.

**Wat is ScrollView**

ScrollView is een scrollbare container, geschikt voor grote hoeveelheden inhoud die buiten het schermformaat vallen. Bijvoorbeeld verticale of horizontale lijsten.

Basisstructuur:

```swift
ScrollView {
    ...
}
```

Als je een scrolleffect wilt bereiken, moet je de volledige pagina-inhoud in ScrollView plaatsen:

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

Zo wordt de hele pagina een scrollbaar gebied. Wanneer de inhoud hoger is dan het scherm, kun je natuurlijk scrollen.

ScrollView toont standaard een scrollbar-indicator. Als je die wilt verbergen, kun je dit instellen:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Volledige code

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
