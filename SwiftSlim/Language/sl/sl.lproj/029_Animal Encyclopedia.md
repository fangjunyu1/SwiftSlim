# Enciklopedija živali 

V tej lekciji bomo nadaljevali z vajo prilagojenih pogledov in prenosa podatkov.

Ustvarili bomo preprost pogled enciklopedije živali. Na strani bo prikazanih pet živali. Ko uporabnik tapne določeno žival, se prikaže podrobni pogled s sliko, območjem razširjenosti, življenjskim prostorom in opisom te živali.

Končni rezultat:

![view](../../../Resource/029_view.png)

S tem primerom lahko vadimo sodelovanje med podatkovnimi strukturami, prikazom seznama, interakcijo s tapom in pojavnim pogledom Sheet.

## Priprava slikovnih gradiv

Najprej moramo pripraviti pet slik živali:

- Delfin: `dolphin.jpg`
- Žirafa: `giraffe.jpg`
- Lev: `lion.jpg`
- Panda: `panda.jpg`
- Polarni medved: `polarBear.jpg`

Uporabite lahko naslednja slikovna gradiva:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Žirafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lev](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Polarni medved](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Ko slike prenesete, jih povlecite v mapo z viri `Assets` v projektu Xcode.

![assets](../../../Resource/029_assets.png)

Pri uporabi slik v kodi običajno ni treba zapisati pripone `.jpg`.

Na primer, če je ime slikovnega vira `dolphin`, v kodi zapišemo:

```swift
Image("dolphin")
```

Če je ime slike zapisano napačno, se slika ne bo pravilno prikazala.

Opomba: zgornja slikovna gradiva izvirajo iz projekta Wikimedia. Pri uporabi je priporočljivo ohraniti povezavo do izvirne slike in podatke o viru.

## Ustvarjanje strukture živali

Na tej strani ima vsaka žival več informacij:

- Ime živali
- Slika živali
- Emoji živali
- Območje razširjenosti
- Življenjski prostor
- Opis živali

Če te informacije razpršimo v veliko spremenljivk, bo koda precej nepregledna. Zato lahko ustvarimo strukturo `Animal` in informacije o eni živali zberemo na enem mestu.

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

V tej kodi:

- `id`: enolični identifikator živali.
- `name`: ime živali.
- `imageName`: ime slike živali.
- `avatarEmoji`: emoji živali.
- `distributionArea`: območje razširjenosti.
- `habitat`: življenjski prostor.
- `animalDescription`: opis živali.

Med njimi:

```swift
let id = UUID()
```

`id` se uporablja za identifikacijo vsake živali. Pozneje bomo z `ForEach` prikazali seznam živali, z `.sheet(item:)` pa bomo glede na izbrano žival prikazali podrobnosti, zato mora `Animal` upoštevati protokol `Identifiable`.

Namen protokola `Identifiable` je SwiftUI povedati, da ima vsaka žival `id`, po katerem jo je mogoče ločiti od drugih.

## Ustvarjanje podatkov o živalih

Nato v `ContentView` ustvarimo polje živali.

V polju je shranjenih pet vrednosti `Animal`, pri čemer vsaka vrednost `Animal` predstavlja eno žival.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Topli in zmerni oceani po vsem svetu.",
            habitat: "Oceani, obalne vode in nekatere velike reke.",
            animalDescription: "Delfini so inteligentni morski sesalci. Živijo v skupinah, sporazumevajo se z zvoki in so znani po svojem igrivem vedenju."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane in odprti gozdovi v Afriki.",
            habitat: "Travišča, savane in odprti gozdovi.",
            animalDescription: "Žirafe so najvišje kopenske živali. Imajo dolge vratove, dolge noge in se običajno hranijo z listi visokih dreves."
        ),
        // Lev
        Animal(
            name: "Lev",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Najdemo jih predvsem v podsaharski Afriki, z majhno populacijo v zahodni Indiji.",
            habitat: "Travišča, savane in odprta gozdnata območja.",
            animalDescription: "Levi so mogočne velike mačke. Običajno živijo v skupinah, imenovanih tropi, in jih pogosto poznamo kot kralje živalskega sveta."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Gorski gozdovi v osrednji Kitajski.",
            habitat: "Bambusovi gozdovi v hladnih in vlažnih gorskih območjih.",
            animalDescription: "Pande so medvedi, znani po črno-belem kožuhu. Večinoma jedo bambus in so med najbolj prepoznavnimi živalmi na svetu."
        ),
        // Polarni medved
        Animal(
            name: "Polarni medved",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktična območja okoli severnega pola.",
            habitat: "Morski led, obalna območja in hladna arktična okolja.",
            animalDescription: "Polarni medvedi so veliki medvedi, prilagojeni hladnim okoljem. So odlični plavalci in so pri lovu na tjulnje večinoma odvisni od morskega ledu."
        )
    ]

    var body: some View {
        Text("Enciklopedija živali")
    }
}
```

Tukaj je `animals` polje:

```swift
let animals: [Animal]
```

`[Animal]` pomeni, da je v tem polju shranjenih več vrednosti `Animal`.

Z drugimi besedami, `animals` ni ena žival, temveč skupina živali.

## Prikaz seznama živali

Zdaj lahko z `ForEach` prikažemo seznam živali.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
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

Prikazani rezultat:

![view](../../../Resource/029_view1.png)

V tej kodi:

```swift
ForEach(animals) { animal in
    ...
}
```

To pomeni, da prehodimo polje `animals`.

Pri vsakem prehodu `animal` predstavlja žival, ki se trenutno prikazuje.

Na primer, pri prvem prehodu je `animal` delfin, pri drugem prehodu pa žirafa.

Zato lahko informacije o trenutni živali prikažemo na naslednji način:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Tako lahko prikažemo vseh pet živali.

## Omogočanje tapov na seznam živali

Seznam je zdaj prikazan, vendar ga še ni mogoče tapniti.

Če želimo po tapu na določeno žival prikazati podrobnosti, moramo najprej zabeležiti »trenutno izbrano žival«.

Zato v `ContentView` dodamo stanje:

```swift
@State private var selectedAnimal: Animal? = nil
```

Tukaj je `selectedAnimal` izbirna vrednost tipa `Animal?`.

To pomeni, da lahko vsebuje eno žival ali pa nobene živali.

Privzeta vrednost je `nil`, kar pomeni, da na začetku ni izbrana nobena žival.

Nato vsako vrstico z živaljo spremenimo v `Button`:

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
                .cornerRadius(20)
            
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

Ključna je ta vrstica kode:

```swift
selectedAnimal = animal
```

Ko uporabnik tapne določeno žival, to žival shranimo v `selectedAnimal`.

Če uporabnik na primer tapne delfina, bo v `selectedAnimal` shranjen delfin.

Če uporabnik tapne pando, bo v `selectedAnimal` shranjena panda.

Z drugimi besedami, `selectedAnimal` beleži, katero žival je uporabnik trenutno tapnil.

## Pojavni pogled Sheet

Zdaj lahko prek gumba zabeležimo »trenutno tapnjeno žival«.

Nato moramo implementirati pojavni pogled za prikaz podrobnosti živali.

![view](../../../Resource/029_view2.png)

V SwiftUI lahko za takšen pojavni učinek uporabimo `Sheet`.

`Sheet` lahko razumemo kot začasno prikazano stran. Prikaže se nad trenutno stranjo, uporabnik pa jo lahko po ogledu vsebine zapre s potegom navzdol.

## Primer Sheet

Preden zares prikažemo podrobnosti živali, najprej z enostavnim primerom razumemo, kako se `Sheet` prikaže.

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
            Text("Pogled Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Prikazani rezultat:

![view](../../../Resource/029_view3.png)

V tej kodi ustvarimo Boolovo vrednost:

```swift
@State private var showSheet = false
```

`showSheet` je privzeto `false`, kar pomeni, da se `Sheet` na začetku ne prikaže.

Ko tapnemo gumb:

```swift
showSheet.toggle()
```

`toggle()` pomeni preklop Boolove vrednosti.

Če je bila vrednost prej `false`, po klicu `toggle()` postane `true`.

Če je bila vrednost prej `true`, po klicu `toggle()` postane `false`.

Zato se po tapu gumba `showSheet` spremeni iz `false` v `true`.

Ko `showSheet` postane `true`, naslednja koda prikaže `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Pogled Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ta koda pomeni: ko je `showSheet` `true`, se prikaže `Sheet`, v njem pa se prikaže `Text("Pogled Sheet")`.

