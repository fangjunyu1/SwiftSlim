# Enciklopedija životinja 

U ovoj lekciji nastavljamo vježbati prilagođene prikaze i prijenos podataka.

Izradit ćemo jednostavan prikaz enciklopedije životinja. Na stranici će se prikazati pet životinja. Kada korisnik dodirne neku životinju, otvorit će se prikaz detalja s njezinom slikom, područjem rasprostranjenosti, staništem i opisom.

Rezultat:

![view](../../../Resource/029_view.png)

Kroz ovaj primjer možemo vježbati suradnju između strukture podataka, prikaza popisa, interakcije dodirom i Sheet skočnog prikaza.

## Priprema slikovnih materijala

Najprije trebamo pripremiti pet slika životinja:

- Dupin: `dolphin.jpg`
- Žirafa: `giraffe.jpg`
- Lav: `lion.jpg`
- Panda: `panda.jpg`
- Polarni medvjed: `polarBear.jpg`

Možete upotrijebiti sljedeće slikovne materijale:

[Dupin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [žirafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [lav](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [polarni medvjed](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Nakon preuzimanja slika, povucite ih u mapu resursa `Assets` u Xcode projektu.

![assets](../../../Resource/029_assets.png)

Važno je napomenuti da pri korištenju slika u kodu obično ne treba pisati nastavak `.jpg`.

Na primjer, ako je naziv slikovnog resursa `dolphin`, u kodu pišemo:

```swift
Image("dolphin")
```

Ako pogrešno napišete naziv slike, slika se neće pravilno prikazati.

Napomena: navedeni slikovni materijali potječu iz projekata Wikimedije. Pri uporabi se preporučuje zadržati poveznice na izvornu sliku i podatke o izvoru.

## Izrada strukture životinje

Na ovoj stranici svaka životinja ima više podataka:

- Naziv životinje
- Slika životinje
- Emoji životinje
- Područje rasprostranjenosti
- Stanište
- Opis životinje

Ako te podatke razdvojimo u mnogo varijabli, kod će postati neuredan. Zato možemo izraditi strukturu `Animal` i spremiti podatke jedne životinje na jednom mjestu.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

U ovom kodu:

- `id`: jedinstveni identifikator životinje.
- `name`: naziv životinje.
- `imageName`: naziv slike životinje.
- `avatarEmoji`: emoji životinje.
- `distributionArea`: područje rasprostranjenosti.
- `habitat`: stanište.
- `animalDescription`: opis životinje.

Među njima:

```swift
let id = UUID()
```

`id` se koristi za označavanje svake životinje. Budući da ćemo kasnije koristiti `ForEach` za prikaz popisa životinja, a zatim `.sheet(item:)` za prikaz detalja prema odabranoj životinji, `Animal` mora biti usklađen s protokolom `Identifiable`.

Uloga protokola `Identifiable` je reći SwiftUI-ju da svaka životinja ima `id` po kojem se može razlikovati.

## Izrada podataka o životinjama

Zatim u `ContentView` izrađujemo polje životinja.

U polju se sprema pet vrijednosti `Animal`, a svaka vrijednost `Animal` predstavlja jednu životinju.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Dupin
        Animal(
            name: "Dupin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Topli i umjereni oceani diljem svijeta.",
            habitat: "Oceani, obalne vode i neke velike rijeke.",
            animalDescription: "Dupini su inteligentni morski sisavci. Žive u skupinama, komuniciraju zvukovima i poznati su po razigranom ponašanju."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane i otvorene šume u Africi.",
            habitat: "Travnjaci, savane i otvorene šume.",
            animalDescription: "Žirafe su najviše kopnene životinje. Imaju duge vratove, duge noge i obično se hrane lišćem visokih stabala."
        ),
        // Lav
        Animal(
            name: "Lav",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Uglavnom se nalaze u podsaharskoj Africi, s malom populacijom u zapadnoj Indiji.",
            habitat: "Travnjaci, savane i otvorene šumske površine.",
            animalDescription: "Lavovi su snažne velike mačke. Obično žive u skupinama zvanima čopori i često su poznati kao kraljevi životinjskog svijeta."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Planinske šume u središnjoj Kini.",
            habitat: "Bambusove šume u hladnim i vlažnim planinskim područjima.",
            animalDescription: "Pande su medvjedi poznati po crno-bijelom krznu. Uglavnom jedu bambus i jedne su od najprepoznatljivijih životinja na svijetu."
        ),
        // Polarni medvjed
        Animal(
            name: "Polarni medvjed",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktička područja oko Sjevernog pola.",
            habitat: "Morski led, obalna područja i hladna arktička okruženja.",
            animalDescription: "Polarni medvjedi su veliki medvjedi prilagođeni hladnim okruženjima. Snažni su plivači i uglavnom ovise o morskom ledu za lov na tuljane."
        )
    ]

    var body: some View {
        Text("Enciklopedija životinja")
    }
}
```

Ovdje je `animals` polje:

```swift
let animals: [Animal]
```

`[Animal]` znači da se u ovom polju sprema više vrijednosti `Animal`.

Drugim riječima, `animals` nije jedna životinja, nego skupina životinja.

## Prikaz popisa životinja

Sada možemo upotrijebiti `ForEach` za prikaz popisa životinja.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Rezultat prikaza:

![view](../../../Resource/029_view1.png)

U ovom kodu:

```swift
ForEach(animals) { animal in
    ...
}
```

To znači da prolazimo kroz polje `animals`.

Pri svakom prolazu petlje `animal` označava životinju koja se trenutačno prikazuje.

Na primjer, u prvom prolazu `animal` je dupin; u drugom prolazu `animal` je žirafa.

Zato podatke trenutačne životinje možemo prikazati na sljedeći način:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Tako možemo prikazati svih pet životinja.

## Omogućavanje dodira na popisu životinja

Popis je sada prikazan, ali ga još nije moguće dodirnuti.

Ako želimo da se nakon dodira na životinju prikažu detalji, najprije trebamo zabilježiti „trenutačno odabranu životinju”.

Zato u `ContentView` dodajemo varijablu stanja:

```swift
@State private var selectedAnimal: Animal? = nil
```

Ovdje je `selectedAnimal` opcionalna vrijednost tipa `Animal?`.

To znači da može sadržavati jednu životinju, ali može i ne sadržavati nijednu.

Zadana vrijednost je `nil`, što znači da na početku nije odabrana nijedna životinja.

Zatim svaki redak sa životinjom pretvaramo u `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Ključna je ova linija koda:

```swift
selectedAnimal = animal
```

Kada korisnik dodirne neku životinju, spremamo tu životinju u `selectedAnimal`.

Na primjer, ako korisnik dodirne dupina, `selectedAnimal` sprema dupina.

Ako korisnik dodirne pandu, `selectedAnimal` sprema pandu.

Drugim riječima, `selectedAnimal` se koristi za bilježenje životinje koju je korisnik trenutačno dodirnuo.

## Sheet skočni prikaz

Sada pomoću gumba već možemo zabilježiti „trenutačno dodirnutu životinju”.

Sljedeće trebamo implementirati skočni prikaz za prikaz detalja životinje.

![view](../../../Resource/029_view2.png)

U SwiftUI-ju se ovaj skočni efekt može ostvariti pomoću `Sheet`.

`Sheet` možemo razumjeti kao privremeno prikazanu stranicu. Prikazuje se iznad trenutačne stranice, a korisnik je nakon pregleda sadržaja može zatvoriti povlačenjem prema dolje.

## Primjer za Sheet

Prije nego što stvarno prikažemo detalje životinje, najprije ćemo jednostavnim primjerom razumjeti kako se `Sheet` otvara.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Prikaži Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet prikaz")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Rezultat prikaza:

![view](../../../Resource/029_view3.png)

U ovom kodu izradili smo Booleovu vrijednost:

```swift
@State private var showSheet = false
```

`showSheet` je prema zadanim postavkama `false`, što znači da se `Sheet` na početku ne prikazuje.

Kada dodirnemo gumb:

```swift
showSheet.toggle()
```

`toggle()` znači prebacivanje Booleove vrijednosti.

Ako je izvorno bila `false`, nakon poziva `toggle()` postaje `true`.

Ako je izvorno bila `true`, nakon poziva `toggle()` postaje `false`.

Zato će se nakon dodira gumba `showSheet` promijeniti iz `false` u `true`.

Kada `showSheet` postane `true`, sljedeći kod prikazat će `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet prikaz")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ovaj kod znači: kada je `showSheet` `true`, otvara se `Sheet` i u njemu se prikazuje `Text("Sheet prikaz")`.

Rezultat prikaza:

![view](../../../Resource/029_view4.png)

Ovaj način pisanja prikladan je za prikaz fiksnog sadržaja.

Na primjer, nakon dodira gumba može se otvoriti stranica postavki, stranica s objašnjenjem, stranica s porukom i slično.

### Položaj prikaza za Sheet

Iako je `Sheet` skočni prikaz, u SwiftUI-ju se ne piše izravno kao samostalni prikaz poput `Text()` ili `Image()`, nego se koristi kao modifikator prikaza.

Drugim riječima, `.sheet(...)` je sličan modifikatorima kao što su `.font()`, `.padding()` i `.shadow()`; svi se moraju dodati iza nekog prikaza.

Na primjer:

```swift
Button("Prikaži Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet prikaz")
}
```

U ovom primjeru `.sheet` je dodan iza `Button`.

Kada `showSheet` postane `true`, SwiftUI će otvoriti `Sheet` i prikazati sadržaj unutar vitičastih zagrada:

```swift
Text("Sheet prikaz")
```

Međutim, u stvarnom razvoju, ako stranica ima više gumba, obično ne dodajemo `.sheet` svakom gumbu.

Češći je pristup dodati `.sheet` iza vanjskog prikaza.

Na primjer:

```swift
VStack {
    Button("Prikaži Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet prikaz")
}
```

Gumb je odgovoran za promjenu vrijednosti `showSheet`, a vanjski prikaz je odgovoran za otvaranje `Sheet` prema tome je li `showSheet` `true`.

## Sheet vezan za opcionalnu vrijednost

Ranije smo naučili ovaj način pisanja:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet prikaz")
}
```

Ovaj način pisanja prikladan je za kontrolu prikazivanja i skrivanja fiksne stranice.

No u primjeru enciklopedije životinja ne trebamo znati samo „treba li otvoriti `Sheet`”, nego i „koja je životinja dodirnuta”.

Na primjer:

Kada korisnik dodirne dupina, u `Sheet` bi se trebali prikazati detalji dupina.

Kada korisnik dodirne pandu, u `Sheet` bi se trebali prikazati detalji pande.

Zato je ovdje prikladniji drugi način pisanja za Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sadržaj prikazan u Sheet
}
```

U ovom kodu `Sheet` je vezan za opcionalnu vrijednost `selectedAnimal`.

Ovdje treba obratiti pozornost da se iza `item:` piše `$selectedAnimal`, a ne `selectedAnimal`.

To je zato što `Sheet` ne samo da čita vrijednost `selectedAnimal`, nego prema njezinim promjenama odlučuje hoće li se otvoriti.

Ovaj kod možemo razumjeti ovako:

- Kada je `selectedAnimal` `nil`, `Sheet` se ne prikazuje.
- Kada `selectedAnimal` ima vrijednost, `Sheet` se prikazuje.
- Kada se `Sheet` zatvori, SwiftUI će ponovno postaviti `selectedAnimal` na `nil`.

SwiftUI će životinju spremljenu u `selectedAnimal` proslijediti u `animal` unutar vitičastih zagrada.

Drugim riječima, `.sheet(item:)` ne kontrolira samo otvaranje, nego i prosljeđuje odabrane podatke u `Sheet`.

## Prikaz naziva životinje pomoću Sheet

Sada nemojmo odmah stvarati složen prikaz detalja.

Kako bi kod bio lakši za razumijevanje, najprije ćemo u `Sheet` prikazati naziv trenutačne životinje.

Dodajte `.sheet(item:)` izvan `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Ovdje je najvažniji ovaj dio koda:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Kada `selectedAnimal` ima vrijednost, `Sheet` će se otvoriti.

