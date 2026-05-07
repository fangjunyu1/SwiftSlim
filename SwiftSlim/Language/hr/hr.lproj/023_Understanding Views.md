# Razumijevanje viewova

U ovoj lekciji ponovno se vraćamo na početni `ContentView`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Kad smo se prvi put susreli sa SwiftUI-jem, u `ContentView`-u bilo je mnogo ključnih riječi koje nismo razumjeli.

Na primjer `struct`, `View`, `var`, `body`, `some View` i druge ključne riječi.

Tada smo možda znali samo ovo: **kada kod napišemo unutar `body`, sadržaj će se prikazati na sučelju.**

Sada smo već učili `struct`, varijable, metode i protokole, pa možemo ponovno razumjeti ovaj kod i lakše shvatiti odnos između SwiftUI viewova.

## Ponovno gledamo ContentView

Nakon stvaranja SwiftUI projekta, Xcode prema zadanim postavkama generira datoteku `ContentView`.

Primjer koda je sljedeći:

```swift
import SwiftUI

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

Ovaj kod možemo razumjeti tako da ga podijelimo na nekoliko dijelova.

Prvo:

```swift
import SwiftUI
```

Ova linija koda znači da uvozimo SwiftUI framework.

Nakon uvoza SwiftUI-ja možemo koristiti SwiftUI viewove kao što su `View`, `Text`, `Image`, `VStack`, `Button` i drugi.

## Struktura ContentView

Ova linija koda znači da stvaramo strukturu:

```swift
struct ContentView: View
```

U tome:

```swift
struct ContentView
```

znači da je `ContentView` jedna struktura.

U prošloj lekciji upoznali smo strukturu `struct`. Ona može kombinirati različita polja zajedno, a može sadržavati svojstva i metode.

Na primjer:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

U ovom primjeru, `ContentView` sadrži tri stvari: `name`, `printName` i `body`.

Drugim riječima, `struct` može zajedno organizirati povezana svojstva, metode i sadržaj viewa.

![contentView](../../Resource/023_contentVIew.png)

## View je protokol

Nastavimo gledati ovu liniju koda:

```swift
struct ContentView: View 
```

`View` nakon dvotočke znači: `ContentView` slijedi protokol `View`.

Možemo to razumjeti ovako: ako `ContentView` želi postati SwiftUI view, mora zadovoljiti zahtjeve protokola `View`.

### Protokol Identifiable

Kada smo ranije učili popis filmova, susreli smo se s protokolom `Identifiable`.

Tada smo trebali u `ForEach` prolaziti kroz niz `Movie`, ali struktura `Movie` nije imala jedinstveni identifikator, pa nije podržavala prolazak kroz `ForEach`.

U tom trenutku trebali smo napraviti da struktura `Movie` slijedi protokol `Identifiable`, kako bi zadovoljila zahtjev `ForEach`-a za jedinstvenim identifikatorom.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Protokol `Identifiable` zahtijeva: **ovaj tip ima polje `id` koje ga identificira.**

Kada `Movie` pruži polje `id`, može zadovoljiti zahtjev protokola `Identifiable`.

Tako SwiftUI može prepoznati svaki podatak kada ga koristimo u `ForEach`.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protokol View

Isto vrijedi i za protokol `View`.

Ako neki tip želi postati SwiftUI view, mora slijediti protokol `View`.

A najvažniji zahtjev protokola `View` jest pružiti jedan `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Možemo to razumjeti ovako: protokol `View` zahtijeva: **prihvaća samo SwiftUI view koji vraća `body`, a `ContentView` kroz `body` prikazuje SwiftUI view.**

### Što ako ne slijedimo View?

Ako napišemo ovako:

```swift
struct ContentView {
}
```

To je samo obična struktura, nije SwiftUI view.

Neće odmah prijaviti grešku, jer je obična struktura sama po sebi valjan Swift kod.

Ali ako je stavimo u preview:

```swift
#Preview {
    ContentView()
}
```

Tada će se pojaviti greška.

Razlog je: **preview treba prikazati SwiftUI view, a ovaj `ContentView` ne slijedi protokol `View`.**

Zato, ako želimo da se `ContentView` prikaže na sučelju, moramo ga natjerati da slijedi protokol `View`:

```swift
struct ContentView: View {
}
```

Istovremeno, prema zahtjevu protokola `View`, moramo pružiti `body`. Ako nema `body`, compiler će i dalje prijaviti grešku.

Ispravan način pisanja:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Tek tada je `ContentView` pravi SwiftUI view koji se može prikazati.

## body je ulaz za prikaz viewa

U SwiftUI-ju, `body` je ulaz za sadržaj viewa.

```swift
var body: some View {
    Text("Hello, world!")
}
```

Ovdje to možemo podijeliti na tri dijela:

**1. var body**

```swift
var body
```

Znači da definiramo varijablu imena `body`.

**2. some View**

```swift
: some View
```

Znači da će ovaj `body` vratiti jedan view.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

Označava sadržaj viewa koji se prikazuje. U ovom kodu prikazuje se jedan `Text` view.

Drugim riječima, ono što napišemo unutar `body`, to se prikazuje na sučelju.

Na primjer:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Ovaj kod znači: **na sučelju se prikazuje okomito raspoređen sadržaj, a unutra su dva teksta.**

### Ime body ne može se proizvoljno mijenjati

Važno je primijetiti da se ime `body` ne može samo tako promijeniti.

Ako napišemo:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

Ovaj `content` također je svojstvo viewa, ali ne može zamijeniti `body`.

Zato što je naziv koji zahtijeva protokol `View` upravo `body`.

## Što je some View?

U SwiftUI-ju, `some View` znači da se vraća konkretan view, samo nije potrebno napisati puni tip tog viewa.

```swift
var body: some View
```

Drugim riječima, `some View` ne znači da nema tipa. Stvarni tip i dalje postoji, compiler zna koji je to tip, ali taj tip može biti vrlo složen, pa nam Swift dopušta da ga sakrijemo pomoću `some View`.

### Što je some?

U Swiftu, `some` je ključna riječ za deklariranje neprozirnog tipa, odnosno opaque type.

Neprozirni tip znači: **povratna vrijednost ima konkretan tip, compiler zna koji je to konkretan tip, ali mi ga ne pišemo izravno.**

Na primjer:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

To znači da će `makeView` vratiti konkretan tip koji slijedi protokol `View`.

### Zašto nam treba some?

Kada smo učili varijable, saznali smo: **vrijednosti u Swiftu trebaju eksplicitno označen tip ili compiler automatski zaključuje tip.**

Na primjer:

```swift
let a: Int = 10
```

Ovdje je konstanta `a` tipa `Int`.

SwiftUI viewovi nisu iznimka. Kada koristimo `body` za prikaz SwiftUI viewa, `body` treba vratiti odgovarajući SwiftUI tip.

Na primjer, ako pomoću `body` prikazujemo tekstualni view `Text`, onda `body` treba vratiti odgovarajući tip `Text`.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

U ovom primjeru, unutar `body` prikazuje se `Text` view, a povratni tip je također `Text`.

Tek kada su unutarnji tip i deklarirani tip isti, zadovoljen je compilerov zahtjev za podudaranjem tipova.

**Problem nepodudaranja tipova**

Ako tip za `body` postavimo na `Color`, ali prikazujemo `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

Tip `body` i tip unutarnjeg koda nisu isti, pa će se pokrenuti greška nepodudaranja tipova.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Tada moramo ručno promijeniti povratni tip za `body`.

**Složeni tipovi viewova**

U stvarnom razvoju, sučelje obično nema samo jedan `Text`.

Ako trebamo prikazati složeniji `VStack`, morali bismo ručno označiti složeni povratni tip.

Na primjer:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

Ovaj kod znači da se vraća jedan `VStack`, a unutar `VStack` nalaze se viewovi tipa `Image` i `Text`.

Povratni tip za `body` je:

```swift
VStack<TupleView<(Image,Text)>>
```

Možemo vidjeti da je ovaj povratni tip vrlo složen, a pojavio se i `TupleView` koji prije nismo vidjeli.

`TupleView` ovdje možemo razumjeti kao: **omatanje više child viewova u jedan view.**

**Još složeniji tipovi viewova**

Ako viewu dodamo modifikatore:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Tada povratni tip ovog viewa postaje vrlo složen i ovdje ga nije moguće konkretno opisati.

Postojeći povratni tip `VStack<TupleView<(Image,Text)>>` ne može opisati modifikatore, pa će nastati greška.

**some View pojednostavljuje povratni tip**

Za ovu situaciju SwiftUI pruža jednostavno rješenje, a to je korištenje `some View` za pojednostavljenje pisanja.

Kada promijenimo `body` u tip `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Svaki put kada promijenimo kod viewa, više ne moramo napisati puni povratni tip.

To je zato što `some View` znači da se vraća konkretan view koji slijedi protokol `View`.

Drugim riječima, SwiftUI viewovi kao što su `VStack`, `Image` i drugi svi slijede protokol `View`. Tip viewa koji se vraća nakon dodavanja modifikatora i dalje slijedi protokol `View`.

Zato se svi oni mogu vratiti kao `some View`.

### some View ne može proizvoljno vratiti bilo koji view

Iako `some View` može sakriti složene tipove, nije "bez tipa".

Njegovo osnovno pravilo je: **compiler mora moći odrediti jedan konkretan povratni tip**.

Na primjer:

```swift
var title: some View {
    Text("Hello")
}
```

Ovdje se vraća `Text` view.

Ali ako pokušamo vratiti dva viewa, pojavit će se greška:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Zato što `some View` na kraju treba vratiti jednu strukturu viewa, a ovdje pokušavamo vratiti dva neovisna viewa.

### Rješenje

Rješenja su obično dva: spremnik i `@ViewBuilder`.

**1. Omotati spremnikom**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

U ovom kodu, `title` vraća jedan `VStack`, a `Text` i `Image` su child viewovi unutar `VStack`.

Struktura viewa koju prihvaća `some View` jest jedan `VStack<...>`, pa time zadovoljava zahtjev `some View` da se vrati jedna struktura viewa. 

To je i razlog zašto od početka učenja SwiftUI-ja preporučujemo korištenje spremnika `VStack` na najvanjskijoj razini za omatanje koda viewa.

**2. Koristiti @ViewBuilder**

Ispred `some View` možemo dodati i modifikator `@ViewBuilder`:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` može spojiti više viewova u jedan povratni rezultat.

U suštini, i dalje spaja više viewova u jedan view, kako bi zadovoljio zahtjev `some View` da se vrati jedna struktura viewa.

### Zašto u body možemo izravno napisati više viewova?

Ako u `var body` napišemo više viewova, na primjer:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

U nekim slučajevima takav `body` neće prijaviti grešku.

Razlog je u tome što `body` u protokolu `View` prema zadanim postavkama podržava `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

U izvornom kodu protokola `View` možemo vidjeti da `@ViewBuilder` već modificira varijablu `body`.

Zato `body` u odnosu na obični `some View` ima dodatnu posebnu obradu, pa nam SwiftUI automatski spaja više viewova u jedan view.

**Preporuka za korištenje spremnika**

Kako bi početnicima bilo lakše razumjeti, preporučuje se prvo koristiti spremnike kao što su `VStack`, `HStack`, `ZStack`, `Group` za organiziranje više viewova.

Na primjer:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Tako je kod intuitivniji: **vanjski sloj je jedan `VStack`, a unutra su dva child viewa.**

## Razdvajanje viewova

Ako je sučelje relativno jednostavno, sav kod možemo napisati u `body`.

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Dobro došli u Qinote")
                Text("Dobro jutro")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("klikni me") {
                print("klikni me ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Stil prikaza ovog viewa:

![view](../../Resource/023_view1.png)

Ovaj kod može normalno raditi, ali ako kod viewa postane vrlo složen, kod unutar `body` bit će sve dulji, a čitanje i izmjena postajat će sve teži.

Tada različita područja možemo razdvojiti u neovisna svojstva viewa.

### Razdvajanje gornjeg viewa

Na primjer, izdvojimo gornje područje:

```swift
var topHome: some View {
    HStack {
        Text("Početna")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ovdje je `topHome` varijabla koja vraća jedan view.

Budući da se vraća view, tip možemo napisati kao:

```swift
some View
```

Ovo je zapravo ista upotreba kao `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Oboje koriste varijablu za prikaz viewa, a povratni tip je `some View`.

### Razdvajanje drugih viewova

Zatim nastavljamo razdvajati druge dijelove:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Dobro došli u Qinote")
        Text("Dobro jutro")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Klikni me") {
        print("klikni me")
    }
    .buttonStyle(.borderedProminent)
}
```

Nakon razdvajanja, view varijable možemo staviti u `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Početna")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Dobro došli u Qinote")
            Text("Dobro jutro")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Klikni me") {
            print("klikni me")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Sada je `body` odgovoran samo za opis strukture stranice:

```swift
topBar
welcomeText
colorList
clickButton
```

Konkretna implementacija svakog dijela nalazi se u odgovarajućem svojstvu ispod.

Ovakav način razdvajanja viewova može učiniti strukturu stranice jasnijom. Svako područje viewa ima svoje ime, pa je čitanje intuitivnije.

Kada želimo promijeniti kod određenog dijela, možemo izravno pronaći odgovarajuće područje viewa, umjesto da tražimo kod u gomili složenog koda.

### some View vraća jedan view

U ovako razdvojenom viewu, ako pokušamo vratiti više viewova:

```swift
var topBar: some View {
    Text("Početna")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` može vratiti samo jednu strukturu viewa, pa će doći do greške.

Za razliku od `body`, obično izračunato svojstvo prema zadanim postavkama nema `@ViewBuilder`.

Zato, ako trebamo vratiti više viewova, možemo koristiti spremnike `VStack`, `HStack` ili `Group` kako bismo više viewova spojili u jedan.