Prikazani rezultat:

![view](../../../Resource/029_view4.png)

Takšen zapis je primeren za prikaz fiksne vsebine.

Na primer, po tapu gumba lahko prikažemo stran z nastavitvami, stran z navodili ali stran z opozorilom.

### Mesto prikaza Sheet

Čeprav je `Sheet` pojavni pogled, ga v SwiftUI ne zapišemo neposredno kot samostojen pogled, kot sta `Text()` ali `Image()`, ampak ga uporabimo kot modifikator pogleda.

To pomeni, da je `.sheet(...)` podoben modifikatorjem, kot so `.font()`, `.padding()` in `.shadow()`, zato ga moramo dodati za določen pogled.

Na primer:

```swift
Button("Prikaži Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Pogled Sheet")
}
```

V tem primeru je `.sheet` dodan za `Button`.

Ko `showSheet` postane `true`, SwiftUI prikaže `Sheet` in vsebino v zavitih oklepajih:

```swift
Text("Pogled Sheet")
```

V dejanskem razvoju pa običajno ne dodamo `.sheet` vsakemu gumbu, če je na strani več gumbov.

Pogostejši pristop je, da `.sheet` dodamo za zunanji pogled.

Na primer:

```swift
VStack {
    Button("Prikaži Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Pogled Sheet")
}
```

