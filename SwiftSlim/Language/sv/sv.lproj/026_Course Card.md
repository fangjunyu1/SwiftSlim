# Kurskort

Den här lektionen är en repetitionslektion för ett delmoment. Vi ska skapa ett ”kurskort”.

Genom den här övningen kan vi repetera `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` och annat som vi har lärt oss tidigare, och lära oss hur flera små vyer kan kombineras till en komplett vymodul.

Kurskortets effekt:

![view](../../../Resource/026_view.png)

Det här kurskortet består huvudsakligen av flera delar:

- Kursnivå: `Nybörjare`
- Kursinnehåll: `20+ lektioner`
- Kurstitel: `SwiftUI-handledning för nybörjare`
- Kursbeskrivning
- Knapp: `Börja lära`
- Kursbakgrund: Swift-ikon och indigofärgad bakgrund

Vi kan färdigställa den här vyn i `ContentView`.

## Övre område

Först skapar vi kurskortets övre område.

![view](../../../Resource/026_view1.png)

Den vänstra sidan av det övre området visar kursnivån, och den högra sidan visar kursinnehållet.

Eftersom dessa två innehållsdelar ligger horisontellt kan vi använda `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Nybörjare")
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

Här delar vi upp det övre området i en beräknad egenskap:

```swift
var topView: some View
```

Fördelen med detta är att `body` blir tydligare.

Det övre området använder främst följande innehåll:

- `HStack`: placerar två texter horisontellt.
- `Text`: visar textinnehåll.
- `Spacer()`: skjuter den vänstra texten åt vänster och den högra texten åt höger.
- `.font(.footnote)`: ställer in en mindre textstil.
- `.fontWeight(.bold)`: gör texten fet.
- `.foregroundStyle(Color.white)`: ställer in förgrundsfärgen till vit.
- `.padding(.vertical, 10)`: ställer in lodrät utfyllnad.
- `.padding(.horizontal, 16)`: ställer in vågrät utfyllnad.
- `.background(Color.white.opacity(0.15))`: ställer in en halvtransparent vit bakgrund.
- `.cornerRadius(20)`: ställer in hörnradien.

Här använder `Nybörjare` `.padding()` i två riktningar:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Det ger texten utrymme både uppåt/nedåt och åt vänster/höger, så att den ser mer ut som en etikett.

`Color.white.opacity(0.15)` betyder vit färg med `15%` opacitet, alltså en mycket svag vit färg.

### Lägg till kortbakgrunden

Tidigare skapade vi `topView`, men att bara skapa en vy gör inte att den visas automatiskt.

I SwiftUI måste innehållet som faktiskt visas på skärmen skrivas i `body`.

Därför kan vi först placera `topView` i `body` för att visa den:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Nu kan du se att det övre området redan visas:

![view](../../../Resource/026_view2.png)

Men eftersom texten i `topView` är vit och standardbakgrunden också är ljus, kan den vara svår att se tydligt i ljust läge.

Därför kan vi lägga till en `VStack` utanför och sedan ställa in utfyllnad, bakgrundsfärg och hörnradie för hela området:

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

Den här `VStack` innehåller för närvarande bara en `topView`, så den kan se onödig ut.

Men senare fortsätter vi att lägga till kurstiteln, kursbeskrivningen och knappområdet. De är alla innehåll som ordnas lodrätt, så om vi använder `VStack` här i förväg blir det enklare att fortsätta kombinera vyer senare.

Här finns två `.padding()`-modifierare, och de har olika funktioner.

Den första `.padding(20)` skrivs före `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Den styr kortets inre utfyllnad, alltså avståndet mellan innehållet och bakgrundens kant.

