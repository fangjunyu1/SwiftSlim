# Prilagođene boje

U ovoj lekciji naučit ćemo kako prilagoditi boje u SwiftUI-ju.

U prethodnim lekcijama već smo koristili zadane boje koje pruža SwiftUI, na primjer:

```swift
Color.blue
Color.red
Color.green
```

Te su boje jednostavne za upotrebu, ali u stvarnom razvoju aplikacija zadane boje često nisu dovoljno precizne.

Na primjer, dizajn može koristiti ovakve boje:

```text
#2c54c2
#4875ed
#213e8d
```

Ovakva boja naziva se Hex boja.

U ovoj lekciji prvo ćemo omogućiti SwiftUI-ju podršku za Hex boje, a zatim ćemo pomoću `static` organizirati često korištene boje.

Na kraju ćemo prilagođene boje primijeniti na prikaz enciklopedije životinja te dodatno koristiti gradijentnu pozadinu kako bi gumbi izgledali slojevitije.

## Zašto su nam potrebne prilagođene boje?

U SwiftUI-ju možemo izravno koristiti sistemske boje.

Na primjer:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Ovdje `.blue` označava plavu boju. To je zapravo skraćeni zapis za `Color.blue`.

Prednost zadanih boja jest to što su jednostavne i praktične, ali izbor boja je ograničen.

Na primjer:

```swift
Color.blue
```

Ovo može predstavljati samo zadanu plavu boju koju pruža SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Međutim, u stvarnom razvoju često su nam potrebne konkretnije boje.

Na primjer, čak i kada su sve boje plave, mogu postojati različiti efekti poput svijetloplave, tamnoplave, sivoplave i jarko plave.

![Više plave](../../../Resource/031_color5.png)

U tom slučaju, ako koristimo samo `Color.blue`, teško ćemo vjerno prikazati dizajnerski efekt.

Zato trebamo omogućiti SwiftUI-ju podršku za prilagođene boje.

## Što je Hex boja?

Boje na zaslonu obično se sastoje od tri kanala: crvenog, zelenog i plavog. To je RGB.

RGB označava:

```text
Red     // Crvena
Green   // Zelena
Blue    // Plava
```

Hex boja jedan je način prikaza RGB boje.

Na primjer:

```swift
#5479FF
```

Ovu vrijednost boje možemo jednostavno shvatiti kao tri dijela:

```text
54  // Predstavlja crveni kanal
79  // Predstavlja zeleni kanal
FF  // Predstavlja plavi kanal
```

U ovoj lekciji ne trebamo izračunavati te vrijednosti niti detaljno razumjeti pravila heksadecimalnog zapisa.

Za sada trebamo znati samo ovo: `#5479FF` predstavlja konkretnu boju.

Kasnije, kada vidimo zapise poput `#2c54c2` i `#4875ed`, možemo ih najprije shvatiti kao vrijednosti boja.

U dizajnerskim alatima kao što su Sketch, Figma i Photoshop također često možemo vidjeti slične vrijednosti boja.

![boja](../../../Resource/031_color.png)

Međutim, SwiftUI prema zadanim postavkama ne može izravno pisati ovako:

```swift
Color(hex: "#5479FF")
```

Zato trebamo sami proširiti tip `Color` kako bi podržavao stvaranje boja iz Hex stringova.

## Stvaranje datoteke Color+Hex.swift

Najprije ćemo stvoriti novu Swift datoteku.

Naziv datoteke može biti:

```text
Color.swift
```

Može se napisati i jasnije kao:

```text
Color+Hex.swift
```

Ovdje se više preporučuje korištenje naziva:

```text
Color+Hex.swift
```

U Swift projektima nazivi datoteka poput `Color+Hex.swift` vrlo su česti.

To znači da je ova datoteka proširenje koje tipu `Color` dodaje mogućnost rada s Hex bojama.

Naziv datoteke ne utječe izravno na izvršavanje koda. Služi samo tome da lakše razumijemo čemu datoteka služi.

## Dodavanje koda Color(hex:)

U datoteku `Color+Hex.swift` upišite sljedeći kod:

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

