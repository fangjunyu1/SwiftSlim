# Kartica tečaja

Ta lekcija je vmesna ponovitvena lekcija, v kateri bomo izdelali »kartico tečaja«.

S to vajo lahko ponovimo prej naučene elemente, kot so `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()`, in se naučimo, kako več majhnih pogledov združiti v celovit modul pogleda.

Učinek kartice tečaja:

![view](../../../Resource/026_view.png)

Ta kartica tečaja vsebuje predvsem več delov:

- Raven tečaja: `Začetnik`
- Vsebina tečaja: `20+ lekcij`
- Naslov tečaja: `Vadnica SwiftUI za začetnike`
- Opis tečaja
- Gumb: `Začni z učenjem`
- Ozadje tečaja: ikona Swift in indigo ozadje

Ta pogled lahko dokončamo v `ContentView`.

## Zgornje območje

Najprej izdelamo zgornje območje kartice tečaja.

![view](../../../Resource/026_view1.png)

Na levi strani zgornjega območja je prikazana raven tečaja, na desni strani pa vsebina tečaja.

Ker sta ta dva elementa razporejena vodoravno, lahko uporabimo `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Začetnik")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lekcij")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Tukaj smo zgornje območje razdelili v izračunano lastnost:

```swift
var topView: some View
```

Prednost tega je, da je `body` bolj pregleden.

Zgornje območje uporablja predvsem te vsebine:

- `HStack`: dva besedila razporedi vodoravno.
- `Text`: prikaže besedilno vsebino.
- `Spacer()`: levo besedilo potisne na levo, desno besedilo pa na desno.
- `.font(.footnote)`: nastavi manjši slog besedila.
- `.fontWeight(.bold)`: nastavi krepko pisavo.
- `.foregroundStyle(Color.white)`: nastavi barvo ospredja na belo.
- `.padding(.vertical, 10)`: nastavi zgornji in spodnji notranji odmik.
- `.padding(.horizontal, 16)`: nastavi levi in desni notranji odmik.
- `.background(Color.white.opacity(0.15))`: nastavi polprosojno belo ozadje.
- `.cornerRadius(20)`: nastavi zaobljene vogale.

Za `Začetnik` smo uporabili `.padding()` v dveh smereh:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Tako ima besedilo prostor zgoraj, spodaj, levo in desno, zato je videti bolj kot oznaka.

`Color.white.opacity(0.15)` pomeni belo barvo z `15%` neprosojnostjo, torej zelo nežno belo.

### Dodajanje ozadja kartice

Prej smo ustvarili `topView`, vendar samo ustvarjanje pogleda še ne pomeni, da se bo samodejno prikazal.

V SwiftUI mora biti vsebina, ki se zares prikaže na zaslonu, zapisana v `body`.

Zato lahko najprej vstavimo `topView` v `body`, da ga prikažemo:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Zdaj lahko vidimo, da je zgornje območje že prikazano:

![view](../../../Resource/026_view2.png)

Ker pa je besedilo v `topView` belo, privzeto ozadje pa je tudi svetlo, ga je v svetlem načinu morda težko jasno videti.

Zato lahko zunaj dodamo `VStack`, nato pa celotnemu območju nastavimo notranji odmik, barvo ozadja in zaobljene vogale:

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

Rezultat prikaza:

![view](../../../Resource/026_view3.png)

V tem `VStack` je trenutno samo en `topView`, zato se zdi, da morda ni nujen.

Toda pozneje bomo še naprej dodajali naslov tečaja, opis tečaja in območje gumba. Vse to so vsebine, razporejene od zgoraj navzdol, zato tukaj vnaprej uporabimo `VStack`, kar nam pozneje olajša nadaljnje združevanje pogledov.

Tukaj sta dva `.padding()`, njuni vlogi pa sta različni.

Prvi `.padding(20)` je zapisan pred `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Nadzoruje notranji odmik kartice, torej razdaljo med vsebino in robom ozadja.