Den andra `.padding(30)` skrivs efter `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Den styr kortets yttre utfyllnad, alltså avståndet mellan hela kortet och skärmens kant.

![view](../../../Resource/026_view4.png)

Alltså: även om båda är `.padding()`, ger olika placeringar olika effekter.

## Innehållsområde

Därefter skapar vi kurskortets innehållsområde.

Visningseffekt:

![view](../../../Resource/026_view5.png)

Innehållsområdet innehåller kurstiteln och kursbeskrivningen. De ligger lodrätt, så vi använder `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI-handledning för nybörjare")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Börja från noll med SwiftUI och lär dig Apples deklarativa UI-utveckling steg för steg. Genom tydliga förklaringar och praktiska exempel lär du dig gradvis layout, interaktion och tillståndshantering för att bygga vackra och användbara appgränssnitt.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Visningseffekt:

![view](../../../Resource/026_view6.png)

I den här `VStack` används två parametrar:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` betyder att vyerna inuti `VStack` justeras mot den ledande kanten.

`spacing: 10` betyder att vyerna inuti `VStack` behåller ett avstånd på `10 pt` mellan sig.

Därför börjar kurstiteln och kursbeskrivningen från vänster sida och behåller ett visst avstånd mellan sig.

Kursbeskrivningen är relativt lång. Om allt visas blir kortet mycket högt, så här använder vi `.lineLimit()` för att begränsa antalet visade rader:

```swift
.lineLimit(3)
```

Det betyder att högst `3` rader visas. När innehållet överskrider radgränsen utelämnas den extra delen.

### Vänsterjustera vyn

Här finns ytterligare en sak att lägga märke till.

`VStack(alignment: .leading)` kan bara styra justeringen av vyerna inuti `VStack`. Den styr inte direkt positionen för själva `VStack` i den yttre behållaren.

Till exempel, om kursbeskrivningen är relativt kort:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI-handledning för nybörjare")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Bara lite innehåll.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Visningseffekt:

![view](../../../Resource/026_view7.png)

Du kan se att kurstiteln och kursbeskrivningen visserligen är vänsterjusterade inuti `VStack`, men hela `VStack` ligger inte intill kortets vänstra kant.

Det beror på att när innehållet är kort blir bredden på `VStack` också relativt smal. När den yttre behållaren layoutar innehållet kan den placera denna smalare `VStack` i mitten.

Du kan förstå det så här: `VStack(alignment: .leading)` ansvarar för intern vänsterjustering.
Men den ansvarar inte för att skjuta hela innehållsområdet längst åt vänster.

Om vi vill att hela innehållsområdet verkligen ska ligga till vänster kan vi lägga en `HStack` runt det och lägga till `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI-handledning för nybörjare")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Bara lite innehåll.")
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

Den här `HStack` är en horisontell layout.

`Spacer()` tar upp det återstående utrymmet till höger, vilket skjuter den vänstra `VStack` längst åt vänster.

Därför kan `HStack + Spacer()` användas för att styra positionen för hela innehållsområdet.

I det faktiska kurskortet är kursbeskrivningen relativt lång och tar vanligtvis upp mer bredd, så det här problemet märks inte nödvändigtvis. Men det är viktigt att förstå skillnaden, eftersom liknande situationer ofta uppstår senare när vi bygger layouter med kort text.

### Styr avståndet mellan interna vyer

Tidigare skrev vi `spacing: 10` i `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` används för att styra avståndet mellan interna vyer.

Om `spacing` inte ställs in har `VStack` också ett standardavstånd, men standardavståndet passar inte alltid den effekt vi vill ha.

Här ser layouten trång ut om kurstiteln och kursbeskrivningen ligger för nära varandra, så vi använder:

```swift
spacing: 10
```

Det gör att det finns lite utrymme mellan dem.

Visningseffekt:

![view](../../../Resource/026_view9.png)

På samma sätt är det övre området och innehållsområdet också ordnade lodrätt, så `spacing` kan även användas för att styra avståndet mellan dem.

Nu placerar vi `topView` och `contentView` i `body`:

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

Här styr `VStack(spacing: 20)` avståndet mellan `topView` och `contentView`.

Med andra ord:

```swift
VStack(alignment: .leading, spacing: 10)
```

Styr avståndet mellan kurstiteln och kursbeskrivningen.

