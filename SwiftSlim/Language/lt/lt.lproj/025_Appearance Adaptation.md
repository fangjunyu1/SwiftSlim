# Išvaizdos pritaikymas

Šioje pamokoje mokysimės pritaikyti sąsają šviesiajam ir tamsiajam režimams.

iPhone, iPad ir Mac įrenginiuose naudotojai gali pasirinkti šviesųjį arba tamsųjį režimą.

Kai sistema persijungia į tamsųjį režimą, daugelio programų fonas, tekstas ir piktogramų spalvos taip pat atitinkamai pasikeičia.

Pavyzdžiui, dieną sąsaja gali naudoti šviesų foną, o naktį persijungti į tamsų foną.

![view](../../../Resource/025_view9.png)

Ši galimybė automatiškai koreguoti sąsajos rodymą pagal sistemos išvaizdą vadinama išvaizdos pritaikymu.

## Išvaizdos pritaikymo peržiūra Xcode

Prieš mokydamiesi išvaizdos pritaikymo, pirmiausia pažiūrėkime, kaip Xcode peržiūrėti šviesųjį ir tamsųjį režimus.

`Canvas` srities apačioje spustelėkite mygtuką `Device Settings`, kad atidarytumėte `Canvas Device Settings` iškylantįjį langą.

![canvas](../../../Resource/025_view.png)

Iškylančiajame lange galite matyti nustatymą `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Tai reiškia:

- `Light Appearance` reiškia šviesųjį režimą.
- `Dark Appearance` reiškia tamsųjį režimą.

Čia galime perjungti peržiūros išvaizdą ir patikrinti, kaip dabartinė sąsaja atrodo šviesiajame ir tamsiajame režimuose.

## Dviejų išvaizdų rodymas greta

Jei norite vienu metu matyti šviesųjį ir tamsųjį režimus, galite naudoti funkciją `Variants`.

`Canvas` srities apačioje spustelėkite mygtuką `Variants` ir pasirinkite `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Pasirinkus šią parinktį, `Canvas` vienu metu parodys šviesiojo ir tamsiojo režimų peržiūras.

![canvas3](../../../Resource/025_view3.png)

Taip lengviau palyginti sąsajos skirtumus tarp dviejų išvaizdų.

Paprastai tariant:

Jei norite tik laikinai perjungti šviesųjį arba tamsųjį režimą, galite naudoti `Canvas Device Settings`.

Jei norite vienu metu matyti abi išvaizdas, galite naudoti `Color Scheme Variants`.

## Rodiniai pagal numatymą prisitaiko prie išvaizdos

SwiftUI sistemoje daugelis sistemos rodinių pagal numatymą automatiškai prisitaiko prie šviesiojo ir tamsiojo režimų.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Šviesus")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("tekstas tekstas tekstas")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Rodymo rezultatas:

![canvas](../../../Resource/025_view4.png)

Kaip matyti, šviesiajame režime piktogramos ir antraštės paprastai rodomos tamsiai.

Tamsiajame režime piktogramos ir antraštės automatiškai tampa šviesios.

Taip yra todėl, kad tokie SwiftUI rodiniai kaip `Text` ir `Image` pagal numatymą koreguoja spalvas pagal sistemos išvaizdą.

Kitaip tariant, jei rankiniu būdu nenurodome fiksuotos spalvos, SwiftUI už mus atliks dalį išvaizdos pritaikymo.

## Fiksuotos spalvos automatiškai nesikeičia

Svarbu atkreipti dėmesį, kad jei rankiniu būdu nurodome fiksuotą spalvą, ji automatiškai nesikeis tarp šviesiojo ir tamsiojo režimų.

Pavyzdžiui:

```swift
Text("tekstas tekstas tekstas")
	.foregroundStyle(Color.gray)
```

Čia tekstui nurodyta `Color.gray`, todėl jis visada bus rodomas pilkai.

Kitas pavyzdys:

```swift
Text("Antraštė")
    .foregroundStyle(Color.white)
```

Šis kodas tiek šviesiajame, tiek tamsiajame režime rodys baltą tekstą.