Drugi `.padding(30)` je zapisan za `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Nadzoruje zunanji odmik kartice, torej razdaljo med celotno kartico in robom zaslona.

![view](../../../Resource/026_view4.png)

Zato ima isti `.padding()` različen učinek, če je zapisan na različnih mestih.

## Vsebinsko območje

Nato izdelamo vsebinsko območje kartice tečaja.

Rezultat prikaza:

![view](../../../Resource/026_view5.png)

Vsebinsko območje vsebuje naslov tečaja in opis tečaja. Ker sta razporejena navpično, uporabimo `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Vadnica SwiftUI za začetnike")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Začnite od začetka s SwiftUI in sistematično spoznajte Applov deklarativni razvoj uporabniških vmesnikov. Z jasnimi razlagami in praktičnimi primeri boste postopoma osvojili postavitev, interakcijo in upravljanje stanja ter izdelali lepe in uporabne vmesnike aplikacij.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Rezultat prikaza:

![view](../../../Resource/026_view6.png)

V tem `VStack` smo uporabili dva parametra:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` pomeni, da so pogledi znotraj `VStack` poravnani levo.

`spacing: 10` pomeni, da je med pogledi znotraj `VStack` razmik `10 pt`.

Zato se naslov tečaja in opis tečaja začneta razporejati z leve strani, med njima pa ostane določena razdalja.

Opis tečaja je precej dolg. Če bi ga prikazali v celoti, bi kartica postala zelo visoka, zato tukaj z `.lineLimit()` omejimo število prikazanih vrstic:

```swift
.lineLimit(3)
```

To pomeni, da se prikažejo največ `3` vrstice. Ko vsebina preseže omejeno število vrstic, se presežni del izpusti.

### Leva poravnava pogleda

Tukaj moramo biti pozorni še na eno stvar.

`VStack(alignment: .leading)` lahko nadzoruje samo poravnavo pogledov znotraj `VStack`, ne nadzoruje pa neposredno položaja samega `VStack` v zunanjem vsebniku.

Na primer, če je opis tečaja razmeroma kratek:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Vadnica SwiftUI za začetnike")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Samo nekaj vsebine.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Rezultat prikaza:

![view](../../../Resource/026_view7.png)

Vidimo lahko, da sta naslov tečaja in opis tečaja znotraj `VStack` sicer poravnana levo, vendar celoten `VStack` ni prilepljen na skrajni levi rob kartice.

To je zato, ker je pri kratki vsebini tudi širina `VStack` razmeroma majhna. Zunanji vsebnik lahko med postavitvijo ta ožji `VStack` postavi na sredino.

To si lahko predstavljamo tako: `VStack(alignment: .leading)` skrbi za notranjo levo poravnavo.
Vendar ni odgovoren za to, da celotno vsebinsko območje potisne na skrajno levo.

Če želimo, da je celotno vsebinsko območje res poravnano levo, ga lahko zunaj ovijemo še z eno plastjo `HStack` in dodamo `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Vadnica SwiftUI za začetnike")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Samo nekaj vsebine.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Rezultat prikaza:

![view](../../../Resource/026_view8.png)

Tukaj je `HStack` vodoravna postavitev.

`Spacer()` zasede preostali prostor na desni strani in tako potisne levi `VStack` na skrajno levo.

Zato lahko `HStack + Spacer()` uporabimo za nadzor položaja celotnega vsebinskega območja.

V dejanski kartici tečaja je opis tečaja razmeroma dolg in običajno zavzame večjo širino, zato ta težava morda ni očitna. Vendar je razumevanje te razlike zelo pomembno, ker bomo pri izdelavi postavitev s kratkimi besedili pozneje pogosto naleteli na podobne situacije.

### Nadzor razdalje med notranjimi pogledi

Prej smo v `VStack` zapisali `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` se uporablja za nadzor razdalje med notranjimi pogledi.

Če `spacing` ne nastavimo, ima `VStack` prav tako privzeti razmik, vendar privzeti razmik ni nujno skladen z učinkom, ki ga želimo.

Tukaj bi bila naslov tečaja in opis tečaja videti prenatrpana, če bi bila preblizu, zato uporabimo:

```swift
spacing: 10
```

Tako med njima pustimo nekaj prostora.

Rezultat prikaza:

![view](../../../Resource/026_view9.png)

Podobno sta tudi zgornje območje in vsebinsko območje razporejena od zgoraj navzdol, zato lahko z `spacing` nadzorujemo razdaljo med njima.

Zdaj vstavimo `topView` in `contentView` v `body`:

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

Rezultat prikaza:

![view](../../../Resource/026_view10.png)

Tukaj `VStack(spacing: 20)` nadzoruje razdaljo med `topView` in `contentView`.

To pomeni:

```swift
VStack(alignment: .leading, spacing: 10)
```

nadzoruje razdaljo med naslovom tečaja in opisom tečaja.

