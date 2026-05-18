# Barve po meri

V tej lekciji se bomo naučili, kako v SwiftUI prilagoditi barve.

V prejšnjih lekcijah smo že uporabljali privzete barve, ki jih ponuja SwiftUI, na primer:

```swift
Color.blue
Color.red
Color.green
```

Te barve so priročne za uporabo, vendar v resničnem razvoju aplikacij privzete barve pogosto niso dovolj natančne.

Na primer, oblikovna predloga lahko uporablja takšne barve:

```text
#2c54c2
#4875ed
#213e8d
```

Takšni barvi pravimo Hex barva.

V tej lekciji bomo najprej omogočili, da SwiftUI podpira Hex barve, nato pa bomo z `static` uredili pogosto uporabljene barve.

Na koncu bomo barve po meri uporabili v pogledu živalske enciklopedije in dodatno uporabili prelivno ozadje, da bodo gumbi videti bolj večplastni.

## Zakaj potrebujemo barve po meri?

V SwiftUI lahko neposredno uporabljamo sistemske barve.

Na primer:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Tukaj `.blue` pomeni modro barvo. Pravzaprav je to skrajšana oblika zapisa `Color.blue`.

Prednost privzetih barv je, da so preproste in priročne, vendar je izbira barv razmeroma omejena.

Na primer:

```swift
Color.blue
```

To lahko predstavlja samo privzeto modro barvo, ki jo ponuja SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

V dejanskem razvoju pa pogosto potrebujemo natančnejše barve.

Na primer, čeprav gre v vseh primerih za modro, lahko obstajajo različni učinki, kot so svetlo modra, temno modra, sivo modra in živahno modra.

![More Blue](../../../Resource/031_color5.png)

Takrat je, če uporabljamo samo `Color.blue`, težko poustvariti oblikovni učinek.

Zato moramo omogočiti, da SwiftUI podpira barve po meri.

## Kaj je Hex barva?

Barve na zaslonu so običajno sestavljene iz treh kanalov: rdeče, zelene in modre. To je RGB.

RGB pomeni:

```text
Red     // Rdeča
Green   // Zelena
Blue    // Modra
```

Hex barva je eden od načinov zapisa RGB barve.

Na primer:

```swift
#5479FF
```

To barvno vrednost lahko preprosto razumemo kot tri dele:

```text
54  // Predstavlja rdeči kanal
79  // Predstavlja zeleni kanal
FF  // Predstavlja modri kanal
```

V tej lekciji teh vrednosti ni treba izračunavati in tudi pravil šestnajstiškega zapisa ni treba poglobljeno razumeti.

Za zdaj moramo vedeti samo to: `#5479FF` predstavlja določeno barvo.

Ko bomo pozneje videli zapise, kot sta `#2c54c2` in `#4875ed`, jih lahko najprej razumemo kot barvne vrednosti.

Podobne barvne vrednosti pogosto vidimo tudi v oblikovalskih orodjih, kot so Sketch, Figma in Photoshop.

![color](../../../Resource/031_color.png)

Vendar SwiftUI privzeto ne podpira neposrednega zapisa:

```swift
Color(hex: "#5479FF")
```

Zato moramo sami razširiti tip `Color`, da bo podpiral ustvarjanje barv iz Hex nizov.

## Ustvarjanje datoteke Color+Hex.swift

Najprej ustvarimo novo datoteko Swift.

Ime datoteke je lahko:

```text
Color.swift
```

Lahko pa ga zapišemo bolj jasno kot:

```text
Color+Hex.swift
```

Tukaj je bolj priporočljivo uporabiti:

```text
Color+Hex.swift
```

V projektih Swift so imena datotek, kot je `Color+Hex.swift`, zelo pogosta.

Pomenijo, da je ta datoteka razširitvena datoteka, ki tipu `Color` doda podporo za Hex.

Ime datoteke ne vpliva neposredno na izvajanje kode. Namenjeno je samo temu, da lažje razumemo namen datoteke.

