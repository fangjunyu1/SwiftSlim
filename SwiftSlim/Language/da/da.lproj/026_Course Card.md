# Kursuskort

Denne lektion er en opsamlingslektion, hvor vi færdiggør et “kursuskort”.

Gennem denne øvelse kan vi repetere det, vi tidligere har lært om `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` osv., og lære, hvordan flere små views kan kombineres til et komplet view-modul.

Effekt af kursuskortet:

![view](../../../Resource/026_view.png)

Dette kursuskort består hovedsageligt af flere dele:

- Kursusniveau: `Beginner`
- Kursusindhold: `20+ Lessons`
- Kursustitel: `SwiftUI Beginner Tutorial`
- Kursusbeskrivelse
- Knap: `Start Learning`
- Kursusbaggrund: Swift-ikon og indigoblå baggrund

Vi kan færdiggøre dette view i `ContentView`.

## Øverste område

Først opretter vi kursuskortets øverste område.

![view](../../../Resource/026_view1.png)

Venstre side af det øverste område viser kursusniveauet, og højre side viser kursusindholdet.

Da disse to elementer er placeret vandret, kan vi bruge `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Begynder")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lektioner")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Her opdeler vi det øverste område i en beregnet egenskab:

```swift
var topView: some View
```

Fordelen ved dette er, at `body` bliver mere overskuelig.

Det øverste område bruger hovedsageligt disse elementer:

- `HStack`: lader to tekstvisninger blive placeret vandret.
- `Text`: viser tekstindhold.
- `Spacer()`: skubber teksten i venstre side mod venstre og teksten i højre side mod højre.
- `.font(.footnote)`: indstiller en mindre tekststil.
- `.fontWeight(.bold)`: gør teksten fed.
- `.foregroundStyle(Color.white)`: indstiller forgrundsfarven til hvid.
- `.padding(.vertical, 10)`: indstiller lodret indvendig afstand.
- `.padding(.horizontal, 16)`: indstiller vandret indvendig afstand.
- `.background(Color.white.opacity(0.15))`: indstiller en halvgennemsigtig hvid baggrund.
- `.cornerRadius(20)`: indstiller afrundede hjørner.

Her bruger `Beginner` `.padding()` i to retninger:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

På den måde får teksten plads både over/under og til venstre/højre, så den ligner mere et mærke.

`Color.white.opacity(0.15)` betyder hvid med en opacitet på `15%`, altså en meget lys hvid.

### Tilføj kortbaggrund

Tidligere oprettede vi `topView`, men blot at oprette et view får det ikke automatisk vist.

I SwiftUI skal det indhold, der faktisk vises på skærmen, skrives i `body`.

Derfor kan vi først placere `topView` i `body`, så det vises:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Nu kan man se, at det øverste område allerede vises:

![view](../../../Resource/026_view2.png)

Men fordi teksten i `topView` er hvid, og standardbaggrunden også er lys, kan den i lys tilstand være svær at se.

Derfor kan vi tilføje en `VStack` i det ydre lag og derefter indstille indvendig afstand, baggrundsfarve og afrundede hjørner for hele området:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Visningseffekt:

![view](../../../Resource/026_view3.png)

Denne `VStack` indeholder i øjeblikket kun ét `topView`, så den virker måske ikke nødvendig.

Men senere vil vi fortsætte med at tilføje kursustitel, kursusbeskrivelse og knapområde. De er alle indhold, der placeres lodret, så vi bruger her `VStack` på forhånd, så det bliver lettere at kombinere views senere.

Her er der to `.padding()`, og deres funktion er forskellig.

Den første `.padding(20)` står før `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Den styrer kortets indvendige afstand, altså afstanden mellem indholdet og baggrundens kant.

