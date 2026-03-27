# Swift i SwiftUI

Kada učimo razvoj za Apple platforme, mnogi vodiči imaju tendenciju objašnjavati Swift i SwiftUI odvojeno. To početnicima lako stvara osjećaj odvojenosti pa pogrešno pomisle da su to dvije potpuno nezavisne tehnologije.

U stvarnosti, Swift i SwiftUI duboko su povezani u jednu cjelinu: Swift je programski jezik koji pruža logiku i podatke, dok je SwiftUI framework korisničkog sučelja izgrađen na Swiftu i odgovoran je za renderiranje prikaza i interakciju.

Ova će vam lekcija pomoći izgraditi jasan okvir razumijevanja: što je Swift, što je SwiftUI i kako međusobno surađuju u kodu.

## Što je Swift?

Swift je moderan programski jezik koji je predstavio Apple, a koristi se za razvoj aplikacija na platformama kao što su iOS, macOS, watchOS i tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift je snažno tipiziran, statički jezik. U svojem dizajnu više naglašava sigurnost te smanjuje mnoge uobičajene programske greške (na primjer null pointere, izlazak iz granica i slično), a istovremeno podržava besprijekornu integraciju s C-om i Objective-C-jem.

U stvarnom razvoju Swift je više zadužen za logički dio aplikacije, kao što su obrada podataka, mrežni zahtjevi i operacije pohrane.

## Što je SwiftUI?

SwiftUI je novi framework za izgradnju sučelja koji je Apple predstavio 2019. godine. SwiftUI koristi deklarativni način programiranja i omogućuje programerima da sažetijim kodom opisuju strukturu sučelja i ponašanje interakcije.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklarativno programiranje znači da programer sustavu samo kaže što želi prikazati, a sustav će automatski osvježiti prikaz prema promjenama u podacima. Više nije potrebno ručno ažurirati stanje sučelja, što uvelike pojednostavljuje složenost razvoja UI-ja.

Jezgra SwiftUI-ja sastoji se od komponenti prikaza (kao što su `Text`、`Image`、`Button`) i spremnika rasporeda (kao što su `VStack`、`HStack`、`ZStack`). Te komponente međusobno djeluju pomoću povezivanja podataka i upravljanja stanjem, što omogućuje sučelju da reagira na promjene podataka i automatski se osvježava.

## Kako Swift i SwiftUI surađuju?

Zadaće Swifta i SwiftUI-ja mogu se sažeti ovako:

**1. Swift: obrađuje logiku i podatke**

Swift se uglavnom koristi za upravljanje podacima, pohranu stanja i izvršavanje logike. Taj kod obično ne utječe izravno na renderiranje sučelja, nego obrađuje podatke i ponašanje.

Na primjer, obrada podataka u Swiftu:

```swift
let markdown = try? String(contentsOf: url)
```

Ovaj kod uključuje deklaracije varijabli, definicije konstanti, funkcije, tok kontrole i slično, ali ne utječe izravno na prikaz sučelja.

**2. SwiftUI: deklarira i renderira sučelje**

SwiftUI se koristi za izgradnju rasporeda i sadržaja korisničkog sučelja te je uglavnom odgovoran za renderiranje sučelja i interakciju s prikazima.

Na primjer, izrada tekstualnog prikaza u SwiftUI-ju:

```swift
Text("SwiftSlim")
```

To su svi dijelovi koda koji služe za izgradnju i kontrolu elemenata sučelja te izravno komuniciraju s korisničkim sučeljem.

### Osnovni primjer

Ispod je jednostavan SwiftUI primjer:

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

U ovom primjeru:

**SwiftUI kod**：`VStack`、`Image`、`Text`、`padding` svi pripadaju SwiftUI-ju i odgovorni su za prikaz i raspored sučelja.

**Swift kod**：komentar `//` na vrhu datoteke i `import SwiftUI` pripadaju strukturi Swift koda; `#Preview` pri dnu je makro za Xcode pregled i ne sudjeluje u stvarnom renderiranju sučelja.

### Napredni primjer

U stvarnim projektima Swift i SwiftUI često se koriste zajedno kako bi svatko obavio ono u čemu je najbolji:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

U ovom primjeru:

**SwiftUI kod**：`@State` je poseban property wrapper u SwiftUI-ju koji služi za deklaraciju promjenjivog stanja prikaza; `Button` i `Text` su SwiftUI komponente prikaza odgovorne za prikaz sučelja i korisničku interakciju.

**Swift kod**：`private var name` i `func printName()` dio su Swift koda, služe za pohranu podataka i izvršavanje logike te ne utječu izravno na renderiranje prikaza.

Kada korisnik klikne gumb, SwiftUI pokreće kod radnje unutar gumba:

```swift
Button("Print") {
    printName()
}
```

U tome je `Button` SwiftUI komponenta, dok je funkcija `printName()` Swift kod koji obrađuje konkretnu logiku.

Ta suradnja omogućuje da se Swift i SwiftUI besprijekorno povežu: Swift je zadužen za obradu podataka i logike, a SwiftUI za prikaz korisničkog sučelja.

## Gdje se obično pišu Swift i SwiftUI kod?

U SwiftUI-ju se sučelje gradi pomoću prikaza koje vraća svojstvo `body`. Zato se sav kod koji opisuje sučelje obično piše unutar `body`.

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

U ovom primjeru `Text` je SwiftUI komponenta prikaza, pa mora biti napisana unutar `body`, jer SwiftUI preko `body` čita i generira sučelje.

Kod koji nije povezan sa sučeljem, kao što su varijable, funkcije ili logika obrade podataka, obično se piše izvan `body`. Na primjer:

```swift
struct ContentView: View {

    // Swift: podaci ili logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: sučelje
    var body: some View {
        Text(name)
    }
}
```

Treba primijetiti da se unutar `body` i dalje može koristiti Swift sintaksa, kao što su `if`、`for` i druge izjave toka kontrole; one samo služe za kontrolu generiranja SwiftUI prikaza:

```
if isLogin {
    Text("Welcome")
}
```

Stoga se u SwiftUI razvoju može jednostavno razumjeti ovako: kod prikaza (`Text`、`Image`、`Button`) obično se piše unutar `body`, a kod podataka i logike (varijable, funkcije itd.) obično izvan `body`.

## Swift datoteke

Kako budemo napredovali s učenjem, susrest ćemo se i s MVVM arhitekturom, u kojoj su slojevi `ViewModel` i `Model` obično sastavljeni od čistog Swift koda i potpuno odvojeni od sloja prikaza (`SwiftUI`).

Na primjer, klasa za upravljanje stanjem aplikacije:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Ili struktura za opis podatkovne strukture:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Zadaća takvih datoteka jest upravljati podacima i trajno ih pohranjivati. One se ne prikazuju izravno u prikazu, pa u potpunosti pripadaju Swiftu.

## Povijesna pozadina

Da bismo razumjeli odnos između Swifta i SwiftUI-ja, potrebno je upoznati i razvoj Appleovih tehnologija. Do 2026. ovaj je tehnološki skup prošao kroz više iteracija.

### Povijest Swifta

Prije pojave Swifta, glavni programski jezik Apple platformi bio je Objective-C, koji je podržavao miješanje s C jezikom. Njegova je sintaksa bila razmjerno opširna i početnicima je predstavljala višu prepreku:

```Obj-c
// Objective-C zapis
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Godine 2014. Apple je na WWDC-u predstavio jezik Swift. Swift ima moderniju sintaksu i veću sigurnost tipova te je postupno zamijenio Objective-C kao glavni jezik razvoja:

```swift
// Swift zapis
let name = "Fang"
print("Hello, \(name)")
```

Međutim, Objective-C time nije nestao iz povijesti. I dalje se široko koristi u mnogim postojećim projektima i na razini donjih sistemskih frameworka. Razumijevanje njegove osnovne sintakse i dalje je vrijedno pri održavanju starih projekata i razumijevanju unutarnjeg rada sustava.

### Povijest SwiftUI-ja

Prije SwiftUI-ja, iOS je koristio **UIKit**, a macOS **AppKit**. Ta dva frameworka koriste “imperativni” način programiranja. Programeri su trebali povlačiti kontrole putem Storyboarda ili ručno pisati kod za upravljanje stanjem prikaza. Koda je bilo mnogo, trošak održavanja bio je velik, a to je bilo posebno izraženo kod složenije logike sučelja.

![storyboard](../../RESOURCE/010_xcode.png)

Godine 2019. Apple je na WWDC-u službeno predstavio SwiftUI. SwiftUI je uveo “deklarativnu” paradigmu programiranja i znatno pojednostavio proces razvoja korisničkog sučelja.

![storyboard](../../RESOURCE/010_xcode1.png)

Važno je primijetiti da SwiftUI nije potpuno neovisna implementacija na najnižoj razini. Na različitim platformama on je u osnovi most i suradnik za UIKit (iOS) ili AppKit (macOS), a njegova izvedba i dalje ovisi o ta dva frameworka.

### Odnos Swifta i UIKit/AppKit-a

Iako je Swift općeniti programski jezik i može raditi na svim Apple platformama, on ne može u potpunosti zamijeniti UIKit ili AppKit. Za neke složene zahtjeve sučelja ili funkcionalnosti koje SwiftUI još nije pokrio, i dalje je potrebno koristiti UIKit ili AppKit.

Na primjer, UIKit je već vrlo zreo u upravljanju složenim kontrolerima prikaza, animacijama i prepoznavanju gesti te ima veliko iskustvo potvrđeno u stvarnim projektima. Iako se mogućnosti SwiftUI-ja u tim područjima stalno poboljšavaju, u nekim rubnim scenarijima i dalje postoje ograničenja.

Zato mnogi programeri u projektima kombiniraju SwiftUI i UIKit (ili AppKit) kako bi u potpunosti iskoristili prednosti obaju pristupa.

Iz te perspektive SwiftUI možemo razumjeti kao višu razinu apstrakcije nad UIKit-om / AppKit-om. Dok učimo SwiftUI, korisno je usput upoznati i osnovne koncepte UIKit-a i AppKit-a, što može pomoći pri održavanju starijih projekata ili implementaciji složenijih funkcionalnosti.

## Sažetak

**Swift**：uglavnom se koristi za pisanje logike, obradu podataka, tok kontrole i slično, bez izravne veze s rasporedom prikaza.

**SwiftUI**：koristi se za deklarativnu izgradnju korisničkog sučelja; kod sadržaja i rasporeda prikaza pripada SwiftUI-ju.

U stvarnom razvoju Swift i SwiftUI obično se koriste zajedno: Swift obrađuje logiku, a SwiftUI sučelje.

Od Objective-C-ja i UIKit-a do Swifta i SwiftUI-ja, Appleovo razvojno okruženje postupno se kreće prema modernijem i sažetijem načinu programiranja, ali UIKit i AppKit u mnogim tradicionalnim projektima i dalje se ne mogu zanemariti.

Razumijevanjem odnosa između Swifta i SwiftUI-ja možemo učinkovitije razvijati iOS/macOS aplikacije, a pri održavanju starijih projekata donositi i razumnije tehničke odluke.
