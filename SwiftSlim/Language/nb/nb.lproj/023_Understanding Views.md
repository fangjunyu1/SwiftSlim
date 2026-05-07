# Forstå views

I denne leksjonen vender vi tilbake til den opprinnelige `ContentView`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, verden!")
    }
}
```

Da vi første gang ble kjent med SwiftUI, var det mange nøkkelord i `ContentView`, som vi ikke forsto.

For eksempelet `struct`, `View`, `var`, `body`, `some View` og andre nøkkelord.

Den gangen visste vi kanskje kun dette: **hvis vi skriver kode inne i `body`, blir innholdet vist på grensesnittet.**

Nå har vi lært om `struct`, variabler, metoder og protokolller, så vi kan forstå denne koden på nytt og dermed bedre forstå forholdet mellom views i SwiftUI.

## Gå gjennom ContentView

Etter å ha opprettet et SwiftUI-prosjekt genererer Xcode som standard en `ContentView`-fil.

Eksempelkoden er:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hei, verden!")
        }
        .padding()
    }
}
```

Denne koden kan forstås ved å dele den opp i flere deler.

Først:

```swift
import SwiftUI
```

Denne linjen betyr, at SwiftUI-frameworket importeres.

Etter å ha importert SwiftUI kan vi bruke SwiftUI-views som `View`, `Text`, `Image`, `VStack`, `Button` og så videre.

## ContentView-strukturen

Denne kodelinjen betyr, at det opprettes en struktur:

```swift
struct ContentView: View
```

Her:

```swift
struct ContentView
```

betyr, at `ContentView` er en struktur.

I forrige leksjonen lærte vi om `struct`-strukturen. Den kan kombinere ulike relaterte felter og kan inneholde egenskaper og metoder.

For eksempelet:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hei, verden!")
    }
}
```

I dette eksempelet inneholder `ContentView` tre ting: `name`, `printName` og `body`.

Det vil si, at `struct` kan samle relaterte egenskaper, metoder og view-innhold.

![contentView](../../Resource/023_contentVIew.png)

## View er en protokoll

La oss fortsette med at se på denne kodelinje:

```swift
struct ContentView: View 
```

`View` efter kolonet betyr: `ContentView` følger protokollen `View`.

Det kan forstås slik, at hvis `ContentView` vil være en SwiftUI-view, skal den opfylde kravene i protokollen `View`.

### Identifiable-protokollen

Da vi tidligere lærte om filmlisten, stiftede vi bekendtskab med protokollen `Identifiable`.

Den gangen skulle vi gå gjennom et `Movie`-array i `ForEach`, men `Movie`-strukturen hadde ikke en unik identifikator og støttet derfor ikke gjennomgang med `ForEach`.

På det tidspunkt skulle vi lade `Movie`-strukturen følge protokollen `Identifiable`, så den opfyldte `ForEach`'s krav om en unik identifikator.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Protokollen `Identifiable` krever: **at denne type har et `id`-felt, som identificerer den.**

Når `Movie` leverer et `id`-felt, kan den opfylde kravet fra `Identifiable`.

Når vi bruker den i `ForEach`, kan SwiftUI derfor genkende hver enkelt datapost.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View-protokollen

Det samme gælder for protokollen `View`.

Hvis en type vil være en SwiftUI-view, skal den følge protokollen `View`.

Og det vigtigste krav i protokollen `View` er at levere en `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, verden!")
    }
}
```

Kravet i protokollen `View` kan forstås slik: **den accepterer kun den SwiftUI-view, som `body` returnerer, og `ContentView` viser en SwiftUI-view gjennom `body`.**

### Hva skjer det, hvis man ikke følger View?

Hvis vi skriver slik:

```swift
struct ContentView {
}
```

er det bare en vanlig struktur, ikke en SwiftUI-view.

Den giver ikke direkte en feil, fordi en vanlig struktur i sig selv er gyldig Swift-kode.

Men hvis vi placerer den i preview:

```swift
#Preview {
    ContentView()
}
```

så oppstår det en feil.

Årsagen er: **preview skal vise en SwiftUI-view, men denne `ContentView` følger ikke protokollen `View`.**

Derfor skal vi, hvis vi ønskjer at `ContentView` kan vises på grensesnittet, lade den følge protokollen `View`:

```swift
struct ContentView: View {
}
```

Samtidig skal vi levere `body` i henhold til kravet i protokollen `View`; hvis det ikke er nogen `body`, vil kompilatoren stadig gi en feil.

Korrekt skrivemåde:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, verden!")
    }
}
```

På dette tidspunktet er `ContentView` en rigtig SwiftUI-view, som kan vises.

## body er indgangen til viewens innhold

