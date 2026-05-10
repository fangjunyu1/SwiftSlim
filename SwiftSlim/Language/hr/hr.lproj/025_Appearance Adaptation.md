# Prilagodba izgleda

U ovoj lekciji učimo prilagodbu izgleda za svijetli način i tamni način.

Na iPhoneu, iPadu i Macu korisnici mogu odabrati svijetli način ili tamni način.

Kada se sustav prebaci u tamni način, pozadina, tekst i boje ikona u mnogim aplikacijama također se mijenjaju.

Na primjer, sučelje danju može imati svijetlu pozadinu, a noću se može promijeniti u tamnu pozadinu.

![view](../../../Resource/025_view9.png)

Ova sposobnost automatskog prilagođavanja prikaza sučelja prema izgledu sustava naziva se prilagodba izgleda.

## Pretpregled prilagodbe izgleda u Xcodeu

Prije nego što učimo prilagodbu izgleda, najprije ćemo vidjeti kako u Xcodeu pretpregledati svijetli način i tamni način.

Na dnu područja `Canvas` kliknite gumb `Device Settings` kako biste otvorili skočni prozor `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

U skočnom prozoru možete vidjeti postavku `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Među njima:

- `Light Appearance` znači svijetli način.
- `Dark Appearance` znači tamni način.

Ovdje možemo prebacivati izgled pretpregleda i vidjeti kako se trenutno sučelje prikazuje u svijetlom i tamnom načinu.

## Paralelni prikaz dva izgleda

Ako želite istovremeno vidjeti svijetli način i tamni način, možete upotrijebiti funkciju `Variants`.

Na dnu područja `Canvas` kliknite gumb `Variants` i odaberite `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Nakon odabira, `Canvas` će istovremeno prikazati pretpregled svijetlog i tamnog načina.

![canvas3](../../../Resource/025_view3.png)

Tako je praktičnije usporediti razlike sučelja u ta dva izgleda.

Jednostavno rečeno:

Ako samo želite privremeno prebaciti svijetli/tamni način, možete upotrijebiti `Canvas Device Settings`.

Ako želite istovremeno vidjeti oba izgleda, možete upotrijebiti `Color Scheme Variants`.

## Prikazi se zadano prilagođavaju izgledu

U SwiftUI-ju mnogi se sustavski prikazi zadano automatski prilagođavaju svijetlom i tamnom načinu.

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Svijetlo")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("neki neki neki")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Rezultat prikaza:

![canvas](../../../Resource/025_view4.png)

Možete vidjeti da se u svijetlom načinu ikona i naslov obično prikazuju tamnom bojom.

U tamnom načinu ikona i naslov automatski prelaze u svijetlu boju.

To je zato što se SwiftUI prikazi kao što su `Text` i `Image` zadano prilagođavaju bojama prema izgledu sustava.

Drugim riječima, ako ručno ne zadamo fiksnu boju, SwiftUI će nam pomoći obraditi dio prilagodbe izgleda.

## Fiksne boje neće se automatski zamijeniti

Važno je primijetiti da, ako ručno zadamo fiksnu boju, ona se neće automatski zamijeniti prema svijetlom/tamnom načinu.

Na primjer:

```swift
Text("neki neki neki")
	.foregroundStyle(Color.gray)
```

Ovdje je tekstu zadana boja `Color.gray`, pa će se uvijek prikazivati sivo.

Drugi primjer:

```swift
Text("Naslov")
    .foregroundStyle(Color.white)
```

Ovaj će se kod prikazivati bijelim tekstom bez obzira na to je li sučelje u svijetlom ili tamnom načinu.

Ako je i pozadina svijetla, bijeli tekst može postati teško čitljiv.

Zato pri prilagodbi izgleda treba što više izbjegavati proizvoljno upisivanje fiksnih boja kao što su `Color.white` i `Color.black`.

U mnogim slučajevima prednost možemo dati sustavskim semantičkim stilovima, na primjer:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Među njima:

- `.primary` se obično koristi za glavni sadržaj.
- `.secondary` se obično koristi za sporedni sadržaj.

Oni će automatski prilagoditi prikaz prema svijetlom/tamnom načinu.

## Prikaz različitog sadržaja prema izgledu

Ponekad ne želimo samo promjenu boje, nego i prikaz različitog sadržaja u različitim izgledima.

Na primjer:

- U svijetlom načinu prikazuje se obična ikona žarulje.
- U tamnom načinu prikazuje se svijetleća ikona žarulje.
- U svijetlom načinu naslov prikazuje `Svijetlo`.
- U tamnom načinu naslov prikazuje `Tamno`.

Tada trebamo odrediti je li trenutni sustav u svijetlom ili tamnom načinu.

U SwiftUI-ju se trenutni način izgleda može dobiti preko vrijednosti okruženja `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Cijeli kod:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Svijetlo" : "Tamno"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("neki neki neki")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Rezultat prikaza:

![view](../../../Resource/025_view5.png)

Iz pretpregleda možemo vidjeti da isti prikaz u različitim načinima izgleda ne prikazuje potpuno isti sadržaj.

U svijetlom načinu `Image` prikazuje običnu ikonu žarulje, a naslov prikazuje `Svijetlo`.

U tamnom načinu `Image` prikazuje svijetleću ikonu žarulje, a naslov prikazuje `Tamno`.

Drugim riječima, ovdje se ne mijenja samo boja, nego se mijenjaju i naziv ikone te sam tekst naslova.

To je zato što ikonu i naslov nismo izravno fiksno upisali u `body`, nego smo prema `colorScheme` izračunali različit sadržaj.

U ovom kodu upotrijebili smo dva izračunata svojstva:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Svijetlo" : "Tamno"
}
```

Kada je `colorScheme` jednak `.light`, to znači da je trenutačno uključen svijetli način.

Kada je `colorScheme` jednak `.dark`, to znači da je trenutačno uključen tamni način.

Zato prema različitim načinima izgleda možemo vratiti različite nazive ikona i tekst naslova.

To je također česta upotreba izračunatih svojstava: prema trenutačnom stanju izračunati sadržaj koji prikaz treba prikazati.

## Razumijevanje @Environment

Ovo je prvi put da se susrećemo s `@Environment`.

`@Environment` možemo razumjeti kao: čitanje neke vrijednosti iz SwiftUI okruženja.

Kada aplikacija radi, sustav pruža mnoge informacije okruženja, na primjer:

- Trenutni jezik
- Trenutni način izgleda
- Trenutni smjer rasporeda
- Trenutne postavke veličine fonta

Kada trebamo dobiti trenutni način izgleda, možemo pročitati `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Ovdje

```swift
\.colorScheme
```

znači čitanje vrijednosti `colorScheme` iz okruženja.

```swift
private var colorScheme
```

znači spremanje pročitane vrijednosti u varijablu `colorScheme`.

Naziv varijable možemo odrediti sami, na primjer možemo napisati i:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Sve dok se prethodni dio `\.colorScheme` ne promijeni, to znači da čitamo trenutni način izgleda.

## Dvije česte vrijednosti za colorScheme

`colorScheme` često ima dvije vrijednosti:

```swift
.light
.dark
```

One znače:

- `.light`: svijetli način
- `.dark`: tamni način

Na primjer:

```swift
private var titleName: String {
    colorScheme == .light ? "Svijetlo" : "Tamno"
}
```

Značenje ovog koda je:

Ako je trenutačno svijetli način, izraz `colorScheme == .light` je istinit i vraća se `"Svijetlo"`.

Inače se vraća `"Tamno"`.

Dakle, u svijetlom načinu:

```swift
Text(titleName)
```

prikazuje se:

```swift
Svijetlo
```

U tamnom načinu prikazuje se:

```swift
Tamno
```

Na ovaj način možemo prikazivati različit sadržaj prema različitim izgledima.

## Primjer prilagodbe boja

Osim teksta i ikona, ponekad moramo sami obraditi prilagodbu boja.

Na primjer:

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

Rezultat prikaza:

![view](../../../Resource/025_view6.png)

U ovom kodu tekst je bijel, a pozadina je crna.

U svijetlom načinu crna je pozadina prilično uočljiva.

Ali u tamnom načinu, ako je cijela pozadina sučelja također crna, ta će se crna pozadina stopiti sa sustavskom pozadinom i neće izgledati dovoljno jasno.

Tada možemo prema načinu izgleda mijenjati boju teksta i boju pozadine:

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

Rezultat prikaza:

![view](../../../Resource/025_view7.png)

Sada je u svijetlom načinu crna pozadina i bijeli tekst.

U tamnom načinu je bijela pozadina i crni tekst.

Tako u oba izgleda tekst i pozadina imaju jasan kontrast, pa korisnik može jasno vidjeti sadržaj.

## Korištenje Assets za prilagodbu boja

Osim ručne provjere preko `colorScheme`, možemo upotrijebiti i boje resursa iz `Assets` za prilagodbu svijetlom/tamnom načinu.

Ovaj je način prikladniji za upravljanje zajedničkim bojama u aplikaciji.

U Xcode projektu pronađite mapu resursa `Assets`.

![assets](../../../Resource/025_color.png)

Otvorite mapu `Assets`, desnom tipkom kliknite prazno područje i odaberite `New Color Set` kako biste stvorili novi resurs boje.

![assets](../../../Resource/025_color1.png)

Ovdje stvaramo boju i imenujemo je `redText`.

