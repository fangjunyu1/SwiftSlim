# Udseendetilpasning

I denne lektion lærer vi om udseendetilpasning til lys tilstand og mørk tilstand.

På iPhone, iPad og Mac kan brugeren vælge lys tilstand eller mørk tilstand.

Når systemet skifter til mørk tilstand, ændrer baggrund, tekst og ikonfarver sig også i mange apps.

For eksempel kan grænsefladen have en lys baggrund om dagen og en mørk baggrund om natten.

![view](../../../Resource/025_view9.png)

Denne evne til automatisk at justere grænsefladens visning efter systemets udseende kaldes udseendetilpasning.

## Forhåndsvis udseendetilpasning i Xcode

Før vi lærer udseendetilpasning, ser vi først på, hvordan man forhåndsviser lys tilstand og mørk tilstand i Xcode.

Nederst i `Canvas`-området kan du klikke på knappen `Device Settings` for at åbne pop op-vinduet `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

I pop op-vinduet kan du se indstillingen `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Her gælder:

- `Light Appearance` betyder lys tilstand.
- `Dark Appearance` betyder mørk tilstand.

Her kan vi skifte forhåndsvisningens udseende og se, hvordan den aktuelle grænseflade vises i lys tilstand og mørk tilstand.

## Vis to udseender side om side

Hvis du vil se lys tilstand og mørk tilstand samtidig, kan du bruge funktionen `Variants`.

Nederst i `Canvas`-området skal du klikke på knappen `Variants` og vælge `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Når du har valgt det, viser `Canvas` forhåndsvisninger for lys tilstand og mørk tilstand samtidig.

![canvas3](../../../Resource/025_view3.png)

På den måde bliver det nemmere at sammenligne forskellene mellem de to udseender.

Kort sagt:

Hvis du kun midlertidigt vil skifte mellem lys/mørk tilstand, kan du bruge `Canvas Device Settings`.

Hvis du vil se begge udseender samtidig, kan du bruge `Color Scheme Variants`.

## Views tilpasser som standard udseendet

I SwiftUI tilpasser mange system-views sig som standard automatisk til lys tilstand og mørk tilstand.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Lys")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("noget noget noget")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![canvas](../../../Resource/025_view4.png)

Man kan se, at ikonet og titlen normalt vises med en mørk farve i lys tilstand.

I mørk tilstand skifter ikonet og titlen automatisk til en lys farve.

Det skyldes, at SwiftUI-views som `Text` og `Image` som standard justerer farven efter systemets udseende.

Det vil sige, at hvis vi ikke manuelt angiver en fast farve, hjælper SwiftUI os med at håndtere en del af udseendetilpasningen.

## Faste farver skifter ikke automatisk

Det er vigtigt at bemærke, at hvis vi manuelt angiver en fast farve, skifter den ikke automatisk mellem lys/mørk tilstand.

For eksempel:

```swift
Text("noget noget noget")
	.foregroundStyle(Color.gray)
```

Her er teksten angivet som `Color.gray`, så den bliver ved med at vises som grå.

Et andet eksempel:

```swift
Text("Titel")
    .foregroundStyle(Color.white)
```

Denne kode viser hvid tekst, uanset om den er i lys tilstand eller mørk tilstand.

Hvis baggrunden også er lys, kan den hvide tekst blive svær at se.

Derfor bør man ved udseendetilpasning så vidt muligt undgå tilfældigt at hardcode faste farver som `Color.white` og `Color.black`.

I mange tilfælde kan man med fordel bruge systemets semantiske styles først, for eksempel:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Her gælder:

- `.primary` bruges normalt til hovedindhold.
- `.secondary` bruges normalt til sekundært indhold.

De justerer automatisk visningen efter lys tilstand og mørk tilstand.

## Vis forskelligt indhold efter udseende

Nogle gange ønsker vi ikke kun, at farverne ændrer sig, men også at der vises forskelligt indhold i forskellige udseender.

For eksempel:

- I lys tilstand vises et almindeligt pæreikon.
- I mørk tilstand vises et lysende pæreikon.
- I lys tilstand viser titlen `Lys`.
- I mørk tilstand viser titlen `Mørk`.

I dette tilfælde skal vi afgøre, om det aktuelle system er i lys tilstand eller mørk tilstand.

I SwiftUI kan man hente det aktuelle udseende via miljøværdien `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Komplet kode:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Lys" : "Mørk"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("noget noget noget")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/025_view5.png)