Gumb je odgovoren za spreminjanje `showSheet`, zunanji pogled pa glede na to, ali je `showSheet` `true`, prikaže `Sheet`.

## Sheet, vezan na izbirno vrednost

Prej smo se naučili tega zapisa:

```swift
.sheet(isPresented: $showSheet) {
    Text("Pogled Sheet")
}
```

Ta zapis je primeren za nadzor prikaza in skrivanja fiksne strani.

V primeru enciklopedije živali pa ne potrebujemo samo podatka, »ali naj se `Sheet` prikaže«, temveč tudi podatek, »katera žival je bila tapnjena«.

Na primer:

Če uporabnik tapne delfina, mora `Sheet` prikazati podrobnosti delfina.

Če uporabnik tapne pando, mora `Sheet` prikazati podrobnosti pande.

Zato je tukaj primernejša druga oblika zapisa Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Vsebina, prikazana v Sheet
}
```

V tej kodi je `Sheet` vezan na izbirno vrednost `selectedAnimal`.

Tukaj bodite pozorni: za `item:` zapišemo `$selectedAnimal`, ne `selectedAnimal`.

Razlog je, da `Sheet` vrednosti `selectedAnimal` ne samo bere, temveč mora tudi glede na njene spremembe odločiti, ali naj se prikaže.

To kodo lahko razumemo tako:

- Ko je `selectedAnimal` `nil`, se `Sheet` ne prikaže.
- Ko ima `selectedAnimal` vrednost, se `Sheet` prikaže.
- Ko se `Sheet` zapre, SwiftUI znova spremeni `selectedAnimal` v `nil`.

SwiftUI žival, shranjeno v `selectedAnimal`, posreduje v `animal` znotraj zavitih oklepajev.

Z drugimi besedami, `.sheet(item:)` ne nadzoruje samo prikaza, ampak v `Sheet` posreduje tudi izbrane podatke.

## Uporaba Sheet za prikaz imena živali

Zdaj še ne hitimo z ustvarjanjem zapletenega podrobnega pogleda.

Da bo koda lažje razumljiva, najprej v `Sheet` prikažemo ime trenutne živali.

Zunaj `VStack` dodamo `.sheet(item:)`:

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
                        .cornerRadius(20)
                    
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

Najpomembnejši je ta del kode:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ko ima `selectedAnimal` vrednost, se `Sheet` prikaže.

`animal` v zavitih oklepajih je trenutno izbrana žival.

Zato:

```swift
Text(animal.name)
```

prikaže ime trenutno tapnjene živali.

Na primer, če tapnemo `Delfin`, se v Sheet prikaže `Delfin`.

Če tapnemo `Panda`, se v `Sheet` prikaže `Panda`.

Tako smo dosegli učinek, da se po tapu različnih živali prikažejo različna imena živali.

Prikaz imena živali:

![view](../../../Resource/029_view5.png)

Vendar podrobnosti živali ne bi smele prikazati samo imena, temveč tudi ime, območje razširjenosti, življenjski prostor in opis.

Če vso to kodo zapišemo znotraj `.sheet`, bo koda postala zelo dolga in manj pregledna.

Zato bomo v nadaljevanju ustvarili nov prilagojeni pogled, ki bo posebej odgovoren za prikaz podrobnosti živali.

## Ustvarjanje podrobnega pogleda živali

Nato ustvarimo nov prilagojeni pogled `AnimalDetailView`.

Ta pogled prejme eno vrednost `Animal` in prikaže podrobnosti živali.

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
                    Text("**Območje razširjenosti**: \(animal.distributionArea)")

                    Divider()

                    Text("**Življenjski prostor**: \(animal.habitat)")

                    Divider()

                    Text("**Opis živali**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Prikazani rezultat:

![view](../../../Resource/029_view2.png)

Ključni del je:

```swift
var animal: Animal
```

To pomeni, da mora `AnimalDetailView` od zunaj prejeti eno žival.

Ko prejme žival, lahko podrobni pogled uporabi različne informacije o tej živali:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Z drugimi besedami, `AnimalDetailView` je odgovoren samo za prikaz posredovane živali.

### Krepko besedilo z Markdown

V podrobnem pogledu smo zapisali takšno kodo:

```swift
Text("**Življenjski prostor:** \(animal.habitat)")
```

Tukaj sta dve pomembni točki.

Prvič, `**Življenjski prostor:**` uporablja sintakso `Markdown`. Besedilo, obdano z dvema zvezdicama, se prikaže krepko.

Drugič, `\()` je interpolacija nizov, s katero lahko vrednost spremenljivke prikažemo v besedilu.

Ta koda pomeni, da najprej prikaže krepki napis `Življenjski prostor:`, nato pa življenjski prostor te živali.

## Prikaz podrobnega pogleda v Sheet

Ko ustvarimo `AnimalDetailView`, se lahko vrnemo v `ContentView` in prvotni pogled z imenom v `Sheet` zamenjamo s podrobnim pogledom.

Prej je bilo:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Zdaj spremenimo v:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Tukaj je `animal:` ime parametra pogleda `AnimalDetailView`.

`animal` za njim je trenutna žival, ki jo posreduje `.sheet(item:)`.

To pomeni, da trenutno tapnjeno žival posredujemo v `AnimalDetailView` za prikaz.

Celotna struktura:

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
                        .cornerRadius(20)
                    
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

Ko uporabnik tapne žival:

```swift
selectedAnimal = animal
```

`selectedAnimal` se iz `nil` spremeni v določeno žival. Ko `Sheet` zazna, da ima `selectedAnimal` vrednost, prikaže pogled.

`Sheet` žival iz `selectedAnimal` posreduje pogledu `AnimalDetailView`, `AnimalDetailView` pa prikaže podrobnosti živali.

Tako smo implementirali funkcijo, pri kateri se po tapu živali v seznamu prikažejo ustrezne podrobnosti te živali.

## Razlika med dvema zapisoma Sheet

Zdaj smo z `.sheet(item:)` dokončali prikaz podrobnega pogleda živali.

Tukaj lahko na kratko povzamemo dve pogosti obliki zapisa `Sheet`.

### Prva oblika veže Boolovo vrednost

```swift
@State private var showSheet = false

