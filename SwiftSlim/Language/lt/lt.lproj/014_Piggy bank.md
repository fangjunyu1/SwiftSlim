# Taupyklė

Šioje pamokoje kursime paprastą „taupyklės“ projektą. Jo funkcija paprasta, tačiau jame yra visa sąveikos logika, todėl jis puikiai tinka pradedantiesiems.

Per šį projektą mokysimės `TextField` (įvesties laukelio) ir `border` rėmelio, taip pat susipažinsime su duomenų susiejimu (`$`).

Galutinis tikslas - sukurti „taupyklės“ projektą, kuriame būtų galima įvesti sumą, paspausti mygtuką, ją išsaugoti ir sukaupti bendrą sumą.

Galutinis rezultatas:

![Piggy Bank](../../RESOURCE/014_view.png)

## Bendros sumos rodymas

Pirmiausia turime vaizde parodyti bendrą „taupyklės“ sumą.

`ContentView` viduje deklaruojame kintamąjį, kuris saugos bendrą „taupyklės“ sumą.

```swift
@State private var amount = 0
```

Tada naudodami `Text` rodome šią sumą:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Čia naudojame `.font` ir `.fontWeight`, kad nustatytume šrifto dydį ir storį.

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

Kai `amount` pasikeičia, `Text` rodoma suma taip pat automatiškai atsinaujina.

## Sumos įvedimas

„Taupyklė“ turi ne tik rodyti bendrą sumą, bet ir leisti naudotojui įvesti sumą, kurią jis įneša arba išima. Tam reikia SwiftUI valdiklio `TextField`.

### `TextField`

`TextField` yra SwiftUI valdiklis, skirtas įvesti turinį, paprastai vienoje eilutėje.

`TextField` daugiausia pateikia du susiejimo formatus:

**1. Susiejimas su eilutės tipu (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Tinka vardams, antraštėms ir kitam tekstiniam turiniui.

**2. Susiejimas su skaičių tipu (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Tinka amžiui, atlyginimui, pinigų sumai ir kitam skaitiniam turiniui.

`format: .number` reiškia, kad šis įvesties laukas reikšmę interpretuos ir rodys skaitiniu formatu.

#### Teksto vietažymis

Pirmasis `TextField` parametras yra vietažymis (`Placeholder`), kuris naudotojui nurodo, ką reikia įvesti:

```swift
TextField("input your name", text: $text)
```

Kai įvesties laukas tuščias, rodoma pilka pagalbinė užuomina.

![textfield](../../RESOURCE/014_textfield.png)

#### Duomenų susiejimas

`TextField` pats neatsako už įvesto turinio saugojimą; duomenys valdomi per susietą kintamąjį.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Naudotojo įvestas turinys bus tiesiogiai saugomas kintamajame `text`, o `TextField` atsakingas tik už įvesties sąsają.

`$` reiškia susiejimą (`Binding`):

```swift
$text
```

Tai ne paprastas kintamasis, o `Binding` tipo reikšmė.

Jo paskirtis - sukurti ryšį tarp vaizdo ir duomenų:

Kai naudotojas `TextField` laukelyje ką nors įveda, `text` automatiškai atsinaujina; kai `text` pasikeičia, `TextField` taip pat sinchroniškai atsinaujina.

Pavyzdžiui:

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

Įrašius turinį į `TextField`, viršuje esantis `Text` realiu laiku jį parodys.

![textField](../../RESOURCE/014_textfield1.png)

### Susiejimas su skaitiniu tipu

Kai reikia įvesti skaičių, reikia susieti atitinkamo tipo kintamąjį:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Kai naudotojas įveda sumą, `TextField` išanalizuoja įvestą turinį ir automatiškai atnaujina `number` reikšmę.

## Įvesties lauko pridėjimas

Susipažinę su pagrindiniu `TextField` naudojimu, pritaikykime jį „taupyklės“ projekte.

„Taupyklėje“ reikia įvesti „sumą“, todėl naudosime „susiejimą su skaitiniu tipu (`Int/Double`)“ ir pridėsime naują kintamąjį `number`, kuris saugos naudotojo įvestą sumą:

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

Dabar `TextField` numatytai rodo `number` reikšmę (`0`).

Kai įvesties laukas išvalomas, rodoma vietažymė „Amount“.

Tai dar kartą parodo, kad `TextField` rodo susieto kintamojo reikšmę, o ne pats saugo turinį.

### Įvesties lauko dydžio problema

Dabartiniame vaizde pastebėsime, kad `TextField` neturi rėmelio, rodo tik `0`, o turinys atrodo lygiuotas kairėje.

Rezultatas atrodo taip:

![textfield](../../RESOURCE/014_textfield2.png)

Taip yra todėl, kad `TextField` numatytai užima visą tėvinio vaizdo plotį.

Galime tai patikrinti pridėję fono spalvą:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Rezultatas:

![textfield](../../RESOURCE/014_textfield3.png)

Matyti, kad `TextField` iš tiesų užpildo visą eilutę.

### Fiksuoto pločio nustatymas

Jei norime kompaktiškesnio įvesties lauko, galime apriboti jo plotį su `frame`:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Rezultatas:

![textfield](../../RESOURCE/014_textfield4.png)

### Rėmelio ir vidinių tarpų pridėjimas

Kadangi `TextField` numatytai neturi rėmelio, stilių galime pridėti rankiniu būdu:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Dabar šis įvesties laukas atrodo labiau kaip „standartinis įvesties laukelis“.

![textfield](../../RESOURCE/014_textfield5.png)

## Rėmelis

SwiftUI sistemoje `border` naudojamas vaizdui pridėti rėmelį.

Pagrindinis naudojimas:

```swift
border(Color.black, width: 1)
```

Čia `Color.black` reiškia rėmelio spalvą, o `width` - jo storį.

`TextField` atveju naudojame:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Tai reiškia, kad įvesties laukui pridedamas juodas, `1 pt` pločio rėmelis.

Galima išbandyti ir kitas spalvas, pavyzdžiui, `Color.blue`, `Color.green`, arba pastorinti rėmelį iki `width: 2`.

## Taupymo mygtukas

Dabar jau turime `amount` kintamąjį, rodantį bendrą sumą, `TextField`, skirtą įvedimui, ir su juo susietą `number` kintamąjį.

Dabartinis kodas:

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

### Mygtuko pridėjimas

Toliau turime pridėti mygtuką, kuris paleis taupymo veiksmą.

```swift
Button("Save") {
    
}
```

### Taupymo logikos įgyvendinimas

Norime pasiekti, kad naudotojas įvestų sumą, paspaustų mygtuką, ir ši suma būtų pridėta prie bendros sumos.


```swift
Button("Save") {
    amount += number
}
```

Čia naudojame sudėtinį priskyrimo operatorių, kuris naudotojo įvestą sumą `number` prideda prie bendros sumos `amount`.

### Įvestos sumos išvalymas

Dabar atsiranda problema: kiekvieną kartą paspaudus mygtuką įvesties lauko suma neišsivalo.

Jei naudotojas įveda `10` ir paspaudžia išsaugoti, įvesties laukelyje vis tiek lieka `10`, o tai trukdo kitam įvedimui.

Taip yra todėl, kad `TextField` susietas su `number`. Paspaudę mygtuką mes pakeičiame tik `amount`, o `number` nesikeičia, todėl įvesties laukas toliau rodo seną reikšmę.

Todėl reikia pridėti išvalymo logiką: po to, kai suma pridedama prie bendros sumos, įvesties reikšmė turi būti grąžinta į pradinę būseną:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Dabar, kai naudotojas įveda sumą ir paspaudžia mygtuką, suma bus pridėta prie bendros sumos, o `number` bus nustatytas į `0`, kad būtų pasiruošta kitam įvedimui.

Taip įgyvendinome visą „taupyklės“ taupymo logiką.

## Vaizdo patobulinimas

Kai funkcionalumas jau veikia, galime paprastai pagerinti sąsają, pridėdami fono paveikslą ir mygtuko stilių.

Pridėkime mygtuko stilių:

```swift
.buttonStyle(.borderedProminent)
```

Pridėkime foninį paveikslą:

```swift
.background {
    Image("1")
}
```

Dabar baigėme kurti visą „taupyklės“ projektą.

## Pilnas kodas

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

Galutinis rezultatas:

![Piggy Bank](../../RESOURCE/014_view.png)

Dabar galime pabandyti įdėti `100` ar dar daugiau pinigų ir patikrinti, ar „taupyklės“ logikoje nėra problemų.

Taip pat galima paleisti „taupyklę“ simuliatoriuje arba tikrame įrenginyje ir išbandyti mūsų sukurtą programėlę.

### Derinimo išvestis

Kad patikrintume, ar logika tikrai teisinga, į mygtuką taip pat galime įdėti derinimo išvestį ir patikrinti, ar įvesta suma apdorojama teisingai:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Kiekvieną kartą įdėję pinigų ir paspaudę mygtuką galėsime matyti atitinkamą derinimo išvestį ir patikrinti, ar logikoje nėra problemų.

```
---Saving---
amount:11
number:0
```