Den anden `.padding(30)` står efter `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Den styrer kortets udvendige afstand, altså afstanden mellem hele kortet og skærmens kant.

![view](../../../Resource/026_view4.png)

Så selv om det begge steder er `.padding()`, vil effekten være forskellig, når den skrives forskellige steder.

## Indholdsområde

Dernæst opretter vi kursuskortets indholdsområde.

Visningseffekt:

![view](../../../Resource/026_view5.png)

Indholdsområdet indeholder kursustitel og kursusbeskrivelse. De er placeret lodret, så vi bruger `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI for begyndere")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Start helt fra bunden med SwiftUI, og lær Apples deklarative UI-udvikling systematisk. Gennem klare forklaringer og praktiske eksempler lærer du gradvist layout, interaktion og tilstandsstyring, så du kan bygge smukke og nyttige appgrænseflader.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Visningseffekt:

![view](../../../Resource/026_view6.png)

Her bruger `VStack` to parametre:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` betyder, at views inde i `VStack` venstrejusteres.

`spacing: 10` betyder, at views inde i `VStack` holder en afstand på `10 pt` til hinanden.

Derfor starter kursustitlen og kursusbeskrivelsen fra venstre side, og der bevares en vis afstand mellem dem.

Kursusbeskrivelsen er relativt lang. Hvis den vises fuldt ud, bliver kortet meget højt, så her bruger vi `.lineLimit()` til at begrænse antallet af viste linjer:

```swift
.lineLimit(3)
```

Det betyder, at der højst vises `3` linjer, og når indholdet overstiger denne grænse, bliver den overskydende del udeladt.

### Venstrejuster views

Her er der også et punkt, man skal være opmærksom på.

`VStack(alignment: .leading)` kan kun styre justeringen af views inde i `VStack`. Den styrer ikke direkte placeringen af selve `VStack` i den ydre container.

Hvis kursusbeskrivelsen for eksempel er relativt kort:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI for begyndere")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Bare noget indhold.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Visningseffekt:

![view](../../../Resource/026_view7.png)

Man kan se, at kursustitlen og kursusbeskrivelsen ganske vist er venstrejusteret inde i `VStack`, men hele `VStack` ligger ikke helt ude ved kortets venstre side.

Det skyldes, at når indholdet er relativt kort, bliver bredden på `VStack` også relativt smal. Når den ydre container laver layout, kan den placere denne smallere `VStack` i midten.

Det kan forstås sådan: `VStack(alignment: .leading)` er ansvarlig for venstrejustering internt.
Men den er ikke ansvarlig for at skubbe hele indholdsområdet helt ud til venstre.

Hvis du vil have hele indholdsområdet til virkelig at ligge til venstre, kan du pakke det ind i et ekstra `HStack` udenom og tilføje `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI for begyndere")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Bare noget indhold.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Visningseffekt:

![view](../../../Resource/026_view8.png)

Her er `HStack` et vandret layout.

`Spacer()` optager den resterende plads i højre side og skubber dermed den venstre `VStack` helt ud til venstre.

Derfor kan `HStack + Spacer()` bruges til at styre placeringen af hele indholdsområdet.

I det faktiske kursuskort er kursusbeskrivelsen relativt lang og vil normalt optage mere bredde, så dette problem er ikke nødvendigvis tydeligt. Men det er vigtigt at forstå forskellen, fordi man ofte møder lignende situationer, når man senere laver layout med korte tekster.

### Styr afstanden mellem interne views

Tidligere skrev vi `spacing: 10` i `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` bruges til at styre afstanden mellem interne views.

Hvis `spacing` ikke angives, vil `VStack` også have en standardafstand, men standardafstanden passer ikke nødvendigvis til den effekt, vi ønsker.

Her ville kursustitlen og kursusbeskrivelsen virke klemt, hvis de stod for tæt, så vi bruger:

```swift
spacing: 10
```

Så der bevares lidt plads mellem dem.

Visningseffekt:

![view](../../../Resource/026_view9.png)

På samme måde er det øverste område og indholdsområdet også placeret lodret, så vi kan også bruge `spacing` til at styre afstanden mellem dem.

