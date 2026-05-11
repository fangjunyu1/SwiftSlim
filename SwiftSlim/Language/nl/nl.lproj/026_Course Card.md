# Cursuskaart

Deze les is een herhalingsles per fase. We maken een “cursuskaart”.

Met deze oefening kunnen we de eerder geleerde onderdelen `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` en meer herhalen, en leren hoe we meerdere kleine views combineren tot één complete viewmodule.

Effect van de cursuskaart:

![view](../../../Resource/026_view.png)

Deze cursuskaart bestaat vooral uit enkele onderdelen:

- Cursusniveau: `Beginner`
- Cursusinhoud: `20+ Lessons`
- Cursustitel: `SwiftUI Beginner Tutorial`
- Cursusbeschrijving
- Knop: `Start Learning`
- Cursusachtergrond: Swift-pictogram en indigo achtergrond

We kunnen deze view in `ContentView` maken.

## Bovenste gedeelte

Maak eerst het bovenste gedeelte van de cursuskaart.

![view](../../../Resource/026_view1.png)

Links in het bovenste gedeelte wordt het cursusniveau weergegeven, rechts wordt de cursusinhoud weergegeven.

Omdat deze twee onderdelen horizontaal zijn gerangschikt, kunnen we `HStack` gebruiken.

```swift
var topView: some View {
    HStack {
        Text("Beginner")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lessen")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Hier splitsen we het bovenste gedeelte op in een berekende eigenschap:

```swift
var topView: some View
```

Het voordeel hiervan is dat `body` overzichtelijker blijft.

Het bovenste gedeelte gebruikt vooral deze onderdelen:

- `HStack`: rangschikt twee tekstviews horizontaal.
- `Text`: toont tekstinhoud.
- `Spacer()`: duwt de linkertekst naar links en de rechtertekst naar rechts.
- `.font(.footnote)`: stelt een kleinere tekststijl in.
- `.fontWeight(.bold)`: maakt de tekst vet.
- `.foregroundStyle(Color.white)`: stelt de voorgrondkleur in op wit.
- `.padding(.vertical, 10)`: stelt de verticale binnenruimte in.
- `.padding(.horizontal, 16)`: stelt de horizontale binnenruimte in.
- `.background(Color.white.opacity(0.15))`: stelt een halftransparante witte achtergrond in.
- `.cornerRadius(20)`: stelt de hoekradius in.

Hier gebruikt `Beginner` `.padding()` in twee richtingen:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Zo krijgt de tekst zowel boven en onder als links en rechts ruimte, waardoor het meer op een label lijkt.

`Color.white.opacity(0.15)` betekent wit met een ondoorzichtigheid van `15%`, dus een heel lichte witte kleur.

### Kaartachtergrond toevoegen

Eerder hebben we `topView` gemaakt, maar alleen een view maken betekent niet dat deze automatisch wordt weergegeven.

In SwiftUI moet de inhoud die echt op het scherm wordt weergegeven in `body` worden geschreven.

Daarom kunnen we `topView` eerst in `body` plaatsen om deze weer te geven:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Op dit moment zie je dat het bovenste gedeelte al wordt weergegeven:

![view](../../../Resource/026_view2.png)

Maar omdat de tekst in `topView` wit is en de standaardachtergrond ook licht is, is deze in lichte modus mogelijk niet goed te zien.

Daarom kunnen we aan de buitenkant een `VStack` toevoegen en vervolgens voor het hele gebied binnenruimte, een achtergrondkleur en een hoekradius instellen:

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

Weergave-effect:

![view](../../../Resource/026_view3.png)

De `VStack` hier bevat nu alleen één `topView`, waardoor deze misschien overbodig lijkt.

Maar later voegen we nog de cursustitel, de cursusbeschrijving en het knopgedeelte toe. Die onderdelen zijn allemaal verticaal gerangschikt, dus door hier alvast `VStack` te gebruiken kunnen we later gemakkelijker views combineren.

Hier staan twee `.padding()`-modifiers, en ze hebben verschillende functies.

De eerste `.padding(20)` staat vóór `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Deze bepaalt de binnenruimte van de kaart, dus de afstand tussen de inhoud en de rand van de achtergrond.