## Dodajanje kode Color(hex:)

V datoteko `Color+Hex.swift` vpišite spodnjo kodo:

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

Ta koda z `extension` razširi tip `Color` in tipu `Color` doda nov inicializator:

```swift
init(hex: String)
```

Ko imamo ta inicializator, lahko Hex niz posredujemo tipu `Color` in tako ustvarimo barvo po meri:

```swift
Color(hex: "#5479FF")
```

Znotraj te razširitvene kode se Hex niz pretvori v RGB barvo, ki jo SwiftUI zna prepoznati.

Na tej stopnji ni treba poglobljeno razumeti pretvorbene logike vsake vrstice. Vedeti moramo samo to, da dodana metoda `Color(hex:)` omogoča ustvarjanje barv po meri iz Hex barvnih vrednosti.

## Uporaba barv po meri

Zdaj lahko barve po meri preizkusimo v `ContentView`.

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

Prikazani učinek:

![color](../../../Resource/031_color1.png)

V tem primeru prva vrstica uporablja sistemsko barvo:

```swift
.foregroundStyle(Color.blue)
```

Naslednje tri vrstice uporabljajo Hex barve po meri:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

S primerjavo lahko vidimo, da ima sistemska modra samo en privzeti učinek.

Hex barve pa lahko predstavijo bolj podrobne spremembe modre barve.

To je vrednost barv po meri: barve vmesnika lahko približajo resnični oblikovni predlogi in nam omogočijo lažji nadzor nad vizualnim slogom aplikacije.

## Uporaba static za urejanje barv

Zdaj lahko že ustvarimo barve iz Hex nizov:

```swift
Color(hex: "#2c54c2")
```

Takšen zapis deluje pravilno, vendar če se ista barva ponavlja na več mestih, bo poznejše vzdrževanje manj priročno.

Če je ta barvna vrednost zapisana na 10 različnih mestih, moramo pri poznejši spremembi te modre spremeniti vsako mesto posebej.

Takrat lahko uporabimo `static`, da pogosto uporabljene barve uredimo na enem mestu.

Na dnu datoteke `Color+Hex.swift` nadaljujte z dodajanjem spodnje kode:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Tukaj smo tipu `Color` dodali tri statične lastnosti: `animalBlue`, `animalLightBlue` in `animalDarkBlue`. Predstavljajo različne odtenke modre.

Ker te lastnosti uporabljajo `static`, pripadajo samemu tipu `Color`.

Pri uporabi lahko do njih dostopamo neposredno prek `Color.`:

```swift
Color.animalBlue
```

Takšen zapis je jasnejši kot neposredno pisanje Hex niza.

Ko vidimo `Color.animalBlue`, lahko vemo, da predstavlja modro barvo, uporabljeno v živalski enciklopediji.

Ko pa vidimo `Color(hex: "#2c54c2")`, lahko vemo samo, da gre za barvno vrednost, njenega konkretnega namena pa ni lahko razbrati.

Enotno upravljanje barv ima še eno prednost: poznejše spremembe so lažje.

Če želimo prilagoditi glavno barvo živalske enciklopedije, moramo spremeniti samo mesto definicije:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Vsa mesta, ki uporabljajo to barvo, se bodo posodobila skupaj.

To je pomen uporabe `static` za urejanje barv: imena barv postanejo jasnejša, poznejše vzdrževanje pa priročnejše.

## Uporaba v živalski enciklopediji

Zdaj lahko barve po meri uporabimo v prejšnjem pogledu živalske enciklopedije.

Prej je bilo ozadje gumba za žival belo:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Zdaj ga lahko spremenimo v barvo po meri:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Tukaj je `Color.animalBlue` statična barva, ki smo jo pravkar definirali v `Color+Hex.swift`.

Besedilo gumba uporablja belo barvo:

```swift
.foregroundStyle(Color.white)
```

Ozadje živalskega emoji uporablja polprosojno belo barvo:

```swift
.background(Color.white.opacity(0.15))
```

Tako gumb dobi enoten moder vizualni slog.