I SwiftUI er `body` indgangen til viewens innhold.

```swift
var body: some View {
    Text("Hei, verden!")
}
```

Her kan den deles opp i tre dele:

**1. var body**

```swift
var body
```

Det betyr, at det defineres en variabel med navnet `body`.

**2. some View**

```swift
: some View
```

Det betyr, at denne `body` returnerer en view.

**3. { ... }**

```swift
{
    Text("Hei, verden!")
}
```

Det repræsenterer det viste view-innhold. I denne kode vises en `Text`-view.

Med andre ord: det, vi skriver inne i `body`, er det, som vises på grensesnittet.

For eksempelet:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Navn:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Denne koden betyr: **på grensesnittet vises innhold ordnet vertikalt, og inni er det to tekster.**

### Navnet body kan ikke ændres vilkårligt

Det er vigtigt at bemærke, at navnet `body` ikke kan ændres vilkårligt.

Hvis vi skriver det slik:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hei, verden!")
    }
}
```

Selvom denne `content` også er en viewsegenskab, kan den ikke erstatte `body`.

Fordi det navn, som protokollen `View` krever, er netop `body`.

## Hva er some View?

I SwiftUI betyr `some View`, at det returneres en konkret view, men uten at vi behøver skrive den fulle type for viewen.

```swift
var body: some View
```

Det vil si, `some View` betyr ikke, at det ikke finnes en type. Den virkelige type finnes stadig, og kompilatoren kjenner denne type, men typen kan være svært kompleks, så Swift lar oss bruke `some View` til at skjule den.

### Hva er some?

I Swift er `some` et nøkkelord til at erklære en uigjennomsigtig type (opaque type).

En uigjennomsigtig type betyr: **returværdien har en konkret type, kompilatoren ved, hvilken konkret type det er, men vi skriver ikke denne type direkte.**

For eksempelet:

```swift
func makeView() -> some View {
    Text("Hej")
}
```

Det betyr, at `makeView` returnerer en konkret type, som følger protokollen `View`.

### Hvorfor har vi trenger some?

Da vi lærte om variabler, fandt vi ud af: **værdier i Swift skal enten ha typen angivet eksplicit, eller også skal kompilatoren automatisk udlede typen.**

For eksempelet:

```swift
let a: Int = 10
```

Her er konstanten `a` av typen `Int`.

SwiftUI-views er ingen undtagelse. Når vi bruker `body` til at vise en SwiftUI-view, skal `body` returnere den tilsvarende SwiftUI-type.

Hvis vi for eksempelet bruker `body` til at vise en tekstview `Text`, skal `body` returnere den tilsvarende `Text`-type.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

I dette eksempelet er det, som vises inne i `body`, en `Text`-view, og returtypen er også `Text`.

Kun når den indre type og den erklærede type stemmer overens, opfylder det kompilatorens krav om typeoverensstemmelse.

**Problem med typeuoverensstemmelse**

Hvis vi sætter typen for `body` til `Color`, men viser `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

så stemmer typen for `body` og typen for den indre kode ikke overens, hvilket udløser en typeuoverensstemmelsesfeil.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

På dette tidspunktet skal vi manuelt ændre returtypen for `body`.

**Komplekse viewstyper**

I praktisk udvikling består grensesnittet normalt ikke kun av én `Text`.

Hvis vi skal vise en mere kompleks `VStack`, skal vi manuelt angive en kompleks returtype.

For eksempelet:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hei, verden!")
    }
}
```

Denne koden betyr, at det returneres en `VStack`, og inne i `VStack` er det views av typene `Image` og `Text`.

Returtypen for `body` er:

```swift
VStack<TupleView<(Image,Text)>>
```

Vi kan se, at denne returtype er svært kompleks, og at det også er kommet en `TupleView`, som vi ikke har sett før.

Her kan `TupleView` forstås som: **at flere underviews pakkes ind som én view.**

**Endnu mere komplekse viewstyper**

Hvis vi tilføjer modifiers til viewen:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hei, verden!")
    }
    .padding()
}
```

så blir returtypen for denne view svært kompleks og kan ikke beskrives konkret her.

Den eksisterende returtype `VStack<TupleView<(Image,Text)>>` kan ikke lenger beskrive modifierne, og derfor oppstår det en feil.

**some View forenkler returtypen**

Til denne situation giver SwiftUI en enkel løsning, nemlig at bruke `some View` til at forenkle skrivemåden.

Når vi ændrer `body` til typen `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hei, verden!")
    }
    .padding()
}
```

behøver vi ikke lenger skrive den fulle returtype, hver gang vi ændrer viewskoden.

Det skyldes, at `some View` betyr, at det returneres en konkret view, som følger protokollen `View`.

