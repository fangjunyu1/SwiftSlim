# Kartica tečaja

Ova lekcija je lekcija za fazno ponavljanje. Dovršit ćemo „karticu tečaja”.

Kroz ovu vježbu možemo ponoviti `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` i druge sadržaje koje smo ranije naučili, te naučiti kako više malih prikaza spojiti u cjelovit modul prikaza.

Izgled kartice tečaja:

![view](../../../Resource/026_view.png)

Ova kartica tečaja uglavnom sadrži nekoliko dijelova:

- Razina tečaja: `Početnik`
- Sadržaj tečaja: `20+ lekcija`
- Naslov tečaja: `SwiftUI vodič za početnike`
- Opis tečaja
- Gumb: `Započni učenje`
- Pozadina tečaja: Swift ikona i indigo pozadina

Ovaj prikaz možemo dovršiti u `ContentView`.

## Gornje područje

Najprije izradimo gornje područje kartice tečaja.

![view](../../../Resource/026_view1.png)

Lijeva strana gornjeg područja prikazuje razinu tečaja, a desna strana prikazuje sadržaj tečaja.

Budući da su ova dva sadržaja raspoređena vodoravno, možemo upotrijebiti `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Početnik")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lekcija")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Ovdje smo gornje područje izdvojili u izračunato svojstvo:

```swift
var topView: some View
```

Prednost takvog pristupa je to što `body` ostaje pregledniji.

Gornje područje uglavnom koristi sljedeće sadržaje:

- `HStack`: vodoravno raspoređuje dva tekstualna prikaza.
- `Text`: prikazuje tekstualni sadržaj.
- `Spacer()`: gura lijevi tekst ulijevo, a desni tekst udesno.
- `.font(.footnote)`: postavlja manji stil teksta.
- `.fontWeight(.bold)`: podebljava tekst.
- `.foregroundStyle(Color.white)`: postavlja boju prednjeg plana na bijelu.
- `.padding(.vertical, 10)`: postavlja okomiti unutarnji razmak.
- `.padding(.horizontal, 16)`: postavlja vodoravni unutarnji razmak.
- `.background(Color.white.opacity(0.15))`: postavlja poluprozirnu bijelu pozadinu.
- `.cornerRadius(20)`: postavlja zaobljenje kutova.

Ovdje `Početnik` koristi `.padding()` u dva smjera:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Tako tekst dobiva prostor i okomito i vodoravno, pa više izgleda kao oznaka.

`Color.white.opacity(0.15)` predstavlja bijelu boju s neprozirnošću od `15%`, odnosno vrlo blagu bijelu.

### Dodavanje pozadine kartice

Ranije smo stvorili `topView`, ali samo stvaranje prikaza neće ga automatski prikazati.

U SwiftUI-ju, sadržaj koji se stvarno prikazuje na zaslonu treba biti napisan u `body`.

Zato možemo najprije staviti `topView` u `body` kako bi se prikazao:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

U ovom trenutku vidjet ćete da se gornje područje već prikazalo:

![view](../../../Resource/026_view2.png)

Međutim, budući da je tekst u `topView` bijele boje, a zadana pozadina je također svijetla, u svijetlom načinu rada možda ga neće biti lako jasno vidjeti.

Zato izvana možemo dodati `VStack`, a zatim cijelom području postaviti unutarnji razmak, boju pozadine i zaobljenje kutova:

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

Izgled prikaza:

![view](../../../Resource/026_view3.png)

Ovdje `VStack` trenutačno sadrži samo jedan `topView`, pa može izgledati kao da nije potreban.

Ali kasnije ćemo nastaviti dodavati naslov tečaja, opis tečaja i područje gumba. Sve su to sadržaji raspoređeni okomito, pa nam korištenje `VStack` ovdje unaprijed olakšava daljnje kombiniranje prikaza.

Ovdje postoje dva modifikatora `.padding()`, a njihove uloge su različite.

Prvi `.padding(20)` napisan je prije `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

On kontrolira unutarnji razmak kartice, odnosno udaljenost između sadržaja i ruba pozadine.

