# Bygg en personlig profilsida

I den här lektionen ska vi skapa en enkel personlig profilvy och lära oss följande:

- cornerRadius
- spacing
- ScrollView

Under arbetets gång kommer vi att repetera layout, Text och Image samt skapa effekter för avståndskontroll och rullning av innehåll.

## Personlig profil

Måleffekt:

![Swift](../../RESOURCE/004_img.png)

**Försök gärna först att bygga detta själv innan du fortsätter med genomgången nedan.**

### Skapa projekt

Skapa ett nytt iOS-projekt, eller fortsätt använda projektet från tidigare.

Standardkoden i ContentView:

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
````

Rensa nu koden och börja skriva ditt eget innehåll:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Övergripande struktur

I verklig utveckling brukar vi först planera den övergripande strukturen.

Vår sida innehåller:

1. Titel
2. Personlig information
3. Personlig introduktion

Vi lägger till en VStack ytterst:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack ser till att vyerna ordnas vertikalt och kan samtidigt styra vyernas ordning och avstånd.

### Titel

Först skapar vi en Text för att visa titeln.

Här använder jag mitt engelska namn som titel:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Titlar brukar vanligtvis göras större och fetare, så här använder vi modifierarna font och fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Layout

SwiftUIs standardjustering är center, så nu visas titeln i mitten av ContentView.

![Swift](../../RESOURCE/004_img3.png)

Vi behöver flytta titeln till toppen av vyn, och det kan vi göra med Spacer för att justera layouten:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer tar upp återstående utrymme och trycker Text uppåt i containern.

![Swift](../../RESOURCE/004_img4.png)

### Tomt utrymme

Om du tycker att texten ligger för nära toppen kan du använda padding eller Spacer.

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

Här sätts den övre marginalen för VStack till 20.

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

Det går också att använda Spacer och ange höjden med frame för att få ett tomt utrymme med bestämd höjd.

Resultat:

![Swift](../../RESOURCE/004_img5.png)

### Bild

Vi förbereder ett porträttfoto och lägger det i resursmappen Assets.

![Swift](../../RESOURCE/004_img6.png)

Visa bilden i ContentView med Image:

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

Eftersom bildens originalstorlek är ganska stor behöver vi använda frame för att styra visningsstorleken.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Nu upptäcker vi ett problem:

Om förhållandet mellan bredd och höjd i frame inte stämmer överens med bildens ursprungliga proportioner kommer bilden att förvrängas.

Till exempel:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

För att undvika att bilden förvrängs behöver vi använda scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

scaledToFit betyder:

inom den angivna frame-storleken skalas bilden proportionellt efter sina ursprungliga proportioner och hela bildinnehållet visas.

Den sträcker alltså inte bilden för att fylla hela frame, utan behåller bildens bredd-höjd-förhållande och skalar den tills en av sidorna precis når kanten.

Det betyder:

* Om frame har liten bredd används bredden som referens för skalning.
* Om frame har liten höjd används höjden som referens för skalning.
* Bilden behåller alltid sina ursprungliga proportioner och förvrängs inte.

Vanligtvis räcker det att ange storleken i en riktning. Till exempel:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

På så sätt räknar systemet automatiskt ut en lämplig höjd utifrån bredden 140 samtidigt som bildens proportioner bevaras.

Om du behöver en fast visuell proportion eller vill undvika att bilden trycks ihop i mer komplex layout kan du begränsa både bredd och höjd.

### Rundade hörn

Om du vill visa bilden med rundade hörn kan du använda modifieraren cornerRadius:

```swift
.cornerRadius(10)
```

Till exempel:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Lägg till cornerRadius(20) efter bildens modifierare.

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) betyder att vygränsen klipps och att en hörnradie på 20 används.

När rundade hörn har lagts till blir bildens fyra hörn bågformade, vilket ger ett mjukare och mer modernt visuellt intryck.

Denna designstil är mycket vanlig i dagens gränssnitt. Till exempel använder iOS-appikoner rundade rektanglar som form, även om systemikoner i praktiken använder en superellips med kontinuerlig kurvatur och inte en enkel hörnavrundning.

### Personlig information

Nu börjar vi bygga området med personlig information till vänster om bilden. Av gränssnittets struktur ser vi att den personliga informationen och bilden ligger horisontellt, så vi behöver använda HStack.

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

