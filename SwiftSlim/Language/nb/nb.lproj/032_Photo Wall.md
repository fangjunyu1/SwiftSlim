# Fotogalleri

I denne leksjonen skal vi lage en fotogalleriside.

![view](../../../Resource/032_view13.png)

I dette eksemplet skal vi repetere `extension`, `self` og instanser, og lære om de vanlige `Shape`-figurene i SwiftUI.

Med denne kunnskapen kan vi klippe vanlige bilder til ulike stiler, for eksempel sirkler, avrundede rektangler, kapsler og ellipser, og legge til rammeeffekter på bildene.

Denne leksjonen bruker flere nye kunnskapspunkter: `Shape`, `clipShape`, `strokeBorder` og `overlay`.

Blant dem brukes `clipShape` til å klippe formen på en visning, `strokeBorder` brukes til å tegne en figurramme, og `overlay` brukes til å legge en ny visning over den gjeldende visningen.

## Bilderessurser

Før vi starter, må vi forberede noen bilder.

Du kan bruke dine egne bilder, eller du kan bruke eksempelbildene som følger med denne leksjonen.

Bildeeksemplene i denne leksjonen kommer fra nettstedet [Pixabay](https://pixabay.com/):

[Landskap](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Rev](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Bygning](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Blomst](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Svane](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Etter at bildene er lastet ned, legger du dem til i ressursmappen `Assets` og gir dem navnene `1`, `2`, `3`, `4` og `5` i rekkefølge.

![assets](../../../Resource/032_view17.png)

Slik kan vi vise bildene i SwiftUI med `Image("1")`, `Image("2")` og så videre.

## Vise bilder

Først viser vi 5 bilder i `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Visningsresultat:

![view](../../../Resource/032_view.png)

I denne koden bruker vi `ScrollView` for å gjøre bildelisten rullbar, og vi bruker `VStack` for å ordne flere bilder ovenfra og ned.

Hvert bilde bruker `.resizable()`, `.scaledToFit()` og `.frame(width: 300)` for å sette visningseffekten, slik at bildet kan skaleres, beholde hele proporsjonen og begrenses i bredde.

`.padding(.vertical, 100)` på `VStack` brukes til å øke avstanden øverst og nederst, slik at det første og siste bildet ikke ligger for tett inntil skjermkantene.

Den siste `.ignoresSafeArea()` betyr at rullevisningen ignorerer sikkerhetsområdet, slik at bildene kan strekke seg til toppen og bunnen av skjermen når de rulles, og siden vises mer komplett.

Men nå bruker alle de 5 bildene de samme modifikatorene:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Når vi ser gjentatt kode, kan vi vurdere å bruke en `extension` for å organisere den.

## Bruke extension til å organisere bildestiler

Vi kan utvide `Image` med en metode som er spesielt laget for fotogalleriet:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Her utvider vi typen `Image` med metoden `photoGalleryStyle`.

Denne metoden inneholder de tidligere gjentatte `.resizable()`, `.scaledToFit()` og `.frame(width: 300)`. Med andre ord samler den koden for bildeskalering, proporsjonal visning og breddeinnstilling på ett sted.

Etter at vi bruker denne utvidelsen, kan den opprinnelige bildekoden:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

forenkles til:

```swift
Image("1")
    .photoGalleryStyle()
```

Slik trenger hvert bilde bare å kalle `.photoGalleryStyle()` for å bruke den samme fotogalleristilen. Koden blir mer ryddig, og det blir også enklere å endre alt samlet senere.

## Forstå self

I utvidelsesmetoden skrev vi `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Her betyr `self` den gjeldende bildeinstansen som kaller denne metoden.

For eksempel:

```swift
Image("1")
    .photoGalleryStyle()
```

I denne koden kalles `photoGalleryStyle()` av `Image("1")`, så `self` inne i metoden betyr dette `Image("1")`-bildet.

Du kan enkelt forstå det slik: Den som kaller metoden, er det `self` representerer.

Det er viktig å merke seg at SwiftUI-modifikatorer stadig returnerer nye visningsresultater. Derfor returnerer `photoGalleryStyle()` en modifisert visning, ikke bare det opprinnelige `Image`-objektet.

## Fotoformer

Nå kan bildene allerede vises normalt. Men disse bildene er som standard rektangulære, og det ser ganske vanlig ut.

Hvis du bare vil gi bildene avrundede hjørner, kan du bruke `.cornerRadius()` direkte:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Visningsresultat:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` betyr å legge til en hjørneradius på `20 pt` på bildet. For vanlige bilder med avrundede hjørner er denne skrivemåten allerede nok.

Men `.cornerRadius()` kan bare håndtere avrundede hjørner, og passer til vanlige bilder med avrundede hjørner. Hvis vi vil gjøre bilder om til flere ulike former, er ikke denne modifikatoren alene nok.

Da må vi bruke `Shape` i SwiftUI. `Shape` kan representere ulike figurer, og sammen med `clipShape` kan den klippe et bilde til den tilsvarende formen.

## Forstå Shape

I SwiftUI betyr `Shape` en figur. I likhet med `View` er det en svært vanlig type i SwiftUI.

Vanlige `Shape`-typer omfatter sirkel, rektangel, avrundet rektangel, kapsel og ellipse. For å observere utseendet til ulike figurer mer intuitivt, gir eksemplene nedenfor hver figur ulike farger og størrelser.

I disse eksemplene brukes `.fill()` til å fylle figuren med farge, og `.frame()` brukes til å angi figurens visningsstørrelse. Fargene brukes bare til å skille de ulike figurene fra hverandre, og er ikke faste farger som tilhører figurene selv.

### Circle Sirkel

`Circle` representerer en sirkel. Den brukes ofte til avatarer, runde knapper, runde bilder og andre grensesnitteffekter.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle Rektangel

`Rectangle` representerer et rektangel. Det er en av de mest grunnleggende figurene, og kan også brukes til å lage bakgrunner, inndelte områder eller vanlige rammer.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle Avrundet rektangel

`RoundedRectangle` representerer et avrundet rektangel. `cornerRadius` brukes til å angi størrelsen på de avrundede hjørnene.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule Kapsel

`Capsule` representerer en kapselform. De to endene er buer, og den brukes ofte til kapselknapper, etikettbakgrunner og andre grensesnitteffekter.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse Ellipse

`Ellipse` representerer en ellipse. Den ligner på `Circle`, men når bredden og høyden er ulike, vises den som en ellipse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Gjennom disse eksemplene kan vi se at `Shape` i seg selv kan vises direkte som en figur. Deretter skal vi bruke disse `Shape`-typene sammen med `clipShape` for å klippe bilder, slik at bildene vises i ulike former.

## Bruke clipShape til å klippe bilder

Nå kan vi bruke `clipShape` til å klippe bilder til ulike former.

For eksempel kan vi klippe det første bildet til en sirkel:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Denne koden betyr: Først vises et bilde, og deretter brukes `Circle()` til å klippe det til en sirkel.

![view](../../../Resource/032_view2.png)

Den grunnleggende skrivemåten for `clipShape` er:

```swift
.clipShape(form)
```

Legg til `.clipShape(...)` etter visningen, og skriv inn figuren du vil klippe den til i parentesene.

For eksempel:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Nå klipper vi de 5 bildene til ulike former:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Visningsresultat:

![view](../../../Resource/032_view8.png)

Blant dem er effekten etter klipping med `Rectangle()` nær et vanlig rektangulært bilde, så den visuelle endringen er ikke tydelig. Den brukes hovedsakelig til sammenligning med andre former.

Nå er bildene ikke lenger bare vanlige rektangler, men har ulike former.

## Legge til bilderammer

Hvis vi vil legge til en ramme på et rundt bilde, kan vi tenke på å bruke `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Men vanligvis får vi da ikke en rund ramme, men en rektangulær ramme.

![view](../../../Resource/032_view9.png)

Dette er fordi `border` legger til en ramme basert på visningens rektangulære område, ikke basert på formen etter klipping med `clipShape`.

Derfor kan vi ikke bruke `border` direkte hvis vi vil ha en rund ramme.

## Bruke strokeBorder til å tegne figurrammer

I SwiftUI kan `strokeBorder` tegne innvendige rammer for disse vanlige `Shape`-typene.

For eksempel kan vi tegne en rund ramme:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Denne koden betyr: Tegn en brun ramme for `Circle`, med en rammebredde på `10 pt`.

![view](../../../Resource/032_view12.png)

Her må du merke deg at `strokeBorder` ikke legger til en ramme direkte på bildet, men tegner en ramme for figuren `Circle()`.

Med andre ord får vi med denne koden bare en selvstendig rund ramme, og den har ennå ingen forbindelse med bildet.

Hvis vi vil at denne runde rammen skal vises over bildet, må vi fortsette å bruke `overlay` for å legge rammen over bildet.

## Bruke overlay til å legge rammer over

`overlay` er en visningsmodifikator som kan legge en ny visning over den gjeldende visningen.

Den grunnleggende strukturen kan forstås slik:

```swift
Gjeldende visning
    .overlay {
        Overliggende visning
    }
```

I dette eksemplet er den gjeldende visningen bildet som allerede er klippet til en sirkel:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Den nye visningen vi vil legge over, er en rund ramme:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Derfor kan vi kombinere bildet og rammen slik:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Her betyr `overlay` at en ny visning legges over den gjeldende visningen.

I `overlay` følger rammen visningsområdet til det gjeldende bildet, så vi trenger ikke å sette en egen `frame`. Så lenge rammeformen og klippeformen er den samme, kan rammen passe til bildet.

![view](../../../Resource/032_view10.png)

Den endelige effekten er at en rund ramme ligger over det runde bildet.

Sammenlignet med `ZStack` passer `overlay` bedre for denne typen scenario der vi «legger til dekorasjon på den gjeldende visningen». Bildet er hovedinnholdet, og rammen er bare en tilleggseffekt, så bruk av `overlay` gjør koden tydeligere.

## Fullføre fotogalleriet

Nå legger vi til tilsvarende form og ramme på hvert bilde:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Visningsresultat:

![view](../../../Resource/032_view13.png)

Slik er en grunnleggende fotogalleriside ferdig.

På denne siden bruker vi `ScrollView` til å lage rullbar visning, `Image` til å vise bilder, `clipShape` til å klippe bildeformer, og `overlay` og `strokeBorder` til å legge til rammer.

## Fullstendig kode

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Oppsummering

I denne leksjonen fullførte vi en fotogalleriside.

![view](../../../Resource/032_view13.png)

I dette eksemplet brukte vi først `Image` til å vise bilder, og deretter utvidet vi `Image` med metoden `photoGalleryStyle` gjennom `extension` for å organisere gjentatt bildestil-kode.

Deretter lærte vi om vanlige `Shape`-typer i SwiftUI, for eksempel `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` og `Ellipse`. Disse figurene kan ikke bare vises direkte, men kan også brukes sammen med `clipShape` til å klippe visninger.

For eksempel:

```swift
.clipShape(Circle())
```

betyr å klippe visningen til en sirkel.

Til slutt brukte vi `overlay` og `strokeBorder` til å legge til rammer med tilsvarende form på bildene. Det er viktig å merke seg at `border` vanligvis tegner en ramme basert på visningens rektangulære område. Hvis du vil at rammen skal følge en sirkel, kapsel eller ellipse, passer det bedre å legge over den samme `Shape`-figuren.

Gjennom denne leksjonen fullførte vi ikke bare fotogallerieffekten, men forsto også den vanlige kombinasjonen av `Shape`, `clipShape`, `strokeBorder` og `overlay` i grensesnitt.

## Øvelser etter timen

### 1. Legg til bakgrunn for fotogalleriet

Legg til et fullskjermsbakgrunnsbilde på fotogallerisiden.

Krav: Bakgrunnsbildet skal kunne fylle hele skjermen og ignorere sikkerhetsområdet.

### 2. Gradientramme

Endre de eksisterende ensfargede rammene til lineære gradientrammer.

Du kan prøve å bruke `LinearGradient` for å lage rikere rammeeffekter.

### 3. Simulert fotoramme

Søk på nettet etter noen ekte fotorammestiler, og prøv å bruke `overlay` til å legge over bilderammer, slik at bildene ser mer ut som virkelige bilderammer.

Visningsresultat for øvelsen:

![button](../../../Resource/032_view15.jpeg)

### 4. Implementer en avrundet knapp med ramme

I faktisk utvikling bruker knapper ofte avrundede rektangelrammer.

Prøv å lage en avrundet knapp, og bruk `RoundedRectangle` og `strokeBorder` til å legge til en avrundet ramme på knappen.

Visningsresultat for øvelsen:

![button](../../../Resource/032_view14.png)

### Tenkespørsmål

Hvis du ikke vil bruke en ensfarget ramme eller en gradientramme, men vil at rammen skal vise en bestemt mønstereffekt, hvordan bør du implementere det?

Du kan prøve å søke etter informasjon for å lære om relevante bruksområder som `overlay`, `mask` eller `ImagePaint`.

Visningsresultat for øvelsen:

![button](../../../Resource/032_view16.png)