Drugi `.padding(30)` napisan je poslije `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

On kontrolira vanjski razmak kartice, odnosno udaljenost između cijele kartice i ruba zaslona.

![view](../../../Resource/026_view4.png)

Dakle, iako su oba `.padding()`, postavljanjem na različite položaje dobivaju se različiti učinci.

## Područje sadržaja

Zatim izradimo područje sadržaja kartice tečaja.

Izgled prikaza:

![view](../../../Resource/026_view5.png)

Područje sadržaja sadrži naslov tečaja i opis tečaja. Oni su raspoređeni okomito, pa koristimo `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI vodič za početnike")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Krenite od nule sa SwiftUI-jem i sustavno naučite Appleov deklarativni razvoj korisničkog sučelja. Kroz jasna objašnjenja i praktične primjere postupno ćete svladati raspored, interakciju i upravljanje stanjem te izraditi lijepe i korisne aplikacijske zaslone.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Izgled prikaza:

![view](../../../Resource/026_view6.png)

U ovom `VStack` koriste se dva parametra:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` znači da su prikazi unutar `VStack` poravnati prema vodećem rubu.

`spacing: 10` znači da prikazi unutar `VStack` između sebe zadržavaju razmak od `10 pt`.

Zato će naslov tečaja i opis tečaja početi s lijeve strane i između sebe zadržati određenu udaljenost.

Opis tečaja je relativno dug. Ako se prikaže cijeli, kartica će postati vrlo visoka, pa se ovdje koristi `.lineLimit()` za ograničavanje broja prikazanih redaka:

```swift
.lineLimit(3)
```

To znači da se prikazuju najviše `3` retka. Kada sadržaj premaši ograničenje broja redaka, višak će biti izostavljen.

### Poravnanje prikaza ulijevo

Ovdje treba obratiti pozornost na još jednu stvar.

`VStack(alignment: .leading)` može kontrolirati samo poravnanje prikaza unutar `VStack`. Ne kontrolira izravno položaj samog `VStack` unutar vanjskog spremnika.

Na primjer, ako je opis tečaja relativno kratak:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI vodič za početnike")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Samo malo sadržaja.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Izgled prikaza:

![view](../../../Resource/026_view7.png)

Možete vidjeti da su naslov tečaja i opis tečaja, iako su unutar `VStack` poravnati ulijevo, ali cijeli `VStack` nije poravnat uz najljeviji rub kartice.

To je zato što, kada je sadržaj kratak, i širina `VStack` postaje relativno uska. Kada vanjski spremnik raspoređuje svoj sadržaj, može taj uži `VStack` postaviti u sredinu.

To možete razumjeti ovako: `VStack(alignment: .leading)` odgovoran je za unutarnje lijevo poravnanje.
Ali nije odgovoran za guranje cijelog područja sadržaja skroz ulijevo.

Ako želimo da se cijelo područje sadržaja zaista poravna ulijevo, možemo ga omotati još jednim `HStack` i dodati `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI vodič za početnike")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Samo malo sadržaja.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Izgled prikaza:

![view](../../../Resource/026_view8.png)

Ovdje je `HStack` vodoravni raspored.

`Spacer()` zauzima preostali prostor s desne strane, čime gura lijevi `VStack` skroz ulijevo.

Zato se `HStack + Spacer()` može koristiti za kontrolu položaja cijelog područja sadržaja.

U stvarnoj kartici tečaja, opis tečaja je relativno dug i obično zauzima veću širinu, pa ovaj problem možda neće biti očit. Ali važno je razumjeti tu razliku, jer se slične situacije često pojavljuju kasnije pri izradi rasporeda s kratkim tekstom.

### Kontrola udaljenosti između unutarnjih prikaza

Ranije smo u `VStack` napisali `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` se koristi za kontrolu udaljenosti između unutarnjih prikaza.

Ako `spacing` nije postavljen, `VStack` također ima zadani razmak, ali zadani razmak možda neće odgovarati učinku koji želimo.

Ovdje bi raspored izgledao zbijeno ako su naslov tečaja i opis tečaja preblizu jedan drugome, pa koristimo:

```swift
spacing: 10
```

Time se između njih zadržava malo prostora.

Izgled prikaza:

![view](../../../Resource/026_view9.png)

Slično tome, gornje područje i područje sadržaja također su raspoređeni okomito, pa se `spacing` može koristiti i za kontrolu udaljenosti između njih.

Sada stavimo `topView` i `contentView` u `body`:

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

Izgled prikaza:

![view](../../../Resource/026_view10.png)

Ovdje `VStack(spacing: 20)` kontrolira udaljenost između `topView` i `contentView`.

Drugim riječima:

```swift
VStack(alignment: .leading, spacing: 10)
```

Kontrolira udaljenost između naslova tečaja i opisa tečaja.

```swift
VStack(spacing: 20)
```