Ovaj kod koristi `extension` za proširenje tipa `Color` i dodaje tipu `Color` novi inicijalizator:

```swift
init(hex: String)
```

Nakon što imamo ovaj inicijalizator, Hex string možemo proslijediti u `Color` i tako stvoriti prilagođenu boju:

```swift
Color(hex: "#5479FF")
```

Unutar ovog proširenja Hex string se pretvara u RGB boju koju SwiftUI može prepoznati.

U ovoj fazi ne morate detaljno razumjeti logiku pretvorbe u svakom retku. Trebate samo znati da dodana metoda `Color(hex:)` omogućuje stvaranje prilagođenih boja pomoću Hex vrijednosti boja.

## Korištenje prilagođenih boja

Sada možemo testirati prilagođene boje u `ContentView`.

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

Efekt prikaza:

![boja](../../../Resource/031_color1.png)

U ovom primjeru prvi redak koristi sistemsku boju:

```swift
.foregroundStyle(Color.blue)
```

Sljedeća tri retka koriste prilagođene Hex boje:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Usporedbom možemo vidjeti da sistemska plava ima samo jedan zadani efekt.

Hex boje, međutim, mogu prikazati detaljnije varijacije plave boje.

To je vrijednost prilagođenih boja: mogu boje sučelja približiti stvarnom dizajnu i olakšati nam kontrolu vizualnog stila aplikacije.

## Korištenje static za organiziranje boja

Sada već možemo stvarati boje iz Hex stringova:

```swift
Color(hex: "#2c54c2")
```

Ovakav zapis normalno radi, ali ako se ista boja ponavlja na više mjesta, kasnije održavanje neće biti praktično.

Ako je ova vrijednost boje zapisana na 10 različitih mjesta, kada kasnije želimo promijeniti tu plavu boju, moramo je mijenjati jednu po jednu.

U tom slučaju možemo koristiti `static` kako bismo često korištene boje organizirali na jednom mjestu.

Na dnu datoteke `Color+Hex.swift` nastavite dodavati sljedeći kod:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Ovdje smo tipu `Color` dodali tri statička svojstva: `animalBlue`, `animalLightBlue` i `animalDarkBlue`. Ona predstavljaju različite nijanse plave.

Budući da ta svojstva koriste `static`, pripadaju samom tipu `Color`.

Pri korištenju im možemo pristupiti izravno kroz `Color.`:

```swift
Color.animalBlue
```

Ovakav zapis jasniji je od izravnog pisanja Hex stringa.

Kada vidimo `Color.animalBlue`, možemo znati da predstavlja plavu boju korištenu u enciklopediji životinja.

Ali kada vidimo `Color(hex: "#2c54c2")`, možemo znati samo da je to vrijednost boje, no nije lako vidjeti njezinu konkretnu svrhu.

Jedinstveno upravljanje bojama ima još jednu prednost: kasnije izmjene su lakše.

Ako želimo prilagoditi glavnu boju enciklopedije životinja, trebamo promijeniti samo mjesto definicije:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Sva mjesta koja koriste ovu boju ažurirat će se zajedno.

To je smisao korištenja `static` za organiziranje boja: nazivi boja postaju jasniji, a kasnije održavanje praktičnije.

## Primjena u enciklopediji životinja

Sada možemo primijeniti prilagođene boje na prethodni prikaz enciklopedije životinja.

Prije je pozadina gumba za životinju bila bijela:

```swift
.background(Color.white)
```

![jedan bijeli gumb](../../../Resource/031_color7.png)

Sada je možemo promijeniti u prilagođenu boju:

```swift
.background(Color.animalBlue)
```

![jedan plavi gumb](../../../Resource/031_color8.png)

Ovdje je `Color.animalBlue` statička boja koju smo upravo definirali u `Color+Hex.swift`.

Tekst gumba koristi bijelu boju:

```swift
.foregroundStyle(Color.white)
```

Pozadina emojija životinje koristi poluprozirnu bijelu boju:

```swift
.background(Color.white.opacity(0.15))
```

Tako gumb dobiva jedinstven plavi vizualni stil.