Ud fra forhåndsvisningen kan man se, at det samme view ikke viser helt det samme indhold i forskellige udseendetilstande.

I lys tilstand viser `Image` det almindelige pæreikon, og titlen vises som `Lys`.

I mørk tilstand viser `Image` det lysende pæreikon, og titlen vises som `Mørk`.

Det vil sige, at ændringen her ikke kun er en ændring i farve, men også i selve ikonnavnet og titelteksten.

Det skyldes, at vi ikke har hardcodet ikonet og titlen direkte i `body`, men beregner forskelligt indhold ud fra `colorScheme`.

I denne kode bruger vi to beregnede egenskaber:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Lys" : "Mørk"
}
```

Når `colorScheme` er `.light`, betyder det, at den aktuelle tilstand er lys tilstand.

Når `colorScheme` er `.dark`, betyder det, at den aktuelle tilstand er mørk tilstand.

Derfor kan vi returnere forskellige ikonnavne og titeltekster ud fra forskellige udseendetilstande.

Dette er også en almindelig brug af beregnede egenskaber: at beregne det indhold, som et view skal vise, ud fra den aktuelle tilstand.

## Forstå @Environment

Det er første gang, vi møder `@Environment`.

`@Environment` kan forstås som: at læse en værdi fra SwiftUIs miljø.

Når appen kører, leverer systemet mange miljøoplysninger, for eksempel:

- Aktuelt sprog
- Aktuel udseendetilstand
- Aktuel layoutretning
- Aktuel indstilling for skriftstørrelse

Når vi har brug for at hente den aktuelle udseendetilstand, kan vi læse `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Her betyder

```swift
\.colorScheme
```

at værdien `colorScheme` læses fra miljøet.

```swift
private var colorScheme
```

at den læste værdi gemmes i variablen `colorScheme`.

Variabelnavnet kan du selv bestemme. For eksempel kan det også skrives sådan:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Så længe den forreste del `\.colorScheme` ikke ændres, betyder det, at der læses den aktuelle udseendetilstand.

## To almindelige værdier for colorScheme

`colorScheme` har typisk to værdier:

```swift
.light
.dark
```

De betyder:

- `.light`: lys tilstand
- `.dark`: mørk tilstand

For eksempel:

```swift
private var titleName: String {
    colorScheme == .light ? "Lys" : "Mørk"
}
```

Denne kode betyder:

Hvis den aktuelle tilstand er lys tilstand, er `colorScheme == .light` sand, og der returneres `"Lys"`.

Ellers returneres `"Mørk"`.

Derfor vises dette i lys tilstand:

```swift
Text(titleName)
```

viser:

```swift
Lys
```

I mørk tilstand vises:

```swift
Mørk
```

På denne måde kan vi vise forskelligt indhold efter forskellige udseender.

## Eksempel på farvetilpasning

Ud over tekst og ikoner skal vi nogle gange selv håndtere farvetilpasning.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Tekst")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/025_view6.png)

I denne kode er teksten hvid, og baggrunden er sort.

I lys tilstand er den sorte baggrund ret tydelig.

Men i mørk tilstand, hvis hele grænsefladens baggrund også er sort, smelter denne sorte baggrund sammen med systembaggrunden og ser ikke tydelig nok ud.

På dette tidspunkt kan vi skifte tekstfarve og baggrundsfarve ud fra udseendetilstanden:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Tekst")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/025_view7.png)

Nu er der sort baggrund og hvid tekst i lys tilstand.

I mørk tilstand er der hvid baggrund og sort tekst.

På den måde har tekst og baggrund tydelig kontrast i begge udseender, så brugeren tydeligt kan se indholdet.

## Brug Assets til farvetilpasning

Ud over at bruge `colorScheme` til manuel vurdering kan vi også bruge farveressourcer i `Assets` til at tilpasse lys/mørk tilstand.

Denne metode er mere velegnet til at administrere generelle farver i en app.

Find ressource-mappen `Assets` i Xcode-projektet.

![assets](../../../Resource/025_color.png)

Åbn mappen `Assets`, højreklik i et tomt område, og vælg `New Color Set` for at oprette en ny farveressource.

![assets](../../../Resource/025_color1.png)

Her opretter vi en farve og navngiver den `redText`.

![assets](../../../Resource/025_color2.png)

Farveressourcen kan indstilles separat til lys tilstand og mørk tilstand.