Kontrolira udaljenost između gornjeg područja i područja sadržaja.

Oba su `spacing`, ali djeluju na različite `VStack` spremnike, pa je i raspon utjecaja različit.

Time je prikaz područja sadržaja dovršen.

## Područje gumba

Zatim izradimo donje područje gumba.

Izgled prikaza:

![view](../../../Resource/026_view11.png)

Područje gumba uglavnom se sastoji od ikone za reprodukciju i jednog teksta.

Možemo koristiti `Image` za prikaz ikone za reprodukciju, a `Text` za prikaz teksta gumba.

Ovdje najprije izradimo izgled gumba:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("klik gumba")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Započni učenje")
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

Izgled prikaza:

![view](../../../Resource/026_view12.png)

Ovdje se koriste dva `HStack` spremnika:

Unutarnji `HStack` koristi se za vodoravno raspoređivanje ikone i teksta:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Započni učenje")
}
```

Vanjski `HStack`, zajedno sa `Spacer()`, koristi se kako bi izgled gumba bio poravnat ulijevo:

```swift
HStack {
    ...
    Spacer()
}
```

Kada se gumb dodirne, konzola će ispisati `klik gumba`.

## Osnovna kartica je dovršena

Sada spojimo gornje područje, područje sadržaja i područje gumba:

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

Izgled prikaza:

![view](../../../Resource/026_view13.png)

Do ovog trenutka osnovna kartica tečaja je dovršena.

## Pozadina sa Swift ikonom

Na kraju kartici dodajemo poluprozirnu pozadinu sa Swift ikonom.

![view](../../../Resource/026_view.png)

Ranije smo koristili `Color.indigo` kao boju pozadine. Zapravo, osim dodavanja boje, `.background()` može dodati i cijeli prikaz.

Zato najprije možemo stvoriti poseban pozadinski prikaz:

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

U ovom pozadinskom prikazu koristimo `VStack`, `HStack` i `Spacer()` kako bismo Swift ikonu gurnuli u donji desni kut.

Budući da se Swift ikona koristi samo kao dekorativna pozadina, ovdje se koristi poluprozirna bijela boja:

```swift
Color.white.opacity(0.15)
```

Na taj način ikona neće biti previše istaknuta i neće utjecati na tekstualni sadržaj ispred nje.

Zatim dodajemo `backgroundView` u karticu:

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

Konačni izgled:

![view](../../../Resource/026_view14.png)

Ovdje se uzastopno koriste dva `.background()` modifikatora:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Prvi `.background()` koristi se za dodavanje pozadine sa Swift ikonom.
Drugi `.background()` koristi se za dodavanje indigo pozadine.

Tako se Swift ikona prikazuje iznad indigo pozadine i prikazuje kao dio pozadine kartice.

Odavde možemo vidjeti da `.background()` ne može dodavati samo boje, nego i prilagođene prikaze. Više `.background()` modifikatora također se može kombinirati kako bi se postigli bogatiji pozadinski učinci.

Do ovog trenutka dovršena je potpuna kartica tečaja.

## Sažetak

U ovoj lekciji kroz karticu tečaja ponovili smo česte osnovne načine rasporeda u SwiftUI-ju.

Koristili smo `Text` za prikaz teksta, `Image` za prikaz sistemske ikone te `VStack`, `HStack` i `Spacer()` za kontrolu rasporeda prikaza.

Naučili smo `.lineLimit()`, koji može ograničiti najveći broj redaka koje tekst prikazuje. Kada sadržaj premaši ograničenje, višak se izostavlja.

Istovremeno smo ponovili i česte modifikatore kao što su `.padding()`, `.background()`, `.cornerRadius()` i `.foregroundStyle()`.

Nakon završetka ove lekcije već možemo spojiti više malih prikaza u cjelovit modul kartice.

To je također vrlo čest način razmišljanja u SwiftUI razvoju: najprije razdvojiti prikaze na male dijelove, a zatim ih spojiti u cjelovito sučelje.

## Cjelovit kod

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
            Text("Početnik")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lekcija")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI vodič za početnike")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Krenite od nule sa SwiftUI-jem i sustavno naučite Appleov deklarativni razvoj korisničkog sučelja. Kroz jasna objašnjenja i praktične primjere postupno ćete svladati raspored, interakciju i upravljanje stanjem te izraditi lijepe i korisne aplikacijske zaslone.")
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
    	        print("klik gumba")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Započni učenje")
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
