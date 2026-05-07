# Forstå visninger

I denne lektion vender vi tilbage til det oprindelige `ContentView`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hej, verden!")
    }
}
```

Da vi første gang stiftede bekendtskab med SwiftUI, var der mange nøgleord i `ContentView`, som vi ikke forstod.

For eksempel `struct`, `View`, `var`, `body`, `some View` og andre nøgleord.

Dengang vidste vi måske kun dette: **hvis vi skriver kode inde i `body`, bliver indholdet vist på brugerfladen.**

Nu har vi lært om `struct`, variabler, metoder og protokoller, så vi kan forstå denne kode igen og dermed bedre forstå forholdet mellem visninger i SwiftUI.

## Gense ContentView

Efter at have oprettet et SwiftUI-projekt genererer Xcode som standard en `ContentView`-fil.

Eksempelkoden er:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hej, verden!")
        }
        .padding()
    }
}
```

Denne kode kan forstås ved at dele den op i flere dele.

Først:

```swift
import SwiftUI
```

Denne linje betyder, at SwiftUI-frameworket importeres.

Efter at have importeret SwiftUI kan vi bruge SwiftUI-visninger som `View`, `Text`, `Image`, `VStack`, `Button` og så videre.

## ContentView-strukturen

Denne kodelinje betyder, at der oprettes en struktur:

```swift
struct ContentView: View
```

Heraf:

```swift
struct ContentView
```

betyder, at `ContentView` er en struktur.

I den forrige lektion lærte vi om `struct`-strukturen. Den kan kombinere forskellige relaterede felter og kan indeholde egenskaber og metoder.

For eksempel:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hej, verden!")
    }
}
```

I dette eksempel indeholder `ContentView` tre ting: `name`, `printName` og `body`.

Det vil sige, at `struct` kan samle relaterede egenskaber, metoder og visningsindhold.

![contentView](../../Resource/023_contentVIew.png)

## View er en protokol

Lad os fortsætte med at se på denne kodelinje:

```swift
struct ContentView: View 
```

`View` efter kolonet betyder: `ContentView` følger protokollen `View`.

Det kan forstås sådan, at hvis `ContentView` vil være en SwiftUI-visning, skal den opfylde kravene i protokollen `View`.

### Identifiable-protokollen

Da vi tidligere lærte om filmlisten, stiftede vi bekendtskab med protokollen `Identifiable`.

Dengang skulle vi gennemløbe et `Movie`-array i `ForEach`, men `Movie`-strukturen havde ikke en unik identifikator og understøttede derfor ikke gennemløb med `ForEach`.

På det tidspunkt skulle vi lade `Movie`-strukturen følge protokollen `Identifiable`, så den opfyldte `ForEach`'s krav om en unik identifikator.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Protokollen `Identifiable` kræver: **at denne type har et `id`-felt, der identificerer den.**

Når `Movie` leverer et `id`-felt, kan den opfylde kravet fra `Identifiable`.

Når vi bruger den i `ForEach`, kan SwiftUI derfor genkende hver enkelt datapost.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View-protokollen

Det samme gælder for protokollen `View`.

Hvis en type vil være en SwiftUI-visning, skal den følge protokollen `View`.

Og det vigtigste krav i protokollen `View` er at levere en `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hej, verden!")
    }
}
```

Kravet i protokollen `View` kan forstås sådan: **den accepterer kun den SwiftUI-visning, som `body` returnerer, og `ContentView` viser en SwiftUI-visning gennem `body`.**

### Hvad sker der, hvis man ikke følger View?

Hvis vi skriver sådan:

```swift
struct ContentView {
}
```

er det bare en almindelig struktur, ikke en SwiftUI-visning.

Den giver ikke direkte en fejl, fordi en almindelig struktur i sig selv er gyldig Swift-kode.

Men hvis vi placerer den i preview:

```swift
#Preview {
    ContentView()
}
```

så opstår der en fejl.

Årsagen er: **preview skal vise en SwiftUI-visning, men denne `ContentView` følger ikke protokollen `View`.**

Derfor skal vi, hvis vi ønsker at `ContentView` kan vises på brugerfladen, lade den følge protokollen `View`:

```swift
struct ContentView: View {
}
```

Samtidig skal vi levere `body` i henhold til kravet i protokollen `View`; hvis der ikke er nogen `body`, vil compileren stadig give en fejl.

Korrekt skrivemåde:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hej, verden!")
    }
}
```

