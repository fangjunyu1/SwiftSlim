# Kasica-prasica

U ovoj ćemo lekciji razviti jednostavan projekt “kasice-prasice”. Funkcionalnost je jednostavna, ali sadrži potpunu logiku interakcije i vrlo je prikladna za početnike.

Kroz ovaj projekt učit ćemo `TextField` (polje za unos) i `border`, a također ćemo razumjeti povezivanje podataka (`$`).

Konačni cilj je ostvariti projekt “kasice-prasice” u kojem možemo unijeti iznos, kliknuti gumb za spremanje i postupno zbrajati ukupan iznos.

Izgled rezultata:

![Piggy Bank](../../RESOURCE/014_view.png)

## Prikaz ukupnog iznosa

Najprije trebamo u prikazu pokazati ukupan iznos “kasice-prasice”.

U `ContentView` deklariramo varijablu za spremanje ukupnog iznosa.

```swift
@State private var amount = 0
```

Zatim pomoću `Text` prikažemo taj iznos:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Ovdje koristimo `.font` i `.fontWeight` za postavljanje veličine i debljine fonta.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
```

Kada se `amount` promijeni, ukupni iznos prikazan u `Text` također će se automatski osvježiti.

## Unos iznosa

Osim prikaza ukupnog iznosa, “kasica-prasica” mora omogućiti korisniku i “unos” iznosa za uplatu ili isplatu, a za to je potreban SwiftUI kontrolni prikaz `TextField`.

### `TextField`

`TextField` je kontrolni prikaz u SwiftUI-ju koji se koristi za unos sadržaja i obično služi za jednolinijski unos.

`TextField` uglavnom podržava dva oblika vezivanja:

**1. Vezivanje tipa string (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Prikladno za unos imena, naslova i drugih tekstualnih sadržaja.

**2. Vezivanje numeričkog tipa (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Prikladno za dob, plaću, iznos i druge brojčane unose.

`format: .number` znači da će se ovo polje za unos analizirati i prikazivati u “brojčanom formatu”.

#### Tekstualni placeholder

Prvi parametar `TextField`-a je placeholder, koji korisniku daje naznaku što treba unijeti:

```swift
TextField("input your name", text: $text)
```

Kada je polje za unos prazno, prikazat će se siva pomoćna poruka.

![textfield](../../RESOURCE/014_textfield.png)

#### Povezivanje podataka

`TextField` nije odgovoran za trajno spremanje unesenog sadržaja; podacima se mora upravljati preko povezane varijable.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Sadržaj koji korisnik unese izravno će se spremati u varijablu `text`, dok je `TextField` odgovoran samo za sučelje unosa.

`$` označava vezivanje (`Binding`):

```swift
$text
```

To nije obična varijabla, nego tip `Binding`.

Njegova je uloga uspostaviti vezu između prikaza i podataka:

Kada korisnik unese sadržaj u `TextField`, `text` će se automatski ažurirati; kada se `text` promijeni, `TextField` će se također sinkronizirano ažurirati.

Na primjer:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("text:\(text)")
            TextField("input your name", text: $text)
                .frame(width: 150)
        }
    }
}
```

Kada unosite sadržaj u `TextField`, gornji `Text` prikazivat će ga u stvarnom vremenu.

![textField](../../RESOURCE/014_textfield1.png)

### Vezivanje brojčanog tipa

Kada trebamo unijeti broj, moramo vezati odgovarajući tip varijable:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Kada korisnik unese iznos, `TextField` će analizirati uneseni sadržaj i automatski ažurirati vrijednost `number`.

## Dodavanje polja za unos

Nakon što smo razumjeli osnovnu upotrebu `TextField`, primijenit ćemo ga u projektu “kasice-prasice”.

