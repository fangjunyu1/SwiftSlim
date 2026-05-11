# Kurskort

Denne leksjonen er en oppsummeringsleksjon for et trinn. Vi skal lage et «kurskort».

Gjennom denne øvelsen kan vi repetere `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` og annet innhold vi har lært tidligere, og lære hvordan vi kombinerer flere små visninger til en komplett visningsmodul.

Effekten for kurskortet:

![view](../../../Resource/026_view.png)

Dette kurskortet består hovedsakelig av flere deler:

- Kursnivå: `Beginner`
- Kursinnhold: `20+ Lessons`
- Kurstittel: `SwiftUI Beginner Tutorial`
- Kursbeskrivelse
- Knapp: `Start Learning`
- Kursbakgrunn: Swift-ikon og indigofarget bakgrunn

Vi kan lage denne visningen i `ContentView`.

## Toppområde

Først lager vi toppområdet på kurskortet.

![view](../../../Resource/026_view1.png)

Venstre side av toppområdet viser kursnivået, og høyre side viser kursinnholdet.

Siden disse to innholdselementene er plassert horisontalt, kan vi bruke `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Nybegynner")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ leksjoner")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Her deler vi toppområdet ut i en beregnet egenskap:

```swift
var topView: some View
```

Fordelen med å gjøre dette er at `body` blir ryddigere.

Toppområdet bruker hovedsakelig dette innholdet:

- `HStack`: plasserer to tekstvisninger horisontalt.
- `Text`: viser tekstinnhold.
- `Spacer()`: skyver teksten til venstre mot venstre og teksten til høyre mot høyre.
- `.font(.footnote)`: setter en mindre tekststil.
- `.fontWeight(.bold)`: gjør teksten fet.
- `.foregroundStyle(Color.white)`: setter forgrunnsfargen til hvit.
- `.padding(.vertical, 10)`: setter vertikal innvendig avstand.
- `.padding(.horizontal, 16)`: setter horisontal innvendig avstand.
- `.background(Color.white.opacity(0.15))`: setter en gjennomskinnelig hvit bakgrunn.
- `.cornerRadius(20)`: setter hjørneradiusen.

Her bruker `Beginner` `.padding()` i to retninger:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Dette gir teksten plass både vertikalt og horisontalt, slik at den ser mer ut som en etikett.

`Color.white.opacity(0.15)` betyr hvit med `15%` opasitet, altså en svært lys hvitfarge.

### Legg til kortbakgrunnen

Tidligere opprettet vi `topView`, men det å bare opprette en visning gjør ikke at den vises automatisk.

I SwiftUI må innholdet som faktisk vises på skjermen, skrives i `body`.

Derfor kan vi først legge `topView` inn i `body` for å vise den:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Nå vil du se at toppområdet allerede vises:

![view](../../../Resource/026_view2.png)

Men fordi teksten i `topView` er hvit, og standardbakgrunnen også er lys, kan den være vanskelig å se tydelig i lys modus.

Derfor kan vi legge til en `VStack` utenpå, og deretter sette innvendig avstand, bakgrunnsfarge og hjørneradius for hele området:

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

Vist effekt:

![view](../../../Resource/026_view3.png)

Denne `VStack` inneholder foreløpig bare én `topView`, så den kan virke unødvendig.

Men senere skal vi fortsette å legge til kurstittel, kursbeskrivelse og knappeområde. Dette er alt innhold som er plassert vertikalt, så ved å bruke `VStack` her på forhånd blir det enklere å kombinere visninger videre.

Her finnes det to `.padding()`-modifikatorer, og de har ulike funksjoner.

Den første `.padding(20)` skrives før `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Den styrer kortets indre avstand, altså avstanden mellom innholdet og kanten på bakgrunnen.

Den andre `.padding(30)` skrives etter `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Den styrer kortets ytre avstand, altså avstanden mellom hele kortet og skjermkanten.

![view](../../../Resource/026_view4.png)

Selv om begge er `.padding()`, gir de altså ulike effekter når de plasseres på ulike steder.

## Innholdsområde

Deretter lager vi innholdsområdet på kurskortet.

Vist effekt:

![view](../../../Resource/026_view5.png)

Innholdsområdet inneholder kurstittelen og kursbeskrivelsen. De er plassert vertikalt, så vi bruker `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI for nybegynnere")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Start fra null med SwiftUI og lær Apples deklarative UI-utvikling systematisk. Gjennom tydelige forklaringer og praktiske eksempler vil du gradvis mestre layout, interaksjon og tilstandshåndtering for å bygge pene og nyttige appgrensesnitt.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Vist effekt:

![view](../../../Resource/026_view6.png)

I denne `VStack` brukes to parametere:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` betyr at visningene inne i `VStack` justeres mot forkanten.

`spacing: 10` betyr at visningene inne i `VStack` har en avstand på `10 pt` mellom seg.

Derfor starter kurstittelen og kursbeskrivelsen fra venstre side, og de holder en viss avstand mellom seg.

Kursbeskrivelsen er relativt lang. Hvis alt innholdet vises, blir kortet veldig høyt, så her brukes `.lineLimit()` for å begrense antall linjer som vises:

```swift
.lineLimit(3)
```

Det betyr at det vises maksimalt `3` linjer. Når innholdet overskrider linjebegrensningen, blir den ekstra delen utelatt.

### Venstrejuster visningen

Her er det ett punkt til som er verdt å merke seg.

`VStack(alignment: .leading)` kan bare styre justeringen av visningene inne i `VStack`. Den styrer ikke direkte plasseringen av selve `VStack` inne i den ytre beholderen.

For eksempel, hvis kursbeskrivelsen er relativt kort:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI for nybegynnere")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Bare litt innhold.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Vist effekt:

![view](../../../Resource/026_view7.png)

Du kan se at selv om kurstittelen og kursbeskrivelsen er venstrejustert inne i `VStack`, ligger ikke hele `VStack` inntil venstre kant av kortet.

Dette er fordi når innholdet er kort, blir bredden på `VStack` også relativt smal. Når den ytre beholderen legger ut innholdet, kan den plassere denne smalere `VStack` i midten.

Du kan forstå det slik: `VStack(alignment: .leading)` har ansvar for intern venstrejustering.
Men den har ikke ansvar for å skyve hele innholdsområdet helt til venstre.

Hvis vi vil at hele innholdsområdet faktisk skal venstrejusteres, kan vi pakke det inn i en ny `HStack` og legge til `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI for nybegynnere")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Bare litt innhold.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Vist effekt:

![view](../../../Resource/026_view8.png)

Denne `HStack` er en horisontal layout.

`Spacer()` tar opp den gjenværende plassen på høyre side, og skyver dermed `VStack` på venstre side helt til venstre.

Derfor kan `HStack + Spacer()` brukes til å styre plasseringen av hele innholdsområdet.

I det faktiske kurskortet er kursbeskrivelsen relativt lang og tar vanligvis opp mer bredde, så dette problemet er ikke nødvendigvis tydelig. Men det er viktig å forstå denne forskjellen, fordi lignende situasjoner ofte dukker opp senere når vi lager oppsett med korte tekster.

### Kontroller avstanden mellom interne visninger

Tidligere skrev vi `spacing: 10` i `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` brukes til å styre avstanden mellom interne visninger.

Hvis `spacing` ikke settes, har `VStack` også en standardavstand, men standardavstanden passer ikke nødvendigvis til effekten vi ønsker.

Her vil oppsettet se trangt ut hvis kurstittelen og kursbeskrivelsen ligger for nær hverandre, så vi bruker:

```swift
spacing: 10
```

Dette lar det være litt plass mellom dem.

Vist effekt:

![view](../../../Resource/026_view9.png)

På samme måte er toppområdet og innholdsområdet også plassert vertikalt, så `spacing` kan også brukes til å styre avstanden mellom dem.

Nå legger vi `topView` og `contentView` inn i `body`:

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

Vist effekt:

![view](../../../Resource/026_view10.png)

Her styrer `VStack(spacing: 20)` avstanden mellom `topView` og `contentView`.

Med andre ord:

```swift
VStack(alignment: .leading, spacing: 10)
```

Styrer avstanden mellom kurstittelen og kursbeskrivelsen.

```swift
VStack(spacing: 20)
```

Styrer avstanden mellom toppområdet og innholdsområdet.