På dette tidspunkt er `ContentView` en rigtig SwiftUI-visning, der kan vises.

## body er indgangen til visningens indhold

I SwiftUI er `body` indgangen til visningens indhold.

```swift
var body: some View {
    Text("Hej, verden!")
}
```

Her kan den deles op i tre dele:

**1. var body**

```swift
var body
```

Det betyder, at der defineres en variabel med navnet `body`.

**2. some View**

```swift
: some View
```

Det betyder, at denne `body` returnerer en visning.

**3. { ... }**

```swift
{
    Text("Hej, verden!")
}
```

Det repræsenterer det viste visningsindhold. I denne kode vises en `Text`-visning.

Med andre ord: det, vi skriver inde i `body`, er det, der vises på brugerfladen.

For eksempel:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Navn:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Denne kode betyder: **på brugerfladen vises indhold ordnet lodret, og indeni er der to tekster.**

### Navnet body kan ikke ændres vilkårligt

Det er vigtigt at bemærke, at navnet `body` ikke kan ændres vilkårligt.

Hvis vi skriver det sådan:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hej, verden!")
    }
}
```

Selvom denne `content` også er en visningsegenskab, kan den ikke erstatte `body`.

Fordi det navn, som protokollen `View` kræver, er netop `body`.

## Hvad er some View?

I SwiftUI betyder `some View`, at der returneres en konkret visning, men uden at vi behøver skrive den fulde type for visningen.

```swift
var body: some View
```

Det vil sige, `some View` betyder ikke, at der ikke findes en type. Den rigtige type findes stadig, og compileren kender denne type, men typen kan være meget kompleks, så Swift lader os bruge `some View` til at skjule den.

### Hvad er some?

I Swift er `some` et nøgleord til at erklære en uigennemsigtig type (opaque type).

En uigennemsigtig type betyder: **returværdien har en konkret type, compileren ved, hvilken konkret type det er, men vi skriver ikke denne type direkte.**

For eksempel:

```swift
func makeView() -> some View {
    Text("Hej")
}
```

Det betyder, at `makeView` returnerer en konkret type, der følger protokollen `View`.

### Hvorfor har vi brug for some?

Da vi lærte om variabler, fandt vi ud af: **værdier i Swift skal enten have typen angivet eksplicit, eller også skal compileren automatisk udlede typen.**

For eksempel:

```swift
let a: Int = 10
```

Her er konstanten `a` af typen `Int`.

SwiftUI-visninger er ingen undtagelse. Når vi bruger `body` til at vise en SwiftUI-visning, skal `body` returnere den tilsvarende SwiftUI-type.

Hvis vi for eksempel bruger `body` til at vise en tekstvisning `Text`, skal `body` returnere den tilsvarende `Text`-type.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

I dette eksempel er det, der vises inde i `body`, en `Text`-visning, og returtypen er også `Text`.

Kun når den indre type og den erklærede type stemmer overens, opfylder det compilerens krav om typeoverensstemmelse.

**Problem med typeuoverensstemmelse**

Hvis vi sætter typen for `body` til `Color`, men viser `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

så stemmer typen for `body` og typen for den indre kode ikke overens, hvilket udløser en typeuoverensstemmelsesfejl.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

På dette tidspunkt skal vi manuelt ændre returtypen for `body`.

**Komplekse visningstyper**