```swift
VStack(spacing: 20)
```

nadzoruje razdaljo med zgornjim območjem in vsebinskim območjem.

Oba uporabljata `spacing`, vendar delujeta na različnih `VStack`, zato vplivata na različna območja.

S tem je pogled vsebinskega območja dokončan.

## Območje gumba

Nato izdelamo območje gumba na dnu.

Rezultat prikaza:

![view](../../../Resource/026_view11.png)

Območje gumba je predvsem sestavljeno iz ikone za predvajanje in besedila.

Za prikaz ikone za predvajanje lahko uporabimo `Image`, za prikaz besedila gumba pa `Text`.

Najprej izdelamo videz gumba:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("klik na gumb")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Začni z učenjem")
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

Rezultat prikaza:

![view](../../../Resource/026_view12.png)

Tukaj smo uporabili dva `HStack`:

Notranji `HStack` se uporablja za vodoravno razporeditev ikone in besedila:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Začni z učenjem")
}
```

Zunanji `HStack` skupaj s `Spacer()` poskrbi, da je videz gumba prikazan levo:

```swift
HStack {
    ...
    Spacer()
}
```

Ko kliknemo gumb, se v konzoli izpiše `klik na gumb`.

## Osnovna kartica je dokončana

Zdaj združimo zgornje območje, vsebinsko območje in območje gumba:

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

Rezultat prikaza:

![view](../../../Resource/026_view13.png)

Do tukaj je osnovna kartica tečaja že dokončana.

## Ozadje z ikono Swift

Na koncu kartici dodamo polprosojno ozadje z ikono Swift.

![view](../../../Resource/026_view.png)

Prej smo kot barvo ozadja uporabili `Color.indigo`. Pravzaprav lahko `.background()` poleg barve doda tudi celoten pogled.

Zato lahko najprej ustvarimo namenski pogled ozadja:

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

V tem pogledu ozadja uporabimo `VStack`, `HStack` in `Spacer()`, da ikono Swift potisnemo v spodnji desni kot.

Ker je ikona Swift samo dekorativno ozadje, tukaj uporabimo polprosojno belo:

```swift
Color.white.opacity(0.15)
```

Tako ikona ne bo preveč izrazita in ne bo vplivala na besedilno vsebino spredaj.

Nato dodamo `backgroundView` v kartico:

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

Končni učinek:

![view](../../../Resource/026_view14.png)

Tukaj zaporedoma uporabimo dva `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Prvi `.background()` se uporablja za dodajanje ozadja z ikono Swift.
Drugi `.background()` se uporablja za dodajanje indigo ozadja.

Tako bo ikona Swift prikazana nad indigo ozadjem in bo prikazana kot del ozadja kartice.

Iz tega lahko vidimo, da `.background()` poleg barve lahko doda tudi pogled po meri. Več `.background()` lahko uporabljamo skupaj in tako ustvarimo bogatejše učinke ozadja.

Do tukaj je celotna kartica tečaja dokončana.

## Povzetek

V tej lekciji smo skozi kartico tečaja ponovili pogoste osnovne načine postavitve v SwiftUI.

Za prikaz besedila smo uporabili `Text`, za prikaz sistemskih ikon `Image`, za nadzor razporeditve pogledov pa `VStack`, `HStack` in `Spacer()`.

Naučili smo se uporabljati `.lineLimit()`, ki lahko omeji največje število prikazanih vrstic besedila. Ko vsebina preseže omejitev, se presežni del izpusti.

Hkrati smo ponovili pogoste modifikatorje, kot so `.padding()`, `.background()`, `.cornerRadius()` in `.foregroundStyle()`.

Po zaključku te lekcije lahko več majhnih pogledov že združimo v celovit modul kartice.

To je tudi zelo pogost način razmišljanja pri razvoju s SwiftUI: najprej razdelimo majhne poglede, nato pa jih združimo v celoten vmesnik.

## Celotna koda

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
            Text("Začetnik")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lekcij")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Vadnica SwiftUI za začetnike")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Začnite od začetka s SwiftUI in sistematično spoznajte Applov deklarativni razvoj uporabniških vmesnikov. Z jasnimi razlagami in praktičnimi primeri boste postopoma osvojili postavitev, interakcijo in upravljanje stanja ter izdelali lepe in uporabne vmesnike aplikacij.")
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
    	        print("klik na gumb")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Začni z učenjem")
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