Med andre ord: SwiftUI-views som `VStack`, `Image` osv. er alle views, som følger protokollen `View`. Efter at det er lagt til modifiers, følger den returnerte viewstype stadig protokollen `View`.

Derfor kan de alle returneres som `some View`.

### some View kan ikke vilkårligt returnere hvilken som helst view

Selvom `some View` kan skjule komplekse typer, er den ikke "uten type".

Dens kerneprincip er: **kompilatoren skal kunne bestemme én konkret returtype**.

For eksempelet:

```swift
var title: some View {
    Text("Hej")
}
```

Her returneres en `Text`-view.

Men hvis vi prøver at returnere to views, oppstår det en feil:

```swift
var title: some View {
    Text("Hej")
    Image(systemName: "star")
}
```

Fordi `some View` i sidste ende skal returnere én viewsstruktur, mens vi her prøver at returnere to uafhængige views.

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

I denne kode returnerer `title` en `VStack`, mens `Text` og `Image` er underviews inne i `VStack`.

Den viewsstruktur, som `some View` modtager, er en `VStack<...>`, og dermed opfylder den `some View`'s krav om at returnere én viewsstruktur. 

Det er også grunden til, at vi helt fra starten av SwiftUI anbefaler at bruke en `VStack`-container yderst til at pakke viewskoden ind.

**2. Bruge @ViewBuilder**

Vi kan også tilføje modifieren `@ViewBuilder` foran `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Hej")
    Image(systemName: "star")
}
```

`@ViewBuilder` kan kombinere flere views til ét returresultat.

I sin kerne samler den stadig flere views til én view for at opfylde `some View`'s krav om at returnere én viewsstruktur.

### Hvorfor kan body skrive flere views direkte?

Hvis vi skriver flere views i `var body`, for eksempelet:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hei, verden!")
}
```

vil slik en `body` i nogle tilfælde ikke give feil.

Årsagen er, at `body` i protokollen `View` som standard understøtter `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

I kildekoden til protokollen `View` kan vi se, at `@ViewBuilder` allerede dekorerer variablen `body`.

Derfor har `body` et ekstra særligt behandlingslag i forhold til vanlig `some View`, så SwiftUI automatisk hjælper os med at kombinere flere views til én view.

**Det anbefales at bruke containere**

For at gøre det lettere for begyndere at forstå, anbefales det først at bruke containere som `VStack`, `HStack`, `ZStack`, `Group` til at organisere flere views.

For eksempelet:

```swift
var body: some View {
    VStack {
        Text("Hej")
        Image(systemName: "star")
    }
}
```

Slik blir koden mer intuitiv: **det ytterste lag er en `VStack`, og inni ligger det to underviews.**

## Opdeling av viewen

Hvis grensesnittet er relativt enkel, kan vi skrive al koden i `body`.

For eksempelet:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Velkommen til Qinote")
                Text("God morgen")
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

Denne views udseende:

![view](../../Resource/023_view1.png)

Denne koden kan køre normalt, men hvis viewskoden er svært kompleks, blir koden i `body` længere og længere, og læsning og ændring blir stadig sværere.

På dette tidspunktet kan vi dele opp ulike områder i uafhængige viewsegenskaper.

### Opdeling av den øverste view

For eksempelet kan vi udskille det øverste område:

```swift
var topHome: some View {
    HStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Her er `topHome` en variabel, som returnerer en view.

Fordi den returnerer en view, kan typen skrives som:

```swift
some View
```

Det er faktisk samme brug som `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Begge bruker variabler til at vise views, og returtypen er `some View`.

### Opdeling av andre views

Derefter kan vi fortsætte med at dele opp andre dele:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Velkommen til Qinote")
        Text("God morgen")
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

Efter opdelingen kan viewsvariablerne placeres i `body`:

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
            Text("Home")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Velkommen til Qinote")
            Text("God morgen")
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

Nå er `body` kun ansvarlig for at beskrive sidens struktur:

```swift
topBar
welcomeText
colorList
clickButton
```

Den konkrete implementering av hver del ligger i de tilsvarende egenskaper nedenfor.

Denne måde at dele opp viewen på kan gøre sidestrukturen tydeligere. Hvert viewsområde har sit eget navn, og læsningen blir mere intuitiv.

Når vi ændrer en bestemt del av koden, kan vi direkte finde det tilsvarende viewsområde i stedet for at lede i en bunke kompleks kode.

### some View returnerer én view

I denne opdelte view, hvis vi prøver at returnere flere views:

```swift
var topBar: some View {
    Text("Home")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

oppstår det en feil, fordi `some View` kun kan returnere én viewsstruktur.

I modsætning til `body` har vanlige beregnede egenskaper som standard ikke `@ViewBuilder`.

Derfor kan vi, hvis vi skal returnere flere views, bruke en `VStack`, `HStack` eller `Group`-container til at kombinere flere views til én.

```swift
var topBar: some View {
    VStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Eller tilføje `@ViewBuilder` for at kombinere viewsne:

```swift
@ViewBuilder
var topBar: some View {
    Text("Home")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

På den måde kan vi returnere flere views.

### if returnerer flere views

For eksempelet:

```swift
var topHome: some View {
    if step == "Home" {
        HStack {
            Text("Home")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Ingen")
    }
}
```

I denne kode returnerer `topHome` ud fra innholdet av `step` to ulike viewstyper: `HStack` eller `Text`.

Fordi `some View` har trenger én bestemt konkret returtype, kan de to grene av `if` i en vanlig computed property ikke direkte returnere ulike typer views, og derfor oppstår det en feil.

**Løsningen er stadig at pakke ind med en container eller bruke `@ViewBuilder`.**

### Hvorfor bruker opdelte views ikke parenteser?

Når vi bruker de opdelte viewsegenskaper i `body`, skriver vi direkte:

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

Det skyldes, at `topBar`, `welcomeText`, `colorList` og `clickButton` er variabler. Disse variabler er faktisk beregnede egenskaper, ikke metoder.

**Egenskaber krever ikke parenteser.**

Hvis vi skriver det som en metode, kan vi også opnå en lignende effekt:

```swift
func topBar() -> some View {
    HStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Denne koden kan også opnå en lignende effekt. Når denne metode kaldes, returnerer den en view.

Ved brug skal den skrives som:

```swift
topBar()
```

I SwiftUI er det mere vanligt at bruke en computed property, hvis man bare dele opp en view, som ikke skal ha parametre.

```swift
var topBar: some View { ... }
```

## Indlejrede views

Ud over at dele kode op i egenskaper kan vi også oprette nye viewsstrukturer.

For eksempelet:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Denne `PinkColorView` er ligesom `ContentView` en uafhængig SwiftUI-view.

Hvis vi skal vise den i `ContentView`, kan vi tilføje `()` efter viewens navn.

For eksempelet:

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

betyr det at oprette en instans av `PinkColorView`.

Fordi `PinkColorView` følger protokollen `View`, kan den ligesom `Text`, `Image` og `Button` placeres i andre views og vises.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Dette er indlejring av views: én view kan vises inne i en anden view.

## Visningsegenskab eller ny view?

Når viewskoden er relativt enkel, er det normalt ikke nødvendigt at dele koden op. Kun når koden blir mere kompleks, anbefales det at dele opp viewen.

### Situationer til brug av viewsegenskaper

Hvis det kun er en liten del av innholdet i den aktuelle view, kan man bruke en viewsegenskab.

For eksempelet:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Dette innhold brukes normalt kun i den aktuelle view.

### Situationer til at oprette en ny view

Hvis dette innhold er relativt uafhængigt, eller det senere kan genbrukes på flere sider, er det mere passende at oprette en ny view.

For eksempelet:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Dette er en titelview. Hvis vi vil bruke denne view som en generel komponent og genbruke den i andre views.

Kan vi oprette en ny view:

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

Derefter bruker vi den andre steder:

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

På dette tidspunktet er denne view en uafhængig genbrukelig komponent.

Det kan kort opsummeres slik:

- Indholdsområder i den aktuelle view kan bruke `var xxx: some View`
- Uafhængige genbrukelige komponenter kan oprette en ny `struct XxxView: View`
- Komponenter, som skal ha data overført, egner seg normalt bedre som nye views.

## Oppsummering

I denne leksjonen har vi igen forstået den mest grundlæggende, men også vigtigste, viewsstruktur i SwiftUI.

`ContentView` er en struktur, det defineres med `struct`, og som brukes til at organisere kode relatert til siden.

`View` er en protokoll. Hvis en struktur vil være en SwiftUI-view, skal den følge protokollen `View`.

`body` er det innhold, som protokollen `View` krever, at vi leverer, og det afgør, hvad denne view viser.

`some View` betyr, at det returneres en bestemt konkret view, uten at vi behøver skrive dens komplekse fulle type.

Når viewskoden blir lang, kan vi bruke `var xxx: some View` til at dele viewskoden op i flere små områder.

Når en del av innholdet er relativt uafhængig eller skal genbrukes, kan vi oprette en ny viewsstruktur og vise den i andre views med `XxxView()`.

Kort sagt er SwiftUI-grensesnittet sammensatt av individuelle views, som kombineres. En side kan inneholde flere små views, og en liten view kan også inneholde andre views.