Poudarek tega koraka ni dodajanje zapletene kode, temveč resnična uporaba prej naučenih barv po meri v vmesniku.

## Uporaba prelivnega ozadja

Poleg uporabe ene same barve lahko več barv združimo tudi v učinek preliva.

Na primer, prej smo definirali te barve:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Te barve lahko uporabljamo ne samo posamezno, temveč jih lahko združimo tudi v prelivno ozadje.

V SwiftUI lahko za ustvarjanje linearnega preliva uporabimo `LinearGradient`.

Na primer:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Ta koda ustvari prelivno ozadje od leve proti desni, pri katerem barva postopoma prehaja iz `Color.animalBlue` v `Color.animalLightBlue`.

Pri tem se `colors` uporablja za nastavitev barv, ki sodelujejo v prelivu, `startPoint` in `endPoint` pa za nadzor smeri preliva.

### Preizkus učinka preliva

Za preizkus prelivnega ozadja lahko uporabimo preprost Text.

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

Prikazani učinek:

![color](../../../Resource/031_color3.png)

V tem primeru ozadje `Text` ni več ena sama barva, temveč prelivna barva, ki se postopoma spreminja od leve proti desni.

V primerjavi z običajno barvo ozadja ima prelivno ozadje več plasti in lahko v vmesniku lažje ustvari vizualni poudarek.

## Uporaba prelivnega ozadja v živalski enciklopediji

Zdaj lahko barvo ozadja gumba za žival:

```swift
.background(Color.animalBlue)
```

spremenimo v prelivno ozadje:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Celotna koda je naslednja:

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

Prikazani učinek:

![color](../../../Resource/031_color4.png)

Zdaj gumb za žival ni več samo enobarvno ozadje, temveč ima učinek preliva od leve proti desni.

V primerjavi z enobarvnim ozadjem lahko prelivno ozadje naredi vmesnik bolj večplasten in bližji vizualnemu oblikovanju resnične aplikacije.

## Razlika med enobarvnim in prelivnim ozadjem

Enobarvno ozadje uporablja samo eno barvo.

Na primer:

```swift
.background(Color.animalBlue)
```

Takšen zapis je preprost in jasen ter primeren za večino osnovnih vmesnikov.

Prelivno ozadje uporablja več barv.

Na primer:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Takšen zapis lahko naredi vmesnik bolj večplasten, vendar lahko tudi lažje poveča vizualno kompleksnost.

Zato lahko v dejanskem razvoju to razumemo takole:

Enobarvna ozadja so primerna za običajno besedilo, običajne gumbe, običajne kartice in običajna ozadja strani.

Prelivna ozadja so primerna za ključne gumbe, zgornja območja, naslovne kartice, vstope v funkcije in druga mesta, ki potrebujejo poudarek.

## Povzetek

V tej lekciji smo se naučili, kako v SwiftUI uporabljati barve po meri.

Najprej smo spoznali Hex barve.

Na primer:

```text
#2c54c2
```

Predstavlja določeno barvo.

Nato smo z `extension Color` razširili tip `Color`.

To omogoča, da SwiftUI ustvari barve na naslednji način:

```swift
Color(hex: "#2c54c2")
```

Nato smo z `static` uredili pogosto uporabljene barve:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Tako jo lahko neposredno uporabljamo v drugih pogledih:

```swift
Color.animalBlue
```

V primerjavi s tem, da vsakič pišemo Hex niz, je ta način jasnejši in omogoča priročnejše enotno spreminjanje barv pozneje.

Na koncu smo spoznali `LinearGradient` in barve po meri združili v prelivno ozadje:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

S to lekcijo smo zaključili postopek od »ustvarjanja barv po meri« do »uporabe barv v resničnem vmesniku«.

Pozneje, ko bo treba eno barvo večkrat uporabiti na več mestih, lahko najprej razmislimo, da jo uredimo v razširitvi `Color`.

Tako bo koda jasnejša, slog vmesnika pa lažje poenoten.