![assets](../../../Resource/025_color2.png)

Resurs boje može zasebno postaviti boje za svijetli i tamni način.

![assets](../../../Resource/025_color3.png)

Nakon odabira odgovarajućeg područja boje, možete promijeniti boju u desnom inspektoru svojstava.

Kliknite gumb `Hide or show the Inspectors` u gornjem desnom kutu kako biste otvorili područje inspektora.

Zatim odaberite `Show the Attributes inspector`, pri dnu pronađite `Show Color Panel` i otvorite ploču boja.

![assets](../../../Resource/025_color4.png)

Kliknite boju u ploči boja i područje boje koje odgovara `redText` sinkronizirano će se promijeniti.

Ovdje `redText` postavljamo ovako:

- U svijetlom načinu prikazuje crvenu boju
- U tamnom načinu prikazuje zelenu boju

![assets](../../../Resource/025_color5.png)

Natrag u SwiftUI kodu ovu boju možemo koristiti ovako:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Ovdje:

```swift
Color("redText")
```

znači čitanje resursa boje pod nazivom `redText` iz `Assets`.

Rezultat prikaza:

![assets](../../../Resource/025_view8.png)

Možete vidjeti da se isti `Color("redText")` u svijetlom i tamnom načinu prikazuje različitim bojama.

To pokazuje da i boje iz `Assets` same podržavaju prilagodbu izgleda.

## Razlika između colorScheme i Assets

I `colorScheme` i `Assets` mogu ostvariti prilagodbu izgleda, ali prikladni su za različite scenarije.

Ako samo prema svijetlom/tamnom načinu mijenjamo tekstualni sadržaj, naziv slike ili naziv `SF Symbols`, možemo upotrijebiti `colorScheme`.

Na primjer:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Ako se radi o bojama koje se često koriste u aplikaciji, kao što su tematska boja, pozadina kartice ili boja teksta, preporučuje se koristiti boje iz `Assets`.

Zato što se boje iz `Assets` mogu ponovno koristiti u više prikaza i kasnije ih je praktičnije mijenjati.

Na primjer:

```swift
Color("redText")
```

Tako je dovoljno promijeniti boju u `Assets`, a sva mjesta koja koriste tu boju promijenit će se zajedno.

## Sažetak

U ovoj lekciji naučili smo prilagodbu izgleda za svijetli način i tamni način.

Prvo smo naučili kako u Xcodeovom `Canvas` pretpregledati različite izglede i kako koristiti `Color Scheme Variants` za istovremeni prikaz svijetlog i tamnog načina.

Zatim smo saznali da se SwiftUI prikazi kao što su `Text` i `Image` zadano automatski prilagođavaju bojama prema izgledu sustava.

Međutim, ako ručno zadamo fiksne boje, kao što su `Color.white` ili `Color.black`, te se boje neće automatski zamijeniti.

Zatim smo naučili `@Environment` i `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Pomoću `colorScheme` možemo odrediti je li trenutačno svijetli način ili tamni način i prema različitom izgledu prikazati različite ikone, tekst ili boje.

Na kraju smo naučili boje iz `Assets`.

Boje iz `Assets` mogu zasebno postaviti boje za svijetli i tamni način, pa su prikladne za upravljanje zajedničkim resursima boja u aplikaciji.

Prilagodba izgleda omogućuje aplikaciji bolji prikaz danju i noću te može izbjeći probleme poput nečitljivog teksta i nejasne pozadine.

U stvarnom razvoju preporučuje se najprije koristiti zadane SwiftUI-jeve sposobnosti prilagodbe i boje iz `Assets`.

Kada u različitim izgledima treba mijenjati tekst, ikone, slike ili obraditi manji broj posebnih efekata prikaza, tada upotrijebite `colorScheme` za provjeru.

## Dodatno znanje: određivanje veličine fonta

Kada smo ranije učili `font`, koristili smo neke sustavske stilove fonta:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Osim korištenja sustavskih stilova fonta kao što su `.largeTitle` i `.callout`, veličinu fonta možemo odrediti i ručno.

Na primjer:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Ovdje:

```swift
.font(.system(size: 100))
```

znači postavljanje veličine fonta na `100 pt`.

Za ikone `SF Symbols`, `font` također utječe na veličinu ikone.

Zato, ako želite da se ikona prikaže veća, veličinu možete odrediti pomoću `.font(.system(size:))`.

Na primjer:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Važno je napomenuti da je ručno određivanje veličine fonta fleksibilnije, ali za običan tekst nije preporučljivo često koristiti fiksne veličine fonta.

Za običan tekst prednost treba dati sustavskim stilovima fonta kao što su `.title`, `.headline`, `.body` i `.caption`.

Tako se bolje prilagođava različitim uređajima i korisničkim postavkama veličine fonta.