I praktisk udvikling består brugerfladen normalt ikke kun af én `Text`.

Hvis vi skal vise en mere kompleks `VStack`, skal vi manuelt angive en kompleks returtype.

For eksempel:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hej, verden!")
    }
}
```

Denne kode betyder, at der returneres en `VStack`, og inde i `VStack` er der visninger af typerne `Image` og `Text`.

Returtypen for `body` er:

```swift
VStack<TupleView<(Image,Text)>>
```

Vi kan se, at denne returtype er meget kompleks, og at der også er kommet en `TupleView`, som vi ikke har set før.

Her kan `TupleView` forstås som: **at flere undervisinger pakkes ind som én visning.**

**Endnu mere komplekse visningstyper**

Hvis vi tilføjer modifiers til visningen:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hej, verden!")
    }
    .padding()
}
```

så bliver returtypen for denne visning meget kompleks og kan ikke beskrives konkret her.

Den eksisterende returtype `VStack<TupleView<(Image,Text)>>` kan ikke længere beskrive modifierne, og derfor opstår der en fejl.

**some View forenkler returtypen**

Til denne situation giver SwiftUI en enkel løsning, nemlig at bruge `some View` til at forenkle skrivemåden.

Når vi ændrer `body` til typen `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hej, verden!")
    }
    .padding()
}
```

behøver vi ikke længere skrive den fulde returtype, hver gang vi ændrer visningskoden.

Det skyldes, at `some View` betyder, at der returneres en konkret visning, som følger protokollen `View`.

Med andre ord: SwiftUI-visninger som `VStack`, `Image` osv. er alle visninger, der følger protokollen `View`. Efter at der er tilføjet modifiers, følger den returnerede visningstype stadig protokollen `View`.

Derfor kan de alle returneres som `some View`.

### some View kan ikke vilkårligt returnere hvilken som helst visning

Selvom `some View` kan skjule komplekse typer, er den ikke "uden type".

Dens kerneprincip er: **compileren skal kunne bestemme én konkret returtype**.

For eksempel:

```swift
var title: some View {
    Text("Hej")
}
```

Her returneres en `Text`-visning.

Men hvis vi forsøger at returnere to visninger, opstår der en fejl:

```swift
var title: some View {
    Text("Hej")
    Image(systemName: "star")
}
```

Fordi `some View` i sidste ende skal returnere én visningsstruktur, mens vi her forsøger at returnere to uafhængige visninger.

### Løsning

Der er normalt to løsninger: container og `@ViewBuilder`.

**1. Pakke ind med en container**

```swift
var title: some View {
    VStack {
        Text("Hej")
        Image(systemName: "star")
    }
}
```

I denne kode returnerer `title` en `VStack`, mens `Text` og `Image` er undervisinger inde i `VStack`.

Den visningsstruktur, som `some View` modtager, er en `VStack<...>`, og dermed opfylder den `some View`'s krav om at returnere én visningsstruktur. 

Det er også grunden til, at vi helt fra starten af SwiftUI anbefaler at bruge en `VStack`-container yderst til at pakke visningskoden ind.

**2. Bruge @ViewBuilder**

Vi kan også tilføje modifieren `@ViewBuilder` foran `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Hej")
    Image(systemName: "star")
}
```

`@ViewBuilder` kan kombinere flere visninger til ét returresultat.

I sin kerne samler den stadig flere visninger til én visning for at opfylde `some View`'s krav om at returnere én visningsstruktur.

### Hvorfor kan body skrive flere visninger direkte?

Hvis vi skriver flere visninger i `var body`, for eksempel:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hej, verden!")
}
```

vil sådan en `body` i nogle tilfælde ikke give fejl.

Årsagen er, at `body` i protokollen `View` som standard understøtter `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

I kildekoden til protokollen `View` kan vi se, at `@ViewBuilder` allerede dekorerer variablen `body`.