Budući da “kasica-prasica” treba unos “iznosa”, koristit ćemo način “vezivanja brojčanog tipa (`Int/Double`)" i dodati novu varijablu `number` za spremanje korisničkog unosa:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
        }
    }
}
```

Sada `TextField` prema zadanim postavkama prikazuje vrijednost `number` (koja je prema zadanim postavkama `0`).

Kada se uneseni sadržaj izbriše, prikazat će se placeholder `"Amount"`.

To ponovno pokazuje da `TextField` prikazuje vrijednost povezane varijable, a ne da samostalno sprema sadržaj.

### Problem veličine polja za unos

U trenutačnom prikazu primijetit ćemo da `TextField` nema obrub, prikazuje samo jednu `0`, a sadržaj izgleda poravnat ulijevo.

Efekt izgleda ovako:

![textfield](../../RESOURCE/014_textfield2.png)

To je zato što `TextField` prema zadanim postavkama zauzima cijelu širinu roditeljskog prikaza.

To možemo provjeriti dodavanjem boje pozadine:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Efekt izgleda ovako:

![textfield](../../RESOURCE/014_textfield3.png)

Možemo vidjeti da `TextField` zapravo ispunjava cijelu širinu retka.

### Postavljanje fiksne širine

Ako želimo da polje za unos bude kompaktnije, možemo koristiti `frame` za ograničavanje širine:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

Efekt izgleda ovako:

![textfield](../../RESOURCE/014_textfield4.png)

### Dodavanje obruba i unutarnjeg razmaka

Budući da `TextField` prema zadanim postavkama nema obrub, možemo ručno dodati stil:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Sada ovo polje za unos mnogo više izgleda kao “standardno polje za unos”.

![textfield](../../RESOURCE/014_textfield5.png)

## Obrub

U SwiftUI-ju se `border` koristi za dodavanje obruba prikazu.

Osnovna upotreba:

```swift
border(Color.black, width: 1)
```

Ovdje `Color.black` označava boju obruba, a `width` označava njegovu debljinu.

U `TextField` koristimo:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

To znači da polju za unos dodajemo crni obrub širine `1 pt`.

Možete isprobati i druge boje, poput `Color.blue`、`Color.green`, ili povećati debljinu obruba na `width:2`.

## Gumb za spremanje novca

Sada imamo varijablu `amount` za prikaz ukupnog iznosa, `TextField` za unos iznosa i varijablu `number` povezanu s poljem za unos.

Trenutačni kod izgleda ovako:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
        }
    }
}
```

### Dodavanje gumba

Zatim trebamo dodati jedan gumb koji će pokrenuti radnju spremanja novca.

```swift
Button("Save") {
    
}
```

### Implementacija logike spremanja novca

Želimo da korisnik unese iznos, klikne gumb i da se iznos automatski pribroji ukupnom iznosu.

```swift
Button("Save") {
    amount += number
}
```

Ovdje koristimo “složeni operator pridruživanja” kako bismo korisnikov uneseni iznos `number` pribrojili ukupnom iznosu `amount`.

### Resetiranje unesenog iznosa

Sada postoji jedan problem: svaki put kada kliknemo gumb, iznos u polju za unos neće se očistiti.

Ako korisnik unese `10` i klikne spremanje, u polju za unos i dalje ostaje `10`, što će utjecati na sljedeći unos.

To je zato što je `TextField` povezan s `number`. Kada kliknemo gumb, mijenjamo samo `amount`, dok se `number` ne mijenja, pa polje za unos i dalje prikazuje staru vrijednost.

Trebamo dodati logiku brisanja: nakon klika na gumb najprije pribrojimo uneseni iznos, a zatim resetiramo uneseni iznos:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

Sada, kada korisnik unese iznos i klikne gumb, uneseni iznos zbraja se s ukupnim iznosom. `number` se resetira na `0`, kako bi korisnik mogao unijeti novi iznos.

Na taj smo način ostvarili svu logiku spremanja novca u “kasici-prasici”.

## Optimizacija prikaza

Nakon što je funkcionalnost dovršena, možemo jednostavno optimizirati sučelje dodavanjem pozadinske slike i stila gumba.

Dodavanje stila gumba:

```swift
.buttonStyle(.borderedProminent)
```

Dodavanje pozadinske slike:

```swift
.background {
    Image("1")
}
```

Sada smo dovršili cijeli razvoj “kasice-prasice”.

## Potpuni kod

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Efekt prikaza:

![Piggy Bank](../../RESOURCE/014_view.png)

Sada možemo pokušati spremiti `100` ili više novca kako bismo provjerili postoji li problem u logici “kasice-prasice”.

Također možemo pokrenuti “kasicu-prasicu” u simulatoru ili na fizičkom uređaju kako bismo isprobali aplikaciju koju smo razvili.

### Ispis za debug

Kako bismo provjerili je li logika ispravna, možemo dodati i debug logiku unutar gumba kako bismo provjerili je li uneseni iznos ispravan:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Svaki put kada spremimo novac i kliknemo gumb, možemo vidjeti odgovarajući debug izlaz i provjeriti postoji li problem u logici koda.

```
---Saving---
amount:11
number:0
```
