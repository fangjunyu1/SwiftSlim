# Izrada stranice osobnog životopisa

U ovoj ćemo lekciji izraditi jednostavan prikaz osobnog životopisa i naučiti sljedeće:

- `cornerRadius`
- `spacing`
- `ScrollView`

Tijekom izrade ponovit ćemo raspored, `Text`, `Image` i druga znanja te ostvariti kontrolu razmaka i efekt pomicanja sadržaja.

## Osobni životopis

Ciljani rezultat:

![Swift](../../RESOURCE/004_img.png)

**Pokušajte ga najprije samostalno napraviti, a zatim nastavite čitati objašnjenje ispod.**

### Izrada projekta

Stvorite novi iOS projekt ili nastavite koristiti prethodni projekt.

Zadani kod za `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Sada očistite kod i počnite pisati vlastiti sadržaj:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Cjelokupna struktura

U stvarnom razvoju obično najprije osmislimo ukupnu strukturu.

Naša stranica sadrži:

1. naslov
2. osobne informacije
3. osobni opis

Na najvišu razinu dodajemo jedan `VStack`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` osigurava okomiti raspored prikaza, a također može kontrolirati poredak i razmake među prikazima.

### Naslov

Najprije stvaramo `Text` za prikaz naslova.

Ovdje ću kao naslov prikazati svoje ime na engleskom:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Naslov se obično prikazuje veći i podebljan, pa ovdje koristimo modifikatore `font` i `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Raspored

Zadano poravnanje u SwiftUI-ju je `center`, pa se naslov trenutno prikazuje u sredini `ContentView` prikaza.

![Swift](../../RESOURCE/004_img3.png)

Naslov trebamo prikazati pri vrhu prikaza, a za prilagodbu rasporeda možemo koristiti `Spacer`:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` će zauzeti preostali prostor i gurnuti `Text` prema vrhu spremnika.

![Swift](../../RESOURCE/004_img4.png)

### Prazan prostor

Ako smatrate da je tekst preblizu vrhu, možete koristiti `padding` ili `Spacer`.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Ovim postavljamo gornji unutarnji razmak `VStack`-a na `20`.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Možete koristiti i `Spacer` te postaviti visinu pomoću `frame` kako biste dobili prazninu određene visine.

Dobiveni efekt:

![Swift](../../RESOURCE/004_img5.png)

### Slika

Pripremamo vlastitu portretnu fotografiju i stavljamo je u mapu resursa `Assets`.

![Swift](../../RESOURCE/004_img6.png)

U `ContentView` koristimo `Image` za prikaz slike:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Budući da je izvorna veličina slike velika, trebamo koristiti `frame` za kontrolu veličine prikaza.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

U ovom trenutku uočit ćemo jedan problem:

Ako omjer širine i visine `frame`-a ne odgovara izvornom omjeru slike, slika će se deformirati.

Na primjer:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Kako bismo izbjegli deformaciju slike, trebamo koristiti `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Uloga `scaledToFit` je sljedeća:

Unutar zadanog `frame` područja slika se skalira prema svom izvornom omjeru i cijeli sadržaj slike ostaje vidljiv.

Ne rasteže sliku nasilno da popuni cijeli `frame`, nego zadržava omjer širine i visine te je proporcionalno skalira dok jedna od stranica ne dođe točno do granice.

To znači:

- Ako je širina `frame`-a manja, slika će se skalirati prema širini.
- Ako je visina `frame`-a manja, slika će se skalirati prema visini.
- Slika uvijek zadržava izvorni omjer i neće se deformirati.

Često je dovoljno postaviti veličinu samo u jednom smjeru. Na primjer:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Sustav će tada prema širini `140` automatski izračunati prikladnu visinu uz očuvanje omjera slike.

Ako trebate fiksni vizualni omjer ili želite izbjeći stiskanje u složenijem rasporedu, možete istovremeno ograničiti širinu i visinu.

### Zaobljeni kutovi

Ako želite da se slika prikazuje sa zaobljenim kutovima, možete koristiti modifikator `cornerRadius`:

```swift
.cornerRadius(10)
```

Na primjer:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Dodajte `cornerRadius(20)` nakon modifikatora prikaza `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` znači da se granice prikaza režu i primjenjuje se radijus zaobljenja `20`.

Nakon dodavanja zaobljenih kutova, četiri kuta slike postaju zaobljena, pa vizualni efekt izgleda mekše i modernije.

Ovaj stil dizajna vrlo je čest u suvremenim sučeljima. Na primjer, iOS ikone aplikacija također koriste oblik zaobljenog pravokutnika (premda sistemske ikone koriste superelipsu s kontinuiranom zakrivljenošću, a ne samo jednostavno zaobljenje).

### Osobne informacije

Sada počinjemo izrađivati područje osobnih informacija koje se nalazi lijevo od slike. Iz strukture sučelja vidi se da su osobne informacije i slika raspoređeni vodoravno, pa trebamo koristiti `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Sadržaj osobnih informacija raspoređen je okomito.