```swift
VStack(spacing: 20)
```

Styr avståndet mellan det övre området och innehållsområdet.

Båda är `spacing`, men de verkar på olika `VStack`-behållare, så området de påverkar är också olika.

Därmed är innehållsområdets vy klar.

## Knappområde

Därefter skapar vi det nedre knappområdet.

Visningseffekt:

![view](../../../Resource/026_view11.png)

Knappområdet består huvudsakligen av en uppspelningsikon och en text.

Vi kan använda `Image` för att visa uppspelningsikonen och `Text` för att visa knapptexten.

Här skapar vi först knappens utseende:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("knappen trycktes")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Börja lära")
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

Här används två `HStack`:

Den inre `HStack` används för att placera ikonen och texten horisontellt:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Börja lära")
}
```

Den yttre `HStack`, tillsammans med `Spacer()`, används för att vänsterjustera knappens utseende:

```swift
HStack {
    ...
    Spacer()
}
```

När knappen trycks skriver konsolen ut `knappen trycktes`.

## Grundkortet är klart

Nu kombinerar vi det övre området, innehållsområdet och knappområdet:

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

Nu är ett grundläggande kurskort klart.

## Swift-ikonbakgrund

Till sist lägger vi till en halvtransparent Swift-ikon som bakgrund i kortet.

![view](../../../Resource/026_view.png)

Tidigare använde vi `Color.indigo` som bakgrundsfärg. I själva verket kan `.background()` inte bara lägga till en färg, utan även en komplett vy.

Därför kan vi först skapa en särskild bakgrundsvy:

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

I den här bakgrundsvyn använder vi `VStack`, `HStack` och `Spacer()` för att skjuta Swift-ikonen till det nedre högra hörnet.

Eftersom Swift-ikonen bara används som en dekorativ bakgrund använder vi halvtransparent vit färg här:

```swift
Color.white.opacity(0.15)
```

På så sätt blir ikonen inte för framträdande och påverkar inte textinnehållet framför.

Därefter lägger vi till `backgroundView` i kortet:

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

Slutlig effekt:

![view](../../../Resource/026_view14.png)

Här används två `.background()` i följd:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Den första `.background()` används för att lägga till Swift-ikonbakgrunden.
Den andra `.background()` används för att lägga till den indigofärgade bakgrunden.

På så sätt visas Swift-ikonen ovanpå den indigofärgade bakgrunden och blir en del av kortets bakgrund.

Härifrån kan vi se att `.background()` inte bara kan lägga till färger, utan även anpassade vyer. Flera `.background()` kan också kombineras för att skapa rikare bakgrundseffekter.

Nu är ett komplett kurskort klart.

## Sammanfattning

I den här lektionen repeterade vi vanliga grundläggande layoutmetoder i SwiftUI genom ett kurskort.

Vi använde `Text` för att visa text, `Image` för att visa en systemikon och `VStack`, `HStack` och `Spacer()` för att styra hur vyer ordnas.

Vi lärde oss `.lineLimit()`, som kan begränsa det maximala antalet rader som en text visar. När innehållet överskrider gränsen utelämnas den extra delen.

Samtidigt repeterade vi också vanliga modifierare som `.padding()`, `.background()`, `.cornerRadius()` och `.foregroundStyle()`.

Efter att ha slutfört den här lektionen kan vi redan kombinera flera små vyer till en komplett kortmodul.

Detta är också ett mycket vanligt arbetssätt i SwiftUI-utveckling: dela först upp vyer i små delar och kombinera dem sedan till ett komplett gränssnitt.

## Komplett kod

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
            Text("Nybörjare")
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
                Text("SwiftUI-handledning för nybörjare")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Börja från noll med SwiftUI och lär dig Apples deklarativa UI-utveckling steg för steg. Genom tydliga förklaringar och praktiska exempel lär du dig gradvis layout, interaktion och tillståndshantering för att bygga vackra och användbara appgränssnitt.")
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
    	        print("knappen trycktes")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Börja lära")
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