`animal` unutar vitičastih zagrada jest trenutačno odabrana životinja.

Zato:

```swift
Text(animal.name)
```

prikazat će se naziv životinje koju smo trenutačno dodirnuli.

Na primjer, dodirnite `Dupin` i u Sheet će se prikazati `Dupin`.

Dodirnite `Panda` i u `Sheet` će se prikazati `Panda`.

Tako smo ostvarili učinak da dodir različitih životinja otvara različite nazive životinja.

Prikaz naziva životinje:

![view](../../../Resource/029_view5.png)

Međutim, detalji životinje ne bi trebali prikazivati samo naziv, nego i naziv, područje rasprostranjenosti, stanište i opis.

Ako sav taj kod napišemo unutar `.sheet`, kod će postati vrlo dug i neće biti pogodan za čitanje.

Zato ćemo sljedeće izraditi novi prilagođeni prikaz, posebno zadužen za prikaz detalja životinje.

## Izrada prikaza detalja životinje

Sljedeće izrađujemo novi prilagođeni prikaz `AnimalDetailView`.

Ovaj prikaz prima jedan `Animal` i prikazuje detalje životinje.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Područje rasprostranjenosti:** \(animal.distributionArea)")

                    Divider()

                    Text("**Stanište:** \(animal.habitat)")

                    Divider()

                    Text("**Opis životinje:** \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Rezultat prikaza:

![view](../../../Resource/029_view2.png)

Ovdje je ključno:

```swift
var animal: Animal
```

To znači da `AnimalDetailView` treba primiti jednu životinju izvana.

Nakon što primi životinju, prikaz detalja može koristiti razne podatke te životinje:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Drugim riječima, `AnimalDetailView` je odgovoran samo za prikaz proslijeđene životinje.

### Podebljani tekst u Markdownu

U prikazu detalja napisali smo ovakav kod:

```swift
Text("**Stanište:** \(animal.habitat)")
```

Ovdje postoje dvije važne točke.

Prvo, `**Stanište:**` koristi sintaksu `Markdown`. Tekst okružen dvjema zvjezdicama prikazuje se podebljano.

Drugo, `\()` je interpolacija stringa i može prikazati vrijednost varijable unutar teksta.

Ovaj kod znači da se najprije prikazuje podebljano `Stanište:`, a zatim stanište te životinje.

## Prikaz detaljnog prikaza u Sheet

Nakon izrade `AnimalDetailView`, možemo se vratiti u `ContentView` i izvorni prikaz naziva u `Sheet` zamijeniti prikazom detalja.

Izvorno je bilo:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Sada se mijenja u:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Ovdje je `animal:` naziv parametra za `AnimalDetailView`.

Sljedeći `animal` je trenutačna životinja koju prosljeđuje `.sheet(item:)`.

To znači da se trenutačno dodirnuta životinja prosljeđuje u `AnimalDetailView` za prikaz.

Cjelovita struktura:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Kada korisnik dodirne životinju:

```swift
selectedAnimal = animal
```

`selectedAnimal` se mijenja iz `nil` u konkretnu životinju. Kada `Sheet` otkrije da `selectedAnimal` ima vrijednost, otvara prikaz.

`Sheet` prosljeđuje životinju iz `selectedAnimal` u prikaz `AnimalDetailView`, a `AnimalDetailView` prikazuje detalje životinje.

Tako smo ostvarili funkciju u kojoj dodir popisa životinja otvara odgovarajuće detalje životinje.

## Razlika između dva načina pisanja za Sheet

Sada smo pomoću `.sheet(item:)` dovršili prikaz detalja životinje.

Ovdje možemo ukratko sažeti dva uobičajena načina pisanja za `Sheet`.

### Prvi način je vezanje Booleove vrijednosti

```swift
@State private var showSheet = false

Button("Prikaži Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet prikaz")
}
```

Ovaj način pisanja prikladan je za otvaranje fiksnog sadržaja, kao što su stranica postavki, stranica s objašnjenjem ili stranica s porukom.

`showSheet` je Booleova vrijednost i ima samo dva stanja: `true` i `false`.

Kada je `showSheet` `true`, `Sheet` se prikazuje.

Kada je `showSheet` `false`, `Sheet` se ne prikazuje.

### Drugi način je vezanje opcionalne vrijednosti

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Ovaj način pisanja prikladan je za otvaranje različitog sadržaja prema odabranim podacima.

U ovoj lekciji dodirujemo različite životinje i trebamo prikazati njihove različite detalje, pa je prikladnije koristiti `.sheet(item:)`.

## Cjeloviti kod

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Naziv životinje
    let name: String
    
    // Slika životinje
    let imageName: String
    
    // Emoji oznaka životinje
    let avatarEmoji: String
    
    // Područje rasprostranjenosti
    let distributionArea: String
    
    // Stanište
    let habitat: String
    
    // Opis životinje
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Dupin
        Animal(
            name: "Dupin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Topli i umjereni oceani diljem svijeta.",
            habitat: "Oceani, obalne vode i neke velike rijeke.",
            animalDescription: "Dupini su inteligentni morski sisavci. Žive u skupinama, komuniciraju zvukovima i poznati su po razigranom ponašanju."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane i otvorene šume u Africi.",
            habitat: "Travnjaci, savane i otvorene šume.",
            animalDescription: "Žirafe su najviše kopnene životinje. Imaju duge vratove, duge noge i obično se hrane lišćem visokih stabala."
        ),
        // Lav
        Animal(
            name: "Lav",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Uglavnom se nalaze u podsaharskoj Africi, s malom populacijom u zapadnoj Indiji.",
            habitat: "Travnjaci, savane i otvorene šumske površine.",
            animalDescription: "Lavovi su snažne velike mačke. Obično žive u skupinama zvanima čopori i često su poznati kao kraljevi životinjskog svijeta."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Planinske šume u središnjoj Kini.",
            habitat: "Bambusove šume u hladnim i vlažnim planinskim područjima.",
            animalDescription: "Pande su medvjedi poznati po crno-bijelom krznu. Uglavnom jedu bambus i jedne su od najprepoznatljivijih životinja na svijetu."
        ),
        // Polarni medvjed
        Animal(
            name: "Polarni medvjed",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktička područja oko Sjevernog pola.",
            habitat: "Morski led, obalna područja i hladna arktička okruženja.",
            animalDescription: "Polarni medvjedi su veliki medvjedi prilagođeni hladnim okruženjima. Snažni su plivači i uglavnom ovise o morskom ledu za lov na tuljane."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Područje rasprostranjenosti:** \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Stanište:** \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Opis životinje:** \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Sažetak

U ovoj lekciji dovršili smo jednostavnu stranicu enciklopedije životinja.

Najprije smo pomoću strukture `Animal` spremili podatke o životinjama, zatim pomoću polja spremili pet životinja, a potom pomoću `ForEach` prikazali popis životinja.

Kada korisnik dodirne neku životinju, tu životinju spremamo u `selectedAnimal`:

```swift
selectedAnimal = animal
```

Kada `selectedAnimal` ima vrijednost, `.sheet(item:)` otvara prikaz detalja i prosljeđuje odabranu životinju u `AnimalDetailView`.

Najvažnije u ovoj lekciji nije stil sučelja, nego razumijevanje ove putanje prijenosa podataka:

```swift
Dodir životinje → selectedAnimal sprema životinju → Sheet se otvara → AnimalDetailView prikazuje detalje
```

Nakon razumijevanja ove putanje, ubuduće možete izraditi više sličnih funkcija, kao što su detalji proizvoda, detalji lekcije, detalji članka ili detalji kontakta.