Jei fonas taip pat šviesus, baltą tekstą gali būti sunku perskaityti.

Todėl pritaikant sąsają skirtingoms išvaizdoms, reikėtų vengti atsitiktinai įrašyti fiksuotas spalvas, tokias kaip `Color.white` ir `Color.black`.

Daugeliu atvejų galima pirmiausia naudoti sistemos semantinius stilius, pavyzdžiui:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Tai reiškia:

- `.primary` paprastai naudojamas pagrindiniam turiniui.
- `.secondary` paprastai naudojamas antriniam turiniui.

Jie automatiškai koreguoja rodymą pagal šviesųjį ir tamsųjį režimus.

## Skirtingo turinio rodymas pagal išvaizdą

Kartais norime, kad keistųsi ne tik spalvos, bet ir kad skirtingose išvaizdose būtų rodomas skirtingas turinys.

Pavyzdžiui:

- Šviesiajame režime rodyti įprastą lemputės piktogramą.
- Tamsiajame režime rodyti šviečiančios lemputės piktogramą.
- Šviesiajame režime kaip antraštę rodyti `Šviesus`.
- Tamsiajame režime kaip antraštę rodyti `Tamsus`.

Tokiu atveju reikia nustatyti, ar dabartinė sistema veikia šviesiajame, ar tamsiajame režime.

SwiftUI sistemoje dabartinį išvaizdos režimą galime gauti per aplinkos reikšmę `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Pilnas kodas:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Šviesus" : "Tamsus"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("tekstas tekstas tekstas")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Rodymo rezultatas:

![view](../../../Resource/025_view5.png)

Iš peržiūros rezultato matyti, kad tas pats rodinys skirtinguose išvaizdos režimuose nerodo visiškai tokio paties turinio.

Šviesiajame režime `Image` rodo įprastą lemputės piktogramą, o antraštė rodo `Šviesus`.

Tamsiajame režime `Image` rodo šviečiančios lemputės piktogramą, o antraštė rodo `Tamsus`.

Kitaip tariant, čia pasikeičia ne tik spalva. Pasikeičia ir pats piktogramos pavadinimas bei antraštės tekstas.

Taip yra todėl, kad piktogramos ir antraštės neįrašėme tiesiogiai į `body`. Vietoj to skirtingą turinį apskaičiuojame pagal `colorScheme`.

Šiame kode naudojame dvi apskaičiuojamas savybes:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Šviesus" : "Tamsus"
}
```

Kai `colorScheme` yra `.light`, tai reiškia, kad dabartinis režimas yra šviesusis režimas.

Kai `colorScheme` yra `.dark`, tai reiškia, kad dabartinis režimas yra tamsusis režimas.

Todėl pagal skirtingus išvaizdos režimus galime grąžinti skirtingus piktogramų pavadinimus ir antraštės tekstą.

Tai taip pat yra dažnas apskaičiuojamų savybių naudojimas: pagal dabartinę būseną apskaičiuoti turinį, kurį rodinys turi rodyti.

## @Environment supratimas

Tai pirmas kartas, kai susiduriame su `@Environment`.

`@Environment` galima suprasti kaip reikšmės skaitymą iš SwiftUI aplinkos.

Kai programa veikia, sistema pateikia daug aplinkos informacijos, pavyzdžiui:

- Dabartinė kalba
- Dabartinis išvaizdos režimas
- Dabartinė išdėstymo kryptis
- Dabartinis šrifto dydžio nustatymas

