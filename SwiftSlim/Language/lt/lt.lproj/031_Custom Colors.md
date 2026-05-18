# Pasirinktinės spalvos

Šioje pamokoje išmoksime, kaip SwiftUI naudoti pasirinktines spalvas.

Ankstesnėse pamokose jau naudojome SwiftUI pateikiamas numatytąsias spalvas, pavyzdžiui:

```swift
Color.blue
Color.red
Color.green
```

Šias spalvas naudoti patogu, tačiau kuriant tikrą App numatytosios spalvos dažnai nėra pakankamai tikslios.

Pavyzdžiui, dizaino makete gali būti naudojamos tokios spalvos:

```text
#2c54c2
#4875ed
#213e8d
```

Tokia spalva vadinama Hex spalva.

Šioje pamokoje pirmiausia leisime SwiftUI palaikyti Hex spalvas, o tada naudodami `static` susitvarkysime dažnai naudojamas spalvas.

Galiausiai pritaikysime pasirinktines spalvas gyvūnų enciklopedijos vaizde ir papildomai naudosime gradiento foną, kad mygtukai atrodytų sluoksniuotesni.

## Kodėl reikia pasirinktinių spalvų?

SwiftUI galime tiesiogiai naudoti sistemos spalvas.

Pavyzdžiui:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Čia `.blue` reiškia mėlyną spalvą. Iš tikrųjų tai yra sutrumpinta `Color.blue` rašymo forma.

Numatytųjų spalvų privalumas yra paprastumas ir patogumas, tačiau spalvų pasirinkimas yra gana ribotas.

Pavyzdžiui:

```swift
Color.blue
```

gali reikšti tik SwiftUI pateikiamą numatytąją mėlyną spalvą.

![Color.blue](../../../Resource/031_color6.png)

Tačiau realioje kūrimo praktikoje dažnai reikia konkretesnių spalvų.

Pavyzdžiui, net jei visos jos yra mėlynos, gali būti šviesiai mėlyna, tamsiai mėlyna, pilkšvai mėlyna, ryškiai mėlyna ir kiti skirtingi efektai.

![More Blue](../../../Resource/031_color5.png)

Tokiu atveju, jei naudosime tik `Color.blue`, bus sunku atkurti dizaino efektą.

Todėl turime leisti SwiftUI palaikyti pasirinktines spalvas.

## Kas yra Hex spalva?

Ekrane matomos spalvos paprastai sudarytos iš trijų kanalų: raudono, žalio ir mėlyno, tai yra RGB.

RGB atitinkamai reiškia:

```text
Red     // Raudona
Green   // Žalia
Blue    // Mėlyna
```

Hex spalva yra vienas iš RGB spalvos užrašymo būdų.

Pavyzdžiui:

```swift
#5479FF
```

Šią spalvos reikšmę galima paprastai suprasti kaip tris dalis:

```text
54  // Reiškia raudoną kanalą
79  // Reiškia žalią kanalą
FF  // Reiškia mėlyną kanalą
```

Šioje pamokoje mums nereikia skaičiuoti šių reikšmių ir nereikia giliai suprasti šešioliktainės sistemos taisyklių.

Dabar užtenka žinoti: `#5479FF` reiškia konkrečią spalvą.

Ateityje, kai matysime panašius užrašus, tokius kaip `#2c54c2` ar `#4875ed`, pirmiausia galime juos suprasti kaip spalvos reikšmes.

Sketch, Figma, Photoshop ir kituose dizaino įrankiuose taip pat dažnai galima pamatyti panašias spalvų reikšmes.

![color](../../../Resource/031_color.png)

Tačiau SwiftUI pagal numatymą negali tiesiogiai rašyti taip:

```swift
Color(hex: "#5479FF")
```

Todėl turime patys išplėsti `Color` tipą, kad jis palaikytų spalvos kūrimą iš Hex eilutės.

## Color+Hex.swift failo sukūrimas

Pirmiausia sukuriame naują Swift failą.

Failo pavadinimą galima rašyti taip:

```text
Color.swift
```

Taip pat galima rašyti aiškiau:

```text
Color+Hex.swift
```

Čia labiau rekomenduojama naudoti:

```text
Color+Hex.swift
```

Swift projektuose tokie failų pavadinimai kaip `Color+Hex.swift` yra labai įprasti.

Tai reiškia, kad šis failas yra išplėtimo failas, kuris `Color` tipui prideda Hex galimybę.