De tweede `.padding(30)` staat na `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Deze bepaalt de buitenruimte van de kaart, dus de afstand tussen de hele kaart en de rand van het scherm.

![view](../../../Resource/026_view4.png)

Dus ook al zijn ze allebei `.padding()`, op verschillende posities geven ze verschillende effecten.

## Inhoudsgedeelte

Maak daarna het inhoudsgedeelte van de cursuskaart.

Weergave-effect:

![view](../../../Resource/026_view5.png)

Het inhoudsgedeelte bevat de cursustitel en de cursusbeschrijving. Ze zijn verticaal gerangschikt, dus we gebruiken `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI-beginnershandleiding")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Begin vanaf nul met SwiftUI en leer systematisch declaratieve UI-ontwikkeling voor Apple-platforms. Met duidelijke uitleg en praktische voorbeelden krijg je stap voor stap grip op lay-out, interactie en state management, zodat je mooie en nuttige app-interfaces kunt bouwen.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Weergave-effect:

![view](../../../Resource/026_view6.png)

In deze `VStack` worden twee parameters gebruikt:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` betekent dat de views binnen de `VStack` aan de leading-rand worden uitgelijnd.

`spacing: 10` betekent dat de views binnen de `VStack` een afstand van `10 pt` tussen elkaar behouden.

De cursustitel en cursusbeschrijving beginnen dus vanaf de linkerkant en houden een bepaalde afstand tussen elkaar.

De cursusbeschrijving is relatief lang. Als alles wordt weergegeven, wordt de kaart erg hoog. Daarom gebruiken we hier `.lineLimit()` om het aantal weergegeven regels te beperken:

```swift
.lineLimit(3)
```

Dit betekent dat maximaal `3` regels worden weergegeven. Als de inhoud meer regels nodig heeft, wordt het extra deel weggelaten.

### View links uitlijnen

Hier is nog één punt om op te letten.

`VStack(alignment: .leading)` kan alleen de uitlijning van de views binnen de `VStack` bepalen. Het bepaalt niet direct de positie van de `VStack` zelf binnen de externe container.

Als de cursusbeschrijving bijvoorbeeld relatief kort is:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI-beginnershandleiding")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Alleen wat inhoud.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Weergave-effect:

![view](../../../Resource/026_view7.png)

Je kunt zien dat de cursustitel en cursusbeschrijving binnen de `VStack` wel links zijn uitgelijnd, maar de hele `VStack` niet tegen de linkerrand van de kaart staat.

Dat komt doordat de breedte van de `VStack` ook relatief smal wordt wanneer de inhoud kort is. Wanneer de buitenste container de inhoud lay-out, kan deze de smallere `VStack` in het midden plaatsen.

Je kunt het zo begrijpen: `VStack(alignment: .leading)` is verantwoordelijk voor interne linksuitlijning.
Maar het is niet verantwoordelijk voor het naar uiterst links duwen van het hele inhoudsgedeelte.

Als we willen dat het hele inhoudsgedeelte echt links uitlijnt, kunnen we er nog een `HStack` omheen plaatsen en `Spacer()` toevoegen:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI-beginnershandleiding")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Alleen wat inhoud.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Weergave-effect:

![view](../../../Resource/026_view8.png)

De `HStack` hier is een horizontale lay-out.

`Spacer()` neemt de resterende ruimte aan de rechterkant in, waardoor de `VStack` links naar de uiterste linkerkant wordt geduwd.

Daarom kan `HStack + Spacer()` worden gebruikt om de positie van het hele inhoudsgedeelte te bepalen.

In de echte cursuskaart is de cursusbeschrijving relatief lang en neemt deze meestal meer breedte in, dus dit probleem is niet altijd duidelijk. Toch is het belangrijk om dit verschil te begrijpen, omdat je later bij lay-outs met korte tekst vaak vergelijkbare situaties tegenkomt.

### Afstand tussen interne views bepalen

Eerder schreven we `spacing: 10` in `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` wordt gebruikt om de afstand tussen interne views te bepalen.

Als `spacing` niet wordt ingesteld, heeft `VStack` ook een standaardafstand, maar die standaardafstand past niet altijd bij het gewenste effect.

Hier zouden de cursustitel en cursusbeschrijving te dicht op elkaar er rommelig uitzien, dus gebruiken we:

```swift
spacing: 10
```

Zo blijft er een beetje ruimte tussen beide.

Weergave-effect:

![view](../../../Resource/026_view9.png)

Ook het bovenste gedeelte en het inhoudsgedeelte zijn verticaal gerangschikt, dus ook daar kan `spacing` worden gebruikt om de afstand tussen beide te bepalen.

Plaats nu `topView` en `contentView` in `body`:

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

Weergave-effect:

![view](../../../Resource/026_view10.png)

Hier bepaalt `VStack(spacing: 20)` de afstand tussen `topView` en `contentView`.

Met andere woorden:

```swift
VStack(alignment: .leading, spacing: 10)
```

Bepaalt de afstand tussen de cursustitel en de cursusbeschrijving.

```swift
VStack(spacing: 20)
```

Bepaalt de afstand tussen het bovenste gedeelte en het inhoudsgedeelte.

Ze zijn allebei `spacing`, maar ze werken op verschillende `VStack`-containers, dus het bereik dat ze beïnvloeden is ook verschillend.

Daarmee is de view van het inhoudsgedeelte klaar.

## Knopgedeelte

Maak daarna het onderste knopgedeelte.

Weergave-effect:

![view](../../../Resource/026_view11.png)

Het knopgedeelte bestaat vooral uit een afspeelpictogram en een stukje tekst.

We kunnen `Image` gebruiken om het afspeelpictogram weer te geven en `Text` om de knoptekst weer te geven.

Maak hier eerst het uiterlijk van de knop:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("knop aangeklikt")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Begin met leren")
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

Weergave-effect:

![view](../../../Resource/026_view12.png)

Hier worden twee `HStack`-containers gebruikt:

De binnenste `HStack` wordt gebruikt om het pictogram en de tekst horizontaal te rangschikken:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Begin met leren")
}
```