Kai reikia gauti dabartinį išvaizdos režimą, galime skaityti `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Čia:

```swift
\.colorScheme
```

reiškia skaityti `colorScheme` reikšmę iš aplinkos.

```swift
private var colorScheme
```

reiškia išsaugoti nuskaitytą reikšmę kintamajame `colorScheme`.

Kintamojo pavadinimą galite pasirinkti patys. Pavyzdžiui, taip pat galima rašyti:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Kol priekyje esantis `\.colorScheme` nesikeičia, tai reiškia, kad skaitote dabartinį išvaizdos režimą.

## Dvi dažnos colorScheme reikšmės

`colorScheme` paprastai turi dvi reikšmes:

```swift
.light
.dark
```

Jos reiškia:

- `.light`: šviesusis režimas
- `.dark`: tamsusis režimas

Pavyzdžiui:

```swift
private var titleName: String {
    colorScheme == .light ? "Šviesus" : "Tamsus"
}
```

Šis kodas reiškia:

Jei dabartinis režimas yra šviesusis režimas, `colorScheme == .light` yra teisinga, todėl grąžinama `"Šviesus"`.

Kitu atveju grąžinama `"Tamsus"`.

Todėl šviesiajame režime:

```swift
Text(titleName)
```

Rodomas tekstas yra:

```swift
Šviesus
```

Tamsiajame režime rodomas tekstas yra:

```swift
Tamsus
```

Tokiu būdu galime rodyti skirtingą turinį pagal skirtingas išvaizdas.

## Spalvų pritaikymo pavyzdys

Be teksto ir piktogramų, kartais spalvų pritaikymą taip pat turime tvarkyti patys.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Tekstas")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Rodymo rezultatas:

![view](../../../Resource/025_view6.png)

Šiame kode tekstas yra baltas, o fonas juodas.

Šviesiajame režime juodas fonas yra gana aiškus.

Tačiau tamsiajame režime, jei visas sąsajos fonas taip pat juodas, šis juodas fonas susilies su sistemos fonu ir atrodys nepakankamai aiškiai.

Šiuo metu teksto spalvą ir fono spalvą galime perjungti pagal išvaizdos režimą:

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
            Text("Tekstas")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Rodymo rezultatas:

![view](../../../Resource/025_view7.png)

Dabar šviesiajame režime naudojamas juodas fonas ir baltas tekstas.

Tamsiajame režime naudojamas baltas fonas ir juodas tekstas.

Taip, nesvarbu, kuri išvaizda naudojama, tekstas ir fonas turi aiškų kontrastą, todėl naudotojai gali aiškiai matyti turinį.

## Assets naudojimas spalvoms pritaikyti

Be rankinio tikrinimo su `colorScheme`, taip pat galime naudoti `Assets` išteklių spalvas, kad prisitaikytume prie šviesiojo ir tamsiojo režimų.

Šis būdas labiau tinka bendroms programos spalvoms valdyti.

Xcode projekte raskite `Assets` išteklių aplanką.

![assets](../../../Resource/025_color.png)

Atidarykite `Assets` aplanką, dešiniuoju pelės mygtuku spustelėkite tuščią sritį ir pasirinkite `New Color Set`, kad sukurtumėte naują spalvos išteklių.

![assets](../../../Resource/025_color1.png)

Čia sukuriame spalvą ir pavadiname ją `redText`.

![assets](../../../Resource/025_color2.png)

Spalvos išteklius gali atskirai nustatyti spalvas šviesiajam ir tamsiajam režimams.

![assets](../../../Resource/025_color3.png)

Pasirinkę atitinkamą spalvos sritį, spalvą galite keisti dešinėje esančiame inspektoriuje.

Spustelėkite viršutiniame dešiniajame kampe esantį mygtuką `Hide or show the Inspectors`, kad atidarytumėte inspektoriaus sritį.

Tada pasirinkite `Show the Attributes inspector`, apačioje raskite `Show Color Panel` ir atidarykite spalvų skydelį.

![assets](../../../Resource/025_color4.png)

Spustelėkite spalvą spalvų skydelyje, ir atitinkama `redText` spalvos sritis tuo pačiu metu pasikeis.

Čia `redText` nustatome taip:

- Šviesiajame režime rodyti raudoną spalvą
- Tamsiajame režime rodyti žalią spalvą

![assets](../../../Resource/025_color5.png)

Grįžę į SwiftUI kodą, šią spalvą galite naudoti taip:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Čia:

```swift
Color("redText")
```

reiškia skaityti spalvos išteklių, pavadintą `redText`, iš `Assets`.

Rodymo rezultatas:

![assets](../../../Resource/025_view8.png)

Galite matyti, kad tas pats `Color("redText")` šviesiajame ir tamsiajame režimuose rodo skirtingas spalvas.

Tai rodo, kad pačios `Assets` spalvos taip pat palaiko išvaizdos pritaikymą.

## Skirtumas tarp colorScheme ir Assets

Tiek `colorScheme`, tiek `Assets` gali įgyvendinti išvaizdos pritaikymą, bet jos tinka skirtingiems scenarijams.

Jei pagal šviesųjį ir tamsųjį režimus reikia perjungti tik teksto turinį, paveikslėlių pavadinimus arba `SF Symbols` pavadinimus, galite naudoti `colorScheme`.

Pavyzdžiui:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Jei spalva programoje naudojama dažnai, pavyzdžiui, temos spalva, kortelės fono spalva arba teksto spalva, labiau rekomenduojama naudoti `Assets` spalvas.

Taip yra todėl, kad `Assets` spalvas galima pakartotinai naudoti keliuose rodiniuose ir vėliau lengviau keisti.

Pavyzdžiui:

```swift
Color("redText")
```

Tokiu būdu reikia pakeisti spalvą tik `Assets`, ir visos vietos, kuriose naudojama ši spalva, pasikeis kartu.

## Santrauka

Šioje pamokoje išmokome išvaizdos pritaikymo šviesiajam ir tamsiajam režimams.

Pirmiausia išmokome, kaip Xcode `Canvas` peržiūrėti skirtingas išvaizdas ir kaip naudoti `Color Scheme Variants`, kad vienu metu matytume šviesųjį ir tamsųjį režimus.

Tada sužinojome, kad tokie SwiftUI rodiniai kaip `Text` ir `Image` pagal numatymą automatiškai pritaiko savo spalvas pagal sistemos išvaizdą.

Tačiau jei rankiniu būdu nurodome fiksuotas spalvas, tokias kaip `Color.white` arba `Color.black`, šios spalvos automatiškai nesikeis.

Toliau susipažinome su `@Environment` ir `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Naudodami `colorScheme`, galime nustatyti, ar dabartinis režimas yra šviesusis, ar tamsusis, ir pagal skirtingas išvaizdas rodyti skirtingas piktogramas, tekstą arba spalvas.