Innehållet i den personliga informationen är vertikalt ordnat.

![Swift](../../RESOURCE/004_img11.png)

Därför använder vi HStack ytterst, VStack för den personliga informationen och Text för textinnehållet.

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

**Fetmarkera fälttitlar**

För att skilja fältnamn från fältvärden kan vi använda fontWeight på fältnamnen:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Vänsterjustera text**

VStack är som standard centrerad. Om vi vill att all text ska vara vänsterjusterad behöver vi ange justeringen:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading betyder justering mot vänster sida i språk som läses från vänster till höger.

![Swift](../../RESOURCE/004_img14.png)

### Avstånd

Om du vill ha ett fast avstånd mellan den personliga informationen och bilden har vi tidigare lärt oss att använda Spacer för tomt utrymme:

```swift
Spacer()
    .frame(width: 10)
```

Det går också att använda parametern spacing i HStack:

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

spacing: 30 betyder att avståndet mellan de två undervyerna är 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Vad är spacing?**

I VStack, HStack och ZStack kan spacing styra avståndet mellan undervyer.

Till exempel:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Avståndet mellan undervyerna i VStack sätts då till 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Det är viktigt att notera att spacing bara påverkar "direkta undervyer" och inte layouten inuti nästlade containrar.

**Styra avståndet inuti en lista**

Om du vill öka avståndet mellan fälten är det enklaste sättet att sätta spacing på VStack:

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

Då blir avståndet mellan alla undervyer 10 pt.

Men när vi tittar på gränssnittet märker vi ett problem:

Det finns avstånd mellan fältgrupperna, men också samma avstånd mellan fältnamn och fältvärde.

Detta beror på att spacing påverkar alla direkta undervyer i den aktuella containern.

I denna struktur är varje Text en direkt undervy till den yttre VStack, och därför blir avståndet enhetligt.

Om du vill ha avstånd mellan fältgrupperna men låta fältnamn och fältvärde behålla ett kompakt standardavstånd kan du se "fältnamn + fältvärde" som en logisk helhet och lägga dem i en egen VStack:

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

Då blir strukturen sådan att det finns avstånd mellan de yttre VStack-grupperna, medan de inre VStack-grupperna använder det kompakta standardavståndet. Därmed uppstår inget extra tomrum mellan fältnamn och fältvärde.

![Swift](../../RESOURCE/004_img18.png)

### Personlig introduktion

Nu går vi vidare till att skapa området för personlig introduktion.

Sett till gränssnittets struktur består introduktionen av flera textrader som är vertikalt ordnade.

![Swift](../../RESOURCE/004_img19.png)

Därför kan vi använda VStack tillsammans med Text:

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

**Öka avståndet**

Nu känns delen med personlig information och den personliga introduktionen ganska kompakt, och utseendet är inte särskilt snyggt.

![Swift](../../RESOURCE/004_img20.png)

Eftersom de båda ligger i samma yttre container kan vi styra det övergripande avståndet där:

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

**Avstånd i listan**

Använd spacing för att styra avståndet mellan raderna i den personliga introduktionen:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Färdig personlig profil

Nu är grundstrukturen för vår personliga profilsida klar.

![Swift](../../RESOURCE/004_img.png)

### Scrollvy

Just nu använder sidstrukturen VStack. När introduktionstexten är kort fungerar det bra, men om den ökar till 20 rader, 30 rader eller ännu fler kommer innehållets höjd att överskrida skärmen.

Till exempel:

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

Då uppstår två fenomen:

* Innehållet längst ner kapas av
* Sidan går inte att rulla

Detta är inte ett problem med VStack. VStack är bara en layoutcontainer och ger inte automatiskt stöd för rullning.

**Vad är ScrollView**

ScrollView är en rullbar container som passar bra för stora mängder innehåll som överskrider skärmens storlek, till exempel vertikala eller horisontella listor.

Grundstruktur:

```swift
ScrollView {
    ...
}
```

Om du vill skapa en rullningseffekt måste du omsluta hela sidans innehåll med ScrollView:

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

På så sätt blir hela sidan ett rullbart område. När innehållet överstiger skärmens höjd kan sidan rullas naturligt.

ScrollView visar som standard en indikator för rullningslisten. Om du vill dölja den kan du ange:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Fullständig kod

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
