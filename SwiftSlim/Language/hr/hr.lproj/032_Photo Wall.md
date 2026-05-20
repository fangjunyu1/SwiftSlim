# Galerija fotografija

U ovoj lekciji izradit ćemo stranicu galerije fotografija.

![view](../../../Resource/032_view13.png)

U ovom primjeru ponovit ćemo znanja o `extension`, `self` i instancama te naučiti često korištene grafičke oblike `Shape` u SwiftUI-ju.

Pomoću tih znanja obične slike možemo izrezati u različite stilove, kao što su krugovi, zaobljeni pravokutnici, kapsule i elipse, te fotografijama dodati efekt obruba.

U ovoj lekciji koristit ćemo nekoliko novih pojmova: `Shape`, `clipShape`, `strokeBorder` i `overlay`.

Među njima, `clipShape` služi za izrezivanje oblika prikaza, `strokeBorder` za crtanje obruba oblika, a `overlay` za dodavanje novog prikaza iznad trenutačnog prikaza.

## Slikovni materijali

Prije početka trebamo pripremiti nekoliko slika.

Možete koristiti vlastite fotografije ili primjerne slike ponuđene u ovoj lekciji.

Primjeri fotografija u ovoj lekciji dolaze s web-stranice [Pixabay](https://pixabay.com/):

[Krajolik](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Lisica](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Zgrada](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Cvijet](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Labud](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Nakon preuzimanja slika dodajte ih u resursnu mapu `Assets` i redom ih nazovite `1`, `2`, `3`, `4` i `5`.

![assets](../../../Resource/032_view17.png)

Tako u SwiftUI-ju možemo prikazati slike pomoću `Image("1")`, `Image("2")` i sličnih zapisa.

## Prikaz fotografija

Najprije u `ContentView` prikazujemo 5 fotografija:

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

Rezultat prikaza:

![view](../../../Resource/032_view.png)

U ovom kodu koristimo `ScrollView` za pomični prikaz popisa fotografija, a `VStack` za raspoređivanje više slika odozgo prema dolje.

Svaka slika koristi `.resizable()`, `.scaledToFit()` i `.frame(width: 300)` za postavljanje načina prikaza, tako da se slika može skalirati, zadržati puni omjer stranica i ograničiti širinu.

`.padding(.vertical, 100)` na `VStack` koristi se za povećanje gornjeg i donjeg razmaka, kako prva i zadnja fotografija ne bi bile preblizu rubovima zaslona.

Završni `.ignoresSafeArea()` znači da pomični prikaz ignorira sigurno područje, pa se fotografije pri pomicanju mogu protezati do vrha i dna zaslona, zbog čega je prikaz stranice potpuniji.

Međutim, trenutačno svih 5 slika koristi iste modifikatore:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Kada vidimo ponavljajući kod, možemo razmotriti upotrebu `extension` za njegovo organiziranje.

## Korištenje extension za organiziranje stila slika

Možemo proširiti `Image` metodom posebno namijenjenom galeriji fotografija:

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

Ovdje smo tipu `Image` dodali metodu `photoGalleryStyle` pomoću proširenja.

Ta metoda sadrži prethodno ponavljane `.resizable()`, `.scaledToFit()` i `.frame(width: 300)`. Drugim riječima, ona zajedno organizira kod za skaliranje slike, proporcionalni prikaz i postavljanje širine.

Nakon korištenja ovog proširenja, izvorni kod slike:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

može se pojednostaviti u:

```swift
Image("1")
    .photoGalleryStyle()
```

Na taj način svaka slika treba samo pozvati `.photoGalleryStyle()` da bi primijenila isti stil galerije fotografija. Kod postaje čišći, a kasnije ga je lakše jedinstveno mijenjati.

## Razumijevanje self

U metodi proširenja napisali smo `self`:

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

Ovdje `self` predstavlja trenutačnu instancu slike koja poziva ovu metodu.

Na primjer:

```swift
Image("1")
    .photoGalleryStyle()
```

U ovom kodu `photoGalleryStyle()` poziva `Image("1")`, pa `self` unutar metode predstavlja upravo tu sliku `Image("1")`.

Jednostavno se može razumjeti ovako: tko poziva ovu metodu, to predstavlja `self`.

Važno je napomenuti da SwiftUI modifikatori neprestano vraćaju nove rezultate prikaza. Zato `photoGalleryStyle()` vraća modificirani prikaz, a ne samo izvorni `Image`.

## Oblici fotografija

Sada se fotografije već mogu normalno prikazivati. Međutim, prema zadanim postavkama te su fotografije pravokutne, što izgleda prilično obično.

Ako fotografijama želite samo dodati zaobljene kutove, možete izravno koristiti `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Rezultat prikaza:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` znači dodavanje radijusa kuta od `20 pt` slici. Za obične slike sa zaobljenim kutovima ova je sintaksa već dovoljna.

Međutim, `.cornerRadius()` može obraditi samo efekt zaobljenih kutova i prikladan je za izradu običnih slika sa zaobljenim kutovima. Ako želimo da fotografije postanu više različitih oblika, sam ovaj modifikator nije dovoljan.

Tada trebamo koristiti `Shape` u SwiftUI-ju. `Shape` može predstavljati različite grafičke oblike, a u kombinaciji s `clipShape` može izrezati sliku u odgovarajući oblik.

## Upoznavanje sa Shape

U SwiftUI-ju `Shape` predstavlja grafički oblik. Kao i `View`, to je vrlo često korišten tip u SwiftUI-ju.

Uobičajeni tipovi `Shape` uključuju krugove, pravokutnike, zaobljene pravokutnike, kapsule i elipse. Kako bismo intuitivnije promatrali izgled različitih grafičkih oblika, sljedeći primjeri svakom obliku postavljaju različite boje i veličine.

U ovim primjerima `.fill()` se koristi za ispunjavanje grafičkog oblika bojom, a `.frame()` za postavljanje veličine prikaza grafičkog oblika. Boje služe samo za razlikovanje različitih oblika i nisu stalne boje samih oblika.

### Circle krug

`Circle` predstavlja krug. Često se koristi za avatare, kružne gumbe, kružne slike i druge efekte sučelja.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle pravokutnik

`Rectangle` predstavlja pravokutnik. To je jedan od najosnovnijih grafičkih oblika, a može se koristiti i za izradu pozadina, podijeljenih područja ili običnih obruba.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle zaobljeni pravokutnik

`RoundedRectangle` predstavlja zaobljeni pravokutnik. `cornerRadius` se koristi za postavljanje veličine zaobljenja kutova.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapsula

`Capsule` predstavlja oblik kapsule. Njezina su dva kraja lučna, pa se često koristi za kapsulaste gumbe, pozadine oznaka i druge efekte sučelja.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipsa

`Ellipse` predstavlja elipsu. Slična je `Circle`, ali kada se širina i visina razlikuju, prikazuje se kao elipsa.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Kroz ove primjere možemo vidjeti da se `Shape` sam po sebi može izravno prikazati kao grafički oblik. Zatim ćemo koristiti ove tipove `Shape` zajedno s `clipShape` za izrezivanje fotografija, kako bi se prikazale u različitim oblicima.

## Korištenje clipShape za izrezivanje fotografija

Sada možemo koristiti `clipShape` za izrezivanje fotografija u različite oblike.

Na primjer, izrežimo prvu fotografiju u krug:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Ovaj kod znači: najprije prikaži sliku, zatim je pomoću `Circle()` izreži u krug.

![view](../../../Resource/032_view2.png)

Osnovna sintaksa za `clipShape` je:

```swift
.clipShape(oblik)
```

Nakon prikaza dodajte `.clipShape(...)`, a unutar zagrada upišite grafički oblik u koji ga želite izrezati.

Na primjer:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Sada ćemo 5 fotografija izrezati u različite oblike:

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

Rezultat prikaza:

![view](../../../Resource/032_view8.png)

Među njima, rezultat nakon izrezivanja pomoću `Rectangle()` blizak je običnoj pravokutnoj fotografiji, pa vizualna promjena nije očita. Uglavnom se koristi za usporedbu s drugim oblicima.

Sada fotografije više nisu samo obični pravokutnici, nego imaju različite oblike.

## Dodavanje obruba fotografiji

Ako kružnoj fotografiji želimo dodati obrub, mogli bismo pomisliti na upotrebu `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Međutim, time obično ne dobivamo kružni obrub, nego pravokutni obrub.

![view](../../../Resource/032_view9.png)

Razlog je taj što `border` dodaje obrub prema pravokutnom području prikaza, a ne prema obliku nakon izrezivanja pomoću `clipShape`.

Zato, ako želimo kružni obrub, ne možemo izravno koristiti `border`.

## Korištenje strokeBorder za crtanje obruba oblika

U SwiftUI-ju `strokeBorder` može crtati unutarnje obrube za ove uobičajene tipove `Shape`.

Na primjer, nacrtajmo kružni obrub:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Ovaj kod znači: nacrtaj smeđi obrub za `Circle`, sa širinom obruba od `10 pt`.

![view](../../../Resource/032_view12.png)

Ovdje je važno napomenuti da `strokeBorder` ne dodaje obrub izravno fotografiji. Umjesto toga, crta obrub za grafički oblik `Circle()`.

Drugim riječima, ovaj kod stvara samo neovisni kružni obrub i još nema veze s fotografijom.

Ako želimo da se taj kružni obrub prikaže iznad fotografije, trebamo nastaviti koristiti `overlay` i preklopiti obrub preko fotografije.

## Korištenje overlay za preklapanje obruba

`overlay` je modifikator prikaza koji može dodati novi prikaz iznad trenutačnog prikaza.

Njegovu osnovnu strukturu možemo razumjeti kao:

```swift
Trenutačni prikaz
    .overlay {
        Preklopljeni prikaz
    }
```

U ovom slučaju trenutačni prikaz je fotografija koja je već izrezana u krug:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Novi prikaz koji želimo preklopiti jest kružni obrub:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Zato možemo spojiti fotografiju i obrub:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Ovdje `overlay` znači preklapanje novog prikaza iznad trenutačnog prikaza.

U `overlay` obrub se preklapa prateći područje prikaza trenutačne fotografije, pa nije potrebno zasebno postavljati `frame`. Sve dok se oblik obruba podudara s oblikom izrezivanja, obrub se može prilagoditi fotografiji.

![view](../../../Resource/032_view10.png)

Konačni je efekt da se iznad kružne fotografije nalazi kružni obrub.

U usporedbi sa `ZStack`, `overlay` je prikladniji za ovakve scenarije „dodavanja ukrasa trenutačnom prikazu”. Fotografija je glavni element, a obrub je samo dodatni efekt, pa je upotreba `overlay` jasnija.

## Dovršavanje galerije fotografija

Sada svakoj fotografiji dodajemo odgovarajući oblik i obrub:

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

Rezultat prikaza:

![view](../../../Resource/032_view13.png)

Tako je osnovna stranica galerije fotografija dovršena.

Na ovoj stranici koristimo `ScrollView` za ostvarivanje pomičnog prikaza, `Image` za prikaz fotografija, `clipShape` za izrezivanje oblika fotografija te `overlay` i `strokeBorder` za dodavanje obruba.

## Cijeli kod

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

## Sažetak

U ovoj lekciji dovršili smo stranicu galerije fotografija.

![view](../../../Resource/032_view13.png)

U ovom primjeru najprije smo koristili `Image` za prikaz fotografija, a zatim smo putem `extension` proširili `Image` metodom `photoGalleryStyle` za organiziranje ponavljajućeg koda stila slika.

Zatim smo naučili uobičajene tipove `Shape` u SwiftUI-ju, kao što su `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` i `Ellipse`. Ti se grafički oblici ne mogu samo izravno prikazivati, nego se mogu koristiti i zajedno s `clipShape` za izrezivanje prikaza.

Na primjer:

```swift
.clipShape(Circle())
```

znači izrezati prikaz u krug.

Na kraju smo koristili `overlay` i `strokeBorder` za dodavanje obruba odgovarajućeg oblika fotografijama. Važno je napomenuti da `border` obično crta obrub prema pravokutnom području prikaza. Ako želite da obrub prati krug, kapsulu ili elipsu, prikladnije je preklopiti isti `Shape`.

Kroz ovu lekciju nismo samo dovršili efekt galerije fotografija, nego smo razumjeli i uobičajeni način kombiniranja `Shape`, `clipShape`, `strokeBorder` i `overlay` u sučeljima.

## Vježbe nakon lekcije

### 1. Dodajte pozadinu galeriji fotografija

Dodajte sliku pozadine preko cijelog zaslona na stranicu galerije fotografija.

Zahtjev: pozadinska slika treba ispuniti cijeli zaslon i ignorirati sigurno područje.

### 2. Gradijentni obrub

Promijenite postojeće jednobojne obrube u linearne gradijentne obrube.

Možete pokušati koristiti `LinearGradient` za stvaranje bogatijih efekata obruba.

### 3. Simulirani okvir fotografije

Na internetu potražite neke stilove stvarnih okvira za fotografije i pokušajte pomoću `overlay` preklopiti slikovne okvire kako bi fotografije izgledale bliže stvarnim okvirima.

Rezultat prikaza vježbe:

![button](../../../Resource/032_view15.jpeg)

### 4. Izradite obrub gumba sa zaobljenim kutovima

U stvarnom razvoju gumbi često koriste obrube zaobljenog pravokutnika.

Pokušajte izraditi zaobljeni gumb i pomoću `RoundedRectangle` i `strokeBorder` dodati gumbu zaobljeni obrub.

Rezultat prikaza vježbe:

![button](../../../Resource/032_view14.png)

### Pitanje za razmišljanje

Ako ne želite koristiti jednobojni obrub ni gradijentni obrub, nego želite da obrub prikazuje određeni uzorak, kako biste to trebali implementirati?

Možete pokušati potražiti podatke i upoznati povezane upotrebe kao što su `overlay`, `mask` ili `ImagePaint`.

Rezultat prikaza vježbe:

![button](../../../Resource/032_view16.png)
