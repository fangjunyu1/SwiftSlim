# Swift in SwiftUI

Pri učenju razvoja za Applove platforme veliko vodičev Swift in SwiftUI razlaga ločeno, kar začetnikom hitro ustvari občutek razcepljenosti in jih zavede v misel, da gre za dve popolnoma neodvisni tehnologiji.

V resnici sta Swift in SwiftUI tesno povezana celota: Swift je programski jezik, odgovoren za logiko in podatke; SwiftUI pa je ogrodje za uporabniški vmesnik, zgrajeno na Swiftu, odgovorno za izris pogledov in interakcijo.

Ta lekcija vam bo pomagala zgraditi jasen miselni okvir: kaj je Swift, kaj je SwiftUI in kako med seboj sodelujeta v kodi.

## Kaj je Swift?

Swift je sodoben programski jezik, ki ga je razvilo podjetje Apple. Uporablja se za razvoj aplikacij za platforme iOS, macOS, watchOS in tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift je močno tipiziran, statičen jezik, ki je pri zasnovi bolj osredotočen na varnost in zmanjšuje številne pogoste programske napake, kot so ničelni kazalci, izhodi iz meja in podobno. Podpira tudi brezhibno integracijo s C in Objective-C.

V dejanskem razvoju je Swift predvsem odgovoren za logični del aplikacije, kot so obdelava podatkov, omrežne zahteve, shranjevanje podatkov in podobno.

## Kaj je SwiftUI？

SwiftUI je novo ogrodje za gradnjo uporabniških vmesnikov, ki ga je Apple predstavil leta 2019. SwiftUI uporablja deklarativni način programiranja, ki razvijalcem omogoča, da z bolj jedrnato kodo opišejo strukturo vmesnika in vedenje interakcij.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklarativno programiranje pomeni, da mora razvijalec sistemu povedati le, kaj želi prikazati, sistem pa bo glede na spremembe podatkov samodejno osveževal pogled. Zato ni več treba ročno posodabljati stanja vmesnika, kar močno poenostavi razvoj UI.

Jedro SwiftUI sestavljajo komponente pogledov, kot so Text, Image, Button in podobno, ter vsebniki za postavitev, kot so VStack, HStack in ZStack. Te komponente medsebojno delujejo prek vezave podatkov in upravljanja stanja, tako da se vmesnik lahko odziva na spremembe podatkov in se samodejno osvežuje.

## Kako sodelujeta Swift in SwiftUI?

Naloge Swifta in SwiftUI lahko povzamemo v naslednjih točkah:

**1. Swift: obdelava logike in podatkov**

Swift se uporablja predvsem za upravljanje podatkov, shranjevanje stanja in izvajanje logike. Ta koda običajno ne vpliva neposredno na izris vmesnika, temveč je odgovorna za obdelavo podatkov in vedenja.

Na primer, obdelava podatkov v Swiftu:

```swift
let markdown = try? String(contentsOf: url)
```

Ta koda vključuje deklaracije spremenljivk, definicije konstant, funkcije, nadzorni tok in podobno, vendar ne vpliva neposredno na prikaz pogleda.

**2. SwiftUI: deklaracija in izris vmesnika**

SwiftUI se uporablja za gradnjo postavitve in vsebine uporabniškega vmesnika ter je predvsem odgovoren za izris vmesnika in interakcijo s pogledom.

Na primer, ustvarjanje besedilnega pogleda s SwiftUI:

```swift
Text("SwiftSlim")
```

To je koda za gradnjo in nadzor elementov vmesnika, ki neposredno sodeluje z uporabniškim vmesnikom.

### Osnovni primer

Spodaj je preprost primer SwiftUI:

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

V tem primeru:

**Koda SwiftUI**：VStack, Image, Text in padding spadajo v SwiftUI ter so odgovorni za prikaz in postavitev vmesnika.

**Koda Swift**：komentarji // na vrhu datoteke in import SwiftUI spadajo v strukturo kode Swift; #Preview na dnu je makro za predogled v Xcode in ne sodeluje pri dejanskem izrisu vmesnika.

### Naprednejši primer

V resničnih projektih se Swift in SwiftUI pogosto uporabljata skupaj, da vsak opravi naloge, v katerih je najmočnejši:

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

V tem primeru:

**Koda SwiftUI**：@State je lastnostni ovoj, značilen za SwiftUI, ki se uporablja za deklaracijo spremenljivega stanja pogleda; Button in Text sta komponenti pogleda SwiftUI, odgovorni za prikaz vmesnika in interakcijo z uporabnikom.

**Koda Swift**：private var name in func printName() sta koda Swift, uporabljena za shranjevanje podatkov in izvajanje logike, in ne vplivata neposredno na izris pogleda.

Ko uporabnik klikne gumb, SwiftUI sproži operacijsko kodo znotraj gumba:

```swift
Button("Print") {
    printName()
}
```

Pri tem je Button komponenta SwiftUI, funkcija printName(), ki se izvede, pa je koda Swift, odgovorna za konkretno obdelavo logike.

Takšno sodelovanje omogoča, da se Swift in SwiftUI brezhibno povezujeta: Swift skrbi za podatke in logiko, SwiftUI pa za prikaz uporabniškega vmesnika.

## Kje se običajno pišeta koda Swift in SwiftUI?

V SwiftUI se vmesnik gradi s pogledi, ki jih vrača lastnost body. Zato je vsa koda, ki opisuje vmesnik, običajno zapisana v body.

Na primer:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

V tem primeru je Text komponenta pogleda SwiftUI, zato mora biti zapisana v body, saj SwiftUI prek body prebere in ustvari vmesnik.

Koda, ki ni neposredno povezana z vmesnikom, kot so spremenljivke, funkcije ali logika obdelave podatkov, je običajno zapisana zunaj body. Na primer:

```swift
struct ContentView: View {

    // Swift：podatki ali logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：vmesnik
    var body: some View {
        Text(name)
    }
}
```

Treba je poudariti, da lahko tudi v body še vedno uporabljamo sintakso Swift, kot sta if in for. Vendar se ta uporablja le za nadzor ustvarjanja pogledov SwiftUI:

```swift
if isLogin {
    Text("Welcome")
}
```

Zato lahko razvoj v SwiftUI preprosto razumemo takole: koda pogledov, kot so Text, Image in Button, je običajno zapisana v body; koda podatkov in logike, kot so spremenljivke in funkcije, pa je običajno zapisana zunaj body.

## Datoteke Swift

Ko bomo napredovali v učenju, bomo prišli tudi do arhitekture MVVM, kjer sta ViewModel in plast Model običajno sestavljena iz čiste kode Swift in popolnoma ločena od sloja pogledov (SwiftUI).

Na primer razred za upravljanje stanja aplikacije:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Ali struktura za opis podatkovne strukture:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Naloga takšnih datotek je upravljanje in trajno shranjevanje podatkov. Ker se ne prikazujejo neposredno v pogledu, v celoti spadajo v Swift.

## Zgodovinsko ozadje

Za razumevanje odnosa med Swift in SwiftUI je treba poznati tudi razvoj Applove tehnologije. Do leta 2026 je ta tehnološki sklad doživel več ponovitev.

### Zgodovina Swifta

Pred pojavom Swifta je bil glavni programski jezik na Applovih platformah Objective-C, ki je podpiral mešano uporabo z jezikom C. Njegova sintaksa je bila precej obsežna in za začetnike je predstavljala višjo vstopno oviro:

```Obj-c
// Zapis v Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Leta 2014 je Apple na WWDC predstavil jezik Swift. Swift ima sodobnejšo sintakso, večjo tipsko varnost in je postopoma nadomestil Objective-C kot glavni razvojni jezik:

```swift
// Zapis v Swiftu
let name = "Fang"
print("Hello, \(name)")
```

Vendar Objective-C s tem ni izginil iz zgodovine. V številnih obstoječih projektih in nižjenivojskih ogrodjih se še vedno pogosto uporablja. Razumevanje njegove osnovne sintakse je še vedno koristno za vzdrževanje starejših projektov in za razumevanje sistemskih temeljev.

### Zgodovina SwiftUI

Pred pojavom SwiftUI je iOS uporabljal **UIKit**, macOS pa **AppKit**. Ti dve ogrodji uporabljata »imperativni« način programiranja. Razvijalci so morali s Storyboardom vleči kontrolnike ali ročno pisati kodo za nadzor stanja pogledov. Količina kode je bila velika, stroški vzdrževanja pa visoki, zlasti pri bolj zapleteni logiki vmesnika.

![storyboard](../../RESOURCE/010_xcode.png)

Leta 2019 je Apple na WWDC uradno predstavil SwiftUI. SwiftUI je uvedel »deklarativno« programsko paradigmo in močno poenostavil razvoj uporabniških vmesnikov.

![storyboard](../../RESOURCE/010_xcode1.png)

Treba je poudariti, da SwiftUI ni popolnoma samostojna implementacija na najnižji ravni. Na posameznih platformah je v osnovi most in sodelovanje z UIKitom na iOS ali AppKitom na macOS, pri čemer se izvajanje v ozadju še vedno opira na ti dve ogrodji.

### Odnos Swifta do UIKit/AppKit

Čeprav je Swift splošnonamenski programski jezik, ki lahko deluje na vseh Applovih platformah, ne more popolnoma nadomestiti UIKit ali AppKit. Pri nekaterih zahtevnejših potrebah uporabniškega vmesnika ali funkcijah, ki jih SwiftUI še ne pokriva, se je še vedno treba nasloniti na UIKit ali AppKit.

Na primer, UIKit je že zelo zrel pri upravljanju zahtevnih view controllerjev, animacijskih učinkov, prepoznavanja gest in podobno ter ima za sabo veliko preverjene uporabe v produkciji. Čeprav se zmožnosti SwiftUI na teh področjih nenehno izboljšujejo, v nekaterih robnih scenarijih še vedno obstajajo omejitve.

Zato veliko razvijalcev v projektih kombinira SwiftUI z UIKitom ali AppKitom, da v celoti izkoristi prednosti obeh.

S tega vidika lahko SwiftUI razumemo kot višjenivojski ovoj nad UIKit / AppKit. Če se poleg SwiftUI ustrezno seznanimo še z osnovnimi koncepti UIKit in AppKit, nam to pomaga sprejemati razumnejše tehnične odločitve pri vzdrževanju starejših projektov ali pri implementaciji zahtevnejših funkcij.

## Povzetek

**Swift**：uporablja se predvsem za pisanje logike, obdelavo podatkov, nadzorni tok in podobno ter ni neposredno povezan s postavitvijo pogleda.

**SwiftUI**：uporablja se za deklarativno gradnjo uporabniškega vmesnika. Koda za vsebino pogleda in postavitev spada v SwiftUI.

V dejanskem razvoju se Swift in SwiftUI običajno uporabljata skupaj: Swift obdeluje logiko, SwiftUI pa vmesnik.

Od Objective-C in UIKit do Swift in SwiftUI se je Applovo razvojno okolje postopoma usmerjalo v sodobnejši in preprostejši način programiranja, vendar UIKit in AppKit v številnih tradicionalnih projektih še vedno ostajata pomembna.

Ko razumemo odnos med Swift in SwiftUI, lahko učinkoviteje razvijamo za iOS in macOS ter tudi pri vzdrževanju starejših projektov sprejemamo razumnejše tehnične odločitve.
