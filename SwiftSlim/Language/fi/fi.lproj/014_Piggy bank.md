# Säästöpossu

Tässä luvussa kehitämme yksinkertaisen "säästöpossu"-projektin. Sen toiminnallisuus on selkeä mutta sisältää kokonaisen vuorovaikutuslogiikan, joten se sopii hyvin aloittelijoille.

Tämän projektin kautta opimme `TextField`-syöttökentän, `border`-reunan sekä datan sidonnan (`$`) perusteet.

Lopullisena tavoitteena on toteuttaa "säästöpossu", johon voidaan syöttää summa, tallentaa se painikkeella ja kasvattaa kokonaismäärää kertyvästi.

Toteutuksen lopputulos:

![Piggy Bank](../../RESOURCE/014_view.png)

## Kokonaissumman näyttäminen

Ensin meidän täytyy näyttää näkymässä säästöpossun kokonaissumma.

Määritellään `ContentView`-näkymässä muuttuja, joka tallentaa säästöpossun kokonaissumman.

```swift
@State private var amount = 0
```

Sen jälkeen näytetään summa `Text`-näkymällä:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Tässä `.font` ja `.fontWeight` määrittävät tekstin koon ja paksuuden.

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

Kun `amount` muuttuu, `Text`-näkymän näyttämä kokonaissumma päivittyy automaattisesti.

## Summan syöttäminen

Säästöpossun ei tarvitse vain näyttää kokonaissummaa, vaan sen pitää myös antaa käyttäjän "syöttää" talletettava rahamäärä. Tätä varten käytämme SwiftUI:n `TextField`-näkymäkomponenttia.

### `TextField`

`TextField` on SwiftUI:n näkymäkomponentti, jota käytetään syötteen kirjoittamiseen. Sitä käytetään yleensä yksiriviseen syöttöön.

`TextField` tarjoaa pääasiassa kaksi sidontamuotoa:

**1. Sidonta merkkijonotyyppiin (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Tämä sopii esimerkiksi nimen, otsikon tai muun tekstisisällön syöttämiseen.

**2. Sidonta numerotyyppiin (`Int`/`Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Tämä sopii esimerkiksi iän, palkan tai rahamäärän syöttämiseen.

`format: .number` tarkoittaa, että syötekenttä jäsentää ja näyttää sisällön numeromuodossa.

#### Tekstipaikkamerkki

`TextField`-komponentin ensimmäinen parametri on paikkamerkki (`Placeholder`), jonka tarkoitus on vihjata käyttäjälle, mitä kenttään kuuluu syöttää:

```swift
TextField("input your name", text: $text)
```

Kun kenttä on tyhjä, siinä näkyy harmaa vihjeteksti.

![textfield](../../RESOURCE/014_textfield.png)

#### Datansidonta

`TextField` ei itse tallenna syötettyä sisältöä pysyvästi, vaan dataa hallitaan sidotun muuttujan kautta.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Käyttäjän syöttämä sisältö tallennetaan suoraan `text`-muuttujaan, ja `TextField` huolehtii vain syöttöliittymästä.

`$` tarkoittaa sidontaa (`Binding`):

```swift
$text
```

Tämä ei ole tavallinen muuttuja, vaan `Binding`-tyyppinen arvo.

Sen tehtävä on rakentaa yhteys näkymän ja datan välille:

Kun käyttäjä syöttää sisältöä `TextField`-kenttään, `text` päivittyy automaattisesti. Kun taas `text` muuttuu, myös `TextField` päivittyy vastaavasti.

Esimerkiksi:

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

Kun kirjoitat `TextField`-kenttään, yläpuolella oleva `Text` näyttää sisällön reaaliajassa.

![textField](../../RESOURCE/014_textfield1.png)

### Sidonta numerotyyppiin

Kun halutaan syöttää numero, täytyy sitoa oikean tyyppinen muuttuja:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Kun käyttäjä syöttää summan, `TextField` jäsentää syötteen numeroksi ja päivittää automaattisesti `number`-arvon.

## Syötekentän lisääminen

Nyt kun `TextField`-komponentin peruskäyttö on tuttu, käytämme sitä säästöpossu-projektissa.

Koska säästöpossussa täytyy syöttää rahamäärä, käytämme "sidonta numerotyyppiin (`Int`/`Double`)" -tapaa ja lisäämme uuden `number`-muuttujan käyttäjän syöttämälle summalle:

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

Nyt `TextField` näyttää oletuksena `number`-muuttujan arvon, joka on aluksi `0`.

Kun syöte tyhjennetään, kenttä näyttää paikkamerkin `"Amount"`.

Tämä osoittaa jälleen, että `TextField` näyttää sidotun muuttujan arvoa eikä tallenna sisältöä itse.

### Syötekentän kokoon liittyvä ongelma

Nykyisessä näkymässä huomaat, että `TextField`-kentällä ei ole reunaa, siinä näkyy vain `0`, ja sisältö näyttää olevan vasemmalle tasattu.

Tulos näyttää tältä:

![textfield](../../RESOURCE/014_textfield2.png)

Tämä johtuu siitä, että `TextField` vie oletuksena koko emonäkymän leveyden.

Voimme varmistaa tämän lisäämällä sille taustavärin:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Tulos näyttää tältä:

![textfield](../../RESOURCE/014_textfield3.png)

Nyt näemme, että `TextField` todella täyttää koko rivin leveyden.

### Kiinteän leveyden asettaminen

Jos haluamme syötekentästä kompaktimman, voimme rajoittaa sen leveyttä `frame`-muokkaimella:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Tulos:

![textfield](../../RESOURCE/014_textfield4.png)

### Reunan ja sisäisen marginaalin lisääminen

Koska `TextField`-kentällä ei oletuksena ole reunaa, voimme lisätä tyylin itse:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Nyt syötekenttä näyttää enemmän "tavalliselta syöttökentältä".

![textfield](../../RESOURCE/014_textfield5.png)

## Reunus

SwiftUI:ssa `border`-muokkainta käytetään lisäämään näkymälle reunus.

Peruskäyttö:

```swift
border(Color.black, width: 1)
```

Tässä `Color.black` tarkoittaa reunuksen väriä ja `width` sen paksuutta.

`TextField`-kentässä käytämme:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Tämä tarkoittaa, että syötekentälle lisätään musta reunus, jonka leveys on `1 pt`.

Voit kokeilla myös muita värejä, kuten `Color.blue`, `Color.green`, tai paksumpaa reunaa `width: 2`.

## Talletuspainike

Nyt meillä on `amount`-muuttuja kokonaissumman näyttämiseen, `TextField` syötteen vastaanottamiseen sekä siihen sidottu `number`-muuttuja.

Nykyinen koodi näyttää tältä:

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

### Painikkeen lisääminen

Seuraavaksi lisäämme painikkeen, joka käynnistää talletustoiminnon.

```swift
Button("Save") {
    
}
```

### Talletuslogiikan toteuttaminen

Tavoitteena on, että käyttäjä syöttää summan, painaa painiketta, ja summa lisätään automaattisesti kokonaissummaan.

```swift
Button("Save") {
    amount += number
}
```

Tässä käytetään yhdistettyä sijoitusoperaattoria, jolla käyttäjän syöttämä `number` lisätään kokonaissummaan `amount`.

### Syötetyn summan nollaaminen

Tässä vaiheessa on kuitenkin yksi ongelma: kun painiketta painetaan, syötekentän arvo ei tyhjene.

Jos käyttäjä syöttää `10` ja painaa tallennusta, syötekenttään jää edelleen `10`, mikä vaikuttaa seuraavaan syöttökertaan.

Tämä johtuu siitä, että `TextField` on sidottu `number`-muuttujaan. Painiketta painettaessa muokkaamme vain `amount`-arvoa, mutta `number` ei muutu, joten kenttä näyttää vanhan arvon.

Tarvitsemme siis tyhjennyslogiikan: kun painiketta painetaan, summa lisätään ensin kokonaissummaan ja sitten syötetty arvo nollataan:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Nyt kun käyttäjä syöttää summan ja painaa painiketta, summa lisätään kokonaissummaan. `number` palautetaan arvoon `0`, jotta seuraava syöttö on helpompi tehdä.

Näin olemme toteuttaneet säästöpossun koko talletuslogiikan.

## Näkymän viimeistely

Kun toiminnallisuus on valmis, voimme vielä viimeistellä käyttöliittymää lisäämällä taustakuvan ja painiketyylin.

Painiketyylin lisääminen:

```swift
.buttonStyle(.borderedProminent)
```

Taustakuvan lisääminen:

```swift
.background {
    Image("1")
}
```

Nyt olemme saaneet koko säästöpossu-projektin valmiiksi.

## Täydellinen koodi

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

Toteutuksen lopputulos:

![Piggy Bank](../../RESOURCE/014_view.png)

Nyt voimme kokeilla tallettaa `100` tai enemmän ja tarkistaa, onko säästöpossun logiikassa ongelmia.

Voit myös ajaa säästöpossun simulaattorissa tai oikealla laitteella ja kokeilla itse kehittämäämme sovellusta.

### Virheenkorjauksen tulosteet

Voimme myös lisätä painikkeeseen debug-tulostusta, jotta voidaan varmistaa, että logiikka toimii oikein:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Joka kerta kun rahaa talletetaan ja painiketta painetaan, voimme nähdä vastaavan debug-tulosteen ja tarkistaa, onko logiikassa ongelmia.

```
---Saving---
amount:11
number:0
```
