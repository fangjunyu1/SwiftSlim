# Fotogalleri

I denne lektion skal vi lave en fotogalleriside.

![view](../../../Resource/032_view13.png)

I dette eksempel gennemgår vi viden om `extension`, `self` og instanser og lærer de ofte brugte `Shape`-figurer i SwiftUI.

Med denne viden kan vi beskære almindelige billeder til forskellige stilarter, såsom cirkler, afrundede rektangler, kapselformer og ellipser, og tilføje rammeeffekter til billederne.

I denne lektion bruger vi flere nye begreber: `Shape`, `clipShape`, `strokeBorder` og `overlay`.

Her bruges `clipShape` til at beskære en visnings form, `strokeBorder` til at tegne en formramme, og `overlay` til at lægge en ny visning oven på en eksisterende visning.

## Billedmateriale

Før vi begynder, skal vi forberede nogle billeder.

Du kan bruge dine egne fotos, eller du kan bruge de eksempelbilleder, der følger med denne lektion.

Fotoeksemplerne i denne lektion kommer fra webstedet [Pixabay](https://pixabay.com/):

[Landskab](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Ræv](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Bygning](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Blomst](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Svane](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Når billederne er downloadet, skal du føje dem til ressource-mappen `Assets` og navngive dem i rækkefølgen `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

På den måde kan vi vise billeder i SwiftUI med `Image("1")`, `Image("2")` osv.

## Vis billeder

Først viser vi 5 billeder i `ContentView`:

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

Visningseffekt:

![view](../../../Resource/032_view.png)

I denne kode bruger vi `ScrollView` til at gøre billedlisten scrollbar og `VStack` til at placere flere billeder oppefra og ned.

Hvert billede får visningseffekten indstillet med `.resizable()`, `.scaledToFit()` og `.frame(width: 300)`, så billedet kan skaleres, bevarer sine proportioner og vises fuldt ud, samtidig med at billedbredden begrænses.

`.padding(.vertical, 100)` på `VStack` bruges til at øge den øverste og nederste afstand, så det første og sidste billede ikke ligger for tæt på skærmkanten.

Den sidste `.ignoresSafeArea()` betyder, at rullevisningen ignorerer det sikre område, så billederne kan strække sig til toppen og bunden af skærmen under rulning, hvilket giver en mere komplet sidevisning.

Men nu bruger alle 5 billeder de samme modifiers:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Når vi ser gentaget kode, kan vi overveje at bruge `extension` til at organisere den.

## Brug extension til at organisere billedstilen

Vi kan udvide `Image` med en metode, der er specifik for fotogalleriet:

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

Her udvider vi typen `Image` med metoden `photoGalleryStyle`.

Denne metode indeholder de tidligere gentagne `.resizable()`, `.scaledToFit()` og `.frame(width: 300)`. Det vil sige, den samler koden til billedskalering, proportionsvisning og breddeindstilling ét sted.

Efter vi har brugt denne udvidelse, kan den oprindelige billedkode:

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

På den måde skal hvert billede kun kalde `.photoGalleryStyle()` for at anvende den samme fotogalleristil. Koden bliver mere kortfattet, og det bliver lettere at ændre stilen samlet senere.

## Forstå self

I udvidelsesmetoden skrev vi `self`:

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

Her betyder `self` den aktuelle billedinstans, der kalder metoden.

For eksempel:

```swift
Image("1")
    .photoGalleryStyle()
```

I denne kode kaldes `photoGalleryStyle()` af `Image("1")`, så `self` inde i metoden betyder netop dette `Image("1")`-billede.

Man kan enkelt forstå det sådan: Den, der kalder metoden, er det, `self` repræsenterer.

Det er vigtigt at bemærke, at SwiftUI-modifiers hele tiden returnerer nye visningsresultater. Derfor returnerer `photoGalleryStyle()` en modificeret visning og ikke blot det oprindelige `Image` selv.

## Fotoformer

Nu kan billederne allerede vises normalt. Men disse billeder er som standard rektangler, hvilket ser ret almindeligt ud.

Hvis vi bare vil give et billede afrundede hjørner, kan vi direkte bruge `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Visningseffekt:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` betyder, at billedet får en hjørneradius på `20 pt`. For almindelige billeder med afrundede hjørner er denne skrivemåde allerede tilstrækkelig.

Men `.cornerRadius()` kan kun håndtere afrundede hjørner og egner sig til almindelige billeder med afrundede hjørner. Hvis vi vil gøre et foto til flere forskellige former, er denne modifier alene ikke nok.

På dette tidspunkt skal vi bruge `Shape` i SwiftUI. `Shape` kan repræsentere forskellige figurer, og sammen med `clipShape` kan vi beskære billedet til den tilsvarende form.

## Lær Shape at kende

I SwiftUI betyder `Shape` en figur. Ligesom `View` er det en meget almindeligt brugt type i SwiftUI.

Almindelige `Shape`-typer omfatter cirkel, rektangel, afrundet rektangel, kapselform og ellipse. For at se de forskellige figurers udseende mere intuitivt får hver figur i eksemplerne nedenfor forskellige farver og størrelser.

I disse eksempler bruges `.fill()` til at udfylde figuren med farve, og `.frame()` bruges til at indstille figurens visningsstørrelse. Farven bruges kun til at skelne de forskellige figurer og er ikke figurens faste farve.

### Circle cirkel

`Circle` betyder cirkel. Den bruges ofte til avatars, runde knapper, runde billeder og lignende interface-effekter.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle rektangel

`Rectangle` betyder rektangel. Det er en af de mest grundlæggende figurer og kan også bruges til baggrunde, opdeling af områder eller almindelige rammer.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle afrundet rektangel

`RoundedRectangle` betyder afrundet rektangel. `cornerRadius` bruges til at indstille størrelsen på de afrundede hjørner.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapselform

`Capsule` betyder kapselform. De to ender er buede, og den bruges ofte til kapselknapper, etiketbaggrunde og lignende interface-effekter.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ellipse

`Ellipse` betyder ellipse. Den minder om `Circle`, men når bredde og højde ikke er ens, vises den som en ellipse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Gennem disse eksempler kan vi se, at `Shape` selv kan vises direkte som en figur. Næste trin er at bruge disse `Shape`-figurer sammen med `clipShape` til at beskære fotos, så billederne vises i forskellige former.

## Brug clipShape til at beskære fotos

Nu kan vi bruge `clipShape` til at beskære billeder til forskellige former.

For eksempel kan vi beskære det første billede til en cirkel:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Denne kode betyder: Vis først et billede, og brug derefter `Circle()` til at beskære det til en cirkel.

![view](../../../Resource/032_view2.png)

Den grundlæggende skrivemåde for `clipShape` er:

```swift
.clipShape(form)
```

Tilføj `.clipShape(...)` efter visningen, og angiv den figur, der skal beskæres til, i parentesen.

For eksempel:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Nu beskærer vi de 5 fotos til forskellige former:

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

Visningseffekt:

![view](../../../Resource/032_view8.png)

Her ligner effekten efter beskæring med `Rectangle()` et almindeligt rektangulært foto, så den visuelle ændring er ikke tydelig. Det bruges hovedsageligt til sammenligning med de andre former.

Nu er billederne ikke længere kun almindelige rektangler, men har forskellige former.

## Tilføj en billedramme

Hvis vi vil tilføje en ramme til et rundt foto, kan vi måske tænke på at bruge `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Men det, vi typisk får, er ikke en cirkulær ramme, men en rektangulær ramme.

![view](../../../Resource/032_view9.png)

Det skyldes, at `border` tilføjer en ramme efter visningens rektangulære område og ikke efter formen, der er beskåret med `clipShape`.

Så hvis vi vil have en cirkulær ramme, kan vi ikke bare bruge `border` direkte.

## Brug strokeBorder til at tegne en formramme

I SwiftUI kan `strokeBorder` tegne en indvendig ramme for disse almindelige `Shape`-figurer.

For eksempel kan vi tegne en cirkulær ramme:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Denne kode betyder: Tegn en brun ramme på `Circle`, hvor rammens bredde er `10 pt`.

![view](../../../Resource/032_view12.png)

Her skal du være opmærksom på, at `strokeBorder` ikke direkte tilføjer en ramme til billedet, men tegner en ramme på figuren `Circle()`.

Det vil sige, at denne kode kun giver en selvstændig cirkulær ramme, og den har endnu ingen relation til fotoet.

Hvis vi vil vise denne cirkulære ramme oven på fotoet, skal vi fortsætte med at bruge `overlay` og lægge rammen oven på fotoet.

## Brug overlay til at lægge rammen ovenpå

`overlay` er en visningsmodifier, der kan lægge en ny visning oven på den aktuelle visning.

Dens grundlæggende struktur kan forstås sådan:

```swift
aktuel visning
    .overlay {
        overlejret visning
    }
```

I dette eksempel er den aktuelle visning fotoet, der allerede er beskåret til en cirkel:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Den nye visning, vi vil lægge ovenpå, er en cirkulær ramme:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Derfor kan fotoet og rammen kombineres sådan:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Her betyder `overlay`, at en ny visning lægges oven på den aktuelle visning.

I `overlay` følger rammen det aktuelle fotos visningsområde, så der er ingen grund til at indstille `frame` separat. Så længe rammeformen og beskæringsformen er den samme, kan rammen passe til fotoet.

![view](../../../Resource/032_view10.png)

Den endelige effekt er, at en cirkulær ramme ligger oven på det runde foto.

Sammenlignet med `ZStack` er `overlay` mere velegnet til denne type scenarie, hvor man “tilføjer en dekoration til den aktuelle visning”. Fotoet er hovedindholdet, og rammen er kun en ekstra effekt, så `overlay` gør strukturen tydeligere.

## Færdiggør fotogalleriet

Nu tilføjer vi en tilsvarende form og ramme til hvert foto:

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

Visningseffekt:

![view](../../../Resource/032_view13.png)

På den måde er en grundlæggende fotogalleriside færdig.

På denne side bruger vi `ScrollView` til scrollbar visning, `Image` til at vise billeder, `clipShape` til at beskære billedernes form og `overlay` sammen med `strokeBorder` til at tilføje rammer.

## Fuld kode

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

## Opsummering

I denne lektion færdiggjorde vi en fotogalleriside.

![view](../../../Resource/032_view13.png)

I dette eksempel brugte vi først `Image` til at vise fotos og udvidede derefter `Image` med metoden `photoGalleryStyle` via `extension`, så vi kunne organisere gentaget billedstilskode.

Derefter lærte vi om de almindelige `Shape`-typer i SwiftUI, for eksempel `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` og `Ellipse`. Disse figurer kan ikke kun vises direkte, men kan også bruges sammen med `clipShape` til at beskære visninger.

For eksempel:

```swift
.clipShape(Circle())
```

betyder, at visningen beskæres til en cirkel.

Til sidst brugte vi `overlay` og `strokeBorder` til at tilføje rammer med tilsvarende former til billederne. Det er vigtigt at bemærke, at `border` normalt tegner en ramme efter visningens rektangulære område. Hvis vi vil have rammen til at følge en cirkel, kapselform eller ellipse, er det mere passende at bruge den samme `Shape` som overlejring.

Gennem denne lektion færdiggjorde vi ikke kun fotogallerieffekten, men forstod også den almindelige kombination af `Shape`, `clipShape`, `strokeBorder` og `overlay` i brugergrænseflader.

## Øvelser efter lektionen

### 1、Tilføj en fotogalleribaggrund

Tilføj et fuldskærmsbaggrundsbillede til fotogallerisiden.

Krav: Baggrundsbilledet skal kunne fylde hele skærmen og ignorere det sikre område.

### 2、Gradientramme

Ændr de eksisterende ensfarvede rammer til lineære gradientrammer.

Du kan prøve at bruge `LinearGradient` til at opnå en mere varieret rammeeffekt.

### 3、Imiter en realistisk fotoramme

Søg efter nogle realistiske fotorammestile på nettet, og prøv at bruge `overlay` til at lægge billedrammer ovenpå, så billederne kommer til at ligne rigtige fotorammer mere.

Øvelsens visningseffekt:

![button](../../../Resource/032_view15.jpeg)

### 4、Lav en knapramme med afrundede hjørner

I faktisk udvikling bruger knapper ofte rammer med afrundede rektangler.

Prøv at lave en knap med afrundede hjørner, og brug `RoundedRectangle` og `strokeBorder` til at tilføje en ramme med afrundede hjørner til knappen.

Øvelsens visningseffekt:

![button](../../../Resource/032_view14.png)

### Tænkespørgsmål

Hvis du hverken vil bruge en ensfarvet ramme eller en gradientramme, men i stedet vil have rammen til at vise et bestemt mønstereffekt, hvordan bør det så implementeres?

Du kan prøve at søge efter materiale og lære om relateret brug af `overlay`, `mask` eller `ImagePaint`.

Øvelsens visningseffekt:

![button](../../../Resource/032_view16.png)
