# Hranilnik

V tej lekciji bomo razvili preprost projekt »hranilnik«. Funkcionalnost je preprosta, vendar vsebuje popolno interaktivno logiko, zato je zelo primeren za začetnike.

S tem projektom bomo spoznali TextField（vnosno polje）in border（obrobo）, hkrati pa razumeli tudi vezavo podatkov（$）。

Končni cilj je izdelati projekt »hranilnik«, v katerem lahko vnesemo znesek, kliknemo gumb za shranjevanje in sproti seštejemo skupni znesek.

Končni videz:

![Piggy Bank](../../RESOURCE/014_view.png)

## Prikaz skupnega zneska

Najprej moramo v pogledu prikazati skupni znesek v »hranilniku«。

V ContentView deklariramo spremenljivko za shranjevanje skupnega zneska v »hranilniku«。

```swift
@State private var amount = 0
````

Nato uporabimo Text za prikaz tega zneska:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Tukaj uporabimo .font in .fontWeight za nastavitev velikosti in debeline pisave.

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

Ko se amount spremeni, se samodejno osveži tudi skupni znesek, prikazan v Text.

## Vnos zneska

»Hranilnik« ne potrebuje le prikaza skupnega zneska, ampak mora uporabniku omogočiti tudi »vnos« zneska za shranjevanje. Za to moramo uporabiti kontrolnik SwiftUI TextField。

### TextField

TextField je kontrolnik pogleda v SwiftUI, ki se uporablja za vnos vsebine, običajno za enovrstični vnos.

TextField ponuja predvsem dva načina vezave:

**1. Vezava na nizovni tip（String）**

```swift
TextField("Placeholder", text: $text)
```

Primeren je za vnos imen, naslovov in druge besedilne vsebine.

**2. Vezava na številski tip（Int/Double）**

```swift
TextField("Amount", value: $number, format: .number)
```

Primeren je za starost, plačo, znesek in druge številčne vnose.

format: .number pomeni, da bo to vnosno polje vsebino razčlenilo in prikazalo v »številski obliki«。

#### Besedilo na mestu vnosa

Prvi parameter TextField je besedilo na mestu vnosa（Placeholder）, ki uporabniku nakaže, kaj naj vnese:

```swift
TextField("input your name", text: $text)
```

Ko je vnosno polje prazno, se prikaže sivo pomožno besedilo.

![textfield](../../RESOURCE/014_textfield.png)

#### Vezava podatkov

TextField sam ne skrbi za trajno shranjevanje vnesene vsebine, zato moramo podatke upravljati s pomočjo vezane spremenljivke.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Vsebina, ki jo vnese uporabnik, se neposredno shrani v spremenljivko text, TextField pa skrbi samo za prikaz in vnos.

$ pomeni vezavo（Binding）：

```swift
$text
```

To ni navadna spremenljivka, ampak tip Binding。

Njegova naloga je vzpostaviti povezavo med pogledom in podatki:

ko uporabnik vnaša vsebino v TextField, se text samodejno posodablja；ko se text spremeni, se tudi TextField samodejno uskladi.

Na primer:

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

Ko v TextField nekaj vpišemo, bo zgornji Text vsebino sproti prikazoval v realnem času.

![textField](../../RESOURCE/014_textfield1.png)

### Vezava številskega tipa

Ko moramo vnesti številko, moramo vezati spremenljivko ustreznega tipa:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Ko uporabnik vnese znesek, bo TextField vneseno vsebino razčlenil kot število in samodejno posodobil vrednost number。

## Dodajanje vnosnega polja

Ko razumemo osnovno uporabo TextField, ga lahko uporabimo v projektu »hranilnik«。

»Hranilnik« mora omogočati vnos »zneska«, zato uporabimo način »vezava na številski tip（Int/Double）«, hkrati pa dodamo novo spremenljivko number za shranjevanje uporabnikovega vnosa:

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

Zdaj TextField privzeto prikazuje vrednost number（privzeto je 0）。

Ko izbrišemo vnos, se prikaže nadomestno besedilo »Amount«。

To ponovno potrjuje, da TextField prikazuje vrednost vezane spremenljivke in ne hrani vsebine sam.

### Težava z velikostjo vnosnega polja

V trenutnem pogledu bomo opazili, da TextField nima obrobe, prikazuje samo 0, vsebina pa je videti poravnana levo.

Učinek je takšen:

![textfield](../../RESOURCE/014_textfield2.png)

Razlog je v tem, da TextField privzeto zavzame celotno širino nadrejenega pogleda.

To lahko preverimo tako, da dodamo barvo ozadja:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Učinek je naslednji:

![textfield](../../RESOURCE/014_textfield3.png)

Vidimo lahko, da TextField dejansko zapolni celotno širino vrstice.

### Nastavitev fiksne širine

Če želimo, da je vnosno polje bolj kompaktno, lahko omejimo njegovo širino z uporabo frame：

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Učinek je naslednji:

![textfield](../../RESOURCE/014_textfield4.png)

### Dodajanje obrobe in notranjega odmika

Ker TextField privzeto nima obrobe, lahko videz dodamo ročno:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Zdaj je to vnosno polje videti bolj kot »standardno vnosno polje«。

![textfield](../../RESOURCE/014_textfield5.png)

## Obroba

V SwiftUI se border uporablja za dodajanje obrobe pogledu.

Osnovna uporaba:

```swift
border(Color.black, width: 1)
```

Tukaj Color.black pomeni barvo obrobe, width pa debelino obrobe.

V TextField uporabljamo:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

To pomeni, da vnosnemu polju dodamo črno obrobo širine 1 pt。

Poskusimo lahko tudi druge barve, na primer Color.blue, Color.green, ali debelejšo obrobo width: 2。

## Gumb za shranjevanje

Zdaj imamo spremenljivko amount za prikaz skupnega zneska, TextField za vnos zneska in spremenljivko number, ki je vezana na vnosno polje.

Trenutna koda je naslednja:

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

### Dodajanje gumba

Zdaj moramo dodati gumb, ki bo sprožil dejanje shranjevanja denarja.

```swift
Button("Save") {
    
}
```

### Izvedba logike shranjevanja

Želimo doseči, da uporabnik vnese znesek, klikne gumb, vneseni znesek pa se samodejno prišteje k skupnemu znesku。

```swift
Button("Save") {
    amount += number
}
```

Tukaj uporabljamo »sestavljeni operator prirejanja«, s katerim uporabnikov vneseni znesek number prištejemo k skupnemu znesku amount。

### Ponastavitev vnesenega zneska

Zdaj se pojavi težava: ko kliknemo gumb, se znesek v vnosnem polju ne izbriše.

Če uporabnik vnese 10 in klikne shranjevanje, vnosno polje še vedno prikazuje 10, kar vpliva na naslednji vnos.

To je zato, ker je TextField vezan na number。Ko kliknemo gumb, spremenimo samo amount, number pa ostane nespremenjen, zato vnosno polje še vedno prikazuje staro vrednost.

Dodati moramo logiko za brisanje. Ko uporabnik klikne gumb, moramo najprej prišteti znesek, nato pa vneseni znesek ponastaviti:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Zdaj bo ob vnosu zneska in kliku gumba vneseni znesek prištet k skupnemu znesku, number pa bo ponastavljen na 0, da bo uporabnik lahko vnesel nov znesek.

S tem smo uresničili celotno logiko shranjevanja v »hranilniku«。

## Izboljšanje pogleda

Ko funkcionalnost deluje, lahko vmesnik še nekoliko izboljšamo z dodajanjem slike za ozadje in sloga gumba.

Dodajanje sloga gumba:

```swift
.buttonStyle(.borderedProminent)
```

Dodajanje slike ozadja:

```swift
.background {
    Image("1")
}
```

Zdaj smo dokončali celoten razvoj »hranilnika«。

## Celotna koda

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

Končni videz:

![Piggy Bank](../../RESOURCE/014_view.png)

Zdaj lahko poskusimo shraniti 100 ali več denarja in preverimo, ali je v logiki »hranilnika« kakšna težava.

Lahko pa »hranilnik« zaženemo tudi v simulatorju ali na fizični napravi, da izkusimo aplikacijo, ki smo jo sami razvili。

### Razhroščevalni izpis

Da preverimo pravilnost logike, lahko v gumb dodamo tudi razhroščevalno logiko in tako preverimo, ali je vneseni znesek pravilen:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Vsakič, ko shranimo denar in kliknemo gumb, bomo videli ustrezen razhroščevalni izpis in lahko preverili, ali je v kodi kakšna logična napaka。

```id="debug-save-output"
---Saving---
amount:11
number:0
```