De buitenste `HStack` wordt samen met `Spacer()` gebruikt om het uiterlijk van de knop links uit te lijnen:

```swift
HStack {
    ...
    Spacer()
}
```

Wanneer op de knop wordt getikt, geeft de console `knop aangeklikt` weer.

## Basiskaart voltooid

Combineer nu het bovenste gedeelte, het inhoudsgedeelte en het knopgedeelte:

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

Weergave-effect:

![view](../../../Resource/026_view13.png)

Op dit punt is een basisversie van de cursuskaart voltooid.

## Swift-pictogramachtergrond

Tot slot voegen we een halftransparante Swift-pictogramachtergrond toe aan de kaart.

![view](../../../Resource/026_view.png)

Eerder gebruikten we `Color.indigo` als achtergrondkleur. In feite kan `.background()` naast een kleur ook een volledige view toevoegen.

Daarom kunnen we eerst een aparte achtergrondview maken:

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

In deze achtergrondview gebruiken we `VStack`, `HStack` en `Spacer()` om het Swift-pictogram naar de rechteronderhoek te duwen.

Omdat het Swift-pictogram alleen als decoratieve achtergrond wordt gebruikt, gebruiken we hier halftransparant wit:

```swift
Color.white.opacity(0.15)
```

Zo wordt het pictogram niet te opvallend en beïnvloedt het de tekstinhoud ervoor niet.

Voeg vervolgens `backgroundView` toe aan de kaart:

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

Eindresultaat:

![view](../../../Resource/026_view14.png)

Hier worden twee `.background()`-modifiers achter elkaar gebruikt:

```swift
.background(backgroundView)
.background(Color.indigo)
```

De eerste `.background()` wordt gebruikt om de Swift-pictogramachtergrond toe te voegen.
De tweede `.background()` wordt gebruikt om de indigo achtergrond toe te voegen.

Zo verschijnt het Swift-pictogram boven de indigo achtergrond en wordt het als onderdeel van de kaartachtergrond weergegeven.

Hieruit kunnen we zien dat `.background()` niet alleen kleuren kan toevoegen, maar ook aangepaste views. Meerdere `.background()`-modifiers kunnen bovendien worden gecombineerd om rijkere achtergrondeffecten te maken.

Op dit punt is een complete cursuskaart klaar.

## Samenvatting

In deze les hebben we via een cursuskaart veelgebruikte basislay-outs in SwiftUI herhaald.

We gebruikten `Text` om tekst weer te geven, `Image` om een systeempictogram weer te geven, en `VStack`, `HStack` en `Spacer()` om de rangschikking van views te bepalen.

We leerden `.lineLimit()`, waarmee je het maximale aantal regels voor tekst kunt beperken. Wanneer de inhoud de limiet overschrijdt, wordt het extra deel weggelaten.

Tegelijk hebben we ook veelgebruikte modifiers zoals `.padding()`, `.background()`, `.cornerRadius()` en `.foregroundStyle()` herhaald.

Na het afronden van deze les kunnen we meerdere kleine views al combineren tot een complete kaartmodule.

Dit is ook een heel gebruikelijke werkwijze in SwiftUI-ontwikkeling: splits views eerst op in kleine onderdelen en combineer ze daarna tot een complete interface.

## Volledige code

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
            Text("Beginner")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lessen")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI-beginnershandleiding")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Begin vanaf nul met SwiftUI en leer systematisch declaratieve UI-ontwikkeling voor Apple-platforms. Met duidelijke uitleg en praktische voorbeelden krijg je stap voor stap grip op lay-out, interactie en state management, zodat je mooie en nuttige app-interfaces kunt bouwen.")
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
    	        print("knop aangeklikt")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Begin met leren")
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