Failo pavadinimas tiesiogiai neturi įtakos kodo veikimui; jis skirtas tam, kad būtų lengviau suprasti failo paskirtį.

## Color(hex:) kodo pridėjimas

`Color+Hex.swift` faile įrašykite žemiau pateiktą kodą:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Šis kodas naudoja `extension`, kad išplėstų `Color` tipą, ir prideda `Color` naują inicializavimo metodą:

```swift
init(hex: String)
```

Turėdami šį inicializavimo metodą, galime perduoti Hex eilutę į `Color` ir taip sukurti pasirinktinę spalvą:

```swift
Color(hex: "#5479FF")
```

Šio išplėtimo kodo viduje Hex eilutė paverčiama į RGB spalvą, kurią SwiftUI gali atpažinti.

Šiame etape nereikia giliai suprasti kiekvienos konvertavimo logikos eilutės. Pakanka žinoti, kad pridėtas `Color(hex:)` metodas leidžia kurti pasirinktines spalvas pagal Hex spalvos reikšmę.

## Pasirinktinių spalvų naudojimas

Dabar galime `ContentView` faile išbandyti pasirinktines spalvas.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Rodymo efektas:

![color](../../../Resource/031_color1.png)

Šiame pavyzdyje pirmoje eilutėje naudojama sistemos spalva:

```swift
.foregroundStyle(Color.blue)
```

Toliau esančiose trijose eilutėse naudojamos pasirinktinės Hex spalvos:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Palyginus galima pastebėti, kad sistemos mėlyna spalva turi tik vieną numatytąjį efektą.

O Hex spalvos gali išreikšti smulkesnius mėlynos spalvos pokyčius.

Tai ir yra pasirinktinių spalvų vertė: jos leidžia sąsajos spalvas priartinti prie realaus dizaino ir patogiau valdyti App vizualinį stilių.

## Spalvų tvarkymas naudojant static

Dabar jau galime kurti spalvas iš Hex eilutės:

```swift
Color(hex: "#2c54c2")
```

Toks rašymo būdas veikia, tačiau jei ta pati spalva pasikartoja keliose vietose, vėlesnė priežiūra tampa ne tokia patogi.

Jei šią spalvos reikšmę parašėme 10 vietų, vėliau norėdami pakeisti šią mėlyną spalvą turėsime keisti kiekvieną vietą atskirai.

Tokiu atveju galime naudoti `static`, kad dažnai naudojamas spalvas sutvarkytume vienoje vietoje.

`Color+Hex.swift` failo apačioje toliau pridėkite žemiau pateiktą kodą:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Čia `Color` tipui pridėjome tris statines savybes: `animalBlue`, `animalLightBlue` ir `animalDarkBlue`. Jos atitinkamai reiškia skirtingo šviesumo mėlynas spalvas.

Kadangi šios savybės naudoja `static`, jos priklauso pačiam `Color` tipui.

Naudojant galima tiesiogiai pasiekti per `Color.`:

```swift
Color.animalBlue
```

Toks rašymo būdas yra aiškesnis nei tiesioginis Hex eilutės rašymas.

Kai matome `Color.animalBlue`, galime suprasti, kad tai yra gyvūnų enciklopedijoje naudojama mėlyna spalva.

O kai matome `Color(hex: "#2c54c2")`, žinome tik tai, kad tai yra spalvos reikšmė, tačiau nelengva suprasti jos konkrečią paskirtį.

Vieningas spalvų valdymas turi dar vieną privalumą: vėliau lengviau atlikti pakeitimus.

Jei norime pakoreguoti pagrindinę gyvūnų enciklopedijos spalvą, reikia pakeisti tik apibrėžimo vietą:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Visos vietos, kuriose naudojama ši spalva, bus atnaujintos kartu.

Tai yra spalvų tvarkymo naudojant `static` prasmė: spalvų pavadinimai tampa aiškesni, o vėlesnė priežiūra patogesnė.

## Pritaikymas gyvūnų enciklopedijoje

Dabar pasirinktines spalvas galime pritaikyti ankstesniame gyvūnų enciklopedijos vaizde.

Anksčiau gyvūno mygtuko fonas buvo baltas:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Dabar galime pakeisti jį į pasirinktinę spalvą:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Čia `Color.animalBlue` yra statinė spalva, kurią ką tik apibrėžėme `Color+Hex.swift` faile.

Mygtuko tekstui naudojama balta spalva:

```swift
.foregroundStyle(Color.white)
```

Gyvūno emoji fonui naudojama pusiau permatoma balta spalva:

```swift
.background(Color.white.opacity(0.15))
```