Begge er `spacing`, men de virker på ulike `VStack`-beholdere, så området de påvirker er også forskjellig.

Slik er visningen for innholdsområdet ferdig.

## Knappeområde

Deretter lager vi det nederste knappeområdet.

Vist effekt:

![view](../../../Resource/026_view11.png)

Knappeområdet består hovedsakelig av et avspillingsikon og en tekst.

Vi kan bruke `Image` til å vise avspillingsikonet og `Text` til å vise knappeteksten.

Her lager vi først knappens utseende:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("knapp trykket")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Start læringen")
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

Vist effekt:

![view](../../../Resource/026_view12.png)

Her brukes to `HStack`-beholdere:

Den indre `HStack` brukes til å plassere ikonet og teksten horisontalt:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Start læringen")
}
```

Den ytre `HStack`, sammen med `Spacer()`, brukes til å venstrejustere knappens utseende:

```swift
HStack {
    ...
    Spacer()
}
```

Når knappen trykkes, skriver konsollen ut `knapp trykket`.

## Grunnkortet er ferdig

Nå kombinerer vi toppområdet, innholdsområdet og knappeområdet:

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

Vist effekt:

![view](../../../Resource/026_view13.png)

På dette tidspunktet er et grunnleggende kurskort ferdig.

## Swift-ikonbakgrunn

Til slutt legger vi til en gjennomskinnelig Swift-ikonbakgrunn på kortet.

![view](../../../Resource/026_view.png)

Tidligere brukte vi `Color.indigo` som bakgrunnsfarge. Faktisk kan `.background()` ikke bare legge til en farge, men også en komplett visning.

Derfor kan vi først opprette en egen bakgrunnsvisning:

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

I denne bakgrunnsvisningen bruker vi `VStack`, `HStack` og `Spacer()` for å skyve Swift-ikonet ned i høyre hjørne.

Fordi Swift-ikonet bare brukes som dekorativ bakgrunn, bruker vi gjennomskinnelig hvit her:

```swift
Color.white.opacity(0.15)
```

På denne måten blir ikke ikonet for fremtredende, og det påvirker ikke tekstinnholdet foran.

Deretter legger vi `backgroundView` til kortet:

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

Endelig effekt:

![view](../../../Resource/026_view14.png)

Her brukes to `.background()`-modifikatorer etter hverandre:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Den første `.background()` brukes til å legge til Swift-ikonbakgrunnen.
Den andre `.background()` brukes til å legge til den indigofargede bakgrunnen.

Slik vises Swift-ikonet over den indigofargede bakgrunnen, og det blir en del av kortbakgrunnen.

Her ser vi at `.background()` ikke bare kan legge til farger, men også egendefinerte visninger. Flere `.background()`-modifikatorer kan også kombineres for å lage rikere bakgrunnseffekter.

På dette tidspunktet er et komplett kurskort ferdig.

## Oppsummering

I denne leksjonen repeterte vi vanlige grunnleggende layoutmetoder i SwiftUI gjennom et kurskort.

Vi brukte `Text` til å vise tekst, `Image` til å vise et systemikon, og `VStack`, `HStack` og `Spacer()` til å styre visningenes plassering.

Vi lærte `.lineLimit()`, som kan begrense det maksimale antallet linjer en tekst viser. Når innholdet overskrider begrensningen, blir den ekstra delen utelatt.

Samtidig repeterte vi også vanlige modifikatorer som `.padding()`, `.background()`, `.cornerRadius()` og `.foregroundStyle()`.

Etter å ha fullført denne leksjonen kan vi allerede kombinere flere små visninger til en komplett kortmodul.

Dette er også en svært vanlig tankegang i SwiftUI-utvikling: del først visninger inn i små deler, og kombiner dem deretter til et komplett grensesnitt.

## Fullstendig kode

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
            Text("Nybegynner")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ leksjoner")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI for nybegynnere")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Start fra null med SwiftUI og lær Apples deklarative UI-utvikling systematisk. Gjennom tydelige forklaringer og praktiske eksempler vil du gradvis mestre layout, interaksjon og tilstandshåndtering for å bygge pene og nyttige appgrensesnitt.")
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
    	        print("knapp trykket")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Start læringen")
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