Derfor har `body` et ekstra særligt behandlingslag i forhold til almindelig `some View`, så SwiftUI automatisk hjælper os med at kombinere flere visninger til én visning.

**Det anbefales at bruge containere**

For at gøre det lettere for begyndere at forstå, anbefales det først at bruge containere som `VStack`, `HStack`, `ZStack`, `Group` til at organisere flere visninger.

For eksempel:

```swift
var body: some View {
    VStack {
        Text("Hej")
        Image(systemName: "star")
    }
}
```

Så er koden mere intuitiv: **det yderste lag er en `VStack`, og indeni ligger der to undervisinger.**

## Opdeling af visningen

Hvis brugerfladen er relativt enkel, kan vi skrive al koden i `body`.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Velkommen til Qinote")
                Text("Godmorgen")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Tryk på mig") {
                print("Tryk på mig ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Denne visnings udseende:

![view](../../Resource/023_view1.png)

Denne kode kan køre normalt, men hvis visningskoden er meget kompleks, bliver koden i `body` længere og længere, og læsning og ændring bliver stadig sværere.

På dette tidspunkt kan vi opdele forskellige områder i uafhængige visningsegenskaber.

### Opdeling af den øverste visning

For eksempel kan vi udskille det øverste område:

```swift
var topHome: some View {
    HStack {
        Text("Hjem")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Her er `topHome` en variabel, der returnerer en visning.

Fordi den returnerer en visning, kan typen skrives som:

```swift
some View
```

Det er faktisk samme brug som `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Begge bruger variabler til at vise visninger, og returtypen er `some View`.

### Opdeling af andre visninger

Derefter kan vi fortsætte med at opdele andre dele:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Velkommen til Qinote")
        Text("Godmorgen")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Tryk på mig") {
        print("Tryk på mig")
    }
    .buttonStyle(.borderedProminent)
}
```

Efter opdelingen kan visningsvariablerne placeres i `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Hjem")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Velkommen til Qinote")
            Text("Godmorgen")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Tryk på mig") {
            print("Tryk på mig")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Nu er `body` kun ansvarlig for at beskrive sidens struktur:

```swift
topBar
welcomeText
colorList
clickButton
```

Den konkrete implementering af hver del ligger i de tilsvarende egenskaber nedenfor.

Denne måde at opdele visningen på kan gøre sidestrukturen tydeligere. Hvert visningsområde har sit eget navn, og læsningen bliver mere intuitiv.

Når vi ændrer en bestemt del af koden, kan vi direkte finde det tilsvarende visningsområde i stedet for at lede i en bunke kompleks kode.

### some View returnerer én visning

I denne opdelte visning, hvis vi forsøger at returnere flere visninger:

```swift
var topBar: some View {
    Text("Hjem")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

opstår der en fejl, fordi `some View` kun kan returnere én visningsstruktur.

I modsætning til `body` har almindelige beregnede egenskaber som standard ikke `@ViewBuilder`.

Derfor kan vi, hvis vi skal returnere flere visninger, bruge en `VStack`, `HStack` eller `Group`-container til at kombinere flere visninger til én.

```swift
var topBar: some View {
    VStack {
        Text("Hjem")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Eller tilføje `@ViewBuilder` for at kombinere visningerne:

```swift
@ViewBuilder
var topBar: some View {
    Text("Hjem")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

På den måde kan vi returnere flere visninger.

### if returnerer flere visninger

For eksempel:

```swift
var topHome: some View {
    if step == "Hjem" {
        HStack {
            Text("Hjem")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Ingen")
    }
}
```

I denne kode returnerer `topHome` ud fra indholdet af `step` to forskellige visningstyper: `HStack` eller `Text`.

Fordi `some View` har brug for én bestemt konkret returtype, kan de to grene af `if` i en almindelig beregnet egenskab ikke direkte returnere forskellige typer visninger, og derfor opstår der en fejl.

**Løsningen er stadig at pakke ind med en container eller bruge `@ViewBuilder`.**

### Hvorfor bruger opdelte visninger ikke parenteser?

Når vi bruger de opdelte visningsegenskaber i `body`, skriver vi direkte:

```swift
topBar
welcomeText
colorList
clickButton
```

og ikke:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Det skyldes, at `topBar`, `welcomeText`, `colorList` og `clickButton` er variabler. Disse variabler er faktisk beregnede egenskaber, ikke metoder.

**Egenskaber kræver ikke parenteser.**

Hvis vi skriver det som en metode, kan vi også opnå en lignende effekt:

```swift
func topBar() -> some View {
    HStack {
        Text("Hjem")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Denne kode kan også opnå en lignende effekt. Når denne metode kaldes, returnerer den en visning.

Ved brug skal den skrives som:

```swift
topBar()
```

I SwiftUI er det mere almindeligt at bruge en beregnet egenskab, hvis man blot opdeler en visning, der ikke skal have parametre.

```swift
var topBar: some View { ... }
```

## Indlejrede visninger

Ud over at dele kode op i egenskaber kan vi også oprette nye visningsstrukturer.

For eksempel:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Denne `PinkColorView` er ligesom `ContentView` en uafhængig SwiftUI-visning.

Hvis vi skal vise den i `ContentView`, kan vi tilføje `()` efter visningens navn.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Her:

```swift
PinkColorView()
```

betyder det at oprette en instans af `PinkColorView`.

Fordi `PinkColorView` følger protokollen `View`, kan den ligesom `Text`, `Image` og `Button` placeres i andre visninger og vises.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Dette er indlejring af visninger: én visning kan vises inde i en anden visning.

## Visningsegenskab eller ny visning?

Når visningskoden er relativt enkel, er det normalt ikke nødvendigt at dele koden op. Kun når koden bliver mere kompleks, anbefales det at opdele visningen.

### Situationer til brug af visningsegenskaber

Hvis det kun er en lille del af indholdet i den aktuelle visning, kan man bruge en visningsegenskab.

For eksempel:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Dette indhold bruges normalt kun i den aktuelle visning.

### Situationer til at oprette en ny visning

Hvis dette indhold er relativt uafhængigt, eller det senere kan genbruges på flere sider, er det mere passende at oprette en ny visning.

For eksempel:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Dette er en titelvisning. Hvis vi vil bruge denne visning som en generel komponent og genbruge den i andre visninger.

Kan vi oprette en ny visning:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Derefter bruger vi den andre steder:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

På dette tidspunkt er denne visning en uafhængig genbrugelig komponent.

Det kan kort opsummeres sådan:

- Indholdsområder i den aktuelle visning kan bruge `var xxx: some View`
- Uafhængige genbrugelige komponenter kan oprette en ny `struct XxxView: View`
- Komponenter, der skal have data overført, egner sig normalt bedre som nye visninger.

## Opsummering

I denne lektion har vi igen forstået den mest grundlæggende, men også vigtigste, visningsstruktur i SwiftUI.

`ContentView` er en struktur, der defineres med `struct`, og som bruges til at organisere kode relateret til siden.

`View` er en protokol. Hvis en struktur vil være en SwiftUI-visning, skal den følge protokollen `View`.

`body` er det indhold, som protokollen `View` kræver, at vi leverer, og det afgør, hvad denne visning viser.

`some View` betyder, at der returneres en bestemt konkret visning, uden at vi behøver skrive dens komplekse fulde type.

Når visningskoden bliver lang, kan vi bruge `var xxx: some View` til at dele visningskoden op i flere små områder.

Når en del af indholdet er relativt uafhængig eller skal genbruges, kan vi oprette en ny visningsstruktur og vise den i andre visninger med `XxxView()`.

Kort sagt er SwiftUI's brugerflade sammensat af individuelle visninger, der kombineres. Én side kan indeholde flere små visninger, og en lille visning kan også indeholde andre visninger.