Button("Prikaži Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Pogled Sheet")
}
```

Ta zapis je primeren za prikaz fiksne vsebine, na primer strani z nastavitvami, strani z navodili ali strani z opozorilom.

`showSheet` je Boolova vrednost in ima samo dve stanji: `true` in `false`.

Ko je `showSheet` `true`, se `Sheet` prikaže.

Ko je `showSheet` `false`, se `Sheet` ne prikaže.

### Druga oblika veže izbirno vrednost

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Ta zapis je primeren za prikaz različne vsebine glede na izbrane podatke.

V tej lekciji tapnemo različne živali in moramo prikazati podrobnosti različnih živali, zato je `.sheet(item:)` primernejši.

## Celotna koda

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Ime živali
    let name: String
    
    // Slika živali
    let imageName: String
    
    // Simbol oznake živali
    let avatarEmoji: String
    
    // Območje razširjenosti
    let distributionArea: String
    
    // Življenjski prostor
    let habitat: String
    
    // Opis živali
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Topli in zmerni oceani po vsem svetu.",
            habitat: "Oceani, obalne vode in nekatere velike reke.",
            animalDescription: "Delfini so inteligentni morski sesalci. Živijo v skupinah, sporazumevajo se z zvoki in so znani po svojem igrivem vedenju."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane in odprti gozdovi v Afriki.",
            habitat: "Travišča, savane in odprti gozdovi.",
            animalDescription: "Žirafe so najvišje kopenske živali. Imajo dolge vratove, dolge noge in se običajno hranijo z listi visokih dreves."
        ),
        // Lev
        Animal(
            name: "Lev",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Najdemo jih predvsem v podsaharski Afriki, z majhno populacijo v zahodni Indiji.",
            habitat: "Travišča, savane in odprta gozdnata območja.",
            animalDescription: "Levi so mogočne velike mačke. Običajno živijo v skupinah, imenovanih tropi, in jih pogosto poznamo kot kralje živalskega sveta."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Gorski gozdovi v osrednji Kitajski.",
            habitat: "Bambusovi gozdovi v hladnih in vlažnih gorskih območjih.",
            animalDescription: "Pande so medvedi, znani po črno-belem kožuhu. Večinoma jedo bambus in so med najbolj prepoznavnimi živalmi na svetu."
        ),
        // Polarni medved
        Animal(
            name: "Polarni medved",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktična območja okoli severnega pola.",
            habitat: "Morski led, obalna območja in hladna arktična okolja.",
            animalDescription: "Polarni medvedi so veliki medvedi, prilagojeni hladnim okoljem. So odlični plavalci in so pri lovu na tjulnje večinoma odvisni od morskega ledu."
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
                            .cornerRadius(20)

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
                    Text("**Območje razširjenosti**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Življenjski prostor**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Opis živali**: \(animal.animalDescription)")
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

## Povzetek

V tej lekciji smo dokončali preprosto stran enciklopedije živali.

Najprej smo s strukturo `Animal` shranili informacije o živalih, nato smo s poljem shranili pet živali, z `ForEach` pa smo prikazali seznam živali.

Ko uporabnik tapne določeno žival, to žival shranimo v `selectedAnimal`:

```swift
selectedAnimal = animal
```

Ko ima `selectedAnimal` vrednost, `.sheet(item:)` prikaže podrobni pogled in izbrano žival posreduje v `AnimalDetailView`.

Najpomembnejše v tej lekciji ni slog vmesnika, temveč razumevanje te poti prenosa podatkov:

```swift
Tap na žival → selectedAnimal shrani žival → Sheet se prikaže → AnimalDetailView prikaže podrobnosti
```

Ko razumete to pot, lahko pozneje ustvarite več podobnih funkcij, na primer podrobnosti izdelka, podrobnosti tečaja, podrobnosti članka ali podrobnosti stika.