Fokus ovog koraka nije dodavanje složenog koda, nego stvarna primjena ranije naučenih prilagođenih boja u sučelju.

## Korištenje gradijentne pozadine

Osim korištenja jedne boje, možemo kombinirati više boja u gradijentni efekt.

Na primjer, ranije smo definirali ove boje:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Te boje ne moraju se koristiti samo pojedinačno, nego se mogu kombinirati i u gradijentnu pozadinu.

U SwiftUI-ju možemo koristiti `LinearGradient` za stvaranje linearnog gradijenta.

Na primjer:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Ovaj kod stvara gradijentnu pozadinu slijeva nadesno, pri čemu boja postupno prelazi iz `Color.animalBlue` u `Color.animalLightBlue`.

Ovdje se `colors` koristi za postavljanje boja koje sudjeluju u gradijentu, a `startPoint` i `endPoint` koriste se za kontrolu smjera gradijenta.

### Testiranje gradijentnog efekta

Za testiranje gradijentne pozadine možemo upotrijebiti jednostavan Text.

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

Efekt prikaza:

![boja](../../../Resource/031_color3.png)

U ovom primjeru pozadina `Text` više nije jedna boja, nego gradijentna boja koja se postupno mijenja slijeva nadesno.

U usporedbi s običnom pozadinskom bojom, gradijentna pozadina ima više slojeva i lakše stvara vizualni naglasak u sučelju.

## Korištenje gradijentne pozadine u enciklopediji životinja

Sada možemo promijeniti pozadinsku boju gumba za životinju:

```swift
.background(Color.animalBlue)
```

U gradijentnu pozadinu:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Cijeli kod je sljedeći:

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

Efekt prikaza:

![boja](../../../Resource/031_color4.png)

Sada gumb za životinju više nije samo jednobojna pozadina, nego ima gradijentni efekt slijeva nadesno.

U usporedbi s jednobojnom pozadinom, gradijentna pozadina može učiniti da sučelje izgleda slojevitije i bliže vizualnom dizajnu stvarne aplikacije.

## Razlika između jednobojne pozadine i gradijentne pozadine

Jednobojna pozadina koristi samo jednu boju.

Na primjer:

```swift
.background(Color.animalBlue)
```

Ovakav zapis je jednostavan i jasan te je prikladan za većinu osnovnih sučelja.

Gradijentna pozadina koristi više boja.

Na primjer:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Ovakav zapis može učiniti sučelje slojevitijim, ali također lakše može povećati vizualnu složenost.

Zato u stvarnom razvoju to možemo shvatiti ovako:

Jednobojne pozadine prikladne su za običan tekst, obične gumbe, obične kartice i obične pozadine stranica.

Gradijentne pozadine prikladne su za ključne gumbe, gornja područja, naslovne kartice, ulaze u značajke i druga mjesta koja treba naglasiti.

## Sažetak

U ovoj lekciji naučili smo kako koristiti prilagođene boje u SwiftUI-ju.

Najprije smo naučili što su Hex boje.

Na primjer:

```text
#2c54c2
```

Ona predstavlja konkretnu boju.

Zatim smo pomoću `extension Color` proširili tip `Color`.

Time SwiftUI može stvarati boje na sljedeći način:

```swift
Color(hex: "#2c54c2")
```

Zatim smo pomoću `static` organizirali često korištene boje:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Na taj način možemo je izravno koristiti u drugim prikazima:

```swift
Color.animalBlue
```

U usporedbi s pisanjem Hex stringova svaki put, ovaj pristup je jasniji i kasnije olakšava jedinstvenu izmjenu boja.

Na kraju smo naučili `LinearGradient` i kombinirali prilagođene boje u gradijentnu pozadinu:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Kroz ovu lekciju završili smo proces od „stvaranja prilagođenih boja” do „korištenja boja u stvarnom sučelju”.

Kasnije, kada neku boju treba ponavljano koristiti na više mjesta, možemo najprije razmisliti o tome da je organiziramo u proširenju `Color`.

Tako će kod biti jasniji, a stil sučelja lakše ujednačiti.