Galiausiai sužinojome apie `Assets` spalvas.

`Assets` spalvose galima atskirai nustatyti spalvas šviesiajam ir tamsiajam režimams, todėl jos tinka bendriems programos spalvų ištekliams valdyti.

Išvaizdos pritaikymas gali padėti programai geriau atrodyti ir dieną, ir naktį, taip pat išvengti tokių problemų kaip sunkiai įskaitomas tekstas arba neaiškus fonas.

Tikroje kūrimo praktikoje rekomenduojama pirmiausia naudoti numatytąjį SwiftUI prisitaikymą ir `Assets` spalvas.

Kai skirtingose išvaizdose reikia perjungti tekstą, piktogramas, paveikslėlius arba tvarkyti nedidelį skaičių specialių rodymo efektų, tada naudokite `colorScheme` tikrinimui.

## Papildomos žinios: šrifto dydžio nurodymas

Kai anksčiau mokėmės `font`, naudojome kai kuriuos sistemos šrifto stilius:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Be tokių sistemos šrifto stilių kaip `.largeTitle` ir `.callout`, taip pat galima rankiniu būdu nurodyti šrifto dydį.

Pavyzdžiui:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Čia:

```swift
.font(.system(size: 100))
```

reiškia nustatyti šrifto dydį į `100 pt`.

`SF Symbols` piktogramoms `font` taip pat daro įtaką piktogramos dydžiui.

Todėl jei norite, kad piktograma būtų rodoma didesnė, dydį galite nurodyti naudodami `.font(.system(size:))`.

Pavyzdžiui:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Svarbu atkreipti dėmesį, kad nors rankinis šrifto dydžio nurodymas yra lankstesnis, įprastam tekstui nerekomenduojama plačiai naudoti fiksuotų šrifto dydžių.

Įprastam tekstui pirmiausia naudokite sistemos šrifto stilius, tokius kaip `.title`, `.headline`, `.body` ir `.caption`.

Taip lengviau prisitaikyti prie skirtingų įrenginių ir naudotojo šrifto nustatymų.