Taip mygtukas suformuos vientisą mėlyną vizualinį stilių.

Šio žingsnio esmė nėra pridėti sudėtingo kodo, o iš tikrųjų pritaikyti anksčiau išmoktas pasirinktines spalvas sąsajoje.

## Gradiento fono naudojimas

Be vienos spalvos naudojimo, kelias spalvas taip pat galime sujungti į gradiento efektą.

Pavyzdžiui, anksčiau apibrėžėme šias spalvas:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Šias spalvas galima naudoti ne tik atskirai, bet ir sujungti į gradiento foną.

SwiftUI galima naudoti `LinearGradient` linijiniam gradientui sukurti.

Pavyzdžiui:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Šis kodas sukurs iš kairės į dešinę einantį gradiento foną: spalva palaipsniui pereis iš `Color.animalBlue` į `Color.animalLightBlue`.

Čia `colors` naudojama gradiente dalyvaujančioms spalvoms nustatyti, o `startPoint` ir `endPoint` naudojami gradiento krypčiai valdyti.

### Gradiento efekto testavimas

Galime naudoti paprastą Text, kad išbandytume gradiento foną.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Rodymo efektas:

![color](../../../Resource/031_color3.png)

Šiame pavyzdyje `Text` fonas nebėra viena spalva, o iš kairės į dešinę palaipsniui kintantis gradientas.

Palyginti su įprastu fonu, gradiento fonas turi daugiau sluoksniškumo ir lengviau sukuria vizualinį akcentą sąsajoje.

## Gradiento fono naudojimas gyvūnų enciklopedijoje

Dabar gyvūno mygtuko fono spalvą:

```swift
.background(Color.animalBlue)
```

galime pakeisti į gradiento foną:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Visas kodas:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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
```

Rodymo efektas:

![color](../../../Resource/031_color4.png)

Dabar gyvūnų mygtukai nebėra tik vienspalvio fono, jie turi iš kairės į dešinę einantį gradiento efektą.

Palyginti su vienspalviu fonu, gradiento fonas gali suteikti sąsajai daugiau sluoksniškumo ir labiau priartinti ją prie tikro App vizualinio dizaino.

## Vienspalvio fono ir gradiento fono skirtumas

Vienspalvis fonas naudoja tik vieną spalvą.

Pavyzdžiui:

```swift
.background(Color.animalBlue)
```

Toks rašymo būdas paprastas ir aiškus, tinkamas daugumai bazinių sąsajų.

Gradiento fonas naudoja kelias spalvas.

Pavyzdžiui:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Toks rašymo būdas gali suteikti sąsajai daugiau sluoksniškumo, tačiau taip pat lengviau padidina vizualinį sudėtingumą.

Todėl realioje kūrimo praktikoje galima suprasti taip:

Vienspalvis fonas tinka įprastam tekstui, įprastiems mygtukams, įprastoms kortelėms ir įprastam puslapio fonui.

Gradiento fonas tinka svarbiems mygtukams, viršutinėms sritims, viršelio kortelėms, funkcijų įėjimams ir kitoms vietoms, kurias reikia pabrėžti.

## Santrauka

Šioje pamokoje išmokome, kaip SwiftUI naudoti pasirinktines spalvas.

Pirmiausia supratome Hex spalvas.

Pavyzdžiui:

```text
#2c54c2
```

Ji reiškia konkrečią spalvą.

Tada naudojome `extension Color`, kad išplėstume `Color` tipą.

Tai leidžia SwiftUI kurti spalvas tokiu būdu:

```swift
Color(hex: "#2c54c2")
```

Toliau naudojome `static`, kad sutvarkytume dažnai naudojamas spalvas:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Taip kituose vaizduose galima tiesiogiai naudoti:

```swift
Color.animalBlue
```

Palyginti su Hex eilutės rašymu kiekvieną kartą, šis būdas yra aiškesnis ir patogesnis, kai vėliau reikia vieningai pakeisti spalvą.

Galiausiai išmokome `LinearGradient` ir sujungėme pasirinktines spalvas į gradiento foną:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Per šią pamoką užbaigėme procesą nuo „pasirinktinės spalvos sukūrimo“ iki „spalvos naudojimo tikroje sąsajoje“.

Ateityje, kai vieną spalvą reikės pakartotinai naudoti keliose vietose, pirmiausia galima apsvarstyti jos sutvarkymą `Color` išplėtime.

Taip kodas bus aiškesnis, o sąsajos stilių bus lengviau suvienodinti.