Nu placerer vi `topView` og `contentView` i `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Visningseffekt:

![view](../../../Resource/026_view10.png)

Her styrer `VStack(spacing: 20)` afstanden mellem `topView` og `contentView`.

Det vil sige:

```swift
VStack(alignment: .leading, spacing: 10)
```

styrer afstanden mellem kursustitlen og kursusbeskrivelsen.

```swift
VStack(spacing: 20)
```

styrer afstanden mellem det øverste område og indholdsområdet.

De bruger begge `spacing`, men de virker på forskellige `VStack`, så det område, de påvirker, er også forskelligt.

Dermed er viewet for indholdsområdet færdigt.

## Knapområde

Dernæst opretter vi det nederste knapområde.

Visningseffekt:

![view](../../../Resource/026_view11.png)

Knapområdet består hovedsageligt af et afspilningsikon og et stykke tekst.

Vi kan bruge `Image` til at vise afspilningsikonet og `Text` til at vise knappens tekst.

Her opretter vi først knappens udseende:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("klik på knap")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Begynd at lære")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Visningseffekt:

![view](../../../Resource/026_view12.png)

Her bruger vi to `HStack`:

Den indre `HStack` bruges til at placere ikonet og teksten vandret:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Begynd at lære")
}
```

Den ydre `HStack` bruges sammen med `Spacer()` til at lade knappens udseende ligge til venstre:

```swift
HStack {
    ...
    Spacer()
}
```

Når der trykkes på knappen, udskriver konsollen `klik på knap`.

## Grundkort færdigt

Nu kombinerer vi det øverste område, indholdsområdet og knapområdet:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Visningseffekt:

![view](../../../Resource/026_view13.png)

Hertil er et grundlæggende kursuskort færdigt.

## Swift-ikonbaggrund

Til sidst tilføjer vi et halvgennemsigtigt Swift-ikon som baggrund på kortet.

![view](../../../Resource/026_view.png)

Tidligere brugte vi `Color.indigo` som baggrundsfarve. Faktisk kan `.background()` ikke kun tilføje en farve, men også et komplet view.

Derfor kan vi først oprette et særligt baggrundsview:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

I dette baggrundsview bruger vi `VStack`, `HStack` og `Spacer()` til at skubbe Swift-ikonet ned i nederste højre hjørne.

Fordi Swift-ikonet kun bruges som dekorativ baggrund, bruger vi her halvgennemsigtig hvid:

```swift
Color.white.opacity(0.15)
```

På den måde bliver ikonet ikke for tydeligt, og det påvirker ikke tekstindholdet foran.

Derefter tilføjer vi `backgroundView` til kortet:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Implementeringseffekt:

![view](../../../Resource/026_view14.png)

Her bruger vi to `.background()` lige efter hinanden:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Den første `.background()` bruges til at tilføje Swift-ikonbaggrunden.
Den anden `.background()` bruges til at tilføje den indigoblå baggrund.

På den måde vises Swift-ikonet oven på den indigoblå baggrund og som en del af kortets baggrund.

Heraf kan vi se, at `.background()` ikke kun kan tilføje farver, men også brugerdefinerede views. Flere `.background()` kan også kombineres for at skabe rigere baggrundseffekter.

Hertil er et komplet kursuskort færdigt.

## Opsummering

I denne lektion repeterede vi almindelige grundlæggende layoutmetoder i SwiftUI gennem et kursuskort.

Vi brugte `Text` til at vise tekst, `Image` til at vise systemikoner og `VStack`, `HStack` og `Spacer()` til at styre placeringen af views.

Vi lærte `.lineLimit()`, som kan begrænse det maksimale antal tekstlinjer. Når indholdet overstiger grænsen, bliver den overskydende del udeladt.

Samtidig repeterede vi også almindelige modifikatorer som `.padding()`, `.background()`, `.cornerRadius()` og `.foregroundStyle()`.

Efter denne lektion kan vi allerede kombinere flere små views til et komplet kortmodul.

Det er også en meget almindelig tankegang i SwiftUI-udvikling: først opdele i små views og derefter kombinere dem til en komplet grænseflade.

## Fuld kode

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Begynder")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lektioner")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI for begyndere")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Start helt fra bunden med SwiftUI, og lær Apples deklarative UI-udvikling systematisk. Gennem klare forklaringer og praktiske eksempler lærer du gradvist layout, interaktion og tilstandsstyring, så du kan bygge smukke og nyttige appgrænseflader.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("klik på knap")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Begynd at lære")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