![Swift](../../RESOURCE/004_img11.png)

Zato koristimo `HStack` izvana, `VStack` za osobne informacije i `Text` za tekstualni sadržaj.

Osnovna struktura:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Podebljavanje naziva polja**

Kako bismo razlikovali naziv polja i vrijednost polja, za naziv polja možemo koristiti `fontWeight`:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Lijevo poravnanje teksta**

`VStack` je prema zadanim postavkama centrirano poravnat. Ako želimo da sav tekst bude poravnat lijevo, trebamo postaviti poravnanje:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` znači poravnanje uz lijevi rub (u okruženju jezika slijeva nadesno).

![Swift](../../RESOURCE/004_img14.png)

### Razmak

Ako želimo zadržati fiksni razmak između osobnih informacija i slike, ranije smo koristili `Spacer` za ostavljanje praznog prostora:

```swift
Spacer()
    .frame(width: 10)
```

Možemo koristiti i parametar `spacing` u `HStack`-u:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` znači da će razmak između dvaju podprikaza biti `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**Što je `spacing`?**

U `VStack`、`HStack` i `ZStack`, `spacing` može kontrolirati razmak između podprikaza.

Na primjer:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Razmak između podprikaza u `VStack`-u bit će postavljen na `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Važno je napomenuti da `spacing` djeluje samo na "izravne podprikaze" i ne utječe na raspored unutar ugniježđenih spremnika.

**Kontrola razmaka unutar popisa**

Ako želimo povećati razmak između polja, najizravniji način je postaviti `spacing` na `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Tako će razmak između svih podprikaza postati `10 pt`.

Ali promatrajući sučelje, vidjet ćemo jedan problem:

Između grupa polja postoji razmak, ali isti razmak pojavljuje se i između naziva polja i vrijednosti polja.

To je zato što `spacing` djeluje na sve izravne podprikaze trenutačnog spremnika.

U ovoj strukturi svaki `Text` je izravan podprikaz vanjskog `VStack`-a, pa je razmak svuda isti.

Ako želimo razmak između grupa polja, ali želimo da naziv polja i vrijednost ostanu kompaktno zbijeni, možemo "naziv polja + vrijednost polja" smatrati jednom logičkom cjelinom i izvana ih omotati u `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Tada struktura postaje takva da između vanjskih `VStack` spremnika postoji razmak, dok unutarnji `VStack`-ovi zadržavaju zadani kompaktni razmak, pa se između naziva polja i vrijednosti neće pojaviti dodatna praznina.

![Swift](../../RESOURCE/004_img18.png)

### Osobni opis

Zatim izrađujemo područje osobnog opisa.

Iz strukture sučelja vidi se da je sadržaj opisa sastavljen od više redaka teksta, a tekst je raspoređen okomito.

![Swift](../../RESOURCE/004_img19.png)

Zato možemo koristiti `VStack` u kombinaciji s `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Povećanje razmaka**

Trenutno su dijelovi osobnih informacija i osobnog opisa prilično zbijeni i stil ne izgleda dovoljno lijepo.

![Swift](../../RESOURCE/004_img20.png)

Budući da se oba dijela nalaze unutar istog vanjskog spremnika, možemo kontrolirati ukupni razmak na vanjskom spremniku:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Dobiveni efekt:

![Swift](../../RESOURCE/004_img21.png)

**Razmak unutar popisa**

Koristimo `spacing` za postavljanje razmaka između redaka osobnog opisa:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Dovršavanje osobnog životopisa

Sada je osnovni okvir našeg osobnog životopisa dovršen.

![Swift](../../RESOURCE/004_img.png)

### Pomicalni prikaz

Trenutna struktura stranice koristi `VStack`, što je u redu kada je broj redaka opisa mali. No ako se poveća na 20, 30 ili više redaka, visina sadržaja premašit će veličinu zaslona.

Na primjer:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Tada se pojavljuju dvije pojave:

- sadržaj pri dnu biva odrezan
- stranica se ne može pomicati

To nije problem `VStack`-a. `VStack` je samo spremnik rasporeda i ne pruža automatski mogućnost pomicanja.

**Što je `ScrollView`**

`ScrollView` je pomični spremnik prikladan za veliku količinu sadržaja koji prelazi veličinu zaslona. Na primjer, za okomite ili vodoravne popise.

Osnovna struktura:

```swift
ScrollView {
    ...
}
```

Ako želimo postići efekt pomicanja, trebamo sav sadržaj stranice omotati unutar `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Tako cijela stranica postaje jedno pomično područje i kada sadržaj premaši visinu zaslona, može se prirodno pomicati.

`ScrollView` prema zadanim postavkama prikazuje indikator pomicanja. Ako ga želite sakriti, možete postaviti:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Potpuni kod

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