![assets](../../../Resource/025_color3.png)

Når du har valgt det tilsvarende farveområde, kan du ændre farven i attributinspektøren i højre side.

Klik på knappen `Hide or show the Inspectors` øverst til højre for at åbne inspektørområdet.

Vælg derefter `Show the Attributes inspector`, find `Show Color Panel` nederst, og åbn farvepanelet.

![assets](../../../Resource/025_color4.png)

Når du klikker på en farve i farvepanelet, ændres det tilsvarende farveområde for `redText` samtidig.

Her indstiller vi `redText` til:

- Vis rød i lys tilstand
- Vis grøn i mørk tilstand

![assets](../../../Resource/025_color5.png)

Tilbage i SwiftUI-koden kan denne farve bruges sådan:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Her betyder:

```swift
Color("redText")
```

at farveressourcen med navnet `redText` læses fra `Assets`.

Visningsresultat:

![assets](../../../Resource/025_view8.png)

Man kan se, at den samme `Color("redText")` viser forskellige farver i lys tilstand og mørk tilstand.

Det viser, at `Assets`-farver også selv understøtter udseendetilpasning.

## Forskellen mellem colorScheme og Assets

Både `colorScheme` og `Assets` kan bruges til udseendetilpasning, men de passer til forskellige scenarier.

Hvis man kun skifter tekstindhold, billednavn eller `SF Symbols`-navn efter lys/mørk tilstand, kan man bruge `colorScheme`.

For eksempel:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Hvis det er farver, der ofte bruges i appen, for eksempel temafarver, kortbaggrunde eller tekstfarver, anbefales det mere at bruge `Assets`-farver.

Fordi `Assets`-farver kan genbruges i flere views, og de er også mere praktiske at ændre senere.

For eksempel:

```swift
Color("redText")
```

På den måde skal farven kun ændres i `Assets`, og alle steder, der bruger denne farve, ændres samtidig.

## Opsummering

I denne lektion lærte vi om udseendetilpasning til lys tilstand og mørk tilstand.

Først lærte vi, hvordan man forhåndsviser forskellige udseender i Xcodes `Canvas`, og vi lærte også, hvordan man bruger `Color Scheme Variants` til at se lys tilstand og mørk tilstand samtidig.

Derefter så vi, at SwiftUI-views som `Text` og `Image` som standard automatisk tilpasser farverne efter systemets udseende.

Men hvis man manuelt angiver faste farver, for eksempel `Color.white` eller `Color.black`, skifter disse farver ikke automatisk.

Derefter lærte vi `@Environment` og `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Ved hjælp af `colorScheme` kan vi afgøre, om den aktuelle tilstand er lys tilstand eller mørk tilstand, og vise forskellige ikoner, tekster eller farver efter udseendet.

Til sidst lærte vi om `Assets`-farver.

`Assets`-farver kan indstilles separat til lys tilstand og mørk tilstand, og de er velegnede til at administrere generelle farveressourcer i en app.

Udseendetilpasning kan give en app bedre visningseffekt både om dagen og om natten og kan også undgå problemer som utydelig tekst og uklare baggrunde.

I faktisk udvikling anbefales det først at bruge SwiftUIs standardtilpasning og `Assets`-farver.

Når tekst, ikoner eller billeder skal skiftes i forskellige udseender, eller når man skal håndtere få særlige visningseffekter, kan man derefter bruge `colorScheme` til vurdering.

## Ekstra viden: angiv skriftstørrelse

Da vi tidligere lærte om `font`, brugte vi nogle systemskriftstile:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Ud over at bruge systemskriftstile som `.largeTitle` og `.callout` kan man også manuelt angive skriftstørrelsen.

For eksempel:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Her betyder:

```swift
.font(.system(size: 100))
```

at skriftstørrelsen sættes til `100 pt`.

For `SF Symbols`-ikoner påvirker `font` også ikonstørrelsen.

Hvis du derfor vil vise ikonet større, kan du angive størrelsen med `.font(.system(size:))`.

For eksempel:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Det er vigtigt at bemærke, at manuel angivelse af skriftstørrelse er mere fleksibelt, men det anbefales ikke at bruge faste skriftstørrelser i stor udstrækning til almindelig tekst.

Til almindelig tekst bør man først bruge systemskriftstile som `.title`, `.headline`, `.body` og `.caption`.

På den måde kan man bedre tilpasse sig forskellige enheder og brugerens skriftstørrelsesindstillinger.