```swift
var topBar: some View {
    VStack {
        Text("Početna")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ili dodati `@ViewBuilder` za kombiniranje viewova:

```swift
@ViewBuilder
var topBar: some View {
    Text("Početna")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Tako možemo vratiti više viewova.

### if vraća više viewova

Na primjer:

```swift
var topHome: some View {
    if step == "Početna" {
        HStack {
            Text("Početna")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Ništa")
    }
}
```

U ovom kodu, `topHome` će prema sadržaju `step` vratiti dvije različite vrste viewova: `HStack` ili `Text`.

Budući da `some View` treba jedan određeni konkretni povratni tip, dvije grane `if`-a u običnom izračunatom svojstvu ne mogu izravno vratiti viewove različitih tipova, pa će nastati greška.

**Rješenje je i dalje omotati spremnikom ili koristiti modifikator `@ViewBuilder`.**

### Zašto kod razdvojenih viewova ne koristimo zagrade

Kada u `body` koristimo izdvojena svojstva viewa, pišemo izravno:

```swift
topBar
welcomeText
colorList
clickButton
```

a ne ovako:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Zato što su `topBar`, `welcomeText`, `colorList`, `clickButton` varijable. Te varijable zapravo su izračunata svojstva, nisu metode.

**Svojstva ne trebaju zagrade.**

Ako ih napišemo kao metodu, možemo postići sličan učinak:

```swift
func topBar() -> some View {
    HStack {
        Text("Početna")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ovaj kod također može postići sličan učinak. Pozivanje ove metode vratit će jedan view.

Pri korištenju treba napisati:

```swift
topBar()
```

U SwiftUI-ju, ako samo razdvajamo view kojem ne treba proslijediti parametre, češći je način korištenje izračunatog svojstva.

```swift
var topBar: some View { ... }
```

## Ugniježđeni viewovi

Osim razdvajanja koda u svojstva, možemo stvoriti i nove strukture viewova.

Na primjer:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Ovaj `PinkColorView`, isto kao `ContentView`, neovisan je SwiftUI view.

Ako ga trebamo prikazati u `ContentView`, iza imena viewa možemo dodati `()`.

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Ovdje:

```swift
PinkColorView()
```

znači stvaranje jedne instance `PinkColorView`.

Budući da `PinkColorView` slijedi protokol `View`, može se prikazati u drugim viewovima isto kao `Text`, `Image` i `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

To je ugnježđivanje viewova: jedan view može se prikazati unutar drugog viewa.

## Svojstvo viewa ili stvaranje novog viewa?

Kada je kod viewa relativno jednostavan, obično ga ne treba razdvajati. Tek kada kod postane složeniji, preporučuje se razdvajanje viewa.

### Situacija za korištenje svojstva viewa

Ako je riječ samo o malom dijelu sadržaja u trenutnom viewu, može se koristiti svojstvo viewa.

Na primjer:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Ovi se sadržaji obično koriste samo u trenutnom viewu.

### Situacija za stvaranje novog viewa

Ako su ovi sadržaji relativno neovisni ili bi se u budućnosti mogli ponovno koristiti na više stranica, prikladnije je stvoriti novi view.

Na primjer:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Ovo je title view. Ako taj view želimo koristiti kao zajedničku komponentu i ponovno ga koristiti u drugim viewovima.

Možemo stvoriti novi view:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Zatim ga koristimo na drugim mjestima:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Tada je ovaj view ponovno upotrebljiva neovisna komponenta.

Možemo to jednostavno sažeti ovako:

- područje sadržaja trenutnog viewa: može se koristiti `var xxx: some View`
- ponovno upotrebljiva neovisna komponenta: može se stvoriti novi `struct XxxView: View`
- komponenta kojoj treba proslijediti podatke: obično je prikladnije stvoriti novi view.

## Sažetak

U ovoj lekciji ponovno smo razumjeli najosnovniju, ali i najvažniju strukturu viewa u SwiftUI-ju.

`ContentView` je struktura. Definira se pomoću `struct` i služi za organiziranje koda povezanog sa stranicom.

`View` je protokol. Ako neka struktura želi postati SwiftUI view, mora slijediti protokol `View`.

`body` je sadržaj koji protokol `View` zahtijeva da pružimo. On određuje što će ovaj view prikazati.

`some View` znači da se vraća neka konkretna vrsta viewa, a mi ne moramo napisati njegov složeni puni tip.

Kada kod viewa postane dug, možemo koristiti `var xxx: some View` kako bismo kod viewa razdvojili u više manjih područja.

Kada je neki dio sadržaja relativno neovisan ili ga treba ponovno koristiti, možemo stvoriti novu strukturu viewa i prikazati je u drugim viewovima pomoću `XxxView()`.

Jednostavno rečeno, SwiftUI sučelje sastavljeno je kombiniranjem pojedinačnih viewova. Jedna stranica može sadržavati više malih viewova, a jedan mali view može dalje sadržavati druge viewove.
